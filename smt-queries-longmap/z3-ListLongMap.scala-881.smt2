; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20386 () Bool)

(assert start!20386)

(declare-fun b_free!5041 () Bool)

(declare-fun b_next!5041 () Bool)

(assert (=> start!20386 (= b_free!5041 (not b_next!5041))))

(declare-fun tp!18155 () Bool)

(declare-fun b_and!11801 () Bool)

(assert (=> start!20386 (= tp!18155 b_and!11801)))

(declare-fun b!201413 () Bool)

(declare-fun e!132002 () Bool)

(declare-fun e!132008 () Bool)

(assert (=> b!201413 (= e!132002 e!132008)))

(declare-fun res!96226 () Bool)

(assert (=> b!201413 (=> res!96226 e!132008)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!201413 (= res!96226 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6177 0))(
  ( (V!6178 (val!2493 Int)) )
))
(declare-datatypes ((tuple2!3710 0))(
  ( (tuple2!3711 (_1!1866 (_ BitVec 64)) (_2!1866 V!6177)) )
))
(declare-datatypes ((List!2622 0))(
  ( (Nil!2619) (Cons!2618 (h!3260 tuple2!3710) (t!7545 List!2622)) )
))
(declare-datatypes ((ListLongMap!2625 0))(
  ( (ListLongMap!2626 (toList!1328 List!2622)) )
))
(declare-fun lt!100342 () ListLongMap!2625)

(declare-fun lt!100332 () ListLongMap!2625)

(assert (=> b!201413 (= lt!100342 lt!100332)))

(declare-fun lt!100339 () ListLongMap!2625)

(declare-fun lt!100334 () tuple2!3710)

(declare-fun +!382 (ListLongMap!2625 tuple2!3710) ListLongMap!2625)

(assert (=> b!201413 (= lt!100332 (+!382 lt!100339 lt!100334))))

(declare-fun lt!100333 () ListLongMap!2625)

(declare-datatypes ((Unit!6048 0))(
  ( (Unit!6049) )
))
(declare-fun lt!100344 () Unit!6048)

(declare-fun v!520 () V!6177)

(declare-fun zeroValue!615 () V!6177)

(declare-fun addCommutativeForDiffKeys!105 (ListLongMap!2625 (_ BitVec 64) V!6177 (_ BitVec 64) V!6177) Unit!6048)

