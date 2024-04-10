; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79702 () Bool)

(assert start!79702)

(declare-fun b_free!17751 () Bool)

(declare-fun b_next!17751 () Bool)

(assert (=> start!79702 (= b_free!17751 (not b_next!17751))))

(declare-fun tp!61708 () Bool)

(declare-fun b_and!29093 () Bool)

(assert (=> start!79702 (= tp!61708 b_and!29093)))

(declare-fun mapNonEmpty!32160 () Bool)

(declare-fun mapRes!32160 () Bool)

(declare-fun tp!61709 () Bool)

(declare-fun e!526599 () Bool)

(assert (=> mapNonEmpty!32160 (= mapRes!32160 (and tp!61709 e!526599))))

(declare-datatypes ((V!31977 0))(
  ( (V!31978 (val!10180 Int)) )
))
(declare-datatypes ((ValueCell!9648 0))(
  ( (ValueCellFull!9648 (v!12705 V!31977)) (EmptyCell!9648) )
))
(declare-fun mapRest!32160 () (Array (_ BitVec 32) ValueCell!9648))

(declare-datatypes ((array!56458 0))(
  ( (array!56459 (arr!27169 (Array (_ BitVec 32) ValueCell!9648)) (size!27628 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56458)

(declare-fun mapKey!32160 () (_ BitVec 32))

(declare-fun mapValue!32160 () ValueCell!9648)

(assert (=> mapNonEmpty!32160 (= (arr!27169 _values!1231) (store mapRest!32160 mapKey!32160 mapValue!32160))))

(declare-fun b!937743 () Bool)

(declare-fun e!526594 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!937743 (= e!526594 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937744 () Bool)

(declare-fun res!631087 () Bool)

(declare-fun e!526601 () Bool)

(assert (=> b!937744 (=> (not res!631087) (not e!526601))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56460 0))(
  ( (array!56461 (arr!27170 (Array (_ BitVec 32) (_ BitVec 64))) (size!27629 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56460)

(assert (=> b!937744 (= res!631087 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27629 _keys!1487))))))

(declare-fun b!937745 () Bool)

(declare-fun e!526596 () Bool)

(declare-fun e!526595 () Bool)

(assert (=> b!937745 (= e!526596 (and e!526595 mapRes!32160))))

(declare-fun condMapEmpty!32160 () Bool)

(declare-fun mapDefault!32160 () ValueCell!9648)

(assert (=> b!937745 (= condMapEmpty!32160 (= (arr!27169 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9648)) mapDefault!32160)))))

(declare-fun res!631090 () Bool)

(assert (=> start!79702 (=> (not res!631090) (not e!526601))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79702 (= res!631090 (validMask!0 mask!1881))))

(assert (=> start!79702 e!526601))

(assert (=> start!79702 true))

(declare-fun tp_is_empty!20259 () Bool)

(assert (=> start!79702 tp_is_empty!20259))

(declare-fun array_inv!21134 (array!56458) Bool)

(assert (=> start!79702 (and (array_inv!21134 _values!1231) e!526596)))

(assert (=> start!79702 tp!61708))

(declare-fun array_inv!21135 (array!56460) Bool)

(assert (=> start!79702 (array_inv!21135 _keys!1487)))

(declare-fun b!937746 () Bool)

(declare-fun e!526597 () Bool)

(declare-fun e!526600 () Bool)

(assert (=> b!937746 (= e!526597 e!526600)))

(declare-fun res!631083 () Bool)

(assert (=> b!937746 (=> (not res!631083) (not e!526600))))

(assert (=> b!937746 (= res!631083 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(declare-datatypes ((Unit!31668 0))(
  ( (Unit!31669) )
))
(declare-fun lt!423243 () Unit!31668)

(declare-fun e!526602 () Unit!31668)

(assert (=> b!937746 (= lt!423243 e!526602)))

(declare-fun c!97632 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937746 (= c!97632 (validKeyInArray!0 k0!1099))))

(declare-fun b!937747 () Bool)

(declare-datatypes ((tuple2!13376 0))(
  ( (tuple2!13377 (_1!6699 (_ BitVec 64)) (_2!6699 V!31977)) )
))
(declare-datatypes ((List!19154 0))(
  ( (Nil!19151) (Cons!19150 (h!20296 tuple2!13376) (t!27449 List!19154)) )
))
(declare-datatypes ((ListLongMap!12073 0))(
  ( (ListLongMap!12074 (toList!6052 List!19154)) )
))
(declare-fun lt!423241 () ListLongMap!12073)

(declare-fun lt!423245 () V!31977)

(declare-fun apply!853 (ListLongMap!12073 (_ BitVec 64)) V!31977)

(assert (=> b!937747 (= (apply!853 lt!423241 k0!1099) lt!423245)))

(declare-fun lt!423238 () ListLongMap!12073)

(declare-fun lt!423248 () V!31977)

(declare-fun lt!423236 () Unit!31668)

(declare-fun lt!423240 () (_ BitVec 64))

(declare-fun addApplyDifferent!439 (ListLongMap!12073 (_ BitVec 64) V!31977 (_ BitVec 64)) Unit!31668)

(assert (=> b!937747 (= lt!423236 (addApplyDifferent!439 lt!423238 lt!423240 lt!423248 k0!1099))))

(assert (=> b!937747 (not (= lt!423240 k0!1099))))

(declare-fun lt!423244 () Unit!31668)

(declare-datatypes ((List!19155 0))(
  ( (Nil!19152) (Cons!19151 (h!20297 (_ BitVec 64)) (t!27450 List!19155)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56460 (_ BitVec 64) (_ BitVec 32) List!19155) Unit!31668)

(assert (=> b!937747 (= lt!423244 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19152))))

(assert (=> b!937747 e!526594))

(declare-fun c!97630 () Bool)

(assert (=> b!937747 (= c!97630 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423242 () Unit!31668)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31977)

(declare-fun minValue!1173 () V!31977)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!312 (array!56460 array!56458 (_ BitVec 32) (_ BitVec 32) V!31977 V!31977 (_ BitVec 64) (_ BitVec 32) Int) Unit!31668)

(assert (=> b!937747 (= lt!423242 (lemmaListMapContainsThenArrayContainsFrom!312 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56460 (_ BitVec 32) List!19155) Bool)

(assert (=> b!937747 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19152)))

(declare-fun lt!423239 () Unit!31668)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56460 (_ BitVec 32) (_ BitVec 32)) Unit!31668)

(assert (=> b!937747 (= lt!423239 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5111 (ListLongMap!12073 (_ BitVec 64)) Bool)

(assert (=> b!937747 (contains!5111 lt!423241 k0!1099)))

(declare-fun lt!423246 () tuple2!13376)

(declare-fun +!2840 (ListLongMap!12073 tuple2!13376) ListLongMap!12073)

(assert (=> b!937747 (= lt!423241 (+!2840 lt!423238 lt!423246))))

(declare-fun lt!423247 () Unit!31668)

(declare-fun addStillContains!559 (ListLongMap!12073 (_ BitVec 64) V!31977 (_ BitVec 64)) Unit!31668)

(assert (=> b!937747 (= lt!423247 (addStillContains!559 lt!423238 lt!423240 lt!423248 k0!1099))))

(declare-fun getCurrentListMap!3287 (array!56460 array!56458 (_ BitVec 32) (_ BitVec 32) V!31977 V!31977 (_ BitVec 32) Int) ListLongMap!12073)

(assert (=> b!937747 (= (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2840 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423246))))

(assert (=> b!937747 (= lt!423246 (tuple2!13377 lt!423240 lt!423248))))

(declare-fun get!14328 (ValueCell!9648 V!31977) V!31977)

(declare-fun dynLambda!1629 (Int (_ BitVec 64)) V!31977)

(assert (=> b!937747 (= lt!423248 (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423237 () Unit!31668)

(declare-fun lemmaListMapRecursiveValidKeyArray!230 (array!56460 array!56458 (_ BitVec 32) (_ BitVec 32) V!31977 V!31977 (_ BitVec 32) Int) Unit!31668)

(assert (=> b!937747 (= lt!423237 (lemmaListMapRecursiveValidKeyArray!230 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!526592 () Unit!31668)

(assert (=> b!937747 (= e!526592 lt!423236)))

(declare-fun b!937748 () Bool)

(assert (=> b!937748 (= e!526599 tp_is_empty!20259)))

(declare-fun b!937749 () Bool)

(assert (=> b!937749 (= e!526595 tp_is_empty!20259)))

(declare-fun b!937750 () Bool)

(declare-fun arrayContainsKey!0 (array!56460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937750 (= e!526594 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!937751 () Bool)

(assert (=> b!937751 (= e!526602 e!526592)))

(assert (=> b!937751 (= lt!423240 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97631 () Bool)

(assert (=> b!937751 (= c!97631 (validKeyInArray!0 lt!423240))))

(declare-fun b!937752 () Bool)

(assert (=> b!937752 (= e!526600 (not (contains!5111 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) k0!1099)))))

(declare-fun b!937753 () Bool)

(declare-fun res!631084 () Bool)

(assert (=> b!937753 (=> (not res!631084) (not e!526601))))

(assert (=> b!937753 (= res!631084 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19152))))

(declare-fun b!937754 () Bool)

(declare-fun Unit!31670 () Unit!31668)

(assert (=> b!937754 (= e!526602 Unit!31670)))

(declare-fun b!937755 () Bool)

(declare-fun e!526593 () Bool)

(assert (=> b!937755 (= e!526601 e!526593)))

(declare-fun res!631086 () Bool)

(assert (=> b!937755 (=> (not res!631086) (not e!526593))))

(assert (=> b!937755 (= res!631086 (contains!5111 lt!423238 k0!1099))))

(assert (=> b!937755 (= lt!423238 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937756 () Bool)

(assert (=> b!937756 (= e!526593 e!526597)))

(declare-fun res!631088 () Bool)

(assert (=> b!937756 (=> (not res!631088) (not e!526597))))

(declare-fun v!791 () V!31977)

(assert (=> b!937756 (= res!631088 (and (= lt!423245 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!937756 (= lt!423245 (apply!853 lt!423238 k0!1099))))

(declare-fun mapIsEmpty!32160 () Bool)

(assert (=> mapIsEmpty!32160 mapRes!32160))

(declare-fun b!937757 () Bool)

(declare-fun res!631089 () Bool)

(assert (=> b!937757 (=> (not res!631089) (not e!526601))))

(assert (=> b!937757 (= res!631089 (and (= (size!27628 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27629 _keys!1487) (size!27628 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937758 () Bool)

(declare-fun Unit!31671 () Unit!31668)

(assert (=> b!937758 (= e!526592 Unit!31671)))

(declare-fun b!937759 () Bool)

(declare-fun res!631085 () Bool)

(assert (=> b!937759 (=> (not res!631085) (not e!526601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56460 (_ BitVec 32)) Bool)

(assert (=> b!937759 (= res!631085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79702 res!631090) b!937757))

(assert (= (and b!937757 res!631089) b!937759))

(assert (= (and b!937759 res!631085) b!937753))

(assert (= (and b!937753 res!631084) b!937744))

(assert (= (and b!937744 res!631087) b!937755))

(assert (= (and b!937755 res!631086) b!937756))

(assert (= (and b!937756 res!631088) b!937746))

(assert (= (and b!937746 c!97632) b!937751))

(assert (= (and b!937746 (not c!97632)) b!937754))

(assert (= (and b!937751 c!97631) b!937747))

(assert (= (and b!937751 (not c!97631)) b!937758))

(assert (= (and b!937747 c!97630) b!937750))

(assert (= (and b!937747 (not c!97630)) b!937743))

(assert (= (and b!937746 res!631083) b!937752))

(assert (= (and b!937745 condMapEmpty!32160) mapIsEmpty!32160))

(assert (= (and b!937745 (not condMapEmpty!32160)) mapNonEmpty!32160))

(get-info :version)

(assert (= (and mapNonEmpty!32160 ((_ is ValueCellFull!9648) mapValue!32160)) b!937748))

(assert (= (and b!937745 ((_ is ValueCellFull!9648) mapDefault!32160)) b!937749))

(assert (= start!79702 b!937745))

(declare-fun b_lambda!14157 () Bool)

(assert (=> (not b_lambda!14157) (not b!937747)))

(declare-fun t!27448 () Bool)

(declare-fun tb!6145 () Bool)

(assert (=> (and start!79702 (= defaultEntry!1235 defaultEntry!1235) t!27448) tb!6145))

(declare-fun result!12123 () Bool)

(assert (=> tb!6145 (= result!12123 tp_is_empty!20259)))

(assert (=> b!937747 t!27448))

(declare-fun b_and!29095 () Bool)

(assert (= b_and!29093 (and (=> t!27448 result!12123) b_and!29095)))

(declare-fun m!872551 () Bool)

(assert (=> b!937756 m!872551))

(declare-fun m!872553 () Bool)

(assert (=> b!937753 m!872553))

(declare-fun m!872555 () Bool)

(assert (=> start!79702 m!872555))

(declare-fun m!872557 () Bool)

(assert (=> start!79702 m!872557))

(declare-fun m!872559 () Bool)

(assert (=> start!79702 m!872559))

(declare-fun m!872561 () Bool)

(assert (=> b!937750 m!872561))

(declare-fun m!872563 () Bool)

(assert (=> b!937747 m!872563))

(declare-fun m!872565 () Bool)

(assert (=> b!937747 m!872565))

(declare-fun m!872567 () Bool)

(assert (=> b!937747 m!872567))

(assert (=> b!937747 m!872565))

(declare-fun m!872569 () Bool)

(assert (=> b!937747 m!872569))

(declare-fun m!872571 () Bool)

(assert (=> b!937747 m!872571))

(declare-fun m!872573 () Bool)

(assert (=> b!937747 m!872573))

(declare-fun m!872575 () Bool)

(assert (=> b!937747 m!872575))

(declare-fun m!872577 () Bool)

(assert (=> b!937747 m!872577))

(declare-fun m!872579 () Bool)

(assert (=> b!937747 m!872579))

(declare-fun m!872581 () Bool)

(assert (=> b!937747 m!872581))

(declare-fun m!872583 () Bool)

(assert (=> b!937747 m!872583))

(declare-fun m!872585 () Bool)

(assert (=> b!937747 m!872585))

(assert (=> b!937747 m!872569))

(declare-fun m!872587 () Bool)

(assert (=> b!937747 m!872587))

(declare-fun m!872589 () Bool)

(assert (=> b!937747 m!872589))

(declare-fun m!872591 () Bool)

(assert (=> b!937747 m!872591))

(assert (=> b!937747 m!872581))

(declare-fun m!872593 () Bool)

(assert (=> b!937747 m!872593))

(declare-fun m!872595 () Bool)

(assert (=> b!937746 m!872595))

(declare-fun m!872597 () Bool)

(assert (=> b!937759 m!872597))

(declare-fun m!872599 () Bool)

(assert (=> b!937751 m!872599))

(declare-fun m!872601 () Bool)

(assert (=> b!937751 m!872601))

(declare-fun m!872603 () Bool)

(assert (=> b!937755 m!872603))

(declare-fun m!872605 () Bool)

(assert (=> b!937755 m!872605))

(declare-fun m!872607 () Bool)

(assert (=> mapNonEmpty!32160 m!872607))

(assert (=> b!937752 m!872573))

(assert (=> b!937752 m!872573))

(declare-fun m!872609 () Bool)

(assert (=> b!937752 m!872609))

(check-sat (not b_lambda!14157) b_and!29095 (not b!937753) (not mapNonEmpty!32160) (not b!937752) (not b!937755) (not b!937747) (not b!937750) tp_is_empty!20259 (not b!937751) (not b!937756) (not b!937759) (not b!937746) (not start!79702) (not b_next!17751))
(check-sat b_and!29095 (not b_next!17751))
(get-model)

(declare-fun b_lambda!14161 () Bool)

(assert (= b_lambda!14157 (or (and start!79702 b_free!17751) b_lambda!14161)))

(check-sat b_and!29095 (not b!937753) (not mapNonEmpty!32160) (not b!937752) (not b!937755) (not b!937747) (not b!937750) tp_is_empty!20259 (not b_lambda!14161) (not b!937751) (not b!937756) (not b!937759) (not b!937746) (not start!79702) (not b_next!17751))
(check-sat b_and!29095 (not b_next!17751))
(get-model)

(declare-fun b!937857 () Bool)

(declare-fun e!526670 () Bool)

(declare-fun call!40773 () Bool)

(assert (=> b!937857 (= e!526670 (not call!40773))))

(declare-fun b!937858 () Bool)

(declare-fun e!526662 () ListLongMap!12073)

(declare-fun call!40777 () ListLongMap!12073)

(assert (=> b!937858 (= e!526662 call!40777)))

(declare-fun b!937859 () Bool)

(declare-fun e!526665 () ListLongMap!12073)

(declare-fun call!40774 () ListLongMap!12073)

(assert (=> b!937859 (= e!526665 call!40774)))

(declare-fun b!937860 () Bool)

(declare-fun e!526674 () Bool)

(declare-fun e!526668 () Bool)

(assert (=> b!937860 (= e!526674 e!526668)))

(declare-fun res!631137 () Bool)

(assert (=> b!937860 (=> (not res!631137) (not e!526668))))

(declare-fun lt!423353 () ListLongMap!12073)

(assert (=> b!937860 (= res!631137 (contains!5111 lt!423353 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!937860 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(declare-fun b!937861 () Bool)

(declare-fun e!526667 () Bool)

(declare-fun e!526663 () Bool)

(assert (=> b!937861 (= e!526667 e!526663)))

(declare-fun res!631133 () Bool)

(declare-fun call!40778 () Bool)

(assert (=> b!937861 (= res!631133 call!40778)))

(assert (=> b!937861 (=> (not res!631133) (not e!526663))))

(declare-fun b!937862 () Bool)

(declare-fun e!526669 () Bool)

(assert (=> b!937862 (= e!526670 e!526669)))

(declare-fun res!631136 () Bool)

(assert (=> b!937862 (= res!631136 call!40773)))

(assert (=> b!937862 (=> (not res!631136) (not e!526669))))

(declare-fun bm!40770 () Bool)

(declare-fun call!40779 () ListLongMap!12073)

(assert (=> bm!40770 (= call!40777 call!40779)))

(declare-fun b!937864 () Bool)

(assert (=> b!937864 (= e!526667 (not call!40778))))

(declare-fun call!40776 () ListLongMap!12073)

(declare-fun c!97659 () Bool)

(declare-fun bm!40771 () Bool)

(declare-fun call!40775 () ListLongMap!12073)

(declare-fun c!97656 () Bool)

(assert (=> bm!40771 (= call!40775 (+!2840 (ite c!97659 call!40776 (ite c!97656 call!40779 call!40777)) (ite (or c!97659 c!97656) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun bm!40772 () Bool)

(assert (=> bm!40772 (= call!40778 (contains!5111 lt!423353 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40773 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3303 (array!56460 array!56458 (_ BitVec 32) (_ BitVec 32) V!31977 V!31977 (_ BitVec 32) Int) ListLongMap!12073)

(assert (=> bm!40773 (= call!40776 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!937865 () Bool)

(assert (=> b!937865 (= e!526669 (= (apply!853 lt!423353 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!937866 () Bool)

(declare-fun e!526673 () ListLongMap!12073)

(assert (=> b!937866 (= e!526673 e!526665)))

(assert (=> b!937866 (= c!97656 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!937867 () Bool)

(assert (=> b!937867 (= e!526663 (= (apply!853 lt!423353 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!937868 () Bool)

(declare-fun e!526664 () Bool)

(assert (=> b!937868 (= e!526664 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!937869 () Bool)

(declare-fun e!526672 () Bool)

(assert (=> b!937869 (= e!526672 e!526667)))

(declare-fun c!97657 () Bool)

(assert (=> b!937869 (= c!97657 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!937870 () Bool)

(declare-fun e!526666 () Unit!31668)

(declare-fun Unit!31675 () Unit!31668)

(assert (=> b!937870 (= e!526666 Unit!31675)))

(declare-fun b!937871 () Bool)

(assert (=> b!937871 (= e!526662 call!40774)))

(declare-fun bm!40774 () Bool)

(assert (=> bm!40774 (= call!40779 call!40776)))

(declare-fun b!937872 () Bool)

(declare-fun res!631140 () Bool)

(assert (=> b!937872 (=> (not res!631140) (not e!526672))))

(assert (=> b!937872 (= res!631140 e!526674)))

(declare-fun res!631141 () Bool)

(assert (=> b!937872 (=> res!631141 e!526674)))

(assert (=> b!937872 (= res!631141 (not e!526664))))

(declare-fun res!631138 () Bool)

(assert (=> b!937872 (=> (not res!631138) (not e!526664))))

(assert (=> b!937872 (= res!631138 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(declare-fun bm!40775 () Bool)

(assert (=> bm!40775 (= call!40774 call!40775)))

(declare-fun b!937873 () Bool)

(declare-fun res!631134 () Bool)

(assert (=> b!937873 (=> (not res!631134) (not e!526672))))

(assert (=> b!937873 (= res!631134 e!526670)))

(declare-fun c!97655 () Bool)

(assert (=> b!937873 (= c!97655 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!937874 () Bool)

(declare-fun lt!423341 () Unit!31668)

(assert (=> b!937874 (= e!526666 lt!423341)))

(declare-fun lt!423336 () ListLongMap!12073)

(assert (=> b!937874 (= lt!423336 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423345 () (_ BitVec 64))

(assert (=> b!937874 (= lt!423345 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423346 () (_ BitVec 64))

(assert (=> b!937874 (= lt!423346 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!423347 () Unit!31668)

(assert (=> b!937874 (= lt!423347 (addStillContains!559 lt!423336 lt!423345 zeroValue!1173 lt!423346))))

(assert (=> b!937874 (contains!5111 (+!2840 lt!423336 (tuple2!13377 lt!423345 zeroValue!1173)) lt!423346)))

(declare-fun lt!423352 () Unit!31668)

(assert (=> b!937874 (= lt!423352 lt!423347)))

(declare-fun lt!423348 () ListLongMap!12073)

(assert (=> b!937874 (= lt!423348 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423349 () (_ BitVec 64))

(assert (=> b!937874 (= lt!423349 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423350 () (_ BitVec 64))

(assert (=> b!937874 (= lt!423350 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!423344 () Unit!31668)

(assert (=> b!937874 (= lt!423344 (addApplyDifferent!439 lt!423348 lt!423349 minValue!1173 lt!423350))))

(assert (=> b!937874 (= (apply!853 (+!2840 lt!423348 (tuple2!13377 lt!423349 minValue!1173)) lt!423350) (apply!853 lt!423348 lt!423350))))

(declare-fun lt!423338 () Unit!31668)

(assert (=> b!937874 (= lt!423338 lt!423344)))

(declare-fun lt!423337 () ListLongMap!12073)

(assert (=> b!937874 (= lt!423337 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423333 () (_ BitVec 64))

(assert (=> b!937874 (= lt!423333 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423340 () (_ BitVec 64))

(assert (=> b!937874 (= lt!423340 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!423343 () Unit!31668)

(assert (=> b!937874 (= lt!423343 (addApplyDifferent!439 lt!423337 lt!423333 zeroValue!1173 lt!423340))))

(assert (=> b!937874 (= (apply!853 (+!2840 lt!423337 (tuple2!13377 lt!423333 zeroValue!1173)) lt!423340) (apply!853 lt!423337 lt!423340))))

(declare-fun lt!423332 () Unit!31668)

(assert (=> b!937874 (= lt!423332 lt!423343)))

(declare-fun lt!423339 () ListLongMap!12073)

(assert (=> b!937874 (= lt!423339 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423342 () (_ BitVec 64))

(assert (=> b!937874 (= lt!423342 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423351 () (_ BitVec 64))

(assert (=> b!937874 (= lt!423351 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!937874 (= lt!423341 (addApplyDifferent!439 lt!423339 lt!423342 minValue!1173 lt!423351))))

(assert (=> b!937874 (= (apply!853 (+!2840 lt!423339 (tuple2!13377 lt!423342 minValue!1173)) lt!423351) (apply!853 lt!423339 lt!423351))))

(declare-fun d!113327 () Bool)

(assert (=> d!113327 e!526672))

(declare-fun res!631139 () Bool)

(assert (=> d!113327 (=> (not res!631139) (not e!526672))))

(assert (=> d!113327 (= res!631139 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27629 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))))

(declare-fun lt!423335 () ListLongMap!12073)

(assert (=> d!113327 (= lt!423353 lt!423335)))

(declare-fun lt!423334 () Unit!31668)

(assert (=> d!113327 (= lt!423334 e!526666)))

(declare-fun c!97658 () Bool)

(declare-fun e!526671 () Bool)

(assert (=> d!113327 (= c!97658 e!526671)))

(declare-fun res!631135 () Bool)

(assert (=> d!113327 (=> (not res!631135) (not e!526671))))

(assert (=> d!113327 (= res!631135 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(assert (=> d!113327 (= lt!423335 e!526673)))

(assert (=> d!113327 (= c!97659 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113327 (validMask!0 mask!1881)))

(assert (=> d!113327 (= (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!423353)))

(declare-fun b!937863 () Bool)

(assert (=> b!937863 (= e!526671 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!937875 () Bool)

(assert (=> b!937875 (= e!526668 (= (apply!853 lt!423353 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937875 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27628 _values!1231)))))

(assert (=> b!937875 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(declare-fun b!937876 () Bool)

(assert (=> b!937876 (= e!526673 (+!2840 call!40775 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun bm!40776 () Bool)

(assert (=> bm!40776 (= call!40773 (contains!5111 lt!423353 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!937877 () Bool)

(declare-fun c!97654 () Bool)

(assert (=> b!937877 (= c!97654 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!937877 (= e!526665 e!526662)))

(assert (= (and d!113327 c!97659) b!937876))

(assert (= (and d!113327 (not c!97659)) b!937866))

(assert (= (and b!937866 c!97656) b!937859))

(assert (= (and b!937866 (not c!97656)) b!937877))

(assert (= (and b!937877 c!97654) b!937871))

(assert (= (and b!937877 (not c!97654)) b!937858))

(assert (= (or b!937871 b!937858) bm!40770))

(assert (= (or b!937859 bm!40770) bm!40774))

(assert (= (or b!937859 b!937871) bm!40775))

(assert (= (or b!937876 bm!40774) bm!40773))

(assert (= (or b!937876 bm!40775) bm!40771))

(assert (= (and d!113327 res!631135) b!937863))

(assert (= (and d!113327 c!97658) b!937874))

(assert (= (and d!113327 (not c!97658)) b!937870))

(assert (= (and d!113327 res!631139) b!937872))

(assert (= (and b!937872 res!631138) b!937868))

(assert (= (and b!937872 (not res!631141)) b!937860))

(assert (= (and b!937860 res!631137) b!937875))

(assert (= (and b!937872 res!631140) b!937873))

(assert (= (and b!937873 c!97655) b!937862))

(assert (= (and b!937873 (not c!97655)) b!937857))

(assert (= (and b!937862 res!631136) b!937865))

(assert (= (or b!937862 b!937857) bm!40776))

(assert (= (and b!937873 res!631134) b!937869))

(assert (= (and b!937869 c!97657) b!937861))

(assert (= (and b!937869 (not c!97657)) b!937864))

(assert (= (and b!937861 res!631133) b!937867))

(assert (= (or b!937861 b!937864) bm!40772))

(declare-fun b_lambda!14163 () Bool)

(assert (=> (not b_lambda!14163) (not b!937875)))

(assert (=> b!937875 t!27448))

(declare-fun b_and!29101 () Bool)

(assert (= b_and!29095 (and (=> t!27448 result!12123) b_and!29101)))

(declare-fun m!872671 () Bool)

(assert (=> b!937874 m!872671))

(declare-fun m!872673 () Bool)

(assert (=> b!937874 m!872673))

(declare-fun m!872675 () Bool)

(assert (=> b!937874 m!872675))

(declare-fun m!872677 () Bool)

(assert (=> b!937874 m!872677))

(declare-fun m!872679 () Bool)

(assert (=> b!937874 m!872679))

(declare-fun m!872681 () Bool)

(assert (=> b!937874 m!872681))

(declare-fun m!872683 () Bool)

(assert (=> b!937874 m!872683))

(declare-fun m!872685 () Bool)

(assert (=> b!937874 m!872685))

(declare-fun m!872687 () Bool)

(assert (=> b!937874 m!872687))

(assert (=> b!937874 m!872671))

(declare-fun m!872689 () Bool)

(assert (=> b!937874 m!872689))

(assert (=> b!937874 m!872675))

(declare-fun m!872691 () Bool)

(assert (=> b!937874 m!872691))

(declare-fun m!872693 () Bool)

(assert (=> b!937874 m!872693))

(assert (=> b!937874 m!872599))

(declare-fun m!872695 () Bool)

(assert (=> b!937874 m!872695))

(assert (=> b!937874 m!872687))

(declare-fun m!872697 () Bool)

(assert (=> b!937874 m!872697))

(assert (=> b!937874 m!872695))

(declare-fun m!872699 () Bool)

(assert (=> b!937874 m!872699))

(declare-fun m!872701 () Bool)

(assert (=> b!937874 m!872701))

(declare-fun m!872703 () Bool)

(assert (=> b!937876 m!872703))

(declare-fun m!872705 () Bool)

(assert (=> b!937867 m!872705))

(declare-fun m!872707 () Bool)

(assert (=> bm!40776 m!872707))

(assert (=> bm!40773 m!872673))

(assert (=> d!113327 m!872555))

(declare-fun m!872709 () Bool)

(assert (=> b!937865 m!872709))

(assert (=> b!937860 m!872599))

(assert (=> b!937860 m!872599))

(declare-fun m!872711 () Bool)

(assert (=> b!937860 m!872711))

(declare-fun m!872713 () Bool)

(assert (=> bm!40771 m!872713))

(assert (=> b!937868 m!872599))

(assert (=> b!937868 m!872599))

(declare-fun m!872715 () Bool)

(assert (=> b!937868 m!872715))

(assert (=> b!937875 m!872565))

(assert (=> b!937875 m!872569))

(assert (=> b!937875 m!872571))

(assert (=> b!937875 m!872565))

(assert (=> b!937875 m!872599))

(declare-fun m!872717 () Bool)

(assert (=> b!937875 m!872717))

(assert (=> b!937875 m!872569))

(assert (=> b!937875 m!872599))

(declare-fun m!872719 () Bool)

(assert (=> bm!40772 m!872719))

(assert (=> b!937863 m!872599))

(assert (=> b!937863 m!872599))

(assert (=> b!937863 m!872715))

(assert (=> b!937747 d!113327))

(declare-fun b!937878 () Bool)

(declare-fun e!526683 () Bool)

(declare-fun call!40780 () Bool)

(assert (=> b!937878 (= e!526683 (not call!40780))))

(declare-fun b!937879 () Bool)

(declare-fun e!526675 () ListLongMap!12073)

(declare-fun call!40784 () ListLongMap!12073)

(assert (=> b!937879 (= e!526675 call!40784)))

(declare-fun b!937880 () Bool)

(declare-fun e!526678 () ListLongMap!12073)

(declare-fun call!40781 () ListLongMap!12073)

(assert (=> b!937880 (= e!526678 call!40781)))

(declare-fun b!937881 () Bool)

(declare-fun e!526687 () Bool)

(declare-fun e!526681 () Bool)

(assert (=> b!937881 (= e!526687 e!526681)))

(declare-fun res!631146 () Bool)

(assert (=> b!937881 (=> (not res!631146) (not e!526681))))

(declare-fun lt!423375 () ListLongMap!12073)

(assert (=> b!937881 (= res!631146 (contains!5111 lt!423375 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!937881 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27629 _keys!1487)))))

(declare-fun b!937882 () Bool)

(declare-fun e!526680 () Bool)

(declare-fun e!526676 () Bool)

(assert (=> b!937882 (= e!526680 e!526676)))

(declare-fun res!631142 () Bool)

(declare-fun call!40785 () Bool)

(assert (=> b!937882 (= res!631142 call!40785)))

(assert (=> b!937882 (=> (not res!631142) (not e!526676))))

(declare-fun b!937883 () Bool)

(declare-fun e!526682 () Bool)

(assert (=> b!937883 (= e!526683 e!526682)))

(declare-fun res!631145 () Bool)

(assert (=> b!937883 (= res!631145 call!40780)))

(assert (=> b!937883 (=> (not res!631145) (not e!526682))))

(declare-fun bm!40777 () Bool)

(declare-fun call!40786 () ListLongMap!12073)

(assert (=> bm!40777 (= call!40784 call!40786)))

(declare-fun b!937885 () Bool)

(assert (=> b!937885 (= e!526680 (not call!40785))))

(declare-fun bm!40778 () Bool)

(declare-fun c!97662 () Bool)

(declare-fun call!40782 () ListLongMap!12073)

(declare-fun call!40783 () ListLongMap!12073)

(declare-fun c!97665 () Bool)

(assert (=> bm!40778 (= call!40782 (+!2840 (ite c!97665 call!40783 (ite c!97662 call!40786 call!40784)) (ite (or c!97665 c!97662) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun bm!40779 () Bool)

(assert (=> bm!40779 (= call!40785 (contains!5111 lt!423375 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40780 () Bool)

(assert (=> bm!40780 (= call!40783 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun b!937886 () Bool)

(assert (=> b!937886 (= e!526682 (= (apply!853 lt!423375 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!937887 () Bool)

(declare-fun e!526686 () ListLongMap!12073)

(assert (=> b!937887 (= e!526686 e!526678)))

(assert (=> b!937887 (= c!97662 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!937888 () Bool)

(assert (=> b!937888 (= e!526676 (= (apply!853 lt!423375 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!937889 () Bool)

(declare-fun e!526677 () Bool)

(assert (=> b!937889 (= e!526677 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!937890 () Bool)

(declare-fun e!526685 () Bool)

(assert (=> b!937890 (= e!526685 e!526680)))

(declare-fun c!97663 () Bool)

(assert (=> b!937890 (= c!97663 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!937891 () Bool)

(declare-fun e!526679 () Unit!31668)

(declare-fun Unit!31676 () Unit!31668)

(assert (=> b!937891 (= e!526679 Unit!31676)))

(declare-fun b!937892 () Bool)

(assert (=> b!937892 (= e!526675 call!40781)))

(declare-fun bm!40781 () Bool)

(assert (=> bm!40781 (= call!40786 call!40783)))

(declare-fun b!937893 () Bool)

(declare-fun res!631149 () Bool)

(assert (=> b!937893 (=> (not res!631149) (not e!526685))))

(assert (=> b!937893 (= res!631149 e!526687)))

(declare-fun res!631150 () Bool)

(assert (=> b!937893 (=> res!631150 e!526687)))

(assert (=> b!937893 (= res!631150 (not e!526677))))

(declare-fun res!631147 () Bool)

(assert (=> b!937893 (=> (not res!631147) (not e!526677))))

(assert (=> b!937893 (= res!631147 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27629 _keys!1487)))))

(declare-fun bm!40782 () Bool)

(assert (=> bm!40782 (= call!40781 call!40782)))

(declare-fun b!937894 () Bool)

(declare-fun res!631143 () Bool)

(assert (=> b!937894 (=> (not res!631143) (not e!526685))))

(assert (=> b!937894 (= res!631143 e!526683)))

(declare-fun c!97661 () Bool)

(assert (=> b!937894 (= c!97661 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!937895 () Bool)

(declare-fun lt!423363 () Unit!31668)

(assert (=> b!937895 (= e!526679 lt!423363)))

(declare-fun lt!423358 () ListLongMap!12073)

(assert (=> b!937895 (= lt!423358 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423367 () (_ BitVec 64))

(assert (=> b!937895 (= lt!423367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423368 () (_ BitVec 64))

(assert (=> b!937895 (= lt!423368 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!423369 () Unit!31668)

(assert (=> b!937895 (= lt!423369 (addStillContains!559 lt!423358 lt!423367 zeroValue!1173 lt!423368))))

(assert (=> b!937895 (contains!5111 (+!2840 lt!423358 (tuple2!13377 lt!423367 zeroValue!1173)) lt!423368)))

(declare-fun lt!423374 () Unit!31668)

(assert (=> b!937895 (= lt!423374 lt!423369)))

(declare-fun lt!423370 () ListLongMap!12073)

(assert (=> b!937895 (= lt!423370 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423371 () (_ BitVec 64))

(assert (=> b!937895 (= lt!423371 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423372 () (_ BitVec 64))

(assert (=> b!937895 (= lt!423372 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!423366 () Unit!31668)

(assert (=> b!937895 (= lt!423366 (addApplyDifferent!439 lt!423370 lt!423371 minValue!1173 lt!423372))))

(assert (=> b!937895 (= (apply!853 (+!2840 lt!423370 (tuple2!13377 lt!423371 minValue!1173)) lt!423372) (apply!853 lt!423370 lt!423372))))

(declare-fun lt!423360 () Unit!31668)

(assert (=> b!937895 (= lt!423360 lt!423366)))

(declare-fun lt!423359 () ListLongMap!12073)

(assert (=> b!937895 (= lt!423359 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423355 () (_ BitVec 64))

(assert (=> b!937895 (= lt!423355 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423362 () (_ BitVec 64))

(assert (=> b!937895 (= lt!423362 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!423365 () Unit!31668)

(assert (=> b!937895 (= lt!423365 (addApplyDifferent!439 lt!423359 lt!423355 zeroValue!1173 lt!423362))))

(assert (=> b!937895 (= (apply!853 (+!2840 lt!423359 (tuple2!13377 lt!423355 zeroValue!1173)) lt!423362) (apply!853 lt!423359 lt!423362))))

(declare-fun lt!423354 () Unit!31668)

(assert (=> b!937895 (= lt!423354 lt!423365)))

(declare-fun lt!423361 () ListLongMap!12073)

(assert (=> b!937895 (= lt!423361 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423364 () (_ BitVec 64))

(assert (=> b!937895 (= lt!423364 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423373 () (_ BitVec 64))

(assert (=> b!937895 (= lt!423373 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!937895 (= lt!423363 (addApplyDifferent!439 lt!423361 lt!423364 minValue!1173 lt!423373))))

(assert (=> b!937895 (= (apply!853 (+!2840 lt!423361 (tuple2!13377 lt!423364 minValue!1173)) lt!423373) (apply!853 lt!423361 lt!423373))))

(declare-fun d!113329 () Bool)

(assert (=> d!113329 e!526685))

(declare-fun res!631148 () Bool)

(assert (=> d!113329 (=> (not res!631148) (not e!526685))))

(assert (=> d!113329 (= res!631148 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27629 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27629 _keys!1487)))))))

(declare-fun lt!423357 () ListLongMap!12073)

(assert (=> d!113329 (= lt!423375 lt!423357)))

(declare-fun lt!423356 () Unit!31668)

(assert (=> d!113329 (= lt!423356 e!526679)))

(declare-fun c!97664 () Bool)

(declare-fun e!526684 () Bool)

(assert (=> d!113329 (= c!97664 e!526684)))

(declare-fun res!631144 () Bool)

(assert (=> d!113329 (=> (not res!631144) (not e!526684))))

(assert (=> d!113329 (= res!631144 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27629 _keys!1487)))))

(assert (=> d!113329 (= lt!423357 e!526686)))

(assert (=> d!113329 (= c!97665 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113329 (validMask!0 mask!1881)))

(assert (=> d!113329 (= (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423375)))

(declare-fun b!937884 () Bool)

(assert (=> b!937884 (= e!526684 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!937896 () Bool)

(assert (=> b!937896 (= e!526681 (= (apply!853 lt!423375 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14328 (select (arr!27169 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937896 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27628 _values!1231)))))

(assert (=> b!937896 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27629 _keys!1487)))))

(declare-fun b!937897 () Bool)

(assert (=> b!937897 (= e!526686 (+!2840 call!40782 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun bm!40783 () Bool)

(assert (=> bm!40783 (= call!40780 (contains!5111 lt!423375 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!937898 () Bool)

(declare-fun c!97660 () Bool)

(assert (=> b!937898 (= c!97660 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!937898 (= e!526678 e!526675)))

(assert (= (and d!113329 c!97665) b!937897))

(assert (= (and d!113329 (not c!97665)) b!937887))

(assert (= (and b!937887 c!97662) b!937880))

(assert (= (and b!937887 (not c!97662)) b!937898))

(assert (= (and b!937898 c!97660) b!937892))

(assert (= (and b!937898 (not c!97660)) b!937879))

(assert (= (or b!937892 b!937879) bm!40777))

(assert (= (or b!937880 bm!40777) bm!40781))

(assert (= (or b!937880 b!937892) bm!40782))

(assert (= (or b!937897 bm!40781) bm!40780))

(assert (= (or b!937897 bm!40782) bm!40778))

(assert (= (and d!113329 res!631144) b!937884))

(assert (= (and d!113329 c!97664) b!937895))

(assert (= (and d!113329 (not c!97664)) b!937891))

(assert (= (and d!113329 res!631148) b!937893))

(assert (= (and b!937893 res!631147) b!937889))

(assert (= (and b!937893 (not res!631150)) b!937881))

(assert (= (and b!937881 res!631146) b!937896))

(assert (= (and b!937893 res!631149) b!937894))

(assert (= (and b!937894 c!97661) b!937883))

(assert (= (and b!937894 (not c!97661)) b!937878))

(assert (= (and b!937883 res!631145) b!937886))

(assert (= (or b!937883 b!937878) bm!40783))

(assert (= (and b!937894 res!631143) b!937890))

(assert (= (and b!937890 c!97663) b!937882))

(assert (= (and b!937890 (not c!97663)) b!937885))

(assert (= (and b!937882 res!631142) b!937888))

(assert (= (or b!937882 b!937885) bm!40779))

(declare-fun b_lambda!14165 () Bool)

(assert (=> (not b_lambda!14165) (not b!937896)))

(assert (=> b!937896 t!27448))

(declare-fun b_and!29103 () Bool)

(assert (= b_and!29101 (and (=> t!27448 result!12123) b_and!29103)))

(declare-fun m!872721 () Bool)

(assert (=> b!937895 m!872721))

(declare-fun m!872723 () Bool)

(assert (=> b!937895 m!872723))

(declare-fun m!872725 () Bool)

(assert (=> b!937895 m!872725))

(declare-fun m!872727 () Bool)

(assert (=> b!937895 m!872727))

(declare-fun m!872729 () Bool)

(assert (=> b!937895 m!872729))

(declare-fun m!872731 () Bool)

(assert (=> b!937895 m!872731))

(declare-fun m!872733 () Bool)

(assert (=> b!937895 m!872733))

(declare-fun m!872735 () Bool)

(assert (=> b!937895 m!872735))

(declare-fun m!872737 () Bool)

(assert (=> b!937895 m!872737))

(assert (=> b!937895 m!872721))

(declare-fun m!872739 () Bool)

(assert (=> b!937895 m!872739))

(assert (=> b!937895 m!872725))

(declare-fun m!872741 () Bool)

(assert (=> b!937895 m!872741))

(declare-fun m!872743 () Bool)

(assert (=> b!937895 m!872743))

(declare-fun m!872745 () Bool)

(assert (=> b!937895 m!872745))

(declare-fun m!872747 () Bool)

(assert (=> b!937895 m!872747))

(assert (=> b!937895 m!872737))

(declare-fun m!872749 () Bool)

(assert (=> b!937895 m!872749))

(assert (=> b!937895 m!872747))

(declare-fun m!872751 () Bool)

(assert (=> b!937895 m!872751))

(declare-fun m!872753 () Bool)

(assert (=> b!937895 m!872753))

(declare-fun m!872755 () Bool)

(assert (=> b!937897 m!872755))

(declare-fun m!872757 () Bool)

(assert (=> b!937888 m!872757))

(declare-fun m!872759 () Bool)

(assert (=> bm!40783 m!872759))

(assert (=> bm!40780 m!872723))

(assert (=> d!113329 m!872555))

(declare-fun m!872761 () Bool)

(assert (=> b!937886 m!872761))

(assert (=> b!937881 m!872745))

(assert (=> b!937881 m!872745))

(declare-fun m!872763 () Bool)

(assert (=> b!937881 m!872763))

(declare-fun m!872765 () Bool)

(assert (=> bm!40778 m!872765))

(assert (=> b!937889 m!872745))

(assert (=> b!937889 m!872745))

(declare-fun m!872767 () Bool)

(assert (=> b!937889 m!872767))

(declare-fun m!872769 () Bool)

(assert (=> b!937896 m!872769))

(assert (=> b!937896 m!872569))

(declare-fun m!872771 () Bool)

(assert (=> b!937896 m!872771))

(assert (=> b!937896 m!872769))

(assert (=> b!937896 m!872745))

(declare-fun m!872773 () Bool)

(assert (=> b!937896 m!872773))

(assert (=> b!937896 m!872569))

(assert (=> b!937896 m!872745))

(declare-fun m!872775 () Bool)

(assert (=> bm!40779 m!872775))

(assert (=> b!937884 m!872745))

(assert (=> b!937884 m!872745))

(assert (=> b!937884 m!872767))

(assert (=> b!937747 d!113329))

(declare-fun d!113331 () Bool)

(declare-datatypes ((Option!489 0))(
  ( (Some!488 (v!12707 V!31977)) (None!487) )
))
(declare-fun get!14330 (Option!489) V!31977)

(declare-fun getValueByKey!483 (List!19154 (_ BitVec 64)) Option!489)

(assert (=> d!113331 (= (apply!853 lt!423241 k0!1099) (get!14330 (getValueByKey!483 (toList!6052 lt!423241) k0!1099)))))

(declare-fun bs!26302 () Bool)

(assert (= bs!26302 d!113331))

(declare-fun m!872777 () Bool)

(assert (=> bs!26302 m!872777))

(assert (=> bs!26302 m!872777))

(declare-fun m!872779 () Bool)

(assert (=> bs!26302 m!872779))

(assert (=> b!937747 d!113331))

(declare-fun d!113333 () Bool)

(declare-fun e!526690 () Bool)

(assert (=> d!113333 e!526690))

(declare-fun res!631153 () Bool)

(assert (=> d!113333 (=> (not res!631153) (not e!526690))))

(assert (=> d!113333 (= res!631153 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27629 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27628 _values!1231))))))

(declare-fun lt!423378 () Unit!31668)

(declare-fun choose!1553 (array!56460 array!56458 (_ BitVec 32) (_ BitVec 32) V!31977 V!31977 (_ BitVec 32) Int) Unit!31668)

(assert (=> d!113333 (= lt!423378 (choose!1553 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113333 (validMask!0 mask!1881)))

(assert (=> d!113333 (= (lemmaListMapRecursiveValidKeyArray!230 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!423378)))

(declare-fun b!937901 () Bool)

(assert (=> b!937901 (= e!526690 (= (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2840 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13377 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113333 res!631153) b!937901))

(declare-fun b_lambda!14167 () Bool)

(assert (=> (not b_lambda!14167) (not b!937901)))

(assert (=> b!937901 t!27448))

(declare-fun b_and!29105 () Bool)

(assert (= b_and!29103 (and (=> t!27448 result!12123) b_and!29105)))

(declare-fun m!872781 () Bool)

(assert (=> d!113333 m!872781))

(assert (=> d!113333 m!872555))

(assert (=> b!937901 m!872599))

(declare-fun m!872783 () Bool)

(assert (=> b!937901 m!872783))

(assert (=> b!937901 m!872573))

(assert (=> b!937901 m!872783))

(declare-fun m!872785 () Bool)

(assert (=> b!937901 m!872785))

(assert (=> b!937901 m!872565))

(assert (=> b!937901 m!872569))

(assert (=> b!937901 m!872565))

(assert (=> b!937901 m!872569))

(assert (=> b!937901 m!872571))

(assert (=> b!937747 d!113333))

(declare-fun d!113335 () Bool)

(declare-fun res!631161 () Bool)

(declare-fun e!526699 () Bool)

(assert (=> d!113335 (=> res!631161 e!526699)))

(assert (=> d!113335 (= res!631161 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(assert (=> d!113335 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19152) e!526699)))

(declare-fun b!937912 () Bool)

(declare-fun e!526701 () Bool)

(declare-fun call!40789 () Bool)

(assert (=> b!937912 (= e!526701 call!40789)))

(declare-fun b!937913 () Bool)

(declare-fun e!526700 () Bool)

(assert (=> b!937913 (= e!526699 e!526700)))

(declare-fun res!631162 () Bool)

(assert (=> b!937913 (=> (not res!631162) (not e!526700))))

(declare-fun e!526702 () Bool)

(assert (=> b!937913 (= res!631162 (not e!526702))))

(declare-fun res!631160 () Bool)

(assert (=> b!937913 (=> (not res!631160) (not e!526702))))

(assert (=> b!937913 (= res!631160 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!937914 () Bool)

(assert (=> b!937914 (= e!526701 call!40789)))

(declare-fun b!937915 () Bool)

(assert (=> b!937915 (= e!526700 e!526701)))

(declare-fun c!97668 () Bool)

(assert (=> b!937915 (= c!97668 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!937916 () Bool)

(declare-fun contains!5113 (List!19155 (_ BitVec 64)) Bool)

(assert (=> b!937916 (= e!526702 (contains!5113 Nil!19152 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun bm!40786 () Bool)

(assert (=> bm!40786 (= call!40789 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97668 (Cons!19151 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19152) Nil!19152)))))

(assert (= (and d!113335 (not res!631161)) b!937913))

(assert (= (and b!937913 res!631160) b!937916))

(assert (= (and b!937913 res!631162) b!937915))

(assert (= (and b!937915 c!97668) b!937912))

(assert (= (and b!937915 (not c!97668)) b!937914))

(assert (= (or b!937912 b!937914) bm!40786))

(assert (=> b!937913 m!872599))

(assert (=> b!937913 m!872599))

(assert (=> b!937913 m!872715))

(assert (=> b!937915 m!872599))

(assert (=> b!937915 m!872599))

(assert (=> b!937915 m!872715))

(assert (=> b!937916 m!872599))

(assert (=> b!937916 m!872599))

(declare-fun m!872787 () Bool)

(assert (=> b!937916 m!872787))

(assert (=> bm!40786 m!872599))

(declare-fun m!872789 () Bool)

(assert (=> bm!40786 m!872789))

(assert (=> b!937747 d!113335))

(declare-fun d!113337 () Bool)

(declare-fun e!526705 () Bool)

(assert (=> d!113337 e!526705))

(declare-fun res!631167 () Bool)

(assert (=> d!113337 (=> (not res!631167) (not e!526705))))

(declare-fun lt!423389 () ListLongMap!12073)

(assert (=> d!113337 (= res!631167 (contains!5111 lt!423389 (_1!6699 lt!423246)))))

(declare-fun lt!423387 () List!19154)

(assert (=> d!113337 (= lt!423389 (ListLongMap!12074 lt!423387))))

(declare-fun lt!423390 () Unit!31668)

(declare-fun lt!423388 () Unit!31668)

(assert (=> d!113337 (= lt!423390 lt!423388)))

(assert (=> d!113337 (= (getValueByKey!483 lt!423387 (_1!6699 lt!423246)) (Some!488 (_2!6699 lt!423246)))))

(declare-fun lemmaContainsTupThenGetReturnValue!259 (List!19154 (_ BitVec 64) V!31977) Unit!31668)

(assert (=> d!113337 (= lt!423388 (lemmaContainsTupThenGetReturnValue!259 lt!423387 (_1!6699 lt!423246) (_2!6699 lt!423246)))))

(declare-fun insertStrictlySorted!316 (List!19154 (_ BitVec 64) V!31977) List!19154)

(assert (=> d!113337 (= lt!423387 (insertStrictlySorted!316 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6699 lt!423246) (_2!6699 lt!423246)))))

(assert (=> d!113337 (= (+!2840 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423246) lt!423389)))

(declare-fun b!937921 () Bool)

(declare-fun res!631168 () Bool)

(assert (=> b!937921 (=> (not res!631168) (not e!526705))))

(assert (=> b!937921 (= res!631168 (= (getValueByKey!483 (toList!6052 lt!423389) (_1!6699 lt!423246)) (Some!488 (_2!6699 lt!423246))))))

(declare-fun b!937922 () Bool)

(declare-fun contains!5114 (List!19154 tuple2!13376) Bool)

(assert (=> b!937922 (= e!526705 (contains!5114 (toList!6052 lt!423389) lt!423246))))

(assert (= (and d!113337 res!631167) b!937921))

(assert (= (and b!937921 res!631168) b!937922))

(declare-fun m!872791 () Bool)

(assert (=> d!113337 m!872791))

(declare-fun m!872793 () Bool)

(assert (=> d!113337 m!872793))

(declare-fun m!872795 () Bool)

(assert (=> d!113337 m!872795))

(declare-fun m!872797 () Bool)

(assert (=> d!113337 m!872797))

(declare-fun m!872799 () Bool)

(assert (=> b!937921 m!872799))

(declare-fun m!872801 () Bool)

(assert (=> b!937922 m!872801))

(assert (=> b!937747 d!113337))

(declare-fun d!113339 () Bool)

(assert (=> d!113339 (= (apply!853 (+!2840 lt!423238 (tuple2!13377 lt!423240 lt!423248)) k0!1099) (apply!853 lt!423238 k0!1099))))

(declare-fun lt!423393 () Unit!31668)

(declare-fun choose!1554 (ListLongMap!12073 (_ BitVec 64) V!31977 (_ BitVec 64)) Unit!31668)

(assert (=> d!113339 (= lt!423393 (choose!1554 lt!423238 lt!423240 lt!423248 k0!1099))))

(declare-fun e!526708 () Bool)

(assert (=> d!113339 e!526708))

(declare-fun res!631171 () Bool)

(assert (=> d!113339 (=> (not res!631171) (not e!526708))))

(assert (=> d!113339 (= res!631171 (contains!5111 lt!423238 k0!1099))))

(assert (=> d!113339 (= (addApplyDifferent!439 lt!423238 lt!423240 lt!423248 k0!1099) lt!423393)))

(declare-fun b!937926 () Bool)

(assert (=> b!937926 (= e!526708 (not (= k0!1099 lt!423240)))))

(assert (= (and d!113339 res!631171) b!937926))

(declare-fun m!872803 () Bool)

(assert (=> d!113339 m!872803))

(declare-fun m!872805 () Bool)

(assert (=> d!113339 m!872805))

(declare-fun m!872807 () Bool)

(assert (=> d!113339 m!872807))

(assert (=> d!113339 m!872805))

(assert (=> d!113339 m!872551))

(assert (=> d!113339 m!872603))

(assert (=> b!937747 d!113339))

(declare-fun d!113341 () Bool)

(assert (=> d!113341 (contains!5111 (+!2840 lt!423238 (tuple2!13377 lt!423240 lt!423248)) k0!1099)))

(declare-fun lt!423396 () Unit!31668)

(declare-fun choose!1555 (ListLongMap!12073 (_ BitVec 64) V!31977 (_ BitVec 64)) Unit!31668)

(assert (=> d!113341 (= lt!423396 (choose!1555 lt!423238 lt!423240 lt!423248 k0!1099))))

(assert (=> d!113341 (contains!5111 lt!423238 k0!1099)))

(assert (=> d!113341 (= (addStillContains!559 lt!423238 lt!423240 lt!423248 k0!1099) lt!423396)))

(declare-fun bs!26303 () Bool)

(assert (= bs!26303 d!113341))

(assert (=> bs!26303 m!872805))

(assert (=> bs!26303 m!872805))

(declare-fun m!872809 () Bool)

(assert (=> bs!26303 m!872809))

(declare-fun m!872811 () Bool)

(assert (=> bs!26303 m!872811))

(assert (=> bs!26303 m!872603))

(assert (=> b!937747 d!113341))

(declare-fun d!113343 () Bool)

(declare-fun e!526711 () Bool)

(assert (=> d!113343 e!526711))

(declare-fun c!97671 () Bool)

(assert (=> d!113343 (= c!97671 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423399 () Unit!31668)

(declare-fun choose!1556 (array!56460 array!56458 (_ BitVec 32) (_ BitVec 32) V!31977 V!31977 (_ BitVec 64) (_ BitVec 32) Int) Unit!31668)

(assert (=> d!113343 (= lt!423399 (choose!1556 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!113343 (validMask!0 mask!1881)))

(assert (=> d!113343 (= (lemmaListMapContainsThenArrayContainsFrom!312 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!423399)))

(declare-fun b!937932 () Bool)

(assert (=> b!937932 (= e!526711 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!937933 () Bool)

(assert (=> b!937933 (= e!526711 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113343 c!97671) b!937932))

(assert (= (and d!113343 (not c!97671)) b!937933))

(declare-fun m!872813 () Bool)

(assert (=> d!113343 m!872813))

(assert (=> d!113343 m!872555))

(assert (=> b!937932 m!872561))

(assert (=> b!937747 d!113343))

(declare-fun d!113345 () Bool)

(assert (=> d!113345 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27629 _keys!1487)) (not (= (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) k0!1099)))))

(declare-fun lt!423402 () Unit!31668)

(declare-fun choose!21 (array!56460 (_ BitVec 64) (_ BitVec 32) List!19155) Unit!31668)

(assert (=> d!113345 (= lt!423402 (choose!21 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19152))))

(assert (=> d!113345 (bvslt (size!27629 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113345 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19152) lt!423402)))

(declare-fun bs!26304 () Bool)

(assert (= bs!26304 d!113345))

(assert (=> bs!26304 m!872599))

(declare-fun m!872815 () Bool)

(assert (=> bs!26304 m!872815))

(assert (=> b!937747 d!113345))

(declare-fun d!113347 () Bool)

(declare-fun e!526712 () Bool)

(assert (=> d!113347 e!526712))

(declare-fun res!631172 () Bool)

(assert (=> d!113347 (=> (not res!631172) (not e!526712))))

(declare-fun lt!423405 () ListLongMap!12073)

(assert (=> d!113347 (= res!631172 (contains!5111 lt!423405 (_1!6699 lt!423246)))))

(declare-fun lt!423403 () List!19154)

(assert (=> d!113347 (= lt!423405 (ListLongMap!12074 lt!423403))))

(declare-fun lt!423406 () Unit!31668)

(declare-fun lt!423404 () Unit!31668)

(assert (=> d!113347 (= lt!423406 lt!423404)))

(assert (=> d!113347 (= (getValueByKey!483 lt!423403 (_1!6699 lt!423246)) (Some!488 (_2!6699 lt!423246)))))

(assert (=> d!113347 (= lt!423404 (lemmaContainsTupThenGetReturnValue!259 lt!423403 (_1!6699 lt!423246) (_2!6699 lt!423246)))))

(assert (=> d!113347 (= lt!423403 (insertStrictlySorted!316 (toList!6052 lt!423238) (_1!6699 lt!423246) (_2!6699 lt!423246)))))

(assert (=> d!113347 (= (+!2840 lt!423238 lt!423246) lt!423405)))

(declare-fun b!937934 () Bool)

(declare-fun res!631173 () Bool)

(assert (=> b!937934 (=> (not res!631173) (not e!526712))))

(assert (=> b!937934 (= res!631173 (= (getValueByKey!483 (toList!6052 lt!423405) (_1!6699 lt!423246)) (Some!488 (_2!6699 lt!423246))))))

(declare-fun b!937935 () Bool)

(assert (=> b!937935 (= e!526712 (contains!5114 (toList!6052 lt!423405) lt!423246))))

(assert (= (and d!113347 res!631172) b!937934))

(assert (= (and b!937934 res!631173) b!937935))

(declare-fun m!872817 () Bool)

(assert (=> d!113347 m!872817))

(declare-fun m!872819 () Bool)

(assert (=> d!113347 m!872819))

(declare-fun m!872821 () Bool)

(assert (=> d!113347 m!872821))

(declare-fun m!872823 () Bool)

(assert (=> d!113347 m!872823))

(declare-fun m!872825 () Bool)

(assert (=> b!937934 m!872825))

(declare-fun m!872827 () Bool)

(assert (=> b!937935 m!872827))

(assert (=> b!937747 d!113347))

(declare-fun d!113349 () Bool)

(declare-fun e!526717 () Bool)

(assert (=> d!113349 e!526717))

(declare-fun res!631176 () Bool)

(assert (=> d!113349 (=> res!631176 e!526717)))

(declare-fun lt!423415 () Bool)

(assert (=> d!113349 (= res!631176 (not lt!423415))))

(declare-fun lt!423418 () Bool)

(assert (=> d!113349 (= lt!423415 lt!423418)))

(declare-fun lt!423417 () Unit!31668)

(declare-fun e!526718 () Unit!31668)

(assert (=> d!113349 (= lt!423417 e!526718)))

(declare-fun c!97674 () Bool)

(assert (=> d!113349 (= c!97674 lt!423418)))

(declare-fun containsKey!450 (List!19154 (_ BitVec 64)) Bool)

(assert (=> d!113349 (= lt!423418 (containsKey!450 (toList!6052 lt!423241) k0!1099))))

(assert (=> d!113349 (= (contains!5111 lt!423241 k0!1099) lt!423415)))

(declare-fun b!937942 () Bool)

(declare-fun lt!423416 () Unit!31668)

(assert (=> b!937942 (= e!526718 lt!423416)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!346 (List!19154 (_ BitVec 64)) Unit!31668)

(assert (=> b!937942 (= lt!423416 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 lt!423241) k0!1099))))

(declare-fun isDefined!355 (Option!489) Bool)

(assert (=> b!937942 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423241) k0!1099))))

(declare-fun b!937943 () Bool)

(declare-fun Unit!31677 () Unit!31668)

(assert (=> b!937943 (= e!526718 Unit!31677)))

(declare-fun b!937944 () Bool)

(assert (=> b!937944 (= e!526717 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423241) k0!1099)))))

(assert (= (and d!113349 c!97674) b!937942))

(assert (= (and d!113349 (not c!97674)) b!937943))

(assert (= (and d!113349 (not res!631176)) b!937944))

(declare-fun m!872829 () Bool)

(assert (=> d!113349 m!872829))

(declare-fun m!872831 () Bool)

(assert (=> b!937942 m!872831))

(assert (=> b!937942 m!872777))

(assert (=> b!937942 m!872777))

(declare-fun m!872833 () Bool)

(assert (=> b!937942 m!872833))

(assert (=> b!937944 m!872777))

(assert (=> b!937944 m!872777))

(assert (=> b!937944 m!872833))

(assert (=> b!937747 d!113349))

(declare-fun d!113351 () Bool)

(declare-fun c!97677 () Bool)

(assert (=> d!113351 (= c!97677 ((_ is ValueCellFull!9648) (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!526721 () V!31977)

(assert (=> d!113351 (= (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!526721)))

(declare-fun b!937949 () Bool)

(declare-fun get!14331 (ValueCell!9648 V!31977) V!31977)

(assert (=> b!937949 (= e!526721 (get!14331 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!937950 () Bool)

(declare-fun get!14332 (ValueCell!9648 V!31977) V!31977)

(assert (=> b!937950 (= e!526721 (get!14332 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113351 c!97677) b!937949))

(assert (= (and d!113351 (not c!97677)) b!937950))

(assert (=> b!937949 m!872565))

(assert (=> b!937949 m!872569))

(declare-fun m!872835 () Bool)

(assert (=> b!937949 m!872835))

(assert (=> b!937950 m!872565))

(assert (=> b!937950 m!872569))

(declare-fun m!872837 () Bool)

(assert (=> b!937950 m!872837))

(assert (=> b!937747 d!113351))

(declare-fun d!113353 () Bool)

(assert (=> d!113353 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19152)))

(declare-fun lt!423421 () Unit!31668)

(declare-fun choose!39 (array!56460 (_ BitVec 32) (_ BitVec 32)) Unit!31668)

(assert (=> d!113353 (= lt!423421 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!113353 (bvslt (size!27629 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113353 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!423421)))

(declare-fun bs!26305 () Bool)

(assert (= bs!26305 d!113353))

(assert (=> bs!26305 m!872579))

(declare-fun m!872839 () Bool)

(assert (=> bs!26305 m!872839))

(assert (=> b!937747 d!113353))

(declare-fun d!113355 () Bool)

(assert (=> d!113355 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79702 d!113355))

(declare-fun d!113357 () Bool)

(assert (=> d!113357 (= (array_inv!21134 _values!1231) (bvsge (size!27628 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79702 d!113357))

(declare-fun d!113359 () Bool)

(assert (=> d!113359 (= (array_inv!21135 _keys!1487) (bvsge (size!27629 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79702 d!113359))

(declare-fun d!113361 () Bool)

(declare-fun res!631178 () Bool)

(declare-fun e!526722 () Bool)

(assert (=> d!113361 (=> res!631178 e!526722)))

(assert (=> d!113361 (= res!631178 (bvsge #b00000000000000000000000000000000 (size!27629 _keys!1487)))))

(assert (=> d!113361 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19152) e!526722)))

(declare-fun b!937951 () Bool)

(declare-fun e!526724 () Bool)

(declare-fun call!40790 () Bool)

(assert (=> b!937951 (= e!526724 call!40790)))

(declare-fun b!937952 () Bool)

(declare-fun e!526723 () Bool)

(assert (=> b!937952 (= e!526722 e!526723)))

(declare-fun res!631179 () Bool)

(assert (=> b!937952 (=> (not res!631179) (not e!526723))))

(declare-fun e!526725 () Bool)

(assert (=> b!937952 (= res!631179 (not e!526725))))

(declare-fun res!631177 () Bool)

(assert (=> b!937952 (=> (not res!631177) (not e!526725))))

(assert (=> b!937952 (= res!631177 (validKeyInArray!0 (select (arr!27170 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!937953 () Bool)

(assert (=> b!937953 (= e!526724 call!40790)))

(declare-fun b!937954 () Bool)

(assert (=> b!937954 (= e!526723 e!526724)))

(declare-fun c!97678 () Bool)

(assert (=> b!937954 (= c!97678 (validKeyInArray!0 (select (arr!27170 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!937955 () Bool)

(assert (=> b!937955 (= e!526725 (contains!5113 Nil!19152 (select (arr!27170 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40787 () Bool)

(assert (=> bm!40787 (= call!40790 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97678 (Cons!19151 (select (arr!27170 _keys!1487) #b00000000000000000000000000000000) Nil!19152) Nil!19152)))))

(assert (= (and d!113361 (not res!631178)) b!937952))

(assert (= (and b!937952 res!631177) b!937955))

(assert (= (and b!937952 res!631179) b!937954))

(assert (= (and b!937954 c!97678) b!937951))

(assert (= (and b!937954 (not c!97678)) b!937953))

(assert (= (or b!937951 b!937953) bm!40787))

(declare-fun m!872841 () Bool)

(assert (=> b!937952 m!872841))

(assert (=> b!937952 m!872841))

(declare-fun m!872843 () Bool)

(assert (=> b!937952 m!872843))

(assert (=> b!937954 m!872841))

(assert (=> b!937954 m!872841))

(assert (=> b!937954 m!872843))

(assert (=> b!937955 m!872841))

(assert (=> b!937955 m!872841))

(declare-fun m!872845 () Bool)

(assert (=> b!937955 m!872845))

(assert (=> bm!40787 m!872841))

(declare-fun m!872847 () Bool)

(assert (=> bm!40787 m!872847))

(assert (=> b!937753 d!113361))

(declare-fun bm!40790 () Bool)

(declare-fun call!40793 () Bool)

(assert (=> bm!40790 (= call!40793 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!937964 () Bool)

(declare-fun e!526732 () Bool)

(declare-fun e!526733 () Bool)

(assert (=> b!937964 (= e!526732 e!526733)))

(declare-fun c!97681 () Bool)

(assert (=> b!937964 (= c!97681 (validKeyInArray!0 (select (arr!27170 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!937965 () Bool)

(declare-fun e!526734 () Bool)

(assert (=> b!937965 (= e!526734 call!40793)))

(declare-fun b!937966 () Bool)

(assert (=> b!937966 (= e!526733 call!40793)))

(declare-fun b!937967 () Bool)

(assert (=> b!937967 (= e!526733 e!526734)))

(declare-fun lt!423429 () (_ BitVec 64))

(assert (=> b!937967 (= lt!423429 (select (arr!27170 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!423428 () Unit!31668)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56460 (_ BitVec 64) (_ BitVec 32)) Unit!31668)

(assert (=> b!937967 (= lt!423428 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!423429 #b00000000000000000000000000000000))))

(assert (=> b!937967 (arrayContainsKey!0 _keys!1487 lt!423429 #b00000000000000000000000000000000)))

(declare-fun lt!423430 () Unit!31668)

(assert (=> b!937967 (= lt!423430 lt!423428)))

(declare-fun res!631184 () Bool)

(declare-datatypes ((SeekEntryResult!8981 0))(
  ( (MissingZero!8981 (index!38295 (_ BitVec 32))) (Found!8981 (index!38296 (_ BitVec 32))) (Intermediate!8981 (undefined!9793 Bool) (index!38297 (_ BitVec 32)) (x!80432 (_ BitVec 32))) (Undefined!8981) (MissingVacant!8981 (index!38298 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56460 (_ BitVec 32)) SeekEntryResult!8981)

(assert (=> b!937967 (= res!631184 (= (seekEntryOrOpen!0 (select (arr!27170 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8981 #b00000000000000000000000000000000)))))

(assert (=> b!937967 (=> (not res!631184) (not e!526734))))

(declare-fun d!113363 () Bool)

(declare-fun res!631185 () Bool)

(assert (=> d!113363 (=> res!631185 e!526732)))

(assert (=> d!113363 (= res!631185 (bvsge #b00000000000000000000000000000000 (size!27629 _keys!1487)))))

(assert (=> d!113363 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!526732)))

(assert (= (and d!113363 (not res!631185)) b!937964))

(assert (= (and b!937964 c!97681) b!937967))

(assert (= (and b!937964 (not c!97681)) b!937966))

(assert (= (and b!937967 res!631184) b!937965))

(assert (= (or b!937965 b!937966) bm!40790))

(declare-fun m!872849 () Bool)

(assert (=> bm!40790 m!872849))

(assert (=> b!937964 m!872841))

(assert (=> b!937964 m!872841))

(assert (=> b!937964 m!872843))

(assert (=> b!937967 m!872841))

(declare-fun m!872851 () Bool)

(assert (=> b!937967 m!872851))

(declare-fun m!872853 () Bool)

(assert (=> b!937967 m!872853))

(assert (=> b!937967 m!872841))

(declare-fun m!872855 () Bool)

(assert (=> b!937967 m!872855))

(assert (=> b!937759 d!113363))

(declare-fun d!113365 () Bool)

(declare-fun res!631190 () Bool)

(declare-fun e!526739 () Bool)

(assert (=> d!113365 (=> res!631190 e!526739)))

(assert (=> d!113365 (= res!631190 (= (select (arr!27170 _keys!1487) from!1844) k0!1099))))

(assert (=> d!113365 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!526739)))

(declare-fun b!937972 () Bool)

(declare-fun e!526740 () Bool)

(assert (=> b!937972 (= e!526739 e!526740)))

(declare-fun res!631191 () Bool)

(assert (=> b!937972 (=> (not res!631191) (not e!526740))))

(assert (=> b!937972 (= res!631191 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(declare-fun b!937973 () Bool)

(assert (=> b!937973 (= e!526740 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!113365 (not res!631190)) b!937972))

(assert (= (and b!937972 res!631191) b!937973))

(declare-fun m!872857 () Bool)

(assert (=> d!113365 m!872857))

(declare-fun m!872859 () Bool)

(assert (=> b!937973 m!872859))

(assert (=> b!937750 d!113365))

(declare-fun d!113367 () Bool)

(declare-fun e!526741 () Bool)

(assert (=> d!113367 e!526741))

(declare-fun res!631192 () Bool)

(assert (=> d!113367 (=> res!631192 e!526741)))

(declare-fun lt!423431 () Bool)

(assert (=> d!113367 (= res!631192 (not lt!423431))))

(declare-fun lt!423434 () Bool)

(assert (=> d!113367 (= lt!423431 lt!423434)))

(declare-fun lt!423433 () Unit!31668)

(declare-fun e!526742 () Unit!31668)

(assert (=> d!113367 (= lt!423433 e!526742)))

(declare-fun c!97682 () Bool)

(assert (=> d!113367 (= c!97682 lt!423434)))

(assert (=> d!113367 (= lt!423434 (containsKey!450 (toList!6052 lt!423238) k0!1099))))

(assert (=> d!113367 (= (contains!5111 lt!423238 k0!1099) lt!423431)))

(declare-fun b!937974 () Bool)

(declare-fun lt!423432 () Unit!31668)

(assert (=> b!937974 (= e!526742 lt!423432)))

(assert (=> b!937974 (= lt!423432 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 lt!423238) k0!1099))))

(assert (=> b!937974 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423238) k0!1099))))

(declare-fun b!937975 () Bool)

(declare-fun Unit!31678 () Unit!31668)

(assert (=> b!937975 (= e!526742 Unit!31678)))

(declare-fun b!937976 () Bool)

(assert (=> b!937976 (= e!526741 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423238) k0!1099)))))

(assert (= (and d!113367 c!97682) b!937974))

(assert (= (and d!113367 (not c!97682)) b!937975))

(assert (= (and d!113367 (not res!631192)) b!937976))

(declare-fun m!872861 () Bool)

(assert (=> d!113367 m!872861))

(declare-fun m!872863 () Bool)

(assert (=> b!937974 m!872863))

(declare-fun m!872865 () Bool)

(assert (=> b!937974 m!872865))

(assert (=> b!937974 m!872865))

(declare-fun m!872867 () Bool)

(assert (=> b!937974 m!872867))

(assert (=> b!937976 m!872865))

(assert (=> b!937976 m!872865))

(assert (=> b!937976 m!872867))

(assert (=> b!937755 d!113367))

(declare-fun b!937977 () Bool)

(declare-fun e!526751 () Bool)

(declare-fun call!40794 () Bool)

(assert (=> b!937977 (= e!526751 (not call!40794))))

(declare-fun b!937978 () Bool)

(declare-fun e!526743 () ListLongMap!12073)

(declare-fun call!40798 () ListLongMap!12073)

(assert (=> b!937978 (= e!526743 call!40798)))

(declare-fun b!937979 () Bool)

(declare-fun e!526746 () ListLongMap!12073)

(declare-fun call!40795 () ListLongMap!12073)

(assert (=> b!937979 (= e!526746 call!40795)))

(declare-fun b!937980 () Bool)

(declare-fun e!526755 () Bool)

(declare-fun e!526749 () Bool)

(assert (=> b!937980 (= e!526755 e!526749)))

(declare-fun res!631197 () Bool)

(assert (=> b!937980 (=> (not res!631197) (not e!526749))))

(declare-fun lt!423456 () ListLongMap!12073)

(assert (=> b!937980 (= res!631197 (contains!5111 lt!423456 (select (arr!27170 _keys!1487) from!1844)))))

(assert (=> b!937980 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27629 _keys!1487)))))

(declare-fun b!937981 () Bool)

(declare-fun e!526748 () Bool)

(declare-fun e!526744 () Bool)

(assert (=> b!937981 (= e!526748 e!526744)))

(declare-fun res!631193 () Bool)

(declare-fun call!40799 () Bool)

(assert (=> b!937981 (= res!631193 call!40799)))

(assert (=> b!937981 (=> (not res!631193) (not e!526744))))

(declare-fun b!937982 () Bool)

(declare-fun e!526750 () Bool)

(assert (=> b!937982 (= e!526751 e!526750)))

(declare-fun res!631196 () Bool)

(assert (=> b!937982 (= res!631196 call!40794)))

(assert (=> b!937982 (=> (not res!631196) (not e!526750))))

(declare-fun bm!40791 () Bool)

(declare-fun call!40800 () ListLongMap!12073)

(assert (=> bm!40791 (= call!40798 call!40800)))

(declare-fun b!937984 () Bool)

(assert (=> b!937984 (= e!526748 (not call!40799))))

(declare-fun call!40796 () ListLongMap!12073)

(declare-fun c!97688 () Bool)

(declare-fun bm!40792 () Bool)

(declare-fun call!40797 () ListLongMap!12073)

(declare-fun c!97685 () Bool)

(assert (=> bm!40792 (= call!40796 (+!2840 (ite c!97688 call!40797 (ite c!97685 call!40800 call!40798)) (ite (or c!97688 c!97685) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun bm!40793 () Bool)

(assert (=> bm!40793 (= call!40799 (contains!5111 lt!423456 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40794 () Bool)

(assert (=> bm!40794 (= call!40797 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937985 () Bool)

(assert (=> b!937985 (= e!526750 (= (apply!853 lt!423456 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!937986 () Bool)

(declare-fun e!526754 () ListLongMap!12073)

(assert (=> b!937986 (= e!526754 e!526746)))

(assert (=> b!937986 (= c!97685 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!937987 () Bool)

(assert (=> b!937987 (= e!526744 (= (apply!853 lt!423456 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!937988 () Bool)

(declare-fun e!526745 () Bool)

(assert (=> b!937988 (= e!526745 (validKeyInArray!0 (select (arr!27170 _keys!1487) from!1844)))))

(declare-fun b!937989 () Bool)

(declare-fun e!526753 () Bool)

(assert (=> b!937989 (= e!526753 e!526748)))

(declare-fun c!97686 () Bool)

(assert (=> b!937989 (= c!97686 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!937990 () Bool)

(declare-fun e!526747 () Unit!31668)

(declare-fun Unit!31679 () Unit!31668)

(assert (=> b!937990 (= e!526747 Unit!31679)))

(declare-fun b!937991 () Bool)

(assert (=> b!937991 (= e!526743 call!40795)))

(declare-fun bm!40795 () Bool)

(assert (=> bm!40795 (= call!40800 call!40797)))

(declare-fun b!937992 () Bool)

(declare-fun res!631200 () Bool)

(assert (=> b!937992 (=> (not res!631200) (not e!526753))))

(assert (=> b!937992 (= res!631200 e!526755)))

(declare-fun res!631201 () Bool)

(assert (=> b!937992 (=> res!631201 e!526755)))

(assert (=> b!937992 (= res!631201 (not e!526745))))

(declare-fun res!631198 () Bool)

(assert (=> b!937992 (=> (not res!631198) (not e!526745))))

(assert (=> b!937992 (= res!631198 (bvslt from!1844 (size!27629 _keys!1487)))))

(declare-fun bm!40796 () Bool)

(assert (=> bm!40796 (= call!40795 call!40796)))

(declare-fun b!937993 () Bool)

(declare-fun res!631194 () Bool)

(assert (=> b!937993 (=> (not res!631194) (not e!526753))))

(assert (=> b!937993 (= res!631194 e!526751)))

(declare-fun c!97684 () Bool)

(assert (=> b!937993 (= c!97684 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!937994 () Bool)

(declare-fun lt!423444 () Unit!31668)

(assert (=> b!937994 (= e!526747 lt!423444)))

(declare-fun lt!423439 () ListLongMap!12073)

(assert (=> b!937994 (= lt!423439 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423448 () (_ BitVec 64))

(assert (=> b!937994 (= lt!423448 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423449 () (_ BitVec 64))

(assert (=> b!937994 (= lt!423449 (select (arr!27170 _keys!1487) from!1844))))

(declare-fun lt!423450 () Unit!31668)

(assert (=> b!937994 (= lt!423450 (addStillContains!559 lt!423439 lt!423448 zeroValue!1173 lt!423449))))

(assert (=> b!937994 (contains!5111 (+!2840 lt!423439 (tuple2!13377 lt!423448 zeroValue!1173)) lt!423449)))

(declare-fun lt!423455 () Unit!31668)

(assert (=> b!937994 (= lt!423455 lt!423450)))

(declare-fun lt!423451 () ListLongMap!12073)

(assert (=> b!937994 (= lt!423451 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423452 () (_ BitVec 64))

(assert (=> b!937994 (= lt!423452 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423453 () (_ BitVec 64))

(assert (=> b!937994 (= lt!423453 (select (arr!27170 _keys!1487) from!1844))))

(declare-fun lt!423447 () Unit!31668)

(assert (=> b!937994 (= lt!423447 (addApplyDifferent!439 lt!423451 lt!423452 minValue!1173 lt!423453))))

(assert (=> b!937994 (= (apply!853 (+!2840 lt!423451 (tuple2!13377 lt!423452 minValue!1173)) lt!423453) (apply!853 lt!423451 lt!423453))))

(declare-fun lt!423441 () Unit!31668)

(assert (=> b!937994 (= lt!423441 lt!423447)))

(declare-fun lt!423440 () ListLongMap!12073)

(assert (=> b!937994 (= lt!423440 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423436 () (_ BitVec 64))

(assert (=> b!937994 (= lt!423436 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423443 () (_ BitVec 64))

(assert (=> b!937994 (= lt!423443 (select (arr!27170 _keys!1487) from!1844))))

(declare-fun lt!423446 () Unit!31668)

(assert (=> b!937994 (= lt!423446 (addApplyDifferent!439 lt!423440 lt!423436 zeroValue!1173 lt!423443))))

(assert (=> b!937994 (= (apply!853 (+!2840 lt!423440 (tuple2!13377 lt!423436 zeroValue!1173)) lt!423443) (apply!853 lt!423440 lt!423443))))

(declare-fun lt!423435 () Unit!31668)

(assert (=> b!937994 (= lt!423435 lt!423446)))

(declare-fun lt!423442 () ListLongMap!12073)

(assert (=> b!937994 (= lt!423442 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423445 () (_ BitVec 64))

(assert (=> b!937994 (= lt!423445 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423454 () (_ BitVec 64))

(assert (=> b!937994 (= lt!423454 (select (arr!27170 _keys!1487) from!1844))))

(assert (=> b!937994 (= lt!423444 (addApplyDifferent!439 lt!423442 lt!423445 minValue!1173 lt!423454))))

(assert (=> b!937994 (= (apply!853 (+!2840 lt!423442 (tuple2!13377 lt!423445 minValue!1173)) lt!423454) (apply!853 lt!423442 lt!423454))))

(declare-fun d!113369 () Bool)

(assert (=> d!113369 e!526753))

(declare-fun res!631199 () Bool)

(assert (=> d!113369 (=> (not res!631199) (not e!526753))))

(assert (=> d!113369 (= res!631199 (or (bvsge from!1844 (size!27629 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27629 _keys!1487)))))))

(declare-fun lt!423438 () ListLongMap!12073)

(assert (=> d!113369 (= lt!423456 lt!423438)))

(declare-fun lt!423437 () Unit!31668)

(assert (=> d!113369 (= lt!423437 e!526747)))

(declare-fun c!97687 () Bool)

(declare-fun e!526752 () Bool)

(assert (=> d!113369 (= c!97687 e!526752)))

(declare-fun res!631195 () Bool)

(assert (=> d!113369 (=> (not res!631195) (not e!526752))))

(assert (=> d!113369 (= res!631195 (bvslt from!1844 (size!27629 _keys!1487)))))

(assert (=> d!113369 (= lt!423438 e!526754)))

(assert (=> d!113369 (= c!97688 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113369 (validMask!0 mask!1881)))

(assert (=> d!113369 (= (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!423456)))

(declare-fun b!937983 () Bool)

(assert (=> b!937983 (= e!526752 (validKeyInArray!0 (select (arr!27170 _keys!1487) from!1844)))))

(declare-fun b!937995 () Bool)

(assert (=> b!937995 (= e!526749 (= (apply!853 lt!423456 (select (arr!27170 _keys!1487) from!1844)) (get!14328 (select (arr!27169 _values!1231) from!1844) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937995 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27628 _values!1231)))))

(assert (=> b!937995 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27629 _keys!1487)))))

(declare-fun b!937996 () Bool)

(assert (=> b!937996 (= e!526754 (+!2840 call!40796 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun bm!40797 () Bool)

(assert (=> bm!40797 (= call!40794 (contains!5111 lt!423456 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!937997 () Bool)

(declare-fun c!97683 () Bool)

(assert (=> b!937997 (= c!97683 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!937997 (= e!526746 e!526743)))

(assert (= (and d!113369 c!97688) b!937996))

(assert (= (and d!113369 (not c!97688)) b!937986))

(assert (= (and b!937986 c!97685) b!937979))

(assert (= (and b!937986 (not c!97685)) b!937997))

(assert (= (and b!937997 c!97683) b!937991))

(assert (= (and b!937997 (not c!97683)) b!937978))

(assert (= (or b!937991 b!937978) bm!40791))

(assert (= (or b!937979 bm!40791) bm!40795))

(assert (= (or b!937979 b!937991) bm!40796))

(assert (= (or b!937996 bm!40795) bm!40794))

(assert (= (or b!937996 bm!40796) bm!40792))

(assert (= (and d!113369 res!631195) b!937983))

(assert (= (and d!113369 c!97687) b!937994))

(assert (= (and d!113369 (not c!97687)) b!937990))

(assert (= (and d!113369 res!631199) b!937992))

(assert (= (and b!937992 res!631198) b!937988))

(assert (= (and b!937992 (not res!631201)) b!937980))

(assert (= (and b!937980 res!631197) b!937995))

(assert (= (and b!937992 res!631200) b!937993))

(assert (= (and b!937993 c!97684) b!937982))

(assert (= (and b!937993 (not c!97684)) b!937977))

(assert (= (and b!937982 res!631196) b!937985))

(assert (= (or b!937982 b!937977) bm!40797))

(assert (= (and b!937993 res!631194) b!937989))

(assert (= (and b!937989 c!97686) b!937981))

(assert (= (and b!937989 (not c!97686)) b!937984))

(assert (= (and b!937981 res!631193) b!937987))

(assert (= (or b!937981 b!937984) bm!40793))

(declare-fun b_lambda!14169 () Bool)

(assert (=> (not b_lambda!14169) (not b!937995)))

(assert (=> b!937995 t!27448))

(declare-fun b_and!29107 () Bool)

(assert (= b_and!29105 (and (=> t!27448 result!12123) b_and!29107)))

(declare-fun m!872869 () Bool)

(assert (=> b!937994 m!872869))

(declare-fun m!872871 () Bool)

(assert (=> b!937994 m!872871))

(declare-fun m!872873 () Bool)

(assert (=> b!937994 m!872873))

(declare-fun m!872875 () Bool)

(assert (=> b!937994 m!872875))

(declare-fun m!872877 () Bool)

(assert (=> b!937994 m!872877))

(declare-fun m!872879 () Bool)

(assert (=> b!937994 m!872879))

(declare-fun m!872881 () Bool)

(assert (=> b!937994 m!872881))

(declare-fun m!872883 () Bool)

(assert (=> b!937994 m!872883))

(declare-fun m!872885 () Bool)

(assert (=> b!937994 m!872885))

(assert (=> b!937994 m!872869))

(declare-fun m!872887 () Bool)

(assert (=> b!937994 m!872887))

(assert (=> b!937994 m!872873))

(declare-fun m!872889 () Bool)

(assert (=> b!937994 m!872889))

(declare-fun m!872891 () Bool)

(assert (=> b!937994 m!872891))

(assert (=> b!937994 m!872857))

(declare-fun m!872893 () Bool)

(assert (=> b!937994 m!872893))

(assert (=> b!937994 m!872885))

(declare-fun m!872895 () Bool)

(assert (=> b!937994 m!872895))

(assert (=> b!937994 m!872893))

(declare-fun m!872897 () Bool)

(assert (=> b!937994 m!872897))

(declare-fun m!872899 () Bool)

(assert (=> b!937994 m!872899))

(declare-fun m!872901 () Bool)

(assert (=> b!937996 m!872901))

(declare-fun m!872903 () Bool)

(assert (=> b!937987 m!872903))

(declare-fun m!872905 () Bool)

(assert (=> bm!40797 m!872905))

(assert (=> bm!40794 m!872871))

(assert (=> d!113369 m!872555))

(declare-fun m!872907 () Bool)

(assert (=> b!937985 m!872907))

(assert (=> b!937980 m!872857))

(assert (=> b!937980 m!872857))

(declare-fun m!872909 () Bool)

(assert (=> b!937980 m!872909))

(declare-fun m!872911 () Bool)

(assert (=> bm!40792 m!872911))

(assert (=> b!937988 m!872857))

(assert (=> b!937988 m!872857))

(declare-fun m!872913 () Bool)

(assert (=> b!937988 m!872913))

(declare-fun m!872915 () Bool)

(assert (=> b!937995 m!872915))

(assert (=> b!937995 m!872569))

(declare-fun m!872917 () Bool)

(assert (=> b!937995 m!872917))

(assert (=> b!937995 m!872915))

(assert (=> b!937995 m!872857))

(declare-fun m!872919 () Bool)

(assert (=> b!937995 m!872919))

(assert (=> b!937995 m!872569))

(assert (=> b!937995 m!872857))

(declare-fun m!872921 () Bool)

(assert (=> bm!40793 m!872921))

(assert (=> b!937983 m!872857))

(assert (=> b!937983 m!872857))

(assert (=> b!937983 m!872913))

(assert (=> b!937755 d!113369))

(declare-fun d!113371 () Bool)

(assert (=> d!113371 (= (apply!853 lt!423238 k0!1099) (get!14330 (getValueByKey!483 (toList!6052 lt!423238) k0!1099)))))

(declare-fun bs!26306 () Bool)

(assert (= bs!26306 d!113371))

(assert (=> bs!26306 m!872865))

(assert (=> bs!26306 m!872865))

(declare-fun m!872923 () Bool)

(assert (=> bs!26306 m!872923))

(assert (=> b!937756 d!113371))

(declare-fun d!113373 () Bool)

(assert (=> d!113373 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937746 d!113373))

(declare-fun d!113375 () Bool)

(assert (=> d!113375 (= (validKeyInArray!0 lt!423240) (and (not (= lt!423240 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!423240 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937751 d!113375))

(declare-fun d!113377 () Bool)

(declare-fun e!526756 () Bool)

(assert (=> d!113377 e!526756))

(declare-fun res!631202 () Bool)

(assert (=> d!113377 (=> res!631202 e!526756)))

(declare-fun lt!423457 () Bool)

(assert (=> d!113377 (= res!631202 (not lt!423457))))

(declare-fun lt!423460 () Bool)

(assert (=> d!113377 (= lt!423457 lt!423460)))

(declare-fun lt!423459 () Unit!31668)

(declare-fun e!526757 () Unit!31668)

(assert (=> d!113377 (= lt!423459 e!526757)))

(declare-fun c!97689 () Bool)

(assert (=> d!113377 (= c!97689 lt!423460)))

(assert (=> d!113377 (= lt!423460 (containsKey!450 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(assert (=> d!113377 (= (contains!5111 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) k0!1099) lt!423457)))

(declare-fun b!937998 () Bool)

(declare-fun lt!423458 () Unit!31668)

(assert (=> b!937998 (= e!526757 lt!423458)))

(assert (=> b!937998 (= lt!423458 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(assert (=> b!937998 (isDefined!355 (getValueByKey!483 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(declare-fun b!937999 () Bool)

(declare-fun Unit!31680 () Unit!31668)

(assert (=> b!937999 (= e!526757 Unit!31680)))

(declare-fun b!938000 () Bool)

(assert (=> b!938000 (= e!526756 (isDefined!355 (getValueByKey!483 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099)))))

(assert (= (and d!113377 c!97689) b!937998))

(assert (= (and d!113377 (not c!97689)) b!937999))

(assert (= (and d!113377 (not res!631202)) b!938000))

(declare-fun m!872925 () Bool)

(assert (=> d!113377 m!872925))

(declare-fun m!872927 () Bool)

(assert (=> b!937998 m!872927))

(declare-fun m!872929 () Bool)

(assert (=> b!937998 m!872929))

(assert (=> b!937998 m!872929))

(declare-fun m!872931 () Bool)

(assert (=> b!937998 m!872931))

(assert (=> b!938000 m!872929))

(assert (=> b!938000 m!872929))

(assert (=> b!938000 m!872931))

(assert (=> b!937752 d!113377))

(assert (=> b!937752 d!113327))

(declare-fun b!938008 () Bool)

(declare-fun e!526762 () Bool)

(assert (=> b!938008 (= e!526762 tp_is_empty!20259)))

(declare-fun condMapEmpty!32166 () Bool)

(declare-fun mapDefault!32166 () ValueCell!9648)

(assert (=> mapNonEmpty!32160 (= condMapEmpty!32166 (= mapRest!32160 ((as const (Array (_ BitVec 32) ValueCell!9648)) mapDefault!32166)))))

(declare-fun mapRes!32166 () Bool)

(assert (=> mapNonEmpty!32160 (= tp!61709 (and e!526762 mapRes!32166))))

(declare-fun mapNonEmpty!32166 () Bool)

(declare-fun tp!61718 () Bool)

(declare-fun e!526763 () Bool)

(assert (=> mapNonEmpty!32166 (= mapRes!32166 (and tp!61718 e!526763))))

(declare-fun mapKey!32166 () (_ BitVec 32))

(declare-fun mapRest!32166 () (Array (_ BitVec 32) ValueCell!9648))

(declare-fun mapValue!32166 () ValueCell!9648)

(assert (=> mapNonEmpty!32166 (= mapRest!32160 (store mapRest!32166 mapKey!32166 mapValue!32166))))

(declare-fun mapIsEmpty!32166 () Bool)

(assert (=> mapIsEmpty!32166 mapRes!32166))

(declare-fun b!938007 () Bool)

(assert (=> b!938007 (= e!526763 tp_is_empty!20259)))

(assert (= (and mapNonEmpty!32160 condMapEmpty!32166) mapIsEmpty!32166))

(assert (= (and mapNonEmpty!32160 (not condMapEmpty!32166)) mapNonEmpty!32166))

(assert (= (and mapNonEmpty!32166 ((_ is ValueCellFull!9648) mapValue!32166)) b!938007))

(assert (= (and mapNonEmpty!32160 ((_ is ValueCellFull!9648) mapDefault!32166)) b!938008))

(declare-fun m!872933 () Bool)

(assert (=> mapNonEmpty!32166 m!872933))

(declare-fun b_lambda!14171 () Bool)

(assert (= b_lambda!14169 (or (and start!79702 b_free!17751) b_lambda!14171)))

(declare-fun b_lambda!14173 () Bool)

(assert (= b_lambda!14165 (or (and start!79702 b_free!17751) b_lambda!14173)))

(declare-fun b_lambda!14175 () Bool)

(assert (= b_lambda!14163 (or (and start!79702 b_free!17751) b_lambda!14175)))

(declare-fun b_lambda!14177 () Bool)

(assert (= b_lambda!14167 (or (and start!79702 b_free!17751) b_lambda!14177)))

(check-sat b_and!29107 (not b!937886) (not b!937934) (not b!937881) (not d!113377) (not b!937932) (not bm!40787) (not d!113347) (not b_lambda!14171) (not b!937889) (not b!937865) (not d!113353) (not b!937973) (not d!113339) (not bm!40790) (not bm!40771) (not b!937983) (not b!937949) (not b!937954) (not b!937964) (not d!113327) (not b!937897) (not b!937896) (not b!937994) (not d!113369) (not b!937944) (not mapNonEmpty!32166) (not b!937875) (not bm!40793) (not b!937888) (not d!113331) (not b!938000) (not bm!40797) (not bm!40786) (not d!113341) (not d!113371) (not b!937942) (not b!937955) (not b_lambda!14177) (not bm!40773) (not b!937980) (not b!937935) (not b!937995) (not b!937876) (not b!937868) (not b!937867) (not bm!40792) (not b_lambda!14173) (not d!113337) (not b!937967) (not bm!40794) (not b!937976) (not bm!40772) (not d!113333) (not b!937901) (not bm!40783) (not b!937952) (not b_lambda!14175) (not bm!40779) tp_is_empty!20259 (not b!937974) (not b!937860) (not d!113329) (not b!937988) (not b!937996) (not b!937985) (not b!937874) (not b!937922) (not d!113345) (not b!937998) (not b!937950) (not b_lambda!14161) (not d!113343) (not b!937863) (not d!113367) (not b!937895) (not d!113349) (not b!937987) (not bm!40778) (not bm!40776) (not bm!40780) (not b!937916) (not b_next!17751) (not b!937884) (not b!937915) (not b!937913) (not b!937921))
(check-sat b_and!29107 (not b_next!17751))
(get-model)

(declare-fun d!113379 () Bool)

(declare-fun isEmpty!696 (Option!489) Bool)

(assert (=> d!113379 (= (isDefined!355 (getValueByKey!483 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099)) (not (isEmpty!696 (getValueByKey!483 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))))

(declare-fun bs!26307 () Bool)

(assert (= bs!26307 d!113379))

(assert (=> bs!26307 m!872929))

(declare-fun m!872935 () Bool)

(assert (=> bs!26307 m!872935))

(assert (=> b!938000 d!113379))

(declare-fun b!938019 () Bool)

(declare-fun e!526769 () Option!489)

(assert (=> b!938019 (= e!526769 (getValueByKey!483 (t!27449 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) k0!1099))))

(declare-fun b!938018 () Bool)

(declare-fun e!526768 () Option!489)

(assert (=> b!938018 (= e!526768 e!526769)))

(declare-fun c!97695 () Bool)

(assert (=> b!938018 (= c!97695 (and ((_ is Cons!19150) (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) (not (= (_1!6699 (h!20296 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) k0!1099))))))

(declare-fun b!938017 () Bool)

(assert (=> b!938017 (= e!526768 (Some!488 (_2!6699 (h!20296 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))))))

(declare-fun c!97694 () Bool)

(declare-fun d!113381 () Bool)

(assert (=> d!113381 (= c!97694 (and ((_ is Cons!19150) (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) (= (_1!6699 (h!20296 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) k0!1099)))))

(assert (=> d!113381 (= (getValueByKey!483 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099) e!526768)))

(declare-fun b!938020 () Bool)

(assert (=> b!938020 (= e!526769 None!487)))

(assert (= (and d!113381 c!97694) b!938017))

(assert (= (and d!113381 (not c!97694)) b!938018))

(assert (= (and b!938018 c!97695) b!938019))

(assert (= (and b!938018 (not c!97695)) b!938020))

(declare-fun m!872937 () Bool)

(assert (=> b!938019 m!872937))

(assert (=> b!938000 d!113381))

(declare-fun d!113383 () Bool)

(declare-fun e!526770 () Bool)

(assert (=> d!113383 e!526770))

(declare-fun res!631203 () Bool)

(assert (=> d!113383 (=> res!631203 e!526770)))

(declare-fun lt!423461 () Bool)

(assert (=> d!113383 (= res!631203 (not lt!423461))))

(declare-fun lt!423464 () Bool)

(assert (=> d!113383 (= lt!423461 lt!423464)))

(declare-fun lt!423463 () Unit!31668)

(declare-fun e!526771 () Unit!31668)

(assert (=> d!113383 (= lt!423463 e!526771)))

(declare-fun c!97696 () Bool)

(assert (=> d!113383 (= c!97696 lt!423464)))

(assert (=> d!113383 (= lt!423464 (containsKey!450 (toList!6052 lt!423456) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113383 (= (contains!5111 lt!423456 #b0000000000000000000000000000000000000000000000000000000000000000) lt!423461)))

(declare-fun b!938021 () Bool)

(declare-fun lt!423462 () Unit!31668)

(assert (=> b!938021 (= e!526771 lt!423462)))

(assert (=> b!938021 (= lt!423462 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 lt!423456) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938021 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423456) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938022 () Bool)

(declare-fun Unit!31681 () Unit!31668)

(assert (=> b!938022 (= e!526771 Unit!31681)))

(declare-fun b!938023 () Bool)

(assert (=> b!938023 (= e!526770 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423456) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113383 c!97696) b!938021))

(assert (= (and d!113383 (not c!97696)) b!938022))

(assert (= (and d!113383 (not res!631203)) b!938023))

(declare-fun m!872939 () Bool)

(assert (=> d!113383 m!872939))

(declare-fun m!872941 () Bool)

(assert (=> b!938021 m!872941))

(declare-fun m!872943 () Bool)

(assert (=> b!938021 m!872943))

(assert (=> b!938021 m!872943))

(declare-fun m!872945 () Bool)

(assert (=> b!938021 m!872945))

(assert (=> b!938023 m!872943))

(assert (=> b!938023 m!872943))

(assert (=> b!938023 m!872945))

(assert (=> bm!40797 d!113383))

(declare-fun d!113385 () Bool)

(assert (=> d!113385 (= (isDefined!355 (getValueByKey!483 (toList!6052 lt!423241) k0!1099)) (not (isEmpty!696 (getValueByKey!483 (toList!6052 lt!423241) k0!1099))))))

(declare-fun bs!26308 () Bool)

(assert (= bs!26308 d!113385))

(assert (=> bs!26308 m!872777))

(declare-fun m!872947 () Bool)

(assert (=> bs!26308 m!872947))

(assert (=> b!937944 d!113385))

(declare-fun b!938026 () Bool)

(declare-fun e!526773 () Option!489)

(assert (=> b!938026 (= e!526773 (getValueByKey!483 (t!27449 (toList!6052 lt!423241)) k0!1099))))

(declare-fun b!938025 () Bool)

(declare-fun e!526772 () Option!489)

(assert (=> b!938025 (= e!526772 e!526773)))

(declare-fun c!97698 () Bool)

(assert (=> b!938025 (= c!97698 (and ((_ is Cons!19150) (toList!6052 lt!423241)) (not (= (_1!6699 (h!20296 (toList!6052 lt!423241))) k0!1099))))))

(declare-fun b!938024 () Bool)

(assert (=> b!938024 (= e!526772 (Some!488 (_2!6699 (h!20296 (toList!6052 lt!423241)))))))

(declare-fun d!113387 () Bool)

(declare-fun c!97697 () Bool)

(assert (=> d!113387 (= c!97697 (and ((_ is Cons!19150) (toList!6052 lt!423241)) (= (_1!6699 (h!20296 (toList!6052 lt!423241))) k0!1099)))))

(assert (=> d!113387 (= (getValueByKey!483 (toList!6052 lt!423241) k0!1099) e!526772)))

(declare-fun b!938027 () Bool)

(assert (=> b!938027 (= e!526773 None!487)))

(assert (= (and d!113387 c!97697) b!938024))

(assert (= (and d!113387 (not c!97697)) b!938025))

(assert (= (and b!938025 c!97698) b!938026))

(assert (= (and b!938025 (not c!97698)) b!938027))

(declare-fun m!872949 () Bool)

(assert (=> b!938026 m!872949))

(assert (=> b!937944 d!113387))

(declare-fun d!113389 () Bool)

(declare-fun e!526774 () Bool)

(assert (=> d!113389 e!526774))

(declare-fun res!631204 () Bool)

(assert (=> d!113389 (=> res!631204 e!526774)))

(declare-fun lt!423465 () Bool)

(assert (=> d!113389 (= res!631204 (not lt!423465))))

(declare-fun lt!423468 () Bool)

(assert (=> d!113389 (= lt!423465 lt!423468)))

(declare-fun lt!423467 () Unit!31668)

(declare-fun e!526775 () Unit!31668)

(assert (=> d!113389 (= lt!423467 e!526775)))

(declare-fun c!97699 () Bool)

(assert (=> d!113389 (= c!97699 lt!423468)))

(assert (=> d!113389 (= lt!423468 (containsKey!450 (toList!6052 lt!423353) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113389 (= (contains!5111 lt!423353 #b1000000000000000000000000000000000000000000000000000000000000000) lt!423465)))

(declare-fun b!938028 () Bool)

(declare-fun lt!423466 () Unit!31668)

(assert (=> b!938028 (= e!526775 lt!423466)))

(assert (=> b!938028 (= lt!423466 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 lt!423353) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938028 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423353) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938029 () Bool)

(declare-fun Unit!31682 () Unit!31668)

(assert (=> b!938029 (= e!526775 Unit!31682)))

(declare-fun b!938030 () Bool)

(assert (=> b!938030 (= e!526774 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423353) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113389 c!97699) b!938028))

(assert (= (and d!113389 (not c!97699)) b!938029))

(assert (= (and d!113389 (not res!631204)) b!938030))

(declare-fun m!872951 () Bool)

(assert (=> d!113389 m!872951))

(declare-fun m!872953 () Bool)

(assert (=> b!938028 m!872953))

(declare-fun m!872955 () Bool)

(assert (=> b!938028 m!872955))

(assert (=> b!938028 m!872955))

(declare-fun m!872957 () Bool)

(assert (=> b!938028 m!872957))

(assert (=> b!938030 m!872955))

(assert (=> b!938030 m!872955))

(assert (=> b!938030 m!872957))

(assert (=> bm!40772 d!113389))

(declare-fun d!113391 () Bool)

(assert (=> d!113391 (= (get!14330 (getValueByKey!483 (toList!6052 lt!423238) k0!1099)) (v!12707 (getValueByKey!483 (toList!6052 lt!423238) k0!1099)))))

(assert (=> d!113371 d!113391))

(declare-fun b!938033 () Bool)

(declare-fun e!526777 () Option!489)

(assert (=> b!938033 (= e!526777 (getValueByKey!483 (t!27449 (toList!6052 lt!423238)) k0!1099))))

(declare-fun b!938032 () Bool)

(declare-fun e!526776 () Option!489)

(assert (=> b!938032 (= e!526776 e!526777)))

(declare-fun c!97701 () Bool)

(assert (=> b!938032 (= c!97701 (and ((_ is Cons!19150) (toList!6052 lt!423238)) (not (= (_1!6699 (h!20296 (toList!6052 lt!423238))) k0!1099))))))

(declare-fun b!938031 () Bool)

(assert (=> b!938031 (= e!526776 (Some!488 (_2!6699 (h!20296 (toList!6052 lt!423238)))))))

(declare-fun d!113393 () Bool)

(declare-fun c!97700 () Bool)

(assert (=> d!113393 (= c!97700 (and ((_ is Cons!19150) (toList!6052 lt!423238)) (= (_1!6699 (h!20296 (toList!6052 lt!423238))) k0!1099)))))

(assert (=> d!113393 (= (getValueByKey!483 (toList!6052 lt!423238) k0!1099) e!526776)))

(declare-fun b!938034 () Bool)

(assert (=> b!938034 (= e!526777 None!487)))

(assert (= (and d!113393 c!97700) b!938031))

(assert (= (and d!113393 (not c!97700)) b!938032))

(assert (= (and b!938032 c!97701) b!938033))

(assert (= (and b!938032 (not c!97701)) b!938034))

(declare-fun m!872959 () Bool)

(assert (=> b!938033 m!872959))

(assert (=> d!113371 d!113393))

(declare-fun d!113395 () Bool)

(assert (=> d!113395 (isDefined!355 (getValueByKey!483 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(declare-fun lt!423471 () Unit!31668)

(declare-fun choose!1557 (List!19154 (_ BitVec 64)) Unit!31668)

(assert (=> d!113395 (= lt!423471 (choose!1557 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(declare-fun e!526780 () Bool)

(assert (=> d!113395 e!526780))

(declare-fun res!631207 () Bool)

(assert (=> d!113395 (=> (not res!631207) (not e!526780))))

(declare-fun isStrictlySorted!503 (List!19154) Bool)

(assert (=> d!113395 (= res!631207 (isStrictlySorted!503 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))))

(assert (=> d!113395 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099) lt!423471)))

(declare-fun b!938037 () Bool)

(assert (=> b!938037 (= e!526780 (containsKey!450 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(assert (= (and d!113395 res!631207) b!938037))

(assert (=> d!113395 m!872929))

(assert (=> d!113395 m!872929))

(assert (=> d!113395 m!872931))

(declare-fun m!872961 () Bool)

(assert (=> d!113395 m!872961))

(declare-fun m!872963 () Bool)

(assert (=> d!113395 m!872963))

(assert (=> b!938037 m!872925))

(assert (=> b!937998 d!113395))

(assert (=> b!937998 d!113379))

(assert (=> b!937998 d!113381))

(assert (=> d!113369 d!113355))

(declare-fun d!113397 () Bool)

(declare-fun e!526781 () Bool)

(assert (=> d!113397 e!526781))

(declare-fun res!631208 () Bool)

(assert (=> d!113397 (=> res!631208 e!526781)))

(declare-fun lt!423472 () Bool)

(assert (=> d!113397 (= res!631208 (not lt!423472))))

(declare-fun lt!423475 () Bool)

(assert (=> d!113397 (= lt!423472 lt!423475)))

(declare-fun lt!423474 () Unit!31668)

(declare-fun e!526782 () Unit!31668)

(assert (=> d!113397 (= lt!423474 e!526782)))

(declare-fun c!97702 () Bool)

(assert (=> d!113397 (= c!97702 lt!423475)))

(assert (=> d!113397 (= lt!423475 (containsKey!450 (toList!6052 lt!423389) (_1!6699 lt!423246)))))

(assert (=> d!113397 (= (contains!5111 lt!423389 (_1!6699 lt!423246)) lt!423472)))

(declare-fun b!938038 () Bool)

(declare-fun lt!423473 () Unit!31668)

(assert (=> b!938038 (= e!526782 lt!423473)))

(assert (=> b!938038 (= lt!423473 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 lt!423389) (_1!6699 lt!423246)))))

(assert (=> b!938038 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423389) (_1!6699 lt!423246)))))

(declare-fun b!938039 () Bool)

(declare-fun Unit!31683 () Unit!31668)

(assert (=> b!938039 (= e!526782 Unit!31683)))

(declare-fun b!938040 () Bool)

(assert (=> b!938040 (= e!526781 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423389) (_1!6699 lt!423246))))))

(assert (= (and d!113397 c!97702) b!938038))

(assert (= (and d!113397 (not c!97702)) b!938039))

(assert (= (and d!113397 (not res!631208)) b!938040))

(declare-fun m!872965 () Bool)

(assert (=> d!113397 m!872965))

(declare-fun m!872967 () Bool)

(assert (=> b!938038 m!872967))

(assert (=> b!938038 m!872799))

(assert (=> b!938038 m!872799))

(declare-fun m!872969 () Bool)

(assert (=> b!938038 m!872969))

(assert (=> b!938040 m!872799))

(assert (=> b!938040 m!872799))

(assert (=> b!938040 m!872969))

(assert (=> d!113337 d!113397))

(declare-fun b!938043 () Bool)

(declare-fun e!526784 () Option!489)

(assert (=> b!938043 (= e!526784 (getValueByKey!483 (t!27449 lt!423387) (_1!6699 lt!423246)))))

(declare-fun b!938042 () Bool)

(declare-fun e!526783 () Option!489)

(assert (=> b!938042 (= e!526783 e!526784)))

(declare-fun c!97704 () Bool)

(assert (=> b!938042 (= c!97704 (and ((_ is Cons!19150) lt!423387) (not (= (_1!6699 (h!20296 lt!423387)) (_1!6699 lt!423246)))))))

(declare-fun b!938041 () Bool)

(assert (=> b!938041 (= e!526783 (Some!488 (_2!6699 (h!20296 lt!423387))))))

(declare-fun d!113399 () Bool)

(declare-fun c!97703 () Bool)

(assert (=> d!113399 (= c!97703 (and ((_ is Cons!19150) lt!423387) (= (_1!6699 (h!20296 lt!423387)) (_1!6699 lt!423246))))))

(assert (=> d!113399 (= (getValueByKey!483 lt!423387 (_1!6699 lt!423246)) e!526783)))

(declare-fun b!938044 () Bool)

(assert (=> b!938044 (= e!526784 None!487)))

(assert (= (and d!113399 c!97703) b!938041))

(assert (= (and d!113399 (not c!97703)) b!938042))

(assert (= (and b!938042 c!97704) b!938043))

(assert (= (and b!938042 (not c!97704)) b!938044))

(declare-fun m!872971 () Bool)

(assert (=> b!938043 m!872971))

(assert (=> d!113337 d!113399))

(declare-fun d!113401 () Bool)

(assert (=> d!113401 (= (getValueByKey!483 lt!423387 (_1!6699 lt!423246)) (Some!488 (_2!6699 lt!423246)))))

(declare-fun lt!423478 () Unit!31668)

(declare-fun choose!1558 (List!19154 (_ BitVec 64) V!31977) Unit!31668)

(assert (=> d!113401 (= lt!423478 (choose!1558 lt!423387 (_1!6699 lt!423246) (_2!6699 lt!423246)))))

(declare-fun e!526787 () Bool)

(assert (=> d!113401 e!526787))

(declare-fun res!631213 () Bool)

(assert (=> d!113401 (=> (not res!631213) (not e!526787))))

(assert (=> d!113401 (= res!631213 (isStrictlySorted!503 lt!423387))))

(assert (=> d!113401 (= (lemmaContainsTupThenGetReturnValue!259 lt!423387 (_1!6699 lt!423246) (_2!6699 lt!423246)) lt!423478)))

(declare-fun b!938049 () Bool)

(declare-fun res!631214 () Bool)

(assert (=> b!938049 (=> (not res!631214) (not e!526787))))

(assert (=> b!938049 (= res!631214 (containsKey!450 lt!423387 (_1!6699 lt!423246)))))

(declare-fun b!938050 () Bool)

(assert (=> b!938050 (= e!526787 (contains!5114 lt!423387 (tuple2!13377 (_1!6699 lt!423246) (_2!6699 lt!423246))))))

(assert (= (and d!113401 res!631213) b!938049))

(assert (= (and b!938049 res!631214) b!938050))

(assert (=> d!113401 m!872793))

(declare-fun m!872973 () Bool)

(assert (=> d!113401 m!872973))

(declare-fun m!872975 () Bool)

(assert (=> d!113401 m!872975))

(declare-fun m!872977 () Bool)

(assert (=> b!938049 m!872977))

(declare-fun m!872979 () Bool)

(assert (=> b!938050 m!872979))

(assert (=> d!113337 d!113401))

(declare-fun d!113403 () Bool)

(declare-fun e!526798 () Bool)

(assert (=> d!113403 e!526798))

(declare-fun res!631220 () Bool)

(assert (=> d!113403 (=> (not res!631220) (not e!526798))))

(declare-fun lt!423481 () List!19154)

(assert (=> d!113403 (= res!631220 (isStrictlySorted!503 lt!423481))))

(declare-fun e!526800 () List!19154)

(assert (=> d!113403 (= lt!423481 e!526800)))

(declare-fun c!97713 () Bool)

(assert (=> d!113403 (= c!97713 (and ((_ is Cons!19150) (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (bvslt (_1!6699 (h!20296 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6699 lt!423246))))))

(assert (=> d!113403 (isStrictlySorted!503 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))))

(assert (=> d!113403 (= (insertStrictlySorted!316 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6699 lt!423246) (_2!6699 lt!423246)) lt!423481)))

(declare-fun bm!40804 () Bool)

(declare-fun call!40807 () List!19154)

(declare-fun call!40808 () List!19154)

(assert (=> bm!40804 (= call!40807 call!40808)))

(declare-fun b!938071 () Bool)

(assert (=> b!938071 (= e!526798 (contains!5114 lt!423481 (tuple2!13377 (_1!6699 lt!423246) (_2!6699 lt!423246))))))

(declare-fun e!526799 () List!19154)

(declare-fun bm!40805 () Bool)

(declare-fun $colon$colon!552 (List!19154 tuple2!13376) List!19154)

(assert (=> bm!40805 (= call!40808 ($colon$colon!552 e!526799 (ite c!97713 (h!20296 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (tuple2!13377 (_1!6699 lt!423246) (_2!6699 lt!423246)))))))

(declare-fun c!97715 () Bool)

(assert (=> bm!40805 (= c!97715 c!97713)))

(declare-fun b!938072 () Bool)

(assert (=> b!938072 (= e!526799 (insertStrictlySorted!316 (t!27449 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (_1!6699 lt!423246) (_2!6699 lt!423246)))))

(declare-fun b!938073 () Bool)

(assert (=> b!938073 (= e!526800 call!40808)))

(declare-fun b!938074 () Bool)

(declare-fun e!526802 () List!19154)

(assert (=> b!938074 (= e!526800 e!526802)))

(declare-fun c!97714 () Bool)

(assert (=> b!938074 (= c!97714 (and ((_ is Cons!19150) (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (= (_1!6699 (h!20296 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6699 lt!423246))))))

(declare-fun b!938075 () Bool)

(assert (=> b!938075 (= e!526802 call!40807)))

(declare-fun b!938076 () Bool)

(declare-fun c!97716 () Bool)

(assert (=> b!938076 (= e!526799 (ite c!97714 (t!27449 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (ite c!97716 (Cons!19150 (h!20296 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (t!27449 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) Nil!19151)))))

(declare-fun bm!40806 () Bool)

(declare-fun call!40809 () List!19154)

(assert (=> bm!40806 (= call!40809 call!40807)))

(declare-fun b!938077 () Bool)

(declare-fun e!526801 () List!19154)

(assert (=> b!938077 (= e!526801 call!40809)))

(declare-fun b!938078 () Bool)

(declare-fun res!631219 () Bool)

(assert (=> b!938078 (=> (not res!631219) (not e!526798))))

(assert (=> b!938078 (= res!631219 (containsKey!450 lt!423481 (_1!6699 lt!423246)))))

(declare-fun b!938079 () Bool)

(assert (=> b!938079 (= e!526801 call!40809)))

(declare-fun b!938080 () Bool)

(assert (=> b!938080 (= c!97716 (and ((_ is Cons!19150) (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (bvsgt (_1!6699 (h!20296 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6699 lt!423246))))))

(assert (=> b!938080 (= e!526802 e!526801)))

(assert (= (and d!113403 c!97713) b!938073))

(assert (= (and d!113403 (not c!97713)) b!938074))

(assert (= (and b!938074 c!97714) b!938075))

(assert (= (and b!938074 (not c!97714)) b!938080))

(assert (= (and b!938080 c!97716) b!938079))

(assert (= (and b!938080 (not c!97716)) b!938077))

(assert (= (or b!938079 b!938077) bm!40806))

(assert (= (or b!938075 bm!40806) bm!40804))

(assert (= (or b!938073 bm!40804) bm!40805))

(assert (= (and bm!40805 c!97715) b!938072))

(assert (= (and bm!40805 (not c!97715)) b!938076))

(assert (= (and d!113403 res!631220) b!938078))

(assert (= (and b!938078 res!631219) b!938071))

(declare-fun m!872981 () Bool)

(assert (=> d!113403 m!872981))

(declare-fun m!872983 () Bool)

(assert (=> d!113403 m!872983))

(declare-fun m!872985 () Bool)

(assert (=> b!938071 m!872985))

(declare-fun m!872987 () Bool)

(assert (=> bm!40805 m!872987))

(declare-fun m!872989 () Bool)

(assert (=> b!938072 m!872989))

(declare-fun m!872991 () Bool)

(assert (=> b!938078 m!872991))

(assert (=> d!113337 d!113403))

(declare-fun d!113405 () Bool)

(declare-fun res!631225 () Bool)

(declare-fun e!526807 () Bool)

(assert (=> d!113405 (=> res!631225 e!526807)))

(assert (=> d!113405 (= res!631225 (and ((_ is Cons!19150) (toList!6052 lt!423238)) (= (_1!6699 (h!20296 (toList!6052 lt!423238))) k0!1099)))))

(assert (=> d!113405 (= (containsKey!450 (toList!6052 lt!423238) k0!1099) e!526807)))

(declare-fun b!938085 () Bool)

(declare-fun e!526808 () Bool)

(assert (=> b!938085 (= e!526807 e!526808)))

(declare-fun res!631226 () Bool)

(assert (=> b!938085 (=> (not res!631226) (not e!526808))))

(assert (=> b!938085 (= res!631226 (and (or (not ((_ is Cons!19150) (toList!6052 lt!423238))) (bvsle (_1!6699 (h!20296 (toList!6052 lt!423238))) k0!1099)) ((_ is Cons!19150) (toList!6052 lt!423238)) (bvslt (_1!6699 (h!20296 (toList!6052 lt!423238))) k0!1099)))))

(declare-fun b!938086 () Bool)

(assert (=> b!938086 (= e!526808 (containsKey!450 (t!27449 (toList!6052 lt!423238)) k0!1099))))

(assert (= (and d!113405 (not res!631225)) b!938085))

(assert (= (and b!938085 res!631226) b!938086))

(declare-fun m!872993 () Bool)

(assert (=> b!938086 m!872993))

(assert (=> d!113367 d!113405))

(declare-fun d!113407 () Bool)

(assert (=> d!113407 (= (get!14331 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!12705 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!937949 d!113407))

(declare-fun d!113409 () Bool)

(assert (=> d!113409 (= (validKeyInArray!0 (select (arr!27170 _keys!1487) #b00000000000000000000000000000000)) (and (not (= (select (arr!27170 _keys!1487) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27170 _keys!1487) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937964 d!113409))

(declare-fun d!113411 () Bool)

(assert (=> d!113411 (= (apply!853 lt!423353 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14330 (getValueByKey!483 (toList!6052 lt!423353) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26309 () Bool)

(assert (= bs!26309 d!113411))

(declare-fun m!872995 () Bool)

(assert (=> bs!26309 m!872995))

(assert (=> bs!26309 m!872995))

(declare-fun m!872997 () Bool)

(assert (=> bs!26309 m!872997))

(assert (=> b!937865 d!113411))

(declare-fun d!113413 () Bool)

(declare-fun e!526809 () Bool)

(assert (=> d!113413 e!526809))

(declare-fun res!631227 () Bool)

(assert (=> d!113413 (=> (not res!631227) (not e!526809))))

(declare-fun lt!423484 () ListLongMap!12073)

(assert (=> d!113413 (= res!631227 (contains!5111 lt!423484 (_1!6699 (ite (or c!97688 c!97685) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!423482 () List!19154)

(assert (=> d!113413 (= lt!423484 (ListLongMap!12074 lt!423482))))

(declare-fun lt!423485 () Unit!31668)

(declare-fun lt!423483 () Unit!31668)

(assert (=> d!113413 (= lt!423485 lt!423483)))

(assert (=> d!113413 (= (getValueByKey!483 lt!423482 (_1!6699 (ite (or c!97688 c!97685) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!488 (_2!6699 (ite (or c!97688 c!97685) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113413 (= lt!423483 (lemmaContainsTupThenGetReturnValue!259 lt!423482 (_1!6699 (ite (or c!97688 c!97685) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6699 (ite (or c!97688 c!97685) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113413 (= lt!423482 (insertStrictlySorted!316 (toList!6052 (ite c!97688 call!40797 (ite c!97685 call!40800 call!40798))) (_1!6699 (ite (or c!97688 c!97685) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6699 (ite (or c!97688 c!97685) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113413 (= (+!2840 (ite c!97688 call!40797 (ite c!97685 call!40800 call!40798)) (ite (or c!97688 c!97685) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!423484)))

(declare-fun b!938087 () Bool)

(declare-fun res!631228 () Bool)

(assert (=> b!938087 (=> (not res!631228) (not e!526809))))

(assert (=> b!938087 (= res!631228 (= (getValueByKey!483 (toList!6052 lt!423484) (_1!6699 (ite (or c!97688 c!97685) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!488 (_2!6699 (ite (or c!97688 c!97685) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!938088 () Bool)

(assert (=> b!938088 (= e!526809 (contains!5114 (toList!6052 lt!423484) (ite (or c!97688 c!97685) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113413 res!631227) b!938087))

(assert (= (and b!938087 res!631228) b!938088))

(declare-fun m!872999 () Bool)

(assert (=> d!113413 m!872999))

(declare-fun m!873001 () Bool)

(assert (=> d!113413 m!873001))

(declare-fun m!873003 () Bool)

(assert (=> d!113413 m!873003))

(declare-fun m!873005 () Bool)

(assert (=> d!113413 m!873005))

(declare-fun m!873007 () Bool)

(assert (=> b!938087 m!873007))

(declare-fun m!873009 () Bool)

(assert (=> b!938088 m!873009))

(assert (=> bm!40792 d!113413))

(declare-fun d!113415 () Bool)

(assert (=> d!113415 (= (apply!853 lt!423353 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14330 (getValueByKey!483 (toList!6052 lt!423353) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26310 () Bool)

(assert (= bs!26310 d!113415))

(assert (=> bs!26310 m!872955))

(assert (=> bs!26310 m!872955))

(declare-fun m!873011 () Bool)

(assert (=> bs!26310 m!873011))

(assert (=> b!937867 d!113415))

(assert (=> b!937952 d!113409))

(declare-fun d!113417 () Bool)

(assert (=> d!113417 (= (apply!853 lt!423375 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14330 (getValueByKey!483 (toList!6052 lt!423375) (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))))

(declare-fun bs!26311 () Bool)

(assert (= bs!26311 d!113417))

(assert (=> bs!26311 m!872745))

(declare-fun m!873013 () Bool)

(assert (=> bs!26311 m!873013))

(assert (=> bs!26311 m!873013))

(declare-fun m!873015 () Bool)

(assert (=> bs!26311 m!873015))

(assert (=> b!937896 d!113417))

(declare-fun d!113419 () Bool)

(declare-fun c!97717 () Bool)

(assert (=> d!113419 (= c!97717 ((_ is ValueCellFull!9648) (select (arr!27169 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun e!526810 () V!31977)

(assert (=> d!113419 (= (get!14328 (select (arr!27169 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!526810)))

(declare-fun b!938089 () Bool)

(assert (=> b!938089 (= e!526810 (get!14331 (select (arr!27169 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!938090 () Bool)

(assert (=> b!938090 (= e!526810 (get!14332 (select (arr!27169 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113419 c!97717) b!938089))

(assert (= (and d!113419 (not c!97717)) b!938090))

(assert (=> b!938089 m!872769))

(assert (=> b!938089 m!872569))

(declare-fun m!873017 () Bool)

(assert (=> b!938089 m!873017))

(assert (=> b!938090 m!872769))

(assert (=> b!938090 m!872569))

(declare-fun m!873019 () Bool)

(assert (=> b!938090 m!873019))

(assert (=> b!937896 d!113419))

(declare-fun bm!40809 () Bool)

(declare-fun call!40812 () ListLongMap!12073)

(assert (=> bm!40809 (= call!40812 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!938115 () Bool)

(declare-fun e!526828 () Bool)

(declare-fun e!526825 () Bool)

(assert (=> b!938115 (= e!526828 e!526825)))

(declare-fun c!97726 () Bool)

(declare-fun e!526831 () Bool)

(assert (=> b!938115 (= c!97726 e!526831)))

(declare-fun res!631237 () Bool)

(assert (=> b!938115 (=> (not res!631237) (not e!526831))))

(assert (=> b!938115 (= res!631237 (bvslt from!1844 (size!27629 _keys!1487)))))

(declare-fun b!938116 () Bool)

(declare-fun e!526829 () ListLongMap!12073)

(declare-fun e!526826 () ListLongMap!12073)

(assert (=> b!938116 (= e!526829 e!526826)))

(declare-fun c!97728 () Bool)

(assert (=> b!938116 (= c!97728 (validKeyInArray!0 (select (arr!27170 _keys!1487) from!1844)))))

(declare-fun b!938117 () Bool)

(declare-fun res!631240 () Bool)

(assert (=> b!938117 (=> (not res!631240) (not e!526828))))

(declare-fun lt!423504 () ListLongMap!12073)

(assert (=> b!938117 (= res!631240 (not (contains!5111 lt!423504 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!113421 () Bool)

(assert (=> d!113421 e!526828))

(declare-fun res!631239 () Bool)

(assert (=> d!113421 (=> (not res!631239) (not e!526828))))

(assert (=> d!113421 (= res!631239 (not (contains!5111 lt!423504 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!113421 (= lt!423504 e!526829)))

(declare-fun c!97729 () Bool)

(assert (=> d!113421 (= c!97729 (bvsge from!1844 (size!27629 _keys!1487)))))

(assert (=> d!113421 (validMask!0 mask!1881)))

(assert (=> d!113421 (= (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!423504)))

(declare-fun b!938118 () Bool)

(declare-fun e!526830 () Bool)

(assert (=> b!938118 (= e!526825 e!526830)))

(declare-fun c!97727 () Bool)

(assert (=> b!938118 (= c!97727 (bvslt from!1844 (size!27629 _keys!1487)))))

(declare-fun b!938119 () Bool)

(assert (=> b!938119 (= e!526829 (ListLongMap!12074 Nil!19151))))

(declare-fun b!938120 () Bool)

(assert (=> b!938120 (= e!526826 call!40812)))

(declare-fun b!938121 () Bool)

(assert (=> b!938121 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27629 _keys!1487)))))

(assert (=> b!938121 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27628 _values!1231)))))

(declare-fun e!526827 () Bool)

(assert (=> b!938121 (= e!526827 (= (apply!853 lt!423504 (select (arr!27170 _keys!1487) from!1844)) (get!14328 (select (arr!27169 _values!1231) from!1844) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!938122 () Bool)

(assert (=> b!938122 (= e!526830 (= lt!423504 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!938123 () Bool)

(declare-fun isEmpty!697 (ListLongMap!12073) Bool)

(assert (=> b!938123 (= e!526830 (isEmpty!697 lt!423504))))

(declare-fun b!938124 () Bool)

(assert (=> b!938124 (= e!526831 (validKeyInArray!0 (select (arr!27170 _keys!1487) from!1844)))))

(assert (=> b!938124 (bvsge from!1844 #b00000000000000000000000000000000)))

(declare-fun b!938125 () Bool)

(assert (=> b!938125 (= e!526825 e!526827)))

(assert (=> b!938125 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27629 _keys!1487)))))

(declare-fun res!631238 () Bool)

(assert (=> b!938125 (= res!631238 (contains!5111 lt!423504 (select (arr!27170 _keys!1487) from!1844)))))

(assert (=> b!938125 (=> (not res!631238) (not e!526827))))

(declare-fun b!938126 () Bool)

(declare-fun lt!423500 () Unit!31668)

(declare-fun lt!423501 () Unit!31668)

(assert (=> b!938126 (= lt!423500 lt!423501)))

(declare-fun lt!423502 () V!31977)

(declare-fun lt!423503 () (_ BitVec 64))

(declare-fun lt!423505 () (_ BitVec 64))

(declare-fun lt!423506 () ListLongMap!12073)

(assert (=> b!938126 (not (contains!5111 (+!2840 lt!423506 (tuple2!13377 lt!423503 lt!423502)) lt!423505))))

(declare-fun addStillNotContains!220 (ListLongMap!12073 (_ BitVec 64) V!31977 (_ BitVec 64)) Unit!31668)

(assert (=> b!938126 (= lt!423501 (addStillNotContains!220 lt!423506 lt!423503 lt!423502 lt!423505))))

(assert (=> b!938126 (= lt!423505 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!938126 (= lt!423502 (get!14328 (select (arr!27169 _values!1231) from!1844) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!938126 (= lt!423503 (select (arr!27170 _keys!1487) from!1844))))

(assert (=> b!938126 (= lt!423506 call!40812)))

(assert (=> b!938126 (= e!526826 (+!2840 call!40812 (tuple2!13377 (select (arr!27170 _keys!1487) from!1844) (get!14328 (select (arr!27169 _values!1231) from!1844) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!113421 c!97729) b!938119))

(assert (= (and d!113421 (not c!97729)) b!938116))

(assert (= (and b!938116 c!97728) b!938126))

(assert (= (and b!938116 (not c!97728)) b!938120))

(assert (= (or b!938126 b!938120) bm!40809))

(assert (= (and d!113421 res!631239) b!938117))

(assert (= (and b!938117 res!631240) b!938115))

(assert (= (and b!938115 res!631237) b!938124))

(assert (= (and b!938115 c!97726) b!938125))

(assert (= (and b!938115 (not c!97726)) b!938118))

(assert (= (and b!938125 res!631238) b!938121))

(assert (= (and b!938118 c!97727) b!938122))

(assert (= (and b!938118 (not c!97727)) b!938123))

(declare-fun b_lambda!14179 () Bool)

(assert (=> (not b_lambda!14179) (not b!938121)))

(assert (=> b!938121 t!27448))

(declare-fun b_and!29109 () Bool)

(assert (= b_and!29107 (and (=> t!27448 result!12123) b_and!29109)))

(declare-fun b_lambda!14181 () Bool)

(assert (=> (not b_lambda!14181) (not b!938126)))

(assert (=> b!938126 t!27448))

(declare-fun b_and!29111 () Bool)

(assert (= b_and!29109 (and (=> t!27448 result!12123) b_and!29111)))

(assert (=> b!938124 m!872857))

(assert (=> b!938124 m!872857))

(assert (=> b!938124 m!872913))

(assert (=> b!938116 m!872857))

(assert (=> b!938116 m!872857))

(assert (=> b!938116 m!872913))

(assert (=> b!938121 m!872915))

(assert (=> b!938121 m!872569))

(assert (=> b!938121 m!872917))

(assert (=> b!938121 m!872915))

(assert (=> b!938121 m!872857))

(declare-fun m!873021 () Bool)

(assert (=> b!938121 m!873021))

(assert (=> b!938121 m!872857))

(assert (=> b!938121 m!872569))

(declare-fun m!873023 () Bool)

(assert (=> b!938123 m!873023))

(assert (=> b!938125 m!872857))

(assert (=> b!938125 m!872857))

(declare-fun m!873025 () Bool)

(assert (=> b!938125 m!873025))

(declare-fun m!873027 () Bool)

(assert (=> bm!40809 m!873027))

(assert (=> b!938122 m!873027))

(assert (=> b!938126 m!872915))

(assert (=> b!938126 m!872569))

(assert (=> b!938126 m!872917))

(assert (=> b!938126 m!872915))

(declare-fun m!873029 () Bool)

(assert (=> b!938126 m!873029))

(declare-fun m!873031 () Bool)

(assert (=> b!938126 m!873031))

(assert (=> b!938126 m!873031))

(declare-fun m!873033 () Bool)

(assert (=> b!938126 m!873033))

(assert (=> b!938126 m!872857))

(assert (=> b!938126 m!872569))

(declare-fun m!873035 () Bool)

(assert (=> b!938126 m!873035))

(declare-fun m!873037 () Bool)

(assert (=> d!113421 m!873037))

(assert (=> d!113421 m!872555))

(declare-fun m!873039 () Bool)

(assert (=> b!938117 m!873039))

(assert (=> bm!40794 d!113421))

(declare-fun d!113423 () Bool)

(declare-fun e!526832 () Bool)

(assert (=> d!113423 e!526832))

(declare-fun res!631241 () Bool)

(assert (=> d!113423 (=> res!631241 e!526832)))

(declare-fun lt!423507 () Bool)

(assert (=> d!113423 (= res!631241 (not lt!423507))))

(declare-fun lt!423510 () Bool)

(assert (=> d!113423 (= lt!423507 lt!423510)))

(declare-fun lt!423509 () Unit!31668)

(declare-fun e!526833 () Unit!31668)

(assert (=> d!113423 (= lt!423509 e!526833)))

(declare-fun c!97730 () Bool)

(assert (=> d!113423 (= c!97730 lt!423510)))

(assert (=> d!113423 (= lt!423510 (containsKey!450 (toList!6052 lt!423375) (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> d!113423 (= (contains!5111 lt!423375 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) lt!423507)))

(declare-fun b!938127 () Bool)

(declare-fun lt!423508 () Unit!31668)

(assert (=> b!938127 (= e!526833 lt!423508)))

(assert (=> b!938127 (= lt!423508 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 lt!423375) (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!938127 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423375) (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!938128 () Bool)

(declare-fun Unit!31684 () Unit!31668)

(assert (=> b!938128 (= e!526833 Unit!31684)))

(declare-fun b!938129 () Bool)

(assert (=> b!938129 (= e!526832 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423375) (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))))

(assert (= (and d!113423 c!97730) b!938127))

(assert (= (and d!113423 (not c!97730)) b!938128))

(assert (= (and d!113423 (not res!631241)) b!938129))

(assert (=> d!113423 m!872745))

(declare-fun m!873041 () Bool)

(assert (=> d!113423 m!873041))

(assert (=> b!938127 m!872745))

(declare-fun m!873043 () Bool)

(assert (=> b!938127 m!873043))

(assert (=> b!938127 m!872745))

(assert (=> b!938127 m!873013))

(assert (=> b!938127 m!873013))

(declare-fun m!873045 () Bool)

(assert (=> b!938127 m!873045))

(assert (=> b!938129 m!872745))

(assert (=> b!938129 m!873013))

(assert (=> b!938129 m!873013))

(assert (=> b!938129 m!873045))

(assert (=> b!937881 d!113423))

(declare-fun d!113425 () Bool)

(assert (=> d!113425 (= (get!14330 (getValueByKey!483 (toList!6052 lt!423241) k0!1099)) (v!12707 (getValueByKey!483 (toList!6052 lt!423241) k0!1099)))))

(assert (=> d!113331 d!113425))

(assert (=> d!113331 d!113387))

(assert (=> b!937954 d!113409))

(declare-fun d!113427 () Bool)

(declare-fun e!526834 () Bool)

(assert (=> d!113427 e!526834))

(declare-fun res!631242 () Bool)

(assert (=> d!113427 (=> res!631242 e!526834)))

(declare-fun lt!423511 () Bool)

(assert (=> d!113427 (= res!631242 (not lt!423511))))

(declare-fun lt!423514 () Bool)

(assert (=> d!113427 (= lt!423511 lt!423514)))

(declare-fun lt!423513 () Unit!31668)

(declare-fun e!526835 () Unit!31668)

(assert (=> d!113427 (= lt!423513 e!526835)))

(declare-fun c!97731 () Bool)

(assert (=> d!113427 (= c!97731 lt!423514)))

(assert (=> d!113427 (= lt!423514 (containsKey!450 (toList!6052 lt!423375) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113427 (= (contains!5111 lt!423375 #b0000000000000000000000000000000000000000000000000000000000000000) lt!423511)))

(declare-fun b!938130 () Bool)

(declare-fun lt!423512 () Unit!31668)

(assert (=> b!938130 (= e!526835 lt!423512)))

(assert (=> b!938130 (= lt!423512 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 lt!423375) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938130 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423375) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938131 () Bool)

(declare-fun Unit!31685 () Unit!31668)

(assert (=> b!938131 (= e!526835 Unit!31685)))

(declare-fun b!938132 () Bool)

(assert (=> b!938132 (= e!526834 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423375) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113427 c!97731) b!938130))

(assert (= (and d!113427 (not c!97731)) b!938131))

(assert (= (and d!113427 (not res!631242)) b!938132))

(declare-fun m!873047 () Bool)

(assert (=> d!113427 m!873047))

(declare-fun m!873049 () Bool)

(assert (=> b!938130 m!873049))

(declare-fun m!873051 () Bool)

(assert (=> b!938130 m!873051))

(assert (=> b!938130 m!873051))

(declare-fun m!873053 () Bool)

(assert (=> b!938130 m!873053))

(assert (=> b!938132 m!873051))

(assert (=> b!938132 m!873051))

(assert (=> b!938132 m!873053))

(assert (=> bm!40783 d!113427))

(declare-fun d!113429 () Bool)

(declare-fun e!526836 () Bool)

(assert (=> d!113429 e!526836))

(declare-fun res!631243 () Bool)

(assert (=> d!113429 (=> res!631243 e!526836)))

(declare-fun lt!423515 () Bool)

(assert (=> d!113429 (= res!631243 (not lt!423515))))

(declare-fun lt!423518 () Bool)

(assert (=> d!113429 (= lt!423515 lt!423518)))

(declare-fun lt!423517 () Unit!31668)

(declare-fun e!526837 () Unit!31668)

(assert (=> d!113429 (= lt!423517 e!526837)))

(declare-fun c!97732 () Bool)

(assert (=> d!113429 (= c!97732 lt!423518)))

(assert (=> d!113429 (= lt!423518 (containsKey!450 (toList!6052 (+!2840 lt!423238 (tuple2!13377 lt!423240 lt!423248))) k0!1099))))

(assert (=> d!113429 (= (contains!5111 (+!2840 lt!423238 (tuple2!13377 lt!423240 lt!423248)) k0!1099) lt!423515)))

(declare-fun b!938133 () Bool)

(declare-fun lt!423516 () Unit!31668)

(assert (=> b!938133 (= e!526837 lt!423516)))

(assert (=> b!938133 (= lt!423516 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 (+!2840 lt!423238 (tuple2!13377 lt!423240 lt!423248))) k0!1099))))

(assert (=> b!938133 (isDefined!355 (getValueByKey!483 (toList!6052 (+!2840 lt!423238 (tuple2!13377 lt!423240 lt!423248))) k0!1099))))

(declare-fun b!938134 () Bool)

(declare-fun Unit!31686 () Unit!31668)

(assert (=> b!938134 (= e!526837 Unit!31686)))

(declare-fun b!938135 () Bool)

(assert (=> b!938135 (= e!526836 (isDefined!355 (getValueByKey!483 (toList!6052 (+!2840 lt!423238 (tuple2!13377 lt!423240 lt!423248))) k0!1099)))))

(assert (= (and d!113429 c!97732) b!938133))

(assert (= (and d!113429 (not c!97732)) b!938134))

(assert (= (and d!113429 (not res!631243)) b!938135))

(declare-fun m!873055 () Bool)

(assert (=> d!113429 m!873055))

(declare-fun m!873057 () Bool)

(assert (=> b!938133 m!873057))

(declare-fun m!873059 () Bool)

(assert (=> b!938133 m!873059))

(assert (=> b!938133 m!873059))

(declare-fun m!873061 () Bool)

(assert (=> b!938133 m!873061))

(assert (=> b!938135 m!873059))

(assert (=> b!938135 m!873059))

(assert (=> b!938135 m!873061))

(assert (=> d!113341 d!113429))

(declare-fun d!113431 () Bool)

(declare-fun e!526838 () Bool)

(assert (=> d!113431 e!526838))

(declare-fun res!631244 () Bool)

(assert (=> d!113431 (=> (not res!631244) (not e!526838))))

(declare-fun lt!423521 () ListLongMap!12073)

(assert (=> d!113431 (= res!631244 (contains!5111 lt!423521 (_1!6699 (tuple2!13377 lt!423240 lt!423248))))))

(declare-fun lt!423519 () List!19154)

(assert (=> d!113431 (= lt!423521 (ListLongMap!12074 lt!423519))))

(declare-fun lt!423522 () Unit!31668)

(declare-fun lt!423520 () Unit!31668)

(assert (=> d!113431 (= lt!423522 lt!423520)))

(assert (=> d!113431 (= (getValueByKey!483 lt!423519 (_1!6699 (tuple2!13377 lt!423240 lt!423248))) (Some!488 (_2!6699 (tuple2!13377 lt!423240 lt!423248))))))

(assert (=> d!113431 (= lt!423520 (lemmaContainsTupThenGetReturnValue!259 lt!423519 (_1!6699 (tuple2!13377 lt!423240 lt!423248)) (_2!6699 (tuple2!13377 lt!423240 lt!423248))))))

(assert (=> d!113431 (= lt!423519 (insertStrictlySorted!316 (toList!6052 lt!423238) (_1!6699 (tuple2!13377 lt!423240 lt!423248)) (_2!6699 (tuple2!13377 lt!423240 lt!423248))))))

(assert (=> d!113431 (= (+!2840 lt!423238 (tuple2!13377 lt!423240 lt!423248)) lt!423521)))

(declare-fun b!938136 () Bool)

(declare-fun res!631245 () Bool)

(assert (=> b!938136 (=> (not res!631245) (not e!526838))))

(assert (=> b!938136 (= res!631245 (= (getValueByKey!483 (toList!6052 lt!423521) (_1!6699 (tuple2!13377 lt!423240 lt!423248))) (Some!488 (_2!6699 (tuple2!13377 lt!423240 lt!423248)))))))

(declare-fun b!938137 () Bool)

(assert (=> b!938137 (= e!526838 (contains!5114 (toList!6052 lt!423521) (tuple2!13377 lt!423240 lt!423248)))))

(assert (= (and d!113431 res!631244) b!938136))

(assert (= (and b!938136 res!631245) b!938137))

(declare-fun m!873063 () Bool)

(assert (=> d!113431 m!873063))

(declare-fun m!873065 () Bool)

(assert (=> d!113431 m!873065))

(declare-fun m!873067 () Bool)

(assert (=> d!113431 m!873067))

(declare-fun m!873069 () Bool)

(assert (=> d!113431 m!873069))

(declare-fun m!873071 () Bool)

(assert (=> b!938136 m!873071))

(declare-fun m!873073 () Bool)

(assert (=> b!938137 m!873073))

(assert (=> d!113341 d!113431))

(declare-fun d!113433 () Bool)

(assert (=> d!113433 (contains!5111 (+!2840 lt!423238 (tuple2!13377 lt!423240 lt!423248)) k0!1099)))

(assert (=> d!113433 true))

(declare-fun _$35!432 () Unit!31668)

(assert (=> d!113433 (= (choose!1555 lt!423238 lt!423240 lt!423248 k0!1099) _$35!432)))

(declare-fun bs!26312 () Bool)

(assert (= bs!26312 d!113433))

(assert (=> bs!26312 m!872805))

(assert (=> bs!26312 m!872805))

(assert (=> bs!26312 m!872809))

(assert (=> d!113341 d!113433))

(assert (=> d!113341 d!113367))

(assert (=> d!113327 d!113355))

(declare-fun d!113435 () Bool)

(declare-fun res!631247 () Bool)

(declare-fun e!526839 () Bool)

(assert (=> d!113435 (=> res!631247 e!526839)))

(assert (=> d!113435 (= res!631247 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(assert (=> d!113435 (= (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97678 (Cons!19151 (select (arr!27170 _keys!1487) #b00000000000000000000000000000000) Nil!19152) Nil!19152)) e!526839)))

(declare-fun b!938139 () Bool)

(declare-fun e!526841 () Bool)

(declare-fun call!40813 () Bool)

(assert (=> b!938139 (= e!526841 call!40813)))

(declare-fun b!938140 () Bool)

(declare-fun e!526840 () Bool)

(assert (=> b!938140 (= e!526839 e!526840)))

(declare-fun res!631248 () Bool)

(assert (=> b!938140 (=> (not res!631248) (not e!526840))))

(declare-fun e!526842 () Bool)

(assert (=> b!938140 (= res!631248 (not e!526842))))

(declare-fun res!631246 () Bool)

(assert (=> b!938140 (=> (not res!631246) (not e!526842))))

(assert (=> b!938140 (= res!631246 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!938141 () Bool)

(assert (=> b!938141 (= e!526841 call!40813)))

(declare-fun b!938142 () Bool)

(assert (=> b!938142 (= e!526840 e!526841)))

(declare-fun c!97733 () Bool)

(assert (=> b!938142 (= c!97733 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!938143 () Bool)

(assert (=> b!938143 (= e!526842 (contains!5113 (ite c!97678 (Cons!19151 (select (arr!27170 _keys!1487) #b00000000000000000000000000000000) Nil!19152) Nil!19152) (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!40810 () Bool)

(assert (=> bm!40810 (= call!40813 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!97733 (Cons!19151 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!97678 (Cons!19151 (select (arr!27170 _keys!1487) #b00000000000000000000000000000000) Nil!19152) Nil!19152)) (ite c!97678 (Cons!19151 (select (arr!27170 _keys!1487) #b00000000000000000000000000000000) Nil!19152) Nil!19152))))))

(assert (= (and d!113435 (not res!631247)) b!938140))

(assert (= (and b!938140 res!631246) b!938143))

(assert (= (and b!938140 res!631248) b!938142))

(assert (= (and b!938142 c!97733) b!938139))

(assert (= (and b!938142 (not c!97733)) b!938141))

(assert (= (or b!938139 b!938141) bm!40810))

(declare-fun m!873075 () Bool)

(assert (=> b!938140 m!873075))

(assert (=> b!938140 m!873075))

(declare-fun m!873077 () Bool)

(assert (=> b!938140 m!873077))

(assert (=> b!938142 m!873075))

(assert (=> b!938142 m!873075))

(assert (=> b!938142 m!873077))

(assert (=> b!938143 m!873075))

(assert (=> b!938143 m!873075))

(declare-fun m!873079 () Bool)

(assert (=> b!938143 m!873079))

(assert (=> bm!40810 m!873075))

(declare-fun m!873081 () Bool)

(assert (=> bm!40810 m!873081))

(assert (=> bm!40787 d!113435))

(assert (=> d!113329 d!113355))

(declare-fun b!938146 () Bool)

(declare-fun e!526844 () Option!489)

(assert (=> b!938146 (= e!526844 (getValueByKey!483 (t!27449 (toList!6052 lt!423389)) (_1!6699 lt!423246)))))

(declare-fun b!938145 () Bool)

(declare-fun e!526843 () Option!489)

(assert (=> b!938145 (= e!526843 e!526844)))

(declare-fun c!97735 () Bool)

(assert (=> b!938145 (= c!97735 (and ((_ is Cons!19150) (toList!6052 lt!423389)) (not (= (_1!6699 (h!20296 (toList!6052 lt!423389))) (_1!6699 lt!423246)))))))

(declare-fun b!938144 () Bool)

(assert (=> b!938144 (= e!526843 (Some!488 (_2!6699 (h!20296 (toList!6052 lt!423389)))))))

(declare-fun d!113437 () Bool)

(declare-fun c!97734 () Bool)

(assert (=> d!113437 (= c!97734 (and ((_ is Cons!19150) (toList!6052 lt!423389)) (= (_1!6699 (h!20296 (toList!6052 lt!423389))) (_1!6699 lt!423246))))))

(assert (=> d!113437 (= (getValueByKey!483 (toList!6052 lt!423389) (_1!6699 lt!423246)) e!526843)))

(declare-fun b!938147 () Bool)

(assert (=> b!938147 (= e!526844 None!487)))

(assert (= (and d!113437 c!97734) b!938144))

(assert (= (and d!113437 (not c!97734)) b!938145))

(assert (= (and b!938145 c!97735) b!938146))

(assert (= (and b!938145 (not c!97735)) b!938147))

(declare-fun m!873083 () Bool)

(assert (=> b!938146 m!873083))

(assert (=> b!937921 d!113437))

(declare-fun d!113439 () Bool)

(declare-fun res!631249 () Bool)

(declare-fun e!526845 () Bool)

(assert (=> d!113439 (=> res!631249 e!526845)))

(assert (=> d!113439 (= res!631249 (and ((_ is Cons!19150) (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) (= (_1!6699 (h!20296 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) k0!1099)))))

(assert (=> d!113439 (= (containsKey!450 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099) e!526845)))

(declare-fun b!938148 () Bool)

(declare-fun e!526846 () Bool)

(assert (=> b!938148 (= e!526845 e!526846)))

(declare-fun res!631250 () Bool)

(assert (=> b!938148 (=> (not res!631250) (not e!526846))))

(assert (=> b!938148 (= res!631250 (and (or (not ((_ is Cons!19150) (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) (bvsle (_1!6699 (h!20296 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) k0!1099)) ((_ is Cons!19150) (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) (bvslt (_1!6699 (h!20296 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) k0!1099)))))

(declare-fun b!938149 () Bool)

(assert (=> b!938149 (= e!526846 (containsKey!450 (t!27449 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) k0!1099))))

(assert (= (and d!113439 (not res!631249)) b!938148))

(assert (= (and b!938148 res!631250) b!938149))

(declare-fun m!873085 () Bool)

(assert (=> b!938149 m!873085))

(assert (=> d!113377 d!113439))

(declare-fun d!113441 () Bool)

(assert (=> d!113441 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423238) k0!1099))))

(declare-fun lt!423523 () Unit!31668)

(assert (=> d!113441 (= lt!423523 (choose!1557 (toList!6052 lt!423238) k0!1099))))

(declare-fun e!526847 () Bool)

(assert (=> d!113441 e!526847))

(declare-fun res!631251 () Bool)

(assert (=> d!113441 (=> (not res!631251) (not e!526847))))

(assert (=> d!113441 (= res!631251 (isStrictlySorted!503 (toList!6052 lt!423238)))))

(assert (=> d!113441 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 lt!423238) k0!1099) lt!423523)))

(declare-fun b!938150 () Bool)

(assert (=> b!938150 (= e!526847 (containsKey!450 (toList!6052 lt!423238) k0!1099))))

(assert (= (and d!113441 res!631251) b!938150))

(assert (=> d!113441 m!872865))

(assert (=> d!113441 m!872865))

(assert (=> d!113441 m!872867))

(declare-fun m!873087 () Bool)

(assert (=> d!113441 m!873087))

(declare-fun m!873089 () Bool)

(assert (=> d!113441 m!873089))

(assert (=> b!938150 m!872861))

(assert (=> b!937974 d!113441))

(declare-fun d!113443 () Bool)

(assert (=> d!113443 (= (isDefined!355 (getValueByKey!483 (toList!6052 lt!423238) k0!1099)) (not (isEmpty!696 (getValueByKey!483 (toList!6052 lt!423238) k0!1099))))))

(declare-fun bs!26313 () Bool)

(assert (= bs!26313 d!113443))

(assert (=> bs!26313 m!872865))

(declare-fun m!873091 () Bool)

(assert (=> bs!26313 m!873091))

(assert (=> b!937974 d!113443))

(assert (=> b!937974 d!113393))

(declare-fun b!938153 () Bool)

(declare-fun e!526849 () Option!489)

(assert (=> b!938153 (= e!526849 (getValueByKey!483 (t!27449 (toList!6052 lt!423405)) (_1!6699 lt!423246)))))

(declare-fun b!938152 () Bool)

(declare-fun e!526848 () Option!489)

(assert (=> b!938152 (= e!526848 e!526849)))

(declare-fun c!97737 () Bool)

(assert (=> b!938152 (= c!97737 (and ((_ is Cons!19150) (toList!6052 lt!423405)) (not (= (_1!6699 (h!20296 (toList!6052 lt!423405))) (_1!6699 lt!423246)))))))

(declare-fun b!938151 () Bool)

(assert (=> b!938151 (= e!526848 (Some!488 (_2!6699 (h!20296 (toList!6052 lt!423405)))))))

(declare-fun d!113445 () Bool)

(declare-fun c!97736 () Bool)

(assert (=> d!113445 (= c!97736 (and ((_ is Cons!19150) (toList!6052 lt!423405)) (= (_1!6699 (h!20296 (toList!6052 lt!423405))) (_1!6699 lt!423246))))))

(assert (=> d!113445 (= (getValueByKey!483 (toList!6052 lt!423405) (_1!6699 lt!423246)) e!526848)))

(declare-fun b!938154 () Bool)

(assert (=> b!938154 (= e!526849 None!487)))

(assert (= (and d!113445 c!97736) b!938151))

(assert (= (and d!113445 (not c!97736)) b!938152))

(assert (= (and b!938152 c!97737) b!938153))

(assert (= (and b!938152 (not c!97737)) b!938154))

(declare-fun m!873093 () Bool)

(assert (=> b!938153 m!873093))

(assert (=> b!937934 d!113445))

(assert (=> b!937976 d!113443))

(assert (=> b!937976 d!113393))

(declare-fun d!113447 () Bool)

(assert (=> d!113447 (= (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (and (not (= (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937913 d!113447))

(declare-fun d!113449 () Bool)

(declare-fun e!526850 () Bool)

(assert (=> d!113449 e!526850))

(declare-fun res!631252 () Bool)

(assert (=> d!113449 (=> res!631252 e!526850)))

(declare-fun lt!423524 () Bool)

(assert (=> d!113449 (= res!631252 (not lt!423524))))

(declare-fun lt!423527 () Bool)

(assert (=> d!113449 (= lt!423524 lt!423527)))

(declare-fun lt!423526 () Unit!31668)

(declare-fun e!526851 () Unit!31668)

(assert (=> d!113449 (= lt!423526 e!526851)))

(declare-fun c!97738 () Bool)

(assert (=> d!113449 (= c!97738 lt!423527)))

(assert (=> d!113449 (= lt!423527 (containsKey!450 (toList!6052 lt!423375) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113449 (= (contains!5111 lt!423375 #b1000000000000000000000000000000000000000000000000000000000000000) lt!423524)))

(declare-fun b!938155 () Bool)

(declare-fun lt!423525 () Unit!31668)

(assert (=> b!938155 (= e!526851 lt!423525)))

(assert (=> b!938155 (= lt!423525 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 lt!423375) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938155 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423375) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938156 () Bool)

(declare-fun Unit!31687 () Unit!31668)

(assert (=> b!938156 (= e!526851 Unit!31687)))

(declare-fun b!938157 () Bool)

(assert (=> b!938157 (= e!526850 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423375) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113449 c!97738) b!938155))

(assert (= (and d!113449 (not c!97738)) b!938156))

(assert (= (and d!113449 (not res!631252)) b!938157))

(declare-fun m!873095 () Bool)

(assert (=> d!113449 m!873095))

(declare-fun m!873097 () Bool)

(assert (=> b!938155 m!873097))

(declare-fun m!873099 () Bool)

(assert (=> b!938155 m!873099))

(assert (=> b!938155 m!873099))

(declare-fun m!873101 () Bool)

(assert (=> b!938155 m!873101))

(assert (=> b!938157 m!873099))

(assert (=> b!938157 m!873099))

(assert (=> b!938157 m!873101))

(assert (=> bm!40779 d!113449))

(declare-fun d!113451 () Bool)

(declare-fun e!526852 () Bool)

(assert (=> d!113451 e!526852))

(declare-fun res!631253 () Bool)

(assert (=> d!113451 (=> (not res!631253) (not e!526852))))

(declare-fun lt!423530 () ListLongMap!12073)

(assert (=> d!113451 (= res!631253 (contains!5111 lt!423530 (_1!6699 (tuple2!13377 lt!423342 minValue!1173))))))

(declare-fun lt!423528 () List!19154)

(assert (=> d!113451 (= lt!423530 (ListLongMap!12074 lt!423528))))

(declare-fun lt!423531 () Unit!31668)

(declare-fun lt!423529 () Unit!31668)

(assert (=> d!113451 (= lt!423531 lt!423529)))

(assert (=> d!113451 (= (getValueByKey!483 lt!423528 (_1!6699 (tuple2!13377 lt!423342 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423342 minValue!1173))))))

(assert (=> d!113451 (= lt!423529 (lemmaContainsTupThenGetReturnValue!259 lt!423528 (_1!6699 (tuple2!13377 lt!423342 minValue!1173)) (_2!6699 (tuple2!13377 lt!423342 minValue!1173))))))

(assert (=> d!113451 (= lt!423528 (insertStrictlySorted!316 (toList!6052 lt!423339) (_1!6699 (tuple2!13377 lt!423342 minValue!1173)) (_2!6699 (tuple2!13377 lt!423342 minValue!1173))))))

(assert (=> d!113451 (= (+!2840 lt!423339 (tuple2!13377 lt!423342 minValue!1173)) lt!423530)))

(declare-fun b!938158 () Bool)

(declare-fun res!631254 () Bool)

(assert (=> b!938158 (=> (not res!631254) (not e!526852))))

(assert (=> b!938158 (= res!631254 (= (getValueByKey!483 (toList!6052 lt!423530) (_1!6699 (tuple2!13377 lt!423342 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423342 minValue!1173)))))))

(declare-fun b!938159 () Bool)

(assert (=> b!938159 (= e!526852 (contains!5114 (toList!6052 lt!423530) (tuple2!13377 lt!423342 minValue!1173)))))

(assert (= (and d!113451 res!631253) b!938158))

(assert (= (and b!938158 res!631254) b!938159))

(declare-fun m!873103 () Bool)

(assert (=> d!113451 m!873103))

(declare-fun m!873105 () Bool)

(assert (=> d!113451 m!873105))

(declare-fun m!873107 () Bool)

(assert (=> d!113451 m!873107))

(declare-fun m!873109 () Bool)

(assert (=> d!113451 m!873109))

(declare-fun m!873111 () Bool)

(assert (=> b!938158 m!873111))

(declare-fun m!873113 () Bool)

(assert (=> b!938159 m!873113))

(assert (=> b!937874 d!113451))

(declare-fun d!113453 () Bool)

(assert (=> d!113453 (= (apply!853 lt!423348 lt!423350) (get!14330 (getValueByKey!483 (toList!6052 lt!423348) lt!423350)))))

(declare-fun bs!26314 () Bool)

(assert (= bs!26314 d!113453))

(declare-fun m!873115 () Bool)

(assert (=> bs!26314 m!873115))

(assert (=> bs!26314 m!873115))

(declare-fun m!873117 () Bool)

(assert (=> bs!26314 m!873117))

(assert (=> b!937874 d!113453))

(declare-fun d!113455 () Bool)

(assert (=> d!113455 (= (apply!853 (+!2840 lt!423339 (tuple2!13377 lt!423342 minValue!1173)) lt!423351) (get!14330 (getValueByKey!483 (toList!6052 (+!2840 lt!423339 (tuple2!13377 lt!423342 minValue!1173))) lt!423351)))))

(declare-fun bs!26315 () Bool)

(assert (= bs!26315 d!113455))

(declare-fun m!873119 () Bool)

(assert (=> bs!26315 m!873119))

(assert (=> bs!26315 m!873119))

(declare-fun m!873121 () Bool)

(assert (=> bs!26315 m!873121))

(assert (=> b!937874 d!113455))

(declare-fun d!113457 () Bool)

(assert (=> d!113457 (= (apply!853 lt!423339 lt!423351) (get!14330 (getValueByKey!483 (toList!6052 lt!423339) lt!423351)))))

(declare-fun bs!26316 () Bool)

(assert (= bs!26316 d!113457))

(declare-fun m!873123 () Bool)

(assert (=> bs!26316 m!873123))

(assert (=> bs!26316 m!873123))

(declare-fun m!873125 () Bool)

(assert (=> bs!26316 m!873125))

(assert (=> b!937874 d!113457))

(declare-fun d!113459 () Bool)

(assert (=> d!113459 (= (apply!853 (+!2840 lt!423339 (tuple2!13377 lt!423342 minValue!1173)) lt!423351) (apply!853 lt!423339 lt!423351))))

(declare-fun lt!423532 () Unit!31668)

(assert (=> d!113459 (= lt!423532 (choose!1554 lt!423339 lt!423342 minValue!1173 lt!423351))))

(declare-fun e!526853 () Bool)

(assert (=> d!113459 e!526853))

(declare-fun res!631255 () Bool)

(assert (=> d!113459 (=> (not res!631255) (not e!526853))))

(assert (=> d!113459 (= res!631255 (contains!5111 lt!423339 lt!423351))))

(assert (=> d!113459 (= (addApplyDifferent!439 lt!423339 lt!423342 minValue!1173 lt!423351) lt!423532)))

(declare-fun b!938160 () Bool)

(assert (=> b!938160 (= e!526853 (not (= lt!423351 lt!423342)))))

(assert (= (and d!113459 res!631255) b!938160))

(declare-fun m!873127 () Bool)

(assert (=> d!113459 m!873127))

(assert (=> d!113459 m!872687))

(assert (=> d!113459 m!872697))

(assert (=> d!113459 m!872687))

(assert (=> d!113459 m!872679))

(declare-fun m!873129 () Bool)

(assert (=> d!113459 m!873129))

(assert (=> b!937874 d!113459))

(declare-fun d!113461 () Bool)

(declare-fun e!526854 () Bool)

(assert (=> d!113461 e!526854))

(declare-fun res!631256 () Bool)

(assert (=> d!113461 (=> res!631256 e!526854)))

(declare-fun lt!423533 () Bool)

(assert (=> d!113461 (= res!631256 (not lt!423533))))

(declare-fun lt!423536 () Bool)

(assert (=> d!113461 (= lt!423533 lt!423536)))

(declare-fun lt!423535 () Unit!31668)

(declare-fun e!526855 () Unit!31668)

(assert (=> d!113461 (= lt!423535 e!526855)))

(declare-fun c!97739 () Bool)

(assert (=> d!113461 (= c!97739 lt!423536)))

(assert (=> d!113461 (= lt!423536 (containsKey!450 (toList!6052 (+!2840 lt!423336 (tuple2!13377 lt!423345 zeroValue!1173))) lt!423346))))

(assert (=> d!113461 (= (contains!5111 (+!2840 lt!423336 (tuple2!13377 lt!423345 zeroValue!1173)) lt!423346) lt!423533)))

(declare-fun b!938161 () Bool)

(declare-fun lt!423534 () Unit!31668)

(assert (=> b!938161 (= e!526855 lt!423534)))

(assert (=> b!938161 (= lt!423534 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 (+!2840 lt!423336 (tuple2!13377 lt!423345 zeroValue!1173))) lt!423346))))

(assert (=> b!938161 (isDefined!355 (getValueByKey!483 (toList!6052 (+!2840 lt!423336 (tuple2!13377 lt!423345 zeroValue!1173))) lt!423346))))

(declare-fun b!938162 () Bool)

(declare-fun Unit!31688 () Unit!31668)

(assert (=> b!938162 (= e!526855 Unit!31688)))

(declare-fun b!938163 () Bool)

(assert (=> b!938163 (= e!526854 (isDefined!355 (getValueByKey!483 (toList!6052 (+!2840 lt!423336 (tuple2!13377 lt!423345 zeroValue!1173))) lt!423346)))))

(assert (= (and d!113461 c!97739) b!938161))

(assert (= (and d!113461 (not c!97739)) b!938162))

(assert (= (and d!113461 (not res!631256)) b!938163))

(declare-fun m!873131 () Bool)

(assert (=> d!113461 m!873131))

(declare-fun m!873133 () Bool)

(assert (=> b!938161 m!873133))

(declare-fun m!873135 () Bool)

(assert (=> b!938161 m!873135))

(assert (=> b!938161 m!873135))

(declare-fun m!873137 () Bool)

(assert (=> b!938161 m!873137))

(assert (=> b!938163 m!873135))

(assert (=> b!938163 m!873135))

(assert (=> b!938163 m!873137))

(assert (=> b!937874 d!113461))

(declare-fun d!113463 () Bool)

(declare-fun e!526856 () Bool)

(assert (=> d!113463 e!526856))

(declare-fun res!631257 () Bool)

(assert (=> d!113463 (=> (not res!631257) (not e!526856))))

(declare-fun lt!423539 () ListLongMap!12073)

(assert (=> d!113463 (= res!631257 (contains!5111 lt!423539 (_1!6699 (tuple2!13377 lt!423349 minValue!1173))))))

(declare-fun lt!423537 () List!19154)

(assert (=> d!113463 (= lt!423539 (ListLongMap!12074 lt!423537))))

(declare-fun lt!423540 () Unit!31668)

(declare-fun lt!423538 () Unit!31668)

(assert (=> d!113463 (= lt!423540 lt!423538)))

(assert (=> d!113463 (= (getValueByKey!483 lt!423537 (_1!6699 (tuple2!13377 lt!423349 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423349 minValue!1173))))))

(assert (=> d!113463 (= lt!423538 (lemmaContainsTupThenGetReturnValue!259 lt!423537 (_1!6699 (tuple2!13377 lt!423349 minValue!1173)) (_2!6699 (tuple2!13377 lt!423349 minValue!1173))))))

(assert (=> d!113463 (= lt!423537 (insertStrictlySorted!316 (toList!6052 lt!423348) (_1!6699 (tuple2!13377 lt!423349 minValue!1173)) (_2!6699 (tuple2!13377 lt!423349 minValue!1173))))))

(assert (=> d!113463 (= (+!2840 lt!423348 (tuple2!13377 lt!423349 minValue!1173)) lt!423539)))

(declare-fun b!938164 () Bool)

(declare-fun res!631258 () Bool)

(assert (=> b!938164 (=> (not res!631258) (not e!526856))))

(assert (=> b!938164 (= res!631258 (= (getValueByKey!483 (toList!6052 lt!423539) (_1!6699 (tuple2!13377 lt!423349 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423349 minValue!1173)))))))

(declare-fun b!938165 () Bool)

(assert (=> b!938165 (= e!526856 (contains!5114 (toList!6052 lt!423539) (tuple2!13377 lt!423349 minValue!1173)))))

(assert (= (and d!113463 res!631257) b!938164))

(assert (= (and b!938164 res!631258) b!938165))

(declare-fun m!873139 () Bool)

(assert (=> d!113463 m!873139))

(declare-fun m!873141 () Bool)

(assert (=> d!113463 m!873141))

(declare-fun m!873143 () Bool)

(assert (=> d!113463 m!873143))

(declare-fun m!873145 () Bool)

(assert (=> d!113463 m!873145))

(declare-fun m!873147 () Bool)

(assert (=> b!938164 m!873147))

(declare-fun m!873149 () Bool)

(assert (=> b!938165 m!873149))

(assert (=> b!937874 d!113463))

(declare-fun d!113465 () Bool)

(assert (=> d!113465 (= (apply!853 (+!2840 lt!423348 (tuple2!13377 lt!423349 minValue!1173)) lt!423350) (get!14330 (getValueByKey!483 (toList!6052 (+!2840 lt!423348 (tuple2!13377 lt!423349 minValue!1173))) lt!423350)))))

(declare-fun bs!26317 () Bool)

(assert (= bs!26317 d!113465))

(declare-fun m!873151 () Bool)

(assert (=> bs!26317 m!873151))

(assert (=> bs!26317 m!873151))

(declare-fun m!873153 () Bool)

(assert (=> bs!26317 m!873153))

(assert (=> b!937874 d!113465))

(declare-fun d!113467 () Bool)

(assert (=> d!113467 (= (apply!853 lt!423337 lt!423340) (get!14330 (getValueByKey!483 (toList!6052 lt!423337) lt!423340)))))

(declare-fun bs!26318 () Bool)

(assert (= bs!26318 d!113467))

(declare-fun m!873155 () Bool)

(assert (=> bs!26318 m!873155))

(assert (=> bs!26318 m!873155))

(declare-fun m!873157 () Bool)

(assert (=> bs!26318 m!873157))

(assert (=> b!937874 d!113467))

(declare-fun d!113469 () Bool)

(assert (=> d!113469 (= (apply!853 (+!2840 lt!423348 (tuple2!13377 lt!423349 minValue!1173)) lt!423350) (apply!853 lt!423348 lt!423350))))

(declare-fun lt!423541 () Unit!31668)

(assert (=> d!113469 (= lt!423541 (choose!1554 lt!423348 lt!423349 minValue!1173 lt!423350))))

(declare-fun e!526857 () Bool)

(assert (=> d!113469 e!526857))

(declare-fun res!631259 () Bool)

(assert (=> d!113469 (=> (not res!631259) (not e!526857))))

(assert (=> d!113469 (= res!631259 (contains!5111 lt!423348 lt!423350))))

(assert (=> d!113469 (= (addApplyDifferent!439 lt!423348 lt!423349 minValue!1173 lt!423350) lt!423541)))

(declare-fun b!938166 () Bool)

(assert (=> b!938166 (= e!526857 (not (= lt!423350 lt!423349)))))

(assert (= (and d!113469 res!631259) b!938166))

(declare-fun m!873159 () Bool)

(assert (=> d!113469 m!873159))

(assert (=> d!113469 m!872671))

(assert (=> d!113469 m!872689))

(assert (=> d!113469 m!872671))

(assert (=> d!113469 m!872701))

(declare-fun m!873161 () Bool)

(assert (=> d!113469 m!873161))

(assert (=> b!937874 d!113469))

(declare-fun call!40814 () ListLongMap!12073)

(declare-fun bm!40811 () Bool)

(assert (=> bm!40811 (= call!40814 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!938167 () Bool)

(declare-fun e!526861 () Bool)

(declare-fun e!526858 () Bool)

(assert (=> b!938167 (= e!526861 e!526858)))

(declare-fun c!97740 () Bool)

(declare-fun e!526864 () Bool)

(assert (=> b!938167 (= c!97740 e!526864)))

(declare-fun res!631260 () Bool)

(assert (=> b!938167 (=> (not res!631260) (not e!526864))))

(assert (=> b!938167 (= res!631260 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(declare-fun b!938168 () Bool)

(declare-fun e!526862 () ListLongMap!12073)

(declare-fun e!526859 () ListLongMap!12073)

(assert (=> b!938168 (= e!526862 e!526859)))

(declare-fun c!97742 () Bool)

(assert (=> b!938168 (= c!97742 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938169 () Bool)

(declare-fun res!631263 () Bool)

(assert (=> b!938169 (=> (not res!631263) (not e!526861))))

(declare-fun lt!423546 () ListLongMap!12073)

(assert (=> b!938169 (= res!631263 (not (contains!5111 lt!423546 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!113471 () Bool)

(assert (=> d!113471 e!526861))

(declare-fun res!631262 () Bool)

(assert (=> d!113471 (=> (not res!631262) (not e!526861))))

(assert (=> d!113471 (= res!631262 (not (contains!5111 lt!423546 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!113471 (= lt!423546 e!526862)))

(declare-fun c!97743 () Bool)

(assert (=> d!113471 (= c!97743 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(assert (=> d!113471 (validMask!0 mask!1881)))

(assert (=> d!113471 (= (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!423546)))

(declare-fun b!938170 () Bool)

(declare-fun e!526863 () Bool)

(assert (=> b!938170 (= e!526858 e!526863)))

(declare-fun c!97741 () Bool)

(assert (=> b!938170 (= c!97741 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(declare-fun b!938171 () Bool)

(assert (=> b!938171 (= e!526862 (ListLongMap!12074 Nil!19151))))

(declare-fun b!938172 () Bool)

(assert (=> b!938172 (= e!526859 call!40814)))

(declare-fun b!938173 () Bool)

(assert (=> b!938173 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(assert (=> b!938173 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27628 _values!1231)))))

(declare-fun e!526860 () Bool)

(assert (=> b!938173 (= e!526860 (= (apply!853 lt!423546 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!938174 () Bool)

(assert (=> b!938174 (= e!526863 (= lt!423546 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!938175 () Bool)

(assert (=> b!938175 (= e!526863 (isEmpty!697 lt!423546))))

(declare-fun b!938176 () Bool)

(assert (=> b!938176 (= e!526864 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938176 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!938177 () Bool)

(assert (=> b!938177 (= e!526858 e!526860)))

(assert (=> b!938177 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(declare-fun res!631261 () Bool)

(assert (=> b!938177 (= res!631261 (contains!5111 lt!423546 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938177 (=> (not res!631261) (not e!526860))))

(declare-fun b!938178 () Bool)

(declare-fun lt!423542 () Unit!31668)

(declare-fun lt!423543 () Unit!31668)

(assert (=> b!938178 (= lt!423542 lt!423543)))

(declare-fun lt!423544 () V!31977)

(declare-fun lt!423548 () ListLongMap!12073)

(declare-fun lt!423545 () (_ BitVec 64))

(declare-fun lt!423547 () (_ BitVec 64))

(assert (=> b!938178 (not (contains!5111 (+!2840 lt!423548 (tuple2!13377 lt!423545 lt!423544)) lt!423547))))

(assert (=> b!938178 (= lt!423543 (addStillNotContains!220 lt!423548 lt!423545 lt!423544 lt!423547))))

(assert (=> b!938178 (= lt!423547 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!938178 (= lt!423544 (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!938178 (= lt!423545 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!938178 (= lt!423548 call!40814)))

(assert (=> b!938178 (= e!526859 (+!2840 call!40814 (tuple2!13377 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!113471 c!97743) b!938171))

(assert (= (and d!113471 (not c!97743)) b!938168))

(assert (= (and b!938168 c!97742) b!938178))

(assert (= (and b!938168 (not c!97742)) b!938172))

(assert (= (or b!938178 b!938172) bm!40811))

(assert (= (and d!113471 res!631262) b!938169))

(assert (= (and b!938169 res!631263) b!938167))

(assert (= (and b!938167 res!631260) b!938176))

(assert (= (and b!938167 c!97740) b!938177))

(assert (= (and b!938167 (not c!97740)) b!938170))

(assert (= (and b!938177 res!631261) b!938173))

(assert (= (and b!938170 c!97741) b!938174))

(assert (= (and b!938170 (not c!97741)) b!938175))

(declare-fun b_lambda!14183 () Bool)

(assert (=> (not b_lambda!14183) (not b!938173)))

(assert (=> b!938173 t!27448))

(declare-fun b_and!29113 () Bool)

(assert (= b_and!29111 (and (=> t!27448 result!12123) b_and!29113)))

(declare-fun b_lambda!14185 () Bool)

(assert (=> (not b_lambda!14185) (not b!938178)))

(assert (=> b!938178 t!27448))

(declare-fun b_and!29115 () Bool)

(assert (= b_and!29113 (and (=> t!27448 result!12123) b_and!29115)))

(assert (=> b!938176 m!872599))

(assert (=> b!938176 m!872599))

(assert (=> b!938176 m!872715))

(assert (=> b!938168 m!872599))

(assert (=> b!938168 m!872599))

(assert (=> b!938168 m!872715))

(assert (=> b!938173 m!872565))

(assert (=> b!938173 m!872569))

(assert (=> b!938173 m!872571))

(assert (=> b!938173 m!872565))

(assert (=> b!938173 m!872599))

(declare-fun m!873163 () Bool)

(assert (=> b!938173 m!873163))

(assert (=> b!938173 m!872599))

(assert (=> b!938173 m!872569))

(declare-fun m!873165 () Bool)

(assert (=> b!938175 m!873165))

(assert (=> b!938177 m!872599))

(assert (=> b!938177 m!872599))

(declare-fun m!873167 () Bool)

(assert (=> b!938177 m!873167))

(declare-fun m!873169 () Bool)

(assert (=> bm!40811 m!873169))

(assert (=> b!938174 m!873169))

(assert (=> b!938178 m!872565))

(assert (=> b!938178 m!872569))

(assert (=> b!938178 m!872571))

(assert (=> b!938178 m!872565))

(declare-fun m!873171 () Bool)

(assert (=> b!938178 m!873171))

(declare-fun m!873173 () Bool)

(assert (=> b!938178 m!873173))

(assert (=> b!938178 m!873173))

(declare-fun m!873175 () Bool)

(assert (=> b!938178 m!873175))

(assert (=> b!938178 m!872599))

(assert (=> b!938178 m!872569))

(declare-fun m!873177 () Bool)

(assert (=> b!938178 m!873177))

(declare-fun m!873179 () Bool)

(assert (=> d!113471 m!873179))

(assert (=> d!113471 m!872555))

(declare-fun m!873181 () Bool)

(assert (=> b!938169 m!873181))

(assert (=> b!937874 d!113471))

(declare-fun d!113473 () Bool)

(declare-fun e!526865 () Bool)

(assert (=> d!113473 e!526865))

(declare-fun res!631264 () Bool)

(assert (=> d!113473 (=> (not res!631264) (not e!526865))))

(declare-fun lt!423551 () ListLongMap!12073)

(assert (=> d!113473 (= res!631264 (contains!5111 lt!423551 (_1!6699 (tuple2!13377 lt!423345 zeroValue!1173))))))

(declare-fun lt!423549 () List!19154)

(assert (=> d!113473 (= lt!423551 (ListLongMap!12074 lt!423549))))

(declare-fun lt!423552 () Unit!31668)

(declare-fun lt!423550 () Unit!31668)

(assert (=> d!113473 (= lt!423552 lt!423550)))

(assert (=> d!113473 (= (getValueByKey!483 lt!423549 (_1!6699 (tuple2!13377 lt!423345 zeroValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423345 zeroValue!1173))))))

(assert (=> d!113473 (= lt!423550 (lemmaContainsTupThenGetReturnValue!259 lt!423549 (_1!6699 (tuple2!13377 lt!423345 zeroValue!1173)) (_2!6699 (tuple2!13377 lt!423345 zeroValue!1173))))))

(assert (=> d!113473 (= lt!423549 (insertStrictlySorted!316 (toList!6052 lt!423336) (_1!6699 (tuple2!13377 lt!423345 zeroValue!1173)) (_2!6699 (tuple2!13377 lt!423345 zeroValue!1173))))))

(assert (=> d!113473 (= (+!2840 lt!423336 (tuple2!13377 lt!423345 zeroValue!1173)) lt!423551)))

(declare-fun b!938179 () Bool)

(declare-fun res!631265 () Bool)

(assert (=> b!938179 (=> (not res!631265) (not e!526865))))

(assert (=> b!938179 (= res!631265 (= (getValueByKey!483 (toList!6052 lt!423551) (_1!6699 (tuple2!13377 lt!423345 zeroValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423345 zeroValue!1173)))))))

(declare-fun b!938180 () Bool)

(assert (=> b!938180 (= e!526865 (contains!5114 (toList!6052 lt!423551) (tuple2!13377 lt!423345 zeroValue!1173)))))

(assert (= (and d!113473 res!631264) b!938179))

(assert (= (and b!938179 res!631265) b!938180))

(declare-fun m!873183 () Bool)

(assert (=> d!113473 m!873183))

(declare-fun m!873185 () Bool)

(assert (=> d!113473 m!873185))

(declare-fun m!873187 () Bool)

(assert (=> d!113473 m!873187))

(declare-fun m!873189 () Bool)

(assert (=> d!113473 m!873189))

(declare-fun m!873191 () Bool)

(assert (=> b!938179 m!873191))

(declare-fun m!873193 () Bool)

(assert (=> b!938180 m!873193))

(assert (=> b!937874 d!113473))

(declare-fun d!113475 () Bool)

(assert (=> d!113475 (= (apply!853 (+!2840 lt!423337 (tuple2!13377 lt!423333 zeroValue!1173)) lt!423340) (get!14330 (getValueByKey!483 (toList!6052 (+!2840 lt!423337 (tuple2!13377 lt!423333 zeroValue!1173))) lt!423340)))))

(declare-fun bs!26319 () Bool)

(assert (= bs!26319 d!113475))

(declare-fun m!873195 () Bool)

(assert (=> bs!26319 m!873195))

(assert (=> bs!26319 m!873195))

(declare-fun m!873197 () Bool)

(assert (=> bs!26319 m!873197))

(assert (=> b!937874 d!113475))

(declare-fun d!113477 () Bool)

(declare-fun e!526866 () Bool)

(assert (=> d!113477 e!526866))

(declare-fun res!631266 () Bool)

(assert (=> d!113477 (=> (not res!631266) (not e!526866))))

(declare-fun lt!423555 () ListLongMap!12073)

(assert (=> d!113477 (= res!631266 (contains!5111 lt!423555 (_1!6699 (tuple2!13377 lt!423333 zeroValue!1173))))))

(declare-fun lt!423553 () List!19154)

(assert (=> d!113477 (= lt!423555 (ListLongMap!12074 lt!423553))))

(declare-fun lt!423556 () Unit!31668)

(declare-fun lt!423554 () Unit!31668)

(assert (=> d!113477 (= lt!423556 lt!423554)))

(assert (=> d!113477 (= (getValueByKey!483 lt!423553 (_1!6699 (tuple2!13377 lt!423333 zeroValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423333 zeroValue!1173))))))

(assert (=> d!113477 (= lt!423554 (lemmaContainsTupThenGetReturnValue!259 lt!423553 (_1!6699 (tuple2!13377 lt!423333 zeroValue!1173)) (_2!6699 (tuple2!13377 lt!423333 zeroValue!1173))))))

(assert (=> d!113477 (= lt!423553 (insertStrictlySorted!316 (toList!6052 lt!423337) (_1!6699 (tuple2!13377 lt!423333 zeroValue!1173)) (_2!6699 (tuple2!13377 lt!423333 zeroValue!1173))))))

(assert (=> d!113477 (= (+!2840 lt!423337 (tuple2!13377 lt!423333 zeroValue!1173)) lt!423555)))

(declare-fun b!938181 () Bool)

(declare-fun res!631267 () Bool)

(assert (=> b!938181 (=> (not res!631267) (not e!526866))))

(assert (=> b!938181 (= res!631267 (= (getValueByKey!483 (toList!6052 lt!423555) (_1!6699 (tuple2!13377 lt!423333 zeroValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423333 zeroValue!1173)))))))

(declare-fun b!938182 () Bool)

(assert (=> b!938182 (= e!526866 (contains!5114 (toList!6052 lt!423555) (tuple2!13377 lt!423333 zeroValue!1173)))))

(assert (= (and d!113477 res!631266) b!938181))

(assert (= (and b!938181 res!631267) b!938182))

(declare-fun m!873199 () Bool)

(assert (=> d!113477 m!873199))

(declare-fun m!873201 () Bool)

(assert (=> d!113477 m!873201))

(declare-fun m!873203 () Bool)

(assert (=> d!113477 m!873203))

(declare-fun m!873205 () Bool)

(assert (=> d!113477 m!873205))

(declare-fun m!873207 () Bool)

(assert (=> b!938181 m!873207))

(declare-fun m!873209 () Bool)

(assert (=> b!938182 m!873209))

(assert (=> b!937874 d!113477))

(declare-fun d!113479 () Bool)

(assert (=> d!113479 (= (apply!853 (+!2840 lt!423337 (tuple2!13377 lt!423333 zeroValue!1173)) lt!423340) (apply!853 lt!423337 lt!423340))))

(declare-fun lt!423557 () Unit!31668)

(assert (=> d!113479 (= lt!423557 (choose!1554 lt!423337 lt!423333 zeroValue!1173 lt!423340))))

(declare-fun e!526867 () Bool)

(assert (=> d!113479 e!526867))

(declare-fun res!631268 () Bool)

(assert (=> d!113479 (=> (not res!631268) (not e!526867))))

(assert (=> d!113479 (= res!631268 (contains!5111 lt!423337 lt!423340))))

(assert (=> d!113479 (= (addApplyDifferent!439 lt!423337 lt!423333 zeroValue!1173 lt!423340) lt!423557)))

(declare-fun b!938183 () Bool)

(assert (=> b!938183 (= e!526867 (not (= lt!423340 lt!423333)))))

(assert (= (and d!113479 res!631268) b!938183))

(declare-fun m!873211 () Bool)

(assert (=> d!113479 m!873211))

(assert (=> d!113479 m!872695))

(assert (=> d!113479 m!872699))

(assert (=> d!113479 m!872695))

(assert (=> d!113479 m!872693))

(declare-fun m!873213 () Bool)

(assert (=> d!113479 m!873213))

(assert (=> b!937874 d!113479))

(declare-fun d!113481 () Bool)

(assert (=> d!113481 (contains!5111 (+!2840 lt!423336 (tuple2!13377 lt!423345 zeroValue!1173)) lt!423346)))

(declare-fun lt!423558 () Unit!31668)

(assert (=> d!113481 (= lt!423558 (choose!1555 lt!423336 lt!423345 zeroValue!1173 lt!423346))))

(assert (=> d!113481 (contains!5111 lt!423336 lt!423346)))

(assert (=> d!113481 (= (addStillContains!559 lt!423336 lt!423345 zeroValue!1173 lt!423346) lt!423558)))

(declare-fun bs!26320 () Bool)

(assert (= bs!26320 d!113481))

(assert (=> bs!26320 m!872675))

(assert (=> bs!26320 m!872675))

(assert (=> bs!26320 m!872691))

(declare-fun m!873215 () Bool)

(assert (=> bs!26320 m!873215))

(declare-fun m!873217 () Bool)

(assert (=> bs!26320 m!873217))

(assert (=> b!937874 d!113481))

(assert (=> b!937915 d!113447))

(declare-fun d!113483 () Bool)

(assert (=> d!113483 (= (apply!853 lt!423375 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14330 (getValueByKey!483 (toList!6052 lt!423375) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26321 () Bool)

(assert (= bs!26321 d!113483))

(assert (=> bs!26321 m!873051))

(assert (=> bs!26321 m!873051))

(declare-fun m!873219 () Bool)

(assert (=> bs!26321 m!873219))

(assert (=> b!937886 d!113483))

(declare-fun d!113485 () Bool)

(declare-fun e!526868 () Bool)

(assert (=> d!113485 e!526868))

(declare-fun res!631269 () Bool)

(assert (=> d!113485 (=> (not res!631269) (not e!526868))))

(declare-fun lt!423561 () ListLongMap!12073)

(assert (=> d!113485 (= res!631269 (contains!5111 lt!423561 (_1!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!423559 () List!19154)

(assert (=> d!113485 (= lt!423561 (ListLongMap!12074 lt!423559))))

(declare-fun lt!423562 () Unit!31668)

(declare-fun lt!423560 () Unit!31668)

(assert (=> d!113485 (= lt!423562 lt!423560)))

(assert (=> d!113485 (= (getValueByKey!483 lt!423559 (_1!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113485 (= lt!423560 (lemmaContainsTupThenGetReturnValue!259 lt!423559 (_1!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113485 (= lt!423559 (insertStrictlySorted!316 (toList!6052 call!40775) (_1!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113485 (= (+!2840 call!40775 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!423561)))

(declare-fun b!938184 () Bool)

(declare-fun res!631270 () Bool)

(assert (=> b!938184 (=> (not res!631270) (not e!526868))))

(assert (=> b!938184 (= res!631270 (= (getValueByKey!483 (toList!6052 lt!423561) (_1!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!938185 () Bool)

(assert (=> b!938185 (= e!526868 (contains!5114 (toList!6052 lt!423561) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113485 res!631269) b!938184))

(assert (= (and b!938184 res!631270) b!938185))

(declare-fun m!873221 () Bool)

(assert (=> d!113485 m!873221))

(declare-fun m!873223 () Bool)

(assert (=> d!113485 m!873223))

(declare-fun m!873225 () Bool)

(assert (=> d!113485 m!873225))

(declare-fun m!873227 () Bool)

(assert (=> d!113485 m!873227))

(declare-fun m!873229 () Bool)

(assert (=> b!938184 m!873229))

(declare-fun m!873231 () Bool)

(assert (=> b!938185 m!873231))

(assert (=> b!937876 d!113485))

(declare-fun d!113487 () Bool)

(declare-fun res!631272 () Bool)

(declare-fun e!526869 () Bool)

(assert (=> d!113487 (=> res!631272 e!526869)))

(assert (=> d!113487 (= res!631272 (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(assert (=> d!113487 (= (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97668 (Cons!19151 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19152) Nil!19152)) e!526869)))

(declare-fun b!938186 () Bool)

(declare-fun e!526871 () Bool)

(declare-fun call!40815 () Bool)

(assert (=> b!938186 (= e!526871 call!40815)))

(declare-fun b!938187 () Bool)

(declare-fun e!526870 () Bool)

(assert (=> b!938187 (= e!526869 e!526870)))

(declare-fun res!631273 () Bool)

(assert (=> b!938187 (=> (not res!631273) (not e!526870))))

(declare-fun e!526872 () Bool)

(assert (=> b!938187 (= res!631273 (not e!526872))))

(declare-fun res!631271 () Bool)

(assert (=> b!938187 (=> (not res!631271) (not e!526872))))

(assert (=> b!938187 (= res!631271 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!938188 () Bool)

(assert (=> b!938188 (= e!526871 call!40815)))

(declare-fun b!938189 () Bool)

(assert (=> b!938189 (= e!526870 e!526871)))

(declare-fun c!97744 () Bool)

(assert (=> b!938189 (= c!97744 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!938190 () Bool)

(assert (=> b!938190 (= e!526872 (contains!5113 (ite c!97668 (Cons!19151 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19152) Nil!19152) (select (arr!27170 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun bm!40812 () Bool)

(assert (=> bm!40812 (= call!40815 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!97744 (Cons!19151 (select (arr!27170 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (ite c!97668 (Cons!19151 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19152) Nil!19152)) (ite c!97668 (Cons!19151 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19152) Nil!19152))))))

(assert (= (and d!113487 (not res!631272)) b!938187))

(assert (= (and b!938187 res!631271) b!938190))

(assert (= (and b!938187 res!631273) b!938189))

(assert (= (and b!938189 c!97744) b!938186))

(assert (= (and b!938189 (not c!97744)) b!938188))

(assert (= (or b!938186 b!938188) bm!40812))

(declare-fun m!873233 () Bool)

(assert (=> b!938187 m!873233))

(assert (=> b!938187 m!873233))

(declare-fun m!873235 () Bool)

(assert (=> b!938187 m!873235))

(assert (=> b!938189 m!873233))

(assert (=> b!938189 m!873233))

(assert (=> b!938189 m!873235))

(assert (=> b!938190 m!873233))

(assert (=> b!938190 m!873233))

(declare-fun m!873237 () Bool)

(assert (=> b!938190 m!873237))

(assert (=> bm!40812 m!873233))

(declare-fun m!873239 () Bool)

(assert (=> bm!40812 m!873239))

(assert (=> bm!40786 d!113487))

(declare-fun d!113489 () Bool)

(declare-fun res!631274 () Bool)

(declare-fun e!526873 () Bool)

(assert (=> d!113489 (=> res!631274 e!526873)))

(assert (=> d!113489 (= res!631274 (= (select (arr!27170 _keys!1487) (bvadd from!1844 #b00000000000000000000000000000001)) k0!1099))))

(assert (=> d!113489 (= (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)) e!526873)))

(declare-fun b!938191 () Bool)

(declare-fun e!526874 () Bool)

(assert (=> b!938191 (= e!526873 e!526874)))

(declare-fun res!631275 () Bool)

(assert (=> b!938191 (=> (not res!631275) (not e!526874))))

(assert (=> b!938191 (= res!631275 (bvslt (bvadd from!1844 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(declare-fun b!938192 () Bool)

(assert (=> b!938192 (= e!526874 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!113489 (not res!631274)) b!938191))

(assert (= (and b!938191 res!631275) b!938192))

(declare-fun m!873241 () Bool)

(assert (=> d!113489 m!873241))

(declare-fun m!873243 () Bool)

(assert (=> b!938192 m!873243))

(assert (=> b!937973 d!113489))

(declare-fun d!113491 () Bool)

(assert (=> d!113491 (= (apply!853 lt!423375 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14330 (getValueByKey!483 (toList!6052 lt!423375) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26322 () Bool)

(assert (= bs!26322 d!113491))

(assert (=> bs!26322 m!873099))

(assert (=> bs!26322 m!873099))

(declare-fun m!873245 () Bool)

(assert (=> bs!26322 m!873245))

(assert (=> b!937888 d!113491))

(assert (=> b!937863 d!113447))

(declare-fun d!113493 () Bool)

(assert (=> d!113493 (= (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2840 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13377 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!113493 true))

(declare-fun _$20!31 () Unit!31668)

(assert (=> d!113493 (= (choose!1553 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) _$20!31)))

(declare-fun b_lambda!14187 () Bool)

(assert (=> (not b_lambda!14187) (not d!113493)))

(assert (=> d!113493 t!27448))

(declare-fun b_and!29117 () Bool)

(assert (= b_and!29115 (and (=> t!27448 result!12123) b_and!29117)))

(assert (=> d!113493 m!872573))

(assert (=> d!113493 m!872783))

(assert (=> d!113493 m!872785))

(assert (=> d!113493 m!872783))

(assert (=> d!113493 m!872599))

(assert (=> d!113493 m!872569))

(assert (=> d!113493 m!872565))

(assert (=> d!113493 m!872565))

(assert (=> d!113493 m!872569))

(assert (=> d!113493 m!872571))

(assert (=> d!113333 d!113493))

(assert (=> d!113333 d!113355))

(declare-fun d!113495 () Bool)

(assert (=> d!113495 (= (apply!853 lt!423456 (select (arr!27170 _keys!1487) from!1844)) (get!14330 (getValueByKey!483 (toList!6052 lt!423456) (select (arr!27170 _keys!1487) from!1844))))))

(declare-fun bs!26323 () Bool)

(assert (= bs!26323 d!113495))

(assert (=> bs!26323 m!872857))

(declare-fun m!873247 () Bool)

(assert (=> bs!26323 m!873247))

(assert (=> bs!26323 m!873247))

(declare-fun m!873249 () Bool)

(assert (=> bs!26323 m!873249))

(assert (=> b!937995 d!113495))

(declare-fun d!113497 () Bool)

(declare-fun c!97745 () Bool)

(assert (=> d!113497 (= c!97745 ((_ is ValueCellFull!9648) (select (arr!27169 _values!1231) from!1844)))))

(declare-fun e!526875 () V!31977)

(assert (=> d!113497 (= (get!14328 (select (arr!27169 _values!1231) from!1844) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!526875)))

(declare-fun b!938193 () Bool)

(assert (=> b!938193 (= e!526875 (get!14331 (select (arr!27169 _values!1231) from!1844) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!938194 () Bool)

(assert (=> b!938194 (= e!526875 (get!14332 (select (arr!27169 _values!1231) from!1844) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113497 c!97745) b!938193))

(assert (= (and d!113497 (not c!97745)) b!938194))

(assert (=> b!938193 m!872915))

(assert (=> b!938193 m!872569))

(declare-fun m!873251 () Bool)

(assert (=> b!938193 m!873251))

(assert (=> b!938194 m!872915))

(assert (=> b!938194 m!872569))

(declare-fun m!873253 () Bool)

(assert (=> b!938194 m!873253))

(assert (=> b!937995 d!113497))

(declare-fun d!113499 () Bool)

(declare-fun e!526876 () Bool)

(assert (=> d!113499 e!526876))

(declare-fun res!631276 () Bool)

(assert (=> d!113499 (=> res!631276 e!526876)))

(declare-fun lt!423563 () Bool)

(assert (=> d!113499 (= res!631276 (not lt!423563))))

(declare-fun lt!423566 () Bool)

(assert (=> d!113499 (= lt!423563 lt!423566)))

(declare-fun lt!423565 () Unit!31668)

(declare-fun e!526877 () Unit!31668)

(assert (=> d!113499 (= lt!423565 e!526877)))

(declare-fun c!97746 () Bool)

(assert (=> d!113499 (= c!97746 lt!423566)))

(assert (=> d!113499 (= lt!423566 (containsKey!450 (toList!6052 lt!423456) (select (arr!27170 _keys!1487) from!1844)))))

(assert (=> d!113499 (= (contains!5111 lt!423456 (select (arr!27170 _keys!1487) from!1844)) lt!423563)))

(declare-fun b!938195 () Bool)

(declare-fun lt!423564 () Unit!31668)

(assert (=> b!938195 (= e!526877 lt!423564)))

(assert (=> b!938195 (= lt!423564 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 lt!423456) (select (arr!27170 _keys!1487) from!1844)))))

(assert (=> b!938195 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423456) (select (arr!27170 _keys!1487) from!1844)))))

(declare-fun b!938196 () Bool)

(declare-fun Unit!31689 () Unit!31668)

(assert (=> b!938196 (= e!526877 Unit!31689)))

(declare-fun b!938197 () Bool)

(assert (=> b!938197 (= e!526876 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423456) (select (arr!27170 _keys!1487) from!1844))))))

(assert (= (and d!113499 c!97746) b!938195))

(assert (= (and d!113499 (not c!97746)) b!938196))

(assert (= (and d!113499 (not res!631276)) b!938197))

(assert (=> d!113499 m!872857))

(declare-fun m!873255 () Bool)

(assert (=> d!113499 m!873255))

(assert (=> b!938195 m!872857))

(declare-fun m!873257 () Bool)

(assert (=> b!938195 m!873257))

(assert (=> b!938195 m!872857))

(assert (=> b!938195 m!873247))

(assert (=> b!938195 m!873247))

(declare-fun m!873259 () Bool)

(assert (=> b!938195 m!873259))

(assert (=> b!938197 m!872857))

(assert (=> b!938197 m!873247))

(assert (=> b!938197 m!873247))

(assert (=> b!938197 m!873259))

(assert (=> b!937980 d!113499))

(declare-fun d!113501 () Bool)

(assert (=> d!113501 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423241) k0!1099))))

(declare-fun lt!423567 () Unit!31668)

(assert (=> d!113501 (= lt!423567 (choose!1557 (toList!6052 lt!423241) k0!1099))))

(declare-fun e!526878 () Bool)

(assert (=> d!113501 e!526878))

(declare-fun res!631277 () Bool)

(assert (=> d!113501 (=> (not res!631277) (not e!526878))))

(assert (=> d!113501 (= res!631277 (isStrictlySorted!503 (toList!6052 lt!423241)))))

(assert (=> d!113501 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 lt!423241) k0!1099) lt!423567)))

(declare-fun b!938198 () Bool)

(assert (=> b!938198 (= e!526878 (containsKey!450 (toList!6052 lt!423241) k0!1099))))

(assert (= (and d!113501 res!631277) b!938198))

(assert (=> d!113501 m!872777))

(assert (=> d!113501 m!872777))

(assert (=> d!113501 m!872833))

(declare-fun m!873261 () Bool)

(assert (=> d!113501 m!873261))

(declare-fun m!873263 () Bool)

(assert (=> d!113501 m!873263))

(assert (=> b!938198 m!872829))

(assert (=> b!937942 d!113501))

(assert (=> b!937942 d!113385))

(assert (=> b!937942 d!113387))

(declare-fun d!113503 () Bool)

(declare-fun e!526879 () Bool)

(assert (=> d!113503 e!526879))

(declare-fun res!631278 () Bool)

(assert (=> d!113503 (=> (not res!631278) (not e!526879))))

(declare-fun lt!423570 () ListLongMap!12073)

(assert (=> d!113503 (= res!631278 (contains!5111 lt!423570 (_1!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!423568 () List!19154)

(assert (=> d!113503 (= lt!423570 (ListLongMap!12074 lt!423568))))

(declare-fun lt!423571 () Unit!31668)

(declare-fun lt!423569 () Unit!31668)

(assert (=> d!113503 (= lt!423571 lt!423569)))

(assert (=> d!113503 (= (getValueByKey!483 lt!423568 (_1!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113503 (= lt!423569 (lemmaContainsTupThenGetReturnValue!259 lt!423568 (_1!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113503 (= lt!423568 (insertStrictlySorted!316 (toList!6052 call!40796) (_1!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113503 (= (+!2840 call!40796 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!423570)))

(declare-fun b!938199 () Bool)

(declare-fun res!631279 () Bool)

(assert (=> b!938199 (=> (not res!631279) (not e!526879))))

(assert (=> b!938199 (= res!631279 (= (getValueByKey!483 (toList!6052 lt!423570) (_1!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!938200 () Bool)

(assert (=> b!938200 (= e!526879 (contains!5114 (toList!6052 lt!423570) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113503 res!631278) b!938199))

(assert (= (and b!938199 res!631279) b!938200))

(declare-fun m!873265 () Bool)

(assert (=> d!113503 m!873265))

(declare-fun m!873267 () Bool)

(assert (=> d!113503 m!873267))

(declare-fun m!873269 () Bool)

(assert (=> d!113503 m!873269))

(declare-fun m!873271 () Bool)

(assert (=> d!113503 m!873271))

(declare-fun m!873273 () Bool)

(assert (=> b!938199 m!873273))

(declare-fun m!873275 () Bool)

(assert (=> b!938200 m!873275))

(assert (=> b!937996 d!113503))

(declare-fun d!113505 () Bool)

(declare-fun e!526880 () Bool)

(assert (=> d!113505 e!526880))

(declare-fun res!631280 () Bool)

(assert (=> d!113505 (=> (not res!631280) (not e!526880))))

(declare-fun lt!423574 () ListLongMap!12073)

(assert (=> d!113505 (= res!631280 (contains!5111 lt!423574 (_1!6699 (ite (or c!97659 c!97656) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!423572 () List!19154)

(assert (=> d!113505 (= lt!423574 (ListLongMap!12074 lt!423572))))

(declare-fun lt!423575 () Unit!31668)

(declare-fun lt!423573 () Unit!31668)

(assert (=> d!113505 (= lt!423575 lt!423573)))

(assert (=> d!113505 (= (getValueByKey!483 lt!423572 (_1!6699 (ite (or c!97659 c!97656) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!488 (_2!6699 (ite (or c!97659 c!97656) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113505 (= lt!423573 (lemmaContainsTupThenGetReturnValue!259 lt!423572 (_1!6699 (ite (or c!97659 c!97656) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6699 (ite (or c!97659 c!97656) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113505 (= lt!423572 (insertStrictlySorted!316 (toList!6052 (ite c!97659 call!40776 (ite c!97656 call!40779 call!40777))) (_1!6699 (ite (or c!97659 c!97656) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6699 (ite (or c!97659 c!97656) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113505 (= (+!2840 (ite c!97659 call!40776 (ite c!97656 call!40779 call!40777)) (ite (or c!97659 c!97656) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!423574)))

(declare-fun b!938201 () Bool)

(declare-fun res!631281 () Bool)

(assert (=> b!938201 (=> (not res!631281) (not e!526880))))

(assert (=> b!938201 (= res!631281 (= (getValueByKey!483 (toList!6052 lt!423574) (_1!6699 (ite (or c!97659 c!97656) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!488 (_2!6699 (ite (or c!97659 c!97656) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!938202 () Bool)

(assert (=> b!938202 (= e!526880 (contains!5114 (toList!6052 lt!423574) (ite (or c!97659 c!97656) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113505 res!631280) b!938201))

(assert (= (and b!938201 res!631281) b!938202))

(declare-fun m!873277 () Bool)

(assert (=> d!113505 m!873277))

(declare-fun m!873279 () Bool)

(assert (=> d!113505 m!873279))

(declare-fun m!873281 () Bool)

(assert (=> d!113505 m!873281))

(declare-fun m!873283 () Bool)

(assert (=> d!113505 m!873283))

(declare-fun m!873285 () Bool)

(assert (=> b!938201 m!873285))

(declare-fun m!873287 () Bool)

(assert (=> b!938202 m!873287))

(assert (=> bm!40771 d!113505))

(declare-fun d!113507 () Bool)

(assert (=> d!113507 (= (validKeyInArray!0 (select (arr!27170 _keys!1487) from!1844)) (and (not (= (select (arr!27170 _keys!1487) from!1844) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27170 _keys!1487) from!1844) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937983 d!113507))

(declare-fun bm!40813 () Bool)

(declare-fun call!40816 () Bool)

(assert (=> bm!40813 (= call!40816 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!938203 () Bool)

(declare-fun e!526881 () Bool)

(declare-fun e!526882 () Bool)

(assert (=> b!938203 (= e!526881 e!526882)))

(declare-fun c!97747 () Bool)

(assert (=> b!938203 (= c!97747 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!938204 () Bool)

(declare-fun e!526883 () Bool)

(assert (=> b!938204 (= e!526883 call!40816)))

(declare-fun b!938205 () Bool)

(assert (=> b!938205 (= e!526882 call!40816)))

(declare-fun b!938206 () Bool)

(assert (=> b!938206 (= e!526882 e!526883)))

(declare-fun lt!423577 () (_ BitVec 64))

(assert (=> b!938206 (= lt!423577 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!423576 () Unit!31668)

(assert (=> b!938206 (= lt!423576 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!423577 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!938206 (arrayContainsKey!0 _keys!1487 lt!423577 #b00000000000000000000000000000000)))

(declare-fun lt!423578 () Unit!31668)

(assert (=> b!938206 (= lt!423578 lt!423576)))

(declare-fun res!631282 () Bool)

(assert (=> b!938206 (= res!631282 (= (seekEntryOrOpen!0 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1487 mask!1881) (Found!8981 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!938206 (=> (not res!631282) (not e!526883))))

(declare-fun d!113509 () Bool)

(declare-fun res!631283 () Bool)

(assert (=> d!113509 (=> res!631283 e!526881)))

(assert (=> d!113509 (= res!631283 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(assert (=> d!113509 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881) e!526881)))

(assert (= (and d!113509 (not res!631283)) b!938203))

(assert (= (and b!938203 c!97747) b!938206))

(assert (= (and b!938203 (not c!97747)) b!938205))

(assert (= (and b!938206 res!631282) b!938204))

(assert (= (or b!938204 b!938205) bm!40813))

(declare-fun m!873289 () Bool)

(assert (=> bm!40813 m!873289))

(assert (=> b!938203 m!873075))

(assert (=> b!938203 m!873075))

(assert (=> b!938203 m!873077))

(assert (=> b!938206 m!873075))

(declare-fun m!873291 () Bool)

(assert (=> b!938206 m!873291))

(declare-fun m!873293 () Bool)

(assert (=> b!938206 m!873293))

(assert (=> b!938206 m!873075))

(declare-fun m!873295 () Bool)

(assert (=> b!938206 m!873295))

(assert (=> bm!40790 d!113509))

(assert (=> bm!40773 d!113471))

(declare-fun d!113511 () Bool)

(assert (=> d!113511 (= (get!14332 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!937950 d!113511))

(declare-fun d!113513 () Bool)

(declare-fun e!526886 () Bool)

(assert (=> d!113513 e!526886))

(declare-fun c!97750 () Bool)

(assert (=> d!113513 (= c!97750 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!113513 true))

(declare-fun _$29!180 () Unit!31668)

(assert (=> d!113513 (= (choose!1556 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) _$29!180)))

(declare-fun b!938211 () Bool)

(assert (=> b!938211 (= e!526886 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!938212 () Bool)

(assert (=> b!938212 (= e!526886 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113513 c!97750) b!938211))

(assert (= (and d!113513 (not c!97750)) b!938212))

(assert (=> b!938211 m!872561))

(assert (=> d!113343 d!113513))

(assert (=> d!113343 d!113355))

(assert (=> d!113339 d!113367))

(declare-fun d!113515 () Bool)

(assert (=> d!113515 (= (apply!853 (+!2840 lt!423238 (tuple2!13377 lt!423240 lt!423248)) k0!1099) (get!14330 (getValueByKey!483 (toList!6052 (+!2840 lt!423238 (tuple2!13377 lt!423240 lt!423248))) k0!1099)))))

(declare-fun bs!26324 () Bool)

(assert (= bs!26324 d!113515))

(assert (=> bs!26324 m!873059))

(assert (=> bs!26324 m!873059))

(declare-fun m!873297 () Bool)

(assert (=> bs!26324 m!873297))

(assert (=> d!113339 d!113515))

(assert (=> d!113339 d!113431))

(declare-fun d!113517 () Bool)

(assert (=> d!113517 (= (apply!853 (+!2840 lt!423238 (tuple2!13377 lt!423240 lt!423248)) k0!1099) (apply!853 lt!423238 k0!1099))))

(assert (=> d!113517 true))

(declare-fun _$34!1158 () Unit!31668)

(assert (=> d!113517 (= (choose!1554 lt!423238 lt!423240 lt!423248 k0!1099) _$34!1158)))

(declare-fun bs!26325 () Bool)

(assert (= bs!26325 d!113517))

(assert (=> bs!26325 m!872805))

(assert (=> bs!26325 m!872805))

(assert (=> bs!26325 m!872807))

(assert (=> bs!26325 m!872551))

(assert (=> d!113339 d!113517))

(assert (=> d!113339 d!113371))

(declare-fun d!113519 () Bool)

(declare-fun e!526887 () Bool)

(assert (=> d!113519 e!526887))

(declare-fun res!631284 () Bool)

(assert (=> d!113519 (=> res!631284 e!526887)))

(declare-fun lt!423579 () Bool)

(assert (=> d!113519 (= res!631284 (not lt!423579))))

(declare-fun lt!423582 () Bool)

(assert (=> d!113519 (= lt!423579 lt!423582)))

(declare-fun lt!423581 () Unit!31668)

(declare-fun e!526888 () Unit!31668)

(assert (=> d!113519 (= lt!423581 e!526888)))

(declare-fun c!97751 () Bool)

(assert (=> d!113519 (= c!97751 lt!423582)))

(assert (=> d!113519 (= lt!423582 (containsKey!450 (toList!6052 lt!423405) (_1!6699 lt!423246)))))

(assert (=> d!113519 (= (contains!5111 lt!423405 (_1!6699 lt!423246)) lt!423579)))

(declare-fun b!938214 () Bool)

(declare-fun lt!423580 () Unit!31668)

(assert (=> b!938214 (= e!526888 lt!423580)))

(assert (=> b!938214 (= lt!423580 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 lt!423405) (_1!6699 lt!423246)))))

(assert (=> b!938214 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423405) (_1!6699 lt!423246)))))

(declare-fun b!938215 () Bool)

(declare-fun Unit!31690 () Unit!31668)

(assert (=> b!938215 (= e!526888 Unit!31690)))

(declare-fun b!938216 () Bool)

(assert (=> b!938216 (= e!526887 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423405) (_1!6699 lt!423246))))))

(assert (= (and d!113519 c!97751) b!938214))

(assert (= (and d!113519 (not c!97751)) b!938215))

(assert (= (and d!113519 (not res!631284)) b!938216))

(declare-fun m!873299 () Bool)

(assert (=> d!113519 m!873299))

(declare-fun m!873301 () Bool)

(assert (=> b!938214 m!873301))

(assert (=> b!938214 m!872825))

(assert (=> b!938214 m!872825))

(declare-fun m!873303 () Bool)

(assert (=> b!938214 m!873303))

(assert (=> b!938216 m!872825))

(assert (=> b!938216 m!872825))

(assert (=> b!938216 m!873303))

(assert (=> d!113347 d!113519))

(declare-fun b!938219 () Bool)

(declare-fun e!526890 () Option!489)

(assert (=> b!938219 (= e!526890 (getValueByKey!483 (t!27449 lt!423403) (_1!6699 lt!423246)))))

(declare-fun b!938218 () Bool)

(declare-fun e!526889 () Option!489)

(assert (=> b!938218 (= e!526889 e!526890)))

(declare-fun c!97753 () Bool)

(assert (=> b!938218 (= c!97753 (and ((_ is Cons!19150) lt!423403) (not (= (_1!6699 (h!20296 lt!423403)) (_1!6699 lt!423246)))))))

(declare-fun b!938217 () Bool)

(assert (=> b!938217 (= e!526889 (Some!488 (_2!6699 (h!20296 lt!423403))))))

(declare-fun d!113521 () Bool)

(declare-fun c!97752 () Bool)

(assert (=> d!113521 (= c!97752 (and ((_ is Cons!19150) lt!423403) (= (_1!6699 (h!20296 lt!423403)) (_1!6699 lt!423246))))))

(assert (=> d!113521 (= (getValueByKey!483 lt!423403 (_1!6699 lt!423246)) e!526889)))

(declare-fun b!938220 () Bool)

(assert (=> b!938220 (= e!526890 None!487)))

(assert (= (and d!113521 c!97752) b!938217))

(assert (= (and d!113521 (not c!97752)) b!938218))

(assert (= (and b!938218 c!97753) b!938219))

(assert (= (and b!938218 (not c!97753)) b!938220))

(declare-fun m!873305 () Bool)

(assert (=> b!938219 m!873305))

(assert (=> d!113347 d!113521))

(declare-fun d!113523 () Bool)

(assert (=> d!113523 (= (getValueByKey!483 lt!423403 (_1!6699 lt!423246)) (Some!488 (_2!6699 lt!423246)))))

(declare-fun lt!423583 () Unit!31668)

(assert (=> d!113523 (= lt!423583 (choose!1558 lt!423403 (_1!6699 lt!423246) (_2!6699 lt!423246)))))

(declare-fun e!526891 () Bool)

(assert (=> d!113523 e!526891))

(declare-fun res!631285 () Bool)

(assert (=> d!113523 (=> (not res!631285) (not e!526891))))

(assert (=> d!113523 (= res!631285 (isStrictlySorted!503 lt!423403))))

(assert (=> d!113523 (= (lemmaContainsTupThenGetReturnValue!259 lt!423403 (_1!6699 lt!423246) (_2!6699 lt!423246)) lt!423583)))

(declare-fun b!938221 () Bool)

(declare-fun res!631286 () Bool)

(assert (=> b!938221 (=> (not res!631286) (not e!526891))))

(assert (=> b!938221 (= res!631286 (containsKey!450 lt!423403 (_1!6699 lt!423246)))))

(declare-fun b!938222 () Bool)

(assert (=> b!938222 (= e!526891 (contains!5114 lt!423403 (tuple2!13377 (_1!6699 lt!423246) (_2!6699 lt!423246))))))

(assert (= (and d!113523 res!631285) b!938221))

(assert (= (and b!938221 res!631286) b!938222))

(assert (=> d!113523 m!872819))

(declare-fun m!873307 () Bool)

(assert (=> d!113523 m!873307))

(declare-fun m!873309 () Bool)

(assert (=> d!113523 m!873309))

(declare-fun m!873311 () Bool)

(assert (=> b!938221 m!873311))

(declare-fun m!873313 () Bool)

(assert (=> b!938222 m!873313))

(assert (=> d!113347 d!113523))

(declare-fun d!113525 () Bool)

(declare-fun e!526892 () Bool)

(assert (=> d!113525 e!526892))

(declare-fun res!631288 () Bool)

(assert (=> d!113525 (=> (not res!631288) (not e!526892))))

(declare-fun lt!423584 () List!19154)

(assert (=> d!113525 (= res!631288 (isStrictlySorted!503 lt!423584))))

(declare-fun e!526894 () List!19154)

(assert (=> d!113525 (= lt!423584 e!526894)))

(declare-fun c!97754 () Bool)

(assert (=> d!113525 (= c!97754 (and ((_ is Cons!19150) (toList!6052 lt!423238)) (bvslt (_1!6699 (h!20296 (toList!6052 lt!423238))) (_1!6699 lt!423246))))))

(assert (=> d!113525 (isStrictlySorted!503 (toList!6052 lt!423238))))

(assert (=> d!113525 (= (insertStrictlySorted!316 (toList!6052 lt!423238) (_1!6699 lt!423246) (_2!6699 lt!423246)) lt!423584)))

(declare-fun bm!40814 () Bool)

(declare-fun call!40817 () List!19154)

(declare-fun call!40818 () List!19154)

(assert (=> bm!40814 (= call!40817 call!40818)))

(declare-fun b!938223 () Bool)

(assert (=> b!938223 (= e!526892 (contains!5114 lt!423584 (tuple2!13377 (_1!6699 lt!423246) (_2!6699 lt!423246))))))

(declare-fun bm!40815 () Bool)

(declare-fun e!526893 () List!19154)

(assert (=> bm!40815 (= call!40818 ($colon$colon!552 e!526893 (ite c!97754 (h!20296 (toList!6052 lt!423238)) (tuple2!13377 (_1!6699 lt!423246) (_2!6699 lt!423246)))))))

(declare-fun c!97756 () Bool)

(assert (=> bm!40815 (= c!97756 c!97754)))

(declare-fun b!938224 () Bool)

(assert (=> b!938224 (= e!526893 (insertStrictlySorted!316 (t!27449 (toList!6052 lt!423238)) (_1!6699 lt!423246) (_2!6699 lt!423246)))))

(declare-fun b!938225 () Bool)

(assert (=> b!938225 (= e!526894 call!40818)))

(declare-fun b!938226 () Bool)

(declare-fun e!526896 () List!19154)

(assert (=> b!938226 (= e!526894 e!526896)))

(declare-fun c!97755 () Bool)

(assert (=> b!938226 (= c!97755 (and ((_ is Cons!19150) (toList!6052 lt!423238)) (= (_1!6699 (h!20296 (toList!6052 lt!423238))) (_1!6699 lt!423246))))))

(declare-fun b!938227 () Bool)

(assert (=> b!938227 (= e!526896 call!40817)))

(declare-fun b!938228 () Bool)

(declare-fun c!97757 () Bool)

(assert (=> b!938228 (= e!526893 (ite c!97755 (t!27449 (toList!6052 lt!423238)) (ite c!97757 (Cons!19150 (h!20296 (toList!6052 lt!423238)) (t!27449 (toList!6052 lt!423238))) Nil!19151)))))

(declare-fun bm!40816 () Bool)

(declare-fun call!40819 () List!19154)

(assert (=> bm!40816 (= call!40819 call!40817)))

(declare-fun b!938229 () Bool)

(declare-fun e!526895 () List!19154)

(assert (=> b!938229 (= e!526895 call!40819)))

(declare-fun b!938230 () Bool)

(declare-fun res!631287 () Bool)

(assert (=> b!938230 (=> (not res!631287) (not e!526892))))

(assert (=> b!938230 (= res!631287 (containsKey!450 lt!423584 (_1!6699 lt!423246)))))

(declare-fun b!938231 () Bool)

(assert (=> b!938231 (= e!526895 call!40819)))

(declare-fun b!938232 () Bool)

(assert (=> b!938232 (= c!97757 (and ((_ is Cons!19150) (toList!6052 lt!423238)) (bvsgt (_1!6699 (h!20296 (toList!6052 lt!423238))) (_1!6699 lt!423246))))))

(assert (=> b!938232 (= e!526896 e!526895)))

(assert (= (and d!113525 c!97754) b!938225))

(assert (= (and d!113525 (not c!97754)) b!938226))

(assert (= (and b!938226 c!97755) b!938227))

(assert (= (and b!938226 (not c!97755)) b!938232))

(assert (= (and b!938232 c!97757) b!938231))

(assert (= (and b!938232 (not c!97757)) b!938229))

(assert (= (or b!938231 b!938229) bm!40816))

(assert (= (or b!938227 bm!40816) bm!40814))

(assert (= (or b!938225 bm!40814) bm!40815))

(assert (= (and bm!40815 c!97756) b!938224))

(assert (= (and bm!40815 (not c!97756)) b!938228))

(assert (= (and d!113525 res!631288) b!938230))

(assert (= (and b!938230 res!631287) b!938223))

(declare-fun m!873315 () Bool)

(assert (=> d!113525 m!873315))

(assert (=> d!113525 m!873089))

(declare-fun m!873317 () Bool)

(assert (=> b!938223 m!873317))

(declare-fun m!873319 () Bool)

(assert (=> bm!40815 m!873319))

(declare-fun m!873321 () Bool)

(assert (=> b!938224 m!873321))

(declare-fun m!873323 () Bool)

(assert (=> b!938230 m!873323))

(assert (=> d!113347 d!113525))

(declare-fun d!113527 () Bool)

(assert (=> d!113527 (= (apply!853 (+!2840 lt!423361 (tuple2!13377 lt!423364 minValue!1173)) lt!423373) (get!14330 (getValueByKey!483 (toList!6052 (+!2840 lt!423361 (tuple2!13377 lt!423364 minValue!1173))) lt!423373)))))

(declare-fun bs!26326 () Bool)

(assert (= bs!26326 d!113527))

(declare-fun m!873325 () Bool)

(assert (=> bs!26326 m!873325))

(assert (=> bs!26326 m!873325))

(declare-fun m!873327 () Bool)

(assert (=> bs!26326 m!873327))

(assert (=> b!937895 d!113527))

(declare-fun d!113529 () Bool)

(assert (=> d!113529 (= (apply!853 lt!423370 lt!423372) (get!14330 (getValueByKey!483 (toList!6052 lt!423370) lt!423372)))))

(declare-fun bs!26327 () Bool)

(assert (= bs!26327 d!113529))

(declare-fun m!873329 () Bool)

(assert (=> bs!26327 m!873329))

(assert (=> bs!26327 m!873329))

(declare-fun m!873331 () Bool)

(assert (=> bs!26327 m!873331))

(assert (=> b!937895 d!113529))

(declare-fun d!113531 () Bool)

(assert (=> d!113531 (= (apply!853 lt!423359 lt!423362) (get!14330 (getValueByKey!483 (toList!6052 lt!423359) lt!423362)))))

(declare-fun bs!26328 () Bool)

(assert (= bs!26328 d!113531))

(declare-fun m!873333 () Bool)

(assert (=> bs!26328 m!873333))

(assert (=> bs!26328 m!873333))

(declare-fun m!873335 () Bool)

(assert (=> bs!26328 m!873335))

(assert (=> b!937895 d!113531))

(declare-fun d!113533 () Bool)

(assert (=> d!113533 (= (apply!853 (+!2840 lt!423370 (tuple2!13377 lt!423371 minValue!1173)) lt!423372) (get!14330 (getValueByKey!483 (toList!6052 (+!2840 lt!423370 (tuple2!13377 lt!423371 minValue!1173))) lt!423372)))))

(declare-fun bs!26329 () Bool)

(assert (= bs!26329 d!113533))

(declare-fun m!873337 () Bool)

(assert (=> bs!26329 m!873337))

(assert (=> bs!26329 m!873337))

(declare-fun m!873339 () Bool)

(assert (=> bs!26329 m!873339))

(assert (=> b!937895 d!113533))

(declare-fun d!113535 () Bool)

(assert (=> d!113535 (= (apply!853 (+!2840 lt!423359 (tuple2!13377 lt!423355 zeroValue!1173)) lt!423362) (get!14330 (getValueByKey!483 (toList!6052 (+!2840 lt!423359 (tuple2!13377 lt!423355 zeroValue!1173))) lt!423362)))))

(declare-fun bs!26330 () Bool)

(assert (= bs!26330 d!113535))

(declare-fun m!873341 () Bool)

(assert (=> bs!26330 m!873341))

(assert (=> bs!26330 m!873341))

(declare-fun m!873343 () Bool)

(assert (=> bs!26330 m!873343))

(assert (=> b!937895 d!113535))

(declare-fun d!113537 () Bool)

(assert (=> d!113537 (contains!5111 (+!2840 lt!423358 (tuple2!13377 lt!423367 zeroValue!1173)) lt!423368)))

(declare-fun lt!423585 () Unit!31668)

(assert (=> d!113537 (= lt!423585 (choose!1555 lt!423358 lt!423367 zeroValue!1173 lt!423368))))

(assert (=> d!113537 (contains!5111 lt!423358 lt!423368)))

(assert (=> d!113537 (= (addStillContains!559 lt!423358 lt!423367 zeroValue!1173 lt!423368) lt!423585)))

(declare-fun bs!26331 () Bool)

(assert (= bs!26331 d!113537))

(assert (=> bs!26331 m!872725))

(assert (=> bs!26331 m!872725))

(assert (=> bs!26331 m!872741))

(declare-fun m!873345 () Bool)

(assert (=> bs!26331 m!873345))

(declare-fun m!873347 () Bool)

(assert (=> bs!26331 m!873347))

(assert (=> b!937895 d!113537))

(declare-fun d!113539 () Bool)

(declare-fun e!526897 () Bool)

(assert (=> d!113539 e!526897))

(declare-fun res!631289 () Bool)

(assert (=> d!113539 (=> (not res!631289) (not e!526897))))

(declare-fun lt!423588 () ListLongMap!12073)

(assert (=> d!113539 (= res!631289 (contains!5111 lt!423588 (_1!6699 (tuple2!13377 lt!423364 minValue!1173))))))

(declare-fun lt!423586 () List!19154)

(assert (=> d!113539 (= lt!423588 (ListLongMap!12074 lt!423586))))

(declare-fun lt!423589 () Unit!31668)

(declare-fun lt!423587 () Unit!31668)

(assert (=> d!113539 (= lt!423589 lt!423587)))

(assert (=> d!113539 (= (getValueByKey!483 lt!423586 (_1!6699 (tuple2!13377 lt!423364 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423364 minValue!1173))))))

(assert (=> d!113539 (= lt!423587 (lemmaContainsTupThenGetReturnValue!259 lt!423586 (_1!6699 (tuple2!13377 lt!423364 minValue!1173)) (_2!6699 (tuple2!13377 lt!423364 minValue!1173))))))

(assert (=> d!113539 (= lt!423586 (insertStrictlySorted!316 (toList!6052 lt!423361) (_1!6699 (tuple2!13377 lt!423364 minValue!1173)) (_2!6699 (tuple2!13377 lt!423364 minValue!1173))))))

(assert (=> d!113539 (= (+!2840 lt!423361 (tuple2!13377 lt!423364 minValue!1173)) lt!423588)))

(declare-fun b!938233 () Bool)

(declare-fun res!631290 () Bool)

(assert (=> b!938233 (=> (not res!631290) (not e!526897))))

(assert (=> b!938233 (= res!631290 (= (getValueByKey!483 (toList!6052 lt!423588) (_1!6699 (tuple2!13377 lt!423364 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423364 minValue!1173)))))))

(declare-fun b!938234 () Bool)

(assert (=> b!938234 (= e!526897 (contains!5114 (toList!6052 lt!423588) (tuple2!13377 lt!423364 minValue!1173)))))

(assert (= (and d!113539 res!631289) b!938233))

(assert (= (and b!938233 res!631290) b!938234))

(declare-fun m!873349 () Bool)

(assert (=> d!113539 m!873349))

(declare-fun m!873351 () Bool)

(assert (=> d!113539 m!873351))

(declare-fun m!873353 () Bool)

(assert (=> d!113539 m!873353))

(declare-fun m!873355 () Bool)

(assert (=> d!113539 m!873355))

(declare-fun m!873357 () Bool)

(assert (=> b!938233 m!873357))

(declare-fun m!873359 () Bool)

(assert (=> b!938234 m!873359))

(assert (=> b!937895 d!113539))

(declare-fun d!113541 () Bool)

(declare-fun e!526898 () Bool)

(assert (=> d!113541 e!526898))

(declare-fun res!631291 () Bool)

(assert (=> d!113541 (=> (not res!631291) (not e!526898))))

(declare-fun lt!423592 () ListLongMap!12073)

(assert (=> d!113541 (= res!631291 (contains!5111 lt!423592 (_1!6699 (tuple2!13377 lt!423355 zeroValue!1173))))))

(declare-fun lt!423590 () List!19154)

(assert (=> d!113541 (= lt!423592 (ListLongMap!12074 lt!423590))))

(declare-fun lt!423593 () Unit!31668)

(declare-fun lt!423591 () Unit!31668)

(assert (=> d!113541 (= lt!423593 lt!423591)))

(assert (=> d!113541 (= (getValueByKey!483 lt!423590 (_1!6699 (tuple2!13377 lt!423355 zeroValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423355 zeroValue!1173))))))

(assert (=> d!113541 (= lt!423591 (lemmaContainsTupThenGetReturnValue!259 lt!423590 (_1!6699 (tuple2!13377 lt!423355 zeroValue!1173)) (_2!6699 (tuple2!13377 lt!423355 zeroValue!1173))))))

(assert (=> d!113541 (= lt!423590 (insertStrictlySorted!316 (toList!6052 lt!423359) (_1!6699 (tuple2!13377 lt!423355 zeroValue!1173)) (_2!6699 (tuple2!13377 lt!423355 zeroValue!1173))))))

(assert (=> d!113541 (= (+!2840 lt!423359 (tuple2!13377 lt!423355 zeroValue!1173)) lt!423592)))

(declare-fun b!938235 () Bool)

(declare-fun res!631292 () Bool)

(assert (=> b!938235 (=> (not res!631292) (not e!526898))))

(assert (=> b!938235 (= res!631292 (= (getValueByKey!483 (toList!6052 lt!423592) (_1!6699 (tuple2!13377 lt!423355 zeroValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423355 zeroValue!1173)))))))

(declare-fun b!938236 () Bool)

(assert (=> b!938236 (= e!526898 (contains!5114 (toList!6052 lt!423592) (tuple2!13377 lt!423355 zeroValue!1173)))))

(assert (= (and d!113541 res!631291) b!938235))

(assert (= (and b!938235 res!631292) b!938236))

(declare-fun m!873361 () Bool)

(assert (=> d!113541 m!873361))

(declare-fun m!873363 () Bool)

(assert (=> d!113541 m!873363))

(declare-fun m!873365 () Bool)

(assert (=> d!113541 m!873365))

(declare-fun m!873367 () Bool)

(assert (=> d!113541 m!873367))

(declare-fun m!873369 () Bool)

(assert (=> b!938235 m!873369))

(declare-fun m!873371 () Bool)

(assert (=> b!938236 m!873371))

(assert (=> b!937895 d!113541))

(declare-fun d!113543 () Bool)

(assert (=> d!113543 (= (apply!853 lt!423361 lt!423373) (get!14330 (getValueByKey!483 (toList!6052 lt!423361) lt!423373)))))

(declare-fun bs!26332 () Bool)

(assert (= bs!26332 d!113543))

(declare-fun m!873373 () Bool)

(assert (=> bs!26332 m!873373))

(assert (=> bs!26332 m!873373))

(declare-fun m!873375 () Bool)

(assert (=> bs!26332 m!873375))

(assert (=> b!937895 d!113543))

(declare-fun d!113545 () Bool)

(assert (=> d!113545 (= (apply!853 (+!2840 lt!423361 (tuple2!13377 lt!423364 minValue!1173)) lt!423373) (apply!853 lt!423361 lt!423373))))

(declare-fun lt!423594 () Unit!31668)

(assert (=> d!113545 (= lt!423594 (choose!1554 lt!423361 lt!423364 minValue!1173 lt!423373))))

(declare-fun e!526899 () Bool)

(assert (=> d!113545 e!526899))

(declare-fun res!631293 () Bool)

(assert (=> d!113545 (=> (not res!631293) (not e!526899))))

(assert (=> d!113545 (= res!631293 (contains!5111 lt!423361 lt!423373))))

(assert (=> d!113545 (= (addApplyDifferent!439 lt!423361 lt!423364 minValue!1173 lt!423373) lt!423594)))

(declare-fun b!938237 () Bool)

(assert (=> b!938237 (= e!526899 (not (= lt!423373 lt!423364)))))

(assert (= (and d!113545 res!631293) b!938237))

(declare-fun m!873377 () Bool)

(assert (=> d!113545 m!873377))

(assert (=> d!113545 m!872737))

(assert (=> d!113545 m!872749))

(assert (=> d!113545 m!872737))

(assert (=> d!113545 m!872729))

(declare-fun m!873379 () Bool)

(assert (=> d!113545 m!873379))

(assert (=> b!937895 d!113545))

(declare-fun d!113547 () Bool)

(declare-fun e!526900 () Bool)

(assert (=> d!113547 e!526900))

(declare-fun res!631294 () Bool)

(assert (=> d!113547 (=> (not res!631294) (not e!526900))))

(declare-fun lt!423597 () ListLongMap!12073)

(assert (=> d!113547 (= res!631294 (contains!5111 lt!423597 (_1!6699 (tuple2!13377 lt!423367 zeroValue!1173))))))

(declare-fun lt!423595 () List!19154)

(assert (=> d!113547 (= lt!423597 (ListLongMap!12074 lt!423595))))

(declare-fun lt!423598 () Unit!31668)

(declare-fun lt!423596 () Unit!31668)

(assert (=> d!113547 (= lt!423598 lt!423596)))

(assert (=> d!113547 (= (getValueByKey!483 lt!423595 (_1!6699 (tuple2!13377 lt!423367 zeroValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423367 zeroValue!1173))))))

(assert (=> d!113547 (= lt!423596 (lemmaContainsTupThenGetReturnValue!259 lt!423595 (_1!6699 (tuple2!13377 lt!423367 zeroValue!1173)) (_2!6699 (tuple2!13377 lt!423367 zeroValue!1173))))))

(assert (=> d!113547 (= lt!423595 (insertStrictlySorted!316 (toList!6052 lt!423358) (_1!6699 (tuple2!13377 lt!423367 zeroValue!1173)) (_2!6699 (tuple2!13377 lt!423367 zeroValue!1173))))))

(assert (=> d!113547 (= (+!2840 lt!423358 (tuple2!13377 lt!423367 zeroValue!1173)) lt!423597)))

(declare-fun b!938238 () Bool)

(declare-fun res!631295 () Bool)

(assert (=> b!938238 (=> (not res!631295) (not e!526900))))

(assert (=> b!938238 (= res!631295 (= (getValueByKey!483 (toList!6052 lt!423597) (_1!6699 (tuple2!13377 lt!423367 zeroValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423367 zeroValue!1173)))))))

(declare-fun b!938239 () Bool)

(assert (=> b!938239 (= e!526900 (contains!5114 (toList!6052 lt!423597) (tuple2!13377 lt!423367 zeroValue!1173)))))

(assert (= (and d!113547 res!631294) b!938238))

(assert (= (and b!938238 res!631295) b!938239))

(declare-fun m!873381 () Bool)

(assert (=> d!113547 m!873381))

(declare-fun m!873383 () Bool)

(assert (=> d!113547 m!873383))

(declare-fun m!873385 () Bool)

(assert (=> d!113547 m!873385))

(declare-fun m!873387 () Bool)

(assert (=> d!113547 m!873387))

(declare-fun m!873389 () Bool)

(assert (=> b!938238 m!873389))

(declare-fun m!873391 () Bool)

(assert (=> b!938239 m!873391))

(assert (=> b!937895 d!113547))

(declare-fun d!113549 () Bool)

(declare-fun e!526901 () Bool)

(assert (=> d!113549 e!526901))

(declare-fun res!631296 () Bool)

(assert (=> d!113549 (=> (not res!631296) (not e!526901))))

(declare-fun lt!423601 () ListLongMap!12073)

(assert (=> d!113549 (= res!631296 (contains!5111 lt!423601 (_1!6699 (tuple2!13377 lt!423371 minValue!1173))))))

(declare-fun lt!423599 () List!19154)

(assert (=> d!113549 (= lt!423601 (ListLongMap!12074 lt!423599))))

(declare-fun lt!423602 () Unit!31668)

(declare-fun lt!423600 () Unit!31668)

(assert (=> d!113549 (= lt!423602 lt!423600)))

(assert (=> d!113549 (= (getValueByKey!483 lt!423599 (_1!6699 (tuple2!13377 lt!423371 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423371 minValue!1173))))))

(assert (=> d!113549 (= lt!423600 (lemmaContainsTupThenGetReturnValue!259 lt!423599 (_1!6699 (tuple2!13377 lt!423371 minValue!1173)) (_2!6699 (tuple2!13377 lt!423371 minValue!1173))))))

(assert (=> d!113549 (= lt!423599 (insertStrictlySorted!316 (toList!6052 lt!423370) (_1!6699 (tuple2!13377 lt!423371 minValue!1173)) (_2!6699 (tuple2!13377 lt!423371 minValue!1173))))))

(assert (=> d!113549 (= (+!2840 lt!423370 (tuple2!13377 lt!423371 minValue!1173)) lt!423601)))

(declare-fun b!938240 () Bool)

(declare-fun res!631297 () Bool)

(assert (=> b!938240 (=> (not res!631297) (not e!526901))))

(assert (=> b!938240 (= res!631297 (= (getValueByKey!483 (toList!6052 lt!423601) (_1!6699 (tuple2!13377 lt!423371 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423371 minValue!1173)))))))

(declare-fun b!938241 () Bool)

(assert (=> b!938241 (= e!526901 (contains!5114 (toList!6052 lt!423601) (tuple2!13377 lt!423371 minValue!1173)))))

(assert (= (and d!113549 res!631296) b!938240))

(assert (= (and b!938240 res!631297) b!938241))

(declare-fun m!873393 () Bool)

(assert (=> d!113549 m!873393))

(declare-fun m!873395 () Bool)

(assert (=> d!113549 m!873395))

(declare-fun m!873397 () Bool)

(assert (=> d!113549 m!873397))

(declare-fun m!873399 () Bool)

(assert (=> d!113549 m!873399))

(declare-fun m!873401 () Bool)

(assert (=> b!938240 m!873401))

(declare-fun m!873403 () Bool)

(assert (=> b!938241 m!873403))

(assert (=> b!937895 d!113549))

(declare-fun d!113551 () Bool)

(assert (=> d!113551 (= (apply!853 (+!2840 lt!423370 (tuple2!13377 lt!423371 minValue!1173)) lt!423372) (apply!853 lt!423370 lt!423372))))

(declare-fun lt!423603 () Unit!31668)

(assert (=> d!113551 (= lt!423603 (choose!1554 lt!423370 lt!423371 minValue!1173 lt!423372))))

(declare-fun e!526902 () Bool)

(assert (=> d!113551 e!526902))

(declare-fun res!631298 () Bool)

(assert (=> d!113551 (=> (not res!631298) (not e!526902))))

(assert (=> d!113551 (= res!631298 (contains!5111 lt!423370 lt!423372))))

(assert (=> d!113551 (= (addApplyDifferent!439 lt!423370 lt!423371 minValue!1173 lt!423372) lt!423603)))

(declare-fun b!938242 () Bool)

(assert (=> b!938242 (= e!526902 (not (= lt!423372 lt!423371)))))

(assert (= (and d!113551 res!631298) b!938242))

(declare-fun m!873405 () Bool)

(assert (=> d!113551 m!873405))

(assert (=> d!113551 m!872721))

(assert (=> d!113551 m!872739))

(assert (=> d!113551 m!872721))

(assert (=> d!113551 m!872753))

(declare-fun m!873407 () Bool)

(assert (=> d!113551 m!873407))

(assert (=> b!937895 d!113551))

(declare-fun bm!40817 () Bool)

(declare-fun call!40820 () ListLongMap!12073)

(assert (=> bm!40817 (= call!40820 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!938243 () Bool)

(declare-fun e!526906 () Bool)

(declare-fun e!526903 () Bool)

(assert (=> b!938243 (= e!526906 e!526903)))

(declare-fun c!97758 () Bool)

(declare-fun e!526909 () Bool)

(assert (=> b!938243 (= c!97758 e!526909)))

(declare-fun res!631299 () Bool)

(assert (=> b!938243 (=> (not res!631299) (not e!526909))))

(assert (=> b!938243 (= res!631299 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27629 _keys!1487)))))

(declare-fun b!938244 () Bool)

(declare-fun e!526907 () ListLongMap!12073)

(declare-fun e!526904 () ListLongMap!12073)

(assert (=> b!938244 (= e!526907 e!526904)))

(declare-fun c!97760 () Bool)

(assert (=> b!938244 (= c!97760 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!938245 () Bool)

(declare-fun res!631302 () Bool)

(assert (=> b!938245 (=> (not res!631302) (not e!526906))))

(declare-fun lt!423608 () ListLongMap!12073)

(assert (=> b!938245 (= res!631302 (not (contains!5111 lt!423608 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!113553 () Bool)

(assert (=> d!113553 e!526906))

(declare-fun res!631301 () Bool)

(assert (=> d!113553 (=> (not res!631301) (not e!526906))))

(assert (=> d!113553 (= res!631301 (not (contains!5111 lt!423608 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!113553 (= lt!423608 e!526907)))

(declare-fun c!97761 () Bool)

(assert (=> d!113553 (= c!97761 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27629 _keys!1487)))))

(assert (=> d!113553 (validMask!0 mask!1881)))

(assert (=> d!113553 (= (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423608)))

(declare-fun b!938246 () Bool)

(declare-fun e!526908 () Bool)

(assert (=> b!938246 (= e!526903 e!526908)))

(declare-fun c!97759 () Bool)

(assert (=> b!938246 (= c!97759 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27629 _keys!1487)))))

(declare-fun b!938247 () Bool)

(assert (=> b!938247 (= e!526907 (ListLongMap!12074 Nil!19151))))

(declare-fun b!938248 () Bool)

(assert (=> b!938248 (= e!526904 call!40820)))

(declare-fun b!938249 () Bool)

(assert (=> b!938249 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27629 _keys!1487)))))

(assert (=> b!938249 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27628 _values!1231)))))

(declare-fun e!526905 () Bool)

(assert (=> b!938249 (= e!526905 (= (apply!853 lt!423608 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14328 (select (arr!27169 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!938250 () Bool)

(assert (=> b!938250 (= e!526908 (= lt!423608 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!938251 () Bool)

(assert (=> b!938251 (= e!526908 (isEmpty!697 lt!423608))))

(declare-fun b!938252 () Bool)

(assert (=> b!938252 (= e!526909 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!938252 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000)))

(declare-fun b!938253 () Bool)

(assert (=> b!938253 (= e!526903 e!526905)))

(assert (=> b!938253 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27629 _keys!1487)))))

(declare-fun res!631300 () Bool)

(assert (=> b!938253 (= res!631300 (contains!5111 lt!423608 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!938253 (=> (not res!631300) (not e!526905))))

(declare-fun b!938254 () Bool)

(declare-fun lt!423604 () Unit!31668)

(declare-fun lt!423605 () Unit!31668)

(assert (=> b!938254 (= lt!423604 lt!423605)))

(declare-fun lt!423606 () V!31977)

(declare-fun lt!423610 () ListLongMap!12073)

(declare-fun lt!423609 () (_ BitVec 64))

(declare-fun lt!423607 () (_ BitVec 64))

(assert (=> b!938254 (not (contains!5111 (+!2840 lt!423610 (tuple2!13377 lt!423607 lt!423606)) lt!423609))))

(assert (=> b!938254 (= lt!423605 (addStillNotContains!220 lt!423610 lt!423607 lt!423606 lt!423609))))

(assert (=> b!938254 (= lt!423609 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!938254 (= lt!423606 (get!14328 (select (arr!27169 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!938254 (= lt!423607 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938254 (= lt!423610 call!40820)))

(assert (=> b!938254 (= e!526904 (+!2840 call!40820 (tuple2!13377 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (get!14328 (select (arr!27169 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!113553 c!97761) b!938247))

(assert (= (and d!113553 (not c!97761)) b!938244))

(assert (= (and b!938244 c!97760) b!938254))

(assert (= (and b!938244 (not c!97760)) b!938248))

(assert (= (or b!938254 b!938248) bm!40817))

(assert (= (and d!113553 res!631301) b!938245))

(assert (= (and b!938245 res!631302) b!938243))

(assert (= (and b!938243 res!631299) b!938252))

(assert (= (and b!938243 c!97758) b!938253))

(assert (= (and b!938243 (not c!97758)) b!938246))

(assert (= (and b!938253 res!631300) b!938249))

(assert (= (and b!938246 c!97759) b!938250))

(assert (= (and b!938246 (not c!97759)) b!938251))

(declare-fun b_lambda!14189 () Bool)

(assert (=> (not b_lambda!14189) (not b!938249)))

(assert (=> b!938249 t!27448))

(declare-fun b_and!29119 () Bool)

(assert (= b_and!29117 (and (=> t!27448 result!12123) b_and!29119)))

(declare-fun b_lambda!14191 () Bool)

(assert (=> (not b_lambda!14191) (not b!938254)))

(assert (=> b!938254 t!27448))

(declare-fun b_and!29121 () Bool)

(assert (= b_and!29119 (and (=> t!27448 result!12123) b_and!29121)))

(assert (=> b!938252 m!872745))

(assert (=> b!938252 m!872745))

(assert (=> b!938252 m!872767))

(assert (=> b!938244 m!872745))

(assert (=> b!938244 m!872745))

(assert (=> b!938244 m!872767))

(assert (=> b!938249 m!872769))

(assert (=> b!938249 m!872569))

(assert (=> b!938249 m!872771))

(assert (=> b!938249 m!872769))

(assert (=> b!938249 m!872745))

(declare-fun m!873409 () Bool)

(assert (=> b!938249 m!873409))

(assert (=> b!938249 m!872745))

(assert (=> b!938249 m!872569))

(declare-fun m!873411 () Bool)

(assert (=> b!938251 m!873411))

(assert (=> b!938253 m!872745))

(assert (=> b!938253 m!872745))

(declare-fun m!873413 () Bool)

(assert (=> b!938253 m!873413))

(declare-fun m!873415 () Bool)

(assert (=> bm!40817 m!873415))

(assert (=> b!938250 m!873415))

(assert (=> b!938254 m!872769))

(assert (=> b!938254 m!872569))

(assert (=> b!938254 m!872771))

(assert (=> b!938254 m!872769))

(declare-fun m!873417 () Bool)

(assert (=> b!938254 m!873417))

(declare-fun m!873419 () Bool)

(assert (=> b!938254 m!873419))

(assert (=> b!938254 m!873419))

(declare-fun m!873421 () Bool)

(assert (=> b!938254 m!873421))

(assert (=> b!938254 m!872745))

(assert (=> b!938254 m!872569))

(declare-fun m!873423 () Bool)

(assert (=> b!938254 m!873423))

(declare-fun m!873425 () Bool)

(assert (=> d!113553 m!873425))

(assert (=> d!113553 m!872555))

(declare-fun m!873427 () Bool)

(assert (=> b!938245 m!873427))

(assert (=> b!937895 d!113553))

(declare-fun d!113555 () Bool)

(assert (=> d!113555 (= (apply!853 (+!2840 lt!423359 (tuple2!13377 lt!423355 zeroValue!1173)) lt!423362) (apply!853 lt!423359 lt!423362))))

(declare-fun lt!423611 () Unit!31668)

(assert (=> d!113555 (= lt!423611 (choose!1554 lt!423359 lt!423355 zeroValue!1173 lt!423362))))

(declare-fun e!526910 () Bool)

(assert (=> d!113555 e!526910))

(declare-fun res!631303 () Bool)

(assert (=> d!113555 (=> (not res!631303) (not e!526910))))

(assert (=> d!113555 (= res!631303 (contains!5111 lt!423359 lt!423362))))

(assert (=> d!113555 (= (addApplyDifferent!439 lt!423359 lt!423355 zeroValue!1173 lt!423362) lt!423611)))

(declare-fun b!938255 () Bool)

(assert (=> b!938255 (= e!526910 (not (= lt!423362 lt!423355)))))

(assert (= (and d!113555 res!631303) b!938255))

(declare-fun m!873429 () Bool)

(assert (=> d!113555 m!873429))

(assert (=> d!113555 m!872747))

(assert (=> d!113555 m!872751))

(assert (=> d!113555 m!872747))

(assert (=> d!113555 m!872743))

(declare-fun m!873431 () Bool)

(assert (=> d!113555 m!873431))

(assert (=> b!937895 d!113555))

(declare-fun d!113557 () Bool)

(declare-fun e!526911 () Bool)

(assert (=> d!113557 e!526911))

(declare-fun res!631304 () Bool)

(assert (=> d!113557 (=> res!631304 e!526911)))

(declare-fun lt!423612 () Bool)

(assert (=> d!113557 (= res!631304 (not lt!423612))))

(declare-fun lt!423615 () Bool)

(assert (=> d!113557 (= lt!423612 lt!423615)))

(declare-fun lt!423614 () Unit!31668)

(declare-fun e!526912 () Unit!31668)

(assert (=> d!113557 (= lt!423614 e!526912)))

(declare-fun c!97762 () Bool)

(assert (=> d!113557 (= c!97762 lt!423615)))

(assert (=> d!113557 (= lt!423615 (containsKey!450 (toList!6052 (+!2840 lt!423358 (tuple2!13377 lt!423367 zeroValue!1173))) lt!423368))))

(assert (=> d!113557 (= (contains!5111 (+!2840 lt!423358 (tuple2!13377 lt!423367 zeroValue!1173)) lt!423368) lt!423612)))

(declare-fun b!938256 () Bool)

(declare-fun lt!423613 () Unit!31668)

(assert (=> b!938256 (= e!526912 lt!423613)))

(assert (=> b!938256 (= lt!423613 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 (+!2840 lt!423358 (tuple2!13377 lt!423367 zeroValue!1173))) lt!423368))))

(assert (=> b!938256 (isDefined!355 (getValueByKey!483 (toList!6052 (+!2840 lt!423358 (tuple2!13377 lt!423367 zeroValue!1173))) lt!423368))))

(declare-fun b!938257 () Bool)

(declare-fun Unit!31691 () Unit!31668)

(assert (=> b!938257 (= e!526912 Unit!31691)))

(declare-fun b!938258 () Bool)

(assert (=> b!938258 (= e!526911 (isDefined!355 (getValueByKey!483 (toList!6052 (+!2840 lt!423358 (tuple2!13377 lt!423367 zeroValue!1173))) lt!423368)))))

(assert (= (and d!113557 c!97762) b!938256))

(assert (= (and d!113557 (not c!97762)) b!938257))

(assert (= (and d!113557 (not res!631304)) b!938258))

(declare-fun m!873433 () Bool)

(assert (=> d!113557 m!873433))

(declare-fun m!873435 () Bool)

(assert (=> b!938256 m!873435))

(declare-fun m!873437 () Bool)

(assert (=> b!938256 m!873437))

(assert (=> b!938256 m!873437))

(declare-fun m!873439 () Bool)

(assert (=> b!938256 m!873439))

(assert (=> b!938258 m!873437))

(assert (=> b!938258 m!873437))

(assert (=> b!938258 m!873439))

(assert (=> b!937895 d!113557))

(declare-fun d!113559 () Bool)

(declare-fun e!526913 () Bool)

(assert (=> d!113559 e!526913))

(declare-fun res!631305 () Bool)

(assert (=> d!113559 (=> res!631305 e!526913)))

(declare-fun lt!423616 () Bool)

(assert (=> d!113559 (= res!631305 (not lt!423616))))

(declare-fun lt!423619 () Bool)

(assert (=> d!113559 (= lt!423616 lt!423619)))

(declare-fun lt!423618 () Unit!31668)

(declare-fun e!526914 () Unit!31668)

(assert (=> d!113559 (= lt!423618 e!526914)))

(declare-fun c!97763 () Bool)

(assert (=> d!113559 (= c!97763 lt!423619)))

(assert (=> d!113559 (= lt!423619 (containsKey!450 (toList!6052 lt!423456) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113559 (= (contains!5111 lt!423456 #b1000000000000000000000000000000000000000000000000000000000000000) lt!423616)))

(declare-fun b!938259 () Bool)

(declare-fun lt!423617 () Unit!31668)

(assert (=> b!938259 (= e!526914 lt!423617)))

(assert (=> b!938259 (= lt!423617 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 lt!423456) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938259 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423456) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938260 () Bool)

(declare-fun Unit!31692 () Unit!31668)

(assert (=> b!938260 (= e!526914 Unit!31692)))

(declare-fun b!938261 () Bool)

(assert (=> b!938261 (= e!526913 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423456) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113559 c!97763) b!938259))

(assert (= (and d!113559 (not c!97763)) b!938260))

(assert (= (and d!113559 (not res!631305)) b!938261))

(declare-fun m!873441 () Bool)

(assert (=> d!113559 m!873441))

(declare-fun m!873443 () Bool)

(assert (=> b!938259 m!873443))

(declare-fun m!873445 () Bool)

(assert (=> b!938259 m!873445))

(assert (=> b!938259 m!873445))

(declare-fun m!873447 () Bool)

(assert (=> b!938259 m!873447))

(assert (=> b!938261 m!873445))

(assert (=> b!938261 m!873445))

(assert (=> b!938261 m!873447))

(assert (=> bm!40793 d!113559))

(declare-fun d!113561 () Bool)

(assert (=> d!113561 (arrayContainsKey!0 _keys!1487 lt!423429 #b00000000000000000000000000000000)))

(declare-fun lt!423622 () Unit!31668)

(declare-fun choose!13 (array!56460 (_ BitVec 64) (_ BitVec 32)) Unit!31668)

(assert (=> d!113561 (= lt!423622 (choose!13 _keys!1487 lt!423429 #b00000000000000000000000000000000))))

(assert (=> d!113561 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!113561 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!423429 #b00000000000000000000000000000000) lt!423622)))

(declare-fun bs!26333 () Bool)

(assert (= bs!26333 d!113561))

(assert (=> bs!26333 m!872853))

(declare-fun m!873449 () Bool)

(assert (=> bs!26333 m!873449))

(assert (=> b!937967 d!113561))

(declare-fun d!113563 () Bool)

(declare-fun res!631306 () Bool)

(declare-fun e!526915 () Bool)

(assert (=> d!113563 (=> res!631306 e!526915)))

(assert (=> d!113563 (= res!631306 (= (select (arr!27170 _keys!1487) #b00000000000000000000000000000000) lt!423429))))

(assert (=> d!113563 (= (arrayContainsKey!0 _keys!1487 lt!423429 #b00000000000000000000000000000000) e!526915)))

(declare-fun b!938262 () Bool)

(declare-fun e!526916 () Bool)

(assert (=> b!938262 (= e!526915 e!526916)))

(declare-fun res!631307 () Bool)

(assert (=> b!938262 (=> (not res!631307) (not e!526916))))

(assert (=> b!938262 (= res!631307 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(declare-fun b!938263 () Bool)

(assert (=> b!938263 (= e!526916 (arrayContainsKey!0 _keys!1487 lt!423429 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!113563 (not res!631306)) b!938262))

(assert (= (and b!938262 res!631307) b!938263))

(assert (=> d!113563 m!872841))

(declare-fun m!873451 () Bool)

(assert (=> b!938263 m!873451))

(assert (=> b!937967 d!113563))

(declare-fun b!938276 () Bool)

(declare-fun e!526923 () SeekEntryResult!8981)

(declare-fun lt!423630 () SeekEntryResult!8981)

(assert (=> b!938276 (= e!526923 (Found!8981 (index!38297 lt!423630)))))

(declare-fun d!113565 () Bool)

(declare-fun lt!423629 () SeekEntryResult!8981)

(assert (=> d!113565 (and (or ((_ is Undefined!8981) lt!423629) (not ((_ is Found!8981) lt!423629)) (and (bvsge (index!38296 lt!423629) #b00000000000000000000000000000000) (bvslt (index!38296 lt!423629) (size!27629 _keys!1487)))) (or ((_ is Undefined!8981) lt!423629) ((_ is Found!8981) lt!423629) (not ((_ is MissingZero!8981) lt!423629)) (and (bvsge (index!38295 lt!423629) #b00000000000000000000000000000000) (bvslt (index!38295 lt!423629) (size!27629 _keys!1487)))) (or ((_ is Undefined!8981) lt!423629) ((_ is Found!8981) lt!423629) ((_ is MissingZero!8981) lt!423629) (not ((_ is MissingVacant!8981) lt!423629)) (and (bvsge (index!38298 lt!423629) #b00000000000000000000000000000000) (bvslt (index!38298 lt!423629) (size!27629 _keys!1487)))) (or ((_ is Undefined!8981) lt!423629) (ite ((_ is Found!8981) lt!423629) (= (select (arr!27170 _keys!1487) (index!38296 lt!423629)) (select (arr!27170 _keys!1487) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8981) lt!423629) (= (select (arr!27170 _keys!1487) (index!38295 lt!423629)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8981) lt!423629) (= (select (arr!27170 _keys!1487) (index!38298 lt!423629)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!526924 () SeekEntryResult!8981)

(assert (=> d!113565 (= lt!423629 e!526924)))

(declare-fun c!97770 () Bool)

(assert (=> d!113565 (= c!97770 (and ((_ is Intermediate!8981) lt!423630) (undefined!9793 lt!423630)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56460 (_ BitVec 32)) SeekEntryResult!8981)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!113565 (= lt!423630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!27170 _keys!1487) #b00000000000000000000000000000000) mask!1881) (select (arr!27170 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881))))

(assert (=> d!113565 (validMask!0 mask!1881)))

(assert (=> d!113565 (= (seekEntryOrOpen!0 (select (arr!27170 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) lt!423629)))

(declare-fun b!938277 () Bool)

(declare-fun e!526925 () SeekEntryResult!8981)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56460 (_ BitVec 32)) SeekEntryResult!8981)

(assert (=> b!938277 (= e!526925 (seekKeyOrZeroReturnVacant!0 (x!80432 lt!423630) (index!38297 lt!423630) (index!38297 lt!423630) (select (arr!27170 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881))))

(declare-fun b!938278 () Bool)

(assert (=> b!938278 (= e!526924 e!526923)))

(declare-fun lt!423631 () (_ BitVec 64))

(assert (=> b!938278 (= lt!423631 (select (arr!27170 _keys!1487) (index!38297 lt!423630)))))

(declare-fun c!97771 () Bool)

(assert (=> b!938278 (= c!97771 (= lt!423631 (select (arr!27170 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!938279 () Bool)

(declare-fun c!97772 () Bool)

(assert (=> b!938279 (= c!97772 (= lt!423631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938279 (= e!526923 e!526925)))

(declare-fun b!938280 () Bool)

(assert (=> b!938280 (= e!526924 Undefined!8981)))

(declare-fun b!938281 () Bool)

(assert (=> b!938281 (= e!526925 (MissingZero!8981 (index!38297 lt!423630)))))

(assert (= (and d!113565 c!97770) b!938280))

(assert (= (and d!113565 (not c!97770)) b!938278))

(assert (= (and b!938278 c!97771) b!938276))

(assert (= (and b!938278 (not c!97771)) b!938279))

(assert (= (and b!938279 c!97772) b!938281))

(assert (= (and b!938279 (not c!97772)) b!938277))

(declare-fun m!873453 () Bool)

(assert (=> d!113565 m!873453))

(assert (=> d!113565 m!872841))

(declare-fun m!873455 () Bool)

(assert (=> d!113565 m!873455))

(declare-fun m!873457 () Bool)

(assert (=> d!113565 m!873457))

(assert (=> d!113565 m!872555))

(assert (=> d!113565 m!873455))

(assert (=> d!113565 m!872841))

(declare-fun m!873459 () Bool)

(assert (=> d!113565 m!873459))

(declare-fun m!873461 () Bool)

(assert (=> d!113565 m!873461))

(assert (=> b!938277 m!872841))

(declare-fun m!873463 () Bool)

(assert (=> b!938277 m!873463))

(declare-fun m!873465 () Bool)

(assert (=> b!938278 m!873465))

(assert (=> b!937967 d!113565))

(assert (=> b!937868 d!113447))

(declare-fun d!113567 () Bool)

(declare-fun res!631308 () Bool)

(declare-fun e!526926 () Bool)

(assert (=> d!113567 (=> res!631308 e!526926)))

(assert (=> d!113567 (= res!631308 (and ((_ is Cons!19150) (toList!6052 lt!423241)) (= (_1!6699 (h!20296 (toList!6052 lt!423241))) k0!1099)))))

(assert (=> d!113567 (= (containsKey!450 (toList!6052 lt!423241) k0!1099) e!526926)))

(declare-fun b!938282 () Bool)

(declare-fun e!526927 () Bool)

(assert (=> b!938282 (= e!526926 e!526927)))

(declare-fun res!631309 () Bool)

(assert (=> b!938282 (=> (not res!631309) (not e!526927))))

(assert (=> b!938282 (= res!631309 (and (or (not ((_ is Cons!19150) (toList!6052 lt!423241))) (bvsle (_1!6699 (h!20296 (toList!6052 lt!423241))) k0!1099)) ((_ is Cons!19150) (toList!6052 lt!423241)) (bvslt (_1!6699 (h!20296 (toList!6052 lt!423241))) k0!1099)))))

(declare-fun b!938283 () Bool)

(assert (=> b!938283 (= e!526927 (containsKey!450 (t!27449 (toList!6052 lt!423241)) k0!1099))))

(assert (= (and d!113567 (not res!631308)) b!938282))

(assert (= (and b!938282 res!631309) b!938283))

(declare-fun m!873467 () Bool)

(assert (=> b!938283 m!873467))

(assert (=> d!113349 d!113567))

(assert (=> b!937932 d!113365))

(declare-fun d!113569 () Bool)

(declare-fun e!526928 () Bool)

(assert (=> d!113569 e!526928))

(declare-fun res!631310 () Bool)

(assert (=> d!113569 (=> (not res!631310) (not e!526928))))

(declare-fun lt!423634 () ListLongMap!12073)

(assert (=> d!113569 (= res!631310 (contains!5111 lt!423634 (_1!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!423632 () List!19154)

(assert (=> d!113569 (= lt!423634 (ListLongMap!12074 lt!423632))))

(declare-fun lt!423635 () Unit!31668)

(declare-fun lt!423633 () Unit!31668)

(assert (=> d!113569 (= lt!423635 lt!423633)))

(assert (=> d!113569 (= (getValueByKey!483 lt!423632 (_1!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113569 (= lt!423633 (lemmaContainsTupThenGetReturnValue!259 lt!423632 (_1!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113569 (= lt!423632 (insertStrictlySorted!316 (toList!6052 call!40782) (_1!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113569 (= (+!2840 call!40782 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!423634)))

(declare-fun b!938284 () Bool)

(declare-fun res!631311 () Bool)

(assert (=> b!938284 (=> (not res!631311) (not e!526928))))

(assert (=> b!938284 (= res!631311 (= (getValueByKey!483 (toList!6052 lt!423634) (_1!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!938285 () Bool)

(assert (=> b!938285 (= e!526928 (contains!5114 (toList!6052 lt!423634) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113569 res!631310) b!938284))

(assert (= (and b!938284 res!631311) b!938285))

(declare-fun m!873469 () Bool)

(assert (=> d!113569 m!873469))

(declare-fun m!873471 () Bool)

(assert (=> d!113569 m!873471))

(declare-fun m!873473 () Bool)

(assert (=> d!113569 m!873473))

(declare-fun m!873475 () Bool)

(assert (=> d!113569 m!873475))

(declare-fun m!873477 () Bool)

(assert (=> b!938284 m!873477))

(declare-fun m!873479 () Bool)

(assert (=> b!938285 m!873479))

(assert (=> b!937897 d!113569))

(declare-fun d!113571 () Bool)

(assert (=> d!113571 (= (apply!853 lt!423456 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14330 (getValueByKey!483 (toList!6052 lt!423456) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26334 () Bool)

(assert (= bs!26334 d!113571))

(assert (=> bs!26334 m!872943))

(assert (=> bs!26334 m!872943))

(declare-fun m!873481 () Bool)

(assert (=> bs!26334 m!873481))

(assert (=> b!937985 d!113571))

(declare-fun d!113573 () Bool)

(declare-fun lt!423638 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!408 (List!19155) (InoxSet (_ BitVec 64)))

(assert (=> d!113573 (= lt!423638 (select (content!408 Nil!19152) (select (arr!27170 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun e!526934 () Bool)

(assert (=> d!113573 (= lt!423638 e!526934)))

(declare-fun res!631317 () Bool)

(assert (=> d!113573 (=> (not res!631317) (not e!526934))))

(assert (=> d!113573 (= res!631317 ((_ is Cons!19151) Nil!19152))))

(assert (=> d!113573 (= (contains!5113 Nil!19152 (select (arr!27170 _keys!1487) #b00000000000000000000000000000000)) lt!423638)))

(declare-fun b!938290 () Bool)

(declare-fun e!526933 () Bool)

(assert (=> b!938290 (= e!526934 e!526933)))

(declare-fun res!631316 () Bool)

(assert (=> b!938290 (=> res!631316 e!526933)))

(assert (=> b!938290 (= res!631316 (= (h!20297 Nil!19152) (select (arr!27170 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!938291 () Bool)

(assert (=> b!938291 (= e!526933 (contains!5113 (t!27450 Nil!19152) (select (arr!27170 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113573 res!631317) b!938290))

(assert (= (and b!938290 (not res!631316)) b!938291))

(declare-fun m!873483 () Bool)

(assert (=> d!113573 m!873483))

(assert (=> d!113573 m!872841))

(declare-fun m!873485 () Bool)

(assert (=> d!113573 m!873485))

(assert (=> b!938291 m!872841))

(declare-fun m!873487 () Bool)

(assert (=> b!938291 m!873487))

(assert (=> b!937955 d!113573))

(assert (=> d!113353 d!113335))

(declare-fun d!113575 () Bool)

(assert (=> d!113575 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19152)))

(assert (=> d!113575 true))

(declare-fun _$71!180 () Unit!31668)

(assert (=> d!113575 (= (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) _$71!180)))

(declare-fun bs!26335 () Bool)

(assert (= bs!26335 d!113575))

(assert (=> bs!26335 m!872579))

(assert (=> d!113353 d!113575))

(declare-fun d!113577 () Bool)

(assert (=> d!113577 (= (apply!853 lt!423456 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14330 (getValueByKey!483 (toList!6052 lt!423456) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26336 () Bool)

(assert (= bs!26336 d!113577))

(assert (=> bs!26336 m!873445))

(assert (=> bs!26336 m!873445))

(declare-fun m!873489 () Bool)

(assert (=> bs!26336 m!873489))

(assert (=> b!937987 d!113577))

(declare-fun d!113579 () Bool)

(assert (=> d!113579 (= (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (and (not (= (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27170 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937884 d!113579))

(assert (=> b!937988 d!113507))

(declare-fun d!113581 () Bool)

(declare-fun lt!423641 () Bool)

(declare-fun content!409 (List!19154) (InoxSet tuple2!13376))

(assert (=> d!113581 (= lt!423641 (select (content!409 (toList!6052 lt!423389)) lt!423246))))

(declare-fun e!526939 () Bool)

(assert (=> d!113581 (= lt!423641 e!526939)))

(declare-fun res!631323 () Bool)

(assert (=> d!113581 (=> (not res!631323) (not e!526939))))

(assert (=> d!113581 (= res!631323 ((_ is Cons!19150) (toList!6052 lt!423389)))))

(assert (=> d!113581 (= (contains!5114 (toList!6052 lt!423389) lt!423246) lt!423641)))

(declare-fun b!938296 () Bool)

(declare-fun e!526940 () Bool)

(assert (=> b!938296 (= e!526939 e!526940)))

(declare-fun res!631322 () Bool)

(assert (=> b!938296 (=> res!631322 e!526940)))

(assert (=> b!938296 (= res!631322 (= (h!20296 (toList!6052 lt!423389)) lt!423246))))

(declare-fun b!938297 () Bool)

(assert (=> b!938297 (= e!526940 (contains!5114 (t!27449 (toList!6052 lt!423389)) lt!423246))))

(assert (= (and d!113581 res!631323) b!938296))

(assert (= (and b!938296 (not res!631322)) b!938297))

(declare-fun m!873491 () Bool)

(assert (=> d!113581 m!873491))

(declare-fun m!873493 () Bool)

(assert (=> d!113581 m!873493))

(declare-fun m!873495 () Bool)

(assert (=> b!938297 m!873495))

(assert (=> b!937922 d!113581))

(declare-fun d!113583 () Bool)

(assert (=> d!113583 (not (= (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) k0!1099))))

(assert (=> d!113583 true))

(declare-fun _$67!49 () Unit!31668)

(assert (=> d!113583 (= (choose!21 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19152) _$67!49)))

(declare-fun bs!26337 () Bool)

(assert (= bs!26337 d!113583))

(assert (=> bs!26337 m!872599))

(assert (=> d!113345 d!113583))

(declare-fun d!113585 () Bool)

(declare-fun e!526941 () Bool)

(assert (=> d!113585 e!526941))

(declare-fun res!631324 () Bool)

(assert (=> d!113585 (=> (not res!631324) (not e!526941))))

(declare-fun lt!423644 () ListLongMap!12073)

(assert (=> d!113585 (= res!631324 (contains!5111 lt!423644 (_1!6699 (ite (or c!97665 c!97662) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!423642 () List!19154)

(assert (=> d!113585 (= lt!423644 (ListLongMap!12074 lt!423642))))

(declare-fun lt!423645 () Unit!31668)

(declare-fun lt!423643 () Unit!31668)

(assert (=> d!113585 (= lt!423645 lt!423643)))

(assert (=> d!113585 (= (getValueByKey!483 lt!423642 (_1!6699 (ite (or c!97665 c!97662) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!488 (_2!6699 (ite (or c!97665 c!97662) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113585 (= lt!423643 (lemmaContainsTupThenGetReturnValue!259 lt!423642 (_1!6699 (ite (or c!97665 c!97662) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6699 (ite (or c!97665 c!97662) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113585 (= lt!423642 (insertStrictlySorted!316 (toList!6052 (ite c!97665 call!40783 (ite c!97662 call!40786 call!40784))) (_1!6699 (ite (or c!97665 c!97662) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6699 (ite (or c!97665 c!97662) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113585 (= (+!2840 (ite c!97665 call!40783 (ite c!97662 call!40786 call!40784)) (ite (or c!97665 c!97662) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!423644)))

(declare-fun b!938298 () Bool)

(declare-fun res!631325 () Bool)

(assert (=> b!938298 (=> (not res!631325) (not e!526941))))

(assert (=> b!938298 (= res!631325 (= (getValueByKey!483 (toList!6052 lt!423644) (_1!6699 (ite (or c!97665 c!97662) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!488 (_2!6699 (ite (or c!97665 c!97662) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!938299 () Bool)

(assert (=> b!938299 (= e!526941 (contains!5114 (toList!6052 lt!423644) (ite (or c!97665 c!97662) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113585 res!631324) b!938298))

(assert (= (and b!938298 res!631325) b!938299))

(declare-fun m!873497 () Bool)

(assert (=> d!113585 m!873497))

(declare-fun m!873499 () Bool)

(assert (=> d!113585 m!873499))

(declare-fun m!873501 () Bool)

(assert (=> d!113585 m!873501))

(declare-fun m!873503 () Bool)

(assert (=> d!113585 m!873503))

(declare-fun m!873505 () Bool)

(assert (=> b!938298 m!873505))

(declare-fun m!873507 () Bool)

(assert (=> b!938299 m!873507))

(assert (=> bm!40778 d!113585))

(declare-fun d!113587 () Bool)

(declare-fun lt!423646 () Bool)

(assert (=> d!113587 (= lt!423646 (select (content!409 (toList!6052 lt!423405)) lt!423246))))

(declare-fun e!526942 () Bool)

(assert (=> d!113587 (= lt!423646 e!526942)))

(declare-fun res!631327 () Bool)

(assert (=> d!113587 (=> (not res!631327) (not e!526942))))

(assert (=> d!113587 (= res!631327 ((_ is Cons!19150) (toList!6052 lt!423405)))))

(assert (=> d!113587 (= (contains!5114 (toList!6052 lt!423405) lt!423246) lt!423646)))

(declare-fun b!938300 () Bool)

(declare-fun e!526943 () Bool)

(assert (=> b!938300 (= e!526942 e!526943)))

(declare-fun res!631326 () Bool)

(assert (=> b!938300 (=> res!631326 e!526943)))

(assert (=> b!938300 (= res!631326 (= (h!20296 (toList!6052 lt!423405)) lt!423246))))

(declare-fun b!938301 () Bool)

(assert (=> b!938301 (= e!526943 (contains!5114 (t!27449 (toList!6052 lt!423405)) lt!423246))))

(assert (= (and d!113587 res!631327) b!938300))

(assert (= (and b!938300 (not res!631326)) b!938301))

(declare-fun m!873509 () Bool)

(assert (=> d!113587 m!873509))

(declare-fun m!873511 () Bool)

(assert (=> d!113587 m!873511))

(declare-fun m!873513 () Bool)

(assert (=> b!938301 m!873513))

(assert (=> b!937935 d!113587))

(assert (=> bm!40780 d!113553))

(declare-fun d!113589 () Bool)

(assert (=> d!113589 (= (apply!853 lt!423353 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14330 (getValueByKey!483 (toList!6052 lt!423353) (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun bs!26338 () Bool)

(assert (= bs!26338 d!113589))

(assert (=> bs!26338 m!872599))

(declare-fun m!873515 () Bool)

(assert (=> bs!26338 m!873515))

(assert (=> bs!26338 m!873515))

(declare-fun m!873517 () Bool)

(assert (=> bs!26338 m!873517))

(assert (=> b!937875 d!113589))

(assert (=> b!937875 d!113351))

(declare-fun d!113591 () Bool)

(declare-fun e!526944 () Bool)

(assert (=> d!113591 e!526944))

(declare-fun res!631328 () Bool)

(assert (=> d!113591 (=> res!631328 e!526944)))

(declare-fun lt!423647 () Bool)

(assert (=> d!113591 (= res!631328 (not lt!423647))))

(declare-fun lt!423650 () Bool)

(assert (=> d!113591 (= lt!423647 lt!423650)))

(declare-fun lt!423649 () Unit!31668)

(declare-fun e!526945 () Unit!31668)

(assert (=> d!113591 (= lt!423649 e!526945)))

(declare-fun c!97773 () Bool)

(assert (=> d!113591 (= c!97773 lt!423650)))

(assert (=> d!113591 (= lt!423650 (containsKey!450 (toList!6052 lt!423353) (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> d!113591 (= (contains!5111 lt!423353 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) lt!423647)))

(declare-fun b!938302 () Bool)

(declare-fun lt!423648 () Unit!31668)

(assert (=> b!938302 (= e!526945 lt!423648)))

(assert (=> b!938302 (= lt!423648 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 lt!423353) (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938302 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423353) (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938303 () Bool)

(declare-fun Unit!31693 () Unit!31668)

(assert (=> b!938303 (= e!526945 Unit!31693)))

(declare-fun b!938304 () Bool)

(assert (=> b!938304 (= e!526944 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423353) (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (= (and d!113591 c!97773) b!938302))

(assert (= (and d!113591 (not c!97773)) b!938303))

(assert (= (and d!113591 (not res!631328)) b!938304))

(assert (=> d!113591 m!872599))

(declare-fun m!873519 () Bool)

(assert (=> d!113591 m!873519))

(assert (=> b!938302 m!872599))

(declare-fun m!873521 () Bool)

(assert (=> b!938302 m!873521))

(assert (=> b!938302 m!872599))

(assert (=> b!938302 m!873515))

(assert (=> b!938302 m!873515))

(declare-fun m!873523 () Bool)

(assert (=> b!938302 m!873523))

(assert (=> b!938304 m!872599))

(assert (=> b!938304 m!873515))

(assert (=> b!938304 m!873515))

(assert (=> b!938304 m!873523))

(assert (=> b!937860 d!113591))

(declare-fun d!113593 () Bool)

(declare-fun lt!423651 () Bool)

(assert (=> d!113593 (= lt!423651 (select (content!408 Nil!19152) (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!526947 () Bool)

(assert (=> d!113593 (= lt!423651 e!526947)))

(declare-fun res!631330 () Bool)

(assert (=> d!113593 (=> (not res!631330) (not e!526947))))

(assert (=> d!113593 (= res!631330 ((_ is Cons!19151) Nil!19152))))

(assert (=> d!113593 (= (contains!5113 Nil!19152 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) lt!423651)))

(declare-fun b!938305 () Bool)

(declare-fun e!526946 () Bool)

(assert (=> b!938305 (= e!526947 e!526946)))

(declare-fun res!631329 () Bool)

(assert (=> b!938305 (=> res!631329 e!526946)))

(assert (=> b!938305 (= res!631329 (= (h!20297 Nil!19152) (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938306 () Bool)

(assert (=> b!938306 (= e!526946 (contains!5113 (t!27450 Nil!19152) (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (= (and d!113593 res!631330) b!938305))

(assert (= (and b!938305 (not res!631329)) b!938306))

(assert (=> d!113593 m!873483))

(assert (=> d!113593 m!872599))

(declare-fun m!873525 () Bool)

(assert (=> d!113593 m!873525))

(assert (=> b!938306 m!872599))

(declare-fun m!873527 () Bool)

(assert (=> b!938306 m!873527))

(assert (=> b!937916 d!113593))

(declare-fun d!113595 () Bool)

(declare-fun e!526948 () Bool)

(assert (=> d!113595 e!526948))

(declare-fun res!631331 () Bool)

(assert (=> d!113595 (=> res!631331 e!526948)))

(declare-fun lt!423652 () Bool)

(assert (=> d!113595 (= res!631331 (not lt!423652))))

(declare-fun lt!423655 () Bool)

(assert (=> d!113595 (= lt!423652 lt!423655)))

(declare-fun lt!423654 () Unit!31668)

(declare-fun e!526949 () Unit!31668)

(assert (=> d!113595 (= lt!423654 e!526949)))

(declare-fun c!97774 () Bool)

(assert (=> d!113595 (= c!97774 lt!423655)))

(assert (=> d!113595 (= lt!423655 (containsKey!450 (toList!6052 lt!423353) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113595 (= (contains!5111 lt!423353 #b0000000000000000000000000000000000000000000000000000000000000000) lt!423652)))

(declare-fun b!938307 () Bool)

(declare-fun lt!423653 () Unit!31668)

(assert (=> b!938307 (= e!526949 lt!423653)))

(assert (=> b!938307 (= lt!423653 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 lt!423353) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938307 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423353) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938308 () Bool)

(declare-fun Unit!31694 () Unit!31668)

(assert (=> b!938308 (= e!526949 Unit!31694)))

(declare-fun b!938309 () Bool)

(assert (=> b!938309 (= e!526948 (isDefined!355 (getValueByKey!483 (toList!6052 lt!423353) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113595 c!97774) b!938307))

(assert (= (and d!113595 (not c!97774)) b!938308))

(assert (= (and d!113595 (not res!631331)) b!938309))

(declare-fun m!873529 () Bool)

(assert (=> d!113595 m!873529))

(declare-fun m!873531 () Bool)

(assert (=> b!938307 m!873531))

(assert (=> b!938307 m!872995))

(assert (=> b!938307 m!872995))

(declare-fun m!873533 () Bool)

(assert (=> b!938307 m!873533))

(assert (=> b!938309 m!872995))

(assert (=> b!938309 m!872995))

(assert (=> b!938309 m!873533))

(assert (=> bm!40776 d!113595))

(assert (=> b!937994 d!113421))

(declare-fun d!113597 () Bool)

(declare-fun e!526950 () Bool)

(assert (=> d!113597 e!526950))

(declare-fun res!631332 () Bool)

(assert (=> d!113597 (=> (not res!631332) (not e!526950))))

(declare-fun lt!423658 () ListLongMap!12073)

(assert (=> d!113597 (= res!631332 (contains!5111 lt!423658 (_1!6699 (tuple2!13377 lt!423445 minValue!1173))))))

(declare-fun lt!423656 () List!19154)

(assert (=> d!113597 (= lt!423658 (ListLongMap!12074 lt!423656))))

(declare-fun lt!423659 () Unit!31668)

(declare-fun lt!423657 () Unit!31668)

(assert (=> d!113597 (= lt!423659 lt!423657)))

(assert (=> d!113597 (= (getValueByKey!483 lt!423656 (_1!6699 (tuple2!13377 lt!423445 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423445 minValue!1173))))))

(assert (=> d!113597 (= lt!423657 (lemmaContainsTupThenGetReturnValue!259 lt!423656 (_1!6699 (tuple2!13377 lt!423445 minValue!1173)) (_2!6699 (tuple2!13377 lt!423445 minValue!1173))))))

(assert (=> d!113597 (= lt!423656 (insertStrictlySorted!316 (toList!6052 lt!423442) (_1!6699 (tuple2!13377 lt!423445 minValue!1173)) (_2!6699 (tuple2!13377 lt!423445 minValue!1173))))))

(assert (=> d!113597 (= (+!2840 lt!423442 (tuple2!13377 lt!423445 minValue!1173)) lt!423658)))

(declare-fun b!938310 () Bool)

(declare-fun res!631333 () Bool)

(assert (=> b!938310 (=> (not res!631333) (not e!526950))))

(assert (=> b!938310 (= res!631333 (= (getValueByKey!483 (toList!6052 lt!423658) (_1!6699 (tuple2!13377 lt!423445 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423445 minValue!1173)))))))

(declare-fun b!938311 () Bool)

(assert (=> b!938311 (= e!526950 (contains!5114 (toList!6052 lt!423658) (tuple2!13377 lt!423445 minValue!1173)))))

(assert (= (and d!113597 res!631332) b!938310))

(assert (= (and b!938310 res!631333) b!938311))

(declare-fun m!873535 () Bool)

(assert (=> d!113597 m!873535))

(declare-fun m!873537 () Bool)

(assert (=> d!113597 m!873537))

(declare-fun m!873539 () Bool)

(assert (=> d!113597 m!873539))

(declare-fun m!873541 () Bool)

(assert (=> d!113597 m!873541))

(declare-fun m!873543 () Bool)

(assert (=> b!938310 m!873543))

(declare-fun m!873545 () Bool)

(assert (=> b!938311 m!873545))

(assert (=> b!937994 d!113597))

(declare-fun d!113599 () Bool)

(assert (=> d!113599 (= (apply!853 (+!2840 lt!423440 (tuple2!13377 lt!423436 zeroValue!1173)) lt!423443) (get!14330 (getValueByKey!483 (toList!6052 (+!2840 lt!423440 (tuple2!13377 lt!423436 zeroValue!1173))) lt!423443)))))

(declare-fun bs!26339 () Bool)

(assert (= bs!26339 d!113599))

(declare-fun m!873547 () Bool)

(assert (=> bs!26339 m!873547))

(assert (=> bs!26339 m!873547))

(declare-fun m!873549 () Bool)

(assert (=> bs!26339 m!873549))

(assert (=> b!937994 d!113599))

(declare-fun d!113601 () Bool)

(declare-fun e!526951 () Bool)

(assert (=> d!113601 e!526951))

(declare-fun res!631334 () Bool)

(assert (=> d!113601 (=> (not res!631334) (not e!526951))))

(declare-fun lt!423662 () ListLongMap!12073)

(assert (=> d!113601 (= res!631334 (contains!5111 lt!423662 (_1!6699 (tuple2!13377 lt!423436 zeroValue!1173))))))

(declare-fun lt!423660 () List!19154)

(assert (=> d!113601 (= lt!423662 (ListLongMap!12074 lt!423660))))

(declare-fun lt!423663 () Unit!31668)

(declare-fun lt!423661 () Unit!31668)

(assert (=> d!113601 (= lt!423663 lt!423661)))

(assert (=> d!113601 (= (getValueByKey!483 lt!423660 (_1!6699 (tuple2!13377 lt!423436 zeroValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423436 zeroValue!1173))))))

(assert (=> d!113601 (= lt!423661 (lemmaContainsTupThenGetReturnValue!259 lt!423660 (_1!6699 (tuple2!13377 lt!423436 zeroValue!1173)) (_2!6699 (tuple2!13377 lt!423436 zeroValue!1173))))))

(assert (=> d!113601 (= lt!423660 (insertStrictlySorted!316 (toList!6052 lt!423440) (_1!6699 (tuple2!13377 lt!423436 zeroValue!1173)) (_2!6699 (tuple2!13377 lt!423436 zeroValue!1173))))))

(assert (=> d!113601 (= (+!2840 lt!423440 (tuple2!13377 lt!423436 zeroValue!1173)) lt!423662)))

(declare-fun b!938312 () Bool)

(declare-fun res!631335 () Bool)

(assert (=> b!938312 (=> (not res!631335) (not e!526951))))

(assert (=> b!938312 (= res!631335 (= (getValueByKey!483 (toList!6052 lt!423662) (_1!6699 (tuple2!13377 lt!423436 zeroValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423436 zeroValue!1173)))))))

(declare-fun b!938313 () Bool)

(assert (=> b!938313 (= e!526951 (contains!5114 (toList!6052 lt!423662) (tuple2!13377 lt!423436 zeroValue!1173)))))

(assert (= (and d!113601 res!631334) b!938312))

(assert (= (and b!938312 res!631335) b!938313))

(declare-fun m!873551 () Bool)

(assert (=> d!113601 m!873551))

(declare-fun m!873553 () Bool)

(assert (=> d!113601 m!873553))

(declare-fun m!873555 () Bool)

(assert (=> d!113601 m!873555))

(declare-fun m!873557 () Bool)

(assert (=> d!113601 m!873557))

(declare-fun m!873559 () Bool)

(assert (=> b!938312 m!873559))

(declare-fun m!873561 () Bool)

(assert (=> b!938313 m!873561))

(assert (=> b!937994 d!113601))

(declare-fun d!113603 () Bool)

(assert (=> d!113603 (= (apply!853 (+!2840 lt!423440 (tuple2!13377 lt!423436 zeroValue!1173)) lt!423443) (apply!853 lt!423440 lt!423443))))

(declare-fun lt!423664 () Unit!31668)

(assert (=> d!113603 (= lt!423664 (choose!1554 lt!423440 lt!423436 zeroValue!1173 lt!423443))))

(declare-fun e!526952 () Bool)

(assert (=> d!113603 e!526952))

(declare-fun res!631336 () Bool)

(assert (=> d!113603 (=> (not res!631336) (not e!526952))))

(assert (=> d!113603 (= res!631336 (contains!5111 lt!423440 lt!423443))))

(assert (=> d!113603 (= (addApplyDifferent!439 lt!423440 lt!423436 zeroValue!1173 lt!423443) lt!423664)))

(declare-fun b!938314 () Bool)

(assert (=> b!938314 (= e!526952 (not (= lt!423443 lt!423436)))))

(assert (= (and d!113603 res!631336) b!938314))

(declare-fun m!873563 () Bool)

(assert (=> d!113603 m!873563))

(assert (=> d!113603 m!872893))

(assert (=> d!113603 m!872897))

(assert (=> d!113603 m!872893))

(assert (=> d!113603 m!872891))

(declare-fun m!873565 () Bool)

(assert (=> d!113603 m!873565))

(assert (=> b!937994 d!113603))

(declare-fun d!113605 () Bool)

(assert (=> d!113605 (= (apply!853 (+!2840 lt!423442 (tuple2!13377 lt!423445 minValue!1173)) lt!423454) (get!14330 (getValueByKey!483 (toList!6052 (+!2840 lt!423442 (tuple2!13377 lt!423445 minValue!1173))) lt!423454)))))

(declare-fun bs!26340 () Bool)

(assert (= bs!26340 d!113605))

(declare-fun m!873567 () Bool)

(assert (=> bs!26340 m!873567))

(assert (=> bs!26340 m!873567))

(declare-fun m!873569 () Bool)

(assert (=> bs!26340 m!873569))

(assert (=> b!937994 d!113605))

(declare-fun d!113607 () Bool)

(assert (=> d!113607 (contains!5111 (+!2840 lt!423439 (tuple2!13377 lt!423448 zeroValue!1173)) lt!423449)))

(declare-fun lt!423665 () Unit!31668)

(assert (=> d!113607 (= lt!423665 (choose!1555 lt!423439 lt!423448 zeroValue!1173 lt!423449))))

(assert (=> d!113607 (contains!5111 lt!423439 lt!423449)))

(assert (=> d!113607 (= (addStillContains!559 lt!423439 lt!423448 zeroValue!1173 lt!423449) lt!423665)))

(declare-fun bs!26341 () Bool)

(assert (= bs!26341 d!113607))

(assert (=> bs!26341 m!872873))

(assert (=> bs!26341 m!872873))

(assert (=> bs!26341 m!872889))

(declare-fun m!873571 () Bool)

(assert (=> bs!26341 m!873571))

(declare-fun m!873573 () Bool)

(assert (=> bs!26341 m!873573))

(assert (=> b!937994 d!113607))

(declare-fun d!113609 () Bool)

(declare-fun e!526953 () Bool)

(assert (=> d!113609 e!526953))

(declare-fun res!631337 () Bool)

(assert (=> d!113609 (=> (not res!631337) (not e!526953))))

(declare-fun lt!423668 () ListLongMap!12073)

(assert (=> d!113609 (= res!631337 (contains!5111 lt!423668 (_1!6699 (tuple2!13377 lt!423452 minValue!1173))))))

(declare-fun lt!423666 () List!19154)

(assert (=> d!113609 (= lt!423668 (ListLongMap!12074 lt!423666))))

(declare-fun lt!423669 () Unit!31668)

(declare-fun lt!423667 () Unit!31668)

(assert (=> d!113609 (= lt!423669 lt!423667)))

(assert (=> d!113609 (= (getValueByKey!483 lt!423666 (_1!6699 (tuple2!13377 lt!423452 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423452 minValue!1173))))))

(assert (=> d!113609 (= lt!423667 (lemmaContainsTupThenGetReturnValue!259 lt!423666 (_1!6699 (tuple2!13377 lt!423452 minValue!1173)) (_2!6699 (tuple2!13377 lt!423452 minValue!1173))))))

(assert (=> d!113609 (= lt!423666 (insertStrictlySorted!316 (toList!6052 lt!423451) (_1!6699 (tuple2!13377 lt!423452 minValue!1173)) (_2!6699 (tuple2!13377 lt!423452 minValue!1173))))))

(assert (=> d!113609 (= (+!2840 lt!423451 (tuple2!13377 lt!423452 minValue!1173)) lt!423668)))

(declare-fun b!938315 () Bool)

(declare-fun res!631338 () Bool)

(assert (=> b!938315 (=> (not res!631338) (not e!526953))))

(assert (=> b!938315 (= res!631338 (= (getValueByKey!483 (toList!6052 lt!423668) (_1!6699 (tuple2!13377 lt!423452 minValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423452 minValue!1173)))))))

(declare-fun b!938316 () Bool)

(assert (=> b!938316 (= e!526953 (contains!5114 (toList!6052 lt!423668) (tuple2!13377 lt!423452 minValue!1173)))))

(assert (= (and d!113609 res!631337) b!938315))

(assert (= (and b!938315 res!631338) b!938316))

(declare-fun m!873575 () Bool)

(assert (=> d!113609 m!873575))

(declare-fun m!873577 () Bool)

(assert (=> d!113609 m!873577))

(declare-fun m!873579 () Bool)

(assert (=> d!113609 m!873579))

(declare-fun m!873581 () Bool)

(assert (=> d!113609 m!873581))

(declare-fun m!873583 () Bool)

(assert (=> b!938315 m!873583))

(declare-fun m!873585 () Bool)

(assert (=> b!938316 m!873585))

(assert (=> b!937994 d!113609))

(declare-fun d!113611 () Bool)

(assert (=> d!113611 (= (apply!853 lt!423440 lt!423443) (get!14330 (getValueByKey!483 (toList!6052 lt!423440) lt!423443)))))

(declare-fun bs!26342 () Bool)

(assert (= bs!26342 d!113611))

(declare-fun m!873587 () Bool)

(assert (=> bs!26342 m!873587))

(assert (=> bs!26342 m!873587))

(declare-fun m!873589 () Bool)

(assert (=> bs!26342 m!873589))

(assert (=> b!937994 d!113611))

(declare-fun d!113613 () Bool)

(assert (=> d!113613 (= (apply!853 (+!2840 lt!423442 (tuple2!13377 lt!423445 minValue!1173)) lt!423454) (apply!853 lt!423442 lt!423454))))

(declare-fun lt!423670 () Unit!31668)

(assert (=> d!113613 (= lt!423670 (choose!1554 lt!423442 lt!423445 minValue!1173 lt!423454))))

(declare-fun e!526954 () Bool)

(assert (=> d!113613 e!526954))

(declare-fun res!631339 () Bool)

(assert (=> d!113613 (=> (not res!631339) (not e!526954))))

(assert (=> d!113613 (= res!631339 (contains!5111 lt!423442 lt!423454))))

(assert (=> d!113613 (= (addApplyDifferent!439 lt!423442 lt!423445 minValue!1173 lt!423454) lt!423670)))

(declare-fun b!938317 () Bool)

(assert (=> b!938317 (= e!526954 (not (= lt!423454 lt!423445)))))

(assert (= (and d!113613 res!631339) b!938317))

(declare-fun m!873591 () Bool)

(assert (=> d!113613 m!873591))

(assert (=> d!113613 m!872885))

(assert (=> d!113613 m!872895))

(assert (=> d!113613 m!872885))

(assert (=> d!113613 m!872877))

(declare-fun m!873593 () Bool)

(assert (=> d!113613 m!873593))

(assert (=> b!937994 d!113613))

(declare-fun d!113615 () Bool)

(assert (=> d!113615 (= (apply!853 (+!2840 lt!423451 (tuple2!13377 lt!423452 minValue!1173)) lt!423453) (get!14330 (getValueByKey!483 (toList!6052 (+!2840 lt!423451 (tuple2!13377 lt!423452 minValue!1173))) lt!423453)))))

(declare-fun bs!26343 () Bool)

(assert (= bs!26343 d!113615))

(declare-fun m!873595 () Bool)

(assert (=> bs!26343 m!873595))

(assert (=> bs!26343 m!873595))

(declare-fun m!873597 () Bool)

(assert (=> bs!26343 m!873597))

(assert (=> b!937994 d!113615))

(declare-fun d!113617 () Bool)

(assert (=> d!113617 (= (apply!853 lt!423451 lt!423453) (get!14330 (getValueByKey!483 (toList!6052 lt!423451) lt!423453)))))

(declare-fun bs!26344 () Bool)

(assert (= bs!26344 d!113617))

(declare-fun m!873599 () Bool)

(assert (=> bs!26344 m!873599))

(assert (=> bs!26344 m!873599))

(declare-fun m!873601 () Bool)

(assert (=> bs!26344 m!873601))

(assert (=> b!937994 d!113617))

(declare-fun d!113619 () Bool)

(assert (=> d!113619 (= (apply!853 (+!2840 lt!423451 (tuple2!13377 lt!423452 minValue!1173)) lt!423453) (apply!853 lt!423451 lt!423453))))

(declare-fun lt!423671 () Unit!31668)

(assert (=> d!113619 (= lt!423671 (choose!1554 lt!423451 lt!423452 minValue!1173 lt!423453))))

(declare-fun e!526955 () Bool)

(assert (=> d!113619 e!526955))

(declare-fun res!631340 () Bool)

(assert (=> d!113619 (=> (not res!631340) (not e!526955))))

(assert (=> d!113619 (= res!631340 (contains!5111 lt!423451 lt!423453))))

(assert (=> d!113619 (= (addApplyDifferent!439 lt!423451 lt!423452 minValue!1173 lt!423453) lt!423671)))

(declare-fun b!938318 () Bool)

(assert (=> b!938318 (= e!526955 (not (= lt!423453 lt!423452)))))

(assert (= (and d!113619 res!631340) b!938318))

(declare-fun m!873603 () Bool)

(assert (=> d!113619 m!873603))

(assert (=> d!113619 m!872869))

(assert (=> d!113619 m!872887))

(assert (=> d!113619 m!872869))

(assert (=> d!113619 m!872899))

(declare-fun m!873605 () Bool)

(assert (=> d!113619 m!873605))

(assert (=> b!937994 d!113619))

(declare-fun d!113621 () Bool)

(declare-fun e!526956 () Bool)

(assert (=> d!113621 e!526956))

(declare-fun res!631341 () Bool)

(assert (=> d!113621 (=> (not res!631341) (not e!526956))))

(declare-fun lt!423674 () ListLongMap!12073)

(assert (=> d!113621 (= res!631341 (contains!5111 lt!423674 (_1!6699 (tuple2!13377 lt!423448 zeroValue!1173))))))

(declare-fun lt!423672 () List!19154)

(assert (=> d!113621 (= lt!423674 (ListLongMap!12074 lt!423672))))

(declare-fun lt!423675 () Unit!31668)

(declare-fun lt!423673 () Unit!31668)

(assert (=> d!113621 (= lt!423675 lt!423673)))

(assert (=> d!113621 (= (getValueByKey!483 lt!423672 (_1!6699 (tuple2!13377 lt!423448 zeroValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423448 zeroValue!1173))))))

(assert (=> d!113621 (= lt!423673 (lemmaContainsTupThenGetReturnValue!259 lt!423672 (_1!6699 (tuple2!13377 lt!423448 zeroValue!1173)) (_2!6699 (tuple2!13377 lt!423448 zeroValue!1173))))))

(assert (=> d!113621 (= lt!423672 (insertStrictlySorted!316 (toList!6052 lt!423439) (_1!6699 (tuple2!13377 lt!423448 zeroValue!1173)) (_2!6699 (tuple2!13377 lt!423448 zeroValue!1173))))))

(assert (=> d!113621 (= (+!2840 lt!423439 (tuple2!13377 lt!423448 zeroValue!1173)) lt!423674)))

(declare-fun b!938319 () Bool)

(declare-fun res!631342 () Bool)

(assert (=> b!938319 (=> (not res!631342) (not e!526956))))

(assert (=> b!938319 (= res!631342 (= (getValueByKey!483 (toList!6052 lt!423674) (_1!6699 (tuple2!13377 lt!423448 zeroValue!1173))) (Some!488 (_2!6699 (tuple2!13377 lt!423448 zeroValue!1173)))))))

(declare-fun b!938320 () Bool)

(assert (=> b!938320 (= e!526956 (contains!5114 (toList!6052 lt!423674) (tuple2!13377 lt!423448 zeroValue!1173)))))

(assert (= (and d!113621 res!631341) b!938319))

(assert (= (and b!938319 res!631342) b!938320))

(declare-fun m!873607 () Bool)

(assert (=> d!113621 m!873607))

(declare-fun m!873609 () Bool)

(assert (=> d!113621 m!873609))

(declare-fun m!873611 () Bool)

(assert (=> d!113621 m!873611))

(declare-fun m!873613 () Bool)

(assert (=> d!113621 m!873613))

(declare-fun m!873615 () Bool)

(assert (=> b!938319 m!873615))

(declare-fun m!873617 () Bool)

(assert (=> b!938320 m!873617))

(assert (=> b!937994 d!113621))

(declare-fun d!113623 () Bool)

(assert (=> d!113623 (= (apply!853 lt!423442 lt!423454) (get!14330 (getValueByKey!483 (toList!6052 lt!423442) lt!423454)))))

(declare-fun bs!26345 () Bool)

(assert (= bs!26345 d!113623))

(declare-fun m!873619 () Bool)

(assert (=> bs!26345 m!873619))

(assert (=> bs!26345 m!873619))

(declare-fun m!873621 () Bool)

(assert (=> bs!26345 m!873621))

(assert (=> b!937994 d!113623))

(declare-fun d!113625 () Bool)

(declare-fun e!526957 () Bool)

(assert (=> d!113625 e!526957))

(declare-fun res!631343 () Bool)

(assert (=> d!113625 (=> res!631343 e!526957)))

(declare-fun lt!423676 () Bool)

(assert (=> d!113625 (= res!631343 (not lt!423676))))

(declare-fun lt!423679 () Bool)

(assert (=> d!113625 (= lt!423676 lt!423679)))

(declare-fun lt!423678 () Unit!31668)

(declare-fun e!526958 () Unit!31668)

(assert (=> d!113625 (= lt!423678 e!526958)))

(declare-fun c!97775 () Bool)

(assert (=> d!113625 (= c!97775 lt!423679)))

(assert (=> d!113625 (= lt!423679 (containsKey!450 (toList!6052 (+!2840 lt!423439 (tuple2!13377 lt!423448 zeroValue!1173))) lt!423449))))

(assert (=> d!113625 (= (contains!5111 (+!2840 lt!423439 (tuple2!13377 lt!423448 zeroValue!1173)) lt!423449) lt!423676)))

(declare-fun b!938321 () Bool)

(declare-fun lt!423677 () Unit!31668)

(assert (=> b!938321 (= e!526958 lt!423677)))

(assert (=> b!938321 (= lt!423677 (lemmaContainsKeyImpliesGetValueByKeyDefined!346 (toList!6052 (+!2840 lt!423439 (tuple2!13377 lt!423448 zeroValue!1173))) lt!423449))))

(assert (=> b!938321 (isDefined!355 (getValueByKey!483 (toList!6052 (+!2840 lt!423439 (tuple2!13377 lt!423448 zeroValue!1173))) lt!423449))))

(declare-fun b!938322 () Bool)

(declare-fun Unit!31695 () Unit!31668)

(assert (=> b!938322 (= e!526958 Unit!31695)))

(declare-fun b!938323 () Bool)

(assert (=> b!938323 (= e!526957 (isDefined!355 (getValueByKey!483 (toList!6052 (+!2840 lt!423439 (tuple2!13377 lt!423448 zeroValue!1173))) lt!423449)))))

(assert (= (and d!113625 c!97775) b!938321))

(assert (= (and d!113625 (not c!97775)) b!938322))

(assert (= (and d!113625 (not res!631343)) b!938323))

(declare-fun m!873623 () Bool)

(assert (=> d!113625 m!873623))

(declare-fun m!873625 () Bool)

(assert (=> b!938321 m!873625))

(declare-fun m!873627 () Bool)

(assert (=> b!938321 m!873627))

(assert (=> b!938321 m!873627))

(declare-fun m!873629 () Bool)

(assert (=> b!938321 m!873629))

(assert (=> b!938323 m!873627))

(assert (=> b!938323 m!873627))

(assert (=> b!938323 m!873629))

(assert (=> b!937994 d!113625))

(assert (=> b!937889 d!113579))

(assert (=> b!937901 d!113327))

(declare-fun d!113627 () Bool)

(declare-fun e!526959 () Bool)

(assert (=> d!113627 e!526959))

(declare-fun res!631344 () Bool)

(assert (=> d!113627 (=> (not res!631344) (not e!526959))))

(declare-fun lt!423682 () ListLongMap!12073)

(assert (=> d!113627 (= res!631344 (contains!5111 lt!423682 (_1!6699 (tuple2!13377 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!423680 () List!19154)

(assert (=> d!113627 (= lt!423682 (ListLongMap!12074 lt!423680))))

(declare-fun lt!423683 () Unit!31668)

(declare-fun lt!423681 () Unit!31668)

(assert (=> d!113627 (= lt!423683 lt!423681)))

(assert (=> d!113627 (= (getValueByKey!483 lt!423680 (_1!6699 (tuple2!13377 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!488 (_2!6699 (tuple2!13377 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113627 (= lt!423681 (lemmaContainsTupThenGetReturnValue!259 lt!423680 (_1!6699 (tuple2!13377 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!6699 (tuple2!13377 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113627 (= lt!423680 (insertStrictlySorted!316 (toList!6052 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)) (_1!6699 (tuple2!13377 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!6699 (tuple2!13377 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113627 (= (+!2840 (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13377 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!423682)))

(declare-fun b!938324 () Bool)

(declare-fun res!631345 () Bool)

(assert (=> b!938324 (=> (not res!631345) (not e!526959))))

(assert (=> b!938324 (= res!631345 (= (getValueByKey!483 (toList!6052 lt!423682) (_1!6699 (tuple2!13377 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!488 (_2!6699 (tuple2!13377 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!938325 () Bool)

(assert (=> b!938325 (= e!526959 (contains!5114 (toList!6052 lt!423682) (tuple2!13377 (select (arr!27170 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14328 (select (arr!27169 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!113627 res!631344) b!938324))

(assert (= (and b!938324 res!631345) b!938325))

(declare-fun m!873631 () Bool)

(assert (=> d!113627 m!873631))

(declare-fun m!873633 () Bool)

(assert (=> d!113627 m!873633))

(declare-fun m!873635 () Bool)

(assert (=> d!113627 m!873635))

(declare-fun m!873637 () Bool)

(assert (=> d!113627 m!873637))

(declare-fun m!873639 () Bool)

(assert (=> b!938324 m!873639))

(declare-fun m!873641 () Bool)

(assert (=> b!938325 m!873641))

(assert (=> b!937901 d!113627))

(declare-fun b!938326 () Bool)

(declare-fun e!526968 () Bool)

(declare-fun call!40821 () Bool)

(assert (=> b!938326 (= e!526968 (not call!40821))))

(declare-fun b!938327 () Bool)

(declare-fun e!526960 () ListLongMap!12073)

(declare-fun call!40825 () ListLongMap!12073)

(assert (=> b!938327 (= e!526960 call!40825)))

(declare-fun b!938328 () Bool)

(declare-fun e!526963 () ListLongMap!12073)

(declare-fun call!40822 () ListLongMap!12073)

(assert (=> b!938328 (= e!526963 call!40822)))

(declare-fun b!938329 () Bool)

(declare-fun e!526972 () Bool)

(declare-fun e!526966 () Bool)

(assert (=> b!938329 (= e!526972 e!526966)))

(declare-fun res!631350 () Bool)

(assert (=> b!938329 (=> (not res!631350) (not e!526966))))

(declare-fun lt!423705 () ListLongMap!12073)

(assert (=> b!938329 (= res!631350 (contains!5111 lt!423705 (select (arr!27170 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(assert (=> b!938329 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(declare-fun b!938330 () Bool)

(declare-fun e!526965 () Bool)

(declare-fun e!526961 () Bool)

(assert (=> b!938330 (= e!526965 e!526961)))

(declare-fun res!631346 () Bool)

(declare-fun call!40826 () Bool)

(assert (=> b!938330 (= res!631346 call!40826)))

(assert (=> b!938330 (=> (not res!631346) (not e!526961))))

(declare-fun b!938331 () Bool)

(declare-fun e!526967 () Bool)

(assert (=> b!938331 (= e!526968 e!526967)))

(declare-fun res!631349 () Bool)

(assert (=> b!938331 (= res!631349 call!40821)))

(assert (=> b!938331 (=> (not res!631349) (not e!526967))))

(declare-fun bm!40818 () Bool)

(declare-fun call!40827 () ListLongMap!12073)

(assert (=> bm!40818 (= call!40825 call!40827)))

(declare-fun b!938333 () Bool)

(assert (=> b!938333 (= e!526965 (not call!40826))))

(declare-fun call!40824 () ListLongMap!12073)

(declare-fun c!97781 () Bool)

(declare-fun c!97778 () Bool)

(declare-fun call!40823 () ListLongMap!12073)

(declare-fun bm!40819 () Bool)

(assert (=> bm!40819 (= call!40823 (+!2840 (ite c!97781 call!40824 (ite c!97778 call!40827 call!40825)) (ite (or c!97781 c!97778) (tuple2!13377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun bm!40820 () Bool)

(assert (=> bm!40820 (= call!40826 (contains!5111 lt!423705 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40821 () Bool)

(assert (=> bm!40821 (= call!40824 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!938334 () Bool)

(assert (=> b!938334 (= e!526967 (= (apply!853 lt!423705 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!938335 () Bool)

(declare-fun e!526971 () ListLongMap!12073)

(assert (=> b!938335 (= e!526971 e!526963)))

(assert (=> b!938335 (= c!97778 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938336 () Bool)

(assert (=> b!938336 (= e!526961 (= (apply!853 lt!423705 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!938337 () Bool)

(declare-fun e!526962 () Bool)

(assert (=> b!938337 (= e!526962 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!938338 () Bool)

(declare-fun e!526970 () Bool)

(assert (=> b!938338 (= e!526970 e!526965)))

(declare-fun c!97779 () Bool)

(assert (=> b!938338 (= c!97779 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!938339 () Bool)

(declare-fun e!526964 () Unit!31668)

(declare-fun Unit!31696 () Unit!31668)

(assert (=> b!938339 (= e!526964 Unit!31696)))

(declare-fun b!938340 () Bool)

(assert (=> b!938340 (= e!526960 call!40822)))

(declare-fun bm!40822 () Bool)

(assert (=> bm!40822 (= call!40827 call!40824)))

(declare-fun b!938341 () Bool)

(declare-fun res!631353 () Bool)

(assert (=> b!938341 (=> (not res!631353) (not e!526970))))

(assert (=> b!938341 (= res!631353 e!526972)))

(declare-fun res!631354 () Bool)

(assert (=> b!938341 (=> res!631354 e!526972)))

(assert (=> b!938341 (= res!631354 (not e!526962))))

(declare-fun res!631351 () Bool)

(assert (=> b!938341 (=> (not res!631351) (not e!526962))))

(assert (=> b!938341 (= res!631351 (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(declare-fun bm!40823 () Bool)

(assert (=> bm!40823 (= call!40822 call!40823)))

(declare-fun b!938342 () Bool)

(declare-fun res!631347 () Bool)

(assert (=> b!938342 (=> (not res!631347) (not e!526970))))

(assert (=> b!938342 (= res!631347 e!526968)))

(declare-fun c!97777 () Bool)

(assert (=> b!938342 (= c!97777 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!938343 () Bool)

(declare-fun lt!423693 () Unit!31668)

(assert (=> b!938343 (= e!526964 lt!423693)))

(declare-fun lt!423688 () ListLongMap!12073)

(assert (=> b!938343 (= lt!423688 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423697 () (_ BitVec 64))

(assert (=> b!938343 (= lt!423697 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423698 () (_ BitVec 64))

(assert (=> b!938343 (= lt!423698 (select (arr!27170 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!423699 () Unit!31668)

(assert (=> b!938343 (= lt!423699 (addStillContains!559 lt!423688 lt!423697 zeroValue!1173 lt!423698))))

(assert (=> b!938343 (contains!5111 (+!2840 lt!423688 (tuple2!13377 lt!423697 zeroValue!1173)) lt!423698)))

(declare-fun lt!423704 () Unit!31668)

(assert (=> b!938343 (= lt!423704 lt!423699)))

(declare-fun lt!423700 () ListLongMap!12073)

(assert (=> b!938343 (= lt!423700 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423701 () (_ BitVec 64))

(assert (=> b!938343 (= lt!423701 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423702 () (_ BitVec 64))

(assert (=> b!938343 (= lt!423702 (select (arr!27170 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!423696 () Unit!31668)

(assert (=> b!938343 (= lt!423696 (addApplyDifferent!439 lt!423700 lt!423701 minValue!1173 lt!423702))))

(assert (=> b!938343 (= (apply!853 (+!2840 lt!423700 (tuple2!13377 lt!423701 minValue!1173)) lt!423702) (apply!853 lt!423700 lt!423702))))

(declare-fun lt!423690 () Unit!31668)

(assert (=> b!938343 (= lt!423690 lt!423696)))

(declare-fun lt!423689 () ListLongMap!12073)

(assert (=> b!938343 (= lt!423689 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423685 () (_ BitVec 64))

(assert (=> b!938343 (= lt!423685 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423692 () (_ BitVec 64))

(assert (=> b!938343 (= lt!423692 (select (arr!27170 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!423695 () Unit!31668)

(assert (=> b!938343 (= lt!423695 (addApplyDifferent!439 lt!423689 lt!423685 zeroValue!1173 lt!423692))))

(assert (=> b!938343 (= (apply!853 (+!2840 lt!423689 (tuple2!13377 lt!423685 zeroValue!1173)) lt!423692) (apply!853 lt!423689 lt!423692))))

(declare-fun lt!423684 () Unit!31668)

(assert (=> b!938343 (= lt!423684 lt!423695)))

(declare-fun lt!423691 () ListLongMap!12073)

(assert (=> b!938343 (= lt!423691 (getCurrentListMapNoExtraKeys!3303 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423694 () (_ BitVec 64))

(assert (=> b!938343 (= lt!423694 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423703 () (_ BitVec 64))

(assert (=> b!938343 (= lt!423703 (select (arr!27170 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (=> b!938343 (= lt!423693 (addApplyDifferent!439 lt!423691 lt!423694 minValue!1173 lt!423703))))

(assert (=> b!938343 (= (apply!853 (+!2840 lt!423691 (tuple2!13377 lt!423694 minValue!1173)) lt!423703) (apply!853 lt!423691 lt!423703))))

(declare-fun d!113629 () Bool)

(assert (=> d!113629 e!526970))

(declare-fun res!631352 () Bool)

(assert (=> d!113629 (=> (not res!631352) (not e!526970))))

(assert (=> d!113629 (= res!631352 (or (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27629 _keys!1487)) (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27629 _keys!1487)))))))

(declare-fun lt!423687 () ListLongMap!12073)

(assert (=> d!113629 (= lt!423705 lt!423687)))

(declare-fun lt!423686 () Unit!31668)

(assert (=> d!113629 (= lt!423686 e!526964)))

(declare-fun c!97780 () Bool)

(declare-fun e!526969 () Bool)

(assert (=> d!113629 (= c!97780 e!526969)))

(declare-fun res!631348 () Bool)

(assert (=> d!113629 (=> (not res!631348) (not e!526969))))

(assert (=> d!113629 (= res!631348 (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(assert (=> d!113629 (= lt!423687 e!526971)))

(assert (=> d!113629 (= c!97781 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113629 (validMask!0 mask!1881)))

(assert (=> d!113629 (= (getCurrentListMap!3287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) lt!423705)))

(declare-fun b!938332 () Bool)

(assert (=> b!938332 (= e!526969 (validKeyInArray!0 (select (arr!27170 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!938344 () Bool)

(assert (=> b!938344 (= e!526966 (= (apply!853 lt!423705 (select (arr!27170 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) (get!14328 (select (arr!27169 _values!1231) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (dynLambda!1629 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!938344 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27628 _values!1231)))))

(assert (=> b!938344 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27629 _keys!1487)))))

(declare-fun b!938345 () Bool)

(assert (=> b!938345 (= e!526971 (+!2840 call!40823 (tuple2!13377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun bm!40824 () Bool)

(assert (=> bm!40824 (= call!40821 (contains!5111 lt!423705 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938346 () Bool)

(declare-fun c!97776 () Bool)

(assert (=> b!938346 (= c!97776 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!938346 (= e!526963 e!526960)))

(assert (= (and d!113629 c!97781) b!938345))

(assert (= (and d!113629 (not c!97781)) b!938335))

(assert (= (and b!938335 c!97778) b!938328))

(assert (= (and b!938335 (not c!97778)) b!938346))

(assert (= (and b!938346 c!97776) b!938340))

(assert (= (and b!938346 (not c!97776)) b!938327))

(assert (= (or b!938340 b!938327) bm!40818))

(assert (= (or b!938328 bm!40818) bm!40822))

(assert (= (or b!938328 b!938340) bm!40823))

(assert (= (or b!938345 bm!40822) bm!40821))

(assert (= (or b!938345 bm!40823) bm!40819))

(assert (= (and d!113629 res!631348) b!938332))

(assert (= (and d!113629 c!97780) b!938343))

(assert (= (and d!113629 (not c!97780)) b!938339))

(assert (= (and d!113629 res!631352) b!938341))

(assert (= (and b!938341 res!631351) b!938337))

(assert (= (and b!938341 (not res!631354)) b!938329))

(assert (= (and b!938329 res!631350) b!938344))

(assert (= (and b!938341 res!631353) b!938342))

(assert (= (and b!938342 c!97777) b!938331))

(assert (= (and b!938342 (not c!97777)) b!938326))

(assert (= (and b!938331 res!631349) b!938334))

(assert (= (or b!938331 b!938326) bm!40824))

(assert (= (and b!938342 res!631347) b!938338))

(assert (= (and b!938338 c!97779) b!938330))

(assert (= (and b!938338 (not c!97779)) b!938333))

(assert (= (and b!938330 res!631346) b!938336))

(assert (= (or b!938330 b!938333) bm!40820))

(declare-fun b_lambda!14193 () Bool)

(assert (=> (not b_lambda!14193) (not b!938344)))

(assert (=> b!938344 t!27448))

(declare-fun b_and!29123 () Bool)

(assert (= b_and!29121 (and (=> t!27448 result!12123) b_and!29123)))

(declare-fun m!873643 () Bool)

(assert (=> b!938343 m!873643))

(assert (=> b!938343 m!873169))

(declare-fun m!873645 () Bool)

(assert (=> b!938343 m!873645))

(declare-fun m!873647 () Bool)

(assert (=> b!938343 m!873647))

(declare-fun m!873649 () Bool)

(assert (=> b!938343 m!873649))

(declare-fun m!873651 () Bool)

(assert (=> b!938343 m!873651))

(declare-fun m!873653 () Bool)

(assert (=> b!938343 m!873653))

(declare-fun m!873655 () Bool)

(assert (=> b!938343 m!873655))

(declare-fun m!873657 () Bool)

(assert (=> b!938343 m!873657))

(assert (=> b!938343 m!873643))

(declare-fun m!873659 () Bool)

(assert (=> b!938343 m!873659))

(assert (=> b!938343 m!873645))

(declare-fun m!873661 () Bool)

(assert (=> b!938343 m!873661))

(declare-fun m!873663 () Bool)

(assert (=> b!938343 m!873663))

(assert (=> b!938343 m!873233))

(declare-fun m!873665 () Bool)

(assert (=> b!938343 m!873665))

(assert (=> b!938343 m!873657))

(declare-fun m!873667 () Bool)

(assert (=> b!938343 m!873667))

(assert (=> b!938343 m!873665))

(declare-fun m!873669 () Bool)

(assert (=> b!938343 m!873669))

(declare-fun m!873671 () Bool)

(assert (=> b!938343 m!873671))

(declare-fun m!873673 () Bool)

(assert (=> b!938345 m!873673))

(declare-fun m!873675 () Bool)

(assert (=> b!938336 m!873675))

(declare-fun m!873677 () Bool)

(assert (=> bm!40824 m!873677))

(assert (=> bm!40821 m!873169))

(assert (=> d!113629 m!872555))

(declare-fun m!873679 () Bool)

(assert (=> b!938334 m!873679))

(assert (=> b!938329 m!873233))

(assert (=> b!938329 m!873233))

(declare-fun m!873681 () Bool)

(assert (=> b!938329 m!873681))

(declare-fun m!873683 () Bool)

(assert (=> bm!40819 m!873683))

(assert (=> b!938337 m!873233))

(assert (=> b!938337 m!873233))

(assert (=> b!938337 m!873235))

(declare-fun m!873685 () Bool)

(assert (=> b!938344 m!873685))

(assert (=> b!938344 m!872569))

(declare-fun m!873687 () Bool)

(assert (=> b!938344 m!873687))

(assert (=> b!938344 m!873685))

(assert (=> b!938344 m!873233))

(declare-fun m!873689 () Bool)

(assert (=> b!938344 m!873689))

(assert (=> b!938344 m!872569))

(assert (=> b!938344 m!873233))

(declare-fun m!873691 () Bool)

(assert (=> bm!40820 m!873691))

(assert (=> b!938332 m!873233))

(assert (=> b!938332 m!873233))

(assert (=> b!938332 m!873235))

(assert (=> b!937901 d!113629))

(assert (=> b!937901 d!113351))

(declare-fun b!938348 () Bool)

(declare-fun e!526973 () Bool)

(assert (=> b!938348 (= e!526973 tp_is_empty!20259)))

(declare-fun condMapEmpty!32167 () Bool)

(declare-fun mapDefault!32167 () ValueCell!9648)

(assert (=> mapNonEmpty!32166 (= condMapEmpty!32167 (= mapRest!32166 ((as const (Array (_ BitVec 32) ValueCell!9648)) mapDefault!32167)))))

(declare-fun mapRes!32167 () Bool)

(assert (=> mapNonEmpty!32166 (= tp!61718 (and e!526973 mapRes!32167))))

(declare-fun mapNonEmpty!32167 () Bool)

(declare-fun tp!61719 () Bool)

(declare-fun e!526974 () Bool)

(assert (=> mapNonEmpty!32167 (= mapRes!32167 (and tp!61719 e!526974))))

(declare-fun mapKey!32167 () (_ BitVec 32))

(declare-fun mapRest!32167 () (Array (_ BitVec 32) ValueCell!9648))

(declare-fun mapValue!32167 () ValueCell!9648)

(assert (=> mapNonEmpty!32167 (= mapRest!32166 (store mapRest!32167 mapKey!32167 mapValue!32167))))

(declare-fun mapIsEmpty!32167 () Bool)

(assert (=> mapIsEmpty!32167 mapRes!32167))

(declare-fun b!938347 () Bool)

(assert (=> b!938347 (= e!526974 tp_is_empty!20259)))

(assert (= (and mapNonEmpty!32166 condMapEmpty!32167) mapIsEmpty!32167))

(assert (= (and mapNonEmpty!32166 (not condMapEmpty!32167)) mapNonEmpty!32167))

(assert (= (and mapNonEmpty!32167 ((_ is ValueCellFull!9648) mapValue!32167)) b!938347))

(assert (= (and mapNonEmpty!32166 ((_ is ValueCellFull!9648) mapDefault!32167)) b!938348))

(declare-fun m!873693 () Bool)

(assert (=> mapNonEmpty!32167 m!873693))

(declare-fun b_lambda!14195 () Bool)

(assert (= b_lambda!14179 (or (and start!79702 b_free!17751) b_lambda!14195)))

(declare-fun b_lambda!14197 () Bool)

(assert (= b_lambda!14193 (or (and start!79702 b_free!17751) b_lambda!14197)))

(declare-fun b_lambda!14199 () Bool)

(assert (= b_lambda!14187 (or (and start!79702 b_free!17751) b_lambda!14199)))

(declare-fun b_lambda!14201 () Bool)

(assert (= b_lambda!14191 (or (and start!79702 b_free!17751) b_lambda!14201)))

(declare-fun b_lambda!14203 () Bool)

(assert (= b_lambda!14185 (or (and start!79702 b_free!17751) b_lambda!14203)))

(declare-fun b_lambda!14205 () Bool)

(assert (= b_lambda!14183 (or (and start!79702 b_free!17751) b_lambda!14205)))

(declare-fun b_lambda!14207 () Bool)

(assert (= b_lambda!14189 (or (and start!79702 b_free!17751) b_lambda!14207)))

(declare-fun b_lambda!14209 () Bool)

(assert (= b_lambda!14181 (or (and start!79702 b_free!17751) b_lambda!14209)))

(check-sat (not b!938142) (not b!938176) (not b!938239) b_and!29123 (not b!938259) (not b!938249) (not d!113463) (not b_lambda!14171) (not b_lambda!14203) (not b!938230) (not b!938175) (not b!938323) (not d!113485) (not b!938180) (not d!113505) (not b!938312) (not d!113531) (not b_lambda!14209) (not b!938169) (not d!113557) (not bm!40821) (not d!113517) (not d!113441) (not d!113515) (not b!938223) (not b!938136) (not d!113429) (not d!113413) (not b!938256) (not b!938277) (not b!938159) (not b!938199) (not b!938043) (not d!113529) (not b!938146) (not b!938343) (not b!938130) (not d!113629) (not b!938337) (not d!113615) (not b!938090) (not b!938050) (not b!938132) (not b!938284) (not bm!40819) (not d!113449) (not b!938302) (not b!938174) (not d!113477) (not b!938253) (not b!938219) (not d!113617) (not b!938040) (not d!113527) (not b!938320) (not bm!40811) (not d!113591) (not b!938126) (not b!938285) (not b!938235) (not d!113491) (not b!938334) (not b!938194) (not b!938026) (not b!938124) (not b!938240) (not d!113539) (not b!938189) (not b!938224) (not d!113553) (not b!938158) (not b_lambda!14205) (not d!113549) (not b!938202) (not d!113603) (not d!113415) (not b!938310) (not d!113597) (not b!938332) (not d!113541) (not b!938033) (not b!938261) (not b!938184) (not b_lambda!14177) (not b!938201) (not d!113421) (not b!938324) (not b!938298) (not b!938311) (not d!113545) (not bm!40813) (not b!938313) (not bm!40820) (not b!938088) (not b!938187) (not b!938309) (not bm!40810) (not d!113459) (not b!938127) (not b!938038) (not b!938254) (not d!113443) (not d!113561) (not b!938087) (not d!113417) (not b!938121) (not b!938185) (not b_lambda!14197) (not bm!40815) (not b!938193) (not d!113395) (not b!938315) (not b!938155) (not b!938030) (not b!938165) (not d!113577) (not b!938173) (not d!113503) (not d!113623) (not b_lambda!14173) (not b_lambda!14207) (not d!113593) (not d!113569) (not d!113587) (not b!938181) (not d!113611) (not b!938206) (not b!938316) (not b!938161) (not b!938125) (not b!938190) (not b!938252) (not b!938345) (not d!113547) (not d!113427) (not b!938238) (not d!113423) (not d!113475) (not b!938234) (not d!113613) (not d!113401) (not d!113455) (not d!113383) (not b!938216) (not d!113607) (not b!938251) (not mapNonEmpty!32167) (not b!938258) (not d!113575) (not d!113543) (not d!113481) (not d!113609) (not b!938163) (not b!938143) (not b!938221) (not b_lambda!14175) (not d!113533) (not d!113451) (not b!938028) (not b!938153) (not b_lambda!14195) (not d!113595) (not d!113465) (not d!113551) (not b!938307) (not d!113535) (not b!938150) (not b!938306) (not d!113501) (not b!938192) (not d!113519) (not d!113555) (not d!113461) (not b!938129) (not d!113605) (not b!938344) (not b!938164) tp_is_empty!20259 (not b!938182) (not b!938301) (not d!113473) (not b!938325) (not d!113619) (not b!938283) (not bm!40809) (not b!938336) (not d!113589) (not d!113581) (not b!938304) (not d!113499) (not b!938168) (not b!938078) (not d!113525) (not b!938245) (not bm!40824) (not d!113625) (not b!938133) (not b!938195) (not b!938319) (not b!938072) (not b!938089) (not b!938321) (not b!938021) (not b!938299) (not b!938117) (not d!113559) (not d!113483) (not b!938214) (not b!938123) (not d!113467) (not d!113385) (not b!938291) (not b!938179) (not d!113571) (not d!113495) (not b!938157) (not d!113431) (not b!938329) (not b!938023) (not b!938037) (not d!113389) (not b!938263) (not d!113493) (not bm!40817) (not b!938198) (not d!113403) (not b!938197) (not b!938244) (not d!113433) (not d!113397) (not b_lambda!14199) (not b!938086) (not b!938200) (not b!938233) (not d!113479) (not d!113537) (not d!113379) (not b_lambda!14161) (not bm!40805) (not b!938222) (not b!938241) (not d!113453) (not b!938297) (not b!938137) (not b!938071) (not b!938178) (not b!938149) (not b!938116) (not d!113621) (not b!938236) (not d!113573) (not d!113599) (not b!938049) (not b!938250) (not d!113601) (not b!938211) (not b!938122) (not d!113565) (not bm!40812) (not d!113471) (not b_lambda!14201) (not b_next!17751) (not d!113585) (not b!938177) (not d!113411) (not d!113469) (not b!938019) (not d!113627) (not d!113523) (not b!938203) (not b!938140) (not b!938135) (not d!113457))
(check-sat b_and!29123 (not b_next!17751))
