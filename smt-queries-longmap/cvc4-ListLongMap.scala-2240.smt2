; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36906 () Bool)

(assert start!36906)

(declare-fun b_free!8033 () Bool)

(declare-fun b_next!8033 () Bool)

(assert (=> start!36906 (= b_free!8033 (not b_next!8033))))

(declare-fun tp!28814 () Bool)

(declare-fun b_and!15275 () Bool)

(assert (=> start!36906 (= tp!28814 b_and!15275)))

(declare-fun b!369683 () Bool)

(declare-fun e!225909 () Bool)

(declare-fun tp_is_empty!8681 () Bool)

(assert (=> b!369683 (= e!225909 tp_is_empty!8681)))

(declare-fun b!369684 () Bool)

(declare-fun e!225911 () Bool)

(declare-fun mapRes!14586 () Bool)

(assert (=> b!369684 (= e!225911 (and e!225909 mapRes!14586))))

(declare-fun condMapEmpty!14586 () Bool)

(declare-datatypes ((V!12679 0))(
  ( (V!12680 (val!4385 Int)) )
))
(declare-datatypes ((ValueCell!3997 0))(
  ( (ValueCellFull!3997 (v!6582 V!12679)) (EmptyCell!3997) )
))
(declare-datatypes ((array!21309 0))(
  ( (array!21310 (arr!10123 (Array (_ BitVec 32) ValueCell!3997)) (size!10475 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21309)

(declare-fun mapDefault!14586 () ValueCell!3997)

