; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108252 () Bool)

(assert start!108252)

(declare-fun b!1277251 () Bool)

(declare-fun res!848537 () Bool)

(declare-fun e!729360 () Bool)

(assert (=> b!1277251 (=> (not res!848537) (not e!729360))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83725 0))(
  ( (array!83726 (arr!40370 (Array (_ BitVec 32) (_ BitVec 64))) (size!40921 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83725)

(declare-datatypes ((V!49505 0))(
  ( (V!49506 (val!16725 Int)) )
))
(declare-datatypes ((ValueCell!15752 0))(
  ( (ValueCellFull!15752 (v!19317 V!49505)) (EmptyCell!15752) )
))
(declare-datatypes ((array!83727 0))(
  ( (array!83728 (arr!40371 (Array (_ BitVec 32) ValueCell!15752)) (size!40922 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83727)

(assert (=> b!1277251 (= res!848537 (and (= (size!40922 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40921 _keys!1427) (size!40922 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277252 () Bool)

(declare-fun e!729357 () Bool)

(declare-fun tp_is_empty!33301 () Bool)

(assert (=> b!1277252 (= e!729357 tp_is_empty!33301)))

(declare-fun b!1277253 () Bool)

(declare-fun res!848538 () Bool)

(assert (=> b!1277253 (=> (not res!848538) (not e!729360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83725 (_ BitVec 32)) Bool)

(assert (=> b!1277253 (= res!848538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun res!848539 () Bool)

(assert (=> start!108252 (=> (not res!848539) (not e!729360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108252 (= res!848539 (validMask!0 mask!1805))))

(assert (=> start!108252 e!729360))

(assert (=> start!108252 true))

(declare-fun e!729358 () Bool)

(declare-fun array_inv!30873 (array!83727) Bool)

(assert (=> start!108252 (and (array_inv!30873 _values!1187) e!729358)))

(declare-fun array_inv!30874 (array!83725) Bool)

(assert (=> start!108252 (array_inv!30874 _keys!1427)))

(declare-fun mapNonEmpty!51479 () Bool)

(declare-fun mapRes!51479 () Bool)

(declare-fun tp!98237 () Bool)

(assert (=> mapNonEmpty!51479 (= mapRes!51479 (and tp!98237 e!729357))))

(declare-fun mapValue!51479 () ValueCell!15752)

(declare-fun mapKey!51479 () (_ BitVec 32))

(declare-fun mapRest!51479 () (Array (_ BitVec 32) ValueCell!15752))

(assert (=> mapNonEmpty!51479 (= (arr!40371 _values!1187) (store mapRest!51479 mapKey!51479 mapValue!51479))))

(declare-fun b!1277254 () Bool)

(assert (=> b!1277254 (= e!729360 false)))

(declare-fun lt!575903 () Bool)

(declare-datatypes ((List!28659 0))(
  ( (Nil!28656) (Cons!28655 (h!29873 (_ BitVec 64)) (t!42187 List!28659)) )
))
(declare-fun arrayNoDuplicates!0 (array!83725 (_ BitVec 32) List!28659) Bool)

(assert (=> b!1277254 (= lt!575903 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28656))))

(declare-fun b!1277255 () Bool)

(declare-fun e!729361 () Bool)

(assert (=> b!1277255 (= e!729358 (and e!729361 mapRes!51479))))

(declare-fun condMapEmpty!51479 () Bool)

(declare-fun mapDefault!51479 () ValueCell!15752)

(assert (=> b!1277255 (= condMapEmpty!51479 (= (arr!40371 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15752)) mapDefault!51479)))))

(declare-fun b!1277256 () Bool)

(assert (=> b!1277256 (= e!729361 tp_is_empty!33301)))

(declare-fun mapIsEmpty!51479 () Bool)

(assert (=> mapIsEmpty!51479 mapRes!51479))

(assert (= (and start!108252 res!848539) b!1277251))

(assert (= (and b!1277251 res!848537) b!1277253))

(assert (= (and b!1277253 res!848538) b!1277254))

(assert (= (and b!1277255 condMapEmpty!51479) mapIsEmpty!51479))

(assert (= (and b!1277255 (not condMapEmpty!51479)) mapNonEmpty!51479))

(get-info :version)

(assert (= (and mapNonEmpty!51479 ((_ is ValueCellFull!15752) mapValue!51479)) b!1277252))

(assert (= (and b!1277255 ((_ is ValueCellFull!15752) mapDefault!51479)) b!1277256))

(assert (= start!108252 b!1277255))

(declare-fun m!1173627 () Bool)

(assert (=> b!1277253 m!1173627))

(declare-fun m!1173629 () Bool)

(assert (=> start!108252 m!1173629))

(declare-fun m!1173631 () Bool)

(assert (=> start!108252 m!1173631))

(declare-fun m!1173633 () Bool)

(assert (=> start!108252 m!1173633))

(declare-fun m!1173635 () Bool)

(assert (=> mapNonEmpty!51479 m!1173635))

(declare-fun m!1173637 () Bool)

(assert (=> b!1277254 m!1173637))

(check-sat (not mapNonEmpty!51479) (not start!108252) (not b!1277253) tp_is_empty!33301 (not b!1277254))
(check-sat)
