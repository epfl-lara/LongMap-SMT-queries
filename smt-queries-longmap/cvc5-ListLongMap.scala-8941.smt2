; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108372 () Bool)

(assert start!108372)

(declare-fun b_free!27919 () Bool)

(declare-fun b_next!27919 () Bool)

(assert (=> start!108372 (= b_free!27919 (not b_next!27919))))

(declare-fun tp!98867 () Bool)

(declare-fun b_and!45979 () Bool)

(assert (=> start!108372 (= tp!98867 b_and!45979)))

(declare-fun b!1279032 () Bool)

(declare-fun e!730760 () Bool)

(declare-fun tp_is_empty!33559 () Bool)

(assert (=> b!1279032 (= e!730760 tp_is_empty!33559)))

(declare-fun b!1279033 () Bool)

(declare-fun res!849655 () Bool)

(declare-fun e!730758 () Bool)

(assert (=> b!1279033 (=> (not res!849655) (not e!730758))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49849 0))(
  ( (V!49850 (val!16854 Int)) )
))
(declare-datatypes ((ValueCell!15881 0))(
  ( (ValueCellFull!15881 (v!19454 V!49849)) (EmptyCell!15881) )
))
(declare-datatypes ((array!84206 0))(
  ( (array!84207 (arr!40607 (Array (_ BitVec 32) ValueCell!15881)) (size!41157 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84206)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84208 0))(
  ( (array!84209 (arr!40608 (Array (_ BitVec 32) (_ BitVec 64))) (size!41158 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84208)

(assert (=> b!1279033 (= res!849655 (and (= (size!41157 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41158 _keys!1741) (size!41157 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279034 () Bool)

(declare-fun e!730757 () Bool)

(assert (=> b!1279034 (= e!730757 tp_is_empty!33559)))

(declare-fun mapNonEmpty!51890 () Bool)

(declare-fun mapRes!51890 () Bool)

(declare-fun tp!98866 () Bool)

(assert (=> mapNonEmpty!51890 (= mapRes!51890 (and tp!98866 e!730757))))

(declare-fun mapKey!51890 () (_ BitVec 32))

(declare-fun mapRest!51890 () (Array (_ BitVec 32) ValueCell!15881))

(declare-fun mapValue!51890 () ValueCell!15881)

(assert (=> mapNonEmpty!51890 (= (arr!40607 _values!1445) (store mapRest!51890 mapKey!51890 mapValue!51890))))

(declare-fun b!1279035 () Bool)

(declare-fun res!849654 () Bool)

(assert (=> b!1279035 (=> (not res!849654) (not e!730758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84208 (_ BitVec 32)) Bool)

(assert (=> b!1279035 (= res!849654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279036 () Bool)

(declare-fun res!849652 () Bool)

(assert (=> b!1279036 (=> (not res!849652) (not e!730758))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1279036 (= res!849652 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41158 _keys!1741))))))

(declare-fun mapIsEmpty!51890 () Bool)

(assert (=> mapIsEmpty!51890 mapRes!51890))

(declare-fun res!849656 () Bool)

(assert (=> start!108372 (=> (not res!849656) (not e!730758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108372 (= res!849656 (validMask!0 mask!2175))))

(assert (=> start!108372 e!730758))

(assert (=> start!108372 tp_is_empty!33559))

(assert (=> start!108372 true))

(declare-fun e!730756 () Bool)

(declare-fun array_inv!30833 (array!84206) Bool)

(assert (=> start!108372 (and (array_inv!30833 _values!1445) e!730756)))

(declare-fun array_inv!30834 (array!84208) Bool)

(assert (=> start!108372 (array_inv!30834 _keys!1741)))

(assert (=> start!108372 tp!98867))

(declare-fun b!1279037 () Bool)

(assert (=> b!1279037 (= e!730758 false)))

(declare-fun minValue!1387 () V!49849)

(declare-fun zeroValue!1387 () V!49849)

(declare-fun lt!575960 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21560 0))(
  ( (tuple2!21561 (_1!10791 (_ BitVec 64)) (_2!10791 V!49849)) )
))
(declare-datatypes ((List!28760 0))(
  ( (Nil!28757) (Cons!28756 (h!29965 tuple2!21560) (t!42300 List!28760)) )
))
(declare-datatypes ((ListLongMap!19217 0))(
  ( (ListLongMap!19218 (toList!9624 List!28760)) )
))
(declare-fun contains!7739 (ListLongMap!19217 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4708 (array!84208 array!84206 (_ BitVec 32) (_ BitVec 32) V!49849 V!49849 (_ BitVec 32) Int) ListLongMap!19217)

(assert (=> b!1279037 (= lt!575960 (contains!7739 (getCurrentListMap!4708 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1279038 () Bool)

(assert (=> b!1279038 (= e!730756 (and e!730760 mapRes!51890))))

(declare-fun condMapEmpty!51890 () Bool)

(declare-fun mapDefault!51890 () ValueCell!15881)

