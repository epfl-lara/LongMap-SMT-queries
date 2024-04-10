; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101018 () Bool)

(assert start!101018)

(declare-fun b_free!26017 () Bool)

(declare-fun b_next!26017 () Bool)

(assert (=> start!101018 (= b_free!26017 (not b_next!26017))))

(declare-fun tp!91066 () Bool)

(declare-fun b_and!43115 () Bool)

(assert (=> start!101018 (= tp!91066 b_and!43115)))

(declare-datatypes ((V!46089 0))(
  ( (V!46090 (val!15417 Int)) )
))
(declare-fun zeroValue!944 () V!46089)

(declare-fun c!119269 () Bool)

(declare-datatypes ((tuple2!19800 0))(
  ( (tuple2!19801 (_1!9911 (_ BitVec 64)) (_2!9911 V!46089)) )
))
(declare-datatypes ((List!26601 0))(
  ( (Nil!26598) (Cons!26597 (h!27806 tuple2!19800) (t!39598 List!26601)) )
))
(declare-datatypes ((ListLongMap!17769 0))(
  ( (ListLongMap!17770 (toList!8900 List!26601)) )
))
(declare-fun lt!549605 () ListLongMap!17769)

(declare-fun lt!549600 () ListLongMap!17769)

(declare-datatypes ((Unit!40127 0))(
  ( (Unit!40128) )
))
(declare-fun call!59646 () Unit!40127)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun bm!59642 () Bool)

(declare-fun c!119266 () Bool)

(declare-fun minValue!944 () V!46089)

(declare-fun addStillContains!1046 (ListLongMap!17769 (_ BitVec 64) V!46089 (_ BitVec 64)) Unit!40127)

(assert (=> bm!59642 (= call!59646 (addStillContains!1046 (ite c!119269 lt!549605 lt!549600) (ite c!119269 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119266 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119269 minValue!944 (ite c!119266 zeroValue!944 minValue!944)) k!934))))

(declare-fun call!59647 () ListLongMap!17769)

(declare-fun bm!59643 () Bool)

(declare-fun +!4018 (ListLongMap!17769 tuple2!19800) ListLongMap!17769)

