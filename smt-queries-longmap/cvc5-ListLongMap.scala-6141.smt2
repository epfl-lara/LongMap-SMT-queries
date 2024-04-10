; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78954 () Bool)

(assert start!78954)

(declare-fun b_free!17167 () Bool)

(declare-fun b_next!17167 () Bool)

(assert (=> start!78954 (= b_free!17167 (not b_next!17167))))

(declare-fun tp!59941 () Bool)

(declare-fun b_and!28071 () Bool)

(assert (=> start!78954 (= tp!59941 b_and!28071)))

(declare-fun b!923733 () Bool)

(declare-datatypes ((V!31199 0))(
  ( (V!31200 (val!9888 Int)) )
))
(declare-datatypes ((tuple2!12876 0))(
  ( (tuple2!12877 (_1!6449 (_ BitVec 64)) (_2!6449 V!31199)) )
))
(declare-datatypes ((List!18680 0))(
  ( (Nil!18677) (Cons!18676 (h!19822 tuple2!12876) (t!26577 List!18680)) )
))
(declare-datatypes ((ListLongMap!11573 0))(
  ( (ListLongMap!11574 (toList!5802 List!18680)) )
))
(declare-fun lt!415115 () ListLongMap!11573)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun lt!415112 () V!31199)

(declare-fun apply!632 (ListLongMap!11573 (_ BitVec 64)) V!31199)

(assert (=> b!923733 (= (apply!632 lt!415115 k!1099) lt!415112)))

(declare-datatypes ((Unit!31172 0))(
  ( (Unit!31173) )
))
(declare-fun lt!415108 () Unit!31172)

(declare-fun lt!415107 () ListLongMap!11573)

(declare-fun lt!415117 () (_ BitVec 64))

(declare-fun lt!415111 () V!31199)

(declare-fun addApplyDifferent!358 (ListLongMap!11573 (_ BitVec 64) V!31199 (_ BitVec 64)) Unit!31172)

(assert (=> b!923733 (= lt!415108 (addApplyDifferent!358 lt!415107 lt!415117 lt!415111 k!1099))))

