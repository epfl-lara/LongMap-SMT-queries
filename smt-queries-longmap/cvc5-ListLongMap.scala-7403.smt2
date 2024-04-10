; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94210 () Bool)

(assert start!94210)

(declare-fun b_free!21595 () Bool)

(declare-fun b_next!21595 () Bool)

(assert (=> start!94210 (= b_free!21595 (not b_next!21595))))

(declare-fun tp!76223 () Bool)

(declare-fun b_and!34355 () Bool)

(assert (=> start!94210 (= tp!76223 b_and!34355)))

(declare-fun b!1065393 () Bool)

(declare-fun e!607354 () Bool)

(declare-fun tp_is_empty!25405 () Bool)

(assert (=> b!1065393 (= e!607354 tp_is_empty!25405)))

(declare-fun b!1065394 () Bool)

(declare-fun res!711156 () Bool)

(declare-fun e!607350 () Bool)

(assert (=> b!1065394 (=> (not res!711156) (not e!607350))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39009 0))(
  ( (V!39010 (val!12753 Int)) )
))
(declare-datatypes ((ValueCell!11999 0))(
  ( (ValueCellFull!11999 (v!15365 V!39009)) (EmptyCell!11999) )
))
(declare-datatypes ((array!67797 0))(
  ( (array!67798 (arr!32601 (Array (_ BitVec 32) ValueCell!11999)) (size!33137 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67797)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67799 0))(
  ( (array!67800 (arr!32602 (Array (_ BitVec 32) (_ BitVec 64))) (size!33138 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67799)

(assert (=> b!1065394 (= res!711156 (and (= (size!33137 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33138 _keys!1163) (size!33137 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065395 () Bool)

(declare-fun e!607351 () Bool)

(assert (=> b!1065395 (= e!607350 (not e!607351))))

(declare-fun res!711158 () Bool)

(assert (=> b!1065395 (=> res!711158 e!607351)))

(assert (=> b!1065395 (= res!711158 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16162 0))(
  ( (tuple2!16163 (_1!8092 (_ BitVec 64)) (_2!8092 V!39009)) )
))
(declare-datatypes ((List!22730 0))(
  ( (Nil!22727) (Cons!22726 (h!23935 tuple2!16162) (t!32049 List!22730)) )
))
(declare-datatypes ((ListLongMap!14131 0))(
  ( (ListLongMap!14132 (toList!7081 List!22730)) )
))
(declare-fun lt!469805 () ListLongMap!14131)

(declare-fun lt!469807 () ListLongMap!14131)

(assert (=> b!1065395 (= lt!469805 lt!469807)))

(declare-fun zeroValueBefore!47 () V!39009)

(declare-fun minValue!907 () V!39009)

(declare-datatypes ((Unit!34955 0))(
  ( (Unit!34956) )
))
(declare-fun lt!469804 () Unit!34955)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39009)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!706 (array!67799 array!67797 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39009 V!39009 V!39009 V!39009 (_ BitVec 32) Int) Unit!34955)

(assert (=> b!1065395 (= lt!469804 (lemmaNoChangeToArrayThenSameMapNoExtras!706 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3669 (array!67799 array!67797 (_ BitVec 32) (_ BitVec 32) V!39009 V!39009 (_ BitVec 32) Int) ListLongMap!14131)

(assert (=> b!1065395 (= lt!469807 (getCurrentListMapNoExtraKeys!3669 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065395 (= lt!469805 (getCurrentListMapNoExtraKeys!3669 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065396 () Bool)

(declare-fun res!711155 () Bool)

(assert (=> b!1065396 (=> (not res!711155) (not e!607350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67799 (_ BitVec 32)) Bool)

(assert (=> b!1065396 (= res!711155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!711159 () Bool)

(assert (=> start!94210 (=> (not res!711159) (not e!607350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94210 (= res!711159 (validMask!0 mask!1515))))

(assert (=> start!94210 e!607350))

(assert (=> start!94210 true))

(assert (=> start!94210 tp_is_empty!25405))

(declare-fun e!607355 () Bool)

(declare-fun array_inv!25244 (array!67797) Bool)

(assert (=> start!94210 (and (array_inv!25244 _values!955) e!607355)))

(assert (=> start!94210 tp!76223))

(declare-fun array_inv!25245 (array!67799) Bool)

(assert (=> start!94210 (array_inv!25245 _keys!1163)))

(declare-fun b!1065397 () Bool)

(declare-fun e!607353 () Bool)

(assert (=> b!1065397 (= e!607353 tp_is_empty!25405)))

(declare-fun mapIsEmpty!39793 () Bool)

(declare-fun mapRes!39793 () Bool)

(assert (=> mapIsEmpty!39793 mapRes!39793))

(declare-fun b!1065398 () Bool)

(declare-fun res!711157 () Bool)

(assert (=> b!1065398 (=> (not res!711157) (not e!607350))))

(declare-datatypes ((List!22731 0))(
  ( (Nil!22728) (Cons!22727 (h!23936 (_ BitVec 64)) (t!32050 List!22731)) )
))
(declare-fun arrayNoDuplicates!0 (array!67799 (_ BitVec 32) List!22731) Bool)

(assert (=> b!1065398 (= res!711157 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22728))))

(declare-fun b!1065399 () Bool)

(assert (=> b!1065399 (= e!607351 true)))

(declare-fun lt!469808 () ListLongMap!14131)

(declare-fun lt!469803 () ListLongMap!14131)

(declare-fun -!596 (ListLongMap!14131 (_ BitVec 64)) ListLongMap!14131)

(assert (=> b!1065399 (= lt!469808 (-!596 lt!469803 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469802 () ListLongMap!14131)

(assert (=> b!1065399 (= (-!596 lt!469802 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469805)))

(declare-fun lt!469806 () Unit!34955)

(declare-fun addThenRemoveForNewKeyIsSame!5 (ListLongMap!14131 (_ BitVec 64) V!39009) Unit!34955)

(assert (=> b!1065399 (= lt!469806 (addThenRemoveForNewKeyIsSame!5 lt!469805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469809 () ListLongMap!14131)

(assert (=> b!1065399 (and (= lt!469803 lt!469802) (= lt!469809 lt!469807))))

(declare-fun +!3127 (ListLongMap!14131 tuple2!16162) ListLongMap!14131)

(assert (=> b!1065399 (= lt!469802 (+!3127 lt!469805 (tuple2!16163 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4040 (array!67799 array!67797 (_ BitVec 32) (_ BitVec 32) V!39009 V!39009 (_ BitVec 32) Int) ListLongMap!14131)

(assert (=> b!1065399 (= lt!469809 (getCurrentListMap!4040 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065399 (= lt!469803 (getCurrentListMap!4040 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39793 () Bool)

(declare-fun tp!76222 () Bool)

(assert (=> mapNonEmpty!39793 (= mapRes!39793 (and tp!76222 e!607354))))

(declare-fun mapRest!39793 () (Array (_ BitVec 32) ValueCell!11999))

(declare-fun mapValue!39793 () ValueCell!11999)

(declare-fun mapKey!39793 () (_ BitVec 32))

(assert (=> mapNonEmpty!39793 (= (arr!32601 _values!955) (store mapRest!39793 mapKey!39793 mapValue!39793))))

(declare-fun b!1065400 () Bool)

(assert (=> b!1065400 (= e!607355 (and e!607353 mapRes!39793))))

(declare-fun condMapEmpty!39793 () Bool)

(declare-fun mapDefault!39793 () ValueCell!11999)

