; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79634 () Bool)

(assert start!79634)

(declare-fun b_free!17701 () Bool)

(declare-fun b_next!17701 () Bool)

(assert (=> start!79634 (= b_free!17701 (not b_next!17701))))

(declare-fun tp!61560 () Bool)

(declare-fun b_and!28967 () Bool)

(assert (=> start!79634 (= tp!61560 b_and!28967)))

(declare-fun b!936249 () Bool)

(declare-datatypes ((V!31911 0))(
  ( (V!31912 (val!10155 Int)) )
))
(declare-datatypes ((tuple2!13390 0))(
  ( (tuple2!13391 (_1!6706 (_ BitVec 64)) (_2!6706 V!31911)) )
))
(declare-datatypes ((List!19137 0))(
  ( (Nil!19134) (Cons!19133 (h!20279 tuple2!13390) (t!27373 List!19137)) )
))
(declare-datatypes ((ListLongMap!12077 0))(
  ( (ListLongMap!12078 (toList!6054 List!19137)) )
))
(declare-fun lt!422027 () ListLongMap!12077)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!422028 () V!31911)

(declare-fun apply!830 (ListLongMap!12077 (_ BitVec 64)) V!31911)

(assert (=> b!936249 (= (apply!830 lt!422027 k0!1099) lt!422028)))

(declare-fun lt!422030 () V!31911)

(declare-fun lt!422026 () ListLongMap!12077)

(declare-datatypes ((Unit!31493 0))(
  ( (Unit!31494) )
))
(declare-fun lt!422032 () Unit!31493)

(declare-fun lt!422036 () (_ BitVec 64))

(declare-fun addApplyDifferent!418 (ListLongMap!12077 (_ BitVec 64) V!31911 (_ BitVec 64)) Unit!31493)

(assert (=> b!936249 (= lt!422032 (addApplyDifferent!418 lt!422026 lt!422036 lt!422030 k0!1099))))

