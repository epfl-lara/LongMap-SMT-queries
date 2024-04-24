; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107326 () Bool)

(assert start!107326)

(declare-fun b_free!27607 () Bool)

(declare-fun b_next!27607 () Bool)

(assert (=> start!107326 (= b_free!27607 (not b_next!27607))))

(declare-fun tp!97048 () Bool)

(declare-fun b_and!45641 () Bool)

(assert (=> start!107326 (= tp!97048 b_and!45641)))

(declare-fun mapNonEmpty!50767 () Bool)

(declare-fun mapRes!50767 () Bool)

(declare-fun tp!97047 () Bool)

(declare-fun e!724614 () Bool)

(assert (=> mapNonEmpty!50767 (= mapRes!50767 (and tp!97047 e!724614))))

(declare-datatypes ((V!48915 0))(
  ( (V!48916 (val!16470 Int)) )
))
(declare-datatypes ((ValueCell!15542 0))(
  ( (ValueCellFull!15542 (v!19102 V!48915)) (EmptyCell!15542) )
))
(declare-datatypes ((array!82879 0))(
  ( (array!82880 (arr!39972 (Array (_ BitVec 32) ValueCell!15542)) (size!40509 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82879)

(declare-fun mapRest!50767 () (Array (_ BitVec 32) ValueCell!15542))

(declare-fun mapValue!50767 () ValueCell!15542)

(declare-fun mapKey!50767 () (_ BitVec 32))

(assert (=> mapNonEmpty!50767 (= (arr!39972 _values!1134) (store mapRest!50767 mapKey!50767 mapValue!50767))))

(declare-fun b!1271124 () Bool)

(declare-fun e!724615 () Bool)

(declare-fun e!724613 () Bool)

(assert (=> b!1271124 (= e!724615 (and e!724613 mapRes!50767))))

(declare-fun condMapEmpty!50767 () Bool)

(declare-fun mapDefault!50767 () ValueCell!15542)

(assert (=> b!1271124 (= condMapEmpty!50767 (= (arr!39972 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15542)) mapDefault!50767)))))

(declare-fun b!1271125 () Bool)

(declare-fun res!845565 () Bool)

(declare-fun e!724612 () Bool)

(assert (=> b!1271125 (=> (not res!845565) (not e!724612))))

(declare-datatypes ((array!82881 0))(
  ( (array!82882 (arr!39973 (Array (_ BitVec 32) (_ BitVec 64))) (size!40510 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82881)

(declare-datatypes ((List!28486 0))(
  ( (Nil!28483) (Cons!28482 (h!29700 (_ BitVec 64)) (t!42007 List!28486)) )
))
(declare-fun arrayNoDuplicates!0 (array!82881 (_ BitVec 32) List!28486) Bool)

(assert (=> b!1271125 (= res!845565 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28483))))

(declare-fun b!1271126 () Bool)

(declare-fun tp_is_empty!32791 () Bool)

(assert (=> b!1271126 (= e!724614 tp_is_empty!32791)))

(declare-fun b!1271127 () Bool)

(assert (=> b!1271127 (= e!724612 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48915)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48915)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48915)

(declare-fun zeroValueBefore!52 () V!48915)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21342 0))(
  ( (tuple2!21343 (_1!10682 (_ BitVec 64)) (_2!10682 V!48915)) )
))
(declare-datatypes ((List!28487 0))(
  ( (Nil!28484) (Cons!28483 (h!29701 tuple2!21342) (t!42008 List!28487)) )
))
(declare-datatypes ((ListLongMap!19079 0))(
  ( (ListLongMap!19080 (toList!9555 List!28487)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5927 (array!82881 array!82879 (_ BitVec 32) (_ BitVec 32) V!48915 V!48915 (_ BitVec 32) Int) ListLongMap!19079)

(assert (=> b!1271127 (= (getCurrentListMapNoExtraKeys!5927 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5927 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42251 0))(
  ( (Unit!42252) )
))
(declare-fun lt!575107 () Unit!42251)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1217 (array!82881 array!82879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48915 V!48915 V!48915 V!48915 (_ BitVec 32) Int) Unit!42251)

(assert (=> b!1271127 (= lt!575107 (lemmaNoChangeToArrayThenSameMapNoExtras!1217 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1271129 () Bool)

(declare-fun res!845564 () Bool)

(assert (=> b!1271129 (=> (not res!845564) (not e!724612))))

(assert (=> b!1271129 (= res!845564 (and (= (size!40509 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40510 _keys!1364) (size!40509 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271130 () Bool)

(assert (=> b!1271130 (= e!724613 tp_is_empty!32791)))

(declare-fun b!1271131 () Bool)

(declare-fun res!845563 () Bool)

(assert (=> b!1271131 (=> (not res!845563) (not e!724612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82881 (_ BitVec 32)) Bool)

(assert (=> b!1271131 (= res!845563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50767 () Bool)

(assert (=> mapIsEmpty!50767 mapRes!50767))

(declare-fun res!845561 () Bool)

(assert (=> start!107326 (=> (not res!845561) (not e!724612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107326 (= res!845561 (validMask!0 mask!1730))))

(assert (=> start!107326 e!724612))

(declare-fun array_inv!30581 (array!82879) Bool)

(assert (=> start!107326 (and (array_inv!30581 _values!1134) e!724615)))

(assert (=> start!107326 true))

(declare-fun array_inv!30582 (array!82881) Bool)

(assert (=> start!107326 (array_inv!30582 _keys!1364)))

(assert (=> start!107326 tp_is_empty!32791))

(assert (=> start!107326 tp!97048))

(declare-fun b!1271128 () Bool)

(declare-fun res!845562 () Bool)

(assert (=> b!1271128 (=> (not res!845562) (not e!724612))))

(assert (=> b!1271128 (= res!845562 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40510 _keys!1364)) (bvslt from!1698 (size!40510 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(assert (= (and start!107326 res!845561) b!1271129))

(assert (= (and b!1271129 res!845564) b!1271131))

(assert (= (and b!1271131 res!845563) b!1271125))

(assert (= (and b!1271125 res!845565) b!1271128))

(assert (= (and b!1271128 res!845562) b!1271127))

(assert (= (and b!1271124 condMapEmpty!50767) mapIsEmpty!50767))

(assert (= (and b!1271124 (not condMapEmpty!50767)) mapNonEmpty!50767))

(get-info :version)

(assert (= (and mapNonEmpty!50767 ((_ is ValueCellFull!15542) mapValue!50767)) b!1271126))

(assert (= (and b!1271124 ((_ is ValueCellFull!15542) mapDefault!50767)) b!1271130))

(assert (= start!107326 b!1271124))

(declare-fun m!1169877 () Bool)

(assert (=> b!1271131 m!1169877))

(declare-fun m!1169879 () Bool)

(assert (=> b!1271125 m!1169879))

(declare-fun m!1169881 () Bool)

(assert (=> start!107326 m!1169881))

(declare-fun m!1169883 () Bool)

(assert (=> start!107326 m!1169883))

(declare-fun m!1169885 () Bool)

(assert (=> start!107326 m!1169885))

(declare-fun m!1169887 () Bool)

(assert (=> mapNonEmpty!50767 m!1169887))

(declare-fun m!1169889 () Bool)

(assert (=> b!1271127 m!1169889))

(declare-fun m!1169891 () Bool)

(assert (=> b!1271127 m!1169891))

(declare-fun m!1169893 () Bool)

(assert (=> b!1271127 m!1169893))

(check-sat (not b!1271125) (not b_next!27607) (not b!1271131) (not start!107326) (not mapNonEmpty!50767) tp_is_empty!32791 b_and!45641 (not b!1271127))
(check-sat b_and!45641 (not b_next!27607))
