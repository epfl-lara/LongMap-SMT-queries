; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82850 () Bool)

(assert start!82850)

(declare-fun b_free!18977 () Bool)

(declare-fun b_next!18977 () Bool)

(assert (=> start!82850 (= b_free!18977 (not b_next!18977))))

(declare-fun tp!66059 () Bool)

(declare-fun b_and!30465 () Bool)

(assert (=> start!82850 (= tp!66059 b_and!30465)))

(declare-fun b!966506 () Bool)

(declare-fun e!544839 () Bool)

(declare-fun e!544837 () Bool)

(declare-fun mapRes!34672 () Bool)

(assert (=> b!966506 (= e!544839 (and e!544837 mapRes!34672))))

(declare-fun condMapEmpty!34672 () Bool)

(declare-datatypes ((V!34029 0))(
  ( (V!34030 (val!10943 Int)) )
))
(declare-datatypes ((ValueCell!10411 0))(
  ( (ValueCellFull!10411 (v!13501 V!34029)) (EmptyCell!10411) )
))
(declare-datatypes ((array!59653 0))(
  ( (array!59654 (arr!28695 (Array (_ BitVec 32) ValueCell!10411)) (size!29174 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59653)

(declare-fun mapDefault!34672 () ValueCell!10411)

