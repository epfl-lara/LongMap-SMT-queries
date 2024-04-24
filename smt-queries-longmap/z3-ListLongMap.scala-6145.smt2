; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79146 () Bool)

(assert start!79146)

(declare-fun b_free!17191 () Bool)

(declare-fun b_next!17191 () Bool)

(assert (=> start!79146 (= b_free!17191 (not b_next!17191))))

(declare-fun tp!60014 () Bool)

(declare-fun b_and!28129 () Bool)

(assert (=> start!79146 (= tp!60014 b_and!28129)))

(declare-fun b!925308 () Bool)

(declare-fun res!623457 () Bool)

(declare-fun e!519331 () Bool)

(assert (=> b!925308 (=> (not res!623457) (not e!519331))))

(declare-datatypes ((array!55419 0))(
  ( (array!55420 (arr!26650 (Array (_ BitVec 32) (_ BitVec 64))) (size!27110 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55419)

(declare-datatypes ((List!18703 0))(
  ( (Nil!18700) (Cons!18699 (h!19851 (_ BitVec 64)) (t!26616 List!18703)) )
))
(declare-fun arrayNoDuplicates!0 (array!55419 (_ BitVec 32) List!18703) Bool)

(assert (=> b!925308 (= res!623457 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18700))))

(declare-fun b!925309 () Bool)

(declare-datatypes ((Unit!31213 0))(
  ( (Unit!31214) )
))
(declare-fun e!519329 () Unit!31213)

(declare-fun Unit!31215 () Unit!31213)

(assert (=> b!925309 (= e!519329 Unit!31215)))

(declare-fun res!623453 () Bool)

(assert (=> start!79146 (=> (not res!623453) (not e!519331))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79146 (= res!623453 (validMask!0 mask!1881))))

(assert (=> start!79146 e!519331))

(assert (=> start!79146 true))

(declare-fun tp_is_empty!19699 () Bool)

(assert (=> start!79146 tp_is_empty!19699))

(declare-datatypes ((V!31231 0))(
  ( (V!31232 (val!9900 Int)) )
))
(declare-datatypes ((ValueCell!9368 0))(
  ( (ValueCellFull!9368 (v!12415 V!31231)) (EmptyCell!9368) )
))
(declare-datatypes ((array!55421 0))(
  ( (array!55422 (arr!26651 (Array (_ BitVec 32) ValueCell!9368)) (size!27111 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55421)

(declare-fun e!519333 () Bool)

(declare-fun array_inv!20856 (array!55421) Bool)

(assert (=> start!79146 (and (array_inv!20856 _values!1231) e!519333)))

(assert (=> start!79146 tp!60014))

(declare-fun array_inv!20857 (array!55419) Bool)

(assert (=> start!79146 (array_inv!20857 _keys!1487)))

(declare-fun b!925310 () Bool)

(declare-datatypes ((tuple2!12890 0))(
  ( (tuple2!12891 (_1!6456 (_ BitVec 64)) (_2!6456 V!31231)) )
))
(declare-datatypes ((List!18704 0))(
  ( (Nil!18701) (Cons!18700 (h!19852 tuple2!12890) (t!26617 List!18704)) )
))
(declare-datatypes ((ListLongMap!11589 0))(
  ( (ListLongMap!11590 (toList!5810 List!18704)) )
))
(declare-fun lt!416007 () ListLongMap!11589)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!416006 () V!31231)

(declare-fun apply!663 (ListLongMap!11589 (_ BitVec 64)) V!31231)

(assert (=> b!925310 (= (apply!663 lt!416007 k0!1099) lt!416006)))

(declare-fun lt!416008 () (_ BitVec 64))

(declare-fun lt!416017 () Unit!31213)

(declare-fun lt!416010 () V!31231)

(declare-fun lt!416018 () ListLongMap!11589)

(declare-fun addApplyDifferent!365 (ListLongMap!11589 (_ BitVec 64) V!31231 (_ BitVec 64)) Unit!31213)

(assert (=> b!925310 (= lt!416017 (addApplyDifferent!365 lt!416018 lt!416008 lt!416010 k0!1099))))

(assert (=> b!925310 (not (= lt!416008 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!416004 () Unit!31213)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55419 (_ BitVec 64) (_ BitVec 32) List!18703) Unit!31213)

(assert (=> b!925310 (= lt!416004 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18700))))

(declare-fun e!519323 () Bool)

(assert (=> b!925310 e!519323))

(declare-fun c!96702 () Bool)

(assert (=> b!925310 (= c!96702 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416016 () Unit!31213)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31231)

(declare-fun minValue!1173 () V!31231)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!220 (array!55419 array!55421 (_ BitVec 32) (_ BitVec 32) V!31231 V!31231 (_ BitVec 64) (_ BitVec 32) Int) Unit!31213)

(assert (=> b!925310 (= lt!416016 (lemmaListMapContainsThenArrayContainsFrom!220 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!925310 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18700)))

(declare-fun lt!416014 () Unit!31213)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55419 (_ BitVec 32) (_ BitVec 32)) Unit!31213)

(assert (=> b!925310 (= lt!416014 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4882 (ListLongMap!11589 (_ BitVec 64)) Bool)

(assert (=> b!925310 (contains!4882 lt!416007 k0!1099)))

(declare-fun lt!416012 () tuple2!12890)

(declare-fun +!2729 (ListLongMap!11589 tuple2!12890) ListLongMap!11589)

(assert (=> b!925310 (= lt!416007 (+!2729 lt!416018 lt!416012))))

(declare-fun lt!416011 () Unit!31213)

(declare-fun addStillContains!438 (ListLongMap!11589 (_ BitVec 64) V!31231 (_ BitVec 64)) Unit!31213)

(assert (=> b!925310 (= lt!416011 (addStillContains!438 lt!416018 lt!416008 lt!416010 k0!1099))))

(declare-fun getCurrentListMap!3060 (array!55419 array!55421 (_ BitVec 32) (_ BitVec 32) V!31231 V!31231 (_ BitVec 32) Int) ListLongMap!11589)

(assert (=> b!925310 (= (getCurrentListMap!3060 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2729 (getCurrentListMap!3060 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416012))))

(assert (=> b!925310 (= lt!416012 (tuple2!12891 lt!416008 lt!416010))))

(declare-fun get!14028 (ValueCell!9368 V!31231) V!31231)

(declare-fun dynLambda!1526 (Int (_ BitVec 64)) V!31231)

(assert (=> b!925310 (= lt!416010 (get!14028 (select (arr!26651 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1526 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416015 () Unit!31213)

(declare-fun lemmaListMapRecursiveValidKeyArray!109 (array!55419 array!55421 (_ BitVec 32) (_ BitVec 32) V!31231 V!31231 (_ BitVec 32) Int) Unit!31213)

(assert (=> b!925310 (= lt!416015 (lemmaListMapRecursiveValidKeyArray!109 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!519334 () Unit!31213)

(assert (=> b!925310 (= e!519334 lt!416017)))

(declare-fun b!925311 () Bool)

(declare-fun Unit!31216 () Unit!31213)

(assert (=> b!925311 (= e!519334 Unit!31216)))

(declare-fun mapIsEmpty!31305 () Bool)

(declare-fun mapRes!31305 () Bool)

(assert (=> mapIsEmpty!31305 mapRes!31305))

(declare-fun b!925312 () Bool)

(declare-fun e!519330 () Bool)

(assert (=> b!925312 (= e!519333 (and e!519330 mapRes!31305))))

(declare-fun condMapEmpty!31305 () Bool)

(declare-fun mapDefault!31305 () ValueCell!9368)

(assert (=> b!925312 (= condMapEmpty!31305 (= (arr!26651 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9368)) mapDefault!31305)))))

(declare-fun b!925313 () Bool)

(declare-fun e!519325 () Bool)

(assert (=> b!925313 (= e!519325 false)))

(declare-fun lt!416013 () V!31231)

(declare-fun lt!416009 () ListLongMap!11589)

(assert (=> b!925313 (= lt!416013 (apply!663 lt!416009 k0!1099))))

(declare-fun mapNonEmpty!31305 () Bool)

(declare-fun tp!60015 () Bool)

(declare-fun e!519324 () Bool)

(assert (=> mapNonEmpty!31305 (= mapRes!31305 (and tp!60015 e!519324))))

(declare-fun mapKey!31305 () (_ BitVec 32))

(declare-fun mapRest!31305 () (Array (_ BitVec 32) ValueCell!9368))

(declare-fun mapValue!31305 () ValueCell!9368)

(assert (=> mapNonEmpty!31305 (= (arr!26651 _values!1231) (store mapRest!31305 mapKey!31305 mapValue!31305))))

(declare-fun b!925314 () Bool)

(declare-fun e!519327 () Bool)

(assert (=> b!925314 (= e!519327 e!519325)))

(declare-fun res!623454 () Bool)

(assert (=> b!925314 (=> (not res!623454) (not e!519325))))

(assert (=> b!925314 (= res!623454 (contains!4882 lt!416009 k0!1099))))

(assert (=> b!925314 (= lt!416009 (getCurrentListMap!3060 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925315 () Bool)

(assert (=> b!925315 (= e!519323 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925316 () Bool)

(assert (=> b!925316 (= e!519330 tp_is_empty!19699)))

(declare-fun b!925317 () Bool)

(assert (=> b!925317 (= e!519324 tp_is_empty!19699)))

(declare-fun b!925318 () Bool)

(declare-fun res!623456 () Bool)

(assert (=> b!925318 (=> (not res!623456) (not e!519331))))

(assert (=> b!925318 (= res!623456 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27110 _keys!1487))))))

(declare-fun b!925319 () Bool)

(declare-fun res!623458 () Bool)

(assert (=> b!925319 (=> (not res!623458) (not e!519331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55419 (_ BitVec 32)) Bool)

(assert (=> b!925319 (= res!623458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925320 () Bool)

(assert (=> b!925320 (= e!519329 e!519334)))

(assert (=> b!925320 (= lt!416008 (select (arr!26650 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96700 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925320 (= c!96700 (validKeyInArray!0 lt!416008))))

(declare-fun b!925321 () Bool)

(declare-fun e!519328 () Bool)

(assert (=> b!925321 (= e!519331 e!519328)))

(declare-fun res!623459 () Bool)

(assert (=> b!925321 (=> (not res!623459) (not e!519328))))

(assert (=> b!925321 (= res!623459 (contains!4882 lt!416018 k0!1099))))

(assert (=> b!925321 (= lt!416018 (getCurrentListMap!3060 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925322 () Bool)

(declare-fun e!519326 () Bool)

(assert (=> b!925322 (= e!519326 e!519327)))

(declare-fun res!623452 () Bool)

(assert (=> b!925322 (=> (not res!623452) (not e!519327))))

(assert (=> b!925322 (= res!623452 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27110 _keys!1487)))))

(declare-fun lt!416005 () Unit!31213)

(assert (=> b!925322 (= lt!416005 e!519329)))

(declare-fun c!96701 () Bool)

(assert (=> b!925322 (= c!96701 (validKeyInArray!0 k0!1099))))

(declare-fun b!925323 () Bool)

(declare-fun arrayContainsKey!0 (array!55419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925323 (= e!519323 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!925324 () Bool)

(declare-fun res!623460 () Bool)

(assert (=> b!925324 (=> (not res!623460) (not e!519331))))

(assert (=> b!925324 (= res!623460 (and (= (size!27111 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27110 _keys!1487) (size!27111 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925325 () Bool)

(assert (=> b!925325 (= e!519328 e!519326)))

(declare-fun res!623455 () Bool)

(assert (=> b!925325 (=> (not res!623455) (not e!519326))))

(declare-fun v!791 () V!31231)

(assert (=> b!925325 (= res!623455 (and (= lt!416006 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925325 (= lt!416006 (apply!663 lt!416018 k0!1099))))

(assert (= (and start!79146 res!623453) b!925324))

(assert (= (and b!925324 res!623460) b!925319))

(assert (= (and b!925319 res!623458) b!925308))

(assert (= (and b!925308 res!623457) b!925318))

(assert (= (and b!925318 res!623456) b!925321))

(assert (= (and b!925321 res!623459) b!925325))

(assert (= (and b!925325 res!623455) b!925322))

(assert (= (and b!925322 c!96701) b!925320))

(assert (= (and b!925322 (not c!96701)) b!925309))

(assert (= (and b!925320 c!96700) b!925310))

(assert (= (and b!925320 (not c!96700)) b!925311))

(assert (= (and b!925310 c!96702) b!925323))

(assert (= (and b!925310 (not c!96702)) b!925315))

(assert (= (and b!925322 res!623452) b!925314))

(assert (= (and b!925314 res!623454) b!925313))

(assert (= (and b!925312 condMapEmpty!31305) mapIsEmpty!31305))

(assert (= (and b!925312 (not condMapEmpty!31305)) mapNonEmpty!31305))

(get-info :version)

(assert (= (and mapNonEmpty!31305 ((_ is ValueCellFull!9368) mapValue!31305)) b!925317))

(assert (= (and b!925312 ((_ is ValueCellFull!9368) mapDefault!31305)) b!925316))

(assert (= start!79146 b!925312))

(declare-fun b_lambda!13707 () Bool)

(assert (=> (not b_lambda!13707) (not b!925310)))

(declare-fun t!26615 () Bool)

(declare-fun tb!5763 () Bool)

(assert (=> (and start!79146 (= defaultEntry!1235 defaultEntry!1235) t!26615) tb!5763))

(declare-fun result!11357 () Bool)

(assert (=> tb!5763 (= result!11357 tp_is_empty!19699)))

(assert (=> b!925310 t!26615))

(declare-fun b_and!28131 () Bool)

(assert (= b_and!28129 (and (=> t!26615 result!11357) b_and!28131)))

(declare-fun m!860005 () Bool)

(assert (=> b!925325 m!860005))

(declare-fun m!860007 () Bool)

(assert (=> b!925323 m!860007))

(declare-fun m!860009 () Bool)

(assert (=> b!925319 m!860009))

(declare-fun m!860011 () Bool)

(assert (=> b!925310 m!860011))

(declare-fun m!860013 () Bool)

(assert (=> b!925310 m!860013))

(declare-fun m!860015 () Bool)

(assert (=> b!925310 m!860015))

(declare-fun m!860017 () Bool)

(assert (=> b!925310 m!860017))

(assert (=> b!925310 m!860015))

(declare-fun m!860019 () Bool)

(assert (=> b!925310 m!860019))

(declare-fun m!860021 () Bool)

(assert (=> b!925310 m!860021))

(declare-fun m!860023 () Bool)

(assert (=> b!925310 m!860023))

(declare-fun m!860025 () Bool)

(assert (=> b!925310 m!860025))

(declare-fun m!860027 () Bool)

(assert (=> b!925310 m!860027))

(declare-fun m!860029 () Bool)

(assert (=> b!925310 m!860029))

(declare-fun m!860031 () Bool)

(assert (=> b!925310 m!860031))

(declare-fun m!860033 () Bool)

(assert (=> b!925310 m!860033))

(declare-fun m!860035 () Bool)

(assert (=> b!925310 m!860035))

(assert (=> b!925310 m!860019))

(declare-fun m!860037 () Bool)

(assert (=> b!925310 m!860037))

(declare-fun m!860039 () Bool)

(assert (=> b!925310 m!860039))

(assert (=> b!925310 m!860033))

(declare-fun m!860041 () Bool)

(assert (=> b!925310 m!860041))

(declare-fun m!860043 () Bool)

(assert (=> b!925320 m!860043))

(declare-fun m!860045 () Bool)

(assert (=> b!925320 m!860045))

(declare-fun m!860047 () Bool)

(assert (=> start!79146 m!860047))

(declare-fun m!860049 () Bool)

(assert (=> start!79146 m!860049))

(declare-fun m!860051 () Bool)

(assert (=> start!79146 m!860051))

(declare-fun m!860053 () Bool)

(assert (=> b!925322 m!860053))

(declare-fun m!860055 () Bool)

(assert (=> mapNonEmpty!31305 m!860055))

(declare-fun m!860057 () Bool)

(assert (=> b!925313 m!860057))

(declare-fun m!860059 () Bool)

(assert (=> b!925321 m!860059))

(declare-fun m!860061 () Bool)

(assert (=> b!925321 m!860061))

(declare-fun m!860063 () Bool)

(assert (=> b!925308 m!860063))

(declare-fun m!860065 () Bool)

(assert (=> b!925314 m!860065))

(assert (=> b!925314 m!860023))

(check-sat (not mapNonEmpty!31305) (not b!925321) (not b!925323) (not start!79146) (not b!925313) (not b_lambda!13707) (not b!925314) (not b!925325) (not b!925308) (not b!925310) (not b!925319) tp_is_empty!19699 (not b_next!17191) (not b!925320) b_and!28131 (not b!925322))
(check-sat b_and!28131 (not b_next!17191))
