; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100786 () Bool)

(assert start!100786)

(declare-fun b_free!25873 () Bool)

(declare-fun b_next!25873 () Bool)

(assert (=> start!100786 (= b_free!25873 (not b_next!25873))))

(declare-fun tp!90608 () Bool)

(declare-fun b_and!42635 () Bool)

(assert (=> start!100786 (= tp!90608 b_and!42635)))

(declare-fun bm!57738 () Bool)

(declare-fun call!57744 () Bool)

(declare-fun call!57745 () Bool)

(assert (=> bm!57738 (= call!57744 call!57745)))

(declare-fun b!1203504 () Bool)

(declare-fun res!800707 () Bool)

(declare-fun e!683521 () Bool)

(assert (=> b!1203504 (=> (not res!800707) (not e!683521))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1203504 (= res!800707 (validKeyInArray!0 k0!934))))

(declare-fun b!1203505 () Bool)

(declare-datatypes ((Unit!39819 0))(
  ( (Unit!39820) )
))
(declare-fun e!683514 () Unit!39819)

(declare-fun e!683516 () Unit!39819)

(assert (=> b!1203505 (= e!683514 e!683516)))

(declare-fun c!118033 () Bool)

(declare-fun lt!545364 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1203505 (= c!118033 (and (not lt!545364) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!45897 0))(
  ( (V!45898 (val!15345 Int)) )
))
(declare-fun zeroValue!944 () V!45897)

(declare-fun bm!57739 () Bool)

(declare-fun c!118035 () Bool)

(declare-fun call!57742 () Unit!39819)

(declare-datatypes ((tuple2!19678 0))(
  ( (tuple2!19679 (_1!9850 (_ BitVec 64)) (_2!9850 V!45897)) )
))
(declare-datatypes ((List!26492 0))(
  ( (Nil!26489) (Cons!26488 (h!27706 tuple2!19678) (t!39337 List!26492)) )
))
(declare-datatypes ((ListLongMap!17655 0))(
  ( (ListLongMap!17656 (toList!8843 List!26492)) )
))
(declare-fun lt!545361 () ListLongMap!17655)

(declare-fun minValue!944 () V!45897)

(declare-fun addStillContains!998 (ListLongMap!17655 (_ BitVec 64) V!45897 (_ BitVec 64)) Unit!39819)

(assert (=> bm!57739 (= call!57742 (addStillContains!998 lt!545361 (ite (or c!118035 c!118033) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118035 c!118033) zeroValue!944 minValue!944) k0!934))))

(declare-fun res!800713 () Bool)

(assert (=> start!100786 (=> (not res!800713) (not e!683521))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77965 0))(
  ( (array!77966 (arr!37621 (Array (_ BitVec 32) (_ BitVec 64))) (size!38158 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77965)

(assert (=> start!100786 (= res!800713 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38158 _keys!1208))))))

(assert (=> start!100786 e!683521))

(declare-fun tp_is_empty!30577 () Bool)

(assert (=> start!100786 tp_is_empty!30577))

(declare-fun array_inv!28736 (array!77965) Bool)

(assert (=> start!100786 (array_inv!28736 _keys!1208)))

(assert (=> start!100786 true))

(assert (=> start!100786 tp!90608))

