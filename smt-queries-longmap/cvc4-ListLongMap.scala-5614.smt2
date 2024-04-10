; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73472 () Bool)

(assert start!73472)

(declare-fun b_free!14387 () Bool)

(declare-fun b_next!14387 () Bool)

(assert (=> start!73472 (= b_free!14387 (not b_next!14387))))

(declare-fun tp!50665 () Bool)

(declare-fun b_and!23753 () Bool)

(assert (=> start!73472 (= tp!50665 b_and!23753)))

(declare-fun b!858126 () Bool)

(declare-fun res!582961 () Bool)

(declare-fun e!478250 () Bool)

(assert (=> b!858126 (=> (not res!582961) (not e!478250))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858126 (= res!582961 (validMask!0 mask!1196))))

(declare-fun b!858127 () Bool)

(declare-fun e!478254 () Bool)

(assert (=> b!858127 (= e!478250 e!478254)))

(declare-fun res!582960 () Bool)

(assert (=> b!858127 (=> (not res!582960) (not e!478254))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858127 (= res!582960 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27077 0))(
  ( (V!27078 (val!8309 Int)) )
))
(declare-datatypes ((tuple2!10968 0))(
  ( (tuple2!10969 (_1!5495 (_ BitVec 64)) (_2!5495 V!27077)) )
))
(declare-datatypes ((List!16775 0))(
  ( (Nil!16772) (Cons!16771 (h!17902 tuple2!10968) (t!23428 List!16775)) )
))
(declare-datatypes ((ListLongMap!9737 0))(
  ( (ListLongMap!9738 (toList!4884 List!16775)) )
))
(declare-fun lt!386557 () ListLongMap!9737)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!49234 0))(
  ( (array!49235 (arr!23648 (Array (_ BitVec 32) (_ BitVec 64))) (size!24088 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49234)

(declare-fun minValue!654 () V!27077)

(declare-fun zeroValue!654 () V!27077)

(declare-datatypes ((ValueCell!7822 0))(
  ( (ValueCellFull!7822 (v!10734 V!27077)) (EmptyCell!7822) )
))
(declare-datatypes ((array!49236 0))(
  ( (array!49237 (arr!23649 (Array (_ BitVec 32) ValueCell!7822)) (size!24089 (_ BitVec 32))) )
))
(declare-fun lt!386558 () array!49236)

(declare-fun getCurrentListMapNoExtraKeys!2865 (array!49234 array!49236 (_ BitVec 32) (_ BitVec 32) V!27077 V!27077 (_ BitVec 32) Int) ListLongMap!9737)

(assert (=> b!858127 (= lt!386557 (getCurrentListMapNoExtraKeys!2865 _keys!868 lt!386558 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27077)

(declare-fun _values!688 () array!49236)

(assert (=> b!858127 (= lt!386558 (array!49237 (store (arr!23649 _values!688) i!612 (ValueCellFull!7822 v!557)) (size!24089 _values!688)))))

(declare-fun lt!386560 () ListLongMap!9737)

(assert (=> b!858127 (= lt!386560 (getCurrentListMapNoExtraKeys!2865 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858128 () Bool)

(declare-fun e!478249 () Bool)

(assert (=> b!858128 (= e!478254 (not e!478249))))

(declare-fun res!582968 () Bool)

(assert (=> b!858128 (=> res!582968 e!478249)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858128 (= res!582968 (not (validKeyInArray!0 (select (arr!23648 _keys!868) from!1053))))))

(declare-fun lt!386561 () ListLongMap!9737)

(declare-fun lt!386563 () ListLongMap!9737)

(assert (=> b!858128 (= lt!386561 lt!386563)))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!386559 () ListLongMap!9737)

(declare-fun +!2237 (ListLongMap!9737 tuple2!10968) ListLongMap!9737)

(assert (=> b!858128 (= lt!386563 (+!2237 lt!386559 (tuple2!10969 k!854 v!557)))))

(assert (=> b!858128 (= lt!386561 (getCurrentListMapNoExtraKeys!2865 _keys!868 lt!386558 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858128 (= lt!386559 (getCurrentListMapNoExtraKeys!2865 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29261 0))(
  ( (Unit!29262) )
))
(declare-fun lt!386562 () Unit!29261)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!458 (array!49234 array!49236 (_ BitVec 32) (_ BitVec 32) V!27077 V!27077 (_ BitVec 32) (_ BitVec 64) V!27077 (_ BitVec 32) Int) Unit!29261)

(assert (=> b!858128 (= lt!386562 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!458 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858129 () Bool)

(declare-fun res!582964 () Bool)

(assert (=> b!858129 (=> (not res!582964) (not e!478250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49234 (_ BitVec 32)) Bool)

(assert (=> b!858129 (= res!582964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858130 () Bool)

(declare-fun res!582966 () Bool)

(assert (=> b!858130 (=> (not res!582966) (not e!478250))))

(assert (=> b!858130 (= res!582966 (validKeyInArray!0 k!854))))

(declare-fun res!582965 () Bool)

(assert (=> start!73472 (=> (not res!582965) (not e!478250))))

(assert (=> start!73472 (= res!582965 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24088 _keys!868))))))

(assert (=> start!73472 e!478250))

(declare-fun tp_is_empty!16523 () Bool)

(assert (=> start!73472 tp_is_empty!16523))

(assert (=> start!73472 true))

(assert (=> start!73472 tp!50665))

(declare-fun array_inv!18730 (array!49234) Bool)

(assert (=> start!73472 (array_inv!18730 _keys!868)))

(declare-fun e!478251 () Bool)

(declare-fun array_inv!18731 (array!49236) Bool)

(assert (=> start!73472 (and (array_inv!18731 _values!688) e!478251)))

(declare-fun b!858131 () Bool)

(declare-fun e!478252 () Bool)

(assert (=> b!858131 (= e!478252 tp_is_empty!16523)))

(declare-fun b!858132 () Bool)

(declare-fun res!582963 () Bool)

(assert (=> b!858132 (=> (not res!582963) (not e!478250))))

(assert (=> b!858132 (= res!582963 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24088 _keys!868))))))

(declare-fun b!858133 () Bool)

(declare-fun res!582962 () Bool)

(assert (=> b!858133 (=> (not res!582962) (not e!478250))))

(assert (=> b!858133 (= res!582962 (and (= (select (arr!23648 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!858134 () Bool)

(assert (=> b!858134 (= e!478249 true)))

(declare-fun get!12449 (ValueCell!7822 V!27077) V!27077)

(declare-fun dynLambda!1077 (Int (_ BitVec 64)) V!27077)

(assert (=> b!858134 (= lt!386557 (+!2237 lt!386563 (tuple2!10969 (select (arr!23648 _keys!868) from!1053) (get!12449 (select (arr!23649 _values!688) from!1053) (dynLambda!1077 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858135 () Bool)

(declare-fun res!582959 () Bool)

(assert (=> b!858135 (=> (not res!582959) (not e!478250))))

(declare-datatypes ((List!16776 0))(
  ( (Nil!16773) (Cons!16772 (h!17903 (_ BitVec 64)) (t!23429 List!16776)) )
))
(declare-fun arrayNoDuplicates!0 (array!49234 (_ BitVec 32) List!16776) Bool)

(assert (=> b!858135 (= res!582959 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16773))))

(declare-fun b!858136 () Bool)

(declare-fun res!582967 () Bool)

(assert (=> b!858136 (=> (not res!582967) (not e!478250))))

(assert (=> b!858136 (= res!582967 (and (= (size!24089 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24088 _keys!868) (size!24089 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858137 () Bool)

(declare-fun e!478255 () Bool)

(assert (=> b!858137 (= e!478255 tp_is_empty!16523)))

(declare-fun mapNonEmpty!26384 () Bool)

(declare-fun mapRes!26384 () Bool)

(declare-fun tp!50664 () Bool)

(assert (=> mapNonEmpty!26384 (= mapRes!26384 (and tp!50664 e!478252))))

(declare-fun mapRest!26384 () (Array (_ BitVec 32) ValueCell!7822))

(declare-fun mapValue!26384 () ValueCell!7822)

(declare-fun mapKey!26384 () (_ BitVec 32))

(assert (=> mapNonEmpty!26384 (= (arr!23649 _values!688) (store mapRest!26384 mapKey!26384 mapValue!26384))))

(declare-fun b!858138 () Bool)

(assert (=> b!858138 (= e!478251 (and e!478255 mapRes!26384))))

(declare-fun condMapEmpty!26384 () Bool)

(declare-fun mapDefault!26384 () ValueCell!7822)

