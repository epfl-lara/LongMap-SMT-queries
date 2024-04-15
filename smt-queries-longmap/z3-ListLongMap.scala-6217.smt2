; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79418 () Bool)

(assert start!79418)

(declare-fun b_free!17623 () Bool)

(declare-fun b_next!17623 () Bool)

(assert (=> start!79418 (= b_free!17623 (not b_next!17623))))

(declare-fun tp!61314 () Bool)

(declare-fun b_and!28779 () Bool)

(assert (=> start!79418 (= tp!61314 b_and!28779)))

(declare-fun mapNonEmpty!31956 () Bool)

(declare-fun mapRes!31956 () Bool)

(declare-fun tp!61313 () Bool)

(declare-fun e!524164 () Bool)

(assert (=> mapNonEmpty!31956 (= mapRes!31956 (and tp!61313 e!524164))))

(declare-fun mapKey!31956 () (_ BitVec 32))

(declare-datatypes ((V!31807 0))(
  ( (V!31808 (val!10116 Int)) )
))
(declare-datatypes ((ValueCell!9584 0))(
  ( (ValueCellFull!9584 (v!12634 V!31807)) (EmptyCell!9584) )
))
(declare-datatypes ((array!56163 0))(
  ( (array!56164 (arr!27026 (Array (_ BitVec 32) ValueCell!9584)) (size!27487 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56163)

(declare-fun mapRest!31956 () (Array (_ BitVec 32) ValueCell!9584))

(declare-fun mapValue!31956 () ValueCell!9584)

(assert (=> mapNonEmpty!31956 (= (arr!27026 _values!1231) (store mapRest!31956 mapKey!31956 mapValue!31956))))

(declare-fun b!933522 () Bool)

(declare-fun tp_is_empty!20131 () Bool)

(assert (=> b!933522 (= e!524164 tp_is_empty!20131)))

(declare-fun b!933523 () Bool)

(declare-fun res!628840 () Bool)

(declare-fun e!524159 () Bool)

(assert (=> b!933523 (=> (not res!628840) (not e!524159))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933523 (= res!628840 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933524 () Bool)

(declare-fun e!524162 () Bool)

(assert (=> b!933524 (= e!524162 e!524159)))

(declare-fun res!628835 () Bool)

(assert (=> b!933524 (=> (not res!628835) (not e!524159))))

(declare-datatypes ((tuple2!13322 0))(
  ( (tuple2!13323 (_1!6672 (_ BitVec 64)) (_2!6672 V!31807)) )
))
(declare-datatypes ((List!19071 0))(
  ( (Nil!19068) (Cons!19067 (h!20213 tuple2!13322) (t!27229 List!19071)) )
))
(declare-datatypes ((ListLongMap!12009 0))(
  ( (ListLongMap!12010 (toList!6020 List!19071)) )
))
(declare-fun lt!420335 () ListLongMap!12009)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5016 (ListLongMap!12009 (_ BitVec 64)) Bool)

(assert (=> b!933524 (= res!628835 (contains!5016 lt!420335 k0!1099))))

(declare-datatypes ((array!56165 0))(
  ( (array!56166 (arr!27027 (Array (_ BitVec 32) (_ BitVec 64))) (size!27488 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56165)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31807)

(declare-fun minValue!1173 () V!31807)

(declare-fun getCurrentListMap!3191 (array!56165 array!56163 (_ BitVec 32) (_ BitVec 32) V!31807 V!31807 (_ BitVec 32) Int) ListLongMap!12009)

(assert (=> b!933524 (= lt!420335 (getCurrentListMap!3191 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933525 () Bool)

(declare-fun res!628841 () Bool)

(assert (=> b!933525 (=> (not res!628841) (not e!524162))))

(assert (=> b!933525 (= res!628841 (and (= (size!27487 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27488 _keys!1487) (size!27487 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!628844 () Bool)

(assert (=> start!79418 (=> (not res!628844) (not e!524162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79418 (= res!628844 (validMask!0 mask!1881))))

(assert (=> start!79418 e!524162))

(assert (=> start!79418 true))

(assert (=> start!79418 tp_is_empty!20131))

(declare-fun e!524158 () Bool)

(declare-fun array_inv!21102 (array!56163) Bool)

(assert (=> start!79418 (and (array_inv!21102 _values!1231) e!524158)))

(assert (=> start!79418 tp!61314))

(declare-fun array_inv!21103 (array!56165) Bool)

(assert (=> start!79418 (array_inv!21103 _keys!1487)))

(declare-fun b!933526 () Bool)

(declare-fun e!524160 () Bool)

(assert (=> b!933526 (= e!524158 (and e!524160 mapRes!31956))))

(declare-fun condMapEmpty!31956 () Bool)

(declare-fun mapDefault!31956 () ValueCell!9584)

(assert (=> b!933526 (= condMapEmpty!31956 (= (arr!27026 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9584)) mapDefault!31956)))))

(declare-fun e!524161 () Bool)

(declare-fun b!933527 () Bool)

(declare-fun arrayContainsKey!0 (array!56165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!933527 (= e!524161 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!933528 () Bool)

(assert (=> b!933528 (= e!524160 tp_is_empty!20131)))

(declare-fun mapIsEmpty!31956 () Bool)

(assert (=> mapIsEmpty!31956 mapRes!31956))

(declare-fun b!933529 () Bool)

(assert (=> b!933529 (= e!524161 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!933530 () Bool)

(declare-fun e!524165 () Bool)

(assert (=> b!933530 (= e!524159 e!524165)))

(declare-fun res!628842 () Bool)

(assert (=> b!933530 (=> (not res!628842) (not e!524165))))

(declare-fun lt!420329 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933530 (= res!628842 (validKeyInArray!0 lt!420329))))

(assert (=> b!933530 (= lt!420329 (select (arr!27027 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933531 () Bool)

(assert (=> b!933531 (= e!524165 (not (bvslt (size!27488 _keys!1487) #b01111111111111111111111111111111)))))

(assert (=> b!933531 e!524161))

(declare-fun c!97013 () Bool)

(assert (=> b!933531 (= c!97013 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31420 0))(
  ( (Unit!31421) )
))
(declare-fun lt!420332 () Unit!31420)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!272 (array!56165 array!56163 (_ BitVec 32) (_ BitVec 32) V!31807 V!31807 (_ BitVec 64) (_ BitVec 32) Int) Unit!31420)

(assert (=> b!933531 (= lt!420332 (lemmaListMapContainsThenArrayContainsFrom!272 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19072 0))(
  ( (Nil!19069) (Cons!19068 (h!20214 (_ BitVec 64)) (t!27230 List!19072)) )
))
(declare-fun arrayNoDuplicates!0 (array!56165 (_ BitVec 32) List!19072) Bool)

(assert (=> b!933531 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19069)))

(declare-fun lt!420330 () Unit!31420)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56165 (_ BitVec 32) (_ BitVec 32)) Unit!31420)

(assert (=> b!933531 (= lt!420330 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420331 () tuple2!13322)

(declare-fun +!2825 (ListLongMap!12009 tuple2!13322) ListLongMap!12009)

(assert (=> b!933531 (contains!5016 (+!2825 lt!420335 lt!420331) k0!1099)))

(declare-fun lt!420333 () V!31807)

(declare-fun lt!420336 () Unit!31420)

(declare-fun addStillContains!514 (ListLongMap!12009 (_ BitVec 64) V!31807 (_ BitVec 64)) Unit!31420)

(assert (=> b!933531 (= lt!420336 (addStillContains!514 lt!420335 lt!420329 lt!420333 k0!1099))))

(assert (=> b!933531 (= (getCurrentListMap!3191 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2825 (getCurrentListMap!3191 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420331))))

(assert (=> b!933531 (= lt!420331 (tuple2!13323 lt!420329 lt!420333))))

(declare-fun get!14231 (ValueCell!9584 V!31807) V!31807)

(declare-fun dynLambda!1581 (Int (_ BitVec 64)) V!31807)

(assert (=> b!933531 (= lt!420333 (get!14231 (select (arr!27026 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1581 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420334 () Unit!31420)

(declare-fun lemmaListMapRecursiveValidKeyArray!189 (array!56165 array!56163 (_ BitVec 32) (_ BitVec 32) V!31807 V!31807 (_ BitVec 32) Int) Unit!31420)

(assert (=> b!933531 (= lt!420334 (lemmaListMapRecursiveValidKeyArray!189 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933532 () Bool)

(declare-fun res!628843 () Bool)

(assert (=> b!933532 (=> (not res!628843) (not e!524162))))

(assert (=> b!933532 (= res!628843 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27488 _keys!1487))))))

(declare-fun b!933533 () Bool)

(declare-fun res!628838 () Bool)

(assert (=> b!933533 (=> (not res!628838) (not e!524162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56165 (_ BitVec 32)) Bool)

(assert (=> b!933533 (= res!628838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933534 () Bool)

(declare-fun res!628837 () Bool)

(assert (=> b!933534 (=> (not res!628837) (not e!524159))))

(declare-fun v!791 () V!31807)

(declare-fun apply!806 (ListLongMap!12009 (_ BitVec 64)) V!31807)

(assert (=> b!933534 (= res!628837 (= (apply!806 lt!420335 k0!1099) v!791))))

(declare-fun b!933535 () Bool)

(declare-fun res!628836 () Bool)

(assert (=> b!933535 (=> (not res!628836) (not e!524159))))

(assert (=> b!933535 (= res!628836 (validKeyInArray!0 k0!1099))))

(declare-fun b!933536 () Bool)

(declare-fun res!628839 () Bool)

(assert (=> b!933536 (=> (not res!628839) (not e!524162))))

(assert (=> b!933536 (= res!628839 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19069))))

(assert (= (and start!79418 res!628844) b!933525))

(assert (= (and b!933525 res!628841) b!933533))

(assert (= (and b!933533 res!628838) b!933536))

(assert (= (and b!933536 res!628839) b!933532))

(assert (= (and b!933532 res!628843) b!933524))

(assert (= (and b!933524 res!628835) b!933534))

(assert (= (and b!933534 res!628837) b!933523))

(assert (= (and b!933523 res!628840) b!933535))

(assert (= (and b!933535 res!628836) b!933530))

(assert (= (and b!933530 res!628842) b!933531))

(assert (= (and b!933531 c!97013) b!933527))

(assert (= (and b!933531 (not c!97013)) b!933529))

(assert (= (and b!933526 condMapEmpty!31956) mapIsEmpty!31956))

(assert (= (and b!933526 (not condMapEmpty!31956)) mapNonEmpty!31956))

(get-info :version)

(assert (= (and mapNonEmpty!31956 ((_ is ValueCellFull!9584) mapValue!31956)) b!933522))

(assert (= (and b!933526 ((_ is ValueCellFull!9584) mapDefault!31956)) b!933528))

(assert (= start!79418 b!933526))

(declare-fun b_lambda!13939 () Bool)

(assert (=> (not b_lambda!13939) (not b!933531)))

(declare-fun t!27228 () Bool)

(declare-fun tb!6009 () Bool)

(assert (=> (and start!79418 (= defaultEntry!1235 defaultEntry!1235) t!27228) tb!6009))

(declare-fun result!11851 () Bool)

(assert (=> tb!6009 (= result!11851 tp_is_empty!20131)))

(assert (=> b!933531 t!27228))

(declare-fun b_and!28781 () Bool)

(assert (= b_and!28779 (and (=> t!27228 result!11851) b_and!28781)))

(declare-fun m!867185 () Bool)

(assert (=> b!933535 m!867185))

(declare-fun m!867187 () Bool)

(assert (=> b!933530 m!867187))

(declare-fun m!867189 () Bool)

(assert (=> b!933530 m!867189))

(declare-fun m!867191 () Bool)

(assert (=> b!933533 m!867191))

(declare-fun m!867193 () Bool)

(assert (=> b!933531 m!867193))

(declare-fun m!867195 () Bool)

(assert (=> b!933531 m!867195))

(declare-fun m!867197 () Bool)

(assert (=> b!933531 m!867197))

(declare-fun m!867199 () Bool)

(assert (=> b!933531 m!867199))

(declare-fun m!867201 () Bool)

(assert (=> b!933531 m!867201))

(declare-fun m!867203 () Bool)

(assert (=> b!933531 m!867203))

(assert (=> b!933531 m!867195))

(assert (=> b!933531 m!867199))

(assert (=> b!933531 m!867201))

(declare-fun m!867205 () Bool)

(assert (=> b!933531 m!867205))

(declare-fun m!867207 () Bool)

(assert (=> b!933531 m!867207))

(declare-fun m!867209 () Bool)

(assert (=> b!933531 m!867209))

(declare-fun m!867211 () Bool)

(assert (=> b!933531 m!867211))

(declare-fun m!867213 () Bool)

(assert (=> b!933531 m!867213))

(declare-fun m!867215 () Bool)

(assert (=> b!933531 m!867215))

(assert (=> b!933531 m!867213))

(declare-fun m!867217 () Bool)

(assert (=> b!933531 m!867217))

(declare-fun m!867219 () Bool)

(assert (=> mapNonEmpty!31956 m!867219))

(declare-fun m!867221 () Bool)

(assert (=> b!933536 m!867221))

(declare-fun m!867223 () Bool)

(assert (=> b!933534 m!867223))

(declare-fun m!867225 () Bool)

(assert (=> b!933527 m!867225))

(declare-fun m!867227 () Bool)

(assert (=> b!933524 m!867227))

(declare-fun m!867229 () Bool)

(assert (=> b!933524 m!867229))

(declare-fun m!867231 () Bool)

(assert (=> start!79418 m!867231))

(declare-fun m!867233 () Bool)

(assert (=> start!79418 m!867233))

(declare-fun m!867235 () Bool)

(assert (=> start!79418 m!867235))

(check-sat (not mapNonEmpty!31956) tp_is_empty!20131 (not start!79418) (not b!933524) (not b!933535) (not b!933530) (not b!933527) b_and!28781 (not b!933531) (not b_next!17623) (not b!933534) (not b!933533) (not b_lambda!13939) (not b!933536))
(check-sat b_and!28781 (not b_next!17623))
(get-model)

(declare-fun b_lambda!13945 () Bool)

(assert (= b_lambda!13939 (or (and start!79418 b_free!17623) b_lambda!13945)))

(check-sat (not mapNonEmpty!31956) tp_is_empty!20131 (not start!79418) (not b!933524) (not b!933535) (not b!933530) (not b_lambda!13945) (not b!933527) b_and!28781 (not b!933536) (not b!933531) (not b_next!17623) (not b!933534) (not b!933533))
(check-sat b_and!28781 (not b_next!17623))
(get-model)

(declare-fun b!933675 () Bool)

(declare-fun e!524242 () ListLongMap!12009)

(declare-fun e!524246 () ListLongMap!12009)

(assert (=> b!933675 (= e!524242 e!524246)))

(declare-fun c!97035 () Bool)

(assert (=> b!933675 (= c!97035 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40576 () Bool)

(declare-fun call!40585 () ListLongMap!12009)

(declare-fun call!40584 () ListLongMap!12009)

(assert (=> bm!40576 (= call!40585 call!40584)))

(declare-fun b!933676 () Bool)

(declare-fun call!40580 () ListLongMap!12009)

(assert (=> b!933676 (= e!524242 (+!2825 call!40580 (tuple2!13323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!933677 () Bool)

(declare-fun e!524250 () ListLongMap!12009)

(assert (=> b!933677 (= e!524250 call!40585)))

(declare-fun b!933678 () Bool)

(declare-fun res!628929 () Bool)

(declare-fun e!524245 () Bool)

(assert (=> b!933678 (=> (not res!628929) (not e!524245))))

(declare-fun e!524252 () Bool)

(assert (=> b!933678 (= res!628929 e!524252)))

(declare-fun res!628926 () Bool)

(assert (=> b!933678 (=> res!628926 e!524252)))

(declare-fun e!524249 () Bool)

(assert (=> b!933678 (= res!628926 (not e!524249))))

(declare-fun res!628927 () Bool)

(assert (=> b!933678 (=> (not res!628927) (not e!524249))))

(assert (=> b!933678 (= res!628927 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27488 _keys!1487)))))

(declare-fun b!933679 () Bool)

(declare-fun e!524240 () Bool)

(declare-fun call!40583 () Bool)

(assert (=> b!933679 (= e!524240 (not call!40583))))

(declare-fun b!933680 () Bool)

(declare-fun e!524244 () Bool)

(declare-fun lt!420448 () ListLongMap!12009)

(assert (=> b!933680 (= e!524244 (= (apply!806 lt!420448 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40577 () Bool)

(declare-fun call!40579 () ListLongMap!12009)

(assert (=> bm!40577 (= call!40584 call!40579)))

(declare-fun bm!40578 () Bool)

(declare-fun call!40581 () Bool)

(assert (=> bm!40578 (= call!40581 (contains!5016 lt!420448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!933681 () Bool)

(declare-fun e!524248 () Bool)

(assert (=> b!933681 (= e!524252 e!524248)))

(declare-fun res!628931 () Bool)

(assert (=> b!933681 (=> (not res!628931) (not e!524248))))

(assert (=> b!933681 (= res!628931 (contains!5016 lt!420448 (select (arr!27027 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!933681 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27488 _keys!1487)))))

(declare-fun bm!40579 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3335 (array!56165 array!56163 (_ BitVec 32) (_ BitVec 32) V!31807 V!31807 (_ BitVec 32) Int) ListLongMap!12009)

(assert (=> bm!40579 (= call!40579 (getCurrentListMapNoExtraKeys!3335 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933683 () Bool)

(declare-fun e!524251 () Bool)

(assert (=> b!933683 (= e!524251 (validKeyInArray!0 (select (arr!27027 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun bm!40580 () Bool)

(assert (=> bm!40580 (= call!40583 (contains!5016 lt!420448 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!933684 () Bool)

(declare-fun e!524247 () Unit!31420)

(declare-fun lt!420444 () Unit!31420)

(assert (=> b!933684 (= e!524247 lt!420444)))

(declare-fun lt!420447 () ListLongMap!12009)

(assert (=> b!933684 (= lt!420447 (getCurrentListMapNoExtraKeys!3335 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!420441 () (_ BitVec 64))

(assert (=> b!933684 (= lt!420441 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420435 () (_ BitVec 64))

(assert (=> b!933684 (= lt!420435 (select (arr!27027 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420445 () Unit!31420)

(assert (=> b!933684 (= lt!420445 (addStillContains!514 lt!420447 lt!420441 zeroValue!1173 lt!420435))))

(assert (=> b!933684 (contains!5016 (+!2825 lt!420447 (tuple2!13323 lt!420441 zeroValue!1173)) lt!420435)))

(declare-fun lt!420440 () Unit!31420)

(assert (=> b!933684 (= lt!420440 lt!420445)))

(declare-fun lt!420439 () ListLongMap!12009)

(assert (=> b!933684 (= lt!420439 (getCurrentListMapNoExtraKeys!3335 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!420446 () (_ BitVec 64))

(assert (=> b!933684 (= lt!420446 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420436 () (_ BitVec 64))

(assert (=> b!933684 (= lt!420436 (select (arr!27027 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420434 () Unit!31420)

(declare-fun addApplyDifferent!413 (ListLongMap!12009 (_ BitVec 64) V!31807 (_ BitVec 64)) Unit!31420)

(assert (=> b!933684 (= lt!420434 (addApplyDifferent!413 lt!420439 lt!420446 minValue!1173 lt!420436))))

(assert (=> b!933684 (= (apply!806 (+!2825 lt!420439 (tuple2!13323 lt!420446 minValue!1173)) lt!420436) (apply!806 lt!420439 lt!420436))))

(declare-fun lt!420449 () Unit!31420)

(assert (=> b!933684 (= lt!420449 lt!420434)))

(declare-fun lt!420450 () ListLongMap!12009)

(assert (=> b!933684 (= lt!420450 (getCurrentListMapNoExtraKeys!3335 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!420442 () (_ BitVec 64))

(assert (=> b!933684 (= lt!420442 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420429 () (_ BitVec 64))

(assert (=> b!933684 (= lt!420429 (select (arr!27027 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420430 () Unit!31420)

(assert (=> b!933684 (= lt!420430 (addApplyDifferent!413 lt!420450 lt!420442 zeroValue!1173 lt!420429))))

(assert (=> b!933684 (= (apply!806 (+!2825 lt!420450 (tuple2!13323 lt!420442 zeroValue!1173)) lt!420429) (apply!806 lt!420450 lt!420429))))

(declare-fun lt!420443 () Unit!31420)

(assert (=> b!933684 (= lt!420443 lt!420430)))

(declare-fun lt!420432 () ListLongMap!12009)

(assert (=> b!933684 (= lt!420432 (getCurrentListMapNoExtraKeys!3335 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!420433 () (_ BitVec 64))

(assert (=> b!933684 (= lt!420433 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420437 () (_ BitVec 64))

(assert (=> b!933684 (= lt!420437 (select (arr!27027 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!933684 (= lt!420444 (addApplyDifferent!413 lt!420432 lt!420433 minValue!1173 lt!420437))))

(assert (=> b!933684 (= (apply!806 (+!2825 lt!420432 (tuple2!13323 lt!420433 minValue!1173)) lt!420437) (apply!806 lt!420432 lt!420437))))

(declare-fun b!933685 () Bool)

(declare-fun e!524241 () Bool)

(assert (=> b!933685 (= e!524241 (not call!40581))))

(declare-fun b!933686 () Bool)

(assert (=> b!933686 (= e!524240 e!524244)))

(declare-fun res!628930 () Bool)

(assert (=> b!933686 (= res!628930 call!40583)))

(assert (=> b!933686 (=> (not res!628930) (not e!524244))))

(declare-fun b!933687 () Bool)

(declare-fun Unit!31426 () Unit!31420)

(assert (=> b!933687 (= e!524247 Unit!31426)))

(declare-fun b!933688 () Bool)

(declare-fun call!40582 () ListLongMap!12009)

(assert (=> b!933688 (= e!524246 call!40582)))

(declare-fun b!933689 () Bool)

(assert (=> b!933689 (= e!524249 (validKeyInArray!0 (select (arr!27027 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!933690 () Bool)

(assert (=> b!933690 (= e!524250 call!40582)))

(declare-fun b!933691 () Bool)

(declare-fun res!628928 () Bool)

(assert (=> b!933691 (=> (not res!628928) (not e!524245))))

(assert (=> b!933691 (= res!628928 e!524241)))

(declare-fun c!97034 () Bool)

(assert (=> b!933691 (= c!97034 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!933692 () Bool)

(assert (=> b!933692 (= e!524245 e!524240)))

(declare-fun c!97032 () Bool)

(assert (=> b!933692 (= c!97032 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!933693 () Bool)

(declare-fun e!524243 () Bool)

(assert (=> b!933693 (= e!524241 e!524243)))

(declare-fun res!628925 () Bool)

(assert (=> b!933693 (= res!628925 call!40581)))

(assert (=> b!933693 (=> (not res!628925) (not e!524243))))

(declare-fun b!933682 () Bool)

(declare-fun c!97033 () Bool)

(assert (=> b!933682 (= c!97033 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!933682 (= e!524246 e!524250)))

(declare-fun d!112895 () Bool)

(assert (=> d!112895 e!524245))

(declare-fun res!628923 () Bool)

(assert (=> d!112895 (=> (not res!628923) (not e!524245))))

(assert (=> d!112895 (= res!628923 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27488 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27488 _keys!1487)))))))

(declare-fun lt!420431 () ListLongMap!12009)

(assert (=> d!112895 (= lt!420448 lt!420431)))

(declare-fun lt!420438 () Unit!31420)

(assert (=> d!112895 (= lt!420438 e!524247)))

(declare-fun c!97036 () Bool)

(assert (=> d!112895 (= c!97036 e!524251)))

(declare-fun res!628924 () Bool)

(assert (=> d!112895 (=> (not res!628924) (not e!524251))))

(assert (=> d!112895 (= res!628924 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27488 _keys!1487)))))

(assert (=> d!112895 (= lt!420431 e!524242)))

(declare-fun c!97037 () Bool)

(assert (=> d!112895 (= c!97037 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112895 (validMask!0 mask!1881)))

(assert (=> d!112895 (= (getCurrentListMap!3191 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!420448)))

(declare-fun b!933694 () Bool)

(assert (=> b!933694 (= e!524248 (= (apply!806 lt!420448 (select (arr!27027 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14231 (select (arr!27026 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1581 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!933694 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27487 _values!1231)))))

(assert (=> b!933694 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27488 _keys!1487)))))

(declare-fun bm!40581 () Bool)

(assert (=> bm!40581 (= call!40580 (+!2825 (ite c!97037 call!40579 (ite c!97035 call!40584 call!40585)) (ite (or c!97037 c!97035) (tuple2!13323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun bm!40582 () Bool)

(assert (=> bm!40582 (= call!40582 call!40580)))

(declare-fun b!933695 () Bool)

(assert (=> b!933695 (= e!524243 (= (apply!806 lt!420448 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(assert (= (and d!112895 c!97037) b!933676))

(assert (= (and d!112895 (not c!97037)) b!933675))

(assert (= (and b!933675 c!97035) b!933688))

(assert (= (and b!933675 (not c!97035)) b!933682))

(assert (= (and b!933682 c!97033) b!933690))

(assert (= (and b!933682 (not c!97033)) b!933677))

(assert (= (or b!933690 b!933677) bm!40576))

(assert (= (or b!933688 bm!40576) bm!40577))

(assert (= (or b!933688 b!933690) bm!40582))

(assert (= (or b!933676 bm!40577) bm!40579))

(assert (= (or b!933676 bm!40582) bm!40581))

(assert (= (and d!112895 res!628924) b!933683))

(assert (= (and d!112895 c!97036) b!933684))

(assert (= (and d!112895 (not c!97036)) b!933687))

(assert (= (and d!112895 res!628923) b!933678))

(assert (= (and b!933678 res!628927) b!933689))

(assert (= (and b!933678 (not res!628926)) b!933681))

(assert (= (and b!933681 res!628931) b!933694))

(assert (= (and b!933678 res!628929) b!933691))

(assert (= (and b!933691 c!97034) b!933693))

(assert (= (and b!933691 (not c!97034)) b!933685))

(assert (= (and b!933693 res!628925) b!933695))

(assert (= (or b!933693 b!933685) bm!40578))

(assert (= (and b!933691 res!628928) b!933692))

(assert (= (and b!933692 c!97032) b!933686))

(assert (= (and b!933692 (not c!97032)) b!933679))

(assert (= (and b!933686 res!628930) b!933680))

(assert (= (or b!933686 b!933679) bm!40580))

(declare-fun b_lambda!13947 () Bool)

(assert (=> (not b_lambda!13947) (not b!933694)))

(assert (=> b!933694 t!27228))

(declare-fun b_and!28791 () Bool)

(assert (= b_and!28781 (and (=> t!27228 result!11851) b_and!28791)))

(declare-fun m!867341 () Bool)

(assert (=> b!933676 m!867341))

(assert (=> b!933683 m!867189))

(assert (=> b!933683 m!867189))

(declare-fun m!867343 () Bool)

(assert (=> b!933683 m!867343))

(declare-fun m!867345 () Bool)

(assert (=> b!933680 m!867345))

(declare-fun m!867347 () Bool)

(assert (=> bm!40581 m!867347))

(assert (=> b!933694 m!867201))

(assert (=> b!933694 m!867199))

(assert (=> b!933694 m!867189))

(assert (=> b!933694 m!867189))

(declare-fun m!867349 () Bool)

(assert (=> b!933694 m!867349))

(assert (=> b!933694 m!867199))

(assert (=> b!933694 m!867201))

(assert (=> b!933694 m!867205))

(declare-fun m!867351 () Bool)

(assert (=> bm!40580 m!867351))

(declare-fun m!867353 () Bool)

(assert (=> bm!40579 m!867353))

(declare-fun m!867355 () Bool)

(assert (=> b!933684 m!867355))

(declare-fun m!867357 () Bool)

(assert (=> b!933684 m!867357))

(declare-fun m!867359 () Bool)

(assert (=> b!933684 m!867359))

(declare-fun m!867361 () Bool)

(assert (=> b!933684 m!867361))

(declare-fun m!867363 () Bool)

(assert (=> b!933684 m!867363))

(declare-fun m!867365 () Bool)

(assert (=> b!933684 m!867365))

(declare-fun m!867367 () Bool)

(assert (=> b!933684 m!867367))

(assert (=> b!933684 m!867361))

(declare-fun m!867369 () Bool)

(assert (=> b!933684 m!867369))

(assert (=> b!933684 m!867353))

(declare-fun m!867371 () Bool)

(assert (=> b!933684 m!867371))

(assert (=> b!933684 m!867189))

(declare-fun m!867373 () Bool)

(assert (=> b!933684 m!867373))

(declare-fun m!867375 () Bool)

(assert (=> b!933684 m!867375))

(assert (=> b!933684 m!867367))

(declare-fun m!867377 () Bool)

(assert (=> b!933684 m!867377))

(assert (=> b!933684 m!867375))

(declare-fun m!867379 () Bool)

(assert (=> b!933684 m!867379))

(declare-fun m!867381 () Bool)

(assert (=> b!933684 m!867381))

(declare-fun m!867383 () Bool)

(assert (=> b!933684 m!867383))

(assert (=> b!933684 m!867357))

(declare-fun m!867385 () Bool)

(assert (=> bm!40578 m!867385))

(assert (=> d!112895 m!867231))

(declare-fun m!867387 () Bool)

(assert (=> b!933695 m!867387))

(assert (=> b!933689 m!867189))

(assert (=> b!933689 m!867189))

(assert (=> b!933689 m!867343))

(assert (=> b!933681 m!867189))

(assert (=> b!933681 m!867189))

(declare-fun m!867389 () Bool)

(assert (=> b!933681 m!867389))

(assert (=> b!933531 d!112895))

(declare-fun b!933696 () Bool)

(declare-fun e!524255 () ListLongMap!12009)

(declare-fun e!524259 () ListLongMap!12009)

(assert (=> b!933696 (= e!524255 e!524259)))

(declare-fun c!97041 () Bool)

(assert (=> b!933696 (= c!97041 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40583 () Bool)

(declare-fun call!40592 () ListLongMap!12009)

(declare-fun call!40591 () ListLongMap!12009)

(assert (=> bm!40583 (= call!40592 call!40591)))

(declare-fun b!933697 () Bool)

(declare-fun call!40587 () ListLongMap!12009)

(assert (=> b!933697 (= e!524255 (+!2825 call!40587 (tuple2!13323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!933698 () Bool)

(declare-fun e!524263 () ListLongMap!12009)

(assert (=> b!933698 (= e!524263 call!40592)))

(declare-fun b!933699 () Bool)

(declare-fun res!628938 () Bool)

(declare-fun e!524258 () Bool)

(assert (=> b!933699 (=> (not res!628938) (not e!524258))))

(declare-fun e!524265 () Bool)

(assert (=> b!933699 (= res!628938 e!524265)))

(declare-fun res!628935 () Bool)

(assert (=> b!933699 (=> res!628935 e!524265)))

(declare-fun e!524262 () Bool)

(assert (=> b!933699 (= res!628935 (not e!524262))))

(declare-fun res!628936 () Bool)

(assert (=> b!933699 (=> (not res!628936) (not e!524262))))

(assert (=> b!933699 (= res!628936 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27488 _keys!1487)))))

(declare-fun b!933700 () Bool)

(declare-fun e!524253 () Bool)

(declare-fun call!40590 () Bool)

(assert (=> b!933700 (= e!524253 (not call!40590))))

(declare-fun b!933701 () Bool)

(declare-fun e!524257 () Bool)

(declare-fun lt!420470 () ListLongMap!12009)

(assert (=> b!933701 (= e!524257 (= (apply!806 lt!420470 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40584 () Bool)

(declare-fun call!40586 () ListLongMap!12009)

(assert (=> bm!40584 (= call!40591 call!40586)))

(declare-fun bm!40585 () Bool)

(declare-fun call!40588 () Bool)

(assert (=> bm!40585 (= call!40588 (contains!5016 lt!420470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!933702 () Bool)

(declare-fun e!524261 () Bool)

(assert (=> b!933702 (= e!524265 e!524261)))

(declare-fun res!628940 () Bool)

(assert (=> b!933702 (=> (not res!628940) (not e!524261))))

(assert (=> b!933702 (= res!628940 (contains!5016 lt!420470 (select (arr!27027 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!933702 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27488 _keys!1487)))))

(declare-fun bm!40586 () Bool)

(assert (=> bm!40586 (= call!40586 (getCurrentListMapNoExtraKeys!3335 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun b!933704 () Bool)

(declare-fun e!524264 () Bool)

(assert (=> b!933704 (= e!524264 (validKeyInArray!0 (select (arr!27027 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun bm!40587 () Bool)

(assert (=> bm!40587 (= call!40590 (contains!5016 lt!420470 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!933705 () Bool)

(declare-fun e!524260 () Unit!31420)

(declare-fun lt!420466 () Unit!31420)

(assert (=> b!933705 (= e!524260 lt!420466)))

(declare-fun lt!420469 () ListLongMap!12009)

(assert (=> b!933705 (= lt!420469 (getCurrentListMapNoExtraKeys!3335 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!420463 () (_ BitVec 64))

(assert (=> b!933705 (= lt!420463 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420457 () (_ BitVec 64))

(assert (=> b!933705 (= lt!420457 (select (arr!27027 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!420467 () Unit!31420)

(assert (=> b!933705 (= lt!420467 (addStillContains!514 lt!420469 lt!420463 zeroValue!1173 lt!420457))))

(assert (=> b!933705 (contains!5016 (+!2825 lt!420469 (tuple2!13323 lt!420463 zeroValue!1173)) lt!420457)))

(declare-fun lt!420462 () Unit!31420)

(assert (=> b!933705 (= lt!420462 lt!420467)))

(declare-fun lt!420461 () ListLongMap!12009)

(assert (=> b!933705 (= lt!420461 (getCurrentListMapNoExtraKeys!3335 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!420468 () (_ BitVec 64))

(assert (=> b!933705 (= lt!420468 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420458 () (_ BitVec 64))

(assert (=> b!933705 (= lt!420458 (select (arr!27027 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!420456 () Unit!31420)

(assert (=> b!933705 (= lt!420456 (addApplyDifferent!413 lt!420461 lt!420468 minValue!1173 lt!420458))))

(assert (=> b!933705 (= (apply!806 (+!2825 lt!420461 (tuple2!13323 lt!420468 minValue!1173)) lt!420458) (apply!806 lt!420461 lt!420458))))

(declare-fun lt!420471 () Unit!31420)

(assert (=> b!933705 (= lt!420471 lt!420456)))

(declare-fun lt!420472 () ListLongMap!12009)

(assert (=> b!933705 (= lt!420472 (getCurrentListMapNoExtraKeys!3335 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!420464 () (_ BitVec 64))

(assert (=> b!933705 (= lt!420464 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420451 () (_ BitVec 64))

(assert (=> b!933705 (= lt!420451 (select (arr!27027 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!420452 () Unit!31420)

(assert (=> b!933705 (= lt!420452 (addApplyDifferent!413 lt!420472 lt!420464 zeroValue!1173 lt!420451))))

(assert (=> b!933705 (= (apply!806 (+!2825 lt!420472 (tuple2!13323 lt!420464 zeroValue!1173)) lt!420451) (apply!806 lt!420472 lt!420451))))

(declare-fun lt!420465 () Unit!31420)

(assert (=> b!933705 (= lt!420465 lt!420452)))

(declare-fun lt!420454 () ListLongMap!12009)

(assert (=> b!933705 (= lt!420454 (getCurrentListMapNoExtraKeys!3335 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!420455 () (_ BitVec 64))

(assert (=> b!933705 (= lt!420455 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420459 () (_ BitVec 64))

(assert (=> b!933705 (= lt!420459 (select (arr!27027 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!933705 (= lt!420466 (addApplyDifferent!413 lt!420454 lt!420455 minValue!1173 lt!420459))))

(assert (=> b!933705 (= (apply!806 (+!2825 lt!420454 (tuple2!13323 lt!420455 minValue!1173)) lt!420459) (apply!806 lt!420454 lt!420459))))

(declare-fun b!933706 () Bool)

(declare-fun e!524254 () Bool)

(assert (=> b!933706 (= e!524254 (not call!40588))))

(declare-fun b!933707 () Bool)

(assert (=> b!933707 (= e!524253 e!524257)))

(declare-fun res!628939 () Bool)

(assert (=> b!933707 (= res!628939 call!40590)))

(assert (=> b!933707 (=> (not res!628939) (not e!524257))))

(declare-fun b!933708 () Bool)

(declare-fun Unit!31427 () Unit!31420)

(assert (=> b!933708 (= e!524260 Unit!31427)))

(declare-fun b!933709 () Bool)

(declare-fun call!40589 () ListLongMap!12009)

(assert (=> b!933709 (= e!524259 call!40589)))

(declare-fun b!933710 () Bool)

(assert (=> b!933710 (= e!524262 (validKeyInArray!0 (select (arr!27027 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!933711 () Bool)

(assert (=> b!933711 (= e!524263 call!40589)))

(declare-fun b!933712 () Bool)

(declare-fun res!628937 () Bool)

(assert (=> b!933712 (=> (not res!628937) (not e!524258))))

(assert (=> b!933712 (= res!628937 e!524254)))

(declare-fun c!97040 () Bool)

(assert (=> b!933712 (= c!97040 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!933713 () Bool)

(assert (=> b!933713 (= e!524258 e!524253)))

(declare-fun c!97038 () Bool)

(assert (=> b!933713 (= c!97038 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!933714 () Bool)

(declare-fun e!524256 () Bool)

(assert (=> b!933714 (= e!524254 e!524256)))

(declare-fun res!628934 () Bool)

(assert (=> b!933714 (= res!628934 call!40588)))

(assert (=> b!933714 (=> (not res!628934) (not e!524256))))

(declare-fun b!933703 () Bool)

(declare-fun c!97039 () Bool)

(assert (=> b!933703 (= c!97039 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!933703 (= e!524259 e!524263)))

(declare-fun d!112897 () Bool)

(assert (=> d!112897 e!524258))

(declare-fun res!628932 () Bool)

(assert (=> d!112897 (=> (not res!628932) (not e!524258))))

(assert (=> d!112897 (= res!628932 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27488 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27488 _keys!1487)))))))

(declare-fun lt!420453 () ListLongMap!12009)

(assert (=> d!112897 (= lt!420470 lt!420453)))

(declare-fun lt!420460 () Unit!31420)

(assert (=> d!112897 (= lt!420460 e!524260)))

(declare-fun c!97042 () Bool)

(assert (=> d!112897 (= c!97042 e!524264)))

(declare-fun res!628933 () Bool)

(assert (=> d!112897 (=> (not res!628933) (not e!524264))))

(assert (=> d!112897 (= res!628933 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27488 _keys!1487)))))

(assert (=> d!112897 (= lt!420453 e!524255)))

(declare-fun c!97043 () Bool)

(assert (=> d!112897 (= c!97043 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112897 (validMask!0 mask!1881)))

(assert (=> d!112897 (= (getCurrentListMap!3191 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420470)))

(declare-fun b!933715 () Bool)

(assert (=> b!933715 (= e!524261 (= (apply!806 lt!420470 (select (arr!27027 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14231 (select (arr!27026 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1581 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!933715 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27487 _values!1231)))))

(assert (=> b!933715 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27488 _keys!1487)))))

(declare-fun bm!40588 () Bool)

(assert (=> bm!40588 (= call!40587 (+!2825 (ite c!97043 call!40586 (ite c!97041 call!40591 call!40592)) (ite (or c!97043 c!97041) (tuple2!13323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun bm!40589 () Bool)

(assert (=> bm!40589 (= call!40589 call!40587)))

(declare-fun b!933716 () Bool)

(assert (=> b!933716 (= e!524256 (= (apply!806 lt!420470 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(assert (= (and d!112897 c!97043) b!933697))

(assert (= (and d!112897 (not c!97043)) b!933696))

(assert (= (and b!933696 c!97041) b!933709))

(assert (= (and b!933696 (not c!97041)) b!933703))

(assert (= (and b!933703 c!97039) b!933711))

(assert (= (and b!933703 (not c!97039)) b!933698))

(assert (= (or b!933711 b!933698) bm!40583))

(assert (= (or b!933709 bm!40583) bm!40584))

(assert (= (or b!933709 b!933711) bm!40589))

(assert (= (or b!933697 bm!40584) bm!40586))

(assert (= (or b!933697 bm!40589) bm!40588))

(assert (= (and d!112897 res!628933) b!933704))

(assert (= (and d!112897 c!97042) b!933705))

(assert (= (and d!112897 (not c!97042)) b!933708))

(assert (= (and d!112897 res!628932) b!933699))

(assert (= (and b!933699 res!628936) b!933710))

(assert (= (and b!933699 (not res!628935)) b!933702))

(assert (= (and b!933702 res!628940) b!933715))

(assert (= (and b!933699 res!628938) b!933712))

(assert (= (and b!933712 c!97040) b!933714))

(assert (= (and b!933712 (not c!97040)) b!933706))

(assert (= (and b!933714 res!628934) b!933716))

(assert (= (or b!933714 b!933706) bm!40585))

(assert (= (and b!933712 res!628937) b!933713))

(assert (= (and b!933713 c!97038) b!933707))

(assert (= (and b!933713 (not c!97038)) b!933700))

(assert (= (and b!933707 res!628939) b!933701))

(assert (= (or b!933707 b!933700) bm!40587))

(declare-fun b_lambda!13949 () Bool)

(assert (=> (not b_lambda!13949) (not b!933715)))

(assert (=> b!933715 t!27228))

(declare-fun b_and!28793 () Bool)

(assert (= b_and!28791 (and (=> t!27228 result!11851) b_and!28793)))

(declare-fun m!867391 () Bool)

(assert (=> b!933697 m!867391))

(declare-fun m!867393 () Bool)

(assert (=> b!933704 m!867393))

(assert (=> b!933704 m!867393))

(declare-fun m!867395 () Bool)

(assert (=> b!933704 m!867395))

(declare-fun m!867397 () Bool)

(assert (=> b!933701 m!867397))

(declare-fun m!867399 () Bool)

(assert (=> bm!40588 m!867399))

(assert (=> b!933715 m!867201))

(declare-fun m!867401 () Bool)

(assert (=> b!933715 m!867401))

(assert (=> b!933715 m!867393))

(assert (=> b!933715 m!867393))

(declare-fun m!867403 () Bool)

(assert (=> b!933715 m!867403))

(assert (=> b!933715 m!867401))

(assert (=> b!933715 m!867201))

(declare-fun m!867405 () Bool)

(assert (=> b!933715 m!867405))

(declare-fun m!867407 () Bool)

(assert (=> bm!40587 m!867407))

(declare-fun m!867409 () Bool)

(assert (=> bm!40586 m!867409))

(declare-fun m!867411 () Bool)

(assert (=> b!933705 m!867411))

(declare-fun m!867413 () Bool)

(assert (=> b!933705 m!867413))

(declare-fun m!867415 () Bool)

(assert (=> b!933705 m!867415))

(declare-fun m!867417 () Bool)

(assert (=> b!933705 m!867417))

(declare-fun m!867419 () Bool)

(assert (=> b!933705 m!867419))

(declare-fun m!867421 () Bool)

(assert (=> b!933705 m!867421))

(declare-fun m!867423 () Bool)

(assert (=> b!933705 m!867423))

(assert (=> b!933705 m!867417))

(declare-fun m!867425 () Bool)

(assert (=> b!933705 m!867425))

(assert (=> b!933705 m!867409))

(declare-fun m!867427 () Bool)

(assert (=> b!933705 m!867427))

(assert (=> b!933705 m!867393))

(declare-fun m!867429 () Bool)

(assert (=> b!933705 m!867429))

(declare-fun m!867431 () Bool)

(assert (=> b!933705 m!867431))

(assert (=> b!933705 m!867423))

(declare-fun m!867433 () Bool)

(assert (=> b!933705 m!867433))

(assert (=> b!933705 m!867431))

(declare-fun m!867435 () Bool)

(assert (=> b!933705 m!867435))

(declare-fun m!867437 () Bool)

(assert (=> b!933705 m!867437))

(declare-fun m!867439 () Bool)

(assert (=> b!933705 m!867439))

(assert (=> b!933705 m!867413))

(declare-fun m!867441 () Bool)

(assert (=> bm!40585 m!867441))

(assert (=> d!112897 m!867231))

(declare-fun m!867443 () Bool)

(assert (=> b!933716 m!867443))

(assert (=> b!933710 m!867393))

(assert (=> b!933710 m!867393))

(assert (=> b!933710 m!867395))

(assert (=> b!933702 m!867393))

(assert (=> b!933702 m!867393))

(declare-fun m!867445 () Bool)

(assert (=> b!933702 m!867445))

(assert (=> b!933531 d!112897))

(declare-fun d!112899 () Bool)

(declare-fun e!524268 () Bool)

(assert (=> d!112899 e!524268))

(declare-fun res!628946 () Bool)

(assert (=> d!112899 (=> (not res!628946) (not e!524268))))

(declare-fun lt!420481 () ListLongMap!12009)

(assert (=> d!112899 (= res!628946 (contains!5016 lt!420481 (_1!6672 lt!420331)))))

(declare-fun lt!420482 () List!19071)

(assert (=> d!112899 (= lt!420481 (ListLongMap!12010 lt!420482))))

(declare-fun lt!420483 () Unit!31420)

(declare-fun lt!420484 () Unit!31420)

(assert (=> d!112899 (= lt!420483 lt!420484)))

(declare-datatypes ((Option!488 0))(
  ( (Some!487 (v!12637 V!31807)) (None!486) )
))
(declare-fun getValueByKey!482 (List!19071 (_ BitVec 64)) Option!488)

(assert (=> d!112899 (= (getValueByKey!482 lt!420482 (_1!6672 lt!420331)) (Some!487 (_2!6672 lt!420331)))))

(declare-fun lemmaContainsTupThenGetReturnValue!256 (List!19071 (_ BitVec 64) V!31807) Unit!31420)

(assert (=> d!112899 (= lt!420484 (lemmaContainsTupThenGetReturnValue!256 lt!420482 (_1!6672 lt!420331) (_2!6672 lt!420331)))))

(declare-fun insertStrictlySorted!313 (List!19071 (_ BitVec 64) V!31807) List!19071)

(assert (=> d!112899 (= lt!420482 (insertStrictlySorted!313 (toList!6020 lt!420335) (_1!6672 lt!420331) (_2!6672 lt!420331)))))

(assert (=> d!112899 (= (+!2825 lt!420335 lt!420331) lt!420481)))

(declare-fun b!933721 () Bool)

(declare-fun res!628945 () Bool)

(assert (=> b!933721 (=> (not res!628945) (not e!524268))))

(assert (=> b!933721 (= res!628945 (= (getValueByKey!482 (toList!6020 lt!420481) (_1!6672 lt!420331)) (Some!487 (_2!6672 lt!420331))))))

(declare-fun b!933722 () Bool)

(declare-fun contains!5019 (List!19071 tuple2!13322) Bool)

(assert (=> b!933722 (= e!524268 (contains!5019 (toList!6020 lt!420481) lt!420331))))

(assert (= (and d!112899 res!628946) b!933721))

(assert (= (and b!933721 res!628945) b!933722))

(declare-fun m!867447 () Bool)

(assert (=> d!112899 m!867447))

(declare-fun m!867449 () Bool)

(assert (=> d!112899 m!867449))

(declare-fun m!867451 () Bool)

(assert (=> d!112899 m!867451))

(declare-fun m!867453 () Bool)

(assert (=> d!112899 m!867453))

(declare-fun m!867455 () Bool)

(assert (=> b!933721 m!867455))

(declare-fun m!867457 () Bool)

(assert (=> b!933722 m!867457))

(assert (=> b!933531 d!112899))

(declare-fun d!112901 () Bool)

(declare-fun e!524269 () Bool)

(assert (=> d!112901 e!524269))

(declare-fun res!628948 () Bool)

(assert (=> d!112901 (=> (not res!628948) (not e!524269))))

(declare-fun lt!420485 () ListLongMap!12009)

(assert (=> d!112901 (= res!628948 (contains!5016 lt!420485 (_1!6672 lt!420331)))))

(declare-fun lt!420486 () List!19071)

(assert (=> d!112901 (= lt!420485 (ListLongMap!12010 lt!420486))))

(declare-fun lt!420487 () Unit!31420)

(declare-fun lt!420488 () Unit!31420)

(assert (=> d!112901 (= lt!420487 lt!420488)))

(assert (=> d!112901 (= (getValueByKey!482 lt!420486 (_1!6672 lt!420331)) (Some!487 (_2!6672 lt!420331)))))

(assert (=> d!112901 (= lt!420488 (lemmaContainsTupThenGetReturnValue!256 lt!420486 (_1!6672 lt!420331) (_2!6672 lt!420331)))))

(assert (=> d!112901 (= lt!420486 (insertStrictlySorted!313 (toList!6020 (getCurrentListMap!3191 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6672 lt!420331) (_2!6672 lt!420331)))))

(assert (=> d!112901 (= (+!2825 (getCurrentListMap!3191 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420331) lt!420485)))

(declare-fun b!933723 () Bool)

(declare-fun res!628947 () Bool)

(assert (=> b!933723 (=> (not res!628947) (not e!524269))))

(assert (=> b!933723 (= res!628947 (= (getValueByKey!482 (toList!6020 lt!420485) (_1!6672 lt!420331)) (Some!487 (_2!6672 lt!420331))))))

(declare-fun b!933724 () Bool)

(assert (=> b!933724 (= e!524269 (contains!5019 (toList!6020 lt!420485) lt!420331))))

(assert (= (and d!112901 res!628948) b!933723))

(assert (= (and b!933723 res!628947) b!933724))

(declare-fun m!867459 () Bool)

(assert (=> d!112901 m!867459))

(declare-fun m!867461 () Bool)

(assert (=> d!112901 m!867461))

(declare-fun m!867463 () Bool)

(assert (=> d!112901 m!867463))

(declare-fun m!867465 () Bool)

(assert (=> d!112901 m!867465))

(declare-fun m!867467 () Bool)

(assert (=> b!933723 m!867467))

(declare-fun m!867469 () Bool)

(assert (=> b!933724 m!867469))

(assert (=> b!933531 d!112901))

(declare-fun d!112903 () Bool)

(declare-fun e!524272 () Bool)

(assert (=> d!112903 e!524272))

(declare-fun res!628951 () Bool)

(assert (=> d!112903 (=> (not res!628951) (not e!524272))))

(assert (=> d!112903 (= res!628951 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27488 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27487 _values!1231))))))

(declare-fun lt!420491 () Unit!31420)

(declare-fun choose!1550 (array!56165 array!56163 (_ BitVec 32) (_ BitVec 32) V!31807 V!31807 (_ BitVec 32) Int) Unit!31420)

(assert (=> d!112903 (= lt!420491 (choose!1550 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!112903 (validMask!0 mask!1881)))

(assert (=> d!112903 (= (lemmaListMapRecursiveValidKeyArray!189 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!420491)))

(declare-fun b!933727 () Bool)

(assert (=> b!933727 (= e!524272 (= (getCurrentListMap!3191 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2825 (getCurrentListMap!3191 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13323 (select (arr!27027 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14231 (select (arr!27026 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1581 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!112903 res!628951) b!933727))

(declare-fun b_lambda!13951 () Bool)

(assert (=> (not b_lambda!13951) (not b!933727)))

(assert (=> b!933727 t!27228))

(declare-fun b_and!28795 () Bool)

(assert (= b_and!28793 (and (=> t!27228 result!11851) b_and!28795)))

(declare-fun m!867471 () Bool)

(assert (=> d!112903 m!867471))

(assert (=> d!112903 m!867231))

(declare-fun m!867473 () Bool)

(assert (=> b!933727 m!867473))

(assert (=> b!933727 m!867199))

(assert (=> b!933727 m!867201))

(assert (=> b!933727 m!867205))

(assert (=> b!933727 m!867211))

(assert (=> b!933727 m!867201))

(assert (=> b!933727 m!867189))

(assert (=> b!933727 m!867199))

(assert (=> b!933727 m!867473))

(declare-fun m!867475 () Bool)

(assert (=> b!933727 m!867475))

(assert (=> b!933531 d!112903))

(declare-fun b!933738 () Bool)

(declare-fun e!524284 () Bool)

(declare-fun e!524282 () Bool)

(assert (=> b!933738 (= e!524284 e!524282)))

(declare-fun c!97046 () Bool)

(assert (=> b!933738 (= c!97046 (validKeyInArray!0 (select (arr!27027 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun d!112905 () Bool)

(declare-fun res!628959 () Bool)

(declare-fun e!524283 () Bool)

(assert (=> d!112905 (=> res!628959 e!524283)))

(assert (=> d!112905 (= res!628959 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27488 _keys!1487)))))

(assert (=> d!112905 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19069) e!524283)))

(declare-fun b!933739 () Bool)

(assert (=> b!933739 (= e!524283 e!524284)))

(declare-fun res!628958 () Bool)

(assert (=> b!933739 (=> (not res!628958) (not e!524284))))

(declare-fun e!524281 () Bool)

(assert (=> b!933739 (= res!628958 (not e!524281))))

(declare-fun res!628960 () Bool)

(assert (=> b!933739 (=> (not res!628960) (not e!524281))))

(assert (=> b!933739 (= res!628960 (validKeyInArray!0 (select (arr!27027 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!933740 () Bool)

(declare-fun contains!5020 (List!19072 (_ BitVec 64)) Bool)

(assert (=> b!933740 (= e!524281 (contains!5020 Nil!19069 (select (arr!27027 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun bm!40592 () Bool)

(declare-fun call!40595 () Bool)

(assert (=> bm!40592 (= call!40595 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97046 (Cons!19068 (select (arr!27027 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19069) Nil!19069)))))

(declare-fun b!933741 () Bool)

(assert (=> b!933741 (= e!524282 call!40595)))

(declare-fun b!933742 () Bool)

(assert (=> b!933742 (= e!524282 call!40595)))

(assert (= (and d!112905 (not res!628959)) b!933739))

(assert (= (and b!933739 res!628960) b!933740))

(assert (= (and b!933739 res!628958) b!933738))

(assert (= (and b!933738 c!97046) b!933741))

(assert (= (and b!933738 (not c!97046)) b!933742))

(assert (= (or b!933741 b!933742) bm!40592))

(assert (=> b!933738 m!867189))

(assert (=> b!933738 m!867189))

(assert (=> b!933738 m!867343))

(assert (=> b!933739 m!867189))

(assert (=> b!933739 m!867189))

(assert (=> b!933739 m!867343))

(assert (=> b!933740 m!867189))

(assert (=> b!933740 m!867189))

(declare-fun m!867477 () Bool)

(assert (=> b!933740 m!867477))

(assert (=> bm!40592 m!867189))

(declare-fun m!867479 () Bool)

(assert (=> bm!40592 m!867479))

(assert (=> b!933531 d!112905))

(declare-fun d!112907 () Bool)

(assert (=> d!112907 (contains!5016 (+!2825 lt!420335 (tuple2!13323 lt!420329 lt!420333)) k0!1099)))

(declare-fun lt!420494 () Unit!31420)

(declare-fun choose!1551 (ListLongMap!12009 (_ BitVec 64) V!31807 (_ BitVec 64)) Unit!31420)

(assert (=> d!112907 (= lt!420494 (choose!1551 lt!420335 lt!420329 lt!420333 k0!1099))))

(assert (=> d!112907 (contains!5016 lt!420335 k0!1099)))

(assert (=> d!112907 (= (addStillContains!514 lt!420335 lt!420329 lt!420333 k0!1099) lt!420494)))

(declare-fun bs!26194 () Bool)

(assert (= bs!26194 d!112907))

(declare-fun m!867481 () Bool)

(assert (=> bs!26194 m!867481))

(assert (=> bs!26194 m!867481))

(declare-fun m!867483 () Bool)

(assert (=> bs!26194 m!867483))

(declare-fun m!867485 () Bool)

(assert (=> bs!26194 m!867485))

(assert (=> bs!26194 m!867227))

(assert (=> b!933531 d!112907))

(declare-fun d!112909 () Bool)

(declare-fun e!524287 () Bool)

(assert (=> d!112909 e!524287))

(declare-fun c!97049 () Bool)

(assert (=> d!112909 (= c!97049 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!420497 () Unit!31420)

(declare-fun choose!1552 (array!56165 array!56163 (_ BitVec 32) (_ BitVec 32) V!31807 V!31807 (_ BitVec 64) (_ BitVec 32) Int) Unit!31420)

(assert (=> d!112909 (= lt!420497 (choose!1552 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!112909 (validMask!0 mask!1881)))

(assert (=> d!112909 (= (lemmaListMapContainsThenArrayContainsFrom!272 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!420497)))

(declare-fun b!933748 () Bool)

(assert (=> b!933748 (= e!524287 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!933749 () Bool)

(assert (=> b!933749 (= e!524287 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112909 c!97049) b!933748))

(assert (= (and d!112909 (not c!97049)) b!933749))

(declare-fun m!867487 () Bool)

(assert (=> d!112909 m!867487))

(assert (=> d!112909 m!867231))

(assert (=> b!933748 m!867225))

(assert (=> b!933531 d!112909))

(declare-fun d!112911 () Bool)

(declare-fun e!524293 () Bool)

(assert (=> d!112911 e!524293))

(declare-fun res!628963 () Bool)

(assert (=> d!112911 (=> res!628963 e!524293)))

(declare-fun lt!420508 () Bool)

(assert (=> d!112911 (= res!628963 (not lt!420508))))

(declare-fun lt!420507 () Bool)

(assert (=> d!112911 (= lt!420508 lt!420507)))

(declare-fun lt!420509 () Unit!31420)

(declare-fun e!524292 () Unit!31420)

(assert (=> d!112911 (= lt!420509 e!524292)))

(declare-fun c!97052 () Bool)

(assert (=> d!112911 (= c!97052 lt!420507)))

(declare-fun containsKey!446 (List!19071 (_ BitVec 64)) Bool)

(assert (=> d!112911 (= lt!420507 (containsKey!446 (toList!6020 (+!2825 lt!420335 lt!420331)) k0!1099))))

(assert (=> d!112911 (= (contains!5016 (+!2825 lt!420335 lt!420331) k0!1099) lt!420508)))

(declare-fun b!933756 () Bool)

(declare-fun lt!420506 () Unit!31420)

(assert (=> b!933756 (= e!524292 lt!420506)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!341 (List!19071 (_ BitVec 64)) Unit!31420)

(assert (=> b!933756 (= lt!420506 (lemmaContainsKeyImpliesGetValueByKeyDefined!341 (toList!6020 (+!2825 lt!420335 lt!420331)) k0!1099))))

(declare-fun isDefined!354 (Option!488) Bool)

(assert (=> b!933756 (isDefined!354 (getValueByKey!482 (toList!6020 (+!2825 lt!420335 lt!420331)) k0!1099))))

(declare-fun b!933757 () Bool)

(declare-fun Unit!31428 () Unit!31420)

(assert (=> b!933757 (= e!524292 Unit!31428)))

(declare-fun b!933758 () Bool)

(assert (=> b!933758 (= e!524293 (isDefined!354 (getValueByKey!482 (toList!6020 (+!2825 lt!420335 lt!420331)) k0!1099)))))

(assert (= (and d!112911 c!97052) b!933756))

(assert (= (and d!112911 (not c!97052)) b!933757))

(assert (= (and d!112911 (not res!628963)) b!933758))

(declare-fun m!867489 () Bool)

(assert (=> d!112911 m!867489))

(declare-fun m!867491 () Bool)

(assert (=> b!933756 m!867491))

(declare-fun m!867493 () Bool)

(assert (=> b!933756 m!867493))

(assert (=> b!933756 m!867493))

(declare-fun m!867495 () Bool)

(assert (=> b!933756 m!867495))

(assert (=> b!933758 m!867493))

(assert (=> b!933758 m!867493))

(assert (=> b!933758 m!867495))

(assert (=> b!933531 d!112911))

(declare-fun d!112913 () Bool)

(declare-fun c!97055 () Bool)

(assert (=> d!112913 (= c!97055 ((_ is ValueCellFull!9584) (select (arr!27026 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!524296 () V!31807)

(assert (=> d!112913 (= (get!14231 (select (arr!27026 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1581 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!524296)))

(declare-fun b!933763 () Bool)

(declare-fun get!14234 (ValueCell!9584 V!31807) V!31807)

(assert (=> b!933763 (= e!524296 (get!14234 (select (arr!27026 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1581 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!933764 () Bool)

(declare-fun get!14235 (ValueCell!9584 V!31807) V!31807)

(assert (=> b!933764 (= e!524296 (get!14235 (select (arr!27026 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1581 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112913 c!97055) b!933763))

(assert (= (and d!112913 (not c!97055)) b!933764))

(assert (=> b!933763 m!867199))

(assert (=> b!933763 m!867201))

(declare-fun m!867497 () Bool)

(assert (=> b!933763 m!867497))

(assert (=> b!933764 m!867199))

(assert (=> b!933764 m!867201))

(declare-fun m!867499 () Bool)

(assert (=> b!933764 m!867499))

(assert (=> b!933531 d!112913))

(declare-fun d!112915 () Bool)

(assert (=> d!112915 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19069)))

(declare-fun lt!420512 () Unit!31420)

(declare-fun choose!39 (array!56165 (_ BitVec 32) (_ BitVec 32)) Unit!31420)

(assert (=> d!112915 (= lt!420512 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!112915 (bvslt (size!27488 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!112915 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!420512)))

(declare-fun bs!26195 () Bool)

(assert (= bs!26195 d!112915))

(assert (=> bs!26195 m!867207))

(declare-fun m!867501 () Bool)

(assert (=> bs!26195 m!867501))

(assert (=> b!933531 d!112915))

(declare-fun b!933765 () Bool)

(declare-fun e!524300 () Bool)

(declare-fun e!524298 () Bool)

(assert (=> b!933765 (= e!524300 e!524298)))

(declare-fun c!97056 () Bool)

(assert (=> b!933765 (= c!97056 (validKeyInArray!0 (select (arr!27027 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun d!112917 () Bool)

(declare-fun res!628965 () Bool)

(declare-fun e!524299 () Bool)

(assert (=> d!112917 (=> res!628965 e!524299)))

(assert (=> d!112917 (= res!628965 (bvsge #b00000000000000000000000000000000 (size!27488 _keys!1487)))))

(assert (=> d!112917 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19069) e!524299)))

(declare-fun b!933766 () Bool)

(assert (=> b!933766 (= e!524299 e!524300)))

(declare-fun res!628964 () Bool)

(assert (=> b!933766 (=> (not res!628964) (not e!524300))))

(declare-fun e!524297 () Bool)

(assert (=> b!933766 (= res!628964 (not e!524297))))

(declare-fun res!628966 () Bool)

(assert (=> b!933766 (=> (not res!628966) (not e!524297))))

(assert (=> b!933766 (= res!628966 (validKeyInArray!0 (select (arr!27027 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!933767 () Bool)

(assert (=> b!933767 (= e!524297 (contains!5020 Nil!19069 (select (arr!27027 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40593 () Bool)

(declare-fun call!40596 () Bool)

(assert (=> bm!40593 (= call!40596 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97056 (Cons!19068 (select (arr!27027 _keys!1487) #b00000000000000000000000000000000) Nil!19069) Nil!19069)))))

(declare-fun b!933768 () Bool)

(assert (=> b!933768 (= e!524298 call!40596)))

(declare-fun b!933769 () Bool)

(assert (=> b!933769 (= e!524298 call!40596)))

(assert (= (and d!112917 (not res!628965)) b!933766))

(assert (= (and b!933766 res!628966) b!933767))

(assert (= (and b!933766 res!628964) b!933765))

(assert (= (and b!933765 c!97056) b!933768))

(assert (= (and b!933765 (not c!97056)) b!933769))

(assert (= (or b!933768 b!933769) bm!40593))

(declare-fun m!867503 () Bool)

(assert (=> b!933765 m!867503))

(assert (=> b!933765 m!867503))

(declare-fun m!867505 () Bool)

(assert (=> b!933765 m!867505))

(assert (=> b!933766 m!867503))

(assert (=> b!933766 m!867503))

(assert (=> b!933766 m!867505))

(assert (=> b!933767 m!867503))

(assert (=> b!933767 m!867503))

(declare-fun m!867507 () Bool)

(assert (=> b!933767 m!867507))

(assert (=> bm!40593 m!867503))

(declare-fun m!867509 () Bool)

(assert (=> bm!40593 m!867509))

(assert (=> b!933536 d!112917))

(declare-fun d!112919 () Bool)

(assert (=> d!112919 (= (validKeyInArray!0 lt!420329) (and (not (= lt!420329 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!420329 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!933530 d!112919))

(declare-fun d!112921 () Bool)

(declare-fun res!628971 () Bool)

(declare-fun e!524305 () Bool)

(assert (=> d!112921 (=> res!628971 e!524305)))

(assert (=> d!112921 (= res!628971 (= (select (arr!27027 _keys!1487) from!1844) k0!1099))))

(assert (=> d!112921 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!524305)))

(declare-fun b!933774 () Bool)

(declare-fun e!524306 () Bool)

(assert (=> b!933774 (= e!524305 e!524306)))

(declare-fun res!628972 () Bool)

(assert (=> b!933774 (=> (not res!628972) (not e!524306))))

(assert (=> b!933774 (= res!628972 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27488 _keys!1487)))))

(declare-fun b!933775 () Bool)

(assert (=> b!933775 (= e!524306 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!112921 (not res!628971)) b!933774))

(assert (= (and b!933774 res!628972) b!933775))

(declare-fun m!867511 () Bool)

(assert (=> d!112921 m!867511))

(declare-fun m!867513 () Bool)

(assert (=> b!933775 m!867513))

(assert (=> b!933527 d!112921))

(declare-fun d!112923 () Bool)

(declare-fun e!524308 () Bool)

(assert (=> d!112923 e!524308))

(declare-fun res!628973 () Bool)

(assert (=> d!112923 (=> res!628973 e!524308)))

(declare-fun lt!420515 () Bool)

(assert (=> d!112923 (= res!628973 (not lt!420515))))

(declare-fun lt!420514 () Bool)

(assert (=> d!112923 (= lt!420515 lt!420514)))

(declare-fun lt!420516 () Unit!31420)

(declare-fun e!524307 () Unit!31420)

(assert (=> d!112923 (= lt!420516 e!524307)))

(declare-fun c!97057 () Bool)

(assert (=> d!112923 (= c!97057 lt!420514)))

(assert (=> d!112923 (= lt!420514 (containsKey!446 (toList!6020 lt!420335) k0!1099))))

(assert (=> d!112923 (= (contains!5016 lt!420335 k0!1099) lt!420515)))

(declare-fun b!933776 () Bool)

(declare-fun lt!420513 () Unit!31420)

(assert (=> b!933776 (= e!524307 lt!420513)))

(assert (=> b!933776 (= lt!420513 (lemmaContainsKeyImpliesGetValueByKeyDefined!341 (toList!6020 lt!420335) k0!1099))))

(assert (=> b!933776 (isDefined!354 (getValueByKey!482 (toList!6020 lt!420335) k0!1099))))

(declare-fun b!933777 () Bool)

(declare-fun Unit!31429 () Unit!31420)

(assert (=> b!933777 (= e!524307 Unit!31429)))

(declare-fun b!933778 () Bool)

(assert (=> b!933778 (= e!524308 (isDefined!354 (getValueByKey!482 (toList!6020 lt!420335) k0!1099)))))

(assert (= (and d!112923 c!97057) b!933776))

(assert (= (and d!112923 (not c!97057)) b!933777))

(assert (= (and d!112923 (not res!628973)) b!933778))

(declare-fun m!867515 () Bool)

(assert (=> d!112923 m!867515))

(declare-fun m!867517 () Bool)

(assert (=> b!933776 m!867517))

(declare-fun m!867519 () Bool)

(assert (=> b!933776 m!867519))

(assert (=> b!933776 m!867519))

(declare-fun m!867521 () Bool)

(assert (=> b!933776 m!867521))

(assert (=> b!933778 m!867519))

(assert (=> b!933778 m!867519))

(assert (=> b!933778 m!867521))

(assert (=> b!933524 d!112923))

(declare-fun b!933779 () Bool)

(declare-fun e!524311 () ListLongMap!12009)

(declare-fun e!524315 () ListLongMap!12009)

(assert (=> b!933779 (= e!524311 e!524315)))

(declare-fun c!97061 () Bool)

(assert (=> b!933779 (= c!97061 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40594 () Bool)

(declare-fun call!40603 () ListLongMap!12009)

(declare-fun call!40602 () ListLongMap!12009)

(assert (=> bm!40594 (= call!40603 call!40602)))

(declare-fun b!933780 () Bool)

(declare-fun call!40598 () ListLongMap!12009)

(assert (=> b!933780 (= e!524311 (+!2825 call!40598 (tuple2!13323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!933781 () Bool)

(declare-fun e!524319 () ListLongMap!12009)

(assert (=> b!933781 (= e!524319 call!40603)))

(declare-fun b!933782 () Bool)

(declare-fun res!628980 () Bool)

(declare-fun e!524314 () Bool)

(assert (=> b!933782 (=> (not res!628980) (not e!524314))))

(declare-fun e!524321 () Bool)

(assert (=> b!933782 (= res!628980 e!524321)))

(declare-fun res!628977 () Bool)

(assert (=> b!933782 (=> res!628977 e!524321)))

(declare-fun e!524318 () Bool)

(assert (=> b!933782 (= res!628977 (not e!524318))))

(declare-fun res!628978 () Bool)

(assert (=> b!933782 (=> (not res!628978) (not e!524318))))

(assert (=> b!933782 (= res!628978 (bvslt from!1844 (size!27488 _keys!1487)))))

(declare-fun b!933783 () Bool)

(declare-fun e!524309 () Bool)

(declare-fun call!40601 () Bool)

(assert (=> b!933783 (= e!524309 (not call!40601))))

(declare-fun b!933784 () Bool)

(declare-fun e!524313 () Bool)

(declare-fun lt!420536 () ListLongMap!12009)

(assert (=> b!933784 (= e!524313 (= (apply!806 lt!420536 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40595 () Bool)

(declare-fun call!40597 () ListLongMap!12009)

(assert (=> bm!40595 (= call!40602 call!40597)))

(declare-fun bm!40596 () Bool)

(declare-fun call!40599 () Bool)

(assert (=> bm!40596 (= call!40599 (contains!5016 lt!420536 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!933785 () Bool)

(declare-fun e!524317 () Bool)

(assert (=> b!933785 (= e!524321 e!524317)))

(declare-fun res!628982 () Bool)

(assert (=> b!933785 (=> (not res!628982) (not e!524317))))

(assert (=> b!933785 (= res!628982 (contains!5016 lt!420536 (select (arr!27027 _keys!1487) from!1844)))))

(assert (=> b!933785 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27488 _keys!1487)))))

(declare-fun bm!40597 () Bool)

(assert (=> bm!40597 (= call!40597 (getCurrentListMapNoExtraKeys!3335 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933787 () Bool)

(declare-fun e!524320 () Bool)

(assert (=> b!933787 (= e!524320 (validKeyInArray!0 (select (arr!27027 _keys!1487) from!1844)))))

(declare-fun bm!40598 () Bool)

(assert (=> bm!40598 (= call!40601 (contains!5016 lt!420536 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!933788 () Bool)

(declare-fun e!524316 () Unit!31420)

(declare-fun lt!420532 () Unit!31420)

(assert (=> b!933788 (= e!524316 lt!420532)))

(declare-fun lt!420535 () ListLongMap!12009)

(assert (=> b!933788 (= lt!420535 (getCurrentListMapNoExtraKeys!3335 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!420529 () (_ BitVec 64))

(assert (=> b!933788 (= lt!420529 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420523 () (_ BitVec 64))

(assert (=> b!933788 (= lt!420523 (select (arr!27027 _keys!1487) from!1844))))

(declare-fun lt!420533 () Unit!31420)

(assert (=> b!933788 (= lt!420533 (addStillContains!514 lt!420535 lt!420529 zeroValue!1173 lt!420523))))

(assert (=> b!933788 (contains!5016 (+!2825 lt!420535 (tuple2!13323 lt!420529 zeroValue!1173)) lt!420523)))

(declare-fun lt!420528 () Unit!31420)

(assert (=> b!933788 (= lt!420528 lt!420533)))

(declare-fun lt!420527 () ListLongMap!12009)

(assert (=> b!933788 (= lt!420527 (getCurrentListMapNoExtraKeys!3335 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!420534 () (_ BitVec 64))

(assert (=> b!933788 (= lt!420534 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420524 () (_ BitVec 64))

(assert (=> b!933788 (= lt!420524 (select (arr!27027 _keys!1487) from!1844))))

(declare-fun lt!420522 () Unit!31420)

(assert (=> b!933788 (= lt!420522 (addApplyDifferent!413 lt!420527 lt!420534 minValue!1173 lt!420524))))

(assert (=> b!933788 (= (apply!806 (+!2825 lt!420527 (tuple2!13323 lt!420534 minValue!1173)) lt!420524) (apply!806 lt!420527 lt!420524))))

(declare-fun lt!420537 () Unit!31420)

(assert (=> b!933788 (= lt!420537 lt!420522)))

(declare-fun lt!420538 () ListLongMap!12009)

(assert (=> b!933788 (= lt!420538 (getCurrentListMapNoExtraKeys!3335 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!420530 () (_ BitVec 64))

(assert (=> b!933788 (= lt!420530 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420517 () (_ BitVec 64))

(assert (=> b!933788 (= lt!420517 (select (arr!27027 _keys!1487) from!1844))))

(declare-fun lt!420518 () Unit!31420)

(assert (=> b!933788 (= lt!420518 (addApplyDifferent!413 lt!420538 lt!420530 zeroValue!1173 lt!420517))))

(assert (=> b!933788 (= (apply!806 (+!2825 lt!420538 (tuple2!13323 lt!420530 zeroValue!1173)) lt!420517) (apply!806 lt!420538 lt!420517))))

(declare-fun lt!420531 () Unit!31420)

(assert (=> b!933788 (= lt!420531 lt!420518)))

(declare-fun lt!420520 () ListLongMap!12009)

(assert (=> b!933788 (= lt!420520 (getCurrentListMapNoExtraKeys!3335 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!420521 () (_ BitVec 64))

(assert (=> b!933788 (= lt!420521 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420525 () (_ BitVec 64))

(assert (=> b!933788 (= lt!420525 (select (arr!27027 _keys!1487) from!1844))))

(assert (=> b!933788 (= lt!420532 (addApplyDifferent!413 lt!420520 lt!420521 minValue!1173 lt!420525))))

(assert (=> b!933788 (= (apply!806 (+!2825 lt!420520 (tuple2!13323 lt!420521 minValue!1173)) lt!420525) (apply!806 lt!420520 lt!420525))))

(declare-fun b!933789 () Bool)

(declare-fun e!524310 () Bool)

(assert (=> b!933789 (= e!524310 (not call!40599))))

(declare-fun b!933790 () Bool)

(assert (=> b!933790 (= e!524309 e!524313)))

(declare-fun res!628981 () Bool)

(assert (=> b!933790 (= res!628981 call!40601)))

(assert (=> b!933790 (=> (not res!628981) (not e!524313))))

(declare-fun b!933791 () Bool)

(declare-fun Unit!31430 () Unit!31420)

(assert (=> b!933791 (= e!524316 Unit!31430)))

(declare-fun b!933792 () Bool)

(declare-fun call!40600 () ListLongMap!12009)

(assert (=> b!933792 (= e!524315 call!40600)))

(declare-fun b!933793 () Bool)

(assert (=> b!933793 (= e!524318 (validKeyInArray!0 (select (arr!27027 _keys!1487) from!1844)))))

(declare-fun b!933794 () Bool)

(assert (=> b!933794 (= e!524319 call!40600)))

(declare-fun b!933795 () Bool)

(declare-fun res!628979 () Bool)

(assert (=> b!933795 (=> (not res!628979) (not e!524314))))

(assert (=> b!933795 (= res!628979 e!524310)))

(declare-fun c!97060 () Bool)

(assert (=> b!933795 (= c!97060 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!933796 () Bool)

(assert (=> b!933796 (= e!524314 e!524309)))

(declare-fun c!97058 () Bool)

(assert (=> b!933796 (= c!97058 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!933797 () Bool)

(declare-fun e!524312 () Bool)

(assert (=> b!933797 (= e!524310 e!524312)))

(declare-fun res!628976 () Bool)

(assert (=> b!933797 (= res!628976 call!40599)))

(assert (=> b!933797 (=> (not res!628976) (not e!524312))))

(declare-fun b!933786 () Bool)

(declare-fun c!97059 () Bool)

(assert (=> b!933786 (= c!97059 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!933786 (= e!524315 e!524319)))

(declare-fun d!112925 () Bool)

(assert (=> d!112925 e!524314))

(declare-fun res!628974 () Bool)

(assert (=> d!112925 (=> (not res!628974) (not e!524314))))

(assert (=> d!112925 (= res!628974 (or (bvsge from!1844 (size!27488 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27488 _keys!1487)))))))

(declare-fun lt!420519 () ListLongMap!12009)

(assert (=> d!112925 (= lt!420536 lt!420519)))

(declare-fun lt!420526 () Unit!31420)

(assert (=> d!112925 (= lt!420526 e!524316)))

(declare-fun c!97062 () Bool)

(assert (=> d!112925 (= c!97062 e!524320)))

(declare-fun res!628975 () Bool)

(assert (=> d!112925 (=> (not res!628975) (not e!524320))))

(assert (=> d!112925 (= res!628975 (bvslt from!1844 (size!27488 _keys!1487)))))

(assert (=> d!112925 (= lt!420519 e!524311)))

(declare-fun c!97063 () Bool)

(assert (=> d!112925 (= c!97063 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112925 (validMask!0 mask!1881)))

(assert (=> d!112925 (= (getCurrentListMap!3191 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!420536)))

(declare-fun b!933798 () Bool)

(assert (=> b!933798 (= e!524317 (= (apply!806 lt!420536 (select (arr!27027 _keys!1487) from!1844)) (get!14231 (select (arr!27026 _values!1231) from!1844) (dynLambda!1581 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!933798 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27487 _values!1231)))))

(assert (=> b!933798 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27488 _keys!1487)))))

(declare-fun bm!40599 () Bool)

(assert (=> bm!40599 (= call!40598 (+!2825 (ite c!97063 call!40597 (ite c!97061 call!40602 call!40603)) (ite (or c!97063 c!97061) (tuple2!13323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun bm!40600 () Bool)

(assert (=> bm!40600 (= call!40600 call!40598)))

(declare-fun b!933799 () Bool)

(assert (=> b!933799 (= e!524312 (= (apply!806 lt!420536 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(assert (= (and d!112925 c!97063) b!933780))

(assert (= (and d!112925 (not c!97063)) b!933779))

(assert (= (and b!933779 c!97061) b!933792))

(assert (= (and b!933779 (not c!97061)) b!933786))

(assert (= (and b!933786 c!97059) b!933794))

(assert (= (and b!933786 (not c!97059)) b!933781))

(assert (= (or b!933794 b!933781) bm!40594))

(assert (= (or b!933792 bm!40594) bm!40595))

(assert (= (or b!933792 b!933794) bm!40600))

(assert (= (or b!933780 bm!40595) bm!40597))

(assert (= (or b!933780 bm!40600) bm!40599))

(assert (= (and d!112925 res!628975) b!933787))

(assert (= (and d!112925 c!97062) b!933788))

(assert (= (and d!112925 (not c!97062)) b!933791))

(assert (= (and d!112925 res!628974) b!933782))

(assert (= (and b!933782 res!628978) b!933793))

(assert (= (and b!933782 (not res!628977)) b!933785))

(assert (= (and b!933785 res!628982) b!933798))

(assert (= (and b!933782 res!628980) b!933795))

(assert (= (and b!933795 c!97060) b!933797))

(assert (= (and b!933795 (not c!97060)) b!933789))

(assert (= (and b!933797 res!628976) b!933799))

(assert (= (or b!933797 b!933789) bm!40596))

(assert (= (and b!933795 res!628979) b!933796))

(assert (= (and b!933796 c!97058) b!933790))

(assert (= (and b!933796 (not c!97058)) b!933783))

(assert (= (and b!933790 res!628981) b!933784))

(assert (= (or b!933790 b!933783) bm!40598))

(declare-fun b_lambda!13953 () Bool)

(assert (=> (not b_lambda!13953) (not b!933798)))

(assert (=> b!933798 t!27228))

(declare-fun b_and!28797 () Bool)

(assert (= b_and!28795 (and (=> t!27228 result!11851) b_and!28797)))

(declare-fun m!867523 () Bool)

(assert (=> b!933780 m!867523))

(assert (=> b!933787 m!867511))

(assert (=> b!933787 m!867511))

(declare-fun m!867525 () Bool)

(assert (=> b!933787 m!867525))

(declare-fun m!867527 () Bool)

(assert (=> b!933784 m!867527))

(declare-fun m!867529 () Bool)

(assert (=> bm!40599 m!867529))

(assert (=> b!933798 m!867201))

(declare-fun m!867531 () Bool)

(assert (=> b!933798 m!867531))

(assert (=> b!933798 m!867511))

(assert (=> b!933798 m!867511))

(declare-fun m!867533 () Bool)

(assert (=> b!933798 m!867533))

(assert (=> b!933798 m!867531))

(assert (=> b!933798 m!867201))

(declare-fun m!867535 () Bool)

(assert (=> b!933798 m!867535))

(declare-fun m!867537 () Bool)

(assert (=> bm!40598 m!867537))

(declare-fun m!867539 () Bool)

(assert (=> bm!40597 m!867539))

(declare-fun m!867541 () Bool)

(assert (=> b!933788 m!867541))

(declare-fun m!867543 () Bool)

(assert (=> b!933788 m!867543))

(declare-fun m!867545 () Bool)

(assert (=> b!933788 m!867545))

(declare-fun m!867547 () Bool)

(assert (=> b!933788 m!867547))

(declare-fun m!867549 () Bool)

(assert (=> b!933788 m!867549))

(declare-fun m!867551 () Bool)

(assert (=> b!933788 m!867551))

(declare-fun m!867553 () Bool)

(assert (=> b!933788 m!867553))

(assert (=> b!933788 m!867547))

(declare-fun m!867555 () Bool)

(assert (=> b!933788 m!867555))

(assert (=> b!933788 m!867539))

(declare-fun m!867557 () Bool)

(assert (=> b!933788 m!867557))

(assert (=> b!933788 m!867511))

(declare-fun m!867559 () Bool)

(assert (=> b!933788 m!867559))

(declare-fun m!867561 () Bool)

(assert (=> b!933788 m!867561))

(assert (=> b!933788 m!867553))

(declare-fun m!867563 () Bool)

(assert (=> b!933788 m!867563))

(assert (=> b!933788 m!867561))

(declare-fun m!867565 () Bool)

(assert (=> b!933788 m!867565))

(declare-fun m!867567 () Bool)

(assert (=> b!933788 m!867567))

(declare-fun m!867569 () Bool)

(assert (=> b!933788 m!867569))

(assert (=> b!933788 m!867543))

(declare-fun m!867571 () Bool)

(assert (=> bm!40596 m!867571))

(assert (=> d!112925 m!867231))

(declare-fun m!867573 () Bool)

(assert (=> b!933799 m!867573))

(assert (=> b!933793 m!867511))

(assert (=> b!933793 m!867511))

(assert (=> b!933793 m!867525))

(assert (=> b!933785 m!867511))

(assert (=> b!933785 m!867511))

(declare-fun m!867575 () Bool)

(assert (=> b!933785 m!867575))

(assert (=> b!933524 d!112925))

(declare-fun b!933808 () Bool)

(declare-fun e!524330 () Bool)

(declare-fun e!524329 () Bool)

(assert (=> b!933808 (= e!524330 e!524329)))

(declare-fun lt!420547 () (_ BitVec 64))

(assert (=> b!933808 (= lt!420547 (select (arr!27027 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!420546 () Unit!31420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56165 (_ BitVec 64) (_ BitVec 32)) Unit!31420)

(assert (=> b!933808 (= lt!420546 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!420547 #b00000000000000000000000000000000))))

(assert (=> b!933808 (arrayContainsKey!0 _keys!1487 lt!420547 #b00000000000000000000000000000000)))

(declare-fun lt!420545 () Unit!31420)

(assert (=> b!933808 (= lt!420545 lt!420546)))

(declare-fun res!628988 () Bool)

(declare-datatypes ((SeekEntryResult!8977 0))(
  ( (MissingZero!8977 (index!38279 (_ BitVec 32))) (Found!8977 (index!38280 (_ BitVec 32))) (Intermediate!8977 (undefined!9789 Bool) (index!38281 (_ BitVec 32)) (x!80089 (_ BitVec 32))) (Undefined!8977) (MissingVacant!8977 (index!38282 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56165 (_ BitVec 32)) SeekEntryResult!8977)

(assert (=> b!933808 (= res!628988 (= (seekEntryOrOpen!0 (select (arr!27027 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8977 #b00000000000000000000000000000000)))))

(assert (=> b!933808 (=> (not res!628988) (not e!524329))))

(declare-fun b!933809 () Bool)

(declare-fun call!40606 () Bool)

(assert (=> b!933809 (= e!524329 call!40606)))

(declare-fun d!112927 () Bool)

(declare-fun res!628987 () Bool)

(declare-fun e!524328 () Bool)

(assert (=> d!112927 (=> res!628987 e!524328)))

(assert (=> d!112927 (= res!628987 (bvsge #b00000000000000000000000000000000 (size!27488 _keys!1487)))))

(assert (=> d!112927 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!524328)))

(declare-fun bm!40603 () Bool)

(assert (=> bm!40603 (= call!40606 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!933810 () Bool)

(assert (=> b!933810 (= e!524330 call!40606)))

(declare-fun b!933811 () Bool)

(assert (=> b!933811 (= e!524328 e!524330)))

(declare-fun c!97066 () Bool)

(assert (=> b!933811 (= c!97066 (validKeyInArray!0 (select (arr!27027 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!112927 (not res!628987)) b!933811))

(assert (= (and b!933811 c!97066) b!933808))

(assert (= (and b!933811 (not c!97066)) b!933810))

(assert (= (and b!933808 res!628988) b!933809))

(assert (= (or b!933809 b!933810) bm!40603))

(assert (=> b!933808 m!867503))

(declare-fun m!867577 () Bool)

(assert (=> b!933808 m!867577))

(declare-fun m!867579 () Bool)

(assert (=> b!933808 m!867579))

(assert (=> b!933808 m!867503))

(declare-fun m!867581 () Bool)

(assert (=> b!933808 m!867581))

(declare-fun m!867583 () Bool)

(assert (=> bm!40603 m!867583))

(assert (=> b!933811 m!867503))

(assert (=> b!933811 m!867503))

(assert (=> b!933811 m!867505))

(assert (=> b!933533 d!112927))

(declare-fun d!112929 () Bool)

(assert (=> d!112929 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79418 d!112929))

(declare-fun d!112931 () Bool)

(assert (=> d!112931 (= (array_inv!21102 _values!1231) (bvsge (size!27487 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79418 d!112931))

(declare-fun d!112933 () Bool)

(assert (=> d!112933 (= (array_inv!21103 _keys!1487) (bvsge (size!27488 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79418 d!112933))

(declare-fun d!112935 () Bool)

(assert (=> d!112935 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!933535 d!112935))

(declare-fun d!112937 () Bool)

(declare-fun get!14236 (Option!488) V!31807)

(assert (=> d!112937 (= (apply!806 lt!420335 k0!1099) (get!14236 (getValueByKey!482 (toList!6020 lt!420335) k0!1099)))))

(declare-fun bs!26196 () Bool)

(assert (= bs!26196 d!112937))

(assert (=> bs!26196 m!867519))

(assert (=> bs!26196 m!867519))

(declare-fun m!867585 () Bool)

(assert (=> bs!26196 m!867585))

(assert (=> b!933534 d!112937))

(declare-fun mapNonEmpty!31965 () Bool)

(declare-fun mapRes!31965 () Bool)

(declare-fun tp!61329 () Bool)

(declare-fun e!524336 () Bool)

(assert (=> mapNonEmpty!31965 (= mapRes!31965 (and tp!61329 e!524336))))

(declare-fun mapRest!31965 () (Array (_ BitVec 32) ValueCell!9584))

(declare-fun mapValue!31965 () ValueCell!9584)

(declare-fun mapKey!31965 () (_ BitVec 32))

(assert (=> mapNonEmpty!31965 (= mapRest!31956 (store mapRest!31965 mapKey!31965 mapValue!31965))))

(declare-fun b!933819 () Bool)

(declare-fun e!524335 () Bool)

(assert (=> b!933819 (= e!524335 tp_is_empty!20131)))

(declare-fun mapIsEmpty!31965 () Bool)

(assert (=> mapIsEmpty!31965 mapRes!31965))

(declare-fun condMapEmpty!31965 () Bool)

(declare-fun mapDefault!31965 () ValueCell!9584)

(assert (=> mapNonEmpty!31956 (= condMapEmpty!31965 (= mapRest!31956 ((as const (Array (_ BitVec 32) ValueCell!9584)) mapDefault!31965)))))

(assert (=> mapNonEmpty!31956 (= tp!61313 (and e!524335 mapRes!31965))))

(declare-fun b!933818 () Bool)

(assert (=> b!933818 (= e!524336 tp_is_empty!20131)))

(assert (= (and mapNonEmpty!31956 condMapEmpty!31965) mapIsEmpty!31965))

(assert (= (and mapNonEmpty!31956 (not condMapEmpty!31965)) mapNonEmpty!31965))

(assert (= (and mapNonEmpty!31965 ((_ is ValueCellFull!9584) mapValue!31965)) b!933818))

(assert (= (and mapNonEmpty!31956 ((_ is ValueCellFull!9584) mapDefault!31965)) b!933819))

(declare-fun m!867587 () Bool)

(assert (=> mapNonEmpty!31965 m!867587))

(declare-fun b_lambda!13955 () Bool)

(assert (= b_lambda!13953 (or (and start!79418 b_free!17623) b_lambda!13955)))

(declare-fun b_lambda!13957 () Bool)

(assert (= b_lambda!13949 (or (and start!79418 b_free!17623) b_lambda!13957)))

(declare-fun b_lambda!13959 () Bool)

(assert (= b_lambda!13951 (or (and start!79418 b_free!17623) b_lambda!13959)))

(declare-fun b_lambda!13961 () Bool)

(assert (= b_lambda!13947 (or (and start!79418 b_free!17623) b_lambda!13961)))

(check-sat (not b!933811) tp_is_empty!20131 (not b!933722) (not b_lambda!13945) (not bm!40603) (not d!112915) (not b!933738) (not b!933701) (not b!933776) (not b!933758) (not b!933778) b_and!28797 (not b!933739) (not b!933787) (not bm!40592) (not bm!40598) (not d!112909) (not d!112897) (not d!112937) (not b!933793) (not d!112907) (not b!933767) (not bm!40599) (not b!933799) (not b!933680) (not b!933697) (not b_next!17623) (not b!933784) (not d!112923) (not bm!40596) (not b!933684) (not b!933704) (not bm!40581) (not b!933765) (not bm!40580) (not d!112911) (not bm!40588) (not b!933689) (not bm!40578) (not b!933723) (not b!933695) (not b!933727) (not b!933683) (not d!112903) (not b!933724) (not b!933780) (not b!933764) (not bm!40586) (not b_lambda!13959) (not b!933785) (not b!933710) (not b_lambda!13961) (not b!933766) (not b!933775) (not b!933740) (not d!112925) (not bm!40597) (not b!933694) (not b!933788) (not bm!40587) (not b!933715) (not bm!40593) (not b!933763) (not d!112901) (not d!112895) (not b!933748) (not b!933702) (not bm!40579) (not d!112899) (not b_lambda!13955) (not b_lambda!13957) (not b!933681) (not b!933756) (not b!933705) (not b!933721) (not b!933808) (not bm!40585) (not b!933676) (not mapNonEmpty!31965) (not b!933798) (not b!933716))
(check-sat b_and!28797 (not b_next!17623))
