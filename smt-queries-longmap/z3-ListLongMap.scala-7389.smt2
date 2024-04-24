; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94332 () Bool)

(assert start!94332)

(declare-fun b_free!21511 () Bool)

(declare-fun b_next!21511 () Bool)

(assert (=> start!94332 (= b_free!21511 (not b_next!21511))))

(declare-fun tp!75964 () Bool)

(declare-fun b_and!34263 () Bool)

(assert (=> start!94332 (= tp!75964 b_and!34263)))

(declare-fun res!710966 () Bool)

(declare-fun e!607311 () Bool)

(assert (=> start!94332 (=> (not res!710966) (not e!607311))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94332 (= res!710966 (validMask!0 mask!1515))))

(assert (=> start!94332 e!607311))

(assert (=> start!94332 true))

(declare-fun tp_is_empty!25321 () Bool)

(assert (=> start!94332 tp_is_empty!25321))

(declare-datatypes ((V!38897 0))(
  ( (V!38898 (val!12711 Int)) )
))
(declare-datatypes ((ValueCell!11957 0))(
  ( (ValueCellFull!11957 (v!15319 V!38897)) (EmptyCell!11957) )
))
(declare-datatypes ((array!67687 0))(
  ( (array!67688 (arr!32542 (Array (_ BitVec 32) ValueCell!11957)) (size!33079 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67687)

(declare-fun e!607307 () Bool)

(declare-fun array_inv!25222 (array!67687) Bool)

(assert (=> start!94332 (and (array_inv!25222 _values!955) e!607307)))

(assert (=> start!94332 tp!75964))

(declare-datatypes ((array!67689 0))(
  ( (array!67690 (arr!32543 (Array (_ BitVec 32) (_ BitVec 64))) (size!33080 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67689)

(declare-fun array_inv!25223 (array!67689) Bool)

(assert (=> start!94332 (array_inv!25223 _keys!1163)))

(declare-fun mapIsEmpty!39661 () Bool)

(declare-fun mapRes!39661 () Bool)

(assert (=> mapIsEmpty!39661 mapRes!39661))

(declare-fun b!1065486 () Bool)

(assert (=> b!1065486 (= e!607311 (not true))))

(declare-datatypes ((tuple2!16086 0))(
  ( (tuple2!16087 (_1!8054 (_ BitVec 64)) (_2!8054 V!38897)) )
))
(declare-datatypes ((List!22659 0))(
  ( (Nil!22656) (Cons!22655 (h!23873 tuple2!16086) (t!31966 List!22659)) )
))
(declare-datatypes ((ListLongMap!14063 0))(
  ( (ListLongMap!14064 (toList!7047 List!22659)) )
))
(declare-fun lt!469587 () ListLongMap!14063)

(declare-fun lt!469585 () ListLongMap!14063)

(assert (=> b!1065486 (= lt!469587 lt!469585)))

(declare-fun zeroValueBefore!47 () V!38897)

(declare-datatypes ((Unit!34897 0))(
  ( (Unit!34898) )
))
(declare-fun lt!469586 () Unit!34897)

(declare-fun minValue!907 () V!38897)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38897)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!684 (array!67689 array!67687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38897 V!38897 V!38897 V!38897 (_ BitVec 32) Int) Unit!34897)

(assert (=> b!1065486 (= lt!469586 (lemmaNoChangeToArrayThenSameMapNoExtras!684 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3681 (array!67689 array!67687 (_ BitVec 32) (_ BitVec 32) V!38897 V!38897 (_ BitVec 32) Int) ListLongMap!14063)

(assert (=> b!1065486 (= lt!469585 (getCurrentListMapNoExtraKeys!3681 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065486 (= lt!469587 (getCurrentListMapNoExtraKeys!3681 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065487 () Bool)

(declare-fun res!710967 () Bool)

(assert (=> b!1065487 (=> (not res!710967) (not e!607311))))

(assert (=> b!1065487 (= res!710967 (and (= (size!33079 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33080 _keys!1163) (size!33079 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065488 () Bool)

(declare-fun e!607309 () Bool)

(assert (=> b!1065488 (= e!607309 tp_is_empty!25321)))

(declare-fun b!1065489 () Bool)

(declare-fun res!710968 () Bool)

(assert (=> b!1065489 (=> (not res!710968) (not e!607311))))

(declare-datatypes ((List!22660 0))(
  ( (Nil!22657) (Cons!22656 (h!23874 (_ BitVec 64)) (t!31967 List!22660)) )
))
(declare-fun arrayNoDuplicates!0 (array!67689 (_ BitVec 32) List!22660) Bool)

(assert (=> b!1065489 (= res!710968 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22657))))

(declare-fun mapNonEmpty!39661 () Bool)

(declare-fun tp!75965 () Bool)

(assert (=> mapNonEmpty!39661 (= mapRes!39661 (and tp!75965 e!607309))))

(declare-fun mapValue!39661 () ValueCell!11957)

(declare-fun mapRest!39661 () (Array (_ BitVec 32) ValueCell!11957))

(declare-fun mapKey!39661 () (_ BitVec 32))

(assert (=> mapNonEmpty!39661 (= (arr!32542 _values!955) (store mapRest!39661 mapKey!39661 mapValue!39661))))

(declare-fun b!1065490 () Bool)

(declare-fun res!710965 () Bool)

(assert (=> b!1065490 (=> (not res!710965) (not e!607311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67689 (_ BitVec 32)) Bool)

(assert (=> b!1065490 (= res!710965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065491 () Bool)

(declare-fun e!607308 () Bool)

(assert (=> b!1065491 (= e!607307 (and e!607308 mapRes!39661))))

(declare-fun condMapEmpty!39661 () Bool)

(declare-fun mapDefault!39661 () ValueCell!11957)

(assert (=> b!1065491 (= condMapEmpty!39661 (= (arr!32542 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11957)) mapDefault!39661)))))

(declare-fun b!1065492 () Bool)

(assert (=> b!1065492 (= e!607308 tp_is_empty!25321)))

(assert (= (and start!94332 res!710966) b!1065487))

(assert (= (and b!1065487 res!710967) b!1065490))

(assert (= (and b!1065490 res!710965) b!1065489))

(assert (= (and b!1065489 res!710968) b!1065486))

(assert (= (and b!1065491 condMapEmpty!39661) mapIsEmpty!39661))

(assert (= (and b!1065491 (not condMapEmpty!39661)) mapNonEmpty!39661))

(get-info :version)

(assert (= (and mapNonEmpty!39661 ((_ is ValueCellFull!11957) mapValue!39661)) b!1065488))

(assert (= (and b!1065491 ((_ is ValueCellFull!11957) mapDefault!39661)) b!1065492))

(assert (= start!94332 b!1065491))

(declare-fun m!984427 () Bool)

(assert (=> b!1065490 m!984427))

(declare-fun m!984429 () Bool)

(assert (=> mapNonEmpty!39661 m!984429))

(declare-fun m!984431 () Bool)

(assert (=> b!1065486 m!984431))

(declare-fun m!984433 () Bool)

(assert (=> b!1065486 m!984433))

(declare-fun m!984435 () Bool)

(assert (=> b!1065486 m!984435))

(declare-fun m!984437 () Bool)

(assert (=> b!1065489 m!984437))

(declare-fun m!984439 () Bool)

(assert (=> start!94332 m!984439))

(declare-fun m!984441 () Bool)

(assert (=> start!94332 m!984441))

(declare-fun m!984443 () Bool)

(assert (=> start!94332 m!984443))

(check-sat (not b_next!21511) (not b!1065489) (not b!1065486) (not mapNonEmpty!39661) (not b!1065490) (not start!94332) tp_is_empty!25321 b_and!34263)
(check-sat b_and!34263 (not b_next!21511))
