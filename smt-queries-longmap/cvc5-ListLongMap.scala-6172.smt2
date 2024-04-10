; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79140 () Bool)

(assert start!79140)

(declare-fun b_free!17353 () Bool)

(declare-fun b_next!17353 () Bool)

(assert (=> start!79140 (= b_free!17353 (not b_next!17353))))

(declare-fun tp!60500 () Bool)

(declare-fun b_and!28419 () Bool)

(assert (=> start!79140 (= tp!60500 b_and!28419)))

(declare-fun b!928917 () Bool)

(declare-fun e!521603 () Bool)

(declare-fun e!521605 () Bool)

(assert (=> b!928917 (= e!521603 e!521605)))

(declare-fun res!625526 () Bool)

(assert (=> b!928917 (=> (not res!625526) (not e!521605))))

(declare-datatypes ((V!31447 0))(
  ( (V!31448 (val!9981 Int)) )
))
(declare-datatypes ((tuple2!13044 0))(
  ( (tuple2!13045 (_1!6533 (_ BitVec 64)) (_2!6533 V!31447)) )
))
(declare-datatypes ((List!18841 0))(
  ( (Nil!18838) (Cons!18837 (h!19983 tuple2!13044) (t!26898 List!18841)) )
))
(declare-datatypes ((ListLongMap!11741 0))(
  ( (ListLongMap!11742 (toList!5886 List!18841)) )
))
(declare-fun lt!418966 () ListLongMap!11741)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4942 (ListLongMap!11741 (_ BitVec 64)) Bool)

(assert (=> b!928917 (= res!625526 (contains!4942 lt!418966 k!1099))))

(declare-datatypes ((array!55676 0))(
  ( (array!55677 (arr!26783 (Array (_ BitVec 32) (_ BitVec 64))) (size!27242 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55676)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9449 0))(
  ( (ValueCellFull!9449 (v!12499 V!31447)) (EmptyCell!9449) )
))
(declare-datatypes ((array!55678 0))(
  ( (array!55679 (arr!26784 (Array (_ BitVec 32) ValueCell!9449)) (size!27243 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55678)

(declare-fun zeroValue!1173 () V!31447)

(declare-fun minValue!1173 () V!31447)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3133 (array!55676 array!55678 (_ BitVec 32) (_ BitVec 32) V!31447 V!31447 (_ BitVec 32) Int) ListLongMap!11741)

(assert (=> b!928917 (= lt!418966 (getCurrentListMap!3133 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928918 () Bool)

(declare-fun e!521600 () Bool)

(declare-fun tp_is_empty!19861 () Bool)

(assert (=> b!928918 (= e!521600 tp_is_empty!19861)))

(declare-fun b!928919 () Bool)

(declare-fun res!625527 () Bool)

(assert (=> b!928919 (=> (not res!625527) (not e!521603))))

(declare-datatypes ((List!18842 0))(
  ( (Nil!18839) (Cons!18838 (h!19984 (_ BitVec 64)) (t!26899 List!18842)) )
))
(declare-fun arrayNoDuplicates!0 (array!55676 (_ BitVec 32) List!18842) Bool)

(assert (=> b!928919 (= res!625527 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18839))))

(declare-fun mapNonEmpty!31548 () Bool)

(declare-fun mapRes!31548 () Bool)

(declare-fun tp!60499 () Bool)

(assert (=> mapNonEmpty!31548 (= mapRes!31548 (and tp!60499 e!521600))))

(declare-fun mapKey!31548 () (_ BitVec 32))

(declare-fun mapValue!31548 () ValueCell!9449)

(declare-fun mapRest!31548 () (Array (_ BitVec 32) ValueCell!9449))

(assert (=> mapNonEmpty!31548 (= (arr!26784 _values!1231) (store mapRest!31548 mapKey!31548 mapValue!31548))))

(declare-fun res!625525 () Bool)

(assert (=> start!79140 (=> (not res!625525) (not e!521603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79140 (= res!625525 (validMask!0 mask!1881))))

(assert (=> start!79140 e!521603))

(assert (=> start!79140 true))

(declare-fun e!521602 () Bool)

(declare-fun array_inv!20848 (array!55678) Bool)

(assert (=> start!79140 (and (array_inv!20848 _values!1231) e!521602)))

(assert (=> start!79140 tp!60500))

(declare-fun array_inv!20849 (array!55676) Bool)

(assert (=> start!79140 (array_inv!20849 _keys!1487)))

(assert (=> start!79140 tp_is_empty!19861))

(declare-fun mapIsEmpty!31548 () Bool)

(assert (=> mapIsEmpty!31548 mapRes!31548))

(declare-fun b!928920 () Bool)

(declare-fun e!521604 () Bool)

(assert (=> b!928920 (= e!521604 tp_is_empty!19861)))

(declare-fun b!928921 () Bool)

(assert (=> b!928921 (= e!521602 (and e!521604 mapRes!31548))))

(declare-fun condMapEmpty!31548 () Bool)

(declare-fun mapDefault!31548 () ValueCell!9449)

