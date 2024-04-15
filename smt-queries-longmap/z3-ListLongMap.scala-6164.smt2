; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79074 () Bool)

(assert start!79074)

(declare-fun b_free!17305 () Bool)

(declare-fun b_next!17305 () Bool)

(assert (=> start!79074 (= b_free!17305 (not b_next!17305))))

(declare-fun tp!60357 () Bool)

(declare-fun b_and!28321 () Bool)

(assert (=> start!79074 (= tp!60357 b_and!28321)))

(declare-fun b!927632 () Bool)

(declare-datatypes ((Unit!31296 0))(
  ( (Unit!31297) )
))
(declare-fun e!520794 () Unit!31296)

(declare-fun Unit!31298 () Unit!31296)

(assert (=> b!927632 (= e!520794 Unit!31298)))

(declare-fun b!927633 () Bool)

(declare-fun e!520790 () Unit!31296)

(assert (=> b!927633 (= e!520790 e!520794)))

(declare-fun lt!418113 () (_ BitVec 64))

(declare-datatypes ((array!55559 0))(
  ( (array!55560 (arr!26725 (Array (_ BitVec 32) (_ BitVec 64))) (size!27186 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55559)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!927633 (= lt!418113 (select (arr!26725 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96868 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927633 (= c!96868 (validKeyInArray!0 lt!418113))))

(declare-fun b!927634 () Bool)

(declare-fun Unit!31299 () Unit!31296)

(assert (=> b!927634 (= e!520790 Unit!31299)))

(declare-fun b!927635 () Bool)

(declare-fun res!624815 () Bool)

(declare-fun e!520782 () Bool)

(assert (=> b!927635 (=> (not res!624815) (not e!520782))))

(assert (=> b!927635 (= res!624815 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27186 _keys!1487))))))

(declare-fun mapIsEmpty!31476 () Bool)

(declare-fun mapRes!31476 () Bool)

(assert (=> mapIsEmpty!31476 mapRes!31476))

(declare-fun b!927636 () Bool)

(declare-fun e!520789 () Bool)

(declare-fun e!520784 () Bool)

(assert (=> b!927636 (= e!520789 e!520784)))

(declare-fun res!624821 () Bool)

(assert (=> b!927636 (=> (not res!624821) (not e!520784))))

(assert (=> b!927636 (= res!624821 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27186 _keys!1487)))))

(declare-fun lt!418114 () Unit!31296)

(assert (=> b!927636 (= lt!418114 e!520790)))

(declare-fun c!96867 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!927636 (= c!96867 (validKeyInArray!0 k0!1099))))

(declare-fun res!624817 () Bool)

(assert (=> start!79074 (=> (not res!624817) (not e!520782))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79074 (= res!624817 (validMask!0 mask!1881))))

(assert (=> start!79074 e!520782))

(assert (=> start!79074 true))

(declare-fun tp_is_empty!19813 () Bool)

(assert (=> start!79074 tp_is_empty!19813))

