; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97350 () Bool)

(assert start!97350)

(declare-fun b_free!23321 () Bool)

(declare-fun b_next!23321 () Bool)

(assert (=> start!97350 (= b_free!23321 (not b_next!23321))))

(declare-fun tp!82262 () Bool)

(declare-fun b_and!37477 () Bool)

(assert (=> start!97350 (= tp!82262 b_and!37477)))

(declare-fun res!740367 () Bool)

(declare-fun e!632799 () Bool)

(assert (=> start!97350 (=> (not res!740367) (not e!632799))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72079 0))(
  ( (array!72080 (arr!34692 (Array (_ BitVec 32) (_ BitVec 64))) (size!35228 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72079)

(assert (=> start!97350 (= res!740367 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35228 _keys!1208))))))

(assert (=> start!97350 e!632799))

(declare-fun tp_is_empty!27581 () Bool)

(assert (=> start!97350 tp_is_empty!27581))

(declare-fun array_inv!26698 (array!72079) Bool)

(assert (=> start!97350 (array_inv!26698 _keys!1208)))

(assert (=> start!97350 true))

(assert (=> start!97350 tp!82262))

(declare-datatypes ((V!41901 0))(
  ( (V!41902 (val!13847 Int)) )
))
(declare-datatypes ((ValueCell!13081 0))(
  ( (ValueCellFull!13081 (v!16480 V!41901)) (EmptyCell!13081) )
))
(declare-datatypes ((array!72081 0))(
  ( (array!72082 (arr!34693 (Array (_ BitVec 32) ValueCell!13081)) (size!35229 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72081)

(declare-fun e!632804 () Bool)

(declare-fun array_inv!26699 (array!72081) Bool)

(assert (=> start!97350 (and (array_inv!26699 _values!996) e!632804)))

(declare-fun b!1109419 () Bool)

(declare-fun res!740368 () Bool)

(declare-fun e!632805 () Bool)

(assert (=> b!1109419 (=> (not res!740368) (not e!632805))))

(declare-fun lt!495982 () array!72079)

(declare-datatypes ((List!24188 0))(
  ( (Nil!24185) (Cons!24184 (h!25393 (_ BitVec 64)) (t!34555 List!24188)) )
))
(declare-fun arrayNoDuplicates!0 (array!72079 (_ BitVec 32) List!24188) Bool)

(assert (=> b!1109419 (= res!740368 (arrayNoDuplicates!0 lt!495982 #b00000000000000000000000000000000 Nil!24185))))

(declare-fun b!1109420 () Bool)

(declare-fun e!632801 () Bool)

(declare-fun mapRes!43189 () Bool)

(assert (=> b!1109420 (= e!632804 (and e!632801 mapRes!43189))))

(declare-fun condMapEmpty!43189 () Bool)

(declare-fun mapDefault!43189 () ValueCell!13081)

