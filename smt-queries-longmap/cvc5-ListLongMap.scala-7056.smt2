; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89390 () Bool)

(assert start!89390)

(declare-fun b!1024799 () Bool)

(declare-fun b_free!20389 () Bool)

(declare-fun b_next!20389 () Bool)

(assert (=> b!1024799 (= b_free!20389 (not b_next!20389))))

(declare-fun tp!72213 () Bool)

(declare-fun b_and!32635 () Bool)

(assert (=> b!1024799 (= tp!72213 b_and!32635)))

(declare-fun b!1024792 () Bool)

(declare-fun res!686122 () Bool)

(declare-fun e!577723 () Bool)

(assert (=> b!1024792 (=> res!686122 e!577723)))

(declare-datatypes ((List!21737 0))(
  ( (Nil!21734) (Cons!21733 (h!22931 (_ BitVec 64)) (t!30799 List!21737)) )
))
(declare-fun contains!5953 (List!21737 (_ BitVec 64)) Bool)

(assert (=> b!1024792 (= res!686122 (contains!5953 Nil!21734 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024793 () Bool)

(declare-fun e!577719 () Bool)

(declare-fun tp_is_empty!24109 () Bool)

(assert (=> b!1024793 (= e!577719 tp_is_empty!24109)))

(declare-fun b!1024794 () Bool)

(declare-fun e!577726 () Bool)

(declare-fun mapRes!37592 () Bool)

(assert (=> b!1024794 (= e!577726 (and e!577719 mapRes!37592))))

(declare-fun condMapEmpty!37592 () Bool)

(declare-datatypes ((V!37019 0))(
  ( (V!37020 (val!12105 Int)) )
))
(declare-datatypes ((ValueCell!11351 0))(
  ( (ValueCellFull!11351 (v!14674 V!37019)) (EmptyCell!11351) )
))
(declare-datatypes ((array!64268 0))(
  ( (array!64269 (arr!30943 (Array (_ BitVec 32) (_ BitVec 64))) (size!31456 (_ BitVec 32))) )
))
(declare-datatypes ((array!64270 0))(
  ( (array!64271 (arr!30944 (Array (_ BitVec 32) ValueCell!11351)) (size!31457 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5296 0))(
  ( (LongMapFixedSize!5297 (defaultEntry!6000 Int) (mask!29658 (_ BitVec 32)) (extraKeys!5732 (_ BitVec 32)) (zeroValue!5836 V!37019) (minValue!5836 V!37019) (_size!2703 (_ BitVec 32)) (_keys!11147 array!64268) (_values!6023 array!64270) (_vacant!2703 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5296)

(declare-fun mapDefault!37592 () ValueCell!11351)

