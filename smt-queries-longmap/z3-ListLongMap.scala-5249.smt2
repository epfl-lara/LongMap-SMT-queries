; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70760 () Bool)

(assert start!70760)

(declare-fun b_free!12901 () Bool)

(declare-fun b_next!12901 () Bool)

(assert (=> start!70760 (= b_free!12901 (not b_next!12901))))

(declare-fun tp!45438 () Bool)

(declare-fun b_and!21753 () Bool)

(assert (=> start!70760 (= tp!45438 b_and!21753)))

(declare-fun b!821009 () Bool)

(declare-fun e!456157 () Bool)

(declare-fun tp_is_empty!14611 () Bool)

(assert (=> b!821009 (= e!456157 tp_is_empty!14611)))

(declare-fun b!821010 () Bool)

(declare-fun e!456155 () Bool)

(declare-fun e!456160 () Bool)

(declare-fun mapRes!23518 () Bool)

(assert (=> b!821010 (= e!456155 (and e!456160 mapRes!23518))))

(declare-fun condMapEmpty!23518 () Bool)

(declare-datatypes ((V!24483 0))(
  ( (V!24484 (val!7353 Int)) )
))
(declare-datatypes ((ValueCell!6890 0))(
  ( (ValueCellFull!6890 (v!9783 V!24483)) (EmptyCell!6890) )
))
(declare-datatypes ((array!45421 0))(
  ( (array!45422 (arr!21759 (Array (_ BitVec 32) ValueCell!6890)) (size!22179 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45421)

(declare-fun mapDefault!23518 () ValueCell!6890)

(assert (=> b!821010 (= condMapEmpty!23518 (= (arr!21759 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6890)) mapDefault!23518)))))

(declare-fun mapNonEmpty!23518 () Bool)

(declare-fun tp!45439 () Bool)

(assert (=> mapNonEmpty!23518 (= mapRes!23518 (and tp!45439 e!456157))))

(declare-fun mapValue!23518 () ValueCell!6890)

(declare-fun mapKey!23518 () (_ BitVec 32))

(declare-fun mapRest!23518 () (Array (_ BitVec 32) ValueCell!6890))

(assert (=> mapNonEmpty!23518 (= (arr!21759 _values!788) (store mapRest!23518 mapKey!23518 mapValue!23518))))

(declare-fun res!559953 () Bool)

(declare-fun e!456159 () Bool)

(assert (=> start!70760 (=> (not res!559953) (not e!456159))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70760 (= res!559953 (validMask!0 mask!1312))))

(assert (=> start!70760 e!456159))

(assert (=> start!70760 tp_is_empty!14611))

(declare-datatypes ((array!45423 0))(
  ( (array!45424 (arr!21760 (Array (_ BitVec 32) (_ BitVec 64))) (size!22180 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45423)

(declare-fun array_inv!17421 (array!45423) Bool)

(assert (=> start!70760 (array_inv!17421 _keys!976)))

(assert (=> start!70760 true))

(declare-fun array_inv!17422 (array!45421) Bool)

(assert (=> start!70760 (and (array_inv!17422 _values!788) e!456155)))

(assert (=> start!70760 tp!45438))

(declare-fun b!821011 () Bool)

(declare-fun e!456161 () Bool)

(assert (=> b!821011 (= e!456161 true)))

(declare-datatypes ((tuple2!9598 0))(
  ( (tuple2!9599 (_1!4810 (_ BitVec 64)) (_2!4810 V!24483)) )
))
(declare-fun lt!368815 () tuple2!9598)

(declare-datatypes ((List!15397 0))(
  ( (Nil!15394) (Cons!15393 (h!16528 tuple2!9598) (t!21720 List!15397)) )
))
(declare-datatypes ((ListLongMap!8423 0))(
  ( (ListLongMap!8424 (toList!4227 List!15397)) )
))
(declare-fun lt!368812 () ListLongMap!8423)

(declare-fun lt!368811 () ListLongMap!8423)

(declare-fun lt!368819 () tuple2!9598)

(declare-fun +!1863 (ListLongMap!8423 tuple2!9598) ListLongMap!8423)

(assert (=> b!821011 (= lt!368812 (+!1863 (+!1863 lt!368811 lt!368819) lt!368815))))

(declare-fun lt!368813 () ListLongMap!8423)

(declare-fun lt!368818 () ListLongMap!8423)

(assert (=> b!821011 (= (+!1863 lt!368813 lt!368815) (+!1863 lt!368818 lt!368815))))

(declare-fun zeroValueBefore!34 () V!24483)

(declare-fun zeroValueAfter!34 () V!24483)

(declare-datatypes ((Unit!28004 0))(
  ( (Unit!28005) )
))
(declare-fun lt!368820 () Unit!28004)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!199 (ListLongMap!8423 (_ BitVec 64) V!24483 V!24483) Unit!28004)

(assert (=> b!821011 (= lt!368820 (addSameAsAddTwiceSameKeyDiffValues!199 lt!368813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!821011 (= lt!368815 (tuple2!9599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!456158 () Bool)

(assert (=> b!821011 e!456158))

(declare-fun res!559956 () Bool)

(assert (=> b!821011 (=> (not res!559956) (not e!456158))))

(declare-fun lt!368814 () ListLongMap!8423)

(assert (=> b!821011 (= res!559956 (= lt!368814 lt!368818))))

(assert (=> b!821011 (= lt!368818 (+!1863 lt!368813 lt!368819))))

(assert (=> b!821011 (= lt!368819 (tuple2!9599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun lt!368816 () ListLongMap!8423)

(declare-fun minValue!754 () V!24483)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2412 (array!45423 array!45421 (_ BitVec 32) (_ BitVec 32) V!24483 V!24483 (_ BitVec 32) Int) ListLongMap!8423)

(assert (=> b!821011 (= lt!368816 (getCurrentListMap!2412 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821011 (= lt!368814 (getCurrentListMap!2412 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23518 () Bool)

(assert (=> mapIsEmpty!23518 mapRes!23518))

(declare-fun b!821012 () Bool)

(assert (=> b!821012 (= e!456159 (not e!456161))))

(declare-fun res!559955 () Bool)

(assert (=> b!821012 (=> res!559955 e!456161)))

(assert (=> b!821012 (= res!559955 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!821012 (= lt!368813 lt!368811)))

(declare-fun lt!368817 () Unit!28004)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!406 (array!45423 array!45421 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24483 V!24483 V!24483 V!24483 (_ BitVec 32) Int) Unit!28004)

(assert (=> b!821012 (= lt!368817 (lemmaNoChangeToArrayThenSameMapNoExtras!406 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2318 (array!45423 array!45421 (_ BitVec 32) (_ BitVec 32) V!24483 V!24483 (_ BitVec 32) Int) ListLongMap!8423)

(assert (=> b!821012 (= lt!368811 (getCurrentListMapNoExtraKeys!2318 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821012 (= lt!368813 (getCurrentListMapNoExtraKeys!2318 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821013 () Bool)

(declare-fun res!559951 () Bool)

(assert (=> b!821013 (=> (not res!559951) (not e!456159))))

(declare-datatypes ((List!15398 0))(
  ( (Nil!15395) (Cons!15394 (h!16529 (_ BitVec 64)) (t!21721 List!15398)) )
))
(declare-fun arrayNoDuplicates!0 (array!45423 (_ BitVec 32) List!15398) Bool)

(assert (=> b!821013 (= res!559951 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15395))))

(declare-fun b!821014 () Bool)

(assert (=> b!821014 (= e!456160 tp_is_empty!14611)))

(declare-fun b!821015 () Bool)

(assert (=> b!821015 (= e!456158 (= lt!368816 (+!1863 lt!368811 (tuple2!9599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!821016 () Bool)

(declare-fun res!559952 () Bool)

(assert (=> b!821016 (=> (not res!559952) (not e!456159))))

(assert (=> b!821016 (= res!559952 (and (= (size!22179 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22180 _keys!976) (size!22179 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821017 () Bool)

(declare-fun res!559954 () Bool)

(assert (=> b!821017 (=> (not res!559954) (not e!456159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45423 (_ BitVec 32)) Bool)

(assert (=> b!821017 (= res!559954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70760 res!559953) b!821016))

(assert (= (and b!821016 res!559952) b!821017))

(assert (= (and b!821017 res!559954) b!821013))

(assert (= (and b!821013 res!559951) b!821012))

(assert (= (and b!821012 (not res!559955)) b!821011))

(assert (= (and b!821011 res!559956) b!821015))

(assert (= (and b!821010 condMapEmpty!23518) mapIsEmpty!23518))

(assert (= (and b!821010 (not condMapEmpty!23518)) mapNonEmpty!23518))

(get-info :version)

(assert (= (and mapNonEmpty!23518 ((_ is ValueCellFull!6890) mapValue!23518)) b!821009))

(assert (= (and b!821010 ((_ is ValueCellFull!6890) mapDefault!23518)) b!821014))

(assert (= start!70760 b!821010))

(declare-fun m!763245 () Bool)

(assert (=> start!70760 m!763245))

(declare-fun m!763247 () Bool)

(assert (=> start!70760 m!763247))

(declare-fun m!763249 () Bool)

(assert (=> start!70760 m!763249))

(declare-fun m!763251 () Bool)

(assert (=> mapNonEmpty!23518 m!763251))

(declare-fun m!763253 () Bool)

(assert (=> b!821012 m!763253))

(declare-fun m!763255 () Bool)

(assert (=> b!821012 m!763255))

(declare-fun m!763257 () Bool)

(assert (=> b!821012 m!763257))

(declare-fun m!763259 () Bool)

(assert (=> b!821017 m!763259))

(declare-fun m!763261 () Bool)

(assert (=> b!821013 m!763261))

(declare-fun m!763263 () Bool)

(assert (=> b!821015 m!763263))

(declare-fun m!763265 () Bool)

(assert (=> b!821011 m!763265))

(declare-fun m!763267 () Bool)

(assert (=> b!821011 m!763267))

(declare-fun m!763269 () Bool)

(assert (=> b!821011 m!763269))

(assert (=> b!821011 m!763265))

(declare-fun m!763271 () Bool)

(assert (=> b!821011 m!763271))

(declare-fun m!763273 () Bool)

(assert (=> b!821011 m!763273))

(declare-fun m!763275 () Bool)

(assert (=> b!821011 m!763275))

(declare-fun m!763277 () Bool)

(assert (=> b!821011 m!763277))

(declare-fun m!763279 () Bool)

(assert (=> b!821011 m!763279))

(check-sat (not b!821011) (not b_next!12901) tp_is_empty!14611 (not b!821013) (not start!70760) (not b!821017) b_and!21753 (not b!821015) (not mapNonEmpty!23518) (not b!821012))
(check-sat b_and!21753 (not b_next!12901))
