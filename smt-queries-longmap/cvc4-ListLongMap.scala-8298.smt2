; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101102 () Bool)

(assert start!101102)

(declare-fun b_free!26063 () Bool)

(declare-fun b_next!26063 () Bool)

(assert (=> start!101102 (= b_free!26063 (not b_next!26063))))

(declare-fun tp!91207 () Bool)

(declare-fun b_and!43225 () Bool)

(assert (=> start!101102 (= tp!91207 b_and!43225)))

(declare-fun b!1212748 () Bool)

(declare-fun res!805412 () Bool)

(declare-fun e!688732 () Bool)

(assert (=> b!1212748 (=> (not res!805412) (not e!688732))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1212748 (= res!805412 (validKeyInArray!0 k!934))))

(declare-datatypes ((V!46149 0))(
  ( (V!46150 (val!15440 Int)) )
))
(declare-fun zeroValue!944 () V!46149)

(declare-datatypes ((array!78319 0))(
  ( (array!78320 (arr!37795 (Array (_ BitVec 32) (_ BitVec 64))) (size!38331 (_ BitVec 32))) )
))
(declare-fun lt!551187 () array!78319)

(declare-fun bm!60215 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14674 0))(
  ( (ValueCellFull!14674 (v!18092 V!46149)) (EmptyCell!14674) )
))
(declare-datatypes ((array!78321 0))(
  ( (array!78322 (arr!37796 (Array (_ BitVec 32) ValueCell!14674)) (size!38332 (_ BitVec 32))) )
))
(declare-fun lt!551189 () array!78321)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19842 0))(
  ( (tuple2!19843 (_1!9932 (_ BitVec 64)) (_2!9932 V!46149)) )
))
(declare-datatypes ((List!26642 0))(
  ( (Nil!26639) (Cons!26638 (h!27847 tuple2!19842) (t!39685 List!26642)) )
))
(declare-datatypes ((ListLongMap!17811 0))(
  ( (ListLongMap!17812 (toList!8921 List!26642)) )
))
(declare-fun call!60221 () ListLongMap!17811)

(declare-fun minValue!944 () V!46149)

(declare-fun getCurrentListMapNoExtraKeys!5352 (array!78319 array!78321 (_ BitVec 32) (_ BitVec 32) V!46149 V!46149 (_ BitVec 32) Int) ListLongMap!17811)

(assert (=> bm!60215 (= call!60221 (getCurrentListMapNoExtraKeys!5352 lt!551187 lt!551189 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!551186 () ListLongMap!17811)

(declare-fun c!119730 () Bool)

(declare-fun bm!60216 () Bool)

(declare-fun c!119731 () Bool)

(declare-datatypes ((Unit!40222 0))(
  ( (Unit!40223) )
))
(declare-fun call!60223 () Unit!40222)

(declare-fun lt!551192 () ListLongMap!17811)

(declare-fun addStillContains!1064 (ListLongMap!17811 (_ BitVec 64) V!46149 (_ BitVec 64)) Unit!40222)

(assert (=> bm!60216 (= call!60223 (addStillContains!1064 (ite c!119730 lt!551186 lt!551192) (ite c!119730 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119731 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119730 minValue!944 (ite c!119731 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1212750 () Bool)

(declare-fun res!805416 () Bool)

(assert (=> b!1212750 (=> (not res!805416) (not e!688732))))

(declare-fun _keys!1208 () array!78319)

(declare-datatypes ((List!26643 0))(
  ( (Nil!26640) (Cons!26639 (h!27848 (_ BitVec 64)) (t!39686 List!26643)) )
))
(declare-fun arrayNoDuplicates!0 (array!78319 (_ BitVec 32) List!26643) Bool)

(assert (=> b!1212750 (= res!805416 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26640))))

(declare-fun b!1212751 () Bool)

(declare-fun res!805418 () Bool)

(assert (=> b!1212751 (=> (not res!805418) (not e!688732))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1212751 (= res!805418 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38331 _keys!1208))))))

(declare-fun b!1212752 () Bool)

(declare-fun res!805424 () Bool)

(assert (=> b!1212752 (=> (not res!805424) (not e!688732))))

(assert (=> b!1212752 (= res!805424 (= (select (arr!37795 _keys!1208) i!673) k!934))))

(declare-fun b!1212753 () Bool)

(declare-fun e!688734 () Bool)

(declare-fun arrayContainsKey!0 (array!78319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1212753 (= e!688734 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212754 () Bool)

(declare-fun e!688720 () Bool)

(declare-fun e!688721 () Bool)

(assert (=> b!1212754 (= e!688720 (not e!688721))))

(declare-fun res!805419 () Bool)

(assert (=> b!1212754 (=> res!805419 e!688721)))

(assert (=> b!1212754 (= res!805419 (bvsgt from!1455 i!673))))

(assert (=> b!1212754 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!551198 () Unit!40222)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78319 (_ BitVec 64) (_ BitVec 32)) Unit!40222)

(assert (=> b!1212754 (= lt!551198 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1212755 () Bool)

(declare-fun e!688726 () Bool)

(declare-fun e!688731 () Bool)

(declare-fun mapRes!48022 () Bool)

(assert (=> b!1212755 (= e!688726 (and e!688731 mapRes!48022))))

(declare-fun condMapEmpty!48022 () Bool)

(declare-fun _values!996 () array!78321)

(declare-fun mapDefault!48022 () ValueCell!14674)

