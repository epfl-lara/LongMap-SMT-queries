; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98660 () Bool)

(assert start!98660)

(declare-fun b_free!24265 () Bool)

(declare-fun b_next!24265 () Bool)

(assert (=> start!98660 (= b_free!24265 (not b_next!24265))))

(declare-fun tp!85506 () Bool)

(declare-fun b_and!39379 () Bool)

(assert (=> start!98660 (= tp!85506 b_and!39379)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!652556 () Bool)

(declare-datatypes ((array!74437 0))(
  ( (array!74438 (arr!35869 (Array (_ BitVec 32) (_ BitVec 64))) (size!36405 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74437)

(declare-fun b!1147202 () Bool)

(declare-fun arrayContainsKey!0 (array!74437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147202 (= e!652556 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147203 () Bool)

(declare-fun res!763639 () Bool)

(declare-fun e!652543 () Bool)

(assert (=> b!1147203 (=> (not res!763639) (not e!652543))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43521 0))(
  ( (V!43522 (val!14454 Int)) )
))
(declare-datatypes ((ValueCell!13688 0))(
  ( (ValueCellFull!13688 (v!17091 V!43521)) (EmptyCell!13688) )
))
(declare-datatypes ((array!74439 0))(
  ( (array!74440 (arr!35870 (Array (_ BitVec 32) ValueCell!13688)) (size!36406 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74439)

(assert (=> b!1147203 (= res!763639 (and (= (size!36406 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36405 _keys!1208) (size!36406 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!52719 () Bool)

(declare-datatypes ((tuple2!18320 0))(
  ( (tuple2!18321 (_1!9171 (_ BitVec 64)) (_2!9171 V!43521)) )
))
(declare-datatypes ((List!25071 0))(
  ( (Nil!25068) (Cons!25067 (h!26276 tuple2!18320) (t!36328 List!25071)) )
))
(declare-datatypes ((ListLongMap!16289 0))(
  ( (ListLongMap!16290 (toList!8160 List!25071)) )
))
(declare-fun call!52723 () ListLongMap!16289)

(declare-fun call!52727 () ListLongMap!16289)

(assert (=> bm!52719 (= call!52723 call!52727)))

(declare-fun b!1147204 () Bool)

(declare-fun call!52726 () Bool)

(assert (=> b!1147204 call!52726))

(declare-datatypes ((Unit!37678 0))(
  ( (Unit!37679) )
))
(declare-fun lt!512541 () Unit!37678)

(declare-fun call!52722 () Unit!37678)

(assert (=> b!1147204 (= lt!512541 call!52722)))

(declare-fun e!652548 () Unit!37678)

(assert (=> b!1147204 (= e!652548 lt!512541)))

(declare-fun b!1147205 () Bool)

(declare-fun e!652557 () Bool)

(declare-fun e!652552 () Bool)

(assert (=> b!1147205 (= e!652557 (not e!652552))))

(declare-fun res!763629 () Bool)

(assert (=> b!1147205 (=> res!763629 e!652552)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147205 (= res!763629 (bvsgt from!1455 i!673))))

(assert (=> b!1147205 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!512544 () Unit!37678)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74437 (_ BitVec 64) (_ BitVec 32)) Unit!37678)

(assert (=> b!1147205 (= lt!512544 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1147206 () Bool)

(declare-fun e!652545 () Bool)

(declare-fun e!652546 () Bool)

(assert (=> b!1147206 (= e!652545 e!652546)))

(declare-fun res!763634 () Bool)

(assert (=> b!1147206 (=> res!763634 e!652546)))

(assert (=> b!1147206 (= res!763634 (not (= (select (arr!35869 _keys!1208) from!1455) k!934)))))

(declare-fun e!652551 () Bool)

(assert (=> b!1147206 e!652551))

(declare-fun c!113247 () Bool)

(assert (=> b!1147206 (= c!113247 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43521)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43521)

(declare-fun lt!512550 () Unit!37678)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!534 (array!74437 array!74439 (_ BitVec 32) (_ BitVec 32) V!43521 V!43521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37678)

(assert (=> b!1147206 (= lt!512550 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!534 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147207 () Bool)

(declare-fun c!113248 () Bool)

(declare-fun lt!512546 () Bool)

(assert (=> b!1147207 (= c!113248 (and (not lt!512546) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!652544 () Unit!37678)

(declare-fun e!652547 () Unit!37678)

(assert (=> b!1147207 (= e!652544 e!652547)))

(declare-fun b!1147208 () Bool)

(declare-fun e!652555 () Unit!37678)

(declare-fun Unit!37680 () Unit!37678)

(assert (=> b!1147208 (= e!652555 Unit!37680)))

(assert (=> b!1147208 (= lt!512546 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113244 () Bool)

(assert (=> b!1147208 (= c!113244 (and (not lt!512546) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512555 () Unit!37678)

(assert (=> b!1147208 (= lt!512555 e!652544)))

(declare-fun lt!512556 () Unit!37678)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!429 (array!74437 array!74439 (_ BitVec 32) (_ BitVec 32) V!43521 V!43521 (_ BitVec 64) (_ BitVec 32) Int) Unit!37678)

(assert (=> b!1147208 (= lt!512556 (lemmaListMapContainsThenArrayContainsFrom!429 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113245 () Bool)

(assert (=> b!1147208 (= c!113245 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763640 () Bool)

(declare-fun e!652554 () Bool)

(assert (=> b!1147208 (= res!763640 e!652554)))

(assert (=> b!1147208 (=> (not res!763640) (not e!652556))))

(assert (=> b!1147208 e!652556))

(declare-fun lt!512542 () Unit!37678)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74437 (_ BitVec 32) (_ BitVec 32)) Unit!37678)

(assert (=> b!1147208 (= lt!512542 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25072 0))(
  ( (Nil!25069) (Cons!25068 (h!26277 (_ BitVec 64)) (t!36329 List!25072)) )
))
(declare-fun arrayNoDuplicates!0 (array!74437 (_ BitVec 32) List!25072) Bool)

(assert (=> b!1147208 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25069)))

(declare-fun lt!512551 () Unit!37678)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74437 (_ BitVec 64) (_ BitVec 32) List!25072) Unit!37678)

(assert (=> b!1147208 (= lt!512551 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25069))))

(assert (=> b!1147208 false))

(declare-fun b!1147209 () Bool)

(declare-fun res!763643 () Bool)

(assert (=> b!1147209 (=> (not res!763643) (not e!652543))))

(assert (=> b!1147209 (= res!763643 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36405 _keys!1208))))))

(declare-fun b!1147210 () Bool)

(assert (=> b!1147210 (= e!652554 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52720 () Bool)

(declare-fun call!52724 () Unit!37678)

(assert (=> bm!52720 (= call!52722 call!52724)))

(declare-fun lt!512549 () ListLongMap!16289)

(declare-fun e!652542 () Bool)

(declare-fun lt!512558 () ListLongMap!16289)

(declare-fun b!1147211 () Bool)

(declare-fun -!1296 (ListLongMap!16289 (_ BitVec 64)) ListLongMap!16289)

(assert (=> b!1147211 (= e!652542 (= (-!1296 lt!512549 k!934) lt!512558))))

(declare-fun b!1147212 () Bool)

(declare-fun e!652553 () Bool)

(declare-fun tp_is_empty!28795 () Bool)

(assert (=> b!1147212 (= e!652553 tp_is_empty!28795)))

(declare-fun bm!52721 () Bool)

(declare-fun lt!512559 () array!74437)

(declare-fun lt!512552 () array!74439)

(declare-fun call!52725 () ListLongMap!16289)

(declare-fun getCurrentListMapNoExtraKeys!4634 (array!74437 array!74439 (_ BitVec 32) (_ BitVec 32) V!43521 V!43521 (_ BitVec 32) Int) ListLongMap!16289)

(assert (=> bm!52721 (= call!52725 (getCurrentListMapNoExtraKeys!4634 lt!512559 lt!512552 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147213 () Bool)

(assert (=> b!1147213 (= e!652543 e!652557)))

(declare-fun res!763631 () Bool)

(assert (=> b!1147213 (=> (not res!763631) (not e!652557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74437 (_ BitVec 32)) Bool)

(assert (=> b!1147213 (= res!763631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512559 mask!1564))))

(assert (=> b!1147213 (= lt!512559 (array!74438 (store (arr!35869 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36405 _keys!1208)))))

(declare-fun b!1147214 () Bool)

(assert (=> b!1147214 (= e!652554 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512546) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1147215 () Bool)

(declare-fun Unit!37681 () Unit!37678)

(assert (=> b!1147215 (= e!652555 Unit!37681)))

(declare-fun b!1147216 () Bool)

(declare-fun res!763638 () Bool)

(assert (=> b!1147216 (=> (not res!763638) (not e!652557))))

(assert (=> b!1147216 (= res!763638 (arrayNoDuplicates!0 lt!512559 #b00000000000000000000000000000000 Nil!25069))))

(declare-fun b!1147217 () Bool)

(declare-fun res!763635 () Bool)

(assert (=> b!1147217 (=> (not res!763635) (not e!652543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147217 (= res!763635 (validMask!0 mask!1564))))

(declare-fun b!1147218 () Bool)

(declare-fun res!763630 () Bool)

(assert (=> b!1147218 (=> (not res!763630) (not e!652543))))

(assert (=> b!1147218 (= res!763630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun lt!512548 () ListLongMap!16289)

(declare-fun call!52728 () Bool)

(declare-fun bm!52722 () Bool)

(declare-fun contains!6683 (ListLongMap!16289 (_ BitVec 64)) Bool)

(assert (=> bm!52722 (= call!52728 (contains!6683 (ite c!113244 lt!512548 call!52723) k!934))))

(declare-fun b!1147219 () Bool)

(assert (=> b!1147219 (= e!652546 true)))

(assert (=> b!1147219 e!652542))

(declare-fun res!763637 () Bool)

(assert (=> b!1147219 (=> (not res!763637) (not e!652542))))

(declare-fun lt!512545 () V!43521)

(declare-fun +!3583 (ListLongMap!16289 tuple2!18320) ListLongMap!16289)

(assert (=> b!1147219 (= res!763637 (= (-!1296 (+!3583 lt!512558 (tuple2!18321 (select (arr!35869 _keys!1208) from!1455) lt!512545)) (select (arr!35869 _keys!1208) from!1455)) lt!512558))))

(declare-fun lt!512554 () Unit!37678)

(declare-fun addThenRemoveForNewKeyIsSame!144 (ListLongMap!16289 (_ BitVec 64) V!43521) Unit!37678)

(assert (=> b!1147219 (= lt!512554 (addThenRemoveForNewKeyIsSame!144 lt!512558 (select (arr!35869 _keys!1208) from!1455) lt!512545))))

(declare-fun lt!512547 () V!43521)

(declare-fun get!18246 (ValueCell!13688 V!43521) V!43521)

(assert (=> b!1147219 (= lt!512545 (get!18246 (select (arr!35870 _values!996) from!1455) lt!512547))))

(declare-fun lt!512540 () Unit!37678)

(assert (=> b!1147219 (= lt!512540 e!652555)))

(declare-fun c!113243 () Bool)

(assert (=> b!1147219 (= c!113243 (contains!6683 lt!512558 k!934))))

(assert (=> b!1147219 (= lt!512558 (getCurrentListMapNoExtraKeys!4634 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147220 () Bool)

(declare-fun e!652541 () Bool)

(assert (=> b!1147220 (= e!652541 tp_is_empty!28795)))

(declare-fun call!52729 () ListLongMap!16289)

(declare-fun bm!52723 () Bool)

(assert (=> bm!52723 (= call!52729 (getCurrentListMapNoExtraKeys!4634 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52724 () Bool)

(assert (=> bm!52724 (= call!52727 (+!3583 (ite c!113244 lt!512548 lt!512558) (ite c!113244 (tuple2!18321 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113248 (tuple2!18321 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18321 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1147221 () Bool)

(assert (=> b!1147221 (= e!652551 (= call!52725 call!52729))))

(declare-fun b!1147222 () Bool)

(assert (=> b!1147222 (= e!652552 e!652545)))

(declare-fun res!763642 () Bool)

(assert (=> b!1147222 (=> res!763642 e!652545)))

(assert (=> b!1147222 (= res!763642 (not (= from!1455 i!673)))))

(declare-fun lt!512557 () ListLongMap!16289)

(assert (=> b!1147222 (= lt!512557 (getCurrentListMapNoExtraKeys!4634 lt!512559 lt!512552 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1147222 (= lt!512552 (array!74440 (store (arr!35870 _values!996) i!673 (ValueCellFull!13688 lt!512547)) (size!36406 _values!996)))))

(declare-fun dynLambda!2664 (Int (_ BitVec 64)) V!43521)

(assert (=> b!1147222 (= lt!512547 (dynLambda!2664 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1147222 (= lt!512549 (getCurrentListMapNoExtraKeys!4634 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!763641 () Bool)

(assert (=> start!98660 (=> (not res!763641) (not e!652543))))

(assert (=> start!98660 (= res!763641 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36405 _keys!1208))))))

(assert (=> start!98660 e!652543))

(assert (=> start!98660 tp_is_empty!28795))

(declare-fun array_inv!27474 (array!74437) Bool)

(assert (=> start!98660 (array_inv!27474 _keys!1208)))

(assert (=> start!98660 true))

(assert (=> start!98660 tp!85506))

(declare-fun e!652549 () Bool)

(declare-fun array_inv!27475 (array!74439) Bool)

(assert (=> start!98660 (and (array_inv!27475 _values!996) e!652549)))

(declare-fun bm!52725 () Bool)

(declare-fun addStillContains!835 (ListLongMap!16289 (_ BitVec 64) V!43521 (_ BitVec 64)) Unit!37678)

(assert (=> bm!52725 (= call!52724 (addStillContains!835 lt!512558 (ite (or c!113244 c!113248) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113244 c!113248) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1147223 () Bool)

(declare-fun lt!512543 () Unit!37678)

(assert (=> b!1147223 (= e!652547 lt!512543)))

(assert (=> b!1147223 (= lt!512543 call!52722)))

(assert (=> b!1147223 call!52726))

(declare-fun b!1147224 () Bool)

(declare-fun res!763633 () Bool)

(assert (=> b!1147224 (=> (not res!763633) (not e!652543))))

(assert (=> b!1147224 (= res!763633 (= (select (arr!35869 _keys!1208) i!673) k!934))))

(declare-fun b!1147225 () Bool)

(assert (=> b!1147225 (= e!652547 e!652548)))

(declare-fun c!113246 () Bool)

(assert (=> b!1147225 (= c!113246 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512546))))

(declare-fun mapIsEmpty!45017 () Bool)

(declare-fun mapRes!45017 () Bool)

(assert (=> mapIsEmpty!45017 mapRes!45017))

(declare-fun b!1147226 () Bool)

(assert (=> b!1147226 (= e!652551 (= call!52725 (-!1296 call!52729 k!934)))))

(declare-fun b!1147227 () Bool)

(declare-fun res!763632 () Bool)

(assert (=> b!1147227 (=> (not res!763632) (not e!652543))))

(assert (=> b!1147227 (= res!763632 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25069))))

(declare-fun b!1147228 () Bool)

(assert (=> b!1147228 (= e!652549 (and e!652553 mapRes!45017))))

(declare-fun condMapEmpty!45017 () Bool)

(declare-fun mapDefault!45017 () ValueCell!13688)

