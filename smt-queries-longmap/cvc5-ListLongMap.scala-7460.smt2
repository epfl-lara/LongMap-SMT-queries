; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94668 () Bool)

(assert start!94668)

(declare-fun b_free!21937 () Bool)

(declare-fun b_next!21937 () Bool)

(assert (=> start!94668 (= b_free!21937 (not b_next!21937))))

(declare-fun tp!77266 () Bool)

(declare-fun b_and!34757 () Bool)

(assert (=> start!94668 (= tp!77266 b_and!34757)))

(declare-fun mapNonEmpty!40324 () Bool)

(declare-fun mapRes!40324 () Bool)

(declare-fun tp!77267 () Bool)

(declare-fun e!610977 () Bool)

(assert (=> mapNonEmpty!40324 (= mapRes!40324 (and tp!77267 e!610977))))

(declare-datatypes ((V!39465 0))(
  ( (V!39466 (val!12924 Int)) )
))
(declare-datatypes ((ValueCell!12170 0))(
  ( (ValueCellFull!12170 (v!15540 V!39465)) (EmptyCell!12170) )
))
(declare-fun mapValue!40324 () ValueCell!12170)

(declare-datatypes ((array!68469 0))(
  ( (array!68470 (arr!32931 (Array (_ BitVec 32) ValueCell!12170)) (size!33467 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68469)

(declare-fun mapRest!40324 () (Array (_ BitVec 32) ValueCell!12170))

(declare-fun mapKey!40324 () (_ BitVec 32))

(assert (=> mapNonEmpty!40324 (= (arr!32931 _values!955) (store mapRest!40324 mapKey!40324 mapValue!40324))))

(declare-fun b!1070349 () Bool)

(declare-fun res!714072 () Bool)

(declare-fun e!610981 () Bool)

(assert (=> b!1070349 (=> (not res!714072) (not e!610981))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68471 0))(
  ( (array!68472 (arr!32932 (Array (_ BitVec 32) (_ BitVec 64))) (size!33468 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68471)

(assert (=> b!1070349 (= res!714072 (and (= (size!33467 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33468 _keys!1163) (size!33467 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!714071 () Bool)

(assert (=> start!94668 (=> (not res!714071) (not e!610981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94668 (= res!714071 (validMask!0 mask!1515))))

(assert (=> start!94668 e!610981))

(assert (=> start!94668 true))

(declare-fun tp_is_empty!25747 () Bool)

(assert (=> start!94668 tp_is_empty!25747))

(declare-fun e!610979 () Bool)

(declare-fun array_inv!25472 (array!68469) Bool)

(assert (=> start!94668 (and (array_inv!25472 _values!955) e!610979)))

(assert (=> start!94668 tp!77266))

(declare-fun array_inv!25473 (array!68471) Bool)

(assert (=> start!94668 (array_inv!25473 _keys!1163)))

(declare-fun mapIsEmpty!40324 () Bool)

(assert (=> mapIsEmpty!40324 mapRes!40324))

(declare-fun b!1070350 () Bool)

(declare-fun res!714068 () Bool)

(assert (=> b!1070350 (=> (not res!714068) (not e!610981))))

(declare-datatypes ((List!22974 0))(
  ( (Nil!22971) (Cons!22970 (h!24179 (_ BitVec 64)) (t!32305 List!22974)) )
))
(declare-fun arrayNoDuplicates!0 (array!68471 (_ BitVec 32) List!22974) Bool)

(assert (=> b!1070350 (= res!714068 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22971))))

(declare-fun b!1070351 () Bool)

(declare-fun e!610980 () Bool)

(assert (=> b!1070351 (= e!610981 (not e!610980))))

(declare-fun res!714070 () Bool)

(assert (=> b!1070351 (=> res!714070 e!610980)))

(assert (=> b!1070351 (= res!714070 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16430 0))(
  ( (tuple2!16431 (_1!8226 (_ BitVec 64)) (_2!8226 V!39465)) )
))
(declare-datatypes ((List!22975 0))(
  ( (Nil!22972) (Cons!22971 (h!24180 tuple2!16430) (t!32306 List!22975)) )
))
(declare-datatypes ((ListLongMap!14399 0))(
  ( (ListLongMap!14400 (toList!7215 List!22975)) )
))
(declare-fun lt!473027 () ListLongMap!14399)

(declare-fun lt!473026 () ListLongMap!14399)

(assert (=> b!1070351 (= lt!473027 lt!473026)))

(declare-fun zeroValueBefore!47 () V!39465)

(declare-fun minValue!907 () V!39465)

(declare-datatypes ((Unit!35229 0))(
  ( (Unit!35230) )
))
(declare-fun lt!473029 () Unit!35229)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39465)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!828 (array!68471 array!68469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39465 V!39465 V!39465 V!39465 (_ BitVec 32) Int) Unit!35229)

(assert (=> b!1070351 (= lt!473029 (lemmaNoChangeToArrayThenSameMapNoExtras!828 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3791 (array!68471 array!68469 (_ BitVec 32) (_ BitVec 32) V!39465 V!39465 (_ BitVec 32) Int) ListLongMap!14399)

(assert (=> b!1070351 (= lt!473026 (getCurrentListMapNoExtraKeys!3791 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070351 (= lt!473027 (getCurrentListMapNoExtraKeys!3791 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070352 () Bool)

(assert (=> b!1070352 (= e!610980 true)))

(declare-fun lt!473028 () ListLongMap!14399)

(declare-fun getCurrentListMap!4118 (array!68471 array!68469 (_ BitVec 32) (_ BitVec 32) V!39465 V!39465 (_ BitVec 32) Int) ListLongMap!14399)

(assert (=> b!1070352 (= lt!473028 (getCurrentListMap!4118 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070353 () Bool)

(declare-fun res!714069 () Bool)

(assert (=> b!1070353 (=> (not res!714069) (not e!610981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68471 (_ BitVec 32)) Bool)

(assert (=> b!1070353 (= res!714069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070354 () Bool)

(declare-fun e!610978 () Bool)

(assert (=> b!1070354 (= e!610979 (and e!610978 mapRes!40324))))

(declare-fun condMapEmpty!40324 () Bool)

(declare-fun mapDefault!40324 () ValueCell!12170)

