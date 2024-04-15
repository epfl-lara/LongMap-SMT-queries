; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79682 () Bool)

(assert start!79682)

(declare-fun b_free!17749 () Bool)

(declare-fun b_next!17749 () Bool)

(assert (=> start!79682 (= b_free!17749 (not b_next!17749))))

(declare-fun tp!61704 () Bool)

(declare-fun b_and!29063 () Bool)

(assert (=> start!79682 (= tp!61704 b_and!29063)))

(declare-fun b!937451 () Bool)

(declare-fun e!526419 () Bool)

(declare-fun e!526414 () Bool)

(declare-fun mapRes!32157 () Bool)

(assert (=> b!937451 (= e!526419 (and e!526414 mapRes!32157))))

(declare-fun condMapEmpty!32157 () Bool)

(declare-datatypes ((V!31975 0))(
  ( (V!31976 (val!10179 Int)) )
))
(declare-datatypes ((ValueCell!9647 0))(
  ( (ValueCellFull!9647 (v!12703 V!31975)) (EmptyCell!9647) )
))
(declare-datatypes ((array!56421 0))(
  ( (array!56422 (arr!27151 (Array (_ BitVec 32) ValueCell!9647)) (size!27612 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56421)

(declare-fun mapDefault!32157 () ValueCell!9647)

(assert (=> b!937451 (= condMapEmpty!32157 (= (arr!27151 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9647)) mapDefault!32157)))))

(declare-fun mapNonEmpty!32157 () Bool)

(declare-fun tp!61703 () Bool)

(declare-fun e!526416 () Bool)

(assert (=> mapNonEmpty!32157 (= mapRes!32157 (and tp!61703 e!526416))))

(declare-fun mapRest!32157 () (Array (_ BitVec 32) ValueCell!9647))

(declare-fun mapValue!32157 () ValueCell!9647)

(declare-fun mapKey!32157 () (_ BitVec 32))

(assert (=> mapNonEmpty!32157 (= (arr!27151 _values!1231) (store mapRest!32157 mapKey!32157 mapValue!32157))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!526421 () Bool)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun b!937452 () Bool)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!56423 0))(
  ( (array!56424 (arr!27152 (Array (_ BitVec 32) (_ BitVec 64))) (size!27613 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56423)

(declare-fun zeroValue!1173 () V!31975)

(declare-fun minValue!1173 () V!31975)

(declare-datatypes ((tuple2!13432 0))(
  ( (tuple2!13433 (_1!6727 (_ BitVec 64)) (_2!6727 V!31975)) )
))
(declare-datatypes ((List!19176 0))(
  ( (Nil!19173) (Cons!19172 (h!20318 tuple2!13432) (t!27460 List!19176)) )
))
(declare-datatypes ((ListLongMap!12119 0))(
  ( (ListLongMap!12120 (toList!6075 List!19176)) )
))
(declare-fun contains!5077 (ListLongMap!12119 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3239 (array!56423 array!56421 (_ BitVec 32) (_ BitVec 32) V!31975 V!31975 (_ BitVec 32) Int) ListLongMap!12119)

(assert (=> b!937452 (= e!526421 (not (contains!5077 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) k0!1099)))))

(declare-fun b!937453 () Bool)

(declare-fun res!630950 () Bool)

(declare-fun e!526418 () Bool)

(assert (=> b!937453 (=> (not res!630950) (not e!526418))))

(assert (=> b!937453 (= res!630950 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27613 _keys!1487))))))

(declare-fun b!937454 () Bool)

(declare-fun res!630955 () Bool)

(assert (=> b!937454 (=> (not res!630955) (not e!526418))))

(declare-datatypes ((List!19177 0))(
  ( (Nil!19174) (Cons!19173 (h!20319 (_ BitVec 64)) (t!27461 List!19177)) )
))
(declare-fun arrayNoDuplicates!0 (array!56423 (_ BitVec 32) List!19177) Bool)

(assert (=> b!937454 (= res!630955 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19174))))

(declare-fun b!937456 () Bool)

(declare-fun res!630949 () Bool)

(assert (=> b!937456 (=> (not res!630949) (not e!526418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56423 (_ BitVec 32)) Bool)

(assert (=> b!937456 (= res!630949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!937457 () Bool)

(declare-fun e!526417 () Bool)

(assert (=> b!937457 (= e!526417 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937458 () Bool)

(declare-fun e!526413 () Bool)

(assert (=> b!937458 (= e!526418 e!526413)))

(declare-fun res!630952 () Bool)

(assert (=> b!937458 (=> (not res!630952) (not e!526413))))

(declare-fun lt!422966 () ListLongMap!12119)

(assert (=> b!937458 (= res!630952 (contains!5077 lt!422966 k0!1099))))

(assert (=> b!937458 (= lt!422966 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937459 () Bool)

(declare-datatypes ((Unit!31564 0))(
  ( (Unit!31565) )
))
(declare-fun e!526415 () Unit!31564)

(declare-fun e!526420 () Unit!31564)

(assert (=> b!937459 (= e!526415 e!526420)))

(declare-fun lt!422964 () (_ BitVec 64))

(assert (=> b!937459 (= lt!422964 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97556 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937459 (= c!97556 (validKeyInArray!0 lt!422964))))

(declare-fun b!937460 () Bool)

(declare-fun tp_is_empty!20257 () Bool)

(assert (=> b!937460 (= e!526416 tp_is_empty!20257)))

(declare-fun b!937461 () Bool)

(declare-fun lt!422967 () ListLongMap!12119)

(declare-fun lt!422963 () V!31975)

(declare-fun apply!849 (ListLongMap!12119 (_ BitVec 64)) V!31975)

(assert (=> b!937461 (= (apply!849 lt!422967 k0!1099) lt!422963)))

(declare-fun lt!422971 () V!31975)

(declare-fun lt!422961 () Unit!31564)

(declare-fun addApplyDifferent!433 (ListLongMap!12119 (_ BitVec 64) V!31975 (_ BitVec 64)) Unit!31564)

(assert (=> b!937461 (= lt!422961 (addApplyDifferent!433 lt!422966 lt!422964 lt!422971 k0!1099))))

(assert (=> b!937461 (not (= lt!422964 k0!1099))))

(declare-fun lt!422969 () Unit!31564)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56423 (_ BitVec 64) (_ BitVec 32) List!19177) Unit!31564)

(assert (=> b!937461 (= lt!422969 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19174))))

(assert (=> b!937461 e!526417))

(declare-fun c!97557 () Bool)

(assert (=> b!937461 (= c!97557 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422968 () Unit!31564)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!311 (array!56423 array!56421 (_ BitVec 32) (_ BitVec 32) V!31975 V!31975 (_ BitVec 64) (_ BitVec 32) Int) Unit!31564)

(assert (=> b!937461 (= lt!422968 (lemmaListMapContainsThenArrayContainsFrom!311 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!937461 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19174)))

(declare-fun lt!422970 () Unit!31564)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56423 (_ BitVec 32) (_ BitVec 32)) Unit!31564)

(assert (=> b!937461 (= lt!422970 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!937461 (contains!5077 lt!422967 k0!1099)))

(declare-fun lt!422962 () tuple2!13432)

(declare-fun +!2864 (ListLongMap!12119 tuple2!13432) ListLongMap!12119)

(assert (=> b!937461 (= lt!422967 (+!2864 lt!422966 lt!422962))))

(declare-fun lt!422973 () Unit!31564)

(declare-fun addStillContains!553 (ListLongMap!12119 (_ BitVec 64) V!31975 (_ BitVec 64)) Unit!31564)

(assert (=> b!937461 (= lt!422973 (addStillContains!553 lt!422966 lt!422964 lt!422971 k0!1099))))

(assert (=> b!937461 (= (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2864 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422962))))

(assert (=> b!937461 (= lt!422962 (tuple2!13433 lt!422964 lt!422971))))

(declare-fun get!14324 (ValueCell!9647 V!31975) V!31975)

(declare-fun dynLambda!1620 (Int (_ BitVec 64)) V!31975)

(assert (=> b!937461 (= lt!422971 (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422972 () Unit!31564)

(declare-fun lemmaListMapRecursiveValidKeyArray!228 (array!56423 array!56421 (_ BitVec 32) (_ BitVec 32) V!31975 V!31975 (_ BitVec 32) Int) Unit!31564)

(assert (=> b!937461 (= lt!422972 (lemmaListMapRecursiveValidKeyArray!228 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!937461 (= e!526420 lt!422961)))

(declare-fun mapIsEmpty!32157 () Bool)

(assert (=> mapIsEmpty!32157 mapRes!32157))

(declare-fun b!937462 () Bool)

(assert (=> b!937462 (= e!526414 tp_is_empty!20257)))

(declare-fun b!937463 () Bool)

(declare-fun e!526411 () Bool)

(assert (=> b!937463 (= e!526413 e!526411)))

(declare-fun res!630956 () Bool)

(assert (=> b!937463 (=> (not res!630956) (not e!526411))))

(declare-fun v!791 () V!31975)

(assert (=> b!937463 (= res!630956 (and (= lt!422963 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!937463 (= lt!422963 (apply!849 lt!422966 k0!1099))))

(declare-fun b!937464 () Bool)

(declare-fun arrayContainsKey!0 (array!56423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937464 (= e!526417 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!937465 () Bool)

(assert (=> b!937465 (= e!526411 e!526421)))

(declare-fun res!630951 () Bool)

(assert (=> b!937465 (=> (not res!630951) (not e!526421))))

(assert (=> b!937465 (= res!630951 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(declare-fun lt!422965 () Unit!31564)

(assert (=> b!937465 (= lt!422965 e!526415)))

(declare-fun c!97558 () Bool)

(assert (=> b!937465 (= c!97558 (validKeyInArray!0 k0!1099))))

(declare-fun b!937466 () Bool)

(declare-fun Unit!31566 () Unit!31564)

(assert (=> b!937466 (= e!526420 Unit!31566)))

(declare-fun b!937467 () Bool)

(declare-fun res!630953 () Bool)

(assert (=> b!937467 (=> (not res!630953) (not e!526418))))

(assert (=> b!937467 (= res!630953 (and (= (size!27612 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27613 _keys!1487) (size!27612 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937455 () Bool)

(declare-fun Unit!31567 () Unit!31564)

(assert (=> b!937455 (= e!526415 Unit!31567)))

(declare-fun res!630954 () Bool)

(assert (=> start!79682 (=> (not res!630954) (not e!526418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79682 (= res!630954 (validMask!0 mask!1881))))

(assert (=> start!79682 e!526418))

(assert (=> start!79682 true))

(assert (=> start!79682 tp_is_empty!20257))

(declare-fun array_inv!21182 (array!56421) Bool)

(assert (=> start!79682 (and (array_inv!21182 _values!1231) e!526419)))

(assert (=> start!79682 tp!61704))

(declare-fun array_inv!21183 (array!56423) Bool)

(assert (=> start!79682 (array_inv!21183 _keys!1487)))

(assert (= (and start!79682 res!630954) b!937467))

(assert (= (and b!937467 res!630953) b!937456))

(assert (= (and b!937456 res!630949) b!937454))

(assert (= (and b!937454 res!630955) b!937453))

(assert (= (and b!937453 res!630950) b!937458))

(assert (= (and b!937458 res!630952) b!937463))

(assert (= (and b!937463 res!630956) b!937465))

(assert (= (and b!937465 c!97558) b!937459))

(assert (= (and b!937465 (not c!97558)) b!937455))

(assert (= (and b!937459 c!97556) b!937461))

(assert (= (and b!937459 (not c!97556)) b!937466))

(assert (= (and b!937461 c!97557) b!937464))

(assert (= (and b!937461 (not c!97557)) b!937457))

(assert (= (and b!937465 res!630951) b!937452))

(assert (= (and b!937451 condMapEmpty!32157) mapIsEmpty!32157))

(assert (= (and b!937451 (not condMapEmpty!32157)) mapNonEmpty!32157))

(get-info :version)

(assert (= (and mapNonEmpty!32157 ((_ is ValueCellFull!9647) mapValue!32157)) b!937460))

(assert (= (and b!937451 ((_ is ValueCellFull!9647) mapDefault!32157)) b!937462))

(assert (= start!79682 b!937451))

(declare-fun b_lambda!14137 () Bool)

(assert (=> (not b_lambda!14137) (not b!937461)))

(declare-fun t!27459 () Bool)

(declare-fun tb!6135 () Bool)

(assert (=> (and start!79682 (= defaultEntry!1235 defaultEntry!1235) t!27459) tb!6135))

(declare-fun result!12111 () Bool)

(assert (=> tb!6135 (= result!12111 tp_is_empty!20257)))

(assert (=> b!937461 t!27459))

(declare-fun b_and!29065 () Bool)

(assert (= b_and!29063 (and (=> t!27459 result!12111) b_and!29065)))

(declare-fun m!871733 () Bool)

(assert (=> b!937454 m!871733))

(declare-fun m!871735 () Bool)

(assert (=> b!937465 m!871735))

(declare-fun m!871737 () Bool)

(assert (=> b!937456 m!871737))

(declare-fun m!871739 () Bool)

(assert (=> start!79682 m!871739))

(declare-fun m!871741 () Bool)

(assert (=> start!79682 m!871741))

(declare-fun m!871743 () Bool)

(assert (=> start!79682 m!871743))

(declare-fun m!871745 () Bool)

(assert (=> b!937452 m!871745))

(assert (=> b!937452 m!871745))

(declare-fun m!871747 () Bool)

(assert (=> b!937452 m!871747))

(declare-fun m!871749 () Bool)

(assert (=> b!937461 m!871749))

(declare-fun m!871751 () Bool)

(assert (=> b!937461 m!871751))

(declare-fun m!871753 () Bool)

(assert (=> b!937461 m!871753))

(declare-fun m!871755 () Bool)

(assert (=> b!937461 m!871755))

(declare-fun m!871757 () Bool)

(assert (=> b!937461 m!871757))

(declare-fun m!871759 () Bool)

(assert (=> b!937461 m!871759))

(declare-fun m!871761 () Bool)

(assert (=> b!937461 m!871761))

(assert (=> b!937461 m!871755))

(assert (=> b!937461 m!871759))

(declare-fun m!871763 () Bool)

(assert (=> b!937461 m!871763))

(assert (=> b!937461 m!871745))

(declare-fun m!871765 () Bool)

(assert (=> b!937461 m!871765))

(declare-fun m!871767 () Bool)

(assert (=> b!937461 m!871767))

(declare-fun m!871769 () Bool)

(assert (=> b!937461 m!871769))

(declare-fun m!871771 () Bool)

(assert (=> b!937461 m!871771))

(assert (=> b!937461 m!871767))

(declare-fun m!871773 () Bool)

(assert (=> b!937461 m!871773))

(declare-fun m!871775 () Bool)

(assert (=> b!937461 m!871775))

(declare-fun m!871777 () Bool)

(assert (=> b!937461 m!871777))

(declare-fun m!871779 () Bool)

(assert (=> b!937464 m!871779))

(declare-fun m!871781 () Bool)

(assert (=> b!937463 m!871781))

(declare-fun m!871783 () Bool)

(assert (=> b!937458 m!871783))

(declare-fun m!871785 () Bool)

(assert (=> b!937458 m!871785))

(declare-fun m!871787 () Bool)

(assert (=> b!937459 m!871787))

(declare-fun m!871789 () Bool)

(assert (=> b!937459 m!871789))

(declare-fun m!871791 () Bool)

(assert (=> mapNonEmpty!32157 m!871791))

(check-sat (not b!937458) (not b!937459) (not b!937454) (not b!937456) (not b_next!17749) (not b!937465) (not b!937461) (not b_lambda!14137) (not b!937463) (not b!937464) tp_is_empty!20257 (not mapNonEmpty!32157) b_and!29065 (not b!937452) (not start!79682))
(check-sat b_and!29065 (not b_next!17749))
(get-model)

(declare-fun b_lambda!14143 () Bool)

(assert (= b_lambda!14137 (or (and start!79682 b_free!17749) b_lambda!14143)))

(check-sat (not b!937458) (not b!937459) (not b!937454) (not b!937456) (not b_next!17749) (not b!937465) (not b!937461) (not b_lambda!14143) (not b!937463) (not b!937464) tp_is_empty!20257 (not mapNonEmpty!32157) b_and!29065 (not b!937452) (not start!79682))
(check-sat b_and!29065 (not b_next!17749))
(get-model)

(declare-fun b!937586 () Bool)

(declare-fun e!526497 () Bool)

(declare-fun contains!5079 (List!19177 (_ BitVec 64)) Bool)

(assert (=> b!937586 (= e!526497 (contains!5079 Nil!19174 (select (arr!27152 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!937587 () Bool)

(declare-fun e!526499 () Bool)

(declare-fun e!526498 () Bool)

(assert (=> b!937587 (= e!526499 e!526498)))

(declare-fun res!631013 () Bool)

(assert (=> b!937587 (=> (not res!631013) (not e!526498))))

(assert (=> b!937587 (= res!631013 (not e!526497))))

(declare-fun res!631011 () Bool)

(assert (=> b!937587 (=> (not res!631011) (not e!526497))))

(assert (=> b!937587 (= res!631011 (validKeyInArray!0 (select (arr!27152 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun d!113129 () Bool)

(declare-fun res!631012 () Bool)

(assert (=> d!113129 (=> res!631012 e!526499)))

(assert (=> d!113129 (= res!631012 (bvsge #b00000000000000000000000000000000 (size!27613 _keys!1487)))))

(assert (=> d!113129 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19174) e!526499)))

(declare-fun b!937588 () Bool)

(declare-fun e!526496 () Bool)

(declare-fun call!40735 () Bool)

(assert (=> b!937588 (= e!526496 call!40735)))

(declare-fun b!937589 () Bool)

(assert (=> b!937589 (= e!526496 call!40735)))

(declare-fun b!937590 () Bool)

(assert (=> b!937590 (= e!526498 e!526496)))

(declare-fun c!97579 () Bool)

(assert (=> b!937590 (= c!97579 (validKeyInArray!0 (select (arr!27152 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40732 () Bool)

(assert (=> bm!40732 (= call!40735 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97579 (Cons!19173 (select (arr!27152 _keys!1487) #b00000000000000000000000000000000) Nil!19174) Nil!19174)))))

(assert (= (and d!113129 (not res!631012)) b!937587))

(assert (= (and b!937587 res!631011) b!937586))

(assert (= (and b!937587 res!631013) b!937590))

(assert (= (and b!937590 c!97579) b!937588))

(assert (= (and b!937590 (not c!97579)) b!937589))

(assert (= (or b!937588 b!937589) bm!40732))

(declare-fun m!871913 () Bool)

(assert (=> b!937586 m!871913))

(assert (=> b!937586 m!871913))

(declare-fun m!871915 () Bool)

(assert (=> b!937586 m!871915))

(assert (=> b!937587 m!871913))

(assert (=> b!937587 m!871913))

(declare-fun m!871917 () Bool)

(assert (=> b!937587 m!871917))

(assert (=> b!937590 m!871913))

(assert (=> b!937590 m!871913))

(assert (=> b!937590 m!871917))

(assert (=> bm!40732 m!871913))

(declare-fun m!871919 () Bool)

(assert (=> bm!40732 m!871919))

(assert (=> b!937454 d!113129))

(declare-fun d!113131 () Bool)

(assert (=> d!113131 (= (validKeyInArray!0 lt!422964) (and (not (= lt!422964 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!422964 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937459 d!113131))

(declare-fun d!113133 () Bool)

(declare-datatypes ((Option!492 0))(
  ( (Some!491 (v!12706 V!31975)) (None!490) )
))
(declare-fun get!14325 (Option!492) V!31975)

(declare-fun getValueByKey!486 (List!19176 (_ BitVec 64)) Option!492)

(assert (=> d!113133 (= (apply!849 lt!422966 k0!1099) (get!14325 (getValueByKey!486 (toList!6075 lt!422966) k0!1099)))))

(declare-fun bs!26269 () Bool)

(assert (= bs!26269 d!113133))

(declare-fun m!871921 () Bool)

(assert (=> bs!26269 m!871921))

(assert (=> bs!26269 m!871921))

(declare-fun m!871923 () Bool)

(assert (=> bs!26269 m!871923))

(assert (=> b!937463 d!113133))

(declare-fun d!113135 () Bool)

(assert (=> d!113135 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937465 d!113135))

(declare-fun d!113137 () Bool)

(declare-fun res!631018 () Bool)

(declare-fun e!526504 () Bool)

(assert (=> d!113137 (=> res!631018 e!526504)))

(assert (=> d!113137 (= res!631018 (= (select (arr!27152 _keys!1487) from!1844) k0!1099))))

(assert (=> d!113137 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!526504)))

(declare-fun b!937595 () Bool)

(declare-fun e!526505 () Bool)

(assert (=> b!937595 (= e!526504 e!526505)))

(declare-fun res!631019 () Bool)

(assert (=> b!937595 (=> (not res!631019) (not e!526505))))

(assert (=> b!937595 (= res!631019 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(declare-fun b!937596 () Bool)

(assert (=> b!937596 (= e!526505 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!113137 (not res!631018)) b!937595))

(assert (= (and b!937595 res!631019) b!937596))

(declare-fun m!871925 () Bool)

(assert (=> d!113137 m!871925))

(declare-fun m!871927 () Bool)

(assert (=> b!937596 m!871927))

(assert (=> b!937464 d!113137))

(declare-fun b!937605 () Bool)

(declare-fun e!526513 () Bool)

(declare-fun e!526512 () Bool)

(assert (=> b!937605 (= e!526513 e!526512)))

(declare-fun c!97582 () Bool)

(assert (=> b!937605 (= c!97582 (validKeyInArray!0 (select (arr!27152 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!937606 () Bool)

(declare-fun e!526514 () Bool)

(declare-fun call!40738 () Bool)

(assert (=> b!937606 (= e!526514 call!40738)))

(declare-fun b!937607 () Bool)

(assert (=> b!937607 (= e!526512 call!40738)))

(declare-fun b!937608 () Bool)

(assert (=> b!937608 (= e!526512 e!526514)))

(declare-fun lt!423058 () (_ BitVec 64))

(assert (=> b!937608 (= lt!423058 (select (arr!27152 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!423060 () Unit!31564)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56423 (_ BitVec 64) (_ BitVec 32)) Unit!31564)

(assert (=> b!937608 (= lt!423060 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!423058 #b00000000000000000000000000000000))))

(assert (=> b!937608 (arrayContainsKey!0 _keys!1487 lt!423058 #b00000000000000000000000000000000)))

(declare-fun lt!423059 () Unit!31564)

(assert (=> b!937608 (= lt!423059 lt!423060)))

(declare-fun res!631024 () Bool)

(declare-datatypes ((SeekEntryResult!8981 0))(
  ( (MissingZero!8981 (index!38295 (_ BitVec 32))) (Found!8981 (index!38296 (_ BitVec 32))) (Intermediate!8981 (undefined!9793 Bool) (index!38297 (_ BitVec 32)) (x!80427 (_ BitVec 32))) (Undefined!8981) (MissingVacant!8981 (index!38298 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56423 (_ BitVec 32)) SeekEntryResult!8981)

(assert (=> b!937608 (= res!631024 (= (seekEntryOrOpen!0 (select (arr!27152 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8981 #b00000000000000000000000000000000)))))

(assert (=> b!937608 (=> (not res!631024) (not e!526514))))

(declare-fun d!113139 () Bool)

(declare-fun res!631025 () Bool)

(assert (=> d!113139 (=> res!631025 e!526513)))

(assert (=> d!113139 (= res!631025 (bvsge #b00000000000000000000000000000000 (size!27613 _keys!1487)))))

(assert (=> d!113139 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!526513)))

(declare-fun bm!40735 () Bool)

(assert (=> bm!40735 (= call!40738 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(assert (= (and d!113139 (not res!631025)) b!937605))

(assert (= (and b!937605 c!97582) b!937608))

(assert (= (and b!937605 (not c!97582)) b!937607))

(assert (= (and b!937608 res!631024) b!937606))

(assert (= (or b!937606 b!937607) bm!40735))

(assert (=> b!937605 m!871913))

(assert (=> b!937605 m!871913))

(assert (=> b!937605 m!871917))

(assert (=> b!937608 m!871913))

(declare-fun m!871929 () Bool)

(assert (=> b!937608 m!871929))

(declare-fun m!871931 () Bool)

(assert (=> b!937608 m!871931))

(assert (=> b!937608 m!871913))

(declare-fun m!871933 () Bool)

(assert (=> b!937608 m!871933))

(declare-fun m!871935 () Bool)

(assert (=> bm!40735 m!871935))

(assert (=> b!937456 d!113139))

(declare-fun d!113141 () Bool)

(assert (=> d!113141 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79682 d!113141))

(declare-fun d!113143 () Bool)

(assert (=> d!113143 (= (array_inv!21182 _values!1231) (bvsge (size!27612 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79682 d!113143))

(declare-fun d!113145 () Bool)

(assert (=> d!113145 (= (array_inv!21183 _keys!1487) (bvsge (size!27613 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79682 d!113145))

(declare-fun b!937651 () Bool)

(declare-fun e!526541 () ListLongMap!12119)

(declare-fun call!40757 () ListLongMap!12119)

(assert (=> b!937651 (= e!526541 call!40757)))

(declare-fun b!937652 () Bool)

(declare-fun e!526547 () Bool)

(declare-fun e!526550 () Bool)

(assert (=> b!937652 (= e!526547 e!526550)))

(declare-fun res!631050 () Bool)

(declare-fun call!40753 () Bool)

(assert (=> b!937652 (= res!631050 call!40753)))

(assert (=> b!937652 (=> (not res!631050) (not e!526550))))

(declare-fun b!937653 () Bool)

(declare-fun res!631052 () Bool)

(declare-fun e!526543 () Bool)

(assert (=> b!937653 (=> (not res!631052) (not e!526543))))

(declare-fun e!526542 () Bool)

(assert (=> b!937653 (= res!631052 e!526542)))

(declare-fun res!631044 () Bool)

(assert (=> b!937653 (=> res!631044 e!526542)))

(declare-fun e!526551 () Bool)

(assert (=> b!937653 (= res!631044 (not e!526551))))

(declare-fun res!631045 () Bool)

(assert (=> b!937653 (=> (not res!631045) (not e!526551))))

(assert (=> b!937653 (= res!631045 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(declare-fun b!937654 () Bool)

(declare-fun e!526553 () Bool)

(assert (=> b!937654 (= e!526553 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!937655 () Bool)

(declare-fun c!97598 () Bool)

(assert (=> b!937655 (= c!97598 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!526546 () ListLongMap!12119)

(assert (=> b!937655 (= e!526546 e!526541)))

(declare-fun d!113147 () Bool)

(assert (=> d!113147 e!526543))

(declare-fun res!631046 () Bool)

(assert (=> d!113147 (=> (not res!631046) (not e!526543))))

(assert (=> d!113147 (= res!631046 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27613 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))))

(declare-fun lt!423113 () ListLongMap!12119)

(declare-fun lt!423122 () ListLongMap!12119)

(assert (=> d!113147 (= lt!423113 lt!423122)))

(declare-fun lt!423124 () Unit!31564)

(declare-fun e!526548 () Unit!31564)

(assert (=> d!113147 (= lt!423124 e!526548)))

(declare-fun c!97597 () Bool)

(assert (=> d!113147 (= c!97597 e!526553)))

(declare-fun res!631047 () Bool)

(assert (=> d!113147 (=> (not res!631047) (not e!526553))))

(assert (=> d!113147 (= res!631047 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(declare-fun e!526545 () ListLongMap!12119)

(assert (=> d!113147 (= lt!423122 e!526545)))

(declare-fun c!97600 () Bool)

(assert (=> d!113147 (= c!97600 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113147 (validMask!0 mask!1881)))

(assert (=> d!113147 (= (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!423113)))

(declare-fun b!937656 () Bool)

(declare-fun Unit!31574 () Unit!31564)

(assert (=> b!937656 (= e!526548 Unit!31574)))

(declare-fun b!937657 () Bool)

(declare-fun call!40758 () ListLongMap!12119)

(assert (=> b!937657 (= e!526545 (+!2864 call!40758 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!937658 () Bool)

(declare-fun res!631048 () Bool)

(assert (=> b!937658 (=> (not res!631048) (not e!526543))))

(declare-fun e!526552 () Bool)

(assert (=> b!937658 (= res!631048 e!526552)))

(declare-fun c!97599 () Bool)

(assert (=> b!937658 (= c!97599 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!937659 () Bool)

(declare-fun call!40754 () Bool)

(assert (=> b!937659 (= e!526552 (not call!40754))))

(declare-fun bm!40750 () Bool)

(assert (=> bm!40750 (= call!40753 (contains!5077 lt!423113 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40751 () Bool)

(declare-fun call!40759 () ListLongMap!12119)

(declare-fun call!40755 () ListLongMap!12119)

(assert (=> bm!40751 (= call!40759 call!40755)))

(declare-fun b!937660 () Bool)

(declare-fun e!526549 () Bool)

(assert (=> b!937660 (= e!526542 e!526549)))

(declare-fun res!631049 () Bool)

(assert (=> b!937660 (=> (not res!631049) (not e!526549))))

(assert (=> b!937660 (= res!631049 (contains!5077 lt!423113 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!937660 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(declare-fun b!937661 () Bool)

(declare-fun e!526544 () Bool)

(assert (=> b!937661 (= e!526552 e!526544)))

(declare-fun res!631051 () Bool)

(assert (=> b!937661 (= res!631051 call!40754)))

(assert (=> b!937661 (=> (not res!631051) (not e!526544))))

(declare-fun bm!40752 () Bool)

(assert (=> bm!40752 (= call!40754 (contains!5077 lt!423113 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!937662 () Bool)

(declare-fun lt!423115 () Unit!31564)

(assert (=> b!937662 (= e!526548 lt!423115)))

(declare-fun lt!423110 () ListLongMap!12119)

(declare-fun getCurrentListMapNoExtraKeys!3339 (array!56423 array!56421 (_ BitVec 32) (_ BitVec 32) V!31975 V!31975 (_ BitVec 32) Int) ListLongMap!12119)

(assert (=> b!937662 (= lt!423110 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423117 () (_ BitVec 64))

(assert (=> b!937662 (= lt!423117 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423118 () (_ BitVec 64))

(assert (=> b!937662 (= lt!423118 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!423126 () Unit!31564)

(assert (=> b!937662 (= lt!423126 (addStillContains!553 lt!423110 lt!423117 zeroValue!1173 lt!423118))))

(assert (=> b!937662 (contains!5077 (+!2864 lt!423110 (tuple2!13433 lt!423117 zeroValue!1173)) lt!423118)))

(declare-fun lt!423125 () Unit!31564)

(assert (=> b!937662 (= lt!423125 lt!423126)))

(declare-fun lt!423111 () ListLongMap!12119)

(assert (=> b!937662 (= lt!423111 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423119 () (_ BitVec 64))

(assert (=> b!937662 (= lt!423119 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423120 () (_ BitVec 64))

(assert (=> b!937662 (= lt!423120 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!423123 () Unit!31564)

(assert (=> b!937662 (= lt!423123 (addApplyDifferent!433 lt!423111 lt!423119 minValue!1173 lt!423120))))

(assert (=> b!937662 (= (apply!849 (+!2864 lt!423111 (tuple2!13433 lt!423119 minValue!1173)) lt!423120) (apply!849 lt!423111 lt!423120))))

(declare-fun lt!423109 () Unit!31564)

(assert (=> b!937662 (= lt!423109 lt!423123)))

(declare-fun lt!423106 () ListLongMap!12119)

(assert (=> b!937662 (= lt!423106 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423105 () (_ BitVec 64))

(assert (=> b!937662 (= lt!423105 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423114 () (_ BitVec 64))

(assert (=> b!937662 (= lt!423114 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!423107 () Unit!31564)

(assert (=> b!937662 (= lt!423107 (addApplyDifferent!433 lt!423106 lt!423105 zeroValue!1173 lt!423114))))

(assert (=> b!937662 (= (apply!849 (+!2864 lt!423106 (tuple2!13433 lt!423105 zeroValue!1173)) lt!423114) (apply!849 lt!423106 lt!423114))))

(declare-fun lt!423112 () Unit!31564)

(assert (=> b!937662 (= lt!423112 lt!423107)))

(declare-fun lt!423121 () ListLongMap!12119)

(assert (=> b!937662 (= lt!423121 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423108 () (_ BitVec 64))

(assert (=> b!937662 (= lt!423108 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423116 () (_ BitVec 64))

(assert (=> b!937662 (= lt!423116 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!937662 (= lt!423115 (addApplyDifferent!433 lt!423121 lt!423108 minValue!1173 lt!423116))))

(assert (=> b!937662 (= (apply!849 (+!2864 lt!423121 (tuple2!13433 lt!423108 minValue!1173)) lt!423116) (apply!849 lt!423121 lt!423116))))

(declare-fun bm!40753 () Bool)

(assert (=> bm!40753 (= call!40757 call!40758)))

(declare-fun b!937663 () Bool)

(assert (=> b!937663 (= e!526549 (= (apply!849 lt!423113 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937663 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27612 _values!1231)))))

(assert (=> b!937663 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(declare-fun b!937664 () Bool)

(declare-fun call!40756 () ListLongMap!12119)

(assert (=> b!937664 (= e!526541 call!40756)))

(declare-fun b!937665 () Bool)

(assert (=> b!937665 (= e!526550 (= (apply!849 lt!423113 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40754 () Bool)

(assert (=> bm!40754 (= call!40756 call!40759)))

(declare-fun b!937666 () Bool)

(assert (=> b!937666 (= e!526545 e!526546)))

(declare-fun c!97595 () Bool)

(assert (=> b!937666 (= c!97595 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40755 () Bool)

(assert (=> bm!40755 (= call!40758 (+!2864 (ite c!97600 call!40755 (ite c!97595 call!40759 call!40756)) (ite (or c!97600 c!97595) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!937667 () Bool)

(assert (=> b!937667 (= e!526551 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!937668 () Bool)

(assert (=> b!937668 (= e!526546 call!40757)))

(declare-fun b!937669 () Bool)

(assert (=> b!937669 (= e!526544 (= (apply!849 lt!423113 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!937670 () Bool)

(assert (=> b!937670 (= e!526543 e!526547)))

(declare-fun c!97596 () Bool)

(assert (=> b!937670 (= c!97596 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40756 () Bool)

(assert (=> bm!40756 (= call!40755 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!937671 () Bool)

(assert (=> b!937671 (= e!526547 (not call!40753))))

(assert (= (and d!113147 c!97600) b!937657))

(assert (= (and d!113147 (not c!97600)) b!937666))

(assert (= (and b!937666 c!97595) b!937668))

(assert (= (and b!937666 (not c!97595)) b!937655))

(assert (= (and b!937655 c!97598) b!937651))

(assert (= (and b!937655 (not c!97598)) b!937664))

(assert (= (or b!937651 b!937664) bm!40754))

(assert (= (or b!937668 bm!40754) bm!40751))

(assert (= (or b!937668 b!937651) bm!40753))

(assert (= (or b!937657 bm!40751) bm!40756))

(assert (= (or b!937657 bm!40753) bm!40755))

(assert (= (and d!113147 res!631047) b!937654))

(assert (= (and d!113147 c!97597) b!937662))

(assert (= (and d!113147 (not c!97597)) b!937656))

(assert (= (and d!113147 res!631046) b!937653))

(assert (= (and b!937653 res!631045) b!937667))

(assert (= (and b!937653 (not res!631044)) b!937660))

(assert (= (and b!937660 res!631049) b!937663))

(assert (= (and b!937653 res!631052) b!937658))

(assert (= (and b!937658 c!97599) b!937661))

(assert (= (and b!937658 (not c!97599)) b!937659))

(assert (= (and b!937661 res!631051) b!937669))

(assert (= (or b!937661 b!937659) bm!40752))

(assert (= (and b!937658 res!631048) b!937670))

(assert (= (and b!937670 c!97596) b!937652))

(assert (= (and b!937670 (not c!97596)) b!937671))

(assert (= (and b!937652 res!631050) b!937665))

(assert (= (or b!937652 b!937671) bm!40750))

(declare-fun b_lambda!14145 () Bool)

(assert (=> (not b_lambda!14145) (not b!937663)))

(assert (=> b!937663 t!27459))

(declare-fun b_and!29075 () Bool)

(assert (= b_and!29065 (and (=> t!27459 result!12111) b_and!29075)))

(assert (=> b!937654 m!871787))

(assert (=> b!937654 m!871787))

(declare-fun m!871937 () Bool)

(assert (=> b!937654 m!871937))

(declare-fun m!871939 () Bool)

(assert (=> bm!40752 m!871939))

(declare-fun m!871941 () Bool)

(assert (=> bm!40755 m!871941))

(declare-fun m!871943 () Bool)

(assert (=> b!937669 m!871943))

(declare-fun m!871945 () Bool)

(assert (=> b!937665 m!871945))

(declare-fun m!871947 () Bool)

(assert (=> b!937657 m!871947))

(declare-fun m!871949 () Bool)

(assert (=> b!937662 m!871949))

(declare-fun m!871951 () Bool)

(assert (=> b!937662 m!871951))

(declare-fun m!871953 () Bool)

(assert (=> b!937662 m!871953))

(declare-fun m!871955 () Bool)

(assert (=> b!937662 m!871955))

(declare-fun m!871957 () Bool)

(assert (=> b!937662 m!871957))

(declare-fun m!871959 () Bool)

(assert (=> b!937662 m!871959))

(declare-fun m!871961 () Bool)

(assert (=> b!937662 m!871961))

(declare-fun m!871963 () Bool)

(assert (=> b!937662 m!871963))

(declare-fun m!871965 () Bool)

(assert (=> b!937662 m!871965))

(declare-fun m!871967 () Bool)

(assert (=> b!937662 m!871967))

(declare-fun m!871969 () Bool)

(assert (=> b!937662 m!871969))

(assert (=> b!937662 m!871961))

(assert (=> b!937662 m!871969))

(declare-fun m!871971 () Bool)

(assert (=> b!937662 m!871971))

(declare-fun m!871973 () Bool)

(assert (=> b!937662 m!871973))

(declare-fun m!871975 () Bool)

(assert (=> b!937662 m!871975))

(assert (=> b!937662 m!871973))

(declare-fun m!871977 () Bool)

(assert (=> b!937662 m!871977))

(assert (=> b!937662 m!871951))

(declare-fun m!871979 () Bool)

(assert (=> b!937662 m!871979))

(assert (=> b!937662 m!871787))

(assert (=> bm!40756 m!871957))

(assert (=> d!113147 m!871739))

(assert (=> b!937667 m!871787))

(assert (=> b!937667 m!871787))

(assert (=> b!937667 m!871937))

(assert (=> b!937663 m!871755))

(assert (=> b!937663 m!871755))

(assert (=> b!937663 m!871759))

(assert (=> b!937663 m!871763))

(assert (=> b!937663 m!871759))

(assert (=> b!937663 m!871787))

(declare-fun m!871981 () Bool)

(assert (=> b!937663 m!871981))

(assert (=> b!937663 m!871787))

(assert (=> b!937660 m!871787))

(assert (=> b!937660 m!871787))

(declare-fun m!871983 () Bool)

(assert (=> b!937660 m!871983))

(declare-fun m!871985 () Bool)

(assert (=> bm!40750 m!871985))

(assert (=> b!937461 d!113147))

(declare-fun d!113149 () Bool)

(declare-fun e!526558 () Bool)

(assert (=> d!113149 e!526558))

(declare-fun res!631055 () Bool)

(assert (=> d!113149 (=> res!631055 e!526558)))

(declare-fun lt!423138 () Bool)

(assert (=> d!113149 (= res!631055 (not lt!423138))))

(declare-fun lt!423136 () Bool)

(assert (=> d!113149 (= lt!423138 lt!423136)))

(declare-fun lt!423135 () Unit!31564)

(declare-fun e!526559 () Unit!31564)

(assert (=> d!113149 (= lt!423135 e!526559)))

(declare-fun c!97603 () Bool)

(assert (=> d!113149 (= c!97603 lt!423136)))

(declare-fun containsKey!450 (List!19176 (_ BitVec 64)) Bool)

(assert (=> d!113149 (= lt!423136 (containsKey!450 (toList!6075 lt!422967) k0!1099))))

(assert (=> d!113149 (= (contains!5077 lt!422967 k0!1099) lt!423138)))

(declare-fun b!937678 () Bool)

(declare-fun lt!423137 () Unit!31564)

(assert (=> b!937678 (= e!526559 lt!423137)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!345 (List!19176 (_ BitVec 64)) Unit!31564)

(assert (=> b!937678 (= lt!423137 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 lt!422967) k0!1099))))

(declare-fun isDefined!358 (Option!492) Bool)

(assert (=> b!937678 (isDefined!358 (getValueByKey!486 (toList!6075 lt!422967) k0!1099))))

(declare-fun b!937679 () Bool)

(declare-fun Unit!31575 () Unit!31564)

(assert (=> b!937679 (= e!526559 Unit!31575)))

(declare-fun b!937680 () Bool)

(assert (=> b!937680 (= e!526558 (isDefined!358 (getValueByKey!486 (toList!6075 lt!422967) k0!1099)))))

(assert (= (and d!113149 c!97603) b!937678))

(assert (= (and d!113149 (not c!97603)) b!937679))

(assert (= (and d!113149 (not res!631055)) b!937680))

(declare-fun m!871987 () Bool)

(assert (=> d!113149 m!871987))

(declare-fun m!871989 () Bool)

(assert (=> b!937678 m!871989))

(declare-fun m!871991 () Bool)

(assert (=> b!937678 m!871991))

(assert (=> b!937678 m!871991))

(declare-fun m!871993 () Bool)

(assert (=> b!937678 m!871993))

(assert (=> b!937680 m!871991))

(assert (=> b!937680 m!871991))

(assert (=> b!937680 m!871993))

(assert (=> b!937461 d!113149))

(declare-fun b!937681 () Bool)

(declare-fun e!526560 () ListLongMap!12119)

(declare-fun call!40764 () ListLongMap!12119)

(assert (=> b!937681 (= e!526560 call!40764)))

(declare-fun b!937682 () Bool)

(declare-fun e!526566 () Bool)

(declare-fun e!526569 () Bool)

(assert (=> b!937682 (= e!526566 e!526569)))

(declare-fun res!631062 () Bool)

(declare-fun call!40760 () Bool)

(assert (=> b!937682 (= res!631062 call!40760)))

(assert (=> b!937682 (=> (not res!631062) (not e!526569))))

(declare-fun b!937683 () Bool)

(declare-fun res!631064 () Bool)

(declare-fun e!526562 () Bool)

(assert (=> b!937683 (=> (not res!631064) (not e!526562))))

(declare-fun e!526561 () Bool)

(assert (=> b!937683 (= res!631064 e!526561)))

(declare-fun res!631056 () Bool)

(assert (=> b!937683 (=> res!631056 e!526561)))

(declare-fun e!526570 () Bool)

(assert (=> b!937683 (= res!631056 (not e!526570))))

(declare-fun res!631057 () Bool)

(assert (=> b!937683 (=> (not res!631057) (not e!526570))))

(assert (=> b!937683 (= res!631057 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27613 _keys!1487)))))

(declare-fun b!937684 () Bool)

(declare-fun e!526572 () Bool)

(assert (=> b!937684 (= e!526572 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!937685 () Bool)

(declare-fun c!97607 () Bool)

(assert (=> b!937685 (= c!97607 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!526565 () ListLongMap!12119)

(assert (=> b!937685 (= e!526565 e!526560)))

(declare-fun d!113151 () Bool)

(assert (=> d!113151 e!526562))

(declare-fun res!631058 () Bool)

(assert (=> d!113151 (=> (not res!631058) (not e!526562))))

(assert (=> d!113151 (= res!631058 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27613 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27613 _keys!1487)))))))

(declare-fun lt!423147 () ListLongMap!12119)

(declare-fun lt!423156 () ListLongMap!12119)

(assert (=> d!113151 (= lt!423147 lt!423156)))

(declare-fun lt!423158 () Unit!31564)

(declare-fun e!526567 () Unit!31564)

(assert (=> d!113151 (= lt!423158 e!526567)))

(declare-fun c!97606 () Bool)

(assert (=> d!113151 (= c!97606 e!526572)))

(declare-fun res!631059 () Bool)

(assert (=> d!113151 (=> (not res!631059) (not e!526572))))

(assert (=> d!113151 (= res!631059 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27613 _keys!1487)))))

(declare-fun e!526564 () ListLongMap!12119)

(assert (=> d!113151 (= lt!423156 e!526564)))

(declare-fun c!97609 () Bool)

(assert (=> d!113151 (= c!97609 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113151 (validMask!0 mask!1881)))

(assert (=> d!113151 (= (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423147)))

(declare-fun b!937686 () Bool)

(declare-fun Unit!31576 () Unit!31564)

(assert (=> b!937686 (= e!526567 Unit!31576)))

(declare-fun b!937687 () Bool)

(declare-fun call!40765 () ListLongMap!12119)

(assert (=> b!937687 (= e!526564 (+!2864 call!40765 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!937688 () Bool)

(declare-fun res!631060 () Bool)

(assert (=> b!937688 (=> (not res!631060) (not e!526562))))

(declare-fun e!526571 () Bool)

(assert (=> b!937688 (= res!631060 e!526571)))

(declare-fun c!97608 () Bool)

(assert (=> b!937688 (= c!97608 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!937689 () Bool)

(declare-fun call!40761 () Bool)

(assert (=> b!937689 (= e!526571 (not call!40761))))

(declare-fun bm!40757 () Bool)

(assert (=> bm!40757 (= call!40760 (contains!5077 lt!423147 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40758 () Bool)

(declare-fun call!40766 () ListLongMap!12119)

(declare-fun call!40762 () ListLongMap!12119)

(assert (=> bm!40758 (= call!40766 call!40762)))

(declare-fun b!937690 () Bool)

(declare-fun e!526568 () Bool)

(assert (=> b!937690 (= e!526561 e!526568)))

(declare-fun res!631061 () Bool)

(assert (=> b!937690 (=> (not res!631061) (not e!526568))))

(assert (=> b!937690 (= res!631061 (contains!5077 lt!423147 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!937690 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27613 _keys!1487)))))

(declare-fun b!937691 () Bool)

(declare-fun e!526563 () Bool)

(assert (=> b!937691 (= e!526571 e!526563)))

(declare-fun res!631063 () Bool)

(assert (=> b!937691 (= res!631063 call!40761)))

(assert (=> b!937691 (=> (not res!631063) (not e!526563))))

(declare-fun bm!40759 () Bool)

(assert (=> bm!40759 (= call!40761 (contains!5077 lt!423147 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!937692 () Bool)

(declare-fun lt!423149 () Unit!31564)

(assert (=> b!937692 (= e!526567 lt!423149)))

(declare-fun lt!423144 () ListLongMap!12119)

(assert (=> b!937692 (= lt!423144 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423151 () (_ BitVec 64))

(assert (=> b!937692 (= lt!423151 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423152 () (_ BitVec 64))

(assert (=> b!937692 (= lt!423152 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!423160 () Unit!31564)

(assert (=> b!937692 (= lt!423160 (addStillContains!553 lt!423144 lt!423151 zeroValue!1173 lt!423152))))

(assert (=> b!937692 (contains!5077 (+!2864 lt!423144 (tuple2!13433 lt!423151 zeroValue!1173)) lt!423152)))

(declare-fun lt!423159 () Unit!31564)

(assert (=> b!937692 (= lt!423159 lt!423160)))

(declare-fun lt!423145 () ListLongMap!12119)

(assert (=> b!937692 (= lt!423145 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423153 () (_ BitVec 64))

(assert (=> b!937692 (= lt!423153 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423154 () (_ BitVec 64))

(assert (=> b!937692 (= lt!423154 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!423157 () Unit!31564)

(assert (=> b!937692 (= lt!423157 (addApplyDifferent!433 lt!423145 lt!423153 minValue!1173 lt!423154))))

(assert (=> b!937692 (= (apply!849 (+!2864 lt!423145 (tuple2!13433 lt!423153 minValue!1173)) lt!423154) (apply!849 lt!423145 lt!423154))))

(declare-fun lt!423143 () Unit!31564)

(assert (=> b!937692 (= lt!423143 lt!423157)))

(declare-fun lt!423140 () ListLongMap!12119)

(assert (=> b!937692 (= lt!423140 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423139 () (_ BitVec 64))

(assert (=> b!937692 (= lt!423139 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423148 () (_ BitVec 64))

(assert (=> b!937692 (= lt!423148 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!423141 () Unit!31564)

(assert (=> b!937692 (= lt!423141 (addApplyDifferent!433 lt!423140 lt!423139 zeroValue!1173 lt!423148))))

(assert (=> b!937692 (= (apply!849 (+!2864 lt!423140 (tuple2!13433 lt!423139 zeroValue!1173)) lt!423148) (apply!849 lt!423140 lt!423148))))

(declare-fun lt!423146 () Unit!31564)

(assert (=> b!937692 (= lt!423146 lt!423141)))

(declare-fun lt!423155 () ListLongMap!12119)

(assert (=> b!937692 (= lt!423155 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!423142 () (_ BitVec 64))

(assert (=> b!937692 (= lt!423142 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423150 () (_ BitVec 64))

(assert (=> b!937692 (= lt!423150 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!937692 (= lt!423149 (addApplyDifferent!433 lt!423155 lt!423142 minValue!1173 lt!423150))))

(assert (=> b!937692 (= (apply!849 (+!2864 lt!423155 (tuple2!13433 lt!423142 minValue!1173)) lt!423150) (apply!849 lt!423155 lt!423150))))

(declare-fun bm!40760 () Bool)

(assert (=> bm!40760 (= call!40764 call!40765)))

(declare-fun b!937693 () Bool)

(assert (=> b!937693 (= e!526568 (= (apply!849 lt!423147 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14324 (select (arr!27151 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937693 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27612 _values!1231)))))

(assert (=> b!937693 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27613 _keys!1487)))))

(declare-fun b!937694 () Bool)

(declare-fun call!40763 () ListLongMap!12119)

(assert (=> b!937694 (= e!526560 call!40763)))

(declare-fun b!937695 () Bool)

(assert (=> b!937695 (= e!526569 (= (apply!849 lt!423147 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40761 () Bool)

(assert (=> bm!40761 (= call!40763 call!40766)))

(declare-fun b!937696 () Bool)

(assert (=> b!937696 (= e!526564 e!526565)))

(declare-fun c!97604 () Bool)

(assert (=> b!937696 (= c!97604 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40762 () Bool)

(assert (=> bm!40762 (= call!40765 (+!2864 (ite c!97609 call!40762 (ite c!97604 call!40766 call!40763)) (ite (or c!97609 c!97604) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!937697 () Bool)

(assert (=> b!937697 (= e!526570 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!937698 () Bool)

(assert (=> b!937698 (= e!526565 call!40764)))

(declare-fun b!937699 () Bool)

(assert (=> b!937699 (= e!526563 (= (apply!849 lt!423147 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!937700 () Bool)

(assert (=> b!937700 (= e!526562 e!526566)))

(declare-fun c!97605 () Bool)

(assert (=> b!937700 (= c!97605 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40763 () Bool)

(assert (=> bm!40763 (= call!40762 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun b!937701 () Bool)

(assert (=> b!937701 (= e!526566 (not call!40760))))

(assert (= (and d!113151 c!97609) b!937687))

(assert (= (and d!113151 (not c!97609)) b!937696))

(assert (= (and b!937696 c!97604) b!937698))

(assert (= (and b!937696 (not c!97604)) b!937685))

(assert (= (and b!937685 c!97607) b!937681))

(assert (= (and b!937685 (not c!97607)) b!937694))

(assert (= (or b!937681 b!937694) bm!40761))

(assert (= (or b!937698 bm!40761) bm!40758))

(assert (= (or b!937698 b!937681) bm!40760))

(assert (= (or b!937687 bm!40758) bm!40763))

(assert (= (or b!937687 bm!40760) bm!40762))

(assert (= (and d!113151 res!631059) b!937684))

(assert (= (and d!113151 c!97606) b!937692))

(assert (= (and d!113151 (not c!97606)) b!937686))

(assert (= (and d!113151 res!631058) b!937683))

(assert (= (and b!937683 res!631057) b!937697))

(assert (= (and b!937683 (not res!631056)) b!937690))

(assert (= (and b!937690 res!631061) b!937693))

(assert (= (and b!937683 res!631064) b!937688))

(assert (= (and b!937688 c!97608) b!937691))

(assert (= (and b!937688 (not c!97608)) b!937689))

(assert (= (and b!937691 res!631063) b!937699))

(assert (= (or b!937691 b!937689) bm!40759))

(assert (= (and b!937688 res!631060) b!937700))

(assert (= (and b!937700 c!97605) b!937682))

(assert (= (and b!937700 (not c!97605)) b!937701))

(assert (= (and b!937682 res!631062) b!937695))

(assert (= (or b!937682 b!937701) bm!40757))

(declare-fun b_lambda!14147 () Bool)

(assert (=> (not b_lambda!14147) (not b!937693)))

(assert (=> b!937693 t!27459))

(declare-fun b_and!29077 () Bool)

(assert (= b_and!29075 (and (=> t!27459 result!12111) b_and!29077)))

(declare-fun m!871995 () Bool)

(assert (=> b!937684 m!871995))

(assert (=> b!937684 m!871995))

(declare-fun m!871997 () Bool)

(assert (=> b!937684 m!871997))

(declare-fun m!871999 () Bool)

(assert (=> bm!40759 m!871999))

(declare-fun m!872001 () Bool)

(assert (=> bm!40762 m!872001))

(declare-fun m!872003 () Bool)

(assert (=> b!937699 m!872003))

(declare-fun m!872005 () Bool)

(assert (=> b!937695 m!872005))

(declare-fun m!872007 () Bool)

(assert (=> b!937687 m!872007))

(declare-fun m!872009 () Bool)

(assert (=> b!937692 m!872009))

(declare-fun m!872011 () Bool)

(assert (=> b!937692 m!872011))

(declare-fun m!872013 () Bool)

(assert (=> b!937692 m!872013))

(declare-fun m!872015 () Bool)

(assert (=> b!937692 m!872015))

(declare-fun m!872017 () Bool)

(assert (=> b!937692 m!872017))

(declare-fun m!872019 () Bool)

(assert (=> b!937692 m!872019))

(declare-fun m!872021 () Bool)

(assert (=> b!937692 m!872021))

(declare-fun m!872023 () Bool)

(assert (=> b!937692 m!872023))

(declare-fun m!872025 () Bool)

(assert (=> b!937692 m!872025))

(declare-fun m!872027 () Bool)

(assert (=> b!937692 m!872027))

(declare-fun m!872029 () Bool)

(assert (=> b!937692 m!872029))

(assert (=> b!937692 m!872021))

(assert (=> b!937692 m!872029))

(declare-fun m!872031 () Bool)

(assert (=> b!937692 m!872031))

(declare-fun m!872033 () Bool)

(assert (=> b!937692 m!872033))

(declare-fun m!872035 () Bool)

(assert (=> b!937692 m!872035))

(assert (=> b!937692 m!872033))

(declare-fun m!872037 () Bool)

(assert (=> b!937692 m!872037))

(assert (=> b!937692 m!872011))

(declare-fun m!872039 () Bool)

(assert (=> b!937692 m!872039))

(assert (=> b!937692 m!871995))

(assert (=> bm!40763 m!872017))

(assert (=> d!113151 m!871739))

(assert (=> b!937697 m!871995))

(assert (=> b!937697 m!871995))

(assert (=> b!937697 m!871997))

(declare-fun m!872041 () Bool)

(assert (=> b!937693 m!872041))

(assert (=> b!937693 m!872041))

(assert (=> b!937693 m!871759))

(declare-fun m!872043 () Bool)

(assert (=> b!937693 m!872043))

(assert (=> b!937693 m!871759))

(assert (=> b!937693 m!871995))

(declare-fun m!872045 () Bool)

(assert (=> b!937693 m!872045))

(assert (=> b!937693 m!871995))

(assert (=> b!937690 m!871995))

(assert (=> b!937690 m!871995))

(declare-fun m!872047 () Bool)

(assert (=> b!937690 m!872047))

(declare-fun m!872049 () Bool)

(assert (=> bm!40757 m!872049))

(assert (=> b!937461 d!113151))

(declare-fun d!113153 () Bool)

(declare-fun e!526575 () Bool)

(assert (=> d!113153 e!526575))

(declare-fun res!631070 () Bool)

(assert (=> d!113153 (=> (not res!631070) (not e!526575))))

(declare-fun lt!423171 () ListLongMap!12119)

(assert (=> d!113153 (= res!631070 (contains!5077 lt!423171 (_1!6727 lt!422962)))))

(declare-fun lt!423172 () List!19176)

(assert (=> d!113153 (= lt!423171 (ListLongMap!12120 lt!423172))))

(declare-fun lt!423169 () Unit!31564)

(declare-fun lt!423170 () Unit!31564)

(assert (=> d!113153 (= lt!423169 lt!423170)))

(assert (=> d!113153 (= (getValueByKey!486 lt!423172 (_1!6727 lt!422962)) (Some!491 (_2!6727 lt!422962)))))

(declare-fun lemmaContainsTupThenGetReturnValue!260 (List!19176 (_ BitVec 64) V!31975) Unit!31564)

(assert (=> d!113153 (= lt!423170 (lemmaContainsTupThenGetReturnValue!260 lt!423172 (_1!6727 lt!422962) (_2!6727 lt!422962)))))

(declare-fun insertStrictlySorted!317 (List!19176 (_ BitVec 64) V!31975) List!19176)

(assert (=> d!113153 (= lt!423172 (insertStrictlySorted!317 (toList!6075 lt!422966) (_1!6727 lt!422962) (_2!6727 lt!422962)))))

(assert (=> d!113153 (= (+!2864 lt!422966 lt!422962) lt!423171)))

(declare-fun b!937706 () Bool)

(declare-fun res!631069 () Bool)

(assert (=> b!937706 (=> (not res!631069) (not e!526575))))

(assert (=> b!937706 (= res!631069 (= (getValueByKey!486 (toList!6075 lt!423171) (_1!6727 lt!422962)) (Some!491 (_2!6727 lt!422962))))))

(declare-fun b!937707 () Bool)

(declare-fun contains!5080 (List!19176 tuple2!13432) Bool)

(assert (=> b!937707 (= e!526575 (contains!5080 (toList!6075 lt!423171) lt!422962))))

(assert (= (and d!113153 res!631070) b!937706))

(assert (= (and b!937706 res!631069) b!937707))

(declare-fun m!872051 () Bool)

(assert (=> d!113153 m!872051))

(declare-fun m!872053 () Bool)

(assert (=> d!113153 m!872053))

(declare-fun m!872055 () Bool)

(assert (=> d!113153 m!872055))

(declare-fun m!872057 () Bool)

(assert (=> d!113153 m!872057))

(declare-fun m!872059 () Bool)

(assert (=> b!937706 m!872059))

(declare-fun m!872061 () Bool)

(assert (=> b!937707 m!872061))

(assert (=> b!937461 d!113153))

(declare-fun d!113155 () Bool)

(declare-fun e!526578 () Bool)

(assert (=> d!113155 e!526578))

(declare-fun res!631073 () Bool)

(assert (=> d!113155 (=> (not res!631073) (not e!526578))))

(assert (=> d!113155 (= res!631073 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27613 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27612 _values!1231))))))

(declare-fun lt!423175 () Unit!31564)

(declare-fun choose!1562 (array!56423 array!56421 (_ BitVec 32) (_ BitVec 32) V!31975 V!31975 (_ BitVec 32) Int) Unit!31564)

(assert (=> d!113155 (= lt!423175 (choose!1562 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113155 (validMask!0 mask!1881)))

(assert (=> d!113155 (= (lemmaListMapRecursiveValidKeyArray!228 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!423175)))

(declare-fun b!937710 () Bool)

(assert (=> b!937710 (= e!526578 (= (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2864 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13433 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113155 res!631073) b!937710))

(declare-fun b_lambda!14149 () Bool)

(assert (=> (not b_lambda!14149) (not b!937710)))

(assert (=> b!937710 t!27459))

(declare-fun b_and!29079 () Bool)

(assert (= b_and!29077 (and (=> t!27459 result!12111) b_and!29079)))

(declare-fun m!872063 () Bool)

(assert (=> d!113155 m!872063))

(assert (=> d!113155 m!871739))

(declare-fun m!872065 () Bool)

(assert (=> b!937710 m!872065))

(assert (=> b!937710 m!871745))

(assert (=> b!937710 m!871787))

(assert (=> b!937710 m!871755))

(assert (=> b!937710 m!871759))

(assert (=> b!937710 m!872065))

(declare-fun m!872067 () Bool)

(assert (=> b!937710 m!872067))

(assert (=> b!937710 m!871755))

(assert (=> b!937710 m!871759))

(assert (=> b!937710 m!871763))

(assert (=> b!937461 d!113155))

(declare-fun d!113157 () Bool)

(assert (=> d!113157 (= (apply!849 lt!422967 k0!1099) (get!14325 (getValueByKey!486 (toList!6075 lt!422967) k0!1099)))))

(declare-fun bs!26270 () Bool)

(assert (= bs!26270 d!113157))

(assert (=> bs!26270 m!871991))

(assert (=> bs!26270 m!871991))

(declare-fun m!872069 () Bool)

(assert (=> bs!26270 m!872069))

(assert (=> b!937461 d!113157))

(declare-fun d!113159 () Bool)

(assert (=> d!113159 (= (apply!849 (+!2864 lt!422966 (tuple2!13433 lt!422964 lt!422971)) k0!1099) (apply!849 lt!422966 k0!1099))))

(declare-fun lt!423178 () Unit!31564)

(declare-fun choose!1563 (ListLongMap!12119 (_ BitVec 64) V!31975 (_ BitVec 64)) Unit!31564)

(assert (=> d!113159 (= lt!423178 (choose!1563 lt!422966 lt!422964 lt!422971 k0!1099))))

(declare-fun e!526581 () Bool)

(assert (=> d!113159 e!526581))

(declare-fun res!631076 () Bool)

(assert (=> d!113159 (=> (not res!631076) (not e!526581))))

(assert (=> d!113159 (= res!631076 (contains!5077 lt!422966 k0!1099))))

(assert (=> d!113159 (= (addApplyDifferent!433 lt!422966 lt!422964 lt!422971 k0!1099) lt!423178)))

(declare-fun b!937714 () Bool)

(assert (=> b!937714 (= e!526581 (not (= k0!1099 lt!422964)))))

(assert (= (and d!113159 res!631076) b!937714))

(assert (=> d!113159 m!871781))

(declare-fun m!872071 () Bool)

(assert (=> d!113159 m!872071))

(declare-fun m!872073 () Bool)

(assert (=> d!113159 m!872073))

(declare-fun m!872075 () Bool)

(assert (=> d!113159 m!872075))

(assert (=> d!113159 m!871783))

(assert (=> d!113159 m!872073))

(assert (=> b!937461 d!113159))

(declare-fun d!113161 () Bool)

(assert (=> d!113161 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27613 _keys!1487)) (not (= (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) k0!1099)))))

(declare-fun lt!423181 () Unit!31564)

(declare-fun choose!21 (array!56423 (_ BitVec 64) (_ BitVec 32) List!19177) Unit!31564)

(assert (=> d!113161 (= lt!423181 (choose!21 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19174))))

(assert (=> d!113161 (bvslt (size!27613 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113161 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19174) lt!423181)))

(declare-fun bs!26271 () Bool)

(assert (= bs!26271 d!113161))

(assert (=> bs!26271 m!871787))

(declare-fun m!872077 () Bool)

(assert (=> bs!26271 m!872077))

(assert (=> b!937461 d!113161))

(declare-fun d!113163 () Bool)

(declare-fun e!526582 () Bool)

(assert (=> d!113163 e!526582))

(declare-fun res!631078 () Bool)

(assert (=> d!113163 (=> (not res!631078) (not e!526582))))

(declare-fun lt!423184 () ListLongMap!12119)

(assert (=> d!113163 (= res!631078 (contains!5077 lt!423184 (_1!6727 lt!422962)))))

(declare-fun lt!423185 () List!19176)

(assert (=> d!113163 (= lt!423184 (ListLongMap!12120 lt!423185))))

(declare-fun lt!423182 () Unit!31564)

(declare-fun lt!423183 () Unit!31564)

(assert (=> d!113163 (= lt!423182 lt!423183)))

(assert (=> d!113163 (= (getValueByKey!486 lt!423185 (_1!6727 lt!422962)) (Some!491 (_2!6727 lt!422962)))))

(assert (=> d!113163 (= lt!423183 (lemmaContainsTupThenGetReturnValue!260 lt!423185 (_1!6727 lt!422962) (_2!6727 lt!422962)))))

(assert (=> d!113163 (= lt!423185 (insertStrictlySorted!317 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6727 lt!422962) (_2!6727 lt!422962)))))

(assert (=> d!113163 (= (+!2864 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422962) lt!423184)))

(declare-fun b!937715 () Bool)

(declare-fun res!631077 () Bool)

(assert (=> b!937715 (=> (not res!631077) (not e!526582))))

(assert (=> b!937715 (= res!631077 (= (getValueByKey!486 (toList!6075 lt!423184) (_1!6727 lt!422962)) (Some!491 (_2!6727 lt!422962))))))

(declare-fun b!937716 () Bool)

(assert (=> b!937716 (= e!526582 (contains!5080 (toList!6075 lt!423184) lt!422962))))

(assert (= (and d!113163 res!631078) b!937715))

(assert (= (and b!937715 res!631077) b!937716))

(declare-fun m!872079 () Bool)

(assert (=> d!113163 m!872079))

(declare-fun m!872081 () Bool)

(assert (=> d!113163 m!872081))

(declare-fun m!872083 () Bool)

(assert (=> d!113163 m!872083))

(declare-fun m!872085 () Bool)

(assert (=> d!113163 m!872085))

(declare-fun m!872087 () Bool)

(assert (=> b!937715 m!872087))

(declare-fun m!872089 () Bool)

(assert (=> b!937716 m!872089))

(assert (=> b!937461 d!113163))

(declare-fun b!937717 () Bool)

(declare-fun e!526584 () Bool)

(assert (=> b!937717 (= e!526584 (contains!5079 Nil!19174 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!937718 () Bool)

(declare-fun e!526586 () Bool)

(declare-fun e!526585 () Bool)

(assert (=> b!937718 (= e!526586 e!526585)))

(declare-fun res!631081 () Bool)

(assert (=> b!937718 (=> (not res!631081) (not e!526585))))

(assert (=> b!937718 (= res!631081 (not e!526584))))

(declare-fun res!631079 () Bool)

(assert (=> b!937718 (=> (not res!631079) (not e!526584))))

(assert (=> b!937718 (= res!631079 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun d!113165 () Bool)

(declare-fun res!631080 () Bool)

(assert (=> d!113165 (=> res!631080 e!526586)))

(assert (=> d!113165 (= res!631080 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(assert (=> d!113165 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19174) e!526586)))

(declare-fun b!937719 () Bool)

(declare-fun e!526583 () Bool)

(declare-fun call!40767 () Bool)

(assert (=> b!937719 (= e!526583 call!40767)))

(declare-fun b!937720 () Bool)

(assert (=> b!937720 (= e!526583 call!40767)))

(declare-fun b!937721 () Bool)

(assert (=> b!937721 (= e!526585 e!526583)))

(declare-fun c!97610 () Bool)

(assert (=> b!937721 (= c!97610 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun bm!40764 () Bool)

(assert (=> bm!40764 (= call!40767 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97610 (Cons!19173 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19174) Nil!19174)))))

(assert (= (and d!113165 (not res!631080)) b!937718))

(assert (= (and b!937718 res!631079) b!937717))

(assert (= (and b!937718 res!631081) b!937721))

(assert (= (and b!937721 c!97610) b!937719))

(assert (= (and b!937721 (not c!97610)) b!937720))

(assert (= (or b!937719 b!937720) bm!40764))

(assert (=> b!937717 m!871787))

(assert (=> b!937717 m!871787))

(declare-fun m!872091 () Bool)

(assert (=> b!937717 m!872091))

(assert (=> b!937718 m!871787))

(assert (=> b!937718 m!871787))

(assert (=> b!937718 m!871937))

(assert (=> b!937721 m!871787))

(assert (=> b!937721 m!871787))

(assert (=> b!937721 m!871937))

(assert (=> bm!40764 m!871787))

(declare-fun m!872093 () Bool)

(assert (=> bm!40764 m!872093))

(assert (=> b!937461 d!113165))

(declare-fun d!113167 () Bool)

(declare-fun e!526589 () Bool)

(assert (=> d!113167 e!526589))

(declare-fun c!97613 () Bool)

(assert (=> d!113167 (= c!97613 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423188 () Unit!31564)

(declare-fun choose!1564 (array!56423 array!56421 (_ BitVec 32) (_ BitVec 32) V!31975 V!31975 (_ BitVec 64) (_ BitVec 32) Int) Unit!31564)

(assert (=> d!113167 (= lt!423188 (choose!1564 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!113167 (validMask!0 mask!1881)))

(assert (=> d!113167 (= (lemmaListMapContainsThenArrayContainsFrom!311 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!423188)))

(declare-fun b!937726 () Bool)

(assert (=> b!937726 (= e!526589 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!937727 () Bool)

(assert (=> b!937727 (= e!526589 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113167 c!97613) b!937726))

(assert (= (and d!113167 (not c!97613)) b!937727))

(declare-fun m!872095 () Bool)

(assert (=> d!113167 m!872095))

(assert (=> d!113167 m!871739))

(assert (=> b!937726 m!871779))

(assert (=> b!937461 d!113167))

(declare-fun d!113169 () Bool)

(assert (=> d!113169 (contains!5077 (+!2864 lt!422966 (tuple2!13433 lt!422964 lt!422971)) k0!1099)))

(declare-fun lt!423191 () Unit!31564)

(declare-fun choose!1565 (ListLongMap!12119 (_ BitVec 64) V!31975 (_ BitVec 64)) Unit!31564)

(assert (=> d!113169 (= lt!423191 (choose!1565 lt!422966 lt!422964 lt!422971 k0!1099))))

(assert (=> d!113169 (contains!5077 lt!422966 k0!1099)))

(assert (=> d!113169 (= (addStillContains!553 lt!422966 lt!422964 lt!422971 k0!1099) lt!423191)))

(declare-fun bs!26272 () Bool)

(assert (= bs!26272 d!113169))

(assert (=> bs!26272 m!872073))

(assert (=> bs!26272 m!872073))

(declare-fun m!872097 () Bool)

(assert (=> bs!26272 m!872097))

(declare-fun m!872099 () Bool)

(assert (=> bs!26272 m!872099))

(assert (=> bs!26272 m!871783))

(assert (=> b!937461 d!113169))

(declare-fun d!113171 () Bool)

(declare-fun c!97616 () Bool)

(assert (=> d!113171 (= c!97616 ((_ is ValueCellFull!9647) (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!526592 () V!31975)

(assert (=> d!113171 (= (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!526592)))

(declare-fun b!937733 () Bool)

(declare-fun get!14326 (ValueCell!9647 V!31975) V!31975)

(assert (=> b!937733 (= e!526592 (get!14326 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!937734 () Bool)

(declare-fun get!14327 (ValueCell!9647 V!31975) V!31975)

(assert (=> b!937734 (= e!526592 (get!14327 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113171 c!97616) b!937733))

(assert (= (and d!113171 (not c!97616)) b!937734))

(assert (=> b!937733 m!871755))

(assert (=> b!937733 m!871759))

(declare-fun m!872101 () Bool)

(assert (=> b!937733 m!872101))

(assert (=> b!937734 m!871755))

(assert (=> b!937734 m!871759))

(declare-fun m!872103 () Bool)

(assert (=> b!937734 m!872103))

(assert (=> b!937461 d!113171))

(declare-fun d!113173 () Bool)

(assert (=> d!113173 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19174)))

(declare-fun lt!423194 () Unit!31564)

(declare-fun choose!39 (array!56423 (_ BitVec 32) (_ BitVec 32)) Unit!31564)

(assert (=> d!113173 (= lt!423194 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!113173 (bvslt (size!27613 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113173 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!423194)))

(declare-fun bs!26273 () Bool)

(assert (= bs!26273 d!113173))

(assert (=> bs!26273 m!871775))

(declare-fun m!872105 () Bool)

(assert (=> bs!26273 m!872105))

(assert (=> b!937461 d!113173))

(declare-fun d!113175 () Bool)

(declare-fun e!526593 () Bool)

(assert (=> d!113175 e!526593))

(declare-fun res!631082 () Bool)

(assert (=> d!113175 (=> res!631082 e!526593)))

(declare-fun lt!423198 () Bool)

(assert (=> d!113175 (= res!631082 (not lt!423198))))

(declare-fun lt!423196 () Bool)

(assert (=> d!113175 (= lt!423198 lt!423196)))

(declare-fun lt!423195 () Unit!31564)

(declare-fun e!526594 () Unit!31564)

(assert (=> d!113175 (= lt!423195 e!526594)))

(declare-fun c!97617 () Bool)

(assert (=> d!113175 (= c!97617 lt!423196)))

(assert (=> d!113175 (= lt!423196 (containsKey!450 (toList!6075 lt!422966) k0!1099))))

(assert (=> d!113175 (= (contains!5077 lt!422966 k0!1099) lt!423198)))

(declare-fun b!937735 () Bool)

(declare-fun lt!423197 () Unit!31564)

(assert (=> b!937735 (= e!526594 lt!423197)))

(assert (=> b!937735 (= lt!423197 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 lt!422966) k0!1099))))

(assert (=> b!937735 (isDefined!358 (getValueByKey!486 (toList!6075 lt!422966) k0!1099))))

(declare-fun b!937736 () Bool)

(declare-fun Unit!31577 () Unit!31564)

(assert (=> b!937736 (= e!526594 Unit!31577)))

(declare-fun b!937737 () Bool)

(assert (=> b!937737 (= e!526593 (isDefined!358 (getValueByKey!486 (toList!6075 lt!422966) k0!1099)))))

(assert (= (and d!113175 c!97617) b!937735))

(assert (= (and d!113175 (not c!97617)) b!937736))

(assert (= (and d!113175 (not res!631082)) b!937737))

(declare-fun m!872107 () Bool)

(assert (=> d!113175 m!872107))

(declare-fun m!872109 () Bool)

(assert (=> b!937735 m!872109))

(assert (=> b!937735 m!871921))

(assert (=> b!937735 m!871921))

(declare-fun m!872111 () Bool)

(assert (=> b!937735 m!872111))

(assert (=> b!937737 m!871921))

(assert (=> b!937737 m!871921))

(assert (=> b!937737 m!872111))

(assert (=> b!937458 d!113175))

(declare-fun b!937738 () Bool)

(declare-fun e!526595 () ListLongMap!12119)

(declare-fun call!40772 () ListLongMap!12119)

(assert (=> b!937738 (= e!526595 call!40772)))

(declare-fun b!937739 () Bool)

(declare-fun e!526601 () Bool)

(declare-fun e!526604 () Bool)

(assert (=> b!937739 (= e!526601 e!526604)))

(declare-fun res!631089 () Bool)

(declare-fun call!40768 () Bool)

(assert (=> b!937739 (= res!631089 call!40768)))

(assert (=> b!937739 (=> (not res!631089) (not e!526604))))

(declare-fun b!937740 () Bool)

(declare-fun res!631091 () Bool)

(declare-fun e!526597 () Bool)

(assert (=> b!937740 (=> (not res!631091) (not e!526597))))

(declare-fun e!526596 () Bool)

(assert (=> b!937740 (= res!631091 e!526596)))

(declare-fun res!631083 () Bool)

(assert (=> b!937740 (=> res!631083 e!526596)))

(declare-fun e!526605 () Bool)

(assert (=> b!937740 (= res!631083 (not e!526605))))

(declare-fun res!631084 () Bool)

(assert (=> b!937740 (=> (not res!631084) (not e!526605))))

(assert (=> b!937740 (= res!631084 (bvslt from!1844 (size!27613 _keys!1487)))))

(declare-fun b!937741 () Bool)

(declare-fun e!526607 () Bool)

(assert (=> b!937741 (= e!526607 (validKeyInArray!0 (select (arr!27152 _keys!1487) from!1844)))))

(declare-fun b!937742 () Bool)

(declare-fun c!97621 () Bool)

(assert (=> b!937742 (= c!97621 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!526600 () ListLongMap!12119)

(assert (=> b!937742 (= e!526600 e!526595)))

(declare-fun d!113177 () Bool)

(assert (=> d!113177 e!526597))

(declare-fun res!631085 () Bool)

(assert (=> d!113177 (=> (not res!631085) (not e!526597))))

(assert (=> d!113177 (= res!631085 (or (bvsge from!1844 (size!27613 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27613 _keys!1487)))))))

(declare-fun lt!423207 () ListLongMap!12119)

(declare-fun lt!423216 () ListLongMap!12119)

(assert (=> d!113177 (= lt!423207 lt!423216)))

(declare-fun lt!423218 () Unit!31564)

(declare-fun e!526602 () Unit!31564)

(assert (=> d!113177 (= lt!423218 e!526602)))

(declare-fun c!97620 () Bool)

(assert (=> d!113177 (= c!97620 e!526607)))

(declare-fun res!631086 () Bool)

(assert (=> d!113177 (=> (not res!631086) (not e!526607))))

(assert (=> d!113177 (= res!631086 (bvslt from!1844 (size!27613 _keys!1487)))))

(declare-fun e!526599 () ListLongMap!12119)

(assert (=> d!113177 (= lt!423216 e!526599)))

(declare-fun c!97623 () Bool)

(assert (=> d!113177 (= c!97623 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113177 (validMask!0 mask!1881)))

(assert (=> d!113177 (= (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!423207)))

(declare-fun b!937743 () Bool)

(declare-fun Unit!31578 () Unit!31564)

(assert (=> b!937743 (= e!526602 Unit!31578)))

(declare-fun b!937744 () Bool)

(declare-fun call!40773 () ListLongMap!12119)

(assert (=> b!937744 (= e!526599 (+!2864 call!40773 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!937745 () Bool)

(declare-fun res!631087 () Bool)

(assert (=> b!937745 (=> (not res!631087) (not e!526597))))

(declare-fun e!526606 () Bool)

(assert (=> b!937745 (= res!631087 e!526606)))

(declare-fun c!97622 () Bool)

(assert (=> b!937745 (= c!97622 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!937746 () Bool)

(declare-fun call!40769 () Bool)

(assert (=> b!937746 (= e!526606 (not call!40769))))

(declare-fun bm!40765 () Bool)

(assert (=> bm!40765 (= call!40768 (contains!5077 lt!423207 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40766 () Bool)

(declare-fun call!40774 () ListLongMap!12119)

(declare-fun call!40770 () ListLongMap!12119)

(assert (=> bm!40766 (= call!40774 call!40770)))

(declare-fun b!937747 () Bool)

(declare-fun e!526603 () Bool)

(assert (=> b!937747 (= e!526596 e!526603)))

(declare-fun res!631088 () Bool)

(assert (=> b!937747 (=> (not res!631088) (not e!526603))))

(assert (=> b!937747 (= res!631088 (contains!5077 lt!423207 (select (arr!27152 _keys!1487) from!1844)))))

(assert (=> b!937747 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27613 _keys!1487)))))

(declare-fun b!937748 () Bool)

(declare-fun e!526598 () Bool)

(assert (=> b!937748 (= e!526606 e!526598)))

(declare-fun res!631090 () Bool)

(assert (=> b!937748 (= res!631090 call!40769)))

(assert (=> b!937748 (=> (not res!631090) (not e!526598))))

(declare-fun bm!40767 () Bool)

(assert (=> bm!40767 (= call!40769 (contains!5077 lt!423207 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!937749 () Bool)

(declare-fun lt!423209 () Unit!31564)

(assert (=> b!937749 (= e!526602 lt!423209)))

(declare-fun lt!423204 () ListLongMap!12119)

(assert (=> b!937749 (= lt!423204 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423211 () (_ BitVec 64))

(assert (=> b!937749 (= lt!423211 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423212 () (_ BitVec 64))

(assert (=> b!937749 (= lt!423212 (select (arr!27152 _keys!1487) from!1844))))

(declare-fun lt!423220 () Unit!31564)

(assert (=> b!937749 (= lt!423220 (addStillContains!553 lt!423204 lt!423211 zeroValue!1173 lt!423212))))

(assert (=> b!937749 (contains!5077 (+!2864 lt!423204 (tuple2!13433 lt!423211 zeroValue!1173)) lt!423212)))

(declare-fun lt!423219 () Unit!31564)

(assert (=> b!937749 (= lt!423219 lt!423220)))

(declare-fun lt!423205 () ListLongMap!12119)

(assert (=> b!937749 (= lt!423205 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423213 () (_ BitVec 64))

(assert (=> b!937749 (= lt!423213 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423214 () (_ BitVec 64))

(assert (=> b!937749 (= lt!423214 (select (arr!27152 _keys!1487) from!1844))))

(declare-fun lt!423217 () Unit!31564)

(assert (=> b!937749 (= lt!423217 (addApplyDifferent!433 lt!423205 lt!423213 minValue!1173 lt!423214))))

(assert (=> b!937749 (= (apply!849 (+!2864 lt!423205 (tuple2!13433 lt!423213 minValue!1173)) lt!423214) (apply!849 lt!423205 lt!423214))))

(declare-fun lt!423203 () Unit!31564)

(assert (=> b!937749 (= lt!423203 lt!423217)))

(declare-fun lt!423200 () ListLongMap!12119)

(assert (=> b!937749 (= lt!423200 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423199 () (_ BitVec 64))

(assert (=> b!937749 (= lt!423199 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423208 () (_ BitVec 64))

(assert (=> b!937749 (= lt!423208 (select (arr!27152 _keys!1487) from!1844))))

(declare-fun lt!423201 () Unit!31564)

(assert (=> b!937749 (= lt!423201 (addApplyDifferent!433 lt!423200 lt!423199 zeroValue!1173 lt!423208))))

(assert (=> b!937749 (= (apply!849 (+!2864 lt!423200 (tuple2!13433 lt!423199 zeroValue!1173)) lt!423208) (apply!849 lt!423200 lt!423208))))

(declare-fun lt!423206 () Unit!31564)

(assert (=> b!937749 (= lt!423206 lt!423201)))

(declare-fun lt!423215 () ListLongMap!12119)

(assert (=> b!937749 (= lt!423215 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!423202 () (_ BitVec 64))

(assert (=> b!937749 (= lt!423202 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423210 () (_ BitVec 64))

(assert (=> b!937749 (= lt!423210 (select (arr!27152 _keys!1487) from!1844))))

(assert (=> b!937749 (= lt!423209 (addApplyDifferent!433 lt!423215 lt!423202 minValue!1173 lt!423210))))

(assert (=> b!937749 (= (apply!849 (+!2864 lt!423215 (tuple2!13433 lt!423202 minValue!1173)) lt!423210) (apply!849 lt!423215 lt!423210))))

(declare-fun bm!40768 () Bool)

(assert (=> bm!40768 (= call!40772 call!40773)))

(declare-fun b!937750 () Bool)

(assert (=> b!937750 (= e!526603 (= (apply!849 lt!423207 (select (arr!27152 _keys!1487) from!1844)) (get!14324 (select (arr!27151 _values!1231) from!1844) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937750 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27612 _values!1231)))))

(assert (=> b!937750 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27613 _keys!1487)))))

(declare-fun b!937751 () Bool)

(declare-fun call!40771 () ListLongMap!12119)

(assert (=> b!937751 (= e!526595 call!40771)))

(declare-fun b!937752 () Bool)

(assert (=> b!937752 (= e!526604 (= (apply!849 lt!423207 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40769 () Bool)

(assert (=> bm!40769 (= call!40771 call!40774)))

(declare-fun b!937753 () Bool)

(assert (=> b!937753 (= e!526599 e!526600)))

(declare-fun c!97618 () Bool)

(assert (=> b!937753 (= c!97618 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40770 () Bool)

(assert (=> bm!40770 (= call!40773 (+!2864 (ite c!97623 call!40770 (ite c!97618 call!40774 call!40771)) (ite (or c!97623 c!97618) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!937754 () Bool)

(assert (=> b!937754 (= e!526605 (validKeyInArray!0 (select (arr!27152 _keys!1487) from!1844)))))

(declare-fun b!937755 () Bool)

(assert (=> b!937755 (= e!526600 call!40772)))

(declare-fun b!937756 () Bool)

(assert (=> b!937756 (= e!526598 (= (apply!849 lt!423207 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!937757 () Bool)

(assert (=> b!937757 (= e!526597 e!526601)))

(declare-fun c!97619 () Bool)

(assert (=> b!937757 (= c!97619 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40771 () Bool)

(assert (=> bm!40771 (= call!40770 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937758 () Bool)

(assert (=> b!937758 (= e!526601 (not call!40768))))

(assert (= (and d!113177 c!97623) b!937744))

(assert (= (and d!113177 (not c!97623)) b!937753))

(assert (= (and b!937753 c!97618) b!937755))

(assert (= (and b!937753 (not c!97618)) b!937742))

(assert (= (and b!937742 c!97621) b!937738))

(assert (= (and b!937742 (not c!97621)) b!937751))

(assert (= (or b!937738 b!937751) bm!40769))

(assert (= (or b!937755 bm!40769) bm!40766))

(assert (= (or b!937755 b!937738) bm!40768))

(assert (= (or b!937744 bm!40766) bm!40771))

(assert (= (or b!937744 bm!40768) bm!40770))

(assert (= (and d!113177 res!631086) b!937741))

(assert (= (and d!113177 c!97620) b!937749))

(assert (= (and d!113177 (not c!97620)) b!937743))

(assert (= (and d!113177 res!631085) b!937740))

(assert (= (and b!937740 res!631084) b!937754))

(assert (= (and b!937740 (not res!631083)) b!937747))

(assert (= (and b!937747 res!631088) b!937750))

(assert (= (and b!937740 res!631091) b!937745))

(assert (= (and b!937745 c!97622) b!937748))

(assert (= (and b!937745 (not c!97622)) b!937746))

(assert (= (and b!937748 res!631090) b!937756))

(assert (= (or b!937748 b!937746) bm!40767))

(assert (= (and b!937745 res!631087) b!937757))

(assert (= (and b!937757 c!97619) b!937739))

(assert (= (and b!937757 (not c!97619)) b!937758))

(assert (= (and b!937739 res!631089) b!937752))

(assert (= (or b!937739 b!937758) bm!40765))

(declare-fun b_lambda!14151 () Bool)

(assert (=> (not b_lambda!14151) (not b!937750)))

(assert (=> b!937750 t!27459))

(declare-fun b_and!29081 () Bool)

(assert (= b_and!29079 (and (=> t!27459 result!12111) b_and!29081)))

(assert (=> b!937741 m!871925))

(assert (=> b!937741 m!871925))

(declare-fun m!872113 () Bool)

(assert (=> b!937741 m!872113))

(declare-fun m!872115 () Bool)

(assert (=> bm!40767 m!872115))

(declare-fun m!872117 () Bool)

(assert (=> bm!40770 m!872117))

(declare-fun m!872119 () Bool)

(assert (=> b!937756 m!872119))

(declare-fun m!872121 () Bool)

(assert (=> b!937752 m!872121))

(declare-fun m!872123 () Bool)

(assert (=> b!937744 m!872123))

(declare-fun m!872125 () Bool)

(assert (=> b!937749 m!872125))

(declare-fun m!872127 () Bool)

(assert (=> b!937749 m!872127))

(declare-fun m!872129 () Bool)

(assert (=> b!937749 m!872129))

(declare-fun m!872131 () Bool)

(assert (=> b!937749 m!872131))

(declare-fun m!872133 () Bool)

(assert (=> b!937749 m!872133))

(declare-fun m!872135 () Bool)

(assert (=> b!937749 m!872135))

(declare-fun m!872137 () Bool)

(assert (=> b!937749 m!872137))

(declare-fun m!872139 () Bool)

(assert (=> b!937749 m!872139))

(declare-fun m!872141 () Bool)

(assert (=> b!937749 m!872141))

(declare-fun m!872143 () Bool)

(assert (=> b!937749 m!872143))

(declare-fun m!872145 () Bool)

(assert (=> b!937749 m!872145))

(assert (=> b!937749 m!872137))

(assert (=> b!937749 m!872145))

(declare-fun m!872147 () Bool)

(assert (=> b!937749 m!872147))

(declare-fun m!872149 () Bool)

(assert (=> b!937749 m!872149))

(declare-fun m!872151 () Bool)

(assert (=> b!937749 m!872151))

(assert (=> b!937749 m!872149))

(declare-fun m!872153 () Bool)

(assert (=> b!937749 m!872153))

(assert (=> b!937749 m!872127))

(declare-fun m!872155 () Bool)

(assert (=> b!937749 m!872155))

(assert (=> b!937749 m!871925))

(assert (=> bm!40771 m!872133))

(assert (=> d!113177 m!871739))

(assert (=> b!937754 m!871925))

(assert (=> b!937754 m!871925))

(assert (=> b!937754 m!872113))

(declare-fun m!872157 () Bool)

(assert (=> b!937750 m!872157))

(assert (=> b!937750 m!872157))

(assert (=> b!937750 m!871759))

(declare-fun m!872159 () Bool)

(assert (=> b!937750 m!872159))

(assert (=> b!937750 m!871759))

(assert (=> b!937750 m!871925))

(declare-fun m!872161 () Bool)

(assert (=> b!937750 m!872161))

(assert (=> b!937750 m!871925))

(assert (=> b!937747 m!871925))

(assert (=> b!937747 m!871925))

(declare-fun m!872163 () Bool)

(assert (=> b!937747 m!872163))

(declare-fun m!872165 () Bool)

(assert (=> bm!40765 m!872165))

(assert (=> b!937458 d!113177))

(declare-fun d!113179 () Bool)

(declare-fun e!526608 () Bool)

(assert (=> d!113179 e!526608))

(declare-fun res!631092 () Bool)

(assert (=> d!113179 (=> res!631092 e!526608)))

(declare-fun lt!423224 () Bool)

(assert (=> d!113179 (= res!631092 (not lt!423224))))

(declare-fun lt!423222 () Bool)

(assert (=> d!113179 (= lt!423224 lt!423222)))

(declare-fun lt!423221 () Unit!31564)

(declare-fun e!526609 () Unit!31564)

(assert (=> d!113179 (= lt!423221 e!526609)))

(declare-fun c!97624 () Bool)

(assert (=> d!113179 (= c!97624 lt!423222)))

(assert (=> d!113179 (= lt!423222 (containsKey!450 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(assert (=> d!113179 (= (contains!5077 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) k0!1099) lt!423224)))

(declare-fun b!937759 () Bool)

(declare-fun lt!423223 () Unit!31564)

(assert (=> b!937759 (= e!526609 lt!423223)))

(assert (=> b!937759 (= lt!423223 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(assert (=> b!937759 (isDefined!358 (getValueByKey!486 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(declare-fun b!937760 () Bool)

(declare-fun Unit!31579 () Unit!31564)

(assert (=> b!937760 (= e!526609 Unit!31579)))

(declare-fun b!937761 () Bool)

(assert (=> b!937761 (= e!526608 (isDefined!358 (getValueByKey!486 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099)))))

(assert (= (and d!113179 c!97624) b!937759))

(assert (= (and d!113179 (not c!97624)) b!937760))

(assert (= (and d!113179 (not res!631092)) b!937761))

(declare-fun m!872167 () Bool)

(assert (=> d!113179 m!872167))

(declare-fun m!872169 () Bool)

(assert (=> b!937759 m!872169))

(declare-fun m!872171 () Bool)

(assert (=> b!937759 m!872171))

(assert (=> b!937759 m!872171))

(declare-fun m!872173 () Bool)

(assert (=> b!937759 m!872173))

(assert (=> b!937761 m!872171))

(assert (=> b!937761 m!872171))

(assert (=> b!937761 m!872173))

(assert (=> b!937452 d!113179))

(assert (=> b!937452 d!113147))

(declare-fun b!937768 () Bool)

(declare-fun e!526615 () Bool)

(assert (=> b!937768 (= e!526615 tp_is_empty!20257)))

(declare-fun b!937769 () Bool)

(declare-fun e!526614 () Bool)

(assert (=> b!937769 (= e!526614 tp_is_empty!20257)))

(declare-fun mapNonEmpty!32166 () Bool)

(declare-fun mapRes!32166 () Bool)

(declare-fun tp!61719 () Bool)

(assert (=> mapNonEmpty!32166 (= mapRes!32166 (and tp!61719 e!526615))))

(declare-fun mapKey!32166 () (_ BitVec 32))

(declare-fun mapRest!32166 () (Array (_ BitVec 32) ValueCell!9647))

(declare-fun mapValue!32166 () ValueCell!9647)

(assert (=> mapNonEmpty!32166 (= mapRest!32157 (store mapRest!32166 mapKey!32166 mapValue!32166))))

(declare-fun condMapEmpty!32166 () Bool)

(declare-fun mapDefault!32166 () ValueCell!9647)

(assert (=> mapNonEmpty!32157 (= condMapEmpty!32166 (= mapRest!32157 ((as const (Array (_ BitVec 32) ValueCell!9647)) mapDefault!32166)))))

(assert (=> mapNonEmpty!32157 (= tp!61703 (and e!526614 mapRes!32166))))

(declare-fun mapIsEmpty!32166 () Bool)

(assert (=> mapIsEmpty!32166 mapRes!32166))

(assert (= (and mapNonEmpty!32157 condMapEmpty!32166) mapIsEmpty!32166))

(assert (= (and mapNonEmpty!32157 (not condMapEmpty!32166)) mapNonEmpty!32166))

(assert (= (and mapNonEmpty!32166 ((_ is ValueCellFull!9647) mapValue!32166)) b!937768))

(assert (= (and mapNonEmpty!32157 ((_ is ValueCellFull!9647) mapDefault!32166)) b!937769))

(declare-fun m!872175 () Bool)

(assert (=> mapNonEmpty!32166 m!872175))

(declare-fun b_lambda!14153 () Bool)

(assert (= b_lambda!14151 (or (and start!79682 b_free!17749) b_lambda!14153)))

(declare-fun b_lambda!14155 () Bool)

(assert (= b_lambda!14149 (or (and start!79682 b_free!17749) b_lambda!14155)))

(declare-fun b_lambda!14157 () Bool)

(assert (= b_lambda!14145 (or (and start!79682 b_free!17749) b_lambda!14157)))

(declare-fun b_lambda!14159 () Bool)

(assert (= b_lambda!14147 (or (and start!79682 b_free!17749) b_lambda!14159)))

(check-sat (not b!937733) (not b!937596) (not bm!40763) (not b!937717) (not b!937737) (not b!937662) (not b!937667) (not b!937735) (not b!937710) (not b_lambda!14153) (not b!937750) (not b!937687) (not b!937761) (not b!937654) (not d!113133) (not d!113159) (not b!937744) (not d!113177) (not b!937756) (not b_lambda!14157) (not d!113161) (not b!937707) (not b!937726) (not bm!40759) (not bm!40732) (not b!937684) (not mapNonEmpty!32166) (not b!937695) (not bm!40735) (not b_next!17749) (not b!937759) (not b!937715) (not b!937734) (not b!937680) (not b!937690) (not b!937608) (not b!937693) (not d!113167) (not d!113179) (not bm!40764) (not b!937590) (not bm!40771) (not b!937660) (not b!937747) (not b!937721) (not b!937699) (not d!113157) (not d!113173) (not bm!40752) (not b!937754) (not d!113147) (not b!937706) (not bm!40750) (not b!937665) (not b!937752) (not bm!40756) (not b!937692) (not bm!40762) (not bm!40755) (not b_lambda!14155) (not b!937669) (not b!937657) (not b_lambda!14143) (not bm!40757) (not d!113169) b_and!29081 (not b!937586) (not b_lambda!14159) (not b!937605) (not b!937718) (not b!937697) (not d!113155) (not d!113153) (not d!113149) (not bm!40767) (not bm!40770) (not bm!40765) (not b!937741) (not b!937587) (not b!937663) (not d!113175) tp_is_empty!20257 (not b!937716) (not b!937749) (not d!113163) (not b!937678) (not d!113151))
(check-sat b_and!29081 (not b_next!17749))
(get-model)

(declare-fun d!113181 () Bool)

(declare-fun lt!423227 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!406 (List!19176) (InoxSet tuple2!13432))

(assert (=> d!113181 (= lt!423227 (select (content!406 (toList!6075 lt!423171)) lt!422962))))

(declare-fun e!526621 () Bool)

(assert (=> d!113181 (= lt!423227 e!526621)))

(declare-fun res!631098 () Bool)

(assert (=> d!113181 (=> (not res!631098) (not e!526621))))

(assert (=> d!113181 (= res!631098 ((_ is Cons!19172) (toList!6075 lt!423171)))))

(assert (=> d!113181 (= (contains!5080 (toList!6075 lt!423171) lt!422962) lt!423227)))

(declare-fun b!937774 () Bool)

(declare-fun e!526620 () Bool)

(assert (=> b!937774 (= e!526621 e!526620)))

(declare-fun res!631097 () Bool)

(assert (=> b!937774 (=> res!631097 e!526620)))

(assert (=> b!937774 (= res!631097 (= (h!20318 (toList!6075 lt!423171)) lt!422962))))

(declare-fun b!937775 () Bool)

(assert (=> b!937775 (= e!526620 (contains!5080 (t!27460 (toList!6075 lt!423171)) lt!422962))))

(assert (= (and d!113181 res!631098) b!937774))

(assert (= (and b!937774 (not res!631097)) b!937775))

(declare-fun m!872177 () Bool)

(assert (=> d!113181 m!872177))

(declare-fun m!872179 () Bool)

(assert (=> d!113181 m!872179))

(declare-fun m!872181 () Bool)

(assert (=> b!937775 m!872181))

(assert (=> b!937707 d!113181))

(declare-fun d!113183 () Bool)

(assert (=> d!113183 (= (validKeyInArray!0 (select (arr!27152 _keys!1487) from!1844)) (and (not (= (select (arr!27152 _keys!1487) from!1844) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27152 _keys!1487) from!1844) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937741 d!113183))

(declare-fun d!113185 () Bool)

(declare-fun e!526622 () Bool)

(assert (=> d!113185 e!526622))

(declare-fun res!631099 () Bool)

(assert (=> d!113185 (=> res!631099 e!526622)))

(declare-fun lt!423231 () Bool)

(assert (=> d!113185 (= res!631099 (not lt!423231))))

(declare-fun lt!423229 () Bool)

(assert (=> d!113185 (= lt!423231 lt!423229)))

(declare-fun lt!423228 () Unit!31564)

(declare-fun e!526623 () Unit!31564)

(assert (=> d!113185 (= lt!423228 e!526623)))

(declare-fun c!97625 () Bool)

(assert (=> d!113185 (= c!97625 lt!423229)))

(assert (=> d!113185 (= lt!423229 (containsKey!450 (toList!6075 lt!423147) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113185 (= (contains!5077 lt!423147 #b0000000000000000000000000000000000000000000000000000000000000000) lt!423231)))

(declare-fun b!937776 () Bool)

(declare-fun lt!423230 () Unit!31564)

(assert (=> b!937776 (= e!526623 lt!423230)))

(assert (=> b!937776 (= lt!423230 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 lt!423147) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!937776 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423147) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!937777 () Bool)

(declare-fun Unit!31580 () Unit!31564)

(assert (=> b!937777 (= e!526623 Unit!31580)))

(declare-fun b!937778 () Bool)

(assert (=> b!937778 (= e!526622 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423147) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113185 c!97625) b!937776))

(assert (= (and d!113185 (not c!97625)) b!937777))

(assert (= (and d!113185 (not res!631099)) b!937778))

(declare-fun m!872183 () Bool)

(assert (=> d!113185 m!872183))

(declare-fun m!872185 () Bool)

(assert (=> b!937776 m!872185))

(declare-fun m!872187 () Bool)

(assert (=> b!937776 m!872187))

(assert (=> b!937776 m!872187))

(declare-fun m!872189 () Bool)

(assert (=> b!937776 m!872189))

(assert (=> b!937778 m!872187))

(assert (=> b!937778 m!872187))

(assert (=> b!937778 m!872189))

(assert (=> bm!40759 d!113185))

(declare-fun b!937803 () Bool)

(declare-fun e!526639 () ListLongMap!12119)

(assert (=> b!937803 (= e!526639 (ListLongMap!12120 Nil!19173))))

(declare-fun b!937804 () Bool)

(declare-fun e!526644 () ListLongMap!12119)

(declare-fun call!40777 () ListLongMap!12119)

(assert (=> b!937804 (= e!526644 call!40777)))

(declare-fun b!937805 () Bool)

(declare-fun e!526643 () Bool)

(declare-fun e!526638 () Bool)

(assert (=> b!937805 (= e!526643 e!526638)))

(assert (=> b!937805 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27613 _keys!1487)))))

(declare-fun lt!423251 () ListLongMap!12119)

(declare-fun res!631108 () Bool)

(assert (=> b!937805 (= res!631108 (contains!5077 lt!423251 (select (arr!27152 _keys!1487) from!1844)))))

(assert (=> b!937805 (=> (not res!631108) (not e!526638))))

(declare-fun b!937806 () Bool)

(declare-fun e!526640 () Bool)

(assert (=> b!937806 (= e!526640 e!526643)))

(declare-fun c!97636 () Bool)

(declare-fun e!526641 () Bool)

(assert (=> b!937806 (= c!97636 e!526641)))

(declare-fun res!631110 () Bool)

(assert (=> b!937806 (=> (not res!631110) (not e!526641))))

(assert (=> b!937806 (= res!631110 (bvslt from!1844 (size!27613 _keys!1487)))))

(declare-fun e!526642 () Bool)

(declare-fun b!937807 () Bool)

(assert (=> b!937807 (= e!526642 (= lt!423251 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!937808 () Bool)

(assert (=> b!937808 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27613 _keys!1487)))))

(assert (=> b!937808 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27612 _values!1231)))))

(assert (=> b!937808 (= e!526638 (= (apply!849 lt!423251 (select (arr!27152 _keys!1487) from!1844)) (get!14324 (select (arr!27151 _values!1231) from!1844) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!937810 () Bool)

(assert (=> b!937810 (= e!526639 e!526644)))

(declare-fun c!97635 () Bool)

(assert (=> b!937810 (= c!97635 (validKeyInArray!0 (select (arr!27152 _keys!1487) from!1844)))))

(declare-fun b!937811 () Bool)

(declare-fun res!631109 () Bool)

(assert (=> b!937811 (=> (not res!631109) (not e!526640))))

(assert (=> b!937811 (= res!631109 (not (contains!5077 lt!423251 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!937812 () Bool)

(assert (=> b!937812 (= e!526643 e!526642)))

(declare-fun c!97634 () Bool)

(assert (=> b!937812 (= c!97634 (bvslt from!1844 (size!27613 _keys!1487)))))

(declare-fun b!937813 () Bool)

(declare-fun isEmpty!701 (ListLongMap!12119) Bool)

(assert (=> b!937813 (= e!526642 (isEmpty!701 lt!423251))))

(declare-fun b!937814 () Bool)

(assert (=> b!937814 (= e!526641 (validKeyInArray!0 (select (arr!27152 _keys!1487) from!1844)))))

(assert (=> b!937814 (bvsge from!1844 #b00000000000000000000000000000000)))

(declare-fun bm!40774 () Bool)

(assert (=> bm!40774 (= call!40777 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun d!113187 () Bool)

(assert (=> d!113187 e!526640))

(declare-fun res!631111 () Bool)

(assert (=> d!113187 (=> (not res!631111) (not e!526640))))

(assert (=> d!113187 (= res!631111 (not (contains!5077 lt!423251 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!113187 (= lt!423251 e!526639)))

(declare-fun c!97637 () Bool)

(assert (=> d!113187 (= c!97637 (bvsge from!1844 (size!27613 _keys!1487)))))

(assert (=> d!113187 (validMask!0 mask!1881)))

(assert (=> d!113187 (= (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!423251)))

(declare-fun b!937809 () Bool)

(declare-fun lt!423249 () Unit!31564)

(declare-fun lt!423252 () Unit!31564)

(assert (=> b!937809 (= lt!423249 lt!423252)))

(declare-fun lt!423250 () (_ BitVec 64))

(declare-fun lt!423248 () (_ BitVec 64))

(declare-fun lt!423247 () V!31975)

(declare-fun lt!423246 () ListLongMap!12119)

(assert (=> b!937809 (not (contains!5077 (+!2864 lt!423246 (tuple2!13433 lt!423250 lt!423247)) lt!423248))))

(declare-fun addStillNotContains!221 (ListLongMap!12119 (_ BitVec 64) V!31975 (_ BitVec 64)) Unit!31564)

(assert (=> b!937809 (= lt!423252 (addStillNotContains!221 lt!423246 lt!423250 lt!423247 lt!423248))))

(assert (=> b!937809 (= lt!423248 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!937809 (= lt!423247 (get!14324 (select (arr!27151 _values!1231) from!1844) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!937809 (= lt!423250 (select (arr!27152 _keys!1487) from!1844))))

(assert (=> b!937809 (= lt!423246 call!40777)))

(assert (=> b!937809 (= e!526644 (+!2864 call!40777 (tuple2!13433 (select (arr!27152 _keys!1487) from!1844) (get!14324 (select (arr!27151 _values!1231) from!1844) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!113187 c!97637) b!937803))

(assert (= (and d!113187 (not c!97637)) b!937810))

(assert (= (and b!937810 c!97635) b!937809))

(assert (= (and b!937810 (not c!97635)) b!937804))

(assert (= (or b!937809 b!937804) bm!40774))

(assert (= (and d!113187 res!631111) b!937811))

(assert (= (and b!937811 res!631109) b!937806))

(assert (= (and b!937806 res!631110) b!937814))

(assert (= (and b!937806 c!97636) b!937805))

(assert (= (and b!937806 (not c!97636)) b!937812))

(assert (= (and b!937805 res!631108) b!937808))

(assert (= (and b!937812 c!97634) b!937807))

(assert (= (and b!937812 (not c!97634)) b!937813))

(declare-fun b_lambda!14161 () Bool)

(assert (=> (not b_lambda!14161) (not b!937808)))

(assert (=> b!937808 t!27459))

(declare-fun b_and!29083 () Bool)

(assert (= b_and!29081 (and (=> t!27459 result!12111) b_and!29083)))

(declare-fun b_lambda!14163 () Bool)

(assert (=> (not b_lambda!14163) (not b!937809)))

(assert (=> b!937809 t!27459))

(declare-fun b_and!29085 () Bool)

(assert (= b_and!29083 (and (=> t!27459 result!12111) b_and!29085)))

(declare-fun m!872191 () Bool)

(assert (=> b!937809 m!872191))

(declare-fun m!872193 () Bool)

(assert (=> b!937809 m!872193))

(declare-fun m!872195 () Bool)

(assert (=> b!937809 m!872195))

(assert (=> b!937809 m!872157))

(assert (=> b!937809 m!871759))

(assert (=> b!937809 m!872159))

(assert (=> b!937809 m!871925))

(assert (=> b!937809 m!871759))

(assert (=> b!937809 m!872157))

(assert (=> b!937809 m!872195))

(declare-fun m!872197 () Bool)

(assert (=> b!937809 m!872197))

(assert (=> b!937810 m!871925))

(assert (=> b!937810 m!871925))

(assert (=> b!937810 m!872113))

(declare-fun m!872199 () Bool)

(assert (=> bm!40774 m!872199))

(declare-fun m!872201 () Bool)

(assert (=> b!937813 m!872201))

(declare-fun m!872203 () Bool)

(assert (=> b!937811 m!872203))

(assert (=> b!937814 m!871925))

(assert (=> b!937814 m!871925))

(assert (=> b!937814 m!872113))

(declare-fun m!872205 () Bool)

(assert (=> d!113187 m!872205))

(assert (=> d!113187 m!871739))

(assert (=> b!937808 m!872157))

(assert (=> b!937808 m!871759))

(assert (=> b!937808 m!872159))

(assert (=> b!937808 m!871925))

(assert (=> b!937808 m!871759))

(assert (=> b!937808 m!871925))

(declare-fun m!872207 () Bool)

(assert (=> b!937808 m!872207))

(assert (=> b!937808 m!872157))

(assert (=> b!937805 m!871925))

(assert (=> b!937805 m!871925))

(declare-fun m!872209 () Bool)

(assert (=> b!937805 m!872209))

(assert (=> b!937807 m!872199))

(assert (=> bm!40771 d!113187))

(declare-fun d!113189 () Bool)

(assert (=> d!113189 (= (validKeyInArray!0 (select (arr!27152 _keys!1487) #b00000000000000000000000000000000)) (and (not (= (select (arr!27152 _keys!1487) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27152 _keys!1487) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937587 d!113189))

(assert (=> b!937605 d!113189))

(assert (=> d!113177 d!113141))

(declare-fun d!113191 () Bool)

(assert (=> d!113191 (= (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (and (not (= (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937721 d!113191))

(declare-fun d!113193 () Bool)

(declare-fun res!631116 () Bool)

(declare-fun e!526649 () Bool)

(assert (=> d!113193 (=> res!631116 e!526649)))

(assert (=> d!113193 (= res!631116 (and ((_ is Cons!19172) (toList!6075 lt!422966)) (= (_1!6727 (h!20318 (toList!6075 lt!422966))) k0!1099)))))

(assert (=> d!113193 (= (containsKey!450 (toList!6075 lt!422966) k0!1099) e!526649)))

(declare-fun b!937819 () Bool)

(declare-fun e!526650 () Bool)

(assert (=> b!937819 (= e!526649 e!526650)))

(declare-fun res!631117 () Bool)

(assert (=> b!937819 (=> (not res!631117) (not e!526650))))

(assert (=> b!937819 (= res!631117 (and (or (not ((_ is Cons!19172) (toList!6075 lt!422966))) (bvsle (_1!6727 (h!20318 (toList!6075 lt!422966))) k0!1099)) ((_ is Cons!19172) (toList!6075 lt!422966)) (bvslt (_1!6727 (h!20318 (toList!6075 lt!422966))) k0!1099)))))

(declare-fun b!937820 () Bool)

(assert (=> b!937820 (= e!526650 (containsKey!450 (t!27460 (toList!6075 lt!422966)) k0!1099))))

(assert (= (and d!113193 (not res!631116)) b!937819))

(assert (= (and b!937819 res!631117) b!937820))

(declare-fun m!872211 () Bool)

(assert (=> b!937820 m!872211))

(assert (=> d!113175 d!113193))

(declare-fun b!937821 () Bool)

(declare-fun e!526652 () ListLongMap!12119)

(assert (=> b!937821 (= e!526652 (ListLongMap!12120 Nil!19173))))

(declare-fun b!937822 () Bool)

(declare-fun e!526657 () ListLongMap!12119)

(declare-fun call!40778 () ListLongMap!12119)

(assert (=> b!937822 (= e!526657 call!40778)))

(declare-fun b!937823 () Bool)

(declare-fun e!526656 () Bool)

(declare-fun e!526651 () Bool)

(assert (=> b!937823 (= e!526656 e!526651)))

(assert (=> b!937823 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(declare-fun res!631118 () Bool)

(declare-fun lt!423258 () ListLongMap!12119)

(assert (=> b!937823 (= res!631118 (contains!5077 lt!423258 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!937823 (=> (not res!631118) (not e!526651))))

(declare-fun b!937824 () Bool)

(declare-fun e!526653 () Bool)

(assert (=> b!937824 (= e!526653 e!526656)))

(declare-fun c!97640 () Bool)

(declare-fun e!526654 () Bool)

(assert (=> b!937824 (= c!97640 e!526654)))

(declare-fun res!631120 () Bool)

(assert (=> b!937824 (=> (not res!631120) (not e!526654))))

(assert (=> b!937824 (= res!631120 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(declare-fun e!526655 () Bool)

(declare-fun b!937825 () Bool)

(assert (=> b!937825 (= e!526655 (= lt!423258 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!937826 () Bool)

(assert (=> b!937826 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(assert (=> b!937826 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27612 _values!1231)))))

(assert (=> b!937826 (= e!526651 (= (apply!849 lt!423258 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!937828 () Bool)

(assert (=> b!937828 (= e!526652 e!526657)))

(declare-fun c!97639 () Bool)

(assert (=> b!937828 (= c!97639 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!937829 () Bool)

(declare-fun res!631119 () Bool)

(assert (=> b!937829 (=> (not res!631119) (not e!526653))))

(assert (=> b!937829 (= res!631119 (not (contains!5077 lt!423258 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!937830 () Bool)

(assert (=> b!937830 (= e!526656 e!526655)))

(declare-fun c!97638 () Bool)

(assert (=> b!937830 (= c!97638 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(declare-fun b!937831 () Bool)

(assert (=> b!937831 (= e!526655 (isEmpty!701 lt!423258))))

(declare-fun b!937832 () Bool)

(assert (=> b!937832 (= e!526654 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!937832 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun bm!40775 () Bool)

(assert (=> bm!40775 (= call!40778 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun d!113195 () Bool)

(assert (=> d!113195 e!526653))

(declare-fun res!631121 () Bool)

(assert (=> d!113195 (=> (not res!631121) (not e!526653))))

(assert (=> d!113195 (= res!631121 (not (contains!5077 lt!423258 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!113195 (= lt!423258 e!526652)))

(declare-fun c!97641 () Bool)

(assert (=> d!113195 (= c!97641 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(assert (=> d!113195 (validMask!0 mask!1881)))

(assert (=> d!113195 (= (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!423258)))

(declare-fun b!937827 () Bool)

(declare-fun lt!423256 () Unit!31564)

(declare-fun lt!423259 () Unit!31564)

(assert (=> b!937827 (= lt!423256 lt!423259)))

(declare-fun lt!423257 () (_ BitVec 64))

(declare-fun lt!423255 () (_ BitVec 64))

(declare-fun lt!423254 () V!31975)

(declare-fun lt!423253 () ListLongMap!12119)

(assert (=> b!937827 (not (contains!5077 (+!2864 lt!423253 (tuple2!13433 lt!423257 lt!423254)) lt!423255))))

(assert (=> b!937827 (= lt!423259 (addStillNotContains!221 lt!423253 lt!423257 lt!423254 lt!423255))))

(assert (=> b!937827 (= lt!423255 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!937827 (= lt!423254 (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!937827 (= lt!423257 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!937827 (= lt!423253 call!40778)))

(assert (=> b!937827 (= e!526657 (+!2864 call!40778 (tuple2!13433 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!113195 c!97641) b!937821))

(assert (= (and d!113195 (not c!97641)) b!937828))

(assert (= (and b!937828 c!97639) b!937827))

(assert (= (and b!937828 (not c!97639)) b!937822))

(assert (= (or b!937827 b!937822) bm!40775))

(assert (= (and d!113195 res!631121) b!937829))

(assert (= (and b!937829 res!631119) b!937824))

(assert (= (and b!937824 res!631120) b!937832))

(assert (= (and b!937824 c!97640) b!937823))

(assert (= (and b!937824 (not c!97640)) b!937830))

(assert (= (and b!937823 res!631118) b!937826))

(assert (= (and b!937830 c!97638) b!937825))

(assert (= (and b!937830 (not c!97638)) b!937831))

(declare-fun b_lambda!14165 () Bool)

(assert (=> (not b_lambda!14165) (not b!937826)))

(assert (=> b!937826 t!27459))

(declare-fun b_and!29087 () Bool)

(assert (= b_and!29085 (and (=> t!27459 result!12111) b_and!29087)))

(declare-fun b_lambda!14167 () Bool)

(assert (=> (not b_lambda!14167) (not b!937827)))

(assert (=> b!937827 t!27459))

(declare-fun b_and!29089 () Bool)

(assert (= b_and!29087 (and (=> t!27459 result!12111) b_and!29089)))

(declare-fun m!872213 () Bool)

(assert (=> b!937827 m!872213))

(declare-fun m!872215 () Bool)

(assert (=> b!937827 m!872215))

(declare-fun m!872217 () Bool)

(assert (=> b!937827 m!872217))

(assert (=> b!937827 m!871755))

(assert (=> b!937827 m!871759))

(assert (=> b!937827 m!871763))

(assert (=> b!937827 m!871787))

(assert (=> b!937827 m!871759))

(assert (=> b!937827 m!871755))

(assert (=> b!937827 m!872217))

(declare-fun m!872219 () Bool)

(assert (=> b!937827 m!872219))

(assert (=> b!937828 m!871787))

(assert (=> b!937828 m!871787))

(assert (=> b!937828 m!871937))

(declare-fun m!872221 () Bool)

(assert (=> bm!40775 m!872221))

(declare-fun m!872223 () Bool)

(assert (=> b!937831 m!872223))

(declare-fun m!872225 () Bool)

(assert (=> b!937829 m!872225))

(assert (=> b!937832 m!871787))

(assert (=> b!937832 m!871787))

(assert (=> b!937832 m!871937))

(declare-fun m!872227 () Bool)

(assert (=> d!113195 m!872227))

(assert (=> d!113195 m!871739))

(assert (=> b!937826 m!871755))

(assert (=> b!937826 m!871759))

(assert (=> b!937826 m!871763))

(assert (=> b!937826 m!871787))

(assert (=> b!937826 m!871759))

(assert (=> b!937826 m!871787))

(declare-fun m!872229 () Bool)

(assert (=> b!937826 m!872229))

(assert (=> b!937826 m!871755))

(assert (=> b!937823 m!871787))

(assert (=> b!937823 m!871787))

(declare-fun m!872231 () Bool)

(assert (=> b!937823 m!872231))

(assert (=> b!937825 m!872221))

(assert (=> b!937662 d!113195))

(declare-fun d!113197 () Bool)

(assert (=> d!113197 (= (apply!849 lt!423111 lt!423120) (get!14325 (getValueByKey!486 (toList!6075 lt!423111) lt!423120)))))

(declare-fun bs!26274 () Bool)

(assert (= bs!26274 d!113197))

(declare-fun m!872233 () Bool)

(assert (=> bs!26274 m!872233))

(assert (=> bs!26274 m!872233))

(declare-fun m!872235 () Bool)

(assert (=> bs!26274 m!872235))

(assert (=> b!937662 d!113197))

(declare-fun d!113199 () Bool)

(declare-fun e!526658 () Bool)

(assert (=> d!113199 e!526658))

(declare-fun res!631122 () Bool)

(assert (=> d!113199 (=> res!631122 e!526658)))

(declare-fun lt!423263 () Bool)

(assert (=> d!113199 (= res!631122 (not lt!423263))))

(declare-fun lt!423261 () Bool)

(assert (=> d!113199 (= lt!423263 lt!423261)))

(declare-fun lt!423260 () Unit!31564)

(declare-fun e!526659 () Unit!31564)

(assert (=> d!113199 (= lt!423260 e!526659)))

(declare-fun c!97642 () Bool)

(assert (=> d!113199 (= c!97642 lt!423261)))

(assert (=> d!113199 (= lt!423261 (containsKey!450 (toList!6075 (+!2864 lt!423110 (tuple2!13433 lt!423117 zeroValue!1173))) lt!423118))))

(assert (=> d!113199 (= (contains!5077 (+!2864 lt!423110 (tuple2!13433 lt!423117 zeroValue!1173)) lt!423118) lt!423263)))

(declare-fun b!937833 () Bool)

(declare-fun lt!423262 () Unit!31564)

(assert (=> b!937833 (= e!526659 lt!423262)))

(assert (=> b!937833 (= lt!423262 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 (+!2864 lt!423110 (tuple2!13433 lt!423117 zeroValue!1173))) lt!423118))))

(assert (=> b!937833 (isDefined!358 (getValueByKey!486 (toList!6075 (+!2864 lt!423110 (tuple2!13433 lt!423117 zeroValue!1173))) lt!423118))))

(declare-fun b!937834 () Bool)

(declare-fun Unit!31581 () Unit!31564)

(assert (=> b!937834 (= e!526659 Unit!31581)))

(declare-fun b!937835 () Bool)

(assert (=> b!937835 (= e!526658 (isDefined!358 (getValueByKey!486 (toList!6075 (+!2864 lt!423110 (tuple2!13433 lt!423117 zeroValue!1173))) lt!423118)))))

(assert (= (and d!113199 c!97642) b!937833))

(assert (= (and d!113199 (not c!97642)) b!937834))

(assert (= (and d!113199 (not res!631122)) b!937835))

(declare-fun m!872237 () Bool)

(assert (=> d!113199 m!872237))

(declare-fun m!872239 () Bool)

(assert (=> b!937833 m!872239))

(declare-fun m!872241 () Bool)

(assert (=> b!937833 m!872241))

(assert (=> b!937833 m!872241))

(declare-fun m!872243 () Bool)

(assert (=> b!937833 m!872243))

(assert (=> b!937835 m!872241))

(assert (=> b!937835 m!872241))

(assert (=> b!937835 m!872243))

(assert (=> b!937662 d!113199))

(declare-fun d!113201 () Bool)

(declare-fun e!526660 () Bool)

(assert (=> d!113201 e!526660))

(declare-fun res!631124 () Bool)

(assert (=> d!113201 (=> (not res!631124) (not e!526660))))

(declare-fun lt!423266 () ListLongMap!12119)

(assert (=> d!113201 (= res!631124 (contains!5077 lt!423266 (_1!6727 (tuple2!13433 lt!423105 zeroValue!1173))))))

(declare-fun lt!423267 () List!19176)

(assert (=> d!113201 (= lt!423266 (ListLongMap!12120 lt!423267))))

(declare-fun lt!423264 () Unit!31564)

(declare-fun lt!423265 () Unit!31564)

(assert (=> d!113201 (= lt!423264 lt!423265)))

(assert (=> d!113201 (= (getValueByKey!486 lt!423267 (_1!6727 (tuple2!13433 lt!423105 zeroValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423105 zeroValue!1173))))))

(assert (=> d!113201 (= lt!423265 (lemmaContainsTupThenGetReturnValue!260 lt!423267 (_1!6727 (tuple2!13433 lt!423105 zeroValue!1173)) (_2!6727 (tuple2!13433 lt!423105 zeroValue!1173))))))

(assert (=> d!113201 (= lt!423267 (insertStrictlySorted!317 (toList!6075 lt!423106) (_1!6727 (tuple2!13433 lt!423105 zeroValue!1173)) (_2!6727 (tuple2!13433 lt!423105 zeroValue!1173))))))

(assert (=> d!113201 (= (+!2864 lt!423106 (tuple2!13433 lt!423105 zeroValue!1173)) lt!423266)))

(declare-fun b!937836 () Bool)

(declare-fun res!631123 () Bool)

(assert (=> b!937836 (=> (not res!631123) (not e!526660))))

(assert (=> b!937836 (= res!631123 (= (getValueByKey!486 (toList!6075 lt!423266) (_1!6727 (tuple2!13433 lt!423105 zeroValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423105 zeroValue!1173)))))))

(declare-fun b!937837 () Bool)

(assert (=> b!937837 (= e!526660 (contains!5080 (toList!6075 lt!423266) (tuple2!13433 lt!423105 zeroValue!1173)))))

(assert (= (and d!113201 res!631124) b!937836))

(assert (= (and b!937836 res!631123) b!937837))

(declare-fun m!872245 () Bool)

(assert (=> d!113201 m!872245))

(declare-fun m!872247 () Bool)

(assert (=> d!113201 m!872247))

(declare-fun m!872249 () Bool)

(assert (=> d!113201 m!872249))

(declare-fun m!872251 () Bool)

(assert (=> d!113201 m!872251))

(declare-fun m!872253 () Bool)

(assert (=> b!937836 m!872253))

(declare-fun m!872255 () Bool)

(assert (=> b!937837 m!872255))

(assert (=> b!937662 d!113201))

(declare-fun d!113203 () Bool)

(assert (=> d!113203 (= (apply!849 lt!423106 lt!423114) (get!14325 (getValueByKey!486 (toList!6075 lt!423106) lt!423114)))))

(declare-fun bs!26275 () Bool)

(assert (= bs!26275 d!113203))

(declare-fun m!872257 () Bool)

(assert (=> bs!26275 m!872257))

(assert (=> bs!26275 m!872257))

(declare-fun m!872259 () Bool)

(assert (=> bs!26275 m!872259))

(assert (=> b!937662 d!113203))

(declare-fun d!113205 () Bool)

(assert (=> d!113205 (= (apply!849 lt!423121 lt!423116) (get!14325 (getValueByKey!486 (toList!6075 lt!423121) lt!423116)))))

(declare-fun bs!26276 () Bool)

(assert (= bs!26276 d!113205))

(declare-fun m!872261 () Bool)

(assert (=> bs!26276 m!872261))

(assert (=> bs!26276 m!872261))

(declare-fun m!872263 () Bool)

(assert (=> bs!26276 m!872263))

(assert (=> b!937662 d!113205))

(declare-fun d!113207 () Bool)

(assert (=> d!113207 (= (apply!849 (+!2864 lt!423106 (tuple2!13433 lt!423105 zeroValue!1173)) lt!423114) (apply!849 lt!423106 lt!423114))))

(declare-fun lt!423268 () Unit!31564)

(assert (=> d!113207 (= lt!423268 (choose!1563 lt!423106 lt!423105 zeroValue!1173 lt!423114))))

(declare-fun e!526661 () Bool)

(assert (=> d!113207 e!526661))

(declare-fun res!631125 () Bool)

(assert (=> d!113207 (=> (not res!631125) (not e!526661))))

(assert (=> d!113207 (= res!631125 (contains!5077 lt!423106 lt!423114))))

(assert (=> d!113207 (= (addApplyDifferent!433 lt!423106 lt!423105 zeroValue!1173 lt!423114) lt!423268)))

(declare-fun b!937838 () Bool)

(assert (=> b!937838 (= e!526661 (not (= lt!423114 lt!423105)))))

(assert (= (and d!113207 res!631125) b!937838))

(assert (=> d!113207 m!871967))

(declare-fun m!872265 () Bool)

(assert (=> d!113207 m!872265))

(assert (=> d!113207 m!871969))

(assert (=> d!113207 m!871971))

(declare-fun m!872267 () Bool)

(assert (=> d!113207 m!872267))

(assert (=> d!113207 m!871969))

(assert (=> b!937662 d!113207))

(declare-fun d!113209 () Bool)

(declare-fun e!526662 () Bool)

(assert (=> d!113209 e!526662))

(declare-fun res!631127 () Bool)

(assert (=> d!113209 (=> (not res!631127) (not e!526662))))

(declare-fun lt!423271 () ListLongMap!12119)

(assert (=> d!113209 (= res!631127 (contains!5077 lt!423271 (_1!6727 (tuple2!13433 lt!423117 zeroValue!1173))))))

(declare-fun lt!423272 () List!19176)

(assert (=> d!113209 (= lt!423271 (ListLongMap!12120 lt!423272))))

(declare-fun lt!423269 () Unit!31564)

(declare-fun lt!423270 () Unit!31564)

(assert (=> d!113209 (= lt!423269 lt!423270)))

(assert (=> d!113209 (= (getValueByKey!486 lt!423272 (_1!6727 (tuple2!13433 lt!423117 zeroValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423117 zeroValue!1173))))))

(assert (=> d!113209 (= lt!423270 (lemmaContainsTupThenGetReturnValue!260 lt!423272 (_1!6727 (tuple2!13433 lt!423117 zeroValue!1173)) (_2!6727 (tuple2!13433 lt!423117 zeroValue!1173))))))

(assert (=> d!113209 (= lt!423272 (insertStrictlySorted!317 (toList!6075 lt!423110) (_1!6727 (tuple2!13433 lt!423117 zeroValue!1173)) (_2!6727 (tuple2!13433 lt!423117 zeroValue!1173))))))

(assert (=> d!113209 (= (+!2864 lt!423110 (tuple2!13433 lt!423117 zeroValue!1173)) lt!423271)))

(declare-fun b!937839 () Bool)

(declare-fun res!631126 () Bool)

(assert (=> b!937839 (=> (not res!631126) (not e!526662))))

(assert (=> b!937839 (= res!631126 (= (getValueByKey!486 (toList!6075 lt!423271) (_1!6727 (tuple2!13433 lt!423117 zeroValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423117 zeroValue!1173)))))))

(declare-fun b!937840 () Bool)

(assert (=> b!937840 (= e!526662 (contains!5080 (toList!6075 lt!423271) (tuple2!13433 lt!423117 zeroValue!1173)))))

(assert (= (and d!113209 res!631127) b!937839))

(assert (= (and b!937839 res!631126) b!937840))

(declare-fun m!872269 () Bool)

(assert (=> d!113209 m!872269))

(declare-fun m!872271 () Bool)

(assert (=> d!113209 m!872271))

(declare-fun m!872273 () Bool)

(assert (=> d!113209 m!872273))

(declare-fun m!872275 () Bool)

(assert (=> d!113209 m!872275))

(declare-fun m!872277 () Bool)

(assert (=> b!937839 m!872277))

(declare-fun m!872279 () Bool)

(assert (=> b!937840 m!872279))

(assert (=> b!937662 d!113209))

(declare-fun d!113211 () Bool)

(assert (=> d!113211 (contains!5077 (+!2864 lt!423110 (tuple2!13433 lt!423117 zeroValue!1173)) lt!423118)))

(declare-fun lt!423273 () Unit!31564)

(assert (=> d!113211 (= lt!423273 (choose!1565 lt!423110 lt!423117 zeroValue!1173 lt!423118))))

(assert (=> d!113211 (contains!5077 lt!423110 lt!423118)))

(assert (=> d!113211 (= (addStillContains!553 lt!423110 lt!423117 zeroValue!1173 lt!423118) lt!423273)))

(declare-fun bs!26277 () Bool)

(assert (= bs!26277 d!113211))

(assert (=> bs!26277 m!871973))

(assert (=> bs!26277 m!871973))

(assert (=> bs!26277 m!871975))

(declare-fun m!872281 () Bool)

(assert (=> bs!26277 m!872281))

(declare-fun m!872283 () Bool)

(assert (=> bs!26277 m!872283))

(assert (=> b!937662 d!113211))

(declare-fun d!113213 () Bool)

(assert (=> d!113213 (= (apply!849 (+!2864 lt!423111 (tuple2!13433 lt!423119 minValue!1173)) lt!423120) (apply!849 lt!423111 lt!423120))))

(declare-fun lt!423274 () Unit!31564)

(assert (=> d!113213 (= lt!423274 (choose!1563 lt!423111 lt!423119 minValue!1173 lt!423120))))

(declare-fun e!526663 () Bool)

(assert (=> d!113213 e!526663))

(declare-fun res!631128 () Bool)

(assert (=> d!113213 (=> (not res!631128) (not e!526663))))

(assert (=> d!113213 (= res!631128 (contains!5077 lt!423111 lt!423120))))

(assert (=> d!113213 (= (addApplyDifferent!433 lt!423111 lt!423119 minValue!1173 lt!423120) lt!423274)))

(declare-fun b!937841 () Bool)

(assert (=> b!937841 (= e!526663 (not (= lt!423120 lt!423119)))))

(assert (= (and d!113213 res!631128) b!937841))

(assert (=> d!113213 m!871965))

(declare-fun m!872285 () Bool)

(assert (=> d!113213 m!872285))

(assert (=> d!113213 m!871951))

(assert (=> d!113213 m!871953))

(declare-fun m!872287 () Bool)

(assert (=> d!113213 m!872287))

(assert (=> d!113213 m!871951))

(assert (=> b!937662 d!113213))

(declare-fun d!113215 () Bool)

(assert (=> d!113215 (= (apply!849 (+!2864 lt!423106 (tuple2!13433 lt!423105 zeroValue!1173)) lt!423114) (get!14325 (getValueByKey!486 (toList!6075 (+!2864 lt!423106 (tuple2!13433 lt!423105 zeroValue!1173))) lt!423114)))))

(declare-fun bs!26278 () Bool)

(assert (= bs!26278 d!113215))

(declare-fun m!872289 () Bool)

(assert (=> bs!26278 m!872289))

(assert (=> bs!26278 m!872289))

(declare-fun m!872291 () Bool)

(assert (=> bs!26278 m!872291))

(assert (=> b!937662 d!113215))

(declare-fun d!113217 () Bool)

(assert (=> d!113217 (= (apply!849 (+!2864 lt!423111 (tuple2!13433 lt!423119 minValue!1173)) lt!423120) (get!14325 (getValueByKey!486 (toList!6075 (+!2864 lt!423111 (tuple2!13433 lt!423119 minValue!1173))) lt!423120)))))

(declare-fun bs!26279 () Bool)

(assert (= bs!26279 d!113217))

(declare-fun m!872293 () Bool)

(assert (=> bs!26279 m!872293))

(assert (=> bs!26279 m!872293))

(declare-fun m!872295 () Bool)

(assert (=> bs!26279 m!872295))

(assert (=> b!937662 d!113217))

(declare-fun d!113219 () Bool)

(declare-fun e!526664 () Bool)

(assert (=> d!113219 e!526664))

(declare-fun res!631130 () Bool)

(assert (=> d!113219 (=> (not res!631130) (not e!526664))))

(declare-fun lt!423277 () ListLongMap!12119)

(assert (=> d!113219 (= res!631130 (contains!5077 lt!423277 (_1!6727 (tuple2!13433 lt!423119 minValue!1173))))))

(declare-fun lt!423278 () List!19176)

(assert (=> d!113219 (= lt!423277 (ListLongMap!12120 lt!423278))))

(declare-fun lt!423275 () Unit!31564)

(declare-fun lt!423276 () Unit!31564)

(assert (=> d!113219 (= lt!423275 lt!423276)))

(assert (=> d!113219 (= (getValueByKey!486 lt!423278 (_1!6727 (tuple2!13433 lt!423119 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423119 minValue!1173))))))

(assert (=> d!113219 (= lt!423276 (lemmaContainsTupThenGetReturnValue!260 lt!423278 (_1!6727 (tuple2!13433 lt!423119 minValue!1173)) (_2!6727 (tuple2!13433 lt!423119 minValue!1173))))))

(assert (=> d!113219 (= lt!423278 (insertStrictlySorted!317 (toList!6075 lt!423111) (_1!6727 (tuple2!13433 lt!423119 minValue!1173)) (_2!6727 (tuple2!13433 lt!423119 minValue!1173))))))

(assert (=> d!113219 (= (+!2864 lt!423111 (tuple2!13433 lt!423119 minValue!1173)) lt!423277)))

(declare-fun b!937842 () Bool)

(declare-fun res!631129 () Bool)

(assert (=> b!937842 (=> (not res!631129) (not e!526664))))

(assert (=> b!937842 (= res!631129 (= (getValueByKey!486 (toList!6075 lt!423277) (_1!6727 (tuple2!13433 lt!423119 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423119 minValue!1173)))))))

(declare-fun b!937843 () Bool)

(assert (=> b!937843 (= e!526664 (contains!5080 (toList!6075 lt!423277) (tuple2!13433 lt!423119 minValue!1173)))))

(assert (= (and d!113219 res!631130) b!937842))

(assert (= (and b!937842 res!631129) b!937843))

(declare-fun m!872297 () Bool)

(assert (=> d!113219 m!872297))

(declare-fun m!872299 () Bool)

(assert (=> d!113219 m!872299))

(declare-fun m!872301 () Bool)

(assert (=> d!113219 m!872301))

(declare-fun m!872303 () Bool)

(assert (=> d!113219 m!872303))

(declare-fun m!872305 () Bool)

(assert (=> b!937842 m!872305))

(declare-fun m!872307 () Bool)

(assert (=> b!937843 m!872307))

(assert (=> b!937662 d!113219))

(declare-fun d!113221 () Bool)

(assert (=> d!113221 (= (apply!849 (+!2864 lt!423121 (tuple2!13433 lt!423108 minValue!1173)) lt!423116) (apply!849 lt!423121 lt!423116))))

(declare-fun lt!423279 () Unit!31564)

(assert (=> d!113221 (= lt!423279 (choose!1563 lt!423121 lt!423108 minValue!1173 lt!423116))))

(declare-fun e!526665 () Bool)

(assert (=> d!113221 e!526665))

(declare-fun res!631131 () Bool)

(assert (=> d!113221 (=> (not res!631131) (not e!526665))))

(assert (=> d!113221 (= res!631131 (contains!5077 lt!423121 lt!423116))))

(assert (=> d!113221 (= (addApplyDifferent!433 lt!423121 lt!423108 minValue!1173 lt!423116) lt!423279)))

(declare-fun b!937844 () Bool)

(assert (=> b!937844 (= e!526665 (not (= lt!423116 lt!423108)))))

(assert (= (and d!113221 res!631131) b!937844))

(assert (=> d!113221 m!871977))

(declare-fun m!872309 () Bool)

(assert (=> d!113221 m!872309))

(assert (=> d!113221 m!871961))

(assert (=> d!113221 m!871963))

(declare-fun m!872311 () Bool)

(assert (=> d!113221 m!872311))

(assert (=> d!113221 m!871961))

(assert (=> b!937662 d!113221))

(declare-fun d!113223 () Bool)

(declare-fun e!526666 () Bool)

(assert (=> d!113223 e!526666))

(declare-fun res!631133 () Bool)

(assert (=> d!113223 (=> (not res!631133) (not e!526666))))

(declare-fun lt!423282 () ListLongMap!12119)

(assert (=> d!113223 (= res!631133 (contains!5077 lt!423282 (_1!6727 (tuple2!13433 lt!423108 minValue!1173))))))

(declare-fun lt!423283 () List!19176)

(assert (=> d!113223 (= lt!423282 (ListLongMap!12120 lt!423283))))

(declare-fun lt!423280 () Unit!31564)

(declare-fun lt!423281 () Unit!31564)

(assert (=> d!113223 (= lt!423280 lt!423281)))

(assert (=> d!113223 (= (getValueByKey!486 lt!423283 (_1!6727 (tuple2!13433 lt!423108 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423108 minValue!1173))))))

(assert (=> d!113223 (= lt!423281 (lemmaContainsTupThenGetReturnValue!260 lt!423283 (_1!6727 (tuple2!13433 lt!423108 minValue!1173)) (_2!6727 (tuple2!13433 lt!423108 minValue!1173))))))

(assert (=> d!113223 (= lt!423283 (insertStrictlySorted!317 (toList!6075 lt!423121) (_1!6727 (tuple2!13433 lt!423108 minValue!1173)) (_2!6727 (tuple2!13433 lt!423108 minValue!1173))))))

(assert (=> d!113223 (= (+!2864 lt!423121 (tuple2!13433 lt!423108 minValue!1173)) lt!423282)))

(declare-fun b!937845 () Bool)

(declare-fun res!631132 () Bool)

(assert (=> b!937845 (=> (not res!631132) (not e!526666))))

(assert (=> b!937845 (= res!631132 (= (getValueByKey!486 (toList!6075 lt!423282) (_1!6727 (tuple2!13433 lt!423108 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423108 minValue!1173)))))))

(declare-fun b!937846 () Bool)

(assert (=> b!937846 (= e!526666 (contains!5080 (toList!6075 lt!423282) (tuple2!13433 lt!423108 minValue!1173)))))

(assert (= (and d!113223 res!631133) b!937845))

(assert (= (and b!937845 res!631132) b!937846))

(declare-fun m!872313 () Bool)

(assert (=> d!113223 m!872313))

(declare-fun m!872315 () Bool)

(assert (=> d!113223 m!872315))

(declare-fun m!872317 () Bool)

(assert (=> d!113223 m!872317))

(declare-fun m!872319 () Bool)

(assert (=> d!113223 m!872319))

(declare-fun m!872321 () Bool)

(assert (=> b!937845 m!872321))

(declare-fun m!872323 () Bool)

(assert (=> b!937846 m!872323))

(assert (=> b!937662 d!113223))

(declare-fun d!113225 () Bool)

(assert (=> d!113225 (= (apply!849 (+!2864 lt!423121 (tuple2!13433 lt!423108 minValue!1173)) lt!423116) (get!14325 (getValueByKey!486 (toList!6075 (+!2864 lt!423121 (tuple2!13433 lt!423108 minValue!1173))) lt!423116)))))

(declare-fun bs!26280 () Bool)

(assert (= bs!26280 d!113225))

(declare-fun m!872325 () Bool)

(assert (=> bs!26280 m!872325))

(assert (=> bs!26280 m!872325))

(declare-fun m!872327 () Bool)

(assert (=> bs!26280 m!872327))

(assert (=> b!937662 d!113225))

(declare-fun b!937847 () Bool)

(declare-fun e!526668 () Bool)

(assert (=> b!937847 (= e!526668 (contains!5079 (ite c!97579 (Cons!19173 (select (arr!27152 _keys!1487) #b00000000000000000000000000000000) Nil!19174) Nil!19174) (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!937848 () Bool)

(declare-fun e!526670 () Bool)

(declare-fun e!526669 () Bool)

(assert (=> b!937848 (= e!526670 e!526669)))

(declare-fun res!631136 () Bool)

(assert (=> b!937848 (=> (not res!631136) (not e!526669))))

(assert (=> b!937848 (= res!631136 (not e!526668))))

(declare-fun res!631134 () Bool)

(assert (=> b!937848 (=> (not res!631134) (not e!526668))))

(assert (=> b!937848 (= res!631134 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!113227 () Bool)

(declare-fun res!631135 () Bool)

(assert (=> d!113227 (=> res!631135 e!526670)))

(assert (=> d!113227 (= res!631135 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(assert (=> d!113227 (= (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97579 (Cons!19173 (select (arr!27152 _keys!1487) #b00000000000000000000000000000000) Nil!19174) Nil!19174)) e!526670)))

(declare-fun b!937849 () Bool)

(declare-fun e!526667 () Bool)

(declare-fun call!40779 () Bool)

(assert (=> b!937849 (= e!526667 call!40779)))

(declare-fun b!937850 () Bool)

(assert (=> b!937850 (= e!526667 call!40779)))

(declare-fun b!937851 () Bool)

(assert (=> b!937851 (= e!526669 e!526667)))

(declare-fun c!97643 () Bool)

(assert (=> b!937851 (= c!97643 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!40776 () Bool)

(assert (=> bm!40776 (= call!40779 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!97643 (Cons!19173 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!97579 (Cons!19173 (select (arr!27152 _keys!1487) #b00000000000000000000000000000000) Nil!19174) Nil!19174)) (ite c!97579 (Cons!19173 (select (arr!27152 _keys!1487) #b00000000000000000000000000000000) Nil!19174) Nil!19174))))))

(assert (= (and d!113227 (not res!631135)) b!937848))

(assert (= (and b!937848 res!631134) b!937847))

(assert (= (and b!937848 res!631136) b!937851))

(assert (= (and b!937851 c!97643) b!937849))

(assert (= (and b!937851 (not c!97643)) b!937850))

(assert (= (or b!937849 b!937850) bm!40776))

(declare-fun m!872329 () Bool)

(assert (=> b!937847 m!872329))

(assert (=> b!937847 m!872329))

(declare-fun m!872331 () Bool)

(assert (=> b!937847 m!872331))

(assert (=> b!937848 m!872329))

(assert (=> b!937848 m!872329))

(declare-fun m!872333 () Bool)

(assert (=> b!937848 m!872333))

(assert (=> b!937851 m!872329))

(assert (=> b!937851 m!872329))

(assert (=> b!937851 m!872333))

(assert (=> bm!40776 m!872329))

(declare-fun m!872335 () Bool)

(assert (=> bm!40776 m!872335))

(assert (=> bm!40732 d!113227))

(declare-fun b!937852 () Bool)

(declare-fun e!526672 () Bool)

(declare-fun e!526671 () Bool)

(assert (=> b!937852 (= e!526672 e!526671)))

(declare-fun c!97644 () Bool)

(assert (=> b!937852 (= c!97644 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!937853 () Bool)

(declare-fun e!526673 () Bool)

(declare-fun call!40780 () Bool)

(assert (=> b!937853 (= e!526673 call!40780)))

(declare-fun b!937854 () Bool)

(assert (=> b!937854 (= e!526671 call!40780)))

(declare-fun b!937855 () Bool)

(assert (=> b!937855 (= e!526671 e!526673)))

(declare-fun lt!423284 () (_ BitVec 64))

(assert (=> b!937855 (= lt!423284 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!423286 () Unit!31564)

(assert (=> b!937855 (= lt!423286 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!423284 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!937855 (arrayContainsKey!0 _keys!1487 lt!423284 #b00000000000000000000000000000000)))

(declare-fun lt!423285 () Unit!31564)

(assert (=> b!937855 (= lt!423285 lt!423286)))

(declare-fun res!631137 () Bool)

(assert (=> b!937855 (= res!631137 (= (seekEntryOrOpen!0 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1487 mask!1881) (Found!8981 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!937855 (=> (not res!631137) (not e!526673))))

(declare-fun d!113229 () Bool)

(declare-fun res!631138 () Bool)

(assert (=> d!113229 (=> res!631138 e!526672)))

(assert (=> d!113229 (= res!631138 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(assert (=> d!113229 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881) e!526672)))

(declare-fun bm!40777 () Bool)

(assert (=> bm!40777 (= call!40780 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(assert (= (and d!113229 (not res!631138)) b!937852))

(assert (= (and b!937852 c!97644) b!937855))

(assert (= (and b!937852 (not c!97644)) b!937854))

(assert (= (and b!937855 res!631137) b!937853))

(assert (= (or b!937853 b!937854) bm!40777))

(assert (=> b!937852 m!872329))

(assert (=> b!937852 m!872329))

(assert (=> b!937852 m!872333))

(assert (=> b!937855 m!872329))

(declare-fun m!872337 () Bool)

(assert (=> b!937855 m!872337))

(declare-fun m!872339 () Bool)

(assert (=> b!937855 m!872339))

(assert (=> b!937855 m!872329))

(declare-fun m!872341 () Bool)

(assert (=> b!937855 m!872341))

(declare-fun m!872343 () Bool)

(assert (=> bm!40777 m!872343))

(assert (=> bm!40735 d!113229))

(declare-fun d!113231 () Bool)

(declare-fun e!526674 () Bool)

(assert (=> d!113231 e!526674))

(declare-fun res!631139 () Bool)

(assert (=> d!113231 (=> res!631139 e!526674)))

(declare-fun lt!423290 () Bool)

(assert (=> d!113231 (= res!631139 (not lt!423290))))

(declare-fun lt!423288 () Bool)

(assert (=> d!113231 (= lt!423290 lt!423288)))

(declare-fun lt!423287 () Unit!31564)

(declare-fun e!526675 () Unit!31564)

(assert (=> d!113231 (= lt!423287 e!526675)))

(declare-fun c!97645 () Bool)

(assert (=> d!113231 (= c!97645 lt!423288)))

(assert (=> d!113231 (= lt!423288 (containsKey!450 (toList!6075 lt!423207) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113231 (= (contains!5077 lt!423207 #b1000000000000000000000000000000000000000000000000000000000000000) lt!423290)))

(declare-fun b!937856 () Bool)

(declare-fun lt!423289 () Unit!31564)

(assert (=> b!937856 (= e!526675 lt!423289)))

(assert (=> b!937856 (= lt!423289 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 lt!423207) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!937856 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423207) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!937857 () Bool)

(declare-fun Unit!31582 () Unit!31564)

(assert (=> b!937857 (= e!526675 Unit!31582)))

(declare-fun b!937858 () Bool)

(assert (=> b!937858 (= e!526674 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423207) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113231 c!97645) b!937856))

(assert (= (and d!113231 (not c!97645)) b!937857))

(assert (= (and d!113231 (not res!631139)) b!937858))

(declare-fun m!872345 () Bool)

(assert (=> d!113231 m!872345))

(declare-fun m!872347 () Bool)

(assert (=> b!937856 m!872347))

(declare-fun m!872349 () Bool)

(assert (=> b!937856 m!872349))

(assert (=> b!937856 m!872349))

(declare-fun m!872351 () Bool)

(assert (=> b!937856 m!872351))

(assert (=> b!937858 m!872349))

(assert (=> b!937858 m!872349))

(assert (=> b!937858 m!872351))

(assert (=> bm!40765 d!113231))

(declare-fun d!113233 () Bool)

(assert (=> d!113233 (= (get!14325 (getValueByKey!486 (toList!6075 lt!422967) k0!1099)) (v!12706 (getValueByKey!486 (toList!6075 lt!422967) k0!1099)))))

(assert (=> d!113157 d!113233))

(declare-fun b!937868 () Bool)

(declare-fun e!526680 () Option!492)

(declare-fun e!526681 () Option!492)

(assert (=> b!937868 (= e!526680 e!526681)))

(declare-fun c!97651 () Bool)

(assert (=> b!937868 (= c!97651 (and ((_ is Cons!19172) (toList!6075 lt!422967)) (not (= (_1!6727 (h!20318 (toList!6075 lt!422967))) k0!1099))))))

(declare-fun b!937869 () Bool)

(assert (=> b!937869 (= e!526681 (getValueByKey!486 (t!27460 (toList!6075 lt!422967)) k0!1099))))

(declare-fun b!937870 () Bool)

(assert (=> b!937870 (= e!526681 None!490)))

(declare-fun d!113235 () Bool)

(declare-fun c!97650 () Bool)

(assert (=> d!113235 (= c!97650 (and ((_ is Cons!19172) (toList!6075 lt!422967)) (= (_1!6727 (h!20318 (toList!6075 lt!422967))) k0!1099)))))

(assert (=> d!113235 (= (getValueByKey!486 (toList!6075 lt!422967) k0!1099) e!526680)))

(declare-fun b!937867 () Bool)

(assert (=> b!937867 (= e!526680 (Some!491 (_2!6727 (h!20318 (toList!6075 lt!422967)))))))

(assert (= (and d!113235 c!97650) b!937867))

(assert (= (and d!113235 (not c!97650)) b!937868))

(assert (= (and b!937868 c!97651) b!937869))

(assert (= (and b!937868 (not c!97651)) b!937870))

(declare-fun m!872353 () Bool)

(assert (=> b!937869 m!872353))

(assert (=> d!113157 d!113235))

(declare-fun d!113237 () Bool)

(assert (=> d!113237 (= (apply!849 lt!423113 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14325 (getValueByKey!486 (toList!6075 lt!423113) (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun bs!26281 () Bool)

(assert (= bs!26281 d!113237))

(assert (=> bs!26281 m!871787))

(declare-fun m!872355 () Bool)

(assert (=> bs!26281 m!872355))

(assert (=> bs!26281 m!872355))

(declare-fun m!872357 () Bool)

(assert (=> bs!26281 m!872357))

(assert (=> b!937663 d!113237))

(assert (=> b!937663 d!113171))

(declare-fun d!113239 () Bool)

(assert (=> d!113239 (= (get!14327 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!937734 d!113239))

(declare-fun d!113241 () Bool)

(declare-fun e!526682 () Bool)

(assert (=> d!113241 e!526682))

(declare-fun res!631140 () Bool)

(assert (=> d!113241 (=> res!631140 e!526682)))

(declare-fun lt!423294 () Bool)

(assert (=> d!113241 (= res!631140 (not lt!423294))))

(declare-fun lt!423292 () Bool)

(assert (=> d!113241 (= lt!423294 lt!423292)))

(declare-fun lt!423291 () Unit!31564)

(declare-fun e!526683 () Unit!31564)

(assert (=> d!113241 (= lt!423291 e!526683)))

(declare-fun c!97652 () Bool)

(assert (=> d!113241 (= c!97652 lt!423292)))

(assert (=> d!113241 (= lt!423292 (containsKey!450 (toList!6075 lt!423207) (select (arr!27152 _keys!1487) from!1844)))))

(assert (=> d!113241 (= (contains!5077 lt!423207 (select (arr!27152 _keys!1487) from!1844)) lt!423294)))

(declare-fun b!937871 () Bool)

(declare-fun lt!423293 () Unit!31564)

(assert (=> b!937871 (= e!526683 lt!423293)))

(assert (=> b!937871 (= lt!423293 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 lt!423207) (select (arr!27152 _keys!1487) from!1844)))))

(assert (=> b!937871 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423207) (select (arr!27152 _keys!1487) from!1844)))))

(declare-fun b!937872 () Bool)

(declare-fun Unit!31583 () Unit!31564)

(assert (=> b!937872 (= e!526683 Unit!31583)))

(declare-fun b!937873 () Bool)

(assert (=> b!937873 (= e!526682 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423207) (select (arr!27152 _keys!1487) from!1844))))))

(assert (= (and d!113241 c!97652) b!937871))

(assert (= (and d!113241 (not c!97652)) b!937872))

(assert (= (and d!113241 (not res!631140)) b!937873))

(assert (=> d!113241 m!871925))

(declare-fun m!872359 () Bool)

(assert (=> d!113241 m!872359))

(assert (=> b!937871 m!871925))

(declare-fun m!872361 () Bool)

(assert (=> b!937871 m!872361))

(assert (=> b!937871 m!871925))

(declare-fun m!872363 () Bool)

(assert (=> b!937871 m!872363))

(assert (=> b!937871 m!872363))

(declare-fun m!872365 () Bool)

(assert (=> b!937871 m!872365))

(assert (=> b!937873 m!871925))

(assert (=> b!937873 m!872363))

(assert (=> b!937873 m!872363))

(assert (=> b!937873 m!872365))

(assert (=> b!937747 d!113241))

(declare-fun d!113243 () Bool)

(declare-fun e!526684 () Bool)

(assert (=> d!113243 e!526684))

(declare-fun res!631142 () Bool)

(assert (=> d!113243 (=> (not res!631142) (not e!526684))))

(declare-fun lt!423297 () ListLongMap!12119)

(assert (=> d!113243 (= res!631142 (contains!5077 lt!423297 (_1!6727 (ite (or c!97609 c!97604) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!423298 () List!19176)

(assert (=> d!113243 (= lt!423297 (ListLongMap!12120 lt!423298))))

(declare-fun lt!423295 () Unit!31564)

(declare-fun lt!423296 () Unit!31564)

(assert (=> d!113243 (= lt!423295 lt!423296)))

(assert (=> d!113243 (= (getValueByKey!486 lt!423298 (_1!6727 (ite (or c!97609 c!97604) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!491 (_2!6727 (ite (or c!97609 c!97604) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113243 (= lt!423296 (lemmaContainsTupThenGetReturnValue!260 lt!423298 (_1!6727 (ite (or c!97609 c!97604) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6727 (ite (or c!97609 c!97604) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113243 (= lt!423298 (insertStrictlySorted!317 (toList!6075 (ite c!97609 call!40762 (ite c!97604 call!40766 call!40763))) (_1!6727 (ite (or c!97609 c!97604) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6727 (ite (or c!97609 c!97604) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113243 (= (+!2864 (ite c!97609 call!40762 (ite c!97604 call!40766 call!40763)) (ite (or c!97609 c!97604) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!423297)))

(declare-fun b!937874 () Bool)

(declare-fun res!631141 () Bool)

(assert (=> b!937874 (=> (not res!631141) (not e!526684))))

(assert (=> b!937874 (= res!631141 (= (getValueByKey!486 (toList!6075 lt!423297) (_1!6727 (ite (or c!97609 c!97604) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!491 (_2!6727 (ite (or c!97609 c!97604) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!937875 () Bool)

(assert (=> b!937875 (= e!526684 (contains!5080 (toList!6075 lt!423297) (ite (or c!97609 c!97604) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113243 res!631142) b!937874))

(assert (= (and b!937874 res!631141) b!937875))

(declare-fun m!872367 () Bool)

(assert (=> d!113243 m!872367))

(declare-fun m!872369 () Bool)

(assert (=> d!113243 m!872369))

(declare-fun m!872371 () Bool)

(assert (=> d!113243 m!872371))

(declare-fun m!872373 () Bool)

(assert (=> d!113243 m!872373))

(declare-fun m!872375 () Bool)

(assert (=> b!937874 m!872375))

(declare-fun m!872377 () Bool)

(assert (=> b!937875 m!872377))

(assert (=> bm!40762 d!113243))

(declare-fun d!113245 () Bool)

(declare-fun res!631143 () Bool)

(declare-fun e!526685 () Bool)

(assert (=> d!113245 (=> res!631143 e!526685)))

(assert (=> d!113245 (= res!631143 (and ((_ is Cons!19172) (toList!6075 lt!422967)) (= (_1!6727 (h!20318 (toList!6075 lt!422967))) k0!1099)))))

(assert (=> d!113245 (= (containsKey!450 (toList!6075 lt!422967) k0!1099) e!526685)))

(declare-fun b!937876 () Bool)

(declare-fun e!526686 () Bool)

(assert (=> b!937876 (= e!526685 e!526686)))

(declare-fun res!631144 () Bool)

(assert (=> b!937876 (=> (not res!631144) (not e!526686))))

(assert (=> b!937876 (= res!631144 (and (or (not ((_ is Cons!19172) (toList!6075 lt!422967))) (bvsle (_1!6727 (h!20318 (toList!6075 lt!422967))) k0!1099)) ((_ is Cons!19172) (toList!6075 lt!422967)) (bvslt (_1!6727 (h!20318 (toList!6075 lt!422967))) k0!1099)))))

(declare-fun b!937877 () Bool)

(assert (=> b!937877 (= e!526686 (containsKey!450 (t!27460 (toList!6075 lt!422967)) k0!1099))))

(assert (= (and d!113245 (not res!631143)) b!937876))

(assert (= (and b!937876 res!631144) b!937877))

(declare-fun m!872379 () Bool)

(assert (=> b!937877 m!872379))

(assert (=> d!113149 d!113245))

(declare-fun d!113247 () Bool)

(assert (=> d!113247 (= (apply!849 lt!423113 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14325 (getValueByKey!486 (toList!6075 lt!423113) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26282 () Bool)

(assert (= bs!26282 d!113247))

(declare-fun m!872381 () Bool)

(assert (=> bs!26282 m!872381))

(assert (=> bs!26282 m!872381))

(declare-fun m!872383 () Bool)

(assert (=> bs!26282 m!872383))

(assert (=> b!937665 d!113247))

(assert (=> d!113147 d!113141))

(declare-fun d!113249 () Bool)

(declare-fun e!526687 () Bool)

(assert (=> d!113249 e!526687))

(declare-fun res!631145 () Bool)

(assert (=> d!113249 (=> res!631145 e!526687)))

(declare-fun lt!423302 () Bool)

(assert (=> d!113249 (= res!631145 (not lt!423302))))

(declare-fun lt!423300 () Bool)

(assert (=> d!113249 (= lt!423302 lt!423300)))

(declare-fun lt!423299 () Unit!31564)

(declare-fun e!526688 () Unit!31564)

(assert (=> d!113249 (= lt!423299 e!526688)))

(declare-fun c!97653 () Bool)

(assert (=> d!113249 (= c!97653 lt!423300)))

(assert (=> d!113249 (= lt!423300 (containsKey!450 (toList!6075 lt!423207) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113249 (= (contains!5077 lt!423207 #b0000000000000000000000000000000000000000000000000000000000000000) lt!423302)))

(declare-fun b!937878 () Bool)

(declare-fun lt!423301 () Unit!31564)

(assert (=> b!937878 (= e!526688 lt!423301)))

(assert (=> b!937878 (= lt!423301 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 lt!423207) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!937878 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423207) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!937879 () Bool)

(declare-fun Unit!31584 () Unit!31564)

(assert (=> b!937879 (= e!526688 Unit!31584)))

(declare-fun b!937880 () Bool)

(assert (=> b!937880 (= e!526687 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423207) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113249 c!97653) b!937878))

(assert (= (and d!113249 (not c!97653)) b!937879))

(assert (= (and d!113249 (not res!631145)) b!937880))

(declare-fun m!872385 () Bool)

(assert (=> d!113249 m!872385))

(declare-fun m!872387 () Bool)

(assert (=> b!937878 m!872387))

(declare-fun m!872389 () Bool)

(assert (=> b!937878 m!872389))

(assert (=> b!937878 m!872389))

(declare-fun m!872391 () Bool)

(assert (=> b!937878 m!872391))

(assert (=> b!937880 m!872389))

(assert (=> b!937880 m!872389))

(assert (=> b!937880 m!872391))

(assert (=> bm!40767 d!113249))

(declare-fun d!113251 () Bool)

(assert (=> d!113251 (= (apply!849 lt!423147 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14325 (getValueByKey!486 (toList!6075 lt!423147) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26283 () Bool)

(assert (= bs!26283 d!113251))

(assert (=> bs!26283 m!872187))

(assert (=> bs!26283 m!872187))

(declare-fun m!872393 () Bool)

(assert (=> bs!26283 m!872393))

(assert (=> b!937699 d!113251))

(declare-fun d!113253 () Bool)

(declare-fun e!526689 () Bool)

(assert (=> d!113253 e!526689))

(declare-fun res!631147 () Bool)

(assert (=> d!113253 (=> (not res!631147) (not e!526689))))

(declare-fun lt!423305 () ListLongMap!12119)

(assert (=> d!113253 (= res!631147 (contains!5077 lt!423305 (_1!6727 (tuple2!13433 lt!423211 zeroValue!1173))))))

(declare-fun lt!423306 () List!19176)

(assert (=> d!113253 (= lt!423305 (ListLongMap!12120 lt!423306))))

(declare-fun lt!423303 () Unit!31564)

(declare-fun lt!423304 () Unit!31564)

(assert (=> d!113253 (= lt!423303 lt!423304)))

(assert (=> d!113253 (= (getValueByKey!486 lt!423306 (_1!6727 (tuple2!13433 lt!423211 zeroValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423211 zeroValue!1173))))))

(assert (=> d!113253 (= lt!423304 (lemmaContainsTupThenGetReturnValue!260 lt!423306 (_1!6727 (tuple2!13433 lt!423211 zeroValue!1173)) (_2!6727 (tuple2!13433 lt!423211 zeroValue!1173))))))

(assert (=> d!113253 (= lt!423306 (insertStrictlySorted!317 (toList!6075 lt!423204) (_1!6727 (tuple2!13433 lt!423211 zeroValue!1173)) (_2!6727 (tuple2!13433 lt!423211 zeroValue!1173))))))

(assert (=> d!113253 (= (+!2864 lt!423204 (tuple2!13433 lt!423211 zeroValue!1173)) lt!423305)))

(declare-fun b!937881 () Bool)

(declare-fun res!631146 () Bool)

(assert (=> b!937881 (=> (not res!631146) (not e!526689))))

(assert (=> b!937881 (= res!631146 (= (getValueByKey!486 (toList!6075 lt!423305) (_1!6727 (tuple2!13433 lt!423211 zeroValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423211 zeroValue!1173)))))))

(declare-fun b!937882 () Bool)

(assert (=> b!937882 (= e!526689 (contains!5080 (toList!6075 lt!423305) (tuple2!13433 lt!423211 zeroValue!1173)))))

(assert (= (and d!113253 res!631147) b!937881))

(assert (= (and b!937881 res!631146) b!937882))

(declare-fun m!872395 () Bool)

(assert (=> d!113253 m!872395))

(declare-fun m!872397 () Bool)

(assert (=> d!113253 m!872397))

(declare-fun m!872399 () Bool)

(assert (=> d!113253 m!872399))

(declare-fun m!872401 () Bool)

(assert (=> d!113253 m!872401))

(declare-fun m!872403 () Bool)

(assert (=> b!937881 m!872403))

(declare-fun m!872405 () Bool)

(assert (=> b!937882 m!872405))

(assert (=> b!937749 d!113253))

(declare-fun d!113255 () Bool)

(assert (=> d!113255 (= (apply!849 (+!2864 lt!423205 (tuple2!13433 lt!423213 minValue!1173)) lt!423214) (get!14325 (getValueByKey!486 (toList!6075 (+!2864 lt!423205 (tuple2!13433 lt!423213 minValue!1173))) lt!423214)))))

(declare-fun bs!26284 () Bool)

(assert (= bs!26284 d!113255))

(declare-fun m!872407 () Bool)

(assert (=> bs!26284 m!872407))

(assert (=> bs!26284 m!872407))

(declare-fun m!872409 () Bool)

(assert (=> bs!26284 m!872409))

(assert (=> b!937749 d!113255))

(declare-fun d!113257 () Bool)

(assert (=> d!113257 (= (apply!849 lt!423200 lt!423208) (get!14325 (getValueByKey!486 (toList!6075 lt!423200) lt!423208)))))

(declare-fun bs!26285 () Bool)

(assert (= bs!26285 d!113257))

(declare-fun m!872411 () Bool)

(assert (=> bs!26285 m!872411))

(assert (=> bs!26285 m!872411))

(declare-fun m!872413 () Bool)

(assert (=> bs!26285 m!872413))

(assert (=> b!937749 d!113257))

(declare-fun d!113259 () Bool)

(assert (=> d!113259 (= (apply!849 (+!2864 lt!423200 (tuple2!13433 lt!423199 zeroValue!1173)) lt!423208) (get!14325 (getValueByKey!486 (toList!6075 (+!2864 lt!423200 (tuple2!13433 lt!423199 zeroValue!1173))) lt!423208)))))

(declare-fun bs!26286 () Bool)

(assert (= bs!26286 d!113259))

(declare-fun m!872415 () Bool)

(assert (=> bs!26286 m!872415))

(assert (=> bs!26286 m!872415))

(declare-fun m!872417 () Bool)

(assert (=> bs!26286 m!872417))

(assert (=> b!937749 d!113259))

(declare-fun d!113261 () Bool)

(declare-fun e!526690 () Bool)

(assert (=> d!113261 e!526690))

(declare-fun res!631149 () Bool)

(assert (=> d!113261 (=> (not res!631149) (not e!526690))))

(declare-fun lt!423309 () ListLongMap!12119)

(assert (=> d!113261 (= res!631149 (contains!5077 lt!423309 (_1!6727 (tuple2!13433 lt!423199 zeroValue!1173))))))

(declare-fun lt!423310 () List!19176)

(assert (=> d!113261 (= lt!423309 (ListLongMap!12120 lt!423310))))

(declare-fun lt!423307 () Unit!31564)

(declare-fun lt!423308 () Unit!31564)

(assert (=> d!113261 (= lt!423307 lt!423308)))

(assert (=> d!113261 (= (getValueByKey!486 lt!423310 (_1!6727 (tuple2!13433 lt!423199 zeroValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423199 zeroValue!1173))))))

(assert (=> d!113261 (= lt!423308 (lemmaContainsTupThenGetReturnValue!260 lt!423310 (_1!6727 (tuple2!13433 lt!423199 zeroValue!1173)) (_2!6727 (tuple2!13433 lt!423199 zeroValue!1173))))))

(assert (=> d!113261 (= lt!423310 (insertStrictlySorted!317 (toList!6075 lt!423200) (_1!6727 (tuple2!13433 lt!423199 zeroValue!1173)) (_2!6727 (tuple2!13433 lt!423199 zeroValue!1173))))))

(assert (=> d!113261 (= (+!2864 lt!423200 (tuple2!13433 lt!423199 zeroValue!1173)) lt!423309)))

(declare-fun b!937883 () Bool)

(declare-fun res!631148 () Bool)

(assert (=> b!937883 (=> (not res!631148) (not e!526690))))

(assert (=> b!937883 (= res!631148 (= (getValueByKey!486 (toList!6075 lt!423309) (_1!6727 (tuple2!13433 lt!423199 zeroValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423199 zeroValue!1173)))))))

(declare-fun b!937884 () Bool)

(assert (=> b!937884 (= e!526690 (contains!5080 (toList!6075 lt!423309) (tuple2!13433 lt!423199 zeroValue!1173)))))

(assert (= (and d!113261 res!631149) b!937883))

(assert (= (and b!937883 res!631148) b!937884))

(declare-fun m!872419 () Bool)

(assert (=> d!113261 m!872419))

(declare-fun m!872421 () Bool)

(assert (=> d!113261 m!872421))

(declare-fun m!872423 () Bool)

(assert (=> d!113261 m!872423))

(declare-fun m!872425 () Bool)

(assert (=> d!113261 m!872425))

(declare-fun m!872427 () Bool)

(assert (=> b!937883 m!872427))

(declare-fun m!872429 () Bool)

(assert (=> b!937884 m!872429))

(assert (=> b!937749 d!113261))

(declare-fun d!113263 () Bool)

(assert (=> d!113263 (= (apply!849 lt!423205 lt!423214) (get!14325 (getValueByKey!486 (toList!6075 lt!423205) lt!423214)))))

(declare-fun bs!26287 () Bool)

(assert (= bs!26287 d!113263))

(declare-fun m!872431 () Bool)

(assert (=> bs!26287 m!872431))

(assert (=> bs!26287 m!872431))

(declare-fun m!872433 () Bool)

(assert (=> bs!26287 m!872433))

(assert (=> b!937749 d!113263))

(declare-fun d!113265 () Bool)

(assert (=> d!113265 (= (apply!849 (+!2864 lt!423205 (tuple2!13433 lt!423213 minValue!1173)) lt!423214) (apply!849 lt!423205 lt!423214))))

(declare-fun lt!423311 () Unit!31564)

(assert (=> d!113265 (= lt!423311 (choose!1563 lt!423205 lt!423213 minValue!1173 lt!423214))))

(declare-fun e!526691 () Bool)

(assert (=> d!113265 e!526691))

(declare-fun res!631150 () Bool)

(assert (=> d!113265 (=> (not res!631150) (not e!526691))))

(assert (=> d!113265 (= res!631150 (contains!5077 lt!423205 lt!423214))))

(assert (=> d!113265 (= (addApplyDifferent!433 lt!423205 lt!423213 minValue!1173 lt!423214) lt!423311)))

(declare-fun b!937885 () Bool)

(assert (=> b!937885 (= e!526691 (not (= lt!423214 lt!423213)))))

(assert (= (and d!113265 res!631150) b!937885))

(assert (=> d!113265 m!872141))

(declare-fun m!872435 () Bool)

(assert (=> d!113265 m!872435))

(assert (=> d!113265 m!872127))

(assert (=> d!113265 m!872129))

(declare-fun m!872437 () Bool)

(assert (=> d!113265 m!872437))

(assert (=> d!113265 m!872127))

(assert (=> b!937749 d!113265))

(declare-fun d!113267 () Bool)

(assert (=> d!113267 (= (apply!849 (+!2864 lt!423215 (tuple2!13433 lt!423202 minValue!1173)) lt!423210) (apply!849 lt!423215 lt!423210))))

(declare-fun lt!423312 () Unit!31564)

(assert (=> d!113267 (= lt!423312 (choose!1563 lt!423215 lt!423202 minValue!1173 lt!423210))))

(declare-fun e!526692 () Bool)

(assert (=> d!113267 e!526692))

(declare-fun res!631151 () Bool)

(assert (=> d!113267 (=> (not res!631151) (not e!526692))))

(assert (=> d!113267 (= res!631151 (contains!5077 lt!423215 lt!423210))))

(assert (=> d!113267 (= (addApplyDifferent!433 lt!423215 lt!423202 minValue!1173 lt!423210) lt!423312)))

(declare-fun b!937886 () Bool)

(assert (=> b!937886 (= e!526692 (not (= lt!423210 lt!423202)))))

(assert (= (and d!113267 res!631151) b!937886))

(assert (=> d!113267 m!872153))

(declare-fun m!872439 () Bool)

(assert (=> d!113267 m!872439))

(assert (=> d!113267 m!872137))

(assert (=> d!113267 m!872139))

(declare-fun m!872441 () Bool)

(assert (=> d!113267 m!872441))

(assert (=> d!113267 m!872137))

(assert (=> b!937749 d!113267))

(declare-fun d!113269 () Bool)

(assert (=> d!113269 (= (apply!849 (+!2864 lt!423215 (tuple2!13433 lt!423202 minValue!1173)) lt!423210) (get!14325 (getValueByKey!486 (toList!6075 (+!2864 lt!423215 (tuple2!13433 lt!423202 minValue!1173))) lt!423210)))))

(declare-fun bs!26288 () Bool)

(assert (= bs!26288 d!113269))

(declare-fun m!872443 () Bool)

(assert (=> bs!26288 m!872443))

(assert (=> bs!26288 m!872443))

(declare-fun m!872445 () Bool)

(assert (=> bs!26288 m!872445))

(assert (=> b!937749 d!113269))

(declare-fun d!113271 () Bool)

(declare-fun e!526693 () Bool)

(assert (=> d!113271 e!526693))

(declare-fun res!631152 () Bool)

(assert (=> d!113271 (=> res!631152 e!526693)))

(declare-fun lt!423316 () Bool)

(assert (=> d!113271 (= res!631152 (not lt!423316))))

(declare-fun lt!423314 () Bool)

(assert (=> d!113271 (= lt!423316 lt!423314)))

(declare-fun lt!423313 () Unit!31564)

(declare-fun e!526694 () Unit!31564)

(assert (=> d!113271 (= lt!423313 e!526694)))

(declare-fun c!97654 () Bool)

(assert (=> d!113271 (= c!97654 lt!423314)))

(assert (=> d!113271 (= lt!423314 (containsKey!450 (toList!6075 (+!2864 lt!423204 (tuple2!13433 lt!423211 zeroValue!1173))) lt!423212))))

(assert (=> d!113271 (= (contains!5077 (+!2864 lt!423204 (tuple2!13433 lt!423211 zeroValue!1173)) lt!423212) lt!423316)))

(declare-fun b!937887 () Bool)

(declare-fun lt!423315 () Unit!31564)

(assert (=> b!937887 (= e!526694 lt!423315)))

(assert (=> b!937887 (= lt!423315 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 (+!2864 lt!423204 (tuple2!13433 lt!423211 zeroValue!1173))) lt!423212))))

(assert (=> b!937887 (isDefined!358 (getValueByKey!486 (toList!6075 (+!2864 lt!423204 (tuple2!13433 lt!423211 zeroValue!1173))) lt!423212))))

(declare-fun b!937888 () Bool)

(declare-fun Unit!31585 () Unit!31564)

(assert (=> b!937888 (= e!526694 Unit!31585)))

(declare-fun b!937889 () Bool)

(assert (=> b!937889 (= e!526693 (isDefined!358 (getValueByKey!486 (toList!6075 (+!2864 lt!423204 (tuple2!13433 lt!423211 zeroValue!1173))) lt!423212)))))

(assert (= (and d!113271 c!97654) b!937887))

(assert (= (and d!113271 (not c!97654)) b!937888))

(assert (= (and d!113271 (not res!631152)) b!937889))

(declare-fun m!872447 () Bool)

(assert (=> d!113271 m!872447))

(declare-fun m!872449 () Bool)

(assert (=> b!937887 m!872449))

(declare-fun m!872451 () Bool)

(assert (=> b!937887 m!872451))

(assert (=> b!937887 m!872451))

(declare-fun m!872453 () Bool)

(assert (=> b!937887 m!872453))

(assert (=> b!937889 m!872451))

(assert (=> b!937889 m!872451))

(assert (=> b!937889 m!872453))

(assert (=> b!937749 d!113271))

(declare-fun d!113273 () Bool)

(declare-fun e!526695 () Bool)

(assert (=> d!113273 e!526695))

(declare-fun res!631154 () Bool)

(assert (=> d!113273 (=> (not res!631154) (not e!526695))))

(declare-fun lt!423319 () ListLongMap!12119)

(assert (=> d!113273 (= res!631154 (contains!5077 lt!423319 (_1!6727 (tuple2!13433 lt!423213 minValue!1173))))))

(declare-fun lt!423320 () List!19176)

(assert (=> d!113273 (= lt!423319 (ListLongMap!12120 lt!423320))))

(declare-fun lt!423317 () Unit!31564)

(declare-fun lt!423318 () Unit!31564)

(assert (=> d!113273 (= lt!423317 lt!423318)))

(assert (=> d!113273 (= (getValueByKey!486 lt!423320 (_1!6727 (tuple2!13433 lt!423213 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423213 minValue!1173))))))

(assert (=> d!113273 (= lt!423318 (lemmaContainsTupThenGetReturnValue!260 lt!423320 (_1!6727 (tuple2!13433 lt!423213 minValue!1173)) (_2!6727 (tuple2!13433 lt!423213 minValue!1173))))))

(assert (=> d!113273 (= lt!423320 (insertStrictlySorted!317 (toList!6075 lt!423205) (_1!6727 (tuple2!13433 lt!423213 minValue!1173)) (_2!6727 (tuple2!13433 lt!423213 minValue!1173))))))

(assert (=> d!113273 (= (+!2864 lt!423205 (tuple2!13433 lt!423213 minValue!1173)) lt!423319)))

(declare-fun b!937890 () Bool)

(declare-fun res!631153 () Bool)

(assert (=> b!937890 (=> (not res!631153) (not e!526695))))

(assert (=> b!937890 (= res!631153 (= (getValueByKey!486 (toList!6075 lt!423319) (_1!6727 (tuple2!13433 lt!423213 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423213 minValue!1173)))))))

(declare-fun b!937891 () Bool)

(assert (=> b!937891 (= e!526695 (contains!5080 (toList!6075 lt!423319) (tuple2!13433 lt!423213 minValue!1173)))))

(assert (= (and d!113273 res!631154) b!937890))

(assert (= (and b!937890 res!631153) b!937891))

(declare-fun m!872455 () Bool)

(assert (=> d!113273 m!872455))

(declare-fun m!872457 () Bool)

(assert (=> d!113273 m!872457))

(declare-fun m!872459 () Bool)

(assert (=> d!113273 m!872459))

(declare-fun m!872461 () Bool)

(assert (=> d!113273 m!872461))

(declare-fun m!872463 () Bool)

(assert (=> b!937890 m!872463))

(declare-fun m!872465 () Bool)

(assert (=> b!937891 m!872465))

(assert (=> b!937749 d!113273))

(assert (=> b!937749 d!113187))

(declare-fun d!113275 () Bool)

(declare-fun e!526696 () Bool)

(assert (=> d!113275 e!526696))

(declare-fun res!631156 () Bool)

(assert (=> d!113275 (=> (not res!631156) (not e!526696))))

(declare-fun lt!423323 () ListLongMap!12119)

(assert (=> d!113275 (= res!631156 (contains!5077 lt!423323 (_1!6727 (tuple2!13433 lt!423202 minValue!1173))))))

(declare-fun lt!423324 () List!19176)

(assert (=> d!113275 (= lt!423323 (ListLongMap!12120 lt!423324))))

(declare-fun lt!423321 () Unit!31564)

(declare-fun lt!423322 () Unit!31564)

(assert (=> d!113275 (= lt!423321 lt!423322)))

(assert (=> d!113275 (= (getValueByKey!486 lt!423324 (_1!6727 (tuple2!13433 lt!423202 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423202 minValue!1173))))))

(assert (=> d!113275 (= lt!423322 (lemmaContainsTupThenGetReturnValue!260 lt!423324 (_1!6727 (tuple2!13433 lt!423202 minValue!1173)) (_2!6727 (tuple2!13433 lt!423202 minValue!1173))))))

(assert (=> d!113275 (= lt!423324 (insertStrictlySorted!317 (toList!6075 lt!423215) (_1!6727 (tuple2!13433 lt!423202 minValue!1173)) (_2!6727 (tuple2!13433 lt!423202 minValue!1173))))))

(assert (=> d!113275 (= (+!2864 lt!423215 (tuple2!13433 lt!423202 minValue!1173)) lt!423323)))

(declare-fun b!937892 () Bool)

(declare-fun res!631155 () Bool)

(assert (=> b!937892 (=> (not res!631155) (not e!526696))))

(assert (=> b!937892 (= res!631155 (= (getValueByKey!486 (toList!6075 lt!423323) (_1!6727 (tuple2!13433 lt!423202 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423202 minValue!1173)))))))

(declare-fun b!937893 () Bool)

(assert (=> b!937893 (= e!526696 (contains!5080 (toList!6075 lt!423323) (tuple2!13433 lt!423202 minValue!1173)))))

(assert (= (and d!113275 res!631156) b!937892))

(assert (= (and b!937892 res!631155) b!937893))

(declare-fun m!872467 () Bool)

(assert (=> d!113275 m!872467))

(declare-fun m!872469 () Bool)

(assert (=> d!113275 m!872469))

(declare-fun m!872471 () Bool)

(assert (=> d!113275 m!872471))

(declare-fun m!872473 () Bool)

(assert (=> d!113275 m!872473))

(declare-fun m!872475 () Bool)

(assert (=> b!937892 m!872475))

(declare-fun m!872477 () Bool)

(assert (=> b!937893 m!872477))

(assert (=> b!937749 d!113275))

(declare-fun d!113277 () Bool)

(assert (=> d!113277 (= (apply!849 lt!423215 lt!423210) (get!14325 (getValueByKey!486 (toList!6075 lt!423215) lt!423210)))))

(declare-fun bs!26289 () Bool)

(assert (= bs!26289 d!113277))

(declare-fun m!872479 () Bool)

(assert (=> bs!26289 m!872479))

(assert (=> bs!26289 m!872479))

(declare-fun m!872481 () Bool)

(assert (=> bs!26289 m!872481))

(assert (=> b!937749 d!113277))

(declare-fun d!113279 () Bool)

(assert (=> d!113279 (= (apply!849 (+!2864 lt!423200 (tuple2!13433 lt!423199 zeroValue!1173)) lt!423208) (apply!849 lt!423200 lt!423208))))

(declare-fun lt!423325 () Unit!31564)

(assert (=> d!113279 (= lt!423325 (choose!1563 lt!423200 lt!423199 zeroValue!1173 lt!423208))))

(declare-fun e!526697 () Bool)

(assert (=> d!113279 e!526697))

(declare-fun res!631157 () Bool)

(assert (=> d!113279 (=> (not res!631157) (not e!526697))))

(assert (=> d!113279 (= res!631157 (contains!5077 lt!423200 lt!423208))))

(assert (=> d!113279 (= (addApplyDifferent!433 lt!423200 lt!423199 zeroValue!1173 lt!423208) lt!423325)))

(declare-fun b!937894 () Bool)

(assert (=> b!937894 (= e!526697 (not (= lt!423208 lt!423199)))))

(assert (= (and d!113279 res!631157) b!937894))

(assert (=> d!113279 m!872143))

(declare-fun m!872483 () Bool)

(assert (=> d!113279 m!872483))

(assert (=> d!113279 m!872145))

(assert (=> d!113279 m!872147))

(declare-fun m!872485 () Bool)

(assert (=> d!113279 m!872485))

(assert (=> d!113279 m!872145))

(assert (=> b!937749 d!113279))

(declare-fun d!113281 () Bool)

(assert (=> d!113281 (contains!5077 (+!2864 lt!423204 (tuple2!13433 lt!423211 zeroValue!1173)) lt!423212)))

(declare-fun lt!423326 () Unit!31564)

(assert (=> d!113281 (= lt!423326 (choose!1565 lt!423204 lt!423211 zeroValue!1173 lt!423212))))

(assert (=> d!113281 (contains!5077 lt!423204 lt!423212)))

(assert (=> d!113281 (= (addStillContains!553 lt!423204 lt!423211 zeroValue!1173 lt!423212) lt!423326)))

(declare-fun bs!26290 () Bool)

(assert (= bs!26290 d!113281))

(assert (=> bs!26290 m!872149))

(assert (=> bs!26290 m!872149))

(assert (=> bs!26290 m!872151))

(declare-fun m!872487 () Bool)

(assert (=> bs!26290 m!872487))

(declare-fun m!872489 () Bool)

(assert (=> bs!26290 m!872489))

(assert (=> b!937749 d!113281))

(declare-fun d!113283 () Bool)

(assert (=> d!113283 (= (apply!849 (+!2864 lt!422966 (tuple2!13433 lt!422964 lt!422971)) k0!1099) (get!14325 (getValueByKey!486 (toList!6075 (+!2864 lt!422966 (tuple2!13433 lt!422964 lt!422971))) k0!1099)))))

(declare-fun bs!26291 () Bool)

(assert (= bs!26291 d!113283))

(declare-fun m!872491 () Bool)

(assert (=> bs!26291 m!872491))

(assert (=> bs!26291 m!872491))

(declare-fun m!872493 () Bool)

(assert (=> bs!26291 m!872493))

(assert (=> d!113159 d!113283))

(declare-fun d!113285 () Bool)

(assert (=> d!113285 (= (apply!849 (+!2864 lt!422966 (tuple2!13433 lt!422964 lt!422971)) k0!1099) (apply!849 lt!422966 k0!1099))))

(assert (=> d!113285 true))

(declare-fun _$34!1158 () Unit!31564)

(assert (=> d!113285 (= (choose!1563 lt!422966 lt!422964 lt!422971 k0!1099) _$34!1158)))

(declare-fun bs!26292 () Bool)

(assert (= bs!26292 d!113285))

(assert (=> bs!26292 m!872073))

(assert (=> bs!26292 m!872073))

(assert (=> bs!26292 m!872075))

(assert (=> bs!26292 m!871781))

(assert (=> d!113159 d!113285))

(declare-fun d!113287 () Bool)

(declare-fun e!526698 () Bool)

(assert (=> d!113287 e!526698))

(declare-fun res!631159 () Bool)

(assert (=> d!113287 (=> (not res!631159) (not e!526698))))

(declare-fun lt!423329 () ListLongMap!12119)

(assert (=> d!113287 (= res!631159 (contains!5077 lt!423329 (_1!6727 (tuple2!13433 lt!422964 lt!422971))))))

(declare-fun lt!423330 () List!19176)

(assert (=> d!113287 (= lt!423329 (ListLongMap!12120 lt!423330))))

(declare-fun lt!423327 () Unit!31564)

(declare-fun lt!423328 () Unit!31564)

(assert (=> d!113287 (= lt!423327 lt!423328)))

(assert (=> d!113287 (= (getValueByKey!486 lt!423330 (_1!6727 (tuple2!13433 lt!422964 lt!422971))) (Some!491 (_2!6727 (tuple2!13433 lt!422964 lt!422971))))))

(assert (=> d!113287 (= lt!423328 (lemmaContainsTupThenGetReturnValue!260 lt!423330 (_1!6727 (tuple2!13433 lt!422964 lt!422971)) (_2!6727 (tuple2!13433 lt!422964 lt!422971))))))

(assert (=> d!113287 (= lt!423330 (insertStrictlySorted!317 (toList!6075 lt!422966) (_1!6727 (tuple2!13433 lt!422964 lt!422971)) (_2!6727 (tuple2!13433 lt!422964 lt!422971))))))

(assert (=> d!113287 (= (+!2864 lt!422966 (tuple2!13433 lt!422964 lt!422971)) lt!423329)))

(declare-fun b!937896 () Bool)

(declare-fun res!631158 () Bool)

(assert (=> b!937896 (=> (not res!631158) (not e!526698))))

(assert (=> b!937896 (= res!631158 (= (getValueByKey!486 (toList!6075 lt!423329) (_1!6727 (tuple2!13433 lt!422964 lt!422971))) (Some!491 (_2!6727 (tuple2!13433 lt!422964 lt!422971)))))))

(declare-fun b!937897 () Bool)

(assert (=> b!937897 (= e!526698 (contains!5080 (toList!6075 lt!423329) (tuple2!13433 lt!422964 lt!422971)))))

(assert (= (and d!113287 res!631159) b!937896))

(assert (= (and b!937896 res!631158) b!937897))

(declare-fun m!872495 () Bool)

(assert (=> d!113287 m!872495))

(declare-fun m!872497 () Bool)

(assert (=> d!113287 m!872497))

(declare-fun m!872499 () Bool)

(assert (=> d!113287 m!872499))

(declare-fun m!872501 () Bool)

(assert (=> d!113287 m!872501))

(declare-fun m!872503 () Bool)

(assert (=> b!937896 m!872503))

(declare-fun m!872505 () Bool)

(assert (=> b!937897 m!872505))

(assert (=> d!113159 d!113287))

(assert (=> d!113159 d!113133))

(assert (=> d!113159 d!113175))

(declare-fun d!113289 () Bool)

(assert (=> d!113289 (= (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (and (not (= (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937684 d!113289))

(declare-fun d!113291 () Bool)

(assert (=> d!113291 (= (apply!849 lt!423207 (select (arr!27152 _keys!1487) from!1844)) (get!14325 (getValueByKey!486 (toList!6075 lt!423207) (select (arr!27152 _keys!1487) from!1844))))))

(declare-fun bs!26293 () Bool)

(assert (= bs!26293 d!113291))

(assert (=> bs!26293 m!871925))

(assert (=> bs!26293 m!872363))

(assert (=> bs!26293 m!872363))

(declare-fun m!872507 () Bool)

(assert (=> bs!26293 m!872507))

(assert (=> b!937750 d!113291))

(declare-fun d!113293 () Bool)

(declare-fun c!97655 () Bool)

(assert (=> d!113293 (= c!97655 ((_ is ValueCellFull!9647) (select (arr!27151 _values!1231) from!1844)))))

(declare-fun e!526699 () V!31975)

(assert (=> d!113293 (= (get!14324 (select (arr!27151 _values!1231) from!1844) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!526699)))

(declare-fun b!937898 () Bool)

(assert (=> b!937898 (= e!526699 (get!14326 (select (arr!27151 _values!1231) from!1844) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!937899 () Bool)

(assert (=> b!937899 (= e!526699 (get!14327 (select (arr!27151 _values!1231) from!1844) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113293 c!97655) b!937898))

(assert (= (and d!113293 (not c!97655)) b!937899))

(assert (=> b!937898 m!872157))

(assert (=> b!937898 m!871759))

(declare-fun m!872509 () Bool)

(assert (=> b!937898 m!872509))

(assert (=> b!937899 m!872157))

(assert (=> b!937899 m!871759))

(declare-fun m!872511 () Bool)

(assert (=> b!937899 m!872511))

(assert (=> b!937750 d!113293))

(declare-fun d!113295 () Bool)

(declare-fun e!526700 () Bool)

(assert (=> d!113295 e!526700))

(declare-fun res!631160 () Bool)

(assert (=> d!113295 (=> res!631160 e!526700)))

(declare-fun lt!423334 () Bool)

(assert (=> d!113295 (= res!631160 (not lt!423334))))

(declare-fun lt!423332 () Bool)

(assert (=> d!113295 (= lt!423334 lt!423332)))

(declare-fun lt!423331 () Unit!31564)

(declare-fun e!526701 () Unit!31564)

(assert (=> d!113295 (= lt!423331 e!526701)))

(declare-fun c!97656 () Bool)

(assert (=> d!113295 (= c!97656 lt!423332)))

(assert (=> d!113295 (= lt!423332 (containsKey!450 (toList!6075 lt!423171) (_1!6727 lt!422962)))))

(assert (=> d!113295 (= (contains!5077 lt!423171 (_1!6727 lt!422962)) lt!423334)))

(declare-fun b!937900 () Bool)

(declare-fun lt!423333 () Unit!31564)

(assert (=> b!937900 (= e!526701 lt!423333)))

(assert (=> b!937900 (= lt!423333 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 lt!423171) (_1!6727 lt!422962)))))

(assert (=> b!937900 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423171) (_1!6727 lt!422962)))))

(declare-fun b!937901 () Bool)

(declare-fun Unit!31586 () Unit!31564)

(assert (=> b!937901 (= e!526701 Unit!31586)))

(declare-fun b!937902 () Bool)

(assert (=> b!937902 (= e!526700 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423171) (_1!6727 lt!422962))))))

(assert (= (and d!113295 c!97656) b!937900))

(assert (= (and d!113295 (not c!97656)) b!937901))

(assert (= (and d!113295 (not res!631160)) b!937902))

(declare-fun m!872513 () Bool)

(assert (=> d!113295 m!872513))

(declare-fun m!872515 () Bool)

(assert (=> b!937900 m!872515))

(assert (=> b!937900 m!872059))

(assert (=> b!937900 m!872059))

(declare-fun m!872517 () Bool)

(assert (=> b!937900 m!872517))

(assert (=> b!937902 m!872059))

(assert (=> b!937902 m!872059))

(assert (=> b!937902 m!872517))

(assert (=> d!113153 d!113295))

(declare-fun b!937904 () Bool)

(declare-fun e!526702 () Option!492)

(declare-fun e!526703 () Option!492)

(assert (=> b!937904 (= e!526702 e!526703)))

(declare-fun c!97658 () Bool)

(assert (=> b!937904 (= c!97658 (and ((_ is Cons!19172) lt!423172) (not (= (_1!6727 (h!20318 lt!423172)) (_1!6727 lt!422962)))))))

(declare-fun b!937905 () Bool)

(assert (=> b!937905 (= e!526703 (getValueByKey!486 (t!27460 lt!423172) (_1!6727 lt!422962)))))

(declare-fun b!937906 () Bool)

(assert (=> b!937906 (= e!526703 None!490)))

(declare-fun d!113297 () Bool)

(declare-fun c!97657 () Bool)

(assert (=> d!113297 (= c!97657 (and ((_ is Cons!19172) lt!423172) (= (_1!6727 (h!20318 lt!423172)) (_1!6727 lt!422962))))))

(assert (=> d!113297 (= (getValueByKey!486 lt!423172 (_1!6727 lt!422962)) e!526702)))

(declare-fun b!937903 () Bool)

(assert (=> b!937903 (= e!526702 (Some!491 (_2!6727 (h!20318 lt!423172))))))

(assert (= (and d!113297 c!97657) b!937903))

(assert (= (and d!113297 (not c!97657)) b!937904))

(assert (= (and b!937904 c!97658) b!937905))

(assert (= (and b!937904 (not c!97658)) b!937906))

(declare-fun m!872519 () Bool)

(assert (=> b!937905 m!872519))

(assert (=> d!113153 d!113297))

(declare-fun d!113299 () Bool)

(assert (=> d!113299 (= (getValueByKey!486 lt!423172 (_1!6727 lt!422962)) (Some!491 (_2!6727 lt!422962)))))

(declare-fun lt!423337 () Unit!31564)

(declare-fun choose!1566 (List!19176 (_ BitVec 64) V!31975) Unit!31564)

(assert (=> d!113299 (= lt!423337 (choose!1566 lt!423172 (_1!6727 lt!422962) (_2!6727 lt!422962)))))

(declare-fun e!526706 () Bool)

(assert (=> d!113299 e!526706))

(declare-fun res!631165 () Bool)

(assert (=> d!113299 (=> (not res!631165) (not e!526706))))

(declare-fun isStrictlySorted!499 (List!19176) Bool)

(assert (=> d!113299 (= res!631165 (isStrictlySorted!499 lt!423172))))

(assert (=> d!113299 (= (lemmaContainsTupThenGetReturnValue!260 lt!423172 (_1!6727 lt!422962) (_2!6727 lt!422962)) lt!423337)))

(declare-fun b!937911 () Bool)

(declare-fun res!631166 () Bool)

(assert (=> b!937911 (=> (not res!631166) (not e!526706))))

(assert (=> b!937911 (= res!631166 (containsKey!450 lt!423172 (_1!6727 lt!422962)))))

(declare-fun b!937912 () Bool)

(assert (=> b!937912 (= e!526706 (contains!5080 lt!423172 (tuple2!13433 (_1!6727 lt!422962) (_2!6727 lt!422962))))))

(assert (= (and d!113299 res!631165) b!937911))

(assert (= (and b!937911 res!631166) b!937912))

(assert (=> d!113299 m!872053))

(declare-fun m!872521 () Bool)

(assert (=> d!113299 m!872521))

(declare-fun m!872523 () Bool)

(assert (=> d!113299 m!872523))

(declare-fun m!872525 () Bool)

(assert (=> b!937911 m!872525))

(declare-fun m!872527 () Bool)

(assert (=> b!937912 m!872527))

(assert (=> d!113153 d!113299))

(declare-fun b!937933 () Bool)

(declare-fun c!97669 () Bool)

(assert (=> b!937933 (= c!97669 (and ((_ is Cons!19172) (toList!6075 lt!422966)) (bvsgt (_1!6727 (h!20318 (toList!6075 lt!422966))) (_1!6727 lt!422962))))))

(declare-fun e!526721 () List!19176)

(declare-fun e!526719 () List!19176)

(assert (=> b!937933 (= e!526721 e!526719)))

(declare-fun b!937934 () Bool)

(declare-fun e!526718 () List!19176)

(declare-fun call!40789 () List!19176)

(assert (=> b!937934 (= e!526718 call!40789)))

(declare-fun b!937935 () Bool)

(declare-fun call!40787 () List!19176)

(assert (=> b!937935 (= e!526719 call!40787)))

(declare-fun d!113301 () Bool)

(declare-fun e!526720 () Bool)

(assert (=> d!113301 e!526720))

(declare-fun res!631172 () Bool)

(assert (=> d!113301 (=> (not res!631172) (not e!526720))))

(declare-fun lt!423340 () List!19176)

(assert (=> d!113301 (= res!631172 (isStrictlySorted!499 lt!423340))))

(assert (=> d!113301 (= lt!423340 e!526718)))

(declare-fun c!97668 () Bool)

(assert (=> d!113301 (= c!97668 (and ((_ is Cons!19172) (toList!6075 lt!422966)) (bvslt (_1!6727 (h!20318 (toList!6075 lt!422966))) (_1!6727 lt!422962))))))

(assert (=> d!113301 (isStrictlySorted!499 (toList!6075 lt!422966))))

(assert (=> d!113301 (= (insertStrictlySorted!317 (toList!6075 lt!422966) (_1!6727 lt!422962) (_2!6727 lt!422962)) lt!423340)))

(declare-fun b!937936 () Bool)

(declare-fun call!40788 () List!19176)

(assert (=> b!937936 (= e!526721 call!40788)))

(declare-fun b!937937 () Bool)

(assert (=> b!937937 (= e!526719 call!40787)))

(declare-fun b!937938 () Bool)

(declare-fun e!526717 () List!19176)

(assert (=> b!937938 (= e!526717 (insertStrictlySorted!317 (t!27460 (toList!6075 lt!422966)) (_1!6727 lt!422962) (_2!6727 lt!422962)))))

(declare-fun b!937939 () Bool)

(declare-fun res!631171 () Bool)

(assert (=> b!937939 (=> (not res!631171) (not e!526720))))

(assert (=> b!937939 (= res!631171 (containsKey!450 lt!423340 (_1!6727 lt!422962)))))

(declare-fun b!937940 () Bool)

(assert (=> b!937940 (= e!526720 (contains!5080 lt!423340 (tuple2!13433 (_1!6727 lt!422962) (_2!6727 lt!422962))))))

(declare-fun bm!40784 () Bool)

(assert (=> bm!40784 (= call!40788 call!40789)))

(declare-fun bm!40785 () Bool)

(declare-fun $colon$colon!553 (List!19176 tuple2!13432) List!19176)

(assert (=> bm!40785 (= call!40789 ($colon$colon!553 e!526717 (ite c!97668 (h!20318 (toList!6075 lt!422966)) (tuple2!13433 (_1!6727 lt!422962) (_2!6727 lt!422962)))))))

(declare-fun c!97670 () Bool)

(assert (=> bm!40785 (= c!97670 c!97668)))

(declare-fun bm!40786 () Bool)

(assert (=> bm!40786 (= call!40787 call!40788)))

(declare-fun b!937941 () Bool)

(assert (=> b!937941 (= e!526718 e!526721)))

(declare-fun c!97667 () Bool)

(assert (=> b!937941 (= c!97667 (and ((_ is Cons!19172) (toList!6075 lt!422966)) (= (_1!6727 (h!20318 (toList!6075 lt!422966))) (_1!6727 lt!422962))))))

(declare-fun b!937942 () Bool)

(assert (=> b!937942 (= e!526717 (ite c!97667 (t!27460 (toList!6075 lt!422966)) (ite c!97669 (Cons!19172 (h!20318 (toList!6075 lt!422966)) (t!27460 (toList!6075 lt!422966))) Nil!19173)))))

(assert (= (and d!113301 c!97668) b!937934))

(assert (= (and d!113301 (not c!97668)) b!937941))

(assert (= (and b!937941 c!97667) b!937936))

(assert (= (and b!937941 (not c!97667)) b!937933))

(assert (= (and b!937933 c!97669) b!937937))

(assert (= (and b!937933 (not c!97669)) b!937935))

(assert (= (or b!937937 b!937935) bm!40786))

(assert (= (or b!937936 bm!40786) bm!40784))

(assert (= (or b!937934 bm!40784) bm!40785))

(assert (= (and bm!40785 c!97670) b!937938))

(assert (= (and bm!40785 (not c!97670)) b!937942))

(assert (= (and d!113301 res!631172) b!937939))

(assert (= (and b!937939 res!631171) b!937940))

(declare-fun m!872529 () Bool)

(assert (=> d!113301 m!872529))

(declare-fun m!872531 () Bool)

(assert (=> d!113301 m!872531))

(declare-fun m!872533 () Bool)

(assert (=> b!937940 m!872533))

(declare-fun m!872535 () Bool)

(assert (=> bm!40785 m!872535))

(declare-fun m!872537 () Bool)

(assert (=> b!937938 m!872537))

(declare-fun m!872539 () Bool)

(assert (=> b!937939 m!872539))

(assert (=> d!113153 d!113301))

(declare-fun d!113303 () Bool)

(declare-fun e!526722 () Bool)

(assert (=> d!113303 e!526722))

(declare-fun res!631174 () Bool)

(assert (=> d!113303 (=> (not res!631174) (not e!526722))))

(declare-fun lt!423343 () ListLongMap!12119)

(assert (=> d!113303 (= res!631174 (contains!5077 lt!423343 (_1!6727 (ite (or c!97600 c!97595) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!423344 () List!19176)

(assert (=> d!113303 (= lt!423343 (ListLongMap!12120 lt!423344))))

(declare-fun lt!423341 () Unit!31564)

(declare-fun lt!423342 () Unit!31564)

(assert (=> d!113303 (= lt!423341 lt!423342)))

(assert (=> d!113303 (= (getValueByKey!486 lt!423344 (_1!6727 (ite (or c!97600 c!97595) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!491 (_2!6727 (ite (or c!97600 c!97595) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113303 (= lt!423342 (lemmaContainsTupThenGetReturnValue!260 lt!423344 (_1!6727 (ite (or c!97600 c!97595) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6727 (ite (or c!97600 c!97595) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113303 (= lt!423344 (insertStrictlySorted!317 (toList!6075 (ite c!97600 call!40755 (ite c!97595 call!40759 call!40756))) (_1!6727 (ite (or c!97600 c!97595) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6727 (ite (or c!97600 c!97595) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113303 (= (+!2864 (ite c!97600 call!40755 (ite c!97595 call!40759 call!40756)) (ite (or c!97600 c!97595) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!423343)))

(declare-fun b!937943 () Bool)

(declare-fun res!631173 () Bool)

(assert (=> b!937943 (=> (not res!631173) (not e!526722))))

(assert (=> b!937943 (= res!631173 (= (getValueByKey!486 (toList!6075 lt!423343) (_1!6727 (ite (or c!97600 c!97595) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!491 (_2!6727 (ite (or c!97600 c!97595) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!937944 () Bool)

(assert (=> b!937944 (= e!526722 (contains!5080 (toList!6075 lt!423343) (ite (or c!97600 c!97595) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113303 res!631174) b!937943))

(assert (= (and b!937943 res!631173) b!937944))

(declare-fun m!872541 () Bool)

(assert (=> d!113303 m!872541))

(declare-fun m!872543 () Bool)

(assert (=> d!113303 m!872543))

(declare-fun m!872545 () Bool)

(assert (=> d!113303 m!872545))

(declare-fun m!872547 () Bool)

(assert (=> d!113303 m!872547))

(declare-fun m!872549 () Bool)

(assert (=> b!937943 m!872549))

(declare-fun m!872551 () Bool)

(assert (=> b!937944 m!872551))

(assert (=> bm!40755 d!113303))

(assert (=> b!937726 d!113137))

(declare-fun b!937945 () Bool)

(declare-fun e!526724 () ListLongMap!12119)

(assert (=> b!937945 (= e!526724 (ListLongMap!12120 Nil!19173))))

(declare-fun b!937946 () Bool)

(declare-fun e!526729 () ListLongMap!12119)

(declare-fun call!40790 () ListLongMap!12119)

(assert (=> b!937946 (= e!526729 call!40790)))

(declare-fun b!937947 () Bool)

(declare-fun e!526728 () Bool)

(declare-fun e!526723 () Bool)

(assert (=> b!937947 (= e!526728 e!526723)))

(assert (=> b!937947 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27613 _keys!1487)))))

(declare-fun res!631175 () Bool)

(declare-fun lt!423350 () ListLongMap!12119)

(assert (=> b!937947 (= res!631175 (contains!5077 lt!423350 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!937947 (=> (not res!631175) (not e!526723))))

(declare-fun b!937948 () Bool)

(declare-fun e!526725 () Bool)

(assert (=> b!937948 (= e!526725 e!526728)))

(declare-fun c!97673 () Bool)

(declare-fun e!526726 () Bool)

(assert (=> b!937948 (= c!97673 e!526726)))

(declare-fun res!631177 () Bool)

(assert (=> b!937948 (=> (not res!631177) (not e!526726))))

(assert (=> b!937948 (= res!631177 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27613 _keys!1487)))))

(declare-fun e!526727 () Bool)

(declare-fun b!937949 () Bool)

(assert (=> b!937949 (= e!526727 (= lt!423350 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)))))

(declare-fun b!937950 () Bool)

(assert (=> b!937950 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27613 _keys!1487)))))

(assert (=> b!937950 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27612 _values!1231)))))

(assert (=> b!937950 (= e!526723 (= (apply!849 lt!423350 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14324 (select (arr!27151 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!937952 () Bool)

(assert (=> b!937952 (= e!526724 e!526729)))

(declare-fun c!97672 () Bool)

(assert (=> b!937952 (= c!97672 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!937953 () Bool)

(declare-fun res!631176 () Bool)

(assert (=> b!937953 (=> (not res!631176) (not e!526725))))

(assert (=> b!937953 (= res!631176 (not (contains!5077 lt!423350 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!937954 () Bool)

(assert (=> b!937954 (= e!526728 e!526727)))

(declare-fun c!97671 () Bool)

(assert (=> b!937954 (= c!97671 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27613 _keys!1487)))))

(declare-fun b!937955 () Bool)

(assert (=> b!937955 (= e!526727 (isEmpty!701 lt!423350))))

(declare-fun b!937956 () Bool)

(assert (=> b!937956 (= e!526726 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!937956 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000)))

(declare-fun bm!40787 () Bool)

(assert (=> bm!40787 (= call!40790 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun d!113305 () Bool)

(assert (=> d!113305 e!526725))

(declare-fun res!631178 () Bool)

(assert (=> d!113305 (=> (not res!631178) (not e!526725))))

(assert (=> d!113305 (= res!631178 (not (contains!5077 lt!423350 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!113305 (= lt!423350 e!526724)))

(declare-fun c!97674 () Bool)

(assert (=> d!113305 (= c!97674 (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27613 _keys!1487)))))

(assert (=> d!113305 (validMask!0 mask!1881)))

(assert (=> d!113305 (= (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423350)))

(declare-fun b!937951 () Bool)

(declare-fun lt!423348 () Unit!31564)

(declare-fun lt!423351 () Unit!31564)

(assert (=> b!937951 (= lt!423348 lt!423351)))

(declare-fun lt!423346 () V!31975)

(declare-fun lt!423345 () ListLongMap!12119)

(declare-fun lt!423347 () (_ BitVec 64))

(declare-fun lt!423349 () (_ BitVec 64))

(assert (=> b!937951 (not (contains!5077 (+!2864 lt!423345 (tuple2!13433 lt!423349 lt!423346)) lt!423347))))

(assert (=> b!937951 (= lt!423351 (addStillNotContains!221 lt!423345 lt!423349 lt!423346 lt!423347))))

(assert (=> b!937951 (= lt!423347 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!937951 (= lt!423346 (get!14324 (select (arr!27151 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!937951 (= lt!423349 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!937951 (= lt!423345 call!40790)))

(assert (=> b!937951 (= e!526729 (+!2864 call!40790 (tuple2!13433 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (get!14324 (select (arr!27151 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!113305 c!97674) b!937945))

(assert (= (and d!113305 (not c!97674)) b!937952))

(assert (= (and b!937952 c!97672) b!937951))

(assert (= (and b!937952 (not c!97672)) b!937946))

(assert (= (or b!937951 b!937946) bm!40787))

(assert (= (and d!113305 res!631178) b!937953))

(assert (= (and b!937953 res!631176) b!937948))

(assert (= (and b!937948 res!631177) b!937956))

(assert (= (and b!937948 c!97673) b!937947))

(assert (= (and b!937948 (not c!97673)) b!937954))

(assert (= (and b!937947 res!631175) b!937950))

(assert (= (and b!937954 c!97671) b!937949))

(assert (= (and b!937954 (not c!97671)) b!937955))

(declare-fun b_lambda!14169 () Bool)

(assert (=> (not b_lambda!14169) (not b!937950)))

(assert (=> b!937950 t!27459))

(declare-fun b_and!29091 () Bool)

(assert (= b_and!29089 (and (=> t!27459 result!12111) b_and!29091)))

(declare-fun b_lambda!14171 () Bool)

(assert (=> (not b_lambda!14171) (not b!937951)))

(assert (=> b!937951 t!27459))

(declare-fun b_and!29093 () Bool)

(assert (= b_and!29091 (and (=> t!27459 result!12111) b_and!29093)))

(declare-fun m!872553 () Bool)

(assert (=> b!937951 m!872553))

(declare-fun m!872555 () Bool)

(assert (=> b!937951 m!872555))

(declare-fun m!872557 () Bool)

(assert (=> b!937951 m!872557))

(assert (=> b!937951 m!872041))

(assert (=> b!937951 m!871759))

(assert (=> b!937951 m!872043))

(assert (=> b!937951 m!871995))

(assert (=> b!937951 m!871759))

(assert (=> b!937951 m!872041))

(assert (=> b!937951 m!872557))

(declare-fun m!872559 () Bool)

(assert (=> b!937951 m!872559))

(assert (=> b!937952 m!871995))

(assert (=> b!937952 m!871995))

(assert (=> b!937952 m!871997))

(declare-fun m!872561 () Bool)

(assert (=> bm!40787 m!872561))

(declare-fun m!872563 () Bool)

(assert (=> b!937955 m!872563))

(declare-fun m!872565 () Bool)

(assert (=> b!937953 m!872565))

(assert (=> b!937956 m!871995))

(assert (=> b!937956 m!871995))

(assert (=> b!937956 m!871997))

(declare-fun m!872567 () Bool)

(assert (=> d!113305 m!872567))

(assert (=> d!113305 m!871739))

(assert (=> b!937950 m!872041))

(assert (=> b!937950 m!871759))

(assert (=> b!937950 m!872043))

(assert (=> b!937950 m!871995))

(assert (=> b!937950 m!871759))

(assert (=> b!937950 m!871995))

(declare-fun m!872569 () Bool)

(assert (=> b!937950 m!872569))

(assert (=> b!937950 m!872041))

(assert (=> b!937947 m!871995))

(assert (=> b!937947 m!871995))

(declare-fun m!872571 () Bool)

(assert (=> b!937947 m!872571))

(assert (=> b!937949 m!872561))

(assert (=> bm!40763 d!113305))

(declare-fun d!113307 () Bool)

(assert (=> d!113307 (isDefined!358 (getValueByKey!486 (toList!6075 lt!422966) k0!1099))))

(declare-fun lt!423354 () Unit!31564)

(declare-fun choose!1567 (List!19176 (_ BitVec 64)) Unit!31564)

(assert (=> d!113307 (= lt!423354 (choose!1567 (toList!6075 lt!422966) k0!1099))))

(declare-fun e!526732 () Bool)

(assert (=> d!113307 e!526732))

(declare-fun res!631181 () Bool)

(assert (=> d!113307 (=> (not res!631181) (not e!526732))))

(assert (=> d!113307 (= res!631181 (isStrictlySorted!499 (toList!6075 lt!422966)))))

(assert (=> d!113307 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 lt!422966) k0!1099) lt!423354)))

(declare-fun b!937959 () Bool)

(assert (=> b!937959 (= e!526732 (containsKey!450 (toList!6075 lt!422966) k0!1099))))

(assert (= (and d!113307 res!631181) b!937959))

(assert (=> d!113307 m!871921))

(assert (=> d!113307 m!871921))

(assert (=> d!113307 m!872111))

(declare-fun m!872573 () Bool)

(assert (=> d!113307 m!872573))

(assert (=> d!113307 m!872531))

(assert (=> b!937959 m!872107))

(assert (=> b!937735 d!113307))

(declare-fun d!113309 () Bool)

(declare-fun isEmpty!702 (Option!492) Bool)

(assert (=> d!113309 (= (isDefined!358 (getValueByKey!486 (toList!6075 lt!422966) k0!1099)) (not (isEmpty!702 (getValueByKey!486 (toList!6075 lt!422966) k0!1099))))))

(declare-fun bs!26294 () Bool)

(assert (= bs!26294 d!113309))

(assert (=> bs!26294 m!871921))

(declare-fun m!872575 () Bool)

(assert (=> bs!26294 m!872575))

(assert (=> b!937735 d!113309))

(declare-fun b!937961 () Bool)

(declare-fun e!526733 () Option!492)

(declare-fun e!526734 () Option!492)

(assert (=> b!937961 (= e!526733 e!526734)))

(declare-fun c!97676 () Bool)

(assert (=> b!937961 (= c!97676 (and ((_ is Cons!19172) (toList!6075 lt!422966)) (not (= (_1!6727 (h!20318 (toList!6075 lt!422966))) k0!1099))))))

(declare-fun b!937962 () Bool)

(assert (=> b!937962 (= e!526734 (getValueByKey!486 (t!27460 (toList!6075 lt!422966)) k0!1099))))

(declare-fun b!937963 () Bool)

(assert (=> b!937963 (= e!526734 None!490)))

(declare-fun d!113311 () Bool)

(declare-fun c!97675 () Bool)

(assert (=> d!113311 (= c!97675 (and ((_ is Cons!19172) (toList!6075 lt!422966)) (= (_1!6727 (h!20318 (toList!6075 lt!422966))) k0!1099)))))

(assert (=> d!113311 (= (getValueByKey!486 (toList!6075 lt!422966) k0!1099) e!526733)))

(declare-fun b!937960 () Bool)

(assert (=> b!937960 (= e!526733 (Some!491 (_2!6727 (h!20318 (toList!6075 lt!422966)))))))

(assert (= (and d!113311 c!97675) b!937960))

(assert (= (and d!113311 (not c!97675)) b!937961))

(assert (= (and b!937961 c!97676) b!937962))

(assert (= (and b!937961 (not c!97676)) b!937963))

(declare-fun m!872577 () Bool)

(assert (=> b!937962 m!872577))

(assert (=> b!937735 d!113311))

(declare-fun d!113313 () Bool)

(declare-fun res!631182 () Bool)

(declare-fun e!526735 () Bool)

(assert (=> d!113313 (=> res!631182 e!526735)))

(assert (=> d!113313 (= res!631182 (= (select (arr!27152 _keys!1487) (bvadd from!1844 #b00000000000000000000000000000001)) k0!1099))))

(assert (=> d!113313 (= (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)) e!526735)))

(declare-fun b!937964 () Bool)

(declare-fun e!526736 () Bool)

(assert (=> b!937964 (= e!526735 e!526736)))

(declare-fun res!631183 () Bool)

(assert (=> b!937964 (=> (not res!631183) (not e!526736))))

(assert (=> b!937964 (= res!631183 (bvslt (bvadd from!1844 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(declare-fun b!937965 () Bool)

(assert (=> b!937965 (= e!526736 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!113313 (not res!631182)) b!937964))

(assert (= (and b!937964 res!631183) b!937965))

(declare-fun m!872579 () Bool)

(assert (=> d!113313 m!872579))

(declare-fun m!872581 () Bool)

(assert (=> b!937965 m!872581))

(assert (=> b!937596 d!113313))

(declare-fun d!113315 () Bool)

(assert (=> d!113315 (= (apply!849 lt!423207 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14325 (getValueByKey!486 (toList!6075 lt!423207) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26295 () Bool)

(assert (= bs!26295 d!113315))

(assert (=> bs!26295 m!872349))

(assert (=> bs!26295 m!872349))

(declare-fun m!872583 () Bool)

(assert (=> bs!26295 m!872583))

(assert (=> b!937752 d!113315))

(assert (=> d!113151 d!113141))

(assert (=> b!937710 d!113147))

(declare-fun d!113317 () Bool)

(declare-fun e!526737 () Bool)

(assert (=> d!113317 e!526737))

(declare-fun res!631185 () Bool)

(assert (=> d!113317 (=> (not res!631185) (not e!526737))))

(declare-fun lt!423357 () ListLongMap!12119)

(assert (=> d!113317 (= res!631185 (contains!5077 lt!423357 (_1!6727 (tuple2!13433 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!423358 () List!19176)

(assert (=> d!113317 (= lt!423357 (ListLongMap!12120 lt!423358))))

(declare-fun lt!423355 () Unit!31564)

(declare-fun lt!423356 () Unit!31564)

(assert (=> d!113317 (= lt!423355 lt!423356)))

(assert (=> d!113317 (= (getValueByKey!486 lt!423358 (_1!6727 (tuple2!13433 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!491 (_2!6727 (tuple2!13433 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113317 (= lt!423356 (lemmaContainsTupThenGetReturnValue!260 lt!423358 (_1!6727 (tuple2!13433 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!6727 (tuple2!13433 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113317 (= lt!423358 (insertStrictlySorted!317 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235)) (_1!6727 (tuple2!13433 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!6727 (tuple2!13433 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!113317 (= (+!2864 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13433 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!423357)))

(declare-fun b!937966 () Bool)

(declare-fun res!631184 () Bool)

(assert (=> b!937966 (=> (not res!631184) (not e!526737))))

(assert (=> b!937966 (= res!631184 (= (getValueByKey!486 (toList!6075 lt!423357) (_1!6727 (tuple2!13433 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!491 (_2!6727 (tuple2!13433 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!937967 () Bool)

(assert (=> b!937967 (= e!526737 (contains!5080 (toList!6075 lt!423357) (tuple2!13433 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!113317 res!631185) b!937966))

(assert (= (and b!937966 res!631184) b!937967))

(declare-fun m!872585 () Bool)

(assert (=> d!113317 m!872585))

(declare-fun m!872587 () Bool)

(assert (=> d!113317 m!872587))

(declare-fun m!872589 () Bool)

(assert (=> d!113317 m!872589))

(declare-fun m!872591 () Bool)

(assert (=> d!113317 m!872591))

(declare-fun m!872593 () Bool)

(assert (=> b!937966 m!872593))

(declare-fun m!872595 () Bool)

(assert (=> b!937967 m!872595))

(assert (=> b!937710 d!113317))

(declare-fun b!937968 () Bool)

(declare-fun e!526738 () ListLongMap!12119)

(declare-fun call!40795 () ListLongMap!12119)

(assert (=> b!937968 (= e!526738 call!40795)))

(declare-fun b!937969 () Bool)

(declare-fun e!526744 () Bool)

(declare-fun e!526747 () Bool)

(assert (=> b!937969 (= e!526744 e!526747)))

(declare-fun res!631192 () Bool)

(declare-fun call!40791 () Bool)

(assert (=> b!937969 (= res!631192 call!40791)))

(assert (=> b!937969 (=> (not res!631192) (not e!526747))))

(declare-fun b!937970 () Bool)

(declare-fun res!631194 () Bool)

(declare-fun e!526740 () Bool)

(assert (=> b!937970 (=> (not res!631194) (not e!526740))))

(declare-fun e!526739 () Bool)

(assert (=> b!937970 (= res!631194 e!526739)))

(declare-fun res!631186 () Bool)

(assert (=> b!937970 (=> res!631186 e!526739)))

(declare-fun e!526748 () Bool)

(assert (=> b!937970 (= res!631186 (not e!526748))))

(declare-fun res!631187 () Bool)

(assert (=> b!937970 (=> (not res!631187) (not e!526748))))

(assert (=> b!937970 (= res!631187 (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(declare-fun b!937971 () Bool)

(declare-fun e!526750 () Bool)

(assert (=> b!937971 (= e!526750 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!937972 () Bool)

(declare-fun c!97680 () Bool)

(assert (=> b!937972 (= c!97680 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!526743 () ListLongMap!12119)

(assert (=> b!937972 (= e!526743 e!526738)))

(declare-fun d!113319 () Bool)

(assert (=> d!113319 e!526740))

(declare-fun res!631188 () Bool)

(assert (=> d!113319 (=> (not res!631188) (not e!526740))))

(assert (=> d!113319 (= res!631188 (or (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27613 _keys!1487)) (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27613 _keys!1487)))))))

(declare-fun lt!423367 () ListLongMap!12119)

(declare-fun lt!423376 () ListLongMap!12119)

(assert (=> d!113319 (= lt!423367 lt!423376)))

(declare-fun lt!423378 () Unit!31564)

(declare-fun e!526745 () Unit!31564)

(assert (=> d!113319 (= lt!423378 e!526745)))

(declare-fun c!97679 () Bool)

(assert (=> d!113319 (= c!97679 e!526750)))

(declare-fun res!631189 () Bool)

(assert (=> d!113319 (=> (not res!631189) (not e!526750))))

(assert (=> d!113319 (= res!631189 (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(declare-fun e!526742 () ListLongMap!12119)

(assert (=> d!113319 (= lt!423376 e!526742)))

(declare-fun c!97682 () Bool)

(assert (=> d!113319 (= c!97682 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113319 (validMask!0 mask!1881)))

(assert (=> d!113319 (= (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) lt!423367)))

(declare-fun b!937973 () Bool)

(declare-fun Unit!31587 () Unit!31564)

(assert (=> b!937973 (= e!526745 Unit!31587)))

(declare-fun b!937974 () Bool)

(declare-fun call!40796 () ListLongMap!12119)

(assert (=> b!937974 (= e!526742 (+!2864 call!40796 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!937975 () Bool)

(declare-fun res!631190 () Bool)

(assert (=> b!937975 (=> (not res!631190) (not e!526740))))

(declare-fun e!526749 () Bool)

(assert (=> b!937975 (= res!631190 e!526749)))

(declare-fun c!97681 () Bool)

(assert (=> b!937975 (= c!97681 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!937976 () Bool)

(declare-fun call!40792 () Bool)

(assert (=> b!937976 (= e!526749 (not call!40792))))

(declare-fun bm!40788 () Bool)

(assert (=> bm!40788 (= call!40791 (contains!5077 lt!423367 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40789 () Bool)

(declare-fun call!40797 () ListLongMap!12119)

(declare-fun call!40793 () ListLongMap!12119)

(assert (=> bm!40789 (= call!40797 call!40793)))

(declare-fun b!937977 () Bool)

(declare-fun e!526746 () Bool)

(assert (=> b!937977 (= e!526739 e!526746)))

(declare-fun res!631191 () Bool)

(assert (=> b!937977 (=> (not res!631191) (not e!526746))))

(assert (=> b!937977 (= res!631191 (contains!5077 lt!423367 (select (arr!27152 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(assert (=> b!937977 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(declare-fun b!937978 () Bool)

(declare-fun e!526741 () Bool)

(assert (=> b!937978 (= e!526749 e!526741)))

(declare-fun res!631193 () Bool)

(assert (=> b!937978 (= res!631193 call!40792)))

(assert (=> b!937978 (=> (not res!631193) (not e!526741))))

(declare-fun bm!40790 () Bool)

(assert (=> bm!40790 (= call!40792 (contains!5077 lt!423367 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!937979 () Bool)

(declare-fun lt!423369 () Unit!31564)

(assert (=> b!937979 (= e!526745 lt!423369)))

(declare-fun lt!423364 () ListLongMap!12119)

(assert (=> b!937979 (= lt!423364 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423371 () (_ BitVec 64))

(assert (=> b!937979 (= lt!423371 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423372 () (_ BitVec 64))

(assert (=> b!937979 (= lt!423372 (select (arr!27152 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!423380 () Unit!31564)

(assert (=> b!937979 (= lt!423380 (addStillContains!553 lt!423364 lt!423371 zeroValue!1173 lt!423372))))

(assert (=> b!937979 (contains!5077 (+!2864 lt!423364 (tuple2!13433 lt!423371 zeroValue!1173)) lt!423372)))

(declare-fun lt!423379 () Unit!31564)

(assert (=> b!937979 (= lt!423379 lt!423380)))

(declare-fun lt!423365 () ListLongMap!12119)

(assert (=> b!937979 (= lt!423365 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423373 () (_ BitVec 64))

(assert (=> b!937979 (= lt!423373 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423374 () (_ BitVec 64))

(assert (=> b!937979 (= lt!423374 (select (arr!27152 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!423377 () Unit!31564)

(assert (=> b!937979 (= lt!423377 (addApplyDifferent!433 lt!423365 lt!423373 minValue!1173 lt!423374))))

(assert (=> b!937979 (= (apply!849 (+!2864 lt!423365 (tuple2!13433 lt!423373 minValue!1173)) lt!423374) (apply!849 lt!423365 lt!423374))))

(declare-fun lt!423363 () Unit!31564)

(assert (=> b!937979 (= lt!423363 lt!423377)))

(declare-fun lt!423360 () ListLongMap!12119)

(assert (=> b!937979 (= lt!423360 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423359 () (_ BitVec 64))

(assert (=> b!937979 (= lt!423359 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423368 () (_ BitVec 64))

(assert (=> b!937979 (= lt!423368 (select (arr!27152 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun lt!423361 () Unit!31564)

(assert (=> b!937979 (= lt!423361 (addApplyDifferent!433 lt!423360 lt!423359 zeroValue!1173 lt!423368))))

(assert (=> b!937979 (= (apply!849 (+!2864 lt!423360 (tuple2!13433 lt!423359 zeroValue!1173)) lt!423368) (apply!849 lt!423360 lt!423368))))

(declare-fun lt!423366 () Unit!31564)

(assert (=> b!937979 (= lt!423366 lt!423361)))

(declare-fun lt!423375 () ListLongMap!12119)

(assert (=> b!937979 (= lt!423375 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!423362 () (_ BitVec 64))

(assert (=> b!937979 (= lt!423362 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423370 () (_ BitVec 64))

(assert (=> b!937979 (= lt!423370 (select (arr!27152 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (=> b!937979 (= lt!423369 (addApplyDifferent!433 lt!423375 lt!423362 minValue!1173 lt!423370))))

(assert (=> b!937979 (= (apply!849 (+!2864 lt!423375 (tuple2!13433 lt!423362 minValue!1173)) lt!423370) (apply!849 lt!423375 lt!423370))))

(declare-fun bm!40791 () Bool)

(assert (=> bm!40791 (= call!40795 call!40796)))

(declare-fun b!937980 () Bool)

(assert (=> b!937980 (= e!526746 (= (apply!849 lt!423367 (select (arr!27152 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))) (get!14324 (select (arr!27151 _values!1231) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!937980 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27612 _values!1231)))))

(assert (=> b!937980 (and (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(declare-fun b!937981 () Bool)

(declare-fun call!40794 () ListLongMap!12119)

(assert (=> b!937981 (= e!526738 call!40794)))

(declare-fun b!937982 () Bool)

(assert (=> b!937982 (= e!526747 (= (apply!849 lt!423367 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40792 () Bool)

(assert (=> bm!40792 (= call!40794 call!40797)))

(declare-fun b!937983 () Bool)

(assert (=> b!937983 (= e!526742 e!526743)))

(declare-fun c!97677 () Bool)

(assert (=> b!937983 (= c!97677 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40793 () Bool)

(assert (=> bm!40793 (= call!40796 (+!2864 (ite c!97682 call!40793 (ite c!97677 call!40797 call!40794)) (ite (or c!97682 c!97677) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!937984 () Bool)

(assert (=> b!937984 (= e!526748 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!937985 () Bool)

(assert (=> b!937985 (= e!526743 call!40795)))

(declare-fun b!937986 () Bool)

(assert (=> b!937986 (= e!526741 (= (apply!849 lt!423367 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!937987 () Bool)

(assert (=> b!937987 (= e!526740 e!526744)))

(declare-fun c!97678 () Bool)

(assert (=> b!937987 (= c!97678 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40794 () Bool)

(assert (=> bm!40794 (= call!40793 (getCurrentListMapNoExtraKeys!3339 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!937988 () Bool)

(assert (=> b!937988 (= e!526744 (not call!40791))))

(assert (= (and d!113319 c!97682) b!937974))

(assert (= (and d!113319 (not c!97682)) b!937983))

(assert (= (and b!937983 c!97677) b!937985))

(assert (= (and b!937983 (not c!97677)) b!937972))

(assert (= (and b!937972 c!97680) b!937968))

(assert (= (and b!937972 (not c!97680)) b!937981))

(assert (= (or b!937968 b!937981) bm!40792))

(assert (= (or b!937985 bm!40792) bm!40789))

(assert (= (or b!937985 b!937968) bm!40791))

(assert (= (or b!937974 bm!40789) bm!40794))

(assert (= (or b!937974 bm!40791) bm!40793))

(assert (= (and d!113319 res!631189) b!937971))

(assert (= (and d!113319 c!97679) b!937979))

(assert (= (and d!113319 (not c!97679)) b!937973))

(assert (= (and d!113319 res!631188) b!937970))

(assert (= (and b!937970 res!631187) b!937984))

(assert (= (and b!937970 (not res!631186)) b!937977))

(assert (= (and b!937977 res!631191) b!937980))

(assert (= (and b!937970 res!631194) b!937975))

(assert (= (and b!937975 c!97681) b!937978))

(assert (= (and b!937975 (not c!97681)) b!937976))

(assert (= (and b!937978 res!631193) b!937986))

(assert (= (or b!937978 b!937976) bm!40790))

(assert (= (and b!937975 res!631190) b!937987))

(assert (= (and b!937987 c!97678) b!937969))

(assert (= (and b!937987 (not c!97678)) b!937988))

(assert (= (and b!937969 res!631192) b!937982))

(assert (= (or b!937969 b!937988) bm!40788))

(declare-fun b_lambda!14173 () Bool)

(assert (=> (not b_lambda!14173) (not b!937980)))

(assert (=> b!937980 t!27459))

(declare-fun b_and!29095 () Bool)

(assert (= b_and!29093 (and (=> t!27459 result!12111) b_and!29095)))

(declare-fun m!872597 () Bool)

(assert (=> b!937971 m!872597))

(assert (=> b!937971 m!872597))

(declare-fun m!872599 () Bool)

(assert (=> b!937971 m!872599))

(declare-fun m!872601 () Bool)

(assert (=> bm!40790 m!872601))

(declare-fun m!872603 () Bool)

(assert (=> bm!40793 m!872603))

(declare-fun m!872605 () Bool)

(assert (=> b!937986 m!872605))

(declare-fun m!872607 () Bool)

(assert (=> b!937982 m!872607))

(declare-fun m!872609 () Bool)

(assert (=> b!937974 m!872609))

(declare-fun m!872611 () Bool)

(assert (=> b!937979 m!872611))

(declare-fun m!872613 () Bool)

(assert (=> b!937979 m!872613))

(declare-fun m!872615 () Bool)

(assert (=> b!937979 m!872615))

(declare-fun m!872617 () Bool)

(assert (=> b!937979 m!872617))

(assert (=> b!937979 m!872221))

(declare-fun m!872619 () Bool)

(assert (=> b!937979 m!872619))

(declare-fun m!872621 () Bool)

(assert (=> b!937979 m!872621))

(declare-fun m!872623 () Bool)

(assert (=> b!937979 m!872623))

(declare-fun m!872625 () Bool)

(assert (=> b!937979 m!872625))

(declare-fun m!872627 () Bool)

(assert (=> b!937979 m!872627))

(declare-fun m!872629 () Bool)

(assert (=> b!937979 m!872629))

(assert (=> b!937979 m!872621))

(assert (=> b!937979 m!872629))

(declare-fun m!872631 () Bool)

(assert (=> b!937979 m!872631))

(declare-fun m!872633 () Bool)

(assert (=> b!937979 m!872633))

(declare-fun m!872635 () Bool)

(assert (=> b!937979 m!872635))

(assert (=> b!937979 m!872633))

(declare-fun m!872637 () Bool)

(assert (=> b!937979 m!872637))

(assert (=> b!937979 m!872613))

(declare-fun m!872639 () Bool)

(assert (=> b!937979 m!872639))

(assert (=> b!937979 m!872597))

(assert (=> bm!40794 m!872221))

(assert (=> d!113319 m!871739))

(assert (=> b!937984 m!872597))

(assert (=> b!937984 m!872597))

(assert (=> b!937984 m!872599))

(declare-fun m!872641 () Bool)

(assert (=> b!937980 m!872641))

(assert (=> b!937980 m!872641))

(assert (=> b!937980 m!871759))

(declare-fun m!872643 () Bool)

(assert (=> b!937980 m!872643))

(assert (=> b!937980 m!871759))

(assert (=> b!937980 m!872597))

(declare-fun m!872645 () Bool)

(assert (=> b!937980 m!872645))

(assert (=> b!937980 m!872597))

(assert (=> b!937977 m!872597))

(assert (=> b!937977 m!872597))

(declare-fun m!872647 () Bool)

(assert (=> b!937977 m!872647))

(declare-fun m!872649 () Bool)

(assert (=> bm!40788 m!872649))

(assert (=> b!937710 d!113319))

(assert (=> b!937710 d!113171))

(assert (=> b!937737 d!113309))

(assert (=> b!937737 d!113311))

(declare-fun b!937990 () Bool)

(declare-fun e!526751 () Option!492)

(declare-fun e!526752 () Option!492)

(assert (=> b!937990 (= e!526751 e!526752)))

(declare-fun c!97684 () Bool)

(assert (=> b!937990 (= c!97684 (and ((_ is Cons!19172) (toList!6075 lt!423184)) (not (= (_1!6727 (h!20318 (toList!6075 lt!423184))) (_1!6727 lt!422962)))))))

(declare-fun b!937991 () Bool)

(assert (=> b!937991 (= e!526752 (getValueByKey!486 (t!27460 (toList!6075 lt!423184)) (_1!6727 lt!422962)))))

(declare-fun b!937992 () Bool)

(assert (=> b!937992 (= e!526752 None!490)))

(declare-fun d!113321 () Bool)

(declare-fun c!97683 () Bool)

(assert (=> d!113321 (= c!97683 (and ((_ is Cons!19172) (toList!6075 lt!423184)) (= (_1!6727 (h!20318 (toList!6075 lt!423184))) (_1!6727 lt!422962))))))

(assert (=> d!113321 (= (getValueByKey!486 (toList!6075 lt!423184) (_1!6727 lt!422962)) e!526751)))

(declare-fun b!937989 () Bool)

(assert (=> b!937989 (= e!526751 (Some!491 (_2!6727 (h!20318 (toList!6075 lt!423184)))))))

(assert (= (and d!113321 c!97683) b!937989))

(assert (= (and d!113321 (not c!97683)) b!937990))

(assert (= (and b!937990 c!97684) b!937991))

(assert (= (and b!937990 (not c!97684)) b!937992))

(declare-fun m!872651 () Bool)

(assert (=> b!937991 m!872651))

(assert (=> b!937715 d!113321))

(declare-fun d!113323 () Bool)

(declare-fun e!526753 () Bool)

(assert (=> d!113323 e!526753))

(declare-fun res!631195 () Bool)

(assert (=> d!113323 (=> res!631195 e!526753)))

(declare-fun lt!423384 () Bool)

(assert (=> d!113323 (= res!631195 (not lt!423384))))

(declare-fun lt!423382 () Bool)

(assert (=> d!113323 (= lt!423384 lt!423382)))

(declare-fun lt!423381 () Unit!31564)

(declare-fun e!526754 () Unit!31564)

(assert (=> d!113323 (= lt!423381 e!526754)))

(declare-fun c!97685 () Bool)

(assert (=> d!113323 (= c!97685 lt!423382)))

(assert (=> d!113323 (= lt!423382 (containsKey!450 (toList!6075 lt!423147) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113323 (= (contains!5077 lt!423147 #b1000000000000000000000000000000000000000000000000000000000000000) lt!423384)))

(declare-fun b!937993 () Bool)

(declare-fun lt!423383 () Unit!31564)

(assert (=> b!937993 (= e!526754 lt!423383)))

(assert (=> b!937993 (= lt!423383 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 lt!423147) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!937993 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423147) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!937994 () Bool)

(declare-fun Unit!31588 () Unit!31564)

(assert (=> b!937994 (= e!526754 Unit!31588)))

(declare-fun b!937995 () Bool)

(assert (=> b!937995 (= e!526753 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423147) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113323 c!97685) b!937993))

(assert (= (and d!113323 (not c!97685)) b!937994))

(assert (= (and d!113323 (not res!631195)) b!937995))

(declare-fun m!872653 () Bool)

(assert (=> d!113323 m!872653))

(declare-fun m!872655 () Bool)

(assert (=> b!937993 m!872655))

(declare-fun m!872657 () Bool)

(assert (=> b!937993 m!872657))

(assert (=> b!937993 m!872657))

(declare-fun m!872659 () Bool)

(assert (=> b!937993 m!872659))

(assert (=> b!937995 m!872657))

(assert (=> b!937995 m!872657))

(assert (=> b!937995 m!872659))

(assert (=> bm!40757 d!113323))

(assert (=> b!937754 d!113183))

(declare-fun d!113325 () Bool)

(declare-fun e!526755 () Bool)

(assert (=> d!113325 e!526755))

(declare-fun res!631196 () Bool)

(assert (=> d!113325 (=> res!631196 e!526755)))

(declare-fun lt!423388 () Bool)

(assert (=> d!113325 (= res!631196 (not lt!423388))))

(declare-fun lt!423386 () Bool)

(assert (=> d!113325 (= lt!423388 lt!423386)))

(declare-fun lt!423385 () Unit!31564)

(declare-fun e!526756 () Unit!31564)

(assert (=> d!113325 (= lt!423385 e!526756)))

(declare-fun c!97686 () Bool)

(assert (=> d!113325 (= c!97686 lt!423386)))

(assert (=> d!113325 (= lt!423386 (containsKey!450 (toList!6075 lt!423147) (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> d!113325 (= (contains!5077 lt!423147 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) lt!423388)))

(declare-fun b!937996 () Bool)

(declare-fun lt!423387 () Unit!31564)

(assert (=> b!937996 (= e!526756 lt!423387)))

(assert (=> b!937996 (= lt!423387 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 lt!423147) (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!937996 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423147) (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!937997 () Bool)

(declare-fun Unit!31589 () Unit!31564)

(assert (=> b!937997 (= e!526756 Unit!31589)))

(declare-fun b!937998 () Bool)

(assert (=> b!937998 (= e!526755 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423147) (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))))

(assert (= (and d!113325 c!97686) b!937996))

(assert (= (and d!113325 (not c!97686)) b!937997))

(assert (= (and d!113325 (not res!631196)) b!937998))

(assert (=> d!113325 m!871995))

(declare-fun m!872661 () Bool)

(assert (=> d!113325 m!872661))

(assert (=> b!937996 m!871995))

(declare-fun m!872663 () Bool)

(assert (=> b!937996 m!872663))

(assert (=> b!937996 m!871995))

(declare-fun m!872665 () Bool)

(assert (=> b!937996 m!872665))

(assert (=> b!937996 m!872665))

(declare-fun m!872667 () Bool)

(assert (=> b!937996 m!872667))

(assert (=> b!937998 m!871995))

(assert (=> b!937998 m!872665))

(assert (=> b!937998 m!872665))

(assert (=> b!937998 m!872667))

(assert (=> b!937690 d!113325))

(declare-fun d!113327 () Bool)

(declare-fun e!526757 () Bool)

(assert (=> d!113327 e!526757))

(declare-fun res!631198 () Bool)

(assert (=> d!113327 (=> (not res!631198) (not e!526757))))

(declare-fun lt!423391 () ListLongMap!12119)

(assert (=> d!113327 (= res!631198 (contains!5077 lt!423391 (_1!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!423392 () List!19176)

(assert (=> d!113327 (= lt!423391 (ListLongMap!12120 lt!423392))))

(declare-fun lt!423389 () Unit!31564)

(declare-fun lt!423390 () Unit!31564)

(assert (=> d!113327 (= lt!423389 lt!423390)))

(assert (=> d!113327 (= (getValueByKey!486 lt!423392 (_1!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113327 (= lt!423390 (lemmaContainsTupThenGetReturnValue!260 lt!423392 (_1!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113327 (= lt!423392 (insertStrictlySorted!317 (toList!6075 call!40758) (_1!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113327 (= (+!2864 call!40758 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!423391)))

(declare-fun b!937999 () Bool)

(declare-fun res!631197 () Bool)

(assert (=> b!937999 (=> (not res!631197) (not e!526757))))

(assert (=> b!937999 (= res!631197 (= (getValueByKey!486 (toList!6075 lt!423391) (_1!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!938000 () Bool)

(assert (=> b!938000 (= e!526757 (contains!5080 (toList!6075 lt!423391) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113327 res!631198) b!937999))

(assert (= (and b!937999 res!631197) b!938000))

(declare-fun m!872669 () Bool)

(assert (=> d!113327 m!872669))

(declare-fun m!872671 () Bool)

(assert (=> d!113327 m!872671))

(declare-fun m!872673 () Bool)

(assert (=> d!113327 m!872673))

(declare-fun m!872675 () Bool)

(assert (=> d!113327 m!872675))

(declare-fun m!872677 () Bool)

(assert (=> b!937999 m!872677))

(declare-fun m!872679 () Bool)

(assert (=> b!938000 m!872679))

(assert (=> b!937657 d!113327))

(declare-fun d!113329 () Bool)

(declare-fun res!631199 () Bool)

(declare-fun e!526758 () Bool)

(assert (=> d!113329 (=> res!631199 e!526758)))

(assert (=> d!113329 (= res!631199 (and ((_ is Cons!19172) (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) (= (_1!6727 (h!20318 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) k0!1099)))))

(assert (=> d!113329 (= (containsKey!450 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099) e!526758)))

(declare-fun b!938001 () Bool)

(declare-fun e!526759 () Bool)

(assert (=> b!938001 (= e!526758 e!526759)))

(declare-fun res!631200 () Bool)

(assert (=> b!938001 (=> (not res!631200) (not e!526759))))

(assert (=> b!938001 (= res!631200 (and (or (not ((_ is Cons!19172) (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) (bvsle (_1!6727 (h!20318 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) k0!1099)) ((_ is Cons!19172) (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) (bvslt (_1!6727 (h!20318 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) k0!1099)))))

(declare-fun b!938002 () Bool)

(assert (=> b!938002 (= e!526759 (containsKey!450 (t!27460 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) k0!1099))))

(assert (= (and d!113329 (not res!631199)) b!938001))

(assert (= (and b!938001 res!631200) b!938002))

(declare-fun m!872681 () Bool)

(assert (=> b!938002 m!872681))

(assert (=> d!113179 d!113329))

(declare-fun d!113331 () Bool)

(declare-fun lt!423395 () Bool)

(declare-fun content!407 (List!19177) (InoxSet (_ BitVec 64)))

(assert (=> d!113331 (= lt!423395 (select (content!407 Nil!19174) (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!526765 () Bool)

(assert (=> d!113331 (= lt!423395 e!526765)))

(declare-fun res!631205 () Bool)

(assert (=> d!113331 (=> (not res!631205) (not e!526765))))

(assert (=> d!113331 (= res!631205 ((_ is Cons!19173) Nil!19174))))

(assert (=> d!113331 (= (contains!5079 Nil!19174 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) lt!423395)))

(declare-fun b!938007 () Bool)

(declare-fun e!526764 () Bool)

(assert (=> b!938007 (= e!526765 e!526764)))

(declare-fun res!631206 () Bool)

(assert (=> b!938007 (=> res!631206 e!526764)))

(assert (=> b!938007 (= res!631206 (= (h!20319 Nil!19174) (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938008 () Bool)

(assert (=> b!938008 (= e!526764 (contains!5079 (t!27461 Nil!19174) (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (= (and d!113331 res!631205) b!938007))

(assert (= (and b!938007 (not res!631206)) b!938008))

(declare-fun m!872683 () Bool)

(assert (=> d!113331 m!872683))

(assert (=> d!113331 m!871787))

(declare-fun m!872685 () Bool)

(assert (=> d!113331 m!872685))

(assert (=> b!938008 m!871787))

(declare-fun m!872687 () Bool)

(assert (=> b!938008 m!872687))

(assert (=> b!937717 d!113331))

(declare-fun d!113333 () Bool)

(assert (=> d!113333 (= (apply!849 lt!423207 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14325 (getValueByKey!486 (toList!6075 lt!423207) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26296 () Bool)

(assert (= bs!26296 d!113333))

(assert (=> bs!26296 m!872389))

(assert (=> bs!26296 m!872389))

(declare-fun m!872689 () Bool)

(assert (=> bs!26296 m!872689))

(assert (=> b!937756 d!113333))

(declare-fun d!113335 () Bool)

(assert (=> d!113335 (= (get!14325 (getValueByKey!486 (toList!6075 lt!422966) k0!1099)) (v!12706 (getValueByKey!486 (toList!6075 lt!422966) k0!1099)))))

(assert (=> d!113133 d!113335))

(assert (=> d!113133 d!113311))

(declare-fun d!113337 () Bool)

(declare-fun e!526766 () Bool)

(assert (=> d!113337 e!526766))

(declare-fun res!631207 () Bool)

(assert (=> d!113337 (=> res!631207 e!526766)))

(declare-fun lt!423399 () Bool)

(assert (=> d!113337 (= res!631207 (not lt!423399))))

(declare-fun lt!423397 () Bool)

(assert (=> d!113337 (= lt!423399 lt!423397)))

(declare-fun lt!423396 () Unit!31564)

(declare-fun e!526767 () Unit!31564)

(assert (=> d!113337 (= lt!423396 e!526767)))

(declare-fun c!97687 () Bool)

(assert (=> d!113337 (= c!97687 lt!423397)))

(assert (=> d!113337 (= lt!423397 (containsKey!450 (toList!6075 lt!423113) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113337 (= (contains!5077 lt!423113 #b1000000000000000000000000000000000000000000000000000000000000000) lt!423399)))

(declare-fun b!938009 () Bool)

(declare-fun lt!423398 () Unit!31564)

(assert (=> b!938009 (= e!526767 lt!423398)))

(assert (=> b!938009 (= lt!423398 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 lt!423113) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938009 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423113) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938010 () Bool)

(declare-fun Unit!31590 () Unit!31564)

(assert (=> b!938010 (= e!526767 Unit!31590)))

(declare-fun b!938011 () Bool)

(assert (=> b!938011 (= e!526766 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423113) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113337 c!97687) b!938009))

(assert (= (and d!113337 (not c!97687)) b!938010))

(assert (= (and d!113337 (not res!631207)) b!938011))

(declare-fun m!872691 () Bool)

(assert (=> d!113337 m!872691))

(declare-fun m!872693 () Bool)

(assert (=> b!938009 m!872693))

(assert (=> b!938009 m!872381))

(assert (=> b!938009 m!872381))

(declare-fun m!872695 () Bool)

(assert (=> b!938009 m!872695))

(assert (=> b!938011 m!872381))

(assert (=> b!938011 m!872381))

(assert (=> b!938011 m!872695))

(assert (=> bm!40750 d!113337))

(declare-fun d!113339 () Bool)

(declare-fun lt!423400 () Bool)

(assert (=> d!113339 (= lt!423400 (select (content!407 Nil!19174) (select (arr!27152 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun e!526769 () Bool)

(assert (=> d!113339 (= lt!423400 e!526769)))

(declare-fun res!631208 () Bool)

(assert (=> d!113339 (=> (not res!631208) (not e!526769))))

(assert (=> d!113339 (= res!631208 ((_ is Cons!19173) Nil!19174))))

(assert (=> d!113339 (= (contains!5079 Nil!19174 (select (arr!27152 _keys!1487) #b00000000000000000000000000000000)) lt!423400)))

(declare-fun b!938012 () Bool)

(declare-fun e!526768 () Bool)

(assert (=> b!938012 (= e!526769 e!526768)))

(declare-fun res!631209 () Bool)

(assert (=> b!938012 (=> res!631209 e!526768)))

(assert (=> b!938012 (= res!631209 (= (h!20319 Nil!19174) (select (arr!27152 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!938013 () Bool)

(assert (=> b!938013 (= e!526768 (contains!5079 (t!27461 Nil!19174) (select (arr!27152 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113339 res!631208) b!938012))

(assert (= (and b!938012 (not res!631209)) b!938013))

(assert (=> d!113339 m!872683))

(assert (=> d!113339 m!871913))

(declare-fun m!872697 () Bool)

(assert (=> d!113339 m!872697))

(assert (=> b!938013 m!871913))

(declare-fun m!872699 () Bool)

(assert (=> b!938013 m!872699))

(assert (=> b!937586 d!113339))

(declare-fun d!113341 () Bool)

(declare-fun e!526770 () Bool)

(assert (=> d!113341 e!526770))

(declare-fun res!631210 () Bool)

(assert (=> d!113341 (=> res!631210 e!526770)))

(declare-fun lt!423404 () Bool)

(assert (=> d!113341 (= res!631210 (not lt!423404))))

(declare-fun lt!423402 () Bool)

(assert (=> d!113341 (= lt!423404 lt!423402)))

(declare-fun lt!423401 () Unit!31564)

(declare-fun e!526771 () Unit!31564)

(assert (=> d!113341 (= lt!423401 e!526771)))

(declare-fun c!97688 () Bool)

(assert (=> d!113341 (= c!97688 lt!423402)))

(assert (=> d!113341 (= lt!423402 (containsKey!450 (toList!6075 lt!423113) (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> d!113341 (= (contains!5077 lt!423113 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) lt!423404)))

(declare-fun b!938014 () Bool)

(declare-fun lt!423403 () Unit!31564)

(assert (=> b!938014 (= e!526771 lt!423403)))

(assert (=> b!938014 (= lt!423403 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 lt!423113) (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!938014 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423113) (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!938015 () Bool)

(declare-fun Unit!31591 () Unit!31564)

(assert (=> b!938015 (= e!526771 Unit!31591)))

(declare-fun b!938016 () Bool)

(assert (=> b!938016 (= e!526770 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423113) (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (= (and d!113341 c!97688) b!938014))

(assert (= (and d!113341 (not c!97688)) b!938015))

(assert (= (and d!113341 (not res!631210)) b!938016))

(assert (=> d!113341 m!871787))

(declare-fun m!872701 () Bool)

(assert (=> d!113341 m!872701))

(assert (=> b!938014 m!871787))

(declare-fun m!872703 () Bool)

(assert (=> b!938014 m!872703))

(assert (=> b!938014 m!871787))

(assert (=> b!938014 m!872355))

(assert (=> b!938014 m!872355))

(declare-fun m!872705 () Bool)

(assert (=> b!938014 m!872705))

(assert (=> b!938016 m!871787))

(assert (=> b!938016 m!872355))

(assert (=> b!938016 m!872355))

(assert (=> b!938016 m!872705))

(assert (=> b!937660 d!113341))

(declare-fun d!113343 () Bool)

(declare-fun e!526772 () Bool)

(assert (=> d!113343 e!526772))

(declare-fun res!631212 () Bool)

(assert (=> d!113343 (=> (not res!631212) (not e!526772))))

(declare-fun lt!423407 () ListLongMap!12119)

(assert (=> d!113343 (= res!631212 (contains!5077 lt!423407 (_1!6727 (tuple2!13433 lt!423153 minValue!1173))))))

(declare-fun lt!423408 () List!19176)

(assert (=> d!113343 (= lt!423407 (ListLongMap!12120 lt!423408))))

(declare-fun lt!423405 () Unit!31564)

(declare-fun lt!423406 () Unit!31564)

(assert (=> d!113343 (= lt!423405 lt!423406)))

(assert (=> d!113343 (= (getValueByKey!486 lt!423408 (_1!6727 (tuple2!13433 lt!423153 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423153 minValue!1173))))))

(assert (=> d!113343 (= lt!423406 (lemmaContainsTupThenGetReturnValue!260 lt!423408 (_1!6727 (tuple2!13433 lt!423153 minValue!1173)) (_2!6727 (tuple2!13433 lt!423153 minValue!1173))))))

(assert (=> d!113343 (= lt!423408 (insertStrictlySorted!317 (toList!6075 lt!423145) (_1!6727 (tuple2!13433 lt!423153 minValue!1173)) (_2!6727 (tuple2!13433 lt!423153 minValue!1173))))))

(assert (=> d!113343 (= (+!2864 lt!423145 (tuple2!13433 lt!423153 minValue!1173)) lt!423407)))

(declare-fun b!938017 () Bool)

(declare-fun res!631211 () Bool)

(assert (=> b!938017 (=> (not res!631211) (not e!526772))))

(assert (=> b!938017 (= res!631211 (= (getValueByKey!486 (toList!6075 lt!423407) (_1!6727 (tuple2!13433 lt!423153 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423153 minValue!1173)))))))

(declare-fun b!938018 () Bool)

(assert (=> b!938018 (= e!526772 (contains!5080 (toList!6075 lt!423407) (tuple2!13433 lt!423153 minValue!1173)))))

(assert (= (and d!113343 res!631212) b!938017))

(assert (= (and b!938017 res!631211) b!938018))

(declare-fun m!872707 () Bool)

(assert (=> d!113343 m!872707))

(declare-fun m!872709 () Bool)

(assert (=> d!113343 m!872709))

(declare-fun m!872711 () Bool)

(assert (=> d!113343 m!872711))

(declare-fun m!872713 () Bool)

(assert (=> d!113343 m!872713))

(declare-fun m!872715 () Bool)

(assert (=> b!938017 m!872715))

(declare-fun m!872717 () Bool)

(assert (=> b!938018 m!872717))

(assert (=> b!937692 d!113343))

(declare-fun d!113345 () Bool)

(declare-fun e!526773 () Bool)

(assert (=> d!113345 e!526773))

(declare-fun res!631214 () Bool)

(assert (=> d!113345 (=> (not res!631214) (not e!526773))))

(declare-fun lt!423411 () ListLongMap!12119)

(assert (=> d!113345 (= res!631214 (contains!5077 lt!423411 (_1!6727 (tuple2!13433 lt!423139 zeroValue!1173))))))

(declare-fun lt!423412 () List!19176)

(assert (=> d!113345 (= lt!423411 (ListLongMap!12120 lt!423412))))

(declare-fun lt!423409 () Unit!31564)

(declare-fun lt!423410 () Unit!31564)

(assert (=> d!113345 (= lt!423409 lt!423410)))

(assert (=> d!113345 (= (getValueByKey!486 lt!423412 (_1!6727 (tuple2!13433 lt!423139 zeroValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423139 zeroValue!1173))))))

(assert (=> d!113345 (= lt!423410 (lemmaContainsTupThenGetReturnValue!260 lt!423412 (_1!6727 (tuple2!13433 lt!423139 zeroValue!1173)) (_2!6727 (tuple2!13433 lt!423139 zeroValue!1173))))))

(assert (=> d!113345 (= lt!423412 (insertStrictlySorted!317 (toList!6075 lt!423140) (_1!6727 (tuple2!13433 lt!423139 zeroValue!1173)) (_2!6727 (tuple2!13433 lt!423139 zeroValue!1173))))))

(assert (=> d!113345 (= (+!2864 lt!423140 (tuple2!13433 lt!423139 zeroValue!1173)) lt!423411)))

(declare-fun b!938019 () Bool)

(declare-fun res!631213 () Bool)

(assert (=> b!938019 (=> (not res!631213) (not e!526773))))

(assert (=> b!938019 (= res!631213 (= (getValueByKey!486 (toList!6075 lt!423411) (_1!6727 (tuple2!13433 lt!423139 zeroValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423139 zeroValue!1173)))))))

(declare-fun b!938020 () Bool)

(assert (=> b!938020 (= e!526773 (contains!5080 (toList!6075 lt!423411) (tuple2!13433 lt!423139 zeroValue!1173)))))

(assert (= (and d!113345 res!631214) b!938019))

(assert (= (and b!938019 res!631213) b!938020))

(declare-fun m!872719 () Bool)

(assert (=> d!113345 m!872719))

(declare-fun m!872721 () Bool)

(assert (=> d!113345 m!872721))

(declare-fun m!872723 () Bool)

(assert (=> d!113345 m!872723))

(declare-fun m!872725 () Bool)

(assert (=> d!113345 m!872725))

(declare-fun m!872727 () Bool)

(assert (=> b!938019 m!872727))

(declare-fun m!872729 () Bool)

(assert (=> b!938020 m!872729))

(assert (=> b!937692 d!113345))

(declare-fun d!113347 () Bool)

(assert (=> d!113347 (= (apply!849 lt!423155 lt!423150) (get!14325 (getValueByKey!486 (toList!6075 lt!423155) lt!423150)))))

(declare-fun bs!26297 () Bool)

(assert (= bs!26297 d!113347))

(declare-fun m!872731 () Bool)

(assert (=> bs!26297 m!872731))

(assert (=> bs!26297 m!872731))

(declare-fun m!872733 () Bool)

(assert (=> bs!26297 m!872733))

(assert (=> b!937692 d!113347))

(declare-fun d!113349 () Bool)

(assert (=> d!113349 (= (apply!849 (+!2864 lt!423155 (tuple2!13433 lt!423142 minValue!1173)) lt!423150) (get!14325 (getValueByKey!486 (toList!6075 (+!2864 lt!423155 (tuple2!13433 lt!423142 minValue!1173))) lt!423150)))))

(declare-fun bs!26298 () Bool)

(assert (= bs!26298 d!113349))

(declare-fun m!872735 () Bool)

(assert (=> bs!26298 m!872735))

(assert (=> bs!26298 m!872735))

(declare-fun m!872737 () Bool)

(assert (=> bs!26298 m!872737))

(assert (=> b!937692 d!113349))

(declare-fun d!113351 () Bool)

(assert (=> d!113351 (= (apply!849 lt!423140 lt!423148) (get!14325 (getValueByKey!486 (toList!6075 lt!423140) lt!423148)))))

(declare-fun bs!26299 () Bool)

(assert (= bs!26299 d!113351))

(declare-fun m!872739 () Bool)

(assert (=> bs!26299 m!872739))

(assert (=> bs!26299 m!872739))

(declare-fun m!872741 () Bool)

(assert (=> bs!26299 m!872741))

(assert (=> b!937692 d!113351))

(declare-fun d!113353 () Bool)

(declare-fun e!526774 () Bool)

(assert (=> d!113353 e!526774))

(declare-fun res!631216 () Bool)

(assert (=> d!113353 (=> (not res!631216) (not e!526774))))

(declare-fun lt!423415 () ListLongMap!12119)

(assert (=> d!113353 (= res!631216 (contains!5077 lt!423415 (_1!6727 (tuple2!13433 lt!423151 zeroValue!1173))))))

(declare-fun lt!423416 () List!19176)

(assert (=> d!113353 (= lt!423415 (ListLongMap!12120 lt!423416))))

(declare-fun lt!423413 () Unit!31564)

(declare-fun lt!423414 () Unit!31564)

(assert (=> d!113353 (= lt!423413 lt!423414)))

(assert (=> d!113353 (= (getValueByKey!486 lt!423416 (_1!6727 (tuple2!13433 lt!423151 zeroValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423151 zeroValue!1173))))))

(assert (=> d!113353 (= lt!423414 (lemmaContainsTupThenGetReturnValue!260 lt!423416 (_1!6727 (tuple2!13433 lt!423151 zeroValue!1173)) (_2!6727 (tuple2!13433 lt!423151 zeroValue!1173))))))

(assert (=> d!113353 (= lt!423416 (insertStrictlySorted!317 (toList!6075 lt!423144) (_1!6727 (tuple2!13433 lt!423151 zeroValue!1173)) (_2!6727 (tuple2!13433 lt!423151 zeroValue!1173))))))

(assert (=> d!113353 (= (+!2864 lt!423144 (tuple2!13433 lt!423151 zeroValue!1173)) lt!423415)))

(declare-fun b!938021 () Bool)

(declare-fun res!631215 () Bool)

(assert (=> b!938021 (=> (not res!631215) (not e!526774))))

(assert (=> b!938021 (= res!631215 (= (getValueByKey!486 (toList!6075 lt!423415) (_1!6727 (tuple2!13433 lt!423151 zeroValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423151 zeroValue!1173)))))))

(declare-fun b!938022 () Bool)

(assert (=> b!938022 (= e!526774 (contains!5080 (toList!6075 lt!423415) (tuple2!13433 lt!423151 zeroValue!1173)))))

(assert (= (and d!113353 res!631216) b!938021))

(assert (= (and b!938021 res!631215) b!938022))

(declare-fun m!872743 () Bool)

(assert (=> d!113353 m!872743))

(declare-fun m!872745 () Bool)

(assert (=> d!113353 m!872745))

(declare-fun m!872747 () Bool)

(assert (=> d!113353 m!872747))

(declare-fun m!872749 () Bool)

(assert (=> d!113353 m!872749))

(declare-fun m!872751 () Bool)

(assert (=> b!938021 m!872751))

(declare-fun m!872753 () Bool)

(assert (=> b!938022 m!872753))

(assert (=> b!937692 d!113353))

(declare-fun d!113355 () Bool)

(declare-fun e!526775 () Bool)

(assert (=> d!113355 e!526775))

(declare-fun res!631217 () Bool)

(assert (=> d!113355 (=> res!631217 e!526775)))

(declare-fun lt!423420 () Bool)

(assert (=> d!113355 (= res!631217 (not lt!423420))))

(declare-fun lt!423418 () Bool)

(assert (=> d!113355 (= lt!423420 lt!423418)))

(declare-fun lt!423417 () Unit!31564)

(declare-fun e!526776 () Unit!31564)

(assert (=> d!113355 (= lt!423417 e!526776)))

(declare-fun c!97689 () Bool)

(assert (=> d!113355 (= c!97689 lt!423418)))

(assert (=> d!113355 (= lt!423418 (containsKey!450 (toList!6075 (+!2864 lt!423144 (tuple2!13433 lt!423151 zeroValue!1173))) lt!423152))))

(assert (=> d!113355 (= (contains!5077 (+!2864 lt!423144 (tuple2!13433 lt!423151 zeroValue!1173)) lt!423152) lt!423420)))

(declare-fun b!938023 () Bool)

(declare-fun lt!423419 () Unit!31564)

(assert (=> b!938023 (= e!526776 lt!423419)))

(assert (=> b!938023 (= lt!423419 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 (+!2864 lt!423144 (tuple2!13433 lt!423151 zeroValue!1173))) lt!423152))))

(assert (=> b!938023 (isDefined!358 (getValueByKey!486 (toList!6075 (+!2864 lt!423144 (tuple2!13433 lt!423151 zeroValue!1173))) lt!423152))))

(declare-fun b!938024 () Bool)

(declare-fun Unit!31592 () Unit!31564)

(assert (=> b!938024 (= e!526776 Unit!31592)))

(declare-fun b!938025 () Bool)

(assert (=> b!938025 (= e!526775 (isDefined!358 (getValueByKey!486 (toList!6075 (+!2864 lt!423144 (tuple2!13433 lt!423151 zeroValue!1173))) lt!423152)))))

(assert (= (and d!113355 c!97689) b!938023))

(assert (= (and d!113355 (not c!97689)) b!938024))

(assert (= (and d!113355 (not res!631217)) b!938025))

(declare-fun m!872755 () Bool)

(assert (=> d!113355 m!872755))

(declare-fun m!872757 () Bool)

(assert (=> b!938023 m!872757))

(declare-fun m!872759 () Bool)

(assert (=> b!938023 m!872759))

(assert (=> b!938023 m!872759))

(declare-fun m!872761 () Bool)

(assert (=> b!938023 m!872761))

(assert (=> b!938025 m!872759))

(assert (=> b!938025 m!872759))

(assert (=> b!938025 m!872761))

(assert (=> b!937692 d!113355))

(declare-fun d!113357 () Bool)

(assert (=> d!113357 (= (apply!849 (+!2864 lt!423140 (tuple2!13433 lt!423139 zeroValue!1173)) lt!423148) (apply!849 lt!423140 lt!423148))))

(declare-fun lt!423421 () Unit!31564)

(assert (=> d!113357 (= lt!423421 (choose!1563 lt!423140 lt!423139 zeroValue!1173 lt!423148))))

(declare-fun e!526777 () Bool)

(assert (=> d!113357 e!526777))

(declare-fun res!631218 () Bool)

(assert (=> d!113357 (=> (not res!631218) (not e!526777))))

(assert (=> d!113357 (= res!631218 (contains!5077 lt!423140 lt!423148))))

(assert (=> d!113357 (= (addApplyDifferent!433 lt!423140 lt!423139 zeroValue!1173 lt!423148) lt!423421)))

(declare-fun b!938026 () Bool)

(assert (=> b!938026 (= e!526777 (not (= lt!423148 lt!423139)))))

(assert (= (and d!113357 res!631218) b!938026))

(assert (=> d!113357 m!872027))

(declare-fun m!872763 () Bool)

(assert (=> d!113357 m!872763))

(assert (=> d!113357 m!872029))

(assert (=> d!113357 m!872031))

(declare-fun m!872765 () Bool)

(assert (=> d!113357 m!872765))

(assert (=> d!113357 m!872029))

(assert (=> b!937692 d!113357))

(assert (=> b!937692 d!113305))

(declare-fun d!113359 () Bool)

(assert (=> d!113359 (= (apply!849 (+!2864 lt!423155 (tuple2!13433 lt!423142 minValue!1173)) lt!423150) (apply!849 lt!423155 lt!423150))))

(declare-fun lt!423422 () Unit!31564)

(assert (=> d!113359 (= lt!423422 (choose!1563 lt!423155 lt!423142 minValue!1173 lt!423150))))

(declare-fun e!526778 () Bool)

(assert (=> d!113359 e!526778))

(declare-fun res!631219 () Bool)

(assert (=> d!113359 (=> (not res!631219) (not e!526778))))

(assert (=> d!113359 (= res!631219 (contains!5077 lt!423155 lt!423150))))

(assert (=> d!113359 (= (addApplyDifferent!433 lt!423155 lt!423142 minValue!1173 lt!423150) lt!423422)))

(declare-fun b!938027 () Bool)

(assert (=> b!938027 (= e!526778 (not (= lt!423150 lt!423142)))))

(assert (= (and d!113359 res!631219) b!938027))

(assert (=> d!113359 m!872037))

(declare-fun m!872767 () Bool)

(assert (=> d!113359 m!872767))

(assert (=> d!113359 m!872021))

(assert (=> d!113359 m!872023))

(declare-fun m!872769 () Bool)

(assert (=> d!113359 m!872769))

(assert (=> d!113359 m!872021))

(assert (=> b!937692 d!113359))

(declare-fun d!113361 () Bool)

(assert (=> d!113361 (= (apply!849 (+!2864 lt!423145 (tuple2!13433 lt!423153 minValue!1173)) lt!423154) (get!14325 (getValueByKey!486 (toList!6075 (+!2864 lt!423145 (tuple2!13433 lt!423153 minValue!1173))) lt!423154)))))

(declare-fun bs!26300 () Bool)

(assert (= bs!26300 d!113361))

(declare-fun m!872771 () Bool)

(assert (=> bs!26300 m!872771))

(assert (=> bs!26300 m!872771))

(declare-fun m!872773 () Bool)

(assert (=> bs!26300 m!872773))

(assert (=> b!937692 d!113361))

(declare-fun d!113363 () Bool)

(assert (=> d!113363 (= (apply!849 (+!2864 lt!423145 (tuple2!13433 lt!423153 minValue!1173)) lt!423154) (apply!849 lt!423145 lt!423154))))

(declare-fun lt!423423 () Unit!31564)

(assert (=> d!113363 (= lt!423423 (choose!1563 lt!423145 lt!423153 minValue!1173 lt!423154))))

(declare-fun e!526779 () Bool)

(assert (=> d!113363 e!526779))

(declare-fun res!631220 () Bool)

(assert (=> d!113363 (=> (not res!631220) (not e!526779))))

(assert (=> d!113363 (= res!631220 (contains!5077 lt!423145 lt!423154))))

(assert (=> d!113363 (= (addApplyDifferent!433 lt!423145 lt!423153 minValue!1173 lt!423154) lt!423423)))

(declare-fun b!938028 () Bool)

(assert (=> b!938028 (= e!526779 (not (= lt!423154 lt!423153)))))

(assert (= (and d!113363 res!631220) b!938028))

(assert (=> d!113363 m!872025))

(declare-fun m!872775 () Bool)

(assert (=> d!113363 m!872775))

(assert (=> d!113363 m!872011))

(assert (=> d!113363 m!872013))

(declare-fun m!872777 () Bool)

(assert (=> d!113363 m!872777))

(assert (=> d!113363 m!872011))

(assert (=> b!937692 d!113363))

(declare-fun d!113365 () Bool)

(assert (=> d!113365 (= (apply!849 (+!2864 lt!423140 (tuple2!13433 lt!423139 zeroValue!1173)) lt!423148) (get!14325 (getValueByKey!486 (toList!6075 (+!2864 lt!423140 (tuple2!13433 lt!423139 zeroValue!1173))) lt!423148)))))

(declare-fun bs!26301 () Bool)

(assert (= bs!26301 d!113365))

(declare-fun m!872779 () Bool)

(assert (=> bs!26301 m!872779))

(assert (=> bs!26301 m!872779))

(declare-fun m!872781 () Bool)

(assert (=> bs!26301 m!872781))

(assert (=> b!937692 d!113365))

(declare-fun d!113367 () Bool)

(assert (=> d!113367 (contains!5077 (+!2864 lt!423144 (tuple2!13433 lt!423151 zeroValue!1173)) lt!423152)))

(declare-fun lt!423424 () Unit!31564)

(assert (=> d!113367 (= lt!423424 (choose!1565 lt!423144 lt!423151 zeroValue!1173 lt!423152))))

(assert (=> d!113367 (contains!5077 lt!423144 lt!423152)))

(assert (=> d!113367 (= (addStillContains!553 lt!423144 lt!423151 zeroValue!1173 lt!423152) lt!423424)))

(declare-fun bs!26302 () Bool)

(assert (= bs!26302 d!113367))

(assert (=> bs!26302 m!872033))

(assert (=> bs!26302 m!872033))

(assert (=> bs!26302 m!872035))

(declare-fun m!872783 () Bool)

(assert (=> bs!26302 m!872783))

(declare-fun m!872785 () Bool)

(assert (=> bs!26302 m!872785))

(assert (=> b!937692 d!113367))

(declare-fun d!113369 () Bool)

(assert (=> d!113369 (= (apply!849 lt!423145 lt!423154) (get!14325 (getValueByKey!486 (toList!6075 lt!423145) lt!423154)))))

(declare-fun bs!26303 () Bool)

(assert (= bs!26303 d!113369))

(declare-fun m!872787 () Bool)

(assert (=> bs!26303 m!872787))

(assert (=> bs!26303 m!872787))

(declare-fun m!872789 () Bool)

(assert (=> bs!26303 m!872789))

(assert (=> b!937692 d!113369))

(declare-fun d!113371 () Bool)

(declare-fun e!526780 () Bool)

(assert (=> d!113371 e!526780))

(declare-fun res!631222 () Bool)

(assert (=> d!113371 (=> (not res!631222) (not e!526780))))

(declare-fun lt!423427 () ListLongMap!12119)

(assert (=> d!113371 (= res!631222 (contains!5077 lt!423427 (_1!6727 (tuple2!13433 lt!423142 minValue!1173))))))

(declare-fun lt!423428 () List!19176)

(assert (=> d!113371 (= lt!423427 (ListLongMap!12120 lt!423428))))

(declare-fun lt!423425 () Unit!31564)

(declare-fun lt!423426 () Unit!31564)

(assert (=> d!113371 (= lt!423425 lt!423426)))

(assert (=> d!113371 (= (getValueByKey!486 lt!423428 (_1!6727 (tuple2!13433 lt!423142 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423142 minValue!1173))))))

(assert (=> d!113371 (= lt!423426 (lemmaContainsTupThenGetReturnValue!260 lt!423428 (_1!6727 (tuple2!13433 lt!423142 minValue!1173)) (_2!6727 (tuple2!13433 lt!423142 minValue!1173))))))

(assert (=> d!113371 (= lt!423428 (insertStrictlySorted!317 (toList!6075 lt!423155) (_1!6727 (tuple2!13433 lt!423142 minValue!1173)) (_2!6727 (tuple2!13433 lt!423142 minValue!1173))))))

(assert (=> d!113371 (= (+!2864 lt!423155 (tuple2!13433 lt!423142 minValue!1173)) lt!423427)))

(declare-fun b!938029 () Bool)

(declare-fun res!631221 () Bool)

(assert (=> b!938029 (=> (not res!631221) (not e!526780))))

(assert (=> b!938029 (= res!631221 (= (getValueByKey!486 (toList!6075 lt!423427) (_1!6727 (tuple2!13433 lt!423142 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 lt!423142 minValue!1173)))))))

(declare-fun b!938030 () Bool)

(assert (=> b!938030 (= e!526780 (contains!5080 (toList!6075 lt!423427) (tuple2!13433 lt!423142 minValue!1173)))))

(assert (= (and d!113371 res!631222) b!938029))

(assert (= (and b!938029 res!631221) b!938030))

(declare-fun m!872791 () Bool)

(assert (=> d!113371 m!872791))

(declare-fun m!872793 () Bool)

(assert (=> d!113371 m!872793))

(declare-fun m!872795 () Bool)

(assert (=> d!113371 m!872795))

(declare-fun m!872797 () Bool)

(assert (=> d!113371 m!872797))

(declare-fun m!872799 () Bool)

(assert (=> b!938029 m!872799))

(declare-fun m!872801 () Bool)

(assert (=> b!938030 m!872801))

(assert (=> b!937692 d!113371))

(declare-fun d!113373 () Bool)

(assert (=> d!113373 (= (apply!849 lt!423147 (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14325 (getValueByKey!486 (toList!6075 lt!423147) (select (arr!27152 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))))

(declare-fun bs!26304 () Bool)

(assert (= bs!26304 d!113373))

(assert (=> bs!26304 m!871995))

(assert (=> bs!26304 m!872665))

(assert (=> bs!26304 m!872665))

(declare-fun m!872803 () Bool)

(assert (=> bs!26304 m!872803))

(assert (=> b!937693 d!113373))

(declare-fun d!113375 () Bool)

(declare-fun c!97690 () Bool)

(assert (=> d!113375 (= c!97690 ((_ is ValueCellFull!9647) (select (arr!27151 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun e!526781 () V!31975)

(assert (=> d!113375 (= (get!14324 (select (arr!27151 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!526781)))

(declare-fun b!938031 () Bool)

(assert (=> b!938031 (= e!526781 (get!14326 (select (arr!27151 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!938032 () Bool)

(assert (=> b!938032 (= e!526781 (get!14327 (select (arr!27151 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113375 c!97690) b!938031))

(assert (= (and d!113375 (not c!97690)) b!938032))

(assert (=> b!938031 m!872041))

(assert (=> b!938031 m!871759))

(declare-fun m!872805 () Bool)

(assert (=> b!938031 m!872805))

(assert (=> b!938032 m!872041))

(assert (=> b!938032 m!871759))

(declare-fun m!872807 () Bool)

(assert (=> b!938032 m!872807))

(assert (=> b!937693 d!113375))

(declare-fun d!113377 () Bool)

(declare-fun e!526782 () Bool)

(assert (=> d!113377 e!526782))

(declare-fun res!631224 () Bool)

(assert (=> d!113377 (=> (not res!631224) (not e!526782))))

(declare-fun lt!423431 () ListLongMap!12119)

(assert (=> d!113377 (= res!631224 (contains!5077 lt!423431 (_1!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!423432 () List!19176)

(assert (=> d!113377 (= lt!423431 (ListLongMap!12120 lt!423432))))

(declare-fun lt!423429 () Unit!31564)

(declare-fun lt!423430 () Unit!31564)

(assert (=> d!113377 (= lt!423429 lt!423430)))

(assert (=> d!113377 (= (getValueByKey!486 lt!423432 (_1!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113377 (= lt!423430 (lemmaContainsTupThenGetReturnValue!260 lt!423432 (_1!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113377 (= lt!423432 (insertStrictlySorted!317 (toList!6075 call!40773) (_1!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113377 (= (+!2864 call!40773 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!423431)))

(declare-fun b!938033 () Bool)

(declare-fun res!631223 () Bool)

(assert (=> b!938033 (=> (not res!631223) (not e!526782))))

(assert (=> b!938033 (= res!631223 (= (getValueByKey!486 (toList!6075 lt!423431) (_1!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!938034 () Bool)

(assert (=> b!938034 (= e!526782 (contains!5080 (toList!6075 lt!423431) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113377 res!631224) b!938033))

(assert (= (and b!938033 res!631223) b!938034))

(declare-fun m!872809 () Bool)

(assert (=> d!113377 m!872809))

(declare-fun m!872811 () Bool)

(assert (=> d!113377 m!872811))

(declare-fun m!872813 () Bool)

(assert (=> d!113377 m!872813))

(declare-fun m!872815 () Bool)

(assert (=> d!113377 m!872815))

(declare-fun m!872817 () Bool)

(assert (=> b!938033 m!872817))

(declare-fun m!872819 () Bool)

(assert (=> b!938034 m!872819))

(assert (=> b!937744 d!113377))

(declare-fun d!113379 () Bool)

(assert (=> d!113379 (isDefined!358 (getValueByKey!486 (toList!6075 lt!422967) k0!1099))))

(declare-fun lt!423433 () Unit!31564)

(assert (=> d!113379 (= lt!423433 (choose!1567 (toList!6075 lt!422967) k0!1099))))

(declare-fun e!526783 () Bool)

(assert (=> d!113379 e!526783))

(declare-fun res!631225 () Bool)

(assert (=> d!113379 (=> (not res!631225) (not e!526783))))

(assert (=> d!113379 (= res!631225 (isStrictlySorted!499 (toList!6075 lt!422967)))))

(assert (=> d!113379 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 lt!422967) k0!1099) lt!423433)))

(declare-fun b!938035 () Bool)

(assert (=> b!938035 (= e!526783 (containsKey!450 (toList!6075 lt!422967) k0!1099))))

(assert (= (and d!113379 res!631225) b!938035))

(assert (=> d!113379 m!871991))

(assert (=> d!113379 m!871991))

(assert (=> d!113379 m!871993))

(declare-fun m!872821 () Bool)

(assert (=> d!113379 m!872821))

(declare-fun m!872823 () Bool)

(assert (=> d!113379 m!872823))

(assert (=> b!938035 m!871987))

(assert (=> b!937678 d!113379))

(declare-fun d!113381 () Bool)

(assert (=> d!113381 (= (isDefined!358 (getValueByKey!486 (toList!6075 lt!422967) k0!1099)) (not (isEmpty!702 (getValueByKey!486 (toList!6075 lt!422967) k0!1099))))))

(declare-fun bs!26305 () Bool)

(assert (= bs!26305 d!113381))

(assert (=> bs!26305 m!871991))

(declare-fun m!872825 () Bool)

(assert (=> bs!26305 m!872825))

(assert (=> b!937678 d!113381))

(assert (=> b!937678 d!113235))

(declare-fun b!938036 () Bool)

(declare-fun e!526785 () Bool)

(assert (=> b!938036 (= e!526785 (contains!5079 (ite c!97610 (Cons!19173 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19174) Nil!19174) (select (arr!27152 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun b!938037 () Bool)

(declare-fun e!526787 () Bool)

(declare-fun e!526786 () Bool)

(assert (=> b!938037 (= e!526787 e!526786)))

(declare-fun res!631228 () Bool)

(assert (=> b!938037 (=> (not res!631228) (not e!526786))))

(assert (=> b!938037 (= res!631228 (not e!526785))))

(declare-fun res!631226 () Bool)

(assert (=> b!938037 (=> (not res!631226) (not e!526785))))

(assert (=> b!938037 (= res!631226 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun d!113383 () Bool)

(declare-fun res!631227 () Bool)

(assert (=> d!113383 (=> res!631227 e!526787)))

(assert (=> d!113383 (= res!631227 (bvsge (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(assert (=> d!113383 (= (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97610 (Cons!19173 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19174) Nil!19174)) e!526787)))

(declare-fun b!938038 () Bool)

(declare-fun e!526784 () Bool)

(declare-fun call!40798 () Bool)

(assert (=> b!938038 (= e!526784 call!40798)))

(declare-fun b!938039 () Bool)

(assert (=> b!938039 (= e!526784 call!40798)))

(declare-fun b!938040 () Bool)

(assert (=> b!938040 (= e!526786 e!526784)))

(declare-fun c!97691 () Bool)

(assert (=> b!938040 (= c!97691 (validKeyInArray!0 (select (arr!27152 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))))

(declare-fun bm!40795 () Bool)

(assert (=> bm!40795 (= call!40798 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!97691 (Cons!19173 (select (arr!27152 _keys!1487) (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (ite c!97610 (Cons!19173 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19174) Nil!19174)) (ite c!97610 (Cons!19173 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19174) Nil!19174))))))

(assert (= (and d!113383 (not res!631227)) b!938037))

(assert (= (and b!938037 res!631226) b!938036))

(assert (= (and b!938037 res!631228) b!938040))

(assert (= (and b!938040 c!97691) b!938038))

(assert (= (and b!938040 (not c!97691)) b!938039))

(assert (= (or b!938038 b!938039) bm!40795))

(assert (=> b!938036 m!872597))

(assert (=> b!938036 m!872597))

(declare-fun m!872827 () Bool)

(assert (=> b!938036 m!872827))

(assert (=> b!938037 m!872597))

(assert (=> b!938037 m!872597))

(assert (=> b!938037 m!872599))

(assert (=> b!938040 m!872597))

(assert (=> b!938040 m!872597))

(assert (=> b!938040 m!872599))

(assert (=> bm!40795 m!872597))

(declare-fun m!872829 () Bool)

(assert (=> bm!40795 m!872829))

(assert (=> bm!40764 d!113383))

(assert (=> b!937680 d!113381))

(assert (=> b!937680 d!113235))

(declare-fun d!113385 () Bool)

(assert (=> d!113385 (arrayContainsKey!0 _keys!1487 lt!423058 #b00000000000000000000000000000000)))

(declare-fun lt!423436 () Unit!31564)

(declare-fun choose!13 (array!56423 (_ BitVec 64) (_ BitVec 32)) Unit!31564)

(assert (=> d!113385 (= lt!423436 (choose!13 _keys!1487 lt!423058 #b00000000000000000000000000000000))))

(assert (=> d!113385 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!113385 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!423058 #b00000000000000000000000000000000) lt!423436)))

(declare-fun bs!26306 () Bool)

(assert (= bs!26306 d!113385))

(assert (=> bs!26306 m!871931))

(declare-fun m!872831 () Bool)

(assert (=> bs!26306 m!872831))

(assert (=> b!937608 d!113385))

(declare-fun d!113387 () Bool)

(declare-fun res!631229 () Bool)

(declare-fun e!526788 () Bool)

(assert (=> d!113387 (=> res!631229 e!526788)))

(assert (=> d!113387 (= res!631229 (= (select (arr!27152 _keys!1487) #b00000000000000000000000000000000) lt!423058))))

(assert (=> d!113387 (= (arrayContainsKey!0 _keys!1487 lt!423058 #b00000000000000000000000000000000) e!526788)))

(declare-fun b!938041 () Bool)

(declare-fun e!526789 () Bool)

(assert (=> b!938041 (= e!526788 e!526789)))

(declare-fun res!631230 () Bool)

(assert (=> b!938041 (=> (not res!631230) (not e!526789))))

(assert (=> b!938041 (= res!631230 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27613 _keys!1487)))))

(declare-fun b!938042 () Bool)

(assert (=> b!938042 (= e!526789 (arrayContainsKey!0 _keys!1487 lt!423058 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!113387 (not res!631229)) b!938041))

(assert (= (and b!938041 res!631230) b!938042))

(assert (=> d!113387 m!871913))

(declare-fun m!872833 () Bool)

(assert (=> b!938042 m!872833))

(assert (=> b!937608 d!113387))

(declare-fun d!113389 () Bool)

(declare-fun lt!423443 () SeekEntryResult!8981)

(assert (=> d!113389 (and (or ((_ is Undefined!8981) lt!423443) (not ((_ is Found!8981) lt!423443)) (and (bvsge (index!38296 lt!423443) #b00000000000000000000000000000000) (bvslt (index!38296 lt!423443) (size!27613 _keys!1487)))) (or ((_ is Undefined!8981) lt!423443) ((_ is Found!8981) lt!423443) (not ((_ is MissingZero!8981) lt!423443)) (and (bvsge (index!38295 lt!423443) #b00000000000000000000000000000000) (bvslt (index!38295 lt!423443) (size!27613 _keys!1487)))) (or ((_ is Undefined!8981) lt!423443) ((_ is Found!8981) lt!423443) ((_ is MissingZero!8981) lt!423443) (not ((_ is MissingVacant!8981) lt!423443)) (and (bvsge (index!38298 lt!423443) #b00000000000000000000000000000000) (bvslt (index!38298 lt!423443) (size!27613 _keys!1487)))) (or ((_ is Undefined!8981) lt!423443) (ite ((_ is Found!8981) lt!423443) (= (select (arr!27152 _keys!1487) (index!38296 lt!423443)) (select (arr!27152 _keys!1487) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8981) lt!423443) (= (select (arr!27152 _keys!1487) (index!38295 lt!423443)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8981) lt!423443) (= (select (arr!27152 _keys!1487) (index!38298 lt!423443)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!526798 () SeekEntryResult!8981)

(assert (=> d!113389 (= lt!423443 e!526798)))

(declare-fun c!97699 () Bool)

(declare-fun lt!423444 () SeekEntryResult!8981)

(assert (=> d!113389 (= c!97699 (and ((_ is Intermediate!8981) lt!423444) (undefined!9793 lt!423444)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56423 (_ BitVec 32)) SeekEntryResult!8981)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!113389 (= lt!423444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!27152 _keys!1487) #b00000000000000000000000000000000) mask!1881) (select (arr!27152 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881))))

(assert (=> d!113389 (validMask!0 mask!1881)))

(assert (=> d!113389 (= (seekEntryOrOpen!0 (select (arr!27152 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) lt!423443)))

(declare-fun b!938055 () Bool)

(declare-fun c!97700 () Bool)

(declare-fun lt!423445 () (_ BitVec 64))

(assert (=> b!938055 (= c!97700 (= lt!423445 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!526796 () SeekEntryResult!8981)

(declare-fun e!526797 () SeekEntryResult!8981)

(assert (=> b!938055 (= e!526796 e!526797)))

(declare-fun b!938056 () Bool)

(assert (=> b!938056 (= e!526798 e!526796)))

(assert (=> b!938056 (= lt!423445 (select (arr!27152 _keys!1487) (index!38297 lt!423444)))))

(declare-fun c!97698 () Bool)

(assert (=> b!938056 (= c!97698 (= lt!423445 (select (arr!27152 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!938057 () Bool)

(assert (=> b!938057 (= e!526798 Undefined!8981)))

(declare-fun b!938058 () Bool)

(assert (=> b!938058 (= e!526797 (MissingZero!8981 (index!38297 lt!423444)))))

(declare-fun b!938059 () Bool)

(assert (=> b!938059 (= e!526796 (Found!8981 (index!38297 lt!423444)))))

(declare-fun b!938060 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56423 (_ BitVec 32)) SeekEntryResult!8981)

(assert (=> b!938060 (= e!526797 (seekKeyOrZeroReturnVacant!0 (x!80427 lt!423444) (index!38297 lt!423444) (index!38297 lt!423444) (select (arr!27152 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881))))

(assert (= (and d!113389 c!97699) b!938057))

(assert (= (and d!113389 (not c!97699)) b!938056))

(assert (= (and b!938056 c!97698) b!938059))

(assert (= (and b!938056 (not c!97698)) b!938055))

(assert (= (and b!938055 c!97700) b!938058))

(assert (= (and b!938055 (not c!97700)) b!938060))

(declare-fun m!872835 () Bool)

(assert (=> d!113389 m!872835))

(assert (=> d!113389 m!871913))

(declare-fun m!872837 () Bool)

(assert (=> d!113389 m!872837))

(declare-fun m!872839 () Bool)

(assert (=> d!113389 m!872839))

(assert (=> d!113389 m!871739))

(declare-fun m!872841 () Bool)

(assert (=> d!113389 m!872841))

(assert (=> d!113389 m!871913))

(assert (=> d!113389 m!872835))

(declare-fun m!872843 () Bool)

(assert (=> d!113389 m!872843))

(declare-fun m!872845 () Bool)

(assert (=> b!938056 m!872845))

(assert (=> b!938060 m!871913))

(declare-fun m!872847 () Bool)

(assert (=> b!938060 m!872847))

(assert (=> b!937608 d!113389))

(declare-fun d!113391 () Bool)

(declare-fun e!526799 () Bool)

(assert (=> d!113391 e!526799))

(declare-fun res!631231 () Bool)

(assert (=> d!113391 (=> res!631231 e!526799)))

(declare-fun lt!423449 () Bool)

(assert (=> d!113391 (= res!631231 (not lt!423449))))

(declare-fun lt!423447 () Bool)

(assert (=> d!113391 (= lt!423449 lt!423447)))

(declare-fun lt!423446 () Unit!31564)

(declare-fun e!526800 () Unit!31564)

(assert (=> d!113391 (= lt!423446 e!526800)))

(declare-fun c!97701 () Bool)

(assert (=> d!113391 (= c!97701 lt!423447)))

(assert (=> d!113391 (= lt!423447 (containsKey!450 (toList!6075 lt!423113) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!113391 (= (contains!5077 lt!423113 #b0000000000000000000000000000000000000000000000000000000000000000) lt!423449)))

(declare-fun b!938061 () Bool)

(declare-fun lt!423448 () Unit!31564)

(assert (=> b!938061 (= e!526800 lt!423448)))

(assert (=> b!938061 (= lt!423448 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 lt!423113) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!938061 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423113) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!938062 () Bool)

(declare-fun Unit!31593 () Unit!31564)

(assert (=> b!938062 (= e!526800 Unit!31593)))

(declare-fun b!938063 () Bool)

(assert (=> b!938063 (= e!526799 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423113) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113391 c!97701) b!938061))

(assert (= (and d!113391 (not c!97701)) b!938062))

(assert (= (and d!113391 (not res!631231)) b!938063))

(declare-fun m!872849 () Bool)

(assert (=> d!113391 m!872849))

(declare-fun m!872851 () Bool)

(assert (=> b!938061 m!872851))

(declare-fun m!872853 () Bool)

(assert (=> b!938061 m!872853))

(assert (=> b!938061 m!872853))

(declare-fun m!872855 () Bool)

(assert (=> b!938061 m!872855))

(assert (=> b!938063 m!872853))

(assert (=> b!938063 m!872853))

(assert (=> b!938063 m!872855))

(assert (=> bm!40752 d!113391))

(assert (=> b!937590 d!113189))

(declare-fun d!113393 () Bool)

(assert (=> d!113393 (= (apply!849 lt!423147 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14325 (getValueByKey!486 (toList!6075 lt!423147) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26307 () Bool)

(assert (= bs!26307 d!113393))

(assert (=> bs!26307 m!872657))

(assert (=> bs!26307 m!872657))

(declare-fun m!872857 () Bool)

(assert (=> bs!26307 m!872857))

(assert (=> b!937695 d!113393))

(declare-fun d!113395 () Bool)

(assert (=> d!113395 (= (get!14326 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!12703 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!937733 d!113395))

(declare-fun d!113397 () Bool)

(assert (=> d!113397 (isDefined!358 (getValueByKey!486 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(declare-fun lt!423450 () Unit!31564)

(assert (=> d!113397 (= lt!423450 (choose!1567 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(declare-fun e!526801 () Bool)

(assert (=> d!113397 e!526801))

(declare-fun res!631232 () Bool)

(assert (=> d!113397 (=> (not res!631232) (not e!526801))))

(assert (=> d!113397 (= res!631232 (isStrictlySorted!499 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))))

(assert (=> d!113397 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099) lt!423450)))

(declare-fun b!938064 () Bool)

(assert (=> b!938064 (= e!526801 (containsKey!450 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))

(assert (= (and d!113397 res!631232) b!938064))

(assert (=> d!113397 m!872171))

(assert (=> d!113397 m!872171))

(assert (=> d!113397 m!872173))

(declare-fun m!872859 () Bool)

(assert (=> d!113397 m!872859))

(declare-fun m!872861 () Bool)

(assert (=> d!113397 m!872861))

(assert (=> b!938064 m!872167))

(assert (=> b!937759 d!113397))

(declare-fun d!113399 () Bool)

(assert (=> d!113399 (= (isDefined!358 (getValueByKey!486 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099)) (not (isEmpty!702 (getValueByKey!486 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099))))))

(declare-fun bs!26308 () Bool)

(assert (= bs!26308 d!113399))

(assert (=> bs!26308 m!872171))

(declare-fun m!872863 () Bool)

(assert (=> bs!26308 m!872863))

(assert (=> b!937759 d!113399))

(declare-fun b!938066 () Bool)

(declare-fun e!526802 () Option!492)

(declare-fun e!526803 () Option!492)

(assert (=> b!938066 (= e!526802 e!526803)))

(declare-fun c!97703 () Bool)

(assert (=> b!938066 (= c!97703 (and ((_ is Cons!19172) (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) (not (= (_1!6727 (h!20318 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) k0!1099))))))

(declare-fun b!938067 () Bool)

(assert (=> b!938067 (= e!526803 (getValueByKey!486 (t!27460 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) k0!1099))))

(declare-fun b!938068 () Bool)

(assert (=> b!938068 (= e!526803 None!490)))

(declare-fun d!113401 () Bool)

(declare-fun c!97702 () Bool)

(assert (=> d!113401 (= c!97702 (and ((_ is Cons!19172) (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))) (= (_1!6727 (h!20318 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)))) k0!1099)))))

(assert (=> d!113401 (= (getValueByKey!486 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235)) k0!1099) e!526802)))

(declare-fun b!938065 () Bool)

(assert (=> b!938065 (= e!526802 (Some!491 (_2!6727 (h!20318 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))))))

(assert (= (and d!113401 c!97702) b!938065))

(assert (= (and d!113401 (not c!97702)) b!938066))

(assert (= (and b!938066 c!97703) b!938067))

(assert (= (and b!938066 (not c!97703)) b!938068))

(declare-fun m!872865 () Bool)

(assert (=> b!938067 m!872865))

(assert (=> b!937759 d!113401))

(declare-fun d!113403 () Bool)

(declare-fun e!526804 () Bool)

(assert (=> d!113403 e!526804))

(declare-fun res!631233 () Bool)

(assert (=> d!113403 (=> res!631233 e!526804)))

(declare-fun lt!423454 () Bool)

(assert (=> d!113403 (= res!631233 (not lt!423454))))

(declare-fun lt!423452 () Bool)

(assert (=> d!113403 (= lt!423454 lt!423452)))

(declare-fun lt!423451 () Unit!31564)

(declare-fun e!526805 () Unit!31564)

(assert (=> d!113403 (= lt!423451 e!526805)))

(declare-fun c!97704 () Bool)

(assert (=> d!113403 (= c!97704 lt!423452)))

(assert (=> d!113403 (= lt!423452 (containsKey!450 (toList!6075 lt!423184) (_1!6727 lt!422962)))))

(assert (=> d!113403 (= (contains!5077 lt!423184 (_1!6727 lt!422962)) lt!423454)))

(declare-fun b!938069 () Bool)

(declare-fun lt!423453 () Unit!31564)

(assert (=> b!938069 (= e!526805 lt!423453)))

(assert (=> b!938069 (= lt!423453 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 lt!423184) (_1!6727 lt!422962)))))

(assert (=> b!938069 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423184) (_1!6727 lt!422962)))))

(declare-fun b!938070 () Bool)

(declare-fun Unit!31594 () Unit!31564)

(assert (=> b!938070 (= e!526805 Unit!31594)))

(declare-fun b!938071 () Bool)

(assert (=> b!938071 (= e!526804 (isDefined!358 (getValueByKey!486 (toList!6075 lt!423184) (_1!6727 lt!422962))))))

(assert (= (and d!113403 c!97704) b!938069))

(assert (= (and d!113403 (not c!97704)) b!938070))

(assert (= (and d!113403 (not res!631233)) b!938071))

(declare-fun m!872867 () Bool)

(assert (=> d!113403 m!872867))

(declare-fun m!872869 () Bool)

(assert (=> b!938069 m!872869))

(assert (=> b!938069 m!872087))

(assert (=> b!938069 m!872087))

(declare-fun m!872871 () Bool)

(assert (=> b!938069 m!872871))

(assert (=> b!938071 m!872087))

(assert (=> b!938071 m!872087))

(assert (=> b!938071 m!872871))

(assert (=> d!113163 d!113403))

(declare-fun b!938073 () Bool)

(declare-fun e!526806 () Option!492)

(declare-fun e!526807 () Option!492)

(assert (=> b!938073 (= e!526806 e!526807)))

(declare-fun c!97706 () Bool)

(assert (=> b!938073 (= c!97706 (and ((_ is Cons!19172) lt!423185) (not (= (_1!6727 (h!20318 lt!423185)) (_1!6727 lt!422962)))))))

(declare-fun b!938074 () Bool)

(assert (=> b!938074 (= e!526807 (getValueByKey!486 (t!27460 lt!423185) (_1!6727 lt!422962)))))

(declare-fun b!938075 () Bool)

(assert (=> b!938075 (= e!526807 None!490)))

(declare-fun d!113405 () Bool)

(declare-fun c!97705 () Bool)

(assert (=> d!113405 (= c!97705 (and ((_ is Cons!19172) lt!423185) (= (_1!6727 (h!20318 lt!423185)) (_1!6727 lt!422962))))))

(assert (=> d!113405 (= (getValueByKey!486 lt!423185 (_1!6727 lt!422962)) e!526806)))

(declare-fun b!938072 () Bool)

(assert (=> b!938072 (= e!526806 (Some!491 (_2!6727 (h!20318 lt!423185))))))

(assert (= (and d!113405 c!97705) b!938072))

(assert (= (and d!113405 (not c!97705)) b!938073))

(assert (= (and b!938073 c!97706) b!938074))

(assert (= (and b!938073 (not c!97706)) b!938075))

(declare-fun m!872873 () Bool)

(assert (=> b!938074 m!872873))

(assert (=> d!113163 d!113405))

(declare-fun d!113407 () Bool)

(assert (=> d!113407 (= (getValueByKey!486 lt!423185 (_1!6727 lt!422962)) (Some!491 (_2!6727 lt!422962)))))

(declare-fun lt!423455 () Unit!31564)

(assert (=> d!113407 (= lt!423455 (choose!1566 lt!423185 (_1!6727 lt!422962) (_2!6727 lt!422962)))))

(declare-fun e!526808 () Bool)

(assert (=> d!113407 e!526808))

(declare-fun res!631234 () Bool)

(assert (=> d!113407 (=> (not res!631234) (not e!526808))))

(assert (=> d!113407 (= res!631234 (isStrictlySorted!499 lt!423185))))

(assert (=> d!113407 (= (lemmaContainsTupThenGetReturnValue!260 lt!423185 (_1!6727 lt!422962) (_2!6727 lt!422962)) lt!423455)))

(declare-fun b!938076 () Bool)

(declare-fun res!631235 () Bool)

(assert (=> b!938076 (=> (not res!631235) (not e!526808))))

(assert (=> b!938076 (= res!631235 (containsKey!450 lt!423185 (_1!6727 lt!422962)))))

(declare-fun b!938077 () Bool)

(assert (=> b!938077 (= e!526808 (contains!5080 lt!423185 (tuple2!13433 (_1!6727 lt!422962) (_2!6727 lt!422962))))))

(assert (= (and d!113407 res!631234) b!938076))

(assert (= (and b!938076 res!631235) b!938077))

(assert (=> d!113407 m!872081))

(declare-fun m!872875 () Bool)

(assert (=> d!113407 m!872875))

(declare-fun m!872877 () Bool)

(assert (=> d!113407 m!872877))

(declare-fun m!872879 () Bool)

(assert (=> b!938076 m!872879))

(declare-fun m!872881 () Bool)

(assert (=> b!938077 m!872881))

(assert (=> d!113163 d!113407))

(declare-fun c!97709 () Bool)

(declare-fun b!938078 () Bool)

(assert (=> b!938078 (= c!97709 (and ((_ is Cons!19172) (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (bvsgt (_1!6727 (h!20318 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6727 lt!422962))))))

(declare-fun e!526813 () List!19176)

(declare-fun e!526811 () List!19176)

(assert (=> b!938078 (= e!526813 e!526811)))

(declare-fun b!938079 () Bool)

(declare-fun e!526810 () List!19176)

(declare-fun call!40801 () List!19176)

(assert (=> b!938079 (= e!526810 call!40801)))

(declare-fun b!938080 () Bool)

(declare-fun call!40799 () List!19176)

(assert (=> b!938080 (= e!526811 call!40799)))

(declare-fun d!113409 () Bool)

(declare-fun e!526812 () Bool)

(assert (=> d!113409 e!526812))

(declare-fun res!631237 () Bool)

(assert (=> d!113409 (=> (not res!631237) (not e!526812))))

(declare-fun lt!423456 () List!19176)

(assert (=> d!113409 (= res!631237 (isStrictlySorted!499 lt!423456))))

(assert (=> d!113409 (= lt!423456 e!526810)))

(declare-fun c!97708 () Bool)

(assert (=> d!113409 (= c!97708 (and ((_ is Cons!19172) (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (bvslt (_1!6727 (h!20318 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6727 lt!422962))))))

(assert (=> d!113409 (isStrictlySorted!499 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))))

(assert (=> d!113409 (= (insertStrictlySorted!317 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6727 lt!422962) (_2!6727 lt!422962)) lt!423456)))

(declare-fun b!938081 () Bool)

(declare-fun call!40800 () List!19176)

(assert (=> b!938081 (= e!526813 call!40800)))

(declare-fun b!938082 () Bool)

(assert (=> b!938082 (= e!526811 call!40799)))

(declare-fun e!526809 () List!19176)

(declare-fun b!938083 () Bool)

(assert (=> b!938083 (= e!526809 (insertStrictlySorted!317 (t!27460 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (_1!6727 lt!422962) (_2!6727 lt!422962)))))

(declare-fun b!938084 () Bool)

(declare-fun res!631236 () Bool)

(assert (=> b!938084 (=> (not res!631236) (not e!526812))))

(assert (=> b!938084 (= res!631236 (containsKey!450 lt!423456 (_1!6727 lt!422962)))))

(declare-fun b!938085 () Bool)

(assert (=> b!938085 (= e!526812 (contains!5080 lt!423456 (tuple2!13433 (_1!6727 lt!422962) (_2!6727 lt!422962))))))

(declare-fun bm!40796 () Bool)

(assert (=> bm!40796 (= call!40800 call!40801)))

(declare-fun bm!40797 () Bool)

(assert (=> bm!40797 (= call!40801 ($colon$colon!553 e!526809 (ite c!97708 (h!20318 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (tuple2!13433 (_1!6727 lt!422962) (_2!6727 lt!422962)))))))

(declare-fun c!97710 () Bool)

(assert (=> bm!40797 (= c!97710 c!97708)))

(declare-fun bm!40798 () Bool)

(assert (=> bm!40798 (= call!40799 call!40800)))

(declare-fun b!938086 () Bool)

(assert (=> b!938086 (= e!526810 e!526813)))

(declare-fun c!97707 () Bool)

(assert (=> b!938086 (= c!97707 (and ((_ is Cons!19172) (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (= (_1!6727 (h!20318 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) (_1!6727 lt!422962))))))

(declare-fun b!938087 () Bool)

(assert (=> b!938087 (= e!526809 (ite c!97707 (t!27460 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (ite c!97709 (Cons!19172 (h!20318 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))) (t!27460 (toList!6075 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)))) Nil!19173)))))

(assert (= (and d!113409 c!97708) b!938079))

(assert (= (and d!113409 (not c!97708)) b!938086))

(assert (= (and b!938086 c!97707) b!938081))

(assert (= (and b!938086 (not c!97707)) b!938078))

(assert (= (and b!938078 c!97709) b!938082))

(assert (= (and b!938078 (not c!97709)) b!938080))

(assert (= (or b!938082 b!938080) bm!40798))

(assert (= (or b!938081 bm!40798) bm!40796))

(assert (= (or b!938079 bm!40796) bm!40797))

(assert (= (and bm!40797 c!97710) b!938083))

(assert (= (and bm!40797 (not c!97710)) b!938087))

(assert (= (and d!113409 res!631237) b!938084))

(assert (= (and b!938084 res!631236) b!938085))

(declare-fun m!872883 () Bool)

(assert (=> d!113409 m!872883))

(declare-fun m!872885 () Bool)

(assert (=> d!113409 m!872885))

(declare-fun m!872887 () Bool)

(assert (=> b!938085 m!872887))

(declare-fun m!872889 () Bool)

(assert (=> bm!40797 m!872889))

(declare-fun m!872891 () Bool)

(assert (=> b!938083 m!872891))

(declare-fun m!872893 () Bool)

(assert (=> b!938084 m!872893))

(assert (=> d!113163 d!113409))

(assert (=> b!937761 d!113399))

(assert (=> b!937761 d!113401))

(declare-fun d!113411 () Bool)

(declare-fun e!526816 () Bool)

(assert (=> d!113411 e!526816))

(declare-fun c!97713 () Bool)

(assert (=> d!113411 (= c!97713 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!113411 true))

(declare-fun _$29!180 () Unit!31564)

(assert (=> d!113411 (= (choose!1564 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) _$29!180)))

(declare-fun b!938092 () Bool)

(assert (=> b!938092 (= e!526816 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!938093 () Bool)

(assert (=> b!938093 (= e!526816 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113411 c!97713) b!938092))

(assert (= (and d!113411 (not c!97713)) b!938093))

(assert (=> b!938092 m!871779))

(assert (=> d!113167 d!113411))

(assert (=> d!113167 d!113141))

(assert (=> b!937697 d!113289))

(assert (=> d!113173 d!113165))

(declare-fun d!113413 () Bool)

(assert (=> d!113413 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19174)))

(assert (=> d!113413 true))

(declare-fun _$71!180 () Unit!31564)

(assert (=> d!113413 (= (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) _$71!180)))

(declare-fun bs!26309 () Bool)

(assert (= bs!26309 d!113413))

(assert (=> bs!26309 m!871775))

(assert (=> d!113173 d!113413))

(assert (=> b!937667 d!113191))

(declare-fun d!113415 () Bool)

(assert (=> d!113415 (= (apply!849 lt!423113 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14325 (getValueByKey!486 (toList!6075 lt!423113) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26310 () Bool)

(assert (= bs!26310 d!113415))

(assert (=> bs!26310 m!872853))

(assert (=> bs!26310 m!872853))

(declare-fun m!872895 () Bool)

(assert (=> bs!26310 m!872895))

(assert (=> b!937669 d!113415))

(assert (=> b!937654 d!113191))

(declare-fun d!113417 () Bool)

(assert (=> d!113417 (= (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2864 (getCurrentListMap!3239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13433 (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14324 (select (arr!27151 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1620 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!113417 true))

(declare-fun _$20!31 () Unit!31564)

(assert (=> d!113417 (= (choose!1562 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) _$20!31)))

(declare-fun b_lambda!14175 () Bool)

(assert (=> (not b_lambda!14175) (not d!113417)))

(assert (=> d!113417 t!27459))

(declare-fun b_and!29097 () Bool)

(assert (= b_and!29095 (and (=> t!27459 result!12111) b_and!29097)))

(assert (=> d!113417 m!871755))

(assert (=> d!113417 m!871759))

(assert (=> d!113417 m!871763))

(assert (=> d!113417 m!872065))

(assert (=> d!113417 m!871759))

(assert (=> d!113417 m!871755))

(assert (=> d!113417 m!871787))

(assert (=> d!113417 m!872065))

(assert (=> d!113417 m!872067))

(assert (=> d!113417 m!871745))

(assert (=> d!113155 d!113417))

(assert (=> d!113155 d!113141))

(declare-fun d!113419 () Bool)

(declare-fun e!526817 () Bool)

(assert (=> d!113419 e!526817))

(declare-fun res!631239 () Bool)

(assert (=> d!113419 (=> (not res!631239) (not e!526817))))

(declare-fun lt!423459 () ListLongMap!12119)

(assert (=> d!113419 (= res!631239 (contains!5077 lt!423459 (_1!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun lt!423460 () List!19176)

(assert (=> d!113419 (= lt!423459 (ListLongMap!12120 lt!423460))))

(declare-fun lt!423457 () Unit!31564)

(declare-fun lt!423458 () Unit!31564)

(assert (=> d!113419 (= lt!423457 lt!423458)))

(assert (=> d!113419 (= (getValueByKey!486 lt!423460 (_1!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113419 (= lt!423458 (lemmaContainsTupThenGetReturnValue!260 lt!423460 (_1!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113419 (= lt!423460 (insertStrictlySorted!317 (toList!6075 call!40765) (_1!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) (_2!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (=> d!113419 (= (+!2864 call!40765 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)) lt!423459)))

(declare-fun b!938094 () Bool)

(declare-fun res!631238 () Bool)

(assert (=> b!938094 (=> (not res!631238) (not e!526817))))

(assert (=> b!938094 (= res!631238 (= (getValueByKey!486 (toList!6075 lt!423459) (_1!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (Some!491 (_2!6727 (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun b!938095 () Bool)

(assert (=> b!938095 (= e!526817 (contains!5080 (toList!6075 lt!423459) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(assert (= (and d!113419 res!631239) b!938094))

(assert (= (and b!938094 res!631238) b!938095))

(declare-fun m!872897 () Bool)

(assert (=> d!113419 m!872897))

(declare-fun m!872899 () Bool)

(assert (=> d!113419 m!872899))

(declare-fun m!872901 () Bool)

(assert (=> d!113419 m!872901))

(declare-fun m!872903 () Bool)

(assert (=> d!113419 m!872903))

(declare-fun m!872905 () Bool)

(assert (=> b!938094 m!872905))

(declare-fun m!872907 () Bool)

(assert (=> b!938095 m!872907))

(assert (=> b!937687 d!113419))

(declare-fun d!113421 () Bool)

(assert (=> d!113421 (not (= (select (arr!27152 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) k0!1099))))

(assert (=> d!113421 true))

(declare-fun _$67!49 () Unit!31564)

(assert (=> d!113421 (= (choose!21 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19174) _$67!49)))

(declare-fun bs!26311 () Bool)

(assert (= bs!26311 d!113421))

(assert (=> bs!26311 m!871787))

(assert (=> d!113161 d!113421))

(declare-fun d!113423 () Bool)

(declare-fun lt!423461 () Bool)

(assert (=> d!113423 (= lt!423461 (select (content!406 (toList!6075 lt!423184)) lt!422962))))

(declare-fun e!526819 () Bool)

(assert (=> d!113423 (= lt!423461 e!526819)))

(declare-fun res!631241 () Bool)

(assert (=> d!113423 (=> (not res!631241) (not e!526819))))

(assert (=> d!113423 (= res!631241 ((_ is Cons!19172) (toList!6075 lt!423184)))))

(assert (=> d!113423 (= (contains!5080 (toList!6075 lt!423184) lt!422962) lt!423461)))

(declare-fun b!938096 () Bool)

(declare-fun e!526818 () Bool)

(assert (=> b!938096 (= e!526819 e!526818)))

(declare-fun res!631240 () Bool)

(assert (=> b!938096 (=> res!631240 e!526818)))

(assert (=> b!938096 (= res!631240 (= (h!20318 (toList!6075 lt!423184)) lt!422962))))

(declare-fun b!938097 () Bool)

(assert (=> b!938097 (= e!526818 (contains!5080 (t!27460 (toList!6075 lt!423184)) lt!422962))))

(assert (= (and d!113423 res!631241) b!938096))

(assert (= (and b!938096 (not res!631240)) b!938097))

(declare-fun m!872909 () Bool)

(assert (=> d!113423 m!872909))

(declare-fun m!872911 () Bool)

(assert (=> d!113423 m!872911))

(declare-fun m!872913 () Bool)

(assert (=> b!938097 m!872913))

(assert (=> b!937716 d!113423))

(assert (=> bm!40756 d!113195))

(declare-fun d!113425 () Bool)

(declare-fun e!526820 () Bool)

(assert (=> d!113425 e!526820))

(declare-fun res!631242 () Bool)

(assert (=> d!113425 (=> res!631242 e!526820)))

(declare-fun lt!423465 () Bool)

(assert (=> d!113425 (= res!631242 (not lt!423465))))

(declare-fun lt!423463 () Bool)

(assert (=> d!113425 (= lt!423465 lt!423463)))

(declare-fun lt!423462 () Unit!31564)

(declare-fun e!526821 () Unit!31564)

(assert (=> d!113425 (= lt!423462 e!526821)))

(declare-fun c!97714 () Bool)

(assert (=> d!113425 (= c!97714 lt!423463)))

(assert (=> d!113425 (= lt!423463 (containsKey!450 (toList!6075 (+!2864 lt!422966 (tuple2!13433 lt!422964 lt!422971))) k0!1099))))

(assert (=> d!113425 (= (contains!5077 (+!2864 lt!422966 (tuple2!13433 lt!422964 lt!422971)) k0!1099) lt!423465)))

(declare-fun b!938098 () Bool)

(declare-fun lt!423464 () Unit!31564)

(assert (=> b!938098 (= e!526821 lt!423464)))

(assert (=> b!938098 (= lt!423464 (lemmaContainsKeyImpliesGetValueByKeyDefined!345 (toList!6075 (+!2864 lt!422966 (tuple2!13433 lt!422964 lt!422971))) k0!1099))))

(assert (=> b!938098 (isDefined!358 (getValueByKey!486 (toList!6075 (+!2864 lt!422966 (tuple2!13433 lt!422964 lt!422971))) k0!1099))))

(declare-fun b!938099 () Bool)

(declare-fun Unit!31595 () Unit!31564)

(assert (=> b!938099 (= e!526821 Unit!31595)))

(declare-fun b!938100 () Bool)

(assert (=> b!938100 (= e!526820 (isDefined!358 (getValueByKey!486 (toList!6075 (+!2864 lt!422966 (tuple2!13433 lt!422964 lt!422971))) k0!1099)))))

(assert (= (and d!113425 c!97714) b!938098))

(assert (= (and d!113425 (not c!97714)) b!938099))

(assert (= (and d!113425 (not res!631242)) b!938100))

(declare-fun m!872915 () Bool)

(assert (=> d!113425 m!872915))

(declare-fun m!872917 () Bool)

(assert (=> b!938098 m!872917))

(assert (=> b!938098 m!872491))

(assert (=> b!938098 m!872491))

(declare-fun m!872919 () Bool)

(assert (=> b!938098 m!872919))

(assert (=> b!938100 m!872491))

(assert (=> b!938100 m!872491))

(assert (=> b!938100 m!872919))

(assert (=> d!113169 d!113425))

(assert (=> d!113169 d!113287))

(declare-fun d!113427 () Bool)

(assert (=> d!113427 (contains!5077 (+!2864 lt!422966 (tuple2!13433 lt!422964 lt!422971)) k0!1099)))

(assert (=> d!113427 true))

(declare-fun _$35!432 () Unit!31564)

(assert (=> d!113427 (= (choose!1565 lt!422966 lt!422964 lt!422971 k0!1099) _$35!432)))

(declare-fun bs!26312 () Bool)

(assert (= bs!26312 d!113427))

(assert (=> bs!26312 m!872073))

(assert (=> bs!26312 m!872073))

(assert (=> bs!26312 m!872097))

(assert (=> d!113169 d!113427))

(assert (=> d!113169 d!113175))

(declare-fun d!113429 () Bool)

(declare-fun e!526822 () Bool)

(assert (=> d!113429 e!526822))

(declare-fun res!631244 () Bool)

(assert (=> d!113429 (=> (not res!631244) (not e!526822))))

(declare-fun lt!423468 () ListLongMap!12119)

(assert (=> d!113429 (= res!631244 (contains!5077 lt!423468 (_1!6727 (ite (or c!97623 c!97618) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(declare-fun lt!423469 () List!19176)

(assert (=> d!113429 (= lt!423468 (ListLongMap!12120 lt!423469))))

(declare-fun lt!423466 () Unit!31564)

(declare-fun lt!423467 () Unit!31564)

(assert (=> d!113429 (= lt!423466 lt!423467)))

(assert (=> d!113429 (= (getValueByKey!486 lt!423469 (_1!6727 (ite (or c!97623 c!97618) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!491 (_2!6727 (ite (or c!97623 c!97618) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113429 (= lt!423467 (lemmaContainsTupThenGetReturnValue!260 lt!423469 (_1!6727 (ite (or c!97623 c!97618) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6727 (ite (or c!97623 c!97618) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113429 (= lt!423469 (insertStrictlySorted!317 (toList!6075 (ite c!97623 call!40770 (ite c!97618 call!40774 call!40771))) (_1!6727 (ite (or c!97623 c!97618) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) (_2!6727 (ite (or c!97623 c!97618) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))))

(assert (=> d!113429 (= (+!2864 (ite c!97623 call!40770 (ite c!97618 call!40774 call!40771)) (ite (or c!97623 c!97618) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))) lt!423468)))

(declare-fun b!938102 () Bool)

(declare-fun res!631243 () Bool)

(assert (=> b!938102 (=> (not res!631243) (not e!526822))))

(assert (=> b!938102 (= res!631243 (= (getValueByKey!486 (toList!6075 lt!423468) (_1!6727 (ite (or c!97623 c!97618) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))) (Some!491 (_2!6727 (ite (or c!97623 c!97618) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))))

(declare-fun b!938103 () Bool)

(assert (=> b!938103 (= e!526822 (contains!5080 (toList!6075 lt!423468) (ite (or c!97623 c!97618) (tuple2!13433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(assert (= (and d!113429 res!631244) b!938102))

(assert (= (and b!938102 res!631243) b!938103))

(declare-fun m!872921 () Bool)

(assert (=> d!113429 m!872921))

(declare-fun m!872923 () Bool)

(assert (=> d!113429 m!872923))

(declare-fun m!872925 () Bool)

(assert (=> d!113429 m!872925))

(declare-fun m!872927 () Bool)

(assert (=> d!113429 m!872927))

(declare-fun m!872929 () Bool)

(assert (=> b!938102 m!872929))

(declare-fun m!872931 () Bool)

(assert (=> b!938103 m!872931))

(assert (=> bm!40770 d!113429))

(declare-fun b!938105 () Bool)

(declare-fun e!526823 () Option!492)

(declare-fun e!526824 () Option!492)

(assert (=> b!938105 (= e!526823 e!526824)))

(declare-fun c!97716 () Bool)

(assert (=> b!938105 (= c!97716 (and ((_ is Cons!19172) (toList!6075 lt!423171)) (not (= (_1!6727 (h!20318 (toList!6075 lt!423171))) (_1!6727 lt!422962)))))))

(declare-fun b!938106 () Bool)

(assert (=> b!938106 (= e!526824 (getValueByKey!486 (t!27460 (toList!6075 lt!423171)) (_1!6727 lt!422962)))))

(declare-fun b!938107 () Bool)

(assert (=> b!938107 (= e!526824 None!490)))

(declare-fun d!113431 () Bool)

(declare-fun c!97715 () Bool)

(assert (=> d!113431 (= c!97715 (and ((_ is Cons!19172) (toList!6075 lt!423171)) (= (_1!6727 (h!20318 (toList!6075 lt!423171))) (_1!6727 lt!422962))))))

(assert (=> d!113431 (= (getValueByKey!486 (toList!6075 lt!423171) (_1!6727 lt!422962)) e!526823)))

(declare-fun b!938104 () Bool)

(assert (=> b!938104 (= e!526823 (Some!491 (_2!6727 (h!20318 (toList!6075 lt!423171)))))))

(assert (= (and d!113431 c!97715) b!938104))

(assert (= (and d!113431 (not c!97715)) b!938105))

(assert (= (and b!938105 c!97716) b!938106))

(assert (= (and b!938105 (not c!97716)) b!938107))

(declare-fun m!872933 () Bool)

(assert (=> b!938106 m!872933))

(assert (=> b!937706 d!113431))

(assert (=> b!937718 d!113191))

(declare-fun b!938108 () Bool)

(declare-fun e!526826 () Bool)

(assert (=> b!938108 (= e!526826 tp_is_empty!20257)))

(declare-fun b!938109 () Bool)

(declare-fun e!526825 () Bool)

(assert (=> b!938109 (= e!526825 tp_is_empty!20257)))

(declare-fun mapNonEmpty!32167 () Bool)

(declare-fun mapRes!32167 () Bool)

(declare-fun tp!61720 () Bool)

(assert (=> mapNonEmpty!32167 (= mapRes!32167 (and tp!61720 e!526826))))

(declare-fun mapValue!32167 () ValueCell!9647)

(declare-fun mapRest!32167 () (Array (_ BitVec 32) ValueCell!9647))

(declare-fun mapKey!32167 () (_ BitVec 32))

(assert (=> mapNonEmpty!32167 (= mapRest!32166 (store mapRest!32167 mapKey!32167 mapValue!32167))))

(declare-fun condMapEmpty!32167 () Bool)

(declare-fun mapDefault!32167 () ValueCell!9647)

(assert (=> mapNonEmpty!32166 (= condMapEmpty!32167 (= mapRest!32166 ((as const (Array (_ BitVec 32) ValueCell!9647)) mapDefault!32167)))))

(assert (=> mapNonEmpty!32166 (= tp!61719 (and e!526825 mapRes!32167))))

(declare-fun mapIsEmpty!32167 () Bool)

(assert (=> mapIsEmpty!32167 mapRes!32167))

(assert (= (and mapNonEmpty!32166 condMapEmpty!32167) mapIsEmpty!32167))

(assert (= (and mapNonEmpty!32166 (not condMapEmpty!32167)) mapNonEmpty!32167))

(assert (= (and mapNonEmpty!32167 ((_ is ValueCellFull!9647) mapValue!32167)) b!938108))

(assert (= (and mapNonEmpty!32166 ((_ is ValueCellFull!9647) mapDefault!32167)) b!938109))

(declare-fun m!872935 () Bool)

(assert (=> mapNonEmpty!32167 m!872935))

(declare-fun b_lambda!14177 () Bool)

(assert (= b_lambda!14175 (or (and start!79682 b_free!17749) b_lambda!14177)))

(declare-fun b_lambda!14179 () Bool)

(assert (= b_lambda!14163 (or (and start!79682 b_free!17749) b_lambda!14179)))

(declare-fun b_lambda!14181 () Bool)

(assert (= b_lambda!14171 (or (and start!79682 b_free!17749) b_lambda!14181)))

(declare-fun b_lambda!14183 () Bool)

(assert (= b_lambda!14173 (or (and start!79682 b_free!17749) b_lambda!14183)))

(declare-fun b_lambda!14185 () Bool)

(assert (= b_lambda!14165 (or (and start!79682 b_free!17749) b_lambda!14185)))

(declare-fun b_lambda!14187 () Bool)

(assert (= b_lambda!14167 (or (and start!79682 b_free!17749) b_lambda!14187)))

(declare-fun b_lambda!14189 () Bool)

(assert (= b_lambda!14161 (or (and start!79682 b_free!17749) b_lambda!14189)))

(declare-fun b_lambda!14191 () Bool)

(assert (= b_lambda!14169 (or (and start!79682 b_free!17749) b_lambda!14191)))

(check-sat (not d!113409) (not d!113271) (not b!938011) (not b!938067) (not b!938029) (not b!937891) (not b!937966) (not b_lambda!14177) (not b!937880) (not b!937856) (not b_lambda!14153) (not d!113249) (not b!937911) (not d!113281) (not b!938040) (not bm!40774) (not b!937882) (not b!937807) (not d!113419) (not b!937833) (not b!937855) (not d!113207) (not b!938061) (not d!113353) (not d!113209) (not d!113323) (not b!938035) (not d!113199) (not b!938009) (not b!937814) (not b!937965) (not d!113269) (not b!938036) (not b!938095) (not d!113181) (not b!937778) (not b!938102) (not b!937980) (not b!937848) (not b!938023) (not d!113415) (not d!113241) (not b!937893) (not bm!40777) (not d!113261) (not d!113263) (not b!937829) (not b!938069) (not d!113223) (not b_lambda!14185) (not b!937900) (not b!937967) (not d!113327) (not d!113305) (not bm!40788) (not d!113325) (not d!113351) (not b_lambda!14157) (not b!937851) (not b!937962) (not b!938077) (not b!937890) (not b!937823) (not b!937905) (not b!938014) (not b!937842) (not d!113423) (not d!113333) b_and!29097 (not b!937852) (not b!937820) (not b!937984) (not b!938042) (not d!113377) (not b!938021) (not d!113389) (not d!113251) (not d!113359) (not b!937953) (not d!113243) (not b!937996) (not b!938098) (not b!937998) (not b!937999) (not b!937982) (not b!937839) (not b_lambda!14189) (not d!113295) (not b!937897) (not b!938030) (not b!938064) (not b!938032) (not b!937775) (not d!113365) (not b!938074) (not d!113285) (not bm!40797) (not b!937874) (not b!937811) (not b!938092) (not b!937995) (not b!938025) (not b_next!17749) (not d!113339) (not d!113299) (not d!113357) (not d!113385) (not d!113307) (not d!113391) (not d!113355) (not d!113379) (not d!113349) (not b_lambda!14181) (not b!938100) (not b!937912) (not d!113217) (not d!113309) (not d!113393) (not b!938097) (not d!113337) (not b!937955) (not b!937871) (not b!938063) (not b!937828) (not d!113413) (not b!937892) (not b!937810) (not d!113257) (not b!937877) (not d!113213) (not d!113317) (not b!937979) (not d!113399) (not d!113381) (not b!937938) (not bm!40795) (not d!113265) (not b!937831) (not b_lambda!14183) (not d!113187) (not b!937808) (not bm!40793) (not b!937835) (not b!937826) (not d!113369) (not b!937950) (not b!937974) (not b!937875) (not d!113367) (not b!937947) (not b!938008) (not b!937959) (not b!937837) (not b!937825) (not bm!40776) (not d!113315) (not d!113301) (not b!937899) (not b!937991) (not b!937986) (not b!937971) (not b!938094) (not b!937896) (not d!113203) (not d!113417) (not b!938033) (not d!113343) (not b!937836) (not b!937847) (not d!113303) (not d!113197) (not b!938083) (not b!937943) (not b_lambda!14191) (not b_lambda!14179) (not d!113267) (not d!113185) (not d!113255) (not b!938013) (not b!937832) (not d!113275) (not d!113429) (not b!937809) (not d!113373) (not b!938060) (not d!113231) (not b!937887) (not b_lambda!14155) (not bm!40787) (not d!113397) (not d!113331) (not d!113287) (not b!937843) (not d!113219) (not b!937956) (not d!113363) (not d!113283) (not bm!40775) (not b_lambda!14143) (not b!937898) (not b!937884) (not d!113205) (not d!113277) (not b!938103) (not bm!40790) (not b!938017) (not b!938000) (not d!113247) (not b_lambda!14159) (not d!113195) (not d!113345) (not d!113221) (not b_lambda!14187) (not d!113273) (not d!113427) (not b!938016) (not b!937878) (not b!938019) (not b!937846) (not b!937944) (not b!938031) (not b!938034) (not b!938037) (not b!938076) (not bm!40785) (not d!113215) (not d!113237) (not d!113259) (not d!113361) (not d!113211) (not b!937805) (not b!937902) (not b!937869) (not b!937873) (not d!113253) (not d!113291) (not b!938071) (not d!113371) (not d!113279) (not b!937952) (not b!937845) (not b!938085) (not b!937827) (not b!938002) (not d!113201) (not b!938018) (not b!937889) (not mapNonEmpty!32167) (not b!937977) (not d!113319) tp_is_empty!20257 (not bm!40794) (not b!938106) (not d!113341) (not d!113225) (not b!937813) (not b!937939) (not b!938022) (not b!937840) (not d!113425) (not b!937951) (not b!937940) (not b!937881) (not b!937776) (not d!113403) (not b!938020) (not d!113407) (not b!937993) (not b!937858) (not b!937949) (not d!113347) (not b!938084) (not b!937883))
(check-sat b_and!29097 (not b_next!17749))
