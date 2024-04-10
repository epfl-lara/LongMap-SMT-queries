; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42418 () Bool)

(assert start!42418)

(declare-fun b_free!11893 () Bool)

(declare-fun b_next!11893 () Bool)

(assert (=> start!42418 (= b_free!11893 (not b_next!11893))))

(declare-fun tp!41713 () Bool)

(declare-fun b_and!20349 () Bool)

(assert (=> start!42418 (= tp!41713 b_and!20349)))

(declare-fun mapNonEmpty!21694 () Bool)

(declare-fun mapRes!21694 () Bool)

(declare-fun tp!41712 () Bool)

(declare-fun e!277643 () Bool)

(assert (=> mapNonEmpty!21694 (= mapRes!21694 (and tp!41712 e!277643))))

(declare-datatypes ((V!18867 0))(
  ( (V!18868 (val!6705 Int)) )
))
(declare-datatypes ((ValueCell!6317 0))(
  ( (ValueCellFull!6317 (v!8996 V!18867)) (EmptyCell!6317) )
))
(declare-datatypes ((array!30401 0))(
  ( (array!30402 (arr!14620 (Array (_ BitVec 32) ValueCell!6317)) (size!14972 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30401)

(declare-fun mapKey!21694 () (_ BitVec 32))

(declare-fun mapValue!21694 () ValueCell!6317)

(declare-fun mapRest!21694 () (Array (_ BitVec 32) ValueCell!6317))

(assert (=> mapNonEmpty!21694 (= (arr!14620 _values!833) (store mapRest!21694 mapKey!21694 mapValue!21694))))

(declare-fun b!473288 () Bool)

(declare-fun e!277638 () Bool)

(declare-fun tp_is_empty!13321 () Bool)

(assert (=> b!473288 (= e!277638 tp_is_empty!13321)))

(declare-fun b!473289 () Bool)

(declare-fun e!277642 () Bool)

(assert (=> b!473289 (= e!277642 (and e!277638 mapRes!21694))))

(declare-fun condMapEmpty!21694 () Bool)

(declare-fun mapDefault!21694 () ValueCell!6317)

