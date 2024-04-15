; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74304 () Bool)

(assert start!74304)

(declare-fun b_free!15085 () Bool)

(declare-fun b_next!15085 () Bool)

(assert (=> start!74304 (= b_free!15085 (not b_next!15085))))

(declare-fun tp!52930 () Bool)

(declare-fun b_and!24835 () Bool)

(assert (=> start!74304 (= tp!52930 b_and!24835)))

(declare-fun b!874338 () Bool)

(declare-fun res!594242 () Bool)

(declare-fun e!486784 () Bool)

(assert (=> b!874338 (=> (not res!594242) (not e!486784))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50767 0))(
  ( (array!50768 (arr!24412 (Array (_ BitVec 32) (_ BitVec 64))) (size!24854 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50767)

(assert (=> b!874338 (= res!594242 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24854 _keys!868))))))

(declare-fun b!874339 () Bool)

(declare-fun e!486787 () Bool)

(declare-fun e!486786 () Bool)

(declare-fun mapRes!27602 () Bool)

(assert (=> b!874339 (= e!486787 (and e!486786 mapRes!27602))))

(declare-fun condMapEmpty!27602 () Bool)

(declare-datatypes ((V!28153 0))(
  ( (V!28154 (val!8712 Int)) )
))
(declare-datatypes ((ValueCell!8225 0))(
  ( (ValueCellFull!8225 (v!11135 V!28153)) (EmptyCell!8225) )
))
(declare-datatypes ((array!50769 0))(
  ( (array!50770 (arr!24413 (Array (_ BitVec 32) ValueCell!8225)) (size!24855 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50769)

(declare-fun mapDefault!27602 () ValueCell!8225)

(assert (=> b!874339 (= condMapEmpty!27602 (= (arr!24413 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8225)) mapDefault!27602)))))

(declare-fun b!874340 () Bool)

(assert (=> b!874340 (= e!486784 false)))

(declare-fun v!557 () V!28153)

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28153)

(declare-fun zeroValue!654 () V!28153)

(declare-datatypes ((tuple2!11520 0))(
  ( (tuple2!11521 (_1!5771 (_ BitVec 64)) (_2!5771 V!28153)) )
))
(declare-datatypes ((List!17332 0))(
  ( (Nil!17329) (Cons!17328 (h!18459 tuple2!11520) (t!24364 List!17332)) )
))
(declare-datatypes ((ListLongMap!10279 0))(
  ( (ListLongMap!10280 (toList!5155 List!17332)) )
))
(declare-fun lt!395733 () ListLongMap!10279)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3148 (array!50767 array!50769 (_ BitVec 32) (_ BitVec 32) V!28153 V!28153 (_ BitVec 32) Int) ListLongMap!10279)

