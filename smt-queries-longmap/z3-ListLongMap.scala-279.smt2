; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4522 () Bool)

(assert start!4522)

(declare-fun b_free!1263 () Bool)

(declare-fun b_next!1263 () Bool)

(assert (=> start!4522 (= b_free!1263 (not b_next!1263))))

(declare-fun tp!5229 () Bool)

(declare-fun b_and!2087 () Bool)

(assert (=> start!4522 (= tp!5229 b_and!2087)))

(declare-fun mapIsEmpty!1975 () Bool)

(declare-fun mapRes!1975 () Bool)

(assert (=> mapIsEmpty!1975 mapRes!1975))

(declare-fun b!35299 () Bool)

(declare-fun res!21453 () Bool)

(declare-fun e!22301 () Bool)

(assert (=> b!35299 (=> (not res!21453) (not e!22301))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1981 0))(
  ( (V!1982 (val!835 Int)) )
))
(declare-datatypes ((ValueCell!609 0))(
  ( (ValueCellFull!609 (v!1931 V!1981)) (EmptyCell!609) )
))
(declare-datatypes ((array!2449 0))(
  ( (array!2450 (arr!1171 (Array (_ BitVec 32) ValueCell!609)) (size!1272 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2449)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2451 0))(
  ( (array!2452 (arr!1172 (Array (_ BitVec 32) (_ BitVec 64))) (size!1273 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2451)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1981)

(declare-fun minValue!1443 () V!1981)

(declare-datatypes ((tuple2!1348 0))(
  ( (tuple2!1349 (_1!685 (_ BitVec 64)) (_2!685 V!1981)) )
))
(declare-datatypes ((List!940 0))(
  ( (Nil!937) (Cons!936 (h!1503 tuple2!1348) (t!3647 List!940)) )
))
(declare-datatypes ((ListLongMap!925 0))(
  ( (ListLongMap!926 (toList!478 List!940)) )
))
(declare-fun contains!425 (ListLongMap!925 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!302 (array!2451 array!2449 (_ BitVec 32) (_ BitVec 32) V!1981 V!1981 (_ BitVec 32) Int) ListLongMap!925)

(assert (=> b!35299 (= res!21453 (not (contains!425 (getCurrentListMap!302 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!35300 () Bool)

(declare-fun res!21451 () Bool)

(assert (=> b!35300 (=> (not res!21451) (not e!22301))))

(declare-datatypes ((List!941 0))(
  ( (Nil!938) (Cons!937 (h!1504 (_ BitVec 64)) (t!3648 List!941)) )
))
(declare-fun arrayNoDuplicates!0 (array!2451 (_ BitVec 32) List!941) Bool)

(assert (=> b!35300 (= res!21451 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!938))))

(declare-fun b!35301 () Bool)

(declare-fun e!22300 () Bool)

(declare-fun tp_is_empty!1617 () Bool)

(assert (=> b!35301 (= e!22300 tp_is_empty!1617)))

(declare-fun b!35302 () Bool)

(declare-fun res!21452 () Bool)

(assert (=> b!35302 (=> (not res!21452) (not e!22301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!35302 (= res!21452 (validKeyInArray!0 k0!1304))))

(declare-fun res!21450 () Bool)

(assert (=> start!4522 (=> (not res!21450) (not e!22301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4522 (= res!21450 (validMask!0 mask!2294))))

(assert (=> start!4522 e!22301))

(assert (=> start!4522 true))

(assert (=> start!4522 tp!5229))

(declare-fun e!22302 () Bool)

(declare-fun array_inv!827 (array!2449) Bool)

(assert (=> start!4522 (and (array_inv!827 _values!1501) e!22302)))

(declare-fun array_inv!828 (array!2451) Bool)

(assert (=> start!4522 (array_inv!828 _keys!1833)))

(assert (=> start!4522 tp_is_empty!1617))

(declare-fun b!35303 () Bool)

(declare-fun e!22298 () Bool)

(assert (=> b!35303 (= e!22301 e!22298)))

(declare-fun res!21449 () Bool)

(assert (=> b!35303 (=> (not res!21449) (not e!22298))))

(declare-datatypes ((SeekEntryResult!161 0))(
  ( (MissingZero!161 (index!2766 (_ BitVec 32))) (Found!161 (index!2767 (_ BitVec 32))) (Intermediate!161 (undefined!973 Bool) (index!2768 (_ BitVec 32)) (x!7005 (_ BitVec 32))) (Undefined!161) (MissingVacant!161 (index!2769 (_ BitVec 32))) )
))
(declare-fun lt!12951 () SeekEntryResult!161)

(get-info :version)

(assert (=> b!35303 (= res!21449 (and ((_ is Found!161) lt!12951) (bvsge (index!2767 lt!12951) #b00000000000000000000000000000000) (bvslt (index!2767 lt!12951) (size!1273 _keys!1833))))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2451 (_ BitVec 32)) SeekEntryResult!161)

(assert (=> b!35303 (= lt!12951 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1975 () Bool)

(declare-fun tp!5230 () Bool)

(assert (=> mapNonEmpty!1975 (= mapRes!1975 (and tp!5230 e!22300))))

(declare-fun mapRest!1975 () (Array (_ BitVec 32) ValueCell!609))

(declare-fun mapKey!1975 () (_ BitVec 32))

(declare-fun mapValue!1975 () ValueCell!609)

(assert (=> mapNonEmpty!1975 (= (arr!1171 _values!1501) (store mapRest!1975 mapKey!1975 mapValue!1975))))

(declare-fun b!35304 () Bool)

(assert (=> b!35304 (= e!22298 (not (validKeyInArray!0 (select (arr!1172 _keys!1833) (index!2767 lt!12951)))))))

(declare-fun b!35305 () Bool)

(declare-fun res!21455 () Bool)

(assert (=> b!35305 (=> (not res!21455) (not e!22301))))

(assert (=> b!35305 (= res!21455 (and (= (size!1272 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1273 _keys!1833) (size!1272 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!35306 () Bool)

(declare-fun res!21454 () Bool)

(assert (=> b!35306 (=> (not res!21454) (not e!22301))))

(declare-fun arrayContainsKey!0 (array!2451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!35306 (= res!21454 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!35307 () Bool)

(declare-fun e!22303 () Bool)

(assert (=> b!35307 (= e!22302 (and e!22303 mapRes!1975))))

(declare-fun condMapEmpty!1975 () Bool)

(declare-fun mapDefault!1975 () ValueCell!609)

(assert (=> b!35307 (= condMapEmpty!1975 (= (arr!1171 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!609)) mapDefault!1975)))))

(declare-fun b!35308 () Bool)

(declare-fun res!21456 () Bool)

(assert (=> b!35308 (=> (not res!21456) (not e!22301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2451 (_ BitVec 32)) Bool)

(assert (=> b!35308 (= res!21456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!35309 () Bool)

(assert (=> b!35309 (= e!22303 tp_is_empty!1617)))

(assert (= (and start!4522 res!21450) b!35305))

(assert (= (and b!35305 res!21455) b!35308))

(assert (= (and b!35308 res!21456) b!35300))

(assert (= (and b!35300 res!21451) b!35302))

(assert (= (and b!35302 res!21452) b!35299))

(assert (= (and b!35299 res!21453) b!35306))

(assert (= (and b!35306 res!21454) b!35303))

(assert (= (and b!35303 res!21449) b!35304))

(assert (= (and b!35307 condMapEmpty!1975) mapIsEmpty!1975))

(assert (= (and b!35307 (not condMapEmpty!1975)) mapNonEmpty!1975))

(assert (= (and mapNonEmpty!1975 ((_ is ValueCellFull!609) mapValue!1975)) b!35301))

(assert (= (and b!35307 ((_ is ValueCellFull!609) mapDefault!1975)) b!35309))

(assert (= start!4522 b!35307))

(declare-fun m!28393 () Bool)

(assert (=> b!35300 m!28393))

(declare-fun m!28395 () Bool)

(assert (=> b!35308 m!28395))

(declare-fun m!28397 () Bool)

(assert (=> b!35299 m!28397))

(assert (=> b!35299 m!28397))

(declare-fun m!28399 () Bool)

(assert (=> b!35299 m!28399))

(declare-fun m!28401 () Bool)

(assert (=> b!35306 m!28401))

(declare-fun m!28403 () Bool)

(assert (=> mapNonEmpty!1975 m!28403))

(declare-fun m!28405 () Bool)

(assert (=> b!35303 m!28405))

(declare-fun m!28407 () Bool)

(assert (=> start!4522 m!28407))

(declare-fun m!28409 () Bool)

(assert (=> start!4522 m!28409))

(declare-fun m!28411 () Bool)

(assert (=> start!4522 m!28411))

(declare-fun m!28413 () Bool)

(assert (=> b!35304 m!28413))

(assert (=> b!35304 m!28413))

(declare-fun m!28415 () Bool)

(assert (=> b!35304 m!28415))

(declare-fun m!28417 () Bool)

(assert (=> b!35302 m!28417))

(check-sat (not b!35299) (not b!35303) (not mapNonEmpty!1975) (not b!35304) (not b!35302) (not b!35300) (not b!35308) tp_is_empty!1617 (not b!35306) (not b_next!1263) b_and!2087 (not start!4522))
(check-sat b_and!2087 (not b_next!1263))
(get-model)

(declare-fun d!5297 () Bool)

(assert (=> d!5297 (= (validKeyInArray!0 (select (arr!1172 _keys!1833) (index!2767 lt!12951))) (and (not (= (select (arr!1172 _keys!1833) (index!2767 lt!12951)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1172 _keys!1833) (index!2767 lt!12951)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35304 d!5297))

(declare-fun d!5299 () Bool)

(declare-fun e!22327 () Bool)

(assert (=> d!5299 e!22327))

(declare-fun res!21483 () Bool)

(assert (=> d!5299 (=> res!21483 e!22327)))

(declare-fun lt!12963 () Bool)

(assert (=> d!5299 (= res!21483 (not lt!12963))))

(declare-fun lt!12965 () Bool)

(assert (=> d!5299 (= lt!12963 lt!12965)))

(declare-datatypes ((Unit!781 0))(
  ( (Unit!782) )
))
(declare-fun lt!12966 () Unit!781)

(declare-fun e!22326 () Unit!781)

(assert (=> d!5299 (= lt!12966 e!22326)))

(declare-fun c!3997 () Bool)

(assert (=> d!5299 (= c!3997 lt!12965)))

(declare-fun containsKey!36 (List!940 (_ BitVec 64)) Bool)

(assert (=> d!5299 (= lt!12965 (containsKey!36 (toList!478 (getCurrentListMap!302 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!5299 (= (contains!425 (getCurrentListMap!302 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!12963)))

(declare-fun b!35349 () Bool)

(declare-fun lt!12964 () Unit!781)

(assert (=> b!35349 (= e!22326 lt!12964)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!33 (List!940 (_ BitVec 64)) Unit!781)

(assert (=> b!35349 (= lt!12964 (lemmaContainsKeyImpliesGetValueByKeyDefined!33 (toList!478 (getCurrentListMap!302 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!78 0))(
  ( (Some!77 (v!1933 V!1981)) (None!76) )
))
(declare-fun isDefined!34 (Option!78) Bool)

(declare-fun getValueByKey!72 (List!940 (_ BitVec 64)) Option!78)

(assert (=> b!35349 (isDefined!34 (getValueByKey!72 (toList!478 (getCurrentListMap!302 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!35350 () Bool)

(declare-fun Unit!783 () Unit!781)

(assert (=> b!35350 (= e!22326 Unit!783)))

(declare-fun b!35351 () Bool)

(assert (=> b!35351 (= e!22327 (isDefined!34 (getValueByKey!72 (toList!478 (getCurrentListMap!302 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!5299 c!3997) b!35349))

(assert (= (and d!5299 (not c!3997)) b!35350))

(assert (= (and d!5299 (not res!21483)) b!35351))

(declare-fun m!28445 () Bool)

(assert (=> d!5299 m!28445))

(declare-fun m!28447 () Bool)

(assert (=> b!35349 m!28447))

(declare-fun m!28449 () Bool)

(assert (=> b!35349 m!28449))

(assert (=> b!35349 m!28449))

(declare-fun m!28451 () Bool)

(assert (=> b!35349 m!28451))

(assert (=> b!35351 m!28449))

(assert (=> b!35351 m!28449))

(assert (=> b!35351 m!28451))

(assert (=> b!35299 d!5299))

(declare-fun b!35394 () Bool)

(declare-fun e!22359 () Bool)

(declare-fun e!22360 () Bool)

(assert (=> b!35394 (= e!22359 e!22360)))

(declare-fun res!21505 () Bool)

(assert (=> b!35394 (=> (not res!21505) (not e!22360))))

(declare-fun lt!13025 () ListLongMap!925)

(assert (=> b!35394 (= res!21505 (contains!425 lt!13025 (select (arr!1172 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!35394 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1273 _keys!1833)))))

(declare-fun b!35395 () Bool)

(declare-fun e!22358 () Bool)

(declare-fun e!22361 () Bool)

(assert (=> b!35395 (= e!22358 e!22361)))

(declare-fun res!21508 () Bool)

(declare-fun call!2795 () Bool)

(assert (=> b!35395 (= res!21508 call!2795)))

(assert (=> b!35395 (=> (not res!21508) (not e!22361))))

(declare-fun b!35396 () Bool)

(declare-fun e!22354 () Bool)

(declare-fun call!2793 () Bool)

(assert (=> b!35396 (= e!22354 (not call!2793))))

(declare-fun b!35397 () Bool)

(declare-fun e!22362 () ListLongMap!925)

(declare-fun call!2799 () ListLongMap!925)

(assert (=> b!35397 (= e!22362 call!2799)))

(declare-fun b!35398 () Bool)

(declare-fun e!22363 () Bool)

(assert (=> b!35398 (= e!22363 e!22358)))

(declare-fun c!4014 () Bool)

(assert (=> b!35398 (= c!4014 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!35399 () Bool)

(declare-fun e!22365 () ListLongMap!925)

(declare-fun call!2798 () ListLongMap!925)

(assert (=> b!35399 (= e!22365 call!2798)))

(declare-fun b!35400 () Bool)

(declare-fun e!22364 () Unit!781)

(declare-fun lt!13020 () Unit!781)

(assert (=> b!35400 (= e!22364 lt!13020)))

(declare-fun lt!13012 () ListLongMap!925)

(declare-fun getCurrentListMapNoExtraKeys!27 (array!2451 array!2449 (_ BitVec 32) (_ BitVec 32) V!1981 V!1981 (_ BitVec 32) Int) ListLongMap!925)

(assert (=> b!35400 (= lt!13012 (getCurrentListMapNoExtraKeys!27 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13011 () (_ BitVec 64))

(assert (=> b!35400 (= lt!13011 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13016 () (_ BitVec 64))

(assert (=> b!35400 (= lt!13016 (select (arr!1172 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13032 () Unit!781)

(declare-fun addStillContains!25 (ListLongMap!925 (_ BitVec 64) V!1981 (_ BitVec 64)) Unit!781)

(assert (=> b!35400 (= lt!13032 (addStillContains!25 lt!13012 lt!13011 zeroValue!1443 lt!13016))))

(declare-fun +!58 (ListLongMap!925 tuple2!1348) ListLongMap!925)

(assert (=> b!35400 (contains!425 (+!58 lt!13012 (tuple2!1349 lt!13011 zeroValue!1443)) lt!13016)))

(declare-fun lt!13022 () Unit!781)

(assert (=> b!35400 (= lt!13022 lt!13032)))

(declare-fun lt!13030 () ListLongMap!925)

(assert (=> b!35400 (= lt!13030 (getCurrentListMapNoExtraKeys!27 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13018 () (_ BitVec 64))

(assert (=> b!35400 (= lt!13018 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13021 () (_ BitVec 64))

(assert (=> b!35400 (= lt!13021 (select (arr!1172 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13031 () Unit!781)

(declare-fun addApplyDifferent!25 (ListLongMap!925 (_ BitVec 64) V!1981 (_ BitVec 64)) Unit!781)

(assert (=> b!35400 (= lt!13031 (addApplyDifferent!25 lt!13030 lt!13018 minValue!1443 lt!13021))))

(declare-fun apply!40 (ListLongMap!925 (_ BitVec 64)) V!1981)

(assert (=> b!35400 (= (apply!40 (+!58 lt!13030 (tuple2!1349 lt!13018 minValue!1443)) lt!13021) (apply!40 lt!13030 lt!13021))))

(declare-fun lt!13027 () Unit!781)

(assert (=> b!35400 (= lt!13027 lt!13031)))

(declare-fun lt!13013 () ListLongMap!925)

(assert (=> b!35400 (= lt!13013 (getCurrentListMapNoExtraKeys!27 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13017 () (_ BitVec 64))

(assert (=> b!35400 (= lt!13017 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13014 () (_ BitVec 64))

(assert (=> b!35400 (= lt!13014 (select (arr!1172 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13024 () Unit!781)

(assert (=> b!35400 (= lt!13024 (addApplyDifferent!25 lt!13013 lt!13017 zeroValue!1443 lt!13014))))

(assert (=> b!35400 (= (apply!40 (+!58 lt!13013 (tuple2!1349 lt!13017 zeroValue!1443)) lt!13014) (apply!40 lt!13013 lt!13014))))

(declare-fun lt!13026 () Unit!781)

(assert (=> b!35400 (= lt!13026 lt!13024)))

(declare-fun lt!13023 () ListLongMap!925)

(assert (=> b!35400 (= lt!13023 (getCurrentListMapNoExtraKeys!27 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13015 () (_ BitVec 64))

(assert (=> b!35400 (= lt!13015 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13029 () (_ BitVec 64))

(assert (=> b!35400 (= lt!13029 (select (arr!1172 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!35400 (= lt!13020 (addApplyDifferent!25 lt!13023 lt!13015 minValue!1443 lt!13029))))

(assert (=> b!35400 (= (apply!40 (+!58 lt!13023 (tuple2!1349 lt!13015 minValue!1443)) lt!13029) (apply!40 lt!13023 lt!13029))))

(declare-fun b!35401 () Bool)

(declare-fun e!22356 () ListLongMap!925)

(declare-fun call!2797 () ListLongMap!925)

(assert (=> b!35401 (= e!22356 (+!58 call!2797 (tuple2!1349 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!35403 () Bool)

(declare-fun e!22366 () Bool)

(assert (=> b!35403 (= e!22366 (validKeyInArray!0 (select (arr!1172 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35404 () Bool)

(declare-fun res!21509 () Bool)

(assert (=> b!35404 (=> (not res!21509) (not e!22363))))

(assert (=> b!35404 (= res!21509 e!22359)))

(declare-fun res!21503 () Bool)

(assert (=> b!35404 (=> res!21503 e!22359)))

(assert (=> b!35404 (= res!21503 (not e!22366))))

(declare-fun res!21506 () Bool)

(assert (=> b!35404 (=> (not res!21506) (not e!22366))))

(assert (=> b!35404 (= res!21506 (bvslt #b00000000000000000000000000000000 (size!1273 _keys!1833)))))

(declare-fun b!35405 () Bool)

(assert (=> b!35405 (= e!22356 e!22365)))

(declare-fun c!4013 () Bool)

(assert (=> b!35405 (= c!4013 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2790 () Bool)

(declare-fun call!2794 () ListLongMap!925)

(assert (=> bm!2790 (= call!2799 call!2794)))

(declare-fun bm!2791 () Bool)

(assert (=> bm!2791 (= call!2793 (contains!425 lt!13025 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2792 () Bool)

(assert (=> bm!2792 (= call!2795 (contains!425 lt!13025 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2793 () Bool)

(declare-fun call!2796 () ListLongMap!925)

(assert (=> bm!2793 (= call!2794 call!2796)))

(declare-fun b!35406 () Bool)

(assert (=> b!35406 (= e!22362 call!2798)))

(declare-fun b!35402 () Bool)

(declare-fun res!21507 () Bool)

(assert (=> b!35402 (=> (not res!21507) (not e!22363))))

(assert (=> b!35402 (= res!21507 e!22354)))

(declare-fun c!4015 () Bool)

(assert (=> b!35402 (= c!4015 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!5301 () Bool)

(assert (=> d!5301 e!22363))

(declare-fun res!21502 () Bool)

(assert (=> d!5301 (=> (not res!21502) (not e!22363))))

(assert (=> d!5301 (= res!21502 (or (bvsge #b00000000000000000000000000000000 (size!1273 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1273 _keys!1833)))))))

(declare-fun lt!13028 () ListLongMap!925)

(assert (=> d!5301 (= lt!13025 lt!13028)))

(declare-fun lt!13019 () Unit!781)

(assert (=> d!5301 (= lt!13019 e!22364)))

(declare-fun c!4010 () Bool)

(declare-fun e!22357 () Bool)

(assert (=> d!5301 (= c!4010 e!22357)))

(declare-fun res!21504 () Bool)

(assert (=> d!5301 (=> (not res!21504) (not e!22357))))

(assert (=> d!5301 (= res!21504 (bvslt #b00000000000000000000000000000000 (size!1273 _keys!1833)))))

(assert (=> d!5301 (= lt!13028 e!22356)))

(declare-fun c!4011 () Bool)

(assert (=> d!5301 (= c!4011 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5301 (validMask!0 mask!2294)))

(assert (=> d!5301 (= (getCurrentListMap!302 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!13025)))

(declare-fun b!35407 () Bool)

(declare-fun Unit!784 () Unit!781)

(assert (=> b!35407 (= e!22364 Unit!784)))

(declare-fun b!35408 () Bool)

(declare-fun e!22355 () Bool)

(assert (=> b!35408 (= e!22355 (= (apply!40 lt!13025 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!35409 () Bool)

(declare-fun get!603 (ValueCell!609 V!1981) V!1981)

(declare-fun dynLambda!157 (Int (_ BitVec 64)) V!1981)

(assert (=> b!35409 (= e!22360 (= (apply!40 lt!13025 (select (arr!1172 _keys!1833) #b00000000000000000000000000000000)) (get!603 (select (arr!1171 _values!1501) #b00000000000000000000000000000000) (dynLambda!157 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35409 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1272 _values!1501)))))

(assert (=> b!35409 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1273 _keys!1833)))))

(declare-fun b!35410 () Bool)

(assert (=> b!35410 (= e!22358 (not call!2795))))

(declare-fun bm!2794 () Bool)

(assert (=> bm!2794 (= call!2797 (+!58 (ite c!4011 call!2796 (ite c!4013 call!2794 call!2799)) (ite (or c!4011 c!4013) (tuple2!1349 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1349 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!35411 () Bool)

(assert (=> b!35411 (= e!22354 e!22355)))

(declare-fun res!21510 () Bool)

(assert (=> b!35411 (= res!21510 call!2793)))

(assert (=> b!35411 (=> (not res!21510) (not e!22355))))

(declare-fun bm!2795 () Bool)

(assert (=> bm!2795 (= call!2796 (getCurrentListMapNoExtraKeys!27 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!35412 () Bool)

(assert (=> b!35412 (= e!22361 (= (apply!40 lt!13025 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun bm!2796 () Bool)

(assert (=> bm!2796 (= call!2798 call!2797)))

(declare-fun b!35413 () Bool)

(assert (=> b!35413 (= e!22357 (validKeyInArray!0 (select (arr!1172 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35414 () Bool)

(declare-fun c!4012 () Bool)

(assert (=> b!35414 (= c!4012 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!35414 (= e!22365 e!22362)))

(assert (= (and d!5301 c!4011) b!35401))

(assert (= (and d!5301 (not c!4011)) b!35405))

(assert (= (and b!35405 c!4013) b!35399))

(assert (= (and b!35405 (not c!4013)) b!35414))

(assert (= (and b!35414 c!4012) b!35406))

(assert (= (and b!35414 (not c!4012)) b!35397))

(assert (= (or b!35406 b!35397) bm!2790))

(assert (= (or b!35399 bm!2790) bm!2793))

(assert (= (or b!35399 b!35406) bm!2796))

(assert (= (or b!35401 bm!2793) bm!2795))

(assert (= (or b!35401 bm!2796) bm!2794))

(assert (= (and d!5301 res!21504) b!35413))

(assert (= (and d!5301 c!4010) b!35400))

(assert (= (and d!5301 (not c!4010)) b!35407))

(assert (= (and d!5301 res!21502) b!35404))

(assert (= (and b!35404 res!21506) b!35403))

(assert (= (and b!35404 (not res!21503)) b!35394))

(assert (= (and b!35394 res!21505) b!35409))

(assert (= (and b!35404 res!21509) b!35402))

(assert (= (and b!35402 c!4015) b!35411))

(assert (= (and b!35402 (not c!4015)) b!35396))

(assert (= (and b!35411 res!21510) b!35408))

(assert (= (or b!35411 b!35396) bm!2791))

(assert (= (and b!35402 res!21507) b!35398))

(assert (= (and b!35398 c!4014) b!35395))

(assert (= (and b!35398 (not c!4014)) b!35410))

(assert (= (and b!35395 res!21508) b!35412))

(assert (= (or b!35395 b!35410) bm!2792))

(declare-fun b_lambda!1723 () Bool)

(assert (=> (not b_lambda!1723) (not b!35409)))

(declare-fun t!3650 () Bool)

(declare-fun tb!695 () Bool)

(assert (=> (and start!4522 (= defaultEntry!1504 defaultEntry!1504) t!3650) tb!695))

(declare-fun result!1195 () Bool)

(assert (=> tb!695 (= result!1195 tp_is_empty!1617)))

(assert (=> b!35409 t!3650))

(declare-fun b_and!2091 () Bool)

(assert (= b_and!2087 (and (=> t!3650 result!1195) b_and!2091)))

(declare-fun m!28453 () Bool)

(assert (=> bm!2794 m!28453))

(declare-fun m!28455 () Bool)

(assert (=> b!35409 m!28455))

(declare-fun m!28457 () Bool)

(assert (=> b!35409 m!28457))

(declare-fun m!28459 () Bool)

(assert (=> b!35409 m!28459))

(declare-fun m!28461 () Bool)

(assert (=> b!35409 m!28461))

(assert (=> b!35409 m!28461))

(declare-fun m!28463 () Bool)

(assert (=> b!35409 m!28463))

(assert (=> b!35409 m!28457))

(assert (=> b!35409 m!28455))

(declare-fun m!28465 () Bool)

(assert (=> b!35400 m!28465))

(declare-fun m!28467 () Bool)

(assert (=> b!35400 m!28467))

(declare-fun m!28469 () Bool)

(assert (=> b!35400 m!28469))

(declare-fun m!28471 () Bool)

(assert (=> b!35400 m!28471))

(declare-fun m!28473 () Bool)

(assert (=> b!35400 m!28473))

(declare-fun m!28475 () Bool)

(assert (=> b!35400 m!28475))

(declare-fun m!28477 () Bool)

(assert (=> b!35400 m!28477))

(assert (=> b!35400 m!28461))

(assert (=> b!35400 m!28467))

(declare-fun m!28479 () Bool)

(assert (=> b!35400 m!28479))

(declare-fun m!28481 () Bool)

(assert (=> b!35400 m!28481))

(declare-fun m!28483 () Bool)

(assert (=> b!35400 m!28483))

(declare-fun m!28485 () Bool)

(assert (=> b!35400 m!28485))

(assert (=> b!35400 m!28469))

(assert (=> b!35400 m!28483))

(declare-fun m!28487 () Bool)

(assert (=> b!35400 m!28487))

(assert (=> b!35400 m!28473))

(declare-fun m!28489 () Bool)

(assert (=> b!35400 m!28489))

(declare-fun m!28491 () Bool)

(assert (=> b!35400 m!28491))

(declare-fun m!28493 () Bool)

(assert (=> b!35400 m!28493))

(declare-fun m!28495 () Bool)

(assert (=> b!35400 m!28495))

(assert (=> b!35403 m!28461))

(assert (=> b!35403 m!28461))

(declare-fun m!28497 () Bool)

(assert (=> b!35403 m!28497))

(declare-fun m!28499 () Bool)

(assert (=> bm!2792 m!28499))

(declare-fun m!28501 () Bool)

(assert (=> bm!2791 m!28501))

(assert (=> b!35413 m!28461))

(assert (=> b!35413 m!28461))

(assert (=> b!35413 m!28497))

(assert (=> d!5301 m!28407))

(declare-fun m!28503 () Bool)

(assert (=> b!35408 m!28503))

(assert (=> bm!2795 m!28491))

(declare-fun m!28505 () Bool)

(assert (=> b!35412 m!28505))

(declare-fun m!28507 () Bool)

(assert (=> b!35401 m!28507))

(assert (=> b!35394 m!28461))

(assert (=> b!35394 m!28461))

(declare-fun m!28509 () Bool)

(assert (=> b!35394 m!28509))

(assert (=> b!35299 d!5301))

(declare-fun bm!2799 () Bool)

(declare-fun call!2802 () Bool)

(declare-fun c!4018 () Bool)

(assert (=> bm!2799 (= call!2802 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4018 (Cons!937 (select (arr!1172 _keys!1833) #b00000000000000000000000000000000) Nil!938) Nil!938)))))

(declare-fun b!35428 () Bool)

(declare-fun e!22375 () Bool)

(assert (=> b!35428 (= e!22375 call!2802)))

(declare-fun b!35429 () Bool)

(declare-fun e!22377 () Bool)

(declare-fun e!22376 () Bool)

(assert (=> b!35429 (= e!22377 e!22376)))

(declare-fun res!21519 () Bool)

(assert (=> b!35429 (=> (not res!21519) (not e!22376))))

(declare-fun e!22378 () Bool)

(assert (=> b!35429 (= res!21519 (not e!22378))))

(declare-fun res!21517 () Bool)

(assert (=> b!35429 (=> (not res!21517) (not e!22378))))

(assert (=> b!35429 (= res!21517 (validKeyInArray!0 (select (arr!1172 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35427 () Bool)

(assert (=> b!35427 (= e!22376 e!22375)))

(assert (=> b!35427 (= c!4018 (validKeyInArray!0 (select (arr!1172 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5303 () Bool)

(declare-fun res!21518 () Bool)

(assert (=> d!5303 (=> res!21518 e!22377)))

(assert (=> d!5303 (= res!21518 (bvsge #b00000000000000000000000000000000 (size!1273 _keys!1833)))))

(assert (=> d!5303 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!938) e!22377)))

(declare-fun b!35430 () Bool)

(assert (=> b!35430 (= e!22375 call!2802)))

(declare-fun b!35431 () Bool)

(declare-fun contains!426 (List!941 (_ BitVec 64)) Bool)

(assert (=> b!35431 (= e!22378 (contains!426 Nil!938 (select (arr!1172 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5303 (not res!21518)) b!35429))

(assert (= (and b!35429 res!21517) b!35431))

(assert (= (and b!35429 res!21519) b!35427))

(assert (= (and b!35427 c!4018) b!35430))

(assert (= (and b!35427 (not c!4018)) b!35428))

(assert (= (or b!35430 b!35428) bm!2799))

(assert (=> bm!2799 m!28461))

(declare-fun m!28511 () Bool)

(assert (=> bm!2799 m!28511))

(assert (=> b!35429 m!28461))

(assert (=> b!35429 m!28461))

(assert (=> b!35429 m!28497))

(assert (=> b!35427 m!28461))

(assert (=> b!35427 m!28461))

(assert (=> b!35427 m!28497))

(assert (=> b!35431 m!28461))

(assert (=> b!35431 m!28461))

(declare-fun m!28513 () Bool)

(assert (=> b!35431 m!28513))

(assert (=> b!35300 d!5303))

(declare-fun d!5305 () Bool)

(assert (=> d!5305 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35302 d!5305))

(declare-fun d!5307 () Bool)

(declare-fun res!21524 () Bool)

(declare-fun e!22383 () Bool)

(assert (=> d!5307 (=> res!21524 e!22383)))

(assert (=> d!5307 (= res!21524 (= (select (arr!1172 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5307 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!22383)))

(declare-fun b!35436 () Bool)

(declare-fun e!22384 () Bool)

(assert (=> b!35436 (= e!22383 e!22384)))

(declare-fun res!21525 () Bool)

(assert (=> b!35436 (=> (not res!21525) (not e!22384))))

(assert (=> b!35436 (= res!21525 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1273 _keys!1833)))))

(declare-fun b!35437 () Bool)

(assert (=> b!35437 (= e!22384 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5307 (not res!21524)) b!35436))

(assert (= (and b!35436 res!21525) b!35437))

(assert (=> d!5307 m!28461))

(declare-fun m!28515 () Bool)

(assert (=> b!35437 m!28515))

(assert (=> b!35306 d!5307))

(declare-fun d!5309 () Bool)

(assert (=> d!5309 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4522 d!5309))

(declare-fun d!5311 () Bool)

(assert (=> d!5311 (= (array_inv!827 _values!1501) (bvsge (size!1272 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4522 d!5311))

(declare-fun d!5313 () Bool)

(assert (=> d!5313 (= (array_inv!828 _keys!1833) (bvsge (size!1273 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4522 d!5313))

(declare-fun bm!2802 () Bool)

(declare-fun call!2805 () Bool)

(assert (=> bm!2802 (= call!2805 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun d!5315 () Bool)

(declare-fun res!21531 () Bool)

(declare-fun e!22393 () Bool)

(assert (=> d!5315 (=> res!21531 e!22393)))

(assert (=> d!5315 (= res!21531 (bvsge #b00000000000000000000000000000000 (size!1273 _keys!1833)))))

(assert (=> d!5315 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!22393)))

(declare-fun b!35446 () Bool)

(declare-fun e!22391 () Bool)

(assert (=> b!35446 (= e!22391 call!2805)))

(declare-fun b!35447 () Bool)

(declare-fun e!22392 () Bool)

(assert (=> b!35447 (= e!22391 e!22392)))

(declare-fun lt!13040 () (_ BitVec 64))

(assert (=> b!35447 (= lt!13040 (select (arr!1172 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13041 () Unit!781)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2451 (_ BitVec 64) (_ BitVec 32)) Unit!781)

(assert (=> b!35447 (= lt!13041 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!13040 #b00000000000000000000000000000000))))

(assert (=> b!35447 (arrayContainsKey!0 _keys!1833 lt!13040 #b00000000000000000000000000000000)))

(declare-fun lt!13039 () Unit!781)

(assert (=> b!35447 (= lt!13039 lt!13041)))

(declare-fun res!21530 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2451 (_ BitVec 32)) SeekEntryResult!161)

(assert (=> b!35447 (= res!21530 (= (seekEntryOrOpen!0 (select (arr!1172 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!161 #b00000000000000000000000000000000)))))

(assert (=> b!35447 (=> (not res!21530) (not e!22392))))

(declare-fun b!35448 () Bool)

(assert (=> b!35448 (= e!22393 e!22391)))

(declare-fun c!4021 () Bool)

(assert (=> b!35448 (= c!4021 (validKeyInArray!0 (select (arr!1172 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35449 () Bool)

(assert (=> b!35449 (= e!22392 call!2805)))

(assert (= (and d!5315 (not res!21531)) b!35448))

(assert (= (and b!35448 c!4021) b!35447))

(assert (= (and b!35448 (not c!4021)) b!35446))

(assert (= (and b!35447 res!21530) b!35449))

(assert (= (or b!35449 b!35446) bm!2802))

(declare-fun m!28517 () Bool)

(assert (=> bm!2802 m!28517))

(assert (=> b!35447 m!28461))

(declare-fun m!28519 () Bool)

(assert (=> b!35447 m!28519))

(declare-fun m!28521 () Bool)

(assert (=> b!35447 m!28521))

(assert (=> b!35447 m!28461))

(declare-fun m!28523 () Bool)

(assert (=> b!35447 m!28523))

(assert (=> b!35448 m!28461))

(assert (=> b!35448 m!28461))

(assert (=> b!35448 m!28497))

(assert (=> b!35308 d!5315))

(declare-fun b!35462 () Bool)

(declare-fun e!22402 () SeekEntryResult!161)

(declare-fun lt!13051 () SeekEntryResult!161)

(assert (=> b!35462 (= e!22402 (Found!161 (index!2768 lt!13051)))))

(declare-fun b!35463 () Bool)

(declare-fun c!4030 () Bool)

(declare-fun lt!13050 () (_ BitVec 64))

(assert (=> b!35463 (= c!4030 (= lt!13050 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22401 () SeekEntryResult!161)

(assert (=> b!35463 (= e!22402 e!22401)))

(declare-fun b!35464 () Bool)

(assert (=> b!35464 (= e!22401 (MissingZero!161 (index!2768 lt!13051)))))

(declare-fun d!5317 () Bool)

(declare-fun lt!13052 () SeekEntryResult!161)

(assert (=> d!5317 (and (or ((_ is MissingVacant!161) lt!13052) (not ((_ is Found!161) lt!13052)) (and (bvsge (index!2767 lt!13052) #b00000000000000000000000000000000) (bvslt (index!2767 lt!13052) (size!1273 _keys!1833)))) (not ((_ is MissingVacant!161) lt!13052)) (or (not ((_ is Found!161) lt!13052)) (= (select (arr!1172 _keys!1833) (index!2767 lt!13052)) k0!1304)))))

(declare-fun e!22400 () SeekEntryResult!161)

(assert (=> d!5317 (= lt!13052 e!22400)))

(declare-fun c!4028 () Bool)

(assert (=> d!5317 (= c!4028 (and ((_ is Intermediate!161) lt!13051) (undefined!973 lt!13051)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2451 (_ BitVec 32)) SeekEntryResult!161)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5317 (= lt!13051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5317 (validMask!0 mask!2294)))

(assert (=> d!5317 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!13052)))

(declare-fun b!35465 () Bool)

(declare-fun lt!13053 () SeekEntryResult!161)

(assert (=> b!35465 (= e!22401 (ite ((_ is MissingVacant!161) lt!13053) (MissingZero!161 (index!2769 lt!13053)) lt!13053))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2451 (_ BitVec 32)) SeekEntryResult!161)

(assert (=> b!35465 (= lt!13053 (seekKeyOrZeroReturnVacant!0 (x!7005 lt!13051) (index!2768 lt!13051) (index!2768 lt!13051) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!35466 () Bool)

(assert (=> b!35466 (= e!22400 Undefined!161)))

(declare-fun b!35467 () Bool)

(assert (=> b!35467 (= e!22400 e!22402)))

(assert (=> b!35467 (= lt!13050 (select (arr!1172 _keys!1833) (index!2768 lt!13051)))))

(declare-fun c!4029 () Bool)

(assert (=> b!35467 (= c!4029 (= lt!13050 k0!1304))))

(assert (= (and d!5317 c!4028) b!35466))

(assert (= (and d!5317 (not c!4028)) b!35467))

(assert (= (and b!35467 c!4029) b!35462))

(assert (= (and b!35467 (not c!4029)) b!35463))

(assert (= (and b!35463 c!4030) b!35464))

(assert (= (and b!35463 (not c!4030)) b!35465))

(declare-fun m!28525 () Bool)

(assert (=> d!5317 m!28525))

(declare-fun m!28527 () Bool)

(assert (=> d!5317 m!28527))

(assert (=> d!5317 m!28527))

(declare-fun m!28529 () Bool)

(assert (=> d!5317 m!28529))

(assert (=> d!5317 m!28407))

(declare-fun m!28531 () Bool)

(assert (=> b!35465 m!28531))

(declare-fun m!28533 () Bool)

(assert (=> b!35467 m!28533))

(assert (=> b!35303 d!5317))

(declare-fun condMapEmpty!1981 () Bool)

(declare-fun mapDefault!1981 () ValueCell!609)

(assert (=> mapNonEmpty!1975 (= condMapEmpty!1981 (= mapRest!1975 ((as const (Array (_ BitVec 32) ValueCell!609)) mapDefault!1981)))))

(declare-fun e!22407 () Bool)

(declare-fun mapRes!1981 () Bool)

(assert (=> mapNonEmpty!1975 (= tp!5230 (and e!22407 mapRes!1981))))

(declare-fun b!35475 () Bool)

(assert (=> b!35475 (= e!22407 tp_is_empty!1617)))

(declare-fun mapIsEmpty!1981 () Bool)

(assert (=> mapIsEmpty!1981 mapRes!1981))

(declare-fun b!35474 () Bool)

(declare-fun e!22408 () Bool)

(assert (=> b!35474 (= e!22408 tp_is_empty!1617)))

(declare-fun mapNonEmpty!1981 () Bool)

(declare-fun tp!5239 () Bool)

(assert (=> mapNonEmpty!1981 (= mapRes!1981 (and tp!5239 e!22408))))

(declare-fun mapRest!1981 () (Array (_ BitVec 32) ValueCell!609))

(declare-fun mapValue!1981 () ValueCell!609)

(declare-fun mapKey!1981 () (_ BitVec 32))

(assert (=> mapNonEmpty!1981 (= mapRest!1975 (store mapRest!1981 mapKey!1981 mapValue!1981))))

(assert (= (and mapNonEmpty!1975 condMapEmpty!1981) mapIsEmpty!1981))

(assert (= (and mapNonEmpty!1975 (not condMapEmpty!1981)) mapNonEmpty!1981))

(assert (= (and mapNonEmpty!1981 ((_ is ValueCellFull!609) mapValue!1981)) b!35474))

(assert (= (and mapNonEmpty!1975 ((_ is ValueCellFull!609) mapDefault!1981)) b!35475))

(declare-fun m!28535 () Bool)

(assert (=> mapNonEmpty!1981 m!28535))

(declare-fun b_lambda!1725 () Bool)

(assert (= b_lambda!1723 (or (and start!4522 b_free!1263) b_lambda!1725)))

(check-sat (not b!35412) b_and!2091 (not b!35409) (not b!35429) (not d!5317) (not b!35431) (not b!35448) (not bm!2802) (not b!35394) (not d!5301) (not b!35447) (not b_next!1263) (not bm!2792) (not b!35465) (not b!35400) (not b!35413) (not b!35427) (not b!35351) (not bm!2799) (not b!35437) (not bm!2791) (not mapNonEmpty!1981) (not b!35403) (not bm!2794) (not d!5299) (not b!35349) (not bm!2795) (not b!35401) (not b_lambda!1725) tp_is_empty!1617 (not b!35408))
(check-sat b_and!2091 (not b_next!1263))
