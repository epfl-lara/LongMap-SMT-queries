; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97936 () Bool)

(assert start!97936)

(declare-fun b_free!23637 () Bool)

(declare-fun b_next!23637 () Bool)

(assert (=> start!97936 (= b_free!23637 (not b_next!23637))))

(declare-fun tp!83614 () Bool)

(declare-fun b_and!38057 () Bool)

(assert (=> start!97936 (= tp!83614 b_and!38057)))

(declare-fun b!1122237 () Bool)

(declare-fun res!749739 () Bool)

(declare-fun e!638934 () Bool)

(assert (=> b!1122237 (=> (not res!749739) (not e!638934))))

(declare-datatypes ((array!73213 0))(
  ( (array!73214 (arr!35259 (Array (_ BitVec 32) (_ BitVec 64))) (size!35795 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73213)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73213 (_ BitVec 32)) Bool)

(assert (=> b!1122237 (= res!749739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!749744 () Bool)

(assert (=> start!97936 (=> (not res!749744) (not e!638934))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97936 (= res!749744 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35795 _keys!1208))))))

(assert (=> start!97936 e!638934))

(declare-fun tp_is_empty!28167 () Bool)

(assert (=> start!97936 tp_is_empty!28167))

(declare-fun array_inv!27070 (array!73213) Bool)

(assert (=> start!97936 (array_inv!27070 _keys!1208)))

(assert (=> start!97936 true))

(assert (=> start!97936 tp!83614))

(declare-datatypes ((V!42683 0))(
  ( (V!42684 (val!14140 Int)) )
))
(declare-datatypes ((ValueCell!13374 0))(
  ( (ValueCellFull!13374 (v!16773 V!42683)) (EmptyCell!13374) )
))
(declare-datatypes ((array!73215 0))(
  ( (array!73216 (arr!35260 (Array (_ BitVec 32) ValueCell!13374)) (size!35796 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73215)

(declare-fun e!638932 () Bool)

(declare-fun array_inv!27071 (array!73215) Bool)

(assert (=> start!97936 (and (array_inv!27071 _values!996) e!638932)))

(declare-fun b!1122238 () Bool)

(declare-fun e!638937 () Bool)

(declare-datatypes ((tuple2!17754 0))(
  ( (tuple2!17755 (_1!8888 (_ BitVec 64)) (_2!8888 V!42683)) )
))
(declare-datatypes ((List!24534 0))(
  ( (Nil!24531) (Cons!24530 (h!25739 tuple2!17754) (t!35163 List!24534)) )
))
(declare-datatypes ((ListLongMap!15723 0))(
  ( (ListLongMap!15724 (toList!7877 List!24534)) )
))
(declare-fun call!47193 () ListLongMap!15723)

(declare-fun call!47194 () ListLongMap!15723)

(assert (=> b!1122238 (= e!638937 (= call!47193 call!47194))))

(declare-fun b!1122239 () Bool)

(declare-fun res!749743 () Bool)

(assert (=> b!1122239 (=> (not res!749743) (not e!638934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1122239 (= res!749743 (= (select (arr!35259 _keys!1208) i!673) k0!934))))

(declare-fun b!1122240 () Bool)

(declare-fun e!638933 () Bool)

(declare-fun e!638935 () Bool)

(assert (=> b!1122240 (= e!638933 e!638935)))

(declare-fun res!749735 () Bool)

(assert (=> b!1122240 (=> res!749735 e!638935)))

(assert (=> b!1122240 (= res!749735 (not (= (select (arr!35259 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1122240 e!638937))

(declare-fun c!109446 () Bool)

(assert (=> b!1122240 (= c!109446 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((Unit!36810 0))(
  ( (Unit!36811) )
))
(declare-fun lt!498643 () Unit!36810)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42683)

(declare-fun zeroValue!944 () V!42683)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!332 (array!73213 array!73215 (_ BitVec 32) (_ BitVec 32) V!42683 V!42683 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36810)

(assert (=> b!1122240 (= lt!498643 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!332 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122241 () Bool)

(declare-fun res!749741 () Bool)

(assert (=> b!1122241 (=> (not res!749741) (not e!638934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122241 (= res!749741 (validKeyInArray!0 k0!934))))

(declare-fun b!1122242 () Bool)

(declare-fun e!638931 () Bool)

(assert (=> b!1122242 (= e!638931 e!638933)))

(declare-fun res!749745 () Bool)

(assert (=> b!1122242 (=> res!749745 e!638933)))

(assert (=> b!1122242 (= res!749745 (not (= from!1455 i!673)))))

(declare-fun lt!498641 () array!73213)

(declare-fun lt!498638 () array!73215)

(declare-fun lt!498640 () ListLongMap!15723)

(declare-fun getCurrentListMapNoExtraKeys!4366 (array!73213 array!73215 (_ BitVec 32) (_ BitVec 32) V!42683 V!42683 (_ BitVec 32) Int) ListLongMap!15723)

(assert (=> b!1122242 (= lt!498640 (getCurrentListMapNoExtraKeys!4366 lt!498641 lt!498638 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2462 (Int (_ BitVec 64)) V!42683)

(assert (=> b!1122242 (= lt!498638 (array!73216 (store (arr!35260 _values!996) i!673 (ValueCellFull!13374 (dynLambda!2462 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35796 _values!996)))))

(declare-fun lt!498642 () ListLongMap!15723)

(assert (=> b!1122242 (= lt!498642 (getCurrentListMapNoExtraKeys!4366 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1122243 () Bool)

(declare-fun e!638928 () Bool)

(assert (=> b!1122243 (= e!638934 e!638928)))

(declare-fun res!749738 () Bool)

(assert (=> b!1122243 (=> (not res!749738) (not e!638928))))

(assert (=> b!1122243 (= res!749738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498641 mask!1564))))

(assert (=> b!1122243 (= lt!498641 (array!73214 (store (arr!35259 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35795 _keys!1208)))))

(declare-fun b!1122244 () Bool)

(declare-fun e!638930 () Bool)

(declare-fun mapRes!44068 () Bool)

(assert (=> b!1122244 (= e!638932 (and e!638930 mapRes!44068))))

(declare-fun condMapEmpty!44068 () Bool)

(declare-fun mapDefault!44068 () ValueCell!13374)

(assert (=> b!1122244 (= condMapEmpty!44068 (= (arr!35260 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13374)) mapDefault!44068)))))

(declare-fun b!1122245 () Bool)

(assert (=> b!1122245 (= e!638935 true)))

(declare-fun lt!498644 () Bool)

(declare-fun contains!6421 (ListLongMap!15723 (_ BitVec 64)) Bool)

(assert (=> b!1122245 (= lt!498644 (contains!6421 (getCurrentListMapNoExtraKeys!4366 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1122246 () Bool)

(declare-fun -!1084 (ListLongMap!15723 (_ BitVec 64)) ListLongMap!15723)

(assert (=> b!1122246 (= e!638937 (= call!47193 (-!1084 call!47194 k0!934)))))

(declare-fun b!1122247 () Bool)

(declare-fun res!749737 () Bool)

(assert (=> b!1122247 (=> (not res!749737) (not e!638934))))

(assert (=> b!1122247 (= res!749737 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35795 _keys!1208))))))

(declare-fun bm!47190 () Bool)

(assert (=> bm!47190 (= call!47193 (getCurrentListMapNoExtraKeys!4366 lt!498641 lt!498638 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44068 () Bool)

(declare-fun tp!83615 () Bool)

(declare-fun e!638936 () Bool)

(assert (=> mapNonEmpty!44068 (= mapRes!44068 (and tp!83615 e!638936))))

(declare-fun mapRest!44068 () (Array (_ BitVec 32) ValueCell!13374))

(declare-fun mapKey!44068 () (_ BitVec 32))

(declare-fun mapValue!44068 () ValueCell!13374)

(assert (=> mapNonEmpty!44068 (= (arr!35260 _values!996) (store mapRest!44068 mapKey!44068 mapValue!44068))))

(declare-fun b!1122248 () Bool)

(declare-fun res!749734 () Bool)

(assert (=> b!1122248 (=> (not res!749734) (not e!638934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122248 (= res!749734 (validMask!0 mask!1564))))

(declare-fun bm!47191 () Bool)

(assert (=> bm!47191 (= call!47194 (getCurrentListMapNoExtraKeys!4366 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44068 () Bool)

(assert (=> mapIsEmpty!44068 mapRes!44068))

(declare-fun b!1122249 () Bool)

(assert (=> b!1122249 (= e!638936 tp_is_empty!28167)))

(declare-fun b!1122250 () Bool)

(declare-fun res!749736 () Bool)

(assert (=> b!1122250 (=> (not res!749736) (not e!638934))))

(declare-datatypes ((List!24535 0))(
  ( (Nil!24532) (Cons!24531 (h!25740 (_ BitVec 64)) (t!35164 List!24535)) )
))
(declare-fun arrayNoDuplicates!0 (array!73213 (_ BitVec 32) List!24535) Bool)

(assert (=> b!1122250 (= res!749736 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24532))))

(declare-fun b!1122251 () Bool)

(assert (=> b!1122251 (= e!638928 (not e!638931))))

(declare-fun res!749740 () Bool)

(assert (=> b!1122251 (=> res!749740 e!638931)))

(assert (=> b!1122251 (= res!749740 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122251 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498639 () Unit!36810)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73213 (_ BitVec 64) (_ BitVec 32)) Unit!36810)

(assert (=> b!1122251 (= lt!498639 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1122252 () Bool)

(assert (=> b!1122252 (= e!638930 tp_is_empty!28167)))

(declare-fun b!1122253 () Bool)

(declare-fun res!749742 () Bool)

(assert (=> b!1122253 (=> (not res!749742) (not e!638934))))

(assert (=> b!1122253 (= res!749742 (and (= (size!35796 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35795 _keys!1208) (size!35796 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1122254 () Bool)

(declare-fun res!749746 () Bool)

(assert (=> b!1122254 (=> (not res!749746) (not e!638928))))

(assert (=> b!1122254 (= res!749746 (arrayNoDuplicates!0 lt!498641 #b00000000000000000000000000000000 Nil!24532))))

(assert (= (and start!97936 res!749744) b!1122248))

(assert (= (and b!1122248 res!749734) b!1122253))

(assert (= (and b!1122253 res!749742) b!1122237))

(assert (= (and b!1122237 res!749739) b!1122250))

(assert (= (and b!1122250 res!749736) b!1122247))

(assert (= (and b!1122247 res!749737) b!1122241))

(assert (= (and b!1122241 res!749741) b!1122239))

(assert (= (and b!1122239 res!749743) b!1122243))

(assert (= (and b!1122243 res!749738) b!1122254))

(assert (= (and b!1122254 res!749746) b!1122251))

(assert (= (and b!1122251 (not res!749740)) b!1122242))

(assert (= (and b!1122242 (not res!749745)) b!1122240))

(assert (= (and b!1122240 c!109446) b!1122246))

(assert (= (and b!1122240 (not c!109446)) b!1122238))

(assert (= (or b!1122246 b!1122238) bm!47190))

(assert (= (or b!1122246 b!1122238) bm!47191))

(assert (= (and b!1122240 (not res!749735)) b!1122245))

(assert (= (and b!1122244 condMapEmpty!44068) mapIsEmpty!44068))

(assert (= (and b!1122244 (not condMapEmpty!44068)) mapNonEmpty!44068))

(get-info :version)

(assert (= (and mapNonEmpty!44068 ((_ is ValueCellFull!13374) mapValue!44068)) b!1122249))

(assert (= (and b!1122244 ((_ is ValueCellFull!13374) mapDefault!44068)) b!1122252))

(assert (= start!97936 b!1122244))

(declare-fun b_lambda!18607 () Bool)

(assert (=> (not b_lambda!18607) (not b!1122242)))

(declare-fun t!35162 () Bool)

(declare-fun tb!8449 () Bool)

(assert (=> (and start!97936 (= defaultEntry!1004 defaultEntry!1004) t!35162) tb!8449))

(declare-fun result!17459 () Bool)

(assert (=> tb!8449 (= result!17459 tp_is_empty!28167)))

(assert (=> b!1122242 t!35162))

(declare-fun b_and!38059 () Bool)

(assert (= b_and!38057 (and (=> t!35162 result!17459) b_and!38059)))

(declare-fun m!1036923 () Bool)

(assert (=> b!1122248 m!1036923))

(declare-fun m!1036925 () Bool)

(assert (=> mapNonEmpty!44068 m!1036925))

(declare-fun m!1036927 () Bool)

(assert (=> b!1122245 m!1036927))

(assert (=> b!1122245 m!1036927))

(declare-fun m!1036929 () Bool)

(assert (=> b!1122245 m!1036929))

(declare-fun m!1036931 () Bool)

(assert (=> bm!47190 m!1036931))

(assert (=> bm!47191 m!1036927))

(declare-fun m!1036933 () Bool)

(assert (=> b!1122237 m!1036933))

(declare-fun m!1036935 () Bool)

(assert (=> b!1122251 m!1036935))

(declare-fun m!1036937 () Bool)

(assert (=> b!1122251 m!1036937))

(declare-fun m!1036939 () Bool)

(assert (=> b!1122241 m!1036939))

(declare-fun m!1036941 () Bool)

(assert (=> b!1122242 m!1036941))

(declare-fun m!1036943 () Bool)

(assert (=> b!1122242 m!1036943))

(declare-fun m!1036945 () Bool)

(assert (=> b!1122242 m!1036945))

(declare-fun m!1036947 () Bool)

(assert (=> b!1122242 m!1036947))

(declare-fun m!1036949 () Bool)

(assert (=> b!1122243 m!1036949))

(declare-fun m!1036951 () Bool)

(assert (=> b!1122243 m!1036951))

(declare-fun m!1036953 () Bool)

(assert (=> start!97936 m!1036953))

(declare-fun m!1036955 () Bool)

(assert (=> start!97936 m!1036955))

(declare-fun m!1036957 () Bool)

(assert (=> b!1122250 m!1036957))

(declare-fun m!1036959 () Bool)

(assert (=> b!1122240 m!1036959))

(declare-fun m!1036961 () Bool)

(assert (=> b!1122240 m!1036961))

(declare-fun m!1036963 () Bool)

(assert (=> b!1122239 m!1036963))

(declare-fun m!1036965 () Bool)

(assert (=> b!1122246 m!1036965))

(declare-fun m!1036967 () Bool)

(assert (=> b!1122254 m!1036967))

(check-sat (not b_lambda!18607) b_and!38059 (not mapNonEmpty!44068) (not b!1122245) (not b_next!23637) (not b!1122250) (not b!1122254) (not b!1122242) (not b!1122243) (not bm!47190) (not b!1122240) (not b!1122248) (not b!1122241) tp_is_empty!28167 (not b!1122251) (not b!1122237) (not bm!47191) (not b!1122246) (not start!97936))
(check-sat b_and!38059 (not b_next!23637))
