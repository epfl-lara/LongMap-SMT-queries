; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73408 () Bool)

(assert start!73408)

(declare-fun b_free!14341 () Bool)

(declare-fun b_next!14341 () Bool)

(assert (=> start!73408 (= b_free!14341 (not b_next!14341))))

(declare-fun tp!50527 () Bool)

(declare-fun b_and!23671 () Bool)

(assert (=> start!73408 (= tp!50527 b_and!23671)))

(declare-fun b!857023 () Bool)

(declare-fun e!477663 () Bool)

(declare-fun tp_is_empty!16477 () Bool)

(assert (=> b!857023 (= e!477663 tp_is_empty!16477)))

(declare-fun b!857024 () Bool)

(declare-fun res!582202 () Bool)

(declare-fun e!477665 () Bool)

(assert (=> b!857024 (=> (not res!582202) (not e!477665))))

(declare-datatypes ((array!49123 0))(
  ( (array!49124 (arr!23593 (Array (_ BitVec 32) (_ BitVec 64))) (size!24035 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49123)

(declare-datatypes ((List!16740 0))(
  ( (Nil!16737) (Cons!16736 (h!17867 (_ BitVec 64)) (t!23372 List!16740)) )
))
(declare-fun arrayNoDuplicates!0 (array!49123 (_ BitVec 32) List!16740) Bool)

(assert (=> b!857024 (= res!582202 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16737))))

(declare-fun b!857025 () Bool)

(declare-fun res!582204 () Bool)

(assert (=> b!857025 (=> (not res!582204) (not e!477665))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857025 (= res!582204 (validKeyInArray!0 k0!854))))

(declare-fun b!857026 () Bool)

(declare-fun e!477662 () Bool)

(assert (=> b!857026 (= e!477665 e!477662)))

(declare-fun res!582209 () Bool)

(assert (=> b!857026 (=> (not res!582209) (not e!477662))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857026 (= res!582209 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27017 0))(
  ( (V!27018 (val!8286 Int)) )
))
(declare-datatypes ((tuple2!10934 0))(
  ( (tuple2!10935 (_1!5478 (_ BitVec 64)) (_2!5478 V!27017)) )
))
(declare-datatypes ((List!16741 0))(
  ( (Nil!16738) (Cons!16737 (h!17868 tuple2!10934) (t!23373 List!16741)) )
))
(declare-datatypes ((ListLongMap!9693 0))(
  ( (ListLongMap!9694 (toList!4862 List!16741)) )
))
(declare-fun lt!385995 () ListLongMap!9693)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7799 0))(
  ( (ValueCellFull!7799 (v!10705 V!27017)) (EmptyCell!7799) )
))
(declare-datatypes ((array!49125 0))(
  ( (array!49126 (arr!23594 (Array (_ BitVec 32) ValueCell!7799)) (size!24036 (_ BitVec 32))) )
))
(declare-fun lt!385994 () array!49125)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27017)

(declare-fun zeroValue!654 () V!27017)

(declare-fun getCurrentListMapNoExtraKeys!2869 (array!49123 array!49125 (_ BitVec 32) (_ BitVec 32) V!27017 V!27017 (_ BitVec 32) Int) ListLongMap!9693)

