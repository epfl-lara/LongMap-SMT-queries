; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74608 () Bool)

(assert start!74608)

(declare-fun b_free!15295 () Bool)

(declare-fun b_next!15295 () Bool)

(assert (=> start!74608 (= b_free!15295 (not b_next!15295))))

(declare-fun tp!53571 () Bool)

(declare-fun b_and!25167 () Bool)

(assert (=> start!74608 (= tp!53571 b_and!25167)))

(declare-fun b!879185 () Bool)

(declare-fun e!489270 () Bool)

(declare-fun tp_is_empty!17539 () Bool)

(assert (=> b!879185 (= e!489270 tp_is_empty!17539)))

(declare-fun b!879186 () Bool)

(declare-fun res!597367 () Bool)

(declare-fun e!489268 () Bool)

(assert (=> b!879186 (=> (not res!597367) (not e!489268))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879186 (= res!597367 (validMask!0 mask!1196))))

(declare-fun b!879187 () Bool)

(declare-fun res!597365 () Bool)

(assert (=> b!879187 (=> (not res!597365) (not e!489268))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51185 0))(
  ( (array!51186 (arr!24618 (Array (_ BitVec 32) (_ BitVec 64))) (size!25060 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51185)

(assert (=> b!879187 (= res!597365 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25060 _keys!868))))))

(declare-fun mapNonEmpty!27927 () Bool)

(declare-fun mapRes!27927 () Bool)

(declare-fun tp!53570 () Bool)

(declare-fun e!489269 () Bool)

(assert (=> mapNonEmpty!27927 (= mapRes!27927 (and tp!53570 e!489269))))

(declare-datatypes ((V!28433 0))(
  ( (V!28434 (val!8817 Int)) )
))
(declare-datatypes ((ValueCell!8330 0))(
  ( (ValueCellFull!8330 (v!11255 V!28433)) (EmptyCell!8330) )
))
(declare-fun mapValue!27927 () ValueCell!8330)

