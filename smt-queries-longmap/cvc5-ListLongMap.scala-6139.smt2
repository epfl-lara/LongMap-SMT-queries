; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78942 () Bool)

(assert start!78942)

(declare-fun b_free!17155 () Bool)

(declare-fun b_next!17155 () Bool)

(assert (=> start!78942 (= b_free!17155 (not b_next!17155))))

(declare-fun tp!59905 () Bool)

(declare-fun b_and!28047 () Bool)

(assert (=> start!78942 (= tp!59905 b_and!28047)))

(declare-fun b!923397 () Bool)

(declare-fun e!518094 () Bool)

(declare-fun e!518097 () Bool)

(assert (=> b!923397 (= e!518094 e!518097)))

(declare-fun res!622627 () Bool)

(assert (=> b!923397 (=> (not res!622627) (not e!518097))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55300 0))(
  ( (array!55301 (arr!26595 (Array (_ BitVec 32) (_ BitVec 64))) (size!27054 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55300)

(assert (=> b!923397 (= res!622627 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27054 _keys!1487)))))

(declare-datatypes ((Unit!31152 0))(
  ( (Unit!31153) )
))
(declare-fun lt!414837 () Unit!31152)

(declare-fun e!518093 () Unit!31152)

(assert (=> b!923397 (= lt!414837 e!518093)))

(declare-fun c!96258 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923397 (= c!96258 (validKeyInArray!0 k!1099))))

(declare-fun b!923398 () Bool)

(declare-fun res!622626 () Bool)

(declare-fun e!518101 () Bool)

(assert (=> b!923398 (=> (not res!622626) (not e!518101))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55300 (_ BitVec 32)) Bool)

