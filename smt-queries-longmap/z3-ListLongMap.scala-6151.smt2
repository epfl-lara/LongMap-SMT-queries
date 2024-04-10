; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79016 () Bool)

(assert start!79016)

(declare-fun b_free!17229 () Bool)

(declare-fun b_next!17229 () Bool)

(assert (=> start!79016 (= b_free!17229 (not b_next!17229))))

(declare-fun tp!60127 () Bool)

(declare-fun b_and!28195 () Bool)

(assert (=> start!79016 (= tp!60127 b_and!28195)))

(declare-fun mapIsEmpty!31362 () Bool)

(declare-fun mapRes!31362 () Bool)

(assert (=> mapIsEmpty!31362 mapRes!31362))

(declare-fun b!925515 () Bool)

(declare-fun e!519459 () Bool)

(declare-fun e!519460 () Bool)

(assert (=> b!925515 (= e!519459 e!519460)))

(declare-fun res!623669 () Bool)

(assert (=> b!925515 (=> (not res!623669) (not e!519460))))

(declare-datatypes ((V!31281 0))(
  ( (V!31282 (val!9919 Int)) )
))
(declare-datatypes ((tuple2!12934 0))(
  ( (tuple2!12935 (_1!6478 (_ BitVec 64)) (_2!6478 V!31281)) )
))
(declare-datatypes ((List!18736 0))(
  ( (Nil!18733) (Cons!18732 (h!19878 tuple2!12934) (t!26695 List!18736)) )
))
(declare-datatypes ((ListLongMap!11631 0))(
  ( (ListLongMap!11632 (toList!5831 List!18736)) )
))
(declare-fun lt!416533 () ListLongMap!11631)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4891 (ListLongMap!11631 (_ BitVec 64)) Bool)

(assert (=> b!925515 (= res!623669 (contains!4891 lt!416533 k0!1099))))

