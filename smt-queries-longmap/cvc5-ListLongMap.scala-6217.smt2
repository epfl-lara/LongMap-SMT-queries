; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79436 () Bool)

(assert start!79436)

(declare-fun b_free!17623 () Bool)

(declare-fun b_next!17623 () Bool)

(assert (=> start!79436 (= b_free!17623 (not b_next!17623))))

(declare-fun tp!61313 () Bool)

(declare-fun b_and!28805 () Bool)

(assert (=> start!79436 (= tp!61313 b_and!28805)))

(declare-fun b!933761 () Bool)

(declare-fun res!628949 () Bool)

(declare-fun e!524310 () Bool)

(assert (=> b!933761 (=> (not res!628949) (not e!524310))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31807 0))(
  ( (V!31808 (val!10116 Int)) )
))
(declare-fun v!791 () V!31807)

(declare-datatypes ((tuple2!13262 0))(
  ( (tuple2!13263 (_1!6642 (_ BitVec 64)) (_2!6642 V!31807)) )
))
(declare-datatypes ((List!19045 0))(
  ( (Nil!19042) (Cons!19041 (h!20187 tuple2!13262) (t!27212 List!19045)) )
))
(declare-datatypes ((ListLongMap!11959 0))(
  ( (ListLongMap!11960 (toList!5995 List!19045)) )
))
(declare-fun lt!420572 () ListLongMap!11959)

(declare-fun apply!804 (ListLongMap!11959 (_ BitVec 64)) V!31807)

(assert (=> b!933761 (= res!628949 (= (apply!804 lt!420572 k!1099) v!791))))

(declare-fun b!933762 () Bool)

(declare-fun res!628945 () Bool)

(assert (=> b!933762 (=> (not res!628945) (not e!524310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933762 (= res!628945 (validKeyInArray!0 k!1099))))

(declare-fun mapNonEmpty!31956 () Bool)

(declare-fun mapRes!31956 () Bool)

(declare-fun tp!61312 () Bool)

(declare-fun e!524313 () Bool)

(assert (=> mapNonEmpty!31956 (= mapRes!31956 (and tp!61312 e!524313))))

(declare-fun mapKey!31956 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9584 0))(
  ( (ValueCellFull!9584 (v!12635 V!31807)) (EmptyCell!9584) )
))
(declare-fun mapRest!31956 () (Array (_ BitVec 32) ValueCell!9584))

