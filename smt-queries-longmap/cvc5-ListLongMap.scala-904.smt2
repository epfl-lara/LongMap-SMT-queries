; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20520 () Bool)

(assert start!20520)

(declare-fun b_free!5179 () Bool)

(declare-fun b_next!5179 () Bool)

(assert (=> start!20520 (= b_free!5179 (not b_next!5179))))

(declare-fun tp!18568 () Bool)

(declare-fun b_and!11925 () Bool)

(assert (=> start!20520 (= tp!18568 b_and!11925)))

(declare-fun b!203859 () Bool)

(declare-fun e!133430 () Bool)

(declare-fun e!133428 () Bool)

(declare-fun mapRes!8621 () Bool)

(assert (=> b!203859 (= e!133430 (and e!133428 mapRes!8621))))

(declare-fun condMapEmpty!8621 () Bool)

(declare-datatypes ((V!6361 0))(
  ( (V!6362 (val!2562 Int)) )
))
(declare-datatypes ((ValueCell!2174 0))(
  ( (ValueCellFull!2174 (v!4532 V!6361)) (EmptyCell!2174) )
))
(declare-datatypes ((array!9291 0))(
  ( (array!9292 (arr!4396 (Array (_ BitVec 32) ValueCell!2174)) (size!4721 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9291)

(declare-fun mapDefault!8621 () ValueCell!2174)
