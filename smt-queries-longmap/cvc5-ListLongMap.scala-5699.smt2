; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73978 () Bool)

(assert start!73978)

(declare-fun b_free!14893 () Bool)

(declare-fun b_next!14893 () Bool)

(assert (=> start!73978 (= b_free!14893 (not b_next!14893))))

(declare-fun tp!52182 () Bool)

(declare-fun b_and!24645 () Bool)

(assert (=> start!73978 (= tp!52182 b_and!24645)))

(declare-fun b!869727 () Bool)

(declare-fun res!591069 () Bool)

(declare-fun e!484337 () Bool)

(assert (=> b!869727 (=> (not res!591069) (not e!484337))))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!50204 0))(
  ( (array!50205 (arr!24133 (Array (_ BitVec 32) (_ BitVec 64))) (size!24573 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50204)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869727 (= res!591069 (and (= (select (arr!24133 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27143 () Bool)

(declare-fun mapRes!27143 () Bool)

(assert (=> mapIsEmpty!27143 mapRes!27143))

(declare-fun b!869728 () Bool)

(declare-fun res!591074 () Bool)

(assert (=> b!869728 (=> (not res!591074) (not e!484337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869728 (= res!591074 (validKeyInArray!0 k!854))))

(declare-fun b!869729 () Bool)

(declare-fun res!591072 () Bool)

(assert (=> b!869729 (=> (not res!591072) (not e!484337))))

(assert (=> b!869729 (= res!591072 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24573 _keys!868))))))

(declare-fun b!869730 () Bool)

(declare-fun e!484339 () Bool)

(declare-fun tp_is_empty!17029 () Bool)

(assert (=> b!869730 (= e!484339 tp_is_empty!17029)))

(declare-fun b!869731 () Bool)

(declare-fun res!591077 () Bool)

(assert (=> b!869731 (=> (not res!591077) (not e!484337))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869731 (= res!591077 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27143 () Bool)

(declare-fun tp!52183 () Bool)

(declare-fun e!484334 () Bool)

(assert (=> mapNonEmpty!27143 (= mapRes!27143 (and tp!52183 e!484334))))

(declare-datatypes ((V!27753 0))(
  ( (V!27754 (val!8562 Int)) )
))
(declare-datatypes ((ValueCell!8075 0))(
  ( (ValueCellFull!8075 (v!10987 V!27753)) (EmptyCell!8075) )
))
(declare-fun mapValue!27143 () ValueCell!8075)

(declare-fun mapRest!27143 () (Array (_ BitVec 32) ValueCell!8075))

(declare-fun mapKey!27143 () (_ BitVec 32))

(declare-datatypes ((array!50206 0))(
  ( (array!50207 (arr!24134 (Array (_ BitVec 32) ValueCell!8075)) (size!24574 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50206)

(assert (=> mapNonEmpty!27143 (= (arr!24134 _values!688) (store mapRest!27143 mapKey!27143 mapValue!27143))))

(declare-fun res!591071 () Bool)

(assert (=> start!73978 (=> (not res!591071) (not e!484337))))

(assert (=> start!73978 (= res!591071 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24573 _keys!868))))))

(assert (=> start!73978 e!484337))

(assert (=> start!73978 tp_is_empty!17029))

(assert (=> start!73978 true))

(assert (=> start!73978 tp!52182))

(declare-fun array_inv!19064 (array!50204) Bool)

(assert (=> start!73978 (array_inv!19064 _keys!868)))

(declare-fun e!484336 () Bool)

(declare-fun array_inv!19065 (array!50206) Bool)

(assert (=> start!73978 (and (array_inv!19065 _values!688) e!484336)))

(declare-fun b!869732 () Bool)

(declare-fun e!484338 () Bool)

(assert (=> b!869732 (= e!484338 (not true))))

(declare-fun v!557 () V!27753)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!394897 () array!50206)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27753)

(declare-fun zeroValue!654 () V!27753)

(declare-datatypes ((tuple2!11376 0))(
  ( (tuple2!11377 (_1!5699 (_ BitVec 64)) (_2!5699 V!27753)) )
))
(declare-datatypes ((List!17166 0))(
  ( (Nil!17163) (Cons!17162 (h!18293 tuple2!11376) (t!24203 List!17166)) )
))
(declare-datatypes ((ListLongMap!10145 0))(
  ( (ListLongMap!10146 (toList!5088 List!17166)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3057 (array!50204 array!50206 (_ BitVec 32) (_ BitVec 32) V!27753 V!27753 (_ BitVec 32) Int) ListLongMap!10145)

(declare-fun +!2428 (ListLongMap!10145 tuple2!11376) ListLongMap!10145)

(assert (=> b!869732 (= (getCurrentListMapNoExtraKeys!3057 _keys!868 lt!394897 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2428 (getCurrentListMapNoExtraKeys!3057 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11377 k!854 v!557)))))

(declare-datatypes ((Unit!29854 0))(
  ( (Unit!29855) )
))
(declare-fun lt!394898 () Unit!29854)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!622 (array!50204 array!50206 (_ BitVec 32) (_ BitVec 32) V!27753 V!27753 (_ BitVec 32) (_ BitVec 64) V!27753 (_ BitVec 32) Int) Unit!29854)

(assert (=> b!869732 (= lt!394898 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!622 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869733 () Bool)

(declare-fun res!591076 () Bool)

(assert (=> b!869733 (=> (not res!591076) (not e!484337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50204 (_ BitVec 32)) Bool)

(assert (=> b!869733 (= res!591076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869734 () Bool)

(declare-fun res!591075 () Bool)

(assert (=> b!869734 (=> (not res!591075) (not e!484337))))

(declare-datatypes ((List!17167 0))(
  ( (Nil!17164) (Cons!17163 (h!18294 (_ BitVec 64)) (t!24204 List!17167)) )
))
(declare-fun arrayNoDuplicates!0 (array!50204 (_ BitVec 32) List!17167) Bool)

(assert (=> b!869734 (= res!591075 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17164))))

(declare-fun b!869735 () Bool)

(assert (=> b!869735 (= e!484336 (and e!484339 mapRes!27143))))

(declare-fun condMapEmpty!27143 () Bool)

(declare-fun mapDefault!27143 () ValueCell!8075)

