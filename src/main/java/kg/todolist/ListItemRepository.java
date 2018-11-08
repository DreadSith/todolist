package kg.todolist;

import org.springframework.data.repository.CrudRepository;

public interface ListItemRepository extends CrudRepository<ListItem, Integer> {

    @Override
    <S extends ListItem> S save(S s);

    @Override
    <S extends ListItem> Iterable<S> saveAll(Iterable<S> iterable);

/* I cri, cuz you can only use this in Java 1.8
    @Override
    Optional<ListItem> findById(Integer integer);
*/

    @Override
    boolean existsById(Integer integer);

    @Override
    Iterable<ListItem> findAll();

    @Override
    Iterable<ListItem> findAllById(Iterable<Integer> iterable);

    @Override
    long count();

    @Override
    void deleteById(Integer integer);

    @Override
    void delete(ListItem listItem);

    @Override
    void deleteAll(Iterable<? extends ListItem> iterable);

    @Override
    void deleteAll();
}
