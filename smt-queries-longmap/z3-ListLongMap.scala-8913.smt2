; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108130 () Bool)

(assert start!108130)

(declare-fun b_free!27843 () Bool)

(declare-fun b_next!27843 () Bool)

(assert (=> start!108130 (= b_free!27843 (not b_next!27843))))

(declare-fun tp!98482 () Bool)

(declare-fun b_and!45899 () Bool)

(assert (=> start!108130 (= tp!98482 b_and!45899)))

(declare-fun b!1276978 () Bool)

(declare-fun e!729245 () Bool)

(declare-datatypes ((array!83878 0))(
  ( (array!83879 (arr!40450 (Array (_ BitVec 32) (_ BitVec 64))) (size!41000 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83878)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!83878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1276978 (= e!729245 (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000))))

(declare-fun b!1276979 () Bool)

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276979 (= e!729245 (ite (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1276980 () Bool)

(declare-fun e!729243 () Bool)

(declare-fun tp_is_empty!33393 () Bool)

(assert (=> b!1276980 (= e!729243 tp_is_empty!33393)))

(declare-fun mapIsEmpty!51620 () Bool)

(declare-fun mapRes!51620 () Bool)

(assert (=> mapIsEmpty!51620 mapRes!51620))

(declare-fun res!848592 () Bool)

(declare-fun e!729246 () Bool)

(assert (=> start!108130 (=> (not res!848592) (not e!729246))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108130 (= res!848592 (validMask!0 mask!1805))))

(assert (=> start!108130 e!729246))

(assert (=> start!108130 true))

(assert (=> start!108130 tp!98482))

(assert (=> start!108130 tp_is_empty!33393))

(declare-datatypes ((V!49627 0))(
  ( (V!49628 (val!16771 Int)) )
))
(declare-datatypes ((ValueCell!15798 0))(
  ( (ValueCellFull!15798 (v!19368 V!49627)) (EmptyCell!15798) )
))
(declare-datatypes ((array!83880 0))(
  ( (array!83881 (arr!40451 (Array (_ BitVec 32) ValueCell!15798)) (size!41001 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83880)

(declare-fun e!729244 () Bool)

(declare-fun array_inv!30735 (array!83880) Bool)

(assert (=> start!108130 (and (array_inv!30735 _values!1187) e!729244)))

(declare-fun array_inv!30736 (array!83878) Bool)

(assert (=> start!108130 (array_inv!30736 _keys!1427)))

(declare-fun b!1276981 () Bool)

(declare-fun res!848589 () Bool)

(assert (=> b!1276981 (=> (not res!848589) (not e!729246))))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49627)

(declare-fun zeroValue!1129 () V!49627)

(declare-datatypes ((tuple2!21510 0))(
  ( (tuple2!21511 (_1!10766 (_ BitVec 64)) (_2!10766 V!49627)) )
))
(declare-datatypes ((List!28687 0))(
  ( (Nil!28684) (Cons!28683 (h!29892 tuple2!21510) (t!42223 List!28687)) )
))
(declare-datatypes ((ListLongMap!19167 0))(
  ( (ListLongMap!19168 (toList!9599 List!28687)) )
))
(declare-fun contains!7708 (ListLongMap!19167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4683 (array!83878 array!83880 (_ BitVec 32) (_ BitVec 32) V!49627 V!49627 (_ BitVec 32) Int) ListLongMap!19167)

(assert (=> b!1276981 (= res!848589 (contains!7708 (getCurrentListMap!4683 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276982 () Bool)

(declare-fun res!848588 () Bool)

(assert (=> b!1276982 (=> (not res!848588) (not e!729246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83878 (_ BitVec 32)) Bool)

(assert (=> b!1276982 (= res!848588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276983 () Bool)

(declare-fun res!848591 () Bool)

(assert (=> b!1276983 (=> (not res!848591) (not e!729246))))

(declare-datatypes ((List!28688 0))(
  ( (Nil!28685) (Cons!28684 (h!29893 (_ BitVec 64)) (t!42224 List!28688)) )
))
(declare-fun arrayNoDuplicates!0 (array!83878 (_ BitVec 32) List!28688) Bool)

(assert (=> b!1276983 (= res!848591 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28685))))

(declare-fun mapNonEmpty!51620 () Bool)

(declare-fun tp!98483 () Bool)

(declare-fun e!729241 () Bool)

(assert (=> mapNonEmpty!51620 (= mapRes!51620 (and tp!98483 e!729241))))

(declare-fun mapValue!51620 () ValueCell!15798)

(declare-fun mapKey!51620 () (_ BitVec 32))

(declare-fun mapRest!51620 () (Array (_ BitVec 32) ValueCell!15798))

(assert (=> mapNonEmpty!51620 (= (arr!40451 _values!1187) (store mapRest!51620 mapKey!51620 mapValue!51620))))

(declare-fun b!1276984 () Bool)

(assert (=> b!1276984 (= e!729246 (not true))))

(assert (=> b!1276984 e!729245))

(declare-fun c!123948 () Bool)

(assert (=> b!1276984 (= c!123948 (and (not (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1053 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!42363 0))(
  ( (Unit!42364) )
))
(declare-fun lt!575557 () Unit!42363)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!624 (array!83878 array!83880 (_ BitVec 32) (_ BitVec 32) V!49627 V!49627 (_ BitVec 64) (_ BitVec 32) Int) Unit!42363)

(assert (=> b!1276984 (= lt!575557 (lemmaListMapContainsThenArrayContainsFrom!624 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1276985 () Bool)

(declare-fun res!848590 () Bool)

(assert (=> b!1276985 (=> (not res!848590) (not e!729246))))

(assert (=> b!1276985 (= res!848590 (bvslt #b00000000000000000000000000000000 (size!41000 _keys!1427)))))

(declare-fun b!1276986 () Bool)

(declare-fun res!848587 () Bool)

(assert (=> b!1276986 (=> (not res!848587) (not e!729246))))

(assert (=> b!1276986 (= res!848587 (and (= (size!41001 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41000 _keys!1427) (size!41001 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276987 () Bool)

(assert (=> b!1276987 (= e!729244 (and e!729243 mapRes!51620))))

(declare-fun condMapEmpty!51620 () Bool)

(declare-fun mapDefault!51620 () ValueCell!15798)

(assert (=> b!1276987 (= condMapEmpty!51620 (= (arr!40451 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15798)) mapDefault!51620)))))

(declare-fun b!1276988 () Bool)

(assert (=> b!1276988 (= e!729241 tp_is_empty!33393)))

(assert (= (and start!108130 res!848592) b!1276986))

(assert (= (and b!1276986 res!848587) b!1276982))

(assert (= (and b!1276982 res!848588) b!1276983))

(assert (= (and b!1276983 res!848591) b!1276981))

(assert (= (and b!1276981 res!848589) b!1276985))

(assert (= (and b!1276985 res!848590) b!1276984))

(assert (= (and b!1276984 c!123948) b!1276978))

(assert (= (and b!1276984 (not c!123948)) b!1276979))

(assert (= (and b!1276987 condMapEmpty!51620) mapIsEmpty!51620))

(assert (= (and b!1276987 (not condMapEmpty!51620)) mapNonEmpty!51620))

(get-info :version)

(assert (= (and mapNonEmpty!51620 ((_ is ValueCellFull!15798) mapValue!51620)) b!1276988))

(assert (= (and b!1276987 ((_ is ValueCellFull!15798) mapDefault!51620)) b!1276980))

(assert (= start!108130 b!1276987))

(declare-fun m!1172737 () Bool)

(assert (=> b!1276984 m!1172737))

(declare-fun m!1172739 () Bool)

(assert (=> mapNonEmpty!51620 m!1172739))

(declare-fun m!1172741 () Bool)

(assert (=> b!1276978 m!1172741))

(declare-fun m!1172743 () Bool)

(assert (=> b!1276982 m!1172743))

(declare-fun m!1172745 () Bool)

(assert (=> b!1276983 m!1172745))

(declare-fun m!1172747 () Bool)

(assert (=> start!108130 m!1172747))

(declare-fun m!1172749 () Bool)

(assert (=> start!108130 m!1172749))

(declare-fun m!1172751 () Bool)

(assert (=> start!108130 m!1172751))

(declare-fun m!1172753 () Bool)

(assert (=> b!1276981 m!1172753))

(assert (=> b!1276981 m!1172753))

(declare-fun m!1172755 () Bool)

(assert (=> b!1276981 m!1172755))

(check-sat (not b_next!27843) (not b!1276984) tp_is_empty!33393 (not b!1276983) (not b!1276981) (not start!108130) (not mapNonEmpty!51620) (not b!1276978) b_and!45899 (not b!1276982))
(check-sat b_and!45899 (not b_next!27843))
