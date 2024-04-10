; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42654 () Bool)

(assert start!42654)

(declare-fun b_free!12059 () Bool)

(declare-fun b_next!12059 () Bool)

(assert (=> start!42654 (= b_free!12059 (not b_next!12059))))

(declare-fun tp!42223 () Bool)

(declare-fun b_and!20559 () Bool)

(assert (=> start!42654 (= tp!42223 b_and!20559)))

(declare-fun b!475794 () Bool)

(declare-fun res!284105 () Bool)

(declare-fun e!279418 () Bool)

(assert (=> b!475794 (=> (not res!284105) (not e!279418))))

(declare-datatypes ((array!30713 0))(
  ( (array!30714 (arr!14772 (Array (_ BitVec 32) (_ BitVec 64))) (size!15124 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30713)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30713 (_ BitVec 32)) Bool)

(assert (=> b!475794 (= res!284105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!475795 () Bool)

(declare-fun res!284104 () Bool)

(assert (=> b!475795 (=> (not res!284104) (not e!279418))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!19087 0))(
  ( (V!19088 (val!6788 Int)) )
))
(declare-datatypes ((ValueCell!6400 0))(
  ( (ValueCellFull!6400 (v!9082 V!19087)) (EmptyCell!6400) )
))
(declare-datatypes ((array!30715 0))(
  ( (array!30716 (arr!14773 (Array (_ BitVec 32) ValueCell!6400)) (size!15125 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30715)

(assert (=> b!475795 (= res!284104 (and (= (size!15125 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15124 _keys!1025) (size!15125 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475796 () Bool)

(declare-fun e!279417 () Bool)

(declare-fun e!279415 () Bool)

(declare-fun mapRes!21955 () Bool)

(assert (=> b!475796 (= e!279417 (and e!279415 mapRes!21955))))

(declare-fun condMapEmpty!21955 () Bool)

(declare-fun mapDefault!21955 () ValueCell!6400)

