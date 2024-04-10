; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79676 () Bool)

(assert start!79676)

(declare-fun b_free!17725 () Bool)

(declare-fun b_next!17725 () Bool)

(assert (=> start!79676 (= b_free!17725 (not b_next!17725))))

(declare-fun tp!61630 () Bool)

(declare-fun b_and!29041 () Bool)

(assert (=> start!79676 (= tp!61630 b_and!29041)))

(declare-fun b!937088 () Bool)

(declare-fun e!526206 () Bool)

(assert (=> b!937088 (= e!526206 false)))

(declare-datatypes ((Unit!31624 0))(
  ( (Unit!31625) )
))
(declare-fun lt!422731 () Unit!31624)

(declare-fun e!526200 () Unit!31624)

(assert (=> b!937088 (= lt!422731 e!526200)))

(declare-fun c!97515 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937088 (= c!97515 (validKeyInArray!0 k!1099))))

(declare-fun b!937089 () Bool)

(declare-fun res!630808 () Bool)

(declare-fun e!526202 () Bool)

(assert (=> b!937089 (=> (not res!630808) (not e!526202))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56406 0))(
  ( (array!56407 (arr!27143 (Array (_ BitVec 32) (_ BitVec 64))) (size!27602 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56406)

(assert (=> b!937089 (= res!630808 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27602 _keys!1487))))))

(declare-fun b!937090 () Bool)

(declare-datatypes ((V!31943 0))(
  ( (V!31944 (val!10167 Int)) )
))
(declare-datatypes ((tuple2!13352 0))(
  ( (tuple2!13353 (_1!6687 (_ BitVec 64)) (_2!6687 V!31943)) )
))
(declare-datatypes ((List!19131 0))(
  ( (Nil!19128) (Cons!19127 (h!20273 tuple2!13352) (t!27400 List!19131)) )
))
(declare-datatypes ((ListLongMap!12049 0))(
  ( (ListLongMap!12050 (toList!6040 List!19131)) )
))
(declare-fun lt!422737 () ListLongMap!12049)

(declare-fun lt!422739 () V!31943)

(declare-fun apply!842 (ListLongMap!12049 (_ BitVec 64)) V!31943)

(assert (=> b!937090 (= (apply!842 lt!422737 k!1099) lt!422739)))

(declare-fun lt!422730 () (_ BitVec 64))

(declare-fun lt!422736 () Unit!31624)

(declare-fun lt!422734 () V!31943)

(declare-fun lt!422735 () ListLongMap!12049)

(declare-fun addApplyDifferent!428 (ListLongMap!12049 (_ BitVec 64) V!31943 (_ BitVec 64)) Unit!31624)

(assert (=> b!937090 (= lt!422736 (addApplyDifferent!428 lt!422735 lt!422730 lt!422734 k!1099))))

(assert (=> b!937090 (not (= lt!422730 k!1099))))

(declare-fun lt!422732 () Unit!31624)

