; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108628 () Bool)

(assert start!108628)

(declare-fun b_free!28141 () Bool)

(declare-fun b_next!28141 () Bool)

(assert (=> start!108628 (= b_free!28141 (not b_next!28141))))

(declare-fun tp!99539 () Bool)

(declare-fun b_and!46189 () Bool)

(assert (=> start!108628 (= tp!99539 b_and!46189)))

(declare-fun b!1282165 () Bool)

(declare-fun e!732588 () Bool)

(declare-fun tp_is_empty!33781 () Bool)

(assert (=> b!1282165 (= e!732588 tp_is_empty!33781)))

(declare-fun b!1282166 () Bool)

(declare-fun e!732590 () Bool)

(declare-fun e!732587 () Bool)

(declare-fun mapRes!52229 () Bool)

(assert (=> b!1282166 (= e!732590 (and e!732587 mapRes!52229))))

(declare-fun condMapEmpty!52229 () Bool)

(declare-datatypes ((V!50145 0))(
  ( (V!50146 (val!16965 Int)) )
))
(declare-datatypes ((ValueCell!15992 0))(
  ( (ValueCellFull!15992 (v!19566 V!50145)) (EmptyCell!15992) )
))
(declare-datatypes ((array!84527 0))(
  ( (array!84528 (arr!40766 (Array (_ BitVec 32) ValueCell!15992)) (size!41318 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84527)

(declare-fun mapDefault!52229 () ValueCell!15992)

(assert (=> b!1282166 (= condMapEmpty!52229 (= (arr!40766 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15992)) mapDefault!52229)))))

(declare-fun mapNonEmpty!52229 () Bool)

(declare-fun tp!99540 () Bool)

(assert (=> mapNonEmpty!52229 (= mapRes!52229 (and tp!99540 e!732588))))

(declare-fun mapValue!52229 () ValueCell!15992)

(declare-fun mapRest!52229 () (Array (_ BitVec 32) ValueCell!15992))

(declare-fun mapKey!52229 () (_ BitVec 32))

(assert (=> mapNonEmpty!52229 (= (arr!40766 _values!1445) (store mapRest!52229 mapKey!52229 mapValue!52229))))

(declare-fun mapIsEmpty!52229 () Bool)

(assert (=> mapIsEmpty!52229 mapRes!52229))

(declare-fun res!851677 () Bool)

(declare-fun e!732591 () Bool)

(assert (=> start!108628 (=> (not res!851677) (not e!732591))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108628 (= res!851677 (validMask!0 mask!2175))))

(assert (=> start!108628 e!732591))

(assert (=> start!108628 tp_is_empty!33781))

(assert (=> start!108628 true))

(declare-fun array_inv!31089 (array!84527) Bool)

(assert (=> start!108628 (and (array_inv!31089 _values!1445) e!732590)))

(declare-datatypes ((array!84529 0))(
  ( (array!84530 (arr!40767 (Array (_ BitVec 32) (_ BitVec 64))) (size!41319 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84529)

(declare-fun array_inv!31090 (array!84529) Bool)

(assert (=> start!108628 (array_inv!31090 _keys!1741)))

(assert (=> start!108628 tp!99539))

(declare-fun b!1282167 () Bool)

(declare-fun res!851675 () Bool)

(assert (=> b!1282167 (=> (not res!851675) (not e!732591))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1282167 (= res!851675 (and (= (size!41318 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41319 _keys!1741) (size!41318 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282168 () Bool)

(declare-fun res!851676 () Bool)

(assert (=> b!1282168 (=> (not res!851676) (not e!732591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84529 (_ BitVec 32)) Bool)

(assert (=> b!1282168 (= res!851676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282169 () Bool)

(assert (=> b!1282169 (= e!732591 false)))

(declare-fun minValue!1387 () V!50145)

(declare-fun zeroValue!1387 () V!50145)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576330 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21794 0))(
  ( (tuple2!21795 (_1!10908 (_ BitVec 64)) (_2!10908 V!50145)) )
))
(declare-datatypes ((List!28981 0))(
  ( (Nil!28978) (Cons!28977 (h!30186 tuple2!21794) (t!42517 List!28981)) )
))
(declare-datatypes ((ListLongMap!19451 0))(
  ( (ListLongMap!19452 (toList!9741 List!28981)) )
))
(declare-fun contains!7788 (ListLongMap!19451 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4715 (array!84529 array!84527 (_ BitVec 32) (_ BitVec 32) V!50145 V!50145 (_ BitVec 32) Int) ListLongMap!19451)

(assert (=> b!1282169 (= lt!576330 (contains!7788 (getCurrentListMap!4715 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282170 () Bool)

(declare-fun res!851678 () Bool)

(assert (=> b!1282170 (=> (not res!851678) (not e!732591))))

(declare-datatypes ((List!28982 0))(
  ( (Nil!28979) (Cons!28978 (h!30187 (_ BitVec 64)) (t!42518 List!28982)) )
))
(declare-fun arrayNoDuplicates!0 (array!84529 (_ BitVec 32) List!28982) Bool)

(assert (=> b!1282170 (= res!851678 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28979))))

(declare-fun b!1282171 () Bool)

(declare-fun res!851679 () Bool)

(assert (=> b!1282171 (=> (not res!851679) (not e!732591))))

(assert (=> b!1282171 (= res!851679 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41319 _keys!1741))))))

(declare-fun b!1282172 () Bool)

(assert (=> b!1282172 (= e!732587 tp_is_empty!33781)))

(assert (= (and start!108628 res!851677) b!1282167))

(assert (= (and b!1282167 res!851675) b!1282168))

(assert (= (and b!1282168 res!851676) b!1282170))

(assert (= (and b!1282170 res!851678) b!1282171))

(assert (= (and b!1282171 res!851679) b!1282169))

(assert (= (and b!1282166 condMapEmpty!52229) mapIsEmpty!52229))

(assert (= (and b!1282166 (not condMapEmpty!52229)) mapNonEmpty!52229))

(get-info :version)

(assert (= (and mapNonEmpty!52229 ((_ is ValueCellFull!15992) mapValue!52229)) b!1282165))

(assert (= (and b!1282166 ((_ is ValueCellFull!15992) mapDefault!52229)) b!1282172))

(assert (= start!108628 b!1282166))

(declare-fun m!1176001 () Bool)

(assert (=> start!108628 m!1176001))

(declare-fun m!1176003 () Bool)

(assert (=> start!108628 m!1176003))

(declare-fun m!1176005 () Bool)

(assert (=> start!108628 m!1176005))

(declare-fun m!1176007 () Bool)

(assert (=> mapNonEmpty!52229 m!1176007))

(declare-fun m!1176009 () Bool)

(assert (=> b!1282169 m!1176009))

(assert (=> b!1282169 m!1176009))

(declare-fun m!1176011 () Bool)

(assert (=> b!1282169 m!1176011))

(declare-fun m!1176013 () Bool)

(assert (=> b!1282168 m!1176013))

(declare-fun m!1176015 () Bool)

(assert (=> b!1282170 m!1176015))

(check-sat (not start!108628) (not b_next!28141) (not b!1282168) b_and!46189 (not b!1282169) tp_is_empty!33781 (not b!1282170) (not mapNonEmpty!52229))
(check-sat b_and!46189 (not b_next!28141))
