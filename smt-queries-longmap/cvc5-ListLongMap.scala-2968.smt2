; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42064 () Bool)

(assert start!42064)

(declare-fun b_free!11617 () Bool)

(declare-fun b_next!11617 () Bool)

(assert (=> start!42064 (= b_free!11617 (not b_next!11617))))

(declare-fun tp!40869 () Bool)

(declare-fun b_and!20027 () Bool)

(assert (=> start!42064 (= tp!40869 b_and!20027)))

(declare-fun b!469637 () Bool)

(declare-fun e!275031 () Bool)

(declare-fun tp_is_empty!13045 () Bool)

(assert (=> b!469637 (= e!275031 tp_is_empty!13045)))

(declare-fun mapIsEmpty!21265 () Bool)

(declare-fun mapRes!21265 () Bool)

(assert (=> mapIsEmpty!21265 mapRes!21265))

(declare-fun b!469638 () Bool)

(declare-fun res!280648 () Bool)

(declare-fun e!275027 () Bool)

(assert (=> b!469638 (=> (not res!280648) (not e!275027))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29861 0))(
  ( (array!29862 (arr!14355 (Array (_ BitVec 32) (_ BitVec 64))) (size!14707 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29861)

(declare-datatypes ((V!18499 0))(
  ( (V!18500 (val!6567 Int)) )
))
(declare-datatypes ((ValueCell!6179 0))(
  ( (ValueCellFull!6179 (v!8857 V!18499)) (EmptyCell!6179) )
))
(declare-datatypes ((array!29863 0))(
  ( (array!29864 (arr!14356 (Array (_ BitVec 32) ValueCell!6179)) (size!14708 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29863)

(assert (=> b!469638 (= res!280648 (and (= (size!14708 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14707 _keys!1025) (size!14708 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469639 () Bool)

(declare-fun e!275026 () Bool)

(assert (=> b!469639 (= e!275026 (and e!275031 mapRes!21265))))

(declare-fun condMapEmpty!21265 () Bool)

(declare-fun mapDefault!21265 () ValueCell!6179)

