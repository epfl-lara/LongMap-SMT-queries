; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70638 () Bool)

(assert start!70638)

(declare-fun b_free!12925 () Bool)

(declare-fun b_next!12925 () Bool)

(assert (=> start!70638 (= b_free!12925 (not b_next!12925))))

(declare-fun tp!45514 () Bool)

(declare-fun b_and!21779 () Bool)

(assert (=> start!70638 (= tp!45514 b_and!21779)))

(declare-fun b!820593 () Bool)

(declare-fun res!559876 () Bool)

(declare-fun e!455915 () Bool)

(assert (=> b!820593 (=> (not res!559876) (not e!455915))))

(declare-datatypes ((array!45464 0))(
  ( (array!45465 (arr!21784 (Array (_ BitVec 32) (_ BitVec 64))) (size!22205 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45464)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45464 (_ BitVec 32)) Bool)

(assert (=> b!820593 (= res!559876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820594 () Bool)

(declare-fun res!559873 () Bool)

(assert (=> b!820594 (=> (not res!559873) (not e!455915))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24515 0))(
  ( (V!24516 (val!7365 Int)) )
))
(declare-datatypes ((ValueCell!6902 0))(
  ( (ValueCellFull!6902 (v!9796 V!24515)) (EmptyCell!6902) )
))
(declare-datatypes ((array!45466 0))(
  ( (array!45467 (arr!21785 (Array (_ BitVec 32) ValueCell!6902)) (size!22206 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45466)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820594 (= res!559873 (and (= (size!22206 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22205 _keys!976) (size!22206 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820595 () Bool)

(declare-fun e!455913 () Bool)

(declare-fun tp_is_empty!14635 () Bool)

(assert (=> b!820595 (= e!455913 tp_is_empty!14635)))

(declare-fun mapNonEmpty!23557 () Bool)

(declare-fun mapRes!23557 () Bool)

(declare-fun tp!45513 () Bool)

(assert (=> mapNonEmpty!23557 (= mapRes!23557 (and tp!45513 e!455913))))

(declare-fun mapKey!23557 () (_ BitVec 32))

(declare-fun mapValue!23557 () ValueCell!6902)

(declare-fun mapRest!23557 () (Array (_ BitVec 32) ValueCell!6902))

(assert (=> mapNonEmpty!23557 (= (arr!21785 _values!788) (store mapRest!23557 mapKey!23557 mapValue!23557))))

(declare-fun b!820596 () Bool)

(declare-fun e!455917 () Bool)

(declare-fun e!455916 () Bool)

(assert (=> b!820596 (= e!455917 (and e!455916 mapRes!23557))))

(declare-fun condMapEmpty!23557 () Bool)

(declare-fun mapDefault!23557 () ValueCell!6902)

