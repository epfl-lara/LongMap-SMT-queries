; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79428 () Bool)

(assert start!79428)

(declare-fun b_free!17615 () Bool)

(declare-fun b_next!17615 () Bool)

(assert (=> start!79428 (= b_free!17615 (not b_next!17615))))

(declare-fun tp!61288 () Bool)

(declare-fun b_and!28789 () Bool)

(assert (=> start!79428 (= tp!61288 b_and!28789)))

(declare-fun b!933593 () Bool)

(declare-fun e!524222 () Bool)

(assert (=> b!933593 (= e!524222 (not true))))

(declare-datatypes ((array!56182 0))(
  ( (array!56183 (arr!27035 (Array (_ BitVec 32) (_ BitVec 64))) (size!27494 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56182)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!19039 0))(
  ( (Nil!19036) (Cons!19035 (h!20181 (_ BitVec 64)) (t!27198 List!19039)) )
))
(declare-fun arrayNoDuplicates!0 (array!56182 (_ BitVec 32) List!19039) Bool)

(assert (=> b!933593 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19036)))

(declare-datatypes ((Unit!31501 0))(
  ( (Unit!31502) )
))
(declare-fun lt!420484 () Unit!31501)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56182 (_ BitVec 32) (_ BitVec 32)) Unit!31501)

(assert (=> b!933593 (= lt!420484 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!31795 0))(
  ( (V!31796 (val!10112 Int)) )
))
(declare-datatypes ((tuple2!13256 0))(
  ( (tuple2!13257 (_1!6639 (_ BitVec 64)) (_2!6639 V!31795)) )
))
(declare-datatypes ((List!19040 0))(
  ( (Nil!19037) (Cons!19036 (h!20182 tuple2!13256) (t!27199 List!19040)) )
))
(declare-datatypes ((ListLongMap!11953 0))(
  ( (ListLongMap!11954 (toList!5992 List!19040)) )
))
(declare-fun lt!420485 () ListLongMap!11953)

(declare-fun lt!420481 () tuple2!13256)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5041 (ListLongMap!11953 (_ BitVec 64)) Bool)

(declare-fun +!2793 (ListLongMap!11953 tuple2!13256) ListLongMap!11953)

(assert (=> b!933593 (contains!5041 (+!2793 lt!420485 lt!420481) k!1099)))

(declare-fun lt!420479 () Unit!31501)

(declare-fun lt!420482 () (_ BitVec 64))

(declare-fun lt!420483 () V!31795)

(declare-fun addStillContains!512 (ListLongMap!11953 (_ BitVec 64) V!31795 (_ BitVec 64)) Unit!31501)

(assert (=> b!933593 (= lt!420479 (addStillContains!512 lt!420485 lt!420482 lt!420483 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9580 0))(
  ( (ValueCellFull!9580 (v!12631 V!31795)) (EmptyCell!9580) )
))
(declare-datatypes ((array!56184 0))(
  ( (array!56185 (arr!27036 (Array (_ BitVec 32) ValueCell!9580)) (size!27495 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56184)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31795)

(declare-fun minValue!1173 () V!31795)

(declare-fun getCurrentListMap!3230 (array!56182 array!56184 (_ BitVec 32) (_ BitVec 32) V!31795 V!31795 (_ BitVec 32) Int) ListLongMap!11953)

(assert (=> b!933593 (= (getCurrentListMap!3230 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2793 (getCurrentListMap!3230 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420481))))

(assert (=> b!933593 (= lt!420481 (tuple2!13257 lt!420482 lt!420483))))

(declare-fun get!14223 (ValueCell!9580 V!31795) V!31795)

(declare-fun dynLambda!1582 (Int (_ BitVec 64)) V!31795)

(assert (=> b!933593 (= lt!420483 (get!14223 (select (arr!27036 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1582 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420480 () Unit!31501)

(declare-fun lemmaListMapRecursiveValidKeyArray!183 (array!56182 array!56184 (_ BitVec 32) (_ BitVec 32) V!31795 V!31795 (_ BitVec 32) Int) Unit!31501)

(assert (=> b!933593 (= lt!420480 (lemmaListMapRecursiveValidKeyArray!183 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933594 () Bool)

(declare-fun e!524226 () Bool)

(declare-fun e!524224 () Bool)

(declare-fun mapRes!31944 () Bool)

(assert (=> b!933594 (= e!524226 (and e!524224 mapRes!31944))))

(declare-fun condMapEmpty!31944 () Bool)

(declare-fun mapDefault!31944 () ValueCell!9580)

