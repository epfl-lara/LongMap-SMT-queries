; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94922 () Bool)

(assert start!94922)

(declare-fun b_free!22127 () Bool)

(declare-fun b_next!22127 () Bool)

(assert (=> start!94922 (= b_free!22127 (not b_next!22127))))

(declare-fun tp!77845 () Bool)

(declare-fun b_and!34981 () Bool)

(assert (=> start!94922 (= tp!77845 b_and!34981)))

(declare-fun b!1073279 () Bool)

(declare-fun e!613144 () Bool)

(declare-fun tp_is_empty!25937 () Bool)

(assert (=> b!1073279 (= e!613144 tp_is_empty!25937)))

(declare-fun b!1073280 () Bool)

(declare-fun res!715849 () Bool)

(declare-fun e!613147 () Bool)

(assert (=> b!1073280 (=> (not res!715849) (not e!613147))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39717 0))(
  ( (V!39718 (val!13019 Int)) )
))
(declare-datatypes ((ValueCell!12265 0))(
  ( (ValueCellFull!12265 (v!15637 V!39717)) (EmptyCell!12265) )
))
(declare-datatypes ((array!68837 0))(
  ( (array!68838 (arr!33112 (Array (_ BitVec 32) ValueCell!12265)) (size!33648 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68837)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68839 0))(
  ( (array!68840 (arr!33113 (Array (_ BitVec 32) (_ BitVec 64))) (size!33649 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68839)

(assert (=> b!1073280 (= res!715849 (and (= (size!33648 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33649 _keys!1163) (size!33648 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073281 () Bool)

(declare-fun res!715852 () Bool)

(assert (=> b!1073281 (=> (not res!715852) (not e!613147))))

(declare-datatypes ((List!23114 0))(
  ( (Nil!23111) (Cons!23110 (h!24319 (_ BitVec 64)) (t!32451 List!23114)) )
))
(declare-fun arrayNoDuplicates!0 (array!68839 (_ BitVec 32) List!23114) Bool)

(assert (=> b!1073281 (= res!715852 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23111))))

(declare-fun mapNonEmpty!40618 () Bool)

(declare-fun mapRes!40618 () Bool)

(declare-fun tp!77846 () Bool)

(declare-fun e!613148 () Bool)

(assert (=> mapNonEmpty!40618 (= mapRes!40618 (and tp!77846 e!613148))))

(declare-fun mapKey!40618 () (_ BitVec 32))

(declare-fun mapValue!40618 () ValueCell!12265)

(declare-fun mapRest!40618 () (Array (_ BitVec 32) ValueCell!12265))

(assert (=> mapNonEmpty!40618 (= (arr!33112 _values!955) (store mapRest!40618 mapKey!40618 mapValue!40618))))

(declare-fun b!1073282 () Bool)

(declare-fun e!613145 () Bool)

(assert (=> b!1073282 (= e!613145 (and e!613144 mapRes!40618))))

(declare-fun condMapEmpty!40618 () Bool)

(declare-fun mapDefault!40618 () ValueCell!12265)

