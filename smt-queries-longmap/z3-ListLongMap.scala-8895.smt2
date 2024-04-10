; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108012 () Bool)

(assert start!108012)

(declare-fun mapIsEmpty!51455 () Bool)

(declare-fun mapRes!51455 () Bool)

(assert (=> mapIsEmpty!51455 mapRes!51455))

(declare-fun b!1275802 () Bool)

(declare-fun res!847947 () Bool)

(declare-fun e!728394 () Bool)

(assert (=> b!1275802 (=> (not res!847947) (not e!728394))))

(declare-datatypes ((array!83672 0))(
  ( (array!83673 (arr!40348 (Array (_ BitVec 32) (_ BitVec 64))) (size!40898 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83672)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83672 (_ BitVec 32)) Bool)

(assert (=> b!1275802 (= res!847947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275803 () Bool)

(declare-fun e!728392 () Bool)

(declare-fun tp_is_empty!33285 () Bool)

(assert (=> b!1275803 (= e!728392 tp_is_empty!33285)))

(declare-fun res!847945 () Bool)

(assert (=> start!108012 (=> (not res!847945) (not e!728394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108012 (= res!847945 (validMask!0 mask!1805))))

(assert (=> start!108012 e!728394))

(assert (=> start!108012 true))

(declare-datatypes ((V!49483 0))(
  ( (V!49484 (val!16717 Int)) )
))
(declare-datatypes ((ValueCell!15744 0))(
  ( (ValueCellFull!15744 (v!19314 V!49483)) (EmptyCell!15744) )
))
(declare-datatypes ((array!83674 0))(
  ( (array!83675 (arr!40349 (Array (_ BitVec 32) ValueCell!15744)) (size!40899 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83674)

(declare-fun e!728390 () Bool)

(declare-fun array_inv!30669 (array!83674) Bool)

(assert (=> start!108012 (and (array_inv!30669 _values!1187) e!728390)))

(declare-fun array_inv!30670 (array!83672) Bool)

(assert (=> start!108012 (array_inv!30670 _keys!1427)))

(declare-fun b!1275804 () Bool)

(declare-fun res!847946 () Bool)

(assert (=> b!1275804 (=> (not res!847946) (not e!728394))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275804 (= res!847946 (and (= (size!40899 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40898 _keys!1427) (size!40899 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275805 () Bool)

(declare-fun e!728393 () Bool)

(assert (=> b!1275805 (= e!728393 tp_is_empty!33285)))

(declare-fun b!1275806 () Bool)

(assert (=> b!1275806 (= e!728394 false)))

(declare-fun lt!575395 () Bool)

(declare-datatypes ((List!28625 0))(
  ( (Nil!28622) (Cons!28621 (h!29830 (_ BitVec 64)) (t!42161 List!28625)) )
))
(declare-fun arrayNoDuplicates!0 (array!83672 (_ BitVec 32) List!28625) Bool)

(assert (=> b!1275806 (= lt!575395 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28622))))

(declare-fun b!1275807 () Bool)

(assert (=> b!1275807 (= e!728390 (and e!728392 mapRes!51455))))

(declare-fun condMapEmpty!51455 () Bool)

(declare-fun mapDefault!51455 () ValueCell!15744)

(assert (=> b!1275807 (= condMapEmpty!51455 (= (arr!40349 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15744)) mapDefault!51455)))))

(declare-fun mapNonEmpty!51455 () Bool)

(declare-fun tp!98213 () Bool)

(assert (=> mapNonEmpty!51455 (= mapRes!51455 (and tp!98213 e!728393))))

(declare-fun mapKey!51455 () (_ BitVec 32))

(declare-fun mapRest!51455 () (Array (_ BitVec 32) ValueCell!15744))

(declare-fun mapValue!51455 () ValueCell!15744)

(assert (=> mapNonEmpty!51455 (= (arr!40349 _values!1187) (store mapRest!51455 mapKey!51455 mapValue!51455))))

(assert (= (and start!108012 res!847945) b!1275804))

(assert (= (and b!1275804 res!847946) b!1275802))

(assert (= (and b!1275802 res!847947) b!1275806))

(assert (= (and b!1275807 condMapEmpty!51455) mapIsEmpty!51455))

(assert (= (and b!1275807 (not condMapEmpty!51455)) mapNonEmpty!51455))

(get-info :version)

(assert (= (and mapNonEmpty!51455 ((_ is ValueCellFull!15744) mapValue!51455)) b!1275805))

(assert (= (and b!1275807 ((_ is ValueCellFull!15744) mapDefault!51455)) b!1275803))

(assert (= start!108012 b!1275807))

(declare-fun m!1171919 () Bool)

(assert (=> b!1275802 m!1171919))

(declare-fun m!1171921 () Bool)

(assert (=> start!108012 m!1171921))

(declare-fun m!1171923 () Bool)

(assert (=> start!108012 m!1171923))

(declare-fun m!1171925 () Bool)

(assert (=> start!108012 m!1171925))

(declare-fun m!1171927 () Bool)

(assert (=> b!1275806 m!1171927))

(declare-fun m!1171929 () Bool)

(assert (=> mapNonEmpty!51455 m!1171929))

(check-sat (not mapNonEmpty!51455) (not b!1275806) tp_is_empty!33285 (not start!108012) (not b!1275802))
(check-sat)
