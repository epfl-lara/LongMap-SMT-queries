; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79872 () Bool)

(assert start!79872)

(declare-fun b_free!17769 () Bool)

(declare-fun b_next!17769 () Bool)

(assert (=> start!79872 (= b_free!17769 (not b_next!17769))))

(declare-fun tp!61770 () Bool)

(declare-fun b_and!29177 () Bool)

(assert (=> start!79872 (= tp!61770 b_and!29177)))

(declare-fun b!939330 () Bool)

(declare-fun e!527601 () Bool)

(declare-fun e!527600 () Bool)

(assert (=> b!939330 (= e!527601 e!527600)))

(declare-fun res!631821 () Bool)

(assert (=> b!939330 (=> (not res!631821) (not e!527600))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((V!32001 0))(
  ( (V!32002 (val!10189 Int)) )
))
(declare-fun v!791 () V!32001)

(declare-fun lt!424469 () V!32001)

(assert (=> b!939330 (= res!631821 (and (= lt!424469 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!13394 0))(
  ( (tuple2!13395 (_1!6708 (_ BitVec 64)) (_2!6708 V!32001)) )
))
(declare-datatypes ((List!19171 0))(
  ( (Nil!19168) (Cons!19167 (h!20313 tuple2!13394) (t!27484 List!19171)) )
))
(declare-datatypes ((ListLongMap!12091 0))(
  ( (ListLongMap!12092 (toList!6061 List!19171)) )
))
(declare-fun lt!424476 () ListLongMap!12091)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!862 (ListLongMap!12091 (_ BitVec 64)) V!32001)

(assert (=> b!939330 (= lt!424469 (apply!862 lt!424476 k0!1099))))

(declare-fun b!939331 () Bool)

(declare-fun res!631828 () Bool)

(declare-fun e!527599 () Bool)

(assert (=> b!939331 (=> (not res!631828) (not e!527599))))

(declare-datatypes ((array!56498 0))(
  ( (array!56499 (arr!27187 (Array (_ BitVec 32) (_ BitVec 64))) (size!27646 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56498)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56498 (_ BitVec 32)) Bool)

(assert (=> b!939331 (= res!631828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!939332 () Bool)

(declare-datatypes ((Unit!31746 0))(
  ( (Unit!31747) )
))
(declare-fun e!527596 () Unit!31746)

(declare-fun Unit!31748 () Unit!31746)

(assert (=> b!939332 (= e!527596 Unit!31748)))

(declare-fun b!939333 () Bool)

(declare-fun res!631829 () Bool)

(declare-fun e!527604 () Bool)

(assert (=> b!939333 (=> (not res!631829) (not e!527604))))

(declare-fun lt!424465 () ListLongMap!12091)

(assert (=> b!939333 (= res!631829 (= (apply!862 lt!424465 k0!1099) v!791))))

(declare-fun b!939334 () Bool)

(declare-fun res!631824 () Bool)

(assert (=> b!939334 (=> (not res!631824) (not e!527599))))

(declare-datatypes ((List!19172 0))(
  ( (Nil!19169) (Cons!19168 (h!20314 (_ BitVec 64)) (t!27485 List!19172)) )
))
(declare-fun arrayNoDuplicates!0 (array!56498 (_ BitVec 32) List!19172) Bool)

(assert (=> b!939334 (= res!631824 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19169))))

(declare-fun b!939335 () Bool)

(declare-fun lt!424473 () ListLongMap!12091)

(declare-fun e!527603 () Bool)

(assert (=> b!939335 (= e!527603 (= (apply!862 lt!424473 k0!1099) v!791))))

(declare-fun b!939336 () Bool)

(declare-fun e!527606 () Bool)

(assert (=> b!939336 (= e!527600 e!527606)))

(declare-fun res!631825 () Bool)

(assert (=> b!939336 (=> (not res!631825) (not e!527606))))

(assert (=> b!939336 (= res!631825 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27646 _keys!1487)))))

(declare-fun lt!424470 () Unit!31746)

(declare-fun e!527605 () Unit!31746)

(assert (=> b!939336 (= lt!424470 e!527605)))

(declare-fun c!97993 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!939336 (= c!97993 (validKeyInArray!0 k0!1099))))

(declare-fun b!939337 () Bool)

(declare-fun e!527602 () Bool)

(declare-fun tp_is_empty!20277 () Bool)

(assert (=> b!939337 (= e!527602 tp_is_empty!20277)))

(declare-fun b!939338 () Bool)

(declare-fun e!527595 () Bool)

(declare-fun e!527597 () Bool)

(declare-fun mapRes!32195 () Bool)

(assert (=> b!939338 (= e!527595 (and e!527597 mapRes!32195))))

(declare-fun condMapEmpty!32195 () Bool)

(declare-datatypes ((ValueCell!9657 0))(
  ( (ValueCellFull!9657 (v!12720 V!32001)) (EmptyCell!9657) )
))
(declare-datatypes ((array!56500 0))(
  ( (array!56501 (arr!27188 (Array (_ BitVec 32) ValueCell!9657)) (size!27647 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56500)

(declare-fun mapDefault!32195 () ValueCell!9657)

(assert (=> b!939338 (= condMapEmpty!32195 (= (arr!27188 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9657)) mapDefault!32195)))))

(declare-fun mapNonEmpty!32195 () Bool)

(declare-fun tp!61771 () Bool)

(assert (=> mapNonEmpty!32195 (= mapRes!32195 (and tp!61771 e!527602))))

(declare-fun mapRest!32195 () (Array (_ BitVec 32) ValueCell!9657))

(declare-fun mapKey!32195 () (_ BitVec 32))

(declare-fun mapValue!32195 () ValueCell!9657)

(assert (=> mapNonEmpty!32195 (= (arr!27188 _values!1231) (store mapRest!32195 mapKey!32195 mapValue!32195))))

(declare-fun b!939339 () Bool)

(assert (=> b!939339 (= e!527597 tp_is_empty!20277)))

(declare-fun b!939340 () Bool)

(assert (=> b!939340 (= e!527606 e!527604)))

(declare-fun res!631830 () Bool)

(assert (=> b!939340 (=> (not res!631830) (not e!527604))))

(declare-fun contains!5123 (ListLongMap!12091 (_ BitVec 64)) Bool)

(assert (=> b!939340 (= res!631830 (contains!5123 lt!424465 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!32001)

(declare-fun minValue!1173 () V!32001)

(declare-fun getCurrentListMap!3295 (array!56498 array!56500 (_ BitVec 32) (_ BitVec 32) V!32001 V!32001 (_ BitVec 32) Int) ListLongMap!12091)

(assert (=> b!939340 (= lt!424465 (getCurrentListMap!3295 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!631826 () Bool)

(assert (=> start!79872 (=> (not res!631826) (not e!527599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79872 (= res!631826 (validMask!0 mask!1881))))

(assert (=> start!79872 e!527599))

(assert (=> start!79872 true))

(assert (=> start!79872 tp_is_empty!20277))

(declare-fun array_inv!21146 (array!56500) Bool)

(assert (=> start!79872 (and (array_inv!21146 _values!1231) e!527595)))

(assert (=> start!79872 tp!61770))

(declare-fun array_inv!21147 (array!56498) Bool)

(assert (=> start!79872 (array_inv!21147 _keys!1487)))

(declare-fun b!939341 () Bool)

(assert (=> b!939341 (= e!527604 (not true))))

(declare-fun lt!424471 () V!32001)

(assert (=> b!939341 (= lt!424471 (apply!862 lt!424473 k0!1099))))

(assert (=> b!939341 e!527603))

(declare-fun res!631822 () Bool)

(assert (=> b!939341 (=> (not res!631822) (not e!527603))))

(assert (=> b!939341 (= res!631822 (contains!5123 lt!424473 k0!1099))))

(assert (=> b!939341 (= lt!424473 (getCurrentListMap!3295 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!424463 () Unit!31746)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!105 (array!56498 array!56500 (_ BitVec 32) (_ BitVec 32) V!32001 V!32001 (_ BitVec 64) V!32001 (_ BitVec 32) Int) Unit!31746)

(assert (=> b!939341 (= lt!424463 (lemmaListMapApplyFromThenApplyFromZero!105 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!939342 () Bool)

(assert (=> b!939342 (= e!527599 e!527601)))

(declare-fun res!631831 () Bool)

(assert (=> b!939342 (=> (not res!631831) (not e!527601))))

(assert (=> b!939342 (= res!631831 (contains!5123 lt!424476 k0!1099))))

(assert (=> b!939342 (= lt!424476 (getCurrentListMap!3295 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!32195 () Bool)

(assert (=> mapIsEmpty!32195 mapRes!32195))

(declare-fun b!939343 () Bool)

(declare-fun lt!424477 () ListLongMap!12091)

(assert (=> b!939343 (= (apply!862 lt!424477 k0!1099) lt!424469)))

(declare-fun lt!424468 () (_ BitVec 64))

(declare-fun lt!424472 () V!32001)

(declare-fun lt!424461 () Unit!31746)

(declare-fun addApplyDifferent!447 (ListLongMap!12091 (_ BitVec 64) V!32001 (_ BitVec 64)) Unit!31746)

(assert (=> b!939343 (= lt!424461 (addApplyDifferent!447 lt!424476 lt!424468 lt!424472 k0!1099))))

(assert (=> b!939343 (not (= lt!424468 k0!1099))))

(declare-fun lt!424467 () Unit!31746)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56498 (_ BitVec 64) (_ BitVec 32) List!19172) Unit!31746)

(assert (=> b!939343 (= lt!424467 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19169))))

(declare-fun e!527607 () Bool)

(assert (=> b!939343 e!527607))

(declare-fun c!97991 () Bool)

(assert (=> b!939343 (= c!97991 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!424462 () Unit!31746)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!320 (array!56498 array!56500 (_ BitVec 32) (_ BitVec 32) V!32001 V!32001 (_ BitVec 64) (_ BitVec 32) Int) Unit!31746)

(assert (=> b!939343 (= lt!424462 (lemmaListMapContainsThenArrayContainsFrom!320 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!939343 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19169)))

(declare-fun lt!424474 () Unit!31746)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56498 (_ BitVec 32) (_ BitVec 32)) Unit!31746)

(assert (=> b!939343 (= lt!424474 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!939343 (contains!5123 lt!424477 k0!1099)))

(declare-fun lt!424464 () tuple2!13394)

(declare-fun +!2848 (ListLongMap!12091 tuple2!13394) ListLongMap!12091)

(assert (=> b!939343 (= lt!424477 (+!2848 lt!424476 lt!424464))))

(declare-fun lt!424475 () Unit!31746)

(declare-fun addStillContains!567 (ListLongMap!12091 (_ BitVec 64) V!32001 (_ BitVec 64)) Unit!31746)

(assert (=> b!939343 (= lt!424475 (addStillContains!567 lt!424476 lt!424468 lt!424472 k0!1099))))

(assert (=> b!939343 (= (getCurrentListMap!3295 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2848 (getCurrentListMap!3295 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!424464))))

(assert (=> b!939343 (= lt!424464 (tuple2!13395 lt!424468 lt!424472))))

(declare-fun get!14348 (ValueCell!9657 V!32001) V!32001)

(declare-fun dynLambda!1637 (Int (_ BitVec 64)) V!32001)

(assert (=> b!939343 (= lt!424472 (get!14348 (select (arr!27188 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1637 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!424466 () Unit!31746)

(declare-fun lemmaListMapRecursiveValidKeyArray!238 (array!56498 array!56500 (_ BitVec 32) (_ BitVec 32) V!32001 V!32001 (_ BitVec 32) Int) Unit!31746)

(assert (=> b!939343 (= lt!424466 (lemmaListMapRecursiveValidKeyArray!238 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!939343 (= e!527596 lt!424461)))

(declare-fun b!939344 () Bool)

(declare-fun res!631827 () Bool)

(assert (=> b!939344 (=> (not res!631827) (not e!527599))))

(assert (=> b!939344 (= res!631827 (and (= (size!27647 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27646 _keys!1487) (size!27647 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!939345 () Bool)

(assert (=> b!939345 (= e!527605 e!527596)))

(assert (=> b!939345 (= lt!424468 (select (arr!27187 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97992 () Bool)

(assert (=> b!939345 (= c!97992 (validKeyInArray!0 lt!424468))))

(declare-fun b!939346 () Bool)

(declare-fun arrayContainsKey!0 (array!56498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!939346 (= e!527607 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!939347 () Bool)

(declare-fun res!631823 () Bool)

(assert (=> b!939347 (=> (not res!631823) (not e!527599))))

(assert (=> b!939347 (= res!631823 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27646 _keys!1487))))))

(declare-fun b!939348 () Bool)

(assert (=> b!939348 (= e!527607 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!939349 () Bool)

(declare-fun Unit!31749 () Unit!31746)

(assert (=> b!939349 (= e!527605 Unit!31749)))

(assert (= (and start!79872 res!631826) b!939344))

(assert (= (and b!939344 res!631827) b!939331))

(assert (= (and b!939331 res!631828) b!939334))

(assert (= (and b!939334 res!631824) b!939347))

(assert (= (and b!939347 res!631823) b!939342))

(assert (= (and b!939342 res!631831) b!939330))

(assert (= (and b!939330 res!631821) b!939336))

(assert (= (and b!939336 c!97993) b!939345))

(assert (= (and b!939336 (not c!97993)) b!939349))

(assert (= (and b!939345 c!97992) b!939343))

(assert (= (and b!939345 (not c!97992)) b!939332))

(assert (= (and b!939343 c!97991) b!939346))

(assert (= (and b!939343 (not c!97991)) b!939348))

(assert (= (and b!939336 res!631825) b!939340))

(assert (= (and b!939340 res!631830) b!939333))

(assert (= (and b!939333 res!631829) b!939341))

(assert (= (and b!939341 res!631822) b!939335))

(assert (= (and b!939338 condMapEmpty!32195) mapIsEmpty!32195))

(assert (= (and b!939338 (not condMapEmpty!32195)) mapNonEmpty!32195))

(get-info :version)

(assert (= (and mapNonEmpty!32195 ((_ is ValueCellFull!9657) mapValue!32195)) b!939337))

(assert (= (and b!939338 ((_ is ValueCellFull!9657) mapDefault!32195)) b!939339))

(assert (= start!79872 b!939338))

(declare-fun b_lambda!14275 () Bool)

(assert (=> (not b_lambda!14275) (not b!939343)))

(declare-fun t!27483 () Bool)

(declare-fun tb!6163 () Bool)

(assert (=> (and start!79872 (= defaultEntry!1235 defaultEntry!1235) t!27483) tb!6163))

(declare-fun result!12163 () Bool)

(assert (=> tb!6163 (= result!12163 tp_is_empty!20277)))

(assert (=> b!939343 t!27483))

(declare-fun b_and!29179 () Bool)

(assert (= b_and!29177 (and (=> t!27483 result!12163) b_and!29179)))

(declare-fun m!875163 () Bool)

(assert (=> b!939341 m!875163))

(declare-fun m!875165 () Bool)

(assert (=> b!939341 m!875165))

(declare-fun m!875167 () Bool)

(assert (=> b!939341 m!875167))

(declare-fun m!875169 () Bool)

(assert (=> b!939341 m!875169))

(declare-fun m!875171 () Bool)

(assert (=> b!939330 m!875171))

(declare-fun m!875173 () Bool)

(assert (=> b!939333 m!875173))

(declare-fun m!875175 () Bool)

(assert (=> start!79872 m!875175))

(declare-fun m!875177 () Bool)

(assert (=> start!79872 m!875177))

(declare-fun m!875179 () Bool)

(assert (=> start!79872 m!875179))

(declare-fun m!875181 () Bool)

(assert (=> b!939340 m!875181))

(declare-fun m!875183 () Bool)

(assert (=> b!939340 m!875183))

(declare-fun m!875185 () Bool)

(assert (=> b!939343 m!875185))

(declare-fun m!875187 () Bool)

(assert (=> b!939343 m!875187))

(declare-fun m!875189 () Bool)

(assert (=> b!939343 m!875189))

(declare-fun m!875191 () Bool)

(assert (=> b!939343 m!875191))

(declare-fun m!875193 () Bool)

(assert (=> b!939343 m!875193))

(declare-fun m!875195 () Bool)

(assert (=> b!939343 m!875195))

(assert (=> b!939343 m!875193))

(assert (=> b!939343 m!875195))

(declare-fun m!875197 () Bool)

(assert (=> b!939343 m!875197))

(assert (=> b!939343 m!875183))

(declare-fun m!875199 () Bool)

(assert (=> b!939343 m!875199))

(declare-fun m!875201 () Bool)

(assert (=> b!939343 m!875201))

(declare-fun m!875203 () Bool)

(assert (=> b!939343 m!875203))

(declare-fun m!875205 () Bool)

(assert (=> b!939343 m!875205))

(declare-fun m!875207 () Bool)

(assert (=> b!939343 m!875207))

(assert (=> b!939343 m!875199))

(declare-fun m!875209 () Bool)

(assert (=> b!939343 m!875209))

(declare-fun m!875211 () Bool)

(assert (=> b!939343 m!875211))

(declare-fun m!875213 () Bool)

(assert (=> b!939343 m!875213))

(declare-fun m!875215 () Bool)

(assert (=> b!939331 m!875215))

(declare-fun m!875217 () Bool)

(assert (=> b!939342 m!875217))

(declare-fun m!875219 () Bool)

(assert (=> b!939342 m!875219))

(declare-fun m!875221 () Bool)

(assert (=> b!939334 m!875221))

(declare-fun m!875223 () Bool)

(assert (=> mapNonEmpty!32195 m!875223))

(declare-fun m!875225 () Bool)

(assert (=> b!939345 m!875225))

(declare-fun m!875227 () Bool)

(assert (=> b!939345 m!875227))

(declare-fun m!875229 () Bool)

(assert (=> b!939336 m!875229))

(assert (=> b!939335 m!875163))

(declare-fun m!875231 () Bool)

(assert (=> b!939346 m!875231))

(check-sat (not b!939342) (not b!939345) tp_is_empty!20277 (not b_lambda!14275) (not b_next!17769) (not b!939334) (not b!939335) (not b!939330) (not b!939331) (not b!939336) (not b!939346) (not b!939340) b_and!29179 (not mapNonEmpty!32195) (not b!939333) (not b!939341) (not start!79872) (not b!939343))
(check-sat b_and!29179 (not b_next!17769))
