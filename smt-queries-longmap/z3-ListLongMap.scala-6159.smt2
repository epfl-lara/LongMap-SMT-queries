; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79064 () Bool)

(assert start!79064)

(declare-fun b_free!17277 () Bool)

(declare-fun b_next!17277 () Bool)

(assert (=> start!79064 (= b_free!17277 (not b_next!17277))))

(declare-fun tp!60272 () Bool)

(declare-fun b_and!28291 () Bool)

(assert (=> start!79064 (= tp!60272 b_and!28291)))

(declare-fun b!927003 () Bool)

(declare-fun e!520396 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!927003 (= e!520396 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927004 () Bool)

(declare-fun res!624462 () Bool)

(declare-fun e!520390 () Bool)

(assert (=> b!927004 (=> (not res!624462) (not e!520390))))

(declare-datatypes ((array!55532 0))(
  ( (array!55533 (arr!26711 (Array (_ BitVec 32) (_ BitVec 64))) (size!27170 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55532)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((V!31345 0))(
  ( (V!31346 (val!9943 Int)) )
))
(declare-datatypes ((ValueCell!9411 0))(
  ( (ValueCellFull!9411 (v!12461 V!31345)) (EmptyCell!9411) )
))
(declare-datatypes ((array!55534 0))(
  ( (array!55535 (arr!26712 (Array (_ BitVec 32) ValueCell!9411)) (size!27171 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55534)

(assert (=> b!927004 (= res!624462 (and (= (size!27171 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27170 _keys!1487) (size!27171 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927005 () Bool)

(declare-datatypes ((tuple2!12976 0))(
  ( (tuple2!12977 (_1!6499 (_ BitVec 64)) (_2!6499 V!31345)) )
))
(declare-datatypes ((List!18777 0))(
  ( (Nil!18774) (Cons!18773 (h!19919 tuple2!12976) (t!26784 List!18777)) )
))
(declare-datatypes ((ListLongMap!11673 0))(
  ( (ListLongMap!11674 (toList!5852 List!18777)) )
))
(declare-fun lt!417674 () ListLongMap!11673)

(declare-fun lt!417684 () V!31345)

(declare-fun apply!682 (ListLongMap!11673 (_ BitVec 64)) V!31345)

(assert (=> b!927005 (= (apply!682 lt!417674 k0!1099) lt!417684)))

(declare-fun lt!417685 () V!31345)

(declare-fun lt!417680 () ListLongMap!11673)

(declare-fun lt!417681 () (_ BitVec 64))

(declare-datatypes ((Unit!31344 0))(
  ( (Unit!31345) )
))
(declare-fun lt!417676 () Unit!31344)

(declare-fun addApplyDifferent!399 (ListLongMap!11673 (_ BitVec 64) V!31345 (_ BitVec 64)) Unit!31344)

(assert (=> b!927005 (= lt!417676 (addApplyDifferent!399 lt!417680 lt!417681 lt!417685 k0!1099))))

(assert (=> b!927005 (not (= lt!417681 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!417686 () Unit!31344)

(declare-datatypes ((List!18778 0))(
  ( (Nil!18775) (Cons!18774 (h!19920 (_ BitVec 64)) (t!26785 List!18778)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55532 (_ BitVec 64) (_ BitVec 32) List!18778) Unit!31344)

(assert (=> b!927005 (= lt!417686 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18775))))

(assert (=> b!927005 e!520396))

(declare-fun c!96805 () Bool)

(assert (=> b!927005 (= c!96805 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417675 () Unit!31344)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31345)

(declare-fun minValue!1173 () V!31345)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!250 (array!55532 array!55534 (_ BitVec 32) (_ BitVec 32) V!31345 V!31345 (_ BitVec 64) (_ BitVec 32) Int) Unit!31344)

(assert (=> b!927005 (= lt!417675 (lemmaListMapContainsThenArrayContainsFrom!250 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55532 (_ BitVec 32) List!18778) Bool)

(assert (=> b!927005 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18775)))

(declare-fun lt!417683 () Unit!31344)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55532 (_ BitVec 32) (_ BitVec 32)) Unit!31344)

(assert (=> b!927005 (= lt!417683 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4911 (ListLongMap!11673 (_ BitVec 64)) Bool)

(assert (=> b!927005 (contains!4911 lt!417674 k0!1099)))

(declare-fun lt!417677 () tuple2!12976)

(declare-fun +!2743 (ListLongMap!11673 tuple2!12976) ListLongMap!11673)

(assert (=> b!927005 (= lt!417674 (+!2743 lt!417680 lt!417677))))

(declare-fun lt!417678 () Unit!31344)

(declare-fun addStillContains!467 (ListLongMap!11673 (_ BitVec 64) V!31345 (_ BitVec 64)) Unit!31344)

(assert (=> b!927005 (= lt!417678 (addStillContains!467 lt!417680 lt!417681 lt!417685 k0!1099))))

(declare-fun getCurrentListMap!3102 (array!55532 array!55534 (_ BitVec 32) (_ BitVec 32) V!31345 V!31345 (_ BitVec 32) Int) ListLongMap!11673)

(assert (=> b!927005 (= (getCurrentListMap!3102 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2743 (getCurrentListMap!3102 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417677))))

(assert (=> b!927005 (= lt!417677 (tuple2!12977 lt!417681 lt!417685))))

(declare-fun get!14058 (ValueCell!9411 V!31345) V!31345)

(declare-fun dynLambda!1532 (Int (_ BitVec 64)) V!31345)

(assert (=> b!927005 (= lt!417685 (get!14058 (select (arr!26712 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1532 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417682 () Unit!31344)

(declare-fun lemmaListMapRecursiveValidKeyArray!133 (array!55532 array!55534 (_ BitVec 32) (_ BitVec 32) V!31345 V!31345 (_ BitVec 32) Int) Unit!31344)

(assert (=> b!927005 (= lt!417682 (lemmaListMapRecursiveValidKeyArray!133 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!520385 () Unit!31344)

(assert (=> b!927005 (= e!520385 lt!417676)))

(declare-fun b!927006 () Bool)

(declare-fun res!624469 () Bool)

(declare-fun e!520387 () Bool)

(assert (=> b!927006 (=> (not res!624469) (not e!520387))))

(declare-fun v!791 () V!31345)

(declare-fun lt!417679 () ListLongMap!11673)

(assert (=> b!927006 (= res!624469 (= (apply!682 lt!417679 k0!1099) v!791))))

(declare-fun b!927007 () Bool)

(declare-fun e!520395 () Bool)

(declare-fun tp_is_empty!19785 () Bool)

(assert (=> b!927007 (= e!520395 tp_is_empty!19785)))

(declare-fun b!927008 () Bool)

(declare-fun e!520386 () Bool)

(assert (=> b!927008 (= e!520390 e!520386)))

(declare-fun res!624464 () Bool)

(assert (=> b!927008 (=> (not res!624464) (not e!520386))))

(assert (=> b!927008 (= res!624464 (contains!4911 lt!417680 k0!1099))))

(assert (=> b!927008 (= lt!417680 (getCurrentListMap!3102 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927009 () Bool)

(declare-fun res!624465 () Bool)

(assert (=> b!927009 (=> (not res!624465) (not e!520390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55532 (_ BitVec 32)) Bool)

(assert (=> b!927009 (= res!624465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!927010 () Bool)

(declare-fun e!520393 () Bool)

(declare-fun e!520391 () Bool)

(assert (=> b!927010 (= e!520393 e!520391)))

(declare-fun res!624460 () Bool)

(assert (=> b!927010 (=> (not res!624460) (not e!520391))))

(assert (=> b!927010 (= res!624460 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27170 _keys!1487)))))

(declare-fun lt!417688 () Unit!31344)

(declare-fun e!520384 () Unit!31344)

(assert (=> b!927010 (= lt!417688 e!520384)))

(declare-fun c!96807 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927010 (= c!96807 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!31434 () Bool)

(declare-fun mapRes!31434 () Bool)

(declare-fun tp!60271 () Bool)

(declare-fun e!520389 () Bool)

(assert (=> mapNonEmpty!31434 (= mapRes!31434 (and tp!60271 e!520389))))

(declare-fun mapValue!31434 () ValueCell!9411)

(declare-fun mapKey!31434 () (_ BitVec 32))

(declare-fun mapRest!31434 () (Array (_ BitVec 32) ValueCell!9411))

(assert (=> mapNonEmpty!31434 (= (arr!26712 _values!1231) (store mapRest!31434 mapKey!31434 mapValue!31434))))

(declare-fun res!624467 () Bool)

(assert (=> start!79064 (=> (not res!624467) (not e!520390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79064 (= res!624467 (validMask!0 mask!1881))))

(assert (=> start!79064 e!520390))

(assert (=> start!79064 true))

(assert (=> start!79064 tp_is_empty!19785))

(declare-fun e!520388 () Bool)

(declare-fun array_inv!20800 (array!55534) Bool)

(assert (=> start!79064 (and (array_inv!20800 _values!1231) e!520388)))

(assert (=> start!79064 tp!60272))

(declare-fun array_inv!20801 (array!55532) Bool)

(assert (=> start!79064 (array_inv!20801 _keys!1487)))

(declare-fun b!927011 () Bool)

(assert (=> b!927011 (= e!520389 tp_is_empty!19785)))

(declare-fun b!927012 () Bool)

(declare-fun arrayContainsKey!0 (array!55532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927012 (= e!520396 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!927013 () Bool)

(assert (=> b!927013 (= e!520388 (and e!520395 mapRes!31434))))

(declare-fun condMapEmpty!31434 () Bool)

(declare-fun mapDefault!31434 () ValueCell!9411)

(assert (=> b!927013 (= condMapEmpty!31434 (= (arr!26712 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9411)) mapDefault!31434)))))

(declare-fun b!927014 () Bool)

(declare-fun lt!417673 () ListLongMap!11673)

(declare-fun e!520392 () Bool)

(assert (=> b!927014 (= e!520392 (= (apply!682 lt!417673 k0!1099) v!791))))

(declare-fun mapIsEmpty!31434 () Bool)

(assert (=> mapIsEmpty!31434 mapRes!31434))

(declare-fun b!927015 () Bool)

(declare-fun res!624459 () Bool)

(assert (=> b!927015 (=> (not res!624459) (not e!520390))))

(assert (=> b!927015 (= res!624459 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27170 _keys!1487))))))

(declare-fun b!927016 () Bool)

(declare-fun Unit!31346 () Unit!31344)

(assert (=> b!927016 (= e!520384 Unit!31346)))

(declare-fun b!927017 () Bool)

(assert (=> b!927017 (= e!520386 e!520393)))

(declare-fun res!624463 () Bool)

(assert (=> b!927017 (=> (not res!624463) (not e!520393))))

(assert (=> b!927017 (= res!624463 (and (= lt!417684 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!927017 (= lt!417684 (apply!682 lt!417680 k0!1099))))

(declare-fun b!927018 () Bool)

(assert (=> b!927018 (= e!520387 (not true))))

(assert (=> b!927018 e!520392))

(declare-fun res!624466 () Bool)

(assert (=> b!927018 (=> (not res!624466) (not e!520392))))

(assert (=> b!927018 (= res!624466 (contains!4911 lt!417673 k0!1099))))

(assert (=> b!927018 (= lt!417673 (getCurrentListMap!3102 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417687 () Unit!31344)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!85 (array!55532 array!55534 (_ BitVec 32) (_ BitVec 32) V!31345 V!31345 (_ BitVec 64) V!31345 (_ BitVec 32) Int) Unit!31344)

(assert (=> b!927018 (= lt!417687 (lemmaListMapApplyFromThenApplyFromZero!85 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927019 () Bool)

(assert (=> b!927019 (= e!520384 e!520385)))

(assert (=> b!927019 (= lt!417681 (select (arr!26711 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96806 () Bool)

(assert (=> b!927019 (= c!96806 (validKeyInArray!0 lt!417681))))

(declare-fun b!927020 () Bool)

(declare-fun res!624468 () Bool)

(assert (=> b!927020 (=> (not res!624468) (not e!520390))))

(assert (=> b!927020 (= res!624468 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18775))))

(declare-fun b!927021 () Bool)

(declare-fun Unit!31347 () Unit!31344)

(assert (=> b!927021 (= e!520385 Unit!31347)))

(declare-fun b!927022 () Bool)

(assert (=> b!927022 (= e!520391 e!520387)))

(declare-fun res!624461 () Bool)

(assert (=> b!927022 (=> (not res!624461) (not e!520387))))

(assert (=> b!927022 (= res!624461 (contains!4911 lt!417679 k0!1099))))

(assert (=> b!927022 (= lt!417679 (getCurrentListMap!3102 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!79064 res!624467) b!927004))

(assert (= (and b!927004 res!624462) b!927009))

(assert (= (and b!927009 res!624465) b!927020))

(assert (= (and b!927020 res!624468) b!927015))

(assert (= (and b!927015 res!624459) b!927008))

(assert (= (and b!927008 res!624464) b!927017))

(assert (= (and b!927017 res!624463) b!927010))

(assert (= (and b!927010 c!96807) b!927019))

(assert (= (and b!927010 (not c!96807)) b!927016))

(assert (= (and b!927019 c!96806) b!927005))

(assert (= (and b!927019 (not c!96806)) b!927021))

(assert (= (and b!927005 c!96805) b!927012))

(assert (= (and b!927005 (not c!96805)) b!927003))

(assert (= (and b!927010 res!624460) b!927022))

(assert (= (and b!927022 res!624461) b!927006))

(assert (= (and b!927006 res!624469) b!927018))

(assert (= (and b!927018 res!624466) b!927014))

(assert (= (and b!927013 condMapEmpty!31434) mapIsEmpty!31434))

(assert (= (and b!927013 (not condMapEmpty!31434)) mapNonEmpty!31434))

(get-info :version)

(assert (= (and mapNonEmpty!31434 ((_ is ValueCellFull!9411) mapValue!31434)) b!927011))

(assert (= (and b!927013 ((_ is ValueCellFull!9411) mapDefault!31434)) b!927007))

(assert (= start!79064 b!927013))

(declare-fun b_lambda!13779 () Bool)

(assert (=> (not b_lambda!13779) (not b!927005)))

(declare-fun t!26783 () Bool)

(declare-fun tb!5857 () Bool)

(assert (=> (and start!79064 (= defaultEntry!1235 defaultEntry!1235) t!26783) tb!5857))

(declare-fun result!11537 () Bool)

(assert (=> tb!5857 (= result!11537 tp_is_empty!19785)))

(assert (=> b!927005 t!26783))

(declare-fun b_and!28293 () Bool)

(assert (= b_and!28291 (and (=> t!26783 result!11537) b_and!28293)))

(declare-fun m!861625 () Bool)

(assert (=> start!79064 m!861625))

(declare-fun m!861627 () Bool)

(assert (=> start!79064 m!861627))

(declare-fun m!861629 () Bool)

(assert (=> start!79064 m!861629))

(declare-fun m!861631 () Bool)

(assert (=> b!927009 m!861631))

(declare-fun m!861633 () Bool)

(assert (=> b!927018 m!861633))

(declare-fun m!861635 () Bool)

(assert (=> b!927018 m!861635))

(declare-fun m!861637 () Bool)

(assert (=> b!927018 m!861637))

(declare-fun m!861639 () Bool)

(assert (=> b!927006 m!861639))

(declare-fun m!861641 () Bool)

(assert (=> b!927022 m!861641))

(declare-fun m!861643 () Bool)

(assert (=> b!927022 m!861643))

(declare-fun m!861645 () Bool)

(assert (=> b!927019 m!861645))

(declare-fun m!861647 () Bool)

(assert (=> b!927019 m!861647))

(declare-fun m!861649 () Bool)

(assert (=> b!927014 m!861649))

(declare-fun m!861651 () Bool)

(assert (=> mapNonEmpty!31434 m!861651))

(declare-fun m!861653 () Bool)

(assert (=> b!927010 m!861653))

(declare-fun m!861655 () Bool)

(assert (=> b!927005 m!861655))

(declare-fun m!861657 () Bool)

(assert (=> b!927005 m!861657))

(declare-fun m!861659 () Bool)

(assert (=> b!927005 m!861659))

(assert (=> b!927005 m!861657))

(declare-fun m!861661 () Bool)

(assert (=> b!927005 m!861661))

(declare-fun m!861663 () Bool)

(assert (=> b!927005 m!861663))

(declare-fun m!861665 () Bool)

(assert (=> b!927005 m!861665))

(declare-fun m!861667 () Bool)

(assert (=> b!927005 m!861667))

(declare-fun m!861669 () Bool)

(assert (=> b!927005 m!861669))

(declare-fun m!861671 () Bool)

(assert (=> b!927005 m!861671))

(declare-fun m!861673 () Bool)

(assert (=> b!927005 m!861673))

(assert (=> b!927005 m!861659))

(declare-fun m!861675 () Bool)

(assert (=> b!927005 m!861675))

(assert (=> b!927005 m!861643))

(declare-fun m!861677 () Bool)

(assert (=> b!927005 m!861677))

(declare-fun m!861679 () Bool)

(assert (=> b!927005 m!861679))

(assert (=> b!927005 m!861667))

(declare-fun m!861681 () Bool)

(assert (=> b!927005 m!861681))

(declare-fun m!861683 () Bool)

(assert (=> b!927005 m!861683))

(declare-fun m!861685 () Bool)

(assert (=> b!927020 m!861685))

(declare-fun m!861687 () Bool)

(assert (=> b!927008 m!861687))

(declare-fun m!861689 () Bool)

(assert (=> b!927008 m!861689))

(declare-fun m!861691 () Bool)

(assert (=> b!927012 m!861691))

(declare-fun m!861693 () Bool)

(assert (=> b!927017 m!861693))

(check-sat (not start!79064) (not b_lambda!13779) (not b!927006) (not b!927022) (not b_next!17277) (not b!927008) (not b!927019) (not mapNonEmpty!31434) (not b!927020) (not b!927009) (not b!927017) b_and!28293 (not b!927005) (not b!927018) (not b!927010) tp_is_empty!19785 (not b!927014) (not b!927012))
(check-sat b_and!28293 (not b_next!17277))
