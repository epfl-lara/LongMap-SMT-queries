; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99822 () Bool)

(assert start!99822)

(declare-fun b_free!25165 () Bool)

(declare-fun b_next!25165 () Bool)

(assert (=> start!99822 (= b_free!25165 (not b_next!25165))))

(declare-fun tp!88209 () Bool)

(declare-fun b_and!41199 () Bool)

(assert (=> start!99822 (= tp!88209 b_and!41199)))

(declare-fun b!1180494 () Bool)

(declare-fun e!671226 () Bool)

(declare-fun e!671235 () Bool)

(assert (=> b!1180494 (= e!671226 e!671235)))

(declare-fun res!783933 () Bool)

(assert (=> b!1180494 (=> res!783933 e!671235)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1180494 (= res!783933 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44721 0))(
  ( (V!44722 (val!14904 Int)) )
))
(declare-fun zeroValue!944 () V!44721)

(declare-datatypes ((ValueCell!14138 0))(
  ( (ValueCellFull!14138 (v!17538 V!44721)) (EmptyCell!14138) )
))
(declare-datatypes ((array!76243 0))(
  ( (array!76244 (arr!36765 (Array (_ BitVec 32) ValueCell!14138)) (size!37302 (_ BitVec 32))) )
))
(declare-fun lt!533371 () array!76243)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!76245 0))(
  ( (array!76246 (arr!36766 (Array (_ BitVec 32) (_ BitVec 64))) (size!37303 (_ BitVec 32))) )
))
(declare-fun lt!533368 () array!76245)

(declare-fun minValue!944 () V!44721)

(declare-datatypes ((tuple2!19124 0))(
  ( (tuple2!19125 (_1!9573 (_ BitVec 64)) (_2!9573 V!44721)) )
))
(declare-datatypes ((List!25854 0))(
  ( (Nil!25851) (Cons!25850 (h!27068 tuple2!19124) (t!38003 List!25854)) )
))
(declare-datatypes ((ListLongMap!17101 0))(
  ( (ListLongMap!17102 (toList!8566 List!25854)) )
))
(declare-fun lt!533367 () ListLongMap!17101)

(declare-fun getCurrentListMapNoExtraKeys!5045 (array!76245 array!76243 (_ BitVec 32) (_ BitVec 32) V!44721 V!44721 (_ BitVec 32) Int) ListLongMap!17101)

