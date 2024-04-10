; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97942 () Bool)

(assert start!97942)

(declare-fun b_free!23643 () Bool)

(declare-fun b_next!23643 () Bool)

(assert (=> start!97942 (= b_free!23643 (not b_next!23643))))

(declare-fun tp!83633 () Bool)

(declare-fun b_and!38069 () Bool)

(assert (=> start!97942 (= tp!83633 b_and!38069)))

(declare-fun b!1122405 () Bool)

(declare-fun e!639024 () Bool)

(declare-fun tp_is_empty!28173 () Bool)

(assert (=> b!1122405 (= e!639024 tp_is_empty!28173)))

(declare-fun b!1122406 () Bool)

(declare-fun e!639020 () Bool)

(assert (=> b!1122406 (= e!639020 true)))

(declare-datatypes ((V!42691 0))(
  ( (V!42692 (val!14143 Int)) )
))
(declare-fun zeroValue!944 () V!42691)

(declare-datatypes ((array!73223 0))(
  ( (array!73224 (arr!35264 (Array (_ BitVec 32) (_ BitVec 64))) (size!35800 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73223)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((ValueCell!13377 0))(
  ( (ValueCellFull!13377 (v!16776 V!42691)) (EmptyCell!13377) )
))
(declare-datatypes ((array!73225 0))(
  ( (array!73226 (arr!35265 (Array (_ BitVec 32) ValueCell!13377)) (size!35801 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73225)

(declare-fun minValue!944 () V!42691)

(declare-fun lt!498707 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17758 0))(
  ( (tuple2!17759 (_1!8890 (_ BitVec 64)) (_2!8890 V!42691)) )
))
(declare-datatypes ((List!24538 0))(
  ( (Nil!24535) (Cons!24534 (h!25743 tuple2!17758) (t!35173 List!24538)) )
))
(declare-datatypes ((ListLongMap!15727 0))(
  ( (ListLongMap!15728 (toList!7879 List!24538)) )
))
(declare-fun contains!6423 (ListLongMap!15727 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4368 (array!73223 array!73225 (_ BitVec 32) (_ BitVec 32) V!42691 V!42691 (_ BitVec 32) Int) ListLongMap!15727)

(assert (=> b!1122406 (= lt!498707 (contains!6423 (getCurrentListMapNoExtraKeys!4368 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1122407 () Bool)

(declare-fun e!639025 () Bool)

(assert (=> b!1122407 (= e!639025 e!639020)))

(declare-fun res!749857 () Bool)

(assert (=> b!1122407 (=> res!749857 e!639020)))

(assert (=> b!1122407 (= res!749857 (not (= (select (arr!35264 _keys!1208) from!1455) k0!934)))))

(declare-fun e!639022 () Bool)

(assert (=> b!1122407 e!639022))

(declare-fun c!109455 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122407 (= c!109455 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36814 0))(
  ( (Unit!36815) )
))
(declare-fun lt!498705 () Unit!36814)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!334 (array!73223 array!73225 (_ BitVec 32) (_ BitVec 32) V!42691 V!42691 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36814)

(assert (=> b!1122407 (= lt!498705 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122408 () Bool)

(declare-fun e!639019 () Bool)

(declare-fun e!639026 () Bool)

(assert (=> b!1122408 (= e!639019 e!639026)))

(declare-fun res!749854 () Bool)

(assert (=> b!1122408 (=> (not res!749854) (not e!639026))))

(declare-fun lt!498704 () array!73223)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73223 (_ BitVec 32)) Bool)

(assert (=> b!1122408 (= res!749854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498704 mask!1564))))

(assert (=> b!1122408 (= lt!498704 (array!73224 (store (arr!35264 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35800 _keys!1208)))))

(declare-fun b!1122409 () Bool)

(declare-fun res!749859 () Bool)

(assert (=> b!1122409 (=> (not res!749859) (not e!639019))))

(assert (=> b!1122409 (= res!749859 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35800 _keys!1208))))))

(declare-fun b!1122410 () Bool)

(declare-fun e!639018 () Bool)

(assert (=> b!1122410 (= e!639026 (not e!639018))))

(declare-fun res!749862 () Bool)

(assert (=> b!1122410 (=> res!749862 e!639018)))

(assert (=> b!1122410 (= res!749862 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122410 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498702 () Unit!36814)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73223 (_ BitVec 64) (_ BitVec 32)) Unit!36814)

(assert (=> b!1122410 (= lt!498702 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1122411 () Bool)

(declare-fun res!749856 () Bool)

(assert (=> b!1122411 (=> (not res!749856) (not e!639019))))

(assert (=> b!1122411 (= res!749856 (= (select (arr!35264 _keys!1208) i!673) k0!934))))

(declare-fun b!1122412 () Bool)

(declare-fun e!639023 () Bool)

(assert (=> b!1122412 (= e!639023 tp_is_empty!28173)))

(declare-fun bm!47208 () Bool)

(declare-fun lt!498701 () array!73225)

(declare-fun call!47211 () ListLongMap!15727)

(assert (=> bm!47208 (= call!47211 (getCurrentListMapNoExtraKeys!4368 lt!498704 lt!498701 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122413 () Bool)

(declare-fun call!47212 () ListLongMap!15727)

(assert (=> b!1122413 (= e!639022 (= call!47211 call!47212))))

(declare-fun b!1122414 () Bool)

(declare-fun res!749860 () Bool)

(assert (=> b!1122414 (=> (not res!749860) (not e!639019))))

(assert (=> b!1122414 (= res!749860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!749853 () Bool)

(assert (=> start!97942 (=> (not res!749853) (not e!639019))))

(assert (=> start!97942 (= res!749853 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35800 _keys!1208))))))

(assert (=> start!97942 e!639019))

(assert (=> start!97942 tp_is_empty!28173))

(declare-fun array_inv!27074 (array!73223) Bool)

(assert (=> start!97942 (array_inv!27074 _keys!1208)))

(assert (=> start!97942 true))

(assert (=> start!97942 tp!83633))

(declare-fun e!639021 () Bool)

(declare-fun array_inv!27075 (array!73225) Bool)

(assert (=> start!97942 (and (array_inv!27075 _values!996) e!639021)))

(declare-fun b!1122415 () Bool)

(declare-fun -!1086 (ListLongMap!15727 (_ BitVec 64)) ListLongMap!15727)

(assert (=> b!1122415 (= e!639022 (= call!47211 (-!1086 call!47212 k0!934)))))

(declare-fun b!1122416 () Bool)

(declare-fun res!749855 () Bool)

(assert (=> b!1122416 (=> (not res!749855) (not e!639019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122416 (= res!749855 (validKeyInArray!0 k0!934))))

(declare-fun b!1122417 () Bool)

(declare-fun res!749863 () Bool)

(assert (=> b!1122417 (=> (not res!749863) (not e!639026))))

(declare-datatypes ((List!24539 0))(
  ( (Nil!24536) (Cons!24535 (h!25744 (_ BitVec 64)) (t!35174 List!24539)) )
))
(declare-fun arrayNoDuplicates!0 (array!73223 (_ BitVec 32) List!24539) Bool)

(assert (=> b!1122417 (= res!749863 (arrayNoDuplicates!0 lt!498704 #b00000000000000000000000000000000 Nil!24536))))

(declare-fun b!1122418 () Bool)

(declare-fun res!749861 () Bool)

(assert (=> b!1122418 (=> (not res!749861) (not e!639019))))

(assert (=> b!1122418 (= res!749861 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24536))))

(declare-fun b!1122419 () Bool)

(declare-fun res!749852 () Bool)

(assert (=> b!1122419 (=> (not res!749852) (not e!639019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122419 (= res!749852 (validMask!0 mask!1564))))

(declare-fun bm!47209 () Bool)

(assert (=> bm!47209 (= call!47212 (getCurrentListMapNoExtraKeys!4368 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122420 () Bool)

(assert (=> b!1122420 (= e!639018 e!639025)))

(declare-fun res!749858 () Bool)

(assert (=> b!1122420 (=> res!749858 e!639025)))

(assert (=> b!1122420 (= res!749858 (not (= from!1455 i!673)))))

(declare-fun lt!498703 () ListLongMap!15727)

(assert (=> b!1122420 (= lt!498703 (getCurrentListMapNoExtraKeys!4368 lt!498704 lt!498701 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2464 (Int (_ BitVec 64)) V!42691)

(assert (=> b!1122420 (= lt!498701 (array!73226 (store (arr!35265 _values!996) i!673 (ValueCellFull!13377 (dynLambda!2464 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35801 _values!996)))))

(declare-fun lt!498706 () ListLongMap!15727)

(assert (=> b!1122420 (= lt!498706 (getCurrentListMapNoExtraKeys!4368 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1122421 () Bool)

(declare-fun res!749851 () Bool)

(assert (=> b!1122421 (=> (not res!749851) (not e!639019))))

(assert (=> b!1122421 (= res!749851 (and (= (size!35801 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35800 _keys!1208) (size!35801 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1122422 () Bool)

(declare-fun mapRes!44077 () Bool)

(assert (=> b!1122422 (= e!639021 (and e!639023 mapRes!44077))))

(declare-fun condMapEmpty!44077 () Bool)

(declare-fun mapDefault!44077 () ValueCell!13377)

(assert (=> b!1122422 (= condMapEmpty!44077 (= (arr!35265 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13377)) mapDefault!44077)))))

(declare-fun mapNonEmpty!44077 () Bool)

(declare-fun tp!83632 () Bool)

(assert (=> mapNonEmpty!44077 (= mapRes!44077 (and tp!83632 e!639024))))

(declare-fun mapRest!44077 () (Array (_ BitVec 32) ValueCell!13377))

(declare-fun mapValue!44077 () ValueCell!13377)

(declare-fun mapKey!44077 () (_ BitVec 32))

(assert (=> mapNonEmpty!44077 (= (arr!35265 _values!996) (store mapRest!44077 mapKey!44077 mapValue!44077))))

(declare-fun mapIsEmpty!44077 () Bool)

(assert (=> mapIsEmpty!44077 mapRes!44077))

(assert (= (and start!97942 res!749853) b!1122419))

(assert (= (and b!1122419 res!749852) b!1122421))

(assert (= (and b!1122421 res!749851) b!1122414))

(assert (= (and b!1122414 res!749860) b!1122418))

(assert (= (and b!1122418 res!749861) b!1122409))

(assert (= (and b!1122409 res!749859) b!1122416))

(assert (= (and b!1122416 res!749855) b!1122411))

(assert (= (and b!1122411 res!749856) b!1122408))

(assert (= (and b!1122408 res!749854) b!1122417))

(assert (= (and b!1122417 res!749863) b!1122410))

(assert (= (and b!1122410 (not res!749862)) b!1122420))

(assert (= (and b!1122420 (not res!749858)) b!1122407))

(assert (= (and b!1122407 c!109455) b!1122415))

(assert (= (and b!1122407 (not c!109455)) b!1122413))

(assert (= (or b!1122415 b!1122413) bm!47208))

(assert (= (or b!1122415 b!1122413) bm!47209))

(assert (= (and b!1122407 (not res!749857)) b!1122406))

(assert (= (and b!1122422 condMapEmpty!44077) mapIsEmpty!44077))

(assert (= (and b!1122422 (not condMapEmpty!44077)) mapNonEmpty!44077))

(get-info :version)

(assert (= (and mapNonEmpty!44077 ((_ is ValueCellFull!13377) mapValue!44077)) b!1122405))

(assert (= (and b!1122422 ((_ is ValueCellFull!13377) mapDefault!44077)) b!1122412))

(assert (= start!97942 b!1122422))

(declare-fun b_lambda!18613 () Bool)

(assert (=> (not b_lambda!18613) (not b!1122420)))

(declare-fun t!35172 () Bool)

(declare-fun tb!8455 () Bool)

(assert (=> (and start!97942 (= defaultEntry!1004 defaultEntry!1004) t!35172) tb!8455))

(declare-fun result!17471 () Bool)

(assert (=> tb!8455 (= result!17471 tp_is_empty!28173)))

(assert (=> b!1122420 t!35172))

(declare-fun b_and!38071 () Bool)

(assert (= b_and!38069 (and (=> t!35172 result!17471) b_and!38071)))

(declare-fun m!1037061 () Bool)

(assert (=> b!1122406 m!1037061))

(assert (=> b!1122406 m!1037061))

(declare-fun m!1037063 () Bool)

(assert (=> b!1122406 m!1037063))

(declare-fun m!1037065 () Bool)

(assert (=> b!1122415 m!1037065))

(declare-fun m!1037067 () Bool)

(assert (=> b!1122407 m!1037067))

(declare-fun m!1037069 () Bool)

(assert (=> b!1122407 m!1037069))

(declare-fun m!1037071 () Bool)

(assert (=> b!1122410 m!1037071))

(declare-fun m!1037073 () Bool)

(assert (=> b!1122410 m!1037073))

(declare-fun m!1037075 () Bool)

(assert (=> b!1122417 m!1037075))

(declare-fun m!1037077 () Bool)

(assert (=> b!1122414 m!1037077))

(assert (=> bm!47209 m!1037061))

(declare-fun m!1037079 () Bool)

(assert (=> b!1122408 m!1037079))

(declare-fun m!1037081 () Bool)

(assert (=> b!1122408 m!1037081))

(declare-fun m!1037083 () Bool)

(assert (=> bm!47208 m!1037083))

(declare-fun m!1037085 () Bool)

(assert (=> b!1122411 m!1037085))

(declare-fun m!1037087 () Bool)

(assert (=> b!1122419 m!1037087))

(declare-fun m!1037089 () Bool)

(assert (=> b!1122420 m!1037089))

(declare-fun m!1037091 () Bool)

(assert (=> b!1122420 m!1037091))

(declare-fun m!1037093 () Bool)

(assert (=> b!1122420 m!1037093))

(declare-fun m!1037095 () Bool)

(assert (=> b!1122420 m!1037095))

(declare-fun m!1037097 () Bool)

(assert (=> b!1122416 m!1037097))

(declare-fun m!1037099 () Bool)

(assert (=> mapNonEmpty!44077 m!1037099))

(declare-fun m!1037101 () Bool)

(assert (=> b!1122418 m!1037101))

(declare-fun m!1037103 () Bool)

(assert (=> start!97942 m!1037103))

(declare-fun m!1037105 () Bool)

(assert (=> start!97942 m!1037105))

(check-sat (not b!1122419) tp_is_empty!28173 (not b!1122410) (not b!1122417) (not b!1122420) (not b!1122407) (not b_lambda!18613) (not bm!47209) (not b!1122414) (not start!97942) (not b!1122415) (not b!1122418) (not bm!47208) (not b!1122408) b_and!38071 (not mapNonEmpty!44077) (not b_next!23643) (not b!1122416) (not b!1122406))
(check-sat b_and!38071 (not b_next!23643))
