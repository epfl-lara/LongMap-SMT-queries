; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74672 () Bool)

(assert start!74672)

(declare-fun b_free!15193 () Bool)

(declare-fun b_next!15193 () Bool)

(assert (=> start!74672 (= b_free!15193 (not b_next!15193))))

(declare-fun tp!53262 () Bool)

(declare-fun b_and!25079 () Bool)

(assert (=> start!74672 (= tp!53262 b_and!25079)))

(declare-fun b!878423 () Bool)

(declare-fun res!596463 () Bool)

(declare-fun e!489064 () Bool)

(assert (=> b!878423 (=> (not res!596463) (not e!489064))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51045 0))(
  ( (array!51046 (arr!24544 (Array (_ BitVec 32) (_ BitVec 64))) (size!24985 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51045)

(assert (=> b!878423 (= res!596463 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24985 _keys!868))))))

(declare-fun mapNonEmpty!27771 () Bool)

(declare-fun mapRes!27771 () Bool)

(declare-fun tp!53261 () Bool)

(declare-fun e!489065 () Bool)

(assert (=> mapNonEmpty!27771 (= mapRes!27771 (and tp!53261 e!489065))))

(declare-datatypes ((V!28297 0))(
  ( (V!28298 (val!8766 Int)) )
))
(declare-datatypes ((ValueCell!8279 0))(
  ( (ValueCellFull!8279 (v!11206 V!28297)) (EmptyCell!8279) )
))
(declare-fun mapRest!27771 () (Array (_ BitVec 32) ValueCell!8279))

(declare-fun mapKey!27771 () (_ BitVec 32))

(declare-fun mapValue!27771 () ValueCell!8279)

(declare-datatypes ((array!51047 0))(
  ( (array!51048 (arr!24545 (Array (_ BitVec 32) ValueCell!8279)) (size!24986 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51047)

(assert (=> mapNonEmpty!27771 (= (arr!24545 _values!688) (store mapRest!27771 mapKey!27771 mapValue!27771))))

(declare-fun b!878424 () Bool)

(declare-fun e!489067 () Bool)

(declare-fun tp_is_empty!17437 () Bool)

(assert (=> b!878424 (= e!489067 tp_is_empty!17437)))

(declare-fun mapIsEmpty!27771 () Bool)

(assert (=> mapIsEmpty!27771 mapRes!27771))

(declare-fun b!878425 () Bool)

(declare-fun e!489066 () Bool)

(assert (=> b!878425 (= e!489066 (and e!489067 mapRes!27771))))

(declare-fun condMapEmpty!27771 () Bool)

(declare-fun mapDefault!27771 () ValueCell!8279)

(assert (=> b!878425 (= condMapEmpty!27771 (= (arr!24545 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8279)) mapDefault!27771)))))

(declare-fun res!596464 () Bool)

(assert (=> start!74672 (=> (not res!596464) (not e!489064))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74672 (= res!596464 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24985 _keys!868))))))

(assert (=> start!74672 e!489064))

(assert (=> start!74672 tp_is_empty!17437))

(assert (=> start!74672 true))

(assert (=> start!74672 tp!53262))

(declare-fun array_inv!19396 (array!51045) Bool)

(assert (=> start!74672 (array_inv!19396 _keys!868)))

(declare-fun array_inv!19397 (array!51047) Bool)

(assert (=> start!74672 (and (array_inv!19397 _values!688) e!489066)))

(declare-fun b!878426 () Bool)

(declare-fun res!596460 () Bool)

