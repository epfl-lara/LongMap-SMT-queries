; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78946 () Bool)

(assert start!78946)

(declare-fun b_free!17159 () Bool)

(declare-fun b_next!17159 () Bool)

(assert (=> start!78946 (= b_free!17159 (not b_next!17159))))

(declare-fun tp!59918 () Bool)

(declare-fun b_and!28055 () Bool)

(assert (=> start!78946 (= tp!59918 b_and!28055)))

(declare-fun b!923509 () Bool)

(declare-fun e!518175 () Bool)

(declare-fun e!518167 () Bool)

(assert (=> b!923509 (= e!518175 e!518167)))

(declare-fun res!622684 () Bool)

(assert (=> b!923509 (=> (not res!622684) (not e!518167))))

(declare-datatypes ((V!31187 0))(
  ( (V!31188 (val!9884 Int)) )
))
(declare-datatypes ((tuple2!12868 0))(
  ( (tuple2!12869 (_1!6445 (_ BitVec 64)) (_2!6445 V!31187)) )
))
(declare-datatypes ((List!18672 0))(
  ( (Nil!18669) (Cons!18668 (h!19814 tuple2!12868) (t!26561 List!18672)) )
))
(declare-datatypes ((ListLongMap!11565 0))(
  ( (ListLongMap!11566 (toList!5798 List!18672)) )
))
(declare-fun lt!414923 () ListLongMap!11565)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4860 (ListLongMap!11565 (_ BitVec 64)) Bool)

(assert (=> b!923509 (= res!622684 (contains!4860 lt!414923 k!1099))))