(declare-datatypes ((array!56198 0))(
  ( (array!56199 (arr!27043 (Array (_ BitVec 32) ValueCell!9584)) (size!27502 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56198)

(declare-fun mapValue!31956 () ValueCell!9584)

(assert (=> mapNonEmpty!31956 (= (arr!27043 _values!1231) (store mapRest!31956 mapKey!31956 mapValue!31956))))

(declare-fun b!933763 () Bool)

(declare-fun e!524308 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!933763 (= e!524308 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!31956 () Bool)

(assert (=> mapIsEmpty!31956 mapRes!31956))

(declare-fun b!933764 () Bool)

(declare-fun res!628948 () Bool)

(declare-fun e!524312 () Bool)

(assert (=> b!933764 (=> (not res!628948) (not e!524312))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56200 0))(
  ( (array!56201 (arr!27044 (Array (_ BitVec 32) (_ BitVec 64))) (size!27503 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56200)

(assert (=> b!933764 (= res!628948 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27503 _keys!1487))))))

(declare-fun res!628947 () Bool)

(assert (=> start!79436 (=> (not res!628947) (not e!524312))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79436 (= res!628947 (validMask!0 mask!1881))))

(assert (=> start!79436 e!524312))

(assert (=> start!79436 true))

(declare-fun tp_is_empty!20131 () Bool)

(assert (=> start!79436 tp_is_empty!20131))

(declare-fun e!524309 () Bool)

(declare-fun array_inv!21048 (array!56198) Bool)

(assert (=> start!79436 (and (array_inv!21048 _values!1231) e!524309)))

(assert (=> start!79436 tp!61313))

(declare-fun array_inv!21049 (array!56200) Bool)

(assert (=> start!79436 (array_inv!21049 _keys!1487)))

(declare-fun b!933765 () Bool)

(assert (=> b!933765 (= e!524313 tp_is_empty!20131)))

(declare-fun b!933766 () Bool)

(declare-fun e!524306 () Bool)

(assert (=> b!933766 (= e!524310 e!524306)))

(declare-fun res!628951 () Bool)

(assert (=> b!933766 (=> (not res!628951) (not e!524306))))

(declare-fun lt!420566 () (_ BitVec 64))

(assert (=> b!933766 (= res!628951 (validKeyInArray!0 lt!420566))))

(assert (=> b!933766 (= lt!420566 (select (arr!27044 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933767 () Bool)

(declare-fun res!628950 () Bool)

(assert (=> b!933767 (=> (not res!628950) (not e!524312))))

(assert (=> b!933767 (= res!628950 (and (= (size!27502 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27503 _keys!1487) (size!27502 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933768 () Bool)

(declare-fun res!628946 () Bool)

(assert (=> b!933768 (=> (not res!628946) (not e!524312))))

(declare-datatypes ((List!19046 0))(
  ( (Nil!19043) (Cons!19042 (h!20188 (_ BitVec 64)) (t!27213 List!19046)) )
))
(declare-fun arrayNoDuplicates!0 (array!56200 (_ BitVec 32) List!19046) Bool)

(assert (=> b!933768 (= res!628946 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19043))))

(declare-fun b!933769 () Bool)

(declare-fun e!524311 () Bool)

(assert (=> b!933769 (= e!524311 tp_is_empty!20131)))

(declare-fun b!933770 () Bool)

(declare-fun res!628952 () Bool)

(assert (=> b!933770 (=> (not res!628952) (not e!524312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56200 (_ BitVec 32)) Bool)

(assert (=> b!933770 (= res!628952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933771 () Bool)

(assert (=> b!933771 (= e!524306 (not (bvslt (size!27503 _keys!1487) #b01111111111111111111111111111111)))))

(assert (=> b!933771 e!524308))

(declare-fun c!97078 () Bool)

(assert (=> b!933771 (= c!97078 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31507 0))(
  ( (Unit!31508) )
))
(declare-fun lt!420565 () Unit!31507)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31807)

(declare-fun minValue!1173 () V!31807)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!268 (array!56200 array!56198 (_ BitVec 32) (_ BitVec 32) V!31807 V!31807 (_ BitVec 64) (_ BitVec 32) Int) Unit!31507)

(assert (=> b!933771 (= lt!420565 (lemmaListMapContainsThenArrayContainsFrom!268 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!933771 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19043)))

(declare-fun lt!420571 () Unit!31507)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56200 (_ BitVec 32) (_ BitVec 32)) Unit!31507)

(assert (=> b!933771 (= lt!420571 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420567 () tuple2!13262)

(declare-fun contains!5044 (ListLongMap!11959 (_ BitVec 64)) Bool)

(declare-fun +!2796 (ListLongMap!11959 tuple2!13262) ListLongMap!11959)

(assert (=> b!933771 (contains!5044 (+!2796 lt!420572 lt!420567) k!1099)))

(declare-fun lt!420569 () V!31807)

(declare-fun lt!420568 () Unit!31507)

(declare-fun addStillContains!515 (ListLongMap!11959 (_ BitVec 64) V!31807 (_ BitVec 64)) Unit!31507)

(assert (=> b!933771 (= lt!420568 (addStillContains!515 lt!420572 lt!420566 lt!420569 k!1099))))

(declare-fun getCurrentListMap!3233 (array!56200 array!56198 (_ BitVec 32) (_ BitVec 32) V!31807 V!31807 (_ BitVec 32) Int) ListLongMap!11959)

(assert (=> b!933771 (= (getCurrentListMap!3233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2796 (getCurrentListMap!3233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420567))))

(assert (=> b!933771 (= lt!420567 (tuple2!13263 lt!420566 lt!420569))))

(declare-fun get!14230 (ValueCell!9584 V!31807) V!31807)

(declare-fun dynLambda!1585 (Int (_ BitVec 64)) V!31807)

(assert (=> b!933771 (= lt!420569 (get!14230 (select (arr!27043 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1585 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420570 () Unit!31507)

(declare-fun lemmaListMapRecursiveValidKeyArray!186 (array!56200 array!56198 (_ BitVec 32) (_ BitVec 32) V!31807 V!31807 (_ BitVec 32) Int) Unit!31507)

(assert (=> b!933771 (= lt!420570 (lemmaListMapRecursiveValidKeyArray!186 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933772 () Bool)

(declare-fun arrayContainsKey!0 (array!56200 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!933772 (= e!524308 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!933773 () Bool)

(assert (=> b!933773 (= e!524309 (and e!524311 mapRes!31956))))

(declare-fun condMapEmpty!31956 () Bool)

(declare-fun mapDefault!31956 () ValueCell!9584)

