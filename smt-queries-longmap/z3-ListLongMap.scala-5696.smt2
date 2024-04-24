; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74128 () Bool)

(assert start!74128)

(declare-fun b_free!14875 () Bool)

(declare-fun b_next!14875 () Bool)

(assert (=> start!74128 (= b_free!14875 (not b_next!14875))))

(declare-fun tp!52130 () Bool)

(declare-fun b_and!24637 () Bool)

(assert (=> start!74128 (= tp!52130 b_and!24637)))

(declare-fun b!870306 () Bool)

(declare-fun res!591177 () Bool)

(declare-fun e!484759 () Bool)

(assert (=> b!870306 (=> (not res!591177) (not e!484759))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870306 (= res!591177 (validMask!0 mask!1196))))

(declare-fun b!870307 () Bool)

(declare-fun res!591174 () Bool)

(assert (=> b!870307 (=> (not res!591174) (not e!484759))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870307 (= res!591174 (validKeyInArray!0 k0!854))))

(declare-fun b!870308 () Bool)

(declare-fun res!591176 () Bool)

(assert (=> b!870308 (=> (not res!591176) (not e!484759))))

(declare-datatypes ((array!50231 0))(
  ( (array!50232 (arr!24142 (Array (_ BitVec 32) (_ BitVec 64))) (size!24583 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50231)

(declare-datatypes ((List!17111 0))(
  ( (Nil!17108) (Cons!17107 (h!18244 (_ BitVec 64)) (t!24140 List!17111)) )
))
(declare-fun arrayNoDuplicates!0 (array!50231 (_ BitVec 32) List!17111) Bool)

(assert (=> b!870308 (= res!591176 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17108))))

(declare-fun b!870309 () Bool)

(declare-fun e!484757 () Bool)

(assert (=> b!870309 (= e!484757 (not true))))

(declare-datatypes ((V!27729 0))(
  ( (V!27730 (val!8553 Int)) )
))
(declare-fun v!557 () V!27729)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27729)

(declare-fun zeroValue!654 () V!27729)

(declare-datatypes ((ValueCell!8066 0))(
  ( (ValueCellFull!8066 (v!10978 V!27729)) (EmptyCell!8066) )
))
(declare-datatypes ((array!50233 0))(
  ( (array!50234 (arr!24143 (Array (_ BitVec 32) ValueCell!8066)) (size!24584 (_ BitVec 32))) )
))
(declare-fun lt!395151 () array!50233)

(declare-fun _values!688 () array!50233)

(declare-datatypes ((tuple2!11288 0))(
  ( (tuple2!11289 (_1!5655 (_ BitVec 64)) (_2!5655 V!27729)) )
))
(declare-datatypes ((List!17112 0))(
  ( (Nil!17109) (Cons!17108 (h!18245 tuple2!11288) (t!24141 List!17112)) )
))
(declare-datatypes ((ListLongMap!10059 0))(
  ( (ListLongMap!10060 (toList!5045 List!17112)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3089 (array!50231 array!50233 (_ BitVec 32) (_ BitVec 32) V!27729 V!27729 (_ BitVec 32) Int) ListLongMap!10059)

(declare-fun +!2440 (ListLongMap!10059 tuple2!11288) ListLongMap!10059)

(assert (=> b!870309 (= (getCurrentListMapNoExtraKeys!3089 _keys!868 lt!395151 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2440 (getCurrentListMapNoExtraKeys!3089 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11289 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29830 0))(
  ( (Unit!29831) )
))
(declare-fun lt!395150 () Unit!29830)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!611 (array!50231 array!50233 (_ BitVec 32) (_ BitVec 32) V!27729 V!27729 (_ BitVec 32) (_ BitVec 64) V!27729 (_ BitVec 32) Int) Unit!29830)

(assert (=> b!870309 (= lt!395150 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!611 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870310 () Bool)

(assert (=> b!870310 (= e!484759 e!484757)))

(declare-fun res!591170 () Bool)

(assert (=> b!870310 (=> (not res!591170) (not e!484757))))

(assert (=> b!870310 (= res!591170 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395153 () ListLongMap!10059)

(assert (=> b!870310 (= lt!395153 (getCurrentListMapNoExtraKeys!3089 _keys!868 lt!395151 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870310 (= lt!395151 (array!50234 (store (arr!24143 _values!688) i!612 (ValueCellFull!8066 v!557)) (size!24584 _values!688)))))

(declare-fun lt!395152 () ListLongMap!10059)

(assert (=> b!870310 (= lt!395152 (getCurrentListMapNoExtraKeys!3089 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870311 () Bool)

(declare-fun res!591171 () Bool)

(assert (=> b!870311 (=> (not res!591171) (not e!484759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50231 (_ BitVec 32)) Bool)

(assert (=> b!870311 (= res!591171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870312 () Bool)

(declare-fun res!591175 () Bool)

(assert (=> b!870312 (=> (not res!591175) (not e!484759))))

(assert (=> b!870312 (= res!591175 (and (= (select (arr!24142 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870314 () Bool)

(declare-fun e!484758 () Bool)

(declare-fun e!484754 () Bool)

(declare-fun mapRes!27116 () Bool)

(assert (=> b!870314 (= e!484758 (and e!484754 mapRes!27116))))

(declare-fun condMapEmpty!27116 () Bool)

(declare-fun mapDefault!27116 () ValueCell!8066)

(assert (=> b!870314 (= condMapEmpty!27116 (= (arr!24143 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8066)) mapDefault!27116)))))

(declare-fun mapIsEmpty!27116 () Bool)

(assert (=> mapIsEmpty!27116 mapRes!27116))

(declare-fun b!870315 () Bool)

(declare-fun res!591172 () Bool)

(assert (=> b!870315 (=> (not res!591172) (not e!484759))))

(assert (=> b!870315 (= res!591172 (and (= (size!24584 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24583 _keys!868) (size!24584 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870316 () Bool)

(declare-fun e!484756 () Bool)

(declare-fun tp_is_empty!17011 () Bool)

(assert (=> b!870316 (= e!484756 tp_is_empty!17011)))

(declare-fun b!870313 () Bool)

(declare-fun res!591173 () Bool)

(assert (=> b!870313 (=> (not res!591173) (not e!484759))))

(assert (=> b!870313 (= res!591173 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24583 _keys!868))))))

(declare-fun res!591178 () Bool)

(assert (=> start!74128 (=> (not res!591178) (not e!484759))))

(assert (=> start!74128 (= res!591178 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24583 _keys!868))))))

(assert (=> start!74128 e!484759))

(assert (=> start!74128 tp_is_empty!17011))

(assert (=> start!74128 true))

(assert (=> start!74128 tp!52130))

(declare-fun array_inv!19128 (array!50231) Bool)

(assert (=> start!74128 (array_inv!19128 _keys!868)))

(declare-fun array_inv!19129 (array!50233) Bool)

(assert (=> start!74128 (and (array_inv!19129 _values!688) e!484758)))

(declare-fun mapNonEmpty!27116 () Bool)

(declare-fun tp!52129 () Bool)

(assert (=> mapNonEmpty!27116 (= mapRes!27116 (and tp!52129 e!484756))))

(declare-fun mapKey!27116 () (_ BitVec 32))

(declare-fun mapValue!27116 () ValueCell!8066)

(declare-fun mapRest!27116 () (Array (_ BitVec 32) ValueCell!8066))

(assert (=> mapNonEmpty!27116 (= (arr!24143 _values!688) (store mapRest!27116 mapKey!27116 mapValue!27116))))

(declare-fun b!870317 () Bool)

(assert (=> b!870317 (= e!484754 tp_is_empty!17011)))

(assert (= (and start!74128 res!591178) b!870306))

(assert (= (and b!870306 res!591177) b!870315))

(assert (= (and b!870315 res!591172) b!870311))

(assert (= (and b!870311 res!591171) b!870308))

(assert (= (and b!870308 res!591176) b!870313))

(assert (= (and b!870313 res!591173) b!870307))

(assert (= (and b!870307 res!591174) b!870312))

(assert (= (and b!870312 res!591175) b!870310))

(assert (= (and b!870310 res!591170) b!870309))

(assert (= (and b!870314 condMapEmpty!27116) mapIsEmpty!27116))

(assert (= (and b!870314 (not condMapEmpty!27116)) mapNonEmpty!27116))

(get-info :version)

(assert (= (and mapNonEmpty!27116 ((_ is ValueCellFull!8066) mapValue!27116)) b!870316))

(assert (= (and b!870314 ((_ is ValueCellFull!8066) mapDefault!27116)) b!870317))

(assert (= start!74128 b!870314))

(declare-fun m!812237 () Bool)

(assert (=> b!870306 m!812237))

(declare-fun m!812239 () Bool)

(assert (=> b!870311 m!812239))

(declare-fun m!812241 () Bool)

(assert (=> b!870310 m!812241))

(declare-fun m!812243 () Bool)

(assert (=> b!870310 m!812243))

(declare-fun m!812245 () Bool)

(assert (=> b!870310 m!812245))

(declare-fun m!812247 () Bool)

(assert (=> b!870309 m!812247))

(declare-fun m!812249 () Bool)

(assert (=> b!870309 m!812249))

(assert (=> b!870309 m!812249))

(declare-fun m!812251 () Bool)

(assert (=> b!870309 m!812251))

(declare-fun m!812253 () Bool)

(assert (=> b!870309 m!812253))

(declare-fun m!812255 () Bool)

(assert (=> start!74128 m!812255))

(declare-fun m!812257 () Bool)

(assert (=> start!74128 m!812257))

(declare-fun m!812259 () Bool)

(assert (=> b!870312 m!812259))

(declare-fun m!812261 () Bool)

(assert (=> mapNonEmpty!27116 m!812261))

(declare-fun m!812263 () Bool)

(assert (=> b!870308 m!812263))

(declare-fun m!812265 () Bool)

(assert (=> b!870307 m!812265))

(check-sat (not b_next!14875) b_and!24637 (not b!870307) (not b!870308) (not b!870311) tp_is_empty!17011 (not mapNonEmpty!27116) (not b!870306) (not start!74128) (not b!870310) (not b!870309))
(check-sat b_and!24637 (not b_next!14875))
