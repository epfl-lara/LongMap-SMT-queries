; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94494 () Bool)

(assert start!94494)

(declare-fun b_free!21805 () Bool)

(declare-fun b_next!21805 () Bool)

(assert (=> start!94494 (= b_free!21805 (not b_next!21805))))

(declare-fun tp!76864 () Bool)

(declare-fun b_and!34581 () Bool)

(assert (=> start!94494 (= tp!76864 b_and!34581)))

(declare-fun b!1068372 () Bool)

(declare-fun res!712922 () Bool)

(declare-fun e!609545 () Bool)

(assert (=> b!1068372 (=> (not res!712922) (not e!609545))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39289 0))(
  ( (V!39290 (val!12858 Int)) )
))
(declare-datatypes ((ValueCell!12104 0))(
  ( (ValueCellFull!12104 (v!15472 V!39289)) (EmptyCell!12104) )
))
(declare-datatypes ((array!68154 0))(
  ( (array!68155 (arr!32776 (Array (_ BitVec 32) ValueCell!12104)) (size!33314 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68154)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68156 0))(
  ( (array!68157 (arr!32777 (Array (_ BitVec 32) (_ BitVec 64))) (size!33315 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68156)

(assert (=> b!1068372 (= res!712922 (and (= (size!33314 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33315 _keys!1163) (size!33314 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068373 () Bool)

(declare-fun e!609543 () Bool)

(assert (=> b!1068373 (= e!609543 true)))

(declare-datatypes ((tuple2!16384 0))(
  ( (tuple2!16385 (_1!8203 (_ BitVec 64)) (_2!8203 V!39289)) )
))
(declare-datatypes ((List!22922 0))(
  ( (Nil!22919) (Cons!22918 (h!24127 tuple2!16384) (t!32240 List!22922)) )
))
(declare-datatypes ((ListLongMap!14353 0))(
  ( (ListLongMap!14354 (toList!7192 List!22922)) )
))
(declare-fun lt!471875 () ListLongMap!14353)

(declare-fun -!637 (ListLongMap!14353 (_ BitVec 64)) ListLongMap!14353)

(assert (=> b!1068373 (= (-!637 lt!471875 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471875)))

(declare-datatypes ((Unit!34974 0))(
  ( (Unit!34975) )
))
(declare-fun lt!471876 () Unit!34974)

(declare-fun removeNotPresentStillSame!54 (ListLongMap!14353 (_ BitVec 64)) Unit!34974)

(assert (=> b!1068373 (= lt!471876 (removeNotPresentStillSame!54 lt!471875 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!712921 () Bool)

(assert (=> start!94494 (=> (not res!712921) (not e!609545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94494 (= res!712921 (validMask!0 mask!1515))))

(assert (=> start!94494 e!609545))

(assert (=> start!94494 true))

(declare-fun tp_is_empty!25615 () Bool)

(assert (=> start!94494 tp_is_empty!25615))

(declare-fun e!609548 () Bool)

(declare-fun array_inv!25372 (array!68154) Bool)

(assert (=> start!94494 (and (array_inv!25372 _values!955) e!609548)))

(assert (=> start!94494 tp!76864))

(declare-fun array_inv!25373 (array!68156) Bool)

(assert (=> start!94494 (array_inv!25373 _keys!1163)))

(declare-fun b!1068374 () Bool)

(declare-fun e!609544 () Bool)

(declare-fun mapRes!40120 () Bool)

(assert (=> b!1068374 (= e!609548 (and e!609544 mapRes!40120))))

(declare-fun condMapEmpty!40120 () Bool)

(declare-fun mapDefault!40120 () ValueCell!12104)

(assert (=> b!1068374 (= condMapEmpty!40120 (= (arr!32776 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12104)) mapDefault!40120)))))

(declare-fun b!1068375 () Bool)

(declare-fun e!609547 () Bool)

(assert (=> b!1068375 (= e!609545 (not e!609547))))

(declare-fun res!712920 () Bool)

(assert (=> b!1068375 (=> res!712920 e!609547)))

(assert (=> b!1068375 (= res!712920 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471872 () ListLongMap!14353)

(declare-fun lt!471873 () ListLongMap!14353)

(assert (=> b!1068375 (= lt!471872 lt!471873)))

(declare-fun zeroValueBefore!47 () V!39289)

(declare-fun minValue!907 () V!39289)

(declare-fun lt!471874 () Unit!34974)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39289)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!778 (array!68156 array!68154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39289 V!39289 V!39289 V!39289 (_ BitVec 32) Int) Unit!34974)

(assert (=> b!1068375 (= lt!471874 (lemmaNoChangeToArrayThenSameMapNoExtras!778 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3784 (array!68156 array!68154 (_ BitVec 32) (_ BitVec 32) V!39289 V!39289 (_ BitVec 32) Int) ListLongMap!14353)

(assert (=> b!1068375 (= lt!471873 (getCurrentListMapNoExtraKeys!3784 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068375 (= lt!471872 (getCurrentListMapNoExtraKeys!3784 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068376 () Bool)

(assert (=> b!1068376 (= e!609544 tp_is_empty!25615)))

(declare-fun b!1068377 () Bool)

(assert (=> b!1068377 (= e!609547 e!609543)))

(declare-fun res!712919 () Bool)

(assert (=> b!1068377 (=> res!712919 e!609543)))

(declare-fun contains!6266 (ListLongMap!14353 (_ BitVec 64)) Bool)

(assert (=> b!1068377 (= res!712919 (contains!6266 lt!471875 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4034 (array!68156 array!68154 (_ BitVec 32) (_ BitVec 32) V!39289 V!39289 (_ BitVec 32) Int) ListLongMap!14353)

(assert (=> b!1068377 (= lt!471875 (getCurrentListMap!4034 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068378 () Bool)

(declare-fun e!609542 () Bool)

(assert (=> b!1068378 (= e!609542 tp_is_empty!25615)))

(declare-fun b!1068379 () Bool)

(declare-fun res!712923 () Bool)

(assert (=> b!1068379 (=> (not res!712923) (not e!609545))))

(declare-datatypes ((List!22923 0))(
  ( (Nil!22920) (Cons!22919 (h!24128 (_ BitVec 64)) (t!32241 List!22923)) )
))
(declare-fun arrayNoDuplicates!0 (array!68156 (_ BitVec 32) List!22923) Bool)

(assert (=> b!1068379 (= res!712923 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22920))))

(declare-fun mapIsEmpty!40120 () Bool)

(assert (=> mapIsEmpty!40120 mapRes!40120))

(declare-fun mapNonEmpty!40120 () Bool)

(declare-fun tp!76865 () Bool)

(assert (=> mapNonEmpty!40120 (= mapRes!40120 (and tp!76865 e!609542))))

(declare-fun mapRest!40120 () (Array (_ BitVec 32) ValueCell!12104))

(declare-fun mapKey!40120 () (_ BitVec 32))

(declare-fun mapValue!40120 () ValueCell!12104)

(assert (=> mapNonEmpty!40120 (= (arr!32776 _values!955) (store mapRest!40120 mapKey!40120 mapValue!40120))))

(declare-fun b!1068380 () Bool)

(declare-fun res!712924 () Bool)

(assert (=> b!1068380 (=> (not res!712924) (not e!609545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68156 (_ BitVec 32)) Bool)

(assert (=> b!1068380 (= res!712924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94494 res!712921) b!1068372))

(assert (= (and b!1068372 res!712922) b!1068380))

(assert (= (and b!1068380 res!712924) b!1068379))

(assert (= (and b!1068379 res!712923) b!1068375))

(assert (= (and b!1068375 (not res!712920)) b!1068377))

(assert (= (and b!1068377 (not res!712919)) b!1068373))

(assert (= (and b!1068374 condMapEmpty!40120) mapIsEmpty!40120))

(assert (= (and b!1068374 (not condMapEmpty!40120)) mapNonEmpty!40120))

(get-info :version)

(assert (= (and mapNonEmpty!40120 ((_ is ValueCellFull!12104) mapValue!40120)) b!1068378))

(assert (= (and b!1068374 ((_ is ValueCellFull!12104) mapDefault!40120)) b!1068376))

(assert (= start!94494 b!1068374))

(declare-fun m!986467 () Bool)

(assert (=> b!1068377 m!986467))

(declare-fun m!986469 () Bool)

(assert (=> b!1068377 m!986469))

(declare-fun m!986471 () Bool)

(assert (=> b!1068375 m!986471))

(declare-fun m!986473 () Bool)

(assert (=> b!1068375 m!986473))

(declare-fun m!986475 () Bool)

(assert (=> b!1068375 m!986475))

(declare-fun m!986477 () Bool)

(assert (=> b!1068380 m!986477))

(declare-fun m!986479 () Bool)

(assert (=> b!1068373 m!986479))

(declare-fun m!986481 () Bool)

(assert (=> b!1068373 m!986481))

(declare-fun m!986483 () Bool)

(assert (=> b!1068379 m!986483))

(declare-fun m!986485 () Bool)

(assert (=> mapNonEmpty!40120 m!986485))

(declare-fun m!986487 () Bool)

(assert (=> start!94494 m!986487))

(declare-fun m!986489 () Bool)

(assert (=> start!94494 m!986489))

(declare-fun m!986491 () Bool)

(assert (=> start!94494 m!986491))

(check-sat (not b!1068375) tp_is_empty!25615 (not b!1068373) b_and!34581 (not start!94494) (not b!1068380) (not mapNonEmpty!40120) (not b!1068377) (not b!1068379) (not b_next!21805))
(check-sat b_and!34581 (not b_next!21805))
