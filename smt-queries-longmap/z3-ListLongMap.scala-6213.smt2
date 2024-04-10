; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79414 () Bool)

(assert start!79414)

(declare-fun b_free!17601 () Bool)

(declare-fun b_next!17601 () Bool)

(assert (=> start!79414 (= b_free!17601 (not b_next!17601))))

(declare-fun tp!61246 () Bool)

(declare-fun b_and!28761 () Bool)

(assert (=> start!79414 (= tp!61246 b_and!28761)))

(declare-fun b!933306 () Bool)

(declare-fun res!628619 () Bool)

(declare-fun e!524077 () Bool)

(assert (=> b!933306 (=> (not res!628619) (not e!524077))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933306 (= res!628619 (validKeyInArray!0 k0!1099))))

(declare-fun b!933307 () Bool)

(declare-fun e!524076 () Bool)

(declare-fun tp_is_empty!20109 () Bool)

(assert (=> b!933307 (= e!524076 tp_is_empty!20109)))

(declare-fun b!933308 () Bool)

(declare-fun res!628622 () Bool)

(declare-fun e!524073 () Bool)

(assert (=> b!933308 (=> (not res!628622) (not e!524073))))

(declare-datatypes ((array!56154 0))(
  ( (array!56155 (arr!27021 (Array (_ BitVec 32) (_ BitVec 64))) (size!27480 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56154)

(declare-datatypes ((List!19029 0))(
  ( (Nil!19026) (Cons!19025 (h!20171 (_ BitVec 64)) (t!27174 List!19029)) )
))
(declare-fun arrayNoDuplicates!0 (array!56154 (_ BitVec 32) List!19029) Bool)

(assert (=> b!933308 (= res!628622 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19026))))

(declare-fun mapNonEmpty!31923 () Bool)

(declare-fun mapRes!31923 () Bool)

(declare-fun tp!61247 () Bool)

(assert (=> mapNonEmpty!31923 (= mapRes!31923 (and tp!61247 e!524076))))

(declare-fun mapKey!31923 () (_ BitVec 32))

(declare-datatypes ((V!31777 0))(
  ( (V!31778 (val!10105 Int)) )
))
(declare-datatypes ((ValueCell!9573 0))(
  ( (ValueCellFull!9573 (v!12624 V!31777)) (EmptyCell!9573) )
))
(declare-fun mapRest!31923 () (Array (_ BitVec 32) ValueCell!9573))

(declare-datatypes ((array!56156 0))(
  ( (array!56157 (arr!27022 (Array (_ BitVec 32) ValueCell!9573)) (size!27481 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56156)

(declare-fun mapValue!31923 () ValueCell!9573)

(assert (=> mapNonEmpty!31923 (= (arr!27022 _values!1231) (store mapRest!31923 mapKey!31923 mapValue!31923))))

(declare-fun b!933309 () Bool)

(declare-fun e!524075 () Bool)

(assert (=> b!933309 (= e!524077 e!524075)))

(declare-fun res!628616 () Bool)

(assert (=> b!933309 (=> (not res!628616) (not e!524075))))

(declare-fun lt!420338 () (_ BitVec 64))

(assert (=> b!933309 (= res!628616 (validKeyInArray!0 lt!420338))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933309 (= lt!420338 (select (arr!27021 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933310 () Bool)

(declare-fun res!628621 () Bool)

(assert (=> b!933310 (=> (not res!628621) (not e!524077))))

(assert (=> b!933310 (= res!628621 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933311 () Bool)

(declare-fun res!628617 () Bool)

(assert (=> b!933311 (=> (not res!628617) (not e!524073))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56154 (_ BitVec 32)) Bool)

(assert (=> b!933311 (= res!628617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933312 () Bool)

(declare-fun res!628623 () Bool)

(assert (=> b!933312 (=> (not res!628623) (not e!524073))))

(assert (=> b!933312 (= res!628623 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27480 _keys!1487))))))

(declare-fun b!933313 () Bool)

(declare-fun e!524074 () Bool)

(declare-fun e!524078 () Bool)

(assert (=> b!933313 (= e!524074 (and e!524078 mapRes!31923))))

(declare-fun condMapEmpty!31923 () Bool)

(declare-fun mapDefault!31923 () ValueCell!9573)

(assert (=> b!933313 (= condMapEmpty!31923 (= (arr!27022 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9573)) mapDefault!31923)))))

(declare-fun b!933314 () Bool)

(assert (=> b!933314 (= e!524073 e!524077)))

(declare-fun res!628615 () Bool)

(assert (=> b!933314 (=> (not res!628615) (not e!524077))))

(declare-datatypes ((tuple2!13248 0))(
  ( (tuple2!13249 (_1!6635 (_ BitVec 64)) (_2!6635 V!31777)) )
))
(declare-datatypes ((List!19030 0))(
  ( (Nil!19027) (Cons!19026 (h!20172 tuple2!13248) (t!27175 List!19030)) )
))
(declare-datatypes ((ListLongMap!11945 0))(
  ( (ListLongMap!11946 (toList!5988 List!19030)) )
))
(declare-fun lt!420337 () ListLongMap!11945)

(declare-fun contains!5037 (ListLongMap!11945 (_ BitVec 64)) Bool)

(assert (=> b!933314 (= res!628615 (contains!5037 lt!420337 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31777)

(declare-fun minValue!1173 () V!31777)

(declare-fun getCurrentListMap!3226 (array!56154 array!56156 (_ BitVec 32) (_ BitVec 32) V!31777 V!31777 (_ BitVec 32) Int) ListLongMap!11945)

(assert (=> b!933314 (= lt!420337 (getCurrentListMap!3226 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933316 () Bool)

(assert (=> b!933316 (= e!524075 (not true))))

(assert (=> b!933316 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19026)))

(declare-datatypes ((Unit!31493 0))(
  ( (Unit!31494) )
))
(declare-fun lt!420336 () Unit!31493)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56154 (_ BitVec 32) (_ BitVec 32)) Unit!31493)

(assert (=> b!933316 (= lt!420336 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420333 () tuple2!13248)

(declare-fun +!2789 (ListLongMap!11945 tuple2!13248) ListLongMap!11945)

(assert (=> b!933316 (contains!5037 (+!2789 lt!420337 lt!420333) k0!1099)))

(declare-fun lt!420334 () V!31777)

(declare-fun lt!420332 () Unit!31493)

(declare-fun addStillContains!508 (ListLongMap!11945 (_ BitVec 64) V!31777 (_ BitVec 64)) Unit!31493)

(assert (=> b!933316 (= lt!420332 (addStillContains!508 lt!420337 lt!420338 lt!420334 k0!1099))))

(assert (=> b!933316 (= (getCurrentListMap!3226 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2789 (getCurrentListMap!3226 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420333))))

(assert (=> b!933316 (= lt!420333 (tuple2!13249 lt!420338 lt!420334))))

(declare-fun get!14215 (ValueCell!9573 V!31777) V!31777)

(declare-fun dynLambda!1578 (Int (_ BitVec 64)) V!31777)

(assert (=> b!933316 (= lt!420334 (get!14215 (select (arr!27022 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1578 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420335 () Unit!31493)

(declare-fun lemmaListMapRecursiveValidKeyArray!179 (array!56154 array!56156 (_ BitVec 32) (_ BitVec 32) V!31777 V!31777 (_ BitVec 32) Int) Unit!31493)

(assert (=> b!933316 (= lt!420335 (lemmaListMapRecursiveValidKeyArray!179 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933317 () Bool)

(declare-fun res!628618 () Bool)

(assert (=> b!933317 (=> (not res!628618) (not e!524073))))

(assert (=> b!933317 (= res!628618 (and (= (size!27481 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27480 _keys!1487) (size!27481 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933318 () Bool)

(declare-fun res!628624 () Bool)

(assert (=> b!933318 (=> (not res!628624) (not e!524077))))

(declare-fun v!791 () V!31777)

(declare-fun apply!799 (ListLongMap!11945 (_ BitVec 64)) V!31777)

(assert (=> b!933318 (= res!628624 (= (apply!799 lt!420337 k0!1099) v!791))))

(declare-fun mapIsEmpty!31923 () Bool)

(assert (=> mapIsEmpty!31923 mapRes!31923))

(declare-fun res!628620 () Bool)

(assert (=> start!79414 (=> (not res!628620) (not e!524073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79414 (= res!628620 (validMask!0 mask!1881))))

(assert (=> start!79414 e!524073))

(assert (=> start!79414 true))

(assert (=> start!79414 tp_is_empty!20109))

(declare-fun array_inv!21032 (array!56156) Bool)

(assert (=> start!79414 (and (array_inv!21032 _values!1231) e!524074)))

(assert (=> start!79414 tp!61246))

(declare-fun array_inv!21033 (array!56154) Bool)

(assert (=> start!79414 (array_inv!21033 _keys!1487)))

(declare-fun b!933315 () Bool)

(assert (=> b!933315 (= e!524078 tp_is_empty!20109)))

(assert (= (and start!79414 res!628620) b!933317))

(assert (= (and b!933317 res!628618) b!933311))

(assert (= (and b!933311 res!628617) b!933308))

(assert (= (and b!933308 res!628622) b!933312))

(assert (= (and b!933312 res!628623) b!933314))

(assert (= (and b!933314 res!628615) b!933318))

(assert (= (and b!933318 res!628624) b!933310))

(assert (= (and b!933310 res!628621) b!933306))

(assert (= (and b!933306 res!628619) b!933309))

(assert (= (and b!933309 res!628616) b!933316))

(assert (= (and b!933313 condMapEmpty!31923) mapIsEmpty!31923))

(assert (= (and b!933313 (not condMapEmpty!31923)) mapNonEmpty!31923))

(get-info :version)

(assert (= (and mapNonEmpty!31923 ((_ is ValueCellFull!9573) mapValue!31923)) b!933307))

(assert (= (and b!933313 ((_ is ValueCellFull!9573) mapDefault!31923)) b!933315))

(assert (= start!79414 b!933313))

(declare-fun b_lambda!13935 () Bool)

(assert (=> (not b_lambda!13935) (not b!933316)))

(declare-fun t!27173 () Bool)

(declare-fun tb!5995 () Bool)

(assert (=> (and start!79414 (= defaultEntry!1235 defaultEntry!1235) t!27173) tb!5995))

(declare-fun result!11815 () Bool)

(assert (=> tb!5995 (= result!11815 tp_is_empty!20109)))

(assert (=> b!933316 t!27173))

(declare-fun b_and!28763 () Bool)

(assert (= b_and!28761 (and (=> t!27173 result!11815) b_and!28763)))

(declare-fun m!867415 () Bool)

(assert (=> b!933306 m!867415))

(declare-fun m!867417 () Bool)

(assert (=> b!933316 m!867417))

(declare-fun m!867419 () Bool)

(assert (=> b!933316 m!867419))

(declare-fun m!867421 () Bool)

(assert (=> b!933316 m!867421))

(declare-fun m!867423 () Bool)

(assert (=> b!933316 m!867423))

(declare-fun m!867425 () Bool)

(assert (=> b!933316 m!867425))

(declare-fun m!867427 () Bool)

(assert (=> b!933316 m!867427))

(declare-fun m!867429 () Bool)

(assert (=> b!933316 m!867429))

(assert (=> b!933316 m!867423))

(declare-fun m!867431 () Bool)

(assert (=> b!933316 m!867431))

(declare-fun m!867433 () Bool)

(assert (=> b!933316 m!867433))

(declare-fun m!867435 () Bool)

(assert (=> b!933316 m!867435))

(assert (=> b!933316 m!867417))

(assert (=> b!933316 m!867419))

(declare-fun m!867437 () Bool)

(assert (=> b!933316 m!867437))

(assert (=> b!933316 m!867433))

(declare-fun m!867439 () Bool)

(assert (=> b!933316 m!867439))

(declare-fun m!867441 () Bool)

(assert (=> b!933311 m!867441))

(declare-fun m!867443 () Bool)

(assert (=> b!933318 m!867443))

(declare-fun m!867445 () Bool)

(assert (=> start!79414 m!867445))

(declare-fun m!867447 () Bool)

(assert (=> start!79414 m!867447))

(declare-fun m!867449 () Bool)

(assert (=> start!79414 m!867449))

(declare-fun m!867451 () Bool)

(assert (=> b!933314 m!867451))

(declare-fun m!867453 () Bool)

(assert (=> b!933314 m!867453))

(declare-fun m!867455 () Bool)

(assert (=> mapNonEmpty!31923 m!867455))

(declare-fun m!867457 () Bool)

(assert (=> b!933308 m!867457))

(declare-fun m!867459 () Bool)

(assert (=> b!933309 m!867459))

(declare-fun m!867461 () Bool)

(assert (=> b!933309 m!867461))

(check-sat (not b!933306) (not mapNonEmpty!31923) (not b!933314) (not start!79414) (not b!933309) b_and!28763 (not b!933316) tp_is_empty!20109 (not b!933311) (not b_lambda!13935) (not b_next!17601) (not b!933318) (not b!933308))
(check-sat b_and!28763 (not b_next!17601))
