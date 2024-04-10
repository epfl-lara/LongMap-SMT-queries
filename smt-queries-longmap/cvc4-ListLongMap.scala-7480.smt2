; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94832 () Bool)

(assert start!94832)

(declare-fun b_free!22061 () Bool)

(declare-fun b_next!22061 () Bool)

(assert (=> start!94832 (= b_free!22061 (not b_next!22061))))

(declare-fun tp!77645 () Bool)

(declare-fun b_and!34903 () Bool)

(assert (=> start!94832 (= tp!77645 b_and!34903)))

(declare-fun res!715294 () Bool)

(declare-fun e!612458 () Bool)

(assert (=> start!94832 (=> (not res!715294) (not e!612458))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94832 (= res!715294 (validMask!0 mask!1515))))

(assert (=> start!94832 e!612458))

(assert (=> start!94832 true))

(declare-fun tp_is_empty!25871 () Bool)

(assert (=> start!94832 tp_is_empty!25871))

(declare-datatypes ((V!39629 0))(
  ( (V!39630 (val!12986 Int)) )
))
(declare-datatypes ((ValueCell!12232 0))(
  ( (ValueCellFull!12232 (v!15603 V!39629)) (EmptyCell!12232) )
))
(declare-datatypes ((array!68711 0))(
  ( (array!68712 (arr!33050 (Array (_ BitVec 32) ValueCell!12232)) (size!33586 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68711)

(declare-fun e!612457 () Bool)

(declare-fun array_inv!25552 (array!68711) Bool)

(assert (=> start!94832 (and (array_inv!25552 _values!955) e!612457)))

(assert (=> start!94832 tp!77645))

(declare-datatypes ((array!68713 0))(
  ( (array!68714 (arr!33051 (Array (_ BitVec 32) (_ BitVec 64))) (size!33587 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68713)

(declare-fun array_inv!25553 (array!68713) Bool)

(assert (=> start!94832 (array_inv!25553 _keys!1163)))

(declare-fun mapNonEmpty!40516 () Bool)

(declare-fun mapRes!40516 () Bool)

(declare-fun tp!77644 () Bool)

(declare-fun e!612453 () Bool)

(assert (=> mapNonEmpty!40516 (= mapRes!40516 (and tp!77644 e!612453))))

(declare-fun mapRest!40516 () (Array (_ BitVec 32) ValueCell!12232))

(declare-fun mapValue!40516 () ValueCell!12232)

(declare-fun mapKey!40516 () (_ BitVec 32))

(assert (=> mapNonEmpty!40516 (= (arr!33050 _values!955) (store mapRest!40516 mapKey!40516 mapValue!40516))))

(declare-fun b!1072320 () Bool)

(declare-fun e!612452 () Bool)

(assert (=> b!1072320 (= e!612458 (not e!612452))))

(declare-fun res!715290 () Bool)

(assert (=> b!1072320 (=> res!715290 e!612452)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072320 (= res!715290 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16540 0))(
  ( (tuple2!16541 (_1!8281 (_ BitVec 64)) (_2!8281 V!39629)) )
))
(declare-datatypes ((List!23073 0))(
  ( (Nil!23070) (Cons!23069 (h!24278 tuple2!16540) (t!32408 List!23073)) )
))
(declare-datatypes ((ListLongMap!14509 0))(
  ( (ListLongMap!14510 (toList!7270 List!23073)) )
))
(declare-fun lt!475232 () ListLongMap!14509)

(declare-fun lt!475236 () ListLongMap!14509)

(assert (=> b!1072320 (= lt!475232 lt!475236)))

(declare-fun zeroValueBefore!47 () V!39629)

(declare-fun minValue!907 () V!39629)

(declare-datatypes ((Unit!35334 0))(
  ( (Unit!35335) )
))
(declare-fun lt!475234 () Unit!35334)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39629)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!871 (array!68713 array!68711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39629 V!39629 V!39629 V!39629 (_ BitVec 32) Int) Unit!35334)

(assert (=> b!1072320 (= lt!475234 (lemmaNoChangeToArrayThenSameMapNoExtras!871 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3834 (array!68713 array!68711 (_ BitVec 32) (_ BitVec 32) V!39629 V!39629 (_ BitVec 32) Int) ListLongMap!14509)

(assert (=> b!1072320 (= lt!475236 (getCurrentListMapNoExtraKeys!3834 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072320 (= lt!475232 (getCurrentListMapNoExtraKeys!3834 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072321 () Bool)

(declare-fun res!715293 () Bool)

(assert (=> b!1072321 (=> (not res!715293) (not e!612458))))

(assert (=> b!1072321 (= res!715293 (and (= (size!33586 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33587 _keys!1163) (size!33586 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072322 () Bool)

(assert (=> b!1072322 (= e!612452 true)))

(declare-fun lt!475235 () ListLongMap!14509)

(declare-fun lt!475239 () ListLongMap!14509)

(declare-fun -!698 (ListLongMap!14509 (_ BitVec 64)) ListLongMap!14509)

(assert (=> b!1072322 (= lt!475235 (-!698 lt!475239 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475238 () ListLongMap!14509)

(declare-fun lt!475233 () ListLongMap!14509)

(assert (=> b!1072322 (= lt!475238 lt!475233)))

(declare-fun lt!475231 () Unit!35334)

(declare-fun addCommutativeForDiffKeys!743 (ListLongMap!14509 (_ BitVec 64) V!39629 (_ BitVec 64) V!39629) Unit!35334)

(assert (=> b!1072322 (= lt!475231 (addCommutativeForDiffKeys!743 lt!475232 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475237 () ListLongMap!14509)

(assert (=> b!1072322 (= (-!698 lt!475233 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475237)))

(declare-fun lt!475230 () tuple2!16540)

(declare-fun +!3204 (ListLongMap!14509 tuple2!16540) ListLongMap!14509)

(assert (=> b!1072322 (= lt!475233 (+!3204 lt!475237 lt!475230))))

(declare-fun lt!475240 () Unit!35334)

(declare-fun addThenRemoveForNewKeyIsSame!68 (ListLongMap!14509 (_ BitVec 64) V!39629) Unit!35334)

(assert (=> b!1072322 (= lt!475240 (addThenRemoveForNewKeyIsSame!68 lt!475237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!475241 () tuple2!16540)

(assert (=> b!1072322 (= lt!475237 (+!3204 lt!475232 lt!475241))))

(declare-fun e!612454 () Bool)

(assert (=> b!1072322 e!612454))

(declare-fun res!715292 () Bool)

(assert (=> b!1072322 (=> (not res!715292) (not e!612454))))

(assert (=> b!1072322 (= res!715292 (= lt!475239 lt!475238))))

(assert (=> b!1072322 (= lt!475238 (+!3204 (+!3204 lt!475232 lt!475230) lt!475241))))

(assert (=> b!1072322 (= lt!475241 (tuple2!16541 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072322 (= lt!475230 (tuple2!16541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!475242 () ListLongMap!14509)

(declare-fun getCurrentListMap!4164 (array!68713 array!68711 (_ BitVec 32) (_ BitVec 32) V!39629 V!39629 (_ BitVec 32) Int) ListLongMap!14509)

(assert (=> b!1072322 (= lt!475242 (getCurrentListMap!4164 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072322 (= lt!475239 (getCurrentListMap!4164 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072323 () Bool)

(assert (=> b!1072323 (= e!612454 (= lt!475242 (+!3204 lt!475236 lt!475241)))))

(declare-fun b!1072324 () Bool)

(declare-fun e!612456 () Bool)

(assert (=> b!1072324 (= e!612456 tp_is_empty!25871)))

(declare-fun b!1072325 () Bool)

(assert (=> b!1072325 (= e!612453 tp_is_empty!25871)))

(declare-fun b!1072326 () Bool)

(declare-fun res!715291 () Bool)

(assert (=> b!1072326 (=> (not res!715291) (not e!612458))))

(declare-datatypes ((List!23074 0))(
  ( (Nil!23071) (Cons!23070 (h!24279 (_ BitVec 64)) (t!32409 List!23074)) )
))
(declare-fun arrayNoDuplicates!0 (array!68713 (_ BitVec 32) List!23074) Bool)

(assert (=> b!1072326 (= res!715291 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23071))))

(declare-fun mapIsEmpty!40516 () Bool)

(assert (=> mapIsEmpty!40516 mapRes!40516))

(declare-fun b!1072327 () Bool)

(assert (=> b!1072327 (= e!612457 (and e!612456 mapRes!40516))))

(declare-fun condMapEmpty!40516 () Bool)

(declare-fun mapDefault!40516 () ValueCell!12232)

