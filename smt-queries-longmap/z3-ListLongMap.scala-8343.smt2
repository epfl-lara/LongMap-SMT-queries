; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101778 () Bool)

(assert start!101778)

(declare-fun b_free!26329 () Bool)

(declare-fun b_next!26329 () Bool)

(assert (=> start!101778 (= b_free!26329 (not b_next!26329))))

(declare-fun tp!92024 () Bool)

(declare-fun b_and!43867 () Bool)

(assert (=> start!101778 (= tp!92024 b_and!43867)))

(declare-fun b!1222344 () Bool)

(declare-fun e!694223 () Bool)

(declare-fun e!694225 () Bool)

(assert (=> b!1222344 (= e!694223 e!694225)))

(declare-fun res!811693 () Bool)

(assert (=> b!1222344 (=> (not res!811693) (not e!694225))))

(declare-datatypes ((array!78883 0))(
  ( (array!78884 (arr!38065 (Array (_ BitVec 32) (_ BitVec 64))) (size!38602 (_ BitVec 32))) )
))
(declare-fun lt!555860 () array!78883)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78883 (_ BitVec 32)) Bool)

(assert (=> b!1222344 (= res!811693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555860 mask!1564))))

(declare-fun _keys!1208 () array!78883)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1222344 (= lt!555860 (array!78884 (store (arr!38065 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38602 _keys!1208)))))

(declare-fun b!1222345 () Bool)

(declare-fun e!694228 () Bool)

(declare-fun e!694220 () Bool)

(assert (=> b!1222345 (= e!694228 e!694220)))

(declare-fun res!811703 () Bool)

