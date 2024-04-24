; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78990 () Bool)

(assert start!78990)

(declare-fun b_free!17035 () Bool)

(declare-fun b_next!17035 () Bool)

(assert (=> start!78990 (= b_free!17035 (not b_next!17035))))

(declare-fun tp!59547 () Bool)

(declare-fun b_and!27817 () Bool)

(assert (=> start!78990 (= tp!59547 b_and!27817)))

(declare-fun b!921210 () Bool)

(declare-fun e!517120 () Bool)

(declare-fun e!517119 () Bool)

(declare-fun mapRes!31071 () Bool)

(assert (=> b!921210 (= e!517120 (and e!517119 mapRes!31071))))

(declare-fun condMapEmpty!31071 () Bool)

(declare-datatypes ((V!31023 0))(
  ( (V!31024 (val!9822 Int)) )
))
(declare-datatypes ((ValueCell!9290 0))(
  ( (ValueCellFull!9290 (v!12337 V!31023)) (EmptyCell!9290) )
))
(declare-datatypes ((array!55111 0))(
  ( (array!55112 (arr!26496 (Array (_ BitVec 32) ValueCell!9290)) (size!26956 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55111)

(declare-fun mapDefault!31071 () ValueCell!9290)

(assert (=> b!921210 (= condMapEmpty!31071 (= (arr!26496 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9290)) mapDefault!31071)))))

(declare-fun b!921211 () Bool)

(declare-fun e!517112 () Bool)

(declare-fun tp_is_empty!19543 () Bool)

(assert (=> b!921211 (= e!517112 tp_is_empty!19543)))

(declare-fun b!921212 () Bool)

(declare-fun res!620949 () Bool)

(declare-fun e!517113 () Bool)

(assert (=> b!921212 (=> (not res!620949) (not e!517113))))

(declare-datatypes ((array!55113 0))(
  ( (array!55114 (arr!26497 (Array (_ BitVec 32) (_ BitVec 64))) (size!26957 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55113)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55113 (_ BitVec 32)) Bool)

(assert (=> b!921212 (= res!620949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31071 () Bool)

(declare-fun tp!59546 () Bool)

(assert (=> mapNonEmpty!31071 (= mapRes!31071 (and tp!59546 e!517112))))

(declare-fun mapRest!31071 () (Array (_ BitVec 32) ValueCell!9290))

(declare-fun mapValue!31071 () ValueCell!9290)

(declare-fun mapKey!31071 () (_ BitVec 32))

(assert (=> mapNonEmpty!31071 (= (arr!26496 _values!1231) (store mapRest!31071 mapKey!31071 mapValue!31071))))

(declare-fun b!921214 () Bool)

(declare-fun res!620951 () Bool)

(assert (=> b!921214 (=> (not res!620951) (not e!517113))))

(declare-datatypes ((List!18566 0))(
  ( (Nil!18563) (Cons!18562 (h!19714 (_ BitVec 64)) (t!26323 List!18566)) )
))
(declare-fun arrayNoDuplicates!0 (array!55113 (_ BitVec 32) List!18566) Bool)

(assert (=> b!921214 (= res!620951 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18563))))

(declare-fun b!921215 () Bool)

(declare-fun e!517117 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!921215 (= e!517117 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921216 () Bool)

(assert (=> b!921216 (= e!517119 tp_is_empty!19543)))

(declare-fun b!921217 () Bool)

(declare-fun res!620944 () Bool)

(declare-fun e!517118 () Bool)

(assert (=> b!921217 (=> res!620944 e!517118)))

(declare-fun contains!4794 (List!18566 (_ BitVec 64)) Bool)

(assert (=> b!921217 (= res!620944 (contains!4794 Nil!18563 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921218 () Bool)

(declare-fun res!620946 () Bool)

(declare-fun e!517114 () Bool)

(assert (=> b!921218 (=> (not res!620946) (not e!517114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921218 (= res!620946 (validKeyInArray!0 k0!1099))))

(declare-fun b!921219 () Bool)

(declare-fun res!620950 () Bool)

(assert (=> b!921219 (=> (not res!620950) (not e!517114))))

(declare-fun v!791 () V!31023)

(declare-datatypes ((tuple2!12752 0))(
  ( (tuple2!12753 (_1!6387 (_ BitVec 64)) (_2!6387 V!31023)) )
))
(declare-datatypes ((List!18567 0))(
  ( (Nil!18564) (Cons!18563 (h!19715 tuple2!12752) (t!26324 List!18567)) )
))
(declare-datatypes ((ListLongMap!11451 0))(
  ( (ListLongMap!11452 (toList!5741 List!18567)) )
))
(declare-fun lt!413511 () ListLongMap!11451)

(declare-fun apply!607 (ListLongMap!11451 (_ BitVec 64)) V!31023)

(assert (=> b!921219 (= res!620950 (= (apply!607 lt!413511 k0!1099) v!791))))

(declare-fun b!921220 () Bool)

(declare-fun res!620945 () Bool)

(assert (=> b!921220 (=> res!620945 e!517118)))

(declare-fun noDuplicate!1339 (List!18566) Bool)

(assert (=> b!921220 (= res!620945 (not (noDuplicate!1339 Nil!18563)))))

(declare-fun b!921221 () Bool)

(declare-fun e!517116 () Bool)

(assert (=> b!921221 (= e!517114 e!517116)))

(declare-fun res!620948 () Bool)

(assert (=> b!921221 (=> (not res!620948) (not e!517116))))

(declare-fun lt!413509 () (_ BitVec 64))

(assert (=> b!921221 (= res!620948 (validKeyInArray!0 lt!413509))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921221 (= lt!413509 (select (arr!26497 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31071 () Bool)

(assert (=> mapIsEmpty!31071 mapRes!31071))

(declare-fun b!921222 () Bool)

(assert (=> b!921222 (= e!517118 true)))

(declare-fun lt!413516 () Bool)

(assert (=> b!921222 (= lt!413516 (contains!4794 Nil!18563 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!620940 () Bool)

(assert (=> start!78990 (=> (not res!620940) (not e!517113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78990 (= res!620940 (validMask!0 mask!1881))))

(assert (=> start!78990 e!517113))

(assert (=> start!78990 true))

(assert (=> start!78990 tp_is_empty!19543))

(declare-fun array_inv!20742 (array!55111) Bool)

(assert (=> start!78990 (and (array_inv!20742 _values!1231) e!517120)))

(assert (=> start!78990 tp!59547))

(declare-fun array_inv!20743 (array!55113) Bool)

(assert (=> start!78990 (array_inv!20743 _keys!1487)))

(declare-fun b!921213 () Bool)

(declare-fun res!620947 () Bool)

(assert (=> b!921213 (=> (not res!620947) (not e!517114))))

(assert (=> b!921213 (= res!620947 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921223 () Bool)

(declare-fun res!620943 () Bool)

(assert (=> b!921223 (=> (not res!620943) (not e!517113))))

(assert (=> b!921223 (= res!620943 (and (= (size!26956 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26957 _keys!1487) (size!26956 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921224 () Bool)

(declare-fun res!620952 () Bool)

(assert (=> b!921224 (=> (not res!620952) (not e!517113))))

(assert (=> b!921224 (= res!620952 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26957 _keys!1487))))))

(declare-fun b!921225 () Bool)

(declare-fun arrayContainsKey!0 (array!55113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921225 (= e!517117 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921226 () Bool)

(assert (=> b!921226 (= e!517116 (not e!517118))))

(declare-fun res!620941 () Bool)

(assert (=> b!921226 (=> res!620941 e!517118)))

(assert (=> b!921226 (= res!620941 (or (bvsge (size!26957 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26957 _keys!1487))))))

(assert (=> b!921226 e!517117))

(declare-fun c!96336 () Bool)

(assert (=> b!921226 (= c!96336 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((Unit!31060 0))(
  ( (Unit!31061) )
))
(declare-fun lt!413510 () Unit!31060)

(declare-fun zeroValue!1173 () V!31023)

(declare-fun minValue!1173 () V!31023)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!165 (array!55113 array!55111 (_ BitVec 32) (_ BitVec 32) V!31023 V!31023 (_ BitVec 64) (_ BitVec 32) Int) Unit!31060)

(assert (=> b!921226 (= lt!413510 (lemmaListMapContainsThenArrayContainsFrom!165 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!921226 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18563)))

(declare-fun lt!413508 () Unit!31060)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55113 (_ BitVec 32) (_ BitVec 32)) Unit!31060)

(assert (=> b!921226 (= lt!413508 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413514 () tuple2!12752)

(declare-fun contains!4795 (ListLongMap!11451 (_ BitVec 64)) Bool)

(declare-fun +!2674 (ListLongMap!11451 tuple2!12752) ListLongMap!11451)

(assert (=> b!921226 (contains!4795 (+!2674 lt!413511 lt!413514) k0!1099)))

(declare-fun lt!413513 () Unit!31060)

(declare-fun lt!413515 () V!31023)

(declare-fun addStillContains!383 (ListLongMap!11451 (_ BitVec 64) V!31023 (_ BitVec 64)) Unit!31060)

(assert (=> b!921226 (= lt!413513 (addStillContains!383 lt!413511 lt!413509 lt!413515 k0!1099))))

(declare-fun getCurrentListMap!2994 (array!55113 array!55111 (_ BitVec 32) (_ BitVec 32) V!31023 V!31023 (_ BitVec 32) Int) ListLongMap!11451)

(assert (=> b!921226 (= (getCurrentListMap!2994 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2674 (getCurrentListMap!2994 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413514))))

(assert (=> b!921226 (= lt!413514 (tuple2!12753 lt!413509 lt!413515))))

(declare-fun get!13921 (ValueCell!9290 V!31023) V!31023)

(declare-fun dynLambda!1471 (Int (_ BitVec 64)) V!31023)

(assert (=> b!921226 (= lt!413515 (get!13921 (select (arr!26496 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1471 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413512 () Unit!31060)

(declare-fun lemmaListMapRecursiveValidKeyArray!54 (array!55113 array!55111 (_ BitVec 32) (_ BitVec 32) V!31023 V!31023 (_ BitVec 32) Int) Unit!31060)

(assert (=> b!921226 (= lt!413512 (lemmaListMapRecursiveValidKeyArray!54 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921227 () Bool)

(assert (=> b!921227 (= e!517113 e!517114)))

(declare-fun res!620942 () Bool)

(assert (=> b!921227 (=> (not res!620942) (not e!517114))))

(assert (=> b!921227 (= res!620942 (contains!4795 lt!413511 k0!1099))))

(assert (=> b!921227 (= lt!413511 (getCurrentListMap!2994 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!78990 res!620940) b!921223))

(assert (= (and b!921223 res!620943) b!921212))

(assert (= (and b!921212 res!620949) b!921214))

(assert (= (and b!921214 res!620951) b!921224))

(assert (= (and b!921224 res!620952) b!921227))

(assert (= (and b!921227 res!620942) b!921219))

(assert (= (and b!921219 res!620950) b!921213))

(assert (= (and b!921213 res!620947) b!921218))

(assert (= (and b!921218 res!620946) b!921221))

(assert (= (and b!921221 res!620948) b!921226))

(assert (= (and b!921226 c!96336) b!921225))

(assert (= (and b!921226 (not c!96336)) b!921215))

(assert (= (and b!921226 (not res!620941)) b!921220))

(assert (= (and b!921220 (not res!620945)) b!921217))

(assert (= (and b!921217 (not res!620944)) b!921222))

(assert (= (and b!921210 condMapEmpty!31071) mapIsEmpty!31071))

(assert (= (and b!921210 (not condMapEmpty!31071)) mapNonEmpty!31071))

(get-info :version)

(assert (= (and mapNonEmpty!31071 ((_ is ValueCellFull!9290) mapValue!31071)) b!921211))

(assert (= (and b!921210 ((_ is ValueCellFull!9290) mapDefault!31071)) b!921216))

(assert (= start!78990 b!921210))

(declare-fun b_lambda!13551 () Bool)

(assert (=> (not b_lambda!13551) (not b!921226)))

(declare-fun t!26322 () Bool)

(declare-fun tb!5607 () Bool)

(assert (=> (and start!78990 (= defaultEntry!1235 defaultEntry!1235) t!26322) tb!5607))

(declare-fun result!11045 () Bool)

(assert (=> tb!5607 (= result!11045 tp_is_empty!19543)))

(assert (=> b!921226 t!26322))

(declare-fun b_and!27819 () Bool)

(assert (= b_and!27817 (and (=> t!26322 result!11045) b_and!27819)))

(declare-fun m!855517 () Bool)

(assert (=> mapNonEmpty!31071 m!855517))

(declare-fun m!855519 () Bool)

(assert (=> b!921220 m!855519))

(declare-fun m!855521 () Bool)

(assert (=> b!921219 m!855521))

(declare-fun m!855523 () Bool)

(assert (=> b!921225 m!855523))

(declare-fun m!855525 () Bool)

(assert (=> b!921217 m!855525))

(declare-fun m!855527 () Bool)

(assert (=> b!921222 m!855527))

(declare-fun m!855529 () Bool)

(assert (=> b!921226 m!855529))

(declare-fun m!855531 () Bool)

(assert (=> b!921226 m!855531))

(declare-fun m!855533 () Bool)

(assert (=> b!921226 m!855533))

(declare-fun m!855535 () Bool)

(assert (=> b!921226 m!855535))

(declare-fun m!855537 () Bool)

(assert (=> b!921226 m!855537))

(assert (=> b!921226 m!855535))

(assert (=> b!921226 m!855537))

(declare-fun m!855539 () Bool)

(assert (=> b!921226 m!855539))

(declare-fun m!855541 () Bool)

(assert (=> b!921226 m!855541))

(declare-fun m!855543 () Bool)

(assert (=> b!921226 m!855543))

(assert (=> b!921226 m!855529))

(declare-fun m!855545 () Bool)

(assert (=> b!921226 m!855545))

(declare-fun m!855547 () Bool)

(assert (=> b!921226 m!855547))

(declare-fun m!855549 () Bool)

(assert (=> b!921226 m!855549))

(declare-fun m!855551 () Bool)

(assert (=> b!921226 m!855551))

(declare-fun m!855553 () Bool)

(assert (=> b!921226 m!855553))

(assert (=> b!921226 m!855549))

(declare-fun m!855555 () Bool)

(assert (=> b!921212 m!855555))

(declare-fun m!855557 () Bool)

(assert (=> b!921214 m!855557))

(declare-fun m!855559 () Bool)

(assert (=> b!921218 m!855559))

(declare-fun m!855561 () Bool)

(assert (=> b!921221 m!855561))

(declare-fun m!855563 () Bool)

(assert (=> b!921221 m!855563))

(declare-fun m!855565 () Bool)

(assert (=> b!921227 m!855565))

(declare-fun m!855567 () Bool)

(assert (=> b!921227 m!855567))

(declare-fun m!855569 () Bool)

(assert (=> start!78990 m!855569))

(declare-fun m!855571 () Bool)

(assert (=> start!78990 m!855571))

(declare-fun m!855573 () Bool)

(assert (=> start!78990 m!855573))

(check-sat b_and!27819 (not b_next!17035) (not b!921225) (not b!921217) (not mapNonEmpty!31071) (not b!921221) (not b!921219) (not b!921226) (not start!78990) (not b!921220) (not b!921227) (not b!921212) tp_is_empty!19543 (not b!921214) (not b!921222) (not b!921218) (not b_lambda!13551))
(check-sat b_and!27819 (not b_next!17035))
