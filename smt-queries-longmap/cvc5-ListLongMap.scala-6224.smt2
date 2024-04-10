; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79580 () Bool)

(assert start!79580)

(declare-fun b_free!17665 () Bool)

(declare-fun b_next!17665 () Bool)

(assert (=> start!79580 (= b_free!17665 (not b_next!17665))))

(declare-fun tp!61448 () Bool)

(declare-fun b_and!28913 () Bool)

(assert (=> start!79580 (= tp!61448 b_and!28913)))

(declare-fun b!935373 () Bool)

(declare-fun e!525236 () Bool)

(declare-fun e!525234 () Bool)

(assert (=> b!935373 (= e!525236 e!525234)))

(declare-fun res!629900 () Bool)

(assert (=> b!935373 (=> (not res!629900) (not e!525234))))

(declare-datatypes ((V!31863 0))(
  ( (V!31864 (val!10137 Int)) )
))
(declare-datatypes ((tuple2!13304 0))(
  ( (tuple2!13305 (_1!6663 (_ BitVec 64)) (_2!6663 V!31863)) )
))
(declare-datatypes ((List!19084 0))(
  ( (Nil!19081) (Cons!19080 (h!20226 tuple2!13304) (t!27293 List!19084)) )
))
(declare-datatypes ((ListLongMap!12001 0))(
  ( (ListLongMap!12002 (toList!6016 List!19084)) )
))
(declare-fun lt!421566 () ListLongMap!12001)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5072 (ListLongMap!12001 (_ BitVec 64)) Bool)

(assert (=> b!935373 (= res!629900 (contains!5072 lt!421566 k!1099))))

