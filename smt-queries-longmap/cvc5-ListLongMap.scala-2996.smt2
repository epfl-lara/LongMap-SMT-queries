; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42280 () Bool)

(assert start!42280)

(declare-fun b_free!11785 () Bool)

(declare-fun b_next!11785 () Bool)

(assert (=> start!42280 (= b_free!11785 (not b_next!11785))))

(declare-fun tp!41382 () Bool)

(declare-fun b_and!20223 () Bool)

(assert (=> start!42280 (= tp!41382 b_and!20223)))

(declare-fun b!471793 () Bool)

(declare-fun e!276553 () Bool)

(declare-fun tp_is_empty!13213 () Bool)

(assert (=> b!471793 (= e!276553 tp_is_empty!13213)))

(declare-fun b!471794 () Bool)

(declare-fun e!276555 () Bool)

(declare-fun mapRes!21526 () Bool)

(assert (=> b!471794 (= e!276555 (and e!276553 mapRes!21526))))

(declare-fun condMapEmpty!21526 () Bool)

(declare-datatypes ((V!18723 0))(
  ( (V!18724 (val!6651 Int)) )
))
(declare-datatypes ((ValueCell!6263 0))(
  ( (ValueCellFull!6263 (v!8942 V!18723)) (EmptyCell!6263) )
))
(declare-datatypes ((array!30187 0))(
  ( (array!30188 (arr!14515 (Array (_ BitVec 32) ValueCell!6263)) (size!14867 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30187)

(declare-fun mapDefault!21526 () ValueCell!6263)

