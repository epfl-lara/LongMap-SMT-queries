; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97594 () Bool)

(assert start!97594)

(declare-fun b_free!23329 () Bool)

(declare-fun b_next!23329 () Bool)

(assert (=> start!97594 (= b_free!23329 (not b_next!23329))))

(declare-fun tp!82285 () Bool)

(declare-fun b_and!37501 () Bool)

(assert (=> start!97594 (= tp!82285 b_and!37501)))

(declare-fun b!1110934 () Bool)

(declare-fun res!741024 () Bool)

(declare-fun e!633750 () Bool)

(assert (=> b!1110934 (=> (not res!741024) (not e!633750))))

(declare-datatypes ((array!72129 0))(
  ( (array!72130 (arr!34711 (Array (_ BitVec 32) (_ BitVec 64))) (size!35248 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72129)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72129 (_ BitVec 32)) Bool)

(assert (=> b!1110934 (= res!741024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110935 () Bool)

(declare-fun e!633746 () Bool)

(assert (=> b!1110935 (= e!633746 true)))

(declare-fun e!633747 () Bool)

(assert (=> b!1110935 e!633747))

(declare-fun c!109589 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110935 (= c!109589 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!41913 0))(
  ( (V!41914 (val!13851 Int)) )
))
(declare-fun zeroValue!944 () V!41913)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((Unit!36391 0))(
  ( (Unit!36392) )
))
(declare-fun lt!496532 () Unit!36391)

(declare-datatypes ((ValueCell!13085 0))(
  ( (ValueCellFull!13085 (v!16480 V!41913)) (EmptyCell!13085) )
))
(declare-datatypes ((array!72131 0))(
  ( (array!72132 (arr!34712 (Array (_ BitVec 32) ValueCell!13085)) (size!35249 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72131)

(declare-fun minValue!944 () V!41913)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!290 (array!72129 array!72131 (_ BitVec 32) (_ BitVec 32) V!41913 V!41913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36391)

(assert (=> b!1110935 (= lt!496532 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!290 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110936 () Bool)

(declare-fun res!741020 () Bool)

(assert (=> b!1110936 (=> (not res!741020) (not e!633750))))

(assert (=> b!1110936 (= res!741020 (and (= (size!35249 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35248 _keys!1208) (size!35249 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110937 () Bool)

(declare-fun e!633745 () Bool)

(assert (=> b!1110937 (= e!633745 (not e!633746))))

(declare-fun res!741022 () Bool)

(assert (=> b!1110937 (=> res!741022 e!633746)))

(assert (=> b!1110937 (= res!741022 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35248 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110937 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496533 () Unit!36391)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72129 (_ BitVec 64) (_ BitVec 32)) Unit!36391)

(assert (=> b!1110937 (= lt!496533 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1110938 () Bool)

(declare-datatypes ((tuple2!17524 0))(
  ( (tuple2!17525 (_1!8773 (_ BitVec 64)) (_2!8773 V!41913)) )
))
(declare-datatypes ((List!24209 0))(
  ( (Nil!24206) (Cons!24205 (h!25423 tuple2!17524) (t!34576 List!24209)) )
))
(declare-datatypes ((ListLongMap!15501 0))(
  ( (ListLongMap!15502 (toList!7766 List!24209)) )
))
(declare-fun call!46751 () ListLongMap!15501)

(declare-fun call!46750 () ListLongMap!15501)

(assert (=> b!1110938 (= e!633747 (= call!46751 call!46750))))

(declare-fun lt!496534 () array!72129)

(declare-fun bm!46747 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4299 (array!72129 array!72131 (_ BitVec 32) (_ BitVec 32) V!41913 V!41913 (_ BitVec 32) Int) ListLongMap!15501)

(declare-fun dynLambda!2411 (Int (_ BitVec 64)) V!41913)

(assert (=> bm!46747 (= call!46751 (getCurrentListMapNoExtraKeys!4299 lt!496534 (array!72132 (store (arr!34712 _values!996) i!673 (ValueCellFull!13085 (dynLambda!2411 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35249 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110939 () Bool)

(declare-fun -!1020 (ListLongMap!15501 (_ BitVec 64)) ListLongMap!15501)

(assert (=> b!1110939 (= e!633747 (= call!46751 (-!1020 call!46750 k0!934)))))

(declare-fun bm!46748 () Bool)

(assert (=> bm!46748 (= call!46750 (getCurrentListMapNoExtraKeys!4299 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110941 () Bool)

(declare-fun res!741021 () Bool)

(assert (=> b!1110941 (=> (not res!741021) (not e!633750))))

(assert (=> b!1110941 (= res!741021 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35248 _keys!1208))))))

(declare-fun b!1110942 () Bool)

(declare-fun res!741016 () Bool)

(assert (=> b!1110942 (=> (not res!741016) (not e!633750))))

(assert (=> b!1110942 (= res!741016 (= (select (arr!34711 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!43201 () Bool)

(declare-fun mapRes!43201 () Bool)

(declare-fun tp!82286 () Bool)

(declare-fun e!633748 () Bool)

(assert (=> mapNonEmpty!43201 (= mapRes!43201 (and tp!82286 e!633748))))

(declare-fun mapKey!43201 () (_ BitVec 32))

(declare-fun mapValue!43201 () ValueCell!13085)

(declare-fun mapRest!43201 () (Array (_ BitVec 32) ValueCell!13085))

(assert (=> mapNonEmpty!43201 (= (arr!34712 _values!996) (store mapRest!43201 mapKey!43201 mapValue!43201))))

(declare-fun b!1110943 () Bool)

(declare-fun res!741025 () Bool)

(assert (=> b!1110943 (=> (not res!741025) (not e!633750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110943 (= res!741025 (validMask!0 mask!1564))))

(declare-fun b!1110944 () Bool)

(declare-fun e!633749 () Bool)

(declare-fun tp_is_empty!27589 () Bool)

(assert (=> b!1110944 (= e!633749 tp_is_empty!27589)))

(declare-fun b!1110945 () Bool)

(assert (=> b!1110945 (= e!633748 tp_is_empty!27589)))

(declare-fun b!1110946 () Bool)

(declare-fun res!741015 () Bool)

(assert (=> b!1110946 (=> (not res!741015) (not e!633745))))

(declare-datatypes ((List!24210 0))(
  ( (Nil!24207) (Cons!24206 (h!25424 (_ BitVec 64)) (t!34577 List!24210)) )
))
(declare-fun arrayNoDuplicates!0 (array!72129 (_ BitVec 32) List!24210) Bool)

(assert (=> b!1110946 (= res!741015 (arrayNoDuplicates!0 lt!496534 #b00000000000000000000000000000000 Nil!24207))))

(declare-fun b!1110940 () Bool)

(declare-fun res!741017 () Bool)

(assert (=> b!1110940 (=> (not res!741017) (not e!633750))))

(assert (=> b!1110940 (= res!741017 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24207))))

(declare-fun res!741019 () Bool)

(assert (=> start!97594 (=> (not res!741019) (not e!633750))))

(assert (=> start!97594 (= res!741019 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35248 _keys!1208))))))

(assert (=> start!97594 e!633750))

(assert (=> start!97594 tp_is_empty!27589))

(declare-fun array_inv!26744 (array!72129) Bool)

(assert (=> start!97594 (array_inv!26744 _keys!1208)))

(assert (=> start!97594 true))

(assert (=> start!97594 tp!82285))

(declare-fun e!633744 () Bool)

(declare-fun array_inv!26745 (array!72131) Bool)

(assert (=> start!97594 (and (array_inv!26745 _values!996) e!633744)))

(declare-fun mapIsEmpty!43201 () Bool)

(assert (=> mapIsEmpty!43201 mapRes!43201))

(declare-fun b!1110947 () Bool)

(declare-fun res!741018 () Bool)

(assert (=> b!1110947 (=> (not res!741018) (not e!633750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110947 (= res!741018 (validKeyInArray!0 k0!934))))

(declare-fun b!1110948 () Bool)

(assert (=> b!1110948 (= e!633750 e!633745)))

(declare-fun res!741023 () Bool)

(assert (=> b!1110948 (=> (not res!741023) (not e!633745))))

(assert (=> b!1110948 (= res!741023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496534 mask!1564))))

(assert (=> b!1110948 (= lt!496534 (array!72130 (store (arr!34711 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35248 _keys!1208)))))

(declare-fun b!1110949 () Bool)

(assert (=> b!1110949 (= e!633744 (and e!633749 mapRes!43201))))

(declare-fun condMapEmpty!43201 () Bool)

(declare-fun mapDefault!43201 () ValueCell!13085)

(assert (=> b!1110949 (= condMapEmpty!43201 (= (arr!34712 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13085)) mapDefault!43201)))))

(assert (= (and start!97594 res!741019) b!1110943))

(assert (= (and b!1110943 res!741025) b!1110936))

(assert (= (and b!1110936 res!741020) b!1110934))

(assert (= (and b!1110934 res!741024) b!1110940))

(assert (= (and b!1110940 res!741017) b!1110941))

(assert (= (and b!1110941 res!741021) b!1110947))

(assert (= (and b!1110947 res!741018) b!1110942))

(assert (= (and b!1110942 res!741016) b!1110948))

(assert (= (and b!1110948 res!741023) b!1110946))

(assert (= (and b!1110946 res!741015) b!1110937))

(assert (= (and b!1110937 (not res!741022)) b!1110935))

(assert (= (and b!1110935 c!109589) b!1110939))

(assert (= (and b!1110935 (not c!109589)) b!1110938))

(assert (= (or b!1110939 b!1110938) bm!46747))

(assert (= (or b!1110939 b!1110938) bm!46748))

(assert (= (and b!1110949 condMapEmpty!43201) mapIsEmpty!43201))

(assert (= (and b!1110949 (not condMapEmpty!43201)) mapNonEmpty!43201))

(get-info :version)

(assert (= (and mapNonEmpty!43201 ((_ is ValueCellFull!13085) mapValue!43201)) b!1110945))

(assert (= (and b!1110949 ((_ is ValueCellFull!13085) mapDefault!43201)) b!1110944))

(assert (= start!97594 b!1110949))

(declare-fun b_lambda!18359 () Bool)

(assert (=> (not b_lambda!18359) (not bm!46747)))

(declare-fun t!34575 () Bool)

(declare-fun tb!8187 () Bool)

(assert (=> (and start!97594 (= defaultEntry!1004 defaultEntry!1004) t!34575) tb!8187))

(declare-fun result!16943 () Bool)

(assert (=> tb!8187 (= result!16943 tp_is_empty!27589)))

(assert (=> bm!46747 t!34575))

(declare-fun b_and!37503 () Bool)

(assert (= b_and!37501 (and (=> t!34575 result!16943) b_and!37503)))

(declare-fun m!1029525 () Bool)

(assert (=> b!1110940 m!1029525))

(declare-fun m!1029527 () Bool)

(assert (=> start!97594 m!1029527))

(declare-fun m!1029529 () Bool)

(assert (=> start!97594 m!1029529))

(declare-fun m!1029531 () Bool)

(assert (=> mapNonEmpty!43201 m!1029531))

(declare-fun m!1029533 () Bool)

(assert (=> bm!46747 m!1029533))

(declare-fun m!1029535 () Bool)

(assert (=> bm!46747 m!1029535))

(declare-fun m!1029537 () Bool)

(assert (=> bm!46747 m!1029537))

(declare-fun m!1029539 () Bool)

(assert (=> b!1110937 m!1029539))

(declare-fun m!1029541 () Bool)

(assert (=> b!1110937 m!1029541))

(declare-fun m!1029543 () Bool)

(assert (=> b!1110935 m!1029543))

(declare-fun m!1029545 () Bool)

(assert (=> b!1110948 m!1029545))

(declare-fun m!1029547 () Bool)

(assert (=> b!1110948 m!1029547))

(declare-fun m!1029549 () Bool)

(assert (=> b!1110934 m!1029549))

(declare-fun m!1029551 () Bool)

(assert (=> bm!46748 m!1029551))

(declare-fun m!1029553 () Bool)

(assert (=> b!1110947 m!1029553))

(declare-fun m!1029555 () Bool)

(assert (=> b!1110939 m!1029555))

(declare-fun m!1029557 () Bool)

(assert (=> b!1110946 m!1029557))

(declare-fun m!1029559 () Bool)

(assert (=> b!1110943 m!1029559))

(declare-fun m!1029561 () Bool)

(assert (=> b!1110942 m!1029561))

(check-sat (not b!1110943) (not b_lambda!18359) (not b!1110937) (not b!1110948) (not b!1110934) (not bm!46747) (not b_next!23329) (not b!1110940) (not b!1110946) (not start!97594) (not mapNonEmpty!43201) b_and!37503 (not b!1110935) (not b!1110939) (not b!1110947) (not bm!46748) tp_is_empty!27589)
(check-sat b_and!37503 (not b_next!23329))
