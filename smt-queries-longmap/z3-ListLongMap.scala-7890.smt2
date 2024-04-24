; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98320 () Bool)

(assert start!98320)

(declare-fun b_free!23785 () Bool)

(declare-fun b_next!23785 () Bool)

(assert (=> start!98320 (= b_free!23785 (not b_next!23785))))

(declare-fun tp!84059 () Bool)

(declare-fun b_and!38363 () Bool)

(assert (=> start!98320 (= tp!84059 b_and!38363)))

(declare-fun b!1127897 () Bool)

(declare-fun res!753341 () Bool)

(declare-fun e!642098 () Bool)

(assert (=> b!1127897 (=> (not res!753341) (not e!642098))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73537 0))(
  ( (array!73538 (arr!35415 (Array (_ BitVec 32) (_ BitVec 64))) (size!35952 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73537)

(assert (=> b!1127897 (= res!753341 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35952 _keys!1208))))))

(declare-fun b!1127898 () Bool)

(declare-fun e!642099 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((V!42881 0))(
  ( (V!42882 (val!14214 Int)) )
))
(declare-datatypes ((tuple2!17888 0))(
  ( (tuple2!17889 (_1!8955 (_ BitVec 64)) (_2!8955 V!42881)) )
))
(declare-datatypes ((List!24673 0))(
  ( (Nil!24670) (Cons!24669 (h!25887 tuple2!17888) (t!35442 List!24673)) )
))
(declare-datatypes ((ListLongMap!15865 0))(
  ( (ListLongMap!15866 (toList!7948 List!24673)) )
))
(declare-fun call!47705 () ListLongMap!15865)

(declare-fun call!47704 () ListLongMap!15865)

(declare-fun -!1124 (ListLongMap!15865 (_ BitVec 64)) ListLongMap!15865)

(assert (=> b!1127898 (= e!642099 (= call!47704 (-!1124 call!47705 k0!934)))))

(declare-fun b!1127899 () Bool)

(assert (=> b!1127899 (= e!642099 (= call!47704 call!47705))))

(declare-fun b!1127900 () Bool)

(declare-fun e!642094 () Bool)

(declare-fun tp_is_empty!28315 () Bool)

(assert (=> b!1127900 (= e!642094 tp_is_empty!28315)))

(declare-fun b!1127901 () Bool)

(declare-fun res!753335 () Bool)

(declare-fun e!642100 () Bool)

(assert (=> b!1127901 (=> (not res!753335) (not e!642100))))

(declare-fun lt!500794 () array!73537)

(declare-datatypes ((List!24674 0))(
  ( (Nil!24671) (Cons!24670 (h!25888 (_ BitVec 64)) (t!35443 List!24674)) )
))
(declare-fun arrayNoDuplicates!0 (array!73537 (_ BitVec 32) List!24674) Bool)