(assert (=> b!201413 (= lt!100344 (addCommutativeForDiffKeys!105 lt!100333 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100346 () ListLongMap!2625)

(declare-fun lt!100336 () tuple2!3710)

(assert (=> b!201413 (= lt!100346 (+!382 lt!100342 lt!100336))))

(declare-fun lt!100345 () ListLongMap!2625)

(declare-fun lt!100337 () tuple2!3710)

(assert (=> b!201413 (= lt!100342 (+!382 lt!100345 lt!100337))))

(declare-fun lt!100335 () ListLongMap!2625)

(declare-fun lt!100338 () ListLongMap!2625)

(assert (=> b!201413 (= lt!100335 lt!100338)))

(assert (=> b!201413 (= lt!100338 (+!382 lt!100339 lt!100336))))

(assert (=> b!201413 (= lt!100339 (+!382 lt!100333 lt!100337))))

(declare-fun lt!100331 () ListLongMap!2625)

(assert (=> b!201413 (= lt!100346 (+!382 (+!382 lt!100331 lt!100337) lt!100336))))

(declare-fun minValue!615 () V!6177)

(assert (=> b!201413 (= lt!100336 (tuple2!3711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201413 (= lt!100337 (tuple2!3711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!96219 () Bool)

(declare-fun e!132007 () Bool)

(assert (=> start!20386 (=> (not res!96219) (not e!132007))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20386 (= res!96219 (validMask!0 mask!1149))))

(assert (=> start!20386 e!132007))

(declare-datatypes ((ValueCell!2105 0))(
  ( (ValueCellFull!2105 (v!4464 V!6177)) (EmptyCell!2105) )
))
(declare-datatypes ((array!9017 0))(
  ( (array!9018 (arr!4259 (Array (_ BitVec 32) ValueCell!2105)) (size!4584 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9017)

(declare-fun e!132003 () Bool)

(declare-fun array_inv!2775 (array!9017) Bool)

(assert (=> start!20386 (and (array_inv!2775 _values!649) e!132003)))

(assert (=> start!20386 true))

(declare-fun tp_is_empty!4897 () Bool)

(assert (=> start!20386 tp_is_empty!4897))

(declare-datatypes ((array!9019 0))(
  ( (array!9020 (arr!4260 (Array (_ BitVec 32) (_ BitVec 64))) (size!4585 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9019)

(declare-fun array_inv!2776 (array!9019) Bool)

(assert (=> start!20386 (array_inv!2776 _keys!825)))

(assert (=> start!20386 tp!18155))

(declare-fun b!201414 () Bool)

(declare-fun e!132006 () Bool)

(assert (=> b!201414 (= e!132006 tp_is_empty!4897)))

(declare-fun b!201415 () Bool)

(declare-fun res!96223 () Bool)

(assert (=> b!201415 (=> (not res!96223) (not e!132007))))

(declare-datatypes ((List!2623 0))(
  ( (Nil!2620) (Cons!2619 (h!3261 (_ BitVec 64)) (t!7546 List!2623)) )
))
(declare-fun arrayNoDuplicates!0 (array!9019 (_ BitVec 32) List!2623) Bool)

(assert (=> b!201415 (= res!96223 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2620))))

(declare-fun b!201416 () Bool)

(declare-fun mapRes!8414 () Bool)

(assert (=> b!201416 (= e!132003 (and e!132006 mapRes!8414))))

(declare-fun condMapEmpty!8414 () Bool)

(declare-fun mapDefault!8414 () ValueCell!2105)

(assert (=> b!201416 (= condMapEmpty!8414 (= (arr!4259 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2105)) mapDefault!8414)))))

(declare-fun b!201417 () Bool)

(assert (=> b!201417 (= e!132008 true)))

(assert (=> b!201417 (= (+!382 lt!100332 lt!100336) (+!382 lt!100338 lt!100334))))

(declare-fun lt!100340 () Unit!6048)

(assert (=> b!201417 (= lt!100340 (addCommutativeForDiffKeys!105 lt!100339 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201418 () Bool)

(declare-fun e!132005 () Bool)

(assert (=> b!201418 (= e!132005 tp_is_empty!4897)))

(declare-fun b!201419 () Bool)

(declare-fun res!96224 () Bool)

(assert (=> b!201419 (=> (not res!96224) (not e!132007))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201419 (= res!96224 (= (select (arr!4260 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8414 () Bool)

(declare-fun tp!18154 () Bool)

(assert (=> mapNonEmpty!8414 (= mapRes!8414 (and tp!18154 e!132005))))

(declare-fun mapValue!8414 () ValueCell!2105)

(declare-fun mapRest!8414 () (Array (_ BitVec 32) ValueCell!2105))

(declare-fun mapKey!8414 () (_ BitVec 32))

(assert (=> mapNonEmpty!8414 (= (arr!4259 _values!649) (store mapRest!8414 mapKey!8414 mapValue!8414))))

(declare-fun b!201420 () Bool)

(declare-fun res!96221 () Bool)

(assert (=> b!201420 (=> (not res!96221) (not e!132007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201420 (= res!96221 (validKeyInArray!0 k0!843))))

(declare-fun b!201421 () Bool)

(assert (=> b!201421 (= e!132007 (not e!132002))))

(declare-fun res!96220 () Bool)

(assert (=> b!201421 (=> res!96220 e!132002)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201421 (= res!96220 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!919 (array!9019 array!9017 (_ BitVec 32) (_ BitVec 32) V!6177 V!6177 (_ BitVec 32) Int) ListLongMap!2625)

(assert (=> b!201421 (= lt!100335 (getCurrentListMap!919 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100343 () array!9017)

(assert (=> b!201421 (= lt!100346 (getCurrentListMap!919 _keys!825 lt!100343 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201421 (and (= lt!100331 lt!100345) (= lt!100345 lt!100331))))

(assert (=> b!201421 (= lt!100345 (+!382 lt!100333 lt!100334))))

(assert (=> b!201421 (= lt!100334 (tuple2!3711 k0!843 v!520))))

(declare-fun lt!100341 () Unit!6048)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!55 (array!9019 array!9017 (_ BitVec 32) (_ BitVec 32) V!6177 V!6177 (_ BitVec 32) (_ BitVec 64) V!6177 (_ BitVec 32) Int) Unit!6048)

(assert (=> b!201421 (= lt!100341 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!55 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!312 (array!9019 array!9017 (_ BitVec 32) (_ BitVec 32) V!6177 V!6177 (_ BitVec 32) Int) ListLongMap!2625)

(assert (=> b!201421 (= lt!100331 (getCurrentListMapNoExtraKeys!312 _keys!825 lt!100343 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201421 (= lt!100343 (array!9018 (store (arr!4259 _values!649) i!601 (ValueCellFull!2105 v!520)) (size!4584 _values!649)))))

(assert (=> b!201421 (= lt!100333 (getCurrentListMapNoExtraKeys!312 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8414 () Bool)

(assert (=> mapIsEmpty!8414 mapRes!8414))

(declare-fun b!201422 () Bool)

(declare-fun res!96218 () Bool)

(assert (=> b!201422 (=> (not res!96218) (not e!132007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9019 (_ BitVec 32)) Bool)

(assert (=> b!201422 (= res!96218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201423 () Bool)

(declare-fun res!96222 () Bool)

(assert (=> b!201423 (=> (not res!96222) (not e!132007))))

(assert (=> b!201423 (= res!96222 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4585 _keys!825))))))

(declare-fun b!201424 () Bool)

(declare-fun res!96225 () Bool)

(assert (=> b!201424 (=> (not res!96225) (not e!132007))))

(assert (=> b!201424 (= res!96225 (and (= (size!4584 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4585 _keys!825) (size!4584 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20386 res!96219) b!201424))

(assert (= (and b!201424 res!96225) b!201422))

(assert (= (and b!201422 res!96218) b!201415))

(assert (= (and b!201415 res!96223) b!201423))

(assert (= (and b!201423 res!96222) b!201420))

(assert (= (and b!201420 res!96221) b!201419))

(assert (= (and b!201419 res!96224) b!201421))

(assert (= (and b!201421 (not res!96220)) b!201413))

(assert (= (and b!201413 (not res!96226)) b!201417))

(assert (= (and b!201416 condMapEmpty!8414) mapIsEmpty!8414))

(assert (= (and b!201416 (not condMapEmpty!8414)) mapNonEmpty!8414))

(get-info :version)

(assert (= (and mapNonEmpty!8414 ((_ is ValueCellFull!2105) mapValue!8414)) b!201418))

(assert (= (and b!201416 ((_ is ValueCellFull!2105) mapDefault!8414)) b!201414))

(assert (= start!20386 b!201416))

(declare-fun m!228441 () Bool)

(assert (=> start!20386 m!228441))

(declare-fun m!228443 () Bool)

(assert (=> start!20386 m!228443))

(declare-fun m!228445 () Bool)

(assert (=> start!20386 m!228445))

(declare-fun m!228447 () Bool)

(assert (=> mapNonEmpty!8414 m!228447))

(declare-fun m!228449 () Bool)

(assert (=> b!201413 m!228449))

(declare-fun m!228451 () Bool)

(assert (=> b!201413 m!228451))

(declare-fun m!228453 () Bool)

(assert (=> b!201413 m!228453))

(declare-fun m!228455 () Bool)

(assert (=> b!201413 m!228455))

(declare-fun m!228457 () Bool)

(assert (=> b!201413 m!228457))

(declare-fun m!228459 () Bool)

(assert (=> b!201413 m!228459))

(declare-fun m!228461 () Bool)

(assert (=> b!201413 m!228461))

(declare-fun m!228463 () Bool)

(assert (=> b!201413 m!228463))

(assert (=> b!201413 m!228459))

(declare-fun m!228465 () Bool)

(assert (=> b!201422 m!228465))

(declare-fun m!228467 () Bool)

(assert (=> b!201419 m!228467))

(declare-fun m!228469 () Bool)

(assert (=> b!201417 m!228469))

(declare-fun m!228471 () Bool)

(assert (=> b!201417 m!228471))

(declare-fun m!228473 () Bool)

(assert (=> b!201417 m!228473))

(declare-fun m!228475 () Bool)

(assert (=> b!201420 m!228475))

(declare-fun m!228477 () Bool)

(assert (=> b!201415 m!228477))

(declare-fun m!228479 () Bool)

(assert (=> b!201421 m!228479))

(declare-fun m!228481 () Bool)

(assert (=> b!201421 m!228481))

(declare-fun m!228483 () Bool)

(assert (=> b!201421 m!228483))

(declare-fun m!228485 () Bool)

(assert (=> b!201421 m!228485))

(declare-fun m!228487 () Bool)

(assert (=> b!201421 m!228487))

(declare-fun m!228489 () Bool)

(assert (=> b!201421 m!228489))

(declare-fun m!228491 () Bool)

(assert (=> b!201421 m!228491))

(check-sat (not start!20386) (not b!201420) (not b_next!5041) (not b!201422) (not b!201413) (not b!201421) tp_is_empty!4897 (not b!201415) b_and!11801 (not b!201417) (not mapNonEmpty!8414))
(check-sat b_and!11801 (not b_next!5041))