(assert (=> b!874340 (= lt!395733 (getCurrentListMapNoExtraKeys!3148 _keys!868 (array!50770 (store (arr!24413 _values!688) i!612 (ValueCellFull!8225 v!557)) (size!24855 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395732 () ListLongMap!10279)

(assert (=> b!874340 (= lt!395732 (getCurrentListMapNoExtraKeys!3148 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874341 () Bool)

(declare-fun res!594241 () Bool)

(assert (=> b!874341 (=> (not res!594241) (not e!486784))))

(declare-datatypes ((List!17333 0))(
  ( (Nil!17330) (Cons!17329 (h!18460 (_ BitVec 64)) (t!24365 List!17333)) )
))
(declare-fun arrayNoDuplicates!0 (array!50767 (_ BitVec 32) List!17333) Bool)

(assert (=> b!874341 (= res!594241 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17330))))

(declare-fun b!874342 () Bool)

(declare-fun res!594243 () Bool)

(assert (=> b!874342 (=> (not res!594243) (not e!486784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874342 (= res!594243 (validMask!0 mask!1196))))

(declare-fun b!874343 () Bool)

(declare-fun tp_is_empty!17329 () Bool)

(assert (=> b!874343 (= e!486786 tp_is_empty!17329)))

(declare-fun res!594237 () Bool)

(assert (=> start!74304 (=> (not res!594237) (not e!486784))))

(assert (=> start!74304 (= res!594237 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24854 _keys!868))))))

(assert (=> start!74304 e!486784))

(assert (=> start!74304 tp_is_empty!17329))

(assert (=> start!74304 true))

(assert (=> start!74304 tp!52930))

(declare-fun array_inv!19308 (array!50767) Bool)

(assert (=> start!74304 (array_inv!19308 _keys!868)))

(declare-fun array_inv!19309 (array!50769) Bool)

(assert (=> start!74304 (and (array_inv!19309 _values!688) e!486787)))

(declare-fun b!874344 () Bool)

(declare-fun e!486783 () Bool)

(assert (=> b!874344 (= e!486783 tp_is_empty!17329)))

(declare-fun b!874345 () Bool)

(declare-fun res!594239 () Bool)

(assert (=> b!874345 (=> (not res!594239) (not e!486784))))

(assert (=> b!874345 (= res!594239 (and (= (size!24855 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24854 _keys!868) (size!24855 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27602 () Bool)

(declare-fun tp!52931 () Bool)

(assert (=> mapNonEmpty!27602 (= mapRes!27602 (and tp!52931 e!486783))))

(declare-fun mapKey!27602 () (_ BitVec 32))

(declare-fun mapValue!27602 () ValueCell!8225)

(declare-fun mapRest!27602 () (Array (_ BitVec 32) ValueCell!8225))

(assert (=> mapNonEmpty!27602 (= (arr!24413 _values!688) (store mapRest!27602 mapKey!27602 mapValue!27602))))

(declare-fun mapIsEmpty!27602 () Bool)

(assert (=> mapIsEmpty!27602 mapRes!27602))

(declare-fun b!874346 () Bool)

(declare-fun res!594244 () Bool)

(assert (=> b!874346 (=> (not res!594244) (not e!486784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50767 (_ BitVec 32)) Bool)

(assert (=> b!874346 (= res!594244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874347 () Bool)

(declare-fun res!594240 () Bool)

(assert (=> b!874347 (=> (not res!594240) (not e!486784))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!874347 (= res!594240 (and (= (select (arr!24412 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874348 () Bool)

(declare-fun res!594238 () Bool)

(assert (=> b!874348 (=> (not res!594238) (not e!486784))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874348 (= res!594238 (validKeyInArray!0 k0!854))))

(assert (= (and start!74304 res!594237) b!874342))

(assert (= (and b!874342 res!594243) b!874345))

(assert (= (and b!874345 res!594239) b!874346))

(assert (= (and b!874346 res!594244) b!874341))

(assert (= (and b!874341 res!594241) b!874338))

(assert (= (and b!874338 res!594242) b!874348))

(assert (= (and b!874348 res!594238) b!874347))

(assert (= (and b!874347 res!594240) b!874340))

(assert (= (and b!874339 condMapEmpty!27602) mapIsEmpty!27602))

(assert (= (and b!874339 (not condMapEmpty!27602)) mapNonEmpty!27602))

(get-info :version)

(assert (= (and mapNonEmpty!27602 ((_ is ValueCellFull!8225) mapValue!27602)) b!874344))

(assert (= (and b!874339 ((_ is ValueCellFull!8225) mapDefault!27602)) b!874343))

(assert (= start!74304 b!874339))

(declare-fun m!813941 () Bool)

(assert (=> b!874342 m!813941))

(declare-fun m!813943 () Bool)

(assert (=> b!874348 m!813943))

(declare-fun m!813945 () Bool)

(assert (=> b!874347 m!813945))

(declare-fun m!813947 () Bool)

(assert (=> start!74304 m!813947))

(declare-fun m!813949 () Bool)

(assert (=> start!74304 m!813949))

(declare-fun m!813951 () Bool)

(assert (=> b!874340 m!813951))

(declare-fun m!813953 () Bool)

(assert (=> b!874340 m!813953))

(declare-fun m!813955 () Bool)

(assert (=> b!874340 m!813955))

(declare-fun m!813957 () Bool)

(assert (=> mapNonEmpty!27602 m!813957))

(declare-fun m!813959 () Bool)

(assert (=> b!874346 m!813959))

(declare-fun m!813961 () Bool)

(assert (=> b!874341 m!813961))

(check-sat b_and!24835 (not b!874348) (not b!874340) (not mapNonEmpty!27602) (not b!874342) (not b_next!15085) (not start!74304) (not b!874346) tp_is_empty!17329 (not b!874341))
(check-sat b_and!24835 (not b_next!15085))
