; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101324 () Bool)

(assert start!101324)

(declare-fun b_free!26227 () Bool)

(declare-fun b_next!26227 () Bool)

(assert (=> start!101324 (= b_free!26227 (not b_next!26227))))

(declare-fun tp!91706 () Bool)

(declare-fun b_and!43571 () Bool)

(assert (=> start!101324 (= tp!91706 b_and!43571)))

(declare-fun b!1217416 () Bool)

(declare-fun e!691156 () Bool)

(declare-fun e!691155 () Bool)

(assert (=> b!1217416 (= e!691156 e!691155)))

(declare-fun res!808498 () Bool)

(assert (=> b!1217416 (=> res!808498 e!691155)))

(declare-datatypes ((array!78554 0))(
  ( (array!78555 (arr!37911 (Array (_ BitVec 32) (_ BitVec 64))) (size!38449 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78554)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1217416 (= res!808498 (not (= (select (arr!37911 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((V!46369 0))(
  ( (V!46370 (val!15522 Int)) )
))
(declare-datatypes ((tuple2!20048 0))(
  ( (tuple2!20049 (_1!10035 (_ BitVec 64)) (_2!10035 V!46369)) )
))
(declare-datatypes ((List!26827 0))(
  ( (Nil!26824) (Cons!26823 (h!28032 tuple2!20048) (t!40025 List!26827)) )
))
(declare-datatypes ((ListLongMap!18017 0))(
  ( (ListLongMap!18018 (toList!9024 List!26827)) )
))
(declare-fun lt!553218 () ListLongMap!18017)

(declare-fun lt!553217 () V!46369)

(declare-datatypes ((ValueCell!14756 0))(
  ( (ValueCellFull!14756 (v!18175 V!46369)) (EmptyCell!14756) )
))
(declare-datatypes ((array!78556 0))(
  ( (array!78557 (arr!37912 (Array (_ BitVec 32) ValueCell!14756)) (size!38450 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78556)

(declare-fun lt!553226 () ListLongMap!18017)

(declare-fun +!4094 (ListLongMap!18017 tuple2!20048) ListLongMap!18017)

(declare-fun get!19331 (ValueCell!14756 V!46369) V!46369)

(assert (=> b!1217416 (= lt!553218 (+!4094 lt!553226 (tuple2!20049 (select (arr!37911 _keys!1208) from!1455) (get!19331 (select (arr!37912 _values!996) from!1455) lt!553217))))))

(declare-fun b!1217417 () Bool)

(declare-fun res!808500 () Bool)

(declare-fun e!691161 () Bool)

(assert (=> b!1217417 (=> (not res!808500) (not e!691161))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1217417 (= res!808500 (= (select (arr!37911 _keys!1208) i!673) k0!934))))

(declare-fun b!1217418 () Bool)

(declare-fun e!691158 () Bool)

(declare-fun tp_is_empty!30931 () Bool)

(assert (=> b!1217418 (= e!691158 tp_is_empty!30931)))

(declare-fun b!1217419 () Bool)

(declare-fun e!691162 () Bool)

(declare-fun e!691163 () Bool)

(assert (=> b!1217419 (= e!691162 (not e!691163))))

(declare-fun res!808488 () Bool)

(assert (=> b!1217419 (=> res!808488 e!691163)))

(assert (=> b!1217419 (= res!808488 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217419 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40219 0))(
  ( (Unit!40220) )
))
(declare-fun lt!553219 () Unit!40219)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78554 (_ BitVec 64) (_ BitVec 32)) Unit!40219)

(assert (=> b!1217419 (= lt!553219 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217421 () Bool)

(assert (=> b!1217421 (= e!691155 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217422 () Bool)

(declare-fun e!691154 () Bool)

(assert (=> b!1217422 (= e!691163 e!691154)))

(declare-fun res!808487 () Bool)

(assert (=> b!1217422 (=> res!808487 e!691154)))

(assert (=> b!1217422 (= res!808487 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46369)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!553220 () array!78554)

(declare-fun minValue!944 () V!46369)

(declare-fun lt!553223 () array!78556)

(declare-fun getCurrentListMapNoExtraKeys!5463 (array!78554 array!78556 (_ BitVec 32) (_ BitVec 32) V!46369 V!46369 (_ BitVec 32) Int) ListLongMap!18017)

(assert (=> b!1217422 (= lt!553218 (getCurrentListMapNoExtraKeys!5463 lt!553220 lt!553223 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1217422 (= lt!553223 (array!78557 (store (arr!37912 _values!996) i!673 (ValueCellFull!14756 lt!553217)) (size!38450 _values!996)))))

(declare-fun dynLambda!3314 (Int (_ BitVec 64)) V!46369)

(assert (=> b!1217422 (= lt!553217 (dynLambda!3314 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553222 () ListLongMap!18017)

(assert (=> b!1217422 (= lt!553222 (getCurrentListMapNoExtraKeys!5463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217423 () Bool)

(declare-fun res!808496 () Bool)

(assert (=> b!1217423 (=> (not res!808496) (not e!691161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78554 (_ BitVec 32)) Bool)

(assert (=> b!1217423 (= res!808496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!48274 () Bool)

(declare-fun mapRes!48274 () Bool)

(assert (=> mapIsEmpty!48274 mapRes!48274))

(declare-fun b!1217424 () Bool)

(declare-fun res!808495 () Bool)

(assert (=> b!1217424 (=> (not res!808495) (not e!691161))))

(declare-datatypes ((List!26828 0))(
  ( (Nil!26825) (Cons!26824 (h!28033 (_ BitVec 64)) (t!40026 List!26828)) )
))
(declare-fun arrayNoDuplicates!0 (array!78554 (_ BitVec 32) List!26828) Bool)

(assert (=> b!1217424 (= res!808495 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26825))))

(declare-fun b!1217425 () Bool)

(declare-fun res!808499 () Bool)

(assert (=> b!1217425 (=> (not res!808499) (not e!691161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217425 (= res!808499 (validKeyInArray!0 k0!934))))

(declare-fun b!1217426 () Bool)

(declare-fun e!691157 () Bool)

(assert (=> b!1217426 (= e!691157 tp_is_empty!30931)))

(declare-fun b!1217420 () Bool)

(declare-fun res!808490 () Bool)

(assert (=> b!1217420 (=> (not res!808490) (not e!691162))))

(assert (=> b!1217420 (= res!808490 (arrayNoDuplicates!0 lt!553220 #b00000000000000000000000000000000 Nil!26825))))

(declare-fun res!808492 () Bool)

(assert (=> start!101324 (=> (not res!808492) (not e!691161))))

(assert (=> start!101324 (= res!808492 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38449 _keys!1208))))))

(assert (=> start!101324 e!691161))

(assert (=> start!101324 tp_is_empty!30931))

(declare-fun array_inv!28978 (array!78554) Bool)

(assert (=> start!101324 (array_inv!28978 _keys!1208)))

(assert (=> start!101324 true))

(assert (=> start!101324 tp!91706))

(declare-fun e!691159 () Bool)

(declare-fun array_inv!28979 (array!78556) Bool)

(assert (=> start!101324 (and (array_inv!28979 _values!996) e!691159)))

(declare-fun b!1217427 () Bool)

(declare-fun res!808494 () Bool)

(assert (=> b!1217427 (=> (not res!808494) (not e!691161))))

(assert (=> b!1217427 (= res!808494 (and (= (size!38450 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38449 _keys!1208) (size!38450 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217428 () Bool)

(assert (=> b!1217428 (= e!691161 e!691162)))

(declare-fun res!808491 () Bool)

(assert (=> b!1217428 (=> (not res!808491) (not e!691162))))

(assert (=> b!1217428 (= res!808491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553220 mask!1564))))

(assert (=> b!1217428 (= lt!553220 (array!78555 (store (arr!37911 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38449 _keys!1208)))))

(declare-fun b!1217429 () Bool)

(declare-fun res!808489 () Bool)

(assert (=> b!1217429 (=> (not res!808489) (not e!691161))))

(assert (=> b!1217429 (= res!808489 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38449 _keys!1208))))))

(declare-fun mapNonEmpty!48274 () Bool)

(declare-fun tp!91705 () Bool)

(assert (=> mapNonEmpty!48274 (= mapRes!48274 (and tp!91705 e!691158))))

(declare-fun mapRest!48274 () (Array (_ BitVec 32) ValueCell!14756))

(declare-fun mapKey!48274 () (_ BitVec 32))

(declare-fun mapValue!48274 () ValueCell!14756)

(assert (=> mapNonEmpty!48274 (= (arr!37912 _values!996) (store mapRest!48274 mapKey!48274 mapValue!48274))))

(declare-fun b!1217430 () Bool)

(declare-fun res!808497 () Bool)

(assert (=> b!1217430 (=> (not res!808497) (not e!691161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217430 (= res!808497 (validMask!0 mask!1564))))

(declare-fun b!1217431 () Bool)

(assert (=> b!1217431 (= e!691159 (and e!691157 mapRes!48274))))

(declare-fun condMapEmpty!48274 () Bool)

(declare-fun mapDefault!48274 () ValueCell!14756)

(assert (=> b!1217431 (= condMapEmpty!48274 (= (arr!37912 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14756)) mapDefault!48274)))))

(declare-fun b!1217432 () Bool)

(assert (=> b!1217432 (= e!691154 e!691156)))

(declare-fun res!808493 () Bool)

(assert (=> b!1217432 (=> res!808493 e!691156)))

(assert (=> b!1217432 (= res!808493 (not (validKeyInArray!0 (select (arr!37911 _keys!1208) from!1455))))))

(declare-fun lt!553225 () ListLongMap!18017)

(assert (=> b!1217432 (= lt!553225 lt!553226)))

(declare-fun lt!553221 () ListLongMap!18017)

(declare-fun -!1861 (ListLongMap!18017 (_ BitVec 64)) ListLongMap!18017)

(assert (=> b!1217432 (= lt!553226 (-!1861 lt!553221 k0!934))))

(assert (=> b!1217432 (= lt!553225 (getCurrentListMapNoExtraKeys!5463 lt!553220 lt!553223 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1217432 (= lt!553221 (getCurrentListMapNoExtraKeys!5463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!553224 () Unit!40219)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1096 (array!78554 array!78556 (_ BitVec 32) (_ BitVec 32) V!46369 V!46369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40219)

(assert (=> b!1217432 (= lt!553224 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1096 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!101324 res!808492) b!1217430))

(assert (= (and b!1217430 res!808497) b!1217427))

(assert (= (and b!1217427 res!808494) b!1217423))

(assert (= (and b!1217423 res!808496) b!1217424))

(assert (= (and b!1217424 res!808495) b!1217429))

(assert (= (and b!1217429 res!808489) b!1217425))

(assert (= (and b!1217425 res!808499) b!1217417))

(assert (= (and b!1217417 res!808500) b!1217428))

(assert (= (and b!1217428 res!808491) b!1217420))

(assert (= (and b!1217420 res!808490) b!1217419))

(assert (= (and b!1217419 (not res!808488)) b!1217422))

(assert (= (and b!1217422 (not res!808487)) b!1217432))

(assert (= (and b!1217432 (not res!808493)) b!1217416))

(assert (= (and b!1217416 (not res!808498)) b!1217421))

(assert (= (and b!1217431 condMapEmpty!48274) mapIsEmpty!48274))

(assert (= (and b!1217431 (not condMapEmpty!48274)) mapNonEmpty!48274))

(get-info :version)

(assert (= (and mapNonEmpty!48274 ((_ is ValueCellFull!14756) mapValue!48274)) b!1217418))

(assert (= (and b!1217431 ((_ is ValueCellFull!14756) mapDefault!48274)) b!1217426))

(assert (= start!101324 b!1217431))

(declare-fun b_lambda!21931 () Bool)

(assert (=> (not b_lambda!21931) (not b!1217422)))

(declare-fun t!40024 () Bool)

(declare-fun tb!11019 () Bool)

(assert (=> (and start!101324 (= defaultEntry!1004 defaultEntry!1004) t!40024) tb!11019))

(declare-fun result!22645 () Bool)

(assert (=> tb!11019 (= result!22645 tp_is_empty!30931)))

(assert (=> b!1217422 t!40024))

(declare-fun b_and!43573 () Bool)

(assert (= b_and!43571 (and (=> t!40024 result!22645) b_and!43573)))

(declare-fun m!1121695 () Bool)

(assert (=> b!1217430 m!1121695))

(declare-fun m!1121697 () Bool)

(assert (=> b!1217425 m!1121697))

(declare-fun m!1121699 () Bool)

(assert (=> b!1217421 m!1121699))

(declare-fun m!1121701 () Bool)

(assert (=> b!1217428 m!1121701))

(declare-fun m!1121703 () Bool)

(assert (=> b!1217428 m!1121703))

(declare-fun m!1121705 () Bool)

(assert (=> b!1217419 m!1121705))

(declare-fun m!1121707 () Bool)

(assert (=> b!1217419 m!1121707))

(declare-fun m!1121709 () Bool)

(assert (=> b!1217432 m!1121709))

(declare-fun m!1121711 () Bool)

(assert (=> b!1217432 m!1121711))

(declare-fun m!1121713 () Bool)

(assert (=> b!1217432 m!1121713))

(declare-fun m!1121715 () Bool)

(assert (=> b!1217432 m!1121715))

(declare-fun m!1121717 () Bool)

(assert (=> b!1217432 m!1121717))

(declare-fun m!1121719 () Bool)

(assert (=> b!1217432 m!1121719))

(assert (=> b!1217432 m!1121717))

(declare-fun m!1121721 () Bool)

(assert (=> b!1217423 m!1121721))

(declare-fun m!1121723 () Bool)

(assert (=> b!1217417 m!1121723))

(declare-fun m!1121725 () Bool)

(assert (=> mapNonEmpty!48274 m!1121725))

(declare-fun m!1121727 () Bool)

(assert (=> b!1217422 m!1121727))

(declare-fun m!1121729 () Bool)

(assert (=> b!1217422 m!1121729))

(declare-fun m!1121731 () Bool)

(assert (=> b!1217422 m!1121731))

(declare-fun m!1121733 () Bool)

(assert (=> b!1217422 m!1121733))

(declare-fun m!1121735 () Bool)

(assert (=> b!1217424 m!1121735))

(declare-fun m!1121737 () Bool)

(assert (=> b!1217420 m!1121737))

(assert (=> b!1217416 m!1121717))

(declare-fun m!1121739 () Bool)

(assert (=> b!1217416 m!1121739))

(assert (=> b!1217416 m!1121739))

(declare-fun m!1121741 () Bool)

(assert (=> b!1217416 m!1121741))

(declare-fun m!1121743 () Bool)

(assert (=> b!1217416 m!1121743))

(declare-fun m!1121745 () Bool)

(assert (=> start!101324 m!1121745))

(declare-fun m!1121747 () Bool)

(assert (=> start!101324 m!1121747))

(check-sat (not b!1217419) (not b!1217428) (not start!101324) (not b_lambda!21931) (not b!1217424) (not b!1217425) (not b!1217421) (not b!1217422) b_and!43573 tp_is_empty!30931 (not b!1217423) (not b!1217430) (not b!1217416) (not b!1217420) (not b_next!26227) (not b!1217432) (not mapNonEmpty!48274))
(check-sat b_and!43573 (not b_next!26227))
(get-model)

(declare-fun b_lambda!21937 () Bool)

(assert (= b_lambda!21931 (or (and start!101324 b_free!26227) b_lambda!21937)))

(check-sat (not b!1217419) (not b!1217428) (not start!101324) (not b!1217424) (not b!1217425) (not b!1217421) (not b_lambda!21937) (not b!1217422) b_and!43573 tp_is_empty!30931 (not b!1217423) (not b!1217430) (not b!1217416) (not b!1217420) (not b_next!26227) (not b!1217432) (not mapNonEmpty!48274))
(check-sat b_and!43573 (not b_next!26227))
(get-model)

(declare-fun d!133443 () Bool)

(assert (=> d!133443 (= (array_inv!28978 _keys!1208) (bvsge (size!38449 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101324 d!133443))

(declare-fun d!133445 () Bool)

(assert (=> d!133445 (= (array_inv!28979 _values!996) (bvsge (size!38450 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101324 d!133445))

(declare-fun d!133447 () Bool)

(declare-fun res!808589 () Bool)

(declare-fun e!691228 () Bool)

(assert (=> d!133447 (=> res!808589 e!691228)))

(assert (=> d!133447 (= res!808589 (= (select (arr!37911 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133447 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!691228)))

(declare-fun b!1217545 () Bool)

(declare-fun e!691229 () Bool)

(assert (=> b!1217545 (= e!691228 e!691229)))

(declare-fun res!808590 () Bool)

(assert (=> b!1217545 (=> (not res!808590) (not e!691229))))

(assert (=> b!1217545 (= res!808590 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38449 _keys!1208)))))

(declare-fun b!1217546 () Bool)

(assert (=> b!1217546 (= e!691229 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133447 (not res!808589)) b!1217545))

(assert (= (and b!1217545 res!808590) b!1217546))

(declare-fun m!1121857 () Bool)

(assert (=> d!133447 m!1121857))

(declare-fun m!1121859 () Bool)

(assert (=> b!1217546 m!1121859))

(assert (=> b!1217419 d!133447))

(declare-fun d!133449 () Bool)

(assert (=> d!133449 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553289 () Unit!40219)

(declare-fun choose!13 (array!78554 (_ BitVec 64) (_ BitVec 32)) Unit!40219)

(assert (=> d!133449 (= lt!553289 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133449 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133449 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!553289)))

(declare-fun bs!34285 () Bool)

(assert (= bs!34285 d!133449))

(assert (=> bs!34285 m!1121705))

(declare-fun m!1121861 () Bool)

(assert (=> bs!34285 m!1121861))

(assert (=> b!1217419 d!133449))

(declare-fun d!133451 () Bool)

(declare-fun res!808595 () Bool)

(declare-fun e!691236 () Bool)

(assert (=> d!133451 (=> res!808595 e!691236)))

(assert (=> d!133451 (= res!808595 (bvsge #b00000000000000000000000000000000 (size!38449 lt!553220)))))

(assert (=> d!133451 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553220 mask!1564) e!691236)))

(declare-fun b!1217555 () Bool)

(declare-fun e!691238 () Bool)

(declare-fun e!691237 () Bool)

(assert (=> b!1217555 (= e!691238 e!691237)))

(declare-fun lt!553298 () (_ BitVec 64))

(assert (=> b!1217555 (= lt!553298 (select (arr!37911 lt!553220) #b00000000000000000000000000000000))))

(declare-fun lt!553297 () Unit!40219)

(assert (=> b!1217555 (= lt!553297 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!553220 lt!553298 #b00000000000000000000000000000000))))

(assert (=> b!1217555 (arrayContainsKey!0 lt!553220 lt!553298 #b00000000000000000000000000000000)))

(declare-fun lt!553296 () Unit!40219)

(assert (=> b!1217555 (= lt!553296 lt!553297)))

(declare-fun res!808596 () Bool)

(declare-datatypes ((SeekEntryResult!9943 0))(
  ( (MissingZero!9943 (index!42143 (_ BitVec 32))) (Found!9943 (index!42144 (_ BitVec 32))) (Intermediate!9943 (undefined!10755 Bool) (index!42145 (_ BitVec 32)) (x!107268 (_ BitVec 32))) (Undefined!9943) (MissingVacant!9943 (index!42146 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78554 (_ BitVec 32)) SeekEntryResult!9943)

(assert (=> b!1217555 (= res!808596 (= (seekEntryOrOpen!0 (select (arr!37911 lt!553220) #b00000000000000000000000000000000) lt!553220 mask!1564) (Found!9943 #b00000000000000000000000000000000)))))

(assert (=> b!1217555 (=> (not res!808596) (not e!691237))))

(declare-fun b!1217556 () Bool)

(declare-fun call!60607 () Bool)

(assert (=> b!1217556 (= e!691238 call!60607)))

(declare-fun b!1217557 () Bool)

(assert (=> b!1217557 (= e!691237 call!60607)))

(declare-fun bm!60604 () Bool)

(assert (=> bm!60604 (= call!60607 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!553220 mask!1564))))

(declare-fun b!1217558 () Bool)

(assert (=> b!1217558 (= e!691236 e!691238)))

(declare-fun c!120068 () Bool)

(assert (=> b!1217558 (= c!120068 (validKeyInArray!0 (select (arr!37911 lt!553220) #b00000000000000000000000000000000)))))

(assert (= (and d!133451 (not res!808595)) b!1217558))

(assert (= (and b!1217558 c!120068) b!1217555))

(assert (= (and b!1217558 (not c!120068)) b!1217556))

(assert (= (and b!1217555 res!808596) b!1217557))

(assert (= (or b!1217557 b!1217556) bm!60604))

(declare-fun m!1121863 () Bool)

(assert (=> b!1217555 m!1121863))

(declare-fun m!1121865 () Bool)

(assert (=> b!1217555 m!1121865))

(declare-fun m!1121867 () Bool)

(assert (=> b!1217555 m!1121867))

(assert (=> b!1217555 m!1121863))

(declare-fun m!1121869 () Bool)

(assert (=> b!1217555 m!1121869))

(declare-fun m!1121871 () Bool)

(assert (=> bm!60604 m!1121871))

(assert (=> b!1217558 m!1121863))

(assert (=> b!1217558 m!1121863))

(declare-fun m!1121873 () Bool)

(assert (=> b!1217558 m!1121873))

(assert (=> b!1217428 d!133451))

(declare-fun b!1217583 () Bool)

(declare-fun e!691256 () ListLongMap!18017)

(declare-fun e!691255 () ListLongMap!18017)

(assert (=> b!1217583 (= e!691256 e!691255)))

(declare-fun c!120079 () Bool)

(assert (=> b!1217583 (= c!120079 (validKeyInArray!0 (select (arr!37911 lt!553220) from!1455)))))

(declare-fun b!1217584 () Bool)

(declare-fun e!691259 () Bool)

(declare-fun lt!553314 () ListLongMap!18017)

(declare-fun isEmpty!1000 (ListLongMap!18017) Bool)

(assert (=> b!1217584 (= e!691259 (isEmpty!1000 lt!553314))))

(declare-fun b!1217585 () Bool)

(declare-fun e!691254 () Bool)

(declare-fun e!691257 () Bool)

(assert (=> b!1217585 (= e!691254 e!691257)))

(assert (=> b!1217585 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38449 lt!553220)))))

(declare-fun res!808605 () Bool)

(declare-fun contains!6983 (ListLongMap!18017 (_ BitVec 64)) Bool)

(assert (=> b!1217585 (= res!808605 (contains!6983 lt!553314 (select (arr!37911 lt!553220) from!1455)))))

(assert (=> b!1217585 (=> (not res!808605) (not e!691257))))

(declare-fun b!1217586 () Bool)

(assert (=> b!1217586 (= e!691256 (ListLongMap!18018 Nil!26824))))

(declare-fun b!1217587 () Bool)

(declare-fun e!691253 () Bool)

(assert (=> b!1217587 (= e!691253 (validKeyInArray!0 (select (arr!37911 lt!553220) from!1455)))))

(assert (=> b!1217587 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1217588 () Bool)

(declare-fun call!60610 () ListLongMap!18017)

(assert (=> b!1217588 (= e!691255 call!60610)))

(declare-fun d!133453 () Bool)

(declare-fun e!691258 () Bool)

(assert (=> d!133453 e!691258))

(declare-fun res!808608 () Bool)

(assert (=> d!133453 (=> (not res!808608) (not e!691258))))

(assert (=> d!133453 (= res!808608 (not (contains!6983 lt!553314 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133453 (= lt!553314 e!691256)))

(declare-fun c!120078 () Bool)

(assert (=> d!133453 (= c!120078 (bvsge from!1455 (size!38449 lt!553220)))))

(assert (=> d!133453 (validMask!0 mask!1564)))

(assert (=> d!133453 (= (getCurrentListMapNoExtraKeys!5463 lt!553220 lt!553223 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!553314)))

(declare-fun bm!60607 () Bool)

(assert (=> bm!60607 (= call!60610 (getCurrentListMapNoExtraKeys!5463 lt!553220 lt!553223 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1217589 () Bool)

(declare-fun res!808607 () Bool)

(assert (=> b!1217589 (=> (not res!808607) (not e!691258))))

(assert (=> b!1217589 (= res!808607 (not (contains!6983 lt!553314 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1217590 () Bool)

(assert (=> b!1217590 (= e!691259 (= lt!553314 (getCurrentListMapNoExtraKeys!5463 lt!553220 lt!553223 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1217591 () Bool)

(assert (=> b!1217591 (= e!691254 e!691259)))

(declare-fun c!120080 () Bool)

(assert (=> b!1217591 (= c!120080 (bvslt from!1455 (size!38449 lt!553220)))))

(declare-fun b!1217592 () Bool)

(declare-fun lt!553315 () Unit!40219)

(declare-fun lt!553318 () Unit!40219)

(assert (=> b!1217592 (= lt!553315 lt!553318)))

(declare-fun lt!553319 () (_ BitVec 64))

(declare-fun lt!553316 () V!46369)

(declare-fun lt!553313 () (_ BitVec 64))

(declare-fun lt!553317 () ListLongMap!18017)

(assert (=> b!1217592 (not (contains!6983 (+!4094 lt!553317 (tuple2!20049 lt!553313 lt!553316)) lt!553319))))

(declare-fun addStillNotContains!300 (ListLongMap!18017 (_ BitVec 64) V!46369 (_ BitVec 64)) Unit!40219)

(assert (=> b!1217592 (= lt!553318 (addStillNotContains!300 lt!553317 lt!553313 lt!553316 lt!553319))))

(assert (=> b!1217592 (= lt!553319 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1217592 (= lt!553316 (get!19331 (select (arr!37912 lt!553223) from!1455) (dynLambda!3314 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1217592 (= lt!553313 (select (arr!37911 lt!553220) from!1455))))

(assert (=> b!1217592 (= lt!553317 call!60610)))

(assert (=> b!1217592 (= e!691255 (+!4094 call!60610 (tuple2!20049 (select (arr!37911 lt!553220) from!1455) (get!19331 (select (arr!37912 lt!553223) from!1455) (dynLambda!3314 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1217593 () Bool)

(assert (=> b!1217593 (= e!691258 e!691254)))

(declare-fun c!120077 () Bool)

(assert (=> b!1217593 (= c!120077 e!691253)))

(declare-fun res!808606 () Bool)

(assert (=> b!1217593 (=> (not res!808606) (not e!691253))))

(assert (=> b!1217593 (= res!808606 (bvslt from!1455 (size!38449 lt!553220)))))

(declare-fun b!1217594 () Bool)

(assert (=> b!1217594 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38449 lt!553220)))))

(assert (=> b!1217594 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38450 lt!553223)))))

(declare-fun apply!964 (ListLongMap!18017 (_ BitVec 64)) V!46369)

(assert (=> b!1217594 (= e!691257 (= (apply!964 lt!553314 (select (arr!37911 lt!553220) from!1455)) (get!19331 (select (arr!37912 lt!553223) from!1455) (dynLambda!3314 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133453 c!120078) b!1217586))

(assert (= (and d!133453 (not c!120078)) b!1217583))

(assert (= (and b!1217583 c!120079) b!1217592))

(assert (= (and b!1217583 (not c!120079)) b!1217588))

(assert (= (or b!1217592 b!1217588) bm!60607))

(assert (= (and d!133453 res!808608) b!1217589))

(assert (= (and b!1217589 res!808607) b!1217593))

(assert (= (and b!1217593 res!808606) b!1217587))

(assert (= (and b!1217593 c!120077) b!1217585))

(assert (= (and b!1217593 (not c!120077)) b!1217591))

(assert (= (and b!1217585 res!808605) b!1217594))

(assert (= (and b!1217591 c!120080) b!1217590))

(assert (= (and b!1217591 (not c!120080)) b!1217584))

(declare-fun b_lambda!21939 () Bool)

(assert (=> (not b_lambda!21939) (not b!1217592)))

(assert (=> b!1217592 t!40024))

(declare-fun b_and!43583 () Bool)

(assert (= b_and!43573 (and (=> t!40024 result!22645) b_and!43583)))

(declare-fun b_lambda!21941 () Bool)

(assert (=> (not b_lambda!21941) (not b!1217594)))

(assert (=> b!1217594 t!40024))

(declare-fun b_and!43585 () Bool)

(assert (= b_and!43583 (and (=> t!40024 result!22645) b_and!43585)))

(declare-fun m!1121875 () Bool)

(assert (=> b!1217590 m!1121875))

(declare-fun m!1121877 () Bool)

(assert (=> b!1217585 m!1121877))

(assert (=> b!1217585 m!1121877))

(declare-fun m!1121879 () Bool)

(assert (=> b!1217585 m!1121879))

(declare-fun m!1121881 () Bool)

(assert (=> d!133453 m!1121881))

(assert (=> d!133453 m!1121695))

(declare-fun m!1121883 () Bool)

(assert (=> b!1217584 m!1121883))

(assert (=> b!1217583 m!1121877))

(assert (=> b!1217583 m!1121877))

(declare-fun m!1121885 () Bool)

(assert (=> b!1217583 m!1121885))

(assert (=> bm!60607 m!1121875))

(assert (=> b!1217594 m!1121731))

(declare-fun m!1121887 () Bool)

(assert (=> b!1217594 m!1121887))

(assert (=> b!1217594 m!1121877))

(assert (=> b!1217594 m!1121877))

(declare-fun m!1121889 () Bool)

(assert (=> b!1217594 m!1121889))

(assert (=> b!1217594 m!1121887))

(assert (=> b!1217594 m!1121731))

(declare-fun m!1121891 () Bool)

(assert (=> b!1217594 m!1121891))

(assert (=> b!1217587 m!1121877))

(assert (=> b!1217587 m!1121877))

(assert (=> b!1217587 m!1121885))

(declare-fun m!1121893 () Bool)

(assert (=> b!1217592 m!1121893))

(assert (=> b!1217592 m!1121731))

(declare-fun m!1121895 () Bool)

(assert (=> b!1217592 m!1121895))

(assert (=> b!1217592 m!1121887))

(assert (=> b!1217592 m!1121877))

(assert (=> b!1217592 m!1121887))

(assert (=> b!1217592 m!1121731))

(assert (=> b!1217592 m!1121891))

(declare-fun m!1121897 () Bool)

(assert (=> b!1217592 m!1121897))

(assert (=> b!1217592 m!1121897))

(declare-fun m!1121899 () Bool)

(assert (=> b!1217592 m!1121899))

(declare-fun m!1121901 () Bool)

(assert (=> b!1217589 m!1121901))

(assert (=> b!1217422 d!133453))

(declare-fun b!1217595 () Bool)

(declare-fun e!691263 () ListLongMap!18017)

(declare-fun e!691262 () ListLongMap!18017)

(assert (=> b!1217595 (= e!691263 e!691262)))

(declare-fun c!120083 () Bool)

(assert (=> b!1217595 (= c!120083 (validKeyInArray!0 (select (arr!37911 _keys!1208) from!1455)))))

(declare-fun b!1217596 () Bool)

(declare-fun e!691266 () Bool)

(declare-fun lt!553321 () ListLongMap!18017)

(assert (=> b!1217596 (= e!691266 (isEmpty!1000 lt!553321))))

(declare-fun b!1217597 () Bool)

(declare-fun e!691261 () Bool)

(declare-fun e!691264 () Bool)

(assert (=> b!1217597 (= e!691261 e!691264)))

(assert (=> b!1217597 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38449 _keys!1208)))))

(declare-fun res!808609 () Bool)

(assert (=> b!1217597 (= res!808609 (contains!6983 lt!553321 (select (arr!37911 _keys!1208) from!1455)))))

(assert (=> b!1217597 (=> (not res!808609) (not e!691264))))

(declare-fun b!1217598 () Bool)

(assert (=> b!1217598 (= e!691263 (ListLongMap!18018 Nil!26824))))

(declare-fun b!1217599 () Bool)

(declare-fun e!691260 () Bool)

(assert (=> b!1217599 (= e!691260 (validKeyInArray!0 (select (arr!37911 _keys!1208) from!1455)))))

(assert (=> b!1217599 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1217600 () Bool)

(declare-fun call!60611 () ListLongMap!18017)

(assert (=> b!1217600 (= e!691262 call!60611)))

(declare-fun d!133455 () Bool)

(declare-fun e!691265 () Bool)

(assert (=> d!133455 e!691265))

(declare-fun res!808612 () Bool)

(assert (=> d!133455 (=> (not res!808612) (not e!691265))))

(assert (=> d!133455 (= res!808612 (not (contains!6983 lt!553321 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133455 (= lt!553321 e!691263)))

(declare-fun c!120082 () Bool)

(assert (=> d!133455 (= c!120082 (bvsge from!1455 (size!38449 _keys!1208)))))

(assert (=> d!133455 (validMask!0 mask!1564)))

(assert (=> d!133455 (= (getCurrentListMapNoExtraKeys!5463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!553321)))

(declare-fun bm!60608 () Bool)

(assert (=> bm!60608 (= call!60611 (getCurrentListMapNoExtraKeys!5463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1217601 () Bool)

(declare-fun res!808611 () Bool)

(assert (=> b!1217601 (=> (not res!808611) (not e!691265))))

(assert (=> b!1217601 (= res!808611 (not (contains!6983 lt!553321 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1217602 () Bool)

(assert (=> b!1217602 (= e!691266 (= lt!553321 (getCurrentListMapNoExtraKeys!5463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1217603 () Bool)

(assert (=> b!1217603 (= e!691261 e!691266)))

(declare-fun c!120084 () Bool)

(assert (=> b!1217603 (= c!120084 (bvslt from!1455 (size!38449 _keys!1208)))))

(declare-fun b!1217604 () Bool)

(declare-fun lt!553322 () Unit!40219)

(declare-fun lt!553325 () Unit!40219)

(assert (=> b!1217604 (= lt!553322 lt!553325)))

(declare-fun lt!553326 () (_ BitVec 64))

(declare-fun lt!553320 () (_ BitVec 64))

(declare-fun lt!553323 () V!46369)

(declare-fun lt!553324 () ListLongMap!18017)

(assert (=> b!1217604 (not (contains!6983 (+!4094 lt!553324 (tuple2!20049 lt!553320 lt!553323)) lt!553326))))

(assert (=> b!1217604 (= lt!553325 (addStillNotContains!300 lt!553324 lt!553320 lt!553323 lt!553326))))

(assert (=> b!1217604 (= lt!553326 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1217604 (= lt!553323 (get!19331 (select (arr!37912 _values!996) from!1455) (dynLambda!3314 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1217604 (= lt!553320 (select (arr!37911 _keys!1208) from!1455))))

(assert (=> b!1217604 (= lt!553324 call!60611)))

(assert (=> b!1217604 (= e!691262 (+!4094 call!60611 (tuple2!20049 (select (arr!37911 _keys!1208) from!1455) (get!19331 (select (arr!37912 _values!996) from!1455) (dynLambda!3314 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1217605 () Bool)

(assert (=> b!1217605 (= e!691265 e!691261)))

(declare-fun c!120081 () Bool)

(assert (=> b!1217605 (= c!120081 e!691260)))

(declare-fun res!808610 () Bool)

(assert (=> b!1217605 (=> (not res!808610) (not e!691260))))

(assert (=> b!1217605 (= res!808610 (bvslt from!1455 (size!38449 _keys!1208)))))

(declare-fun b!1217606 () Bool)

(assert (=> b!1217606 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38449 _keys!1208)))))

(assert (=> b!1217606 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38450 _values!996)))))

(assert (=> b!1217606 (= e!691264 (= (apply!964 lt!553321 (select (arr!37911 _keys!1208) from!1455)) (get!19331 (select (arr!37912 _values!996) from!1455) (dynLambda!3314 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133455 c!120082) b!1217598))

(assert (= (and d!133455 (not c!120082)) b!1217595))

(assert (= (and b!1217595 c!120083) b!1217604))

(assert (= (and b!1217595 (not c!120083)) b!1217600))

(assert (= (or b!1217604 b!1217600) bm!60608))

(assert (= (and d!133455 res!808612) b!1217601))

(assert (= (and b!1217601 res!808611) b!1217605))

(assert (= (and b!1217605 res!808610) b!1217599))

(assert (= (and b!1217605 c!120081) b!1217597))

(assert (= (and b!1217605 (not c!120081)) b!1217603))

(assert (= (and b!1217597 res!808609) b!1217606))

(assert (= (and b!1217603 c!120084) b!1217602))

(assert (= (and b!1217603 (not c!120084)) b!1217596))

(declare-fun b_lambda!21943 () Bool)

(assert (=> (not b_lambda!21943) (not b!1217604)))

(assert (=> b!1217604 t!40024))

(declare-fun b_and!43587 () Bool)

(assert (= b_and!43585 (and (=> t!40024 result!22645) b_and!43587)))

(declare-fun b_lambda!21945 () Bool)

(assert (=> (not b_lambda!21945) (not b!1217606)))

(assert (=> b!1217606 t!40024))

(declare-fun b_and!43589 () Bool)

(assert (= b_and!43587 (and (=> t!40024 result!22645) b_and!43589)))

(declare-fun m!1121903 () Bool)

(assert (=> b!1217602 m!1121903))

(assert (=> b!1217597 m!1121717))

(assert (=> b!1217597 m!1121717))

(declare-fun m!1121905 () Bool)

(assert (=> b!1217597 m!1121905))

(declare-fun m!1121907 () Bool)

(assert (=> d!133455 m!1121907))

(assert (=> d!133455 m!1121695))

(declare-fun m!1121909 () Bool)

(assert (=> b!1217596 m!1121909))

(assert (=> b!1217595 m!1121717))

(assert (=> b!1217595 m!1121717))

(assert (=> b!1217595 m!1121719))

(assert (=> bm!60608 m!1121903))

(assert (=> b!1217606 m!1121731))

(assert (=> b!1217606 m!1121739))

(assert (=> b!1217606 m!1121717))

(assert (=> b!1217606 m!1121717))

(declare-fun m!1121911 () Bool)

(assert (=> b!1217606 m!1121911))

(assert (=> b!1217606 m!1121739))

(assert (=> b!1217606 m!1121731))

(declare-fun m!1121913 () Bool)

(assert (=> b!1217606 m!1121913))

(assert (=> b!1217599 m!1121717))

(assert (=> b!1217599 m!1121717))

(assert (=> b!1217599 m!1121719))

(declare-fun m!1121915 () Bool)

(assert (=> b!1217604 m!1121915))

(assert (=> b!1217604 m!1121731))

(declare-fun m!1121917 () Bool)

(assert (=> b!1217604 m!1121917))

(assert (=> b!1217604 m!1121739))

(assert (=> b!1217604 m!1121717))

(assert (=> b!1217604 m!1121739))

(assert (=> b!1217604 m!1121731))

(assert (=> b!1217604 m!1121913))

(declare-fun m!1121919 () Bool)

(assert (=> b!1217604 m!1121919))

(assert (=> b!1217604 m!1121919))

(declare-fun m!1121921 () Bool)

(assert (=> b!1217604 m!1121921))

(declare-fun m!1121923 () Bool)

(assert (=> b!1217601 m!1121923))

(assert (=> b!1217422 d!133455))

(declare-fun d!133457 () Bool)

(assert (=> d!133457 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1217430 d!133457))

(declare-fun d!133459 () Bool)

(declare-fun res!808613 () Bool)

(declare-fun e!691267 () Bool)

(assert (=> d!133459 (=> res!808613 e!691267)))

(assert (=> d!133459 (= res!808613 (= (select (arr!37911 _keys!1208) i!673) k0!934))))

(assert (=> d!133459 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!691267)))

(declare-fun b!1217607 () Bool)

(declare-fun e!691268 () Bool)

(assert (=> b!1217607 (= e!691267 e!691268)))

(declare-fun res!808614 () Bool)

(assert (=> b!1217607 (=> (not res!808614) (not e!691268))))

(assert (=> b!1217607 (= res!808614 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38449 _keys!1208)))))

(declare-fun b!1217608 () Bool)

(assert (=> b!1217608 (= e!691268 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!133459 (not res!808613)) b!1217607))

(assert (= (and b!1217607 res!808614) b!1217608))

(assert (=> d!133459 m!1121723))

(declare-fun m!1121925 () Bool)

(assert (=> b!1217608 m!1121925))

(assert (=> b!1217421 d!133459))

(declare-fun b!1217619 () Bool)

(declare-fun e!691279 () Bool)

(declare-fun call!60614 () Bool)

(assert (=> b!1217619 (= e!691279 call!60614)))

(declare-fun b!1217620 () Bool)

(declare-fun e!691280 () Bool)

(declare-fun e!691278 () Bool)

(assert (=> b!1217620 (= e!691280 e!691278)))

(declare-fun res!808622 () Bool)

(assert (=> b!1217620 (=> (not res!808622) (not e!691278))))

(declare-fun e!691277 () Bool)

(assert (=> b!1217620 (= res!808622 (not e!691277))))

(declare-fun res!808621 () Bool)

(assert (=> b!1217620 (=> (not res!808621) (not e!691277))))

(assert (=> b!1217620 (= res!808621 (validKeyInArray!0 (select (arr!37911 lt!553220) #b00000000000000000000000000000000)))))

(declare-fun d!133461 () Bool)

(declare-fun res!808623 () Bool)

(assert (=> d!133461 (=> res!808623 e!691280)))

(assert (=> d!133461 (= res!808623 (bvsge #b00000000000000000000000000000000 (size!38449 lt!553220)))))

(assert (=> d!133461 (= (arrayNoDuplicates!0 lt!553220 #b00000000000000000000000000000000 Nil!26825) e!691280)))

(declare-fun bm!60611 () Bool)

(declare-fun c!120087 () Bool)

(assert (=> bm!60611 (= call!60614 (arrayNoDuplicates!0 lt!553220 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120087 (Cons!26824 (select (arr!37911 lt!553220) #b00000000000000000000000000000000) Nil!26825) Nil!26825)))))

(declare-fun b!1217621 () Bool)

(assert (=> b!1217621 (= e!691279 call!60614)))

(declare-fun b!1217622 () Bool)

(declare-fun contains!6984 (List!26828 (_ BitVec 64)) Bool)

(assert (=> b!1217622 (= e!691277 (contains!6984 Nil!26825 (select (arr!37911 lt!553220) #b00000000000000000000000000000000)))))

(declare-fun b!1217623 () Bool)

(assert (=> b!1217623 (= e!691278 e!691279)))

(assert (=> b!1217623 (= c!120087 (validKeyInArray!0 (select (arr!37911 lt!553220) #b00000000000000000000000000000000)))))

(assert (= (and d!133461 (not res!808623)) b!1217620))

(assert (= (and b!1217620 res!808621) b!1217622))

(assert (= (and b!1217620 res!808622) b!1217623))

(assert (= (and b!1217623 c!120087) b!1217619))

(assert (= (and b!1217623 (not c!120087)) b!1217621))

(assert (= (or b!1217619 b!1217621) bm!60611))

(assert (=> b!1217620 m!1121863))

(assert (=> b!1217620 m!1121863))

(assert (=> b!1217620 m!1121873))

(assert (=> bm!60611 m!1121863))

(declare-fun m!1121927 () Bool)

(assert (=> bm!60611 m!1121927))

(assert (=> b!1217622 m!1121863))

(assert (=> b!1217622 m!1121863))

(declare-fun m!1121929 () Bool)

(assert (=> b!1217622 m!1121929))

(assert (=> b!1217623 m!1121863))

(assert (=> b!1217623 m!1121863))

(assert (=> b!1217623 m!1121873))

(assert (=> b!1217420 d!133461))

(declare-fun b!1217624 () Bool)

(declare-fun e!691283 () Bool)

(declare-fun call!60615 () Bool)

(assert (=> b!1217624 (= e!691283 call!60615)))

(declare-fun b!1217625 () Bool)

(declare-fun e!691284 () Bool)

(declare-fun e!691282 () Bool)

(assert (=> b!1217625 (= e!691284 e!691282)))

(declare-fun res!808625 () Bool)

(assert (=> b!1217625 (=> (not res!808625) (not e!691282))))

(declare-fun e!691281 () Bool)

(assert (=> b!1217625 (= res!808625 (not e!691281))))

(declare-fun res!808624 () Bool)

(assert (=> b!1217625 (=> (not res!808624) (not e!691281))))

(assert (=> b!1217625 (= res!808624 (validKeyInArray!0 (select (arr!37911 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133463 () Bool)

(declare-fun res!808626 () Bool)

(assert (=> d!133463 (=> res!808626 e!691284)))

(assert (=> d!133463 (= res!808626 (bvsge #b00000000000000000000000000000000 (size!38449 _keys!1208)))))

(assert (=> d!133463 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26825) e!691284)))

(declare-fun bm!60612 () Bool)

(declare-fun c!120088 () Bool)

(assert (=> bm!60612 (= call!60615 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120088 (Cons!26824 (select (arr!37911 _keys!1208) #b00000000000000000000000000000000) Nil!26825) Nil!26825)))))

(declare-fun b!1217626 () Bool)

(assert (=> b!1217626 (= e!691283 call!60615)))

(declare-fun b!1217627 () Bool)

(assert (=> b!1217627 (= e!691281 (contains!6984 Nil!26825 (select (arr!37911 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1217628 () Bool)

(assert (=> b!1217628 (= e!691282 e!691283)))

(assert (=> b!1217628 (= c!120088 (validKeyInArray!0 (select (arr!37911 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133463 (not res!808626)) b!1217625))

(assert (= (and b!1217625 res!808624) b!1217627))

(assert (= (and b!1217625 res!808625) b!1217628))

(assert (= (and b!1217628 c!120088) b!1217624))

(assert (= (and b!1217628 (not c!120088)) b!1217626))

(assert (= (or b!1217624 b!1217626) bm!60612))

(assert (=> b!1217625 m!1121857))

(assert (=> b!1217625 m!1121857))

(declare-fun m!1121931 () Bool)

(assert (=> b!1217625 m!1121931))

(assert (=> bm!60612 m!1121857))

(declare-fun m!1121933 () Bool)

(assert (=> bm!60612 m!1121933))

(assert (=> b!1217627 m!1121857))

(assert (=> b!1217627 m!1121857))

(declare-fun m!1121935 () Bool)

(assert (=> b!1217627 m!1121935))

(assert (=> b!1217628 m!1121857))

(assert (=> b!1217628 m!1121857))

(assert (=> b!1217628 m!1121931))

(assert (=> b!1217424 d!133463))

(declare-fun b!1217629 () Bool)

(declare-fun e!691288 () ListLongMap!18017)

(declare-fun e!691287 () ListLongMap!18017)

(assert (=> b!1217629 (= e!691288 e!691287)))

(declare-fun c!120091 () Bool)

(assert (=> b!1217629 (= c!120091 (validKeyInArray!0 (select (arr!37911 lt!553220) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1217630 () Bool)

(declare-fun e!691291 () Bool)

(declare-fun lt!553328 () ListLongMap!18017)

(assert (=> b!1217630 (= e!691291 (isEmpty!1000 lt!553328))))

(declare-fun b!1217631 () Bool)

(declare-fun e!691286 () Bool)

(declare-fun e!691289 () Bool)

(assert (=> b!1217631 (= e!691286 e!691289)))

(assert (=> b!1217631 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38449 lt!553220)))))

(declare-fun res!808627 () Bool)

(assert (=> b!1217631 (= res!808627 (contains!6983 lt!553328 (select (arr!37911 lt!553220) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1217631 (=> (not res!808627) (not e!691289))))

(declare-fun b!1217632 () Bool)

(assert (=> b!1217632 (= e!691288 (ListLongMap!18018 Nil!26824))))

(declare-fun b!1217633 () Bool)

(declare-fun e!691285 () Bool)

(assert (=> b!1217633 (= e!691285 (validKeyInArray!0 (select (arr!37911 lt!553220) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1217633 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1217634 () Bool)

(declare-fun call!60616 () ListLongMap!18017)

(assert (=> b!1217634 (= e!691287 call!60616)))

(declare-fun d!133465 () Bool)

(declare-fun e!691290 () Bool)

(assert (=> d!133465 e!691290))

(declare-fun res!808630 () Bool)

(assert (=> d!133465 (=> (not res!808630) (not e!691290))))

(assert (=> d!133465 (= res!808630 (not (contains!6983 lt!553328 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133465 (= lt!553328 e!691288)))

(declare-fun c!120090 () Bool)

(assert (=> d!133465 (= c!120090 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38449 lt!553220)))))

(assert (=> d!133465 (validMask!0 mask!1564)))

(assert (=> d!133465 (= (getCurrentListMapNoExtraKeys!5463 lt!553220 lt!553223 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553328)))

(declare-fun bm!60613 () Bool)

(assert (=> bm!60613 (= call!60616 (getCurrentListMapNoExtraKeys!5463 lt!553220 lt!553223 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1217635 () Bool)

(declare-fun res!808629 () Bool)

(assert (=> b!1217635 (=> (not res!808629) (not e!691290))))

(assert (=> b!1217635 (= res!808629 (not (contains!6983 lt!553328 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1217636 () Bool)

(assert (=> b!1217636 (= e!691291 (= lt!553328 (getCurrentListMapNoExtraKeys!5463 lt!553220 lt!553223 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1217637 () Bool)

(assert (=> b!1217637 (= e!691286 e!691291)))

(declare-fun c!120092 () Bool)

(assert (=> b!1217637 (= c!120092 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38449 lt!553220)))))

(declare-fun b!1217638 () Bool)

(declare-fun lt!553329 () Unit!40219)

(declare-fun lt!553332 () Unit!40219)

(assert (=> b!1217638 (= lt!553329 lt!553332)))

(declare-fun lt!553327 () (_ BitVec 64))

(declare-fun lt!553333 () (_ BitVec 64))

(declare-fun lt!553330 () V!46369)

(declare-fun lt!553331 () ListLongMap!18017)

(assert (=> b!1217638 (not (contains!6983 (+!4094 lt!553331 (tuple2!20049 lt!553327 lt!553330)) lt!553333))))

(assert (=> b!1217638 (= lt!553332 (addStillNotContains!300 lt!553331 lt!553327 lt!553330 lt!553333))))

(assert (=> b!1217638 (= lt!553333 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1217638 (= lt!553330 (get!19331 (select (arr!37912 lt!553223) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3314 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1217638 (= lt!553327 (select (arr!37911 lt!553220) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1217638 (= lt!553331 call!60616)))

(assert (=> b!1217638 (= e!691287 (+!4094 call!60616 (tuple2!20049 (select (arr!37911 lt!553220) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19331 (select (arr!37912 lt!553223) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3314 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1217639 () Bool)

(assert (=> b!1217639 (= e!691290 e!691286)))

(declare-fun c!120089 () Bool)

(assert (=> b!1217639 (= c!120089 e!691285)))

(declare-fun res!808628 () Bool)

(assert (=> b!1217639 (=> (not res!808628) (not e!691285))))

(assert (=> b!1217639 (= res!808628 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38449 lt!553220)))))

(declare-fun b!1217640 () Bool)

(assert (=> b!1217640 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38449 lt!553220)))))

(assert (=> b!1217640 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38450 lt!553223)))))

(assert (=> b!1217640 (= e!691289 (= (apply!964 lt!553328 (select (arr!37911 lt!553220) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19331 (select (arr!37912 lt!553223) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3314 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133465 c!120090) b!1217632))

(assert (= (and d!133465 (not c!120090)) b!1217629))

(assert (= (and b!1217629 c!120091) b!1217638))

(assert (= (and b!1217629 (not c!120091)) b!1217634))

(assert (= (or b!1217638 b!1217634) bm!60613))

(assert (= (and d!133465 res!808630) b!1217635))

(assert (= (and b!1217635 res!808629) b!1217639))

(assert (= (and b!1217639 res!808628) b!1217633))

(assert (= (and b!1217639 c!120089) b!1217631))

(assert (= (and b!1217639 (not c!120089)) b!1217637))

(assert (= (and b!1217631 res!808627) b!1217640))

(assert (= (and b!1217637 c!120092) b!1217636))

(assert (= (and b!1217637 (not c!120092)) b!1217630))

(declare-fun b_lambda!21947 () Bool)

(assert (=> (not b_lambda!21947) (not b!1217638)))

(assert (=> b!1217638 t!40024))

(declare-fun b_and!43591 () Bool)

(assert (= b_and!43589 (and (=> t!40024 result!22645) b_and!43591)))

(declare-fun b_lambda!21949 () Bool)

(assert (=> (not b_lambda!21949) (not b!1217640)))

(assert (=> b!1217640 t!40024))

(declare-fun b_and!43593 () Bool)

(assert (= b_and!43591 (and (=> t!40024 result!22645) b_and!43593)))

(declare-fun m!1121937 () Bool)

(assert (=> b!1217636 m!1121937))

(declare-fun m!1121939 () Bool)

(assert (=> b!1217631 m!1121939))

(assert (=> b!1217631 m!1121939))

(declare-fun m!1121941 () Bool)

(assert (=> b!1217631 m!1121941))

(declare-fun m!1121943 () Bool)

(assert (=> d!133465 m!1121943))

(assert (=> d!133465 m!1121695))

(declare-fun m!1121945 () Bool)

(assert (=> b!1217630 m!1121945))

(assert (=> b!1217629 m!1121939))

(assert (=> b!1217629 m!1121939))

(declare-fun m!1121947 () Bool)

(assert (=> b!1217629 m!1121947))

(assert (=> bm!60613 m!1121937))

(assert (=> b!1217640 m!1121731))

(declare-fun m!1121949 () Bool)

(assert (=> b!1217640 m!1121949))

(assert (=> b!1217640 m!1121939))

(assert (=> b!1217640 m!1121939))

(declare-fun m!1121951 () Bool)

(assert (=> b!1217640 m!1121951))

(assert (=> b!1217640 m!1121949))

(assert (=> b!1217640 m!1121731))

(declare-fun m!1121953 () Bool)

(assert (=> b!1217640 m!1121953))

(assert (=> b!1217633 m!1121939))

(assert (=> b!1217633 m!1121939))

(assert (=> b!1217633 m!1121947))

(declare-fun m!1121955 () Bool)

(assert (=> b!1217638 m!1121955))

(assert (=> b!1217638 m!1121731))

(declare-fun m!1121957 () Bool)

(assert (=> b!1217638 m!1121957))

(assert (=> b!1217638 m!1121949))

(assert (=> b!1217638 m!1121939))

(assert (=> b!1217638 m!1121949))

(assert (=> b!1217638 m!1121731))

(assert (=> b!1217638 m!1121953))

(declare-fun m!1121959 () Bool)

(assert (=> b!1217638 m!1121959))

(assert (=> b!1217638 m!1121959))

(declare-fun m!1121961 () Bool)

(assert (=> b!1217638 m!1121961))

(declare-fun m!1121963 () Bool)

(assert (=> b!1217635 m!1121963))

(assert (=> b!1217432 d!133465))

(declare-fun d!133467 () Bool)

(assert (=> d!133467 (= (validKeyInArray!0 (select (arr!37911 _keys!1208) from!1455)) (and (not (= (select (arr!37911 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37911 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1217432 d!133467))

(declare-fun call!60622 () ListLongMap!18017)

(declare-fun bm!60618 () Bool)

(assert (=> bm!60618 (= call!60622 (getCurrentListMapNoExtraKeys!5463 (array!78555 (store (arr!37911 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38449 _keys!1208)) (array!78557 (store (arr!37912 _values!996) i!673 (ValueCellFull!14756 (dynLambda!3314 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38450 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!133469 () Bool)

(declare-fun e!691297 () Bool)

(assert (=> d!133469 e!691297))

(declare-fun res!808633 () Bool)

(assert (=> d!133469 (=> (not res!808633) (not e!691297))))

(assert (=> d!133469 (= res!808633 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38449 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38449 _keys!1208))))))))

(declare-fun lt!553336 () Unit!40219)

(declare-fun choose!1830 (array!78554 array!78556 (_ BitVec 32) (_ BitVec 32) V!46369 V!46369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40219)

(assert (=> d!133469 (= lt!553336 (choose!1830 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133469 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38449 _keys!1208)))))

(assert (=> d!133469 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1096 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553336)))

(declare-fun b!1217647 () Bool)

(declare-fun e!691296 () Bool)

(declare-fun call!60621 () ListLongMap!18017)

(assert (=> b!1217647 (= e!691296 (= call!60622 (-!1861 call!60621 k0!934)))))

(assert (=> b!1217647 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38450 _values!996)))))

(declare-fun b!1217648 () Bool)

(assert (=> b!1217648 (= e!691296 (= call!60622 call!60621))))

(assert (=> b!1217648 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38450 _values!996)))))

(declare-fun bm!60619 () Bool)

(assert (=> bm!60619 (= call!60621 (getCurrentListMapNoExtraKeys!5463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217649 () Bool)

(assert (=> b!1217649 (= e!691297 e!691296)))

(declare-fun c!120095 () Bool)

(assert (=> b!1217649 (= c!120095 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (= (and d!133469 res!808633) b!1217649))

(assert (= (and b!1217649 c!120095) b!1217647))

(assert (= (and b!1217649 (not c!120095)) b!1217648))

(assert (= (or b!1217647 b!1217648) bm!60619))

(assert (= (or b!1217647 b!1217648) bm!60618))

(declare-fun b_lambda!21951 () Bool)

(assert (=> (not b_lambda!21951) (not bm!60618)))

(assert (=> bm!60618 t!40024))

(declare-fun b_and!43595 () Bool)

(assert (= b_and!43593 (and (=> t!40024 result!22645) b_and!43595)))

(assert (=> bm!60618 m!1121703))

(assert (=> bm!60618 m!1121731))

(declare-fun m!1121965 () Bool)

(assert (=> bm!60618 m!1121965))

(declare-fun m!1121967 () Bool)

(assert (=> bm!60618 m!1121967))

(declare-fun m!1121969 () Bool)

(assert (=> d!133469 m!1121969))

(declare-fun m!1121971 () Bool)

(assert (=> b!1217647 m!1121971))

(assert (=> bm!60619 m!1121709))

(assert (=> b!1217432 d!133469))

(declare-fun b!1217650 () Bool)

(declare-fun e!691301 () ListLongMap!18017)

(declare-fun e!691300 () ListLongMap!18017)

(assert (=> b!1217650 (= e!691301 e!691300)))

(declare-fun c!120098 () Bool)

(assert (=> b!1217650 (= c!120098 (validKeyInArray!0 (select (arr!37911 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1217651 () Bool)

(declare-fun e!691304 () Bool)

(declare-fun lt!553338 () ListLongMap!18017)

(assert (=> b!1217651 (= e!691304 (isEmpty!1000 lt!553338))))

(declare-fun b!1217652 () Bool)

(declare-fun e!691299 () Bool)

(declare-fun e!691302 () Bool)

(assert (=> b!1217652 (= e!691299 e!691302)))

(assert (=> b!1217652 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38449 _keys!1208)))))

(declare-fun res!808634 () Bool)

(assert (=> b!1217652 (= res!808634 (contains!6983 lt!553338 (select (arr!37911 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1217652 (=> (not res!808634) (not e!691302))))

(declare-fun b!1217653 () Bool)

(assert (=> b!1217653 (= e!691301 (ListLongMap!18018 Nil!26824))))

(declare-fun b!1217654 () Bool)

(declare-fun e!691298 () Bool)

(assert (=> b!1217654 (= e!691298 (validKeyInArray!0 (select (arr!37911 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1217654 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1217655 () Bool)

(declare-fun call!60623 () ListLongMap!18017)

(assert (=> b!1217655 (= e!691300 call!60623)))

(declare-fun d!133471 () Bool)

(declare-fun e!691303 () Bool)

(assert (=> d!133471 e!691303))

(declare-fun res!808637 () Bool)

(assert (=> d!133471 (=> (not res!808637) (not e!691303))))

(assert (=> d!133471 (= res!808637 (not (contains!6983 lt!553338 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133471 (= lt!553338 e!691301)))

(declare-fun c!120097 () Bool)

(assert (=> d!133471 (= c!120097 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38449 _keys!1208)))))

(assert (=> d!133471 (validMask!0 mask!1564)))

(assert (=> d!133471 (= (getCurrentListMapNoExtraKeys!5463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553338)))

(declare-fun bm!60620 () Bool)

(assert (=> bm!60620 (= call!60623 (getCurrentListMapNoExtraKeys!5463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1217656 () Bool)

(declare-fun res!808636 () Bool)

(assert (=> b!1217656 (=> (not res!808636) (not e!691303))))

(assert (=> b!1217656 (= res!808636 (not (contains!6983 lt!553338 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1217657 () Bool)

(assert (=> b!1217657 (= e!691304 (= lt!553338 (getCurrentListMapNoExtraKeys!5463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1217658 () Bool)

(assert (=> b!1217658 (= e!691299 e!691304)))

(declare-fun c!120099 () Bool)

(assert (=> b!1217658 (= c!120099 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38449 _keys!1208)))))

(declare-fun b!1217659 () Bool)

(declare-fun lt!553339 () Unit!40219)

(declare-fun lt!553342 () Unit!40219)

(assert (=> b!1217659 (= lt!553339 lt!553342)))

(declare-fun lt!553337 () (_ BitVec 64))

(declare-fun lt!553340 () V!46369)

(declare-fun lt!553343 () (_ BitVec 64))

(declare-fun lt!553341 () ListLongMap!18017)

(assert (=> b!1217659 (not (contains!6983 (+!4094 lt!553341 (tuple2!20049 lt!553337 lt!553340)) lt!553343))))

(assert (=> b!1217659 (= lt!553342 (addStillNotContains!300 lt!553341 lt!553337 lt!553340 lt!553343))))

(assert (=> b!1217659 (= lt!553343 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1217659 (= lt!553340 (get!19331 (select (arr!37912 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3314 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1217659 (= lt!553337 (select (arr!37911 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1217659 (= lt!553341 call!60623)))

(assert (=> b!1217659 (= e!691300 (+!4094 call!60623 (tuple2!20049 (select (arr!37911 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19331 (select (arr!37912 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3314 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1217660 () Bool)

(assert (=> b!1217660 (= e!691303 e!691299)))

(declare-fun c!120096 () Bool)

(assert (=> b!1217660 (= c!120096 e!691298)))

(declare-fun res!808635 () Bool)

(assert (=> b!1217660 (=> (not res!808635) (not e!691298))))

(assert (=> b!1217660 (= res!808635 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38449 _keys!1208)))))

(declare-fun b!1217661 () Bool)

(assert (=> b!1217661 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38449 _keys!1208)))))

(assert (=> b!1217661 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38450 _values!996)))))

(assert (=> b!1217661 (= e!691302 (= (apply!964 lt!553338 (select (arr!37911 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19331 (select (arr!37912 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3314 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133471 c!120097) b!1217653))

(assert (= (and d!133471 (not c!120097)) b!1217650))

(assert (= (and b!1217650 c!120098) b!1217659))

(assert (= (and b!1217650 (not c!120098)) b!1217655))

(assert (= (or b!1217659 b!1217655) bm!60620))

(assert (= (and d!133471 res!808637) b!1217656))

(assert (= (and b!1217656 res!808636) b!1217660))

(assert (= (and b!1217660 res!808635) b!1217654))

(assert (= (and b!1217660 c!120096) b!1217652))

(assert (= (and b!1217660 (not c!120096)) b!1217658))

(assert (= (and b!1217652 res!808634) b!1217661))

(assert (= (and b!1217658 c!120099) b!1217657))

(assert (= (and b!1217658 (not c!120099)) b!1217651))

(declare-fun b_lambda!21953 () Bool)

(assert (=> (not b_lambda!21953) (not b!1217659)))

(assert (=> b!1217659 t!40024))

(declare-fun b_and!43597 () Bool)

(assert (= b_and!43595 (and (=> t!40024 result!22645) b_and!43597)))

(declare-fun b_lambda!21955 () Bool)

(assert (=> (not b_lambda!21955) (not b!1217661)))

(assert (=> b!1217661 t!40024))

(declare-fun b_and!43599 () Bool)

(assert (= b_and!43597 (and (=> t!40024 result!22645) b_and!43599)))

(declare-fun m!1121973 () Bool)

(assert (=> b!1217657 m!1121973))

(declare-fun m!1121975 () Bool)

(assert (=> b!1217652 m!1121975))

(assert (=> b!1217652 m!1121975))

(declare-fun m!1121977 () Bool)

(assert (=> b!1217652 m!1121977))

(declare-fun m!1121979 () Bool)

(assert (=> d!133471 m!1121979))

(assert (=> d!133471 m!1121695))

(declare-fun m!1121981 () Bool)

(assert (=> b!1217651 m!1121981))

(assert (=> b!1217650 m!1121975))

(assert (=> b!1217650 m!1121975))

(declare-fun m!1121983 () Bool)

(assert (=> b!1217650 m!1121983))

(assert (=> bm!60620 m!1121973))

(assert (=> b!1217661 m!1121731))

(declare-fun m!1121985 () Bool)

(assert (=> b!1217661 m!1121985))

(assert (=> b!1217661 m!1121975))

(assert (=> b!1217661 m!1121975))

(declare-fun m!1121987 () Bool)

(assert (=> b!1217661 m!1121987))

(assert (=> b!1217661 m!1121985))

(assert (=> b!1217661 m!1121731))

(declare-fun m!1121989 () Bool)

(assert (=> b!1217661 m!1121989))

(assert (=> b!1217654 m!1121975))

(assert (=> b!1217654 m!1121975))

(assert (=> b!1217654 m!1121983))

(declare-fun m!1121991 () Bool)

(assert (=> b!1217659 m!1121991))

(assert (=> b!1217659 m!1121731))

(declare-fun m!1121993 () Bool)

(assert (=> b!1217659 m!1121993))

(assert (=> b!1217659 m!1121985))

(assert (=> b!1217659 m!1121975))

(assert (=> b!1217659 m!1121985))

(assert (=> b!1217659 m!1121731))

(assert (=> b!1217659 m!1121989))

(declare-fun m!1121995 () Bool)

(assert (=> b!1217659 m!1121995))

(assert (=> b!1217659 m!1121995))

(declare-fun m!1121997 () Bool)

(assert (=> b!1217659 m!1121997))

(declare-fun m!1121999 () Bool)

(assert (=> b!1217656 m!1121999))

(assert (=> b!1217432 d!133471))

(declare-fun d!133473 () Bool)

(declare-fun lt!553346 () ListLongMap!18017)

(assert (=> d!133473 (not (contains!6983 lt!553346 k0!934))))

(declare-fun removeStrictlySorted!104 (List!26827 (_ BitVec 64)) List!26827)

(assert (=> d!133473 (= lt!553346 (ListLongMap!18018 (removeStrictlySorted!104 (toList!9024 lt!553221) k0!934)))))

(assert (=> d!133473 (= (-!1861 lt!553221 k0!934) lt!553346)))

(declare-fun bs!34286 () Bool)

(assert (= bs!34286 d!133473))

(declare-fun m!1122001 () Bool)

(assert (=> bs!34286 m!1122001))

(declare-fun m!1122003 () Bool)

(assert (=> bs!34286 m!1122003))

(assert (=> b!1217432 d!133473))

(declare-fun d!133475 () Bool)

(declare-fun res!808638 () Bool)

(declare-fun e!691305 () Bool)

(assert (=> d!133475 (=> res!808638 e!691305)))

(assert (=> d!133475 (= res!808638 (bvsge #b00000000000000000000000000000000 (size!38449 _keys!1208)))))

(assert (=> d!133475 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!691305)))

(declare-fun b!1217662 () Bool)

(declare-fun e!691307 () Bool)

(declare-fun e!691306 () Bool)

(assert (=> b!1217662 (= e!691307 e!691306)))

(declare-fun lt!553349 () (_ BitVec 64))

(assert (=> b!1217662 (= lt!553349 (select (arr!37911 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!553348 () Unit!40219)

(assert (=> b!1217662 (= lt!553348 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!553349 #b00000000000000000000000000000000))))

(assert (=> b!1217662 (arrayContainsKey!0 _keys!1208 lt!553349 #b00000000000000000000000000000000)))

(declare-fun lt!553347 () Unit!40219)

(assert (=> b!1217662 (= lt!553347 lt!553348)))

(declare-fun res!808639 () Bool)

(assert (=> b!1217662 (= res!808639 (= (seekEntryOrOpen!0 (select (arr!37911 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9943 #b00000000000000000000000000000000)))))

(assert (=> b!1217662 (=> (not res!808639) (not e!691306))))

(declare-fun b!1217663 () Bool)

(declare-fun call!60624 () Bool)

(assert (=> b!1217663 (= e!691307 call!60624)))

(declare-fun b!1217664 () Bool)

(assert (=> b!1217664 (= e!691306 call!60624)))

(declare-fun bm!60621 () Bool)

(assert (=> bm!60621 (= call!60624 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1217665 () Bool)

(assert (=> b!1217665 (= e!691305 e!691307)))

(declare-fun c!120100 () Bool)

(assert (=> b!1217665 (= c!120100 (validKeyInArray!0 (select (arr!37911 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133475 (not res!808638)) b!1217665))

(assert (= (and b!1217665 c!120100) b!1217662))

(assert (= (and b!1217665 (not c!120100)) b!1217663))

(assert (= (and b!1217662 res!808639) b!1217664))

(assert (= (or b!1217664 b!1217663) bm!60621))

(assert (=> b!1217662 m!1121857))

(declare-fun m!1122005 () Bool)

(assert (=> b!1217662 m!1122005))

(declare-fun m!1122007 () Bool)

(assert (=> b!1217662 m!1122007))

(assert (=> b!1217662 m!1121857))

(declare-fun m!1122009 () Bool)

(assert (=> b!1217662 m!1122009))

(declare-fun m!1122011 () Bool)

(assert (=> bm!60621 m!1122011))

(assert (=> b!1217665 m!1121857))

(assert (=> b!1217665 m!1121857))

(assert (=> b!1217665 m!1121931))

(assert (=> b!1217423 d!133475))

(declare-fun d!133477 () Bool)

(declare-fun e!691310 () Bool)

(assert (=> d!133477 e!691310))

(declare-fun res!808645 () Bool)

(assert (=> d!133477 (=> (not res!808645) (not e!691310))))

(declare-fun lt!553358 () ListLongMap!18017)

(assert (=> d!133477 (= res!808645 (contains!6983 lt!553358 (_1!10035 (tuple2!20049 (select (arr!37911 _keys!1208) from!1455) (get!19331 (select (arr!37912 _values!996) from!1455) lt!553217)))))))

(declare-fun lt!553361 () List!26827)

(assert (=> d!133477 (= lt!553358 (ListLongMap!18018 lt!553361))))

(declare-fun lt!553359 () Unit!40219)

(declare-fun lt!553360 () Unit!40219)

(assert (=> d!133477 (= lt!553359 lt!553360)))

(declare-datatypes ((Option!695 0))(
  ( (Some!694 (v!18178 V!46369)) (None!693) )
))
(declare-fun getValueByKey!644 (List!26827 (_ BitVec 64)) Option!695)

(assert (=> d!133477 (= (getValueByKey!644 lt!553361 (_1!10035 (tuple2!20049 (select (arr!37911 _keys!1208) from!1455) (get!19331 (select (arr!37912 _values!996) from!1455) lt!553217)))) (Some!694 (_2!10035 (tuple2!20049 (select (arr!37911 _keys!1208) from!1455) (get!19331 (select (arr!37912 _values!996) from!1455) lt!553217)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!320 (List!26827 (_ BitVec 64) V!46369) Unit!40219)

(assert (=> d!133477 (= lt!553360 (lemmaContainsTupThenGetReturnValue!320 lt!553361 (_1!10035 (tuple2!20049 (select (arr!37911 _keys!1208) from!1455) (get!19331 (select (arr!37912 _values!996) from!1455) lt!553217))) (_2!10035 (tuple2!20049 (select (arr!37911 _keys!1208) from!1455) (get!19331 (select (arr!37912 _values!996) from!1455) lt!553217)))))))

(declare-fun insertStrictlySorted!413 (List!26827 (_ BitVec 64) V!46369) List!26827)

(assert (=> d!133477 (= lt!553361 (insertStrictlySorted!413 (toList!9024 lt!553226) (_1!10035 (tuple2!20049 (select (arr!37911 _keys!1208) from!1455) (get!19331 (select (arr!37912 _values!996) from!1455) lt!553217))) (_2!10035 (tuple2!20049 (select (arr!37911 _keys!1208) from!1455) (get!19331 (select (arr!37912 _values!996) from!1455) lt!553217)))))))

(assert (=> d!133477 (= (+!4094 lt!553226 (tuple2!20049 (select (arr!37911 _keys!1208) from!1455) (get!19331 (select (arr!37912 _values!996) from!1455) lt!553217))) lt!553358)))

(declare-fun b!1217670 () Bool)

(declare-fun res!808644 () Bool)

(assert (=> b!1217670 (=> (not res!808644) (not e!691310))))

(assert (=> b!1217670 (= res!808644 (= (getValueByKey!644 (toList!9024 lt!553358) (_1!10035 (tuple2!20049 (select (arr!37911 _keys!1208) from!1455) (get!19331 (select (arr!37912 _values!996) from!1455) lt!553217)))) (Some!694 (_2!10035 (tuple2!20049 (select (arr!37911 _keys!1208) from!1455) (get!19331 (select (arr!37912 _values!996) from!1455) lt!553217))))))))

(declare-fun b!1217671 () Bool)

(declare-fun contains!6985 (List!26827 tuple2!20048) Bool)

(assert (=> b!1217671 (= e!691310 (contains!6985 (toList!9024 lt!553358) (tuple2!20049 (select (arr!37911 _keys!1208) from!1455) (get!19331 (select (arr!37912 _values!996) from!1455) lt!553217))))))

(assert (= (and d!133477 res!808645) b!1217670))

(assert (= (and b!1217670 res!808644) b!1217671))

(declare-fun m!1122013 () Bool)

(assert (=> d!133477 m!1122013))

(declare-fun m!1122015 () Bool)

(assert (=> d!133477 m!1122015))

(declare-fun m!1122017 () Bool)

(assert (=> d!133477 m!1122017))

(declare-fun m!1122019 () Bool)

(assert (=> d!133477 m!1122019))

(declare-fun m!1122021 () Bool)

(assert (=> b!1217670 m!1122021))

(declare-fun m!1122023 () Bool)

(assert (=> b!1217671 m!1122023))

(assert (=> b!1217416 d!133477))

(declare-fun d!133479 () Bool)

(declare-fun c!120103 () Bool)

(assert (=> d!133479 (= c!120103 ((_ is ValueCellFull!14756) (select (arr!37912 _values!996) from!1455)))))

(declare-fun e!691313 () V!46369)

(assert (=> d!133479 (= (get!19331 (select (arr!37912 _values!996) from!1455) lt!553217) e!691313)))

(declare-fun b!1217676 () Bool)

(declare-fun get!19334 (ValueCell!14756 V!46369) V!46369)

(assert (=> b!1217676 (= e!691313 (get!19334 (select (arr!37912 _values!996) from!1455) lt!553217))))

(declare-fun b!1217677 () Bool)

(declare-fun get!19335 (ValueCell!14756 V!46369) V!46369)

(assert (=> b!1217677 (= e!691313 (get!19335 (select (arr!37912 _values!996) from!1455) lt!553217))))

(assert (= (and d!133479 c!120103) b!1217676))

(assert (= (and d!133479 (not c!120103)) b!1217677))

(assert (=> b!1217676 m!1121739))

(declare-fun m!1122025 () Bool)

(assert (=> b!1217676 m!1122025))

(assert (=> b!1217677 m!1121739))

(declare-fun m!1122027 () Bool)

(assert (=> b!1217677 m!1122027))

(assert (=> b!1217416 d!133479))

(declare-fun d!133481 () Bool)

(assert (=> d!133481 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1217425 d!133481))

(declare-fun b!1217685 () Bool)

(declare-fun e!691318 () Bool)

(assert (=> b!1217685 (= e!691318 tp_is_empty!30931)))

(declare-fun mapNonEmpty!48283 () Bool)

(declare-fun mapRes!48283 () Bool)

(declare-fun tp!91721 () Bool)

(declare-fun e!691319 () Bool)

(assert (=> mapNonEmpty!48283 (= mapRes!48283 (and tp!91721 e!691319))))

(declare-fun mapRest!48283 () (Array (_ BitVec 32) ValueCell!14756))

(declare-fun mapKey!48283 () (_ BitVec 32))

(declare-fun mapValue!48283 () ValueCell!14756)

(assert (=> mapNonEmpty!48283 (= mapRest!48274 (store mapRest!48283 mapKey!48283 mapValue!48283))))

(declare-fun condMapEmpty!48283 () Bool)

(declare-fun mapDefault!48283 () ValueCell!14756)

(assert (=> mapNonEmpty!48274 (= condMapEmpty!48283 (= mapRest!48274 ((as const (Array (_ BitVec 32) ValueCell!14756)) mapDefault!48283)))))

(assert (=> mapNonEmpty!48274 (= tp!91705 (and e!691318 mapRes!48283))))

(declare-fun mapIsEmpty!48283 () Bool)

(assert (=> mapIsEmpty!48283 mapRes!48283))

(declare-fun b!1217684 () Bool)

(assert (=> b!1217684 (= e!691319 tp_is_empty!30931)))

(assert (= (and mapNonEmpty!48274 condMapEmpty!48283) mapIsEmpty!48283))

(assert (= (and mapNonEmpty!48274 (not condMapEmpty!48283)) mapNonEmpty!48283))

(assert (= (and mapNonEmpty!48283 ((_ is ValueCellFull!14756) mapValue!48283)) b!1217684))

(assert (= (and mapNonEmpty!48274 ((_ is ValueCellFull!14756) mapDefault!48283)) b!1217685))

(declare-fun m!1122029 () Bool)

(assert (=> mapNonEmpty!48283 m!1122029))

(declare-fun b_lambda!21957 () Bool)

(assert (= b_lambda!21941 (or (and start!101324 b_free!26227) b_lambda!21957)))

(declare-fun b_lambda!21959 () Bool)

(assert (= b_lambda!21943 (or (and start!101324 b_free!26227) b_lambda!21959)))

(declare-fun b_lambda!21961 () Bool)

(assert (= b_lambda!21939 (or (and start!101324 b_free!26227) b_lambda!21961)))

(declare-fun b_lambda!21963 () Bool)

(assert (= b_lambda!21955 (or (and start!101324 b_free!26227) b_lambda!21963)))

(declare-fun b_lambda!21965 () Bool)

(assert (= b_lambda!21953 (or (and start!101324 b_free!26227) b_lambda!21965)))

(declare-fun b_lambda!21967 () Bool)

(assert (= b_lambda!21945 (or (and start!101324 b_free!26227) b_lambda!21967)))

(declare-fun b_lambda!21969 () Bool)

(assert (= b_lambda!21951 (or (and start!101324 b_free!26227) b_lambda!21969)))

(declare-fun b_lambda!21971 () Bool)

(assert (= b_lambda!21949 (or (and start!101324 b_free!26227) b_lambda!21971)))

(declare-fun b_lambda!21973 () Bool)

(assert (= b_lambda!21947 (or (and start!101324 b_free!26227) b_lambda!21973)))

(check-sat (not b!1217555) (not b!1217584) (not bm!60611) (not d!133471) (not b!1217587) (not mapNonEmpty!48283) (not b!1217589) (not b!1217608) (not b_lambda!21963) (not b!1217636) (not b!1217652) (not b!1217599) (not b!1217657) (not bm!60612) (not b_lambda!21971) (not b_lambda!21973) (not d!133469) (not b!1217638) (not bm!60613) (not b!1217659) (not d!133455) (not b!1217623) (not b!1217671) (not b!1217640) (not b!1217630) (not b_lambda!21967) (not b!1217625) (not bm!60604) (not b!1217620) (not bm!60607) (not b!1217631) (not b!1217594) (not d!133449) (not b!1217650) (not b!1217656) (not d!133465) (not b!1217661) (not b!1217662) (not b!1217647) tp_is_empty!30931 (not bm!60618) (not b!1217546) (not b!1217558) (not b_lambda!21959) (not b!1217633) (not b!1217676) (not b_next!26227) (not b!1217622) (not bm!60620) (not b!1217585) (not b!1217677) (not b!1217597) (not d!133453) (not b_lambda!21937) (not d!133473) (not b!1217665) (not b!1217606) (not b!1217627) (not bm!60621) (not b!1217595) (not b!1217670) (not b_lambda!21965) (not b_lambda!21961) (not b!1217602) (not b!1217629) (not b!1217628) (not b!1217604) (not bm!60619) (not d!133477) (not b!1217654) (not b!1217651) (not b!1217596) (not b!1217590) (not b!1217583) (not b_lambda!21957) b_and!43599 (not b_lambda!21969) (not b!1217601) (not bm!60608) (not b!1217592) (not b!1217635))
(check-sat b_and!43599 (not b_next!26227))
