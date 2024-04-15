; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107222 () Bool)

(assert start!107222)

(declare-fun b!1270957 () Bool)

(declare-fun res!845678 () Bool)

(declare-fun e!724635 () Bool)

(assert (=> b!1270957 (=> (not res!845678) (not e!724635))))

(declare-datatypes ((V!49075 0))(
  ( (V!49076 (val!16530 Int)) )
))
(declare-datatypes ((ValueCell!15602 0))(
  ( (ValueCellFull!15602 (v!19166 V!49075)) (EmptyCell!15602) )
))
(declare-datatypes ((array!82991 0))(
  ( (array!82992 (arr!40033 (Array (_ BitVec 32) ValueCell!15602)) (size!40571 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82991)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82993 0))(
  ( (array!82994 (arr!40034 (Array (_ BitVec 32) (_ BitVec 64))) (size!40572 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82993)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270957 (= res!845678 (and (= (size!40571 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40572 _keys!1364) (size!40571 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50947 () Bool)

(declare-fun mapRes!50947 () Bool)

(declare-fun tp!97289 () Bool)

(declare-fun e!724637 () Bool)

(assert (=> mapNonEmpty!50947 (= mapRes!50947 (and tp!97289 e!724637))))

(declare-fun mapValue!50947 () ValueCell!15602)

(declare-fun mapRest!50947 () (Array (_ BitVec 32) ValueCell!15602))

(declare-fun mapKey!50947 () (_ BitVec 32))

(assert (=> mapNonEmpty!50947 (= (arr!40033 _values!1134) (store mapRest!50947 mapKey!50947 mapValue!50947))))

(declare-fun b!1270958 () Bool)

(declare-fun res!845677 () Bool)

(assert (=> b!1270958 (=> (not res!845677) (not e!724635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82993 (_ BitVec 32)) Bool)

(assert (=> b!1270958 (= res!845677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270959 () Bool)

(declare-fun tp_is_empty!32911 () Bool)

(assert (=> b!1270959 (= e!724637 tp_is_empty!32911)))

(declare-fun b!1270960 () Bool)

(declare-fun e!724636 () Bool)

(assert (=> b!1270960 (= e!724636 tp_is_empty!32911)))

(declare-fun mapIsEmpty!50947 () Bool)

(assert (=> mapIsEmpty!50947 mapRes!50947))

(declare-fun b!1270961 () Bool)

(assert (=> b!1270961 (= e!724635 false)))

(declare-fun lt!574625 () Bool)

(declare-datatypes ((List!28589 0))(
  ( (Nil!28586) (Cons!28585 (h!29794 (_ BitVec 64)) (t!42110 List!28589)) )
))
(declare-fun arrayNoDuplicates!0 (array!82993 (_ BitVec 32) List!28589) Bool)

(assert (=> b!1270961 (= lt!574625 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28586))))

(declare-fun b!1270962 () Bool)

(declare-fun e!724638 () Bool)

(assert (=> b!1270962 (= e!724638 (and e!724636 mapRes!50947))))

(declare-fun condMapEmpty!50947 () Bool)

(declare-fun mapDefault!50947 () ValueCell!15602)

(assert (=> b!1270962 (= condMapEmpty!50947 (= (arr!40033 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15602)) mapDefault!50947)))))

(declare-fun res!845676 () Bool)

(assert (=> start!107222 (=> (not res!845676) (not e!724635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107222 (= res!845676 (validMask!0 mask!1730))))

(assert (=> start!107222 e!724635))

(declare-fun array_inv!30609 (array!82991) Bool)

(assert (=> start!107222 (and (array_inv!30609 _values!1134) e!724638)))

(assert (=> start!107222 true))

(declare-fun array_inv!30610 (array!82993) Bool)

(assert (=> start!107222 (array_inv!30610 _keys!1364)))

(assert (= (and start!107222 res!845676) b!1270957))

(assert (= (and b!1270957 res!845678) b!1270958))

(assert (= (and b!1270958 res!845677) b!1270961))

(assert (= (and b!1270962 condMapEmpty!50947) mapIsEmpty!50947))

(assert (= (and b!1270962 (not condMapEmpty!50947)) mapNonEmpty!50947))

(get-info :version)

(assert (= (and mapNonEmpty!50947 ((_ is ValueCellFull!15602) mapValue!50947)) b!1270959))

(assert (= (and b!1270962 ((_ is ValueCellFull!15602) mapDefault!50947)) b!1270960))

(assert (= start!107222 b!1270962))

(declare-fun m!1168611 () Bool)

(assert (=> mapNonEmpty!50947 m!1168611))

(declare-fun m!1168613 () Bool)

(assert (=> b!1270958 m!1168613))

(declare-fun m!1168615 () Bool)

(assert (=> b!1270961 m!1168615))

(declare-fun m!1168617 () Bool)

(assert (=> start!107222 m!1168617))

(declare-fun m!1168619 () Bool)

(assert (=> start!107222 m!1168619))

(declare-fun m!1168621 () Bool)

(assert (=> start!107222 m!1168621))

(check-sat (not b!1270961) (not start!107222) tp_is_empty!32911 (not b!1270958) (not mapNonEmpty!50947))
(check-sat)