(declare-datatypes ((array!55308 0))(
  ( (array!55309 (arr!26599 (Array (_ BitVec 32) (_ BitVec 64))) (size!27058 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55308)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9352 0))(
  ( (ValueCellFull!9352 (v!12402 V!31187)) (EmptyCell!9352) )
))
(declare-datatypes ((array!55310 0))(
  ( (array!55311 (arr!26600 (Array (_ BitVec 32) ValueCell!9352)) (size!27059 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55310)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31187)

(declare-fun minValue!1173 () V!31187)

(declare-fun getCurrentListMap!3051 (array!55308 array!55310 (_ BitVec 32) (_ BitVec 32) V!31187 V!31187 (_ BitVec 32) Int) ListLongMap!11565)

(assert (=> b!923509 (= lt!414923 (getCurrentListMap!3051 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923510 () Bool)

(declare-fun e!518171 () Bool)

(declare-fun e!518172 () Bool)

(assert (=> b!923510 (= e!518171 e!518172)))

(declare-fun res!622678 () Bool)

(assert (=> b!923510 (=> (not res!622678) (not e!518172))))

(declare-fun lt!414931 () ListLongMap!11565)

(assert (=> b!923510 (= res!622678 (contains!4860 lt!414931 k!1099))))

(assert (=> b!923510 (= lt!414931 (getCurrentListMap!3051 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!622683 () Bool)

(assert (=> start!78946 (=> (not res!622683) (not e!518175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78946 (= res!622683 (validMask!0 mask!1881))))

(assert (=> start!78946 e!518175))

(assert (=> start!78946 true))

(declare-fun tp_is_empty!19667 () Bool)

(assert (=> start!78946 tp_is_empty!19667))

(declare-fun e!518168 () Bool)

(declare-fun array_inv!20716 (array!55310) Bool)

(assert (=> start!78946 (and (array_inv!20716 _values!1231) e!518168)))

(assert (=> start!78946 tp!59918))

(declare-fun array_inv!20717 (array!55308) Bool)

(assert (=> start!78946 (array_inv!20717 _keys!1487)))

(declare-fun b!923511 () Bool)

(declare-fun res!622680 () Bool)

(assert (=> b!923511 (=> (not res!622680) (not e!518175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55308 (_ BitVec 32)) Bool)

(assert (=> b!923511 (= res!622680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923512 () Bool)

(declare-fun e!518166 () Bool)

(assert (=> b!923512 (= e!518167 e!518166)))

(declare-fun res!622677 () Bool)

(assert (=> b!923512 (=> (not res!622677) (not e!518166))))

(declare-fun v!791 () V!31187)

(declare-fun lt!414934 () V!31187)

(assert (=> b!923512 (= res!622677 (and (= lt!414934 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!628 (ListLongMap!11565 (_ BitVec 64)) V!31187)

(assert (=> b!923512 (= lt!414934 (apply!628 lt!414923 k!1099))))

(declare-fun b!923513 () Bool)

(declare-fun e!518170 () Bool)

(assert (=> b!923513 (= e!518170 tp_is_empty!19667)))

(declare-fun b!923514 () Bool)

(declare-fun res!622676 () Bool)

(assert (=> b!923514 (=> (not res!622676) (not e!518175))))

(assert (=> b!923514 (= res!622676 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27058 _keys!1487))))))

(declare-fun b!923515 () Bool)

(declare-fun e!518173 () Bool)

(assert (=> b!923515 (= e!518173 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923516 () Bool)

(assert (=> b!923516 (= e!518172 false)))

(declare-fun lt!414927 () V!31187)

(assert (=> b!923516 (= lt!414927 (apply!628 lt!414931 k!1099))))

(declare-fun b!923517 () Bool)

(declare-datatypes ((Unit!31160 0))(
  ( (Unit!31161) )
))
(declare-fun e!518174 () Unit!31160)

(declare-fun Unit!31162 () Unit!31160)

(assert (=> b!923517 (= e!518174 Unit!31162)))

(declare-fun b!923518 () Bool)

(declare-fun lt!414925 () ListLongMap!11565)

(assert (=> b!923518 (= (apply!628 lt!414925 k!1099) lt!414934)))

(declare-fun lt!414936 () (_ BitVec 64))

(declare-fun lt!414933 () V!31187)

(declare-fun lt!414935 () Unit!31160)

(declare-fun addApplyDifferent!356 (ListLongMap!11565 (_ BitVec 64) V!31187 (_ BitVec 64)) Unit!31160)

(assert (=> b!923518 (= lt!414935 (addApplyDifferent!356 lt!414923 lt!414936 lt!414933 k!1099))))

(assert (=> b!923518 (not (= lt!414936 k!1099))))

(declare-fun lt!414932 () Unit!31160)

(declare-datatypes ((List!18673 0))(
  ( (Nil!18670) (Cons!18669 (h!19815 (_ BitVec 64)) (t!26562 List!18673)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55308 (_ BitVec 64) (_ BitVec 32) List!18673) Unit!31160)

(assert (=> b!923518 (= lt!414932 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18670))))

(assert (=> b!923518 e!518173))

(declare-fun c!96276 () Bool)

(assert (=> b!923518 (= c!96276 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414928 () Unit!31160)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!207 (array!55308 array!55310 (_ BitVec 32) (_ BitVec 32) V!31187 V!31187 (_ BitVec 64) (_ BitVec 32) Int) Unit!31160)

(assert (=> b!923518 (= lt!414928 (lemmaListMapContainsThenArrayContainsFrom!207 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55308 (_ BitVec 32) List!18673) Bool)

(assert (=> b!923518 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18670)))

(declare-fun lt!414924 () Unit!31160)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55308 (_ BitVec 32) (_ BitVec 32)) Unit!31160)

(assert (=> b!923518 (= lt!414924 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!923518 (contains!4860 lt!414925 k!1099)))

(declare-fun lt!414926 () tuple2!12868)

(declare-fun +!2700 (ListLongMap!11565 tuple2!12868) ListLongMap!11565)

(assert (=> b!923518 (= lt!414925 (+!2700 lt!414923 lt!414926))))

(declare-fun lt!414930 () Unit!31160)

(declare-fun addStillContains!424 (ListLongMap!11565 (_ BitVec 64) V!31187 (_ BitVec 64)) Unit!31160)

(assert (=> b!923518 (= lt!414930 (addStillContains!424 lt!414923 lt!414936 lt!414933 k!1099))))

(assert (=> b!923518 (= (getCurrentListMap!3051 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2700 (getCurrentListMap!3051 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414926))))

(assert (=> b!923518 (= lt!414926 (tuple2!12869 lt!414936 lt!414933))))

(declare-fun get!13975 (ValueCell!9352 V!31187) V!31187)

(declare-fun dynLambda!1489 (Int (_ BitVec 64)) V!31187)

(assert (=> b!923518 (= lt!414933 (get!13975 (select (arr!26600 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1489 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414937 () Unit!31160)

(declare-fun lemmaListMapRecursiveValidKeyArray!90 (array!55308 array!55310 (_ BitVec 32) (_ BitVec 32) V!31187 V!31187 (_ BitVec 32) Int) Unit!31160)

(assert (=> b!923518 (= lt!414937 (lemmaListMapRecursiveValidKeyArray!90 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!923518 (= e!518174 lt!414935)))

(declare-fun b!923519 () Bool)

(declare-fun res!622682 () Bool)

(assert (=> b!923519 (=> (not res!622682) (not e!518175))))

(assert (=> b!923519 (= res!622682 (and (= (size!27059 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27058 _keys!1487) (size!27059 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923520 () Bool)

(declare-fun e!518165 () Unit!31160)

(assert (=> b!923520 (= e!518165 e!518174)))

(assert (=> b!923520 (= lt!414936 (select (arr!26599 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96275 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923520 (= c!96275 (validKeyInArray!0 lt!414936))))

(declare-fun b!923521 () Bool)

(declare-fun arrayContainsKey!0 (array!55308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923521 (= e!518173 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!923522 () Bool)

(declare-fun e!518169 () Bool)

(declare-fun mapRes!31257 () Bool)

(assert (=> b!923522 (= e!518168 (and e!518169 mapRes!31257))))

(declare-fun condMapEmpty!31257 () Bool)

(declare-fun mapDefault!31257 () ValueCell!9352)

