; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38726 () Bool)

(assert start!38726)

(declare-fun b_free!9263 () Bool)

(declare-fun b_next!9263 () Bool)

(assert (=> start!38726 (= b_free!9263 (not b_next!9263))))

(declare-fun tp!32913 () Bool)

(declare-fun b_and!16649 () Bool)

(assert (=> start!38726 (= tp!32913 b_and!16649)))

(declare-fun b!403165 () Bool)

(declare-fun e!242764 () Bool)

(declare-fun e!242769 () Bool)

(declare-fun mapRes!16839 () Bool)

(assert (=> b!403165 (= e!242764 (and e!242769 mapRes!16839))))

(declare-fun condMapEmpty!16839 () Bool)

(declare-datatypes ((V!14631 0))(
  ( (V!14632 (val!5117 Int)) )
))
(declare-datatypes ((ValueCell!4729 0))(
  ( (ValueCellFull!4729 (v!7364 V!14631)) (EmptyCell!4729) )
))
(declare-datatypes ((array!24195 0))(
  ( (array!24196 (arr!11547 (Array (_ BitVec 32) ValueCell!4729)) (size!11899 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24195)

(declare-fun mapDefault!16839 () ValueCell!4729)

