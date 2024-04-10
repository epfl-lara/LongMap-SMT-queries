; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79660 () Bool)

(assert start!79660)

(declare-fun b_free!17709 () Bool)

(declare-fun b_next!17709 () Bool)

(assert (=> start!79660 (= b_free!17709 (not b_next!17709))))

(declare-fun tp!61582 () Bool)

(declare-fun b_and!29009 () Bool)

(assert (=> start!79660 (= tp!61582 b_and!29009)))

(declare-fun b!936688 () Bool)

(declare-fun res!630637 () Bool)

(declare-fun e!525957 () Bool)

(assert (=> b!936688 (=> (not res!630637) (not e!525957))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56374 0))(
  ( (array!56375 (arr!27127 (Array (_ BitVec 32) (_ BitVec 64))) (size!27586 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56374)

(assert (=> b!936688 (= res!630637 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27586 _keys!1487))))))

(declare-fun b!936689 () Bool)

(declare-fun e!525963 () Bool)

(declare-fun e!525960 () Bool)

(assert (=> b!936689 (= e!525963 e!525960)))

(declare-fun res!630639 () Bool)

(assert (=> b!936689 (=> (not res!630639) (not e!525960))))

(declare-datatypes ((V!31921 0))(
  ( (V!31922 (val!10159 Int)) )
))
(declare-fun v!791 () V!31921)

(declare-fun lt!422417 () V!31921)

