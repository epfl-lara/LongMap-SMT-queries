; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78764 () Bool)

(assert start!78764)

(declare-fun b_free!16977 () Bool)

(declare-fun b_next!16977 () Bool)

(assert (=> start!78764 (= b_free!16977 (not b_next!16977))))

(declare-fun tp!59372 () Bool)

(declare-fun b_and!27691 () Bool)

(assert (=> start!78764 (= tp!59372 b_and!27691)))

(declare-fun b!919108 () Bool)

(declare-fun res!619723 () Bool)

(declare-fun e!515917 () Bool)

(assert (=> b!919108 (=> (not res!619723) (not e!515917))))

(declare-datatypes ((array!54954 0))(
  ( (array!54955 (arr!26422 (Array (_ BitVec 32) (_ BitVec 64))) (size!26881 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54954)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30945 0))(
  ( (V!30946 (val!9793 Int)) )
))
(declare-datatypes ((ValueCell!9261 0))(
  ( (ValueCellFull!9261 (v!12311 V!30945)) (EmptyCell!9261) )
))
(declare-datatypes ((array!54956 0))(
  ( (array!54957 (arr!26423 (Array (_ BitVec 32) ValueCell!9261)) (size!26882 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54956)

(assert (=> b!919108 (= res!619723 (and (= (size!26882 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26881 _keys!1487) (size!26882 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919109 () Bool)

(declare-fun res!619728 () Bool)

(assert (=> b!919109 (=> (not res!619728) (not e!515917))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919109 (= res!619728 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26881 _keys!1487))))))

(declare-fun b!919110 () Bool)

(declare-fun e!515919 () Bool)

(assert (=> b!919110 (= e!515919 (not true))))

(declare-datatypes ((List!18532 0))(
  ( (Nil!18529) (Cons!18528 (h!19674 (_ BitVec 64)) (t!26239 List!18532)) )
))
(declare-fun arrayNoDuplicates!0 (array!54954 (_ BitVec 32) List!18532) Bool)

(assert (=> b!919110 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18529)))

(declare-datatypes ((Unit!31026 0))(
  ( (Unit!31027) )
))
(declare-fun lt!412537 () Unit!31026)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!54954 (_ BitVec 32) (_ BitVec 32)) Unit!31026)

(assert (=> b!919110 (= lt!412537 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12728 0))(
  ( (tuple2!12729 (_1!6375 (_ BitVec 64)) (_2!6375 V!30945)) )
))
(declare-datatypes ((List!18533 0))(
  ( (Nil!18530) (Cons!18529 (h!19675 tuple2!12728) (t!26240 List!18533)) )
))
(declare-datatypes ((ListLongMap!11425 0))(
  ( (ListLongMap!11426 (toList!5728 List!18533)) )
))
(declare-fun lt!412539 () ListLongMap!11425)

(declare-fun lt!412540 () tuple2!12728)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4774 (ListLongMap!11425 (_ BitVec 64)) Bool)

(declare-fun +!2639 (ListLongMap!11425 tuple2!12728) ListLongMap!11425)

(assert (=> b!919110 (contains!4774 (+!2639 lt!412539 lt!412540) k0!1099)))

(declare-fun lt!412534 () V!30945)

(declare-fun lt!412536 () (_ BitVec 64))

(declare-fun lt!412535 () Unit!31026)

(declare-fun addStillContains!363 (ListLongMap!11425 (_ BitVec 64) V!30945 (_ BitVec 64)) Unit!31026)

(assert (=> b!919110 (= lt!412535 (addStillContains!363 lt!412539 lt!412536 lt!412534 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30945)

(declare-fun minValue!1173 () V!30945)

(declare-fun getCurrentListMap!2984 (array!54954 array!54956 (_ BitVec 32) (_ BitVec 32) V!30945 V!30945 (_ BitVec 32) Int) ListLongMap!11425)

(assert (=> b!919110 (= (getCurrentListMap!2984 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2639 (getCurrentListMap!2984 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412540))))

(assert (=> b!919110 (= lt!412540 (tuple2!12729 lt!412536 lt!412534))))

(declare-fun get!13854 (ValueCell!9261 V!30945) V!30945)

(declare-fun dynLambda!1428 (Int (_ BitVec 64)) V!30945)

(assert (=> b!919110 (= lt!412534 (get!13854 (select (arr!26423 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1428 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412538 () Unit!31026)

(declare-fun lemmaListMapRecursiveValidKeyArray!29 (array!54954 array!54956 (_ BitVec 32) (_ BitVec 32) V!30945 V!30945 (_ BitVec 32) Int) Unit!31026)

(assert (=> b!919110 (= lt!412538 (lemmaListMapRecursiveValidKeyArray!29 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!619722 () Bool)

(assert (=> start!78764 (=> (not res!619722) (not e!515917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78764 (= res!619722 (validMask!0 mask!1881))))

(assert (=> start!78764 e!515917))

(assert (=> start!78764 true))

(declare-fun tp_is_empty!19485 () Bool)

(assert (=> start!78764 tp_is_empty!19485))

(declare-fun e!515918 () Bool)

(declare-fun array_inv!20592 (array!54956) Bool)

(assert (=> start!78764 (and (array_inv!20592 _values!1231) e!515918)))

(assert (=> start!78764 tp!59372))

(declare-fun array_inv!20593 (array!54954) Bool)

(assert (=> start!78764 (array_inv!20593 _keys!1487)))

(declare-fun b!919111 () Bool)

(declare-fun e!515920 () Bool)

(assert (=> b!919111 (= e!515920 tp_is_empty!19485)))

(declare-fun b!919112 () Bool)

(declare-fun res!619727 () Bool)

(assert (=> b!919112 (=> (not res!619727) (not e!515917))))

(assert (=> b!919112 (= res!619727 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18529))))

(declare-fun b!919113 () Bool)

(declare-fun e!515921 () Bool)

(assert (=> b!919113 (= e!515921 e!515919)))

(declare-fun res!619720 () Bool)

(assert (=> b!919113 (=> (not res!619720) (not e!515919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919113 (= res!619720 (validKeyInArray!0 lt!412536))))

(assert (=> b!919113 (= lt!412536 (select (arr!26422 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919114 () Bool)

(declare-fun res!619725 () Bool)

(assert (=> b!919114 (=> (not res!619725) (not e!515921))))

(declare-fun v!791 () V!30945)

(declare-fun apply!574 (ListLongMap!11425 (_ BitVec 64)) V!30945)

(assert (=> b!919114 (= res!619725 (= (apply!574 lt!412539 k0!1099) v!791))))

(declare-fun b!919115 () Bool)

(declare-fun res!619724 () Bool)

(assert (=> b!919115 (=> (not res!619724) (not e!515921))))

(assert (=> b!919115 (= res!619724 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!30984 () Bool)

(declare-fun mapRes!30984 () Bool)

(declare-fun tp!59371 () Bool)

(assert (=> mapNonEmpty!30984 (= mapRes!30984 (and tp!59371 e!515920))))

(declare-fun mapRest!30984 () (Array (_ BitVec 32) ValueCell!9261))

(declare-fun mapValue!30984 () ValueCell!9261)

(declare-fun mapKey!30984 () (_ BitVec 32))

(assert (=> mapNonEmpty!30984 (= (arr!26423 _values!1231) (store mapRest!30984 mapKey!30984 mapValue!30984))))

(declare-fun b!919116 () Bool)

(declare-fun e!515923 () Bool)

(assert (=> b!919116 (= e!515923 tp_is_empty!19485)))

(declare-fun b!919117 () Bool)

(assert (=> b!919117 (= e!515917 e!515921)))

(declare-fun res!619729 () Bool)

(assert (=> b!919117 (=> (not res!619729) (not e!515921))))

(assert (=> b!919117 (= res!619729 (contains!4774 lt!412539 k0!1099))))

(assert (=> b!919117 (= lt!412539 (getCurrentListMap!2984 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919118 () Bool)

(declare-fun res!619721 () Bool)

(assert (=> b!919118 (=> (not res!619721) (not e!515921))))

(assert (=> b!919118 (= res!619721 (validKeyInArray!0 k0!1099))))

(declare-fun b!919119 () Bool)

(declare-fun res!619726 () Bool)

(assert (=> b!919119 (=> (not res!619726) (not e!515917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54954 (_ BitVec 32)) Bool)

(assert (=> b!919119 (= res!619726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!30984 () Bool)

(assert (=> mapIsEmpty!30984 mapRes!30984))

(declare-fun b!919120 () Bool)

(assert (=> b!919120 (= e!515918 (and e!515923 mapRes!30984))))

(declare-fun condMapEmpty!30984 () Bool)

(declare-fun mapDefault!30984 () ValueCell!9261)

(assert (=> b!919120 (= condMapEmpty!30984 (= (arr!26423 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9261)) mapDefault!30984)))))

(assert (= (and start!78764 res!619722) b!919108))

(assert (= (and b!919108 res!619723) b!919119))

(assert (= (and b!919119 res!619726) b!919112))

(assert (= (and b!919112 res!619727) b!919109))

(assert (= (and b!919109 res!619728) b!919117))

(assert (= (and b!919117 res!619729) b!919114))

(assert (= (and b!919114 res!619725) b!919115))

(assert (= (and b!919115 res!619724) b!919118))

(assert (= (and b!919118 res!619721) b!919113))

(assert (= (and b!919113 res!619720) b!919110))

(assert (= (and b!919120 condMapEmpty!30984) mapIsEmpty!30984))

(assert (= (and b!919120 (not condMapEmpty!30984)) mapNonEmpty!30984))

(get-info :version)

(assert (= (and mapNonEmpty!30984 ((_ is ValueCellFull!9261) mapValue!30984)) b!919111))

(assert (= (and b!919120 ((_ is ValueCellFull!9261) mapDefault!30984)) b!919116))

(assert (= start!78764 b!919120))

(declare-fun b_lambda!13479 () Bool)

(assert (=> (not b_lambda!13479) (not b!919110)))

(declare-fun t!26238 () Bool)

(declare-fun tb!5557 () Bool)

(assert (=> (and start!78764 (= defaultEntry!1235 defaultEntry!1235) t!26238) tb!5557))

(declare-fun result!10937 () Bool)

(assert (=> tb!5557 (= result!10937 tp_is_empty!19485)))

(assert (=> b!919110 t!26238))

(declare-fun b_and!27693 () Bool)

(assert (= b_and!27691 (and (=> t!26238 result!10937) b_and!27693)))

(declare-fun m!852831 () Bool)

(assert (=> b!919117 m!852831))

(declare-fun m!852833 () Bool)

(assert (=> b!919117 m!852833))

(declare-fun m!852835 () Bool)

(assert (=> start!78764 m!852835))

(declare-fun m!852837 () Bool)

(assert (=> start!78764 m!852837))

(declare-fun m!852839 () Bool)

(assert (=> start!78764 m!852839))

(declare-fun m!852841 () Bool)

(assert (=> b!919114 m!852841))

(declare-fun m!852843 () Bool)

(assert (=> mapNonEmpty!30984 m!852843))

(declare-fun m!852845 () Bool)

(assert (=> b!919118 m!852845))

(declare-fun m!852847 () Bool)

(assert (=> b!919110 m!852847))

(declare-fun m!852849 () Bool)

(assert (=> b!919110 m!852849))

(declare-fun m!852851 () Bool)

(assert (=> b!919110 m!852851))

(declare-fun m!852853 () Bool)

(assert (=> b!919110 m!852853))

(declare-fun m!852855 () Bool)

(assert (=> b!919110 m!852855))

(declare-fun m!852857 () Bool)

(assert (=> b!919110 m!852857))

(declare-fun m!852859 () Bool)

(assert (=> b!919110 m!852859))

(declare-fun m!852861 () Bool)

(assert (=> b!919110 m!852861))

(declare-fun m!852863 () Bool)

(assert (=> b!919110 m!852863))

(assert (=> b!919110 m!852853))

(declare-fun m!852865 () Bool)

(assert (=> b!919110 m!852865))

(assert (=> b!919110 m!852851))

(assert (=> b!919110 m!852855))

(declare-fun m!852867 () Bool)

(assert (=> b!919110 m!852867))

(assert (=> b!919110 m!852847))

(declare-fun m!852869 () Bool)

(assert (=> b!919110 m!852869))

(declare-fun m!852871 () Bool)

(assert (=> b!919113 m!852871))

(declare-fun m!852873 () Bool)

(assert (=> b!919113 m!852873))

(declare-fun m!852875 () Bool)

(assert (=> b!919112 m!852875))

(declare-fun m!852877 () Bool)

(assert (=> b!919119 m!852877))

(check-sat (not start!78764) (not b!919112) (not b_next!16977) (not b!919117) (not b!919114) (not b_lambda!13479) tp_is_empty!19485 b_and!27693 (not b!919113) (not mapNonEmpty!30984) (not b!919118) (not b!919119) (not b!919110))
(check-sat b_and!27693 (not b_next!16977))
