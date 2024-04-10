; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79486 () Bool)

(assert start!79486)

(declare-fun b_free!17641 () Bool)

(declare-fun b_next!17641 () Bool)

(assert (=> start!79486 (= b_free!17641 (not b_next!17641))))

(declare-fun tp!61369 () Bool)

(declare-fun b_and!28849 () Bool)

(assert (=> start!79486 (= tp!61369 b_and!28849)))

(declare-fun b!934371 () Bool)

(declare-fun res!629304 () Bool)

(declare-fun e!524649 () Bool)

(assert (=> b!934371 (=> (not res!629304) (not e!524649))))

(declare-datatypes ((array!56236 0))(
  ( (array!56237 (arr!27061 (Array (_ BitVec 32) (_ BitVec 64))) (size!27520 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56236)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56236 (_ BitVec 32)) Bool)

(assert (=> b!934371 (= res!629304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!934372 () Bool)

(declare-fun res!629307 () Bool)

(declare-fun e!524650 () Bool)

(assert (=> b!934372 (=> (not res!629307) (not e!524650))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!934372 (= res!629307 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934373 () Bool)

(declare-fun res!629303 () Bool)

(assert (=> b!934373 (=> (not res!629303) (not e!524649))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31831 0))(
  ( (V!31832 (val!10125 Int)) )
))
(declare-datatypes ((ValueCell!9593 0))(
  ( (ValueCellFull!9593 (v!12645 V!31831)) (EmptyCell!9593) )
))
(declare-datatypes ((array!56238 0))(
  ( (array!56239 (arr!27062 (Array (_ BitVec 32) ValueCell!9593)) (size!27521 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56238)

(assert (=> b!934373 (= res!629303 (and (= (size!27521 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27520 _keys!1487) (size!27521 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!934374 () Bool)

(declare-fun e!524651 () Bool)

(declare-fun tp_is_empty!20149 () Bool)

(assert (=> b!934374 (= e!524651 tp_is_empty!20149)))

(declare-fun b!934375 () Bool)

(assert (=> b!934375 (= e!524649 e!524650)))

(declare-fun res!629302 () Bool)

(assert (=> b!934375 (=> (not res!629302) (not e!524650))))

(declare-datatypes ((tuple2!13280 0))(
  ( (tuple2!13281 (_1!6651 (_ BitVec 64)) (_2!6651 V!31831)) )
))
(declare-datatypes ((List!19060 0))(
  ( (Nil!19057) (Cons!19056 (h!20202 tuple2!13280) (t!27245 List!19060)) )
))
(declare-datatypes ((ListLongMap!11977 0))(
  ( (ListLongMap!11978 (toList!6004 List!19060)) )
))
(declare-fun lt!420949 () ListLongMap!11977)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5054 (ListLongMap!11977 (_ BitVec 64)) Bool)

(assert (=> b!934375 (= res!629302 (contains!5054 lt!420949 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31831)

(declare-fun minValue!1173 () V!31831)

(declare-fun getCurrentListMap!3241 (array!56236 array!56238 (_ BitVec 32) (_ BitVec 32) V!31831 V!31831 (_ BitVec 32) Int) ListLongMap!11977)

(assert (=> b!934375 (= lt!420949 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934376 () Bool)

(declare-fun e!524646 () Bool)

(assert (=> b!934376 (= e!524646 tp_is_empty!20149)))

(declare-fun mapNonEmpty!31986 () Bool)

(declare-fun mapRes!31986 () Bool)

(declare-fun tp!61370 () Bool)

(assert (=> mapNonEmpty!31986 (= mapRes!31986 (and tp!61370 e!524646))))

(declare-fun mapRest!31986 () (Array (_ BitVec 32) ValueCell!9593))

(declare-fun mapKey!31986 () (_ BitVec 32))

(declare-fun mapValue!31986 () ValueCell!9593)

(assert (=> mapNonEmpty!31986 (= (arr!27062 _values!1231) (store mapRest!31986 mapKey!31986 mapValue!31986))))

(declare-fun b!934377 () Bool)

(declare-fun res!629301 () Bool)

(assert (=> b!934377 (=> (not res!629301) (not e!524650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934377 (= res!629301 (validKeyInArray!0 k!1099))))

(declare-fun res!629306 () Bool)

(assert (=> start!79486 (=> (not res!629306) (not e!524649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79486 (= res!629306 (validMask!0 mask!1881))))

(assert (=> start!79486 e!524649))

(assert (=> start!79486 true))

(assert (=> start!79486 tp_is_empty!20149))

(declare-fun e!524647 () Bool)

(declare-fun array_inv!21060 (array!56238) Bool)

(assert (=> start!79486 (and (array_inv!21060 _values!1231) e!524647)))

(assert (=> start!79486 tp!61369))

(declare-fun array_inv!21061 (array!56236) Bool)

(assert (=> start!79486 (array_inv!21061 _keys!1487)))

(declare-fun b!934378 () Bool)

(declare-fun e!524648 () Bool)

(assert (=> b!934378 (= e!524648 (not true))))

(declare-fun e!524652 () Bool)

(assert (=> b!934378 e!524652))

(declare-fun c!97152 () Bool)

(assert (=> b!934378 (= c!97152 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31524 0))(
  ( (Unit!31525) )
))
(declare-fun lt!420947 () Unit!31524)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!274 (array!56236 array!56238 (_ BitVec 32) (_ BitVec 32) V!31831 V!31831 (_ BitVec 64) (_ BitVec 32) Int) Unit!31524)

(assert (=> b!934378 (= lt!420947 (lemmaListMapContainsThenArrayContainsFrom!274 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19061 0))(
  ( (Nil!19058) (Cons!19057 (h!20203 (_ BitVec 64)) (t!27246 List!19061)) )
))
(declare-fun arrayNoDuplicates!0 (array!56236 (_ BitVec 32) List!19061) Bool)

(assert (=> b!934378 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19058)))

(declare-fun lt!420946 () Unit!31524)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56236 (_ BitVec 32) (_ BitVec 32)) Unit!31524)

(assert (=> b!934378 (= lt!420946 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420948 () tuple2!13280)

(declare-fun +!2802 (ListLongMap!11977 tuple2!13280) ListLongMap!11977)

(assert (=> b!934378 (contains!5054 (+!2802 lt!420949 lt!420948) k!1099)))

(declare-fun lt!420945 () V!31831)

(declare-fun lt!420944 () Unit!31524)

(declare-fun lt!420950 () (_ BitVec 64))

(declare-fun addStillContains!521 (ListLongMap!11977 (_ BitVec 64) V!31831 (_ BitVec 64)) Unit!31524)

(assert (=> b!934378 (= lt!420944 (addStillContains!521 lt!420949 lt!420950 lt!420945 k!1099))))

(assert (=> b!934378 (= (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2802 (getCurrentListMap!3241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420948))))

(assert (=> b!934378 (= lt!420948 (tuple2!13281 lt!420950 lt!420945))))

(declare-fun get!14245 (ValueCell!9593 V!31831) V!31831)

(declare-fun dynLambda!1591 (Int (_ BitVec 64)) V!31831)

(assert (=> b!934378 (= lt!420945 (get!14245 (select (arr!27062 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1591 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420951 () Unit!31524)

(declare-fun lemmaListMapRecursiveValidKeyArray!192 (array!56236 array!56238 (_ BitVec 32) (_ BitVec 32) V!31831 V!31831 (_ BitVec 32) Int) Unit!31524)

(assert (=> b!934378 (= lt!420951 (lemmaListMapRecursiveValidKeyArray!192 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!934379 () Bool)

(declare-fun res!629305 () Bool)

(assert (=> b!934379 (=> (not res!629305) (not e!524649))))

(assert (=> b!934379 (= res!629305 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27520 _keys!1487))))))

(declare-fun b!934380 () Bool)

(assert (=> b!934380 (= e!524650 e!524648)))

(declare-fun res!629299 () Bool)

(assert (=> b!934380 (=> (not res!629299) (not e!524648))))

(assert (=> b!934380 (= res!629299 (validKeyInArray!0 lt!420950))))

(assert (=> b!934380 (= lt!420950 (select (arr!27061 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934381 () Bool)

(assert (=> b!934381 (= e!524647 (and e!524651 mapRes!31986))))

(declare-fun condMapEmpty!31986 () Bool)

(declare-fun mapDefault!31986 () ValueCell!9593)

