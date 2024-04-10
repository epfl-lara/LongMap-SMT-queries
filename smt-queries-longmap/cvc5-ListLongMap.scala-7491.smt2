; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94918 () Bool)

(assert start!94918)

(declare-fun b_free!22123 () Bool)

(declare-fun b_next!22123 () Bool)

(assert (=> start!94918 (= b_free!22123 (not b_next!22123))))

(declare-fun tp!77834 () Bool)

(declare-fun b_and!34977 () Bool)

(assert (=> start!94918 (= tp!77834 b_and!34977)))

(declare-fun mapNonEmpty!40612 () Bool)

(declare-fun mapRes!40612 () Bool)

(declare-fun tp!77833 () Bool)

(declare-fun e!613115 () Bool)

(assert (=> mapNonEmpty!40612 (= mapRes!40612 (and tp!77833 e!613115))))

(declare-datatypes ((V!39713 0))(
  ( (V!39714 (val!13017 Int)) )
))
(declare-datatypes ((ValueCell!12263 0))(
  ( (ValueCellFull!12263 (v!15635 V!39713)) (EmptyCell!12263) )
))
(declare-fun mapValue!40612 () ValueCell!12263)

(declare-fun mapKey!40612 () (_ BitVec 32))

(declare-fun mapRest!40612 () (Array (_ BitVec 32) ValueCell!12263))

(declare-datatypes ((array!68829 0))(
  ( (array!68830 (arr!33108 (Array (_ BitVec 32) ValueCell!12263)) (size!33644 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68829)

(assert (=> mapNonEmpty!40612 (= (arr!33108 _values!955) (store mapRest!40612 mapKey!40612 mapValue!40612))))

(declare-fun b!1073237 () Bool)

(declare-fun e!613114 () Bool)

(declare-fun tp_is_empty!25933 () Bool)

(assert (=> b!1073237 (= e!613114 tp_is_empty!25933)))

(declare-fun b!1073238 () Bool)

(declare-fun res!715826 () Bool)

(declare-fun e!613118 () Bool)

(assert (=> b!1073238 (=> (not res!715826) (not e!613118))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68831 0))(
  ( (array!68832 (arr!33109 (Array (_ BitVec 32) (_ BitVec 64))) (size!33645 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68831)

(assert (=> b!1073238 (= res!715826 (and (= (size!33644 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33645 _keys!1163) (size!33644 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073239 () Bool)

(declare-fun e!613117 () Bool)

(assert (=> b!1073239 (= e!613117 (and e!613114 mapRes!40612))))

(declare-fun condMapEmpty!40612 () Bool)

(declare-fun mapDefault!40612 () ValueCell!12263)

