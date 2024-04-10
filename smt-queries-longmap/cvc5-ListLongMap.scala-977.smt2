; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21120 () Bool)

(assert start!21120)

(declare-fun b_free!5611 () Bool)

(declare-fun b_next!5611 () Bool)

(assert (=> start!21120 (= b_free!5611 (not b_next!5611))))

(declare-fun tp!19897 () Bool)

(declare-fun b_and!12453 () Bool)

(assert (=> start!21120 (= tp!19897 b_and!12453)))

(declare-fun b!212583 () Bool)

(declare-fun e!138307 () Bool)

(declare-fun e!138309 () Bool)

(declare-fun mapRes!9302 () Bool)

(assert (=> b!212583 (= e!138307 (and e!138309 mapRes!9302))))

(declare-fun condMapEmpty!9302 () Bool)

(declare-datatypes ((V!6945 0))(
  ( (V!6946 (val!2781 Int)) )
))
(declare-datatypes ((ValueCell!2393 0))(
  ( (ValueCellFull!2393 (v!4783 V!6945)) (EmptyCell!2393) )
))
(declare-datatypes ((array!10151 0))(
  ( (array!10152 (arr!4818 (Array (_ BitVec 32) ValueCell!2393)) (size!5143 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10151)

(declare-fun mapDefault!9302 () ValueCell!2393)

