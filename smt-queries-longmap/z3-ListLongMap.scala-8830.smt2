; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107204 () Bool)

(assert start!107204)

(declare-fun b!1270795 () Bool)

(declare-fun e!724503 () Bool)

(declare-fun tp_is_empty!32893 () Bool)

(assert (=> b!1270795 (= e!724503 tp_is_empty!32893)))

(declare-fun res!845596 () Bool)

(declare-fun e!724504 () Bool)

(assert (=> start!107204 (=> (not res!845596) (not e!724504))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107204 (= res!845596 (validMask!0 mask!1730))))

(assert (=> start!107204 e!724504))

(declare-datatypes ((V!49051 0))(
  ( (V!49052 (val!16521 Int)) )
))
(declare-datatypes ((ValueCell!15593 0))(
  ( (ValueCellFull!15593 (v!19157 V!49051)) (EmptyCell!15593) )
))
(declare-datatypes ((array!82955 0))(
  ( (array!82956 (arr!40015 (Array (_ BitVec 32) ValueCell!15593)) (size!40553 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82955)

(declare-fun e!724501 () Bool)

(declare-fun array_inv!30599 (array!82955) Bool)

(assert (=> start!107204 (and (array_inv!30599 _values!1134) e!724501)))

(assert (=> start!107204 true))

(declare-datatypes ((array!82957 0))(
  ( (array!82958 (arr!40016 (Array (_ BitVec 32) (_ BitVec 64))) (size!40554 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82957)

(declare-fun array_inv!30600 (array!82957) Bool)

(assert (=> start!107204 (array_inv!30600 _keys!1364)))

(declare-fun b!1270796 () Bool)

(declare-fun res!845597 () Bool)

(assert (=> b!1270796 (=> (not res!845597) (not e!724504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82957 (_ BitVec 32)) Bool)

(assert (=> b!1270796 (= res!845597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270797 () Bool)

(declare-fun res!845595 () Bool)

(assert (=> b!1270797 (=> (not res!845595) (not e!724504))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270797 (= res!845595 (and (= (size!40553 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40554 _keys!1364) (size!40553 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270798 () Bool)

(assert (=> b!1270798 (= e!724504 false)))

(declare-fun lt!574598 () Bool)

(declare-datatypes ((List!28582 0))(
  ( (Nil!28579) (Cons!28578 (h!29787 (_ BitVec 64)) (t!42103 List!28582)) )
))
(declare-fun arrayNoDuplicates!0 (array!82957 (_ BitVec 32) List!28582) Bool)

(assert (=> b!1270798 (= lt!574598 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28579))))

(declare-fun mapNonEmpty!50920 () Bool)

(declare-fun mapRes!50920 () Bool)

(declare-fun tp!97262 () Bool)

(assert (=> mapNonEmpty!50920 (= mapRes!50920 (and tp!97262 e!724503))))

(declare-fun mapRest!50920 () (Array (_ BitVec 32) ValueCell!15593))

(declare-fun mapKey!50920 () (_ BitVec 32))

(declare-fun mapValue!50920 () ValueCell!15593)

(assert (=> mapNonEmpty!50920 (= (arr!40015 _values!1134) (store mapRest!50920 mapKey!50920 mapValue!50920))))

(declare-fun mapIsEmpty!50920 () Bool)

(assert (=> mapIsEmpty!50920 mapRes!50920))

(declare-fun b!1270799 () Bool)

(declare-fun e!724500 () Bool)

(assert (=> b!1270799 (= e!724501 (and e!724500 mapRes!50920))))

(declare-fun condMapEmpty!50920 () Bool)

(declare-fun mapDefault!50920 () ValueCell!15593)

(assert (=> b!1270799 (= condMapEmpty!50920 (= (arr!40015 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15593)) mapDefault!50920)))))

(declare-fun b!1270800 () Bool)

(assert (=> b!1270800 (= e!724500 tp_is_empty!32893)))

(assert (= (and start!107204 res!845596) b!1270797))

(assert (= (and b!1270797 res!845595) b!1270796))

(assert (= (and b!1270796 res!845597) b!1270798))

(assert (= (and b!1270799 condMapEmpty!50920) mapIsEmpty!50920))

(assert (= (and b!1270799 (not condMapEmpty!50920)) mapNonEmpty!50920))

(get-info :version)

(assert (= (and mapNonEmpty!50920 ((_ is ValueCellFull!15593) mapValue!50920)) b!1270795))

(assert (= (and b!1270799 ((_ is ValueCellFull!15593) mapDefault!50920)) b!1270800))

(assert (= start!107204 b!1270799))

(declare-fun m!1168503 () Bool)

(assert (=> start!107204 m!1168503))

(declare-fun m!1168505 () Bool)

(assert (=> start!107204 m!1168505))

(declare-fun m!1168507 () Bool)

(assert (=> start!107204 m!1168507))

(declare-fun m!1168509 () Bool)

(assert (=> b!1270796 m!1168509))

(declare-fun m!1168511 () Bool)

(assert (=> b!1270798 m!1168511))

(declare-fun m!1168513 () Bool)

(assert (=> mapNonEmpty!50920 m!1168513))

(check-sat tp_is_empty!32893 (not b!1270796) (not mapNonEmpty!50920) (not b!1270798) (not start!107204))
(check-sat)
