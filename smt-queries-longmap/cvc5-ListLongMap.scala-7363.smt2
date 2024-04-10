; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93896 () Bool)

(assert start!93896)

(declare-fun b_free!21355 () Bool)

(declare-fun b_next!21355 () Bool)

(assert (=> start!93896 (= b_free!21355 (not b_next!21355))))

(declare-fun tp!75491 () Bool)

(declare-fun b_and!34077 () Bool)

(assert (=> start!93896 (= tp!75491 b_and!34077)))

(declare-fun b!1061876 () Bool)

(declare-fun e!604752 () Bool)

(declare-fun tp_is_empty!25165 () Bool)

(assert (=> b!1061876 (= e!604752 tp_is_empty!25165)))

(declare-fun res!709057 () Bool)

(declare-fun e!604753 () Bool)

(assert (=> start!93896 (=> (not res!709057) (not e!604753))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93896 (= res!709057 (validMask!0 mask!1515))))

(assert (=> start!93896 e!604753))

(assert (=> start!93896 true))

(assert (=> start!93896 tp_is_empty!25165))

(declare-datatypes ((V!38689 0))(
  ( (V!38690 (val!12633 Int)) )
))
(declare-datatypes ((ValueCell!11879 0))(
  ( (ValueCellFull!11879 (v!15243 V!38689)) (EmptyCell!11879) )
))
(declare-datatypes ((array!67335 0))(
  ( (array!67336 (arr!32374 (Array (_ BitVec 32) ValueCell!11879)) (size!32910 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67335)

(declare-fun e!604755 () Bool)

(declare-fun array_inv!25084 (array!67335) Bool)

(assert (=> start!93896 (and (array_inv!25084 _values!955) e!604755)))

(assert (=> start!93896 tp!75491))

(declare-datatypes ((array!67337 0))(
  ( (array!67338 (arr!32375 (Array (_ BitVec 32) (_ BitVec 64))) (size!32911 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67337)

(declare-fun array_inv!25085 (array!67337) Bool)

(assert (=> start!93896 (array_inv!25085 _keys!1163)))

(declare-fun b!1061877 () Bool)

(declare-fun e!604754 () Bool)

(assert (=> b!1061877 (= e!604754 tp_is_empty!25165)))

(declare-fun b!1061878 () Bool)

(declare-fun e!604756 () Bool)

(assert (=> b!1061878 (= e!604753 (not e!604756))))

(declare-fun res!709058 () Bool)

(assert (=> b!1061878 (=> res!709058 e!604756)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061878 (= res!709058 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!15970 0))(
  ( (tuple2!15971 (_1!7996 (_ BitVec 64)) (_2!7996 V!38689)) )
))
(declare-datatypes ((List!22554 0))(
  ( (Nil!22551) (Cons!22550 (h!23759 tuple2!15970) (t!31865 List!22554)) )
))
(declare-datatypes ((ListLongMap!13939 0))(
  ( (ListLongMap!13940 (toList!6985 List!22554)) )
))
(declare-fun lt!467791 () ListLongMap!13939)

(declare-fun lt!467792 () ListLongMap!13939)

(assert (=> b!1061878 (= lt!467791 lt!467792)))

(declare-fun zeroValueBefore!47 () V!38689)

(declare-datatypes ((Unit!34772 0))(
  ( (Unit!34773) )
))
(declare-fun lt!467789 () Unit!34772)

(declare-fun minValue!907 () V!38689)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38689)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!624 (array!67337 array!67335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38689 V!38689 V!38689 V!38689 (_ BitVec 32) Int) Unit!34772)

(assert (=> b!1061878 (= lt!467789 (lemmaNoChangeToArrayThenSameMapNoExtras!624 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3587 (array!67337 array!67335 (_ BitVec 32) (_ BitVec 32) V!38689 V!38689 (_ BitVec 32) Int) ListLongMap!13939)

(assert (=> b!1061878 (= lt!467792 (getCurrentListMapNoExtraKeys!3587 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061878 (= lt!467791 (getCurrentListMapNoExtraKeys!3587 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39421 () Bool)

(declare-fun mapRes!39421 () Bool)

(declare-fun tp!75490 () Bool)

(assert (=> mapNonEmpty!39421 (= mapRes!39421 (and tp!75490 e!604754))))

(declare-fun mapRest!39421 () (Array (_ BitVec 32) ValueCell!11879))

(declare-fun mapValue!39421 () ValueCell!11879)

(declare-fun mapKey!39421 () (_ BitVec 32))

(assert (=> mapNonEmpty!39421 (= (arr!32374 _values!955) (store mapRest!39421 mapKey!39421 mapValue!39421))))

(declare-fun b!1061879 () Bool)

(declare-fun res!709054 () Bool)

(assert (=> b!1061879 (=> (not res!709054) (not e!604753))))

(declare-datatypes ((List!22555 0))(
  ( (Nil!22552) (Cons!22551 (h!23760 (_ BitVec 64)) (t!31866 List!22555)) )
))
(declare-fun arrayNoDuplicates!0 (array!67337 (_ BitVec 32) List!22555) Bool)

(assert (=> b!1061879 (= res!709054 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22552))))

(declare-fun b!1061880 () Bool)

(assert (=> b!1061880 (= e!604755 (and e!604752 mapRes!39421))))

(declare-fun condMapEmpty!39421 () Bool)

(declare-fun mapDefault!39421 () ValueCell!11879)

