; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101176 () Bool)

(assert start!101176)

(declare-fun b_free!26099 () Bool)

(declare-fun b_next!26099 () Bool)

(assert (=> start!101176 (= b_free!26099 (not b_next!26099))))

(declare-fun tp!91318 () Bool)

(declare-fun b_and!43315 () Bool)

(assert (=> start!101176 (= tp!91318 b_and!43315)))

(declare-fun b!1214452 () Bool)

(declare-fun e!689673 () Bool)

(declare-fun tp_is_empty!30803 () Bool)

(assert (=> b!1214452 (= e!689673 tp_is_empty!30803)))

(declare-fun b!1214453 () Bool)

(declare-fun e!689677 () Bool)

(assert (=> b!1214453 (= e!689677 tp_is_empty!30803)))

(declare-fun b!1214454 () Bool)

(declare-fun res!806263 () Bool)

(declare-fun e!689675 () Bool)

(assert (=> b!1214454 (=> (not res!806263) (not e!689675))))

(declare-datatypes ((array!78389 0))(
  ( (array!78390 (arr!37829 (Array (_ BitVec 32) (_ BitVec 64))) (size!38365 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78389)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1214454 (= res!806263 (= (select (arr!37829 _keys!1208) i!673) k!934))))

(declare-fun b!1214455 () Bool)

(declare-fun res!806268 () Bool)

(declare-fun e!689676 () Bool)

(assert (=> b!1214455 (=> (not res!806268) (not e!689676))))

(declare-fun lt!552347 () array!78389)

(declare-datatypes ((List!26670 0))(
  ( (Nil!26667) (Cons!26666 (h!27875 (_ BitVec 64)) (t!39749 List!26670)) )
))
(declare-fun arrayNoDuplicates!0 (array!78389 (_ BitVec 32) List!26670) Bool)

(assert (=> b!1214455 (= res!806268 (arrayNoDuplicates!0 lt!552347 #b00000000000000000000000000000000 Nil!26667))))

(declare-fun b!1214456 () Bool)

(declare-fun res!806265 () Bool)

(assert (=> b!1214456 (=> (not res!806265) (not e!689675))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214456 (= res!806265 (validMask!0 mask!1564))))

(declare-fun b!1214457 () Bool)

(declare-fun e!689672 () Bool)

(declare-fun mapRes!48079 () Bool)

(assert (=> b!1214457 (= e!689672 (and e!689673 mapRes!48079))))

(declare-fun condMapEmpty!48079 () Bool)

(declare-datatypes ((V!46197 0))(
  ( (V!46198 (val!15458 Int)) )
))
(declare-datatypes ((ValueCell!14692 0))(
  ( (ValueCellFull!14692 (v!18111 V!46197)) (EmptyCell!14692) )
))
(declare-datatypes ((array!78391 0))(
  ( (array!78392 (arr!37830 (Array (_ BitVec 32) ValueCell!14692)) (size!38366 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78391)

(declare-fun mapDefault!48079 () ValueCell!14692)

