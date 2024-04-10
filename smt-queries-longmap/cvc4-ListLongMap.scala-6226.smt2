; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79632 () Bool)

(assert start!79632)

(declare-fun b_free!17681 () Bool)

(declare-fun b_next!17681 () Bool)

(assert (=> start!79632 (= b_free!17681 (not b_next!17681))))

(declare-fun tp!61499 () Bool)

(declare-fun b_and!28953 () Bool)

(assert (=> start!79632 (= tp!61499 b_and!28953)))

(declare-fun b!936007 () Bool)

(declare-fun res!630288 () Bool)

(declare-fun e!525577 () Bool)

(assert (=> b!936007 (=> (not res!630288) (not e!525577))))

(declare-datatypes ((array!56320 0))(
  ( (array!56321 (arr!27100 (Array (_ BitVec 32) (_ BitVec 64))) (size!27559 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56320)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56320 (_ BitVec 32)) Bool)

(assert (=> b!936007 (= res!630288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936008 () Bool)

(declare-fun e!525581 () Bool)

(declare-fun tp_is_empty!20189 () Bool)

(assert (=> b!936008 (= e!525581 tp_is_empty!20189)))

(declare-fun b!936009 () Bool)

(declare-fun e!525579 () Bool)

(assert (=> b!936009 (= e!525577 e!525579)))

(declare-fun res!630286 () Bool)

(assert (=> b!936009 (=> (not res!630286) (not e!525579))))

(declare-datatypes ((V!31883 0))(
  ( (V!31884 (val!10145 Int)) )
))
(declare-datatypes ((tuple2!13318 0))(
  ( (tuple2!13319 (_1!6670 (_ BitVec 64)) (_2!6670 V!31883)) )
))
(declare-datatypes ((List!19099 0))(
  ( (Nil!19096) (Cons!19095 (h!20241 tuple2!13318) (t!27324 List!19099)) )
))
(declare-datatypes ((ListLongMap!12015 0))(
  ( (ListLongMap!12016 (toList!6023 List!19099)) )
))
(declare-fun lt!421951 () ListLongMap!12015)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5084 (ListLongMap!12015 (_ BitVec 64)) Bool)

(assert (=> b!936009 (= res!630286 (contains!5084 lt!421951 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9613 0))(
  ( (ValueCellFull!9613 (v!12670 V!31883)) (EmptyCell!9613) )
))
(declare-datatypes ((array!56322 0))(
  ( (array!56323 (arr!27101 (Array (_ BitVec 32) ValueCell!9613)) (size!27560 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56322)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31883)

(declare-fun minValue!1173 () V!31883)

(declare-fun getCurrentListMap!3260 (array!56320 array!56322 (_ BitVec 32) (_ BitVec 32) V!31883 V!31883 (_ BitVec 32) Int) ListLongMap!12015)

(assert (=> b!936009 (= lt!421951 (getCurrentListMap!3260 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936010 () Bool)

(declare-fun e!525575 () Bool)

(assert (=> b!936010 (= e!525575 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27559 _keys!1487))))))

(declare-fun lt!421955 () (_ BitVec 64))

(assert (=> b!936010 (not (= lt!421955 k!1099))))

(declare-datatypes ((Unit!31569 0))(
  ( (Unit!31570) )
))
(declare-fun lt!421950 () Unit!31569)

(declare-datatypes ((List!19100 0))(
  ( (Nil!19097) (Cons!19096 (h!20242 (_ BitVec 64)) (t!27325 List!19100)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56320 (_ BitVec 64) (_ BitVec 32) List!19100) Unit!31569)

(assert (=> b!936010 (= lt!421950 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19097))))

(declare-fun e!525578 () Bool)

(assert (=> b!936010 e!525578))

(declare-fun c!97353 () Bool)

(assert (=> b!936010 (= c!97353 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421952 () Unit!31569)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!289 (array!56320 array!56322 (_ BitVec 32) (_ BitVec 32) V!31883 V!31883 (_ BitVec 64) (_ BitVec 32) Int) Unit!31569)

(assert (=> b!936010 (= lt!421952 (lemmaListMapContainsThenArrayContainsFrom!289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56320 (_ BitVec 32) List!19100) Bool)

(assert (=> b!936010 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19097)))

(declare-fun lt!421948 () Unit!31569)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56320 (_ BitVec 32) (_ BitVec 32)) Unit!31569)

(assert (=> b!936010 (= lt!421948 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421953 () tuple2!13318)

(declare-fun +!2817 (ListLongMap!12015 tuple2!13318) ListLongMap!12015)

(assert (=> b!936010 (contains!5084 (+!2817 lt!421951 lt!421953) k!1099)))

(declare-fun lt!421949 () V!31883)

(declare-fun lt!421947 () Unit!31569)

(declare-fun addStillContains!536 (ListLongMap!12015 (_ BitVec 64) V!31883 (_ BitVec 64)) Unit!31569)

(assert (=> b!936010 (= lt!421947 (addStillContains!536 lt!421951 lt!421955 lt!421949 k!1099))))

(assert (=> b!936010 (= (getCurrentListMap!3260 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2817 (getCurrentListMap!3260 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421953))))

(assert (=> b!936010 (= lt!421953 (tuple2!13319 lt!421955 lt!421949))))

(declare-fun get!14281 (ValueCell!9613 V!31883) V!31883)

(declare-fun dynLambda!1606 (Int (_ BitVec 64)) V!31883)

(assert (=> b!936010 (= lt!421949 (get!14281 (select (arr!27101 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1606 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421954 () Unit!31569)

(declare-fun lemmaListMapRecursiveValidKeyArray!207 (array!56320 array!56322 (_ BitVec 32) (_ BitVec 32) V!31883 V!31883 (_ BitVec 32) Int) Unit!31569)

(assert (=> b!936010 (= lt!421954 (lemmaListMapRecursiveValidKeyArray!207 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!936011 () Bool)

(assert (=> b!936011 (= e!525578 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936012 () Bool)

(declare-fun res!630287 () Bool)

(assert (=> b!936012 (=> (not res!630287) (not e!525577))))

(assert (=> b!936012 (= res!630287 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27559 _keys!1487))))))

(declare-fun mapNonEmpty!32055 () Bool)

(declare-fun mapRes!32055 () Bool)

(declare-fun tp!61498 () Bool)

(declare-fun e!525580 () Bool)

(assert (=> mapNonEmpty!32055 (= mapRes!32055 (and tp!61498 e!525580))))

(declare-fun mapRest!32055 () (Array (_ BitVec 32) ValueCell!9613))

(declare-fun mapValue!32055 () ValueCell!9613)

(declare-fun mapKey!32055 () (_ BitVec 32))

(assert (=> mapNonEmpty!32055 (= (arr!27101 _values!1231) (store mapRest!32055 mapKey!32055 mapValue!32055))))

(declare-fun b!936013 () Bool)

(declare-fun res!630293 () Bool)

(assert (=> b!936013 (=> (not res!630293) (not e!525577))))

(assert (=> b!936013 (= res!630293 (and (= (size!27560 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27559 _keys!1487) (size!27560 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936014 () Bool)

(declare-fun res!630292 () Bool)

(assert (=> b!936014 (=> (not res!630292) (not e!525579))))

(declare-fun v!791 () V!31883)

(declare-fun apply!825 (ListLongMap!12015 (_ BitVec 64)) V!31883)

(assert (=> b!936014 (= res!630292 (= (apply!825 lt!421951 k!1099) v!791))))

(declare-fun b!936015 () Bool)

(declare-fun res!630291 () Bool)

(assert (=> b!936015 (=> (not res!630291) (not e!525577))))

(assert (=> b!936015 (= res!630291 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19097))))

(declare-fun b!936016 () Bool)

(declare-fun arrayContainsKey!0 (array!56320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936016 (= e!525578 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!936017 () Bool)

(declare-fun e!525582 () Bool)

(assert (=> b!936017 (= e!525582 (and e!525581 mapRes!32055))))

(declare-fun condMapEmpty!32055 () Bool)

(declare-fun mapDefault!32055 () ValueCell!9613)

