; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72946 () Bool)

(assert start!72946)

(declare-fun b_free!13861 () Bool)

(declare-fun b_next!13861 () Bool)

(assert (=> start!72946 (= b_free!13861 (not b_next!13861))))

(declare-fun tp!49087 () Bool)

(declare-fun b_and!22947 () Bool)

(assert (=> start!72946 (= tp!49087 b_and!22947)))

(declare-fun b!847090 () Bool)

(declare-fun res!575543 () Bool)

(declare-fun e!472717 () Bool)

(assert (=> b!847090 (=> (not res!575543) (not e!472717))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48206 0))(
  ( (array!48207 (arr!23134 (Array (_ BitVec 32) (_ BitVec 64))) (size!23574 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48206)

(assert (=> b!847090 (= res!575543 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23574 _keys!868))))))

(declare-fun mapIsEmpty!25595 () Bool)

(declare-fun mapRes!25595 () Bool)

(assert (=> mapIsEmpty!25595 mapRes!25595))

(declare-fun b!847091 () Bool)

(declare-fun res!575544 () Bool)

(assert (=> b!847091 (=> (not res!575544) (not e!472717))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847091 (= res!575544 (validMask!0 mask!1196))))

(declare-fun b!847092 () Bool)

(assert (=> b!847092 (= e!472717 false)))

(declare-datatypes ((V!26377 0))(
  ( (V!26378 (val!8046 Int)) )
))
(declare-fun v!557 () V!26377)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10506 0))(
  ( (tuple2!10507 (_1!5264 (_ BitVec 64)) (_2!5264 V!26377)) )
))
(declare-datatypes ((List!16367 0))(
  ( (Nil!16364) (Cons!16363 (h!17494 tuple2!10506) (t!22738 List!16367)) )
))
(declare-datatypes ((ListLongMap!9275 0))(
  ( (ListLongMap!9276 (toList!4653 List!16367)) )
))
(declare-fun lt!381655 () ListLongMap!9275)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7559 0))(
  ( (ValueCellFull!7559 (v!10471 V!26377)) (EmptyCell!7559) )
))
(declare-datatypes ((array!48208 0))(
  ( (array!48209 (arr!23135 (Array (_ BitVec 32) ValueCell!7559)) (size!23575 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48208)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26377)

(declare-fun zeroValue!654 () V!26377)

(declare-fun getCurrentListMapNoExtraKeys!2638 (array!48206 array!48208 (_ BitVec 32) (_ BitVec 32) V!26377 V!26377 (_ BitVec 32) Int) ListLongMap!9275)

(assert (=> b!847092 (= lt!381655 (getCurrentListMapNoExtraKeys!2638 _keys!868 (array!48209 (store (arr!23135 _values!688) i!612 (ValueCellFull!7559 v!557)) (size!23575 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381654 () ListLongMap!9275)

(assert (=> b!847092 (= lt!381654 (getCurrentListMapNoExtraKeys!2638 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847093 () Bool)

(declare-fun e!472715 () Bool)

(declare-fun tp_is_empty!15997 () Bool)

(assert (=> b!847093 (= e!472715 tp_is_empty!15997)))

(declare-fun b!847094 () Bool)

(declare-fun res!575548 () Bool)

(assert (=> b!847094 (=> (not res!575548) (not e!472717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48206 (_ BitVec 32)) Bool)

(assert (=> b!847094 (= res!575548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847095 () Bool)

(declare-fun res!575542 () Bool)

(assert (=> b!847095 (=> (not res!575542) (not e!472717))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847095 (= res!575542 (validKeyInArray!0 k!854))))

(declare-fun b!847096 () Bool)

(declare-fun res!575545 () Bool)

(assert (=> b!847096 (=> (not res!575545) (not e!472717))))

(assert (=> b!847096 (= res!575545 (and (= (select (arr!23134 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!25595 () Bool)

(declare-fun tp!49086 () Bool)

(declare-fun e!472716 () Bool)

(assert (=> mapNonEmpty!25595 (= mapRes!25595 (and tp!49086 e!472716))))

(declare-fun mapRest!25595 () (Array (_ BitVec 32) ValueCell!7559))

(declare-fun mapKey!25595 () (_ BitVec 32))

(declare-fun mapValue!25595 () ValueCell!7559)

(assert (=> mapNonEmpty!25595 (= (arr!23135 _values!688) (store mapRest!25595 mapKey!25595 mapValue!25595))))

(declare-fun res!575549 () Bool)

(assert (=> start!72946 (=> (not res!575549) (not e!472717))))

(assert (=> start!72946 (= res!575549 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23574 _keys!868))))))

(assert (=> start!72946 e!472717))

(assert (=> start!72946 tp_is_empty!15997))

(assert (=> start!72946 true))

(assert (=> start!72946 tp!49087))

(declare-fun array_inv!18374 (array!48206) Bool)

(assert (=> start!72946 (array_inv!18374 _keys!868)))

(declare-fun e!472713 () Bool)

(declare-fun array_inv!18375 (array!48208) Bool)

(assert (=> start!72946 (and (array_inv!18375 _values!688) e!472713)))

(declare-fun b!847097 () Bool)

(assert (=> b!847097 (= e!472713 (and e!472715 mapRes!25595))))

(declare-fun condMapEmpty!25595 () Bool)

(declare-fun mapDefault!25595 () ValueCell!7559)

