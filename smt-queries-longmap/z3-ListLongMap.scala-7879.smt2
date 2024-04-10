; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98020 () Bool)

(assert start!98020)

(declare-fun b_free!23721 () Bool)

(declare-fun b_next!23721 () Bool)

(assert (=> start!98020 (= b_free!23721 (not b_next!23721))))

(declare-fun tp!83866 () Bool)

(declare-fun b_and!38225 () Bool)

(assert (=> start!98020 (= tp!83866 b_and!38225)))

(declare-fun b!1124698 () Bool)

(declare-fun e!640244 () Bool)

(declare-datatypes ((V!42795 0))(
  ( (V!42796 (val!14182 Int)) )
))
(declare-datatypes ((tuple2!17816 0))(
  ( (tuple2!17817 (_1!8919 (_ BitVec 64)) (_2!8919 V!42795)) )
))
(declare-datatypes ((List!24596 0))(
  ( (Nil!24593) (Cons!24592 (h!25801 tuple2!17816) (t!35309 List!24596)) )
))
(declare-datatypes ((ListLongMap!15785 0))(
  ( (ListLongMap!15786 (toList!7908 List!24596)) )
))
(declare-fun call!47446 () ListLongMap!15785)

(declare-fun call!47445 () ListLongMap!15785)

(assert (=> b!1124698 (= e!640244 (= call!47446 call!47445))))

(declare-fun mapNonEmpty!44194 () Bool)

(declare-fun mapRes!44194 () Bool)

(declare-fun tp!83867 () Bool)

(declare-fun e!640245 () Bool)

(assert (=> mapNonEmpty!44194 (= mapRes!44194 (and tp!83867 e!640245))))

(declare-datatypes ((ValueCell!13416 0))(
  ( (ValueCellFull!13416 (v!16815 V!42795)) (EmptyCell!13416) )
))
(declare-fun mapValue!44194 () ValueCell!13416)

(declare-datatypes ((array!73369 0))(
  ( (array!73370 (arr!35337 (Array (_ BitVec 32) ValueCell!13416)) (size!35873 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73369)

(declare-fun mapKey!44194 () (_ BitVec 32))

(declare-fun mapRest!44194 () (Array (_ BitVec 32) ValueCell!13416))

(assert (=> mapNonEmpty!44194 (= (arr!35337 _values!996) (store mapRest!44194 mapKey!44194 mapValue!44194))))

(declare-fun b!1124699 () Bool)

(declare-fun e!640241 () Bool)

(declare-fun e!640248 () Bool)

(assert (=> b!1124699 (= e!640241 e!640248)))

(declare-fun res!751491 () Bool)

(assert (=> b!1124699 (=> (not res!751491) (not e!640248))))

(declare-datatypes ((array!73371 0))(
  ( (array!73372 (arr!35338 (Array (_ BitVec 32) (_ BitVec 64))) (size!35874 (_ BitVec 32))) )
))
(declare-fun lt!499567 () array!73371)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73371 (_ BitVec 32)) Bool)

(assert (=> b!1124699 (= res!751491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499567 mask!1564))))

(declare-fun _keys!1208 () array!73371)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124699 (= lt!499567 (array!73372 (store (arr!35338 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35874 _keys!1208)))))

(declare-fun zeroValue!944 () V!42795)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42795)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!47442 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4396 (array!73371 array!73369 (_ BitVec 32) (_ BitVec 32) V!42795 V!42795 (_ BitVec 32) Int) ListLongMap!15785)

