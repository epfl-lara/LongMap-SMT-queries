; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108234 () Bool)

(assert start!108234)

(declare-fun b_free!27915 () Bool)

(declare-fun b_next!27915 () Bool)

(assert (=> start!108234 (= b_free!27915 (not b_next!27915))))

(declare-fun tp!98704 () Bool)

(declare-fun b_and!45975 () Bool)

(assert (=> start!108234 (= tp!98704 b_and!45975)))

(declare-fun b!1278045 () Bool)

(declare-fun res!849163 () Bool)

(declare-fun e!729954 () Bool)

(assert (=> b!1278045 (=> (not res!849163) (not e!729954))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!84018 0))(
  ( (array!84019 (arr!40518 (Array (_ BitVec 32) (_ BitVec 64))) (size!41068 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!84018)

(declare-datatypes ((V!49723 0))(
  ( (V!49724 (val!16807 Int)) )
))
(declare-datatypes ((ValueCell!15834 0))(
  ( (ValueCellFull!15834 (v!19406 V!49723)) (EmptyCell!15834) )
))
(declare-datatypes ((array!84020 0))(
  ( (array!84021 (arr!40519 (Array (_ BitVec 32) ValueCell!15834)) (size!41069 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!84020)

(assert (=> b!1278045 (= res!849163 (and (= (size!41069 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41068 _keys!1427) (size!41069 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun res!849160 () Bool)

(assert (=> start!108234 (=> (not res!849160) (not e!729954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108234 (= res!849160 (validMask!0 mask!1805))))

(assert (=> start!108234 e!729954))

(assert (=> start!108234 true))

(assert (=> start!108234 tp!98704))

(declare-fun tp_is_empty!33465 () Bool)

(assert (=> start!108234 tp_is_empty!33465))

(declare-fun e!729957 () Bool)

(declare-fun array_inv!30777 (array!84020) Bool)

(assert (=> start!108234 (and (array_inv!30777 _values!1187) e!729957)))

(declare-fun array_inv!30778 (array!84018) Bool)

(assert (=> start!108234 (array_inv!30778 _keys!1427)))

(declare-fun b!1278046 () Bool)

(declare-fun e!729956 () Bool)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!84018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1278046 (= e!729956 (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000))))

(declare-fun b!1278047 () Bool)

(declare-fun e!729952 () Bool)

(assert (=> b!1278047 (= e!729952 tp_is_empty!33465)))

(declare-fun b!1278048 () Bool)

(declare-fun res!849164 () Bool)

(assert (=> b!1278048 (=> (not res!849164) (not e!729954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84018 (_ BitVec 32)) Bool)

(assert (=> b!1278048 (= res!849164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1278049 () Bool)

(declare-fun e!729953 () Bool)

(assert (=> b!1278049 (= e!729953 tp_is_empty!33465)))

(declare-fun b!1278050 () Bool)

(declare-fun res!849162 () Bool)

(assert (=> b!1278050 (=> (not res!849162) (not e!729954))))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49723)

(declare-fun zeroValue!1129 () V!49723)

(declare-datatypes ((tuple2!21556 0))(
  ( (tuple2!21557 (_1!10789 (_ BitVec 64)) (_2!10789 V!49723)) )
))
(declare-datatypes ((List!28732 0))(
  ( (Nil!28729) (Cons!28728 (h!29937 tuple2!21556) (t!42272 List!28732)) )
))
(declare-datatypes ((ListLongMap!19213 0))(
  ( (ListLongMap!19214 (toList!9622 List!28732)) )
))
(declare-fun contains!7733 (ListLongMap!19213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4706 (array!84018 array!84020 (_ BitVec 32) (_ BitVec 32) V!49723 V!49723 (_ BitVec 32) Int) ListLongMap!19213)

(assert (=> b!1278050 (= res!849162 (contains!7733 (getCurrentListMap!4706 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun mapIsEmpty!51734 () Bool)

(declare-fun mapRes!51734 () Bool)

(assert (=> mapIsEmpty!51734 mapRes!51734))

(declare-fun b!1278051 () Bool)

(assert (=> b!1278051 (= e!729954 (not true))))

(assert (=> b!1278051 e!729956))

(declare-fun c!124023 () Bool)

(assert (=> b!1278051 (= c!124023 (and (not (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1053 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!42381 0))(
  ( (Unit!42382) )
))
(declare-fun lt!575842 () Unit!42381)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!630 (array!84018 array!84020 (_ BitVec 32) (_ BitVec 32) V!49723 V!49723 (_ BitVec 64) (_ BitVec 32) Int) Unit!42381)

(assert (=> b!1278051 (= lt!575842 (lemmaListMapContainsThenArrayContainsFrom!630 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1278052 () Bool)

(assert (=> b!1278052 (= e!729956 (ite (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1278053 () Bool)

(declare-fun res!849161 () Bool)

(assert (=> b!1278053 (=> (not res!849161) (not e!729954))))

(declare-datatypes ((List!28733 0))(
  ( (Nil!28730) (Cons!28729 (h!29938 (_ BitVec 64)) (t!42273 List!28733)) )
))
(declare-fun arrayNoDuplicates!0 (array!84018 (_ BitVec 32) List!28733) Bool)

(assert (=> b!1278053 (= res!849161 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28730))))

(declare-fun b!1278054 () Bool)

(declare-fun res!849165 () Bool)

(assert (=> b!1278054 (=> (not res!849165) (not e!729954))))

(assert (=> b!1278054 (= res!849165 (bvslt #b00000000000000000000000000000000 (size!41068 _keys!1427)))))

(declare-fun b!1278055 () Bool)

(assert (=> b!1278055 (= e!729957 (and e!729953 mapRes!51734))))

(declare-fun condMapEmpty!51734 () Bool)

(declare-fun mapDefault!51734 () ValueCell!15834)

(assert (=> b!1278055 (= condMapEmpty!51734 (= (arr!40519 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15834)) mapDefault!51734)))))

(declare-fun mapNonEmpty!51734 () Bool)

(declare-fun tp!98705 () Bool)

(assert (=> mapNonEmpty!51734 (= mapRes!51734 (and tp!98705 e!729952))))

(declare-fun mapValue!51734 () ValueCell!15834)

(declare-fun mapRest!51734 () (Array (_ BitVec 32) ValueCell!15834))

(declare-fun mapKey!51734 () (_ BitVec 32))

(assert (=> mapNonEmpty!51734 (= (arr!40519 _values!1187) (store mapRest!51734 mapKey!51734 mapValue!51734))))

(assert (= (and start!108234 res!849160) b!1278045))

(assert (= (and b!1278045 res!849163) b!1278048))

(assert (= (and b!1278048 res!849164) b!1278053))

(assert (= (and b!1278053 res!849161) b!1278050))

(assert (= (and b!1278050 res!849162) b!1278054))

(assert (= (and b!1278054 res!849165) b!1278051))

(assert (= (and b!1278051 c!124023) b!1278046))

(assert (= (and b!1278051 (not c!124023)) b!1278052))

(assert (= (and b!1278055 condMapEmpty!51734) mapIsEmpty!51734))

(assert (= (and b!1278055 (not condMapEmpty!51734)) mapNonEmpty!51734))

(get-info :version)

(assert (= (and mapNonEmpty!51734 ((_ is ValueCellFull!15834) mapValue!51734)) b!1278047))

(assert (= (and b!1278055 ((_ is ValueCellFull!15834) mapDefault!51734)) b!1278049))

(assert (= start!108234 b!1278055))

(declare-fun m!1173501 () Bool)

(assert (=> start!108234 m!1173501))

(declare-fun m!1173503 () Bool)

(assert (=> start!108234 m!1173503))

(declare-fun m!1173505 () Bool)

(assert (=> start!108234 m!1173505))

(declare-fun m!1173507 () Bool)

(assert (=> b!1278046 m!1173507))

(declare-fun m!1173509 () Bool)

(assert (=> b!1278053 m!1173509))

(declare-fun m!1173511 () Bool)

(assert (=> b!1278050 m!1173511))

(assert (=> b!1278050 m!1173511))

(declare-fun m!1173513 () Bool)

(assert (=> b!1278050 m!1173513))

(declare-fun m!1173515 () Bool)

(assert (=> b!1278048 m!1173515))

(declare-fun m!1173517 () Bool)

(assert (=> mapNonEmpty!51734 m!1173517))

(declare-fun m!1173519 () Bool)

(assert (=> b!1278051 m!1173519))

(check-sat (not b!1278048) tp_is_empty!33465 (not b!1278053) (not start!108234) (not b!1278051) (not b_next!27915) (not b!1278046) (not b!1278050) (not mapNonEmpty!51734) b_and!45975)
(check-sat b_and!45975 (not b_next!27915))
