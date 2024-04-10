; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82582 () Bool)

(assert start!82582)

(declare-fun b_free!18715 () Bool)

(declare-fun b_next!18715 () Bool)

(assert (=> start!82582 (= b_free!18715 (not b_next!18715))))

(declare-fun tp!65264 () Bool)

(declare-fun b_and!30203 () Bool)

(assert (=> start!82582 (= tp!65264 b_and!30203)))

(declare-fun b!962438 () Bool)

(declare-fun res!644085 () Bool)

(declare-fun e!542750 () Bool)

(assert (=> b!962438 (=> (not res!644085) (not e!542750))))

(declare-datatypes ((array!59131 0))(
  ( (array!59132 (arr!28434 (Array (_ BitVec 32) (_ BitVec 64))) (size!28913 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59131)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962438 (= res!644085 (validKeyInArray!0 (select (arr!28434 _keys!1686) i!803)))))

(declare-fun b!962439 () Bool)

(declare-fun e!542747 () Bool)

(declare-fun tp_is_empty!21517 () Bool)

(assert (=> b!962439 (= e!542747 tp_is_empty!21517)))

(declare-fun b!962440 () Bool)

(declare-fun e!542748 () Bool)

(assert (=> b!962440 (= e!542748 tp_is_empty!21517)))

(declare-fun b!962441 () Bool)

(declare-fun e!542749 () Bool)

(declare-fun mapRes!34270 () Bool)

(assert (=> b!962441 (= e!542749 (and e!542748 mapRes!34270))))

(declare-fun condMapEmpty!34270 () Bool)

(declare-datatypes ((V!33673 0))(
  ( (V!33674 (val!10809 Int)) )
))
(declare-datatypes ((ValueCell!10277 0))(
  ( (ValueCellFull!10277 (v!13367 V!33673)) (EmptyCell!10277) )
))
(declare-datatypes ((array!59133 0))(
  ( (array!59134 (arr!28435 (Array (_ BitVec 32) ValueCell!10277)) (size!28914 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59133)

(declare-fun mapDefault!34270 () ValueCell!10277)

