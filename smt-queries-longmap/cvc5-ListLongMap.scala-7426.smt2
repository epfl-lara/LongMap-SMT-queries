; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94392 () Bool)

(assert start!94392)

(declare-fun b_free!21733 () Bool)

(declare-fun b_next!21733 () Bool)

(assert (=> start!94392 (= b_free!21733 (not b_next!21733))))

(declare-fun tp!76642 () Bool)

(declare-fun b_and!34517 () Bool)

(assert (=> start!94392 (= tp!76642 b_and!34517)))

(declare-fun mapNonEmpty!40006 () Bool)

(declare-fun mapRes!40006 () Bool)

(declare-fun tp!76643 () Bool)

(declare-fun e!608766 () Bool)

(assert (=> mapNonEmpty!40006 (= mapRes!40006 (and tp!76643 e!608766))))

(declare-datatypes ((V!39193 0))(
  ( (V!39194 (val!12822 Int)) )
))
(declare-datatypes ((ValueCell!12068 0))(
  ( (ValueCellFull!12068 (v!15436 V!39193)) (EmptyCell!12068) )
))
(declare-fun mapValue!40006 () ValueCell!12068)

(declare-datatypes ((array!68067 0))(
  ( (array!68068 (arr!32734 (Array (_ BitVec 32) ValueCell!12068)) (size!33270 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68067)

(declare-fun mapRest!40006 () (Array (_ BitVec 32) ValueCell!12068))

(declare-fun mapKey!40006 () (_ BitVec 32))

(assert (=> mapNonEmpty!40006 (= (arr!32734 _values!955) (store mapRest!40006 mapKey!40006 mapValue!40006))))

(declare-fun b!1067352 () Bool)

(declare-fun e!608767 () Bool)

(declare-fun tp_is_empty!25543 () Bool)

(assert (=> b!1067352 (= e!608767 tp_is_empty!25543)))

(declare-fun b!1067353 () Bool)

(declare-fun res!712291 () Bool)

(declare-fun e!608765 () Bool)

(assert (=> b!1067353 (=> (not res!712291) (not e!608765))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68069 0))(
  ( (array!68070 (arr!32735 (Array (_ BitVec 32) (_ BitVec 64))) (size!33271 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68069)

(assert (=> b!1067353 (= res!712291 (and (= (size!33270 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33271 _keys!1163) (size!33270 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067354 () Bool)

(declare-fun res!712292 () Bool)

(assert (=> b!1067354 (=> (not res!712292) (not e!608765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68069 (_ BitVec 32)) Bool)

(assert (=> b!1067354 (= res!712292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067355 () Bool)

(declare-fun res!712289 () Bool)

(assert (=> b!1067355 (=> (not res!712289) (not e!608765))))

(declare-datatypes ((List!22827 0))(
  ( (Nil!22824) (Cons!22823 (h!24032 (_ BitVec 64)) (t!32150 List!22827)) )
))
(declare-fun arrayNoDuplicates!0 (array!68069 (_ BitVec 32) List!22827) Bool)

(assert (=> b!1067355 (= res!712289 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22824))))

(declare-fun b!1067356 () Bool)

(assert (=> b!1067356 (= e!608766 tp_is_empty!25543)))

(declare-fun res!712290 () Bool)

(assert (=> start!94392 (=> (not res!712290) (not e!608765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94392 (= res!712290 (validMask!0 mask!1515))))

(assert (=> start!94392 e!608765))

(assert (=> start!94392 true))

(assert (=> start!94392 tp_is_empty!25543))

(declare-fun e!608768 () Bool)

(declare-fun array_inv!25340 (array!68067) Bool)

(assert (=> start!94392 (and (array_inv!25340 _values!955) e!608768)))

(assert (=> start!94392 tp!76642))

(declare-fun array_inv!25341 (array!68069) Bool)

(assert (=> start!94392 (array_inv!25341 _keys!1163)))

(declare-fun mapIsEmpty!40006 () Bool)

(assert (=> mapIsEmpty!40006 mapRes!40006))

(declare-fun b!1067357 () Bool)

(assert (=> b!1067357 (= e!608765 (not true))))

(declare-datatypes ((tuple2!16268 0))(
  ( (tuple2!16269 (_1!8145 (_ BitVec 64)) (_2!8145 V!39193)) )
))
(declare-datatypes ((List!22828 0))(
  ( (Nil!22825) (Cons!22824 (h!24033 tuple2!16268) (t!32151 List!22828)) )
))
(declare-datatypes ((ListLongMap!14237 0))(
  ( (ListLongMap!14238 (toList!7134 List!22828)) )
))
(declare-fun lt!471411 () ListLongMap!14237)

(declare-fun lt!471409 () ListLongMap!14237)

(assert (=> b!1067357 (= lt!471411 lt!471409)))

(declare-fun zeroValueBefore!47 () V!39193)

(declare-datatypes ((Unit!35065 0))(
  ( (Unit!35066) )
))
(declare-fun lt!471410 () Unit!35065)

(declare-fun minValue!907 () V!39193)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39193)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!755 (array!68069 array!68067 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39193 V!39193 V!39193 V!39193 (_ BitVec 32) Int) Unit!35065)

(assert (=> b!1067357 (= lt!471410 (lemmaNoChangeToArrayThenSameMapNoExtras!755 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3718 (array!68069 array!68067 (_ BitVec 32) (_ BitVec 32) V!39193 V!39193 (_ BitVec 32) Int) ListLongMap!14237)

(assert (=> b!1067357 (= lt!471409 (getCurrentListMapNoExtraKeys!3718 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067357 (= lt!471411 (getCurrentListMapNoExtraKeys!3718 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067358 () Bool)

(assert (=> b!1067358 (= e!608768 (and e!608767 mapRes!40006))))

(declare-fun condMapEmpty!40006 () Bool)

(declare-fun mapDefault!40006 () ValueCell!12068)