(assert (=> b!936249 (not (= lt!422036 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!422029 () Unit!31493)

(declare-datatypes ((array!56327 0))(
  ( (array!56328 (arr!27104 (Array (_ BitVec 32) (_ BitVec 64))) (size!27565 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56327)

(declare-datatypes ((List!19138 0))(
  ( (Nil!19135) (Cons!19134 (h!20280 (_ BitVec 64)) (t!27374 List!19138)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56327 (_ BitVec 64) (_ BitVec 32) List!19138) Unit!31493)

(assert (=> b!936249 (= lt!422029 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19135))))

(declare-fun e!525692 () Bool)

(assert (=> b!936249 e!525692))

(declare-fun c!97340 () Bool)

(assert (=> b!936249 (= c!97340 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9623 0))(
  ( (ValueCellFull!9623 (v!12679 V!31911)) (EmptyCell!9623) )
))
(declare-datatypes ((array!56329 0))(
  ( (array!56330 (arr!27105 (Array (_ BitVec 32) ValueCell!9623)) (size!27566 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56329)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!422035 () Unit!31493)

(declare-fun zeroValue!1173 () V!31911)

(declare-fun minValue!1173 () V!31911)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!296 (array!56327 array!56329 (_ BitVec 32) (_ BitVec 32) V!31911 V!31911 (_ BitVec 64) (_ BitVec 32) Int) Unit!31493)

(assert (=> b!936249 (= lt!422035 (lemmaListMapContainsThenArrayContainsFrom!296 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56327 (_ BitVec 32) List!19138) Bool)

(assert (=> b!936249 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19135)))

(declare-fun lt!422025 () Unit!31493)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56327 (_ BitVec 32) (_ BitVec 32)) Unit!31493)

(assert (=> b!936249 (= lt!422025 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5058 (ListLongMap!12077 (_ BitVec 64)) Bool)

(assert (=> b!936249 (contains!5058 lt!422027 k0!1099)))

(declare-fun lt!422033 () tuple2!13390)

(declare-fun +!2849 (ListLongMap!12077 tuple2!13390) ListLongMap!12077)

(assert (=> b!936249 (= lt!422027 (+!2849 lt!422026 lt!422033))))

(declare-fun lt!422034 () Unit!31493)

(declare-fun addStillContains!538 (ListLongMap!12077 (_ BitVec 64) V!31911 (_ BitVec 64)) Unit!31493)

(assert (=> b!936249 (= lt!422034 (addStillContains!538 lt!422026 lt!422036 lt!422030 k0!1099))))

(declare-fun getCurrentListMap!3220 (array!56327 array!56329 (_ BitVec 32) (_ BitVec 32) V!31911 V!31911 (_ BitVec 32) Int) ListLongMap!12077)

(assert (=> b!936249 (= (getCurrentListMap!3220 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2849 (getCurrentListMap!3220 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422033))))

(assert (=> b!936249 (= lt!422033 (tuple2!13391 lt!422036 lt!422030))))

(declare-fun get!14293 (ValueCell!9623 V!31911) V!31911)

(declare-fun dynLambda!1605 (Int (_ BitVec 64)) V!31911)

(assert (=> b!936249 (= lt!422030 (get!14293 (select (arr!27105 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1605 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422037 () Unit!31493)

(declare-fun lemmaListMapRecursiveValidKeyArray!213 (array!56327 array!56329 (_ BitVec 32) (_ BitVec 32) V!31911 V!31911 (_ BitVec 32) Int) Unit!31493)

(assert (=> b!936249 (= lt!422037 (lemmaListMapRecursiveValidKeyArray!213 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!525691 () Unit!31493)

(assert (=> b!936249 (= e!525691 lt!422032)))

(declare-fun b!936250 () Bool)

(declare-fun arrayContainsKey!0 (array!56327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936250 (= e!525692 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!936251 () Bool)

(declare-fun e!525693 () Unit!31493)

(declare-fun Unit!31495 () Unit!31493)

(assert (=> b!936251 (= e!525693 Unit!31495)))

(declare-fun b!936252 () Bool)

(declare-fun e!525697 () Bool)

(declare-fun e!525695 () Bool)

(assert (=> b!936252 (= e!525697 e!525695)))

(declare-fun res!630447 () Bool)

(assert (=> b!936252 (=> (not res!630447) (not e!525695))))

(assert (=> b!936252 (= res!630447 (contains!5058 lt!422026 k0!1099))))

(assert (=> b!936252 (= lt!422026 (getCurrentListMap!3220 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936253 () Bool)

(declare-fun e!525696 () Bool)

(declare-fun tp_is_empty!20209 () Bool)

(assert (=> b!936253 (= e!525696 tp_is_empty!20209)))

(declare-fun b!936254 () Bool)

(assert (=> b!936254 (= e!525693 e!525691)))

(assert (=> b!936254 (= lt!422036 (select (arr!27104 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97341 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936254 (= c!97341 (validKeyInArray!0 lt!422036))))

(declare-fun b!936255 () Bool)

(declare-fun Unit!31496 () Unit!31493)

(assert (=> b!936255 (= e!525691 Unit!31496)))

(declare-fun b!936256 () Bool)

(assert (=> b!936256 (= e!525692 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936257 () Bool)

(declare-fun e!525689 () Bool)

(declare-fun mapRes!32085 () Bool)

(assert (=> b!936257 (= e!525689 (and e!525696 mapRes!32085))))

(declare-fun condMapEmpty!32085 () Bool)

(declare-fun mapDefault!32085 () ValueCell!9623)

(assert (=> b!936257 (= condMapEmpty!32085 (= (arr!27105 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9623)) mapDefault!32085)))))

(declare-fun mapNonEmpty!32085 () Bool)

(declare-fun tp!61559 () Bool)

(declare-fun e!525690 () Bool)

(assert (=> mapNonEmpty!32085 (= mapRes!32085 (and tp!61559 e!525690))))

(declare-fun mapKey!32085 () (_ BitVec 32))

(declare-fun mapRest!32085 () (Array (_ BitVec 32) ValueCell!9623))

(declare-fun mapValue!32085 () ValueCell!9623)

(assert (=> mapNonEmpty!32085 (= (arr!27105 _values!1231) (store mapRest!32085 mapKey!32085 mapValue!32085))))

(declare-fun mapIsEmpty!32085 () Bool)

(assert (=> mapIsEmpty!32085 mapRes!32085))

(declare-fun b!936258 () Bool)

(declare-fun res!630445 () Bool)

(assert (=> b!936258 (=> (not res!630445) (not e!525697))))

(assert (=> b!936258 (= res!630445 (and (= (size!27566 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27565 _keys!1487) (size!27566 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!630448 () Bool)

(assert (=> start!79634 (=> (not res!630448) (not e!525697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79634 (= res!630448 (validMask!0 mask!1881))))

(assert (=> start!79634 e!525697))

(assert (=> start!79634 true))

(assert (=> start!79634 tp_is_empty!20209))

(declare-fun array_inv!21154 (array!56329) Bool)

(assert (=> start!79634 (and (array_inv!21154 _values!1231) e!525689)))

(assert (=> start!79634 tp!61560))

(declare-fun array_inv!21155 (array!56327) Bool)

(assert (=> start!79634 (array_inv!21155 _keys!1487)))

(declare-fun b!936259 () Bool)

(declare-fun e!525698 () Bool)

(assert (=> b!936259 (= e!525698 false)))

(declare-fun lt!422031 () Unit!31493)

(assert (=> b!936259 (= lt!422031 e!525693)))

(declare-fun c!97342 () Bool)

(assert (=> b!936259 (= c!97342 (validKeyInArray!0 k0!1099))))

(declare-fun b!936260 () Bool)

(declare-fun res!630444 () Bool)

(assert (=> b!936260 (=> (not res!630444) (not e!525697))))

(assert (=> b!936260 (= res!630444 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27565 _keys!1487))))))

(declare-fun b!936261 () Bool)

(declare-fun res!630446 () Bool)

(assert (=> b!936261 (=> (not res!630446) (not e!525697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56327 (_ BitVec 32)) Bool)

(assert (=> b!936261 (= res!630446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936262 () Bool)

(assert (=> b!936262 (= e!525690 tp_is_empty!20209)))

(declare-fun b!936263 () Bool)

(declare-fun res!630449 () Bool)

(assert (=> b!936263 (=> (not res!630449) (not e!525697))))

(assert (=> b!936263 (= res!630449 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19135))))

(declare-fun b!936264 () Bool)

(assert (=> b!936264 (= e!525695 e!525698)))

(declare-fun res!630443 () Bool)

(assert (=> b!936264 (=> (not res!630443) (not e!525698))))

(declare-fun v!791 () V!31911)

(assert (=> b!936264 (= res!630443 (and (= lt!422028 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!936264 (= lt!422028 (apply!830 lt!422026 k0!1099))))

(assert (= (and start!79634 res!630448) b!936258))

(assert (= (and b!936258 res!630445) b!936261))

(assert (= (and b!936261 res!630446) b!936263))

(assert (= (and b!936263 res!630449) b!936260))

(assert (= (and b!936260 res!630444) b!936252))

(assert (= (and b!936252 res!630447) b!936264))

(assert (= (and b!936264 res!630443) b!936259))

(assert (= (and b!936259 c!97342) b!936254))

(assert (= (and b!936259 (not c!97342)) b!936251))

(assert (= (and b!936254 c!97341) b!936249))

(assert (= (and b!936254 (not c!97341)) b!936255))

(assert (= (and b!936249 c!97340) b!936250))

(assert (= (and b!936249 (not c!97340)) b!936256))

(assert (= (and b!936257 condMapEmpty!32085) mapIsEmpty!32085))

(assert (= (and b!936257 (not condMapEmpty!32085)) mapNonEmpty!32085))

(get-info :version)

(assert (= (and mapNonEmpty!32085 ((_ is ValueCellFull!9623) mapValue!32085)) b!936262))

(assert (= (and b!936257 ((_ is ValueCellFull!9623) mapDefault!32085)) b!936253))

(assert (= start!79634 b!936257))

(declare-fun b_lambda!14089 () Bool)

(assert (=> (not b_lambda!14089) (not b!936249)))

(declare-fun t!27372 () Bool)

(declare-fun tb!6087 () Bool)

(assert (=> (and start!79634 (= defaultEntry!1235 defaultEntry!1235) t!27372) tb!6087))

(declare-fun result!12015 () Bool)

(assert (=> tb!6087 (= result!12015 tp_is_empty!20209)))

(assert (=> b!936249 t!27372))

(declare-fun b_and!28969 () Bool)

(assert (= b_and!28967 (and (=> t!27372 result!12015) b_and!28969)))

(declare-fun m!870341 () Bool)

(assert (=> b!936264 m!870341))

(declare-fun m!870343 () Bool)

(assert (=> b!936263 m!870343))

(declare-fun m!870345 () Bool)

(assert (=> start!79634 m!870345))

(declare-fun m!870347 () Bool)

(assert (=> start!79634 m!870347))

(declare-fun m!870349 () Bool)

(assert (=> start!79634 m!870349))

(declare-fun m!870351 () Bool)

(assert (=> b!936250 m!870351))

(declare-fun m!870353 () Bool)

(assert (=> b!936254 m!870353))

(declare-fun m!870355 () Bool)

(assert (=> b!936254 m!870355))

(declare-fun m!870357 () Bool)

(assert (=> b!936261 m!870357))

(declare-fun m!870359 () Bool)

(assert (=> mapNonEmpty!32085 m!870359))

(declare-fun m!870361 () Bool)

(assert (=> b!936259 m!870361))

(declare-fun m!870363 () Bool)

(assert (=> b!936252 m!870363))

(declare-fun m!870365 () Bool)

(assert (=> b!936252 m!870365))

(declare-fun m!870367 () Bool)

(assert (=> b!936249 m!870367))

(declare-fun m!870369 () Bool)

(assert (=> b!936249 m!870369))

(declare-fun m!870371 () Bool)

(assert (=> b!936249 m!870371))

(declare-fun m!870373 () Bool)

(assert (=> b!936249 m!870373))

(declare-fun m!870375 () Bool)

(assert (=> b!936249 m!870375))

(declare-fun m!870377 () Bool)

(assert (=> b!936249 m!870377))

(declare-fun m!870379 () Bool)

(assert (=> b!936249 m!870379))

(declare-fun m!870381 () Bool)

(assert (=> b!936249 m!870381))

(assert (=> b!936249 m!870375))

(assert (=> b!936249 m!870379))

(declare-fun m!870383 () Bool)

(assert (=> b!936249 m!870383))

(declare-fun m!870385 () Bool)

(assert (=> b!936249 m!870385))

(declare-fun m!870387 () Bool)

(assert (=> b!936249 m!870387))

(declare-fun m!870389 () Bool)

(assert (=> b!936249 m!870389))

(declare-fun m!870391 () Bool)

(assert (=> b!936249 m!870391))

(declare-fun m!870393 () Bool)

(assert (=> b!936249 m!870393))

(declare-fun m!870395 () Bool)

(assert (=> b!936249 m!870395))

(assert (=> b!936249 m!870369))

(declare-fun m!870397 () Bool)

(assert (=> b!936249 m!870397))

(check-sat b_and!28969 (not b!936254) tp_is_empty!20209 (not mapNonEmpty!32085) (not b!936252) (not b!936263) (not b!936250) (not b!936261) (not b!936264) (not start!79634) (not b!936259) (not b_lambda!14089) (not b!936249) (not b_next!17701))
(check-sat b_and!28969 (not b_next!17701))
