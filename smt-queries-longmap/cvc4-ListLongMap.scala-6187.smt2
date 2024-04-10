; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79234 () Bool)

(assert start!79234)

(declare-fun b_free!17447 () Bool)

(declare-fun b_next!17447 () Bool)

(assert (=> start!79234 (= b_free!17447 (not b_next!17447))))

(declare-fun tp!60781 () Bool)

(declare-fun b_and!28513 () Bool)

(assert (=> start!79234 (= tp!60781 b_and!28513)))

(declare-fun b!930384 () Bool)

(declare-fun e!522446 () Bool)

(assert (=> b!930384 (= e!522446 false)))

(declare-datatypes ((V!31571 0))(
  ( (V!31572 (val!10028 Int)) )
))
(declare-fun lt!419230 () V!31571)

(declare-datatypes ((tuple2!13120 0))(
  ( (tuple2!13121 (_1!6571 (_ BitVec 64)) (_2!6571 V!31571)) )
))
(declare-datatypes ((List!18912 0))(
  ( (Nil!18909) (Cons!18908 (h!20054 tuple2!13120) (t!26969 List!18912)) )
))
(declare-datatypes ((ListLongMap!11817 0))(
  ( (ListLongMap!11818 (toList!5924 List!18912)) )
))
(declare-fun lt!419229 () ListLongMap!11817)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!746 (ListLongMap!11817 (_ BitVec 64)) V!31571)

(assert (=> b!930384 (= lt!419230 (apply!746 lt!419229 k!1099))))

(declare-fun b!930385 () Bool)

(declare-fun res!626568 () Bool)

(declare-fun e!522449 () Bool)

(assert (=> b!930385 (=> (not res!626568) (not e!522449))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55856 0))(
  ( (array!55857 (arr!26873 (Array (_ BitVec 32) (_ BitVec 64))) (size!27332 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55856)

(assert (=> b!930385 (= res!626568 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27332 _keys!1487))))))

(declare-fun res!626572 () Bool)

(assert (=> start!79234 (=> (not res!626572) (not e!522449))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79234 (= res!626572 (validMask!0 mask!1881))))

(assert (=> start!79234 e!522449))

(assert (=> start!79234 true))

(declare-datatypes ((ValueCell!9496 0))(
  ( (ValueCellFull!9496 (v!12546 V!31571)) (EmptyCell!9496) )
))
(declare-datatypes ((array!55858 0))(
  ( (array!55859 (arr!26874 (Array (_ BitVec 32) ValueCell!9496)) (size!27333 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55858)

(declare-fun e!522451 () Bool)

(declare-fun array_inv!20914 (array!55858) Bool)

(assert (=> start!79234 (and (array_inv!20914 _values!1231) e!522451)))

(assert (=> start!79234 tp!60781))

(declare-fun array_inv!20915 (array!55856) Bool)

(assert (=> start!79234 (array_inv!20915 _keys!1487)))

(declare-fun tp_is_empty!19955 () Bool)

(assert (=> start!79234 tp_is_empty!19955))

(declare-fun b!930386 () Bool)

(declare-fun e!522447 () Bool)

(assert (=> b!930386 (= e!522447 tp_is_empty!19955)))

(declare-fun b!930387 () Bool)

(declare-fun res!626570 () Bool)

(assert (=> b!930387 (=> (not res!626570) (not e!522449))))

(declare-datatypes ((List!18913 0))(
  ( (Nil!18910) (Cons!18909 (h!20055 (_ BitVec 64)) (t!26970 List!18913)) )
))
(declare-fun arrayNoDuplicates!0 (array!55856 (_ BitVec 32) List!18913) Bool)

(assert (=> b!930387 (= res!626570 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18910))))

(declare-fun b!930388 () Bool)

(declare-fun res!626569 () Bool)

(assert (=> b!930388 (=> (not res!626569) (not e!522449))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!930388 (= res!626569 (and (= (size!27333 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27332 _keys!1487) (size!27333 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930389 () Bool)

(declare-fun e!522448 () Bool)

(assert (=> b!930389 (= e!522448 tp_is_empty!19955)))

(declare-fun b!930390 () Bool)

(assert (=> b!930390 (= e!522449 e!522446)))

(declare-fun res!626571 () Bool)

(assert (=> b!930390 (=> (not res!626571) (not e!522446))))

(declare-fun contains!4975 (ListLongMap!11817 (_ BitVec 64)) Bool)

(assert (=> b!930390 (= res!626571 (contains!4975 lt!419229 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31571)

(declare-fun minValue!1173 () V!31571)

(declare-fun getCurrentListMap!3166 (array!55856 array!55858 (_ BitVec 32) (_ BitVec 32) V!31571 V!31571 (_ BitVec 32) Int) ListLongMap!11817)

(assert (=> b!930390 (= lt!419229 (getCurrentListMap!3166 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31689 () Bool)

(declare-fun mapRes!31689 () Bool)

(declare-fun tp!60782 () Bool)

(assert (=> mapNonEmpty!31689 (= mapRes!31689 (and tp!60782 e!522448))))

(declare-fun mapKey!31689 () (_ BitVec 32))

(declare-fun mapRest!31689 () (Array (_ BitVec 32) ValueCell!9496))

(declare-fun mapValue!31689 () ValueCell!9496)

(assert (=> mapNonEmpty!31689 (= (arr!26874 _values!1231) (store mapRest!31689 mapKey!31689 mapValue!31689))))

(declare-fun mapIsEmpty!31689 () Bool)

(assert (=> mapIsEmpty!31689 mapRes!31689))

(declare-fun b!930391 () Bool)

(assert (=> b!930391 (= e!522451 (and e!522447 mapRes!31689))))

(declare-fun condMapEmpty!31689 () Bool)

(declare-fun mapDefault!31689 () ValueCell!9496)

