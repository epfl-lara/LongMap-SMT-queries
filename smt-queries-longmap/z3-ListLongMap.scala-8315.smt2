; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101474 () Bool)

(assert start!101474)

(declare-fun b_free!26161 () Bool)

(declare-fun b_next!26161 () Bool)

(assert (=> start!101474 (= b_free!26161 (not b_next!26161))))

(declare-fun tp!91505 () Bool)

(declare-fun b_and!43441 () Bool)

(assert (=> start!101474 (= tp!91505 b_and!43441)))

(declare-fun b!1217103 () Bool)

(declare-fun res!807801 () Bool)

(declare-fun e!691156 () Bool)

(assert (=> b!1217103 (=> (not res!807801) (not e!691156))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217103 (= res!807801 (validKeyInArray!0 k0!934))))

(declare-fun b!1217104 () Bool)

(declare-fun e!691158 () Bool)

(assert (=> b!1217104 (= e!691158 true)))

(declare-datatypes ((V!46281 0))(
  ( (V!46282 (val!15489 Int)) )
))
(declare-fun zeroValue!944 () V!46281)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19924 0))(
  ( (tuple2!19925 (_1!9973 (_ BitVec 64)) (_2!9973 V!46281)) )
))
(declare-datatypes ((List!26731 0))(
  ( (Nil!26728) (Cons!26727 (h!27945 tuple2!19924) (t!39864 List!26731)) )
))
(declare-datatypes ((ListLongMap!17901 0))(
  ( (ListLongMap!17902 (toList!8966 List!26731)) )
))
(declare-fun lt!553200 () ListLongMap!17901)

