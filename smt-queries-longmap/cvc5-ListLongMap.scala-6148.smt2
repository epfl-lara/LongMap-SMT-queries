; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78996 () Bool)

(assert start!78996)

(declare-fun b_free!17209 () Bool)

(declare-fun b_next!17209 () Bool)

(assert (=> start!78996 (= b_free!17209 (not b_next!17209))))

(declare-fun tp!60068 () Bool)

(declare-fun b_and!28155 () Bool)

(assert (=> start!78996 (= tp!60068 b_and!28155)))

(declare-fun b!924909 () Bool)

(declare-fun e!519070 () Bool)

(declare-fun e!519069 () Bool)

(assert (=> b!924909 (= e!519070 e!519069)))

(declare-fun res!623353 () Bool)

(assert (=> b!924909 (=> (not res!623353) (not e!519069))))

(declare-datatypes ((V!31255 0))(
  ( (V!31256 (val!9909 Int)) )
))
(declare-fun lt!416060 () V!31255)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun v!791 () V!31255)

(assert (=> b!924909 (= res!623353 (and (= lt!416060 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!12914 0))(
  ( (tuple2!12915 (_1!6468 (_ BitVec 64)) (_2!6468 V!31255)) )
))
(declare-datatypes ((List!18716 0))(
  ( (Nil!18713) (Cons!18712 (h!19858 tuple2!12914) (t!26655 List!18716)) )
))
(declare-datatypes ((ListLongMap!11611 0))(
  ( (ListLongMap!11612 (toList!5821 List!18716)) )
))
(declare-fun lt!416049 () ListLongMap!11611)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!651 (ListLongMap!11611 (_ BitVec 64)) V!31255)

(assert (=> b!924909 (= lt!416060 (apply!651 lt!416049 k!1099))))

(declare-fun b!924910 () Bool)

(declare-fun res!623357 () Bool)

(declare-fun e!519075 () Bool)

(assert (=> b!924910 (=> (not res!623357) (not e!519075))))

(declare-datatypes ((array!55402 0))(
  ( (array!55403 (arr!26646 (Array (_ BitVec 32) (_ BitVec 64))) (size!27105 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55402)

(assert (=> b!924910 (= res!623357 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27105 _keys!1487))))))

(declare-fun res!623359 () Bool)

(assert (=> start!78996 (=> (not res!623359) (not e!519075))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78996 (= res!623359 (validMask!0 mask!1881))))

(assert (=> start!78996 e!519075))

(assert (=> start!78996 true))

(declare-fun tp_is_empty!19717 () Bool)

(assert (=> start!78996 tp_is_empty!19717))

(declare-datatypes ((ValueCell!9377 0))(
  ( (ValueCellFull!9377 (v!12427 V!31255)) (EmptyCell!9377) )
))
(declare-datatypes ((array!55404 0))(
  ( (array!55405 (arr!26647 (Array (_ BitVec 32) ValueCell!9377)) (size!27106 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55404)

(declare-fun e!519066 () Bool)

(declare-fun array_inv!20752 (array!55404) Bool)

(assert (=> start!78996 (and (array_inv!20752 _values!1231) e!519066)))

(assert (=> start!78996 tp!60068))

(declare-fun array_inv!20753 (array!55402) Bool)

(assert (=> start!78996 (array_inv!20753 _keys!1487)))

(declare-fun b!924911 () Bool)

(assert (=> b!924911 (= e!519075 e!519070)))

(declare-fun res!623352 () Bool)

(assert (=> b!924911 (=> (not res!623352) (not e!519070))))

(declare-fun contains!4881 (ListLongMap!11611 (_ BitVec 64)) Bool)

(assert (=> b!924911 (= res!623352 (contains!4881 lt!416049 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31255)

(declare-fun minValue!1173 () V!31255)

(declare-fun getCurrentListMap!3072 (array!55402 array!55404 (_ BitVec 32) (_ BitVec 32) V!31255 V!31255 (_ BitVec 32) Int) ListLongMap!11611)

(assert (=> b!924911 (= lt!416049 (getCurrentListMap!3072 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924912 () Bool)

(declare-fun e!519073 () Bool)

(assert (=> b!924912 (= e!519069 e!519073)))

(declare-fun res!623356 () Bool)

(assert (=> b!924912 (=> (not res!623356) (not e!519073))))

(assert (=> b!924912 (= res!623356 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27105 _keys!1487)))))

(declare-datatypes ((Unit!31235 0))(
  ( (Unit!31236) )
))
(declare-fun lt!416056 () Unit!31235)

(declare-fun e!519071 () Unit!31235)

(assert (=> b!924912 (= lt!416056 e!519071)))

(declare-fun c!96500 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924912 (= c!96500 (validKeyInArray!0 k!1099))))

(declare-fun b!924913 () Bool)

(declare-fun Unit!31237 () Unit!31235)

(assert (=> b!924913 (= e!519071 Unit!31237)))

(declare-fun b!924914 () Bool)

(declare-fun e!519072 () Unit!31235)

(declare-fun Unit!31238 () Unit!31235)

(assert (=> b!924914 (= e!519072 Unit!31238)))

(declare-fun b!924915 () Bool)

(declare-fun res!623358 () Bool)

(assert (=> b!924915 (=> (not res!623358) (not e!519075))))

(assert (=> b!924915 (= res!623358 (and (= (size!27106 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27105 _keys!1487) (size!27106 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!924916 () Bool)

(declare-fun e!519065 () Bool)

(assert (=> b!924916 (= e!519065 tp_is_empty!19717)))

(declare-fun b!924917 () Bool)

(declare-fun lt!416057 () ListLongMap!11611)

(assert (=> b!924917 (= (apply!651 lt!416057 k!1099) lt!416060)))

(declare-fun lt!416062 () (_ BitVec 64))

(declare-fun lt!416055 () V!31255)

(declare-fun lt!416050 () Unit!31235)

(declare-fun addApplyDifferent!373 (ListLongMap!11611 (_ BitVec 64) V!31255 (_ BitVec 64)) Unit!31235)

(assert (=> b!924917 (= lt!416050 (addApplyDifferent!373 lt!416049 lt!416062 lt!416055 k!1099))))

(assert (=> b!924917 (not (= lt!416062 k!1099))))

(declare-fun lt!416061 () Unit!31235)

(declare-datatypes ((List!18717 0))(
  ( (Nil!18714) (Cons!18713 (h!19859 (_ BitVec 64)) (t!26656 List!18717)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55402 (_ BitVec 64) (_ BitVec 32) List!18717) Unit!31235)

(assert (=> b!924917 (= lt!416061 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18714))))

(declare-fun e!519067 () Bool)

(assert (=> b!924917 e!519067))

(declare-fun c!96501 () Bool)

(assert (=> b!924917 (= c!96501 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416048 () Unit!31235)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!224 (array!55402 array!55404 (_ BitVec 32) (_ BitVec 32) V!31255 V!31255 (_ BitVec 64) (_ BitVec 32) Int) Unit!31235)

(assert (=> b!924917 (= lt!416048 (lemmaListMapContainsThenArrayContainsFrom!224 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55402 (_ BitVec 32) List!18717) Bool)

(assert (=> b!924917 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18714)))

(declare-fun lt!416053 () Unit!31235)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55402 (_ BitVec 32) (_ BitVec 32)) Unit!31235)

(assert (=> b!924917 (= lt!416053 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!924917 (contains!4881 lt!416057 k!1099)))

(declare-fun lt!416059 () tuple2!12914)

(declare-fun +!2717 (ListLongMap!11611 tuple2!12914) ListLongMap!11611)

(assert (=> b!924917 (= lt!416057 (+!2717 lt!416049 lt!416059))))

(declare-fun lt!416052 () Unit!31235)

(declare-fun addStillContains!441 (ListLongMap!11611 (_ BitVec 64) V!31255 (_ BitVec 64)) Unit!31235)

(assert (=> b!924917 (= lt!416052 (addStillContains!441 lt!416049 lt!416062 lt!416055 k!1099))))

(assert (=> b!924917 (= (getCurrentListMap!3072 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2717 (getCurrentListMap!3072 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416059))))

(assert (=> b!924917 (= lt!416059 (tuple2!12915 lt!416062 lt!416055))))

(declare-fun get!14010 (ValueCell!9377 V!31255) V!31255)

(declare-fun dynLambda!1506 (Int (_ BitVec 64)) V!31255)

(assert (=> b!924917 (= lt!416055 (get!14010 (select (arr!26647 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1506 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416051 () Unit!31235)

(declare-fun lemmaListMapRecursiveValidKeyArray!107 (array!55402 array!55404 (_ BitVec 32) (_ BitVec 32) V!31255 V!31255 (_ BitVec 32) Int) Unit!31235)

(assert (=> b!924917 (= lt!416051 (lemmaListMapRecursiveValidKeyArray!107 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924917 (= e!519072 lt!416050)))

(declare-fun b!924918 () Bool)

(declare-fun res!623351 () Bool)

(assert (=> b!924918 (=> (not res!623351) (not e!519075))))

(assert (=> b!924918 (= res!623351 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18714))))

(declare-fun b!924919 () Bool)

(declare-fun e!519076 () Bool)

(assert (=> b!924919 (= e!519073 e!519076)))

(declare-fun res!623354 () Bool)

(assert (=> b!924919 (=> (not res!623354) (not e!519076))))

(declare-fun lt!416058 () ListLongMap!11611)

(assert (=> b!924919 (= res!623354 (contains!4881 lt!416058 k!1099))))

(assert (=> b!924919 (= lt!416058 (getCurrentListMap!3072 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924920 () Bool)

(assert (=> b!924920 (= e!519071 e!519072)))

(assert (=> b!924920 (= lt!416062 (select (arr!26646 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96499 () Bool)

(assert (=> b!924920 (= c!96499 (validKeyInArray!0 lt!416062))))

(declare-fun b!924921 () Bool)

(assert (=> b!924921 (= e!519076 false)))

(declare-fun lt!416054 () V!31255)

(assert (=> b!924921 (= lt!416054 (apply!651 lt!416058 k!1099))))

(declare-fun b!924922 () Bool)

(assert (=> b!924922 (= e!519067 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924923 () Bool)

(declare-fun res!623355 () Bool)

(assert (=> b!924923 (=> (not res!623355) (not e!519075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55402 (_ BitVec 32)) Bool)

(assert (=> b!924923 (= res!623355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31332 () Bool)

(declare-fun mapRes!31332 () Bool)

(assert (=> mapIsEmpty!31332 mapRes!31332))

(declare-fun mapNonEmpty!31332 () Bool)

(declare-fun tp!60067 () Bool)

(assert (=> mapNonEmpty!31332 (= mapRes!31332 (and tp!60067 e!519065))))

(declare-fun mapRest!31332 () (Array (_ BitVec 32) ValueCell!9377))

(declare-fun mapKey!31332 () (_ BitVec 32))

(declare-fun mapValue!31332 () ValueCell!9377)

(assert (=> mapNonEmpty!31332 (= (arr!26647 _values!1231) (store mapRest!31332 mapKey!31332 mapValue!31332))))

(declare-fun b!924924 () Bool)

(declare-fun arrayContainsKey!0 (array!55402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924924 (= e!519067 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!924925 () Bool)

(declare-fun e!519074 () Bool)

(assert (=> b!924925 (= e!519066 (and e!519074 mapRes!31332))))

(declare-fun condMapEmpty!31332 () Bool)

(declare-fun mapDefault!31332 () ValueCell!9377)

