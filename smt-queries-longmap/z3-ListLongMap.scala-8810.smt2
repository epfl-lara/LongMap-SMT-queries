; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107084 () Bool)

(assert start!107084)

(declare-fun b_free!27589 () Bool)

(declare-fun b_next!27589 () Bool)

(assert (=> start!107084 (= b_free!27589 (not b_next!27589))))

(declare-fun tp!96995 () Bool)

(declare-fun b_and!45603 () Bool)

(assert (=> start!107084 (= tp!96995 b_and!45603)))

(declare-fun b!1269539 () Bool)

(declare-fun res!844883 () Bool)

(declare-fun e!723603 () Bool)

(assert (=> b!1269539 (=> (not res!844883) (not e!723603))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!82727 0))(
  ( (array!82728 (arr!39901 (Array (_ BitVec 32) (_ BitVec 64))) (size!40439 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82727)

(assert (=> b!1269539 (= res!844883 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40439 _keys!1364)) (bvslt from!1698 (size!40439 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269540 () Bool)

(declare-fun e!723600 () Bool)

(declare-fun tp_is_empty!32773 () Bool)

(assert (=> b!1269540 (= e!723600 tp_is_empty!32773)))

(declare-fun mapNonEmpty!50740 () Bool)

(declare-fun mapRes!50740 () Bool)

(declare-fun tp!96994 () Bool)

(assert (=> mapNonEmpty!50740 (= mapRes!50740 (and tp!96994 e!723600))))

(declare-fun mapKey!50740 () (_ BitVec 32))

(declare-datatypes ((V!48891 0))(
  ( (V!48892 (val!16461 Int)) )
))
(declare-datatypes ((ValueCell!15533 0))(
  ( (ValueCellFull!15533 (v!19097 V!48891)) (EmptyCell!15533) )
))
(declare-fun mapValue!50740 () ValueCell!15533)

(declare-fun mapRest!50740 () (Array (_ BitVec 32) ValueCell!15533))

(declare-datatypes ((array!82729 0))(
  ( (array!82730 (arr!39902 (Array (_ BitVec 32) ValueCell!15533)) (size!40440 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82729)

(assert (=> mapNonEmpty!50740 (= (arr!39902 _values!1134) (store mapRest!50740 mapKey!50740 mapValue!50740))))

(declare-fun res!844881 () Bool)

(assert (=> start!107084 (=> (not res!844881) (not e!723603))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107084 (= res!844881 (validMask!0 mask!1730))))

(assert (=> start!107084 e!723603))

(declare-fun e!723601 () Bool)

(declare-fun array_inv!30519 (array!82729) Bool)

(assert (=> start!107084 (and (array_inv!30519 _values!1134) e!723601)))

(assert (=> start!107084 true))

(declare-fun array_inv!30520 (array!82727) Bool)

(assert (=> start!107084 (array_inv!30520 _keys!1364)))

(assert (=> start!107084 tp_is_empty!32773))

(assert (=> start!107084 tp!96995))

(declare-fun b!1269541 () Bool)

(declare-fun res!844882 () Bool)

(assert (=> b!1269541 (=> (not res!844882) (not e!723603))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269541 (= res!844882 (and (= (size!40440 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40439 _keys!1364) (size!40440 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269542 () Bool)

(assert (=> b!1269542 (= e!723603 (not true))))

(declare-fun minValueAfter!52 () V!48891)

(declare-fun minValueBefore!52 () V!48891)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48891)

(declare-fun zeroValueBefore!52 () V!48891)

(declare-datatypes ((tuple2!21406 0))(
  ( (tuple2!21407 (_1!10714 (_ BitVec 64)) (_2!10714 V!48891)) )
))
(declare-datatypes ((List!28522 0))(
  ( (Nil!28519) (Cons!28518 (h!29727 tuple2!21406) (t!42043 List!28522)) )
))
(declare-datatypes ((ListLongMap!19135 0))(
  ( (ListLongMap!19136 (toList!9583 List!28522)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5916 (array!82727 array!82729 (_ BitVec 32) (_ BitVec 32) V!48891 V!48891 (_ BitVec 32) Int) ListLongMap!19135)

(assert (=> b!1269542 (= (getCurrentListMapNoExtraKeys!5916 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5916 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42120 0))(
  ( (Unit!42121) )
))
(declare-fun lt!574418 () Unit!42120)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1216 (array!82727 array!82729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48891 V!48891 V!48891 V!48891 (_ BitVec 32) Int) Unit!42120)

(assert (=> b!1269542 (= lt!574418 (lemmaNoChangeToArrayThenSameMapNoExtras!1216 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269543 () Bool)

(declare-fun res!844879 () Bool)

(assert (=> b!1269543 (=> (not res!844879) (not e!723603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82727 (_ BitVec 32)) Bool)

(assert (=> b!1269543 (= res!844879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269544 () Bool)

(declare-fun res!844880 () Bool)

(assert (=> b!1269544 (=> (not res!844880) (not e!723603))))

(declare-datatypes ((List!28523 0))(
  ( (Nil!28520) (Cons!28519 (h!29728 (_ BitVec 64)) (t!42044 List!28523)) )
))
(declare-fun arrayNoDuplicates!0 (array!82727 (_ BitVec 32) List!28523) Bool)

(assert (=> b!1269544 (= res!844880 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28520))))

(declare-fun b!1269545 () Bool)

(declare-fun e!723602 () Bool)

(assert (=> b!1269545 (= e!723602 tp_is_empty!32773)))

(declare-fun mapIsEmpty!50740 () Bool)

(assert (=> mapIsEmpty!50740 mapRes!50740))

(declare-fun b!1269546 () Bool)

(assert (=> b!1269546 (= e!723601 (and e!723602 mapRes!50740))))

(declare-fun condMapEmpty!50740 () Bool)

(declare-fun mapDefault!50740 () ValueCell!15533)

(assert (=> b!1269546 (= condMapEmpty!50740 (= (arr!39902 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15533)) mapDefault!50740)))))

(assert (= (and start!107084 res!844881) b!1269541))

(assert (= (and b!1269541 res!844882) b!1269543))

(assert (= (and b!1269543 res!844879) b!1269544))

(assert (= (and b!1269544 res!844880) b!1269539))

(assert (= (and b!1269539 res!844883) b!1269542))

(assert (= (and b!1269546 condMapEmpty!50740) mapIsEmpty!50740))

(assert (= (and b!1269546 (not condMapEmpty!50740)) mapNonEmpty!50740))

(get-info :version)

(assert (= (and mapNonEmpty!50740 ((_ is ValueCellFull!15533) mapValue!50740)) b!1269540))

(assert (= (and b!1269546 ((_ is ValueCellFull!15533) mapDefault!50740)) b!1269545))

(assert (= start!107084 b!1269546))

(declare-fun m!1167603 () Bool)

(assert (=> b!1269544 m!1167603))

(declare-fun m!1167605 () Bool)

(assert (=> b!1269542 m!1167605))

(declare-fun m!1167607 () Bool)

(assert (=> b!1269542 m!1167607))

(declare-fun m!1167609 () Bool)

(assert (=> b!1269542 m!1167609))

(declare-fun m!1167611 () Bool)

(assert (=> b!1269543 m!1167611))

(declare-fun m!1167613 () Bool)

(assert (=> start!107084 m!1167613))

(declare-fun m!1167615 () Bool)

(assert (=> start!107084 m!1167615))

(declare-fun m!1167617 () Bool)

(assert (=> start!107084 m!1167617))

(declare-fun m!1167619 () Bool)

(assert (=> mapNonEmpty!50740 m!1167619))

(check-sat (not b!1269544) (not start!107084) tp_is_empty!32773 (not mapNonEmpty!50740) b_and!45603 (not b!1269542) (not b_next!27589) (not b!1269543))
(check-sat b_and!45603 (not b_next!27589))
