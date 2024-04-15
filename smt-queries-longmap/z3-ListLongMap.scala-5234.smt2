; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70464 () Bool)

(assert start!70464)

(declare-fun b_free!12811 () Bool)

(declare-fun b_next!12811 () Bool)

(assert (=> start!70464 (= b_free!12811 (not b_next!12811))))

(declare-fun tp!45166 () Bool)

(declare-fun b_and!21615 () Bool)

(assert (=> start!70464 (= tp!45166 b_and!21615)))

(declare-fun b!818460 () Bool)

(declare-fun e!454361 () Bool)

(declare-fun e!454359 () Bool)

(assert (=> b!818460 (= e!454361 (not e!454359))))

(declare-fun res!558599 () Bool)

(assert (=> b!818460 (=> res!558599 e!454359)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818460 (= res!558599 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24363 0))(
  ( (V!24364 (val!7308 Int)) )
))
(declare-datatypes ((tuple2!9630 0))(
  ( (tuple2!9631 (_1!4826 (_ BitVec 64)) (_2!4826 V!24363)) )
))
(declare-datatypes ((List!15452 0))(
  ( (Nil!15449) (Cons!15448 (h!16577 tuple2!9630) (t!21772 List!15452)) )
))
(declare-datatypes ((ListLongMap!8443 0))(
  ( (ListLongMap!8444 (toList!4237 List!15452)) )
))
(declare-fun lt!366711 () ListLongMap!8443)

(declare-fun lt!366710 () ListLongMap!8443)

(assert (=> b!818460 (= lt!366711 lt!366710)))

(declare-fun zeroValueBefore!34 () V!24363)

(declare-datatypes ((Unit!27899 0))(
  ( (Unit!27900) )
))
(declare-fun lt!366719 () Unit!27899)

