; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108598 () Bool)

(assert start!108598)

(declare-fun b_free!28125 () Bool)

(declare-fun b_next!28125 () Bool)

(assert (=> start!108598 (= b_free!28125 (not b_next!28125))))

(declare-fun tp!99487 () Bool)

(declare-fun b_and!46189 () Bool)

(assert (=> start!108598 (= tp!99487 b_and!46189)))

(declare-fun b!1281919 () Bool)

(declare-fun e!732425 () Bool)

(declare-fun e!732428 () Bool)

(declare-fun mapRes!52202 () Bool)

(assert (=> b!1281919 (= e!732425 (and e!732428 mapRes!52202))))

(declare-fun condMapEmpty!52202 () Bool)

(declare-datatypes ((V!50123 0))(
  ( (V!50124 (val!16957 Int)) )
))
(declare-datatypes ((ValueCell!15984 0))(
  ( (ValueCellFull!15984 (v!19558 V!50123)) (EmptyCell!15984) )
))
(declare-datatypes ((array!84598 0))(
  ( (array!84599 (arr!40802 (Array (_ BitVec 32) ValueCell!15984)) (size!41352 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84598)

(declare-fun mapDefault!52202 () ValueCell!15984)

(assert (=> b!1281919 (= condMapEmpty!52202 (= (arr!40802 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15984)) mapDefault!52202)))))

(declare-fun b!1281920 () Bool)

(declare-fun res!851528 () Bool)

(declare-fun e!732424 () Bool)

(assert (=> b!1281920 (=> (not res!851528) (not e!732424))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84600 0))(
  ( (array!84601 (arr!40803 (Array (_ BitVec 32) (_ BitVec 64))) (size!41353 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84600)

(assert (=> b!1281920 (= res!851528 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41353 _keys!1741))))))

(declare-fun b!1281921 () Bool)

(declare-fun res!851532 () Bool)

(assert (=> b!1281921 (=> (not res!851532) (not e!732424))))

(declare-datatypes ((List!28906 0))(
  ( (Nil!28903) (Cons!28902 (h!30111 (_ BitVec 64)) (t!42448 List!28906)) )
))
(declare-fun arrayNoDuplicates!0 (array!84600 (_ BitVec 32) List!28906) Bool)

(assert (=> b!1281921 (= res!851532 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28903))))

(declare-fun b!1281922 () Bool)

(declare-fun res!851530 () Bool)

(assert (=> b!1281922 (=> (not res!851530) (not e!732424))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1281922 (= res!851530 (and (= (size!41352 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41353 _keys!1741) (size!41352 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281923 () Bool)

(declare-fun tp_is_empty!33765 () Bool)

(assert (=> b!1281923 (= e!732428 tp_is_empty!33765)))

(declare-fun res!851529 () Bool)

(assert (=> start!108598 (=> (not res!851529) (not e!732424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108598 (= res!851529 (validMask!0 mask!2175))))

(assert (=> start!108598 e!732424))

(assert (=> start!108598 tp_is_empty!33765))

(assert (=> start!108598 true))

(declare-fun array_inv!30959 (array!84598) Bool)

(assert (=> start!108598 (and (array_inv!30959 _values!1445) e!732425)))

(declare-fun array_inv!30960 (array!84600) Bool)

(assert (=> start!108598 (array_inv!30960 _keys!1741)))

(assert (=> start!108598 tp!99487))

(declare-fun mapIsEmpty!52202 () Bool)

(assert (=> mapIsEmpty!52202 mapRes!52202))

(declare-fun b!1281924 () Bool)

(declare-fun e!732427 () Bool)

(assert (=> b!1281924 (= e!732427 tp_is_empty!33765)))

(declare-fun b!1281925 () Bool)

(declare-fun res!851531 () Bool)

(assert (=> b!1281925 (=> (not res!851531) (not e!732424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84600 (_ BitVec 32)) Bool)

(assert (=> b!1281925 (= res!851531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281926 () Bool)

(assert (=> b!1281926 (= e!732424 false)))

(declare-fun minValue!1387 () V!50123)

(declare-fun zeroValue!1387 () V!50123)

(declare-fun lt!576406 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21714 0))(
  ( (tuple2!21715 (_1!10868 (_ BitVec 64)) (_2!10868 V!50123)) )
))
(declare-datatypes ((List!28907 0))(
  ( (Nil!28904) (Cons!28903 (h!30112 tuple2!21714) (t!42449 List!28907)) )
))
(declare-datatypes ((ListLongMap!19371 0))(
  ( (ListLongMap!19372 (toList!9701 List!28907)) )
))
(declare-fun contains!7817 (ListLongMap!19371 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4785 (array!84600 array!84598 (_ BitVec 32) (_ BitVec 32) V!50123 V!50123 (_ BitVec 32) Int) ListLongMap!19371)

(assert (=> b!1281926 (= lt!576406 (contains!7817 (getCurrentListMap!4785 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52202 () Bool)

(declare-fun tp!99488 () Bool)

(assert (=> mapNonEmpty!52202 (= mapRes!52202 (and tp!99488 e!732427))))

(declare-fun mapValue!52202 () ValueCell!15984)

(declare-fun mapRest!52202 () (Array (_ BitVec 32) ValueCell!15984))

(declare-fun mapKey!52202 () (_ BitVec 32))

(assert (=> mapNonEmpty!52202 (= (arr!40802 _values!1445) (store mapRest!52202 mapKey!52202 mapValue!52202))))

(assert (= (and start!108598 res!851529) b!1281922))

(assert (= (and b!1281922 res!851530) b!1281925))

(assert (= (and b!1281925 res!851531) b!1281921))

(assert (= (and b!1281921 res!851532) b!1281920))

(assert (= (and b!1281920 res!851528) b!1281926))

(assert (= (and b!1281919 condMapEmpty!52202) mapIsEmpty!52202))

(assert (= (and b!1281919 (not condMapEmpty!52202)) mapNonEmpty!52202))

(get-info :version)

(assert (= (and mapNonEmpty!52202 ((_ is ValueCellFull!15984) mapValue!52202)) b!1281924))

(assert (= (and b!1281919 ((_ is ValueCellFull!15984) mapDefault!52202)) b!1281923))

(assert (= start!108598 b!1281919))

(declare-fun m!1176285 () Bool)

(assert (=> start!108598 m!1176285))

(declare-fun m!1176287 () Bool)

(assert (=> start!108598 m!1176287))

(declare-fun m!1176289 () Bool)

(assert (=> start!108598 m!1176289))

(declare-fun m!1176291 () Bool)

(assert (=> b!1281921 m!1176291))

(declare-fun m!1176293 () Bool)

(assert (=> b!1281926 m!1176293))

(assert (=> b!1281926 m!1176293))

(declare-fun m!1176295 () Bool)

(assert (=> b!1281926 m!1176295))

(declare-fun m!1176297 () Bool)

(assert (=> b!1281925 m!1176297))

(declare-fun m!1176299 () Bool)

(assert (=> mapNonEmpty!52202 m!1176299))

(check-sat (not b!1281926) (not mapNonEmpty!52202) (not b!1281925) (not b_next!28125) tp_is_empty!33765 (not b!1281921) b_and!46189 (not start!108598))
(check-sat b_and!46189 (not b_next!28125))
