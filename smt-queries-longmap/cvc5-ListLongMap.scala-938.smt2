; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20724 () Bool)

(assert start!20724)

(declare-fun b_free!5383 () Bool)

(declare-fun b_next!5383 () Bool)

(assert (=> start!20724 (= b_free!5383 (not b_next!5383))))

(declare-fun tp!19181 () Bool)

(declare-fun b_and!12129 () Bool)

(assert (=> start!20724 (= tp!19181 b_and!12129)))

(declare-fun b!207356 () Bool)

(declare-fun e!135387 () Bool)

(declare-fun e!135386 () Bool)

(declare-fun mapRes!8927 () Bool)

(assert (=> b!207356 (= e!135387 (and e!135386 mapRes!8927))))

(declare-fun condMapEmpty!8927 () Bool)

(declare-datatypes ((V!6633 0))(
  ( (V!6634 (val!2664 Int)) )
))
(declare-datatypes ((ValueCell!2276 0))(
  ( (ValueCellFull!2276 (v!4634 V!6633)) (EmptyCell!2276) )
))
(declare-datatypes ((array!9687 0))(
  ( (array!9688 (arr!4594 (Array (_ BitVec 32) ValueCell!2276)) (size!4919 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9687)

(declare-fun mapDefault!8927 () ValueCell!2276)

