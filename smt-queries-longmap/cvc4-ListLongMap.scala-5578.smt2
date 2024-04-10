; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73256 () Bool)

(assert start!73256)

(declare-fun b_free!14171 () Bool)

(declare-fun b_next!14171 () Bool)

(assert (=> start!73256 (= b_free!14171 (not b_next!14171))))

(declare-fun tp!50016 () Bool)

(declare-fun b_and!23501 () Bool)

(assert (=> start!73256 (= tp!50016 b_and!23501)))

(declare-fun b!854173 () Bool)

(declare-fun e!476317 () Bool)

(declare-fun e!476314 () Bool)

(assert (=> b!854173 (= e!476317 e!476314)))

(declare-fun res!580091 () Bool)

(assert (=> b!854173 (=> (not res!580091) (not e!476314))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854173 (= res!580091 (= from!1053 i!612))))

(declare-datatypes ((V!26789 0))(
  ( (V!26790 (val!8201 Int)) )
))
(declare-datatypes ((tuple2!10792 0))(
  ( (tuple2!10793 (_1!5407 (_ BitVec 64)) (_2!5407 V!26789)) )
))
(declare-datatypes ((List!16610 0))(
  ( (Nil!16607) (Cons!16606 (h!17737 tuple2!10792) (t!23227 List!16610)) )
))
(declare-datatypes ((ListLongMap!9561 0))(
  ( (ListLongMap!9562 (toList!4796 List!16610)) )
))
(declare-fun lt!385213 () ListLongMap!9561)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7714 0))(
  ( (ValueCellFull!7714 (v!10626 V!26789)) (EmptyCell!7714) )
))
(declare-datatypes ((array!48812 0))(
  ( (array!48813 (arr!23437 (Array (_ BitVec 32) ValueCell!7714)) (size!23877 (_ BitVec 32))) )
))
(declare-fun lt!385206 () array!48812)

(declare-fun minValue!654 () V!26789)

(declare-fun zeroValue!654 () V!26789)