(declare-datatypes ((List!19132 0))(
  ( (Nil!19129) (Cons!19128 (h!20274 (_ BitVec 64)) (t!27401 List!19132)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56406 (_ BitVec 64) (_ BitVec 32) List!19132) Unit!31624)

(assert (=> b!937090 (= lt!422732 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19129))))

(declare-fun e!526199 () Bool)

(assert (=> b!937090 e!526199))

(declare-fun c!97514 () Bool)

(assert (=> b!937090 (= c!97514 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!422738 () Unit!31624)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9635 0))(
  ( (ValueCellFull!9635 (v!12692 V!31943)) (EmptyCell!9635) )
))
(declare-datatypes ((array!56408 0))(
  ( (array!56409 (arr!27144 (Array (_ BitVec 32) ValueCell!9635)) (size!27603 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56408)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31943)

(declare-fun minValue!1173 () V!31943)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!301 (array!56406 array!56408 (_ BitVec 32) (_ BitVec 32) V!31943 V!31943 (_ BitVec 64) (_ BitVec 32) Int) Unit!31624)

(assert (=> b!937090 (= lt!422738 (lemmaListMapContainsThenArrayContainsFrom!301 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56406 (_ BitVec 32) List!19132) Bool)

(assert (=> b!937090 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19129)))

(declare-fun lt!422729 () Unit!31624)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56406 (_ BitVec 32) (_ BitVec 32)) Unit!31624)

(assert (=> b!937090 (= lt!422729 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5099 (ListLongMap!12049 (_ BitVec 64)) Bool)

(assert (=> b!937090 (contains!5099 lt!422737 k!1099)))

(declare-fun lt!422733 () tuple2!13352)

(declare-fun +!2829 (ListLongMap!12049 tuple2!13352) ListLongMap!12049)

(assert (=> b!937090 (= lt!422737 (+!2829 lt!422735 lt!422733))))

(declare-fun lt!422740 () Unit!31624)

(declare-fun addStillContains!548 (ListLongMap!12049 (_ BitVec 64) V!31943 (_ BitVec 64)) Unit!31624)

(assert (=> b!937090 (= lt!422740 (addStillContains!548 lt!422735 lt!422730 lt!422734 k!1099))))

(declare-fun getCurrentListMap!3275 (array!56406 array!56408 (_ BitVec 32) (_ BitVec 32) V!31943 V!31943 (_ BitVec 32) Int) ListLongMap!12049)

(assert (=> b!937090 (= (getCurrentListMap!3275 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2829 (getCurrentListMap!3275 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422733))))

(assert (=> b!937090 (= lt!422733 (tuple2!13353 lt!422730 lt!422734))))

(declare-fun get!14309 (ValueCell!9635 V!31943) V!31943)

(declare-fun dynLambda!1618 (Int (_ BitVec 64)) V!31943)

(assert (=> b!937090 (= lt!422734 (get!14309 (select (arr!27144 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1618 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422741 () Unit!31624)

(declare-fun lemmaListMapRecursiveValidKeyArray!219 (array!56406 array!56408 (_ BitVec 32) (_ BitVec 32) V!31943 V!31943 (_ BitVec 32) Int) Unit!31624)

(assert (=> b!937090 (= lt!422741 (lemmaListMapRecursiveValidKeyArray!219 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!526201 () Unit!31624)

(assert (=> b!937090 (= e!526201 lt!422736)))

(declare-fun b!937091 () Bool)

(declare-fun e!526205 () Bool)

(declare-fun tp_is_empty!20233 () Bool)

(assert (=> b!937091 (= e!526205 tp_is_empty!20233)))

(declare-fun b!937092 () Bool)

(declare-fun Unit!31626 () Unit!31624)

(assert (=> b!937092 (= e!526200 Unit!31626)))

(declare-fun b!937093 () Bool)

(declare-fun e!526204 () Bool)

(assert (=> b!937093 (= e!526204 e!526206)))

(declare-fun res!630809 () Bool)

(assert (=> b!937093 (=> (not res!630809) (not e!526206))))

(declare-fun v!791 () V!31943)

(assert (=> b!937093 (= res!630809 (and (= lt!422739 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!937093 (= lt!422739 (apply!842 lt!422735 k!1099))))

(declare-fun b!937094 () Bool)

(declare-fun e!526197 () Bool)

(assert (=> b!937094 (= e!526197 tp_is_empty!20233)))

(declare-fun b!937095 () Bool)

(declare-fun arrayContainsKey!0 (array!56406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937095 (= e!526199 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!937096 () Bool)

(assert (=> b!937096 (= e!526199 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937097 () Bool)

(assert (=> b!937097 (= e!526200 e!526201)))

(assert (=> b!937097 (= lt!422730 (select (arr!27143 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97513 () Bool)

(assert (=> b!937097 (= c!97513 (validKeyInArray!0 lt!422730))))

(declare-fun b!937098 () Bool)

(declare-fun res!630805 () Bool)

(assert (=> b!937098 (=> (not res!630805) (not e!526202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56406 (_ BitVec 32)) Bool)

(assert (=> b!937098 (= res!630805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!32121 () Bool)

(declare-fun mapRes!32121 () Bool)

(declare-fun tp!61631 () Bool)

(assert (=> mapNonEmpty!32121 (= mapRes!32121 (and tp!61631 e!526205))))

(declare-fun mapRest!32121 () (Array (_ BitVec 32) ValueCell!9635))

(declare-fun mapKey!32121 () (_ BitVec 32))

(declare-fun mapValue!32121 () ValueCell!9635)

(assert (=> mapNonEmpty!32121 (= (arr!27144 _values!1231) (store mapRest!32121 mapKey!32121 mapValue!32121))))

(declare-fun res!630810 () Bool)

(assert (=> start!79676 (=> (not res!630810) (not e!526202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79676 (= res!630810 (validMask!0 mask!1881))))

(assert (=> start!79676 e!526202))

(assert (=> start!79676 true))

(assert (=> start!79676 tp_is_empty!20233))

(declare-fun e!526203 () Bool)

(declare-fun array_inv!21118 (array!56408) Bool)

(assert (=> start!79676 (and (array_inv!21118 _values!1231) e!526203)))

(assert (=> start!79676 tp!61630))

(declare-fun array_inv!21119 (array!56406) Bool)

(assert (=> start!79676 (array_inv!21119 _keys!1487)))

(declare-fun mapIsEmpty!32121 () Bool)

(assert (=> mapIsEmpty!32121 mapRes!32121))

(declare-fun b!937099 () Bool)

(declare-fun res!630811 () Bool)

(assert (=> b!937099 (=> (not res!630811) (not e!526202))))

(assert (=> b!937099 (= res!630811 (and (= (size!27603 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27602 _keys!1487) (size!27603 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937100 () Bool)

(assert (=> b!937100 (= e!526202 e!526204)))

(declare-fun res!630806 () Bool)

(assert (=> b!937100 (=> (not res!630806) (not e!526204))))

(assert (=> b!937100 (= res!630806 (contains!5099 lt!422735 k!1099))))

(assert (=> b!937100 (= lt!422735 (getCurrentListMap!3275 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937101 () Bool)

(declare-fun Unit!31627 () Unit!31624)

(assert (=> b!937101 (= e!526201 Unit!31627)))

(declare-fun b!937102 () Bool)

(assert (=> b!937102 (= e!526203 (and e!526197 mapRes!32121))))

(declare-fun condMapEmpty!32121 () Bool)

(declare-fun mapDefault!32121 () ValueCell!9635)