(declare-datatypes ((array!56288 0))(
  ( (array!56289 (arr!27085 (Array (_ BitVec 32) (_ BitVec 64))) (size!27544 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56288)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((ValueCell!9605 0))(
  ( (ValueCellFull!9605 (v!12660 V!31863)) (EmptyCell!9605) )
))
(declare-datatypes ((array!56290 0))(
  ( (array!56291 (arr!27086 (Array (_ BitVec 32) ValueCell!9605)) (size!27545 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56290)

(declare-fun zeroValue!1173 () V!31863)

(declare-fun minValue!1173 () V!31863)

(declare-fun getCurrentListMap!3253 (array!56288 array!56290 (_ BitVec 32) (_ BitVec 32) V!31863 V!31863 (_ BitVec 32) Int) ListLongMap!12001)

(assert (=> b!935373 (= lt!421566 (getCurrentListMap!3253 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935375 () Bool)

(declare-fun res!629893 () Bool)

(assert (=> b!935375 (=> (not res!629893) (not e!525236))))

(assert (=> b!935375 (= res!629893 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27544 _keys!1487))))))

(declare-fun b!935376 () Bool)

(declare-fun e!525235 () Bool)

(declare-fun e!525233 () Bool)

(assert (=> b!935376 (= e!525235 (not e!525233))))

(declare-fun res!629901 () Bool)

(assert (=> b!935376 (=> res!629901 e!525233)))

(assert (=> b!935376 (= res!629901 (or (bvsge (size!27544 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27544 _keys!1487))))))

(declare-fun e!525231 () Bool)

(assert (=> b!935376 e!525231))

(declare-fun c!97282 () Bool)

(assert (=> b!935376 (= c!97282 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31552 0))(
  ( (Unit!31553) )
))
(declare-fun lt!421565 () Unit!31552)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!283 (array!56288 array!56290 (_ BitVec 32) (_ BitVec 32) V!31863 V!31863 (_ BitVec 64) (_ BitVec 32) Int) Unit!31552)

(assert (=> b!935376 (= lt!421565 (lemmaListMapContainsThenArrayContainsFrom!283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19085 0))(
  ( (Nil!19082) (Cons!19081 (h!20227 (_ BitVec 64)) (t!27294 List!19085)) )
))
(declare-fun arrayNoDuplicates!0 (array!56288 (_ BitVec 32) List!19085) Bool)

(assert (=> b!935376 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19082)))

(declare-fun lt!421567 () Unit!31552)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56288 (_ BitVec 32) (_ BitVec 32)) Unit!31552)

(assert (=> b!935376 (= lt!421567 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421569 () tuple2!13304)

(declare-fun +!2811 (ListLongMap!12001 tuple2!13304) ListLongMap!12001)

(assert (=> b!935376 (contains!5072 (+!2811 lt!421566 lt!421569) k!1099)))

(declare-fun lt!421572 () (_ BitVec 64))

(declare-fun lt!421564 () V!31863)

(declare-fun lt!421571 () Unit!31552)

(declare-fun addStillContains!530 (ListLongMap!12001 (_ BitVec 64) V!31863 (_ BitVec 64)) Unit!31552)

(assert (=> b!935376 (= lt!421571 (addStillContains!530 lt!421566 lt!421572 lt!421564 k!1099))))

(declare-fun lt!421570 () (_ BitVec 32))

(assert (=> b!935376 (= (getCurrentListMap!3253 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2811 (getCurrentListMap!3253 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 lt!421570 defaultEntry!1235) lt!421569))))

(assert (=> b!935376 (= lt!421569 (tuple2!13305 lt!421572 lt!421564))))

(declare-fun get!14268 (ValueCell!9605 V!31863) V!31863)

(declare-fun dynLambda!1600 (Int (_ BitVec 64)) V!31863)

(assert (=> b!935376 (= lt!421564 (get!14268 (select (arr!27086 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1600 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!935376 (= lt!421570 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421568 () Unit!31552)

(declare-fun lemmaListMapRecursiveValidKeyArray!201 (array!56288 array!56290 (_ BitVec 32) (_ BitVec 32) V!31863 V!31863 (_ BitVec 32) Int) Unit!31552)

(assert (=> b!935376 (= lt!421568 (lemmaListMapRecursiveValidKeyArray!201 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935377 () Bool)

(declare-fun res!629895 () Bool)

(assert (=> b!935377 (=> (not res!629895) (not e!525234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935377 (= res!629895 (validKeyInArray!0 k!1099))))

(declare-fun b!935378 () Bool)

(declare-fun res!629902 () Bool)

(assert (=> b!935378 (=> res!629902 e!525233)))

(declare-fun noDuplicate!1353 (List!19085) Bool)

(assert (=> b!935378 (= res!629902 (not (noDuplicate!1353 Nil!19082)))))

(declare-fun mapNonEmpty!32028 () Bool)

(declare-fun mapRes!32028 () Bool)

(declare-fun tp!61447 () Bool)

(declare-fun e!525232 () Bool)

(assert (=> mapNonEmpty!32028 (= mapRes!32028 (and tp!61447 e!525232))))

(declare-fun mapKey!32028 () (_ BitVec 32))

(declare-fun mapValue!32028 () ValueCell!9605)

(declare-fun mapRest!32028 () (Array (_ BitVec 32) ValueCell!9605))

(assert (=> mapNonEmpty!32028 (= (arr!27086 _values!1231) (store mapRest!32028 mapKey!32028 mapValue!32028))))

(declare-fun b!935379 () Bool)

(declare-fun res!629896 () Bool)

(assert (=> b!935379 (=> (not res!629896) (not e!525234))))

(assert (=> b!935379 (= res!629896 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935380 () Bool)

(assert (=> b!935380 (= e!525234 e!525235)))

(declare-fun res!629904 () Bool)

(assert (=> b!935380 (=> (not res!629904) (not e!525235))))

(assert (=> b!935380 (= res!629904 (validKeyInArray!0 lt!421572))))

(assert (=> b!935380 (= lt!421572 (select (arr!27085 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!935381 () Bool)

(declare-fun res!629903 () Bool)

(assert (=> b!935381 (=> (not res!629903) (not e!525236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56288 (_ BitVec 32)) Bool)

(assert (=> b!935381 (= res!629903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935382 () Bool)

(declare-fun res!629899 () Bool)

(assert (=> b!935382 (=> (not res!629899) (not e!525236))))

(assert (=> b!935382 (= res!629899 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19082))))

(declare-fun mapIsEmpty!32028 () Bool)

(assert (=> mapIsEmpty!32028 mapRes!32028))

(declare-fun b!935383 () Bool)

(declare-fun arrayContainsKey!0 (array!56288 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935383 (= e!525233 (arrayContainsKey!0 _keys!1487 k!1099 lt!421570))))

(declare-fun b!935384 () Bool)

(declare-fun e!525230 () Bool)

(declare-fun e!525229 () Bool)

(assert (=> b!935384 (= e!525230 (and e!525229 mapRes!32028))))

(declare-fun condMapEmpty!32028 () Bool)

(declare-fun mapDefault!32028 () ValueCell!9605)

