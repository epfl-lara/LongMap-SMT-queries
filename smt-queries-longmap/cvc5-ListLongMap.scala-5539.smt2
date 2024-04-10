; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73018 () Bool)

(assert start!73018)

(declare-fun b_free!13933 () Bool)

(declare-fun b_next!13933 () Bool)

(assert (=> start!73018 (= b_free!13933 (not b_next!13933))))

(declare-fun tp!49303 () Bool)

(declare-fun b_and!23025 () Bool)

(assert (=> start!73018 (= tp!49303 b_and!23025)))

(declare-fun b!848580 () Bool)

(declare-fun res!576520 () Bool)

(declare-fun e!473458 () Bool)

(assert (=> b!848580 (=> (not res!576520) (not e!473458))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48344 0))(
  ( (array!48345 (arr!23203 (Array (_ BitVec 32) (_ BitVec 64))) (size!23643 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48344)

(declare-datatypes ((V!26473 0))(
  ( (V!26474 (val!8082 Int)) )
))
(declare-datatypes ((ValueCell!7595 0))(
  ( (ValueCellFull!7595 (v!10507 V!26473)) (EmptyCell!7595) )
))
(declare-datatypes ((array!48346 0))(
  ( (array!48347 (arr!23204 (Array (_ BitVec 32) ValueCell!7595)) (size!23644 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48346)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!848580 (= res!576520 (and (= (size!23644 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23643 _keys!868) (size!23644 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!37651 () Bool)

(declare-fun lt!382054 () array!48346)

(declare-datatypes ((tuple2!10570 0))(
  ( (tuple2!10571 (_1!5296 (_ BitVec 64)) (_2!5296 V!26473)) )
))
(declare-datatypes ((List!16425 0))(
  ( (Nil!16422) (Cons!16421 (h!17552 tuple2!10570) (t!22804 List!16425)) )
))
(declare-datatypes ((ListLongMap!9339 0))(
  ( (ListLongMap!9340 (toList!4685 List!16425)) )
))
(declare-fun call!37654 () ListLongMap!9339)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26473)

(declare-fun zeroValue!654 () V!26473)

(declare-fun getCurrentListMapNoExtraKeys!2667 (array!48344 array!48346 (_ BitVec 32) (_ BitVec 32) V!26473 V!26473 (_ BitVec 32) Int) ListLongMap!9339)

(assert (=> bm!37651 (= call!37654 (getCurrentListMapNoExtraKeys!2667 _keys!868 lt!382054 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848581 () Bool)

(declare-fun res!576522 () Bool)

(assert (=> b!848581 (=> (not res!576522) (not e!473458))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!848581 (= res!576522 (and (= (select (arr!23203 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!848582 () Bool)

(declare-fun res!576523 () Bool)

(assert (=> b!848582 (=> (not res!576523) (not e!473458))))

(declare-datatypes ((List!16426 0))(
  ( (Nil!16423) (Cons!16422 (h!17553 (_ BitVec 64)) (t!22805 List!16426)) )
))
(declare-fun arrayNoDuplicates!0 (array!48344 (_ BitVec 32) List!16426) Bool)

(assert (=> b!848582 (= res!576523 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16423))))

(declare-fun b!848583 () Bool)

(declare-fun e!473457 () Bool)

(declare-fun e!473463 () Bool)

(assert (=> b!848583 (= e!473457 (not e!473463))))

(declare-fun res!576518 () Bool)

(assert (=> b!848583 (=> res!576518 e!473463)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848583 (= res!576518 (not (validKeyInArray!0 (select (arr!23203 _keys!868) from!1053))))))

(declare-fun e!473462 () Bool)

(assert (=> b!848583 e!473462))

(declare-fun c!91570 () Bool)

(assert (=> b!848583 (= c!91570 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26473)

(declare-datatypes ((Unit!28981 0))(
  ( (Unit!28982) )
))
(declare-fun lt!382056 () Unit!28981)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!336 (array!48344 array!48346 (_ BitVec 32) (_ BitVec 32) V!26473 V!26473 (_ BitVec 32) (_ BitVec 64) V!26473 (_ BitVec 32) Int) Unit!28981)

(assert (=> b!848583 (= lt!382056 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!336 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!37655 () ListLongMap!9339)

(declare-fun bm!37652 () Bool)

(assert (=> bm!37652 (= call!37655 (getCurrentListMapNoExtraKeys!2667 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848584 () Bool)

(declare-fun e!473461 () Bool)

(declare-fun e!473464 () Bool)

(declare-fun mapRes!25703 () Bool)

(assert (=> b!848584 (= e!473461 (and e!473464 mapRes!25703))))

(declare-fun condMapEmpty!25703 () Bool)

(declare-fun mapDefault!25703 () ValueCell!7595)

