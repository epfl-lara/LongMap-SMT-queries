; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82348 () Bool)

(assert start!82348)

(declare-fun b_free!18615 () Bool)

(declare-fun b_next!18615 () Bool)

(assert (=> start!82348 (= b_free!18615 (not b_next!18615))))

(declare-fun tp!64815 () Bool)

(declare-fun b_and!30103 () Bool)

(assert (=> start!82348 (= tp!64815 b_and!30103)))

(declare-fun b!960125 () Bool)

(declare-fun e!541228 () Bool)

(declare-fun tp_is_empty!21327 () Bool)

(assert (=> b!960125 (= e!541228 tp_is_empty!21327)))

(declare-fun b!960126 () Bool)

(declare-fun res!642695 () Bool)

(declare-fun e!541226 () Bool)

(assert (=> b!960126 (=> (not res!642695) (not e!541226))))

(declare-datatypes ((array!58745 0))(
  ( (array!58746 (arr!28246 (Array (_ BitVec 32) (_ BitVec 64))) (size!28725 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58745)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58745 (_ BitVec 32)) Bool)

(assert (=> b!960126 (= res!642695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960127 () Bool)

(assert (=> b!960127 (= e!541226 false)))

(declare-datatypes ((V!33419 0))(
  ( (V!33420 (val!10714 Int)) )
))
(declare-fun minValue!1328 () V!33419)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10182 0))(
  ( (ValueCellFull!10182 (v!13271 V!33419)) (EmptyCell!10182) )
))
(declare-datatypes ((array!58747 0))(
  ( (array!58748 (arr!28247 (Array (_ BitVec 32) ValueCell!10182)) (size!28726 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58747)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33419)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun lt!430614 () Bool)

(declare-datatypes ((tuple2!13820 0))(
  ( (tuple2!13821 (_1!6921 (_ BitVec 64)) (_2!6921 V!33419)) )
))
(declare-datatypes ((List!19640 0))(
  ( (Nil!19637) (Cons!19636 (h!20798 tuple2!13820) (t!28003 List!19640)) )
))
(declare-datatypes ((ListLongMap!12517 0))(
  ( (ListLongMap!12518 (toList!6274 List!19640)) )
))
(declare-fun contains!5373 (ListLongMap!12517 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3507 (array!58745 array!58747 (_ BitVec 32) (_ BitVec 32) V!33419 V!33419 (_ BitVec 32) Int) ListLongMap!12517)

(assert (=> b!960127 (= lt!430614 (contains!5373 (getCurrentListMap!3507 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28246 _keys!1668) i!793)))))

(declare-fun b!960128 () Bool)

(declare-fun res!642692 () Bool)

(assert (=> b!960128 (=> (not res!642692) (not e!541226))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960128 (= res!642692 (validKeyInArray!0 (select (arr!28246 _keys!1668) i!793)))))

(declare-fun b!960129 () Bool)

(declare-fun e!541229 () Bool)

(assert (=> b!960129 (= e!541229 tp_is_empty!21327)))

(declare-fun mapNonEmpty!33970 () Bool)

(declare-fun mapRes!33970 () Bool)

(declare-fun tp!64814 () Bool)

(assert (=> mapNonEmpty!33970 (= mapRes!33970 (and tp!64814 e!541228))))

(declare-fun mapRest!33970 () (Array (_ BitVec 32) ValueCell!10182))

(declare-fun mapValue!33970 () ValueCell!10182)

(declare-fun mapKey!33970 () (_ BitVec 32))

(assert (=> mapNonEmpty!33970 (= (arr!28247 _values!1386) (store mapRest!33970 mapKey!33970 mapValue!33970))))

(declare-fun b!960130 () Bool)

(declare-fun res!642693 () Bool)

(assert (=> b!960130 (=> (not res!642693) (not e!541226))))

(assert (=> b!960130 (= res!642693 (and (= (size!28726 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28725 _keys!1668) (size!28726 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960131 () Bool)

(declare-fun e!541230 () Bool)

(assert (=> b!960131 (= e!541230 (and e!541229 mapRes!33970))))

(declare-fun condMapEmpty!33970 () Bool)

(declare-fun mapDefault!33970 () ValueCell!10182)

(assert (=> b!960131 (= condMapEmpty!33970 (= (arr!28247 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10182)) mapDefault!33970)))))

(declare-fun mapIsEmpty!33970 () Bool)

(assert (=> mapIsEmpty!33970 mapRes!33970))

(declare-fun res!642690 () Bool)

(assert (=> start!82348 (=> (not res!642690) (not e!541226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82348 (= res!642690 (validMask!0 mask!2088))))

(assert (=> start!82348 e!541226))

(assert (=> start!82348 true))

(assert (=> start!82348 tp_is_empty!21327))

(declare-fun array_inv!21887 (array!58745) Bool)

(assert (=> start!82348 (array_inv!21887 _keys!1668)))

(declare-fun array_inv!21888 (array!58747) Bool)

(assert (=> start!82348 (and (array_inv!21888 _values!1386) e!541230)))

(assert (=> start!82348 tp!64815))

(declare-fun b!960132 () Bool)

(declare-fun res!642691 () Bool)

(assert (=> b!960132 (=> (not res!642691) (not e!541226))))

(assert (=> b!960132 (= res!642691 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28725 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28725 _keys!1668))))))

(declare-fun b!960133 () Bool)

(declare-fun res!642694 () Bool)

(assert (=> b!960133 (=> (not res!642694) (not e!541226))))

(declare-datatypes ((List!19641 0))(
  ( (Nil!19638) (Cons!19637 (h!20799 (_ BitVec 64)) (t!28004 List!19641)) )
))
(declare-fun arrayNoDuplicates!0 (array!58745 (_ BitVec 32) List!19641) Bool)

(assert (=> b!960133 (= res!642694 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19638))))

(assert (= (and start!82348 res!642690) b!960130))

(assert (= (and b!960130 res!642693) b!960126))

(assert (= (and b!960126 res!642695) b!960133))

(assert (= (and b!960133 res!642694) b!960132))

(assert (= (and b!960132 res!642691) b!960128))

(assert (= (and b!960128 res!642692) b!960127))

(assert (= (and b!960131 condMapEmpty!33970) mapIsEmpty!33970))

(assert (= (and b!960131 (not condMapEmpty!33970)) mapNonEmpty!33970))

(get-info :version)

(assert (= (and mapNonEmpty!33970 ((_ is ValueCellFull!10182) mapValue!33970)) b!960125))

(assert (= (and b!960131 ((_ is ValueCellFull!10182) mapDefault!33970)) b!960129))

(assert (= start!82348 b!960131))

(declare-fun m!890449 () Bool)

(assert (=> start!82348 m!890449))

(declare-fun m!890451 () Bool)

(assert (=> start!82348 m!890451))

(declare-fun m!890453 () Bool)

(assert (=> start!82348 m!890453))

(declare-fun m!890455 () Bool)

(assert (=> b!960126 m!890455))

(declare-fun m!890457 () Bool)

(assert (=> b!960128 m!890457))

(assert (=> b!960128 m!890457))

(declare-fun m!890459 () Bool)

(assert (=> b!960128 m!890459))

(declare-fun m!890461 () Bool)

(assert (=> mapNonEmpty!33970 m!890461))

(declare-fun m!890463 () Bool)

(assert (=> b!960127 m!890463))

(assert (=> b!960127 m!890457))

(assert (=> b!960127 m!890463))

(assert (=> b!960127 m!890457))

(declare-fun m!890465 () Bool)

(assert (=> b!960127 m!890465))

(declare-fun m!890467 () Bool)

(assert (=> b!960133 m!890467))

(check-sat (not b!960126) (not b!960133) (not b_next!18615) (not mapNonEmpty!33970) tp_is_empty!21327 (not start!82348) (not b!960128) b_and!30103 (not b!960127))
(check-sat b_and!30103 (not b_next!18615))
