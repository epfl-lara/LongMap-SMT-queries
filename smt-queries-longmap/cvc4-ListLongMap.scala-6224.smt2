; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79584 () Bool)

(assert start!79584)

(declare-fun b_free!17669 () Bool)

(declare-fun b_next!17669 () Bool)

(assert (=> start!79584 (= b_free!17669 (not b_next!17669))))

(declare-fun tp!61460 () Bool)

(declare-fun b_and!28921 () Bool)

(assert (=> start!79584 (= tp!61460 b_and!28921)))

(declare-fun b!935491 () Bool)

(declare-fun e!525283 () Bool)

(declare-fun tp_is_empty!20177 () Bool)

(assert (=> b!935491 (= e!525283 tp_is_empty!20177)))

(declare-fun b!935492 () Bool)

(declare-fun e!525287 () Bool)

(assert (=> b!935492 (= e!525287 tp_is_empty!20177)))

(declare-fun b!935493 () Bool)

(declare-fun lt!421618 () (_ BitVec 32))

(declare-fun e!525285 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((array!56296 0))(
  ( (array!56297 (arr!27089 (Array (_ BitVec 32) (_ BitVec 64))) (size!27548 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56296)

(declare-fun arrayContainsKey!0 (array!56296 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935493 (= e!525285 (arrayContainsKey!0 _keys!1487 k!1099 lt!421618))))

(declare-fun b!935494 () Bool)

(declare-fun res!629988 () Bool)

(declare-fun e!525284 () Bool)

(assert (=> b!935494 (=> (not res!629988) (not e!525284))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!935494 (= res!629988 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun res!629979 () Bool)

(declare-fun e!525288 () Bool)

(assert (=> start!79584 (=> (not res!629979) (not e!525288))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79584 (= res!629979 (validMask!0 mask!1881))))

(assert (=> start!79584 e!525288))

(assert (=> start!79584 true))

(assert (=> start!79584 tp_is_empty!20177))

(declare-datatypes ((V!31867 0))(
  ( (V!31868 (val!10139 Int)) )
))
(declare-datatypes ((ValueCell!9607 0))(
  ( (ValueCellFull!9607 (v!12662 V!31867)) (EmptyCell!9607) )
))
(declare-datatypes ((array!56298 0))(
  ( (array!56299 (arr!27090 (Array (_ BitVec 32) ValueCell!9607)) (size!27549 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56298)

(declare-fun e!525289 () Bool)

(declare-fun array_inv!21082 (array!56298) Bool)

(assert (=> start!79584 (and (array_inv!21082 _values!1231) e!525289)))

(assert (=> start!79584 tp!61460))

(declare-fun array_inv!21083 (array!56296) Bool)

(assert (=> start!79584 (array_inv!21083 _keys!1487)))

(declare-fun b!935495 () Bool)

(declare-fun res!629981 () Bool)

(assert (=> b!935495 (=> (not res!629981) (not e!525288))))

(assert (=> b!935495 (= res!629981 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27548 _keys!1487))))))

(declare-fun b!935496 () Bool)

(declare-fun e!525290 () Bool)

(assert (=> b!935496 (= e!525290 (not e!525285))))

(declare-fun res!629975 () Bool)

(assert (=> b!935496 (=> res!629975 e!525285)))

(assert (=> b!935496 (= res!629975 (or (bvsge (size!27548 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27548 _keys!1487))))))

(declare-fun e!525286 () Bool)

(assert (=> b!935496 e!525286))

(declare-fun c!97288 () Bool)

(assert (=> b!935496 (= c!97288 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31556 0))(
  ( (Unit!31557) )
))
(declare-fun lt!421619 () Unit!31556)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31867)

(declare-fun minValue!1173 () V!31867)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!285 (array!56296 array!56298 (_ BitVec 32) (_ BitVec 32) V!31867 V!31867 (_ BitVec 64) (_ BitVec 32) Int) Unit!31556)

(assert (=> b!935496 (= lt!421619 (lemmaListMapContainsThenArrayContainsFrom!285 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19088 0))(
  ( (Nil!19085) (Cons!19084 (h!20230 (_ BitVec 64)) (t!27301 List!19088)) )
))
(declare-fun arrayNoDuplicates!0 (array!56296 (_ BitVec 32) List!19088) Bool)

(assert (=> b!935496 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19085)))

(declare-fun lt!421620 () Unit!31556)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56296 (_ BitVec 32) (_ BitVec 32)) Unit!31556)

(assert (=> b!935496 (= lt!421620 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13308 0))(
  ( (tuple2!13309 (_1!6665 (_ BitVec 64)) (_2!6665 V!31867)) )
))
(declare-datatypes ((List!19089 0))(
  ( (Nil!19086) (Cons!19085 (h!20231 tuple2!13308) (t!27302 List!19089)) )
))
(declare-datatypes ((ListLongMap!12005 0))(
  ( (ListLongMap!12006 (toList!6018 List!19089)) )
))
(declare-fun lt!421622 () ListLongMap!12005)

(declare-fun lt!421625 () tuple2!13308)

(declare-fun contains!5075 (ListLongMap!12005 (_ BitVec 64)) Bool)

(declare-fun +!2813 (ListLongMap!12005 tuple2!13308) ListLongMap!12005)

(assert (=> b!935496 (contains!5075 (+!2813 lt!421622 lt!421625) k!1099)))

(declare-fun lt!421621 () Unit!31556)

(declare-fun lt!421624 () (_ BitVec 64))

(declare-fun lt!421626 () V!31867)

(declare-fun addStillContains!532 (ListLongMap!12005 (_ BitVec 64) V!31867 (_ BitVec 64)) Unit!31556)

(assert (=> b!935496 (= lt!421621 (addStillContains!532 lt!421622 lt!421624 lt!421626 k!1099))))

(declare-fun getCurrentListMap!3255 (array!56296 array!56298 (_ BitVec 32) (_ BitVec 32) V!31867 V!31867 (_ BitVec 32) Int) ListLongMap!12005)

(assert (=> b!935496 (= (getCurrentListMap!3255 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2813 (getCurrentListMap!3255 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421618 defaultEntry!1235) lt!421625))))

(assert (=> b!935496 (= lt!421625 (tuple2!13309 lt!421624 lt!421626))))

(declare-fun get!14270 (ValueCell!9607 V!31867) V!31867)

(declare-fun dynLambda!1602 (Int (_ BitVec 64)) V!31867)

(assert (=> b!935496 (= lt!421626 (get!14270 (select (arr!27090 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1602 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!935496 (= lt!421618 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421623 () Unit!31556)

(declare-fun lemmaListMapRecursiveValidKeyArray!203 (array!56296 array!56298 (_ BitVec 32) (_ BitVec 32) V!31867 V!31867 (_ BitVec 32) Int) Unit!31556)

(assert (=> b!935496 (= lt!421623 (lemmaListMapRecursiveValidKeyArray!203 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!32034 () Bool)

(declare-fun mapRes!32034 () Bool)

(declare-fun tp!61459 () Bool)

(assert (=> mapNonEmpty!32034 (= mapRes!32034 (and tp!61459 e!525283))))

(declare-fun mapValue!32034 () ValueCell!9607)

(declare-fun mapRest!32034 () (Array (_ BitVec 32) ValueCell!9607))

(declare-fun mapKey!32034 () (_ BitVec 32))

(assert (=> mapNonEmpty!32034 (= (arr!27090 _values!1231) (store mapRest!32034 mapKey!32034 mapValue!32034))))

(declare-fun b!935497 () Bool)

(declare-fun res!629976 () Bool)

(assert (=> b!935497 (=> (not res!629976) (not e!525284))))

(declare-fun v!791 () V!31867)

(declare-fun apply!820 (ListLongMap!12005 (_ BitVec 64)) V!31867)

(assert (=> b!935497 (= res!629976 (= (apply!820 lt!421622 k!1099) v!791))))

(declare-fun b!935498 () Bool)

(declare-fun res!629987 () Bool)

(assert (=> b!935498 (=> (not res!629987) (not e!525288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56296 (_ BitVec 32)) Bool)

(assert (=> b!935498 (= res!629987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935499 () Bool)

(assert (=> b!935499 (= e!525288 e!525284)))

(declare-fun res!629980 () Bool)

(assert (=> b!935499 (=> (not res!629980) (not e!525284))))

(assert (=> b!935499 (= res!629980 (contains!5075 lt!421622 k!1099))))

(assert (=> b!935499 (= lt!421622 (getCurrentListMap!3255 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935500 () Bool)

(assert (=> b!935500 (= e!525286 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!935501 () Bool)

(assert (=> b!935501 (= e!525289 (and e!525287 mapRes!32034))))

(declare-fun condMapEmpty!32034 () Bool)

(declare-fun mapDefault!32034 () ValueCell!9607)

