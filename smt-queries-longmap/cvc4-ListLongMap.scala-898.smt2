; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20488 () Bool)

(assert start!20488)

(declare-fun b_free!5147 () Bool)

(declare-fun b_next!5147 () Bool)

(assert (=> start!20488 (= b_free!5147 (not b_next!5147))))

(declare-fun tp!18472 () Bool)

(declare-fun b_and!11893 () Bool)

(assert (=> start!20488 (= tp!18472 b_and!11893)))

(declare-fun b!203283 () Bool)

(declare-fun e!133093 () Bool)

(declare-fun e!133092 () Bool)

(declare-fun mapRes!8573 () Bool)

(assert (=> b!203283 (= e!133093 (and e!133092 mapRes!8573))))

(declare-fun condMapEmpty!8573 () Bool)

(declare-datatypes ((V!6317 0))(
  ( (V!6318 (val!2546 Int)) )
))
(declare-datatypes ((ValueCell!2158 0))(
  ( (ValueCellFull!2158 (v!4516 V!6317)) (EmptyCell!2158) )
))
(declare-datatypes ((array!9231 0))(
  ( (array!9232 (arr!4366 (Array (_ BitVec 32) ValueCell!2158)) (size!4691 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9231)

(declare-fun mapDefault!8573 () ValueCell!2158)

