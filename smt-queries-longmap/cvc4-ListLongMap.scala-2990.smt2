; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42234 () Bool)

(assert start!42234)

(declare-fun b_free!11753 () Bool)

(declare-fun b_next!11753 () Bool)

(assert (=> start!42234 (= b_free!11753 (not b_next!11753))))

(declare-fun tp!41284 () Bool)

(declare-fun b_and!20183 () Bool)

(assert (=> start!42234 (= tp!41284 b_and!20183)))

(declare-fun b!471372 () Bool)

(declare-fun res!281615 () Bool)

(declare-fun e!276260 () Bool)

(assert (=> b!471372 (=> (not res!281615) (not e!276260))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30123 0))(
  ( (array!30124 (arr!14484 (Array (_ BitVec 32) (_ BitVec 64))) (size!14836 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30123)

(declare-datatypes ((V!18679 0))(
  ( (V!18680 (val!6635 Int)) )
))
(declare-datatypes ((ValueCell!6247 0))(
  ( (ValueCellFull!6247 (v!8926 V!18679)) (EmptyCell!6247) )
))
(declare-datatypes ((array!30125 0))(
  ( (array!30126 (arr!14485 (Array (_ BitVec 32) ValueCell!6247)) (size!14837 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30125)

(declare-fun mask!1365 () (_ BitVec 32))

(assert (=> b!471372 (= res!281615 (and (= (size!14837 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14836 _keys!1025) (size!14837 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471373 () Bool)

(declare-fun res!281617 () Bool)

(assert (=> b!471373 (=> (not res!281617) (not e!276260))))

(declare-datatypes ((List!8817 0))(
  ( (Nil!8814) (Cons!8813 (h!9669 (_ BitVec 64)) (t!14781 List!8817)) )
))
(declare-fun arrayNoDuplicates!0 (array!30123 (_ BitVec 32) List!8817) Bool)

(assert (=> b!471373 (= res!281617 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8814))))

(declare-fun b!471374 () Bool)

(declare-fun e!276259 () Bool)

(declare-fun e!276257 () Bool)

(declare-fun mapRes!21475 () Bool)

(assert (=> b!471374 (= e!276259 (and e!276257 mapRes!21475))))

(declare-fun condMapEmpty!21475 () Bool)

(declare-fun mapDefault!21475 () ValueCell!6247)