(declare-datatypes ((ValueCell!14723 0))(
  ( (ValueCellFull!14723 (v!18138 V!46281)) (EmptyCell!14723) )
))
(declare-datatypes ((array!78545 0))(
  ( (array!78546 (arr!37901 (Array (_ BitVec 32) ValueCell!14723)) (size!38438 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78545)

(declare-datatypes ((array!78547 0))(
  ( (array!78548 (arr!37902 (Array (_ BitVec 32) (_ BitVec 64))) (size!38439 (_ BitVec 32))) )
))
(declare-fun lt!553199 () array!78547)

(declare-fun minValue!944 () V!46281)

(declare-fun getCurrentListMapNoExtraKeys!5423 (array!78547 array!78545 (_ BitVec 32) (_ BitVec 32) V!46281 V!46281 (_ BitVec 32) Int) ListLongMap!17901)

(declare-fun dynLambda!3335 (Int (_ BitVec 64)) V!46281)

(assert (=> b!1217104 (= lt!553200 (getCurrentListMapNoExtraKeys!5423 lt!553199 (array!78546 (store (arr!37901 _values!996) i!673 (ValueCellFull!14723 (dynLambda!3335 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38438 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!78547)

(declare-fun lt!553198 () ListLongMap!17901)

(assert (=> b!1217104 (= lt!553198 (getCurrentListMapNoExtraKeys!5423 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!48172 () Bool)

(declare-fun mapRes!48172 () Bool)

(declare-fun tp!91504 () Bool)

(declare-fun e!691154 () Bool)

(assert (=> mapNonEmpty!48172 (= mapRes!48172 (and tp!91504 e!691154))))

(declare-fun mapKey!48172 () (_ BitVec 32))

(declare-fun mapRest!48172 () (Array (_ BitVec 32) ValueCell!14723))

(declare-fun mapValue!48172 () ValueCell!14723)

(assert (=> mapNonEmpty!48172 (= (arr!37901 _values!996) (store mapRest!48172 mapKey!48172 mapValue!48172))))

(declare-fun b!1217105 () Bool)

(declare-fun e!691157 () Bool)

(declare-fun e!691153 () Bool)

(assert (=> b!1217105 (= e!691157 (and e!691153 mapRes!48172))))

(declare-fun condMapEmpty!48172 () Bool)

(declare-fun mapDefault!48172 () ValueCell!14723)

(assert (=> b!1217105 (= condMapEmpty!48172 (= (arr!37901 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14723)) mapDefault!48172)))))

(declare-fun mapIsEmpty!48172 () Bool)

(assert (=> mapIsEmpty!48172 mapRes!48172))

(declare-fun b!1217106 () Bool)

(declare-fun res!807795 () Bool)

(assert (=> b!1217106 (=> (not res!807795) (not e!691156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217106 (= res!807795 (validMask!0 mask!1564))))

(declare-fun b!1217107 () Bool)

(declare-fun res!807793 () Bool)

(assert (=> b!1217107 (=> (not res!807793) (not e!691156))))

(assert (=> b!1217107 (= res!807793 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38439 _keys!1208))))))

(declare-fun b!1217108 () Bool)

(declare-fun res!807802 () Bool)

(assert (=> b!1217108 (=> (not res!807802) (not e!691156))))

(declare-datatypes ((List!26732 0))(
  ( (Nil!26729) (Cons!26728 (h!27946 (_ BitVec 64)) (t!39865 List!26732)) )
))
(declare-fun arrayNoDuplicates!0 (array!78547 (_ BitVec 32) List!26732) Bool)

(assert (=> b!1217108 (= res!807802 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26729))))

(declare-fun b!1217109 () Bool)

(declare-fun tp_is_empty!30865 () Bool)

(assert (=> b!1217109 (= e!691154 tp_is_empty!30865)))

(declare-fun res!807800 () Bool)

(assert (=> start!101474 (=> (not res!807800) (not e!691156))))

(assert (=> start!101474 (= res!807800 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38439 _keys!1208))))))

(assert (=> start!101474 e!691156))

(assert (=> start!101474 tp_is_empty!30865))

(declare-fun array_inv!28922 (array!78547) Bool)

(assert (=> start!101474 (array_inv!28922 _keys!1208)))

(assert (=> start!101474 true))

(assert (=> start!101474 tp!91505))

(declare-fun array_inv!28923 (array!78545) Bool)

(assert (=> start!101474 (and (array_inv!28923 _values!996) e!691157)))

(declare-fun b!1217110 () Bool)

(declare-fun e!691155 () Bool)

(assert (=> b!1217110 (= e!691156 e!691155)))

(declare-fun res!807796 () Bool)

(assert (=> b!1217110 (=> (not res!807796) (not e!691155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78547 (_ BitVec 32)) Bool)

(assert (=> b!1217110 (= res!807796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553199 mask!1564))))

(assert (=> b!1217110 (= lt!553199 (array!78548 (store (arr!37902 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38439 _keys!1208)))))

(declare-fun b!1217111 () Bool)

(declare-fun res!807798 () Bool)

(assert (=> b!1217111 (=> (not res!807798) (not e!691156))))

(assert (=> b!1217111 (= res!807798 (= (select (arr!37902 _keys!1208) i!673) k0!934))))

(declare-fun b!1217112 () Bool)

(declare-fun res!807792 () Bool)

(assert (=> b!1217112 (=> (not res!807792) (not e!691155))))

(assert (=> b!1217112 (= res!807792 (arrayNoDuplicates!0 lt!553199 #b00000000000000000000000000000000 Nil!26729))))

(declare-fun b!1217113 () Bool)

(declare-fun res!807799 () Bool)

(assert (=> b!1217113 (=> (not res!807799) (not e!691156))))

(assert (=> b!1217113 (= res!807799 (and (= (size!38438 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38439 _keys!1208) (size!38438 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217114 () Bool)

(declare-fun res!807797 () Bool)

(assert (=> b!1217114 (=> (not res!807797) (not e!691156))))

(assert (=> b!1217114 (= res!807797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217115 () Bool)

(assert (=> b!1217115 (= e!691155 (not e!691158))))

(declare-fun res!807794 () Bool)

(assert (=> b!1217115 (=> res!807794 e!691158)))

(assert (=> b!1217115 (= res!807794 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217115 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40286 0))(
  ( (Unit!40287) )
))
(declare-fun lt!553197 () Unit!40286)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78547 (_ BitVec 64) (_ BitVec 32)) Unit!40286)

(assert (=> b!1217115 (= lt!553197 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217116 () Bool)

(assert (=> b!1217116 (= e!691153 tp_is_empty!30865)))

(assert (= (and start!101474 res!807800) b!1217106))

(assert (= (and b!1217106 res!807795) b!1217113))

(assert (= (and b!1217113 res!807799) b!1217114))

(assert (= (and b!1217114 res!807797) b!1217108))

(assert (= (and b!1217108 res!807802) b!1217107))

(assert (= (and b!1217107 res!807793) b!1217103))

(assert (= (and b!1217103 res!807801) b!1217111))

(assert (= (and b!1217111 res!807798) b!1217110))

(assert (= (and b!1217110 res!807796) b!1217112))

(assert (= (and b!1217112 res!807792) b!1217115))

(assert (= (and b!1217115 (not res!807794)) b!1217104))

(assert (= (and b!1217105 condMapEmpty!48172) mapIsEmpty!48172))

(assert (= (and b!1217105 (not condMapEmpty!48172)) mapNonEmpty!48172))

(get-info :version)

(assert (= (and mapNonEmpty!48172 ((_ is ValueCellFull!14723) mapValue!48172)) b!1217109))

(assert (= (and b!1217105 ((_ is ValueCellFull!14723) mapDefault!48172)) b!1217116))

(assert (= start!101474 b!1217105))

(declare-fun b_lambda!21831 () Bool)

(assert (=> (not b_lambda!21831) (not b!1217104)))

(declare-fun t!39863 () Bool)

(declare-fun tb!10953 () Bool)

(assert (=> (and start!101474 (= defaultEntry!1004 defaultEntry!1004) t!39863) tb!10953))

(declare-fun result!22511 () Bool)

(assert (=> tb!10953 (= result!22511 tp_is_empty!30865)))

(assert (=> b!1217104 t!39863))

(declare-fun b_and!43443 () Bool)

(assert (= b_and!43441 (and (=> t!39863 result!22511) b_and!43443)))

(declare-fun m!1122291 () Bool)

(assert (=> b!1217106 m!1122291))

(declare-fun m!1122293 () Bool)

(assert (=> mapNonEmpty!48172 m!1122293))

(declare-fun m!1122295 () Bool)

(assert (=> b!1217104 m!1122295))

(declare-fun m!1122297 () Bool)

(assert (=> b!1217104 m!1122297))

(declare-fun m!1122299 () Bool)

(assert (=> b!1217104 m!1122299))

(declare-fun m!1122301 () Bool)

(assert (=> b!1217104 m!1122301))

(declare-fun m!1122303 () Bool)

(assert (=> b!1217103 m!1122303))

(declare-fun m!1122305 () Bool)

(assert (=> b!1217115 m!1122305))

(declare-fun m!1122307 () Bool)

(assert (=> b!1217115 m!1122307))

(declare-fun m!1122309 () Bool)

(assert (=> b!1217110 m!1122309))

(declare-fun m!1122311 () Bool)

(assert (=> b!1217110 m!1122311))

(declare-fun m!1122313 () Bool)

(assert (=> b!1217108 m!1122313))

(declare-fun m!1122315 () Bool)

(assert (=> b!1217111 m!1122315))

(declare-fun m!1122317 () Bool)

(assert (=> start!101474 m!1122317))

(declare-fun m!1122319 () Bool)

(assert (=> start!101474 m!1122319))

(declare-fun m!1122321 () Bool)

(assert (=> b!1217114 m!1122321))

(declare-fun m!1122323 () Bool)

(assert (=> b!1217112 m!1122323))

(check-sat b_and!43443 (not start!101474) (not b!1217104) (not b_next!26161) (not b!1217114) (not b!1217112) tp_is_empty!30865 (not b!1217110) (not mapNonEmpty!48172) (not b!1217115) (not b!1217106) (not b!1217108) (not b!1217103) (not b_lambda!21831))
(check-sat b_and!43443 (not b_next!26161))
