; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20608 () Bool)

(assert start!20608)

(declare-fun b_free!5263 () Bool)

(declare-fun b_next!5263 () Bool)

(assert (=> start!20608 (= b_free!5263 (not b_next!5263))))

(declare-fun tp!18821 () Bool)

(declare-fun b_and!11983 () Bool)

(assert (=> start!20608 (= tp!18821 b_and!11983)))

(declare-fun b!205233 () Bool)

(declare-fun e!134213 () Bool)

(declare-fun e!134212 () Bool)

(declare-fun mapRes!8747 () Bool)

(assert (=> b!205233 (= e!134213 (and e!134212 mapRes!8747))))

(declare-fun condMapEmpty!8747 () Bool)

(declare-datatypes ((V!6473 0))(
  ( (V!6474 (val!2604 Int)) )
))
(declare-datatypes ((ValueCell!2216 0))(
  ( (ValueCellFull!2216 (v!4568 V!6473)) (EmptyCell!2216) )
))
(declare-datatypes ((array!9437 0))(
  ( (array!9438 (arr!4468 (Array (_ BitVec 32) ValueCell!2216)) (size!4794 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9437)

(declare-fun mapDefault!8747 () ValueCell!2216)

(assert (=> b!205233 (= condMapEmpty!8747 (= (arr!4468 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2216)) mapDefault!8747)))))

(declare-fun b!205234 () Bool)

(declare-fun res!99120 () Bool)

(declare-fun e!134210 () Bool)

(assert (=> b!205234 (=> (not res!99120) (not e!134210))))

(declare-datatypes ((array!9439 0))(
  ( (array!9440 (arr!4469 (Array (_ BitVec 32) (_ BitVec 64))) (size!4795 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9439)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!205234 (= res!99120 (and (= (size!4794 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4795 _keys!825) (size!4794 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205235 () Bool)

(declare-fun res!99122 () Bool)

(assert (=> b!205235 (=> (not res!99122) (not e!134210))))

(declare-datatypes ((List!2834 0))(
  ( (Nil!2831) (Cons!2830 (h!3472 (_ BitVec 64)) (t!7756 List!2834)) )
))
(declare-fun arrayNoDuplicates!0 (array!9439 (_ BitVec 32) List!2834) Bool)

(assert (=> b!205235 (= res!99122 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2831))))

(declare-fun b!205236 () Bool)

(declare-fun e!134209 () Bool)

(assert (=> b!205236 (= e!134209 (bvsle #b00000000000000000000000000000000 (size!4795 _keys!825)))))

(declare-datatypes ((tuple2!3932 0))(
  ( (tuple2!3933 (_1!1977 (_ BitVec 64)) (_2!1977 V!6473)) )
))
(declare-datatypes ((List!2835 0))(
  ( (Nil!2832) (Cons!2831 (h!3473 tuple2!3932) (t!7757 List!2835)) )
))
(declare-datatypes ((ListLongMap!2835 0))(
  ( (ListLongMap!2836 (toList!1433 List!2835)) )
))
(declare-fun lt!104337 () ListLongMap!2835)

(declare-fun lt!104334 () ListLongMap!2835)

(declare-fun lt!104335 () tuple2!3932)

(declare-fun +!482 (ListLongMap!2835 tuple2!3932) ListLongMap!2835)

(assert (=> b!205236 (= lt!104337 (+!482 lt!104334 lt!104335))))

(declare-fun lt!104342 () ListLongMap!2835)

(declare-fun minValue!615 () V!6473)

(declare-fun v!520 () V!6473)

(declare-fun k0!843 () (_ BitVec 64))

(declare-datatypes ((Unit!6206 0))(
  ( (Unit!6207) )
))
(declare-fun lt!104340 () Unit!6206)

(declare-fun addCommutativeForDiffKeys!171 (ListLongMap!2835 (_ BitVec 64) V!6473 (_ BitVec 64) V!6473) Unit!6206)

(assert (=> b!205236 (= lt!104340 (addCommutativeForDiffKeys!171 lt!104342 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205237 () Bool)

(declare-fun res!99121 () Bool)

(assert (=> b!205237 (=> (not res!99121) (not e!134210))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205237 (= res!99121 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4795 _keys!825))))))

(declare-fun b!205239 () Bool)

(declare-fun e!134214 () Bool)

(assert (=> b!205239 (= e!134210 (not e!134214))))

(declare-fun res!99117 () Bool)

(assert (=> b!205239 (=> res!99117 e!134214)))

(assert (=> b!205239 (= res!99117 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!104332 () ListLongMap!2835)

(declare-fun zeroValue!615 () V!6473)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!978 (array!9439 array!9437 (_ BitVec 32) (_ BitVec 32) V!6473 V!6473 (_ BitVec 32) Int) ListLongMap!2835)

(assert (=> b!205239 (= lt!104332 (getCurrentListMap!978 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104341 () array!9437)

(declare-fun lt!104333 () ListLongMap!2835)

(assert (=> b!205239 (= lt!104333 (getCurrentListMap!978 _keys!825 lt!104341 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104338 () ListLongMap!2835)

(declare-fun lt!104336 () ListLongMap!2835)

(assert (=> b!205239 (and (= lt!104338 lt!104336) (= lt!104336 lt!104338))))

(assert (=> b!205239 (= lt!104336 (+!482 lt!104342 lt!104335))))

(assert (=> b!205239 (= lt!104335 (tuple2!3933 k0!843 v!520))))

(declare-fun lt!104339 () Unit!6206)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!137 (array!9439 array!9437 (_ BitVec 32) (_ BitVec 32) V!6473 V!6473 (_ BitVec 32) (_ BitVec 64) V!6473 (_ BitVec 32) Int) Unit!6206)

(assert (=> b!205239 (= lt!104339 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!137 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!388 (array!9439 array!9437 (_ BitVec 32) (_ BitVec 32) V!6473 V!6473 (_ BitVec 32) Int) ListLongMap!2835)

(assert (=> b!205239 (= lt!104338 (getCurrentListMapNoExtraKeys!388 _keys!825 lt!104341 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205239 (= lt!104341 (array!9438 (store (arr!4468 _values!649) i!601 (ValueCellFull!2216 v!520)) (size!4794 _values!649)))))

(assert (=> b!205239 (= lt!104342 (getCurrentListMapNoExtraKeys!388 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205240 () Bool)

(declare-fun res!99119 () Bool)

(assert (=> b!205240 (=> (not res!99119) (not e!134210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9439 (_ BitVec 32)) Bool)

(assert (=> b!205240 (= res!99119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205241 () Bool)

(declare-fun res!99125 () Bool)

(assert (=> b!205241 (=> (not res!99125) (not e!134210))))

(assert (=> b!205241 (= res!99125 (= (select (arr!4469 _keys!825) i!601) k0!843))))

(declare-fun b!205242 () Bool)

(declare-fun tp_is_empty!5119 () Bool)

(assert (=> b!205242 (= e!134212 tp_is_empty!5119)))

(declare-fun mapNonEmpty!8747 () Bool)

(declare-fun tp!18820 () Bool)

(declare-fun e!134208 () Bool)

(assert (=> mapNonEmpty!8747 (= mapRes!8747 (and tp!18820 e!134208))))

(declare-fun mapRest!8747 () (Array (_ BitVec 32) ValueCell!2216))

(declare-fun mapValue!8747 () ValueCell!2216)

(declare-fun mapKey!8747 () (_ BitVec 32))

(assert (=> mapNonEmpty!8747 (= (arr!4468 _values!649) (store mapRest!8747 mapKey!8747 mapValue!8747))))

(declare-fun b!205238 () Bool)

(assert (=> b!205238 (= e!134214 e!134209)))

(declare-fun res!99118 () Bool)

(assert (=> b!205238 (=> res!99118 e!134209)))

(assert (=> b!205238 (= res!99118 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!205238 (= lt!104332 lt!104334)))

(declare-fun lt!104331 () tuple2!3932)

(assert (=> b!205238 (= lt!104334 (+!482 lt!104342 lt!104331))))

(assert (=> b!205238 (= lt!104333 lt!104337)))

(assert (=> b!205238 (= lt!104337 (+!482 lt!104336 lt!104331))))

(assert (=> b!205238 (= lt!104333 (+!482 lt!104338 lt!104331))))

(assert (=> b!205238 (= lt!104331 (tuple2!3933 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun res!99123 () Bool)

(assert (=> start!20608 (=> (not res!99123) (not e!134210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20608 (= res!99123 (validMask!0 mask!1149))))

(assert (=> start!20608 e!134210))

(declare-fun array_inv!2935 (array!9437) Bool)

(assert (=> start!20608 (and (array_inv!2935 _values!649) e!134213)))

(assert (=> start!20608 true))

(assert (=> start!20608 tp_is_empty!5119))

(declare-fun array_inv!2936 (array!9439) Bool)

(assert (=> start!20608 (array_inv!2936 _keys!825)))

(assert (=> start!20608 tp!18821))

(declare-fun b!205243 () Bool)

(assert (=> b!205243 (= e!134208 tp_is_empty!5119)))

(declare-fun b!205244 () Bool)

(declare-fun res!99124 () Bool)

(assert (=> b!205244 (=> (not res!99124) (not e!134210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205244 (= res!99124 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!8747 () Bool)

(assert (=> mapIsEmpty!8747 mapRes!8747))

(assert (= (and start!20608 res!99123) b!205234))

(assert (= (and b!205234 res!99120) b!205240))

(assert (= (and b!205240 res!99119) b!205235))

(assert (= (and b!205235 res!99122) b!205237))

(assert (= (and b!205237 res!99121) b!205244))

(assert (= (and b!205244 res!99124) b!205241))

(assert (= (and b!205241 res!99125) b!205239))

(assert (= (and b!205239 (not res!99117)) b!205238))

(assert (= (and b!205238 (not res!99118)) b!205236))

(assert (= (and b!205233 condMapEmpty!8747) mapIsEmpty!8747))

(assert (= (and b!205233 (not condMapEmpty!8747)) mapNonEmpty!8747))

(get-info :version)

(assert (= (and mapNonEmpty!8747 ((_ is ValueCellFull!2216) mapValue!8747)) b!205243))

(assert (= (and b!205233 ((_ is ValueCellFull!2216) mapDefault!8747)) b!205242))

(assert (= start!20608 b!205233))

(declare-fun m!232383 () Bool)

(assert (=> b!205239 m!232383))

(declare-fun m!232385 () Bool)

(assert (=> b!205239 m!232385))

(declare-fun m!232387 () Bool)

(assert (=> b!205239 m!232387))

(declare-fun m!232389 () Bool)

(assert (=> b!205239 m!232389))

(declare-fun m!232391 () Bool)

(assert (=> b!205239 m!232391))

(declare-fun m!232393 () Bool)

(assert (=> b!205239 m!232393))

(declare-fun m!232395 () Bool)

(assert (=> b!205239 m!232395))

(declare-fun m!232397 () Bool)

(assert (=> mapNonEmpty!8747 m!232397))

(declare-fun m!232399 () Bool)

(assert (=> start!20608 m!232399))

(declare-fun m!232401 () Bool)

(assert (=> start!20608 m!232401))

(declare-fun m!232403 () Bool)

(assert (=> start!20608 m!232403))

(declare-fun m!232405 () Bool)

(assert (=> b!205236 m!232405))

(declare-fun m!232407 () Bool)

(assert (=> b!205236 m!232407))

(declare-fun m!232409 () Bool)

(assert (=> b!205241 m!232409))

(declare-fun m!232411 () Bool)

(assert (=> b!205238 m!232411))

(declare-fun m!232413 () Bool)

(assert (=> b!205238 m!232413))

(declare-fun m!232415 () Bool)

(assert (=> b!205238 m!232415))

(declare-fun m!232417 () Bool)

(assert (=> b!205240 m!232417))

(declare-fun m!232419 () Bool)

(assert (=> b!205235 m!232419))

(declare-fun m!232421 () Bool)

(assert (=> b!205244 m!232421))

(check-sat (not b!205235) tp_is_empty!5119 (not b!205238) b_and!11983 (not b!205236) (not b!205240) (not b!205244) (not mapNonEmpty!8747) (not b!205239) (not start!20608) (not b_next!5263))
(check-sat b_and!11983 (not b_next!5263))
