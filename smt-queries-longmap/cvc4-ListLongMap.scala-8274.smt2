; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100718 () Bool)

(assert start!100718)

(declare-fun b_free!25919 () Bool)

(declare-fun b_next!25919 () Bool)

(assert (=> start!100718 (= b_free!25919 (not b_next!25919))))

(declare-fun tp!90757 () Bool)

(declare-fun b_and!42803 () Bool)

(assert (=> start!100718 (= tp!90757 b_and!42803)))

(declare-fun b!1204928 () Bool)

(declare-fun res!801546 () Bool)

(declare-fun e!684252 () Bool)

(assert (=> b!1204928 (=> (not res!801546) (not e!684252))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1204928 (= res!801546 (validKeyInArray!0 k!934))))

(declare-fun b!1204929 () Bool)

(declare-fun res!801545 () Bool)

(assert (=> b!1204929 (=> (not res!801545) (not e!684252))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78025 0))(
  ( (array!78026 (arr!37654 (Array (_ BitVec 32) (_ BitVec 64))) (size!38190 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78025)

(assert (=> b!1204929 (= res!801545 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38190 _keys!1208))))))

(declare-fun b!1204930 () Bool)

(declare-fun c!118181 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!546462 () Bool)

(assert (=> b!1204930 (= c!118181 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546462))))

(declare-datatypes ((Unit!39950 0))(
  ( (Unit!39951) )
))
(declare-fun e!684266 () Unit!39950)

(declare-fun e!684259 () Unit!39950)

(assert (=> b!1204930 (= e!684266 e!684259)))

(declare-fun bm!58334 () Bool)

(declare-fun call!58339 () Unit!39950)

(declare-fun call!58340 () Unit!39950)

(assert (=> bm!58334 (= call!58339 call!58340)))

