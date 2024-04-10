; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79036 () Bool)

(assert start!79036)

(declare-fun b_free!17249 () Bool)

(declare-fun b_next!17249 () Bool)

(assert (=> start!79036 (= b_free!17249 (not b_next!17249))))

(declare-fun tp!60188 () Bool)

(declare-fun b_and!28235 () Bool)

(assert (=> start!79036 (= tp!60188 b_and!28235)))

(declare-fun b!926135 () Bool)

(declare-fun res!624003 () Bool)

(declare-fun e!519847 () Bool)

(assert (=> b!926135 (=> (not res!624003) (not e!519847))))

(declare-datatypes ((array!55480 0))(
  ( (array!55481 (arr!26685 (Array (_ BitVec 32) (_ BitVec 64))) (size!27144 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55480)

(declare-datatypes ((List!18754 0))(
  ( (Nil!18751) (Cons!18750 (h!19896 (_ BitVec 64)) (t!26733 List!18754)) )
))
(declare-fun arrayNoDuplicates!0 (array!55480 (_ BitVec 32) List!18754) Bool)

(assert (=> b!926135 (= res!624003 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18751))))

(declare-fun b!926136 () Bool)

(declare-fun e!519842 () Bool)

(declare-fun tp_is_empty!19757 () Bool)

(assert (=> b!926136 (= e!519842 tp_is_empty!19757)))

(declare-fun b!926137 () Bool)

(declare-datatypes ((V!31307 0))(
  ( (V!31308 (val!9929 Int)) )
))
(declare-datatypes ((tuple2!12952 0))(
  ( (tuple2!12953 (_1!6487 (_ BitVec 64)) (_2!6487 V!31307)) )
))
(declare-datatypes ((List!18755 0))(
  ( (Nil!18752) (Cons!18751 (h!19897 tuple2!12952) (t!26734 List!18755)) )
))
(declare-datatypes ((ListLongMap!11649 0))(
  ( (ListLongMap!11650 (toList!5840 List!18755)) )
))
(declare-fun lt!417010 () ListLongMap!11649)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun lt!417005 () V!31307)

(declare-fun apply!670 (ListLongMap!11649 (_ BitVec 64)) V!31307)

(assert (=> b!926137 (= (apply!670 lt!417010 k!1099) lt!417005)))

(declare-fun lt!417016 () ListLongMap!11649)

(declare-datatypes ((Unit!31306 0))(
  ( (Unit!31307) )
))
(declare-fun lt!417003 () Unit!31306)

(declare-fun lt!417014 () V!31307)

(declare-fun lt!417008 () (_ BitVec 64))

(declare-fun addApplyDifferent!390 (ListLongMap!11649 (_ BitVec 64) V!31307 (_ BitVec 64)) Unit!31306)

(assert (=> b!926137 (= lt!417003 (addApplyDifferent!390 lt!417016 lt!417008 lt!417014 k!1099))))

(assert (=> b!926137 (not (= lt!417008 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!417015 () Unit!31306)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55480 (_ BitVec 64) (_ BitVec 32) List!18754) Unit!31306)

(assert (=> b!926137 (= lt!417015 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18751))))

(declare-fun e!519846 () Bool)

(assert (=> b!926137 e!519846))

(declare-fun c!96679 () Bool)

(assert (=> b!926137 (= c!96679 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9397 0))(
  ( (ValueCellFull!9397 (v!12447 V!31307)) (EmptyCell!9397) )
))
(declare-datatypes ((array!55482 0))(
  ( (array!55483 (arr!26686 (Array (_ BitVec 32) ValueCell!9397)) (size!27145 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55482)

(declare-fun lt!417007 () Unit!31306)

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31307)

(declare-fun minValue!1173 () V!31307)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!241 (array!55480 array!55482 (_ BitVec 32) (_ BitVec 32) V!31307 V!31307 (_ BitVec 64) (_ BitVec 32) Int) Unit!31306)

(assert (=> b!926137 (= lt!417007 (lemmaListMapContainsThenArrayContainsFrom!241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!926137 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18751)))

(declare-fun lt!417009 () Unit!31306)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55480 (_ BitVec 32) (_ BitVec 32)) Unit!31306)

(assert (=> b!926137 (= lt!417009 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4899 (ListLongMap!11649 (_ BitVec 64)) Bool)

(assert (=> b!926137 (contains!4899 lt!417010 k!1099)))

(declare-fun lt!417012 () tuple2!12952)

(declare-fun +!2734 (ListLongMap!11649 tuple2!12952) ListLongMap!11649)

(assert (=> b!926137 (= lt!417010 (+!2734 lt!417016 lt!417012))))

(declare-fun lt!417006 () Unit!31306)

(declare-fun addStillContains!458 (ListLongMap!11649 (_ BitVec 64) V!31307 (_ BitVec 64)) Unit!31306)

(assert (=> b!926137 (= lt!417006 (addStillContains!458 lt!417016 lt!417008 lt!417014 k!1099))))

(declare-fun getCurrentListMap!3090 (array!55480 array!55482 (_ BitVec 32) (_ BitVec 32) V!31307 V!31307 (_ BitVec 32) Int) ListLongMap!11649)

(assert (=> b!926137 (= (getCurrentListMap!3090 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2734 (getCurrentListMap!3090 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417012))))

(assert (=> b!926137 (= lt!417012 (tuple2!12953 lt!417008 lt!417014))))

(declare-fun get!14039 (ValueCell!9397 V!31307) V!31307)

(declare-fun dynLambda!1523 (Int (_ BitVec 64)) V!31307)

(assert (=> b!926137 (= lt!417014 (get!14039 (select (arr!26686 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1523 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417004 () Unit!31306)

(declare-fun lemmaListMapRecursiveValidKeyArray!124 (array!55480 array!55482 (_ BitVec 32) (_ BitVec 32) V!31307 V!31307 (_ BitVec 32) Int) Unit!31306)

(assert (=> b!926137 (= lt!417004 (lemmaListMapRecursiveValidKeyArray!124 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!519841 () Unit!31306)

(assert (=> b!926137 (= e!519841 lt!417003)))

(declare-fun b!926138 () Bool)

(declare-fun res!624002 () Bool)

(assert (=> b!926138 (=> (not res!624002) (not e!519847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55480 (_ BitVec 32)) Bool)

(assert (=> b!926138 (= res!624002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926139 () Bool)

(declare-fun e!519838 () Unit!31306)

(assert (=> b!926139 (= e!519838 e!519841)))

(assert (=> b!926139 (= lt!417008 (select (arr!26685 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96681 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926139 (= c!96681 (validKeyInArray!0 lt!417008))))

(declare-fun v!791 () V!31307)

(declare-fun b!926140 () Bool)

(declare-fun lt!417002 () ListLongMap!11649)

(declare-fun e!519845 () Bool)

(assert (=> b!926140 (= e!519845 (= (apply!670 lt!417002 k!1099) v!791))))

(declare-fun b!926141 () Bool)

(declare-fun Unit!31308 () Unit!31306)

(assert (=> b!926141 (= e!519838 Unit!31308)))

(declare-fun res!623999 () Bool)

(assert (=> start!79036 (=> (not res!623999) (not e!519847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79036 (= res!623999 (validMask!0 mask!1881))))

(assert (=> start!79036 e!519847))

(assert (=> start!79036 true))

(assert (=> start!79036 tp_is_empty!19757))

(declare-fun e!519839 () Bool)

(declare-fun array_inv!20784 (array!55482) Bool)

(assert (=> start!79036 (and (array_inv!20784 _values!1231) e!519839)))

(assert (=> start!79036 tp!60188))

(declare-fun array_inv!20785 (array!55480) Bool)

(assert (=> start!79036 (array_inv!20785 _keys!1487)))

(declare-fun b!926142 () Bool)

(declare-fun res!624001 () Bool)

(assert (=> b!926142 (=> (not res!624001) (not e!519847))))

(assert (=> b!926142 (= res!624001 (and (= (size!27145 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27144 _keys!1487) (size!27145 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!926143 () Bool)

(declare-fun res!624004 () Bool)

(declare-fun e!519850 () Bool)

(assert (=> b!926143 (=> (not res!624004) (not e!519850))))

(declare-fun lt!417013 () ListLongMap!11649)

(assert (=> b!926143 (= res!624004 (= (apply!670 lt!417013 k!1099) v!791))))

(declare-fun b!926144 () Bool)

(declare-fun res!624007 () Bool)

(assert (=> b!926144 (=> (not res!624007) (not e!519847))))

(assert (=> b!926144 (= res!624007 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27144 _keys!1487))))))

(declare-fun b!926145 () Bool)

(declare-fun e!519844 () Bool)

(assert (=> b!926145 (= e!519847 e!519844)))

(declare-fun res!624006 () Bool)

(assert (=> b!926145 (=> (not res!624006) (not e!519844))))

(assert (=> b!926145 (= res!624006 (contains!4899 lt!417016 k!1099))))

(assert (=> b!926145 (= lt!417016 (getCurrentListMap!3090 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!926146 () Bool)

(declare-fun e!519849 () Bool)

(assert (=> b!926146 (= e!519849 tp_is_empty!19757)))

(declare-fun mapNonEmpty!31392 () Bool)

(declare-fun mapRes!31392 () Bool)

(declare-fun tp!60187 () Bool)

(assert (=> mapNonEmpty!31392 (= mapRes!31392 (and tp!60187 e!519849))))

(declare-fun mapValue!31392 () ValueCell!9397)

(declare-fun mapKey!31392 () (_ BitVec 32))

(declare-fun mapRest!31392 () (Array (_ BitVec 32) ValueCell!9397))

(assert (=> mapNonEmpty!31392 (= (arr!26686 _values!1231) (store mapRest!31392 mapKey!31392 mapValue!31392))))

(declare-fun b!926147 () Bool)

(declare-fun e!519840 () Bool)

(assert (=> b!926147 (= e!519840 e!519850)))

(declare-fun res!623997 () Bool)

(assert (=> b!926147 (=> (not res!623997) (not e!519850))))

(assert (=> b!926147 (= res!623997 (contains!4899 lt!417013 k!1099))))

(assert (=> b!926147 (= lt!417013 (getCurrentListMap!3090 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926148 () Bool)

(declare-fun arrayContainsKey!0 (array!55480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926148 (= e!519846 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!926149 () Bool)

(declare-fun e!519848 () Bool)

(assert (=> b!926149 (= e!519848 e!519840)))

(declare-fun res!623998 () Bool)

(assert (=> b!926149 (=> (not res!623998) (not e!519840))))

(assert (=> b!926149 (= res!623998 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27144 _keys!1487)))))

(declare-fun lt!417011 () Unit!31306)

(assert (=> b!926149 (= lt!417011 e!519838)))

(declare-fun c!96680 () Bool)

(assert (=> b!926149 (= c!96680 (validKeyInArray!0 k!1099))))

(declare-fun b!926150 () Bool)

(assert (=> b!926150 (= e!519839 (and e!519842 mapRes!31392))))

(declare-fun condMapEmpty!31392 () Bool)

(declare-fun mapDefault!31392 () ValueCell!9397)

