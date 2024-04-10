; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33846 () Bool)

(assert start!33846)

(declare-fun b_free!7025 () Bool)

(declare-fun b_next!7025 () Bool)

(assert (=> start!33846 (= b_free!7025 (not b_next!7025))))

(declare-fun tp!24587 () Bool)

(declare-fun b_and!14211 () Bool)

(assert (=> start!33846 (= tp!24587 b_and!14211)))

(declare-fun b!336732 () Bool)

(declare-fun e!206681 () Bool)

(declare-fun tp_is_empty!6977 () Bool)

(assert (=> b!336732 (= e!206681 tp_is_empty!6977)))

(declare-fun b!336734 () Bool)

(declare-fun res!185888 () Bool)

(declare-fun e!206680 () Bool)

(assert (=> b!336734 (=> (not res!185888) (not e!206680))))

(declare-datatypes ((array!17551 0))(
  ( (array!17552 (arr!8303 (Array (_ BitVec 32) (_ BitVec 64))) (size!8655 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17551)

(declare-datatypes ((List!4747 0))(
  ( (Nil!4744) (Cons!4743 (h!5599 (_ BitVec 64)) (t!9841 List!4747)) )
))
(declare-fun arrayNoDuplicates!0 (array!17551 (_ BitVec 32) List!4747) Bool)

(assert (=> b!336734 (= res!185888 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4744))))

(declare-fun b!336735 () Bool)

(declare-fun e!206678 () Bool)

(declare-fun mapRes!11871 () Bool)

(assert (=> b!336735 (= e!206678 (and e!206681 mapRes!11871))))

(declare-fun condMapEmpty!11871 () Bool)

(declare-datatypes ((V!10279 0))(
  ( (V!10280 (val!3533 Int)) )
))
(declare-datatypes ((ValueCell!3145 0))(
  ( (ValueCellFull!3145 (v!5698 V!10279)) (EmptyCell!3145) )
))
(declare-datatypes ((array!17553 0))(
  ( (array!17554 (arr!8304 (Array (_ BitVec 32) ValueCell!3145)) (size!8656 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17553)

(declare-fun mapDefault!11871 () ValueCell!3145)

