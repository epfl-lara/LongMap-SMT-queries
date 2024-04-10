; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108874 () Bool)

(assert start!108874)

(declare-fun b_free!28387 () Bool)

(declare-fun b_next!28387 () Bool)

(assert (=> start!108874 (= b_free!28387 (not b_next!28387))))

(declare-fun tp!100276 () Bool)

(declare-fun b_and!46453 () Bool)

(assert (=> start!108874 (= tp!100276 b_and!46453)))

(declare-fun b!1285810 () Bool)

(declare-fun e!734461 () Bool)

(declare-fun tp_is_empty!34027 () Bool)

(assert (=> b!1285810 (= e!734461 tp_is_empty!34027)))

(declare-fun b!1285811 () Bool)

(declare-fun e!734464 () Bool)

(assert (=> b!1285811 (= e!734464 tp_is_empty!34027)))

(declare-fun b!1285812 () Bool)

(declare-fun e!734465 () Bool)

(assert (=> b!1285812 (= e!734465 false)))

(declare-datatypes ((V!50473 0))(
  ( (V!50474 (val!17088 Int)) )
))
(declare-fun minValue!1387 () V!50473)

(declare-fun zeroValue!1387 () V!50473)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576949 () Bool)

(declare-datatypes ((ValueCell!16115 0))(
  ( (ValueCellFull!16115 (v!19690 V!50473)) (EmptyCell!16115) )
))
(declare-datatypes ((array!85108 0))(
  ( (array!85109 (arr!41056 (Array (_ BitVec 32) ValueCell!16115)) (size!41606 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85108)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!85110 0))(
  ( (array!85111 (arr!41057 (Array (_ BitVec 32) (_ BitVec 64))) (size!41607 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85110)

(declare-datatypes ((tuple2!21908 0))(
  ( (tuple2!21909 (_1!10965 (_ BitVec 64)) (_2!10965 V!50473)) )
))
(declare-datatypes ((List!29095 0))(
  ( (Nil!29092) (Cons!29091 (h!30300 tuple2!21908) (t!42639 List!29095)) )
))
(declare-datatypes ((ListLongMap!19565 0))(
  ( (ListLongMap!19566 (toList!9798 List!29095)) )
))
(declare-fun contains!7915 (ListLongMap!19565 (_ BitVec 64)) Bool)

(declare-fun +!4307 (ListLongMap!19565 tuple2!21908) ListLongMap!19565)

(declare-fun getCurrentListMapNoExtraKeys!5937 (array!85110 array!85108 (_ BitVec 32) (_ BitVec 32) V!50473 V!50473 (_ BitVec 32) Int) ListLongMap!19565)

(assert (=> b!1285812 (= lt!576949 (contains!7915 (+!4307 (getCurrentListMapNoExtraKeys!5937 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21909 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun b!1285813 () Bool)

(declare-fun res!854177 () Bool)

(assert (=> b!1285813 (=> (not res!854177) (not e!734465))))

(assert (=> b!1285813 (= res!854177 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1285814 () Bool)

(declare-fun res!854178 () Bool)

(assert (=> b!1285814 (=> (not res!854178) (not e!734465))))

(assert (=> b!1285814 (= res!854178 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41607 _keys!1741))))))

(declare-fun mapIsEmpty!52598 () Bool)

(declare-fun mapRes!52598 () Bool)

(assert (=> mapIsEmpty!52598 mapRes!52598))

(declare-fun b!1285815 () Bool)

(declare-fun res!854182 () Bool)

(assert (=> b!1285815 (=> (not res!854182) (not e!734465))))

(assert (=> b!1285815 (= res!854182 (and (= (size!41606 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41607 _keys!1741) (size!41606 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285816 () Bool)

(declare-fun res!854183 () Bool)

(assert (=> b!1285816 (=> (not res!854183) (not e!734465))))

(assert (=> b!1285816 (= res!854183 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41607 _keys!1741))))))

(declare-fun b!1285817 () Bool)

(declare-fun res!854179 () Bool)

(assert (=> b!1285817 (=> (not res!854179) (not e!734465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285817 (= res!854179 (validKeyInArray!0 (select (arr!41057 _keys!1741) from!2144)))))

(declare-fun res!854181 () Bool)

(assert (=> start!108874 (=> (not res!854181) (not e!734465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108874 (= res!854181 (validMask!0 mask!2175))))

(assert (=> start!108874 e!734465))

(assert (=> start!108874 tp_is_empty!34027))

(assert (=> start!108874 true))

(declare-fun e!734462 () Bool)

(declare-fun array_inv!31133 (array!85108) Bool)

(assert (=> start!108874 (and (array_inv!31133 _values!1445) e!734462)))

(declare-fun array_inv!31134 (array!85110) Bool)

(assert (=> start!108874 (array_inv!31134 _keys!1741)))

(assert (=> start!108874 tp!100276))

(declare-fun b!1285818 () Bool)

(declare-fun res!854184 () Bool)

(assert (=> b!1285818 (=> (not res!854184) (not e!734465))))

(declare-fun getCurrentListMap!4876 (array!85110 array!85108 (_ BitVec 32) (_ BitVec 32) V!50473 V!50473 (_ BitVec 32) Int) ListLongMap!19565)

(assert (=> b!1285818 (= res!854184 (contains!7915 (getCurrentListMap!4876 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1285819 () Bool)

(declare-fun res!854180 () Bool)

(assert (=> b!1285819 (=> (not res!854180) (not e!734465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85110 (_ BitVec 32)) Bool)

(assert (=> b!1285819 (= res!854180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52598 () Bool)

(declare-fun tp!100277 () Bool)

(assert (=> mapNonEmpty!52598 (= mapRes!52598 (and tp!100277 e!734461))))

(declare-fun mapRest!52598 () (Array (_ BitVec 32) ValueCell!16115))

(declare-fun mapValue!52598 () ValueCell!16115)

(declare-fun mapKey!52598 () (_ BitVec 32))

(assert (=> mapNonEmpty!52598 (= (arr!41056 _values!1445) (store mapRest!52598 mapKey!52598 mapValue!52598))))

(declare-fun b!1285820 () Bool)

(assert (=> b!1285820 (= e!734462 (and e!734464 mapRes!52598))))

(declare-fun condMapEmpty!52598 () Bool)

(declare-fun mapDefault!52598 () ValueCell!16115)

