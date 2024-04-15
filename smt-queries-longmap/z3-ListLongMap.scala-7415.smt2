; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94298 () Bool)

(assert start!94298)

(declare-fun b_free!21667 () Bool)

(declare-fun b_next!21667 () Bool)

(assert (=> start!94298 (= b_free!21667 (not b_next!21667))))

(declare-fun tp!76441 () Bool)

(declare-fun b_and!34413 () Bool)

(assert (=> start!94298 (= tp!76441 b_and!34413)))

(declare-fun b!1066288 () Bool)

(declare-fun e!608027 () Bool)

(declare-fun tp_is_empty!25477 () Bool)

(assert (=> b!1066288 (= e!608027 tp_is_empty!25477)))

(declare-fun res!711710 () Bool)

(declare-fun e!608026 () Bool)

(assert (=> start!94298 (=> (not res!711710) (not e!608026))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94298 (= res!711710 (validMask!0 mask!1515))))

(assert (=> start!94298 e!608026))

(assert (=> start!94298 true))

(assert (=> start!94298 tp_is_empty!25477))

(declare-datatypes ((V!39105 0))(
  ( (V!39106 (val!12789 Int)) )
))
(declare-datatypes ((ValueCell!12035 0))(
  ( (ValueCellFull!12035 (v!15401 V!39105)) (EmptyCell!12035) )
))
(declare-datatypes ((array!67880 0))(
  ( (array!67881 (arr!32642 (Array (_ BitVec 32) ValueCell!12035)) (size!33180 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67880)

(declare-fun e!608024 () Bool)

(declare-fun array_inv!25270 (array!67880) Bool)

(assert (=> start!94298 (and (array_inv!25270 _values!955) e!608024)))

(assert (=> start!94298 tp!76441))

(declare-datatypes ((array!67882 0))(
  ( (array!67883 (arr!32643 (Array (_ BitVec 32) (_ BitVec 64))) (size!33181 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67882)

(declare-fun array_inv!25271 (array!67882) Bool)

(assert (=> start!94298 (array_inv!25271 _keys!1163)))

(declare-fun mapIsEmpty!39904 () Bool)

(declare-fun mapRes!39904 () Bool)

(assert (=> mapIsEmpty!39904 mapRes!39904))

(declare-fun b!1066289 () Bool)

(declare-fun e!608025 () Bool)

(assert (=> b!1066289 (= e!608025 tp_is_empty!25477)))

(declare-fun b!1066290 () Bool)

(declare-fun res!711711 () Bool)

(assert (=> b!1066290 (=> (not res!711711) (not e!608026))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066290 (= res!711711 (and (= (size!33180 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33181 _keys!1163) (size!33180 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066291 () Bool)

(declare-fun e!608028 () Bool)

(assert (=> b!1066291 (= e!608026 (not e!608028))))

(declare-fun res!711712 () Bool)

(assert (=> b!1066291 (=> res!711712 e!608028)))

(assert (=> b!1066291 (= res!711712 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16276 0))(
  ( (tuple2!16277 (_1!8149 (_ BitVec 64)) (_2!8149 V!39105)) )
))
(declare-datatypes ((List!22821 0))(
  ( (Nil!22818) (Cons!22817 (h!24026 tuple2!16276) (t!32133 List!22821)) )
))
(declare-datatypes ((ListLongMap!14245 0))(
  ( (ListLongMap!14246 (toList!7138 List!22821)) )
))
(declare-fun lt!470611 () ListLongMap!14245)

(declare-fun lt!470609 () ListLongMap!14245)

(assert (=> b!1066291 (= lt!470611 lt!470609)))

(declare-fun zeroValueBefore!47 () V!39105)

(declare-datatypes ((Unit!34864 0))(
  ( (Unit!34865) )
))
(declare-fun lt!470605 () Unit!34864)

(declare-fun minValue!907 () V!39105)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39105)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!731 (array!67882 array!67880 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39105 V!39105 V!39105 V!39105 (_ BitVec 32) Int) Unit!34864)

(assert (=> b!1066291 (= lt!470605 (lemmaNoChangeToArrayThenSameMapNoExtras!731 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3737 (array!67882 array!67880 (_ BitVec 32) (_ BitVec 32) V!39105 V!39105 (_ BitVec 32) Int) ListLongMap!14245)

(assert (=> b!1066291 (= lt!470609 (getCurrentListMapNoExtraKeys!3737 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066291 (= lt!470611 (getCurrentListMapNoExtraKeys!3737 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066292 () Bool)

(assert (=> b!1066292 (= e!608024 (and e!608027 mapRes!39904))))

(declare-fun condMapEmpty!39904 () Bool)

(declare-fun mapDefault!39904 () ValueCell!12035)

(assert (=> b!1066292 (= condMapEmpty!39904 (= (arr!32642 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12035)) mapDefault!39904)))))

(declare-fun b!1066293 () Bool)

(assert (=> b!1066293 (= e!608028 true)))

(declare-fun lt!470606 () ListLongMap!14245)

(declare-fun lt!470607 () ListLongMap!14245)

(declare-fun -!609 (ListLongMap!14245 (_ BitVec 64)) ListLongMap!14245)

(assert (=> b!1066293 (= lt!470606 (-!609 lt!470607 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470610 () ListLongMap!14245)

(assert (=> b!1066293 (= (-!609 lt!470610 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470611)))

(declare-fun lt!470604 () Unit!34864)

(declare-fun addThenRemoveForNewKeyIsSame!27 (ListLongMap!14245 (_ BitVec 64) V!39105) Unit!34864)

(assert (=> b!1066293 (= lt!470604 (addThenRemoveForNewKeyIsSame!27 lt!470611 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470608 () ListLongMap!14245)

(assert (=> b!1066293 (and (= lt!470607 lt!470610) (= lt!470608 lt!470609))))

(declare-fun +!3175 (ListLongMap!14245 tuple2!16276) ListLongMap!14245)

(assert (=> b!1066293 (= lt!470610 (+!3175 lt!470611 (tuple2!16277 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4007 (array!67882 array!67880 (_ BitVec 32) (_ BitVec 32) V!39105 V!39105 (_ BitVec 32) Int) ListLongMap!14245)

(assert (=> b!1066293 (= lt!470608 (getCurrentListMap!4007 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066293 (= lt!470607 (getCurrentListMap!4007 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066294 () Bool)

(declare-fun res!711708 () Bool)

(assert (=> b!1066294 (=> (not res!711708) (not e!608026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67882 (_ BitVec 32)) Bool)

(assert (=> b!1066294 (= res!711708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39904 () Bool)

(declare-fun tp!76442 () Bool)

(assert (=> mapNonEmpty!39904 (= mapRes!39904 (and tp!76442 e!608025))))

(declare-fun mapRest!39904 () (Array (_ BitVec 32) ValueCell!12035))

(declare-fun mapValue!39904 () ValueCell!12035)

(declare-fun mapKey!39904 () (_ BitVec 32))

(assert (=> mapNonEmpty!39904 (= (arr!32642 _values!955) (store mapRest!39904 mapKey!39904 mapValue!39904))))

(declare-fun b!1066295 () Bool)

(declare-fun res!711709 () Bool)

(assert (=> b!1066295 (=> (not res!711709) (not e!608026))))

(declare-datatypes ((List!22822 0))(
  ( (Nil!22819) (Cons!22818 (h!24027 (_ BitVec 64)) (t!32134 List!22822)) )
))
(declare-fun arrayNoDuplicates!0 (array!67882 (_ BitVec 32) List!22822) Bool)

(assert (=> b!1066295 (= res!711709 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22819))))

(assert (= (and start!94298 res!711710) b!1066290))

(assert (= (and b!1066290 res!711711) b!1066294))

(assert (= (and b!1066294 res!711708) b!1066295))

(assert (= (and b!1066295 res!711709) b!1066291))

(assert (= (and b!1066291 (not res!711712)) b!1066293))

(assert (= (and b!1066292 condMapEmpty!39904) mapIsEmpty!39904))

(assert (= (and b!1066292 (not condMapEmpty!39904)) mapNonEmpty!39904))

(get-info :version)

(assert (= (and mapNonEmpty!39904 ((_ is ValueCellFull!12035) mapValue!39904)) b!1066289))

(assert (= (and b!1066292 ((_ is ValueCellFull!12035) mapDefault!39904)) b!1066288))

(assert (= start!94298 b!1066292))

(declare-fun m!984477 () Bool)

(assert (=> start!94298 m!984477))

(declare-fun m!984479 () Bool)

(assert (=> start!94298 m!984479))

(declare-fun m!984481 () Bool)

(assert (=> start!94298 m!984481))

(declare-fun m!984483 () Bool)

(assert (=> b!1066294 m!984483))

(declare-fun m!984485 () Bool)

(assert (=> b!1066295 m!984485))

(declare-fun m!984487 () Bool)

(assert (=> mapNonEmpty!39904 m!984487))

(declare-fun m!984489 () Bool)

(assert (=> b!1066293 m!984489))

(declare-fun m!984491 () Bool)

(assert (=> b!1066293 m!984491))

(declare-fun m!984493 () Bool)

(assert (=> b!1066293 m!984493))

(declare-fun m!984495 () Bool)

(assert (=> b!1066293 m!984495))

(declare-fun m!984497 () Bool)

(assert (=> b!1066293 m!984497))

(declare-fun m!984499 () Bool)

(assert (=> b!1066293 m!984499))

(declare-fun m!984501 () Bool)

(assert (=> b!1066291 m!984501))

(declare-fun m!984503 () Bool)

(assert (=> b!1066291 m!984503))

(declare-fun m!984505 () Bool)

(assert (=> b!1066291 m!984505))

(check-sat b_and!34413 (not b!1066295) (not start!94298) (not mapNonEmpty!39904) (not b!1066293) tp_is_empty!25477 (not b_next!21667) (not b!1066294) (not b!1066291))
(check-sat b_and!34413 (not b_next!21667))
