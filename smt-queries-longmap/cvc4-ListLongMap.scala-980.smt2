; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21182 () Bool)

(assert start!21182)

(declare-fun b_free!5633 () Bool)

(declare-fun b_next!5633 () Bool)

(assert (=> start!21182 (= b_free!5633 (not b_next!5633))))

(declare-fun tp!19970 () Bool)

(declare-fun b_and!12499 () Bool)

(assert (=> start!21182 (= tp!19970 b_and!12499)))

(declare-fun b!213368 () Bool)

(declare-fun e!138777 () Bool)

(declare-fun e!138776 () Bool)

(declare-fun mapRes!9341 () Bool)

(assert (=> b!213368 (= e!138777 (and e!138776 mapRes!9341))))

(declare-fun condMapEmpty!9341 () Bool)

(declare-datatypes ((V!6973 0))(
  ( (V!6974 (val!2792 Int)) )
))
(declare-datatypes ((ValueCell!2404 0))(
  ( (ValueCellFull!2404 (v!4802 V!6973)) (EmptyCell!2404) )
))
(declare-datatypes ((array!10195 0))(
  ( (array!10196 (arr!4838 (Array (_ BitVec 32) ValueCell!2404)) (size!5163 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10195)

(declare-fun mapDefault!9341 () ValueCell!2404)

