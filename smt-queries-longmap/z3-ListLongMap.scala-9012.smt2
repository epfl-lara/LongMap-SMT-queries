; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108832 () Bool)

(assert start!108832)

(declare-fun b_free!28345 () Bool)

(declare-fun b_next!28345 () Bool)

(assert (=> start!108832 (= b_free!28345 (not b_next!28345))))

(declare-fun tp!100152 () Bool)

(declare-fun b_and!46393 () Bool)

(assert (=> start!108832 (= tp!100152 b_and!46393)))

(declare-fun b!1285207 () Bool)

(declare-fun res!853801 () Bool)

(declare-fun e!734118 () Bool)

(assert (=> b!1285207 (=> (not res!853801) (not e!734118))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84915 0))(
  ( (array!84916 (arr!40960 (Array (_ BitVec 32) (_ BitVec 64))) (size!41512 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84915)

(assert (=> b!1285207 (= res!853801 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41512 _keys!1741))))))

(declare-fun b!1285208 () Bool)

(declare-fun res!853803 () Bool)

(assert (=> b!1285208 (=> (not res!853803) (not e!734118))))

(declare-datatypes ((List!29118 0))(
  ( (Nil!29115) (Cons!29114 (h!30323 (_ BitVec 64)) (t!42654 List!29118)) )
))
(declare-fun arrayNoDuplicates!0 (array!84915 (_ BitVec 32) List!29118) Bool)

(assert (=> b!1285208 (= res!853803 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29115))))

(declare-fun b!1285209 () Bool)

(declare-fun res!853802 () Bool)

(assert (=> b!1285209 (=> (not res!853802) (not e!734118))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50417 0))(
  ( (V!50418 (val!17067 Int)) )
))
(declare-datatypes ((ValueCell!16094 0))(
  ( (ValueCellFull!16094 (v!19668 V!50417)) (EmptyCell!16094) )
))
(declare-datatypes ((array!84917 0))(
  ( (array!84918 (arr!40961 (Array (_ BitVec 32) ValueCell!16094)) (size!41513 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84917)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285209 (= res!853802 (and (= (size!41513 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41512 _keys!1741) (size!41513 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285210 () Bool)

(assert (=> b!1285210 (= e!734118 false)))

(declare-fun minValue!1387 () V!50417)

(declare-fun zeroValue!1387 () V!50417)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!576717 () Bool)

(declare-datatypes ((tuple2!21940 0))(
  ( (tuple2!21941 (_1!10981 (_ BitVec 64)) (_2!10981 V!50417)) )
))
(declare-datatypes ((List!29119 0))(
  ( (Nil!29116) (Cons!29115 (h!30324 tuple2!21940) (t!42655 List!29119)) )
))
(declare-datatypes ((ListLongMap!19597 0))(
  ( (ListLongMap!19598 (toList!9814 List!29119)) )
))
(declare-fun contains!7861 (ListLongMap!19597 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4784 (array!84915 array!84917 (_ BitVec 32) (_ BitVec 32) V!50417 V!50417 (_ BitVec 32) Int) ListLongMap!19597)

(assert (=> b!1285210 (= lt!576717 (contains!7861 (getCurrentListMap!4784 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285211 () Bool)

(declare-fun e!734119 () Bool)

(declare-fun tp_is_empty!33985 () Bool)

(assert (=> b!1285211 (= e!734119 tp_is_empty!33985)))

(declare-fun b!1285212 () Bool)

(declare-fun e!734120 () Bool)

(declare-fun e!734117 () Bool)

(declare-fun mapRes!52535 () Bool)

(assert (=> b!1285212 (= e!734120 (and e!734117 mapRes!52535))))

(declare-fun condMapEmpty!52535 () Bool)

(declare-fun mapDefault!52535 () ValueCell!16094)

(assert (=> b!1285212 (= condMapEmpty!52535 (= (arr!40961 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16094)) mapDefault!52535)))))

(declare-fun b!1285213 () Bool)

(assert (=> b!1285213 (= e!734117 tp_is_empty!33985)))

(declare-fun res!853800 () Bool)

(assert (=> start!108832 (=> (not res!853800) (not e!734118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108832 (= res!853800 (validMask!0 mask!2175))))

(assert (=> start!108832 e!734118))

(assert (=> start!108832 tp_is_empty!33985))

(assert (=> start!108832 true))

(declare-fun array_inv!31225 (array!84917) Bool)

(assert (=> start!108832 (and (array_inv!31225 _values!1445) e!734120)))

(declare-fun array_inv!31226 (array!84915) Bool)

(assert (=> start!108832 (array_inv!31226 _keys!1741)))

(assert (=> start!108832 tp!100152))

(declare-fun mapNonEmpty!52535 () Bool)

(declare-fun tp!100151 () Bool)

(assert (=> mapNonEmpty!52535 (= mapRes!52535 (and tp!100151 e!734119))))

(declare-fun mapKey!52535 () (_ BitVec 32))

(declare-fun mapRest!52535 () (Array (_ BitVec 32) ValueCell!16094))

(declare-fun mapValue!52535 () ValueCell!16094)

(assert (=> mapNonEmpty!52535 (= (arr!40961 _values!1445) (store mapRest!52535 mapKey!52535 mapValue!52535))))

(declare-fun mapIsEmpty!52535 () Bool)

(assert (=> mapIsEmpty!52535 mapRes!52535))

(declare-fun b!1285214 () Bool)

(declare-fun res!853799 () Bool)

(assert (=> b!1285214 (=> (not res!853799) (not e!734118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84915 (_ BitVec 32)) Bool)

(assert (=> b!1285214 (= res!853799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108832 res!853800) b!1285209))

(assert (= (and b!1285209 res!853802) b!1285214))

(assert (= (and b!1285214 res!853799) b!1285208))

(assert (= (and b!1285208 res!853803) b!1285207))

(assert (= (and b!1285207 res!853801) b!1285210))

(assert (= (and b!1285212 condMapEmpty!52535) mapIsEmpty!52535))

(assert (= (and b!1285212 (not condMapEmpty!52535)) mapNonEmpty!52535))

(get-info :version)

(assert (= (and mapNonEmpty!52535 ((_ is ValueCellFull!16094) mapValue!52535)) b!1285211))

(assert (= (and b!1285212 ((_ is ValueCellFull!16094) mapDefault!52535)) b!1285213))

(assert (= start!108832 b!1285212))

(declare-fun m!1178185 () Bool)

(assert (=> b!1285208 m!1178185))

(declare-fun m!1178187 () Bool)

(assert (=> mapNonEmpty!52535 m!1178187))

(declare-fun m!1178189 () Bool)

(assert (=> start!108832 m!1178189))

(declare-fun m!1178191 () Bool)

(assert (=> start!108832 m!1178191))

(declare-fun m!1178193 () Bool)

(assert (=> start!108832 m!1178193))

(declare-fun m!1178195 () Bool)

(assert (=> b!1285214 m!1178195))

(declare-fun m!1178197 () Bool)

(assert (=> b!1285210 m!1178197))

(assert (=> b!1285210 m!1178197))

(declare-fun m!1178199 () Bool)

(assert (=> b!1285210 m!1178199))

(check-sat tp_is_empty!33985 (not b!1285210) (not b!1285208) b_and!46393 (not mapNonEmpty!52535) (not start!108832) (not b!1285214) (not b_next!28345))
(check-sat b_and!46393 (not b_next!28345))