(declare-datatypes ((V!45957 0))(
  ( (V!45958 (val!15368 Int)) )
))
(declare-fun zeroValue!944 () V!45957)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14602 0))(
  ( (ValueCellFull!14602 (v!18011 V!45957)) (EmptyCell!14602) )
))
(declare-datatypes ((array!78027 0))(
  ( (array!78028 (arr!37655 (Array (_ BitVec 32) ValueCell!14602)) (size!38191 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78027)

(declare-fun minValue!944 () V!45957)

(declare-datatypes ((tuple2!19708 0))(
  ( (tuple2!19709 (_1!9865 (_ BitVec 64)) (_2!9865 V!45957)) )
))
(declare-datatypes ((List!26516 0))(
  ( (Nil!26513) (Cons!26512 (h!27721 tuple2!19708) (t!39415 List!26516)) )
))
(declare-datatypes ((ListLongMap!17677 0))(
  ( (ListLongMap!17678 (toList!8854 List!26516)) )
))
(declare-fun call!58341 () ListLongMap!17677)

(declare-fun bm!58335 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5290 (array!78025 array!78027 (_ BitVec 32) (_ BitVec 32) V!45957 V!45957 (_ BitVec 32) Int) ListLongMap!17677)

(assert (=> bm!58335 (= call!58341 (getCurrentListMapNoExtraKeys!5290 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204931 () Bool)

(declare-fun e!684261 () Bool)

(declare-fun tp_is_empty!30623 () Bool)

(assert (=> b!1204931 (= e!684261 tp_is_empty!30623)))

(declare-fun e!684253 () Bool)

(declare-fun call!58337 () ListLongMap!17677)

(declare-fun b!1204932 () Bool)

(declare-fun -!1819 (ListLongMap!17677 (_ BitVec 64)) ListLongMap!17677)

(assert (=> b!1204932 (= e!684253 (= call!58337 (-!1819 call!58341 k!934)))))

(declare-fun b!1204933 () Bool)

(declare-fun e!684267 () Bool)

(declare-fun e!684254 () Bool)

(assert (=> b!1204933 (= e!684267 e!684254)))

(declare-fun res!801544 () Bool)

(assert (=> b!1204933 (=> res!801544 e!684254)))

(assert (=> b!1204933 (= res!801544 (not (= (select (arr!37654 _keys!1208) from!1455) k!934)))))

(assert (=> b!1204933 e!684253))

(declare-fun c!118180 () Bool)

(assert (=> b!1204933 (= c!118180 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!546464 () Unit!39950)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1023 (array!78025 array!78027 (_ BitVec 32) (_ BitVec 32) V!45957 V!45957 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39950)

(assert (=> b!1204933 (= lt!546464 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1023 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58336 () Bool)

(declare-fun c!118179 () Bool)

(declare-fun lt!546465 () ListLongMap!17677)

(declare-fun c!118178 () Bool)

(declare-fun addStillContains!1008 (ListLongMap!17677 (_ BitVec 64) V!45957 (_ BitVec 64)) Unit!39950)

(assert (=> bm!58336 (= call!58340 (addStillContains!1008 lt!546465 (ite (or c!118179 c!118178) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118179 c!118178) zeroValue!944 minValue!944) k!934))))

(declare-fun lt!546460 () ListLongMap!17677)

(declare-fun call!58343 () Bool)

(declare-fun call!58336 () ListLongMap!17677)

(declare-fun bm!58333 () Bool)

(declare-fun contains!6913 (ListLongMap!17677 (_ BitVec 64)) Bool)

(assert (=> bm!58333 (= call!58343 (contains!6913 (ite c!118179 lt!546460 call!58336) k!934))))

(declare-fun res!801541 () Bool)

(assert (=> start!100718 (=> (not res!801541) (not e!684252))))

(assert (=> start!100718 (= res!801541 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38190 _keys!1208))))))

(assert (=> start!100718 e!684252))

(assert (=> start!100718 tp_is_empty!30623))

(declare-fun array_inv!28688 (array!78025) Bool)

(assert (=> start!100718 (array_inv!28688 _keys!1208)))

(assert (=> start!100718 true))

(assert (=> start!100718 tp!90757))

(declare-fun e!684256 () Bool)

(declare-fun array_inv!28689 (array!78027) Bool)

(assert (=> start!100718 (and (array_inv!28689 _values!996) e!684256)))

(declare-fun b!1204934 () Bool)

(declare-fun e!684263 () Unit!39950)

(assert (=> b!1204934 (= e!684263 e!684266)))

(assert (=> b!1204934 (= c!118178 (and (not lt!546462) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1204935 () Bool)

(declare-fun e!684257 () Bool)

(assert (=> b!1204935 (= e!684257 e!684267)))

(declare-fun res!801553 () Bool)

(assert (=> b!1204935 (=> res!801553 e!684267)))

(assert (=> b!1204935 (= res!801553 (not (= from!1455 i!673)))))

(declare-fun lt!546461 () array!78025)

(declare-fun lt!546468 () array!78027)

(declare-fun lt!546457 () ListLongMap!17677)

(assert (=> b!1204935 (= lt!546457 (getCurrentListMapNoExtraKeys!5290 lt!546461 lt!546468 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3200 (Int (_ BitVec 64)) V!45957)

(assert (=> b!1204935 (= lt!546468 (array!78028 (store (arr!37655 _values!996) i!673 (ValueCellFull!14602 (dynLambda!3200 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38191 _values!996)))))

(declare-fun lt!546455 () ListLongMap!17677)

(assert (=> b!1204935 (= lt!546455 (getCurrentListMapNoExtraKeys!5290 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!58337 () Bool)

(declare-fun call!58342 () Bool)

(assert (=> bm!58337 (= call!58342 call!58343)))

(declare-fun b!1204936 () Bool)

(declare-fun e!684258 () Bool)

(assert (=> b!1204936 (= e!684258 (bvslt (size!38190 _keys!1208) #b01111111111111111111111111111111))))

(declare-fun e!684255 () Bool)

(assert (=> b!1204936 e!684255))

(declare-fun res!801540 () Bool)

(assert (=> b!1204936 (=> (not res!801540) (not e!684255))))

(declare-fun e!684264 () Bool)

(assert (=> b!1204936 (= res!801540 e!684264)))

(declare-fun c!118177 () Bool)

(assert (=> b!1204936 (= c!118177 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546466 () Unit!39950)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!564 (array!78025 array!78027 (_ BitVec 32) (_ BitVec 32) V!45957 V!45957 (_ BitVec 64) (_ BitVec 32) Int) Unit!39950)

(assert (=> b!1204936 (= lt!546466 (lemmaListMapContainsThenArrayContainsFrom!564 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546456 () Unit!39950)

(assert (=> b!1204936 (= lt!546456 e!684263)))

(assert (=> b!1204936 (= c!118179 (and (not lt!546462) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1204936 (= lt!546462 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!58338 () Bool)

(declare-fun call!58338 () ListLongMap!17677)

(assert (=> bm!58338 (= call!58336 call!58338)))

(declare-fun b!1204937 () Bool)

(declare-fun mapRes!47787 () Bool)

(assert (=> b!1204937 (= e!684256 (and e!684261 mapRes!47787))))

(declare-fun condMapEmpty!47787 () Bool)

(declare-fun mapDefault!47787 () ValueCell!14602)

