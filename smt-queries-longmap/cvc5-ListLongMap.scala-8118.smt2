; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99574 () Bool)

(assert start!99574)

(declare-fun b_free!25153 () Bool)

(declare-fun b_next!25153 () Bool)

(assert (=> start!99574 (= b_free!25153 (not b_next!25153))))

(declare-fun tp!88172 () Bool)

(declare-fun b_and!41173 () Bool)

(assert (=> start!99574 (= tp!88172 b_and!41173)))

(declare-fun b!1178815 () Bool)

(declare-fun res!783136 () Bool)

(declare-fun e!670169 () Bool)

(assert (=> b!1178815 (=> (not res!783136) (not e!670169))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76169 0))(
  ( (array!76170 (arr!36734 (Array (_ BitVec 32) (_ BitVec 64))) (size!37270 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76169)

(assert (=> b!1178815 (= res!783136 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37270 _keys!1208))))))

(declare-fun b!1178816 () Bool)

(declare-fun res!783135 () Bool)

(assert (=> b!1178816 (=> (not res!783135) (not e!670169))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178816 (= res!783135 (validKeyInArray!0 k!934))))

(declare-fun e!670171 () Bool)

(declare-fun b!1178817 () Bool)

(declare-datatypes ((V!44705 0))(
  ( (V!44706 (val!14898 Int)) )
))
(declare-datatypes ((tuple2!19066 0))(
  ( (tuple2!19067 (_1!9544 (_ BitVec 64)) (_2!9544 V!44705)) )
))
(declare-datatypes ((List!25804 0))(
  ( (Nil!25801) (Cons!25800 (h!27009 tuple2!19066) (t!37949 List!25804)) )
))
(declare-datatypes ((ListLongMap!17035 0))(
  ( (ListLongMap!17036 (toList!8533 List!25804)) )
))
(declare-fun lt!532613 () ListLongMap!17035)

(declare-fun lt!532612 () ListLongMap!17035)

(declare-fun lt!532611 () tuple2!19066)

(declare-fun +!3847 (ListLongMap!17035 tuple2!19066) ListLongMap!17035)

(assert (=> b!1178817 (= e!670171 (= lt!532612 (+!3847 lt!532613 lt!532611)))))

(declare-fun b!1178818 () Bool)

(declare-fun e!670162 () Bool)

(declare-fun e!670160 () Bool)

(declare-fun mapRes!46352 () Bool)

(assert (=> b!1178818 (= e!670162 (and e!670160 mapRes!46352))))

(declare-fun condMapEmpty!46352 () Bool)

(declare-datatypes ((ValueCell!14132 0))(
  ( (ValueCellFull!14132 (v!17536 V!44705)) (EmptyCell!14132) )
))
(declare-datatypes ((array!76171 0))(
  ( (array!76172 (arr!36735 (Array (_ BitVec 32) ValueCell!14132)) (size!37271 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76171)

(declare-fun mapDefault!46352 () ValueCell!14132)

