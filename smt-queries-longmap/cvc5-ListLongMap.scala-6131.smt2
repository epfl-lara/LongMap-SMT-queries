; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78894 () Bool)

(assert start!78894)

(declare-fun b_free!17107 () Bool)

(declare-fun b_next!17107 () Bool)

(assert (=> start!78894 (= b_free!17107 (not b_next!17107))))

(declare-fun tp!59761 () Bool)

(declare-fun b_and!27951 () Bool)

(assert (=> start!78894 (= tp!59761 b_and!27951)))

(declare-fun res!621920 () Bool)

(declare-fun e!517478 () Bool)

(assert (=> start!78894 (=> (not res!621920) (not e!517478))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78894 (= res!621920 (validMask!0 mask!1881))))

(assert (=> start!78894 e!517478))

(assert (=> start!78894 true))

(declare-fun tp_is_empty!19615 () Bool)

(assert (=> start!78894 tp_is_empty!19615))

(declare-datatypes ((V!31119 0))(
  ( (V!31120 (val!9858 Int)) )
))
(declare-datatypes ((ValueCell!9326 0))(
  ( (ValueCellFull!9326 (v!12376 V!31119)) (EmptyCell!9326) )
))
(declare-datatypes ((array!55206 0))(
  ( (array!55207 (arr!26548 (Array (_ BitVec 32) ValueCell!9326)) (size!27007 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55206)

(declare-fun e!517474 () Bool)

(declare-fun array_inv!20680 (array!55206) Bool)

(assert (=> start!78894 (and (array_inv!20680 _values!1231) e!517474)))

(assert (=> start!78894 tp!59761))

(declare-datatypes ((array!55208 0))(
  ( (array!55209 (arr!26549 (Array (_ BitVec 32) (_ BitVec 64))) (size!27008 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55208)

(declare-fun array_inv!20681 (array!55208) Bool)

(assert (=> start!78894 (array_inv!20681 _keys!1487)))

(declare-fun mapIsEmpty!31179 () Bool)

(declare-fun mapRes!31179 () Bool)

(assert (=> mapIsEmpty!31179 mapRes!31179))

(declare-fun b!922236 () Bool)

(declare-fun res!621921 () Bool)

(declare-fun e!517480 () Bool)

(assert (=> b!922236 (=> (not res!621921) (not e!517480))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31119)

(declare-datatypes ((tuple2!12824 0))(
  ( (tuple2!12825 (_1!6423 (_ BitVec 64)) (_2!6423 V!31119)) )
))
(declare-datatypes ((List!18629 0))(
  ( (Nil!18626) (Cons!18625 (h!19771 tuple2!12824) (t!26466 List!18629)) )
))
(declare-datatypes ((ListLongMap!11521 0))(
  ( (ListLongMap!11522 (toList!5776 List!18629)) )
))
(declare-fun lt!414122 () ListLongMap!11521)

(declare-fun apply!613 (ListLongMap!11521 (_ BitVec 64)) V!31119)

(assert (=> b!922236 (= res!621921 (= (apply!613 lt!414122 k!1099) v!791))))

(declare-fun b!922237 () Bool)

(declare-fun e!517475 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!922237 (= e!517475 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922238 () Bool)

(declare-fun e!517477 () Bool)

(assert (=> b!922238 (= e!517477 tp_is_empty!19615)))

(declare-fun b!922239 () Bool)

(assert (=> b!922239 (= e!517478 e!517480)))

(declare-fun res!621913 () Bool)

(assert (=> b!922239 (=> (not res!621913) (not e!517480))))

(declare-fun contains!4839 (ListLongMap!11521 (_ BitVec 64)) Bool)

(assert (=> b!922239 (= res!621913 (contains!4839 lt!414122 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31119)

(declare-fun minValue!1173 () V!31119)

(declare-fun getCurrentListMap!3030 (array!55208 array!55206 (_ BitVec 32) (_ BitVec 32) V!31119 V!31119 (_ BitVec 32) Int) ListLongMap!11521)

(assert (=> b!922239 (= lt!414122 (getCurrentListMap!3030 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922240 () Bool)

(declare-fun res!621914 () Bool)

(assert (=> b!922240 (=> (not res!621914) (not e!517478))))

(assert (=> b!922240 (= res!621914 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27008 _keys!1487))))))

(declare-fun mapNonEmpty!31179 () Bool)

(declare-fun tp!59762 () Bool)

(declare-fun e!517479 () Bool)

(assert (=> mapNonEmpty!31179 (= mapRes!31179 (and tp!59762 e!517479))))

(declare-fun mapValue!31179 () ValueCell!9326)

(declare-fun mapKey!31179 () (_ BitVec 32))

(declare-fun mapRest!31179 () (Array (_ BitVec 32) ValueCell!9326))

(assert (=> mapNonEmpty!31179 (= (arr!26548 _values!1231) (store mapRest!31179 mapKey!31179 mapValue!31179))))

(declare-fun b!922241 () Bool)

(assert (=> b!922241 (= e!517474 (and e!517477 mapRes!31179))))

(declare-fun condMapEmpty!31179 () Bool)

(declare-fun mapDefault!31179 () ValueCell!9326)

