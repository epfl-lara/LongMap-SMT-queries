; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79356 () Bool)

(assert start!79356)

(declare-fun b_free!17543 () Bool)

(declare-fun b_next!17543 () Bool)

(assert (=> start!79356 (= b_free!17543 (not b_next!17543))))

(declare-fun tp!61073 () Bool)

(declare-fun b_and!28645 () Bool)

(assert (=> start!79356 (= tp!61073 b_and!28645)))

(declare-fun b!932117 () Bool)

(declare-fun e!523465 () Bool)

(assert (=> b!932117 (= e!523465 (not true))))

(declare-datatypes ((V!31699 0))(
  ( (V!31700 (val!10076 Int)) )
))
(declare-datatypes ((tuple2!13198 0))(
  ( (tuple2!13199 (_1!6610 (_ BitVec 64)) (_2!6610 V!31699)) )
))
(declare-datatypes ((List!18984 0))(
  ( (Nil!18981) (Cons!18980 (h!20126 tuple2!13198) (t!27071 List!18984)) )
))
(declare-datatypes ((ListLongMap!11895 0))(
  ( (ListLongMap!11896 (toList!5963 List!18984)) )
))
(declare-fun lt!419751 () ListLongMap!11895)

(declare-fun lt!419753 () tuple2!13198)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5012 (ListLongMap!11895 (_ BitVec 64)) Bool)

(declare-fun +!2770 (ListLongMap!11895 tuple2!13198) ListLongMap!11895)

(assert (=> b!932117 (contains!5012 (+!2770 lt!419751 lt!419753) k!1099)))

(declare-fun lt!419756 () (_ BitVec 64))

(declare-fun lt!419754 () V!31699)

(declare-datatypes ((Unit!31455 0))(
  ( (Unit!31456) )
))
(declare-fun lt!419752 () Unit!31455)

(declare-fun addStillContains!489 (ListLongMap!11895 (_ BitVec 64) V!31699 (_ BitVec 64)) Unit!31455)

(assert (=> b!932117 (= lt!419752 (addStillContains!489 lt!419751 lt!419756 lt!419754 k!1099))))

