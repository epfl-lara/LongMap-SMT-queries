; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21214 () Bool)

(assert start!21214)

(declare-fun b_free!5645 () Bool)

(declare-fun b_next!5645 () Bool)

(assert (=> start!21214 (= b_free!5645 (not b_next!5645))))

(declare-fun tp!20009 () Bool)

(declare-fun b_and!12523 () Bool)

(assert (=> start!21214 (= tp!20009 b_and!12523)))

(declare-fun b!213734 () Bool)

(declare-fun e!138984 () Bool)

(declare-fun tp_is_empty!5507 () Bool)

(assert (=> b!213734 (= e!138984 tp_is_empty!5507)))

(declare-fun b!213735 () Bool)

(declare-fun e!138986 () Bool)

(declare-fun e!138985 () Bool)

(declare-fun mapRes!9362 () Bool)

(assert (=> b!213735 (= e!138986 (and e!138985 mapRes!9362))))

(declare-fun condMapEmpty!9362 () Bool)

(declare-datatypes ((V!6989 0))(
  ( (V!6990 (val!2798 Int)) )
))
(declare-datatypes ((ValueCell!2410 0))(
  ( (ValueCellFull!2410 (v!4812 V!6989)) (EmptyCell!2410) )
))
(declare-datatypes ((array!10219 0))(
  ( (array!10220 (arr!4849 (Array (_ BitVec 32) ValueCell!2410)) (size!5174 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10219)

(declare-fun mapDefault!9362 () ValueCell!2410)

