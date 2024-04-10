; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20752 () Bool)

(assert start!20752)

(declare-fun b_free!5411 () Bool)

(declare-fun b_next!5411 () Bool)

(assert (=> start!20752 (= b_free!5411 (not b_next!5411))))

(declare-fun tp!19265 () Bool)

(declare-fun b_and!12157 () Bool)

(assert (=> start!20752 (= tp!19265 b_and!12157)))

(declare-fun mapIsEmpty!8969 () Bool)

(declare-fun mapRes!8969 () Bool)

(assert (=> mapIsEmpty!8969 mapRes!8969))

(declare-fun b!207776 () Bool)

(declare-fun e!135598 () Bool)

(declare-fun tp_is_empty!5267 () Bool)

(assert (=> b!207776 (= e!135598 tp_is_empty!5267)))

(declare-fun b!207777 () Bool)

(declare-fun e!135595 () Bool)

(declare-fun e!135596 () Bool)

(assert (=> b!207777 (= e!135595 (and e!135596 mapRes!8969))))

(declare-fun condMapEmpty!8969 () Bool)

(declare-datatypes ((V!6669 0))(
  ( (V!6670 (val!2678 Int)) )
))
(declare-datatypes ((ValueCell!2290 0))(
  ( (ValueCellFull!2290 (v!4648 V!6669)) (EmptyCell!2290) )
))
(declare-datatypes ((array!9741 0))(
  ( (array!9742 (arr!4621 (Array (_ BitVec 32) ValueCell!2290)) (size!4946 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9741)

(declare-fun mapDefault!8969 () ValueCell!2290)

