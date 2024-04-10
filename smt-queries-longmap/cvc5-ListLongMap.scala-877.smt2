; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20358 () Bool)

(assert start!20358)

(declare-fun b_free!5017 () Bool)

(declare-fun b_next!5017 () Bool)

(assert (=> start!20358 (= b_free!5017 (not b_next!5017))))

(declare-fun tp!18083 () Bool)

(declare-fun b_and!11763 () Bool)

(assert (=> start!20358 (= tp!18083 b_and!11763)))

(declare-fun mapIsEmpty!8378 () Bool)

(declare-fun mapRes!8378 () Bool)

(assert (=> mapIsEmpty!8378 mapRes!8378))

(declare-fun b!200934 () Bool)

(declare-fun e!131727 () Bool)

(declare-fun e!131729 () Bool)

(assert (=> b!200934 (= e!131727 (and e!131729 mapRes!8378))))

(declare-fun condMapEmpty!8378 () Bool)

(declare-datatypes ((V!6145 0))(
  ( (V!6146 (val!2481 Int)) )
))
(declare-datatypes ((ValueCell!2093 0))(
  ( (ValueCellFull!2093 (v!4451 V!6145)) (EmptyCell!2093) )
))
(declare-datatypes ((array!8977 0))(
  ( (array!8978 (arr!4239 (Array (_ BitVec 32) ValueCell!2093)) (size!4564 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8977)

(declare-fun mapDefault!8378 () ValueCell!2093)

