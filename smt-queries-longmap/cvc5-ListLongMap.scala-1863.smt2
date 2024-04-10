; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33612 () Bool)

(assert start!33612)

(declare-fun b_free!6847 () Bool)

(declare-fun b_next!6847 () Bool)

(assert (=> start!33612 (= b_free!6847 (not b_next!6847))))

(declare-fun tp!24044 () Bool)

(declare-fun b_and!14027 () Bool)

(assert (=> start!33612 (= tp!24044 b_and!14027)))

(declare-fun b!333530 () Bool)

(declare-fun e!204797 () Bool)

(declare-fun e!204800 () Bool)

(declare-fun mapRes!11595 () Bool)

(assert (=> b!333530 (= e!204797 (and e!204800 mapRes!11595))))

(declare-fun condMapEmpty!11595 () Bool)

(declare-datatypes ((V!10043 0))(
  ( (V!10044 (val!3444 Int)) )
))
(declare-datatypes ((ValueCell!3056 0))(
  ( (ValueCellFull!3056 (v!5606 V!10043)) (EmptyCell!3056) )
))
(declare-datatypes ((array!17195 0))(
  ( (array!17196 (arr!8128 (Array (_ BitVec 32) ValueCell!3056)) (size!8480 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17195)

(declare-fun mapDefault!11595 () ValueCell!3056)

