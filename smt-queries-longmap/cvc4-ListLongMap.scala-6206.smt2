; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79374 () Bool)

(assert start!79374)

(declare-fun b_free!17561 () Bool)

(declare-fun b_next!17561 () Bool)

(assert (=> start!79374 (= b_free!17561 (not b_next!17561))))

(declare-fun tp!61126 () Bool)

(declare-fun b_and!28681 () Bool)

(assert (=> start!79374 (= tp!61126 b_and!28681)))

(declare-fun b!932486 () Bool)

(declare-fun e!523658 () Bool)

(declare-fun e!523656 () Bool)

(assert (=> b!932486 (= e!523658 e!523656)))

(declare-fun res!628017 () Bool)

(assert (=> b!932486 (=> (not res!628017) (not e!523656))))

(declare-datatypes ((V!31723 0))(
  ( (V!31724 (val!10085 Int)) )
))
(declare-datatypes ((tuple2!13214 0))(
  ( (tuple2!13215 (_1!6618 (_ BitVec 64)) (_2!6618 V!31723)) )
))
(declare-datatypes ((List!18998 0))(
  ( (Nil!18995) (Cons!18994 (h!20140 tuple2!13214) (t!27103 List!18998)) )
))
(declare-datatypes ((ListLongMap!11911 0))(
  ( (ListLongMap!11912 (toList!5971 List!18998)) )
))
(declare-fun lt!419917 () ListLongMap!11911)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5020 (ListLongMap!11911 (_ BitVec 64)) Bool)

(assert (=> b!932486 (= res!628017 (contains!5020 lt!419917 k!1099))))

(declare-datatypes ((array!56078 0))(
  ( (array!56079 (arr!26983 (Array (_ BitVec 32) (_ BitVec 64))) (size!27442 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56078)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9553 0))(
  ( (ValueCellFull!9553 (v!12604 V!31723)) (EmptyCell!9553) )
))
(declare-datatypes ((array!56080 0))(
  ( (array!56081 (arr!26984 (Array (_ BitVec 32) ValueCell!9553)) (size!27443 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56080)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31723)

(declare-fun minValue!1173 () V!31723)

(declare-fun getCurrentListMap!3209 (array!56078 array!56080 (_ BitVec 32) (_ BitVec 32) V!31723 V!31723 (_ BitVec 32) Int) ListLongMap!11911)

(assert (=> b!932486 (= lt!419917 (getCurrentListMap!3209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932487 () Bool)

(declare-fun res!628019 () Bool)

(assert (=> b!932487 (=> (not res!628019) (not e!523658))))

(assert (=> b!932487 (= res!628019 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27442 _keys!1487))))))

(declare-fun b!932488 () Bool)

(declare-fun e!523654 () Bool)

(declare-fun tp_is_empty!20069 () Bool)

(assert (=> b!932488 (= e!523654 tp_is_empty!20069)))

(declare-fun mapNonEmpty!31863 () Bool)

(declare-fun mapRes!31863 () Bool)

(declare-fun tp!61127 () Bool)

(declare-fun e!523657 () Bool)

(assert (=> mapNonEmpty!31863 (= mapRes!31863 (and tp!61127 e!523657))))

(declare-fun mapKey!31863 () (_ BitVec 32))

(declare-fun mapValue!31863 () ValueCell!9553)

(declare-fun mapRest!31863 () (Array (_ BitVec 32) ValueCell!9553))

(assert (=> mapNonEmpty!31863 (= (arr!26984 _values!1231) (store mapRest!31863 mapKey!31863 mapValue!31863))))

(declare-fun b!932489 () Bool)

(declare-fun res!628018 () Bool)

(assert (=> b!932489 (=> (not res!628018) (not e!523656))))

(assert (=> b!932489 (= res!628018 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932490 () Bool)

(declare-fun res!628023 () Bool)

(assert (=> b!932490 (=> (not res!628023) (not e!523656))))

(declare-fun v!791 () V!31723)

(declare-fun apply!784 (ListLongMap!11911 (_ BitVec 64)) V!31723)

(assert (=> b!932490 (= res!628023 (= (apply!784 lt!419917 k!1099) v!791))))

(declare-fun b!932491 () Bool)

(declare-fun e!523655 () Bool)

(assert (=> b!932491 (= e!523656 e!523655)))

(declare-fun res!628015 () Bool)

(assert (=> b!932491 (=> (not res!628015) (not e!523655))))

(declare-fun lt!419913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932491 (= res!628015 (validKeyInArray!0 lt!419913))))

(assert (=> b!932491 (= lt!419913 (select (arr!26983 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932492 () Bool)

(declare-fun res!628021 () Bool)

(assert (=> b!932492 (=> (not res!628021) (not e!523658))))

(assert (=> b!932492 (= res!628021 (and (= (size!27443 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27442 _keys!1487) (size!27443 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932493 () Bool)

(assert (=> b!932493 (= e!523655 (not true))))

(declare-fun lt!419914 () tuple2!13214)

(declare-fun +!2776 (ListLongMap!11911 tuple2!13214) ListLongMap!11911)

(assert (=> b!932493 (contains!5020 (+!2776 lt!419917 lt!419914) k!1099)))

(declare-datatypes ((Unit!31467 0))(
  ( (Unit!31468) )
))
(declare-fun lt!419915 () Unit!31467)

(declare-fun lt!419918 () V!31723)

(declare-fun addStillContains!495 (ListLongMap!11911 (_ BitVec 64) V!31723 (_ BitVec 64)) Unit!31467)

(assert (=> b!932493 (= lt!419915 (addStillContains!495 lt!419917 lt!419913 lt!419918 k!1099))))

(assert (=> b!932493 (= (getCurrentListMap!3209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2776 (getCurrentListMap!3209 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419914))))

(assert (=> b!932493 (= lt!419914 (tuple2!13215 lt!419913 lt!419918))))

(declare-fun get!14188 (ValueCell!9553 V!31723) V!31723)

(declare-fun dynLambda!1565 (Int (_ BitVec 64)) V!31723)

(assert (=> b!932493 (= lt!419918 (get!14188 (select (arr!26984 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1565 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419916 () Unit!31467)

(declare-fun lemmaListMapRecursiveValidKeyArray!166 (array!56078 array!56080 (_ BitVec 32) (_ BitVec 32) V!31723 V!31723 (_ BitVec 32) Int) Unit!31467)

(assert (=> b!932493 (= lt!419916 (lemmaListMapRecursiveValidKeyArray!166 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932494 () Bool)

(declare-fun e!523659 () Bool)

(assert (=> b!932494 (= e!523659 (and e!523654 mapRes!31863))))

(declare-fun condMapEmpty!31863 () Bool)

(declare-fun mapDefault!31863 () ValueCell!9553)

