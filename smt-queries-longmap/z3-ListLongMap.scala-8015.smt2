; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98924 () Bool)

(assert start!98924)

(declare-fun b_free!24535 () Bool)

(declare-fun b_next!24535 () Bool)

(assert (=> start!98924 (= b_free!24535 (not b_next!24535))))

(declare-fun tp!86316 () Bool)

(declare-fun b_and!39897 () Bool)

(assert (=> start!98924 (= tp!86316 b_and!39897)))

(declare-fun b!1159498 () Bool)

(declare-datatypes ((Unit!38061 0))(
  ( (Unit!38062) )
))
(declare-fun e!659349 () Unit!38061)

(declare-fun Unit!38063 () Unit!38061)

(assert (=> b!1159498 (= e!659349 Unit!38063)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!521199 () Bool)

(declare-fun e!659354 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1159499 () Bool)

(assert (=> b!1159499 (= e!659354 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521199) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!55936 () Bool)

(declare-fun call!55940 () Bool)

(declare-fun call!55945 () Bool)

(assert (=> bm!55936 (= call!55940 call!55945)))

(declare-fun b!1159500 () Bool)

(declare-fun e!659348 () Bool)

(declare-fun e!659353 () Bool)

(declare-fun mapRes!45422 () Bool)

(assert (=> b!1159500 (= e!659348 (and e!659353 mapRes!45422))))

(declare-fun condMapEmpty!45422 () Bool)

(declare-datatypes ((V!43881 0))(
  ( (V!43882 (val!14589 Int)) )
))
(declare-datatypes ((ValueCell!13823 0))(
  ( (ValueCellFull!13823 (v!17225 V!43881)) (EmptyCell!13823) )
))
(declare-datatypes ((array!74892 0))(
  ( (array!74893 (arr!36097 (Array (_ BitVec 32) ValueCell!13823)) (size!36635 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74892)

(declare-fun mapDefault!45422 () ValueCell!13823)

(assert (=> b!1159500 (= condMapEmpty!45422 (= (arr!36097 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13823)) mapDefault!45422)))))

(declare-fun res!769640 () Bool)

(declare-fun e!659355 () Bool)

(assert (=> start!98924 (=> (not res!769640) (not e!659355))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74894 0))(
  ( (array!74895 (arr!36098 (Array (_ BitVec 32) (_ BitVec 64))) (size!36636 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74894)

(assert (=> start!98924 (= res!769640 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36636 _keys!1208))))))

(assert (=> start!98924 e!659355))

(declare-fun tp_is_empty!29065 () Bool)

(assert (=> start!98924 tp_is_empty!29065))

(declare-fun array_inv!27734 (array!74894) Bool)

(assert (=> start!98924 (array_inv!27734 _keys!1208)))

(assert (=> start!98924 true))

(assert (=> start!98924 tp!86316))

(declare-fun array_inv!27735 (array!74892) Bool)

(assert (=> start!98924 (and (array_inv!27735 _values!996) e!659348)))

(declare-fun b!1159501 () Bool)

(declare-fun e!659363 () Bool)

(declare-fun e!659358 () Bool)

(assert (=> b!1159501 (= e!659363 e!659358)))

(declare-fun res!769652 () Bool)

(assert (=> b!1159501 (=> res!769652 e!659358)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1159501 (= res!769652 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43881)

(declare-fun lt!521206 () array!74894)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!18662 0))(
  ( (tuple2!18663 (_1!9342 (_ BitVec 64)) (_2!9342 V!43881)) )
))
(declare-datatypes ((List!25382 0))(
  ( (Nil!25379) (Cons!25378 (h!26587 tuple2!18662) (t!36900 List!25382)) )
))
(declare-datatypes ((ListLongMap!16631 0))(
  ( (ListLongMap!16632 (toList!8331 List!25382)) )
))
(declare-fun lt!521198 () ListLongMap!16631)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43881)

(declare-fun lt!521207 () array!74892)

(declare-fun getCurrentListMapNoExtraKeys!4810 (array!74894 array!74892 (_ BitVec 32) (_ BitVec 32) V!43881 V!43881 (_ BitVec 32) Int) ListLongMap!16631)

(assert (=> b!1159501 (= lt!521198 (getCurrentListMapNoExtraKeys!4810 lt!521206 lt!521207 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!521211 () V!43881)

(assert (=> b!1159501 (= lt!521207 (array!74893 (store (arr!36097 _values!996) i!673 (ValueCellFull!13823 lt!521211)) (size!36635 _values!996)))))

(declare-fun dynLambda!2756 (Int (_ BitVec 64)) V!43881)

(assert (=> b!1159501 (= lt!521211 (dynLambda!2756 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!521202 () ListLongMap!16631)

(assert (=> b!1159501 (= lt!521202 (getCurrentListMapNoExtraKeys!4810 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!659357 () Bool)

(declare-fun b!1159502 () Bool)

(declare-fun arrayContainsKey!0 (array!74894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1159502 (= e!659357 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159503 () Bool)

(assert (=> b!1159503 (= e!659353 tp_is_empty!29065)))

(declare-fun c!115647 () Bool)

(declare-fun lt!521209 () ListLongMap!16631)

(declare-fun bm!55937 () Bool)

(declare-fun call!55941 () ListLongMap!16631)

(declare-fun contains!6780 (ListLongMap!16631 (_ BitVec 64)) Bool)

(assert (=> bm!55937 (= call!55945 (contains!6780 (ite c!115647 lt!521209 call!55941) k0!934))))

(declare-fun b!1159504 () Bool)

(declare-fun e!659350 () Bool)

(assert (=> b!1159504 (= e!659350 true)))

(declare-fun e!659361 () Bool)

(assert (=> b!1159504 e!659361))

(declare-fun res!769651 () Bool)

(assert (=> b!1159504 (=> (not res!769651) (not e!659361))))

(declare-fun lt!521201 () ListLongMap!16631)

(declare-fun lt!521203 () ListLongMap!16631)

(assert (=> b!1159504 (= res!769651 (= lt!521201 lt!521203))))

(declare-fun -!1383 (ListLongMap!16631 (_ BitVec 64)) ListLongMap!16631)

(assert (=> b!1159504 (= lt!521201 (-!1383 lt!521202 k0!934))))

(declare-fun lt!521196 () V!43881)

(declare-fun +!3737 (ListLongMap!16631 tuple2!18662) ListLongMap!16631)

(assert (=> b!1159504 (= (-!1383 (+!3737 lt!521203 (tuple2!18663 (select (arr!36098 _keys!1208) from!1455) lt!521196)) (select (arr!36098 _keys!1208) from!1455)) lt!521203)))

(declare-fun lt!521210 () Unit!38061)

(declare-fun addThenRemoveForNewKeyIsSame!230 (ListLongMap!16631 (_ BitVec 64) V!43881) Unit!38061)

(assert (=> b!1159504 (= lt!521210 (addThenRemoveForNewKeyIsSame!230 lt!521203 (select (arr!36098 _keys!1208) from!1455) lt!521196))))

(declare-fun get!18422 (ValueCell!13823 V!43881) V!43881)

(assert (=> b!1159504 (= lt!521196 (get!18422 (select (arr!36097 _values!996) from!1455) lt!521211))))

(declare-fun lt!521212 () Unit!38061)

(declare-fun e!659359 () Unit!38061)

(assert (=> b!1159504 (= lt!521212 e!659359)))

(declare-fun c!115650 () Bool)

(assert (=> b!1159504 (= c!115650 (contains!6780 lt!521203 k0!934))))

(assert (=> b!1159504 (= lt!521203 (getCurrentListMapNoExtraKeys!4810 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45422 () Bool)

(assert (=> mapIsEmpty!45422 mapRes!45422))

(declare-fun b!1159505 () Bool)

(declare-fun c!115648 () Bool)

(assert (=> b!1159505 (= c!115648 (and (not lt!521199) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!659352 () Unit!38061)

(declare-fun e!659351 () Unit!38061)

(assert (=> b!1159505 (= e!659352 e!659351)))

(declare-fun call!55939 () ListLongMap!16631)

(declare-fun bm!55938 () Bool)

(assert (=> bm!55938 (= call!55939 (getCurrentListMapNoExtraKeys!4810 lt!521206 lt!521207 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159506 () Bool)

(declare-fun Unit!38064 () Unit!38061)

(assert (=> b!1159506 (= e!659359 Unit!38064)))

(declare-fun b!1159507 () Bool)

(assert (=> b!1159507 call!55940))

(declare-fun lt!521216 () Unit!38061)

(declare-fun call!55942 () Unit!38061)

(assert (=> b!1159507 (= lt!521216 call!55942)))

(assert (=> b!1159507 (= e!659349 lt!521216)))

(declare-fun b!1159508 () Bool)

(declare-fun res!769646 () Bool)

(assert (=> b!1159508 (=> (not res!769646) (not e!659355))))

(assert (=> b!1159508 (= res!769646 (and (= (size!36635 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36636 _keys!1208) (size!36635 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1159509 () Bool)

(declare-fun Unit!38065 () Unit!38061)

(assert (=> b!1159509 (= e!659359 Unit!38065)))

(assert (=> b!1159509 (= lt!521199 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1159509 (= c!115647 (and (not lt!521199) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521215 () Unit!38061)

(assert (=> b!1159509 (= lt!521215 e!659352)))

(declare-fun lt!521204 () Unit!38061)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!522 (array!74894 array!74892 (_ BitVec 32) (_ BitVec 32) V!43881 V!43881 (_ BitVec 64) (_ BitVec 32) Int) Unit!38061)

(assert (=> b!1159509 (= lt!521204 (lemmaListMapContainsThenArrayContainsFrom!522 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115652 () Bool)

(assert (=> b!1159509 (= c!115652 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769641 () Bool)

(assert (=> b!1159509 (= res!769641 e!659354)))

(assert (=> b!1159509 (=> (not res!769641) (not e!659357))))

(assert (=> b!1159509 e!659357))

(declare-fun lt!521208 () Unit!38061)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74894 (_ BitVec 32) (_ BitVec 32)) Unit!38061)

(assert (=> b!1159509 (= lt!521208 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25383 0))(
  ( (Nil!25380) (Cons!25379 (h!26588 (_ BitVec 64)) (t!36901 List!25383)) )
))
(declare-fun arrayNoDuplicates!0 (array!74894 (_ BitVec 32) List!25383) Bool)

(assert (=> b!1159509 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25380)))

(declare-fun lt!521205 () Unit!38061)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74894 (_ BitVec 64) (_ BitVec 32) List!25383) Unit!38061)

(assert (=> b!1159509 (= lt!521205 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25380))))

(assert (=> b!1159509 false))

(declare-fun b!1159510 () Bool)

(assert (=> b!1159510 (= e!659354 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun e!659356 () Bool)

(declare-fun b!1159511 () Bool)

(declare-fun call!55946 () ListLongMap!16631)

(assert (=> b!1159511 (= e!659356 (= call!55939 (-!1383 call!55946 k0!934)))))

(declare-fun b!1159512 () Bool)

(declare-fun e!659364 () Bool)

(assert (=> b!1159512 (= e!659355 e!659364)))

(declare-fun res!769644 () Bool)

(assert (=> b!1159512 (=> (not res!769644) (not e!659364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74894 (_ BitVec 32)) Bool)

(assert (=> b!1159512 (= res!769644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521206 mask!1564))))

(assert (=> b!1159512 (= lt!521206 (array!74895 (store (arr!36098 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36636 _keys!1208)))))

(declare-fun b!1159513 () Bool)

(assert (=> b!1159513 (contains!6780 (+!3737 lt!521209 (tuple2!18663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!521214 () Unit!38061)

(declare-fun addStillContains!945 (ListLongMap!16631 (_ BitVec 64) V!43881 (_ BitVec 64)) Unit!38061)

(assert (=> b!1159513 (= lt!521214 (addStillContains!945 lt!521209 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1159513 call!55945))

(declare-fun call!55943 () ListLongMap!16631)

(assert (=> b!1159513 (= lt!521209 call!55943)))

(declare-fun lt!521217 () Unit!38061)

(declare-fun call!55944 () Unit!38061)

(assert (=> b!1159513 (= lt!521217 call!55944)))

(assert (=> b!1159513 (= e!659352 lt!521214)))

(declare-fun b!1159514 () Bool)

(assert (=> b!1159514 (= e!659351 e!659349)))

(declare-fun c!115651 () Bool)

(assert (=> b!1159514 (= c!115651 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521199))))

(declare-fun bm!55939 () Bool)

(assert (=> bm!55939 (= call!55944 (addStillContains!945 lt!521203 (ite (or c!115647 c!115648) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115647 c!115648) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1159515 () Bool)

(declare-fun res!769649 () Bool)

(assert (=> b!1159515 (=> (not res!769649) (not e!659364))))

(assert (=> b!1159515 (= res!769649 (arrayNoDuplicates!0 lt!521206 #b00000000000000000000000000000000 Nil!25380))))

(declare-fun mapNonEmpty!45422 () Bool)

(declare-fun tp!86315 () Bool)

(declare-fun e!659362 () Bool)

(assert (=> mapNonEmpty!45422 (= mapRes!45422 (and tp!86315 e!659362))))

(declare-fun mapKey!45422 () (_ BitVec 32))

(declare-fun mapRest!45422 () (Array (_ BitVec 32) ValueCell!13823))

(declare-fun mapValue!45422 () ValueCell!13823)

(assert (=> mapNonEmpty!45422 (= (arr!36097 _values!996) (store mapRest!45422 mapKey!45422 mapValue!45422))))

(declare-fun b!1159516 () Bool)

(assert (=> b!1159516 (= e!659361 (= lt!521201 (getCurrentListMapNoExtraKeys!4810 lt!521206 lt!521207 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!55940 () Bool)

(assert (=> bm!55940 (= call!55942 call!55944)))

(declare-fun b!1159517 () Bool)

(declare-fun res!769650 () Bool)

(assert (=> b!1159517 (=> (not res!769650) (not e!659355))))

(assert (=> b!1159517 (= res!769650 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25380))))

(declare-fun b!1159518 () Bool)

(declare-fun res!769647 () Bool)

(assert (=> b!1159518 (=> (not res!769647) (not e!659355))))

(assert (=> b!1159518 (= res!769647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1159519 () Bool)

(assert (=> b!1159519 (= e!659358 e!659350)))

(declare-fun res!769645 () Bool)

(assert (=> b!1159519 (=> res!769645 e!659350)))

(assert (=> b!1159519 (= res!769645 (not (= (select (arr!36098 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1159519 e!659356))

(declare-fun c!115649 () Bool)

(assert (=> b!1159519 (= c!115649 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521197 () Unit!38061)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!651 (array!74894 array!74892 (_ BitVec 32) (_ BitVec 32) V!43881 V!43881 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38061)

(assert (=> b!1159519 (= lt!521197 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!651 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55941 () Bool)

(assert (=> bm!55941 (= call!55946 (getCurrentListMapNoExtraKeys!4810 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159520 () Bool)

(declare-fun lt!521200 () Unit!38061)

(assert (=> b!1159520 (= e!659351 lt!521200)))

(assert (=> b!1159520 (= lt!521200 call!55942)))

(assert (=> b!1159520 call!55940))

(declare-fun b!1159521 () Bool)

(assert (=> b!1159521 (= e!659364 (not e!659363))))

(declare-fun res!769638 () Bool)

(assert (=> b!1159521 (=> res!769638 e!659363)))

(assert (=> b!1159521 (= res!769638 (bvsgt from!1455 i!673))))

(assert (=> b!1159521 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!521213 () Unit!38061)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74894 (_ BitVec 64) (_ BitVec 32)) Unit!38061)

(assert (=> b!1159521 (= lt!521213 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1159522 () Bool)

(declare-fun res!769648 () Bool)

(assert (=> b!1159522 (=> (not res!769648) (not e!659355))))

(assert (=> b!1159522 (= res!769648 (= (select (arr!36098 _keys!1208) i!673) k0!934))))

(declare-fun b!1159523 () Bool)

(assert (=> b!1159523 (= e!659362 tp_is_empty!29065)))

(declare-fun b!1159524 () Bool)

(assert (=> b!1159524 (= e!659356 (= call!55939 call!55946))))

(declare-fun b!1159525 () Bool)

(declare-fun res!769639 () Bool)

(assert (=> b!1159525 (=> (not res!769639) (not e!659355))))

(assert (=> b!1159525 (= res!769639 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36636 _keys!1208))))))

(declare-fun b!1159526 () Bool)

(declare-fun res!769643 () Bool)

(assert (=> b!1159526 (=> (not res!769643) (not e!659355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1159526 (= res!769643 (validMask!0 mask!1564))))

(declare-fun bm!55942 () Bool)

(assert (=> bm!55942 (= call!55941 call!55943)))

(declare-fun bm!55943 () Bool)

(assert (=> bm!55943 (= call!55943 (+!3737 lt!521203 (ite (or c!115647 c!115648) (tuple2!18663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1159527 () Bool)

(declare-fun res!769642 () Bool)

(assert (=> b!1159527 (=> (not res!769642) (not e!659355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1159527 (= res!769642 (validKeyInArray!0 k0!934))))

(assert (= (and start!98924 res!769640) b!1159526))

(assert (= (and b!1159526 res!769643) b!1159508))

(assert (= (and b!1159508 res!769646) b!1159518))

(assert (= (and b!1159518 res!769647) b!1159517))

(assert (= (and b!1159517 res!769650) b!1159525))

(assert (= (and b!1159525 res!769639) b!1159527))

(assert (= (and b!1159527 res!769642) b!1159522))

(assert (= (and b!1159522 res!769648) b!1159512))

(assert (= (and b!1159512 res!769644) b!1159515))

(assert (= (and b!1159515 res!769649) b!1159521))

(assert (= (and b!1159521 (not res!769638)) b!1159501))

(assert (= (and b!1159501 (not res!769652)) b!1159519))

(assert (= (and b!1159519 c!115649) b!1159511))

(assert (= (and b!1159519 (not c!115649)) b!1159524))

(assert (= (or b!1159511 b!1159524) bm!55938))

(assert (= (or b!1159511 b!1159524) bm!55941))

(assert (= (and b!1159519 (not res!769645)) b!1159504))

(assert (= (and b!1159504 c!115650) b!1159509))

(assert (= (and b!1159504 (not c!115650)) b!1159506))

(assert (= (and b!1159509 c!115647) b!1159513))

(assert (= (and b!1159509 (not c!115647)) b!1159505))

(assert (= (and b!1159505 c!115648) b!1159520))

(assert (= (and b!1159505 (not c!115648)) b!1159514))

(assert (= (and b!1159514 c!115651) b!1159507))

(assert (= (and b!1159514 (not c!115651)) b!1159498))

(assert (= (or b!1159520 b!1159507) bm!55940))

(assert (= (or b!1159520 b!1159507) bm!55942))

(assert (= (or b!1159520 b!1159507) bm!55936))

(assert (= (or b!1159513 bm!55936) bm!55937))

(assert (= (or b!1159513 bm!55940) bm!55939))

(assert (= (or b!1159513 bm!55942) bm!55943))

(assert (= (and b!1159509 c!115652) b!1159510))

(assert (= (and b!1159509 (not c!115652)) b!1159499))

(assert (= (and b!1159509 res!769641) b!1159502))

(assert (= (and b!1159504 res!769651) b!1159516))

(assert (= (and b!1159500 condMapEmpty!45422) mapIsEmpty!45422))

(assert (= (and b!1159500 (not condMapEmpty!45422)) mapNonEmpty!45422))

(get-info :version)

(assert (= (and mapNonEmpty!45422 ((_ is ValueCellFull!13823) mapValue!45422)) b!1159523))

(assert (= (and b!1159500 ((_ is ValueCellFull!13823) mapDefault!45422)) b!1159503))

(assert (= start!98924 b!1159500))

(declare-fun b_lambda!19623 () Bool)

(assert (=> (not b_lambda!19623) (not b!1159501)))

(declare-fun t!36899 () Bool)

(declare-fun tb!9339 () Bool)

(assert (=> (and start!98924 (= defaultEntry!1004 defaultEntry!1004) t!36899) tb!9339))

(declare-fun result!19251 () Bool)

(assert (=> tb!9339 (= result!19251 tp_is_empty!29065)))

(assert (=> b!1159501 t!36899))

(declare-fun b_and!39899 () Bool)

(assert (= b_and!39897 (and (=> t!36899 result!19251) b_and!39899)))

(declare-fun m!1068075 () Bool)

(assert (=> b!1159509 m!1068075))

(declare-fun m!1068077 () Bool)

(assert (=> b!1159509 m!1068077))

(declare-fun m!1068079 () Bool)

(assert (=> b!1159509 m!1068079))

(declare-fun m!1068081 () Bool)

(assert (=> b!1159509 m!1068081))

(declare-fun m!1068083 () Bool)

(assert (=> b!1159527 m!1068083))

(declare-fun m!1068085 () Bool)

(assert (=> b!1159510 m!1068085))

(declare-fun m!1068087 () Bool)

(assert (=> start!98924 m!1068087))

(declare-fun m!1068089 () Bool)

(assert (=> start!98924 m!1068089))

(declare-fun m!1068091 () Bool)

(assert (=> b!1159512 m!1068091))

(declare-fun m!1068093 () Bool)

(assert (=> b!1159512 m!1068093))

(declare-fun m!1068095 () Bool)

(assert (=> b!1159501 m!1068095))

(declare-fun m!1068097 () Bool)

(assert (=> b!1159501 m!1068097))

(declare-fun m!1068099 () Bool)

(assert (=> b!1159501 m!1068099))

(declare-fun m!1068101 () Bool)

(assert (=> b!1159501 m!1068101))

(declare-fun m!1068103 () Bool)

(assert (=> bm!55938 m!1068103))

(declare-fun m!1068105 () Bool)

(assert (=> b!1159522 m!1068105))

(declare-fun m!1068107 () Bool)

(assert (=> bm!55943 m!1068107))

(declare-fun m!1068109 () Bool)

(assert (=> b!1159515 m!1068109))

(declare-fun m!1068111 () Bool)

(assert (=> b!1159526 m!1068111))

(declare-fun m!1068113 () Bool)

(assert (=> b!1159519 m!1068113))

(declare-fun m!1068115 () Bool)

(assert (=> b!1159519 m!1068115))

(declare-fun m!1068117 () Bool)

(assert (=> b!1159521 m!1068117))

(declare-fun m!1068119 () Bool)

(assert (=> b!1159521 m!1068119))

(declare-fun m!1068121 () Bool)

(assert (=> b!1159517 m!1068121))

(assert (=> b!1159516 m!1068103))

(declare-fun m!1068123 () Bool)

(assert (=> b!1159504 m!1068123))

(declare-fun m!1068125 () Bool)

(assert (=> b!1159504 m!1068125))

(assert (=> b!1159504 m!1068123))

(declare-fun m!1068127 () Bool)

(assert (=> b!1159504 m!1068127))

(assert (=> b!1159504 m!1068125))

(assert (=> b!1159504 m!1068113))

(declare-fun m!1068129 () Bool)

(assert (=> b!1159504 m!1068129))

(assert (=> b!1159504 m!1068113))

(declare-fun m!1068131 () Bool)

(assert (=> b!1159504 m!1068131))

(declare-fun m!1068133 () Bool)

(assert (=> b!1159504 m!1068133))

(assert (=> b!1159504 m!1068113))

(declare-fun m!1068135 () Bool)

(assert (=> b!1159504 m!1068135))

(declare-fun m!1068137 () Bool)

(assert (=> b!1159504 m!1068137))

(declare-fun m!1068139 () Bool)

(assert (=> bm!55939 m!1068139))

(declare-fun m!1068141 () Bool)

(assert (=> mapNonEmpty!45422 m!1068141))

(assert (=> b!1159502 m!1068085))

(declare-fun m!1068143 () Bool)

(assert (=> b!1159511 m!1068143))

(declare-fun m!1068145 () Bool)

(assert (=> b!1159518 m!1068145))

(declare-fun m!1068147 () Bool)

(assert (=> b!1159513 m!1068147))

(assert (=> b!1159513 m!1068147))

(declare-fun m!1068149 () Bool)

(assert (=> b!1159513 m!1068149))

(declare-fun m!1068151 () Bool)

(assert (=> b!1159513 m!1068151))

(assert (=> bm!55941 m!1068137))

(declare-fun m!1068153 () Bool)

(assert (=> bm!55937 m!1068153))

(check-sat b_and!39899 (not b!1159516) (not b!1159504) (not b!1159519) (not b!1159518) (not b!1159517) (not b_lambda!19623) (not bm!55939) tp_is_empty!29065 (not b!1159510) (not b!1159502) (not bm!55943) (not bm!55937) (not bm!55941) (not b!1159512) (not b!1159501) (not b!1159513) (not b_next!24535) (not b!1159511) (not start!98924) (not mapNonEmpty!45422) (not b!1159527) (not b!1159515) (not b!1159509) (not b!1159521) (not b!1159526) (not bm!55938))
(check-sat b_and!39899 (not b_next!24535))
