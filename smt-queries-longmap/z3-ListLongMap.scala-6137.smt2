; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78912 () Bool)

(assert start!78912)

(declare-fun b_free!17143 () Bool)

(declare-fun b_next!17143 () Bool)

(assert (=> start!78912 (= b_free!17143 (not b_next!17143))))

(declare-fun tp!59871 () Bool)

(declare-fun b_and!27997 () Bool)

(assert (=> start!78912 (= tp!59871 b_and!27997)))

(declare-fun b!922843 () Bool)

(declare-fun res!622351 () Bool)

(declare-fun e!517764 () Bool)

(assert (=> b!922843 (=> (not res!622351) (not e!517764))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922843 (= res!622351 (validKeyInArray!0 k0!1099))))

(declare-fun b!922844 () Bool)

(declare-fun res!622348 () Bool)

(declare-fun e!517760 () Bool)

(assert (=> b!922844 (=> (not res!622348) (not e!517760))))

(declare-datatypes ((array!55253 0))(
  ( (array!55254 (arr!26572 (Array (_ BitVec 32) (_ BitVec 64))) (size!27033 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55253)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31167 0))(
  ( (V!31168 (val!9876 Int)) )
))
(declare-datatypes ((ValueCell!9344 0))(
  ( (ValueCellFull!9344 (v!12393 V!31167)) (EmptyCell!9344) )
))
(declare-datatypes ((array!55255 0))(
  ( (array!55256 (arr!26573 (Array (_ BitVec 32) ValueCell!9344)) (size!27034 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55255)

(assert (=> b!922844 (= res!622348 (and (= (size!27034 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27033 _keys!1487) (size!27034 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922845 () Bool)

(declare-fun e!517758 () Bool)

(declare-fun tp_is_empty!19651 () Bool)

(assert (=> b!922845 (= e!517758 tp_is_empty!19651)))

(declare-fun b!922846 () Bool)

(declare-fun e!517759 () Bool)

(assert (=> b!922846 (= e!517759 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922847 () Bool)

(declare-fun e!517761 () Bool)

(assert (=> b!922847 (= e!517761 tp_is_empty!19651)))

(declare-fun b!922848 () Bool)

(declare-fun res!622346 () Bool)

(assert (=> b!922848 (=> (not res!622346) (not e!517760))))

(declare-datatypes ((List!18701 0))(
  ( (Nil!18698) (Cons!18697 (h!19843 (_ BitVec 64)) (t!26565 List!18701)) )
))
(declare-fun arrayNoDuplicates!0 (array!55253 (_ BitVec 32) List!18701) Bool)

(assert (=> b!922848 (= res!622346 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18698))))

(declare-fun b!922849 () Bool)

(declare-fun res!622343 () Bool)

(assert (=> b!922849 (=> (not res!622343) (not e!517760))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922849 (= res!622343 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27033 _keys!1487))))))

(declare-fun b!922850 () Bool)

(declare-fun e!517757 () Bool)

(assert (=> b!922850 (= e!517764 e!517757)))

(declare-fun res!622344 () Bool)

(assert (=> b!922850 (=> (not res!622344) (not e!517757))))

(declare-fun lt!414373 () (_ BitVec 64))

(assert (=> b!922850 (= res!622344 (validKeyInArray!0 lt!414373))))

(assert (=> b!922850 (= lt!414373 (select (arr!26572 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922851 () Bool)

(declare-fun res!622350 () Bool)

(assert (=> b!922851 (=> (not res!622350) (not e!517760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55253 (_ BitVec 32)) Bool)

(assert (=> b!922851 (= res!622350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922852 () Bool)

(assert (=> b!922852 (= e!517757 (not true))))

(assert (=> b!922852 (not (= lt!414373 k0!1099))))

(declare-datatypes ((Unit!31056 0))(
  ( (Unit!31057) )
))
(declare-fun lt!414374 () Unit!31056)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55253 (_ BitVec 64) (_ BitVec 32) List!18701) Unit!31056)

(assert (=> b!922852 (= lt!414374 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18698))))

(assert (=> b!922852 e!517759))

(declare-fun c!96151 () Bool)

(assert (=> b!922852 (= c!96151 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!414370 () Unit!31056)

(declare-fun zeroValue!1173 () V!31167)

(declare-fun minValue!1173 () V!31167)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!210 (array!55253 array!55255 (_ BitVec 32) (_ BitVec 32) V!31167 V!31167 (_ BitVec 64) (_ BitVec 32) Int) Unit!31056)

(assert (=> b!922852 (= lt!414370 (lemmaListMapContainsThenArrayContainsFrom!210 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!922852 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18698)))

(declare-fun lt!414376 () Unit!31056)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55253 (_ BitVec 32) (_ BitVec 32)) Unit!31056)

(assert (=> b!922852 (= lt!414376 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12920 0))(
  ( (tuple2!12921 (_1!6471 (_ BitVec 64)) (_2!6471 V!31167)) )
))
(declare-datatypes ((List!18702 0))(
  ( (Nil!18699) (Cons!18698 (h!19844 tuple2!12920) (t!26566 List!18702)) )
))
(declare-datatypes ((ListLongMap!11607 0))(
  ( (ListLongMap!11608 (toList!5819 List!18702)) )
))
(declare-fun lt!414369 () ListLongMap!11607)

(declare-fun lt!414372 () tuple2!12920)

(declare-fun contains!4833 (ListLongMap!11607 (_ BitVec 64)) Bool)

(declare-fun +!2722 (ListLongMap!11607 tuple2!12920) ListLongMap!11607)

(assert (=> b!922852 (contains!4833 (+!2722 lt!414369 lt!414372) k0!1099)))

(declare-fun lt!414375 () Unit!31056)

(declare-fun lt!414377 () V!31167)

(declare-fun addStillContains!419 (ListLongMap!11607 (_ BitVec 64) V!31167 (_ BitVec 64)) Unit!31056)

(assert (=> b!922852 (= lt!414375 (addStillContains!419 lt!414369 lt!414373 lt!414377 k0!1099))))

(declare-fun getCurrentListMap!3007 (array!55253 array!55255 (_ BitVec 32) (_ BitVec 32) V!31167 V!31167 (_ BitVec 32) Int) ListLongMap!11607)

(assert (=> b!922852 (= (getCurrentListMap!3007 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2722 (getCurrentListMap!3007 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414372))))

(assert (=> b!922852 (= lt!414372 (tuple2!12921 lt!414373 lt!414377))))

(declare-fun get!13965 (ValueCell!9344 V!31167) V!31167)

(declare-fun dynLambda!1478 (Int (_ BitVec 64)) V!31167)

(assert (=> b!922852 (= lt!414377 (get!13965 (select (arr!26573 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1478 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414371 () Unit!31056)

(declare-fun lemmaListMapRecursiveValidKeyArray!86 (array!55253 array!55255 (_ BitVec 32) (_ BitVec 32) V!31167 V!31167 (_ BitVec 32) Int) Unit!31056)

(assert (=> b!922852 (= lt!414371 (lemmaListMapRecursiveValidKeyArray!86 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922853 () Bool)

(assert (=> b!922853 (= e!517760 e!517764)))

(declare-fun res!622352 () Bool)

(assert (=> b!922853 (=> (not res!622352) (not e!517764))))

(assert (=> b!922853 (= res!622352 (contains!4833 lt!414369 k0!1099))))

(assert (=> b!922853 (= lt!414369 (getCurrentListMap!3007 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31233 () Bool)

(declare-fun mapRes!31233 () Bool)

(assert (=> mapIsEmpty!31233 mapRes!31233))

(declare-fun b!922854 () Bool)

(declare-fun arrayContainsKey!0 (array!55253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922854 (= e!517759 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!922855 () Bool)

(declare-fun res!622347 () Bool)

(assert (=> b!922855 (=> (not res!622347) (not e!517764))))

(assert (=> b!922855 (= res!622347 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922856 () Bool)

(declare-fun res!622349 () Bool)

(assert (=> b!922856 (=> (not res!622349) (not e!517764))))

(declare-fun v!791 () V!31167)

(declare-fun apply!632 (ListLongMap!11607 (_ BitVec 64)) V!31167)

(assert (=> b!922856 (= res!622349 (= (apply!632 lt!414369 k0!1099) v!791))))

(declare-fun res!622345 () Bool)

(assert (=> start!78912 (=> (not res!622345) (not e!517760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78912 (= res!622345 (validMask!0 mask!1881))))

(assert (=> start!78912 e!517760))

(assert (=> start!78912 true))

(assert (=> start!78912 tp_is_empty!19651))

(declare-fun e!517763 () Bool)

(declare-fun array_inv!20782 (array!55255) Bool)

(assert (=> start!78912 (and (array_inv!20782 _values!1231) e!517763)))

(assert (=> start!78912 tp!59871))

(declare-fun array_inv!20783 (array!55253) Bool)

(assert (=> start!78912 (array_inv!20783 _keys!1487)))

(declare-fun b!922857 () Bool)

(assert (=> b!922857 (= e!517763 (and e!517761 mapRes!31233))))

(declare-fun condMapEmpty!31233 () Bool)

(declare-fun mapDefault!31233 () ValueCell!9344)

(assert (=> b!922857 (= condMapEmpty!31233 (= (arr!26573 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9344)) mapDefault!31233)))))

(declare-fun mapNonEmpty!31233 () Bool)

(declare-fun tp!59870 () Bool)

(assert (=> mapNonEmpty!31233 (= mapRes!31233 (and tp!59870 e!517758))))

(declare-fun mapRest!31233 () (Array (_ BitVec 32) ValueCell!9344))

(declare-fun mapKey!31233 () (_ BitVec 32))

(declare-fun mapValue!31233 () ValueCell!9344)

(assert (=> mapNonEmpty!31233 (= (arr!26573 _values!1231) (store mapRest!31233 mapKey!31233 mapValue!31233))))

(assert (= (and start!78912 res!622345) b!922844))

(assert (= (and b!922844 res!622348) b!922851))

(assert (= (and b!922851 res!622350) b!922848))

(assert (= (and b!922848 res!622346) b!922849))

(assert (= (and b!922849 res!622343) b!922853))

(assert (= (and b!922853 res!622352) b!922856))

(assert (= (and b!922856 res!622349) b!922855))

(assert (= (and b!922855 res!622347) b!922843))

(assert (= (and b!922843 res!622351) b!922850))

(assert (= (and b!922850 res!622344) b!922852))

(assert (= (and b!922852 c!96151) b!922854))

(assert (= (and b!922852 (not c!96151)) b!922846))

(assert (= (and b!922857 condMapEmpty!31233) mapIsEmpty!31233))

(assert (= (and b!922857 (not condMapEmpty!31233)) mapNonEmpty!31233))

(get-info :version)

(assert (= (and mapNonEmpty!31233 ((_ is ValueCellFull!9344) mapValue!31233)) b!922845))

(assert (= (and b!922857 ((_ is ValueCellFull!9344) mapDefault!31233)) b!922847))

(assert (= start!78912 b!922857))

(declare-fun b_lambda!13627 () Bool)

(assert (=> (not b_lambda!13627) (not b!922852)))

(declare-fun t!26564 () Bool)

(declare-fun tb!5715 () Bool)

(assert (=> (and start!78912 (= defaultEntry!1235 defaultEntry!1235) t!26564) tb!5715))

(declare-fun result!11261 () Bool)

(assert (=> tb!5715 (= result!11261 tp_is_empty!19651)))

(assert (=> b!922852 t!26564))

(declare-fun b_and!27999 () Bool)

(assert (= b_and!27997 (and (=> t!26564 result!11261) b_and!27999)))

(declare-fun m!856489 () Bool)

(assert (=> b!922850 m!856489))

(declare-fun m!856491 () Bool)

(assert (=> b!922850 m!856491))

(declare-fun m!856493 () Bool)

(assert (=> b!922843 m!856493))

(declare-fun m!856495 () Bool)

(assert (=> b!922854 m!856495))

(declare-fun m!856497 () Bool)

(assert (=> start!78912 m!856497))

(declare-fun m!856499 () Bool)

(assert (=> start!78912 m!856499))

(declare-fun m!856501 () Bool)

(assert (=> start!78912 m!856501))

(declare-fun m!856503 () Bool)

(assert (=> b!922851 m!856503))

(declare-fun m!856505 () Bool)

(assert (=> b!922853 m!856505))

(declare-fun m!856507 () Bool)

(assert (=> b!922853 m!856507))

(declare-fun m!856509 () Bool)

(assert (=> b!922848 m!856509))

(declare-fun m!856511 () Bool)

(assert (=> b!922856 m!856511))

(declare-fun m!856513 () Bool)

(assert (=> b!922852 m!856513))

(declare-fun m!856515 () Bool)

(assert (=> b!922852 m!856515))

(declare-fun m!856517 () Bool)

(assert (=> b!922852 m!856517))

(declare-fun m!856519 () Bool)

(assert (=> b!922852 m!856519))

(declare-fun m!856521 () Bool)

(assert (=> b!922852 m!856521))

(assert (=> b!922852 m!856513))

(declare-fun m!856523 () Bool)

(assert (=> b!922852 m!856523))

(assert (=> b!922852 m!856519))

(assert (=> b!922852 m!856521))

(declare-fun m!856525 () Bool)

(assert (=> b!922852 m!856525))

(declare-fun m!856527 () Bool)

(assert (=> b!922852 m!856527))

(declare-fun m!856529 () Bool)

(assert (=> b!922852 m!856529))

(declare-fun m!856531 () Bool)

(assert (=> b!922852 m!856531))

(declare-fun m!856533 () Bool)

(assert (=> b!922852 m!856533))

(declare-fun m!856535 () Bool)

(assert (=> b!922852 m!856535))

(declare-fun m!856537 () Bool)

(assert (=> b!922852 m!856537))

(assert (=> b!922852 m!856529))

(declare-fun m!856539 () Bool)

(assert (=> b!922852 m!856539))

(declare-fun m!856541 () Bool)

(assert (=> mapNonEmpty!31233 m!856541))

(check-sat tp_is_empty!19651 (not start!78912) (not b!922854) (not b!922843) (not b_next!17143) (not b!922853) (not mapNonEmpty!31233) (not b!922856) b_and!27999 (not b!922848) (not b!922850) (not b_lambda!13627) (not b!922851) (not b!922852))
(check-sat b_and!27999 (not b_next!17143))
