; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38734 () Bool)

(assert start!38734)

(declare-fun b_free!9271 () Bool)

(declare-fun b_next!9271 () Bool)

(assert (=> start!38734 (= b_free!9271 (not b_next!9271))))

(declare-fun tp!32937 () Bool)

(declare-fun b_and!16657 () Bool)

(assert (=> start!38734 (= tp!32937 b_and!16657)))

(declare-fun b!403369 () Bool)

(declare-fun e!242850 () Bool)

(declare-datatypes ((V!14643 0))(
  ( (V!14644 (val!5121 Int)) )
))
(declare-datatypes ((tuple2!6804 0))(
  ( (tuple2!6805 (_1!3413 (_ BitVec 64)) (_2!3413 V!14643)) )
))
(declare-datatypes ((List!6724 0))(
  ( (Nil!6721) (Cons!6720 (h!7576 tuple2!6804) (t!11898 List!6724)) )
))
(declare-datatypes ((ListLongMap!5717 0))(
  ( (ListLongMap!5718 (toList!2874 List!6724)) )
))
(declare-fun call!28478 () ListLongMap!5717)

(declare-fun call!28477 () ListLongMap!5717)

(assert (=> b!403369 (= e!242850 (= call!28478 call!28477))))

(declare-fun b!403370 () Bool)

(declare-fun e!242849 () Bool)

(declare-fun e!242847 () Bool)

(declare-fun mapRes!16851 () Bool)

(assert (=> b!403370 (= e!242849 (and e!242847 mapRes!16851))))

(declare-fun condMapEmpty!16851 () Bool)

(declare-datatypes ((ValueCell!4733 0))(
  ( (ValueCellFull!4733 (v!7368 V!14643)) (EmptyCell!4733) )
))
(declare-datatypes ((array!24207 0))(
  ( (array!24208 (arr!11553 (Array (_ BitVec 32) ValueCell!4733)) (size!11905 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24207)

(declare-fun mapDefault!16851 () ValueCell!4733)

