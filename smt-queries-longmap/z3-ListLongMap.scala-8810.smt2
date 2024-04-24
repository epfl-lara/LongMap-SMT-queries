; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107308 () Bool)

(assert start!107308)

(declare-fun b_free!27589 () Bool)

(declare-fun b_next!27589 () Bool)

(assert (=> start!107308 (= b_free!27589 (not b_next!27589))))

(declare-fun tp!96994 () Bool)

(declare-fun b_and!45623 () Bool)

(assert (=> start!107308 (= tp!96994 b_and!45623)))

(declare-fun mapNonEmpty!50740 () Bool)

(declare-fun mapRes!50740 () Bool)

(declare-fun tp!96993 () Bool)

(declare-fun e!724478 () Bool)

(assert (=> mapNonEmpty!50740 (= mapRes!50740 (and tp!96993 e!724478))))

(declare-datatypes ((V!48891 0))(
  ( (V!48892 (val!16461 Int)) )
))
(declare-datatypes ((ValueCell!15533 0))(
  ( (ValueCellFull!15533 (v!19093 V!48891)) (EmptyCell!15533) )
))
(declare-datatypes ((array!82847 0))(
  ( (array!82848 (arr!39956 (Array (_ BitVec 32) ValueCell!15533)) (size!40493 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82847)

(declare-fun mapKey!50740 () (_ BitVec 32))

(declare-fun mapValue!50740 () ValueCell!15533)

(declare-fun mapRest!50740 () (Array (_ BitVec 32) ValueCell!15533))

(assert (=> mapNonEmpty!50740 (= (arr!39956 _values!1134) (store mapRest!50740 mapKey!50740 mapValue!50740))))

(declare-fun res!845428 () Bool)

(declare-fun e!724477 () Bool)

(assert (=> start!107308 (=> (not res!845428) (not e!724477))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107308 (= res!845428 (validMask!0 mask!1730))))

(assert (=> start!107308 e!724477))

(declare-fun e!724476 () Bool)

(declare-fun array_inv!30569 (array!82847) Bool)

(assert (=> start!107308 (and (array_inv!30569 _values!1134) e!724476)))

(assert (=> start!107308 true))

(declare-datatypes ((array!82849 0))(
  ( (array!82850 (arr!39957 (Array (_ BitVec 32) (_ BitVec 64))) (size!40494 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82849)

(declare-fun array_inv!30570 (array!82849) Bool)

(assert (=> start!107308 (array_inv!30570 _keys!1364)))

(declare-fun tp_is_empty!32773 () Bool)

(assert (=> start!107308 tp_is_empty!32773))

(assert (=> start!107308 tp!96994))

(declare-fun mapIsEmpty!50740 () Bool)

(assert (=> mapIsEmpty!50740 mapRes!50740))

(declare-fun b!1270908 () Bool)

(assert (=> b!1270908 (= e!724477 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48891)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48891)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48891)

(declare-fun zeroValueBefore!52 () V!48891)

(declare-datatypes ((tuple2!21328 0))(
  ( (tuple2!21329 (_1!10675 (_ BitVec 64)) (_2!10675 V!48891)) )
))
(declare-datatypes ((List!28472 0))(
  ( (Nil!28469) (Cons!28468 (h!29686 tuple2!21328) (t!41993 List!28472)) )
))
(declare-datatypes ((ListLongMap!19065 0))(
  ( (ListLongMap!19066 (toList!9548 List!28472)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5920 (array!82849 array!82847 (_ BitVec 32) (_ BitVec 32) V!48891 V!48891 (_ BitVec 32) Int) ListLongMap!19065)

(assert (=> b!1270908 (= (getCurrentListMapNoExtraKeys!5920 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5920 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42237 0))(
  ( (Unit!42238) )
))
(declare-fun lt!575080 () Unit!42237)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1210 (array!82849 array!82847 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48891 V!48891 V!48891 V!48891 (_ BitVec 32) Int) Unit!42237)

(assert (=> b!1270908 (= lt!575080 (lemmaNoChangeToArrayThenSameMapNoExtras!1210 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1270909 () Bool)

(assert (=> b!1270909 (= e!724478 tp_is_empty!32773)))

(declare-fun b!1270910 () Bool)

(declare-fun e!724480 () Bool)

(assert (=> b!1270910 (= e!724476 (and e!724480 mapRes!50740))))

(declare-fun condMapEmpty!50740 () Bool)

(declare-fun mapDefault!50740 () ValueCell!15533)

(assert (=> b!1270910 (= condMapEmpty!50740 (= (arr!39956 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15533)) mapDefault!50740)))))

(declare-fun b!1270911 () Bool)

(declare-fun res!845430 () Bool)

(assert (=> b!1270911 (=> (not res!845430) (not e!724477))))

(assert (=> b!1270911 (= res!845430 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40494 _keys!1364)) (bvslt from!1698 (size!40494 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270912 () Bool)

(assert (=> b!1270912 (= e!724480 tp_is_empty!32773)))

(declare-fun b!1270913 () Bool)

(declare-fun res!845427 () Bool)

(assert (=> b!1270913 (=> (not res!845427) (not e!724477))))

(assert (=> b!1270913 (= res!845427 (and (= (size!40493 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40494 _keys!1364) (size!40493 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270914 () Bool)

(declare-fun res!845429 () Bool)

(assert (=> b!1270914 (=> (not res!845429) (not e!724477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82849 (_ BitVec 32)) Bool)

(assert (=> b!1270914 (= res!845429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270915 () Bool)

(declare-fun res!845426 () Bool)

(assert (=> b!1270915 (=> (not res!845426) (not e!724477))))

(declare-datatypes ((List!28473 0))(
  ( (Nil!28470) (Cons!28469 (h!29687 (_ BitVec 64)) (t!41994 List!28473)) )
))
(declare-fun arrayNoDuplicates!0 (array!82849 (_ BitVec 32) List!28473) Bool)

(assert (=> b!1270915 (= res!845426 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28470))))

(assert (= (and start!107308 res!845428) b!1270913))

(assert (= (and b!1270913 res!845427) b!1270914))

(assert (= (and b!1270914 res!845429) b!1270915))

(assert (= (and b!1270915 res!845426) b!1270911))

(assert (= (and b!1270911 res!845430) b!1270908))

(assert (= (and b!1270910 condMapEmpty!50740) mapIsEmpty!50740))

(assert (= (and b!1270910 (not condMapEmpty!50740)) mapNonEmpty!50740))

(get-info :version)

(assert (= (and mapNonEmpty!50740 ((_ is ValueCellFull!15533) mapValue!50740)) b!1270909))

(assert (= (and b!1270910 ((_ is ValueCellFull!15533) mapDefault!50740)) b!1270912))

(assert (= start!107308 b!1270910))

(declare-fun m!1169715 () Bool)

(assert (=> start!107308 m!1169715))

(declare-fun m!1169717 () Bool)

(assert (=> start!107308 m!1169717))

(declare-fun m!1169719 () Bool)

(assert (=> start!107308 m!1169719))

(declare-fun m!1169721 () Bool)

(assert (=> b!1270908 m!1169721))

(declare-fun m!1169723 () Bool)

(assert (=> b!1270908 m!1169723))

(declare-fun m!1169725 () Bool)

(assert (=> b!1270908 m!1169725))

(declare-fun m!1169727 () Bool)

(assert (=> mapNonEmpty!50740 m!1169727))

(declare-fun m!1169729 () Bool)

(assert (=> b!1270914 m!1169729))

(declare-fun m!1169731 () Bool)

(assert (=> b!1270915 m!1169731))

(check-sat b_and!45623 (not b_next!27589) (not start!107308) (not mapNonEmpty!50740) (not b!1270914) (not b!1270908) (not b!1270915) tp_is_empty!32773)
(check-sat b_and!45623 (not b_next!27589))
