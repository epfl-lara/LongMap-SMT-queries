; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97206 () Bool)

(assert start!97206)

(declare-fun b!1106031 () Bool)

(declare-fun res!738056 () Bool)

(declare-fun e!631191 () Bool)

(assert (=> b!1106031 (=> (not res!738056) (not e!631191))))

(declare-datatypes ((array!71791 0))(
  ( (array!71792 (arr!34548 (Array (_ BitVec 32) (_ BitVec 64))) (size!35084 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71791)

(declare-datatypes ((List!24086 0))(
  ( (Nil!24083) (Cons!24082 (h!25291 (_ BitVec 64)) (t!34351 List!24086)) )
))
(declare-fun arrayNoDuplicates!0 (array!71791 (_ BitVec 32) List!24086) Bool)

(assert (=> b!1106031 (= res!738056 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24083))))

(declare-fun b!1106032 () Bool)

(declare-fun e!631188 () Bool)

(declare-fun tp_is_empty!27437 () Bool)

(assert (=> b!1106032 (= e!631188 tp_is_empty!27437)))

(declare-fun b!1106033 () Bool)

(declare-fun e!631190 () Bool)

(assert (=> b!1106033 (= e!631190 tp_is_empty!27437)))

(declare-fun b!1106034 () Bool)

(declare-fun res!738052 () Bool)

(declare-fun e!631189 () Bool)

(assert (=> b!1106034 (=> (not res!738052) (not e!631189))))

(declare-fun lt!495397 () array!71791)

(assert (=> b!1106034 (= res!738052 (arrayNoDuplicates!0 lt!495397 #b00000000000000000000000000000000 Nil!24083))))

(declare-fun b!1106035 () Bool)

(declare-fun res!738053 () Bool)

(assert (=> b!1106035 (=> (not res!738053) (not e!631191))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1106035 (= res!738053 (= (select (arr!34548 _keys!1208) i!673) k!934))))

(declare-fun b!1106036 () Bool)

(declare-fun res!738050 () Bool)

(assert (=> b!1106036 (=> (not res!738050) (not e!631191))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71791 (_ BitVec 32)) Bool)

(assert (=> b!1106036 (= res!738050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106037 () Bool)

(declare-fun e!631187 () Bool)

(declare-fun mapRes!42973 () Bool)

(assert (=> b!1106037 (= e!631187 (and e!631188 mapRes!42973))))

(declare-fun condMapEmpty!42973 () Bool)

(declare-datatypes ((V!41709 0))(
  ( (V!41710 (val!13775 Int)) )
))
(declare-datatypes ((ValueCell!13009 0))(
  ( (ValueCellFull!13009 (v!16408 V!41709)) (EmptyCell!13009) )
))
(declare-datatypes ((array!71793 0))(
  ( (array!71794 (arr!34549 (Array (_ BitVec 32) ValueCell!13009)) (size!35085 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71793)

(declare-fun mapDefault!42973 () ValueCell!13009)

