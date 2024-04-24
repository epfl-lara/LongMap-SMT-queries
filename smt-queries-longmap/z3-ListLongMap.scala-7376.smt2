; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94232 () Bool)

(assert start!94232)

(declare-fun b_free!21433 () Bool)

(declare-fun b_next!21433 () Bool)

(assert (=> start!94232 (= b_free!21433 (not b_next!21433))))

(declare-fun tp!75728 () Bool)

(declare-fun b_and!34175 () Bool)

(assert (=> start!94232 (= tp!75728 b_and!34175)))

(declare-fun b!1064406 () Bool)

(declare-fun e!606518 () Bool)

(assert (=> b!1064406 (= e!606518 true)))

(declare-datatypes ((V!38793 0))(
  ( (V!38794 (val!12672 Int)) )
))
(declare-datatypes ((tuple2!16022 0))(
  ( (tuple2!16023 (_1!8022 (_ BitVec 64)) (_2!8022 V!38793)) )
))
(declare-datatypes ((List!22598 0))(
  ( (Nil!22595) (Cons!22594 (h!23812 tuple2!16022) (t!31903 List!22598)) )
))
(declare-datatypes ((ListLongMap!13999 0))(
  ( (ListLongMap!14000 (toList!7015 List!22598)) )
))
(declare-fun lt!469006 () ListLongMap!13999)

(declare-fun -!575 (ListLongMap!13999 (_ BitVec 64)) ListLongMap!13999)

