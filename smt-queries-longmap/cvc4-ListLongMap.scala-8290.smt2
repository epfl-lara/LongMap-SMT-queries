; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101016 () Bool)

(assert start!101016)

(declare-fun b_free!26015 () Bool)

(declare-fun b_next!26015 () Bool)

(assert (=> start!101016 (= b_free!26015 (not b_next!26015))))

(declare-fun tp!91060 () Bool)

(declare-fun b_and!43111 () Bool)

(assert (=> start!101016 (= tp!91060 b_and!43111)))

(declare-fun lt!549549 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1210392 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!687407 () Bool)

(assert (=> b!1210392 (= e!687407 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549549) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!59618 () Bool)

(declare-datatypes ((Unit!40124 0))(
  ( (Unit!40125) )
))
(declare-fun call!59628 () Unit!40124)

(declare-fun call!59625 () Unit!40124)

(assert (=> bm!59618 (= call!59628 call!59625)))

(declare-fun b!1210393 () Bool)

(declare-fun res!804293 () Bool)

(declare-fun e!687417 () Bool)

(assert (=> b!1210393 (=> (not res!804293) (not e!687417))))

(declare-datatypes ((array!78223 0))(
  ( (array!78224 (arr!37748 (Array (_ BitVec 32) (_ BitVec 64))) (size!38284 (_ BitVec 32))) )
))
(declare-fun lt!549545 () array!78223)

(declare-datatypes ((List!26599 0))(
  ( (Nil!26596) (Cons!26595 (h!27804 (_ BitVec 64)) (t!39594 List!26599)) )
))
(declare-fun arrayNoDuplicates!0 (array!78223 (_ BitVec 32) List!26599) Bool)

(assert (=> b!1210393 (= res!804293 (arrayNoDuplicates!0 lt!549545 #b00000000000000000000000000000000 Nil!26596))))

(declare-datatypes ((V!46085 0))(
  ( (V!46086 (val!15416 Int)) )
))
(declare-datatypes ((tuple2!19798 0))(
  ( (tuple2!19799 (_1!9910 (_ BitVec 64)) (_2!9910 V!46085)) )
))
(declare-datatypes ((List!26600 0))(
  ( (Nil!26597) (Cons!26596 (h!27805 tuple2!19798) (t!39595 List!26600)) )
))
(declare-datatypes ((ListLongMap!17767 0))(
  ( (ListLongMap!17768 (toList!8899 List!26600)) )
))
(declare-fun lt!549554 () ListLongMap!17767)

(declare-fun call!59623 () Bool)

(declare-fun bm!59619 () Bool)

(declare-fun c!119249 () Bool)

(declare-fun call!59626 () ListLongMap!17767)

(declare-fun contains!6970 (ListLongMap!17767 (_ BitVec 64)) Bool)

(assert (=> bm!59619 (= call!59623 (contains!6970 (ite c!119249 lt!549554 call!59626) k!934))))

(declare-fun b!1210394 () Bool)

(declare-fun c!119250 () Bool)

(assert (=> b!1210394 (= c!119250 (and (not lt!549549) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!687410 () Unit!40124)

(declare-fun e!687421 () Unit!40124)

(assert (=> b!1210394 (= e!687410 e!687421)))

(declare-fun b!1210395 () Bool)

(declare-fun call!59627 () ListLongMap!17767)

(assert (=> b!1210395 (contains!6970 call!59627 k!934)))

(declare-fun lt!549556 () Unit!40124)

(declare-fun minValue!944 () V!46085)

(declare-fun addStillContains!1045 (ListLongMap!17767 (_ BitVec 64) V!46085 (_ BitVec 64)) Unit!40124)

(assert (=> b!1210395 (= lt!549556 (addStillContains!1045 lt!549554 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1210395 call!59623))

(declare-fun lt!549542 () ListLongMap!17767)

(declare-fun zeroValue!944 () V!46085)

(declare-fun +!4017 (ListLongMap!17767 tuple2!19798) ListLongMap!17767)

(assert (=> b!1210395 (= lt!549554 (+!4017 lt!549542 (tuple2!19799 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!549557 () Unit!40124)

(assert (=> b!1210395 (= lt!549557 call!59625)))

(assert (=> b!1210395 (= e!687410 lt!549556)))

(declare-fun _keys!1208 () array!78223)

(declare-fun e!687422 () Bool)

(declare-fun b!1210396 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!78223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210396 (= e!687422 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210397 () Bool)

(declare-fun e!687408 () Bool)

(assert (=> b!1210397 (= e!687417 (not e!687408))))

(declare-fun res!804288 () Bool)

(assert (=> b!1210397 (=> res!804288 e!687408)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210397 (= res!804288 (bvsgt from!1455 i!673))))

(assert (=> b!1210397 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!549543 () Unit!40124)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78223 (_ BitVec 64) (_ BitVec 32)) Unit!40124)

(assert (=> b!1210397 (= lt!549543 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!59620 () Bool)

(declare-fun call!59622 () Bool)

(assert (=> bm!59620 (= call!59622 call!59623)))

(declare-fun bm!59621 () Bool)

(declare-fun call!59621 () ListLongMap!17767)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14650 0))(
  ( (ValueCellFull!14650 (v!18067 V!46085)) (EmptyCell!14650) )
))
(declare-datatypes ((array!78225 0))(
  ( (array!78226 (arr!37749 (Array (_ BitVec 32) ValueCell!14650)) (size!38285 (_ BitVec 32))) )
))
(declare-fun lt!549551 () array!78225)

(declare-fun getCurrentListMapNoExtraKeys!5332 (array!78223 array!78225 (_ BitVec 32) (_ BitVec 32) V!46085 V!46085 (_ BitVec 32) Int) ListLongMap!17767)

(assert (=> bm!59621 (= call!59621 (getCurrentListMapNoExtraKeys!5332 lt!549545 lt!549551 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210399 () Bool)

(declare-fun res!804295 () Bool)

(declare-fun e!687409 () Bool)

(assert (=> b!1210399 (=> (not res!804295) (not e!687409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78223 (_ BitVec 32)) Bool)

(assert (=> b!1210399 (= res!804295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1210400 () Bool)

(declare-fun e!687416 () Unit!40124)

(declare-fun Unit!40126 () Unit!40124)

(assert (=> b!1210400 (= e!687416 Unit!40126)))

(declare-fun b!1210401 () Bool)

(declare-fun e!687418 () Bool)

(declare-fun e!687413 () Bool)

(declare-fun mapRes!47947 () Bool)

(assert (=> b!1210401 (= e!687418 (and e!687413 mapRes!47947))))

(declare-fun condMapEmpty!47947 () Bool)

(declare-fun _values!996 () array!78225)

(declare-fun mapDefault!47947 () ValueCell!14650)