(assert (=> b!857026 (= lt!385995 (getCurrentListMapNoExtraKeys!2869 _keys!868 lt!385994 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27017)

(declare-fun _values!688 () array!49125)

(assert (=> b!857026 (= lt!385994 (array!49126 (store (arr!23594 _values!688) i!612 (ValueCellFull!7799 v!557)) (size!24036 _values!688)))))

(declare-fun lt!385996 () ListLongMap!9693)

(assert (=> b!857026 (= lt!385996 (getCurrentListMapNoExtraKeys!2869 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26315 () Bool)

(declare-fun mapRes!26315 () Bool)

(declare-fun tp!50528 () Bool)

(declare-fun e!477664 () Bool)

(assert (=> mapNonEmpty!26315 (= mapRes!26315 (and tp!50528 e!477664))))

(declare-fun mapValue!26315 () ValueCell!7799)

(declare-fun mapRest!26315 () (Array (_ BitVec 32) ValueCell!7799))

(declare-fun mapKey!26315 () (_ BitVec 32))

(assert (=> mapNonEmpty!26315 (= (arr!23594 _values!688) (store mapRest!26315 mapKey!26315 mapValue!26315))))

(declare-fun b!857028 () Bool)

(assert (=> b!857028 (= e!477662 (not true))))

(declare-fun +!2238 (ListLongMap!9693 tuple2!10934) ListLongMap!9693)

(assert (=> b!857028 (= (getCurrentListMapNoExtraKeys!2869 _keys!868 lt!385994 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2238 (getCurrentListMapNoExtraKeys!2869 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10935 k0!854 v!557)))))

(declare-datatypes ((Unit!29145 0))(
  ( (Unit!29146) )
))
(declare-fun lt!385997 () Unit!29145)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!435 (array!49123 array!49125 (_ BitVec 32) (_ BitVec 32) V!27017 V!27017 (_ BitVec 32) (_ BitVec 64) V!27017 (_ BitVec 32) Int) Unit!29145)

(assert (=> b!857028 (= lt!385997 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!435 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857029 () Bool)

(declare-fun res!582203 () Bool)

(assert (=> b!857029 (=> (not res!582203) (not e!477665))))

(assert (=> b!857029 (= res!582203 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24035 _keys!868))))))

(declare-fun mapIsEmpty!26315 () Bool)

(assert (=> mapIsEmpty!26315 mapRes!26315))

(declare-fun b!857030 () Bool)

(declare-fun res!582208 () Bool)

(assert (=> b!857030 (=> (not res!582208) (not e!477665))))

(assert (=> b!857030 (= res!582208 (and (= (select (arr!23593 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857031 () Bool)

(declare-fun e!477666 () Bool)

(assert (=> b!857031 (= e!477666 (and e!477663 mapRes!26315))))

(declare-fun condMapEmpty!26315 () Bool)

(declare-fun mapDefault!26315 () ValueCell!7799)

(assert (=> b!857031 (= condMapEmpty!26315 (= (arr!23594 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7799)) mapDefault!26315)))))

(declare-fun b!857032 () Bool)

(declare-fun res!582210 () Bool)

(assert (=> b!857032 (=> (not res!582210) (not e!477665))))

(assert (=> b!857032 (= res!582210 (and (= (size!24036 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24035 _keys!868) (size!24036 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!582206 () Bool)

(assert (=> start!73408 (=> (not res!582206) (not e!477665))))

(assert (=> start!73408 (= res!582206 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24035 _keys!868))))))

(assert (=> start!73408 e!477665))

(assert (=> start!73408 tp_is_empty!16477))

(assert (=> start!73408 true))

(assert (=> start!73408 tp!50527))

(declare-fun array_inv!18750 (array!49123) Bool)

(assert (=> start!73408 (array_inv!18750 _keys!868)))

(declare-fun array_inv!18751 (array!49125) Bool)

(assert (=> start!73408 (and (array_inv!18751 _values!688) e!477666)))

(declare-fun b!857027 () Bool)

(declare-fun res!582207 () Bool)

(assert (=> b!857027 (=> (not res!582207) (not e!477665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49123 (_ BitVec 32)) Bool)

(assert (=> b!857027 (= res!582207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857033 () Bool)

(assert (=> b!857033 (= e!477664 tp_is_empty!16477)))

(declare-fun b!857034 () Bool)

(declare-fun res!582205 () Bool)

(assert (=> b!857034 (=> (not res!582205) (not e!477665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857034 (= res!582205 (validMask!0 mask!1196))))

(assert (= (and start!73408 res!582206) b!857034))

(assert (= (and b!857034 res!582205) b!857032))

(assert (= (and b!857032 res!582210) b!857027))

(assert (= (and b!857027 res!582207) b!857024))

(assert (= (and b!857024 res!582202) b!857029))

(assert (= (and b!857029 res!582203) b!857025))

(assert (= (and b!857025 res!582204) b!857030))

(assert (= (and b!857030 res!582208) b!857026))

(assert (= (and b!857026 res!582209) b!857028))

(assert (= (and b!857031 condMapEmpty!26315) mapIsEmpty!26315))

(assert (= (and b!857031 (not condMapEmpty!26315)) mapNonEmpty!26315))

(get-info :version)

(assert (= (and mapNonEmpty!26315 ((_ is ValueCellFull!7799) mapValue!26315)) b!857033))

(assert (= (and b!857031 ((_ is ValueCellFull!7799) mapDefault!26315)) b!857023))

(assert (= start!73408 b!857031))

(declare-fun m!797313 () Bool)

(assert (=> b!857027 m!797313))

(declare-fun m!797315 () Bool)

(assert (=> b!857028 m!797315))

(declare-fun m!797317 () Bool)

(assert (=> b!857028 m!797317))

(assert (=> b!857028 m!797317))

(declare-fun m!797319 () Bool)

(assert (=> b!857028 m!797319))

(declare-fun m!797321 () Bool)

(assert (=> b!857028 m!797321))

(declare-fun m!797323 () Bool)

(assert (=> b!857025 m!797323))

(declare-fun m!797325 () Bool)

(assert (=> b!857034 m!797325))

(declare-fun m!797327 () Bool)

(assert (=> b!857030 m!797327))

(declare-fun m!797329 () Bool)

(assert (=> mapNonEmpty!26315 m!797329))

(declare-fun m!797331 () Bool)

(assert (=> b!857026 m!797331))

(declare-fun m!797333 () Bool)

(assert (=> b!857026 m!797333))

(declare-fun m!797335 () Bool)

(assert (=> b!857026 m!797335))

(declare-fun m!797337 () Bool)

(assert (=> b!857024 m!797337))

(declare-fun m!797339 () Bool)

(assert (=> start!73408 m!797339))

(declare-fun m!797341 () Bool)

(assert (=> start!73408 m!797341))

(check-sat (not b!857034) (not start!73408) tp_is_empty!16477 (not b!857025) (not mapNonEmpty!26315) (not b!857024) (not b_next!14341) b_and!23671 (not b!857027) (not b!857028) (not b!857026))
(check-sat b_and!23671 (not b_next!14341))
