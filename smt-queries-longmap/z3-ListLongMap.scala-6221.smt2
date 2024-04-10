; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79494 () Bool)

(assert start!79494)

(declare-fun b_free!17649 () Bool)

(declare-fun b_next!17649 () Bool)

(assert (=> start!79494 (= b_free!17649 (not b_next!17649))))

(declare-fun tp!61393 () Bool)

(declare-fun b_and!28865 () Bool)

(assert (=> start!79494 (= tp!61393 b_and!28865)))

(declare-fun b!934559 () Bool)

(declare-fun res!629423 () Bool)

(declare-fun e!524742 () Bool)

(assert (=> b!934559 (=> (not res!629423) (not e!524742))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31841 0))(
  ( (V!31842 (val!10129 Int)) )
))
(declare-fun v!791 () V!31841)

(declare-datatypes ((tuple2!13288 0))(
  ( (tuple2!13289 (_1!6655 (_ BitVec 64)) (_2!6655 V!31841)) )
))
(declare-datatypes ((List!19068 0))(
  ( (Nil!19065) (Cons!19064 (h!20210 tuple2!13288) (t!27261 List!19068)) )
))
(declare-datatypes ((ListLongMap!11985 0))(
  ( (ListLongMap!11986 (toList!6008 List!19068)) )
))
(declare-fun lt!421042 () ListLongMap!11985)

(declare-fun apply!812 (ListLongMap!11985 (_ BitVec 64)) V!31841)

(assert (=> b!934559 (= res!629423 (= (apply!812 lt!421042 k0!1099) v!791))))

(declare-fun res!629424 () Bool)

(declare-fun e!524745 () Bool)

(assert (=> start!79494 (=> (not res!629424) (not e!524745))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79494 (= res!629424 (validMask!0 mask!1881))))

(assert (=> start!79494 e!524745))

(assert (=> start!79494 true))

(declare-fun tp_is_empty!20157 () Bool)

(assert (=> start!79494 tp_is_empty!20157))

