; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79000 () Bool)

(assert start!79000)

(declare-fun b_free!17213 () Bool)

(declare-fun b_next!17213 () Bool)

(assert (=> start!79000 (= b_free!17213 (not b_next!17213))))

(declare-fun tp!60080 () Bool)

(declare-fun b_and!28163 () Bool)

(assert (=> start!79000 (= tp!60080 b_and!28163)))

(declare-fun mapNonEmpty!31338 () Bool)

(declare-fun mapRes!31338 () Bool)

(declare-fun tp!60079 () Bool)

(declare-fun e!519143 () Bool)

(assert (=> mapNonEmpty!31338 (= mapRes!31338 (and tp!60079 e!519143))))

(declare-datatypes ((V!31259 0))(
  ( (V!31260 (val!9911 Int)) )
))
(declare-datatypes ((ValueCell!9379 0))(
  ( (ValueCellFull!9379 (v!12429 V!31259)) (EmptyCell!9379) )
))
(declare-fun mapValue!31338 () ValueCell!9379)

(declare-fun mapKey!31338 () (_ BitVec 32))

(declare-fun mapRest!31338 () (Array (_ BitVec 32) ValueCell!9379))

(declare-datatypes ((array!55410 0))(
  ( (array!55411 (arr!26650 (Array (_ BitVec 32) ValueCell!9379)) (size!27109 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55410)

(assert (=> mapNonEmpty!31338 (= (arr!26650 _values!1231) (store mapRest!31338 mapKey!31338 mapValue!31338))))

(declare-fun b!925021 () Bool)

(declare-fun res!623412 () Bool)

(declare-fun e!519148 () Bool)

(assert (=> b!925021 (=> (not res!623412) (not e!519148))))

(declare-datatypes ((array!55412 0))(
  ( (array!55413 (arr!26651 (Array (_ BitVec 32) (_ BitVec 64))) (size!27110 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55412)

(declare-datatypes ((List!18720 0))(
  ( (Nil!18717) (Cons!18716 (h!19862 (_ BitVec 64)) (t!26663 List!18720)) )
))
(declare-fun arrayNoDuplicates!0 (array!55412 (_ BitVec 32) List!18720) Bool)

(assert (=> b!925021 (= res!623412 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18717))))

(declare-fun b!925022 () Bool)

(declare-fun e!519137 () Bool)

(declare-fun e!519140 () Bool)

(assert (=> b!925022 (= e!519137 e!519140)))

(declare-fun res!623409 () Bool)

(assert (=> b!925022 (=> (not res!623409) (not e!519140))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!925022 (= res!623409 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27110 _keys!1487)))))

(declare-datatypes ((Unit!31243 0))(
  ( (Unit!31244) )
))
(declare-fun lt!416141 () Unit!31243)

(declare-fun e!519145 () Unit!31243)

(assert (=> b!925022 (= lt!416141 e!519145)))

(declare-fun c!96517 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925022 (= c!96517 (validKeyInArray!0 k!1099))))

(declare-fun b!925023 () Bool)

(declare-datatypes ((tuple2!12918 0))(
  ( (tuple2!12919 (_1!6470 (_ BitVec 64)) (_2!6470 V!31259)) )
))
(declare-datatypes ((List!18721 0))(
  ( (Nil!18718) (Cons!18717 (h!19863 tuple2!12918) (t!26664 List!18721)) )
))
(declare-datatypes ((ListLongMap!11615 0))(
  ( (ListLongMap!11616 (toList!5823 List!18721)) )
))
(declare-fun lt!416148 () ListLongMap!11615)

(declare-fun lt!416145 () V!31259)

(declare-fun apply!653 (ListLongMap!11615 (_ BitVec 64)) V!31259)

(assert (=> b!925023 (= (apply!653 lt!416148 k!1099) lt!416145)))

(declare-fun lt!416144 () V!31259)

(declare-fun lt!416146 () (_ BitVec 64))

(declare-fun lt!416152 () ListLongMap!11615)

(declare-fun lt!416143 () Unit!31243)

(declare-fun addApplyDifferent!375 (ListLongMap!11615 (_ BitVec 64) V!31259 (_ BitVec 64)) Unit!31243)

(assert (=> b!925023 (= lt!416143 (addApplyDifferent!375 lt!416152 lt!416146 lt!416144 k!1099))))

(assert (=> b!925023 (not (= lt!416146 k!1099))))

(declare-fun lt!416149 () Unit!31243)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55412 (_ BitVec 64) (_ BitVec 32) List!18720) Unit!31243)

(assert (=> b!925023 (= lt!416149 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18717))))

(declare-fun e!519138 () Bool)

(assert (=> b!925023 e!519138))

(declare-fun c!96518 () Bool)

(assert (=> b!925023 (= c!96518 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!416140 () Unit!31243)

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31259)

(declare-fun minValue!1173 () V!31259)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!226 (array!55412 array!55410 (_ BitVec 32) (_ BitVec 32) V!31259 V!31259 (_ BitVec 64) (_ BitVec 32) Int) Unit!31243)

(assert (=> b!925023 (= lt!416140 (lemmaListMapContainsThenArrayContainsFrom!226 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!925023 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18717)))

(declare-fun lt!416139 () Unit!31243)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55412 (_ BitVec 32) (_ BitVec 32)) Unit!31243)

