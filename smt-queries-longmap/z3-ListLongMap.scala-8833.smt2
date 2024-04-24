; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107446 () Bool)

(assert start!107446)

(declare-fun b!1272326 () Bool)

(declare-fun e!725511 () Bool)

(declare-fun tp_is_empty!32911 () Bool)

(assert (=> b!1272326 (= e!725511 tp_is_empty!32911)))

(declare-fun b!1272327 () Bool)

(declare-fun e!725515 () Bool)

(assert (=> b!1272327 (= e!725515 false)))

(declare-fun lt!575287 () Bool)

(declare-datatypes ((array!83105 0))(
  ( (array!83106 (arr!40085 (Array (_ BitVec 32) (_ BitVec 64))) (size!40622 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83105)

(declare-datatypes ((List!28542 0))(
  ( (Nil!28539) (Cons!28538 (h!29756 (_ BitVec 64)) (t!42063 List!28542)) )
))
(declare-fun arrayNoDuplicates!0 (array!83105 (_ BitVec 32) List!28542) Bool)

(assert (=> b!1272327 (= lt!575287 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28539))))

(declare-fun res!846224 () Bool)

(assert (=> start!107446 (=> (not res!846224) (not e!725515))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107446 (= res!846224 (validMask!0 mask!1730))))

(assert (=> start!107446 e!725515))

(declare-datatypes ((V!49075 0))(
  ( (V!49076 (val!16530 Int)) )
))
(declare-datatypes ((ValueCell!15602 0))(
  ( (ValueCellFull!15602 (v!19162 V!49075)) (EmptyCell!15602) )
))
(declare-datatypes ((array!83107 0))(
  ( (array!83108 (arr!40086 (Array (_ BitVec 32) ValueCell!15602)) (size!40623 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83107)

(declare-fun e!725512 () Bool)

(declare-fun array_inv!30659 (array!83107) Bool)

(assert (=> start!107446 (and (array_inv!30659 _values!1134) e!725512)))

(assert (=> start!107446 true))

(declare-fun array_inv!30660 (array!83105) Bool)

(assert (=> start!107446 (array_inv!30660 _keys!1364)))

(declare-fun b!1272328 () Bool)

(declare-fun mapRes!50947 () Bool)

(assert (=> b!1272328 (= e!725512 (and e!725511 mapRes!50947))))

(declare-fun condMapEmpty!50947 () Bool)

(declare-fun mapDefault!50947 () ValueCell!15602)

(assert (=> b!1272328 (= condMapEmpty!50947 (= (arr!40086 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15602)) mapDefault!50947)))))

(declare-fun b!1272329 () Bool)

(declare-fun res!846223 () Bool)

(assert (=> b!1272329 (=> (not res!846223) (not e!725515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83105 (_ BitVec 32)) Bool)

(assert (=> b!1272329 (= res!846223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272330 () Bool)

(declare-fun res!846225 () Bool)

(assert (=> b!1272330 (=> (not res!846225) (not e!725515))))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(assert (=> b!1272330 (= res!846225 (and (= (size!40623 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40622 _keys!1364) (size!40623 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50947 () Bool)

(assert (=> mapIsEmpty!50947 mapRes!50947))

(declare-fun b!1272331 () Bool)

(declare-fun e!725513 () Bool)

(assert (=> b!1272331 (= e!725513 tp_is_empty!32911)))

(declare-fun mapNonEmpty!50947 () Bool)

(declare-fun tp!97288 () Bool)

(assert (=> mapNonEmpty!50947 (= mapRes!50947 (and tp!97288 e!725513))))

(declare-fun mapRest!50947 () (Array (_ BitVec 32) ValueCell!15602))

(declare-fun mapKey!50947 () (_ BitVec 32))

(declare-fun mapValue!50947 () ValueCell!15602)

(assert (=> mapNonEmpty!50947 (= (arr!40086 _values!1134) (store mapRest!50947 mapKey!50947 mapValue!50947))))

(assert (= (and start!107446 res!846224) b!1272330))

(assert (= (and b!1272330 res!846225) b!1272329))

(assert (= (and b!1272329 res!846223) b!1272327))

(assert (= (and b!1272328 condMapEmpty!50947) mapIsEmpty!50947))

(assert (= (and b!1272328 (not condMapEmpty!50947)) mapNonEmpty!50947))

(get-info :version)

(assert (= (and mapNonEmpty!50947 ((_ is ValueCellFull!15602) mapValue!50947)) b!1272331))

(assert (= (and b!1272328 ((_ is ValueCellFull!15602) mapDefault!50947)) b!1272326))

(assert (= start!107446 b!1272328))

(declare-fun m!1170723 () Bool)

(assert (=> b!1272327 m!1170723))

(declare-fun m!1170725 () Bool)

(assert (=> start!107446 m!1170725))

(declare-fun m!1170727 () Bool)

(assert (=> start!107446 m!1170727))

(declare-fun m!1170729 () Bool)

(assert (=> start!107446 m!1170729))

(declare-fun m!1170731 () Bool)

(assert (=> b!1272329 m!1170731))

(declare-fun m!1170733 () Bool)

(assert (=> mapNonEmpty!50947 m!1170733))

(check-sat (not start!107446) (not b!1272327) (not mapNonEmpty!50947) (not b!1272329) tp_is_empty!32911)
(check-sat)
