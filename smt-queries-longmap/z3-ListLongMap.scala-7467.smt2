; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94728 () Bool)

(assert start!94728)

(declare-fun b_free!21981 () Bool)

(declare-fun b_next!21981 () Bool)

(assert (=> start!94728 (= b_free!21981 (not b_next!21981))))

(declare-fun tp!77402 () Bool)

(declare-fun b_and!34811 () Bool)

(assert (=> start!94728 (= tp!77402 b_and!34811)))

(declare-fun b!1071048 () Bool)

(declare-fun res!714482 () Bool)

(declare-fun e!611494 () Bool)

(assert (=> b!1071048 (=> (not res!714482) (not e!611494))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39523 0))(
  ( (V!39524 (val!12946 Int)) )
))
(declare-datatypes ((ValueCell!12192 0))(
  ( (ValueCellFull!12192 (v!15562 V!39523)) (EmptyCell!12192) )
))
(declare-datatypes ((array!68559 0))(
  ( (array!68560 (arr!32975 (Array (_ BitVec 32) ValueCell!12192)) (size!33511 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68559)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68561 0))(
  ( (array!68562 (arr!32976 (Array (_ BitVec 32) (_ BitVec 64))) (size!33512 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68561)

(assert (=> b!1071048 (= res!714482 (and (= (size!33511 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33512 _keys!1163) (size!33511 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071049 () Bool)

(declare-fun e!611490 () Bool)

(declare-fun e!611493 () Bool)

(declare-fun mapRes!40393 () Bool)

(assert (=> b!1071049 (= e!611490 (and e!611493 mapRes!40393))))

(declare-fun condMapEmpty!40393 () Bool)

(declare-fun mapDefault!40393 () ValueCell!12192)

(assert (=> b!1071049 (= condMapEmpty!40393 (= (arr!32975 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12192)) mapDefault!40393)))))

(declare-fun res!714481 () Bool)

(assert (=> start!94728 (=> (not res!714481) (not e!611494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94728 (= res!714481 (validMask!0 mask!1515))))

(assert (=> start!94728 e!611494))

(assert (=> start!94728 true))

(declare-fun tp_is_empty!25791 () Bool)

(assert (=> start!94728 tp_is_empty!25791))

(declare-fun array_inv!25502 (array!68559) Bool)

(assert (=> start!94728 (and (array_inv!25502 _values!955) e!611490)))

(assert (=> start!94728 tp!77402))

(declare-fun array_inv!25503 (array!68561) Bool)

(assert (=> start!94728 (array_inv!25503 _keys!1163)))

(declare-fun b!1071050 () Bool)

(declare-fun e!611495 () Bool)

(assert (=> b!1071050 (= e!611495 true)))

(declare-datatypes ((tuple2!16472 0))(
  ( (tuple2!16473 (_1!8247 (_ BitVec 64)) (_2!8247 V!39523)) )
))
(declare-datatypes ((List!23013 0))(
  ( (Nil!23010) (Cons!23009 (h!24218 tuple2!16472) (t!32346 List!23013)) )
))
(declare-datatypes ((ListLongMap!14441 0))(
  ( (ListLongMap!14442 (toList!7236 List!23013)) )
))
(declare-fun lt!473513 () ListLongMap!14441)

(declare-fun lt!473515 () ListLongMap!14441)

(declare-fun -!672 (ListLongMap!14441 (_ BitVec 64)) ListLongMap!14441)

(assert (=> b!1071050 (= lt!473513 (-!672 lt!473515 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!473519 () ListLongMap!14441)

(declare-fun lt!473522 () ListLongMap!14441)

(assert (=> b!1071050 (= lt!473519 lt!473522)))

(declare-fun zeroValueBefore!47 () V!39523)

(declare-datatypes ((Unit!35268 0))(
  ( (Unit!35269) )
))
(declare-fun lt!473514 () Unit!35268)

(declare-fun minValue!907 () V!39523)

(declare-fun lt!473518 () ListLongMap!14441)

(declare-fun addCommutativeForDiffKeys!717 (ListLongMap!14441 (_ BitVec 64) V!39523 (_ BitVec 64) V!39523) Unit!35268)

(assert (=> b!1071050 (= lt!473514 (addCommutativeForDiffKeys!717 lt!473518 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473520 () ListLongMap!14441)

(assert (=> b!1071050 (= (-!672 lt!473522 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473520)))

(declare-fun lt!473521 () tuple2!16472)

(declare-fun +!3171 (ListLongMap!14441 tuple2!16472) ListLongMap!14441)

(assert (=> b!1071050 (= lt!473522 (+!3171 lt!473520 lt!473521))))

(declare-fun lt!473525 () Unit!35268)

(declare-fun addThenRemoveForNewKeyIsSame!42 (ListLongMap!14441 (_ BitVec 64) V!39523) Unit!35268)

(assert (=> b!1071050 (= lt!473525 (addThenRemoveForNewKeyIsSame!42 lt!473520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473516 () tuple2!16472)

(assert (=> b!1071050 (= lt!473520 (+!3171 lt!473518 lt!473516))))

(declare-fun e!611491 () Bool)

(assert (=> b!1071050 e!611491))

(declare-fun res!714484 () Bool)

(assert (=> b!1071050 (=> (not res!714484) (not e!611491))))

(assert (=> b!1071050 (= res!714484 (= lt!473515 lt!473519))))

(assert (=> b!1071050 (= lt!473519 (+!3171 (+!3171 lt!473518 lt!473521) lt!473516))))

(assert (=> b!1071050 (= lt!473516 (tuple2!16473 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071050 (= lt!473521 (tuple2!16473 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39523)

(declare-fun lt!473523 () ListLongMap!14441)

(declare-fun getCurrentListMap!4138 (array!68561 array!68559 (_ BitVec 32) (_ BitVec 32) V!39523 V!39523 (_ BitVec 32) Int) ListLongMap!14441)

(assert (=> b!1071050 (= lt!473523 (getCurrentListMap!4138 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071050 (= lt!473515 (getCurrentListMap!4138 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071051 () Bool)

(assert (=> b!1071051 (= e!611494 (not e!611495))))

(declare-fun res!714480 () Bool)

(assert (=> b!1071051 (=> res!714480 e!611495)))

(assert (=> b!1071051 (= res!714480 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473517 () ListLongMap!14441)

(assert (=> b!1071051 (= lt!473518 lt!473517)))

(declare-fun lt!473524 () Unit!35268)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!845 (array!68561 array!68559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39523 V!39523 V!39523 V!39523 (_ BitVec 32) Int) Unit!35268)

(assert (=> b!1071051 (= lt!473524 (lemmaNoChangeToArrayThenSameMapNoExtras!845 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3808 (array!68561 array!68559 (_ BitVec 32) (_ BitVec 32) V!39523 V!39523 (_ BitVec 32) Int) ListLongMap!14441)

(assert (=> b!1071051 (= lt!473517 (getCurrentListMapNoExtraKeys!3808 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071051 (= lt!473518 (getCurrentListMapNoExtraKeys!3808 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071052 () Bool)

(declare-fun res!714479 () Bool)

(assert (=> b!1071052 (=> (not res!714479) (not e!611494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68561 (_ BitVec 32)) Bool)

(assert (=> b!1071052 (= res!714479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40393 () Bool)

(declare-fun tp!77401 () Bool)

(declare-fun e!611489 () Bool)

(assert (=> mapNonEmpty!40393 (= mapRes!40393 (and tp!77401 e!611489))))

(declare-fun mapValue!40393 () ValueCell!12192)

(declare-fun mapRest!40393 () (Array (_ BitVec 32) ValueCell!12192))

(declare-fun mapKey!40393 () (_ BitVec 32))

(assert (=> mapNonEmpty!40393 (= (arr!32975 _values!955) (store mapRest!40393 mapKey!40393 mapValue!40393))))

(declare-fun b!1071053 () Bool)

(declare-fun res!714483 () Bool)

(assert (=> b!1071053 (=> (not res!714483) (not e!611494))))

(declare-datatypes ((List!23014 0))(
  ( (Nil!23011) (Cons!23010 (h!24219 (_ BitVec 64)) (t!32347 List!23014)) )
))
(declare-fun arrayNoDuplicates!0 (array!68561 (_ BitVec 32) List!23014) Bool)

(assert (=> b!1071053 (= res!714483 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23011))))

(declare-fun mapIsEmpty!40393 () Bool)

(assert (=> mapIsEmpty!40393 mapRes!40393))

(declare-fun b!1071054 () Bool)

(assert (=> b!1071054 (= e!611493 tp_is_empty!25791)))

(declare-fun b!1071055 () Bool)

(assert (=> b!1071055 (= e!611491 (= lt!473523 (+!3171 lt!473517 lt!473516)))))

(declare-fun b!1071056 () Bool)

(assert (=> b!1071056 (= e!611489 tp_is_empty!25791)))

(assert (= (and start!94728 res!714481) b!1071048))

(assert (= (and b!1071048 res!714482) b!1071052))

(assert (= (and b!1071052 res!714479) b!1071053))

(assert (= (and b!1071053 res!714483) b!1071051))

(assert (= (and b!1071051 (not res!714480)) b!1071050))

(assert (= (and b!1071050 res!714484) b!1071055))

(assert (= (and b!1071049 condMapEmpty!40393) mapIsEmpty!40393))

(assert (= (and b!1071049 (not condMapEmpty!40393)) mapNonEmpty!40393))

(get-info :version)

(assert (= (and mapNonEmpty!40393 ((_ is ValueCellFull!12192) mapValue!40393)) b!1071056))

(assert (= (and b!1071049 ((_ is ValueCellFull!12192) mapDefault!40393)) b!1071054))

(assert (= start!94728 b!1071049))

(declare-fun m!989369 () Bool)

(assert (=> start!94728 m!989369))

(declare-fun m!989371 () Bool)

(assert (=> start!94728 m!989371))

(declare-fun m!989373 () Bool)

(assert (=> start!94728 m!989373))

(declare-fun m!989375 () Bool)

(assert (=> mapNonEmpty!40393 m!989375))

(declare-fun m!989377 () Bool)

(assert (=> b!1071053 m!989377))

(declare-fun m!989379 () Bool)

(assert (=> b!1071050 m!989379))

(declare-fun m!989381 () Bool)

(assert (=> b!1071050 m!989381))

(declare-fun m!989383 () Bool)

(assert (=> b!1071050 m!989383))

(declare-fun m!989385 () Bool)

(assert (=> b!1071050 m!989385))

(declare-fun m!989387 () Bool)

(assert (=> b!1071050 m!989387))

(declare-fun m!989389 () Bool)

(assert (=> b!1071050 m!989389))

(assert (=> b!1071050 m!989379))

(declare-fun m!989391 () Bool)

(assert (=> b!1071050 m!989391))

(declare-fun m!989393 () Bool)

(assert (=> b!1071050 m!989393))

(declare-fun m!989395 () Bool)

(assert (=> b!1071050 m!989395))

(declare-fun m!989397 () Bool)

(assert (=> b!1071050 m!989397))

(declare-fun m!989399 () Bool)

(assert (=> b!1071055 m!989399))

(declare-fun m!989401 () Bool)

(assert (=> b!1071052 m!989401))

(declare-fun m!989403 () Bool)

(assert (=> b!1071051 m!989403))

(declare-fun m!989405 () Bool)

(assert (=> b!1071051 m!989405))

(declare-fun m!989407 () Bool)

(assert (=> b!1071051 m!989407))

(check-sat (not b!1071053) (not mapNonEmpty!40393) tp_is_empty!25791 (not b!1071050) (not b!1071055) (not start!94728) b_and!34811 (not b!1071052) (not b!1071051) (not b_next!21981))
(check-sat b_and!34811 (not b_next!21981))
