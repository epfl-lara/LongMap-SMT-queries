; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98104 () Bool)

(assert start!98104)

(declare-fun b_free!23805 () Bool)

(declare-fun b_next!23805 () Bool)

(assert (=> start!98104 (= b_free!23805 (not b_next!23805))))

(declare-fun tp!84118 () Bool)

(declare-fun b_and!38393 () Bool)

(assert (=> start!98104 (= tp!84118 b_and!38393)))

(declare-fun b!1127139 () Bool)

(declare-fun res!753208 () Bool)

(declare-fun e!641541 () Bool)

(assert (=> b!1127139 (=> (not res!753208) (not e!641541))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127139 (= res!753208 (validKeyInArray!0 k0!934))))

(declare-datatypes ((array!73531 0))(
  ( (array!73532 (arr!35418 (Array (_ BitVec 32) (_ BitVec 64))) (size!35954 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73531)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!42907 0))(
  ( (V!42908 (val!14224 Int)) )
))
(declare-datatypes ((ValueCell!13458 0))(
  ( (ValueCellFull!13458 (v!16857 V!42907)) (EmptyCell!13458) )
))
(declare-datatypes ((array!73533 0))(
  ( (array!73534 (arr!35419 (Array (_ BitVec 32) ValueCell!13458)) (size!35955 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73533)

(declare-fun minValue!944 () V!42907)

(declare-fun zeroValue!944 () V!42907)

(declare-fun bm!47694 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!17888 0))(
  ( (tuple2!17889 (_1!8955 (_ BitVec 64)) (_2!8955 V!42907)) )
))
(declare-datatypes ((List!24660 0))(
  ( (Nil!24657) (Cons!24656 (h!25865 tuple2!17888) (t!35457 List!24660)) )
))
(declare-datatypes ((ListLongMap!15857 0))(
  ( (ListLongMap!15858 (toList!7944 List!24660)) )
))
(declare-fun call!47697 () ListLongMap!15857)

(declare-fun getCurrentListMapNoExtraKeys!4432 (array!73531 array!73533 (_ BitVec 32) (_ BitVec 32) V!42907 V!42907 (_ BitVec 32) Int) ListLongMap!15857)

(assert (=> bm!47694 (= call!47697 (getCurrentListMapNoExtraKeys!4432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127140 () Bool)

(declare-fun e!641538 () Bool)

(declare-fun tp_is_empty!28335 () Bool)

(assert (=> b!1127140 (= e!641538 tp_is_empty!28335)))

(declare-fun mapNonEmpty!44320 () Bool)

(declare-fun mapRes!44320 () Bool)

(declare-fun tp!84119 () Bool)

(declare-fun e!641545 () Bool)

(assert (=> mapNonEmpty!44320 (= mapRes!44320 (and tp!84119 e!641545))))

(declare-fun mapKey!44320 () (_ BitVec 32))

(declare-fun mapRest!44320 () (Array (_ BitVec 32) ValueCell!13458))

(declare-fun mapValue!44320 () ValueCell!13458)

(assert (=> mapNonEmpty!44320 (= (arr!35419 _values!996) (store mapRest!44320 mapKey!44320 mapValue!44320))))

(declare-fun mapIsEmpty!44320 () Bool)

(assert (=> mapIsEmpty!44320 mapRes!44320))

(declare-fun call!47698 () ListLongMap!15857)

(declare-fun lt!500476 () array!73533)

(declare-fun bm!47695 () Bool)

(declare-fun lt!500478 () array!73531)

(assert (=> bm!47695 (= call!47698 (getCurrentListMapNoExtraKeys!4432 lt!500478 lt!500476 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127141 () Bool)

(declare-fun e!641540 () Bool)

(assert (=> b!1127141 (= e!641540 (= call!47698 call!47697))))

(declare-fun b!1127142 () Bool)

(declare-fun e!641543 () Bool)

(declare-fun e!641546 () Bool)

(assert (=> b!1127142 (= e!641543 e!641546)))

(declare-fun res!753212 () Bool)

(assert (=> b!1127142 (=> res!753212 e!641546)))

(assert (=> b!1127142 (= res!753212 (not (= (select (arr!35418 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1127142 e!641540))

(declare-fun c!109698 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127142 (= c!109698 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36934 0))(
  ( (Unit!36935) )
))
(declare-fun lt!500479 () Unit!36934)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!387 (array!73531 array!73533 (_ BitVec 32) (_ BitVec 32) V!42907 V!42907 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36934)

(assert (=> b!1127142 (= lt!500479 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!387 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127143 () Bool)

(declare-fun res!753220 () Bool)

(declare-fun e!641539 () Bool)

(assert (=> b!1127143 (=> (not res!753220) (not e!641539))))

(declare-datatypes ((List!24661 0))(
  ( (Nil!24658) (Cons!24657 (h!25866 (_ BitVec 64)) (t!35458 List!24661)) )
))
(declare-fun arrayNoDuplicates!0 (array!73531 (_ BitVec 32) List!24661) Bool)

(assert (=> b!1127143 (= res!753220 (arrayNoDuplicates!0 lt!500478 #b00000000000000000000000000000000 Nil!24658))))

(declare-fun b!1127144 () Bool)

(declare-fun e!641544 () Bool)

(assert (=> b!1127144 (= e!641544 (and e!641538 mapRes!44320))))

(declare-fun condMapEmpty!44320 () Bool)

(declare-fun mapDefault!44320 () ValueCell!13458)

(assert (=> b!1127144 (= condMapEmpty!44320 (= (arr!35419 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13458)) mapDefault!44320)))))

(declare-fun b!1127145 () Bool)

(declare-fun res!753216 () Bool)

(assert (=> b!1127145 (=> (not res!753216) (not e!641541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127145 (= res!753216 (validMask!0 mask!1564))))

(declare-fun b!1127146 () Bool)

(assert (=> b!1127146 (= e!641545 tp_is_empty!28335)))

(declare-fun b!1127147 () Bool)

(declare-fun -!1134 (ListLongMap!15857 (_ BitVec 64)) ListLongMap!15857)

(assert (=> b!1127147 (= e!641540 (= call!47698 (-!1134 call!47697 k0!934)))))

(declare-fun b!1127148 () Bool)

(assert (=> b!1127148 (= e!641541 e!641539)))

(declare-fun res!753213 () Bool)

(assert (=> b!1127148 (=> (not res!753213) (not e!641539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73531 (_ BitVec 32)) Bool)

(assert (=> b!1127148 (= res!753213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500478 mask!1564))))

(assert (=> b!1127148 (= lt!500478 (array!73532 (store (arr!35418 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35954 _keys!1208)))))

(declare-fun b!1127149 () Bool)

(declare-fun e!641542 () Bool)

(assert (=> b!1127149 (= e!641542 e!641543)))

(declare-fun res!753215 () Bool)

(assert (=> b!1127149 (=> res!753215 e!641543)))

(assert (=> b!1127149 (= res!753215 (not (= from!1455 i!673)))))

(declare-fun lt!500480 () ListLongMap!15857)

(assert (=> b!1127149 (= lt!500480 (getCurrentListMapNoExtraKeys!4432 lt!500478 lt!500476 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2519 (Int (_ BitVec 64)) V!42907)

(assert (=> b!1127149 (= lt!500476 (array!73534 (store (arr!35419 _values!996) i!673 (ValueCellFull!13458 (dynLambda!2519 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35955 _values!996)))))

(declare-fun lt!500475 () ListLongMap!15857)

(assert (=> b!1127149 (= lt!500475 (getCurrentListMapNoExtraKeys!4432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127150 () Bool)

(declare-fun res!753219 () Bool)

(assert (=> b!1127150 (=> (not res!753219) (not e!641541))))

(assert (=> b!1127150 (= res!753219 (and (= (size!35955 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35954 _keys!1208) (size!35955 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127151 () Bool)

(declare-fun res!753211 () Bool)

(assert (=> b!1127151 (=> (not res!753211) (not e!641541))))

(assert (=> b!1127151 (= res!753211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127152 () Bool)

(declare-fun res!753217 () Bool)

(assert (=> b!1127152 (=> (not res!753217) (not e!641541))))

(assert (=> b!1127152 (= res!753217 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24658))))

(declare-fun b!1127153 () Bool)

(assert (=> b!1127153 (= e!641546 true)))

(declare-fun lt!500477 () Bool)

(declare-fun contains!6475 (ListLongMap!15857 (_ BitVec 64)) Bool)

(assert (=> b!1127153 (= lt!500477 (contains!6475 (getCurrentListMapNoExtraKeys!4432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1127154 () Bool)

(declare-fun res!753218 () Bool)

(assert (=> b!1127154 (=> (not res!753218) (not e!641541))))

(assert (=> b!1127154 (= res!753218 (= (select (arr!35418 _keys!1208) i!673) k0!934))))

(declare-fun b!1127155 () Bool)

(declare-fun res!753209 () Bool)

(assert (=> b!1127155 (=> (not res!753209) (not e!641541))))

(assert (=> b!1127155 (= res!753209 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35954 _keys!1208))))))

(declare-fun b!1127156 () Bool)

(assert (=> b!1127156 (= e!641539 (not e!641542))))

(declare-fun res!753210 () Bool)

(assert (=> b!1127156 (=> res!753210 e!641542)))

(assert (=> b!1127156 (= res!753210 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127156 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500474 () Unit!36934)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73531 (_ BitVec 64) (_ BitVec 32)) Unit!36934)

(assert (=> b!1127156 (= lt!500474 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!753214 () Bool)

(assert (=> start!98104 (=> (not res!753214) (not e!641541))))

(assert (=> start!98104 (= res!753214 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35954 _keys!1208))))))

(assert (=> start!98104 e!641541))

(assert (=> start!98104 tp_is_empty!28335))

(declare-fun array_inv!27180 (array!73531) Bool)

(assert (=> start!98104 (array_inv!27180 _keys!1208)))

(assert (=> start!98104 true))

(assert (=> start!98104 tp!84118))

(declare-fun array_inv!27181 (array!73533) Bool)

(assert (=> start!98104 (and (array_inv!27181 _values!996) e!641544)))

(assert (= (and start!98104 res!753214) b!1127145))

(assert (= (and b!1127145 res!753216) b!1127150))

(assert (= (and b!1127150 res!753219) b!1127151))

(assert (= (and b!1127151 res!753211) b!1127152))

(assert (= (and b!1127152 res!753217) b!1127155))

(assert (= (and b!1127155 res!753209) b!1127139))

(assert (= (and b!1127139 res!753208) b!1127154))

(assert (= (and b!1127154 res!753218) b!1127148))

(assert (= (and b!1127148 res!753213) b!1127143))

(assert (= (and b!1127143 res!753220) b!1127156))

(assert (= (and b!1127156 (not res!753210)) b!1127149))

(assert (= (and b!1127149 (not res!753215)) b!1127142))

(assert (= (and b!1127142 c!109698) b!1127147))

(assert (= (and b!1127142 (not c!109698)) b!1127141))

(assert (= (or b!1127147 b!1127141) bm!47695))

(assert (= (or b!1127147 b!1127141) bm!47694))

(assert (= (and b!1127142 (not res!753212)) b!1127153))

(assert (= (and b!1127144 condMapEmpty!44320) mapIsEmpty!44320))

(assert (= (and b!1127144 (not condMapEmpty!44320)) mapNonEmpty!44320))

(get-info :version)

(assert (= (and mapNonEmpty!44320 ((_ is ValueCellFull!13458) mapValue!44320)) b!1127146))

(assert (= (and b!1127144 ((_ is ValueCellFull!13458) mapDefault!44320)) b!1127140))

(assert (= start!98104 b!1127144))

(declare-fun b_lambda!18775 () Bool)

(assert (=> (not b_lambda!18775) (not b!1127149)))

(declare-fun t!35456 () Bool)

(declare-fun tb!8617 () Bool)

(assert (=> (and start!98104 (= defaultEntry!1004 defaultEntry!1004) t!35456) tb!8617))

(declare-fun result!17795 () Bool)

(assert (=> tb!8617 (= result!17795 tp_is_empty!28335)))

(assert (=> b!1127149 t!35456))

(declare-fun b_and!38395 () Bool)

(assert (= b_and!38393 (and (=> t!35456 result!17795) b_and!38395)))

(declare-fun m!1040971 () Bool)

(assert (=> bm!47695 m!1040971))

(declare-fun m!1040973 () Bool)

(assert (=> b!1127152 m!1040973))

(declare-fun m!1040975 () Bool)

(assert (=> b!1127148 m!1040975))

(declare-fun m!1040977 () Bool)

(assert (=> b!1127148 m!1040977))

(declare-fun m!1040979 () Bool)

(assert (=> b!1127153 m!1040979))

(assert (=> b!1127153 m!1040979))

(declare-fun m!1040981 () Bool)

(assert (=> b!1127153 m!1040981))

(declare-fun m!1040983 () Bool)

(assert (=> b!1127154 m!1040983))

(declare-fun m!1040985 () Bool)

(assert (=> b!1127156 m!1040985))

(declare-fun m!1040987 () Bool)

(assert (=> b!1127156 m!1040987))

(declare-fun m!1040989 () Bool)

(assert (=> b!1127151 m!1040989))

(declare-fun m!1040991 () Bool)

(assert (=> mapNonEmpty!44320 m!1040991))

(declare-fun m!1040993 () Bool)

(assert (=> b!1127147 m!1040993))

(declare-fun m!1040995 () Bool)

(assert (=> b!1127139 m!1040995))

(assert (=> bm!47694 m!1040979))

(declare-fun m!1040997 () Bool)

(assert (=> start!98104 m!1040997))

(declare-fun m!1040999 () Bool)

(assert (=> start!98104 m!1040999))

(declare-fun m!1041001 () Bool)

(assert (=> b!1127145 m!1041001))

(declare-fun m!1041003 () Bool)

(assert (=> b!1127143 m!1041003))

(declare-fun m!1041005 () Bool)

(assert (=> b!1127142 m!1041005))

(declare-fun m!1041007 () Bool)

(assert (=> b!1127142 m!1041007))

(declare-fun m!1041009 () Bool)

(assert (=> b!1127149 m!1041009))

(declare-fun m!1041011 () Bool)

(assert (=> b!1127149 m!1041011))

(declare-fun m!1041013 () Bool)

(assert (=> b!1127149 m!1041013))

(declare-fun m!1041015 () Bool)

(assert (=> b!1127149 m!1041015))

(check-sat (not b!1127142) (not b!1127152) tp_is_empty!28335 (not b!1127139) (not b!1127153) b_and!38395 (not b_next!23805) (not b!1127149) (not b_lambda!18775) (not b!1127151) (not b!1127145) (not b!1127148) (not b!1127147) (not mapNonEmpty!44320) (not start!98104) (not bm!47695) (not bm!47694) (not b!1127156) (not b!1127143))
(check-sat b_and!38395 (not b_next!23805))
