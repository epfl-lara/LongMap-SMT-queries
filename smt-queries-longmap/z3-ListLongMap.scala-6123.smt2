; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78848 () Bool)

(assert start!78848)

(declare-fun b_free!17061 () Bool)

(declare-fun b_next!17061 () Bool)

(assert (=> start!78848 (= b_free!17061 (not b_next!17061))))

(declare-fun tp!59624 () Bool)

(declare-fun b_and!27859 () Bool)

(assert (=> start!78848 (= tp!59624 b_and!27859)))

(declare-fun mapIsEmpty!31110 () Bool)

(declare-fun mapRes!31110 () Bool)

(assert (=> mapIsEmpty!31110 mapRes!31110))

(declare-fun b!921035 () Bool)

(declare-fun res!621107 () Bool)

(declare-fun e!516884 () Bool)

(assert (=> b!921035 (=> (not res!621107) (not e!516884))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31057 0))(
  ( (V!31058 (val!9835 Int)) )
))
(declare-fun v!791 () V!31057)

(declare-datatypes ((tuple2!12788 0))(
  ( (tuple2!12789 (_1!6405 (_ BitVec 64)) (_2!6405 V!31057)) )
))
(declare-datatypes ((List!18591 0))(
  ( (Nil!18588) (Cons!18587 (h!19733 tuple2!12788) (t!26382 List!18591)) )
))
(declare-datatypes ((ListLongMap!11485 0))(
  ( (ListLongMap!11486 (toList!5758 List!18591)) )
))
(declare-fun lt!413498 () ListLongMap!11485)

(declare-fun apply!599 (ListLongMap!11485 (_ BitVec 64)) V!31057)

(assert (=> b!921035 (= res!621107 (= (apply!599 lt!413498 k0!1099) v!791))))

(declare-fun b!921036 () Bool)

(declare-fun res!621113 () Bool)

(declare-fun e!516886 () Bool)

(assert (=> b!921036 (=> (not res!621113) (not e!516886))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55118 0))(
  ( (array!55119 (arr!26504 (Array (_ BitVec 32) (_ BitVec 64))) (size!26963 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55118)

(assert (=> b!921036 (= res!621113 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26963 _keys!1487))))))

(declare-fun mapNonEmpty!31110 () Bool)

(declare-fun tp!59623 () Bool)

(declare-fun e!516885 () Bool)

(assert (=> mapNonEmpty!31110 (= mapRes!31110 (and tp!59623 e!516885))))

(declare-fun mapKey!31110 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9303 0))(
  ( (ValueCellFull!9303 (v!12353 V!31057)) (EmptyCell!9303) )
))
(declare-fun mapValue!31110 () ValueCell!9303)

