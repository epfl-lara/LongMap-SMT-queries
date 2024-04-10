; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101004 () Bool)

(assert start!101004)

(declare-fun b_free!26003 () Bool)

(declare-fun b_next!26003 () Bool)

(assert (=> start!101004 (= b_free!26003 (not b_next!26003))))

(declare-fun tp!91025 () Bool)

(declare-fun b_and!43087 () Bool)

(assert (=> start!101004 (= tp!91025 b_and!43087)))

(declare-fun b!1209859 () Bool)

(declare-datatypes ((Unit!40096 0))(
  ( (Unit!40097) )
))
(declare-fun e!687130 () Unit!40096)

(declare-fun Unit!40098 () Unit!40096)

(assert (=> b!1209859 (= e!687130 Unit!40098)))

(declare-fun b!1209860 () Bool)

(declare-fun e!687126 () Unit!40096)

(declare-fun lt!549221 () Unit!40096)

(assert (=> b!1209860 (= e!687126 lt!549221)))

(declare-fun lt!549222 () Unit!40096)

(declare-fun call!59480 () Unit!40096)

(assert (=> b!1209860 (= lt!549222 call!59480)))

(declare-datatypes ((V!46069 0))(
  ( (V!46070 (val!15410 Int)) )
))
(declare-datatypes ((tuple2!19786 0))(
  ( (tuple2!19787 (_1!9904 (_ BitVec 64)) (_2!9904 V!46069)) )
))
(declare-datatypes ((List!26587 0))(
  ( (Nil!26584) (Cons!26583 (h!27792 tuple2!19786) (t!39570 List!26587)) )
))
(declare-datatypes ((ListLongMap!17755 0))(
  ( (ListLongMap!17756 (toList!8893 List!26587)) )
))
(declare-fun lt!549229 () ListLongMap!17755)

(declare-fun lt!549232 () ListLongMap!17755)

(declare-fun zeroValue!944 () V!46069)

(declare-fun +!4011 (ListLongMap!17755 tuple2!19786) ListLongMap!17755)

(assert (=> b!1209860 (= lt!549229 (+!4011 lt!549232 (tuple2!19787 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!59481 () Bool)

(assert (=> b!1209860 call!59481))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!46069)

(declare-fun addStillContains!1040 (ListLongMap!17755 (_ BitVec 64) V!46069 (_ BitVec 64)) Unit!40096)

(assert (=> b!1209860 (= lt!549221 (addStillContains!1040 lt!549229 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!59484 () ListLongMap!17755)

(declare-fun contains!6964 (ListLongMap!17755 (_ BitVec 64)) Bool)

(assert (=> b!1209860 (contains!6964 call!59484 k!934)))

(declare-fun bm!59474 () Bool)

(declare-fun c!119143 () Bool)

(declare-fun c!119140 () Bool)

(assert (=> bm!59474 (= call!59484 (+!4011 (ite c!119143 lt!549229 lt!549232) (ite c!119143 (tuple2!19787 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119140 (tuple2!19787 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19787 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1209861 () Bool)

(declare-fun e!687128 () Bool)

(declare-fun e!687119 () Bool)

(assert (=> b!1209861 (= e!687128 (not e!687119))))

(declare-fun res!804035 () Bool)

(assert (=> b!1209861 (=> res!804035 e!687119)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1209861 (= res!804035 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78199 0))(
  ( (array!78200 (arr!37736 (Array (_ BitVec 32) (_ BitVec 64))) (size!38272 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78199)

(declare-fun arrayContainsKey!0 (array!78199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1209861 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!549228 () Unit!40096)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78199 (_ BitVec 64) (_ BitVec 32)) Unit!40096)

(assert (=> b!1209861 (= lt!549228 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1209862 () Bool)

(declare-fun res!804046 () Bool)

(declare-fun e!687124 () Bool)

(assert (=> b!1209862 (=> (not res!804046) (not e!687124))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1209862 (= res!804046 (validMask!0 mask!1564))))

(declare-fun b!1209863 () Bool)

(declare-fun e!687121 () Bool)

(declare-fun e!687129 () Bool)

(assert (=> b!1209863 (= e!687121 e!687129)))

(declare-fun res!804037 () Bool)

(assert (=> b!1209863 (=> res!804037 e!687129)))

(assert (=> b!1209863 (= res!804037 (not (= (select (arr!37736 _keys!1208) from!1455) k!934)))))

(declare-fun e!687131 () Bool)

(assert (=> b!1209863 e!687131))

(declare-fun c!119142 () Bool)

(assert (=> b!1209863 (= c!119142 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14644 0))(
  ( (ValueCellFull!14644 (v!18061 V!46069)) (EmptyCell!14644) )
))
(declare-datatypes ((array!78201 0))(
  ( (array!78202 (arr!37737 (Array (_ BitVec 32) ValueCell!14644)) (size!38273 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78201)

(declare-fun lt!549223 () Unit!40096)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1054 (array!78199 array!78201 (_ BitVec 32) (_ BitVec 32) V!46069 V!46069 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40096)

(assert (=> b!1209863 (= lt!549223 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1054 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47929 () Bool)

(declare-fun mapRes!47929 () Bool)

(assert (=> mapIsEmpty!47929 mapRes!47929))

(declare-fun bm!59475 () Bool)

(declare-fun call!59477 () ListLongMap!17755)

(assert (=> bm!59475 (= call!59481 (contains!6964 (ite c!119143 lt!549229 call!59477) k!934))))

(declare-fun b!1209864 () Bool)

(declare-fun res!804038 () Bool)

(assert (=> b!1209864 (=> (not res!804038) (not e!687124))))

(declare-datatypes ((List!26588 0))(
  ( (Nil!26585) (Cons!26584 (h!27793 (_ BitVec 64)) (t!39571 List!26588)) )
))
(declare-fun arrayNoDuplicates!0 (array!78199 (_ BitVec 32) List!26588) Bool)

(assert (=> b!1209864 (= res!804038 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26585))))

(declare-fun b!1209865 () Bool)

(declare-fun e!687133 () Bool)

(assert (=> b!1209865 (= e!687133 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209866 () Bool)

(declare-fun e!687120 () Bool)

(declare-fun e!687132 () Bool)

(assert (=> b!1209866 (= e!687120 (and e!687132 mapRes!47929))))

(declare-fun condMapEmpty!47929 () Bool)

(declare-fun mapDefault!47929 () ValueCell!14644)

