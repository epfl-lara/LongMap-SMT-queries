; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!910 () Bool)

(assert start!910)

(declare-fun b_free!283 () Bool)

(declare-fun b_next!283 () Bool)

(assert (=> start!910 (= b_free!283 (not b_next!283))))

(declare-fun tp!1082 () Bool)

(declare-fun b_and!431 () Bool)

(assert (=> start!910 (= tp!1082 b_and!431)))

(declare-fun mapIsEmpty!515 () Bool)

(declare-fun mapRes!515 () Bool)

(assert (=> mapIsEmpty!515 mapRes!515))

(declare-fun b!7617 () Bool)

(declare-fun e!4259 () Bool)

(declare-fun tp_is_empty!361 () Bool)

(assert (=> b!7617 (= e!4259 tp_is_empty!361)))

(declare-fun b!7618 () Bool)

(declare-fun e!4258 () Bool)

(assert (=> b!7618 (= e!4258 tp_is_empty!361)))

(declare-fun b!7619 () Bool)

(declare-fun res!7509 () Bool)

(declare-fun e!4261 () Bool)

(assert (=> b!7619 (=> (not res!7509) (not e!4261))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!659 0))(
  ( (V!660 (val!186 Int)) )
))
(declare-datatypes ((ValueCell!164 0))(
  ( (ValueCellFull!164 (v!1278 V!659)) (EmptyCell!164) )
))
(declare-datatypes ((array!655 0))(
  ( (array!656 (arr!315 (Array (_ BitVec 32) ValueCell!164)) (size!377 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!655)

(declare-datatypes ((array!657 0))(
  ( (array!658 (arr!316 (Array (_ BitVec 32) (_ BitVec 64))) (size!378 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!657)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7619 (= res!7509 (and (= (size!377 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!378 _keys!1806) (size!377 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!7510 () Bool)

(assert (=> start!910 (=> (not res!7510) (not e!4261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!910 (= res!7510 (validMask!0 mask!2250))))

(assert (=> start!910 e!4261))

(assert (=> start!910 tp!1082))

(assert (=> start!910 true))

(declare-fun e!4260 () Bool)

(declare-fun array_inv!233 (array!655) Bool)

(assert (=> start!910 (and (array_inv!233 _values!1492) e!4260)))

(assert (=> start!910 tp_is_empty!361))

(declare-fun array_inv!234 (array!657) Bool)

(assert (=> start!910 (array_inv!234 _keys!1806)))

(declare-fun mapNonEmpty!515 () Bool)

(declare-fun tp!1081 () Bool)

(assert (=> mapNonEmpty!515 (= mapRes!515 (and tp!1081 e!4259))))

(declare-fun mapRest!515 () (Array (_ BitVec 32) ValueCell!164))

(declare-fun mapValue!515 () ValueCell!164)

(declare-fun mapKey!515 () (_ BitVec 32))

(assert (=> mapNonEmpty!515 (= (arr!315 _values!1492) (store mapRest!515 mapKey!515 mapValue!515))))

(declare-fun b!7620 () Bool)

(declare-fun res!7507 () Bool)

(assert (=> b!7620 (=> (not res!7507) (not e!4261))))

(declare-datatypes ((List!212 0))(
  ( (Nil!209) (Cons!208 (h!774 (_ BitVec 64)) (t!2349 List!212)) )
))
(declare-fun arrayNoDuplicates!0 (array!657 (_ BitVec 32) List!212) Bool)

(assert (=> b!7620 (= res!7507 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!209))))

(declare-fun b!7621 () Bool)

(assert (=> b!7621 (= e!4260 (and e!4258 mapRes!515))))

(declare-fun condMapEmpty!515 () Bool)

(declare-fun mapDefault!515 () ValueCell!164)

