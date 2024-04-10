; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70554 () Bool)

(assert start!70554)

(declare-fun b_free!12861 () Bool)

(declare-fun b_next!12861 () Bool)

(assert (=> start!70554 (= b_free!12861 (not b_next!12861))))

(declare-fun tp!45318 () Bool)

(declare-fun b_and!21703 () Bool)

(assert (=> start!70554 (= tp!45318 b_and!21703)))

(declare-fun e!455161 () Bool)

(declare-datatypes ((V!24429 0))(
  ( (V!24430 (val!7333 Int)) )
))
(declare-datatypes ((tuple2!9650 0))(
  ( (tuple2!9651 (_1!4836 (_ BitVec 64)) (_2!4836 V!24429)) )
))
(declare-datatypes ((List!15477 0))(
  ( (Nil!15474) (Cons!15473 (h!16602 tuple2!9650) (t!21808 List!15477)) )
))
(declare-datatypes ((ListLongMap!8473 0))(
  ( (ListLongMap!8474 (toList!4252 List!15477)) )
))
(declare-fun lt!367864 () ListLongMap!8473)

(declare-fun zeroValueAfter!34 () V!24429)

(declare-fun lt!367858 () ListLongMap!8473)

(declare-fun b!819575 () Bool)

(declare-fun +!1848 (ListLongMap!8473 tuple2!9650) ListLongMap!8473)

