; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74116 () Bool)

(assert start!74116)

(declare-fun b_free!14863 () Bool)

(declare-fun b_next!14863 () Bool)

(assert (=> start!74116 (= b_free!14863 (not b_next!14863))))

(declare-fun tp!52093 () Bool)

(declare-fun b_and!24625 () Bool)

(assert (=> start!74116 (= tp!52093 b_and!24625)))

(declare-fun b!870090 () Bool)

(declare-fun e!484647 () Bool)

(declare-fun tp_is_empty!16999 () Bool)

(assert (=> b!870090 (= e!484647 tp_is_empty!16999)))

(declare-fun b!870091 () Bool)

(declare-fun res!591013 () Bool)

(declare-fun e!484646 () Bool)

(assert (=> b!870091 (=> (not res!591013) (not e!484646))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50207 0))(
  ( (array!50208 (arr!24130 (Array (_ BitVec 32) (_ BitVec 64))) (size!24571 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50207)

(declare-datatypes ((V!27713 0))(
  ( (V!27714 (val!8547 Int)) )
))
(declare-datatypes ((ValueCell!8060 0))(
  ( (ValueCellFull!8060 (v!10972 V!27713)) (EmptyCell!8060) )
))
(declare-datatypes ((array!50209 0))(
  ( (array!50210 (arr!24131 (Array (_ BitVec 32) ValueCell!8060)) (size!24572 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50209)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!870091 (= res!591013 (and (= (size!24572 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24571 _keys!868) (size!24572 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870092 () Bool)

(declare-fun e!484649 () Bool)

(assert (=> b!870092 (= e!484649 tp_is_empty!16999)))

(declare-fun b!870093 () Bool)

(declare-fun res!591008 () Bool)

(assert (=> b!870093 (=> (not res!591008) (not e!484646))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870093 (= res!591008 (validKeyInArray!0 k0!854))))

(declare-fun b!870094 () Bool)

(declare-fun res!591010 () Bool)

(assert (=> b!870094 (=> (not res!591010) (not e!484646))))

(declare-datatypes ((List!17099 0))(
  ( (Nil!17096) (Cons!17095 (h!18232 (_ BitVec 64)) (t!24128 List!17099)) )
))
(declare-fun arrayNoDuplicates!0 (array!50207 (_ BitVec 32) List!17099) Bool)

(assert (=> b!870094 (= res!591010 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17096))))

(declare-fun b!870095 () Bool)

(declare-fun res!591011 () Bool)

(assert (=> b!870095 (=> (not res!591011) (not e!484646))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!870095 (= res!591011 (and (= (select (arr!24130 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870096 () Bool)

(declare-fun e!484651 () Bool)

(declare-fun mapRes!27098 () Bool)

(assert (=> b!870096 (= e!484651 (and e!484647 mapRes!27098))))

(declare-fun condMapEmpty!27098 () Bool)

(declare-fun mapDefault!27098 () ValueCell!8060)

(assert (=> b!870096 (= condMapEmpty!27098 (= (arr!24131 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8060)) mapDefault!27098)))))

(declare-fun b!870097 () Bool)

(declare-fun res!591014 () Bool)

(assert (=> b!870097 (=> (not res!591014) (not e!484646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50207 (_ BitVec 32)) Bool)

(assert (=> b!870097 (= res!591014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27098 () Bool)

(assert (=> mapIsEmpty!27098 mapRes!27098))

(declare-fun b!870098 () Bool)

(declare-fun res!591015 () Bool)

(assert (=> b!870098 (=> (not res!591015) (not e!484646))))

(assert (=> b!870098 (= res!591015 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24571 _keys!868))))))

(declare-fun b!870099 () Bool)

(declare-fun e!484648 () Bool)

(assert (=> b!870099 (= e!484646 e!484648)))

(declare-fun res!591009 () Bool)

(assert (=> b!870099 (=> (not res!591009) (not e!484648))))

(assert (=> b!870099 (= res!591009 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!395078 () array!50209)

(declare-fun minValue!654 () V!27713)

(declare-fun zeroValue!654 () V!27713)

(declare-datatypes ((tuple2!11276 0))(
  ( (tuple2!11277 (_1!5649 (_ BitVec 64)) (_2!5649 V!27713)) )
))
(declare-datatypes ((List!17100 0))(
  ( (Nil!17097) (Cons!17096 (h!18233 tuple2!11276) (t!24129 List!17100)) )
))
(declare-datatypes ((ListLongMap!10047 0))(
  ( (ListLongMap!10048 (toList!5039 List!17100)) )
))
(declare-fun lt!395079 () ListLongMap!10047)

(declare-fun getCurrentListMapNoExtraKeys!3083 (array!50207 array!50209 (_ BitVec 32) (_ BitVec 32) V!27713 V!27713 (_ BitVec 32) Int) ListLongMap!10047)

(assert (=> b!870099 (= lt!395079 (getCurrentListMapNoExtraKeys!3083 _keys!868 lt!395078 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27713)

(assert (=> b!870099 (= lt!395078 (array!50210 (store (arr!24131 _values!688) i!612 (ValueCellFull!8060 v!557)) (size!24572 _values!688)))))

(declare-fun lt!395081 () ListLongMap!10047)

(assert (=> b!870099 (= lt!395081 (getCurrentListMapNoExtraKeys!3083 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27098 () Bool)

(declare-fun tp!52094 () Bool)

(assert (=> mapNonEmpty!27098 (= mapRes!27098 (and tp!52094 e!484649))))

(declare-fun mapValue!27098 () ValueCell!8060)

(declare-fun mapKey!27098 () (_ BitVec 32))

(declare-fun mapRest!27098 () (Array (_ BitVec 32) ValueCell!8060))

(assert (=> mapNonEmpty!27098 (= (arr!24131 _values!688) (store mapRest!27098 mapKey!27098 mapValue!27098))))

(declare-fun res!591016 () Bool)

(assert (=> start!74116 (=> (not res!591016) (not e!484646))))

(assert (=> start!74116 (= res!591016 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24571 _keys!868))))))

(assert (=> start!74116 e!484646))

(assert (=> start!74116 tp_is_empty!16999))

(assert (=> start!74116 true))

(assert (=> start!74116 tp!52093))

(declare-fun array_inv!19116 (array!50207) Bool)

(assert (=> start!74116 (array_inv!19116 _keys!868)))

(declare-fun array_inv!19117 (array!50209) Bool)

(assert (=> start!74116 (and (array_inv!19117 _values!688) e!484651)))

(declare-fun b!870100 () Bool)

(declare-fun res!591012 () Bool)

(assert (=> b!870100 (=> (not res!591012) (not e!484646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870100 (= res!591012 (validMask!0 mask!1196))))

(declare-fun b!870101 () Bool)

(assert (=> b!870101 (= e!484648 (not true))))

(declare-fun +!2435 (ListLongMap!10047 tuple2!11276) ListLongMap!10047)

(assert (=> b!870101 (= (getCurrentListMapNoExtraKeys!3083 _keys!868 lt!395078 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2435 (getCurrentListMapNoExtraKeys!3083 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11277 k0!854 v!557)))))

(declare-datatypes ((Unit!29820 0))(
  ( (Unit!29821) )
))
(declare-fun lt!395080 () Unit!29820)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!606 (array!50207 array!50209 (_ BitVec 32) (_ BitVec 32) V!27713 V!27713 (_ BitVec 32) (_ BitVec 64) V!27713 (_ BitVec 32) Int) Unit!29820)

(assert (=> b!870101 (= lt!395080 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!606 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!74116 res!591016) b!870100))

(assert (= (and b!870100 res!591012) b!870091))

(assert (= (and b!870091 res!591013) b!870097))

(assert (= (and b!870097 res!591014) b!870094))

(assert (= (and b!870094 res!591010) b!870098))

(assert (= (and b!870098 res!591015) b!870093))

(assert (= (and b!870093 res!591008) b!870095))

(assert (= (and b!870095 res!591011) b!870099))

(assert (= (and b!870099 res!591009) b!870101))

(assert (= (and b!870096 condMapEmpty!27098) mapIsEmpty!27098))

(assert (= (and b!870096 (not condMapEmpty!27098)) mapNonEmpty!27098))

(get-info :version)

(assert (= (and mapNonEmpty!27098 ((_ is ValueCellFull!8060) mapValue!27098)) b!870092))

(assert (= (and b!870096 ((_ is ValueCellFull!8060) mapDefault!27098)) b!870090))

(assert (= start!74116 b!870096))

(declare-fun m!812057 () Bool)

(assert (=> b!870100 m!812057))

(declare-fun m!812059 () Bool)

(assert (=> b!870099 m!812059))

(declare-fun m!812061 () Bool)

(assert (=> b!870099 m!812061))

(declare-fun m!812063 () Bool)

(assert (=> b!870099 m!812063))

(declare-fun m!812065 () Bool)

(assert (=> b!870095 m!812065))

(declare-fun m!812067 () Bool)

(assert (=> start!74116 m!812067))

(declare-fun m!812069 () Bool)

(assert (=> start!74116 m!812069))

(declare-fun m!812071 () Bool)

(assert (=> mapNonEmpty!27098 m!812071))

(declare-fun m!812073 () Bool)

(assert (=> b!870094 m!812073))

(declare-fun m!812075 () Bool)

(assert (=> b!870097 m!812075))

(declare-fun m!812077 () Bool)

(assert (=> b!870101 m!812077))

(declare-fun m!812079 () Bool)

(assert (=> b!870101 m!812079))

(assert (=> b!870101 m!812079))

(declare-fun m!812081 () Bool)

(assert (=> b!870101 m!812081))

(declare-fun m!812083 () Bool)

(assert (=> b!870101 m!812083))

(declare-fun m!812085 () Bool)

(assert (=> b!870093 m!812085))

(check-sat (not start!74116) (not mapNonEmpty!27098) (not b!870100) (not b!870094) (not b!870093) tp_is_empty!16999 b_and!24625 (not b_next!14863) (not b!870099) (not b!870101) (not b!870097))
(check-sat b_and!24625 (not b_next!14863))
