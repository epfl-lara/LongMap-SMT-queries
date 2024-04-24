; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77802 () Bool)

(assert start!77802)

(declare-fun b_free!16219 () Bool)

(declare-fun b_next!16219 () Bool)

(assert (=> start!77802 (= b_free!16219 (not b_next!16219))))

(declare-fun tp!56920 () Bool)

(declare-fun b_and!26601 () Bool)

(assert (=> start!77802 (= tp!56920 b_and!26601)))

(declare-fun b!905903 () Bool)

(declare-fun res!611019 () Bool)

(declare-fun e!507711 () Bool)

(assert (=> b!905903 (=> (not res!611019) (not e!507711))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905903 (= res!611019 (inRange!0 i!717 mask!1756))))

(declare-fun b!905904 () Bool)

(declare-fun res!611020 () Bool)

(declare-fun e!507710 () Bool)

(assert (=> b!905904 (=> (not res!611020) (not e!507710))))

(declare-datatypes ((array!53361 0))(
  ( (array!53362 (arr!25635 (Array (_ BitVec 32) (_ BitVec 64))) (size!26095 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53361)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53361 (_ BitVec 32)) Bool)

(assert (=> b!905904 (= res!611020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905905 () Bool)

(declare-fun res!611017 () Bool)

(assert (=> b!905905 (=> (not res!611017) (not e!507711))))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!905905 (= res!611017 (and (= (select (arr!25635 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905906 () Bool)

(declare-fun e!507705 () Bool)

(declare-fun tp_is_empty!18637 () Bool)

(assert (=> b!905906 (= e!507705 tp_is_empty!18637)))

(declare-fun b!905907 () Bool)

(declare-fun e!507704 () Bool)

(declare-fun mapRes!29668 () Bool)

(assert (=> b!905907 (= e!507704 (and e!507705 mapRes!29668))))

(declare-fun condMapEmpty!29668 () Bool)

(declare-datatypes ((V!29815 0))(
  ( (V!29816 (val!9369 Int)) )
))
(declare-datatypes ((ValueCell!8837 0))(
  ( (ValueCellFull!8837 (v!11871 V!29815)) (EmptyCell!8837) )
))
(declare-datatypes ((array!53363 0))(
  ( (array!53364 (arr!25636 (Array (_ BitVec 32) ValueCell!8837)) (size!26096 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53363)

(declare-fun mapDefault!29668 () ValueCell!8837)

(assert (=> b!905907 (= condMapEmpty!29668 (= (arr!25636 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8837)) mapDefault!29668)))))

(declare-fun mapNonEmpty!29668 () Bool)

(declare-fun tp!56919 () Bool)

(declare-fun e!507707 () Bool)

(assert (=> mapNonEmpty!29668 (= mapRes!29668 (and tp!56919 e!507707))))

(declare-fun mapRest!29668 () (Array (_ BitVec 32) ValueCell!8837))

(declare-fun mapKey!29668 () (_ BitVec 32))

(declare-fun mapValue!29668 () ValueCell!8837)

(assert (=> mapNonEmpty!29668 (= (arr!25636 _values!1152) (store mapRest!29668 mapKey!29668 mapValue!29668))))

(declare-fun res!611022 () Bool)

(assert (=> start!77802 (=> (not res!611022) (not e!507710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77802 (= res!611022 (validMask!0 mask!1756))))

(assert (=> start!77802 e!507710))

(declare-fun array_inv!20144 (array!53363) Bool)

(assert (=> start!77802 (and (array_inv!20144 _values!1152) e!507704)))

(assert (=> start!77802 tp!56920))

(assert (=> start!77802 true))

(assert (=> start!77802 tp_is_empty!18637))

(declare-fun array_inv!20145 (array!53361) Bool)

(assert (=> start!77802 (array_inv!20145 _keys!1386)))

(declare-fun b!905908 () Bool)

(declare-fun res!611018 () Bool)

(assert (=> b!905908 (=> (not res!611018) (not e!507710))))

(declare-datatypes ((List!17958 0))(
  ( (Nil!17955) (Cons!17954 (h!19106 (_ BitVec 64)) (t!25341 List!17958)) )
))
(declare-fun arrayNoDuplicates!0 (array!53361 (_ BitVec 32) List!17958) Bool)

(assert (=> b!905908 (= res!611018 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17955))))

(declare-fun b!905909 () Bool)

(declare-fun e!507709 () Bool)

(assert (=> b!905909 (= e!507709 true)))

(declare-datatypes ((tuple2!12114 0))(
  ( (tuple2!12115 (_1!6068 (_ BitVec 64)) (_2!6068 V!29815)) )
))
(declare-datatypes ((List!17959 0))(
  ( (Nil!17956) (Cons!17955 (h!19107 tuple2!12114) (t!25342 List!17959)) )
))
(declare-datatypes ((ListLongMap!10813 0))(
  ( (ListLongMap!10814 (toList!5422 List!17959)) )
))
(declare-fun lt!408755 () ListLongMap!10813)

(declare-fun lt!408753 () V!29815)

(declare-fun apply!447 (ListLongMap!10813 (_ BitVec 64)) V!29815)

(assert (=> b!905909 (= (apply!447 lt!408755 k0!1033) lt!408753)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29815)

(declare-datatypes ((Unit!30702 0))(
  ( (Unit!30703) )
))
(declare-fun lt!408756 () Unit!30702)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29815)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!3 (array!53361 array!53363 (_ BitVec 32) (_ BitVec 32) V!29815 V!29815 (_ BitVec 64) V!29815 (_ BitVec 32) Int) Unit!30702)

(assert (=> b!905909 (= lt!408756 (lemmaListMapApplyFromThenApplyFromZero!3 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408753 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!29668 () Bool)

(assert (=> mapIsEmpty!29668 mapRes!29668))

(declare-fun b!905910 () Bool)

(declare-fun e!507708 () Bool)

(assert (=> b!905910 (= e!507711 (not e!507708))))

(declare-fun res!611016 () Bool)

(assert (=> b!905910 (=> res!611016 e!507708)))

(assert (=> b!905910 (= res!611016 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26095 _keys!1386))))))

(declare-fun get!13477 (ValueCell!8837 V!29815) V!29815)

(declare-fun dynLambda!1339 (Int (_ BitVec 64)) V!29815)

(assert (=> b!905910 (= lt!408753 (get!13477 (select (arr!25636 _values!1152) i!717) (dynLambda!1339 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905910 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408754 () Unit!30702)

(declare-fun lemmaKeyInListMapIsInArray!198 (array!53361 array!53363 (_ BitVec 32) (_ BitVec 32) V!29815 V!29815 (_ BitVec 64) Int) Unit!30702)

(assert (=> b!905910 (= lt!408754 (lemmaKeyInListMapIsInArray!198 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!905911 () Bool)

(declare-fun res!611021 () Bool)

(assert (=> b!905911 (=> res!611021 e!507709)))

(declare-fun lt!408757 () ListLongMap!10813)

(assert (=> b!905911 (= res!611021 (not (= (apply!447 lt!408757 k0!1033) lt!408753)))))

(declare-fun b!905912 () Bool)

(assert (=> b!905912 (= e!507710 e!507711)))

(declare-fun res!611023 () Bool)

(assert (=> b!905912 (=> (not res!611023) (not e!507711))))

(declare-fun contains!4477 (ListLongMap!10813 (_ BitVec 64)) Bool)

(assert (=> b!905912 (= res!611023 (contains!4477 lt!408755 k0!1033))))

(declare-fun getCurrentListMap!2688 (array!53361 array!53363 (_ BitVec 32) (_ BitVec 32) V!29815 V!29815 (_ BitVec 32) Int) ListLongMap!10813)

(assert (=> b!905912 (= lt!408755 (getCurrentListMap!2688 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905913 () Bool)

(assert (=> b!905913 (= e!507708 e!507709)))

(declare-fun res!611014 () Bool)

(assert (=> b!905913 (=> res!611014 e!507709)))

(assert (=> b!905913 (= res!611014 (not (contains!4477 lt!408757 k0!1033)))))

(assert (=> b!905913 (= lt!408757 (getCurrentListMap!2688 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905914 () Bool)

(declare-fun res!611015 () Bool)

(assert (=> b!905914 (=> (not res!611015) (not e!507710))))

(assert (=> b!905914 (= res!611015 (and (= (size!26096 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26095 _keys!1386) (size!26096 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905915 () Bool)

(assert (=> b!905915 (= e!507707 tp_is_empty!18637)))

(assert (= (and start!77802 res!611022) b!905914))

(assert (= (and b!905914 res!611015) b!905904))

(assert (= (and b!905904 res!611020) b!905908))

(assert (= (and b!905908 res!611018) b!905912))

(assert (= (and b!905912 res!611023) b!905903))

(assert (= (and b!905903 res!611019) b!905905))

(assert (= (and b!905905 res!611017) b!905910))

(assert (= (and b!905910 (not res!611016)) b!905913))

(assert (= (and b!905913 (not res!611014)) b!905911))

(assert (= (and b!905911 (not res!611021)) b!905909))

(assert (= (and b!905907 condMapEmpty!29668) mapIsEmpty!29668))

(assert (= (and b!905907 (not condMapEmpty!29668)) mapNonEmpty!29668))

(get-info :version)

(assert (= (and mapNonEmpty!29668 ((_ is ValueCellFull!8837) mapValue!29668)) b!905915))

(assert (= (and b!905907 ((_ is ValueCellFull!8837) mapDefault!29668)) b!905906))

(assert (= start!77802 b!905907))

(declare-fun b_lambda!13107 () Bool)

(assert (=> (not b_lambda!13107) (not b!905910)))

(declare-fun t!25340 () Bool)

(declare-fun tb!5233 () Bool)

(assert (=> (and start!77802 (= defaultEntry!1160 defaultEntry!1160) t!25340) tb!5233))

(declare-fun result!10269 () Bool)

(assert (=> tb!5233 (= result!10269 tp_is_empty!18637)))

(assert (=> b!905910 t!25340))

(declare-fun b_and!26603 () Bool)

(assert (= b_and!26601 (and (=> t!25340 result!10269) b_and!26603)))

(declare-fun m!841709 () Bool)

(assert (=> b!905912 m!841709))

(declare-fun m!841711 () Bool)

(assert (=> b!905912 m!841711))

(declare-fun m!841713 () Bool)

(assert (=> b!905908 m!841713))

(declare-fun m!841715 () Bool)

(assert (=> b!905910 m!841715))

(declare-fun m!841717 () Bool)

(assert (=> b!905910 m!841717))

(declare-fun m!841719 () Bool)

(assert (=> b!905910 m!841719))

(declare-fun m!841721 () Bool)

(assert (=> b!905910 m!841721))

(assert (=> b!905910 m!841715))

(assert (=> b!905910 m!841719))

(declare-fun m!841723 () Bool)

(assert (=> b!905910 m!841723))

(declare-fun m!841725 () Bool)

(assert (=> b!905909 m!841725))

(declare-fun m!841727 () Bool)

(assert (=> b!905909 m!841727))

(declare-fun m!841729 () Bool)

(assert (=> b!905903 m!841729))

(declare-fun m!841731 () Bool)

(assert (=> b!905911 m!841731))

(declare-fun m!841733 () Bool)

(assert (=> b!905913 m!841733))

(declare-fun m!841735 () Bool)

(assert (=> b!905913 m!841735))

(declare-fun m!841737 () Bool)

(assert (=> mapNonEmpty!29668 m!841737))

(declare-fun m!841739 () Bool)

(assert (=> b!905905 m!841739))

(declare-fun m!841741 () Bool)

(assert (=> start!77802 m!841741))

(declare-fun m!841743 () Bool)

(assert (=> start!77802 m!841743))

(declare-fun m!841745 () Bool)

(assert (=> start!77802 m!841745))

(declare-fun m!841747 () Bool)

(assert (=> b!905904 m!841747))

(check-sat b_and!26603 tp_is_empty!18637 (not b!905911) (not mapNonEmpty!29668) (not b!905912) (not b!905909) (not b!905913) (not b_lambda!13107) (not b!905908) (not start!77802) (not b!905904) (not b!905910) (not b!905903) (not b_next!16219))
(check-sat b_and!26603 (not b_next!16219))
