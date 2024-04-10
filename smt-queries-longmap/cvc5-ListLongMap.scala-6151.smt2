; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79014 () Bool)

(assert start!79014)

(declare-fun b_free!17227 () Bool)

(declare-fun b_next!17227 () Bool)

(assert (=> start!79014 (= b_free!17227 (not b_next!17227))))

(declare-fun tp!60122 () Bool)

(declare-fun b_and!28191 () Bool)

(assert (=> start!79014 (= tp!60122 b_and!28191)))

(declare-fun b!925453 () Bool)

(declare-datatypes ((Unit!31269 0))(
  ( (Unit!31270) )
))
(declare-fun e!519417 () Unit!31269)

(declare-fun Unit!31271 () Unit!31269)

(assert (=> b!925453 (= e!519417 Unit!31271)))

(declare-fun res!623634 () Bool)

(declare-fun e!519413 () Bool)

(assert (=> start!79014 (=> (not res!623634) (not e!519413))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79014 (= res!623634 (validMask!0 mask!1881))))

(assert (=> start!79014 e!519413))

(assert (=> start!79014 true))

(declare-fun tp_is_empty!19735 () Bool)

(assert (=> start!79014 tp_is_empty!19735))

(declare-datatypes ((V!31279 0))(
  ( (V!31280 (val!9918 Int)) )
))
(declare-datatypes ((ValueCell!9386 0))(
  ( (ValueCellFull!9386 (v!12436 V!31279)) (EmptyCell!9386) )
))
(declare-datatypes ((array!55438 0))(
  ( (array!55439 (arr!26664 (Array (_ BitVec 32) ValueCell!9386)) (size!27123 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55438)

(declare-fun e!519412 () Bool)

(declare-fun array_inv!20768 (array!55438) Bool)

(assert (=> start!79014 (and (array_inv!20768 _values!1231) e!519412)))

(assert (=> start!79014 tp!60122))

(declare-datatypes ((array!55440 0))(
  ( (array!55441 (arr!26665 (Array (_ BitVec 32) (_ BitVec 64))) (size!27124 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55440)

(declare-fun array_inv!20769 (array!55440) Bool)

(assert (=> start!79014 (array_inv!20769 _keys!1487)))

(declare-fun b!925454 () Bool)

(declare-fun res!623644 () Bool)

(assert (=> b!925454 (=> (not res!623644) (not e!519413))))

(declare-datatypes ((List!18734 0))(
  ( (Nil!18731) (Cons!18730 (h!19876 (_ BitVec 64)) (t!26691 List!18734)) )
))
(declare-fun arrayNoDuplicates!0 (array!55440 (_ BitVec 32) List!18734) Bool)

(assert (=> b!925454 (= res!623644 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18731))))

(declare-fun b!925455 () Bool)

(declare-fun e!519414 () Bool)

(assert (=> b!925455 (= e!519414 (not true))))

(declare-fun e!519409 () Bool)

(assert (=> b!925455 e!519409))

(declare-fun res!623636 () Bool)

(assert (=> b!925455 (=> (not res!623636) (not e!519409))))

(declare-datatypes ((tuple2!12932 0))(
  ( (tuple2!12933 (_1!6477 (_ BitVec 64)) (_2!6477 V!31279)) )
))
(declare-datatypes ((List!18735 0))(
  ( (Nil!18732) (Cons!18731 (h!19877 tuple2!12932) (t!26692 List!18735)) )
))
(declare-datatypes ((ListLongMap!11629 0))(
  ( (ListLongMap!11630 (toList!5830 List!18735)) )
))
(declare-fun lt!416484 () ListLongMap!11629)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4890 (ListLongMap!11629 (_ BitVec 64)) Bool)

(assert (=> b!925455 (= res!623636 (contains!4890 lt!416484 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31279)

(declare-fun minValue!1173 () V!31279)

(declare-fun getCurrentListMap!3081 (array!55440 array!55438 (_ BitVec 32) (_ BitVec 32) V!31279 V!31279 (_ BitVec 32) Int) ListLongMap!11629)

(assert (=> b!925455 (= lt!416484 (getCurrentListMap!3081 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun v!791 () V!31279)

(declare-fun lt!416477 () Unit!31269)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!70 (array!55440 array!55438 (_ BitVec 32) (_ BitVec 32) V!31279 V!31279 (_ BitVec 64) V!31279 (_ BitVec 32) Int) Unit!31269)

(assert (=> b!925455 (= lt!416477 (lemmaListMapApplyFromThenApplyFromZero!70 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925456 () Bool)

(declare-fun res!623637 () Bool)

(assert (=> b!925456 (=> (not res!623637) (not e!519413))))

(assert (=> b!925456 (= res!623637 (and (= (size!27123 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27124 _keys!1487) (size!27123 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31359 () Bool)

(declare-fun mapRes!31359 () Bool)

(declare-fun tp!60121 () Bool)

(declare-fun e!519410 () Bool)

(assert (=> mapNonEmpty!31359 (= mapRes!31359 (and tp!60121 e!519410))))

(declare-fun mapKey!31359 () (_ BitVec 32))

(declare-fun mapValue!31359 () ValueCell!9386)

(declare-fun mapRest!31359 () (Array (_ BitVec 32) ValueCell!9386))

(assert (=> mapNonEmpty!31359 (= (arr!26664 _values!1231) (store mapRest!31359 mapKey!31359 mapValue!31359))))

(declare-fun b!925457 () Bool)

(declare-fun e!519418 () Unit!31269)

(declare-fun Unit!31272 () Unit!31269)

(assert (=> b!925457 (= e!519418 Unit!31272)))

(declare-fun b!925458 () Bool)

(declare-fun e!519419 () Bool)

(assert (=> b!925458 (= e!519419 tp_is_empty!19735)))

(declare-fun b!925459 () Bool)

(declare-fun e!519421 () Bool)

(assert (=> b!925459 (= e!519413 e!519421)))

(declare-fun res!623635 () Bool)

(assert (=> b!925459 (=> (not res!623635) (not e!519421))))

(declare-fun lt!416487 () ListLongMap!11629)

(assert (=> b!925459 (= res!623635 (contains!4890 lt!416487 k!1099))))

(assert (=> b!925459 (= lt!416487 (getCurrentListMap!3081 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925460 () Bool)

(declare-fun e!519411 () Bool)

(assert (=> b!925460 (= e!519411 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925461 () Bool)

(assert (=> b!925461 (= e!519410 tp_is_empty!19735)))

(declare-fun b!925462 () Bool)

(declare-fun e!519415 () Bool)

(declare-fun e!519420 () Bool)

(assert (=> b!925462 (= e!519415 e!519420)))

(declare-fun res!623638 () Bool)

(assert (=> b!925462 (=> (not res!623638) (not e!519420))))

(assert (=> b!925462 (= res!623638 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27124 _keys!1487)))))

(declare-fun lt!416482 () Unit!31269)

(assert (=> b!925462 (= lt!416482 e!519418)))

(declare-fun c!96580 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925462 (= c!96580 (validKeyInArray!0 k!1099))))

(declare-fun b!925463 () Bool)

(declare-fun res!623643 () Bool)

(assert (=> b!925463 (=> (not res!623643) (not e!519414))))

(declare-fun lt!416486 () ListLongMap!11629)

(declare-fun apply!660 (ListLongMap!11629 (_ BitVec 64)) V!31279)

(assert (=> b!925463 (= res!623643 (= (apply!660 lt!416486 k!1099) v!791))))

(declare-fun b!925464 () Bool)

(assert (=> b!925464 (= e!519421 e!519415)))

(declare-fun res!623640 () Bool)

(assert (=> b!925464 (=> (not res!623640) (not e!519415))))

(declare-fun lt!416480 () V!31279)

(assert (=> b!925464 (= res!623640 (and (= lt!416480 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925464 (= lt!416480 (apply!660 lt!416487 k!1099))))

(declare-fun b!925465 () Bool)

(declare-fun res!623641 () Bool)

(assert (=> b!925465 (=> (not res!623641) (not e!519413))))

(assert (=> b!925465 (= res!623641 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27124 _keys!1487))))))

(declare-fun b!925466 () Bool)

(assert (=> b!925466 (= e!519409 (= (apply!660 lt!416484 k!1099) v!791))))

(declare-fun mapIsEmpty!31359 () Bool)

(assert (=> mapIsEmpty!31359 mapRes!31359))

(declare-fun b!925467 () Bool)

(assert (=> b!925467 (= e!519418 e!519417)))

(declare-fun lt!416488 () (_ BitVec 64))

(assert (=> b!925467 (= lt!416488 (select (arr!26665 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96582 () Bool)

(assert (=> b!925467 (= c!96582 (validKeyInArray!0 lt!416488))))

(declare-fun b!925468 () Bool)

(assert (=> b!925468 (= e!519420 e!519414)))

(declare-fun res!623642 () Bool)

(assert (=> b!925468 (=> (not res!623642) (not e!519414))))

(assert (=> b!925468 (= res!623642 (contains!4890 lt!416486 k!1099))))

(assert (=> b!925468 (= lt!416486 (getCurrentListMap!3081 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925469 () Bool)

(declare-fun arrayContainsKey!0 (array!55440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925469 (= e!519411 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!925470 () Bool)

(declare-fun lt!416485 () ListLongMap!11629)

(assert (=> b!925470 (= (apply!660 lt!416485 k!1099) lt!416480)))

(declare-fun lt!416473 () V!31279)

(declare-fun lt!416474 () Unit!31269)

(declare-fun addApplyDifferent!381 (ListLongMap!11629 (_ BitVec 64) V!31279 (_ BitVec 64)) Unit!31269)

(assert (=> b!925470 (= lt!416474 (addApplyDifferent!381 lt!416487 lt!416488 lt!416473 k!1099))))

(assert (=> b!925470 (not (= lt!416488 k!1099))))

(declare-fun lt!416475 () Unit!31269)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55440 (_ BitVec 64) (_ BitVec 32) List!18734) Unit!31269)

(assert (=> b!925470 (= lt!416475 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18731))))

(assert (=> b!925470 e!519411))

(declare-fun c!96581 () Bool)

(assert (=> b!925470 (= c!96581 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416483 () Unit!31269)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!232 (array!55440 array!55438 (_ BitVec 32) (_ BitVec 32) V!31279 V!31279 (_ BitVec 64) (_ BitVec 32) Int) Unit!31269)

(assert (=> b!925470 (= lt!416483 (lemmaListMapContainsThenArrayContainsFrom!232 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!925470 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18731)))

(declare-fun lt!416481 () Unit!31269)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55440 (_ BitVec 32) (_ BitVec 32)) Unit!31269)

(assert (=> b!925470 (= lt!416481 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925470 (contains!4890 lt!416485 k!1099)))

(declare-fun lt!416478 () tuple2!12932)

(declare-fun +!2725 (ListLongMap!11629 tuple2!12932) ListLongMap!11629)

(assert (=> b!925470 (= lt!416485 (+!2725 lt!416487 lt!416478))))

(declare-fun lt!416479 () Unit!31269)

(declare-fun addStillContains!449 (ListLongMap!11629 (_ BitVec 64) V!31279 (_ BitVec 64)) Unit!31269)

(assert (=> b!925470 (= lt!416479 (addStillContains!449 lt!416487 lt!416488 lt!416473 k!1099))))

(assert (=> b!925470 (= (getCurrentListMap!3081 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2725 (getCurrentListMap!3081 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416478))))

(assert (=> b!925470 (= lt!416478 (tuple2!12933 lt!416488 lt!416473))))

(declare-fun get!14024 (ValueCell!9386 V!31279) V!31279)

(declare-fun dynLambda!1514 (Int (_ BitVec 64)) V!31279)

(assert (=> b!925470 (= lt!416473 (get!14024 (select (arr!26664 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1514 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416476 () Unit!31269)

(declare-fun lemmaListMapRecursiveValidKeyArray!115 (array!55440 array!55438 (_ BitVec 32) (_ BitVec 32) V!31279 V!31279 (_ BitVec 32) Int) Unit!31269)

(assert (=> b!925470 (= lt!416476 (lemmaListMapRecursiveValidKeyArray!115 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925470 (= e!519417 lt!416474)))

(declare-fun b!925471 () Bool)

(assert (=> b!925471 (= e!519412 (and e!519419 mapRes!31359))))

(declare-fun condMapEmpty!31359 () Bool)

(declare-fun mapDefault!31359 () ValueCell!9386)

