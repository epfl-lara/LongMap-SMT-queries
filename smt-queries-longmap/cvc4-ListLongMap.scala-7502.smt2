; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95096 () Bool)

(assert start!95096)

(declare-fun b_free!22193 () Bool)

(declare-fun b_next!22193 () Bool)

(assert (=> start!95096 (= b_free!22193 (not b_next!22193))))

(declare-fun tp!78061 () Bool)

(declare-fun b_and!35113 () Bool)

(assert (=> start!95096 (= tp!78061 b_and!35113)))

(declare-fun b!1075015 () Bool)

(declare-fun e!614334 () Bool)

(declare-fun tp_is_empty!26003 () Bool)

(assert (=> b!1075015 (= e!614334 tp_is_empty!26003)))

(declare-fun b!1075016 () Bool)

(declare-fun e!614335 () Bool)

(declare-fun e!614337 () Bool)

(assert (=> b!1075016 (= e!614335 (not e!614337))))

(declare-fun res!716718 () Bool)

(assert (=> b!1075016 (=> res!716718 e!614337)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1075016 (= res!716718 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39805 0))(
  ( (V!39806 (val!13052 Int)) )
))
(declare-datatypes ((tuple2!16630 0))(
  ( (tuple2!16631 (_1!8326 (_ BitVec 64)) (_2!8326 V!39805)) )
))
(declare-datatypes ((List!23165 0))(
  ( (Nil!23162) (Cons!23161 (h!24370 tuple2!16630) (t!32514 List!23165)) )
))
(declare-datatypes ((ListLongMap!14599 0))(
  ( (ListLongMap!14600 (toList!7315 List!23165)) )
))
(declare-fun lt!477073 () ListLongMap!14599)

(declare-fun lt!477074 () ListLongMap!14599)

(assert (=> b!1075016 (= lt!477073 lt!477074)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39805)

(declare-datatypes ((ValueCell!12298 0))(
  ( (ValueCellFull!12298 (v!15675 V!39805)) (EmptyCell!12298) )
))
(declare-datatypes ((array!68975 0))(
  ( (array!68976 (arr!33175 (Array (_ BitVec 32) ValueCell!12298)) (size!33711 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68975)

(declare-fun minValue!907 () V!39805)

(declare-datatypes ((Unit!35398 0))(
  ( (Unit!35399) )
))
(declare-fun lt!477071 () Unit!35398)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39805)

(declare-datatypes ((array!68977 0))(
  ( (array!68978 (arr!33176 (Array (_ BitVec 32) (_ BitVec 64))) (size!33712 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68977)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!894 (array!68977 array!68975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39805 V!39805 V!39805 V!39805 (_ BitVec 32) Int) Unit!35398)

(assert (=> b!1075016 (= lt!477071 (lemmaNoChangeToArrayThenSameMapNoExtras!894 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3878 (array!68977 array!68975 (_ BitVec 32) (_ BitVec 32) V!39805 V!39805 (_ BitVec 32) Int) ListLongMap!14599)

(assert (=> b!1075016 (= lt!477074 (getCurrentListMapNoExtraKeys!3878 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075016 (= lt!477073 (getCurrentListMapNoExtraKeys!3878 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40735 () Bool)

(declare-fun mapRes!40735 () Bool)

(assert (=> mapIsEmpty!40735 mapRes!40735))

(declare-fun b!1075017 () Bool)

(declare-fun e!614336 () Bool)

(assert (=> b!1075017 (= e!614336 tp_is_empty!26003)))

(declare-fun mapNonEmpty!40735 () Bool)

(declare-fun tp!78062 () Bool)

(assert (=> mapNonEmpty!40735 (= mapRes!40735 (and tp!78062 e!614336))))

(declare-fun mapValue!40735 () ValueCell!12298)

(declare-fun mapRest!40735 () (Array (_ BitVec 32) ValueCell!12298))

(declare-fun mapKey!40735 () (_ BitVec 32))

(assert (=> mapNonEmpty!40735 (= (arr!33175 _values!955) (store mapRest!40735 mapKey!40735 mapValue!40735))))

(declare-fun b!1075018 () Bool)

(declare-fun lt!477075 () ListLongMap!14599)

(declare-fun lt!477077 () ListLongMap!14599)

(declare-fun -!711 (ListLongMap!14599 (_ BitVec 64)) ListLongMap!14599)

(assert (=> b!1075018 (= e!614337 (= (-!711 lt!477075 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477077))))

(declare-fun lt!477072 () ListLongMap!14599)

(assert (=> b!1075018 (= (-!711 lt!477072 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477073)))

(declare-fun lt!477076 () Unit!35398)

(declare-fun addThenRemoveForNewKeyIsSame!78 (ListLongMap!14599 (_ BitVec 64) V!39805) Unit!35398)

(assert (=> b!1075018 (= lt!477076 (addThenRemoveForNewKeyIsSame!78 lt!477073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1075018 (and (= lt!477075 lt!477072) (= lt!477077 lt!477074))))

(declare-fun +!3223 (ListLongMap!14599 tuple2!16630) ListLongMap!14599)

(assert (=> b!1075018 (= lt!477072 (+!3223 lt!477073 (tuple2!16631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4184 (array!68977 array!68975 (_ BitVec 32) (_ BitVec 32) V!39805 V!39805 (_ BitVec 32) Int) ListLongMap!14599)

(assert (=> b!1075018 (= lt!477077 (getCurrentListMap!4184 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075018 (= lt!477075 (getCurrentListMap!4184 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075020 () Bool)

(declare-fun res!716722 () Bool)

(assert (=> b!1075020 (=> (not res!716722) (not e!614335))))

(assert (=> b!1075020 (= res!716722 (and (= (size!33711 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33712 _keys!1163) (size!33711 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075021 () Bool)

(declare-fun res!716719 () Bool)

(assert (=> b!1075021 (=> (not res!716719) (not e!614335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68977 (_ BitVec 32)) Bool)

(assert (=> b!1075021 (= res!716719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1075022 () Bool)

(declare-fun e!614332 () Bool)

(assert (=> b!1075022 (= e!614332 (and e!614334 mapRes!40735))))

(declare-fun condMapEmpty!40735 () Bool)

(declare-fun mapDefault!40735 () ValueCell!12298)

