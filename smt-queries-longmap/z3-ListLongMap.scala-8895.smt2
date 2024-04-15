; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108010 () Bool)

(assert start!108010)

(declare-fun res!847910 () Bool)

(declare-fun e!728348 () Bool)

(assert (=> start!108010 (=> (not res!847910) (not e!728348))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108010 (= res!847910 (validMask!0 mask!1805))))

(assert (=> start!108010 e!728348))

(assert (=> start!108010 true))

(declare-datatypes ((V!49481 0))(
  ( (V!49482 (val!16716 Int)) )
))
(declare-datatypes ((ValueCell!15743 0))(
  ( (ValueCellFull!15743 (v!19312 V!49481)) (EmptyCell!15743) )
))
(declare-datatypes ((array!83573 0))(
  ( (array!83574 (arr!40299 (Array (_ BitVec 32) ValueCell!15743)) (size!40851 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83573)

(declare-fun e!728347 () Bool)

(declare-fun array_inv!30781 (array!83573) Bool)

(assert (=> start!108010 (and (array_inv!30781 _values!1187) e!728347)))

(declare-datatypes ((array!83575 0))(
  ( (array!83576 (arr!40300 (Array (_ BitVec 32) (_ BitVec 64))) (size!40852 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83575)

(declare-fun array_inv!30782 (array!83575) Bool)

(assert (=> start!108010 (array_inv!30782 _keys!1427)))

(declare-fun b!1275720 () Bool)

(declare-fun res!847911 () Bool)

(assert (=> b!1275720 (=> (not res!847911) (not e!728348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83575 (_ BitVec 32)) Bool)

(assert (=> b!1275720 (= res!847911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51452 () Bool)

(declare-fun mapRes!51452 () Bool)

(assert (=> mapIsEmpty!51452 mapRes!51452))

(declare-fun b!1275721 () Bool)

(declare-fun res!847909 () Bool)

(assert (=> b!1275721 (=> (not res!847909) (not e!728348))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275721 (= res!847909 (and (= (size!40851 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40852 _keys!1427) (size!40851 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275722 () Bool)

(declare-fun e!728346 () Bool)

(declare-fun tp_is_empty!33283 () Bool)

(assert (=> b!1275722 (= e!728346 tp_is_empty!33283)))

(declare-fun b!1275723 () Bool)

(declare-fun e!728350 () Bool)

(assert (=> b!1275723 (= e!728350 tp_is_empty!33283)))

(declare-fun mapNonEmpty!51452 () Bool)

(declare-fun tp!98211 () Bool)

(assert (=> mapNonEmpty!51452 (= mapRes!51452 (and tp!98211 e!728346))))

(declare-fun mapValue!51452 () ValueCell!15743)

(declare-fun mapKey!51452 () (_ BitVec 32))

(declare-fun mapRest!51452 () (Array (_ BitVec 32) ValueCell!15743))

(assert (=> mapNonEmpty!51452 (= (arr!40299 _values!1187) (store mapRest!51452 mapKey!51452 mapValue!51452))))

(declare-fun b!1275724 () Bool)

(assert (=> b!1275724 (= e!728347 (and e!728350 mapRes!51452))))

(declare-fun condMapEmpty!51452 () Bool)

(declare-fun mapDefault!51452 () ValueCell!15743)

(assert (=> b!1275724 (= condMapEmpty!51452 (= (arr!40299 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15743)) mapDefault!51452)))))

(declare-fun b!1275725 () Bool)

(assert (=> b!1275725 (= e!728348 false)))

(declare-fun lt!575214 () Bool)

(declare-datatypes ((List!28701 0))(
  ( (Nil!28698) (Cons!28697 (h!29906 (_ BitVec 64)) (t!42229 List!28701)) )
))
(declare-fun arrayNoDuplicates!0 (array!83575 (_ BitVec 32) List!28701) Bool)

(assert (=> b!1275725 (= lt!575214 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28698))))

(assert (= (and start!108010 res!847910) b!1275721))

(assert (= (and b!1275721 res!847909) b!1275720))

(assert (= (and b!1275720 res!847911) b!1275725))

(assert (= (and b!1275724 condMapEmpty!51452) mapIsEmpty!51452))

(assert (= (and b!1275724 (not condMapEmpty!51452)) mapNonEmpty!51452))

(get-info :version)

(assert (= (and mapNonEmpty!51452 ((_ is ValueCellFull!15743) mapValue!51452)) b!1275722))

(assert (= (and b!1275724 ((_ is ValueCellFull!15743) mapDefault!51452)) b!1275723))

(assert (= start!108010 b!1275724))

(declare-fun m!1171407 () Bool)

(assert (=> start!108010 m!1171407))

(declare-fun m!1171409 () Bool)

(assert (=> start!108010 m!1171409))

(declare-fun m!1171411 () Bool)

(assert (=> start!108010 m!1171411))

(declare-fun m!1171413 () Bool)

(assert (=> b!1275720 m!1171413))

(declare-fun m!1171415 () Bool)

(assert (=> mapNonEmpty!51452 m!1171415))

(declare-fun m!1171417 () Bool)

(assert (=> b!1275725 m!1171417))

(check-sat (not start!108010) (not mapNonEmpty!51452) (not b!1275725) tp_is_empty!33283 (not b!1275720))
(check-sat)
