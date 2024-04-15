; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74498 () Bool)

(assert start!74498)

(declare-fun b_free!15205 () Bool)

(declare-fun b_next!15205 () Bool)

(assert (=> start!74498 (= b_free!15205 (not b_next!15205))))

(declare-fun tp!53298 () Bool)

(declare-fun b_and!25055 () Bool)

(assert (=> start!74498 (= tp!53298 b_and!25055)))

(declare-fun b!877479 () Bool)

(declare-fun res!596147 () Bool)

(declare-fun e!488424 () Bool)

(assert (=> b!877479 (=> (not res!596147) (not e!488424))))

(declare-datatypes ((array!51005 0))(
  ( (array!51006 (arr!24529 (Array (_ BitVec 32) (_ BitVec 64))) (size!24971 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51005)

(declare-datatypes ((List!17414 0))(
  ( (Nil!17411) (Cons!17410 (h!18541 (_ BitVec 64)) (t!24494 List!17414)) )
))
(declare-fun arrayNoDuplicates!0 (array!51005 (_ BitVec 32) List!17414) Bool)

(assert (=> b!877479 (= res!596147 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17411))))

(declare-fun res!596152 () Bool)

(assert (=> start!74498 (=> (not res!596152) (not e!488424))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74498 (= res!596152 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24971 _keys!868))))))

(assert (=> start!74498 e!488424))

(declare-fun tp_is_empty!17449 () Bool)

(assert (=> start!74498 tp_is_empty!17449))

(assert (=> start!74498 true))

(assert (=> start!74498 tp!53298))

(declare-fun array_inv!19376 (array!51005) Bool)

(assert (=> start!74498 (array_inv!19376 _keys!868)))

