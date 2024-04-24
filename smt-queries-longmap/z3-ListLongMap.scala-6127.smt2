; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79038 () Bool)

(assert start!79038)

(declare-fun b_free!17083 () Bool)

(declare-fun b_next!17083 () Bool)

(assert (=> start!79038 (= b_free!17083 (not b_next!17083))))

(declare-fun tp!59691 () Bool)

(declare-fun b_and!27913 () Bool)

(assert (=> start!79038 (= tp!59691 b_and!27913)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!922554 () Bool)

(declare-fun e!517766 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!55207 0))(
  ( (array!55208 (arr!26544 (Array (_ BitVec 32) (_ BitVec 64))) (size!27004 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55207)

(declare-fun arrayContainsKey!0 (array!55207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922554 (= e!517766 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!922555 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!922555 (= e!517766 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922556 () Bool)

(declare-fun res!621885 () Bool)

(declare-fun e!517762 () Bool)

(assert (=> b!922556 (=> (not res!621885) (not e!517762))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922556 (= res!621885 (validKeyInArray!0 k0!1099))))

(declare-fun b!922557 () Bool)

(declare-fun e!517765 () Bool)

(declare-fun tp_is_empty!19591 () Bool)

(assert (=> b!922557 (= e!517765 tp_is_empty!19591)))

(declare-fun b!922558 () Bool)

(declare-fun res!621877 () Bool)

(declare-fun e!517761 () Bool)

(assert (=> b!922558 (=> (not res!621877) (not e!517761))))

(declare-datatypes ((List!18609 0))(
  ( (Nil!18606) (Cons!18605 (h!19757 (_ BitVec 64)) (t!26414 List!18609)) )
))
(declare-fun arrayNoDuplicates!0 (array!55207 (_ BitVec 32) List!18609) Bool)

(assert (=> b!922558 (= res!621877 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18606))))

(declare-fun mapNonEmpty!31143 () Bool)

(declare-fun mapRes!31143 () Bool)

(declare-fun tp!59690 () Bool)

(declare-fun e!517767 () Bool)

(assert (=> mapNonEmpty!31143 (= mapRes!31143 (and tp!59690 e!517767))))

(declare-fun mapKey!31143 () (_ BitVec 32))

(declare-datatypes ((V!31087 0))(
  ( (V!31088 (val!9846 Int)) )
))
(declare-datatypes ((ValueCell!9314 0))(
  ( (ValueCellFull!9314 (v!12361 V!31087)) (EmptyCell!9314) )
))
(declare-fun mapRest!31143 () (Array (_ BitVec 32) ValueCell!9314))

(declare-fun mapValue!31143 () ValueCell!9314)

(declare-datatypes ((array!55209 0))(
  ( (array!55210 (arr!26545 (Array (_ BitVec 32) ValueCell!9314)) (size!27005 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55209)

(assert (=> mapNonEmpty!31143 (= (arr!26545 _values!1231) (store mapRest!31143 mapKey!31143 mapValue!31143))))

(declare-fun res!621887 () Bool)

(assert (=> start!79038 (=> (not res!621887) (not e!517761))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79038 (= res!621887 (validMask!0 mask!1881))))

(assert (=> start!79038 e!517761))

(assert (=> start!79038 true))

(assert (=> start!79038 tp_is_empty!19591))

(declare-fun e!517763 () Bool)

(declare-fun array_inv!20780 (array!55209) Bool)

(assert (=> start!79038 (and (array_inv!20780 _values!1231) e!517763)))

(assert (=> start!79038 tp!59691))

(declare-fun array_inv!20781 (array!55207) Bool)

(assert (=> start!79038 (array_inv!20781 _keys!1487)))

(declare-fun b!922559 () Bool)

(declare-fun e!517768 () Bool)

(assert (=> b!922559 (= e!517768 true)))

(declare-fun lt!414161 () Bool)

(declare-fun contains!4833 (List!18609 (_ BitVec 64)) Bool)

(assert (=> b!922559 (= lt!414161 (contains!4833 Nil!18606 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!922560 () Bool)

(declare-fun res!621884 () Bool)

(assert (=> b!922560 (=> (not res!621884) (not e!517761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55207 (_ BitVec 32)) Bool)

(assert (=> b!922560 (= res!621884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922561 () Bool)

(assert (=> b!922561 (= e!517767 tp_is_empty!19591)))

(declare-fun b!922562 () Bool)

(declare-fun e!517760 () Bool)

(assert (=> b!922562 (= e!517762 e!517760)))

(declare-fun res!621879 () Bool)

(assert (=> b!922562 (=> (not res!621879) (not e!517760))))

(declare-fun lt!414163 () (_ BitVec 64))

(assert (=> b!922562 (= res!621879 (validKeyInArray!0 lt!414163))))

(assert (=> b!922562 (= lt!414163 (select (arr!26544 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922563 () Bool)

(declare-fun res!621883 () Bool)

(assert (=> b!922563 (=> (not res!621883) (not e!517761))))

(assert (=> b!922563 (= res!621883 (and (= (size!27005 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27004 _keys!1487) (size!27005 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922564 () Bool)

(declare-fun res!621878 () Bool)

(assert (=> b!922564 (=> (not res!621878) (not e!517762))))

(assert (=> b!922564 (= res!621878 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922565 () Bool)

(declare-fun res!621882 () Bool)

(assert (=> b!922565 (=> res!621882 e!517768)))

(assert (=> b!922565 (= res!621882 (contains!4833 Nil!18606 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!31143 () Bool)

(assert (=> mapIsEmpty!31143 mapRes!31143))

(declare-fun b!922566 () Bool)

(declare-fun res!621881 () Bool)

(assert (=> b!922566 (=> res!621881 e!517768)))

(declare-fun noDuplicate!1356 (List!18609) Bool)

(assert (=> b!922566 (= res!621881 (not (noDuplicate!1356 Nil!18606)))))

(declare-fun b!922567 () Bool)

(declare-fun res!621876 () Bool)

(assert (=> b!922567 (=> (not res!621876) (not e!517762))))

(declare-datatypes ((tuple2!12792 0))(
  ( (tuple2!12793 (_1!6407 (_ BitVec 64)) (_2!6407 V!31087)) )
))
(declare-datatypes ((List!18610 0))(
  ( (Nil!18607) (Cons!18606 (h!19758 tuple2!12792) (t!26415 List!18610)) )
))
(declare-datatypes ((ListLongMap!11491 0))(
  ( (ListLongMap!11492 (toList!5761 List!18610)) )
))
(declare-fun lt!414158 () ListLongMap!11491)

(declare-fun v!791 () V!31087)

(declare-fun apply!622 (ListLongMap!11491 (_ BitVec 64)) V!31087)

(assert (=> b!922567 (= res!621876 (= (apply!622 lt!414158 k0!1099) v!791))))

(declare-fun b!922568 () Bool)

(assert (=> b!922568 (= e!517760 (not e!517768))))

(declare-fun res!621880 () Bool)

(assert (=> b!922568 (=> res!621880 e!517768)))

(assert (=> b!922568 (= res!621880 (or (bvsge (size!27004 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27004 _keys!1487))))))

(assert (=> b!922568 e!517766))

(declare-fun c!96408 () Bool)

(assert (=> b!922568 (= c!96408 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((Unit!31092 0))(
  ( (Unit!31093) )
))
(declare-fun lt!414159 () Unit!31092)

(declare-fun zeroValue!1173 () V!31087)

(declare-fun minValue!1173 () V!31087)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!181 (array!55207 array!55209 (_ BitVec 32) (_ BitVec 32) V!31087 V!31087 (_ BitVec 64) (_ BitVec 32) Int) Unit!31092)

(assert (=> b!922568 (= lt!414159 (lemmaListMapContainsThenArrayContainsFrom!181 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!922568 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18606)))

(declare-fun lt!414162 () Unit!31092)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55207 (_ BitVec 32) (_ BitVec 32)) Unit!31092)

(assert (=> b!922568 (= lt!414162 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!414156 () tuple2!12792)

(declare-fun contains!4834 (ListLongMap!11491 (_ BitVec 64)) Bool)

(declare-fun +!2690 (ListLongMap!11491 tuple2!12792) ListLongMap!11491)

(assert (=> b!922568 (contains!4834 (+!2690 lt!414158 lt!414156) k0!1099)))

(declare-fun lt!414157 () Unit!31092)

(declare-fun lt!414160 () V!31087)

(declare-fun addStillContains!399 (ListLongMap!11491 (_ BitVec 64) V!31087 (_ BitVec 64)) Unit!31092)

(assert (=> b!922568 (= lt!414157 (addStillContains!399 lt!414158 lt!414163 lt!414160 k0!1099))))

(declare-fun getCurrentListMap!3014 (array!55207 array!55209 (_ BitVec 32) (_ BitVec 32) V!31087 V!31087 (_ BitVec 32) Int) ListLongMap!11491)

(assert (=> b!922568 (= (getCurrentListMap!3014 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2690 (getCurrentListMap!3014 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414156))))

(assert (=> b!922568 (= lt!414156 (tuple2!12793 lt!414163 lt!414160))))

(declare-fun get!13953 (ValueCell!9314 V!31087) V!31087)

(declare-fun dynLambda!1487 (Int (_ BitVec 64)) V!31087)

(assert (=> b!922568 (= lt!414160 (get!13953 (select (arr!26545 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1487 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414164 () Unit!31092)

(declare-fun lemmaListMapRecursiveValidKeyArray!70 (array!55207 array!55209 (_ BitVec 32) (_ BitVec 32) V!31087 V!31087 (_ BitVec 32) Int) Unit!31092)

(assert (=> b!922568 (= lt!414164 (lemmaListMapRecursiveValidKeyArray!70 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922569 () Bool)

(assert (=> b!922569 (= e!517763 (and e!517765 mapRes!31143))))

(declare-fun condMapEmpty!31143 () Bool)

(declare-fun mapDefault!31143 () ValueCell!9314)

(assert (=> b!922569 (= condMapEmpty!31143 (= (arr!26545 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9314)) mapDefault!31143)))))

(declare-fun b!922570 () Bool)

(assert (=> b!922570 (= e!517761 e!517762)))

(declare-fun res!621888 () Bool)

(assert (=> b!922570 (=> (not res!621888) (not e!517762))))

(assert (=> b!922570 (= res!621888 (contains!4834 lt!414158 k0!1099))))

(assert (=> b!922570 (= lt!414158 (getCurrentListMap!3014 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922571 () Bool)

(declare-fun res!621886 () Bool)

(assert (=> b!922571 (=> (not res!621886) (not e!517761))))

(assert (=> b!922571 (= res!621886 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27004 _keys!1487))))))

(assert (= (and start!79038 res!621887) b!922563))

(assert (= (and b!922563 res!621883) b!922560))

(assert (= (and b!922560 res!621884) b!922558))

(assert (= (and b!922558 res!621877) b!922571))

(assert (= (and b!922571 res!621886) b!922570))

(assert (= (and b!922570 res!621888) b!922567))

(assert (= (and b!922567 res!621876) b!922564))

(assert (= (and b!922564 res!621878) b!922556))

(assert (= (and b!922556 res!621885) b!922562))

(assert (= (and b!922562 res!621879) b!922568))

(assert (= (and b!922568 c!96408) b!922554))

(assert (= (and b!922568 (not c!96408)) b!922555))

(assert (= (and b!922568 (not res!621880)) b!922566))

(assert (= (and b!922566 (not res!621881)) b!922565))

(assert (= (and b!922565 (not res!621882)) b!922559))

(assert (= (and b!922569 condMapEmpty!31143) mapIsEmpty!31143))

(assert (= (and b!922569 (not condMapEmpty!31143)) mapNonEmpty!31143))

(get-info :version)

(assert (= (and mapNonEmpty!31143 ((_ is ValueCellFull!9314) mapValue!31143)) b!922561))

(assert (= (and b!922569 ((_ is ValueCellFull!9314) mapDefault!31143)) b!922557))

(assert (= start!79038 b!922569))

(declare-fun b_lambda!13599 () Bool)

(assert (=> (not b_lambda!13599) (not b!922568)))

(declare-fun t!26413 () Bool)

(declare-fun tb!5655 () Bool)

(assert (=> (and start!79038 (= defaultEntry!1235 defaultEntry!1235) t!26413) tb!5655))

(declare-fun result!11141 () Bool)

(assert (=> tb!5655 (= result!11141 tp_is_empty!19591)))

(assert (=> b!922568 t!26413))

(declare-fun b_and!27915 () Bool)

(assert (= b_and!27913 (and (=> t!26413 result!11141) b_and!27915)))

(declare-fun m!856909 () Bool)

(assert (=> mapNonEmpty!31143 m!856909))

(declare-fun m!856911 () Bool)

(assert (=> b!922567 m!856911))

(declare-fun m!856913 () Bool)

(assert (=> b!922562 m!856913))

(declare-fun m!856915 () Bool)

(assert (=> b!922562 m!856915))

(declare-fun m!856917 () Bool)

(assert (=> b!922565 m!856917))

(declare-fun m!856919 () Bool)

(assert (=> b!922568 m!856919))

(declare-fun m!856921 () Bool)

(assert (=> b!922568 m!856921))

(declare-fun m!856923 () Bool)

(assert (=> b!922568 m!856923))

(declare-fun m!856925 () Bool)

(assert (=> b!922568 m!856925))

(declare-fun m!856927 () Bool)

(assert (=> b!922568 m!856927))

(declare-fun m!856929 () Bool)

(assert (=> b!922568 m!856929))

(declare-fun m!856931 () Bool)

(assert (=> b!922568 m!856931))

(assert (=> b!922568 m!856923))

(assert (=> b!922568 m!856927))

(declare-fun m!856933 () Bool)

(assert (=> b!922568 m!856933))

(declare-fun m!856935 () Bool)

(assert (=> b!922568 m!856935))

(assert (=> b!922568 m!856921))

(declare-fun m!856937 () Bool)

(assert (=> b!922568 m!856937))

(declare-fun m!856939 () Bool)

(assert (=> b!922568 m!856939))

(declare-fun m!856941 () Bool)

(assert (=> b!922568 m!856941))

(assert (=> b!922568 m!856929))

(declare-fun m!856943 () Bool)

(assert (=> b!922568 m!856943))

(declare-fun m!856945 () Bool)

(assert (=> b!922558 m!856945))

(declare-fun m!856947 () Bool)

(assert (=> b!922556 m!856947))

(declare-fun m!856949 () Bool)

(assert (=> start!79038 m!856949))

(declare-fun m!856951 () Bool)

(assert (=> start!79038 m!856951))

(declare-fun m!856953 () Bool)

(assert (=> start!79038 m!856953))

(declare-fun m!856955 () Bool)

(assert (=> b!922566 m!856955))

(declare-fun m!856957 () Bool)

(assert (=> b!922570 m!856957))

(declare-fun m!856959 () Bool)

(assert (=> b!922570 m!856959))

(declare-fun m!856961 () Bool)

(assert (=> b!922560 m!856961))

(declare-fun m!856963 () Bool)

(assert (=> b!922559 m!856963))

(declare-fun m!856965 () Bool)

(assert (=> b!922554 m!856965))

(check-sat (not start!79038) (not b!922559) (not b_lambda!13599) (not b!922554) b_and!27915 (not b!922562) (not b!922566) (not b_next!17083) (not b!922565) tp_is_empty!19591 (not b!922558) (not b!922556) (not b!922568) (not b!922567) (not b!922560) (not mapNonEmpty!31143) (not b!922570))
(check-sat b_and!27915 (not b_next!17083))