(assert (=> b!936689 (= res!630639 (and (= lt!422417 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!13342 0))(
  ( (tuple2!13343 (_1!6682 (_ BitVec 64)) (_2!6682 V!31921)) )
))
(declare-datatypes ((List!19121 0))(
  ( (Nil!19118) (Cons!19117 (h!20263 tuple2!13342) (t!27374 List!19121)) )
))
(declare-datatypes ((ListLongMap!12039 0))(
  ( (ListLongMap!12040 (toList!6035 List!19121)) )
))
(declare-fun lt!422428 () ListLongMap!12039)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!837 (ListLongMap!12039 (_ BitVec 64)) V!31921)

(assert (=> b!936689 (= lt!422417 (apply!837 lt!422428 k0!1099))))

(declare-fun b!936691 () Bool)

(declare-fun res!630642 () Bool)

(assert (=> b!936691 (=> (not res!630642) (not e!525957))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9627 0))(
  ( (ValueCellFull!9627 (v!12684 V!31921)) (EmptyCell!9627) )
))
(declare-datatypes ((array!56376 0))(
  ( (array!56377 (arr!27128 (Array (_ BitVec 32) ValueCell!9627)) (size!27587 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56376)

(assert (=> b!936691 (= res!630642 (and (= (size!27587 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27586 _keys!1487) (size!27587 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936692 () Bool)

(declare-datatypes ((Unit!31602 0))(
  ( (Unit!31603) )
))
(declare-fun e!525959 () Unit!31602)

(declare-fun Unit!31604 () Unit!31602)

(assert (=> b!936692 (= e!525959 Unit!31604)))

(declare-fun b!936693 () Bool)

(declare-fun res!630640 () Bool)

(assert (=> b!936693 (=> (not res!630640) (not e!525957))))

(declare-datatypes ((List!19122 0))(
  ( (Nil!19119) (Cons!19118 (h!20264 (_ BitVec 64)) (t!27375 List!19122)) )
))
(declare-fun arrayNoDuplicates!0 (array!56374 (_ BitVec 32) List!19122) Bool)

(assert (=> b!936693 (= res!630640 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19119))))

(declare-fun mapIsEmpty!32097 () Bool)

(declare-fun mapRes!32097 () Bool)

(assert (=> mapIsEmpty!32097 mapRes!32097))

(declare-fun b!936694 () Bool)

(declare-fun e!525961 () Bool)

(declare-fun tp_is_empty!20217 () Bool)

(assert (=> b!936694 (= e!525961 tp_is_empty!20217)))

(declare-fun b!936695 () Bool)

(declare-fun e!525962 () Bool)

(assert (=> b!936695 (= e!525962 tp_is_empty!20217)))

(declare-fun b!936696 () Bool)

(assert (=> b!936696 (= e!525957 e!525963)))

(declare-fun res!630638 () Bool)

(assert (=> b!936696 (=> (not res!630638) (not e!525963))))

(declare-fun contains!5095 (ListLongMap!12039 (_ BitVec 64)) Bool)

(assert (=> b!936696 (= res!630638 (contains!5095 lt!422428 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31921)

(declare-fun minValue!1173 () V!31921)

(declare-fun getCurrentListMap!3271 (array!56374 array!56376 (_ BitVec 32) (_ BitVec 32) V!31921 V!31921 (_ BitVec 32) Int) ListLongMap!12039)

(assert (=> b!936696 (= lt!422428 (getCurrentListMap!3271 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun e!525964 () Bool)

(declare-fun b!936690 () Bool)

(declare-fun arrayContainsKey!0 (array!56374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936690 (= e!525964 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun res!630641 () Bool)

(assert (=> start!79660 (=> (not res!630641) (not e!525957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79660 (= res!630641 (validMask!0 mask!1881))))

(assert (=> start!79660 e!525957))

(assert (=> start!79660 true))

(assert (=> start!79660 tp_is_empty!20217))

(declare-fun e!525966 () Bool)

(declare-fun array_inv!21106 (array!56376) Bool)

(assert (=> start!79660 (and (array_inv!21106 _values!1231) e!525966)))

(assert (=> start!79660 tp!61582))

(declare-fun array_inv!21107 (array!56374) Bool)

(assert (=> start!79660 (array_inv!21107 _keys!1487)))

(declare-fun b!936697 () Bool)

(assert (=> b!936697 (= e!525966 (and e!525961 mapRes!32097))))

(declare-fun condMapEmpty!32097 () Bool)

(declare-fun mapDefault!32097 () ValueCell!9627)

(assert (=> b!936697 (= condMapEmpty!32097 (= (arr!27128 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9627)) mapDefault!32097)))))

(declare-fun b!936698 () Bool)

(declare-fun res!630643 () Bool)

(assert (=> b!936698 (=> (not res!630643) (not e!525957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56374 (_ BitVec 32)) Bool)

(assert (=> b!936698 (= res!630643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936699 () Bool)

(declare-fun lt!422425 () ListLongMap!12039)

(assert (=> b!936699 (= (apply!837 lt!422425 k0!1099) lt!422417)))

(declare-fun lt!422422 () (_ BitVec 64))

(declare-fun lt!422420 () V!31921)

(declare-fun lt!422426 () Unit!31602)

(declare-fun addApplyDifferent!425 (ListLongMap!12039 (_ BitVec 64) V!31921 (_ BitVec 64)) Unit!31602)

(assert (=> b!936699 (= lt!422426 (addApplyDifferent!425 lt!422428 lt!422422 lt!422420 k0!1099))))

(assert (=> b!936699 (not (= lt!422422 k0!1099))))

(declare-fun lt!422421 () Unit!31602)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56374 (_ BitVec 64) (_ BitVec 32) List!19122) Unit!31602)

(assert (=> b!936699 (= lt!422421 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19119))))

(assert (=> b!936699 e!525964))

(declare-fun c!97442 () Bool)

(assert (=> b!936699 (= c!97442 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422419 () Unit!31602)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!298 (array!56374 array!56376 (_ BitVec 32) (_ BitVec 32) V!31921 V!31921 (_ BitVec 64) (_ BitVec 32) Int) Unit!31602)

(assert (=> b!936699 (= lt!422419 (lemmaListMapContainsThenArrayContainsFrom!298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!936699 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19119)))

(declare-fun lt!422429 () Unit!31602)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56374 (_ BitVec 32) (_ BitVec 32)) Unit!31602)

(assert (=> b!936699 (= lt!422429 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!936699 (contains!5095 lt!422425 k0!1099)))

(declare-fun lt!422427 () tuple2!13342)

(declare-fun +!2826 (ListLongMap!12039 tuple2!13342) ListLongMap!12039)

(assert (=> b!936699 (= lt!422425 (+!2826 lt!422428 lt!422427))))

(declare-fun lt!422424 () Unit!31602)

(declare-fun addStillContains!545 (ListLongMap!12039 (_ BitVec 64) V!31921 (_ BitVec 64)) Unit!31602)

(assert (=> b!936699 (= lt!422424 (addStillContains!545 lt!422428 lt!422422 lt!422420 k0!1099))))

(assert (=> b!936699 (= (getCurrentListMap!3271 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2826 (getCurrentListMap!3271 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422427))))

(assert (=> b!936699 (= lt!422427 (tuple2!13343 lt!422422 lt!422420))))

(declare-fun get!14300 (ValueCell!9627 V!31921) V!31921)

(declare-fun dynLambda!1615 (Int (_ BitVec 64)) V!31921)

(assert (=> b!936699 (= lt!422420 (get!14300 (select (arr!27128 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1615 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422423 () Unit!31602)

(declare-fun lemmaListMapRecursiveValidKeyArray!216 (array!56374 array!56376 (_ BitVec 32) (_ BitVec 32) V!31921 V!31921 (_ BitVec 32) Int) Unit!31602)

(assert (=> b!936699 (= lt!422423 (lemmaListMapRecursiveValidKeyArray!216 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!936699 (= e!525959 lt!422426)))

(declare-fun mapNonEmpty!32097 () Bool)

(declare-fun tp!61583 () Bool)

(assert (=> mapNonEmpty!32097 (= mapRes!32097 (and tp!61583 e!525962))))

(declare-fun mapKey!32097 () (_ BitVec 32))

(declare-fun mapRest!32097 () (Array (_ BitVec 32) ValueCell!9627))

(declare-fun mapValue!32097 () ValueCell!9627)

(assert (=> mapNonEmpty!32097 (= (arr!27128 _values!1231) (store mapRest!32097 mapKey!32097 mapValue!32097))))

(declare-fun b!936700 () Bool)

(assert (=> b!936700 (= e!525960 false)))

(declare-fun lt!422418 () Unit!31602)

(declare-fun e!525965 () Unit!31602)

(assert (=> b!936700 (= lt!422418 e!525965)))

(declare-fun c!97441 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936700 (= c!97441 (validKeyInArray!0 k0!1099))))

(declare-fun b!936701 () Bool)

(assert (=> b!936701 (= e!525964 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936702 () Bool)

(assert (=> b!936702 (= e!525965 e!525959)))

(assert (=> b!936702 (= lt!422422 (select (arr!27127 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97443 () Bool)

(assert (=> b!936702 (= c!97443 (validKeyInArray!0 lt!422422))))

(declare-fun b!936703 () Bool)

(declare-fun Unit!31605 () Unit!31602)

(assert (=> b!936703 (= e!525965 Unit!31605)))

(assert (= (and start!79660 res!630641) b!936691))

(assert (= (and b!936691 res!630642) b!936698))

(assert (= (and b!936698 res!630643) b!936693))

(assert (= (and b!936693 res!630640) b!936688))

(assert (= (and b!936688 res!630637) b!936696))

(assert (= (and b!936696 res!630638) b!936689))

(assert (= (and b!936689 res!630639) b!936700))

(assert (= (and b!936700 c!97441) b!936702))

(assert (= (and b!936700 (not c!97441)) b!936703))

(assert (= (and b!936702 c!97443) b!936699))

(assert (= (and b!936702 (not c!97443)) b!936692))

(assert (= (and b!936699 c!97442) b!936690))

(assert (= (and b!936699 (not c!97442)) b!936701))

(assert (= (and b!936697 condMapEmpty!32097) mapIsEmpty!32097))

(assert (= (and b!936697 (not condMapEmpty!32097)) mapNonEmpty!32097))

(get-info :version)

(assert (= (and mapNonEmpty!32097 ((_ is ValueCellFull!9627) mapValue!32097)) b!936695))

(assert (= (and b!936697 ((_ is ValueCellFull!9627) mapDefault!32097)) b!936694))

(assert (= start!79660 b!936697))

(declare-fun b_lambda!14115 () Bool)

(assert (=> (not b_lambda!14115) (not b!936699)))

(declare-fun t!27373 () Bool)

(declare-fun tb!6103 () Bool)

(assert (=> (and start!79660 (= defaultEntry!1235 defaultEntry!1235) t!27373) tb!6103))

(declare-fun result!12039 () Bool)

(assert (=> tb!6103 (= result!12039 tp_is_empty!20217)))

(assert (=> b!936699 t!27373))

(declare-fun b_and!29011 () Bool)

(assert (= b_and!29009 (and (=> t!27373 result!12039) b_and!29011)))

(declare-fun m!871331 () Bool)

(assert (=> b!936696 m!871331))

(declare-fun m!871333 () Bool)

(assert (=> b!936696 m!871333))

(declare-fun m!871335 () Bool)

(assert (=> b!936689 m!871335))

(declare-fun m!871337 () Bool)

(assert (=> mapNonEmpty!32097 m!871337))

(declare-fun m!871339 () Bool)

(assert (=> start!79660 m!871339))

(declare-fun m!871341 () Bool)

(assert (=> start!79660 m!871341))

(declare-fun m!871343 () Bool)

(assert (=> start!79660 m!871343))

(declare-fun m!871345 () Bool)

(assert (=> b!936700 m!871345))

(declare-fun m!871347 () Bool)

(assert (=> b!936690 m!871347))

(declare-fun m!871349 () Bool)

(assert (=> b!936699 m!871349))

(declare-fun m!871351 () Bool)

(assert (=> b!936699 m!871351))

(declare-fun m!871353 () Bool)

(assert (=> b!936699 m!871353))

(declare-fun m!871355 () Bool)

(assert (=> b!936699 m!871355))

(declare-fun m!871357 () Bool)

(assert (=> b!936699 m!871357))

(declare-fun m!871359 () Bool)

(assert (=> b!936699 m!871359))

(declare-fun m!871361 () Bool)

(assert (=> b!936699 m!871361))

(declare-fun m!871363 () Bool)

(assert (=> b!936699 m!871363))

(declare-fun m!871365 () Bool)

(assert (=> b!936699 m!871365))

(declare-fun m!871367 () Bool)

(assert (=> b!936699 m!871367))

(declare-fun m!871369 () Bool)

(assert (=> b!936699 m!871369))

(declare-fun m!871371 () Bool)

(assert (=> b!936699 m!871371))

(declare-fun m!871373 () Bool)

(assert (=> b!936699 m!871373))

(declare-fun m!871375 () Bool)

(assert (=> b!936699 m!871375))

(assert (=> b!936699 m!871353))

(assert (=> b!936699 m!871371))

(declare-fun m!871377 () Bool)

(assert (=> b!936699 m!871377))

(assert (=> b!936699 m!871355))

(declare-fun m!871379 () Bool)

(assert (=> b!936699 m!871379))

(declare-fun m!871381 () Bool)

(assert (=> b!936698 m!871381))

(declare-fun m!871383 () Bool)

(assert (=> b!936702 m!871383))

(declare-fun m!871385 () Bool)

(assert (=> b!936702 m!871385))

(declare-fun m!871387 () Bool)

(assert (=> b!936693 m!871387))

(check-sat b_and!29011 (not b!936702) (not b!936699) (not b!936700) (not start!79660) (not b_lambda!14115) (not b_next!17709) (not b!936690) (not b!936696) (not b!936698) (not b!936693) (not mapNonEmpty!32097) (not b!936689) tp_is_empty!20217)
(check-sat b_and!29011 (not b_next!17709))
