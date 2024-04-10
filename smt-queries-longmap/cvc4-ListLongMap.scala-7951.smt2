; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98550 () Bool)

(assert start!98550)

(declare-fun b_free!24155 () Bool)

(declare-fun b_next!24155 () Bool)

(assert (=> start!98550 (= b_free!24155 (not b_next!24155))))

(declare-fun tp!85175 () Bool)

(declare-fun b_and!39159 () Bool)

(assert (=> start!98550 (= tp!85175 b_and!39159)))

(declare-fun b!1142206 () Bool)

(declare-datatypes ((Unit!37468 0))(
  ( (Unit!37469) )
))
(declare-fun e!649800 () Unit!37468)

(declare-fun Unit!37470 () Unit!37468)

(assert (=> b!1142206 (= e!649800 Unit!37470)))

(declare-fun b!1142207 () Bool)

(declare-fun Unit!37471 () Unit!37468)

(assert (=> b!1142207 (= e!649800 Unit!37471)))

(declare-fun lt!509077 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1142207 (= lt!509077 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112255 () Bool)

(assert (=> b!1142207 (= c!112255 (and (not lt!509077) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509083 () Unit!37468)

(declare-fun e!649806 () Unit!37468)

(assert (=> b!1142207 (= lt!509083 e!649806)))

(declare-datatypes ((V!43373 0))(
  ( (V!43374 (val!14399 Int)) )
))
(declare-fun zeroValue!944 () V!43373)

(declare-datatypes ((array!74223 0))(
  ( (array!74224 (arr!35762 (Array (_ BitVec 32) (_ BitVec 64))) (size!36298 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74223)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13633 0))(
  ( (ValueCellFull!13633 (v!17036 V!43373)) (EmptyCell!13633) )
))
(declare-datatypes ((array!74225 0))(
  ( (array!74226 (arr!35763 (Array (_ BitVec 32) ValueCell!13633)) (size!36299 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74225)

(declare-fun minValue!944 () V!43373)

(declare-fun lt!509078 () Unit!37468)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!392 (array!74223 array!74225 (_ BitVec 32) (_ BitVec 32) V!43373 V!43373 (_ BitVec 64) (_ BitVec 32) Int) Unit!37468)

(assert (=> b!1142207 (= lt!509078 (lemmaListMapContainsThenArrayContainsFrom!392 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112256 () Bool)

(assert (=> b!1142207 (= c!112256 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761226 () Bool)

(declare-fun e!649813 () Bool)

(assert (=> b!1142207 (= res!761226 e!649813)))

(declare-fun e!649814 () Bool)

(assert (=> b!1142207 (=> (not res!761226) (not e!649814))))

(assert (=> b!1142207 e!649814))

(declare-fun lt!509076 () Unit!37468)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74223 (_ BitVec 32) (_ BitVec 32)) Unit!37468)

(assert (=> b!1142207 (= lt!509076 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24973 0))(
  ( (Nil!24970) (Cons!24969 (h!26178 (_ BitVec 64)) (t!36120 List!24973)) )
))
(declare-fun arrayNoDuplicates!0 (array!74223 (_ BitVec 32) List!24973) Bool)

(assert (=> b!1142207 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24970)))

(declare-fun lt!509074 () Unit!37468)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74223 (_ BitVec 64) (_ BitVec 32) List!24973) Unit!37468)

(assert (=> b!1142207 (= lt!509074 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24970))))

(assert (=> b!1142207 false))

(declare-fun b!1142208 () Bool)

(declare-fun res!761222 () Bool)

(declare-fun e!649807 () Bool)

(assert (=> b!1142208 (=> (not res!761222) (not e!649807))))

(assert (=> b!1142208 (= res!761222 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24970))))

(declare-fun b!1142209 () Bool)

(declare-fun res!761225 () Bool)

(assert (=> b!1142209 (=> (not res!761225) (not e!649807))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1142209 (= res!761225 (= (select (arr!35762 _keys!1208) i!673) k!934))))

(declare-fun b!1142210 () Bool)

(declare-fun res!761230 () Bool)

(assert (=> b!1142210 (=> (not res!761230) (not e!649807))))

(assert (=> b!1142210 (= res!761230 (and (= (size!36299 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36298 _keys!1208) (size!36299 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!51399 () Bool)

(declare-fun c!112253 () Bool)

(declare-datatypes ((tuple2!18218 0))(
  ( (tuple2!18219 (_1!9120 (_ BitVec 64)) (_2!9120 V!43373)) )
))
(declare-datatypes ((List!24974 0))(
  ( (Nil!24971) (Cons!24970 (h!26179 tuple2!18218) (t!36121 List!24974)) )
))
(declare-datatypes ((ListLongMap!16187 0))(
  ( (ListLongMap!16188 (toList!8109 List!24974)) )
))
(declare-fun lt!509094 () ListLongMap!16187)

(declare-fun lt!509084 () ListLongMap!16187)

(declare-fun call!51402 () ListLongMap!16187)

(declare-fun +!3540 (ListLongMap!16187 tuple2!18218) ListLongMap!16187)

(assert (=> bm!51399 (= call!51402 (+!3540 (ite c!112255 lt!509094 lt!509084) (ite c!112255 (tuple2!18219 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112253 (tuple2!18219 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18219 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1142211 () Bool)

(declare-fun e!649812 () Bool)

(declare-fun tp_is_empty!28685 () Bool)

(assert (=> b!1142211 (= e!649812 tp_is_empty!28685)))

(declare-fun b!1142212 () Bool)

(declare-fun call!51408 () Bool)

(assert (=> b!1142212 call!51408))

(declare-fun lt!509091 () Unit!37468)

(declare-fun call!51406 () Unit!37468)

(assert (=> b!1142212 (= lt!509091 call!51406)))

(declare-fun e!649803 () Unit!37468)

(assert (=> b!1142212 (= e!649803 lt!509091)))

(declare-fun bm!51400 () Bool)

(declare-fun call!51403 () Unit!37468)

(assert (=> bm!51400 (= call!51406 call!51403)))

(declare-fun b!1142213 () Bool)

(declare-fun e!649815 () Bool)

(declare-fun mapRes!44852 () Bool)

(assert (=> b!1142213 (= e!649815 (and e!649812 mapRes!44852))))

(declare-fun condMapEmpty!44852 () Bool)

(declare-fun mapDefault!44852 () ValueCell!13633)

