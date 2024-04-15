; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107998 () Bool)

(assert start!107998)

(declare-fun b!1275612 () Bool)

(declare-fun e!728257 () Bool)

(declare-fun e!728258 () Bool)

(declare-fun mapRes!51434 () Bool)

(assert (=> b!1275612 (= e!728257 (and e!728258 mapRes!51434))))

(declare-fun condMapEmpty!51434 () Bool)

(declare-datatypes ((V!49465 0))(
  ( (V!49466 (val!16710 Int)) )
))
(declare-datatypes ((ValueCell!15737 0))(
  ( (ValueCellFull!15737 (v!19306 V!49465)) (EmptyCell!15737) )
))
(declare-datatypes ((array!83549 0))(
  ( (array!83550 (arr!40287 (Array (_ BitVec 32) ValueCell!15737)) (size!40839 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83549)

(declare-fun mapDefault!51434 () ValueCell!15737)

(assert (=> b!1275612 (= condMapEmpty!51434 (= (arr!40287 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15737)) mapDefault!51434)))))

(declare-fun b!1275613 () Bool)

(declare-fun res!847857 () Bool)

(declare-fun e!728256 () Bool)

(assert (=> b!1275613 (=> (not res!847857) (not e!728256))))

(declare-datatypes ((array!83551 0))(
  ( (array!83552 (arr!40288 (Array (_ BitVec 32) (_ BitVec 64))) (size!40840 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83551)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83551 (_ BitVec 32)) Bool)

(assert (=> b!1275613 (= res!847857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275614 () Bool)

(assert (=> b!1275614 (= e!728256 false)))

(declare-fun lt!575196 () Bool)

(declare-datatypes ((List!28695 0))(
  ( (Nil!28692) (Cons!28691 (h!29900 (_ BitVec 64)) (t!42223 List!28695)) )
))
(declare-fun arrayNoDuplicates!0 (array!83551 (_ BitVec 32) List!28695) Bool)

(assert (=> b!1275614 (= lt!575196 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28692))))

(declare-fun res!847856 () Bool)

(assert (=> start!107998 (=> (not res!847856) (not e!728256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107998 (= res!847856 (validMask!0 mask!1805))))

(assert (=> start!107998 e!728256))

(assert (=> start!107998 true))

(declare-fun array_inv!30775 (array!83549) Bool)

(assert (=> start!107998 (and (array_inv!30775 _values!1187) e!728257)))

(declare-fun array_inv!30776 (array!83551) Bool)

(assert (=> start!107998 (array_inv!30776 _keys!1427)))

(declare-fun mapNonEmpty!51434 () Bool)

(declare-fun tp!98193 () Bool)

(declare-fun e!728260 () Bool)

(assert (=> mapNonEmpty!51434 (= mapRes!51434 (and tp!98193 e!728260))))

(declare-fun mapValue!51434 () ValueCell!15737)

(declare-fun mapRest!51434 () (Array (_ BitVec 32) ValueCell!15737))

(declare-fun mapKey!51434 () (_ BitVec 32))

(assert (=> mapNonEmpty!51434 (= (arr!40287 _values!1187) (store mapRest!51434 mapKey!51434 mapValue!51434))))

(declare-fun b!1275615 () Bool)

(declare-fun tp_is_empty!33271 () Bool)

(assert (=> b!1275615 (= e!728260 tp_is_empty!33271)))

(declare-fun b!1275616 () Bool)

(declare-fun res!847855 () Bool)

(assert (=> b!1275616 (=> (not res!847855) (not e!728256))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275616 (= res!847855 (and (= (size!40839 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40840 _keys!1427) (size!40839 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275617 () Bool)

(assert (=> b!1275617 (= e!728258 tp_is_empty!33271)))

(declare-fun mapIsEmpty!51434 () Bool)

(assert (=> mapIsEmpty!51434 mapRes!51434))

(assert (= (and start!107998 res!847856) b!1275616))

(assert (= (and b!1275616 res!847855) b!1275613))

(assert (= (and b!1275613 res!847857) b!1275614))

(assert (= (and b!1275612 condMapEmpty!51434) mapIsEmpty!51434))

(assert (= (and b!1275612 (not condMapEmpty!51434)) mapNonEmpty!51434))

(get-info :version)

(assert (= (and mapNonEmpty!51434 ((_ is ValueCellFull!15737) mapValue!51434)) b!1275615))

(assert (= (and b!1275612 ((_ is ValueCellFull!15737) mapDefault!51434)) b!1275617))

(assert (= start!107998 b!1275612))

(declare-fun m!1171335 () Bool)

(assert (=> b!1275613 m!1171335))

(declare-fun m!1171337 () Bool)

(assert (=> b!1275614 m!1171337))

(declare-fun m!1171339 () Bool)

(assert (=> start!107998 m!1171339))

(declare-fun m!1171341 () Bool)

(assert (=> start!107998 m!1171341))

(declare-fun m!1171343 () Bool)

(assert (=> start!107998 m!1171343))

(declare-fun m!1171345 () Bool)

(assert (=> mapNonEmpty!51434 m!1171345))

(check-sat (not b!1275614) (not b!1275613) (not start!107998) (not mapNonEmpty!51434) tp_is_empty!33271)
(check-sat)