(assert (=> b!923398 (= res!622626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923399 () Bool)

(declare-fun e!518096 () Bool)

(assert (=> b!923399 (= e!518101 e!518096)))

(declare-fun res!622623 () Bool)

(assert (=> b!923399 (=> (not res!622623) (not e!518096))))

(declare-datatypes ((V!31183 0))(
  ( (V!31184 (val!9882 Int)) )
))
(declare-datatypes ((tuple2!12864 0))(
  ( (tuple2!12865 (_1!6443 (_ BitVec 64)) (_2!6443 V!31183)) )
))
(declare-datatypes ((List!18668 0))(
  ( (Nil!18665) (Cons!18664 (h!19810 tuple2!12864) (t!26553 List!18668)) )
))
(declare-datatypes ((ListLongMap!11561 0))(
  ( (ListLongMap!11562 (toList!5796 List!18668)) )
))
(declare-fun lt!414845 () ListLongMap!11561)

(declare-fun contains!4858 (ListLongMap!11561 (_ BitVec 64)) Bool)

(assert (=> b!923399 (= res!622623 (contains!4858 lt!414845 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9350 0))(
  ( (ValueCellFull!9350 (v!12400 V!31183)) (EmptyCell!9350) )
))
(declare-datatypes ((array!55302 0))(
  ( (array!55303 (arr!26596 (Array (_ BitVec 32) ValueCell!9350)) (size!27055 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55302)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31183)

(declare-fun minValue!1173 () V!31183)

(declare-fun getCurrentListMap!3049 (array!55300 array!55302 (_ BitVec 32) (_ BitVec 32) V!31183 V!31183 (_ BitVec 32) Int) ListLongMap!11561)

(assert (=> b!923399 (= lt!414845 (getCurrentListMap!3049 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923400 () Bool)

(declare-fun e!518103 () Bool)

(declare-fun tp_is_empty!19663 () Bool)

(assert (=> b!923400 (= e!518103 tp_is_empty!19663)))

(declare-fun b!923401 () Bool)

(declare-fun res!622622 () Bool)

(assert (=> b!923401 (=> (not res!622622) (not e!518101))))

(assert (=> b!923401 (= res!622622 (and (= (size!27055 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27054 _keys!1487) (size!27055 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923402 () Bool)

(assert (=> b!923402 (= e!518096 e!518094)))

(declare-fun res!622625 () Bool)

(assert (=> b!923402 (=> (not res!622625) (not e!518094))))

(declare-fun v!791 () V!31183)

(declare-fun lt!414841 () V!31183)

(assert (=> b!923402 (= res!622625 (and (= lt!414841 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!626 (ListLongMap!11561 (_ BitVec 64)) V!31183)

(assert (=> b!923402 (= lt!414841 (apply!626 lt!414845 k!1099))))

(declare-fun b!923403 () Bool)

(declare-fun e!518104 () Unit!31152)

(declare-fun Unit!31154 () Unit!31152)

(assert (=> b!923403 (= e!518104 Unit!31154)))

(declare-fun b!923404 () Bool)

(declare-fun e!518098 () Bool)

(declare-fun arrayContainsKey!0 (array!55300 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923404 (= e!518098 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!923405 () Bool)

(declare-fun lt!414834 () ListLongMap!11561)

(assert (=> b!923405 (= (apply!626 lt!414834 k!1099) lt!414841)))

(declare-fun lt!414842 () (_ BitVec 64))

(declare-fun lt!414836 () Unit!31152)

(declare-fun lt!414846 () V!31183)

(declare-fun addApplyDifferent!354 (ListLongMap!11561 (_ BitVec 64) V!31183 (_ BitVec 64)) Unit!31152)

(assert (=> b!923405 (= lt!414836 (addApplyDifferent!354 lt!414845 lt!414842 lt!414846 k!1099))))

(assert (=> b!923405 (not (= lt!414842 k!1099))))

(declare-fun lt!414843 () Unit!31152)

(declare-datatypes ((List!18669 0))(
  ( (Nil!18666) (Cons!18665 (h!19811 (_ BitVec 64)) (t!26554 List!18669)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55300 (_ BitVec 64) (_ BitVec 32) List!18669) Unit!31152)

(assert (=> b!923405 (= lt!414843 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18666))))

(assert (=> b!923405 e!518098))

(declare-fun c!96257 () Bool)

(assert (=> b!923405 (= c!96257 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414838 () Unit!31152)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!205 (array!55300 array!55302 (_ BitVec 32) (_ BitVec 32) V!31183 V!31183 (_ BitVec 64) (_ BitVec 32) Int) Unit!31152)

(assert (=> b!923405 (= lt!414838 (lemmaListMapContainsThenArrayContainsFrom!205 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55300 (_ BitVec 32) List!18669) Bool)

(assert (=> b!923405 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18666)))

(declare-fun lt!414840 () Unit!31152)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55300 (_ BitVec 32) (_ BitVec 32)) Unit!31152)

(assert (=> b!923405 (= lt!414840 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!923405 (contains!4858 lt!414834 k!1099)))

(declare-fun lt!414839 () tuple2!12864)

(declare-fun +!2698 (ListLongMap!11561 tuple2!12864) ListLongMap!11561)

(assert (=> b!923405 (= lt!414834 (+!2698 lt!414845 lt!414839))))

(declare-fun lt!414844 () Unit!31152)

(declare-fun addStillContains!422 (ListLongMap!11561 (_ BitVec 64) V!31183 (_ BitVec 64)) Unit!31152)

(assert (=> b!923405 (= lt!414844 (addStillContains!422 lt!414845 lt!414842 lt!414846 k!1099))))

(assert (=> b!923405 (= (getCurrentListMap!3049 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2698 (getCurrentListMap!3049 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414839))))

(assert (=> b!923405 (= lt!414839 (tuple2!12865 lt!414842 lt!414846))))

(declare-fun get!13973 (ValueCell!9350 V!31183) V!31183)

(declare-fun dynLambda!1487 (Int (_ BitVec 64)) V!31183)

(assert (=> b!923405 (= lt!414846 (get!13973 (select (arr!26596 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1487 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414835 () Unit!31152)

(declare-fun lemmaListMapRecursiveValidKeyArray!88 (array!55300 array!55302 (_ BitVec 32) (_ BitVec 32) V!31183 V!31183 (_ BitVec 32) Int) Unit!31152)

(assert (=> b!923405 (= lt!414835 (lemmaListMapRecursiveValidKeyArray!88 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!923405 (= e!518104 lt!414836)))

(declare-fun b!923406 () Bool)

(assert (=> b!923406 (= e!518098 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923407 () Bool)

(declare-fun Unit!31155 () Unit!31152)

(assert (=> b!923407 (= e!518093 Unit!31155)))

(declare-fun b!923408 () Bool)

(declare-fun res!622629 () Bool)

(assert (=> b!923408 (=> (not res!622629) (not e!518101))))

(assert (=> b!923408 (= res!622629 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27054 _keys!1487))))))

(declare-fun res!622628 () Bool)

(assert (=> start!78942 (=> (not res!622628) (not e!518101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78942 (= res!622628 (validMask!0 mask!1881))))

(assert (=> start!78942 e!518101))

(assert (=> start!78942 true))

(assert (=> start!78942 tp_is_empty!19663))

(declare-fun e!518095 () Bool)

(declare-fun array_inv!20712 (array!55302) Bool)

(assert (=> start!78942 (and (array_inv!20712 _values!1231) e!518095)))

(assert (=> start!78942 tp!59905))

(declare-fun array_inv!20713 (array!55300) Bool)

(assert (=> start!78942 (array_inv!20713 _keys!1487)))

(declare-fun b!923409 () Bool)

(declare-fun mapRes!31251 () Bool)

(assert (=> b!923409 (= e!518095 (and e!518103 mapRes!31251))))

(declare-fun condMapEmpty!31251 () Bool)

(declare-fun mapDefault!31251 () ValueCell!9350)

