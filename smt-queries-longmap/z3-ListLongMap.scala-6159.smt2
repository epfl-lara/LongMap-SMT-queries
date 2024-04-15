; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79044 () Bool)

(assert start!79044)

(declare-fun b_free!17275 () Bool)

(declare-fun b_next!17275 () Bool)

(assert (=> start!79044 (= b_free!17275 (not b_next!17275))))

(declare-fun tp!60266 () Bool)

(declare-fun b_and!28261 () Bool)

(assert (=> start!79044 (= tp!60266 b_and!28261)))

(declare-fun b!926702 () Bool)

(declare-fun e!520200 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!926702 (= e!520200 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!926703 () Bool)

(declare-fun e!520203 () Bool)

(declare-fun e!520206 () Bool)

(declare-fun mapRes!31431 () Bool)

(assert (=> b!926703 (= e!520203 (and e!520206 mapRes!31431))))

(declare-fun condMapEmpty!31431 () Bool)

(declare-datatypes ((V!31343 0))(
  ( (V!31344 (val!9942 Int)) )
))
(declare-datatypes ((ValueCell!9410 0))(
  ( (ValueCellFull!9410 (v!12459 V!31343)) (EmptyCell!9410) )
))
(declare-datatypes ((array!55503 0))(
  ( (array!55504 (arr!26697 (Array (_ BitVec 32) ValueCell!9410)) (size!27158 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55503)

(declare-fun mapDefault!31431 () ValueCell!9410)

(assert (=> b!926703 (= condMapEmpty!31431 (= (arr!26697 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9410)) mapDefault!31431)))))

(declare-fun b!926704 () Bool)

(declare-fun res!624320 () Bool)

(declare-fun e!520207 () Bool)

(assert (=> b!926704 (=> (not res!624320) (not e!520207))))

(declare-datatypes ((array!55505 0))(
  ( (array!55506 (arr!26698 (Array (_ BitVec 32) (_ BitVec 64))) (size!27159 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55505)

(declare-datatypes ((List!18803 0))(
  ( (Nil!18800) (Cons!18799 (h!19945 (_ BitVec 64)) (t!26799 List!18803)) )
))
(declare-fun arrayNoDuplicates!0 (array!55505 (_ BitVec 32) List!18803) Bool)

(assert (=> b!926704 (= res!624320 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18800))))

(declare-fun b!926705 () Bool)

(declare-fun e!520208 () Bool)

(declare-fun e!520209 () Bool)

(assert (=> b!926705 (= e!520208 e!520209)))

(declare-fun res!624316 () Bool)

(assert (=> b!926705 (=> (not res!624316) (not e!520209))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!926705 (= res!624316 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27159 _keys!1487)))))

(declare-datatypes ((Unit!31251 0))(
  ( (Unit!31252) )
))
(declare-fun lt!417396 () Unit!31251)

(declare-fun e!520197 () Unit!31251)

(assert (=> b!926705 (= lt!417396 e!520197)))

(declare-fun c!96733 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926705 (= c!96733 (validKeyInArray!0 k0!1099))))

(declare-fun b!926706 () Bool)

(declare-fun arrayContainsKey!0 (array!55505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926706 (= e!520200 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!926707 () Bool)

(declare-fun e!520201 () Bool)

(declare-fun tp_is_empty!19783 () Bool)

(assert (=> b!926707 (= e!520201 tp_is_empty!19783)))

(declare-fun b!926708 () Bool)

(declare-fun res!624318 () Bool)

(declare-fun e!520198 () Bool)

(assert (=> b!926708 (=> (not res!624318) (not e!520198))))

(declare-fun v!791 () V!31343)

(declare-datatypes ((tuple2!13032 0))(
  ( (tuple2!13033 (_1!6527 (_ BitVec 64)) (_2!6527 V!31343)) )
))
(declare-datatypes ((List!18804 0))(
  ( (Nil!18801) (Cons!18800 (h!19946 tuple2!13032) (t!26800 List!18804)) )
))
(declare-datatypes ((ListLongMap!11719 0))(
  ( (ListLongMap!11720 (toList!5875 List!18804)) )
))
(declare-fun lt!417394 () ListLongMap!11719)

(declare-fun apply!686 (ListLongMap!11719 (_ BitVec 64)) V!31343)

(assert (=> b!926708 (= res!624318 (= (apply!686 lt!417394 k0!1099) v!791))))

(declare-fun b!926709 () Bool)

(assert (=> b!926709 (= e!520209 e!520198)))

(declare-fun res!624325 () Bool)

(assert (=> b!926709 (=> (not res!624325) (not e!520198))))

(declare-fun contains!4886 (ListLongMap!11719 (_ BitVec 64)) Bool)

(assert (=> b!926709 (= res!624325 (contains!4886 lt!417394 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31343)

(declare-fun minValue!1173 () V!31343)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3060 (array!55505 array!55503 (_ BitVec 32) (_ BitVec 32) V!31343 V!31343 (_ BitVec 32) Int) ListLongMap!11719)

(assert (=> b!926709 (= lt!417394 (getCurrentListMap!3060 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!624322 () Bool)

(assert (=> start!79044 (=> (not res!624322) (not e!520207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79044 (= res!624322 (validMask!0 mask!1881))))

(assert (=> start!79044 e!520207))

(assert (=> start!79044 true))

(assert (=> start!79044 tp_is_empty!19783))

(declare-fun array_inv!20874 (array!55503) Bool)

(assert (=> start!79044 (and (array_inv!20874 _values!1231) e!520203)))

(assert (=> start!79044 tp!60266))

(declare-fun array_inv!20875 (array!55505) Bool)

(assert (=> start!79044 (array_inv!20875 _keys!1487)))

(declare-fun b!926710 () Bool)

(declare-fun e!520204 () Unit!31251)

(declare-fun Unit!31253 () Unit!31251)

(assert (=> b!926710 (= e!520204 Unit!31253)))

(declare-fun mapNonEmpty!31431 () Bool)

(declare-fun tp!60267 () Bool)

(assert (=> mapNonEmpty!31431 (= mapRes!31431 (and tp!60267 e!520201))))

(declare-fun mapValue!31431 () ValueCell!9410)

(declare-fun mapKey!31431 () (_ BitVec 32))

(declare-fun mapRest!31431 () (Array (_ BitVec 32) ValueCell!9410))

(assert (=> mapNonEmpty!31431 (= (arr!26697 _values!1231) (store mapRest!31431 mapKey!31431 mapValue!31431))))

(declare-fun b!926711 () Bool)

(assert (=> b!926711 (= e!520198 (not true))))

(declare-fun e!520205 () Bool)

(assert (=> b!926711 e!520205))

(declare-fun res!624323 () Bool)

(assert (=> b!926711 (=> (not res!624323) (not e!520205))))

(declare-fun lt!417399 () ListLongMap!11719)

(assert (=> b!926711 (= res!624323 (contains!4886 lt!417399 k0!1099))))

(assert (=> b!926711 (= lt!417399 (getCurrentListMap!3060 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417395 () Unit!31251)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!88 (array!55505 array!55503 (_ BitVec 32) (_ BitVec 32) V!31343 V!31343 (_ BitVec 64) V!31343 (_ BitVec 32) Int) Unit!31251)

(assert (=> b!926711 (= lt!417395 (lemmaListMapApplyFromThenApplyFromZero!88 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926712 () Bool)

(assert (=> b!926712 (= e!520205 (= (apply!686 lt!417399 k0!1099) v!791))))

(declare-fun b!926713 () Bool)

(declare-fun lt!417398 () ListLongMap!11719)

(declare-fun lt!417389 () V!31343)

(assert (=> b!926713 (= (apply!686 lt!417398 k0!1099) lt!417389)))

(declare-fun lt!417391 () Unit!31251)

(declare-fun lt!417402 () V!31343)

(declare-fun lt!417404 () (_ BitVec 64))

(declare-fun lt!417390 () ListLongMap!11719)

(declare-fun addApplyDifferent!392 (ListLongMap!11719 (_ BitVec 64) V!31343 (_ BitVec 64)) Unit!31251)

(assert (=> b!926713 (= lt!417391 (addApplyDifferent!392 lt!417390 lt!417404 lt!417402 k0!1099))))

(assert (=> b!926713 (not (= lt!417404 k0!1099))))

(declare-fun lt!417392 () Unit!31251)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55505 (_ BitVec 64) (_ BitVec 32) List!18803) Unit!31251)

(assert (=> b!926713 (= lt!417392 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18800))))

(assert (=> b!926713 e!520200))

(declare-fun c!96732 () Bool)

(assert (=> b!926713 (= c!96732 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417400 () Unit!31251)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!252 (array!55505 array!55503 (_ BitVec 32) (_ BitVec 32) V!31343 V!31343 (_ BitVec 64) (_ BitVec 32) Int) Unit!31251)

(assert (=> b!926713 (= lt!417400 (lemmaListMapContainsThenArrayContainsFrom!252 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!926713 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18800)))

(declare-fun lt!417403 () Unit!31251)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55505 (_ BitVec 32) (_ BitVec 32)) Unit!31251)

(assert (=> b!926713 (= lt!417403 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!926713 (contains!4886 lt!417398 k0!1099)))

(declare-fun lt!417401 () tuple2!13032)

(declare-fun +!2764 (ListLongMap!11719 tuple2!13032) ListLongMap!11719)

(assert (=> b!926713 (= lt!417398 (+!2764 lt!417390 lt!417401))))

(declare-fun lt!417397 () Unit!31251)

(declare-fun addStillContains!461 (ListLongMap!11719 (_ BitVec 64) V!31343 (_ BitVec 64)) Unit!31251)

(assert (=> b!926713 (= lt!417397 (addStillContains!461 lt!417390 lt!417404 lt!417402 k0!1099))))

(assert (=> b!926713 (= (getCurrentListMap!3060 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2764 (getCurrentListMap!3060 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417401))))

(assert (=> b!926713 (= lt!417401 (tuple2!13033 lt!417404 lt!417402))))

(declare-fun get!14051 (ValueCell!9410 V!31343) V!31343)

(declare-fun dynLambda!1520 (Int (_ BitVec 64)) V!31343)

(assert (=> b!926713 (= lt!417402 (get!14051 (select (arr!26697 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1520 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417393 () Unit!31251)

(declare-fun lemmaListMapRecursiveValidKeyArray!128 (array!55505 array!55503 (_ BitVec 32) (_ BitVec 32) V!31343 V!31343 (_ BitVec 32) Int) Unit!31251)

(assert (=> b!926713 (= lt!417393 (lemmaListMapRecursiveValidKeyArray!128 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!926713 (= e!520204 lt!417391)))

(declare-fun b!926714 () Bool)

(declare-fun res!624319 () Bool)

(assert (=> b!926714 (=> (not res!624319) (not e!520207))))

(assert (=> b!926714 (= res!624319 (and (= (size!27158 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27159 _keys!1487) (size!27158 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!926715 () Bool)

(assert (=> b!926715 (= e!520206 tp_is_empty!19783)))

(declare-fun b!926716 () Bool)

(declare-fun e!520202 () Bool)

(assert (=> b!926716 (= e!520207 e!520202)))

(declare-fun res!624317 () Bool)

(assert (=> b!926716 (=> (not res!624317) (not e!520202))))

(assert (=> b!926716 (= res!624317 (contains!4886 lt!417390 k0!1099))))

(assert (=> b!926716 (= lt!417390 (getCurrentListMap!3060 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31431 () Bool)

(assert (=> mapIsEmpty!31431 mapRes!31431))

(declare-fun b!926717 () Bool)

(declare-fun res!624324 () Bool)

(assert (=> b!926717 (=> (not res!624324) (not e!520207))))

(assert (=> b!926717 (= res!624324 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27159 _keys!1487))))))

(declare-fun b!926718 () Bool)

(assert (=> b!926718 (= e!520202 e!520208)))

(declare-fun res!624326 () Bool)

(assert (=> b!926718 (=> (not res!624326) (not e!520208))))

(assert (=> b!926718 (= res!624326 (and (= lt!417389 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!926718 (= lt!417389 (apply!686 lt!417390 k0!1099))))

(declare-fun b!926719 () Bool)

(declare-fun Unit!31254 () Unit!31251)

(assert (=> b!926719 (= e!520197 Unit!31254)))

(declare-fun b!926720 () Bool)

(declare-fun res!624321 () Bool)

(assert (=> b!926720 (=> (not res!624321) (not e!520207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55505 (_ BitVec 32)) Bool)

(assert (=> b!926720 (= res!624321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926721 () Bool)

(assert (=> b!926721 (= e!520197 e!520204)))

(assert (=> b!926721 (= lt!417404 (select (arr!26698 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96731 () Bool)

(assert (=> b!926721 (= c!96731 (validKeyInArray!0 lt!417404))))

(assert (= (and start!79044 res!624322) b!926714))

(assert (= (and b!926714 res!624319) b!926720))

(assert (= (and b!926720 res!624321) b!926704))

(assert (= (and b!926704 res!624320) b!926717))

(assert (= (and b!926717 res!624324) b!926716))

(assert (= (and b!926716 res!624317) b!926718))

(assert (= (and b!926718 res!624326) b!926705))

(assert (= (and b!926705 c!96733) b!926721))

(assert (= (and b!926705 (not c!96733)) b!926719))

(assert (= (and b!926721 c!96731) b!926713))

(assert (= (and b!926721 (not c!96731)) b!926710))

(assert (= (and b!926713 c!96732) b!926706))

(assert (= (and b!926713 (not c!96732)) b!926702))

(assert (= (and b!926705 res!624316) b!926709))

(assert (= (and b!926709 res!624325) b!926708))

(assert (= (and b!926708 res!624318) b!926711))

(assert (= (and b!926711 res!624323) b!926712))

(assert (= (and b!926703 condMapEmpty!31431) mapIsEmpty!31431))

(assert (= (and b!926703 (not condMapEmpty!31431)) mapNonEmpty!31431))

(get-info :version)

(assert (= (and mapNonEmpty!31431 ((_ is ValueCellFull!9410) mapValue!31431)) b!926707))

(assert (= (and b!926703 ((_ is ValueCellFull!9410) mapDefault!31431)) b!926715))

(assert (= start!79044 b!926703))

(declare-fun b_lambda!13759 () Bool)

(assert (=> (not b_lambda!13759) (not b!926713)))

(declare-fun t!26798 () Bool)

(declare-fun tb!5847 () Bool)

(assert (=> (and start!79044 (= defaultEntry!1235 defaultEntry!1235) t!26798) tb!5847))

(declare-fun result!11525 () Bool)

(assert (=> tb!5847 (= result!11525 tp_is_empty!19783)))

(assert (=> b!926713 t!26798))

(declare-fun b_and!28263 () Bool)

(assert (= b_and!28261 (and (=> t!26798 result!11525) b_and!28263)))

(declare-fun m!860797 () Bool)

(assert (=> b!926704 m!860797))

(declare-fun m!860799 () Bool)

(assert (=> b!926720 m!860799))

(declare-fun m!860801 () Bool)

(assert (=> b!926716 m!860801))

(declare-fun m!860803 () Bool)

(assert (=> b!926716 m!860803))

(declare-fun m!860805 () Bool)

(assert (=> b!926708 m!860805))

(declare-fun m!860807 () Bool)

(assert (=> b!926711 m!860807))

(declare-fun m!860809 () Bool)

(assert (=> b!926711 m!860809))

(declare-fun m!860811 () Bool)

(assert (=> b!926711 m!860811))

(declare-fun m!860813 () Bool)

(assert (=> b!926718 m!860813))

(declare-fun m!860815 () Bool)

(assert (=> mapNonEmpty!31431 m!860815))

(declare-fun m!860817 () Bool)

(assert (=> b!926705 m!860817))

(declare-fun m!860819 () Bool)

(assert (=> b!926706 m!860819))

(declare-fun m!860821 () Bool)

(assert (=> b!926713 m!860821))

(declare-fun m!860823 () Bool)

(assert (=> b!926713 m!860823))

(declare-fun m!860825 () Bool)

(assert (=> b!926713 m!860825))

(declare-fun m!860827 () Bool)

(assert (=> b!926713 m!860827))

(declare-fun m!860829 () Bool)

(assert (=> b!926713 m!860829))

(declare-fun m!860831 () Bool)

(assert (=> b!926713 m!860831))

(assert (=> b!926713 m!860827))

(declare-fun m!860833 () Bool)

(assert (=> b!926713 m!860833))

(declare-fun m!860835 () Bool)

(assert (=> b!926713 m!860835))

(declare-fun m!860837 () Bool)

(assert (=> b!926713 m!860837))

(declare-fun m!860839 () Bool)

(assert (=> b!926713 m!860839))

(declare-fun m!860841 () Bool)

(assert (=> b!926713 m!860841))

(declare-fun m!860843 () Bool)

(assert (=> b!926713 m!860843))

(declare-fun m!860845 () Bool)

(assert (=> b!926713 m!860845))

(assert (=> b!926713 m!860833))

(declare-fun m!860847 () Bool)

(assert (=> b!926713 m!860847))

(declare-fun m!860849 () Bool)

(assert (=> b!926713 m!860849))

(assert (=> b!926713 m!860847))

(declare-fun m!860851 () Bool)

(assert (=> b!926713 m!860851))

(declare-fun m!860853 () Bool)

(assert (=> b!926709 m!860853))

(assert (=> b!926709 m!860837))

(declare-fun m!860855 () Bool)

(assert (=> start!79044 m!860855))

(declare-fun m!860857 () Bool)

(assert (=> start!79044 m!860857))

(declare-fun m!860859 () Bool)

(assert (=> start!79044 m!860859))

(declare-fun m!860861 () Bool)

(assert (=> b!926721 m!860861))

(declare-fun m!860863 () Bool)

(assert (=> b!926721 m!860863))

(declare-fun m!860865 () Bool)

(assert (=> b!926712 m!860865))

(check-sat (not b!926709) (not b!926720) (not b_lambda!13759) (not b!926721) (not b_next!17275) (not b!926708) (not b!926706) (not b!926718) (not b!926712) b_and!28263 (not b!926705) (not b!926711) tp_is_empty!19783 (not mapNonEmpty!31431) (not start!79044) (not b!926716) (not b!926713) (not b!926704))
(check-sat b_and!28263 (not b_next!17275))