(declare-datatypes ((array!55120 0))(
  ( (array!55121 (arr!26505 (Array (_ BitVec 32) ValueCell!9303)) (size!26964 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55120)

(declare-fun mapRest!31110 () (Array (_ BitVec 32) ValueCell!9303))

(assert (=> mapNonEmpty!31110 (= (arr!26505 _values!1231) (store mapRest!31110 mapKey!31110 mapValue!31110))))

(declare-fun b!921037 () Bool)

(declare-fun e!516889 () Bool)

(assert (=> b!921037 (= e!516889 true)))

(declare-fun lt!413506 () Bool)

(declare-datatypes ((List!18592 0))(
  ( (Nil!18589) (Cons!18588 (h!19734 (_ BitVec 64)) (t!26383 List!18592)) )
))
(declare-fun contains!4811 (List!18592 (_ BitVec 64)) Bool)

(assert (=> b!921037 (= lt!413506 (contains!4811 Nil!18589 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921038 () Bool)

(declare-fun e!516881 () Bool)

(declare-fun tp_is_empty!19569 () Bool)

(assert (=> b!921038 (= e!516881 tp_is_empty!19569)))

(declare-fun b!921039 () Bool)

(declare-fun e!516882 () Bool)

(assert (=> b!921039 (= e!516882 (and e!516881 mapRes!31110))))

(declare-fun condMapEmpty!31110 () Bool)

(declare-fun mapDefault!31110 () ValueCell!9303)

(assert (=> b!921039 (= condMapEmpty!31110 (= (arr!26505 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9303)) mapDefault!31110)))))

(declare-fun b!921040 () Bool)

(declare-fun res!621103 () Bool)

(assert (=> b!921040 (=> (not res!621103) (not e!516884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921040 (= res!621103 (validKeyInArray!0 k0!1099))))

(declare-fun b!921041 () Bool)

(assert (=> b!921041 (= e!516885 tp_is_empty!19569)))

(declare-fun b!921042 () Bool)

(declare-fun res!621106 () Bool)

(assert (=> b!921042 (=> (not res!621106) (not e!516886))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(assert (=> b!921042 (= res!621106 (and (= (size!26964 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26963 _keys!1487) (size!26964 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921043 () Bool)

(declare-fun res!621105 () Bool)

(assert (=> b!921043 (=> (not res!621105) (not e!516886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55118 (_ BitVec 32)) Bool)

(assert (=> b!921043 (= res!621105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921044 () Bool)

(declare-fun res!621108 () Bool)

(assert (=> b!921044 (=> res!621108 e!516889)))

(declare-fun noDuplicate!1339 (List!18592) Bool)

(assert (=> b!921044 (= res!621108 (not (noDuplicate!1339 Nil!18589)))))

(declare-fun b!921046 () Bool)

(declare-fun res!621111 () Bool)

(assert (=> b!921046 (=> (not res!621111) (not e!516886))))

(declare-fun arrayNoDuplicates!0 (array!55118 (_ BitVec 32) List!18592) Bool)

(assert (=> b!921046 (= res!621111 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18589))))

(declare-fun b!921047 () Bool)

(declare-fun e!516887 () Bool)

(assert (=> b!921047 (= e!516884 e!516887)))

(declare-fun res!621112 () Bool)

(assert (=> b!921047 (=> (not res!621112) (not e!516887))))

(declare-fun lt!413504 () (_ BitVec 64))

(assert (=> b!921047 (= res!621112 (validKeyInArray!0 lt!413504))))

(assert (=> b!921047 (= lt!413504 (select (arr!26504 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921048 () Bool)

(assert (=> b!921048 (= e!516886 e!516884)))

(declare-fun res!621110 () Bool)

(assert (=> b!921048 (=> (not res!621110) (not e!516884))))

(declare-fun contains!4812 (ListLongMap!11485 (_ BitVec 64)) Bool)

(assert (=> b!921048 (= res!621110 (contains!4812 lt!413498 k0!1099))))

(declare-fun zeroValue!1173 () V!31057)

(declare-fun minValue!1173 () V!31057)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3012 (array!55118 array!55120 (_ BitVec 32) (_ BitVec 32) V!31057 V!31057 (_ BitVec 32) Int) ListLongMap!11485)

(assert (=> b!921048 (= lt!413498 (getCurrentListMap!3012 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!921049 () Bool)

(declare-fun e!516888 () Bool)

(declare-fun arrayContainsKey!0 (array!55118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921049 (= e!516888 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921050 () Bool)

(declare-fun res!621104 () Bool)

(assert (=> b!921050 (=> (not res!621104) (not e!516884))))

(assert (=> b!921050 (= res!621104 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921051 () Bool)

(declare-fun res!621114 () Bool)

(assert (=> b!921051 (=> res!621114 e!516889)))

(assert (=> b!921051 (= res!621114 (contains!4811 Nil!18589 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921052 () Bool)

(assert (=> b!921052 (= e!516887 (not e!516889))))

(declare-fun res!621115 () Bool)

(assert (=> b!921052 (=> res!621115 e!516889)))

(assert (=> b!921052 (= res!621115 (or (bvsge (size!26963 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26963 _keys!1487))))))

(assert (=> b!921052 e!516888))

(declare-fun c!96093 () Bool)

(assert (=> b!921052 (= c!96093 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31078 0))(
  ( (Unit!31079) )
))
(declare-fun lt!413499 () Unit!31078)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!172 (array!55118 array!55120 (_ BitVec 32) (_ BitVec 32) V!31057 V!31057 (_ BitVec 64) (_ BitVec 32) Int) Unit!31078)

(assert (=> b!921052 (= lt!413499 (lemmaListMapContainsThenArrayContainsFrom!172 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!921052 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18589)))

(declare-fun lt!413502 () Unit!31078)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55118 (_ BitVec 32) (_ BitVec 32)) Unit!31078)

(assert (=> b!921052 (= lt!413502 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413503 () tuple2!12788)

(declare-fun +!2665 (ListLongMap!11485 tuple2!12788) ListLongMap!11485)

(assert (=> b!921052 (contains!4812 (+!2665 lt!413498 lt!413503) k0!1099)))

(declare-fun lt!413505 () Unit!31078)

(declare-fun lt!413501 () V!31057)

(declare-fun addStillContains!389 (ListLongMap!11485 (_ BitVec 64) V!31057 (_ BitVec 64)) Unit!31078)

(assert (=> b!921052 (= lt!413505 (addStillContains!389 lt!413498 lt!413504 lt!413501 k0!1099))))

(assert (=> b!921052 (= (getCurrentListMap!3012 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2665 (getCurrentListMap!3012 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413503))))

(assert (=> b!921052 (= lt!413503 (tuple2!12789 lt!413504 lt!413501))))

(declare-fun get!13908 (ValueCell!9303 V!31057) V!31057)

(declare-fun dynLambda!1454 (Int (_ BitVec 64)) V!31057)

(assert (=> b!921052 (= lt!413501 (get!13908 (select (arr!26505 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1454 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413500 () Unit!31078)

(declare-fun lemmaListMapRecursiveValidKeyArray!55 (array!55118 array!55120 (_ BitVec 32) (_ BitVec 32) V!31057 V!31057 (_ BitVec 32) Int) Unit!31078)

(assert (=> b!921052 (= lt!413500 (lemmaListMapRecursiveValidKeyArray!55 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921045 () Bool)

(assert (=> b!921045 (= e!516888 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!621109 () Bool)

(assert (=> start!78848 (=> (not res!621109) (not e!516886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78848 (= res!621109 (validMask!0 mask!1881))))

(assert (=> start!78848 e!516886))

(assert (=> start!78848 true))

(assert (=> start!78848 tp_is_empty!19569))

(declare-fun array_inv!20654 (array!55120) Bool)

(assert (=> start!78848 (and (array_inv!20654 _values!1231) e!516882)))

(assert (=> start!78848 tp!59624))

(declare-fun array_inv!20655 (array!55118) Bool)

(assert (=> start!78848 (array_inv!20655 _keys!1487)))

(assert (= (and start!78848 res!621109) b!921042))

(assert (= (and b!921042 res!621106) b!921043))

(assert (= (and b!921043 res!621105) b!921046))

(assert (= (and b!921046 res!621111) b!921036))

(assert (= (and b!921036 res!621113) b!921048))

(assert (= (and b!921048 res!621110) b!921035))

(assert (= (and b!921035 res!621107) b!921050))

(assert (= (and b!921050 res!621104) b!921040))

(assert (= (and b!921040 res!621103) b!921047))

(assert (= (and b!921047 res!621112) b!921052))

(assert (= (and b!921052 c!96093) b!921049))

(assert (= (and b!921052 (not c!96093)) b!921045))

(assert (= (and b!921052 (not res!621115)) b!921044))

(assert (= (and b!921044 (not res!621108)) b!921051))

(assert (= (and b!921051 (not res!621114)) b!921037))

(assert (= (and b!921039 condMapEmpty!31110) mapIsEmpty!31110))

(assert (= (and b!921039 (not condMapEmpty!31110)) mapNonEmpty!31110))

(get-info :version)

(assert (= (and mapNonEmpty!31110 ((_ is ValueCellFull!9303) mapValue!31110)) b!921041))

(assert (= (and b!921039 ((_ is ValueCellFull!9303) mapDefault!31110)) b!921038))

(assert (= start!78848 b!921039))

(declare-fun b_lambda!13563 () Bool)

(assert (=> (not b_lambda!13563) (not b!921052)))

(declare-fun t!26381 () Bool)

(declare-fun tb!5641 () Bool)

(assert (=> (and start!78848 (= defaultEntry!1235 defaultEntry!1235) t!26381) tb!5641))

(declare-fun result!11105 () Bool)

(assert (=> tb!5641 (= result!11105 tp_is_empty!19569)))

(assert (=> b!921052 t!26381))

(declare-fun b_and!27861 () Bool)

(assert (= b_and!27859 (and (=> t!26381 result!11105) b_and!27861)))

(declare-fun m!854977 () Bool)

(assert (=> b!921043 m!854977))

(declare-fun m!854979 () Bool)

(assert (=> b!921037 m!854979))

(declare-fun m!854981 () Bool)

(assert (=> start!78848 m!854981))

(declare-fun m!854983 () Bool)

(assert (=> start!78848 m!854983))

(declare-fun m!854985 () Bool)

(assert (=> start!78848 m!854985))

(declare-fun m!854987 () Bool)

(assert (=> b!921040 m!854987))

(declare-fun m!854989 () Bool)

(assert (=> b!921047 m!854989))

(declare-fun m!854991 () Bool)

(assert (=> b!921047 m!854991))

(declare-fun m!854993 () Bool)

(assert (=> b!921051 m!854993))

(declare-fun m!854995 () Bool)

(assert (=> b!921052 m!854995))

(declare-fun m!854997 () Bool)

(assert (=> b!921052 m!854997))

(declare-fun m!854999 () Bool)

(assert (=> b!921052 m!854999))

(declare-fun m!855001 () Bool)

(assert (=> b!921052 m!855001))

(declare-fun m!855003 () Bool)

(assert (=> b!921052 m!855003))

(assert (=> b!921052 m!854997))

(assert (=> b!921052 m!855003))

(declare-fun m!855005 () Bool)

(assert (=> b!921052 m!855005))

(declare-fun m!855007 () Bool)

(assert (=> b!921052 m!855007))

(declare-fun m!855009 () Bool)

(assert (=> b!921052 m!855009))

(declare-fun m!855011 () Bool)

(assert (=> b!921052 m!855011))

(assert (=> b!921052 m!854995))

(declare-fun m!855013 () Bool)

(assert (=> b!921052 m!855013))

(declare-fun m!855015 () Bool)

(assert (=> b!921052 m!855015))

(assert (=> b!921052 m!854999))

(declare-fun m!855017 () Bool)

(assert (=> b!921052 m!855017))

(declare-fun m!855019 () Bool)

(assert (=> b!921052 m!855019))

(declare-fun m!855021 () Bool)

(assert (=> b!921049 m!855021))

(declare-fun m!855023 () Bool)

(assert (=> b!921035 m!855023))

(declare-fun m!855025 () Bool)

(assert (=> b!921048 m!855025))

(declare-fun m!855027 () Bool)

(assert (=> b!921048 m!855027))

(declare-fun m!855029 () Bool)

(assert (=> mapNonEmpty!31110 m!855029))

(declare-fun m!855031 () Bool)

(assert (=> b!921044 m!855031))

(declare-fun m!855033 () Bool)

(assert (=> b!921046 m!855033))

(check-sat (not start!78848) (not b!921035) (not b!921046) tp_is_empty!19569 (not b!921040) (not b!921047) (not b!921052) (not b_lambda!13563) (not b!921044) (not b!921049) (not b!921043) (not b!921051) (not mapNonEmpty!31110) (not b!921037) (not b!921048) (not b_next!17061) b_and!27861)
(check-sat b_and!27861 (not b_next!17061))
