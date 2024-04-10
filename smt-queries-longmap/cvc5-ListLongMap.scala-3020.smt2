; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42474 () Bool)

(assert start!42474)

(declare-fun b_free!11929 () Bool)

(declare-fun b_next!11929 () Bool)

(assert (=> start!42474 (= b_free!11929 (not b_next!11929))))

(declare-fun tp!41823 () Bool)

(declare-fun b_and!20397 () Bool)

(assert (=> start!42474 (= tp!41823 b_and!20397)))

(declare-fun b!473901 () Bool)

(declare-fun e!278076 () Bool)

(declare-fun e!278079 () Bool)

(declare-fun mapRes!21751 () Bool)

(assert (=> b!473901 (= e!278076 (and e!278079 mapRes!21751))))

(declare-fun condMapEmpty!21751 () Bool)

(declare-datatypes ((V!18915 0))(
  ( (V!18916 (val!6723 Int)) )
))
(declare-datatypes ((ValueCell!6335 0))(
  ( (ValueCellFull!6335 (v!9015 V!18915)) (EmptyCell!6335) )
))
(declare-datatypes ((array!30471 0))(
  ( (array!30472 (arr!14654 (Array (_ BitVec 32) ValueCell!6335)) (size!15006 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30471)

(declare-fun mapDefault!21751 () ValueCell!6335)

