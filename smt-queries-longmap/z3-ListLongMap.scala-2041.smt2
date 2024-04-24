; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35400 () Bool)

(assert start!35400)

(declare-fun b!354459 () Bool)

(declare-fun res!196513 () Bool)

(declare-fun e!217266 () Bool)

(assert (=> b!354459 (=> (not res!196513) (not e!217266))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19306 0))(
  ( (array!19307 (arr!9146 (Array (_ BitVec 32) (_ BitVec 64))) (size!9498 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19306)

(declare-datatypes ((V!11467 0))(
  ( (V!11468 (val!3978 Int)) )
))
(declare-datatypes ((ValueCell!3590 0))(
  ( (ValueCellFull!3590 (v!6173 V!11467)) (EmptyCell!3590) )
))
(declare-datatypes ((array!19308 0))(
  ( (array!19309 (arr!9147 (Array (_ BitVec 32) ValueCell!3590)) (size!9499 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19308)

(assert (=> b!354459 (= res!196513 (and (= (size!9499 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9498 _keys!1456) (size!9499 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354460 () Bool)

(declare-fun e!217263 () Bool)

(declare-fun tp_is_empty!7867 () Bool)

(assert (=> b!354460 (= e!217263 tp_is_empty!7867)))

(declare-fun res!196512 () Bool)

(assert (=> start!35400 (=> (not res!196512) (not e!217266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35400 (= res!196512 (validMask!0 mask!1842))))

(assert (=> start!35400 e!217266))

(assert (=> start!35400 true))

(declare-fun e!217267 () Bool)

(declare-fun array_inv!6758 (array!19308) Bool)

(assert (=> start!35400 (and (array_inv!6758 _values!1208) e!217267)))

(declare-fun array_inv!6759 (array!19306) Bool)

(assert (=> start!35400 (array_inv!6759 _keys!1456)))

(declare-fun b!354461 () Bool)

(assert (=> b!354461 (= e!217266 false)))

(declare-fun lt!165734 () Bool)

(declare-datatypes ((List!5207 0))(
  ( (Nil!5204) (Cons!5203 (h!6059 (_ BitVec 64)) (t!10349 List!5207)) )
))
(declare-fun arrayNoDuplicates!0 (array!19306 (_ BitVec 32) List!5207) Bool)

(assert (=> b!354461 (= lt!165734 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5204))))

(declare-fun b!354462 () Bool)

(declare-fun res!196511 () Bool)

(assert (=> b!354462 (=> (not res!196511) (not e!217266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19306 (_ BitVec 32)) Bool)

(assert (=> b!354462 (= res!196511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13308 () Bool)

(declare-fun mapRes!13308 () Bool)

(declare-fun tp!27204 () Bool)

(declare-fun e!217265 () Bool)

(assert (=> mapNonEmpty!13308 (= mapRes!13308 (and tp!27204 e!217265))))

(declare-fun mapRest!13308 () (Array (_ BitVec 32) ValueCell!3590))

(declare-fun mapKey!13308 () (_ BitVec 32))

(declare-fun mapValue!13308 () ValueCell!3590)

(assert (=> mapNonEmpty!13308 (= (arr!9147 _values!1208) (store mapRest!13308 mapKey!13308 mapValue!13308))))

(declare-fun b!354463 () Bool)

(assert (=> b!354463 (= e!217267 (and e!217263 mapRes!13308))))

(declare-fun condMapEmpty!13308 () Bool)

(declare-fun mapDefault!13308 () ValueCell!3590)

(assert (=> b!354463 (= condMapEmpty!13308 (= (arr!9147 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3590)) mapDefault!13308)))))

(declare-fun mapIsEmpty!13308 () Bool)

(assert (=> mapIsEmpty!13308 mapRes!13308))

(declare-fun b!354464 () Bool)

(assert (=> b!354464 (= e!217265 tp_is_empty!7867)))

(assert (= (and start!35400 res!196512) b!354459))

(assert (= (and b!354459 res!196513) b!354462))

(assert (= (and b!354462 res!196511) b!354461))

(assert (= (and b!354463 condMapEmpty!13308) mapIsEmpty!13308))

(assert (= (and b!354463 (not condMapEmpty!13308)) mapNonEmpty!13308))

(get-info :version)

(assert (= (and mapNonEmpty!13308 ((_ is ValueCellFull!3590) mapValue!13308)) b!354464))

(assert (= (and b!354463 ((_ is ValueCellFull!3590) mapDefault!13308)) b!354460))

(assert (= start!35400 b!354463))

(declare-fun m!353727 () Bool)

(assert (=> start!35400 m!353727))

(declare-fun m!353729 () Bool)

(assert (=> start!35400 m!353729))

(declare-fun m!353731 () Bool)

(assert (=> start!35400 m!353731))

(declare-fun m!353733 () Bool)

(assert (=> b!354461 m!353733))

(declare-fun m!353735 () Bool)

(assert (=> b!354462 m!353735))

(declare-fun m!353737 () Bool)

(assert (=> mapNonEmpty!13308 m!353737))

(check-sat (not mapNonEmpty!13308) (not b!354461) (not b!354462) (not start!35400) tp_is_empty!7867)
(check-sat)
