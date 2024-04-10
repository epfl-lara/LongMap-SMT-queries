; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74376 () Bool)

(assert start!74376)

(declare-fun b_free!15139 () Bool)

(declare-fun b_next!15139 () Bool)

(assert (=> start!74376 (= b_free!15139 (not b_next!15139))))

(declare-fun tp!53092 () Bool)

(declare-fun b_and!24915 () Bool)

(assert (=> start!74376 (= tp!53092 b_and!24915)))

(declare-fun b!875647 () Bool)

(declare-fun res!595088 () Bool)

(declare-fun e!487470 () Bool)

(assert (=> b!875647 (=> (not res!595088) (not e!487470))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50890 0))(
  ( (array!50891 (arr!24473 (Array (_ BitVec 32) (_ BitVec 64))) (size!24913 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50890)

(assert (=> b!875647 (= res!595088 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24913 _keys!868))))))

(declare-fun b!875648 () Bool)

(declare-fun e!487471 () Bool)

(declare-datatypes ((V!28225 0))(
  ( (V!28226 (val!8739 Int)) )
))
(declare-datatypes ((tuple2!11546 0))(
  ( (tuple2!11547 (_1!5784 (_ BitVec 64)) (_2!5784 V!28225)) )
))
(declare-datatypes ((List!17368 0))(
  ( (Nil!17365) (Cons!17364 (h!18495 tuple2!11546) (t!24411 List!17368)) )
))
(declare-datatypes ((ListLongMap!10315 0))(
  ( (ListLongMap!10316 (toList!5173 List!17368)) )
))
(declare-fun call!38643 () ListLongMap!10315)

(declare-fun call!38642 () ListLongMap!10315)

(assert (=> b!875648 (= e!487471 (= call!38643 call!38642))))

(declare-fun v!557 () V!28225)

(declare-fun b!875649 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2476 (ListLongMap!10315 tuple2!11546) ListLongMap!10315)

(assert (=> b!875649 (= e!487471 (= call!38643 (+!2476 call!38642 (tuple2!11547 k!854 v!557))))))

(declare-fun b!875650 () Bool)

(declare-fun res!595087 () Bool)

(assert (=> b!875650 (=> (not res!595087) (not e!487470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875650 (= res!595087 (validKeyInArray!0 k!854))))

(declare-fun b!875651 () Bool)

(declare-fun res!595081 () Bool)

(assert (=> b!875651 (=> (not res!595081) (not e!487470))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50890 (_ BitVec 32)) Bool)

(assert (=> b!875651 (= res!595081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875652 () Bool)

(declare-fun e!487472 () Bool)

(declare-fun e!487474 () Bool)

(assert (=> b!875652 (= e!487472 (not e!487474))))

(declare-fun res!595089 () Bool)

(assert (=> b!875652 (=> res!595089 e!487474)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!875652 (= res!595089 (not (validKeyInArray!0 (select (arr!24473 _keys!868) from!1053))))))

(assert (=> b!875652 e!487471))

(declare-fun c!92522 () Bool)

(assert (=> b!875652 (= c!92522 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29948 0))(
  ( (Unit!29949) )
))
(declare-fun lt!396242 () Unit!29948)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8252 0))(
  ( (ValueCellFull!8252 (v!11168 V!28225)) (EmptyCell!8252) )
))
(declare-datatypes ((array!50892 0))(
  ( (array!50893 (arr!24474 (Array (_ BitVec 32) ValueCell!8252)) (size!24914 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50892)

(declare-fun minValue!654 () V!28225)

(declare-fun zeroValue!654 () V!28225)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!667 (array!50890 array!50892 (_ BitVec 32) (_ BitVec 32) V!28225 V!28225 (_ BitVec 32) (_ BitVec 64) V!28225 (_ BitVec 32) Int) Unit!29948)

(assert (=> b!875652 (= lt!396242 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!667 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!396243 () ListLongMap!10315)

(declare-fun lt!396244 () array!50892)

(declare-fun b!875653 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3140 (array!50890 array!50892 (_ BitVec 32) (_ BitVec 32) V!28225 V!28225 (_ BitVec 32) Int) ListLongMap!10315)

(declare-fun get!12864 (ValueCell!8252 V!28225) V!28225)

(declare-fun dynLambda!1204 (Int (_ BitVec 64)) V!28225)

(assert (=> b!875653 (= e!487474 (= lt!396243 (+!2476 (getCurrentListMapNoExtraKeys!3140 _keys!868 lt!396244 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11547 (select (arr!24473 _keys!868) from!1053) (get!12864 (select (arr!24474 lt!396244) from!1053) (dynLambda!1204 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!38639 () Bool)

(assert (=> bm!38639 (= call!38643 (getCurrentListMapNoExtraKeys!3140 _keys!868 lt!396244 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27683 () Bool)

(declare-fun mapRes!27683 () Bool)

(assert (=> mapIsEmpty!27683 mapRes!27683))

(declare-fun res!595085 () Bool)

(assert (=> start!74376 (=> (not res!595085) (not e!487470))))

(assert (=> start!74376 (= res!595085 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24913 _keys!868))))))

(assert (=> start!74376 e!487470))

(declare-fun tp_is_empty!17383 () Bool)

(assert (=> start!74376 tp_is_empty!17383))

(assert (=> start!74376 true))

(assert (=> start!74376 tp!53092))

(declare-fun array_inv!19294 (array!50890) Bool)

(assert (=> start!74376 (array_inv!19294 _keys!868)))

(declare-fun e!487473 () Bool)

(declare-fun array_inv!19295 (array!50892) Bool)

(assert (=> start!74376 (and (array_inv!19295 _values!688) e!487473)))

(declare-fun b!875654 () Bool)

(declare-fun res!595083 () Bool)

(assert (=> b!875654 (=> (not res!595083) (not e!487470))))

(assert (=> b!875654 (= res!595083 (and (= (select (arr!24473 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!875655 () Bool)

(declare-fun e!487468 () Bool)

(assert (=> b!875655 (= e!487473 (and e!487468 mapRes!27683))))

(declare-fun condMapEmpty!27683 () Bool)

(declare-fun mapDefault!27683 () ValueCell!8252)

