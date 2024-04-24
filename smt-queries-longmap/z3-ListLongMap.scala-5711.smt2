; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74218 () Bool)

(assert start!74218)

(declare-fun b_free!14965 () Bool)

(declare-fun b_next!14965 () Bool)

(assert (=> start!74218 (= b_free!14965 (not b_next!14965))))

(declare-fun tp!52399 () Bool)

(declare-fun b_and!24727 () Bool)

(assert (=> start!74218 (= tp!52399 b_and!24727)))

(declare-fun b!871926 () Bool)

(declare-fun e!485568 () Bool)

(assert (=> b!871926 (= e!485568 (not true))))

(declare-datatypes ((V!27849 0))(
  ( (V!27850 (val!8598 Int)) )
))
(declare-datatypes ((ValueCell!8111 0))(
  ( (ValueCellFull!8111 (v!11023 V!27849)) (EmptyCell!8111) )
))
(declare-datatypes ((array!50403 0))(
  ( (array!50404 (arr!24228 (Array (_ BitVec 32) ValueCell!8111)) (size!24669 (_ BitVec 32))) )
))
(declare-fun lt!395693 () array!50403)

(declare-fun v!557 () V!27849)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50405 0))(
  ( (array!50406 (arr!24229 (Array (_ BitVec 32) (_ BitVec 64))) (size!24670 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50405)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27849)

(declare-fun zeroValue!654 () V!27849)

(declare-fun _values!688 () array!50403)

(declare-datatypes ((tuple2!11356 0))(
  ( (tuple2!11357 (_1!5689 (_ BitVec 64)) (_2!5689 V!27849)) )
))
(declare-datatypes ((List!17175 0))(
  ( (Nil!17172) (Cons!17171 (h!18308 tuple2!11356) (t!24204 List!17175)) )
))
(declare-datatypes ((ListLongMap!10127 0))(
  ( (ListLongMap!10128 (toList!5079 List!17175)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3123 (array!50405 array!50403 (_ BitVec 32) (_ BitVec 32) V!27849 V!27849 (_ BitVec 32) Int) ListLongMap!10127)

(declare-fun +!2469 (ListLongMap!10127 tuple2!11356) ListLongMap!10127)

(assert (=> b!871926 (= (getCurrentListMapNoExtraKeys!3123 _keys!868 lt!395693 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2469 (getCurrentListMapNoExtraKeys!3123 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11357 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29888 0))(
  ( (Unit!29889) )
))
(declare-fun lt!395691 () Unit!29888)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!640 (array!50405 array!50403 (_ BitVec 32) (_ BitVec 32) V!27849 V!27849 (_ BitVec 32) (_ BitVec 64) V!27849 (_ BitVec 32) Int) Unit!29888)

(assert (=> b!871926 (= lt!395691 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!640 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871927 () Bool)

(declare-fun e!485565 () Bool)

(assert (=> b!871927 (= e!485565 e!485568)))

(declare-fun res!592392 () Bool)

(assert (=> b!871927 (=> (not res!592392) (not e!485568))))

(assert (=> b!871927 (= res!592392 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395692 () ListLongMap!10127)

(assert (=> b!871927 (= lt!395692 (getCurrentListMapNoExtraKeys!3123 _keys!868 lt!395693 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!871927 (= lt!395693 (array!50404 (store (arr!24228 _values!688) i!612 (ValueCellFull!8111 v!557)) (size!24669 _values!688)))))

(declare-fun lt!395690 () ListLongMap!10127)

(assert (=> b!871927 (= lt!395690 (getCurrentListMapNoExtraKeys!3123 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27251 () Bool)

(declare-fun mapRes!27251 () Bool)

(assert (=> mapIsEmpty!27251 mapRes!27251))

(declare-fun b!871928 () Bool)

(declare-fun res!592388 () Bool)

(assert (=> b!871928 (=> (not res!592388) (not e!485565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871928 (= res!592388 (validKeyInArray!0 k0!854))))

(declare-fun b!871929 () Bool)

(declare-fun res!592391 () Bool)

(assert (=> b!871929 (=> (not res!592391) (not e!485565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871929 (= res!592391 (validMask!0 mask!1196))))

(declare-fun res!592389 () Bool)

(assert (=> start!74218 (=> (not res!592389) (not e!485565))))

(assert (=> start!74218 (= res!592389 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24670 _keys!868))))))

(assert (=> start!74218 e!485565))

(declare-fun tp_is_empty!17101 () Bool)

(assert (=> start!74218 tp_is_empty!17101))

(assert (=> start!74218 true))

(assert (=> start!74218 tp!52399))

(declare-fun array_inv!19188 (array!50405) Bool)

(assert (=> start!74218 (array_inv!19188 _keys!868)))

(declare-fun e!485567 () Bool)

(declare-fun array_inv!19189 (array!50403) Bool)

(assert (=> start!74218 (and (array_inv!19189 _values!688) e!485567)))

(declare-fun b!871930 () Bool)

(declare-fun res!592386 () Bool)

(assert (=> b!871930 (=> (not res!592386) (not e!485565))))

(assert (=> b!871930 (= res!592386 (and (= (select (arr!24229 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871931 () Bool)

(declare-fun res!592385 () Bool)

(assert (=> b!871931 (=> (not res!592385) (not e!485565))))

(assert (=> b!871931 (= res!592385 (and (= (size!24669 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24670 _keys!868) (size!24669 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871932 () Bool)

(declare-fun e!485566 () Bool)

(assert (=> b!871932 (= e!485566 tp_is_empty!17101)))

(declare-fun b!871933 () Bool)

(declare-fun res!592387 () Bool)

(assert (=> b!871933 (=> (not res!592387) (not e!485565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50405 (_ BitVec 32)) Bool)

(assert (=> b!871933 (= res!592387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871934 () Bool)

(assert (=> b!871934 (= e!485567 (and e!485566 mapRes!27251))))

(declare-fun condMapEmpty!27251 () Bool)

(declare-fun mapDefault!27251 () ValueCell!8111)

(assert (=> b!871934 (= condMapEmpty!27251 (= (arr!24228 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8111)) mapDefault!27251)))))

(declare-fun b!871935 () Bool)

(declare-fun e!485564 () Bool)

(assert (=> b!871935 (= e!485564 tp_is_empty!17101)))

(declare-fun b!871936 () Bool)

(declare-fun res!592393 () Bool)

(assert (=> b!871936 (=> (not res!592393) (not e!485565))))

(assert (=> b!871936 (= res!592393 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24670 _keys!868))))))

(declare-fun b!871937 () Bool)

(declare-fun res!592390 () Bool)

(assert (=> b!871937 (=> (not res!592390) (not e!485565))))

(declare-datatypes ((List!17176 0))(
  ( (Nil!17173) (Cons!17172 (h!18309 (_ BitVec 64)) (t!24205 List!17176)) )
))
(declare-fun arrayNoDuplicates!0 (array!50405 (_ BitVec 32) List!17176) Bool)

(assert (=> b!871937 (= res!592390 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17173))))

(declare-fun mapNonEmpty!27251 () Bool)

(declare-fun tp!52400 () Bool)

(assert (=> mapNonEmpty!27251 (= mapRes!27251 (and tp!52400 e!485564))))

(declare-fun mapKey!27251 () (_ BitVec 32))

(declare-fun mapValue!27251 () ValueCell!8111)

(declare-fun mapRest!27251 () (Array (_ BitVec 32) ValueCell!8111))

(assert (=> mapNonEmpty!27251 (= (arr!24228 _values!688) (store mapRest!27251 mapKey!27251 mapValue!27251))))

(assert (= (and start!74218 res!592389) b!871929))

(assert (= (and b!871929 res!592391) b!871931))

(assert (= (and b!871931 res!592385) b!871933))

(assert (= (and b!871933 res!592387) b!871937))

(assert (= (and b!871937 res!592390) b!871936))

(assert (= (and b!871936 res!592393) b!871928))

(assert (= (and b!871928 res!592388) b!871930))

(assert (= (and b!871930 res!592386) b!871927))

(assert (= (and b!871927 res!592392) b!871926))

(assert (= (and b!871934 condMapEmpty!27251) mapIsEmpty!27251))

(assert (= (and b!871934 (not condMapEmpty!27251)) mapNonEmpty!27251))

(get-info :version)

(assert (= (and mapNonEmpty!27251 ((_ is ValueCellFull!8111) mapValue!27251)) b!871935))

(assert (= (and b!871934 ((_ is ValueCellFull!8111) mapDefault!27251)) b!871932))

(assert (= start!74218 b!871934))

(declare-fun m!813587 () Bool)

(assert (=> b!871930 m!813587))

(declare-fun m!813589 () Bool)

(assert (=> b!871926 m!813589))

(declare-fun m!813591 () Bool)

(assert (=> b!871926 m!813591))

(assert (=> b!871926 m!813591))

(declare-fun m!813593 () Bool)

(assert (=> b!871926 m!813593))

(declare-fun m!813595 () Bool)

(assert (=> b!871926 m!813595))

(declare-fun m!813597 () Bool)

(assert (=> b!871937 m!813597))

(declare-fun m!813599 () Bool)

(assert (=> b!871928 m!813599))

(declare-fun m!813601 () Bool)

(assert (=> mapNonEmpty!27251 m!813601))

(declare-fun m!813603 () Bool)

(assert (=> start!74218 m!813603))

(declare-fun m!813605 () Bool)

(assert (=> start!74218 m!813605))

(declare-fun m!813607 () Bool)

(assert (=> b!871929 m!813607))

(declare-fun m!813609 () Bool)

(assert (=> b!871927 m!813609))

(declare-fun m!813611 () Bool)

(assert (=> b!871927 m!813611))

(declare-fun m!813613 () Bool)

(assert (=> b!871927 m!813613))

(declare-fun m!813615 () Bool)

(assert (=> b!871933 m!813615))

(check-sat (not b!871928) (not b!871937) (not b!871926) tp_is_empty!17101 (not b!871933) (not b!871929) (not b!871927) (not b_next!14965) (not mapNonEmpty!27251) b_and!24727 (not start!74218))
(check-sat b_and!24727 (not b_next!14965))
