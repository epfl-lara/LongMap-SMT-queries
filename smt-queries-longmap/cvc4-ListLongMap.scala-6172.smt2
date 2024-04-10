; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79144 () Bool)

(assert start!79144)

(declare-fun b_free!17357 () Bool)

(declare-fun b_next!17357 () Bool)

(assert (=> start!79144 (= b_free!17357 (not b_next!17357))))

(declare-fun tp!60512 () Bool)

(declare-fun b_and!28423 () Bool)

(assert (=> start!79144 (= tp!60512 b_and!28423)))

(declare-fun res!625559 () Bool)

(declare-fun e!521641 () Bool)

(assert (=> start!79144 (=> (not res!625559) (not e!521641))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79144 (= res!625559 (validMask!0 mask!1881))))

(assert (=> start!79144 e!521641))

(assert (=> start!79144 true))

(declare-datatypes ((V!31451 0))(
  ( (V!31452 (val!9983 Int)) )
))
(declare-datatypes ((ValueCell!9451 0))(
  ( (ValueCellFull!9451 (v!12501 V!31451)) (EmptyCell!9451) )
))
(declare-datatypes ((array!55684 0))(
  ( (array!55685 (arr!26787 (Array (_ BitVec 32) ValueCell!9451)) (size!27246 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55684)

(declare-fun e!521638 () Bool)

(declare-fun array_inv!20852 (array!55684) Bool)

(assert (=> start!79144 (and (array_inv!20852 _values!1231) e!521638)))

(assert (=> start!79144 tp!60512))

(declare-datatypes ((array!55686 0))(
  ( (array!55687 (arr!26788 (Array (_ BitVec 32) (_ BitVec 64))) (size!27247 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55686)

(declare-fun array_inv!20853 (array!55686) Bool)

(assert (=> start!79144 (array_inv!20853 _keys!1487)))

(declare-fun tp_is_empty!19865 () Bool)

(assert (=> start!79144 tp_is_empty!19865))

(declare-fun mapIsEmpty!31554 () Bool)

(declare-fun mapRes!31554 () Bool)

(assert (=> mapIsEmpty!31554 mapRes!31554))

(declare-fun b!928971 () Bool)

(declare-fun res!625560 () Bool)

(assert (=> b!928971 (=> (not res!625560) (not e!521641))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!928971 (= res!625560 (and (= (size!27246 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27247 _keys!1487) (size!27246 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928972 () Bool)

(declare-fun e!521640 () Bool)

(assert (=> b!928972 (= e!521640 false)))

(declare-fun lt!418978 () V!31451)

(declare-datatypes ((tuple2!13048 0))(
  ( (tuple2!13049 (_1!6535 (_ BitVec 64)) (_2!6535 V!31451)) )
))
(declare-datatypes ((List!18845 0))(
  ( (Nil!18842) (Cons!18841 (h!19987 tuple2!13048) (t!26902 List!18845)) )
))
(declare-datatypes ((ListLongMap!11745 0))(
  ( (ListLongMap!11746 (toList!5888 List!18845)) )
))
(declare-fun lt!418977 () ListLongMap!11745)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!716 (ListLongMap!11745 (_ BitVec 64)) V!31451)

(assert (=> b!928972 (= lt!418978 (apply!716 lt!418977 k!1099))))

(declare-fun b!928973 () Bool)

(declare-fun res!625564 () Bool)

(assert (=> b!928973 (=> (not res!625564) (not e!521641))))

(declare-datatypes ((List!18846 0))(
  ( (Nil!18843) (Cons!18842 (h!19988 (_ BitVec 64)) (t!26903 List!18846)) )
))
(declare-fun arrayNoDuplicates!0 (array!55686 (_ BitVec 32) List!18846) Bool)

(assert (=> b!928973 (= res!625564 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18843))))

(declare-fun b!928974 () Bool)

(declare-fun res!625561 () Bool)

(assert (=> b!928974 (=> (not res!625561) (not e!521641))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!928974 (= res!625561 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27247 _keys!1487))))))

(declare-fun b!928975 () Bool)

(declare-fun e!521639 () Bool)

(assert (=> b!928975 (= e!521638 (and e!521639 mapRes!31554))))

(declare-fun condMapEmpty!31554 () Bool)

(declare-fun mapDefault!31554 () ValueCell!9451)

