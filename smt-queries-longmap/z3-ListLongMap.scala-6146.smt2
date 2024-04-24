; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79152 () Bool)

(assert start!79152)

(declare-fun b_free!17197 () Bool)

(declare-fun b_next!17197 () Bool)

(assert (=> start!79152 (= b_free!17197 (not b_next!17197))))

(declare-fun tp!60032 () Bool)

(declare-fun b_and!28141 () Bool)

(assert (=> start!79152 (= tp!60032 b_and!28141)))

(declare-fun b!925476 () Bool)

(declare-datatypes ((Unit!31220 0))(
  ( (Unit!31221) )
))
(declare-fun e!519437 () Unit!31220)

(declare-fun e!519435 () Unit!31220)

(assert (=> b!925476 (= e!519437 e!519435)))

(declare-fun lt!416141 () (_ BitVec 64))

(declare-datatypes ((array!55429 0))(
  ( (array!55430 (arr!26655 (Array (_ BitVec 32) (_ BitVec 64))) (size!27115 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55429)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!925476 (= lt!416141 (select (arr!26655 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96728 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925476 (= c!96728 (validKeyInArray!0 lt!416141))))

(declare-fun b!925477 () Bool)

(declare-fun e!519440 () Bool)

(declare-fun e!519441 () Bool)

(assert (=> b!925477 (= e!519440 e!519441)))

(declare-fun res!623534 () Bool)

(assert (=> b!925477 (=> (not res!623534) (not e!519441))))

(assert (=> b!925477 (= res!623534 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27115 _keys!1487)))))

(declare-fun lt!416153 () Unit!31220)

(assert (=> b!925477 (= lt!416153 e!519437)))

(declare-fun c!96729 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!925477 (= c!96729 (validKeyInArray!0 k0!1099))))

(declare-fun b!925478 () Bool)

(declare-fun Unit!31222 () Unit!31220)

(assert (=> b!925478 (= e!519435 Unit!31222)))

(declare-fun b!925479 () Bool)

(declare-fun e!519438 () Bool)

(declare-fun e!519432 () Bool)

(declare-fun mapRes!31314 () Bool)

(assert (=> b!925479 (= e!519438 (and e!519432 mapRes!31314))))

(declare-fun condMapEmpty!31314 () Bool)

(declare-datatypes ((V!31239 0))(
  ( (V!31240 (val!9903 Int)) )
))
(declare-datatypes ((ValueCell!9371 0))(
  ( (ValueCellFull!9371 (v!12418 V!31239)) (EmptyCell!9371) )
))
(declare-datatypes ((array!55431 0))(
  ( (array!55432 (arr!26656 (Array (_ BitVec 32) ValueCell!9371)) (size!27116 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55431)

(declare-fun mapDefault!31314 () ValueCell!9371)

(assert (=> b!925479 (= condMapEmpty!31314 (= (arr!26656 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9371)) mapDefault!31314)))))

(declare-fun b!925481 () Bool)

(declare-fun res!623540 () Bool)

(declare-fun e!519434 () Bool)

(assert (=> b!925481 (=> (not res!623540) (not e!519434))))

(assert (=> b!925481 (= res!623540 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27115 _keys!1487))))))

(declare-fun b!925482 () Bool)

(declare-fun res!623539 () Bool)

(assert (=> b!925482 (=> (not res!623539) (not e!519434))))

(declare-datatypes ((List!18706 0))(
  ( (Nil!18703) (Cons!18702 (h!19854 (_ BitVec 64)) (t!26625 List!18706)) )
))
(declare-fun arrayNoDuplicates!0 (array!55429 (_ BitVec 32) List!18706) Bool)

(assert (=> b!925482 (= res!623539 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18703))))

(declare-fun b!925483 () Bool)

(declare-fun tp_is_empty!19705 () Bool)

(assert (=> b!925483 (= e!519432 tp_is_empty!19705)))

(declare-fun b!925484 () Bool)

(declare-fun e!519431 () Bool)

(assert (=> b!925484 (= e!519431 false)))

(declare-fun lt!416146 () V!31239)