(assert (=> b!923733 (not (= lt!415117 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!415113 () Unit!31172)

(declare-datatypes ((array!55324 0))(
  ( (array!55325 (arr!26607 (Array (_ BitVec 32) (_ BitVec 64))) (size!27066 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55324)

(declare-datatypes ((List!18681 0))(
  ( (Nil!18678) (Cons!18677 (h!19823 (_ BitVec 64)) (t!26578 List!18681)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55324 (_ BitVec 64) (_ BitVec 32) List!18681) Unit!31172)

(assert (=> b!923733 (= lt!415113 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18678))))

(declare-fun e!518316 () Bool)

(assert (=> b!923733 e!518316))

(declare-fun c!96312 () Bool)

(assert (=> b!923733 (= c!96312 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9356 0))(
  ( (ValueCellFull!9356 (v!12406 V!31199)) (EmptyCell!9356) )
))
(declare-datatypes ((array!55326 0))(
  ( (array!55327 (arr!26608 (Array (_ BitVec 32) ValueCell!9356)) (size!27067 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55326)

(declare-fun lt!415114 () Unit!31172)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31199)

(declare-fun minValue!1173 () V!31199)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!209 (array!55324 array!55326 (_ BitVec 32) (_ BitVec 32) V!31199 V!31199 (_ BitVec 64) (_ BitVec 32) Int) Unit!31172)

(assert (=> b!923733 (= lt!415114 (lemmaListMapContainsThenArrayContainsFrom!209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55324 (_ BitVec 32) List!18681) Bool)

(assert (=> b!923733 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18678)))

(declare-fun lt!415110 () Unit!31172)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55324 (_ BitVec 32) (_ BitVec 32)) Unit!31172)

(assert (=> b!923733 (= lt!415110 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4864 (ListLongMap!11573 (_ BitVec 64)) Bool)

(assert (=> b!923733 (contains!4864 lt!415115 k!1099)))

(declare-fun lt!415109 () tuple2!12876)

(declare-fun +!2702 (ListLongMap!11573 tuple2!12876) ListLongMap!11573)

(assert (=> b!923733 (= lt!415115 (+!2702 lt!415107 lt!415109))))

(declare-fun lt!415105 () Unit!31172)

(declare-fun addStillContains!426 (ListLongMap!11573 (_ BitVec 64) V!31199 (_ BitVec 64)) Unit!31172)

(assert (=> b!923733 (= lt!415105 (addStillContains!426 lt!415107 lt!415117 lt!415111 k!1099))))

(declare-fun getCurrentListMap!3055 (array!55324 array!55326 (_ BitVec 32) (_ BitVec 32) V!31199 V!31199 (_ BitVec 32) Int) ListLongMap!11573)

(assert (=> b!923733 (= (getCurrentListMap!3055 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2702 (getCurrentListMap!3055 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415109))))

(assert (=> b!923733 (= lt!415109 (tuple2!12877 lt!415117 lt!415111))))

(declare-fun get!13981 (ValueCell!9356 V!31199) V!31199)

(declare-fun dynLambda!1491 (Int (_ BitVec 64)) V!31199)

(assert (=> b!923733 (= lt!415111 (get!13981 (select (arr!26608 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1491 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415106 () Unit!31172)

(declare-fun lemmaListMapRecursiveValidKeyArray!92 (array!55324 array!55326 (_ BitVec 32) (_ BitVec 32) V!31199 V!31199 (_ BitVec 32) Int) Unit!31172)

(assert (=> b!923733 (= lt!415106 (lemmaListMapRecursiveValidKeyArray!92 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!518313 () Unit!31172)

(assert (=> b!923733 (= e!518313 lt!415108)))

(declare-fun res!622791 () Bool)

(declare-fun e!518319 () Bool)

(assert (=> start!78954 (=> (not res!622791) (not e!518319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78954 (= res!622791 (validMask!0 mask!1881))))

(assert (=> start!78954 e!518319))

(assert (=> start!78954 true))

(declare-fun tp_is_empty!19675 () Bool)

(assert (=> start!78954 tp_is_empty!19675))

(declare-fun e!518318 () Bool)

(declare-fun array_inv!20722 (array!55326) Bool)

(assert (=> start!78954 (and (array_inv!20722 _values!1231) e!518318)))

(assert (=> start!78954 tp!59941))

(declare-fun array_inv!20723 (array!55324) Bool)

(assert (=> start!78954 (array_inv!20723 _keys!1487)))

(declare-fun b!923734 () Bool)

(declare-fun e!518314 () Bool)

(assert (=> b!923734 (= e!518319 e!518314)))

(declare-fun res!622785 () Bool)

(assert (=> b!923734 (=> (not res!622785) (not e!518314))))

(assert (=> b!923734 (= res!622785 (contains!4864 lt!415107 k!1099))))

(assert (=> b!923734 (= lt!415107 (getCurrentListMap!3055 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923735 () Bool)

(assert (=> b!923735 (= e!518316 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923736 () Bool)

(declare-fun e!518315 () Bool)

(assert (=> b!923736 (= e!518314 e!518315)))

(declare-fun res!622792 () Bool)

(assert (=> b!923736 (=> (not res!622792) (not e!518315))))

(declare-fun v!791 () V!31199)

(assert (=> b!923736 (= res!622792 (and (= lt!415112 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!923736 (= lt!415112 (apply!632 lt!415107 k!1099))))

(declare-fun b!923737 () Bool)

(declare-fun Unit!31174 () Unit!31172)

(assert (=> b!923737 (= e!518313 Unit!31174)))

(declare-fun b!923738 () Bool)

(declare-fun e!518312 () Bool)

(assert (=> b!923738 (= e!518312 tp_is_empty!19675)))

(declare-fun b!923739 () Bool)

(declare-fun e!518309 () Bool)

(assert (=> b!923739 (= e!518309 false)))

(declare-fun lt!415103 () V!31199)

(declare-fun lt!415104 () ListLongMap!11573)

(assert (=> b!923739 (= lt!415103 (apply!632 lt!415104 k!1099))))

(declare-fun b!923740 () Bool)

(declare-fun res!622786 () Bool)

(assert (=> b!923740 (=> (not res!622786) (not e!518319))))

(assert (=> b!923740 (= res!622786 (and (= (size!27067 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27066 _keys!1487) (size!27067 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31269 () Bool)

(declare-fun mapRes!31269 () Bool)

(declare-fun tp!59942 () Bool)

(declare-fun e!518311 () Bool)

(assert (=> mapNonEmpty!31269 (= mapRes!31269 (and tp!59942 e!518311))))

(declare-fun mapRest!31269 () (Array (_ BitVec 32) ValueCell!9356))

(declare-fun mapValue!31269 () ValueCell!9356)

(declare-fun mapKey!31269 () (_ BitVec 32))

(assert (=> mapNonEmpty!31269 (= (arr!26608 _values!1231) (store mapRest!31269 mapKey!31269 mapValue!31269))))

(declare-fun b!923741 () Bool)

(declare-fun e!518320 () Bool)

(assert (=> b!923741 (= e!518320 e!518309)))

(declare-fun res!622789 () Bool)

(assert (=> b!923741 (=> (not res!622789) (not e!518309))))

(assert (=> b!923741 (= res!622789 (contains!4864 lt!415104 k!1099))))

(assert (=> b!923741 (= lt!415104 (getCurrentListMap!3055 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923742 () Bool)

(declare-fun arrayContainsKey!0 (array!55324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923742 (= e!518316 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!923743 () Bool)

(assert (=> b!923743 (= e!518318 (and e!518312 mapRes!31269))))

(declare-fun condMapEmpty!31269 () Bool)

(declare-fun mapDefault!31269 () ValueCell!9356)

