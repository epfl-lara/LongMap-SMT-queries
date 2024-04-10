; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79290 () Bool)

(assert start!79290)

(declare-fun b_free!17503 () Bool)

(declare-fun b_next!17503 () Bool)

(assert (=> start!79290 (= b_free!17503 (not b_next!17503))))

(declare-fun tp!60949 () Bool)

(declare-fun b_and!28569 () Bool)

(assert (=> start!79290 (= tp!60949 b_and!28569)))

(declare-fun b!931175 () Bool)

(declare-fun res!627112 () Bool)

(declare-fun e!522952 () Bool)

(assert (=> b!931175 (=> (not res!627112) (not e!522952))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31647 0))(
  ( (V!31648 (val!10056 Int)) )
))
(declare-fun v!791 () V!31647)

(declare-datatypes ((tuple2!13170 0))(
  ( (tuple2!13171 (_1!6596 (_ BitVec 64)) (_2!6596 V!31647)) )
))
(declare-datatypes ((List!18955 0))(
  ( (Nil!18952) (Cons!18951 (h!20097 tuple2!13170) (t!27012 List!18955)) )
))
(declare-datatypes ((ListLongMap!11867 0))(
  ( (ListLongMap!11868 (toList!5949 List!18955)) )
))
(declare-fun lt!419386 () ListLongMap!11867)

(declare-fun apply!769 (ListLongMap!11867 (_ BitVec 64)) V!31647)

(assert (=> b!931175 (= res!627112 (= (apply!769 lt!419386 k!1099) v!791))))

(declare-fun b!931176 () Bool)

(declare-fun e!522951 () Bool)

(declare-fun tp_is_empty!20011 () Bool)

(assert (=> b!931176 (= e!522951 tp_is_empty!20011)))

(declare-fun b!931177 () Bool)

(declare-fun res!627110 () Bool)

(assert (=> b!931177 (=> (not res!627110) (not e!522952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931177 (= res!627110 (validKeyInArray!0 k!1099))))

(declare-fun mapIsEmpty!31773 () Bool)

(declare-fun mapRes!31773 () Bool)

(assert (=> mapIsEmpty!31773 mapRes!31773))

(declare-fun mapNonEmpty!31773 () Bool)

(declare-fun tp!60950 () Bool)

(declare-fun e!522950 () Bool)

(assert (=> mapNonEmpty!31773 (= mapRes!31773 (and tp!60950 e!522950))))

(declare-fun mapKey!31773 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9524 0))(
  ( (ValueCellFull!9524 (v!12574 V!31647)) (EmptyCell!9524) )
))
(declare-fun mapValue!31773 () ValueCell!9524)

(declare-datatypes ((array!55962 0))(
  ( (array!55963 (arr!26926 (Array (_ BitVec 32) ValueCell!9524)) (size!27385 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55962)

(declare-fun mapRest!31773 () (Array (_ BitVec 32) ValueCell!9524))

(assert (=> mapNonEmpty!31773 (= (arr!26926 _values!1231) (store mapRest!31773 mapKey!31773 mapValue!31773))))

(declare-fun res!627107 () Bool)

(declare-fun e!522953 () Bool)

(assert (=> start!79290 (=> (not res!627107) (not e!522953))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79290 (= res!627107 (validMask!0 mask!1881))))

(assert (=> start!79290 e!522953))

(assert (=> start!79290 true))

(assert (=> start!79290 tp_is_empty!20011))

(declare-fun e!522955 () Bool)

(declare-fun array_inv!20958 (array!55962) Bool)

(assert (=> start!79290 (and (array_inv!20958 _values!1231) e!522955)))

(assert (=> start!79290 tp!60949))

(declare-datatypes ((array!55964 0))(
  ( (array!55965 (arr!26927 (Array (_ BitVec 32) (_ BitVec 64))) (size!27386 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55964)

(declare-fun array_inv!20959 (array!55964) Bool)

(assert (=> start!79290 (array_inv!20959 _keys!1487)))

(declare-fun b!931178 () Bool)

(declare-fun res!627115 () Bool)

(assert (=> b!931178 (=> (not res!627115) (not e!522953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55964 (_ BitVec 32)) Bool)

(assert (=> b!931178 (= res!627115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931179 () Bool)

(declare-fun res!627108 () Bool)

(assert (=> b!931179 (=> (not res!627108) (not e!522952))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931179 (= res!627108 (validKeyInArray!0 (select (arr!26927 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!931180 () Bool)

(assert (=> b!931180 (= e!522950 tp_is_empty!20011)))

(declare-fun b!931181 () Bool)

(declare-fun res!627114 () Bool)

(assert (=> b!931181 (=> (not res!627114) (not e!522953))))

(declare-datatypes ((List!18956 0))(
  ( (Nil!18953) (Cons!18952 (h!20098 (_ BitVec 64)) (t!27013 List!18956)) )
))
(declare-fun arrayNoDuplicates!0 (array!55964 (_ BitVec 32) List!18956) Bool)

(assert (=> b!931181 (= res!627114 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18953))))

(declare-fun b!931182 () Bool)

(declare-fun res!627113 () Bool)

(assert (=> b!931182 (=> (not res!627113) (not e!522952))))

(assert (=> b!931182 (= res!627113 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!931183 () Bool)

(assert (=> b!931183 (= e!522952 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27386 _keys!1487)))))

(declare-fun b!931184 () Bool)

(declare-fun res!627111 () Bool)

(assert (=> b!931184 (=> (not res!627111) (not e!522953))))

(assert (=> b!931184 (= res!627111 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27386 _keys!1487))))))

(declare-fun b!931185 () Bool)

(declare-fun res!627106 () Bool)

(assert (=> b!931185 (=> (not res!627106) (not e!522953))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!931185 (= res!627106 (and (= (size!27385 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27386 _keys!1487) (size!27385 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931186 () Bool)

(assert (=> b!931186 (= e!522953 e!522952)))

(declare-fun res!627109 () Bool)

(assert (=> b!931186 (=> (not res!627109) (not e!522952))))

(declare-fun contains!4996 (ListLongMap!11867 (_ BitVec 64)) Bool)

(assert (=> b!931186 (= res!627109 (contains!4996 lt!419386 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31647)

(declare-fun minValue!1173 () V!31647)

(declare-fun getCurrentListMap!3187 (array!55964 array!55962 (_ BitVec 32) (_ BitVec 32) V!31647 V!31647 (_ BitVec 32) Int) ListLongMap!11867)

(assert (=> b!931186 (= lt!419386 (getCurrentListMap!3187 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931187 () Bool)

(assert (=> b!931187 (= e!522955 (and e!522951 mapRes!31773))))

(declare-fun condMapEmpty!31773 () Bool)

(declare-fun mapDefault!31773 () ValueCell!9524)

