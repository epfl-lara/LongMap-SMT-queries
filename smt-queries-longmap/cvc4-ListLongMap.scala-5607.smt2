; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73430 () Bool)

(assert start!73430)

(declare-fun b_free!14345 () Bool)

(declare-fun b_next!14345 () Bool)

(assert (=> start!73430 (= b_free!14345 (not b_next!14345))))

(declare-fun tp!50539 () Bool)

(declare-fun b_and!23701 () Bool)

(assert (=> start!73430 (= tp!50539 b_and!23701)))

(declare-fun b!857334 () Bool)

(declare-fun res!582367 () Bool)

(declare-fun e!477850 () Bool)

(assert (=> b!857334 (=> (not res!582367) (not e!477850))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49154 0))(
  ( (array!49155 (arr!23608 (Array (_ BitVec 32) (_ BitVec 64))) (size!24048 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49154)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!857334 (= res!582367 (and (= (select (arr!23608 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!582370 () Bool)

(assert (=> start!73430 (=> (not res!582370) (not e!477850))))

(assert (=> start!73430 (= res!582370 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24048 _keys!868))))))

(assert (=> start!73430 e!477850))

(declare-fun tp_is_empty!16481 () Bool)

(assert (=> start!73430 tp_is_empty!16481))

(assert (=> start!73430 true))

(assert (=> start!73430 tp!50539))

(declare-fun array_inv!18696 (array!49154) Bool)

(assert (=> start!73430 (array_inv!18696 _keys!868)))

(declare-datatypes ((V!27021 0))(
  ( (V!27022 (val!8288 Int)) )
))
(declare-datatypes ((ValueCell!7801 0))(
  ( (ValueCellFull!7801 (v!10713 V!27021)) (EmptyCell!7801) )
))
(declare-datatypes ((array!49156 0))(
  ( (array!49157 (arr!23609 (Array (_ BitVec 32) ValueCell!7801)) (size!24049 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49156)

(declare-fun e!477849 () Bool)

(declare-fun array_inv!18697 (array!49156) Bool)

(assert (=> start!73430 (and (array_inv!18697 _values!688) e!477849)))

(declare-fun b!857335 () Bool)

(declare-fun res!582368 () Bool)

(assert (=> b!857335 (=> (not res!582368) (not e!477850))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857335 (= res!582368 (validMask!0 mask!1196))))

(declare-fun b!857336 () Bool)

(declare-fun e!477847 () Bool)

(assert (=> b!857336 (= e!477847 tp_is_empty!16481)))

(declare-fun b!857337 () Bool)

(declare-fun res!582372 () Bool)

(assert (=> b!857337 (=> (not res!582372) (not e!477850))))

(assert (=> b!857337 (= res!582372 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24048 _keys!868))))))

(declare-fun b!857338 () Bool)

(declare-fun e!477848 () Bool)

(assert (=> b!857338 (= e!477848 (not true))))

(declare-fun v!557 () V!27021)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27021)

(declare-fun zeroValue!654 () V!27021)

(declare-fun lt!386254 () array!49156)

(declare-datatypes ((tuple2!10936 0))(
  ( (tuple2!10937 (_1!5479 (_ BitVec 64)) (_2!5479 V!27021)) )
))
(declare-datatypes ((List!16744 0))(
  ( (Nil!16741) (Cons!16740 (h!17871 tuple2!10936) (t!23385 List!16744)) )
))
(declare-datatypes ((ListLongMap!9705 0))(
  ( (ListLongMap!9706 (toList!4868 List!16744)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2849 (array!49154 array!49156 (_ BitVec 32) (_ BitVec 32) V!27021 V!27021 (_ BitVec 32) Int) ListLongMap!9705)

(declare-fun +!2222 (ListLongMap!9705 tuple2!10936) ListLongMap!9705)

(assert (=> b!857338 (= (getCurrentListMapNoExtraKeys!2849 _keys!868 lt!386254 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2222 (getCurrentListMapNoExtraKeys!2849 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10937 k!854 v!557)))))

(declare-datatypes ((Unit!29231 0))(
  ( (Unit!29232) )
))
(declare-fun lt!386257 () Unit!29231)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!443 (array!49154 array!49156 (_ BitVec 32) (_ BitVec 32) V!27021 V!27021 (_ BitVec 32) (_ BitVec 64) V!27021 (_ BitVec 32) Int) Unit!29231)

(assert (=> b!857338 (= lt!386257 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!443 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857339 () Bool)

(declare-fun res!582371 () Bool)

(assert (=> b!857339 (=> (not res!582371) (not e!477850))))

(assert (=> b!857339 (= res!582371 (and (= (size!24049 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24048 _keys!868) (size!24049 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857340 () Bool)

(declare-fun mapRes!26321 () Bool)

(assert (=> b!857340 (= e!477849 (and e!477847 mapRes!26321))))

(declare-fun condMapEmpty!26321 () Bool)

(declare-fun mapDefault!26321 () ValueCell!7801)

