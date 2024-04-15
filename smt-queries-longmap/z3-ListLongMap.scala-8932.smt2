; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108318 () Bool)

(assert start!108318)

(declare-fun b!1278469 () Bool)

(declare-fun e!730325 () Bool)

(assert (=> b!1278469 (= e!730325 false)))

(declare-fun lt!575710 () Bool)

(declare-datatypes ((array!83999 0))(
  ( (array!84000 (arr!40504 (Array (_ BitVec 32) (_ BitVec 64))) (size!41056 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!83999)

(declare-datatypes ((List!28817 0))(
  ( (Nil!28814) (Cons!28813 (h!30022 (_ BitVec 64)) (t!42349 List!28817)) )
))
(declare-fun arrayNoDuplicates!0 (array!83999 (_ BitVec 32) List!28817) Bool)

(assert (=> b!1278469 (= lt!575710 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28814))))

(declare-fun b!1278470 () Bool)

(declare-fun res!849370 () Bool)

(assert (=> b!1278470 (=> (not res!849370) (not e!730325))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49777 0))(
  ( (V!49778 (val!16827 Int)) )
))
(declare-datatypes ((ValueCell!15854 0))(
  ( (ValueCellFull!15854 (v!19426 V!49777)) (EmptyCell!15854) )
))
(declare-datatypes ((array!84001 0))(
  ( (array!84002 (arr!40505 (Array (_ BitVec 32) ValueCell!15854)) (size!41057 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84001)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278470 (= res!849370 (and (= (size!41057 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41056 _keys!1741) (size!41057 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51809 () Bool)

(declare-fun mapRes!51809 () Bool)

(assert (=> mapIsEmpty!51809 mapRes!51809))

(declare-fun b!1278471 () Bool)

(declare-fun e!730323 () Bool)

(declare-fun tp_is_empty!33505 () Bool)

(assert (=> b!1278471 (= e!730323 tp_is_empty!33505)))

(declare-fun res!849371 () Bool)

(assert (=> start!108318 (=> (not res!849371) (not e!730325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108318 (= res!849371 (validMask!0 mask!2175))))

(assert (=> start!108318 e!730325))

(assert (=> start!108318 true))

(declare-fun e!730326 () Bool)

(declare-fun array_inv!30925 (array!84001) Bool)

(assert (=> start!108318 (and (array_inv!30925 _values!1445) e!730326)))

(declare-fun array_inv!30926 (array!83999) Bool)

(assert (=> start!108318 (array_inv!30926 _keys!1741)))

(declare-fun b!1278472 () Bool)

(declare-fun e!730322 () Bool)

(assert (=> b!1278472 (= e!730326 (and e!730322 mapRes!51809))))

(declare-fun condMapEmpty!51809 () Bool)

(declare-fun mapDefault!51809 () ValueCell!15854)

(assert (=> b!1278472 (= condMapEmpty!51809 (= (arr!40505 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15854)) mapDefault!51809)))))

(declare-fun b!1278473 () Bool)

(assert (=> b!1278473 (= e!730322 tp_is_empty!33505)))

(declare-fun b!1278474 () Bool)

(declare-fun res!849369 () Bool)

(assert (=> b!1278474 (=> (not res!849369) (not e!730325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83999 (_ BitVec 32)) Bool)

(assert (=> b!1278474 (= res!849369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!51809 () Bool)

(declare-fun tp!98784 () Bool)

(assert (=> mapNonEmpty!51809 (= mapRes!51809 (and tp!98784 e!730323))))

(declare-fun mapValue!51809 () ValueCell!15854)

(declare-fun mapKey!51809 () (_ BitVec 32))

(declare-fun mapRest!51809 () (Array (_ BitVec 32) ValueCell!15854))

(assert (=> mapNonEmpty!51809 (= (arr!40505 _values!1445) (store mapRest!51809 mapKey!51809 mapValue!51809))))

(assert (= (and start!108318 res!849371) b!1278470))

(assert (= (and b!1278470 res!849370) b!1278474))

(assert (= (and b!1278474 res!849369) b!1278469))

(assert (= (and b!1278472 condMapEmpty!51809) mapIsEmpty!51809))

(assert (= (and b!1278472 (not condMapEmpty!51809)) mapNonEmpty!51809))

(get-info :version)

(assert (= (and mapNonEmpty!51809 ((_ is ValueCellFull!15854) mapValue!51809)) b!1278471))

(assert (= (and b!1278472 ((_ is ValueCellFull!15854) mapDefault!51809)) b!1278473))

(assert (= start!108318 b!1278472))

(declare-fun m!1173309 () Bool)

(assert (=> b!1278469 m!1173309))

(declare-fun m!1173311 () Bool)

(assert (=> start!108318 m!1173311))

(declare-fun m!1173313 () Bool)

(assert (=> start!108318 m!1173313))

(declare-fun m!1173315 () Bool)

(assert (=> start!108318 m!1173315))

(declare-fun m!1173317 () Bool)

(assert (=> b!1278474 m!1173317))

(declare-fun m!1173319 () Bool)

(assert (=> mapNonEmpty!51809 m!1173319))

(check-sat (not mapNonEmpty!51809) tp_is_empty!33505 (not start!108318) (not b!1278474) (not b!1278469))
(check-sat)
