; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74522 () Bool)

(assert start!74522)

(declare-fun b_free!15229 () Bool)

(declare-fun b_next!15229 () Bool)

(assert (=> start!74522 (= b_free!15229 (not b_next!15229))))

(declare-fun tp!53370 () Bool)

(declare-fun b_and!25079 () Bool)

(assert (=> start!74522 (= tp!53370 b_and!25079)))

(declare-fun b!877875 () Bool)

(declare-fun res!596438 () Bool)

(declare-fun e!488607 () Bool)

(assert (=> b!877875 (=> (not res!596438) (not e!488607))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51053 0))(
  ( (array!51054 (arr!24553 (Array (_ BitVec 32) (_ BitVec 64))) (size!24995 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51053)

(assert (=> b!877875 (= res!596438 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24995 _keys!868))))))

(declare-fun res!596437 () Bool)

(assert (=> start!74522 (=> (not res!596437) (not e!488607))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74522 (= res!596437 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24995 _keys!868))))))

(assert (=> start!74522 e!488607))

(declare-fun tp_is_empty!17473 () Bool)

(assert (=> start!74522 tp_is_empty!17473))

(assert (=> start!74522 true))

(assert (=> start!74522 tp!53370))

(declare-fun array_inv!19392 (array!51053) Bool)

(assert (=> start!74522 (array_inv!19392 _keys!868)))