(assert (=> b!819575 (= e!455161 (= lt!367858 (+!1848 lt!367864 (tuple2!9651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819576 () Bool)

(declare-fun e!455157 () Bool)

(declare-fun tp_is_empty!14571 () Bool)

(assert (=> b!819576 (= e!455157 tp_is_empty!14571)))

(declare-fun b!819577 () Bool)

(declare-fun e!455160 () Bool)

(assert (=> b!819577 (= e!455160 tp_is_empty!14571)))

(declare-fun b!819578 () Bool)

(declare-fun res!559248 () Bool)

(declare-fun e!455163 () Bool)

(assert (=> b!819578 (=> (not res!559248) (not e!455163))))

(declare-datatypes ((array!45340 0))(
  ( (array!45341 (arr!21723 (Array (_ BitVec 32) (_ BitVec 64))) (size!22144 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45340)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45340 (_ BitVec 32)) Bool)

(assert (=> b!819578 (= res!559248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23458 () Bool)

(declare-fun mapRes!23458 () Bool)

(assert (=> mapIsEmpty!23458 mapRes!23458))

(declare-fun res!559249 () Bool)

(assert (=> start!70554 (=> (not res!559249) (not e!455163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70554 (= res!559249 (validMask!0 mask!1312))))

(assert (=> start!70554 e!455163))

(assert (=> start!70554 tp_is_empty!14571))

(declare-fun array_inv!17363 (array!45340) Bool)

(assert (=> start!70554 (array_inv!17363 _keys!976)))

(assert (=> start!70554 true))

(declare-datatypes ((ValueCell!6870 0))(
  ( (ValueCellFull!6870 (v!9763 V!24429)) (EmptyCell!6870) )
))
(declare-datatypes ((array!45342 0))(
  ( (array!45343 (arr!21724 (Array (_ BitVec 32) ValueCell!6870)) (size!22145 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45342)

(declare-fun e!455159 () Bool)

(declare-fun array_inv!17364 (array!45342) Bool)

(assert (=> start!70554 (and (array_inv!17364 _values!788) e!455159)))

(assert (=> start!70554 tp!45318))

(declare-fun mapNonEmpty!23458 () Bool)

(declare-fun tp!45319 () Bool)

(assert (=> mapNonEmpty!23458 (= mapRes!23458 (and tp!45319 e!455160))))

(declare-fun mapKey!23458 () (_ BitVec 32))

(declare-fun mapValue!23458 () ValueCell!6870)

(declare-fun mapRest!23458 () (Array (_ BitVec 32) ValueCell!6870))

(assert (=> mapNonEmpty!23458 (= (arr!21724 _values!788) (store mapRest!23458 mapKey!23458 mapValue!23458))))

(declare-fun b!819579 () Bool)

(declare-fun res!559250 () Bool)

(assert (=> b!819579 (=> (not res!559250) (not e!455163))))

(declare-datatypes ((List!15478 0))(
  ( (Nil!15475) (Cons!15474 (h!16603 (_ BitVec 64)) (t!21809 List!15478)) )
))
(declare-fun arrayNoDuplicates!0 (array!45340 (_ BitVec 32) List!15478) Bool)

(assert (=> b!819579 (= res!559250 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15475))))

(declare-fun b!819580 () Bool)

(assert (=> b!819580 (= e!455159 (and e!455157 mapRes!23458))))

(declare-fun condMapEmpty!23458 () Bool)

(declare-fun mapDefault!23458 () ValueCell!6870)

(assert (=> b!819580 (= condMapEmpty!23458 (= (arr!21724 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6870)) mapDefault!23458)))))

(declare-fun b!819581 () Bool)

(declare-fun e!455162 () Bool)

(assert (=> b!819581 (= e!455162 true)))

(declare-fun lt!367866 () tuple2!9650)

(declare-fun lt!367865 () tuple2!9650)

(declare-fun lt!367857 () ListLongMap!8473)

(assert (=> b!819581 (= lt!367857 (+!1848 (+!1848 lt!367864 lt!367865) lt!367866))))

(declare-fun lt!367862 () ListLongMap!8473)

(declare-fun lt!367863 () ListLongMap!8473)

(assert (=> b!819581 (= (+!1848 lt!367862 lt!367866) (+!1848 lt!367863 lt!367866))))

(declare-fun zeroValueBefore!34 () V!24429)

(declare-datatypes ((Unit!27983 0))(
  ( (Unit!27984) )
))
(declare-fun lt!367859 () Unit!27983)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!187 (ListLongMap!8473 (_ BitVec 64) V!24429 V!24429) Unit!27983)

(assert (=> b!819581 (= lt!367859 (addSameAsAddTwiceSameKeyDiffValues!187 lt!367862 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819581 (= lt!367866 (tuple2!9651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!819581 e!455161))

(declare-fun res!559246 () Bool)

(assert (=> b!819581 (=> (not res!559246) (not e!455161))))

(declare-fun lt!367860 () ListLongMap!8473)

(assert (=> b!819581 (= res!559246 (= lt!367860 lt!367863))))

(assert (=> b!819581 (= lt!367863 (+!1848 lt!367862 lt!367865))))

(assert (=> b!819581 (= lt!367865 (tuple2!9651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!24429)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2453 (array!45340 array!45342 (_ BitVec 32) (_ BitVec 32) V!24429 V!24429 (_ BitVec 32) Int) ListLongMap!8473)

(assert (=> b!819581 (= lt!367858 (getCurrentListMap!2453 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819581 (= lt!367860 (getCurrentListMap!2453 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819582 () Bool)

(declare-fun res!559247 () Bool)

(assert (=> b!819582 (=> (not res!559247) (not e!455163))))

(assert (=> b!819582 (= res!559247 (and (= (size!22145 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22144 _keys!976) (size!22145 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819583 () Bool)

(assert (=> b!819583 (= e!455163 (not e!455162))))

(declare-fun res!559245 () Bool)

(assert (=> b!819583 (=> res!559245 e!455162)))

(assert (=> b!819583 (= res!559245 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819583 (= lt!367862 lt!367864)))

(declare-fun lt!367861 () Unit!27983)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!394 (array!45340 array!45342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24429 V!24429 V!24429 V!24429 (_ BitVec 32) Int) Unit!27983)

(assert (=> b!819583 (= lt!367861 (lemmaNoChangeToArrayThenSameMapNoExtras!394 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2284 (array!45340 array!45342 (_ BitVec 32) (_ BitVec 32) V!24429 V!24429 (_ BitVec 32) Int) ListLongMap!8473)

(assert (=> b!819583 (= lt!367864 (getCurrentListMapNoExtraKeys!2284 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819583 (= lt!367862 (getCurrentListMapNoExtraKeys!2284 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70554 res!559249) b!819582))

(assert (= (and b!819582 res!559247) b!819578))

(assert (= (and b!819578 res!559248) b!819579))

(assert (= (and b!819579 res!559250) b!819583))

(assert (= (and b!819583 (not res!559245)) b!819581))

(assert (= (and b!819581 res!559246) b!819575))

(assert (= (and b!819580 condMapEmpty!23458) mapIsEmpty!23458))

(assert (= (and b!819580 (not condMapEmpty!23458)) mapNonEmpty!23458))

(get-info :version)

(assert (= (and mapNonEmpty!23458 ((_ is ValueCellFull!6870) mapValue!23458)) b!819577))

(assert (= (and b!819580 ((_ is ValueCellFull!6870) mapDefault!23458)) b!819576))

(assert (= start!70554 b!819580))

(declare-fun m!761243 () Bool)

(assert (=> b!819583 m!761243))

(declare-fun m!761245 () Bool)

(assert (=> b!819583 m!761245))

(declare-fun m!761247 () Bool)

(assert (=> b!819583 m!761247))

(declare-fun m!761249 () Bool)

(assert (=> mapNonEmpty!23458 m!761249))

(declare-fun m!761251 () Bool)

(assert (=> b!819581 m!761251))

(declare-fun m!761253 () Bool)

(assert (=> b!819581 m!761253))

(declare-fun m!761255 () Bool)

(assert (=> b!819581 m!761255))

(declare-fun m!761257 () Bool)

(assert (=> b!819581 m!761257))

(assert (=> b!819581 m!761253))

(declare-fun m!761259 () Bool)

(assert (=> b!819581 m!761259))

(declare-fun m!761261 () Bool)

(assert (=> b!819581 m!761261))

(declare-fun m!761263 () Bool)

(assert (=> b!819581 m!761263))

(declare-fun m!761265 () Bool)

(assert (=> b!819581 m!761265))

(declare-fun m!761267 () Bool)

(assert (=> b!819578 m!761267))

(declare-fun m!761269 () Bool)

(assert (=> start!70554 m!761269))

(declare-fun m!761271 () Bool)

(assert (=> start!70554 m!761271))

(declare-fun m!761273 () Bool)

(assert (=> start!70554 m!761273))

(declare-fun m!761275 () Bool)

(assert (=> b!819575 m!761275))

(declare-fun m!761277 () Bool)

(assert (=> b!819579 m!761277))

(check-sat tp_is_empty!14571 (not b!819579) (not b!819583) b_and!21703 (not b!819578) (not b!819581) (not mapNonEmpty!23458) (not b!819575) (not start!70554) (not b_next!12861))
(check-sat b_and!21703 (not b_next!12861))
