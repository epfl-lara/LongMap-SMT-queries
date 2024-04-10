; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79180 () Bool)

(assert start!79180)

(declare-fun b_free!17393 () Bool)

(declare-fun b_next!17393 () Bool)

(assert (=> start!79180 (= b_free!17393 (not b_next!17393))))

(declare-fun tp!60619 () Bool)

(declare-fun b_and!28459 () Bool)

(assert (=> start!79180 (= tp!60619 b_and!28459)))

(declare-fun b!929500 () Bool)

(declare-fun res!625931 () Bool)

(declare-fun e!521965 () Bool)

(assert (=> b!929500 (=> (not res!625931) (not e!521965))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929500 (= res!625931 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!929501 () Bool)

(declare-fun e!521961 () Bool)

(assert (=> b!929501 (= e!521961 e!521965)))

(declare-fun res!625932 () Bool)

(assert (=> b!929501 (=> (not res!625932) (not e!521965))))

(declare-datatypes ((V!31499 0))(
  ( (V!31500 (val!10001 Int)) )
))
(declare-datatypes ((tuple2!13076 0))(
  ( (tuple2!13077 (_1!6549 (_ BitVec 64)) (_2!6549 V!31499)) )
))
(declare-datatypes ((List!18870 0))(
  ( (Nil!18867) (Cons!18866 (h!20012 tuple2!13076) (t!26927 List!18870)) )
))
(declare-datatypes ((ListLongMap!11773 0))(
  ( (ListLongMap!11774 (toList!5902 List!18870)) )
))
(declare-fun lt!419077 () ListLongMap!11773)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4955 (ListLongMap!11773 (_ BitVec 64)) Bool)

(assert (=> b!929501 (= res!625932 (contains!4955 lt!419077 k!1099))))

(declare-datatypes ((array!55756 0))(
  ( (array!55757 (arr!26823 (Array (_ BitVec 32) (_ BitVec 64))) (size!27282 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55756)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9469 0))(
  ( (ValueCellFull!9469 (v!12519 V!31499)) (EmptyCell!9469) )
))
(declare-datatypes ((array!55758 0))(
  ( (array!55759 (arr!26824 (Array (_ BitVec 32) ValueCell!9469)) (size!27283 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55758)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31499)

(declare-fun minValue!1173 () V!31499)

(declare-fun getCurrentListMap!3146 (array!55756 array!55758 (_ BitVec 32) (_ BitVec 32) V!31499 V!31499 (_ BitVec 32) Int) ListLongMap!11773)

(assert (=> b!929501 (= lt!419077 (getCurrentListMap!3146 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929502 () Bool)

(declare-fun e!521960 () Bool)

(declare-fun tp_is_empty!19901 () Bool)

(assert (=> b!929502 (= e!521960 tp_is_empty!19901)))

(declare-fun mapNonEmpty!31608 () Bool)

(declare-fun mapRes!31608 () Bool)

(declare-fun tp!60620 () Bool)

(assert (=> mapNonEmpty!31608 (= mapRes!31608 (and tp!60620 e!521960))))

(declare-fun mapKey!31608 () (_ BitVec 32))

(declare-fun mapValue!31608 () ValueCell!9469)

(declare-fun mapRest!31608 () (Array (_ BitVec 32) ValueCell!9469))

(assert (=> mapNonEmpty!31608 (= (arr!26824 _values!1231) (store mapRest!31608 mapKey!31608 mapValue!31608))))

(declare-fun b!929503 () Bool)

(declare-fun res!625926 () Bool)

(assert (=> b!929503 (=> (not res!625926) (not e!521961))))

(assert (=> b!929503 (= res!625926 (and (= (size!27283 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27282 _keys!1487) (size!27283 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31608 () Bool)

(assert (=> mapIsEmpty!31608 mapRes!31608))

(declare-fun b!929504 () Bool)

(declare-fun res!625929 () Bool)

(assert (=> b!929504 (=> (not res!625929) (not e!521961))))

(declare-datatypes ((List!18871 0))(
  ( (Nil!18868) (Cons!18867 (h!20013 (_ BitVec 64)) (t!26928 List!18871)) )
))
(declare-fun arrayNoDuplicates!0 (array!55756 (_ BitVec 32) List!18871) Bool)

(assert (=> b!929504 (= res!625929 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18868))))

(declare-fun b!929505 () Bool)

(declare-fun e!521963 () Bool)

(declare-fun e!521962 () Bool)

(assert (=> b!929505 (= e!521963 (and e!521962 mapRes!31608))))

(declare-fun condMapEmpty!31608 () Bool)

(declare-fun mapDefault!31608 () ValueCell!9469)