(assert (=> b!1064406 (= (-!575 lt!469006 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469006)))

(declare-datatypes ((Unit!34831 0))(
  ( (Unit!34832) )
))
(declare-fun lt!469009 () Unit!34831)

(declare-fun removeNotPresentStillSame!26 (ListLongMap!13999 (_ BitVec 64)) Unit!34831)

(assert (=> b!1064406 (= lt!469009 (removeNotPresentStillSame!26 lt!469006 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064407 () Bool)

(declare-fun res!710336 () Bool)

(declare-fun e!606523 () Bool)

(assert (=> b!1064407 (=> (not res!710336) (not e!606523))))

(declare-datatypes ((array!67529 0))(
  ( (array!67530 (arr!32464 (Array (_ BitVec 32) (_ BitVec 64))) (size!33001 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67529)

(declare-datatypes ((List!22599 0))(
  ( (Nil!22596) (Cons!22595 (h!23813 (_ BitVec 64)) (t!31904 List!22599)) )
))
(declare-fun arrayNoDuplicates!0 (array!67529 (_ BitVec 32) List!22599) Bool)

(assert (=> b!1064407 (= res!710336 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22596))))

(declare-fun b!1064408 () Bool)

(declare-fun e!606522 () Bool)

(declare-fun e!606519 () Bool)

(declare-fun mapRes!39541 () Bool)

(assert (=> b!1064408 (= e!606522 (and e!606519 mapRes!39541))))

(declare-fun condMapEmpty!39541 () Bool)

(declare-datatypes ((ValueCell!11918 0))(
  ( (ValueCellFull!11918 (v!15279 V!38793)) (EmptyCell!11918) )
))
(declare-datatypes ((array!67531 0))(
  ( (array!67532 (arr!32465 (Array (_ BitVec 32) ValueCell!11918)) (size!33002 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67531)

(declare-fun mapDefault!39541 () ValueCell!11918)

(assert (=> b!1064408 (= condMapEmpty!39541 (= (arr!32465 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11918)) mapDefault!39541)))))

(declare-fun res!710335 () Bool)

(assert (=> start!94232 (=> (not res!710335) (not e!606523))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94232 (= res!710335 (validMask!0 mask!1515))))

(assert (=> start!94232 e!606523))

(assert (=> start!94232 true))

(declare-fun tp_is_empty!25243 () Bool)

(assert (=> start!94232 tp_is_empty!25243))

(declare-fun array_inv!25166 (array!67531) Bool)

(assert (=> start!94232 (and (array_inv!25166 _values!955) e!606522)))

(assert (=> start!94232 tp!75728))

(declare-fun array_inv!25167 (array!67529) Bool)

(assert (=> start!94232 (array_inv!25167 _keys!1163)))

(declare-fun mapIsEmpty!39541 () Bool)

(assert (=> mapIsEmpty!39541 mapRes!39541))

(declare-fun b!1064409 () Bool)

(assert (=> b!1064409 (= e!606519 tp_is_empty!25243)))

(declare-fun b!1064410 () Bool)

(declare-fun res!710332 () Bool)

(assert (=> b!1064410 (=> (not res!710332) (not e!606523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67529 (_ BitVec 32)) Bool)

(assert (=> b!1064410 (= res!710332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064411 () Bool)

(declare-fun e!606521 () Bool)

(assert (=> b!1064411 (= e!606521 tp_is_empty!25243)))

(declare-fun mapNonEmpty!39541 () Bool)

(declare-fun tp!75727 () Bool)

(assert (=> mapNonEmpty!39541 (= mapRes!39541 (and tp!75727 e!606521))))

(declare-fun mapRest!39541 () (Array (_ BitVec 32) ValueCell!11918))

(declare-fun mapKey!39541 () (_ BitVec 32))

(declare-fun mapValue!39541 () ValueCell!11918)

(assert (=> mapNonEmpty!39541 (= (arr!32465 _values!955) (store mapRest!39541 mapKey!39541 mapValue!39541))))

(declare-fun b!1064412 () Bool)

(declare-fun e!606520 () Bool)

(assert (=> b!1064412 (= e!606523 (not e!606520))))

(declare-fun res!710334 () Bool)

(assert (=> b!1064412 (=> res!710334 e!606520)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064412 (= res!710334 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!469008 () ListLongMap!13999)

(declare-fun lt!469007 () ListLongMap!13999)

(assert (=> b!1064412 (= lt!469008 lt!469007)))

(declare-fun zeroValueBefore!47 () V!38793)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38793)

(declare-fun minValue!907 () V!38793)

(declare-fun lt!469010 () Unit!34831)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!657 (array!67529 array!67531 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38793 V!38793 V!38793 V!38793 (_ BitVec 32) Int) Unit!34831)

(assert (=> b!1064412 (= lt!469010 (lemmaNoChangeToArrayThenSameMapNoExtras!657 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3654 (array!67529 array!67531 (_ BitVec 32) (_ BitVec 32) V!38793 V!38793 (_ BitVec 32) Int) ListLongMap!13999)

(assert (=> b!1064412 (= lt!469007 (getCurrentListMapNoExtraKeys!3654 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064412 (= lt!469008 (getCurrentListMapNoExtraKeys!3654 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064413 () Bool)

(assert (=> b!1064413 (= e!606520 e!606518)))

(declare-fun res!710333 () Bool)

(assert (=> b!1064413 (=> res!710333 e!606518)))

(declare-fun contains!6268 (ListLongMap!13999 (_ BitVec 64)) Bool)

(assert (=> b!1064413 (= res!710333 (contains!6268 lt!469006 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3993 (array!67529 array!67531 (_ BitVec 32) (_ BitVec 32) V!38793 V!38793 (_ BitVec 32) Int) ListLongMap!13999)

(assert (=> b!1064413 (= lt!469006 (getCurrentListMap!3993 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064414 () Bool)

(declare-fun res!710337 () Bool)

(assert (=> b!1064414 (=> (not res!710337) (not e!606523))))

(assert (=> b!1064414 (= res!710337 (and (= (size!33002 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33001 _keys!1163) (size!33002 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94232 res!710335) b!1064414))

(assert (= (and b!1064414 res!710337) b!1064410))

(assert (= (and b!1064410 res!710332) b!1064407))

(assert (= (and b!1064407 res!710336) b!1064412))

(assert (= (and b!1064412 (not res!710334)) b!1064413))

(assert (= (and b!1064413 (not res!710333)) b!1064406))

(assert (= (and b!1064408 condMapEmpty!39541) mapIsEmpty!39541))

(assert (= (and b!1064408 (not condMapEmpty!39541)) mapNonEmpty!39541))

(get-info :version)

(assert (= (and mapNonEmpty!39541 ((_ is ValueCellFull!11918) mapValue!39541)) b!1064411))

(assert (= (and b!1064408 ((_ is ValueCellFull!11918) mapDefault!39541)) b!1064409))

(assert (= start!94232 b!1064408))

(declare-fun m!983455 () Bool)

(assert (=> mapNonEmpty!39541 m!983455))

(declare-fun m!983457 () Bool)

(assert (=> b!1064410 m!983457))

(declare-fun m!983459 () Bool)

(assert (=> b!1064412 m!983459))

(declare-fun m!983461 () Bool)

(assert (=> b!1064412 m!983461))

(declare-fun m!983463 () Bool)

(assert (=> b!1064412 m!983463))

(declare-fun m!983465 () Bool)

(assert (=> b!1064413 m!983465))

(declare-fun m!983467 () Bool)

(assert (=> b!1064413 m!983467))

(declare-fun m!983469 () Bool)

(assert (=> start!94232 m!983469))

(declare-fun m!983471 () Bool)

(assert (=> start!94232 m!983471))

(declare-fun m!983473 () Bool)

(assert (=> start!94232 m!983473))

(declare-fun m!983475 () Bool)

(assert (=> b!1064406 m!983475))

(declare-fun m!983477 () Bool)

(assert (=> b!1064406 m!983477))

(declare-fun m!983479 () Bool)

(assert (=> b!1064407 m!983479))

(check-sat (not b!1064412) b_and!34175 (not b!1064410) tp_is_empty!25243 (not b!1064413) (not mapNonEmpty!39541) (not b_next!21433) (not start!94232) (not b!1064406) (not b!1064407))
(check-sat b_and!34175 (not b_next!21433))
