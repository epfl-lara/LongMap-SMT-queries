; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94054 () Bool)

(assert start!94054)

(declare-fun b_free!21469 () Bool)

(declare-fun b_next!21469 () Bool)

(assert (=> start!94054 (= b_free!21469 (not b_next!21469))))

(declare-fun tp!75839 () Bool)

(declare-fun b_and!34211 () Bool)

(assert (=> start!94054 (= tp!75839 b_and!34211)))

(declare-fun mapNonEmpty!39598 () Bool)

(declare-fun mapRes!39598 () Bool)

(declare-fun tp!75838 () Bool)

(declare-fun e!606139 () Bool)

(assert (=> mapNonEmpty!39598 (= mapRes!39598 (and tp!75838 e!606139))))

(declare-datatypes ((V!38841 0))(
  ( (V!38842 (val!12690 Int)) )
))
(declare-datatypes ((ValueCell!11936 0))(
  ( (ValueCellFull!11936 (v!15302 V!38841)) (EmptyCell!11936) )
))
(declare-fun mapValue!39598 () ValueCell!11936)

(declare-datatypes ((array!67557 0))(
  ( (array!67558 (arr!32483 (Array (_ BitVec 32) ValueCell!11936)) (size!33019 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67557)

(declare-fun mapRest!39598 () (Array (_ BitVec 32) ValueCell!11936))

(declare-fun mapKey!39598 () (_ BitVec 32))

(assert (=> mapNonEmpty!39598 (= (arr!32483 _values!955) (store mapRest!39598 mapKey!39598 mapValue!39598))))

(declare-fun b!1063718 () Bool)

(declare-fun e!606140 () Bool)

(assert (=> b!1063718 (= e!606140 (not true))))

(declare-datatypes ((tuple2!16064 0))(
  ( (tuple2!16065 (_1!8043 (_ BitVec 64)) (_2!8043 V!38841)) )
))
(declare-datatypes ((List!22642 0))(
  ( (Nil!22639) (Cons!22638 (h!23847 tuple2!16064) (t!31957 List!22642)) )
))
(declare-datatypes ((ListLongMap!14033 0))(
  ( (ListLongMap!14034 (toList!7032 List!22642)) )
))
(declare-fun lt!468882 () ListLongMap!14033)

(declare-fun lt!468881 () ListLongMap!14033)

(assert (=> b!1063718 (= lt!468882 lt!468881)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38841)

(declare-fun minValue!907 () V!38841)

(declare-datatypes ((Unit!34864 0))(
  ( (Unit!34865) )
))
(declare-fun lt!468883 () Unit!34864)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38841)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67559 0))(
  ( (array!67560 (arr!32484 (Array (_ BitVec 32) (_ BitVec 64))) (size!33020 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67559)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!661 (array!67559 array!67557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38841 V!38841 V!38841 V!38841 (_ BitVec 32) Int) Unit!34864)

(assert (=> b!1063718 (= lt!468883 (lemmaNoChangeToArrayThenSameMapNoExtras!661 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3624 (array!67559 array!67557 (_ BitVec 32) (_ BitVec 32) V!38841 V!38841 (_ BitVec 32) Int) ListLongMap!14033)

(assert (=> b!1063718 (= lt!468881 (getCurrentListMapNoExtraKeys!3624 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063718 (= lt!468882 (getCurrentListMapNoExtraKeys!3624 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063719 () Bool)

(declare-fun res!710193 () Bool)

(assert (=> b!1063719 (=> (not res!710193) (not e!606140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67559 (_ BitVec 32)) Bool)

(assert (=> b!1063719 (= res!710193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063720 () Bool)

(declare-fun res!710191 () Bool)

(assert (=> b!1063720 (=> (not res!710191) (not e!606140))))

(declare-datatypes ((List!22643 0))(
  ( (Nil!22640) (Cons!22639 (h!23848 (_ BitVec 64)) (t!31958 List!22643)) )
))
(declare-fun arrayNoDuplicates!0 (array!67559 (_ BitVec 32) List!22643) Bool)

(assert (=> b!1063720 (= res!710191 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22640))))

(declare-fun b!1063721 () Bool)

(declare-fun res!710192 () Bool)

(assert (=> b!1063721 (=> (not res!710192) (not e!606140))))

(assert (=> b!1063721 (= res!710192 (and (= (size!33019 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33020 _keys!1163) (size!33019 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39598 () Bool)

(assert (=> mapIsEmpty!39598 mapRes!39598))

(declare-fun b!1063722 () Bool)

(declare-fun e!606138 () Bool)

(declare-fun tp_is_empty!25279 () Bool)

(assert (=> b!1063722 (= e!606138 tp_is_empty!25279)))

(declare-fun b!1063723 () Bool)

(assert (=> b!1063723 (= e!606139 tp_is_empty!25279)))

(declare-fun b!1063724 () Bool)

(declare-fun e!606137 () Bool)

(assert (=> b!1063724 (= e!606137 (and e!606138 mapRes!39598))))

(declare-fun condMapEmpty!39598 () Bool)

(declare-fun mapDefault!39598 () ValueCell!11936)

