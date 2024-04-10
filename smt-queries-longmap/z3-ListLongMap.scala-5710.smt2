; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74046 () Bool)

(assert start!74046)

(declare-fun b_free!14961 () Bool)

(declare-fun b_next!14961 () Bool)

(assert (=> start!74046 (= b_free!14961 (not b_next!14961))))

(declare-fun tp!52387 () Bool)

(declare-fun b_and!24713 () Bool)

(assert (=> start!74046 (= tp!52387 b_and!24713)))

(declare-fun b!870951 () Bool)

(declare-fun res!591988 () Bool)

(declare-fun e!484946 () Bool)

(assert (=> b!870951 (=> (not res!591988) (not e!484946))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50338 0))(
  ( (array!50339 (arr!24200 (Array (_ BitVec 32) (_ BitVec 64))) (size!24640 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50338)

(assert (=> b!870951 (= res!591988 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24640 _keys!868))))))

(declare-fun b!870952 () Bool)

(declare-fun e!484947 () Bool)

(declare-fun tp_is_empty!17097 () Bool)

(assert (=> b!870952 (= e!484947 tp_is_empty!17097)))

(declare-fun b!870953 () Bool)

(declare-fun res!591991 () Bool)

(assert (=> b!870953 (=> (not res!591991) (not e!484946))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870953 (= res!591991 (validMask!0 mask!1196))))

(declare-fun b!870954 () Bool)

(declare-fun res!591992 () Bool)

