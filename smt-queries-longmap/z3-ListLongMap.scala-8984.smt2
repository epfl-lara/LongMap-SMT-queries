; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108664 () Bool)

(assert start!108664)

(declare-fun b_free!28177 () Bool)

(declare-fun b_next!28177 () Bool)

(assert (=> start!108664 (= b_free!28177 (not b_next!28177))))

(declare-fun tp!99647 () Bool)

(declare-fun b_and!46225 () Bool)

(assert (=> start!108664 (= tp!99647 b_and!46225)))

(declare-fun b!1282597 () Bool)

(declare-fun res!851947 () Bool)

(declare-fun e!732860 () Bool)

(assert (=> b!1282597 (=> (not res!851947) (not e!732860))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50193 0))(
  ( (V!50194 (val!16983 Int)) )
))
(declare-datatypes ((ValueCell!16010 0))(
  ( (ValueCellFull!16010 (v!19584 V!50193)) (EmptyCell!16010) )
))
(declare-datatypes ((array!84597 0))(
  ( (array!84598 (arr!40801 (Array (_ BitVec 32) ValueCell!16010)) (size!41353 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84597)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84599 0))(
  ( (array!84600 (arr!40802 (Array (_ BitVec 32) (_ BitVec 64))) (size!41354 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84599)

(assert (=> b!1282597 (= res!851947 (and (= (size!41353 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41354 _keys!1741) (size!41353 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52283 () Bool)

(declare-fun mapRes!52283 () Bool)

(declare-fun tp!99648 () Bool)

(declare-fun e!732858 () Bool)

(assert (=> mapNonEmpty!52283 (= mapRes!52283 (and tp!99648 e!732858))))

(declare-fun mapValue!52283 () ValueCell!16010)

(declare-fun mapKey!52283 () (_ BitVec 32))

(declare-fun mapRest!52283 () (Array (_ BitVec 32) ValueCell!16010))

(assert (=> mapNonEmpty!52283 (= (arr!40801 _values!1445) (store mapRest!52283 mapKey!52283 mapValue!52283))))

(declare-fun b!1282598 () Bool)

(declare-fun e!732859 () Bool)

(declare-fun e!732857 () Bool)

(assert (=> b!1282598 (= e!732859 (and e!732857 mapRes!52283))))

(declare-fun condMapEmpty!52283 () Bool)

(declare-fun mapDefault!52283 () ValueCell!16010)

(assert (=> b!1282598 (= condMapEmpty!52283 (= (arr!40801 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16010)) mapDefault!52283)))))

(declare-fun b!1282599 () Bool)

(declare-fun res!851949 () Bool)

(assert (=> b!1282599 (=> (not res!851949) (not e!732860))))

(declare-datatypes ((List!28999 0))(
  ( (Nil!28996) (Cons!28995 (h!30204 (_ BitVec 64)) (t!42535 List!28999)) )
))
(declare-fun arrayNoDuplicates!0 (array!84599 (_ BitVec 32) List!28999) Bool)

(assert (=> b!1282599 (= res!851949 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28996))))

(declare-fun b!1282600 () Bool)

(declare-fun res!851946 () Bool)

(assert (=> b!1282600 (=> (not res!851946) (not e!732860))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1282600 (= res!851946 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41354 _keys!1741))))))

(declare-fun res!851948 () Bool)

(assert (=> start!108664 (=> (not res!851948) (not e!732860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108664 (= res!851948 (validMask!0 mask!2175))))

(assert (=> start!108664 e!732860))

(declare-fun tp_is_empty!33817 () Bool)

(assert (=> start!108664 tp_is_empty!33817))

(assert (=> start!108664 true))

(declare-fun array_inv!31109 (array!84597) Bool)

(assert (=> start!108664 (and (array_inv!31109 _values!1445) e!732859)))

(declare-fun array_inv!31110 (array!84599) Bool)

(assert (=> start!108664 (array_inv!31110 _keys!1741)))

(assert (=> start!108664 tp!99647))

(declare-fun mapIsEmpty!52283 () Bool)

(assert (=> mapIsEmpty!52283 mapRes!52283))

(declare-fun b!1282601 () Bool)

(declare-fun res!851945 () Bool)

(assert (=> b!1282601 (=> (not res!851945) (not e!732860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84599 (_ BitVec 32)) Bool)

(assert (=> b!1282601 (= res!851945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282602 () Bool)

(assert (=> b!1282602 (= e!732857 tp_is_empty!33817)))

(declare-fun b!1282603 () Bool)

(assert (=> b!1282603 (= e!732860 false)))

(declare-fun minValue!1387 () V!50193)

(declare-fun zeroValue!1387 () V!50193)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576384 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21812 0))(
  ( (tuple2!21813 (_1!10917 (_ BitVec 64)) (_2!10917 V!50193)) )
))
(declare-datatypes ((List!29000 0))(
  ( (Nil!28997) (Cons!28996 (h!30205 tuple2!21812) (t!42536 List!29000)) )
))
(declare-datatypes ((ListLongMap!19469 0))(
  ( (ListLongMap!19470 (toList!9750 List!29000)) )
))
(declare-fun contains!7797 (ListLongMap!19469 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4724 (array!84599 array!84597 (_ BitVec 32) (_ BitVec 32) V!50193 V!50193 (_ BitVec 32) Int) ListLongMap!19469)

(assert (=> b!1282603 (= lt!576384 (contains!7797 (getCurrentListMap!4724 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282604 () Bool)

(assert (=> b!1282604 (= e!732858 tp_is_empty!33817)))

(assert (= (and start!108664 res!851948) b!1282597))

(assert (= (and b!1282597 res!851947) b!1282601))

(assert (= (and b!1282601 res!851945) b!1282599))

(assert (= (and b!1282599 res!851949) b!1282600))

(assert (= (and b!1282600 res!851946) b!1282603))

(assert (= (and b!1282598 condMapEmpty!52283) mapIsEmpty!52283))

(assert (= (and b!1282598 (not condMapEmpty!52283)) mapNonEmpty!52283))

(get-info :version)

(assert (= (and mapNonEmpty!52283 ((_ is ValueCellFull!16010) mapValue!52283)) b!1282604))

(assert (= (and b!1282598 ((_ is ValueCellFull!16010) mapDefault!52283)) b!1282602))

(assert (= start!108664 b!1282598))

(declare-fun m!1176289 () Bool)

(assert (=> start!108664 m!1176289))

(declare-fun m!1176291 () Bool)

(assert (=> start!108664 m!1176291))

(declare-fun m!1176293 () Bool)

(assert (=> start!108664 m!1176293))

(declare-fun m!1176295 () Bool)

(assert (=> mapNonEmpty!52283 m!1176295))

(declare-fun m!1176297 () Bool)

(assert (=> b!1282601 m!1176297))

(declare-fun m!1176299 () Bool)

(assert (=> b!1282603 m!1176299))

(assert (=> b!1282603 m!1176299))

(declare-fun m!1176301 () Bool)

(assert (=> b!1282603 m!1176301))

(declare-fun m!1176303 () Bool)

(assert (=> b!1282599 m!1176303))

(check-sat tp_is_empty!33817 (not b!1282599) (not b!1282601) b_and!46225 (not b_next!28177) (not mapNonEmpty!52283) (not b!1282603) (not start!108664))
(check-sat b_and!46225 (not b_next!28177))
