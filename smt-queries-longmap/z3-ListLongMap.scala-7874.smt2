; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97982 () Bool)

(assert start!97982)

(declare-fun b_free!23689 () Bool)

(declare-fun b_next!23689 () Bool)

(assert (=> start!97982 (= b_free!23689 (not b_next!23689))))

(declare-fun tp!83771 () Bool)

(declare-fun b_and!38139 () Bool)

(assert (=> start!97982 (= tp!83771 b_and!38139)))

(declare-fun mapNonEmpty!44146 () Bool)

(declare-fun mapRes!44146 () Bool)

(declare-fun tp!83770 () Bool)

(declare-fun e!639633 () Bool)

(assert (=> mapNonEmpty!44146 (= mapRes!44146 (and tp!83770 e!639633))))

(declare-datatypes ((V!42753 0))(
  ( (V!42754 (val!14166 Int)) )
))
(declare-datatypes ((ValueCell!13400 0))(
  ( (ValueCellFull!13400 (v!16798 V!42753)) (EmptyCell!13400) )
))
(declare-fun mapValue!44146 () ValueCell!13400)

(declare-fun mapKey!44146 () (_ BitVec 32))

(declare-datatypes ((array!73230 0))(
  ( (array!73231 (arr!35268 (Array (_ BitVec 32) ValueCell!13400)) (size!35806 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73230)

(declare-fun mapRest!44146 () (Array (_ BitVec 32) ValueCell!13400))

(assert (=> mapNonEmpty!44146 (= (arr!35268 _values!996) (store mapRest!44146 mapKey!44146 mapValue!44146))))

(declare-fun b!1123577 () Bool)

(declare-fun e!639638 () Bool)

(declare-fun e!639639 () Bool)

(assert (=> b!1123577 (= e!639638 (and e!639639 mapRes!44146))))

(declare-fun condMapEmpty!44146 () Bool)

(declare-fun mapDefault!44146 () ValueCell!13400)

(assert (=> b!1123577 (= condMapEmpty!44146 (= (arr!35268 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13400)) mapDefault!44146)))))

(declare-fun zeroValue!944 () V!42753)

(declare-datatypes ((tuple2!17872 0))(
  ( (tuple2!17873 (_1!8947 (_ BitVec 64)) (_2!8947 V!42753)) )
))
(declare-datatypes ((List!24635 0))(
  ( (Nil!24632) (Cons!24631 (h!25840 tuple2!17872) (t!35307 List!24635)) )
))
(declare-datatypes ((ListLongMap!15841 0))(
  ( (ListLongMap!15842 (toList!7936 List!24635)) )
))
(declare-fun call!47327 () ListLongMap!15841)

(declare-datatypes ((array!73232 0))(
  ( (array!73233 (arr!35269 (Array (_ BitVec 32) (_ BitVec 64))) (size!35807 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73232)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!47323 () Bool)

(declare-fun minValue!944 () V!42753)

(declare-fun getCurrentListMapNoExtraKeys!4443 (array!73232 array!73230 (_ BitVec 32) (_ BitVec 32) V!42753 V!42753 (_ BitVec 32) Int) ListLongMap!15841)

(assert (=> bm!47323 (= call!47327 (getCurrentListMapNoExtraKeys!4443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123578 () Bool)

(declare-fun res!750702 () Bool)

(declare-fun e!639636 () Bool)

(assert (=> b!1123578 (=> (not res!750702) (not e!639636))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1123578 (= res!750702 (= (select (arr!35269 _keys!1208) i!673) k0!934))))

(declare-fun b!1123579 () Bool)

(declare-fun e!639630 () Bool)

(declare-fun e!639634 () Bool)

(assert (=> b!1123579 (= e!639630 e!639634)))

(declare-fun res!750699 () Bool)

(assert (=> b!1123579 (=> res!750699 e!639634)))

(declare-fun lt!498982 () ListLongMap!15841)

(declare-fun contains!6409 (ListLongMap!15841 (_ BitVec 64)) Bool)

(assert (=> b!1123579 (= res!750699 (not (contains!6409 lt!498982 k0!934)))))

(assert (=> b!1123579 (= lt!498982 (getCurrentListMapNoExtraKeys!4443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123580 () Bool)

(declare-fun e!639635 () Bool)

(declare-fun e!639629 () Bool)

(assert (=> b!1123580 (= e!639635 (not e!639629))))

(declare-fun res!750706 () Bool)

(assert (=> b!1123580 (=> res!750706 e!639629)))

(assert (=> b!1123580 (= res!750706 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123580 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36687 0))(
  ( (Unit!36688) )
))
(declare-fun lt!498984 () Unit!36687)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73232 (_ BitVec 64) (_ BitVec 32)) Unit!36687)

(assert (=> b!1123580 (= lt!498984 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!750694 () Bool)

(assert (=> start!97982 (=> (not res!750694) (not e!639636))))

(assert (=> start!97982 (= res!750694 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35807 _keys!1208))))))

(assert (=> start!97982 e!639636))

(declare-fun tp_is_empty!28219 () Bool)

(assert (=> start!97982 tp_is_empty!28219))

(declare-fun array_inv!27146 (array!73232) Bool)

(assert (=> start!97982 (array_inv!27146 _keys!1208)))

(assert (=> start!97982 true))

(assert (=> start!97982 tp!83771))

(declare-fun array_inv!27147 (array!73230) Bool)

(assert (=> start!97982 (and (array_inv!27147 _values!996) e!639638)))

(declare-fun mapIsEmpty!44146 () Bool)

(assert (=> mapIsEmpty!44146 mapRes!44146))

(declare-fun b!1123581 () Bool)

(declare-fun res!750695 () Bool)

(assert (=> b!1123581 (=> (not res!750695) (not e!639636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73232 (_ BitVec 32)) Bool)

(assert (=> b!1123581 (= res!750695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123582 () Bool)

(assert (=> b!1123582 (= e!639639 tp_is_empty!28219)))

(declare-fun b!1123583 () Bool)

(assert (=> b!1123583 (= e!639633 tp_is_empty!28219)))

(declare-fun b!1123584 () Bool)

(declare-fun res!750697 () Bool)

(assert (=> b!1123584 (=> (not res!750697) (not e!639635))))

(declare-fun lt!498981 () array!73232)

(declare-datatypes ((List!24636 0))(
  ( (Nil!24633) (Cons!24632 (h!25841 (_ BitVec 64)) (t!35308 List!24636)) )
))
(declare-fun arrayNoDuplicates!0 (array!73232 (_ BitVec 32) List!24636) Bool)

(assert (=> b!1123584 (= res!750697 (arrayNoDuplicates!0 lt!498981 #b00000000000000000000000000000000 Nil!24633))))

(declare-fun b!1123585 () Bool)

(assert (=> b!1123585 (= e!639636 e!639635)))

(declare-fun res!750698 () Bool)

(assert (=> b!1123585 (=> (not res!750698) (not e!639635))))

(assert (=> b!1123585 (= res!750698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498981 mask!1564))))

(assert (=> b!1123585 (= lt!498981 (array!73233 (store (arr!35269 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35807 _keys!1208)))))

(declare-fun b!1123586 () Bool)

(declare-fun e!639631 () Bool)

(declare-fun call!47326 () ListLongMap!15841)

(assert (=> b!1123586 (= e!639631 (= call!47326 call!47327))))

(declare-fun lt!498983 () array!73230)

(declare-fun bm!47324 () Bool)

(assert (=> bm!47324 (= call!47326 (getCurrentListMapNoExtraKeys!4443 lt!498981 lt!498983 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123587 () Bool)

(declare-fun res!750701 () Bool)

(assert (=> b!1123587 (=> (not res!750701) (not e!639636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123587 (= res!750701 (validKeyInArray!0 k0!934))))

(declare-fun b!1123588 () Bool)

(declare-fun e!639637 () Bool)

(assert (=> b!1123588 (= e!639629 e!639637)))

(declare-fun res!750700 () Bool)

(assert (=> b!1123588 (=> res!750700 e!639637)))

(assert (=> b!1123588 (= res!750700 (not (= from!1455 i!673)))))

(declare-fun lt!498977 () ListLongMap!15841)

(assert (=> b!1123588 (= lt!498977 (getCurrentListMapNoExtraKeys!4443 lt!498981 lt!498983 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2470 (Int (_ BitVec 64)) V!42753)

(assert (=> b!1123588 (= lt!498983 (array!73231 (store (arr!35268 _values!996) i!673 (ValueCellFull!13400 (dynLambda!2470 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35806 _values!996)))))

(declare-fun lt!498980 () ListLongMap!15841)

(assert (=> b!1123588 (= lt!498980 (getCurrentListMapNoExtraKeys!4443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123589 () Bool)

(declare-fun res!750704 () Bool)

(assert (=> b!1123589 (=> (not res!750704) (not e!639636))))

(assert (=> b!1123589 (= res!750704 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24633))))

(declare-fun b!1123590 () Bool)

(declare-fun res!750703 () Bool)

(assert (=> b!1123590 (=> res!750703 e!639634)))

(assert (=> b!1123590 (= res!750703 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1123591 () Bool)

(declare-fun -!1077 (ListLongMap!15841 (_ BitVec 64)) ListLongMap!15841)

(assert (=> b!1123591 (= e!639631 (= call!47326 (-!1077 call!47327 k0!934)))))

(declare-fun b!1123592 () Bool)

(declare-fun res!750696 () Bool)

(assert (=> b!1123592 (=> (not res!750696) (not e!639636))))

(assert (=> b!1123592 (= res!750696 (and (= (size!35806 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35807 _keys!1208) (size!35806 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123593 () Bool)

(assert (=> b!1123593 (= e!639634 true)))

(declare-fun +!3443 (ListLongMap!15841 tuple2!17872) ListLongMap!15841)

(assert (=> b!1123593 (contains!6409 (+!3443 lt!498982 (tuple2!17873 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!498979 () Unit!36687)

(declare-fun addStillContains!661 (ListLongMap!15841 (_ BitVec 64) V!42753 (_ BitVec 64)) Unit!36687)

(assert (=> b!1123593 (= lt!498979 (addStillContains!661 lt!498982 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1123594 () Bool)

(declare-fun res!750692 () Bool)

(assert (=> b!1123594 (=> (not res!750692) (not e!639636))))

(assert (=> b!1123594 (= res!750692 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35807 _keys!1208))))))

(declare-fun b!1123595 () Bool)

(assert (=> b!1123595 (= e!639637 e!639630)))

(declare-fun res!750693 () Bool)

(assert (=> b!1123595 (=> res!750693 e!639630)))

(assert (=> b!1123595 (= res!750693 (not (= (select (arr!35269 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1123595 e!639631))

(declare-fun c!109497 () Bool)

(assert (=> b!1123595 (= c!109497 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498978 () Unit!36687)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!354 (array!73232 array!73230 (_ BitVec 32) (_ BitVec 32) V!42753 V!42753 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36687)

(assert (=> b!1123595 (= lt!498978 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123596 () Bool)

(declare-fun res!750705 () Bool)

(assert (=> b!1123596 (=> (not res!750705) (not e!639636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123596 (= res!750705 (validMask!0 mask!1564))))

(assert (= (and start!97982 res!750694) b!1123596))

(assert (= (and b!1123596 res!750705) b!1123592))

(assert (= (and b!1123592 res!750696) b!1123581))

(assert (= (and b!1123581 res!750695) b!1123589))

(assert (= (and b!1123589 res!750704) b!1123594))

(assert (= (and b!1123594 res!750692) b!1123587))

(assert (= (and b!1123587 res!750701) b!1123578))

(assert (= (and b!1123578 res!750702) b!1123585))

(assert (= (and b!1123585 res!750698) b!1123584))

(assert (= (and b!1123584 res!750697) b!1123580))

(assert (= (and b!1123580 (not res!750706)) b!1123588))

(assert (= (and b!1123588 (not res!750700)) b!1123595))

(assert (= (and b!1123595 c!109497) b!1123591))

(assert (= (and b!1123595 (not c!109497)) b!1123586))

(assert (= (or b!1123591 b!1123586) bm!47324))

(assert (= (or b!1123591 b!1123586) bm!47323))

(assert (= (and b!1123595 (not res!750693)) b!1123579))

(assert (= (and b!1123579 (not res!750699)) b!1123590))

(assert (= (and b!1123590 (not res!750703)) b!1123593))

(assert (= (and b!1123577 condMapEmpty!44146) mapIsEmpty!44146))

(assert (= (and b!1123577 (not condMapEmpty!44146)) mapNonEmpty!44146))

(get-info :version)

(assert (= (and mapNonEmpty!44146 ((_ is ValueCellFull!13400) mapValue!44146)) b!1123583))

(assert (= (and b!1123577 ((_ is ValueCellFull!13400) mapDefault!44146)) b!1123582))

(assert (= start!97982 b!1123577))

(declare-fun b_lambda!18641 () Bool)

(assert (=> (not b_lambda!18641) (not b!1123588)))

(declare-fun t!35306 () Bool)

(declare-fun tb!8493 () Bool)

(assert (=> (and start!97982 (= defaultEntry!1004 defaultEntry!1004) t!35306) tb!8493))

(declare-fun result!17555 () Bool)

(assert (=> tb!8493 (= result!17555 tp_is_empty!28219)))

(assert (=> b!1123588 t!35306))

(declare-fun b_and!38141 () Bool)

(assert (= b_and!38139 (and (=> t!35306 result!17555) b_and!38141)))

(declare-fun m!1037493 () Bool)

(assert (=> b!1123578 m!1037493))

(declare-fun m!1037495 () Bool)

(assert (=> bm!47324 m!1037495))

(declare-fun m!1037497 () Bool)

(assert (=> mapNonEmpty!44146 m!1037497))

(declare-fun m!1037499 () Bool)

(assert (=> b!1123596 m!1037499))

(declare-fun m!1037501 () Bool)

(assert (=> b!1123595 m!1037501))

(declare-fun m!1037503 () Bool)

(assert (=> b!1123595 m!1037503))

(declare-fun m!1037505 () Bool)

(assert (=> bm!47323 m!1037505))

(declare-fun m!1037507 () Bool)

(assert (=> b!1123591 m!1037507))

(declare-fun m!1037509 () Bool)

(assert (=> b!1123584 m!1037509))

(declare-fun m!1037511 () Bool)

(assert (=> start!97982 m!1037511))

(declare-fun m!1037513 () Bool)

(assert (=> start!97982 m!1037513))

(declare-fun m!1037515 () Bool)

(assert (=> b!1123580 m!1037515))

(declare-fun m!1037517 () Bool)

(assert (=> b!1123580 m!1037517))

(declare-fun m!1037519 () Bool)

(assert (=> b!1123587 m!1037519))

(declare-fun m!1037521 () Bool)

(assert (=> b!1123589 m!1037521))

(declare-fun m!1037523 () Bool)

(assert (=> b!1123579 m!1037523))

(assert (=> b!1123579 m!1037505))

(declare-fun m!1037525 () Bool)

(assert (=> b!1123581 m!1037525))

(declare-fun m!1037527 () Bool)

(assert (=> b!1123593 m!1037527))

(assert (=> b!1123593 m!1037527))

(declare-fun m!1037529 () Bool)

(assert (=> b!1123593 m!1037529))

(declare-fun m!1037531 () Bool)

(assert (=> b!1123593 m!1037531))

(declare-fun m!1037533 () Bool)

(assert (=> b!1123588 m!1037533))

(declare-fun m!1037535 () Bool)

(assert (=> b!1123588 m!1037535))

(declare-fun m!1037537 () Bool)

(assert (=> b!1123588 m!1037537))

(declare-fun m!1037539 () Bool)

(assert (=> b!1123588 m!1037539))

(declare-fun m!1037541 () Bool)

(assert (=> b!1123585 m!1037541))

(declare-fun m!1037543 () Bool)

(assert (=> b!1123585 m!1037543))

(check-sat b_and!38141 (not b!1123593) (not b_next!23689) (not start!97982) (not b_lambda!18641) (not bm!47323) (not b!1123579) (not b!1123580) (not b!1123585) (not b!1123587) (not b!1123595) (not bm!47324) (not mapNonEmpty!44146) (not b!1123591) tp_is_empty!28219 (not b!1123589) (not b!1123584) (not b!1123596) (not b!1123588) (not b!1123581))
(check-sat b_and!38141 (not b_next!23689))
