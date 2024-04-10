; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79864 () Bool)

(assert start!79864)

(declare-fun b_free!17761 () Bool)

(declare-fun b_next!17761 () Bool)

(assert (=> start!79864 (= b_free!17761 (not b_next!17761))))

(declare-fun tp!61747 () Bool)

(declare-fun b_and!29161 () Bool)

(assert (=> start!79864 (= tp!61747 b_and!29161)))

(declare-fun b!939089 () Bool)

(declare-fun res!631701 () Bool)

(declare-fun e!527452 () Bool)

(assert (=> b!939089 (=> (not res!631701) (not e!527452))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56482 0))(
  ( (array!56483 (arr!27179 (Array (_ BitVec 32) (_ BitVec 64))) (size!27638 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56482)

(assert (=> b!939089 (= res!631701 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27638 _keys!1487))))))

(declare-fun res!631696 () Bool)

(assert (=> start!79864 (=> (not res!631696) (not e!527452))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79864 (= res!631696 (validMask!0 mask!1881))))

(assert (=> start!79864 e!527452))

(assert (=> start!79864 true))

(declare-fun tp_is_empty!20269 () Bool)

(assert (=> start!79864 tp_is_empty!20269))

(declare-datatypes ((V!31991 0))(
  ( (V!31992 (val!10185 Int)) )
))
(declare-datatypes ((ValueCell!9653 0))(
  ( (ValueCellFull!9653 (v!12716 V!31991)) (EmptyCell!9653) )
))
(declare-datatypes ((array!56484 0))(
  ( (array!56485 (arr!27180 (Array (_ BitVec 32) ValueCell!9653)) (size!27639 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56484)

(declare-fun e!527451 () Bool)

(declare-fun array_inv!21140 (array!56484) Bool)

(assert (=> start!79864 (and (array_inv!21140 _values!1231) e!527451)))

(assert (=> start!79864 tp!61747))

(declare-fun array_inv!21141 (array!56482) Bool)

(assert (=> start!79864 (array_inv!21141 _keys!1487)))

(declare-fun b!939090 () Bool)

(declare-datatypes ((tuple2!13386 0))(
  ( (tuple2!13387 (_1!6704 (_ BitVec 64)) (_2!6704 V!31991)) )
))
(declare-datatypes ((List!19163 0))(
  ( (Nil!19160) (Cons!19159 (h!20305 tuple2!13386) (t!27468 List!19163)) )
))
(declare-datatypes ((ListLongMap!12083 0))(
  ( (ListLongMap!12084 (toList!6057 List!19163)) )
))
(declare-fun lt!424290 () ListLongMap!12083)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun lt!424287 () V!31991)

(declare-fun apply!858 (ListLongMap!12083 (_ BitVec 64)) V!31991)

(assert (=> b!939090 (= (apply!858 lt!424290 k!1099) lt!424287)))

(declare-datatypes ((Unit!31730 0))(
  ( (Unit!31731) )
))
(declare-fun lt!424281 () Unit!31730)

(declare-fun lt!424278 () V!31991)

(declare-fun lt!424284 () (_ BitVec 64))

(declare-fun lt!424279 () ListLongMap!12083)

(declare-fun addApplyDifferent!443 (ListLongMap!12083 (_ BitVec 64) V!31991 (_ BitVec 64)) Unit!31730)

(assert (=> b!939090 (= lt!424281 (addApplyDifferent!443 lt!424279 lt!424284 lt!424278 k!1099))))

(assert (=> b!939090 (not (= lt!424284 k!1099))))

(declare-fun lt!424280 () Unit!31730)

(declare-datatypes ((List!19164 0))(
  ( (Nil!19161) (Cons!19160 (h!20306 (_ BitVec 64)) (t!27469 List!19164)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56482 (_ BitVec 64) (_ BitVec 32) List!19164) Unit!31730)

(assert (=> b!939090 (= lt!424280 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19161))))

(declare-fun e!527453 () Bool)

(assert (=> b!939090 e!527453))

(declare-fun c!97955 () Bool)

(assert (=> b!939090 (= c!97955 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!424289 () Unit!31730)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31991)

(declare-fun minValue!1173 () V!31991)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!316 (array!56482 array!56484 (_ BitVec 32) (_ BitVec 32) V!31991 V!31991 (_ BitVec 64) (_ BitVec 32) Int) Unit!31730)

(assert (=> b!939090 (= lt!424289 (lemmaListMapContainsThenArrayContainsFrom!316 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56482 (_ BitVec 32) List!19164) Bool)

(assert (=> b!939090 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19161)))

(declare-fun lt!424285 () Unit!31730)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56482 (_ BitVec 32) (_ BitVec 32)) Unit!31730)

(assert (=> b!939090 (= lt!424285 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5119 (ListLongMap!12083 (_ BitVec 64)) Bool)

(assert (=> b!939090 (contains!5119 lt!424290 k!1099)))

(declare-fun lt!424282 () tuple2!13386)

(declare-fun +!2844 (ListLongMap!12083 tuple2!13386) ListLongMap!12083)

(assert (=> b!939090 (= lt!424290 (+!2844 lt!424279 lt!424282))))

(declare-fun lt!424286 () Unit!31730)

(declare-fun addStillContains!563 (ListLongMap!12083 (_ BitVec 64) V!31991 (_ BitVec 64)) Unit!31730)

(assert (=> b!939090 (= lt!424286 (addStillContains!563 lt!424279 lt!424284 lt!424278 k!1099))))

(declare-fun getCurrentListMap!3291 (array!56482 array!56484 (_ BitVec 32) (_ BitVec 32) V!31991 V!31991 (_ BitVec 32) Int) ListLongMap!12083)

(assert (=> b!939090 (= (getCurrentListMap!3291 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2844 (getCurrentListMap!3291 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!424282))))

(assert (=> b!939090 (= lt!424282 (tuple2!13387 lt!424284 lt!424278))))

(declare-fun get!14342 (ValueCell!9653 V!31991) V!31991)

(declare-fun dynLambda!1633 (Int (_ BitVec 64)) V!31991)

(assert (=> b!939090 (= lt!424278 (get!14342 (select (arr!27180 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1633 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!424283 () Unit!31730)

(declare-fun lemmaListMapRecursiveValidKeyArray!234 (array!56482 array!56484 (_ BitVec 32) (_ BitVec 32) V!31991 V!31991 (_ BitVec 32) Int) Unit!31730)

(assert (=> b!939090 (= lt!424283 (lemmaListMapRecursiveValidKeyArray!234 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!527455 () Unit!31730)

(assert (=> b!939090 (= e!527455 lt!424281)))

(declare-fun b!939091 () Bool)

(declare-fun res!631700 () Bool)

(declare-fun e!527454 () Bool)

(assert (=> b!939091 (=> (not res!631700) (not e!527454))))

(declare-fun v!791 () V!31991)

(declare-fun lt!424288 () ListLongMap!12083)

(assert (=> b!939091 (= res!631700 (= (apply!858 lt!424288 k!1099) v!791))))

(declare-fun b!939092 () Bool)

(declare-fun e!527450 () Bool)

(assert (=> b!939092 (= e!527450 e!527454)))

(declare-fun res!631697 () Bool)

(assert (=> b!939092 (=> (not res!631697) (not e!527454))))

(assert (=> b!939092 (= res!631697 (contains!5119 lt!424288 k!1099))))

(assert (=> b!939092 (= lt!424288 (getCurrentListMap!3291 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!939093 () Bool)

(declare-fun Unit!31732 () Unit!31730)

(assert (=> b!939093 (= e!527455 Unit!31732)))

(declare-fun b!939094 () Bool)

(declare-fun res!631702 () Bool)

(assert (=> b!939094 (=> (not res!631702) (not e!527452))))

(assert (=> b!939094 (= res!631702 (and (= (size!27639 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27638 _keys!1487) (size!27639 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!939095 () Bool)

(declare-fun e!527448 () Unit!31730)

(declare-fun Unit!31733 () Unit!31730)

(assert (=> b!939095 (= e!527448 Unit!31733)))

(declare-fun b!939096 () Bool)

(assert (=> b!939096 (= e!527453 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!939097 () Bool)

(assert (=> b!939097 (= e!527448 e!527455)))

(assert (=> b!939097 (= lt!424284 (select (arr!27179 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97957 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!939097 (= c!97957 (validKeyInArray!0 lt!424284))))

(declare-fun mapNonEmpty!32183 () Bool)

(declare-fun mapRes!32183 () Bool)

(declare-fun tp!61746 () Bool)

(declare-fun e!527449 () Bool)

(assert (=> mapNonEmpty!32183 (= mapRes!32183 (and tp!61746 e!527449))))

(declare-fun mapValue!32183 () ValueCell!9653)

(declare-fun mapKey!32183 () (_ BitVec 32))

(declare-fun mapRest!32183 () (Array (_ BitVec 32) ValueCell!9653))

(assert (=> mapNonEmpty!32183 (= (arr!27180 _values!1231) (store mapRest!32183 mapKey!32183 mapValue!32183))))

(declare-fun b!939098 () Bool)

(declare-fun e!527446 () Bool)

(assert (=> b!939098 (= e!527452 e!527446)))

(declare-fun res!631705 () Bool)

(assert (=> b!939098 (=> (not res!631705) (not e!527446))))

(assert (=> b!939098 (= res!631705 (contains!5119 lt!424279 k!1099))))

(assert (=> b!939098 (= lt!424279 (getCurrentListMap!3291 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!939099 () Bool)

(assert (=> b!939099 (= e!527449 tp_is_empty!20269)))

(declare-fun b!939100 () Bool)

(declare-fun res!631704 () Bool)

(assert (=> b!939100 (=> (not res!631704) (not e!527452))))

(assert (=> b!939100 (= res!631704 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19161))))

(declare-fun b!939101 () Bool)

(declare-fun arrayContainsKey!0 (array!56482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!939101 (= e!527453 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun mapIsEmpty!32183 () Bool)

(assert (=> mapIsEmpty!32183 mapRes!32183))

(declare-fun b!939102 () Bool)

(declare-fun e!527456 () Bool)

(assert (=> b!939102 (= e!527451 (and e!527456 mapRes!32183))))

(declare-fun condMapEmpty!32183 () Bool)

(declare-fun mapDefault!32183 () ValueCell!9653)