(assert (=> bm!59643 (= call!59647 (+!4018 (ite c!119269 lt!549605 lt!549600) (ite c!119269 (tuple2!19801 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119266 (tuple2!19801 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19801 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1210481 () Bool)

(declare-fun call!59651 () Bool)

(assert (=> b!1210481 call!59651))

(declare-fun lt!549611 () Unit!40127)

(declare-fun call!59652 () Unit!40127)

(assert (=> b!1210481 (= lt!549611 call!59652)))

(declare-fun e!687466 () Unit!40127)

(assert (=> b!1210481 (= e!687466 lt!549611)))

(declare-fun b!1210482 () Bool)

(declare-fun res!804342 () Bool)

(declare-fun e!687462 () Bool)

(assert (=> b!1210482 (=> (not res!804342) (not e!687462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1210482 (= res!804342 (validKeyInArray!0 k!934))))

(declare-fun b!1210483 () Bool)

(declare-fun lt!549606 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1210483 (= c!119266 (and (not lt!549606) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!687463 () Unit!40127)

(declare-fun e!687461 () Unit!40127)

(assert (=> b!1210483 (= e!687463 e!687461)))

(declare-fun b!1210484 () Bool)

(declare-fun res!804332 () Bool)

(assert (=> b!1210484 (=> (not res!804332) (not e!687462))))

(declare-datatypes ((array!78227 0))(
  ( (array!78228 (arr!37750 (Array (_ BitVec 32) (_ BitVec 64))) (size!38286 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78227)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14651 0))(
  ( (ValueCellFull!14651 (v!18068 V!46089)) (EmptyCell!14651) )
))
(declare-datatypes ((array!78229 0))(
  ( (array!78230 (arr!37751 (Array (_ BitVec 32) ValueCell!14651)) (size!38287 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78229)

(assert (=> b!1210484 (= res!804332 (and (= (size!38287 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38286 _keys!1208) (size!38287 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!687465 () Bool)

(declare-fun b!1210485 () Bool)

(declare-fun call!59649 () ListLongMap!17769)

(declare-fun call!59648 () ListLongMap!17769)

(declare-fun -!1849 (ListLongMap!17769 (_ BitVec 64)) ListLongMap!17769)

(assert (=> b!1210485 (= e!687465 (= call!59649 (-!1849 call!59648 k!934)))))

(declare-fun mapIsEmpty!47950 () Bool)

(declare-fun mapRes!47950 () Bool)

(assert (=> mapIsEmpty!47950 mapRes!47950))

(declare-fun b!1210486 () Bool)

(declare-fun e!687468 () Unit!40127)

(declare-fun Unit!40129 () Unit!40127)

(assert (=> b!1210486 (= e!687468 Unit!40129)))

(assert (=> b!1210486 (= lt!549606 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1210486 (= c!119269 (and (not lt!549606) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549596 () Unit!40127)

(assert (=> b!1210486 (= lt!549596 e!687463)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!549604 () Unit!40127)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!597 (array!78227 array!78229 (_ BitVec 32) (_ BitVec 32) V!46089 V!46089 (_ BitVec 64) (_ BitVec 32) Int) Unit!40127)

(assert (=> b!1210486 (= lt!549604 (lemmaListMapContainsThenArrayContainsFrom!597 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119267 () Bool)

(assert (=> b!1210486 (= c!119267 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804341 () Bool)

(declare-fun e!687456 () Bool)

(assert (=> b!1210486 (= res!804341 e!687456)))

(declare-fun e!687457 () Bool)

(assert (=> b!1210486 (=> (not res!804341) (not e!687457))))

(assert (=> b!1210486 e!687457))

(declare-fun lt!549608 () Unit!40127)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78227 (_ BitVec 32) (_ BitVec 32)) Unit!40127)

(assert (=> b!1210486 (= lt!549608 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26602 0))(
  ( (Nil!26599) (Cons!26598 (h!27807 (_ BitVec 64)) (t!39599 List!26602)) )
))
(declare-fun arrayNoDuplicates!0 (array!78227 (_ BitVec 32) List!26602) Bool)

(assert (=> b!1210486 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26599)))

(declare-fun lt!549602 () Unit!40127)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78227 (_ BitVec 64) (_ BitVec 32) List!26602) Unit!40127)

(assert (=> b!1210486 (= lt!549602 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26599))))

(assert (=> b!1210486 false))

(declare-fun b!1210487 () Bool)

(declare-fun contains!6971 (ListLongMap!17769 (_ BitVec 64)) Bool)

(assert (=> b!1210487 (contains!6971 call!59647 k!934)))

(declare-fun lt!549607 () Unit!40127)

(assert (=> b!1210487 (= lt!549607 call!59646)))

(declare-fun call!59645 () Bool)

(assert (=> b!1210487 call!59645))

(assert (=> b!1210487 (= lt!549605 (+!4018 lt!549600 (tuple2!19801 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!549603 () Unit!40127)

(assert (=> b!1210487 (= lt!549603 (addStillContains!1046 lt!549600 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1210487 (= e!687463 lt!549607)))

(declare-fun b!1210488 () Bool)

(declare-fun lt!549613 () Unit!40127)

(assert (=> b!1210488 (= e!687461 lt!549613)))

(assert (=> b!1210488 (= lt!549613 call!59652)))

(assert (=> b!1210488 call!59651))

(declare-fun b!1210489 () Bool)

(declare-fun e!687469 () Bool)

(assert (=> b!1210489 (= e!687462 e!687469)))

(declare-fun res!804339 () Bool)

(assert (=> b!1210489 (=> (not res!804339) (not e!687469))))

(declare-fun lt!549599 () array!78227)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78227 (_ BitVec 32)) Bool)

(assert (=> b!1210489 (= res!804339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549599 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210489 (= lt!549599 (array!78228 (store (arr!37750 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38286 _keys!1208)))))

(declare-fun b!1210490 () Bool)

(declare-fun arrayContainsKey!0 (array!78227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210490 (= e!687457 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210491 () Bool)

(declare-fun e!687455 () Bool)

(declare-fun e!687458 () Bool)

(assert (=> b!1210491 (= e!687455 (and e!687458 mapRes!47950))))

(declare-fun condMapEmpty!47950 () Bool)

(declare-fun mapDefault!47950 () ValueCell!14651)

