; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107102 () Bool)

(assert start!107102)

(declare-fun b_free!27607 () Bool)

(declare-fun b_next!27607 () Bool)

(assert (=> start!107102 (= b_free!27607 (not b_next!27607))))

(declare-fun tp!97048 () Bool)

(declare-fun b_and!45621 () Bool)

(assert (=> start!107102 (= tp!97048 b_and!45621)))

(declare-fun b!1269755 () Bool)

(declare-fun e!723736 () Bool)

(assert (=> b!1269755 (= e!723736 (not true))))

(declare-datatypes ((V!48915 0))(
  ( (V!48916 (val!16470 Int)) )
))
(declare-datatypes ((ValueCell!15542 0))(
  ( (ValueCellFull!15542 (v!19106 V!48915)) (EmptyCell!15542) )
))
(declare-datatypes ((array!82759 0))(
  ( (array!82760 (arr!39917 (Array (_ BitVec 32) ValueCell!15542)) (size!40455 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82759)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82761 0))(
  ( (array!82762 (arr!39918 (Array (_ BitVec 32) (_ BitVec 64))) (size!40456 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82761)

(declare-fun minValueAfter!52 () V!48915)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48915)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48915)

(declare-fun zeroValueBefore!52 () V!48915)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21416 0))(
  ( (tuple2!21417 (_1!10719 (_ BitVec 64)) (_2!10719 V!48915)) )
))
(declare-datatypes ((List!28531 0))(
  ( (Nil!28528) (Cons!28527 (h!29736 tuple2!21416) (t!42052 List!28531)) )
))
(declare-datatypes ((ListLongMap!19145 0))(
  ( (ListLongMap!19146 (toList!9588 List!28531)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5921 (array!82761 array!82759 (_ BitVec 32) (_ BitVec 32) V!48915 V!48915 (_ BitVec 32) Int) ListLongMap!19145)

(assert (=> b!1269755 (= (getCurrentListMapNoExtraKeys!5921 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5921 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42130 0))(
  ( (Unit!42131) )
))
(declare-fun lt!574445 () Unit!42130)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1221 (array!82761 array!82759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48915 V!48915 V!48915 V!48915 (_ BitVec 32) Int) Unit!42130)

(assert (=> b!1269755 (= lt!574445 (lemmaNoChangeToArrayThenSameMapNoExtras!1221 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269756 () Bool)

(declare-fun res!845018 () Bool)

(assert (=> b!1269756 (=> (not res!845018) (not e!723736))))

(assert (=> b!1269756 (= res!845018 (and (= (size!40455 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40456 _keys!1364) (size!40455 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269757 () Bool)

(declare-fun e!723738 () Bool)

(declare-fun e!723737 () Bool)

(declare-fun mapRes!50767 () Bool)

(assert (=> b!1269757 (= e!723738 (and e!723737 mapRes!50767))))

(declare-fun condMapEmpty!50767 () Bool)

(declare-fun mapDefault!50767 () ValueCell!15542)

(assert (=> b!1269757 (= condMapEmpty!50767 (= (arr!39917 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15542)) mapDefault!50767)))))

(declare-fun b!1269758 () Bool)

(declare-fun res!845016 () Bool)

(assert (=> b!1269758 (=> (not res!845016) (not e!723736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82761 (_ BitVec 32)) Bool)

(assert (=> b!1269758 (= res!845016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!845014 () Bool)

(assert (=> start!107102 (=> (not res!845014) (not e!723736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107102 (= res!845014 (validMask!0 mask!1730))))

(assert (=> start!107102 e!723736))

(declare-fun array_inv!30529 (array!82759) Bool)

(assert (=> start!107102 (and (array_inv!30529 _values!1134) e!723738)))

(assert (=> start!107102 true))

(declare-fun array_inv!30530 (array!82761) Bool)

(assert (=> start!107102 (array_inv!30530 _keys!1364)))

(declare-fun tp_is_empty!32791 () Bool)

(assert (=> start!107102 tp_is_empty!32791))

(assert (=> start!107102 tp!97048))

(declare-fun b!1269759 () Bool)

(declare-fun res!845017 () Bool)

(assert (=> b!1269759 (=> (not res!845017) (not e!723736))))

(declare-datatypes ((List!28532 0))(
  ( (Nil!28529) (Cons!28528 (h!29737 (_ BitVec 64)) (t!42053 List!28532)) )
))
(declare-fun arrayNoDuplicates!0 (array!82761 (_ BitVec 32) List!28532) Bool)

(assert (=> b!1269759 (= res!845017 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28529))))

(declare-fun b!1269760 () Bool)

(declare-fun e!723739 () Bool)

(assert (=> b!1269760 (= e!723739 tp_is_empty!32791)))

(declare-fun mapNonEmpty!50767 () Bool)

(declare-fun tp!97049 () Bool)

(assert (=> mapNonEmpty!50767 (= mapRes!50767 (and tp!97049 e!723739))))

(declare-fun mapRest!50767 () (Array (_ BitVec 32) ValueCell!15542))

(declare-fun mapKey!50767 () (_ BitVec 32))

(declare-fun mapValue!50767 () ValueCell!15542)

(assert (=> mapNonEmpty!50767 (= (arr!39917 _values!1134) (store mapRest!50767 mapKey!50767 mapValue!50767))))

(declare-fun mapIsEmpty!50767 () Bool)

(assert (=> mapIsEmpty!50767 mapRes!50767))

(declare-fun b!1269761 () Bool)

(declare-fun res!845015 () Bool)

(assert (=> b!1269761 (=> (not res!845015) (not e!723736))))

(assert (=> b!1269761 (= res!845015 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40456 _keys!1364)) (bvslt from!1698 (size!40456 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269762 () Bool)

(assert (=> b!1269762 (= e!723737 tp_is_empty!32791)))

(assert (= (and start!107102 res!845014) b!1269756))

(assert (= (and b!1269756 res!845018) b!1269758))

(assert (= (and b!1269758 res!845016) b!1269759))

(assert (= (and b!1269759 res!845017) b!1269761))

(assert (= (and b!1269761 res!845015) b!1269755))

(assert (= (and b!1269757 condMapEmpty!50767) mapIsEmpty!50767))

(assert (= (and b!1269757 (not condMapEmpty!50767)) mapNonEmpty!50767))

(get-info :version)

(assert (= (and mapNonEmpty!50767 ((_ is ValueCellFull!15542) mapValue!50767)) b!1269760))

(assert (= (and b!1269757 ((_ is ValueCellFull!15542) mapDefault!50767)) b!1269762))

(assert (= start!107102 b!1269757))

(declare-fun m!1167765 () Bool)

(assert (=> b!1269759 m!1167765))

(declare-fun m!1167767 () Bool)

(assert (=> mapNonEmpty!50767 m!1167767))

(declare-fun m!1167769 () Bool)

(assert (=> start!107102 m!1167769))

(declare-fun m!1167771 () Bool)

(assert (=> start!107102 m!1167771))

(declare-fun m!1167773 () Bool)

(assert (=> start!107102 m!1167773))

(declare-fun m!1167775 () Bool)

(assert (=> b!1269758 m!1167775))

(declare-fun m!1167777 () Bool)

(assert (=> b!1269755 m!1167777))

(declare-fun m!1167779 () Bool)

(assert (=> b!1269755 m!1167779))

(declare-fun m!1167781 () Bool)

(assert (=> b!1269755 m!1167781))

(check-sat (not start!107102) tp_is_empty!32791 (not b!1269755) b_and!45621 (not b!1269758) (not b_next!27607) (not b!1269759) (not mapNonEmpty!50767))
(check-sat b_and!45621 (not b_next!27607))