(declare-datatypes ((array!55442 0))(
  ( (array!55443 (arr!26666 (Array (_ BitVec 32) (_ BitVec 64))) (size!27125 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55442)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9387 0))(
  ( (ValueCellFull!9387 (v!12437 V!31281)) (EmptyCell!9387) )
))
(declare-datatypes ((array!55444 0))(
  ( (array!55445 (arr!26667 (Array (_ BitVec 32) ValueCell!9387)) (size!27126 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55444)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31281)

(declare-fun minValue!1173 () V!31281)

(declare-fun getCurrentListMap!3082 (array!55442 array!55444 (_ BitVec 32) (_ BitVec 32) V!31281 V!31281 (_ BitVec 32) Int) ListLongMap!11631)

(assert (=> b!925515 (= lt!416533 (getCurrentListMap!3082 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!623677 () Bool)

(declare-fun e!519448 () Bool)

(assert (=> start!79016 (=> (not res!623677) (not e!519448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79016 (= res!623677 (validMask!0 mask!1881))))

(assert (=> start!79016 e!519448))

(assert (=> start!79016 true))

(declare-fun tp_is_empty!19737 () Bool)

(assert (=> start!79016 tp_is_empty!19737))

(declare-fun e!519457 () Bool)

(declare-fun array_inv!20770 (array!55444) Bool)

(assert (=> start!79016 (and (array_inv!20770 _values!1231) e!519457)))

(assert (=> start!79016 tp!60127))

(declare-fun array_inv!20771 (array!55442) Bool)

(assert (=> start!79016 (array_inv!20771 _keys!1487)))

(declare-fun e!519453 () Bool)

(declare-fun b!925516 () Bool)

(declare-fun arrayContainsKey!0 (array!55442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925516 (= e!519453 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!925517 () Bool)

(declare-fun res!623670 () Bool)

(assert (=> b!925517 (=> (not res!623670) (not e!519448))))

(assert (=> b!925517 (= res!623670 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27125 _keys!1487))))))

(declare-fun b!925518 () Bool)

(declare-fun res!623667 () Bool)

(assert (=> b!925518 (=> (not res!623667) (not e!519460))))

(declare-fun v!791 () V!31281)

(declare-fun apply!661 (ListLongMap!11631 (_ BitVec 64)) V!31281)

(assert (=> b!925518 (= res!623667 (= (apply!661 lt!416533 k0!1099) v!791))))

(declare-fun b!925519 () Bool)

(assert (=> b!925519 (= e!519460 (not true))))

(declare-fun e!519456 () Bool)

(assert (=> b!925519 e!519456))

(declare-fun res!623671 () Bool)

(assert (=> b!925519 (=> (not res!623671) (not e!519456))))

(declare-fun lt!416532 () ListLongMap!11631)

(assert (=> b!925519 (= res!623671 (contains!4891 lt!416532 k0!1099))))

(assert (=> b!925519 (= lt!416532 (getCurrentListMap!3082 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-datatypes ((Unit!31273 0))(
  ( (Unit!31274) )
))
(declare-fun lt!416525 () Unit!31273)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!71 (array!55442 array!55444 (_ BitVec 32) (_ BitVec 32) V!31281 V!31281 (_ BitVec 64) V!31281 (_ BitVec 32) Int) Unit!31273)

(assert (=> b!925519 (= lt!416525 (lemmaListMapApplyFromThenApplyFromZero!71 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925520 () Bool)

(declare-fun e!519451 () Bool)

(assert (=> b!925520 (= e!519451 e!519459)))

(declare-fun res!623673 () Bool)

(assert (=> b!925520 (=> (not res!623673) (not e!519459))))

(assert (=> b!925520 (= res!623673 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27125 _keys!1487)))))

(declare-fun lt!416531 () Unit!31273)

(declare-fun e!519454 () Unit!31273)

(assert (=> b!925520 (= lt!416531 e!519454)))

(declare-fun c!96589 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925520 (= c!96589 (validKeyInArray!0 k0!1099))))

(declare-fun b!925521 () Bool)

(declare-fun res!623672 () Bool)

(assert (=> b!925521 (=> (not res!623672) (not e!519448))))

(assert (=> b!925521 (= res!623672 (and (= (size!27126 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27125 _keys!1487) (size!27126 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925522 () Bool)

(assert (=> b!925522 (= e!519453 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925523 () Bool)

(assert (=> b!925523 (= e!519456 (= (apply!661 lt!416532 k0!1099) v!791))))

(declare-fun b!925524 () Bool)

(declare-fun e!519452 () Bool)

(assert (=> b!925524 (= e!519452 tp_is_empty!19737)))

(declare-fun b!925525 () Bool)

(declare-fun Unit!31275 () Unit!31273)

(assert (=> b!925525 (= e!519454 Unit!31275)))

(declare-fun b!925526 () Bool)

(declare-fun e!519450 () Bool)

(assert (=> b!925526 (= e!519448 e!519450)))

(declare-fun res!623676 () Bool)

(assert (=> b!925526 (=> (not res!623676) (not e!519450))))

(declare-fun lt!416521 () ListLongMap!11631)

(assert (=> b!925526 (= res!623676 (contains!4891 lt!416521 k0!1099))))

(assert (=> b!925526 (= lt!416521 (getCurrentListMap!3082 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925527 () Bool)

(declare-fun res!623668 () Bool)

(assert (=> b!925527 (=> (not res!623668) (not e!519448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55442 (_ BitVec 32)) Bool)

(assert (=> b!925527 (= res!623668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925528 () Bool)

(declare-fun lt!416529 () ListLongMap!11631)

(declare-fun lt!416534 () V!31281)

(assert (=> b!925528 (= (apply!661 lt!416529 k0!1099) lt!416534)))

(declare-fun lt!416523 () Unit!31273)

(declare-fun lt!416524 () V!31281)

(declare-fun lt!416528 () (_ BitVec 64))

(declare-fun addApplyDifferent!382 (ListLongMap!11631 (_ BitVec 64) V!31281 (_ BitVec 64)) Unit!31273)

(assert (=> b!925528 (= lt!416523 (addApplyDifferent!382 lt!416521 lt!416528 lt!416524 k0!1099))))

(assert (=> b!925528 (not (= lt!416528 k0!1099))))

(declare-fun lt!416526 () Unit!31273)

(declare-datatypes ((List!18737 0))(
  ( (Nil!18734) (Cons!18733 (h!19879 (_ BitVec 64)) (t!26696 List!18737)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55442 (_ BitVec 64) (_ BitVec 32) List!18737) Unit!31273)

(assert (=> b!925528 (= lt!416526 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18734))))

(assert (=> b!925528 e!519453))

(declare-fun c!96591 () Bool)

(assert (=> b!925528 (= c!96591 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416535 () Unit!31273)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!233 (array!55442 array!55444 (_ BitVec 32) (_ BitVec 32) V!31281 V!31281 (_ BitVec 64) (_ BitVec 32) Int) Unit!31273)

(assert (=> b!925528 (= lt!416535 (lemmaListMapContainsThenArrayContainsFrom!233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55442 (_ BitVec 32) List!18737) Bool)

(assert (=> b!925528 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18734)))

(declare-fun lt!416536 () Unit!31273)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55442 (_ BitVec 32) (_ BitVec 32)) Unit!31273)

(assert (=> b!925528 (= lt!416536 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925528 (contains!4891 lt!416529 k0!1099)))

(declare-fun lt!416522 () tuple2!12934)

(declare-fun +!2726 (ListLongMap!11631 tuple2!12934) ListLongMap!11631)

(assert (=> b!925528 (= lt!416529 (+!2726 lt!416521 lt!416522))))

(declare-fun lt!416530 () Unit!31273)

(declare-fun addStillContains!450 (ListLongMap!11631 (_ BitVec 64) V!31281 (_ BitVec 64)) Unit!31273)

(assert (=> b!925528 (= lt!416530 (addStillContains!450 lt!416521 lt!416528 lt!416524 k0!1099))))

(assert (=> b!925528 (= (getCurrentListMap!3082 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2726 (getCurrentListMap!3082 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416522))))

(assert (=> b!925528 (= lt!416522 (tuple2!12935 lt!416528 lt!416524))))

(declare-fun get!14025 (ValueCell!9387 V!31281) V!31281)

(declare-fun dynLambda!1515 (Int (_ BitVec 64)) V!31281)

(assert (=> b!925528 (= lt!416524 (get!14025 (select (arr!26667 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1515 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416527 () Unit!31273)

(declare-fun lemmaListMapRecursiveValidKeyArray!116 (array!55442 array!55444 (_ BitVec 32) (_ BitVec 32) V!31281 V!31281 (_ BitVec 32) Int) Unit!31273)

(assert (=> b!925528 (= lt!416527 (lemmaListMapRecursiveValidKeyArray!116 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!519449 () Unit!31273)

(assert (=> b!925528 (= e!519449 lt!416523)))

(declare-fun b!925529 () Bool)

(declare-fun res!623675 () Bool)

(assert (=> b!925529 (=> (not res!623675) (not e!519448))))

(assert (=> b!925529 (= res!623675 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18734))))

(declare-fun b!925530 () Bool)

(declare-fun Unit!31276 () Unit!31273)

(assert (=> b!925530 (= e!519449 Unit!31276)))

(declare-fun mapNonEmpty!31362 () Bool)

(declare-fun tp!60128 () Bool)

(declare-fun e!519455 () Bool)

(assert (=> mapNonEmpty!31362 (= mapRes!31362 (and tp!60128 e!519455))))

(declare-fun mapRest!31362 () (Array (_ BitVec 32) ValueCell!9387))

(declare-fun mapKey!31362 () (_ BitVec 32))

(declare-fun mapValue!31362 () ValueCell!9387)

(assert (=> mapNonEmpty!31362 (= (arr!26667 _values!1231) (store mapRest!31362 mapKey!31362 mapValue!31362))))

(declare-fun b!925531 () Bool)

(assert (=> b!925531 (= e!519454 e!519449)))

(assert (=> b!925531 (= lt!416528 (select (arr!26666 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96590 () Bool)

(assert (=> b!925531 (= c!96590 (validKeyInArray!0 lt!416528))))

(declare-fun b!925532 () Bool)

(assert (=> b!925532 (= e!519450 e!519451)))

(declare-fun res!623674 () Bool)

(assert (=> b!925532 (=> (not res!623674) (not e!519451))))

(assert (=> b!925532 (= res!623674 (and (= lt!416534 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925532 (= lt!416534 (apply!661 lt!416521 k0!1099))))

(declare-fun b!925533 () Bool)

(assert (=> b!925533 (= e!519457 (and e!519452 mapRes!31362))))

(declare-fun condMapEmpty!31362 () Bool)

(declare-fun mapDefault!31362 () ValueCell!9387)

(assert (=> b!925533 (= condMapEmpty!31362 (= (arr!26667 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9387)) mapDefault!31362)))))

(declare-fun b!925534 () Bool)

(assert (=> b!925534 (= e!519455 tp_is_empty!19737)))

(assert (= (and start!79016 res!623677) b!925521))

(assert (= (and b!925521 res!623672) b!925527))

(assert (= (and b!925527 res!623668) b!925529))

(assert (= (and b!925529 res!623675) b!925517))

(assert (= (and b!925517 res!623670) b!925526))

(assert (= (and b!925526 res!623676) b!925532))

(assert (= (and b!925532 res!623674) b!925520))

(assert (= (and b!925520 c!96589) b!925531))

(assert (= (and b!925520 (not c!96589)) b!925525))

(assert (= (and b!925531 c!96590) b!925528))

(assert (= (and b!925531 (not c!96590)) b!925530))

(assert (= (and b!925528 c!96591) b!925516))

(assert (= (and b!925528 (not c!96591)) b!925522))

(assert (= (and b!925520 res!623673) b!925515))

(assert (= (and b!925515 res!623669) b!925518))

(assert (= (and b!925518 res!623667) b!925519))

(assert (= (and b!925519 res!623671) b!925523))

(assert (= (and b!925533 condMapEmpty!31362) mapIsEmpty!31362))

(assert (= (and b!925533 (not condMapEmpty!31362)) mapNonEmpty!31362))

(get-info :version)

(assert (= (and mapNonEmpty!31362 ((_ is ValueCellFull!9387) mapValue!31362)) b!925534))

(assert (= (and b!925533 ((_ is ValueCellFull!9387) mapDefault!31362)) b!925524))

(assert (= start!79016 b!925533))

(declare-fun b_lambda!13731 () Bool)

(assert (=> (not b_lambda!13731) (not b!925528)))

(declare-fun t!26694 () Bool)

(declare-fun tb!5809 () Bool)

(assert (=> (and start!79016 (= defaultEntry!1235 defaultEntry!1235) t!26694) tb!5809))

(declare-fun result!11441 () Bool)

(assert (=> tb!5809 (= result!11441 tp_is_empty!19737)))

(assert (=> b!925528 t!26694))

(declare-fun b_and!28197 () Bool)

(assert (= b_and!28195 (and (=> t!26694 result!11441) b_and!28197)))

(declare-fun m!859945 () Bool)

(assert (=> b!925523 m!859945))

(declare-fun m!859947 () Bool)

(assert (=> b!925520 m!859947))

(declare-fun m!859949 () Bool)

(assert (=> b!925531 m!859949))

(declare-fun m!859951 () Bool)

(assert (=> b!925531 m!859951))

(declare-fun m!859953 () Bool)

(assert (=> b!925516 m!859953))

(declare-fun m!859955 () Bool)

(assert (=> b!925529 m!859955))

(declare-fun m!859957 () Bool)

(assert (=> b!925528 m!859957))

(declare-fun m!859959 () Bool)

(assert (=> b!925528 m!859959))

(declare-fun m!859961 () Bool)

(assert (=> b!925528 m!859961))

(declare-fun m!859963 () Bool)

(assert (=> b!925528 m!859963))

(declare-fun m!859965 () Bool)

(assert (=> b!925528 m!859965))

(declare-fun m!859967 () Bool)

(assert (=> b!925528 m!859967))

(assert (=> b!925528 m!859963))

(assert (=> b!925528 m!859965))

(declare-fun m!859969 () Bool)

(assert (=> b!925528 m!859969))

(declare-fun m!859971 () Bool)

(assert (=> b!925528 m!859971))

(declare-fun m!859973 () Bool)

(assert (=> b!925528 m!859973))

(declare-fun m!859975 () Bool)

(assert (=> b!925528 m!859975))

(declare-fun m!859977 () Bool)

(assert (=> b!925528 m!859977))

(declare-fun m!859979 () Bool)

(assert (=> b!925528 m!859979))

(declare-fun m!859981 () Bool)

(assert (=> b!925528 m!859981))

(declare-fun m!859983 () Bool)

(assert (=> b!925528 m!859983))

(declare-fun m!859985 () Bool)

(assert (=> b!925528 m!859985))

(assert (=> b!925528 m!859977))

(declare-fun m!859987 () Bool)

(assert (=> b!925528 m!859987))

(declare-fun m!859989 () Bool)

(assert (=> b!925518 m!859989))

(declare-fun m!859991 () Bool)

(assert (=> b!925527 m!859991))

(declare-fun m!859993 () Bool)

(assert (=> b!925532 m!859993))

(declare-fun m!859995 () Bool)

(assert (=> start!79016 m!859995))

(declare-fun m!859997 () Bool)

(assert (=> start!79016 m!859997))

(declare-fun m!859999 () Bool)

(assert (=> start!79016 m!859999))

(declare-fun m!860001 () Bool)

(assert (=> b!925526 m!860001))

(declare-fun m!860003 () Bool)

(assert (=> b!925526 m!860003))

(declare-fun m!860005 () Bool)

(assert (=> b!925515 m!860005))

(assert (=> b!925515 m!859981))

(declare-fun m!860007 () Bool)

(assert (=> b!925519 m!860007))

(declare-fun m!860009 () Bool)

(assert (=> b!925519 m!860009))

(declare-fun m!860011 () Bool)

(assert (=> b!925519 m!860011))

(declare-fun m!860013 () Bool)

(assert (=> mapNonEmpty!31362 m!860013))

(check-sat b_and!28197 (not mapNonEmpty!31362) (not b_lambda!13731) (not start!79016) (not b!925527) (not b!925520) (not b!925516) (not b!925528) (not b!925519) (not b!925526) (not b!925523) (not b!925531) (not b_next!17229) tp_is_empty!19737 (not b!925518) (not b!925515) (not b!925529) (not b!925532))
(check-sat b_and!28197 (not b_next!17229))