(assert (=> bm!47442 (= call!47445 (getCurrentListMapNoExtraKeys!4396 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124700 () Bool)

(declare-fun e!640247 () Bool)

(declare-fun e!640246 () Bool)

(assert (=> b!1124700 (= e!640247 e!640246)))

(declare-fun res!751484 () Bool)

(assert (=> b!1124700 (=> res!751484 e!640246)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1124700 (= res!751484 (not (= (select (arr!35338 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1124700 e!640244))

(declare-fun c!109572 () Bool)

(assert (=> b!1124700 (= c!109572 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36868 0))(
  ( (Unit!36869) )
))
(declare-fun lt!499563 () Unit!36868)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!358 (array!73371 array!73369 (_ BitVec 32) (_ BitVec 32) V!42795 V!42795 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36868)

(assert (=> b!1124700 (= lt!499563 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!358 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124701 () Bool)

(declare-fun e!640243 () Bool)

(declare-fun e!640242 () Bool)

(assert (=> b!1124701 (= e!640243 (and e!640242 mapRes!44194))))

(declare-fun condMapEmpty!44194 () Bool)

(declare-fun mapDefault!44194 () ValueCell!13416)

(assert (=> b!1124701 (= condMapEmpty!44194 (= (arr!35337 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13416)) mapDefault!44194)))))

(declare-fun b!1124702 () Bool)

(declare-fun res!751490 () Bool)

(declare-fun e!640238 () Bool)

(assert (=> b!1124702 (=> res!751490 e!640238)))

(assert (=> b!1124702 (= res!751490 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1124703 () Bool)

(declare-fun e!640240 () Bool)

(assert (=> b!1124703 (= e!640248 (not e!640240))))

(declare-fun res!751486 () Bool)

(assert (=> b!1124703 (=> res!751486 e!640240)))

(assert (=> b!1124703 (= res!751486 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124703 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499564 () Unit!36868)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73371 (_ BitVec 64) (_ BitVec 32)) Unit!36868)

(assert (=> b!1124703 (= lt!499564 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1124704 () Bool)

(declare-fun res!751483 () Bool)

(assert (=> b!1124704 (=> (not res!751483) (not e!640241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124704 (= res!751483 (validMask!0 mask!1564))))

(declare-fun b!1124705 () Bool)

(declare-fun res!751488 () Bool)

(assert (=> b!1124705 (=> (not res!751488) (not e!640241))))

(assert (=> b!1124705 (= res!751488 (and (= (size!35873 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35874 _keys!1208) (size!35873 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1124706 () Bool)

(declare-fun res!751493 () Bool)

(assert (=> b!1124706 (=> (not res!751493) (not e!640241))))

(assert (=> b!1124706 (= res!751493 (= (select (arr!35338 _keys!1208) i!673) k0!934))))

(declare-fun b!1124707 () Bool)

(assert (=> b!1124707 (= e!640238 true)))

(declare-fun lt!499565 () ListLongMap!15785)

(declare-fun contains!6446 (ListLongMap!15785 (_ BitVec 64)) Bool)

(declare-fun +!3416 (ListLongMap!15785 tuple2!17816) ListLongMap!15785)

(assert (=> b!1124707 (contains!6446 (+!3416 lt!499565 (tuple2!17817 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499562 () Unit!36868)

(declare-fun addStillContains!678 (ListLongMap!15785 (_ BitVec 64) V!42795 (_ BitVec 64)) Unit!36868)

(assert (=> b!1124707 (= lt!499562 (addStillContains!678 lt!499565 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1124708 () Bool)

(assert (=> b!1124708 (= e!640246 e!640238)))

(declare-fun res!751487 () Bool)

(assert (=> b!1124708 (=> res!751487 e!640238)))

(assert (=> b!1124708 (= res!751487 (not (contains!6446 lt!499565 k0!934)))))

(assert (=> b!1124708 (= lt!499565 (getCurrentListMapNoExtraKeys!4396 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124709 () Bool)

(declare-fun res!751482 () Bool)

(assert (=> b!1124709 (=> (not res!751482) (not e!640241))))

(declare-datatypes ((List!24597 0))(
  ( (Nil!24594) (Cons!24593 (h!25802 (_ BitVec 64)) (t!35310 List!24597)) )
))
(declare-fun arrayNoDuplicates!0 (array!73371 (_ BitVec 32) List!24597) Bool)

(assert (=> b!1124709 (= res!751482 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24594))))

(declare-fun b!1124710 () Bool)

(declare-fun res!751494 () Bool)

(assert (=> b!1124710 (=> (not res!751494) (not e!640241))))

(assert (=> b!1124710 (= res!751494 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35874 _keys!1208))))))

(declare-fun b!1124711 () Bool)

(declare-fun -!1111 (ListLongMap!15785 (_ BitVec 64)) ListLongMap!15785)

(assert (=> b!1124711 (= e!640244 (= call!47446 (-!1111 call!47445 k0!934)))))

(declare-fun res!751481 () Bool)

(assert (=> start!98020 (=> (not res!751481) (not e!640241))))

(assert (=> start!98020 (= res!751481 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35874 _keys!1208))))))

(assert (=> start!98020 e!640241))

(declare-fun tp_is_empty!28251 () Bool)

(assert (=> start!98020 tp_is_empty!28251))

(declare-fun array_inv!27124 (array!73371) Bool)

(assert (=> start!98020 (array_inv!27124 _keys!1208)))

(assert (=> start!98020 true))

(assert (=> start!98020 tp!83866))

(declare-fun array_inv!27125 (array!73369) Bool)

(assert (=> start!98020 (and (array_inv!27125 _values!996) e!640243)))

(declare-fun b!1124712 () Bool)

(declare-fun res!751495 () Bool)

(assert (=> b!1124712 (=> (not res!751495) (not e!640241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124712 (= res!751495 (validKeyInArray!0 k0!934))))

(declare-fun b!1124713 () Bool)

(assert (=> b!1124713 (= e!640240 e!640247)))

(declare-fun res!751485 () Bool)

(assert (=> b!1124713 (=> res!751485 e!640247)))

(assert (=> b!1124713 (= res!751485 (not (= from!1455 i!673)))))

(declare-fun lt!499566 () array!73369)

(declare-fun lt!499561 () ListLongMap!15785)

(assert (=> b!1124713 (= lt!499561 (getCurrentListMapNoExtraKeys!4396 lt!499567 lt!499566 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2490 (Int (_ BitVec 64)) V!42795)

(assert (=> b!1124713 (= lt!499566 (array!73370 (store (arr!35337 _values!996) i!673 (ValueCellFull!13416 (dynLambda!2490 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35873 _values!996)))))

(declare-fun lt!499568 () ListLongMap!15785)

(assert (=> b!1124713 (= lt!499568 (getCurrentListMapNoExtraKeys!4396 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47443 () Bool)

(assert (=> bm!47443 (= call!47446 (getCurrentListMapNoExtraKeys!4396 lt!499567 lt!499566 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44194 () Bool)

(assert (=> mapIsEmpty!44194 mapRes!44194))

(declare-fun b!1124714 () Bool)

(assert (=> b!1124714 (= e!640245 tp_is_empty!28251)))

(declare-fun b!1124715 () Bool)

(declare-fun res!751489 () Bool)

(assert (=> b!1124715 (=> (not res!751489) (not e!640248))))

(assert (=> b!1124715 (= res!751489 (arrayNoDuplicates!0 lt!499567 #b00000000000000000000000000000000 Nil!24594))))

(declare-fun b!1124716 () Bool)

(declare-fun res!751492 () Bool)

(assert (=> b!1124716 (=> (not res!751492) (not e!640241))))

(assert (=> b!1124716 (= res!751492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1124717 () Bool)

(assert (=> b!1124717 (= e!640242 tp_is_empty!28251)))

(assert (= (and start!98020 res!751481) b!1124704))

(assert (= (and b!1124704 res!751483) b!1124705))

(assert (= (and b!1124705 res!751488) b!1124716))

(assert (= (and b!1124716 res!751492) b!1124709))

(assert (= (and b!1124709 res!751482) b!1124710))

(assert (= (and b!1124710 res!751494) b!1124712))

(assert (= (and b!1124712 res!751495) b!1124706))

(assert (= (and b!1124706 res!751493) b!1124699))

(assert (= (and b!1124699 res!751491) b!1124715))

(assert (= (and b!1124715 res!751489) b!1124703))

(assert (= (and b!1124703 (not res!751486)) b!1124713))

(assert (= (and b!1124713 (not res!751485)) b!1124700))

(assert (= (and b!1124700 c!109572) b!1124711))

(assert (= (and b!1124700 (not c!109572)) b!1124698))

(assert (= (or b!1124711 b!1124698) bm!47443))

(assert (= (or b!1124711 b!1124698) bm!47442))

(assert (= (and b!1124700 (not res!751484)) b!1124708))

(assert (= (and b!1124708 (not res!751487)) b!1124702))

(assert (= (and b!1124702 (not res!751490)) b!1124707))

(assert (= (and b!1124701 condMapEmpty!44194) mapIsEmpty!44194))

(assert (= (and b!1124701 (not condMapEmpty!44194)) mapNonEmpty!44194))

(get-info :version)

(assert (= (and mapNonEmpty!44194 ((_ is ValueCellFull!13416) mapValue!44194)) b!1124714))

(assert (= (and b!1124701 ((_ is ValueCellFull!13416) mapDefault!44194)) b!1124717))

(assert (= start!98020 b!1124701))

(declare-fun b_lambda!18691 () Bool)

(assert (=> (not b_lambda!18691) (not b!1124713)))

(declare-fun t!35308 () Bool)

(declare-fun tb!8533 () Bool)

(assert (=> (and start!98020 (= defaultEntry!1004 defaultEntry!1004) t!35308) tb!8533))

(declare-fun result!17627 () Bool)

(assert (=> tb!8533 (= result!17627 tp_is_empty!28251)))

(assert (=> b!1124713 t!35308))

(declare-fun b_and!38227 () Bool)

(assert (= b_and!38225 (and (=> t!35308 result!17627) b_and!38227)))

(declare-fun m!1038955 () Bool)

(assert (=> bm!47443 m!1038955))

(declare-fun m!1038957 () Bool)

(assert (=> b!1124712 m!1038957))

(declare-fun m!1038959 () Bool)

(assert (=> b!1124713 m!1038959))

(declare-fun m!1038961 () Bool)

(assert (=> b!1124713 m!1038961))

(declare-fun m!1038963 () Bool)

(assert (=> b!1124713 m!1038963))

(declare-fun m!1038965 () Bool)

(assert (=> b!1124713 m!1038965))

(declare-fun m!1038967 () Bool)

(assert (=> start!98020 m!1038967))

(declare-fun m!1038969 () Bool)

(assert (=> start!98020 m!1038969))

(declare-fun m!1038971 () Bool)

(assert (=> bm!47442 m!1038971))

(declare-fun m!1038973 () Bool)

(assert (=> b!1124700 m!1038973))

(declare-fun m!1038975 () Bool)

(assert (=> b!1124700 m!1038975))

(declare-fun m!1038977 () Bool)

(assert (=> b!1124708 m!1038977))

(assert (=> b!1124708 m!1038971))

(declare-fun m!1038979 () Bool)

(assert (=> b!1124711 m!1038979))

(declare-fun m!1038981 () Bool)

(assert (=> b!1124704 m!1038981))

(declare-fun m!1038983 () Bool)

(assert (=> b!1124699 m!1038983))

(declare-fun m!1038985 () Bool)

(assert (=> b!1124699 m!1038985))

(declare-fun m!1038987 () Bool)

(assert (=> mapNonEmpty!44194 m!1038987))

(declare-fun m!1038989 () Bool)

(assert (=> b!1124715 m!1038989))

(declare-fun m!1038991 () Bool)

(assert (=> b!1124716 m!1038991))

(declare-fun m!1038993 () Bool)

(assert (=> b!1124703 m!1038993))

(declare-fun m!1038995 () Bool)

(assert (=> b!1124703 m!1038995))

(declare-fun m!1038997 () Bool)

(assert (=> b!1124706 m!1038997))

(declare-fun m!1038999 () Bool)

(assert (=> b!1124707 m!1038999))

(assert (=> b!1124707 m!1038999))

(declare-fun m!1039001 () Bool)

(assert (=> b!1124707 m!1039001))

(declare-fun m!1039003 () Bool)

(assert (=> b!1124707 m!1039003))

(declare-fun m!1039005 () Bool)

(assert (=> b!1124709 m!1039005))

(check-sat b_and!38227 (not b!1124715) (not b_next!23721) (not b!1124708) (not b_lambda!18691) (not b!1124700) (not mapNonEmpty!44194) (not b!1124699) (not start!98020) (not b!1124712) (not b!1124703) (not b!1124713) (not b!1124711) (not bm!47443) (not b!1124716) (not b!1124709) (not b!1124707) (not bm!47442) tp_is_empty!28251 (not b!1124704))
(check-sat b_and!38227 (not b_next!23721))
