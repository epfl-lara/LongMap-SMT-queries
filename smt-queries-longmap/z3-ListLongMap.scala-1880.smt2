; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33700 () Bool)

(assert start!33700)

(declare-fun b_free!6949 () Bool)

(declare-fun b_next!6949 () Bool)

(assert (=> start!33700 (= b_free!6949 (not b_next!6949))))

(declare-fun tp!24351 () Bool)

(declare-fun b_and!14103 () Bool)

(assert (=> start!33700 (= tp!24351 b_and!14103)))

(declare-fun mapIsEmpty!11748 () Bool)

(declare-fun mapRes!11748 () Bool)

(assert (=> mapIsEmpty!11748 mapRes!11748))

(declare-fun b!334888 () Bool)

(declare-fun res!184777 () Bool)

(declare-fun e!205554 () Bool)

(assert (=> b!334888 (=> (not res!184777) (not e!205554))))

(declare-datatypes ((SeekEntryResult!3179 0))(
  ( (MissingZero!3179 (index!14895 (_ BitVec 32))) (Found!3179 (index!14896 (_ BitVec 32))) (Intermediate!3179 (undefined!3991 Bool) (index!14897 (_ BitVec 32)) (x!33396 (_ BitVec 32))) (Undefined!3179) (MissingVacant!3179 (index!14898 (_ BitVec 32))) )
))
(declare-fun lt!159497 () SeekEntryResult!3179)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17375 0))(
  ( (array!17376 (arr!8218 (Array (_ BitVec 32) (_ BitVec 64))) (size!8571 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17375)

(declare-fun arrayContainsKey!0 (array!17375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334888 (= res!184777 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14896 lt!159497)))))

(declare-fun b!334889 () Bool)

(declare-fun e!205557 () Bool)

(declare-fun tp_is_empty!6901 () Bool)

(assert (=> b!334889 (= e!205557 tp_is_empty!6901)))

(declare-fun b!334890 () Bool)

(declare-fun e!205558 () Bool)

(assert (=> b!334890 (= e!205558 (and e!205557 mapRes!11748))))

(declare-fun condMapEmpty!11748 () Bool)

(declare-datatypes ((V!10179 0))(
  ( (V!10180 (val!3495 Int)) )
))
(declare-datatypes ((ValueCell!3107 0))(
  ( (ValueCellFull!3107 (v!5651 V!10179)) (EmptyCell!3107) )
))
(declare-datatypes ((array!17377 0))(
  ( (array!17378 (arr!8219 (Array (_ BitVec 32) ValueCell!3107)) (size!8572 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17377)

(declare-fun mapDefault!11748 () ValueCell!3107)

(assert (=> b!334890 (= condMapEmpty!11748 (= (arr!8219 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3107)) mapDefault!11748)))))

(declare-fun b!334891 () Bool)

(declare-fun res!184772 () Bool)

(declare-fun e!205556 () Bool)

(assert (=> b!334891 (=> (not res!184772) (not e!205556))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17375 (_ BitVec 32)) Bool)

(assert (=> b!334891 (= res!184772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!184773 () Bool)

(assert (=> start!33700 (=> (not res!184773) (not e!205556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33700 (= res!184773 (validMask!0 mask!2385))))

(assert (=> start!33700 e!205556))

(assert (=> start!33700 true))

(assert (=> start!33700 tp_is_empty!6901))

(assert (=> start!33700 tp!24351))

(declare-fun array_inv!6128 (array!17377) Bool)

(assert (=> start!33700 (and (array_inv!6128 _values!1525) e!205558)))

(declare-fun array_inv!6129 (array!17375) Bool)

(assert (=> start!33700 (array_inv!6129 _keys!1895)))

(declare-fun b!334892 () Bool)

(declare-fun e!205552 () Bool)

(assert (=> b!334892 (= e!205556 e!205552)))

(declare-fun res!184771 () Bool)

(assert (=> b!334892 (=> (not res!184771) (not e!205552))))

(declare-datatypes ((tuple2!5022 0))(
  ( (tuple2!5023 (_1!2522 (_ BitVec 64)) (_2!2522 V!10179)) )
))
(declare-datatypes ((List!4662 0))(
  ( (Nil!4659) (Cons!4658 (h!5514 tuple2!5022) (t!9741 List!4662)) )
))
(declare-datatypes ((ListLongMap!3925 0))(
  ( (ListLongMap!3926 (toList!1978 List!4662)) )
))
(declare-fun lt!159498 () ListLongMap!3925)

(declare-fun contains!2033 (ListLongMap!3925 (_ BitVec 64)) Bool)

(assert (=> b!334892 (= res!184771 (not (contains!2033 lt!159498 k0!1348)))))

(declare-fun zeroValue!1467 () V!10179)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10179)

(declare-fun getCurrentListMap!1487 (array!17375 array!17377 (_ BitVec 32) (_ BitVec 32) V!10179 V!10179 (_ BitVec 32) Int) ListLongMap!3925)

(assert (=> b!334892 (= lt!159498 (getCurrentListMap!1487 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!334893 () Bool)

(declare-fun res!184774 () Bool)

(assert (=> b!334893 (=> (not res!184774) (not e!205556))))

(assert (=> b!334893 (= res!184774 (and (= (size!8572 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8571 _keys!1895) (size!8572 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334894 () Bool)

(declare-fun res!184775 () Bool)

(assert (=> b!334894 (=> (not res!184775) (not e!205556))))

(declare-datatypes ((List!4663 0))(
  ( (Nil!4660) (Cons!4659 (h!5515 (_ BitVec 64)) (t!9742 List!4663)) )
))
(declare-fun arrayNoDuplicates!0 (array!17375 (_ BitVec 32) List!4663) Bool)

(assert (=> b!334894 (= res!184775 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4660))))

(declare-fun b!334895 () Bool)

(declare-fun e!205553 () Bool)

(assert (=> b!334895 (= e!205553 tp_is_empty!6901)))

(declare-fun b!334896 () Bool)

(assert (=> b!334896 (= e!205552 e!205554)))

(declare-fun res!184776 () Bool)

(assert (=> b!334896 (=> (not res!184776) (not e!205554))))

(get-info :version)

(assert (=> b!334896 (= res!184776 (and ((_ is Found!3179) lt!159497) (= (select (arr!8218 _keys!1895) (index!14896 lt!159497)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17375 (_ BitVec 32)) SeekEntryResult!3179)

(assert (=> b!334896 (= lt!159497 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334897 () Bool)

(declare-fun res!184778 () Bool)

(assert (=> b!334897 (=> (not res!184778) (not e!205556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334897 (= res!184778 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!11748 () Bool)

(declare-fun tp!24350 () Bool)

(assert (=> mapNonEmpty!11748 (= mapRes!11748 (and tp!24350 e!205553))))

(declare-fun mapKey!11748 () (_ BitVec 32))

(declare-fun mapValue!11748 () ValueCell!3107)

(declare-fun mapRest!11748 () (Array (_ BitVec 32) ValueCell!3107))

(assert (=> mapNonEmpty!11748 (= (arr!8219 _values!1525) (store mapRest!11748 mapKey!11748 mapValue!11748))))

(declare-fun b!334898 () Bool)

(assert (=> b!334898 (= e!205554 (not true))))

(assert (=> b!334898 (contains!2033 lt!159498 (select (arr!8218 _keys!1895) (index!14896 lt!159497)))))

(declare-datatypes ((Unit!10406 0))(
  ( (Unit!10407) )
))
(declare-fun lt!159495 () Unit!10406)

(declare-fun lemmaValidKeyInArrayIsInListMap!160 (array!17375 array!17377 (_ BitVec 32) (_ BitVec 32) V!10179 V!10179 (_ BitVec 32) Int) Unit!10406)

(assert (=> b!334898 (= lt!159495 (lemmaValidKeyInArrayIsInListMap!160 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14896 lt!159497) defaultEntry!1528))))

(assert (=> b!334898 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159496 () Unit!10406)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17375 (_ BitVec 64) (_ BitVec 32)) Unit!10406)

(assert (=> b!334898 (= lt!159496 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14896 lt!159497)))))

(assert (= (and start!33700 res!184773) b!334893))

(assert (= (and b!334893 res!184774) b!334891))

(assert (= (and b!334891 res!184772) b!334894))

(assert (= (and b!334894 res!184775) b!334897))

(assert (= (and b!334897 res!184778) b!334892))

(assert (= (and b!334892 res!184771) b!334896))

(assert (= (and b!334896 res!184776) b!334888))

(assert (= (and b!334888 res!184777) b!334898))

(assert (= (and b!334890 condMapEmpty!11748) mapIsEmpty!11748))

(assert (= (and b!334890 (not condMapEmpty!11748)) mapNonEmpty!11748))

(assert (= (and mapNonEmpty!11748 ((_ is ValueCellFull!3107) mapValue!11748)) b!334895))

(assert (= (and b!334890 ((_ is ValueCellFull!3107) mapDefault!11748)) b!334889))

(assert (= start!33700 b!334890))

(declare-fun m!338435 () Bool)

(assert (=> start!33700 m!338435))

(declare-fun m!338437 () Bool)

(assert (=> start!33700 m!338437))

(declare-fun m!338439 () Bool)

(assert (=> start!33700 m!338439))

(declare-fun m!338441 () Bool)

(assert (=> b!334892 m!338441))

(declare-fun m!338443 () Bool)

(assert (=> b!334892 m!338443))

(declare-fun m!338445 () Bool)

(assert (=> mapNonEmpty!11748 m!338445))

(declare-fun m!338447 () Bool)

(assert (=> b!334888 m!338447))

(declare-fun m!338449 () Bool)

(assert (=> b!334896 m!338449))

(declare-fun m!338451 () Bool)

(assert (=> b!334896 m!338451))

(declare-fun m!338453 () Bool)

(assert (=> b!334891 m!338453))

(declare-fun m!338455 () Bool)

(assert (=> b!334898 m!338455))

(declare-fun m!338457 () Bool)

(assert (=> b!334898 m!338457))

(assert (=> b!334898 m!338449))

(declare-fun m!338459 () Bool)

(assert (=> b!334898 m!338459))

(assert (=> b!334898 m!338449))

(declare-fun m!338461 () Bool)

(assert (=> b!334898 m!338461))

(declare-fun m!338463 () Bool)

(assert (=> b!334897 m!338463))

(declare-fun m!338465 () Bool)

(assert (=> b!334894 m!338465))

(check-sat (not b!334892) (not b!334896) (not start!33700) (not b_next!6949) (not b!334894) b_and!14103 (not b!334891) tp_is_empty!6901 (not b!334898) (not mapNonEmpty!11748) (not b!334897) (not b!334888))
(check-sat b_and!14103 (not b_next!6949))
