; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42440 () Bool)

(assert start!42440)

(declare-fun b_free!11915 () Bool)

(declare-fun b_next!11915 () Bool)

(assert (=> start!42440 (= b_free!11915 (not b_next!11915))))

(declare-fun tp!41779 () Bool)

(declare-fun b_and!20371 () Bool)

(assert (=> start!42440 (= tp!41779 b_and!20371)))

(declare-fun b!473552 () Bool)

(declare-fun res!282870 () Bool)

(declare-fun e!277837 () Bool)

(assert (=> b!473552 (=> (not res!282870) (not e!277837))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30441 0))(
  ( (array!30442 (arr!14640 (Array (_ BitVec 32) (_ BitVec 64))) (size!14992 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30441)

(declare-datatypes ((V!18895 0))(
  ( (V!18896 (val!6716 Int)) )
))
(declare-datatypes ((ValueCell!6328 0))(
  ( (ValueCellFull!6328 (v!9007 V!18895)) (EmptyCell!6328) )
))
(declare-datatypes ((array!30443 0))(
  ( (array!30444 (arr!14641 (Array (_ BitVec 32) ValueCell!6328)) (size!14993 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30443)

(assert (=> b!473552 (= res!282870 (and (= (size!14993 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14992 _keys!1025) (size!14993 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21727 () Bool)

(declare-fun mapRes!21727 () Bool)

(assert (=> mapIsEmpty!21727 mapRes!21727))

(declare-fun b!473553 () Bool)

(declare-fun res!282871 () Bool)

(assert (=> b!473553 (=> (not res!282871) (not e!277837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30441 (_ BitVec 32)) Bool)

(assert (=> b!473553 (= res!282871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!282867 () Bool)

(assert (=> start!42440 (=> (not res!282867) (not e!277837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42440 (= res!282867 (validMask!0 mask!1365))))

(assert (=> start!42440 e!277837))

(declare-fun tp_is_empty!13343 () Bool)

(assert (=> start!42440 tp_is_empty!13343))

(assert (=> start!42440 tp!41779))

(assert (=> start!42440 true))

(declare-fun array_inv!10562 (array!30441) Bool)

(assert (=> start!42440 (array_inv!10562 _keys!1025)))

(declare-fun e!277836 () Bool)

(declare-fun array_inv!10563 (array!30443) Bool)

(assert (=> start!42440 (and (array_inv!10563 _values!833) e!277836)))

(declare-fun b!473554 () Bool)

(declare-fun res!282869 () Bool)

(assert (=> b!473554 (=> (not res!282869) (not e!277837))))

(declare-datatypes ((List!8933 0))(
  ( (Nil!8930) (Cons!8929 (h!9785 (_ BitVec 64)) (t!14903 List!8933)) )
))
(declare-fun arrayNoDuplicates!0 (array!30441 (_ BitVec 32) List!8933) Bool)

(assert (=> b!473554 (= res!282869 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8930))))

(declare-fun b!473555 () Bool)

(declare-fun e!277841 () Bool)

(assert (=> b!473555 (= e!277836 (and e!277841 mapRes!21727))))

(declare-fun condMapEmpty!21727 () Bool)

(declare-fun mapDefault!21727 () ValueCell!6328)

