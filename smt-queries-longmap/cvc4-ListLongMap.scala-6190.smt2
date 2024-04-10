; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79252 () Bool)

(assert start!79252)

(declare-fun b_free!17465 () Bool)

(declare-fun b_next!17465 () Bool)

(assert (=> start!79252 (= b_free!17465 (not b_next!17465))))

(declare-fun tp!60835 () Bool)

(declare-fun b_and!28531 () Bool)

(assert (=> start!79252 (= tp!60835 b_and!28531)))

(declare-fun mapNonEmpty!31716 () Bool)

(declare-fun mapRes!31716 () Bool)

(declare-fun tp!60836 () Bool)

(declare-fun e!522612 () Bool)

(assert (=> mapNonEmpty!31716 (= mapRes!31716 (and tp!60836 e!522612))))

(declare-datatypes ((V!31595 0))(
  ( (V!31596 (val!10037 Int)) )
))
(declare-datatypes ((ValueCell!9505 0))(
  ( (ValueCellFull!9505 (v!12555 V!31595)) (EmptyCell!9505) )
))
(declare-fun mapRest!31716 () (Array (_ BitVec 32) ValueCell!9505))

(declare-fun mapKey!31716 () (_ BitVec 32))

(declare-fun mapValue!31716 () ValueCell!9505)

(declare-datatypes ((array!55890 0))(
  ( (array!55891 (arr!26890 (Array (_ BitVec 32) ValueCell!9505)) (size!27349 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55890)

(assert (=> mapNonEmpty!31716 (= (arr!26890 _values!1231) (store mapRest!31716 mapKey!31716 mapValue!31716))))

(declare-fun res!626757 () Bool)

(declare-fun e!522611 () Bool)

(assert (=> start!79252 (=> (not res!626757) (not e!522611))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79252 (= res!626757 (validMask!0 mask!1881))))

(assert (=> start!79252 e!522611))

(assert (=> start!79252 true))

(declare-fun e!522613 () Bool)

(declare-fun array_inv!20928 (array!55890) Bool)

(assert (=> start!79252 (and (array_inv!20928 _values!1231) e!522613)))

(assert (=> start!79252 tp!60835))

(declare-datatypes ((array!55892 0))(
  ( (array!55893 (arr!26891 (Array (_ BitVec 32) (_ BitVec 64))) (size!27350 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55892)

(declare-fun array_inv!20929 (array!55892) Bool)

(assert (=> start!79252 (array_inv!20929 _keys!1487)))

(declare-fun tp_is_empty!19973 () Bool)

(assert (=> start!79252 tp_is_empty!19973))

(declare-fun b!930654 () Bool)

(declare-fun e!522608 () Bool)

(assert (=> b!930654 (= e!522608 tp_is_empty!19973)))

(declare-fun b!930655 () Bool)

(declare-fun e!522609 () Bool)

(assert (=> b!930655 (= e!522611 e!522609)))

(declare-fun res!626758 () Bool)

(assert (=> b!930655 (=> (not res!626758) (not e!522609))))

(declare-datatypes ((tuple2!13136 0))(
  ( (tuple2!13137 (_1!6579 (_ BitVec 64)) (_2!6579 V!31595)) )
))
(declare-datatypes ((List!18927 0))(
  ( (Nil!18924) (Cons!18923 (h!20069 tuple2!13136) (t!26984 List!18927)) )
))
(declare-datatypes ((ListLongMap!11833 0))(
  ( (ListLongMap!11834 (toList!5932 List!18927)) )
))
(declare-fun lt!419274 () ListLongMap!11833)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4982 (ListLongMap!11833 (_ BitVec 64)) Bool)

(assert (=> b!930655 (= res!626758 (contains!4982 lt!419274 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31595)

(declare-fun minValue!1173 () V!31595)

(declare-fun getCurrentListMap!3173 (array!55892 array!55890 (_ BitVec 32) (_ BitVec 32) V!31595 V!31595 (_ BitVec 32) Int) ListLongMap!11833)

(assert (=> b!930655 (= lt!419274 (getCurrentListMap!3173 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930656 () Bool)

(assert (=> b!930656 (= e!522609 false)))

(declare-fun lt!419275 () V!31595)

(declare-fun apply!754 (ListLongMap!11833 (_ BitVec 64)) V!31595)

(assert (=> b!930656 (= lt!419275 (apply!754 lt!419274 k!1099))))

(declare-fun mapIsEmpty!31716 () Bool)

(assert (=> mapIsEmpty!31716 mapRes!31716))

(declare-fun b!930657 () Bool)

(assert (=> b!930657 (= e!522613 (and e!522608 mapRes!31716))))

(declare-fun condMapEmpty!31716 () Bool)

(declare-fun mapDefault!31716 () ValueCell!9505)

