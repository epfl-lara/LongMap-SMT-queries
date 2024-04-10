; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79492 () Bool)

(assert start!79492)

(declare-fun b_free!17647 () Bool)

(declare-fun b_next!17647 () Bool)

(assert (=> start!79492 (= b_free!17647 (not b_next!17647))))

(declare-fun tp!61388 () Bool)

(declare-fun b_and!28861 () Bool)

(assert (=> start!79492 (= tp!61388 b_and!28861)))

(declare-fun b!934512 () Bool)

(declare-fun res!629394 () Bool)

(declare-fun e!524724 () Bool)

(assert (=> b!934512 (=> (not res!629394) (not e!524724))))

(declare-datatypes ((array!56248 0))(
  ( (array!56249 (arr!27067 (Array (_ BitVec 32) (_ BitVec 64))) (size!27526 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56248)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56248 (_ BitVec 32)) Bool)

(assert (=> b!934512 (= res!629394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!934513 () Bool)

(declare-fun res!629396 () Bool)

(assert (=> b!934513 (=> (not res!629396) (not e!524724))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!934513 (= res!629396 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27526 _keys!1487))))))

(declare-fun b!934514 () Bool)

(declare-fun e!524723 () Bool)

(declare-fun tp_is_empty!20155 () Bool)

(assert (=> b!934514 (= e!524723 tp_is_empty!20155)))

(declare-fun b!934515 () Bool)

(declare-fun res!629393 () Bool)

(assert (=> b!934515 (=> (not res!629393) (not e!524724))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31839 0))(
  ( (V!31840 (val!10128 Int)) )
))
(declare-datatypes ((ValueCell!9596 0))(
  ( (ValueCellFull!9596 (v!12648 V!31839)) (EmptyCell!9596) )
))
(declare-datatypes ((array!56250 0))(
  ( (array!56251 (arr!27068 (Array (_ BitVec 32) ValueCell!9596)) (size!27527 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56250)

(assert (=> b!934515 (= res!629393 (and (= (size!27527 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27526 _keys!1487) (size!27527 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!934516 () Bool)

(declare-fun res!629395 () Bool)

(declare-fun e!524717 () Bool)

(assert (=> b!934516 (=> (not res!629395) (not e!524717))))

(assert (=> b!934516 (= res!629395 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934517 () Bool)

(assert (=> b!934517 (= e!524724 e!524717)))

(declare-fun res!629389 () Bool)

(assert (=> b!934517 (=> (not res!629389) (not e!524717))))

(declare-datatypes ((tuple2!13286 0))(
  ( (tuple2!13287 (_1!6654 (_ BitVec 64)) (_2!6654 V!31839)) )
))
(declare-datatypes ((List!19066 0))(
  ( (Nil!19063) (Cons!19062 (h!20208 tuple2!13286) (t!27257 List!19066)) )
))
(declare-datatypes ((ListLongMap!11983 0))(
  ( (ListLongMap!11984 (toList!6007 List!19066)) )
))
(declare-fun lt!421023 () ListLongMap!11983)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5057 (ListLongMap!11983 (_ BitVec 64)) Bool)

(assert (=> b!934517 (= res!629389 (contains!5057 lt!421023 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31839)

(declare-fun minValue!1173 () V!31839)

(declare-fun getCurrentListMap!3244 (array!56248 array!56250 (_ BitVec 32) (_ BitVec 32) V!31839 V!31839 (_ BitVec 32) Int) ListLongMap!11983)

(assert (=> b!934517 (= lt!421023 (getCurrentListMap!3244 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934518 () Bool)

(declare-fun res!629397 () Bool)

(assert (=> b!934518 (=> (not res!629397) (not e!524724))))

(declare-datatypes ((List!19067 0))(
  ( (Nil!19064) (Cons!19063 (h!20209 (_ BitVec 64)) (t!27258 List!19067)) )
))
(declare-fun arrayNoDuplicates!0 (array!56248 (_ BitVec 32) List!19067) Bool)

(assert (=> b!934518 (= res!629397 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19064))))

(declare-fun b!934519 () Bool)

(declare-fun e!524722 () Bool)

(assert (=> b!934519 (= e!524722 (not (or (bvsge (size!27526 _keys!1487) #b01111111111111111111111111111111) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27526 _keys!1487)))))))

(declare-fun e!524721 () Bool)

(assert (=> b!934519 e!524721))

(declare-fun c!97161 () Bool)

(assert (=> b!934519 (= c!97161 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31530 0))(
  ( (Unit!31531) )
))
(declare-fun lt!421017 () Unit!31530)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!277 (array!56248 array!56250 (_ BitVec 32) (_ BitVec 32) V!31839 V!31839 (_ BitVec 64) (_ BitVec 32) Int) Unit!31530)

(assert (=> b!934519 (= lt!421017 (lemmaListMapContainsThenArrayContainsFrom!277 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!934519 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19064)))

(declare-fun lt!421018 () Unit!31530)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56248 (_ BitVec 32) (_ BitVec 32)) Unit!31530)

(assert (=> b!934519 (= lt!421018 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421020 () tuple2!13286)

(declare-fun +!2805 (ListLongMap!11983 tuple2!13286) ListLongMap!11983)

(assert (=> b!934519 (contains!5057 (+!2805 lt!421023 lt!421020) k!1099)))

(declare-fun lt!421016 () (_ BitVec 64))

(declare-fun lt!421021 () Unit!31530)

(declare-fun lt!421019 () V!31839)

(declare-fun addStillContains!524 (ListLongMap!11983 (_ BitVec 64) V!31839 (_ BitVec 64)) Unit!31530)

(assert (=> b!934519 (= lt!421021 (addStillContains!524 lt!421023 lt!421016 lt!421019 k!1099))))

(assert (=> b!934519 (= (getCurrentListMap!3244 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2805 (getCurrentListMap!3244 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421020))))

(assert (=> b!934519 (= lt!421020 (tuple2!13287 lt!421016 lt!421019))))

(declare-fun get!14250 (ValueCell!9596 V!31839) V!31839)

(declare-fun dynLambda!1594 (Int (_ BitVec 64)) V!31839)

(assert (=> b!934519 (= lt!421019 (get!14250 (select (arr!27068 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1594 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421022 () Unit!31530)

(declare-fun lemmaListMapRecursiveValidKeyArray!195 (array!56248 array!56250 (_ BitVec 32) (_ BitVec 32) V!31839 V!31839 (_ BitVec 32) Int) Unit!31530)

(assert (=> b!934519 (= lt!421022 (lemmaListMapRecursiveValidKeyArray!195 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!934520 () Bool)

(declare-fun arrayContainsKey!0 (array!56248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!934520 (= e!524721 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun mapNonEmpty!31995 () Bool)

(declare-fun mapRes!31995 () Bool)

(declare-fun tp!61387 () Bool)

(assert (=> mapNonEmpty!31995 (= mapRes!31995 (and tp!61387 e!524723))))

(declare-fun mapRest!31995 () (Array (_ BitVec 32) ValueCell!9596))

(declare-fun mapKey!31995 () (_ BitVec 32))

(declare-fun mapValue!31995 () ValueCell!9596)

(assert (=> mapNonEmpty!31995 (= (arr!27068 _values!1231) (store mapRest!31995 mapKey!31995 mapValue!31995))))

(declare-fun b!934521 () Bool)

(assert (=> b!934521 (= e!524717 e!524722)))

(declare-fun res!629392 () Bool)

(assert (=> b!934521 (=> (not res!629392) (not e!524722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934521 (= res!629392 (validKeyInArray!0 lt!421016))))

(assert (=> b!934521 (= lt!421016 (select (arr!27067 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934522 () Bool)

(declare-fun e!524719 () Bool)

(assert (=> b!934522 (= e!524719 tp_is_empty!20155)))

(declare-fun b!934523 () Bool)

(declare-fun res!629391 () Bool)

(assert (=> b!934523 (=> (not res!629391) (not e!524717))))

(declare-fun v!791 () V!31839)

(declare-fun apply!811 (ListLongMap!11983 (_ BitVec 64)) V!31839)

(assert (=> b!934523 (= res!629391 (= (apply!811 lt!421023 k!1099) v!791))))

(declare-fun res!629390 () Bool)

(assert (=> start!79492 (=> (not res!629390) (not e!524724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79492 (= res!629390 (validMask!0 mask!1881))))

(assert (=> start!79492 e!524724))

(assert (=> start!79492 true))

(assert (=> start!79492 tp_is_empty!20155))

(declare-fun e!524720 () Bool)

(declare-fun array_inv!21064 (array!56250) Bool)

(assert (=> start!79492 (and (array_inv!21064 _values!1231) e!524720)))

(assert (=> start!79492 tp!61388))

(declare-fun array_inv!21065 (array!56248) Bool)

(assert (=> start!79492 (array_inv!21065 _keys!1487)))

(declare-fun b!934524 () Bool)

(declare-fun res!629398 () Bool)

(assert (=> b!934524 (=> (not res!629398) (not e!524717))))

(assert (=> b!934524 (= res!629398 (validKeyInArray!0 k!1099))))

(declare-fun b!934525 () Bool)

(assert (=> b!934525 (= e!524720 (and e!524719 mapRes!31995))))

(declare-fun condMapEmpty!31995 () Bool)

(declare-fun mapDefault!31995 () ValueCell!9596)

