; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107098 () Bool)

(assert start!107098)

(declare-fun b_free!27603 () Bool)

(declare-fun b_next!27603 () Bool)

(assert (=> start!107098 (= b_free!27603 (not b_next!27603))))

(declare-fun tp!97036 () Bool)

(declare-fun b_and!45635 () Bool)

(assert (=> start!107098 (= tp!97036 b_and!45635)))

(declare-fun b!1269771 () Bool)

(declare-fun res!845014 () Bool)

(declare-fun e!723734 () Bool)

(assert (=> b!1269771 (=> (not res!845014) (not e!723734))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!82836 0))(
  ( (array!82837 (arr!39955 (Array (_ BitVec 32) (_ BitVec 64))) (size!40491 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82836)

(assert (=> b!1269771 (= res!845014 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40491 _keys!1364)) (bvslt from!1698 (size!40491 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269772 () Bool)

(declare-fun res!845012 () Bool)

(assert (=> b!1269772 (=> (not res!845012) (not e!723734))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82836 (_ BitVec 32)) Bool)

(assert (=> b!1269772 (= res!845012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!845015 () Bool)

(assert (=> start!107098 (=> (not res!845015) (not e!723734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107098 (= res!845015 (validMask!0 mask!1730))))

(assert (=> start!107098 e!723734))

(declare-datatypes ((V!48909 0))(
  ( (V!48910 (val!16468 Int)) )
))
(declare-datatypes ((ValueCell!15540 0))(
  ( (ValueCellFull!15540 (v!19105 V!48909)) (EmptyCell!15540) )
))
(declare-datatypes ((array!82838 0))(
  ( (array!82839 (arr!39956 (Array (_ BitVec 32) ValueCell!15540)) (size!40492 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82838)

(declare-fun e!723738 () Bool)

(declare-fun array_inv!30393 (array!82838) Bool)

(assert (=> start!107098 (and (array_inv!30393 _values!1134) e!723738)))

(assert (=> start!107098 true))

(declare-fun array_inv!30394 (array!82836) Bool)

(assert (=> start!107098 (array_inv!30394 _keys!1364)))

(declare-fun tp_is_empty!32787 () Bool)

(assert (=> start!107098 tp_is_empty!32787))

(assert (=> start!107098 tp!97036))

(declare-fun b!1269773 () Bool)

(declare-fun e!723735 () Bool)

(assert (=> b!1269773 (= e!723735 tp_is_empty!32787)))

(declare-fun mapNonEmpty!50761 () Bool)

(declare-fun mapRes!50761 () Bool)

(declare-fun tp!97035 () Bool)

(declare-fun e!723736 () Bool)

(assert (=> mapNonEmpty!50761 (= mapRes!50761 (and tp!97035 e!723736))))

(declare-fun mapKey!50761 () (_ BitVec 32))

(declare-fun mapValue!50761 () ValueCell!15540)

(declare-fun mapRest!50761 () (Array (_ BitVec 32) ValueCell!15540))

(assert (=> mapNonEmpty!50761 (= (arr!39956 _values!1134) (store mapRest!50761 mapKey!50761 mapValue!50761))))

(declare-fun b!1269774 () Bool)

(assert (=> b!1269774 (= e!723738 (and e!723735 mapRes!50761))))

(declare-fun condMapEmpty!50761 () Bool)

(declare-fun mapDefault!50761 () ValueCell!15540)

(assert (=> b!1269774 (= condMapEmpty!50761 (= (arr!39956 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15540)) mapDefault!50761)))))

(declare-fun mapIsEmpty!50761 () Bool)

(assert (=> mapIsEmpty!50761 mapRes!50761))

(declare-fun b!1269775 () Bool)

(assert (=> b!1269775 (= e!723734 (not true))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48909)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48909)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48909)

(declare-fun zeroValueBefore!52 () V!48909)

(declare-datatypes ((tuple2!21332 0))(
  ( (tuple2!21333 (_1!10677 (_ BitVec 64)) (_2!10677 V!48909)) )
))
(declare-datatypes ((List!28447 0))(
  ( (Nil!28444) (Cons!28443 (h!29652 tuple2!21332) (t!41976 List!28447)) )
))
(declare-datatypes ((ListLongMap!19061 0))(
  ( (ListLongMap!19062 (toList!9546 List!28447)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5878 (array!82836 array!82838 (_ BitVec 32) (_ BitVec 32) V!48909 V!48909 (_ BitVec 32) Int) ListLongMap!19061)

(assert (=> b!1269775 (= (getCurrentListMapNoExtraKeys!5878 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5878 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42278 0))(
  ( (Unit!42279) )
))
(declare-fun lt!574617 () Unit!42278)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1220 (array!82836 array!82838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48909 V!48909 V!48909 V!48909 (_ BitVec 32) Int) Unit!42278)

(assert (=> b!1269775 (= lt!574617 (lemmaNoChangeToArrayThenSameMapNoExtras!1220 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269776 () Bool)

(assert (=> b!1269776 (= e!723736 tp_is_empty!32787)))

(declare-fun b!1269777 () Bool)

(declare-fun res!845011 () Bool)

(assert (=> b!1269777 (=> (not res!845011) (not e!723734))))

(declare-datatypes ((List!28448 0))(
  ( (Nil!28445) (Cons!28444 (h!29653 (_ BitVec 64)) (t!41977 List!28448)) )
))
(declare-fun arrayNoDuplicates!0 (array!82836 (_ BitVec 32) List!28448) Bool)

(assert (=> b!1269777 (= res!845011 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28445))))

(declare-fun b!1269778 () Bool)

(declare-fun res!845013 () Bool)

(assert (=> b!1269778 (=> (not res!845013) (not e!723734))))

(assert (=> b!1269778 (= res!845013 (and (= (size!40492 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40491 _keys!1364) (size!40492 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!107098 res!845015) b!1269778))

(assert (= (and b!1269778 res!845013) b!1269772))

(assert (= (and b!1269772 res!845012) b!1269777))

(assert (= (and b!1269777 res!845011) b!1269771))

(assert (= (and b!1269771 res!845014) b!1269775))

(assert (= (and b!1269774 condMapEmpty!50761) mapIsEmpty!50761))

(assert (= (and b!1269774 (not condMapEmpty!50761)) mapNonEmpty!50761))

(get-info :version)

(assert (= (and mapNonEmpty!50761 ((_ is ValueCellFull!15540) mapValue!50761)) b!1269776))

(assert (= (and b!1269774 ((_ is ValueCellFull!15540) mapDefault!50761)) b!1269773))

(assert (= start!107098 b!1269774))

(declare-fun m!1168229 () Bool)

(assert (=> mapNonEmpty!50761 m!1168229))

(declare-fun m!1168231 () Bool)

(assert (=> b!1269777 m!1168231))

(declare-fun m!1168233 () Bool)

(assert (=> b!1269772 m!1168233))

(declare-fun m!1168235 () Bool)

(assert (=> b!1269775 m!1168235))

(declare-fun m!1168237 () Bool)

(assert (=> b!1269775 m!1168237))

(declare-fun m!1168239 () Bool)

(assert (=> b!1269775 m!1168239))

(declare-fun m!1168241 () Bool)

(assert (=> start!107098 m!1168241))

(declare-fun m!1168243 () Bool)

(assert (=> start!107098 m!1168243))

(declare-fun m!1168245 () Bool)

(assert (=> start!107098 m!1168245))

(check-sat (not b!1269777) (not b!1269775) (not b_next!27603) (not start!107098) tp_is_empty!32787 (not b!1269772) b_and!45635 (not mapNonEmpty!50761))
(check-sat b_and!45635 (not b_next!27603))
