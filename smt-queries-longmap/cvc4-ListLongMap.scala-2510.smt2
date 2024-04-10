; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38882 () Bool)

(assert start!38882)

(declare-fun b!406391 () Bool)

(declare-fun e!244216 () Bool)

(declare-fun tp_is_empty!10301 () Bool)

(assert (=> b!406391 (= e!244216 tp_is_empty!10301)))

(declare-fun b!406392 () Bool)

(declare-fun res!234744 () Bool)

(declare-fun e!244215 () Bool)

(assert (=> b!406392 (=> (not res!234744) (not e!244215))))

(declare-datatypes ((array!24493 0))(
  ( (array!24494 (arr!11696 (Array (_ BitVec 32) (_ BitVec 64))) (size!12048 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24493)

(declare-datatypes ((List!6793 0))(
  ( (Nil!6790) (Cons!6789 (h!7645 (_ BitVec 64)) (t!11967 List!6793)) )
))
(declare-fun arrayNoDuplicates!0 (array!24493 (_ BitVec 32) List!6793) Bool)

(assert (=> b!406392 (= res!234744 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6790))))

(declare-fun b!406393 () Bool)

(declare-fun e!244217 () Bool)

(assert (=> b!406393 (= e!244217 tp_is_empty!10301)))

(declare-fun b!406394 () Bool)

(declare-fun e!244214 () Bool)

(declare-fun mapRes!17073 () Bool)

(assert (=> b!406394 (= e!244214 (and e!244216 mapRes!17073))))

(declare-fun condMapEmpty!17073 () Bool)

(declare-datatypes ((V!14839 0))(
  ( (V!14840 (val!5195 Int)) )
))
(declare-datatypes ((ValueCell!4807 0))(
  ( (ValueCellFull!4807 (v!7442 V!14839)) (EmptyCell!4807) )
))
(declare-datatypes ((array!24495 0))(
  ( (array!24496 (arr!11697 (Array (_ BitVec 32) ValueCell!4807)) (size!12049 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24495)

(declare-fun mapDefault!17073 () ValueCell!4807)

