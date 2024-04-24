; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33960 () Bool)

(assert start!33960)

(declare-fun b_free!7105 () Bool)

(declare-fun b_next!7105 () Bool)

(assert (=> start!33960 (= b_free!7105 (not b_next!7105))))

(declare-fun tp!24834 () Bool)

(declare-fun b_and!14309 () Bool)

(assert (=> start!33960 (= tp!24834 b_and!14309)))

(declare-fun b!338315 () Bool)

(declare-fun e!207584 () Bool)

(declare-fun e!207583 () Bool)

(assert (=> b!338315 (= e!207584 e!207583)))

(declare-fun res!186907 () Bool)

(assert (=> b!338315 (=> (not res!186907) (not e!207583))))

(declare-datatypes ((SeekEntryResult!3193 0))(
  ( (MissingZero!3193 (index!14951 (_ BitVec 32))) (Found!3193 (index!14952 (_ BitVec 32))) (Intermediate!3193 (undefined!4005 Bool) (index!14953 (_ BitVec 32)) (x!33670 (_ BitVec 32))) (Undefined!3193) (MissingVacant!3193 (index!14954 (_ BitVec 32))) )
))
(declare-fun lt!160805 () SeekEntryResult!3193)

(get-info :version)

(assert (=> b!338315 (= res!186907 (and (not ((_ is Found!3193) lt!160805)) ((_ is MissingZero!3193) lt!160805)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17694 0))(
  ( (array!17695 (arr!8372 (Array (_ BitVec 32) (_ BitVec 64))) (size!8724 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17694)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17694 (_ BitVec 32)) SeekEntryResult!3193)

(assert (=> b!338315 (= lt!160805 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338316 () Bool)

(assert (=> b!338316 (= e!207583 false)))

(declare-datatypes ((Unit!10472 0))(
  ( (Unit!10473) )
))
(declare-fun lt!160806 () Unit!10472)

(declare-fun e!207581 () Unit!10472)

(assert (=> b!338316 (= lt!160806 e!207581)))

(declare-fun c!52394 () Bool)

(declare-fun arrayContainsKey!0 (array!17694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338316 (= c!52394 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!338317 () Bool)

(declare-fun res!186903 () Bool)

(assert (=> b!338317 (=> (not res!186903) (not e!207584))))

(declare-datatypes ((V!10387 0))(
  ( (V!10388 (val!3573 Int)) )
))
(declare-datatypes ((ValueCell!3185 0))(
  ( (ValueCellFull!3185 (v!5741 V!10387)) (EmptyCell!3185) )
))
(declare-datatypes ((array!17696 0))(
  ( (array!17697 (arr!8373 (Array (_ BitVec 32) ValueCell!3185)) (size!8725 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17696)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!338317 (= res!186903 (and (= (size!8725 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8724 _keys!1895) (size!8725 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338318 () Bool)

(declare-fun res!186906 () Bool)

(assert (=> b!338318 (=> (not res!186906) (not e!207584))))

(declare-datatypes ((List!4711 0))(
  ( (Nil!4708) (Cons!4707 (h!5563 (_ BitVec 64)) (t!9801 List!4711)) )
))
(declare-fun arrayNoDuplicates!0 (array!17694 (_ BitVec 32) List!4711) Bool)

(assert (=> b!338318 (= res!186906 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4708))))

(declare-fun mapNonEmpty!11997 () Bool)

(declare-fun mapRes!11997 () Bool)

(declare-fun tp!24833 () Bool)

(declare-fun e!207582 () Bool)

(assert (=> mapNonEmpty!11997 (= mapRes!11997 (and tp!24833 e!207582))))

(declare-fun mapRest!11997 () (Array (_ BitVec 32) ValueCell!3185))

(declare-fun mapKey!11997 () (_ BitVec 32))

(declare-fun mapValue!11997 () ValueCell!3185)

(assert (=> mapNonEmpty!11997 (= (arr!8373 _values!1525) (store mapRest!11997 mapKey!11997 mapValue!11997))))

(declare-fun b!338319 () Bool)

(declare-fun Unit!10474 () Unit!10472)

(assert (=> b!338319 (= e!207581 Unit!10474)))

(declare-fun zeroValue!1467 () V!10387)

(declare-fun lt!160807 () Unit!10472)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10387)

(declare-fun lemmaArrayContainsKeyThenInListMap!279 (array!17694 array!17696 (_ BitVec 32) (_ BitVec 32) V!10387 V!10387 (_ BitVec 64) (_ BitVec 32) Int) Unit!10472)

(declare-fun arrayScanForKey!0 (array!17694 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338319 (= lt!160807 (lemmaArrayContainsKeyThenInListMap!279 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338319 false))

(declare-fun b!338320 () Bool)

(declare-fun res!186905 () Bool)

(assert (=> b!338320 (=> (not res!186905) (not e!207584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338320 (= res!186905 (validKeyInArray!0 k0!1348))))

(declare-fun b!338321 () Bool)

(declare-fun res!186902 () Bool)

(assert (=> b!338321 (=> (not res!186902) (not e!207584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17694 (_ BitVec 32)) Bool)

(assert (=> b!338321 (= res!186902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11997 () Bool)

(assert (=> mapIsEmpty!11997 mapRes!11997))

(declare-fun b!338322 () Bool)

(declare-fun e!207587 () Bool)

(declare-fun tp_is_empty!7057 () Bool)

(assert (=> b!338322 (= e!207587 tp_is_empty!7057)))

(declare-fun b!338323 () Bool)

(declare-fun Unit!10475 () Unit!10472)

(assert (=> b!338323 (= e!207581 Unit!10475)))

(declare-fun b!338325 () Bool)

(assert (=> b!338325 (= e!207582 tp_is_empty!7057)))

(declare-fun b!338326 () Bool)

(declare-fun e!207586 () Bool)

(assert (=> b!338326 (= e!207586 (and e!207587 mapRes!11997))))

(declare-fun condMapEmpty!11997 () Bool)

(declare-fun mapDefault!11997 () ValueCell!3185)

(assert (=> b!338326 (= condMapEmpty!11997 (= (arr!8373 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3185)) mapDefault!11997)))))

(declare-fun b!338324 () Bool)

(declare-fun res!186904 () Bool)

(assert (=> b!338324 (=> (not res!186904) (not e!207584))))

(declare-datatypes ((tuple2!5102 0))(
  ( (tuple2!5103 (_1!2562 (_ BitVec 64)) (_2!2562 V!10387)) )
))
(declare-datatypes ((List!4712 0))(
  ( (Nil!4709) (Cons!4708 (h!5564 tuple2!5102) (t!9802 List!4712)) )
))
(declare-datatypes ((ListLongMap!4017 0))(
  ( (ListLongMap!4018 (toList!2024 List!4712)) )
))
(declare-fun contains!2092 (ListLongMap!4017 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1553 (array!17694 array!17696 (_ BitVec 32) (_ BitVec 32) V!10387 V!10387 (_ BitVec 32) Int) ListLongMap!4017)

(assert (=> b!338324 (= res!186904 (not (contains!2092 (getCurrentListMap!1553 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!186908 () Bool)

(assert (=> start!33960 (=> (not res!186908) (not e!207584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33960 (= res!186908 (validMask!0 mask!2385))))

(assert (=> start!33960 e!207584))

(assert (=> start!33960 true))

(assert (=> start!33960 tp_is_empty!7057))

(assert (=> start!33960 tp!24834))

(declare-fun array_inv!6218 (array!17696) Bool)

(assert (=> start!33960 (and (array_inv!6218 _values!1525) e!207586)))

(declare-fun array_inv!6219 (array!17694) Bool)

(assert (=> start!33960 (array_inv!6219 _keys!1895)))

(assert (= (and start!33960 res!186908) b!338317))

(assert (= (and b!338317 res!186903) b!338321))

(assert (= (and b!338321 res!186902) b!338318))

(assert (= (and b!338318 res!186906) b!338320))

(assert (= (and b!338320 res!186905) b!338324))

(assert (= (and b!338324 res!186904) b!338315))

(assert (= (and b!338315 res!186907) b!338316))

(assert (= (and b!338316 c!52394) b!338319))

(assert (= (and b!338316 (not c!52394)) b!338323))

(assert (= (and b!338326 condMapEmpty!11997) mapIsEmpty!11997))

(assert (= (and b!338326 (not condMapEmpty!11997)) mapNonEmpty!11997))

(assert (= (and mapNonEmpty!11997 ((_ is ValueCellFull!3185) mapValue!11997)) b!338325))

(assert (= (and b!338326 ((_ is ValueCellFull!3185) mapDefault!11997)) b!338322))

(assert (= start!33960 b!338326))

(declare-fun m!341863 () Bool)

(assert (=> b!338324 m!341863))

(assert (=> b!338324 m!341863))

(declare-fun m!341865 () Bool)

(assert (=> b!338324 m!341865))

(declare-fun m!341867 () Bool)

(assert (=> b!338321 m!341867))

(declare-fun m!341869 () Bool)

(assert (=> b!338320 m!341869))

(declare-fun m!341871 () Bool)

(assert (=> b!338316 m!341871))

(declare-fun m!341873 () Bool)

(assert (=> b!338315 m!341873))

(declare-fun m!341875 () Bool)

(assert (=> b!338319 m!341875))

(assert (=> b!338319 m!341875))

(declare-fun m!341877 () Bool)

(assert (=> b!338319 m!341877))

(declare-fun m!341879 () Bool)

(assert (=> start!33960 m!341879))

(declare-fun m!341881 () Bool)

(assert (=> start!33960 m!341881))

(declare-fun m!341883 () Bool)

(assert (=> start!33960 m!341883))

(declare-fun m!341885 () Bool)

(assert (=> mapNonEmpty!11997 m!341885))

(declare-fun m!341887 () Bool)

(assert (=> b!338318 m!341887))

(check-sat (not b!338315) (not b!338320) (not start!33960) (not b!338324) tp_is_empty!7057 (not b!338318) (not b!338321) (not mapNonEmpty!11997) (not b!338316) (not b!338319) b_and!14309 (not b_next!7105))
(check-sat b_and!14309 (not b_next!7105))
