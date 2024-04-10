; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!902 () Bool)

(assert start!902)

(declare-fun b_free!275 () Bool)

(declare-fun b_next!275 () Bool)

(assert (=> start!902 (= b_free!275 (not b_next!275))))

(declare-fun tp!1058 () Bool)

(declare-fun b_and!423 () Bool)

(assert (=> start!902 (= tp!1058 b_and!423)))

(declare-fun b!7533 () Bool)

(declare-fun e!4202 () Bool)

(declare-fun tp_is_empty!353 () Bool)

(assert (=> b!7533 (= e!4202 tp_is_empty!353)))

(declare-fun mapIsEmpty!503 () Bool)

(declare-fun mapRes!503 () Bool)

(assert (=> mapIsEmpty!503 mapRes!503))

(declare-fun res!7460 () Bool)

(declare-fun e!4201 () Bool)

(assert (=> start!902 (=> (not res!7460) (not e!4201))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!902 (= res!7460 (validMask!0 mask!2250))))

(assert (=> start!902 e!4201))

(assert (=> start!902 tp!1058))

(assert (=> start!902 true))

(declare-datatypes ((V!647 0))(
  ( (V!648 (val!182 Int)) )
))
(declare-datatypes ((ValueCell!160 0))(
  ( (ValueCellFull!160 (v!1274 V!647)) (EmptyCell!160) )
))
(declare-datatypes ((array!639 0))(
  ( (array!640 (arr!307 (Array (_ BitVec 32) ValueCell!160)) (size!369 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!639)

(declare-fun e!4199 () Bool)

(declare-fun array_inv!227 (array!639) Bool)

(assert (=> start!902 (and (array_inv!227 _values!1492) e!4199)))

(assert (=> start!902 tp_is_empty!353))

(declare-datatypes ((array!641 0))(
  ( (array!642 (arr!308 (Array (_ BitVec 32) (_ BitVec 64))) (size!370 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!641)

(declare-fun array_inv!228 (array!641) Bool)

(assert (=> start!902 (array_inv!228 _keys!1806)))

(declare-fun b!7534 () Bool)

(declare-fun e!4200 () Bool)

(assert (=> b!7534 (= e!4199 (and e!4200 mapRes!503))))

(declare-fun condMapEmpty!503 () Bool)

(declare-fun mapDefault!503 () ValueCell!160)