(declare-datatypes ((array!51187 0))(
  ( (array!51188 (arr!24619 (Array (_ BitVec 32) ValueCell!8330)) (size!25061 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51187)

(declare-fun mapRest!27927 () (Array (_ BitVec 32) ValueCell!8330))

(declare-fun mapKey!27927 () (_ BitVec 32))

(assert (=> mapNonEmpty!27927 (= (arr!24619 _values!688) (store mapRest!27927 mapKey!27927 mapValue!27927))))

(declare-fun b!879188 () Bool)

(declare-fun e!489267 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!879188 (= e!489267 (bvslt from!1053 (size!25060 _keys!868)))))

(declare-datatypes ((tuple2!11678 0))(
  ( (tuple2!11679 (_1!5850 (_ BitVec 64)) (_2!5850 V!28433)) )
))
(declare-datatypes ((List!17478 0))(
  ( (Nil!17475) (Cons!17474 (h!18605 tuple2!11678) (t!24566 List!17478)) )
))
(declare-datatypes ((ListLongMap!10437 0))(
  ( (ListLongMap!10438 (toList!5234 List!17478)) )
))
(declare-fun lt!397356 () ListLongMap!10437)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!397355 () ListLongMap!10437)

(declare-fun +!2530 (ListLongMap!10437 tuple2!11678) ListLongMap!10437)

(declare-fun get!12947 (ValueCell!8330 V!28433) V!28433)

(declare-fun dynLambda!1225 (Int (_ BitVec 64)) V!28433)

(assert (=> b!879188 (= lt!397356 (+!2530 lt!397355 (tuple2!11679 (select (arr!24618 _keys!868) from!1053) (get!12947 (select (arr!24619 _values!688) from!1053) (dynLambda!1225 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879189 () Bool)

(declare-fun res!597371 () Bool)

(assert (=> b!879189 (=> (not res!597371) (not e!489268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51185 (_ BitVec 32)) Bool)

(assert (=> b!879189 (= res!597371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879190 () Bool)

(declare-fun res!597362 () Bool)

(assert (=> b!879190 (=> (not res!597362) (not e!489268))))

(declare-datatypes ((List!17479 0))(
  ( (Nil!17476) (Cons!17475 (h!18606 (_ BitVec 64)) (t!24567 List!17479)) )
))
(declare-fun arrayNoDuplicates!0 (array!51185 (_ BitVec 32) List!17479) Bool)

(assert (=> b!879190 (= res!597362 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17476))))

(declare-fun b!879191 () Bool)

(declare-fun e!489271 () Bool)

(assert (=> b!879191 (= e!489271 (not e!489267))))

(declare-fun res!597364 () Bool)

(assert (=> b!879191 (=> res!597364 e!489267)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879191 (= res!597364 (not (validKeyInArray!0 (select (arr!24618 _keys!868) from!1053))))))

(declare-fun lt!397357 () ListLongMap!10437)

(assert (=> b!879191 (= lt!397357 lt!397355)))

(declare-fun v!557 () V!28433)

(declare-fun lt!397358 () ListLongMap!10437)

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!879191 (= lt!397355 (+!2530 lt!397358 (tuple2!11679 k0!854 v!557)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28433)

(declare-fun zeroValue!654 () V!28433)

(declare-fun lt!397359 () array!51187)

(declare-fun getCurrentListMapNoExtraKeys!3227 (array!51185 array!51187 (_ BitVec 32) (_ BitVec 32) V!28433 V!28433 (_ BitVec 32) Int) ListLongMap!10437)

(assert (=> b!879191 (= lt!397357 (getCurrentListMapNoExtraKeys!3227 _keys!868 lt!397359 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!879191 (= lt!397358 (getCurrentListMapNoExtraKeys!3227 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29975 0))(
  ( (Unit!29976) )
))
(declare-fun lt!397361 () Unit!29975)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!699 (array!51185 array!51187 (_ BitVec 32) (_ BitVec 32) V!28433 V!28433 (_ BitVec 32) (_ BitVec 64) V!28433 (_ BitVec 32) Int) Unit!29975)

(assert (=> b!879191 (= lt!397361 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!699 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27927 () Bool)

(assert (=> mapIsEmpty!27927 mapRes!27927))

(declare-fun b!879192 () Bool)

(declare-fun e!489266 () Bool)

(assert (=> b!879192 (= e!489266 (and e!489270 mapRes!27927))))

(declare-fun condMapEmpty!27927 () Bool)

(declare-fun mapDefault!27927 () ValueCell!8330)

(assert (=> b!879192 (= condMapEmpty!27927 (= (arr!24619 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8330)) mapDefault!27927)))))

(declare-fun b!879193 () Bool)

(declare-fun res!597363 () Bool)

(assert (=> b!879193 (=> (not res!597363) (not e!489268))))

(assert (=> b!879193 (= res!597363 (and (= (size!25061 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25060 _keys!868) (size!25061 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879194 () Bool)

(declare-fun res!597366 () Bool)

(assert (=> b!879194 (=> (not res!597366) (not e!489268))))

(assert (=> b!879194 (= res!597366 (and (= (select (arr!24618 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!879195 () Bool)

(declare-fun res!597369 () Bool)

(assert (=> b!879195 (=> (not res!597369) (not e!489268))))

(assert (=> b!879195 (= res!597369 (validKeyInArray!0 k0!854))))

(declare-fun b!879196 () Bool)

(assert (=> b!879196 (= e!489268 e!489271)))

(declare-fun res!597368 () Bool)

(assert (=> b!879196 (=> (not res!597368) (not e!489271))))

(assert (=> b!879196 (= res!597368 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!879196 (= lt!397356 (getCurrentListMapNoExtraKeys!3227 _keys!868 lt!397359 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!879196 (= lt!397359 (array!51188 (store (arr!24619 _values!688) i!612 (ValueCellFull!8330 v!557)) (size!25061 _values!688)))))

(declare-fun lt!397360 () ListLongMap!10437)

(assert (=> b!879196 (= lt!397360 (getCurrentListMapNoExtraKeys!3227 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!597370 () Bool)

(assert (=> start!74608 (=> (not res!597370) (not e!489268))))

(assert (=> start!74608 (= res!597370 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25060 _keys!868))))))

(assert (=> start!74608 e!489268))

(assert (=> start!74608 tp_is_empty!17539))

(assert (=> start!74608 true))

(assert (=> start!74608 tp!53571))

(declare-fun array_inv!19444 (array!51185) Bool)

(assert (=> start!74608 (array_inv!19444 _keys!868)))

(declare-fun array_inv!19445 (array!51187) Bool)

(assert (=> start!74608 (and (array_inv!19445 _values!688) e!489266)))

(declare-fun b!879197 () Bool)

(assert (=> b!879197 (= e!489269 tp_is_empty!17539)))

(assert (= (and start!74608 res!597370) b!879186))

(assert (= (and b!879186 res!597367) b!879193))

(assert (= (and b!879193 res!597363) b!879189))

(assert (= (and b!879189 res!597371) b!879190))

(assert (= (and b!879190 res!597362) b!879187))

(assert (= (and b!879187 res!597365) b!879195))

(assert (= (and b!879195 res!597369) b!879194))

(assert (= (and b!879194 res!597366) b!879196))

(assert (= (and b!879196 res!597368) b!879191))

(assert (= (and b!879191 (not res!597364)) b!879188))

(assert (= (and b!879192 condMapEmpty!27927) mapIsEmpty!27927))

(assert (= (and b!879192 (not condMapEmpty!27927)) mapNonEmpty!27927))

(get-info :version)

(assert (= (and mapNonEmpty!27927 ((_ is ValueCellFull!8330) mapValue!27927)) b!879197))

(assert (= (and b!879192 ((_ is ValueCellFull!8330) mapDefault!27927)) b!879185))

(assert (= start!74608 b!879192))

(declare-fun b_lambda!12351 () Bool)

(assert (=> (not b_lambda!12351) (not b!879188)))

(declare-fun t!24565 () Bool)

(declare-fun tb!4945 () Bool)

(assert (=> (and start!74608 (= defaultEntry!696 defaultEntry!696) t!24565) tb!4945))

(declare-fun result!9521 () Bool)

(assert (=> tb!4945 (= result!9521 tp_is_empty!17539)))

(assert (=> b!879188 t!24565))

(declare-fun b_and!25169 () Bool)

(assert (= b_and!25167 (and (=> t!24565 result!9521) b_and!25169)))

(declare-fun m!818401 () Bool)

(assert (=> b!879188 m!818401))

(declare-fun m!818403 () Bool)

(assert (=> b!879188 m!818403))

(declare-fun m!818405 () Bool)

(assert (=> b!879188 m!818405))

(declare-fun m!818407 () Bool)

(assert (=> b!879188 m!818407))

(assert (=> b!879188 m!818403))

(declare-fun m!818409 () Bool)

(assert (=> b!879188 m!818409))

(assert (=> b!879188 m!818405))

(declare-fun m!818411 () Bool)

(assert (=> b!879195 m!818411))

(declare-fun m!818413 () Bool)

(assert (=> b!879194 m!818413))

(declare-fun m!818415 () Bool)

(assert (=> start!74608 m!818415))

(declare-fun m!818417 () Bool)

(assert (=> start!74608 m!818417))

(declare-fun m!818419 () Bool)

(assert (=> b!879190 m!818419))

(declare-fun m!818421 () Bool)

(assert (=> b!879196 m!818421))

(declare-fun m!818423 () Bool)

(assert (=> b!879196 m!818423))

(declare-fun m!818425 () Bool)

(assert (=> b!879196 m!818425))

(declare-fun m!818427 () Bool)

(assert (=> mapNonEmpty!27927 m!818427))

(declare-fun m!818429 () Bool)

(assert (=> b!879191 m!818429))

(declare-fun m!818431 () Bool)

(assert (=> b!879191 m!818431))

(assert (=> b!879191 m!818409))

(declare-fun m!818433 () Bool)

(assert (=> b!879191 m!818433))

(assert (=> b!879191 m!818409))

(declare-fun m!818435 () Bool)

(assert (=> b!879191 m!818435))

(declare-fun m!818437 () Bool)

(assert (=> b!879191 m!818437))

(declare-fun m!818439 () Bool)

(assert (=> b!879186 m!818439))

(declare-fun m!818441 () Bool)

(assert (=> b!879189 m!818441))

(check-sat b_and!25169 (not b!879186) (not b!879191) (not b!879195) (not mapNonEmpty!27927) (not b_next!15295) (not b!879196) (not start!74608) (not b!879189) tp_is_empty!17539 (not b!879188) (not b_lambda!12351) (not b!879190))
(check-sat b_and!25169 (not b_next!15295))
