; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79284 () Bool)

(assert start!79284)

(declare-fun b_free!17497 () Bool)

(declare-fun b_next!17497 () Bool)

(assert (=> start!79284 (= b_free!17497 (not b_next!17497))))

(declare-fun tp!60931 () Bool)

(declare-fun b_and!28563 () Bool)

(assert (=> start!79284 (= tp!60931 b_and!28563)))

(declare-fun b!931086 () Bool)

(declare-fun res!627044 () Bool)

(declare-fun e!522896 () Bool)

(assert (=> b!931086 (=> (not res!627044) (not e!522896))))

(declare-datatypes ((array!55950 0))(
  ( (array!55951 (arr!26920 (Array (_ BitVec 32) (_ BitVec 64))) (size!27379 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55950)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55950 (_ BitVec 32)) Bool)

(assert (=> b!931086 (= res!627044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31764 () Bool)

(declare-fun mapRes!31764 () Bool)

(assert (=> mapIsEmpty!31764 mapRes!31764))

(declare-fun b!931087 () Bool)

(declare-fun res!627047 () Bool)

(assert (=> b!931087 (=> (not res!627047) (not e!522896))))

(declare-datatypes ((List!18950 0))(
  ( (Nil!18947) (Cons!18946 (h!20092 (_ BitVec 64)) (t!27007 List!18950)) )
))
(declare-fun arrayNoDuplicates!0 (array!55950 (_ BitVec 32) List!18950) Bool)

(assert (=> b!931087 (= res!627047 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18947))))

(declare-fun b!931088 () Bool)

(declare-fun res!627048 () Bool)

(assert (=> b!931088 (=> (not res!627048) (not e!522896))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931088 (= res!627048 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27379 _keys!1487))))))

(declare-fun b!931089 () Bool)

(declare-fun e!522901 () Bool)

(declare-fun tp_is_empty!20005 () Bool)

(assert (=> b!931089 (= e!522901 tp_is_empty!20005)))

(declare-fun b!931090 () Bool)

(declare-fun res!627046 () Bool)

(assert (=> b!931090 (=> (not res!627046) (not e!522896))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31639 0))(
  ( (V!31640 (val!10053 Int)) )
))
(declare-datatypes ((ValueCell!9521 0))(
  ( (ValueCellFull!9521 (v!12571 V!31639)) (EmptyCell!9521) )
))
(declare-datatypes ((array!55952 0))(
  ( (array!55953 (arr!26921 (Array (_ BitVec 32) ValueCell!9521)) (size!27380 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55952)

(assert (=> b!931090 (= res!627046 (and (= (size!27380 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27379 _keys!1487) (size!27380 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!627049 () Bool)

(assert (=> start!79284 (=> (not res!627049) (not e!522896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79284 (= res!627049 (validMask!0 mask!1881))))

(assert (=> start!79284 e!522896))

(assert (=> start!79284 true))

(declare-fun e!522899 () Bool)

(declare-fun array_inv!20952 (array!55952) Bool)

(assert (=> start!79284 (and (array_inv!20952 _values!1231) e!522899)))

(assert (=> start!79284 tp!60931))

(declare-fun array_inv!20953 (array!55950) Bool)

(assert (=> start!79284 (array_inv!20953 _keys!1487)))

(assert (=> start!79284 tp_is_empty!20005))

(declare-fun mapNonEmpty!31764 () Bool)

(declare-fun tp!60932 () Bool)

(declare-fun e!522897 () Bool)

(assert (=> mapNonEmpty!31764 (= mapRes!31764 (and tp!60932 e!522897))))

(declare-fun mapValue!31764 () ValueCell!9521)

(declare-fun mapRest!31764 () (Array (_ BitVec 32) ValueCell!9521))

(declare-fun mapKey!31764 () (_ BitVec 32))

(assert (=> mapNonEmpty!31764 (= (arr!26921 _values!1231) (store mapRest!31764 mapKey!31764 mapValue!31764))))

(declare-fun b!931091 () Bool)

(declare-fun e!522898 () Bool)

(assert (=> b!931091 (= e!522898 false)))

(declare-fun lt!419370 () V!31639)

(declare-datatypes ((tuple2!13164 0))(
  ( (tuple2!13165 (_1!6593 (_ BitVec 64)) (_2!6593 V!31639)) )
))
(declare-datatypes ((List!18951 0))(
  ( (Nil!18948) (Cons!18947 (h!20093 tuple2!13164) (t!27008 List!18951)) )
))
(declare-datatypes ((ListLongMap!11861 0))(
  ( (ListLongMap!11862 (toList!5946 List!18951)) )
))
(declare-fun lt!419371 () ListLongMap!11861)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!766 (ListLongMap!11861 (_ BitVec 64)) V!31639)

(assert (=> b!931091 (= lt!419370 (apply!766 lt!419371 k!1099))))

(declare-fun b!931092 () Bool)

(assert (=> b!931092 (= e!522899 (and e!522901 mapRes!31764))))

(declare-fun condMapEmpty!31764 () Bool)

(declare-fun mapDefault!31764 () ValueCell!9521)

