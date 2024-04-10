; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79496 () Bool)

(assert start!79496)

(declare-fun b_free!17651 () Bool)

(declare-fun b_next!17651 () Bool)

(assert (=> start!79496 (= b_free!17651 (not b_next!17651))))

(declare-fun tp!61399 () Bool)

(declare-fun b_and!28869 () Bool)

(assert (=> start!79496 (= tp!61399 b_and!28869)))

(declare-fun b!934606 () Bool)

(declare-fun res!629452 () Bool)

(declare-fun e!524766 () Bool)

(assert (=> b!934606 (=> (not res!629452) (not e!524766))))

(declare-datatypes ((array!56256 0))(
  ( (array!56257 (arr!27071 (Array (_ BitVec 32) (_ BitVec 64))) (size!27530 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56256)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56256 (_ BitVec 32)) Bool)

(assert (=> b!934606 (= res!629452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!934607 () Bool)

(declare-fun res!629455 () Bool)

(declare-fun e!524772 () Bool)

(assert (=> b!934607 (=> (not res!629455) (not e!524772))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!934607 (= res!629455 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934608 () Bool)

(declare-fun e!524769 () Bool)

(assert (=> b!934608 (= e!524772 e!524769)))

(declare-fun res!629449 () Bool)

(assert (=> b!934608 (=> (not res!629449) (not e!524769))))

(declare-fun lt!421064 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934608 (= res!629449 (validKeyInArray!0 lt!421064))))

(assert (=> b!934608 (= lt!421064 (select (arr!27071 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934609 () Bool)

(declare-fun res!629454 () Bool)

(assert (=> b!934609 (=> (not res!629454) (not e!524766))))

(declare-datatypes ((List!19070 0))(
  ( (Nil!19067) (Cons!19066 (h!20212 (_ BitVec 64)) (t!27265 List!19070)) )
))
(declare-fun arrayNoDuplicates!0 (array!56256 (_ BitVec 32) List!19070) Bool)

(assert (=> b!934609 (= res!629454 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19067))))

(declare-fun b!934610 () Bool)

(declare-fun res!629453 () Bool)

(assert (=> b!934610 (=> (not res!629453) (not e!524772))))

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!934610 (= res!629453 (validKeyInArray!0 k!1099))))

(declare-fun res!629458 () Bool)

(assert (=> start!79496 (=> (not res!629458) (not e!524766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79496 (= res!629458 (validMask!0 mask!1881))))

(assert (=> start!79496 e!524766))

(assert (=> start!79496 true))

(declare-fun tp_is_empty!20159 () Bool)

(assert (=> start!79496 tp_is_empty!20159))

(declare-datatypes ((V!31843 0))(
  ( (V!31844 (val!10130 Int)) )
))
(declare-datatypes ((ValueCell!9598 0))(
  ( (ValueCellFull!9598 (v!12650 V!31843)) (EmptyCell!9598) )
))
(declare-datatypes ((array!56258 0))(
  ( (array!56259 (arr!27072 (Array (_ BitVec 32) ValueCell!9598)) (size!27531 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56258)

(declare-fun e!524767 () Bool)

(declare-fun array_inv!21068 (array!56258) Bool)

(assert (=> start!79496 (and (array_inv!21068 _values!1231) e!524767)))

(assert (=> start!79496 tp!61399))

(declare-fun array_inv!21069 (array!56256) Bool)

(assert (=> start!79496 (array_inv!21069 _keys!1487)))

(declare-fun b!934611 () Bool)

(assert (=> b!934611 (= e!524766 e!524772)))

(declare-fun res!629457 () Bool)

(assert (=> b!934611 (=> (not res!629457) (not e!524772))))

(declare-datatypes ((tuple2!13290 0))(
  ( (tuple2!13291 (_1!6656 (_ BitVec 64)) (_2!6656 V!31843)) )
))
(declare-datatypes ((List!19071 0))(
  ( (Nil!19068) (Cons!19067 (h!20213 tuple2!13290) (t!27266 List!19071)) )
))
(declare-datatypes ((ListLongMap!11987 0))(
  ( (ListLongMap!11988 (toList!6009 List!19071)) )
))
(declare-fun lt!421068 () ListLongMap!11987)

(declare-fun contains!5059 (ListLongMap!11987 (_ BitVec 64)) Bool)

(assert (=> b!934611 (= res!629457 (contains!5059 lt!421068 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31843)

(declare-fun minValue!1173 () V!31843)

(declare-fun getCurrentListMap!3246 (array!56256 array!56258 (_ BitVec 32) (_ BitVec 32) V!31843 V!31843 (_ BitVec 32) Int) ListLongMap!11987)

(assert (=> b!934611 (= lt!421068 (getCurrentListMap!3246 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934612 () Bool)

(declare-fun e!524765 () Bool)

(assert (=> b!934612 (= e!524765 tp_is_empty!20159)))

(declare-fun mapIsEmpty!32001 () Bool)

(declare-fun mapRes!32001 () Bool)

(assert (=> mapIsEmpty!32001 mapRes!32001))

(declare-fun b!934613 () Bool)

(declare-fun e!524770 () Bool)

(declare-fun arrayContainsKey!0 (array!56256 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!934613 (= e!524770 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!934614 () Bool)

(declare-fun res!629451 () Bool)

(assert (=> b!934614 (=> (not res!629451) (not e!524772))))

(declare-fun v!791 () V!31843)

(declare-fun apply!813 (ListLongMap!11987 (_ BitVec 64)) V!31843)

(assert (=> b!934614 (= res!629451 (= (apply!813 lt!421068 k!1099) v!791))))

(declare-fun b!934615 () Bool)

(declare-fun e!524768 () Bool)

(assert (=> b!934615 (= e!524768 tp_is_empty!20159)))

(declare-fun b!934616 () Bool)

(assert (=> b!934616 (= e!524767 (and e!524768 mapRes!32001))))

(declare-fun condMapEmpty!32001 () Bool)

(declare-fun mapDefault!32001 () ValueCell!9598)

