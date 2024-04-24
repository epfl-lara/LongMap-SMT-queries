; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74134 () Bool)

(assert start!74134)

(declare-fun b_free!14881 () Bool)

(declare-fun b_next!14881 () Bool)

(assert (=> start!74134 (= b_free!14881 (not b_next!14881))))

(declare-fun tp!52148 () Bool)

(declare-fun b_and!24643 () Bool)

(assert (=> start!74134 (= tp!52148 b_and!24643)))

(declare-fun mapNonEmpty!27125 () Bool)

(declare-fun mapRes!27125 () Bool)

(declare-fun tp!52147 () Bool)

(declare-fun e!484809 () Bool)

(assert (=> mapNonEmpty!27125 (= mapRes!27125 (and tp!52147 e!484809))))

(declare-datatypes ((V!27737 0))(
  ( (V!27738 (val!8556 Int)) )
))
(declare-datatypes ((ValueCell!8069 0))(
  ( (ValueCellFull!8069 (v!10981 V!27737)) (EmptyCell!8069) )
))
(declare-fun mapValue!27125 () ValueCell!8069)

(declare-fun mapRest!27125 () (Array (_ BitVec 32) ValueCell!8069))

(declare-fun mapKey!27125 () (_ BitVec 32))

(declare-datatypes ((array!50243 0))(
  ( (array!50244 (arr!24148 (Array (_ BitVec 32) ValueCell!8069)) (size!24589 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50243)

(assert (=> mapNonEmpty!27125 (= (arr!24148 _values!688) (store mapRest!27125 mapKey!27125 mapValue!27125))))

(declare-fun res!591254 () Bool)

(declare-fun e!484810 () Bool)

(assert (=> start!74134 (=> (not res!591254) (not e!484810))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50245 0))(
  ( (array!50246 (arr!24149 (Array (_ BitVec 32) (_ BitVec 64))) (size!24590 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50245)

(assert (=> start!74134 (= res!591254 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24590 _keys!868))))))

(assert (=> start!74134 e!484810))

(declare-fun tp_is_empty!17017 () Bool)

(assert (=> start!74134 tp_is_empty!17017))

(assert (=> start!74134 true))

(assert (=> start!74134 tp!52148))

(declare-fun array_inv!19130 (array!50245) Bool)

(assert (=> start!74134 (array_inv!19130 _keys!868)))

(declare-fun e!484813 () Bool)

(declare-fun array_inv!19131 (array!50243) Bool)

(assert (=> start!74134 (and (array_inv!19131 _values!688) e!484813)))

(declare-fun b!870414 () Bool)

(declare-fun e!484812 () Bool)

(assert (=> b!870414 (= e!484810 e!484812)))

(declare-fun res!591259 () Bool)

(assert (=> b!870414 (=> (not res!591259) (not e!484812))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870414 (= res!591259 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395187 () array!50243)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11294 0))(
  ( (tuple2!11295 (_1!5658 (_ BitVec 64)) (_2!5658 V!27737)) )
))
(declare-datatypes ((List!17116 0))(
  ( (Nil!17113) (Cons!17112 (h!18249 tuple2!11294) (t!24145 List!17116)) )
))
(declare-datatypes ((ListLongMap!10065 0))(
  ( (ListLongMap!10066 (toList!5048 List!17116)) )
))
(declare-fun lt!395188 () ListLongMap!10065)

(declare-fun minValue!654 () V!27737)

(declare-fun zeroValue!654 () V!27737)

(declare-fun getCurrentListMapNoExtraKeys!3092 (array!50245 array!50243 (_ BitVec 32) (_ BitVec 32) V!27737 V!27737 (_ BitVec 32) Int) ListLongMap!10065)

(assert (=> b!870414 (= lt!395188 (getCurrentListMapNoExtraKeys!3092 _keys!868 lt!395187 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27737)

(assert (=> b!870414 (= lt!395187 (array!50244 (store (arr!24148 _values!688) i!612 (ValueCellFull!8069 v!557)) (size!24589 _values!688)))))

(declare-fun lt!395189 () ListLongMap!10065)

(assert (=> b!870414 (= lt!395189 (getCurrentListMapNoExtraKeys!3092 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870415 () Bool)

(declare-fun res!591257 () Bool)

(assert (=> b!870415 (=> (not res!591257) (not e!484810))))

(declare-datatypes ((List!17117 0))(
  ( (Nil!17114) (Cons!17113 (h!18250 (_ BitVec 64)) (t!24146 List!17117)) )
))
(declare-fun arrayNoDuplicates!0 (array!50245 (_ BitVec 32) List!17117) Bool)

(assert (=> b!870415 (= res!591257 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17114))))

(declare-fun b!870416 () Bool)

(declare-fun e!484811 () Bool)

(assert (=> b!870416 (= e!484813 (and e!484811 mapRes!27125))))

(declare-fun condMapEmpty!27125 () Bool)

(declare-fun mapDefault!27125 () ValueCell!8069)

(assert (=> b!870416 (= condMapEmpty!27125 (= (arr!24148 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8069)) mapDefault!27125)))))

(declare-fun b!870417 () Bool)

(assert (=> b!870417 (= e!484809 tp_is_empty!17017)))

(declare-fun b!870418 () Bool)

(declare-fun res!591255 () Bool)

(assert (=> b!870418 (=> (not res!591255) (not e!484810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870418 (= res!591255 (validMask!0 mask!1196))))

(declare-fun b!870419 () Bool)

(declare-fun res!591258 () Bool)

(assert (=> b!870419 (=> (not res!591258) (not e!484810))))

(assert (=> b!870419 (= res!591258 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24590 _keys!868))))))

(declare-fun b!870420 () Bool)

(declare-fun res!591253 () Bool)

(assert (=> b!870420 (=> (not res!591253) (not e!484810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50245 (_ BitVec 32)) Bool)

(assert (=> b!870420 (= res!591253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27125 () Bool)

(assert (=> mapIsEmpty!27125 mapRes!27125))

(declare-fun b!870421 () Bool)

(assert (=> b!870421 (= e!484811 tp_is_empty!17017)))

(declare-fun b!870422 () Bool)

(declare-fun res!591252 () Bool)

(assert (=> b!870422 (=> (not res!591252) (not e!484810))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870422 (= res!591252 (validKeyInArray!0 k0!854))))

(declare-fun b!870423 () Bool)

(declare-fun res!591256 () Bool)

(assert (=> b!870423 (=> (not res!591256) (not e!484810))))

(assert (=> b!870423 (= res!591256 (and (= (size!24589 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24590 _keys!868) (size!24589 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870424 () Bool)

(declare-fun res!591251 () Bool)

(assert (=> b!870424 (=> (not res!591251) (not e!484810))))

(assert (=> b!870424 (= res!591251 (and (= (select (arr!24149 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870425 () Bool)

(assert (=> b!870425 (= e!484812 (not true))))

(declare-fun +!2442 (ListLongMap!10065 tuple2!11294) ListLongMap!10065)

(assert (=> b!870425 (= (getCurrentListMapNoExtraKeys!3092 _keys!868 lt!395187 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2442 (getCurrentListMapNoExtraKeys!3092 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11295 k0!854 v!557)))))

(declare-datatypes ((Unit!29834 0))(
  ( (Unit!29835) )
))
(declare-fun lt!395186 () Unit!29834)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!613 (array!50245 array!50243 (_ BitVec 32) (_ BitVec 32) V!27737 V!27737 (_ BitVec 32) (_ BitVec 64) V!27737 (_ BitVec 32) Int) Unit!29834)

(assert (=> b!870425 (= lt!395186 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!613 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!74134 res!591254) b!870418))

(assert (= (and b!870418 res!591255) b!870423))

(assert (= (and b!870423 res!591256) b!870420))

(assert (= (and b!870420 res!591253) b!870415))

(assert (= (and b!870415 res!591257) b!870419))

(assert (= (and b!870419 res!591258) b!870422))

(assert (= (and b!870422 res!591252) b!870424))

(assert (= (and b!870424 res!591251) b!870414))

(assert (= (and b!870414 res!591259) b!870425))

(assert (= (and b!870416 condMapEmpty!27125) mapIsEmpty!27125))

(assert (= (and b!870416 (not condMapEmpty!27125)) mapNonEmpty!27125))

(get-info :version)

(assert (= (and mapNonEmpty!27125 ((_ is ValueCellFull!8069) mapValue!27125)) b!870417))

(assert (= (and b!870416 ((_ is ValueCellFull!8069) mapDefault!27125)) b!870421))

(assert (= start!74134 b!870416))

(declare-fun m!812327 () Bool)

(assert (=> b!870425 m!812327))

(declare-fun m!812329 () Bool)

(assert (=> b!870425 m!812329))

(assert (=> b!870425 m!812329))

(declare-fun m!812331 () Bool)

(assert (=> b!870425 m!812331))

(declare-fun m!812333 () Bool)

(assert (=> b!870425 m!812333))

(declare-fun m!812335 () Bool)

(assert (=> b!870418 m!812335))

(declare-fun m!812337 () Bool)

(assert (=> start!74134 m!812337))

(declare-fun m!812339 () Bool)

(assert (=> start!74134 m!812339))

(declare-fun m!812341 () Bool)

(assert (=> b!870415 m!812341))

(declare-fun m!812343 () Bool)

(assert (=> b!870414 m!812343))

(declare-fun m!812345 () Bool)

(assert (=> b!870414 m!812345))

(declare-fun m!812347 () Bool)

(assert (=> b!870414 m!812347))

(declare-fun m!812349 () Bool)

(assert (=> b!870424 m!812349))

(declare-fun m!812351 () Bool)

(assert (=> b!870422 m!812351))

(declare-fun m!812353 () Bool)

(assert (=> b!870420 m!812353))

(declare-fun m!812355 () Bool)

(assert (=> mapNonEmpty!27125 m!812355))

(check-sat (not b!870425) (not b!870420) (not mapNonEmpty!27125) tp_is_empty!17017 (not b!870418) (not b!870422) b_and!24643 (not b!870415) (not start!74134) (not b!870414) (not b_next!14881))
(check-sat b_and!24643 (not b_next!14881))
