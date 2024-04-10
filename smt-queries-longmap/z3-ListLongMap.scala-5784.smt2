; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74628 () Bool)

(assert start!74628)

(declare-fun b_free!15297 () Bool)

(declare-fun b_next!15297 () Bool)

(assert (=> start!74628 (= b_free!15297 (not b_next!15297))))

(declare-fun tp!53576 () Bool)

(declare-fun b_and!25197 () Bool)

(assert (=> start!74628 (= tp!53576 b_and!25197)))

(declare-fun b!879465 () Bool)

(declare-fun e!489438 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51210 0))(
  ( (array!51211 (arr!24630 (Array (_ BitVec 32) (_ BitVec 64))) (size!25070 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51210)

(assert (=> b!879465 (= e!489438 (bvslt from!1053 (size!25070 _keys!868)))))

(declare-datatypes ((V!28435 0))(
  ( (V!28436 (val!8818 Int)) )
))
(declare-datatypes ((tuple2!11664 0))(
  ( (tuple2!11665 (_1!5843 (_ BitVec 64)) (_2!5843 V!28435)) )
))
(declare-datatypes ((List!17481 0))(
  ( (Nil!17478) (Cons!17477 (h!18608 tuple2!11664) (t!24580 List!17481)) )
))
(declare-datatypes ((ListLongMap!10433 0))(
  ( (ListLongMap!10434 (toList!5232 List!17481)) )
))
(declare-fun lt!397614 () ListLongMap!10433)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!397618 () ListLongMap!10433)

(declare-datatypes ((ValueCell!8331 0))(
  ( (ValueCellFull!8331 (v!11262 V!28435)) (EmptyCell!8331) )
))
(declare-datatypes ((array!51212 0))(
  ( (array!51213 (arr!24631 (Array (_ BitVec 32) ValueCell!8331)) (size!25071 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51212)

(declare-fun +!2505 (ListLongMap!10433 tuple2!11664) ListLongMap!10433)

(declare-fun get!12942 (ValueCell!8331 V!28435) V!28435)

(declare-fun dynLambda!1223 (Int (_ BitVec 64)) V!28435)

(assert (=> b!879465 (= lt!397618 (+!2505 lt!397614 (tuple2!11665 (select (arr!24630 _keys!868) from!1053) (get!12942 (select (arr!24631 _values!688) from!1053) (dynLambda!1223 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879466 () Bool)

(declare-fun res!597506 () Bool)

(declare-fun e!489435 () Bool)

(assert (=> b!879466 (=> (not res!597506) (not e!489435))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879466 (= res!597506 (validMask!0 mask!1196))))

(declare-fun b!879467 () Bool)

(declare-fun res!597507 () Bool)

(assert (=> b!879467 (=> (not res!597507) (not e!489435))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!879467 (= res!597507 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25070 _keys!868))))))

(declare-fun b!879469 () Bool)

(declare-fun res!597504 () Bool)

(assert (=> b!879469 (=> (not res!597504) (not e!489435))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!879469 (= res!597504 (and (= (size!25071 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25070 _keys!868) (size!25071 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879470 () Bool)

(declare-fun e!489437 () Bool)

(assert (=> b!879470 (= e!489437 (not e!489438))))

(declare-fun res!597505 () Bool)

(assert (=> b!879470 (=> res!597505 e!489438)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879470 (= res!597505 (not (validKeyInArray!0 (select (arr!24630 _keys!868) from!1053))))))

(declare-fun lt!397612 () ListLongMap!10433)

(assert (=> b!879470 (= lt!397612 lt!397614)))

(declare-fun lt!397617 () ListLongMap!10433)

(declare-fun v!557 () V!28435)

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!879470 (= lt!397614 (+!2505 lt!397617 (tuple2!11665 k0!854 v!557)))))

(declare-fun minValue!654 () V!28435)

(declare-fun zeroValue!654 () V!28435)

(declare-fun lt!397613 () array!51212)

(declare-fun getCurrentListMapNoExtraKeys!3199 (array!51210 array!51212 (_ BitVec 32) (_ BitVec 32) V!28435 V!28435 (_ BitVec 32) Int) ListLongMap!10433)

(assert (=> b!879470 (= lt!397612 (getCurrentListMapNoExtraKeys!3199 _keys!868 lt!397613 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!879470 (= lt!397617 (getCurrentListMapNoExtraKeys!3199 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30034 0))(
  ( (Unit!30035) )
))
(declare-fun lt!397616 () Unit!30034)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!699 (array!51210 array!51212 (_ BitVec 32) (_ BitVec 32) V!28435 V!28435 (_ BitVec 32) (_ BitVec 64) V!28435 (_ BitVec 32) Int) Unit!30034)

(assert (=> b!879470 (= lt!397616 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!699 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879471 () Bool)

(declare-fun e!489436 () Bool)

(declare-fun tp_is_empty!17541 () Bool)

(assert (=> b!879471 (= e!489436 tp_is_empty!17541)))

(declare-fun b!879472 () Bool)

(declare-fun res!597503 () Bool)

(assert (=> b!879472 (=> (not res!597503) (not e!489435))))

(assert (=> b!879472 (= res!597503 (and (= (select (arr!24630 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27930 () Bool)

(declare-fun mapRes!27930 () Bool)

(declare-fun tp!53575 () Bool)

(declare-fun e!489439 () Bool)

(assert (=> mapNonEmpty!27930 (= mapRes!27930 (and tp!53575 e!489439))))

(declare-fun mapKey!27930 () (_ BitVec 32))

(declare-fun mapValue!27930 () ValueCell!8331)

(declare-fun mapRest!27930 () (Array (_ BitVec 32) ValueCell!8331))

(assert (=> mapNonEmpty!27930 (= (arr!24631 _values!688) (store mapRest!27930 mapKey!27930 mapValue!27930))))

(declare-fun b!879473 () Bool)

(declare-fun res!597510 () Bool)

(assert (=> b!879473 (=> (not res!597510) (not e!489435))))

(declare-datatypes ((List!17482 0))(
  ( (Nil!17479) (Cons!17478 (h!18609 (_ BitVec 64)) (t!24581 List!17482)) )
))
(declare-fun arrayNoDuplicates!0 (array!51210 (_ BitVec 32) List!17482) Bool)

(assert (=> b!879473 (= res!597510 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17479))))

(declare-fun b!879474 () Bool)

(declare-fun res!597502 () Bool)

(assert (=> b!879474 (=> (not res!597502) (not e!489435))))

(assert (=> b!879474 (= res!597502 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27930 () Bool)

(assert (=> mapIsEmpty!27930 mapRes!27930))

(declare-fun b!879475 () Bool)

(declare-fun e!489434 () Bool)

(assert (=> b!879475 (= e!489434 (and e!489436 mapRes!27930))))

(declare-fun condMapEmpty!27930 () Bool)

(declare-fun mapDefault!27930 () ValueCell!8331)

(assert (=> b!879475 (= condMapEmpty!27930 (= (arr!24631 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8331)) mapDefault!27930)))))

(declare-fun b!879476 () Bool)

(declare-fun res!597509 () Bool)

(assert (=> b!879476 (=> (not res!597509) (not e!489435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51210 (_ BitVec 32)) Bool)

(assert (=> b!879476 (= res!597509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879477 () Bool)

(assert (=> b!879477 (= e!489439 tp_is_empty!17541)))

(declare-fun res!597508 () Bool)

(assert (=> start!74628 (=> (not res!597508) (not e!489435))))

(assert (=> start!74628 (= res!597508 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25070 _keys!868))))))

(assert (=> start!74628 e!489435))

(assert (=> start!74628 tp_is_empty!17541))

(assert (=> start!74628 true))

(assert (=> start!74628 tp!53576))

(declare-fun array_inv!19410 (array!51210) Bool)

(assert (=> start!74628 (array_inv!19410 _keys!868)))

(declare-fun array_inv!19411 (array!51212) Bool)

(assert (=> start!74628 (and (array_inv!19411 _values!688) e!489434)))

(declare-fun b!879468 () Bool)

(assert (=> b!879468 (= e!489435 e!489437)))

(declare-fun res!597511 () Bool)

(assert (=> b!879468 (=> (not res!597511) (not e!489437))))

(assert (=> b!879468 (= res!597511 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!879468 (= lt!397618 (getCurrentListMapNoExtraKeys!3199 _keys!868 lt!397613 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!879468 (= lt!397613 (array!51213 (store (arr!24631 _values!688) i!612 (ValueCellFull!8331 v!557)) (size!25071 _values!688)))))

(declare-fun lt!397615 () ListLongMap!10433)

(assert (=> b!879468 (= lt!397615 (getCurrentListMapNoExtraKeys!3199 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74628 res!597508) b!879466))

(assert (= (and b!879466 res!597506) b!879469))

(assert (= (and b!879469 res!597504) b!879476))

(assert (= (and b!879476 res!597509) b!879473))

(assert (= (and b!879473 res!597510) b!879467))

(assert (= (and b!879467 res!597507) b!879474))

(assert (= (and b!879474 res!597502) b!879472))

(assert (= (and b!879472 res!597503) b!879468))

(assert (= (and b!879468 res!597511) b!879470))

(assert (= (and b!879470 (not res!597505)) b!879465))

(assert (= (and b!879475 condMapEmpty!27930) mapIsEmpty!27930))

(assert (= (and b!879475 (not condMapEmpty!27930)) mapNonEmpty!27930))

(get-info :version)

(assert (= (and mapNonEmpty!27930 ((_ is ValueCellFull!8331) mapValue!27930)) b!879477))

(assert (= (and b!879475 ((_ is ValueCellFull!8331) mapDefault!27930)) b!879471))

(assert (= start!74628 b!879475))

(declare-fun b_lambda!12371 () Bool)

(assert (=> (not b_lambda!12371) (not b!879465)))

(declare-fun t!24579 () Bool)

(declare-fun tb!4955 () Bool)

(assert (=> (and start!74628 (= defaultEntry!696 defaultEntry!696) t!24579) tb!4955))

(declare-fun result!9533 () Bool)

(assert (=> tb!4955 (= result!9533 tp_is_empty!17541)))

(assert (=> b!879465 t!24579))

(declare-fun b_and!25199 () Bool)

(assert (= b_and!25197 (and (=> t!24579 result!9533) b_and!25199)))

(declare-fun m!819201 () Bool)

(assert (=> b!879468 m!819201))

(declare-fun m!819203 () Bool)

(assert (=> b!879468 m!819203))

(declare-fun m!819205 () Bool)

(assert (=> b!879468 m!819205))

(declare-fun m!819207 () Bool)

(assert (=> b!879474 m!819207))

(declare-fun m!819209 () Bool)

(assert (=> b!879473 m!819209))

(declare-fun m!819211 () Bool)

(assert (=> b!879466 m!819211))

(declare-fun m!819213 () Bool)

(assert (=> b!879472 m!819213))

(declare-fun m!819215 () Bool)

(assert (=> mapNonEmpty!27930 m!819215))

(declare-fun m!819217 () Bool)

(assert (=> b!879465 m!819217))

(declare-fun m!819219 () Bool)

(assert (=> b!879465 m!819219))

(declare-fun m!819221 () Bool)

(assert (=> b!879465 m!819221))

(declare-fun m!819223 () Bool)

(assert (=> b!879465 m!819223))

(assert (=> b!879465 m!819219))

(declare-fun m!819225 () Bool)

(assert (=> b!879465 m!819225))

(assert (=> b!879465 m!819221))

(declare-fun m!819227 () Bool)

(assert (=> b!879470 m!819227))

(declare-fun m!819229 () Bool)

(assert (=> b!879470 m!819229))

(declare-fun m!819231 () Bool)

(assert (=> b!879470 m!819231))

(assert (=> b!879470 m!819225))

(declare-fun m!819233 () Bool)

(assert (=> b!879470 m!819233))

(assert (=> b!879470 m!819225))

(declare-fun m!819235 () Bool)

(assert (=> b!879470 m!819235))

(declare-fun m!819237 () Bool)

(assert (=> b!879476 m!819237))

(declare-fun m!819239 () Bool)

(assert (=> start!74628 m!819239))

(declare-fun m!819241 () Bool)

(assert (=> start!74628 m!819241))

(check-sat (not b!879470) (not b_lambda!12371) (not mapNonEmpty!27930) tp_is_empty!17541 (not b!879466) (not start!74628) (not b!879476) (not b!879474) (not b!879468) b_and!25199 (not b!879473) (not b!879465) (not b_next!15297))
(check-sat b_and!25199 (not b_next!15297))
