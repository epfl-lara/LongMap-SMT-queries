; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98930 () Bool)

(assert start!98930)

(declare-fun b_free!24535 () Bool)

(declare-fun b_next!24535 () Bool)

(assert (=> start!98930 (= b_free!24535 (not b_next!24535))))

(declare-fun tp!86315 () Bool)

(declare-fun b_and!39919 () Bool)

(assert (=> start!98930 (= tp!86315 b_and!39919)))

(declare-fun b!1159622 () Bool)

(declare-fun c!115678 () Bool)

(declare-fun lt!521402 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1159622 (= c!115678 (and (not lt!521402) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38221 0))(
  ( (Unit!38222) )
))
(declare-fun e!659440 () Unit!38221)

(declare-fun e!659435 () Unit!38221)

(assert (=> b!1159622 (= e!659440 e!659435)))

(declare-fun b!1159623 () Bool)

(declare-fun res!769718 () Bool)

(declare-fun e!659432 () Bool)

(assert (=> b!1159623 (=> (not res!769718) (not e!659432))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1159623 (= res!769718 (validMask!0 mask!1564))))

(declare-fun b!1159624 () Bool)

(declare-fun e!659426 () Bool)

(declare-fun e!659427 () Bool)

(assert (=> b!1159624 (= e!659426 (not e!659427))))

(declare-fun res!769715 () Bool)

