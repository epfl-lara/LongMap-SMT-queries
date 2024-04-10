; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82654 () Bool)

(assert start!82654)

(declare-fun b_free!18787 () Bool)

(declare-fun b_next!18787 () Bool)

(assert (=> start!82654 (= b_free!18787 (not b_next!18787))))

(declare-fun tp!65481 () Bool)

(declare-fun b_and!30275 () Bool)

(assert (=> start!82654 (= tp!65481 b_and!30275)))

(declare-fun b!963558 () Bool)

(declare-fun e!543288 () Bool)

(declare-fun tp_is_empty!21589 () Bool)

(assert (=> b!963558 (= e!543288 tp_is_empty!21589)))

(declare-fun b!963559 () Bool)

(declare-fun e!543287 () Bool)

(declare-fun e!543290 () Bool)

(declare-fun mapRes!34378 () Bool)

(assert (=> b!963559 (= e!543287 (and e!543290 mapRes!34378))))

(declare-fun condMapEmpty!34378 () Bool)

(declare-datatypes ((V!33769 0))(
  ( (V!33770 (val!10845 Int)) )
))
(declare-datatypes ((ValueCell!10313 0))(
  ( (ValueCellFull!10313 (v!13403 V!33769)) (EmptyCell!10313) )
))
(declare-datatypes ((array!59271 0))(
  ( (array!59272 (arr!28504 (Array (_ BitVec 32) ValueCell!10313)) (size!28983 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59271)

(declare-fun mapDefault!34378 () ValueCell!10313)

