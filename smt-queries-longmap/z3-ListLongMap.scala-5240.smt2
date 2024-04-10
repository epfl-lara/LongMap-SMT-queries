; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70522 () Bool)

(assert start!70522)

(declare-fun b_free!12849 () Bool)

(declare-fun b_next!12849 () Bool)

(assert (=> start!70522 (= b_free!12849 (not b_next!12849))))

(declare-fun tp!45279 () Bool)

(declare-fun b_and!21679 () Bool)

(assert (=> start!70522 (= tp!45279 b_and!21679)))

(declare-fun b!819219 () Bool)

(declare-fun e!454909 () Bool)

(declare-fun tp_is_empty!14559 () Bool)

(assert (=> b!819219 (= e!454909 tp_is_empty!14559)))

(declare-fun mapIsEmpty!23437 () Bool)

(declare-fun mapRes!23437 () Bool)

(assert (=> mapIsEmpty!23437 mapRes!23437))

(declare-fun res!559047 () Bool)

(declare-fun e!454907 () Bool)

(assert (=> start!70522 (=> (not res!559047) (not e!454907))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70522 (= res!559047 (validMask!0 mask!1312))))

(assert (=> start!70522 e!454907))

(assert (=> start!70522 tp_is_empty!14559))

(declare-datatypes ((array!45314 0))(
  ( (array!45315 (arr!21711 (Array (_ BitVec 32) (_ BitVec 64))) (size!22132 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45314)

(declare-fun array_inv!17355 (array!45314) Bool)

(assert (=> start!70522 (array_inv!17355 _keys!976)))

(assert (=> start!70522 true))

(declare-datatypes ((V!24413 0))(
  ( (V!24414 (val!7327 Int)) )
))
(declare-datatypes ((ValueCell!6864 0))(
  ( (ValueCellFull!6864 (v!9756 V!24413)) (EmptyCell!6864) )
))
(declare-datatypes ((array!45316 0))(
  ( (array!45317 (arr!21712 (Array (_ BitVec 32) ValueCell!6864)) (size!22133 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45316)

(declare-fun e!454913 () Bool)

(declare-fun array_inv!17356 (array!45316) Bool)

(assert (=> start!70522 (and (array_inv!17356 _values!788) e!454913)))

(assert (=> start!70522 tp!45279))

(declare-fun b!819220 () Bool)

(declare-fun res!559049 () Bool)

(assert (=> b!819220 (=> (not res!559049) (not e!454907))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!819220 (= res!559049 (and (= (size!22133 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22132 _keys!976) (size!22133 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun zeroValueAfter!34 () V!24413)

(declare-datatypes ((tuple2!9638 0))(
  ( (tuple2!9639 (_1!4830 (_ BitVec 64)) (_2!4830 V!24413)) )
))
(declare-datatypes ((List!15467 0))(
  ( (Nil!15464) (Cons!15463 (h!16592 tuple2!9638) (t!21796 List!15467)) )
))
(declare-datatypes ((ListLongMap!8461 0))(
  ( (ListLongMap!8462 (toList!4246 List!15467)) )
))
(declare-fun lt!367525 () ListLongMap!8461)

(declare-fun lt!367527 () ListLongMap!8461)

(declare-fun e!454910 () Bool)

(declare-fun b!819221 () Bool)

(declare-fun +!1843 (ListLongMap!8461 tuple2!9638) ListLongMap!8461)

(assert (=> b!819221 (= e!454910 (= lt!367527 (+!1843 lt!367525 (tuple2!9639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819222 () Bool)

(declare-fun e!454911 () Bool)

(assert (=> b!819222 (= e!454907 (not e!454911))))

(declare-fun res!559046 () Bool)

(assert (=> b!819222 (=> res!559046 e!454911)))

(assert (=> b!819222 (= res!559046 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!367532 () ListLongMap!8461)

(assert (=> b!819222 (= lt!367532 lt!367525)))

(declare-fun zeroValueBefore!34 () V!24413)

(declare-fun minValue!754 () V!24413)

(declare-datatypes ((Unit!27969 0))(
  ( (Unit!27970) )
))
(declare-fun lt!367528 () Unit!27969)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!389 (array!45314 array!45316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24413 V!24413 V!24413 V!24413 (_ BitVec 32) Int) Unit!27969)

(assert (=> b!819222 (= lt!367528 (lemmaNoChangeToArrayThenSameMapNoExtras!389 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2279 (array!45314 array!45316 (_ BitVec 32) (_ BitVec 32) V!24413 V!24413 (_ BitVec 32) Int) ListLongMap!8461)

(assert (=> b!819222 (= lt!367525 (getCurrentListMapNoExtraKeys!2279 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819222 (= lt!367532 (getCurrentListMapNoExtraKeys!2279 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819223 () Bool)

(declare-fun res!559045 () Bool)

(assert (=> b!819223 (=> (not res!559045) (not e!454907))))

(declare-datatypes ((List!15468 0))(
  ( (Nil!15465) (Cons!15464 (h!16593 (_ BitVec 64)) (t!21797 List!15468)) )
))
(declare-fun arrayNoDuplicates!0 (array!45314 (_ BitVec 32) List!15468) Bool)

(assert (=> b!819223 (= res!559045 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15465))))

(declare-fun mapNonEmpty!23437 () Bool)

(declare-fun tp!45280 () Bool)

(declare-fun e!454912 () Bool)

(assert (=> mapNonEmpty!23437 (= mapRes!23437 (and tp!45280 e!454912))))

(declare-fun mapRest!23437 () (Array (_ BitVec 32) ValueCell!6864))

(declare-fun mapValue!23437 () ValueCell!6864)

(declare-fun mapKey!23437 () (_ BitVec 32))

(assert (=> mapNonEmpty!23437 (= (arr!21712 _values!788) (store mapRest!23437 mapKey!23437 mapValue!23437))))

(declare-fun b!819224 () Bool)

(assert (=> b!819224 (= e!454913 (and e!454909 mapRes!23437))))

(declare-fun condMapEmpty!23437 () Bool)

(declare-fun mapDefault!23437 () ValueCell!6864)

(assert (=> b!819224 (= condMapEmpty!23437 (= (arr!21712 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6864)) mapDefault!23437)))))

(declare-fun b!819225 () Bool)

(declare-fun res!559050 () Bool)

(assert (=> b!819225 (=> (not res!559050) (not e!454907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45314 (_ BitVec 32)) Bool)

(assert (=> b!819225 (= res!559050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819226 () Bool)

(assert (=> b!819226 (= e!454911 true)))

(declare-fun lt!367526 () tuple2!9638)

(declare-fun lt!367531 () tuple2!9638)

(declare-fun lt!367529 () ListLongMap!8461)

(assert (=> b!819226 (= lt!367529 (+!1843 (+!1843 lt!367525 lt!367531) lt!367526))))

(declare-fun lt!367524 () ListLongMap!8461)

(assert (=> b!819226 (= (+!1843 lt!367532 lt!367526) (+!1843 lt!367524 lt!367526))))

(declare-fun lt!367523 () Unit!27969)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!182 (ListLongMap!8461 (_ BitVec 64) V!24413 V!24413) Unit!27969)

(assert (=> b!819226 (= lt!367523 (addSameAsAddTwiceSameKeyDiffValues!182 lt!367532 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819226 (= lt!367526 (tuple2!9639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!819226 e!454910))

(declare-fun res!559048 () Bool)

(assert (=> b!819226 (=> (not res!559048) (not e!454910))))

(declare-fun lt!367530 () ListLongMap!8461)

(assert (=> b!819226 (= res!559048 (= lt!367530 lt!367524))))

(assert (=> b!819226 (= lt!367524 (+!1843 lt!367532 lt!367531))))

(assert (=> b!819226 (= lt!367531 (tuple2!9639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2448 (array!45314 array!45316 (_ BitVec 32) (_ BitVec 32) V!24413 V!24413 (_ BitVec 32) Int) ListLongMap!8461)

(assert (=> b!819226 (= lt!367527 (getCurrentListMap!2448 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819226 (= lt!367530 (getCurrentListMap!2448 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819227 () Bool)

(assert (=> b!819227 (= e!454912 tp_is_empty!14559)))

(assert (= (and start!70522 res!559047) b!819220))

(assert (= (and b!819220 res!559049) b!819225))

(assert (= (and b!819225 res!559050) b!819223))

(assert (= (and b!819223 res!559045) b!819222))

(assert (= (and b!819222 (not res!559046)) b!819226))

(assert (= (and b!819226 res!559048) b!819221))

(assert (= (and b!819224 condMapEmpty!23437) mapIsEmpty!23437))

(assert (= (and b!819224 (not condMapEmpty!23437)) mapNonEmpty!23437))

(get-info :version)

(assert (= (and mapNonEmpty!23437 ((_ is ValueCellFull!6864) mapValue!23437)) b!819227))

(assert (= (and b!819224 ((_ is ValueCellFull!6864) mapDefault!23437)) b!819219))

(assert (= start!70522 b!819224))

(declare-fun m!760789 () Bool)

(assert (=> b!819226 m!760789))

(declare-fun m!760791 () Bool)

(assert (=> b!819226 m!760791))

(declare-fun m!760793 () Bool)

(assert (=> b!819226 m!760793))

(declare-fun m!760795 () Bool)

(assert (=> b!819226 m!760795))

(declare-fun m!760797 () Bool)

(assert (=> b!819226 m!760797))

(declare-fun m!760799 () Bool)

(assert (=> b!819226 m!760799))

(declare-fun m!760801 () Bool)

(assert (=> b!819226 m!760801))

(assert (=> b!819226 m!760789))

(declare-fun m!760803 () Bool)

(assert (=> b!819226 m!760803))

(declare-fun m!760805 () Bool)

(assert (=> start!70522 m!760805))

(declare-fun m!760807 () Bool)

(assert (=> start!70522 m!760807))

(declare-fun m!760809 () Bool)

(assert (=> start!70522 m!760809))

(declare-fun m!760811 () Bool)

(assert (=> mapNonEmpty!23437 m!760811))

(declare-fun m!760813 () Bool)

(assert (=> b!819225 m!760813))

(declare-fun m!760815 () Bool)

(assert (=> b!819221 m!760815))

(declare-fun m!760817 () Bool)

(assert (=> b!819222 m!760817))

(declare-fun m!760819 () Bool)

(assert (=> b!819222 m!760819))

(declare-fun m!760821 () Bool)

(assert (=> b!819222 m!760821))

(declare-fun m!760823 () Bool)

(assert (=> b!819223 m!760823))

(check-sat (not b!819223) (not mapNonEmpty!23437) (not b_next!12849) b_and!21679 (not start!70522) (not b!819226) (not b!819221) (not b!819222) (not b!819225) tp_is_empty!14559)
(check-sat b_and!21679 (not b_next!12849))
