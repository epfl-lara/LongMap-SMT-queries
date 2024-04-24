; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70730 () Bool)

(assert start!70730)

(declare-fun b_free!12871 () Bool)

(declare-fun b_next!12871 () Bool)

(assert (=> start!70730 (= b_free!12871 (not b_next!12871))))

(declare-fun tp!45349 () Bool)

(declare-fun b_and!21723 () Bool)

(assert (=> start!70730 (= tp!45349 b_and!21723)))

(declare-fun mapNonEmpty!23473 () Bool)

(declare-fun mapRes!23473 () Bool)

(declare-fun tp!45348 () Bool)

(declare-fun e!455842 () Bool)

(assert (=> mapNonEmpty!23473 (= mapRes!23473 (and tp!45348 e!455842))))

(declare-datatypes ((V!24443 0))(
  ( (V!24444 (val!7338 Int)) )
))
(declare-datatypes ((ValueCell!6875 0))(
  ( (ValueCellFull!6875 (v!9768 V!24443)) (EmptyCell!6875) )
))
(declare-fun mapRest!23473 () (Array (_ BitVec 32) ValueCell!6875))

(declare-datatypes ((array!45363 0))(
  ( (array!45364 (arr!21730 (Array (_ BitVec 32) ValueCell!6875)) (size!22150 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45363)

(declare-fun mapKey!23473 () (_ BitVec 32))

(declare-fun mapValue!23473 () ValueCell!6875)

(assert (=> mapNonEmpty!23473 (= (arr!21730 _values!788) (store mapRest!23473 mapKey!23473 mapValue!23473))))

(declare-fun b!820604 () Bool)

(declare-fun res!559683 () Bool)

(declare-fun e!455841 () Bool)

(assert (=> b!820604 (=> (not res!559683) (not e!455841))))

(declare-datatypes ((array!45365 0))(
  ( (array!45366 (arr!21731 (Array (_ BitVec 32) (_ BitVec 64))) (size!22151 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45365)

(declare-datatypes ((List!15376 0))(
  ( (Nil!15373) (Cons!15372 (h!16507 (_ BitVec 64)) (t!21699 List!15376)) )
))
(declare-fun arrayNoDuplicates!0 (array!45365 (_ BitVec 32) List!15376) Bool)

(assert (=> b!820604 (= res!559683 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15373))))

(declare-datatypes ((tuple2!9572 0))(
  ( (tuple2!9573 (_1!4797 (_ BitVec 64)) (_2!4797 V!24443)) )
))
(declare-datatypes ((List!15377 0))(
  ( (Nil!15374) (Cons!15373 (h!16508 tuple2!9572) (t!21700 List!15377)) )
))
(declare-datatypes ((ListLongMap!8397 0))(
  ( (ListLongMap!8398 (toList!4214 List!15377)) )
))
(declare-fun lt!368365 () ListLongMap!8397)

(declare-fun zeroValueAfter!34 () V!24443)

(declare-fun b!820605 () Bool)

(declare-fun e!455840 () Bool)

(declare-fun lt!368369 () ListLongMap!8397)

(declare-fun +!1850 (ListLongMap!8397 tuple2!9572) ListLongMap!8397)

(assert (=> b!820605 (= e!455840 (= lt!368365 (+!1850 lt!368369 (tuple2!9573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!820606 () Bool)

(declare-fun tp_is_empty!14581 () Bool)

(assert (=> b!820606 (= e!455842 tp_is_empty!14581)))

(declare-fun b!820607 () Bool)

(declare-fun res!559686 () Bool)

(assert (=> b!820607 (=> (not res!559686) (not e!455841))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820607 (= res!559686 (and (= (size!22150 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22151 _keys!976) (size!22150 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23473 () Bool)

(assert (=> mapIsEmpty!23473 mapRes!23473))

(declare-fun b!820608 () Bool)

(declare-fun res!559681 () Bool)

(assert (=> b!820608 (=> (not res!559681) (not e!455841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45365 (_ BitVec 32)) Bool)

(assert (=> b!820608 (= res!559681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820609 () Bool)

(declare-fun e!455845 () Bool)

(declare-fun e!455843 () Bool)

(assert (=> b!820609 (= e!455845 (and e!455843 mapRes!23473))))

(declare-fun condMapEmpty!23473 () Bool)

(declare-fun mapDefault!23473 () ValueCell!6875)

(assert (=> b!820609 (= condMapEmpty!23473 (= (arr!21730 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6875)) mapDefault!23473)))))

(declare-fun b!820610 () Bool)

(declare-fun e!455846 () Bool)

(assert (=> b!820610 (= e!455841 (not e!455846))))

(declare-fun res!559682 () Bool)

(assert (=> b!820610 (=> res!559682 e!455846)))

(assert (=> b!820610 (= res!559682 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!368370 () ListLongMap!8397)

(assert (=> b!820610 (= lt!368370 lt!368369)))

(declare-fun zeroValueBefore!34 () V!24443)

(declare-fun minValue!754 () V!24443)

(declare-datatypes ((Unit!27978 0))(
  ( (Unit!27979) )
))
(declare-fun lt!368368 () Unit!27978)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!395 (array!45365 array!45363 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24443 V!24443 V!24443 V!24443 (_ BitVec 32) Int) Unit!27978)

(assert (=> b!820610 (= lt!368368 (lemmaNoChangeToArrayThenSameMapNoExtras!395 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2307 (array!45365 array!45363 (_ BitVec 32) (_ BitVec 32) V!24443 V!24443 (_ BitVec 32) Int) ListLongMap!8397)

(assert (=> b!820610 (= lt!368369 (getCurrentListMapNoExtraKeys!2307 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820610 (= lt!368370 (getCurrentListMapNoExtraKeys!2307 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820611 () Bool)

(assert (=> b!820611 (= e!455846 true)))

(declare-fun lt!368367 () tuple2!9572)

(declare-fun lt!368361 () tuple2!9572)

(declare-fun lt!368363 () ListLongMap!8397)

(assert (=> b!820611 (= lt!368363 (+!1850 (+!1850 lt!368369 lt!368361) lt!368367))))

(declare-fun lt!368362 () ListLongMap!8397)

(assert (=> b!820611 (= (+!1850 lt!368370 lt!368367) (+!1850 lt!368362 lt!368367))))

(declare-fun lt!368366 () Unit!27978)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!187 (ListLongMap!8397 (_ BitVec 64) V!24443 V!24443) Unit!27978)

(assert (=> b!820611 (= lt!368366 (addSameAsAddTwiceSameKeyDiffValues!187 lt!368370 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!820611 (= lt!368367 (tuple2!9573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!820611 e!455840))

(declare-fun res!559684 () Bool)

(assert (=> b!820611 (=> (not res!559684) (not e!455840))))

(declare-fun lt!368364 () ListLongMap!8397)

(assert (=> b!820611 (= res!559684 (= lt!368364 lt!368362))))

(assert (=> b!820611 (= lt!368362 (+!1850 lt!368370 lt!368361))))

(assert (=> b!820611 (= lt!368361 (tuple2!9573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2400 (array!45365 array!45363 (_ BitVec 32) (_ BitVec 32) V!24443 V!24443 (_ BitVec 32) Int) ListLongMap!8397)

(assert (=> b!820611 (= lt!368365 (getCurrentListMap!2400 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820611 (= lt!368364 (getCurrentListMap!2400 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!559685 () Bool)

(assert (=> start!70730 (=> (not res!559685) (not e!455841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70730 (= res!559685 (validMask!0 mask!1312))))

(assert (=> start!70730 e!455841))

(assert (=> start!70730 tp_is_empty!14581))

(declare-fun array_inv!17399 (array!45365) Bool)

(assert (=> start!70730 (array_inv!17399 _keys!976)))

(assert (=> start!70730 true))

(declare-fun array_inv!17400 (array!45363) Bool)

(assert (=> start!70730 (and (array_inv!17400 _values!788) e!455845)))

(assert (=> start!70730 tp!45349))

(declare-fun b!820612 () Bool)

(assert (=> b!820612 (= e!455843 tp_is_empty!14581)))

(assert (= (and start!70730 res!559685) b!820607))

(assert (= (and b!820607 res!559686) b!820608))

(assert (= (and b!820608 res!559681) b!820604))

(assert (= (and b!820604 res!559683) b!820610))

(assert (= (and b!820610 (not res!559682)) b!820611))

(assert (= (and b!820611 res!559684) b!820605))

(assert (= (and b!820609 condMapEmpty!23473) mapIsEmpty!23473))

(assert (= (and b!820609 (not condMapEmpty!23473)) mapNonEmpty!23473))

(get-info :version)

(assert (= (and mapNonEmpty!23473 ((_ is ValueCellFull!6875) mapValue!23473)) b!820606))

(assert (= (and b!820609 ((_ is ValueCellFull!6875) mapDefault!23473)) b!820612))

(assert (= start!70730 b!820609))

(declare-fun m!762705 () Bool)

(assert (=> b!820605 m!762705))

(declare-fun m!762707 () Bool)

(assert (=> b!820610 m!762707))

(declare-fun m!762709 () Bool)

(assert (=> b!820610 m!762709))

(declare-fun m!762711 () Bool)

(assert (=> b!820610 m!762711))

(declare-fun m!762713 () Bool)

(assert (=> b!820611 m!762713))

(declare-fun m!762715 () Bool)

(assert (=> b!820611 m!762715))

(declare-fun m!762717 () Bool)

(assert (=> b!820611 m!762717))

(declare-fun m!762719 () Bool)

(assert (=> b!820611 m!762719))

(declare-fun m!762721 () Bool)

(assert (=> b!820611 m!762721))

(assert (=> b!820611 m!762719))

(declare-fun m!762723 () Bool)

(assert (=> b!820611 m!762723))

(declare-fun m!762725 () Bool)

(assert (=> b!820611 m!762725))

(declare-fun m!762727 () Bool)

(assert (=> b!820611 m!762727))

(declare-fun m!762729 () Bool)

(assert (=> b!820608 m!762729))

(declare-fun m!762731 () Bool)

(assert (=> start!70730 m!762731))

(declare-fun m!762733 () Bool)

(assert (=> start!70730 m!762733))

(declare-fun m!762735 () Bool)

(assert (=> start!70730 m!762735))

(declare-fun m!762737 () Bool)

(assert (=> mapNonEmpty!23473 m!762737))

(declare-fun m!762739 () Bool)

(assert (=> b!820604 m!762739))

(check-sat (not b!820610) b_and!21723 (not start!70730) (not b!820611) (not mapNonEmpty!23473) (not b_next!12871) (not b!820604) (not b!820608) (not b!820605) tp_is_empty!14581)
(check-sat b_and!21723 (not b_next!12871))