(declare-datatypes ((V!31383 0))(
  ( (V!31384 (val!9957 Int)) )
))
(declare-datatypes ((ValueCell!9425 0))(
  ( (ValueCellFull!9425 (v!12474 V!31383)) (EmptyCell!9425) )
))
(declare-datatypes ((array!55561 0))(
  ( (array!55562 (arr!26726 (Array (_ BitVec 32) ValueCell!9425)) (size!27187 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55561)

(declare-fun e!520783 () Bool)

(declare-fun array_inv!20896 (array!55561) Bool)

(assert (=> start!79074 (and (array_inv!20896 _values!1231) e!520783)))

(assert (=> start!79074 tp!60357))

(declare-fun array_inv!20897 (array!55559) Bool)

(assert (=> start!79074 (array_inv!20897 _keys!1487)))

(declare-fun b!927637 () Bool)

(declare-fun e!520791 () Bool)

(assert (=> b!927637 (= e!520791 (not true))))

(declare-fun e!520793 () Bool)

(assert (=> b!927637 e!520793))

(declare-fun res!624812 () Bool)

(assert (=> b!927637 (=> (not res!624812) (not e!520793))))

(declare-datatypes ((tuple2!13058 0))(
  ( (tuple2!13059 (_1!6540 (_ BitVec 64)) (_2!6540 V!31383)) )
))
(declare-datatypes ((List!18827 0))(
  ( (Nil!18824) (Cons!18823 (h!19969 tuple2!13058) (t!26853 List!18827)) )
))
(declare-datatypes ((ListLongMap!11745 0))(
  ( (ListLongMap!11746 (toList!5888 List!18827)) )
))
(declare-fun lt!418122 () ListLongMap!11745)

(declare-fun contains!4899 (ListLongMap!11745 (_ BitVec 64)) Bool)

(assert (=> b!927637 (= res!624812 (contains!4899 lt!418122 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31383)

(declare-fun minValue!1173 () V!31383)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3073 (array!55559 array!55561 (_ BitVec 32) (_ BitVec 32) V!31383 V!31383 (_ BitVec 32) Int) ListLongMap!11745)

(assert (=> b!927637 (= lt!418122 (getCurrentListMap!3073 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun v!791 () V!31383)

(declare-fun lt!418116 () Unit!31296)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!100 (array!55559 array!55561 (_ BitVec 32) (_ BitVec 32) V!31383 V!31383 (_ BitVec 64) V!31383 (_ BitVec 32) Int) Unit!31296)

(assert (=> b!927637 (= lt!418116 (lemmaListMapApplyFromThenApplyFromZero!100 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927638 () Bool)

(declare-fun res!624816 () Bool)

(assert (=> b!927638 (=> (not res!624816) (not e!520782))))

(assert (=> b!927638 (= res!624816 (and (= (size!27187 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27186 _keys!1487) (size!27187 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927639 () Bool)

(declare-fun e!520786 () Bool)

(declare-fun arrayContainsKey!0 (array!55559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927639 (= e!520786 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!927640 () Bool)

(declare-fun res!624813 () Bool)

(assert (=> b!927640 (=> (not res!624813) (not e!520782))))

(declare-datatypes ((List!18828 0))(
  ( (Nil!18825) (Cons!18824 (h!19970 (_ BitVec 64)) (t!26854 List!18828)) )
))
(declare-fun arrayNoDuplicates!0 (array!55559 (_ BitVec 32) List!18828) Bool)

(assert (=> b!927640 (= res!624813 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18825))))

(declare-fun b!927641 () Bool)

(declare-fun e!520792 () Bool)

(assert (=> b!927641 (= e!520792 e!520789)))

(declare-fun res!624811 () Bool)

(assert (=> b!927641 (=> (not res!624811) (not e!520789))))

(declare-fun lt!418110 () V!31383)

(assert (=> b!927641 (= res!624811 (and (= lt!418110 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!418115 () ListLongMap!11745)

(declare-fun apply!698 (ListLongMap!11745 (_ BitVec 64)) V!31383)

(assert (=> b!927641 (= lt!418110 (apply!698 lt!418115 k0!1099))))

(declare-fun b!927642 () Bool)

(assert (=> b!927642 (= e!520782 e!520792)))

(declare-fun res!624814 () Bool)

(assert (=> b!927642 (=> (not res!624814) (not e!520792))))

(assert (=> b!927642 (= res!624814 (contains!4899 lt!418115 k0!1099))))

(assert (=> b!927642 (= lt!418115 (getCurrentListMap!3073 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927643 () Bool)

(declare-fun res!624819 () Bool)

(assert (=> b!927643 (=> (not res!624819) (not e!520791))))

(declare-fun lt!418111 () ListLongMap!11745)

(assert (=> b!927643 (= res!624819 (= (apply!698 lt!418111 k0!1099) v!791))))

(declare-fun b!927644 () Bool)

(assert (=> b!927644 (= e!520786 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927645 () Bool)

(declare-fun lt!418112 () ListLongMap!11745)

(assert (=> b!927645 (= (apply!698 lt!418112 k0!1099) lt!418110)))

(declare-fun lt!418118 () V!31383)

(declare-fun lt!418117 () Unit!31296)

(declare-fun addApplyDifferent!403 (ListLongMap!11745 (_ BitVec 64) V!31383 (_ BitVec 64)) Unit!31296)

(assert (=> b!927645 (= lt!418117 (addApplyDifferent!403 lt!418115 lt!418113 lt!418118 k0!1099))))

(assert (=> b!927645 (not (= lt!418113 k0!1099))))

(declare-fun lt!418121 () Unit!31296)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55559 (_ BitVec 64) (_ BitVec 32) List!18828) Unit!31296)

(assert (=> b!927645 (= lt!418121 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18825))))

(assert (=> b!927645 e!520786))

(declare-fun c!96866 () Bool)

(assert (=> b!927645 (= c!96866 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418109 () Unit!31296)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!263 (array!55559 array!55561 (_ BitVec 32) (_ BitVec 32) V!31383 V!31383 (_ BitVec 64) (_ BitVec 32) Int) Unit!31296)

(assert (=> b!927645 (= lt!418109 (lemmaListMapContainsThenArrayContainsFrom!263 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!927645 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18825)))

(declare-fun lt!418120 () Unit!31296)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55559 (_ BitVec 32) (_ BitVec 32)) Unit!31296)

(assert (=> b!927645 (= lt!418120 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!927645 (contains!4899 lt!418112 k0!1099)))

(declare-fun lt!418123 () tuple2!13058)

(declare-fun +!2775 (ListLongMap!11745 tuple2!13058) ListLongMap!11745)

(assert (=> b!927645 (= lt!418112 (+!2775 lt!418115 lt!418123))))

(declare-fun lt!418124 () Unit!31296)

(declare-fun addStillContains!472 (ListLongMap!11745 (_ BitVec 64) V!31383 (_ BitVec 64)) Unit!31296)

(assert (=> b!927645 (= lt!418124 (addStillContains!472 lt!418115 lt!418113 lt!418118 k0!1099))))

(assert (=> b!927645 (= (getCurrentListMap!3073 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2775 (getCurrentListMap!3073 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418123))))

(assert (=> b!927645 (= lt!418123 (tuple2!13059 lt!418113 lt!418118))))

(declare-fun get!14072 (ValueCell!9425 V!31383) V!31383)

(declare-fun dynLambda!1531 (Int (_ BitVec 64)) V!31383)

(assert (=> b!927645 (= lt!418118 (get!14072 (select (arr!26726 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1531 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418119 () Unit!31296)

(declare-fun lemmaListMapRecursiveValidKeyArray!139 (array!55559 array!55561 (_ BitVec 32) (_ BitVec 32) V!31383 V!31383 (_ BitVec 32) Int) Unit!31296)

(assert (=> b!927645 (= lt!418119 (lemmaListMapRecursiveValidKeyArray!139 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!927645 (= e!520794 lt!418117)))

(declare-fun b!927646 () Bool)

(assert (=> b!927646 (= e!520784 e!520791)))

(declare-fun res!624820 () Bool)

(assert (=> b!927646 (=> (not res!624820) (not e!520791))))

(assert (=> b!927646 (= res!624820 (contains!4899 lt!418111 k0!1099))))

(assert (=> b!927646 (= lt!418111 (getCurrentListMap!3073 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927647 () Bool)

(declare-fun e!520788 () Bool)

(assert (=> b!927647 (= e!520788 tp_is_empty!19813)))

(declare-fun b!927648 () Bool)

(assert (=> b!927648 (= e!520793 (= (apply!698 lt!418122 k0!1099) v!791))))

(declare-fun b!927649 () Bool)

(declare-fun e!520787 () Bool)

(assert (=> b!927649 (= e!520787 tp_is_empty!19813)))

(declare-fun b!927650 () Bool)

(declare-fun res!624818 () Bool)

(assert (=> b!927650 (=> (not res!624818) (not e!520782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55559 (_ BitVec 32)) Bool)

(assert (=> b!927650 (= res!624818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!927651 () Bool)

(assert (=> b!927651 (= e!520783 (and e!520788 mapRes!31476))))

(declare-fun condMapEmpty!31476 () Bool)

(declare-fun mapDefault!31476 () ValueCell!9425)

(assert (=> b!927651 (= condMapEmpty!31476 (= (arr!26726 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9425)) mapDefault!31476)))))

(declare-fun mapNonEmpty!31476 () Bool)

(declare-fun tp!60356 () Bool)

(assert (=> mapNonEmpty!31476 (= mapRes!31476 (and tp!60356 e!520787))))

(declare-fun mapKey!31476 () (_ BitVec 32))

(declare-fun mapRest!31476 () (Array (_ BitVec 32) ValueCell!9425))

(declare-fun mapValue!31476 () ValueCell!9425)

(assert (=> mapNonEmpty!31476 (= (arr!26726 _values!1231) (store mapRest!31476 mapKey!31476 mapValue!31476))))

(assert (= (and start!79074 res!624817) b!927638))

(assert (= (and b!927638 res!624816) b!927650))

(assert (= (and b!927650 res!624818) b!927640))

(assert (= (and b!927640 res!624813) b!927635))

(assert (= (and b!927635 res!624815) b!927642))

(assert (= (and b!927642 res!624814) b!927641))

(assert (= (and b!927641 res!624811) b!927636))

(assert (= (and b!927636 c!96867) b!927633))

(assert (= (and b!927636 (not c!96867)) b!927634))

(assert (= (and b!927633 c!96868) b!927645))

(assert (= (and b!927633 (not c!96868)) b!927632))

(assert (= (and b!927645 c!96866) b!927639))

(assert (= (and b!927645 (not c!96866)) b!927644))

(assert (= (and b!927636 res!624821) b!927646))

(assert (= (and b!927646 res!624820) b!927643))

(assert (= (and b!927643 res!624819) b!927637))

(assert (= (and b!927637 res!624812) b!927648))

(assert (= (and b!927651 condMapEmpty!31476) mapIsEmpty!31476))

(assert (= (and b!927651 (not condMapEmpty!31476)) mapNonEmpty!31476))

(get-info :version)

(assert (= (and mapNonEmpty!31476 ((_ is ValueCellFull!9425) mapValue!31476)) b!927649))

(assert (= (and b!927651 ((_ is ValueCellFull!9425) mapDefault!31476)) b!927647))

(assert (= start!79074 b!927651))

(declare-fun b_lambda!13789 () Bool)

(assert (=> (not b_lambda!13789) (not b!927645)))

(declare-fun t!26852 () Bool)

(declare-fun tb!5877 () Bool)

(assert (=> (and start!79074 (= defaultEntry!1235 defaultEntry!1235) t!26852) tb!5877))

(declare-fun result!11585 () Bool)

(assert (=> tb!5877 (= result!11585 tp_is_empty!19813)))

(assert (=> b!927645 t!26852))

(declare-fun b_and!28323 () Bool)

(assert (= b_and!28321 (and (=> t!26852 result!11585) b_and!28323)))

(declare-fun m!861847 () Bool)

(assert (=> b!927646 m!861847))

(declare-fun m!861849 () Bool)

(assert (=> b!927646 m!861849))

(declare-fun m!861851 () Bool)

(assert (=> b!927645 m!861851))

(declare-fun m!861853 () Bool)

(assert (=> b!927645 m!861853))

(declare-fun m!861855 () Bool)

(assert (=> b!927645 m!861855))

(declare-fun m!861857 () Bool)

(assert (=> b!927645 m!861857))

(declare-fun m!861859 () Bool)

(assert (=> b!927645 m!861859))

(declare-fun m!861861 () Bool)

(assert (=> b!927645 m!861861))

(declare-fun m!861863 () Bool)

(assert (=> b!927645 m!861863))

(declare-fun m!861865 () Bool)

(assert (=> b!927645 m!861865))

(assert (=> b!927645 m!861857))

(assert (=> b!927645 m!861859))

(declare-fun m!861867 () Bool)

(assert (=> b!927645 m!861867))

(assert (=> b!927645 m!861849))

(declare-fun m!861869 () Bool)

(assert (=> b!927645 m!861869))

(declare-fun m!861871 () Bool)

(assert (=> b!927645 m!861871))

(declare-fun m!861873 () Bool)

(assert (=> b!927645 m!861873))

(assert (=> b!927645 m!861863))

(declare-fun m!861875 () Bool)

(assert (=> b!927645 m!861875))

(declare-fun m!861877 () Bool)

(assert (=> b!927645 m!861877))

(declare-fun m!861879 () Bool)

(assert (=> b!927645 m!861879))

(declare-fun m!861881 () Bool)

(assert (=> b!927636 m!861881))

(declare-fun m!861883 () Bool)

(assert (=> start!79074 m!861883))

(declare-fun m!861885 () Bool)

(assert (=> start!79074 m!861885))

(declare-fun m!861887 () Bool)

(assert (=> start!79074 m!861887))

(declare-fun m!861889 () Bool)

(assert (=> b!927643 m!861889))

(declare-fun m!861891 () Bool)

(assert (=> b!927641 m!861891))

(declare-fun m!861893 () Bool)

(assert (=> b!927633 m!861893))

(declare-fun m!861895 () Bool)

(assert (=> b!927633 m!861895))

(declare-fun m!861897 () Bool)

(assert (=> b!927650 m!861897))

(declare-fun m!861899 () Bool)

(assert (=> mapNonEmpty!31476 m!861899))

(declare-fun m!861901 () Bool)

(assert (=> b!927637 m!861901))

(declare-fun m!861903 () Bool)

(assert (=> b!927637 m!861903))

(declare-fun m!861905 () Bool)

(assert (=> b!927637 m!861905))

(declare-fun m!861907 () Bool)

(assert (=> b!927639 m!861907))

(declare-fun m!861909 () Bool)

(assert (=> b!927642 m!861909))

(declare-fun m!861911 () Bool)

(assert (=> b!927642 m!861911))

(declare-fun m!861913 () Bool)

(assert (=> b!927640 m!861913))

(declare-fun m!861915 () Bool)

(assert (=> b!927648 m!861915))

(check-sat b_and!28323 (not b_lambda!13789) (not b!927646) (not b!927642) (not b!927633) (not b!927641) (not mapNonEmpty!31476) (not b!927639) (not b!927637) (not b!927643) (not b!927650) (not start!79074) (not b!927648) (not b!927640) (not b_next!17305) tp_is_empty!19813 (not b!927645) (not b!927636))
(check-sat b_and!28323 (not b_next!17305))
