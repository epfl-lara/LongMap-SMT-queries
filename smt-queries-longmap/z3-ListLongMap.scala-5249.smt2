; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70596 () Bool)

(assert start!70596)

(declare-fun b_free!12903 () Bool)

(declare-fun b_next!12903 () Bool)

(assert (=> start!70596 (= b_free!12903 (not b_next!12903))))

(declare-fun tp!45444 () Bool)

(declare-fun b_and!21745 () Bool)

(assert (=> start!70596 (= tp!45444 b_and!21745)))

(declare-fun mapIsEmpty!23521 () Bool)

(declare-fun mapRes!23521 () Bool)

(assert (=> mapIsEmpty!23521 mapRes!23521))

(declare-fun res!559625 () Bool)

(declare-fun e!455601 () Bool)

(assert (=> start!70596 (=> (not res!559625) (not e!455601))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70596 (= res!559625 (validMask!0 mask!1312))))

(assert (=> start!70596 e!455601))

(declare-fun tp_is_empty!14613 () Bool)

(assert (=> start!70596 tp_is_empty!14613))

(declare-datatypes ((array!45420 0))(
  ( (array!45421 (arr!21763 (Array (_ BitVec 32) (_ BitVec 64))) (size!22184 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45420)

(declare-fun array_inv!17397 (array!45420) Bool)

(assert (=> start!70596 (array_inv!17397 _keys!976)))

(assert (=> start!70596 true))

(declare-datatypes ((V!24485 0))(
  ( (V!24486 (val!7354 Int)) )
))
(declare-datatypes ((ValueCell!6891 0))(
  ( (ValueCellFull!6891 (v!9784 V!24485)) (EmptyCell!6891) )
))
(declare-datatypes ((array!45422 0))(
  ( (array!45423 (arr!21764 (Array (_ BitVec 32) ValueCell!6891)) (size!22185 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45422)

(declare-fun e!455604 () Bool)

(declare-fun array_inv!17398 (array!45422) Bool)

(assert (=> start!70596 (and (array_inv!17398 _values!788) e!455604)))

(assert (=> start!70596 tp!45444))

(declare-fun b!820142 () Bool)

(declare-fun res!559623 () Bool)

(assert (=> b!820142 (=> (not res!559623) (not e!455601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45420 (_ BitVec 32)) Bool)

(assert (=> b!820142 (= res!559623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820143 () Bool)

(declare-fun res!559626 () Bool)

(assert (=> b!820143 (=> (not res!559626) (not e!455601))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820143 (= res!559626 (and (= (size!22185 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22184 _keys!976) (size!22185 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820144 () Bool)

(declare-fun e!455600 () Bool)

(assert (=> b!820144 (= e!455604 (and e!455600 mapRes!23521))))

(declare-fun condMapEmpty!23521 () Bool)

(declare-fun mapDefault!23521 () ValueCell!6891)

(assert (=> b!820144 (= condMapEmpty!23521 (= (arr!21764 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6891)) mapDefault!23521)))))

(declare-fun mapNonEmpty!23521 () Bool)

(declare-fun tp!45445 () Bool)

(declare-fun e!455598 () Bool)

(assert (=> mapNonEmpty!23521 (= mapRes!23521 (and tp!45445 e!455598))))

(declare-fun mapValue!23521 () ValueCell!6891)

(declare-fun mapRest!23521 () (Array (_ BitVec 32) ValueCell!6891))

(declare-fun mapKey!23521 () (_ BitVec 32))

(assert (=> mapNonEmpty!23521 (= (arr!21764 _values!788) (store mapRest!23521 mapKey!23521 mapValue!23521))))

(declare-fun b!820145 () Bool)

(declare-fun e!455603 () Bool)

(assert (=> b!820145 (= e!455601 (not e!455603))))

(declare-fun res!559627 () Bool)

(assert (=> b!820145 (=> res!559627 e!455603)))

(assert (=> b!820145 (= res!559627 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9686 0))(
  ( (tuple2!9687 (_1!4854 (_ BitVec 64)) (_2!4854 V!24485)) )
))
(declare-datatypes ((List!15509 0))(
  ( (Nil!15506) (Cons!15505 (h!16634 tuple2!9686) (t!21840 List!15509)) )
))
(declare-datatypes ((ListLongMap!8509 0))(
  ( (ListLongMap!8510 (toList!4270 List!15509)) )
))
(declare-fun lt!368495 () ListLongMap!8509)

(declare-fun lt!368496 () ListLongMap!8509)

(assert (=> b!820145 (= lt!368495 lt!368496)))

(declare-fun zeroValueBefore!34 () V!24485)

(declare-datatypes ((Unit!28017 0))(
  ( (Unit!28018) )
))
(declare-fun lt!368492 () Unit!28017)

(declare-fun zeroValueAfter!34 () V!24485)

(declare-fun minValue!754 () V!24485)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!407 (array!45420 array!45422 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24485 V!24485 V!24485 V!24485 (_ BitVec 32) Int) Unit!28017)

(assert (=> b!820145 (= lt!368492 (lemmaNoChangeToArrayThenSameMapNoExtras!407 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2297 (array!45420 array!45422 (_ BitVec 32) (_ BitVec 32) V!24485 V!24485 (_ BitVec 32) Int) ListLongMap!8509)

(assert (=> b!820145 (= lt!368496 (getCurrentListMapNoExtraKeys!2297 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820145 (= lt!368495 (getCurrentListMapNoExtraKeys!2297 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820146 () Bool)

(assert (=> b!820146 (= e!455600 tp_is_empty!14613)))

(declare-fun b!820147 () Bool)

(declare-fun res!559624 () Bool)

(assert (=> b!820147 (=> (not res!559624) (not e!455601))))

(declare-datatypes ((List!15510 0))(
  ( (Nil!15507) (Cons!15506 (h!16635 (_ BitVec 64)) (t!21841 List!15510)) )
))
(declare-fun arrayNoDuplicates!0 (array!45420 (_ BitVec 32) List!15510) Bool)

(assert (=> b!820147 (= res!559624 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15507))))

(declare-fun b!820148 () Bool)

(assert (=> b!820148 (= e!455598 tp_is_empty!14613)))

(declare-fun b!820149 () Bool)

(assert (=> b!820149 (= e!455603 true)))

(declare-fun lt!368487 () ListLongMap!8509)

(declare-fun lt!368488 () tuple2!9686)

(declare-fun lt!368491 () tuple2!9686)

(declare-fun +!1865 (ListLongMap!8509 tuple2!9686) ListLongMap!8509)

(assert (=> b!820149 (= lt!368487 (+!1865 (+!1865 lt!368496 lt!368491) lt!368488))))

(declare-fun lt!368493 () ListLongMap!8509)

(assert (=> b!820149 (= (+!1865 lt!368495 lt!368488) (+!1865 lt!368493 lt!368488))))

(declare-fun lt!368489 () Unit!28017)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!201 (ListLongMap!8509 (_ BitVec 64) V!24485 V!24485) Unit!28017)

(assert (=> b!820149 (= lt!368489 (addSameAsAddTwiceSameKeyDiffValues!201 lt!368495 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!820149 (= lt!368488 (tuple2!9687 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455599 () Bool)

(assert (=> b!820149 e!455599))

(declare-fun res!559628 () Bool)

(assert (=> b!820149 (=> (not res!559628) (not e!455599))))

(declare-fun lt!368494 () ListLongMap!8509)

(assert (=> b!820149 (= res!559628 (= lt!368494 lt!368493))))

(assert (=> b!820149 (= lt!368493 (+!1865 lt!368495 lt!368491))))

(assert (=> b!820149 (= lt!368491 (tuple2!9687 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun lt!368490 () ListLongMap!8509)

(declare-fun getCurrentListMap!2467 (array!45420 array!45422 (_ BitVec 32) (_ BitVec 32) V!24485 V!24485 (_ BitVec 32) Int) ListLongMap!8509)

(assert (=> b!820149 (= lt!368490 (getCurrentListMap!2467 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820149 (= lt!368494 (getCurrentListMap!2467 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820150 () Bool)

(assert (=> b!820150 (= e!455599 (= lt!368490 (+!1865 lt!368496 (tuple2!9687 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and start!70596 res!559625) b!820143))

(assert (= (and b!820143 res!559626) b!820142))

(assert (= (and b!820142 res!559623) b!820147))

(assert (= (and b!820147 res!559624) b!820145))

(assert (= (and b!820145 (not res!559627)) b!820149))

(assert (= (and b!820149 res!559628) b!820150))

(assert (= (and b!820144 condMapEmpty!23521) mapIsEmpty!23521))

(assert (= (and b!820144 (not condMapEmpty!23521)) mapNonEmpty!23521))

(get-info :version)

(assert (= (and mapNonEmpty!23521 ((_ is ValueCellFull!6891) mapValue!23521)) b!820148))

(assert (= (and b!820144 ((_ is ValueCellFull!6891) mapDefault!23521)) b!820146))

(assert (= start!70596 b!820144))

(declare-fun m!761999 () Bool)

(assert (=> b!820142 m!761999))

(declare-fun m!762001 () Bool)

(assert (=> b!820145 m!762001))

(declare-fun m!762003 () Bool)

(assert (=> b!820145 m!762003))

(declare-fun m!762005 () Bool)

(assert (=> b!820145 m!762005))

(declare-fun m!762007 () Bool)

(assert (=> b!820149 m!762007))

(declare-fun m!762009 () Bool)

(assert (=> b!820149 m!762009))

(declare-fun m!762011 () Bool)

(assert (=> b!820149 m!762011))

(assert (=> b!820149 m!762009))

(declare-fun m!762013 () Bool)

(assert (=> b!820149 m!762013))

(declare-fun m!762015 () Bool)

(assert (=> b!820149 m!762015))

(declare-fun m!762017 () Bool)

(assert (=> b!820149 m!762017))

(declare-fun m!762019 () Bool)

(assert (=> b!820149 m!762019))

(declare-fun m!762021 () Bool)

(assert (=> b!820149 m!762021))

(declare-fun m!762023 () Bool)

(assert (=> b!820147 m!762023))

(declare-fun m!762025 () Bool)

(assert (=> mapNonEmpty!23521 m!762025))

(declare-fun m!762027 () Bool)

(assert (=> start!70596 m!762027))

(declare-fun m!762029 () Bool)

(assert (=> start!70596 m!762029))

(declare-fun m!762031 () Bool)

(assert (=> start!70596 m!762031))

(declare-fun m!762033 () Bool)

(assert (=> b!820150 m!762033))

(check-sat (not start!70596) (not mapNonEmpty!23521) (not b!820145) (not b!820149) (not b_next!12903) b_and!21745 (not b!820142) (not b!820147) tp_is_empty!14613 (not b!820150))
(check-sat b_and!21745 (not b_next!12903))
