; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109566 () Bool)

(assert start!109566)

(declare-fun b_free!29055 () Bool)

(declare-fun b_next!29055 () Bool)

(assert (=> start!109566 (= b_free!29055 (not b_next!29055))))

(declare-fun tp!102283 () Bool)

(declare-fun b_and!47145 () Bool)

(assert (=> start!109566 (= tp!102283 b_and!47145)))

(declare-fun b!1297695 () Bool)

(declare-fun e!740386 () Bool)

(assert (=> b!1297695 (= e!740386 false)))

(declare-datatypes ((V!51363 0))(
  ( (V!51364 (val!17422 Int)) )
))
(declare-fun minValue!1387 () V!51363)

(declare-fun zeroValue!1387 () V!51363)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16449 0))(
  ( (ValueCellFull!16449 (v!20025 V!51363)) (EmptyCell!16449) )
))
(declare-datatypes ((array!86400 0))(
  ( (array!86401 (arr!41701 (Array (_ BitVec 32) ValueCell!16449)) (size!42251 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86400)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86402 0))(
  ( (array!86403 (arr!41702 (Array (_ BitVec 32) (_ BitVec 64))) (size!42252 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86402)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun lt!580628 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!22454 0))(
  ( (tuple2!22455 (_1!11238 (_ BitVec 64)) (_2!11238 V!51363)) )
))
(declare-datatypes ((List!29588 0))(
  ( (Nil!29585) (Cons!29584 (h!30793 tuple2!22454) (t!43152 List!29588)) )
))
(declare-datatypes ((ListLongMap!20111 0))(
  ( (ListLongMap!20112 (toList!10071 List!29588)) )
))
(declare-fun contains!8189 (ListLongMap!20111 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5100 (array!86402 array!86400 (_ BitVec 32) (_ BitVec 32) V!51363 V!51363 (_ BitVec 32) Int) ListLongMap!20111)

(assert (=> b!1297695 (= lt!580628 (contains!8189 (getCurrentListMap!5100 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297696 () Bool)

(declare-fun res!862404 () Bool)

(assert (=> b!1297696 (=> (not res!862404) (not e!740386))))

(declare-datatypes ((List!29589 0))(
  ( (Nil!29586) (Cons!29585 (h!30794 (_ BitVec 64)) (t!43153 List!29589)) )
))
(declare-fun arrayNoDuplicates!0 (array!86402 (_ BitVec 32) List!29589) Bool)

(assert (=> b!1297696 (= res!862404 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29586))))

(declare-fun b!1297697 () Bool)

(declare-fun res!862407 () Bool)

(assert (=> b!1297697 (=> (not res!862407) (not e!740386))))

(assert (=> b!1297697 (= res!862407 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42252 _keys!1741))))))

(declare-fun b!1297698 () Bool)

(declare-fun e!740383 () Bool)

(declare-fun tp_is_empty!34695 () Bool)

(assert (=> b!1297698 (= e!740383 tp_is_empty!34695)))

(declare-fun b!1297699 () Bool)

(declare-fun e!740384 () Bool)

(assert (=> b!1297699 (= e!740384 tp_is_empty!34695)))

(declare-fun b!1297700 () Bool)

(declare-fun res!862406 () Bool)

(assert (=> b!1297700 (=> (not res!862406) (not e!740386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86402 (_ BitVec 32)) Bool)

(assert (=> b!1297700 (= res!862406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297701 () Bool)

(declare-fun e!740385 () Bool)

(declare-fun mapRes!53603 () Bool)

(assert (=> b!1297701 (= e!740385 (and e!740383 mapRes!53603))))

(declare-fun condMapEmpty!53603 () Bool)

(declare-fun mapDefault!53603 () ValueCell!16449)

(assert (=> b!1297701 (= condMapEmpty!53603 (= (arr!41701 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16449)) mapDefault!53603)))))

(declare-fun b!1297702 () Bool)

(declare-fun res!862405 () Bool)

(assert (=> b!1297702 (=> (not res!862405) (not e!740386))))

(assert (=> b!1297702 (= res!862405 (and (= (size!42251 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42252 _keys!1741) (size!42251 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53603 () Bool)

(declare-fun tp!102284 () Bool)

(assert (=> mapNonEmpty!53603 (= mapRes!53603 (and tp!102284 e!740384))))

(declare-fun mapRest!53603 () (Array (_ BitVec 32) ValueCell!16449))

(declare-fun mapKey!53603 () (_ BitVec 32))

(declare-fun mapValue!53603 () ValueCell!16449)

(assert (=> mapNonEmpty!53603 (= (arr!41701 _values!1445) (store mapRest!53603 mapKey!53603 mapValue!53603))))

(declare-fun res!862403 () Bool)

(assert (=> start!109566 (=> (not res!862403) (not e!740386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109566 (= res!862403 (validMask!0 mask!2175))))

(assert (=> start!109566 e!740386))

(assert (=> start!109566 tp_is_empty!34695))

(assert (=> start!109566 true))

(declare-fun array_inv!31563 (array!86400) Bool)

(assert (=> start!109566 (and (array_inv!31563 _values!1445) e!740385)))

(declare-fun array_inv!31564 (array!86402) Bool)

(assert (=> start!109566 (array_inv!31564 _keys!1741)))

(assert (=> start!109566 tp!102283))

(declare-fun mapIsEmpty!53603 () Bool)

(assert (=> mapIsEmpty!53603 mapRes!53603))

(assert (= (and start!109566 res!862403) b!1297702))

(assert (= (and b!1297702 res!862405) b!1297700))

(assert (= (and b!1297700 res!862406) b!1297696))

(assert (= (and b!1297696 res!862404) b!1297697))

(assert (= (and b!1297697 res!862407) b!1297695))

(assert (= (and b!1297701 condMapEmpty!53603) mapIsEmpty!53603))

(assert (= (and b!1297701 (not condMapEmpty!53603)) mapNonEmpty!53603))

(get-info :version)

(assert (= (and mapNonEmpty!53603 ((_ is ValueCellFull!16449) mapValue!53603)) b!1297699))

(assert (= (and b!1297701 ((_ is ValueCellFull!16449) mapDefault!53603)) b!1297698))

(assert (= start!109566 b!1297701))

(declare-fun m!1189203 () Bool)

(assert (=> b!1297696 m!1189203))

(declare-fun m!1189205 () Bool)

(assert (=> b!1297700 m!1189205))

(declare-fun m!1189207 () Bool)

(assert (=> mapNonEmpty!53603 m!1189207))

(declare-fun m!1189209 () Bool)

(assert (=> b!1297695 m!1189209))

(assert (=> b!1297695 m!1189209))

(declare-fun m!1189211 () Bool)

(assert (=> b!1297695 m!1189211))

(declare-fun m!1189213 () Bool)

(assert (=> start!109566 m!1189213))

(declare-fun m!1189215 () Bool)

(assert (=> start!109566 m!1189215))

(declare-fun m!1189217 () Bool)

(assert (=> start!109566 m!1189217))

(check-sat (not b!1297700) (not b_next!29055) (not b!1297695) (not mapNonEmpty!53603) (not b!1297696) tp_is_empty!34695 b_and!47145 (not start!109566))
(check-sat b_and!47145 (not b_next!29055))
