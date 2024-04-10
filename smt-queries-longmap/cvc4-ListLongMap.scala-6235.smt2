; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79686 () Bool)

(assert start!79686)

(declare-fun b_free!17735 () Bool)

(declare-fun b_next!17735 () Bool)

(assert (=> start!79686 (= b_free!17735 (not b_next!17735))))

(declare-fun tp!61660 () Bool)

(declare-fun b_and!29061 () Bool)

(assert (=> start!79686 (= tp!61660 b_and!29061)))

(declare-fun b!937338 () Bool)

(declare-fun e!526348 () Bool)

(declare-fun tp_is_empty!20243 () Bool)

(assert (=> b!937338 (= e!526348 tp_is_empty!20243)))

(declare-fun mapNonEmpty!32136 () Bool)

(declare-fun mapRes!32136 () Bool)

(declare-fun tp!61661 () Bool)

(assert (=> mapNonEmpty!32136 (= mapRes!32136 (and tp!61661 e!526348))))

(declare-datatypes ((V!31955 0))(
  ( (V!31956 (val!10172 Int)) )
))
(declare-datatypes ((ValueCell!9640 0))(
  ( (ValueCellFull!9640 (v!12697 V!31955)) (EmptyCell!9640) )
))
(declare-datatypes ((array!56426 0))(
  ( (array!56427 (arr!27153 (Array (_ BitVec 32) ValueCell!9640)) (size!27612 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56426)

(declare-fun mapValue!32136 () ValueCell!9640)

(declare-fun mapRest!32136 () (Array (_ BitVec 32) ValueCell!9640))

(declare-fun mapKey!32136 () (_ BitVec 32))

(assert (=> mapNonEmpty!32136 (= (arr!27153 _values!1231) (store mapRest!32136 mapKey!32136 mapValue!32136))))

(declare-fun b!937339 () Bool)

(declare-datatypes ((Unit!31644 0))(
  ( (Unit!31645) )
))
(declare-fun e!526356 () Unit!31644)

(declare-fun Unit!31646 () Unit!31644)

(assert (=> b!937339 (= e!526356 Unit!31646)))

(declare-fun b!937340 () Bool)

(declare-fun e!526352 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!937340 (= e!526352 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937341 () Bool)

(declare-datatypes ((tuple2!13360 0))(
  ( (tuple2!13361 (_1!6691 (_ BitVec 64)) (_2!6691 V!31955)) )
))
(declare-datatypes ((List!19139 0))(
  ( (Nil!19136) (Cons!19135 (h!20281 tuple2!13360) (t!27418 List!19139)) )
))
(declare-datatypes ((ListLongMap!12057 0))(
  ( (ListLongMap!12058 (toList!6044 List!19139)) )
))
(declare-fun lt!422931 () ListLongMap!12057)

(declare-fun lt!422927 () V!31955)

(declare-fun apply!846 (ListLongMap!12057 (_ BitVec 64)) V!31955)

(assert (=> b!937341 (= (apply!846 lt!422931 k!1099) lt!422927)))

(declare-fun lt!422934 () V!31955)

(declare-fun lt!422936 () (_ BitVec 64))

(declare-fun lt!422924 () Unit!31644)

(declare-fun lt!422929 () ListLongMap!12057)

(declare-fun addApplyDifferent!432 (ListLongMap!12057 (_ BitVec 64) V!31955 (_ BitVec 64)) Unit!31644)

(assert (=> b!937341 (= lt!422924 (addApplyDifferent!432 lt!422929 lt!422936 lt!422934 k!1099))))

(assert (=> b!937341 (not (= lt!422936 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!422925 () Unit!31644)

(declare-datatypes ((array!56428 0))(
  ( (array!56429 (arr!27154 (Array (_ BitVec 32) (_ BitVec 64))) (size!27613 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56428)

(declare-datatypes ((List!19140 0))(
  ( (Nil!19137) (Cons!19136 (h!20282 (_ BitVec 64)) (t!27419 List!19140)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56428 (_ BitVec 64) (_ BitVec 32) List!19140) Unit!31644)

(assert (=> b!937341 (= lt!422925 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19137))))

(assert (=> b!937341 e!526352))

(declare-fun c!97559 () Bool)

(assert (=> b!937341 (= c!97559 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!422932 () Unit!31644)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31955)

(declare-fun minValue!1173 () V!31955)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!305 (array!56428 array!56426 (_ BitVec 32) (_ BitVec 32) V!31955 V!31955 (_ BitVec 64) (_ BitVec 32) Int) Unit!31644)

(assert (=> b!937341 (= lt!422932 (lemmaListMapContainsThenArrayContainsFrom!305 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56428 (_ BitVec 32) List!19140) Bool)

(assert (=> b!937341 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19137)))

(declare-fun lt!422930 () Unit!31644)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56428 (_ BitVec 32) (_ BitVec 32)) Unit!31644)

(assert (=> b!937341 (= lt!422930 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5103 (ListLongMap!12057 (_ BitVec 64)) Bool)

(assert (=> b!937341 (contains!5103 lt!422931 k!1099)))

(declare-fun lt!422935 () tuple2!13360)

(declare-fun +!2833 (ListLongMap!12057 tuple2!13360) ListLongMap!12057)

(assert (=> b!937341 (= lt!422931 (+!2833 lt!422929 lt!422935))))

(declare-fun lt!422933 () Unit!31644)

(declare-fun addStillContains!552 (ListLongMap!12057 (_ BitVec 64) V!31955 (_ BitVec 64)) Unit!31644)

(assert (=> b!937341 (= lt!422933 (addStillContains!552 lt!422929 lt!422936 lt!422934 k!1099))))

(declare-fun getCurrentListMap!3279 (array!56428 array!56426 (_ BitVec 32) (_ BitVec 32) V!31955 V!31955 (_ BitVec 32) Int) ListLongMap!12057)

(assert (=> b!937341 (= (getCurrentListMap!3279 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2833 (getCurrentListMap!3279 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422935))))

(assert (=> b!937341 (= lt!422935 (tuple2!13361 lt!422936 lt!422934))))

(declare-fun get!14315 (ValueCell!9640 V!31955) V!31955)

(declare-fun dynLambda!1622 (Int (_ BitVec 64)) V!31955)

(assert (=> b!937341 (= lt!422934 (get!14315 (select (arr!27153 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1622 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422926 () Unit!31644)

(declare-fun lemmaListMapRecursiveValidKeyArray!223 (array!56428 array!56426 (_ BitVec 32) (_ BitVec 32) V!31955 V!31955 (_ BitVec 32) Int) Unit!31644)

(assert (=> b!937341 (= lt!422926 (lemmaListMapRecursiveValidKeyArray!223 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!526349 () Unit!31644)

(assert (=> b!937341 (= e!526349 lt!422924)))

(declare-fun b!937342 () Bool)

(assert (=> b!937342 (= e!526356 e!526349)))

(assert (=> b!937342 (= lt!422936 (select (arr!27154 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97560 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937342 (= c!97560 (validKeyInArray!0 lt!422936))))

(declare-fun b!937343 () Bool)

(declare-fun e!526350 () Bool)

(declare-fun e!526355 () Bool)

(assert (=> b!937343 (= e!526350 (and e!526355 mapRes!32136))))

(declare-fun condMapEmpty!32136 () Bool)

(declare-fun mapDefault!32136 () ValueCell!9640)

