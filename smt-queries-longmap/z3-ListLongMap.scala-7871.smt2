; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97972 () Bool)

(assert start!97972)

(declare-fun b_free!23673 () Bool)

(declare-fun b_next!23673 () Bool)

(assert (=> start!97972 (= b_free!23673 (not b_next!23673))))

(declare-fun tp!83723 () Bool)

(declare-fun b_and!38129 () Bool)

(assert (=> start!97972 (= tp!83723 b_and!38129)))

(declare-fun b!1123245 () Bool)

(declare-fun e!639474 () Bool)

(declare-fun e!639469 () Bool)

(declare-fun mapRes!44122 () Bool)

(assert (=> b!1123245 (= e!639474 (and e!639469 mapRes!44122))))

(declare-fun condMapEmpty!44122 () Bool)

(declare-datatypes ((V!42731 0))(
  ( (V!42732 (val!14158 Int)) )
))
(declare-datatypes ((ValueCell!13392 0))(
  ( (ValueCellFull!13392 (v!16791 V!42731)) (EmptyCell!13392) )
))
(declare-datatypes ((array!73277 0))(
  ( (array!73278 (arr!35291 (Array (_ BitVec 32) ValueCell!13392)) (size!35827 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73277)

(declare-fun mapDefault!44122 () ValueCell!13392)

(assert (=> b!1123245 (= condMapEmpty!44122 (= (arr!35291 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13392)) mapDefault!44122)))))

(declare-fun b!1123246 () Bool)

(declare-fun e!639475 () Bool)

(declare-datatypes ((tuple2!17782 0))(
  ( (tuple2!17783 (_1!8902 (_ BitVec 64)) (_2!8902 V!42731)) )
))
(declare-datatypes ((List!24560 0))(
  ( (Nil!24557) (Cons!24556 (h!25765 tuple2!17782) (t!35225 List!24560)) )
))
(declare-datatypes ((ListLongMap!15751 0))(
  ( (ListLongMap!15752 (toList!7891 List!24560)) )
))
(declare-fun call!47302 () ListLongMap!15751)

(declare-fun call!47301 () ListLongMap!15751)

(assert (=> b!1123246 (= e!639475 (= call!47302 call!47301))))

(declare-fun b!1123247 () Bool)

(declare-fun e!639473 () Bool)

(declare-fun tp_is_empty!28203 () Bool)

(assert (=> b!1123247 (= e!639473 tp_is_empty!28203)))

(declare-fun b!1123248 () Bool)

(declare-fun res!750438 () Bool)

(declare-fun e!639476 () Bool)

(assert (=> b!1123248 (=> (not res!750438) (not e!639476))))

(declare-datatypes ((array!73279 0))(
  ( (array!73280 (arr!35292 (Array (_ BitVec 32) (_ BitVec 64))) (size!35828 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73279)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1123248 (= res!750438 (= (select (arr!35292 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!44122 () Bool)

(assert (=> mapIsEmpty!44122 mapRes!44122))

(declare-fun b!1123249 () Bool)

(declare-fun res!750442 () Bool)

(assert (=> b!1123249 (=> (not res!750442) (not e!639476))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73279 (_ BitVec 32)) Bool)

(assert (=> b!1123249 (= res!750442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun zeroValue!944 () V!42731)

(declare-fun lt!499018 () array!73279)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!47298 () Bool)

(declare-fun minValue!944 () V!42731)

(declare-fun lt!499021 () array!73277)

(declare-fun getCurrentListMapNoExtraKeys!4379 (array!73279 array!73277 (_ BitVec 32) (_ BitVec 32) V!42731 V!42731 (_ BitVec 32) Int) ListLongMap!15751)

(assert (=> bm!47298 (= call!47302 (getCurrentListMapNoExtraKeys!4379 lt!499018 lt!499021 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123250 () Bool)

(declare-fun e!639477 () Bool)

(assert (=> b!1123250 (= e!639476 e!639477)))

(declare-fun res!750443 () Bool)

(assert (=> b!1123250 (=> (not res!750443) (not e!639477))))

(assert (=> b!1123250 (= res!750443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499018 mask!1564))))

(assert (=> b!1123250 (= lt!499018 (array!73280 (store (arr!35292 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35828 _keys!1208)))))

(declare-fun b!1123251 () Bool)

(declare-fun e!639470 () Bool)

(declare-fun e!639471 () Bool)

(assert (=> b!1123251 (= e!639470 e!639471)))

(declare-fun res!750445 () Bool)

(assert (=> b!1123251 (=> res!750445 e!639471)))

(assert (=> b!1123251 (= res!750445 (not (= from!1455 i!673)))))

(declare-fun lt!499019 () ListLongMap!15751)

(assert (=> b!1123251 (= lt!499019 (getCurrentListMapNoExtraKeys!4379 lt!499018 lt!499021 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2475 (Int (_ BitVec 64)) V!42731)

(assert (=> b!1123251 (= lt!499021 (array!73278 (store (arr!35291 _values!996) i!673 (ValueCellFull!13392 (dynLambda!2475 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35827 _values!996)))))

(declare-fun lt!499016 () ListLongMap!15751)

(assert (=> b!1123251 (= lt!499016 (getCurrentListMapNoExtraKeys!4379 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123252 () Bool)

(declare-fun res!750446 () Bool)

(assert (=> b!1123252 (=> (not res!750446) (not e!639476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123252 (= res!750446 (validMask!0 mask!1564))))

(declare-fun res!750447 () Bool)

(assert (=> start!97972 (=> (not res!750447) (not e!639476))))

(assert (=> start!97972 (= res!750447 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35828 _keys!1208))))))

(assert (=> start!97972 e!639476))

(assert (=> start!97972 tp_is_empty!28203))

(declare-fun array_inv!27096 (array!73279) Bool)

(assert (=> start!97972 (array_inv!27096 _keys!1208)))

(assert (=> start!97972 true))

(assert (=> start!97972 tp!83723))

(declare-fun array_inv!27097 (array!73277) Bool)

(assert (=> start!97972 (and (array_inv!27097 _values!996) e!639474)))

(declare-fun b!1123253 () Bool)

(declare-fun res!750448 () Bool)

(assert (=> b!1123253 (=> (not res!750448) (not e!639476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123253 (= res!750448 (validKeyInArray!0 k0!934))))

(declare-fun b!1123254 () Bool)

(declare-fun res!750441 () Bool)

(assert (=> b!1123254 (=> (not res!750441) (not e!639477))))

(declare-datatypes ((List!24561 0))(
  ( (Nil!24558) (Cons!24557 (h!25766 (_ BitVec 64)) (t!35226 List!24561)) )
))
(declare-fun arrayNoDuplicates!0 (array!73279 (_ BitVec 32) List!24561) Bool)

(assert (=> b!1123254 (= res!750441 (arrayNoDuplicates!0 lt!499018 #b00000000000000000000000000000000 Nil!24558))))

(declare-fun bm!47299 () Bool)

(assert (=> bm!47299 (= call!47301 (getCurrentListMapNoExtraKeys!4379 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123255 () Bool)

(assert (=> b!1123255 (= e!639477 (not e!639470))))

(declare-fun res!750444 () Bool)

(assert (=> b!1123255 (=> res!750444 e!639470)))

(assert (=> b!1123255 (= res!750444 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123255 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36838 0))(
  ( (Unit!36839) )
))
(declare-fun lt!499017 () Unit!36838)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73279 (_ BitVec 64) (_ BitVec 32)) Unit!36838)

(assert (=> b!1123255 (= lt!499017 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1123256 () Bool)

(declare-fun e!639472 () Bool)

(assert (=> b!1123256 (= e!639472 true)))

(declare-fun lt!499020 () Bool)

(declare-fun contains!6431 (ListLongMap!15751 (_ BitVec 64)) Bool)

(assert (=> b!1123256 (= lt!499020 (contains!6431 (getCurrentListMapNoExtraKeys!4379 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1123257 () Bool)

(declare-fun res!750439 () Bool)

(assert (=> b!1123257 (=> (not res!750439) (not e!639476))))

(assert (=> b!1123257 (= res!750439 (and (= (size!35827 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35828 _keys!1208) (size!35827 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123258 () Bool)

(declare-fun res!750440 () Bool)

(assert (=> b!1123258 (=> (not res!750440) (not e!639476))))

(assert (=> b!1123258 (= res!750440 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24558))))

(declare-fun b!1123259 () Bool)

(assert (=> b!1123259 (= e!639471 e!639472)))

(declare-fun res!750436 () Bool)

(assert (=> b!1123259 (=> res!750436 e!639472)))

(assert (=> b!1123259 (= res!750436 (not (= (select (arr!35292 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1123259 e!639475))

(declare-fun c!109500 () Bool)

(assert (=> b!1123259 (= c!109500 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499022 () Unit!36838)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!344 (array!73279 array!73277 (_ BitVec 32) (_ BitVec 32) V!42731 V!42731 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36838)

(assert (=> b!1123259 (= lt!499022 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123260 () Bool)

(declare-fun res!750437 () Bool)

(assert (=> b!1123260 (=> (not res!750437) (not e!639476))))

(assert (=> b!1123260 (= res!750437 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35828 _keys!1208))))))

(declare-fun b!1123261 () Bool)

(assert (=> b!1123261 (= e!639469 tp_is_empty!28203)))

(declare-fun mapNonEmpty!44122 () Bool)

(declare-fun tp!83722 () Bool)

(assert (=> mapNonEmpty!44122 (= mapRes!44122 (and tp!83722 e!639473))))

(declare-fun mapKey!44122 () (_ BitVec 32))

(declare-fun mapRest!44122 () (Array (_ BitVec 32) ValueCell!13392))

(declare-fun mapValue!44122 () ValueCell!13392)

(assert (=> mapNonEmpty!44122 (= (arr!35291 _values!996) (store mapRest!44122 mapKey!44122 mapValue!44122))))

(declare-fun b!1123262 () Bool)

(declare-fun -!1096 (ListLongMap!15751 (_ BitVec 64)) ListLongMap!15751)

(assert (=> b!1123262 (= e!639475 (= call!47302 (-!1096 call!47301 k0!934)))))

(assert (= (and start!97972 res!750447) b!1123252))

(assert (= (and b!1123252 res!750446) b!1123257))

(assert (= (and b!1123257 res!750439) b!1123249))

(assert (= (and b!1123249 res!750442) b!1123258))

(assert (= (and b!1123258 res!750440) b!1123260))

(assert (= (and b!1123260 res!750437) b!1123253))

(assert (= (and b!1123253 res!750448) b!1123248))

(assert (= (and b!1123248 res!750438) b!1123250))

(assert (= (and b!1123250 res!750443) b!1123254))

(assert (= (and b!1123254 res!750441) b!1123255))

(assert (= (and b!1123255 (not res!750444)) b!1123251))

(assert (= (and b!1123251 (not res!750445)) b!1123259))

(assert (= (and b!1123259 c!109500) b!1123262))

(assert (= (and b!1123259 (not c!109500)) b!1123246))

(assert (= (or b!1123262 b!1123246) bm!47298))

(assert (= (or b!1123262 b!1123246) bm!47299))

(assert (= (and b!1123259 (not res!750436)) b!1123256))

(assert (= (and b!1123245 condMapEmpty!44122) mapIsEmpty!44122))

(assert (= (and b!1123245 (not condMapEmpty!44122)) mapNonEmpty!44122))

(get-info :version)

(assert (= (and mapNonEmpty!44122 ((_ is ValueCellFull!13392) mapValue!44122)) b!1123247))

(assert (= (and b!1123245 ((_ is ValueCellFull!13392) mapDefault!44122)) b!1123261))

(assert (= start!97972 b!1123245))

(declare-fun b_lambda!18643 () Bool)

(assert (=> (not b_lambda!18643) (not b!1123251)))

(declare-fun t!35224 () Bool)

(declare-fun tb!8485 () Bool)

(assert (=> (and start!97972 (= defaultEntry!1004 defaultEntry!1004) t!35224) tb!8485))

(declare-fun result!17531 () Bool)

(assert (=> tb!8485 (= result!17531 tp_is_empty!28203)))

(assert (=> b!1123251 t!35224))

(declare-fun b_and!38131 () Bool)

(assert (= b_and!38129 (and (=> t!35224 result!17531) b_and!38131)))

(declare-fun m!1037753 () Bool)

(assert (=> bm!47299 m!1037753))

(declare-fun m!1037755 () Bool)

(assert (=> b!1123252 m!1037755))

(declare-fun m!1037757 () Bool)

(assert (=> b!1123254 m!1037757))

(declare-fun m!1037759 () Bool)

(assert (=> bm!47298 m!1037759))

(declare-fun m!1037761 () Bool)

(assert (=> start!97972 m!1037761))

(declare-fun m!1037763 () Bool)

(assert (=> start!97972 m!1037763))

(declare-fun m!1037765 () Bool)

(assert (=> b!1123248 m!1037765))

(declare-fun m!1037767 () Bool)

(assert (=> b!1123262 m!1037767))

(declare-fun m!1037769 () Bool)

(assert (=> b!1123255 m!1037769))

(declare-fun m!1037771 () Bool)

(assert (=> b!1123255 m!1037771))

(declare-fun m!1037773 () Bool)

(assert (=> b!1123250 m!1037773))

(declare-fun m!1037775 () Bool)

(assert (=> b!1123250 m!1037775))

(declare-fun m!1037777 () Bool)

(assert (=> b!1123251 m!1037777))

(declare-fun m!1037779 () Bool)

(assert (=> b!1123251 m!1037779))

(declare-fun m!1037781 () Bool)

(assert (=> b!1123251 m!1037781))

(declare-fun m!1037783 () Bool)

(assert (=> b!1123251 m!1037783))

(declare-fun m!1037785 () Bool)

(assert (=> b!1123258 m!1037785))

(declare-fun m!1037787 () Bool)

(assert (=> mapNonEmpty!44122 m!1037787))

(declare-fun m!1037789 () Bool)

(assert (=> b!1123253 m!1037789))

(declare-fun m!1037791 () Bool)

(assert (=> b!1123259 m!1037791))

(declare-fun m!1037793 () Bool)

(assert (=> b!1123259 m!1037793))

(assert (=> b!1123256 m!1037753))

(assert (=> b!1123256 m!1037753))

(declare-fun m!1037795 () Bool)

(assert (=> b!1123256 m!1037795))

(declare-fun m!1037797 () Bool)

(assert (=> b!1123249 m!1037797))

(check-sat (not b!1123258) b_and!38131 (not b!1123251) (not bm!47299) (not b_next!23673) (not b!1123253) (not b!1123255) (not b!1123254) (not b!1123249) tp_is_empty!28203 (not b!1123252) (not b!1123250) (not b_lambda!18643) (not bm!47298) (not start!97972) (not b!1123262) (not b!1123256) (not b!1123259) (not mapNonEmpty!44122))
(check-sat b_and!38131 (not b_next!23673))