(declare-datatypes ((tuple2!12892 0))(
  ( (tuple2!12893 (_1!6457 (_ BitVec 64)) (_2!6457 V!31239)) )
))
(declare-datatypes ((List!18707 0))(
  ( (Nil!18704) (Cons!18703 (h!19855 tuple2!12892) (t!26626 List!18707)) )
))
(declare-datatypes ((ListLongMap!11591 0))(
  ( (ListLongMap!11592 (toList!5811 List!18707)) )
))
(declare-fun lt!416149 () ListLongMap!11591)

(declare-fun apply!664 (ListLongMap!11591 (_ BitVec 64)) V!31239)

(assert (=> b!925484 (= lt!416146 (apply!664 lt!416149 k0!1099))))

(declare-fun b!925485 () Bool)

(declare-fun res!623533 () Bool)

(assert (=> b!925485 (=> (not res!623533) (not e!519434))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55429 (_ BitVec 32)) Bool)

(assert (=> b!925485 (= res!623533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925486 () Bool)

(assert (=> b!925486 (= e!519441 e!519431)))

(declare-fun res!623538 () Bool)

(assert (=> b!925486 (=> (not res!623538) (not e!519431))))

(declare-fun contains!4883 (ListLongMap!11591 (_ BitVec 64)) Bool)

(assert (=> b!925486 (= res!623538 (contains!4883 lt!416149 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31239)

(declare-fun minValue!1173 () V!31239)

(declare-fun getCurrentListMap!3061 (array!55429 array!55431 (_ BitVec 32) (_ BitVec 32) V!31239 V!31239 (_ BitVec 32) Int) ListLongMap!11591)

(assert (=> b!925486 (= lt!416149 (getCurrentListMap!3061 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925487 () Bool)

(declare-fun res!623537 () Bool)

(assert (=> b!925487 (=> (not res!623537) (not e!519434))))

(assert (=> b!925487 (= res!623537 (and (= (size!27116 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27115 _keys!1487) (size!27116 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31314 () Bool)

(assert (=> mapIsEmpty!31314 mapRes!31314))

(declare-fun b!925480 () Bool)

(declare-fun e!519439 () Bool)

(assert (=> b!925480 (= e!519434 e!519439)))

(declare-fun res!623535 () Bool)

(assert (=> b!925480 (=> (not res!623535) (not e!519439))))

(declare-fun lt!416140 () ListLongMap!11591)

(assert (=> b!925480 (= res!623535 (contains!4883 lt!416140 k0!1099))))

(assert (=> b!925480 (= lt!416140 (getCurrentListMap!3061 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!623536 () Bool)

(assert (=> start!79152 (=> (not res!623536) (not e!519434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79152 (= res!623536 (validMask!0 mask!1881))))

(assert (=> start!79152 e!519434))

(assert (=> start!79152 true))

(assert (=> start!79152 tp_is_empty!19705))

(declare-fun array_inv!20860 (array!55431) Bool)

(assert (=> start!79152 (and (array_inv!20860 _values!1231) e!519438)))

(assert (=> start!79152 tp!60032))

(declare-fun array_inv!20861 (array!55429) Bool)

(assert (=> start!79152 (array_inv!20861 _keys!1487)))

(declare-fun b!925488 () Bool)

(declare-fun e!519436 () Bool)

(assert (=> b!925488 (= e!519436 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925489 () Bool)

(declare-fun lt!416152 () ListLongMap!11591)

(declare-fun lt!416142 () V!31239)

(assert (=> b!925489 (= (apply!664 lt!416152 k0!1099) lt!416142)))

(declare-fun lt!416148 () Unit!31220)

(declare-fun lt!416150 () V!31239)

(declare-fun addApplyDifferent!366 (ListLongMap!11591 (_ BitVec 64) V!31239 (_ BitVec 64)) Unit!31220)

(assert (=> b!925489 (= lt!416148 (addApplyDifferent!366 lt!416140 lt!416141 lt!416150 k0!1099))))

(assert (=> b!925489 (not (= lt!416141 k0!1099))))

(declare-fun lt!416139 () Unit!31220)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55429 (_ BitVec 64) (_ BitVec 32) List!18706) Unit!31220)

(assert (=> b!925489 (= lt!416139 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18703))))

(assert (=> b!925489 e!519436))

(declare-fun c!96727 () Bool)

(assert (=> b!925489 (= c!96727 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416147 () Unit!31220)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!221 (array!55429 array!55431 (_ BitVec 32) (_ BitVec 32) V!31239 V!31239 (_ BitVec 64) (_ BitVec 32) Int) Unit!31220)

(assert (=> b!925489 (= lt!416147 (lemmaListMapContainsThenArrayContainsFrom!221 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!925489 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18703)))

(declare-fun lt!416145 () Unit!31220)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55429 (_ BitVec 32) (_ BitVec 32)) Unit!31220)

(assert (=> b!925489 (= lt!416145 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925489 (contains!4883 lt!416152 k0!1099)))

(declare-fun lt!416144 () tuple2!12892)

(declare-fun +!2730 (ListLongMap!11591 tuple2!12892) ListLongMap!11591)

(assert (=> b!925489 (= lt!416152 (+!2730 lt!416140 lt!416144))))

(declare-fun lt!416143 () Unit!31220)

(declare-fun addStillContains!439 (ListLongMap!11591 (_ BitVec 64) V!31239 (_ BitVec 64)) Unit!31220)

(assert (=> b!925489 (= lt!416143 (addStillContains!439 lt!416140 lt!416141 lt!416150 k0!1099))))

(assert (=> b!925489 (= (getCurrentListMap!3061 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2730 (getCurrentListMap!3061 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416144))))

(assert (=> b!925489 (= lt!416144 (tuple2!12893 lt!416141 lt!416150))))

(declare-fun get!14031 (ValueCell!9371 V!31239) V!31239)

(declare-fun dynLambda!1527 (Int (_ BitVec 64)) V!31239)

(assert (=> b!925489 (= lt!416150 (get!14031 (select (arr!26656 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1527 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416151 () Unit!31220)

(declare-fun lemmaListMapRecursiveValidKeyArray!110 (array!55429 array!55431 (_ BitVec 32) (_ BitVec 32) V!31239 V!31239 (_ BitVec 32) Int) Unit!31220)

(assert (=> b!925489 (= lt!416151 (lemmaListMapRecursiveValidKeyArray!110 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925489 (= e!519435 lt!416148)))

(declare-fun mapNonEmpty!31314 () Bool)

(declare-fun tp!60033 () Bool)

(declare-fun e!519442 () Bool)

(assert (=> mapNonEmpty!31314 (= mapRes!31314 (and tp!60033 e!519442))))

(declare-fun mapRest!31314 () (Array (_ BitVec 32) ValueCell!9371))

(declare-fun mapValue!31314 () ValueCell!9371)

(declare-fun mapKey!31314 () (_ BitVec 32))

(assert (=> mapNonEmpty!31314 (= (arr!26656 _values!1231) (store mapRest!31314 mapKey!31314 mapValue!31314))))

(declare-fun b!925490 () Bool)

(assert (=> b!925490 (= e!519442 tp_is_empty!19705)))

(declare-fun b!925491 () Bool)

(declare-fun arrayContainsKey!0 (array!55429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925491 (= e!519436 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!925492 () Bool)

(declare-fun Unit!31223 () Unit!31220)

(assert (=> b!925492 (= e!519437 Unit!31223)))

(declare-fun b!925493 () Bool)

(assert (=> b!925493 (= e!519439 e!519440)))

(declare-fun res!623541 () Bool)

(assert (=> b!925493 (=> (not res!623541) (not e!519440))))

(declare-fun v!791 () V!31239)

(assert (=> b!925493 (= res!623541 (and (= lt!416142 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925493 (= lt!416142 (apply!664 lt!416140 k0!1099))))

(assert (= (and start!79152 res!623536) b!925487))

(assert (= (and b!925487 res!623537) b!925485))

(assert (= (and b!925485 res!623533) b!925482))

(assert (= (and b!925482 res!623539) b!925481))

(assert (= (and b!925481 res!623540) b!925480))

(assert (= (and b!925480 res!623535) b!925493))

(assert (= (and b!925493 res!623541) b!925477))

(assert (= (and b!925477 c!96729) b!925476))

(assert (= (and b!925477 (not c!96729)) b!925492))

(assert (= (and b!925476 c!96728) b!925489))

(assert (= (and b!925476 (not c!96728)) b!925478))

(assert (= (and b!925489 c!96727) b!925491))

(assert (= (and b!925489 (not c!96727)) b!925488))

(assert (= (and b!925477 res!623534) b!925486))

(assert (= (and b!925486 res!623538) b!925484))

(assert (= (and b!925479 condMapEmpty!31314) mapIsEmpty!31314))

(assert (= (and b!925479 (not condMapEmpty!31314)) mapNonEmpty!31314))

(get-info :version)

(assert (= (and mapNonEmpty!31314 ((_ is ValueCellFull!9371) mapValue!31314)) b!925490))

(assert (= (and b!925479 ((_ is ValueCellFull!9371) mapDefault!31314)) b!925483))

(assert (= start!79152 b!925479))

(declare-fun b_lambda!13713 () Bool)

(assert (=> (not b_lambda!13713) (not b!925489)))

(declare-fun t!26624 () Bool)

(declare-fun tb!5769 () Bool)

(assert (=> (and start!79152 (= defaultEntry!1235 defaultEntry!1235) t!26624) tb!5769))

(declare-fun result!11369 () Bool)

(assert (=> tb!5769 (= result!11369 tp_is_empty!19705)))

(assert (=> b!925489 t!26624))

(declare-fun b_and!28143 () Bool)

(assert (= b_and!28141 (and (=> t!26624 result!11369) b_and!28143)))

(declare-fun m!860191 () Bool)

(assert (=> b!925480 m!860191))

(declare-fun m!860193 () Bool)

(assert (=> b!925480 m!860193))

(declare-fun m!860195 () Bool)

(assert (=> b!925484 m!860195))

(declare-fun m!860197 () Bool)

(assert (=> b!925489 m!860197))

(declare-fun m!860199 () Bool)

(assert (=> b!925489 m!860199))

(declare-fun m!860201 () Bool)

(assert (=> b!925489 m!860201))

(declare-fun m!860203 () Bool)

(assert (=> b!925489 m!860203))

(declare-fun m!860205 () Bool)

(assert (=> b!925489 m!860205))

(declare-fun m!860207 () Bool)

(assert (=> b!925489 m!860207))

(declare-fun m!860209 () Bool)

(assert (=> b!925489 m!860209))

(declare-fun m!860211 () Bool)

(assert (=> b!925489 m!860211))

(assert (=> b!925489 m!860209))

(assert (=> b!925489 m!860211))

(declare-fun m!860213 () Bool)

(assert (=> b!925489 m!860213))

(declare-fun m!860215 () Bool)

(assert (=> b!925489 m!860215))

(declare-fun m!860217 () Bool)

(assert (=> b!925489 m!860217))

(declare-fun m!860219 () Bool)

(assert (=> b!925489 m!860219))

(declare-fun m!860221 () Bool)

(assert (=> b!925489 m!860221))

(assert (=> b!925489 m!860197))

(declare-fun m!860223 () Bool)

(assert (=> b!925489 m!860223))

(declare-fun m!860225 () Bool)

(assert (=> b!925489 m!860225))

(declare-fun m!860227 () Bool)

(assert (=> b!925489 m!860227))

(declare-fun m!860229 () Bool)

(assert (=> mapNonEmpty!31314 m!860229))

(declare-fun m!860231 () Bool)

(assert (=> b!925491 m!860231))

(declare-fun m!860233 () Bool)

(assert (=> b!925476 m!860233))

(declare-fun m!860235 () Bool)

(assert (=> b!925476 m!860235))

(declare-fun m!860237 () Bool)

(assert (=> b!925486 m!860237))

(assert (=> b!925486 m!860219))

(declare-fun m!860239 () Bool)

(assert (=> b!925477 m!860239))

(declare-fun m!860241 () Bool)

(assert (=> b!925485 m!860241))

(declare-fun m!860243 () Bool)

(assert (=> b!925493 m!860243))

(declare-fun m!860245 () Bool)

(assert (=> start!79152 m!860245))

(declare-fun m!860247 () Bool)

(assert (=> start!79152 m!860247))

(declare-fun m!860249 () Bool)

(assert (=> start!79152 m!860249))

(declare-fun m!860251 () Bool)

(assert (=> b!925482 m!860251))

(check-sat (not b!925485) (not b!925484) (not b_lambda!13713) tp_is_empty!19705 (not start!79152) (not mapNonEmpty!31314) (not b!925480) (not b!925486) (not b!925489) b_and!28143 (not b!925482) (not b!925491) (not b!925476) (not b!925493) (not b_next!17197) (not b!925477))
(check-sat b_and!28143 (not b_next!17197))
