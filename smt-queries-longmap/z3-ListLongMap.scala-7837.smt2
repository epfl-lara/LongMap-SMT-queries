; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97760 () Bool)

(assert start!97760)

(declare-fun b_free!23467 () Bool)

(declare-fun b_next!23467 () Bool)

(assert (=> start!97760 (= b_free!23467 (not b_next!23467))))

(declare-fun tp!83105 () Bool)

(declare-fun b_and!37719 () Bool)

(assert (=> start!97760 (= tp!83105 b_and!37719)))

(declare-fun mapNonEmpty!43813 () Bool)

(declare-fun mapRes!43813 () Bool)

(declare-fun tp!83104 () Bool)

(declare-fun e!636861 () Bool)

(assert (=> mapNonEmpty!43813 (= mapRes!43813 (and tp!83104 e!636861))))

(declare-datatypes ((V!42457 0))(
  ( (V!42458 (val!14055 Int)) )
))
(declare-datatypes ((ValueCell!13289 0))(
  ( (ValueCellFull!13289 (v!16687 V!42457)) (EmptyCell!13289) )
))
(declare-fun mapRest!43813 () (Array (_ BitVec 32) ValueCell!13289))

(declare-fun mapValue!43813 () ValueCell!13289)

(declare-datatypes ((array!72788 0))(
  ( (array!72789 (arr!35047 (Array (_ BitVec 32) ValueCell!13289)) (size!35585 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72788)

(declare-fun mapKey!43813 () (_ BitVec 32))

(assert (=> mapNonEmpty!43813 (= (arr!35047 _values!996) (store mapRest!43813 mapKey!43813 mapValue!43813))))

(declare-fun b!1118093 () Bool)

(declare-fun e!636862 () Bool)

(declare-fun tp_is_empty!27997 () Bool)

(assert (=> b!1118093 (= e!636862 tp_is_empty!27997)))

(declare-fun b!1118094 () Bool)

(declare-fun res!746754 () Bool)

(declare-fun e!636859 () Bool)

(assert (=> b!1118094 (=> (not res!746754) (not e!636859))))

(declare-datatypes ((array!72790 0))(
  ( (array!72791 (arr!35048 (Array (_ BitVec 32) (_ BitVec 64))) (size!35586 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72790)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72790 (_ BitVec 32)) Bool)

(assert (=> b!1118094 (= res!746754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118096 () Bool)

(declare-fun res!746751 () Bool)

(assert (=> b!1118096 (=> (not res!746751) (not e!636859))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118096 (= res!746751 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!43813 () Bool)

(assert (=> mapIsEmpty!43813 mapRes!43813))

(declare-fun b!1118097 () Bool)

(declare-fun res!746758 () Bool)

(assert (=> b!1118097 (=> (not res!746758) (not e!636859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118097 (= res!746758 (validMask!0 mask!1564))))

(declare-fun b!1118098 () Bool)

(declare-fun res!746761 () Bool)

(assert (=> b!1118098 (=> (not res!746761) (not e!636859))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1118098 (= res!746761 (and (= (size!35585 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35586 _keys!1208) (size!35585 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118099 () Bool)

(declare-fun res!746760 () Bool)

(declare-fun e!636858 () Bool)

(assert (=> b!1118099 (=> (not res!746760) (not e!636858))))

(declare-fun lt!497248 () array!72790)

(declare-datatypes ((List!24451 0))(
  ( (Nil!24448) (Cons!24447 (h!25656 (_ BitVec 64)) (t!34923 List!24451)) )
))
(declare-fun arrayNoDuplicates!0 (array!72790 (_ BitVec 32) List!24451) Bool)

(assert (=> b!1118099 (= res!746760 (arrayNoDuplicates!0 lt!497248 #b00000000000000000000000000000000 Nil!24448))))

(declare-fun b!1118100 () Bool)

(declare-fun res!746753 () Bool)

(assert (=> b!1118100 (=> (not res!746753) (not e!636859))))

(assert (=> b!1118100 (= res!746753 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24448))))

(declare-fun b!1118101 () Bool)

(declare-fun e!636864 () Bool)

(assert (=> b!1118101 (= e!636864 (and e!636862 mapRes!43813))))

(declare-fun condMapEmpty!43813 () Bool)

(declare-fun mapDefault!43813 () ValueCell!13289)

(assert (=> b!1118101 (= condMapEmpty!43813 (= (arr!35047 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13289)) mapDefault!43813)))))

(declare-fun b!1118102 () Bool)

(assert (=> b!1118102 (= e!636859 e!636858)))

(declare-fun res!746757 () Bool)

(assert (=> b!1118102 (=> (not res!746757) (not e!636858))))

(assert (=> b!1118102 (= res!746757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497248 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118102 (= lt!497248 (array!72791 (store (arr!35048 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35586 _keys!1208)))))

(declare-fun b!1118103 () Bool)

(declare-fun e!636860 () Bool)

(assert (=> b!1118103 (= e!636858 (not e!636860))))

(declare-fun res!746755 () Bool)

(assert (=> b!1118103 (=> res!746755 e!636860)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1118103 (= res!746755 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118103 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36519 0))(
  ( (Unit!36520) )
))
(declare-fun lt!497249 () Unit!36519)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72790 (_ BitVec 64) (_ BitVec 32)) Unit!36519)

(assert (=> b!1118103 (= lt!497249 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118104 () Bool)

(declare-fun res!746756 () Bool)

(assert (=> b!1118104 (=> (not res!746756) (not e!636859))))

(assert (=> b!1118104 (= res!746756 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35586 _keys!1208))))))

(declare-fun res!746759 () Bool)

(assert (=> start!97760 (=> (not res!746759) (not e!636859))))

(assert (=> start!97760 (= res!746759 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35586 _keys!1208))))))

(assert (=> start!97760 e!636859))

(assert (=> start!97760 tp_is_empty!27997))

(declare-fun array_inv!26996 (array!72790) Bool)

(assert (=> start!97760 (array_inv!26996 _keys!1208)))

(assert (=> start!97760 true))

(assert (=> start!97760 tp!83105))

(declare-fun array_inv!26997 (array!72788) Bool)

(assert (=> start!97760 (and (array_inv!26997 _values!996) e!636864)))

(declare-fun b!1118095 () Bool)

(assert (=> b!1118095 (= e!636861 tp_is_empty!27997)))

(declare-fun b!1118105 () Bool)

(assert (=> b!1118105 (= e!636860 true)))

(declare-fun zeroValue!944 () V!42457)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42457)

(declare-datatypes ((tuple2!17688 0))(
  ( (tuple2!17689 (_1!8855 (_ BitVec 64)) (_2!8855 V!42457)) )
))
(declare-datatypes ((List!24452 0))(
  ( (Nil!24449) (Cons!24448 (h!25657 tuple2!17688) (t!34924 List!24452)) )
))
(declare-datatypes ((ListLongMap!15657 0))(
  ( (ListLongMap!15658 (toList!7844 List!24452)) )
))
(declare-fun lt!497250 () ListLongMap!15657)

(declare-fun getCurrentListMapNoExtraKeys!4353 (array!72790 array!72788 (_ BitVec 32) (_ BitVec 32) V!42457 V!42457 (_ BitVec 32) Int) ListLongMap!15657)

(assert (=> b!1118105 (= lt!497250 (getCurrentListMapNoExtraKeys!4353 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118106 () Bool)

(declare-fun res!746752 () Bool)

(assert (=> b!1118106 (=> (not res!746752) (not e!636859))))

(assert (=> b!1118106 (= res!746752 (= (select (arr!35048 _keys!1208) i!673) k0!934))))

(assert (= (and start!97760 res!746759) b!1118097))

(assert (= (and b!1118097 res!746758) b!1118098))

(assert (= (and b!1118098 res!746761) b!1118094))

(assert (= (and b!1118094 res!746754) b!1118100))

(assert (= (and b!1118100 res!746753) b!1118104))

(assert (= (and b!1118104 res!746756) b!1118096))

(assert (= (and b!1118096 res!746751) b!1118106))

(assert (= (and b!1118106 res!746752) b!1118102))

(assert (= (and b!1118102 res!746757) b!1118099))

(assert (= (and b!1118099 res!746760) b!1118103))

(assert (= (and b!1118103 (not res!746755)) b!1118105))

(assert (= (and b!1118101 condMapEmpty!43813) mapIsEmpty!43813))

(assert (= (and b!1118101 (not condMapEmpty!43813)) mapNonEmpty!43813))

(get-info :version)

(assert (= (and mapNonEmpty!43813 ((_ is ValueCellFull!13289) mapValue!43813)) b!1118095))

(assert (= (and b!1118101 ((_ is ValueCellFull!13289) mapDefault!43813)) b!1118093))

(assert (= start!97760 b!1118101))

(declare-fun m!1033209 () Bool)

(assert (=> b!1118096 m!1033209))

(declare-fun m!1033211 () Bool)

(assert (=> b!1118097 m!1033211))

(declare-fun m!1033213 () Bool)

(assert (=> b!1118094 m!1033213))

(declare-fun m!1033215 () Bool)

(assert (=> start!97760 m!1033215))

(declare-fun m!1033217 () Bool)

(assert (=> start!97760 m!1033217))

(declare-fun m!1033219 () Bool)

(assert (=> b!1118103 m!1033219))

(declare-fun m!1033221 () Bool)

(assert (=> b!1118103 m!1033221))

(declare-fun m!1033223 () Bool)

(assert (=> b!1118105 m!1033223))

(declare-fun m!1033225 () Bool)

(assert (=> b!1118099 m!1033225))

(declare-fun m!1033227 () Bool)

(assert (=> b!1118102 m!1033227))

(declare-fun m!1033229 () Bool)

(assert (=> b!1118102 m!1033229))

(declare-fun m!1033231 () Bool)

(assert (=> b!1118106 m!1033231))

(declare-fun m!1033233 () Bool)

(assert (=> mapNonEmpty!43813 m!1033233))

(declare-fun m!1033235 () Bool)

(assert (=> b!1118100 m!1033235))

(check-sat (not b!1118102) (not start!97760) (not b!1118099) (not mapNonEmpty!43813) (not b!1118094) (not b!1118105) (not b!1118100) (not b!1118097) (not b!1118096) (not b!1118103) (not b_next!23467) tp_is_empty!27997 b_and!37719)
(check-sat b_and!37719 (not b_next!23467))
