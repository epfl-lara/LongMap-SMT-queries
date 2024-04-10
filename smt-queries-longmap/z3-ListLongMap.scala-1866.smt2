; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33632 () Bool)

(assert start!33632)

(declare-fun b_free!6867 () Bool)

(declare-fun b_next!6867 () Bool)

(assert (=> start!33632 (= b_free!6867 (not b_next!6867))))

(declare-fun tp!24105 () Bool)

(declare-fun b_and!14047 () Bool)

(assert (=> start!33632 (= tp!24105 b_and!14047)))

(declare-fun b!333810 () Bool)

(declare-fun e!204954 () Bool)

(declare-fun tp_is_empty!6819 () Bool)

(assert (=> b!333810 (= e!204954 tp_is_empty!6819)))

(declare-fun res!183918 () Bool)

(declare-fun e!204956 () Bool)

(assert (=> start!33632 (=> (not res!183918) (not e!204956))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33632 (= res!183918 (validMask!0 mask!2385))))

(assert (=> start!33632 e!204956))

(assert (=> start!33632 true))

(assert (=> start!33632 tp_is_empty!6819))

(assert (=> start!33632 tp!24105))

(declare-datatypes ((V!10069 0))(
  ( (V!10070 (val!3454 Int)) )
))
(declare-datatypes ((ValueCell!3066 0))(
  ( (ValueCellFull!3066 (v!5616 V!10069)) (EmptyCell!3066) )
))
(declare-datatypes ((array!17233 0))(
  ( (array!17234 (arr!8147 (Array (_ BitVec 32) ValueCell!3066)) (size!8499 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17233)

(declare-fun e!204957 () Bool)

(declare-fun array_inv!6060 (array!17233) Bool)

(assert (=> start!33632 (and (array_inv!6060 _values!1525) e!204957)))

(declare-datatypes ((array!17235 0))(
  ( (array!17236 (arr!8148 (Array (_ BitVec 32) (_ BitVec 64))) (size!8500 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17235)

(declare-fun array_inv!6061 (array!17235) Bool)

(assert (=> start!33632 (array_inv!6061 _keys!1895)))

(declare-fun b!333811 () Bool)

(declare-fun e!204953 () Bool)

(assert (=> b!333811 (= e!204956 e!204953)))

(declare-fun res!183922 () Bool)

(assert (=> b!333811 (=> (not res!183922) (not e!204953))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3146 0))(
  ( (MissingZero!3146 (index!14763 (_ BitVec 32))) (Found!3146 (index!14764 (_ BitVec 32))) (Intermediate!3146 (undefined!3958 Bool) (index!14765 (_ BitVec 32)) (x!33256 (_ BitVec 32))) (Undefined!3146) (MissingVacant!3146 (index!14766 (_ BitVec 32))) )
))
(declare-fun lt!159408 () SeekEntryResult!3146)

(get-info :version)

(assert (=> b!333811 (= res!183922 (and ((_ is Found!3146) lt!159408) (= (select (arr!8148 _keys!1895) (index!14764 lt!159408)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17235 (_ BitVec 32)) SeekEntryResult!3146)

(assert (=> b!333811 (= lt!159408 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333812 () Bool)

(declare-fun res!183916 () Bool)

(assert (=> b!333812 (=> (not res!183916) (not e!204956))))

(declare-fun zeroValue!1467 () V!10069)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10069)

(declare-datatypes ((tuple2!5018 0))(
  ( (tuple2!5019 (_1!2520 (_ BitVec 64)) (_2!2520 V!10069)) )
))
(declare-datatypes ((List!4638 0))(
  ( (Nil!4635) (Cons!4634 (h!5490 tuple2!5018) (t!9726 List!4638)) )
))
(declare-datatypes ((ListLongMap!3931 0))(
  ( (ListLongMap!3932 (toList!1981 List!4638)) )
))
(declare-fun contains!2025 (ListLongMap!3931 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1509 (array!17235 array!17233 (_ BitVec 32) (_ BitVec 32) V!10069 V!10069 (_ BitVec 32) Int) ListLongMap!3931)

(assert (=> b!333812 (= res!183916 (not (contains!2025 (getCurrentListMap!1509 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333813 () Bool)

(declare-fun e!204955 () Bool)

(assert (=> b!333813 (= e!204955 tp_is_empty!6819)))

(declare-fun b!333814 () Bool)

(declare-fun mapRes!11625 () Bool)

(assert (=> b!333814 (= e!204957 (and e!204955 mapRes!11625))))

(declare-fun condMapEmpty!11625 () Bool)

(declare-fun mapDefault!11625 () ValueCell!3066)

(assert (=> b!333814 (= condMapEmpty!11625 (= (arr!8147 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3066)) mapDefault!11625)))))

(declare-fun mapIsEmpty!11625 () Bool)

(assert (=> mapIsEmpty!11625 mapRes!11625))

(declare-fun b!333815 () Bool)

(declare-fun res!183917 () Bool)

(assert (=> b!333815 (=> (not res!183917) (not e!204956))))

(declare-datatypes ((List!4639 0))(
  ( (Nil!4636) (Cons!4635 (h!5491 (_ BitVec 64)) (t!9727 List!4639)) )
))
(declare-fun arrayNoDuplicates!0 (array!17235 (_ BitVec 32) List!4639) Bool)

(assert (=> b!333815 (= res!183917 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4636))))

(declare-fun b!333816 () Bool)

(declare-fun res!183921 () Bool)

(assert (=> b!333816 (=> (not res!183921) (not e!204956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333816 (= res!183921 (validKeyInArray!0 k0!1348))))

(declare-fun b!333817 () Bool)

(declare-fun res!183919 () Bool)

(assert (=> b!333817 (=> (not res!183919) (not e!204956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17235 (_ BitVec 32)) Bool)

(assert (=> b!333817 (= res!183919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11625 () Bool)

(declare-fun tp!24104 () Bool)

(assert (=> mapNonEmpty!11625 (= mapRes!11625 (and tp!24104 e!204954))))

(declare-fun mapKey!11625 () (_ BitVec 32))

(declare-fun mapValue!11625 () ValueCell!3066)

(declare-fun mapRest!11625 () (Array (_ BitVec 32) ValueCell!3066))

(assert (=> mapNonEmpty!11625 (= (arr!8147 _values!1525) (store mapRest!11625 mapKey!11625 mapValue!11625))))

(declare-fun b!333818 () Bool)

(assert (=> b!333818 (= e!204953 (not true))))

(declare-fun arrayContainsKey!0 (array!17235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333818 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10375 0))(
  ( (Unit!10376) )
))
(declare-fun lt!159409 () Unit!10375)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17235 (_ BitVec 64) (_ BitVec 32)) Unit!10375)

(assert (=> b!333818 (= lt!159409 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14764 lt!159408)))))

(declare-fun b!333819 () Bool)

(declare-fun res!183920 () Bool)

(assert (=> b!333819 (=> (not res!183920) (not e!204956))))

(assert (=> b!333819 (= res!183920 (and (= (size!8499 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8500 _keys!1895) (size!8499 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333820 () Bool)

(declare-fun res!183923 () Bool)

(assert (=> b!333820 (=> (not res!183923) (not e!204953))))

(assert (=> b!333820 (= res!183923 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14764 lt!159408)))))

(assert (= (and start!33632 res!183918) b!333819))

(assert (= (and b!333819 res!183920) b!333817))

(assert (= (and b!333817 res!183919) b!333815))

(assert (= (and b!333815 res!183917) b!333816))

(assert (= (and b!333816 res!183921) b!333812))

(assert (= (and b!333812 res!183916) b!333811))

(assert (= (and b!333811 res!183922) b!333820))

(assert (= (and b!333820 res!183923) b!333818))

(assert (= (and b!333814 condMapEmpty!11625) mapIsEmpty!11625))

(assert (= (and b!333814 (not condMapEmpty!11625)) mapNonEmpty!11625))

(assert (= (and mapNonEmpty!11625 ((_ is ValueCellFull!3066) mapValue!11625)) b!333810))

(assert (= (and b!333814 ((_ is ValueCellFull!3066) mapDefault!11625)) b!333813))

(assert (= start!33632 b!333814))

(declare-fun m!337969 () Bool)

(assert (=> b!333817 m!337969))

(declare-fun m!337971 () Bool)

(assert (=> b!333816 m!337971))

(declare-fun m!337973 () Bool)

(assert (=> mapNonEmpty!11625 m!337973))

(declare-fun m!337975 () Bool)

(assert (=> b!333820 m!337975))

(declare-fun m!337977 () Bool)

(assert (=> b!333818 m!337977))

(declare-fun m!337979 () Bool)

(assert (=> b!333818 m!337979))

(declare-fun m!337981 () Bool)

(assert (=> start!33632 m!337981))

(declare-fun m!337983 () Bool)

(assert (=> start!33632 m!337983))

(declare-fun m!337985 () Bool)

(assert (=> start!33632 m!337985))

(declare-fun m!337987 () Bool)

(assert (=> b!333811 m!337987))

(declare-fun m!337989 () Bool)

(assert (=> b!333811 m!337989))

(declare-fun m!337991 () Bool)

(assert (=> b!333815 m!337991))

(declare-fun m!337993 () Bool)

(assert (=> b!333812 m!337993))

(assert (=> b!333812 m!337993))

(declare-fun m!337995 () Bool)

(assert (=> b!333812 m!337995))

(check-sat (not b!333820) b_and!14047 (not b!333811) tp_is_empty!6819 (not b!333817) (not b_next!6867) (not mapNonEmpty!11625) (not start!33632) (not b!333815) (not b!333818) (not b!333816) (not b!333812))
(check-sat b_and!14047 (not b_next!6867))
