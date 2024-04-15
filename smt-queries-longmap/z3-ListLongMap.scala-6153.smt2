; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79008 () Bool)

(assert start!79008)

(declare-fun b_free!17239 () Bool)

(declare-fun b_next!17239 () Bool)

(assert (=> start!79008 (= b_free!17239 (not b_next!17239))))

(declare-fun tp!60158 () Bool)

(declare-fun b_and!28189 () Bool)

(assert (=> start!79008 (= tp!60158 b_and!28189)))

(declare-fun mapIsEmpty!31377 () Bool)

(declare-fun mapRes!31377 () Bool)

(assert (=> mapIsEmpty!31377 mapRes!31377))

(declare-fun b!925586 () Bool)

(declare-fun res!623726 () Bool)

(declare-fun e!519500 () Bool)

(assert (=> b!925586 (=> (not res!623726) (not e!519500))))

(declare-datatypes ((array!55435 0))(
  ( (array!55436 (arr!26663 (Array (_ BitVec 32) (_ BitVec 64))) (size!27124 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55435)

(declare-datatypes ((List!18776 0))(
  ( (Nil!18773) (Cons!18772 (h!19918 (_ BitVec 64)) (t!26736 List!18776)) )
))
(declare-fun arrayNoDuplicates!0 (array!55435 (_ BitVec 32) List!18776) Bool)

(assert (=> b!925586 (= res!623726 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18773))))

(declare-fun b!925587 () Bool)

(declare-fun e!519505 () Bool)

(declare-fun e!519501 () Bool)

(assert (=> b!925587 (= e!519505 e!519501)))

(declare-fun res!623724 () Bool)

(assert (=> b!925587 (=> (not res!623724) (not e!519501))))

(declare-datatypes ((V!31295 0))(
  ( (V!31296 (val!9924 Int)) )
))
(declare-datatypes ((tuple2!13002 0))(
  ( (tuple2!13003 (_1!6512 (_ BitVec 64)) (_2!6512 V!31295)) )
))
(declare-datatypes ((List!18777 0))(
  ( (Nil!18774) (Cons!18773 (h!19919 tuple2!13002) (t!26737 List!18777)) )
))
(declare-datatypes ((ListLongMap!11689 0))(
  ( (ListLongMap!11690 (toList!5860 List!18777)) )
))
(declare-fun lt!416534 () ListLongMap!11689)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4872 (ListLongMap!11689 (_ BitVec 64)) Bool)

(assert (=> b!925587 (= res!623724 (contains!4872 lt!416534 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9392 0))(
  ( (ValueCellFull!9392 (v!12441 V!31295)) (EmptyCell!9392) )
))
(declare-datatypes ((array!55437 0))(
  ( (array!55438 (arr!26664 (Array (_ BitVec 32) ValueCell!9392)) (size!27125 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55437)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31295)

(declare-fun minValue!1173 () V!31295)

(declare-fun getCurrentListMap!3046 (array!55435 array!55437 (_ BitVec 32) (_ BitVec 32) V!31295 V!31295 (_ BitVec 32) Int) ListLongMap!11689)

(assert (=> b!925587 (= lt!416534 (getCurrentListMap!3046 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925588 () Bool)

(declare-fun res!623731 () Bool)

(assert (=> b!925588 (=> (not res!623731) (not e!519500))))

(assert (=> b!925588 (= res!623731 (and (= (size!27125 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27124 _keys!1487) (size!27125 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925589 () Bool)

(declare-fun e!519504 () Bool)

(assert (=> b!925589 (= e!519500 e!519504)))

(declare-fun res!623732 () Bool)

(assert (=> b!925589 (=> (not res!623732) (not e!519504))))

(declare-fun lt!416528 () ListLongMap!11689)

(assert (=> b!925589 (= res!623732 (contains!4872 lt!416528 k0!1099))))

(assert (=> b!925589 (= lt!416528 (getCurrentListMap!3046 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925590 () Bool)

(declare-datatypes ((Unit!31193 0))(
  ( (Unit!31194) )
))
(declare-fun e!519498 () Unit!31193)

(declare-fun Unit!31195 () Unit!31193)

(assert (=> b!925590 (= e!519498 Unit!31195)))

(declare-fun b!925591 () Bool)

(assert (=> b!925591 (= e!519501 (not true))))

(declare-fun e!519506 () Bool)

(assert (=> b!925591 e!519506))

(declare-fun res!623722 () Bool)

(assert (=> b!925591 (=> (not res!623722) (not e!519506))))

(declare-fun lt!416537 () ListLongMap!11689)

(assert (=> b!925591 (= res!623722 (contains!4872 lt!416537 k0!1099))))

(assert (=> b!925591 (= lt!416537 (getCurrentListMap!3046 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun v!791 () V!31295)

(declare-fun lt!416526 () Unit!31193)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!80 (array!55435 array!55437 (_ BitVec 32) (_ BitVec 32) V!31295 V!31295 (_ BitVec 64) V!31295 (_ BitVec 32) Int) Unit!31193)

(assert (=> b!925591 (= lt!416526 (lemmaListMapApplyFromThenApplyFromZero!80 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925592 () Bool)

(declare-fun e!519499 () Bool)

(declare-fun tp_is_empty!19747 () Bool)

(assert (=> b!925592 (= e!519499 tp_is_empty!19747)))

(declare-fun b!925594 () Bool)

(declare-fun res!623723 () Bool)

(assert (=> b!925594 (=> (not res!623723) (not e!519501))))

(declare-fun apply!671 (ListLongMap!11689 (_ BitVec 64)) V!31295)

(assert (=> b!925594 (= res!623723 (= (apply!671 lt!416534 k0!1099) v!791))))

(declare-fun b!925595 () Bool)

(declare-fun e!519497 () Unit!31193)

(assert (=> b!925595 (= e!519497 e!519498)))

(declare-fun lt!416531 () (_ BitVec 64))

(assert (=> b!925595 (= lt!416531 (select (arr!26663 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96569 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925595 (= c!96569 (validKeyInArray!0 lt!416531))))

(declare-fun b!925596 () Bool)

(declare-fun e!519503 () Bool)

(declare-fun arrayContainsKey!0 (array!55435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925596 (= e!519503 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!925597 () Bool)

(declare-fun res!623729 () Bool)

(assert (=> b!925597 (=> (not res!623729) (not e!519500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55435 (_ BitVec 32)) Bool)

(assert (=> b!925597 (= res!623729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31377 () Bool)

(declare-fun tp!60159 () Bool)

(assert (=> mapNonEmpty!31377 (= mapRes!31377 (and tp!60159 e!519499))))

(declare-fun mapRest!31377 () (Array (_ BitVec 32) ValueCell!9392))

(declare-fun mapValue!31377 () ValueCell!9392)

(declare-fun mapKey!31377 () (_ BitVec 32))

(assert (=> mapNonEmpty!31377 (= (arr!26664 _values!1231) (store mapRest!31377 mapKey!31377 mapValue!31377))))

(declare-fun b!925598 () Bool)

(declare-fun Unit!31196 () Unit!31193)

(assert (=> b!925598 (= e!519497 Unit!31196)))

(declare-fun b!925599 () Bool)

(declare-fun lt!416540 () ListLongMap!11689)

(declare-fun lt!416538 () V!31295)

(assert (=> b!925599 (= (apply!671 lt!416540 k0!1099) lt!416538)))

(declare-fun lt!416536 () Unit!31193)

(declare-fun lt!416525 () V!31295)

(declare-fun addApplyDifferent!382 (ListLongMap!11689 (_ BitVec 64) V!31295 (_ BitVec 64)) Unit!31193)

(assert (=> b!925599 (= lt!416536 (addApplyDifferent!382 lt!416528 lt!416531 lt!416525 k0!1099))))

(assert (=> b!925599 (not (= lt!416531 k0!1099))))

(declare-fun lt!416533 () Unit!31193)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55435 (_ BitVec 64) (_ BitVec 32) List!18776) Unit!31193)

(assert (=> b!925599 (= lt!416533 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18773))))

(assert (=> b!925599 e!519503))

(declare-fun c!96571 () Bool)

(assert (=> b!925599 (= c!96571 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416532 () Unit!31193)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!242 (array!55435 array!55437 (_ BitVec 32) (_ BitVec 32) V!31295 V!31295 (_ BitVec 64) (_ BitVec 32) Int) Unit!31193)

(assert (=> b!925599 (= lt!416532 (lemmaListMapContainsThenArrayContainsFrom!242 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!925599 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18773)))

(declare-fun lt!416535 () Unit!31193)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55435 (_ BitVec 32) (_ BitVec 32)) Unit!31193)

(assert (=> b!925599 (= lt!416535 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925599 (contains!4872 lt!416540 k0!1099)))

(declare-fun lt!416529 () tuple2!13002)

(declare-fun +!2754 (ListLongMap!11689 tuple2!13002) ListLongMap!11689)

(assert (=> b!925599 (= lt!416540 (+!2754 lt!416528 lt!416529))))

(declare-fun lt!416539 () Unit!31193)

(declare-fun addStillContains!451 (ListLongMap!11689 (_ BitVec 64) V!31295 (_ BitVec 64)) Unit!31193)

(assert (=> b!925599 (= lt!416539 (addStillContains!451 lt!416528 lt!416531 lt!416525 k0!1099))))

(assert (=> b!925599 (= (getCurrentListMap!3046 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2754 (getCurrentListMap!3046 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416529))))

(assert (=> b!925599 (= lt!416529 (tuple2!13003 lt!416531 lt!416525))))

(declare-fun get!14029 (ValueCell!9392 V!31295) V!31295)

(declare-fun dynLambda!1510 (Int (_ BitVec 64)) V!31295)

(assert (=> b!925599 (= lt!416525 (get!14029 (select (arr!26664 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1510 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416527 () Unit!31193)

(declare-fun lemmaListMapRecursiveValidKeyArray!118 (array!55435 array!55437 (_ BitVec 32) (_ BitVec 32) V!31295 V!31295 (_ BitVec 32) Int) Unit!31193)

(assert (=> b!925599 (= lt!416527 (lemmaListMapRecursiveValidKeyArray!118 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925599 (= e!519498 lt!416536)))

(declare-fun b!925593 () Bool)

(declare-fun res!623725 () Bool)

(assert (=> b!925593 (=> (not res!623725) (not e!519500))))

(assert (=> b!925593 (= res!623725 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27124 _keys!1487))))))

(declare-fun res!623730 () Bool)

(assert (=> start!79008 (=> (not res!623730) (not e!519500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79008 (= res!623730 (validMask!0 mask!1881))))

(assert (=> start!79008 e!519500))

(assert (=> start!79008 true))

(assert (=> start!79008 tp_is_empty!19747))

(declare-fun e!519496 () Bool)

(declare-fun array_inv!20848 (array!55437) Bool)

(assert (=> start!79008 (and (array_inv!20848 _values!1231) e!519496)))

(assert (=> start!79008 tp!60158))

(declare-fun array_inv!20849 (array!55435) Bool)

(assert (=> start!79008 (array_inv!20849 _keys!1487)))

(declare-fun b!925600 () Bool)

(declare-fun e!519507 () Bool)

(assert (=> b!925600 (= e!519507 tp_is_empty!19747)))

(declare-fun b!925601 () Bool)

(assert (=> b!925601 (= e!519496 (and e!519507 mapRes!31377))))

(declare-fun condMapEmpty!31377 () Bool)

(declare-fun mapDefault!31377 () ValueCell!9392)

(assert (=> b!925601 (= condMapEmpty!31377 (= (arr!26664 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9392)) mapDefault!31377)))))

(declare-fun b!925602 () Bool)

(declare-fun e!519495 () Bool)

(assert (=> b!925602 (= e!519504 e!519495)))

(declare-fun res!623728 () Bool)

(assert (=> b!925602 (=> (not res!623728) (not e!519495))))

(assert (=> b!925602 (= res!623728 (and (= lt!416538 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925602 (= lt!416538 (apply!671 lt!416528 k0!1099))))

(declare-fun b!925603 () Bool)

(assert (=> b!925603 (= e!519495 e!519505)))

(declare-fun res!623727 () Bool)

(assert (=> b!925603 (=> (not res!623727) (not e!519505))))

(assert (=> b!925603 (= res!623727 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27124 _keys!1487)))))

(declare-fun lt!416530 () Unit!31193)

(assert (=> b!925603 (= lt!416530 e!519497)))

(declare-fun c!96570 () Bool)

(assert (=> b!925603 (= c!96570 (validKeyInArray!0 k0!1099))))

(declare-fun b!925604 () Bool)

(assert (=> b!925604 (= e!519503 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925605 () Bool)

(assert (=> b!925605 (= e!519506 (= (apply!671 lt!416537 k0!1099) v!791))))

(assert (= (and start!79008 res!623730) b!925588))

(assert (= (and b!925588 res!623731) b!925597))

(assert (= (and b!925597 res!623729) b!925586))

(assert (= (and b!925586 res!623726) b!925593))

(assert (= (and b!925593 res!623725) b!925589))

(assert (= (and b!925589 res!623732) b!925602))

(assert (= (and b!925602 res!623728) b!925603))

(assert (= (and b!925603 c!96570) b!925595))

(assert (= (and b!925603 (not c!96570)) b!925598))

(assert (= (and b!925595 c!96569) b!925599))

(assert (= (and b!925595 (not c!96569)) b!925590))

(assert (= (and b!925599 c!96571) b!925596))

(assert (= (and b!925599 (not c!96571)) b!925604))

(assert (= (and b!925603 res!623727) b!925587))

(assert (= (and b!925587 res!623724) b!925594))

(assert (= (and b!925594 res!623723) b!925591))

(assert (= (and b!925591 res!623722) b!925605))

(assert (= (and b!925601 condMapEmpty!31377) mapIsEmpty!31377))

(assert (= (and b!925601 (not condMapEmpty!31377)) mapNonEmpty!31377))

(get-info :version)

(assert (= (and mapNonEmpty!31377 ((_ is ValueCellFull!9392) mapValue!31377)) b!925592))

(assert (= (and b!925601 ((_ is ValueCellFull!9392) mapDefault!31377)) b!925600))

(assert (= start!79008 b!925601))

(declare-fun b_lambda!13723 () Bool)

(assert (=> (not b_lambda!13723) (not b!925599)))

(declare-fun t!26735 () Bool)

(declare-fun tb!5811 () Bool)

(assert (=> (and start!79008 (= defaultEntry!1235 defaultEntry!1235) t!26735) tb!5811))

(declare-fun result!11453 () Bool)

(assert (=> tb!5811 (= result!11453 tp_is_empty!19747)))

(assert (=> b!925599 t!26735))

(declare-fun b_and!28191 () Bool)

(assert (= b_and!28189 (and (=> t!26735 result!11453) b_and!28191)))

(declare-fun m!859537 () Bool)

(assert (=> b!925587 m!859537))

(declare-fun m!859539 () Bool)

(assert (=> b!925587 m!859539))

(declare-fun m!859541 () Bool)

(assert (=> b!925599 m!859541))

(declare-fun m!859543 () Bool)

(assert (=> b!925599 m!859543))

(declare-fun m!859545 () Bool)

(assert (=> b!925599 m!859545))

(declare-fun m!859547 () Bool)

(assert (=> b!925599 m!859547))

(declare-fun m!859549 () Bool)

(assert (=> b!925599 m!859549))

(declare-fun m!859551 () Bool)

(assert (=> b!925599 m!859551))

(declare-fun m!859553 () Bool)

(assert (=> b!925599 m!859553))

(declare-fun m!859555 () Bool)

(assert (=> b!925599 m!859555))

(assert (=> b!925599 m!859549))

(assert (=> b!925599 m!859551))

(declare-fun m!859557 () Bool)

(assert (=> b!925599 m!859557))

(assert (=> b!925599 m!859539))

(declare-fun m!859559 () Bool)

(assert (=> b!925599 m!859559))

(declare-fun m!859561 () Bool)

(assert (=> b!925599 m!859561))

(declare-fun m!859563 () Bool)

(assert (=> b!925599 m!859563))

(declare-fun m!859565 () Bool)

(assert (=> b!925599 m!859565))

(declare-fun m!859567 () Bool)

(assert (=> b!925599 m!859567))

(assert (=> b!925599 m!859563))

(declare-fun m!859569 () Bool)

(assert (=> b!925599 m!859569))

(declare-fun m!859571 () Bool)

(assert (=> b!925596 m!859571))

(declare-fun m!859573 () Bool)

(assert (=> b!925597 m!859573))

(declare-fun m!859575 () Bool)

(assert (=> b!925591 m!859575))

(declare-fun m!859577 () Bool)

(assert (=> b!925591 m!859577))

(declare-fun m!859579 () Bool)

(assert (=> b!925591 m!859579))

(declare-fun m!859581 () Bool)

(assert (=> b!925594 m!859581))

(declare-fun m!859583 () Bool)

(assert (=> b!925586 m!859583))

(declare-fun m!859585 () Bool)

(assert (=> mapNonEmpty!31377 m!859585))

(declare-fun m!859587 () Bool)

(assert (=> b!925603 m!859587))

(declare-fun m!859589 () Bool)

(assert (=> b!925602 m!859589))

(declare-fun m!859591 () Bool)

(assert (=> b!925589 m!859591))

(declare-fun m!859593 () Bool)

(assert (=> b!925589 m!859593))

(declare-fun m!859595 () Bool)

(assert (=> b!925605 m!859595))

(declare-fun m!859597 () Bool)

(assert (=> b!925595 m!859597))

(declare-fun m!859599 () Bool)

(assert (=> b!925595 m!859599))

(declare-fun m!859601 () Bool)

(assert (=> start!79008 m!859601))

(declare-fun m!859603 () Bool)

(assert (=> start!79008 m!859603))

(declare-fun m!859605 () Bool)

(assert (=> start!79008 m!859605))

(check-sat (not b!925587) (not b_lambda!13723) (not b!925589) (not b!925597) (not b!925591) (not b!925586) (not b!925595) (not mapNonEmpty!31377) (not b!925603) (not b!925605) b_and!28191 (not b!925594) (not b_next!17239) (not start!79008) tp_is_empty!19747 (not b!925596) (not b!925602) (not b!925599))
(check-sat b_and!28191 (not b_next!17239))
