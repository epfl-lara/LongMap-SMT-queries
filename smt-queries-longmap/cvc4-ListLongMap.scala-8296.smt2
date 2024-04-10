; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101090 () Bool)

(assert start!101090)

(declare-fun b_free!26051 () Bool)

(declare-fun b_next!26051 () Bool)

(assert (=> start!101090 (= b_free!26051 (not b_next!26051))))

(declare-fun tp!91172 () Bool)

(declare-fun b_and!43201 () Bool)

(assert (=> start!101090 (= tp!91172 b_and!43201)))

(declare-fun b!1212196 () Bool)

(declare-fun res!805152 () Bool)

(declare-fun e!688427 () Bool)

(assert (=> b!1212196 (=> (not res!805152) (not e!688427))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1212196 (= res!805152 (validMask!0 mask!1564))))

(declare-fun b!1212197 () Bool)

(declare-fun e!688414 () Bool)

(assert (=> b!1212197 (= e!688427 e!688414)))

(declare-fun res!805146 () Bool)

(assert (=> b!1212197 (=> (not res!805146) (not e!688414))))

(declare-datatypes ((array!78297 0))(
  ( (array!78298 (arr!37784 (Array (_ BitVec 32) (_ BitVec 64))) (size!38320 (_ BitVec 32))) )
))
(declare-fun lt!550798 () array!78297)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78297 (_ BitVec 32)) Bool)

(assert (=> b!1212197 (= res!805146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550798 mask!1564))))

(declare-fun _keys!1208 () array!78297)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1212197 (= lt!550798 (array!78298 (store (arr!37784 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38320 _keys!1208)))))

(declare-fun b!1212198 () Bool)

(declare-datatypes ((Unit!40202 0))(
  ( (Unit!40203) )
))
(declare-fun e!688418 () Unit!40202)

(declare-fun Unit!40204 () Unit!40202)

(assert (=> b!1212198 (= e!688418 Unit!40204)))

