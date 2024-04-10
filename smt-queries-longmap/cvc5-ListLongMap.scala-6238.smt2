; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79700 () Bool)

(assert start!79700)

(declare-fun b_free!17749 () Bool)

(declare-fun b_next!17749 () Bool)

(assert (=> start!79700 (= b_free!17749 (not b_next!17749))))

(declare-fun tp!61703 () Bool)

(declare-fun b_and!29089 () Bool)

(assert (=> start!79700 (= tp!61703 b_and!29089)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!937690 () Bool)

(declare-fun e!526568 () Bool)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31975 0))(
  ( (V!31976 (val!10179 Int)) )
))
(declare-datatypes ((ValueCell!9647 0))(
  ( (ValueCellFull!9647 (v!12704 V!31975)) (EmptyCell!9647) )
))
(declare-datatypes ((array!56454 0))(
  ( (array!56455 (arr!27167 (Array (_ BitVec 32) ValueCell!9647)) (size!27626 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56454)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((array!56456 0))(
  ( (array!56457 (arr!27168 (Array (_ BitVec 32) (_ BitVec 64))) (size!27627 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56456)

(declare-fun zeroValue!1173 () V!31975)

(declare-fun minValue!1173 () V!31975)

(declare-datatypes ((tuple2!13374 0))(
  ( (tuple2!13375 (_1!6698 (_ BitVec 64)) (_2!6698 V!31975)) )
))
(declare-datatypes ((List!19152 0))(
  ( (Nil!19149) (Cons!19148 (h!20294 tuple2!13374) (t!27445 List!19152)) )
))
(declare-datatypes ((ListLongMap!12071 0))(
  ( (ListLongMap!12072 (toList!6051 List!19152)) )
))
(declare-fun contains!5110 (ListLongMap!12071 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3286 (array!56456 array!56454 (_ BitVec 32) (_ BitVec 32) V!31975 V!31975 (_ BitVec 32) Int) ListLongMap!12071)

(assert (=> b!937690 (= e!526568 (not (contains!5110 (getCurrentListMap!3286 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) k!1099)))))

(declare-fun b!937691 () Bool)

(declare-fun e!526559 () Bool)

(declare-fun arrayContainsKey!0 (array!56456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937691 (= e!526559 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun res!631062 () Bool)

(declare-fun e!526560 () Bool)

(assert (=> start!79700 (=> (not res!631062) (not e!526560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79700 (= res!631062 (validMask!0 mask!1881))))

(assert (=> start!79700 e!526560))

(assert (=> start!79700 true))

(declare-fun tp_is_empty!20257 () Bool)

(assert (=> start!79700 tp_is_empty!20257))

(declare-fun e!526563 () Bool)

(declare-fun array_inv!21132 (array!56454) Bool)

(assert (=> start!79700 (and (array_inv!21132 _values!1231) e!526563)))

(assert (=> start!79700 tp!61703))

(declare-fun array_inv!21133 (array!56456) Bool)

(assert (=> start!79700 (array_inv!21133 _keys!1487)))

(declare-fun b!937692 () Bool)

(declare-fun e!526562 () Bool)

(assert (=> b!937692 (= e!526562 tp_is_empty!20257)))

(declare-fun b!937693 () Bool)

(declare-fun lt!423207 () ListLongMap!12071)

(declare-fun lt!423209 () V!31975)

(declare-fun apply!852 (ListLongMap!12071 (_ BitVec 64)) V!31975)

(assert (=> b!937693 (= (apply!852 lt!423207 k!1099) lt!423209)))

(declare-fun lt!423198 () (_ BitVec 64))

(declare-fun lt!423203 () V!31975)

(declare-fun lt!423206 () ListLongMap!12071)

(declare-datatypes ((Unit!31666 0))(
  ( (Unit!31667) )
))
(declare-fun lt!423200 () Unit!31666)

(declare-fun addApplyDifferent!438 (ListLongMap!12071 (_ BitVec 64) V!31975 (_ BitVec 64)) Unit!31666)

(assert (=> b!937693 (= lt!423200 (addApplyDifferent!438 lt!423206 lt!423198 lt!423203 k!1099))))

(assert (=> b!937693 (not (= lt!423198 k!1099))))

(declare-fun lt!423208 () Unit!31666)

(declare-datatypes ((List!19153 0))(
  ( (Nil!19150) (Cons!19149 (h!20295 (_ BitVec 64)) (t!27446 List!19153)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56456 (_ BitVec 64) (_ BitVec 32) List!19153) Unit!31666)

(assert (=> b!937693 (= lt!423208 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19150))))

(assert (=> b!937693 e!526559))

(declare-fun c!97623 () Bool)

(assert (=> b!937693 (= c!97623 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423202 () Unit!31666)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!311 (array!56456 array!56454 (_ BitVec 32) (_ BitVec 32) V!31975 V!31975 (_ BitVec 64) (_ BitVec 32) Int) Unit!31666)

(assert (=> b!937693 (= lt!423202 (lemmaListMapContainsThenArrayContainsFrom!311 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56456 (_ BitVec 32) List!19153) Bool)

(assert (=> b!937693 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19150)))

(declare-fun lt!423197 () Unit!31666)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56456 (_ BitVec 32) (_ BitVec 32)) Unit!31666)

(assert (=> b!937693 (= lt!423197 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!937693 (contains!5110 lt!423207 k!1099)))

(declare-fun lt!423204 () tuple2!13374)

(declare-fun +!2839 (ListLongMap!12071 tuple2!13374) ListLongMap!12071)

(assert (=> b!937693 (= lt!423207 (+!2839 lt!423206 lt!423204))))

(declare-fun lt!423199 () Unit!31666)

(declare-fun addStillContains!558 (ListLongMap!12071 (_ BitVec 64) V!31975 (_ BitVec 64)) Unit!31666)

(assert (=> b!937693 (= lt!423199 (addStillContains!558 lt!423206 lt!423198 lt!423203 k!1099))))

(assert (=> b!937693 (= (getCurrentListMap!3286 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2839 (getCurrentListMap!3286 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423204))))

(assert (=> b!937693 (= lt!423204 (tuple2!13375 lt!423198 lt!423203))))

(declare-fun get!14327 (ValueCell!9647 V!31975) V!31975)

(declare-fun dynLambda!1628 (Int (_ BitVec 64)) V!31975)

(assert (=> b!937693 (= lt!423203 (get!14327 (select (arr!27167 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1628 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423201 () Unit!31666)

(declare-fun lemmaListMapRecursiveValidKeyArray!229 (array!56456 array!56454 (_ BitVec 32) (_ BitVec 32) V!31975 V!31975 (_ BitVec 32) Int) Unit!31666)

(assert (=> b!937693 (= lt!423201 (lemmaListMapRecursiveValidKeyArray!229 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!526561 () Unit!31666)

(assert (=> b!937693 (= e!526561 lt!423200)))

(declare-fun mapIsEmpty!32157 () Bool)

(declare-fun mapRes!32157 () Bool)

(assert (=> mapIsEmpty!32157 mapRes!32157))

(declare-fun b!937694 () Bool)

(declare-fun e!526564 () Bool)

(assert (=> b!937694 (= e!526563 (and e!526564 mapRes!32157))))

(declare-fun condMapEmpty!32157 () Bool)

(declare-fun mapDefault!32157 () ValueCell!9647)

