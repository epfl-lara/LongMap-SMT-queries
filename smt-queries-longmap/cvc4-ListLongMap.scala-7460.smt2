; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94672 () Bool)

(assert start!94672)

(declare-fun b_free!21941 () Bool)

(declare-fun b_next!21941 () Bool)

(assert (=> start!94672 (= b_free!21941 (not b_next!21941))))

(declare-fun tp!77278 () Bool)

(declare-fun b_and!34761 () Bool)

(assert (=> start!94672 (= tp!77278 b_and!34761)))

(declare-fun b!1070397 () Bool)

(declare-fun res!714102 () Bool)

(declare-fun e!611016 () Bool)

(assert (=> b!1070397 (=> (not res!714102) (not e!611016))))

(declare-datatypes ((array!68477 0))(
  ( (array!68478 (arr!32935 (Array (_ BitVec 32) (_ BitVec 64))) (size!33471 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68477)

(declare-datatypes ((List!22978 0))(
  ( (Nil!22975) (Cons!22974 (h!24183 (_ BitVec 64)) (t!32309 List!22978)) )
))
(declare-fun arrayNoDuplicates!0 (array!68477 (_ BitVec 32) List!22978) Bool)

(assert (=> b!1070397 (= res!714102 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22975))))

(declare-fun mapIsEmpty!40330 () Bool)

(declare-fun mapRes!40330 () Bool)

(assert (=> mapIsEmpty!40330 mapRes!40330))

(declare-fun b!1070398 () Bool)

(declare-fun e!611014 () Bool)

(assert (=> b!1070398 (= e!611016 (not e!611014))))

(declare-fun res!714099 () Bool)

(assert (=> b!1070398 (=> res!714099 e!611014)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070398 (= res!714099 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39469 0))(
  ( (V!39470 (val!12926 Int)) )
))
(declare-datatypes ((tuple2!16434 0))(
  ( (tuple2!16435 (_1!8228 (_ BitVec 64)) (_2!8228 V!39469)) )
))
(declare-datatypes ((List!22979 0))(
  ( (Nil!22976) (Cons!22975 (h!24184 tuple2!16434) (t!32310 List!22979)) )
))
(declare-datatypes ((ListLongMap!14403 0))(
  ( (ListLongMap!14404 (toList!7217 List!22979)) )
))
(declare-fun lt!473053 () ListLongMap!14403)

(declare-fun lt!473051 () ListLongMap!14403)

(assert (=> b!1070398 (= lt!473053 lt!473051)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39469)

(declare-datatypes ((Unit!35233 0))(
  ( (Unit!35234) )
))
(declare-fun lt!473050 () Unit!35233)

(declare-datatypes ((ValueCell!12172 0))(
  ( (ValueCellFull!12172 (v!15542 V!39469)) (EmptyCell!12172) )
))
(declare-datatypes ((array!68479 0))(
  ( (array!68480 (arr!32936 (Array (_ BitVec 32) ValueCell!12172)) (size!33472 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68479)

(declare-fun minValue!907 () V!39469)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39469)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!830 (array!68477 array!68479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39469 V!39469 V!39469 V!39469 (_ BitVec 32) Int) Unit!35233)

(assert (=> b!1070398 (= lt!473050 (lemmaNoChangeToArrayThenSameMapNoExtras!830 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3793 (array!68477 array!68479 (_ BitVec 32) (_ BitVec 32) V!39469 V!39469 (_ BitVec 32) Int) ListLongMap!14403)

(assert (=> b!1070398 (= lt!473051 (getCurrentListMapNoExtraKeys!3793 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070398 (= lt!473053 (getCurrentListMapNoExtraKeys!3793 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!714101 () Bool)

(assert (=> start!94672 (=> (not res!714101) (not e!611016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94672 (= res!714101 (validMask!0 mask!1515))))

(assert (=> start!94672 e!611016))

(assert (=> start!94672 true))

(declare-fun tp_is_empty!25751 () Bool)

(assert (=> start!94672 tp_is_empty!25751))

(declare-fun e!611015 () Bool)

(declare-fun array_inv!25476 (array!68479) Bool)

(assert (=> start!94672 (and (array_inv!25476 _values!955) e!611015)))

(assert (=> start!94672 tp!77278))

(declare-fun array_inv!25477 (array!68477) Bool)

(assert (=> start!94672 (array_inv!25477 _keys!1163)))

(declare-fun mapNonEmpty!40330 () Bool)

(declare-fun tp!77279 () Bool)

(declare-fun e!611013 () Bool)

(assert (=> mapNonEmpty!40330 (= mapRes!40330 (and tp!77279 e!611013))))

(declare-fun mapKey!40330 () (_ BitVec 32))

(declare-fun mapValue!40330 () ValueCell!12172)

(declare-fun mapRest!40330 () (Array (_ BitVec 32) ValueCell!12172))

(assert (=> mapNonEmpty!40330 (= (arr!32936 _values!955) (store mapRest!40330 mapKey!40330 mapValue!40330))))

(declare-fun b!1070399 () Bool)

(declare-fun res!714098 () Bool)

(assert (=> b!1070399 (=> (not res!714098) (not e!611016))))

(assert (=> b!1070399 (= res!714098 (and (= (size!33472 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33471 _keys!1163) (size!33472 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070400 () Bool)

(assert (=> b!1070400 (= e!611014 true)))

(declare-fun lt!473052 () ListLongMap!14403)

(declare-fun getCurrentListMap!4120 (array!68477 array!68479 (_ BitVec 32) (_ BitVec 32) V!39469 V!39469 (_ BitVec 32) Int) ListLongMap!14403)

(assert (=> b!1070400 (= lt!473052 (getCurrentListMap!4120 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070401 () Bool)

(declare-fun res!714100 () Bool)

(assert (=> b!1070401 (=> (not res!714100) (not e!611016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68477 (_ BitVec 32)) Bool)

(assert (=> b!1070401 (= res!714100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070402 () Bool)

(declare-fun e!611017 () Bool)

(assert (=> b!1070402 (= e!611015 (and e!611017 mapRes!40330))))

(declare-fun condMapEmpty!40330 () Bool)

(declare-fun mapDefault!40330 () ValueCell!12172)