(assert (=> b!870954 (=> (not res!591992) (not e!484946))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!870954 (= res!591992 (and (= (select (arr!24200 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870955 () Bool)

(declare-fun e!484950 () Bool)

(assert (=> b!870955 (= e!484950 (not true))))

(declare-datatypes ((V!27843 0))(
  ( (V!27844 (val!8596 Int)) )
))
(declare-fun v!557 () V!27843)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27843)

(declare-fun zeroValue!654 () V!27843)

(declare-datatypes ((ValueCell!8109 0))(
  ( (ValueCellFull!8109 (v!11021 V!27843)) (EmptyCell!8109) )
))
(declare-datatypes ((array!50340 0))(
  ( (array!50341 (arr!24201 (Array (_ BitVec 32) ValueCell!8109)) (size!24641 (_ BitVec 32))) )
))
(declare-fun lt!395305 () array!50340)

(declare-fun _values!688 () array!50340)

(declare-datatypes ((tuple2!11422 0))(
  ( (tuple2!11423 (_1!5722 (_ BitVec 64)) (_2!5722 V!27843)) )
))
(declare-datatypes ((List!17210 0))(
  ( (Nil!17207) (Cons!17206 (h!18337 tuple2!11422) (t!24247 List!17210)) )
))
(declare-datatypes ((ListLongMap!10191 0))(
  ( (ListLongMap!10192 (toList!5111 List!17210)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3080 (array!50338 array!50340 (_ BitVec 32) (_ BitVec 32) V!27843 V!27843 (_ BitVec 32) Int) ListLongMap!10191)

(declare-fun +!2447 (ListLongMap!10191 tuple2!11422) ListLongMap!10191)

(assert (=> b!870955 (= (getCurrentListMapNoExtraKeys!3080 _keys!868 lt!395305 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2447 (getCurrentListMapNoExtraKeys!3080 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11423 k0!854 v!557)))))

(declare-datatypes ((Unit!29892 0))(
  ( (Unit!29893) )
))
(declare-fun lt!395307 () Unit!29892)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!641 (array!50338 array!50340 (_ BitVec 32) (_ BitVec 32) V!27843 V!27843 (_ BitVec 32) (_ BitVec 64) V!27843 (_ BitVec 32) Int) Unit!29892)

(assert (=> b!870955 (= lt!395307 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!641 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870956 () Bool)

(declare-fun res!591989 () Bool)

(assert (=> b!870956 (=> (not res!591989) (not e!484946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870956 (= res!591989 (validKeyInArray!0 k0!854))))

(declare-fun res!591994 () Bool)

(assert (=> start!74046 (=> (not res!591994) (not e!484946))))

(assert (=> start!74046 (= res!591994 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24640 _keys!868))))))

(assert (=> start!74046 e!484946))

(assert (=> start!74046 tp_is_empty!17097))

(assert (=> start!74046 true))

(assert (=> start!74046 tp!52387))

(declare-fun array_inv!19110 (array!50338) Bool)

(assert (=> start!74046 (array_inv!19110 _keys!868)))

(declare-fun e!484951 () Bool)

(declare-fun array_inv!19111 (array!50340) Bool)

(assert (=> start!74046 (and (array_inv!19111 _values!688) e!484951)))

(declare-fun b!870957 () Bool)

(assert (=> b!870957 (= e!484946 e!484950)))

(declare-fun res!591990 () Bool)

(assert (=> b!870957 (=> (not res!591990) (not e!484950))))

(assert (=> b!870957 (= res!591990 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395308 () ListLongMap!10191)

(assert (=> b!870957 (= lt!395308 (getCurrentListMapNoExtraKeys!3080 _keys!868 lt!395305 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870957 (= lt!395305 (array!50341 (store (arr!24201 _values!688) i!612 (ValueCellFull!8109 v!557)) (size!24641 _values!688)))))

(declare-fun lt!395306 () ListLongMap!10191)

(assert (=> b!870957 (= lt!395306 (getCurrentListMapNoExtraKeys!3080 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870958 () Bool)

(declare-fun res!591995 () Bool)

(assert (=> b!870958 (=> (not res!591995) (not e!484946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50338 (_ BitVec 32)) Bool)

(assert (=> b!870958 (= res!591995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870959 () Bool)

(declare-fun e!484949 () Bool)

(assert (=> b!870959 (= e!484949 tp_is_empty!17097)))

(declare-fun mapNonEmpty!27245 () Bool)

(declare-fun mapRes!27245 () Bool)

(declare-fun tp!52386 () Bool)

(assert (=> mapNonEmpty!27245 (= mapRes!27245 (and tp!52386 e!484947))))

(declare-fun mapKey!27245 () (_ BitVec 32))

(declare-fun mapValue!27245 () ValueCell!8109)

(declare-fun mapRest!27245 () (Array (_ BitVec 32) ValueCell!8109))

(assert (=> mapNonEmpty!27245 (= (arr!24201 _values!688) (store mapRest!27245 mapKey!27245 mapValue!27245))))

(declare-fun b!870960 () Bool)

(assert (=> b!870960 (= e!484951 (and e!484949 mapRes!27245))))

(declare-fun condMapEmpty!27245 () Bool)

(declare-fun mapDefault!27245 () ValueCell!8109)

(assert (=> b!870960 (= condMapEmpty!27245 (= (arr!24201 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8109)) mapDefault!27245)))))

(declare-fun b!870961 () Bool)

(declare-fun res!591987 () Bool)

(assert (=> b!870961 (=> (not res!591987) (not e!484946))))

(declare-datatypes ((List!17211 0))(
  ( (Nil!17208) (Cons!17207 (h!18338 (_ BitVec 64)) (t!24248 List!17211)) )
))
(declare-fun arrayNoDuplicates!0 (array!50338 (_ BitVec 32) List!17211) Bool)

(assert (=> b!870961 (= res!591987 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17208))))

(declare-fun b!870962 () Bool)

(declare-fun res!591993 () Bool)

(assert (=> b!870962 (=> (not res!591993) (not e!484946))))

(assert (=> b!870962 (= res!591993 (and (= (size!24641 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24640 _keys!868) (size!24641 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27245 () Bool)

(assert (=> mapIsEmpty!27245 mapRes!27245))

(assert (= (and start!74046 res!591994) b!870953))

(assert (= (and b!870953 res!591991) b!870962))

(assert (= (and b!870962 res!591993) b!870958))

(assert (= (and b!870958 res!591995) b!870961))

(assert (= (and b!870961 res!591987) b!870951))

(assert (= (and b!870951 res!591988) b!870956))

(assert (= (and b!870956 res!591989) b!870954))

(assert (= (and b!870954 res!591992) b!870957))

(assert (= (and b!870957 res!591990) b!870955))

(assert (= (and b!870960 condMapEmpty!27245) mapIsEmpty!27245))

(assert (= (and b!870960 (not condMapEmpty!27245)) mapNonEmpty!27245))

(get-info :version)

(assert (= (and mapNonEmpty!27245 ((_ is ValueCellFull!8109) mapValue!27245)) b!870952))

(assert (= (and b!870960 ((_ is ValueCellFull!8109) mapDefault!27245)) b!870959))

(assert (= start!74046 b!870960))

(declare-fun m!812237 () Bool)

(assert (=> b!870954 m!812237))

(declare-fun m!812239 () Bool)

(assert (=> mapNonEmpty!27245 m!812239))

(declare-fun m!812241 () Bool)

(assert (=> b!870961 m!812241))

(declare-fun m!812243 () Bool)

(assert (=> start!74046 m!812243))

(declare-fun m!812245 () Bool)

(assert (=> start!74046 m!812245))

(declare-fun m!812247 () Bool)

(assert (=> b!870957 m!812247))

(declare-fun m!812249 () Bool)

(assert (=> b!870957 m!812249))

(declare-fun m!812251 () Bool)

(assert (=> b!870957 m!812251))

(declare-fun m!812253 () Bool)

(assert (=> b!870953 m!812253))

(declare-fun m!812255 () Bool)

(assert (=> b!870955 m!812255))

(declare-fun m!812257 () Bool)

(assert (=> b!870955 m!812257))

(assert (=> b!870955 m!812257))

(declare-fun m!812259 () Bool)

(assert (=> b!870955 m!812259))

(declare-fun m!812261 () Bool)

(assert (=> b!870955 m!812261))

(declare-fun m!812263 () Bool)

(assert (=> b!870958 m!812263))

(declare-fun m!812265 () Bool)

(assert (=> b!870956 m!812265))

(check-sat b_and!24713 (not b!870956) tp_is_empty!17097 (not b_next!14961) (not b!870961) (not mapNonEmpty!27245) (not b!870955) (not start!74046) (not b!870958) (not b!870953) (not b!870957))
(check-sat b_and!24713 (not b_next!14961))