(declare-datatypes ((array!45217 0))(
  ( (array!45218 (arr!21663 (Array (_ BitVec 32) (_ BitVec 64))) (size!22084 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45217)

(declare-fun zeroValueAfter!34 () V!24363)

(declare-fun minValue!754 () V!24363)

(declare-datatypes ((ValueCell!6845 0))(
  ( (ValueCellFull!6845 (v!9731 V!24363)) (EmptyCell!6845) )
))
(declare-datatypes ((array!45219 0))(
  ( (array!45220 (arr!21664 (Array (_ BitVec 32) ValueCell!6845)) (size!22085 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45219)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!388 (array!45217 array!45219 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24363 V!24363 V!24363 V!24363 (_ BitVec 32) Int) Unit!27899)

(assert (=> b!818460 (= lt!366719 (lemmaNoChangeToArrayThenSameMapNoExtras!388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2295 (array!45217 array!45219 (_ BitVec 32) (_ BitVec 32) V!24363 V!24363 (_ BitVec 32) Int) ListLongMap!8443)

(assert (=> b!818460 (= lt!366710 (getCurrentListMapNoExtraKeys!2295 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818460 (= lt!366711 (getCurrentListMapNoExtraKeys!2295 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818461 () Bool)

(declare-fun res!558601 () Bool)

(assert (=> b!818461 (=> (not res!558601) (not e!454361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45217 (_ BitVec 32)) Bool)

(assert (=> b!818461 (= res!558601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!558602 () Bool)

(assert (=> start!70464 (=> (not res!558602) (not e!454361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70464 (= res!558602 (validMask!0 mask!1312))))

(assert (=> start!70464 e!454361))

(declare-fun tp_is_empty!14521 () Bool)

(assert (=> start!70464 tp_is_empty!14521))

(declare-fun array_inv!17391 (array!45217) Bool)

(assert (=> start!70464 (array_inv!17391 _keys!976)))

(assert (=> start!70464 true))

(declare-fun e!454362 () Bool)

(declare-fun array_inv!17392 (array!45219) Bool)

(assert (=> start!70464 (and (array_inv!17392 _values!788) e!454362)))

(assert (=> start!70464 tp!45166))

(declare-fun b!818462 () Bool)

(declare-fun e!454358 () Bool)

(assert (=> b!818462 (= e!454358 tp_is_empty!14521)))

(declare-fun b!818463 () Bool)

(assert (=> b!818463 (= e!454359 true)))

(declare-fun lt!366715 () ListLongMap!8443)

(declare-fun lt!366714 () tuple2!9630)

(declare-fun lt!366716 () tuple2!9630)

(declare-fun +!1859 (ListLongMap!8443 tuple2!9630) ListLongMap!8443)

(assert (=> b!818463 (= lt!366715 (+!1859 (+!1859 lt!366710 lt!366714) lt!366716))))

(declare-fun lt!366712 () ListLongMap!8443)

(assert (=> b!818463 (= (+!1859 lt!366711 lt!366716) (+!1859 lt!366712 lt!366716))))

(declare-fun lt!366718 () Unit!27899)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!174 (ListLongMap!8443 (_ BitVec 64) V!24363 V!24363) Unit!27899)

(assert (=> b!818463 (= lt!366718 (addSameAsAddTwiceSameKeyDiffValues!174 lt!366711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818463 (= lt!366716 (tuple2!9631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!454364 () Bool)

(assert (=> b!818463 e!454364))

(declare-fun res!558598 () Bool)

(assert (=> b!818463 (=> (not res!558598) (not e!454364))))

(declare-fun lt!366713 () ListLongMap!8443)

(assert (=> b!818463 (= res!558598 (= lt!366713 lt!366712))))

(assert (=> b!818463 (= lt!366712 (+!1859 lt!366711 lt!366714))))

(assert (=> b!818463 (= lt!366714 (tuple2!9631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun lt!366717 () ListLongMap!8443)

(declare-fun getCurrentListMap!2387 (array!45217 array!45219 (_ BitVec 32) (_ BitVec 32) V!24363 V!24363 (_ BitVec 32) Int) ListLongMap!8443)

(assert (=> b!818463 (= lt!366717 (getCurrentListMap!2387 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818463 (= lt!366713 (getCurrentListMap!2387 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23380 () Bool)

(declare-fun mapRes!23380 () Bool)

(declare-fun tp!45165 () Bool)

(assert (=> mapNonEmpty!23380 (= mapRes!23380 (and tp!45165 e!454358))))

(declare-fun mapKey!23380 () (_ BitVec 32))

(declare-fun mapRest!23380 () (Array (_ BitVec 32) ValueCell!6845))

(declare-fun mapValue!23380 () ValueCell!6845)

(assert (=> mapNonEmpty!23380 (= (arr!21664 _values!788) (store mapRest!23380 mapKey!23380 mapValue!23380))))

(declare-fun b!818464 () Bool)

(declare-fun e!454363 () Bool)

(assert (=> b!818464 (= e!454363 tp_is_empty!14521)))

(declare-fun b!818465 () Bool)

(assert (=> b!818465 (= e!454362 (and e!454363 mapRes!23380))))

(declare-fun condMapEmpty!23380 () Bool)

(declare-fun mapDefault!23380 () ValueCell!6845)

(assert (=> b!818465 (= condMapEmpty!23380 (= (arr!21664 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6845)) mapDefault!23380)))))

(declare-fun b!818466 () Bool)

(declare-fun res!558600 () Bool)

(assert (=> b!818466 (=> (not res!558600) (not e!454361))))

(declare-datatypes ((List!15453 0))(
  ( (Nil!15450) (Cons!15449 (h!16578 (_ BitVec 64)) (t!21773 List!15453)) )
))
(declare-fun arrayNoDuplicates!0 (array!45217 (_ BitVec 32) List!15453) Bool)

(assert (=> b!818466 (= res!558600 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15450))))

(declare-fun b!818467 () Bool)

(declare-fun res!558597 () Bool)

(assert (=> b!818467 (=> (not res!558597) (not e!454361))))

(assert (=> b!818467 (= res!558597 (and (= (size!22085 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22084 _keys!976) (size!22085 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818468 () Bool)

(assert (=> b!818468 (= e!454364 (= lt!366717 (+!1859 lt!366710 (tuple2!9631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun mapIsEmpty!23380 () Bool)

(assert (=> mapIsEmpty!23380 mapRes!23380))

(assert (= (and start!70464 res!558602) b!818467))

(assert (= (and b!818467 res!558597) b!818461))

(assert (= (and b!818461 res!558601) b!818466))

(assert (= (and b!818466 res!558600) b!818460))

(assert (= (and b!818460 (not res!558599)) b!818463))

(assert (= (and b!818463 res!558598) b!818468))

(assert (= (and b!818465 condMapEmpty!23380) mapIsEmpty!23380))

(assert (= (and b!818465 (not condMapEmpty!23380)) mapNonEmpty!23380))

(get-info :version)

(assert (= (and mapNonEmpty!23380 ((_ is ValueCellFull!6845) mapValue!23380)) b!818462))

(assert (= (and b!818465 ((_ is ValueCellFull!6845) mapDefault!23380)) b!818464))

(assert (= start!70464 b!818465))

(declare-fun m!759353 () Bool)

(assert (=> b!818463 m!759353))

(declare-fun m!759355 () Bool)

(assert (=> b!818463 m!759355))

(declare-fun m!759357 () Bool)

(assert (=> b!818463 m!759357))

(declare-fun m!759359 () Bool)

(assert (=> b!818463 m!759359))

(declare-fun m!759361 () Bool)

(assert (=> b!818463 m!759361))

(declare-fun m!759363 () Bool)

(assert (=> b!818463 m!759363))

(declare-fun m!759365 () Bool)

(assert (=> b!818463 m!759365))

(assert (=> b!818463 m!759359))

(declare-fun m!759367 () Bool)

(assert (=> b!818463 m!759367))

(declare-fun m!759369 () Bool)

(assert (=> mapNonEmpty!23380 m!759369))

(declare-fun m!759371 () Bool)

(assert (=> start!70464 m!759371))

(declare-fun m!759373 () Bool)

(assert (=> start!70464 m!759373))

(declare-fun m!759375 () Bool)

(assert (=> start!70464 m!759375))

(declare-fun m!759377 () Bool)

(assert (=> b!818460 m!759377))

(declare-fun m!759379 () Bool)

(assert (=> b!818460 m!759379))

(declare-fun m!759381 () Bool)

(assert (=> b!818460 m!759381))

(declare-fun m!759383 () Bool)

(assert (=> b!818461 m!759383))

(declare-fun m!759385 () Bool)

(assert (=> b!818466 m!759385))

(declare-fun m!759387 () Bool)

(assert (=> b!818468 m!759387))

(check-sat (not b!818468) tp_is_empty!14521 (not mapNonEmpty!23380) (not b!818463) (not b!818460) (not b_next!12811) (not b!818466) b_and!21615 (not start!70464) (not b!818461))
(check-sat b_and!21615 (not b_next!12811))
