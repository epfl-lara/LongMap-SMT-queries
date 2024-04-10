; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72260 () Bool)

(assert start!72260)

(declare-fun mapNonEmpty!24581 () Bool)

(declare-fun mapRes!24581 () Bool)

(declare-fun tp!47575 () Bool)

(declare-fun e!467309 () Bool)

(assert (=> mapNonEmpty!24581 (= mapRes!24581 (and tp!47575 e!467309))))

(declare-fun mapKey!24581 () (_ BitVec 32))

(declare-datatypes ((V!25477 0))(
  ( (V!25478 (val!7709 Int)) )
))
(declare-datatypes ((ValueCell!7222 0))(
  ( (ValueCellFull!7222 (v!10133 V!25477)) (EmptyCell!7222) )
))
(declare-fun mapValue!24581 () ValueCell!7222)

(declare-datatypes ((array!46946 0))(
  ( (array!46947 (arr!22505 (Array (_ BitVec 32) ValueCell!7222)) (size!22945 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46946)

(declare-fun mapRest!24581 () (Array (_ BitVec 32) ValueCell!7222))

(assert (=> mapNonEmpty!24581 (= (arr!22505 _values!688) (store mapRest!24581 mapKey!24581 mapValue!24581))))

(declare-fun b!837340 () Bool)

(declare-fun res!569489 () Bool)

(declare-fun e!467306 () Bool)

(assert (=> b!837340 (=> (not res!569489) (not e!467306))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837340 (= res!569489 (validMask!0 mask!1196))))

(declare-fun b!837341 () Bool)

(declare-fun e!467305 () Bool)

(declare-datatypes ((List!16025 0))(
  ( (Nil!16022) (Cons!16021 (h!17152 (_ BitVec 64)) (t!22396 List!16025)) )
))
(declare-fun contains!4216 (List!16025 (_ BitVec 64)) Bool)

(assert (=> b!837341 (= e!467305 (contains!4216 Nil!16022 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!837342 () Bool)

(declare-fun e!467304 () Bool)

(declare-fun e!467307 () Bool)

(assert (=> b!837342 (= e!467304 (and e!467307 mapRes!24581))))

(declare-fun condMapEmpty!24581 () Bool)

(declare-fun mapDefault!24581 () ValueCell!7222)

