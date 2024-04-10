; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42182 () Bool)

(assert start!42182)

(declare-fun b_free!11701 () Bool)

(declare-fun b_next!11701 () Bool)

(assert (=> start!42182 (= b_free!11701 (not b_next!11701))))

(declare-fun tp!41127 () Bool)

(declare-fun b_and!20131 () Bool)

(assert (=> start!42182 (= tp!41127 b_and!20131)))

(declare-fun b!470826 () Bool)

(declare-fun res!281304 () Bool)

(declare-fun e!275868 () Bool)

(assert (=> b!470826 (=> (not res!281304) (not e!275868))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30027 0))(
  ( (array!30028 (arr!14436 (Array (_ BitVec 32) (_ BitVec 64))) (size!14788 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30027)

(declare-datatypes ((V!18611 0))(
  ( (V!18612 (val!6609 Int)) )
))
(declare-datatypes ((ValueCell!6221 0))(
  ( (ValueCellFull!6221 (v!8900 V!18611)) (EmptyCell!6221) )
))
(declare-datatypes ((array!30029 0))(
  ( (array!30030 (arr!14437 (Array (_ BitVec 32) ValueCell!6221)) (size!14789 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30029)

(assert (=> b!470826 (= res!281304 (and (= (size!14789 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14788 _keys!1025) (size!14789 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470827 () Bool)

(declare-fun e!275867 () Bool)

(declare-fun e!275870 () Bool)

(declare-fun mapRes!21397 () Bool)

(assert (=> b!470827 (= e!275867 (and e!275870 mapRes!21397))))

(declare-fun condMapEmpty!21397 () Bool)

(declare-fun mapDefault!21397 () ValueCell!6221)

