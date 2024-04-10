; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33988 () Bool)

(assert start!33988)

(declare-fun b_free!7119 () Bool)

(declare-fun b_next!7119 () Bool)

(assert (=> start!33988 (= b_free!7119 (not b_next!7119))))

(declare-fun tp!24875 () Bool)

(declare-fun b_and!14309 () Bool)

(assert (=> start!33988 (= tp!24875 b_and!14309)))

(declare-fun b!338620 () Bool)

(declare-fun res!187058 () Bool)

(declare-fun e!207763 () Bool)

(assert (=> b!338620 (=> (not res!187058) (not e!207763))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!17737 0))(
  ( (array!17738 (arr!8394 (Array (_ BitVec 32) (_ BitVec 64))) (size!8746 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17737)

(declare-datatypes ((V!10405 0))(
  ( (V!10406 (val!3580 Int)) )
))
(declare-datatypes ((ValueCell!3192 0))(
  ( (ValueCellFull!3192 (v!5747 V!10405)) (EmptyCell!3192) )
))
(declare-datatypes ((array!17739 0))(
  ( (array!17740 (arr!8395 (Array (_ BitVec 32) ValueCell!3192)) (size!8747 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17739)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!338620 (= res!187058 (and (= (size!8747 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8746 _keys!1895) (size!8747 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338621 () Bool)

(declare-fun res!187054 () Bool)

(assert (=> b!338621 (=> (not res!187054) (not e!207763))))

(declare-datatypes ((List!4815 0))(
  ( (Nil!4812) (Cons!4811 (h!5667 (_ BitVec 64)) (t!9913 List!4815)) )
))
(declare-fun arrayNoDuplicates!0 (array!17737 (_ BitVec 32) List!4815) Bool)

(assert (=> b!338621 (= res!187054 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4812))))

(declare-fun b!338622 () Bool)

(declare-fun res!187053 () Bool)

(assert (=> b!338622 (=> (not res!187053) (not e!207763))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338622 (= res!187053 (validKeyInArray!0 k0!1348))))

(declare-fun b!338623 () Bool)

(declare-fun e!207768 () Bool)

(declare-fun tp_is_empty!7071 () Bool)

(assert (=> b!338623 (= e!207768 tp_is_empty!7071)))

(declare-fun b!338624 () Bool)

(declare-fun e!207762 () Bool)

(assert (=> b!338624 (= e!207763 e!207762)))

(declare-fun res!187057 () Bool)

(assert (=> b!338624 (=> (not res!187057) (not e!207762))))

(declare-datatypes ((SeekEntryResult!3242 0))(
  ( (MissingZero!3242 (index!15147 (_ BitVec 32))) (Found!3242 (index!15148 (_ BitVec 32))) (Intermediate!3242 (undefined!4054 Bool) (index!15149 (_ BitVec 32)) (x!33738 (_ BitVec 32))) (Undefined!3242) (MissingVacant!3242 (index!15150 (_ BitVec 32))) )
))
(declare-fun lt!160859 () SeekEntryResult!3242)

(get-info :version)

(assert (=> b!338624 (= res!187057 (and (not ((_ is Found!3242) lt!160859)) ((_ is MissingZero!3242) lt!160859)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17737 (_ BitVec 32)) SeekEntryResult!3242)

(assert (=> b!338624 (= lt!160859 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338625 () Bool)

(declare-fun e!207766 () Bool)

(assert (=> b!338625 (= e!207766 tp_is_empty!7071)))

(declare-fun mapIsEmpty!12018 () Bool)

(declare-fun mapRes!12018 () Bool)

(assert (=> mapIsEmpty!12018 mapRes!12018))

(declare-fun res!187052 () Bool)

(assert (=> start!33988 (=> (not res!187052) (not e!207763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33988 (= res!187052 (validMask!0 mask!2385))))

(assert (=> start!33988 e!207763))

(assert (=> start!33988 true))

(assert (=> start!33988 tp_is_empty!7071))

(assert (=> start!33988 tp!24875))

(declare-fun e!207765 () Bool)

(declare-fun array_inv!6226 (array!17739) Bool)

(assert (=> start!33988 (and (array_inv!6226 _values!1525) e!207765)))

(declare-fun array_inv!6227 (array!17737) Bool)

(assert (=> start!33988 (array_inv!6227 _keys!1895)))

(declare-fun b!338626 () Bool)

(assert (=> b!338626 (= e!207765 (and e!207768 mapRes!12018))))

(declare-fun condMapEmpty!12018 () Bool)

(declare-fun mapDefault!12018 () ValueCell!3192)

(assert (=> b!338626 (= condMapEmpty!12018 (= (arr!8395 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3192)) mapDefault!12018)))))

(declare-fun b!338627 () Bool)

(declare-datatypes ((Unit!10525 0))(
  ( (Unit!10526) )
))
(declare-fun e!207764 () Unit!10525)

(declare-fun Unit!10527 () Unit!10525)

(assert (=> b!338627 (= e!207764 Unit!10527)))

(declare-fun zeroValue!1467 () V!10405)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lt!160861 () Unit!10525)

(declare-fun minValue!1467 () V!10405)

(declare-fun lemmaArrayContainsKeyThenInListMap!275 (array!17737 array!17739 (_ BitVec 32) (_ BitVec 32) V!10405 V!10405 (_ BitVec 64) (_ BitVec 32) Int) Unit!10525)

(declare-fun arrayScanForKey!0 (array!17737 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338627 (= lt!160861 (lemmaArrayContainsKeyThenInListMap!275 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338627 false))

(declare-fun b!338628 () Bool)

(assert (=> b!338628 (= e!207762 false)))

(declare-fun lt!160860 () Unit!10525)

(assert (=> b!338628 (= lt!160860 e!207764)))

(declare-fun c!52440 () Bool)

(declare-fun arrayContainsKey!0 (array!17737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338628 (= c!52440 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!338629 () Bool)

(declare-fun res!187055 () Bool)

(assert (=> b!338629 (=> (not res!187055) (not e!207763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17737 (_ BitVec 32)) Bool)

(assert (=> b!338629 (= res!187055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338630 () Bool)

(declare-fun Unit!10528 () Unit!10525)

(assert (=> b!338630 (= e!207764 Unit!10528)))

(declare-fun b!338631 () Bool)

(declare-fun res!187056 () Bool)

(assert (=> b!338631 (=> (not res!187056) (not e!207763))))

(declare-datatypes ((tuple2!5200 0))(
  ( (tuple2!5201 (_1!2611 (_ BitVec 64)) (_2!2611 V!10405)) )
))
(declare-datatypes ((List!4816 0))(
  ( (Nil!4813) (Cons!4812 (h!5668 tuple2!5200) (t!9914 List!4816)) )
))
(declare-datatypes ((ListLongMap!4113 0))(
  ( (ListLongMap!4114 (toList!2072 List!4816)) )
))
(declare-fun contains!2121 (ListLongMap!4113 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1593 (array!17737 array!17739 (_ BitVec 32) (_ BitVec 32) V!10405 V!10405 (_ BitVec 32) Int) ListLongMap!4113)

(assert (=> b!338631 (= res!187056 (not (contains!2121 (getCurrentListMap!1593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!12018 () Bool)

(declare-fun tp!24876 () Bool)

(assert (=> mapNonEmpty!12018 (= mapRes!12018 (and tp!24876 e!207766))))

(declare-fun mapKey!12018 () (_ BitVec 32))

(declare-fun mapValue!12018 () ValueCell!3192)

(declare-fun mapRest!12018 () (Array (_ BitVec 32) ValueCell!3192))

(assert (=> mapNonEmpty!12018 (= (arr!8395 _values!1525) (store mapRest!12018 mapKey!12018 mapValue!12018))))

(assert (= (and start!33988 res!187052) b!338620))

(assert (= (and b!338620 res!187058) b!338629))

(assert (= (and b!338629 res!187055) b!338621))

(assert (= (and b!338621 res!187054) b!338622))

(assert (= (and b!338622 res!187053) b!338631))

(assert (= (and b!338631 res!187056) b!338624))

(assert (= (and b!338624 res!187057) b!338628))

(assert (= (and b!338628 c!52440) b!338627))

(assert (= (and b!338628 (not c!52440)) b!338630))

(assert (= (and b!338626 condMapEmpty!12018) mapIsEmpty!12018))

(assert (= (and b!338626 (not condMapEmpty!12018)) mapNonEmpty!12018))

(assert (= (and mapNonEmpty!12018 ((_ is ValueCellFull!3192) mapValue!12018)) b!338625))

(assert (= (and b!338626 ((_ is ValueCellFull!3192) mapDefault!12018)) b!338623))

(assert (= start!33988 b!338626))

(declare-fun m!341821 () Bool)

(assert (=> b!338628 m!341821))

(declare-fun m!341823 () Bool)

(assert (=> b!338622 m!341823))

(declare-fun m!341825 () Bool)

(assert (=> b!338627 m!341825))

(assert (=> b!338627 m!341825))

(declare-fun m!341827 () Bool)

(assert (=> b!338627 m!341827))

(declare-fun m!341829 () Bool)

(assert (=> b!338621 m!341829))

(declare-fun m!341831 () Bool)

(assert (=> b!338631 m!341831))

(assert (=> b!338631 m!341831))

(declare-fun m!341833 () Bool)

(assert (=> b!338631 m!341833))

(declare-fun m!341835 () Bool)

(assert (=> mapNonEmpty!12018 m!341835))

(declare-fun m!341837 () Bool)

(assert (=> b!338624 m!341837))

(declare-fun m!341839 () Bool)

(assert (=> start!33988 m!341839))

(declare-fun m!341841 () Bool)

(assert (=> start!33988 m!341841))

(declare-fun m!341843 () Bool)

(assert (=> start!33988 m!341843))

(declare-fun m!341845 () Bool)

(assert (=> b!338629 m!341845))

(check-sat (not b!338628) (not b!338631) (not b!338624) b_and!14309 (not b!338622) (not start!33988) (not b!338621) (not mapNonEmpty!12018) tp_is_empty!7071 (not b!338627) (not b!338629) (not b_next!7119))
(check-sat b_and!14309 (not b_next!7119))