(declare-datatypes ((ValueCell!9597 0))(
  ( (ValueCellFull!9597 (v!12649 V!31841)) (EmptyCell!9597) )
))
(declare-datatypes ((array!56252 0))(
  ( (array!56253 (arr!27069 (Array (_ BitVec 32) ValueCell!9597)) (size!27528 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56252)

(declare-fun e!524743 () Bool)

(declare-fun array_inv!21066 (array!56252) Bool)

(assert (=> start!79494 (and (array_inv!21066 _values!1231) e!524743)))

(assert (=> start!79494 tp!61393))

(declare-datatypes ((array!56254 0))(
  ( (array!56255 (arr!27070 (Array (_ BitVec 32) (_ BitVec 64))) (size!27529 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56254)

(declare-fun array_inv!21067 (array!56254) Bool)

(assert (=> start!79494 (array_inv!21067 _keys!1487)))

(declare-fun b!934560 () Bool)

(declare-fun e!524748 () Bool)

(assert (=> b!934560 (= e!524748 tp_is_empty!20157)))

(declare-fun b!934561 () Bool)

(assert (=> b!934561 (= e!524745 e!524742)))

(declare-fun res!629425 () Bool)

(assert (=> b!934561 (=> (not res!629425) (not e!524742))))

(declare-fun contains!5058 (ListLongMap!11985 (_ BitVec 64)) Bool)

(assert (=> b!934561 (= res!629425 (contains!5058 lt!421042 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31841)

(declare-fun minValue!1173 () V!31841)

(declare-fun getCurrentListMap!3245 (array!56254 array!56252 (_ BitVec 32) (_ BitVec 32) V!31841 V!31841 (_ BitVec 32) Int) ListLongMap!11985)

(assert (=> b!934561 (= lt!421042 (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934562 () Bool)

(declare-fun e!524747 () Bool)

(assert (=> b!934562 (= e!524742 e!524747)))

(declare-fun res!629426 () Bool)

(assert (=> b!934562 (=> (not res!629426) (not e!524747))))

(declare-fun lt!421044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934562 (= res!629426 (validKeyInArray!0 lt!421044))))

(assert (=> b!934562 (= lt!421044 (select (arr!27070 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934563 () Bool)

(declare-fun mapRes!31998 () Bool)

(assert (=> b!934563 (= e!524743 (and e!524748 mapRes!31998))))

(declare-fun condMapEmpty!31998 () Bool)

(declare-fun mapDefault!31998 () ValueCell!9597)

(assert (=> b!934563 (= condMapEmpty!31998 (= (arr!27069 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9597)) mapDefault!31998)))))

(declare-fun b!934564 () Bool)

(declare-fun res!629427 () Bool)

(assert (=> b!934564 (=> (not res!629427) (not e!524742))))

(assert (=> b!934564 (= res!629427 (validKeyInArray!0 k0!1099))))

(declare-fun b!934565 () Bool)

(declare-fun res!629422 () Bool)

(assert (=> b!934565 (=> (not res!629422) (not e!524745))))

(assert (=> b!934565 (= res!629422 (and (= (size!27528 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27529 _keys!1487) (size!27528 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!934566 () Bool)

(declare-fun res!629421 () Bool)

(assert (=> b!934566 (=> (not res!629421) (not e!524745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56254 (_ BitVec 32)) Bool)

(assert (=> b!934566 (= res!629421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!934567 () Bool)

(declare-fun e!524746 () Bool)

(assert (=> b!934567 (= e!524746 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!31998 () Bool)

(assert (=> mapIsEmpty!31998 mapRes!31998))

(declare-fun b!934568 () Bool)

(declare-fun res!629420 () Bool)

(assert (=> b!934568 (=> (not res!629420) (not e!524745))))

(assert (=> b!934568 (= res!629420 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27529 _keys!1487))))))

(declare-fun b!934569 () Bool)

(declare-fun arrayContainsKey!0 (array!56254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!934569 (= e!524746 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!934570 () Bool)

(declare-fun res!629419 () Bool)

(assert (=> b!934570 (=> (not res!629419) (not e!524745))))

(declare-datatypes ((List!19069 0))(
  ( (Nil!19066) (Cons!19065 (h!20211 (_ BitVec 64)) (t!27262 List!19069)) )
))
(declare-fun arrayNoDuplicates!0 (array!56254 (_ BitVec 32) List!19069) Bool)

(assert (=> b!934570 (= res!629419 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19066))))

(declare-fun b!934571 () Bool)

(declare-fun e!524741 () Bool)

(assert (=> b!934571 (= e!524741 tp_is_empty!20157)))

(declare-fun b!934572 () Bool)

(declare-fun res!629428 () Bool)

(assert (=> b!934572 (=> (not res!629428) (not e!524742))))

(assert (=> b!934572 (= res!629428 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!31998 () Bool)

(declare-fun tp!61394 () Bool)

(assert (=> mapNonEmpty!31998 (= mapRes!31998 (and tp!61394 e!524741))))

(declare-fun mapRest!31998 () (Array (_ BitVec 32) ValueCell!9597))

(declare-fun mapKey!31998 () (_ BitVec 32))

(declare-fun mapValue!31998 () ValueCell!9597)

(assert (=> mapNonEmpty!31998 (= (arr!27069 _values!1231) (store mapRest!31998 mapKey!31998 mapValue!31998))))

(declare-fun b!934573 () Bool)

(assert (=> b!934573 (= e!524747 (not (or (bvsge (size!27529 _keys!1487) #b01111111111111111111111111111111) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27529 _keys!1487)))))))

(assert (=> b!934573 e!524746))

(declare-fun c!97164 () Bool)

(assert (=> b!934573 (= c!97164 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31532 0))(
  ( (Unit!31533) )
))
(declare-fun lt!421041 () Unit!31532)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!278 (array!56254 array!56252 (_ BitVec 32) (_ BitVec 32) V!31841 V!31841 (_ BitVec 64) (_ BitVec 32) Int) Unit!31532)

(assert (=> b!934573 (= lt!421041 (lemmaListMapContainsThenArrayContainsFrom!278 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!934573 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19066)))

(declare-fun lt!421046 () Unit!31532)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56254 (_ BitVec 32) (_ BitVec 32)) Unit!31532)

(assert (=> b!934573 (= lt!421046 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421043 () tuple2!13288)

(declare-fun +!2806 (ListLongMap!11985 tuple2!13288) ListLongMap!11985)

(assert (=> b!934573 (contains!5058 (+!2806 lt!421042 lt!421043) k0!1099)))

(declare-fun lt!421040 () Unit!31532)

(declare-fun lt!421045 () V!31841)

(declare-fun addStillContains!525 (ListLongMap!11985 (_ BitVec 64) V!31841 (_ BitVec 64)) Unit!31532)

(assert (=> b!934573 (= lt!421040 (addStillContains!525 lt!421042 lt!421044 lt!421045 k0!1099))))

(assert (=> b!934573 (= (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2806 (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421043))))

(assert (=> b!934573 (= lt!421043 (tuple2!13289 lt!421044 lt!421045))))

(declare-fun get!14251 (ValueCell!9597 V!31841) V!31841)

(declare-fun dynLambda!1595 (Int (_ BitVec 64)) V!31841)

(assert (=> b!934573 (= lt!421045 (get!14251 (select (arr!27069 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1595 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421047 () Unit!31532)

(declare-fun lemmaListMapRecursiveValidKeyArray!196 (array!56254 array!56252 (_ BitVec 32) (_ BitVec 32) V!31841 V!31841 (_ BitVec 32) Int) Unit!31532)

(assert (=> b!934573 (= lt!421047 (lemmaListMapRecursiveValidKeyArray!196 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!79494 res!629424) b!934565))

(assert (= (and b!934565 res!629422) b!934566))

(assert (= (and b!934566 res!629421) b!934570))

(assert (= (and b!934570 res!629419) b!934568))

(assert (= (and b!934568 res!629420) b!934561))

(assert (= (and b!934561 res!629425) b!934559))

(assert (= (and b!934559 res!629423) b!934572))

(assert (= (and b!934572 res!629428) b!934564))

(assert (= (and b!934564 res!629427) b!934562))

(assert (= (and b!934562 res!629426) b!934573))

(assert (= (and b!934573 c!97164) b!934569))

(assert (= (and b!934573 (not c!97164)) b!934567))

(assert (= (and b!934563 condMapEmpty!31998) mapIsEmpty!31998))

(assert (= (and b!934563 (not condMapEmpty!31998)) mapNonEmpty!31998))

(get-info :version)

(assert (= (and mapNonEmpty!31998 ((_ is ValueCellFull!9597) mapValue!31998)) b!934571))

(assert (= (and b!934563 ((_ is ValueCellFull!9597) mapDefault!31998)) b!934560))

(assert (= start!79494 b!934563))

(declare-fun b_lambda!14001 () Bool)

(assert (=> (not b_lambda!14001) (not b!934573)))

(declare-fun t!27260 () Bool)

(declare-fun tb!6043 () Bool)

(assert (=> (and start!79494 (= defaultEntry!1235 defaultEntry!1235) t!27260) tb!6043))

(declare-fun result!11913 () Bool)

(assert (=> tb!6043 (= result!11913 tp_is_empty!20157)))

(assert (=> b!934573 t!27260))

(declare-fun b_and!28867 () Bool)

(assert (= b_and!28865 (and (=> t!27260 result!11913) b_and!28867)))

(declare-fun m!868867 () Bool)

(assert (=> b!934561 m!868867))

(declare-fun m!868869 () Bool)

(assert (=> b!934561 m!868869))

(declare-fun m!868871 () Bool)

(assert (=> b!934562 m!868871))

(declare-fun m!868873 () Bool)

(assert (=> b!934562 m!868873))

(declare-fun m!868875 () Bool)

(assert (=> mapNonEmpty!31998 m!868875))

(declare-fun m!868877 () Bool)

(assert (=> b!934559 m!868877))

(declare-fun m!868879 () Bool)

(assert (=> b!934564 m!868879))

(declare-fun m!868881 () Bool)

(assert (=> b!934566 m!868881))

(declare-fun m!868883 () Bool)

(assert (=> b!934573 m!868883))

(declare-fun m!868885 () Bool)

(assert (=> b!934573 m!868885))

(declare-fun m!868887 () Bool)

(assert (=> b!934573 m!868887))

(declare-fun m!868889 () Bool)

(assert (=> b!934573 m!868889))

(declare-fun m!868891 () Bool)

(assert (=> b!934573 m!868891))

(declare-fun m!868893 () Bool)

(assert (=> b!934573 m!868893))

(declare-fun m!868895 () Bool)

(assert (=> b!934573 m!868895))

(assert (=> b!934573 m!868891))

(assert (=> b!934573 m!868893))

(declare-fun m!868897 () Bool)

(assert (=> b!934573 m!868897))

(declare-fun m!868899 () Bool)

(assert (=> b!934573 m!868899))

(assert (=> b!934573 m!868883))

(declare-fun m!868901 () Bool)

(assert (=> b!934573 m!868901))

(declare-fun m!868903 () Bool)

(assert (=> b!934573 m!868903))

(declare-fun m!868905 () Bool)

(assert (=> b!934573 m!868905))

(assert (=> b!934573 m!868887))

(declare-fun m!868907 () Bool)

(assert (=> b!934573 m!868907))

(declare-fun m!868909 () Bool)

(assert (=> start!79494 m!868909))

(declare-fun m!868911 () Bool)

(assert (=> start!79494 m!868911))

(declare-fun m!868913 () Bool)

(assert (=> start!79494 m!868913))

(declare-fun m!868915 () Bool)

(assert (=> b!934570 m!868915))

(declare-fun m!868917 () Bool)

(assert (=> b!934569 m!868917))

(check-sat (not b_lambda!14001) (not b!934564) (not b!934559) (not b!934570) (not b!934573) (not b!934562) (not b!934569) b_and!28867 (not b_next!17649) (not b!934561) tp_is_empty!20157 (not b!934566) (not start!79494) (not mapNonEmpty!31998))
(check-sat b_and!28867 (not b_next!17649))
