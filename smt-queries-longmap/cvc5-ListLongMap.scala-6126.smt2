; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78864 () Bool)

(assert start!78864)

(declare-fun b_free!17077 () Bool)

(declare-fun b_next!17077 () Bool)

(assert (=> start!78864 (= b_free!17077 (not b_next!17077))))

(declare-fun tp!59671 () Bool)

(declare-fun b_and!27891 () Bool)

(assert (=> start!78864 (= tp!59671 b_and!27891)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!921483 () Bool)

(declare-fun e!517099 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((array!55148 0))(
  ( (array!55149 (arr!26519 (Array (_ BitVec 32) (_ BitVec 64))) (size!26978 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55148)

(declare-fun arrayContainsKey!0 (array!55148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921483 (= e!517099 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!921484 () Bool)

(declare-fun res!621415 () Bool)

(declare-fun e!517100 () Bool)

(assert (=> b!921484 (=> (not res!621415) (not e!517100))))

(declare-datatypes ((List!18606 0))(
  ( (Nil!18603) (Cons!18602 (h!19748 (_ BitVec 64)) (t!26413 List!18606)) )
))
(declare-fun arrayNoDuplicates!0 (array!55148 (_ BitVec 32) List!18606) Bool)

(assert (=> b!921484 (= res!621415 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18603))))

(declare-fun b!921485 () Bool)

(declare-fun res!621425 () Bool)

(assert (=> b!921485 (=> (not res!621425) (not e!517100))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55148 (_ BitVec 32)) Bool)

(assert (=> b!921485 (= res!621425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921487 () Bool)

(declare-fun res!621424 () Bool)

(declare-fun e!517104 () Bool)

(assert (=> b!921487 (=> res!621424 e!517104)))

(declare-fun noDuplicate!1346 (List!18606) Bool)

(assert (=> b!921487 (= res!621424 (not (noDuplicate!1346 Nil!18603)))))

(declare-fun b!921488 () Bool)

(declare-fun res!621418 () Bool)

(declare-fun e!517097 () Bool)

(assert (=> b!921488 (=> (not res!621418) (not e!517097))))

(assert (=> b!921488 (= res!621418 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921489 () Bool)

(declare-fun res!621416 () Bool)

(assert (=> b!921489 (=> (not res!621416) (not e!517097))))

(declare-datatypes ((V!31079 0))(
  ( (V!31080 (val!9843 Int)) )
))
(declare-fun v!791 () V!31079)

(declare-datatypes ((tuple2!12802 0))(
  ( (tuple2!12803 (_1!6412 (_ BitVec 64)) (_2!6412 V!31079)) )
))
(declare-datatypes ((List!18607 0))(
  ( (Nil!18604) (Cons!18603 (h!19749 tuple2!12802) (t!26414 List!18607)) )
))
(declare-datatypes ((ListLongMap!11499 0))(
  ( (ListLongMap!11500 (toList!5765 List!18607)) )
))
(declare-fun lt!413715 () ListLongMap!11499)

(declare-fun apply!604 (ListLongMap!11499 (_ BitVec 64)) V!31079)

(assert (=> b!921489 (= res!621416 (= (apply!604 lt!413715 k!1099) v!791))))

(declare-fun b!921490 () Bool)

(declare-fun e!517103 () Bool)

(assert (=> b!921490 (= e!517097 e!517103)))

(declare-fun res!621420 () Bool)

(assert (=> b!921490 (=> (not res!621420) (not e!517103))))

(declare-fun lt!413714 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921490 (= res!621420 (validKeyInArray!0 lt!413714))))

(assert (=> b!921490 (= lt!413714 (select (arr!26519 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921491 () Bool)

(declare-fun e!517098 () Bool)

(declare-fun tp_is_empty!19585 () Bool)

(assert (=> b!921491 (= e!517098 tp_is_empty!19585)))

(declare-fun b!921492 () Bool)

(declare-fun res!621426 () Bool)

(assert (=> b!921492 (=> (not res!621426) (not e!517100))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9311 0))(
  ( (ValueCellFull!9311 (v!12361 V!31079)) (EmptyCell!9311) )
))
(declare-datatypes ((array!55150 0))(
  ( (array!55151 (arr!26520 (Array (_ BitVec 32) ValueCell!9311)) (size!26979 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55150)

(assert (=> b!921492 (= res!621426 (and (= (size!26979 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26978 _keys!1487) (size!26979 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921493 () Bool)

(assert (=> b!921493 (= e!517103 (not e!517104))))

(declare-fun res!621427 () Bool)

(assert (=> b!921493 (=> res!621427 e!517104)))

(assert (=> b!921493 (= res!621427 (or (bvsge (size!26978 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26978 _keys!1487))))))

(assert (=> b!921493 e!517099))

(declare-fun c!96117 () Bool)

(assert (=> b!921493 (= c!96117 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31092 0))(
  ( (Unit!31093) )
))
(declare-fun lt!413719 () Unit!31092)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31079)

(declare-fun minValue!1173 () V!31079)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!179 (array!55148 array!55150 (_ BitVec 32) (_ BitVec 32) V!31079 V!31079 (_ BitVec 64) (_ BitVec 32) Int) Unit!31092)

(assert (=> b!921493 (= lt!413719 (lemmaListMapContainsThenArrayContainsFrom!179 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!921493 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18603)))

(declare-fun lt!413718 () Unit!31092)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55148 (_ BitVec 32) (_ BitVec 32)) Unit!31092)

(assert (=> b!921493 (= lt!413718 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413722 () tuple2!12802)

(declare-fun contains!4825 (ListLongMap!11499 (_ BitVec 64)) Bool)

(declare-fun +!2672 (ListLongMap!11499 tuple2!12802) ListLongMap!11499)

(assert (=> b!921493 (contains!4825 (+!2672 lt!413715 lt!413722) k!1099)))

(declare-fun lt!413717 () Unit!31092)

(declare-fun lt!413716 () V!31079)

(declare-fun addStillContains!396 (ListLongMap!11499 (_ BitVec 64) V!31079 (_ BitVec 64)) Unit!31092)

(assert (=> b!921493 (= lt!413717 (addStillContains!396 lt!413715 lt!413714 lt!413716 k!1099))))

(declare-fun getCurrentListMap!3019 (array!55148 array!55150 (_ BitVec 32) (_ BitVec 32) V!31079 V!31079 (_ BitVec 32) Int) ListLongMap!11499)

(assert (=> b!921493 (= (getCurrentListMap!3019 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2672 (getCurrentListMap!3019 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413722))))

(assert (=> b!921493 (= lt!413722 (tuple2!12803 lt!413714 lt!413716))))

(declare-fun get!13921 (ValueCell!9311 V!31079) V!31079)

(declare-fun dynLambda!1461 (Int (_ BitVec 64)) V!31079)

(assert (=> b!921493 (= lt!413716 (get!13921 (select (arr!26520 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1461 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413720 () Unit!31092)

(declare-fun lemmaListMapRecursiveValidKeyArray!62 (array!55148 array!55150 (_ BitVec 32) (_ BitVec 32) V!31079 V!31079 (_ BitVec 32) Int) Unit!31092)

(assert (=> b!921493 (= lt!413720 (lemmaListMapRecursiveValidKeyArray!62 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921494 () Bool)

(declare-fun e!517101 () Bool)

(assert (=> b!921494 (= e!517101 tp_is_empty!19585)))

(declare-fun b!921495 () Bool)

(assert (=> b!921495 (= e!517104 true)))

(declare-fun lt!413721 () Bool)

(declare-fun contains!4826 (List!18606 (_ BitVec 64)) Bool)

(assert (=> b!921495 (= lt!413721 (contains!4826 Nil!18603 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!31134 () Bool)

(declare-fun mapRes!31134 () Bool)

(assert (=> mapIsEmpty!31134 mapRes!31134))

(declare-fun b!921496 () Bool)

(declare-fun res!621422 () Bool)

(assert (=> b!921496 (=> res!621422 e!517104)))

(assert (=> b!921496 (= res!621422 (contains!4826 Nil!18603 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921486 () Bool)

(declare-fun e!517102 () Bool)

(assert (=> b!921486 (= e!517102 (and e!517098 mapRes!31134))))

(declare-fun condMapEmpty!31134 () Bool)

(declare-fun mapDefault!31134 () ValueCell!9311)

