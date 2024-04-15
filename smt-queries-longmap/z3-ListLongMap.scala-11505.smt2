; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133842 () Bool)

(assert start!133842)

(declare-fun b_free!32137 () Bool)

(declare-fun b_next!32137 () Bool)

(assert (=> start!133842 (= b_free!32137 (not b_next!32137))))

(declare-fun tp!113711 () Bool)

(declare-fun b_and!51693 () Bool)

(assert (=> start!133842 (= tp!113711 b_and!51693)))

(declare-fun b!1564938 () Bool)

(declare-fun res!1069876 () Bool)

(declare-fun e!872257 () Bool)

(assert (=> b!1564938 (=> (not res!1069876) (not e!872257))))

(declare-datatypes ((array!104442 0))(
  ( (array!104443 (arr!50410 (Array (_ BitVec 32) (_ BitVec 64))) (size!50962 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104442)

(declare-datatypes ((List!36645 0))(
  ( (Nil!36642) (Cons!36641 (h!38088 (_ BitVec 64)) (t!51488 List!36645)) )
))
(declare-fun arrayNoDuplicates!0 (array!104442 (_ BitVec 32) List!36645) Bool)

(assert (=> b!1564938 (= res!1069876 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36642))))

(declare-fun b!1564939 () Bool)

(declare-fun e!872259 () Bool)

(declare-fun tp_is_empty!38911 () Bool)

(assert (=> b!1564939 (= e!872259 tp_is_empty!38911)))

(declare-fun b!1564940 () Bool)

(declare-fun e!872258 () Bool)

(declare-fun mapRes!59755 () Bool)

(assert (=> b!1564940 (= e!872258 (and e!872259 mapRes!59755))))

(declare-fun condMapEmpty!59755 () Bool)

(declare-datatypes ((V!60089 0))(
  ( (V!60090 (val!19539 Int)) )
))
(declare-datatypes ((ValueCell!18425 0))(
  ( (ValueCellFull!18425 (v!22290 V!60089)) (EmptyCell!18425) )
))
(declare-datatypes ((array!104444 0))(
  ( (array!104445 (arr!50411 (Array (_ BitVec 32) ValueCell!18425)) (size!50963 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104444)

(declare-fun mapDefault!59755 () ValueCell!18425)

(assert (=> b!1564940 (= condMapEmpty!59755 (= (arr!50411 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18425)) mapDefault!59755)))))

(declare-fun b!1564941 () Bool)

(declare-fun e!872256 () Bool)

(assert (=> b!1564941 (= e!872256 tp_is_empty!38911)))

(declare-fun b!1564942 () Bool)

(declare-fun res!1069874 () Bool)

(assert (=> b!1564942 (=> (not res!1069874) (not e!872257))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564942 (= res!1069874 (and (= (size!50963 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50962 _keys!637) (size!50963 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564943 () Bool)

(declare-fun res!1069879 () Bool)

(assert (=> b!1564943 (=> (not res!1069879) (not e!872257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104442 (_ BitVec 32)) Bool)

(assert (=> b!1564943 (= res!1069879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59755 () Bool)

(assert (=> mapIsEmpty!59755 mapRes!59755))

(declare-fun res!1069875 () Bool)

(assert (=> start!133842 (=> (not res!1069875) (not e!872257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133842 (= res!1069875 (validMask!0 mask!947))))

(assert (=> start!133842 e!872257))

(assert (=> start!133842 tp!113711))

(assert (=> start!133842 tp_is_empty!38911))

(assert (=> start!133842 true))

(declare-fun array_inv!39377 (array!104442) Bool)

(assert (=> start!133842 (array_inv!39377 _keys!637)))

(declare-fun array_inv!39378 (array!104444) Bool)

(assert (=> start!133842 (and (array_inv!39378 _values!487) e!872258)))

(declare-fun b!1564944 () Bool)

(declare-fun res!1069878 () Bool)

(assert (=> b!1564944 (=> (not res!1069878) (not e!872257))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564944 (= res!1069878 (validKeyInArray!0 (select (arr!50410 _keys!637) from!782)))))

(declare-fun b!1564945 () Bool)

(declare-fun res!1069877 () Bool)

(assert (=> b!1564945 (=> (not res!1069877) (not e!872257))))

(assert (=> b!1564945 (= res!1069877 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50962 _keys!637)) (bvslt from!782 (size!50962 _keys!637))))))

(declare-fun mapNonEmpty!59755 () Bool)

(declare-fun tp!113710 () Bool)

(assert (=> mapNonEmpty!59755 (= mapRes!59755 (and tp!113710 e!872256))))

(declare-fun mapValue!59755 () ValueCell!18425)

(declare-fun mapRest!59755 () (Array (_ BitVec 32) ValueCell!18425))

(declare-fun mapKey!59755 () (_ BitVec 32))

(assert (=> mapNonEmpty!59755 (= (arr!50411 _values!487) (store mapRest!59755 mapKey!59755 mapValue!59755))))

(declare-fun b!1564946 () Bool)

(assert (=> b!1564946 (= e!872257 (not (bvslt (bvsub (size!50962 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!50962 _keys!637)) from!782))))))

(declare-datatypes ((tuple2!25284 0))(
  ( (tuple2!25285 (_1!12653 (_ BitVec 64)) (_2!12653 V!60089)) )
))
(declare-datatypes ((List!36646 0))(
  ( (Nil!36643) (Cons!36642 (h!38089 tuple2!25284) (t!51489 List!36646)) )
))
(declare-datatypes ((ListLongMap!22719 0))(
  ( (ListLongMap!22720 (toList!11375 List!36646)) )
))
(declare-fun lt!671899 () ListLongMap!22719)

(declare-fun lt!671897 () V!60089)

(declare-fun contains!10286 (ListLongMap!22719 (_ BitVec 64)) Bool)

(declare-fun +!5096 (ListLongMap!22719 tuple2!25284) ListLongMap!22719)

(assert (=> b!1564946 (not (contains!10286 (+!5096 lt!671899 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51809 0))(
  ( (Unit!51810) )
))
(declare-fun lt!671898 () Unit!51809)

(declare-fun addStillNotContains!543 (ListLongMap!22719 (_ BitVec 64) V!60089 (_ BitVec 64)) Unit!51809)

(assert (=> b!1564946 (= lt!671898 (addStillNotContains!543 lt!671899 (select (arr!50410 _keys!637) from!782) lt!671897 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26323 (ValueCell!18425 V!60089) V!60089)

(declare-fun dynLambda!3872 (Int (_ BitVec 64)) V!60089)

(assert (=> b!1564946 (= lt!671897 (get!26323 (select (arr!50411 _values!487) from!782) (dynLambda!3872 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60089)

(declare-fun minValue!453 () V!60089)

(declare-fun getCurrentListMapNoExtraKeys!6727 (array!104442 array!104444 (_ BitVec 32) (_ BitVec 32) V!60089 V!60089 (_ BitVec 32) Int) ListLongMap!22719)

(assert (=> b!1564946 (= lt!671899 (getCurrentListMapNoExtraKeys!6727 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(assert (= (and start!133842 res!1069875) b!1564942))

(assert (= (and b!1564942 res!1069874) b!1564943))

(assert (= (and b!1564943 res!1069879) b!1564938))

(assert (= (and b!1564938 res!1069876) b!1564945))

(assert (= (and b!1564945 res!1069877) b!1564944))

(assert (= (and b!1564944 res!1069878) b!1564946))

(assert (= (and b!1564940 condMapEmpty!59755) mapIsEmpty!59755))

(assert (= (and b!1564940 (not condMapEmpty!59755)) mapNonEmpty!59755))

(get-info :version)

(assert (= (and mapNonEmpty!59755 ((_ is ValueCellFull!18425) mapValue!59755)) b!1564941))

(assert (= (and b!1564940 ((_ is ValueCellFull!18425) mapDefault!59755)) b!1564939))

(assert (= start!133842 b!1564940))

(declare-fun b_lambda!24931 () Bool)

(assert (=> (not b_lambda!24931) (not b!1564946)))

(declare-fun t!51487 () Bool)

(declare-fun tb!12597 () Bool)

(assert (=> (and start!133842 (= defaultEntry!495 defaultEntry!495) t!51487) tb!12597))

(declare-fun result!26491 () Bool)

(assert (=> tb!12597 (= result!26491 tp_is_empty!38911)))

(assert (=> b!1564946 t!51487))

(declare-fun b_and!51695 () Bool)

(assert (= b_and!51693 (and (=> t!51487 result!26491) b_and!51695)))

(declare-fun m!1439279 () Bool)

(assert (=> start!133842 m!1439279))

(declare-fun m!1439281 () Bool)

(assert (=> start!133842 m!1439281))

(declare-fun m!1439283 () Bool)

(assert (=> start!133842 m!1439283))

(declare-fun m!1439285 () Bool)

(assert (=> b!1564944 m!1439285))

(assert (=> b!1564944 m!1439285))

(declare-fun m!1439287 () Bool)

(assert (=> b!1564944 m!1439287))

(declare-fun m!1439289 () Bool)

(assert (=> b!1564938 m!1439289))

(declare-fun m!1439291 () Bool)

(assert (=> b!1564946 m!1439291))

(declare-fun m!1439293 () Bool)

(assert (=> b!1564946 m!1439293))

(declare-fun m!1439295 () Bool)

(assert (=> b!1564946 m!1439295))

(assert (=> b!1564946 m!1439285))

(declare-fun m!1439297 () Bool)

(assert (=> b!1564946 m!1439297))

(declare-fun m!1439299 () Bool)

(assert (=> b!1564946 m!1439299))

(assert (=> b!1564946 m!1439285))

(assert (=> b!1564946 m!1439293))

(declare-fun m!1439301 () Bool)

(assert (=> b!1564946 m!1439301))

(assert (=> b!1564946 m!1439291))

(assert (=> b!1564946 m!1439299))

(declare-fun m!1439303 () Bool)

(assert (=> b!1564946 m!1439303))

(declare-fun m!1439305 () Bool)

(assert (=> b!1564943 m!1439305))

(declare-fun m!1439307 () Bool)

(assert (=> mapNonEmpty!59755 m!1439307))

(check-sat b_and!51695 (not mapNonEmpty!59755) tp_is_empty!38911 (not b!1564943) (not b_lambda!24931) (not start!133842) (not b_next!32137) (not b!1564938) (not b!1564946) (not b!1564944))
(check-sat b_and!51695 (not b_next!32137))
(get-model)

(declare-fun b_lambda!24937 () Bool)

(assert (= b_lambda!24931 (or (and start!133842 b_free!32137) b_lambda!24937)))

(check-sat b_and!51695 (not mapNonEmpty!59755) tp_is_empty!38911 (not b!1564943) (not b_lambda!24937) (not start!133842) (not b_next!32137) (not b!1564938) (not b!1564946) (not b!1564944))
(check-sat b_and!51695 (not b_next!32137))
(get-model)

(declare-fun d!162923 () Bool)

(declare-fun c!144192 () Bool)

(assert (=> d!162923 (= c!144192 ((_ is ValueCellFull!18425) (select (arr!50411 _values!487) from!782)))))

(declare-fun e!872293 () V!60089)

(assert (=> d!162923 (= (get!26323 (select (arr!50411 _values!487) from!782) (dynLambda!3872 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)) e!872293)))

(declare-fun b!1565011 () Bool)

(declare-fun get!26324 (ValueCell!18425 V!60089) V!60089)

(assert (=> b!1565011 (= e!872293 (get!26324 (select (arr!50411 _values!487) from!782) (dynLambda!3872 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1565012 () Bool)

(declare-fun get!26325 (ValueCell!18425 V!60089) V!60089)

(assert (=> b!1565012 (= e!872293 (get!26325 (select (arr!50411 _values!487) from!782) (dynLambda!3872 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!162923 c!144192) b!1565011))

(assert (= (and d!162923 (not c!144192)) b!1565012))

(assert (=> b!1565011 m!1439291))

(assert (=> b!1565011 m!1439293))

(declare-fun m!1439369 () Bool)

(assert (=> b!1565011 m!1439369))

(assert (=> b!1565012 m!1439291))

(assert (=> b!1565012 m!1439293))

(declare-fun m!1439371 () Bool)

(assert (=> b!1565012 m!1439371))

(assert (=> b!1564946 d!162923))

(declare-fun b!1565037 () Bool)

(declare-fun e!872313 () Bool)

(declare-fun e!872311 () Bool)

(assert (=> b!1565037 (= e!872313 e!872311)))

(declare-fun c!144202 () Bool)

(assert (=> b!1565037 (= c!144202 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50962 _keys!637)))))

(declare-fun b!1565038 () Bool)

(declare-fun lt!671934 () ListLongMap!22719)

(declare-fun isEmpty!1150 (ListLongMap!22719) Bool)

(assert (=> b!1565038 (= e!872311 (isEmpty!1150 lt!671934))))

(declare-fun b!1565039 () Bool)

(declare-fun e!872314 () ListLongMap!22719)

(assert (=> b!1565039 (= e!872314 (ListLongMap!22720 Nil!36643))))

(declare-fun b!1565040 () Bool)

(assert (=> b!1565040 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50962 _keys!637)))))

(assert (=> b!1565040 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50963 _values!487)))))

(declare-fun e!872308 () Bool)

(declare-fun apply!1104 (ListLongMap!22719 (_ BitVec 64)) V!60089)

(assert (=> b!1565040 (= e!872308 (= (apply!1104 lt!671934 (select (arr!50410 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))) (get!26323 (select (arr!50411 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3872 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1565041 () Bool)

(assert (=> b!1565041 (= e!872313 e!872308)))

(assert (=> b!1565041 (and (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50962 _keys!637)))))

(declare-fun res!1069925 () Bool)

(assert (=> b!1565041 (= res!1069925 (contains!10286 lt!671934 (select (arr!50410 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1565041 (=> (not res!1069925) (not e!872308))))

(declare-fun bm!71838 () Bool)

(declare-fun call!71841 () ListLongMap!22719)

(assert (=> bm!71838 (= call!71841 (getCurrentListMapNoExtraKeys!6727 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495))))

(declare-fun b!1565042 () Bool)

(assert (=> b!1565042 (= e!872311 (= lt!671934 (getCurrentListMapNoExtraKeys!6727 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782 #b00000000000000000000000000000001) defaultEntry!495)))))

(declare-fun d!162925 () Bool)

(declare-fun e!872310 () Bool)

(assert (=> d!162925 e!872310))

(declare-fun res!1069924 () Bool)

(assert (=> d!162925 (=> (not res!1069924) (not e!872310))))

(assert (=> d!162925 (= res!1069924 (not (contains!10286 lt!671934 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!162925 (= lt!671934 e!872314)))

(declare-fun c!144201 () Bool)

(assert (=> d!162925 (= c!144201 (bvsge (bvadd #b00000000000000000000000000000001 from!782) (size!50962 _keys!637)))))

(assert (=> d!162925 (validMask!0 mask!947)))

(assert (=> d!162925 (= (getCurrentListMapNoExtraKeys!6727 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) lt!671934)))

(declare-fun b!1565043 () Bool)

(assert (=> b!1565043 (= e!872310 e!872313)))

(declare-fun c!144204 () Bool)

(declare-fun e!872309 () Bool)

(assert (=> b!1565043 (= c!144204 e!872309)))

(declare-fun res!1069927 () Bool)

(assert (=> b!1565043 (=> (not res!1069927) (not e!872309))))

(assert (=> b!1565043 (= res!1069927 (bvslt (bvadd #b00000000000000000000000000000001 from!782) (size!50962 _keys!637)))))

(declare-fun b!1565044 () Bool)

(declare-fun lt!671938 () Unit!51809)

(declare-fun lt!671936 () Unit!51809)

(assert (=> b!1565044 (= lt!671938 lt!671936)))

(declare-fun lt!671933 () ListLongMap!22719)

(declare-fun lt!671935 () V!60089)

(declare-fun lt!671932 () (_ BitVec 64))

(declare-fun lt!671937 () (_ BitVec 64))

(assert (=> b!1565044 (not (contains!10286 (+!5096 lt!671933 (tuple2!25285 lt!671937 lt!671935)) lt!671932))))

(assert (=> b!1565044 (= lt!671936 (addStillNotContains!543 lt!671933 lt!671937 lt!671935 lt!671932))))

(assert (=> b!1565044 (= lt!671932 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1565044 (= lt!671935 (get!26323 (select (arr!50411 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3872 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1565044 (= lt!671937 (select (arr!50410 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)))))

(assert (=> b!1565044 (= lt!671933 call!71841)))

(declare-fun e!872312 () ListLongMap!22719)

(assert (=> b!1565044 (= e!872312 (+!5096 call!71841 (tuple2!25285 (select (arr!50410 _keys!637) (bvadd #b00000000000000000000000000000001 from!782)) (get!26323 (select (arr!50411 _values!487) (bvadd #b00000000000000000000000000000001 from!782)) (dynLambda!3872 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1565045 () Bool)

(assert (=> b!1565045 (= e!872312 call!71841)))

(declare-fun b!1565046 () Bool)

(assert (=> b!1565046 (= e!872314 e!872312)))

(declare-fun c!144203 () Bool)

(assert (=> b!1565046 (= c!144203 (validKeyInArray!0 (select (arr!50410 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(declare-fun b!1565047 () Bool)

(declare-fun res!1069926 () Bool)

(assert (=> b!1565047 (=> (not res!1069926) (not e!872310))))

(assert (=> b!1565047 (= res!1069926 (not (contains!10286 lt!671934 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1565048 () Bool)

(assert (=> b!1565048 (= e!872309 (validKeyInArray!0 (select (arr!50410 _keys!637) (bvadd #b00000000000000000000000000000001 from!782))))))

(assert (=> b!1565048 (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))

(assert (= (and d!162925 c!144201) b!1565039))

(assert (= (and d!162925 (not c!144201)) b!1565046))

(assert (= (and b!1565046 c!144203) b!1565044))

(assert (= (and b!1565046 (not c!144203)) b!1565045))

(assert (= (or b!1565044 b!1565045) bm!71838))

(assert (= (and d!162925 res!1069924) b!1565047))

(assert (= (and b!1565047 res!1069926) b!1565043))

(assert (= (and b!1565043 res!1069927) b!1565048))

(assert (= (and b!1565043 c!144204) b!1565041))

(assert (= (and b!1565043 (not c!144204)) b!1565037))

(assert (= (and b!1565041 res!1069925) b!1565040))

(assert (= (and b!1565037 c!144202) b!1565042))

(assert (= (and b!1565037 (not c!144202)) b!1565038))

(declare-fun b_lambda!24939 () Bool)

(assert (=> (not b_lambda!24939) (not b!1565040)))

(assert (=> b!1565040 t!51487))

(declare-fun b_and!51705 () Bool)

(assert (= b_and!51695 (and (=> t!51487 result!26491) b_and!51705)))

(declare-fun b_lambda!24941 () Bool)

(assert (=> (not b_lambda!24941) (not b!1565044)))

(assert (=> b!1565044 t!51487))

(declare-fun b_and!51707 () Bool)

(assert (= b_and!51705 (and (=> t!51487 result!26491) b_and!51707)))

(declare-fun m!1439373 () Bool)

(assert (=> b!1565047 m!1439373))

(declare-fun m!1439375 () Bool)

(assert (=> b!1565048 m!1439375))

(assert (=> b!1565048 m!1439375))

(declare-fun m!1439377 () Bool)

(assert (=> b!1565048 m!1439377))

(declare-fun m!1439379 () Bool)

(assert (=> bm!71838 m!1439379))

(declare-fun m!1439381 () Bool)

(assert (=> b!1565044 m!1439381))

(declare-fun m!1439383 () Bool)

(assert (=> b!1565044 m!1439383))

(assert (=> b!1565044 m!1439293))

(declare-fun m!1439385 () Bool)

(assert (=> b!1565044 m!1439385))

(assert (=> b!1565044 m!1439383))

(declare-fun m!1439387 () Bool)

(assert (=> b!1565044 m!1439387))

(declare-fun m!1439389 () Bool)

(assert (=> b!1565044 m!1439389))

(declare-fun m!1439391 () Bool)

(assert (=> b!1565044 m!1439391))

(assert (=> b!1565044 m!1439375))

(assert (=> b!1565044 m!1439293))

(assert (=> b!1565044 m!1439387))

(assert (=> b!1565040 m!1439383))

(assert (=> b!1565040 m!1439293))

(assert (=> b!1565040 m!1439385))

(assert (=> b!1565040 m!1439375))

(declare-fun m!1439393 () Bool)

(assert (=> b!1565040 m!1439393))

(assert (=> b!1565040 m!1439383))

(assert (=> b!1565040 m!1439375))

(assert (=> b!1565040 m!1439293))

(declare-fun m!1439395 () Bool)

(assert (=> d!162925 m!1439395))

(assert (=> d!162925 m!1439279))

(assert (=> b!1565042 m!1439379))

(declare-fun m!1439397 () Bool)

(assert (=> b!1565038 m!1439397))

(assert (=> b!1565046 m!1439375))

(assert (=> b!1565046 m!1439375))

(assert (=> b!1565046 m!1439377))

(assert (=> b!1565041 m!1439375))

(assert (=> b!1565041 m!1439375))

(declare-fun m!1439399 () Bool)

(assert (=> b!1565041 m!1439399))

(assert (=> b!1564946 d!162925))

(declare-fun d!162927 () Bool)

(assert (=> d!162927 (not (contains!10286 (+!5096 lt!671899 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671941 () Unit!51809)

(declare-fun choose!2083 (ListLongMap!22719 (_ BitVec 64) V!60089 (_ BitVec 64)) Unit!51809)

(assert (=> d!162927 (= lt!671941 (choose!2083 lt!671899 (select (arr!50410 _keys!637) from!782) lt!671897 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!872317 () Bool)

(assert (=> d!162927 e!872317))

(declare-fun res!1069930 () Bool)

(assert (=> d!162927 (=> (not res!1069930) (not e!872317))))

(assert (=> d!162927 (= res!1069930 (not (contains!10286 lt!671899 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!162927 (= (addStillNotContains!543 lt!671899 (select (arr!50410 _keys!637) from!782) lt!671897 #b0000000000000000000000000000000000000000000000000000000000000000) lt!671941)))

(declare-fun b!1565052 () Bool)

(assert (=> b!1565052 (= e!872317 (not (= (select (arr!50410 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!162927 res!1069930) b!1565052))

(assert (=> d!162927 m!1439299))

(assert (=> d!162927 m!1439299))

(assert (=> d!162927 m!1439303))

(assert (=> d!162927 m!1439285))

(declare-fun m!1439401 () Bool)

(assert (=> d!162927 m!1439401))

(declare-fun m!1439403 () Bool)

(assert (=> d!162927 m!1439403))

(assert (=> b!1564946 d!162927))

(declare-fun d!162929 () Bool)

(declare-fun e!872320 () Bool)

(assert (=> d!162929 e!872320))

(declare-fun res!1069936 () Bool)

(assert (=> d!162929 (=> (not res!1069936) (not e!872320))))

(declare-fun lt!671953 () ListLongMap!22719)

(assert (=> d!162929 (= res!1069936 (contains!10286 lt!671953 (_1!12653 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897))))))

(declare-fun lt!671951 () List!36646)

(assert (=> d!162929 (= lt!671953 (ListLongMap!22720 lt!671951))))

(declare-fun lt!671952 () Unit!51809)

(declare-fun lt!671950 () Unit!51809)

(assert (=> d!162929 (= lt!671952 lt!671950)))

(declare-datatypes ((Option!870 0))(
  ( (Some!869 (v!22293 V!60089)) (None!868) )
))
(declare-fun getValueByKey!795 (List!36646 (_ BitVec 64)) Option!870)

(assert (=> d!162929 (= (getValueByKey!795 lt!671951 (_1!12653 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897))) (Some!869 (_2!12653 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897))))))

(declare-fun lemmaContainsTupThenGetReturnValue!387 (List!36646 (_ BitVec 64) V!60089) Unit!51809)

(assert (=> d!162929 (= lt!671950 (lemmaContainsTupThenGetReturnValue!387 lt!671951 (_1!12653 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897)) (_2!12653 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897))))))

(declare-fun insertStrictlySorted!577 (List!36646 (_ BitVec 64) V!60089) List!36646)

(assert (=> d!162929 (= lt!671951 (insertStrictlySorted!577 (toList!11375 lt!671899) (_1!12653 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897)) (_2!12653 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897))))))

(assert (=> d!162929 (= (+!5096 lt!671899 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897)) lt!671953)))

(declare-fun b!1565057 () Bool)

(declare-fun res!1069935 () Bool)

(assert (=> b!1565057 (=> (not res!1069935) (not e!872320))))

(assert (=> b!1565057 (= res!1069935 (= (getValueByKey!795 (toList!11375 lt!671953) (_1!12653 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897))) (Some!869 (_2!12653 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897)))))))

(declare-fun b!1565058 () Bool)

(declare-fun contains!10287 (List!36646 tuple2!25284) Bool)

(assert (=> b!1565058 (= e!872320 (contains!10287 (toList!11375 lt!671953) (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897)))))

(assert (= (and d!162929 res!1069936) b!1565057))

(assert (= (and b!1565057 res!1069935) b!1565058))

(declare-fun m!1439405 () Bool)

(assert (=> d!162929 m!1439405))

(declare-fun m!1439407 () Bool)

(assert (=> d!162929 m!1439407))

(declare-fun m!1439409 () Bool)

(assert (=> d!162929 m!1439409))

(declare-fun m!1439411 () Bool)

(assert (=> d!162929 m!1439411))

(declare-fun m!1439413 () Bool)

(assert (=> b!1565057 m!1439413))

(declare-fun m!1439415 () Bool)

(assert (=> b!1565058 m!1439415))

(assert (=> b!1564946 d!162929))

(declare-fun d!162931 () Bool)

(declare-fun e!872326 () Bool)

(assert (=> d!162931 e!872326))

(declare-fun res!1069939 () Bool)

(assert (=> d!162931 (=> res!1069939 e!872326)))

(declare-fun lt!671965 () Bool)

(assert (=> d!162931 (= res!1069939 (not lt!671965))))

(declare-fun lt!671962 () Bool)

(assert (=> d!162931 (= lt!671965 lt!671962)))

(declare-fun lt!671963 () Unit!51809)

(declare-fun e!872325 () Unit!51809)

(assert (=> d!162931 (= lt!671963 e!872325)))

(declare-fun c!144207 () Bool)

(assert (=> d!162931 (= c!144207 lt!671962)))

(declare-fun containsKey!848 (List!36646 (_ BitVec 64)) Bool)

(assert (=> d!162931 (= lt!671962 (containsKey!848 (toList!11375 (+!5096 lt!671899 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!162931 (= (contains!10286 (+!5096 lt!671899 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!671965)))

(declare-fun b!1565065 () Bool)

(declare-fun lt!671964 () Unit!51809)

(assert (=> b!1565065 (= e!872325 lt!671964)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!532 (List!36646 (_ BitVec 64)) Unit!51809)

(assert (=> b!1565065 (= lt!671964 (lemmaContainsKeyImpliesGetValueByKeyDefined!532 (toList!11375 (+!5096 lt!671899 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!583 (Option!870) Bool)

(assert (=> b!1565065 (isDefined!583 (getValueByKey!795 (toList!11375 (+!5096 lt!671899 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1565066 () Bool)

(declare-fun Unit!51811 () Unit!51809)

(assert (=> b!1565066 (= e!872325 Unit!51811)))

(declare-fun b!1565067 () Bool)

(assert (=> b!1565067 (= e!872326 (isDefined!583 (getValueByKey!795 (toList!11375 (+!5096 lt!671899 (tuple2!25285 (select (arr!50410 _keys!637) from!782) lt!671897))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!162931 c!144207) b!1565065))

(assert (= (and d!162931 (not c!144207)) b!1565066))

(assert (= (and d!162931 (not res!1069939)) b!1565067))

(declare-fun m!1439417 () Bool)

(assert (=> d!162931 m!1439417))

(declare-fun m!1439419 () Bool)

(assert (=> b!1565065 m!1439419))

(declare-fun m!1439421 () Bool)

(assert (=> b!1565065 m!1439421))

(assert (=> b!1565065 m!1439421))

(declare-fun m!1439423 () Bool)

(assert (=> b!1565065 m!1439423))

(assert (=> b!1565067 m!1439421))

(assert (=> b!1565067 m!1439421))

(assert (=> b!1565067 m!1439423))

(assert (=> b!1564946 d!162931))

(declare-fun b!1565078 () Bool)

(declare-fun e!872335 () Bool)

(declare-fun e!872338 () Bool)

(assert (=> b!1565078 (= e!872335 e!872338)))

(declare-fun c!144210 () Bool)

(assert (=> b!1565078 (= c!144210 (validKeyInArray!0 (select (arr!50410 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1565079 () Bool)

(declare-fun e!872337 () Bool)

(declare-fun contains!10288 (List!36645 (_ BitVec 64)) Bool)

(assert (=> b!1565079 (= e!872337 (contains!10288 Nil!36642 (select (arr!50410 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1565080 () Bool)

(declare-fun call!71844 () Bool)

(assert (=> b!1565080 (= e!872338 call!71844)))

(declare-fun b!1565081 () Bool)

(assert (=> b!1565081 (= e!872338 call!71844)))

(declare-fun b!1565082 () Bool)

(declare-fun e!872336 () Bool)

(assert (=> b!1565082 (= e!872336 e!872335)))

(declare-fun res!1069948 () Bool)

(assert (=> b!1565082 (=> (not res!1069948) (not e!872335))))

(assert (=> b!1565082 (= res!1069948 (not e!872337))))

(declare-fun res!1069947 () Bool)

(assert (=> b!1565082 (=> (not res!1069947) (not e!872337))))

(assert (=> b!1565082 (= res!1069947 (validKeyInArray!0 (select (arr!50410 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun bm!71841 () Bool)

(assert (=> bm!71841 (= call!71844 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144210 (Cons!36641 (select (arr!50410 _keys!637) #b00000000000000000000000000000000) Nil!36642) Nil!36642)))))

(declare-fun d!162933 () Bool)

(declare-fun res!1069946 () Bool)

(assert (=> d!162933 (=> res!1069946 e!872336)))

(assert (=> d!162933 (= res!1069946 (bvsge #b00000000000000000000000000000000 (size!50962 _keys!637)))))

(assert (=> d!162933 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36642) e!872336)))

(assert (= (and d!162933 (not res!1069946)) b!1565082))

(assert (= (and b!1565082 res!1069947) b!1565079))

(assert (= (and b!1565082 res!1069948) b!1565078))

(assert (= (and b!1565078 c!144210) b!1565080))

(assert (= (and b!1565078 (not c!144210)) b!1565081))

(assert (= (or b!1565080 b!1565081) bm!71841))

(declare-fun m!1439425 () Bool)

(assert (=> b!1565078 m!1439425))

(assert (=> b!1565078 m!1439425))

(declare-fun m!1439427 () Bool)

(assert (=> b!1565078 m!1439427))

(assert (=> b!1565079 m!1439425))

(assert (=> b!1565079 m!1439425))

(declare-fun m!1439429 () Bool)

(assert (=> b!1565079 m!1439429))

(assert (=> b!1565082 m!1439425))

(assert (=> b!1565082 m!1439425))

(assert (=> b!1565082 m!1439427))

(assert (=> bm!71841 m!1439425))

(declare-fun m!1439431 () Bool)

(assert (=> bm!71841 m!1439431))

(assert (=> b!1564938 d!162933))

(declare-fun d!162935 () Bool)

(assert (=> d!162935 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133842 d!162935))

(declare-fun d!162937 () Bool)

(assert (=> d!162937 (= (array_inv!39377 _keys!637) (bvsge (size!50962 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133842 d!162937))

(declare-fun d!162939 () Bool)

(assert (=> d!162939 (= (array_inv!39378 _values!487) (bvsge (size!50963 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133842 d!162939))

(declare-fun b!1565091 () Bool)

(declare-fun e!872345 () Bool)

(declare-fun e!872346 () Bool)

(assert (=> b!1565091 (= e!872345 e!872346)))

(declare-fun lt!671973 () (_ BitVec 64))

(assert (=> b!1565091 (= lt!671973 (select (arr!50410 _keys!637) #b00000000000000000000000000000000))))

(declare-fun lt!671974 () Unit!51809)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104442 (_ BitVec 64) (_ BitVec 32)) Unit!51809)

(assert (=> b!1565091 (= lt!671974 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!671973 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1565091 (arrayContainsKey!0 _keys!637 lt!671973 #b00000000000000000000000000000000)))

(declare-fun lt!671972 () Unit!51809)

(assert (=> b!1565091 (= lt!671972 lt!671974)))

(declare-fun res!1069953 () Bool)

(declare-datatypes ((SeekEntryResult!13525 0))(
  ( (MissingZero!13525 (index!56498 (_ BitVec 32))) (Found!13525 (index!56499 (_ BitVec 32))) (Intermediate!13525 (undefined!14337 Bool) (index!56500 (_ BitVec 32)) (x!140620 (_ BitVec 32))) (Undefined!13525) (MissingVacant!13525 (index!56501 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104442 (_ BitVec 32)) SeekEntryResult!13525)

(assert (=> b!1565091 (= res!1069953 (= (seekEntryOrOpen!0 (select (arr!50410 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13525 #b00000000000000000000000000000000)))))

(assert (=> b!1565091 (=> (not res!1069953) (not e!872346))))

(declare-fun b!1565092 () Bool)

(declare-fun call!71847 () Bool)

(assert (=> b!1565092 (= e!872345 call!71847)))

(declare-fun b!1565093 () Bool)

(declare-fun e!872347 () Bool)

(assert (=> b!1565093 (= e!872347 e!872345)))

(declare-fun c!144213 () Bool)

(assert (=> b!1565093 (= c!144213 (validKeyInArray!0 (select (arr!50410 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!162941 () Bool)

(declare-fun res!1069954 () Bool)

(assert (=> d!162941 (=> res!1069954 e!872347)))

(assert (=> d!162941 (= res!1069954 (bvsge #b00000000000000000000000000000000 (size!50962 _keys!637)))))

(assert (=> d!162941 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!872347)))

(declare-fun b!1565094 () Bool)

(assert (=> b!1565094 (= e!872346 call!71847)))

(declare-fun bm!71844 () Bool)

(assert (=> bm!71844 (= call!71847 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(assert (= (and d!162941 (not res!1069954)) b!1565093))

(assert (= (and b!1565093 c!144213) b!1565091))

(assert (= (and b!1565093 (not c!144213)) b!1565092))

(assert (= (and b!1565091 res!1069953) b!1565094))

(assert (= (or b!1565094 b!1565092) bm!71844))

(assert (=> b!1565091 m!1439425))

(declare-fun m!1439433 () Bool)

(assert (=> b!1565091 m!1439433))

(declare-fun m!1439435 () Bool)

(assert (=> b!1565091 m!1439435))

(assert (=> b!1565091 m!1439425))

(declare-fun m!1439437 () Bool)

(assert (=> b!1565091 m!1439437))

(assert (=> b!1565093 m!1439425))

(assert (=> b!1565093 m!1439425))

(assert (=> b!1565093 m!1439427))

(declare-fun m!1439439 () Bool)

(assert (=> bm!71844 m!1439439))

(assert (=> b!1564943 d!162941))

(declare-fun d!162943 () Bool)

(assert (=> d!162943 (= (validKeyInArray!0 (select (arr!50410 _keys!637) from!782)) (and (not (= (select (arr!50410 _keys!637) from!782) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50410 _keys!637) from!782) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1564944 d!162943))

(declare-fun b!1565101 () Bool)

(declare-fun e!872353 () Bool)

(assert (=> b!1565101 (= e!872353 tp_is_empty!38911)))

(declare-fun mapIsEmpty!59764 () Bool)

(declare-fun mapRes!59764 () Bool)

(assert (=> mapIsEmpty!59764 mapRes!59764))

(declare-fun condMapEmpty!59764 () Bool)

(declare-fun mapDefault!59764 () ValueCell!18425)

(assert (=> mapNonEmpty!59755 (= condMapEmpty!59764 (= mapRest!59755 ((as const (Array (_ BitVec 32) ValueCell!18425)) mapDefault!59764)))))

(declare-fun e!872352 () Bool)

(assert (=> mapNonEmpty!59755 (= tp!113710 (and e!872352 mapRes!59764))))

(declare-fun mapNonEmpty!59764 () Bool)

(declare-fun tp!113726 () Bool)

(assert (=> mapNonEmpty!59764 (= mapRes!59764 (and tp!113726 e!872353))))

(declare-fun mapRest!59764 () (Array (_ BitVec 32) ValueCell!18425))

(declare-fun mapValue!59764 () ValueCell!18425)

(declare-fun mapKey!59764 () (_ BitVec 32))

(assert (=> mapNonEmpty!59764 (= mapRest!59755 (store mapRest!59764 mapKey!59764 mapValue!59764))))

(declare-fun b!1565102 () Bool)

(assert (=> b!1565102 (= e!872352 tp_is_empty!38911)))

(assert (= (and mapNonEmpty!59755 condMapEmpty!59764) mapIsEmpty!59764))

(assert (= (and mapNonEmpty!59755 (not condMapEmpty!59764)) mapNonEmpty!59764))

(assert (= (and mapNonEmpty!59764 ((_ is ValueCellFull!18425) mapValue!59764)) b!1565101))

(assert (= (and mapNonEmpty!59755 ((_ is ValueCellFull!18425) mapDefault!59764)) b!1565102))

(declare-fun m!1439441 () Bool)

(assert (=> mapNonEmpty!59764 m!1439441))

(declare-fun b_lambda!24943 () Bool)

(assert (= b_lambda!24941 (or (and start!133842 b_free!32137) b_lambda!24943)))

(declare-fun b_lambda!24945 () Bool)

(assert (= b_lambda!24939 (or (and start!133842 b_free!32137) b_lambda!24945)))

(check-sat b_and!51707 (not b!1565079) (not b!1565047) tp_is_empty!38911 (not b!1565038) (not b_lambda!24945) (not bm!71838) (not b!1565040) (not b_lambda!24937) (not b!1565082) (not b!1565044) (not d!162925) (not b_next!32137) (not b!1565093) (not b!1565058) (not b!1565048) (not d!162927) (not b!1565091) (not bm!71844) (not b!1565041) (not b!1565067) (not b!1565057) (not bm!71841) (not b_lambda!24943) (not b!1565078) (not b!1565012) (not mapNonEmpty!59764) (not b!1565065) (not b!1565011) (not b!1565042) (not d!162929) (not b!1565046) (not d!162931))
(check-sat b_and!51707 (not b_next!32137))
