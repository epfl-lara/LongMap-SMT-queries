; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!922 () Bool)

(assert start!922)

(declare-fun b_free!295 () Bool)

(declare-fun b_next!295 () Bool)

(assert (=> start!922 (= b_free!295 (not b_next!295))))

(declare-fun tp!1118 () Bool)

(declare-fun b_and!443 () Bool)

(assert (=> start!922 (= tp!1118 b_and!443)))

(declare-fun b!7743 () Bool)

(declare-fun e!4351 () Bool)

(declare-fun tp_is_empty!373 () Bool)

(assert (=> b!7743 (= e!4351 tp_is_empty!373)))

(declare-fun res!7580 () Bool)

(declare-fun e!4350 () Bool)

(assert (=> start!922 (=> (not res!7580) (not e!4350))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!922 (= res!7580 (validMask!0 mask!2250))))

(assert (=> start!922 e!4350))

(assert (=> start!922 tp!1118))

(assert (=> start!922 true))

(declare-datatypes ((V!675 0))(
  ( (V!676 (val!192 Int)) )
))
(declare-datatypes ((ValueCell!170 0))(
  ( (ValueCellFull!170 (v!1284 V!675)) (EmptyCell!170) )
))
(declare-datatypes ((array!679 0))(
  ( (array!680 (arr!327 (Array (_ BitVec 32) ValueCell!170)) (size!389 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!679)

(declare-fun e!4349 () Bool)

(declare-fun array_inv!243 (array!679) Bool)

(assert (=> start!922 (and (array_inv!243 _values!1492) e!4349)))

(assert (=> start!922 tp_is_empty!373))

(declare-datatypes ((array!681 0))(
  ( (array!682 (arr!328 (Array (_ BitVec 32) (_ BitVec 64))) (size!390 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!681)

(declare-fun array_inv!244 (array!681) Bool)

(assert (=> start!922 (array_inv!244 _keys!1806)))

(declare-fun mapIsEmpty!533 () Bool)

(declare-fun mapRes!533 () Bool)

(assert (=> mapIsEmpty!533 mapRes!533))

(declare-fun b!7744 () Bool)

(declare-fun e!4352 () Bool)

(assert (=> b!7744 (= e!4352 tp_is_empty!373)))

(declare-fun b!7745 () Bool)

(declare-fun res!7582 () Bool)

(assert (=> b!7745 (=> (not res!7582) (not e!4350))))

(declare-datatypes ((List!221 0))(
  ( (Nil!218) (Cons!217 (h!783 (_ BitVec 64)) (t!2358 List!221)) )
))
(declare-fun arrayNoDuplicates!0 (array!681 (_ BitVec 32) List!221) Bool)

(assert (=> b!7745 (= res!7582 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!218))))

(declare-fun mapNonEmpty!533 () Bool)

(declare-fun tp!1117 () Bool)

(assert (=> mapNonEmpty!533 (= mapRes!533 (and tp!1117 e!4352))))

(declare-fun mapRest!533 () (Array (_ BitVec 32) ValueCell!170))

(declare-fun mapValue!533 () ValueCell!170)

(declare-fun mapKey!533 () (_ BitVec 32))

(assert (=> mapNonEmpty!533 (= (arr!327 _values!1492) (store mapRest!533 mapKey!533 mapValue!533))))

(declare-fun b!7746 () Bool)

(declare-fun res!7581 () Bool)

(assert (=> b!7746 (=> (not res!7581) (not e!4350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!681 (_ BitVec 32)) Bool)

(assert (=> b!7746 (= res!7581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7747 () Bool)

(assert (=> b!7747 (= e!4349 (and e!4351 mapRes!533))))

(declare-fun condMapEmpty!533 () Bool)

(declare-fun mapDefault!533 () ValueCell!170)

