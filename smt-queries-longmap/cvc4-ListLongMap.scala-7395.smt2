; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94150 () Bool)

(assert start!94150)

(declare-fun b_free!21551 () Bool)

(declare-fun b_next!21551 () Bool)

(assert (=> start!94150 (= b_free!21551 (not b_next!21551))))

(declare-fun tp!76087 () Bool)

(declare-fun b_and!34301 () Bool)

(assert (=> start!94150 (= tp!76087 b_and!34301)))

(declare-fun b!1064708 () Bool)

(declare-fun res!710762 () Bool)

(declare-fun e!606856 () Bool)

(assert (=> b!1064708 (=> (not res!710762) (not e!606856))))

(declare-datatypes ((array!67709 0))(
  ( (array!67710 (arr!32558 (Array (_ BitVec 32) (_ BitVec 64))) (size!33094 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67709)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67709 (_ BitVec 32)) Bool)

(assert (=> b!1064708 (= res!710762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39724 () Bool)

(declare-fun mapRes!39724 () Bool)

(declare-fun tp!76088 () Bool)

(declare-fun e!606853 () Bool)

(assert (=> mapNonEmpty!39724 (= mapRes!39724 (and tp!76088 e!606853))))

(declare-datatypes ((V!38949 0))(
  ( (V!38950 (val!12731 Int)) )
))
(declare-datatypes ((ValueCell!11977 0))(
  ( (ValueCellFull!11977 (v!15343 V!38949)) (EmptyCell!11977) )
))
(declare-fun mapRest!39724 () (Array (_ BitVec 32) ValueCell!11977))

(declare-fun mapValue!39724 () ValueCell!11977)

(declare-datatypes ((array!67711 0))(
  ( (array!67712 (arr!32559 (Array (_ BitVec 32) ValueCell!11977)) (size!33095 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67711)

(declare-fun mapKey!39724 () (_ BitVec 32))

(assert (=> mapNonEmpty!39724 (= (arr!32559 _values!955) (store mapRest!39724 mapKey!39724 mapValue!39724))))

(declare-fun b!1064709 () Bool)

(declare-fun e!606851 () Bool)

(assert (=> b!1064709 (= e!606851 true)))

(declare-fun zeroValueBefore!47 () V!38949)

(declare-datatypes ((tuple2!16126 0))(
  ( (tuple2!16127 (_1!8074 (_ BitVec 64)) (_2!8074 V!38949)) )
))
(declare-datatypes ((List!22697 0))(
  ( (Nil!22694) (Cons!22693 (h!23902 tuple2!16126) (t!32014 List!22697)) )
))
(declare-datatypes ((ListLongMap!14095 0))(
  ( (ListLongMap!14096 (toList!7063 List!22697)) )
))
(declare-fun lt!469337 () ListLongMap!14095)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38949)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4023 (array!67709 array!67711 (_ BitVec 32) (_ BitVec 32) V!38949 V!38949 (_ BitVec 32) Int) ListLongMap!14095)

(assert (=> b!1064709 (= lt!469337 (getCurrentListMap!4023 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064710 () Bool)

(declare-fun tp_is_empty!25361 () Bool)

(assert (=> b!1064710 (= e!606853 tp_is_empty!25361)))

(declare-fun b!1064711 () Bool)

(declare-fun res!710758 () Bool)

(assert (=> b!1064711 (=> (not res!710758) (not e!606856))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1064711 (= res!710758 (and (= (size!33095 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33094 _keys!1163) (size!33095 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!710761 () Bool)

(assert (=> start!94150 (=> (not res!710761) (not e!606856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94150 (= res!710761 (validMask!0 mask!1515))))

(assert (=> start!94150 e!606856))

(assert (=> start!94150 true))

(assert (=> start!94150 tp_is_empty!25361))

(declare-fun e!606854 () Bool)

(declare-fun array_inv!25212 (array!67711) Bool)

(assert (=> start!94150 (and (array_inv!25212 _values!955) e!606854)))

(assert (=> start!94150 tp!76087))

(declare-fun array_inv!25213 (array!67709) Bool)

(assert (=> start!94150 (array_inv!25213 _keys!1163)))

(declare-fun b!1064712 () Bool)

(declare-fun e!606852 () Bool)

(assert (=> b!1064712 (= e!606854 (and e!606852 mapRes!39724))))

(declare-fun condMapEmpty!39724 () Bool)

(declare-fun mapDefault!39724 () ValueCell!11977)

