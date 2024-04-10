; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33384 () Bool)

(assert start!33384)

(declare-fun b!331649 () Bool)

(declare-fun e!203510 () Bool)

(declare-fun e!203512 () Bool)

(declare-fun mapRes!11385 () Bool)

(assert (=> b!331649 (= e!203510 (and e!203512 mapRes!11385))))

(declare-fun condMapEmpty!11385 () Bool)

(declare-datatypes ((V!9877 0))(
  ( (V!9878 (val!3382 Int)) )
))
(declare-datatypes ((ValueCell!2994 0))(
  ( (ValueCellFull!2994 (v!5540 V!9877)) (EmptyCell!2994) )
))
(declare-datatypes ((array!16943 0))(
  ( (array!16944 (arr!8010 (Array (_ BitVec 32) ValueCell!2994)) (size!8362 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16943)

(declare-fun mapDefault!11385 () ValueCell!2994)

(assert (=> b!331649 (= condMapEmpty!11385 (= (arr!8010 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!2994)) mapDefault!11385)))))

(declare-fun res!182727 () Bool)

(declare-fun e!203508 () Bool)

(assert (=> start!33384 (=> (not res!182727) (not e!203508))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33384 (= res!182727 (validMask!0 mask!2385))))

(assert (=> start!33384 e!203508))

(assert (=> start!33384 true))

(declare-fun array_inv!5968 (array!16943) Bool)

(assert (=> start!33384 (and (array_inv!5968 _values!1525) e!203510)))

(declare-datatypes ((array!16945 0))(
  ( (array!16946 (arr!8011 (Array (_ BitVec 32) (_ BitVec 64))) (size!8363 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16945)

(declare-fun array_inv!5969 (array!16945) Bool)

(assert (=> start!33384 (array_inv!5969 _keys!1895)))

(declare-fun mapNonEmpty!11385 () Bool)

(declare-fun tp!23760 () Bool)

(declare-fun e!203511 () Bool)

(assert (=> mapNonEmpty!11385 (= mapRes!11385 (and tp!23760 e!203511))))

(declare-fun mapRest!11385 () (Array (_ BitVec 32) ValueCell!2994))

(declare-fun mapKey!11385 () (_ BitVec 32))

(declare-fun mapValue!11385 () ValueCell!2994)

(assert (=> mapNonEmpty!11385 (= (arr!8010 _values!1525) (store mapRest!11385 mapKey!11385 mapValue!11385))))

(declare-fun b!331650 () Bool)

(declare-fun res!182726 () Bool)

(assert (=> b!331650 (=> (not res!182726) (not e!203508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16945 (_ BitVec 32)) Bool)

(assert (=> b!331650 (= res!182726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331651 () Bool)

(declare-fun res!182725 () Bool)

(assert (=> b!331651 (=> (not res!182725) (not e!203508))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331651 (= res!182725 (and (= (size!8362 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8363 _keys!1895) (size!8362 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11385 () Bool)

(assert (=> mapIsEmpty!11385 mapRes!11385))

(declare-fun b!331652 () Bool)

(declare-fun tp_is_empty!6675 () Bool)

(assert (=> b!331652 (= e!203511 tp_is_empty!6675)))

(declare-fun b!331653 () Bool)

(assert (=> b!331653 (= e!203508 (bvsgt #b00000000000000000000000000000000 (size!8363 _keys!1895)))))

(declare-fun b!331654 () Bool)

(assert (=> b!331654 (= e!203512 tp_is_empty!6675)))

(assert (= (and start!33384 res!182727) b!331651))

(assert (= (and b!331651 res!182725) b!331650))

(assert (= (and b!331650 res!182726) b!331653))

(assert (= (and b!331649 condMapEmpty!11385) mapIsEmpty!11385))

(assert (= (and b!331649 (not condMapEmpty!11385)) mapNonEmpty!11385))

(get-info :version)

(assert (= (and mapNonEmpty!11385 ((_ is ValueCellFull!2994) mapValue!11385)) b!331652))

(assert (= (and b!331649 ((_ is ValueCellFull!2994) mapDefault!11385)) b!331654))

(assert (= start!33384 b!331649))

(declare-fun m!336449 () Bool)

(assert (=> start!33384 m!336449))

(declare-fun m!336451 () Bool)

(assert (=> start!33384 m!336451))

(declare-fun m!336453 () Bool)

(assert (=> start!33384 m!336453))

(declare-fun m!336455 () Bool)

(assert (=> mapNonEmpty!11385 m!336455))

(declare-fun m!336457 () Bool)

(assert (=> b!331650 m!336457))

(check-sat (not start!33384) (not b!331650) (not mapNonEmpty!11385) tp_is_empty!6675)
(check-sat)
(get-model)

(declare-fun d!70457 () Bool)

(assert (=> d!70457 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33384 d!70457))

(declare-fun d!70459 () Bool)

(assert (=> d!70459 (= (array_inv!5968 _values!1525) (bvsge (size!8362 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33384 d!70459))

(declare-fun d!70461 () Bool)

(assert (=> d!70461 (= (array_inv!5969 _keys!1895) (bvsge (size!8363 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33384 d!70461))

(declare-fun b!331681 () Bool)

(declare-fun e!203534 () Bool)

(declare-fun call!26200 () Bool)

(assert (=> b!331681 (= e!203534 call!26200)))

(declare-fun b!331682 () Bool)

(declare-fun e!203536 () Bool)

(assert (=> b!331682 (= e!203534 e!203536)))

(declare-fun lt!158907 () (_ BitVec 64))

(assert (=> b!331682 (= lt!158907 (select (arr!8011 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10351 0))(
  ( (Unit!10352) )
))
(declare-fun lt!158906 () Unit!10351)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16945 (_ BitVec 64) (_ BitVec 32)) Unit!10351)

(assert (=> b!331682 (= lt!158906 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!158907 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!16945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331682 (arrayContainsKey!0 _keys!1895 lt!158907 #b00000000000000000000000000000000)))

(declare-fun lt!158905 () Unit!10351)

(assert (=> b!331682 (= lt!158905 lt!158906)))

(declare-fun res!182742 () Bool)

(declare-datatypes ((SeekEntryResult!3128 0))(
  ( (MissingZero!3128 (index!14691 (_ BitVec 32))) (Found!3128 (index!14692 (_ BitVec 32))) (Intermediate!3128 (undefined!3940 Bool) (index!14693 (_ BitVec 32)) (x!33008 (_ BitVec 32))) (Undefined!3128) (MissingVacant!3128 (index!14694 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16945 (_ BitVec 32)) SeekEntryResult!3128)

(assert (=> b!331682 (= res!182742 (= (seekEntryOrOpen!0 (select (arr!8011 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3128 #b00000000000000000000000000000000)))))

(assert (=> b!331682 (=> (not res!182742) (not e!203536))))

(declare-fun b!331683 () Bool)

(declare-fun e!203535 () Bool)

(assert (=> b!331683 (= e!203535 e!203534)))

(declare-fun c!52071 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331683 (= c!52071 (validKeyInArray!0 (select (arr!8011 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!331684 () Bool)

(assert (=> b!331684 (= e!203536 call!26200)))

(declare-fun bm!26197 () Bool)

(assert (=> bm!26197 (= call!26200 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!70463 () Bool)

(declare-fun res!182741 () Bool)

(assert (=> d!70463 (=> res!182741 e!203535)))

(assert (=> d!70463 (= res!182741 (bvsge #b00000000000000000000000000000000 (size!8363 _keys!1895)))))

(assert (=> d!70463 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!203535)))

(assert (= (and d!70463 (not res!182741)) b!331683))

(assert (= (and b!331683 c!52071) b!331682))

(assert (= (and b!331683 (not c!52071)) b!331681))

(assert (= (and b!331682 res!182742) b!331684))

(assert (= (or b!331684 b!331681) bm!26197))

(declare-fun m!336469 () Bool)

(assert (=> b!331682 m!336469))

(declare-fun m!336471 () Bool)

(assert (=> b!331682 m!336471))

(declare-fun m!336473 () Bool)

(assert (=> b!331682 m!336473))

(assert (=> b!331682 m!336469))

(declare-fun m!336475 () Bool)

(assert (=> b!331682 m!336475))

(assert (=> b!331683 m!336469))

(assert (=> b!331683 m!336469))

(declare-fun m!336477 () Bool)

(assert (=> b!331683 m!336477))

(declare-fun m!336479 () Bool)

(assert (=> bm!26197 m!336479))

(assert (=> b!331650 d!70463))

(declare-fun mapIsEmpty!11391 () Bool)

(declare-fun mapRes!11391 () Bool)

(assert (=> mapIsEmpty!11391 mapRes!11391))

(declare-fun condMapEmpty!11391 () Bool)

(declare-fun mapDefault!11391 () ValueCell!2994)

(assert (=> mapNonEmpty!11385 (= condMapEmpty!11391 (= mapRest!11385 ((as const (Array (_ BitVec 32) ValueCell!2994)) mapDefault!11391)))))

(declare-fun e!203542 () Bool)

(assert (=> mapNonEmpty!11385 (= tp!23760 (and e!203542 mapRes!11391))))

(declare-fun b!331692 () Bool)

(assert (=> b!331692 (= e!203542 tp_is_empty!6675)))

(declare-fun mapNonEmpty!11391 () Bool)

(declare-fun tp!23766 () Bool)

(declare-fun e!203541 () Bool)

(assert (=> mapNonEmpty!11391 (= mapRes!11391 (and tp!23766 e!203541))))

(declare-fun mapRest!11391 () (Array (_ BitVec 32) ValueCell!2994))

(declare-fun mapValue!11391 () ValueCell!2994)

(declare-fun mapKey!11391 () (_ BitVec 32))

(assert (=> mapNonEmpty!11391 (= mapRest!11385 (store mapRest!11391 mapKey!11391 mapValue!11391))))

(declare-fun b!331691 () Bool)

(assert (=> b!331691 (= e!203541 tp_is_empty!6675)))

(assert (= (and mapNonEmpty!11385 condMapEmpty!11391) mapIsEmpty!11391))

(assert (= (and mapNonEmpty!11385 (not condMapEmpty!11391)) mapNonEmpty!11391))

(assert (= (and mapNonEmpty!11391 ((_ is ValueCellFull!2994) mapValue!11391)) b!331691))

(assert (= (and mapNonEmpty!11385 ((_ is ValueCellFull!2994) mapDefault!11391)) b!331692))

(declare-fun m!336481 () Bool)

(assert (=> mapNonEmpty!11391 m!336481))

(check-sat (not mapNonEmpty!11391) (not bm!26197) tp_is_empty!6675 (not b!331683) (not b!331682))
(check-sat)
