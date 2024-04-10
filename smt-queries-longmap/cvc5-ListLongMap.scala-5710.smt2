; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74044 () Bool)

(assert start!74044)

(declare-fun b_free!14959 () Bool)

(declare-fun b_next!14959 () Bool)

(assert (=> start!74044 (= b_free!14959 (not b_next!14959))))

(declare-fun tp!52380 () Bool)

(declare-fun b_and!24711 () Bool)

(assert (=> start!74044 (= tp!52380 b_and!24711)))

(declare-fun b!870915 () Bool)

(declare-fun res!591960 () Bool)

(declare-fun e!484930 () Bool)

(assert (=> b!870915 (=> (not res!591960) (not e!484930))))

(declare-datatypes ((array!50334 0))(
  ( (array!50335 (arr!24198 (Array (_ BitVec 32) (_ BitVec 64))) (size!24638 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50334)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50334 (_ BitVec 32)) Bool)

(assert (=> b!870915 (= res!591960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870916 () Bool)

(declare-fun e!484933 () Bool)

(assert (=> b!870916 (= e!484933 (not true))))

(declare-datatypes ((V!27841 0))(
  ( (V!27842 (val!8595 Int)) )
))
(declare-fun v!557 () V!27841)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!8108 0))(
  ( (ValueCellFull!8108 (v!11020 V!27841)) (EmptyCell!8108) )
))
(declare-datatypes ((array!50336 0))(
  ( (array!50337 (arr!24199 (Array (_ BitVec 32) ValueCell!8108)) (size!24639 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50336)

(declare-fun minValue!654 () V!27841)

(declare-fun zeroValue!654 () V!27841)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!395295 () array!50336)

(declare-datatypes ((tuple2!11420 0))(
  ( (tuple2!11421 (_1!5721 (_ BitVec 64)) (_2!5721 V!27841)) )
))
(declare-datatypes ((List!17208 0))(
  ( (Nil!17205) (Cons!17204 (h!18335 tuple2!11420) (t!24245 List!17208)) )
))
(declare-datatypes ((ListLongMap!10189 0))(
  ( (ListLongMap!10190 (toList!5110 List!17208)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3079 (array!50334 array!50336 (_ BitVec 32) (_ BitVec 32) V!27841 V!27841 (_ BitVec 32) Int) ListLongMap!10189)

(declare-fun +!2446 (ListLongMap!10189 tuple2!11420) ListLongMap!10189)

(assert (=> b!870916 (= (getCurrentListMapNoExtraKeys!3079 _keys!868 lt!395295 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2446 (getCurrentListMapNoExtraKeys!3079 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11421 k!854 v!557)))))

(declare-datatypes ((Unit!29890 0))(
  ( (Unit!29891) )
))
(declare-fun lt!395293 () Unit!29890)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!640 (array!50334 array!50336 (_ BitVec 32) (_ BitVec 32) V!27841 V!27841 (_ BitVec 32) (_ BitVec 64) V!27841 (_ BitVec 32) Int) Unit!29890)

(assert (=> b!870916 (= lt!395293 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!640 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870917 () Bool)

(declare-fun res!591968 () Bool)

(assert (=> b!870917 (=> (not res!591968) (not e!484930))))

(declare-datatypes ((List!17209 0))(
  ( (Nil!17206) (Cons!17205 (h!18336 (_ BitVec 64)) (t!24246 List!17209)) )
))
(declare-fun arrayNoDuplicates!0 (array!50334 (_ BitVec 32) List!17209) Bool)

(assert (=> b!870917 (= res!591968 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17206))))

(declare-fun res!591964 () Bool)

(assert (=> start!74044 (=> (not res!591964) (not e!484930))))

(assert (=> start!74044 (= res!591964 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24638 _keys!868))))))

(assert (=> start!74044 e!484930))

(declare-fun tp_is_empty!17095 () Bool)

(assert (=> start!74044 tp_is_empty!17095))

(assert (=> start!74044 true))

(assert (=> start!74044 tp!52380))

(declare-fun array_inv!19108 (array!50334) Bool)

(assert (=> start!74044 (array_inv!19108 _keys!868)))

(declare-fun e!484929 () Bool)

(declare-fun array_inv!19109 (array!50336) Bool)

(assert (=> start!74044 (and (array_inv!19109 _values!688) e!484929)))

(declare-fun mapIsEmpty!27242 () Bool)

(declare-fun mapRes!27242 () Bool)

(assert (=> mapIsEmpty!27242 mapRes!27242))

(declare-fun b!870918 () Bool)

(declare-fun res!591965 () Bool)

(assert (=> b!870918 (=> (not res!591965) (not e!484930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870918 (= res!591965 (validKeyInArray!0 k!854))))

(declare-fun b!870919 () Bool)

(assert (=> b!870919 (= e!484930 e!484933)))

(declare-fun res!591967 () Bool)

(assert (=> b!870919 (=> (not res!591967) (not e!484933))))

(assert (=> b!870919 (= res!591967 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395294 () ListLongMap!10189)

(assert (=> b!870919 (= lt!395294 (getCurrentListMapNoExtraKeys!3079 _keys!868 lt!395295 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870919 (= lt!395295 (array!50337 (store (arr!24199 _values!688) i!612 (ValueCellFull!8108 v!557)) (size!24639 _values!688)))))

(declare-fun lt!395296 () ListLongMap!10189)

(assert (=> b!870919 (= lt!395296 (getCurrentListMapNoExtraKeys!3079 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870920 () Bool)

(declare-fun res!591961 () Bool)

(assert (=> b!870920 (=> (not res!591961) (not e!484930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870920 (= res!591961 (validMask!0 mask!1196))))

(declare-fun b!870921 () Bool)

(declare-fun res!591963 () Bool)

(assert (=> b!870921 (=> (not res!591963) (not e!484930))))

(assert (=> b!870921 (= res!591963 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24638 _keys!868))))))

(declare-fun b!870922 () Bool)

(declare-fun e!484932 () Bool)

(assert (=> b!870922 (= e!484929 (and e!484932 mapRes!27242))))

(declare-fun condMapEmpty!27242 () Bool)

(declare-fun mapDefault!27242 () ValueCell!8108)

