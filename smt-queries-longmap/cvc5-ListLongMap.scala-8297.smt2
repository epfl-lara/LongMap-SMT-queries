; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101092 () Bool)

(assert start!101092)

(declare-fun b_free!26053 () Bool)

(declare-fun b_next!26053 () Bool)

(assert (=> start!101092 (= b_free!26053 (not b_next!26053))))

(declare-fun tp!91178 () Bool)

(declare-fun b_and!43205 () Bool)

(assert (=> start!101092 (= tp!91178 b_and!43205)))

(declare-fun b!1212288 () Bool)

(declare-fun res!805187 () Bool)

(declare-fun e!688477 () Bool)

(assert (=> b!1212288 (=> (not res!805187) (not e!688477))))

(declare-datatypes ((array!78301 0))(
  ( (array!78302 (arr!37786 (Array (_ BitVec 32) (_ BitVec 64))) (size!38322 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78301)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78301 (_ BitVec 32)) Bool)

(assert (=> b!1212288 (= res!805187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1212289 () Bool)

(declare-datatypes ((V!46137 0))(
  ( (V!46138 (val!15435 Int)) )
))
(declare-datatypes ((tuple2!19834 0))(
  ( (tuple2!19835 (_1!9928 (_ BitVec 64)) (_2!9928 V!46137)) )
))
(declare-datatypes ((List!26635 0))(
  ( (Nil!26632) (Cons!26631 (h!27840 tuple2!19834) (t!39668 List!26635)) )
))
(declare-datatypes ((ListLongMap!17803 0))(
  ( (ListLongMap!17804 (toList!8917 List!26635)) )
))
(declare-fun call!60101 () ListLongMap!17803)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6989 (ListLongMap!17803 (_ BitVec 64)) Bool)

(assert (=> b!1212289 (contains!6989 call!60101 k!934)))

(declare-fun lt!550866 () ListLongMap!17803)

(declare-fun minValue!944 () V!46137)

(declare-datatypes ((Unit!40206 0))(
  ( (Unit!40207) )
))
(declare-fun lt!550859 () Unit!40206)

(declare-fun addStillContains!1061 (ListLongMap!17803 (_ BitVec 64) V!46137 (_ BitVec 64)) Unit!40206)

(assert (=> b!1212289 (= lt!550859 (addStillContains!1061 lt!550866 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!60102 () Bool)

(assert (=> b!1212289 call!60102))

(declare-fun lt!550856 () ListLongMap!17803)

(declare-fun zeroValue!944 () V!46137)

(declare-fun +!4034 (ListLongMap!17803 tuple2!19834) ListLongMap!17803)

(assert (=> b!1212289 (= lt!550866 (+!4034 lt!550856 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!550870 () Unit!40206)

(declare-fun call!60098 () Unit!40206)

(assert (=> b!1212289 (= lt!550870 call!60098)))

(declare-fun e!688464 () Unit!40206)

(assert (=> b!1212289 (= e!688464 lt!550859)))

(declare-fun bm!60095 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun call!60103 () ListLongMap!17803)

(declare-datatypes ((ValueCell!14669 0))(
  ( (ValueCellFull!14669 (v!18087 V!46137)) (EmptyCell!14669) )
))
(declare-datatypes ((array!78303 0))(
  ( (array!78304 (arr!37787 (Array (_ BitVec 32) ValueCell!14669)) (size!38323 (_ BitVec 32))) )
))
(declare-fun lt!550857 () array!78303)

(declare-fun lt!550862 () array!78301)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5349 (array!78301 array!78303 (_ BitVec 32) (_ BitVec 32) V!46137 V!46137 (_ BitVec 32) Int) ListLongMap!17803)

(assert (=> bm!60095 (= call!60103 (getCurrentListMapNoExtraKeys!5349 lt!550862 lt!550857 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!688476 () Bool)

(declare-fun b!1212290 () Bool)

(declare-fun call!60104 () ListLongMap!17803)

(declare-fun -!1865 (ListLongMap!17803 (_ BitVec 64)) ListLongMap!17803)

(assert (=> b!1212290 (= e!688476 (= call!60103 (-!1865 call!60104 k!934)))))

(declare-fun bm!60096 () Bool)

(declare-fun call!60100 () Bool)

(assert (=> bm!60096 (= call!60100 call!60102)))

(declare-fun b!1212291 () Bool)

(declare-fun res!805189 () Bool)

(assert (=> b!1212291 (=> (not res!805189) (not e!688477))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1212291 (= res!805189 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38322 _keys!1208))))))

(declare-fun bm!60097 () Bool)

(declare-fun call!60099 () Unit!40206)

(assert (=> bm!60097 (= call!60099 call!60098)))

(declare-fun bm!60098 () Bool)

(declare-fun c!119641 () Bool)

(declare-fun c!119636 () Bool)

(assert (=> bm!60098 (= call!60101 (+!4034 (ite c!119636 lt!550866 lt!550856) (ite c!119636 (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119641 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1212292 () Bool)

(declare-fun e!688474 () Unit!40206)

(declare-fun lt!550860 () Unit!40206)

(assert (=> b!1212292 (= e!688474 lt!550860)))

(assert (=> b!1212292 (= lt!550860 call!60099)))

(assert (=> b!1212292 call!60100))

(declare-fun e!688470 () Bool)

(declare-fun b!1212293 () Bool)

(declare-fun arrayContainsKey!0 (array!78301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1212293 (= e!688470 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!60099 () Bool)

(declare-fun _values!996 () array!78303)

(assert (=> bm!60099 (= call!60104 (getCurrentListMapNoExtraKeys!5349 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212294 () Bool)

(declare-fun e!688473 () Unit!40206)

(declare-fun Unit!40208 () Unit!40206)

(assert (=> b!1212294 (= e!688473 Unit!40208)))

(declare-fun b!1212295 () Bool)

(assert (=> b!1212295 (= e!688476 (= call!60103 call!60104))))

(declare-fun b!1212296 () Bool)

(declare-fun e!688468 () Bool)

(declare-fun tp_is_empty!30757 () Bool)

(assert (=> b!1212296 (= e!688468 tp_is_empty!30757)))

(declare-fun b!1212297 () Bool)

(declare-fun e!688478 () Bool)

(assert (=> b!1212297 (= e!688478 tp_is_empty!30757)))

(declare-fun b!1212298 () Bool)

(declare-fun lt!550869 () Bool)

(declare-fun e!688479 () Bool)

(assert (=> b!1212298 (= e!688479 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550869) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1212299 () Bool)

(declare-fun res!805201 () Bool)

(declare-fun e!688467 () Bool)

(assert (=> b!1212299 (=> (not res!805201) (not e!688467))))

(declare-datatypes ((List!26636 0))(
  ( (Nil!26633) (Cons!26632 (h!27841 (_ BitVec 64)) (t!39669 List!26636)) )
))
(declare-fun arrayNoDuplicates!0 (array!78301 (_ BitVec 32) List!26636) Bool)

(assert (=> b!1212299 (= res!805201 (arrayNoDuplicates!0 lt!550862 #b00000000000000000000000000000000 Nil!26633))))

(declare-fun b!1212300 () Bool)

(assert (=> b!1212300 (= c!119641 (and (not lt!550869) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1212300 (= e!688464 e!688474)))

(declare-fun b!1212301 () Bool)

(declare-fun e!688471 () Bool)

(assert (=> b!1212301 (= e!688471 (bvslt i!673 (size!38323 _values!996)))))

(declare-fun e!688463 () Bool)

(assert (=> b!1212301 e!688463))

(declare-fun res!805190 () Bool)

(assert (=> b!1212301 (=> (not res!805190) (not e!688463))))

(declare-fun lt!550864 () ListLongMap!17803)

(assert (=> b!1212301 (= res!805190 (= lt!550864 lt!550856))))

(declare-fun lt!550863 () ListLongMap!17803)

(assert (=> b!1212301 (= lt!550864 (-!1865 lt!550863 k!934))))

(declare-fun lt!550853 () V!46137)

(assert (=> b!1212301 (= (-!1865 (+!4034 lt!550856 (tuple2!19835 (select (arr!37786 _keys!1208) from!1455) lt!550853)) (select (arr!37786 _keys!1208) from!1455)) lt!550856)))

(declare-fun lt!550865 () Unit!40206)

(declare-fun addThenRemoveForNewKeyIsSame!281 (ListLongMap!17803 (_ BitVec 64) V!46137) Unit!40206)

(assert (=> b!1212301 (= lt!550865 (addThenRemoveForNewKeyIsSame!281 lt!550856 (select (arr!37786 _keys!1208) from!1455) lt!550853))))

(declare-fun lt!550852 () V!46137)

(declare-fun get!19260 (ValueCell!14669 V!46137) V!46137)

(assert (=> b!1212301 (= lt!550853 (get!19260 (select (arr!37787 _values!996) from!1455) lt!550852))))

(declare-fun lt!550854 () Unit!40206)

(assert (=> b!1212301 (= lt!550854 e!688473)))

(declare-fun c!119640 () Bool)

(assert (=> b!1212301 (= c!119640 (contains!6989 lt!550856 k!934))))

(assert (=> b!1212301 (= lt!550856 (getCurrentListMapNoExtraKeys!5349 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212302 () Bool)

(declare-fun res!805197 () Bool)

(assert (=> b!1212302 (=> (not res!805197) (not e!688477))))

(assert (=> b!1212302 (= res!805197 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26633))))

(declare-fun res!805192 () Bool)

(assert (=> start!101092 (=> (not res!805192) (not e!688477))))

(assert (=> start!101092 (= res!805192 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38322 _keys!1208))))))

(assert (=> start!101092 e!688477))

(assert (=> start!101092 tp_is_empty!30757))

(declare-fun array_inv!28784 (array!78301) Bool)

(assert (=> start!101092 (array_inv!28784 _keys!1208)))

(assert (=> start!101092 true))

(assert (=> start!101092 tp!91178))

(declare-fun e!688469 () Bool)

(declare-fun array_inv!28785 (array!78303) Bool)

(assert (=> start!101092 (and (array_inv!28785 _values!996) e!688469)))

(declare-fun b!1212303 () Bool)

(declare-fun res!805195 () Bool)

(assert (=> b!1212303 (=> (not res!805195) (not e!688477))))

(assert (=> b!1212303 (= res!805195 (= (select (arr!37786 _keys!1208) i!673) k!934))))

(declare-fun b!1212304 () Bool)

(declare-fun res!805191 () Bool)

(assert (=> b!1212304 (=> (not res!805191) (not e!688477))))

(assert (=> b!1212304 (= res!805191 (and (= (size!38323 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38322 _keys!1208) (size!38323 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48007 () Bool)

(declare-fun mapRes!48007 () Bool)

(assert (=> mapIsEmpty!48007 mapRes!48007))

(declare-fun b!1212305 () Bool)

(declare-fun res!805194 () Bool)

(assert (=> b!1212305 (=> (not res!805194) (not e!688477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1212305 (= res!805194 (validMask!0 mask!1564))))

(declare-fun b!1212306 () Bool)

(declare-fun res!805188 () Bool)

(assert (=> b!1212306 (=> (not res!805188) (not e!688477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1212306 (= res!805188 (validKeyInArray!0 k!934))))

(declare-fun b!1212307 () Bool)

(declare-fun Unit!40209 () Unit!40206)

(assert (=> b!1212307 (= e!688473 Unit!40209)))

(assert (=> b!1212307 (= lt!550869 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1212307 (= c!119636 (and (not lt!550869) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550867 () Unit!40206)

(assert (=> b!1212307 (= lt!550867 e!688464)))

(declare-fun lt!550850 () Unit!40206)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!612 (array!78301 array!78303 (_ BitVec 32) (_ BitVec 32) V!46137 V!46137 (_ BitVec 64) (_ BitVec 32) Int) Unit!40206)

(assert (=> b!1212307 (= lt!550850 (lemmaListMapContainsThenArrayContainsFrom!612 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119639 () Bool)

(assert (=> b!1212307 (= c!119639 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805198 () Bool)

(assert (=> b!1212307 (= res!805198 e!688479)))

(assert (=> b!1212307 (=> (not res!805198) (not e!688470))))

(assert (=> b!1212307 e!688470))

(declare-fun lt!550868 () Unit!40206)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78301 (_ BitVec 32) (_ BitVec 32)) Unit!40206)

(assert (=> b!1212307 (= lt!550868 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1212307 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26633)))

(declare-fun lt!550858 () Unit!40206)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78301 (_ BitVec 64) (_ BitVec 32) List!26636) Unit!40206)

(assert (=> b!1212307 (= lt!550858 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26633))))

(assert (=> b!1212307 false))

(declare-fun b!1212308 () Bool)

(declare-fun e!688472 () Bool)

(assert (=> b!1212308 (= e!688472 e!688471)))

(declare-fun res!805193 () Bool)

(assert (=> b!1212308 (=> res!805193 e!688471)))

(assert (=> b!1212308 (= res!805193 (not (= (select (arr!37786 _keys!1208) from!1455) k!934)))))

(assert (=> b!1212308 e!688476))

(declare-fun c!119637 () Bool)

(assert (=> b!1212308 (= c!119637 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550861 () Unit!40206)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1075 (array!78301 array!78303 (_ BitVec 32) (_ BitVec 32) V!46137 V!46137 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40206)

(assert (=> b!1212308 (= lt!550861 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1075 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212309 () Bool)

(declare-fun e!688475 () Unit!40206)

(assert (=> b!1212309 (= e!688474 e!688475)))

(declare-fun c!119638 () Bool)

(assert (=> b!1212309 (= c!119638 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550869))))

(declare-fun call!60105 () ListLongMap!17803)

(declare-fun bm!60100 () Bool)

(assert (=> bm!60100 (= call!60102 (contains!6989 (ite c!119636 lt!550866 call!60105) k!934))))

(declare-fun b!1212310 () Bool)

(assert (=> b!1212310 (= e!688469 (and e!688468 mapRes!48007))))

(declare-fun condMapEmpty!48007 () Bool)

(declare-fun mapDefault!48007 () ValueCell!14669)

