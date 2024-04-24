; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108346 () Bool)

(assert start!108346)

(declare-fun b_free!27835 () Bool)

(declare-fun b_next!27835 () Bool)

(assert (=> start!108346 (= b_free!27835 (not b_next!27835))))

(declare-fun tp!98458 () Bool)

(declare-fun b_and!45893 () Bool)

(assert (=> start!108346 (= tp!98458 b_and!45893)))

(declare-fun b!1278151 () Bool)

(declare-fun res!849035 () Bool)

(declare-fun e!730017 () Bool)

(assert (=> b!1278151 (=> (not res!849035) (not e!730017))))

(declare-datatypes ((array!83891 0))(
  ( (array!83892 (arr!40452 (Array (_ BitVec 32) (_ BitVec 64))) (size!41003 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83891)

(assert (=> b!1278151 (= res!849035 (bvslt #b00000000000000000000000000000000 (size!41003 _keys!1427)))))

(declare-fun b!1278152 () Bool)

(assert (=> b!1278152 (= e!730017 (not true))))

(declare-fun e!730021 () Bool)

(assert (=> b!1278152 e!730021))

(declare-fun c!124336 () Bool)

(declare-fun k0!1053 () (_ BitVec 64))

(assert (=> b!1278152 (= c!124336 (and (not (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1053 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49617 0))(
  ( (V!49618 (val!16767 Int)) )
))
(declare-fun minValue!1129 () V!49617)

(declare-datatypes ((ValueCell!15794 0))(
  ( (ValueCellFull!15794 (v!19359 V!49617)) (EmptyCell!15794) )
))
(declare-datatypes ((array!83893 0))(
  ( (array!83894 (arr!40453 (Array (_ BitVec 32) ValueCell!15794)) (size!41004 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83893)

(declare-datatypes ((Unit!42332 0))(
  ( (Unit!42333) )
))
(declare-fun lt!576029 () Unit!42332)

(declare-fun zeroValue!1129 () V!49617)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!629 (array!83891 array!83893 (_ BitVec 32) (_ BitVec 32) V!49617 V!49617 (_ BitVec 64) (_ BitVec 32) Int) Unit!42332)

(assert (=> b!1278152 (= lt!576029 (lemmaListMapContainsThenArrayContainsFrom!629 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1278153 () Bool)

(declare-fun e!730019 () Bool)

(declare-fun e!730018 () Bool)

(declare-fun mapRes!51608 () Bool)

(assert (=> b!1278153 (= e!730019 (and e!730018 mapRes!51608))))

(declare-fun condMapEmpty!51608 () Bool)

(declare-fun mapDefault!51608 () ValueCell!15794)

(assert (=> b!1278153 (= condMapEmpty!51608 (= (arr!40453 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15794)) mapDefault!51608)))))

(declare-fun res!849037 () Bool)

(assert (=> start!108346 (=> (not res!849037) (not e!730017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108346 (= res!849037 (validMask!0 mask!1805))))

(assert (=> start!108346 e!730017))

(assert (=> start!108346 true))

(assert (=> start!108346 tp!98458))

(declare-fun tp_is_empty!33385 () Bool)

(assert (=> start!108346 tp_is_empty!33385))

(declare-fun array_inv!30925 (array!83893) Bool)

(assert (=> start!108346 (and (array_inv!30925 _values!1187) e!730019)))

(declare-fun array_inv!30926 (array!83891) Bool)

(assert (=> start!108346 (array_inv!30926 _keys!1427)))

(declare-fun b!1278154 () Bool)

(declare-fun res!849040 () Bool)

(assert (=> b!1278154 (=> (not res!849040) (not e!730017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83891 (_ BitVec 32)) Bool)

(assert (=> b!1278154 (= res!849040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51608 () Bool)

(assert (=> mapIsEmpty!51608 mapRes!51608))

(declare-fun b!1278155 () Bool)

(declare-fun res!849038 () Bool)

(assert (=> b!1278155 (=> (not res!849038) (not e!730017))))

(assert (=> b!1278155 (= res!849038 (and (= (size!41004 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41003 _keys!1427) (size!41004 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1278156 () Bool)

(assert (=> b!1278156 (= e!730018 tp_is_empty!33385)))

(declare-fun mapNonEmpty!51608 () Bool)

(declare-fun tp!98459 () Bool)

(declare-fun e!730016 () Bool)

(assert (=> mapNonEmpty!51608 (= mapRes!51608 (and tp!98459 e!730016))))

(declare-fun mapKey!51608 () (_ BitVec 32))

(declare-fun mapValue!51608 () ValueCell!15794)

(declare-fun mapRest!51608 () (Array (_ BitVec 32) ValueCell!15794))

(assert (=> mapNonEmpty!51608 (= (arr!40453 _values!1187) (store mapRest!51608 mapKey!51608 mapValue!51608))))

(declare-fun b!1278157 () Bool)

(assert (=> b!1278157 (= e!730016 tp_is_empty!33385)))

(declare-fun b!1278158 () Bool)

(declare-fun res!849039 () Bool)

(assert (=> b!1278158 (=> (not res!849039) (not e!730017))))

(declare-datatypes ((tuple2!21524 0))(
  ( (tuple2!21525 (_1!10773 (_ BitVec 64)) (_2!10773 V!49617)) )
))
(declare-datatypes ((List!28714 0))(
  ( (Nil!28711) (Cons!28710 (h!29928 tuple2!21524) (t!42242 List!28714)) )
))
(declare-datatypes ((ListLongMap!19189 0))(
  ( (ListLongMap!19190 (toList!9610 List!28714)) )
))
(declare-fun contains!7734 (ListLongMap!19189 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4679 (array!83891 array!83893 (_ BitVec 32) (_ BitVec 32) V!49617 V!49617 (_ BitVec 32) Int) ListLongMap!19189)

(assert (=> b!1278158 (= res!849039 (contains!7734 (getCurrentListMap!4679 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1278159 () Bool)

(assert (=> b!1278159 (= e!730021 (ite (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1278160 () Bool)

(declare-fun res!849036 () Bool)

(assert (=> b!1278160 (=> (not res!849036) (not e!730017))))

(declare-datatypes ((List!28715 0))(
  ( (Nil!28712) (Cons!28711 (h!29929 (_ BitVec 64)) (t!42243 List!28715)) )
))
(declare-fun arrayNoDuplicates!0 (array!83891 (_ BitVec 32) List!28715) Bool)

(assert (=> b!1278160 (= res!849036 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28712))))

(declare-fun b!1278161 () Bool)

(declare-fun arrayContainsKey!0 (array!83891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1278161 (= e!730021 (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000))))

(assert (= (and start!108346 res!849037) b!1278155))

(assert (= (and b!1278155 res!849038) b!1278154))

(assert (= (and b!1278154 res!849040) b!1278160))

(assert (= (and b!1278160 res!849036) b!1278158))

(assert (= (and b!1278158 res!849039) b!1278151))

(assert (= (and b!1278151 res!849035) b!1278152))

(assert (= (and b!1278152 c!124336) b!1278161))

(assert (= (and b!1278152 (not c!124336)) b!1278159))

(assert (= (and b!1278153 condMapEmpty!51608) mapIsEmpty!51608))

(assert (= (and b!1278153 (not condMapEmpty!51608)) mapNonEmpty!51608))

(get-info :version)

(assert (= (and mapNonEmpty!51608 ((_ is ValueCellFull!15794) mapValue!51608)) b!1278157))

(assert (= (and b!1278153 ((_ is ValueCellFull!15794) mapDefault!51608)) b!1278156))

(assert (= start!108346 b!1278153))

(declare-fun m!1174269 () Bool)

(assert (=> b!1278160 m!1174269))

(declare-fun m!1174271 () Bool)

(assert (=> b!1278161 m!1174271))

(declare-fun m!1174273 () Bool)

(assert (=> start!108346 m!1174273))

(declare-fun m!1174275 () Bool)

(assert (=> start!108346 m!1174275))

(declare-fun m!1174277 () Bool)

(assert (=> start!108346 m!1174277))

(declare-fun m!1174279 () Bool)

(assert (=> mapNonEmpty!51608 m!1174279))

(declare-fun m!1174281 () Bool)

(assert (=> b!1278154 m!1174281))

(declare-fun m!1174283 () Bool)

(assert (=> b!1278152 m!1174283))

(declare-fun m!1174285 () Bool)

(assert (=> b!1278158 m!1174285))

(assert (=> b!1278158 m!1174285))

(declare-fun m!1174287 () Bool)

(assert (=> b!1278158 m!1174287))

(check-sat (not b_next!27835) (not b!1278161) (not b!1278152) b_and!45893 tp_is_empty!33385 (not b!1278158) (not b!1278154) (not mapNonEmpty!51608) (not b!1278160) (not start!108346))
(check-sat b_and!45893 (not b_next!27835))
