; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94912 () Bool)

(assert start!94912)

(declare-fun b_free!22117 () Bool)

(declare-fun b_next!22117 () Bool)

(assert (=> start!94912 (= b_free!22117 (not b_next!22117))))

(declare-fun tp!77815 () Bool)

(declare-fun b_and!34971 () Bool)

(assert (=> start!94912 (= tp!77815 b_and!34971)))

(declare-fun b!1073174 () Bool)

(declare-fun res!715792 () Bool)

(declare-fun e!613073 () Bool)

(assert (=> b!1073174 (=> (not res!715792) (not e!613073))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39705 0))(
  ( (V!39706 (val!13014 Int)) )
))
(declare-datatypes ((ValueCell!12260 0))(
  ( (ValueCellFull!12260 (v!15632 V!39705)) (EmptyCell!12260) )
))
(declare-datatypes ((array!68817 0))(
  ( (array!68818 (arr!33102 (Array (_ BitVec 32) ValueCell!12260)) (size!33638 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68817)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68819 0))(
  ( (array!68820 (arr!33103 (Array (_ BitVec 32) (_ BitVec 64))) (size!33639 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68819)

(assert (=> b!1073174 (= res!715792 (and (= (size!33638 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33639 _keys!1163) (size!33638 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40603 () Bool)

(declare-fun mapRes!40603 () Bool)

(assert (=> mapIsEmpty!40603 mapRes!40603))

(declare-fun mapNonEmpty!40603 () Bool)

(declare-fun tp!77816 () Bool)

(declare-fun e!613072 () Bool)

(assert (=> mapNonEmpty!40603 (= mapRes!40603 (and tp!77816 e!613072))))

(declare-fun mapValue!40603 () ValueCell!12260)

(declare-fun mapKey!40603 () (_ BitVec 32))

(declare-fun mapRest!40603 () (Array (_ BitVec 32) ValueCell!12260))

(assert (=> mapNonEmpty!40603 (= (arr!33102 _values!955) (store mapRest!40603 mapKey!40603 mapValue!40603))))

(declare-fun b!1073175 () Bool)

(declare-fun e!613069 () Bool)

(declare-fun e!613071 () Bool)

(assert (=> b!1073175 (= e!613069 (and e!613071 mapRes!40603))))

(declare-fun condMapEmpty!40603 () Bool)

(declare-fun mapDefault!40603 () ValueCell!12260)

