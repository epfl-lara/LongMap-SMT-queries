; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79082 () Bool)

(assert start!79082)

(declare-fun b_free!17295 () Bool)

(declare-fun b_next!17295 () Bool)

(assert (=> start!79082 (= b_free!17295 (not b_next!17295))))

(declare-fun tp!60326 () Bool)

(declare-fun b_and!28327 () Bool)

(assert (=> start!79082 (= tp!60326 b_and!28327)))

(declare-fun b!927561 () Bool)

(declare-fun e!520740 () Bool)

(declare-fun e!520735 () Bool)

(assert (=> b!927561 (= e!520740 e!520735)))

(declare-fun res!624759 () Bool)

(assert (=> b!927561 (=> (not res!624759) (not e!520735))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55566 0))(
  ( (array!55567 (arr!26728 (Array (_ BitVec 32) (_ BitVec 64))) (size!27187 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55566)

(assert (=> b!927561 (= res!624759 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27187 _keys!1487)))))

(declare-datatypes ((Unit!31374 0))(
  ( (Unit!31375) )
))
(declare-fun lt!418117 () Unit!31374)

(declare-fun e!520741 () Unit!31374)

(assert (=> b!927561 (= lt!418117 e!520741)))

(declare-fun c!96886 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927561 (= c!96886 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!31461 () Bool)

(declare-fun mapRes!31461 () Bool)

(declare-fun tp!60325 () Bool)

(declare-fun e!520747 () Bool)

(assert (=> mapNonEmpty!31461 (= mapRes!31461 (and tp!60325 e!520747))))

(declare-datatypes ((V!31369 0))(
  ( (V!31370 (val!9952 Int)) )
))
(declare-datatypes ((ValueCell!9420 0))(
  ( (ValueCellFull!9420 (v!12470 V!31369)) (EmptyCell!9420) )
))
(declare-fun mapRest!31461 () (Array (_ BitVec 32) ValueCell!9420))

(declare-fun mapKey!31461 () (_ BitVec 32))

(declare-fun mapValue!31461 () ValueCell!9420)

(declare-datatypes ((array!55568 0))(
  ( (array!55569 (arr!26729 (Array (_ BitVec 32) ValueCell!9420)) (size!27188 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55568)

(assert (=> mapNonEmpty!31461 (= (arr!26729 _values!1231) (store mapRest!31461 mapKey!31461 mapValue!31461))))

(declare-fun b!927562 () Bool)

(declare-fun tp_is_empty!19803 () Bool)

(assert (=> b!927562 (= e!520747 tp_is_empty!19803)))

(declare-fun b!927563 () Bool)

(declare-fun e!520738 () Bool)

(assert (=> b!927563 (= e!520738 (not true))))

(declare-fun e!520739 () Bool)

(assert (=> b!927563 e!520739))

(declare-fun res!624758 () Bool)

(assert (=> b!927563 (=> (not res!624758) (not e!520739))))

(declare-datatypes ((tuple2!12992 0))(
  ( (tuple2!12993 (_1!6507 (_ BitVec 64)) (_2!6507 V!31369)) )
))
(declare-datatypes ((List!18793 0))(
  ( (Nil!18790) (Cons!18789 (h!19935 tuple2!12992) (t!26818 List!18793)) )
))
(declare-datatypes ((ListLongMap!11689 0))(
  ( (ListLongMap!11690 (toList!5860 List!18793)) )
))
(declare-fun lt!418108 () ListLongMap!11689)

(declare-fun contains!4918 (ListLongMap!11689 (_ BitVec 64)) Bool)

(assert (=> b!927563 (= res!624758 (contains!4918 lt!418108 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31369)

(declare-fun minValue!1173 () V!31369)

(declare-fun getCurrentListMap!3109 (array!55566 array!55568 (_ BitVec 32) (_ BitVec 32) V!31369 V!31369 (_ BitVec 32) Int) ListLongMap!11689)

(assert (=> b!927563 (= lt!418108 (getCurrentListMap!3109 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun v!791 () V!31369)

(declare-fun lt!418106 () Unit!31374)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!90 (array!55566 array!55568 (_ BitVec 32) (_ BitVec 32) V!31369 V!31369 (_ BitVec 64) V!31369 (_ BitVec 32) Int) Unit!31374)

(assert (=> b!927563 (= lt!418106 (lemmaListMapApplyFromThenApplyFromZero!90 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927564 () Bool)

(declare-fun e!520744 () Bool)

(declare-fun e!520742 () Bool)

(assert (=> b!927564 (= e!520744 (and e!520742 mapRes!31461))))

(declare-fun condMapEmpty!31461 () Bool)

(declare-fun mapDefault!31461 () ValueCell!9420)

(assert (=> b!927564 (= condMapEmpty!31461 (= (arr!26729 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9420)) mapDefault!31461)))))

(declare-fun b!927565 () Bool)

(declare-fun res!624766 () Bool)

(declare-fun e!520743 () Bool)

(assert (=> b!927565 (=> (not res!624766) (not e!520743))))

(declare-datatypes ((List!18794 0))(
  ( (Nil!18791) (Cons!18790 (h!19936 (_ BitVec 64)) (t!26819 List!18794)) )
))
(declare-fun arrayNoDuplicates!0 (array!55566 (_ BitVec 32) List!18794) Bool)

(assert (=> b!927565 (= res!624766 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18791))))

(declare-fun mapIsEmpty!31461 () Bool)

(assert (=> mapIsEmpty!31461 mapRes!31461))

(declare-fun b!927566 () Bool)

(declare-fun e!520745 () Bool)

(assert (=> b!927566 (= e!520745 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!624763 () Bool)

(assert (=> start!79082 (=> (not res!624763) (not e!520743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79082 (= res!624763 (validMask!0 mask!1881))))

(assert (=> start!79082 e!520743))

(assert (=> start!79082 true))

(assert (=> start!79082 tp_is_empty!19803))

(declare-fun array_inv!20814 (array!55568) Bool)

(assert (=> start!79082 (and (array_inv!20814 _values!1231) e!520744)))

(assert (=> start!79082 tp!60326))

(declare-fun array_inv!20815 (array!55566) Bool)

(assert (=> start!79082 (array_inv!20815 _keys!1487)))

(declare-fun b!927567 () Bool)

(declare-fun e!520736 () Bool)

(assert (=> b!927567 (= e!520736 e!520740)))

(declare-fun res!624757 () Bool)

(assert (=> b!927567 (=> (not res!624757) (not e!520740))))

(declare-fun lt!418118 () V!31369)

(assert (=> b!927567 (= res!624757 (and (= lt!418118 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!418113 () ListLongMap!11689)

(declare-fun apply!690 (ListLongMap!11689 (_ BitVec 64)) V!31369)

(assert (=> b!927567 (= lt!418118 (apply!690 lt!418113 k0!1099))))

(declare-fun b!927568 () Bool)

(declare-fun lt!418107 () ListLongMap!11689)

(assert (=> b!927568 (= (apply!690 lt!418107 k0!1099) lt!418118)))

(declare-fun lt!418114 () (_ BitVec 64))

(declare-fun lt!418110 () V!31369)

(declare-fun lt!418116 () Unit!31374)

(declare-fun addApplyDifferent!405 (ListLongMap!11689 (_ BitVec 64) V!31369 (_ BitVec 64)) Unit!31374)

(assert (=> b!927568 (= lt!418116 (addApplyDifferent!405 lt!418113 lt!418114 lt!418110 k0!1099))))

(assert (=> b!927568 (not (= lt!418114 k0!1099))))

(declare-fun lt!418120 () Unit!31374)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55566 (_ BitVec 64) (_ BitVec 32) List!18794) Unit!31374)

(assert (=> b!927568 (= lt!418120 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18791))))

(assert (=> b!927568 e!520745))

(declare-fun c!96888 () Bool)

(assert (=> b!927568 (= c!96888 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418112 () Unit!31374)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!256 (array!55566 array!55568 (_ BitVec 32) (_ BitVec 32) V!31369 V!31369 (_ BitVec 64) (_ BitVec 32) Int) Unit!31374)

(assert (=> b!927568 (= lt!418112 (lemmaListMapContainsThenArrayContainsFrom!256 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!927568 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18791)))

(declare-fun lt!418115 () Unit!31374)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55566 (_ BitVec 32) (_ BitVec 32)) Unit!31374)

(assert (=> b!927568 (= lt!418115 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!927568 (contains!4918 lt!418107 k0!1099)))

(declare-fun lt!418111 () tuple2!12992)

(declare-fun +!2749 (ListLongMap!11689 tuple2!12992) ListLongMap!11689)

(assert (=> b!927568 (= lt!418107 (+!2749 lt!418113 lt!418111))))

(declare-fun lt!418109 () Unit!31374)

(declare-fun addStillContains!473 (ListLongMap!11689 (_ BitVec 64) V!31369 (_ BitVec 64)) Unit!31374)

(assert (=> b!927568 (= lt!418109 (addStillContains!473 lt!418113 lt!418114 lt!418110 k0!1099))))

(assert (=> b!927568 (= (getCurrentListMap!3109 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2749 (getCurrentListMap!3109 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418111))))

(assert (=> b!927568 (= lt!418111 (tuple2!12993 lt!418114 lt!418110))))

(declare-fun get!14070 (ValueCell!9420 V!31369) V!31369)

(declare-fun dynLambda!1538 (Int (_ BitVec 64)) V!31369)

(assert (=> b!927568 (= lt!418110 (get!14070 (select (arr!26729 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1538 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418105 () Unit!31374)

(declare-fun lemmaListMapRecursiveValidKeyArray!139 (array!55566 array!55568 (_ BitVec 32) (_ BitVec 32) V!31369 V!31369 (_ BitVec 32) Int) Unit!31374)

(assert (=> b!927568 (= lt!418105 (lemmaListMapRecursiveValidKeyArray!139 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!520737 () Unit!31374)

(assert (=> b!927568 (= e!520737 lt!418116)))

(declare-fun b!927569 () Bool)

(assert (=> b!927569 (= e!520742 tp_is_empty!19803)))

(declare-fun b!927570 () Bool)

(declare-fun res!624764 () Bool)

(assert (=> b!927570 (=> (not res!624764) (not e!520743))))

(assert (=> b!927570 (= res!624764 (and (= (size!27188 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27187 _keys!1487) (size!27188 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927571 () Bool)

(declare-fun res!624760 () Bool)

(assert (=> b!927571 (=> (not res!624760) (not e!520743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55566 (_ BitVec 32)) Bool)

(assert (=> b!927571 (= res!624760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!927572 () Bool)

(assert (=> b!927572 (= e!520743 e!520736)))

(declare-fun res!624756 () Bool)

(assert (=> b!927572 (=> (not res!624756) (not e!520736))))

(assert (=> b!927572 (= res!624756 (contains!4918 lt!418113 k0!1099))))

(assert (=> b!927572 (= lt!418113 (getCurrentListMap!3109 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927573 () Bool)

(declare-fun arrayContainsKey!0 (array!55566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927573 (= e!520745 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!927574 () Bool)

(declare-fun Unit!31376 () Unit!31374)

(assert (=> b!927574 (= e!520737 Unit!31376)))

(declare-fun b!927575 () Bool)

(declare-fun res!624762 () Bool)

(assert (=> b!927575 (=> (not res!624762) (not e!520738))))

(declare-fun lt!418119 () ListLongMap!11689)

(assert (=> b!927575 (= res!624762 (= (apply!690 lt!418119 k0!1099) v!791))))

(declare-fun b!927576 () Bool)

(assert (=> b!927576 (= e!520739 (= (apply!690 lt!418108 k0!1099) v!791))))

(declare-fun b!927577 () Bool)

(declare-fun res!624765 () Bool)

(assert (=> b!927577 (=> (not res!624765) (not e!520743))))

(assert (=> b!927577 (= res!624765 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27187 _keys!1487))))))

(declare-fun b!927578 () Bool)

(assert (=> b!927578 (= e!520735 e!520738)))

(declare-fun res!624761 () Bool)

(assert (=> b!927578 (=> (not res!624761) (not e!520738))))

(assert (=> b!927578 (= res!624761 (contains!4918 lt!418119 k0!1099))))

(assert (=> b!927578 (= lt!418119 (getCurrentListMap!3109 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927579 () Bool)

(declare-fun Unit!31377 () Unit!31374)

(assert (=> b!927579 (= e!520741 Unit!31377)))

(declare-fun b!927580 () Bool)

(assert (=> b!927580 (= e!520741 e!520737)))

(assert (=> b!927580 (= lt!418114 (select (arr!26728 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96887 () Bool)

(assert (=> b!927580 (= c!96887 (validKeyInArray!0 lt!418114))))

(assert (= (and start!79082 res!624763) b!927570))

(assert (= (and b!927570 res!624764) b!927571))

(assert (= (and b!927571 res!624760) b!927565))

(assert (= (and b!927565 res!624766) b!927577))

(assert (= (and b!927577 res!624765) b!927572))

(assert (= (and b!927572 res!624756) b!927567))

(assert (= (and b!927567 res!624757) b!927561))

(assert (= (and b!927561 c!96886) b!927580))

(assert (= (and b!927561 (not c!96886)) b!927579))

(assert (= (and b!927580 c!96887) b!927568))

(assert (= (and b!927580 (not c!96887)) b!927574))

(assert (= (and b!927568 c!96888) b!927573))

(assert (= (and b!927568 (not c!96888)) b!927566))

(assert (= (and b!927561 res!624759) b!927578))

(assert (= (and b!927578 res!624761) b!927575))

(assert (= (and b!927575 res!624762) b!927563))

(assert (= (and b!927563 res!624758) b!927576))

(assert (= (and b!927564 condMapEmpty!31461) mapIsEmpty!31461))

(assert (= (and b!927564 (not condMapEmpty!31461)) mapNonEmpty!31461))

(get-info :version)

(assert (= (and mapNonEmpty!31461 ((_ is ValueCellFull!9420) mapValue!31461)) b!927562))

(assert (= (and b!927564 ((_ is ValueCellFull!9420) mapDefault!31461)) b!927569))

(assert (= start!79082 b!927564))

(declare-fun b_lambda!13797 () Bool)

(assert (=> (not b_lambda!13797) (not b!927568)))

(declare-fun t!26817 () Bool)

(declare-fun tb!5875 () Bool)

(assert (=> (and start!79082 (= defaultEntry!1235 defaultEntry!1235) t!26817) tb!5875))

(declare-fun result!11573 () Bool)

(assert (=> tb!5875 (= result!11573 tp_is_empty!19803)))

(assert (=> b!927568 t!26817))

(declare-fun b_and!28329 () Bool)

(assert (= b_and!28327 (and (=> t!26817 result!11573) b_and!28329)))

(declare-fun m!862255 () Bool)

(assert (=> b!927580 m!862255))

(declare-fun m!862257 () Bool)

(assert (=> b!927580 m!862257))

(declare-fun m!862259 () Bool)

(assert (=> b!927572 m!862259))

(declare-fun m!862261 () Bool)

(assert (=> b!927572 m!862261))

(declare-fun m!862263 () Bool)

(assert (=> b!927576 m!862263))

(declare-fun m!862265 () Bool)

(assert (=> b!927567 m!862265))

(declare-fun m!862267 () Bool)

(assert (=> b!927568 m!862267))

(declare-fun m!862269 () Bool)

(assert (=> b!927568 m!862269))

(declare-fun m!862271 () Bool)

(assert (=> b!927568 m!862271))

(declare-fun m!862273 () Bool)

(assert (=> b!927568 m!862273))

(declare-fun m!862275 () Bool)

(assert (=> b!927568 m!862275))

(declare-fun m!862277 () Bool)

(assert (=> b!927568 m!862277))

(declare-fun m!862279 () Bool)

(assert (=> b!927568 m!862279))

(assert (=> b!927568 m!862277))

(assert (=> b!927568 m!862279))

(declare-fun m!862281 () Bool)

(assert (=> b!927568 m!862281))

(declare-fun m!862283 () Bool)

(assert (=> b!927568 m!862283))

(declare-fun m!862285 () Bool)

(assert (=> b!927568 m!862285))

(declare-fun m!862287 () Bool)

(assert (=> b!927568 m!862287))

(declare-fun m!862289 () Bool)

(assert (=> b!927568 m!862289))

(declare-fun m!862291 () Bool)

(assert (=> b!927568 m!862291))

(declare-fun m!862293 () Bool)

(assert (=> b!927568 m!862293))

(declare-fun m!862295 () Bool)

(assert (=> b!927568 m!862295))

(assert (=> b!927568 m!862271))

(declare-fun m!862297 () Bool)

(assert (=> b!927568 m!862297))

(declare-fun m!862299 () Bool)

(assert (=> b!927561 m!862299))

(declare-fun m!862301 () Bool)

(assert (=> b!927575 m!862301))

(declare-fun m!862303 () Bool)

(assert (=> mapNonEmpty!31461 m!862303))

(declare-fun m!862305 () Bool)

(assert (=> b!927565 m!862305))

(declare-fun m!862307 () Bool)

(assert (=> start!79082 m!862307))

(declare-fun m!862309 () Bool)

(assert (=> start!79082 m!862309))

(declare-fun m!862311 () Bool)

(assert (=> start!79082 m!862311))

(declare-fun m!862313 () Bool)

(assert (=> b!927578 m!862313))

(assert (=> b!927578 m!862283))

(declare-fun m!862315 () Bool)

(assert (=> b!927573 m!862315))

(declare-fun m!862317 () Bool)

(assert (=> b!927571 m!862317))

(declare-fun m!862319 () Bool)

(assert (=> b!927563 m!862319))

(declare-fun m!862321 () Bool)

(assert (=> b!927563 m!862321))

(declare-fun m!862323 () Bool)

(assert (=> b!927563 m!862323))

(check-sat tp_is_empty!19803 (not b!927568) (not b!927576) (not b!927572) (not b_lambda!13797) (not mapNonEmpty!31461) b_and!28329 (not b!927571) (not b!927573) (not b!927580) (not b!927578) (not b!927575) (not b!927565) (not start!79082) (not b!927567) (not b!927563) (not b!927561) (not b_next!17295))
(check-sat b_and!28329 (not b_next!17295))
