; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94066 () Bool)

(assert start!94066)

(declare-fun b_free!21481 () Bool)

(declare-fun b_next!21481 () Bool)

(assert (=> start!94066 (= b_free!21481 (not b_next!21481))))

(declare-fun tp!75874 () Bool)

(declare-fun b_and!34223 () Bool)

(assert (=> start!94066 (= tp!75874 b_and!34223)))

(declare-fun b!1063844 () Bool)

(declare-fun e!606231 () Bool)

(declare-fun tp_is_empty!25291 () Bool)

(assert (=> b!1063844 (= e!606231 tp_is_empty!25291)))

(declare-fun b!1063845 () Bool)

(declare-fun res!710264 () Bool)

(declare-fun e!606227 () Bool)

(assert (=> b!1063845 (=> (not res!710264) (not e!606227))))

(declare-datatypes ((array!67581 0))(
  ( (array!67582 (arr!32495 (Array (_ BitVec 32) (_ BitVec 64))) (size!33031 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67581)

(declare-datatypes ((List!22651 0))(
  ( (Nil!22648) (Cons!22647 (h!23856 (_ BitVec 64)) (t!31966 List!22651)) )
))
(declare-fun arrayNoDuplicates!0 (array!67581 (_ BitVec 32) List!22651) Bool)

(assert (=> b!1063845 (= res!710264 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22648))))

(declare-fun b!1063846 () Bool)

(declare-fun e!606229 () Bool)

(assert (=> b!1063846 (= e!606229 tp_is_empty!25291)))

(declare-fun b!1063847 () Bool)

(assert (=> b!1063847 (= e!606227 (not true))))

(declare-datatypes ((V!38857 0))(
  ( (V!38858 (val!12696 Int)) )
))
(declare-datatypes ((tuple2!16074 0))(
  ( (tuple2!16075 (_1!8048 (_ BitVec 64)) (_2!8048 V!38857)) )
))
(declare-datatypes ((List!22652 0))(
  ( (Nil!22649) (Cons!22648 (h!23857 tuple2!16074) (t!31967 List!22652)) )
))
(declare-datatypes ((ListLongMap!14043 0))(
  ( (ListLongMap!14044 (toList!7037 List!22652)) )
))
(declare-fun lt!468937 () ListLongMap!14043)

(declare-fun lt!468936 () ListLongMap!14043)

(assert (=> b!1063847 (= lt!468937 lt!468936)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38857)

(declare-datatypes ((Unit!34874 0))(
  ( (Unit!34875) )
))
(declare-fun lt!468935 () Unit!34874)

(declare-datatypes ((ValueCell!11942 0))(
  ( (ValueCellFull!11942 (v!15308 V!38857)) (EmptyCell!11942) )
))
(declare-datatypes ((array!67583 0))(
  ( (array!67584 (arr!32496 (Array (_ BitVec 32) ValueCell!11942)) (size!33032 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67583)

(declare-fun minValue!907 () V!38857)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38857)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!666 (array!67581 array!67583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38857 V!38857 V!38857 V!38857 (_ BitVec 32) Int) Unit!34874)

(assert (=> b!1063847 (= lt!468935 (lemmaNoChangeToArrayThenSameMapNoExtras!666 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3629 (array!67581 array!67583 (_ BitVec 32) (_ BitVec 32) V!38857 V!38857 (_ BitVec 32) Int) ListLongMap!14043)

(assert (=> b!1063847 (= lt!468936 (getCurrentListMapNoExtraKeys!3629 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063847 (= lt!468937 (getCurrentListMapNoExtraKeys!3629 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!710265 () Bool)

(assert (=> start!94066 (=> (not res!710265) (not e!606227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94066 (= res!710265 (validMask!0 mask!1515))))

(assert (=> start!94066 e!606227))

(assert (=> start!94066 true))

(assert (=> start!94066 tp_is_empty!25291))

(declare-fun e!606228 () Bool)

(declare-fun array_inv!25168 (array!67583) Bool)

(assert (=> start!94066 (and (array_inv!25168 _values!955) e!606228)))

(assert (=> start!94066 tp!75874))

(declare-fun array_inv!25169 (array!67581) Bool)

(assert (=> start!94066 (array_inv!25169 _keys!1163)))

(declare-fun b!1063848 () Bool)

(declare-fun res!710266 () Bool)

(assert (=> b!1063848 (=> (not res!710266) (not e!606227))))

(assert (=> b!1063848 (= res!710266 (and (= (size!33032 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33031 _keys!1163) (size!33032 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39616 () Bool)

(declare-fun mapRes!39616 () Bool)

(declare-fun tp!75875 () Bool)

(assert (=> mapNonEmpty!39616 (= mapRes!39616 (and tp!75875 e!606231))))

(declare-fun mapKey!39616 () (_ BitVec 32))

(declare-fun mapRest!39616 () (Array (_ BitVec 32) ValueCell!11942))

(declare-fun mapValue!39616 () ValueCell!11942)

(assert (=> mapNonEmpty!39616 (= (arr!32496 _values!955) (store mapRest!39616 mapKey!39616 mapValue!39616))))

(declare-fun b!1063849 () Bool)

(assert (=> b!1063849 (= e!606228 (and e!606229 mapRes!39616))))

(declare-fun condMapEmpty!39616 () Bool)

(declare-fun mapDefault!39616 () ValueCell!11942)

