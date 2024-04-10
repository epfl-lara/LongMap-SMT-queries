; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108830 () Bool)

(assert start!108830)

(declare-fun b_free!28343 () Bool)

(declare-fun b_next!28343 () Bool)

(assert (=> start!108830 (= b_free!28343 (not b_next!28343))))

(declare-fun tp!100144 () Bool)

(declare-fun b_and!46409 () Bool)

(assert (=> start!108830 (= tp!100144 b_and!46409)))

(declare-fun res!853813 () Bool)

(declare-fun e!734133 () Bool)

(assert (=> start!108830 (=> (not res!853813) (not e!734133))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108830 (= res!853813 (validMask!0 mask!2175))))

(assert (=> start!108830 e!734133))

(declare-fun tp_is_empty!33983 () Bool)

(assert (=> start!108830 tp_is_empty!33983))

(assert (=> start!108830 true))

(declare-datatypes ((V!50413 0))(
  ( (V!50414 (val!17066 Int)) )
))
(declare-datatypes ((ValueCell!16093 0))(
  ( (ValueCellFull!16093 (v!19668 V!50413)) (EmptyCell!16093) )
))
(declare-datatypes ((array!85024 0))(
  ( (array!85025 (arr!41014 (Array (_ BitVec 32) ValueCell!16093)) (size!41564 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85024)

(declare-fun e!734135 () Bool)

(declare-fun array_inv!31109 (array!85024) Bool)

(assert (=> start!108830 (and (array_inv!31109 _values!1445) e!734135)))

(declare-datatypes ((array!85026 0))(
  ( (array!85027 (arr!41015 (Array (_ BitVec 32) (_ BitVec 64))) (size!41565 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85026)

(declare-fun array_inv!31110 (array!85026) Bool)

(assert (=> start!108830 (array_inv!31110 _keys!1741)))

(assert (=> start!108830 tp!100144))

(declare-fun b!1285247 () Bool)

(assert (=> b!1285247 (= e!734133 false)))

(declare-fun minValue!1387 () V!50413)

(declare-fun zeroValue!1387 () V!50413)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576892 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21874 0))(
  ( (tuple2!21875 (_1!10948 (_ BitVec 64)) (_2!10948 V!50413)) )
))
(declare-datatypes ((List!29066 0))(
  ( (Nil!29063) (Cons!29062 (h!30271 tuple2!21874) (t!42610 List!29066)) )
))
(declare-datatypes ((ListLongMap!19531 0))(
  ( (ListLongMap!19532 (toList!9781 List!29066)) )
))
(declare-fun contains!7898 (ListLongMap!19531 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4859 (array!85026 array!85024 (_ BitVec 32) (_ BitVec 32) V!50413 V!50413 (_ BitVec 32) Int) ListLongMap!19531)

(assert (=> b!1285247 (= lt!576892 (contains!7898 (getCurrentListMap!4859 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1285248 () Bool)

(declare-fun e!734131 () Bool)

(assert (=> b!1285248 (= e!734131 tp_is_empty!33983)))

(declare-fun b!1285249 () Bool)

(declare-fun res!853815 () Bool)

(assert (=> b!1285249 (=> (not res!853815) (not e!734133))))

(assert (=> b!1285249 (= res!853815 (and (= (size!41564 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41565 _keys!1741) (size!41564 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285250 () Bool)

(declare-fun res!853812 () Bool)

(assert (=> b!1285250 (=> (not res!853812) (not e!734133))))

(declare-datatypes ((List!29067 0))(
  ( (Nil!29064) (Cons!29063 (h!30272 (_ BitVec 64)) (t!42611 List!29067)) )
))
(declare-fun arrayNoDuplicates!0 (array!85026 (_ BitVec 32) List!29067) Bool)

(assert (=> b!1285250 (= res!853812 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29064))))

(declare-fun b!1285251 () Bool)

(declare-fun res!853811 () Bool)

(assert (=> b!1285251 (=> (not res!853811) (not e!734133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85026 (_ BitVec 32)) Bool)

(assert (=> b!1285251 (= res!853811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52532 () Bool)

(declare-fun mapRes!52532 () Bool)

(declare-fun tp!100145 () Bool)

(declare-fun e!734134 () Bool)

(assert (=> mapNonEmpty!52532 (= mapRes!52532 (and tp!100145 e!734134))))

(declare-fun mapKey!52532 () (_ BitVec 32))

(declare-fun mapValue!52532 () ValueCell!16093)

(declare-fun mapRest!52532 () (Array (_ BitVec 32) ValueCell!16093))

(assert (=> mapNonEmpty!52532 (= (arr!41014 _values!1445) (store mapRest!52532 mapKey!52532 mapValue!52532))))

(declare-fun b!1285252 () Bool)

(assert (=> b!1285252 (= e!734135 (and e!734131 mapRes!52532))))

(declare-fun condMapEmpty!52532 () Bool)

(declare-fun mapDefault!52532 () ValueCell!16093)