(declare-datatypes ((array!48814 0))(
  ( (array!48815 (arr!23438 (Array (_ BitVec 32) (_ BitVec 64))) (size!23878 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48814)

(declare-fun getCurrentListMapNoExtraKeys!2777 (array!48814 array!48812 (_ BitVec 32) (_ BitVec 32) V!26789 V!26789 (_ BitVec 32) Int) ListLongMap!9561)

(assert (=> b!854173 (= lt!385213 (getCurrentListMapNoExtraKeys!2777 _keys!868 lt!385206 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26789)

(declare-fun _values!688 () array!48812)

(assert (=> b!854173 (= lt!385206 (array!48813 (store (arr!23437 _values!688) i!612 (ValueCellFull!7714 v!557)) (size!23877 _values!688)))))

(declare-fun lt!385212 () ListLongMap!9561)

(assert (=> b!854173 (= lt!385212 (getCurrentListMapNoExtraKeys!2777 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun call!38369 () ListLongMap!9561)

(declare-fun bm!38365 () Bool)

(assert (=> bm!38365 (= call!38369 (getCurrentListMapNoExtraKeys!2777 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854174 () Bool)

(declare-fun e!476318 () Bool)

(declare-fun call!38368 () ListLongMap!9561)

(assert (=> b!854174 (= e!476318 (= call!38368 call!38369))))

(declare-fun b!854175 () Bool)

(declare-fun res!580094 () Bool)

(assert (=> b!854175 (=> (not res!580094) (not e!476317))))

(assert (=> b!854175 (= res!580094 (and (= (size!23877 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23878 _keys!868) (size!23877 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26060 () Bool)

(declare-fun mapRes!26060 () Bool)

(declare-fun tp!50017 () Bool)

(declare-fun e!476319 () Bool)

(assert (=> mapNonEmpty!26060 (= mapRes!26060 (and tp!50017 e!476319))))

(declare-fun mapKey!26060 () (_ BitVec 32))

(declare-fun mapRest!26060 () (Array (_ BitVec 32) ValueCell!7714))

(declare-fun mapValue!26060 () ValueCell!7714)

(assert (=> mapNonEmpty!26060 (= (arr!23437 _values!688) (store mapRest!26060 mapKey!26060 mapValue!26060))))

(declare-fun mapIsEmpty!26060 () Bool)

(assert (=> mapIsEmpty!26060 mapRes!26060))

(declare-fun b!854176 () Bool)

(declare-fun res!580090 () Bool)

(assert (=> b!854176 (=> (not res!580090) (not e!476317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48814 (_ BitVec 32)) Bool)

(assert (=> b!854176 (= res!580090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854177 () Bool)

(declare-fun res!580088 () Bool)

(assert (=> b!854177 (=> (not res!580088) (not e!476317))))

(declare-datatypes ((List!16611 0))(
  ( (Nil!16608) (Cons!16607 (h!17738 (_ BitVec 64)) (t!23228 List!16611)) )
))
(declare-fun arrayNoDuplicates!0 (array!48814 (_ BitVec 32) List!16611) Bool)

(assert (=> b!854177 (= res!580088 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16608))))

(declare-fun b!854178 () Bool)

(declare-fun res!580096 () Bool)

(assert (=> b!854178 (=> (not res!580096) (not e!476317))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!854178 (= res!580096 (and (= (select (arr!23438 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!854179 () Bool)

(declare-fun e!476315 () Bool)

(assert (=> b!854179 (= e!476315 true)))

(declare-fun lt!385210 () ListLongMap!9561)

(declare-fun lt!385209 () tuple2!10792)

(declare-fun lt!385204 () V!26789)

(declare-fun +!2185 (ListLongMap!9561 tuple2!10792) ListLongMap!9561)

(assert (=> b!854179 (= (+!2185 lt!385210 lt!385209) (+!2185 (+!2185 lt!385210 (tuple2!10793 k!854 lt!385204)) lt!385209))))

(declare-fun lt!385208 () V!26789)

(assert (=> b!854179 (= lt!385209 (tuple2!10793 k!854 lt!385208))))

(declare-datatypes ((Unit!29155 0))(
  ( (Unit!29156) )
))
(declare-fun lt!385211 () Unit!29155)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!310 (ListLongMap!9561 (_ BitVec 64) V!26789 V!26789) Unit!29155)

(assert (=> b!854179 (= lt!385211 (addSameAsAddTwiceSameKeyDiffValues!310 lt!385210 k!854 lt!385204 lt!385208))))

(declare-fun lt!385205 () V!26789)

(declare-fun get!12364 (ValueCell!7714 V!26789) V!26789)

(assert (=> b!854179 (= lt!385204 (get!12364 (select (arr!23437 _values!688) from!1053) lt!385205))))

(assert (=> b!854179 (= lt!385213 (+!2185 lt!385210 (tuple2!10793 (select (arr!23438 _keys!868) from!1053) lt!385208)))))

(assert (=> b!854179 (= lt!385208 (get!12364 (select (store (arr!23437 _values!688) i!612 (ValueCellFull!7714 v!557)) from!1053) lt!385205))))

(declare-fun dynLambda!1064 (Int (_ BitVec 64)) V!26789)

(assert (=> b!854179 (= lt!385205 (dynLambda!1064 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854179 (= lt!385210 (getCurrentListMapNoExtraKeys!2777 _keys!868 lt!385206 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!580089 () Bool)

(assert (=> start!73256 (=> (not res!580089) (not e!476317))))

(assert (=> start!73256 (= res!580089 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23878 _keys!868))))))

(assert (=> start!73256 e!476317))

(declare-fun tp_is_empty!16307 () Bool)

(assert (=> start!73256 tp_is_empty!16307))

(assert (=> start!73256 true))

(assert (=> start!73256 tp!50016))

(declare-fun array_inv!18578 (array!48814) Bool)

(assert (=> start!73256 (array_inv!18578 _keys!868)))

(declare-fun e!476320 () Bool)

(declare-fun array_inv!18579 (array!48812) Bool)

(assert (=> start!73256 (and (array_inv!18579 _values!688) e!476320)))

(declare-fun b!854180 () Bool)

(assert (=> b!854180 (= e!476319 tp_is_empty!16307)))

(declare-fun b!854181 () Bool)

(declare-fun res!580097 () Bool)

(assert (=> b!854181 (=> (not res!580097) (not e!476317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854181 (= res!580097 (validMask!0 mask!1196))))

(declare-fun b!854182 () Bool)

(declare-fun e!476316 () Bool)

(assert (=> b!854182 (= e!476316 tp_is_empty!16307)))

(declare-fun b!854183 () Bool)

(assert (=> b!854183 (= e!476320 (and e!476316 mapRes!26060))))

(declare-fun condMapEmpty!26060 () Bool)

(declare-fun mapDefault!26060 () ValueCell!7714)

