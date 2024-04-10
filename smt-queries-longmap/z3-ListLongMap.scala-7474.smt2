; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94770 () Bool)

(assert start!94770)

(declare-fun b_free!22023 () Bool)

(declare-fun b_next!22023 () Bool)

(assert (=> start!94770 (= b_free!22023 (not b_next!22023))))

(declare-fun tp!77528 () Bool)

(declare-fun b_and!34853 () Bool)

(assert (=> start!94770 (= tp!77528 b_and!34853)))

(declare-fun mapNonEmpty!40456 () Bool)

(declare-fun mapRes!40456 () Bool)

(declare-fun tp!77527 () Bool)

(declare-fun e!611934 () Bool)

(assert (=> mapNonEmpty!40456 (= mapRes!40456 (and tp!77527 e!611934))))

(declare-datatypes ((V!39579 0))(
  ( (V!39580 (val!12967 Int)) )
))
(declare-datatypes ((ValueCell!12213 0))(
  ( (ValueCellFull!12213 (v!15583 V!39579)) (EmptyCell!12213) )
))
(declare-fun mapRest!40456 () (Array (_ BitVec 32) ValueCell!12213))

(declare-datatypes ((array!68637 0))(
  ( (array!68638 (arr!33014 (Array (_ BitVec 32) ValueCell!12213)) (size!33550 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68637)

(declare-fun mapKey!40456 () (_ BitVec 32))

(declare-fun mapValue!40456 () ValueCell!12213)

(assert (=> mapNonEmpty!40456 (= (arr!33014 _values!955) (store mapRest!40456 mapKey!40456 mapValue!40456))))

(declare-fun b!1071615 () Bool)

(declare-fun res!714862 () Bool)

(declare-fun e!611936 () Bool)

(assert (=> b!1071615 (=> (not res!714862) (not e!611936))))

(declare-datatypes ((array!68639 0))(
  ( (array!68640 (arr!33015 (Array (_ BitVec 32) (_ BitVec 64))) (size!33551 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68639)

(declare-datatypes ((List!23046 0))(
  ( (Nil!23043) (Cons!23042 (h!24251 (_ BitVec 64)) (t!32379 List!23046)) )
))
(declare-fun arrayNoDuplicates!0 (array!68639 (_ BitVec 32) List!23046) Bool)

(assert (=> b!1071615 (= res!714862 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23043))))

(declare-fun b!1071616 () Bool)

(declare-fun e!611932 () Bool)

(assert (=> b!1071616 (= e!611936 (not e!611932))))

(declare-fun res!714857 () Bool)

(assert (=> b!1071616 (=> res!714857 e!611932)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071616 (= res!714857 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16508 0))(
  ( (tuple2!16509 (_1!8265 (_ BitVec 64)) (_2!8265 V!39579)) )
))
(declare-datatypes ((List!23047 0))(
  ( (Nil!23044) (Cons!23043 (h!24252 tuple2!16508) (t!32380 List!23047)) )
))
(declare-datatypes ((ListLongMap!14477 0))(
  ( (ListLongMap!14478 (toList!7254 List!23047)) )
))
(declare-fun lt!474338 () ListLongMap!14477)

(declare-fun lt!474343 () ListLongMap!14477)

(assert (=> b!1071616 (= lt!474338 lt!474343)))

(declare-fun zeroValueBefore!47 () V!39579)

(declare-datatypes ((Unit!35302 0))(
  ( (Unit!35303) )
))
(declare-fun lt!474342 () Unit!35302)

(declare-fun minValue!907 () V!39579)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39579)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!859 (array!68639 array!68637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39579 V!39579 V!39579 V!39579 (_ BitVec 32) Int) Unit!35302)

(assert (=> b!1071616 (= lt!474342 (lemmaNoChangeToArrayThenSameMapNoExtras!859 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3822 (array!68639 array!68637 (_ BitVec 32) (_ BitVec 32) V!39579 V!39579 (_ BitVec 32) Int) ListLongMap!14477)

(assert (=> b!1071616 (= lt!474343 (getCurrentListMapNoExtraKeys!3822 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071616 (= lt!474338 (getCurrentListMapNoExtraKeys!3822 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071617 () Bool)

(declare-fun tp_is_empty!25833 () Bool)

(assert (=> b!1071617 (= e!611934 tp_is_empty!25833)))

(declare-fun b!1071618 () Bool)

(declare-fun e!611935 () Bool)

(assert (=> b!1071618 (= e!611935 tp_is_empty!25833)))

(declare-fun mapIsEmpty!40456 () Bool)

(assert (=> mapIsEmpty!40456 mapRes!40456))

(declare-fun b!1071620 () Bool)

(declare-fun res!714860 () Bool)

(assert (=> b!1071620 (=> (not res!714860) (not e!611936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68639 (_ BitVec 32)) Bool)

(assert (=> b!1071620 (= res!714860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071621 () Bool)

(assert (=> b!1071621 (= e!611932 true)))

(declare-fun lt!474340 () ListLongMap!14477)

(declare-fun lt!474332 () ListLongMap!14477)

(declare-fun -!686 (ListLongMap!14477 (_ BitVec 64)) ListLongMap!14477)

(assert (=> b!1071621 (= lt!474340 (-!686 lt!474332 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474344 () ListLongMap!14477)

(declare-fun lt!474336 () ListLongMap!14477)

(assert (=> b!1071621 (= lt!474344 lt!474336)))

(declare-fun lt!474333 () Unit!35302)

(declare-fun addCommutativeForDiffKeys!731 (ListLongMap!14477 (_ BitVec 64) V!39579 (_ BitVec 64) V!39579) Unit!35302)

(assert (=> b!1071621 (= lt!474333 (addCommutativeForDiffKeys!731 lt!474338 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474339 () ListLongMap!14477)

(assert (=> b!1071621 (= (-!686 lt!474336 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474339)))

(declare-fun lt!474335 () tuple2!16508)

(declare-fun +!3189 (ListLongMap!14477 tuple2!16508) ListLongMap!14477)

(assert (=> b!1071621 (= lt!474336 (+!3189 lt!474339 lt!474335))))

(declare-fun lt!474337 () Unit!35302)

(declare-fun addThenRemoveForNewKeyIsSame!56 (ListLongMap!14477 (_ BitVec 64) V!39579) Unit!35302)

(assert (=> b!1071621 (= lt!474337 (addThenRemoveForNewKeyIsSame!56 lt!474339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474341 () tuple2!16508)

(assert (=> b!1071621 (= lt!474339 (+!3189 lt!474338 lt!474341))))

(declare-fun e!611931 () Bool)

(assert (=> b!1071621 e!611931))

(declare-fun res!714859 () Bool)

(assert (=> b!1071621 (=> (not res!714859) (not e!611931))))

(assert (=> b!1071621 (= res!714859 (= lt!474332 lt!474344))))

(assert (=> b!1071621 (= lt!474344 (+!3189 (+!3189 lt!474338 lt!474335) lt!474341))))

(assert (=> b!1071621 (= lt!474341 (tuple2!16509 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071621 (= lt!474335 (tuple2!16509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474334 () ListLongMap!14477)

(declare-fun getCurrentListMap!4152 (array!68639 array!68637 (_ BitVec 32) (_ BitVec 32) V!39579 V!39579 (_ BitVec 32) Int) ListLongMap!14477)

(assert (=> b!1071621 (= lt!474334 (getCurrentListMap!4152 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071621 (= lt!474332 (getCurrentListMap!4152 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071622 () Bool)

(declare-fun e!611933 () Bool)

(assert (=> b!1071622 (= e!611933 (and e!611935 mapRes!40456))))

(declare-fun condMapEmpty!40456 () Bool)

(declare-fun mapDefault!40456 () ValueCell!12213)

(assert (=> b!1071622 (= condMapEmpty!40456 (= (arr!33014 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12213)) mapDefault!40456)))))

(declare-fun b!1071623 () Bool)

(assert (=> b!1071623 (= e!611931 (= lt!474334 (+!3189 lt!474343 lt!474341)))))

(declare-fun res!714858 () Bool)

(assert (=> start!94770 (=> (not res!714858) (not e!611936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94770 (= res!714858 (validMask!0 mask!1515))))

(assert (=> start!94770 e!611936))

(assert (=> start!94770 true))

(assert (=> start!94770 tp_is_empty!25833))

(declare-fun array_inv!25528 (array!68637) Bool)

(assert (=> start!94770 (and (array_inv!25528 _values!955) e!611933)))

(assert (=> start!94770 tp!77528))

(declare-fun array_inv!25529 (array!68639) Bool)

(assert (=> start!94770 (array_inv!25529 _keys!1163)))

(declare-fun b!1071619 () Bool)

(declare-fun res!714861 () Bool)

(assert (=> b!1071619 (=> (not res!714861) (not e!611936))))

(assert (=> b!1071619 (= res!714861 (and (= (size!33550 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33551 _keys!1163) (size!33550 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94770 res!714858) b!1071619))

(assert (= (and b!1071619 res!714861) b!1071620))

(assert (= (and b!1071620 res!714860) b!1071615))

(assert (= (and b!1071615 res!714862) b!1071616))

(assert (= (and b!1071616 (not res!714857)) b!1071621))

(assert (= (and b!1071621 res!714859) b!1071623))

(assert (= (and b!1071622 condMapEmpty!40456) mapIsEmpty!40456))

(assert (= (and b!1071622 (not condMapEmpty!40456)) mapNonEmpty!40456))

(get-info :version)

(assert (= (and mapNonEmpty!40456 ((_ is ValueCellFull!12213) mapValue!40456)) b!1071617))

(assert (= (and b!1071622 ((_ is ValueCellFull!12213) mapDefault!40456)) b!1071618))

(assert (= start!94770 b!1071622))

(declare-fun m!990209 () Bool)

(assert (=> b!1071620 m!990209))

(declare-fun m!990211 () Bool)

(assert (=> b!1071621 m!990211))

(declare-fun m!990213 () Bool)

(assert (=> b!1071621 m!990213))

(declare-fun m!990215 () Bool)

(assert (=> b!1071621 m!990215))

(declare-fun m!990217 () Bool)

(assert (=> b!1071621 m!990217))

(declare-fun m!990219 () Bool)

(assert (=> b!1071621 m!990219))

(declare-fun m!990221 () Bool)

(assert (=> b!1071621 m!990221))

(declare-fun m!990223 () Bool)

(assert (=> b!1071621 m!990223))

(assert (=> b!1071621 m!990215))

(declare-fun m!990225 () Bool)

(assert (=> b!1071621 m!990225))

(declare-fun m!990227 () Bool)

(assert (=> b!1071621 m!990227))

(declare-fun m!990229 () Bool)

(assert (=> b!1071621 m!990229))

(declare-fun m!990231 () Bool)

(assert (=> start!94770 m!990231))

(declare-fun m!990233 () Bool)

(assert (=> start!94770 m!990233))

(declare-fun m!990235 () Bool)

(assert (=> start!94770 m!990235))

(declare-fun m!990237 () Bool)

(assert (=> b!1071615 m!990237))

(declare-fun m!990239 () Bool)

(assert (=> mapNonEmpty!40456 m!990239))

(declare-fun m!990241 () Bool)

(assert (=> b!1071616 m!990241))

(declare-fun m!990243 () Bool)

(assert (=> b!1071616 m!990243))

(declare-fun m!990245 () Bool)

(assert (=> b!1071616 m!990245))

(declare-fun m!990247 () Bool)

(assert (=> b!1071623 m!990247))

(check-sat (not b!1071615) (not b!1071620) b_and!34853 (not b_next!22023) (not b!1071623) (not b!1071616) (not b!1071621) (not start!94770) tp_is_empty!25833 (not mapNonEmpty!40456))
(check-sat b_and!34853 (not b_next!22023))
