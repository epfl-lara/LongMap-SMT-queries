; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94680 () Bool)

(assert start!94680)

(declare-fun b_free!21955 () Bool)

(declare-fun b_next!21955 () Bool)

(assert (=> start!94680 (= b_free!21955 (not b_next!21955))))

(declare-fun tp!77321 () Bool)

(declare-fun b_and!34749 () Bool)

(assert (=> start!94680 (= tp!77321 b_and!34749)))

(declare-fun b!1070412 () Bool)

(declare-fun e!611048 () Bool)

(declare-fun tp_is_empty!25765 () Bool)

(assert (=> b!1070412 (= e!611048 tp_is_empty!25765)))

(declare-fun b!1070413 () Bool)

(declare-fun res!714138 () Bool)

(declare-fun e!611050 () Bool)

(assert (=> b!1070413 (=> (not res!714138) (not e!611050))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39489 0))(
  ( (V!39490 (val!12933 Int)) )
))
(declare-datatypes ((ValueCell!12179 0))(
  ( (ValueCellFull!12179 (v!15548 V!39489)) (EmptyCell!12179) )
))
(declare-datatypes ((array!68442 0))(
  ( (array!68443 (arr!32918 (Array (_ BitVec 32) ValueCell!12179)) (size!33456 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68442)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68444 0))(
  ( (array!68445 (arr!32919 (Array (_ BitVec 32) (_ BitVec 64))) (size!33457 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68444)

(assert (=> b!1070413 (= res!714138 (and (= (size!33456 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33457 _keys!1163) (size!33456 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070414 () Bool)

(declare-fun res!714134 () Bool)

(assert (=> b!1070414 (=> (not res!714134) (not e!611050))))

(declare-datatypes ((List!23027 0))(
  ( (Nil!23024) (Cons!23023 (h!24232 (_ BitVec 64)) (t!32349 List!23027)) )
))
(declare-fun arrayNoDuplicates!0 (array!68444 (_ BitVec 32) List!23027) Bool)

(assert (=> b!1070414 (= res!714134 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23024))))

(declare-fun b!1070415 () Bool)

(declare-fun e!611049 () Bool)

(assert (=> b!1070415 (= e!611049 true)))

(declare-fun zeroValueBefore!47 () V!39489)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39489)

(declare-datatypes ((tuple2!16498 0))(
  ( (tuple2!16499 (_1!8260 (_ BitVec 64)) (_2!8260 V!39489)) )
))
(declare-datatypes ((List!23028 0))(
  ( (Nil!23025) (Cons!23024 (h!24233 tuple2!16498) (t!32350 List!23028)) )
))
(declare-datatypes ((ListLongMap!14467 0))(
  ( (ListLongMap!14468 (toList!7249 List!23028)) )
))
(declare-fun lt!472934 () ListLongMap!14467)

(declare-fun getCurrentListMap!4063 (array!68444 array!68442 (_ BitVec 32) (_ BitVec 32) V!39489 V!39489 (_ BitVec 32) Int) ListLongMap!14467)

(assert (=> b!1070415 (= lt!472934 (getCurrentListMap!4063 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070416 () Bool)

(declare-fun e!611045 () Bool)

(declare-fun e!611047 () Bool)

(declare-fun mapRes!40351 () Bool)

(assert (=> b!1070416 (= e!611045 (and e!611047 mapRes!40351))))

(declare-fun condMapEmpty!40351 () Bool)

(declare-fun mapDefault!40351 () ValueCell!12179)

(assert (=> b!1070416 (= condMapEmpty!40351 (= (arr!32918 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12179)) mapDefault!40351)))))

(declare-fun b!1070417 () Bool)

(assert (=> b!1070417 (= e!611047 tp_is_empty!25765)))

(declare-fun res!714137 () Bool)

(assert (=> start!94680 (=> (not res!714137) (not e!611050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94680 (= res!714137 (validMask!0 mask!1515))))

(assert (=> start!94680 e!611050))

(assert (=> start!94680 true))

(assert (=> start!94680 tp_is_empty!25765))

(declare-fun array_inv!25468 (array!68442) Bool)

(assert (=> start!94680 (and (array_inv!25468 _values!955) e!611045)))

(assert (=> start!94680 tp!77321))

(declare-fun array_inv!25469 (array!68444) Bool)

(assert (=> start!94680 (array_inv!25469 _keys!1163)))

(declare-fun b!1070418 () Bool)

(assert (=> b!1070418 (= e!611050 (not e!611049))))

(declare-fun res!714136 () Bool)

(assert (=> b!1070418 (=> res!714136 e!611049)))

(assert (=> b!1070418 (= res!714136 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!472935 () ListLongMap!14467)

(declare-fun lt!472936 () ListLongMap!14467)

(assert (=> b!1070418 (= lt!472935 lt!472936)))

(declare-fun zeroValueAfter!47 () V!39489)

(declare-datatypes ((Unit!35082 0))(
  ( (Unit!35083) )
))
(declare-fun lt!472937 () Unit!35082)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!830 (array!68444 array!68442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39489 V!39489 V!39489 V!39489 (_ BitVec 32) Int) Unit!35082)

(assert (=> b!1070418 (= lt!472937 (lemmaNoChangeToArrayThenSameMapNoExtras!830 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3836 (array!68444 array!68442 (_ BitVec 32) (_ BitVec 32) V!39489 V!39489 (_ BitVec 32) Int) ListLongMap!14467)

(assert (=> b!1070418 (= lt!472936 (getCurrentListMapNoExtraKeys!3836 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070418 (= lt!472935 (getCurrentListMapNoExtraKeys!3836 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40351 () Bool)

(assert (=> mapIsEmpty!40351 mapRes!40351))

(declare-fun mapNonEmpty!40351 () Bool)

(declare-fun tp!77320 () Bool)

(assert (=> mapNonEmpty!40351 (= mapRes!40351 (and tp!77320 e!611048))))

(declare-fun mapRest!40351 () (Array (_ BitVec 32) ValueCell!12179))

(declare-fun mapValue!40351 () ValueCell!12179)

(declare-fun mapKey!40351 () (_ BitVec 32))

(assert (=> mapNonEmpty!40351 (= (arr!32918 _values!955) (store mapRest!40351 mapKey!40351 mapValue!40351))))

(declare-fun b!1070419 () Bool)

(declare-fun res!714135 () Bool)

(assert (=> b!1070419 (=> (not res!714135) (not e!611050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68444 (_ BitVec 32)) Bool)

(assert (=> b!1070419 (= res!714135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94680 res!714137) b!1070413))

(assert (= (and b!1070413 res!714138) b!1070419))

(assert (= (and b!1070419 res!714135) b!1070414))

(assert (= (and b!1070414 res!714134) b!1070418))

(assert (= (and b!1070418 (not res!714136)) b!1070415))

(assert (= (and b!1070416 condMapEmpty!40351) mapIsEmpty!40351))

(assert (= (and b!1070416 (not condMapEmpty!40351)) mapNonEmpty!40351))

(get-info :version)

(assert (= (and mapNonEmpty!40351 ((_ is ValueCellFull!12179) mapValue!40351)) b!1070412))

(assert (= (and b!1070416 ((_ is ValueCellFull!12179) mapDefault!40351)) b!1070417))

(assert (= start!94680 b!1070416))

(declare-fun m!988267 () Bool)

(assert (=> b!1070418 m!988267))

(declare-fun m!988269 () Bool)

(assert (=> b!1070418 m!988269))

(declare-fun m!988271 () Bool)

(assert (=> b!1070418 m!988271))

(declare-fun m!988273 () Bool)

(assert (=> b!1070414 m!988273))

(declare-fun m!988275 () Bool)

(assert (=> b!1070419 m!988275))

(declare-fun m!988277 () Bool)

(assert (=> mapNonEmpty!40351 m!988277))

(declare-fun m!988279 () Bool)

(assert (=> start!94680 m!988279))

(declare-fun m!988281 () Bool)

(assert (=> start!94680 m!988281))

(declare-fun m!988283 () Bool)

(assert (=> start!94680 m!988283))

(declare-fun m!988285 () Bool)

(assert (=> b!1070415 m!988285))

(check-sat (not mapNonEmpty!40351) tp_is_empty!25765 b_and!34749 (not start!94680) (not b!1070419) (not b!1070415) (not b!1070418) (not b_next!21955) (not b!1070414))
(check-sat b_and!34749 (not b_next!21955))
