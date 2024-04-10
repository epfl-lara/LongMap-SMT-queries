; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33692 () Bool)

(assert start!33692)

(declare-fun b_free!6927 () Bool)

(declare-fun b_next!6927 () Bool)

(assert (=> start!33692 (= b_free!6927 (not b_next!6927))))

(declare-fun tp!24285 () Bool)

(declare-fun b_and!14107 () Bool)

(assert (=> start!33692 (= tp!24285 b_and!14107)))

(declare-fun b!334800 () Bool)

(declare-fun res!184639 () Bool)

(declare-fun e!205503 () Bool)

(assert (=> b!334800 (=> (not res!184639) (not e!205503))))

(declare-datatypes ((V!10149 0))(
  ( (V!10150 (val!3484 Int)) )
))
(declare-datatypes ((ValueCell!3096 0))(
  ( (ValueCellFull!3096 (v!5646 V!10149)) (EmptyCell!3096) )
))
(declare-datatypes ((array!17351 0))(
  ( (array!17352 (arr!8206 (Array (_ BitVec 32) ValueCell!3096)) (size!8558 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17351)

(declare-datatypes ((array!17353 0))(
  ( (array!17354 (arr!8207 (Array (_ BitVec 32) (_ BitVec 64))) (size!8559 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17353)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun mask!2385 () (_ BitVec 32))

(assert (=> b!334800 (= res!184639 (and (= (size!8558 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8559 _keys!1895) (size!8558 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334801 () Bool)

(declare-fun e!205501 () Bool)

(declare-fun tp_is_empty!6879 () Bool)

(assert (=> b!334801 (= e!205501 tp_is_empty!6879)))

(declare-fun mapNonEmpty!11715 () Bool)

(declare-fun mapRes!11715 () Bool)

(declare-fun tp!24284 () Bool)

(declare-fun e!205502 () Bool)

(assert (=> mapNonEmpty!11715 (= mapRes!11715 (and tp!24284 e!205502))))

(declare-fun mapRest!11715 () (Array (_ BitVec 32) ValueCell!3096))

(declare-fun mapKey!11715 () (_ BitVec 32))

(declare-fun mapValue!11715 () ValueCell!3096)

(assert (=> mapNonEmpty!11715 (= (arr!8206 _values!1525) (store mapRest!11715 mapKey!11715 mapValue!11715))))

(declare-fun b!334803 () Bool)

(declare-fun e!205499 () Bool)

(assert (=> b!334803 (= e!205503 e!205499)))

(declare-fun res!184636 () Bool)

(assert (=> b!334803 (=> (not res!184636) (not e!205499))))

(declare-datatypes ((tuple2!5054 0))(
  ( (tuple2!5055 (_1!2538 (_ BitVec 64)) (_2!2538 V!10149)) )
))
(declare-datatypes ((List!4679 0))(
  ( (Nil!4676) (Cons!4675 (h!5531 tuple2!5054) (t!9767 List!4679)) )
))
(declare-datatypes ((ListLongMap!3967 0))(
  ( (ListLongMap!3968 (toList!1999 List!4679)) )
))
(declare-fun lt!159599 () ListLongMap!3967)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun contains!2043 (ListLongMap!3967 (_ BitVec 64)) Bool)

(assert (=> b!334803 (= res!184636 (not (contains!2043 lt!159599 k0!1348)))))

(declare-fun zeroValue!1467 () V!10149)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10149)

(declare-fun getCurrentListMap!1527 (array!17353 array!17351 (_ BitVec 32) (_ BitVec 32) V!10149 V!10149 (_ BitVec 32) Int) ListLongMap!3967)

(assert (=> b!334803 (= lt!159599 (getCurrentListMap!1527 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!334804 () Bool)

(declare-fun e!205498 () Bool)

(assert (=> b!334804 (= e!205498 (not true))))

(declare-datatypes ((SeekEntryResult!3170 0))(
  ( (MissingZero!3170 (index!14859 (_ BitVec 32))) (Found!3170 (index!14860 (_ BitVec 32))) (Intermediate!3170 (undefined!3982 Bool) (index!14861 (_ BitVec 32)) (x!33360 (_ BitVec 32))) (Undefined!3170) (MissingVacant!3170 (index!14862 (_ BitVec 32))) )
))
(declare-fun lt!159601 () SeekEntryResult!3170)

(assert (=> b!334804 (contains!2043 lt!159599 (select (arr!8207 _keys!1895) (index!14860 lt!159601)))))

(declare-datatypes ((Unit!10413 0))(
  ( (Unit!10414) )
))
(declare-fun lt!159598 () Unit!10413)

(declare-fun lemmaValidKeyInArrayIsInListMap!153 (array!17353 array!17351 (_ BitVec 32) (_ BitVec 32) V!10149 V!10149 (_ BitVec 32) Int) Unit!10413)

(assert (=> b!334804 (= lt!159598 (lemmaValidKeyInArrayIsInListMap!153 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14860 lt!159601) defaultEntry!1528))))

(declare-fun arrayContainsKey!0 (array!17353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334804 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159600 () Unit!10413)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17353 (_ BitVec 64) (_ BitVec 32)) Unit!10413)

(assert (=> b!334804 (= lt!159600 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14860 lt!159601)))))

(declare-fun b!334805 () Bool)

(declare-fun res!184642 () Bool)

(assert (=> b!334805 (=> (not res!184642) (not e!205498))))

(assert (=> b!334805 (= res!184642 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14860 lt!159601)))))

(declare-fun b!334806 () Bool)

(assert (=> b!334806 (= e!205499 e!205498)))

(declare-fun res!184637 () Bool)

(assert (=> b!334806 (=> (not res!184637) (not e!205498))))

(get-info :version)

(assert (=> b!334806 (= res!184637 (and ((_ is Found!3170) lt!159601) (= (select (arr!8207 _keys!1895) (index!14860 lt!159601)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17353 (_ BitVec 32)) SeekEntryResult!3170)

(assert (=> b!334806 (= lt!159601 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334807 () Bool)

(declare-fun res!184643 () Bool)

(assert (=> b!334807 (=> (not res!184643) (not e!205503))))

(declare-datatypes ((List!4680 0))(
  ( (Nil!4677) (Cons!4676 (h!5532 (_ BitVec 64)) (t!9768 List!4680)) )
))
(declare-fun arrayNoDuplicates!0 (array!17353 (_ BitVec 32) List!4680) Bool)

(assert (=> b!334807 (= res!184643 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4677))))

(declare-fun b!334808 () Bool)

(assert (=> b!334808 (= e!205502 tp_is_empty!6879)))

(declare-fun b!334809 () Bool)

(declare-fun res!184638 () Bool)

(assert (=> b!334809 (=> (not res!184638) (not e!205503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334809 (= res!184638 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!11715 () Bool)

(assert (=> mapIsEmpty!11715 mapRes!11715))

(declare-fun b!334810 () Bool)

(declare-fun res!184640 () Bool)

(assert (=> b!334810 (=> (not res!184640) (not e!205503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17353 (_ BitVec 32)) Bool)

(assert (=> b!334810 (= res!184640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!184641 () Bool)

(assert (=> start!33692 (=> (not res!184641) (not e!205503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33692 (= res!184641 (validMask!0 mask!2385))))

(assert (=> start!33692 e!205503))

(assert (=> start!33692 true))

(assert (=> start!33692 tp_is_empty!6879))

(assert (=> start!33692 tp!24285))

(declare-fun e!205497 () Bool)

(declare-fun array_inv!6100 (array!17351) Bool)

(assert (=> start!33692 (and (array_inv!6100 _values!1525) e!205497)))

(declare-fun array_inv!6101 (array!17353) Bool)

(assert (=> start!33692 (array_inv!6101 _keys!1895)))

(declare-fun b!334802 () Bool)

(assert (=> b!334802 (= e!205497 (and e!205501 mapRes!11715))))

(declare-fun condMapEmpty!11715 () Bool)

(declare-fun mapDefault!11715 () ValueCell!3096)

(assert (=> b!334802 (= condMapEmpty!11715 (= (arr!8206 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3096)) mapDefault!11715)))))

(assert (= (and start!33692 res!184641) b!334800))

(assert (= (and b!334800 res!184639) b!334810))

(assert (= (and b!334810 res!184640) b!334807))

(assert (= (and b!334807 res!184643) b!334809))

(assert (= (and b!334809 res!184638) b!334803))

(assert (= (and b!334803 res!184636) b!334806))

(assert (= (and b!334806 res!184637) b!334805))

(assert (= (and b!334805 res!184642) b!334804))

(assert (= (and b!334802 condMapEmpty!11715) mapIsEmpty!11715))

(assert (= (and b!334802 (not condMapEmpty!11715)) mapNonEmpty!11715))

(assert (= (and mapNonEmpty!11715 ((_ is ValueCellFull!3096) mapValue!11715)) b!334808))

(assert (= (and b!334802 ((_ is ValueCellFull!3096) mapDefault!11715)) b!334801))

(assert (= start!33692 b!334802))

(declare-fun m!338813 () Bool)

(assert (=> start!33692 m!338813))

(declare-fun m!338815 () Bool)

(assert (=> start!33692 m!338815))

(declare-fun m!338817 () Bool)

(assert (=> start!33692 m!338817))

(declare-fun m!338819 () Bool)

(assert (=> b!334805 m!338819))

(declare-fun m!338821 () Bool)

(assert (=> b!334810 m!338821))

(declare-fun m!338823 () Bool)

(assert (=> b!334806 m!338823))

(declare-fun m!338825 () Bool)

(assert (=> b!334806 m!338825))

(declare-fun m!338827 () Bool)

(assert (=> b!334803 m!338827))

(declare-fun m!338829 () Bool)

(assert (=> b!334803 m!338829))

(declare-fun m!338831 () Bool)

(assert (=> mapNonEmpty!11715 m!338831))

(declare-fun m!338833 () Bool)

(assert (=> b!334809 m!338833))

(declare-fun m!338835 () Bool)

(assert (=> b!334804 m!338835))

(declare-fun m!338837 () Bool)

(assert (=> b!334804 m!338837))

(assert (=> b!334804 m!338823))

(declare-fun m!338839 () Bool)

(assert (=> b!334804 m!338839))

(assert (=> b!334804 m!338823))

(declare-fun m!338841 () Bool)

(assert (=> b!334804 m!338841))

(declare-fun m!338843 () Bool)

(assert (=> b!334807 m!338843))

(check-sat (not b!334805) (not b!334807) (not b!334806) (not b!334810) (not b!334803) (not start!33692) (not mapNonEmpty!11715) tp_is_empty!6879 (not b_next!6927) b_and!14107 (not b!334804) (not b!334809))
(check-sat b_and!14107 (not b_next!6927))
