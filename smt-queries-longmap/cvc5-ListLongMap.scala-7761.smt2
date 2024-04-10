; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97310 () Bool)

(assert start!97310)

(declare-fun b_free!23281 () Bool)

(declare-fun b_next!23281 () Bool)

(assert (=> start!97310 (= b_free!23281 (not b_next!23281))))

(declare-fun tp!82141 () Bool)

(declare-fun b_and!37393 () Bool)

(assert (=> start!97310 (= tp!82141 b_and!37393)))

(declare-fun b!1108395 () Bool)

(declare-fun res!739703 () Bool)

(declare-fun e!632310 () Bool)

(assert (=> b!1108395 (=> (not res!739703) (not e!632310))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71999 0))(
  ( (array!72000 (arr!34652 (Array (_ BitVec 32) (_ BitVec 64))) (size!35188 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71999)

(assert (=> b!1108395 (= res!739703 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35188 _keys!1208))))))

(declare-fun b!1108396 () Bool)

(declare-fun e!632312 () Bool)

(declare-fun e!632309 () Bool)

(declare-fun mapRes!43129 () Bool)

(assert (=> b!1108396 (= e!632312 (and e!632309 mapRes!43129))))

(declare-fun condMapEmpty!43129 () Bool)

(declare-datatypes ((V!41849 0))(
  ( (V!41850 (val!13827 Int)) )
))
(declare-datatypes ((ValueCell!13061 0))(
  ( (ValueCellFull!13061 (v!16460 V!41849)) (EmptyCell!13061) )
))
(declare-datatypes ((array!72001 0))(
  ( (array!72002 (arr!34653 (Array (_ BitVec 32) ValueCell!13061)) (size!35189 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72001)

(declare-fun mapDefault!43129 () ValueCell!13061)

