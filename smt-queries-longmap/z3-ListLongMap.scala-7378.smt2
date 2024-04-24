; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94244 () Bool)

(assert start!94244)

(declare-fun b_free!21445 () Bool)

(declare-fun b_next!21445 () Bool)

(assert (=> start!94244 (= b_free!21445 (not b_next!21445))))

(declare-fun tp!75763 () Bool)

(declare-fun b_and!34187 () Bool)

(assert (=> start!94244 (= tp!75763 b_and!34187)))

(declare-fun b!1064568 () Bool)

(declare-fun e!606646 () Bool)

(assert (=> b!1064568 (= e!606646 true)))

(declare-datatypes ((V!38809 0))(
  ( (V!38810 (val!12678 Int)) )
))
(declare-datatypes ((tuple2!16034 0))(
  ( (tuple2!16035 (_1!8028 (_ BitVec 64)) (_2!8028 V!38809)) )
))
(declare-datatypes ((List!22608 0))(
  ( (Nil!22605) (Cons!22604 (h!23822 tuple2!16034) (t!31913 List!22608)) )
))
(declare-datatypes ((ListLongMap!14011 0))(
  ( (ListLongMap!14012 (toList!7021 List!22608)) )
))
(declare-fun lt!469098 () ListLongMap!14011)

(declare-fun -!580 (ListLongMap!14011 (_ BitVec 64)) ListLongMap!14011)

