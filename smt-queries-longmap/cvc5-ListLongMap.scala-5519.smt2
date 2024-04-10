; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72898 () Bool)

(assert start!72898)

(declare-fun b_free!13813 () Bool)

(declare-fun b_next!13813 () Bool)

(assert (=> start!72898 (= b_free!13813 (not b_next!13813))))

(declare-fun tp!48943 () Bool)

(declare-fun b_and!22899 () Bool)

(assert (=> start!72898 (= tp!48943 b_and!22899)))

(declare-fun mapNonEmpty!25523 () Bool)

(declare-fun mapRes!25523 () Bool)

(declare-fun tp!48942 () Bool)

(declare-fun e!472353 () Bool)

(assert (=> mapNonEmpty!25523 (= mapRes!25523 (and tp!48942 e!472353))))

(declare-datatypes ((V!26313 0))(
  ( (V!26314 (val!8022 Int)) )
))
(declare-datatypes ((ValueCell!7535 0))(
  ( (ValueCellFull!7535 (v!10447 V!26313)) (EmptyCell!7535) )
))
(declare-fun mapRest!25523 () (Array (_ BitVec 32) ValueCell!7535))

(declare-fun mapKey!25523 () (_ BitVec 32))

(declare-fun mapValue!25523 () ValueCell!7535)

(declare-datatypes ((array!48112 0))(
  ( (array!48113 (arr!23087 (Array (_ BitVec 32) ValueCell!7535)) (size!23527 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48112)

(assert (=> mapNonEmpty!25523 (= (arr!23087 _values!688) (store mapRest!25523 mapKey!25523 mapValue!25523))))

(declare-fun b!846298 () Bool)

(declare-fun res!574968 () Bool)

(declare-fun e!472356 () Bool)

(assert (=> b!846298 (=> (not res!574968) (not e!472356))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48114 0))(
  ( (array!48115 (arr!23088 (Array (_ BitVec 32) (_ BitVec 64))) (size!23528 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48114)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!846298 (= res!574968 (and (= (size!23527 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23528 _keys!868) (size!23527 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846299 () Bool)

(declare-fun res!574972 () Bool)

(assert (=> b!846299 (=> (not res!574972) (not e!472356))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846299 (= res!574972 (validKeyInArray!0 k!854))))

(declare-fun b!846300 () Bool)

(declare-fun res!574966 () Bool)

(assert (=> b!846300 (=> (not res!574966) (not e!472356))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!846300 (= res!574966 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23528 _keys!868))))))

(declare-fun b!846301 () Bool)

(assert (=> b!846301 (= e!472356 false)))

(declare-fun v!557 () V!26313)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26313)

(declare-fun zeroValue!654 () V!26313)

(declare-datatypes ((tuple2!10478 0))(
  ( (tuple2!10479 (_1!5250 (_ BitVec 64)) (_2!5250 V!26313)) )
))
(declare-datatypes ((List!16339 0))(
  ( (Nil!16336) (Cons!16335 (h!17466 tuple2!10478) (t!22710 List!16339)) )
))
(declare-datatypes ((ListLongMap!9247 0))(
  ( (ListLongMap!9248 (toList!4639 List!16339)) )
))
(declare-fun lt!381511 () ListLongMap!9247)

(declare-fun getCurrentListMapNoExtraKeys!2624 (array!48114 array!48112 (_ BitVec 32) (_ BitVec 32) V!26313 V!26313 (_ BitVec 32) Int) ListLongMap!9247)

(assert (=> b!846301 (= lt!381511 (getCurrentListMapNoExtraKeys!2624 _keys!868 (array!48113 (store (arr!23087 _values!688) i!612 (ValueCellFull!7535 v!557)) (size!23527 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381510 () ListLongMap!9247)

(assert (=> b!846301 (= lt!381510 (getCurrentListMapNoExtraKeys!2624 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!25523 () Bool)

(assert (=> mapIsEmpty!25523 mapRes!25523))

(declare-fun b!846302 () Bool)

(declare-fun res!574967 () Bool)

(assert (=> b!846302 (=> (not res!574967) (not e!472356))))

(declare-datatypes ((List!16340 0))(
  ( (Nil!16337) (Cons!16336 (h!17467 (_ BitVec 64)) (t!22711 List!16340)) )
))
(declare-fun arrayNoDuplicates!0 (array!48114 (_ BitVec 32) List!16340) Bool)

(assert (=> b!846302 (= res!574967 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16337))))

(declare-fun b!846303 () Bool)

(declare-fun res!574973 () Bool)

(assert (=> b!846303 (=> (not res!574973) (not e!472356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48114 (_ BitVec 32)) Bool)

(assert (=> b!846303 (= res!574973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!574970 () Bool)

(assert (=> start!72898 (=> (not res!574970) (not e!472356))))

(assert (=> start!72898 (= res!574970 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23528 _keys!868))))))

(assert (=> start!72898 e!472356))

(declare-fun tp_is_empty!15949 () Bool)

(assert (=> start!72898 tp_is_empty!15949))

(assert (=> start!72898 true))

(assert (=> start!72898 tp!48943))

(declare-fun array_inv!18344 (array!48114) Bool)

(assert (=> start!72898 (array_inv!18344 _keys!868)))

(declare-fun e!472354 () Bool)

(declare-fun array_inv!18345 (array!48112) Bool)

(assert (=> start!72898 (and (array_inv!18345 _values!688) e!472354)))

(declare-fun b!846304 () Bool)

(declare-fun e!472357 () Bool)

(assert (=> b!846304 (= e!472357 tp_is_empty!15949)))

(declare-fun b!846305 () Bool)

(assert (=> b!846305 (= e!472354 (and e!472357 mapRes!25523))))

(declare-fun condMapEmpty!25523 () Bool)

(declare-fun mapDefault!25523 () ValueCell!7535)

