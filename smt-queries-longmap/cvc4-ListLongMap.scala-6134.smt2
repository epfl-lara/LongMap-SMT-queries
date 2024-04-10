; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78916 () Bool)

(assert start!78916)

(declare-fun b_free!17129 () Bool)

(declare-fun b_next!17129 () Bool)

(assert (=> start!78916 (= b_free!17129 (not b_next!17129))))

(declare-fun tp!59828 () Bool)

(declare-fun b_and!27995 () Bool)

(assert (=> start!78916 (= tp!59828 b_and!27995)))

(declare-fun b!922754 () Bool)

(declare-fun e!517743 () Bool)

(declare-fun e!517741 () Bool)

(assert (=> b!922754 (= e!517743 e!517741)))

(declare-fun res!622244 () Bool)

(assert (=> b!922754 (=> (not res!622244) (not e!517741))))

(declare-fun lt!414422 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922754 (= res!622244 (validKeyInArray!0 lt!414422))))

(declare-datatypes ((array!55250 0))(
  ( (array!55251 (arr!26570 (Array (_ BitVec 32) (_ BitVec 64))) (size!27029 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55250)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922754 (= lt!414422 (select (arr!26570 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922755 () Bool)

(declare-fun e!517739 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!922755 (= e!517739 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922756 () Bool)

(declare-fun res!622249 () Bool)

(declare-fun e!517744 () Bool)

(assert (=> b!922756 (=> (not res!622249) (not e!517744))))

(declare-datatypes ((List!18645 0))(
  ( (Nil!18642) (Cons!18641 (h!19787 (_ BitVec 64)) (t!26504 List!18645)) )
))
(declare-fun arrayNoDuplicates!0 (array!55250 (_ BitVec 32) List!18645) Bool)

(assert (=> b!922756 (= res!622249 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18642))))

(declare-fun b!922757 () Bool)

(declare-fun res!622246 () Bool)

(assert (=> b!922757 (=> (not res!622246) (not e!517744))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((V!31147 0))(
  ( (V!31148 (val!9869 Int)) )
))
(declare-datatypes ((ValueCell!9337 0))(
  ( (ValueCellFull!9337 (v!12387 V!31147)) (EmptyCell!9337) )
))
(declare-datatypes ((array!55252 0))(
  ( (array!55253 (arr!26571 (Array (_ BitVec 32) ValueCell!9337)) (size!27030 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55252)

(assert (=> b!922757 (= res!622246 (and (= (size!27030 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27029 _keys!1487) (size!27030 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922758 () Bool)

(assert (=> b!922758 (= e!517744 e!517743)))

(declare-fun res!622252 () Bool)

(assert (=> b!922758 (=> (not res!622252) (not e!517743))))

(declare-datatypes ((tuple2!12840 0))(
  ( (tuple2!12841 (_1!6431 (_ BitVec 64)) (_2!6431 V!31147)) )
))
(declare-datatypes ((List!18646 0))(
  ( (Nil!18643) (Cons!18642 (h!19788 tuple2!12840) (t!26505 List!18646)) )
))
(declare-datatypes ((ListLongMap!11537 0))(
  ( (ListLongMap!11538 (toList!5784 List!18646)) )
))
(declare-fun lt!414416 () ListLongMap!11537)

(declare-fun contains!4847 (ListLongMap!11537 (_ BitVec 64)) Bool)

(assert (=> b!922758 (= res!622252 (contains!4847 lt!414416 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31147)

(declare-fun minValue!1173 () V!31147)

(declare-fun getCurrentListMap!3038 (array!55250 array!55252 (_ BitVec 32) (_ BitVec 32) V!31147 V!31147 (_ BitVec 32) Int) ListLongMap!11537)

(assert (=> b!922758 (= lt!414416 (getCurrentListMap!3038 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922759 () Bool)

(declare-fun res!622251 () Bool)

(assert (=> b!922759 (=> (not res!622251) (not e!517743))))

(assert (=> b!922759 (= res!622251 (validKeyInArray!0 k!1099))))

(declare-fun mapNonEmpty!31212 () Bool)

(declare-fun mapRes!31212 () Bool)

(declare-fun tp!59827 () Bool)

(declare-fun e!517738 () Bool)

(assert (=> mapNonEmpty!31212 (= mapRes!31212 (and tp!59827 e!517738))))

(declare-fun mapKey!31212 () (_ BitVec 32))

(declare-fun mapRest!31212 () (Array (_ BitVec 32) ValueCell!9337))

(declare-fun mapValue!31212 () ValueCell!9337)

(assert (=> mapNonEmpty!31212 (= (arr!26571 _values!1231) (store mapRest!31212 mapKey!31212 mapValue!31212))))

(declare-fun res!622245 () Bool)

(assert (=> start!78916 (=> (not res!622245) (not e!517744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78916 (= res!622245 (validMask!0 mask!1881))))

(assert (=> start!78916 e!517744))

(assert (=> start!78916 true))

(declare-fun tp_is_empty!19637 () Bool)

(assert (=> start!78916 tp_is_empty!19637))

(declare-fun e!517742 () Bool)

(declare-fun array_inv!20696 (array!55252) Bool)

(assert (=> start!78916 (and (array_inv!20696 _values!1231) e!517742)))

(assert (=> start!78916 tp!59828))

(declare-fun array_inv!20697 (array!55250) Bool)

(assert (=> start!78916 (array_inv!20697 _keys!1487)))

(declare-fun b!922753 () Bool)

(declare-fun e!517737 () Bool)

(assert (=> b!922753 (= e!517742 (and e!517737 mapRes!31212))))

(declare-fun condMapEmpty!31212 () Bool)

(declare-fun mapDefault!31212 () ValueCell!9337)

