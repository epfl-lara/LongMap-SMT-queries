; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78824 () Bool)

(assert start!78824)

(declare-fun b_free!17037 () Bool)

(declare-fun b_next!17037 () Bool)

(assert (=> start!78824 (= b_free!17037 (not b_next!17037))))

(declare-fun tp!59552 () Bool)

(declare-fun b_and!27811 () Bool)

(assert (=> start!78824 (= tp!59552 b_and!27811)))

(declare-fun mapIsEmpty!31074 () Bool)

(declare-fun mapRes!31074 () Bool)

(assert (=> mapIsEmpty!31074 mapRes!31074))

(declare-fun b!920363 () Bool)

(declare-fun e!516560 () Bool)

(declare-fun e!516562 () Bool)

(assert (=> b!920363 (= e!516560 (and e!516562 mapRes!31074))))

(declare-fun condMapEmpty!31074 () Bool)

(declare-datatypes ((V!31025 0))(
  ( (V!31026 (val!9823 Int)) )
))
(declare-datatypes ((ValueCell!9291 0))(
  ( (ValueCellFull!9291 (v!12341 V!31025)) (EmptyCell!9291) )
))
(declare-datatypes ((array!55070 0))(
  ( (array!55071 (arr!26480 (Array (_ BitVec 32) ValueCell!9291)) (size!26939 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55070)

(declare-fun mapDefault!31074 () ValueCell!9291)

(assert (=> b!920363 (= condMapEmpty!31074 (= (arr!26480 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9291)) mapDefault!31074)))))

(declare-fun mapNonEmpty!31074 () Bool)

(declare-fun tp!59551 () Bool)

(declare-fun e!516564 () Bool)

(assert (=> mapNonEmpty!31074 (= mapRes!31074 (and tp!59551 e!516564))))

(declare-fun mapKey!31074 () (_ BitVec 32))

(declare-fun mapRest!31074 () (Array (_ BitVec 32) ValueCell!9291))

(declare-fun mapValue!31074 () ValueCell!9291)

(assert (=> mapNonEmpty!31074 (= (arr!26480 _values!1231) (store mapRest!31074 mapKey!31074 mapValue!31074))))

(declare-fun b!920364 () Bool)

(declare-fun e!516565 () Bool)

(declare-fun e!516559 () Bool)

(assert (=> b!920364 (= e!516565 e!516559)))

(declare-fun res!620644 () Bool)

(assert (=> b!920364 (=> (not res!620644) (not e!516559))))

(declare-fun lt!413174 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920364 (= res!620644 (validKeyInArray!0 lt!413174))))

(declare-datatypes ((array!55072 0))(
  ( (array!55073 (arr!26481 (Array (_ BitVec 32) (_ BitVec 64))) (size!26940 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55072)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!920364 (= lt!413174 (select (arr!26481 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920365 () Bool)

(declare-fun tp_is_empty!19545 () Bool)

(assert (=> b!920365 (= e!516562 tp_is_empty!19545)))

(declare-fun b!920366 () Bool)

(declare-fun res!620641 () Bool)

(declare-fun e!516561 () Bool)

(assert (=> b!920366 (=> res!620641 e!516561)))

(declare-datatypes ((List!18573 0))(
  ( (Nil!18570) (Cons!18569 (h!19715 (_ BitVec 64)) (t!26340 List!18573)) )
))
(declare-fun contains!4795 (List!18573 (_ BitVec 64)) Bool)

(assert (=> b!920366 (= res!620641 (contains!4795 Nil!18570 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920367 () Bool)

(declare-fun res!620647 () Bool)

(declare-fun e!516558 () Bool)

(assert (=> b!920367 (=> (not res!620647) (not e!516558))))

(assert (=> b!920367 (= res!620647 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26940 _keys!1487))))))

(declare-fun b!920368 () Bool)

(declare-fun res!620642 () Bool)

(assert (=> b!920368 (=> (not res!620642) (not e!516558))))

(declare-fun arrayNoDuplicates!0 (array!55072 (_ BitVec 32) List!18573) Bool)

(assert (=> b!920368 (= res!620642 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18570))))

(declare-fun b!920369 () Bool)

(assert (=> b!920369 (= e!516561 true)))

(declare-fun lt!413182 () Bool)

(assert (=> b!920369 (= lt!413182 (contains!4795 Nil!18570 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920370 () Bool)

(declare-fun res!620643 () Bool)

(assert (=> b!920370 (=> (not res!620643) (not e!516558))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55072 (_ BitVec 32)) Bool)

(assert (=> b!920370 (= res!620643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!620638 () Bool)

(assert (=> start!78824 (=> (not res!620638) (not e!516558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78824 (= res!620638 (validMask!0 mask!1881))))

(assert (=> start!78824 e!516558))

(assert (=> start!78824 true))

(assert (=> start!78824 tp_is_empty!19545))

(declare-fun array_inv!20636 (array!55070) Bool)

(assert (=> start!78824 (and (array_inv!20636 _values!1231) e!516560)))

(assert (=> start!78824 tp!59552))

(declare-fun array_inv!20637 (array!55072) Bool)

(assert (=> start!78824 (array_inv!20637 _keys!1487)))

(declare-fun b!920371 () Bool)

(declare-fun res!620646 () Bool)

(assert (=> b!920371 (=> (not res!620646) (not e!516565))))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!920371 (= res!620646 (validKeyInArray!0 k0!1099))))

(declare-fun e!516563 () Bool)

(declare-fun b!920372 () Bool)

(declare-fun arrayContainsKey!0 (array!55072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!920372 (= e!516563 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!920373 () Bool)

(declare-fun res!620645 () Bool)

(assert (=> b!920373 (=> (not res!620645) (not e!516558))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!920373 (= res!620645 (and (= (size!26939 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26940 _keys!1487) (size!26939 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!920374 () Bool)

(declare-fun res!620639 () Bool)

(assert (=> b!920374 (=> (not res!620639) (not e!516565))))

(declare-fun v!791 () V!31025)

(declare-datatypes ((tuple2!12770 0))(
  ( (tuple2!12771 (_1!6396 (_ BitVec 64)) (_2!6396 V!31025)) )
))
(declare-datatypes ((List!18574 0))(
  ( (Nil!18571) (Cons!18570 (h!19716 tuple2!12770) (t!26341 List!18574)) )
))
(declare-datatypes ((ListLongMap!11467 0))(
  ( (ListLongMap!11468 (toList!5749 List!18574)) )
))
(declare-fun lt!413180 () ListLongMap!11467)

(declare-fun apply!591 (ListLongMap!11467 (_ BitVec 64)) V!31025)

(assert (=> b!920374 (= res!620639 (= (apply!591 lt!413180 k0!1099) v!791))))

(declare-fun b!920375 () Bool)

(assert (=> b!920375 (= e!516558 e!516565)))

(declare-fun res!620640 () Bool)

(assert (=> b!920375 (=> (not res!620640) (not e!516565))))

(declare-fun contains!4796 (ListLongMap!11467 (_ BitVec 64)) Bool)

(assert (=> b!920375 (= res!620640 (contains!4796 lt!413180 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31025)

(declare-fun minValue!1173 () V!31025)

(declare-fun getCurrentListMap!3004 (array!55072 array!55070 (_ BitVec 32) (_ BitVec 32) V!31025 V!31025 (_ BitVec 32) Int) ListLongMap!11467)

(assert (=> b!920375 (= lt!413180 (getCurrentListMap!3004 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920376 () Bool)

(declare-fun res!620635 () Bool)

(assert (=> b!920376 (=> (not res!620635) (not e!516565))))

(assert (=> b!920376 (= res!620635 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!920377 () Bool)

(assert (=> b!920377 (= e!516559 (not e!516561))))

(declare-fun res!620637 () Bool)

(assert (=> b!920377 (=> res!620637 e!516561)))

(assert (=> b!920377 (= res!620637 (or (bvsge (size!26940 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26940 _keys!1487))))))

(assert (=> b!920377 e!516563))

(declare-fun c!96057 () Bool)

(assert (=> b!920377 (= c!96057 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31062 0))(
  ( (Unit!31063) )
))
(declare-fun lt!413175 () Unit!31062)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!164 (array!55072 array!55070 (_ BitVec 32) (_ BitVec 32) V!31025 V!31025 (_ BitVec 64) (_ BitVec 32) Int) Unit!31062)

(assert (=> b!920377 (= lt!413175 (lemmaListMapContainsThenArrayContainsFrom!164 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!920377 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18570)))

(declare-fun lt!413179 () Unit!31062)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55072 (_ BitVec 32) (_ BitVec 32)) Unit!31062)

(assert (=> b!920377 (= lt!413179 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413176 () tuple2!12770)

(declare-fun +!2657 (ListLongMap!11467 tuple2!12770) ListLongMap!11467)

(assert (=> b!920377 (contains!4796 (+!2657 lt!413180 lt!413176) k0!1099)))

(declare-fun lt!413181 () Unit!31062)

(declare-fun lt!413178 () V!31025)

(declare-fun addStillContains!381 (ListLongMap!11467 (_ BitVec 64) V!31025 (_ BitVec 64)) Unit!31062)

(assert (=> b!920377 (= lt!413181 (addStillContains!381 lt!413180 lt!413174 lt!413178 k0!1099))))

(assert (=> b!920377 (= (getCurrentListMap!3004 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2657 (getCurrentListMap!3004 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413176))))

(assert (=> b!920377 (= lt!413176 (tuple2!12771 lt!413174 lt!413178))))

(declare-fun get!13892 (ValueCell!9291 V!31025) V!31025)

(declare-fun dynLambda!1446 (Int (_ BitVec 64)) V!31025)

(assert (=> b!920377 (= lt!413178 (get!13892 (select (arr!26480 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1446 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413177 () Unit!31062)

(declare-fun lemmaListMapRecursiveValidKeyArray!47 (array!55072 array!55070 (_ BitVec 32) (_ BitVec 32) V!31025 V!31025 (_ BitVec 32) Int) Unit!31062)

(assert (=> b!920377 (= lt!413177 (lemmaListMapRecursiveValidKeyArray!47 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920378 () Bool)

(declare-fun res!620636 () Bool)

(assert (=> b!920378 (=> res!620636 e!516561)))

(declare-fun noDuplicate!1332 (List!18573) Bool)

(assert (=> b!920378 (= res!620636 (not (noDuplicate!1332 Nil!18570)))))

(declare-fun b!920379 () Bool)

(assert (=> b!920379 (= e!516564 tp_is_empty!19545)))

(declare-fun b!920380 () Bool)

(assert (=> b!920380 (= e!516563 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!78824 res!620638) b!920373))

(assert (= (and b!920373 res!620645) b!920370))

(assert (= (and b!920370 res!620643) b!920368))

(assert (= (and b!920368 res!620642) b!920367))

(assert (= (and b!920367 res!620647) b!920375))

(assert (= (and b!920375 res!620640) b!920374))

(assert (= (and b!920374 res!620639) b!920376))

(assert (= (and b!920376 res!620635) b!920371))

(assert (= (and b!920371 res!620646) b!920364))

(assert (= (and b!920364 res!620644) b!920377))

(assert (= (and b!920377 c!96057) b!920372))

(assert (= (and b!920377 (not c!96057)) b!920380))

(assert (= (and b!920377 (not res!620637)) b!920378))

(assert (= (and b!920378 (not res!620636)) b!920366))

(assert (= (and b!920366 (not res!620641)) b!920369))

(assert (= (and b!920363 condMapEmpty!31074) mapIsEmpty!31074))

(assert (= (and b!920363 (not condMapEmpty!31074)) mapNonEmpty!31074))

(get-info :version)

(assert (= (and mapNonEmpty!31074 ((_ is ValueCellFull!9291) mapValue!31074)) b!920379))

(assert (= (and b!920363 ((_ is ValueCellFull!9291) mapDefault!31074)) b!920365))

(assert (= start!78824 b!920363))

(declare-fun b_lambda!13539 () Bool)

(assert (=> (not b_lambda!13539) (not b!920377)))

(declare-fun t!26339 () Bool)

(declare-fun tb!5617 () Bool)

(assert (=> (and start!78824 (= defaultEntry!1235 defaultEntry!1235) t!26339) tb!5617))

(declare-fun result!11057 () Bool)

(assert (=> tb!5617 (= result!11057 tp_is_empty!19545)))

(assert (=> b!920377 t!26339))

(declare-fun b_and!27813 () Bool)

(assert (= b_and!27811 (and (=> t!26339 result!11057) b_and!27813)))

(declare-fun m!854281 () Bool)

(assert (=> b!920372 m!854281))

(declare-fun m!854283 () Bool)

(assert (=> b!920366 m!854283))

(declare-fun m!854285 () Bool)

(assert (=> b!920369 m!854285))

(declare-fun m!854287 () Bool)

(assert (=> mapNonEmpty!31074 m!854287))

(declare-fun m!854289 () Bool)

(assert (=> b!920368 m!854289))

(declare-fun m!854291 () Bool)

(assert (=> b!920374 m!854291))

(declare-fun m!854293 () Bool)

(assert (=> b!920371 m!854293))

(declare-fun m!854295 () Bool)

(assert (=> b!920370 m!854295))

(declare-fun m!854297 () Bool)

(assert (=> start!78824 m!854297))

(declare-fun m!854299 () Bool)

(assert (=> start!78824 m!854299))

(declare-fun m!854301 () Bool)

(assert (=> start!78824 m!854301))

(declare-fun m!854303 () Bool)

(assert (=> b!920375 m!854303))

(declare-fun m!854305 () Bool)

(assert (=> b!920375 m!854305))

(declare-fun m!854307 () Bool)

(assert (=> b!920377 m!854307))

(declare-fun m!854309 () Bool)

(assert (=> b!920377 m!854309))

(declare-fun m!854311 () Bool)

(assert (=> b!920377 m!854311))

(declare-fun m!854313 () Bool)

(assert (=> b!920377 m!854313))

(declare-fun m!854315 () Bool)

(assert (=> b!920377 m!854315))

(declare-fun m!854317 () Bool)

(assert (=> b!920377 m!854317))

(declare-fun m!854319 () Bool)

(assert (=> b!920377 m!854319))

(declare-fun m!854321 () Bool)

(assert (=> b!920377 m!854321))

(assert (=> b!920377 m!854315))

(assert (=> b!920377 m!854317))

(declare-fun m!854323 () Bool)

(assert (=> b!920377 m!854323))

(declare-fun m!854325 () Bool)

(assert (=> b!920377 m!854325))

(assert (=> b!920377 m!854307))

(declare-fun m!854327 () Bool)

(assert (=> b!920377 m!854327))

(declare-fun m!854329 () Bool)

(assert (=> b!920377 m!854329))

(assert (=> b!920377 m!854319))

(declare-fun m!854331 () Bool)

(assert (=> b!920377 m!854331))

(declare-fun m!854333 () Bool)

(assert (=> b!920364 m!854333))

(declare-fun m!854335 () Bool)

(assert (=> b!920364 m!854335))

(declare-fun m!854337 () Bool)

(assert (=> b!920378 m!854337))

(check-sat (not b!920364) (not b!920377) (not b!920374) (not mapNonEmpty!31074) (not b_next!17037) (not b!920372) (not b!920370) (not b!920375) (not b!920369) tp_is_empty!19545 (not b!920366) (not b_lambda!13539) (not b!920368) (not start!78824) (not b!920378) (not b!920371) b_and!27813)
(check-sat b_and!27813 (not b_next!17037))