(assert (=> b!878426 (=> (not res!596460) (not e!489064))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!878426 (= res!596460 (and (= (select (arr!24544 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878427 () Bool)

(declare-fun res!596458 () Bool)

(assert (=> b!878427 (=> (not res!596458) (not e!489064))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878427 (= res!596458 (validMask!0 mask!1196))))

(declare-fun b!878428 () Bool)

(declare-fun res!596462 () Bool)

(assert (=> b!878428 (=> (not res!596462) (not e!489064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51045 (_ BitVec 32)) Bool)

(assert (=> b!878428 (= res!596462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878429 () Bool)

(declare-fun res!596461 () Bool)

(assert (=> b!878429 (=> (not res!596461) (not e!489064))))

(declare-datatypes ((List!17364 0))(
  ( (Nil!17361) (Cons!17360 (h!18497 (_ BitVec 64)) (t!24445 List!17364)) )
))
(declare-fun arrayNoDuplicates!0 (array!51045 (_ BitVec 32) List!17364) Bool)

(assert (=> b!878429 (= res!596461 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17361))))

(declare-fun b!878430 () Bool)

(declare-fun res!596459 () Bool)

(assert (=> b!878430 (=> (not res!596459) (not e!489064))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!878430 (= res!596459 (and (= (size!24986 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24985 _keys!868) (size!24986 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878431 () Bool)

(assert (=> b!878431 (= e!489064 false)))

(declare-fun v!557 () V!28297)

(declare-fun minValue!654 () V!28297)

(declare-fun zeroValue!654 () V!28297)

(declare-datatypes ((tuple2!11530 0))(
  ( (tuple2!11531 (_1!5776 (_ BitVec 64)) (_2!5776 V!28297)) )
))
(declare-datatypes ((List!17365 0))(
  ( (Nil!17362) (Cons!17361 (h!18498 tuple2!11530) (t!24446 List!17365)) )
))
(declare-datatypes ((ListLongMap!10301 0))(
  ( (ListLongMap!10302 (toList!5166 List!17365)) )
))
(declare-fun lt!397450 () ListLongMap!10301)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3208 (array!51045 array!51047 (_ BitVec 32) (_ BitVec 32) V!28297 V!28297 (_ BitVec 32) Int) ListLongMap!10301)

(assert (=> b!878431 (= lt!397450 (getCurrentListMapNoExtraKeys!3208 _keys!868 (array!51048 (store (arr!24545 _values!688) i!612 (ValueCellFull!8279 v!557)) (size!24986 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397449 () ListLongMap!10301)

(assert (=> b!878431 (= lt!397449 (getCurrentListMapNoExtraKeys!3208 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878432 () Bool)

(assert (=> b!878432 (= e!489065 tp_is_empty!17437)))

(declare-fun b!878433 () Bool)

(declare-fun res!596457 () Bool)

(assert (=> b!878433 (=> (not res!596457) (not e!489064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878433 (= res!596457 (validKeyInArray!0 k0!854))))

(assert (= (and start!74672 res!596464) b!878427))

(assert (= (and b!878427 res!596458) b!878430))

(assert (= (and b!878430 res!596459) b!878428))

(assert (= (and b!878428 res!596462) b!878429))

(assert (= (and b!878429 res!596461) b!878423))

(assert (= (and b!878423 res!596463) b!878433))

(assert (= (and b!878433 res!596457) b!878426))

(assert (= (and b!878426 res!596460) b!878431))

(assert (= (and b!878425 condMapEmpty!27771) mapIsEmpty!27771))

(assert (= (and b!878425 (not condMapEmpty!27771)) mapNonEmpty!27771))

(get-info :version)

(assert (= (and mapNonEmpty!27771 ((_ is ValueCellFull!8279) mapValue!27771)) b!878432))

(assert (= (and b!878425 ((_ is ValueCellFull!8279) mapDefault!27771)) b!878424))

(assert (= start!74672 b!878425))

(declare-fun m!818991 () Bool)

(assert (=> b!878428 m!818991))

(declare-fun m!818993 () Bool)

(assert (=> b!878429 m!818993))

(declare-fun m!818995 () Bool)

(assert (=> b!878427 m!818995))

(declare-fun m!818997 () Bool)

(assert (=> b!878433 m!818997))

(declare-fun m!818999 () Bool)

(assert (=> b!878431 m!818999))

(declare-fun m!819001 () Bool)

(assert (=> b!878431 m!819001))

(declare-fun m!819003 () Bool)

(assert (=> b!878431 m!819003))

(declare-fun m!819005 () Bool)

(assert (=> start!74672 m!819005))

(declare-fun m!819007 () Bool)

(assert (=> start!74672 m!819007))

(declare-fun m!819009 () Bool)

(assert (=> mapNonEmpty!27771 m!819009))

(declare-fun m!819011 () Bool)

(assert (=> b!878426 m!819011))

(check-sat (not b_next!15193) (not start!74672) (not b!878427) (not b!878431) (not b!878429) b_and!25079 (not b!878433) (not b!878428) tp_is_empty!17437 (not mapNonEmpty!27771))
(check-sat b_and!25079 (not b_next!15193))
