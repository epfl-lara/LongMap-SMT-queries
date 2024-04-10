; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70560 () Bool)

(assert start!70560)

(declare-fun b_free!12867 () Bool)

(declare-fun b_next!12867 () Bool)

(assert (=> start!70560 (= b_free!12867 (not b_next!12867))))

(declare-fun tp!45336 () Bool)

(declare-fun b_and!21709 () Bool)

(assert (=> start!70560 (= tp!45336 b_and!21709)))

(declare-fun res!559303 () Bool)

(declare-fun e!455223 () Bool)

(assert (=> start!70560 (=> (not res!559303) (not e!455223))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70560 (= res!559303 (validMask!0 mask!1312))))

(assert (=> start!70560 e!455223))

(declare-fun tp_is_empty!14577 () Bool)

(assert (=> start!70560 tp_is_empty!14577))

(declare-datatypes ((array!45352 0))(
  ( (array!45353 (arr!21729 (Array (_ BitVec 32) (_ BitVec 64))) (size!22150 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45352)

(declare-fun array_inv!17367 (array!45352) Bool)

(assert (=> start!70560 (array_inv!17367 _keys!976)))

(assert (=> start!70560 true))

(declare-datatypes ((V!24437 0))(
  ( (V!24438 (val!7336 Int)) )
))
(declare-datatypes ((ValueCell!6873 0))(
  ( (ValueCellFull!6873 (v!9766 V!24437)) (EmptyCell!6873) )
))
(declare-datatypes ((array!45354 0))(
  ( (array!45355 (arr!21730 (Array (_ BitVec 32) ValueCell!6873)) (size!22151 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45354)

(declare-fun e!455225 () Bool)

(declare-fun array_inv!17368 (array!45354) Bool)

(assert (=> start!70560 (and (array_inv!17368 _values!788) e!455225)))

(assert (=> start!70560 tp!45336))

(declare-fun b!819656 () Bool)

(declare-fun e!455222 () Bool)

(assert (=> b!819656 (= e!455222 tp_is_empty!14577)))

(declare-fun b!819657 () Bool)

(declare-fun res!559304 () Bool)

(assert (=> b!819657 (=> (not res!559304) (not e!455223))))

(declare-datatypes ((List!15482 0))(
  ( (Nil!15479) (Cons!15478 (h!16607 (_ BitVec 64)) (t!21813 List!15482)) )
))
(declare-fun arrayNoDuplicates!0 (array!45352 (_ BitVec 32) List!15482) Bool)

(assert (=> b!819657 (= res!559304 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15479))))

(declare-fun mapIsEmpty!23467 () Bool)

(declare-fun mapRes!23467 () Bool)

(assert (=> mapIsEmpty!23467 mapRes!23467))

(declare-fun b!819658 () Bool)

(declare-fun res!559299 () Bool)

(assert (=> b!819658 (=> (not res!559299) (not e!455223))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!819658 (= res!559299 (and (= (size!22151 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22150 _keys!976) (size!22151 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819659 () Bool)

(declare-fun e!455220 () Bool)

(assert (=> b!819659 (= e!455220 true)))

(declare-datatypes ((tuple2!9656 0))(
  ( (tuple2!9657 (_1!4839 (_ BitVec 64)) (_2!4839 V!24437)) )
))
(declare-fun lt!367950 () tuple2!9656)

(declare-fun lt!367955 () tuple2!9656)

(declare-datatypes ((List!15483 0))(
  ( (Nil!15480) (Cons!15479 (h!16608 tuple2!9656) (t!21814 List!15483)) )
))
(declare-datatypes ((ListLongMap!8479 0))(
  ( (ListLongMap!8480 (toList!4255 List!15483)) )
))
(declare-fun lt!367951 () ListLongMap!8479)

(declare-fun lt!367953 () ListLongMap!8479)

(declare-fun +!1851 (ListLongMap!8479 tuple2!9656) ListLongMap!8479)

(assert (=> b!819659 (= lt!367953 (+!1851 (+!1851 lt!367951 lt!367950) lt!367955))))

(declare-fun lt!367949 () ListLongMap!8479)

(declare-fun lt!367956 () ListLongMap!8479)

(assert (=> b!819659 (= (+!1851 lt!367949 lt!367955) (+!1851 lt!367956 lt!367955))))

(declare-fun zeroValueBefore!34 () V!24437)

(declare-datatypes ((Unit!27989 0))(
  ( (Unit!27990) )
))
(declare-fun lt!367948 () Unit!27989)

(declare-fun zeroValueAfter!34 () V!24437)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!190 (ListLongMap!8479 (_ BitVec 64) V!24437 V!24437) Unit!27989)

(assert (=> b!819659 (= lt!367948 (addSameAsAddTwiceSameKeyDiffValues!190 lt!367949 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819659 (= lt!367955 (tuple2!9657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455221 () Bool)

(assert (=> b!819659 e!455221))

(declare-fun res!559302 () Bool)

(assert (=> b!819659 (=> (not res!559302) (not e!455221))))

(declare-fun lt!367947 () ListLongMap!8479)

(assert (=> b!819659 (= res!559302 (= lt!367947 lt!367956))))

(assert (=> b!819659 (= lt!367956 (+!1851 lt!367949 lt!367950))))

(assert (=> b!819659 (= lt!367950 (tuple2!9657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!24437)

(declare-fun defaultEntry!796 () Int)

(declare-fun lt!367952 () ListLongMap!8479)

(declare-fun getCurrentListMap!2456 (array!45352 array!45354 (_ BitVec 32) (_ BitVec 32) V!24437 V!24437 (_ BitVec 32) Int) ListLongMap!8479)

(assert (=> b!819659 (= lt!367952 (getCurrentListMap!2456 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819659 (= lt!367947 (getCurrentListMap!2456 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819660 () Bool)

(assert (=> b!819660 (= e!455221 (= lt!367952 (+!1851 lt!367951 (tuple2!9657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun mapNonEmpty!23467 () Bool)

(declare-fun tp!45337 () Bool)

(assert (=> mapNonEmpty!23467 (= mapRes!23467 (and tp!45337 e!455222))))

(declare-fun mapValue!23467 () ValueCell!6873)

(declare-fun mapRest!23467 () (Array (_ BitVec 32) ValueCell!6873))

(declare-fun mapKey!23467 () (_ BitVec 32))

(assert (=> mapNonEmpty!23467 (= (arr!21730 _values!788) (store mapRest!23467 mapKey!23467 mapValue!23467))))

(declare-fun b!819661 () Bool)

(declare-fun res!559300 () Bool)

(assert (=> b!819661 (=> (not res!559300) (not e!455223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45352 (_ BitVec 32)) Bool)

(assert (=> b!819661 (= res!559300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819662 () Bool)

(declare-fun e!455224 () Bool)

(assert (=> b!819662 (= e!455225 (and e!455224 mapRes!23467))))

(declare-fun condMapEmpty!23467 () Bool)

(declare-fun mapDefault!23467 () ValueCell!6873)

(assert (=> b!819662 (= condMapEmpty!23467 (= (arr!21730 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6873)) mapDefault!23467)))))

(declare-fun b!819663 () Bool)

(assert (=> b!819663 (= e!455224 tp_is_empty!14577)))

(declare-fun b!819664 () Bool)

(assert (=> b!819664 (= e!455223 (not e!455220))))

(declare-fun res!559301 () Bool)

(assert (=> b!819664 (=> res!559301 e!455220)))

(assert (=> b!819664 (= res!559301 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819664 (= lt!367949 lt!367951)))

(declare-fun lt!367954 () Unit!27989)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!396 (array!45352 array!45354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24437 V!24437 V!24437 V!24437 (_ BitVec 32) Int) Unit!27989)

(assert (=> b!819664 (= lt!367954 (lemmaNoChangeToArrayThenSameMapNoExtras!396 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2286 (array!45352 array!45354 (_ BitVec 32) (_ BitVec 32) V!24437 V!24437 (_ BitVec 32) Int) ListLongMap!8479)

(assert (=> b!819664 (= lt!367951 (getCurrentListMapNoExtraKeys!2286 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819664 (= lt!367949 (getCurrentListMapNoExtraKeys!2286 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70560 res!559303) b!819658))

(assert (= (and b!819658 res!559299) b!819661))

(assert (= (and b!819661 res!559300) b!819657))

(assert (= (and b!819657 res!559304) b!819664))

(assert (= (and b!819664 (not res!559301)) b!819659))

(assert (= (and b!819659 res!559302) b!819660))

(assert (= (and b!819662 condMapEmpty!23467) mapIsEmpty!23467))

(assert (= (and b!819662 (not condMapEmpty!23467)) mapNonEmpty!23467))

(get-info :version)

(assert (= (and mapNonEmpty!23467 ((_ is ValueCellFull!6873) mapValue!23467)) b!819656))

(assert (= (and b!819662 ((_ is ValueCellFull!6873) mapDefault!23467)) b!819663))

(assert (= start!70560 b!819662))

(declare-fun m!761351 () Bool)

(assert (=> b!819657 m!761351))

(declare-fun m!761353 () Bool)

(assert (=> mapNonEmpty!23467 m!761353))

(declare-fun m!761355 () Bool)

(assert (=> b!819661 m!761355))

(declare-fun m!761357 () Bool)

(assert (=> b!819660 m!761357))

(declare-fun m!761359 () Bool)

(assert (=> b!819664 m!761359))

(declare-fun m!761361 () Bool)

(assert (=> b!819664 m!761361))

(declare-fun m!761363 () Bool)

(assert (=> b!819664 m!761363))

(declare-fun m!761365 () Bool)

(assert (=> start!70560 m!761365))

(declare-fun m!761367 () Bool)

(assert (=> start!70560 m!761367))

(declare-fun m!761369 () Bool)

(assert (=> start!70560 m!761369))

(declare-fun m!761371 () Bool)

(assert (=> b!819659 m!761371))

(declare-fun m!761373 () Bool)

(assert (=> b!819659 m!761373))

(declare-fun m!761375 () Bool)

(assert (=> b!819659 m!761375))

(declare-fun m!761377 () Bool)

(assert (=> b!819659 m!761377))

(declare-fun m!761379 () Bool)

(assert (=> b!819659 m!761379))

(assert (=> b!819659 m!761371))

(declare-fun m!761381 () Bool)

(assert (=> b!819659 m!761381))

(declare-fun m!761383 () Bool)

(assert (=> b!819659 m!761383))

(declare-fun m!761385 () Bool)

(assert (=> b!819659 m!761385))

(check-sat (not start!70560) (not b_next!12867) (not b!819664) (not b!819659) tp_is_empty!14577 (not mapNonEmpty!23467) (not b!819661) (not b!819657) b_and!21709 (not b!819660))
(check-sat b_and!21709 (not b_next!12867))
