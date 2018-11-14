package kg.todolist;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ListItemRepository extends JpaRepository<ListItem, Integer> {

    @Override
    List<ListItem> findAll();

    @Override
    List<ListItem> findAll(Sort sort);

    @Override
    List<ListItem> findAllById(Iterable<Integer> iterable);

    @Override
    <S extends ListItem> List<S> saveAll(Iterable<S> iterable);

    @Override
    void flush();

    @Override
    <S extends ListItem> S saveAndFlush(S s);

    @Override
    void deleteInBatch(Iterable<ListItem> iterable);

    @Override
    void deleteAllInBatch();

    @Override
    ListItem getOne(Integer integer);

    @Override
    <S extends ListItem> List<S> findAll(Example<S> example);

    @Override
    <S extends ListItem> List<S> findAll(Example<S> example, Sort sort);
}