(assert (=> b!1222345 (=> res!811703 e!694220)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1222345 (= res!811703 (not (= (select (arr!38065 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1222346 () Bool)

(declare-fun e!694219 () Bool)

(declare-datatypes ((List!26876 0))(
  ( (Nil!26873) (Cons!26872 (h!28090 (_ BitVec 64)) (t!40177 List!26876)) )
))
(declare-fun noDuplicate!1647 (List!26876) Bool)

(assert (=> b!1222346 (= e!694219 (noDuplicate!1647 Nil!26873))))

(declare-fun b!1222347 () Bool)

(declare-fun res!811695 () Bool)

(assert (=> b!1222347 (=> (not res!811695) (not e!694223))))

(assert (=> b!1222347 (= res!811695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48439 () Bool)

(declare-fun mapRes!48439 () Bool)

(declare-fun tp!92023 () Bool)

(declare-fun e!694218 () Bool)

(assert (=> mapNonEmpty!48439 (= mapRes!48439 (and tp!92023 e!694218))))

(declare-fun mapKey!48439 () (_ BitVec 32))

(declare-datatypes ((V!46505 0))(
  ( (V!46506 (val!15573 Int)) )
))
(declare-datatypes ((ValueCell!14807 0))(
  ( (ValueCellFull!14807 (v!18227 V!46505)) (EmptyCell!14807) )
))
(declare-fun mapValue!48439 () ValueCell!14807)

(declare-fun mapRest!48439 () (Array (_ BitVec 32) ValueCell!14807))

(declare-datatypes ((array!78885 0))(
  ( (array!78886 (arr!38066 (Array (_ BitVec 32) ValueCell!14807)) (size!38603 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78885)

(assert (=> mapNonEmpty!48439 (= (arr!38066 _values!996) (store mapRest!48439 mapKey!48439 mapValue!48439))))

(declare-fun b!1222348 () Bool)

(declare-fun res!811690 () Bool)

(assert (=> b!1222348 (=> (not res!811690) (not e!694223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222348 (= res!811690 (validKeyInArray!0 k0!934))))

(declare-fun b!1222349 () Bool)

(declare-fun e!694226 () Bool)

(assert (=> b!1222349 (= e!694226 e!694219)))

(declare-fun res!811688 () Bool)

(assert (=> b!1222349 (=> res!811688 e!694219)))

(assert (=> b!1222349 (= res!811688 (or (bvsge (size!38602 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38602 _keys!1208)) (bvsge from!1455 (size!38602 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!78883 (_ BitVec 32) List!26876) Bool)

(assert (=> b!1222349 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26873)))

(declare-datatypes ((Unit!40432 0))(
  ( (Unit!40433) )
))
(declare-fun lt!555858 () Unit!40432)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78883 (_ BitVec 32) (_ BitVec 32)) Unit!40432)

(assert (=> b!1222349 (= lt!555858 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!78883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222349 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555867 () Unit!40432)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78883 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40432)

(assert (=> b!1222349 (= lt!555867 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1222350 () Bool)

(declare-fun tp_is_empty!31033 () Bool)

(assert (=> b!1222350 (= e!694218 tp_is_empty!31033)))

(declare-fun b!1222351 () Bool)

(declare-fun res!811702 () Bool)

(assert (=> b!1222351 (=> (not res!811702) (not e!694223))))

(assert (=> b!1222351 (= res!811702 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38602 _keys!1208))))))

(declare-fun b!1222352 () Bool)

(declare-fun e!694216 () Bool)

(assert (=> b!1222352 (= e!694225 (not e!694216))))

(declare-fun res!811692 () Bool)

(assert (=> b!1222352 (=> res!811692 e!694216)))

(assert (=> b!1222352 (= res!811692 (bvsgt from!1455 i!673))))

(assert (=> b!1222352 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555859 () Unit!40432)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78883 (_ BitVec 64) (_ BitVec 32)) Unit!40432)

(assert (=> b!1222352 (= lt!555859 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222353 () Bool)

(declare-fun res!811698 () Bool)

(assert (=> b!1222353 (=> (not res!811698) (not e!694223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222353 (= res!811698 (validMask!0 mask!1564))))

(declare-fun b!1222354 () Bool)

(declare-fun res!811699 () Bool)

(assert (=> b!1222354 (=> (not res!811699) (not e!694223))))

(assert (=> b!1222354 (= res!811699 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26873))))

(declare-fun b!1222355 () Bool)

(declare-fun e!694224 () Bool)

(declare-fun e!694221 () Bool)

(assert (=> b!1222355 (= e!694224 e!694221)))

(declare-fun res!811700 () Bool)

(assert (=> b!1222355 (=> res!811700 e!694221)))

(assert (=> b!1222355 (= res!811700 (not (validKeyInArray!0 (select (arr!38065 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20066 0))(
  ( (tuple2!20067 (_1!10044 (_ BitVec 64)) (_2!10044 V!46505)) )
))
(declare-datatypes ((List!26877 0))(
  ( (Nil!26874) (Cons!26873 (h!28091 tuple2!20066) (t!40178 List!26877)) )
))
(declare-datatypes ((ListLongMap!18043 0))(
  ( (ListLongMap!18044 (toList!9037 List!26877)) )
))
(declare-fun lt!555863 () ListLongMap!18043)

(declare-fun lt!555864 () ListLongMap!18043)

(assert (=> b!1222355 (= lt!555863 lt!555864)))

(declare-fun lt!555856 () ListLongMap!18043)

(declare-fun -!1921 (ListLongMap!18043 (_ BitVec 64)) ListLongMap!18043)

(assert (=> b!1222355 (= lt!555864 (-!1921 lt!555856 k0!934))))

(declare-fun zeroValue!944 () V!46505)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!555865 () array!78885)

(declare-fun minValue!944 () V!46505)

(declare-fun getCurrentListMapNoExtraKeys!5492 (array!78883 array!78885 (_ BitVec 32) (_ BitVec 32) V!46505 V!46505 (_ BitVec 32) Int) ListLongMap!18043)

(assert (=> b!1222355 (= lt!555863 (getCurrentListMapNoExtraKeys!5492 lt!555860 lt!555865 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222355 (= lt!555856 (getCurrentListMapNoExtraKeys!5492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!555857 () Unit!40432)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1136 (array!78883 array!78885 (_ BitVec 32) (_ BitVec 32) V!46505 V!46505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40432)

(assert (=> b!1222355 (= lt!555857 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1136 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222356 () Bool)

(declare-fun res!811694 () Bool)

(assert (=> b!1222356 (=> (not res!811694) (not e!694225))))

(assert (=> b!1222356 (= res!811694 (arrayNoDuplicates!0 lt!555860 #b00000000000000000000000000000000 Nil!26873))))

(declare-fun b!1222357 () Bool)

(assert (=> b!1222357 (= e!694221 e!694226)))

(declare-fun res!811687 () Bool)

(assert (=> b!1222357 (=> res!811687 e!694226)))

(assert (=> b!1222357 (= res!811687 (not (= (select (arr!38065 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1222357 e!694228))

(declare-fun res!811689 () Bool)

(assert (=> b!1222357 (=> (not res!811689) (not e!694228))))

(declare-fun lt!555866 () V!46505)

(declare-fun lt!555862 () ListLongMap!18043)

(declare-fun +!4142 (ListLongMap!18043 tuple2!20066) ListLongMap!18043)

(declare-fun get!19466 (ValueCell!14807 V!46505) V!46505)

(assert (=> b!1222357 (= res!811689 (= lt!555862 (+!4142 lt!555864 (tuple2!20067 (select (arr!38065 _keys!1208) from!1455) (get!19466 (select (arr!38066 _values!996) from!1455) lt!555866)))))))

(declare-fun b!1222358 () Bool)

(declare-fun res!811697 () Bool)

(assert (=> b!1222358 (=> (not res!811697) (not e!694223))))

(assert (=> b!1222358 (= res!811697 (= (select (arr!38065 _keys!1208) i!673) k0!934))))

(declare-fun b!1222359 () Bool)

(declare-fun e!694217 () Bool)

(assert (=> b!1222359 (= e!694217 tp_is_empty!31033)))

(declare-fun res!811696 () Bool)

(assert (=> start!101778 (=> (not res!811696) (not e!694223))))

(assert (=> start!101778 (= res!811696 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38602 _keys!1208))))))

(assert (=> start!101778 e!694223))

(assert (=> start!101778 tp_is_empty!31033))

(declare-fun array_inv!29044 (array!78883) Bool)

(assert (=> start!101778 (array_inv!29044 _keys!1208)))

(assert (=> start!101778 true))

(assert (=> start!101778 tp!92024))

(declare-fun e!694227 () Bool)

(declare-fun array_inv!29045 (array!78885) Bool)

(assert (=> start!101778 (and (array_inv!29045 _values!996) e!694227)))

(declare-fun mapIsEmpty!48439 () Bool)

(assert (=> mapIsEmpty!48439 mapRes!48439))

(declare-fun b!1222360 () Bool)

(assert (=> b!1222360 (= e!694216 e!694224)))

(declare-fun res!811691 () Bool)

(assert (=> b!1222360 (=> res!811691 e!694224)))

(assert (=> b!1222360 (= res!811691 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1222360 (= lt!555862 (getCurrentListMapNoExtraKeys!5492 lt!555860 lt!555865 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1222360 (= lt!555865 (array!78886 (store (arr!38066 _values!996) i!673 (ValueCellFull!14807 lt!555866)) (size!38603 _values!996)))))

(declare-fun dynLambda!3393 (Int (_ BitVec 64)) V!46505)

(assert (=> b!1222360 (= lt!555866 (dynLambda!3393 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555861 () ListLongMap!18043)

(assert (=> b!1222360 (= lt!555861 (getCurrentListMapNoExtraKeys!5492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222361 () Bool)

(declare-fun res!811701 () Bool)

(assert (=> b!1222361 (=> (not res!811701) (not e!694223))))

(assert (=> b!1222361 (= res!811701 (and (= (size!38603 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38602 _keys!1208) (size!38603 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1222362 () Bool)

(assert (=> b!1222362 (= e!694227 (and e!694217 mapRes!48439))))

(declare-fun condMapEmpty!48439 () Bool)

(declare-fun mapDefault!48439 () ValueCell!14807)

(assert (=> b!1222362 (= condMapEmpty!48439 (= (arr!38066 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14807)) mapDefault!48439)))))

(declare-fun b!1222363 () Bool)

(assert (=> b!1222363 (= e!694220 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!101778 res!811696) b!1222353))

(assert (= (and b!1222353 res!811698) b!1222361))

(assert (= (and b!1222361 res!811701) b!1222347))

(assert (= (and b!1222347 res!811695) b!1222354))

(assert (= (and b!1222354 res!811699) b!1222351))

(assert (= (and b!1222351 res!811702) b!1222348))

(assert (= (and b!1222348 res!811690) b!1222358))

(assert (= (and b!1222358 res!811697) b!1222344))

(assert (= (and b!1222344 res!811693) b!1222356))

(assert (= (and b!1222356 res!811694) b!1222352))

(assert (= (and b!1222352 (not res!811692)) b!1222360))

(assert (= (and b!1222360 (not res!811691)) b!1222355))

(assert (= (and b!1222355 (not res!811700)) b!1222357))

(assert (= (and b!1222357 res!811689) b!1222345))

(assert (= (and b!1222345 (not res!811703)) b!1222363))

(assert (= (and b!1222357 (not res!811687)) b!1222349))

(assert (= (and b!1222349 (not res!811688)) b!1222346))

(assert (= (and b!1222362 condMapEmpty!48439) mapIsEmpty!48439))

(assert (= (and b!1222362 (not condMapEmpty!48439)) mapNonEmpty!48439))

(get-info :version)

(assert (= (and mapNonEmpty!48439 ((_ is ValueCellFull!14807) mapValue!48439)) b!1222350))

(assert (= (and b!1222362 ((_ is ValueCellFull!14807) mapDefault!48439)) b!1222359))

(assert (= start!101778 b!1222362))

(declare-fun b_lambda!22189 () Bool)

(assert (=> (not b_lambda!22189) (not b!1222360)))

(declare-fun t!40176 () Bool)

(declare-fun tb!11121 () Bool)

(assert (=> (and start!101778 (= defaultEntry!1004 defaultEntry!1004) t!40176) tb!11121))

(declare-fun result!22857 () Bool)

(assert (=> tb!11121 (= result!22857 tp_is_empty!31033)))

(assert (=> b!1222360 t!40176))

(declare-fun b_and!43869 () Bool)

(assert (= b_and!43867 (and (=> t!40176 result!22857) b_and!43869)))

(declare-fun m!1127493 () Bool)

(assert (=> b!1222356 m!1127493))

(declare-fun m!1127495 () Bool)

(assert (=> b!1222344 m!1127495))

(declare-fun m!1127497 () Bool)

(assert (=> b!1222344 m!1127497))

(declare-fun m!1127499 () Bool)

(assert (=> b!1222357 m!1127499))

(declare-fun m!1127501 () Bool)

(assert (=> b!1222357 m!1127501))

(assert (=> b!1222357 m!1127501))

(declare-fun m!1127503 () Bool)

(assert (=> b!1222357 m!1127503))

(declare-fun m!1127505 () Bool)

(assert (=> b!1222357 m!1127505))

(declare-fun m!1127507 () Bool)

(assert (=> mapNonEmpty!48439 m!1127507))

(declare-fun m!1127509 () Bool)

(assert (=> b!1222354 m!1127509))

(declare-fun m!1127511 () Bool)

(assert (=> b!1222360 m!1127511))

(declare-fun m!1127513 () Bool)

(assert (=> b!1222360 m!1127513))

(declare-fun m!1127515 () Bool)

(assert (=> b!1222360 m!1127515))

(declare-fun m!1127517 () Bool)

(assert (=> b!1222360 m!1127517))

(declare-fun m!1127519 () Bool)

(assert (=> b!1222347 m!1127519))

(declare-fun m!1127521 () Bool)

(assert (=> b!1222348 m!1127521))

(declare-fun m!1127523 () Bool)

(assert (=> b!1222355 m!1127523))

(declare-fun m!1127525 () Bool)

(assert (=> b!1222355 m!1127525))

(declare-fun m!1127527 () Bool)

(assert (=> b!1222355 m!1127527))

(assert (=> b!1222355 m!1127499))

(declare-fun m!1127529 () Bool)

(assert (=> b!1222355 m!1127529))

(declare-fun m!1127531 () Bool)

(assert (=> b!1222355 m!1127531))

(assert (=> b!1222355 m!1127499))

(declare-fun m!1127533 () Bool)

(assert (=> b!1222358 m!1127533))

(declare-fun m!1127535 () Bool)

(assert (=> b!1222346 m!1127535))

(declare-fun m!1127537 () Bool)

(assert (=> b!1222363 m!1127537))

(declare-fun m!1127539 () Bool)

(assert (=> b!1222349 m!1127539))

(declare-fun m!1127541 () Bool)

(assert (=> b!1222349 m!1127541))

(declare-fun m!1127543 () Bool)

(assert (=> b!1222349 m!1127543))

(declare-fun m!1127545 () Bool)

(assert (=> b!1222349 m!1127545))

(declare-fun m!1127547 () Bool)

(assert (=> b!1222353 m!1127547))

(declare-fun m!1127549 () Bool)

(assert (=> start!101778 m!1127549))

(declare-fun m!1127551 () Bool)

(assert (=> start!101778 m!1127551))

(assert (=> b!1222345 m!1127499))

(declare-fun m!1127553 () Bool)

(assert (=> b!1222352 m!1127553))

(declare-fun m!1127555 () Bool)

(assert (=> b!1222352 m!1127555))

(check-sat (not b!1222353) (not b!1222360) (not b!1222348) (not b!1222352) (not b_lambda!22189) (not b!1222344) (not start!101778) b_and!43869 (not b!1222346) tp_is_empty!31033 (not b!1222355) (not b!1222356) (not b!1222357) (not mapNonEmpty!48439) (not b!1222349) (not b!1222347) (not b!1222354) (not b_next!26329) (not b!1222363))
(check-sat b_and!43869 (not b_next!26329))
(get-model)

(declare-fun b_lambda!22195 () Bool)

(assert (= b_lambda!22189 (or (and start!101778 b_free!26329) b_lambda!22195)))

(check-sat (not b!1222353) (not b!1222360) (not b!1222348) (not b!1222352) (not b!1222344) (not start!101778) b_and!43869 (not b!1222346) tp_is_empty!31033 (not b!1222355) (not b_lambda!22195) (not b!1222356) (not b!1222357) (not mapNonEmpty!48439) (not b!1222349) (not b!1222347) (not b!1222354) (not b_next!26329) (not b!1222363))
(check-sat b_and!43869 (not b_next!26329))
(get-model)

(declare-fun b!1222500 () Bool)

(declare-fun e!694317 () Bool)

(declare-fun contains!7055 (List!26876 (_ BitVec 64)) Bool)

(assert (=> b!1222500 (= e!694317 (contains!7055 Nil!26873 (select (arr!38065 _keys!1208) from!1455)))))

(declare-fun b!1222501 () Bool)

(declare-fun e!694315 () Bool)

(declare-fun call!60775 () Bool)

(assert (=> b!1222501 (= e!694315 call!60775)))

(declare-fun b!1222502 () Bool)

(assert (=> b!1222502 (= e!694315 call!60775)))

(declare-fun b!1222503 () Bool)

(declare-fun e!694318 () Bool)

(declare-fun e!694316 () Bool)

(assert (=> b!1222503 (= e!694318 e!694316)))

(declare-fun res!811812 () Bool)

(assert (=> b!1222503 (=> (not res!811812) (not e!694316))))

(assert (=> b!1222503 (= res!811812 (not e!694317))))

(declare-fun res!811813 () Bool)

(assert (=> b!1222503 (=> (not res!811813) (not e!694317))))

(assert (=> b!1222503 (= res!811813 (validKeyInArray!0 (select (arr!38065 _keys!1208) from!1455)))))

(declare-fun b!1222504 () Bool)

(assert (=> b!1222504 (= e!694316 e!694315)))

(declare-fun c!120640 () Bool)

(assert (=> b!1222504 (= c!120640 (validKeyInArray!0 (select (arr!38065 _keys!1208) from!1455)))))

(declare-fun bm!60772 () Bool)

(assert (=> bm!60772 (= call!60775 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!120640 (Cons!26872 (select (arr!38065 _keys!1208) from!1455) Nil!26873) Nil!26873)))))

(declare-fun d!134237 () Bool)

(declare-fun res!811814 () Bool)

(assert (=> d!134237 (=> res!811814 e!694318)))

(assert (=> d!134237 (= res!811814 (bvsge from!1455 (size!38602 _keys!1208)))))

(assert (=> d!134237 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26873) e!694318)))

(assert (= (and d!134237 (not res!811814)) b!1222503))

(assert (= (and b!1222503 res!811813) b!1222500))

(assert (= (and b!1222503 res!811812) b!1222504))

(assert (= (and b!1222504 c!120640) b!1222502))

(assert (= (and b!1222504 (not c!120640)) b!1222501))

(assert (= (or b!1222502 b!1222501) bm!60772))

(assert (=> b!1222500 m!1127499))

(assert (=> b!1222500 m!1127499))

(declare-fun m!1127685 () Bool)

(assert (=> b!1222500 m!1127685))

(assert (=> b!1222503 m!1127499))

(assert (=> b!1222503 m!1127499))

(assert (=> b!1222503 m!1127529))

(assert (=> b!1222504 m!1127499))

(assert (=> b!1222504 m!1127499))

(assert (=> b!1222504 m!1127529))

(assert (=> bm!60772 m!1127499))

(declare-fun m!1127687 () Bool)

(assert (=> bm!60772 m!1127687))

(assert (=> b!1222349 d!134237))

(declare-fun d!134239 () Bool)

(assert (=> d!134239 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26873)))

(declare-fun lt!555942 () Unit!40432)

(declare-fun choose!39 (array!78883 (_ BitVec 32) (_ BitVec 32)) Unit!40432)

(assert (=> d!134239 (= lt!555942 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!134239 (bvslt (size!38602 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!134239 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!555942)))

(declare-fun bs!34394 () Bool)

(assert (= bs!34394 d!134239))

(assert (=> bs!34394 m!1127539))

(declare-fun m!1127689 () Bool)

(assert (=> bs!34394 m!1127689))

(assert (=> b!1222349 d!134239))

(declare-fun d!134241 () Bool)

(declare-fun res!811819 () Bool)

(declare-fun e!694323 () Bool)

(assert (=> d!134241 (=> res!811819 e!694323)))

(assert (=> d!134241 (= res!811819 (= (select (arr!38065 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!134241 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!694323)))

(declare-fun b!1222509 () Bool)

(declare-fun e!694324 () Bool)

(assert (=> b!1222509 (= e!694323 e!694324)))

(declare-fun res!811820 () Bool)

(assert (=> b!1222509 (=> (not res!811820) (not e!694324))))

(assert (=> b!1222509 (= res!811820 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38602 _keys!1208)))))

(declare-fun b!1222510 () Bool)

(assert (=> b!1222510 (= e!694324 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!134241 (not res!811819)) b!1222509))

(assert (= (and b!1222509 res!811820) b!1222510))

(declare-fun m!1127691 () Bool)

(assert (=> d!134241 m!1127691))

(declare-fun m!1127693 () Bool)

(assert (=> b!1222510 m!1127693))

(assert (=> b!1222349 d!134241))

(declare-fun d!134243 () Bool)

(assert (=> d!134243 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555945 () Unit!40432)

(declare-fun choose!114 (array!78883 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40432)

(assert (=> d!134243 (= lt!555945 (choose!114 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> d!134243 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!134243 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)) lt!555945)))

(declare-fun bs!34395 () Bool)

(assert (= bs!34395 d!134243))

(assert (=> bs!34395 m!1127543))

(declare-fun m!1127695 () Bool)

(assert (=> bs!34395 m!1127695))

(assert (=> b!1222349 d!134243))

(declare-fun d!134245 () Bool)

(assert (=> d!134245 (= (array_inv!29044 _keys!1208) (bvsge (size!38602 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101778 d!134245))

(declare-fun d!134247 () Bool)

(assert (=> d!134247 (= (array_inv!29045 _values!996) (bvsge (size!38603 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101778 d!134247))

(declare-fun d!134249 () Bool)

(assert (=> d!134249 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1222348 d!134249))

(declare-fun e!694345 () Bool)

(declare-fun lt!555961 () ListLongMap!18043)

(declare-fun b!1222535 () Bool)

(assert (=> b!1222535 (= e!694345 (= lt!555961 (getCurrentListMapNoExtraKeys!5492 lt!555860 lt!555865 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1222536 () Bool)

(assert (=> b!1222536 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38602 lt!555860)))))

(assert (=> b!1222536 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38603 lt!555865)))))

(declare-fun e!694342 () Bool)

(declare-fun apply!984 (ListLongMap!18043 (_ BitVec 64)) V!46505)

(assert (=> b!1222536 (= e!694342 (= (apply!984 lt!555961 (select (arr!38065 lt!555860) from!1455)) (get!19466 (select (arr!38066 lt!555865) from!1455) (dynLambda!3393 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1222537 () Bool)

(declare-fun e!694344 () Bool)

(assert (=> b!1222537 (= e!694344 e!694342)))

(assert (=> b!1222537 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38602 lt!555860)))))

(declare-fun res!811831 () Bool)

(declare-fun contains!7056 (ListLongMap!18043 (_ BitVec 64)) Bool)

(assert (=> b!1222537 (= res!811831 (contains!7056 lt!555961 (select (arr!38065 lt!555860) from!1455)))))

(assert (=> b!1222537 (=> (not res!811831) (not e!694342))))

(declare-fun b!1222538 () Bool)

(assert (=> b!1222538 (= e!694344 e!694345)))

(declare-fun c!120649 () Bool)

(assert (=> b!1222538 (= c!120649 (bvslt from!1455 (size!38602 lt!555860)))))

(declare-fun b!1222540 () Bool)

(declare-fun e!694341 () ListLongMap!18043)

(declare-fun e!694339 () ListLongMap!18043)

(assert (=> b!1222540 (= e!694341 e!694339)))

(declare-fun c!120652 () Bool)

(assert (=> b!1222540 (= c!120652 (validKeyInArray!0 (select (arr!38065 lt!555860) from!1455)))))

(declare-fun bm!60775 () Bool)

(declare-fun call!60778 () ListLongMap!18043)

(assert (=> bm!60775 (= call!60778 (getCurrentListMapNoExtraKeys!5492 lt!555860 lt!555865 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1222541 () Bool)

(declare-fun res!811829 () Bool)

(declare-fun e!694343 () Bool)

(assert (=> b!1222541 (=> (not res!811829) (not e!694343))))

(assert (=> b!1222541 (= res!811829 (not (contains!7056 lt!555961 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1222542 () Bool)

(assert (=> b!1222542 (= e!694343 e!694344)))

(declare-fun c!120651 () Bool)

(declare-fun e!694340 () Bool)

(assert (=> b!1222542 (= c!120651 e!694340)))

(declare-fun res!811832 () Bool)

(assert (=> b!1222542 (=> (not res!811832) (not e!694340))))

(assert (=> b!1222542 (= res!811832 (bvslt from!1455 (size!38602 lt!555860)))))

(declare-fun b!1222543 () Bool)

(declare-fun isEmpty!1003 (ListLongMap!18043) Bool)

(assert (=> b!1222543 (= e!694345 (isEmpty!1003 lt!555961))))

(declare-fun b!1222544 () Bool)

(assert (=> b!1222544 (= e!694341 (ListLongMap!18044 Nil!26874))))

(declare-fun b!1222539 () Bool)

(assert (=> b!1222539 (= e!694339 call!60778)))

(declare-fun d!134251 () Bool)

(assert (=> d!134251 e!694343))

(declare-fun res!811830 () Bool)

(assert (=> d!134251 (=> (not res!811830) (not e!694343))))

(assert (=> d!134251 (= res!811830 (not (contains!7056 lt!555961 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134251 (= lt!555961 e!694341)))

(declare-fun c!120650 () Bool)

(assert (=> d!134251 (= c!120650 (bvsge from!1455 (size!38602 lt!555860)))))

(assert (=> d!134251 (validMask!0 mask!1564)))

(assert (=> d!134251 (= (getCurrentListMapNoExtraKeys!5492 lt!555860 lt!555865 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!555961)))

(declare-fun b!1222545 () Bool)

(assert (=> b!1222545 (= e!694340 (validKeyInArray!0 (select (arr!38065 lt!555860) from!1455)))))

(assert (=> b!1222545 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1222546 () Bool)

(declare-fun lt!555966 () Unit!40432)

(declare-fun lt!555960 () Unit!40432)

(assert (=> b!1222546 (= lt!555966 lt!555960)))

(declare-fun lt!555963 () (_ BitVec 64))

(declare-fun lt!555962 () (_ BitVec 64))

(declare-fun lt!555965 () V!46505)

(declare-fun lt!555964 () ListLongMap!18043)

(assert (=> b!1222546 (not (contains!7056 (+!4142 lt!555964 (tuple2!20067 lt!555962 lt!555965)) lt!555963))))

(declare-fun addStillNotContains!305 (ListLongMap!18043 (_ BitVec 64) V!46505 (_ BitVec 64)) Unit!40432)

(assert (=> b!1222546 (= lt!555960 (addStillNotContains!305 lt!555964 lt!555962 lt!555965 lt!555963))))

(assert (=> b!1222546 (= lt!555963 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1222546 (= lt!555965 (get!19466 (select (arr!38066 lt!555865) from!1455) (dynLambda!3393 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1222546 (= lt!555962 (select (arr!38065 lt!555860) from!1455))))

(assert (=> b!1222546 (= lt!555964 call!60778)))

(assert (=> b!1222546 (= e!694339 (+!4142 call!60778 (tuple2!20067 (select (arr!38065 lt!555860) from!1455) (get!19466 (select (arr!38066 lt!555865) from!1455) (dynLambda!3393 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!134251 c!120650) b!1222544))

(assert (= (and d!134251 (not c!120650)) b!1222540))

(assert (= (and b!1222540 c!120652) b!1222546))

(assert (= (and b!1222540 (not c!120652)) b!1222539))

(assert (= (or b!1222546 b!1222539) bm!60775))

(assert (= (and d!134251 res!811830) b!1222541))

(assert (= (and b!1222541 res!811829) b!1222542))

(assert (= (and b!1222542 res!811832) b!1222545))

(assert (= (and b!1222542 c!120651) b!1222537))

(assert (= (and b!1222542 (not c!120651)) b!1222538))

(assert (= (and b!1222537 res!811831) b!1222536))

(assert (= (and b!1222538 c!120649) b!1222535))

(assert (= (and b!1222538 (not c!120649)) b!1222543))

(declare-fun b_lambda!22197 () Bool)

(assert (=> (not b_lambda!22197) (not b!1222536)))

(assert (=> b!1222536 t!40176))

(declare-fun b_and!43879 () Bool)

(assert (= b_and!43869 (and (=> t!40176 result!22857) b_and!43879)))

(declare-fun b_lambda!22199 () Bool)

(assert (=> (not b_lambda!22199) (not b!1222546)))

(assert (=> b!1222546 t!40176))

(declare-fun b_and!43881 () Bool)

(assert (= b_and!43879 (and (=> t!40176 result!22857) b_and!43881)))

(declare-fun m!1127697 () Bool)

(assert (=> bm!60775 m!1127697))

(declare-fun m!1127699 () Bool)

(assert (=> b!1222540 m!1127699))

(assert (=> b!1222540 m!1127699))

(declare-fun m!1127701 () Bool)

(assert (=> b!1222540 m!1127701))

(declare-fun m!1127703 () Bool)

(assert (=> b!1222536 m!1127703))

(assert (=> b!1222536 m!1127515))

(assert (=> b!1222536 m!1127699))

(assert (=> b!1222536 m!1127699))

(declare-fun m!1127705 () Bool)

(assert (=> b!1222536 m!1127705))

(assert (=> b!1222536 m!1127703))

(assert (=> b!1222536 m!1127515))

(declare-fun m!1127707 () Bool)

(assert (=> b!1222536 m!1127707))

(assert (=> b!1222546 m!1127703))

(assert (=> b!1222546 m!1127515))

(declare-fun m!1127709 () Bool)

(assert (=> b!1222546 m!1127709))

(assert (=> b!1222546 m!1127699))

(assert (=> b!1222546 m!1127703))

(assert (=> b!1222546 m!1127515))

(assert (=> b!1222546 m!1127707))

(assert (=> b!1222546 m!1127709))

(declare-fun m!1127711 () Bool)

(assert (=> b!1222546 m!1127711))

(declare-fun m!1127713 () Bool)

(assert (=> b!1222546 m!1127713))

(declare-fun m!1127715 () Bool)

(assert (=> b!1222546 m!1127715))

(declare-fun m!1127717 () Bool)

(assert (=> b!1222543 m!1127717))

(assert (=> b!1222545 m!1127699))

(assert (=> b!1222545 m!1127699))

(assert (=> b!1222545 m!1127701))

(assert (=> b!1222537 m!1127699))

(assert (=> b!1222537 m!1127699))

(declare-fun m!1127719 () Bool)

(assert (=> b!1222537 m!1127719))

(declare-fun m!1127721 () Bool)

(assert (=> d!134251 m!1127721))

(assert (=> d!134251 m!1127547))

(declare-fun m!1127723 () Bool)

(assert (=> b!1222541 m!1127723))

(assert (=> b!1222535 m!1127697))

(assert (=> b!1222360 d!134251))

(declare-fun e!694352 () Bool)

(declare-fun lt!555968 () ListLongMap!18043)

(declare-fun b!1222547 () Bool)

(assert (=> b!1222547 (= e!694352 (= lt!555968 (getCurrentListMapNoExtraKeys!5492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1222548 () Bool)

(assert (=> b!1222548 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38602 _keys!1208)))))

(assert (=> b!1222548 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38603 _values!996)))))

(declare-fun e!694349 () Bool)

(assert (=> b!1222548 (= e!694349 (= (apply!984 lt!555968 (select (arr!38065 _keys!1208) from!1455)) (get!19466 (select (arr!38066 _values!996) from!1455) (dynLambda!3393 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1222549 () Bool)

(declare-fun e!694351 () Bool)

(assert (=> b!1222549 (= e!694351 e!694349)))

(assert (=> b!1222549 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38602 _keys!1208)))))

(declare-fun res!811835 () Bool)

(assert (=> b!1222549 (= res!811835 (contains!7056 lt!555968 (select (arr!38065 _keys!1208) from!1455)))))

(assert (=> b!1222549 (=> (not res!811835) (not e!694349))))

(declare-fun b!1222550 () Bool)

(assert (=> b!1222550 (= e!694351 e!694352)))

(declare-fun c!120653 () Bool)

(assert (=> b!1222550 (= c!120653 (bvslt from!1455 (size!38602 _keys!1208)))))

(declare-fun b!1222552 () Bool)

(declare-fun e!694348 () ListLongMap!18043)

(declare-fun e!694346 () ListLongMap!18043)

(assert (=> b!1222552 (= e!694348 e!694346)))

(declare-fun c!120656 () Bool)

(assert (=> b!1222552 (= c!120656 (validKeyInArray!0 (select (arr!38065 _keys!1208) from!1455)))))

(declare-fun call!60779 () ListLongMap!18043)

(declare-fun bm!60776 () Bool)

(assert (=> bm!60776 (= call!60779 (getCurrentListMapNoExtraKeys!5492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1222553 () Bool)

(declare-fun res!811833 () Bool)

(declare-fun e!694350 () Bool)

(assert (=> b!1222553 (=> (not res!811833) (not e!694350))))

(assert (=> b!1222553 (= res!811833 (not (contains!7056 lt!555968 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1222554 () Bool)

(assert (=> b!1222554 (= e!694350 e!694351)))

(declare-fun c!120655 () Bool)

(declare-fun e!694347 () Bool)

(assert (=> b!1222554 (= c!120655 e!694347)))

(declare-fun res!811836 () Bool)

(assert (=> b!1222554 (=> (not res!811836) (not e!694347))))

(assert (=> b!1222554 (= res!811836 (bvslt from!1455 (size!38602 _keys!1208)))))

(declare-fun b!1222555 () Bool)

(assert (=> b!1222555 (= e!694352 (isEmpty!1003 lt!555968))))

(declare-fun b!1222556 () Bool)

(assert (=> b!1222556 (= e!694348 (ListLongMap!18044 Nil!26874))))

(declare-fun b!1222551 () Bool)

(assert (=> b!1222551 (= e!694346 call!60779)))

(declare-fun d!134253 () Bool)

(assert (=> d!134253 e!694350))

(declare-fun res!811834 () Bool)

(assert (=> d!134253 (=> (not res!811834) (not e!694350))))

(assert (=> d!134253 (= res!811834 (not (contains!7056 lt!555968 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134253 (= lt!555968 e!694348)))

(declare-fun c!120654 () Bool)

(assert (=> d!134253 (= c!120654 (bvsge from!1455 (size!38602 _keys!1208)))))

(assert (=> d!134253 (validMask!0 mask!1564)))

(assert (=> d!134253 (= (getCurrentListMapNoExtraKeys!5492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!555968)))

(declare-fun b!1222557 () Bool)

(assert (=> b!1222557 (= e!694347 (validKeyInArray!0 (select (arr!38065 _keys!1208) from!1455)))))

(assert (=> b!1222557 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1222558 () Bool)

(declare-fun lt!555973 () Unit!40432)

(declare-fun lt!555967 () Unit!40432)

(assert (=> b!1222558 (= lt!555973 lt!555967)))

(declare-fun lt!555969 () (_ BitVec 64))

(declare-fun lt!555970 () (_ BitVec 64))

(declare-fun lt!555971 () ListLongMap!18043)

(declare-fun lt!555972 () V!46505)

(assert (=> b!1222558 (not (contains!7056 (+!4142 lt!555971 (tuple2!20067 lt!555969 lt!555972)) lt!555970))))

(assert (=> b!1222558 (= lt!555967 (addStillNotContains!305 lt!555971 lt!555969 lt!555972 lt!555970))))

(assert (=> b!1222558 (= lt!555970 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1222558 (= lt!555972 (get!19466 (select (arr!38066 _values!996) from!1455) (dynLambda!3393 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1222558 (= lt!555969 (select (arr!38065 _keys!1208) from!1455))))

(assert (=> b!1222558 (= lt!555971 call!60779)))

(assert (=> b!1222558 (= e!694346 (+!4142 call!60779 (tuple2!20067 (select (arr!38065 _keys!1208) from!1455) (get!19466 (select (arr!38066 _values!996) from!1455) (dynLambda!3393 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!134253 c!120654) b!1222556))

(assert (= (and d!134253 (not c!120654)) b!1222552))

(assert (= (and b!1222552 c!120656) b!1222558))

(assert (= (and b!1222552 (not c!120656)) b!1222551))

(assert (= (or b!1222558 b!1222551) bm!60776))

(assert (= (and d!134253 res!811834) b!1222553))

(assert (= (and b!1222553 res!811833) b!1222554))

(assert (= (and b!1222554 res!811836) b!1222557))

(assert (= (and b!1222554 c!120655) b!1222549))

(assert (= (and b!1222554 (not c!120655)) b!1222550))

(assert (= (and b!1222549 res!811835) b!1222548))

(assert (= (and b!1222550 c!120653) b!1222547))

(assert (= (and b!1222550 (not c!120653)) b!1222555))

(declare-fun b_lambda!22201 () Bool)

(assert (=> (not b_lambda!22201) (not b!1222548)))

(assert (=> b!1222548 t!40176))

(declare-fun b_and!43883 () Bool)

(assert (= b_and!43881 (and (=> t!40176 result!22857) b_and!43883)))

(declare-fun b_lambda!22203 () Bool)

(assert (=> (not b_lambda!22203) (not b!1222558)))

(assert (=> b!1222558 t!40176))

(declare-fun b_and!43885 () Bool)

(assert (= b_and!43883 (and (=> t!40176 result!22857) b_and!43885)))

(declare-fun m!1127725 () Bool)

(assert (=> bm!60776 m!1127725))

(assert (=> b!1222552 m!1127499))

(assert (=> b!1222552 m!1127499))

(assert (=> b!1222552 m!1127529))

(assert (=> b!1222548 m!1127501))

(assert (=> b!1222548 m!1127515))

(assert (=> b!1222548 m!1127499))

(assert (=> b!1222548 m!1127499))

(declare-fun m!1127727 () Bool)

(assert (=> b!1222548 m!1127727))

(assert (=> b!1222548 m!1127501))

(assert (=> b!1222548 m!1127515))

(declare-fun m!1127729 () Bool)

(assert (=> b!1222548 m!1127729))

(assert (=> b!1222558 m!1127501))

(assert (=> b!1222558 m!1127515))

(declare-fun m!1127731 () Bool)

(assert (=> b!1222558 m!1127731))

(assert (=> b!1222558 m!1127499))

(assert (=> b!1222558 m!1127501))

(assert (=> b!1222558 m!1127515))

(assert (=> b!1222558 m!1127729))

(assert (=> b!1222558 m!1127731))

(declare-fun m!1127733 () Bool)

(assert (=> b!1222558 m!1127733))

(declare-fun m!1127735 () Bool)

(assert (=> b!1222558 m!1127735))

(declare-fun m!1127737 () Bool)

(assert (=> b!1222558 m!1127737))

(declare-fun m!1127739 () Bool)

(assert (=> b!1222555 m!1127739))

(assert (=> b!1222557 m!1127499))

(assert (=> b!1222557 m!1127499))

(assert (=> b!1222557 m!1127529))

(assert (=> b!1222549 m!1127499))

(assert (=> b!1222549 m!1127499))

(declare-fun m!1127741 () Bool)

(assert (=> b!1222549 m!1127741))

(declare-fun m!1127743 () Bool)

(assert (=> d!134253 m!1127743))

(assert (=> d!134253 m!1127547))

(declare-fun m!1127745 () Bool)

(assert (=> b!1222553 m!1127745))

(assert (=> b!1222547 m!1127725))

(assert (=> b!1222360 d!134253))

(declare-fun d!134255 () Bool)

(declare-fun e!694355 () Bool)

(assert (=> d!134255 e!694355))

(declare-fun res!811842 () Bool)

(assert (=> d!134255 (=> (not res!811842) (not e!694355))))

(declare-fun lt!555983 () ListLongMap!18043)

(assert (=> d!134255 (= res!811842 (contains!7056 lt!555983 (_1!10044 (tuple2!20067 (select (arr!38065 _keys!1208) from!1455) (get!19466 (select (arr!38066 _values!996) from!1455) lt!555866)))))))

(declare-fun lt!555985 () List!26877)

(assert (=> d!134255 (= lt!555983 (ListLongMap!18044 lt!555985))))

(declare-fun lt!555982 () Unit!40432)

(declare-fun lt!555984 () Unit!40432)

(assert (=> d!134255 (= lt!555982 lt!555984)))

(declare-datatypes ((Option!693 0))(
  ( (Some!692 (v!18230 V!46505)) (None!691) )
))
(declare-fun getValueByKey!642 (List!26877 (_ BitVec 64)) Option!693)

(assert (=> d!134255 (= (getValueByKey!642 lt!555985 (_1!10044 (tuple2!20067 (select (arr!38065 _keys!1208) from!1455) (get!19466 (select (arr!38066 _values!996) from!1455) lt!555866)))) (Some!692 (_2!10044 (tuple2!20067 (select (arr!38065 _keys!1208) from!1455) (get!19466 (select (arr!38066 _values!996) from!1455) lt!555866)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!324 (List!26877 (_ BitVec 64) V!46505) Unit!40432)

(assert (=> d!134255 (= lt!555984 (lemmaContainsTupThenGetReturnValue!324 lt!555985 (_1!10044 (tuple2!20067 (select (arr!38065 _keys!1208) from!1455) (get!19466 (select (arr!38066 _values!996) from!1455) lt!555866))) (_2!10044 (tuple2!20067 (select (arr!38065 _keys!1208) from!1455) (get!19466 (select (arr!38066 _values!996) from!1455) lt!555866)))))))

(declare-fun insertStrictlySorted!417 (List!26877 (_ BitVec 64) V!46505) List!26877)

(assert (=> d!134255 (= lt!555985 (insertStrictlySorted!417 (toList!9037 lt!555864) (_1!10044 (tuple2!20067 (select (arr!38065 _keys!1208) from!1455) (get!19466 (select (arr!38066 _values!996) from!1455) lt!555866))) (_2!10044 (tuple2!20067 (select (arr!38065 _keys!1208) from!1455) (get!19466 (select (arr!38066 _values!996) from!1455) lt!555866)))))))

(assert (=> d!134255 (= (+!4142 lt!555864 (tuple2!20067 (select (arr!38065 _keys!1208) from!1455) (get!19466 (select (arr!38066 _values!996) from!1455) lt!555866))) lt!555983)))

(declare-fun b!1222563 () Bool)

(declare-fun res!811841 () Bool)

(assert (=> b!1222563 (=> (not res!811841) (not e!694355))))

(assert (=> b!1222563 (= res!811841 (= (getValueByKey!642 (toList!9037 lt!555983) (_1!10044 (tuple2!20067 (select (arr!38065 _keys!1208) from!1455) (get!19466 (select (arr!38066 _values!996) from!1455) lt!555866)))) (Some!692 (_2!10044 (tuple2!20067 (select (arr!38065 _keys!1208) from!1455) (get!19466 (select (arr!38066 _values!996) from!1455) lt!555866))))))))

(declare-fun b!1222564 () Bool)

(declare-fun contains!7057 (List!26877 tuple2!20066) Bool)

(assert (=> b!1222564 (= e!694355 (contains!7057 (toList!9037 lt!555983) (tuple2!20067 (select (arr!38065 _keys!1208) from!1455) (get!19466 (select (arr!38066 _values!996) from!1455) lt!555866))))))

(assert (= (and d!134255 res!811842) b!1222563))

(assert (= (and b!1222563 res!811841) b!1222564))

(declare-fun m!1127747 () Bool)

(assert (=> d!134255 m!1127747))

(declare-fun m!1127749 () Bool)

(assert (=> d!134255 m!1127749))

(declare-fun m!1127751 () Bool)

(assert (=> d!134255 m!1127751))

(declare-fun m!1127753 () Bool)

(assert (=> d!134255 m!1127753))

(declare-fun m!1127755 () Bool)

(assert (=> b!1222563 m!1127755))

(declare-fun m!1127757 () Bool)

(assert (=> b!1222564 m!1127757))

(assert (=> b!1222357 d!134255))

(declare-fun d!134257 () Bool)

(declare-fun c!120659 () Bool)

(assert (=> d!134257 (= c!120659 ((_ is ValueCellFull!14807) (select (arr!38066 _values!996) from!1455)))))

(declare-fun e!694358 () V!46505)

(assert (=> d!134257 (= (get!19466 (select (arr!38066 _values!996) from!1455) lt!555866) e!694358)))

(declare-fun b!1222569 () Bool)

(declare-fun get!19468 (ValueCell!14807 V!46505) V!46505)

(assert (=> b!1222569 (= e!694358 (get!19468 (select (arr!38066 _values!996) from!1455) lt!555866))))

(declare-fun b!1222570 () Bool)

(declare-fun get!19469 (ValueCell!14807 V!46505) V!46505)

(assert (=> b!1222570 (= e!694358 (get!19469 (select (arr!38066 _values!996) from!1455) lt!555866))))

(assert (= (and d!134257 c!120659) b!1222569))

(assert (= (and d!134257 (not c!120659)) b!1222570))

(assert (=> b!1222569 m!1127501))

(declare-fun m!1127759 () Bool)

(assert (=> b!1222569 m!1127759))

(assert (=> b!1222570 m!1127501))

(declare-fun m!1127761 () Bool)

(assert (=> b!1222570 m!1127761))

(assert (=> b!1222357 d!134257))

(declare-fun b!1222579 () Bool)

(declare-fun e!694367 () Bool)

(declare-fun e!694365 () Bool)

(assert (=> b!1222579 (= e!694367 e!694365)))

(declare-fun c!120662 () Bool)

(assert (=> b!1222579 (= c!120662 (validKeyInArray!0 (select (arr!38065 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1222580 () Bool)

(declare-fun e!694366 () Bool)

(assert (=> b!1222580 (= e!694365 e!694366)))

(declare-fun lt!555993 () (_ BitVec 64))

(assert (=> b!1222580 (= lt!555993 (select (arr!38065 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!555992 () Unit!40432)

(assert (=> b!1222580 (= lt!555992 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!555993 #b00000000000000000000000000000000))))

(assert (=> b!1222580 (arrayContainsKey!0 _keys!1208 lt!555993 #b00000000000000000000000000000000)))

(declare-fun lt!555994 () Unit!40432)

(assert (=> b!1222580 (= lt!555994 lt!555992)))

(declare-fun res!811847 () Bool)

(declare-datatypes ((SeekEntryResult!9904 0))(
  ( (MissingZero!9904 (index!41987 (_ BitVec 32))) (Found!9904 (index!41988 (_ BitVec 32))) (Intermediate!9904 (undefined!10716 Bool) (index!41989 (_ BitVec 32)) (x!107536 (_ BitVec 32))) (Undefined!9904) (MissingVacant!9904 (index!41990 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78883 (_ BitVec 32)) SeekEntryResult!9904)

(assert (=> b!1222580 (= res!811847 (= (seekEntryOrOpen!0 (select (arr!38065 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9904 #b00000000000000000000000000000000)))))

(assert (=> b!1222580 (=> (not res!811847) (not e!694366))))

(declare-fun b!1222581 () Bool)

(declare-fun call!60782 () Bool)

(assert (=> b!1222581 (= e!694366 call!60782)))

(declare-fun d!134259 () Bool)

(declare-fun res!811848 () Bool)

(assert (=> d!134259 (=> res!811848 e!694367)))

(assert (=> d!134259 (= res!811848 (bvsge #b00000000000000000000000000000000 (size!38602 _keys!1208)))))

(assert (=> d!134259 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!694367)))

(declare-fun b!1222582 () Bool)

(assert (=> b!1222582 (= e!694365 call!60782)))

(declare-fun bm!60779 () Bool)

(assert (=> bm!60779 (= call!60782 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!134259 (not res!811848)) b!1222579))

(assert (= (and b!1222579 c!120662) b!1222580))

(assert (= (and b!1222579 (not c!120662)) b!1222582))

(assert (= (and b!1222580 res!811847) b!1222581))

(assert (= (or b!1222581 b!1222582) bm!60779))

(declare-fun m!1127763 () Bool)

(assert (=> b!1222579 m!1127763))

(assert (=> b!1222579 m!1127763))

(declare-fun m!1127765 () Bool)

(assert (=> b!1222579 m!1127765))

(assert (=> b!1222580 m!1127763))

(declare-fun m!1127767 () Bool)

(assert (=> b!1222580 m!1127767))

(declare-fun m!1127769 () Bool)

(assert (=> b!1222580 m!1127769))

(assert (=> b!1222580 m!1127763))

(declare-fun m!1127771 () Bool)

(assert (=> b!1222580 m!1127771))

(declare-fun m!1127773 () Bool)

(assert (=> bm!60779 m!1127773))

(assert (=> b!1222347 d!134259))

(declare-fun b!1222583 () Bool)

(declare-fun e!694370 () Bool)

(assert (=> b!1222583 (= e!694370 (contains!7055 Nil!26873 (select (arr!38065 lt!555860) #b00000000000000000000000000000000)))))

(declare-fun b!1222584 () Bool)

(declare-fun e!694368 () Bool)

(declare-fun call!60783 () Bool)

(assert (=> b!1222584 (= e!694368 call!60783)))

(declare-fun b!1222585 () Bool)

(assert (=> b!1222585 (= e!694368 call!60783)))

(declare-fun b!1222586 () Bool)

(declare-fun e!694371 () Bool)

(declare-fun e!694369 () Bool)

(assert (=> b!1222586 (= e!694371 e!694369)))

(declare-fun res!811849 () Bool)

(assert (=> b!1222586 (=> (not res!811849) (not e!694369))))

(assert (=> b!1222586 (= res!811849 (not e!694370))))

(declare-fun res!811850 () Bool)

(assert (=> b!1222586 (=> (not res!811850) (not e!694370))))

(assert (=> b!1222586 (= res!811850 (validKeyInArray!0 (select (arr!38065 lt!555860) #b00000000000000000000000000000000)))))

(declare-fun b!1222587 () Bool)

(assert (=> b!1222587 (= e!694369 e!694368)))

(declare-fun c!120663 () Bool)

(assert (=> b!1222587 (= c!120663 (validKeyInArray!0 (select (arr!38065 lt!555860) #b00000000000000000000000000000000)))))

(declare-fun bm!60780 () Bool)

(assert (=> bm!60780 (= call!60783 (arrayNoDuplicates!0 lt!555860 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120663 (Cons!26872 (select (arr!38065 lt!555860) #b00000000000000000000000000000000) Nil!26873) Nil!26873)))))

(declare-fun d!134261 () Bool)

(declare-fun res!811851 () Bool)

(assert (=> d!134261 (=> res!811851 e!694371)))

(assert (=> d!134261 (= res!811851 (bvsge #b00000000000000000000000000000000 (size!38602 lt!555860)))))

(assert (=> d!134261 (= (arrayNoDuplicates!0 lt!555860 #b00000000000000000000000000000000 Nil!26873) e!694371)))

(assert (= (and d!134261 (not res!811851)) b!1222586))

(assert (= (and b!1222586 res!811850) b!1222583))

(assert (= (and b!1222586 res!811849) b!1222587))

(assert (= (and b!1222587 c!120663) b!1222585))

(assert (= (and b!1222587 (not c!120663)) b!1222584))

(assert (= (or b!1222585 b!1222584) bm!60780))

(declare-fun m!1127775 () Bool)

(assert (=> b!1222583 m!1127775))

(assert (=> b!1222583 m!1127775))

(declare-fun m!1127777 () Bool)

(assert (=> b!1222583 m!1127777))

(assert (=> b!1222586 m!1127775))

(assert (=> b!1222586 m!1127775))

(declare-fun m!1127779 () Bool)

(assert (=> b!1222586 m!1127779))

(assert (=> b!1222587 m!1127775))

(assert (=> b!1222587 m!1127775))

(assert (=> b!1222587 m!1127779))

(assert (=> bm!60780 m!1127775))

(declare-fun m!1127781 () Bool)

(assert (=> bm!60780 m!1127781))

(assert (=> b!1222356 d!134261))

(declare-fun b!1222588 () Bool)

(declare-fun e!694374 () Bool)

(assert (=> b!1222588 (= e!694374 (contains!7055 Nil!26873 (select (arr!38065 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1222589 () Bool)

(declare-fun e!694372 () Bool)

(declare-fun call!60784 () Bool)

(assert (=> b!1222589 (= e!694372 call!60784)))

(declare-fun b!1222590 () Bool)

(assert (=> b!1222590 (= e!694372 call!60784)))

(declare-fun b!1222591 () Bool)

(declare-fun e!694375 () Bool)

(declare-fun e!694373 () Bool)

(assert (=> b!1222591 (= e!694375 e!694373)))

(declare-fun res!811852 () Bool)

(assert (=> b!1222591 (=> (not res!811852) (not e!694373))))

(assert (=> b!1222591 (= res!811852 (not e!694374))))

(declare-fun res!811853 () Bool)

(assert (=> b!1222591 (=> (not res!811853) (not e!694374))))

(assert (=> b!1222591 (= res!811853 (validKeyInArray!0 (select (arr!38065 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1222592 () Bool)

(assert (=> b!1222592 (= e!694373 e!694372)))

(declare-fun c!120664 () Bool)

(assert (=> b!1222592 (= c!120664 (validKeyInArray!0 (select (arr!38065 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!60781 () Bool)

(assert (=> bm!60781 (= call!60784 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120664 (Cons!26872 (select (arr!38065 _keys!1208) #b00000000000000000000000000000000) Nil!26873) Nil!26873)))))

(declare-fun d!134263 () Bool)

(declare-fun res!811854 () Bool)

(assert (=> d!134263 (=> res!811854 e!694375)))

(assert (=> d!134263 (= res!811854 (bvsge #b00000000000000000000000000000000 (size!38602 _keys!1208)))))

(assert (=> d!134263 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26873) e!694375)))

(assert (= (and d!134263 (not res!811854)) b!1222591))

(assert (= (and b!1222591 res!811853) b!1222588))

(assert (= (and b!1222591 res!811852) b!1222592))

(assert (= (and b!1222592 c!120664) b!1222590))

(assert (= (and b!1222592 (not c!120664)) b!1222589))

(assert (= (or b!1222590 b!1222589) bm!60781))

(assert (=> b!1222588 m!1127763))

(assert (=> b!1222588 m!1127763))

(declare-fun m!1127783 () Bool)

(assert (=> b!1222588 m!1127783))

(assert (=> b!1222591 m!1127763))

(assert (=> b!1222591 m!1127763))

(assert (=> b!1222591 m!1127765))

(assert (=> b!1222592 m!1127763))

(assert (=> b!1222592 m!1127763))

(assert (=> b!1222592 m!1127765))

(assert (=> bm!60781 m!1127763))

(declare-fun m!1127785 () Bool)

(assert (=> bm!60781 m!1127785))

(assert (=> b!1222354 d!134263))

(declare-fun b!1222593 () Bool)

(declare-fun e!694378 () Bool)

(declare-fun e!694376 () Bool)

(assert (=> b!1222593 (= e!694378 e!694376)))

(declare-fun c!120665 () Bool)

(assert (=> b!1222593 (= c!120665 (validKeyInArray!0 (select (arr!38065 lt!555860) #b00000000000000000000000000000000)))))

(declare-fun b!1222594 () Bool)

(declare-fun e!694377 () Bool)

(assert (=> b!1222594 (= e!694376 e!694377)))

(declare-fun lt!555996 () (_ BitVec 64))

(assert (=> b!1222594 (= lt!555996 (select (arr!38065 lt!555860) #b00000000000000000000000000000000))))

(declare-fun lt!555995 () Unit!40432)

(assert (=> b!1222594 (= lt!555995 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!555860 lt!555996 #b00000000000000000000000000000000))))

(assert (=> b!1222594 (arrayContainsKey!0 lt!555860 lt!555996 #b00000000000000000000000000000000)))

(declare-fun lt!555997 () Unit!40432)

(assert (=> b!1222594 (= lt!555997 lt!555995)))

(declare-fun res!811855 () Bool)

(assert (=> b!1222594 (= res!811855 (= (seekEntryOrOpen!0 (select (arr!38065 lt!555860) #b00000000000000000000000000000000) lt!555860 mask!1564) (Found!9904 #b00000000000000000000000000000000)))))

(assert (=> b!1222594 (=> (not res!811855) (not e!694377))))

(declare-fun b!1222595 () Bool)

(declare-fun call!60785 () Bool)

(assert (=> b!1222595 (= e!694377 call!60785)))

(declare-fun d!134265 () Bool)

(declare-fun res!811856 () Bool)

(assert (=> d!134265 (=> res!811856 e!694378)))

(assert (=> d!134265 (= res!811856 (bvsge #b00000000000000000000000000000000 (size!38602 lt!555860)))))

(assert (=> d!134265 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555860 mask!1564) e!694378)))

(declare-fun b!1222596 () Bool)

(assert (=> b!1222596 (= e!694376 call!60785)))

(declare-fun bm!60782 () Bool)

(assert (=> bm!60782 (= call!60785 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!555860 mask!1564))))

(assert (= (and d!134265 (not res!811856)) b!1222593))

(assert (= (and b!1222593 c!120665) b!1222594))

(assert (= (and b!1222593 (not c!120665)) b!1222596))

(assert (= (and b!1222594 res!811855) b!1222595))

(assert (= (or b!1222595 b!1222596) bm!60782))

(assert (=> b!1222593 m!1127775))

(assert (=> b!1222593 m!1127775))

(assert (=> b!1222593 m!1127779))

(assert (=> b!1222594 m!1127775))

(declare-fun m!1127787 () Bool)

(assert (=> b!1222594 m!1127787))

(declare-fun m!1127789 () Bool)

(assert (=> b!1222594 m!1127789))

(assert (=> b!1222594 m!1127775))

(declare-fun m!1127791 () Bool)

(assert (=> b!1222594 m!1127791))

(declare-fun m!1127793 () Bool)

(assert (=> bm!60782 m!1127793))

(assert (=> b!1222344 d!134265))

(declare-fun d!134267 () Bool)

(declare-fun res!811857 () Bool)

(declare-fun e!694379 () Bool)

(assert (=> d!134267 (=> res!811857 e!694379)))

(assert (=> d!134267 (= res!811857 (= (select (arr!38065 _keys!1208) i!673) k0!934))))

(assert (=> d!134267 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!694379)))

(declare-fun b!1222597 () Bool)

(declare-fun e!694380 () Bool)

(assert (=> b!1222597 (= e!694379 e!694380)))

(declare-fun res!811858 () Bool)

(assert (=> b!1222597 (=> (not res!811858) (not e!694380))))

(assert (=> b!1222597 (= res!811858 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38602 _keys!1208)))))

(declare-fun b!1222598 () Bool)

(assert (=> b!1222598 (= e!694380 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!134267 (not res!811857)) b!1222597))

(assert (= (and b!1222597 res!811858) b!1222598))

(assert (=> d!134267 m!1127533))

(declare-fun m!1127795 () Bool)

(assert (=> b!1222598 m!1127795))

(assert (=> b!1222363 d!134267))

(declare-fun d!134269 () Bool)

(declare-fun res!811863 () Bool)

(declare-fun e!694385 () Bool)

(assert (=> d!134269 (=> res!811863 e!694385)))

(assert (=> d!134269 (= res!811863 ((_ is Nil!26873) Nil!26873))))

(assert (=> d!134269 (= (noDuplicate!1647 Nil!26873) e!694385)))

(declare-fun b!1222603 () Bool)

(declare-fun e!694386 () Bool)

(assert (=> b!1222603 (= e!694385 e!694386)))

(declare-fun res!811864 () Bool)

(assert (=> b!1222603 (=> (not res!811864) (not e!694386))))

(assert (=> b!1222603 (= res!811864 (not (contains!7055 (t!40177 Nil!26873) (h!28090 Nil!26873))))))

(declare-fun b!1222604 () Bool)

(assert (=> b!1222604 (= e!694386 (noDuplicate!1647 (t!40177 Nil!26873)))))

(assert (= (and d!134269 (not res!811863)) b!1222603))

(assert (= (and b!1222603 res!811864) b!1222604))

(declare-fun m!1127797 () Bool)

(assert (=> b!1222603 m!1127797))

(declare-fun m!1127799 () Bool)

(assert (=> b!1222604 m!1127799))

(assert (=> b!1222346 d!134269))

(declare-fun d!134271 () Bool)

(declare-fun lt!556000 () ListLongMap!18043)

(assert (=> d!134271 (not (contains!7056 lt!556000 k0!934))))

(declare-fun removeStrictlySorted!107 (List!26877 (_ BitVec 64)) List!26877)

(assert (=> d!134271 (= lt!556000 (ListLongMap!18044 (removeStrictlySorted!107 (toList!9037 lt!555856) k0!934)))))

(assert (=> d!134271 (= (-!1921 lt!555856 k0!934) lt!556000)))

(declare-fun bs!34396 () Bool)

(assert (= bs!34396 d!134271))

(declare-fun m!1127801 () Bool)

(assert (=> bs!34396 m!1127801))

(declare-fun m!1127803 () Bool)

(assert (=> bs!34396 m!1127803))

(assert (=> b!1222355 d!134271))

(declare-fun d!134273 () Bool)

(assert (=> d!134273 (= (validKeyInArray!0 (select (arr!38065 _keys!1208) from!1455)) (and (not (= (select (arr!38065 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38065 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1222355 d!134273))

(declare-fun e!694393 () Bool)

(declare-fun lt!556002 () ListLongMap!18043)

(declare-fun b!1222605 () Bool)

(assert (=> b!1222605 (= e!694393 (= lt!556002 (getCurrentListMapNoExtraKeys!5492 lt!555860 lt!555865 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1222606 () Bool)

(assert (=> b!1222606 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38602 lt!555860)))))

(assert (=> b!1222606 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38603 lt!555865)))))

(declare-fun e!694390 () Bool)

(assert (=> b!1222606 (= e!694390 (= (apply!984 lt!556002 (select (arr!38065 lt!555860) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19466 (select (arr!38066 lt!555865) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3393 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1222607 () Bool)

(declare-fun e!694392 () Bool)

(assert (=> b!1222607 (= e!694392 e!694390)))

(assert (=> b!1222607 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38602 lt!555860)))))

(declare-fun res!811867 () Bool)

(assert (=> b!1222607 (= res!811867 (contains!7056 lt!556002 (select (arr!38065 lt!555860) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1222607 (=> (not res!811867) (not e!694390))))

(declare-fun b!1222608 () Bool)

(assert (=> b!1222608 (= e!694392 e!694393)))

(declare-fun c!120666 () Bool)

(assert (=> b!1222608 (= c!120666 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38602 lt!555860)))))

(declare-fun b!1222610 () Bool)

(declare-fun e!694389 () ListLongMap!18043)

(declare-fun e!694387 () ListLongMap!18043)

(assert (=> b!1222610 (= e!694389 e!694387)))

(declare-fun c!120669 () Bool)

(assert (=> b!1222610 (= c!120669 (validKeyInArray!0 (select (arr!38065 lt!555860) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun bm!60783 () Bool)

(declare-fun call!60786 () ListLongMap!18043)

(assert (=> bm!60783 (= call!60786 (getCurrentListMapNoExtraKeys!5492 lt!555860 lt!555865 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1222611 () Bool)

(declare-fun res!811865 () Bool)

(declare-fun e!694391 () Bool)

(assert (=> b!1222611 (=> (not res!811865) (not e!694391))))

(assert (=> b!1222611 (= res!811865 (not (contains!7056 lt!556002 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1222612 () Bool)

(assert (=> b!1222612 (= e!694391 e!694392)))

(declare-fun c!120668 () Bool)

(declare-fun e!694388 () Bool)

(assert (=> b!1222612 (= c!120668 e!694388)))

(declare-fun res!811868 () Bool)

(assert (=> b!1222612 (=> (not res!811868) (not e!694388))))

(assert (=> b!1222612 (= res!811868 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38602 lt!555860)))))

(declare-fun b!1222613 () Bool)

(assert (=> b!1222613 (= e!694393 (isEmpty!1003 lt!556002))))

(declare-fun b!1222614 () Bool)

(assert (=> b!1222614 (= e!694389 (ListLongMap!18044 Nil!26874))))

(declare-fun b!1222609 () Bool)

(assert (=> b!1222609 (= e!694387 call!60786)))

(declare-fun d!134275 () Bool)

(assert (=> d!134275 e!694391))

(declare-fun res!811866 () Bool)

(assert (=> d!134275 (=> (not res!811866) (not e!694391))))

(assert (=> d!134275 (= res!811866 (not (contains!7056 lt!556002 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134275 (= lt!556002 e!694389)))

(declare-fun c!120667 () Bool)

(assert (=> d!134275 (= c!120667 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38602 lt!555860)))))

(assert (=> d!134275 (validMask!0 mask!1564)))

(assert (=> d!134275 (= (getCurrentListMapNoExtraKeys!5492 lt!555860 lt!555865 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!556002)))

(declare-fun b!1222615 () Bool)

(assert (=> b!1222615 (= e!694388 (validKeyInArray!0 (select (arr!38065 lt!555860) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1222615 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1222616 () Bool)

(declare-fun lt!556007 () Unit!40432)

(declare-fun lt!556001 () Unit!40432)

(assert (=> b!1222616 (= lt!556007 lt!556001)))

(declare-fun lt!556005 () ListLongMap!18043)

(declare-fun lt!556006 () V!46505)

(declare-fun lt!556003 () (_ BitVec 64))

(declare-fun lt!556004 () (_ BitVec 64))

(assert (=> b!1222616 (not (contains!7056 (+!4142 lt!556005 (tuple2!20067 lt!556003 lt!556006)) lt!556004))))

(assert (=> b!1222616 (= lt!556001 (addStillNotContains!305 lt!556005 lt!556003 lt!556006 lt!556004))))

(assert (=> b!1222616 (= lt!556004 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1222616 (= lt!556006 (get!19466 (select (arr!38066 lt!555865) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3393 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1222616 (= lt!556003 (select (arr!38065 lt!555860) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1222616 (= lt!556005 call!60786)))

(assert (=> b!1222616 (= e!694387 (+!4142 call!60786 (tuple2!20067 (select (arr!38065 lt!555860) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19466 (select (arr!38066 lt!555865) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3393 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!134275 c!120667) b!1222614))

(assert (= (and d!134275 (not c!120667)) b!1222610))

(assert (= (and b!1222610 c!120669) b!1222616))

(assert (= (and b!1222610 (not c!120669)) b!1222609))

(assert (= (or b!1222616 b!1222609) bm!60783))

(assert (= (and d!134275 res!811866) b!1222611))

(assert (= (and b!1222611 res!811865) b!1222612))

(assert (= (and b!1222612 res!811868) b!1222615))

(assert (= (and b!1222612 c!120668) b!1222607))

(assert (= (and b!1222612 (not c!120668)) b!1222608))

(assert (= (and b!1222607 res!811867) b!1222606))

(assert (= (and b!1222608 c!120666) b!1222605))

(assert (= (and b!1222608 (not c!120666)) b!1222613))

(declare-fun b_lambda!22205 () Bool)

(assert (=> (not b_lambda!22205) (not b!1222606)))

(assert (=> b!1222606 t!40176))

(declare-fun b_and!43887 () Bool)

(assert (= b_and!43885 (and (=> t!40176 result!22857) b_and!43887)))

(declare-fun b_lambda!22207 () Bool)

(assert (=> (not b_lambda!22207) (not b!1222616)))

(assert (=> b!1222616 t!40176))

(declare-fun b_and!43889 () Bool)

(assert (= b_and!43887 (and (=> t!40176 result!22857) b_and!43889)))

(declare-fun m!1127805 () Bool)

(assert (=> bm!60783 m!1127805))

(declare-fun m!1127807 () Bool)

(assert (=> b!1222610 m!1127807))

(assert (=> b!1222610 m!1127807))

(declare-fun m!1127809 () Bool)

(assert (=> b!1222610 m!1127809))

(declare-fun m!1127811 () Bool)

(assert (=> b!1222606 m!1127811))

(assert (=> b!1222606 m!1127515))

(assert (=> b!1222606 m!1127807))

(assert (=> b!1222606 m!1127807))

(declare-fun m!1127813 () Bool)

(assert (=> b!1222606 m!1127813))

(assert (=> b!1222606 m!1127811))

(assert (=> b!1222606 m!1127515))

(declare-fun m!1127815 () Bool)

(assert (=> b!1222606 m!1127815))

(assert (=> b!1222616 m!1127811))

(assert (=> b!1222616 m!1127515))

(declare-fun m!1127817 () Bool)

(assert (=> b!1222616 m!1127817))

(assert (=> b!1222616 m!1127807))

(assert (=> b!1222616 m!1127811))

(assert (=> b!1222616 m!1127515))

(assert (=> b!1222616 m!1127815))

(assert (=> b!1222616 m!1127817))

(declare-fun m!1127819 () Bool)

(assert (=> b!1222616 m!1127819))

(declare-fun m!1127821 () Bool)

(assert (=> b!1222616 m!1127821))

(declare-fun m!1127823 () Bool)

(assert (=> b!1222616 m!1127823))

(declare-fun m!1127825 () Bool)

(assert (=> b!1222613 m!1127825))

(assert (=> b!1222615 m!1127807))

(assert (=> b!1222615 m!1127807))

(assert (=> b!1222615 m!1127809))

(assert (=> b!1222607 m!1127807))

(assert (=> b!1222607 m!1127807))

(declare-fun m!1127827 () Bool)

(assert (=> b!1222607 m!1127827))

(declare-fun m!1127829 () Bool)

(assert (=> d!134275 m!1127829))

(assert (=> d!134275 m!1127547))

(declare-fun m!1127831 () Bool)

(assert (=> b!1222611 m!1127831))

(assert (=> b!1222605 m!1127805))

(assert (=> b!1222355 d!134275))

(declare-fun b!1222623 () Bool)

(declare-fun e!694398 () Bool)

(declare-fun call!60792 () ListLongMap!18043)

(declare-fun call!60791 () ListLongMap!18043)

(assert (=> b!1222623 (= e!694398 (= call!60792 call!60791))))

(assert (=> b!1222623 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38603 _values!996)))))

(declare-fun b!1222624 () Bool)

(declare-fun e!694399 () Bool)

(assert (=> b!1222624 (= e!694399 e!694398)))

(declare-fun c!120672 () Bool)

(assert (=> b!1222624 (= c!120672 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun bm!60788 () Bool)

(assert (=> bm!60788 (= call!60792 (getCurrentListMapNoExtraKeys!5492 (array!78884 (store (arr!38065 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38602 _keys!1208)) (array!78886 (store (arr!38066 _values!996) i!673 (ValueCellFull!14807 (dynLambda!3393 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38603 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60789 () Bool)

(assert (=> bm!60789 (= call!60791 (getCurrentListMapNoExtraKeys!5492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!134277 () Bool)

(assert (=> d!134277 e!694399))

(declare-fun res!811871 () Bool)

(assert (=> d!134277 (=> (not res!811871) (not e!694399))))

(assert (=> d!134277 (= res!811871 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38602 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38602 _keys!1208))))))))

(declare-fun lt!556010 () Unit!40432)

(declare-fun choose!1831 (array!78883 array!78885 (_ BitVec 32) (_ BitVec 32) V!46505 V!46505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40432)

(assert (=> d!134277 (= lt!556010 (choose!1831 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!134277 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38602 _keys!1208)))))

(assert (=> d!134277 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1136 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!556010)))

(declare-fun b!1222625 () Bool)

(assert (=> b!1222625 (= e!694398 (= call!60792 (-!1921 call!60791 k0!934)))))

(assert (=> b!1222625 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38603 _values!996)))))

(assert (= (and d!134277 res!811871) b!1222624))

(assert (= (and b!1222624 c!120672) b!1222625))

(assert (= (and b!1222624 (not c!120672)) b!1222623))

(assert (= (or b!1222625 b!1222623) bm!60789))

(assert (= (or b!1222625 b!1222623) bm!60788))

(declare-fun b_lambda!22209 () Bool)

(assert (=> (not b_lambda!22209) (not bm!60788)))

(assert (=> bm!60788 t!40176))

(declare-fun b_and!43891 () Bool)

(assert (= b_and!43889 (and (=> t!40176 result!22857) b_and!43891)))

(assert (=> bm!60788 m!1127497))

(assert (=> bm!60788 m!1127515))

(declare-fun m!1127833 () Bool)

(assert (=> bm!60788 m!1127833))

(declare-fun m!1127835 () Bool)

(assert (=> bm!60788 m!1127835))

(assert (=> bm!60789 m!1127523))

(declare-fun m!1127837 () Bool)

(assert (=> d!134277 m!1127837))

(declare-fun m!1127839 () Bool)

(assert (=> b!1222625 m!1127839))

(assert (=> b!1222355 d!134277))

(declare-fun b!1222626 () Bool)

(declare-fun e!694406 () Bool)

(declare-fun lt!556012 () ListLongMap!18043)

(assert (=> b!1222626 (= e!694406 (= lt!556012 (getCurrentListMapNoExtraKeys!5492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1222627 () Bool)

(assert (=> b!1222627 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38602 _keys!1208)))))

(assert (=> b!1222627 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38603 _values!996)))))

(declare-fun e!694403 () Bool)

(assert (=> b!1222627 (= e!694403 (= (apply!984 lt!556012 (select (arr!38065 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19466 (select (arr!38066 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3393 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1222628 () Bool)

(declare-fun e!694405 () Bool)

(assert (=> b!1222628 (= e!694405 e!694403)))

(assert (=> b!1222628 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38602 _keys!1208)))))

(declare-fun res!811874 () Bool)

(assert (=> b!1222628 (= res!811874 (contains!7056 lt!556012 (select (arr!38065 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1222628 (=> (not res!811874) (not e!694403))))

(declare-fun b!1222629 () Bool)

(assert (=> b!1222629 (= e!694405 e!694406)))

(declare-fun c!120673 () Bool)

(assert (=> b!1222629 (= c!120673 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38602 _keys!1208)))))

(declare-fun b!1222631 () Bool)

(declare-fun e!694402 () ListLongMap!18043)

(declare-fun e!694400 () ListLongMap!18043)

(assert (=> b!1222631 (= e!694402 e!694400)))

(declare-fun c!120676 () Bool)

(assert (=> b!1222631 (= c!120676 (validKeyInArray!0 (select (arr!38065 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun call!60793 () ListLongMap!18043)

(declare-fun bm!60790 () Bool)

(assert (=> bm!60790 (= call!60793 (getCurrentListMapNoExtraKeys!5492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1222632 () Bool)

(declare-fun res!811872 () Bool)

(declare-fun e!694404 () Bool)

(assert (=> b!1222632 (=> (not res!811872) (not e!694404))))

(assert (=> b!1222632 (= res!811872 (not (contains!7056 lt!556012 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1222633 () Bool)

(assert (=> b!1222633 (= e!694404 e!694405)))

(declare-fun c!120675 () Bool)

(declare-fun e!694401 () Bool)

(assert (=> b!1222633 (= c!120675 e!694401)))

(declare-fun res!811875 () Bool)

(assert (=> b!1222633 (=> (not res!811875) (not e!694401))))

(assert (=> b!1222633 (= res!811875 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38602 _keys!1208)))))

(declare-fun b!1222634 () Bool)

(assert (=> b!1222634 (= e!694406 (isEmpty!1003 lt!556012))))

(declare-fun b!1222635 () Bool)

(assert (=> b!1222635 (= e!694402 (ListLongMap!18044 Nil!26874))))

(declare-fun b!1222630 () Bool)

(assert (=> b!1222630 (= e!694400 call!60793)))

(declare-fun d!134279 () Bool)

(assert (=> d!134279 e!694404))

(declare-fun res!811873 () Bool)

(assert (=> d!134279 (=> (not res!811873) (not e!694404))))

(assert (=> d!134279 (= res!811873 (not (contains!7056 lt!556012 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134279 (= lt!556012 e!694402)))

(declare-fun c!120674 () Bool)

(assert (=> d!134279 (= c!120674 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38602 _keys!1208)))))

(assert (=> d!134279 (validMask!0 mask!1564)))

(assert (=> d!134279 (= (getCurrentListMapNoExtraKeys!5492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!556012)))

(declare-fun b!1222636 () Bool)

(assert (=> b!1222636 (= e!694401 (validKeyInArray!0 (select (arr!38065 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1222636 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1222637 () Bool)

(declare-fun lt!556017 () Unit!40432)

(declare-fun lt!556011 () Unit!40432)

(assert (=> b!1222637 (= lt!556017 lt!556011)))

(declare-fun lt!556015 () ListLongMap!18043)

(declare-fun lt!556016 () V!46505)

(declare-fun lt!556013 () (_ BitVec 64))

(declare-fun lt!556014 () (_ BitVec 64))

(assert (=> b!1222637 (not (contains!7056 (+!4142 lt!556015 (tuple2!20067 lt!556013 lt!556016)) lt!556014))))

(assert (=> b!1222637 (= lt!556011 (addStillNotContains!305 lt!556015 lt!556013 lt!556016 lt!556014))))

(assert (=> b!1222637 (= lt!556014 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1222637 (= lt!556016 (get!19466 (select (arr!38066 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3393 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1222637 (= lt!556013 (select (arr!38065 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1222637 (= lt!556015 call!60793)))

(assert (=> b!1222637 (= e!694400 (+!4142 call!60793 (tuple2!20067 (select (arr!38065 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19466 (select (arr!38066 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3393 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!134279 c!120674) b!1222635))

(assert (= (and d!134279 (not c!120674)) b!1222631))

(assert (= (and b!1222631 c!120676) b!1222637))

(assert (= (and b!1222631 (not c!120676)) b!1222630))

(assert (= (or b!1222637 b!1222630) bm!60790))

(assert (= (and d!134279 res!811873) b!1222632))

(assert (= (and b!1222632 res!811872) b!1222633))

(assert (= (and b!1222633 res!811875) b!1222636))

(assert (= (and b!1222633 c!120675) b!1222628))

(assert (= (and b!1222633 (not c!120675)) b!1222629))

(assert (= (and b!1222628 res!811874) b!1222627))

(assert (= (and b!1222629 c!120673) b!1222626))

(assert (= (and b!1222629 (not c!120673)) b!1222634))

(declare-fun b_lambda!22211 () Bool)

(assert (=> (not b_lambda!22211) (not b!1222627)))

(assert (=> b!1222627 t!40176))

(declare-fun b_and!43893 () Bool)

(assert (= b_and!43891 (and (=> t!40176 result!22857) b_and!43893)))

(declare-fun b_lambda!22213 () Bool)

(assert (=> (not b_lambda!22213) (not b!1222637)))

(assert (=> b!1222637 t!40176))

(declare-fun b_and!43895 () Bool)

(assert (= b_and!43893 (and (=> t!40176 result!22857) b_and!43895)))

(declare-fun m!1127841 () Bool)

(assert (=> bm!60790 m!1127841))

(assert (=> b!1222631 m!1127691))

(assert (=> b!1222631 m!1127691))

(declare-fun m!1127843 () Bool)

(assert (=> b!1222631 m!1127843))

(declare-fun m!1127845 () Bool)

(assert (=> b!1222627 m!1127845))

(assert (=> b!1222627 m!1127515))

(assert (=> b!1222627 m!1127691))

(assert (=> b!1222627 m!1127691))

(declare-fun m!1127847 () Bool)

(assert (=> b!1222627 m!1127847))

(assert (=> b!1222627 m!1127845))

(assert (=> b!1222627 m!1127515))

(declare-fun m!1127849 () Bool)

(assert (=> b!1222627 m!1127849))

(assert (=> b!1222637 m!1127845))

(assert (=> b!1222637 m!1127515))

(declare-fun m!1127851 () Bool)

(assert (=> b!1222637 m!1127851))

(assert (=> b!1222637 m!1127691))

(assert (=> b!1222637 m!1127845))

(assert (=> b!1222637 m!1127515))

(assert (=> b!1222637 m!1127849))

(assert (=> b!1222637 m!1127851))

(declare-fun m!1127853 () Bool)

(assert (=> b!1222637 m!1127853))

(declare-fun m!1127855 () Bool)

(assert (=> b!1222637 m!1127855))

(declare-fun m!1127857 () Bool)

(assert (=> b!1222637 m!1127857))

(declare-fun m!1127859 () Bool)

(assert (=> b!1222634 m!1127859))

(assert (=> b!1222636 m!1127691))

(assert (=> b!1222636 m!1127691))

(assert (=> b!1222636 m!1127843))

(assert (=> b!1222628 m!1127691))

(assert (=> b!1222628 m!1127691))

(declare-fun m!1127861 () Bool)

(assert (=> b!1222628 m!1127861))

(declare-fun m!1127863 () Bool)

(assert (=> d!134279 m!1127863))

(assert (=> d!134279 m!1127547))

(declare-fun m!1127865 () Bool)

(assert (=> b!1222632 m!1127865))

(assert (=> b!1222626 m!1127841))

(assert (=> b!1222355 d!134279))

(declare-fun d!134281 () Bool)

(assert (=> d!134281 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1222353 d!134281))

(declare-fun d!134283 () Bool)

(declare-fun res!811876 () Bool)

(declare-fun e!694407 () Bool)

(assert (=> d!134283 (=> res!811876 e!694407)))

(assert (=> d!134283 (= res!811876 (= (select (arr!38065 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!134283 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!694407)))

(declare-fun b!1222638 () Bool)

(declare-fun e!694408 () Bool)

(assert (=> b!1222638 (= e!694407 e!694408)))

(declare-fun res!811877 () Bool)

(assert (=> b!1222638 (=> (not res!811877) (not e!694408))))

(assert (=> b!1222638 (= res!811877 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38602 _keys!1208)))))

(declare-fun b!1222639 () Bool)

(assert (=> b!1222639 (= e!694408 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!134283 (not res!811876)) b!1222638))

(assert (= (and b!1222638 res!811877) b!1222639))

(assert (=> d!134283 m!1127763))

(declare-fun m!1127867 () Bool)

(assert (=> b!1222639 m!1127867))

(assert (=> b!1222352 d!134283))

(declare-fun d!134285 () Bool)

(assert (=> d!134285 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556020 () Unit!40432)

(declare-fun choose!13 (array!78883 (_ BitVec 64) (_ BitVec 32)) Unit!40432)

(assert (=> d!134285 (= lt!556020 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!134285 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!134285 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!556020)))

(declare-fun bs!34397 () Bool)

(assert (= bs!34397 d!134285))

(assert (=> bs!34397 m!1127553))

(declare-fun m!1127869 () Bool)

(assert (=> bs!34397 m!1127869))

(assert (=> b!1222352 d!134285))

(declare-fun mapIsEmpty!48448 () Bool)

(declare-fun mapRes!48448 () Bool)

(assert (=> mapIsEmpty!48448 mapRes!48448))

(declare-fun condMapEmpty!48448 () Bool)

(declare-fun mapDefault!48448 () ValueCell!14807)

(assert (=> mapNonEmpty!48439 (= condMapEmpty!48448 (= mapRest!48439 ((as const (Array (_ BitVec 32) ValueCell!14807)) mapDefault!48448)))))

(declare-fun e!694414 () Bool)

(assert (=> mapNonEmpty!48439 (= tp!92023 (and e!694414 mapRes!48448))))

(declare-fun b!1222646 () Bool)

(declare-fun e!694413 () Bool)

(assert (=> b!1222646 (= e!694413 tp_is_empty!31033)))

(declare-fun mapNonEmpty!48448 () Bool)

(declare-fun tp!92039 () Bool)

(assert (=> mapNonEmpty!48448 (= mapRes!48448 (and tp!92039 e!694413))))

(declare-fun mapValue!48448 () ValueCell!14807)

(declare-fun mapKey!48448 () (_ BitVec 32))

(declare-fun mapRest!48448 () (Array (_ BitVec 32) ValueCell!14807))

(assert (=> mapNonEmpty!48448 (= mapRest!48439 (store mapRest!48448 mapKey!48448 mapValue!48448))))

(declare-fun b!1222647 () Bool)

(assert (=> b!1222647 (= e!694414 tp_is_empty!31033)))

(assert (= (and mapNonEmpty!48439 condMapEmpty!48448) mapIsEmpty!48448))

(assert (= (and mapNonEmpty!48439 (not condMapEmpty!48448)) mapNonEmpty!48448))

(assert (= (and mapNonEmpty!48448 ((_ is ValueCellFull!14807) mapValue!48448)) b!1222646))

(assert (= (and mapNonEmpty!48439 ((_ is ValueCellFull!14807) mapDefault!48448)) b!1222647))

(declare-fun m!1127871 () Bool)

(assert (=> mapNonEmpty!48448 m!1127871))

(declare-fun b_lambda!22215 () Bool)

(assert (= b_lambda!22209 (or (and start!101778 b_free!26329) b_lambda!22215)))

(declare-fun b_lambda!22217 () Bool)

(assert (= b_lambda!22201 (or (and start!101778 b_free!26329) b_lambda!22217)))

(declare-fun b_lambda!22219 () Bool)

(assert (= b_lambda!22205 (or (and start!101778 b_free!26329) b_lambda!22219)))

(declare-fun b_lambda!22221 () Bool)

(assert (= b_lambda!22211 (or (and start!101778 b_free!26329) b_lambda!22221)))

(declare-fun b_lambda!22223 () Bool)

(assert (= b_lambda!22207 (or (and start!101778 b_free!26329) b_lambda!22223)))

(declare-fun b_lambda!22225 () Bool)

(assert (= b_lambda!22197 (or (and start!101778 b_free!26329) b_lambda!22225)))

(declare-fun b_lambda!22227 () Bool)

(assert (= b_lambda!22213 (or (and start!101778 b_free!26329) b_lambda!22227)))

(declare-fun b_lambda!22229 () Bool)

(assert (= b_lambda!22203 (or (and start!101778 b_free!26329) b_lambda!22229)))

(declare-fun b_lambda!22231 () Bool)

(assert (= b_lambda!22199 (or (and start!101778 b_free!26329) b_lambda!22231)))

(check-sat (not b_lambda!22231) (not b!1222616) (not b!1222586) (not b_lambda!22227) (not b!1222591) (not b_lambda!22219) b_and!43895 (not b!1222569) (not bm!60780) (not bm!60775) (not b!1222555) (not d!134255) (not b!1222611) (not b!1222552) (not b!1222628) (not b!1222503) (not b!1222583) (not d!134271) (not b!1222587) (not bm!60782) (not bm!60783) (not b!1222594) (not b_lambda!22223) (not b!1222627) (not b!1222607) (not b!1222545) (not b!1222546) (not d!134239) (not d!134275) (not d!134253) (not b!1222558) (not b_lambda!22221) (not b!1222548) (not d!134285) (not b!1222610) (not b!1222592) (not b_lambda!22215) (not b!1222593) (not b!1222547) (not b!1222632) (not b_lambda!22217) (not b!1222634) (not b!1222615) (not b!1222549) (not b!1222579) (not b!1222510) (not b!1222636) (not bm!60779) (not b!1222639) (not bm!60776) (not d!134251) (not d!134279) (not b!1222588) (not b!1222564) (not b!1222637) (not b!1222537) (not bm!60772) (not b!1222540) (not b!1222626) (not b!1222598) (not b!1222606) (not b!1222580) tp_is_empty!31033 (not d!134243) (not b!1222631) (not bm!60781) (not b!1222541) (not b!1222504) (not b!1222603) (not b!1222605) (not b_lambda!22229) (not b!1222604) (not b!1222536) (not b!1222613) (not b!1222543) (not b_next!26329) (not b!1222625) (not b!1222535) (not b!1222553) (not b!1222570) (not b_lambda!22225) (not mapNonEmpty!48448) (not b!1222557) (not b_lambda!22195) (not b!1222563) (not d!134277) (not b!1222500) (not bm!60790) (not bm!60788) (not bm!60789))
(check-sat b_and!43895 (not b_next!26329))
