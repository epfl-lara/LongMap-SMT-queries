; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79070 () Bool)

(assert start!79070)

(declare-fun b_free!17283 () Bool)

(declare-fun b_next!17283 () Bool)

(assert (=> start!79070 (= b_free!17283 (not b_next!17283))))

(declare-fun tp!60289 () Bool)

(declare-fun b_and!28303 () Bool)

(assert (=> start!79070 (= tp!60289 b_and!28303)))

(declare-fun mapNonEmpty!31443 () Bool)

(declare-fun mapRes!31443 () Bool)

(declare-fun tp!60290 () Bool)

(declare-fun e!520508 () Bool)

(assert (=> mapNonEmpty!31443 (= mapRes!31443 (and tp!60290 e!520508))))

(declare-datatypes ((V!31353 0))(
  ( (V!31354 (val!9946 Int)) )
))
(declare-datatypes ((ValueCell!9414 0))(
  ( (ValueCellFull!9414 (v!12464 V!31353)) (EmptyCell!9414) )
))
(declare-fun mapValue!31443 () ValueCell!9414)

(declare-fun mapRest!31443 () (Array (_ BitVec 32) ValueCell!9414))

(declare-datatypes ((array!55544 0))(
  ( (array!55545 (arr!26717 (Array (_ BitVec 32) ValueCell!9414)) (size!27176 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55544)

(declare-fun mapKey!31443 () (_ BitVec 32))

(assert (=> mapNonEmpty!31443 (= (arr!26717 _values!1231) (store mapRest!31443 mapKey!31443 mapValue!31443))))

(declare-fun b!927189 () Bool)

(declare-fun tp_is_empty!19791 () Bool)

(assert (=> b!927189 (= e!520508 tp_is_empty!19791)))

(declare-fun b!927190 () Bool)

(declare-datatypes ((tuple2!12982 0))(
  ( (tuple2!12983 (_1!6502 (_ BitVec 64)) (_2!6502 V!31353)) )
))
(declare-datatypes ((List!18783 0))(
  ( (Nil!18780) (Cons!18779 (h!19925 tuple2!12982) (t!26796 List!18783)) )
))
(declare-datatypes ((ListLongMap!11679 0))(
  ( (ListLongMap!11680 (toList!5855 List!18783)) )
))
(declare-fun lt!417822 () ListLongMap!11679)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!417823 () V!31353)

(declare-fun apply!685 (ListLongMap!11679 (_ BitVec 64)) V!31353)

(assert (=> b!927190 (= (apply!685 lt!417822 k0!1099) lt!417823)))

(declare-fun lt!417828 () ListLongMap!11679)

(declare-datatypes ((Unit!31351 0))(
  ( (Unit!31352) )
))
(declare-fun lt!417820 () Unit!31351)

(declare-fun lt!417817 () (_ BitVec 64))

(declare-fun lt!417825 () V!31353)

(declare-fun addApplyDifferent!401 (ListLongMap!11679 (_ BitVec 64) V!31353 (_ BitVec 64)) Unit!31351)

(assert (=> b!927190 (= lt!417820 (addApplyDifferent!401 lt!417828 lt!417817 lt!417825 k0!1099))))

(assert (=> b!927190 (not (= lt!417817 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!417826 () Unit!31351)

(declare-datatypes ((array!55546 0))(
  ( (array!55547 (arr!26718 (Array (_ BitVec 32) (_ BitVec 64))) (size!27177 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55546)

(declare-datatypes ((List!18784 0))(
  ( (Nil!18781) (Cons!18780 (h!19926 (_ BitVec 64)) (t!26797 List!18784)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55546 (_ BitVec 64) (_ BitVec 32) List!18784) Unit!31351)

(assert (=> b!927190 (= lt!417826 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18781))))

(declare-fun e!520504 () Bool)

(assert (=> b!927190 e!520504))

(declare-fun c!96833 () Bool)

(assert (=> b!927190 (= c!96833 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun lt!417831 () Unit!31351)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31353)

(declare-fun minValue!1173 () V!31353)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!252 (array!55546 array!55544 (_ BitVec 32) (_ BitVec 32) V!31353 V!31353 (_ BitVec 64) (_ BitVec 32) Int) Unit!31351)

(assert (=> b!927190 (= lt!417831 (lemmaListMapContainsThenArrayContainsFrom!252 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55546 (_ BitVec 32) List!18784) Bool)

(assert (=> b!927190 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18781)))

(declare-fun lt!417829 () Unit!31351)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55546 (_ BitVec 32) (_ BitVec 32)) Unit!31351)

(assert (=> b!927190 (= lt!417829 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4913 (ListLongMap!11679 (_ BitVec 64)) Bool)

(assert (=> b!927190 (contains!4913 lt!417822 k0!1099)))

(declare-fun lt!417818 () tuple2!12982)

(declare-fun +!2745 (ListLongMap!11679 tuple2!12982) ListLongMap!11679)

(assert (=> b!927190 (= lt!417822 (+!2745 lt!417828 lt!417818))))

(declare-fun lt!417830 () Unit!31351)

(declare-fun addStillContains!469 (ListLongMap!11679 (_ BitVec 64) V!31353 (_ BitVec 64)) Unit!31351)

(assert (=> b!927190 (= lt!417830 (addStillContains!469 lt!417828 lt!417817 lt!417825 k0!1099))))

(declare-fun getCurrentListMap!3104 (array!55546 array!55544 (_ BitVec 32) (_ BitVec 32) V!31353 V!31353 (_ BitVec 32) Int) ListLongMap!11679)

(assert (=> b!927190 (= (getCurrentListMap!3104 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2745 (getCurrentListMap!3104 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417818))))

(assert (=> b!927190 (= lt!417818 (tuple2!12983 lt!417817 lt!417825))))

(declare-fun get!14062 (ValueCell!9414 V!31353) V!31353)

(declare-fun dynLambda!1534 (Int (_ BitVec 64)) V!31353)

(assert (=> b!927190 (= lt!417825 (get!14062 (select (arr!26717 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1534 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417824 () Unit!31351)

(declare-fun lemmaListMapRecursiveValidKeyArray!135 (array!55546 array!55544 (_ BitVec 32) (_ BitVec 32) V!31353 V!31353 (_ BitVec 32) Int) Unit!31351)

(assert (=> b!927190 (= lt!417824 (lemmaListMapRecursiveValidKeyArray!135 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!520502 () Unit!31351)

(assert (=> b!927190 (= e!520502 lt!417820)))

(declare-fun b!927191 () Bool)

(declare-fun arrayContainsKey!0 (array!55546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927191 (= e!520504 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!927192 () Bool)

(declare-fun res!624559 () Bool)

(declare-fun e!520512 () Bool)

(assert (=> b!927192 (=> (not res!624559) (not e!520512))))

(assert (=> b!927192 (= res!624559 (and (= (size!27176 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27177 _keys!1487) (size!27176 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!624566 () Bool)

(assert (=> start!79070 (=> (not res!624566) (not e!520512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79070 (= res!624566 (validMask!0 mask!1881))))

(assert (=> start!79070 e!520512))

(assert (=> start!79070 true))

(assert (=> start!79070 tp_is_empty!19791))

(declare-fun e!520509 () Bool)

(declare-fun array_inv!20804 (array!55544) Bool)

(assert (=> start!79070 (and (array_inv!20804 _values!1231) e!520509)))

(assert (=> start!79070 tp!60289))

(declare-fun array_inv!20805 (array!55546) Bool)

(assert (=> start!79070 (array_inv!20805 _keys!1487)))

(declare-fun b!927193 () Bool)

(declare-fun res!624563 () Bool)

(declare-fun e!520511 () Bool)

(assert (=> b!927193 (=> (not res!624563) (not e!520511))))

(declare-fun v!791 () V!31353)

(declare-fun lt!417832 () ListLongMap!11679)

(assert (=> b!927193 (= res!624563 (= (apply!685 lt!417832 k0!1099) v!791))))

(declare-fun b!927194 () Bool)

(assert (=> b!927194 (= e!520511 (not true))))

(declare-fun e!520506 () Bool)

(assert (=> b!927194 e!520506))

(declare-fun res!624561 () Bool)

(assert (=> b!927194 (=> (not res!624561) (not e!520506))))

(declare-fun lt!417821 () ListLongMap!11679)

(assert (=> b!927194 (= res!624561 (contains!4913 lt!417821 k0!1099))))

(assert (=> b!927194 (= lt!417821 (getCurrentListMap!3104 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417819 () Unit!31351)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!86 (array!55546 array!55544 (_ BitVec 32) (_ BitVec 32) V!31353 V!31353 (_ BitVec 64) V!31353 (_ BitVec 32) Int) Unit!31351)

(assert (=> b!927194 (= lt!417819 (lemmaListMapApplyFromThenApplyFromZero!86 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927195 () Bool)

(declare-fun res!624567 () Bool)

(assert (=> b!927195 (=> (not res!624567) (not e!520512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55546 (_ BitVec 32)) Bool)

(assert (=> b!927195 (= res!624567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!927196 () Bool)

(declare-fun e!520507 () Bool)

(assert (=> b!927196 (= e!520509 (and e!520507 mapRes!31443))))

(declare-fun condMapEmpty!31443 () Bool)

(declare-fun mapDefault!31443 () ValueCell!9414)

(assert (=> b!927196 (= condMapEmpty!31443 (= (arr!26717 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9414)) mapDefault!31443)))))

(declare-fun b!927197 () Bool)

(declare-fun e!520503 () Unit!31351)

(assert (=> b!927197 (= e!520503 e!520502)))

(assert (=> b!927197 (= lt!417817 (select (arr!26718 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96832 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927197 (= c!96832 (validKeyInArray!0 lt!417817))))

(declare-fun b!927198 () Bool)

(declare-fun e!520505 () Bool)

(declare-fun e!520513 () Bool)

(assert (=> b!927198 (= e!520505 e!520513)))

(declare-fun res!624565 () Bool)

(assert (=> b!927198 (=> (not res!624565) (not e!520513))))

(assert (=> b!927198 (= res!624565 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27177 _keys!1487)))))

(declare-fun lt!417827 () Unit!31351)

(assert (=> b!927198 (= lt!417827 e!520503)))

(declare-fun c!96834 () Bool)

(assert (=> b!927198 (= c!96834 (validKeyInArray!0 k0!1099))))

(declare-fun b!927199 () Bool)

(declare-fun Unit!31353 () Unit!31351)

(assert (=> b!927199 (= e!520503 Unit!31353)))

(declare-fun mapIsEmpty!31443 () Bool)

(assert (=> mapIsEmpty!31443 mapRes!31443))

(declare-fun b!927200 () Bool)

(assert (=> b!927200 (= e!520513 e!520511)))

(declare-fun res!624558 () Bool)

(assert (=> b!927200 (=> (not res!624558) (not e!520511))))

(assert (=> b!927200 (= res!624558 (contains!4913 lt!417832 k0!1099))))

(assert (=> b!927200 (= lt!417832 (getCurrentListMap!3104 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927201 () Bool)

(declare-fun res!624562 () Bool)

(assert (=> b!927201 (=> (not res!624562) (not e!520512))))

(assert (=> b!927201 (= res!624562 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27177 _keys!1487))))))

(declare-fun b!927202 () Bool)

(assert (=> b!927202 (= e!520504 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927203 () Bool)

(declare-fun Unit!31354 () Unit!31351)

(assert (=> b!927203 (= e!520502 Unit!31354)))

(declare-fun b!927204 () Bool)

(assert (=> b!927204 (= e!520507 tp_is_empty!19791)))

(declare-fun b!927205 () Bool)

(declare-fun e!520510 () Bool)

(assert (=> b!927205 (= e!520510 e!520505)))

(declare-fun res!624560 () Bool)

(assert (=> b!927205 (=> (not res!624560) (not e!520505))))

(assert (=> b!927205 (= res!624560 (and (= lt!417823 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!927205 (= lt!417823 (apply!685 lt!417828 k0!1099))))

(declare-fun b!927206 () Bool)

(assert (=> b!927206 (= e!520512 e!520510)))

(declare-fun res!624564 () Bool)

(assert (=> b!927206 (=> (not res!624564) (not e!520510))))

(assert (=> b!927206 (= res!624564 (contains!4913 lt!417828 k0!1099))))

(assert (=> b!927206 (= lt!417828 (getCurrentListMap!3104 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927207 () Bool)

(assert (=> b!927207 (= e!520506 (= (apply!685 lt!417821 k0!1099) v!791))))

(declare-fun b!927208 () Bool)

(declare-fun res!624568 () Bool)

(assert (=> b!927208 (=> (not res!624568) (not e!520512))))

(assert (=> b!927208 (= res!624568 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18781))))

(assert (= (and start!79070 res!624566) b!927192))

(assert (= (and b!927192 res!624559) b!927195))

(assert (= (and b!927195 res!624567) b!927208))

(assert (= (and b!927208 res!624568) b!927201))

(assert (= (and b!927201 res!624562) b!927206))

(assert (= (and b!927206 res!624564) b!927205))

(assert (= (and b!927205 res!624560) b!927198))

(assert (= (and b!927198 c!96834) b!927197))

(assert (= (and b!927198 (not c!96834)) b!927199))

(assert (= (and b!927197 c!96832) b!927190))

(assert (= (and b!927197 (not c!96832)) b!927203))

(assert (= (and b!927190 c!96833) b!927191))

(assert (= (and b!927190 (not c!96833)) b!927202))

(assert (= (and b!927198 res!624565) b!927200))

(assert (= (and b!927200 res!624558) b!927193))

(assert (= (and b!927193 res!624563) b!927194))

(assert (= (and b!927194 res!624561) b!927207))

(assert (= (and b!927196 condMapEmpty!31443) mapIsEmpty!31443))

(assert (= (and b!927196 (not condMapEmpty!31443)) mapNonEmpty!31443))

(get-info :version)

(assert (= (and mapNonEmpty!31443 ((_ is ValueCellFull!9414) mapValue!31443)) b!927189))

(assert (= (and b!927196 ((_ is ValueCellFull!9414) mapDefault!31443)) b!927204))

(assert (= start!79070 b!927196))

(declare-fun b_lambda!13785 () Bool)

(assert (=> (not b_lambda!13785) (not b!927190)))

(declare-fun t!26795 () Bool)

(declare-fun tb!5863 () Bool)

(assert (=> (and start!79070 (= defaultEntry!1235 defaultEntry!1235) t!26795) tb!5863))

(declare-fun result!11549 () Bool)

(assert (=> tb!5863 (= result!11549 tp_is_empty!19791)))

(assert (=> b!927190 t!26795))

(declare-fun b_and!28305 () Bool)

(assert (= b_and!28303 (and (=> t!26795 result!11549) b_and!28305)))

(declare-fun m!861835 () Bool)

(assert (=> b!927205 m!861835))

(declare-fun m!861837 () Bool)

(assert (=> b!927190 m!861837))

(declare-fun m!861839 () Bool)

(assert (=> b!927190 m!861839))

(declare-fun m!861841 () Bool)

(assert (=> b!927190 m!861841))

(declare-fun m!861843 () Bool)

(assert (=> b!927190 m!861843))

(assert (=> b!927190 m!861841))

(assert (=> b!927190 m!861843))

(declare-fun m!861845 () Bool)

(assert (=> b!927190 m!861845))

(declare-fun m!861847 () Bool)

(assert (=> b!927190 m!861847))

(declare-fun m!861849 () Bool)

(assert (=> b!927190 m!861849))

(declare-fun m!861851 () Bool)

(assert (=> b!927190 m!861851))

(declare-fun m!861853 () Bool)

(assert (=> b!927190 m!861853))

(declare-fun m!861855 () Bool)

(assert (=> b!927190 m!861855))

(declare-fun m!861857 () Bool)

(assert (=> b!927190 m!861857))

(declare-fun m!861859 () Bool)

(assert (=> b!927190 m!861859))

(declare-fun m!861861 () Bool)

(assert (=> b!927190 m!861861))

(assert (=> b!927190 m!861859))

(declare-fun m!861863 () Bool)

(assert (=> b!927190 m!861863))

(declare-fun m!861865 () Bool)

(assert (=> b!927190 m!861865))

(declare-fun m!861867 () Bool)

(assert (=> b!927190 m!861867))

(declare-fun m!861869 () Bool)

(assert (=> b!927194 m!861869))

(declare-fun m!861871 () Bool)

(assert (=> b!927194 m!861871))

(declare-fun m!861873 () Bool)

(assert (=> b!927194 m!861873))

(declare-fun m!861875 () Bool)

(assert (=> b!927207 m!861875))

(declare-fun m!861877 () Bool)

(assert (=> b!927191 m!861877))

(declare-fun m!861879 () Bool)

(assert (=> b!927208 m!861879))

(declare-fun m!861881 () Bool)

(assert (=> b!927198 m!861881))

(declare-fun m!861883 () Bool)

(assert (=> b!927193 m!861883))

(declare-fun m!861885 () Bool)

(assert (=> b!927197 m!861885))

(declare-fun m!861887 () Bool)

(assert (=> b!927197 m!861887))

(declare-fun m!861889 () Bool)

(assert (=> start!79070 m!861889))

(declare-fun m!861891 () Bool)

(assert (=> start!79070 m!861891))

(declare-fun m!861893 () Bool)

(assert (=> start!79070 m!861893))

(declare-fun m!861895 () Bool)

(assert (=> b!927195 m!861895))

(declare-fun m!861897 () Bool)

(assert (=> mapNonEmpty!31443 m!861897))

(declare-fun m!861899 () Bool)

(assert (=> b!927206 m!861899))

(declare-fun m!861901 () Bool)

(assert (=> b!927206 m!861901))

(declare-fun m!861903 () Bool)

(assert (=> b!927200 m!861903))

(assert (=> b!927200 m!861847))

(check-sat (not b!927194) (not b!927206) b_and!28305 (not b!927193) (not b_lambda!13785) (not b!927197) (not mapNonEmpty!31443) (not b!927207) (not b!927190) (not b!927208) (not b!927191) (not start!79070) tp_is_empty!19791 (not b!927198) (not b!927200) (not b!927195) (not b!927205) (not b_next!17283))
(check-sat b_and!28305 (not b_next!17283))
