; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33978 () Bool)

(assert start!33978)

(declare-fun b_free!7123 () Bool)

(declare-fun b_next!7123 () Bool)

(assert (=> start!33978 (= b_free!7123 (not b_next!7123))))

(declare-fun tp!24888 () Bool)

(declare-fun b_and!14327 () Bool)

(assert (=> start!33978 (= tp!24888 b_and!14327)))

(declare-fun b!338639 () Bool)

(declare-fun e!207775 () Bool)

(assert (=> b!338639 (= e!207775 false)))

(declare-datatypes ((Unit!10493 0))(
  ( (Unit!10494) )
))
(declare-fun lt!160897 () Unit!10493)

(declare-fun e!207773 () Unit!10493)

(assert (=> b!338639 (= lt!160897 e!207773)))

(declare-fun c!52421 () Bool)

(declare-datatypes ((array!17728 0))(
  ( (array!17729 (arr!8389 (Array (_ BitVec 32) (_ BitVec 64))) (size!8741 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17728)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338639 (= c!52421 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!338641 () Bool)

(declare-fun res!187094 () Bool)

(declare-fun e!207772 () Bool)

(assert (=> b!338641 (=> (not res!187094) (not e!207772))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10411 0))(
  ( (V!10412 (val!3582 Int)) )
))
(declare-datatypes ((ValueCell!3194 0))(
  ( (ValueCellFull!3194 (v!5750 V!10411)) (EmptyCell!3194) )
))
(declare-datatypes ((array!17730 0))(
  ( (array!17731 (arr!8390 (Array (_ BitVec 32) ValueCell!3194)) (size!8742 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17730)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!338641 (= res!187094 (and (= (size!8742 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8741 _keys!1895) (size!8742 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338642 () Bool)

(declare-fun res!187093 () Bool)

(assert (=> b!338642 (=> (not res!187093) (not e!207772))))

(declare-datatypes ((List!4720 0))(
  ( (Nil!4717) (Cons!4716 (h!5572 (_ BitVec 64)) (t!9810 List!4720)) )
))
(declare-fun arrayNoDuplicates!0 (array!17728 (_ BitVec 32) List!4720) Bool)

(assert (=> b!338642 (= res!187093 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4717))))

(declare-fun b!338643 () Bool)

(declare-fun e!207776 () Bool)

(declare-fun tp_is_empty!7075 () Bool)

(assert (=> b!338643 (= e!207776 tp_is_empty!7075)))

(declare-fun mapNonEmpty!12024 () Bool)

(declare-fun mapRes!12024 () Bool)

(declare-fun tp!24887 () Bool)

(declare-fun e!207774 () Bool)

(assert (=> mapNonEmpty!12024 (= mapRes!12024 (and tp!24887 e!207774))))

(declare-fun mapKey!12024 () (_ BitVec 32))

(declare-fun mapValue!12024 () ValueCell!3194)

(declare-fun mapRest!12024 () (Array (_ BitVec 32) ValueCell!3194))

(assert (=> mapNonEmpty!12024 (= (arr!8390 _values!1525) (store mapRest!12024 mapKey!12024 mapValue!12024))))

(declare-fun b!338644 () Bool)

(declare-fun res!187096 () Bool)

(assert (=> b!338644 (=> (not res!187096) (not e!207772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338644 (= res!187096 (validKeyInArray!0 k0!1348))))

(declare-fun b!338645 () Bool)

(declare-fun res!187091 () Bool)

(assert (=> b!338645 (=> (not res!187091) (not e!207772))))

(declare-fun zeroValue!1467 () V!10411)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10411)

(declare-datatypes ((tuple2!5110 0))(
  ( (tuple2!5111 (_1!2566 (_ BitVec 64)) (_2!2566 V!10411)) )
))
(declare-datatypes ((List!4721 0))(
  ( (Nil!4718) (Cons!4717 (h!5573 tuple2!5110) (t!9811 List!4721)) )
))
(declare-datatypes ((ListLongMap!4025 0))(
  ( (ListLongMap!4026 (toList!2028 List!4721)) )
))
(declare-fun contains!2096 (ListLongMap!4025 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1557 (array!17728 array!17730 (_ BitVec 32) (_ BitVec 32) V!10411 V!10411 (_ BitVec 32) Int) ListLongMap!4025)

(assert (=> b!338645 (= res!187091 (not (contains!2096 (getCurrentListMap!1557 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!338646 () Bool)

(declare-fun e!207770 () Bool)

(assert (=> b!338646 (= e!207770 (and e!207776 mapRes!12024))))

(declare-fun condMapEmpty!12024 () Bool)

(declare-fun mapDefault!12024 () ValueCell!3194)

(assert (=> b!338646 (= condMapEmpty!12024 (= (arr!8390 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3194)) mapDefault!12024)))))

(declare-fun b!338640 () Bool)

(declare-fun res!187097 () Bool)

(assert (=> b!338640 (=> (not res!187097) (not e!207772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17728 (_ BitVec 32)) Bool)

(assert (=> b!338640 (= res!187097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!187095 () Bool)

(assert (=> start!33978 (=> (not res!187095) (not e!207772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33978 (= res!187095 (validMask!0 mask!2385))))

(assert (=> start!33978 e!207772))

(assert (=> start!33978 true))

(assert (=> start!33978 tp_is_empty!7075))

(assert (=> start!33978 tp!24888))

(declare-fun array_inv!6224 (array!17730) Bool)

(assert (=> start!33978 (and (array_inv!6224 _values!1525) e!207770)))

(declare-fun array_inv!6225 (array!17728) Bool)

(assert (=> start!33978 (array_inv!6225 _keys!1895)))

(declare-fun b!338647 () Bool)

(assert (=> b!338647 (= e!207772 e!207775)))

(declare-fun res!187092 () Bool)

(assert (=> b!338647 (=> (not res!187092) (not e!207775))))

(declare-datatypes ((SeekEntryResult!3199 0))(
  ( (MissingZero!3199 (index!14975 (_ BitVec 32))) (Found!3199 (index!14976 (_ BitVec 32))) (Intermediate!3199 (undefined!4011 Bool) (index!14977 (_ BitVec 32)) (x!33700 (_ BitVec 32))) (Undefined!3199) (MissingVacant!3199 (index!14978 (_ BitVec 32))) )
))
(declare-fun lt!160895 () SeekEntryResult!3199)

(get-info :version)

(assert (=> b!338647 (= res!187092 (and (not ((_ is Found!3199) lt!160895)) ((_ is MissingZero!3199) lt!160895)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17728 (_ BitVec 32)) SeekEntryResult!3199)

(assert (=> b!338647 (= lt!160895 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12024 () Bool)

(assert (=> mapIsEmpty!12024 mapRes!12024))

(declare-fun b!338648 () Bool)

(declare-fun Unit!10495 () Unit!10493)

(assert (=> b!338648 (= e!207773 Unit!10495)))

(declare-fun b!338649 () Bool)

(assert (=> b!338649 (= e!207774 tp_is_empty!7075)))

(declare-fun b!338650 () Bool)

(declare-fun Unit!10496 () Unit!10493)

(assert (=> b!338650 (= e!207773 Unit!10496)))

(declare-fun lt!160896 () Unit!10493)

(declare-fun lemmaArrayContainsKeyThenInListMap!283 (array!17728 array!17730 (_ BitVec 32) (_ BitVec 32) V!10411 V!10411 (_ BitVec 64) (_ BitVec 32) Int) Unit!10493)

(declare-fun arrayScanForKey!0 (array!17728 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338650 (= lt!160896 (lemmaArrayContainsKeyThenInListMap!283 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338650 false))

(assert (= (and start!33978 res!187095) b!338641))

(assert (= (and b!338641 res!187094) b!338640))

(assert (= (and b!338640 res!187097) b!338642))

(assert (= (and b!338642 res!187093) b!338644))

(assert (= (and b!338644 res!187096) b!338645))

(assert (= (and b!338645 res!187091) b!338647))

(assert (= (and b!338647 res!187092) b!338639))

(assert (= (and b!338639 c!52421) b!338650))

(assert (= (and b!338639 (not c!52421)) b!338648))

(assert (= (and b!338646 condMapEmpty!12024) mapIsEmpty!12024))

(assert (= (and b!338646 (not condMapEmpty!12024)) mapNonEmpty!12024))

(assert (= (and mapNonEmpty!12024 ((_ is ValueCellFull!3194) mapValue!12024)) b!338649))

(assert (= (and b!338646 ((_ is ValueCellFull!3194) mapDefault!12024)) b!338643))

(assert (= start!33978 b!338646))

(declare-fun m!342097 () Bool)

(assert (=> b!338644 m!342097))

(declare-fun m!342099 () Bool)

(assert (=> b!338642 m!342099))

(declare-fun m!342101 () Bool)

(assert (=> b!338640 m!342101))

(declare-fun m!342103 () Bool)

(assert (=> b!338639 m!342103))

(declare-fun m!342105 () Bool)

(assert (=> b!338650 m!342105))

(assert (=> b!338650 m!342105))

(declare-fun m!342107 () Bool)

(assert (=> b!338650 m!342107))

(declare-fun m!342109 () Bool)

(assert (=> b!338647 m!342109))

(declare-fun m!342111 () Bool)

(assert (=> mapNonEmpty!12024 m!342111))

(declare-fun m!342113 () Bool)

(assert (=> start!33978 m!342113))

(declare-fun m!342115 () Bool)

(assert (=> start!33978 m!342115))

(declare-fun m!342117 () Bool)

(assert (=> start!33978 m!342117))

(declare-fun m!342119 () Bool)

(assert (=> b!338645 m!342119))

(assert (=> b!338645 m!342119))

(declare-fun m!342121 () Bool)

(assert (=> b!338645 m!342121))

(check-sat (not b!338639) (not start!33978) (not mapNonEmpty!12024) tp_is_empty!7075 (not b!338644) (not b!338650) (not b!338645) (not b_next!7123) (not b!338640) b_and!14327 (not b!338647) (not b!338642))
(check-sat b_and!14327 (not b_next!7123))