(declare-fun lt!550784 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1212198 (= lt!550784 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!119623 () Bool)

(assert (=> b!1212198 (= c!119623 (and (not lt!550784) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550800 () Unit!40202)

(declare-fun e!688419 () Unit!40202)

(assert (=> b!1212198 (= lt!550800 e!688419)))

(declare-datatypes ((V!46133 0))(
  ( (V!46134 (val!15434 Int)) )
))
(declare-fun zeroValue!944 () V!46133)

(declare-fun lt!550794 () Unit!40202)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14668 0))(
  ( (ValueCellFull!14668 (v!18086 V!46133)) (EmptyCell!14668) )
))
(declare-datatypes ((array!78299 0))(
  ( (array!78300 (arr!37785 (Array (_ BitVec 32) ValueCell!14668)) (size!38321 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78299)

(declare-fun minValue!944 () V!46133)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!611 (array!78297 array!78299 (_ BitVec 32) (_ BitVec 32) V!46133 V!46133 (_ BitVec 64) (_ BitVec 32) Int) Unit!40202)

(assert (=> b!1212198 (= lt!550794 (lemmaListMapContainsThenArrayContainsFrom!611 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119620 () Bool)

(assert (=> b!1212198 (= c!119620 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805144 () Bool)

(declare-fun e!688428 () Bool)

(assert (=> b!1212198 (= res!805144 e!688428)))

(declare-fun e!688425 () Bool)

(assert (=> b!1212198 (=> (not res!805144) (not e!688425))))

(assert (=> b!1212198 e!688425))

(declare-fun lt!550789 () Unit!40202)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78297 (_ BitVec 32) (_ BitVec 32)) Unit!40202)

(assert (=> b!1212198 (= lt!550789 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26633 0))(
  ( (Nil!26630) (Cons!26629 (h!27838 (_ BitVec 64)) (t!39664 List!26633)) )
))
(declare-fun arrayNoDuplicates!0 (array!78297 (_ BitVec 32) List!26633) Bool)

(assert (=> b!1212198 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26630)))

(declare-fun lt!550787 () Unit!40202)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78297 (_ BitVec 64) (_ BitVec 32) List!26633) Unit!40202)

(assert (=> b!1212198 (= lt!550787 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26630))))

(assert (=> b!1212198 false))

(declare-fun b!1212199 () Bool)

(declare-fun e!688415 () Unit!40202)

(declare-fun Unit!40205 () Unit!40202)

(assert (=> b!1212199 (= e!688415 Unit!40205)))

(declare-fun b!1212200 () Bool)

(declare-datatypes ((tuple2!19832 0))(
  ( (tuple2!19833 (_1!9927 (_ BitVec 64)) (_2!9927 V!46133)) )
))
(declare-datatypes ((List!26634 0))(
  ( (Nil!26631) (Cons!26630 (h!27839 tuple2!19832) (t!39665 List!26634)) )
))
(declare-datatypes ((ListLongMap!17801 0))(
  ( (ListLongMap!17802 (toList!8916 List!26634)) )
))
(declare-fun call!60076 () ListLongMap!17801)

(declare-fun call!60080 () ListLongMap!17801)

(declare-fun e!688421 () Bool)

(declare-fun -!1864 (ListLongMap!17801 (_ BitVec 64)) ListLongMap!17801)

(assert (=> b!1212200 (= e!688421 (= call!60080 (-!1864 call!60076 k!934)))))

(declare-fun b!1212201 () Bool)

(declare-fun arrayContainsKey!0 (array!78297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1212201 (= e!688425 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!48004 () Bool)

(declare-fun mapRes!48004 () Bool)

(declare-fun tp!91171 () Bool)

(declare-fun e!688423 () Bool)

(assert (=> mapNonEmpty!48004 (= mapRes!48004 (and tp!91171 e!688423))))

(declare-fun mapKey!48004 () (_ BitVec 32))

(declare-fun mapRest!48004 () (Array (_ BitVec 32) ValueCell!14668))

(declare-fun mapValue!48004 () ValueCell!14668)

(assert (=> mapNonEmpty!48004 (= (arr!37785 _values!996) (store mapRest!48004 mapKey!48004 mapValue!48004))))

(declare-fun b!1212202 () Bool)

(declare-fun tp_is_empty!30755 () Bool)

(assert (=> b!1212202 (= e!688423 tp_is_empty!30755)))

(declare-fun b!1212203 () Bool)

(declare-fun res!805142 () Bool)

(assert (=> b!1212203 (=> (not res!805142) (not e!688427))))

(assert (=> b!1212203 (= res!805142 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38320 _keys!1208))))))

(declare-fun lt!550795 () array!78299)

(declare-fun bm!60071 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5348 (array!78297 array!78299 (_ BitVec 32) (_ BitVec 32) V!46133 V!46133 (_ BitVec 32) Int) ListLongMap!17801)

(assert (=> bm!60071 (= call!60080 (getCurrentListMapNoExtraKeys!5348 lt!550798 lt!550795 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212204 () Bool)

(declare-fun res!805156 () Bool)

(assert (=> b!1212204 (=> (not res!805156) (not e!688427))))

(assert (=> b!1212204 (= res!805156 (= (select (arr!37784 _keys!1208) i!673) k!934))))

(declare-fun lt!550786 () ListLongMap!17801)

(declare-fun call!60081 () Bool)

(declare-fun call!60077 () ListLongMap!17801)

(declare-fun bm!60072 () Bool)

(declare-fun contains!6988 (ListLongMap!17801 (_ BitVec 64)) Bool)

(assert (=> bm!60072 (= call!60081 (contains!6988 (ite c!119623 lt!550786 call!60077) k!934))))

(declare-fun b!1212205 () Bool)

(declare-fun res!805154 () Bool)

(assert (=> b!1212205 (=> (not res!805154) (not e!688427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1212205 (= res!805154 (validKeyInArray!0 k!934))))

(declare-fun b!1212206 () Bool)

(assert (=> b!1212206 (= e!688428 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550784) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1212207 () Bool)

(declare-fun e!688412 () Bool)

(declare-fun e!688413 () Bool)

(assert (=> b!1212207 (= e!688412 e!688413)))

(declare-fun res!805145 () Bool)

(assert (=> b!1212207 (=> res!805145 e!688413)))

(assert (=> b!1212207 (= res!805145 (not (= (select (arr!37784 _keys!1208) from!1455) k!934)))))

(assert (=> b!1212207 e!688421))

(declare-fun c!119621 () Bool)

(assert (=> b!1212207 (= c!119621 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550797 () Unit!40202)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1074 (array!78297 array!78299 (_ BitVec 32) (_ BitVec 32) V!46133 V!46133 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40202)

(assert (=> b!1212207 (= lt!550797 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1074 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212208 () Bool)

(declare-fun e!688426 () Bool)

(declare-fun e!688420 () Bool)

(assert (=> b!1212208 (= e!688426 (and e!688420 mapRes!48004))))

(declare-fun condMapEmpty!48004 () Bool)

(declare-fun mapDefault!48004 () ValueCell!14668)

