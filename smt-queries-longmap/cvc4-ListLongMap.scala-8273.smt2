; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100682 () Bool)

(assert start!100682)

(declare-fun b_free!25913 () Bool)

(declare-fun b_next!25913 () Bool)

(assert (=> start!100682 (= b_free!25913 (not b_next!25913))))

(declare-fun tp!90735 () Bool)

(declare-fun b_and!42773 () Bool)

(assert (=> start!100682 (= tp!90735 b_and!42773)))

(declare-fun b!1204508 () Bool)

(declare-fun e!684015 () Bool)

(declare-fun e!684013 () Bool)

(assert (=> b!1204508 (= e!684015 (not e!684013))))

(declare-fun res!801347 () Bool)

(assert (=> b!1204508 (=> res!801347 e!684013)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1204508 (= res!801347 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78011 0))(
  ( (array!78012 (arr!37648 (Array (_ BitVec 32) (_ BitVec 64))) (size!38184 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78011)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1204508 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39939 0))(
  ( (Unit!39940) )
))
(declare-fun lt!546223 () Unit!39939)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78011 (_ BitVec 64) (_ BitVec 32)) Unit!39939)

(assert (=> b!1204508 (= lt!546223 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!47775 () Bool)

(declare-fun mapRes!47775 () Bool)

(assert (=> mapIsEmpty!47775 mapRes!47775))

(declare-fun b!1204509 () Bool)

(declare-fun e!684009 () Unit!39939)

(declare-fun e!684007 () Unit!39939)

(assert (=> b!1204509 (= e!684009 e!684007)))

(declare-fun c!118093 () Bool)

(declare-fun lt!546217 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1204509 (= c!118093 (and (not lt!546217) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1204510 () Bool)

(declare-fun res!801348 () Bool)

(declare-fun e!684003 () Bool)

(assert (=> b!1204510 (=> (not res!801348) (not e!684003))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45949 0))(
  ( (V!45950 (val!15365 Int)) )
))
(declare-datatypes ((ValueCell!14599 0))(
  ( (ValueCellFull!14599 (v!18007 V!45949)) (EmptyCell!14599) )
))
(declare-datatypes ((array!78013 0))(
  ( (array!78014 (arr!37649 (Array (_ BitVec 32) ValueCell!14599)) (size!38185 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78013)

(assert (=> b!1204510 (= res!801348 (and (= (size!38185 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38184 _keys!1208) (size!38185 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!58241 () Bool)

(declare-datatypes ((tuple2!19702 0))(
  ( (tuple2!19703 (_1!9862 (_ BitVec 64)) (_2!9862 V!45949)) )
))
(declare-datatypes ((List!26511 0))(
  ( (Nil!26508) (Cons!26507 (h!27716 tuple2!19702) (t!39404 List!26511)) )
))
(declare-datatypes ((ListLongMap!17671 0))(
  ( (ListLongMap!17672 (toList!8851 List!26511)) )
))
(declare-fun call!58249 () ListLongMap!17671)

(declare-fun call!58250 () ListLongMap!17671)

(assert (=> bm!58241 (= call!58249 call!58250)))

(declare-fun b!1204511 () Bool)

(declare-fun e!684005 () Bool)

(declare-fun tp_is_empty!30617 () Bool)

(assert (=> b!1204511 (= e!684005 tp_is_empty!30617)))

(declare-fun zeroValue!944 () V!45949)

(declare-fun lt!546218 () array!78011)

(declare-fun minValue!944 () V!45949)

(declare-fun call!58245 () ListLongMap!17671)

(declare-fun bm!58242 () Bool)

(declare-fun lt!546213 () array!78013)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5287 (array!78011 array!78013 (_ BitVec 32) (_ BitVec 32) V!45949 V!45949 (_ BitVec 32) Int) ListLongMap!17671)

(assert (=> bm!58242 (= call!58245 (getCurrentListMapNoExtraKeys!5287 lt!546218 lt!546213 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546220 () ListLongMap!17671)

(declare-fun c!118091 () Bool)

(declare-fun lt!546226 () ListLongMap!17671)

(declare-fun bm!58243 () Bool)

(declare-fun +!3977 (ListLongMap!17671 tuple2!19702) ListLongMap!17671)

(assert (=> bm!58243 (= call!58250 (+!3977 (ite c!118091 lt!546226 lt!546220) (ite c!118091 (tuple2!19703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118093 (tuple2!19703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1204512 () Bool)

(declare-fun e!684004 () Bool)

(assert (=> b!1204512 (= e!684004 (and e!684005 mapRes!47775))))

(declare-fun condMapEmpty!47775 () Bool)

(declare-fun mapDefault!47775 () ValueCell!14599)