(declare-datatypes ((array!56042 0))(
  ( (array!56043 (arr!26965 (Array (_ BitVec 32) (_ BitVec 64))) (size!27424 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56042)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9544 0))(
  ( (ValueCellFull!9544 (v!12595 V!31699)) (EmptyCell!9544) )
))
(declare-datatypes ((array!56044 0))(
  ( (array!56045 (arr!26966 (Array (_ BitVec 32) ValueCell!9544)) (size!27425 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56044)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31699)

(declare-fun minValue!1173 () V!31699)

(declare-fun getCurrentListMap!3201 (array!56042 array!56044 (_ BitVec 32) (_ BitVec 32) V!31699 V!31699 (_ BitVec 32) Int) ListLongMap!11895)

(assert (=> b!932117 (= (getCurrentListMap!3201 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2770 (getCurrentListMap!3201 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419753))))

(assert (=> b!932117 (= lt!419753 (tuple2!13199 lt!419756 lt!419754))))

(declare-fun get!14176 (ValueCell!9544 V!31699) V!31699)

(declare-fun dynLambda!1559 (Int (_ BitVec 64)) V!31699)

(assert (=> b!932117 (= lt!419754 (get!14176 (select (arr!26966 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1559 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419755 () Unit!31455)

(declare-fun lemmaListMapRecursiveValidKeyArray!160 (array!56042 array!56044 (_ BitVec 32) (_ BitVec 32) V!31699 V!31699 (_ BitVec 32) Int) Unit!31455)

(assert (=> b!932117 (= lt!419755 (lemmaListMapRecursiveValidKeyArray!160 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932118 () Bool)

(declare-fun res!627751 () Bool)

(declare-fun e!523466 () Bool)

(assert (=> b!932118 (=> (not res!627751) (not e!523466))))

(assert (=> b!932118 (= res!627751 (and (= (size!27425 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27424 _keys!1487) (size!27425 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932119 () Bool)

(declare-fun res!627752 () Bool)

(declare-fun e!523467 () Bool)

(assert (=> b!932119 (=> (not res!627752) (not e!523467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932119 (= res!627752 (validKeyInArray!0 k!1099))))

(declare-fun b!932120 () Bool)

(declare-fun e!523469 () Bool)

(declare-fun tp_is_empty!20051 () Bool)

(assert (=> b!932120 (= e!523469 tp_is_empty!20051)))

(declare-fun b!932121 () Bool)

(assert (=> b!932121 (= e!523466 e!523467)))

(declare-fun res!627753 () Bool)

(assert (=> b!932121 (=> (not res!627753) (not e!523467))))

(assert (=> b!932121 (= res!627753 (contains!5012 lt!419751 k!1099))))

(assert (=> b!932121 (= lt!419751 (getCurrentListMap!3201 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932122 () Bool)

(declare-fun e!523468 () Bool)

(assert (=> b!932122 (= e!523468 tp_is_empty!20051)))

(declare-fun b!932123 () Bool)

(assert (=> b!932123 (= e!523467 e!523465)))

(declare-fun res!627745 () Bool)

(assert (=> b!932123 (=> (not res!627745) (not e!523465))))

(assert (=> b!932123 (= res!627745 (validKeyInArray!0 lt!419756))))

(assert (=> b!932123 (= lt!419756 (select (arr!26965 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932124 () Bool)

(declare-fun res!627754 () Bool)

(assert (=> b!932124 (=> (not res!627754) (not e!523466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56042 (_ BitVec 32)) Bool)

(assert (=> b!932124 (= res!627754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932125 () Bool)

(declare-fun res!627746 () Bool)

(assert (=> b!932125 (=> (not res!627746) (not e!523466))))

(declare-datatypes ((List!18985 0))(
  ( (Nil!18982) (Cons!18981 (h!20127 (_ BitVec 64)) (t!27072 List!18985)) )
))
(declare-fun arrayNoDuplicates!0 (array!56042 (_ BitVec 32) List!18985) Bool)

(assert (=> b!932125 (= res!627746 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18982))))

(declare-fun b!932126 () Bool)

(declare-fun res!627747 () Bool)

(assert (=> b!932126 (=> (not res!627747) (not e!523466))))

(assert (=> b!932126 (= res!627747 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27424 _keys!1487))))))

(declare-fun b!932127 () Bool)

(declare-fun res!627748 () Bool)

(assert (=> b!932127 (=> (not res!627748) (not e!523467))))

(declare-fun v!791 () V!31699)

(declare-fun apply!779 (ListLongMap!11895 (_ BitVec 64)) V!31699)

(assert (=> b!932127 (= res!627748 (= (apply!779 lt!419751 k!1099) v!791))))

(declare-fun res!627749 () Bool)

(assert (=> start!79356 (=> (not res!627749) (not e!523466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79356 (= res!627749 (validMask!0 mask!1881))))

(assert (=> start!79356 e!523466))

(assert (=> start!79356 true))

(assert (=> start!79356 tp_is_empty!20051))

(declare-fun e!523470 () Bool)

(declare-fun array_inv!20988 (array!56044) Bool)

(assert (=> start!79356 (and (array_inv!20988 _values!1231) e!523470)))

(assert (=> start!79356 tp!61073))

(declare-fun array_inv!20989 (array!56042) Bool)

(assert (=> start!79356 (array_inv!20989 _keys!1487)))

(declare-fun mapNonEmpty!31836 () Bool)

(declare-fun mapRes!31836 () Bool)

(declare-fun tp!61072 () Bool)

(assert (=> mapNonEmpty!31836 (= mapRes!31836 (and tp!61072 e!523469))))

(declare-fun mapValue!31836 () ValueCell!9544)

(declare-fun mapKey!31836 () (_ BitVec 32))

(declare-fun mapRest!31836 () (Array (_ BitVec 32) ValueCell!9544))

(assert (=> mapNonEmpty!31836 (= (arr!26966 _values!1231) (store mapRest!31836 mapKey!31836 mapValue!31836))))

(declare-fun b!932128 () Bool)

(assert (=> b!932128 (= e!523470 (and e!523468 mapRes!31836))))

(declare-fun condMapEmpty!31836 () Bool)

(declare-fun mapDefault!31836 () ValueCell!9544)

