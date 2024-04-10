; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79158 () Bool)

(assert start!79158)

(declare-fun b_free!17371 () Bool)

(declare-fun b_next!17371 () Bool)

(assert (=> start!79158 (= b_free!17371 (not b_next!17371))))

(declare-fun tp!60553 () Bool)

(declare-fun b_and!28437 () Bool)

(assert (=> start!79158 (= tp!60553 b_and!28437)))

(declare-fun b!929160 () Bool)

(declare-fun res!625687 () Bool)

(declare-fun e!521766 () Bool)

(assert (=> b!929160 (=> (not res!625687) (not e!521766))))

(declare-datatypes ((array!55712 0))(
  ( (array!55713 (arr!26801 (Array (_ BitVec 32) (_ BitVec 64))) (size!27260 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55712)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31471 0))(
  ( (V!31472 (val!9990 Int)) )
))
(declare-datatypes ((ValueCell!9458 0))(
  ( (ValueCellFull!9458 (v!12508 V!31471)) (EmptyCell!9458) )
))
(declare-datatypes ((array!55714 0))(
  ( (array!55715 (arr!26802 (Array (_ BitVec 32) ValueCell!9458)) (size!27261 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55714)

(assert (=> b!929160 (= res!625687 (and (= (size!27261 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27260 _keys!1487) (size!27261 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929161 () Bool)

(declare-fun e!521764 () Bool)

(declare-fun tp_is_empty!19879 () Bool)

(assert (=> b!929161 (= e!521764 tp_is_empty!19879)))

(declare-fun mapIsEmpty!31575 () Bool)

(declare-fun mapRes!31575 () Bool)

(assert (=> mapIsEmpty!31575 mapRes!31575))

(declare-fun b!929163 () Bool)

(declare-fun e!521763 () Bool)

(assert (=> b!929163 (= e!521766 e!521763)))

(declare-fun res!625688 () Bool)

(assert (=> b!929163 (=> (not res!625688) (not e!521763))))

(declare-datatypes ((tuple2!13060 0))(
  ( (tuple2!13061 (_1!6541 (_ BitVec 64)) (_2!6541 V!31471)) )
))
(declare-datatypes ((List!18854 0))(
  ( (Nil!18851) (Cons!18850 (h!19996 tuple2!13060) (t!26911 List!18854)) )
))
(declare-datatypes ((ListLongMap!11757 0))(
  ( (ListLongMap!11758 (toList!5894 List!18854)) )
))
(declare-fun lt!419019 () ListLongMap!11757)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4948 (ListLongMap!11757 (_ BitVec 64)) Bool)

(assert (=> b!929163 (= res!625688 (contains!4948 lt!419019 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31471)

(declare-fun minValue!1173 () V!31471)

(declare-fun getCurrentListMap!3139 (array!55712 array!55714 (_ BitVec 32) (_ BitVec 32) V!31471 V!31471 (_ BitVec 32) Int) ListLongMap!11757)

(assert (=> b!929163 (= lt!419019 (getCurrentListMap!3139 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31575 () Bool)

(declare-fun tp!60554 () Bool)

(assert (=> mapNonEmpty!31575 (= mapRes!31575 (and tp!60554 e!521764))))

(declare-fun mapKey!31575 () (_ BitVec 32))

(declare-fun mapRest!31575 () (Array (_ BitVec 32) ValueCell!9458))

(declare-fun mapValue!31575 () ValueCell!9458)

(assert (=> mapNonEmpty!31575 (= (arr!26802 _values!1231) (store mapRest!31575 mapKey!31575 mapValue!31575))))

(declare-fun b!929164 () Bool)

(declare-fun res!625689 () Bool)

(assert (=> b!929164 (=> (not res!625689) (not e!521766))))

(assert (=> b!929164 (= res!625689 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27260 _keys!1487))))))

(declare-fun b!929165 () Bool)

(declare-fun e!521765 () Bool)

(declare-fun e!521767 () Bool)

(assert (=> b!929165 (= e!521765 (and e!521767 mapRes!31575))))

(declare-fun condMapEmpty!31575 () Bool)

(declare-fun mapDefault!31575 () ValueCell!9458)