(assert (=> b!1127901 (= res!753335 (arrayNoDuplicates!0 lt!500794 #b00000000000000000000000000000000 Nil!24671))))

(declare-fun b!1127902 () Bool)

(declare-fun res!753342 () Bool)

(assert (=> b!1127902 (=> (not res!753342) (not e!642098))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13448 0))(
  ( (ValueCellFull!13448 (v!16843 V!42881)) (EmptyCell!13448) )
))
(declare-datatypes ((array!73539 0))(
  ( (array!73540 (arr!35416 (Array (_ BitVec 32) ValueCell!13448)) (size!35953 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73539)

(assert (=> b!1127902 (= res!753342 (and (= (size!35953 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35952 _keys!1208) (size!35953 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127903 () Bool)

(declare-fun e!642096 () Bool)

(declare-fun e!642101 () Bool)

(declare-fun mapRes!44290 () Bool)

(assert (=> b!1127903 (= e!642096 (and e!642101 mapRes!44290))))

(declare-fun condMapEmpty!44290 () Bool)

(declare-fun mapDefault!44290 () ValueCell!13448)

(assert (=> b!1127903 (= condMapEmpty!44290 (= (arr!35416 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13448)) mapDefault!44290)))))

(declare-fun b!1127904 () Bool)

(declare-fun e!642102 () Bool)

(assert (=> b!1127904 (= e!642100 (not e!642102))))

(declare-fun res!753339 () Bool)

(assert (=> b!1127904 (=> res!753339 e!642102)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1127904 (= res!753339 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127904 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36907 0))(
  ( (Unit!36908) )
))
(declare-fun lt!500791 () Unit!36907)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73537 (_ BitVec 64) (_ BitVec 32)) Unit!36907)

(assert (=> b!1127904 (= lt!500791 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1127905 () Bool)

(declare-fun res!753337 () Bool)

(assert (=> b!1127905 (=> (not res!753337) (not e!642098))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127905 (= res!753337 (validKeyInArray!0 k0!934))))

(declare-fun zeroValue!944 () V!42881)

(declare-fun bm!47702 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42881)

(declare-fun getCurrentListMapNoExtraKeys!4470 (array!73537 array!73539 (_ BitVec 32) (_ BitVec 32) V!42881 V!42881 (_ BitVec 32) Int) ListLongMap!15865)

(assert (=> bm!47702 (= call!47705 (getCurrentListMapNoExtraKeys!4470 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127906 () Bool)

(declare-fun res!753336 () Bool)

(assert (=> b!1127906 (=> (not res!753336) (not e!642098))))

(assert (=> b!1127906 (= res!753336 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24671))))

(declare-fun b!1127907 () Bool)

(declare-fun e!642095 () Bool)

(assert (=> b!1127907 (= e!642102 e!642095)))

(declare-fun res!753338 () Bool)

(assert (=> b!1127907 (=> res!753338 e!642095)))

(assert (=> b!1127907 (= res!753338 (not (= from!1455 i!673)))))

(declare-fun lt!500789 () ListLongMap!15865)

(declare-fun lt!500788 () array!73539)

(assert (=> b!1127907 (= lt!500789 (getCurrentListMapNoExtraKeys!4470 lt!500794 lt!500788 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2540 (Int (_ BitVec 64)) V!42881)

(assert (=> b!1127907 (= lt!500788 (array!73540 (store (arr!35416 _values!996) i!673 (ValueCellFull!13448 (dynLambda!2540 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35953 _values!996)))))

(declare-fun lt!500790 () ListLongMap!15865)

(assert (=> b!1127907 (= lt!500790 (getCurrentListMapNoExtraKeys!4470 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!44290 () Bool)

(assert (=> mapIsEmpty!44290 mapRes!44290))

(declare-fun b!1127908 () Bool)

(assert (=> b!1127908 (= e!642098 e!642100)))

(declare-fun res!753332 () Bool)

(assert (=> b!1127908 (=> (not res!753332) (not e!642100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73537 (_ BitVec 32)) Bool)

(assert (=> b!1127908 (= res!753332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500794 mask!1564))))

(assert (=> b!1127908 (= lt!500794 (array!73538 (store (arr!35415 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35952 _keys!1208)))))

(declare-fun b!1127909 () Bool)

(assert (=> b!1127909 (= e!642101 tp_is_empty!28315)))

(declare-fun mapNonEmpty!44290 () Bool)

(declare-fun tp!84058 () Bool)

(assert (=> mapNonEmpty!44290 (= mapRes!44290 (and tp!84058 e!642094))))

(declare-fun mapRest!44290 () (Array (_ BitVec 32) ValueCell!13448))

(declare-fun mapValue!44290 () ValueCell!13448)

(declare-fun mapKey!44290 () (_ BitVec 32))

(assert (=> mapNonEmpty!44290 (= (arr!35416 _values!996) (store mapRest!44290 mapKey!44290 mapValue!44290))))

(declare-fun b!1127910 () Bool)

(declare-fun e!642093 () Bool)

(assert (=> b!1127910 (= e!642095 e!642093)))

(declare-fun res!753331 () Bool)

(assert (=> b!1127910 (=> res!753331 e!642093)))

(assert (=> b!1127910 (= res!753331 (not (= (select (arr!35415 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1127910 e!642099))

(declare-fun c!110078 () Bool)

(assert (=> b!1127910 (= c!110078 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500792 () Unit!36907)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!385 (array!73537 array!73539 (_ BitVec 32) (_ BitVec 32) V!42881 V!42881 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36907)

(assert (=> b!1127910 (= lt!500792 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!385 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!753343 () Bool)

(assert (=> start!98320 (=> (not res!753343) (not e!642098))))

(assert (=> start!98320 (= res!753343 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35952 _keys!1208))))))

(assert (=> start!98320 e!642098))

(assert (=> start!98320 tp_is_empty!28315))

(declare-fun array_inv!27234 (array!73537) Bool)

(assert (=> start!98320 (array_inv!27234 _keys!1208)))

(assert (=> start!98320 true))

(assert (=> start!98320 tp!84059))

(declare-fun array_inv!27235 (array!73539) Bool)

(assert (=> start!98320 (and (array_inv!27235 _values!996) e!642096)))

(declare-fun bm!47701 () Bool)

(assert (=> bm!47701 (= call!47704 (getCurrentListMapNoExtraKeys!4470 lt!500794 lt!500788 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127911 () Bool)

(declare-fun res!753340 () Bool)

(assert (=> b!1127911 (=> (not res!753340) (not e!642098))))

(assert (=> b!1127911 (= res!753340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127912 () Bool)

(declare-fun res!753333 () Bool)

(assert (=> b!1127912 (=> (not res!753333) (not e!642098))))

(assert (=> b!1127912 (= res!753333 (= (select (arr!35415 _keys!1208) i!673) k0!934))))

(declare-fun b!1127913 () Bool)

(declare-fun res!753334 () Bool)

(assert (=> b!1127913 (=> (not res!753334) (not e!642098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127913 (= res!753334 (validMask!0 mask!1564))))

(declare-fun b!1127914 () Bool)

(assert (=> b!1127914 (= e!642093 true)))

(declare-fun lt!500793 () Bool)

(declare-fun contains!6493 (ListLongMap!15865 (_ BitVec 64)) Bool)

(assert (=> b!1127914 (= lt!500793 (contains!6493 (getCurrentListMapNoExtraKeys!4470 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(assert (= (and start!98320 res!753343) b!1127913))

(assert (= (and b!1127913 res!753334) b!1127902))

(assert (= (and b!1127902 res!753342) b!1127911))

(assert (= (and b!1127911 res!753340) b!1127906))

(assert (= (and b!1127906 res!753336) b!1127897))

(assert (= (and b!1127897 res!753341) b!1127905))

(assert (= (and b!1127905 res!753337) b!1127912))

(assert (= (and b!1127912 res!753333) b!1127908))

(assert (= (and b!1127908 res!753332) b!1127901))

(assert (= (and b!1127901 res!753335) b!1127904))

(assert (= (and b!1127904 (not res!753339)) b!1127907))

(assert (= (and b!1127907 (not res!753338)) b!1127910))

(assert (= (and b!1127910 c!110078) b!1127898))

(assert (= (and b!1127910 (not c!110078)) b!1127899))

(assert (= (or b!1127898 b!1127899) bm!47701))

(assert (= (or b!1127898 b!1127899) bm!47702))

(assert (= (and b!1127910 (not res!753331)) b!1127914))

(assert (= (and b!1127903 condMapEmpty!44290) mapIsEmpty!44290))

(assert (= (and b!1127903 (not condMapEmpty!44290)) mapNonEmpty!44290))

(get-info :version)

(assert (= (and mapNonEmpty!44290 ((_ is ValueCellFull!13448) mapValue!44290)) b!1127900))

(assert (= (and b!1127903 ((_ is ValueCellFull!13448) mapDefault!44290)) b!1127909))

(assert (= start!98320 b!1127903))

(declare-fun b_lambda!18765 () Bool)

(assert (=> (not b_lambda!18765) (not b!1127907)))

(declare-fun t!35441 () Bool)

(declare-fun tb!8589 () Bool)

(assert (=> (and start!98320 (= defaultEntry!1004 defaultEntry!1004) t!35441) tb!8589))

(declare-fun result!17747 () Bool)

(assert (=> tb!8589 (= result!17747 tp_is_empty!28315)))

(assert (=> b!1127907 t!35441))

(declare-fun b_and!38365 () Bool)

(assert (= b_and!38363 (and (=> t!35441 result!17747) b_and!38365)))

(declare-fun m!1042185 () Bool)

(assert (=> b!1127914 m!1042185))

(assert (=> b!1127914 m!1042185))

(declare-fun m!1042187 () Bool)

(assert (=> b!1127914 m!1042187))

(declare-fun m!1042189 () Bool)

(assert (=> b!1127904 m!1042189))

(declare-fun m!1042191 () Bool)

(assert (=> b!1127904 m!1042191))

(declare-fun m!1042193 () Bool)

(assert (=> b!1127907 m!1042193))

(declare-fun m!1042195 () Bool)

(assert (=> b!1127907 m!1042195))

(declare-fun m!1042197 () Bool)

(assert (=> b!1127907 m!1042197))

(declare-fun m!1042199 () Bool)

(assert (=> b!1127907 m!1042199))

(declare-fun m!1042201 () Bool)

(assert (=> b!1127913 m!1042201))

(declare-fun m!1042203 () Bool)

(assert (=> mapNonEmpty!44290 m!1042203))

(declare-fun m!1042205 () Bool)

(assert (=> b!1127912 m!1042205))

(declare-fun m!1042207 () Bool)

(assert (=> b!1127905 m!1042207))

(assert (=> bm!47702 m!1042185))

(declare-fun m!1042209 () Bool)

(assert (=> b!1127901 m!1042209))

(declare-fun m!1042211 () Bool)

(assert (=> bm!47701 m!1042211))

(declare-fun m!1042213 () Bool)

(assert (=> b!1127911 m!1042213))

(declare-fun m!1042215 () Bool)

(assert (=> b!1127906 m!1042215))

(declare-fun m!1042217 () Bool)

(assert (=> start!98320 m!1042217))

(declare-fun m!1042219 () Bool)

(assert (=> start!98320 m!1042219))

(declare-fun m!1042221 () Bool)

(assert (=> b!1127910 m!1042221))

(declare-fun m!1042223 () Bool)

(assert (=> b!1127910 m!1042223))

(declare-fun m!1042225 () Bool)

(assert (=> b!1127908 m!1042225))

(declare-fun m!1042227 () Bool)

(assert (=> b!1127908 m!1042227))

(declare-fun m!1042229 () Bool)

(assert (=> b!1127898 m!1042229))

(check-sat (not b!1127911) (not b!1127901) (not bm!47702) (not b_next!23785) (not b!1127908) (not b!1127906) (not mapNonEmpty!44290) tp_is_empty!28315 (not b!1127914) (not b!1127913) (not b_lambda!18765) (not b!1127898) (not bm!47701) b_and!38365 (not b!1127907) (not b!1127904) (not b!1127905) (not start!98320) (not b!1127910))
(check-sat b_and!38365 (not b_next!23785))
