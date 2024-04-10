; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73558 () Bool)

(assert start!73558)

(declare-fun b_free!14473 () Bool)

(declare-fun b_next!14473 () Bool)

(assert (=> start!73558 (= b_free!14473 (not b_next!14473))))

(declare-fun tp!50922 () Bool)

(declare-fun b_and!23925 () Bool)

(assert (=> start!73558 (= tp!50922 b_and!23925)))

(declare-fun b!860131 () Bool)

(declare-fun e!479308 () Bool)

(declare-fun e!479306 () Bool)

(assert (=> b!860131 (= e!479308 (not e!479306))))

(declare-fun res!584493 () Bool)

(assert (=> b!860131 (=> res!584493 e!479306)))

(declare-datatypes ((array!49394 0))(
  ( (array!49395 (arr!23728 (Array (_ BitVec 32) (_ BitVec 64))) (size!24168 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49394)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860131 (= res!584493 (not (validKeyInArray!0 (select (arr!23728 _keys!868) from!1053))))))

(declare-datatypes ((V!27193 0))(
  ( (V!27194 (val!8352 Int)) )
))
(declare-datatypes ((tuple2!11036 0))(
  ( (tuple2!11037 (_1!5529 (_ BitVec 64)) (_2!5529 V!27193)) )
))
(declare-datatypes ((List!16844 0))(
  ( (Nil!16841) (Cons!16840 (h!17971 tuple2!11036) (t!23583 List!16844)) )
))
(declare-datatypes ((ListLongMap!9805 0))(
  ( (ListLongMap!9806 (toList!4918 List!16844)) )
))
(declare-fun lt!387657 () ListLongMap!9805)

(declare-fun lt!387655 () ListLongMap!9805)

(assert (=> b!860131 (= lt!387657 lt!387655)))

(declare-fun v!557 () V!27193)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!387658 () ListLongMap!9805)

(declare-fun +!2270 (ListLongMap!9805 tuple2!11036) ListLongMap!9805)

(assert (=> b!860131 (= lt!387655 (+!2270 lt!387658 (tuple2!11037 k!854 v!557)))))

(declare-datatypes ((ValueCell!7865 0))(
  ( (ValueCellFull!7865 (v!10777 V!27193)) (EmptyCell!7865) )
))
(declare-datatypes ((array!49396 0))(
  ( (array!49397 (arr!23729 (Array (_ BitVec 32) ValueCell!7865)) (size!24169 (_ BitVec 32))) )
))
(declare-fun lt!387662 () array!49396)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27193)

(declare-fun zeroValue!654 () V!27193)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2896 (array!49394 array!49396 (_ BitVec 32) (_ BitVec 32) V!27193 V!27193 (_ BitVec 32) Int) ListLongMap!9805)

(assert (=> b!860131 (= lt!387657 (getCurrentListMapNoExtraKeys!2896 _keys!868 lt!387662 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49396)

(assert (=> b!860131 (= lt!387658 (getCurrentListMapNoExtraKeys!2896 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29323 0))(
  ( (Unit!29324) )
))
(declare-fun lt!387664 () Unit!29323)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!484 (array!49394 array!49396 (_ BitVec 32) (_ BitVec 32) V!27193 V!27193 (_ BitVec 32) (_ BitVec 64) V!27193 (_ BitVec 32) Int) Unit!29323)

(assert (=> b!860131 (= lt!387664 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!484 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860132 () Bool)

(declare-fun res!584496 () Bool)

(declare-fun e!479303 () Bool)

(assert (=> b!860132 (=> (not res!584496) (not e!479303))))

(assert (=> b!860132 (= res!584496 (validKeyInArray!0 k!854))))

(declare-fun b!860133 () Bool)

(declare-fun e!479304 () Bool)

(declare-fun tp_is_empty!16609 () Bool)

(assert (=> b!860133 (= e!479304 tp_is_empty!16609)))

(declare-fun b!860134 () Bool)

(declare-fun e!479300 () Bool)

(declare-fun mapRes!26513 () Bool)

(assert (=> b!860134 (= e!479300 (and e!479304 mapRes!26513))))

(declare-fun condMapEmpty!26513 () Bool)

(declare-fun mapDefault!26513 () ValueCell!7865)

