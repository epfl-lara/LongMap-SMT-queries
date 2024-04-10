; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20418 () Bool)

(assert start!20418)

(declare-fun b_free!5077 () Bool)

(declare-fun b_next!5077 () Bool)

(assert (=> start!20418 (= b_free!5077 (not b_next!5077))))

(declare-fun tp!18263 () Bool)

(declare-fun b_and!11823 () Bool)

(assert (=> start!20418 (= tp!18263 b_and!11823)))

(declare-fun b!202014 () Bool)

(declare-fun e!132360 () Bool)

(declare-fun tp_is_empty!4933 () Bool)

(assert (=> b!202014 (= e!132360 tp_is_empty!4933)))

(declare-fun b!202015 () Bool)

(declare-fun e!132356 () Bool)

(declare-fun mapRes!8468 () Bool)

(assert (=> b!202015 (= e!132356 (and e!132360 mapRes!8468))))

(declare-fun condMapEmpty!8468 () Bool)

(declare-datatypes ((V!6225 0))(
  ( (V!6226 (val!2511 Int)) )
))
(declare-datatypes ((ValueCell!2123 0))(
  ( (ValueCellFull!2123 (v!4481 V!6225)) (EmptyCell!2123) )
))
(declare-datatypes ((array!9095 0))(
  ( (array!9096 (arr!4298 (Array (_ BitVec 32) ValueCell!2123)) (size!4623 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9095)

(declare-fun mapDefault!8468 () ValueCell!2123)

