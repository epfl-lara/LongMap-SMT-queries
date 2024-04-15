; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107000 () Bool)

(assert start!107000)

(declare-fun b!1268635 () Bool)

(declare-fun res!844355 () Bool)

(declare-fun e!722973 () Bool)

(assert (=> b!1268635 (=> (not res!844355) (not e!722973))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82567 0))(
  ( (array!82568 (arr!39821 (Array (_ BitVec 32) (_ BitVec 64))) (size!40359 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82567)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-datatypes ((V!48779 0))(
  ( (V!48780 (val!16419 Int)) )
))
(declare-datatypes ((ValueCell!15491 0))(
  ( (ValueCellFull!15491 (v!19055 V!48779)) (EmptyCell!15491) )
))
(declare-datatypes ((array!82569 0))(
  ( (array!82570 (arr!39822 (Array (_ BitVec 32) ValueCell!15491)) (size!40360 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82569)

(assert (=> b!1268635 (= res!844355 (and (= (size!40360 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40359 _keys!1364) (size!40360 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!844353 () Bool)

(assert (=> start!107000 (=> (not res!844353) (not e!722973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107000 (= res!844353 (validMask!0 mask!1730))))

(assert (=> start!107000 e!722973))

(declare-fun e!722970 () Bool)

(declare-fun array_inv!30467 (array!82569) Bool)

(assert (=> start!107000 (and (array_inv!30467 _values!1134) e!722970)))

(assert (=> start!107000 true))

(declare-fun array_inv!30468 (array!82567) Bool)

(assert (=> start!107000 (array_inv!30468 _keys!1364)))

(declare-fun mapNonEmpty!50614 () Bool)

(declare-fun mapRes!50614 () Bool)

(declare-fun tp!96794 () Bool)

(declare-fun e!722972 () Bool)

(assert (=> mapNonEmpty!50614 (= mapRes!50614 (and tp!96794 e!722972))))

(declare-fun mapRest!50614 () (Array (_ BitVec 32) ValueCell!15491))

(declare-fun mapKey!50614 () (_ BitVec 32))

(declare-fun mapValue!50614 () ValueCell!15491)

(assert (=> mapNonEmpty!50614 (= (arr!39822 _values!1134) (store mapRest!50614 mapKey!50614 mapValue!50614))))

(declare-fun b!1268636 () Bool)

(declare-fun e!722971 () Bool)

(declare-fun tp_is_empty!32689 () Bool)

(assert (=> b!1268636 (= e!722971 tp_is_empty!32689)))

(declare-fun mapIsEmpty!50614 () Bool)

(assert (=> mapIsEmpty!50614 mapRes!50614))

(declare-fun b!1268637 () Bool)

(declare-fun res!844354 () Bool)

(assert (=> b!1268637 (=> (not res!844354) (not e!722973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82567 (_ BitVec 32)) Bool)

(assert (=> b!1268637 (= res!844354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268638 () Bool)

(assert (=> b!1268638 (= e!722973 false)))

(declare-fun lt!574292 () Bool)

(declare-datatypes ((List!28476 0))(
  ( (Nil!28473) (Cons!28472 (h!29681 (_ BitVec 64)) (t!41997 List!28476)) )
))
(declare-fun arrayNoDuplicates!0 (array!82567 (_ BitVec 32) List!28476) Bool)

(assert (=> b!1268638 (= lt!574292 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28473))))

(declare-fun b!1268639 () Bool)

(assert (=> b!1268639 (= e!722972 tp_is_empty!32689)))

(declare-fun b!1268640 () Bool)

(assert (=> b!1268640 (= e!722970 (and e!722971 mapRes!50614))))

(declare-fun condMapEmpty!50614 () Bool)

(declare-fun mapDefault!50614 () ValueCell!15491)

(assert (=> b!1268640 (= condMapEmpty!50614 (= (arr!39822 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15491)) mapDefault!50614)))))

(assert (= (and start!107000 res!844353) b!1268635))

(assert (= (and b!1268635 res!844355) b!1268637))

(assert (= (and b!1268637 res!844354) b!1268638))

(assert (= (and b!1268640 condMapEmpty!50614) mapIsEmpty!50614))

(assert (= (and b!1268640 (not condMapEmpty!50614)) mapNonEmpty!50614))

(get-info :version)

(assert (= (and mapNonEmpty!50614 ((_ is ValueCellFull!15491) mapValue!50614)) b!1268639))

(assert (= (and b!1268640 ((_ is ValueCellFull!15491) mapDefault!50614)) b!1268636))

(assert (= start!107000 b!1268640))

(declare-fun m!1166955 () Bool)

(assert (=> start!107000 m!1166955))

(declare-fun m!1166957 () Bool)

(assert (=> start!107000 m!1166957))

(declare-fun m!1166959 () Bool)

(assert (=> start!107000 m!1166959))

(declare-fun m!1166961 () Bool)

(assert (=> mapNonEmpty!50614 m!1166961))

(declare-fun m!1166963 () Bool)

(assert (=> b!1268637 m!1166963))

(declare-fun m!1166965 () Bool)

(assert (=> b!1268638 m!1166965))

(check-sat (not start!107000) (not b!1268638) (not mapNonEmpty!50614) (not b!1268637) tp_is_empty!32689)
(check-sat)