(declare-datatypes ((V!28313 0))(
  ( (V!28314 (val!8772 Int)) )
))
(declare-datatypes ((ValueCell!8285 0))(
  ( (ValueCellFull!8285 (v!11206 V!28313)) (EmptyCell!8285) )
))
(declare-datatypes ((array!51007 0))(
  ( (array!51008 (arr!24530 (Array (_ BitVec 32) ValueCell!8285)) (size!24972 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51007)

(declare-fun e!488427 () Bool)

(declare-fun array_inv!19377 (array!51007) Bool)

(assert (=> start!74498 (and (array_inv!19377 _values!688) e!488427)))

(declare-fun b!877480 () Bool)

(declare-fun res!596150 () Bool)

(assert (=> b!877480 (=> (not res!596150) (not e!488424))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!877480 (= res!596150 (and (= (select (arr!24529 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!877481 () Bool)

(assert (=> b!877481 (= e!488424 false)))

(declare-fun v!557 () V!28313)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11610 0))(
  ( (tuple2!11611 (_1!5816 (_ BitVec 64)) (_2!5816 V!28313)) )
))
(declare-datatypes ((List!17415 0))(
  ( (Nil!17412) (Cons!17411 (h!18542 tuple2!11610) (t!24495 List!17415)) )
))
(declare-datatypes ((ListLongMap!10369 0))(
  ( (ListLongMap!10370 (toList!5200 List!17415)) )
))
(declare-fun lt!396888 () ListLongMap!10369)

(declare-fun minValue!654 () V!28313)

(declare-fun zeroValue!654 () V!28313)

(declare-fun getCurrentListMapNoExtraKeys!3193 (array!51005 array!51007 (_ BitVec 32) (_ BitVec 32) V!28313 V!28313 (_ BitVec 32) Int) ListLongMap!10369)

(assert (=> b!877481 (= lt!396888 (getCurrentListMapNoExtraKeys!3193 _keys!868 (array!51008 (store (arr!24530 _values!688) i!612 (ValueCellFull!8285 v!557)) (size!24972 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396889 () ListLongMap!10369)

(assert (=> b!877481 (= lt!396889 (getCurrentListMapNoExtraKeys!3193 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877482 () Bool)

(declare-fun e!488423 () Bool)

(declare-fun mapRes!27789 () Bool)

(assert (=> b!877482 (= e!488427 (and e!488423 mapRes!27789))))

(declare-fun condMapEmpty!27789 () Bool)

(declare-fun mapDefault!27789 () ValueCell!8285)

(assert (=> b!877482 (= condMapEmpty!27789 (= (arr!24530 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8285)) mapDefault!27789)))))

(declare-fun b!877483 () Bool)

(declare-fun res!596148 () Bool)

(assert (=> b!877483 (=> (not res!596148) (not e!488424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51005 (_ BitVec 32)) Bool)

(assert (=> b!877483 (= res!596148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877484 () Bool)

(declare-fun e!488426 () Bool)

(assert (=> b!877484 (= e!488426 tp_is_empty!17449)))

(declare-fun b!877485 () Bool)

(declare-fun res!596149 () Bool)

(assert (=> b!877485 (=> (not res!596149) (not e!488424))))

(assert (=> b!877485 (= res!596149 (and (= (size!24972 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24971 _keys!868) (size!24972 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877486 () Bool)

(assert (=> b!877486 (= e!488423 tp_is_empty!17449)))

(declare-fun mapNonEmpty!27789 () Bool)

(declare-fun tp!53297 () Bool)

(assert (=> mapNonEmpty!27789 (= mapRes!27789 (and tp!53297 e!488426))))

(declare-fun mapKey!27789 () (_ BitVec 32))

(declare-fun mapRest!27789 () (Array (_ BitVec 32) ValueCell!8285))

(declare-fun mapValue!27789 () ValueCell!8285)

(assert (=> mapNonEmpty!27789 (= (arr!24530 _values!688) (store mapRest!27789 mapKey!27789 mapValue!27789))))

(declare-fun b!877487 () Bool)

(declare-fun res!596154 () Bool)

(assert (=> b!877487 (=> (not res!596154) (not e!488424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877487 (= res!596154 (validMask!0 mask!1196))))

(declare-fun b!877488 () Bool)

(declare-fun res!596153 () Bool)

(assert (=> b!877488 (=> (not res!596153) (not e!488424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877488 (= res!596153 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27789 () Bool)

(assert (=> mapIsEmpty!27789 mapRes!27789))

(declare-fun b!877489 () Bool)

(declare-fun res!596151 () Bool)

(assert (=> b!877489 (=> (not res!596151) (not e!488424))))

(assert (=> b!877489 (= res!596151 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24971 _keys!868))))))

(assert (= (and start!74498 res!596152) b!877487))

(assert (= (and b!877487 res!596154) b!877485))

(assert (= (and b!877485 res!596149) b!877483))

(assert (= (and b!877483 res!596148) b!877479))

(assert (= (and b!877479 res!596147) b!877489))

(assert (= (and b!877489 res!596151) b!877488))

(assert (= (and b!877488 res!596153) b!877480))

(assert (= (and b!877480 res!596150) b!877481))

(assert (= (and b!877482 condMapEmpty!27789) mapIsEmpty!27789))

(assert (= (and b!877482 (not condMapEmpty!27789)) mapNonEmpty!27789))

(get-info :version)

(assert (= (and mapNonEmpty!27789 ((_ is ValueCellFull!8285) mapValue!27789)) b!877484))

(assert (= (and b!877482 ((_ is ValueCellFull!8285) mapDefault!27789)) b!877486))

(assert (= start!74498 b!877482))

(declare-fun m!817071 () Bool)

(assert (=> b!877487 m!817071))

(declare-fun m!817073 () Bool)

(assert (=> b!877479 m!817073))

(declare-fun m!817075 () Bool)

(assert (=> b!877483 m!817075))

(declare-fun m!817077 () Bool)

(assert (=> b!877480 m!817077))

(declare-fun m!817079 () Bool)

(assert (=> start!74498 m!817079))

(declare-fun m!817081 () Bool)

(assert (=> start!74498 m!817081))

(declare-fun m!817083 () Bool)

(assert (=> b!877488 m!817083))

(declare-fun m!817085 () Bool)

(assert (=> mapNonEmpty!27789 m!817085))

(declare-fun m!817087 () Bool)

(assert (=> b!877481 m!817087))

(declare-fun m!817089 () Bool)

(assert (=> b!877481 m!817089))

(declare-fun m!817091 () Bool)

(assert (=> b!877481 m!817091))

(check-sat (not b!877481) (not start!74498) (not mapNonEmpty!27789) b_and!25055 (not b!877488) (not b!877479) (not b_next!15205) (not b!877483) tp_is_empty!17449 (not b!877487))
(check-sat b_and!25055 (not b_next!15205))