(assert (=> b!1180494 (= lt!533367 (getCurrentListMapNoExtraKeys!5045 lt!533368 lt!533371 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!533370 () V!44721)

(declare-fun _values!996 () array!76243)

(assert (=> b!1180494 (= lt!533371 (array!76244 (store (arr!36765 _values!996) i!673 (ValueCellFull!14138 lt!533370)) (size!37302 _values!996)))))

(declare-fun dynLambda!3015 (Int (_ BitVec 64)) V!44721)

(assert (=> b!1180494 (= lt!533370 (dynLambda!3015 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76245)

(declare-fun lt!533363 () ListLongMap!17101)

(assert (=> b!1180494 (= lt!533363 (getCurrentListMapNoExtraKeys!5045 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1180495 () Bool)

(declare-fun res!783931 () Bool)

(declare-fun e!671230 () Bool)

(assert (=> b!1180495 (=> (not res!783931) (not e!671230))))

(assert (=> b!1180495 (= res!783931 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37303 _keys!1208))))))

(declare-fun b!1180496 () Bool)

(declare-fun e!671225 () Bool)

(assert (=> b!1180496 (= e!671225 true)))

(declare-fun e!671236 () Bool)

(assert (=> b!1180496 e!671236))

(declare-fun res!783935 () Bool)

(assert (=> b!1180496 (=> (not res!783935) (not e!671236))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1180496 (= res!783935 (not (= (select (arr!36766 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!38964 0))(
  ( (Unit!38965) )
))
(declare-fun lt!533375 () Unit!38964)

(declare-fun e!671229 () Unit!38964)

(assert (=> b!1180496 (= lt!533375 e!671229)))

(declare-fun c!117269 () Bool)

(assert (=> b!1180496 (= c!117269 (= (select (arr!36766 _keys!1208) from!1455) k0!934))))

(declare-fun e!671237 () Bool)

(assert (=> b!1180496 e!671237))

(declare-fun res!783928 () Bool)

(assert (=> b!1180496 (=> (not res!783928) (not e!671237))))

(declare-fun lt!533376 () ListLongMap!17101)

(declare-fun lt!533374 () tuple2!19124)

(declare-fun +!3891 (ListLongMap!17101 tuple2!19124) ListLongMap!17101)

(assert (=> b!1180496 (= res!783928 (= lt!533367 (+!3891 lt!533376 lt!533374)))))

(declare-fun get!18828 (ValueCell!14138 V!44721) V!44721)

(assert (=> b!1180496 (= lt!533374 (tuple2!19125 (select (arr!36766 _keys!1208) from!1455) (get!18828 (select (arr!36765 _values!996) from!1455) lt!533370)))))

(declare-fun b!1180497 () Bool)

(assert (=> b!1180497 (= e!671235 e!671225)))

(declare-fun res!783929 () Bool)

(assert (=> b!1180497 (=> res!783929 e!671225)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180497 (= res!783929 (not (validKeyInArray!0 (select (arr!36766 _keys!1208) from!1455))))))

(declare-fun lt!533372 () ListLongMap!17101)

(assert (=> b!1180497 (= lt!533372 lt!533376)))

(declare-fun lt!533377 () ListLongMap!17101)

(declare-fun -!1596 (ListLongMap!17101 (_ BitVec 64)) ListLongMap!17101)

(assert (=> b!1180497 (= lt!533376 (-!1596 lt!533377 k0!934))))

(assert (=> b!1180497 (= lt!533372 (getCurrentListMapNoExtraKeys!5045 lt!533368 lt!533371 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180497 (= lt!533377 (getCurrentListMapNoExtraKeys!5045 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533366 () Unit!38964)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!821 (array!76245 array!76243 (_ BitVec 32) (_ BitVec 32) V!44721 V!44721 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38964)

(assert (=> b!1180497 (= lt!533366 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!821 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1180498 () Bool)

(declare-fun e!671233 () Bool)

(assert (=> b!1180498 (= e!671230 e!671233)))

(declare-fun res!783937 () Bool)

(assert (=> b!1180498 (=> (not res!783937) (not e!671233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76245 (_ BitVec 32)) Bool)

(assert (=> b!1180498 (= res!783937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533368 mask!1564))))

(assert (=> b!1180498 (= lt!533368 (array!76246 (store (arr!36766 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37303 _keys!1208)))))

(declare-fun b!1180499 () Bool)

(declare-fun Unit!38966 () Unit!38964)

(assert (=> b!1180499 (= e!671229 Unit!38966)))

(declare-fun b!1180500 () Bool)

(declare-fun Unit!38967 () Unit!38964)

(assert (=> b!1180500 (= e!671229 Unit!38967)))

(declare-fun lt!533365 () Unit!38964)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76245 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38964)

(assert (=> b!1180500 (= lt!533365 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180500 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533369 () Unit!38964)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76245 (_ BitVec 32) (_ BitVec 32)) Unit!38964)

(assert (=> b!1180500 (= lt!533369 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25855 0))(
  ( (Nil!25852) (Cons!25851 (h!27069 (_ BitVec 64)) (t!38004 List!25855)) )
))
(declare-fun arrayNoDuplicates!0 (array!76245 (_ BitVec 32) List!25855) Bool)

(assert (=> b!1180500 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25852)))

(declare-fun lt!533373 () Unit!38964)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76245 (_ BitVec 64) (_ BitVec 32) List!25855) Unit!38964)

(assert (=> b!1180500 (= lt!533373 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25852))))

(assert (=> b!1180500 false))

(declare-fun res!783941 () Bool)

(assert (=> start!99822 (=> (not res!783941) (not e!671230))))

(assert (=> start!99822 (= res!783941 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37303 _keys!1208))))))

(assert (=> start!99822 e!671230))

(declare-fun tp_is_empty!29695 () Bool)

(assert (=> start!99822 tp_is_empty!29695))

(declare-fun array_inv!28150 (array!76245) Bool)

(assert (=> start!99822 (array_inv!28150 _keys!1208)))

(assert (=> start!99822 true))

(assert (=> start!99822 tp!88209))

(declare-fun e!671232 () Bool)

(declare-fun array_inv!28151 (array!76243) Bool)

(assert (=> start!99822 (and (array_inv!28151 _values!996) e!671232)))

(declare-fun b!1180501 () Bool)

(declare-fun res!783938 () Bool)

(assert (=> b!1180501 (=> (not res!783938) (not e!671230))))

(assert (=> b!1180501 (= res!783938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180502 () Bool)

(declare-fun e!671234 () Bool)

(assert (=> b!1180502 (= e!671234 tp_is_empty!29695)))

(declare-fun b!1180503 () Bool)

(declare-fun e!671228 () Bool)

(assert (=> b!1180503 (= e!671237 e!671228)))

(declare-fun res!783926 () Bool)

(assert (=> b!1180503 (=> res!783926 e!671228)))

(assert (=> b!1180503 (= res!783926 (not (= (select (arr!36766 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1180504 () Bool)

(declare-fun res!783939 () Bool)

(assert (=> b!1180504 (=> (not res!783939) (not e!671230))))

(assert (=> b!1180504 (= res!783939 (and (= (size!37302 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37303 _keys!1208) (size!37302 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46370 () Bool)

(declare-fun mapRes!46370 () Bool)

(declare-fun tp!88208 () Bool)

(assert (=> mapNonEmpty!46370 (= mapRes!46370 (and tp!88208 e!671234))))

(declare-fun mapRest!46370 () (Array (_ BitVec 32) ValueCell!14138))

(declare-fun mapKey!46370 () (_ BitVec 32))

(declare-fun mapValue!46370 () ValueCell!14138)

(assert (=> mapNonEmpty!46370 (= (arr!36765 _values!996) (store mapRest!46370 mapKey!46370 mapValue!46370))))

(declare-fun mapIsEmpty!46370 () Bool)

(assert (=> mapIsEmpty!46370 mapRes!46370))

(declare-fun b!1180505 () Bool)

(declare-fun res!783936 () Bool)

(assert (=> b!1180505 (=> (not res!783936) (not e!671230))))

(assert (=> b!1180505 (= res!783936 (validKeyInArray!0 k0!934))))

(declare-fun b!1180506 () Bool)

(declare-fun res!783932 () Bool)

(assert (=> b!1180506 (=> (not res!783932) (not e!671230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180506 (= res!783932 (validMask!0 mask!1564))))

(declare-fun b!1180507 () Bool)

(assert (=> b!1180507 (= e!671233 (not e!671226))))

(declare-fun res!783934 () Bool)

(assert (=> b!1180507 (=> res!783934 e!671226)))

(assert (=> b!1180507 (= res!783934 (bvsgt from!1455 i!673))))

(assert (=> b!1180507 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!533364 () Unit!38964)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76245 (_ BitVec 64) (_ BitVec 32)) Unit!38964)

(assert (=> b!1180507 (= lt!533364 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180508 () Bool)

(declare-fun e!671227 () Bool)

(assert (=> b!1180508 (= e!671232 (and e!671227 mapRes!46370))))

(declare-fun condMapEmpty!46370 () Bool)

(declare-fun mapDefault!46370 () ValueCell!14138)

(assert (=> b!1180508 (= condMapEmpty!46370 (= (arr!36765 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14138)) mapDefault!46370)))))

(declare-fun b!1180509 () Bool)

(declare-fun res!783940 () Bool)

(assert (=> b!1180509 (=> (not res!783940) (not e!671230))))

(assert (=> b!1180509 (= res!783940 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25852))))

(declare-fun b!1180510 () Bool)

(declare-fun res!783930 () Bool)

(assert (=> b!1180510 (=> (not res!783930) (not e!671233))))

(assert (=> b!1180510 (= res!783930 (arrayNoDuplicates!0 lt!533368 #b00000000000000000000000000000000 Nil!25852))))

(declare-fun b!1180511 () Bool)

(declare-fun res!783927 () Bool)

(assert (=> b!1180511 (=> (not res!783927) (not e!671230))))

(assert (=> b!1180511 (= res!783927 (= (select (arr!36766 _keys!1208) i!673) k0!934))))

(declare-fun b!1180512 () Bool)

(assert (=> b!1180512 (= e!671228 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180513 () Bool)

(assert (=> b!1180513 (= e!671236 (= lt!533363 (+!3891 lt!533377 lt!533374)))))

(declare-fun b!1180514 () Bool)

(assert (=> b!1180514 (= e!671227 tp_is_empty!29695)))

(assert (= (and start!99822 res!783941) b!1180506))

(assert (= (and b!1180506 res!783932) b!1180504))

(assert (= (and b!1180504 res!783939) b!1180501))

(assert (= (and b!1180501 res!783938) b!1180509))

(assert (= (and b!1180509 res!783940) b!1180495))

(assert (= (and b!1180495 res!783931) b!1180505))

(assert (= (and b!1180505 res!783936) b!1180511))

(assert (= (and b!1180511 res!783927) b!1180498))

(assert (= (and b!1180498 res!783937) b!1180510))

(assert (= (and b!1180510 res!783930) b!1180507))

(assert (= (and b!1180507 (not res!783934)) b!1180494))

(assert (= (and b!1180494 (not res!783933)) b!1180497))

(assert (= (and b!1180497 (not res!783929)) b!1180496))

(assert (= (and b!1180496 res!783928) b!1180503))

(assert (= (and b!1180503 (not res!783926)) b!1180512))

(assert (= (and b!1180496 c!117269) b!1180500))

(assert (= (and b!1180496 (not c!117269)) b!1180499))

(assert (= (and b!1180496 res!783935) b!1180513))

(assert (= (and b!1180508 condMapEmpty!46370) mapIsEmpty!46370))

(assert (= (and b!1180508 (not condMapEmpty!46370)) mapNonEmpty!46370))

(get-info :version)

(assert (= (and mapNonEmpty!46370 ((_ is ValueCellFull!14138) mapValue!46370)) b!1180502))

(assert (= (and b!1180508 ((_ is ValueCellFull!14138) mapDefault!46370)) b!1180514))

(assert (= start!99822 b!1180508))

(declare-fun b_lambda!20303 () Bool)

(assert (=> (not b_lambda!20303) (not b!1180494)))

(declare-fun t!38002 () Bool)

(declare-fun tb!9969 () Bool)

(assert (=> (and start!99822 (= defaultEntry!1004 defaultEntry!1004) t!38002) tb!9969))

(declare-fun result!20513 () Bool)

(assert (=> tb!9969 (= result!20513 tp_is_empty!29695)))

(assert (=> b!1180494 t!38002))

(declare-fun b_and!41201 () Bool)

(assert (= b_and!41199 (and (=> t!38002 result!20513) b_and!41201)))

(declare-fun m!1088751 () Bool)

(assert (=> b!1180513 m!1088751))

(declare-fun m!1088753 () Bool)

(assert (=> mapNonEmpty!46370 m!1088753))

(declare-fun m!1088755 () Bool)

(assert (=> b!1180509 m!1088755))

(declare-fun m!1088757 () Bool)

(assert (=> b!1180511 m!1088757))

(declare-fun m!1088759 () Bool)

(assert (=> b!1180512 m!1088759))

(declare-fun m!1088761 () Bool)

(assert (=> b!1180496 m!1088761))

(declare-fun m!1088763 () Bool)

(assert (=> b!1180496 m!1088763))

(declare-fun m!1088765 () Bool)

(assert (=> b!1180496 m!1088765))

(assert (=> b!1180496 m!1088765))

(declare-fun m!1088767 () Bool)

(assert (=> b!1180496 m!1088767))

(declare-fun m!1088769 () Bool)

(assert (=> start!99822 m!1088769))

(declare-fun m!1088771 () Bool)

(assert (=> start!99822 m!1088771))

(declare-fun m!1088773 () Bool)

(assert (=> b!1180494 m!1088773))

(declare-fun m!1088775 () Bool)

(assert (=> b!1180494 m!1088775))

(declare-fun m!1088777 () Bool)

(assert (=> b!1180494 m!1088777))

(declare-fun m!1088779 () Bool)

(assert (=> b!1180494 m!1088779))

(assert (=> b!1180503 m!1088761))

(declare-fun m!1088781 () Bool)

(assert (=> b!1180510 m!1088781))

(declare-fun m!1088783 () Bool)

(assert (=> b!1180500 m!1088783))

(declare-fun m!1088785 () Bool)

(assert (=> b!1180500 m!1088785))

(declare-fun m!1088787 () Bool)

(assert (=> b!1180500 m!1088787))

(declare-fun m!1088789 () Bool)

(assert (=> b!1180500 m!1088789))

(declare-fun m!1088791 () Bool)

(assert (=> b!1180500 m!1088791))

(declare-fun m!1088793 () Bool)

(assert (=> b!1180507 m!1088793))

(declare-fun m!1088795 () Bool)

(assert (=> b!1180507 m!1088795))

(declare-fun m!1088797 () Bool)

(assert (=> b!1180501 m!1088797))

(declare-fun m!1088799 () Bool)

(assert (=> b!1180505 m!1088799))

(declare-fun m!1088801 () Bool)

(assert (=> b!1180498 m!1088801))

(declare-fun m!1088803 () Bool)

(assert (=> b!1180498 m!1088803))

(declare-fun m!1088805 () Bool)

(assert (=> b!1180506 m!1088805))

(declare-fun m!1088807 () Bool)

(assert (=> b!1180497 m!1088807))

(declare-fun m!1088809 () Bool)

(assert (=> b!1180497 m!1088809))

(declare-fun m!1088811 () Bool)

(assert (=> b!1180497 m!1088811))

(assert (=> b!1180497 m!1088761))

(declare-fun m!1088813 () Bool)

(assert (=> b!1180497 m!1088813))

(assert (=> b!1180497 m!1088761))

(declare-fun m!1088815 () Bool)

(assert (=> b!1180497 m!1088815))

(check-sat (not b!1180497) (not b!1180507) (not b!1180506) (not b!1180494) (not b!1180505) (not mapNonEmpty!46370) (not b_next!25165) (not b!1180509) b_and!41201 (not b_lambda!20303) (not b!1180500) (not b!1180513) (not b!1180510) (not start!99822) (not b!1180512) (not b!1180501) (not b!1180496) (not b!1180498) tp_is_empty!29695)
(check-sat b_and!41201 (not b_next!25165))