(declare-datatypes ((V!28345 0))(
  ( (V!28346 (val!8784 Int)) )
))
(declare-datatypes ((ValueCell!8297 0))(
  ( (ValueCellFull!8297 (v!11218 V!28345)) (EmptyCell!8297) )
))
(declare-datatypes ((array!51055 0))(
  ( (array!51056 (arr!24554 (Array (_ BitVec 32) ValueCell!8297)) (size!24996 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51055)

(declare-fun e!488606 () Bool)

(declare-fun array_inv!19393 (array!51055) Bool)

(assert (=> start!74522 (and (array_inv!19393 _values!688) e!488606)))

(declare-fun b!877876 () Bool)

(declare-fun e!488605 () Bool)

(declare-fun mapRes!27825 () Bool)

(assert (=> b!877876 (= e!488606 (and e!488605 mapRes!27825))))

(declare-fun condMapEmpty!27825 () Bool)

(declare-fun mapDefault!27825 () ValueCell!8297)

(assert (=> b!877876 (= condMapEmpty!27825 (= (arr!24554 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8297)) mapDefault!27825)))))

(declare-fun mapIsEmpty!27825 () Bool)

(assert (=> mapIsEmpty!27825 mapRes!27825))

(declare-fun b!877877 () Bool)

(declare-fun res!596441 () Bool)

(assert (=> b!877877 (=> (not res!596441) (not e!488607))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877877 (= res!596441 (validMask!0 mask!1196))))

(declare-fun b!877878 () Bool)

(declare-fun res!596435 () Bool)

(assert (=> b!877878 (=> (not res!596435) (not e!488607))))

(declare-datatypes ((List!17432 0))(
  ( (Nil!17429) (Cons!17428 (h!18559 (_ BitVec 64)) (t!24512 List!17432)) )
))
(declare-fun arrayNoDuplicates!0 (array!51053 (_ BitVec 32) List!17432) Bool)

(assert (=> b!877878 (= res!596435 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17429))))

(declare-fun b!877879 () Bool)

(declare-fun res!596436 () Bool)

(assert (=> b!877879 (=> (not res!596436) (not e!488607))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!877879 (= res!596436 (and (= (size!24996 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24995 _keys!868) (size!24996 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877880 () Bool)

(declare-fun res!596440 () Bool)

(assert (=> b!877880 (=> (not res!596440) (not e!488607))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!877880 (= res!596440 (and (= (select (arr!24553 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!877881 () Bool)

(declare-fun res!596439 () Bool)

(assert (=> b!877881 (=> (not res!596439) (not e!488607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877881 (= res!596439 (validKeyInArray!0 k0!854))))

(declare-fun b!877882 () Bool)

(assert (=> b!877882 (= e!488605 tp_is_empty!17473)))

(declare-fun b!877883 () Bool)

(assert (=> b!877883 (= e!488607 false)))

(declare-datatypes ((tuple2!11630 0))(
  ( (tuple2!11631 (_1!5826 (_ BitVec 64)) (_2!5826 V!28345)) )
))
(declare-datatypes ((List!17433 0))(
  ( (Nil!17430) (Cons!17429 (h!18560 tuple2!11630) (t!24513 List!17433)) )
))
(declare-datatypes ((ListLongMap!10389 0))(
  ( (ListLongMap!10390 (toList!5210 List!17433)) )
))
(declare-fun lt!396961 () ListLongMap!10389)

(declare-fun v!557 () V!28345)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28345)

(declare-fun zeroValue!654 () V!28345)

(declare-fun getCurrentListMapNoExtraKeys!3203 (array!51053 array!51055 (_ BitVec 32) (_ BitVec 32) V!28345 V!28345 (_ BitVec 32) Int) ListLongMap!10389)

(assert (=> b!877883 (= lt!396961 (getCurrentListMapNoExtraKeys!3203 _keys!868 (array!51056 (store (arr!24554 _values!688) i!612 (ValueCellFull!8297 v!557)) (size!24996 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396960 () ListLongMap!10389)

(assert (=> b!877883 (= lt!396960 (getCurrentListMapNoExtraKeys!3203 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877884 () Bool)

(declare-fun e!488604 () Bool)

(assert (=> b!877884 (= e!488604 tp_is_empty!17473)))

(declare-fun mapNonEmpty!27825 () Bool)

(declare-fun tp!53369 () Bool)

(assert (=> mapNonEmpty!27825 (= mapRes!27825 (and tp!53369 e!488604))))

(declare-fun mapValue!27825 () ValueCell!8297)

(declare-fun mapRest!27825 () (Array (_ BitVec 32) ValueCell!8297))

(declare-fun mapKey!27825 () (_ BitVec 32))

(assert (=> mapNonEmpty!27825 (= (arr!24554 _values!688) (store mapRest!27825 mapKey!27825 mapValue!27825))))

(declare-fun b!877885 () Bool)

(declare-fun res!596442 () Bool)

(assert (=> b!877885 (=> (not res!596442) (not e!488607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51053 (_ BitVec 32)) Bool)

(assert (=> b!877885 (= res!596442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74522 res!596437) b!877877))

(assert (= (and b!877877 res!596441) b!877879))

(assert (= (and b!877879 res!596436) b!877885))

(assert (= (and b!877885 res!596442) b!877878))

(assert (= (and b!877878 res!596435) b!877875))

(assert (= (and b!877875 res!596438) b!877881))

(assert (= (and b!877881 res!596439) b!877880))

(assert (= (and b!877880 res!596440) b!877883))

(assert (= (and b!877876 condMapEmpty!27825) mapIsEmpty!27825))

(assert (= (and b!877876 (not condMapEmpty!27825)) mapNonEmpty!27825))

(get-info :version)

(assert (= (and mapNonEmpty!27825 ((_ is ValueCellFull!8297) mapValue!27825)) b!877884))

(assert (= (and b!877876 ((_ is ValueCellFull!8297) mapDefault!27825)) b!877882))

(assert (= start!74522 b!877876))

(declare-fun m!817335 () Bool)

(assert (=> start!74522 m!817335))

(declare-fun m!817337 () Bool)

(assert (=> start!74522 m!817337))

(declare-fun m!817339 () Bool)

(assert (=> mapNonEmpty!27825 m!817339))

(declare-fun m!817341 () Bool)

(assert (=> b!877877 m!817341))

(declare-fun m!817343 () Bool)

(assert (=> b!877878 m!817343))

(declare-fun m!817345 () Bool)

(assert (=> b!877885 m!817345))

(declare-fun m!817347 () Bool)

(assert (=> b!877883 m!817347))

(declare-fun m!817349 () Bool)

(assert (=> b!877883 m!817349))

(declare-fun m!817351 () Bool)

(assert (=> b!877883 m!817351))

(declare-fun m!817353 () Bool)

(assert (=> b!877881 m!817353))

(declare-fun m!817355 () Bool)

(assert (=> b!877880 m!817355))

(check-sat b_and!25079 (not b!877885) tp_is_empty!17473 (not b!877881) (not mapNonEmpty!27825) (not start!74522) (not b!877883) (not b_next!15229) (not b!877877) (not b!877878))
(check-sat b_and!25079 (not b_next!15229))
