; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79784 () Bool)

(assert start!79784)

(declare-fun b_free!17757 () Bool)

(declare-fun b_next!17757 () Bool)

(assert (=> start!79784 (= b_free!17757 (not b_next!17757))))

(declare-fun tp!61731 () Bool)

(declare-fun b_and!29129 () Bool)

(assert (=> start!79784 (= tp!61731 b_and!29129)))

(declare-fun b!938441 () Bool)

(declare-fun res!631400 () Bool)

(declare-fun e!527038 () Bool)

(assert (=> b!938441 (=> (not res!631400) (not e!527038))))

(declare-datatypes ((array!56472 0))(
  ( (array!56473 (arr!27175 (Array (_ BitVec 32) (_ BitVec 64))) (size!27634 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56472)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56472 (_ BitVec 32)) Bool)

(assert (=> b!938441 (= res!631400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!938442 () Bool)

(declare-fun e!527042 () Bool)

(declare-fun e!527045 () Bool)

(assert (=> b!938442 (= e!527042 e!527045)))

(declare-fun res!631404 () Bool)

(assert (=> b!938442 (=> (not res!631404) (not e!527045))))

(declare-datatypes ((V!31985 0))(
  ( (V!31986 (val!10183 Int)) )
))
(declare-datatypes ((tuple2!13382 0))(
  ( (tuple2!13383 (_1!6702 (_ BitVec 64)) (_2!6702 V!31985)) )
))
(declare-datatypes ((List!19159 0))(
  ( (Nil!19156) (Cons!19155 (h!20301 tuple2!13382) (t!27460 List!19159)) )
))
(declare-datatypes ((ListLongMap!12079 0))(
  ( (ListLongMap!12080 (toList!6055 List!19159)) )
))
(declare-fun lt!423776 () ListLongMap!12079)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5115 (ListLongMap!12079 (_ BitVec 64)) Bool)

(assert (=> b!938442 (= res!631404 (contains!5115 lt!423776 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9651 0))(
  ( (ValueCellFull!9651 (v!12711 V!31985)) (EmptyCell!9651) )
))
(declare-datatypes ((array!56474 0))(
  ( (array!56475 (arr!27176 (Array (_ BitVec 32) ValueCell!9651)) (size!27635 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56474)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31985)

(declare-fun minValue!1173 () V!31985)

(declare-fun getCurrentListMap!3289 (array!56472 array!56474 (_ BitVec 32) (_ BitVec 32) V!31985 V!31985 (_ BitVec 32) Int) ListLongMap!12079)

(assert (=> b!938442 (= lt!423776 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!938443 () Bool)

(declare-fun res!631401 () Bool)

(assert (=> b!938443 (=> (not res!631401) (not e!527038))))

(declare-datatypes ((List!19160 0))(
  ( (Nil!19157) (Cons!19156 (h!20302 (_ BitVec 64)) (t!27461 List!19160)) )
))
(declare-fun arrayNoDuplicates!0 (array!56472 (_ BitVec 32) List!19160) Bool)

(assert (=> b!938443 (= res!631401 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19157))))

(declare-fun res!631408 () Bool)

(assert (=> start!79784 (=> (not res!631408) (not e!527038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79784 (= res!631408 (validMask!0 mask!1881))))

(assert (=> start!79784 e!527038))

(assert (=> start!79784 true))

(declare-fun tp_is_empty!20265 () Bool)

(assert (=> start!79784 tp_is_empty!20265))

(declare-fun e!527040 () Bool)

(declare-fun array_inv!21138 (array!56474) Bool)

(assert (=> start!79784 (and (array_inv!21138 _values!1231) e!527040)))

(assert (=> start!79784 tp!61731))

(declare-fun array_inv!21139 (array!56472) Bool)

(assert (=> start!79784 (array_inv!21139 _keys!1487)))

(declare-fun mapNonEmpty!32173 () Bool)

(declare-fun mapRes!32173 () Bool)

(declare-fun tp!61730 () Bool)

(declare-fun e!527043 () Bool)

(assert (=> mapNonEmpty!32173 (= mapRes!32173 (and tp!61730 e!527043))))

(declare-fun mapValue!32173 () ValueCell!9651)

(declare-fun mapKey!32173 () (_ BitVec 32))

(declare-fun mapRest!32173 () (Array (_ BitVec 32) ValueCell!9651))

(assert (=> mapNonEmpty!32173 (= (arr!27176 _values!1231) (store mapRest!32173 mapKey!32173 mapValue!32173))))

(declare-fun b!938444 () Bool)

(declare-fun e!527035 () Bool)

(assert (=> b!938444 (= e!527035 e!527042)))

(declare-fun res!631405 () Bool)

(assert (=> b!938444 (=> (not res!631405) (not e!527042))))

(assert (=> b!938444 (= res!631405 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(declare-datatypes ((Unit!31700 0))(
  ( (Unit!31701) )
))
(declare-fun lt!423781 () Unit!31700)

(declare-fun e!527046 () Unit!31700)

(assert (=> b!938444 (= lt!423781 e!527046)))

(declare-fun c!97799 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!938444 (= c!97799 (validKeyInArray!0 k0!1099))))

(declare-fun b!938445 () Bool)

(declare-fun e!527039 () Bool)

(assert (=> b!938445 (= e!527039 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!938446 () Bool)

(declare-fun res!631403 () Bool)

(assert (=> b!938446 (=> (not res!631403) (not e!527038))))

(assert (=> b!938446 (= res!631403 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27634 _keys!1487))))))

(declare-fun b!938447 () Bool)

(declare-fun arrayContainsKey!0 (array!56472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!938447 (= e!527039 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!938448 () Bool)

(assert (=> b!938448 (= e!527043 tp_is_empty!20265)))

(declare-fun b!938449 () Bool)

(declare-fun res!631407 () Bool)

(assert (=> b!938449 (=> (not res!631407) (not e!527038))))

(assert (=> b!938449 (= res!631407 (and (= (size!27635 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27634 _keys!1487) (size!27635 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!938450 () Bool)

(declare-fun e!527041 () Unit!31700)

(declare-fun Unit!31702 () Unit!31700)

(assert (=> b!938450 (= e!527041 Unit!31702)))

(declare-fun b!938451 () Bool)

(declare-fun e!527044 () Bool)

(assert (=> b!938451 (= e!527040 (and e!527044 mapRes!32173))))

(declare-fun condMapEmpty!32173 () Bool)

(declare-fun mapDefault!32173 () ValueCell!9651)

(assert (=> b!938451 (= condMapEmpty!32173 (= (arr!27176 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9651)) mapDefault!32173)))))

(declare-fun b!938452 () Bool)

(declare-fun e!527036 () Bool)

(assert (=> b!938452 (= e!527036 e!527035)))

(declare-fun res!631406 () Bool)

(assert (=> b!938452 (=> (not res!631406) (not e!527035))))

(declare-fun v!791 () V!31985)

(declare-fun lt!423779 () V!31985)

(assert (=> b!938452 (= res!631406 (and (= lt!423779 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!423783 () ListLongMap!12079)

(declare-fun apply!856 (ListLongMap!12079 (_ BitVec 64)) V!31985)

(assert (=> b!938452 (= lt!423779 (apply!856 lt!423783 k0!1099))))

(declare-fun b!938453 () Bool)

(assert (=> b!938453 (= e!527046 e!527041)))

(declare-fun lt!423788 () (_ BitVec 64))

(assert (=> b!938453 (= lt!423788 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97798 () Bool)

(assert (=> b!938453 (= c!97798 (validKeyInArray!0 lt!423788))))

(declare-fun b!938454 () Bool)

(assert (=> b!938454 (= e!527038 e!527036)))

(declare-fun res!631402 () Bool)

(assert (=> b!938454 (=> (not res!631402) (not e!527036))))

(assert (=> b!938454 (= res!631402 (contains!5115 lt!423783 k0!1099))))

(assert (=> b!938454 (= lt!423783 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!938455 () Bool)

(assert (=> b!938455 (= e!527044 tp_is_empty!20265)))

(declare-fun b!938456 () Bool)

(assert (=> b!938456 (= e!527045 (not (= (apply!856 lt!423776 k0!1099) v!791)))))

(declare-fun b!938457 () Bool)

(declare-fun lt!423784 () ListLongMap!12079)

(assert (=> b!938457 (= (apply!856 lt!423784 k0!1099) lt!423779)))

(declare-fun lt!423778 () V!31985)

(declare-fun lt!423777 () Unit!31700)

(declare-fun addApplyDifferent!441 (ListLongMap!12079 (_ BitVec 64) V!31985 (_ BitVec 64)) Unit!31700)

(assert (=> b!938457 (= lt!423777 (addApplyDifferent!441 lt!423783 lt!423788 lt!423778 k0!1099))))

(assert (=> b!938457 (not (= lt!423788 k0!1099))))

(declare-fun lt!423786 () Unit!31700)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56472 (_ BitVec 64) (_ BitVec 32) List!19160) Unit!31700)

(assert (=> b!938457 (= lt!423786 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19157))))

(assert (=> b!938457 e!527039))

(declare-fun c!97797 () Bool)

(assert (=> b!938457 (= c!97797 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423785 () Unit!31700)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!314 (array!56472 array!56474 (_ BitVec 32) (_ BitVec 32) V!31985 V!31985 (_ BitVec 64) (_ BitVec 32) Int) Unit!31700)

(assert (=> b!938457 (= lt!423785 (lemmaListMapContainsThenArrayContainsFrom!314 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!938457 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19157)))

(declare-fun lt!423780 () Unit!31700)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56472 (_ BitVec 32) (_ BitVec 32)) Unit!31700)

(assert (=> b!938457 (= lt!423780 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!938457 (contains!5115 lt!423784 k0!1099)))

(declare-fun lt!423782 () tuple2!13382)

(declare-fun +!2842 (ListLongMap!12079 tuple2!13382) ListLongMap!12079)

(assert (=> b!938457 (= lt!423784 (+!2842 lt!423783 lt!423782))))

(declare-fun lt!423789 () Unit!31700)

(declare-fun addStillContains!561 (ListLongMap!12079 (_ BitVec 64) V!31985 (_ BitVec 64)) Unit!31700)

(assert (=> b!938457 (= lt!423789 (addStillContains!561 lt!423783 lt!423788 lt!423778 k0!1099))))

(assert (=> b!938457 (= (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2842 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423782))))

(assert (=> b!938457 (= lt!423782 (tuple2!13383 lt!423788 lt!423778))))

(declare-fun get!14335 (ValueCell!9651 V!31985) V!31985)

(declare-fun dynLambda!1631 (Int (_ BitVec 64)) V!31985)

(assert (=> b!938457 (= lt!423778 (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423787 () Unit!31700)

(declare-fun lemmaListMapRecursiveValidKeyArray!232 (array!56472 array!56474 (_ BitVec 32) (_ BitVec 32) V!31985 V!31985 (_ BitVec 32) Int) Unit!31700)

(assert (=> b!938457 (= lt!423787 (lemmaListMapRecursiveValidKeyArray!232 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!938457 (= e!527041 lt!423777)))

(declare-fun mapIsEmpty!32173 () Bool)

(assert (=> mapIsEmpty!32173 mapRes!32173))

(declare-fun b!938458 () Bool)

(declare-fun Unit!31703 () Unit!31700)

(assert (=> b!938458 (= e!527046 Unit!31703)))

(assert (= (and start!79784 res!631408) b!938449))

(assert (= (and b!938449 res!631407) b!938441))

(assert (= (and b!938441 res!631400) b!938443))

(assert (= (and b!938443 res!631401) b!938446))

(assert (= (and b!938446 res!631403) b!938454))

(assert (= (and b!938454 res!631402) b!938452))

(assert (= (and b!938452 res!631406) b!938444))

(assert (= (and b!938444 c!97799) b!938453))

(assert (= (and b!938444 (not c!97799)) b!938458))

(assert (= (and b!938453 c!97798) b!938457))

(assert (= (and b!938453 (not c!97798)) b!938450))

(assert (= (and b!938457 c!97797) b!938447))

(assert (= (and b!938457 (not c!97797)) b!938445))

(assert (= (and b!938444 res!631405) b!938442))

(assert (= (and b!938442 res!631404) b!938456))

(assert (= (and b!938451 condMapEmpty!32173) mapIsEmpty!32173))

(assert (= (and b!938451 (not condMapEmpty!32173)) mapNonEmpty!32173))

(get-info :version)

(assert (= (and mapNonEmpty!32173 ((_ is ValueCellFull!9651) mapValue!32173)) b!938448))

(assert (= (and b!938451 ((_ is ValueCellFull!9651) mapDefault!32173)) b!938455))

(assert (= start!79784 b!938451))

(declare-fun b_lambda!14213 () Bool)

(assert (=> (not b_lambda!14213) (not b!938457)))

(declare-fun t!27459 () Bool)

(declare-fun tb!6151 () Bool)

(assert (=> (and start!79784 (= defaultEntry!1235 defaultEntry!1235) t!27459) tb!6151))

(declare-fun result!12137 () Bool)

(assert (=> tb!6151 (= result!12137 tp_is_empty!20265)))

(assert (=> b!938457 t!27459))

(declare-fun b_and!29131 () Bool)

(assert (= b_and!29129 (and (=> t!27459 result!12137) b_and!29131)))

(declare-fun m!873757 () Bool)

(assert (=> b!938453 m!873757))

(declare-fun m!873759 () Bool)

(assert (=> b!938453 m!873759))

(declare-fun m!873761 () Bool)

(assert (=> b!938457 m!873761))

(declare-fun m!873763 () Bool)

(assert (=> b!938457 m!873763))

(declare-fun m!873765 () Bool)

(assert (=> b!938457 m!873765))

(declare-fun m!873767 () Bool)

(assert (=> b!938457 m!873767))

(declare-fun m!873769 () Bool)

(assert (=> b!938457 m!873769))

(declare-fun m!873771 () Bool)

(assert (=> b!938457 m!873771))

(declare-fun m!873773 () Bool)

(assert (=> b!938457 m!873773))

(declare-fun m!873775 () Bool)

(assert (=> b!938457 m!873775))

(assert (=> b!938457 m!873767))

(assert (=> b!938457 m!873771))

(declare-fun m!873777 () Bool)

(assert (=> b!938457 m!873777))

(declare-fun m!873779 () Bool)

(assert (=> b!938457 m!873779))

(declare-fun m!873781 () Bool)

(assert (=> b!938457 m!873781))

(declare-fun m!873783 () Bool)

(assert (=> b!938457 m!873783))

(declare-fun m!873785 () Bool)

(assert (=> b!938457 m!873785))

(declare-fun m!873787 () Bool)

(assert (=> b!938457 m!873787))

(declare-fun m!873789 () Bool)

(assert (=> b!938457 m!873789))

(assert (=> b!938457 m!873773))

(declare-fun m!873791 () Bool)

(assert (=> b!938457 m!873791))

(declare-fun m!873793 () Bool)

(assert (=> b!938444 m!873793))

(declare-fun m!873795 () Bool)

(assert (=> start!79784 m!873795))

(declare-fun m!873797 () Bool)

(assert (=> start!79784 m!873797))

(declare-fun m!873799 () Bool)

(assert (=> start!79784 m!873799))

(declare-fun m!873801 () Bool)

(assert (=> b!938441 m!873801))

(declare-fun m!873803 () Bool)

(assert (=> b!938454 m!873803))

(declare-fun m!873805 () Bool)

(assert (=> b!938454 m!873805))

(declare-fun m!873807 () Bool)

(assert (=> mapNonEmpty!32173 m!873807))

(declare-fun m!873809 () Bool)

(assert (=> b!938456 m!873809))

(declare-fun m!873811 () Bool)

(assert (=> b!938442 m!873811))

(assert (=> b!938442 m!873789))

(declare-fun m!873813 () Bool)

(assert (=> b!938447 m!873813))

(declare-fun m!873815 () Bool)

(assert (=> b!938443 m!873815))

(declare-fun m!873817 () Bool)

(assert (=> b!938452 m!873817))

(check-sat (not b!938452) (not b!938443) (not b_lambda!14213) (not b!938453) (not b!938447) (not b!938444) b_and!29131 (not start!79784) (not b!938454) tp_is_empty!20265 (not mapNonEmpty!32173) (not b!938442) (not b_next!17757) (not b!938457) (not b!938441) (not b!938456))
(check-sat b_and!29131 (not b_next!17757))
(get-model)

(declare-fun b_lambda!14217 () Bool)

(assert (= b_lambda!14213 (or (and start!79784 b_free!17757) b_lambda!14217)))

(check-sat (not b!938452) (not b!938443) (not b!938453) (not b!938447) (not b!938444) b_and!29131 (not b_lambda!14217) (not start!79784) (not b!938454) tp_is_empty!20265 (not mapNonEmpty!32173) (not b!938442) (not b_next!17757) (not b!938457) (not b!938441) (not b!938456))
(check-sat b_and!29131 (not b_next!17757))
(get-model)

(declare-fun d!113633 () Bool)

(assert (=> d!113633 (= (validKeyInArray!0 lt!423788) (and (not (= lt!423788 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!423788 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938453 d!113633))

(declare-fun b!938527 () Bool)

(declare-fun e!527094 () Bool)

(declare-fun call!40830 () Bool)

(assert (=> b!938527 (= e!527094 call!40830)))

(declare-fun b!938528 () Bool)

(declare-fun e!527091 () Bool)

(declare-fun contains!5117 (List!19160 (_ BitVec 64)) Bool)

(assert (=> b!938528 (= e!527091 (contains!5117 Nil!19157 (select (arr!27175 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!938529 () Bool)

(assert (=> b!938529 (= e!527094 call!40830)))

(declare-fun d!113635 () Bool)

(declare-fun res!631442 () Bool)

(declare-fun e!527093 () Bool)

(assert (=> d!113635 (=> res!631442 e!527093)))

(assert (=> d!113635 (= res!631442 (bvsge #b00000000000000000000000000000000 (size!27634 _keys!1487)))))

(assert (=> d!113635 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19157) e!527093)))

(declare-fun bm!40827 () Bool)

(declare-fun c!97811 () Bool)

(assert (=> bm!40827 (= call!40830 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97811 (Cons!19156 (select (arr!27175 _keys!1487) #b00000000000000000000000000000000) Nil!19157) Nil!19157)))))

(declare-fun b!938530 () Bool)

(declare-fun e!527092 () Bool)

(assert (=> b!938530 (= e!527092 e!527094)))

(assert (=> b!938530 (= c!97811 (validKeyInArray!0 (select (arr!27175 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!938531 () Bool)

(assert (=> b!938531 (= e!527093 e!527092)))

(declare-fun res!631443 () Bool)

(assert (=> b!938531 (=> (not res!631443) (not e!527092))))

(assert (=> b!938531 (= res!631443 (not e!527091))))

(declare-fun res!631444 () Bool)

(assert (=> b!938531 (=> (not res!631444) (not e!527091))))

(assert (=> b!938531 (= res!631444 (validKeyInArray!0 (select (arr!27175 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113635 (not res!631442)) b!938531))

(assert (= (and b!938531 res!631444) b!938528))

(assert (= (and b!938531 res!631443) b!938530))

(assert (= (and b!938530 c!97811) b!938529))

(assert (= (and b!938530 (not c!97811)) b!938527))

(assert (= (or b!938529 b!938527) bm!40827))

(declare-fun m!873881 () Bool)

(assert (=> b!938528 m!873881))

(assert (=> b!938528 m!873881))

(declare-fun m!873883 () Bool)

(assert (=> b!938528 m!873883))

(assert (=> bm!40827 m!873881))

(declare-fun m!873885 () Bool)

(assert (=> bm!40827 m!873885))

(assert (=> b!938530 m!873881))

(assert (=> b!938530 m!873881))

(declare-fun m!873887 () Bool)

(assert (=> b!938530 m!873887))

(assert (=> b!938531 m!873881))

(assert (=> b!938531 m!873881))

(assert (=> b!938531 m!873887))

(assert (=> b!938443 d!113635))

(declare-fun b!938574 () Bool)

(declare-fun e!527131 () Bool)

(declare-fun e!527125 () Bool)

(assert (=> b!938574 (= e!527131 e!527125)))

(declare-fun res!631468 () Bool)

(declare-fun call!40849 () Bool)

(assert (=> b!938574 (= res!631468 call!40849)))

(assert (=> b!938574 (=> (not res!631468) (not e!527125))))

(declare-fun b!938575 () Bool)

(declare-fun e!527130 () Bool)

(declare-fun lt!423886 () ListLongMap!12079)

(assert (=> b!938575 (= e!527130 (= (apply!856 lt!423886 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40842 () Bool)

(declare-fun call!40847 () ListLongMap!12079)

(declare-fun getCurrentListMapNoExtraKeys!3304 (array!56472 array!56474 (_ BitVec 32) (_ BitVec 32) V!31985 V!31985 (_ BitVec 32) Int) ListLongMap!12079)

(assert (=> bm!40842 (= call!40847 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!938576 () Bool)

(declare-fun e!527132 () Bool)

(declare-fun call!40848 () Bool)

(assert (=> b!938576 (= e!527132 (not call!40848))))

(declare-fun b!938577 () Bool)

(declare-fun e!527133 () ListLongMap!12079)

(declare-fun call!40845 () ListLongMap!12079)

(assert (=> b!938577 (= e!527133 call!40845)))

(declare-fun b!938578 () Bool)

(assert (=> b!938578 (= e!527132 e!527130)))

(declare-fun res!631463 () Bool)

(assert (=> b!938578 (= res!631463 call!40848)))

(assert (=> b!938578 (=> (not res!631463) (not e!527130))))

(declare-fun e!527123 () Bool)

(declare-fun b!938579 () Bool)

(assert (=> b!938579 (= e!527123 (= (apply!856 lt!423886 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938579 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27635 _values!1231)))))

(assert (=> b!938579 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(declare-fun bm!40843 () Bool)

(assert (=> bm!40843 (= call!40849 (contains!5115 lt!423886 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40844 () Bool)

(declare-fun call!40851 () ListLongMap!12079)

(assert (=> bm!40844 (= call!40845 call!40851)))

(declare-fun d!113637 () Bool)

(declare-fun e!527122 () Bool)

(assert (=> d!113637 e!527122))

(declare-fun res!631465 () Bool)

(assert (=> d!113637 (=> (not res!631465) (not e!527122))))

(assert (=> d!113637 (= res!631465 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27634 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))))

(declare-fun lt!423881 () ListLongMap!12079)

(assert (=> d!113637 (= lt!423886 lt!423881)))

(declare-fun lt!423889 () Unit!31700)

(declare-fun e!527124 () Unit!31700)

(assert (=> d!113637 (= lt!423889 e!527124)))

(declare-fun c!97824 () Bool)

(declare-fun e!527121 () Bool)

(assert (=> d!113637 (= c!97824 e!527121)))

(declare-fun res!631464 () Bool)

(assert (=> d!113637 (=> (not res!631464) (not e!527121))))

(assert (=> d!113637 (= res!631464 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(declare-fun e!527129 () ListLongMap!12079)

(assert (=> d!113637 (= lt!423881 e!527129)))

(declare-fun c!97829 () Bool)

(assert (=> d!113637 (= c!97829 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113637 (validMask!0 mask!1881)))

(assert (=> d!113637 (= (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!423886)))

(declare-fun b!938580 () Bool)

(declare-fun Unit!31708 () Unit!31700)

(assert (=> b!938580 (= e!527124 Unit!31708)))

(declare-fun b!938581 () Bool)

(declare-fun res!631466 () Bool)

(assert (=> b!938581 (=> (not res!631466) (not e!527122))))

(declare-fun e!527126 () Bool)

(assert (=> b!938581 (= res!631466 e!527126)))

(declare-fun res!631467 () Bool)

(assert (=> b!938581 (=> res!631467 e!527126)))

(declare-fun e!527127 () Bool)

(assert (=> b!938581 (= res!631467 (not e!527127))))

(declare-fun res!631469 () Bool)

(assert (=> b!938581 (=> (not res!631469) (not e!527127))))

(assert (=> b!938581 (= res!631469 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(declare-fun b!938582 () Bool)

(assert (=> b!938582 (= e!527122 e!527132)))

(declare-fun c!97828 () Bool)

(assert (=> b!938582 (= c!97828 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938583 () Bool)

(assert (=> b!938583 (= e!527129 (+!2842 call!40851 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!938584 () Bool)

(declare-fun res!631471 () Bool)

(assert (=> b!938584 (=> (not res!631471) (not e!527122))))

(assert (=> b!938584 (= res!631471 e!527131)))

(declare-fun c!97827 () Bool)

(assert (=> b!938584 (= c!97827 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!938585 () Bool)

(assert (=> b!938585 (= e!527125 (= (apply!856 lt!423886 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!938586 () Bool)

(assert (=> b!938586 (= e!527127 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun bm!40845 () Bool)

(declare-fun c!97825 () Bool)

(declare-fun call!40846 () ListLongMap!12079)

(declare-fun call!40850 () ListLongMap!12079)

(assert (=> bm!40845 (= call!40851 (+!2842 (ite c!97829 call!40847 (ite c!97825 call!40850 call!40846)) (ite (or c!97829 c!97825) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!938587 () Bool)

(assert (=> b!938587 (= e!527126 e!527123)))

(declare-fun res!631470 () Bool)

(assert (=> b!938587 (=> (not res!631470) (not e!527123))))

(assert (=> b!938587 (= res!631470 (contains!5115 lt!423886 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938587 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(declare-fun b!938588 () Bool)

(declare-fun e!527128 () ListLongMap!12079)

(assert (=> b!938588 (= e!527129 e!527128)))

(assert (=> b!938588 (= c!97825 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40846 () Bool)

(assert (=> bm!40846 (= call!40848 (contains!5115 lt!423886 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938589 () Bool)

(declare-fun c!97826 () Bool)

(assert (=> b!938589 (= c!97826 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!938589 (= e!527128 e!527133)))

(declare-fun b!938590 () Bool)

(assert (=> b!938590 (= e!527131 (not call!40849))))

(declare-fun bm!40847 () Bool)

(assert (=> bm!40847 (= call!40850 call!40847)))

(declare-fun b!938591 () Bool)

(assert (=> b!938591 (= e!527133 call!40846)))

(declare-fun b!938592 () Bool)

(assert (=> b!938592 (= e!527121 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938593 () Bool)

(declare-fun lt!423891 () Unit!31700)

(assert (=> b!938593 (= e!527124 lt!423891)))

(declare-fun lt!423876 () ListLongMap!12079)

(assert (=> b!938593 (= lt!423876 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423882 () (_ BitVec 64))

(assert (=> b!938593 (= lt!423882 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423884 () (_ BitVec 64))

(assert (=> b!938593 (= lt!423884 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!423894 () Unit!31700)

(assert (=> b!938593 (= lt!423894 (addStillContains!561 lt!423876 lt!423882 zeroValue!1173 lt!423884))))

(assert (=> b!938593 (contains!5115 (+!2842 lt!423876 (tuple2!13383 lt!423882 zeroValue!1173)) lt!423884)))

(declare-fun lt!423878 () Unit!31700)

(assert (=> b!938593 (= lt!423878 lt!423894)))

(declare-fun lt!423890 () ListLongMap!12079)

(assert (=> b!938593 (= lt!423890 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423888 () (_ BitVec 64))

(assert (=> b!938593 (= lt!423888 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423893 () (_ BitVec 64))

(assert (=> b!938593 (= lt!423893 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!423880 () Unit!31700)

(assert (=> b!938593 (= lt!423880 (addApplyDifferent!441 lt!423890 lt!423888 minValue!1173 lt!423893))))

(assert (=> b!938593 (= (apply!856 (+!2842 lt!423890 (tuple2!13383 lt!423888 minValue!1173)) lt!423893) (apply!856 lt!423890 lt!423893))))

(declare-fun lt!423883 () Unit!31700)

(assert (=> b!938593 (= lt!423883 lt!423880)))

(declare-fun lt!423892 () ListLongMap!12079)

(assert (=> b!938593 (= lt!423892 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423879 () (_ BitVec 64))

(assert (=> b!938593 (= lt!423879 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423895 () (_ BitVec 64))

(assert (=> b!938593 (= lt!423895 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!423877 () Unit!31700)

(assert (=> b!938593 (= lt!423877 (addApplyDifferent!441 lt!423892 lt!423879 zeroValue!1173 lt!423895))))

(assert (=> b!938593 (= (apply!856 (+!2842 lt!423892 (tuple2!13383 lt!423879 zeroValue!1173)) lt!423895) (apply!856 lt!423892 lt!423895))))

(declare-fun lt!423896 () Unit!31700)

(assert (=> b!938593 (= lt!423896 lt!423877)))

(declare-fun lt!423887 () ListLongMap!12079)

(assert (=> b!938593 (= lt!423887 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423897 () (_ BitVec 64))

(assert (=> b!938593 (= lt!423897 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423885 () (_ BitVec 64))

(assert (=> b!938593 (= lt!423885 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!938593 (= lt!423891 (addApplyDifferent!441 lt!423887 lt!423897 minValue!1173 lt!423885))))

(assert (=> b!938593 (= (apply!856 (+!2842 lt!423887 (tuple2!13383 lt!423897 minValue!1173)) lt!423885) (apply!856 lt!423887 lt!423885))))

(declare-fun b!938594 () Bool)

(assert (=> b!938594 (= e!527128 call!40845)))

(declare-fun bm!40848 () Bool)

(assert (=> bm!40848 (= call!40846 call!40850)))

(assert (= (and d!113637 c!97829) b!938583))

(assert (= (and d!113637 (not c!97829)) b!938588))

(assert (= (and b!938588 c!97825) b!938594))

(assert (= (and b!938588 (not c!97825)) b!938589))

(assert (= (and b!938589 c!97826) b!938577))

(assert (= (and b!938589 (not c!97826)) b!938591))

(assert (= (or b!938577 b!938591) bm!40848))

(assert (= (or b!938594 bm!40848) bm!40847))

(assert (= (or b!938594 b!938577) bm!40844))

(assert (= (or b!938583 bm!40847) bm!40842))

(assert (= (or b!938583 bm!40844) bm!40845))

(assert (= (and d!113637 res!631464) b!938592))

(assert (= (and d!113637 c!97824) b!938593))

(assert (= (and d!113637 (not c!97824)) b!938580))

(assert (= (and d!113637 res!631465) b!938581))

(assert (= (and b!938581 res!631469) b!938586))

(assert (= (and b!938581 (not res!631467)) b!938587))

(assert (= (and b!938587 res!631470) b!938579))

(assert (= (and b!938581 res!631466) b!938584))

(assert (= (and b!938584 c!97827) b!938574))

(assert (= (and b!938584 (not c!97827)) b!938590))

(assert (= (and b!938574 res!631468) b!938585))

(assert (= (or b!938574 b!938590) bm!40843))

(assert (= (and b!938584 res!631471) b!938582))

(assert (= (and b!938582 c!97828) b!938578))

(assert (= (and b!938582 (not c!97828)) b!938576))

(assert (= (and b!938578 res!631463) b!938575))

(assert (= (or b!938578 b!938576) bm!40846))

(declare-fun b_lambda!14219 () Bool)

(assert (=> (not b_lambda!14219) (not b!938579)))

(assert (=> b!938579 t!27459))

(declare-fun b_and!29137 () Bool)

(assert (= b_and!29131 (and (=> t!27459 result!12137) b_and!29137)))

(assert (=> b!938587 m!873757))

(assert (=> b!938587 m!873757))

(declare-fun m!873889 () Bool)

(assert (=> b!938587 m!873889))

(declare-fun m!873891 () Bool)

(assert (=> b!938583 m!873891))

(declare-fun m!873893 () Bool)

(assert (=> bm!40845 m!873893))

(declare-fun m!873895 () Bool)

(assert (=> b!938585 m!873895))

(assert (=> b!938592 m!873757))

(assert (=> b!938592 m!873757))

(declare-fun m!873897 () Bool)

(assert (=> b!938592 m!873897))

(assert (=> b!938586 m!873757))

(assert (=> b!938586 m!873757))

(assert (=> b!938586 m!873897))

(declare-fun m!873899 () Bool)

(assert (=> bm!40843 m!873899))

(declare-fun m!873901 () Bool)

(assert (=> bm!40846 m!873901))

(declare-fun m!873903 () Bool)

(assert (=> b!938575 m!873903))

(declare-fun m!873905 () Bool)

(assert (=> b!938593 m!873905))

(declare-fun m!873907 () Bool)

(assert (=> b!938593 m!873907))

(assert (=> b!938593 m!873907))

(declare-fun m!873909 () Bool)

(assert (=> b!938593 m!873909))

(declare-fun m!873911 () Bool)

(assert (=> b!938593 m!873911))

(assert (=> b!938593 m!873757))

(declare-fun m!873913 () Bool)

(assert (=> b!938593 m!873913))

(declare-fun m!873915 () Bool)

(assert (=> b!938593 m!873915))

(assert (=> b!938593 m!873913))

(declare-fun m!873917 () Bool)

(assert (=> b!938593 m!873917))

(declare-fun m!873919 () Bool)

(assert (=> b!938593 m!873919))

(declare-fun m!873921 () Bool)

(assert (=> b!938593 m!873921))

(declare-fun m!873923 () Bool)

(assert (=> b!938593 m!873923))

(declare-fun m!873925 () Bool)

(assert (=> b!938593 m!873925))

(declare-fun m!873927 () Bool)

(assert (=> b!938593 m!873927))

(declare-fun m!873929 () Bool)

(assert (=> b!938593 m!873929))

(assert (=> b!938593 m!873919))

(declare-fun m!873931 () Bool)

(assert (=> b!938593 m!873931))

(declare-fun m!873933 () Bool)

(assert (=> b!938593 m!873933))

(declare-fun m!873935 () Bool)

(assert (=> b!938593 m!873935))

(assert (=> b!938593 m!873925))

(assert (=> bm!40842 m!873915))

(assert (=> b!938579 m!873771))

(assert (=> b!938579 m!873767))

(assert (=> b!938579 m!873771))

(assert (=> b!938579 m!873777))

(assert (=> b!938579 m!873757))

(assert (=> b!938579 m!873767))

(assert (=> b!938579 m!873757))

(declare-fun m!873937 () Bool)

(assert (=> b!938579 m!873937))

(assert (=> d!113637 m!873795))

(assert (=> b!938457 d!113637))

(declare-fun d!113639 () Bool)

(assert (=> d!113639 (contains!5115 (+!2842 lt!423783 (tuple2!13383 lt!423788 lt!423778)) k0!1099)))

(declare-fun lt!423900 () Unit!31700)

(declare-fun choose!1559 (ListLongMap!12079 (_ BitVec 64) V!31985 (_ BitVec 64)) Unit!31700)

(assert (=> d!113639 (= lt!423900 (choose!1559 lt!423783 lt!423788 lt!423778 k0!1099))))

(assert (=> d!113639 (contains!5115 lt!423783 k0!1099)))

(assert (=> d!113639 (= (addStillContains!561 lt!423783 lt!423788 lt!423778 k0!1099) lt!423900)))

(declare-fun bs!26349 () Bool)

(assert (= bs!26349 d!113639))

(declare-fun m!873939 () Bool)

(assert (=> bs!26349 m!873939))

(assert (=> bs!26349 m!873939))

(declare-fun m!873941 () Bool)

(assert (=> bs!26349 m!873941))

(declare-fun m!873943 () Bool)

(assert (=> bs!26349 m!873943))

(assert (=> bs!26349 m!873803))

(assert (=> b!938457 d!113639))

(declare-fun d!113641 () Bool)

(declare-fun e!527136 () Bool)

(assert (=> d!113641 e!527136))

(declare-fun res!631474 () Bool)

(assert (=> d!113641 (=> (not res!631474) (not e!527136))))

(assert (=> d!113641 (= res!631474 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27634 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27635 _values!1231))))))

(declare-fun lt!423903 () Unit!31700)

(declare-fun choose!1560 (array!56472 array!56474 (_ BitVec 32) (_ BitVec 32) V!31985 V!31985 (_ BitVec 32) Int) Unit!31700)

(assert (=> d!113641 (= lt!423903 (choose!1560 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113641 (validMask!0 mask!1881)))

(assert (=> d!113641 (= (lemmaListMapRecursiveValidKeyArray!232 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!423903)))

(declare-fun b!938598 () Bool)

(assert (=> b!938598 (= e!527136 (= (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2842 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13383 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113641 res!631474) b!938598))

(declare-fun b_lambda!14221 () Bool)

(assert (=> (not b_lambda!14221) (not b!938598)))

(assert (=> b!938598 t!27459))

(declare-fun b_and!29139 () Bool)

(assert (= b_and!29137 (and (=> t!27459 result!12137) b_and!29139)))

(declare-fun m!873945 () Bool)

(assert (=> d!113641 m!873945))

(assert (=> d!113641 m!873795))

(declare-fun m!873947 () Bool)

(assert (=> b!938598 m!873947))

(declare-fun m!873949 () Bool)

(assert (=> b!938598 m!873949))

(assert (=> b!938598 m!873947))

(assert (=> b!938598 m!873767))

(assert (=> b!938598 m!873771))

(assert (=> b!938598 m!873777))

(assert (=> b!938598 m!873757))

(assert (=> b!938598 m!873789))

(assert (=> b!938598 m!873767))

(assert (=> b!938598 m!873771))

(assert (=> b!938457 d!113641))

(declare-fun b!938599 () Bool)

(declare-fun e!527140 () Bool)

(declare-fun call!40852 () Bool)

(assert (=> b!938599 (= e!527140 call!40852)))

(declare-fun b!938600 () Bool)

(declare-fun e!527137 () Bool)

(assert (=> b!938600 (= e!527137 (contains!5117 Nil!19157 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938601 () Bool)

(assert (=> b!938601 (= e!527140 call!40852)))

(declare-fun d!113643 () Bool)

(declare-fun res!631475 () Bool)

(declare-fun e!527139 () Bool)

(assert (=> d!113643 (=> res!631475 e!527139)))

(assert (=> d!113643 (= res!631475 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(assert (=> d!113643 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19157) e!527139)))

(declare-fun bm!40849 () Bool)

(declare-fun c!97830 () Bool)

(assert (=> bm!40849 (= call!40852 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97830 (Cons!19156 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19157) Nil!19157)))))

(declare-fun b!938602 () Bool)

(declare-fun e!527138 () Bool)

(assert (=> b!938602 (= e!527138 e!527140)))

(assert (=> b!938602 (= c!97830 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938603 () Bool)

(assert (=> b!938603 (= e!527139 e!527138)))

(declare-fun res!631476 () Bool)

(assert (=> b!938603 (=> (not res!631476) (not e!527138))))

(assert (=> b!938603 (= res!631476 (not e!527137))))

(declare-fun res!631477 () Bool)

(assert (=> b!938603 (=> (not res!631477) (not e!527137))))

(assert (=> b!938603 (= res!631477 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (= (and d!113643 (not res!631475)) b!938603))

(assert (= (and b!938603 res!631477) b!938600))

(assert (= (and b!938603 res!631476) b!938602))

(assert (= (and b!938602 c!97830) b!938601))

(assert (= (and b!938602 (not c!97830)) b!938599))

(assert (= (or b!938601 b!938599) bm!40849))

(assert (=> b!938600 m!873757))

(assert (=> b!938600 m!873757))

(declare-fun m!873951 () Bool)

(assert (=> b!938600 m!873951))

(assert (=> bm!40849 m!873757))

(declare-fun m!873953 () Bool)

(assert (=> bm!40849 m!873953))

(assert (=> b!938602 m!873757))

(assert (=> b!938602 m!873757))

(assert (=> b!938602 m!873897))

(assert (=> b!938603 m!873757))

(assert (=> b!938603 m!873757))

(assert (=> b!938603 m!873897))

(assert (=> b!938457 d!113643))

(declare-fun d!113645 () Bool)

(assert (=> d!113645 (= (apply!856 (+!2842 lt!423783 (tuple2!13383 lt!423788 lt!423778)) k0!1099) (apply!856 lt!423783 k0!1099))))

(declare-fun lt!423906 () Unit!31700)

(declare-fun choose!1561 (ListLongMap!12079 (_ BitVec 64) V!31985 (_ BitVec 64)) Unit!31700)

(assert (=> d!113645 (= lt!423906 (choose!1561 lt!423783 lt!423788 lt!423778 k0!1099))))

(declare-fun e!527143 () Bool)

(assert (=> d!113645 e!527143))

(declare-fun res!631480 () Bool)

(assert (=> d!113645 (=> (not res!631480) (not e!527143))))

(assert (=> d!113645 (= res!631480 (contains!5115 lt!423783 k0!1099))))

(assert (=> d!113645 (= (addApplyDifferent!441 lt!423783 lt!423788 lt!423778 k0!1099) lt!423906)))

(declare-fun b!938607 () Bool)

(assert (=> b!938607 (= e!527143 (not (= k0!1099 lt!423788)))))

(assert (= (and d!113645 res!631480) b!938607))

(assert (=> d!113645 m!873817))

(declare-fun m!873955 () Bool)

(assert (=> d!113645 m!873955))

(assert (=> d!113645 m!873939))

(assert (=> d!113645 m!873939))

(declare-fun m!873957 () Bool)

(assert (=> d!113645 m!873957))

(assert (=> d!113645 m!873803))

(assert (=> b!938457 d!113645))

(declare-fun d!113647 () Bool)

(declare-fun e!527149 () Bool)

(assert (=> d!113647 e!527149))

(declare-fun res!631483 () Bool)

(assert (=> d!113647 (=> res!631483 e!527149)))

(declare-fun lt!423916 () Bool)

(assert (=> d!113647 (= res!631483 (not lt!423916))))

(declare-fun lt!423918 () Bool)

(assert (=> d!113647 (= lt!423916 lt!423918)))

(declare-fun lt!423917 () Unit!31700)

(declare-fun e!527148 () Unit!31700)

(assert (=> d!113647 (= lt!423917 e!527148)))

(declare-fun c!97833 () Bool)

(assert (=> d!113647 (= c!97833 lt!423918)))

(declare-fun containsKey!451 (List!19159 (_ BitVec 64)) Bool)

(assert (=> d!113647 (= lt!423918 (containsKey!451 (toList!6055 lt!423784) k0!1099))))

(assert (=> d!113647 (= (contains!5115 lt!423784 k0!1099) lt!423916)))

(declare-fun b!938614 () Bool)

(declare-fun lt!423915 () Unit!31700)

(assert (=> b!938614 (= e!527148 lt!423915)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!347 (List!19159 (_ BitVec 64)) Unit!31700)

(assert (=> b!938614 (= lt!423915 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423784) k0!1099))))

(declare-datatypes ((Option!490 0))(
  ( (Some!489 (v!12713 V!31985)) (None!488) )
))
(declare-fun isDefined!356 (Option!490) Bool)

(declare-fun getValueByKey!484 (List!19159 (_ BitVec 64)) Option!490)

(assert (=> b!938614 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423784) k0!1099))))

(declare-fun b!938615 () Bool)

(declare-fun Unit!31709 () Unit!31700)

(assert (=> b!938615 (= e!527148 Unit!31709)))

(declare-fun b!938616 () Bool)

(assert (=> b!938616 (= e!527149 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423784) k0!1099)))))

(assert (= (and d!113647 c!97833) b!938614))

(assert (= (and d!113647 (not c!97833)) b!938615))

(assert (= (and d!113647 (not res!631483)) b!938616))

(declare-fun m!873959 () Bool)

(assert (=> d!113647 m!873959))

(declare-fun m!873961 () Bool)

(assert (=> b!938614 m!873961))

(declare-fun m!873963 () Bool)

(assert (=> b!938614 m!873963))

(assert (=> b!938614 m!873963))

(declare-fun m!873965 () Bool)

(assert (=> b!938614 m!873965))

(assert (=> b!938616 m!873963))

(assert (=> b!938616 m!873963))

(assert (=> b!938616 m!873965))

(assert (=> b!938457 d!113647))

(declare-fun d!113649 () Bool)

(declare-fun e!527152 () Bool)

(assert (=> d!113649 e!527152))

(declare-fun c!97836 () Bool)

(assert (=> d!113649 (= c!97836 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423921 () Unit!31700)

(declare-fun choose!1562 (array!56472 array!56474 (_ BitVec 32) (_ BitVec 32) V!31985 V!31985 (_ BitVec 64) (_ BitVec 32) Int) Unit!31700)

(assert (=> d!113649 (= lt!423921 (choose!1562 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!113649 (validMask!0 mask!1881)))

(assert (=> d!113649 (= (lemmaListMapContainsThenArrayContainsFrom!314 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!423921)))

(declare-fun b!938621 () Bool)

(assert (=> b!938621 (= e!527152 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!938622 () Bool)

(assert (=> b!938622 (= e!527152 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113649 c!97836) b!938621))

(assert (= (and d!113649 (not c!97836)) b!938622))

(declare-fun m!873967 () Bool)

(assert (=> d!113649 m!873967))

(assert (=> d!113649 m!873795))

(assert (=> b!938621 m!873813))

(assert (=> b!938457 d!113649))

(declare-fun d!113651 () Bool)

(declare-fun get!14337 (Option!490) V!31985)

(assert (=> d!113651 (= (apply!856 lt!423784 k0!1099) (get!14337 (getValueByKey!484 (toList!6055 lt!423784) k0!1099)))))

(declare-fun bs!26350 () Bool)

(assert (= bs!26350 d!113651))

(assert (=> bs!26350 m!873963))

(assert (=> bs!26350 m!873963))

(declare-fun m!873969 () Bool)

(assert (=> bs!26350 m!873969))

(assert (=> b!938457 d!113651))

(declare-fun d!113653 () Bool)

(declare-fun e!527155 () Bool)

(assert (=> d!113653 e!527155))

(declare-fun res!631488 () Bool)

(assert (=> d!113653 (=> (not res!631488) (not e!527155))))

(declare-fun lt!423932 () ListLongMap!12079)

(assert (=> d!113653 (= res!631488 (contains!5115 lt!423932 (_1!6702 lt!423782)))))

(declare-fun lt!423930 () List!19159)

(assert (=> d!113653 (= lt!423932 (ListLongMap!12080 lt!423930))))

(declare-fun lt!423931 () Unit!31700)

(declare-fun lt!423933 () Unit!31700)

(assert (=> d!113653 (= lt!423931 lt!423933)))

(assert (=> d!113653 (= (getValueByKey!484 lt!423930 (_1!6702 lt!423782)) (Some!489 (_2!6702 lt!423782)))))

(declare-fun lemmaContainsTupThenGetReturnValue!260 (List!19159 (_ BitVec 64) V!31985) Unit!31700)

(assert (=> d!113653 (= lt!423933 (lemmaContainsTupThenGetReturnValue!260 lt!423930 (_1!6702 lt!423782) (_2!6702 lt!423782)))))

(declare-fun insertStrictlySorted!317 (List!19159 (_ BitVec 64) V!31985) List!19159)

(assert (=> d!113653 (= lt!423930 (insertStrictlySorted!317 (toList!6055 lt!423783) (_1!6702 lt!423782) (_2!6702 lt!423782)))))

(assert (=> d!113653 (= (+!2842 lt!423783 lt!423782) lt!423932)))

(declare-fun b!938627 () Bool)

(declare-fun res!631489 () Bool)

(assert (=> b!938627 (=> (not res!631489) (not e!527155))))

(assert (=> b!938627 (= res!631489 (= (getValueByKey!484 (toList!6055 lt!423932) (_1!6702 lt!423782)) (Some!489 (_2!6702 lt!423782))))))

(declare-fun b!938628 () Bool)

(declare-fun contains!5118 (List!19159 tuple2!13382) Bool)

(assert (=> b!938628 (= e!527155 (contains!5118 (toList!6055 lt!423932) lt!423782))))

(assert (= (and d!113653 res!631488) b!938627))

(assert (= (and b!938627 res!631489) b!938628))

(declare-fun m!873971 () Bool)

(assert (=> d!113653 m!873971))

(declare-fun m!873973 () Bool)

(assert (=> d!113653 m!873973))

(declare-fun m!873975 () Bool)

(assert (=> d!113653 m!873975))

(declare-fun m!873977 () Bool)

(assert (=> d!113653 m!873977))

(declare-fun m!873979 () Bool)

(assert (=> b!938627 m!873979))

(declare-fun m!873981 () Bool)

(assert (=> b!938628 m!873981))

(assert (=> b!938457 d!113653))

(declare-fun b!938629 () Bool)

(declare-fun e!527166 () Bool)

(declare-fun e!527160 () Bool)

(assert (=> b!938629 (= e!527166 e!527160)))

(declare-fun res!631495 () Bool)

(declare-fun call!40857 () Bool)

(assert (=> b!938629 (= res!631495 call!40857)))

(assert (=> b!938629 (=> (not res!631495) (not e!527160))))

(declare-fun b!938630 () Bool)

(declare-fun e!527165 () Bool)

(declare-fun lt!423944 () ListLongMap!12079)

(assert (=> b!938630 (= e!527165 (= (apply!856 lt!423944 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40850 () Bool)

(declare-fun call!40855 () ListLongMap!12079)

(assert (=> bm!40850 (= call!40855 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun b!938631 () Bool)

(declare-fun e!527167 () Bool)

(declare-fun call!40856 () Bool)

(assert (=> b!938631 (= e!527167 (not call!40856))))

(declare-fun b!938632 () Bool)

(declare-fun e!527168 () ListLongMap!12079)

(declare-fun call!40853 () ListLongMap!12079)

(assert (=> b!938632 (= e!527168 call!40853)))

(declare-fun b!938633 () Bool)

(assert (=> b!938633 (= e!527167 e!527165)))

(declare-fun res!631490 () Bool)

(assert (=> b!938633 (= res!631490 call!40856)))

(assert (=> b!938633 (=> (not res!631490) (not e!527165))))

(declare-fun e!527158 () Bool)

(declare-fun b!938634 () Bool)

(assert (=> b!938634 (= e!527158 (= (apply!856 lt!423944 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14335 (select (arr!27176 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938634 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27635 _values!1231)))))

(assert (=> b!938634 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27634 _keys!1487)))))

(declare-fun bm!40851 () Bool)

(assert (=> bm!40851 (= call!40857 (contains!5115 lt!423944 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40852 () Bool)

(declare-fun call!40859 () ListLongMap!12079)

(assert (=> bm!40852 (= call!40853 call!40859)))

(declare-fun d!113655 () Bool)

(declare-fun e!527157 () Bool)

(assert (=> d!113655 e!527157))

(declare-fun res!631492 () Bool)

(assert (=> d!113655 (=> (not res!631492) (not e!527157))))

(assert (=> d!113655 (= res!631492 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27634 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27634 _keys!1487)))))))

(declare-fun lt!423939 () ListLongMap!12079)

(assert (=> d!113655 (= lt!423944 lt!423939)))

(declare-fun lt!423947 () Unit!31700)

(declare-fun e!527159 () Unit!31700)

(assert (=> d!113655 (= lt!423947 e!527159)))

(declare-fun c!97837 () Bool)

(declare-fun e!527156 () Bool)

(assert (=> d!113655 (= c!97837 e!527156)))

(declare-fun res!631491 () Bool)

(assert (=> d!113655 (=> (not res!631491) (not e!527156))))

(assert (=> d!113655 (= res!631491 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27634 _keys!1487)))))

(declare-fun e!527164 () ListLongMap!12079)

(assert (=> d!113655 (= lt!423939 e!527164)))

(declare-fun c!97842 () Bool)

(assert (=> d!113655 (= c!97842 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113655 (validMask!0 mask!1881)))

(assert (=> d!113655 (= (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423944)))

(declare-fun b!938635 () Bool)

(declare-fun Unit!31710 () Unit!31700)

(assert (=> b!938635 (= e!527159 Unit!31710)))

(declare-fun b!938636 () Bool)

(declare-fun res!631493 () Bool)

(assert (=> b!938636 (=> (not res!631493) (not e!527157))))

(declare-fun e!527161 () Bool)

(assert (=> b!938636 (= res!631493 e!527161)))

(declare-fun res!631494 () Bool)

(assert (=> b!938636 (=> res!631494 e!527161)))

(declare-fun e!527162 () Bool)

(assert (=> b!938636 (= res!631494 (not e!527162))))

(declare-fun res!631496 () Bool)

(assert (=> b!938636 (=> (not res!631496) (not e!527162))))

(assert (=> b!938636 (= res!631496 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27634 _keys!1487)))))

(declare-fun b!938637 () Bool)

(assert (=> b!938637 (= e!527157 e!527167)))

(declare-fun c!97841 () Bool)

(assert (=> b!938637 (= c!97841 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938638 () Bool)

(assert (=> b!938638 (= e!527164 (+!2842 call!40859 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!938639 () Bool)

(declare-fun res!631498 () Bool)

(assert (=> b!938639 (=> (not res!631498) (not e!527157))))

(assert (=> b!938639 (= res!631498 e!527166)))

(declare-fun c!97840 () Bool)

(assert (=> b!938639 (= c!97840 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!938640 () Bool)

(assert (=> b!938640 (= e!527160 (= (apply!856 lt!423944 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!938641 () Bool)

(assert (=> b!938641 (= e!527162 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun call!40858 () ListLongMap!12079)

(declare-fun c!97838 () Bool)

(declare-fun call!40854 () ListLongMap!12079)

(declare-fun bm!40853 () Bool)

(assert (=> bm!40853 (= call!40859 (+!2842 (ite c!97842 call!40855 (ite c!97838 call!40858 call!40854)) (ite (or c!97842 c!97838) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!938642 () Bool)

(assert (=> b!938642 (= e!527161 e!527158)))

(declare-fun res!631497 () Bool)

(assert (=> b!938642 (=> (not res!631497) (not e!527158))))

(assert (=> b!938642 (= res!631497 (contains!5115 lt!423944 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!938642 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27634 _keys!1487)))))

(declare-fun b!938643 () Bool)

(declare-fun e!527163 () ListLongMap!12079)

(assert (=> b!938643 (= e!527164 e!527163)))

(assert (=> b!938643 (= c!97838 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40854 () Bool)

(assert (=> bm!40854 (= call!40856 (contains!5115 lt!423944 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938644 () Bool)

(declare-fun c!97839 () Bool)

(assert (=> b!938644 (= c!97839 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!938644 (= e!527163 e!527168)))

(declare-fun b!938645 () Bool)

(assert (=> b!938645 (= e!527166 (not call!40857))))

(declare-fun bm!40855 () Bool)

(assert (=> bm!40855 (= call!40858 call!40855)))

(declare-fun b!938646 () Bool)

(assert (=> b!938646 (= e!527168 call!40854)))

(declare-fun b!938647 () Bool)

(assert (=> b!938647 (= e!527156 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!938648 () Bool)

(declare-fun lt!423949 () Unit!31700)

(assert (=> b!938648 (= e!527159 lt!423949)))

(declare-fun lt!423934 () ListLongMap!12079)

(assert (=> b!938648 (= lt!423934 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423940 () (_ BitVec 64))

(assert (=> b!938648 (= lt!423940 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423942 () (_ BitVec 64))

(assert (=> b!938648 (= lt!423942 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!423952 () Unit!31700)

(assert (=> b!938648 (= lt!423952 (addStillContains!561 lt!423934 lt!423940 zeroValue!1173 lt!423942))))

(assert (=> b!938648 (contains!5115 (+!2842 lt!423934 (tuple2!13383 lt!423940 zeroValue!1173)) lt!423942)))

(declare-fun lt!423936 () Unit!31700)

(assert (=> b!938648 (= lt!423936 lt!423952)))

(declare-fun lt!423948 () ListLongMap!12079)

(assert (=> b!938648 (= lt!423948 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423946 () (_ BitVec 64))

(assert (=> b!938648 (= lt!423946 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423951 () (_ BitVec 64))

(assert (=> b!938648 (= lt!423951 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!423938 () Unit!31700)

(assert (=> b!938648 (= lt!423938 (addApplyDifferent!441 lt!423948 lt!423946 minValue!1173 lt!423951))))

(assert (=> b!938648 (= (apply!856 (+!2842 lt!423948 (tuple2!13383 lt!423946 minValue!1173)) lt!423951) (apply!856 lt!423948 lt!423951))))

(declare-fun lt!423941 () Unit!31700)

(assert (=> b!938648 (= lt!423941 lt!423938)))

(declare-fun lt!423950 () ListLongMap!12079)

(assert (=> b!938648 (= lt!423950 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423937 () (_ BitVec 64))

(assert (=> b!938648 (= lt!423937 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423953 () (_ BitVec 64))

(assert (=> b!938648 (= lt!423953 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!423935 () Unit!31700)

(assert (=> b!938648 (= lt!423935 (addApplyDifferent!441 lt!423950 lt!423937 zeroValue!1173 lt!423953))))

(assert (=> b!938648 (= (apply!856 (+!2842 lt!423950 (tuple2!13383 lt!423937 zeroValue!1173)) lt!423953) (apply!856 lt!423950 lt!423953))))

(declare-fun lt!423954 () Unit!31700)

(assert (=> b!938648 (= lt!423954 lt!423935)))

(declare-fun lt!423945 () ListLongMap!12079)

(assert (=> b!938648 (= lt!423945 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423955 () (_ BitVec 64))

(assert (=> b!938648 (= lt!423955 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423943 () (_ BitVec 64))

(assert (=> b!938648 (= lt!423943 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938648 (= lt!423949 (addApplyDifferent!441 lt!423945 lt!423955 minValue!1173 lt!423943))))

(assert (=> b!938648 (= (apply!856 (+!2842 lt!423945 (tuple2!13383 lt!423955 minValue!1173)) lt!423943) (apply!856 lt!423945 lt!423943))))

(declare-fun b!938649 () Bool)

(assert (=> b!938649 (= e!527163 call!40853)))

(declare-fun bm!40856 () Bool)

(assert (=> bm!40856 (= call!40854 call!40858)))

(assert (= (and d!113655 c!97842) b!938638))

(assert (= (and d!113655 (not c!97842)) b!938643))

(assert (= (and b!938643 c!97838) b!938649))

(assert (= (and b!938643 (not c!97838)) b!938644))

(assert (= (and b!938644 c!97839) b!938632))

(assert (= (and b!938644 (not c!97839)) b!938646))

(assert (= (or b!938632 b!938646) bm!40856))

(assert (= (or b!938649 bm!40856) bm!40855))

(assert (= (or b!938649 b!938632) bm!40852))

(assert (= (or b!938638 bm!40855) bm!40850))

(assert (= (or b!938638 bm!40852) bm!40853))

(assert (= (and d!113655 res!631491) b!938647))

(assert (= (and d!113655 c!97837) b!938648))

(assert (= (and d!113655 (not c!97837)) b!938635))

(assert (= (and d!113655 res!631492) b!938636))

(assert (= (and b!938636 res!631496) b!938641))

(assert (= (and b!938636 (not res!631494)) b!938642))

(assert (= (and b!938642 res!631497) b!938634))

(assert (= (and b!938636 res!631493) b!938639))

(assert (= (and b!938639 c!97840) b!938629))

(assert (= (and b!938639 (not c!97840)) b!938645))

(assert (= (and b!938629 res!631495) b!938640))

(assert (= (or b!938629 b!938645) bm!40851))

(assert (= (and b!938639 res!631498) b!938637))

(assert (= (and b!938637 c!97841) b!938633))

(assert (= (and b!938637 (not c!97841)) b!938631))

(assert (= (and b!938633 res!631490) b!938630))

(assert (= (or b!938633 b!938631) bm!40854))

(declare-fun b_lambda!14223 () Bool)

(assert (=> (not b_lambda!14223) (not b!938634)))

(assert (=> b!938634 t!27459))

(declare-fun b_and!29141 () Bool)

(assert (= b_and!29139 (and (=> t!27459 result!12137) b_and!29141)))

(declare-fun m!873983 () Bool)

(assert (=> b!938642 m!873983))

(assert (=> b!938642 m!873983))

(declare-fun m!873985 () Bool)

(assert (=> b!938642 m!873985))

(declare-fun m!873987 () Bool)

(assert (=> b!938638 m!873987))

(declare-fun m!873989 () Bool)

(assert (=> bm!40853 m!873989))

(declare-fun m!873991 () Bool)

(assert (=> b!938640 m!873991))

(assert (=> b!938647 m!873983))

(assert (=> b!938647 m!873983))

(declare-fun m!873993 () Bool)

(assert (=> b!938647 m!873993))

(assert (=> b!938641 m!873983))

(assert (=> b!938641 m!873983))

(assert (=> b!938641 m!873993))

(declare-fun m!873995 () Bool)

(assert (=> bm!40851 m!873995))

(declare-fun m!873997 () Bool)

(assert (=> bm!40854 m!873997))

(declare-fun m!873999 () Bool)

(assert (=> b!938630 m!873999))

(declare-fun m!874001 () Bool)

(assert (=> b!938648 m!874001))

(declare-fun m!874003 () Bool)

(assert (=> b!938648 m!874003))

(assert (=> b!938648 m!874003))

(declare-fun m!874005 () Bool)

(assert (=> b!938648 m!874005))

(declare-fun m!874007 () Bool)

(assert (=> b!938648 m!874007))

(assert (=> b!938648 m!873983))

(declare-fun m!874009 () Bool)

(assert (=> b!938648 m!874009))

(declare-fun m!874011 () Bool)

(assert (=> b!938648 m!874011))

(assert (=> b!938648 m!874009))

(declare-fun m!874013 () Bool)

(assert (=> b!938648 m!874013))

(declare-fun m!874015 () Bool)

(assert (=> b!938648 m!874015))

(declare-fun m!874017 () Bool)

(assert (=> b!938648 m!874017))

(declare-fun m!874019 () Bool)

(assert (=> b!938648 m!874019))

(declare-fun m!874021 () Bool)

(assert (=> b!938648 m!874021))

(declare-fun m!874023 () Bool)

(assert (=> b!938648 m!874023))

(declare-fun m!874025 () Bool)

(assert (=> b!938648 m!874025))

(assert (=> b!938648 m!874015))

(declare-fun m!874027 () Bool)

(assert (=> b!938648 m!874027))

(declare-fun m!874029 () Bool)

(assert (=> b!938648 m!874029))

(declare-fun m!874031 () Bool)

(assert (=> b!938648 m!874031))

(assert (=> b!938648 m!874021))

(assert (=> bm!40850 m!874011))

(assert (=> b!938634 m!873771))

(declare-fun m!874033 () Bool)

(assert (=> b!938634 m!874033))

(assert (=> b!938634 m!873771))

(declare-fun m!874035 () Bool)

(assert (=> b!938634 m!874035))

(assert (=> b!938634 m!873983))

(assert (=> b!938634 m!874033))

(assert (=> b!938634 m!873983))

(declare-fun m!874037 () Bool)

(assert (=> b!938634 m!874037))

(assert (=> d!113655 m!873795))

(assert (=> b!938457 d!113655))

(declare-fun d!113657 () Bool)

(declare-fun e!527169 () Bool)

(assert (=> d!113657 e!527169))

(declare-fun res!631499 () Bool)

(assert (=> d!113657 (=> (not res!631499) (not e!527169))))

(declare-fun lt!423958 () ListLongMap!12079)

(assert (=> d!113657 (= res!631499 (contains!5115 lt!423958 (_1!6702 lt!423782)))))

(declare-fun lt!423956 () List!19159)

(assert (=> d!113657 (= lt!423958 (ListLongMap!12080 lt!423956))))

(declare-fun lt!423957 () Unit!31700)

(declare-fun lt!423959 () Unit!31700)

(assert (=> d!113657 (= lt!423957 lt!423959)))

(assert (=> d!113657 (= (getValueByKey!484 lt!423956 (_1!6702 lt!423782)) (Some!489 (_2!6702 lt!423782)))))

(assert (=> d!113657 (= lt!423959 (lemmaContainsTupThenGetReturnValue!260 lt!423956 (_1!6702 lt!423782) (_2!6702 lt!423782)))))

(assert (=> d!113657 (= lt!423956 (insertStrictlySorted!317 (toList!6055 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6702 lt!423782) (_2!6702 lt!423782)))))

(assert (=> d!113657 (= (+!2842 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423782) lt!423958)))

(declare-fun b!938650 () Bool)

(declare-fun res!631500 () Bool)

(assert (=> b!938650 (=> (not res!631500) (not e!527169))))

(assert (=> b!938650 (= res!631500 (= (getValueByKey!484 (toList!6055 lt!423958) (_1!6702 lt!423782)) (Some!489 (_2!6702 lt!423782))))))

(declare-fun b!938651 () Bool)

(assert (=> b!938651 (= e!527169 (contains!5118 (toList!6055 lt!423958) lt!423782))))

(assert (= (and d!113657 res!631499) b!938650))

(assert (= (and b!938650 res!631500) b!938651))

(declare-fun m!874039 () Bool)

(assert (=> d!113657 m!874039))

(declare-fun m!874041 () Bool)

(assert (=> d!113657 m!874041))

(declare-fun m!874043 () Bool)

(assert (=> d!113657 m!874043))

(declare-fun m!874045 () Bool)

(assert (=> d!113657 m!874045))

(declare-fun m!874047 () Bool)

(assert (=> b!938650 m!874047))

(declare-fun m!874049 () Bool)

(assert (=> b!938651 m!874049))

(assert (=> b!938457 d!113657))

(declare-fun d!113659 () Bool)

(assert (=> d!113659 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27634 _keys!1487)) (not (= (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) k0!1099)))))

(declare-fun lt!423962 () Unit!31700)

(declare-fun choose!21 (array!56472 (_ BitVec 64) (_ BitVec 32) List!19160) Unit!31700)

(assert (=> d!113659 (= lt!423962 (choose!21 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19157))))

(assert (=> d!113659 (bvslt (size!27634 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113659 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19157) lt!423962)))

(declare-fun bs!26351 () Bool)

(assert (= bs!26351 d!113659))

(assert (=> bs!26351 m!873757))

(declare-fun m!874051 () Bool)

(assert (=> bs!26351 m!874051))

(assert (=> b!938457 d!113659))

(declare-fun d!113661 () Bool)

(declare-fun c!97845 () Bool)

(assert (=> d!113661 (= c!97845 ((_ is ValueCellFull!9651) (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!527172 () V!31985)

(assert (=> d!113661 (= (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!527172)))

(declare-fun b!938656 () Bool)

(declare-fun get!14338 (ValueCell!9651 V!31985) V!31985)

(assert (=> b!938656 (= e!527172 (get!14338 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!938657 () Bool)

(declare-fun get!14339 (ValueCell!9651 V!31985) V!31985)

(assert (=> b!938657 (= e!527172 (get!14339 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113661 c!97845) b!938656))

(assert (= (and d!113661 (not c!97845)) b!938657))

(assert (=> b!938656 m!873767))

(assert (=> b!938656 m!873771))

(declare-fun m!874053 () Bool)

(assert (=> b!938656 m!874053))

(assert (=> b!938657 m!873767))

(assert (=> b!938657 m!873771))

(declare-fun m!874055 () Bool)

(assert (=> b!938657 m!874055))

(assert (=> b!938457 d!113661))

(declare-fun d!113663 () Bool)

(assert (=> d!113663 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19157)))

(declare-fun lt!423965 () Unit!31700)

(declare-fun choose!39 (array!56472 (_ BitVec 32) (_ BitVec 32)) Unit!31700)

(assert (=> d!113663 (= lt!423965 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!113663 (bvslt (size!27634 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113663 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!423965)))

(declare-fun bs!26352 () Bool)

(assert (= bs!26352 d!113663))

(assert (=> bs!26352 m!873783))

(declare-fun m!874057 () Bool)

(assert (=> bs!26352 m!874057))

(assert (=> b!938457 d!113663))

(declare-fun d!113665 () Bool)

(declare-fun e!527174 () Bool)

(assert (=> d!113665 e!527174))

(declare-fun res!631501 () Bool)

(assert (=> d!113665 (=> res!631501 e!527174)))

(declare-fun lt!423967 () Bool)

(assert (=> d!113665 (= res!631501 (not lt!423967))))

(declare-fun lt!423969 () Bool)

(assert (=> d!113665 (= lt!423967 lt!423969)))

(declare-fun lt!423968 () Unit!31700)

(declare-fun e!527173 () Unit!31700)

(assert (=> d!113665 (= lt!423968 e!527173)))

(declare-fun c!97846 () Bool)

(assert (=> d!113665 (= c!97846 lt!423969)))

(assert (=> d!113665 (= lt!423969 (containsKey!451 (toList!6055 lt!423776) k0!1099))))

(assert (=> d!113665 (= (contains!5115 lt!423776 k0!1099) lt!423967)))

(declare-fun b!938658 () Bool)

(declare-fun lt!423966 () Unit!31700)

(assert (=> b!938658 (= e!527173 lt!423966)))

(assert (=> b!938658 (= lt!423966 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423776) k0!1099))))

(assert (=> b!938658 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423776) k0!1099))))

(declare-fun b!938659 () Bool)

(declare-fun Unit!31711 () Unit!31700)

(assert (=> b!938659 (= e!527173 Unit!31711)))

(declare-fun b!938660 () Bool)

(assert (=> b!938660 (= e!527174 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423776) k0!1099)))))

(assert (= (and d!113665 c!97846) b!938658))

(assert (= (and d!113665 (not c!97846)) b!938659))

(assert (= (and d!113665 (not res!631501)) b!938660))

(declare-fun m!874059 () Bool)

(assert (=> d!113665 m!874059))

(declare-fun m!874061 () Bool)

(assert (=> b!938658 m!874061))

(declare-fun m!874063 () Bool)

(assert (=> b!938658 m!874063))

(assert (=> b!938658 m!874063))

(declare-fun m!874065 () Bool)

(assert (=> b!938658 m!874065))

(assert (=> b!938660 m!874063))

(assert (=> b!938660 m!874063))

(assert (=> b!938660 m!874065))

(assert (=> b!938442 d!113665))

(assert (=> b!938442 d!113637))

(declare-fun d!113667 () Bool)

(declare-fun res!631506 () Bool)

(declare-fun e!527179 () Bool)

(assert (=> d!113667 (=> res!631506 e!527179)))

(assert (=> d!113667 (= res!631506 (= (select (arr!27175 _keys!1487) from!1844) k0!1099))))

(assert (=> d!113667 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!527179)))

(declare-fun b!938665 () Bool)

(declare-fun e!527180 () Bool)

(assert (=> b!938665 (= e!527179 e!527180)))

(declare-fun res!631507 () Bool)

(assert (=> b!938665 (=> (not res!631507) (not e!527180))))

(assert (=> b!938665 (= res!631507 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(declare-fun b!938666 () Bool)

(assert (=> b!938666 (= e!527180 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!113667 (not res!631506)) b!938665))

(assert (= (and b!938665 res!631507) b!938666))

(declare-fun m!874067 () Bool)

(assert (=> d!113667 m!874067))

(declare-fun m!874069 () Bool)

(assert (=> b!938666 m!874069))

(assert (=> b!938447 d!113667))

(declare-fun d!113669 () Bool)

(assert (=> d!113669 (= (apply!856 lt!423783 k0!1099) (get!14337 (getValueByKey!484 (toList!6055 lt!423783) k0!1099)))))

(declare-fun bs!26353 () Bool)

(assert (= bs!26353 d!113669))

(declare-fun m!874071 () Bool)

(assert (=> bs!26353 m!874071))

(assert (=> bs!26353 m!874071))

(declare-fun m!874073 () Bool)

(assert (=> bs!26353 m!874073))

(assert (=> b!938452 d!113669))

(declare-fun d!113671 () Bool)

(assert (=> d!113671 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79784 d!113671))

(declare-fun d!113673 () Bool)

(assert (=> d!113673 (= (array_inv!21138 _values!1231) (bvsge (size!27635 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79784 d!113673))

(declare-fun d!113675 () Bool)

(assert (=> d!113675 (= (array_inv!21139 _keys!1487) (bvsge (size!27634 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79784 d!113675))

(declare-fun d!113677 () Bool)

(assert (=> d!113677 (= (apply!856 lt!423776 k0!1099) (get!14337 (getValueByKey!484 (toList!6055 lt!423776) k0!1099)))))

(declare-fun bs!26354 () Bool)

(assert (= bs!26354 d!113677))

(assert (=> bs!26354 m!874063))

(assert (=> bs!26354 m!874063))

(declare-fun m!874075 () Bool)

(assert (=> bs!26354 m!874075))

(assert (=> b!938456 d!113677))

(declare-fun b!938675 () Bool)

(declare-fun e!527187 () Bool)

(declare-fun e!527188 () Bool)

(assert (=> b!938675 (= e!527187 e!527188)))

(declare-fun lt!423976 () (_ BitVec 64))

(assert (=> b!938675 (= lt!423976 (select (arr!27175 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!423978 () Unit!31700)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56472 (_ BitVec 64) (_ BitVec 32)) Unit!31700)

(assert (=> b!938675 (= lt!423978 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!423976 #b00000000000000000000000000000000))))

(assert (=> b!938675 (arrayContainsKey!0 _keys!1487 lt!423976 #b00000000000000000000000000000000)))

(declare-fun lt!423977 () Unit!31700)

(assert (=> b!938675 (= lt!423977 lt!423978)))

(declare-fun res!631513 () Bool)

(declare-datatypes ((SeekEntryResult!8982 0))(
  ( (MissingZero!8982 (index!38299 (_ BitVec 32))) (Found!8982 (index!38300 (_ BitVec 32))) (Intermediate!8982 (undefined!9794 Bool) (index!38301 (_ BitVec 32)) (x!80462 (_ BitVec 32))) (Undefined!8982) (MissingVacant!8982 (index!38302 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56472 (_ BitVec 32)) SeekEntryResult!8982)

(assert (=> b!938675 (= res!631513 (= (seekEntryOrOpen!0 (select (arr!27175 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8982 #b00000000000000000000000000000000)))))

(assert (=> b!938675 (=> (not res!631513) (not e!527188))))

(declare-fun b!938676 () Bool)

(declare-fun e!527189 () Bool)

(assert (=> b!938676 (= e!527189 e!527187)))

(declare-fun c!97849 () Bool)

(assert (=> b!938676 (= c!97849 (validKeyInArray!0 (select (arr!27175 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun d!113679 () Bool)

(declare-fun res!631512 () Bool)

(assert (=> d!113679 (=> res!631512 e!527189)))

(assert (=> d!113679 (= res!631512 (bvsge #b00000000000000000000000000000000 (size!27634 _keys!1487)))))

(assert (=> d!113679 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!527189)))

(declare-fun bm!40859 () Bool)

(declare-fun call!40862 () Bool)

(assert (=> bm!40859 (= call!40862 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!938677 () Bool)

(assert (=> b!938677 (= e!527188 call!40862)))

(declare-fun b!938678 () Bool)

(assert (=> b!938678 (= e!527187 call!40862)))

(assert (= (and d!113679 (not res!631512)) b!938676))

(assert (= (and b!938676 c!97849) b!938675))

(assert (= (and b!938676 (not c!97849)) b!938678))

(assert (= (and b!938675 res!631513) b!938677))

(assert (= (or b!938677 b!938678) bm!40859))

(assert (=> b!938675 m!873881))

(declare-fun m!874077 () Bool)

(assert (=> b!938675 m!874077))

(declare-fun m!874079 () Bool)

(assert (=> b!938675 m!874079))

(assert (=> b!938675 m!873881))

(declare-fun m!874081 () Bool)

(assert (=> b!938675 m!874081))

(assert (=> b!938676 m!873881))

(assert (=> b!938676 m!873881))

(assert (=> b!938676 m!873887))

(declare-fun m!874083 () Bool)

(assert (=> bm!40859 m!874083))

(assert (=> b!938441 d!113679))

(declare-fun d!113681 () Bool)

(declare-fun e!527191 () Bool)

(assert (=> d!113681 e!527191))

(declare-fun res!631514 () Bool)

(assert (=> d!113681 (=> res!631514 e!527191)))

(declare-fun lt!423980 () Bool)

(assert (=> d!113681 (= res!631514 (not lt!423980))))

(declare-fun lt!423982 () Bool)

(assert (=> d!113681 (= lt!423980 lt!423982)))

(declare-fun lt!423981 () Unit!31700)

(declare-fun e!527190 () Unit!31700)

(assert (=> d!113681 (= lt!423981 e!527190)))

(declare-fun c!97850 () Bool)

(assert (=> d!113681 (= c!97850 lt!423982)))

(assert (=> d!113681 (= lt!423982 (containsKey!451 (toList!6055 lt!423783) k0!1099))))

(assert (=> d!113681 (= (contains!5115 lt!423783 k0!1099) lt!423980)))

(declare-fun b!938679 () Bool)

(declare-fun lt!423979 () Unit!31700)

(assert (=> b!938679 (= e!527190 lt!423979)))

(assert (=> b!938679 (= lt!423979 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423783) k0!1099))))

(assert (=> b!938679 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423783) k0!1099))))

(declare-fun b!938680 () Bool)

(declare-fun Unit!31712 () Unit!31700)

(assert (=> b!938680 (= e!527190 Unit!31712)))

(declare-fun b!938681 () Bool)

(assert (=> b!938681 (= e!527191 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423783) k0!1099)))))

(assert (= (and d!113681 c!97850) b!938679))

(assert (= (and d!113681 (not c!97850)) b!938680))

(assert (= (and d!113681 (not res!631514)) b!938681))

(declare-fun m!874085 () Bool)

(assert (=> d!113681 m!874085))

(declare-fun m!874087 () Bool)

(assert (=> b!938679 m!874087))

(assert (=> b!938679 m!874071))

(assert (=> b!938679 m!874071))

(declare-fun m!874089 () Bool)

(assert (=> b!938679 m!874089))

(assert (=> b!938681 m!874071))

(assert (=> b!938681 m!874071))

(assert (=> b!938681 m!874089))

(assert (=> b!938454 d!113681))

(declare-fun b!938682 () Bool)

(declare-fun e!527202 () Bool)

(declare-fun e!527196 () Bool)

(assert (=> b!938682 (= e!527202 e!527196)))

(declare-fun res!631520 () Bool)

(declare-fun call!40867 () Bool)

(assert (=> b!938682 (= res!631520 call!40867)))

(assert (=> b!938682 (=> (not res!631520) (not e!527196))))

(declare-fun b!938683 () Bool)

(declare-fun e!527201 () Bool)

(declare-fun lt!423993 () ListLongMap!12079)

(assert (=> b!938683 (= e!527201 (= (apply!856 lt!423993 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40860 () Bool)

(declare-fun call!40865 () ListLongMap!12079)

(assert (=> bm!40860 (= call!40865 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!938684 () Bool)

(declare-fun e!527203 () Bool)

(declare-fun call!40866 () Bool)

(assert (=> b!938684 (= e!527203 (not call!40866))))

(declare-fun b!938685 () Bool)

(declare-fun e!527204 () ListLongMap!12079)

(declare-fun call!40863 () ListLongMap!12079)

(assert (=> b!938685 (= e!527204 call!40863)))

(declare-fun b!938686 () Bool)

(assert (=> b!938686 (= e!527203 e!527201)))

(declare-fun res!631515 () Bool)

(assert (=> b!938686 (= res!631515 call!40866)))

(assert (=> b!938686 (=> (not res!631515) (not e!527201))))

(declare-fun e!527194 () Bool)

(declare-fun b!938687 () Bool)

(assert (=> b!938687 (= e!527194 (= (apply!856 lt!423993 (select (arr!27175 _keys!1487) from!1844)) (get!14335 (select (arr!27176 _values!1231) from!1844) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938687 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27635 _values!1231)))))

(assert (=> b!938687 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27634 _keys!1487)))))

(declare-fun bm!40861 () Bool)

(assert (=> bm!40861 (= call!40867 (contains!5115 lt!423993 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40862 () Bool)

(declare-fun call!40869 () ListLongMap!12079)

(assert (=> bm!40862 (= call!40863 call!40869)))

(declare-fun d!113683 () Bool)

(declare-fun e!527193 () Bool)

(assert (=> d!113683 e!527193))

(declare-fun res!631517 () Bool)

(assert (=> d!113683 (=> (not res!631517) (not e!527193))))

(assert (=> d!113683 (= res!631517 (or (bvsge from!1844 (size!27634 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27634 _keys!1487)))))))

(declare-fun lt!423988 () ListLongMap!12079)

(assert (=> d!113683 (= lt!423993 lt!423988)))

(declare-fun lt!423996 () Unit!31700)

(declare-fun e!527195 () Unit!31700)

(assert (=> d!113683 (= lt!423996 e!527195)))

(declare-fun c!97851 () Bool)

(declare-fun e!527192 () Bool)

(assert (=> d!113683 (= c!97851 e!527192)))

(declare-fun res!631516 () Bool)

(assert (=> d!113683 (=> (not res!631516) (not e!527192))))

(assert (=> d!113683 (= res!631516 (bvslt from!1844 (size!27634 _keys!1487)))))

(declare-fun e!527200 () ListLongMap!12079)

(assert (=> d!113683 (= lt!423988 e!527200)))

(declare-fun c!97856 () Bool)

(assert (=> d!113683 (= c!97856 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113683 (validMask!0 mask!1881)))

(assert (=> d!113683 (= (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!423993)))

(declare-fun b!938688 () Bool)

(declare-fun Unit!31713 () Unit!31700)

(assert (=> b!938688 (= e!527195 Unit!31713)))

(declare-fun b!938689 () Bool)

(declare-fun res!631518 () Bool)

(assert (=> b!938689 (=> (not res!631518) (not e!527193))))

(declare-fun e!527197 () Bool)

(assert (=> b!938689 (= res!631518 e!527197)))

(declare-fun res!631519 () Bool)

(assert (=> b!938689 (=> res!631519 e!527197)))

(declare-fun e!527198 () Bool)

(assert (=> b!938689 (= res!631519 (not e!527198))))

(declare-fun res!631521 () Bool)

(assert (=> b!938689 (=> (not res!631521) (not e!527198))))

(assert (=> b!938689 (= res!631521 (bvslt from!1844 (size!27634 _keys!1487)))))

(declare-fun b!938690 () Bool)

(assert (=> b!938690 (= e!527193 e!527203)))

(declare-fun c!97855 () Bool)

(assert (=> b!938690 (= c!97855 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938691 () Bool)

(assert (=> b!938691 (= e!527200 (+!2842 call!40869 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!938692 () Bool)

(declare-fun res!631523 () Bool)

(assert (=> b!938692 (=> (not res!631523) (not e!527193))))

(assert (=> b!938692 (= res!631523 e!527202)))

(declare-fun c!97854 () Bool)

(assert (=> b!938692 (= c!97854 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!938693 () Bool)

(assert (=> b!938693 (= e!527196 (= (apply!856 lt!423993 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!938694 () Bool)

(assert (=> b!938694 (= e!527198 (validKeyInArray!0 (select (arr!27175 _keys!1487) from!1844)))))

(declare-fun call!40868 () ListLongMap!12079)

(declare-fun c!97852 () Bool)

(declare-fun bm!40863 () Bool)

(declare-fun call!40864 () ListLongMap!12079)

(assert (=> bm!40863 (= call!40869 (+!2842 (ite c!97856 call!40865 (ite c!97852 call!40868 call!40864)) (ite (or c!97856 c!97852) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!938695 () Bool)

(assert (=> b!938695 (= e!527197 e!527194)))

(declare-fun res!631522 () Bool)

(assert (=> b!938695 (=> (not res!631522) (not e!527194))))

(assert (=> b!938695 (= res!631522 (contains!5115 lt!423993 (select (arr!27175 _keys!1487) from!1844)))))

(assert (=> b!938695 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27634 _keys!1487)))))

(declare-fun b!938696 () Bool)

(declare-fun e!527199 () ListLongMap!12079)

(assert (=> b!938696 (= e!527200 e!527199)))

(assert (=> b!938696 (= c!97852 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40864 () Bool)

(assert (=> bm!40864 (= call!40866 (contains!5115 lt!423993 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938697 () Bool)

(declare-fun c!97853 () Bool)

(assert (=> b!938697 (= c!97853 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!938697 (= e!527199 e!527204)))

(declare-fun b!938698 () Bool)

(assert (=> b!938698 (= e!527202 (not call!40867))))

(declare-fun bm!40865 () Bool)

(assert (=> bm!40865 (= call!40868 call!40865)))

(declare-fun b!938699 () Bool)

(assert (=> b!938699 (= e!527204 call!40864)))

(declare-fun b!938700 () Bool)

(assert (=> b!938700 (= e!527192 (validKeyInArray!0 (select (arr!27175 _keys!1487) from!1844)))))

(declare-fun b!938701 () Bool)

(declare-fun lt!423998 () Unit!31700)

(assert (=> b!938701 (= e!527195 lt!423998)))

(declare-fun lt!423983 () ListLongMap!12079)

(assert (=> b!938701 (= lt!423983 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423989 () (_ BitVec 64))

(assert (=> b!938701 (= lt!423989 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423991 () (_ BitVec 64))

(assert (=> b!938701 (= lt!423991 (select (arr!27175 _keys!1487) from!1844))))

(declare-fun lt!424001 () Unit!31700)

(assert (=> b!938701 (= lt!424001 (addStillContains!561 lt!423983 lt!423989 zeroValue!1173 lt!423991))))

(assert (=> b!938701 (contains!5115 (+!2842 lt!423983 (tuple2!13383 lt!423989 zeroValue!1173)) lt!423991)))

(declare-fun lt!423985 () Unit!31700)

(assert (=> b!938701 (= lt!423985 lt!424001)))

(declare-fun lt!423997 () ListLongMap!12079)

(assert (=> b!938701 (= lt!423997 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423995 () (_ BitVec 64))

(assert (=> b!938701 (= lt!423995 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424000 () (_ BitVec 64))

(assert (=> b!938701 (= lt!424000 (select (arr!27175 _keys!1487) from!1844))))

(declare-fun lt!423987 () Unit!31700)

(assert (=> b!938701 (= lt!423987 (addApplyDifferent!441 lt!423997 lt!423995 minValue!1173 lt!424000))))

(assert (=> b!938701 (= (apply!856 (+!2842 lt!423997 (tuple2!13383 lt!423995 minValue!1173)) lt!424000) (apply!856 lt!423997 lt!424000))))

(declare-fun lt!423990 () Unit!31700)

(assert (=> b!938701 (= lt!423990 lt!423987)))

(declare-fun lt!423999 () ListLongMap!12079)

(assert (=> b!938701 (= lt!423999 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423986 () (_ BitVec 64))

(assert (=> b!938701 (= lt!423986 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424002 () (_ BitVec 64))

(assert (=> b!938701 (= lt!424002 (select (arr!27175 _keys!1487) from!1844))))

(declare-fun lt!423984 () Unit!31700)

(assert (=> b!938701 (= lt!423984 (addApplyDifferent!441 lt!423999 lt!423986 zeroValue!1173 lt!424002))))

(assert (=> b!938701 (= (apply!856 (+!2842 lt!423999 (tuple2!13383 lt!423986 zeroValue!1173)) lt!424002) (apply!856 lt!423999 lt!424002))))

(declare-fun lt!424003 () Unit!31700)

(assert (=> b!938701 (= lt!424003 lt!423984)))

(declare-fun lt!423994 () ListLongMap!12079)

(assert (=> b!938701 (= lt!423994 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!424004 () (_ BitVec 64))

(assert (=> b!938701 (= lt!424004 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423992 () (_ BitVec 64))

(assert (=> b!938701 (= lt!423992 (select (arr!27175 _keys!1487) from!1844))))

(assert (=> b!938701 (= lt!423998 (addApplyDifferent!441 lt!423994 lt!424004 minValue!1173 lt!423992))))

(assert (=> b!938701 (= (apply!856 (+!2842 lt!423994 (tuple2!13383 lt!424004 minValue!1173)) lt!423992) (apply!856 lt!423994 lt!423992))))

(declare-fun b!938702 () Bool)

(assert (=> b!938702 (= e!527199 call!40863)))

(declare-fun bm!40866 () Bool)

(assert (=> bm!40866 (= call!40864 call!40868)))

(assert (= (and d!113683 c!97856) b!938691))

(assert (= (and d!113683 (not c!97856)) b!938696))

(assert (= (and b!938696 c!97852) b!938702))

(assert (= (and b!938696 (not c!97852)) b!938697))

(assert (= (and b!938697 c!97853) b!938685))

(assert (= (and b!938697 (not c!97853)) b!938699))

(assert (= (or b!938685 b!938699) bm!40866))

(assert (= (or b!938702 bm!40866) bm!40865))

(assert (= (or b!938702 b!938685) bm!40862))

(assert (= (or b!938691 bm!40865) bm!40860))

(assert (= (or b!938691 bm!40862) bm!40863))

(assert (= (and d!113683 res!631516) b!938700))

(assert (= (and d!113683 c!97851) b!938701))

(assert (= (and d!113683 (not c!97851)) b!938688))

(assert (= (and d!113683 res!631517) b!938689))

(assert (= (and b!938689 res!631521) b!938694))

(assert (= (and b!938689 (not res!631519)) b!938695))

(assert (= (and b!938695 res!631522) b!938687))

(assert (= (and b!938689 res!631518) b!938692))

(assert (= (and b!938692 c!97854) b!938682))

(assert (= (and b!938692 (not c!97854)) b!938698))

(assert (= (and b!938682 res!631520) b!938693))

(assert (= (or b!938682 b!938698) bm!40861))

(assert (= (and b!938692 res!631523) b!938690))

(assert (= (and b!938690 c!97855) b!938686))

(assert (= (and b!938690 (not c!97855)) b!938684))

(assert (= (and b!938686 res!631515) b!938683))

(assert (= (or b!938686 b!938684) bm!40864))

(declare-fun b_lambda!14225 () Bool)

(assert (=> (not b_lambda!14225) (not b!938687)))

(assert (=> b!938687 t!27459))

(declare-fun b_and!29143 () Bool)

(assert (= b_and!29141 (and (=> t!27459 result!12137) b_and!29143)))

(assert (=> b!938695 m!874067))

(assert (=> b!938695 m!874067))

(declare-fun m!874091 () Bool)

(assert (=> b!938695 m!874091))

(declare-fun m!874093 () Bool)

(assert (=> b!938691 m!874093))

(declare-fun m!874095 () Bool)

(assert (=> bm!40863 m!874095))

(declare-fun m!874097 () Bool)

(assert (=> b!938693 m!874097))

(assert (=> b!938700 m!874067))

(assert (=> b!938700 m!874067))

(declare-fun m!874099 () Bool)

(assert (=> b!938700 m!874099))

(assert (=> b!938694 m!874067))

(assert (=> b!938694 m!874067))

(assert (=> b!938694 m!874099))

(declare-fun m!874101 () Bool)

(assert (=> bm!40861 m!874101))

(declare-fun m!874103 () Bool)

(assert (=> bm!40864 m!874103))

(declare-fun m!874105 () Bool)

(assert (=> b!938683 m!874105))

(declare-fun m!874107 () Bool)

(assert (=> b!938701 m!874107))

(declare-fun m!874109 () Bool)

(assert (=> b!938701 m!874109))

(assert (=> b!938701 m!874109))

(declare-fun m!874111 () Bool)

(assert (=> b!938701 m!874111))

(declare-fun m!874113 () Bool)

(assert (=> b!938701 m!874113))

(assert (=> b!938701 m!874067))

(declare-fun m!874115 () Bool)

(assert (=> b!938701 m!874115))

(declare-fun m!874117 () Bool)

(assert (=> b!938701 m!874117))

(assert (=> b!938701 m!874115))

(declare-fun m!874119 () Bool)

(assert (=> b!938701 m!874119))

(declare-fun m!874121 () Bool)

(assert (=> b!938701 m!874121))

(declare-fun m!874123 () Bool)

(assert (=> b!938701 m!874123))

(declare-fun m!874125 () Bool)

(assert (=> b!938701 m!874125))

(declare-fun m!874127 () Bool)

(assert (=> b!938701 m!874127))

(declare-fun m!874129 () Bool)

(assert (=> b!938701 m!874129))

(declare-fun m!874131 () Bool)

(assert (=> b!938701 m!874131))

(assert (=> b!938701 m!874121))

(declare-fun m!874133 () Bool)

(assert (=> b!938701 m!874133))

(declare-fun m!874135 () Bool)

(assert (=> b!938701 m!874135))

(declare-fun m!874137 () Bool)

(assert (=> b!938701 m!874137))

(assert (=> b!938701 m!874127))

(assert (=> bm!40860 m!874117))

(assert (=> b!938687 m!873771))

(declare-fun m!874139 () Bool)

(assert (=> b!938687 m!874139))

(assert (=> b!938687 m!873771))

(declare-fun m!874141 () Bool)

(assert (=> b!938687 m!874141))

(assert (=> b!938687 m!874067))

(assert (=> b!938687 m!874139))

(assert (=> b!938687 m!874067))

(declare-fun m!874143 () Bool)

(assert (=> b!938687 m!874143))

(assert (=> d!113683 m!873795))

(assert (=> b!938454 d!113683))

(declare-fun d!113685 () Bool)

(assert (=> d!113685 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938444 d!113685))

(declare-fun condMapEmpty!32179 () Bool)

(declare-fun mapDefault!32179 () ValueCell!9651)

(assert (=> mapNonEmpty!32173 (= condMapEmpty!32179 (= mapRest!32173 ((as const (Array (_ BitVec 32) ValueCell!9651)) mapDefault!32179)))))

(declare-fun e!527210 () Bool)

(declare-fun mapRes!32179 () Bool)

(assert (=> mapNonEmpty!32173 (= tp!61730 (and e!527210 mapRes!32179))))

(declare-fun mapNonEmpty!32179 () Bool)

(declare-fun tp!61740 () Bool)

(declare-fun e!527209 () Bool)

(assert (=> mapNonEmpty!32179 (= mapRes!32179 (and tp!61740 e!527209))))

(declare-fun mapRest!32179 () (Array (_ BitVec 32) ValueCell!9651))

(declare-fun mapKey!32179 () (_ BitVec 32))

(declare-fun mapValue!32179 () ValueCell!9651)

(assert (=> mapNonEmpty!32179 (= mapRest!32173 (store mapRest!32179 mapKey!32179 mapValue!32179))))

(declare-fun mapIsEmpty!32179 () Bool)

(assert (=> mapIsEmpty!32179 mapRes!32179))

(declare-fun b!938709 () Bool)

(assert (=> b!938709 (= e!527209 tp_is_empty!20265)))

(declare-fun b!938710 () Bool)

(assert (=> b!938710 (= e!527210 tp_is_empty!20265)))

(assert (= (and mapNonEmpty!32173 condMapEmpty!32179) mapIsEmpty!32179))

(assert (= (and mapNonEmpty!32173 (not condMapEmpty!32179)) mapNonEmpty!32179))

(assert (= (and mapNonEmpty!32179 ((_ is ValueCellFull!9651) mapValue!32179)) b!938709))

(assert (= (and mapNonEmpty!32173 ((_ is ValueCellFull!9651) mapDefault!32179)) b!938710))

(declare-fun m!874145 () Bool)

(assert (=> mapNonEmpty!32179 m!874145))

(declare-fun b_lambda!14227 () Bool)

(assert (= b_lambda!14219 (or (and start!79784 b_free!17757) b_lambda!14227)))

(declare-fun b_lambda!14229 () Bool)

(assert (= b_lambda!14225 (or (and start!79784 b_free!17757) b_lambda!14229)))

(declare-fun b_lambda!14231 () Bool)

(assert (= b_lambda!14223 (or (and start!79784 b_free!17757) b_lambda!14231)))

(declare-fun b_lambda!14233 () Bool)

(assert (= b_lambda!14221 (or (and start!79784 b_free!17757) b_lambda!14233)))

(check-sat (not b!938695) (not b!938642) (not b!938650) (not d!113657) (not b_next!17757) (not b_lambda!14233) (not bm!40845) (not d!113647) (not b!938587) (not b!938628) (not bm!40854) (not d!113663) (not b!938658) (not b!938585) (not b!938592) (not d!113665) (not d!113651) (not d!113649) (not b!938579) (not b!938603) (not b!938657) (not bm!40843) (not b!938621) (not bm!40842) (not b!938681) (not b!938679) (not b!938638) (not d!113641) (not d!113653) (not b!938687) (not b!938627) (not bm!40849) (not b!938691) (not bm!40863) (not d!113637) (not bm!40860) (not b!938630) (not b!938530) (not b!938600) tp_is_empty!20265 (not b!938694) (not b!938583) (not d!113683) (not b!938648) (not b_lambda!14227) (not b!938634) (not b!938660) (not bm!40861) (not b!938693) (not b!938641) (not b!938675) (not bm!40850) (not d!113659) (not b!938616) (not bm!40853) (not bm!40851) (not d!113645) (not b!938666) (not b!938701) (not b!938593) b_and!29143 (not d!113669) (not b!938575) (not b!938614) (not b!938676) (not b_lambda!14231) (not b!938700) (not b!938647) (not b!938683) (not mapNonEmpty!32179) (not b!938528) (not b!938586) (not bm!40827) (not b_lambda!14217) (not b!938640) (not bm!40859) (not d!113639) (not bm!40864) (not b!938531) (not b_lambda!14229) (not d!113655) (not bm!40846) (not b!938651) (not d!113681) (not b!938602) (not b!938598) (not d!113677) (not b!938656))
(check-sat b_and!29143 (not b_next!17757))
(get-model)

(declare-fun d!113687 () Bool)

(assert (=> d!113687 (= (get!14339 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938657 d!113687))

(declare-fun d!113689 () Bool)

(assert (=> d!113689 (= (apply!856 lt!423944 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14337 (getValueByKey!484 (toList!6055 lt!423944) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26355 () Bool)

(assert (= bs!26355 d!113689))

(declare-fun m!874147 () Bool)

(assert (=> bs!26355 m!874147))

(assert (=> bs!26355 m!874147))

(declare-fun m!874149 () Bool)

(assert (=> bs!26355 m!874149))

(assert (=> b!938640 d!113689))

(declare-fun d!113691 () Bool)

(declare-fun res!631524 () Bool)

(declare-fun e!527211 () Bool)

(assert (=> d!113691 (=> res!631524 e!527211)))

(assert (=> d!113691 (= res!631524 (= (select (arr!27175 _keys!1487) (bvadd from!1844 #b00000000000000000000000000000001)) k0!1099))))

(assert (=> d!113691 (= (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)) e!527211)))

(declare-fun b!938711 () Bool)

(declare-fun e!527212 () Bool)

(assert (=> b!938711 (= e!527211 e!527212)))

(declare-fun res!631525 () Bool)

(assert (=> b!938711 (=> (not res!631525) (not e!527212))))

(assert (=> b!938711 (= res!631525 (bvslt (bvadd from!1844 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(declare-fun b!938712 () Bool)

(assert (=> b!938712 (= e!527212 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!113691 (not res!631524)) b!938711))

(assert (= (and b!938711 res!631525) b!938712))

(declare-fun m!874151 () Bool)

(assert (=> d!113691 m!874151))

(declare-fun m!874153 () Bool)

(assert (=> b!938712 m!874153))

(assert (=> b!938666 d!113691))

(declare-fun d!113693 () Bool)

(declare-fun lt!424007 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!410 (List!19159) (InoxSet tuple2!13382))

(assert (=> d!113693 (= lt!424007 (select (content!410 (toList!6055 lt!423932)) lt!423782))))

(declare-fun e!527217 () Bool)

(assert (=> d!113693 (= lt!424007 e!527217)))

(declare-fun res!631531 () Bool)

(assert (=> d!113693 (=> (not res!631531) (not e!527217))))

(assert (=> d!113693 (= res!631531 ((_ is Cons!19155) (toList!6055 lt!423932)))))

(assert (=> d!113693 (= (contains!5118 (toList!6055 lt!423932) lt!423782) lt!424007)))

(declare-fun b!938717 () Bool)

(declare-fun e!527218 () Bool)

(assert (=> b!938717 (= e!527217 e!527218)))

(declare-fun res!631530 () Bool)

(assert (=> b!938717 (=> res!631530 e!527218)))

(assert (=> b!938717 (= res!631530 (= (h!20301 (toList!6055 lt!423932)) lt!423782))))

(declare-fun b!938718 () Bool)

(assert (=> b!938718 (= e!527218 (contains!5118 (t!27460 (toList!6055 lt!423932)) lt!423782))))

(assert (= (and d!113693 res!631531) b!938717))

(assert (= (and b!938717 (not res!631530)) b!938718))

(declare-fun m!874155 () Bool)

(assert (=> d!113693 m!874155))

(declare-fun m!874157 () Bool)

(assert (=> d!113693 m!874157))

(declare-fun m!874159 () Bool)

(assert (=> b!938718 m!874159))

(assert (=> b!938628 d!113693))

(declare-fun b!938719 () Bool)

(declare-fun e!527222 () Bool)

(declare-fun call!40870 () Bool)

(assert (=> b!938719 (= e!527222 call!40870)))

(declare-fun b!938720 () Bool)

(declare-fun e!527219 () Bool)

(assert (=> b!938720 (= e!527219 (contains!5117 (ite c!97830 (Cons!19156 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19157) Nil!19157) (select (arr!27175 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!938721 () Bool)

(assert (=> b!938721 (= e!527222 call!40870)))

(declare-fun d!113695 () Bool)

(declare-fun res!631532 () Bool)

(declare-fun e!527221 () Bool)

(assert (=> d!113695 (=> res!631532 e!527221)))

(assert (=> d!113695 (= res!631532 (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(assert (=> d!113695 (= (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97830 (Cons!19156 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19157) Nil!19157)) e!527221)))

(declare-fun c!97857 () Bool)

(declare-fun bm!40867 () Bool)

(assert (=> bm!40867 (= call!40870 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!97857 (Cons!19156 (select (arr!27175 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (ite c!97830 (Cons!19156 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19157) Nil!19157)) (ite c!97830 (Cons!19156 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19157) Nil!19157))))))

(declare-fun b!938722 () Bool)

(declare-fun e!527220 () Bool)

(assert (=> b!938722 (= e!527220 e!527222)))

(assert (=> b!938722 (= c!97857 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!938723 () Bool)

(assert (=> b!938723 (= e!527221 e!527220)))

(declare-fun res!631533 () Bool)

(assert (=> b!938723 (=> (not res!631533) (not e!527220))))

(assert (=> b!938723 (= res!631533 (not e!527219))))

(declare-fun res!631534 () Bool)

(assert (=> b!938723 (=> (not res!631534) (not e!527219))))

(assert (=> b!938723 (= res!631534 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(assert (= (and d!113695 (not res!631532)) b!938723))

(assert (= (and b!938723 res!631534) b!938720))

(assert (= (and b!938723 res!631533) b!938722))

(assert (= (and b!938722 c!97857) b!938721))

(assert (= (and b!938722 (not c!97857)) b!938719))

(assert (= (or b!938721 b!938719) bm!40867))

(declare-fun m!874161 () Bool)

(assert (=> b!938720 m!874161))

(assert (=> b!938720 m!874161))

(declare-fun m!874163 () Bool)

(assert (=> b!938720 m!874163))

(assert (=> bm!40867 m!874161))

(declare-fun m!874165 () Bool)

(assert (=> bm!40867 m!874165))

(assert (=> b!938722 m!874161))

(assert (=> b!938722 m!874161))

(declare-fun m!874167 () Bool)

(assert (=> b!938722 m!874167))

(assert (=> b!938723 m!874161))

(assert (=> b!938723 m!874161))

(assert (=> b!938723 m!874167))

(assert (=> bm!40849 d!113695))

(declare-fun b!938748 () Bool)

(assert (=> b!938748 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27634 _keys!1487)))))

(assert (=> b!938748 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27635 _values!1231)))))

(declare-fun e!527242 () Bool)

(declare-fun lt!424027 () ListLongMap!12079)

(assert (=> b!938748 (= e!527242 (= (apply!856 lt!424027 (select (arr!27175 _keys!1487) from!1844)) (get!14335 (select (arr!27176 _values!1231) from!1844) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!938749 () Bool)

(declare-fun e!527241 () ListLongMap!12079)

(declare-fun call!40873 () ListLongMap!12079)

(assert (=> b!938749 (= e!527241 call!40873)))

(declare-fun bm!40870 () Bool)

(assert (=> bm!40870 (= call!40873 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!527238 () Bool)

(declare-fun b!938750 () Bool)

(assert (=> b!938750 (= e!527238 (= lt!424027 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!938751 () Bool)

(declare-fun isEmpty!698 (ListLongMap!12079) Bool)

(assert (=> b!938751 (= e!527238 (isEmpty!698 lt!424027))))

(declare-fun d!113697 () Bool)

(declare-fun e!527237 () Bool)

(assert (=> d!113697 e!527237))

(declare-fun res!631545 () Bool)

(assert (=> d!113697 (=> (not res!631545) (not e!527237))))

(assert (=> d!113697 (= res!631545 (not (contains!5115 lt!424027 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!527243 () ListLongMap!12079)

(assert (=> d!113697 (= lt!424027 e!527243)))

(declare-fun c!97868 () Bool)

(assert (=> d!113697 (= c!97868 (bvsge from!1844 (size!27634 _keys!1487)))))

(assert (=> d!113697 (validMask!0 mask!1881)))

(assert (=> d!113697 (= (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!424027)))

(declare-fun b!938752 () Bool)

(declare-fun e!527239 () Bool)

(assert (=> b!938752 (= e!527239 e!527238)))

(declare-fun c!97869 () Bool)

(assert (=> b!938752 (= c!97869 (bvslt from!1844 (size!27634 _keys!1487)))))

(declare-fun b!938753 () Bool)

(declare-fun e!527240 () Bool)

(assert (=> b!938753 (= e!527240 (validKeyInArray!0 (select (arr!27175 _keys!1487) from!1844)))))

(assert (=> b!938753 (bvsge from!1844 #b00000000000000000000000000000000)))

(declare-fun b!938754 () Bool)

(assert (=> b!938754 (= e!527237 e!527239)))

(declare-fun c!97866 () Bool)

(assert (=> b!938754 (= c!97866 e!527240)))

(declare-fun res!631544 () Bool)

(assert (=> b!938754 (=> (not res!631544) (not e!527240))))

(assert (=> b!938754 (= res!631544 (bvslt from!1844 (size!27634 _keys!1487)))))

(declare-fun b!938755 () Bool)

(assert (=> b!938755 (= e!527243 (ListLongMap!12080 Nil!19156))))

(declare-fun b!938756 () Bool)

(declare-fun res!631546 () Bool)

(assert (=> b!938756 (=> (not res!631546) (not e!527237))))

(assert (=> b!938756 (= res!631546 (not (contains!5115 lt!424027 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!938757 () Bool)

(assert (=> b!938757 (= e!527243 e!527241)))

(declare-fun c!97867 () Bool)

(assert (=> b!938757 (= c!97867 (validKeyInArray!0 (select (arr!27175 _keys!1487) from!1844)))))

(declare-fun b!938758 () Bool)

(declare-fun lt!424022 () Unit!31700)

(declare-fun lt!424023 () Unit!31700)

(assert (=> b!938758 (= lt!424022 lt!424023)))

(declare-fun lt!424026 () V!31985)

(declare-fun lt!424025 () (_ BitVec 64))

(declare-fun lt!424028 () ListLongMap!12079)

(declare-fun lt!424024 () (_ BitVec 64))

(assert (=> b!938758 (not (contains!5115 (+!2842 lt!424028 (tuple2!13383 lt!424024 lt!424026)) lt!424025))))

(declare-fun addStillNotContains!221 (ListLongMap!12079 (_ BitVec 64) V!31985 (_ BitVec 64)) Unit!31700)

(assert (=> b!938758 (= lt!424023 (addStillNotContains!221 lt!424028 lt!424024 lt!424026 lt!424025))))

(assert (=> b!938758 (= lt!424025 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!938758 (= lt!424026 (get!14335 (select (arr!27176 _values!1231) from!1844) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!938758 (= lt!424024 (select (arr!27175 _keys!1487) from!1844))))

(assert (=> b!938758 (= lt!424028 call!40873)))

(assert (=> b!938758 (= e!527241 (+!2842 call!40873 (tuple2!13383 (select (arr!27175 _keys!1487) from!1844) (get!14335 (select (arr!27176 _values!1231) from!1844) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!938759 () Bool)

(assert (=> b!938759 (= e!527239 e!527242)))

(assert (=> b!938759 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27634 _keys!1487)))))

(declare-fun res!631543 () Bool)

(assert (=> b!938759 (= res!631543 (contains!5115 lt!424027 (select (arr!27175 _keys!1487) from!1844)))))

(assert (=> b!938759 (=> (not res!631543) (not e!527242))))

(assert (= (and d!113697 c!97868) b!938755))

(assert (= (and d!113697 (not c!97868)) b!938757))

(assert (= (and b!938757 c!97867) b!938758))

(assert (= (and b!938757 (not c!97867)) b!938749))

(assert (= (or b!938758 b!938749) bm!40870))

(assert (= (and d!113697 res!631545) b!938756))

(assert (= (and b!938756 res!631546) b!938754))

(assert (= (and b!938754 res!631544) b!938753))

(assert (= (and b!938754 c!97866) b!938759))

(assert (= (and b!938754 (not c!97866)) b!938752))

(assert (= (and b!938759 res!631543) b!938748))

(assert (= (and b!938752 c!97869) b!938750))

(assert (= (and b!938752 (not c!97869)) b!938751))

(declare-fun b_lambda!14235 () Bool)

(assert (=> (not b_lambda!14235) (not b!938748)))

(assert (=> b!938748 t!27459))

(declare-fun b_and!29145 () Bool)

(assert (= b_and!29143 (and (=> t!27459 result!12137) b_and!29145)))

(declare-fun b_lambda!14237 () Bool)

(assert (=> (not b_lambda!14237) (not b!938758)))

(assert (=> b!938758 t!27459))

(declare-fun b_and!29147 () Bool)

(assert (= b_and!29145 (and (=> t!27459 result!12137) b_and!29147)))

(declare-fun m!874169 () Bool)

(assert (=> d!113697 m!874169))

(assert (=> d!113697 m!873795))

(declare-fun m!874171 () Bool)

(assert (=> b!938758 m!874171))

(assert (=> b!938758 m!873771))

(assert (=> b!938758 m!874139))

(assert (=> b!938758 m!873771))

(assert (=> b!938758 m!874141))

(declare-fun m!874173 () Bool)

(assert (=> b!938758 m!874173))

(declare-fun m!874175 () Bool)

(assert (=> b!938758 m!874175))

(assert (=> b!938758 m!874139))

(assert (=> b!938758 m!874173))

(declare-fun m!874177 () Bool)

(assert (=> b!938758 m!874177))

(assert (=> b!938758 m!874067))

(assert (=> b!938757 m!874067))

(assert (=> b!938757 m!874067))

(assert (=> b!938757 m!874099))

(declare-fun m!874179 () Bool)

(assert (=> b!938751 m!874179))

(declare-fun m!874181 () Bool)

(assert (=> b!938750 m!874181))

(assert (=> b!938748 m!874067))

(declare-fun m!874183 () Bool)

(assert (=> b!938748 m!874183))

(assert (=> b!938748 m!874067))

(assert (=> b!938748 m!873771))

(assert (=> b!938748 m!874139))

(assert (=> b!938748 m!873771))

(assert (=> b!938748 m!874141))

(assert (=> b!938748 m!874139))

(assert (=> bm!40870 m!874181))

(assert (=> b!938759 m!874067))

(assert (=> b!938759 m!874067))

(declare-fun m!874185 () Bool)

(assert (=> b!938759 m!874185))

(assert (=> b!938753 m!874067))

(assert (=> b!938753 m!874067))

(assert (=> b!938753 m!874099))

(declare-fun m!874187 () Bool)

(assert (=> b!938756 m!874187))

(assert (=> bm!40860 d!113697))

(declare-fun d!113699 () Bool)

(declare-fun lt!424031 () Bool)

(declare-fun content!411 (List!19160) (InoxSet (_ BitVec 64)))

(assert (=> d!113699 (= lt!424031 (select (content!411 Nil!19157) (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!527248 () Bool)

(assert (=> d!113699 (= lt!424031 e!527248)))

(declare-fun res!631552 () Bool)

(assert (=> d!113699 (=> (not res!631552) (not e!527248))))

(assert (=> d!113699 (= res!631552 ((_ is Cons!19156) Nil!19157))))

(assert (=> d!113699 (= (contains!5117 Nil!19157 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) lt!424031)))

(declare-fun b!938764 () Bool)

(declare-fun e!527249 () Bool)

(assert (=> b!938764 (= e!527248 e!527249)))

(declare-fun res!631551 () Bool)

(assert (=> b!938764 (=> res!631551 e!527249)))

(assert (=> b!938764 (= res!631551 (= (h!20302 Nil!19157) (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938765 () Bool)

(assert (=> b!938765 (= e!527249 (contains!5117 (t!27461 Nil!19157) (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (= (and d!113699 res!631552) b!938764))

(assert (= (and b!938764 (not res!631551)) b!938765))

(declare-fun m!874189 () Bool)

(assert (=> d!113699 m!874189))

(assert (=> d!113699 m!873757))

(declare-fun m!874191 () Bool)

(assert (=> d!113699 m!874191))

(assert (=> b!938765 m!873757))

(declare-fun m!874193 () Bool)

(assert (=> b!938765 m!874193))

(assert (=> b!938600 d!113699))

(assert (=> d!113637 d!113671))

(declare-fun d!113701 () Bool)

(declare-fun e!527251 () Bool)

(assert (=> d!113701 e!527251))

(declare-fun res!631553 () Bool)

(assert (=> d!113701 (=> res!631553 e!527251)))

(declare-fun lt!424033 () Bool)

(assert (=> d!113701 (= res!631553 (not lt!424033))))

(declare-fun lt!424035 () Bool)

(assert (=> d!113701 (= lt!424033 lt!424035)))

(declare-fun lt!424034 () Unit!31700)

(declare-fun e!527250 () Unit!31700)

(assert (=> d!113701 (= lt!424034 e!527250)))

(declare-fun c!97870 () Bool)

(assert (=> d!113701 (= c!97870 lt!424035)))

(assert (=> d!113701 (= lt!424035 (containsKey!451 (toList!6055 (+!2842 lt!423783 (tuple2!13383 lt!423788 lt!423778))) k0!1099))))

(assert (=> d!113701 (= (contains!5115 (+!2842 lt!423783 (tuple2!13383 lt!423788 lt!423778)) k0!1099) lt!424033)))

(declare-fun b!938766 () Bool)

(declare-fun lt!424032 () Unit!31700)

(assert (=> b!938766 (= e!527250 lt!424032)))

(assert (=> b!938766 (= lt!424032 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 (+!2842 lt!423783 (tuple2!13383 lt!423788 lt!423778))) k0!1099))))

(assert (=> b!938766 (isDefined!356 (getValueByKey!484 (toList!6055 (+!2842 lt!423783 (tuple2!13383 lt!423788 lt!423778))) k0!1099))))

(declare-fun b!938767 () Bool)

(declare-fun Unit!31714 () Unit!31700)

(assert (=> b!938767 (= e!527250 Unit!31714)))

(declare-fun b!938768 () Bool)

(assert (=> b!938768 (= e!527251 (isDefined!356 (getValueByKey!484 (toList!6055 (+!2842 lt!423783 (tuple2!13383 lt!423788 lt!423778))) k0!1099)))))

(assert (= (and d!113701 c!97870) b!938766))

(assert (= (and d!113701 (not c!97870)) b!938767))

(assert (= (and d!113701 (not res!631553)) b!938768))

(declare-fun m!874195 () Bool)

(assert (=> d!113701 m!874195))

(declare-fun m!874197 () Bool)

(assert (=> b!938766 m!874197))

(declare-fun m!874199 () Bool)

(assert (=> b!938766 m!874199))

(assert (=> b!938766 m!874199))

(declare-fun m!874201 () Bool)

(assert (=> b!938766 m!874201))

(assert (=> b!938768 m!874199))

(assert (=> b!938768 m!874199))

(assert (=> b!938768 m!874201))

(assert (=> d!113639 d!113701))

(declare-fun d!113703 () Bool)

(declare-fun e!527252 () Bool)

(assert (=> d!113703 e!527252))

(declare-fun res!631554 () Bool)

(assert (=> d!113703 (=> (not res!631554) (not e!527252))))

(declare-fun lt!424038 () ListLongMap!12079)

(assert (=> d!113703 (= res!631554 (contains!5115 lt!424038 (_1!6702 (tuple2!13383 lt!423788 lt!423778))))))

(declare-fun lt!424036 () List!19159)

(assert (=> d!113703 (= lt!424038 (ListLongMap!12080 lt!424036))))

(declare-fun lt!424037 () Unit!31700)

(declare-fun lt!424039 () Unit!31700)

(assert (=> d!113703 (= lt!424037 lt!424039)))

(assert (=> d!113703 (= (getValueByKey!484 lt!424036 (_1!6702 (tuple2!13383 lt!423788 lt!423778))) (Some!489 (_2!6702 (tuple2!13383 lt!423788 lt!423778))))))

(assert (=> d!113703 (= lt!424039 (lemmaContainsTupThenGetReturnValue!260 lt!424036 (_1!6702 (tuple2!13383 lt!423788 lt!423778)) (_2!6702 (tuple2!13383 lt!423788 lt!423778))))))

(assert (=> d!113703 (= lt!424036 (insertStrictlySorted!317 (toList!6055 lt!423783) (_1!6702 (tuple2!13383 lt!423788 lt!423778)) (_2!6702 (tuple2!13383 lt!423788 lt!423778))))))

(assert (=> d!113703 (= (+!2842 lt!423783 (tuple2!13383 lt!423788 lt!423778)) lt!424038)))

(declare-fun b!938769 () Bool)

(declare-fun res!631555 () Bool)

(assert (=> b!938769 (=> (not res!631555) (not e!527252))))

(assert (=> b!938769 (= res!631555 (= (getValueByKey!484 (toList!6055 lt!424038) (_1!6702 (tuple2!13383 lt!423788 lt!423778))) (Some!489 (_2!6702 (tuple2!13383 lt!423788 lt!423778)))))))

(declare-fun b!938770 () Bool)

(assert (=> b!938770 (= e!527252 (contains!5118 (toList!6055 lt!424038) (tuple2!13383 lt!423788 lt!423778)))))

(assert (= (and d!113703 res!631554) b!938769))

(assert (= (and b!938769 res!631555) b!938770))

(declare-fun m!874203 () Bool)

(assert (=> d!113703 m!874203))

(declare-fun m!874205 () Bool)

(assert (=> d!113703 m!874205))

(declare-fun m!874207 () Bool)

(assert (=> d!113703 m!874207))

(declare-fun m!874209 () Bool)

(assert (=> d!113703 m!874209))

(declare-fun m!874211 () Bool)

(assert (=> b!938769 m!874211))

(declare-fun m!874213 () Bool)

(assert (=> b!938770 m!874213))

(assert (=> d!113639 d!113703))

(declare-fun d!113705 () Bool)

(assert (=> d!113705 (contains!5115 (+!2842 lt!423783 (tuple2!13383 lt!423788 lt!423778)) k0!1099)))

(assert (=> d!113705 true))

(declare-fun _$35!435 () Unit!31700)

(assert (=> d!113705 (= (choose!1559 lt!423783 lt!423788 lt!423778 k0!1099) _$35!435)))

(declare-fun bs!26356 () Bool)

(assert (= bs!26356 d!113705))

(assert (=> bs!26356 m!873939))

(assert (=> bs!26356 m!873939))

(assert (=> bs!26356 m!873941))

(assert (=> d!113639 d!113705))

(assert (=> d!113639 d!113681))

(declare-fun d!113707 () Bool)

(declare-fun lt!424040 () Bool)

(assert (=> d!113707 (= lt!424040 (select (content!410 (toList!6055 lt!423958)) lt!423782))))

(declare-fun e!527253 () Bool)

(assert (=> d!113707 (= lt!424040 e!527253)))

(declare-fun res!631557 () Bool)

(assert (=> d!113707 (=> (not res!631557) (not e!527253))))

(assert (=> d!113707 (= res!631557 ((_ is Cons!19155) (toList!6055 lt!423958)))))

(assert (=> d!113707 (= (contains!5118 (toList!6055 lt!423958) lt!423782) lt!424040)))

(declare-fun b!938772 () Bool)

(declare-fun e!527254 () Bool)

(assert (=> b!938772 (= e!527253 e!527254)))

(declare-fun res!631556 () Bool)

(assert (=> b!938772 (=> res!631556 e!527254)))

(assert (=> b!938772 (= res!631556 (= (h!20301 (toList!6055 lt!423958)) lt!423782))))

(declare-fun b!938773 () Bool)

(assert (=> b!938773 (= e!527254 (contains!5118 (t!27460 (toList!6055 lt!423958)) lt!423782))))

(assert (= (and d!113707 res!631557) b!938772))

(assert (= (and b!938772 (not res!631556)) b!938773))

(declare-fun m!874215 () Bool)

(assert (=> d!113707 m!874215))

(declare-fun m!874217 () Bool)

(assert (=> d!113707 m!874217))

(declare-fun m!874219 () Bool)

(assert (=> b!938773 m!874219))

(assert (=> b!938651 d!113707))

(declare-fun d!113709 () Bool)

(declare-fun e!527255 () Bool)

(assert (=> d!113709 e!527255))

(declare-fun res!631558 () Bool)

(assert (=> d!113709 (=> (not res!631558) (not e!527255))))

(declare-fun lt!424043 () ListLongMap!12079)

(assert (=> d!113709 (= res!631558 (contains!5115 lt!424043 (_1!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!424041 () List!19159)

(assert (=> d!113709 (= lt!424043 (ListLongMap!12080 lt!424041))))

(declare-fun lt!424042 () Unit!31700)

(declare-fun lt!424044 () Unit!31700)

(assert (=> d!113709 (= lt!424042 lt!424044)))

(assert (=> d!113709 (= (getValueByKey!484 lt!424041 (_1!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113709 (= lt!424044 (lemmaContainsTupThenGetReturnValue!260 lt!424041 (_1!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113709 (= lt!424041 (insertStrictlySorted!317 (toList!6055 call!40859) (_1!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113709 (= (+!2842 call!40859 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!424043)))

(declare-fun b!938774 () Bool)

(declare-fun res!631559 () Bool)

(assert (=> b!938774 (=> (not res!631559) (not e!527255))))

(assert (=> b!938774 (= res!631559 (= (getValueByKey!484 (toList!6055 lt!424043) (_1!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!938775 () Bool)

(assert (=> b!938775 (= e!527255 (contains!5118 (toList!6055 lt!424043) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113709 res!631558) b!938774))

(assert (= (and b!938774 res!631559) b!938775))

(declare-fun m!874221 () Bool)

(assert (=> d!113709 m!874221))

(declare-fun m!874223 () Bool)

(assert (=> d!113709 m!874223))

(declare-fun m!874225 () Bool)

(assert (=> d!113709 m!874225))

(declare-fun m!874227 () Bool)

(assert (=> d!113709 m!874227))

(declare-fun m!874229 () Bool)

(assert (=> b!938774 m!874229))

(declare-fun m!874231 () Bool)

(assert (=> b!938775 m!874231))

(assert (=> b!938638 d!113709))

(declare-fun d!113711 () Bool)

(declare-fun res!631564 () Bool)

(declare-fun e!527260 () Bool)

(assert (=> d!113711 (=> res!631564 e!527260)))

(assert (=> d!113711 (= res!631564 (and ((_ is Cons!19155) (toList!6055 lt!423776)) (= (_1!6702 (h!20301 (toList!6055 lt!423776))) k0!1099)))))

(assert (=> d!113711 (= (containsKey!451 (toList!6055 lt!423776) k0!1099) e!527260)))

(declare-fun b!938780 () Bool)

(declare-fun e!527261 () Bool)

(assert (=> b!938780 (= e!527260 e!527261)))

(declare-fun res!631565 () Bool)

(assert (=> b!938780 (=> (not res!631565) (not e!527261))))

(assert (=> b!938780 (= res!631565 (and (or (not ((_ is Cons!19155) (toList!6055 lt!423776))) (bvsle (_1!6702 (h!20301 (toList!6055 lt!423776))) k0!1099)) ((_ is Cons!19155) (toList!6055 lt!423776)) (bvslt (_1!6702 (h!20301 (toList!6055 lt!423776))) k0!1099)))))

(declare-fun b!938781 () Bool)

(assert (=> b!938781 (= e!527261 (containsKey!451 (t!27460 (toList!6055 lt!423776)) k0!1099))))

(assert (= (and d!113711 (not res!631564)) b!938780))

(assert (= (and b!938780 res!631565) b!938781))

(declare-fun m!874233 () Bool)

(assert (=> b!938781 m!874233))

(assert (=> d!113665 d!113711))

(declare-fun d!113713 () Bool)

(declare-fun e!527262 () Bool)

(assert (=> d!113713 e!527262))

(declare-fun res!631566 () Bool)

(assert (=> d!113713 (=> (not res!631566) (not e!527262))))

(declare-fun lt!424047 () ListLongMap!12079)

(assert (=> d!113713 (= res!631566 (contains!5115 lt!424047 (_1!6702 (ite (or c!97829 c!97825) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!424045 () List!19159)

(assert (=> d!113713 (= lt!424047 (ListLongMap!12080 lt!424045))))

(declare-fun lt!424046 () Unit!31700)

(declare-fun lt!424048 () Unit!31700)

(assert (=> d!113713 (= lt!424046 lt!424048)))

(assert (=> d!113713 (= (getValueByKey!484 lt!424045 (_1!6702 (ite (or c!97829 c!97825) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!489 (_2!6702 (ite (or c!97829 c!97825) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113713 (= lt!424048 (lemmaContainsTupThenGetReturnValue!260 lt!424045 (_1!6702 (ite (or c!97829 c!97825) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6702 (ite (or c!97829 c!97825) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113713 (= lt!424045 (insertStrictlySorted!317 (toList!6055 (ite c!97829 call!40847 (ite c!97825 call!40850 call!40846))) (_1!6702 (ite (or c!97829 c!97825) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6702 (ite (or c!97829 c!97825) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113713 (= (+!2842 (ite c!97829 call!40847 (ite c!97825 call!40850 call!40846)) (ite (or c!97829 c!97825) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!424047)))

(declare-fun b!938782 () Bool)

(declare-fun res!631567 () Bool)

(assert (=> b!938782 (=> (not res!631567) (not e!527262))))

(assert (=> b!938782 (= res!631567 (= (getValueByKey!484 (toList!6055 lt!424047) (_1!6702 (ite (or c!97829 c!97825) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!489 (_2!6702 (ite (or c!97829 c!97825) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!938783 () Bool)

(assert (=> b!938783 (= e!527262 (contains!5118 (toList!6055 lt!424047) (ite (or c!97829 c!97825) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113713 res!631566) b!938782))

(assert (= (and b!938782 res!631567) b!938783))

(declare-fun m!874235 () Bool)

(assert (=> d!113713 m!874235))

(declare-fun m!874237 () Bool)

(assert (=> d!113713 m!874237))

(declare-fun m!874239 () Bool)

(assert (=> d!113713 m!874239))

(declare-fun m!874241 () Bool)

(assert (=> d!113713 m!874241))

(declare-fun m!874243 () Bool)

(assert (=> b!938782 m!874243))

(declare-fun m!874245 () Bool)

(assert (=> b!938783 m!874245))

(assert (=> bm!40845 d!113713))

(declare-fun d!113715 () Bool)

(declare-fun e!527264 () Bool)

(assert (=> d!113715 e!527264))

(declare-fun res!631568 () Bool)

(assert (=> d!113715 (=> res!631568 e!527264)))

(declare-fun lt!424050 () Bool)

(assert (=> d!113715 (= res!631568 (not lt!424050))))

(declare-fun lt!424052 () Bool)

(assert (=> d!113715 (= lt!424050 lt!424052)))

(declare-fun lt!424051 () Unit!31700)

(declare-fun e!527263 () Unit!31700)

(assert (=> d!113715 (= lt!424051 e!527263)))

(declare-fun c!97871 () Bool)

(assert (=> d!113715 (= c!97871 lt!424052)))

(assert (=> d!113715 (= lt!424052 (containsKey!451 (toList!6055 lt!423993) (select (arr!27175 _keys!1487) from!1844)))))

(assert (=> d!113715 (= (contains!5115 lt!423993 (select (arr!27175 _keys!1487) from!1844)) lt!424050)))

(declare-fun b!938784 () Bool)

(declare-fun lt!424049 () Unit!31700)

(assert (=> b!938784 (= e!527263 lt!424049)))

(assert (=> b!938784 (= lt!424049 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423993) (select (arr!27175 _keys!1487) from!1844)))))

(assert (=> b!938784 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423993) (select (arr!27175 _keys!1487) from!1844)))))

(declare-fun b!938785 () Bool)

(declare-fun Unit!31715 () Unit!31700)

(assert (=> b!938785 (= e!527263 Unit!31715)))

(declare-fun b!938786 () Bool)

(assert (=> b!938786 (= e!527264 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423993) (select (arr!27175 _keys!1487) from!1844))))))

(assert (= (and d!113715 c!97871) b!938784))

(assert (= (and d!113715 (not c!97871)) b!938785))

(assert (= (and d!113715 (not res!631568)) b!938786))

(assert (=> d!113715 m!874067))

(declare-fun m!874247 () Bool)

(assert (=> d!113715 m!874247))

(assert (=> b!938784 m!874067))

(declare-fun m!874249 () Bool)

(assert (=> b!938784 m!874249))

(assert (=> b!938784 m!874067))

(declare-fun m!874251 () Bool)

(assert (=> b!938784 m!874251))

(assert (=> b!938784 m!874251))

(declare-fun m!874253 () Bool)

(assert (=> b!938784 m!874253))

(assert (=> b!938786 m!874067))

(assert (=> b!938786 m!874251))

(assert (=> b!938786 m!874251))

(assert (=> b!938786 m!874253))

(assert (=> b!938695 d!113715))

(assert (=> b!938598 d!113637))

(declare-fun d!113717 () Bool)

(declare-fun e!527265 () Bool)

(assert (=> d!113717 e!527265))

(declare-fun res!631569 () Bool)

(assert (=> d!113717 (=> (not res!631569) (not e!527265))))

(declare-fun lt!424055 () ListLongMap!12079)

(assert (=> d!113717 (= res!631569 (contains!5115 lt!424055 (_1!6702 (tuple2!13383 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!424053 () List!19159)

(assert (=> d!113717 (= lt!424055 (ListLongMap!12080 lt!424053))))

(declare-fun lt!424054 () Unit!31700)

(declare-fun lt!424056 () Unit!31700)

(assert (=> d!113717 (= lt!424054 lt!424056)))

(assert (=> d!113717 (= (getValueByKey!484 lt!424053 (_1!6702 (tuple2!13383 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!489 (_2!6702 (tuple2!13383 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113717 (= lt!424056 (lemmaContainsTupThenGetReturnValue!260 lt!424053 (_1!6702 (tuple2!13383 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!6702 (tuple2!13383 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113717 (= lt!424053 (insertStrictlySorted!317 (toList!6055 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)) (_1!6702 (tuple2!13383 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!6702 (tuple2!13383 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113717 (= (+!2842 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13383 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!424055)))

(declare-fun b!938787 () Bool)

(declare-fun res!631570 () Bool)

(assert (=> b!938787 (=> (not res!631570) (not e!527265))))

(assert (=> b!938787 (= res!631570 (= (getValueByKey!484 (toList!6055 lt!424055) (_1!6702 (tuple2!13383 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!489 (_2!6702 (tuple2!13383 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!938788 () Bool)

(assert (=> b!938788 (= e!527265 (contains!5118 (toList!6055 lt!424055) (tuple2!13383 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!113717 res!631569) b!938787))

(assert (= (and b!938787 res!631570) b!938788))

(declare-fun m!874255 () Bool)

(assert (=> d!113717 m!874255))

(declare-fun m!874257 () Bool)

(assert (=> d!113717 m!874257))

(declare-fun m!874259 () Bool)

(assert (=> d!113717 m!874259))

(declare-fun m!874261 () Bool)

(assert (=> d!113717 m!874261))

(declare-fun m!874263 () Bool)

(assert (=> b!938787 m!874263))

(declare-fun m!874265 () Bool)

(assert (=> b!938788 m!874265))

(assert (=> b!938598 d!113717))

(declare-fun b!938789 () Bool)

(declare-fun e!527276 () Bool)

(declare-fun e!527270 () Bool)

(assert (=> b!938789 (= e!527276 e!527270)))

(declare-fun res!631576 () Bool)

(declare-fun call!40878 () Bool)

(assert (=> b!938789 (= res!631576 call!40878)))

(assert (=> b!938789 (=> (not res!631576) (not e!527270))))

(declare-fun b!938790 () Bool)

(declare-fun e!527275 () Bool)

(declare-fun lt!424067 () ListLongMap!12079)

(assert (=> b!938790 (= e!527275 (= (apply!856 lt!424067 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun call!40876 () ListLongMap!12079)

(declare-fun bm!40871 () Bool)

(assert (=> bm!40871 (= call!40876 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!938791 () Bool)

(declare-fun e!527277 () Bool)

(declare-fun call!40877 () Bool)

(assert (=> b!938791 (= e!527277 (not call!40877))))

(declare-fun b!938792 () Bool)

(declare-fun e!527278 () ListLongMap!12079)

(declare-fun call!40874 () ListLongMap!12079)

(assert (=> b!938792 (= e!527278 call!40874)))

(declare-fun b!938793 () Bool)

(assert (=> b!938793 (= e!527277 e!527275)))

(declare-fun res!631571 () Bool)

(assert (=> b!938793 (= res!631571 call!40877)))

(assert (=> b!938793 (=> (not res!631571) (not e!527275))))

(declare-fun b!938794 () Bool)

(declare-fun e!527268 () Bool)

(assert (=> b!938794 (= e!527268 (= (apply!856 lt!424067 (select (arr!27175 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) (get!14335 (select (arr!27176 _values!1231) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938794 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27635 _values!1231)))))

(assert (=> b!938794 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(declare-fun bm!40872 () Bool)

(assert (=> bm!40872 (= call!40878 (contains!5115 lt!424067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40873 () Bool)

(declare-fun call!40880 () ListLongMap!12079)

(assert (=> bm!40873 (= call!40874 call!40880)))

(declare-fun d!113719 () Bool)

(declare-fun e!527267 () Bool)

(assert (=> d!113719 e!527267))

(declare-fun res!631573 () Bool)

(assert (=> d!113719 (=> (not res!631573) (not e!527267))))

(assert (=> d!113719 (= res!631573 (or (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27634 _keys!1487)) (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27634 _keys!1487)))))))

(declare-fun lt!424062 () ListLongMap!12079)

(assert (=> d!113719 (= lt!424067 lt!424062)))

(declare-fun lt!424070 () Unit!31700)

(declare-fun e!527269 () Unit!31700)

(assert (=> d!113719 (= lt!424070 e!527269)))

(declare-fun c!97872 () Bool)

(declare-fun e!527266 () Bool)

(assert (=> d!113719 (= c!97872 e!527266)))

(declare-fun res!631572 () Bool)

(assert (=> d!113719 (=> (not res!631572) (not e!527266))))

(assert (=> d!113719 (= res!631572 (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(declare-fun e!527274 () ListLongMap!12079)

(assert (=> d!113719 (= lt!424062 e!527274)))

(declare-fun c!97877 () Bool)

(assert (=> d!113719 (= c!97877 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113719 (validMask!0 mask!1881)))

(assert (=> d!113719 (= (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) lt!424067)))

(declare-fun b!938795 () Bool)

(declare-fun Unit!31716 () Unit!31700)

(assert (=> b!938795 (= e!527269 Unit!31716)))

(declare-fun b!938796 () Bool)

(declare-fun res!631574 () Bool)

(assert (=> b!938796 (=> (not res!631574) (not e!527267))))

(declare-fun e!527271 () Bool)

(assert (=> b!938796 (= res!631574 e!527271)))

(declare-fun res!631575 () Bool)

(assert (=> b!938796 (=> res!631575 e!527271)))

(declare-fun e!527272 () Bool)

(assert (=> b!938796 (= res!631575 (not e!527272))))

(declare-fun res!631577 () Bool)

(assert (=> b!938796 (=> (not res!631577) (not e!527272))))

(assert (=> b!938796 (= res!631577 (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(declare-fun b!938797 () Bool)

(assert (=> b!938797 (= e!527267 e!527277)))

(declare-fun c!97876 () Bool)

(assert (=> b!938797 (= c!97876 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938798 () Bool)

(assert (=> b!938798 (= e!527274 (+!2842 call!40880 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!938799 () Bool)

(declare-fun res!631579 () Bool)

(assert (=> b!938799 (=> (not res!631579) (not e!527267))))

(assert (=> b!938799 (= res!631579 e!527276)))

(declare-fun c!97875 () Bool)

(assert (=> b!938799 (= c!97875 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!938800 () Bool)

(assert (=> b!938800 (= e!527270 (= (apply!856 lt!424067 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!938801 () Bool)

(assert (=> b!938801 (= e!527272 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun call!40879 () ListLongMap!12079)

(declare-fun bm!40874 () Bool)

(declare-fun call!40875 () ListLongMap!12079)

(declare-fun c!97873 () Bool)

(assert (=> bm!40874 (= call!40880 (+!2842 (ite c!97877 call!40876 (ite c!97873 call!40879 call!40875)) (ite (or c!97877 c!97873) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!938802 () Bool)

(assert (=> b!938802 (= e!527271 e!527268)))

(declare-fun res!631578 () Bool)

(assert (=> b!938802 (=> (not res!631578) (not e!527268))))

(assert (=> b!938802 (= res!631578 (contains!5115 lt!424067 (select (arr!27175 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(assert (=> b!938802 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(declare-fun b!938803 () Bool)

(declare-fun e!527273 () ListLongMap!12079)

(assert (=> b!938803 (= e!527274 e!527273)))

(assert (=> b!938803 (= c!97873 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40875 () Bool)

(assert (=> bm!40875 (= call!40877 (contains!5115 lt!424067 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938804 () Bool)

(declare-fun c!97874 () Bool)

(assert (=> b!938804 (= c!97874 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!938804 (= e!527273 e!527278)))

(declare-fun b!938805 () Bool)

(assert (=> b!938805 (= e!527276 (not call!40878))))

(declare-fun bm!40876 () Bool)

(assert (=> bm!40876 (= call!40879 call!40876)))

(declare-fun b!938806 () Bool)

(assert (=> b!938806 (= e!527278 call!40875)))

(declare-fun b!938807 () Bool)

(assert (=> b!938807 (= e!527266 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!938808 () Bool)

(declare-fun lt!424072 () Unit!31700)

(assert (=> b!938808 (= e!527269 lt!424072)))

(declare-fun lt!424057 () ListLongMap!12079)

(assert (=> b!938808 (= lt!424057 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!424063 () (_ BitVec 64))

(assert (=> b!938808 (= lt!424063 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424065 () (_ BitVec 64))

(assert (=> b!938808 (= lt!424065 (select (arr!27175 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!424075 () Unit!31700)

(assert (=> b!938808 (= lt!424075 (addStillContains!561 lt!424057 lt!424063 zeroValue!1173 lt!424065))))

(assert (=> b!938808 (contains!5115 (+!2842 lt!424057 (tuple2!13383 lt!424063 zeroValue!1173)) lt!424065)))

(declare-fun lt!424059 () Unit!31700)

(assert (=> b!938808 (= lt!424059 lt!424075)))

(declare-fun lt!424071 () ListLongMap!12079)

(assert (=> b!938808 (= lt!424071 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!424069 () (_ BitVec 64))

(assert (=> b!938808 (= lt!424069 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424074 () (_ BitVec 64))

(assert (=> b!938808 (= lt!424074 (select (arr!27175 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!424061 () Unit!31700)

(assert (=> b!938808 (= lt!424061 (addApplyDifferent!441 lt!424071 lt!424069 minValue!1173 lt!424074))))

(assert (=> b!938808 (= (apply!856 (+!2842 lt!424071 (tuple2!13383 lt!424069 minValue!1173)) lt!424074) (apply!856 lt!424071 lt!424074))))

(declare-fun lt!424064 () Unit!31700)

(assert (=> b!938808 (= lt!424064 lt!424061)))

(declare-fun lt!424073 () ListLongMap!12079)

(assert (=> b!938808 (= lt!424073 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!424060 () (_ BitVec 64))

(assert (=> b!938808 (= lt!424060 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424076 () (_ BitVec 64))

(assert (=> b!938808 (= lt!424076 (select (arr!27175 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!424058 () Unit!31700)

(assert (=> b!938808 (= lt!424058 (addApplyDifferent!441 lt!424073 lt!424060 zeroValue!1173 lt!424076))))

(assert (=> b!938808 (= (apply!856 (+!2842 lt!424073 (tuple2!13383 lt!424060 zeroValue!1173)) lt!424076) (apply!856 lt!424073 lt!424076))))

(declare-fun lt!424077 () Unit!31700)

(assert (=> b!938808 (= lt!424077 lt!424058)))

(declare-fun lt!424068 () ListLongMap!12079)

(assert (=> b!938808 (= lt!424068 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!424078 () (_ BitVec 64))

(assert (=> b!938808 (= lt!424078 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424066 () (_ BitVec 64))

(assert (=> b!938808 (= lt!424066 (select (arr!27175 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (=> b!938808 (= lt!424072 (addApplyDifferent!441 lt!424068 lt!424078 minValue!1173 lt!424066))))

(assert (=> b!938808 (= (apply!856 (+!2842 lt!424068 (tuple2!13383 lt!424078 minValue!1173)) lt!424066) (apply!856 lt!424068 lt!424066))))

(declare-fun b!938809 () Bool)

(assert (=> b!938809 (= e!527273 call!40874)))

(declare-fun bm!40877 () Bool)

(assert (=> bm!40877 (= call!40875 call!40879)))

(assert (= (and d!113719 c!97877) b!938798))

(assert (= (and d!113719 (not c!97877)) b!938803))

(assert (= (and b!938803 c!97873) b!938809))

(assert (= (and b!938803 (not c!97873)) b!938804))

(assert (= (and b!938804 c!97874) b!938792))

(assert (= (and b!938804 (not c!97874)) b!938806))

(assert (= (or b!938792 b!938806) bm!40877))

(assert (= (or b!938809 bm!40877) bm!40876))

(assert (= (or b!938809 b!938792) bm!40873))

(assert (= (or b!938798 bm!40876) bm!40871))

(assert (= (or b!938798 bm!40873) bm!40874))

(assert (= (and d!113719 res!631572) b!938807))

(assert (= (and d!113719 c!97872) b!938808))

(assert (= (and d!113719 (not c!97872)) b!938795))

(assert (= (and d!113719 res!631573) b!938796))

(assert (= (and b!938796 res!631577) b!938801))

(assert (= (and b!938796 (not res!631575)) b!938802))

(assert (= (and b!938802 res!631578) b!938794))

(assert (= (and b!938796 res!631574) b!938799))

(assert (= (and b!938799 c!97875) b!938789))

(assert (= (and b!938799 (not c!97875)) b!938805))

(assert (= (and b!938789 res!631576) b!938800))

(assert (= (or b!938789 b!938805) bm!40872))

(assert (= (and b!938799 res!631579) b!938797))

(assert (= (and b!938797 c!97876) b!938793))

(assert (= (and b!938797 (not c!97876)) b!938791))

(assert (= (and b!938793 res!631571) b!938790))

(assert (= (or b!938793 b!938791) bm!40875))

(declare-fun b_lambda!14239 () Bool)

(assert (=> (not b_lambda!14239) (not b!938794)))

(assert (=> b!938794 t!27459))

(declare-fun b_and!29149 () Bool)

(assert (= b_and!29147 (and (=> t!27459 result!12137) b_and!29149)))

(assert (=> b!938802 m!874161))

(assert (=> b!938802 m!874161))

(declare-fun m!874267 () Bool)

(assert (=> b!938802 m!874267))

(declare-fun m!874269 () Bool)

(assert (=> b!938798 m!874269))

(declare-fun m!874271 () Bool)

(assert (=> bm!40874 m!874271))

(declare-fun m!874273 () Bool)

(assert (=> b!938800 m!874273))

(assert (=> b!938807 m!874161))

(assert (=> b!938807 m!874161))

(assert (=> b!938807 m!874167))

(assert (=> b!938801 m!874161))

(assert (=> b!938801 m!874161))

(assert (=> b!938801 m!874167))

(declare-fun m!874275 () Bool)

(assert (=> bm!40872 m!874275))

(declare-fun m!874277 () Bool)

(assert (=> bm!40875 m!874277))

(declare-fun m!874279 () Bool)

(assert (=> b!938790 m!874279))

(declare-fun m!874281 () Bool)

(assert (=> b!938808 m!874281))

(declare-fun m!874283 () Bool)

(assert (=> b!938808 m!874283))

(assert (=> b!938808 m!874283))

(declare-fun m!874285 () Bool)

(assert (=> b!938808 m!874285))

(declare-fun m!874287 () Bool)

(assert (=> b!938808 m!874287))

(assert (=> b!938808 m!874161))

(declare-fun m!874289 () Bool)

(assert (=> b!938808 m!874289))

(declare-fun m!874291 () Bool)

(assert (=> b!938808 m!874291))

(assert (=> b!938808 m!874289))

(declare-fun m!874293 () Bool)

(assert (=> b!938808 m!874293))

(declare-fun m!874295 () Bool)

(assert (=> b!938808 m!874295))

(declare-fun m!874297 () Bool)

(assert (=> b!938808 m!874297))

(declare-fun m!874299 () Bool)

(assert (=> b!938808 m!874299))

(declare-fun m!874301 () Bool)

(assert (=> b!938808 m!874301))

(declare-fun m!874303 () Bool)

(assert (=> b!938808 m!874303))

(declare-fun m!874305 () Bool)

(assert (=> b!938808 m!874305))

(assert (=> b!938808 m!874295))

(declare-fun m!874307 () Bool)

(assert (=> b!938808 m!874307))

(declare-fun m!874309 () Bool)

(assert (=> b!938808 m!874309))

(declare-fun m!874311 () Bool)

(assert (=> b!938808 m!874311))

(assert (=> b!938808 m!874301))

(assert (=> bm!40871 m!874291))

(assert (=> b!938794 m!873771))

(declare-fun m!874313 () Bool)

(assert (=> b!938794 m!874313))

(assert (=> b!938794 m!873771))

(declare-fun m!874315 () Bool)

(assert (=> b!938794 m!874315))

(assert (=> b!938794 m!874161))

(assert (=> b!938794 m!874313))

(assert (=> b!938794 m!874161))

(declare-fun m!874317 () Bool)

(assert (=> b!938794 m!874317))

(assert (=> d!113719 m!873795))

(assert (=> b!938598 d!113719))

(assert (=> b!938598 d!113661))

(declare-fun d!113721 () Bool)

(assert (=> d!113721 (= (validKeyInArray!0 (select (arr!27175 _keys!1487) #b00000000000000000000000000000000)) (and (not (= (select (arr!27175 _keys!1487) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27175 _keys!1487) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938676 d!113721))

(declare-fun d!113723 () Bool)

(assert (=> d!113723 (= (apply!856 lt!423886 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14337 (getValueByKey!484 (toList!6055 lt!423886) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26357 () Bool)

(assert (= bs!26357 d!113723))

(declare-fun m!874319 () Bool)

(assert (=> bs!26357 m!874319))

(assert (=> bs!26357 m!874319))

(declare-fun m!874321 () Bool)

(assert (=> bs!26357 m!874321))

(assert (=> b!938585 d!113723))

(declare-fun d!113725 () Bool)

(declare-fun e!527280 () Bool)

(assert (=> d!113725 e!527280))

(declare-fun res!631580 () Bool)

(assert (=> d!113725 (=> res!631580 e!527280)))

(declare-fun lt!424080 () Bool)

(assert (=> d!113725 (= res!631580 (not lt!424080))))

(declare-fun lt!424082 () Bool)

(assert (=> d!113725 (= lt!424080 lt!424082)))

(declare-fun lt!424081 () Unit!31700)

(declare-fun e!527279 () Unit!31700)

(assert (=> d!113725 (= lt!424081 e!527279)))

(declare-fun c!97878 () Bool)

(assert (=> d!113725 (= c!97878 lt!424082)))

(assert (=> d!113725 (= lt!424082 (containsKey!451 (toList!6055 lt!423993) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113725 (= (contains!5115 lt!423993 #b1000000000000000000000000000000000000000000000000000000000000000) lt!424080)))

(declare-fun b!938810 () Bool)

(declare-fun lt!424079 () Unit!31700)

(assert (=> b!938810 (= e!527279 lt!424079)))

(assert (=> b!938810 (= lt!424079 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423993) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938810 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423993) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938811 () Bool)

(declare-fun Unit!31717 () Unit!31700)

(assert (=> b!938811 (= e!527279 Unit!31717)))

(declare-fun b!938812 () Bool)

(assert (=> b!938812 (= e!527280 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423993) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113725 c!97878) b!938810))

(assert (= (and d!113725 (not c!97878)) b!938811))

(assert (= (and d!113725 (not res!631580)) b!938812))

(declare-fun m!874323 () Bool)

(assert (=> d!113725 m!874323))

(declare-fun m!874325 () Bool)

(assert (=> b!938810 m!874325))

(declare-fun m!874327 () Bool)

(assert (=> b!938810 m!874327))

(assert (=> b!938810 m!874327))

(declare-fun m!874329 () Bool)

(assert (=> b!938810 m!874329))

(assert (=> b!938812 m!874327))

(assert (=> b!938812 m!874327))

(assert (=> b!938812 m!874329))

(assert (=> bm!40864 d!113725))

(declare-fun d!113727 () Bool)

(assert (=> d!113727 (= (validKeyInArray!0 (select (arr!27175 _keys!1487) from!1844)) (and (not (= (select (arr!27175 _keys!1487) from!1844) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27175 _keys!1487) from!1844) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938694 d!113727))

(declare-fun d!113729 () Bool)

(assert (=> d!113729 (= (apply!856 lt!423944 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14337 (getValueByKey!484 (toList!6055 lt!423944) (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))))

(declare-fun bs!26358 () Bool)

(assert (= bs!26358 d!113729))

(assert (=> bs!26358 m!873983))

(declare-fun m!874331 () Bool)

(assert (=> bs!26358 m!874331))

(assert (=> bs!26358 m!874331))

(declare-fun m!874333 () Bool)

(assert (=> bs!26358 m!874333))

(assert (=> b!938634 d!113729))

(declare-fun d!113731 () Bool)

(declare-fun c!97879 () Bool)

(assert (=> d!113731 (= c!97879 ((_ is ValueCellFull!9651) (select (arr!27176 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun e!527281 () V!31985)

(assert (=> d!113731 (= (get!14335 (select (arr!27176 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!527281)))

(declare-fun b!938813 () Bool)

(assert (=> b!938813 (= e!527281 (get!14338 (select (arr!27176 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!938814 () Bool)

(assert (=> b!938814 (= e!527281 (get!14339 (select (arr!27176 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113731 c!97879) b!938813))

(assert (= (and d!113731 (not c!97879)) b!938814))

(assert (=> b!938813 m!874033))

(assert (=> b!938813 m!873771))

(declare-fun m!874335 () Bool)

(assert (=> b!938813 m!874335))

(assert (=> b!938814 m!874033))

(assert (=> b!938814 m!873771))

(declare-fun m!874337 () Bool)

(assert (=> b!938814 m!874337))

(assert (=> b!938634 d!113731))

(declare-fun d!113733 () Bool)

(declare-fun e!527282 () Bool)

(assert (=> d!113733 e!527282))

(declare-fun res!631581 () Bool)

(assert (=> d!113733 (=> (not res!631581) (not e!527282))))

(declare-fun lt!424085 () ListLongMap!12079)

(assert (=> d!113733 (= res!631581 (contains!5115 lt!424085 (_1!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!424083 () List!19159)

(assert (=> d!113733 (= lt!424085 (ListLongMap!12080 lt!424083))))

(declare-fun lt!424084 () Unit!31700)

(declare-fun lt!424086 () Unit!31700)

(assert (=> d!113733 (= lt!424084 lt!424086)))

(assert (=> d!113733 (= (getValueByKey!484 lt!424083 (_1!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113733 (= lt!424086 (lemmaContainsTupThenGetReturnValue!260 lt!424083 (_1!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113733 (= lt!424083 (insertStrictlySorted!317 (toList!6055 call!40851) (_1!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113733 (= (+!2842 call!40851 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!424085)))

(declare-fun b!938815 () Bool)

(declare-fun res!631582 () Bool)

(assert (=> b!938815 (=> (not res!631582) (not e!527282))))

(assert (=> b!938815 (= res!631582 (= (getValueByKey!484 (toList!6055 lt!424085) (_1!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!938816 () Bool)

(assert (=> b!938816 (= e!527282 (contains!5118 (toList!6055 lt!424085) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113733 res!631581) b!938815))

(assert (= (and b!938815 res!631582) b!938816))

(declare-fun m!874339 () Bool)

(assert (=> d!113733 m!874339))

(declare-fun m!874341 () Bool)

(assert (=> d!113733 m!874341))

(declare-fun m!874343 () Bool)

(assert (=> d!113733 m!874343))

(declare-fun m!874345 () Bool)

(assert (=> d!113733 m!874345))

(declare-fun m!874347 () Bool)

(assert (=> b!938815 m!874347))

(declare-fun m!874349 () Bool)

(assert (=> b!938816 m!874349))

(assert (=> b!938583 d!113733))

(declare-fun d!113735 () Bool)

(declare-fun e!527283 () Bool)

(assert (=> d!113735 e!527283))

(declare-fun res!631583 () Bool)

(assert (=> d!113735 (=> (not res!631583) (not e!527283))))

(declare-fun lt!424089 () ListLongMap!12079)

(assert (=> d!113735 (= res!631583 (contains!5115 lt!424089 (_1!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!424087 () List!19159)

(assert (=> d!113735 (= lt!424089 (ListLongMap!12080 lt!424087))))

(declare-fun lt!424088 () Unit!31700)

(declare-fun lt!424090 () Unit!31700)

(assert (=> d!113735 (= lt!424088 lt!424090)))

(assert (=> d!113735 (= (getValueByKey!484 lt!424087 (_1!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113735 (= lt!424090 (lemmaContainsTupThenGetReturnValue!260 lt!424087 (_1!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113735 (= lt!424087 (insertStrictlySorted!317 (toList!6055 call!40869) (_1!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113735 (= (+!2842 call!40869 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!424089)))

(declare-fun b!938817 () Bool)

(declare-fun res!631584 () Bool)

(assert (=> b!938817 (=> (not res!631584) (not e!527283))))

(assert (=> b!938817 (= res!631584 (= (getValueByKey!484 (toList!6055 lt!424089) (_1!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!938818 () Bool)

(assert (=> b!938818 (= e!527283 (contains!5118 (toList!6055 lt!424089) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113735 res!631583) b!938817))

(assert (= (and b!938817 res!631584) b!938818))

(declare-fun m!874351 () Bool)

(assert (=> d!113735 m!874351))

(declare-fun m!874353 () Bool)

(assert (=> d!113735 m!874353))

(declare-fun m!874355 () Bool)

(assert (=> d!113735 m!874355))

(declare-fun m!874357 () Bool)

(assert (=> d!113735 m!874357))

(declare-fun m!874359 () Bool)

(assert (=> b!938817 m!874359))

(declare-fun m!874361 () Bool)

(assert (=> b!938818 m!874361))

(assert (=> b!938691 d!113735))

(declare-fun d!113737 () Bool)

(assert (=> d!113737 (= (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (and (not (= (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938647 d!113737))

(declare-fun d!113739 () Bool)

(declare-fun e!527285 () Bool)

(assert (=> d!113739 e!527285))

(declare-fun res!631585 () Bool)

(assert (=> d!113739 (=> res!631585 e!527285)))

(declare-fun lt!424092 () Bool)

(assert (=> d!113739 (= res!631585 (not lt!424092))))

(declare-fun lt!424094 () Bool)

(assert (=> d!113739 (= lt!424092 lt!424094)))

(declare-fun lt!424093 () Unit!31700)

(declare-fun e!527284 () Unit!31700)

(assert (=> d!113739 (= lt!424093 e!527284)))

(declare-fun c!97880 () Bool)

(assert (=> d!113739 (= c!97880 lt!424094)))

(assert (=> d!113739 (= lt!424094 (containsKey!451 (toList!6055 lt!423958) (_1!6702 lt!423782)))))

(assert (=> d!113739 (= (contains!5115 lt!423958 (_1!6702 lt!423782)) lt!424092)))

(declare-fun b!938819 () Bool)

(declare-fun lt!424091 () Unit!31700)

(assert (=> b!938819 (= e!527284 lt!424091)))

(assert (=> b!938819 (= lt!424091 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423958) (_1!6702 lt!423782)))))

(assert (=> b!938819 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423958) (_1!6702 lt!423782)))))

(declare-fun b!938820 () Bool)

(declare-fun Unit!31718 () Unit!31700)

(assert (=> b!938820 (= e!527284 Unit!31718)))

(declare-fun b!938821 () Bool)

(assert (=> b!938821 (= e!527285 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423958) (_1!6702 lt!423782))))))

(assert (= (and d!113739 c!97880) b!938819))

(assert (= (and d!113739 (not c!97880)) b!938820))

(assert (= (and d!113739 (not res!631585)) b!938821))

(declare-fun m!874363 () Bool)

(assert (=> d!113739 m!874363))

(declare-fun m!874365 () Bool)

(assert (=> b!938819 m!874365))

(assert (=> b!938819 m!874047))

(assert (=> b!938819 m!874047))

(declare-fun m!874367 () Bool)

(assert (=> b!938819 m!874367))

(assert (=> b!938821 m!874047))

(assert (=> b!938821 m!874047))

(assert (=> b!938821 m!874367))

(assert (=> d!113657 d!113739))

(declare-fun b!938830 () Bool)

(declare-fun e!527290 () Option!490)

(assert (=> b!938830 (= e!527290 (Some!489 (_2!6702 (h!20301 lt!423956))))))

(declare-fun b!938831 () Bool)

(declare-fun e!527291 () Option!490)

(assert (=> b!938831 (= e!527290 e!527291)))

(declare-fun c!97886 () Bool)

(assert (=> b!938831 (= c!97886 (and ((_ is Cons!19155) lt!423956) (not (= (_1!6702 (h!20301 lt!423956)) (_1!6702 lt!423782)))))))

(declare-fun b!938833 () Bool)

(assert (=> b!938833 (= e!527291 None!488)))

(declare-fun d!113741 () Bool)

(declare-fun c!97885 () Bool)

(assert (=> d!113741 (= c!97885 (and ((_ is Cons!19155) lt!423956) (= (_1!6702 (h!20301 lt!423956)) (_1!6702 lt!423782))))))

(assert (=> d!113741 (= (getValueByKey!484 lt!423956 (_1!6702 lt!423782)) e!527290)))

(declare-fun b!938832 () Bool)

(assert (=> b!938832 (= e!527291 (getValueByKey!484 (t!27460 lt!423956) (_1!6702 lt!423782)))))

(assert (= (and d!113741 c!97885) b!938830))

(assert (= (and d!113741 (not c!97885)) b!938831))

(assert (= (and b!938831 c!97886) b!938832))

(assert (= (and b!938831 (not c!97886)) b!938833))

(declare-fun m!874369 () Bool)

(assert (=> b!938832 m!874369))

(assert (=> d!113657 d!113741))

(declare-fun d!113743 () Bool)

(assert (=> d!113743 (= (getValueByKey!484 lt!423956 (_1!6702 lt!423782)) (Some!489 (_2!6702 lt!423782)))))

(declare-fun lt!424097 () Unit!31700)

(declare-fun choose!1563 (List!19159 (_ BitVec 64) V!31985) Unit!31700)

(assert (=> d!113743 (= lt!424097 (choose!1563 lt!423956 (_1!6702 lt!423782) (_2!6702 lt!423782)))))

(declare-fun e!527294 () Bool)

(assert (=> d!113743 e!527294))

(declare-fun res!631590 () Bool)

(assert (=> d!113743 (=> (not res!631590) (not e!527294))))

(declare-fun isStrictlySorted!504 (List!19159) Bool)

(assert (=> d!113743 (= res!631590 (isStrictlySorted!504 lt!423956))))

(assert (=> d!113743 (= (lemmaContainsTupThenGetReturnValue!260 lt!423956 (_1!6702 lt!423782) (_2!6702 lt!423782)) lt!424097)))

(declare-fun b!938838 () Bool)

(declare-fun res!631591 () Bool)

(assert (=> b!938838 (=> (not res!631591) (not e!527294))))

(assert (=> b!938838 (= res!631591 (containsKey!451 lt!423956 (_1!6702 lt!423782)))))

(declare-fun b!938839 () Bool)

(assert (=> b!938839 (= e!527294 (contains!5118 lt!423956 (tuple2!13383 (_1!6702 lt!423782) (_2!6702 lt!423782))))))

(assert (= (and d!113743 res!631590) b!938838))

(assert (= (and b!938838 res!631591) b!938839))

(assert (=> d!113743 m!874041))

(declare-fun m!874371 () Bool)

(assert (=> d!113743 m!874371))

(declare-fun m!874373 () Bool)

(assert (=> d!113743 m!874373))

(declare-fun m!874375 () Bool)

(assert (=> b!938838 m!874375))

(declare-fun m!874377 () Bool)

(assert (=> b!938839 m!874377))

(assert (=> d!113657 d!113743))

(declare-fun b!938860 () Bool)

(declare-fun e!527306 () List!19159)

(declare-fun call!40889 () List!19159)

(assert (=> b!938860 (= e!527306 call!40889)))

(declare-fun b!938861 () Bool)

(declare-fun e!527308 () List!19159)

(declare-fun call!40888 () List!19159)

(assert (=> b!938861 (= e!527308 call!40888)))

(declare-fun d!113745 () Bool)

(declare-fun e!527307 () Bool)

(assert (=> d!113745 e!527307))

(declare-fun res!631597 () Bool)

(assert (=> d!113745 (=> (not res!631597) (not e!527307))))

(declare-fun lt!424100 () List!19159)

(assert (=> d!113745 (= res!631597 (isStrictlySorted!504 lt!424100))))

(declare-fun e!527309 () List!19159)

(assert (=> d!113745 (= lt!424100 e!527309)))

(declare-fun c!97897 () Bool)

(assert (=> d!113745 (= c!97897 (and ((_ is Cons!19155) (toList!6055 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (bvslt (_1!6702 (h!20301 (toList!6055 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6702 lt!423782))))))

(assert (=> d!113745 (isStrictlySorted!504 (toList!6055 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))))

(assert (=> d!113745 (= (insertStrictlySorted!317 (toList!6055 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6702 lt!423782) (_2!6702 lt!423782)) lt!424100)))

(declare-fun b!938862 () Bool)

(assert (=> b!938862 (= e!527308 call!40888)))

(declare-fun b!938863 () Bool)

(assert (=> b!938863 (= e!527309 e!527306)))

(declare-fun c!97898 () Bool)

(assert (=> b!938863 (= c!97898 (and ((_ is Cons!19155) (toList!6055 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (= (_1!6702 (h!20301 (toList!6055 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6702 lt!423782))))))

(declare-fun bm!40884 () Bool)

(declare-fun call!40887 () List!19159)

(assert (=> bm!40884 (= call!40889 call!40887)))

(declare-fun b!938864 () Bool)

(assert (=> b!938864 (= e!527307 (contains!5118 lt!424100 (tuple2!13383 (_1!6702 lt!423782) (_2!6702 lt!423782))))))

(declare-fun e!527305 () List!19159)

(declare-fun c!97896 () Bool)

(declare-fun b!938865 () Bool)

(assert (=> b!938865 (= e!527305 (ite c!97898 (t!27460 (toList!6055 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (ite c!97896 (Cons!19155 (h!20301 (toList!6055 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (t!27460 (toList!6055 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) Nil!19156)))))

(declare-fun b!938866 () Bool)

(declare-fun res!631596 () Bool)

(assert (=> b!938866 (=> (not res!631596) (not e!527307))))

(assert (=> b!938866 (= res!631596 (containsKey!451 lt!424100 (_1!6702 lt!423782)))))

(declare-fun bm!40885 () Bool)

(declare-fun $colon$colon!553 (List!19159 tuple2!13382) List!19159)

(assert (=> bm!40885 (= call!40887 ($colon$colon!553 e!527305 (ite c!97897 (h!20301 (toList!6055 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (tuple2!13383 (_1!6702 lt!423782) (_2!6702 lt!423782)))))))

(declare-fun c!97895 () Bool)

(assert (=> bm!40885 (= c!97895 c!97897)))

(declare-fun b!938867 () Bool)

(assert (=> b!938867 (= e!527309 call!40887)))

(declare-fun b!938868 () Bool)

(assert (=> b!938868 (= e!527305 (insertStrictlySorted!317 (t!27460 (toList!6055 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (_1!6702 lt!423782) (_2!6702 lt!423782)))))

(declare-fun b!938869 () Bool)

(assert (=> b!938869 (= c!97896 (and ((_ is Cons!19155) (toList!6055 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (bvsgt (_1!6702 (h!20301 (toList!6055 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6702 lt!423782))))))

(assert (=> b!938869 (= e!527306 e!527308)))

(declare-fun bm!40886 () Bool)

(assert (=> bm!40886 (= call!40888 call!40889)))

(assert (= (and d!113745 c!97897) b!938867))

(assert (= (and d!113745 (not c!97897)) b!938863))

(assert (= (and b!938863 c!97898) b!938860))

(assert (= (and b!938863 (not c!97898)) b!938869))

(assert (= (and b!938869 c!97896) b!938862))

(assert (= (and b!938869 (not c!97896)) b!938861))

(assert (= (or b!938862 b!938861) bm!40886))

(assert (= (or b!938860 bm!40886) bm!40884))

(assert (= (or b!938867 bm!40884) bm!40885))

(assert (= (and bm!40885 c!97895) b!938868))

(assert (= (and bm!40885 (not c!97895)) b!938865))

(assert (= (and d!113745 res!631597) b!938866))

(assert (= (and b!938866 res!631596) b!938864))

(declare-fun m!874379 () Bool)

(assert (=> d!113745 m!874379))

(declare-fun m!874381 () Bool)

(assert (=> d!113745 m!874381))

(declare-fun m!874383 () Bool)

(assert (=> b!938864 m!874383))

(declare-fun m!874385 () Bool)

(assert (=> b!938868 m!874385))

(declare-fun m!874387 () Bool)

(assert (=> bm!40885 m!874387))

(declare-fun m!874389 () Bool)

(assert (=> b!938866 m!874389))

(assert (=> d!113657 d!113745))

(declare-fun d!113747 () Bool)

(assert (=> d!113747 (= (apply!856 (+!2842 lt!423783 (tuple2!13383 lt!423788 lt!423778)) k0!1099) (get!14337 (getValueByKey!484 (toList!6055 (+!2842 lt!423783 (tuple2!13383 lt!423788 lt!423778))) k0!1099)))))

(declare-fun bs!26359 () Bool)

(assert (= bs!26359 d!113747))

(assert (=> bs!26359 m!874199))

(assert (=> bs!26359 m!874199))

(declare-fun m!874391 () Bool)

(assert (=> bs!26359 m!874391))

(assert (=> d!113645 d!113747))

(declare-fun d!113749 () Bool)

(assert (=> d!113749 (= (apply!856 (+!2842 lt!423783 (tuple2!13383 lt!423788 lt!423778)) k0!1099) (apply!856 lt!423783 k0!1099))))

(assert (=> d!113749 true))

(declare-fun _$34!1161 () Unit!31700)

(assert (=> d!113749 (= (choose!1561 lt!423783 lt!423788 lt!423778 k0!1099) _$34!1161)))

(declare-fun bs!26360 () Bool)

(assert (= bs!26360 d!113749))

(assert (=> bs!26360 m!873939))

(assert (=> bs!26360 m!873939))

(assert (=> bs!26360 m!873957))

(assert (=> bs!26360 m!873817))

(assert (=> d!113645 d!113749))

(assert (=> d!113645 d!113669))

(assert (=> d!113645 d!113703))

(assert (=> d!113645 d!113681))

(declare-fun d!113751 () Bool)

(declare-fun e!527311 () Bool)

(assert (=> d!113751 e!527311))

(declare-fun res!631598 () Bool)

(assert (=> d!113751 (=> res!631598 e!527311)))

(declare-fun lt!424102 () Bool)

(assert (=> d!113751 (= res!631598 (not lt!424102))))

(declare-fun lt!424104 () Bool)

(assert (=> d!113751 (= lt!424102 lt!424104)))

(declare-fun lt!424103 () Unit!31700)

(declare-fun e!527310 () Unit!31700)

(assert (=> d!113751 (= lt!424103 e!527310)))

(declare-fun c!97899 () Bool)

(assert (=> d!113751 (= c!97899 lt!424104)))

(assert (=> d!113751 (= lt!424104 (containsKey!451 (toList!6055 lt!423886) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113751 (= (contains!5115 lt!423886 #b0000000000000000000000000000000000000000000000000000000000000000) lt!424102)))

(declare-fun b!938871 () Bool)

(declare-fun lt!424101 () Unit!31700)

(assert (=> b!938871 (= e!527310 lt!424101)))

(assert (=> b!938871 (= lt!424101 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423886) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938871 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423886) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938872 () Bool)

(declare-fun Unit!31719 () Unit!31700)

(assert (=> b!938872 (= e!527310 Unit!31719)))

(declare-fun b!938873 () Bool)

(assert (=> b!938873 (= e!527311 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423886) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113751 c!97899) b!938871))

(assert (= (and d!113751 (not c!97899)) b!938872))

(assert (= (and d!113751 (not res!631598)) b!938873))

(declare-fun m!874393 () Bool)

(assert (=> d!113751 m!874393))

(declare-fun m!874395 () Bool)

(assert (=> b!938871 m!874395))

(assert (=> b!938871 m!874319))

(assert (=> b!938871 m!874319))

(declare-fun m!874397 () Bool)

(assert (=> b!938871 m!874397))

(assert (=> b!938873 m!874319))

(assert (=> b!938873 m!874319))

(assert (=> b!938873 m!874397))

(assert (=> bm!40843 d!113751))

(assert (=> b!938530 d!113721))

(declare-fun d!113753 () Bool)

(assert (=> d!113753 (= (apply!856 lt!423944 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14337 (getValueByKey!484 (toList!6055 lt!423944) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26361 () Bool)

(assert (= bs!26361 d!113753))

(declare-fun m!874399 () Bool)

(assert (=> bs!26361 m!874399))

(assert (=> bs!26361 m!874399))

(declare-fun m!874401 () Bool)

(assert (=> bs!26361 m!874401))

(assert (=> b!938630 d!113753))

(declare-fun d!113755 () Bool)

(assert (=> d!113755 (= (get!14337 (getValueByKey!484 (toList!6055 lt!423783) k0!1099)) (v!12713 (getValueByKey!484 (toList!6055 lt!423783) k0!1099)))))

(assert (=> d!113669 d!113755))

(declare-fun b!938874 () Bool)

(declare-fun e!527312 () Option!490)

(assert (=> b!938874 (= e!527312 (Some!489 (_2!6702 (h!20301 (toList!6055 lt!423783)))))))

(declare-fun b!938875 () Bool)

(declare-fun e!527313 () Option!490)

(assert (=> b!938875 (= e!527312 e!527313)))

(declare-fun c!97901 () Bool)

(assert (=> b!938875 (= c!97901 (and ((_ is Cons!19155) (toList!6055 lt!423783)) (not (= (_1!6702 (h!20301 (toList!6055 lt!423783))) k0!1099))))))

(declare-fun b!938877 () Bool)

(assert (=> b!938877 (= e!527313 None!488)))

(declare-fun d!113757 () Bool)

(declare-fun c!97900 () Bool)

(assert (=> d!113757 (= c!97900 (and ((_ is Cons!19155) (toList!6055 lt!423783)) (= (_1!6702 (h!20301 (toList!6055 lt!423783))) k0!1099)))))

(assert (=> d!113757 (= (getValueByKey!484 (toList!6055 lt!423783) k0!1099) e!527312)))

(declare-fun b!938876 () Bool)

(assert (=> b!938876 (= e!527313 (getValueByKey!484 (t!27460 (toList!6055 lt!423783)) k0!1099))))

(assert (= (and d!113757 c!97900) b!938874))

(assert (= (and d!113757 (not c!97900)) b!938875))

(assert (= (and b!938875 c!97901) b!938876))

(assert (= (and b!938875 (not c!97901)) b!938877))

(declare-fun m!874403 () Bool)

(assert (=> b!938876 m!874403))

(assert (=> d!113669 d!113757))

(declare-fun d!113759 () Bool)

(assert (=> d!113759 (= (apply!856 lt!423993 (select (arr!27175 _keys!1487) from!1844)) (get!14337 (getValueByKey!484 (toList!6055 lt!423993) (select (arr!27175 _keys!1487) from!1844))))))

(declare-fun bs!26362 () Bool)

(assert (= bs!26362 d!113759))

(assert (=> bs!26362 m!874067))

(assert (=> bs!26362 m!874251))

(assert (=> bs!26362 m!874251))

(declare-fun m!874405 () Bool)

(assert (=> bs!26362 m!874405))

(assert (=> b!938687 d!113759))

(declare-fun d!113761 () Bool)

(declare-fun c!97902 () Bool)

(assert (=> d!113761 (= c!97902 ((_ is ValueCellFull!9651) (select (arr!27176 _values!1231) from!1844)))))

(declare-fun e!527314 () V!31985)

(assert (=> d!113761 (= (get!14335 (select (arr!27176 _values!1231) from!1844) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!527314)))

(declare-fun b!938878 () Bool)

(assert (=> b!938878 (= e!527314 (get!14338 (select (arr!27176 _values!1231) from!1844) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!938879 () Bool)

(assert (=> b!938879 (= e!527314 (get!14339 (select (arr!27176 _values!1231) from!1844) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113761 c!97902) b!938878))

(assert (= (and d!113761 (not c!97902)) b!938879))

(assert (=> b!938878 m!874139))

(assert (=> b!938878 m!873771))

(declare-fun m!874407 () Bool)

(assert (=> b!938878 m!874407))

(assert (=> b!938879 m!874139))

(assert (=> b!938879 m!873771))

(declare-fun m!874409 () Bool)

(assert (=> b!938879 m!874409))

(assert (=> b!938687 d!113761))

(declare-fun d!113763 () Bool)

(declare-fun isEmpty!699 (Option!490) Bool)

(assert (=> d!113763 (= (isDefined!356 (getValueByKey!484 (toList!6055 lt!423784) k0!1099)) (not (isEmpty!699 (getValueByKey!484 (toList!6055 lt!423784) k0!1099))))))

(declare-fun bs!26363 () Bool)

(assert (= bs!26363 d!113763))

(assert (=> bs!26363 m!873963))

(declare-fun m!874411 () Bool)

(assert (=> bs!26363 m!874411))

(assert (=> b!938616 d!113763))

(declare-fun b!938880 () Bool)

(declare-fun e!527315 () Option!490)

(assert (=> b!938880 (= e!527315 (Some!489 (_2!6702 (h!20301 (toList!6055 lt!423784)))))))

(declare-fun b!938881 () Bool)

(declare-fun e!527316 () Option!490)

(assert (=> b!938881 (= e!527315 e!527316)))

(declare-fun c!97904 () Bool)

(assert (=> b!938881 (= c!97904 (and ((_ is Cons!19155) (toList!6055 lt!423784)) (not (= (_1!6702 (h!20301 (toList!6055 lt!423784))) k0!1099))))))

(declare-fun b!938883 () Bool)

(assert (=> b!938883 (= e!527316 None!488)))

(declare-fun d!113765 () Bool)

(declare-fun c!97903 () Bool)

(assert (=> d!113765 (= c!97903 (and ((_ is Cons!19155) (toList!6055 lt!423784)) (= (_1!6702 (h!20301 (toList!6055 lt!423784))) k0!1099)))))

(assert (=> d!113765 (= (getValueByKey!484 (toList!6055 lt!423784) k0!1099) e!527315)))

(declare-fun b!938882 () Bool)

(assert (=> b!938882 (= e!527316 (getValueByKey!484 (t!27460 (toList!6055 lt!423784)) k0!1099))))

(assert (= (and d!113765 c!97903) b!938880))

(assert (= (and d!113765 (not c!97903)) b!938881))

(assert (= (and b!938881 c!97904) b!938882))

(assert (= (and b!938881 (not c!97904)) b!938883))

(declare-fun m!874413 () Bool)

(assert (=> b!938882 m!874413))

(assert (=> b!938616 d!113765))

(assert (=> d!113663 d!113643))

(declare-fun d!113767 () Bool)

(assert (=> d!113767 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19157)))

(assert (=> d!113767 true))

(declare-fun _$71!183 () Unit!31700)

(assert (=> d!113767 (= (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) _$71!183)))

(declare-fun bs!26364 () Bool)

(assert (= bs!26364 d!113767))

(assert (=> bs!26364 m!873783))

(assert (=> d!113663 d!113767))

(declare-fun d!113769 () Bool)

(assert (=> d!113769 (= (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (and (not (= (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938592 d!113769))

(assert (=> b!938701 d!113697))

(declare-fun d!113771 () Bool)

(declare-fun e!527318 () Bool)

(assert (=> d!113771 e!527318))

(declare-fun res!631599 () Bool)

(assert (=> d!113771 (=> res!631599 e!527318)))

(declare-fun lt!424106 () Bool)

(assert (=> d!113771 (= res!631599 (not lt!424106))))

(declare-fun lt!424108 () Bool)

(assert (=> d!113771 (= lt!424106 lt!424108)))

(declare-fun lt!424107 () Unit!31700)

(declare-fun e!527317 () Unit!31700)

(assert (=> d!113771 (= lt!424107 e!527317)))

(declare-fun c!97905 () Bool)

(assert (=> d!113771 (= c!97905 lt!424108)))

(assert (=> d!113771 (= lt!424108 (containsKey!451 (toList!6055 (+!2842 lt!423983 (tuple2!13383 lt!423989 zeroValue!1173))) lt!423991))))

(assert (=> d!113771 (= (contains!5115 (+!2842 lt!423983 (tuple2!13383 lt!423989 zeroValue!1173)) lt!423991) lt!424106)))

(declare-fun b!938884 () Bool)

(declare-fun lt!424105 () Unit!31700)

(assert (=> b!938884 (= e!527317 lt!424105)))

(assert (=> b!938884 (= lt!424105 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 (+!2842 lt!423983 (tuple2!13383 lt!423989 zeroValue!1173))) lt!423991))))

(assert (=> b!938884 (isDefined!356 (getValueByKey!484 (toList!6055 (+!2842 lt!423983 (tuple2!13383 lt!423989 zeroValue!1173))) lt!423991))))

(declare-fun b!938885 () Bool)

(declare-fun Unit!31720 () Unit!31700)

(assert (=> b!938885 (= e!527317 Unit!31720)))

(declare-fun b!938886 () Bool)

(assert (=> b!938886 (= e!527318 (isDefined!356 (getValueByKey!484 (toList!6055 (+!2842 lt!423983 (tuple2!13383 lt!423989 zeroValue!1173))) lt!423991)))))

(assert (= (and d!113771 c!97905) b!938884))

(assert (= (and d!113771 (not c!97905)) b!938885))

(assert (= (and d!113771 (not res!631599)) b!938886))

(declare-fun m!874415 () Bool)

(assert (=> d!113771 m!874415))

(declare-fun m!874417 () Bool)

(assert (=> b!938884 m!874417))

(declare-fun m!874419 () Bool)

(assert (=> b!938884 m!874419))

(assert (=> b!938884 m!874419))

(declare-fun m!874421 () Bool)

(assert (=> b!938884 m!874421))

(assert (=> b!938886 m!874419))

(assert (=> b!938886 m!874419))

(assert (=> b!938886 m!874421))

(assert (=> b!938701 d!113771))

(declare-fun d!113773 () Bool)

(assert (=> d!113773 (= (apply!856 (+!2842 lt!423994 (tuple2!13383 lt!424004 minValue!1173)) lt!423992) (apply!856 lt!423994 lt!423992))))

(declare-fun lt!424109 () Unit!31700)

(assert (=> d!113773 (= lt!424109 (choose!1561 lt!423994 lt!424004 minValue!1173 lt!423992))))

(declare-fun e!527319 () Bool)

(assert (=> d!113773 e!527319))

(declare-fun res!631600 () Bool)

(assert (=> d!113773 (=> (not res!631600) (not e!527319))))

(assert (=> d!113773 (= res!631600 (contains!5115 lt!423994 lt!423992))))

(assert (=> d!113773 (= (addApplyDifferent!441 lt!423994 lt!424004 minValue!1173 lt!423992) lt!424109)))

(declare-fun b!938887 () Bool)

(assert (=> b!938887 (= e!527319 (not (= lt!423992 lt!424004)))))

(assert (= (and d!113773 res!631600) b!938887))

(assert (=> d!113773 m!874131))

(declare-fun m!874423 () Bool)

(assert (=> d!113773 m!874423))

(assert (=> d!113773 m!874121))

(assert (=> d!113773 m!874121))

(assert (=> d!113773 m!874133))

(declare-fun m!874425 () Bool)

(assert (=> d!113773 m!874425))

(assert (=> b!938701 d!113773))

(declare-fun d!113775 () Bool)

(assert (=> d!113775 (= (apply!856 lt!423999 lt!424002) (get!14337 (getValueByKey!484 (toList!6055 lt!423999) lt!424002)))))

(declare-fun bs!26365 () Bool)

(assert (= bs!26365 d!113775))

(declare-fun m!874427 () Bool)

(assert (=> bs!26365 m!874427))

(assert (=> bs!26365 m!874427))

(declare-fun m!874429 () Bool)

(assert (=> bs!26365 m!874429))

(assert (=> b!938701 d!113775))

(declare-fun d!113777 () Bool)

(declare-fun e!527320 () Bool)

(assert (=> d!113777 e!527320))

(declare-fun res!631601 () Bool)

(assert (=> d!113777 (=> (not res!631601) (not e!527320))))

(declare-fun lt!424112 () ListLongMap!12079)

(assert (=> d!113777 (= res!631601 (contains!5115 lt!424112 (_1!6702 (tuple2!13383 lt!423995 minValue!1173))))))

(declare-fun lt!424110 () List!19159)

(assert (=> d!113777 (= lt!424112 (ListLongMap!12080 lt!424110))))

(declare-fun lt!424111 () Unit!31700)

(declare-fun lt!424113 () Unit!31700)

(assert (=> d!113777 (= lt!424111 lt!424113)))

(assert (=> d!113777 (= (getValueByKey!484 lt!424110 (_1!6702 (tuple2!13383 lt!423995 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423995 minValue!1173))))))

(assert (=> d!113777 (= lt!424113 (lemmaContainsTupThenGetReturnValue!260 lt!424110 (_1!6702 (tuple2!13383 lt!423995 minValue!1173)) (_2!6702 (tuple2!13383 lt!423995 minValue!1173))))))

(assert (=> d!113777 (= lt!424110 (insertStrictlySorted!317 (toList!6055 lt!423997) (_1!6702 (tuple2!13383 lt!423995 minValue!1173)) (_2!6702 (tuple2!13383 lt!423995 minValue!1173))))))

(assert (=> d!113777 (= (+!2842 lt!423997 (tuple2!13383 lt!423995 minValue!1173)) lt!424112)))

(declare-fun b!938888 () Bool)

(declare-fun res!631602 () Bool)

(assert (=> b!938888 (=> (not res!631602) (not e!527320))))

(assert (=> b!938888 (= res!631602 (= (getValueByKey!484 (toList!6055 lt!424112) (_1!6702 (tuple2!13383 lt!423995 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423995 minValue!1173)))))))

(declare-fun b!938889 () Bool)

(assert (=> b!938889 (= e!527320 (contains!5118 (toList!6055 lt!424112) (tuple2!13383 lt!423995 minValue!1173)))))

(assert (= (and d!113777 res!631601) b!938888))

(assert (= (and b!938888 res!631602) b!938889))

(declare-fun m!874431 () Bool)

(assert (=> d!113777 m!874431))

(declare-fun m!874433 () Bool)

(assert (=> d!113777 m!874433))

(declare-fun m!874435 () Bool)

(assert (=> d!113777 m!874435))

(declare-fun m!874437 () Bool)

(assert (=> d!113777 m!874437))

(declare-fun m!874439 () Bool)

(assert (=> b!938888 m!874439))

(declare-fun m!874441 () Bool)

(assert (=> b!938889 m!874441))

(assert (=> b!938701 d!113777))

(declare-fun d!113779 () Bool)

(declare-fun e!527321 () Bool)

(assert (=> d!113779 e!527321))

(declare-fun res!631603 () Bool)

(assert (=> d!113779 (=> (not res!631603) (not e!527321))))

(declare-fun lt!424116 () ListLongMap!12079)

(assert (=> d!113779 (= res!631603 (contains!5115 lt!424116 (_1!6702 (tuple2!13383 lt!424004 minValue!1173))))))

(declare-fun lt!424114 () List!19159)

(assert (=> d!113779 (= lt!424116 (ListLongMap!12080 lt!424114))))

(declare-fun lt!424115 () Unit!31700)

(declare-fun lt!424117 () Unit!31700)

(assert (=> d!113779 (= lt!424115 lt!424117)))

(assert (=> d!113779 (= (getValueByKey!484 lt!424114 (_1!6702 (tuple2!13383 lt!424004 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!424004 minValue!1173))))))

(assert (=> d!113779 (= lt!424117 (lemmaContainsTupThenGetReturnValue!260 lt!424114 (_1!6702 (tuple2!13383 lt!424004 minValue!1173)) (_2!6702 (tuple2!13383 lt!424004 minValue!1173))))))

(assert (=> d!113779 (= lt!424114 (insertStrictlySorted!317 (toList!6055 lt!423994) (_1!6702 (tuple2!13383 lt!424004 minValue!1173)) (_2!6702 (tuple2!13383 lt!424004 minValue!1173))))))

(assert (=> d!113779 (= (+!2842 lt!423994 (tuple2!13383 lt!424004 minValue!1173)) lt!424116)))

(declare-fun b!938890 () Bool)

(declare-fun res!631604 () Bool)

(assert (=> b!938890 (=> (not res!631604) (not e!527321))))

(assert (=> b!938890 (= res!631604 (= (getValueByKey!484 (toList!6055 lt!424116) (_1!6702 (tuple2!13383 lt!424004 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!424004 minValue!1173)))))))

(declare-fun b!938891 () Bool)

(assert (=> b!938891 (= e!527321 (contains!5118 (toList!6055 lt!424116) (tuple2!13383 lt!424004 minValue!1173)))))

(assert (= (and d!113779 res!631603) b!938890))

(assert (= (and b!938890 res!631604) b!938891))

(declare-fun m!874443 () Bool)

(assert (=> d!113779 m!874443))

(declare-fun m!874445 () Bool)

(assert (=> d!113779 m!874445))

(declare-fun m!874447 () Bool)

(assert (=> d!113779 m!874447))

(declare-fun m!874449 () Bool)

(assert (=> d!113779 m!874449))

(declare-fun m!874451 () Bool)

(assert (=> b!938890 m!874451))

(declare-fun m!874453 () Bool)

(assert (=> b!938891 m!874453))

(assert (=> b!938701 d!113779))

(declare-fun d!113781 () Bool)

(assert (=> d!113781 (= (apply!856 (+!2842 lt!423997 (tuple2!13383 lt!423995 minValue!1173)) lt!424000) (apply!856 lt!423997 lt!424000))))

(declare-fun lt!424118 () Unit!31700)

(assert (=> d!113781 (= lt!424118 (choose!1561 lt!423997 lt!423995 minValue!1173 lt!424000))))

(declare-fun e!527322 () Bool)

(assert (=> d!113781 e!527322))

(declare-fun res!631605 () Bool)

(assert (=> d!113781 (=> (not res!631605) (not e!527322))))

(assert (=> d!113781 (= res!631605 (contains!5115 lt!423997 lt!424000))))

(assert (=> d!113781 (= (addApplyDifferent!441 lt!423997 lt!423995 minValue!1173 lt!424000) lt!424118)))

(declare-fun b!938892 () Bool)

(assert (=> b!938892 (= e!527322 (not (= lt!424000 lt!423995)))))

(assert (= (and d!113781 res!631605) b!938892))

(assert (=> d!113781 m!874137))

(declare-fun m!874455 () Bool)

(assert (=> d!113781 m!874455))

(assert (=> d!113781 m!874127))

(assert (=> d!113781 m!874127))

(assert (=> d!113781 m!874129))

(declare-fun m!874457 () Bool)

(assert (=> d!113781 m!874457))

(assert (=> b!938701 d!113781))

(declare-fun d!113783 () Bool)

(declare-fun e!527323 () Bool)

(assert (=> d!113783 e!527323))

(declare-fun res!631606 () Bool)

(assert (=> d!113783 (=> (not res!631606) (not e!527323))))

(declare-fun lt!424121 () ListLongMap!12079)

(assert (=> d!113783 (= res!631606 (contains!5115 lt!424121 (_1!6702 (tuple2!13383 lt!423989 zeroValue!1173))))))

(declare-fun lt!424119 () List!19159)

(assert (=> d!113783 (= lt!424121 (ListLongMap!12080 lt!424119))))

(declare-fun lt!424120 () Unit!31700)

(declare-fun lt!424122 () Unit!31700)

(assert (=> d!113783 (= lt!424120 lt!424122)))

(assert (=> d!113783 (= (getValueByKey!484 lt!424119 (_1!6702 (tuple2!13383 lt!423989 zeroValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423989 zeroValue!1173))))))

(assert (=> d!113783 (= lt!424122 (lemmaContainsTupThenGetReturnValue!260 lt!424119 (_1!6702 (tuple2!13383 lt!423989 zeroValue!1173)) (_2!6702 (tuple2!13383 lt!423989 zeroValue!1173))))))

(assert (=> d!113783 (= lt!424119 (insertStrictlySorted!317 (toList!6055 lt!423983) (_1!6702 (tuple2!13383 lt!423989 zeroValue!1173)) (_2!6702 (tuple2!13383 lt!423989 zeroValue!1173))))))

(assert (=> d!113783 (= (+!2842 lt!423983 (tuple2!13383 lt!423989 zeroValue!1173)) lt!424121)))

(declare-fun b!938893 () Bool)

(declare-fun res!631607 () Bool)

(assert (=> b!938893 (=> (not res!631607) (not e!527323))))

(assert (=> b!938893 (= res!631607 (= (getValueByKey!484 (toList!6055 lt!424121) (_1!6702 (tuple2!13383 lt!423989 zeroValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423989 zeroValue!1173)))))))

(declare-fun b!938894 () Bool)

(assert (=> b!938894 (= e!527323 (contains!5118 (toList!6055 lt!424121) (tuple2!13383 lt!423989 zeroValue!1173)))))

(assert (= (and d!113783 res!631606) b!938893))

(assert (= (and b!938893 res!631607) b!938894))

(declare-fun m!874459 () Bool)

(assert (=> d!113783 m!874459))

(declare-fun m!874461 () Bool)

(assert (=> d!113783 m!874461))

(declare-fun m!874463 () Bool)

(assert (=> d!113783 m!874463))

(declare-fun m!874465 () Bool)

(assert (=> d!113783 m!874465))

(declare-fun m!874467 () Bool)

(assert (=> b!938893 m!874467))

(declare-fun m!874469 () Bool)

(assert (=> b!938894 m!874469))

(assert (=> b!938701 d!113783))

(declare-fun d!113785 () Bool)

(assert (=> d!113785 (= (apply!856 lt!423997 lt!424000) (get!14337 (getValueByKey!484 (toList!6055 lt!423997) lt!424000)))))

(declare-fun bs!26366 () Bool)

(assert (= bs!26366 d!113785))

(declare-fun m!874471 () Bool)

(assert (=> bs!26366 m!874471))

(assert (=> bs!26366 m!874471))

(declare-fun m!874473 () Bool)

(assert (=> bs!26366 m!874473))

(assert (=> b!938701 d!113785))

(declare-fun d!113787 () Bool)

(declare-fun e!527324 () Bool)

(assert (=> d!113787 e!527324))

(declare-fun res!631608 () Bool)

(assert (=> d!113787 (=> (not res!631608) (not e!527324))))

(declare-fun lt!424125 () ListLongMap!12079)

(assert (=> d!113787 (= res!631608 (contains!5115 lt!424125 (_1!6702 (tuple2!13383 lt!423986 zeroValue!1173))))))

(declare-fun lt!424123 () List!19159)

(assert (=> d!113787 (= lt!424125 (ListLongMap!12080 lt!424123))))

(declare-fun lt!424124 () Unit!31700)

(declare-fun lt!424126 () Unit!31700)

(assert (=> d!113787 (= lt!424124 lt!424126)))

(assert (=> d!113787 (= (getValueByKey!484 lt!424123 (_1!6702 (tuple2!13383 lt!423986 zeroValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423986 zeroValue!1173))))))

(assert (=> d!113787 (= lt!424126 (lemmaContainsTupThenGetReturnValue!260 lt!424123 (_1!6702 (tuple2!13383 lt!423986 zeroValue!1173)) (_2!6702 (tuple2!13383 lt!423986 zeroValue!1173))))))

(assert (=> d!113787 (= lt!424123 (insertStrictlySorted!317 (toList!6055 lt!423999) (_1!6702 (tuple2!13383 lt!423986 zeroValue!1173)) (_2!6702 (tuple2!13383 lt!423986 zeroValue!1173))))))

(assert (=> d!113787 (= (+!2842 lt!423999 (tuple2!13383 lt!423986 zeroValue!1173)) lt!424125)))

(declare-fun b!938895 () Bool)

(declare-fun res!631609 () Bool)

(assert (=> b!938895 (=> (not res!631609) (not e!527324))))

(assert (=> b!938895 (= res!631609 (= (getValueByKey!484 (toList!6055 lt!424125) (_1!6702 (tuple2!13383 lt!423986 zeroValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423986 zeroValue!1173)))))))

(declare-fun b!938896 () Bool)

(assert (=> b!938896 (= e!527324 (contains!5118 (toList!6055 lt!424125) (tuple2!13383 lt!423986 zeroValue!1173)))))

(assert (= (and d!113787 res!631608) b!938895))

(assert (= (and b!938895 res!631609) b!938896))

(declare-fun m!874475 () Bool)

(assert (=> d!113787 m!874475))

(declare-fun m!874477 () Bool)

(assert (=> d!113787 m!874477))

(declare-fun m!874479 () Bool)

(assert (=> d!113787 m!874479))

(declare-fun m!874481 () Bool)

(assert (=> d!113787 m!874481))

(declare-fun m!874483 () Bool)

(assert (=> b!938895 m!874483))

(declare-fun m!874485 () Bool)

(assert (=> b!938896 m!874485))

(assert (=> b!938701 d!113787))

(declare-fun d!113789 () Bool)

(assert (=> d!113789 (= (apply!856 (+!2842 lt!423999 (tuple2!13383 lt!423986 zeroValue!1173)) lt!424002) (apply!856 lt!423999 lt!424002))))

(declare-fun lt!424127 () Unit!31700)

(assert (=> d!113789 (= lt!424127 (choose!1561 lt!423999 lt!423986 zeroValue!1173 lt!424002))))

(declare-fun e!527325 () Bool)

(assert (=> d!113789 e!527325))

(declare-fun res!631610 () Bool)

(assert (=> d!113789 (=> (not res!631610) (not e!527325))))

(assert (=> d!113789 (= res!631610 (contains!5115 lt!423999 lt!424002))))

(assert (=> d!113789 (= (addApplyDifferent!441 lt!423999 lt!423986 zeroValue!1173 lt!424002) lt!424127)))

(declare-fun b!938897 () Bool)

(assert (=> b!938897 (= e!527325 (not (= lt!424002 lt!423986)))))

(assert (= (and d!113789 res!631610) b!938897))

(assert (=> d!113789 m!874135))

(declare-fun m!874487 () Bool)

(assert (=> d!113789 m!874487))

(assert (=> d!113789 m!874109))

(assert (=> d!113789 m!874109))

(assert (=> d!113789 m!874111))

(declare-fun m!874489 () Bool)

(assert (=> d!113789 m!874489))

(assert (=> b!938701 d!113789))

(declare-fun d!113791 () Bool)

(assert (=> d!113791 (= (apply!856 lt!423994 lt!423992) (get!14337 (getValueByKey!484 (toList!6055 lt!423994) lt!423992)))))

(declare-fun bs!26367 () Bool)

(assert (= bs!26367 d!113791))

(declare-fun m!874491 () Bool)

(assert (=> bs!26367 m!874491))

(assert (=> bs!26367 m!874491))

(declare-fun m!874493 () Bool)

(assert (=> bs!26367 m!874493))

(assert (=> b!938701 d!113791))

(declare-fun d!113793 () Bool)

(assert (=> d!113793 (= (apply!856 (+!2842 lt!423994 (tuple2!13383 lt!424004 minValue!1173)) lt!423992) (get!14337 (getValueByKey!484 (toList!6055 (+!2842 lt!423994 (tuple2!13383 lt!424004 minValue!1173))) lt!423992)))))

(declare-fun bs!26368 () Bool)

(assert (= bs!26368 d!113793))

(declare-fun m!874495 () Bool)

(assert (=> bs!26368 m!874495))

(assert (=> bs!26368 m!874495))

(declare-fun m!874497 () Bool)

(assert (=> bs!26368 m!874497))

(assert (=> b!938701 d!113793))

(declare-fun d!113795 () Bool)

(assert (=> d!113795 (= (apply!856 (+!2842 lt!423999 (tuple2!13383 lt!423986 zeroValue!1173)) lt!424002) (get!14337 (getValueByKey!484 (toList!6055 (+!2842 lt!423999 (tuple2!13383 lt!423986 zeroValue!1173))) lt!424002)))))

(declare-fun bs!26369 () Bool)

(assert (= bs!26369 d!113795))

(declare-fun m!874499 () Bool)

(assert (=> bs!26369 m!874499))

(assert (=> bs!26369 m!874499))

(declare-fun m!874501 () Bool)

(assert (=> bs!26369 m!874501))

(assert (=> b!938701 d!113795))

(declare-fun d!113797 () Bool)

(assert (=> d!113797 (contains!5115 (+!2842 lt!423983 (tuple2!13383 lt!423989 zeroValue!1173)) lt!423991)))

(declare-fun lt!424128 () Unit!31700)

(assert (=> d!113797 (= lt!424128 (choose!1559 lt!423983 lt!423989 zeroValue!1173 lt!423991))))

(assert (=> d!113797 (contains!5115 lt!423983 lt!423991)))

(assert (=> d!113797 (= (addStillContains!561 lt!423983 lt!423989 zeroValue!1173 lt!423991) lt!424128)))

(declare-fun bs!26370 () Bool)

(assert (= bs!26370 d!113797))

(assert (=> bs!26370 m!874115))

(assert (=> bs!26370 m!874115))

(assert (=> bs!26370 m!874119))

(declare-fun m!874503 () Bool)

(assert (=> bs!26370 m!874503))

(declare-fun m!874505 () Bool)

(assert (=> bs!26370 m!874505))

(assert (=> b!938701 d!113797))

(declare-fun d!113799 () Bool)

(assert (=> d!113799 (= (apply!856 (+!2842 lt!423997 (tuple2!13383 lt!423995 minValue!1173)) lt!424000) (get!14337 (getValueByKey!484 (toList!6055 (+!2842 lt!423997 (tuple2!13383 lt!423995 minValue!1173))) lt!424000)))))

(declare-fun bs!26371 () Bool)

(assert (= bs!26371 d!113799))

(declare-fun m!874507 () Bool)

(assert (=> bs!26371 m!874507))

(assert (=> bs!26371 m!874507))

(declare-fun m!874509 () Bool)

(assert (=> bs!26371 m!874509))

(assert (=> b!938701 d!113799))

(declare-fun d!113801 () Bool)

(declare-fun e!527326 () Bool)

(assert (=> d!113801 e!527326))

(declare-fun res!631611 () Bool)

(assert (=> d!113801 (=> (not res!631611) (not e!527326))))

(declare-fun lt!424131 () ListLongMap!12079)

(assert (=> d!113801 (= res!631611 (contains!5115 lt!424131 (_1!6702 (ite (or c!97842 c!97838) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!424129 () List!19159)

(assert (=> d!113801 (= lt!424131 (ListLongMap!12080 lt!424129))))

(declare-fun lt!424130 () Unit!31700)

(declare-fun lt!424132 () Unit!31700)

(assert (=> d!113801 (= lt!424130 lt!424132)))

(assert (=> d!113801 (= (getValueByKey!484 lt!424129 (_1!6702 (ite (or c!97842 c!97838) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!489 (_2!6702 (ite (or c!97842 c!97838) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113801 (= lt!424132 (lemmaContainsTupThenGetReturnValue!260 lt!424129 (_1!6702 (ite (or c!97842 c!97838) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6702 (ite (or c!97842 c!97838) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113801 (= lt!424129 (insertStrictlySorted!317 (toList!6055 (ite c!97842 call!40855 (ite c!97838 call!40858 call!40854))) (_1!6702 (ite (or c!97842 c!97838) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6702 (ite (or c!97842 c!97838) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113801 (= (+!2842 (ite c!97842 call!40855 (ite c!97838 call!40858 call!40854)) (ite (or c!97842 c!97838) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!424131)))

(declare-fun b!938898 () Bool)

(declare-fun res!631612 () Bool)

(assert (=> b!938898 (=> (not res!631612) (not e!527326))))

(assert (=> b!938898 (= res!631612 (= (getValueByKey!484 (toList!6055 lt!424131) (_1!6702 (ite (or c!97842 c!97838) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!489 (_2!6702 (ite (or c!97842 c!97838) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!938899 () Bool)

(assert (=> b!938899 (= e!527326 (contains!5118 (toList!6055 lt!424131) (ite (or c!97842 c!97838) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113801 res!631611) b!938898))

(assert (= (and b!938898 res!631612) b!938899))

(declare-fun m!874511 () Bool)

(assert (=> d!113801 m!874511))

(declare-fun m!874513 () Bool)

(assert (=> d!113801 m!874513))

(declare-fun m!874515 () Bool)

(assert (=> d!113801 m!874515))

(declare-fun m!874517 () Bool)

(assert (=> d!113801 m!874517))

(declare-fun m!874519 () Bool)

(assert (=> b!938898 m!874519))

(declare-fun m!874521 () Bool)

(assert (=> b!938899 m!874521))

(assert (=> bm!40853 d!113801))

(assert (=> b!938603 d!113769))

(declare-fun d!113803 () Bool)

(assert (=> d!113803 (= (get!14337 (getValueByKey!484 (toList!6055 lt!423784) k0!1099)) (v!12713 (getValueByKey!484 (toList!6055 lt!423784) k0!1099)))))

(assert (=> d!113651 d!113803))

(assert (=> d!113651 d!113765))

(declare-fun d!113805 () Bool)

(assert (=> d!113805 (= (apply!856 lt!423886 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14337 (getValueByKey!484 (toList!6055 lt!423886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26372 () Bool)

(assert (= bs!26372 d!113805))

(declare-fun m!874523 () Bool)

(assert (=> bs!26372 m!874523))

(assert (=> bs!26372 m!874523))

(declare-fun m!874525 () Bool)

(assert (=> bs!26372 m!874525))

(assert (=> b!938575 d!113805))

(declare-fun d!113807 () Bool)

(assert (=> d!113807 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423784) k0!1099))))

(declare-fun lt!424135 () Unit!31700)

(declare-fun choose!1564 (List!19159 (_ BitVec 64)) Unit!31700)

(assert (=> d!113807 (= lt!424135 (choose!1564 (toList!6055 lt!423784) k0!1099))))

(declare-fun e!527329 () Bool)

(assert (=> d!113807 e!527329))

(declare-fun res!631615 () Bool)

(assert (=> d!113807 (=> (not res!631615) (not e!527329))))

(assert (=> d!113807 (= res!631615 (isStrictlySorted!504 (toList!6055 lt!423784)))))

(assert (=> d!113807 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423784) k0!1099) lt!424135)))

(declare-fun b!938902 () Bool)

(assert (=> b!938902 (= e!527329 (containsKey!451 (toList!6055 lt!423784) k0!1099))))

(assert (= (and d!113807 res!631615) b!938902))

(assert (=> d!113807 m!873963))

(assert (=> d!113807 m!873963))

(assert (=> d!113807 m!873965))

(declare-fun m!874527 () Bool)

(assert (=> d!113807 m!874527))

(declare-fun m!874529 () Bool)

(assert (=> d!113807 m!874529))

(assert (=> b!938902 m!873959))

(assert (=> b!938614 d!113807))

(assert (=> b!938614 d!113763))

(assert (=> b!938614 d!113765))

(assert (=> b!938602 d!113769))

(declare-fun d!113809 () Bool)

(assert (=> d!113809 (= (apply!856 lt!423993 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14337 (getValueByKey!484 (toList!6055 lt!423993) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26373 () Bool)

(assert (= bs!26373 d!113809))

(assert (=> bs!26373 m!874327))

(assert (=> bs!26373 m!874327))

(declare-fun m!874531 () Bool)

(assert (=> bs!26373 m!874531))

(assert (=> b!938683 d!113809))

(declare-fun d!113811 () Bool)

(assert (=> d!113811 (= (get!14338 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!12711 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938656 d!113811))

(assert (=> b!938700 d!113727))

(assert (=> b!938641 d!113737))

(declare-fun b!938903 () Bool)

(declare-fun e!527330 () Option!490)

(assert (=> b!938903 (= e!527330 (Some!489 (_2!6702 (h!20301 (toList!6055 lt!423932)))))))

(declare-fun b!938904 () Bool)

(declare-fun e!527331 () Option!490)

(assert (=> b!938904 (= e!527330 e!527331)))

(declare-fun c!97907 () Bool)

(assert (=> b!938904 (= c!97907 (and ((_ is Cons!19155) (toList!6055 lt!423932)) (not (= (_1!6702 (h!20301 (toList!6055 lt!423932))) (_1!6702 lt!423782)))))))

(declare-fun b!938906 () Bool)

(assert (=> b!938906 (= e!527331 None!488)))

(declare-fun d!113813 () Bool)

(declare-fun c!97906 () Bool)

(assert (=> d!113813 (= c!97906 (and ((_ is Cons!19155) (toList!6055 lt!423932)) (= (_1!6702 (h!20301 (toList!6055 lt!423932))) (_1!6702 lt!423782))))))

(assert (=> d!113813 (= (getValueByKey!484 (toList!6055 lt!423932) (_1!6702 lt!423782)) e!527330)))

(declare-fun b!938905 () Bool)

(assert (=> b!938905 (= e!527331 (getValueByKey!484 (t!27460 (toList!6055 lt!423932)) (_1!6702 lt!423782)))))

(assert (= (and d!113813 c!97906) b!938903))

(assert (= (and d!113813 (not c!97906)) b!938904))

(assert (= (and b!938904 c!97907) b!938905))

(assert (= (and b!938904 (not c!97907)) b!938906))

(declare-fun m!874533 () Bool)

(assert (=> b!938905 m!874533))

(assert (=> b!938627 d!113813))

(declare-fun d!113815 () Bool)

(declare-fun e!527333 () Bool)

(assert (=> d!113815 e!527333))

(declare-fun res!631616 () Bool)

(assert (=> d!113815 (=> res!631616 e!527333)))

(declare-fun lt!424137 () Bool)

(assert (=> d!113815 (= res!631616 (not lt!424137))))

(declare-fun lt!424139 () Bool)

(assert (=> d!113815 (= lt!424137 lt!424139)))

(declare-fun lt!424138 () Unit!31700)

(declare-fun e!527332 () Unit!31700)

(assert (=> d!113815 (= lt!424138 e!527332)))

(declare-fun c!97908 () Bool)

(assert (=> d!113815 (= c!97908 lt!424139)))

(assert (=> d!113815 (= lt!424139 (containsKey!451 (toList!6055 lt!423886) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113815 (= (contains!5115 lt!423886 #b1000000000000000000000000000000000000000000000000000000000000000) lt!424137)))

(declare-fun b!938907 () Bool)

(declare-fun lt!424136 () Unit!31700)

(assert (=> b!938907 (= e!527332 lt!424136)))

(assert (=> b!938907 (= lt!424136 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423886) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938907 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423886) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938908 () Bool)

(declare-fun Unit!31721 () Unit!31700)

(assert (=> b!938908 (= e!527332 Unit!31721)))

(declare-fun b!938909 () Bool)

(assert (=> b!938909 (= e!527333 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113815 c!97908) b!938907))

(assert (= (and d!113815 (not c!97908)) b!938908))

(assert (= (and d!113815 (not res!631616)) b!938909))

(declare-fun m!874535 () Bool)

(assert (=> d!113815 m!874535))

(declare-fun m!874537 () Bool)

(assert (=> b!938907 m!874537))

(assert (=> b!938907 m!874523))

(assert (=> b!938907 m!874523))

(declare-fun m!874539 () Bool)

(assert (=> b!938907 m!874539))

(assert (=> b!938909 m!874523))

(assert (=> b!938909 m!874523))

(assert (=> b!938909 m!874539))

(assert (=> bm!40846 d!113815))

(declare-fun d!113817 () Bool)

(assert (=> d!113817 (= (isDefined!356 (getValueByKey!484 (toList!6055 lt!423783) k0!1099)) (not (isEmpty!699 (getValueByKey!484 (toList!6055 lt!423783) k0!1099))))))

(declare-fun bs!26374 () Bool)

(assert (= bs!26374 d!113817))

(assert (=> bs!26374 m!874071))

(declare-fun m!874541 () Bool)

(assert (=> bs!26374 m!874541))

(assert (=> b!938681 d!113817))

(assert (=> b!938681 d!113757))

(declare-fun d!113819 () Bool)

(declare-fun e!527335 () Bool)

(assert (=> d!113819 e!527335))

(declare-fun res!631617 () Bool)

(assert (=> d!113819 (=> res!631617 e!527335)))

(declare-fun lt!424141 () Bool)

(assert (=> d!113819 (= res!631617 (not lt!424141))))

(declare-fun lt!424143 () Bool)

(assert (=> d!113819 (= lt!424141 lt!424143)))

(declare-fun lt!424142 () Unit!31700)

(declare-fun e!527334 () Unit!31700)

(assert (=> d!113819 (= lt!424142 e!527334)))

(declare-fun c!97909 () Bool)

(assert (=> d!113819 (= c!97909 lt!424143)))

(assert (=> d!113819 (= lt!424143 (containsKey!451 (toList!6055 lt!423886) (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> d!113819 (= (contains!5115 lt!423886 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) lt!424141)))

(declare-fun b!938910 () Bool)

(declare-fun lt!424140 () Unit!31700)

(assert (=> b!938910 (= e!527334 lt!424140)))

(assert (=> b!938910 (= lt!424140 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423886) (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938910 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423886) (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938911 () Bool)

(declare-fun Unit!31722 () Unit!31700)

(assert (=> b!938911 (= e!527334 Unit!31722)))

(declare-fun b!938912 () Bool)

(assert (=> b!938912 (= e!527335 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423886) (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (= (and d!113819 c!97909) b!938910))

(assert (= (and d!113819 (not c!97909)) b!938911))

(assert (= (and d!113819 (not res!631617)) b!938912))

(assert (=> d!113819 m!873757))

(declare-fun m!874543 () Bool)

(assert (=> d!113819 m!874543))

(assert (=> b!938910 m!873757))

(declare-fun m!874545 () Bool)

(assert (=> b!938910 m!874545))

(assert (=> b!938910 m!873757))

(declare-fun m!874547 () Bool)

(assert (=> b!938910 m!874547))

(assert (=> b!938910 m!874547))

(declare-fun m!874549 () Bool)

(assert (=> b!938910 m!874549))

(assert (=> b!938912 m!873757))

(assert (=> b!938912 m!874547))

(assert (=> b!938912 m!874547))

(assert (=> b!938912 m!874549))

(assert (=> b!938587 d!113819))

(assert (=> b!938621 d!113667))

(declare-fun b!938913 () Bool)

(declare-fun e!527336 () Option!490)

(assert (=> b!938913 (= e!527336 (Some!489 (_2!6702 (h!20301 (toList!6055 lt!423958)))))))

(declare-fun b!938914 () Bool)

(declare-fun e!527337 () Option!490)

(assert (=> b!938914 (= e!527336 e!527337)))

(declare-fun c!97911 () Bool)

(assert (=> b!938914 (= c!97911 (and ((_ is Cons!19155) (toList!6055 lt!423958)) (not (= (_1!6702 (h!20301 (toList!6055 lt!423958))) (_1!6702 lt!423782)))))))

(declare-fun b!938916 () Bool)

(assert (=> b!938916 (= e!527337 None!488)))

(declare-fun d!113821 () Bool)

(declare-fun c!97910 () Bool)

(assert (=> d!113821 (= c!97910 (and ((_ is Cons!19155) (toList!6055 lt!423958)) (= (_1!6702 (h!20301 (toList!6055 lt!423958))) (_1!6702 lt!423782))))))

(assert (=> d!113821 (= (getValueByKey!484 (toList!6055 lt!423958) (_1!6702 lt!423782)) e!527336)))

(declare-fun b!938915 () Bool)

(assert (=> b!938915 (= e!527337 (getValueByKey!484 (t!27460 (toList!6055 lt!423958)) (_1!6702 lt!423782)))))

(assert (= (and d!113821 c!97910) b!938913))

(assert (= (and d!113821 (not c!97910)) b!938914))

(assert (= (and b!938914 c!97911) b!938915))

(assert (= (and b!938914 (not c!97911)) b!938916))

(declare-fun m!874551 () Bool)

(assert (=> b!938915 m!874551))

(assert (=> b!938650 d!113821))

(declare-fun b!938917 () Bool)

(declare-fun e!527338 () Bool)

(declare-fun e!527339 () Bool)

(assert (=> b!938917 (= e!527338 e!527339)))

(declare-fun lt!424144 () (_ BitVec 64))

(assert (=> b!938917 (= lt!424144 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!424146 () Unit!31700)

(assert (=> b!938917 (= lt!424146 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!424144 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!938917 (arrayContainsKey!0 _keys!1487 lt!424144 #b00000000000000000000000000000000)))

(declare-fun lt!424145 () Unit!31700)

(assert (=> b!938917 (= lt!424145 lt!424146)))

(declare-fun res!631619 () Bool)

(assert (=> b!938917 (= res!631619 (= (seekEntryOrOpen!0 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1487 mask!1881) (Found!8982 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!938917 (=> (not res!631619) (not e!527339))))

(declare-fun b!938918 () Bool)

(declare-fun e!527340 () Bool)

(assert (=> b!938918 (= e!527340 e!527338)))

(declare-fun c!97912 () Bool)

(assert (=> b!938918 (= c!97912 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!113823 () Bool)

(declare-fun res!631618 () Bool)

(assert (=> d!113823 (=> res!631618 e!527340)))

(assert (=> d!113823 (= res!631618 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(assert (=> d!113823 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881) e!527340)))

(declare-fun bm!40887 () Bool)

(declare-fun call!40890 () Bool)

(assert (=> bm!40887 (= call!40890 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!938919 () Bool)

(assert (=> b!938919 (= e!527339 call!40890)))

(declare-fun b!938920 () Bool)

(assert (=> b!938920 (= e!527338 call!40890)))

(assert (= (and d!113823 (not res!631618)) b!938918))

(assert (= (and b!938918 c!97912) b!938917))

(assert (= (and b!938918 (not c!97912)) b!938920))

(assert (= (and b!938917 res!631619) b!938919))

(assert (= (or b!938919 b!938920) bm!40887))

(declare-fun m!874553 () Bool)

(assert (=> b!938917 m!874553))

(declare-fun m!874555 () Bool)

(assert (=> b!938917 m!874555))

(declare-fun m!874557 () Bool)

(assert (=> b!938917 m!874557))

(assert (=> b!938917 m!874553))

(declare-fun m!874559 () Bool)

(assert (=> b!938917 m!874559))

(assert (=> b!938918 m!874553))

(assert (=> b!938918 m!874553))

(declare-fun m!874561 () Bool)

(assert (=> b!938918 m!874561))

(declare-fun m!874563 () Bool)

(assert (=> bm!40887 m!874563))

(assert (=> bm!40859 d!113823))

(declare-fun d!113825 () Bool)

(assert (=> d!113825 (= (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2842 (getCurrentListMap!3289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13383 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!113825 true))

(declare-fun _$20!34 () Unit!31700)

(assert (=> d!113825 (= (choose!1560 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) _$20!34)))

(declare-fun b_lambda!14241 () Bool)

(assert (=> (not b_lambda!14241) (not d!113825)))

(assert (=> d!113825 t!27459))

(declare-fun b_and!29151 () Bool)

(assert (= b_and!29149 (and (=> t!27459 result!12137) b_and!29151)))

(assert (=> d!113825 m!873767))

(assert (=> d!113825 m!873757))

(assert (=> d!113825 m!873771))

(assert (=> d!113825 m!873767))

(assert (=> d!113825 m!873771))

(assert (=> d!113825 m!873777))

(assert (=> d!113825 m!873789))

(assert (=> d!113825 m!873947))

(assert (=> d!113825 m!873947))

(assert (=> d!113825 m!873949))

(assert (=> d!113641 d!113825))

(assert (=> d!113641 d!113671))

(declare-fun d!113827 () Bool)

(assert (=> d!113827 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423783) k0!1099))))

(declare-fun lt!424147 () Unit!31700)

(assert (=> d!113827 (= lt!424147 (choose!1564 (toList!6055 lt!423783) k0!1099))))

(declare-fun e!527341 () Bool)

(assert (=> d!113827 e!527341))

(declare-fun res!631620 () Bool)

(assert (=> d!113827 (=> (not res!631620) (not e!527341))))

(assert (=> d!113827 (= res!631620 (isStrictlySorted!504 (toList!6055 lt!423783)))))

(assert (=> d!113827 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423783) k0!1099) lt!424147)))

(declare-fun b!938921 () Bool)

(assert (=> b!938921 (= e!527341 (containsKey!451 (toList!6055 lt!423783) k0!1099))))

(assert (= (and d!113827 res!631620) b!938921))

(assert (=> d!113827 m!874071))

(assert (=> d!113827 m!874071))

(assert (=> d!113827 m!874089))

(declare-fun m!874565 () Bool)

(assert (=> d!113827 m!874565))

(declare-fun m!874567 () Bool)

(assert (=> d!113827 m!874567))

(assert (=> b!938921 m!874085))

(assert (=> b!938679 d!113827))

(assert (=> b!938679 d!113817))

(assert (=> b!938679 d!113757))

(assert (=> b!938586 d!113769))

(declare-fun d!113829 () Bool)

(assert (=> d!113829 (not (= (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) k0!1099))))

(assert (=> d!113829 true))

(declare-fun _$67!52 () Unit!31700)

(assert (=> d!113829 (= (choose!21 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19157) _$67!52)))

(declare-fun bs!26375 () Bool)

(assert (= bs!26375 d!113829))

(assert (=> bs!26375 m!873757))

(assert (=> d!113659 d!113829))

(declare-fun d!113831 () Bool)

(declare-fun e!527344 () Bool)

(assert (=> d!113831 e!527344))

(declare-fun c!97915 () Bool)

(assert (=> d!113831 (= c!97915 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!113831 true))

(declare-fun _$29!183 () Unit!31700)

(assert (=> d!113831 (= (choose!1562 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) _$29!183)))

(declare-fun b!938926 () Bool)

(assert (=> b!938926 (= e!527344 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!938927 () Bool)

(assert (=> b!938927 (= e!527344 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113831 c!97915) b!938926))

(assert (= (and d!113831 (not c!97915)) b!938927))

(assert (=> b!938926 m!873813))

(assert (=> d!113649 d!113831))

(assert (=> d!113649 d!113671))

(declare-fun d!113833 () Bool)

(assert (=> d!113833 (= (apply!856 lt!423993 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14337 (getValueByKey!484 (toList!6055 lt!423993) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26376 () Bool)

(assert (= bs!26376 d!113833))

(declare-fun m!874569 () Bool)

(assert (=> bs!26376 m!874569))

(assert (=> bs!26376 m!874569))

(declare-fun m!874571 () Bool)

(assert (=> bs!26376 m!874571))

(assert (=> b!938693 d!113833))

(declare-fun d!113835 () Bool)

(declare-fun e!527345 () Bool)

(assert (=> d!113835 e!527345))

(declare-fun res!631621 () Bool)

(assert (=> d!113835 (=> (not res!631621) (not e!527345))))

(declare-fun lt!424150 () ListLongMap!12079)

(assert (=> d!113835 (= res!631621 (contains!5115 lt!424150 (_1!6702 (ite (or c!97856 c!97852) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!424148 () List!19159)

(assert (=> d!113835 (= lt!424150 (ListLongMap!12080 lt!424148))))

(declare-fun lt!424149 () Unit!31700)

(declare-fun lt!424151 () Unit!31700)

(assert (=> d!113835 (= lt!424149 lt!424151)))

(assert (=> d!113835 (= (getValueByKey!484 lt!424148 (_1!6702 (ite (or c!97856 c!97852) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!489 (_2!6702 (ite (or c!97856 c!97852) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113835 (= lt!424151 (lemmaContainsTupThenGetReturnValue!260 lt!424148 (_1!6702 (ite (or c!97856 c!97852) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6702 (ite (or c!97856 c!97852) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113835 (= lt!424148 (insertStrictlySorted!317 (toList!6055 (ite c!97856 call!40865 (ite c!97852 call!40868 call!40864))) (_1!6702 (ite (or c!97856 c!97852) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6702 (ite (or c!97856 c!97852) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113835 (= (+!2842 (ite c!97856 call!40865 (ite c!97852 call!40868 call!40864)) (ite (or c!97856 c!97852) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!424150)))

(declare-fun b!938928 () Bool)

(declare-fun res!631622 () Bool)

(assert (=> b!938928 (=> (not res!631622) (not e!527345))))

(assert (=> b!938928 (= res!631622 (= (getValueByKey!484 (toList!6055 lt!424150) (_1!6702 (ite (or c!97856 c!97852) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!489 (_2!6702 (ite (or c!97856 c!97852) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!938929 () Bool)

(assert (=> b!938929 (= e!527345 (contains!5118 (toList!6055 lt!424150) (ite (or c!97856 c!97852) (tuple2!13383 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13383 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113835 res!631621) b!938928))

(assert (= (and b!938928 res!631622) b!938929))

(declare-fun m!874573 () Bool)

(assert (=> d!113835 m!874573))

(declare-fun m!874575 () Bool)

(assert (=> d!113835 m!874575))

(declare-fun m!874577 () Bool)

(assert (=> d!113835 m!874577))

(declare-fun m!874579 () Bool)

(assert (=> d!113835 m!874579))

(declare-fun m!874581 () Bool)

(assert (=> b!938928 m!874581))

(declare-fun m!874583 () Bool)

(assert (=> b!938929 m!874583))

(assert (=> bm!40863 d!113835))

(declare-fun d!113837 () Bool)

(declare-fun e!527347 () Bool)

(assert (=> d!113837 e!527347))

(declare-fun res!631623 () Bool)

(assert (=> d!113837 (=> res!631623 e!527347)))

(declare-fun lt!424153 () Bool)

(assert (=> d!113837 (= res!631623 (not lt!424153))))

(declare-fun lt!424155 () Bool)

(assert (=> d!113837 (= lt!424153 lt!424155)))

(declare-fun lt!424154 () Unit!31700)

(declare-fun e!527346 () Unit!31700)

(assert (=> d!113837 (= lt!424154 e!527346)))

(declare-fun c!97916 () Bool)

(assert (=> d!113837 (= c!97916 lt!424155)))

(assert (=> d!113837 (= lt!424155 (containsKey!451 (toList!6055 lt!423944) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113837 (= (contains!5115 lt!423944 #b0000000000000000000000000000000000000000000000000000000000000000) lt!424153)))

(declare-fun b!938930 () Bool)

(declare-fun lt!424152 () Unit!31700)

(assert (=> b!938930 (= e!527346 lt!424152)))

(assert (=> b!938930 (= lt!424152 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423944) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938930 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423944) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938931 () Bool)

(declare-fun Unit!31723 () Unit!31700)

(assert (=> b!938931 (= e!527346 Unit!31723)))

(declare-fun b!938932 () Bool)

(assert (=> b!938932 (= e!527347 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423944) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113837 c!97916) b!938930))

(assert (= (and d!113837 (not c!97916)) b!938931))

(assert (= (and d!113837 (not res!631623)) b!938932))

(declare-fun m!874585 () Bool)

(assert (=> d!113837 m!874585))

(declare-fun m!874587 () Bool)

(assert (=> b!938930 m!874587))

(assert (=> b!938930 m!874147))

(assert (=> b!938930 m!874147))

(declare-fun m!874589 () Bool)

(assert (=> b!938930 m!874589))

(assert (=> b!938932 m!874147))

(assert (=> b!938932 m!874147))

(assert (=> b!938932 m!874589))

(assert (=> bm!40851 d!113837))

(declare-fun d!113839 () Bool)

(assert (=> d!113839 (arrayContainsKey!0 _keys!1487 lt!423976 #b00000000000000000000000000000000)))

(declare-fun lt!424158 () Unit!31700)

(declare-fun choose!13 (array!56472 (_ BitVec 64) (_ BitVec 32)) Unit!31700)

(assert (=> d!113839 (= lt!424158 (choose!13 _keys!1487 lt!423976 #b00000000000000000000000000000000))))

(assert (=> d!113839 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!113839 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!423976 #b00000000000000000000000000000000) lt!424158)))

(declare-fun bs!26377 () Bool)

(assert (= bs!26377 d!113839))

(assert (=> bs!26377 m!874079))

(declare-fun m!874591 () Bool)

(assert (=> bs!26377 m!874591))

(assert (=> b!938675 d!113839))

(declare-fun d!113841 () Bool)

(declare-fun res!631624 () Bool)

(declare-fun e!527348 () Bool)

(assert (=> d!113841 (=> res!631624 e!527348)))

(assert (=> d!113841 (= res!631624 (= (select (arr!27175 _keys!1487) #b00000000000000000000000000000000) lt!423976))))

(assert (=> d!113841 (= (arrayContainsKey!0 _keys!1487 lt!423976 #b00000000000000000000000000000000) e!527348)))

(declare-fun b!938933 () Bool)

(declare-fun e!527349 () Bool)

(assert (=> b!938933 (= e!527348 e!527349)))

(declare-fun res!631625 () Bool)

(assert (=> b!938933 (=> (not res!631625) (not e!527349))))

(assert (=> b!938933 (= res!631625 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(declare-fun b!938934 () Bool)

(assert (=> b!938934 (= e!527349 (arrayContainsKey!0 _keys!1487 lt!423976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!113841 (not res!631624)) b!938933))

(assert (= (and b!938933 res!631625) b!938934))

(assert (=> d!113841 m!873881))

(declare-fun m!874593 () Bool)

(assert (=> b!938934 m!874593))

(assert (=> b!938675 d!113841))

(declare-fun b!938947 () Bool)

(declare-fun e!527356 () SeekEntryResult!8982)

(declare-fun lt!424167 () SeekEntryResult!8982)

(assert (=> b!938947 (= e!527356 (MissingZero!8982 (index!38301 lt!424167)))))

(declare-fun b!938948 () Bool)

(declare-fun e!527358 () SeekEntryResult!8982)

(declare-fun e!527357 () SeekEntryResult!8982)

(assert (=> b!938948 (= e!527358 e!527357)))

(declare-fun lt!424166 () (_ BitVec 64))

(assert (=> b!938948 (= lt!424166 (select (arr!27175 _keys!1487) (index!38301 lt!424167)))))

(declare-fun c!97924 () Bool)

(assert (=> b!938948 (= c!97924 (= lt!424166 (select (arr!27175 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!938949 () Bool)

(declare-fun c!97925 () Bool)

(assert (=> b!938949 (= c!97925 (= lt!424166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938949 (= e!527357 e!527356)))

(declare-fun d!113843 () Bool)

(declare-fun lt!424165 () SeekEntryResult!8982)

(assert (=> d!113843 (and (or ((_ is Undefined!8982) lt!424165) (not ((_ is Found!8982) lt!424165)) (and (bvsge (index!38300 lt!424165) #b00000000000000000000000000000000) (bvslt (index!38300 lt!424165) (size!27634 _keys!1487)))) (or ((_ is Undefined!8982) lt!424165) ((_ is Found!8982) lt!424165) (not ((_ is MissingZero!8982) lt!424165)) (and (bvsge (index!38299 lt!424165) #b00000000000000000000000000000000) (bvslt (index!38299 lt!424165) (size!27634 _keys!1487)))) (or ((_ is Undefined!8982) lt!424165) ((_ is Found!8982) lt!424165) ((_ is MissingZero!8982) lt!424165) (not ((_ is MissingVacant!8982) lt!424165)) (and (bvsge (index!38302 lt!424165) #b00000000000000000000000000000000) (bvslt (index!38302 lt!424165) (size!27634 _keys!1487)))) (or ((_ is Undefined!8982) lt!424165) (ite ((_ is Found!8982) lt!424165) (= (select (arr!27175 _keys!1487) (index!38300 lt!424165)) (select (arr!27175 _keys!1487) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8982) lt!424165) (= (select (arr!27175 _keys!1487) (index!38299 lt!424165)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8982) lt!424165) (= (select (arr!27175 _keys!1487) (index!38302 lt!424165)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113843 (= lt!424165 e!527358)))

(declare-fun c!97923 () Bool)

(assert (=> d!113843 (= c!97923 (and ((_ is Intermediate!8982) lt!424167) (undefined!9794 lt!424167)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56472 (_ BitVec 32)) SeekEntryResult!8982)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!113843 (= lt!424167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!27175 _keys!1487) #b00000000000000000000000000000000) mask!1881) (select (arr!27175 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881))))

(assert (=> d!113843 (validMask!0 mask!1881)))

(assert (=> d!113843 (= (seekEntryOrOpen!0 (select (arr!27175 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) lt!424165)))

(declare-fun b!938950 () Bool)

(assert (=> b!938950 (= e!527358 Undefined!8982)))

(declare-fun b!938951 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56472 (_ BitVec 32)) SeekEntryResult!8982)

(assert (=> b!938951 (= e!527356 (seekKeyOrZeroReturnVacant!0 (x!80462 lt!424167) (index!38301 lt!424167) (index!38301 lt!424167) (select (arr!27175 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881))))

(declare-fun b!938952 () Bool)

(assert (=> b!938952 (= e!527357 (Found!8982 (index!38301 lt!424167)))))

(assert (= (and d!113843 c!97923) b!938950))

(assert (= (and d!113843 (not c!97923)) b!938948))

(assert (= (and b!938948 c!97924) b!938952))

(assert (= (and b!938948 (not c!97924)) b!938949))

(assert (= (and b!938949 c!97925) b!938947))

(assert (= (and b!938949 (not c!97925)) b!938951))

(declare-fun m!874595 () Bool)

(assert (=> b!938948 m!874595))

(declare-fun m!874597 () Bool)

(assert (=> d!113843 m!874597))

(assert (=> d!113843 m!873881))

(declare-fun m!874599 () Bool)

(assert (=> d!113843 m!874599))

(declare-fun m!874601 () Bool)

(assert (=> d!113843 m!874601))

(declare-fun m!874603 () Bool)

(assert (=> d!113843 m!874603))

(assert (=> d!113843 m!873795))

(assert (=> d!113843 m!874599))

(assert (=> d!113843 m!873881))

(declare-fun m!874605 () Bool)

(assert (=> d!113843 m!874605))

(assert (=> b!938951 m!873881))

(declare-fun m!874607 () Bool)

(assert (=> b!938951 m!874607))

(assert (=> b!938675 d!113843))

(assert (=> d!113655 d!113671))

(declare-fun d!113845 () Bool)

(declare-fun e!527360 () Bool)

(assert (=> d!113845 e!527360))

(declare-fun res!631626 () Bool)

(assert (=> d!113845 (=> res!631626 e!527360)))

(declare-fun lt!424169 () Bool)

(assert (=> d!113845 (= res!631626 (not lt!424169))))

(declare-fun lt!424171 () Bool)

(assert (=> d!113845 (= lt!424169 lt!424171)))

(declare-fun lt!424170 () Unit!31700)

(declare-fun e!527359 () Unit!31700)

(assert (=> d!113845 (= lt!424170 e!527359)))

(declare-fun c!97926 () Bool)

(assert (=> d!113845 (= c!97926 lt!424171)))

(assert (=> d!113845 (= lt!424171 (containsKey!451 (toList!6055 lt!423932) (_1!6702 lt!423782)))))

(assert (=> d!113845 (= (contains!5115 lt!423932 (_1!6702 lt!423782)) lt!424169)))

(declare-fun b!938953 () Bool)

(declare-fun lt!424168 () Unit!31700)

(assert (=> b!938953 (= e!527359 lt!424168)))

(assert (=> b!938953 (= lt!424168 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423932) (_1!6702 lt!423782)))))

(assert (=> b!938953 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423932) (_1!6702 lt!423782)))))

(declare-fun b!938954 () Bool)

(declare-fun Unit!31724 () Unit!31700)

(assert (=> b!938954 (= e!527359 Unit!31724)))

(declare-fun b!938955 () Bool)

(assert (=> b!938955 (= e!527360 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423932) (_1!6702 lt!423782))))))

(assert (= (and d!113845 c!97926) b!938953))

(assert (= (and d!113845 (not c!97926)) b!938954))

(assert (= (and d!113845 (not res!631626)) b!938955))

(declare-fun m!874609 () Bool)

(assert (=> d!113845 m!874609))

(declare-fun m!874611 () Bool)

(assert (=> b!938953 m!874611))

(assert (=> b!938953 m!873979))

(assert (=> b!938953 m!873979))

(declare-fun m!874613 () Bool)

(assert (=> b!938953 m!874613))

(assert (=> b!938955 m!873979))

(assert (=> b!938955 m!873979))

(assert (=> b!938955 m!874613))

(assert (=> d!113653 d!113845))

(declare-fun b!938956 () Bool)

(declare-fun e!527361 () Option!490)

(assert (=> b!938956 (= e!527361 (Some!489 (_2!6702 (h!20301 lt!423930))))))

(declare-fun b!938957 () Bool)

(declare-fun e!527362 () Option!490)

(assert (=> b!938957 (= e!527361 e!527362)))

(declare-fun c!97928 () Bool)

(assert (=> b!938957 (= c!97928 (and ((_ is Cons!19155) lt!423930) (not (= (_1!6702 (h!20301 lt!423930)) (_1!6702 lt!423782)))))))

(declare-fun b!938959 () Bool)

(assert (=> b!938959 (= e!527362 None!488)))

(declare-fun d!113847 () Bool)

(declare-fun c!97927 () Bool)

(assert (=> d!113847 (= c!97927 (and ((_ is Cons!19155) lt!423930) (= (_1!6702 (h!20301 lt!423930)) (_1!6702 lt!423782))))))

(assert (=> d!113847 (= (getValueByKey!484 lt!423930 (_1!6702 lt!423782)) e!527361)))

(declare-fun b!938958 () Bool)

(assert (=> b!938958 (= e!527362 (getValueByKey!484 (t!27460 lt!423930) (_1!6702 lt!423782)))))

(assert (= (and d!113847 c!97927) b!938956))

(assert (= (and d!113847 (not c!97927)) b!938957))

(assert (= (and b!938957 c!97928) b!938958))

(assert (= (and b!938957 (not c!97928)) b!938959))

(declare-fun m!874615 () Bool)

(assert (=> b!938958 m!874615))

(assert (=> d!113653 d!113847))

(declare-fun d!113849 () Bool)

(assert (=> d!113849 (= (getValueByKey!484 lt!423930 (_1!6702 lt!423782)) (Some!489 (_2!6702 lt!423782)))))

(declare-fun lt!424172 () Unit!31700)

(assert (=> d!113849 (= lt!424172 (choose!1563 lt!423930 (_1!6702 lt!423782) (_2!6702 lt!423782)))))

(declare-fun e!527363 () Bool)

(assert (=> d!113849 e!527363))

(declare-fun res!631627 () Bool)

(assert (=> d!113849 (=> (not res!631627) (not e!527363))))

(assert (=> d!113849 (= res!631627 (isStrictlySorted!504 lt!423930))))

(assert (=> d!113849 (= (lemmaContainsTupThenGetReturnValue!260 lt!423930 (_1!6702 lt!423782) (_2!6702 lt!423782)) lt!424172)))

(declare-fun b!938960 () Bool)

(declare-fun res!631628 () Bool)

(assert (=> b!938960 (=> (not res!631628) (not e!527363))))

(assert (=> b!938960 (= res!631628 (containsKey!451 lt!423930 (_1!6702 lt!423782)))))

(declare-fun b!938961 () Bool)

(assert (=> b!938961 (= e!527363 (contains!5118 lt!423930 (tuple2!13383 (_1!6702 lt!423782) (_2!6702 lt!423782))))))

(assert (= (and d!113849 res!631627) b!938960))

(assert (= (and b!938960 res!631628) b!938961))

(assert (=> d!113849 m!873973))

(declare-fun m!874617 () Bool)

(assert (=> d!113849 m!874617))

(declare-fun m!874619 () Bool)

(assert (=> d!113849 m!874619))

(declare-fun m!874621 () Bool)

(assert (=> b!938960 m!874621))

(declare-fun m!874623 () Bool)

(assert (=> b!938961 m!874623))

(assert (=> d!113653 d!113849))

(declare-fun b!938962 () Bool)

(declare-fun e!527365 () List!19159)

(declare-fun call!40893 () List!19159)

(assert (=> b!938962 (= e!527365 call!40893)))

(declare-fun b!938963 () Bool)

(declare-fun e!527367 () List!19159)

(declare-fun call!40892 () List!19159)

(assert (=> b!938963 (= e!527367 call!40892)))

(declare-fun d!113851 () Bool)

(declare-fun e!527366 () Bool)

(assert (=> d!113851 e!527366))

(declare-fun res!631630 () Bool)

(assert (=> d!113851 (=> (not res!631630) (not e!527366))))

(declare-fun lt!424173 () List!19159)

(assert (=> d!113851 (= res!631630 (isStrictlySorted!504 lt!424173))))

(declare-fun e!527368 () List!19159)

(assert (=> d!113851 (= lt!424173 e!527368)))

(declare-fun c!97931 () Bool)

(assert (=> d!113851 (= c!97931 (and ((_ is Cons!19155) (toList!6055 lt!423783)) (bvslt (_1!6702 (h!20301 (toList!6055 lt!423783))) (_1!6702 lt!423782))))))

(assert (=> d!113851 (isStrictlySorted!504 (toList!6055 lt!423783))))

(assert (=> d!113851 (= (insertStrictlySorted!317 (toList!6055 lt!423783) (_1!6702 lt!423782) (_2!6702 lt!423782)) lt!424173)))

(declare-fun b!938964 () Bool)

(assert (=> b!938964 (= e!527367 call!40892)))

(declare-fun b!938965 () Bool)

(assert (=> b!938965 (= e!527368 e!527365)))

(declare-fun c!97932 () Bool)

(assert (=> b!938965 (= c!97932 (and ((_ is Cons!19155) (toList!6055 lt!423783)) (= (_1!6702 (h!20301 (toList!6055 lt!423783))) (_1!6702 lt!423782))))))

(declare-fun bm!40888 () Bool)

(declare-fun call!40891 () List!19159)

(assert (=> bm!40888 (= call!40893 call!40891)))

(declare-fun b!938966 () Bool)

(assert (=> b!938966 (= e!527366 (contains!5118 lt!424173 (tuple2!13383 (_1!6702 lt!423782) (_2!6702 lt!423782))))))

(declare-fun c!97930 () Bool)

(declare-fun b!938967 () Bool)

(declare-fun e!527364 () List!19159)

(assert (=> b!938967 (= e!527364 (ite c!97932 (t!27460 (toList!6055 lt!423783)) (ite c!97930 (Cons!19155 (h!20301 (toList!6055 lt!423783)) (t!27460 (toList!6055 lt!423783))) Nil!19156)))))

(declare-fun b!938968 () Bool)

(declare-fun res!631629 () Bool)

(assert (=> b!938968 (=> (not res!631629) (not e!527366))))

(assert (=> b!938968 (= res!631629 (containsKey!451 lt!424173 (_1!6702 lt!423782)))))

(declare-fun bm!40889 () Bool)

(assert (=> bm!40889 (= call!40891 ($colon$colon!553 e!527364 (ite c!97931 (h!20301 (toList!6055 lt!423783)) (tuple2!13383 (_1!6702 lt!423782) (_2!6702 lt!423782)))))))

(declare-fun c!97929 () Bool)

(assert (=> bm!40889 (= c!97929 c!97931)))

(declare-fun b!938969 () Bool)

(assert (=> b!938969 (= e!527368 call!40891)))

(declare-fun b!938970 () Bool)

(assert (=> b!938970 (= e!527364 (insertStrictlySorted!317 (t!27460 (toList!6055 lt!423783)) (_1!6702 lt!423782) (_2!6702 lt!423782)))))

(declare-fun b!938971 () Bool)

(assert (=> b!938971 (= c!97930 (and ((_ is Cons!19155) (toList!6055 lt!423783)) (bvsgt (_1!6702 (h!20301 (toList!6055 lt!423783))) (_1!6702 lt!423782))))))

(assert (=> b!938971 (= e!527365 e!527367)))

(declare-fun bm!40890 () Bool)

(assert (=> bm!40890 (= call!40892 call!40893)))

(assert (= (and d!113851 c!97931) b!938969))

(assert (= (and d!113851 (not c!97931)) b!938965))

(assert (= (and b!938965 c!97932) b!938962))

(assert (= (and b!938965 (not c!97932)) b!938971))

(assert (= (and b!938971 c!97930) b!938964))

(assert (= (and b!938971 (not c!97930)) b!938963))

(assert (= (or b!938964 b!938963) bm!40890))

(assert (= (or b!938962 bm!40890) bm!40888))

(assert (= (or b!938969 bm!40888) bm!40889))

(assert (= (and bm!40889 c!97929) b!938970))

(assert (= (and bm!40889 (not c!97929)) b!938967))

(assert (= (and d!113851 res!631630) b!938968))

(assert (= (and b!938968 res!631629) b!938966))

(declare-fun m!874625 () Bool)

(assert (=> d!113851 m!874625))

(assert (=> d!113851 m!874567))

(declare-fun m!874627 () Bool)

(assert (=> b!938966 m!874627))

(declare-fun m!874629 () Bool)

(assert (=> b!938970 m!874629))

(declare-fun m!874631 () Bool)

(assert (=> bm!40889 m!874631))

(declare-fun m!874633 () Bool)

(assert (=> b!938968 m!874633))

(assert (=> d!113653 d!113851))

(declare-fun d!113853 () Bool)

(declare-fun res!631631 () Bool)

(declare-fun e!527369 () Bool)

(assert (=> d!113853 (=> res!631631 e!527369)))

(assert (=> d!113853 (= res!631631 (and ((_ is Cons!19155) (toList!6055 lt!423784)) (= (_1!6702 (h!20301 (toList!6055 lt!423784))) k0!1099)))))

(assert (=> d!113853 (= (containsKey!451 (toList!6055 lt!423784) k0!1099) e!527369)))

(declare-fun b!938972 () Bool)

(declare-fun e!527370 () Bool)

(assert (=> b!938972 (= e!527369 e!527370)))

(declare-fun res!631632 () Bool)

(assert (=> b!938972 (=> (not res!631632) (not e!527370))))

(assert (=> b!938972 (= res!631632 (and (or (not ((_ is Cons!19155) (toList!6055 lt!423784))) (bvsle (_1!6702 (h!20301 (toList!6055 lt!423784))) k0!1099)) ((_ is Cons!19155) (toList!6055 lt!423784)) (bvslt (_1!6702 (h!20301 (toList!6055 lt!423784))) k0!1099)))))

(declare-fun b!938973 () Bool)

(assert (=> b!938973 (= e!527370 (containsKey!451 (t!27460 (toList!6055 lt!423784)) k0!1099))))

(assert (= (and d!113853 (not res!631631)) b!938972))

(assert (= (and b!938972 res!631632) b!938973))

(declare-fun m!874635 () Bool)

(assert (=> b!938973 m!874635))

(assert (=> d!113647 d!113853))

(declare-fun d!113855 () Bool)

(assert (=> d!113855 (= (apply!856 (+!2842 lt!423948 (tuple2!13383 lt!423946 minValue!1173)) lt!423951) (get!14337 (getValueByKey!484 (toList!6055 (+!2842 lt!423948 (tuple2!13383 lt!423946 minValue!1173))) lt!423951)))))

(declare-fun bs!26378 () Bool)

(assert (= bs!26378 d!113855))

(declare-fun m!874637 () Bool)

(assert (=> bs!26378 m!874637))

(assert (=> bs!26378 m!874637))

(declare-fun m!874639 () Bool)

(assert (=> bs!26378 m!874639))

(assert (=> b!938648 d!113855))

(declare-fun d!113857 () Bool)

(assert (=> d!113857 (contains!5115 (+!2842 lt!423934 (tuple2!13383 lt!423940 zeroValue!1173)) lt!423942)))

(declare-fun lt!424174 () Unit!31700)

(assert (=> d!113857 (= lt!424174 (choose!1559 lt!423934 lt!423940 zeroValue!1173 lt!423942))))

(assert (=> d!113857 (contains!5115 lt!423934 lt!423942)))

(assert (=> d!113857 (= (addStillContains!561 lt!423934 lt!423940 zeroValue!1173 lt!423942) lt!424174)))

(declare-fun bs!26379 () Bool)

(assert (= bs!26379 d!113857))

(assert (=> bs!26379 m!874009))

(assert (=> bs!26379 m!874009))

(assert (=> bs!26379 m!874013))

(declare-fun m!874641 () Bool)

(assert (=> bs!26379 m!874641))

(declare-fun m!874643 () Bool)

(assert (=> bs!26379 m!874643))

(assert (=> b!938648 d!113857))

(declare-fun d!113859 () Bool)

(declare-fun e!527372 () Bool)

(assert (=> d!113859 e!527372))

(declare-fun res!631633 () Bool)

(assert (=> d!113859 (=> res!631633 e!527372)))

(declare-fun lt!424176 () Bool)

(assert (=> d!113859 (= res!631633 (not lt!424176))))

(declare-fun lt!424178 () Bool)

(assert (=> d!113859 (= lt!424176 lt!424178)))

(declare-fun lt!424177 () Unit!31700)

(declare-fun e!527371 () Unit!31700)

(assert (=> d!113859 (= lt!424177 e!527371)))

(declare-fun c!97933 () Bool)

(assert (=> d!113859 (= c!97933 lt!424178)))

(assert (=> d!113859 (= lt!424178 (containsKey!451 (toList!6055 (+!2842 lt!423934 (tuple2!13383 lt!423940 zeroValue!1173))) lt!423942))))

(assert (=> d!113859 (= (contains!5115 (+!2842 lt!423934 (tuple2!13383 lt!423940 zeroValue!1173)) lt!423942) lt!424176)))

(declare-fun b!938974 () Bool)

(declare-fun lt!424175 () Unit!31700)

(assert (=> b!938974 (= e!527371 lt!424175)))

(assert (=> b!938974 (= lt!424175 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 (+!2842 lt!423934 (tuple2!13383 lt!423940 zeroValue!1173))) lt!423942))))

(assert (=> b!938974 (isDefined!356 (getValueByKey!484 (toList!6055 (+!2842 lt!423934 (tuple2!13383 lt!423940 zeroValue!1173))) lt!423942))))

(declare-fun b!938975 () Bool)

(declare-fun Unit!31725 () Unit!31700)

(assert (=> b!938975 (= e!527371 Unit!31725)))

(declare-fun b!938976 () Bool)

(assert (=> b!938976 (= e!527372 (isDefined!356 (getValueByKey!484 (toList!6055 (+!2842 lt!423934 (tuple2!13383 lt!423940 zeroValue!1173))) lt!423942)))))

(assert (= (and d!113859 c!97933) b!938974))

(assert (= (and d!113859 (not c!97933)) b!938975))

(assert (= (and d!113859 (not res!631633)) b!938976))

(declare-fun m!874645 () Bool)

(assert (=> d!113859 m!874645))

(declare-fun m!874647 () Bool)

(assert (=> b!938974 m!874647))

(declare-fun m!874649 () Bool)

(assert (=> b!938974 m!874649))

(assert (=> b!938974 m!874649))

(declare-fun m!874651 () Bool)

(assert (=> b!938974 m!874651))

(assert (=> b!938976 m!874649))

(assert (=> b!938976 m!874649))

(assert (=> b!938976 m!874651))

(assert (=> b!938648 d!113859))

(declare-fun d!113861 () Bool)

(assert (=> d!113861 (= (apply!856 lt!423950 lt!423953) (get!14337 (getValueByKey!484 (toList!6055 lt!423950) lt!423953)))))

(declare-fun bs!26380 () Bool)

(assert (= bs!26380 d!113861))

(declare-fun m!874653 () Bool)

(assert (=> bs!26380 m!874653))

(assert (=> bs!26380 m!874653))

(declare-fun m!874655 () Bool)

(assert (=> bs!26380 m!874655))

(assert (=> b!938648 d!113861))

(declare-fun d!113863 () Bool)

(assert (=> d!113863 (= (apply!856 (+!2842 lt!423945 (tuple2!13383 lt!423955 minValue!1173)) lt!423943) (apply!856 lt!423945 lt!423943))))

(declare-fun lt!424179 () Unit!31700)

(assert (=> d!113863 (= lt!424179 (choose!1561 lt!423945 lt!423955 minValue!1173 lt!423943))))

(declare-fun e!527373 () Bool)

(assert (=> d!113863 e!527373))

(declare-fun res!631634 () Bool)

(assert (=> d!113863 (=> (not res!631634) (not e!527373))))

(assert (=> d!113863 (= res!631634 (contains!5115 lt!423945 lt!423943))))

(assert (=> d!113863 (= (addApplyDifferent!441 lt!423945 lt!423955 minValue!1173 lt!423943) lt!424179)))

(declare-fun b!938977 () Bool)

(assert (=> b!938977 (= e!527373 (not (= lt!423943 lt!423955)))))

(assert (= (and d!113863 res!631634) b!938977))

(assert (=> d!113863 m!874025))

(declare-fun m!874657 () Bool)

(assert (=> d!113863 m!874657))

(assert (=> d!113863 m!874015))

(assert (=> d!113863 m!874015))

(assert (=> d!113863 m!874027))

(declare-fun m!874659 () Bool)

(assert (=> d!113863 m!874659))

(assert (=> b!938648 d!113863))

(declare-fun d!113865 () Bool)

(declare-fun e!527374 () Bool)

(assert (=> d!113865 e!527374))

(declare-fun res!631635 () Bool)

(assert (=> d!113865 (=> (not res!631635) (not e!527374))))

(declare-fun lt!424182 () ListLongMap!12079)

(assert (=> d!113865 (= res!631635 (contains!5115 lt!424182 (_1!6702 (tuple2!13383 lt!423940 zeroValue!1173))))))

(declare-fun lt!424180 () List!19159)

(assert (=> d!113865 (= lt!424182 (ListLongMap!12080 lt!424180))))

(declare-fun lt!424181 () Unit!31700)

(declare-fun lt!424183 () Unit!31700)

(assert (=> d!113865 (= lt!424181 lt!424183)))

(assert (=> d!113865 (= (getValueByKey!484 lt!424180 (_1!6702 (tuple2!13383 lt!423940 zeroValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423940 zeroValue!1173))))))

(assert (=> d!113865 (= lt!424183 (lemmaContainsTupThenGetReturnValue!260 lt!424180 (_1!6702 (tuple2!13383 lt!423940 zeroValue!1173)) (_2!6702 (tuple2!13383 lt!423940 zeroValue!1173))))))

(assert (=> d!113865 (= lt!424180 (insertStrictlySorted!317 (toList!6055 lt!423934) (_1!6702 (tuple2!13383 lt!423940 zeroValue!1173)) (_2!6702 (tuple2!13383 lt!423940 zeroValue!1173))))))

(assert (=> d!113865 (= (+!2842 lt!423934 (tuple2!13383 lt!423940 zeroValue!1173)) lt!424182)))

(declare-fun b!938978 () Bool)

(declare-fun res!631636 () Bool)

(assert (=> b!938978 (=> (not res!631636) (not e!527374))))

(assert (=> b!938978 (= res!631636 (= (getValueByKey!484 (toList!6055 lt!424182) (_1!6702 (tuple2!13383 lt!423940 zeroValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423940 zeroValue!1173)))))))

(declare-fun b!938979 () Bool)

(assert (=> b!938979 (= e!527374 (contains!5118 (toList!6055 lt!424182) (tuple2!13383 lt!423940 zeroValue!1173)))))

(assert (= (and d!113865 res!631635) b!938978))

(assert (= (and b!938978 res!631636) b!938979))

(declare-fun m!874661 () Bool)

(assert (=> d!113865 m!874661))

(declare-fun m!874663 () Bool)

(assert (=> d!113865 m!874663))

(declare-fun m!874665 () Bool)

(assert (=> d!113865 m!874665))

(declare-fun m!874667 () Bool)

(assert (=> d!113865 m!874667))

(declare-fun m!874669 () Bool)

(assert (=> b!938978 m!874669))

(declare-fun m!874671 () Bool)

(assert (=> b!938979 m!874671))

(assert (=> b!938648 d!113865))

(declare-fun d!113867 () Bool)

(assert (=> d!113867 (= (apply!856 lt!423948 lt!423951) (get!14337 (getValueByKey!484 (toList!6055 lt!423948) lt!423951)))))

(declare-fun bs!26381 () Bool)

(assert (= bs!26381 d!113867))

(declare-fun m!874673 () Bool)

(assert (=> bs!26381 m!874673))

(assert (=> bs!26381 m!874673))

(declare-fun m!874675 () Bool)

(assert (=> bs!26381 m!874675))

(assert (=> b!938648 d!113867))

(declare-fun d!113869 () Bool)

(declare-fun e!527375 () Bool)

(assert (=> d!113869 e!527375))

(declare-fun res!631637 () Bool)

(assert (=> d!113869 (=> (not res!631637) (not e!527375))))

(declare-fun lt!424186 () ListLongMap!12079)

(assert (=> d!113869 (= res!631637 (contains!5115 lt!424186 (_1!6702 (tuple2!13383 lt!423937 zeroValue!1173))))))

(declare-fun lt!424184 () List!19159)

(assert (=> d!113869 (= lt!424186 (ListLongMap!12080 lt!424184))))

(declare-fun lt!424185 () Unit!31700)

(declare-fun lt!424187 () Unit!31700)

(assert (=> d!113869 (= lt!424185 lt!424187)))

(assert (=> d!113869 (= (getValueByKey!484 lt!424184 (_1!6702 (tuple2!13383 lt!423937 zeroValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423937 zeroValue!1173))))))

(assert (=> d!113869 (= lt!424187 (lemmaContainsTupThenGetReturnValue!260 lt!424184 (_1!6702 (tuple2!13383 lt!423937 zeroValue!1173)) (_2!6702 (tuple2!13383 lt!423937 zeroValue!1173))))))

(assert (=> d!113869 (= lt!424184 (insertStrictlySorted!317 (toList!6055 lt!423950) (_1!6702 (tuple2!13383 lt!423937 zeroValue!1173)) (_2!6702 (tuple2!13383 lt!423937 zeroValue!1173))))))

(assert (=> d!113869 (= (+!2842 lt!423950 (tuple2!13383 lt!423937 zeroValue!1173)) lt!424186)))

(declare-fun b!938980 () Bool)

(declare-fun res!631638 () Bool)

(assert (=> b!938980 (=> (not res!631638) (not e!527375))))

(assert (=> b!938980 (= res!631638 (= (getValueByKey!484 (toList!6055 lt!424186) (_1!6702 (tuple2!13383 lt!423937 zeroValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423937 zeroValue!1173)))))))

(declare-fun b!938981 () Bool)

(assert (=> b!938981 (= e!527375 (contains!5118 (toList!6055 lt!424186) (tuple2!13383 lt!423937 zeroValue!1173)))))

(assert (= (and d!113869 res!631637) b!938980))

(assert (= (and b!938980 res!631638) b!938981))

(declare-fun m!874677 () Bool)

(assert (=> d!113869 m!874677))

(declare-fun m!874679 () Bool)

(assert (=> d!113869 m!874679))

(declare-fun m!874681 () Bool)

(assert (=> d!113869 m!874681))

(declare-fun m!874683 () Bool)

(assert (=> d!113869 m!874683))

(declare-fun m!874685 () Bool)

(assert (=> b!938980 m!874685))

(declare-fun m!874687 () Bool)

(assert (=> b!938981 m!874687))

(assert (=> b!938648 d!113869))

(declare-fun b!938982 () Bool)

(assert (=> b!938982 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27634 _keys!1487)))))

(assert (=> b!938982 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27635 _values!1231)))))

(declare-fun lt!424193 () ListLongMap!12079)

(declare-fun e!527381 () Bool)

(assert (=> b!938982 (= e!527381 (= (apply!856 lt!424193 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14335 (select (arr!27176 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!938983 () Bool)

(declare-fun e!527380 () ListLongMap!12079)

(declare-fun call!40894 () ListLongMap!12079)

(assert (=> b!938983 (= e!527380 call!40894)))

(declare-fun bm!40891 () Bool)

(assert (=> bm!40891 (= call!40894 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!938984 () Bool)

(declare-fun e!527377 () Bool)

(assert (=> b!938984 (= e!527377 (= lt!424193 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!938985 () Bool)

(assert (=> b!938985 (= e!527377 (isEmpty!698 lt!424193))))

(declare-fun d!113871 () Bool)

(declare-fun e!527376 () Bool)

(assert (=> d!113871 e!527376))

(declare-fun res!631641 () Bool)

(assert (=> d!113871 (=> (not res!631641) (not e!527376))))

(assert (=> d!113871 (= res!631641 (not (contains!5115 lt!424193 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!527382 () ListLongMap!12079)

(assert (=> d!113871 (= lt!424193 e!527382)))

(declare-fun c!97936 () Bool)

(assert (=> d!113871 (= c!97936 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27634 _keys!1487)))))

(assert (=> d!113871 (validMask!0 mask!1881)))

(assert (=> d!113871 (= (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!424193)))

(declare-fun b!938986 () Bool)

(declare-fun e!527378 () Bool)

(assert (=> b!938986 (= e!527378 e!527377)))

(declare-fun c!97937 () Bool)

(assert (=> b!938986 (= c!97937 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27634 _keys!1487)))))

(declare-fun b!938987 () Bool)

(declare-fun e!527379 () Bool)

(assert (=> b!938987 (= e!527379 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!938987 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000)))

(declare-fun b!938988 () Bool)

(assert (=> b!938988 (= e!527376 e!527378)))

(declare-fun c!97934 () Bool)

(assert (=> b!938988 (= c!97934 e!527379)))

(declare-fun res!631640 () Bool)

(assert (=> b!938988 (=> (not res!631640) (not e!527379))))

(assert (=> b!938988 (= res!631640 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27634 _keys!1487)))))

(declare-fun b!938989 () Bool)

(assert (=> b!938989 (= e!527382 (ListLongMap!12080 Nil!19156))))

(declare-fun b!938990 () Bool)

(declare-fun res!631642 () Bool)

(assert (=> b!938990 (=> (not res!631642) (not e!527376))))

(assert (=> b!938990 (= res!631642 (not (contains!5115 lt!424193 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!938991 () Bool)

(assert (=> b!938991 (= e!527382 e!527380)))

(declare-fun c!97935 () Bool)

(assert (=> b!938991 (= c!97935 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!938992 () Bool)

(declare-fun lt!424188 () Unit!31700)

(declare-fun lt!424189 () Unit!31700)

(assert (=> b!938992 (= lt!424188 lt!424189)))

(declare-fun lt!424190 () (_ BitVec 64))

(declare-fun lt!424191 () (_ BitVec 64))

(declare-fun lt!424192 () V!31985)

(declare-fun lt!424194 () ListLongMap!12079)

(assert (=> b!938992 (not (contains!5115 (+!2842 lt!424194 (tuple2!13383 lt!424190 lt!424192)) lt!424191))))

(assert (=> b!938992 (= lt!424189 (addStillNotContains!221 lt!424194 lt!424190 lt!424192 lt!424191))))

(assert (=> b!938992 (= lt!424191 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!938992 (= lt!424192 (get!14335 (select (arr!27176 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!938992 (= lt!424190 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938992 (= lt!424194 call!40894)))

(assert (=> b!938992 (= e!527380 (+!2842 call!40894 (tuple2!13383 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (get!14335 (select (arr!27176 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!938993 () Bool)

(assert (=> b!938993 (= e!527378 e!527381)))

(assert (=> b!938993 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27634 _keys!1487)))))

(declare-fun res!631639 () Bool)

(assert (=> b!938993 (= res!631639 (contains!5115 lt!424193 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!938993 (=> (not res!631639) (not e!527381))))

(assert (= (and d!113871 c!97936) b!938989))

(assert (= (and d!113871 (not c!97936)) b!938991))

(assert (= (and b!938991 c!97935) b!938992))

(assert (= (and b!938991 (not c!97935)) b!938983))

(assert (= (or b!938992 b!938983) bm!40891))

(assert (= (and d!113871 res!631641) b!938990))

(assert (= (and b!938990 res!631642) b!938988))

(assert (= (and b!938988 res!631640) b!938987))

(assert (= (and b!938988 c!97934) b!938993))

(assert (= (and b!938988 (not c!97934)) b!938986))

(assert (= (and b!938993 res!631639) b!938982))

(assert (= (and b!938986 c!97937) b!938984))

(assert (= (and b!938986 (not c!97937)) b!938985))

(declare-fun b_lambda!14243 () Bool)

(assert (=> (not b_lambda!14243) (not b!938982)))

(assert (=> b!938982 t!27459))

(declare-fun b_and!29153 () Bool)

(assert (= b_and!29151 (and (=> t!27459 result!12137) b_and!29153)))

(declare-fun b_lambda!14245 () Bool)

(assert (=> (not b_lambda!14245) (not b!938992)))

(assert (=> b!938992 t!27459))

(declare-fun b_and!29155 () Bool)

(assert (= b_and!29153 (and (=> t!27459 result!12137) b_and!29155)))

(declare-fun m!874689 () Bool)

(assert (=> d!113871 m!874689))

(assert (=> d!113871 m!873795))

(declare-fun m!874691 () Bool)

(assert (=> b!938992 m!874691))

(assert (=> b!938992 m!873771))

(assert (=> b!938992 m!874033))

(assert (=> b!938992 m!873771))

(assert (=> b!938992 m!874035))

(declare-fun m!874693 () Bool)

(assert (=> b!938992 m!874693))

(declare-fun m!874695 () Bool)

(assert (=> b!938992 m!874695))

(assert (=> b!938992 m!874033))

(assert (=> b!938992 m!874693))

(declare-fun m!874697 () Bool)

(assert (=> b!938992 m!874697))

(assert (=> b!938992 m!873983))

(assert (=> b!938991 m!873983))

(assert (=> b!938991 m!873983))

(assert (=> b!938991 m!873993))

(declare-fun m!874699 () Bool)

(assert (=> b!938985 m!874699))

(declare-fun m!874701 () Bool)

(assert (=> b!938984 m!874701))

(assert (=> b!938982 m!873983))

(declare-fun m!874703 () Bool)

(assert (=> b!938982 m!874703))

(assert (=> b!938982 m!873983))

(assert (=> b!938982 m!873771))

(assert (=> b!938982 m!874033))

(assert (=> b!938982 m!873771))

(assert (=> b!938982 m!874035))

(assert (=> b!938982 m!874033))

(assert (=> bm!40891 m!874701))

(assert (=> b!938993 m!873983))

(assert (=> b!938993 m!873983))

(declare-fun m!874705 () Bool)

(assert (=> b!938993 m!874705))

(assert (=> b!938987 m!873983))

(assert (=> b!938987 m!873983))

(assert (=> b!938987 m!873993))

(declare-fun m!874707 () Bool)

(assert (=> b!938990 m!874707))

(assert (=> b!938648 d!113871))

(declare-fun d!113873 () Bool)

(declare-fun e!527383 () Bool)

(assert (=> d!113873 e!527383))

(declare-fun res!631643 () Bool)

(assert (=> d!113873 (=> (not res!631643) (not e!527383))))

(declare-fun lt!424197 () ListLongMap!12079)

(assert (=> d!113873 (= res!631643 (contains!5115 lt!424197 (_1!6702 (tuple2!13383 lt!423955 minValue!1173))))))

(declare-fun lt!424195 () List!19159)

(assert (=> d!113873 (= lt!424197 (ListLongMap!12080 lt!424195))))

(declare-fun lt!424196 () Unit!31700)

(declare-fun lt!424198 () Unit!31700)

(assert (=> d!113873 (= lt!424196 lt!424198)))

(assert (=> d!113873 (= (getValueByKey!484 lt!424195 (_1!6702 (tuple2!13383 lt!423955 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423955 minValue!1173))))))

(assert (=> d!113873 (= lt!424198 (lemmaContainsTupThenGetReturnValue!260 lt!424195 (_1!6702 (tuple2!13383 lt!423955 minValue!1173)) (_2!6702 (tuple2!13383 lt!423955 minValue!1173))))))

(assert (=> d!113873 (= lt!424195 (insertStrictlySorted!317 (toList!6055 lt!423945) (_1!6702 (tuple2!13383 lt!423955 minValue!1173)) (_2!6702 (tuple2!13383 lt!423955 minValue!1173))))))

(assert (=> d!113873 (= (+!2842 lt!423945 (tuple2!13383 lt!423955 minValue!1173)) lt!424197)))

(declare-fun b!938994 () Bool)

(declare-fun res!631644 () Bool)

(assert (=> b!938994 (=> (not res!631644) (not e!527383))))

(assert (=> b!938994 (= res!631644 (= (getValueByKey!484 (toList!6055 lt!424197) (_1!6702 (tuple2!13383 lt!423955 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423955 minValue!1173)))))))

(declare-fun b!938995 () Bool)

(assert (=> b!938995 (= e!527383 (contains!5118 (toList!6055 lt!424197) (tuple2!13383 lt!423955 minValue!1173)))))

(assert (= (and d!113873 res!631643) b!938994))

(assert (= (and b!938994 res!631644) b!938995))

(declare-fun m!874709 () Bool)

(assert (=> d!113873 m!874709))

(declare-fun m!874711 () Bool)

(assert (=> d!113873 m!874711))

(declare-fun m!874713 () Bool)

(assert (=> d!113873 m!874713))

(declare-fun m!874715 () Bool)

(assert (=> d!113873 m!874715))

(declare-fun m!874717 () Bool)

(assert (=> b!938994 m!874717))

(declare-fun m!874719 () Bool)

(assert (=> b!938995 m!874719))

(assert (=> b!938648 d!113873))

(declare-fun d!113875 () Bool)

(assert (=> d!113875 (= (apply!856 (+!2842 lt!423950 (tuple2!13383 lt!423937 zeroValue!1173)) lt!423953) (get!14337 (getValueByKey!484 (toList!6055 (+!2842 lt!423950 (tuple2!13383 lt!423937 zeroValue!1173))) lt!423953)))))

(declare-fun bs!26382 () Bool)

(assert (= bs!26382 d!113875))

(declare-fun m!874721 () Bool)

(assert (=> bs!26382 m!874721))

(assert (=> bs!26382 m!874721))

(declare-fun m!874723 () Bool)

(assert (=> bs!26382 m!874723))

(assert (=> b!938648 d!113875))

(declare-fun d!113877 () Bool)

(assert (=> d!113877 (= (apply!856 (+!2842 lt!423945 (tuple2!13383 lt!423955 minValue!1173)) lt!423943) (get!14337 (getValueByKey!484 (toList!6055 (+!2842 lt!423945 (tuple2!13383 lt!423955 minValue!1173))) lt!423943)))))

(declare-fun bs!26383 () Bool)

(assert (= bs!26383 d!113877))

(declare-fun m!874725 () Bool)

(assert (=> bs!26383 m!874725))

(assert (=> bs!26383 m!874725))

(declare-fun m!874727 () Bool)

(assert (=> bs!26383 m!874727))

(assert (=> b!938648 d!113877))

(declare-fun d!113879 () Bool)

(declare-fun e!527384 () Bool)

(assert (=> d!113879 e!527384))

(declare-fun res!631645 () Bool)

(assert (=> d!113879 (=> (not res!631645) (not e!527384))))

(declare-fun lt!424201 () ListLongMap!12079)

(assert (=> d!113879 (= res!631645 (contains!5115 lt!424201 (_1!6702 (tuple2!13383 lt!423946 minValue!1173))))))

(declare-fun lt!424199 () List!19159)

(assert (=> d!113879 (= lt!424201 (ListLongMap!12080 lt!424199))))

(declare-fun lt!424200 () Unit!31700)

(declare-fun lt!424202 () Unit!31700)

(assert (=> d!113879 (= lt!424200 lt!424202)))

(assert (=> d!113879 (= (getValueByKey!484 lt!424199 (_1!6702 (tuple2!13383 lt!423946 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423946 minValue!1173))))))

(assert (=> d!113879 (= lt!424202 (lemmaContainsTupThenGetReturnValue!260 lt!424199 (_1!6702 (tuple2!13383 lt!423946 minValue!1173)) (_2!6702 (tuple2!13383 lt!423946 minValue!1173))))))

(assert (=> d!113879 (= lt!424199 (insertStrictlySorted!317 (toList!6055 lt!423948) (_1!6702 (tuple2!13383 lt!423946 minValue!1173)) (_2!6702 (tuple2!13383 lt!423946 minValue!1173))))))

(assert (=> d!113879 (= (+!2842 lt!423948 (tuple2!13383 lt!423946 minValue!1173)) lt!424201)))

(declare-fun b!938996 () Bool)

(declare-fun res!631646 () Bool)

(assert (=> b!938996 (=> (not res!631646) (not e!527384))))

(assert (=> b!938996 (= res!631646 (= (getValueByKey!484 (toList!6055 lt!424201) (_1!6702 (tuple2!13383 lt!423946 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423946 minValue!1173)))))))

(declare-fun b!938997 () Bool)

(assert (=> b!938997 (= e!527384 (contains!5118 (toList!6055 lt!424201) (tuple2!13383 lt!423946 minValue!1173)))))

(assert (= (and d!113879 res!631645) b!938996))

(assert (= (and b!938996 res!631646) b!938997))

(declare-fun m!874729 () Bool)

(assert (=> d!113879 m!874729))

(declare-fun m!874731 () Bool)

(assert (=> d!113879 m!874731))

(declare-fun m!874733 () Bool)

(assert (=> d!113879 m!874733))

(declare-fun m!874735 () Bool)

(assert (=> d!113879 m!874735))

(declare-fun m!874737 () Bool)

(assert (=> b!938996 m!874737))

(declare-fun m!874739 () Bool)

(assert (=> b!938997 m!874739))

(assert (=> b!938648 d!113879))

(declare-fun d!113881 () Bool)

(assert (=> d!113881 (= (apply!856 (+!2842 lt!423948 (tuple2!13383 lt!423946 minValue!1173)) lt!423951) (apply!856 lt!423948 lt!423951))))

(declare-fun lt!424203 () Unit!31700)

(assert (=> d!113881 (= lt!424203 (choose!1561 lt!423948 lt!423946 minValue!1173 lt!423951))))

(declare-fun e!527385 () Bool)

(assert (=> d!113881 e!527385))

(declare-fun res!631647 () Bool)

(assert (=> d!113881 (=> (not res!631647) (not e!527385))))

(assert (=> d!113881 (= res!631647 (contains!5115 lt!423948 lt!423951))))

(assert (=> d!113881 (= (addApplyDifferent!441 lt!423948 lt!423946 minValue!1173 lt!423951) lt!424203)))

(declare-fun b!938998 () Bool)

(assert (=> b!938998 (= e!527385 (not (= lt!423951 lt!423946)))))

(assert (= (and d!113881 res!631647) b!938998))

(assert (=> d!113881 m!874031))

(declare-fun m!874741 () Bool)

(assert (=> d!113881 m!874741))

(assert (=> d!113881 m!874021))

(assert (=> d!113881 m!874021))

(assert (=> d!113881 m!874023))

(declare-fun m!874743 () Bool)

(assert (=> d!113881 m!874743))

(assert (=> b!938648 d!113881))

(declare-fun d!113883 () Bool)

(assert (=> d!113883 (= (apply!856 lt!423945 lt!423943) (get!14337 (getValueByKey!484 (toList!6055 lt!423945) lt!423943)))))

(declare-fun bs!26384 () Bool)

(assert (= bs!26384 d!113883))

(declare-fun m!874745 () Bool)

(assert (=> bs!26384 m!874745))

(assert (=> bs!26384 m!874745))

(declare-fun m!874747 () Bool)

(assert (=> bs!26384 m!874747))

(assert (=> b!938648 d!113883))

(declare-fun d!113885 () Bool)

(assert (=> d!113885 (= (apply!856 (+!2842 lt!423950 (tuple2!13383 lt!423937 zeroValue!1173)) lt!423953) (apply!856 lt!423950 lt!423953))))

(declare-fun lt!424204 () Unit!31700)

(assert (=> d!113885 (= lt!424204 (choose!1561 lt!423950 lt!423937 zeroValue!1173 lt!423953))))

(declare-fun e!527386 () Bool)

(assert (=> d!113885 e!527386))

(declare-fun res!631648 () Bool)

(assert (=> d!113885 (=> (not res!631648) (not e!527386))))

(assert (=> d!113885 (= res!631648 (contains!5115 lt!423950 lt!423953))))

(assert (=> d!113885 (= (addApplyDifferent!441 lt!423950 lt!423937 zeroValue!1173 lt!423953) lt!424204)))

(declare-fun b!938999 () Bool)

(assert (=> b!938999 (= e!527386 (not (= lt!423953 lt!423937)))))

(assert (= (and d!113885 res!631648) b!938999))

(assert (=> d!113885 m!874029))

(declare-fun m!874749 () Bool)

(assert (=> d!113885 m!874749))

(assert (=> d!113885 m!874003))

(assert (=> d!113885 m!874003))

(assert (=> d!113885 m!874005))

(declare-fun m!874751 () Bool)

(assert (=> d!113885 m!874751))

(assert (=> b!938648 d!113885))

(assert (=> b!938531 d!113721))

(declare-fun d!113887 () Bool)

(assert (=> d!113887 (= (apply!856 lt!423886 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14337 (getValueByKey!484 (toList!6055 lt!423886) (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun bs!26385 () Bool)

(assert (= bs!26385 d!113887))

(assert (=> bs!26385 m!873757))

(assert (=> bs!26385 m!874547))

(assert (=> bs!26385 m!874547))

(declare-fun m!874753 () Bool)

(assert (=> bs!26385 m!874753))

(assert (=> b!938579 d!113887))

(assert (=> b!938579 d!113661))

(declare-fun b!939000 () Bool)

(declare-fun e!527390 () Bool)

(declare-fun call!40895 () Bool)

(assert (=> b!939000 (= e!527390 call!40895)))

(declare-fun b!939001 () Bool)

(declare-fun e!527387 () Bool)

(assert (=> b!939001 (= e!527387 (contains!5117 (ite c!97811 (Cons!19156 (select (arr!27175 _keys!1487) #b00000000000000000000000000000000) Nil!19157) Nil!19157) (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!939002 () Bool)

(assert (=> b!939002 (= e!527390 call!40895)))

(declare-fun d!113889 () Bool)

(declare-fun res!631649 () Bool)

(declare-fun e!527389 () Bool)

(assert (=> d!113889 (=> res!631649 e!527389)))

(assert (=> d!113889 (= res!631649 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(assert (=> d!113889 (= (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97811 (Cons!19156 (select (arr!27175 _keys!1487) #b00000000000000000000000000000000) Nil!19157) Nil!19157)) e!527389)))

(declare-fun c!97938 () Bool)

(declare-fun bm!40892 () Bool)

(assert (=> bm!40892 (= call!40895 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!97938 (Cons!19156 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!97811 (Cons!19156 (select (arr!27175 _keys!1487) #b00000000000000000000000000000000) Nil!19157) Nil!19157)) (ite c!97811 (Cons!19156 (select (arr!27175 _keys!1487) #b00000000000000000000000000000000) Nil!19157) Nil!19157))))))

(declare-fun b!939003 () Bool)

(declare-fun e!527388 () Bool)

(assert (=> b!939003 (= e!527388 e!527390)))

(assert (=> b!939003 (= c!97938 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!939004 () Bool)

(assert (=> b!939004 (= e!527389 e!527388)))

(declare-fun res!631650 () Bool)

(assert (=> b!939004 (=> (not res!631650) (not e!527388))))

(assert (=> b!939004 (= res!631650 (not e!527387))))

(declare-fun res!631651 () Bool)

(assert (=> b!939004 (=> (not res!631651) (not e!527387))))

(assert (=> b!939004 (= res!631651 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!113889 (not res!631649)) b!939004))

(assert (= (and b!939004 res!631651) b!939001))

(assert (= (and b!939004 res!631650) b!939003))

(assert (= (and b!939003 c!97938) b!939002))

(assert (= (and b!939003 (not c!97938)) b!939000))

(assert (= (or b!939002 b!939000) bm!40892))

(assert (=> b!939001 m!874553))

(assert (=> b!939001 m!874553))

(declare-fun m!874755 () Bool)

(assert (=> b!939001 m!874755))

(assert (=> bm!40892 m!874553))

(declare-fun m!874757 () Bool)

(assert (=> bm!40892 m!874757))

(assert (=> b!939003 m!874553))

(assert (=> b!939003 m!874553))

(assert (=> b!939003 m!874561))

(assert (=> b!939004 m!874553))

(assert (=> b!939004 m!874553))

(assert (=> b!939004 m!874561))

(assert (=> bm!40827 d!113889))

(assert (=> bm!40850 d!113871))

(declare-fun d!113891 () Bool)

(assert (=> d!113891 (= (isDefined!356 (getValueByKey!484 (toList!6055 lt!423776) k0!1099)) (not (isEmpty!699 (getValueByKey!484 (toList!6055 lt!423776) k0!1099))))))

(declare-fun bs!26386 () Bool)

(assert (= bs!26386 d!113891))

(assert (=> bs!26386 m!874063))

(declare-fun m!874759 () Bool)

(assert (=> bs!26386 m!874759))

(assert (=> b!938660 d!113891))

(declare-fun b!939005 () Bool)

(declare-fun e!527391 () Option!490)

(assert (=> b!939005 (= e!527391 (Some!489 (_2!6702 (h!20301 (toList!6055 lt!423776)))))))

(declare-fun b!939006 () Bool)

(declare-fun e!527392 () Option!490)

(assert (=> b!939006 (= e!527391 e!527392)))

(declare-fun c!97940 () Bool)

(assert (=> b!939006 (= c!97940 (and ((_ is Cons!19155) (toList!6055 lt!423776)) (not (= (_1!6702 (h!20301 (toList!6055 lt!423776))) k0!1099))))))

(declare-fun b!939008 () Bool)

(assert (=> b!939008 (= e!527392 None!488)))

(declare-fun d!113893 () Bool)

(declare-fun c!97939 () Bool)

(assert (=> d!113893 (= c!97939 (and ((_ is Cons!19155) (toList!6055 lt!423776)) (= (_1!6702 (h!20301 (toList!6055 lt!423776))) k0!1099)))))

(assert (=> d!113893 (= (getValueByKey!484 (toList!6055 lt!423776) k0!1099) e!527391)))

(declare-fun b!939007 () Bool)

(assert (=> b!939007 (= e!527392 (getValueByKey!484 (t!27460 (toList!6055 lt!423776)) k0!1099))))

(assert (= (and d!113893 c!97939) b!939005))

(assert (= (and d!113893 (not c!97939)) b!939006))

(assert (= (and b!939006 c!97940) b!939007))

(assert (= (and b!939006 (not c!97940)) b!939008))

(declare-fun m!874761 () Bool)

(assert (=> b!939007 m!874761))

(assert (=> b!938660 d!113893))

(declare-fun d!113895 () Bool)

(declare-fun e!527394 () Bool)

(assert (=> d!113895 e!527394))

(declare-fun res!631652 () Bool)

(assert (=> d!113895 (=> res!631652 e!527394)))

(declare-fun lt!424206 () Bool)

(assert (=> d!113895 (= res!631652 (not lt!424206))))

(declare-fun lt!424208 () Bool)

(assert (=> d!113895 (= lt!424206 lt!424208)))

(declare-fun lt!424207 () Unit!31700)

(declare-fun e!527393 () Unit!31700)

(assert (=> d!113895 (= lt!424207 e!527393)))

(declare-fun c!97941 () Bool)

(assert (=> d!113895 (= c!97941 lt!424208)))

(assert (=> d!113895 (= lt!424208 (containsKey!451 (toList!6055 lt!423993) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113895 (= (contains!5115 lt!423993 #b0000000000000000000000000000000000000000000000000000000000000000) lt!424206)))

(declare-fun b!939009 () Bool)

(declare-fun lt!424205 () Unit!31700)

(assert (=> b!939009 (= e!527393 lt!424205)))

(assert (=> b!939009 (= lt!424205 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423993) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!939009 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423993) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939010 () Bool)

(declare-fun Unit!31726 () Unit!31700)

(assert (=> b!939010 (= e!527393 Unit!31726)))

(declare-fun b!939011 () Bool)

(assert (=> b!939011 (= e!527394 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423993) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113895 c!97941) b!939009))

(assert (= (and d!113895 (not c!97941)) b!939010))

(assert (= (and d!113895 (not res!631652)) b!939011))

(declare-fun m!874763 () Bool)

(assert (=> d!113895 m!874763))

(declare-fun m!874765 () Bool)

(assert (=> b!939009 m!874765))

(assert (=> b!939009 m!874569))

(assert (=> b!939009 m!874569))

(declare-fun m!874767 () Bool)

(assert (=> b!939009 m!874767))

(assert (=> b!939011 m!874569))

(assert (=> b!939011 m!874569))

(assert (=> b!939011 m!874767))

(assert (=> bm!40861 d!113895))

(declare-fun d!113897 () Bool)

(declare-fun e!527396 () Bool)

(assert (=> d!113897 e!527396))

(declare-fun res!631653 () Bool)

(assert (=> d!113897 (=> res!631653 e!527396)))

(declare-fun lt!424210 () Bool)

(assert (=> d!113897 (= res!631653 (not lt!424210))))

(declare-fun lt!424212 () Bool)

(assert (=> d!113897 (= lt!424210 lt!424212)))

(declare-fun lt!424211 () Unit!31700)

(declare-fun e!527395 () Unit!31700)

(assert (=> d!113897 (= lt!424211 e!527395)))

(declare-fun c!97942 () Bool)

(assert (=> d!113897 (= c!97942 lt!424212)))

(assert (=> d!113897 (= lt!424212 (containsKey!451 (toList!6055 lt!423944) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113897 (= (contains!5115 lt!423944 #b1000000000000000000000000000000000000000000000000000000000000000) lt!424210)))

(declare-fun b!939012 () Bool)

(declare-fun lt!424209 () Unit!31700)

(assert (=> b!939012 (= e!527395 lt!424209)))

(assert (=> b!939012 (= lt!424209 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423944) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!939012 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423944) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!939013 () Bool)

(declare-fun Unit!31727 () Unit!31700)

(assert (=> b!939013 (= e!527395 Unit!31727)))

(declare-fun b!939014 () Bool)

(assert (=> b!939014 (= e!527396 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423944) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113897 c!97942) b!939012))

(assert (= (and d!113897 (not c!97942)) b!939013))

(assert (= (and d!113897 (not res!631653)) b!939014))

(declare-fun m!874769 () Bool)

(assert (=> d!113897 m!874769))

(declare-fun m!874771 () Bool)

(assert (=> b!939012 m!874771))

(assert (=> b!939012 m!874399))

(assert (=> b!939012 m!874399))

(declare-fun m!874773 () Bool)

(assert (=> b!939012 m!874773))

(assert (=> b!939014 m!874399))

(assert (=> b!939014 m!874399))

(assert (=> b!939014 m!874773))

(assert (=> bm!40854 d!113897))

(assert (=> d!113683 d!113671))

(declare-fun d!113899 () Bool)

(declare-fun res!631654 () Bool)

(declare-fun e!527397 () Bool)

(assert (=> d!113899 (=> res!631654 e!527397)))

(assert (=> d!113899 (= res!631654 (and ((_ is Cons!19155) (toList!6055 lt!423783)) (= (_1!6702 (h!20301 (toList!6055 lt!423783))) k0!1099)))))

(assert (=> d!113899 (= (containsKey!451 (toList!6055 lt!423783) k0!1099) e!527397)))

(declare-fun b!939015 () Bool)

(declare-fun e!527398 () Bool)

(assert (=> b!939015 (= e!527397 e!527398)))

(declare-fun res!631655 () Bool)

(assert (=> b!939015 (=> (not res!631655) (not e!527398))))

(assert (=> b!939015 (= res!631655 (and (or (not ((_ is Cons!19155) (toList!6055 lt!423783))) (bvsle (_1!6702 (h!20301 (toList!6055 lt!423783))) k0!1099)) ((_ is Cons!19155) (toList!6055 lt!423783)) (bvslt (_1!6702 (h!20301 (toList!6055 lt!423783))) k0!1099)))))

(declare-fun b!939016 () Bool)

(assert (=> b!939016 (= e!527398 (containsKey!451 (t!27460 (toList!6055 lt!423783)) k0!1099))))

(assert (= (and d!113899 (not res!631654)) b!939015))

(assert (= (and b!939015 res!631655) b!939016))

(declare-fun m!874775 () Bool)

(assert (=> b!939016 m!874775))

(assert (=> d!113681 d!113899))

(declare-fun d!113901 () Bool)

(assert (=> d!113901 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423776) k0!1099))))

(declare-fun lt!424213 () Unit!31700)

(assert (=> d!113901 (= lt!424213 (choose!1564 (toList!6055 lt!423776) k0!1099))))

(declare-fun e!527399 () Bool)

(assert (=> d!113901 e!527399))

(declare-fun res!631656 () Bool)

(assert (=> d!113901 (=> (not res!631656) (not e!527399))))

(assert (=> d!113901 (= res!631656 (isStrictlySorted!504 (toList!6055 lt!423776)))))

(assert (=> d!113901 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423776) k0!1099) lt!424213)))

(declare-fun b!939017 () Bool)

(assert (=> b!939017 (= e!527399 (containsKey!451 (toList!6055 lt!423776) k0!1099))))

(assert (= (and d!113901 res!631656) b!939017))

(assert (=> d!113901 m!874063))

(assert (=> d!113901 m!874063))

(assert (=> d!113901 m!874065))

(declare-fun m!874777 () Bool)

(assert (=> d!113901 m!874777))

(declare-fun m!874779 () Bool)

(assert (=> d!113901 m!874779))

(assert (=> b!939017 m!874059))

(assert (=> b!938658 d!113901))

(assert (=> b!938658 d!113891))

(assert (=> b!938658 d!113893))

(declare-fun b!939018 () Bool)

(assert (=> b!939018 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(assert (=> b!939018 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27635 _values!1231)))))

(declare-fun e!527405 () Bool)

(declare-fun lt!424219 () ListLongMap!12079)

(assert (=> b!939018 (= e!527405 (= (apply!856 lt!424219 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!939019 () Bool)

(declare-fun e!527404 () ListLongMap!12079)

(declare-fun call!40896 () ListLongMap!12079)

(assert (=> b!939019 (= e!527404 call!40896)))

(declare-fun bm!40893 () Bool)

(assert (=> bm!40893 (= call!40896 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!527401 () Bool)

(declare-fun b!939020 () Bool)

(assert (=> b!939020 (= e!527401 (= lt!424219 (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!939021 () Bool)

(assert (=> b!939021 (= e!527401 (isEmpty!698 lt!424219))))

(declare-fun d!113903 () Bool)

(declare-fun e!527400 () Bool)

(assert (=> d!113903 e!527400))

(declare-fun res!631659 () Bool)

(assert (=> d!113903 (=> (not res!631659) (not e!527400))))

(assert (=> d!113903 (= res!631659 (not (contains!5115 lt!424219 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!527406 () ListLongMap!12079)

(assert (=> d!113903 (= lt!424219 e!527406)))

(declare-fun c!97945 () Bool)

(assert (=> d!113903 (= c!97945 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(assert (=> d!113903 (validMask!0 mask!1881)))

(assert (=> d!113903 (= (getCurrentListMapNoExtraKeys!3304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!424219)))

(declare-fun b!939022 () Bool)

(declare-fun e!527402 () Bool)

(assert (=> b!939022 (= e!527402 e!527401)))

(declare-fun c!97946 () Bool)

(assert (=> b!939022 (= c!97946 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(declare-fun b!939023 () Bool)

(declare-fun e!527403 () Bool)

(assert (=> b!939023 (= e!527403 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!939023 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!939024 () Bool)

(assert (=> b!939024 (= e!527400 e!527402)))

(declare-fun c!97943 () Bool)

(assert (=> b!939024 (= c!97943 e!527403)))

(declare-fun res!631658 () Bool)

(assert (=> b!939024 (=> (not res!631658) (not e!527403))))

(assert (=> b!939024 (= res!631658 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(declare-fun b!939025 () Bool)

(assert (=> b!939025 (= e!527406 (ListLongMap!12080 Nil!19156))))

(declare-fun b!939026 () Bool)

(declare-fun res!631660 () Bool)

(assert (=> b!939026 (=> (not res!631660) (not e!527400))))

(assert (=> b!939026 (= res!631660 (not (contains!5115 lt!424219 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!939027 () Bool)

(assert (=> b!939027 (= e!527406 e!527404)))

(declare-fun c!97944 () Bool)

(assert (=> b!939027 (= c!97944 (validKeyInArray!0 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!939028 () Bool)

(declare-fun lt!424214 () Unit!31700)

(declare-fun lt!424215 () Unit!31700)

(assert (=> b!939028 (= lt!424214 lt!424215)))

(declare-fun lt!424217 () (_ BitVec 64))

(declare-fun lt!424218 () V!31985)

(declare-fun lt!424216 () (_ BitVec 64))

(declare-fun lt!424220 () ListLongMap!12079)

(assert (=> b!939028 (not (contains!5115 (+!2842 lt!424220 (tuple2!13383 lt!424216 lt!424218)) lt!424217))))

(assert (=> b!939028 (= lt!424215 (addStillNotContains!221 lt!424220 lt!424216 lt!424218 lt!424217))))

(assert (=> b!939028 (= lt!424217 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!939028 (= lt!424218 (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!939028 (= lt!424216 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!939028 (= lt!424220 call!40896)))

(assert (=> b!939028 (= e!527404 (+!2842 call!40896 (tuple2!13383 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14335 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1631 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!939029 () Bool)

(assert (=> b!939029 (= e!527402 e!527405)))

(assert (=> b!939029 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27634 _keys!1487)))))

(declare-fun res!631657 () Bool)

(assert (=> b!939029 (= res!631657 (contains!5115 lt!424219 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!939029 (=> (not res!631657) (not e!527405))))

(assert (= (and d!113903 c!97945) b!939025))

(assert (= (and d!113903 (not c!97945)) b!939027))

(assert (= (and b!939027 c!97944) b!939028))

(assert (= (and b!939027 (not c!97944)) b!939019))

(assert (= (or b!939028 b!939019) bm!40893))

(assert (= (and d!113903 res!631659) b!939026))

(assert (= (and b!939026 res!631660) b!939024))

(assert (= (and b!939024 res!631658) b!939023))

(assert (= (and b!939024 c!97943) b!939029))

(assert (= (and b!939024 (not c!97943)) b!939022))

(assert (= (and b!939029 res!631657) b!939018))

(assert (= (and b!939022 c!97946) b!939020))

(assert (= (and b!939022 (not c!97946)) b!939021))

(declare-fun b_lambda!14247 () Bool)

(assert (=> (not b_lambda!14247) (not b!939018)))

(assert (=> b!939018 t!27459))

(declare-fun b_and!29157 () Bool)

(assert (= b_and!29155 (and (=> t!27459 result!12137) b_and!29157)))

(declare-fun b_lambda!14249 () Bool)

(assert (=> (not b_lambda!14249) (not b!939028)))

(assert (=> b!939028 t!27459))

(declare-fun b_and!29159 () Bool)

(assert (= b_and!29157 (and (=> t!27459 result!12137) b_and!29159)))

(declare-fun m!874781 () Bool)

(assert (=> d!113903 m!874781))

(assert (=> d!113903 m!873795))

(declare-fun m!874783 () Bool)

(assert (=> b!939028 m!874783))

(assert (=> b!939028 m!873771))

(assert (=> b!939028 m!873767))

(assert (=> b!939028 m!873771))

(assert (=> b!939028 m!873777))

(declare-fun m!874785 () Bool)

(assert (=> b!939028 m!874785))

(declare-fun m!874787 () Bool)

(assert (=> b!939028 m!874787))

(assert (=> b!939028 m!873767))

(assert (=> b!939028 m!874785))

(declare-fun m!874789 () Bool)

(assert (=> b!939028 m!874789))

(assert (=> b!939028 m!873757))

(assert (=> b!939027 m!873757))

(assert (=> b!939027 m!873757))

(assert (=> b!939027 m!873897))

(declare-fun m!874791 () Bool)

(assert (=> b!939021 m!874791))

(assert (=> b!939020 m!874291))

(assert (=> b!939018 m!873757))

(declare-fun m!874793 () Bool)

(assert (=> b!939018 m!874793))

(assert (=> b!939018 m!873757))

(assert (=> b!939018 m!873771))

(assert (=> b!939018 m!873767))

(assert (=> b!939018 m!873771))

(assert (=> b!939018 m!873777))

(assert (=> b!939018 m!873767))

(assert (=> bm!40893 m!874291))

(assert (=> b!939029 m!873757))

(assert (=> b!939029 m!873757))

(declare-fun m!874795 () Bool)

(assert (=> b!939029 m!874795))

(assert (=> b!939023 m!873757))

(assert (=> b!939023 m!873757))

(assert (=> b!939023 m!873897))

(declare-fun m!874797 () Bool)

(assert (=> b!939026 m!874797))

(assert (=> b!938593 d!113903))

(declare-fun d!113905 () Bool)

(declare-fun e!527407 () Bool)

(assert (=> d!113905 e!527407))

(declare-fun res!631661 () Bool)

(assert (=> d!113905 (=> (not res!631661) (not e!527407))))

(declare-fun lt!424223 () ListLongMap!12079)

(assert (=> d!113905 (= res!631661 (contains!5115 lt!424223 (_1!6702 (tuple2!13383 lt!423888 minValue!1173))))))

(declare-fun lt!424221 () List!19159)

(assert (=> d!113905 (= lt!424223 (ListLongMap!12080 lt!424221))))

(declare-fun lt!424222 () Unit!31700)

(declare-fun lt!424224 () Unit!31700)

(assert (=> d!113905 (= lt!424222 lt!424224)))

(assert (=> d!113905 (= (getValueByKey!484 lt!424221 (_1!6702 (tuple2!13383 lt!423888 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423888 minValue!1173))))))

(assert (=> d!113905 (= lt!424224 (lemmaContainsTupThenGetReturnValue!260 lt!424221 (_1!6702 (tuple2!13383 lt!423888 minValue!1173)) (_2!6702 (tuple2!13383 lt!423888 minValue!1173))))))

(assert (=> d!113905 (= lt!424221 (insertStrictlySorted!317 (toList!6055 lt!423890) (_1!6702 (tuple2!13383 lt!423888 minValue!1173)) (_2!6702 (tuple2!13383 lt!423888 minValue!1173))))))

(assert (=> d!113905 (= (+!2842 lt!423890 (tuple2!13383 lt!423888 minValue!1173)) lt!424223)))

(declare-fun b!939030 () Bool)

(declare-fun res!631662 () Bool)

(assert (=> b!939030 (=> (not res!631662) (not e!527407))))

(assert (=> b!939030 (= res!631662 (= (getValueByKey!484 (toList!6055 lt!424223) (_1!6702 (tuple2!13383 lt!423888 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423888 minValue!1173)))))))

(declare-fun b!939031 () Bool)

(assert (=> b!939031 (= e!527407 (contains!5118 (toList!6055 lt!424223) (tuple2!13383 lt!423888 minValue!1173)))))

(assert (= (and d!113905 res!631661) b!939030))

(assert (= (and b!939030 res!631662) b!939031))

(declare-fun m!874799 () Bool)

(assert (=> d!113905 m!874799))

(declare-fun m!874801 () Bool)

(assert (=> d!113905 m!874801))

(declare-fun m!874803 () Bool)

(assert (=> d!113905 m!874803))

(declare-fun m!874805 () Bool)

(assert (=> d!113905 m!874805))

(declare-fun m!874807 () Bool)

(assert (=> b!939030 m!874807))

(declare-fun m!874809 () Bool)

(assert (=> b!939031 m!874809))

(assert (=> b!938593 d!113905))

(declare-fun d!113907 () Bool)

(assert (=> d!113907 (= (apply!856 (+!2842 lt!423892 (tuple2!13383 lt!423879 zeroValue!1173)) lt!423895) (get!14337 (getValueByKey!484 (toList!6055 (+!2842 lt!423892 (tuple2!13383 lt!423879 zeroValue!1173))) lt!423895)))))

(declare-fun bs!26387 () Bool)

(assert (= bs!26387 d!113907))

(declare-fun m!874811 () Bool)

(assert (=> bs!26387 m!874811))

(assert (=> bs!26387 m!874811))

(declare-fun m!874813 () Bool)

(assert (=> bs!26387 m!874813))

(assert (=> b!938593 d!113907))

(declare-fun d!113909 () Bool)

(declare-fun e!527408 () Bool)

(assert (=> d!113909 e!527408))

(declare-fun res!631663 () Bool)

(assert (=> d!113909 (=> (not res!631663) (not e!527408))))

(declare-fun lt!424227 () ListLongMap!12079)

(assert (=> d!113909 (= res!631663 (contains!5115 lt!424227 (_1!6702 (tuple2!13383 lt!423897 minValue!1173))))))

(declare-fun lt!424225 () List!19159)

(assert (=> d!113909 (= lt!424227 (ListLongMap!12080 lt!424225))))

(declare-fun lt!424226 () Unit!31700)

(declare-fun lt!424228 () Unit!31700)

(assert (=> d!113909 (= lt!424226 lt!424228)))

(assert (=> d!113909 (= (getValueByKey!484 lt!424225 (_1!6702 (tuple2!13383 lt!423897 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423897 minValue!1173))))))

(assert (=> d!113909 (= lt!424228 (lemmaContainsTupThenGetReturnValue!260 lt!424225 (_1!6702 (tuple2!13383 lt!423897 minValue!1173)) (_2!6702 (tuple2!13383 lt!423897 minValue!1173))))))

(assert (=> d!113909 (= lt!424225 (insertStrictlySorted!317 (toList!6055 lt!423887) (_1!6702 (tuple2!13383 lt!423897 minValue!1173)) (_2!6702 (tuple2!13383 lt!423897 minValue!1173))))))

(assert (=> d!113909 (= (+!2842 lt!423887 (tuple2!13383 lt!423897 minValue!1173)) lt!424227)))

(declare-fun b!939032 () Bool)

(declare-fun res!631664 () Bool)

(assert (=> b!939032 (=> (not res!631664) (not e!527408))))

(assert (=> b!939032 (= res!631664 (= (getValueByKey!484 (toList!6055 lt!424227) (_1!6702 (tuple2!13383 lt!423897 minValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423897 minValue!1173)))))))

(declare-fun b!939033 () Bool)

(assert (=> b!939033 (= e!527408 (contains!5118 (toList!6055 lt!424227) (tuple2!13383 lt!423897 minValue!1173)))))

(assert (= (and d!113909 res!631663) b!939032))

(assert (= (and b!939032 res!631664) b!939033))

(declare-fun m!874815 () Bool)

(assert (=> d!113909 m!874815))

(declare-fun m!874817 () Bool)

(assert (=> d!113909 m!874817))

(declare-fun m!874819 () Bool)

(assert (=> d!113909 m!874819))

(declare-fun m!874821 () Bool)

(assert (=> d!113909 m!874821))

(declare-fun m!874823 () Bool)

(assert (=> b!939032 m!874823))

(declare-fun m!874825 () Bool)

(assert (=> b!939033 m!874825))

(assert (=> b!938593 d!113909))

(declare-fun d!113911 () Bool)

(assert (=> d!113911 (= (apply!856 (+!2842 lt!423890 (tuple2!13383 lt!423888 minValue!1173)) lt!423893) (get!14337 (getValueByKey!484 (toList!6055 (+!2842 lt!423890 (tuple2!13383 lt!423888 minValue!1173))) lt!423893)))))

(declare-fun bs!26388 () Bool)

(assert (= bs!26388 d!113911))

(declare-fun m!874827 () Bool)

(assert (=> bs!26388 m!874827))

(assert (=> bs!26388 m!874827))

(declare-fun m!874829 () Bool)

(assert (=> bs!26388 m!874829))

(assert (=> b!938593 d!113911))

(declare-fun d!113913 () Bool)

(assert (=> d!113913 (= (apply!856 lt!423890 lt!423893) (get!14337 (getValueByKey!484 (toList!6055 lt!423890) lt!423893)))))

(declare-fun bs!26389 () Bool)

(assert (= bs!26389 d!113913))

(declare-fun m!874831 () Bool)

(assert (=> bs!26389 m!874831))

(assert (=> bs!26389 m!874831))

(declare-fun m!874833 () Bool)

(assert (=> bs!26389 m!874833))

(assert (=> b!938593 d!113913))

(declare-fun d!113915 () Bool)

(assert (=> d!113915 (= (apply!856 (+!2842 lt!423887 (tuple2!13383 lt!423897 minValue!1173)) lt!423885) (apply!856 lt!423887 lt!423885))))

(declare-fun lt!424229 () Unit!31700)

(assert (=> d!113915 (= lt!424229 (choose!1561 lt!423887 lt!423897 minValue!1173 lt!423885))))

(declare-fun e!527409 () Bool)

(assert (=> d!113915 e!527409))

(declare-fun res!631665 () Bool)

(assert (=> d!113915 (=> (not res!631665) (not e!527409))))

(assert (=> d!113915 (= res!631665 (contains!5115 lt!423887 lt!423885))))

(assert (=> d!113915 (= (addApplyDifferent!441 lt!423887 lt!423897 minValue!1173 lt!423885) lt!424229)))

(declare-fun b!939034 () Bool)

(assert (=> b!939034 (= e!527409 (not (= lt!423885 lt!423897)))))

(assert (= (and d!113915 res!631665) b!939034))

(assert (=> d!113915 m!873929))

(declare-fun m!874835 () Bool)

(assert (=> d!113915 m!874835))

(assert (=> d!113915 m!873919))

(assert (=> d!113915 m!873919))

(assert (=> d!113915 m!873931))

(declare-fun m!874837 () Bool)

(assert (=> d!113915 m!874837))

(assert (=> b!938593 d!113915))

(declare-fun d!113917 () Bool)

(assert (=> d!113917 (= (apply!856 lt!423887 lt!423885) (get!14337 (getValueByKey!484 (toList!6055 lt!423887) lt!423885)))))

(declare-fun bs!26390 () Bool)

(assert (= bs!26390 d!113917))

(declare-fun m!874839 () Bool)

(assert (=> bs!26390 m!874839))

(assert (=> bs!26390 m!874839))

(declare-fun m!874841 () Bool)

(assert (=> bs!26390 m!874841))

(assert (=> b!938593 d!113917))

(declare-fun d!113919 () Bool)

(assert (=> d!113919 (= (apply!856 (+!2842 lt!423887 (tuple2!13383 lt!423897 minValue!1173)) lt!423885) (get!14337 (getValueByKey!484 (toList!6055 (+!2842 lt!423887 (tuple2!13383 lt!423897 minValue!1173))) lt!423885)))))

(declare-fun bs!26391 () Bool)

(assert (= bs!26391 d!113919))

(declare-fun m!874843 () Bool)

(assert (=> bs!26391 m!874843))

(assert (=> bs!26391 m!874843))

(declare-fun m!874845 () Bool)

(assert (=> bs!26391 m!874845))

(assert (=> b!938593 d!113919))

(declare-fun d!113921 () Bool)

(assert (=> d!113921 (= (apply!856 (+!2842 lt!423892 (tuple2!13383 lt!423879 zeroValue!1173)) lt!423895) (apply!856 lt!423892 lt!423895))))

(declare-fun lt!424230 () Unit!31700)

(assert (=> d!113921 (= lt!424230 (choose!1561 lt!423892 lt!423879 zeroValue!1173 lt!423895))))

(declare-fun e!527410 () Bool)

(assert (=> d!113921 e!527410))

(declare-fun res!631666 () Bool)

(assert (=> d!113921 (=> (not res!631666) (not e!527410))))

(assert (=> d!113921 (= res!631666 (contains!5115 lt!423892 lt!423895))))

(assert (=> d!113921 (= (addApplyDifferent!441 lt!423892 lt!423879 zeroValue!1173 lt!423895) lt!424230)))

(declare-fun b!939035 () Bool)

(assert (=> b!939035 (= e!527410 (not (= lt!423895 lt!423879)))))

(assert (= (and d!113921 res!631666) b!939035))

(assert (=> d!113921 m!873933))

(declare-fun m!874847 () Bool)

(assert (=> d!113921 m!874847))

(assert (=> d!113921 m!873907))

(assert (=> d!113921 m!873907))

(assert (=> d!113921 m!873909))

(declare-fun m!874849 () Bool)

(assert (=> d!113921 m!874849))

(assert (=> b!938593 d!113921))

(declare-fun d!113923 () Bool)

(declare-fun e!527411 () Bool)

(assert (=> d!113923 e!527411))

(declare-fun res!631667 () Bool)

(assert (=> d!113923 (=> (not res!631667) (not e!527411))))

(declare-fun lt!424233 () ListLongMap!12079)

(assert (=> d!113923 (= res!631667 (contains!5115 lt!424233 (_1!6702 (tuple2!13383 lt!423879 zeroValue!1173))))))

(declare-fun lt!424231 () List!19159)

(assert (=> d!113923 (= lt!424233 (ListLongMap!12080 lt!424231))))

(declare-fun lt!424232 () Unit!31700)

(declare-fun lt!424234 () Unit!31700)

(assert (=> d!113923 (= lt!424232 lt!424234)))

(assert (=> d!113923 (= (getValueByKey!484 lt!424231 (_1!6702 (tuple2!13383 lt!423879 zeroValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423879 zeroValue!1173))))))

(assert (=> d!113923 (= lt!424234 (lemmaContainsTupThenGetReturnValue!260 lt!424231 (_1!6702 (tuple2!13383 lt!423879 zeroValue!1173)) (_2!6702 (tuple2!13383 lt!423879 zeroValue!1173))))))

(assert (=> d!113923 (= lt!424231 (insertStrictlySorted!317 (toList!6055 lt!423892) (_1!6702 (tuple2!13383 lt!423879 zeroValue!1173)) (_2!6702 (tuple2!13383 lt!423879 zeroValue!1173))))))

(assert (=> d!113923 (= (+!2842 lt!423892 (tuple2!13383 lt!423879 zeroValue!1173)) lt!424233)))

(declare-fun b!939036 () Bool)

(declare-fun res!631668 () Bool)

(assert (=> b!939036 (=> (not res!631668) (not e!527411))))

(assert (=> b!939036 (= res!631668 (= (getValueByKey!484 (toList!6055 lt!424233) (_1!6702 (tuple2!13383 lt!423879 zeroValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423879 zeroValue!1173)))))))

(declare-fun b!939037 () Bool)

(assert (=> b!939037 (= e!527411 (contains!5118 (toList!6055 lt!424233) (tuple2!13383 lt!423879 zeroValue!1173)))))

(assert (= (and d!113923 res!631667) b!939036))

(assert (= (and b!939036 res!631668) b!939037))

(declare-fun m!874851 () Bool)

(assert (=> d!113923 m!874851))

(declare-fun m!874853 () Bool)

(assert (=> d!113923 m!874853))

(declare-fun m!874855 () Bool)

(assert (=> d!113923 m!874855))

(declare-fun m!874857 () Bool)

(assert (=> d!113923 m!874857))

(declare-fun m!874859 () Bool)

(assert (=> b!939036 m!874859))

(declare-fun m!874861 () Bool)

(assert (=> b!939037 m!874861))

(assert (=> b!938593 d!113923))

(declare-fun d!113925 () Bool)

(declare-fun e!527413 () Bool)

(assert (=> d!113925 e!527413))

(declare-fun res!631669 () Bool)

(assert (=> d!113925 (=> res!631669 e!527413)))

(declare-fun lt!424236 () Bool)

(assert (=> d!113925 (= res!631669 (not lt!424236))))

(declare-fun lt!424238 () Bool)

(assert (=> d!113925 (= lt!424236 lt!424238)))

(declare-fun lt!424237 () Unit!31700)

(declare-fun e!527412 () Unit!31700)

(assert (=> d!113925 (= lt!424237 e!527412)))

(declare-fun c!97947 () Bool)

(assert (=> d!113925 (= c!97947 lt!424238)))

(assert (=> d!113925 (= lt!424238 (containsKey!451 (toList!6055 (+!2842 lt!423876 (tuple2!13383 lt!423882 zeroValue!1173))) lt!423884))))

(assert (=> d!113925 (= (contains!5115 (+!2842 lt!423876 (tuple2!13383 lt!423882 zeroValue!1173)) lt!423884) lt!424236)))

(declare-fun b!939038 () Bool)

(declare-fun lt!424235 () Unit!31700)

(assert (=> b!939038 (= e!527412 lt!424235)))

(assert (=> b!939038 (= lt!424235 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 (+!2842 lt!423876 (tuple2!13383 lt!423882 zeroValue!1173))) lt!423884))))

(assert (=> b!939038 (isDefined!356 (getValueByKey!484 (toList!6055 (+!2842 lt!423876 (tuple2!13383 lt!423882 zeroValue!1173))) lt!423884))))

(declare-fun b!939039 () Bool)

(declare-fun Unit!31728 () Unit!31700)

(assert (=> b!939039 (= e!527412 Unit!31728)))

(declare-fun b!939040 () Bool)

(assert (=> b!939040 (= e!527413 (isDefined!356 (getValueByKey!484 (toList!6055 (+!2842 lt!423876 (tuple2!13383 lt!423882 zeroValue!1173))) lt!423884)))))

(assert (= (and d!113925 c!97947) b!939038))

(assert (= (and d!113925 (not c!97947)) b!939039))

(assert (= (and d!113925 (not res!631669)) b!939040))

(declare-fun m!874863 () Bool)

(assert (=> d!113925 m!874863))

(declare-fun m!874865 () Bool)

(assert (=> b!939038 m!874865))

(declare-fun m!874867 () Bool)

(assert (=> b!939038 m!874867))

(assert (=> b!939038 m!874867))

(declare-fun m!874869 () Bool)

(assert (=> b!939038 m!874869))

(assert (=> b!939040 m!874867))

(assert (=> b!939040 m!874867))

(assert (=> b!939040 m!874869))

(assert (=> b!938593 d!113925))

(declare-fun d!113927 () Bool)

(declare-fun e!527414 () Bool)

(assert (=> d!113927 e!527414))

(declare-fun res!631670 () Bool)

(assert (=> d!113927 (=> (not res!631670) (not e!527414))))

(declare-fun lt!424241 () ListLongMap!12079)

(assert (=> d!113927 (= res!631670 (contains!5115 lt!424241 (_1!6702 (tuple2!13383 lt!423882 zeroValue!1173))))))

(declare-fun lt!424239 () List!19159)

(assert (=> d!113927 (= lt!424241 (ListLongMap!12080 lt!424239))))

(declare-fun lt!424240 () Unit!31700)

(declare-fun lt!424242 () Unit!31700)

(assert (=> d!113927 (= lt!424240 lt!424242)))

(assert (=> d!113927 (= (getValueByKey!484 lt!424239 (_1!6702 (tuple2!13383 lt!423882 zeroValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423882 zeroValue!1173))))))

(assert (=> d!113927 (= lt!424242 (lemmaContainsTupThenGetReturnValue!260 lt!424239 (_1!6702 (tuple2!13383 lt!423882 zeroValue!1173)) (_2!6702 (tuple2!13383 lt!423882 zeroValue!1173))))))

(assert (=> d!113927 (= lt!424239 (insertStrictlySorted!317 (toList!6055 lt!423876) (_1!6702 (tuple2!13383 lt!423882 zeroValue!1173)) (_2!6702 (tuple2!13383 lt!423882 zeroValue!1173))))))

(assert (=> d!113927 (= (+!2842 lt!423876 (tuple2!13383 lt!423882 zeroValue!1173)) lt!424241)))

(declare-fun b!939041 () Bool)

(declare-fun res!631671 () Bool)

(assert (=> b!939041 (=> (not res!631671) (not e!527414))))

(assert (=> b!939041 (= res!631671 (= (getValueByKey!484 (toList!6055 lt!424241) (_1!6702 (tuple2!13383 lt!423882 zeroValue!1173))) (Some!489 (_2!6702 (tuple2!13383 lt!423882 zeroValue!1173)))))))

(declare-fun b!939042 () Bool)

(assert (=> b!939042 (= e!527414 (contains!5118 (toList!6055 lt!424241) (tuple2!13383 lt!423882 zeroValue!1173)))))

(assert (= (and d!113927 res!631670) b!939041))

(assert (= (and b!939041 res!631671) b!939042))

(declare-fun m!874871 () Bool)

(assert (=> d!113927 m!874871))

(declare-fun m!874873 () Bool)

(assert (=> d!113927 m!874873))

(declare-fun m!874875 () Bool)

(assert (=> d!113927 m!874875))

(declare-fun m!874877 () Bool)

(assert (=> d!113927 m!874877))

(declare-fun m!874879 () Bool)

(assert (=> b!939041 m!874879))

(declare-fun m!874881 () Bool)

(assert (=> b!939042 m!874881))

(assert (=> b!938593 d!113927))

(declare-fun d!113929 () Bool)

(assert (=> d!113929 (contains!5115 (+!2842 lt!423876 (tuple2!13383 lt!423882 zeroValue!1173)) lt!423884)))

(declare-fun lt!424243 () Unit!31700)

(assert (=> d!113929 (= lt!424243 (choose!1559 lt!423876 lt!423882 zeroValue!1173 lt!423884))))

(assert (=> d!113929 (contains!5115 lt!423876 lt!423884)))

(assert (=> d!113929 (= (addStillContains!561 lt!423876 lt!423882 zeroValue!1173 lt!423884) lt!424243)))

(declare-fun bs!26392 () Bool)

(assert (= bs!26392 d!113929))

(assert (=> bs!26392 m!873913))

(assert (=> bs!26392 m!873913))

(assert (=> bs!26392 m!873917))

(declare-fun m!874883 () Bool)

(assert (=> bs!26392 m!874883))

(declare-fun m!874885 () Bool)

(assert (=> bs!26392 m!874885))

(assert (=> b!938593 d!113929))

(declare-fun d!113931 () Bool)

(assert (=> d!113931 (= (apply!856 lt!423892 lt!423895) (get!14337 (getValueByKey!484 (toList!6055 lt!423892) lt!423895)))))

(declare-fun bs!26393 () Bool)

(assert (= bs!26393 d!113931))

(declare-fun m!874887 () Bool)

(assert (=> bs!26393 m!874887))

(assert (=> bs!26393 m!874887))

(declare-fun m!874889 () Bool)

(assert (=> bs!26393 m!874889))

(assert (=> b!938593 d!113931))

(declare-fun d!113933 () Bool)

(assert (=> d!113933 (= (apply!856 (+!2842 lt!423890 (tuple2!13383 lt!423888 minValue!1173)) lt!423893) (apply!856 lt!423890 lt!423893))))

(declare-fun lt!424244 () Unit!31700)

(assert (=> d!113933 (= lt!424244 (choose!1561 lt!423890 lt!423888 minValue!1173 lt!423893))))

(declare-fun e!527415 () Bool)

(assert (=> d!113933 e!527415))

(declare-fun res!631672 () Bool)

(assert (=> d!113933 (=> (not res!631672) (not e!527415))))

(assert (=> d!113933 (= res!631672 (contains!5115 lt!423890 lt!423893))))

(assert (=> d!113933 (= (addApplyDifferent!441 lt!423890 lt!423888 minValue!1173 lt!423893) lt!424244)))

(declare-fun b!939043 () Bool)

(assert (=> b!939043 (= e!527415 (not (= lt!423893 lt!423888)))))

(assert (= (and d!113933 res!631672) b!939043))

(assert (=> d!113933 m!873935))

(declare-fun m!874891 () Bool)

(assert (=> d!113933 m!874891))

(assert (=> d!113933 m!873925))

(assert (=> d!113933 m!873925))

(assert (=> d!113933 m!873927))

(declare-fun m!874893 () Bool)

(assert (=> d!113933 m!874893))

(assert (=> b!938593 d!113933))

(declare-fun d!113935 () Bool)

(declare-fun lt!424245 () Bool)

(assert (=> d!113935 (= lt!424245 (select (content!411 Nil!19157) (select (arr!27175 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun e!527416 () Bool)

(assert (=> d!113935 (= lt!424245 e!527416)))

(declare-fun res!631674 () Bool)

(assert (=> d!113935 (=> (not res!631674) (not e!527416))))

(assert (=> d!113935 (= res!631674 ((_ is Cons!19156) Nil!19157))))

(assert (=> d!113935 (= (contains!5117 Nil!19157 (select (arr!27175 _keys!1487) #b00000000000000000000000000000000)) lt!424245)))

(declare-fun b!939044 () Bool)

(declare-fun e!527417 () Bool)

(assert (=> b!939044 (= e!527416 e!527417)))

(declare-fun res!631673 () Bool)

(assert (=> b!939044 (=> res!631673 e!527417)))

(assert (=> b!939044 (= res!631673 (= (h!20302 Nil!19157) (select (arr!27175 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!939045 () Bool)

(assert (=> b!939045 (= e!527417 (contains!5117 (t!27461 Nil!19157) (select (arr!27175 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113935 res!631674) b!939044))

(assert (= (and b!939044 (not res!631673)) b!939045))

(assert (=> d!113935 m!874189))

(assert (=> d!113935 m!873881))

(declare-fun m!874895 () Bool)

(assert (=> d!113935 m!874895))

(assert (=> b!939045 m!873881))

(declare-fun m!874897 () Bool)

(assert (=> b!939045 m!874897))

(assert (=> b!938528 d!113935))

(declare-fun d!113937 () Bool)

(assert (=> d!113937 (= (get!14337 (getValueByKey!484 (toList!6055 lt!423776) k0!1099)) (v!12713 (getValueByKey!484 (toList!6055 lt!423776) k0!1099)))))

(assert (=> d!113677 d!113937))

(assert (=> d!113677 d!113893))

(assert (=> bm!40842 d!113903))

(declare-fun d!113939 () Bool)

(declare-fun e!527419 () Bool)

(assert (=> d!113939 e!527419))

(declare-fun res!631675 () Bool)

(assert (=> d!113939 (=> res!631675 e!527419)))

(declare-fun lt!424247 () Bool)

(assert (=> d!113939 (= res!631675 (not lt!424247))))

(declare-fun lt!424249 () Bool)

(assert (=> d!113939 (= lt!424247 lt!424249)))

(declare-fun lt!424248 () Unit!31700)

(declare-fun e!527418 () Unit!31700)

(assert (=> d!113939 (= lt!424248 e!527418)))

(declare-fun c!97948 () Bool)

(assert (=> d!113939 (= c!97948 lt!424249)))

(assert (=> d!113939 (= lt!424249 (containsKey!451 (toList!6055 lt!423944) (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> d!113939 (= (contains!5115 lt!423944 (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) lt!424247)))

(declare-fun b!939046 () Bool)

(declare-fun lt!424246 () Unit!31700)

(assert (=> b!939046 (= e!527418 lt!424246)))

(assert (=> b!939046 (= lt!424246 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6055 lt!423944) (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!939046 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423944) (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!939047 () Bool)

(declare-fun Unit!31729 () Unit!31700)

(assert (=> b!939047 (= e!527418 Unit!31729)))

(declare-fun b!939048 () Bool)

(assert (=> b!939048 (= e!527419 (isDefined!356 (getValueByKey!484 (toList!6055 lt!423944) (select (arr!27175 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))))

(assert (= (and d!113939 c!97948) b!939046))

(assert (= (and d!113939 (not c!97948)) b!939047))

(assert (= (and d!113939 (not res!631675)) b!939048))

(assert (=> d!113939 m!873983))

(declare-fun m!874899 () Bool)

(assert (=> d!113939 m!874899))

(assert (=> b!939046 m!873983))

(declare-fun m!874901 () Bool)

(assert (=> b!939046 m!874901))

(assert (=> b!939046 m!873983))

(assert (=> b!939046 m!874331))

(assert (=> b!939046 m!874331))

(declare-fun m!874903 () Bool)

(assert (=> b!939046 m!874903))

(assert (=> b!939048 m!873983))

(assert (=> b!939048 m!874331))

(assert (=> b!939048 m!874331))

(assert (=> b!939048 m!874903))

(assert (=> b!938642 d!113939))

(declare-fun condMapEmpty!32180 () Bool)

(declare-fun mapDefault!32180 () ValueCell!9651)

(assert (=> mapNonEmpty!32179 (= condMapEmpty!32180 (= mapRest!32179 ((as const (Array (_ BitVec 32) ValueCell!9651)) mapDefault!32180)))))

(declare-fun e!527421 () Bool)

(declare-fun mapRes!32180 () Bool)

(assert (=> mapNonEmpty!32179 (= tp!61740 (and e!527421 mapRes!32180))))

(declare-fun mapNonEmpty!32180 () Bool)

(declare-fun tp!61741 () Bool)

(declare-fun e!527420 () Bool)

(assert (=> mapNonEmpty!32180 (= mapRes!32180 (and tp!61741 e!527420))))

(declare-fun mapKey!32180 () (_ BitVec 32))

(declare-fun mapRest!32180 () (Array (_ BitVec 32) ValueCell!9651))

(declare-fun mapValue!32180 () ValueCell!9651)

(assert (=> mapNonEmpty!32180 (= mapRest!32179 (store mapRest!32180 mapKey!32180 mapValue!32180))))

(declare-fun mapIsEmpty!32180 () Bool)

(assert (=> mapIsEmpty!32180 mapRes!32180))

(declare-fun b!939049 () Bool)

(assert (=> b!939049 (= e!527420 tp_is_empty!20265)))

(declare-fun b!939050 () Bool)

(assert (=> b!939050 (= e!527421 tp_is_empty!20265)))

(assert (= (and mapNonEmpty!32179 condMapEmpty!32180) mapIsEmpty!32180))

(assert (= (and mapNonEmpty!32179 (not condMapEmpty!32180)) mapNonEmpty!32180))

(assert (= (and mapNonEmpty!32180 ((_ is ValueCellFull!9651) mapValue!32180)) b!939049))

(assert (= (and mapNonEmpty!32179 ((_ is ValueCellFull!9651) mapDefault!32180)) b!939050))

(declare-fun m!874905 () Bool)

(assert (=> mapNonEmpty!32180 m!874905))

(declare-fun b_lambda!14251 () Bool)

(assert (= b_lambda!14239 (or (and start!79784 b_free!17757) b_lambda!14251)))

(declare-fun b_lambda!14253 () Bool)

(assert (= b_lambda!14241 (or (and start!79784 b_free!17757) b_lambda!14253)))

(declare-fun b_lambda!14255 () Bool)

(assert (= b_lambda!14235 (or (and start!79784 b_free!17757) b_lambda!14255)))

(declare-fun b_lambda!14257 () Bool)

(assert (= b_lambda!14245 (or (and start!79784 b_free!17757) b_lambda!14257)))

(declare-fun b_lambda!14259 () Bool)

(assert (= b_lambda!14237 (or (and start!79784 b_free!17757) b_lambda!14259)))

(declare-fun b_lambda!14261 () Bool)

(assert (= b_lambda!14243 (or (and start!79784 b_free!17757) b_lambda!14261)))

(declare-fun b_lambda!14263 () Bool)

(assert (= b_lambda!14249 (or (and start!79784 b_free!17757) b_lambda!14263)))

(declare-fun b_lambda!14265 () Bool)

(assert (= b_lambda!14247 (or (and start!79784 b_free!17757) b_lambda!14265)))

(check-sat (not b_lambda!14233) (not d!113777) (not d!113855) (not bm!40885) (not d!113723) (not d!113787) (not d!113797) (not d!113869) (not b!938876) (not b!938807) (not b!938873) (not d!113697) (not d!113861) (not b!938817) (not b!939042) (not b!938790) (not d!113837) (not b!938995) (not b!938770) (not d!113857) (not b!938917) (not d!113877) (not d!113867) (not bm!40893) (not b!939036) (not d!113905) (not d!113735) (not bm!40892) (not b!938978) (not d!113875) (not b!938953) (not b!938907) (not d!113907) (not b!938895) (not b!939028) (not d!113859) (not bm!40875) (not b!938773) (not b!938832) (not b!939037) (not b!939027) (not b!938973) (not d!113703) (not b!939017) (not b!939029) (not d!113871) (not b!939016) (not d!113815) (not b!938814) (not b!938768) (not b!938889) (not b_lambda!14253) (not b!938893) (not b!938958) (not b!939046) (not b!938982) (not b!938915) (not d!113935) (not d!113743) (not d!113733) (not d!113843) (not b!939009) (not b!938934) (not d!113759) (not b!938769) (not d!113763) (not d!113917) (not b!938882) (not b!939041) (not b_lambda!14265) (not b!938918) (not b!938968) (not b!939020) (not d!113773) (not b!938759) (not mapNonEmpty!32180) (not b!938718) (not b!939026) (not d!113709) (not b!939007) (not d!113839) (not b!938884) (not d!113693) (not b!938991) (not bm!40871) (not d!113789) (not b!938910) (not b!938979) (not b!938753) (not b!938866) (not b!938894) (not d!113913) (not d!113833) (not b!938970) (not b!938879) (not b!938758) (not d!113863) (not b_lambda!14263) (not b!938781) (not bm!40889) (not d!113881) (not b!938748) (not d!113739) (not b!939048) (not d!113717) (not b!938839) (not b!938898) (not d!113775) (not d!113921) (not b!938765) (not b!938921) (not b!938932) (not b!938720) (not b!939001) (not b!938802) (not d!113747) (not b!938955) (not b!938818) (not b!938815) (not b!938751) tp_is_empty!20265 (not bm!40891) (not d!113883) (not b!938961) (not d!113915) (not d!113923) (not d!113707) (not b!938905) (not d!113745) (not b!938783) (not bm!40872) (not d!113807) (not b!939033) (not b!938813) (not d!113725) (not d!113895) (not d!113933) (not b_lambda!14227) (not bm!40887) (not b!938756) (not d!113887) (not d!113903) (not d!113809) (not b_lambda!14257) (not d!113929) (not d!113749) (not b!938888) (not d!113705) (not b!938816) (not b!938787) (not b!939045) (not b!938784) (not b!938981) (not b!938800) (not b!938723) (not b!938974) (not b!938712) (not d!113719) (not d!113785) (not d!113701) (not b!938912) (not d!113799) (not d!113751) (not d!113713) (not d!113845) (not b!938810) (not b!938966) (not d!113925) (not b!938996) (not b!938775) (not b!938794) (not d!113817) (not d!113715) (not bm!40870) (not b!938993) (not b!938899) b_and!29159 (not b!938984) (not b_lambda!14259) (not d!113779) (not d!113851) (not b!938990) (not b!938976) (not d!113891) (not b!938902) (not d!113873) (not b!938801) (not b_lambda!14231) (not d!113825) (not b!938782) (not b!939003) (not b!939011) (not d!113819) (not b!939021) (not b!938960) (not b!938812) (not d!113771) (not d!113699) (not b!938992) (not b!939040) (not b!938798) (not b!938788) (not b!938987) (not d!113865) (not b!938980) (not d!113689) (not d!113885) (not b!938878) (not b_lambda!14255) (not b!938722) (not d!113911) (not b_next!17757) (not b!938930) (not b!938929) (not d!113897) (not b!938994) (not b!938909) (not b!939032) (not b!938868) (not b!939012) (not b!938997) (not b!939018) (not d!113791) (not d!113939) (not b_lambda!14217) (not b!938774) (not b!938985) (not d!113781) (not d!113835) (not d!113931) (not d!113927) (not b!939004) (not b!939023) (not d!113753) (not b!938891) (not b!938786) (not b!938750) (not b!938821) (not d!113793) (not b_lambda!14229) (not d!113729) (not d!113801) (not d!113827) (not d!113783) (not d!113767) (not b!938896) (not b!938871) (not b!938808) (not b!939030) (not b!939038) (not b!938951) (not d!113879) (not b!939031) (not b!938838) (not b!939014) (not bm!40874) (not b!938886) (not d!113795) (not b_lambda!14261) (not b!938819) (not b!938890) (not d!113849) (not d!113919) (not b!938926) (not d!113805) (not d!113901) (not b!938757) (not b!938864) (not b!938766) (not bm!40867) (not d!113909) (not b_lambda!14251) (not b!938928))
(check-sat b_and!29159 (not b_next!17757))
