; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70674 () Bool)

(assert start!70674)

(declare-fun b_free!12835 () Bool)

(declare-fun b_next!12835 () Bool)

(assert (=> start!70674 (= b_free!12835 (not b_next!12835))))

(declare-fun tp!45237 () Bool)

(declare-fun b_and!21675 () Bool)

(assert (=> start!70674 (= tp!45237 b_and!21675)))

(declare-fun mapIsEmpty!23416 () Bool)

(declare-fun mapRes!23416 () Bool)

(assert (=> mapIsEmpty!23416 mapRes!23416))

(declare-fun b!819924 () Bool)

(declare-fun res!559269 () Bool)

(declare-fun e!455339 () Bool)

(assert (=> b!819924 (=> (not res!559269) (not e!455339))))

(declare-datatypes ((array!45289 0))(
  ( (array!45290 (arr!21694 (Array (_ BitVec 32) (_ BitVec 64))) (size!22114 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45289)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24395 0))(
  ( (V!24396 (val!7320 Int)) )
))
(declare-datatypes ((ValueCell!6857 0))(
  ( (ValueCellFull!6857 (v!9749 V!24395)) (EmptyCell!6857) )
))
(declare-datatypes ((array!45291 0))(
  ( (array!45292 (arr!21695 (Array (_ BitVec 32) ValueCell!6857)) (size!22115 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45291)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!819924 (= res!559269 (and (= (size!22115 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22114 _keys!976) (size!22115 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23416 () Bool)

(declare-fun tp!45238 () Bool)

(declare-fun e!455338 () Bool)

(assert (=> mapNonEmpty!23416 (= mapRes!23416 (and tp!45238 e!455338))))

(declare-fun mapValue!23416 () ValueCell!6857)

(declare-fun mapRest!23416 () (Array (_ BitVec 32) ValueCell!6857))

(declare-fun mapKey!23416 () (_ BitVec 32))

(assert (=> mapNonEmpty!23416 (= (arr!21695 _values!788) (store mapRest!23416 mapKey!23416 mapValue!23416))))

(declare-fun b!819925 () Bool)

(declare-fun e!455344 () Bool)

(declare-fun tp_is_empty!14545 () Bool)

(assert (=> b!819925 (= e!455344 tp_is_empty!14545)))

(declare-fun b!819926 () Bool)

(declare-fun res!559267 () Bool)

(assert (=> b!819926 (=> (not res!559267) (not e!455339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45289 (_ BitVec 32)) Bool)

(assert (=> b!819926 (= res!559267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!559265 () Bool)

(assert (=> start!70674 (=> (not res!559265) (not e!455339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70674 (= res!559265 (validMask!0 mask!1312))))

(assert (=> start!70674 e!455339))

(assert (=> start!70674 tp_is_empty!14545))

(declare-fun array_inv!17369 (array!45289) Bool)

(assert (=> start!70674 (array_inv!17369 _keys!976)))

(assert (=> start!70674 true))

(declare-fun e!455340 () Bool)

(declare-fun array_inv!17370 (array!45291) Bool)

(assert (=> start!70674 (and (array_inv!17370 _values!788) e!455340)))

(assert (=> start!70674 tp!45237))

(declare-fun b!819927 () Bool)

(declare-fun res!559268 () Bool)

(assert (=> b!819927 (=> (not res!559268) (not e!455339))))

(declare-datatypes ((List!15347 0))(
  ( (Nil!15344) (Cons!15343 (h!16478 (_ BitVec 64)) (t!21668 List!15347)) )
))
(declare-fun arrayNoDuplicates!0 (array!45289 (_ BitVec 32) List!15347) Bool)

(assert (=> b!819927 (= res!559268 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15344))))

(declare-fun b!819928 () Bool)

(assert (=> b!819928 (= e!455338 tp_is_empty!14545)))

(declare-fun b!819929 () Bool)

(declare-fun e!455341 () Bool)

(assert (=> b!819929 (= e!455341 true)))

(declare-datatypes ((tuple2!9540 0))(
  ( (tuple2!9541 (_1!4781 (_ BitVec 64)) (_2!4781 V!24395)) )
))
(declare-fun lt!367668 () tuple2!9540)

(declare-datatypes ((List!15348 0))(
  ( (Nil!15345) (Cons!15344 (h!16479 tuple2!9540) (t!21669 List!15348)) )
))
(declare-datatypes ((ListLongMap!8365 0))(
  ( (ListLongMap!8366 (toList!4198 List!15348)) )
))
(declare-fun lt!367674 () ListLongMap!8365)

(declare-fun lt!367670 () ListLongMap!8365)

(declare-fun lt!367673 () tuple2!9540)

(declare-fun +!1837 (ListLongMap!8365 tuple2!9540) ListLongMap!8365)

(assert (=> b!819929 (= lt!367674 (+!1837 (+!1837 lt!367670 lt!367673) lt!367668))))

(declare-fun lt!367675 () ListLongMap!8365)

(declare-fun lt!367667 () ListLongMap!8365)

(assert (=> b!819929 (= (+!1837 lt!367675 lt!367668) (+!1837 lt!367667 lt!367668))))

(declare-fun zeroValueBefore!34 () V!24395)

(declare-fun zeroValueAfter!34 () V!24395)

(declare-datatypes ((Unit!27946 0))(
  ( (Unit!27947) )
))
(declare-fun lt!367669 () Unit!27946)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!176 (ListLongMap!8365 (_ BitVec 64) V!24395 V!24395) Unit!27946)

(assert (=> b!819929 (= lt!367669 (addSameAsAddTwiceSameKeyDiffValues!176 lt!367675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819929 (= lt!367668 (tuple2!9541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455342 () Bool)

(assert (=> b!819929 e!455342))

(declare-fun res!559270 () Bool)

(assert (=> b!819929 (=> (not res!559270) (not e!455342))))

(declare-fun lt!367672 () ListLongMap!8365)

(assert (=> b!819929 (= res!559270 (= lt!367672 lt!367667))))

(assert (=> b!819929 (= lt!367667 (+!1837 lt!367675 lt!367673))))

(assert (=> b!819929 (= lt!367673 (tuple2!9541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!24395)

(declare-fun lt!367676 () ListLongMap!8365)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2389 (array!45289 array!45291 (_ BitVec 32) (_ BitVec 32) V!24395 V!24395 (_ BitVec 32) Int) ListLongMap!8365)

(assert (=> b!819929 (= lt!367676 (getCurrentListMap!2389 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819929 (= lt!367672 (getCurrentListMap!2389 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819930 () Bool)

(assert (=> b!819930 (= e!455342 (= lt!367676 (+!1837 lt!367670 (tuple2!9541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819931 () Bool)

(assert (=> b!819931 (= e!455340 (and e!455344 mapRes!23416))))

(declare-fun condMapEmpty!23416 () Bool)

(declare-fun mapDefault!23416 () ValueCell!6857)

(assert (=> b!819931 (= condMapEmpty!23416 (= (arr!21695 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6857)) mapDefault!23416)))))

(declare-fun b!819932 () Bool)

(assert (=> b!819932 (= e!455339 (not e!455341))))

(declare-fun res!559266 () Bool)

(assert (=> b!819932 (=> res!559266 e!455341)))

(assert (=> b!819932 (= res!559266 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819932 (= lt!367675 lt!367670)))

(declare-fun lt!367671 () Unit!27946)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!382 (array!45289 array!45291 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24395 V!24395 V!24395 V!24395 (_ BitVec 32) Int) Unit!27946)

(assert (=> b!819932 (= lt!367671 (lemmaNoChangeToArrayThenSameMapNoExtras!382 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2294 (array!45289 array!45291 (_ BitVec 32) (_ BitVec 32) V!24395 V!24395 (_ BitVec 32) Int) ListLongMap!8365)

(assert (=> b!819932 (= lt!367670 (getCurrentListMapNoExtraKeys!2294 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819932 (= lt!367675 (getCurrentListMapNoExtraKeys!2294 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70674 res!559265) b!819924))

(assert (= (and b!819924 res!559269) b!819926))

(assert (= (and b!819926 res!559267) b!819927))

(assert (= (and b!819927 res!559268) b!819932))

(assert (= (and b!819932 (not res!559266)) b!819929))

(assert (= (and b!819929 res!559270) b!819930))

(assert (= (and b!819931 condMapEmpty!23416) mapIsEmpty!23416))

(assert (= (and b!819931 (not condMapEmpty!23416)) mapNonEmpty!23416))

(get-info :version)

(assert (= (and mapNonEmpty!23416 ((_ is ValueCellFull!6857) mapValue!23416)) b!819928))

(assert (= (and b!819931 ((_ is ValueCellFull!6857) mapDefault!23416)) b!819925))

(assert (= start!70674 b!819931))

(declare-fun m!761819 () Bool)

(assert (=> b!819927 m!761819))

(declare-fun m!761821 () Bool)

(assert (=> b!819926 m!761821))

(declare-fun m!761823 () Bool)

(assert (=> b!819932 m!761823))

(declare-fun m!761825 () Bool)

(assert (=> b!819932 m!761825))

(declare-fun m!761827 () Bool)

(assert (=> b!819932 m!761827))

(declare-fun m!761829 () Bool)

(assert (=> b!819929 m!761829))

(declare-fun m!761831 () Bool)

(assert (=> b!819929 m!761831))

(declare-fun m!761833 () Bool)

(assert (=> b!819929 m!761833))

(declare-fun m!761835 () Bool)

(assert (=> b!819929 m!761835))

(declare-fun m!761837 () Bool)

(assert (=> b!819929 m!761837))

(declare-fun m!761839 () Bool)

(assert (=> b!819929 m!761839))

(declare-fun m!761841 () Bool)

(assert (=> b!819929 m!761841))

(declare-fun m!761843 () Bool)

(assert (=> b!819929 m!761843))

(assert (=> b!819929 m!761841))

(declare-fun m!761845 () Bool)

(assert (=> mapNonEmpty!23416 m!761845))

(declare-fun m!761847 () Bool)

(assert (=> start!70674 m!761847))

(declare-fun m!761849 () Bool)

(assert (=> start!70674 m!761849))

(declare-fun m!761851 () Bool)

(assert (=> start!70674 m!761851))

(declare-fun m!761853 () Bool)

(assert (=> b!819930 m!761853))

(check-sat tp_is_empty!14545 (not b!819930) (not start!70674) (not b!819926) (not b!819929) (not b_next!12835) (not b!819927) b_and!21675 (not mapNonEmpty!23416) (not b!819932))
(check-sat b_and!21675 (not b_next!12835))
