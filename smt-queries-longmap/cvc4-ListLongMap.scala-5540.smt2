; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73028 () Bool)

(assert start!73028)

(declare-fun b_free!13943 () Bool)

(declare-fun b_next!13943 () Bool)

(assert (=> start!73028 (= b_free!13943 (not b_next!13943))))

(declare-fun tp!49333 () Bool)

(declare-fun b_and!23045 () Bool)

(assert (=> start!73028 (= tp!49333 b_and!23045)))

(declare-fun bm!37681 () Bool)

(declare-datatypes ((V!26485 0))(
  ( (V!26486 (val!8087 Int)) )
))
(declare-datatypes ((tuple2!10580 0))(
  ( (tuple2!10581 (_1!5301 (_ BitVec 64)) (_2!5301 V!26485)) )
))
(declare-datatypes ((List!16434 0))(
  ( (Nil!16431) (Cons!16430 (h!17561 tuple2!10580) (t!22823 List!16434)) )
))
(declare-datatypes ((ListLongMap!9349 0))(
  ( (ListLongMap!9350 (toList!4690 List!16434)) )
))
(declare-fun call!37685 () ListLongMap!9349)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7600 0))(
  ( (ValueCellFull!7600 (v!10512 V!26485)) (EmptyCell!7600) )
))
(declare-datatypes ((array!48364 0))(
  ( (array!48365 (arr!23213 (Array (_ BitVec 32) ValueCell!7600)) (size!23653 (_ BitVec 32))) )
))
(declare-fun lt!382115 () array!48364)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48366 0))(
  ( (array!48367 (arr!23214 (Array (_ BitVec 32) (_ BitVec 64))) (size!23654 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48366)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26485)

(declare-fun zeroValue!654 () V!26485)

(declare-fun getCurrentListMapNoExtraKeys!2672 (array!48366 array!48364 (_ BitVec 32) (_ BitVec 32) V!26485 V!26485 (_ BitVec 32) Int) ListLongMap!9349)

(assert (=> bm!37681 (= call!37685 (getCurrentListMapNoExtraKeys!2672 _keys!868 lt!382115 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848815 () Bool)

(declare-fun e!473577 () Bool)

(declare-fun e!473580 () Bool)

(assert (=> b!848815 (= e!473577 (not e!473580))))

(declare-fun res!576668 () Bool)

(assert (=> b!848815 (=> res!576668 e!473580)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848815 (= res!576668 (not (validKeyInArray!0 (select (arr!23214 _keys!868) from!1053))))))

(declare-fun e!473583 () Bool)

(assert (=> b!848815 e!473583))

(declare-fun c!91585 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848815 (= c!91585 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28987 0))(
  ( (Unit!28988) )
))
(declare-fun lt!382114 () Unit!28987)

(declare-fun v!557 () V!26485)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun _values!688 () array!48364)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!339 (array!48366 array!48364 (_ BitVec 32) (_ BitVec 32) V!26485 V!26485 (_ BitVec 32) (_ BitVec 64) V!26485 (_ BitVec 32) Int) Unit!28987)

(assert (=> b!848815 (= lt!382114 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!339 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848816 () Bool)

(declare-fun res!576671 () Bool)

(declare-fun e!473581 () Bool)

(assert (=> b!848816 (=> (not res!576671) (not e!473581))))

(assert (=> b!848816 (= res!576671 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23654 _keys!868))))))

(declare-fun b!848817 () Bool)

(declare-fun e!473584 () Bool)

(declare-fun e!473582 () Bool)

(declare-fun mapRes!25718 () Bool)

(assert (=> b!848817 (= e!473584 (and e!473582 mapRes!25718))))

(declare-fun condMapEmpty!25718 () Bool)

(declare-fun mapDefault!25718 () ValueCell!7600)

