; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98418 () Bool)

(assert start!98418)

(declare-fun b_free!24023 () Bool)

(declare-fun b_next!24023 () Bool)

(assert (=> start!98418 (= b_free!24023 (not b_next!24023))))

(declare-fun tp!84779 () Bool)

(declare-fun b_and!38895 () Bool)

(assert (=> start!98418 (= tp!84779 b_and!38895)))

(declare-fun res!758414 () Bool)

(declare-fun e!646633 () Bool)

(assert (=> start!98418 (=> (not res!758414) (not e!646633))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73967 0))(
  ( (array!73968 (arr!35634 (Array (_ BitVec 32) (_ BitVec 64))) (size!36170 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73967)

(assert (=> start!98418 (= res!758414 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36170 _keys!1208))))))

(assert (=> start!98418 e!646633))

(declare-fun tp_is_empty!28553 () Bool)

(assert (=> start!98418 tp_is_empty!28553))

(declare-fun array_inv!27324 (array!73967) Bool)

(assert (=> start!98418 (array_inv!27324 _keys!1208)))

(assert (=> start!98418 true))

(assert (=> start!98418 tp!84779))

(declare-datatypes ((V!43197 0))(
  ( (V!43198 (val!14333 Int)) )
))
(declare-datatypes ((ValueCell!13567 0))(
  ( (ValueCellFull!13567 (v!16970 V!43197)) (EmptyCell!13567) )
))
(declare-datatypes ((array!73969 0))(
  ( (array!73970 (arr!35635 (Array (_ BitVec 32) ValueCell!13567)) (size!36171 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73969)

(declare-fun e!646629 () Bool)

(declare-fun array_inv!27325 (array!73969) Bool)

(assert (=> start!98418 (and (array_inv!27325 _values!996) e!646629)))

(declare-fun b!1136312 () Bool)

(declare-fun e!646634 () Bool)

(declare-datatypes ((tuple2!18094 0))(
  ( (tuple2!18095 (_1!9058 (_ BitVec 64)) (_2!9058 V!43197)) )
))
(declare-datatypes ((List!24853 0))(
  ( (Nil!24850) (Cons!24849 (h!26058 tuple2!18094) (t!35868 List!24853)) )
))
(declare-datatypes ((ListLongMap!16063 0))(
  ( (ListLongMap!16064 (toList!8047 List!24853)) )
))
(declare-fun call!49820 () ListLongMap!16063)

(declare-fun call!49822 () ListLongMap!16063)

(assert (=> b!1136312 (= e!646634 (= call!49820 call!49822))))

(declare-fun zeroValue!944 () V!43197)

(declare-fun c!111077 () Bool)

(declare-datatypes ((Unit!37214 0))(
  ( (Unit!37215) )
))
(declare-fun call!49818 () Unit!37214)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun bm!49815 () Bool)

(declare-fun lt!505220 () ListLongMap!16063)

(declare-fun minValue!944 () V!43197)

(declare-fun c!111078 () Bool)

(declare-fun addStillContains!744 (ListLongMap!16063 (_ BitVec 64) V!43197 (_ BitVec 64)) Unit!37214)

(assert (=> bm!49815 (= call!49818 (addStillContains!744 lt!505220 (ite (or c!111077 c!111078) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111077 c!111078) zeroValue!944 minValue!944) k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!49816 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4531 (array!73967 array!73969 (_ BitVec 32) (_ BitVec 32) V!43197 V!43197 (_ BitVec 32) Int) ListLongMap!16063)

(assert (=> bm!49816 (= call!49822 (getCurrentListMapNoExtraKeys!4531 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136313 () Bool)

(declare-fun res!758423 () Bool)

(assert (=> b!1136313 (=> (not res!758423) (not e!646633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73967 (_ BitVec 32)) Bool)

(assert (=> b!1136313 (= res!758423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!49817 () Bool)

(declare-fun call!49821 () Bool)

(declare-fun call!49819 () Bool)

(assert (=> bm!49817 (= call!49821 call!49819)))

(declare-fun b!1136314 () Bool)

(declare-fun e!646638 () Bool)

(assert (=> b!1136314 (= e!646638 tp_is_empty!28553)))

(declare-fun lt!505222 () ListLongMap!16063)

(declare-fun call!49823 () ListLongMap!16063)

(declare-fun bm!49818 () Bool)

(declare-fun contains!6583 (ListLongMap!16063 (_ BitVec 64)) Bool)

(assert (=> bm!49818 (= call!49819 (contains!6583 (ite c!111077 lt!505222 call!49823) k!934))))

(declare-fun b!1136315 () Bool)

(declare-fun e!646632 () Bool)

(declare-fun e!646636 () Bool)

(assert (=> b!1136315 (= e!646632 e!646636)))

(declare-fun res!758415 () Bool)

(assert (=> b!1136315 (=> res!758415 e!646636)))

(assert (=> b!1136315 (= res!758415 (or (bvsge (size!36170 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36170 _keys!1208)) (bvsge from!1455 (size!36170 _keys!1208))))))

(declare-datatypes ((List!24854 0))(
  ( (Nil!24851) (Cons!24850 (h!26059 (_ BitVec 64)) (t!35869 List!24854)) )
))
(declare-fun arrayNoDuplicates!0 (array!73967 (_ BitVec 32) List!24854) Bool)

(assert (=> b!1136315 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24851)))

(declare-fun lt!505223 () Unit!37214)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73967 (_ BitVec 32) (_ BitVec 32)) Unit!37214)

(assert (=> b!1136315 (= lt!505223 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!646631 () Bool)

(assert (=> b!1136315 e!646631))

(declare-fun res!758417 () Bool)

(assert (=> b!1136315 (=> (not res!758417) (not e!646631))))

(declare-fun e!646625 () Bool)

(assert (=> b!1136315 (= res!758417 e!646625)))

(declare-fun c!111076 () Bool)

(assert (=> b!1136315 (= c!111076 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!505217 () Unit!37214)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!349 (array!73967 array!73969 (_ BitVec 32) (_ BitVec 32) V!43197 V!43197 (_ BitVec 64) (_ BitVec 32) Int) Unit!37214)

(assert (=> b!1136315 (= lt!505217 (lemmaListMapContainsThenArrayContainsFrom!349 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!505233 () Unit!37214)

(declare-fun e!646624 () Unit!37214)

(assert (=> b!1136315 (= lt!505233 e!646624)))

(declare-fun lt!505232 () Bool)

(assert (=> b!1136315 (= c!111077 (and (not lt!505232) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1136315 (= lt!505232 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!49819 () Bool)

(declare-fun call!49824 () Unit!37214)

(assert (=> bm!49819 (= call!49824 call!49818)))

(declare-fun b!1136316 () Bool)

(declare-fun res!758412 () Bool)

(assert (=> b!1136316 (=> (not res!758412) (not e!646633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1136316 (= res!758412 (validMask!0 mask!1564))))

(declare-fun b!1136317 () Bool)

(assert (=> b!1136317 call!49821))

(declare-fun lt!505231 () Unit!37214)

(assert (=> b!1136317 (= lt!505231 call!49824)))

(declare-fun e!646635 () Unit!37214)

(assert (=> b!1136317 (= e!646635 lt!505231)))

(declare-fun b!1136318 () Bool)

(declare-fun res!758420 () Bool)

(assert (=> b!1136318 (=> (not res!758420) (not e!646633))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1136318 (= res!758420 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36170 _keys!1208))))))

(declare-fun b!1136319 () Bool)

(assert (=> b!1136319 (= e!646624 e!646635)))

(assert (=> b!1136319 (= c!111078 (and (not lt!505232) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1136320 () Bool)

(declare-fun res!758419 () Bool)

(assert (=> b!1136320 (=> res!758419 e!646636)))

(declare-fun contains!6584 (List!24854 (_ BitVec 64)) Bool)

(assert (=> b!1136320 (= res!758419 (contains!6584 Nil!24851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1136321 () Bool)

(declare-fun c!111075 () Bool)

(assert (=> b!1136321 (= c!111075 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505232))))

(declare-fun e!646627 () Unit!37214)

(assert (=> b!1136321 (= e!646635 e!646627)))

(declare-fun b!1136322 () Bool)

(declare-fun e!646623 () Bool)

(declare-fun e!646637 () Bool)

(assert (=> b!1136322 (= e!646623 e!646637)))

(declare-fun res!758411 () Bool)

(assert (=> b!1136322 (=> res!758411 e!646637)))

(assert (=> b!1136322 (= res!758411 (not (= from!1455 i!673)))))

(declare-fun lt!505224 () array!73969)

(declare-fun lt!505228 () ListLongMap!16063)

(declare-fun lt!505226 () array!73967)

(assert (=> b!1136322 (= lt!505228 (getCurrentListMapNoExtraKeys!4531 lt!505226 lt!505224 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2590 (Int (_ BitVec 64)) V!43197)

(assert (=> b!1136322 (= lt!505224 (array!73970 (store (arr!35635 _values!996) i!673 (ValueCellFull!13567 (dynLambda!2590 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36171 _values!996)))))

(declare-fun lt!505230 () ListLongMap!16063)

(assert (=> b!1136322 (= lt!505230 (getCurrentListMapNoExtraKeys!4531 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1136323 () Bool)

(declare-fun res!758421 () Bool)

(declare-fun e!646628 () Bool)

(assert (=> b!1136323 (=> (not res!758421) (not e!646628))))

(assert (=> b!1136323 (= res!758421 (arrayNoDuplicates!0 lt!505226 #b00000000000000000000000000000000 Nil!24851))))

(declare-fun b!1136324 () Bool)

(declare-fun res!758418 () Bool)

(assert (=> b!1136324 (=> (not res!758418) (not e!646633))))

(assert (=> b!1136324 (= res!758418 (= (select (arr!35634 _keys!1208) i!673) k!934))))

(declare-fun bm!49820 () Bool)

(declare-fun call!49825 () ListLongMap!16063)

(assert (=> bm!49820 (= call!49823 call!49825)))

(declare-fun b!1136325 () Bool)

(declare-fun -!1208 (ListLongMap!16063 (_ BitVec 64)) ListLongMap!16063)

(assert (=> b!1136325 (= e!646634 (= call!49820 (-!1208 call!49822 k!934)))))

(declare-fun mapNonEmpty!44654 () Bool)

(declare-fun mapRes!44654 () Bool)

(declare-fun tp!84780 () Bool)

(assert (=> mapNonEmpty!44654 (= mapRes!44654 (and tp!84780 e!646638))))

(declare-fun mapValue!44654 () ValueCell!13567)

(declare-fun mapRest!44654 () (Array (_ BitVec 32) ValueCell!13567))

(declare-fun mapKey!44654 () (_ BitVec 32))

(assert (=> mapNonEmpty!44654 (= (arr!35635 _values!996) (store mapRest!44654 mapKey!44654 mapValue!44654))))

(declare-fun b!1136326 () Bool)

(declare-fun lt!505218 () Unit!37214)

(assert (=> b!1136326 (= e!646624 lt!505218)))

(declare-fun lt!505219 () Unit!37214)

(assert (=> b!1136326 (= lt!505219 call!49818)))

(assert (=> b!1136326 (= lt!505222 call!49825)))

(assert (=> b!1136326 call!49819))

(assert (=> b!1136326 (= lt!505218 (addStillContains!744 lt!505222 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun +!3483 (ListLongMap!16063 tuple2!18094) ListLongMap!16063)

(assert (=> b!1136326 (contains!6583 (+!3483 lt!505222 (tuple2!18095 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1136327 () Bool)

(declare-fun res!758413 () Bool)

(assert (=> b!1136327 (=> (not res!758413) (not e!646633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1136327 (= res!758413 (validKeyInArray!0 k!934))))

(declare-fun b!1136328 () Bool)

(declare-fun e!646626 () Bool)

(assert (=> b!1136328 (= e!646629 (and e!646626 mapRes!44654))))

(declare-fun condMapEmpty!44654 () Bool)

(declare-fun mapDefault!44654 () ValueCell!13567)

