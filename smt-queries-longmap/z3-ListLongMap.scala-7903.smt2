; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98156 () Bool)

(assert start!98156)

(declare-fun b_free!23863 () Bool)

(declare-fun b_next!23863 () Bool)

(assert (=> start!98156 (= b_free!23863 (not b_next!23863))))

(declare-fun tp!84292 () Bool)

(declare-fun b_and!38487 () Bool)

(assert (=> start!98156 (= tp!84292 b_and!38487)))

(declare-datatypes ((V!42985 0))(
  ( (V!42986 (val!14253 Int)) )
))
(declare-fun zeroValue!944 () V!42985)

(declare-fun bm!47845 () Bool)

(declare-datatypes ((array!73568 0))(
  ( (array!73569 (arr!35437 (Array (_ BitVec 32) (_ BitVec 64))) (size!35975 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73568)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13487 0))(
  ( (ValueCellFull!13487 (v!16885 V!42985)) (EmptyCell!13487) )
))
(declare-datatypes ((array!73570 0))(
  ( (array!73571 (arr!35438 (Array (_ BitVec 32) ValueCell!13487)) (size!35976 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73570)

(declare-datatypes ((tuple2!18032 0))(
  ( (tuple2!18033 (_1!9027 (_ BitVec 64)) (_2!9027 V!42985)) )
))
(declare-datatypes ((List!24786 0))(
  ( (Nil!24783) (Cons!24782 (h!25991 tuple2!18032) (t!35632 List!24786)) )
))
(declare-datatypes ((ListLongMap!16001 0))(
  ( (ListLongMap!16002 (toList!8016 List!24786)) )
))
(declare-fun call!47849 () ListLongMap!16001)

(declare-fun minValue!944 () V!42985)

(declare-fun getCurrentListMapNoExtraKeys!4516 (array!73568 array!73570 (_ BitVec 32) (_ BitVec 32) V!42985 V!42985 (_ BitVec 32) Int) ListLongMap!16001)

(assert (=> bm!47845 (= call!47849 (getCurrentListMapNoExtraKeys!4516 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128643 () Bool)

(declare-fun e!642332 () Bool)

(declare-fun call!47848 () ListLongMap!16001)

(assert (=> b!1128643 (= e!642332 (= call!47848 call!47849))))

(declare-fun b!1128644 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1132 (ListLongMap!16001 (_ BitVec 64)) ListLongMap!16001)

(assert (=> b!1128644 (= e!642332 (= call!47848 (-!1132 call!47849 k0!934)))))

(declare-fun b!1128645 () Bool)

(declare-fun res!754289 () Bool)

(declare-fun e!642329 () Bool)

(assert (=> b!1128645 (=> (not res!754289) (not e!642329))))

(declare-datatypes ((List!24787 0))(
  ( (Nil!24784) (Cons!24783 (h!25992 (_ BitVec 64)) (t!35633 List!24787)) )
))
(declare-fun arrayNoDuplicates!0 (array!73568 (_ BitVec 32) List!24787) Bool)

(assert (=> b!1128645 (= res!754289 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24784))))

(declare-fun b!1128646 () Bool)

(declare-fun e!642327 () Bool)

(declare-fun e!642330 () Bool)

(assert (=> b!1128646 (= e!642327 e!642330)))

(declare-fun res!754279 () Bool)

(assert (=> b!1128646 (=> res!754279 e!642330)))

(assert (=> b!1128646 (= res!754279 (not (= (select (arr!35437 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1128646 e!642332))

(declare-fun c!109758 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128646 (= c!109758 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36827 0))(
  ( (Unit!36828) )
))
(declare-fun lt!500877 () Unit!36827)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!415 (array!73568 array!73570 (_ BitVec 32) (_ BitVec 32) V!42985 V!42985 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36827)

(assert (=> b!1128646 (= lt!500877 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128647 () Bool)

(declare-fun res!754282 () Bool)

(assert (=> b!1128647 (=> (not res!754282) (not e!642329))))

(assert (=> b!1128647 (= res!754282 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35975 _keys!1208))))))

(declare-fun b!1128648 () Bool)

(declare-fun res!754280 () Bool)

(assert (=> b!1128648 (=> (not res!754280) (not e!642329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128648 (= res!754280 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44407 () Bool)

(declare-fun mapRes!44407 () Bool)

(declare-fun tp!84293 () Bool)

(declare-fun e!642328 () Bool)

(assert (=> mapNonEmpty!44407 (= mapRes!44407 (and tp!84293 e!642328))))

(declare-fun mapKey!44407 () (_ BitVec 32))

(declare-fun mapValue!44407 () ValueCell!13487)

(declare-fun mapRest!44407 () (Array (_ BitVec 32) ValueCell!13487))

(assert (=> mapNonEmpty!44407 (= (arr!35438 _values!996) (store mapRest!44407 mapKey!44407 mapValue!44407))))

(declare-fun bm!47846 () Bool)

(declare-fun lt!500875 () array!73570)

(declare-fun lt!500878 () array!73568)

(assert (=> bm!47846 (= call!47848 (getCurrentListMapNoExtraKeys!4516 lt!500878 lt!500875 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44407 () Bool)

(assert (=> mapIsEmpty!44407 mapRes!44407))

(declare-fun res!754285 () Bool)

(assert (=> start!98156 (=> (not res!754285) (not e!642329))))

(assert (=> start!98156 (= res!754285 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35975 _keys!1208))))))

(assert (=> start!98156 e!642329))

(declare-fun tp_is_empty!28393 () Bool)

(assert (=> start!98156 tp_is_empty!28393))

(declare-fun array_inv!27266 (array!73568) Bool)

(assert (=> start!98156 (array_inv!27266 _keys!1208)))

(assert (=> start!98156 true))

(assert (=> start!98156 tp!84292))

(declare-fun e!642333 () Bool)

(declare-fun array_inv!27267 (array!73570) Bool)

(assert (=> start!98156 (and (array_inv!27267 _values!996) e!642333)))

(declare-fun b!1128649 () Bool)

(declare-fun res!754290 () Bool)

(assert (=> b!1128649 (=> (not res!754290) (not e!642329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128649 (= res!754290 (validMask!0 mask!1564))))

(declare-fun b!1128650 () Bool)

(declare-fun res!754288 () Bool)

(assert (=> b!1128650 (=> (not res!754288) (not e!642329))))

(assert (=> b!1128650 (= res!754288 (= (select (arr!35437 _keys!1208) i!673) k0!934))))

(declare-fun b!1128651 () Bool)

(declare-fun res!754287 () Bool)

(declare-fun e!642336 () Bool)

(assert (=> b!1128651 (=> (not res!754287) (not e!642336))))

(assert (=> b!1128651 (= res!754287 (arrayNoDuplicates!0 lt!500878 #b00000000000000000000000000000000 Nil!24784))))

(declare-fun b!1128652 () Bool)

(assert (=> b!1128652 (= e!642330 true)))

(declare-fun lt!500880 () Bool)

(declare-fun contains!6469 (ListLongMap!16001 (_ BitVec 64)) Bool)

(assert (=> b!1128652 (= lt!500880 (contains!6469 (getCurrentListMapNoExtraKeys!4516 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1128653 () Bool)

(declare-fun res!754284 () Bool)

(assert (=> b!1128653 (=> (not res!754284) (not e!642329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73568 (_ BitVec 32)) Bool)

(assert (=> b!1128653 (= res!754284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128654 () Bool)

(declare-fun res!754281 () Bool)

(assert (=> b!1128654 (=> (not res!754281) (not e!642329))))

(assert (=> b!1128654 (= res!754281 (and (= (size!35976 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35975 _keys!1208) (size!35976 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128655 () Bool)

(declare-fun e!642335 () Bool)

(assert (=> b!1128655 (= e!642336 (not e!642335))))

(declare-fun res!754283 () Bool)

(assert (=> b!1128655 (=> res!754283 e!642335)))

(assert (=> b!1128655 (= res!754283 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128655 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500874 () Unit!36827)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73568 (_ BitVec 64) (_ BitVec 32)) Unit!36827)

(assert (=> b!1128655 (= lt!500874 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1128656 () Bool)

(assert (=> b!1128656 (= e!642329 e!642336)))

(declare-fun res!754286 () Bool)

(assert (=> b!1128656 (=> (not res!754286) (not e!642336))))

(assert (=> b!1128656 (= res!754286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500878 mask!1564))))

(assert (=> b!1128656 (= lt!500878 (array!73569 (store (arr!35437 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35975 _keys!1208)))))

(declare-fun b!1128657 () Bool)

(declare-fun e!642331 () Bool)

(assert (=> b!1128657 (= e!642333 (and e!642331 mapRes!44407))))

(declare-fun condMapEmpty!44407 () Bool)

(declare-fun mapDefault!44407 () ValueCell!13487)

(assert (=> b!1128657 (= condMapEmpty!44407 (= (arr!35438 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13487)) mapDefault!44407)))))

(declare-fun b!1128658 () Bool)

(assert (=> b!1128658 (= e!642331 tp_is_empty!28393)))

(declare-fun b!1128659 () Bool)

(assert (=> b!1128659 (= e!642335 e!642327)))

(declare-fun res!754291 () Bool)

(assert (=> b!1128659 (=> res!754291 e!642327)))

(assert (=> b!1128659 (= res!754291 (not (= from!1455 i!673)))))

(declare-fun lt!500879 () ListLongMap!16001)

(assert (=> b!1128659 (= lt!500879 (getCurrentListMapNoExtraKeys!4516 lt!500878 lt!500875 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2524 (Int (_ BitVec 64)) V!42985)

(assert (=> b!1128659 (= lt!500875 (array!73571 (store (arr!35438 _values!996) i!673 (ValueCellFull!13487 (dynLambda!2524 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35976 _values!996)))))

(declare-fun lt!500876 () ListLongMap!16001)

(assert (=> b!1128659 (= lt!500876 (getCurrentListMapNoExtraKeys!4516 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128660 () Bool)

(assert (=> b!1128660 (= e!642328 tp_is_empty!28393)))

(assert (= (and start!98156 res!754285) b!1128649))

(assert (= (and b!1128649 res!754290) b!1128654))

(assert (= (and b!1128654 res!754281) b!1128653))

(assert (= (and b!1128653 res!754284) b!1128645))

(assert (= (and b!1128645 res!754289) b!1128647))

(assert (= (and b!1128647 res!754282) b!1128648))

(assert (= (and b!1128648 res!754280) b!1128650))

(assert (= (and b!1128650 res!754288) b!1128656))

(assert (= (and b!1128656 res!754286) b!1128651))

(assert (= (and b!1128651 res!754287) b!1128655))

(assert (= (and b!1128655 (not res!754283)) b!1128659))

(assert (= (and b!1128659 (not res!754291)) b!1128646))

(assert (= (and b!1128646 c!109758) b!1128644))

(assert (= (and b!1128646 (not c!109758)) b!1128643))

(assert (= (or b!1128644 b!1128643) bm!47846))

(assert (= (or b!1128644 b!1128643) bm!47845))

(assert (= (and b!1128646 (not res!754279)) b!1128652))

(assert (= (and b!1128657 condMapEmpty!44407) mapIsEmpty!44407))

(assert (= (and b!1128657 (not condMapEmpty!44407)) mapNonEmpty!44407))

(get-info :version)

(assert (= (and mapNonEmpty!44407 ((_ is ValueCellFull!13487) mapValue!44407)) b!1128660))

(assert (= (and b!1128657 ((_ is ValueCellFull!13487) mapDefault!44407)) b!1128658))

(assert (= start!98156 b!1128657))

(declare-fun b_lambda!18815 () Bool)

(assert (=> (not b_lambda!18815) (not b!1128659)))

(declare-fun t!35631 () Bool)

(declare-fun tb!8667 () Bool)

(assert (=> (and start!98156 (= defaultEntry!1004 defaultEntry!1004) t!35631) tb!8667))

(declare-fun result!17903 () Bool)

(assert (=> tb!8667 (= result!17903 tp_is_empty!28393)))

(assert (=> b!1128659 t!35631))

(declare-fun b_and!38489 () Bool)

(assert (= b_and!38487 (and (=> t!35631 result!17903) b_and!38489)))

(declare-fun m!1041675 () Bool)

(assert (=> b!1128653 m!1041675))

(declare-fun m!1041677 () Bool)

(assert (=> b!1128644 m!1041677))

(declare-fun m!1041679 () Bool)

(assert (=> bm!47845 m!1041679))

(declare-fun m!1041681 () Bool)

(assert (=> b!1128649 m!1041681))

(declare-fun m!1041683 () Bool)

(assert (=> mapNonEmpty!44407 m!1041683))

(declare-fun m!1041685 () Bool)

(assert (=> b!1128655 m!1041685))

(declare-fun m!1041687 () Bool)

(assert (=> b!1128655 m!1041687))

(declare-fun m!1041689 () Bool)

(assert (=> b!1128659 m!1041689))

(declare-fun m!1041691 () Bool)

(assert (=> b!1128659 m!1041691))

(declare-fun m!1041693 () Bool)

(assert (=> b!1128659 m!1041693))

(declare-fun m!1041695 () Bool)

(assert (=> b!1128659 m!1041695))

(declare-fun m!1041697 () Bool)

(assert (=> b!1128645 m!1041697))

(declare-fun m!1041699 () Bool)

(assert (=> start!98156 m!1041699))

(declare-fun m!1041701 () Bool)

(assert (=> start!98156 m!1041701))

(declare-fun m!1041703 () Bool)

(assert (=> b!1128646 m!1041703))

(declare-fun m!1041705 () Bool)

(assert (=> b!1128646 m!1041705))

(declare-fun m!1041707 () Bool)

(assert (=> b!1128651 m!1041707))

(declare-fun m!1041709 () Bool)

(assert (=> b!1128650 m!1041709))

(declare-fun m!1041711 () Bool)

(assert (=> bm!47846 m!1041711))

(declare-fun m!1041713 () Bool)

(assert (=> b!1128656 m!1041713))

(declare-fun m!1041715 () Bool)

(assert (=> b!1128656 m!1041715))

(declare-fun m!1041717 () Bool)

(assert (=> b!1128648 m!1041717))

(assert (=> b!1128652 m!1041679))

(assert (=> b!1128652 m!1041679))

(declare-fun m!1041719 () Bool)

(assert (=> b!1128652 m!1041719))

(check-sat (not b!1128648) (not bm!47845) (not start!98156) (not b!1128656) (not b!1128653) (not b!1128651) (not mapNonEmpty!44407) (not b!1128652) (not b!1128645) (not b!1128649) b_and!38489 (not bm!47846) (not b!1128644) tp_is_empty!28393 (not b!1128655) (not b_lambda!18815) (not b!1128646) (not b_next!23863) (not b!1128659))
(check-sat b_and!38489 (not b_next!23863))
