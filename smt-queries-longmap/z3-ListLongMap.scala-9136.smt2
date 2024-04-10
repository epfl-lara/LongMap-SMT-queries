; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109602 () Bool)

(assert start!109602)

(declare-fun b_free!29091 () Bool)

(declare-fun b_next!29091 () Bool)

(assert (=> start!109602 (= b_free!29091 (not b_next!29091))))

(declare-fun tp!102392 () Bool)

(declare-fun b_and!47181 () Bool)

(assert (=> start!109602 (= tp!102392 b_and!47181)))

(declare-fun b!1298227 () Bool)

(declare-fun e!740655 () Bool)

(declare-fun e!740653 () Bool)

(declare-fun mapRes!53657 () Bool)

(assert (=> b!1298227 (= e!740655 (and e!740653 mapRes!53657))))

(declare-fun condMapEmpty!53657 () Bool)

(declare-datatypes ((V!51411 0))(
  ( (V!51412 (val!17440 Int)) )
))
(declare-datatypes ((ValueCell!16467 0))(
  ( (ValueCellFull!16467 (v!20043 V!51411)) (EmptyCell!16467) )
))
(declare-datatypes ((array!86468 0))(
  ( (array!86469 (arr!41735 (Array (_ BitVec 32) ValueCell!16467)) (size!42285 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86468)

(declare-fun mapDefault!53657 () ValueCell!16467)

(assert (=> b!1298227 (= condMapEmpty!53657 (= (arr!41735 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16467)) mapDefault!53657)))))

(declare-fun b!1298228 () Bool)

(declare-fun e!740656 () Bool)

(declare-fun tp_is_empty!34731 () Bool)

(assert (=> b!1298228 (= e!740656 tp_is_empty!34731)))

(declare-fun b!1298229 () Bool)

(declare-fun res!862778 () Bool)

(declare-fun e!740654 () Bool)

(assert (=> b!1298229 (=> (not res!862778) (not e!740654))))

(declare-fun minValue!1387 () V!51411)

(declare-fun zeroValue!1387 () V!51411)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86470 0))(
  ( (array!86471 (arr!41736 (Array (_ BitVec 32) (_ BitVec 64))) (size!42286 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86470)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22486 0))(
  ( (tuple2!22487 (_1!11254 (_ BitVec 64)) (_2!11254 V!51411)) )
))
(declare-datatypes ((List!29616 0))(
  ( (Nil!29613) (Cons!29612 (h!30821 tuple2!22486) (t!43180 List!29616)) )
))
(declare-datatypes ((ListLongMap!20143 0))(
  ( (ListLongMap!20144 (toList!10087 List!29616)) )
))
(declare-fun contains!8205 (ListLongMap!20143 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5116 (array!86470 array!86468 (_ BitVec 32) (_ BitVec 32) V!51411 V!51411 (_ BitVec 32) Int) ListLongMap!20143)

(assert (=> b!1298229 (= res!862778 (contains!8205 (getCurrentListMap!5116 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298230 () Bool)

(declare-fun res!862777 () Bool)

(assert (=> b!1298230 (=> (not res!862777) (not e!740654))))

(assert (=> b!1298230 (= res!862777 (and (= (size!42285 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42286 _keys!1741) (size!42285 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298231 () Bool)

(assert (=> b!1298231 (= e!740653 tp_is_empty!34731)))

(declare-fun res!862779 () Bool)

(assert (=> start!109602 (=> (not res!862779) (not e!740654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109602 (= res!862779 (validMask!0 mask!2175))))

(assert (=> start!109602 e!740654))

(assert (=> start!109602 tp_is_empty!34731))

(assert (=> start!109602 true))

(declare-fun array_inv!31591 (array!86468) Bool)

(assert (=> start!109602 (and (array_inv!31591 _values!1445) e!740655)))

(declare-fun array_inv!31592 (array!86470) Bool)

(assert (=> start!109602 (array_inv!31592 _keys!1741)))

(assert (=> start!109602 tp!102392))

(declare-fun mapNonEmpty!53657 () Bool)

(declare-fun tp!102391 () Bool)

(assert (=> mapNonEmpty!53657 (= mapRes!53657 (and tp!102391 e!740656))))

(declare-fun mapKey!53657 () (_ BitVec 32))

(declare-fun mapRest!53657 () (Array (_ BitVec 32) ValueCell!16467))

(declare-fun mapValue!53657 () ValueCell!16467)

(assert (=> mapNonEmpty!53657 (= (arr!41735 _values!1445) (store mapRest!53657 mapKey!53657 mapValue!53657))))

(declare-fun b!1298232 () Bool)

(declare-fun res!862776 () Bool)

(assert (=> b!1298232 (=> (not res!862776) (not e!740654))))

(declare-datatypes ((List!29617 0))(
  ( (Nil!29614) (Cons!29613 (h!30822 (_ BitVec 64)) (t!43181 List!29617)) )
))
(declare-fun arrayNoDuplicates!0 (array!86470 (_ BitVec 32) List!29617) Bool)

(assert (=> b!1298232 (= res!862776 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29614))))

(declare-fun b!1298233 () Bool)

(declare-fun res!862773 () Bool)

(assert (=> b!1298233 (=> (not res!862773) (not e!740654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86470 (_ BitVec 32)) Bool)

(assert (=> b!1298233 (= res!862773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298234 () Bool)

(assert (=> b!1298234 (= e!740654 (not true))))

(assert (=> b!1298234 (contains!8205 (getCurrentListMap!5116 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42985 0))(
  ( (Unit!42986) )
))
(declare-fun lt!580682 () Unit!42985)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!45 (array!86470 array!86468 (_ BitVec 32) (_ BitVec 32) V!51411 V!51411 (_ BitVec 64) (_ BitVec 32) Int) Unit!42985)

(assert (=> b!1298234 (= lt!580682 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!45 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298235 () Bool)

(declare-fun res!862774 () Bool)

(assert (=> b!1298235 (=> (not res!862774) (not e!740654))))

(assert (=> b!1298235 (= res!862774 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42286 _keys!1741))))))

(declare-fun b!1298236 () Bool)

(declare-fun res!862775 () Bool)

(assert (=> b!1298236 (=> (not res!862775) (not e!740654))))

(assert (=> b!1298236 (= res!862775 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42286 _keys!1741)) (not (= (select (arr!41736 _keys!1741) from!2144) k0!1205))))))

(declare-fun mapIsEmpty!53657 () Bool)

(assert (=> mapIsEmpty!53657 mapRes!53657))

(assert (= (and start!109602 res!862779) b!1298230))

(assert (= (and b!1298230 res!862777) b!1298233))

(assert (= (and b!1298233 res!862773) b!1298232))

(assert (= (and b!1298232 res!862776) b!1298235))

(assert (= (and b!1298235 res!862774) b!1298229))

(assert (= (and b!1298229 res!862778) b!1298236))

(assert (= (and b!1298236 res!862775) b!1298234))

(assert (= (and b!1298227 condMapEmpty!53657) mapIsEmpty!53657))

(assert (= (and b!1298227 (not condMapEmpty!53657)) mapNonEmpty!53657))

(get-info :version)

(assert (= (and mapNonEmpty!53657 ((_ is ValueCellFull!16467) mapValue!53657)) b!1298228))

(assert (= (and b!1298227 ((_ is ValueCellFull!16467) mapDefault!53657)) b!1298231))

(assert (= start!109602 b!1298227))

(declare-fun m!1189619 () Bool)

(assert (=> start!109602 m!1189619))

(declare-fun m!1189621 () Bool)

(assert (=> start!109602 m!1189621))

(declare-fun m!1189623 () Bool)

(assert (=> start!109602 m!1189623))

(declare-fun m!1189625 () Bool)

(assert (=> b!1298232 m!1189625))

(declare-fun m!1189627 () Bool)

(assert (=> b!1298234 m!1189627))

(assert (=> b!1298234 m!1189627))

(declare-fun m!1189629 () Bool)

(assert (=> b!1298234 m!1189629))

(declare-fun m!1189631 () Bool)

(assert (=> b!1298234 m!1189631))

(declare-fun m!1189633 () Bool)

(assert (=> b!1298229 m!1189633))

(assert (=> b!1298229 m!1189633))

(declare-fun m!1189635 () Bool)

(assert (=> b!1298229 m!1189635))

(declare-fun m!1189637 () Bool)

(assert (=> b!1298233 m!1189637))

(declare-fun m!1189639 () Bool)

(assert (=> mapNonEmpty!53657 m!1189639))

(declare-fun m!1189641 () Bool)

(assert (=> b!1298236 m!1189641))

(check-sat (not b_next!29091) tp_is_empty!34731 (not mapNonEmpty!53657) (not b!1298234) (not start!109602) (not b!1298232) (not b!1298233) b_and!47181 (not b!1298229))
(check-sat b_and!47181 (not b_next!29091))
