; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74182 () Bool)

(assert start!74182)

(declare-fun b_free!14929 () Bool)

(declare-fun b_next!14929 () Bool)

(assert (=> start!74182 (= b_free!14929 (not b_next!14929))))

(declare-fun tp!52292 () Bool)

(declare-fun b_and!24691 () Bool)

(assert (=> start!74182 (= tp!52292 b_and!24691)))

(declare-fun b!871278 () Bool)

(declare-fun e!485244 () Bool)

(declare-fun tp_is_empty!17065 () Bool)

(assert (=> b!871278 (= e!485244 tp_is_empty!17065)))

(declare-fun b!871279 () Bool)

(declare-fun res!591907 () Bool)

(declare-fun e!485241 () Bool)

(assert (=> b!871279 (=> (not res!591907) (not e!485241))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871279 (= res!591907 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27197 () Bool)

(declare-fun mapRes!27197 () Bool)

(assert (=> mapIsEmpty!27197 mapRes!27197))

(declare-fun b!871280 () Bool)

(declare-fun res!591900 () Bool)

(assert (=> b!871280 (=> (not res!591900) (not e!485241))))

(declare-datatypes ((array!50333 0))(
  ( (array!50334 (arr!24193 (Array (_ BitVec 32) (_ BitVec 64))) (size!24634 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50333)

(declare-datatypes ((List!17148 0))(
  ( (Nil!17145) (Cons!17144 (h!18281 (_ BitVec 64)) (t!24177 List!17148)) )
))
(declare-fun arrayNoDuplicates!0 (array!50333 (_ BitVec 32) List!17148) Bool)

(assert (=> b!871280 (= res!591900 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17145))))

(declare-fun b!871281 () Bool)

(declare-fun e!485245 () Bool)

(assert (=> b!871281 (= e!485245 (not true))))

(declare-datatypes ((V!27801 0))(
  ( (V!27802 (val!8580 Int)) )
))
(declare-datatypes ((ValueCell!8093 0))(
  ( (ValueCellFull!8093 (v!11005 V!27801)) (EmptyCell!8093) )
))
(declare-datatypes ((array!50335 0))(
  ( (array!50336 (arr!24194 (Array (_ BitVec 32) ValueCell!8093)) (size!24635 (_ BitVec 32))) )
))
(declare-fun lt!395477 () array!50335)

(declare-fun v!557 () V!27801)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun _values!688 () array!50335)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27801)

(declare-fun zeroValue!654 () V!27801)

(declare-datatypes ((tuple2!11330 0))(
  ( (tuple2!11331 (_1!5676 (_ BitVec 64)) (_2!5676 V!27801)) )
))
(declare-datatypes ((List!17149 0))(
  ( (Nil!17146) (Cons!17145 (h!18282 tuple2!11330) (t!24178 List!17149)) )
))
(declare-datatypes ((ListLongMap!10101 0))(
  ( (ListLongMap!10102 (toList!5066 List!17149)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3110 (array!50333 array!50335 (_ BitVec 32) (_ BitVec 32) V!27801 V!27801 (_ BitVec 32) Int) ListLongMap!10101)

(declare-fun +!2459 (ListLongMap!10101 tuple2!11330) ListLongMap!10101)

(assert (=> b!871281 (= (getCurrentListMapNoExtraKeys!3110 _keys!868 lt!395477 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2459 (getCurrentListMapNoExtraKeys!3110 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11331 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29868 0))(
  ( (Unit!29869) )
))
(declare-fun lt!395474 () Unit!29868)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!630 (array!50333 array!50335 (_ BitVec 32) (_ BitVec 32) V!27801 V!27801 (_ BitVec 32) (_ BitVec 64) V!27801 (_ BitVec 32) Int) Unit!29868)

(assert (=> b!871281 (= lt!395474 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!630 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27197 () Bool)

(declare-fun tp!52291 () Bool)

(declare-fun e!485243 () Bool)

(assert (=> mapNonEmpty!27197 (= mapRes!27197 (and tp!52291 e!485243))))

(declare-fun mapRest!27197 () (Array (_ BitVec 32) ValueCell!8093))

(declare-fun mapValue!27197 () ValueCell!8093)

(declare-fun mapKey!27197 () (_ BitVec 32))

(assert (=> mapNonEmpty!27197 (= (arr!24194 _values!688) (store mapRest!27197 mapKey!27197 mapValue!27197))))

(declare-fun b!871282 () Bool)

(declare-fun res!591905 () Bool)

(assert (=> b!871282 (=> (not res!591905) (not e!485241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50333 (_ BitVec 32)) Bool)

(assert (=> b!871282 (= res!591905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871283 () Bool)

(assert (=> b!871283 (= e!485241 e!485245)))

(declare-fun res!591906 () Bool)

(assert (=> b!871283 (=> (not res!591906) (not e!485245))))

(assert (=> b!871283 (= res!591906 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395476 () ListLongMap!10101)

(assert (=> b!871283 (= lt!395476 (getCurrentListMapNoExtraKeys!3110 _keys!868 lt!395477 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!871283 (= lt!395477 (array!50336 (store (arr!24194 _values!688) i!612 (ValueCellFull!8093 v!557)) (size!24635 _values!688)))))

(declare-fun lt!395475 () ListLongMap!10101)

(assert (=> b!871283 (= lt!395475 (getCurrentListMapNoExtraKeys!3110 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871284 () Bool)

(declare-fun res!591904 () Bool)

(assert (=> b!871284 (=> (not res!591904) (not e!485241))))

(assert (=> b!871284 (= res!591904 (and (= (select (arr!24193 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871286 () Bool)

(declare-fun res!591903 () Bool)

(assert (=> b!871286 (=> (not res!591903) (not e!485241))))

(assert (=> b!871286 (= res!591903 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24634 _keys!868))))))

(declare-fun b!871287 () Bool)

(declare-fun res!591901 () Bool)

(assert (=> b!871287 (=> (not res!591901) (not e!485241))))

(assert (=> b!871287 (= res!591901 (and (= (size!24635 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24634 _keys!868) (size!24635 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871288 () Bool)

(declare-fun e!485242 () Bool)

(assert (=> b!871288 (= e!485242 (and e!485244 mapRes!27197))))

(declare-fun condMapEmpty!27197 () Bool)

(declare-fun mapDefault!27197 () ValueCell!8093)

(assert (=> b!871288 (= condMapEmpty!27197 (= (arr!24194 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8093)) mapDefault!27197)))))

(declare-fun b!871289 () Bool)

(assert (=> b!871289 (= e!485243 tp_is_empty!17065)))

(declare-fun b!871285 () Bool)

(declare-fun res!591902 () Bool)

(assert (=> b!871285 (=> (not res!591902) (not e!485241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871285 (= res!591902 (validMask!0 mask!1196))))

(declare-fun res!591899 () Bool)

(assert (=> start!74182 (=> (not res!591899) (not e!485241))))

(assert (=> start!74182 (= res!591899 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24634 _keys!868))))))

(assert (=> start!74182 e!485241))

(assert (=> start!74182 tp_is_empty!17065))

(assert (=> start!74182 true))

(assert (=> start!74182 tp!52292))

(declare-fun array_inv!19164 (array!50333) Bool)

(assert (=> start!74182 (array_inv!19164 _keys!868)))

(declare-fun array_inv!19165 (array!50335) Bool)

(assert (=> start!74182 (and (array_inv!19165 _values!688) e!485242)))

(assert (= (and start!74182 res!591899) b!871285))

(assert (= (and b!871285 res!591902) b!871287))

(assert (= (and b!871287 res!591901) b!871282))

(assert (= (and b!871282 res!591905) b!871280))

(assert (= (and b!871280 res!591900) b!871286))

(assert (= (and b!871286 res!591903) b!871279))

(assert (= (and b!871279 res!591907) b!871284))

(assert (= (and b!871284 res!591904) b!871283))

(assert (= (and b!871283 res!591906) b!871281))

(assert (= (and b!871288 condMapEmpty!27197) mapIsEmpty!27197))

(assert (= (and b!871288 (not condMapEmpty!27197)) mapNonEmpty!27197))

(get-info :version)

(assert (= (and mapNonEmpty!27197 ((_ is ValueCellFull!8093) mapValue!27197)) b!871289))

(assert (= (and b!871288 ((_ is ValueCellFull!8093) mapDefault!27197)) b!871278))

(assert (= start!74182 b!871288))

(declare-fun m!813047 () Bool)

(assert (=> b!871283 m!813047))

(declare-fun m!813049 () Bool)

(assert (=> b!871283 m!813049))

(declare-fun m!813051 () Bool)

(assert (=> b!871283 m!813051))

(declare-fun m!813053 () Bool)

(assert (=> b!871281 m!813053))

(declare-fun m!813055 () Bool)

(assert (=> b!871281 m!813055))

(assert (=> b!871281 m!813055))

(declare-fun m!813057 () Bool)

(assert (=> b!871281 m!813057))

(declare-fun m!813059 () Bool)

(assert (=> b!871281 m!813059))

(declare-fun m!813061 () Bool)

(assert (=> b!871285 m!813061))

(declare-fun m!813063 () Bool)

(assert (=> start!74182 m!813063))

(declare-fun m!813065 () Bool)

(assert (=> start!74182 m!813065))

(declare-fun m!813067 () Bool)

(assert (=> mapNonEmpty!27197 m!813067))

(declare-fun m!813069 () Bool)

(assert (=> b!871282 m!813069))

(declare-fun m!813071 () Bool)

(assert (=> b!871280 m!813071))

(declare-fun m!813073 () Bool)

(assert (=> b!871279 m!813073))

(declare-fun m!813075 () Bool)

(assert (=> b!871284 m!813075))

(check-sat (not b!871285) (not b_next!14929) (not b!871279) (not b!871280) b_and!24691 (not mapNonEmpty!27197) tp_is_empty!17065 (not b!871281) (not b!871283) (not b!871282) (not start!74182))
(check-sat b_and!24691 (not b_next!14929))
