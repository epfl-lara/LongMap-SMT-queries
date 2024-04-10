; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79194 () Bool)

(assert start!79194)

(declare-fun b_free!17407 () Bool)

(declare-fun b_next!17407 () Bool)

(assert (=> start!79194 (= b_free!17407 (not b_next!17407))))

(declare-fun tp!60662 () Bool)

(declare-fun b_and!28473 () Bool)

(assert (=> start!79194 (= tp!60662 b_and!28473)))

(declare-fun b!929731 () Bool)

(declare-fun res!626094 () Bool)

(declare-fun e!522086 () Bool)

(assert (=> b!929731 (=> (not res!626094) (not e!522086))))

(declare-datatypes ((array!55782 0))(
  ( (array!55783 (arr!26836 (Array (_ BitVec 32) (_ BitVec 64))) (size!27295 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55782)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55782 (_ BitVec 32)) Bool)

(assert (=> b!929731 (= res!626094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929732 () Bool)

(declare-fun e!522089 () Bool)

(declare-fun tp_is_empty!19915 () Bool)

(assert (=> b!929732 (= e!522089 tp_is_empty!19915)))

(declare-fun b!929733 () Bool)

(declare-fun res!626095 () Bool)

(assert (=> b!929733 (=> (not res!626095) (not e!522086))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31519 0))(
  ( (V!31520 (val!10008 Int)) )
))
(declare-datatypes ((ValueCell!9476 0))(
  ( (ValueCellFull!9476 (v!12526 V!31519)) (EmptyCell!9476) )
))
(declare-datatypes ((array!55784 0))(
  ( (array!55785 (arr!26837 (Array (_ BitVec 32) ValueCell!9476)) (size!27296 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55784)

(assert (=> b!929733 (= res!626095 (and (= (size!27296 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27295 _keys!1487) (size!27296 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929734 () Bool)

(declare-fun e!522090 () Bool)

(assert (=> b!929734 (= e!522086 e!522090)))

(declare-fun res!626098 () Bool)

(assert (=> b!929734 (=> (not res!626098) (not e!522090))))

(declare-datatypes ((tuple2!13088 0))(
  ( (tuple2!13089 (_1!6555 (_ BitVec 64)) (_2!6555 V!31519)) )
))
(declare-datatypes ((List!18882 0))(
  ( (Nil!18879) (Cons!18878 (h!20024 tuple2!13088) (t!26939 List!18882)) )
))
(declare-datatypes ((ListLongMap!11785 0))(
  ( (ListLongMap!11786 (toList!5908 List!18882)) )
))
(declare-fun lt!419118 () ListLongMap!11785)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4960 (ListLongMap!11785 (_ BitVec 64)) Bool)

(assert (=> b!929734 (= res!626098 (contains!4960 lt!419118 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31519)

(declare-fun minValue!1173 () V!31519)

(declare-fun getCurrentListMap!3151 (array!55782 array!55784 (_ BitVec 32) (_ BitVec 32) V!31519 V!31519 (_ BitVec 32) Int) ListLongMap!11785)

(assert (=> b!929734 (= lt!419118 (getCurrentListMap!3151 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!626096 () Bool)

(assert (=> start!79194 (=> (not res!626096) (not e!522086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79194 (= res!626096 (validMask!0 mask!1881))))

(assert (=> start!79194 e!522086))

(assert (=> start!79194 true))

(assert (=> start!79194 tp_is_empty!19915))

(declare-fun e!522088 () Bool)

(declare-fun array_inv!20882 (array!55784) Bool)

(assert (=> start!79194 (and (array_inv!20882 _values!1231) e!522088)))

(assert (=> start!79194 tp!60662))

(declare-fun array_inv!20883 (array!55782) Bool)

(assert (=> start!79194 (array_inv!20883 _keys!1487)))

(declare-fun b!929735 () Bool)

(assert (=> b!929735 (= e!522090 false)))

(declare-fun lt!419119 () Bool)

(assert (=> b!929735 (= lt!419119 (contains!4960 (getCurrentListMap!3151 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k!1099))))

(declare-fun b!929736 () Bool)

(declare-fun res!626101 () Bool)

(assert (=> b!929736 (=> (not res!626101) (not e!522086))))

(assert (=> b!929736 (= res!626101 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27295 _keys!1487))))))

(declare-fun mapNonEmpty!31629 () Bool)

(declare-fun mapRes!31629 () Bool)

(declare-fun tp!60661 () Bool)

(declare-fun e!522091 () Bool)

(assert (=> mapNonEmpty!31629 (= mapRes!31629 (and tp!60661 e!522091))))

(declare-fun mapKey!31629 () (_ BitVec 32))

(declare-fun mapValue!31629 () ValueCell!9476)

(declare-fun mapRest!31629 () (Array (_ BitVec 32) ValueCell!9476))

(assert (=> mapNonEmpty!31629 (= (arr!26837 _values!1231) (store mapRest!31629 mapKey!31629 mapValue!31629))))

(declare-fun b!929737 () Bool)

(declare-fun res!626097 () Bool)

(assert (=> b!929737 (=> (not res!626097) (not e!522090))))

(declare-fun v!791 () V!31519)

(declare-fun apply!732 (ListLongMap!11785 (_ BitVec 64)) V!31519)

(assert (=> b!929737 (= res!626097 (= (apply!732 lt!419118 k!1099) v!791))))

(declare-fun b!929738 () Bool)

(assert (=> b!929738 (= e!522091 tp_is_empty!19915)))

(declare-fun mapIsEmpty!31629 () Bool)

(assert (=> mapIsEmpty!31629 mapRes!31629))

(declare-fun b!929739 () Bool)

(assert (=> b!929739 (= e!522088 (and e!522089 mapRes!31629))))

(declare-fun condMapEmpty!31629 () Bool)

(declare-fun mapDefault!31629 () ValueCell!9476)

