; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98924 () Bool)

(assert start!98924)

(declare-fun b_free!24529 () Bool)

(declare-fun b_next!24529 () Bool)

(assert (=> start!98924 (= b_free!24529 (not b_next!24529))))

(declare-fun tp!86297 () Bool)

(declare-fun b_and!39907 () Bool)

(assert (=> start!98924 (= tp!86297 b_and!39907)))

(declare-datatypes ((array!74959 0))(
  ( (array!74960 (arr!36130 (Array (_ BitVec 32) (_ BitVec 64))) (size!36666 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74959)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!43873 0))(
  ( (V!43874 (val!14586 Int)) )
))
(declare-datatypes ((ValueCell!13820 0))(
  ( (ValueCellFull!13820 (v!17223 V!43873)) (EmptyCell!13820) )
))
(declare-datatypes ((array!74961 0))(
  ( (array!74962 (arr!36131 (Array (_ BitVec 32) ValueCell!13820)) (size!36667 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74961)

(declare-fun bm!55887 () Bool)

(declare-fun zeroValue!944 () V!43873)

(declare-datatypes ((tuple2!18570 0))(
  ( (tuple2!18571 (_1!9296 (_ BitVec 64)) (_2!9296 V!43873)) )
))
(declare-datatypes ((List!25308 0))(
  ( (Nil!25305) (Cons!25304 (h!26513 tuple2!18570) (t!36829 List!25308)) )
))
(declare-datatypes ((ListLongMap!16539 0))(
  ( (ListLongMap!16540 (toList!8285 List!25308)) )
))
(declare-fun call!55892 () ListLongMap!16539)

(declare-fun minValue!944 () V!43873)

(declare-fun getCurrentListMapNoExtraKeys!4749 (array!74959 array!74961 (_ BitVec 32) (_ BitVec 32) V!43873 V!43873 (_ BitVec 32) Int) ListLongMap!16539)

(assert (=> bm!55887 (= call!55892 (getCurrentListMapNoExtraKeys!4749 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1159346 () Bool)

(declare-fun e!659288 () Bool)

(declare-fun arrayContainsKey!0 (array!74959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1159346 (= e!659288 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159347 () Bool)

(declare-fun e!659278 () Bool)

(declare-fun tp_is_empty!29059 () Bool)

(assert (=> b!1159347 (= e!659278 tp_is_empty!29059)))

(declare-fun b!1159348 () Bool)

(declare-datatypes ((Unit!38207 0))(
  ( (Unit!38208) )
))
(declare-fun e!659284 () Unit!38207)

(declare-fun Unit!38209 () Unit!38207)

(assert (=> b!1159348 (= e!659284 Unit!38209)))

(declare-fun bm!55888 () Bool)

(declare-fun call!55891 () Bool)

(declare-fun call!55895 () Bool)

(assert (=> bm!55888 (= call!55891 call!55895)))

(declare-fun b!1159349 () Bool)

(declare-fun res!769577 () Bool)

(declare-fun e!659279 () Bool)

(assert (=> b!1159349 (=> (not res!769577) (not e!659279))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1159349 (= res!769577 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36666 _keys!1208))))))

(declare-fun b!1159350 () Bool)

(declare-fun e!659276 () Bool)

(assert (=> b!1159350 (= e!659279 e!659276)))

(declare-fun res!769579 () Bool)

(assert (=> b!1159350 (=> (not res!769579) (not e!659276))))

(declare-fun lt!521206 () array!74959)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74959 (_ BitVec 32)) Bool)

(assert (=> b!1159350 (= res!769579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521206 mask!1564))))

(assert (=> b!1159350 (= lt!521206 (array!74960 (store (arr!36130 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36666 _keys!1208)))))

(declare-fun b!1159351 () Bool)

(declare-fun e!659287 () Bool)

(assert (=> b!1159351 (= e!659276 (not e!659287))))

(declare-fun res!769574 () Bool)

(assert (=> b!1159351 (=> res!769574 e!659287)))

(assert (=> b!1159351 (= res!769574 (bvsgt from!1455 i!673))))

(assert (=> b!1159351 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!521190 () Unit!38207)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74959 (_ BitVec 64) (_ BitVec 32)) Unit!38207)

(assert (=> b!1159351 (= lt!521190 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1159352 () Bool)

(declare-fun Unit!38210 () Unit!38207)

(assert (=> b!1159352 (= e!659284 Unit!38210)))

(declare-fun lt!521194 () Bool)

(assert (=> b!1159352 (= lt!521194 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115623 () Bool)

(assert (=> b!1159352 (= c!115623 (and (not lt!521194) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521192 () Unit!38207)

(declare-fun e!659286 () Unit!38207)

(assert (=> b!1159352 (= lt!521192 e!659286)))

(declare-fun lt!521207 () Unit!38207)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!520 (array!74959 array!74961 (_ BitVec 32) (_ BitVec 32) V!43873 V!43873 (_ BitVec 64) (_ BitVec 32) Int) Unit!38207)

(assert (=> b!1159352 (= lt!521207 (lemmaListMapContainsThenArrayContainsFrom!520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115620 () Bool)

(assert (=> b!1159352 (= c!115620 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769578 () Bool)

(declare-fun e!659283 () Bool)

(assert (=> b!1159352 (= res!769578 e!659283)))

(assert (=> b!1159352 (=> (not res!769578) (not e!659288))))

(assert (=> b!1159352 e!659288))

(declare-fun lt!521197 () Unit!38207)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74959 (_ BitVec 32) (_ BitVec 32)) Unit!38207)

(assert (=> b!1159352 (= lt!521197 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25309 0))(
  ( (Nil!25306) (Cons!25305 (h!26514 (_ BitVec 64)) (t!36830 List!25309)) )
))
(declare-fun arrayNoDuplicates!0 (array!74959 (_ BitVec 32) List!25309) Bool)

(assert (=> b!1159352 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25306)))

(declare-fun lt!521202 () Unit!38207)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74959 (_ BitVec 64) (_ BitVec 32) List!25309) Unit!38207)

(assert (=> b!1159352 (= lt!521202 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25306))))

(assert (=> b!1159352 false))

(declare-fun b!1159353 () Bool)

(declare-fun res!769570 () Bool)

(assert (=> b!1159353 (=> (not res!769570) (not e!659279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1159353 (= res!769570 (validKeyInArray!0 k!934))))

(declare-fun b!1159354 () Bool)

(declare-fun e!659274 () Bool)

(declare-fun mapRes!45413 () Bool)

(assert (=> b!1159354 (= e!659274 (and e!659278 mapRes!45413))))

(declare-fun condMapEmpty!45413 () Bool)

(declare-fun mapDefault!45413 () ValueCell!13820)

