; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79644 () Bool)

(assert start!79644)

(declare-fun b_free!17693 () Bool)

(declare-fun b_next!17693 () Bool)

(assert (=> start!79644 (= b_free!17693 (not b_next!17693))))

(declare-fun tp!61534 () Bool)

(declare-fun b_and!28977 () Bool)

(assert (=> start!79644 (= tp!61534 b_and!28977)))

(declare-fun mapIsEmpty!32073 () Bool)

(declare-fun mapRes!32073 () Bool)

(assert (=> mapIsEmpty!32073 mapRes!32073))

(declare-fun b!936289 () Bool)

(declare-fun res!630467 () Bool)

(declare-fun e!525725 () Bool)

(assert (=> b!936289 (=> (not res!630467) (not e!525725))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936289 (= res!630467 (validKeyInArray!0 k!1099))))

(declare-fun b!936290 () Bool)

(declare-fun res!630472 () Bool)

(declare-fun e!525721 () Bool)

(assert (=> b!936290 (=> (not res!630472) (not e!525721))))

(declare-datatypes ((array!56344 0))(
  ( (array!56345 (arr!27112 (Array (_ BitVec 32) (_ BitVec 64))) (size!27571 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56344)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31899 0))(
  ( (V!31900 (val!10151 Int)) )
))
(declare-datatypes ((ValueCell!9619 0))(
  ( (ValueCellFull!9619 (v!12676 V!31899)) (EmptyCell!9619) )
))
(declare-datatypes ((array!56346 0))(
  ( (array!56347 (arr!27113 (Array (_ BitVec 32) ValueCell!9619)) (size!27572 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56346)

(assert (=> b!936290 (= res!630472 (and (= (size!27572 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27571 _keys!1487) (size!27572 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936291 () Bool)

(declare-fun res!630471 () Bool)

(assert (=> b!936291 (=> (not res!630471) (not e!525725))))

(declare-fun v!791 () V!31899)

(declare-datatypes ((tuple2!13330 0))(
  ( (tuple2!13331 (_1!6676 (_ BitVec 64)) (_2!6676 V!31899)) )
))
(declare-datatypes ((List!19110 0))(
  ( (Nil!19107) (Cons!19106 (h!20252 tuple2!13330) (t!27347 List!19110)) )
))
(declare-datatypes ((ListLongMap!12027 0))(
  ( (ListLongMap!12028 (toList!6029 List!19110)) )
))
(declare-fun lt!422114 () ListLongMap!12027)

(declare-fun apply!831 (ListLongMap!12027 (_ BitVec 64)) V!31899)

(assert (=> b!936291 (= res!630471 (= (apply!831 lt!422114 k!1099) v!791))))

(declare-fun b!936292 () Bool)

(declare-fun e!525722 () Bool)

(assert (=> b!936292 (= e!525725 e!525722)))

(declare-fun res!630470 () Bool)

(assert (=> b!936292 (=> (not res!630470) (not e!525722))))

(declare-fun lt!422109 () (_ BitVec 64))

(assert (=> b!936292 (= res!630470 (validKeyInArray!0 lt!422109))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!936292 (= lt!422109 (select (arr!27112 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!936293 () Bool)

(assert (=> b!936293 (= e!525721 e!525725)))

(declare-fun res!630468 () Bool)

(assert (=> b!936293 (=> (not res!630468) (not e!525725))))

(declare-fun contains!5089 (ListLongMap!12027 (_ BitVec 64)) Bool)

(assert (=> b!936293 (= res!630468 (contains!5089 lt!422114 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31899)

(declare-fun minValue!1173 () V!31899)

(declare-fun getCurrentListMap!3265 (array!56344 array!56346 (_ BitVec 32) (_ BitVec 32) V!31899 V!31899 (_ BitVec 32) Int) ListLongMap!12027)

(assert (=> b!936293 (= lt!422114 (getCurrentListMap!3265 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936294 () Bool)

(declare-fun res!630475 () Bool)

(assert (=> b!936294 (=> (not res!630475) (not e!525721))))

(assert (=> b!936294 (= res!630475 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27571 _keys!1487))))))

(declare-fun b!936295 () Bool)

(assert (=> b!936295 (= e!525722 (not (not (= k!1099 lt!422109))))))

(assert (=> b!936295 (not (= lt!422109 k!1099))))

(declare-datatypes ((Unit!31579 0))(
  ( (Unit!31580) )
))
(declare-fun lt!422117 () Unit!31579)

(declare-datatypes ((List!19111 0))(
  ( (Nil!19108) (Cons!19107 (h!20253 (_ BitVec 64)) (t!27348 List!19111)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56344 (_ BitVec 64) (_ BitVec 32) List!19111) Unit!31579)

(assert (=> b!936295 (= lt!422117 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19108))))

(declare-fun e!525724 () Bool)

(assert (=> b!936295 e!525724))

(declare-fun c!97371 () Bool)

(assert (=> b!936295 (= c!97371 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422115 () Unit!31579)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!294 (array!56344 array!56346 (_ BitVec 32) (_ BitVec 32) V!31899 V!31899 (_ BitVec 64) (_ BitVec 32) Int) Unit!31579)

(assert (=> b!936295 (= lt!422115 (lemmaListMapContainsThenArrayContainsFrom!294 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56344 (_ BitVec 32) List!19111) Bool)

(assert (=> b!936295 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19108)))

(declare-fun lt!422113 () Unit!31579)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56344 (_ BitVec 32) (_ BitVec 32)) Unit!31579)

(assert (=> b!936295 (= lt!422113 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!422110 () tuple2!13330)

(declare-fun +!2822 (ListLongMap!12027 tuple2!13330) ListLongMap!12027)

(assert (=> b!936295 (contains!5089 (+!2822 lt!422114 lt!422110) k!1099)))

(declare-fun lt!422111 () V!31899)

(declare-fun lt!422112 () Unit!31579)

(declare-fun addStillContains!541 (ListLongMap!12027 (_ BitVec 64) V!31899 (_ BitVec 64)) Unit!31579)

(assert (=> b!936295 (= lt!422112 (addStillContains!541 lt!422114 lt!422109 lt!422111 k!1099))))

(assert (=> b!936295 (= (getCurrentListMap!3265 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2822 (getCurrentListMap!3265 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422110))))

(assert (=> b!936295 (= lt!422110 (tuple2!13331 lt!422109 lt!422111))))

(declare-fun get!14290 (ValueCell!9619 V!31899) V!31899)

(declare-fun dynLambda!1611 (Int (_ BitVec 64)) V!31899)

(assert (=> b!936295 (= lt!422111 (get!14290 (select (arr!27113 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1611 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422116 () Unit!31579)

(declare-fun lemmaListMapRecursiveValidKeyArray!212 (array!56344 array!56346 (_ BitVec 32) (_ BitVec 32) V!31899 V!31899 (_ BitVec 32) Int) Unit!31579)

(assert (=> b!936295 (= lt!422116 (lemmaListMapRecursiveValidKeyArray!212 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!936296 () Bool)

(declare-fun e!525719 () Bool)

(declare-fun tp_is_empty!20201 () Bool)

(assert (=> b!936296 (= e!525719 tp_is_empty!20201)))

(declare-fun b!936297 () Bool)

(declare-fun e!525726 () Bool)

(assert (=> b!936297 (= e!525726 (and e!525719 mapRes!32073))))

(declare-fun condMapEmpty!32073 () Bool)

(declare-fun mapDefault!32073 () ValueCell!9619)