(declare-datatypes ((ValueCell!14579 0))(
  ( (ValueCellFull!14579 (v!17979 V!45897)) (EmptyCell!14579) )
))
(declare-datatypes ((array!77967 0))(
  ( (array!77968 (arr!37622 (Array (_ BitVec 32) ValueCell!14579)) (size!38159 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77967)

(declare-fun e!683522 () Bool)

(declare-fun array_inv!28737 (array!77967) Bool)

(assert (=> start!100786 (and (array_inv!28737 _values!996) e!683522)))

(declare-fun mapNonEmpty!47708 () Bool)

(declare-fun mapRes!47708 () Bool)

(declare-fun tp!90609 () Bool)

(declare-fun e!683520 () Bool)

(assert (=> mapNonEmpty!47708 (= mapRes!47708 (and tp!90609 e!683520))))

(declare-fun mapRest!47708 () (Array (_ BitVec 32) ValueCell!14579))

(declare-fun mapKey!47708 () (_ BitVec 32))

(declare-fun mapValue!47708 () ValueCell!14579)

(assert (=> mapNonEmpty!47708 (= (arr!37622 _values!996) (store mapRest!47708 mapKey!47708 mapValue!47708))))

(declare-fun b!1203506 () Bool)

(declare-fun e!683515 () Bool)

(declare-fun call!57747 () ListLongMap!17655)

(declare-fun call!57748 () ListLongMap!17655)

(declare-fun -!1794 (ListLongMap!17655 (_ BitVec 64)) ListLongMap!17655)

(assert (=> b!1203506 (= e!683515 (= call!57748 (-!1794 call!57747 k0!934)))))

(declare-fun b!1203507 () Bool)

(declare-fun e!683518 () Bool)

(assert (=> b!1203507 (= e!683521 e!683518)))

(declare-fun res!800714 () Bool)

(assert (=> b!1203507 (=> (not res!800714) (not e!683518))))

(declare-fun lt!545362 () array!77965)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77965 (_ BitVec 32)) Bool)

(assert (=> b!1203507 (= res!800714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545362 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1203507 (= lt!545362 (array!77966 (store (arr!37621 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38158 _keys!1208)))))

(declare-fun b!1203508 () Bool)

(declare-fun res!800716 () Bool)

(assert (=> b!1203508 (=> (not res!800716) (not e!683521))))

(assert (=> b!1203508 (= res!800716 (and (= (size!38159 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38158 _keys!1208) (size!38159 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47708 () Bool)

(assert (=> mapIsEmpty!47708 mapRes!47708))

(declare-fun b!1203509 () Bool)

(declare-fun lt!545367 () Unit!39819)

(assert (=> b!1203509 (= e!683514 lt!545367)))

(declare-fun lt!545372 () Unit!39819)

(assert (=> b!1203509 (= lt!545372 call!57742)))

(declare-fun lt!545363 () ListLongMap!17655)

(declare-fun call!57743 () ListLongMap!17655)

(assert (=> b!1203509 (= lt!545363 call!57743)))

(assert (=> b!1203509 call!57745))

(assert (=> b!1203509 (= lt!545367 (addStillContains!998 lt!545363 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6920 (ListLongMap!17655 (_ BitVec 64)) Bool)

(declare-fun +!4012 (ListLongMap!17655 tuple2!19678) ListLongMap!17655)

(assert (=> b!1203509 (contains!6920 (+!4012 lt!545363 (tuple2!19679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun bm!57740 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!545368 () array!77967)

(declare-fun getCurrentListMapNoExtraKeys!5310 (array!77965 array!77967 (_ BitVec 32) (_ BitVec 32) V!45897 V!45897 (_ BitVec 32) Int) ListLongMap!17655)

(assert (=> bm!57740 (= call!57748 (getCurrentListMapNoExtraKeys!5310 lt!545362 lt!545368 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203510 () Bool)

(declare-fun c!118036 () Bool)

(assert (=> b!1203510 (= c!118036 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545364))))

(declare-fun e!683524 () Unit!39819)

(assert (=> b!1203510 (= e!683516 e!683524)))

(declare-fun b!1203511 () Bool)

(declare-fun e!683513 () Bool)

(assert (=> b!1203511 (= e!683513 tp_is_empty!30577)))

(declare-fun b!1203512 () Bool)

(assert (=> b!1203512 (= e!683520 tp_is_empty!30577)))

(declare-fun b!1203513 () Bool)

(declare-fun res!800710 () Bool)

(assert (=> b!1203513 (=> (not res!800710) (not e!683521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1203513 (= res!800710 (validMask!0 mask!1564))))

(declare-fun b!1203514 () Bool)

(declare-fun e!683512 () Bool)

(assert (=> b!1203514 (= e!683518 (not e!683512))))

(declare-fun res!800712 () Bool)

(assert (=> b!1203514 (=> res!800712 e!683512)))

(assert (=> b!1203514 (= res!800712 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1203514 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!545370 () Unit!39819)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77965 (_ BitVec 64) (_ BitVec 32)) Unit!39819)

(assert (=> b!1203514 (= lt!545370 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!57741 () Bool)

(declare-fun call!57741 () Unit!39819)

(assert (=> bm!57741 (= call!57741 call!57742)))

(declare-fun b!1203515 () Bool)

(declare-fun e!683525 () Bool)

(declare-fun e!683519 () Bool)

(assert (=> b!1203515 (= e!683525 e!683519)))

(declare-fun res!800703 () Bool)

(assert (=> b!1203515 (=> res!800703 e!683519)))

(assert (=> b!1203515 (= res!800703 (not (= (select (arr!37621 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1203515 e!683515))

(declare-fun c!118034 () Bool)

(assert (=> b!1203515 (= c!118034 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545365 () Unit!39819)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1014 (array!77965 array!77967 (_ BitVec 32) (_ BitVec 32) V!45897 V!45897 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39819)

(assert (=> b!1203515 (= lt!545365 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1014 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57742 () Bool)

(declare-fun call!57746 () ListLongMap!17655)

(assert (=> bm!57742 (= call!57745 (contains!6920 (ite c!118035 lt!545363 call!57746) k0!934))))

(declare-fun b!1203516 () Bool)

(assert (=> b!1203516 (= e!683515 (= call!57748 call!57747))))

(declare-fun b!1203517 () Bool)

(assert (=> b!1203517 (= e!683512 e!683525)))

(declare-fun res!800706 () Bool)

(assert (=> b!1203517 (=> res!800706 e!683525)))

(assert (=> b!1203517 (= res!800706 (not (= from!1455 i!673)))))

(declare-fun lt!545371 () ListLongMap!17655)

(assert (=> b!1203517 (= lt!545371 (getCurrentListMapNoExtraKeys!5310 lt!545362 lt!545368 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3244 (Int (_ BitVec 64)) V!45897)

(assert (=> b!1203517 (= lt!545368 (array!77968 (store (arr!37622 _values!996) i!673 (ValueCellFull!14579 (dynLambda!3244 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38159 _values!996)))))

(declare-fun lt!545360 () ListLongMap!17655)

(assert (=> b!1203517 (= lt!545360 (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1203518 () Bool)

(declare-fun res!800711 () Bool)

(assert (=> b!1203518 (=> (not res!800711) (not e!683521))))

(assert (=> b!1203518 (= res!800711 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38158 _keys!1208))))))

(declare-fun b!1203519 () Bool)

(assert (=> b!1203519 (= e!683522 (and e!683513 mapRes!47708))))

(declare-fun condMapEmpty!47708 () Bool)

(declare-fun mapDefault!47708 () ValueCell!14579)

(assert (=> b!1203519 (= condMapEmpty!47708 (= (arr!37622 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14579)) mapDefault!47708)))))

(declare-fun bm!57743 () Bool)

(assert (=> bm!57743 (= call!57747 (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57744 () Bool)

(assert (=> bm!57744 (= call!57746 call!57743)))

(declare-fun b!1203520 () Bool)

(declare-fun res!800709 () Bool)

(assert (=> b!1203520 (=> (not res!800709) (not e!683521))))

(declare-datatypes ((List!26493 0))(
  ( (Nil!26490) (Cons!26489 (h!27707 (_ BitVec 64)) (t!39338 List!26493)) )
))
(declare-fun arrayNoDuplicates!0 (array!77965 (_ BitVec 32) List!26493) Bool)

(assert (=> b!1203520 (= res!800709 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26490))))

(declare-fun b!1203521 () Bool)

(declare-fun res!800708 () Bool)

(assert (=> b!1203521 (=> (not res!800708) (not e!683521))))

(assert (=> b!1203521 (= res!800708 (= (select (arr!37621 _keys!1208) i!673) k0!934))))

(declare-fun b!1203522 () Bool)

(declare-fun e!683517 () Bool)

(assert (=> b!1203522 (= e!683519 e!683517)))

(declare-fun res!800705 () Bool)

(assert (=> b!1203522 (=> res!800705 e!683517)))

(assert (=> b!1203522 (= res!800705 (not (contains!6920 lt!545361 k0!934)))))

(assert (=> b!1203522 (= lt!545361 (getCurrentListMapNoExtraKeys!5310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203523 () Bool)

(assert (=> b!1203523 call!57744))

(declare-fun lt!545359 () Unit!39819)

(assert (=> b!1203523 (= lt!545359 call!57741)))

(assert (=> b!1203523 (= e!683516 lt!545359)))

(declare-fun b!1203524 () Bool)

(assert (=> b!1203524 (= e!683517 true)))

(declare-fun lt!545369 () Unit!39819)

(assert (=> b!1203524 (= lt!545369 e!683514)))

(assert (=> b!1203524 (= c!118035 (and (not lt!545364) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1203524 (= lt!545364 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1203525 () Bool)

(declare-fun Unit!39821 () Unit!39819)

(assert (=> b!1203525 (= e!683524 Unit!39821)))

(declare-fun b!1203526 () Bool)

(declare-fun lt!545366 () Unit!39819)

(assert (=> b!1203526 (= e!683524 lt!545366)))

(assert (=> b!1203526 (= lt!545366 call!57741)))

(assert (=> b!1203526 call!57744))

(declare-fun bm!57745 () Bool)

(assert (=> bm!57745 (= call!57743 (+!4012 lt!545361 (ite (or c!118035 c!118033) (tuple2!19679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1203527 () Bool)

(declare-fun res!800704 () Bool)

(assert (=> b!1203527 (=> (not res!800704) (not e!683518))))

(assert (=> b!1203527 (= res!800704 (arrayNoDuplicates!0 lt!545362 #b00000000000000000000000000000000 Nil!26490))))

(declare-fun b!1203528 () Bool)

(declare-fun res!800715 () Bool)

(assert (=> b!1203528 (=> (not res!800715) (not e!683521))))

(assert (=> b!1203528 (= res!800715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100786 res!800713) b!1203513))

(assert (= (and b!1203513 res!800710) b!1203508))

(assert (= (and b!1203508 res!800716) b!1203528))

(assert (= (and b!1203528 res!800715) b!1203520))

(assert (= (and b!1203520 res!800709) b!1203518))

(assert (= (and b!1203518 res!800711) b!1203504))

(assert (= (and b!1203504 res!800707) b!1203521))

(assert (= (and b!1203521 res!800708) b!1203507))

(assert (= (and b!1203507 res!800714) b!1203527))

(assert (= (and b!1203527 res!800704) b!1203514))

(assert (= (and b!1203514 (not res!800712)) b!1203517))

(assert (= (and b!1203517 (not res!800706)) b!1203515))

(assert (= (and b!1203515 c!118034) b!1203506))

(assert (= (and b!1203515 (not c!118034)) b!1203516))

(assert (= (or b!1203506 b!1203516) bm!57740))

(assert (= (or b!1203506 b!1203516) bm!57743))

(assert (= (and b!1203515 (not res!800703)) b!1203522))

(assert (= (and b!1203522 (not res!800705)) b!1203524))

(assert (= (and b!1203524 c!118035) b!1203509))

(assert (= (and b!1203524 (not c!118035)) b!1203505))

(assert (= (and b!1203505 c!118033) b!1203523))

(assert (= (and b!1203505 (not c!118033)) b!1203510))

(assert (= (and b!1203510 c!118036) b!1203526))

(assert (= (and b!1203510 (not c!118036)) b!1203525))

(assert (= (or b!1203523 b!1203526) bm!57741))

(assert (= (or b!1203523 b!1203526) bm!57744))

(assert (= (or b!1203523 b!1203526) bm!57738))

(assert (= (or b!1203509 bm!57738) bm!57742))

(assert (= (or b!1203509 bm!57741) bm!57739))

(assert (= (or b!1203509 bm!57744) bm!57745))

(assert (= (and b!1203519 condMapEmpty!47708) mapIsEmpty!47708))

(assert (= (and b!1203519 (not condMapEmpty!47708)) mapNonEmpty!47708))

(get-info :version)

(assert (= (and mapNonEmpty!47708 ((_ is ValueCellFull!14579) mapValue!47708)) b!1203512))

(assert (= (and b!1203519 ((_ is ValueCellFull!14579) mapDefault!47708)) b!1203511))

(assert (= start!100786 b!1203519))

(declare-fun b_lambda!21063 () Bool)

(assert (=> (not b_lambda!21063) (not b!1203517)))

(declare-fun t!39336 () Bool)

(declare-fun tb!10665 () Bool)

(assert (=> (and start!100786 (= defaultEntry!1004 defaultEntry!1004) t!39336) tb!10665))

(declare-fun result!21915 () Bool)

(assert (=> tb!10665 (= result!21915 tp_is_empty!30577)))

(assert (=> b!1203517 t!39336))

(declare-fun b_and!42637 () Bool)

(assert (= b_and!42635 (and (=> t!39336 result!21915) b_and!42637)))

(declare-fun m!1109699 () Bool)

(assert (=> b!1203507 m!1109699))

(declare-fun m!1109701 () Bool)

(assert (=> b!1203507 m!1109701))

(declare-fun m!1109703 () Bool)

(assert (=> b!1203528 m!1109703))

(declare-fun m!1109705 () Bool)

(assert (=> bm!57743 m!1109705))

(declare-fun m!1109707 () Bool)

(assert (=> bm!57739 m!1109707))

(declare-fun m!1109709 () Bool)

(assert (=> bm!57745 m!1109709))

(declare-fun m!1109711 () Bool)

(assert (=> b!1203509 m!1109711))

(declare-fun m!1109713 () Bool)

(assert (=> b!1203509 m!1109713))

(assert (=> b!1203509 m!1109713))

(declare-fun m!1109715 () Bool)

(assert (=> b!1203509 m!1109715))

(declare-fun m!1109717 () Bool)

(assert (=> b!1203504 m!1109717))

(declare-fun m!1109719 () Bool)

(assert (=> b!1203520 m!1109719))

(declare-fun m!1109721 () Bool)

(assert (=> b!1203517 m!1109721))

(declare-fun m!1109723 () Bool)

(assert (=> b!1203517 m!1109723))

(declare-fun m!1109725 () Bool)

(assert (=> b!1203517 m!1109725))

(declare-fun m!1109727 () Bool)

(assert (=> b!1203517 m!1109727))

(declare-fun m!1109729 () Bool)

(assert (=> b!1203514 m!1109729))

(declare-fun m!1109731 () Bool)

(assert (=> b!1203514 m!1109731))

(declare-fun m!1109733 () Bool)

(assert (=> b!1203522 m!1109733))

(assert (=> b!1203522 m!1109705))

(declare-fun m!1109735 () Bool)

(assert (=> mapNonEmpty!47708 m!1109735))

(declare-fun m!1109737 () Bool)

(assert (=> b!1203513 m!1109737))

(declare-fun m!1109739 () Bool)

(assert (=> b!1203527 m!1109739))

(declare-fun m!1109741 () Bool)

(assert (=> b!1203521 m!1109741))

(declare-fun m!1109743 () Bool)

(assert (=> b!1203515 m!1109743))

(declare-fun m!1109745 () Bool)

(assert (=> b!1203515 m!1109745))

(declare-fun m!1109747 () Bool)

(assert (=> b!1203506 m!1109747))

(declare-fun m!1109749 () Bool)

(assert (=> bm!57742 m!1109749))

(declare-fun m!1109751 () Bool)

(assert (=> start!100786 m!1109751))

(declare-fun m!1109753 () Bool)

(assert (=> start!100786 m!1109753))

(declare-fun m!1109755 () Bool)

(assert (=> bm!57740 m!1109755))

(check-sat (not b!1203514) (not mapNonEmpty!47708) (not start!100786) (not bm!57745) (not bm!57740) (not b!1203504) tp_is_empty!30577 (not b_next!25873) (not bm!57742) (not bm!57743) (not b_lambda!21063) (not b!1203513) (not b!1203520) (not b!1203527) (not b!1203507) (not b!1203506) (not b!1203517) (not b!1203528) (not b!1203515) (not b!1203522) b_and!42637 (not b!1203509) (not bm!57739))
(check-sat b_and!42637 (not b_next!25873))
