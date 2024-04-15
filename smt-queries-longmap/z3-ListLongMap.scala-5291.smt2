; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70916 () Bool)

(assert start!70916)

(declare-fun b_free!13153 () Bool)

(declare-fun b_next!13153 () Bool)

(assert (=> start!70916 (= b_free!13153 (not b_next!13153))))

(declare-fun tp!46209 () Bool)

(declare-fun b_and!22023 () Bool)

(assert (=> start!70916 (= tp!46209 b_and!22023)))

(declare-fun b!823597 () Bool)

(declare-fun res!561645 () Bool)

(declare-fun e!458111 () Bool)

(assert (=> b!823597 (=> (not res!561645) (not e!458111))))

(declare-datatypes ((array!45887 0))(
  ( (array!45888 (arr!21992 (Array (_ BitVec 32) (_ BitVec 64))) (size!22413 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45887)

(declare-datatypes ((List!15698 0))(
  ( (Nil!15695) (Cons!15694 (h!16823 (_ BitVec 64)) (t!22030 List!15698)) )
))
(declare-fun arrayNoDuplicates!0 (array!45887 (_ BitVec 32) List!15698) Bool)

(assert (=> b!823597 (= res!561645 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15695))))

(declare-fun b!823598 () Bool)

(declare-fun e!458110 () Bool)

(declare-fun e!458113 () Bool)

(declare-fun mapRes!23911 () Bool)

(assert (=> b!823598 (= e!458110 (and e!458113 mapRes!23911))))

(declare-fun condMapEmpty!23911 () Bool)

(declare-datatypes ((V!24819 0))(
  ( (V!24820 (val!7479 Int)) )
))
(declare-datatypes ((ValueCell!7016 0))(
  ( (ValueCellFull!7016 (v!9906 V!24819)) (EmptyCell!7016) )
))
(declare-datatypes ((array!45889 0))(
  ( (array!45890 (arr!21993 (Array (_ BitVec 32) ValueCell!7016)) (size!22414 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45889)

(declare-fun mapDefault!23911 () ValueCell!7016)

(assert (=> b!823598 (= condMapEmpty!23911 (= (arr!21993 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7016)) mapDefault!23911)))))

(declare-fun b!823599 () Bool)

(declare-fun res!561646 () Bool)

(assert (=> b!823599 (=> (not res!561646) (not e!458111))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45887 (_ BitVec 32)) Bool)

(assert (=> b!823599 (= res!561646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823600 () Bool)

(assert (=> b!823600 (= e!458111 (not true))))

(declare-datatypes ((tuple2!9898 0))(
  ( (tuple2!9899 (_1!4960 (_ BitVec 64)) (_2!4960 V!24819)) )
))
(declare-datatypes ((List!15699 0))(
  ( (Nil!15696) (Cons!15695 (h!16824 tuple2!9898) (t!22031 List!15699)) )
))
(declare-datatypes ((ListLongMap!8711 0))(
  ( (ListLongMap!8712 (toList!4371 List!15699)) )
))
(declare-fun lt!371312 () ListLongMap!8711)

(declare-fun lt!371313 () ListLongMap!8711)

(assert (=> b!823600 (= lt!371312 lt!371313)))

(declare-datatypes ((Unit!28166 0))(
  ( (Unit!28167) )
))
(declare-fun lt!371314 () Unit!28166)

(declare-fun zeroValueBefore!34 () V!24819)

(declare-fun zeroValueAfter!34 () V!24819)

(declare-fun minValue!754 () V!24819)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!508 (array!45887 array!45889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24819 V!24819 V!24819 V!24819 (_ BitVec 32) Int) Unit!28166)

(assert (=> b!823600 (= lt!371314 (lemmaNoChangeToArrayThenSameMapNoExtras!508 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2415 (array!45887 array!45889 (_ BitVec 32) (_ BitVec 32) V!24819 V!24819 (_ BitVec 32) Int) ListLongMap!8711)

(assert (=> b!823600 (= lt!371313 (getCurrentListMapNoExtraKeys!2415 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823600 (= lt!371312 (getCurrentListMapNoExtraKeys!2415 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23911 () Bool)

(declare-fun tp!46210 () Bool)

(declare-fun e!458112 () Bool)

(assert (=> mapNonEmpty!23911 (= mapRes!23911 (and tp!46210 e!458112))))

(declare-fun mapRest!23911 () (Array (_ BitVec 32) ValueCell!7016))

(declare-fun mapValue!23911 () ValueCell!7016)

(declare-fun mapKey!23911 () (_ BitVec 32))

(assert (=> mapNonEmpty!23911 (= (arr!21993 _values!788) (store mapRest!23911 mapKey!23911 mapValue!23911))))

(declare-fun b!823601 () Bool)

(declare-fun res!561643 () Bool)

(assert (=> b!823601 (=> (not res!561643) (not e!458111))))

(assert (=> b!823601 (= res!561643 (and (= (size!22414 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22413 _keys!976) (size!22414 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!561644 () Bool)

(assert (=> start!70916 (=> (not res!561644) (not e!458111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70916 (= res!561644 (validMask!0 mask!1312))))

(assert (=> start!70916 e!458111))

(declare-fun tp_is_empty!14863 () Bool)

(assert (=> start!70916 tp_is_empty!14863))

(declare-fun array_inv!17619 (array!45887) Bool)

(assert (=> start!70916 (array_inv!17619 _keys!976)))

(assert (=> start!70916 true))

(declare-fun array_inv!17620 (array!45889) Bool)

(assert (=> start!70916 (and (array_inv!17620 _values!788) e!458110)))

(assert (=> start!70916 tp!46209))

(declare-fun b!823602 () Bool)

(assert (=> b!823602 (= e!458112 tp_is_empty!14863)))

(declare-fun mapIsEmpty!23911 () Bool)

(assert (=> mapIsEmpty!23911 mapRes!23911))

(declare-fun b!823603 () Bool)

(assert (=> b!823603 (= e!458113 tp_is_empty!14863)))

(assert (= (and start!70916 res!561644) b!823601))

(assert (= (and b!823601 res!561643) b!823599))

(assert (= (and b!823599 res!561646) b!823597))

(assert (= (and b!823597 res!561645) b!823600))

(assert (= (and b!823598 condMapEmpty!23911) mapIsEmpty!23911))

(assert (= (and b!823598 (not condMapEmpty!23911)) mapNonEmpty!23911))

(get-info :version)

(assert (= (and mapNonEmpty!23911 ((_ is ValueCellFull!7016) mapValue!23911)) b!823602))

(assert (= (and b!823598 ((_ is ValueCellFull!7016) mapDefault!23911)) b!823603))

(assert (= start!70916 b!823598))

(declare-fun m!765275 () Bool)

(assert (=> b!823597 m!765275))

(declare-fun m!765277 () Bool)

(assert (=> start!70916 m!765277))

(declare-fun m!765279 () Bool)

(assert (=> start!70916 m!765279))

(declare-fun m!765281 () Bool)

(assert (=> start!70916 m!765281))

(declare-fun m!765283 () Bool)

(assert (=> b!823599 m!765283))

(declare-fun m!765285 () Bool)

(assert (=> b!823600 m!765285))

(declare-fun m!765287 () Bool)

(assert (=> b!823600 m!765287))

(declare-fun m!765289 () Bool)

(assert (=> b!823600 m!765289))

(declare-fun m!765291 () Bool)

(assert (=> mapNonEmpty!23911 m!765291))

(check-sat (not b!823597) (not b!823600) (not b!823599) b_and!22023 tp_is_empty!14863 (not b_next!13153) (not mapNonEmpty!23911) (not start!70916))
(check-sat b_and!22023 (not b_next!13153))
