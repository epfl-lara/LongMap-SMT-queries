; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74030 () Bool)

(assert start!74030)

(declare-fun b_free!14945 () Bool)

(declare-fun b_next!14945 () Bool)

(assert (=> start!74030 (= b_free!14945 (not b_next!14945))))

(declare-fun tp!52339 () Bool)

(declare-fun b_and!24697 () Bool)

(assert (=> start!74030 (= tp!52339 b_and!24697)))

(declare-fun b!870663 () Bool)

(declare-fun e!484803 () Bool)

(assert (=> b!870663 (= e!484803 (not true))))

(declare-datatypes ((V!27821 0))(
  ( (V!27822 (val!8588 Int)) )
))
(declare-fun v!557 () V!27821)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8101 0))(
  ( (ValueCellFull!8101 (v!11013 V!27821)) (EmptyCell!8101) )
))
(declare-datatypes ((array!50306 0))(
  ( (array!50307 (arr!24184 (Array (_ BitVec 32) ValueCell!8101)) (size!24624 (_ BitVec 32))) )
))
(declare-fun lt!395211 () array!50306)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!50308 0))(
  ( (array!50309 (arr!24185 (Array (_ BitVec 32) (_ BitVec 64))) (size!24625 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50308)

(declare-fun _values!688 () array!50306)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27821)

(declare-fun zeroValue!654 () V!27821)

(declare-datatypes ((tuple2!11410 0))(
  ( (tuple2!11411 (_1!5716 (_ BitVec 64)) (_2!5716 V!27821)) )
))
(declare-datatypes ((List!17201 0))(
  ( (Nil!17198) (Cons!17197 (h!18328 tuple2!11410) (t!24238 List!17201)) )
))
(declare-datatypes ((ListLongMap!10179 0))(
  ( (ListLongMap!10180 (toList!5105 List!17201)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3074 (array!50308 array!50306 (_ BitVec 32) (_ BitVec 32) V!27821 V!27821 (_ BitVec 32) Int) ListLongMap!10179)

(declare-fun +!2442 (ListLongMap!10179 tuple2!11410) ListLongMap!10179)

(assert (=> b!870663 (= (getCurrentListMapNoExtraKeys!3074 _keys!868 lt!395211 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2442 (getCurrentListMapNoExtraKeys!3074 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11411 k!854 v!557)))))

(declare-datatypes ((Unit!29882 0))(
  ( (Unit!29883) )
))
(declare-fun lt!395209 () Unit!29882)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!636 (array!50308 array!50306 (_ BitVec 32) (_ BitVec 32) V!27821 V!27821 (_ BitVec 32) (_ BitVec 64) V!27821 (_ BitVec 32) Int) Unit!29882)

(assert (=> b!870663 (= lt!395209 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!636 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870664 () Bool)

(declare-fun res!591775 () Bool)

(declare-fun e!484806 () Bool)

(assert (=> b!870664 (=> (not res!591775) (not e!484806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870664 (= res!591775 (validKeyInArray!0 k!854))))

(declare-fun b!870665 () Bool)

(declare-fun e!484805 () Bool)

(declare-fun tp_is_empty!17081 () Bool)

(assert (=> b!870665 (= e!484805 tp_is_empty!17081)))

(declare-fun res!591773 () Bool)

(assert (=> start!74030 (=> (not res!591773) (not e!484806))))

(assert (=> start!74030 (= res!591773 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24625 _keys!868))))))

(assert (=> start!74030 e!484806))

(assert (=> start!74030 tp_is_empty!17081))

(assert (=> start!74030 true))

(assert (=> start!74030 tp!52339))

(declare-fun array_inv!19098 (array!50308) Bool)

(assert (=> start!74030 (array_inv!19098 _keys!868)))

(declare-fun e!484802 () Bool)

(declare-fun array_inv!19099 (array!50306) Bool)

(assert (=> start!74030 (and (array_inv!19099 _values!688) e!484802)))

(declare-fun mapNonEmpty!27221 () Bool)

(declare-fun mapRes!27221 () Bool)

(declare-fun tp!52338 () Bool)

(assert (=> mapNonEmpty!27221 (= mapRes!27221 (and tp!52338 e!484805))))

(declare-fun mapRest!27221 () (Array (_ BitVec 32) ValueCell!8101))

(declare-fun mapValue!27221 () ValueCell!8101)

(declare-fun mapKey!27221 () (_ BitVec 32))

(assert (=> mapNonEmpty!27221 (= (arr!24184 _values!688) (store mapRest!27221 mapKey!27221 mapValue!27221))))

(declare-fun b!870666 () Bool)

(declare-fun res!591771 () Bool)

(assert (=> b!870666 (=> (not res!591771) (not e!484806))))

(assert (=> b!870666 (= res!591771 (and (= (select (arr!24185 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!870667 () Bool)

(declare-fun e!484804 () Bool)

(assert (=> b!870667 (= e!484802 (and e!484804 mapRes!27221))))

(declare-fun condMapEmpty!27221 () Bool)

(declare-fun mapDefault!27221 () ValueCell!8101)

