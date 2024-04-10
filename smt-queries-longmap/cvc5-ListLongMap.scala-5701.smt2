; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73990 () Bool)

(assert start!73990)

(declare-fun b_free!14905 () Bool)

(declare-fun b_next!14905 () Bool)

(assert (=> start!73990 (= b_free!14905 (not b_next!14905))))

(declare-fun tp!52218 () Bool)

(declare-fun b_and!24657 () Bool)

(assert (=> start!73990 (= tp!52218 b_and!24657)))

(declare-fun mapIsEmpty!27161 () Bool)

(declare-fun mapRes!27161 () Bool)

(assert (=> mapIsEmpty!27161 mapRes!27161))

(declare-fun b!869943 () Bool)

(declare-fun e!484447 () Bool)

(assert (=> b!869943 (= e!484447 (not true))))

(declare-datatypes ((V!27769 0))(
  ( (V!27770 (val!8568 Int)) )
))
(declare-fun v!557 () V!27769)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!8081 0))(
  ( (ValueCellFull!8081 (v!10993 V!27769)) (EmptyCell!8081) )
))
(declare-datatypes ((array!50228 0))(
  ( (array!50229 (arr!24145 (Array (_ BitVec 32) ValueCell!8081)) (size!24585 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50228)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27769)

(declare-fun zeroValue!654 () V!27769)

(declare-datatypes ((array!50230 0))(
  ( (array!50231 (arr!24146 (Array (_ BitVec 32) (_ BitVec 64))) (size!24586 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50230)

(declare-fun lt!394970 () array!50228)

(declare-datatypes ((tuple2!11384 0))(
  ( (tuple2!11385 (_1!5703 (_ BitVec 64)) (_2!5703 V!27769)) )
))
(declare-datatypes ((List!17175 0))(
  ( (Nil!17172) (Cons!17171 (h!18302 tuple2!11384) (t!24212 List!17175)) )
))
(declare-datatypes ((ListLongMap!10153 0))(
  ( (ListLongMap!10154 (toList!5092 List!17175)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3061 (array!50230 array!50228 (_ BitVec 32) (_ BitVec 32) V!27769 V!27769 (_ BitVec 32) Int) ListLongMap!10153)

(declare-fun +!2432 (ListLongMap!10153 tuple2!11384) ListLongMap!10153)

(assert (=> b!869943 (= (getCurrentListMapNoExtraKeys!3061 _keys!868 lt!394970 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2432 (getCurrentListMapNoExtraKeys!3061 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11385 k!854 v!557)))))

(declare-datatypes ((Unit!29862 0))(
  ( (Unit!29863) )
))
(declare-fun lt!394969 () Unit!29862)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!626 (array!50230 array!50228 (_ BitVec 32) (_ BitVec 32) V!27769 V!27769 (_ BitVec 32) (_ BitVec 64) V!27769 (_ BitVec 32) Int) Unit!29862)

(assert (=> b!869943 (= lt!394969 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!626 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869944 () Bool)

(declare-fun res!591231 () Bool)

(declare-fun e!484442 () Bool)

(assert (=> b!869944 (=> (not res!591231) (not e!484442))))

(declare-datatypes ((List!17176 0))(
  ( (Nil!17173) (Cons!17172 (h!18303 (_ BitVec 64)) (t!24213 List!17176)) )
))
(declare-fun arrayNoDuplicates!0 (array!50230 (_ BitVec 32) List!17176) Bool)

(assert (=> b!869944 (= res!591231 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17173))))

(declare-fun res!591238 () Bool)

(assert (=> start!73990 (=> (not res!591238) (not e!484442))))

(assert (=> start!73990 (= res!591238 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24586 _keys!868))))))

(assert (=> start!73990 e!484442))

(declare-fun tp_is_empty!17041 () Bool)

(assert (=> start!73990 tp_is_empty!17041))

(assert (=> start!73990 true))

(assert (=> start!73990 tp!52218))

(declare-fun array_inv!19074 (array!50230) Bool)

(assert (=> start!73990 (array_inv!19074 _keys!868)))

(declare-fun e!484444 () Bool)

(declare-fun array_inv!19075 (array!50228) Bool)

(assert (=> start!73990 (and (array_inv!19075 _values!688) e!484444)))

(declare-fun b!869945 () Bool)

(declare-fun e!484445 () Bool)

(assert (=> b!869945 (= e!484444 (and e!484445 mapRes!27161))))

(declare-fun condMapEmpty!27161 () Bool)

(declare-fun mapDefault!27161 () ValueCell!8081)

