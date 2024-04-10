; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94030 () Bool)

(assert start!94030)

(declare-fun b_free!21467 () Bool)

(declare-fun b_next!21467 () Bool)

(assert (=> start!94030 (= b_free!21467 (not b_next!21467))))

(declare-fun tp!75830 () Bool)

(declare-fun b_and!34199 () Bool)

(assert (=> start!94030 (= tp!75830 b_and!34199)))

(declare-fun mapNonEmpty!39592 () Bool)

(declare-fun mapRes!39592 () Bool)

(declare-fun tp!75829 () Bool)

(declare-fun e!606021 () Bool)

(assert (=> mapNonEmpty!39592 (= mapRes!39592 (and tp!75829 e!606021))))

(declare-datatypes ((V!38837 0))(
  ( (V!38838 (val!12689 Int)) )
))
(declare-datatypes ((ValueCell!11935 0))(
  ( (ValueCellFull!11935 (v!15300 V!38837)) (EmptyCell!11935) )
))
(declare-fun mapValue!39592 () ValueCell!11935)

(declare-fun mapRest!39592 () (Array (_ BitVec 32) ValueCell!11935))

(declare-datatypes ((array!67551 0))(
  ( (array!67552 (arr!32481 (Array (_ BitVec 32) ValueCell!11935)) (size!33017 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67551)

(declare-fun mapKey!39592 () (_ BitVec 32))

(assert (=> mapNonEmpty!39592 (= (arr!32481 _values!955) (store mapRest!39592 mapKey!39592 mapValue!39592))))

(declare-fun b!1063538 () Bool)

(declare-fun e!606024 () Bool)

(declare-datatypes ((array!67553 0))(
  ( (array!67554 (arr!32482 (Array (_ BitVec 32) (_ BitVec 64))) (size!33018 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67553)

(assert (=> b!1063538 (= e!606024 (bvsle #b00000000000000000000000000000000 (size!33018 _keys!1163)))))

(declare-datatypes ((tuple2!16062 0))(
  ( (tuple2!16063 (_1!8042 (_ BitVec 64)) (_2!8042 V!38837)) )
))
(declare-datatypes ((List!22641 0))(
  ( (Nil!22638) (Cons!22637 (h!23846 tuple2!16062) (t!31954 List!22641)) )
))
(declare-datatypes ((ListLongMap!14031 0))(
  ( (ListLongMap!14032 (toList!7031 List!22641)) )
))
(declare-fun lt!468750 () ListLongMap!14031)

(declare-fun -!591 (ListLongMap!14031 (_ BitVec 64)) ListLongMap!14031)

(assert (=> b!1063538 (= (-!591 lt!468750 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468750)))

(declare-datatypes ((Unit!34860 0))(
  ( (Unit!34861) )
))
(declare-fun lt!468749 () Unit!34860)

(declare-fun removeNotPresentStillSame!38 (ListLongMap!14031 (_ BitVec 64)) Unit!34860)

(assert (=> b!1063538 (= lt!468749 (removeNotPresentStillSame!38 lt!468750 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!710121 () Bool)

(declare-fun e!606023 () Bool)

(assert (=> start!94030 (=> (not res!710121) (not e!606023))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94030 (= res!710121 (validMask!0 mask!1515))))

(assert (=> start!94030 e!606023))

(assert (=> start!94030 true))

(declare-fun tp_is_empty!25277 () Bool)

(assert (=> start!94030 tp_is_empty!25277))

(declare-fun e!606025 () Bool)

(declare-fun array_inv!25158 (array!67551) Bool)

(assert (=> start!94030 (and (array_inv!25158 _values!955) e!606025)))

(assert (=> start!94030 tp!75830))

(declare-fun array_inv!25159 (array!67553) Bool)

(assert (=> start!94030 (array_inv!25159 _keys!1163)))

(declare-fun b!1063539 () Bool)

(assert (=> b!1063539 (= e!606021 tp_is_empty!25277)))

(declare-fun b!1063540 () Bool)

(declare-fun e!606022 () Bool)

(assert (=> b!1063540 (= e!606022 tp_is_empty!25277)))

(declare-fun mapIsEmpty!39592 () Bool)

(assert (=> mapIsEmpty!39592 mapRes!39592))

(declare-fun b!1063541 () Bool)

(declare-fun res!710116 () Bool)

(assert (=> b!1063541 (=> (not res!710116) (not e!606023))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063541 (= res!710116 (and (= (size!33017 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33018 _keys!1163) (size!33017 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063542 () Bool)

(declare-fun e!606020 () Bool)

(assert (=> b!1063542 (= e!606020 e!606024)))

(declare-fun res!710119 () Bool)

(assert (=> b!1063542 (=> res!710119 e!606024)))

(declare-fun contains!6260 (ListLongMap!14031 (_ BitVec 64)) Bool)

(assert (=> b!1063542 (= res!710119 (contains!6260 lt!468750 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38837)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38837)

(declare-fun getCurrentListMap!4012 (array!67553 array!67551 (_ BitVec 32) (_ BitVec 32) V!38837 V!38837 (_ BitVec 32) Int) ListLongMap!14031)

(assert (=> b!1063542 (= lt!468750 (getCurrentListMap!4012 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063543 () Bool)

(assert (=> b!1063543 (= e!606023 (not e!606020))))

(declare-fun res!710118 () Bool)

(assert (=> b!1063543 (=> res!710118 e!606020)))

(assert (=> b!1063543 (= res!710118 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468747 () ListLongMap!14031)

(declare-fun lt!468746 () ListLongMap!14031)

(assert (=> b!1063543 (= lt!468747 lt!468746)))

(declare-fun lt!468748 () Unit!34860)

(declare-fun zeroValueAfter!47 () V!38837)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!660 (array!67553 array!67551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38837 V!38837 V!38837 V!38837 (_ BitVec 32) Int) Unit!34860)

(assert (=> b!1063543 (= lt!468748 (lemmaNoChangeToArrayThenSameMapNoExtras!660 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3623 (array!67553 array!67551 (_ BitVec 32) (_ BitVec 32) V!38837 V!38837 (_ BitVec 32) Int) ListLongMap!14031)

(assert (=> b!1063543 (= lt!468746 (getCurrentListMapNoExtraKeys!3623 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063543 (= lt!468747 (getCurrentListMapNoExtraKeys!3623 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063544 () Bool)

(assert (=> b!1063544 (= e!606025 (and e!606022 mapRes!39592))))

(declare-fun condMapEmpty!39592 () Bool)

(declare-fun mapDefault!39592 () ValueCell!11935)

