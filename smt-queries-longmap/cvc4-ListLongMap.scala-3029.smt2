; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42552 () Bool)

(assert start!42552)

(declare-fun b_free!11987 () Bool)

(declare-fun b_next!11987 () Bool)

(assert (=> start!42552 (= b_free!11987 (not b_next!11987))))

(declare-fun tp!42000 () Bool)

(declare-fun b_and!20467 () Bool)

(assert (=> start!42552 (= tp!42000 b_and!20467)))

(declare-fun b!474752 () Bool)

(declare-fun e!278688 () Bool)

(declare-fun e!278685 () Bool)

(declare-fun mapRes!21841 () Bool)

(assert (=> b!474752 (= e!278688 (and e!278685 mapRes!21841))))

(declare-fun condMapEmpty!21841 () Bool)

(declare-datatypes ((V!18991 0))(
  ( (V!18992 (val!6752 Int)) )
))
(declare-datatypes ((ValueCell!6364 0))(
  ( (ValueCellFull!6364 (v!9045 V!18991)) (EmptyCell!6364) )
))
(declare-datatypes ((array!30577 0))(
  ( (array!30578 (arr!14706 (Array (_ BitVec 32) ValueCell!6364)) (size!15058 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30577)

(declare-fun mapDefault!21841 () ValueCell!6364)

