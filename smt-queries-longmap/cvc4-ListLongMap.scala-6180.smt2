; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79192 () Bool)

(assert start!79192)

(declare-fun b_free!17405 () Bool)

(declare-fun b_next!17405 () Bool)

(assert (=> start!79192 (= b_free!17405 (not b_next!17405))))

(declare-fun tp!60656 () Bool)

(declare-fun b_and!28471 () Bool)

(assert (=> start!79192 (= tp!60656 b_and!28471)))

(declare-fun b!929698 () Bool)

(declare-fun e!522071 () Bool)

(declare-fun tp_is_empty!19913 () Bool)

(assert (=> b!929698 (= e!522071 tp_is_empty!19913)))

(declare-fun mapIsEmpty!31626 () Bool)

(declare-fun mapRes!31626 () Bool)

(assert (=> mapIsEmpty!31626 mapRes!31626))

(declare-fun b!929699 () Bool)

(declare-fun res!626076 () Bool)

(declare-fun e!522068 () Bool)

(assert (=> b!929699 (=> (not res!626076) (not e!522068))))

(declare-datatypes ((array!55778 0))(
  ( (array!55779 (arr!26834 (Array (_ BitVec 32) (_ BitVec 64))) (size!27293 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55778)

(declare-datatypes ((List!18880 0))(
  ( (Nil!18877) (Cons!18876 (h!20022 (_ BitVec 64)) (t!26937 List!18880)) )
))
(declare-fun arrayNoDuplicates!0 (array!55778 (_ BitVec 32) List!18880) Bool)

(assert (=> b!929699 (= res!626076 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18877))))

(declare-fun res!626074 () Bool)

(assert (=> start!79192 (=> (not res!626074) (not e!522068))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79192 (= res!626074 (validMask!0 mask!1881))))

(assert (=> start!79192 e!522068))

(assert (=> start!79192 true))

(assert (=> start!79192 tp_is_empty!19913))

(declare-datatypes ((V!31515 0))(
  ( (V!31516 (val!10007 Int)) )
))
(declare-datatypes ((ValueCell!9475 0))(
  ( (ValueCellFull!9475 (v!12525 V!31515)) (EmptyCell!9475) )
))
(declare-datatypes ((array!55780 0))(
  ( (array!55781 (arr!26835 (Array (_ BitVec 32) ValueCell!9475)) (size!27294 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55780)

(declare-fun e!522073 () Bool)

(declare-fun array_inv!20880 (array!55780) Bool)

(assert (=> start!79192 (and (array_inv!20880 _values!1231) e!522073)))

(assert (=> start!79192 tp!60656))

(declare-fun array_inv!20881 (array!55778) Bool)

(assert (=> start!79192 (array_inv!20881 _keys!1487)))

(declare-fun b!929700 () Bool)

(declare-fun e!522070 () Bool)

(assert (=> b!929700 (= e!522068 e!522070)))

(declare-fun res!626075 () Bool)

(assert (=> b!929700 (=> (not res!626075) (not e!522070))))

(declare-datatypes ((tuple2!13086 0))(
  ( (tuple2!13087 (_1!6554 (_ BitVec 64)) (_2!6554 V!31515)) )
))
(declare-datatypes ((List!18881 0))(
  ( (Nil!18878) (Cons!18877 (h!20023 tuple2!13086) (t!26938 List!18881)) )
))
(declare-datatypes ((ListLongMap!11783 0))(
  ( (ListLongMap!11784 (toList!5907 List!18881)) )
))
(declare-fun lt!419112 () ListLongMap!11783)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4959 (ListLongMap!11783 (_ BitVec 64)) Bool)

(assert (=> b!929700 (= res!626075 (contains!4959 lt!419112 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31515)

(declare-fun minValue!1173 () V!31515)

(declare-fun getCurrentListMap!3150 (array!55778 array!55780 (_ BitVec 32) (_ BitVec 32) V!31515 V!31515 (_ BitVec 32) Int) ListLongMap!11783)

(assert (=> b!929700 (= lt!419112 (getCurrentListMap!3150 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929701 () Bool)

(declare-fun res!626073 () Bool)

(assert (=> b!929701 (=> (not res!626073) (not e!522070))))

(assert (=> b!929701 (= res!626073 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!31626 () Bool)

(declare-fun tp!60655 () Bool)

(assert (=> mapNonEmpty!31626 (= mapRes!31626 (and tp!60655 e!522071))))

(declare-fun mapKey!31626 () (_ BitVec 32))

(declare-fun mapRest!31626 () (Array (_ BitVec 32) ValueCell!9475))

(declare-fun mapValue!31626 () ValueCell!9475)

(assert (=> mapNonEmpty!31626 (= (arr!26835 _values!1231) (store mapRest!31626 mapKey!31626 mapValue!31626))))

(declare-fun b!929702 () Bool)

(declare-fun res!626071 () Bool)

(assert (=> b!929702 (=> (not res!626071) (not e!522068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55778 (_ BitVec 32)) Bool)

(assert (=> b!929702 (= res!626071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929703 () Bool)

(assert (=> b!929703 (= e!522070 false)))

(declare-fun lt!419113 () Bool)

(assert (=> b!929703 (= lt!419113 (contains!4959 (getCurrentListMap!3150 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k!1099))))

(declare-fun b!929704 () Bool)

(declare-fun res!626070 () Bool)

(assert (=> b!929704 (=> (not res!626070) (not e!522068))))

(assert (=> b!929704 (= res!626070 (and (= (size!27294 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27293 _keys!1487) (size!27294 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929705 () Bool)

(declare-fun res!626077 () Bool)

(assert (=> b!929705 (=> (not res!626077) (not e!522068))))

(assert (=> b!929705 (= res!626077 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27293 _keys!1487))))))

(declare-fun b!929706 () Bool)

(declare-fun res!626072 () Bool)

(assert (=> b!929706 (=> (not res!626072) (not e!522070))))

(declare-fun v!791 () V!31515)

(declare-fun apply!731 (ListLongMap!11783 (_ BitVec 64)) V!31515)

(assert (=> b!929706 (= res!626072 (= (apply!731 lt!419112 k!1099) v!791))))

(declare-fun b!929707 () Bool)

(declare-fun e!522069 () Bool)

(assert (=> b!929707 (= e!522073 (and e!522069 mapRes!31626))))

(declare-fun condMapEmpty!31626 () Bool)

(declare-fun mapDefault!31626 () ValueCell!9475)

