; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20746 () Bool)

(assert start!20746)

(declare-fun b_free!5405 () Bool)

(declare-fun b_next!5405 () Bool)

(assert (=> start!20746 (= b_free!5405 (not b_next!5405))))

(declare-fun tp!19247 () Bool)

(declare-fun b_and!12151 () Bool)

(assert (=> start!20746 (= tp!19247 b_and!12151)))

(declare-fun b!207686 () Bool)

(declare-fun res!100882 () Bool)

(declare-fun e!135553 () Bool)

(assert (=> b!207686 (=> (not res!100882) (not e!135553))))

(declare-datatypes ((array!9729 0))(
  ( (array!9730 (arr!4615 (Array (_ BitVec 32) (_ BitVec 64))) (size!4940 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9729)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207686 (= res!100882 (= (select (arr!4615 _keys!825) i!601) k!843))))

(declare-fun b!207687 () Bool)

(declare-fun res!100879 () Bool)

(assert (=> b!207687 (=> (not res!100879) (not e!135553))))

(declare-datatypes ((List!2952 0))(
  ( (Nil!2949) (Cons!2948 (h!3590 (_ BitVec 64)) (t!7883 List!2952)) )
))
(declare-fun arrayNoDuplicates!0 (array!9729 (_ BitVec 32) List!2952) Bool)

(assert (=> b!207687 (= res!100879 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2949))))

(declare-fun b!207688 () Bool)

(declare-fun e!135551 () Bool)

(declare-fun tp_is_empty!5261 () Bool)

(assert (=> b!207688 (= e!135551 tp_is_empty!5261)))

(declare-fun b!207689 () Bool)

(declare-fun e!135550 () Bool)

(declare-fun mapRes!8960 () Bool)

(assert (=> b!207689 (= e!135550 (and e!135551 mapRes!8960))))

(declare-fun condMapEmpty!8960 () Bool)

(declare-datatypes ((V!6661 0))(
  ( (V!6662 (val!2675 Int)) )
))
(declare-datatypes ((ValueCell!2287 0))(
  ( (ValueCellFull!2287 (v!4645 V!6661)) (EmptyCell!2287) )
))
(declare-datatypes ((array!9731 0))(
  ( (array!9732 (arr!4616 (Array (_ BitVec 32) ValueCell!2287)) (size!4941 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9731)

(declare-fun mapDefault!8960 () ValueCell!2287)

