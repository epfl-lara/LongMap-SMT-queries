; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99666 () Bool)

(assert start!99666)

(declare-fun b_free!25009 () Bool)

(declare-fun b_next!25009 () Bool)

(assert (=> start!99666 (= b_free!25009 (not b_next!25009))))

(declare-fun tp!87740 () Bool)

(declare-fun b_and!40887 () Bool)

(assert (=> start!99666 (= tp!87740 b_and!40887)))

(declare-fun b!1175512 () Bool)

(declare-datatypes ((Unit!38725 0))(
  ( (Unit!38726) )
))
(declare-fun e!668273 () Unit!38725)

(declare-fun Unit!38727 () Unit!38725)

(assert (=> b!1175512 (= e!668273 Unit!38727)))

(declare-fun b!1175513 () Bool)

(declare-fun e!668278 () Bool)

(declare-fun tp_is_empty!29539 () Bool)

(assert (=> b!1175513 (= e!668278 tp_is_empty!29539)))

(declare-fun b!1175514 () Bool)

(declare-fun e!668274 () Bool)

(declare-fun e!668272 () Bool)

(assert (=> b!1175514 (= e!668274 (not e!668272))))

(declare-fun res!780273 () Bool)

(assert (=> b!1175514 (=> res!780273 e!668272)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1175514 (= res!780273 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75943 0))(
  ( (array!75944 (arr!36615 (Array (_ BitVec 32) (_ BitVec 64))) (size!37152 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75943)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175514 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529943 () Unit!38725)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75943 (_ BitVec 64) (_ BitVec 32)) Unit!38725)

(assert (=> b!1175514 (= lt!529943 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175515 () Bool)

(declare-fun res!780274 () Bool)

(declare-fun e!668277 () Bool)

(assert (=> b!1175515 (=> (not res!780274) (not e!668277))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75943 (_ BitVec 32)) Bool)

(assert (=> b!1175515 (= res!780274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1175516 () Bool)

(declare-fun e!668276 () Bool)

(assert (=> b!1175516 (= e!668276 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175517 () Bool)

(declare-fun res!780282 () Bool)

(assert (=> b!1175517 (=> (not res!780282) (not e!668277))))

(assert (=> b!1175517 (= res!780282 (= (select (arr!36615 _keys!1208) i!673) k0!934))))

(declare-fun b!1175518 () Bool)

(declare-fun res!780271 () Bool)

(assert (=> b!1175518 (=> (not res!780271) (not e!668277))))

(assert (=> b!1175518 (= res!780271 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37152 _keys!1208))))))

(declare-fun b!1175519 () Bool)

(declare-fun res!780284 () Bool)

(assert (=> b!1175519 (=> (not res!780284) (not e!668277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175519 (= res!780284 (validKeyInArray!0 k0!934))))

(declare-fun b!1175520 () Bool)

(declare-fun e!668281 () Bool)

(assert (=> b!1175520 (= e!668281 e!668276)))

(declare-fun res!780283 () Bool)

(assert (=> b!1175520 (=> res!780283 e!668276)))

(assert (=> b!1175520 (= res!780283 (not (= (select (arr!36615 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1175521 () Bool)

(assert (=> b!1175521 (= e!668277 e!668274)))

(declare-fun res!780277 () Bool)

(assert (=> b!1175521 (=> (not res!780277) (not e!668274))))

(declare-fun lt!529949 () array!75943)

(assert (=> b!1175521 (= res!780277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529949 mask!1564))))

(assert (=> b!1175521 (= lt!529949 (array!75944 (store (arr!36615 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37152 _keys!1208)))))

(declare-fun b!1175522 () Bool)

(declare-fun e!668279 () Bool)

(assert (=> b!1175522 (= e!668279 tp_is_empty!29539)))

(declare-fun b!1175523 () Bool)

(declare-fun res!780275 () Bool)

(assert (=> b!1175523 (=> (not res!780275) (not e!668277))))

(declare-datatypes ((List!25727 0))(
  ( (Nil!25724) (Cons!25723 (h!26941 (_ BitVec 64)) (t!37720 List!25727)) )
))
(declare-fun arrayNoDuplicates!0 (array!75943 (_ BitVec 32) List!25727) Bool)

(assert (=> b!1175523 (= res!780275 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25724))))

(declare-fun b!1175524 () Bool)

(declare-fun e!668280 () Bool)

(declare-fun e!668275 () Bool)

(assert (=> b!1175524 (= e!668280 e!668275)))

(declare-fun res!780280 () Bool)

(assert (=> b!1175524 (=> res!780280 e!668275)))

(assert (=> b!1175524 (= res!780280 (not (validKeyInArray!0 (select (arr!36615 _keys!1208) from!1455))))))

(declare-datatypes ((V!44513 0))(
  ( (V!44514 (val!14826 Int)) )
))
(declare-datatypes ((tuple2!18990 0))(
  ( (tuple2!18991 (_1!9506 (_ BitVec 64)) (_2!9506 V!44513)) )
))
(declare-datatypes ((List!25728 0))(
  ( (Nil!25725) (Cons!25724 (h!26942 tuple2!18990) (t!37721 List!25728)) )
))
(declare-datatypes ((ListLongMap!16967 0))(
  ( (ListLongMap!16968 (toList!8499 List!25728)) )
))
(declare-fun lt!529953 () ListLongMap!16967)

(declare-fun lt!529952 () ListLongMap!16967)

(assert (=> b!1175524 (= lt!529953 lt!529952)))

(declare-fun lt!529951 () ListLongMap!16967)

(declare-fun -!1544 (ListLongMap!16967 (_ BitVec 64)) ListLongMap!16967)

(assert (=> b!1175524 (= lt!529952 (-!1544 lt!529951 k0!934))))

(declare-fun zeroValue!944 () V!44513)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14060 0))(
  ( (ValueCellFull!14060 (v!17460 V!44513)) (EmptyCell!14060) )
))
(declare-datatypes ((array!75945 0))(
  ( (array!75946 (arr!36616 (Array (_ BitVec 32) ValueCell!14060)) (size!37153 (_ BitVec 32))) )
))
(declare-fun lt!529948 () array!75945)

(declare-fun minValue!944 () V!44513)

(declare-fun getCurrentListMapNoExtraKeys!4984 (array!75943 array!75945 (_ BitVec 32) (_ BitVec 32) V!44513 V!44513 (_ BitVec 32) Int) ListLongMap!16967)

(assert (=> b!1175524 (= lt!529953 (getCurrentListMapNoExtraKeys!4984 lt!529949 lt!529948 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75945)

(assert (=> b!1175524 (= lt!529951 (getCurrentListMapNoExtraKeys!4984 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529942 () Unit!38725)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!769 (array!75943 array!75945 (_ BitVec 32) (_ BitVec 32) V!44513 V!44513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38725)

(assert (=> b!1175524 (= lt!529942 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!769 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46136 () Bool)

(declare-fun mapRes!46136 () Bool)

(assert (=> mapIsEmpty!46136 mapRes!46136))

(declare-fun b!1175525 () Bool)

(assert (=> b!1175525 (= e!668275 true)))

(assert (=> b!1175525 (not (= (select (arr!36615 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529946 () Unit!38725)

(assert (=> b!1175525 (= lt!529946 e!668273)))

(declare-fun c!117035 () Bool)

(assert (=> b!1175525 (= c!117035 (= (select (arr!36615 _keys!1208) from!1455) k0!934))))

(assert (=> b!1175525 e!668281))

(declare-fun res!780272 () Bool)

(assert (=> b!1175525 (=> (not res!780272) (not e!668281))))

(declare-fun lt!529947 () ListLongMap!16967)

(declare-fun lt!529950 () V!44513)

(declare-fun +!3831 (ListLongMap!16967 tuple2!18990) ListLongMap!16967)

(declare-fun get!18719 (ValueCell!14060 V!44513) V!44513)

(assert (=> b!1175525 (= res!780272 (= lt!529947 (+!3831 lt!529952 (tuple2!18991 (select (arr!36615 _keys!1208) from!1455) (get!18719 (select (arr!36616 _values!996) from!1455) lt!529950)))))))

(declare-fun b!1175526 () Bool)

(declare-fun res!780281 () Bool)

(assert (=> b!1175526 (=> (not res!780281) (not e!668274))))

(assert (=> b!1175526 (= res!780281 (arrayNoDuplicates!0 lt!529949 #b00000000000000000000000000000000 Nil!25724))))

(declare-fun res!780279 () Bool)

(assert (=> start!99666 (=> (not res!780279) (not e!668277))))

(assert (=> start!99666 (= res!780279 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37152 _keys!1208))))))

(assert (=> start!99666 e!668277))

(assert (=> start!99666 tp_is_empty!29539))

(declare-fun array_inv!28050 (array!75943) Bool)

(assert (=> start!99666 (array_inv!28050 _keys!1208)))

(assert (=> start!99666 true))

(assert (=> start!99666 tp!87740))

(declare-fun e!668282 () Bool)

(declare-fun array_inv!28051 (array!75945) Bool)

(assert (=> start!99666 (and (array_inv!28051 _values!996) e!668282)))

(declare-fun b!1175527 () Bool)

(declare-fun res!780276 () Bool)

(assert (=> b!1175527 (=> (not res!780276) (not e!668277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175527 (= res!780276 (validMask!0 mask!1564))))

(declare-fun b!1175528 () Bool)

(declare-fun res!780278 () Bool)

(assert (=> b!1175528 (=> (not res!780278) (not e!668277))))

(assert (=> b!1175528 (= res!780278 (and (= (size!37153 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37152 _keys!1208) (size!37153 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175529 () Bool)

(declare-fun Unit!38728 () Unit!38725)

(assert (=> b!1175529 (= e!668273 Unit!38728)))

(declare-fun lt!529941 () Unit!38725)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75943 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38725)

(assert (=> b!1175529 (= lt!529941 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1175529 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529944 () Unit!38725)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75943 (_ BitVec 32) (_ BitVec 32)) Unit!38725)

(assert (=> b!1175529 (= lt!529944 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1175529 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25724)))

(declare-fun lt!529945 () Unit!38725)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75943 (_ BitVec 64) (_ BitVec 32) List!25727) Unit!38725)

(assert (=> b!1175529 (= lt!529945 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25724))))

(assert (=> b!1175529 false))

(declare-fun mapNonEmpty!46136 () Bool)

(declare-fun tp!87741 () Bool)

(assert (=> mapNonEmpty!46136 (= mapRes!46136 (and tp!87741 e!668278))))

(declare-fun mapValue!46136 () ValueCell!14060)

(declare-fun mapKey!46136 () (_ BitVec 32))

(declare-fun mapRest!46136 () (Array (_ BitVec 32) ValueCell!14060))

(assert (=> mapNonEmpty!46136 (= (arr!36616 _values!996) (store mapRest!46136 mapKey!46136 mapValue!46136))))

(declare-fun b!1175530 () Bool)

(assert (=> b!1175530 (= e!668272 e!668280)))

(declare-fun res!780270 () Bool)

(assert (=> b!1175530 (=> res!780270 e!668280)))

(assert (=> b!1175530 (= res!780270 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1175530 (= lt!529947 (getCurrentListMapNoExtraKeys!4984 lt!529949 lt!529948 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1175530 (= lt!529948 (array!75946 (store (arr!36616 _values!996) i!673 (ValueCellFull!14060 lt!529950)) (size!37153 _values!996)))))

(declare-fun dynLambda!2962 (Int (_ BitVec 64)) V!44513)

(assert (=> b!1175530 (= lt!529950 (dynLambda!2962 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529954 () ListLongMap!16967)

(assert (=> b!1175530 (= lt!529954 (getCurrentListMapNoExtraKeys!4984 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1175531 () Bool)

(assert (=> b!1175531 (= e!668282 (and e!668279 mapRes!46136))))

(declare-fun condMapEmpty!46136 () Bool)

(declare-fun mapDefault!46136 () ValueCell!14060)

(assert (=> b!1175531 (= condMapEmpty!46136 (= (arr!36616 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14060)) mapDefault!46136)))))

(assert (= (and start!99666 res!780279) b!1175527))

(assert (= (and b!1175527 res!780276) b!1175528))

(assert (= (and b!1175528 res!780278) b!1175515))

(assert (= (and b!1175515 res!780274) b!1175523))

(assert (= (and b!1175523 res!780275) b!1175518))

(assert (= (and b!1175518 res!780271) b!1175519))

(assert (= (and b!1175519 res!780284) b!1175517))

(assert (= (and b!1175517 res!780282) b!1175521))

(assert (= (and b!1175521 res!780277) b!1175526))

(assert (= (and b!1175526 res!780281) b!1175514))

(assert (= (and b!1175514 (not res!780273)) b!1175530))

(assert (= (and b!1175530 (not res!780270)) b!1175524))

(assert (= (and b!1175524 (not res!780280)) b!1175525))

(assert (= (and b!1175525 res!780272) b!1175520))

(assert (= (and b!1175520 (not res!780283)) b!1175516))

(assert (= (and b!1175525 c!117035) b!1175529))

(assert (= (and b!1175525 (not c!117035)) b!1175512))

(assert (= (and b!1175531 condMapEmpty!46136) mapIsEmpty!46136))

(assert (= (and b!1175531 (not condMapEmpty!46136)) mapNonEmpty!46136))

(get-info :version)

(assert (= (and mapNonEmpty!46136 ((_ is ValueCellFull!14060) mapValue!46136)) b!1175513))

(assert (= (and b!1175531 ((_ is ValueCellFull!14060) mapDefault!46136)) b!1175522))

(assert (= start!99666 b!1175531))

(declare-fun b_lambda!20147 () Bool)

(assert (=> (not b_lambda!20147) (not b!1175530)))

(declare-fun t!37719 () Bool)

(declare-fun tb!9813 () Bool)

(assert (=> (and start!99666 (= defaultEntry!1004 defaultEntry!1004) t!37719) tb!9813))

(declare-fun result!20201 () Bool)

(assert (=> tb!9813 (= result!20201 tp_is_empty!29539)))

(assert (=> b!1175530 t!37719))

(declare-fun b_and!40889 () Bool)

(assert (= b_and!40887 (and (=> t!37719 result!20201) b_and!40889)))

(declare-fun m!1083663 () Bool)

(assert (=> b!1175525 m!1083663))

(declare-fun m!1083665 () Bool)

(assert (=> b!1175525 m!1083665))

(assert (=> b!1175525 m!1083665))

(declare-fun m!1083667 () Bool)

(assert (=> b!1175525 m!1083667))

(declare-fun m!1083669 () Bool)

(assert (=> b!1175525 m!1083669))

(declare-fun m!1083671 () Bool)

(assert (=> b!1175529 m!1083671))

(declare-fun m!1083673 () Bool)

(assert (=> b!1175529 m!1083673))

(declare-fun m!1083675 () Bool)

(assert (=> b!1175529 m!1083675))

(declare-fun m!1083677 () Bool)

(assert (=> b!1175529 m!1083677))

(declare-fun m!1083679 () Bool)

(assert (=> b!1175529 m!1083679))

(declare-fun m!1083681 () Bool)

(assert (=> b!1175523 m!1083681))

(declare-fun m!1083683 () Bool)

(assert (=> b!1175517 m!1083683))

(declare-fun m!1083685 () Bool)

(assert (=> b!1175530 m!1083685))

(declare-fun m!1083687 () Bool)

(assert (=> b!1175530 m!1083687))

(declare-fun m!1083689 () Bool)

(assert (=> b!1175530 m!1083689))

(declare-fun m!1083691 () Bool)

(assert (=> b!1175530 m!1083691))

(declare-fun m!1083693 () Bool)

(assert (=> b!1175521 m!1083693))

(declare-fun m!1083695 () Bool)

(assert (=> b!1175521 m!1083695))

(declare-fun m!1083697 () Bool)

(assert (=> b!1175519 m!1083697))

(declare-fun m!1083699 () Bool)

(assert (=> b!1175524 m!1083699))

(declare-fun m!1083701 () Bool)

(assert (=> b!1175524 m!1083701))

(declare-fun m!1083703 () Bool)

(assert (=> b!1175524 m!1083703))

(declare-fun m!1083705 () Bool)

(assert (=> b!1175524 m!1083705))

(assert (=> b!1175524 m!1083663))

(declare-fun m!1083707 () Bool)

(assert (=> b!1175524 m!1083707))

(assert (=> b!1175524 m!1083663))

(declare-fun m!1083709 () Bool)

(assert (=> b!1175515 m!1083709))

(declare-fun m!1083711 () Bool)

(assert (=> b!1175514 m!1083711))

(declare-fun m!1083713 () Bool)

(assert (=> b!1175514 m!1083713))

(declare-fun m!1083715 () Bool)

(assert (=> mapNonEmpty!46136 m!1083715))

(declare-fun m!1083717 () Bool)

(assert (=> b!1175516 m!1083717))

(declare-fun m!1083719 () Bool)

(assert (=> b!1175527 m!1083719))

(declare-fun m!1083721 () Bool)

(assert (=> b!1175526 m!1083721))

(assert (=> b!1175520 m!1083663))

(declare-fun m!1083723 () Bool)

(assert (=> start!99666 m!1083723))

(declare-fun m!1083725 () Bool)

(assert (=> start!99666 m!1083725))

(check-sat (not b!1175515) (not b!1175524) (not b_lambda!20147) (not b!1175529) (not b!1175527) (not start!99666) (not b!1175516) (not b!1175530) (not b!1175521) (not b!1175525) b_and!40889 tp_is_empty!29539 (not b!1175514) (not b_next!25009) (not b!1175523) (not b!1175526) (not mapNonEmpty!46136) (not b!1175519))
(check-sat b_and!40889 (not b_next!25009))