(assert (=> b!1159624 (=> res!769715 e!659427)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1159624 (= res!769715 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74971 0))(
  ( (array!74972 (arr!36136 (Array (_ BitVec 32) (_ BitVec 64))) (size!36672 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74971)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1159624 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!521397 () Unit!38221)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74971 (_ BitVec 64) (_ BitVec 32)) Unit!38221)

(assert (=> b!1159624 (= lt!521397 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1159625 () Bool)

(declare-fun res!769712 () Bool)

(assert (=> b!1159625 (=> (not res!769712) (not e!659426))))

(declare-fun lt!521398 () array!74971)

(declare-datatypes ((List!25314 0))(
  ( (Nil!25311) (Cons!25310 (h!26519 (_ BitVec 64)) (t!36841 List!25314)) )
))
(declare-fun arrayNoDuplicates!0 (array!74971 (_ BitVec 32) List!25314) Bool)

(assert (=> b!1159625 (= res!769712 (arrayNoDuplicates!0 lt!521398 #b00000000000000000000000000000000 Nil!25311))))

(declare-fun bm!55959 () Bool)

(declare-fun call!55963 () Bool)

(declare-fun call!55962 () Bool)

(assert (=> bm!55959 (= call!55963 call!55962)))

(declare-fun b!1159626 () Bool)

(declare-fun lt!521400 () Unit!38221)

(assert (=> b!1159626 (= e!659435 lt!521400)))

(declare-fun call!55969 () Unit!38221)

(assert (=> b!1159626 (= lt!521400 call!55969)))

(assert (=> b!1159626 call!55963))

(declare-fun b!1159628 () Bool)

(assert (=> b!1159628 call!55963))

(declare-fun lt!521408 () Unit!38221)

(assert (=> b!1159628 (= lt!521408 call!55969)))

(declare-fun e!659439 () Unit!38221)

(assert (=> b!1159628 (= e!659439 lt!521408)))

(declare-fun b!1159629 () Bool)

(assert (=> b!1159629 (= e!659435 e!659439)))

(declare-fun c!115674 () Bool)

(assert (=> b!1159629 (= c!115674 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521402))))

(declare-fun b!1159630 () Bool)

(declare-fun res!769716 () Bool)

(assert (=> b!1159630 (=> (not res!769716) (not e!659432))))

(declare-datatypes ((V!43881 0))(
  ( (V!43882 (val!14589 Int)) )
))
(declare-datatypes ((ValueCell!13823 0))(
  ( (ValueCellFull!13823 (v!17226 V!43881)) (EmptyCell!13823) )
))
(declare-datatypes ((array!74973 0))(
  ( (array!74974 (arr!36137 (Array (_ BitVec 32) ValueCell!13823)) (size!36673 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74973)

(assert (=> b!1159630 (= res!769716 (and (= (size!36673 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36672 _keys!1208) (size!36673 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1159631 () Bool)

(declare-fun e!659436 () Bool)

(declare-fun tp_is_empty!29065 () Bool)

(assert (=> b!1159631 (= e!659436 tp_is_empty!29065)))

(declare-fun b!1159632 () Bool)

(declare-fun e!659434 () Unit!38221)

(declare-fun Unit!38223 () Unit!38221)

(assert (=> b!1159632 (= e!659434 Unit!38223)))

(declare-datatypes ((tuple2!18576 0))(
  ( (tuple2!18577 (_1!9299 (_ BitVec 64)) (_2!9299 V!43881)) )
))
(declare-datatypes ((List!25315 0))(
  ( (Nil!25312) (Cons!25311 (h!26520 tuple2!18576) (t!36842 List!25315)) )
))
(declare-datatypes ((ListLongMap!16545 0))(
  ( (ListLongMap!16546 (toList!8288 List!25315)) )
))
(declare-fun call!55965 () ListLongMap!16545)

(declare-fun e!659437 () Bool)

(declare-fun b!1159633 () Bool)

(declare-fun call!55967 () ListLongMap!16545)

(declare-fun -!1398 (ListLongMap!16545 (_ BitVec 64)) ListLongMap!16545)

(assert (=> b!1159633 (= e!659437 (= call!55967 (-!1398 call!55965 k!934)))))

(declare-fun e!659433 () Bool)

(declare-fun b!1159634 () Bool)

(assert (=> b!1159634 (= e!659433 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159635 () Bool)

(assert (=> b!1159635 (= e!659433 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521402) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1159636 () Bool)

(declare-fun e!659438 () Bool)

(declare-fun e!659441 () Bool)

(assert (=> b!1159636 (= e!659438 e!659441)))

(declare-fun res!769708 () Bool)

(assert (=> b!1159636 (=> res!769708 e!659441)))

(assert (=> b!1159636 (= res!769708 (not (= (select (arr!36136 _keys!1208) from!1455) k!934)))))

(assert (=> b!1159636 e!659437))

(declare-fun c!115675 () Bool)

(assert (=> b!1159636 (= c!115675 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43881)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!521392 () Unit!38221)

(declare-fun minValue!944 () V!43881)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!629 (array!74971 array!74973 (_ BitVec 32) (_ BitVec 32) V!43881 V!43881 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38221)

(assert (=> b!1159636 (= lt!521392 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!629 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159637 () Bool)

(declare-fun res!769707 () Bool)

(assert (=> b!1159637 (=> (not res!769707) (not e!659432))))

(assert (=> b!1159637 (= res!769707 (= (select (arr!36136 _keys!1208) i!673) k!934))))

(declare-fun b!1159638 () Bool)

(declare-fun res!769713 () Bool)

(assert (=> b!1159638 (=> (not res!769713) (not e!659432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74971 (_ BitVec 32)) Bool)

(assert (=> b!1159638 (= res!769713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun lt!521405 () array!74973)

(declare-fun bm!55960 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4752 (array!74971 array!74973 (_ BitVec 32) (_ BitVec 32) V!43881 V!43881 (_ BitVec 32) Int) ListLongMap!16545)

(assert (=> bm!55960 (= call!55967 (getCurrentListMapNoExtraKeys!4752 lt!521398 lt!521405 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159639 () Bool)

(declare-fun res!769710 () Bool)

(assert (=> b!1159639 (=> (not res!769710) (not e!659432))))

(assert (=> b!1159639 (= res!769710 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25311))))

(declare-fun b!1159640 () Bool)

(declare-fun Unit!38224 () Unit!38221)

(assert (=> b!1159640 (= e!659434 Unit!38224)))

(assert (=> b!1159640 (= lt!521402 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115676 () Bool)

(assert (=> b!1159640 (= c!115676 (and (not lt!521402) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521394 () Unit!38221)

(assert (=> b!1159640 (= lt!521394 e!659440)))

(declare-fun lt!521407 () Unit!38221)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!523 (array!74971 array!74973 (_ BitVec 32) (_ BitVec 32) V!43881 V!43881 (_ BitVec 64) (_ BitVec 32) Int) Unit!38221)

(assert (=> b!1159640 (= lt!521407 (lemmaListMapContainsThenArrayContainsFrom!523 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115673 () Bool)

(assert (=> b!1159640 (= c!115673 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769705 () Bool)

(assert (=> b!1159640 (= res!769705 e!659433)))

(declare-fun e!659431 () Bool)

(assert (=> b!1159640 (=> (not res!769705) (not e!659431))))

(assert (=> b!1159640 e!659431))

(declare-fun lt!521391 () Unit!38221)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74971 (_ BitVec 32) (_ BitVec 32)) Unit!38221)

(assert (=> b!1159640 (= lt!521391 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1159640 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25311)))

(declare-fun lt!521393 () Unit!38221)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74971 (_ BitVec 64) (_ BitVec 32) List!25314) Unit!38221)

(assert (=> b!1159640 (= lt!521393 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25311))))

(assert (=> b!1159640 false))

(declare-fun mapNonEmpty!45422 () Bool)

(declare-fun mapRes!45422 () Bool)

(declare-fun tp!86316 () Bool)

(assert (=> mapNonEmpty!45422 (= mapRes!45422 (and tp!86316 e!659436))))

(declare-fun mapRest!45422 () (Array (_ BitVec 32) ValueCell!13823))

(declare-fun mapValue!45422 () ValueCell!13823)

(declare-fun mapKey!45422 () (_ BitVec 32))

(assert (=> mapNonEmpty!45422 (= (arr!36137 _values!996) (store mapRest!45422 mapKey!45422 mapValue!45422))))

(declare-fun b!1159641 () Bool)

(declare-fun e!659430 () Bool)

(declare-fun e!659428 () Bool)

(assert (=> b!1159641 (= e!659430 (and e!659428 mapRes!45422))))

(declare-fun condMapEmpty!45422 () Bool)

(declare-fun mapDefault!45422 () ValueCell!13823)

