; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20856 () Bool)

(assert start!20856)

(declare-fun b_free!5509 () Bool)

(declare-fun b_next!5509 () Bool)

(assert (=> start!20856 (= b_free!5509 (not b_next!5509))))

(declare-fun tp!19568 () Bool)

(declare-fun b_and!12255 () Bool)

(assert (=> start!20856 (= tp!19568 b_and!12255)))

(declare-fun b!209300 () Bool)

(declare-fun e!136379 () Bool)

(declare-fun tp_is_empty!5371 () Bool)

(assert (=> b!209300 (= e!136379 tp_is_empty!5371)))

(declare-fun b!209301 () Bool)

(declare-fun e!136375 () Bool)

(declare-fun e!136376 () Bool)

(declare-fun mapRes!9125 () Bool)

(assert (=> b!209301 (= e!136375 (and e!136376 mapRes!9125))))

(declare-fun condMapEmpty!9125 () Bool)

(declare-datatypes ((V!6809 0))(
  ( (V!6810 (val!2730 Int)) )
))
(declare-datatypes ((ValueCell!2342 0))(
  ( (ValueCellFull!2342 (v!4700 V!6809)) (EmptyCell!2342) )
))
(declare-datatypes ((array!9941 0))(
  ( (array!9942 (arr!4721 (Array (_ BitVec 32) ValueCell!2342)) (size!5046 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9941)

(declare-fun mapDefault!9125 () ValueCell!2342)

