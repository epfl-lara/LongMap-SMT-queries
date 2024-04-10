; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100678 () Bool)

(assert start!100678)

(declare-fun b_free!25909 () Bool)

(declare-fun b_next!25909 () Bool)

(assert (=> start!100678 (= b_free!25909 (not b_next!25909))))

(declare-fun tp!90723 () Bool)

(declare-fun b_and!42765 () Bool)

(assert (=> start!100678 (= tp!90723 b_and!42765)))

(declare-fun b!1204342 () Bool)

(declare-fun e!683917 () Bool)

(declare-fun tp_is_empty!30613 () Bool)

(assert (=> b!1204342 (= e!683917 tp_is_empty!30613)))

(declare-fun e!683924 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1204343 () Bool)

(declare-fun lt!546126 () Bool)

(assert (=> b!1204343 (= e!683924 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546126) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1204344 () Bool)

(declare-fun res!801262 () Bool)

(declare-fun e!683913 () Bool)

(assert (=> b!1204344 (=> (not res!801262) (not e!683913))))

(declare-datatypes ((array!78003 0))(
  ( (array!78004 (arr!37644 (Array (_ BitVec 32) (_ BitVec 64))) (size!38180 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78003)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78003 (_ BitVec 32)) Bool)

(assert (=> b!1204344 (= res!801262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!45945 0))(
  ( (V!45946 (val!15363 Int)) )
))
(declare-datatypes ((tuple2!19698 0))(
  ( (tuple2!19699 (_1!9860 (_ BitVec 64)) (_2!9860 V!45945)) )
))
(declare-datatypes ((List!26508 0))(
  ( (Nil!26505) (Cons!26504 (h!27713 tuple2!19698) (t!39397 List!26508)) )
))
(declare-datatypes ((ListLongMap!17667 0))(
  ( (ListLongMap!17668 (toList!8849 List!26508)) )
))
(declare-fun call!58198 () ListLongMap!17667)

(declare-fun b!1204345 () Bool)

(declare-fun e!683923 () Bool)

(declare-fun call!58199 () ListLongMap!17667)

(declare-fun -!1815 (ListLongMap!17667 (_ BitVec 64)) ListLongMap!17667)

(assert (=> b!1204345 (= e!683923 (= call!58198 (-!1815 call!58199 k!934)))))

(declare-fun b!1204346 () Bool)

(declare-fun e!683915 () Bool)

(assert (=> b!1204346 (= e!683915 tp_is_empty!30613)))

(declare-fun b!1204347 () Bool)

(declare-fun res!801255 () Bool)

(assert (=> b!1204347 (=> (not res!801255) (not e!683913))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1204347 (= res!801255 (= (select (arr!37644 _keys!1208) i!673) k!934))))

(declare-fun zeroValue!944 () V!45945)

(declare-fun lt!546136 () ListLongMap!17667)

(declare-fun c!118060 () Bool)

(declare-fun c!118063 () Bool)

(declare-fun minValue!944 () V!45945)

(declare-fun call!58201 () ListLongMap!17667)

(declare-fun bm!58193 () Bool)

(declare-fun +!3975 (ListLongMap!17667 tuple2!19698) ListLongMap!17667)

(assert (=> bm!58193 (= call!58201 (+!3975 lt!546136 (ite (or c!118060 c!118063) (tuple2!19699 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19699 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1204348 () Bool)

(declare-fun c!118061 () Bool)

(assert (=> b!1204348 (= c!118061 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546126))))

(declare-datatypes ((Unit!39933 0))(
  ( (Unit!39934) )
))
(declare-fun e!683920 () Unit!39933)

(declare-fun e!683914 () Unit!39933)

(assert (=> b!1204348 (= e!683920 e!683914)))

(declare-fun b!1204349 () Bool)

(declare-fun e!683912 () Bool)

(assert (=> b!1204349 (= e!683913 e!683912)))

(declare-fun res!801254 () Bool)

(assert (=> b!1204349 (=> (not res!801254) (not e!683912))))

(declare-fun lt!546129 () array!78003)

(assert (=> b!1204349 (= res!801254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546129 mask!1564))))

(assert (=> b!1204349 (= lt!546129 (array!78004 (store (arr!37644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38180 _keys!1208)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14597 0))(
  ( (ValueCellFull!14597 (v!18005 V!45945)) (EmptyCell!14597) )
))
(declare-datatypes ((array!78005 0))(
  ( (array!78006 (arr!37645 (Array (_ BitVec 32) ValueCell!14597)) (size!38181 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78005)

(declare-fun bm!58194 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5285 (array!78003 array!78005 (_ BitVec 32) (_ BitVec 32) V!45945 V!45945 (_ BitVec 32) Int) ListLongMap!17667)

(assert (=> bm!58194 (= call!58199 (getCurrentListMapNoExtraKeys!5285 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204350 () Bool)

(declare-fun call!58200 () Bool)

(assert (=> b!1204350 call!58200))

(declare-fun lt!546125 () Unit!39933)

(declare-fun call!58202 () Unit!39933)

(assert (=> b!1204350 (= lt!546125 call!58202)))

(assert (=> b!1204350 (= e!683920 lt!546125)))

(declare-fun res!801259 () Bool)

(assert (=> start!100678 (=> (not res!801259) (not e!683913))))

(assert (=> start!100678 (= res!801259 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38180 _keys!1208))))))

(assert (=> start!100678 e!683913))

(assert (=> start!100678 tp_is_empty!30613))

(declare-fun array_inv!28680 (array!78003) Bool)

(assert (=> start!100678 (array_inv!28680 _keys!1208)))

(assert (=> start!100678 true))

(assert (=> start!100678 tp!90723))

(declare-fun e!683922 () Bool)

(declare-fun array_inv!28681 (array!78005) Bool)

(assert (=> start!100678 (and (array_inv!28681 _values!996) e!683922)))

(declare-fun bm!58195 () Bool)

(declare-fun call!58203 () Bool)

(assert (=> bm!58195 (= call!58200 call!58203)))

(declare-fun mapIsEmpty!47769 () Bool)

(declare-fun mapRes!47769 () Bool)

(assert (=> mapIsEmpty!47769 mapRes!47769))

(declare-fun b!1204351 () Bool)

(declare-fun Unit!39935 () Unit!39933)

(assert (=> b!1204351 (= e!683914 Unit!39935)))

(declare-fun b!1204352 () Bool)

(declare-fun res!801261 () Bool)

(assert (=> b!1204352 (=> (not res!801261) (not e!683913))))

(assert (=> b!1204352 (= res!801261 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38180 _keys!1208))))))

(declare-fun mapNonEmpty!47769 () Bool)

(declare-fun tp!90724 () Bool)

(assert (=> mapNonEmpty!47769 (= mapRes!47769 (and tp!90724 e!683915))))

(declare-fun mapValue!47769 () ValueCell!14597)

(declare-fun mapRest!47769 () (Array (_ BitVec 32) ValueCell!14597))

(declare-fun mapKey!47769 () (_ BitVec 32))

(assert (=> mapNonEmpty!47769 (= (arr!37645 _values!996) (store mapRest!47769 mapKey!47769 mapValue!47769))))

(declare-fun b!1204353 () Bool)

(declare-fun e!683919 () Unit!39933)

(declare-fun lt!546135 () Unit!39933)

(assert (=> b!1204353 (= e!683919 lt!546135)))

(declare-fun lt!546123 () Unit!39933)

(declare-fun call!58197 () Unit!39933)

(assert (=> b!1204353 (= lt!546123 call!58197)))

(declare-fun lt!546132 () ListLongMap!17667)

(assert (=> b!1204353 (= lt!546132 call!58201)))

(assert (=> b!1204353 call!58203))

(declare-fun addStillContains!1004 (ListLongMap!17667 (_ BitVec 64) V!45945 (_ BitVec 64)) Unit!39933)

(assert (=> b!1204353 (= lt!546135 (addStillContains!1004 lt!546132 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun contains!6907 (ListLongMap!17667 (_ BitVec 64)) Bool)

(assert (=> b!1204353 (contains!6907 (+!3975 lt!546132 (tuple2!19699 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun bm!58196 () Bool)

(declare-fun call!58196 () ListLongMap!17667)

(assert (=> bm!58196 (= call!58203 (contains!6907 (ite c!118060 lt!546132 call!58196) k!934))))

(declare-fun b!1204354 () Bool)

(declare-fun res!801260 () Bool)

(assert (=> b!1204354 (=> (not res!801260) (not e!683913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1204354 (= res!801260 (validMask!0 mask!1564))))

(declare-fun b!1204355 () Bool)

(declare-fun e!683921 () Bool)

(assert (=> b!1204355 (= e!683912 (not e!683921))))

(declare-fun res!801263 () Bool)

(assert (=> b!1204355 (=> res!801263 e!683921)))

(assert (=> b!1204355 (= res!801263 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1204355 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!546130 () Unit!39933)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78003 (_ BitVec 64) (_ BitVec 32)) Unit!39933)

(assert (=> b!1204355 (= lt!546130 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1204356 () Bool)

(assert (=> b!1204356 (= e!683923 (= call!58198 call!58199))))

(declare-fun b!1204357 () Bool)

(declare-fun lt!546134 () Unit!39933)

(assert (=> b!1204357 (= e!683914 lt!546134)))

(assert (=> b!1204357 (= lt!546134 call!58202)))

(assert (=> b!1204357 call!58200))

(declare-fun b!1204358 () Bool)

(assert (=> b!1204358 (= e!683922 (and e!683917 mapRes!47769))))

(declare-fun condMapEmpty!47769 () Bool)

(declare-fun mapDefault!47769 () ValueCell!14597)

