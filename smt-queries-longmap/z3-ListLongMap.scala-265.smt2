; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4338 () Bool)

(assert start!4338)

(declare-fun b_free!1179 () Bool)

(declare-fun b_next!1179 () Bool)

(assert (=> start!4338 (= b_free!1179 (not b_next!1179))))

(declare-fun tp!4965 () Bool)

(declare-fun b_and!1995 () Bool)

(assert (=> start!4338 (= tp!4965 b_and!1995)))

(declare-fun mapIsEmpty!1837 () Bool)

(declare-fun mapRes!1837 () Bool)

(assert (=> mapIsEmpty!1837 mapRes!1837))

(declare-fun b!33462 () Bool)

(declare-fun e!21250 () Bool)

(declare-fun tp_is_empty!1533 () Bool)

(assert (=> b!33462 (= e!21250 tp_is_empty!1533)))

(declare-fun b!33463 () Bool)

(declare-fun e!21251 () Bool)

(assert (=> b!33463 (= e!21251 (and e!21250 mapRes!1837))))

(declare-fun condMapEmpty!1837 () Bool)

(declare-datatypes ((V!1869 0))(
  ( (V!1870 (val!793 Int)) )
))
(declare-datatypes ((ValueCell!567 0))(
  ( (ValueCellFull!567 (v!1885 V!1869)) (EmptyCell!567) )
))
(declare-datatypes ((array!2279 0))(
  ( (array!2280 (arr!1090 (Array (_ BitVec 32) ValueCell!567)) (size!1191 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2279)

(declare-fun mapDefault!1837 () ValueCell!567)

(assert (=> b!33463 (= condMapEmpty!1837 (= (arr!1090 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!567)) mapDefault!1837)))))

(declare-fun b!33464 () Bool)

(declare-fun e!21248 () Bool)

(declare-fun e!21252 () Bool)

(assert (=> b!33464 (= e!21248 e!21252)))

(declare-fun res!20344 () Bool)

(assert (=> b!33464 (=> (not res!20344) (not e!21252))))

(declare-datatypes ((tuple2!1292 0))(
  ( (tuple2!1293 (_1!657 (_ BitVec 64)) (_2!657 V!1869)) )
))
(declare-datatypes ((List!882 0))(
  ( (Nil!879) (Cons!878 (h!1445 tuple2!1292) (t!3581 List!882)) )
))
(declare-datatypes ((ListLongMap!869 0))(
  ( (ListLongMap!870 (toList!450 List!882)) )
))
(declare-fun lt!12198 () ListLongMap!869)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!393 (ListLongMap!869 (_ BitVec 64)) Bool)

(assert (=> b!33464 (= res!20344 (not (contains!393 lt!12198 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2281 0))(
  ( (array!2282 (arr!1091 (Array (_ BitVec 32) (_ BitVec 64))) (size!1192 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2281)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1869)

(declare-fun minValue!1443 () V!1869)

(declare-fun getCurrentListMap!276 (array!2281 array!2279 (_ BitVec 32) (_ BitVec 32) V!1869 V!1869 (_ BitVec 32) Int) ListLongMap!869)

(assert (=> b!33464 (= lt!12198 (getCurrentListMap!276 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapNonEmpty!1837 () Bool)

(declare-fun tp!4966 () Bool)

(declare-fun e!21253 () Bool)

(assert (=> mapNonEmpty!1837 (= mapRes!1837 (and tp!4966 e!21253))))

(declare-fun mapRest!1837 () (Array (_ BitVec 32) ValueCell!567))

(declare-fun mapValue!1837 () ValueCell!567)

(declare-fun mapKey!1837 () (_ BitVec 32))

(assert (=> mapNonEmpty!1837 (= (arr!1090 _values!1501) (store mapRest!1837 mapKey!1837 mapValue!1837))))

(declare-fun b!33465 () Bool)

(declare-fun res!20348 () Bool)

(assert (=> b!33465 (=> (not res!20348) (not e!21248))))

(declare-datatypes ((List!883 0))(
  ( (Nil!880) (Cons!879 (h!1446 (_ BitVec 64)) (t!3582 List!883)) )
))
(declare-fun arrayNoDuplicates!0 (array!2281 (_ BitVec 32) List!883) Bool)

(assert (=> b!33465 (= res!20348 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!880))))

(declare-fun b!33466 () Bool)

(declare-fun res!20349 () Bool)

(assert (=> b!33466 (=> (not res!20349) (not e!21248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2281 (_ BitVec 32)) Bool)

(assert (=> b!33466 (= res!20349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33467 () Bool)

(assert (=> b!33467 (= e!21253 tp_is_empty!1533)))

(declare-fun b!33468 () Bool)

(declare-fun res!20347 () Bool)

(assert (=> b!33468 (=> (not res!20347) (not e!21248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33468 (= res!20347 (validKeyInArray!0 k0!1304))))

(declare-fun b!33469 () Bool)

(assert (=> b!33469 (= e!21252 (not (or (not (= (size!1192 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))) (bvsle #b00000000000000000000000000000000 (size!1192 _keys!1833)))))))

(declare-datatypes ((SeekEntryResult!130 0))(
  ( (MissingZero!130 (index!2642 (_ BitVec 32))) (Found!130 (index!2643 (_ BitVec 32))) (Intermediate!130 (undefined!942 Bool) (index!2644 (_ BitVec 32)) (x!6822 (_ BitVec 32))) (Undefined!130) (MissingVacant!130 (index!2645 (_ BitVec 32))) )
))
(declare-fun lt!12199 () SeekEntryResult!130)

(declare-fun lt!12197 () (_ BitVec 32))

(get-info :version)

(assert (=> b!33469 (and ((_ is Found!130) lt!12199) (= (index!2643 lt!12199) lt!12197))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2281 (_ BitVec 32)) SeekEntryResult!130)

(assert (=> b!33469 (= lt!12199 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!748 0))(
  ( (Unit!749) )
))
(declare-fun lt!12200 () Unit!748)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2281 (_ BitVec 32)) Unit!748)

(assert (=> b!33469 (= lt!12200 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12197 _keys!1833 mask!2294))))

(assert (=> b!33469 (contains!393 lt!12198 (select (arr!1091 _keys!1833) lt!12197))))

(declare-fun lt!12201 () Unit!748)

(declare-fun lemmaValidKeyInArrayIsInListMap!62 (array!2281 array!2279 (_ BitVec 32) (_ BitVec 32) V!1869 V!1869 (_ BitVec 32) Int) Unit!748)

(assert (=> b!33469 (= lt!12201 (lemmaValidKeyInArrayIsInListMap!62 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12197 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2281 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33469 (= lt!12197 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!20346 () Bool)

(assert (=> start!4338 (=> (not res!20346) (not e!21248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4338 (= res!20346 (validMask!0 mask!2294))))

(assert (=> start!4338 e!21248))

(assert (=> start!4338 true))

(assert (=> start!4338 tp!4965))

(declare-fun array_inv!769 (array!2279) Bool)

(assert (=> start!4338 (and (array_inv!769 _values!1501) e!21251)))

(declare-fun array_inv!770 (array!2281) Bool)

(assert (=> start!4338 (array_inv!770 _keys!1833)))

(assert (=> start!4338 tp_is_empty!1533))

(declare-fun b!33470 () Bool)

(declare-fun res!20345 () Bool)

(assert (=> b!33470 (=> (not res!20345) (not e!21252))))

(declare-fun arrayContainsKey!0 (array!2281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33470 (= res!20345 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33471 () Bool)

(declare-fun res!20350 () Bool)

(assert (=> b!33471 (=> (not res!20350) (not e!21248))))

(assert (=> b!33471 (= res!20350 (and (= (size!1191 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1192 _keys!1833) (size!1191 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!4338 res!20346) b!33471))

(assert (= (and b!33471 res!20350) b!33466))

(assert (= (and b!33466 res!20349) b!33465))

(assert (= (and b!33465 res!20348) b!33468))

(assert (= (and b!33468 res!20347) b!33464))

(assert (= (and b!33464 res!20344) b!33470))

(assert (= (and b!33470 res!20345) b!33469))

(assert (= (and b!33463 condMapEmpty!1837) mapIsEmpty!1837))

(assert (= (and b!33463 (not condMapEmpty!1837)) mapNonEmpty!1837))

(assert (= (and mapNonEmpty!1837 ((_ is ValueCellFull!567) mapValue!1837)) b!33467))

(assert (= (and b!33463 ((_ is ValueCellFull!567) mapDefault!1837)) b!33462))

(assert (= start!4338 b!33463))

(declare-fun m!26867 () Bool)

(assert (=> b!33464 m!26867))

(declare-fun m!26869 () Bool)

(assert (=> b!33464 m!26869))

(declare-fun m!26871 () Bool)

(assert (=> b!33465 m!26871))

(declare-fun m!26873 () Bool)

(assert (=> b!33466 m!26873))

(declare-fun m!26875 () Bool)

(assert (=> b!33470 m!26875))

(declare-fun m!26877 () Bool)

(assert (=> mapNonEmpty!1837 m!26877))

(declare-fun m!26879 () Bool)

(assert (=> start!4338 m!26879))

(declare-fun m!26881 () Bool)

(assert (=> start!4338 m!26881))

(declare-fun m!26883 () Bool)

(assert (=> start!4338 m!26883))

(declare-fun m!26885 () Bool)

(assert (=> b!33469 m!26885))

(declare-fun m!26887 () Bool)

(assert (=> b!33469 m!26887))

(declare-fun m!26889 () Bool)

(assert (=> b!33469 m!26889))

(declare-fun m!26891 () Bool)

(assert (=> b!33469 m!26891))

(declare-fun m!26893 () Bool)

(assert (=> b!33469 m!26893))

(assert (=> b!33469 m!26885))

(declare-fun m!26895 () Bool)

(assert (=> b!33469 m!26895))

(declare-fun m!26897 () Bool)

(assert (=> b!33468 m!26897))

(check-sat (not b!33470) b_and!1995 (not b!33469) (not b!33464) (not b!33466) tp_is_empty!1533 (not b!33468) (not mapNonEmpty!1837) (not b!33465) (not b_next!1179) (not start!4338))
(check-sat b_and!1995 (not b_next!1179))
(get-model)

(declare-fun d!5161 () Bool)

(assert (=> d!5161 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4338 d!5161))

(declare-fun d!5163 () Bool)

(assert (=> d!5163 (= (array_inv!769 _values!1501) (bvsge (size!1191 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4338 d!5163))

(declare-fun d!5165 () Bool)

(assert (=> d!5165 (= (array_inv!770 _keys!1833) (bvsge (size!1192 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4338 d!5165))

(declare-fun b!33510 () Bool)

(declare-fun e!21279 () Bool)

(declare-fun e!21280 () Bool)

(assert (=> b!33510 (= e!21279 e!21280)))

(declare-fun lt!12225 () (_ BitVec 64))

(assert (=> b!33510 (= lt!12225 (select (arr!1091 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12224 () Unit!748)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2281 (_ BitVec 64) (_ BitVec 32)) Unit!748)

(assert (=> b!33510 (= lt!12224 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12225 #b00000000000000000000000000000000))))

(assert (=> b!33510 (arrayContainsKey!0 _keys!1833 lt!12225 #b00000000000000000000000000000000)))

(declare-fun lt!12223 () Unit!748)

(assert (=> b!33510 (= lt!12223 lt!12224)))

(declare-fun res!20377 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2281 (_ BitVec 32)) SeekEntryResult!130)

(assert (=> b!33510 (= res!20377 (= (seekEntryOrOpen!0 (select (arr!1091 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!130 #b00000000000000000000000000000000)))))

(assert (=> b!33510 (=> (not res!20377) (not e!21280))))

(declare-fun d!5167 () Bool)

(declare-fun res!20376 () Bool)

(declare-fun e!21278 () Bool)

(assert (=> d!5167 (=> res!20376 e!21278)))

(assert (=> d!5167 (= res!20376 (bvsge #b00000000000000000000000000000000 (size!1192 _keys!1833)))))

(assert (=> d!5167 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!21278)))

(declare-fun bm!2669 () Bool)

(declare-fun call!2672 () Bool)

(assert (=> bm!2669 (= call!2672 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!33511 () Bool)

(assert (=> b!33511 (= e!21279 call!2672)))

(declare-fun b!33512 () Bool)

(assert (=> b!33512 (= e!21278 e!21279)))

(declare-fun c!3840 () Bool)

(assert (=> b!33512 (= c!3840 (validKeyInArray!0 (select (arr!1091 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33513 () Bool)

(assert (=> b!33513 (= e!21280 call!2672)))

(assert (= (and d!5167 (not res!20376)) b!33512))

(assert (= (and b!33512 c!3840) b!33510))

(assert (= (and b!33512 (not c!3840)) b!33511))

(assert (= (and b!33510 res!20377) b!33513))

(assert (= (or b!33513 b!33511) bm!2669))

(declare-fun m!26931 () Bool)

(assert (=> b!33510 m!26931))

(declare-fun m!26933 () Bool)

(assert (=> b!33510 m!26933))

(declare-fun m!26935 () Bool)

(assert (=> b!33510 m!26935))

(assert (=> b!33510 m!26931))

(declare-fun m!26937 () Bool)

(assert (=> b!33510 m!26937))

(declare-fun m!26939 () Bool)

(assert (=> bm!2669 m!26939))

(assert (=> b!33512 m!26931))

(assert (=> b!33512 m!26931))

(declare-fun m!26941 () Bool)

(assert (=> b!33512 m!26941))

(assert (=> b!33466 d!5167))

(declare-fun bm!2672 () Bool)

(declare-fun call!2675 () Bool)

(declare-fun c!3843 () Bool)

(assert (=> bm!2672 (= call!2675 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3843 (Cons!879 (select (arr!1091 _keys!1833) #b00000000000000000000000000000000) Nil!880) Nil!880)))))

(declare-fun b!33524 () Bool)

(declare-fun e!21291 () Bool)

(declare-fun e!21290 () Bool)

(assert (=> b!33524 (= e!21291 e!21290)))

(assert (=> b!33524 (= c!3843 (validKeyInArray!0 (select (arr!1091 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33525 () Bool)

(assert (=> b!33525 (= e!21290 call!2675)))

(declare-fun b!33526 () Bool)

(declare-fun e!21292 () Bool)

(declare-fun contains!394 (List!883 (_ BitVec 64)) Bool)

(assert (=> b!33526 (= e!21292 (contains!394 Nil!880 (select (arr!1091 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5169 () Bool)

(declare-fun res!20385 () Bool)

(declare-fun e!21289 () Bool)

(assert (=> d!5169 (=> res!20385 e!21289)))

(assert (=> d!5169 (= res!20385 (bvsge #b00000000000000000000000000000000 (size!1192 _keys!1833)))))

(assert (=> d!5169 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!880) e!21289)))

(declare-fun b!33527 () Bool)

(assert (=> b!33527 (= e!21290 call!2675)))

(declare-fun b!33528 () Bool)

(assert (=> b!33528 (= e!21289 e!21291)))

(declare-fun res!20384 () Bool)

(assert (=> b!33528 (=> (not res!20384) (not e!21291))))

(assert (=> b!33528 (= res!20384 (not e!21292))))

(declare-fun res!20386 () Bool)

(assert (=> b!33528 (=> (not res!20386) (not e!21292))))

(assert (=> b!33528 (= res!20386 (validKeyInArray!0 (select (arr!1091 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5169 (not res!20385)) b!33528))

(assert (= (and b!33528 res!20386) b!33526))

(assert (= (and b!33528 res!20384) b!33524))

(assert (= (and b!33524 c!3843) b!33527))

(assert (= (and b!33524 (not c!3843)) b!33525))

(assert (= (or b!33527 b!33525) bm!2672))

(assert (=> bm!2672 m!26931))

(declare-fun m!26943 () Bool)

(assert (=> bm!2672 m!26943))

(assert (=> b!33524 m!26931))

(assert (=> b!33524 m!26931))

(assert (=> b!33524 m!26941))

(assert (=> b!33526 m!26931))

(assert (=> b!33526 m!26931))

(declare-fun m!26945 () Bool)

(assert (=> b!33526 m!26945))

(assert (=> b!33528 m!26931))

(assert (=> b!33528 m!26931))

(assert (=> b!33528 m!26941))

(assert (=> b!33465 d!5169))

(declare-fun d!5171 () Bool)

(declare-fun res!20391 () Bool)

(declare-fun e!21297 () Bool)

(assert (=> d!5171 (=> res!20391 e!21297)))

(assert (=> d!5171 (= res!20391 (= (select (arr!1091 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5171 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!21297)))

(declare-fun b!33533 () Bool)

(declare-fun e!21298 () Bool)

(assert (=> b!33533 (= e!21297 e!21298)))

(declare-fun res!20392 () Bool)

(assert (=> b!33533 (=> (not res!20392) (not e!21298))))

(assert (=> b!33533 (= res!20392 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1192 _keys!1833)))))

(declare-fun b!33534 () Bool)

(assert (=> b!33534 (= e!21298 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5171 (not res!20391)) b!33533))

(assert (= (and b!33533 res!20392) b!33534))

(assert (=> d!5171 m!26931))

(declare-fun m!26947 () Bool)

(assert (=> b!33534 m!26947))

(assert (=> b!33470 d!5171))

(declare-fun d!5173 () Bool)

(declare-fun lt!12228 () (_ BitVec 32))

(assert (=> d!5173 (and (or (bvslt lt!12228 #b00000000000000000000000000000000) (bvsge lt!12228 (size!1192 _keys!1833)) (and (bvsge lt!12228 #b00000000000000000000000000000000) (bvslt lt!12228 (size!1192 _keys!1833)))) (bvsge lt!12228 #b00000000000000000000000000000000) (bvslt lt!12228 (size!1192 _keys!1833)) (= (select (arr!1091 _keys!1833) lt!12228) k0!1304))))

(declare-fun e!21301 () (_ BitVec 32))

(assert (=> d!5173 (= lt!12228 e!21301)))

(declare-fun c!3846 () Bool)

(assert (=> d!5173 (= c!3846 (= (select (arr!1091 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5173 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1192 _keys!1833)) (bvslt (size!1192 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5173 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!12228)))

(declare-fun b!33539 () Bool)

(assert (=> b!33539 (= e!21301 #b00000000000000000000000000000000)))

(declare-fun b!33540 () Bool)

(assert (=> b!33540 (= e!21301 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5173 c!3846) b!33539))

(assert (= (and d!5173 (not c!3846)) b!33540))

(declare-fun m!26949 () Bool)

(assert (=> d!5173 m!26949))

(assert (=> d!5173 m!26931))

(declare-fun m!26951 () Bool)

(assert (=> b!33540 m!26951))

(assert (=> b!33469 d!5173))

(declare-fun b!33553 () Bool)

(declare-fun c!3855 () Bool)

(declare-fun lt!12240 () (_ BitVec 64))

(assert (=> b!33553 (= c!3855 (= lt!12240 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21309 () SeekEntryResult!130)

(declare-fun e!21308 () SeekEntryResult!130)

(assert (=> b!33553 (= e!21309 e!21308)))

(declare-fun b!33554 () Bool)

(declare-fun e!21310 () SeekEntryResult!130)

(assert (=> b!33554 (= e!21310 Undefined!130)))

(declare-fun b!33555 () Bool)

(declare-fun lt!12239 () SeekEntryResult!130)

(assert (=> b!33555 (= e!21308 (MissingZero!130 (index!2644 lt!12239)))))

(declare-fun d!5175 () Bool)

(declare-fun lt!12237 () SeekEntryResult!130)

(assert (=> d!5175 (and (or ((_ is MissingVacant!130) lt!12237) (not ((_ is Found!130) lt!12237)) (and (bvsge (index!2643 lt!12237) #b00000000000000000000000000000000) (bvslt (index!2643 lt!12237) (size!1192 _keys!1833)))) (not ((_ is MissingVacant!130) lt!12237)) (or (not ((_ is Found!130) lt!12237)) (= (select (arr!1091 _keys!1833) (index!2643 lt!12237)) k0!1304)))))

(assert (=> d!5175 (= lt!12237 e!21310)))

(declare-fun c!3854 () Bool)

(assert (=> d!5175 (= c!3854 (and ((_ is Intermediate!130) lt!12239) (undefined!942 lt!12239)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2281 (_ BitVec 32)) SeekEntryResult!130)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5175 (= lt!12239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5175 (validMask!0 mask!2294)))

(assert (=> d!5175 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!12237)))

(declare-fun b!33556 () Bool)

(assert (=> b!33556 (= e!21309 (Found!130 (index!2644 lt!12239)))))

(declare-fun b!33557 () Bool)

(assert (=> b!33557 (= e!21310 e!21309)))

(assert (=> b!33557 (= lt!12240 (select (arr!1091 _keys!1833) (index!2644 lt!12239)))))

(declare-fun c!3853 () Bool)

(assert (=> b!33557 (= c!3853 (= lt!12240 k0!1304))))

(declare-fun b!33558 () Bool)

(declare-fun lt!12238 () SeekEntryResult!130)

(assert (=> b!33558 (= e!21308 (ite ((_ is MissingVacant!130) lt!12238) (MissingZero!130 (index!2645 lt!12238)) lt!12238))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2281 (_ BitVec 32)) SeekEntryResult!130)

(assert (=> b!33558 (= lt!12238 (seekKeyOrZeroReturnVacant!0 (x!6822 lt!12239) (index!2644 lt!12239) (index!2644 lt!12239) k0!1304 _keys!1833 mask!2294))))

(assert (= (and d!5175 c!3854) b!33554))

(assert (= (and d!5175 (not c!3854)) b!33557))

(assert (= (and b!33557 c!3853) b!33556))

(assert (= (and b!33557 (not c!3853)) b!33553))

(assert (= (and b!33553 c!3855) b!33555))

(assert (= (and b!33553 (not c!3855)) b!33558))

(declare-fun m!26953 () Bool)

(assert (=> d!5175 m!26953))

(declare-fun m!26955 () Bool)

(assert (=> d!5175 m!26955))

(assert (=> d!5175 m!26955))

(declare-fun m!26957 () Bool)

(assert (=> d!5175 m!26957))

(assert (=> d!5175 m!26879))

(declare-fun m!26959 () Bool)

(assert (=> b!33557 m!26959))

(declare-fun m!26961 () Bool)

(assert (=> b!33558 m!26961))

(assert (=> b!33469 d!5175))

(declare-fun d!5177 () Bool)

(declare-fun e!21315 () Bool)

(assert (=> d!5177 e!21315))

(declare-fun res!20395 () Bool)

(assert (=> d!5177 (=> res!20395 e!21315)))

(declare-fun lt!12250 () Bool)

(assert (=> d!5177 (= res!20395 (not lt!12250))))

(declare-fun lt!12252 () Bool)

(assert (=> d!5177 (= lt!12250 lt!12252)))

(declare-fun lt!12251 () Unit!748)

(declare-fun e!21316 () Unit!748)

(assert (=> d!5177 (= lt!12251 e!21316)))

(declare-fun c!3858 () Bool)

(assert (=> d!5177 (= c!3858 lt!12252)))

(declare-fun containsKey!32 (List!882 (_ BitVec 64)) Bool)

(assert (=> d!5177 (= lt!12252 (containsKey!32 (toList!450 lt!12198) (select (arr!1091 _keys!1833) lt!12197)))))

(assert (=> d!5177 (= (contains!393 lt!12198 (select (arr!1091 _keys!1833) lt!12197)) lt!12250)))

(declare-fun b!33565 () Bool)

(declare-fun lt!12249 () Unit!748)

(assert (=> b!33565 (= e!21316 lt!12249)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!29 (List!882 (_ BitVec 64)) Unit!748)

(assert (=> b!33565 (= lt!12249 (lemmaContainsKeyImpliesGetValueByKeyDefined!29 (toList!450 lt!12198) (select (arr!1091 _keys!1833) lt!12197)))))

(declare-datatypes ((Option!74 0))(
  ( (Some!73 (v!1887 V!1869)) (None!72) )
))
(declare-fun isDefined!30 (Option!74) Bool)

(declare-fun getValueByKey!68 (List!882 (_ BitVec 64)) Option!74)

(assert (=> b!33565 (isDefined!30 (getValueByKey!68 (toList!450 lt!12198) (select (arr!1091 _keys!1833) lt!12197)))))

(declare-fun b!33566 () Bool)

(declare-fun Unit!750 () Unit!748)

(assert (=> b!33566 (= e!21316 Unit!750)))

(declare-fun b!33567 () Bool)

(assert (=> b!33567 (= e!21315 (isDefined!30 (getValueByKey!68 (toList!450 lt!12198) (select (arr!1091 _keys!1833) lt!12197))))))

(assert (= (and d!5177 c!3858) b!33565))

(assert (= (and d!5177 (not c!3858)) b!33566))

(assert (= (and d!5177 (not res!20395)) b!33567))

(assert (=> d!5177 m!26885))

(declare-fun m!26963 () Bool)

(assert (=> d!5177 m!26963))

(assert (=> b!33565 m!26885))

(declare-fun m!26965 () Bool)

(assert (=> b!33565 m!26965))

(assert (=> b!33565 m!26885))

(declare-fun m!26967 () Bool)

(assert (=> b!33565 m!26967))

(assert (=> b!33565 m!26967))

(declare-fun m!26969 () Bool)

(assert (=> b!33565 m!26969))

(assert (=> b!33567 m!26885))

(assert (=> b!33567 m!26967))

(assert (=> b!33567 m!26967))

(assert (=> b!33567 m!26969))

(assert (=> b!33469 d!5177))

(declare-fun d!5179 () Bool)

(declare-fun lt!12258 () SeekEntryResult!130)

(assert (=> d!5179 (and ((_ is Found!130) lt!12258) (= (index!2643 lt!12258) lt!12197))))

(assert (=> d!5179 (= lt!12258 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!12257 () Unit!748)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!2281 (_ BitVec 32)) Unit!748)

(assert (=> d!5179 (= lt!12257 (choose!0 k0!1304 lt!12197 _keys!1833 mask!2294))))

(assert (=> d!5179 (validMask!0 mask!2294)))

(assert (=> d!5179 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12197 _keys!1833 mask!2294) lt!12257)))

(declare-fun bs!1306 () Bool)

(assert (= bs!1306 d!5179))

(assert (=> bs!1306 m!26893))

(declare-fun m!26971 () Bool)

(assert (=> bs!1306 m!26971))

(assert (=> bs!1306 m!26879))

(assert (=> b!33469 d!5179))

(declare-fun d!5181 () Bool)

(declare-fun e!21319 () Bool)

(assert (=> d!5181 e!21319))

(declare-fun res!20398 () Bool)

(assert (=> d!5181 (=> (not res!20398) (not e!21319))))

(assert (=> d!5181 (= res!20398 (and (bvsge lt!12197 #b00000000000000000000000000000000) (bvslt lt!12197 (size!1192 _keys!1833))))))

(declare-fun lt!12261 () Unit!748)

(declare-fun choose!217 (array!2281 array!2279 (_ BitVec 32) (_ BitVec 32) V!1869 V!1869 (_ BitVec 32) Int) Unit!748)

(assert (=> d!5181 (= lt!12261 (choose!217 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12197 defaultEntry!1504))))

(assert (=> d!5181 (validMask!0 mask!2294)))

(assert (=> d!5181 (= (lemmaValidKeyInArrayIsInListMap!62 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12197 defaultEntry!1504) lt!12261)))

(declare-fun b!33570 () Bool)

(assert (=> b!33570 (= e!21319 (contains!393 (getCurrentListMap!276 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) (select (arr!1091 _keys!1833) lt!12197)))))

(assert (= (and d!5181 res!20398) b!33570))

(declare-fun m!26973 () Bool)

(assert (=> d!5181 m!26973))

(assert (=> d!5181 m!26879))

(assert (=> b!33570 m!26869))

(assert (=> b!33570 m!26885))

(assert (=> b!33570 m!26869))

(assert (=> b!33570 m!26885))

(declare-fun m!26975 () Bool)

(assert (=> b!33570 m!26975))

(assert (=> b!33469 d!5181))

(declare-fun d!5183 () Bool)

(declare-fun e!21320 () Bool)

(assert (=> d!5183 e!21320))

(declare-fun res!20399 () Bool)

(assert (=> d!5183 (=> res!20399 e!21320)))

(declare-fun lt!12263 () Bool)

(assert (=> d!5183 (= res!20399 (not lt!12263))))

(declare-fun lt!12265 () Bool)

(assert (=> d!5183 (= lt!12263 lt!12265)))

(declare-fun lt!12264 () Unit!748)

(declare-fun e!21321 () Unit!748)

(assert (=> d!5183 (= lt!12264 e!21321)))

(declare-fun c!3859 () Bool)

(assert (=> d!5183 (= c!3859 lt!12265)))

(assert (=> d!5183 (= lt!12265 (containsKey!32 (toList!450 lt!12198) k0!1304))))

(assert (=> d!5183 (= (contains!393 lt!12198 k0!1304) lt!12263)))

(declare-fun b!33571 () Bool)

(declare-fun lt!12262 () Unit!748)

(assert (=> b!33571 (= e!21321 lt!12262)))

(assert (=> b!33571 (= lt!12262 (lemmaContainsKeyImpliesGetValueByKeyDefined!29 (toList!450 lt!12198) k0!1304))))

(assert (=> b!33571 (isDefined!30 (getValueByKey!68 (toList!450 lt!12198) k0!1304))))

(declare-fun b!33572 () Bool)

(declare-fun Unit!751 () Unit!748)

(assert (=> b!33572 (= e!21321 Unit!751)))

(declare-fun b!33573 () Bool)

(assert (=> b!33573 (= e!21320 (isDefined!30 (getValueByKey!68 (toList!450 lt!12198) k0!1304)))))

(assert (= (and d!5183 c!3859) b!33571))

(assert (= (and d!5183 (not c!3859)) b!33572))

(assert (= (and d!5183 (not res!20399)) b!33573))

(declare-fun m!26977 () Bool)

(assert (=> d!5183 m!26977))

(declare-fun m!26979 () Bool)

(assert (=> b!33571 m!26979))

(declare-fun m!26981 () Bool)

(assert (=> b!33571 m!26981))

(assert (=> b!33571 m!26981))

(declare-fun m!26983 () Bool)

(assert (=> b!33571 m!26983))

(assert (=> b!33573 m!26981))

(assert (=> b!33573 m!26981))

(assert (=> b!33573 m!26983))

(assert (=> b!33464 d!5183))

(declare-fun b!33616 () Bool)

(declare-fun e!21350 () ListLongMap!869)

(declare-fun e!21358 () ListLongMap!869)

(assert (=> b!33616 (= e!21350 e!21358)))

(declare-fun c!3872 () Bool)

(assert (=> b!33616 (= c!3872 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!33617 () Bool)

(declare-fun res!20426 () Bool)

(declare-fun e!21359 () Bool)

(assert (=> b!33617 (=> (not res!20426) (not e!21359))))

(declare-fun e!21348 () Bool)

(assert (=> b!33617 (= res!20426 e!21348)))

(declare-fun res!20419 () Bool)

(assert (=> b!33617 (=> res!20419 e!21348)))

(declare-fun e!21352 () Bool)

(assert (=> b!33617 (= res!20419 (not e!21352))))

(declare-fun res!20421 () Bool)

(assert (=> b!33617 (=> (not res!20421) (not e!21352))))

(assert (=> b!33617 (= res!20421 (bvslt #b00000000000000000000000000000000 (size!1192 _keys!1833)))))

(declare-fun b!33618 () Bool)

(assert (=> b!33618 (= e!21352 (validKeyInArray!0 (select (arr!1091 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!33619 () Bool)

(declare-fun e!21356 () ListLongMap!869)

(declare-fun call!2695 () ListLongMap!869)

(assert (=> b!33619 (= e!21356 call!2695)))

(declare-fun call!2694 () ListLongMap!869)

(declare-fun c!3877 () Bool)

(declare-fun call!2691 () ListLongMap!869)

(declare-fun bm!2687 () Bool)

(declare-fun call!2692 () ListLongMap!869)

(declare-fun call!2690 () ListLongMap!869)

(declare-fun +!54 (ListLongMap!869 tuple2!1292) ListLongMap!869)

(assert (=> bm!2687 (= call!2694 (+!54 (ite c!3877 call!2691 (ite c!3872 call!2692 call!2690)) (ite (or c!3877 c!3872) (tuple2!1293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun bm!2688 () Bool)

(declare-fun call!2693 () Bool)

(declare-fun lt!12312 () ListLongMap!869)

(assert (=> bm!2688 (= call!2693 (contains!393 lt!12312 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!33620 () Bool)

(declare-fun e!21349 () Unit!748)

(declare-fun lt!12310 () Unit!748)

(assert (=> b!33620 (= e!21349 lt!12310)))

(declare-fun lt!12311 () ListLongMap!869)

(declare-fun getCurrentListMapNoExtraKeys!23 (array!2281 array!2279 (_ BitVec 32) (_ BitVec 32) V!1869 V!1869 (_ BitVec 32) Int) ListLongMap!869)

(assert (=> b!33620 (= lt!12311 (getCurrentListMapNoExtraKeys!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12321 () (_ BitVec 64))

(assert (=> b!33620 (= lt!12321 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12318 () (_ BitVec 64))

(assert (=> b!33620 (= lt!12318 (select (arr!1091 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12328 () Unit!748)

(declare-fun addStillContains!21 (ListLongMap!869 (_ BitVec 64) V!1869 (_ BitVec 64)) Unit!748)

(assert (=> b!33620 (= lt!12328 (addStillContains!21 lt!12311 lt!12321 zeroValue!1443 lt!12318))))

(assert (=> b!33620 (contains!393 (+!54 lt!12311 (tuple2!1293 lt!12321 zeroValue!1443)) lt!12318)))

(declare-fun lt!12329 () Unit!748)

(assert (=> b!33620 (= lt!12329 lt!12328)))

(declare-fun lt!12323 () ListLongMap!869)

(assert (=> b!33620 (= lt!12323 (getCurrentListMapNoExtraKeys!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12325 () (_ BitVec 64))

(assert (=> b!33620 (= lt!12325 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12313 () (_ BitVec 64))

(assert (=> b!33620 (= lt!12313 (select (arr!1091 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12330 () Unit!748)

(declare-fun addApplyDifferent!21 (ListLongMap!869 (_ BitVec 64) V!1869 (_ BitVec 64)) Unit!748)

(assert (=> b!33620 (= lt!12330 (addApplyDifferent!21 lt!12323 lt!12325 minValue!1443 lt!12313))))

(declare-fun apply!36 (ListLongMap!869 (_ BitVec 64)) V!1869)

(assert (=> b!33620 (= (apply!36 (+!54 lt!12323 (tuple2!1293 lt!12325 minValue!1443)) lt!12313) (apply!36 lt!12323 lt!12313))))

(declare-fun lt!12315 () Unit!748)

(assert (=> b!33620 (= lt!12315 lt!12330)))

(declare-fun lt!12331 () ListLongMap!869)

(assert (=> b!33620 (= lt!12331 (getCurrentListMapNoExtraKeys!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12319 () (_ BitVec 64))

(assert (=> b!33620 (= lt!12319 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12320 () (_ BitVec 64))

(assert (=> b!33620 (= lt!12320 (select (arr!1091 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12326 () Unit!748)

(assert (=> b!33620 (= lt!12326 (addApplyDifferent!21 lt!12331 lt!12319 zeroValue!1443 lt!12320))))

(assert (=> b!33620 (= (apply!36 (+!54 lt!12331 (tuple2!1293 lt!12319 zeroValue!1443)) lt!12320) (apply!36 lt!12331 lt!12320))))

(declare-fun lt!12322 () Unit!748)

(assert (=> b!33620 (= lt!12322 lt!12326)))

(declare-fun lt!12327 () ListLongMap!869)

(assert (=> b!33620 (= lt!12327 (getCurrentListMapNoExtraKeys!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12316 () (_ BitVec 64))

(assert (=> b!33620 (= lt!12316 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12317 () (_ BitVec 64))

(assert (=> b!33620 (= lt!12317 (select (arr!1091 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!33620 (= lt!12310 (addApplyDifferent!21 lt!12327 lt!12316 minValue!1443 lt!12317))))

(assert (=> b!33620 (= (apply!36 (+!54 lt!12327 (tuple2!1293 lt!12316 minValue!1443)) lt!12317) (apply!36 lt!12327 lt!12317))))

(declare-fun b!33621 () Bool)

(declare-fun e!21353 () Bool)

(declare-fun call!2696 () Bool)

(assert (=> b!33621 (= e!21353 (not call!2696))))

(declare-fun b!33622 () Bool)

(assert (=> b!33622 (= e!21359 e!21353)))

(declare-fun c!3874 () Bool)

(assert (=> b!33622 (= c!3874 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!33624 () Bool)

(declare-fun Unit!752 () Unit!748)

(assert (=> b!33624 (= e!21349 Unit!752)))

(declare-fun bm!2689 () Bool)

(assert (=> bm!2689 (= call!2696 (contains!393 lt!12312 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2690 () Bool)

(assert (=> bm!2690 (= call!2695 call!2694)))

(declare-fun b!33625 () Bool)

(assert (=> b!33625 (= e!21358 call!2695)))

(declare-fun b!33626 () Bool)

(assert (=> b!33626 (= e!21356 call!2690)))

(declare-fun b!33627 () Bool)

(declare-fun res!20423 () Bool)

(assert (=> b!33627 (=> (not res!20423) (not e!21359))))

(declare-fun e!21355 () Bool)

(assert (=> b!33627 (= res!20423 e!21355)))

(declare-fun c!3875 () Bool)

(assert (=> b!33627 (= c!3875 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!33628 () Bool)

(declare-fun e!21351 () Bool)

(assert (=> b!33628 (= e!21351 (= (apply!36 lt!12312 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!33629 () Bool)

(assert (=> b!33629 (= e!21350 (+!54 call!2694 (tuple2!1293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!33630 () Bool)

(declare-fun e!21360 () Bool)

(assert (=> b!33630 (= e!21348 e!21360)))

(declare-fun res!20425 () Bool)

(assert (=> b!33630 (=> (not res!20425) (not e!21360))))

(assert (=> b!33630 (= res!20425 (contains!393 lt!12312 (select (arr!1091 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!33630 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1192 _keys!1833)))))

(declare-fun b!33631 () Bool)

(declare-fun c!3876 () Bool)

(assert (=> b!33631 (= c!3876 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!33631 (= e!21358 e!21356)))

(declare-fun b!33632 () Bool)

(declare-fun e!21357 () Bool)

(assert (=> b!33632 (= e!21353 e!21357)))

(declare-fun res!20424 () Bool)

(assert (=> b!33632 (= res!20424 call!2696)))

(assert (=> b!33632 (=> (not res!20424) (not e!21357))))

(declare-fun b!33633 () Bool)

(declare-fun get!571 (ValueCell!567 V!1869) V!1869)

(declare-fun dynLambda!153 (Int (_ BitVec 64)) V!1869)

(assert (=> b!33633 (= e!21360 (= (apply!36 lt!12312 (select (arr!1091 _keys!1833) #b00000000000000000000000000000000)) (get!571 (select (arr!1090 _values!1501) #b00000000000000000000000000000000) (dynLambda!153 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33633 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1191 _values!1501)))))

(assert (=> b!33633 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1192 _keys!1833)))))

(declare-fun d!5185 () Bool)

(assert (=> d!5185 e!21359))

(declare-fun res!20422 () Bool)

(assert (=> d!5185 (=> (not res!20422) (not e!21359))))

(assert (=> d!5185 (= res!20422 (or (bvsge #b00000000000000000000000000000000 (size!1192 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1192 _keys!1833)))))))

(declare-fun lt!12324 () ListLongMap!869)

(assert (=> d!5185 (= lt!12312 lt!12324)))

(declare-fun lt!12314 () Unit!748)

(assert (=> d!5185 (= lt!12314 e!21349)))

(declare-fun c!3873 () Bool)

(declare-fun e!21354 () Bool)

(assert (=> d!5185 (= c!3873 e!21354)))

(declare-fun res!20418 () Bool)

(assert (=> d!5185 (=> (not res!20418) (not e!21354))))

(assert (=> d!5185 (= res!20418 (bvslt #b00000000000000000000000000000000 (size!1192 _keys!1833)))))

(assert (=> d!5185 (= lt!12324 e!21350)))

(assert (=> d!5185 (= c!3877 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5185 (validMask!0 mask!2294)))

(assert (=> d!5185 (= (getCurrentListMap!276 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!12312)))

(declare-fun b!33623 () Bool)

(assert (=> b!33623 (= e!21355 (not call!2693))))

(declare-fun b!33634 () Bool)

(assert (=> b!33634 (= e!21355 e!21351)))

(declare-fun res!20420 () Bool)

(assert (=> b!33634 (= res!20420 call!2693)))

(assert (=> b!33634 (=> (not res!20420) (not e!21351))))

(declare-fun b!33635 () Bool)

(assert (=> b!33635 (= e!21357 (= (apply!36 lt!12312 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!33636 () Bool)

(assert (=> b!33636 (= e!21354 (validKeyInArray!0 (select (arr!1091 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2691 () Bool)

(assert (=> bm!2691 (= call!2691 (getCurrentListMapNoExtraKeys!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun bm!2692 () Bool)

(assert (=> bm!2692 (= call!2692 call!2691)))

(declare-fun bm!2693 () Bool)

(assert (=> bm!2693 (= call!2690 call!2692)))

(assert (= (and d!5185 c!3877) b!33629))

(assert (= (and d!5185 (not c!3877)) b!33616))

(assert (= (and b!33616 c!3872) b!33625))

(assert (= (and b!33616 (not c!3872)) b!33631))

(assert (= (and b!33631 c!3876) b!33619))

(assert (= (and b!33631 (not c!3876)) b!33626))

(assert (= (or b!33619 b!33626) bm!2693))

(assert (= (or b!33625 bm!2693) bm!2692))

(assert (= (or b!33625 b!33619) bm!2690))

(assert (= (or b!33629 bm!2692) bm!2691))

(assert (= (or b!33629 bm!2690) bm!2687))

(assert (= (and d!5185 res!20418) b!33636))

(assert (= (and d!5185 c!3873) b!33620))

(assert (= (and d!5185 (not c!3873)) b!33624))

(assert (= (and d!5185 res!20422) b!33617))

(assert (= (and b!33617 res!20421) b!33618))

(assert (= (and b!33617 (not res!20419)) b!33630))

(assert (= (and b!33630 res!20425) b!33633))

(assert (= (and b!33617 res!20426) b!33627))

(assert (= (and b!33627 c!3875) b!33634))

(assert (= (and b!33627 (not c!3875)) b!33623))

(assert (= (and b!33634 res!20420) b!33628))

(assert (= (or b!33634 b!33623) bm!2688))

(assert (= (and b!33627 res!20423) b!33622))

(assert (= (and b!33622 c!3874) b!33632))

(assert (= (and b!33622 (not c!3874)) b!33621))

(assert (= (and b!33632 res!20424) b!33635))

(assert (= (or b!33632 b!33621) bm!2689))

(declare-fun b_lambda!1707 () Bool)

(assert (=> (not b_lambda!1707) (not b!33633)))

(declare-fun t!3584 () Bool)

(declare-fun tb!687 () Bool)

(assert (=> (and start!4338 (= defaultEntry!1504 defaultEntry!1504) t!3584) tb!687))

(declare-fun result!1171 () Bool)

(assert (=> tb!687 (= result!1171 tp_is_empty!1533)))

(assert (=> b!33633 t!3584))

(declare-fun b_and!1999 () Bool)

(assert (= b_and!1995 (and (=> t!3584 result!1171) b_and!1999)))

(declare-fun m!26985 () Bool)

(assert (=> b!33620 m!26985))

(declare-fun m!26987 () Bool)

(assert (=> b!33620 m!26987))

(declare-fun m!26989 () Bool)

(assert (=> b!33620 m!26989))

(declare-fun m!26991 () Bool)

(assert (=> b!33620 m!26991))

(declare-fun m!26993 () Bool)

(assert (=> b!33620 m!26993))

(declare-fun m!26995 () Bool)

(assert (=> b!33620 m!26995))

(declare-fun m!26997 () Bool)

(assert (=> b!33620 m!26997))

(declare-fun m!26999 () Bool)

(assert (=> b!33620 m!26999))

(declare-fun m!27001 () Bool)

(assert (=> b!33620 m!27001))

(declare-fun m!27003 () Bool)

(assert (=> b!33620 m!27003))

(declare-fun m!27005 () Bool)

(assert (=> b!33620 m!27005))

(assert (=> b!33620 m!26997))

(declare-fun m!27007 () Bool)

(assert (=> b!33620 m!27007))

(declare-fun m!27009 () Bool)

(assert (=> b!33620 m!27009))

(declare-fun m!27011 () Bool)

(assert (=> b!33620 m!27011))

(assert (=> b!33620 m!27009))

(assert (=> b!33620 m!26995))

(declare-fun m!27013 () Bool)

(assert (=> b!33620 m!27013))

(assert (=> b!33620 m!26989))

(declare-fun m!27015 () Bool)

(assert (=> b!33620 m!27015))

(assert (=> b!33620 m!26931))

(declare-fun m!27017 () Bool)

(assert (=> bm!2687 m!27017))

(assert (=> b!33636 m!26931))

(assert (=> b!33636 m!26931))

(assert (=> b!33636 m!26941))

(declare-fun m!27019 () Bool)

(assert (=> b!33628 m!27019))

(declare-fun m!27021 () Bool)

(assert (=> b!33629 m!27021))

(assert (=> b!33630 m!26931))

(assert (=> b!33630 m!26931))

(declare-fun m!27023 () Bool)

(assert (=> b!33630 m!27023))

(declare-fun m!27025 () Bool)

(assert (=> b!33635 m!27025))

(declare-fun m!27027 () Bool)

(assert (=> bm!2689 m!27027))

(assert (=> d!5185 m!26879))

(assert (=> bm!2691 m!26993))

(assert (=> b!33618 m!26931))

(assert (=> b!33618 m!26931))

(assert (=> b!33618 m!26941))

(declare-fun m!27029 () Bool)

(assert (=> bm!2688 m!27029))

(declare-fun m!27031 () Bool)

(assert (=> b!33633 m!27031))

(declare-fun m!27033 () Bool)

(assert (=> b!33633 m!27033))

(assert (=> b!33633 m!27031))

(declare-fun m!27035 () Bool)

(assert (=> b!33633 m!27035))

(assert (=> b!33633 m!27033))

(assert (=> b!33633 m!26931))

(assert (=> b!33633 m!26931))

(declare-fun m!27037 () Bool)

(assert (=> b!33633 m!27037))

(assert (=> b!33464 d!5185))

(declare-fun d!5187 () Bool)

(assert (=> d!5187 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!33468 d!5187))

(declare-fun mapNonEmpty!1843 () Bool)

(declare-fun mapRes!1843 () Bool)

(declare-fun tp!4975 () Bool)

(declare-fun e!21366 () Bool)

(assert (=> mapNonEmpty!1843 (= mapRes!1843 (and tp!4975 e!21366))))

(declare-fun mapKey!1843 () (_ BitVec 32))

(declare-fun mapRest!1843 () (Array (_ BitVec 32) ValueCell!567))

(declare-fun mapValue!1843 () ValueCell!567)

(assert (=> mapNonEmpty!1843 (= mapRest!1837 (store mapRest!1843 mapKey!1843 mapValue!1843))))

(declare-fun b!33645 () Bool)

(assert (=> b!33645 (= e!21366 tp_is_empty!1533)))

(declare-fun condMapEmpty!1843 () Bool)

(declare-fun mapDefault!1843 () ValueCell!567)

(assert (=> mapNonEmpty!1837 (= condMapEmpty!1843 (= mapRest!1837 ((as const (Array (_ BitVec 32) ValueCell!567)) mapDefault!1843)))))

(declare-fun e!21365 () Bool)

(assert (=> mapNonEmpty!1837 (= tp!4966 (and e!21365 mapRes!1843))))

(declare-fun b!33646 () Bool)

(assert (=> b!33646 (= e!21365 tp_is_empty!1533)))

(declare-fun mapIsEmpty!1843 () Bool)

(assert (=> mapIsEmpty!1843 mapRes!1843))

(assert (= (and mapNonEmpty!1837 condMapEmpty!1843) mapIsEmpty!1843))

(assert (= (and mapNonEmpty!1837 (not condMapEmpty!1843)) mapNonEmpty!1843))

(assert (= (and mapNonEmpty!1843 ((_ is ValueCellFull!567) mapValue!1843)) b!33645))

(assert (= (and mapNonEmpty!1837 ((_ is ValueCellFull!567) mapDefault!1843)) b!33646))

(declare-fun m!27039 () Bool)

(assert (=> mapNonEmpty!1843 m!27039))

(declare-fun b_lambda!1709 () Bool)

(assert (= b_lambda!1707 (or (and start!4338 b_free!1179) b_lambda!1709)))

(check-sat (not b!33571) (not mapNonEmpty!1843) (not bm!2672) (not b_lambda!1709) (not d!5185) b_and!1999 tp_is_empty!1533 (not b!33573) (not d!5181) (not d!5175) (not b!33633) (not bm!2688) (not bm!2687) (not b!33526) (not b!33570) (not b!33620) (not b!33618) (not b!33565) (not b!33567) (not d!5179) (not b!33558) (not b!33524) (not bm!2669) (not b!33512) (not b!33628) (not d!5183) (not bm!2689) (not b!33635) (not d!5177) (not b!33629) (not b!33534) (not b!33636) (not bm!2691) (not b!33540) (not b!33630) (not b!33510) (not b_next!1179) (not b!33528))
(check-sat b_and!1999 (not b_next!1179))