(assert (=> b!925023 (= lt!416139 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4883 (ListLongMap!11615 (_ BitVec 64)) Bool)

(assert (=> b!925023 (contains!4883 lt!416148 k!1099)))

(declare-fun lt!416151 () tuple2!12918)

(declare-fun +!2719 (ListLongMap!11615 tuple2!12918) ListLongMap!11615)

(assert (=> b!925023 (= lt!416148 (+!2719 lt!416152 lt!416151))))

(declare-fun lt!416142 () Unit!31243)

(declare-fun addStillContains!443 (ListLongMap!11615 (_ BitVec 64) V!31259 (_ BitVec 64)) Unit!31243)

(assert (=> b!925023 (= lt!416142 (addStillContains!443 lt!416152 lt!416146 lt!416144 k!1099))))

(declare-fun getCurrentListMap!3074 (array!55412 array!55410 (_ BitVec 32) (_ BitVec 32) V!31259 V!31259 (_ BitVec 32) Int) ListLongMap!11615)

(assert (=> b!925023 (= (getCurrentListMap!3074 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2719 (getCurrentListMap!3074 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416151))))

(assert (=> b!925023 (= lt!416151 (tuple2!12919 lt!416146 lt!416144))))

(declare-fun get!14012 (ValueCell!9379 V!31259) V!31259)

(declare-fun dynLambda!1508 (Int (_ BitVec 64)) V!31259)

(assert (=> b!925023 (= lt!416144 (get!14012 (select (arr!26650 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1508 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416138 () Unit!31243)

(declare-fun lemmaListMapRecursiveValidKeyArray!109 (array!55412 array!55410 (_ BitVec 32) (_ BitVec 32) V!31259 V!31259 (_ BitVec 32) Int) Unit!31243)

(assert (=> b!925023 (= lt!416138 (lemmaListMapRecursiveValidKeyArray!109 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!519139 () Unit!31243)

(assert (=> b!925023 (= e!519139 lt!416143)))

(declare-fun b!925024 () Bool)

(declare-fun Unit!31245 () Unit!31243)

(assert (=> b!925024 (= e!519139 Unit!31245)))

(declare-fun b!925025 () Bool)

(assert (=> b!925025 (= e!519138 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925026 () Bool)

(declare-fun e!519144 () Bool)

(assert (=> b!925026 (= e!519144 e!519137)))

(declare-fun res!623406 () Bool)

(assert (=> b!925026 (=> (not res!623406) (not e!519137))))

(declare-fun v!791 () V!31259)

(assert (=> b!925026 (= res!623406 (and (= lt!416145 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925026 (= lt!416145 (apply!653 lt!416152 k!1099))))

(declare-fun b!925027 () Bool)

(declare-fun e!519146 () Bool)

(declare-fun e!519141 () Bool)

(assert (=> b!925027 (= e!519146 (and e!519141 mapRes!31338))))

(declare-fun condMapEmpty!31338 () Bool)

(declare-fun mapDefault!31338 () ValueCell!9379)

