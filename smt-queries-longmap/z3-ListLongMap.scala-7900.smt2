; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98380 () Bool)

(assert start!98380)

(declare-fun b_free!23845 () Bool)

(declare-fun b_next!23845 () Bool)

(assert (=> start!98380 (= b_free!23845 (not b_next!23845))))

(declare-fun tp!84238 () Bool)

(declare-fun b_and!38483 () Bool)

(assert (=> start!98380 (= tp!84238 b_and!38483)))

(declare-fun b!1129586 () Bool)

(declare-fun e!642996 () Bool)

(declare-fun e!642999 () Bool)

(assert (=> b!1129586 (= e!642996 (not e!642999))))

(declare-fun res!754515 () Bool)

(assert (=> b!1129586 (=> res!754515 e!642999)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129586 (= res!754515 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73655 0))(
  ( (array!73656 (arr!35474 (Array (_ BitVec 32) (_ BitVec 64))) (size!36011 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73655)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129586 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36951 0))(
  ( (Unit!36952) )
))
(declare-fun lt!501413 () Unit!36951)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73655 (_ BitVec 64) (_ BitVec 32)) Unit!36951)

(assert (=> b!1129586 (= lt!501413 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1129587 () Bool)

(declare-fun e!642993 () Bool)

(assert (=> b!1129587 (= e!642993 true)))

(declare-datatypes ((V!42961 0))(
  ( (V!42962 (val!14244 Int)) )
))
(declare-fun zeroValue!944 () V!42961)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!501409 () Bool)

(declare-datatypes ((ValueCell!13478 0))(
  ( (ValueCellFull!13478 (v!16873 V!42961)) (EmptyCell!13478) )
))
(declare-datatypes ((array!73657 0))(
  ( (array!73658 (arr!35475 (Array (_ BitVec 32) ValueCell!13478)) (size!36012 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73657)

(declare-fun minValue!944 () V!42961)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17944 0))(
  ( (tuple2!17945 (_1!8983 (_ BitVec 64)) (_2!8983 V!42961)) )
))
(declare-datatypes ((List!24722 0))(
  ( (Nil!24719) (Cons!24718 (h!25936 tuple2!17944) (t!35551 List!24722)) )
))
(declare-datatypes ((ListLongMap!15921 0))(
  ( (ListLongMap!15922 (toList!7976 List!24722)) )
))
(declare-fun contains!6516 (ListLongMap!15921 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4496 (array!73655 array!73657 (_ BitVec 32) (_ BitVec 32) V!42961 V!42961 (_ BitVec 32) Int) ListLongMap!15921)

(assert (=> b!1129587 (= lt!501409 (contains!6516 (getCurrentListMapNoExtraKeys!4496 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!501410 () array!73655)

(declare-fun call!47884 () ListLongMap!15921)

(declare-fun bm!47881 () Bool)

(declare-fun lt!501411 () array!73657)

(assert (=> bm!47881 (= call!47884 (getCurrentListMapNoExtraKeys!4496 lt!501410 lt!501411 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129588 () Bool)

(declare-fun res!754511 () Bool)

(declare-fun e!642997 () Bool)

(assert (=> b!1129588 (=> (not res!754511) (not e!642997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129588 (= res!754511 (validKeyInArray!0 k0!934))))

(declare-fun b!1129589 () Bool)

(declare-fun res!754510 () Bool)

(assert (=> b!1129589 (=> (not res!754510) (not e!642997))))

(assert (=> b!1129589 (= res!754510 (and (= (size!36012 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36011 _keys!1208) (size!36012 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!47885 () ListLongMap!15921)

(declare-fun e!642995 () Bool)

(declare-fun b!1129590 () Bool)

(declare-fun -!1145 (ListLongMap!15921 (_ BitVec 64)) ListLongMap!15921)

(assert (=> b!1129590 (= e!642995 (= call!47884 (-!1145 call!47885 k0!934)))))

(declare-fun res!754514 () Bool)

(assert (=> start!98380 (=> (not res!754514) (not e!642997))))

(assert (=> start!98380 (= res!754514 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36011 _keys!1208))))))

(assert (=> start!98380 e!642997))

(declare-fun tp_is_empty!28375 () Bool)

(assert (=> start!98380 tp_is_empty!28375))

(declare-fun array_inv!27274 (array!73655) Bool)

(assert (=> start!98380 (array_inv!27274 _keys!1208)))

(assert (=> start!98380 true))

(assert (=> start!98380 tp!84238))

(declare-fun e!642994 () Bool)

(declare-fun array_inv!27275 (array!73657) Bool)

(assert (=> start!98380 (and (array_inv!27275 _values!996) e!642994)))

(declare-fun b!1129591 () Bool)

(assert (=> b!1129591 (= e!642997 e!642996)))

(declare-fun res!754520 () Bool)

(assert (=> b!1129591 (=> (not res!754520) (not e!642996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73655 (_ BitVec 32)) Bool)

(assert (=> b!1129591 (= res!754520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501410 mask!1564))))

(assert (=> b!1129591 (= lt!501410 (array!73656 (store (arr!35474 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36011 _keys!1208)))))

(declare-fun b!1129592 () Bool)

(assert (=> b!1129592 (= e!642995 (= call!47884 call!47885))))

(declare-fun b!1129593 () Bool)

(declare-fun e!643002 () Bool)

(assert (=> b!1129593 (= e!643002 e!642993)))

(declare-fun res!754512 () Bool)

(assert (=> b!1129593 (=> res!754512 e!642993)))

(assert (=> b!1129593 (= res!754512 (not (= (select (arr!35474 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1129593 e!642995))

(declare-fun c!110168 () Bool)

(assert (=> b!1129593 (= c!110168 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501414 () Unit!36951)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!404 (array!73655 array!73657 (_ BitVec 32) (_ BitVec 32) V!42961 V!42961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36951)

(assert (=> b!1129593 (= lt!501414 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!404 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129594 () Bool)

(declare-fun res!754516 () Bool)

(assert (=> b!1129594 (=> (not res!754516) (not e!642996))))

(declare-datatypes ((List!24723 0))(
  ( (Nil!24720) (Cons!24719 (h!25937 (_ BitVec 64)) (t!35552 List!24723)) )
))
(declare-fun arrayNoDuplicates!0 (array!73655 (_ BitVec 32) List!24723) Bool)

(assert (=> b!1129594 (= res!754516 (arrayNoDuplicates!0 lt!501410 #b00000000000000000000000000000000 Nil!24720))))

(declare-fun b!1129595 () Bool)

(declare-fun e!643001 () Bool)

(assert (=> b!1129595 (= e!643001 tp_is_empty!28375)))

(declare-fun bm!47882 () Bool)

(assert (=> bm!47882 (= call!47885 (getCurrentListMapNoExtraKeys!4496 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129596 () Bool)

(declare-fun mapRes!44380 () Bool)

(assert (=> b!1129596 (= e!642994 (and e!643001 mapRes!44380))))

(declare-fun condMapEmpty!44380 () Bool)

(declare-fun mapDefault!44380 () ValueCell!13478)

(assert (=> b!1129596 (= condMapEmpty!44380 (= (arr!35475 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13478)) mapDefault!44380)))))

(declare-fun mapNonEmpty!44380 () Bool)

(declare-fun tp!84239 () Bool)

(declare-fun e!642998 () Bool)

(assert (=> mapNonEmpty!44380 (= mapRes!44380 (and tp!84239 e!642998))))

(declare-fun mapKey!44380 () (_ BitVec 32))

(declare-fun mapRest!44380 () (Array (_ BitVec 32) ValueCell!13478))

(declare-fun mapValue!44380 () ValueCell!13478)

(assert (=> mapNonEmpty!44380 (= (arr!35475 _values!996) (store mapRest!44380 mapKey!44380 mapValue!44380))))

(declare-fun b!1129597 () Bool)

(declare-fun res!754521 () Bool)

(assert (=> b!1129597 (=> (not res!754521) (not e!642997))))

(assert (=> b!1129597 (= res!754521 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36011 _keys!1208))))))

(declare-fun b!1129598 () Bool)

(declare-fun res!754517 () Bool)

(assert (=> b!1129598 (=> (not res!754517) (not e!642997))))

(assert (=> b!1129598 (= res!754517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1129599 () Bool)

(assert (=> b!1129599 (= e!642998 tp_is_empty!28375)))

(declare-fun b!1129600 () Bool)

(declare-fun res!754513 () Bool)

(assert (=> b!1129600 (=> (not res!754513) (not e!642997))))

(assert (=> b!1129600 (= res!754513 (= (select (arr!35474 _keys!1208) i!673) k0!934))))

(declare-fun b!1129601 () Bool)

(declare-fun res!754519 () Bool)

(assert (=> b!1129601 (=> (not res!754519) (not e!642997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129601 (= res!754519 (validMask!0 mask!1564))))

(declare-fun b!1129602 () Bool)

(declare-fun res!754522 () Bool)

(assert (=> b!1129602 (=> (not res!754522) (not e!642997))))

(assert (=> b!1129602 (= res!754522 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24720))))

(declare-fun b!1129603 () Bool)

(assert (=> b!1129603 (= e!642999 e!643002)))

(declare-fun res!754518 () Bool)

(assert (=> b!1129603 (=> res!754518 e!643002)))

(assert (=> b!1129603 (= res!754518 (not (= from!1455 i!673)))))

(declare-fun lt!501415 () ListLongMap!15921)

(assert (=> b!1129603 (= lt!501415 (getCurrentListMapNoExtraKeys!4496 lt!501410 lt!501411 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2563 (Int (_ BitVec 64)) V!42961)

(assert (=> b!1129603 (= lt!501411 (array!73658 (store (arr!35475 _values!996) i!673 (ValueCellFull!13478 (dynLambda!2563 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36012 _values!996)))))

(declare-fun lt!501412 () ListLongMap!15921)

(assert (=> b!1129603 (= lt!501412 (getCurrentListMapNoExtraKeys!4496 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!44380 () Bool)

(assert (=> mapIsEmpty!44380 mapRes!44380))

(assert (= (and start!98380 res!754514) b!1129601))

(assert (= (and b!1129601 res!754519) b!1129589))

(assert (= (and b!1129589 res!754510) b!1129598))

(assert (= (and b!1129598 res!754517) b!1129602))

(assert (= (and b!1129602 res!754522) b!1129597))

(assert (= (and b!1129597 res!754521) b!1129588))

(assert (= (and b!1129588 res!754511) b!1129600))

(assert (= (and b!1129600 res!754513) b!1129591))

(assert (= (and b!1129591 res!754520) b!1129594))

(assert (= (and b!1129594 res!754516) b!1129586))

(assert (= (and b!1129586 (not res!754515)) b!1129603))

(assert (= (and b!1129603 (not res!754518)) b!1129593))

(assert (= (and b!1129593 c!110168) b!1129590))

(assert (= (and b!1129593 (not c!110168)) b!1129592))

(assert (= (or b!1129590 b!1129592) bm!47881))

(assert (= (or b!1129590 b!1129592) bm!47882))

(assert (= (and b!1129593 (not res!754512)) b!1129587))

(assert (= (and b!1129596 condMapEmpty!44380) mapIsEmpty!44380))

(assert (= (and b!1129596 (not condMapEmpty!44380)) mapNonEmpty!44380))

(get-info :version)

(assert (= (and mapNonEmpty!44380 ((_ is ValueCellFull!13478) mapValue!44380)) b!1129599))

(assert (= (and b!1129596 ((_ is ValueCellFull!13478) mapDefault!44380)) b!1129595))

(assert (= start!98380 b!1129596))

(declare-fun b_lambda!18825 () Bool)

(assert (=> (not b_lambda!18825) (not b!1129603)))

(declare-fun t!35550 () Bool)

(declare-fun tb!8649 () Bool)

(assert (=> (and start!98380 (= defaultEntry!1004 defaultEntry!1004) t!35550) tb!8649))

(declare-fun result!17867 () Bool)

(assert (=> tb!8649 (= result!17867 tp_is_empty!28375)))

(assert (=> b!1129603 t!35550))

(declare-fun b_and!38485 () Bool)

(assert (= b_and!38483 (and (=> t!35550 result!17867) b_and!38485)))

(declare-fun m!1043567 () Bool)

(assert (=> b!1129600 m!1043567))

(declare-fun m!1043569 () Bool)

(assert (=> b!1129598 m!1043569))

(declare-fun m!1043571 () Bool)

(assert (=> b!1129594 m!1043571))

(declare-fun m!1043573 () Bool)

(assert (=> b!1129603 m!1043573))

(declare-fun m!1043575 () Bool)

(assert (=> b!1129603 m!1043575))

(declare-fun m!1043577 () Bool)

(assert (=> b!1129603 m!1043577))

(declare-fun m!1043579 () Bool)

(assert (=> b!1129603 m!1043579))

(declare-fun m!1043581 () Bool)

(assert (=> b!1129587 m!1043581))

(assert (=> b!1129587 m!1043581))

(declare-fun m!1043583 () Bool)

(assert (=> b!1129587 m!1043583))

(declare-fun m!1043585 () Bool)

(assert (=> mapNonEmpty!44380 m!1043585))

(declare-fun m!1043587 () Bool)

(assert (=> start!98380 m!1043587))

(declare-fun m!1043589 () Bool)

(assert (=> start!98380 m!1043589))

(declare-fun m!1043591 () Bool)

(assert (=> bm!47881 m!1043591))

(declare-fun m!1043593 () Bool)

(assert (=> b!1129602 m!1043593))

(declare-fun m!1043595 () Bool)

(assert (=> b!1129593 m!1043595))

(declare-fun m!1043597 () Bool)

(assert (=> b!1129593 m!1043597))

(declare-fun m!1043599 () Bool)

(assert (=> b!1129586 m!1043599))

(declare-fun m!1043601 () Bool)

(assert (=> b!1129586 m!1043601))

(declare-fun m!1043603 () Bool)

(assert (=> b!1129590 m!1043603))

(declare-fun m!1043605 () Bool)

(assert (=> b!1129591 m!1043605))

(declare-fun m!1043607 () Bool)

(assert (=> b!1129591 m!1043607))

(declare-fun m!1043609 () Bool)

(assert (=> b!1129601 m!1043609))

(declare-fun m!1043611 () Bool)

(assert (=> b!1129588 m!1043611))

(assert (=> bm!47882 m!1043581))

(check-sat (not bm!47882) b_and!38485 (not start!98380) (not b!1129587) tp_is_empty!28375 (not b!1129601) (not b!1129598) (not b!1129603) (not b!1129591) (not mapNonEmpty!44380) (not b_lambda!18825) (not b!1129594) (not b_next!23845) (not b!1129586) (not b!1129588) (not b!1129602) (not b!1129590) (not b!1129593) (not bm!47881))
(check-sat b_and!38485 (not b_next!23845))
