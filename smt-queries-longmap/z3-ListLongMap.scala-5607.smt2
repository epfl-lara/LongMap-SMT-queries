; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73594 () Bool)

(assert start!73594)

(declare-fun b_free!14341 () Bool)

(declare-fun b_next!14341 () Bool)

(assert (=> start!73594 (= b_free!14341 (not b_next!14341))))

(declare-fun tp!50528 () Bool)

(declare-fun b_and!23707 () Bool)

(assert (=> start!73594 (= tp!50528 b_and!23707)))

(declare-fun b!858165 () Bool)

(declare-fun res!582661 () Bool)

(declare-fun e!478392 () Bool)

(assert (=> b!858165 (=> (not res!582661) (not e!478392))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49191 0))(
  ( (array!49192 (arr!23622 (Array (_ BitVec 32) (_ BitVec 64))) (size!24063 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49191)

(assert (=> b!858165 (= res!582661 (and (= (select (arr!23622 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!582658 () Bool)

(assert (=> start!73594 (=> (not res!582658) (not e!478392))))

(assert (=> start!73594 (= res!582658 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24063 _keys!868))))))

(assert (=> start!73594 e!478392))

(declare-fun tp_is_empty!16477 () Bool)

(assert (=> start!73594 tp_is_empty!16477))

(assert (=> start!73594 true))

(assert (=> start!73594 tp!50528))

(declare-fun array_inv!18762 (array!49191) Bool)

(assert (=> start!73594 (array_inv!18762 _keys!868)))

(declare-datatypes ((V!27017 0))(
  ( (V!27018 (val!8286 Int)) )
))
(declare-datatypes ((ValueCell!7799 0))(
  ( (ValueCellFull!7799 (v!10711 V!27017)) (EmptyCell!7799) )
))
(declare-datatypes ((array!49193 0))(
  ( (array!49194 (arr!23623 (Array (_ BitVec 32) ValueCell!7799)) (size!24064 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49193)

(declare-fun e!478391 () Bool)

(declare-fun array_inv!18763 (array!49193) Bool)

(assert (=> start!73594 (and (array_inv!18763 _values!688) e!478391)))

(declare-fun b!858166 () Bool)

(declare-fun res!582656 () Bool)

(assert (=> b!858166 (=> (not res!582656) (not e!478392))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!858166 (= res!582656 (and (= (size!24064 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24063 _keys!868) (size!24064 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858167 () Bool)

(declare-fun e!478396 () Bool)

(assert (=> b!858167 (= e!478392 e!478396)))

(declare-fun res!582662 () Bool)

(assert (=> b!858167 (=> (not res!582662) (not e!478396))))

(assert (=> b!858167 (= res!582662 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!386593 () array!49193)

(declare-datatypes ((tuple2!10852 0))(
  ( (tuple2!10853 (_1!5437 (_ BitVec 64)) (_2!5437 V!27017)) )
))
(declare-datatypes ((List!16696 0))(
  ( (Nil!16693) (Cons!16692 (h!17829 tuple2!10852) (t!23329 List!16696)) )
))
(declare-datatypes ((ListLongMap!9623 0))(
  ( (ListLongMap!9624 (toList!4827 List!16696)) )
))
(declare-fun lt!386591 () ListLongMap!9623)

(declare-fun minValue!654 () V!27017)

(declare-fun zeroValue!654 () V!27017)

(declare-fun getCurrentListMapNoExtraKeys!2883 (array!49191 array!49193 (_ BitVec 32) (_ BitVec 32) V!27017 V!27017 (_ BitVec 32) Int) ListLongMap!9623)

(assert (=> b!858167 (= lt!386591 (getCurrentListMapNoExtraKeys!2883 _keys!868 lt!386593 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27017)

(assert (=> b!858167 (= lt!386593 (array!49194 (store (arr!23623 _values!688) i!612 (ValueCellFull!7799 v!557)) (size!24064 _values!688)))))

(declare-fun lt!386592 () ListLongMap!9623)

(assert (=> b!858167 (= lt!386592 (getCurrentListMapNoExtraKeys!2883 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858168 () Bool)

(assert (=> b!858168 (= e!478396 (not true))))

(declare-fun +!2237 (ListLongMap!9623 tuple2!10852) ListLongMap!9623)

(assert (=> b!858168 (= (getCurrentListMapNoExtraKeys!2883 _keys!868 lt!386593 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2237 (getCurrentListMapNoExtraKeys!2883 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10853 k0!854 v!557)))))

(declare-datatypes ((Unit!29230 0))(
  ( (Unit!29231) )
))
(declare-fun lt!386594 () Unit!29230)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!435 (array!49191 array!49193 (_ BitVec 32) (_ BitVec 32) V!27017 V!27017 (_ BitVec 32) (_ BitVec 64) V!27017 (_ BitVec 32) Int) Unit!29230)

(assert (=> b!858168 (= lt!386594 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!435 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858169 () Bool)

(declare-fun e!478394 () Bool)

(assert (=> b!858169 (= e!478394 tp_is_empty!16477)))

(declare-fun mapNonEmpty!26315 () Bool)

(declare-fun mapRes!26315 () Bool)

(declare-fun tp!50527 () Bool)

(assert (=> mapNonEmpty!26315 (= mapRes!26315 (and tp!50527 e!478394))))

(declare-fun mapValue!26315 () ValueCell!7799)

(declare-fun mapKey!26315 () (_ BitVec 32))

(declare-fun mapRest!26315 () (Array (_ BitVec 32) ValueCell!7799))

(assert (=> mapNonEmpty!26315 (= (arr!23623 _values!688) (store mapRest!26315 mapKey!26315 mapValue!26315))))

(declare-fun b!858170 () Bool)

(declare-fun e!478395 () Bool)

(assert (=> b!858170 (= e!478395 tp_is_empty!16477)))

(declare-fun b!858171 () Bool)

(declare-fun res!582659 () Bool)

(assert (=> b!858171 (=> (not res!582659) (not e!478392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858171 (= res!582659 (validMask!0 mask!1196))))

(declare-fun b!858172 () Bool)

(declare-fun res!582663 () Bool)

(assert (=> b!858172 (=> (not res!582663) (not e!478392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49191 (_ BitVec 32)) Bool)

(assert (=> b!858172 (= res!582663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858173 () Bool)

(declare-fun res!582664 () Bool)

(assert (=> b!858173 (=> (not res!582664) (not e!478392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858173 (= res!582664 (validKeyInArray!0 k0!854))))

(declare-fun b!858174 () Bool)

(declare-fun res!582657 () Bool)

(assert (=> b!858174 (=> (not res!582657) (not e!478392))))

(assert (=> b!858174 (= res!582657 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24063 _keys!868))))))

(declare-fun mapIsEmpty!26315 () Bool)

(assert (=> mapIsEmpty!26315 mapRes!26315))

(declare-fun b!858175 () Bool)

(declare-fun res!582660 () Bool)

(assert (=> b!858175 (=> (not res!582660) (not e!478392))))

(declare-datatypes ((List!16697 0))(
  ( (Nil!16694) (Cons!16693 (h!17830 (_ BitVec 64)) (t!23330 List!16697)) )
))
(declare-fun arrayNoDuplicates!0 (array!49191 (_ BitVec 32) List!16697) Bool)

(assert (=> b!858175 (= res!582660 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16694))))

(declare-fun b!858176 () Bool)

(assert (=> b!858176 (= e!478391 (and e!478395 mapRes!26315))))

(declare-fun condMapEmpty!26315 () Bool)

(declare-fun mapDefault!26315 () ValueCell!7799)

(assert (=> b!858176 (= condMapEmpty!26315 (= (arr!23623 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7799)) mapDefault!26315)))))

(assert (= (and start!73594 res!582658) b!858171))

(assert (= (and b!858171 res!582659) b!858166))

(assert (= (and b!858166 res!582656) b!858172))

(assert (= (and b!858172 res!582663) b!858175))

(assert (= (and b!858175 res!582660) b!858174))

(assert (= (and b!858174 res!582657) b!858173))

(assert (= (and b!858173 res!582664) b!858165))

(assert (= (and b!858165 res!582661) b!858167))

(assert (= (and b!858167 res!582662) b!858168))

(assert (= (and b!858176 condMapEmpty!26315) mapIsEmpty!26315))

(assert (= (and b!858176 (not condMapEmpty!26315)) mapNonEmpty!26315))

(get-info :version)

(assert (= (and mapNonEmpty!26315 ((_ is ValueCellFull!7799) mapValue!26315)) b!858169))

(assert (= (and b!858176 ((_ is ValueCellFull!7799) mapDefault!26315)) b!858170))

(assert (= start!73594 b!858176))

(declare-fun m!799361 () Bool)

(assert (=> b!858171 m!799361))

(declare-fun m!799363 () Bool)

(assert (=> b!858167 m!799363))

(declare-fun m!799365 () Bool)

(assert (=> b!858167 m!799365))

(declare-fun m!799367 () Bool)

(assert (=> b!858167 m!799367))

(declare-fun m!799369 () Bool)

(assert (=> start!73594 m!799369))

(declare-fun m!799371 () Bool)

(assert (=> start!73594 m!799371))

(declare-fun m!799373 () Bool)

(assert (=> b!858173 m!799373))

(declare-fun m!799375 () Bool)

(assert (=> b!858165 m!799375))

(declare-fun m!799377 () Bool)

(assert (=> mapNonEmpty!26315 m!799377))

(declare-fun m!799379 () Bool)

(assert (=> b!858172 m!799379))

(declare-fun m!799381 () Bool)

(assert (=> b!858175 m!799381))

(declare-fun m!799383 () Bool)

(assert (=> b!858168 m!799383))

(declare-fun m!799385 () Bool)

(assert (=> b!858168 m!799385))

(assert (=> b!858168 m!799385))

(declare-fun m!799387 () Bool)

(assert (=> b!858168 m!799387))

(declare-fun m!799389 () Bool)

(assert (=> b!858168 m!799389))

(check-sat (not b!858173) (not b_next!14341) (not b!858171) (not b!858175) (not b!858172) b_and!23707 (not b!858167) tp_is_empty!16477 (not mapNonEmpty!26315) (not start!73594) (not b!858168))
(check-sat b_and!23707 (not b_next!14341))
