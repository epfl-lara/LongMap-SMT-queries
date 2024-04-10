; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20460 () Bool)

(assert start!20460)

(declare-fun b_free!5119 () Bool)

(declare-fun b_next!5119 () Bool)

(assert (=> start!20460 (= b_free!5119 (not b_next!5119))))

(declare-fun tp!18389 () Bool)

(declare-fun b_and!11865 () Bool)

(assert (=> start!20460 (= tp!18389 b_and!11865)))

(declare-fun b!202779 () Bool)

(declare-fun res!97260 () Bool)

(declare-fun e!132799 () Bool)

(assert (=> b!202779 (=> (not res!97260) (not e!132799))))

(declare-datatypes ((array!9175 0))(
  ( (array!9176 (arr!4338 (Array (_ BitVec 32) (_ BitVec 64))) (size!4663 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9175)

(declare-datatypes ((List!2745 0))(
  ( (Nil!2742) (Cons!2741 (h!3383 (_ BitVec 64)) (t!7676 List!2745)) )
))
(declare-fun arrayNoDuplicates!0 (array!9175 (_ BitVec 32) List!2745) Bool)

(assert (=> b!202779 (= res!97260 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2742))))

(declare-fun b!202780 () Bool)

(declare-fun e!132803 () Bool)

(declare-fun e!132801 () Bool)

(declare-fun mapRes!8531 () Bool)

(assert (=> b!202780 (= e!132803 (and e!132801 mapRes!8531))))

(declare-fun condMapEmpty!8531 () Bool)

(declare-datatypes ((V!6281 0))(
  ( (V!6282 (val!2532 Int)) )
))
(declare-datatypes ((ValueCell!2144 0))(
  ( (ValueCellFull!2144 (v!4502 V!6281)) (EmptyCell!2144) )
))
(declare-datatypes ((array!9177 0))(
  ( (array!9178 (arr!4339 (Array (_ BitVec 32) ValueCell!2144)) (size!4664 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9177)

(declare-fun mapDefault!8531 () ValueCell!2144)

