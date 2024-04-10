; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21146 () Bool)

(assert start!21146)

(declare-fun b_free!5617 () Bool)

(declare-fun b_next!5617 () Bool)

(assert (=> start!21146 (= b_free!5617 (not b_next!5617))))

(declare-fun tp!19918 () Bool)

(declare-fun b_and!12471 () Bool)

(assert (=> start!21146 (= tp!19918 b_and!12471)))

(declare-fun mapIsEmpty!9314 () Bool)

(declare-fun mapRes!9314 () Bool)

(assert (=> mapIsEmpty!9314 mapRes!9314))

(declare-fun b!212883 () Bool)

(declare-fun e!138490 () Bool)

(declare-fun e!138489 () Bool)

(assert (=> b!212883 (= e!138490 (and e!138489 mapRes!9314))))

(declare-fun condMapEmpty!9314 () Bool)

(declare-datatypes ((V!6953 0))(
  ( (V!6954 (val!2784 Int)) )
))
(declare-datatypes ((ValueCell!2396 0))(
  ( (ValueCellFull!2396 (v!4790 V!6953)) (EmptyCell!2396) )
))
(declare-datatypes ((array!10163 0))(
  ( (array!10164 (arr!4823 (Array (_ BitVec 32) ValueCell!2396)) (size!5148 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10163)

(declare-fun mapDefault!9314 () ValueCell!2396)