(assert (=> b!1064568 (= (-!580 lt!469098 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469098)))

(declare-datatypes ((Unit!34843 0))(
  ( (Unit!34844) )
))
(declare-fun lt!469096 () Unit!34843)

(declare-fun removeNotPresentStillSame!31 (ListLongMap!14011 (_ BitVec 64)) Unit!34843)

(assert (=> b!1064568 (= lt!469096 (removeNotPresentStillSame!31 lt!469098 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064569 () Bool)

(declare-fun res!710443 () Bool)

(declare-fun e!606649 () Bool)

(assert (=> b!1064569 (=> (not res!710443) (not e!606649))))

(declare-datatypes ((array!67553 0))(
  ( (array!67554 (arr!32476 (Array (_ BitVec 32) (_ BitVec 64))) (size!33013 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67553)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67553 (_ BitVec 32)) Bool)

(assert (=> b!1064569 (= res!710443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064570 () Bool)

(declare-fun e!606648 () Bool)

(assert (=> b!1064570 (= e!606648 e!606646)))

(declare-fun res!710440 () Bool)

(assert (=> b!1064570 (=> res!710440 e!606646)))

(declare-fun contains!6273 (ListLongMap!14011 (_ BitVec 64)) Bool)

(assert (=> b!1064570 (= res!710440 (contains!6273 lt!469098 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38809)

(declare-datatypes ((ValueCell!11924 0))(
  ( (ValueCellFull!11924 (v!15285 V!38809)) (EmptyCell!11924) )
))
(declare-datatypes ((array!67555 0))(
  ( (array!67556 (arr!32477 (Array (_ BitVec 32) ValueCell!11924)) (size!33014 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67555)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38809)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!3998 (array!67553 array!67555 (_ BitVec 32) (_ BitVec 32) V!38809 V!38809 (_ BitVec 32) Int) ListLongMap!14011)

(assert (=> b!1064570 (= lt!469098 (getCurrentListMap!3998 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064571 () Bool)

(declare-fun res!710444 () Bool)

(assert (=> b!1064571 (=> (not res!710444) (not e!606649))))

(declare-datatypes ((List!22609 0))(
  ( (Nil!22606) (Cons!22605 (h!23823 (_ BitVec 64)) (t!31914 List!22609)) )
))
(declare-fun arrayNoDuplicates!0 (array!67553 (_ BitVec 32) List!22609) Bool)

(assert (=> b!1064571 (= res!710444 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22606))))

(declare-fun b!1064572 () Bool)

(assert (=> b!1064572 (= e!606649 (not e!606648))))

(declare-fun res!710441 () Bool)

(assert (=> b!1064572 (=> res!710441 e!606648)))

(assert (=> b!1064572 (= res!710441 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!469099 () ListLongMap!14011)

(declare-fun lt!469097 () ListLongMap!14011)

(assert (=> b!1064572 (= lt!469099 lt!469097)))

(declare-fun zeroValueAfter!47 () V!38809)

(declare-fun lt!469100 () Unit!34843)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!663 (array!67553 array!67555 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38809 V!38809 V!38809 V!38809 (_ BitVec 32) Int) Unit!34843)

(assert (=> b!1064572 (= lt!469100 (lemmaNoChangeToArrayThenSameMapNoExtras!663 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3660 (array!67553 array!67555 (_ BitVec 32) (_ BitVec 32) V!38809 V!38809 (_ BitVec 32) Int) ListLongMap!14011)

(assert (=> b!1064572 (= lt!469097 (getCurrentListMapNoExtraKeys!3660 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064572 (= lt!469099 (getCurrentListMapNoExtraKeys!3660 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39559 () Bool)

(declare-fun mapRes!39559 () Bool)

(assert (=> mapIsEmpty!39559 mapRes!39559))

(declare-fun res!710442 () Bool)

(assert (=> start!94244 (=> (not res!710442) (not e!606649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94244 (= res!710442 (validMask!0 mask!1515))))

(assert (=> start!94244 e!606649))

(assert (=> start!94244 true))

(declare-fun tp_is_empty!25255 () Bool)

(assert (=> start!94244 tp_is_empty!25255))

(declare-fun e!606647 () Bool)

(declare-fun array_inv!25176 (array!67555) Bool)

(assert (=> start!94244 (and (array_inv!25176 _values!955) e!606647)))

(assert (=> start!94244 tp!75763))

(declare-fun array_inv!25177 (array!67553) Bool)

(assert (=> start!94244 (array_inv!25177 _keys!1163)))

(declare-fun b!1064573 () Bool)

(declare-fun e!606645 () Bool)

(assert (=> b!1064573 (= e!606647 (and e!606645 mapRes!39559))))

(declare-fun condMapEmpty!39559 () Bool)

(declare-fun mapDefault!39559 () ValueCell!11924)

(assert (=> b!1064573 (= condMapEmpty!39559 (= (arr!32477 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11924)) mapDefault!39559)))))

(declare-fun b!1064574 () Bool)

(declare-fun e!606644 () Bool)

(assert (=> b!1064574 (= e!606644 tp_is_empty!25255)))

(declare-fun b!1064575 () Bool)

(assert (=> b!1064575 (= e!606645 tp_is_empty!25255)))

(declare-fun b!1064576 () Bool)

(declare-fun res!710445 () Bool)

(assert (=> b!1064576 (=> (not res!710445) (not e!606649))))

(assert (=> b!1064576 (= res!710445 (and (= (size!33014 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33013 _keys!1163) (size!33014 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39559 () Bool)

(declare-fun tp!75764 () Bool)

(assert (=> mapNonEmpty!39559 (= mapRes!39559 (and tp!75764 e!606644))))

(declare-fun mapRest!39559 () (Array (_ BitVec 32) ValueCell!11924))

(declare-fun mapKey!39559 () (_ BitVec 32))

(declare-fun mapValue!39559 () ValueCell!11924)

(assert (=> mapNonEmpty!39559 (= (arr!32477 _values!955) (store mapRest!39559 mapKey!39559 mapValue!39559))))

(assert (= (and start!94244 res!710442) b!1064576))

(assert (= (and b!1064576 res!710445) b!1064569))

(assert (= (and b!1064569 res!710443) b!1064571))

(assert (= (and b!1064571 res!710444) b!1064572))

(assert (= (and b!1064572 (not res!710441)) b!1064570))

(assert (= (and b!1064570 (not res!710440)) b!1064568))

(assert (= (and b!1064573 condMapEmpty!39559) mapIsEmpty!39559))

(assert (= (and b!1064573 (not condMapEmpty!39559)) mapNonEmpty!39559))

(get-info :version)

(assert (= (and mapNonEmpty!39559 ((_ is ValueCellFull!11924) mapValue!39559)) b!1064574))

(assert (= (and b!1064573 ((_ is ValueCellFull!11924) mapDefault!39559)) b!1064575))

(assert (= start!94244 b!1064573))

(declare-fun m!983611 () Bool)

(assert (=> b!1064572 m!983611))

(declare-fun m!983613 () Bool)

(assert (=> b!1064572 m!983613))

(declare-fun m!983615 () Bool)

(assert (=> b!1064572 m!983615))

(declare-fun m!983617 () Bool)

(assert (=> b!1064571 m!983617))

(declare-fun m!983619 () Bool)

(assert (=> b!1064570 m!983619))

(declare-fun m!983621 () Bool)

(assert (=> b!1064570 m!983621))

(declare-fun m!983623 () Bool)

(assert (=> start!94244 m!983623))

(declare-fun m!983625 () Bool)

(assert (=> start!94244 m!983625))

(declare-fun m!983627 () Bool)

(assert (=> start!94244 m!983627))

(declare-fun m!983629 () Bool)

(assert (=> mapNonEmpty!39559 m!983629))

(declare-fun m!983631 () Bool)

(assert (=> b!1064568 m!983631))

(declare-fun m!983633 () Bool)

(assert (=> b!1064568 m!983633))

(declare-fun m!983635 () Bool)

(assert (=> b!1064569 m!983635))

(check-sat (not b!1064568) (not b!1064572) (not start!94244) (not b!1064571) tp_is_empty!25255 b_and!34187 (not mapNonEmpty!39559) (not b_next!21445) (not b!1064570) (not b!1064569))
(check-sat b_and!34187 (not b_next!21445))
