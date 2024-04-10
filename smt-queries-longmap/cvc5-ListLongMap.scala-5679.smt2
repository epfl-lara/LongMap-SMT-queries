; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73858 () Bool)

(assert start!73858)

(declare-fun b_free!14773 () Bool)

(declare-fun b_next!14773 () Bool)

(assert (=> start!73858 (= b_free!14773 (not b_next!14773))))

(declare-fun tp!51822 () Bool)

(declare-fun b_and!24525 () Bool)

(assert (=> start!73858 (= tp!51822 b_and!24525)))

(declare-fun b!867567 () Bool)

(declare-fun e!483256 () Bool)

(declare-fun e!483259 () Bool)

(assert (=> b!867567 (= e!483256 e!483259)))

(declare-fun res!589456 () Bool)

(assert (=> b!867567 (=> (not res!589456) (not e!483259))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!867567 (= res!589456 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49978 0))(
  ( (array!49979 (arr!24020 (Array (_ BitVec 32) (_ BitVec 64))) (size!24460 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49978)

(declare-datatypes ((V!27593 0))(
  ( (V!27594 (val!8502 Int)) )
))
(declare-fun minValue!654 () V!27593)

(declare-fun zeroValue!654 () V!27593)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8015 0))(
  ( (ValueCellFull!8015 (v!10927 V!27593)) (EmptyCell!8015) )
))
(declare-datatypes ((array!49980 0))(
  ( (array!49981 (arr!24021 (Array (_ BitVec 32) ValueCell!8015)) (size!24461 (_ BitVec 32))) )
))
(declare-fun lt!394177 () array!49980)

(declare-datatypes ((tuple2!11278 0))(
  ( (tuple2!11279 (_1!5650 (_ BitVec 64)) (_2!5650 V!27593)) )
))
(declare-datatypes ((List!17078 0))(
  ( (Nil!17075) (Cons!17074 (h!18205 tuple2!11278) (t!24115 List!17078)) )
))
(declare-datatypes ((ListLongMap!10047 0))(
  ( (ListLongMap!10048 (toList!5039 List!17078)) )
))
(declare-fun lt!394179 () ListLongMap!10047)

(declare-fun getCurrentListMapNoExtraKeys!3008 (array!49978 array!49980 (_ BitVec 32) (_ BitVec 32) V!27593 V!27593 (_ BitVec 32) Int) ListLongMap!10047)

(assert (=> b!867567 (= lt!394179 (getCurrentListMapNoExtraKeys!3008 _keys!868 lt!394177 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun _values!688 () array!49980)

(declare-fun v!557 () V!27593)

(assert (=> b!867567 (= lt!394177 (array!49981 (store (arr!24021 _values!688) i!612 (ValueCellFull!8015 v!557)) (size!24461 _values!688)))))

(declare-fun lt!394178 () ListLongMap!10047)

(assert (=> b!867567 (= lt!394178 (getCurrentListMapNoExtraKeys!3008 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867568 () Bool)

(declare-fun e!483255 () Bool)

(declare-fun tp_is_empty!16909 () Bool)

(assert (=> b!867568 (= e!483255 tp_is_empty!16909)))

(declare-fun b!867569 () Bool)

(declare-fun res!589452 () Bool)

(assert (=> b!867569 (=> (not res!589452) (not e!483256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867569 (= res!589452 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26963 () Bool)

(declare-fun mapRes!26963 () Bool)

(assert (=> mapIsEmpty!26963 mapRes!26963))

(declare-fun b!867570 () Bool)

(declare-fun res!589450 () Bool)

(assert (=> b!867570 (=> (not res!589450) (not e!483256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49978 (_ BitVec 32)) Bool)

(assert (=> b!867570 (= res!589450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867571 () Bool)

(declare-fun res!589451 () Bool)

(assert (=> b!867571 (=> (not res!589451) (not e!483256))))

(declare-datatypes ((List!17079 0))(
  ( (Nil!17076) (Cons!17075 (h!18206 (_ BitVec 64)) (t!24116 List!17079)) )
))
(declare-fun arrayNoDuplicates!0 (array!49978 (_ BitVec 32) List!17079) Bool)

(assert (=> b!867571 (= res!589451 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17076))))

(declare-fun b!867572 () Bool)

(declare-fun res!589454 () Bool)

(assert (=> b!867572 (=> (not res!589454) (not e!483256))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!867572 (= res!589454 (and (= (select (arr!24020 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!867573 () Bool)

(assert (=> b!867573 (= e!483259 (not true))))

(declare-fun +!2385 (ListLongMap!10047 tuple2!11278) ListLongMap!10047)

(assert (=> b!867573 (= (getCurrentListMapNoExtraKeys!3008 _keys!868 lt!394177 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2385 (getCurrentListMapNoExtraKeys!3008 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11279 k!854 v!557)))))

(declare-datatypes ((Unit!29768 0))(
  ( (Unit!29769) )
))
(declare-fun lt!394180 () Unit!29768)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!579 (array!49978 array!49980 (_ BitVec 32) (_ BitVec 32) V!27593 V!27593 (_ BitVec 32) (_ BitVec 64) V!27593 (_ BitVec 32) Int) Unit!29768)

(assert (=> b!867573 (= lt!394180 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!579 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867574 () Bool)

(declare-fun e!483257 () Bool)

(assert (=> b!867574 (= e!483257 tp_is_empty!16909)))

(declare-fun b!867575 () Bool)

(declare-fun res!589449 () Bool)

(assert (=> b!867575 (=> (not res!589449) (not e!483256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867575 (= res!589449 (validKeyInArray!0 k!854))))

(declare-fun b!867576 () Bool)

(declare-fun res!589455 () Bool)

(assert (=> b!867576 (=> (not res!589455) (not e!483256))))

(assert (=> b!867576 (= res!589455 (and (= (size!24461 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24460 _keys!868) (size!24461 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!589457 () Bool)

(assert (=> start!73858 (=> (not res!589457) (not e!483256))))

(assert (=> start!73858 (= res!589457 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24460 _keys!868))))))

(assert (=> start!73858 e!483256))

(assert (=> start!73858 tp_is_empty!16909))

(assert (=> start!73858 true))

(assert (=> start!73858 tp!51822))

(declare-fun array_inv!18978 (array!49978) Bool)

(assert (=> start!73858 (array_inv!18978 _keys!868)))

(declare-fun e!483254 () Bool)

(declare-fun array_inv!18979 (array!49980) Bool)

(assert (=> start!73858 (and (array_inv!18979 _values!688) e!483254)))

(declare-fun mapNonEmpty!26963 () Bool)

(declare-fun tp!51823 () Bool)

(assert (=> mapNonEmpty!26963 (= mapRes!26963 (and tp!51823 e!483257))))

(declare-fun mapValue!26963 () ValueCell!8015)

(declare-fun mapRest!26963 () (Array (_ BitVec 32) ValueCell!8015))

(declare-fun mapKey!26963 () (_ BitVec 32))

(assert (=> mapNonEmpty!26963 (= (arr!24021 _values!688) (store mapRest!26963 mapKey!26963 mapValue!26963))))

(declare-fun b!867577 () Bool)

(assert (=> b!867577 (= e!483254 (and e!483255 mapRes!26963))))

(declare-fun condMapEmpty!26963 () Bool)

(declare-fun mapDefault!26963 () ValueCell!8015)

