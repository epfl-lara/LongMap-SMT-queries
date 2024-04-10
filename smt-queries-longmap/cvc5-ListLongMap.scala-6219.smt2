; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79480 () Bool)

(assert start!79480)

(declare-fun b_free!17635 () Bool)

(declare-fun b_next!17635 () Bool)

(assert (=> start!79480 (= b_free!17635 (not b_next!17635))))

(declare-fun tp!61352 () Bool)

(declare-fun b_and!28837 () Bool)

(assert (=> start!79480 (= tp!61352 b_and!28837)))

(declare-fun b!934230 () Bool)

(declare-fun res!629212 () Bool)

(declare-fun e!524579 () Bool)

(assert (=> b!934230 (=> (not res!629212) (not e!524579))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!934230 (= res!629212 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934232 () Bool)

(declare-fun e!524573 () Bool)

(assert (=> b!934232 (= e!524573 (not true))))

(declare-fun e!524578 () Bool)

(assert (=> b!934232 e!524578))

(declare-fun c!97143 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!934232 (= c!97143 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31823 0))(
  ( (V!31824 (val!10122 Int)) )
))
(declare-datatypes ((ValueCell!9590 0))(
  ( (ValueCellFull!9590 (v!12642 V!31823)) (EmptyCell!9590) )
))
(declare-datatypes ((array!56224 0))(
  ( (array!56225 (arr!27055 (Array (_ BitVec 32) ValueCell!9590)) (size!27514 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56224)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((Unit!31520 0))(
  ( (Unit!31521) )
))
(declare-fun lt!420875 () Unit!31520)

(declare-datatypes ((array!56226 0))(
  ( (array!56227 (arr!27056 (Array (_ BitVec 32) (_ BitVec 64))) (size!27515 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56226)

(declare-fun zeroValue!1173 () V!31823)

(declare-fun minValue!1173 () V!31823)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!272 (array!56226 array!56224 (_ BitVec 32) (_ BitVec 32) V!31823 V!31823 (_ BitVec 64) (_ BitVec 32) Int) Unit!31520)

(assert (=> b!934232 (= lt!420875 (lemmaListMapContainsThenArrayContainsFrom!272 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19055 0))(
  ( (Nil!19052) (Cons!19051 (h!20197 (_ BitVec 64)) (t!27234 List!19055)) )
))
(declare-fun arrayNoDuplicates!0 (array!56226 (_ BitVec 32) List!19055) Bool)

(assert (=> b!934232 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19052)))

(declare-fun lt!420877 () Unit!31520)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56226 (_ BitVec 32) (_ BitVec 32)) Unit!31520)

(assert (=> b!934232 (= lt!420877 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13274 0))(
  ( (tuple2!13275 (_1!6648 (_ BitVec 64)) (_2!6648 V!31823)) )
))
(declare-datatypes ((List!19056 0))(
  ( (Nil!19053) (Cons!19052 (h!20198 tuple2!13274) (t!27235 List!19056)) )
))
(declare-datatypes ((ListLongMap!11971 0))(
  ( (ListLongMap!11972 (toList!6001 List!19056)) )
))
(declare-fun lt!420872 () ListLongMap!11971)

(declare-fun lt!420879 () tuple2!13274)

(declare-fun contains!5052 (ListLongMap!11971 (_ BitVec 64)) Bool)

(declare-fun +!2800 (ListLongMap!11971 tuple2!13274) ListLongMap!11971)

(assert (=> b!934232 (contains!5052 (+!2800 lt!420872 lt!420879) k!1099)))

(declare-fun lt!420874 () V!31823)

(declare-fun lt!420878 () Unit!31520)

(declare-fun lt!420876 () (_ BitVec 64))

(declare-fun addStillContains!519 (ListLongMap!11971 (_ BitVec 64) V!31823 (_ BitVec 64)) Unit!31520)

(assert (=> b!934232 (= lt!420878 (addStillContains!519 lt!420872 lt!420876 lt!420874 k!1099))))

(declare-fun getCurrentListMap!3239 (array!56226 array!56224 (_ BitVec 32) (_ BitVec 32) V!31823 V!31823 (_ BitVec 32) Int) ListLongMap!11971)

(assert (=> b!934232 (= (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2800 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420879))))

(assert (=> b!934232 (= lt!420879 (tuple2!13275 lt!420876 lt!420874))))

(declare-fun get!14241 (ValueCell!9590 V!31823) V!31823)

(declare-fun dynLambda!1589 (Int (_ BitVec 64)) V!31823)

(assert (=> b!934232 (= lt!420874 (get!14241 (select (arr!27055 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1589 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420873 () Unit!31520)

(declare-fun lemmaListMapRecursiveValidKeyArray!190 (array!56226 array!56224 (_ BitVec 32) (_ BitVec 32) V!31823 V!31823 (_ BitVec 32) Int) Unit!31520)

(assert (=> b!934232 (= lt!420873 (lemmaListMapRecursiveValidKeyArray!190 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!934233 () Bool)

(declare-fun res!629211 () Bool)

(assert (=> b!934233 (=> (not res!629211) (not e!524579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934233 (= res!629211 (validKeyInArray!0 k!1099))))

(declare-fun b!934234 () Bool)

(declare-fun e!524574 () Bool)

(declare-fun e!524577 () Bool)

(declare-fun mapRes!31977 () Bool)

(assert (=> b!934234 (= e!524574 (and e!524577 mapRes!31977))))

(declare-fun condMapEmpty!31977 () Bool)

(declare-fun mapDefault!31977 () ValueCell!9590)

