; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35182 () Bool)

(assert start!35182)

(declare-fun b_free!7789 () Bool)

(declare-fun b_next!7789 () Bool)

(assert (=> start!35182 (= b_free!7789 (not b_next!7789))))

(declare-fun tp!26957 () Bool)

(declare-fun b_and!15041 () Bool)

(assert (=> start!35182 (= tp!26957 b_and!15041)))

(declare-fun res!195678 () Bool)

(declare-fun e!216036 () Bool)

(assert (=> start!35182 (=> (not res!195678) (not e!216036))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35182 (= res!195678 (validMask!0 mask!2385))))

(assert (=> start!35182 e!216036))

(assert (=> start!35182 true))

(declare-fun tp_is_empty!7741 () Bool)

(assert (=> start!35182 tp_is_empty!7741))

(assert (=> start!35182 tp!26957))

(declare-datatypes ((V!11299 0))(
  ( (V!11300 (val!3915 Int)) )
))
(declare-datatypes ((ValueCell!3527 0))(
  ( (ValueCellFull!3527 (v!6107 V!11299)) (EmptyCell!3527) )
))
(declare-datatypes ((array!19062 0))(
  ( (array!19063 (arr!9032 (Array (_ BitVec 32) ValueCell!3527)) (size!9384 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19062)

(declare-fun e!216038 () Bool)

(declare-fun array_inv!6674 (array!19062) Bool)

(assert (=> start!35182 (and (array_inv!6674 _values!1525) e!216038)))

(declare-datatypes ((array!19064 0))(
  ( (array!19065 (arr!9033 (Array (_ BitVec 32) (_ BitVec 64))) (size!9385 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19064)

(declare-fun array_inv!6675 (array!19064) Bool)

(assert (=> start!35182 (array_inv!6675 _keys!1895)))

(declare-fun b!352808 () Bool)

(declare-datatypes ((SeekEntryResult!3429 0))(
  ( (MissingZero!3429 (index!15895 (_ BitVec 32))) (Found!3429 (index!15896 (_ BitVec 32))) (Intermediate!3429 (undefined!4241 Bool) (index!15897 (_ BitVec 32)) (x!35058 (_ BitVec 32))) (Undefined!3429) (MissingVacant!3429 (index!15898 (_ BitVec 32))) )
))
(declare-fun lt!165367 () SeekEntryResult!3429)

(get-info :version)

(assert (=> b!352808 (= e!216036 (and (not ((_ is Found!3429) lt!165367)) (not ((_ is MissingZero!3429) lt!165367)) (not ((_ is MissingVacant!3429) lt!165367)) (not ((_ is Undefined!3429) lt!165367))))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19064 (_ BitVec 32)) SeekEntryResult!3429)

(assert (=> b!352808 (= lt!165367 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352809 () Bool)

(declare-fun e!216035 () Bool)

(assert (=> b!352809 (= e!216035 tp_is_empty!7741)))

(declare-fun b!352810 () Bool)

(declare-fun res!195675 () Bool)

(assert (=> b!352810 (=> (not res!195675) (not e!216036))))

(declare-datatypes ((List!5166 0))(
  ( (Nil!5163) (Cons!5162 (h!6018 (_ BitVec 64)) (t!10304 List!5166)) )
))
(declare-fun arrayNoDuplicates!0 (array!19064 (_ BitVec 32) List!5166) Bool)

(assert (=> b!352810 (= res!195675 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5163))))

(declare-fun b!352811 () Bool)

(declare-fun res!195680 () Bool)

(assert (=> b!352811 (=> (not res!195680) (not e!216036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352811 (= res!195680 (validKeyInArray!0 k0!1348))))

(declare-fun b!352812 () Bool)

(declare-fun res!195677 () Bool)

(assert (=> b!352812 (=> (not res!195677) (not e!216036))))

(declare-fun zeroValue!1467 () V!11299)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11299)

(declare-datatypes ((tuple2!5560 0))(
  ( (tuple2!5561 (_1!2791 (_ BitVec 64)) (_2!2791 V!11299)) )
))
(declare-datatypes ((List!5167 0))(
  ( (Nil!5164) (Cons!5163 (h!6019 tuple2!5560) (t!10305 List!5167)) )
))
(declare-datatypes ((ListLongMap!4475 0))(
  ( (ListLongMap!4476 (toList!2253 List!5167)) )
))
(declare-fun contains!2345 (ListLongMap!4475 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1781 (array!19064 array!19062 (_ BitVec 32) (_ BitVec 32) V!11299 V!11299 (_ BitVec 32) Int) ListLongMap!4475)

(assert (=> b!352812 (= res!195677 (not (contains!2345 (getCurrentListMap!1781 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!13095 () Bool)

(declare-fun mapRes!13095 () Bool)

(declare-fun tp!26958 () Bool)

(declare-fun e!216037 () Bool)

(assert (=> mapNonEmpty!13095 (= mapRes!13095 (and tp!26958 e!216037))))

(declare-fun mapValue!13095 () ValueCell!3527)

(declare-fun mapKey!13095 () (_ BitVec 32))

(declare-fun mapRest!13095 () (Array (_ BitVec 32) ValueCell!3527))

(assert (=> mapNonEmpty!13095 (= (arr!9032 _values!1525) (store mapRest!13095 mapKey!13095 mapValue!13095))))

(declare-fun mapIsEmpty!13095 () Bool)

(assert (=> mapIsEmpty!13095 mapRes!13095))

(declare-fun b!352813 () Bool)

(assert (=> b!352813 (= e!216037 tp_is_empty!7741)))

(declare-fun b!352814 () Bool)

(assert (=> b!352814 (= e!216038 (and e!216035 mapRes!13095))))

(declare-fun condMapEmpty!13095 () Bool)

(declare-fun mapDefault!13095 () ValueCell!3527)

(assert (=> b!352814 (= condMapEmpty!13095 (= (arr!9032 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3527)) mapDefault!13095)))))

(declare-fun b!352815 () Bool)

(declare-fun res!195679 () Bool)

(assert (=> b!352815 (=> (not res!195679) (not e!216036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19064 (_ BitVec 32)) Bool)

(assert (=> b!352815 (= res!195679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352816 () Bool)

(declare-fun res!195676 () Bool)

(assert (=> b!352816 (=> (not res!195676) (not e!216036))))

(assert (=> b!352816 (= res!195676 (and (= (size!9384 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9385 _keys!1895) (size!9384 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!35182 res!195678) b!352816))

(assert (= (and b!352816 res!195676) b!352815))

(assert (= (and b!352815 res!195679) b!352810))

(assert (= (and b!352810 res!195675) b!352811))

(assert (= (and b!352811 res!195680) b!352812))

(assert (= (and b!352812 res!195677) b!352808))

(assert (= (and b!352814 condMapEmpty!13095) mapIsEmpty!13095))

(assert (= (and b!352814 (not condMapEmpty!13095)) mapNonEmpty!13095))

(assert (= (and mapNonEmpty!13095 ((_ is ValueCellFull!3527) mapValue!13095)) b!352813))

(assert (= (and b!352814 ((_ is ValueCellFull!3527) mapDefault!13095)) b!352809))

(assert (= start!35182 b!352814))

(declare-fun m!352611 () Bool)

(assert (=> b!352810 m!352611))

(declare-fun m!352613 () Bool)

(assert (=> b!352815 m!352613))

(declare-fun m!352615 () Bool)

(assert (=> mapNonEmpty!13095 m!352615))

(declare-fun m!352617 () Bool)

(assert (=> b!352808 m!352617))

(declare-fun m!352619 () Bool)

(assert (=> start!35182 m!352619))

(declare-fun m!352621 () Bool)

(assert (=> start!35182 m!352621))

(declare-fun m!352623 () Bool)

(assert (=> start!35182 m!352623))

(declare-fun m!352625 () Bool)

(assert (=> b!352812 m!352625))

(assert (=> b!352812 m!352625))

(declare-fun m!352627 () Bool)

(assert (=> b!352812 m!352627))

(declare-fun m!352629 () Bool)

(assert (=> b!352811 m!352629))

(check-sat (not b_next!7789) (not b!352808) (not mapNonEmpty!13095) (not b!352815) b_and!15041 (not b!352811) tp_is_empty!7741 (not start!35182) (not b!352810) (not b!352812))
(check-sat b_and!15041 (not b_next!7789))
(get-model)

(declare-fun b!352883 () Bool)

(declare-fun e!216077 () SeekEntryResult!3429)

(assert (=> b!352883 (= e!216077 Undefined!3429)))

(declare-fun b!352884 () Bool)

(declare-fun e!216076 () SeekEntryResult!3429)

(assert (=> b!352884 (= e!216077 e!216076)))

(declare-fun lt!165381 () (_ BitVec 64))

(declare-fun lt!165380 () SeekEntryResult!3429)

(assert (=> b!352884 (= lt!165381 (select (arr!9033 _keys!1895) (index!15897 lt!165380)))))

(declare-fun c!53602 () Bool)

(assert (=> b!352884 (= c!53602 (= lt!165381 k0!1348))))

(declare-fun b!352885 () Bool)

(assert (=> b!352885 (= e!216076 (Found!3429 (index!15897 lt!165380)))))

(declare-fun e!216075 () SeekEntryResult!3429)

(declare-fun b!352886 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19064 (_ BitVec 32)) SeekEntryResult!3429)

(assert (=> b!352886 (= e!216075 (seekKeyOrZeroReturnVacant!0 (x!35058 lt!165380) (index!15897 lt!165380) (index!15897 lt!165380) k0!1348 _keys!1895 mask!2385))))

(declare-fun d!71595 () Bool)

(declare-fun lt!165382 () SeekEntryResult!3429)

(assert (=> d!71595 (and (or ((_ is Undefined!3429) lt!165382) (not ((_ is Found!3429) lt!165382)) (and (bvsge (index!15896 lt!165382) #b00000000000000000000000000000000) (bvslt (index!15896 lt!165382) (size!9385 _keys!1895)))) (or ((_ is Undefined!3429) lt!165382) ((_ is Found!3429) lt!165382) (not ((_ is MissingZero!3429) lt!165382)) (and (bvsge (index!15895 lt!165382) #b00000000000000000000000000000000) (bvslt (index!15895 lt!165382) (size!9385 _keys!1895)))) (or ((_ is Undefined!3429) lt!165382) ((_ is Found!3429) lt!165382) ((_ is MissingZero!3429) lt!165382) (not ((_ is MissingVacant!3429) lt!165382)) (and (bvsge (index!15898 lt!165382) #b00000000000000000000000000000000) (bvslt (index!15898 lt!165382) (size!9385 _keys!1895)))) (or ((_ is Undefined!3429) lt!165382) (ite ((_ is Found!3429) lt!165382) (= (select (arr!9033 _keys!1895) (index!15896 lt!165382)) k0!1348) (ite ((_ is MissingZero!3429) lt!165382) (= (select (arr!9033 _keys!1895) (index!15895 lt!165382)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3429) lt!165382) (= (select (arr!9033 _keys!1895) (index!15898 lt!165382)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71595 (= lt!165382 e!216077)))

(declare-fun c!53603 () Bool)

(assert (=> d!71595 (= c!53603 (and ((_ is Intermediate!3429) lt!165380) (undefined!4241 lt!165380)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19064 (_ BitVec 32)) SeekEntryResult!3429)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71595 (= lt!165380 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71595 (validMask!0 mask!2385)))

(assert (=> d!71595 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!165382)))

(declare-fun b!352887 () Bool)

(declare-fun c!53601 () Bool)

(assert (=> b!352887 (= c!53601 (= lt!165381 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!352887 (= e!216076 e!216075)))

(declare-fun b!352888 () Bool)

(assert (=> b!352888 (= e!216075 (MissingZero!3429 (index!15897 lt!165380)))))

(assert (= (and d!71595 c!53603) b!352883))

(assert (= (and d!71595 (not c!53603)) b!352884))

(assert (= (and b!352884 c!53602) b!352885))

(assert (= (and b!352884 (not c!53602)) b!352887))

(assert (= (and b!352887 c!53601) b!352888))

(assert (= (and b!352887 (not c!53601)) b!352886))

(declare-fun m!352671 () Bool)

(assert (=> b!352884 m!352671))

(declare-fun m!352673 () Bool)

(assert (=> b!352886 m!352673))

(assert (=> d!71595 m!352619))

(declare-fun m!352675 () Bool)

(assert (=> d!71595 m!352675))

(declare-fun m!352677 () Bool)

(assert (=> d!71595 m!352677))

(declare-fun m!352679 () Bool)

(assert (=> d!71595 m!352679))

(declare-fun m!352681 () Bool)

(assert (=> d!71595 m!352681))

(assert (=> d!71595 m!352679))

(declare-fun m!352683 () Bool)

(assert (=> d!71595 m!352683))

(assert (=> b!352808 d!71595))

(declare-fun b!352898 () Bool)

(declare-fun e!216086 () Bool)

(declare-fun e!216084 () Bool)

(assert (=> b!352898 (= e!216086 e!216084)))

(declare-fun c!53606 () Bool)

(assert (=> b!352898 (= c!53606 (validKeyInArray!0 (select (arr!9033 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27074 () Bool)

(declare-fun call!27077 () Bool)

(assert (=> bm!27074 (= call!27077 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!352897 () Bool)

(assert (=> b!352897 (= e!216084 call!27077)))

(declare-fun d!71597 () Bool)

(declare-fun res!195722 () Bool)

(assert (=> d!71597 (=> res!195722 e!216086)))

(assert (=> d!71597 (= res!195722 (bvsge #b00000000000000000000000000000000 (size!9385 _keys!1895)))))

(assert (=> d!71597 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!216086)))

(declare-fun b!352899 () Bool)

(declare-fun e!216085 () Bool)

(assert (=> b!352899 (= e!216084 e!216085)))

(declare-fun lt!165391 () (_ BitVec 64))

(assert (=> b!352899 (= lt!165391 (select (arr!9033 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10887 0))(
  ( (Unit!10888) )
))
(declare-fun lt!165390 () Unit!10887)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19064 (_ BitVec 64) (_ BitVec 32)) Unit!10887)

(assert (=> b!352899 (= lt!165390 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!165391 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!352899 (arrayContainsKey!0 _keys!1895 lt!165391 #b00000000000000000000000000000000)))

(declare-fun lt!165389 () Unit!10887)

(assert (=> b!352899 (= lt!165389 lt!165390)))

(declare-fun res!195721 () Bool)

(assert (=> b!352899 (= res!195721 (= (seekEntryOrOpen!0 (select (arr!9033 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3429 #b00000000000000000000000000000000)))))

(assert (=> b!352899 (=> (not res!195721) (not e!216085))))

(declare-fun b!352900 () Bool)

(assert (=> b!352900 (= e!216085 call!27077)))

(assert (= (and d!71597 (not res!195722)) b!352898))

(assert (= (and b!352898 c!53606) b!352899))

(assert (= (and b!352898 (not c!53606)) b!352897))

(assert (= (and b!352899 res!195721) b!352900))

(assert (= (or b!352900 b!352897) bm!27074))

(declare-fun m!352685 () Bool)

(assert (=> b!352898 m!352685))

(assert (=> b!352898 m!352685))

(declare-fun m!352687 () Bool)

(assert (=> b!352898 m!352687))

(declare-fun m!352689 () Bool)

(assert (=> bm!27074 m!352689))

(assert (=> b!352899 m!352685))

(declare-fun m!352691 () Bool)

(assert (=> b!352899 m!352691))

(declare-fun m!352693 () Bool)

(assert (=> b!352899 m!352693))

(assert (=> b!352899 m!352685))

(declare-fun m!352695 () Bool)

(assert (=> b!352899 m!352695))

(assert (=> b!352815 d!71597))

(declare-fun d!71599 () Bool)

(declare-fun e!216091 () Bool)

(assert (=> d!71599 e!216091))

(declare-fun res!195725 () Bool)

(assert (=> d!71599 (=> res!195725 e!216091)))

(declare-fun lt!165402 () Bool)

(assert (=> d!71599 (= res!195725 (not lt!165402))))

(declare-fun lt!165403 () Bool)

(assert (=> d!71599 (= lt!165402 lt!165403)))

(declare-fun lt!165401 () Unit!10887)

(declare-fun e!216092 () Unit!10887)

(assert (=> d!71599 (= lt!165401 e!216092)))

(declare-fun c!53609 () Bool)

(assert (=> d!71599 (= c!53609 lt!165403)))

(declare-fun containsKey!345 (List!5167 (_ BitVec 64)) Bool)

(assert (=> d!71599 (= lt!165403 (containsKey!345 (toList!2253 (getCurrentListMap!1781 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71599 (= (contains!2345 (getCurrentListMap!1781 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!165402)))

(declare-fun b!352907 () Bool)

(declare-fun lt!165400 () Unit!10887)

(assert (=> b!352907 (= e!216092 lt!165400)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!293 (List!5167 (_ BitVec 64)) Unit!10887)

(assert (=> b!352907 (= lt!165400 (lemmaContainsKeyImpliesGetValueByKeyDefined!293 (toList!2253 (getCurrentListMap!1781 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!360 0))(
  ( (Some!359 (v!6110 V!11299)) (None!358) )
))
(declare-fun isDefined!294 (Option!360) Bool)

(declare-fun getValueByKey!354 (List!5167 (_ BitVec 64)) Option!360)

(assert (=> b!352907 (isDefined!294 (getValueByKey!354 (toList!2253 (getCurrentListMap!1781 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!352908 () Bool)

(declare-fun Unit!10889 () Unit!10887)

(assert (=> b!352908 (= e!216092 Unit!10889)))

(declare-fun b!352909 () Bool)

(assert (=> b!352909 (= e!216091 (isDefined!294 (getValueByKey!354 (toList!2253 (getCurrentListMap!1781 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71599 c!53609) b!352907))

(assert (= (and d!71599 (not c!53609)) b!352908))

(assert (= (and d!71599 (not res!195725)) b!352909))

(declare-fun m!352697 () Bool)

(assert (=> d!71599 m!352697))

(declare-fun m!352699 () Bool)

(assert (=> b!352907 m!352699))

(declare-fun m!352701 () Bool)

(assert (=> b!352907 m!352701))

(assert (=> b!352907 m!352701))

(declare-fun m!352703 () Bool)

(assert (=> b!352907 m!352703))

(assert (=> b!352909 m!352701))

(assert (=> b!352909 m!352701))

(assert (=> b!352909 m!352703))

(assert (=> b!352812 d!71599))

(declare-fun b!352952 () Bool)

(declare-fun c!53622 () Bool)

(assert (=> b!352952 (= c!53622 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!216125 () ListLongMap!4475)

(declare-fun e!216122 () ListLongMap!4475)

(assert (=> b!352952 (= e!216125 e!216122)))

(declare-fun b!352953 () Bool)

(declare-fun e!216123 () Bool)

(declare-fun e!216126 () Bool)

(assert (=> b!352953 (= e!216123 e!216126)))

(declare-fun res!195752 () Bool)

(declare-fun call!27093 () Bool)

(assert (=> b!352953 (= res!195752 call!27093)))

(assert (=> b!352953 (=> (not res!195752) (not e!216126))))

(declare-fun b!352955 () Bool)

(declare-fun e!216121 () ListLongMap!4475)

(declare-fun call!27097 () ListLongMap!4475)

(declare-fun +!746 (ListLongMap!4475 tuple2!5560) ListLongMap!4475)

(assert (=> b!352955 (= e!216121 (+!746 call!27097 (tuple2!5561 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!352956 () Bool)

(declare-fun e!216131 () Bool)

(declare-fun e!216119 () Bool)

(assert (=> b!352956 (= e!216131 e!216119)))

(declare-fun res!195747 () Bool)

(assert (=> b!352956 (=> (not res!195747) (not e!216119))))

(declare-fun lt!165451 () ListLongMap!4475)

(assert (=> b!352956 (= res!195747 (contains!2345 lt!165451 (select (arr!9033 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!352956 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9385 _keys!1895)))))

(declare-fun b!352957 () Bool)

(assert (=> b!352957 (= e!216121 e!216125)))

(declare-fun c!53627 () Bool)

(assert (=> b!352957 (= c!53627 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27089 () Bool)

(assert (=> bm!27089 (= call!27093 (contains!2345 lt!165451 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!352958 () Bool)

(declare-fun e!216124 () Bool)

(declare-fun call!27096 () Bool)

(assert (=> b!352958 (= e!216124 (not call!27096))))

(declare-fun b!352959 () Bool)

(declare-fun e!216127 () Bool)

(assert (=> b!352959 (= e!216127 (validKeyInArray!0 (select (arr!9033 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352960 () Bool)

(declare-fun apply!295 (ListLongMap!4475 (_ BitVec 64)) V!11299)

(assert (=> b!352960 (= e!216126 (= (apply!295 lt!165451 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!352961 () Bool)

(declare-fun get!4827 (ValueCell!3527 V!11299) V!11299)

(declare-fun dynLambda!638 (Int (_ BitVec 64)) V!11299)

(assert (=> b!352961 (= e!216119 (= (apply!295 lt!165451 (select (arr!9033 _keys!1895) #b00000000000000000000000000000000)) (get!4827 (select (arr!9032 _values!1525) #b00000000000000000000000000000000) (dynLambda!638 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!352961 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9384 _values!1525)))))

(assert (=> b!352961 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9385 _keys!1895)))))

(declare-fun b!352962 () Bool)

(declare-fun e!216130 () Bool)

(assert (=> b!352962 (= e!216130 (validKeyInArray!0 (select (arr!9033 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352963 () Bool)

(declare-fun res!195745 () Bool)

(declare-fun e!216128 () Bool)

(assert (=> b!352963 (=> (not res!195745) (not e!216128))))

(assert (=> b!352963 (= res!195745 e!216124)))

(declare-fun c!53625 () Bool)

(assert (=> b!352963 (= c!53625 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27090 () Bool)

(declare-fun call!27098 () ListLongMap!4475)

(declare-fun call!27095 () ListLongMap!4475)

(assert (=> bm!27090 (= call!27098 call!27095)))

(declare-fun b!352964 () Bool)

(declare-fun call!27094 () ListLongMap!4475)

(assert (=> b!352964 (= e!216125 call!27094)))

(declare-fun bm!27091 () Bool)

(assert (=> bm!27091 (= call!27094 call!27097)))

(declare-fun b!352965 () Bool)

(declare-fun e!216129 () Bool)

(assert (=> b!352965 (= e!216129 (= (apply!295 lt!165451 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!352966 () Bool)

(assert (=> b!352966 (= e!216124 e!216129)))

(declare-fun res!195749 () Bool)

(assert (=> b!352966 (= res!195749 call!27096)))

(assert (=> b!352966 (=> (not res!195749) (not e!216129))))

(declare-fun b!352954 () Bool)

(declare-fun e!216120 () Unit!10887)

(declare-fun lt!165449 () Unit!10887)

(assert (=> b!352954 (= e!216120 lt!165449)))

(declare-fun lt!165462 () ListLongMap!4475)

(declare-fun getCurrentListMapNoExtraKeys!611 (array!19064 array!19062 (_ BitVec 32) (_ BitVec 32) V!11299 V!11299 (_ BitVec 32) Int) ListLongMap!4475)

(assert (=> b!352954 (= lt!165462 (getCurrentListMapNoExtraKeys!611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165450 () (_ BitVec 64))

(assert (=> b!352954 (= lt!165450 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165448 () (_ BitVec 64))

(assert (=> b!352954 (= lt!165448 (select (arr!9033 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165459 () Unit!10887)

(declare-fun addStillContains!271 (ListLongMap!4475 (_ BitVec 64) V!11299 (_ BitVec 64)) Unit!10887)

(assert (=> b!352954 (= lt!165459 (addStillContains!271 lt!165462 lt!165450 zeroValue!1467 lt!165448))))

(assert (=> b!352954 (contains!2345 (+!746 lt!165462 (tuple2!5561 lt!165450 zeroValue!1467)) lt!165448)))

(declare-fun lt!165453 () Unit!10887)

(assert (=> b!352954 (= lt!165453 lt!165459)))

(declare-fun lt!165464 () ListLongMap!4475)

(assert (=> b!352954 (= lt!165464 (getCurrentListMapNoExtraKeys!611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165458 () (_ BitVec 64))

(assert (=> b!352954 (= lt!165458 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165454 () (_ BitVec 64))

(assert (=> b!352954 (= lt!165454 (select (arr!9033 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165468 () Unit!10887)

(declare-fun addApplyDifferent!271 (ListLongMap!4475 (_ BitVec 64) V!11299 (_ BitVec 64)) Unit!10887)

(assert (=> b!352954 (= lt!165468 (addApplyDifferent!271 lt!165464 lt!165458 minValue!1467 lt!165454))))

(assert (=> b!352954 (= (apply!295 (+!746 lt!165464 (tuple2!5561 lt!165458 minValue!1467)) lt!165454) (apply!295 lt!165464 lt!165454))))

(declare-fun lt!165455 () Unit!10887)

(assert (=> b!352954 (= lt!165455 lt!165468)))

(declare-fun lt!165460 () ListLongMap!4475)

(assert (=> b!352954 (= lt!165460 (getCurrentListMapNoExtraKeys!611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165463 () (_ BitVec 64))

(assert (=> b!352954 (= lt!165463 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165467 () (_ BitVec 64))

(assert (=> b!352954 (= lt!165467 (select (arr!9033 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165456 () Unit!10887)

(assert (=> b!352954 (= lt!165456 (addApplyDifferent!271 lt!165460 lt!165463 zeroValue!1467 lt!165467))))

(assert (=> b!352954 (= (apply!295 (+!746 lt!165460 (tuple2!5561 lt!165463 zeroValue!1467)) lt!165467) (apply!295 lt!165460 lt!165467))))

(declare-fun lt!165465 () Unit!10887)

(assert (=> b!352954 (= lt!165465 lt!165456)))

(declare-fun lt!165461 () ListLongMap!4475)

(assert (=> b!352954 (= lt!165461 (getCurrentListMapNoExtraKeys!611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165452 () (_ BitVec 64))

(assert (=> b!352954 (= lt!165452 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165466 () (_ BitVec 64))

(assert (=> b!352954 (= lt!165466 (select (arr!9033 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!352954 (= lt!165449 (addApplyDifferent!271 lt!165461 lt!165452 minValue!1467 lt!165466))))

(assert (=> b!352954 (= (apply!295 (+!746 lt!165461 (tuple2!5561 lt!165452 minValue!1467)) lt!165466) (apply!295 lt!165461 lt!165466))))

(declare-fun d!71601 () Bool)

(assert (=> d!71601 e!216128))

(declare-fun res!195746 () Bool)

(assert (=> d!71601 (=> (not res!195746) (not e!216128))))

(assert (=> d!71601 (= res!195746 (or (bvsge #b00000000000000000000000000000000 (size!9385 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9385 _keys!1895)))))))

(declare-fun lt!165469 () ListLongMap!4475)

(assert (=> d!71601 (= lt!165451 lt!165469)))

(declare-fun lt!165457 () Unit!10887)

(assert (=> d!71601 (= lt!165457 e!216120)))

(declare-fun c!53623 () Bool)

(assert (=> d!71601 (= c!53623 e!216130)))

(declare-fun res!195750 () Bool)

(assert (=> d!71601 (=> (not res!195750) (not e!216130))))

(assert (=> d!71601 (= res!195750 (bvslt #b00000000000000000000000000000000 (size!9385 _keys!1895)))))

(assert (=> d!71601 (= lt!165469 e!216121)))

(declare-fun c!53624 () Bool)

(assert (=> d!71601 (= c!53624 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71601 (validMask!0 mask!2385)))

(assert (=> d!71601 (= (getCurrentListMap!1781 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!165451)))

(declare-fun b!352967 () Bool)

(declare-fun res!195748 () Bool)

(assert (=> b!352967 (=> (not res!195748) (not e!216128))))

(assert (=> b!352967 (= res!195748 e!216131)))

(declare-fun res!195744 () Bool)

(assert (=> b!352967 (=> res!195744 e!216131)))

(assert (=> b!352967 (= res!195744 (not e!216127))))

(declare-fun res!195751 () Bool)

(assert (=> b!352967 (=> (not res!195751) (not e!216127))))

(assert (=> b!352967 (= res!195751 (bvslt #b00000000000000000000000000000000 (size!9385 _keys!1895)))))

(declare-fun bm!27092 () Bool)

(declare-fun call!27092 () ListLongMap!4475)

(assert (=> bm!27092 (= call!27097 (+!746 (ite c!53624 call!27092 (ite c!53627 call!27095 call!27098)) (ite (or c!53624 c!53627) (tuple2!5561 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5561 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!352968 () Bool)

(assert (=> b!352968 (= e!216128 e!216123)))

(declare-fun c!53626 () Bool)

(assert (=> b!352968 (= c!53626 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!352969 () Bool)

(assert (=> b!352969 (= e!216122 call!27094)))

(declare-fun bm!27093 () Bool)

(assert (=> bm!27093 (= call!27096 (contains!2345 lt!165451 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27094 () Bool)

(assert (=> bm!27094 (= call!27095 call!27092)))

(declare-fun b!352970 () Bool)

(declare-fun Unit!10890 () Unit!10887)

(assert (=> b!352970 (= e!216120 Unit!10890)))

(declare-fun b!352971 () Bool)

(assert (=> b!352971 (= e!216123 (not call!27093))))

(declare-fun b!352972 () Bool)

(assert (=> b!352972 (= e!216122 call!27098)))

(declare-fun bm!27095 () Bool)

(assert (=> bm!27095 (= call!27092 (getCurrentListMapNoExtraKeys!611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(assert (= (and d!71601 c!53624) b!352955))

(assert (= (and d!71601 (not c!53624)) b!352957))

(assert (= (and b!352957 c!53627) b!352964))

(assert (= (and b!352957 (not c!53627)) b!352952))

(assert (= (and b!352952 c!53622) b!352969))

(assert (= (and b!352952 (not c!53622)) b!352972))

(assert (= (or b!352969 b!352972) bm!27090))

(assert (= (or b!352964 bm!27090) bm!27094))

(assert (= (or b!352964 b!352969) bm!27091))

(assert (= (or b!352955 bm!27094) bm!27095))

(assert (= (or b!352955 bm!27091) bm!27092))

(assert (= (and d!71601 res!195750) b!352962))

(assert (= (and d!71601 c!53623) b!352954))

(assert (= (and d!71601 (not c!53623)) b!352970))

(assert (= (and d!71601 res!195746) b!352967))

(assert (= (and b!352967 res!195751) b!352959))

(assert (= (and b!352967 (not res!195744)) b!352956))

(assert (= (and b!352956 res!195747) b!352961))

(assert (= (and b!352967 res!195748) b!352963))

(assert (= (and b!352963 c!53625) b!352966))

(assert (= (and b!352963 (not c!53625)) b!352958))

(assert (= (and b!352966 res!195749) b!352965))

(assert (= (or b!352966 b!352958) bm!27093))

(assert (= (and b!352963 res!195745) b!352968))

(assert (= (and b!352968 c!53626) b!352953))

(assert (= (and b!352968 (not c!53626)) b!352971))

(assert (= (and b!352953 res!195752) b!352960))

(assert (= (or b!352953 b!352971) bm!27089))

(declare-fun b_lambda!8541 () Bool)

(assert (=> (not b_lambda!8541) (not b!352961)))

(declare-fun t!10308 () Bool)

(declare-fun tb!3097 () Bool)

(assert (=> (and start!35182 (= defaultEntry!1528 defaultEntry!1528) t!10308) tb!3097))

(declare-fun result!5637 () Bool)

(assert (=> tb!3097 (= result!5637 tp_is_empty!7741)))

(assert (=> b!352961 t!10308))

(declare-fun b_and!15047 () Bool)

(assert (= b_and!15041 (and (=> t!10308 result!5637) b_and!15047)))

(declare-fun m!352705 () Bool)

(assert (=> bm!27095 m!352705))

(declare-fun m!352707 () Bool)

(assert (=> b!352955 m!352707))

(declare-fun m!352709 () Bool)

(assert (=> bm!27093 m!352709))

(assert (=> d!71601 m!352619))

(declare-fun m!352711 () Bool)

(assert (=> b!352965 m!352711))

(declare-fun m!352713 () Bool)

(assert (=> bm!27092 m!352713))

(declare-fun m!352715 () Bool)

(assert (=> b!352954 m!352715))

(declare-fun m!352717 () Bool)

(assert (=> b!352954 m!352717))

(assert (=> b!352954 m!352705))

(declare-fun m!352719 () Bool)

(assert (=> b!352954 m!352719))

(declare-fun m!352721 () Bool)

(assert (=> b!352954 m!352721))

(assert (=> b!352954 m!352721))

(declare-fun m!352723 () Bool)

(assert (=> b!352954 m!352723))

(assert (=> b!352954 m!352719))

(declare-fun m!352725 () Bool)

(assert (=> b!352954 m!352725))

(declare-fun m!352727 () Bool)

(assert (=> b!352954 m!352727))

(assert (=> b!352954 m!352715))

(declare-fun m!352729 () Bool)

(assert (=> b!352954 m!352729))

(assert (=> b!352954 m!352685))

(declare-fun m!352731 () Bool)

(assert (=> b!352954 m!352731))

(declare-fun m!352733 () Bool)

(assert (=> b!352954 m!352733))

(declare-fun m!352735 () Bool)

(assert (=> b!352954 m!352735))

(declare-fun m!352737 () Bool)

(assert (=> b!352954 m!352737))

(declare-fun m!352739 () Bool)

(assert (=> b!352954 m!352739))

(declare-fun m!352741 () Bool)

(assert (=> b!352954 m!352741))

(assert (=> b!352954 m!352739))

(declare-fun m!352743 () Bool)

(assert (=> b!352954 m!352743))

(declare-fun m!352745 () Bool)

(assert (=> bm!27089 m!352745))

(assert (=> b!352961 m!352685))

(declare-fun m!352747 () Bool)

(assert (=> b!352961 m!352747))

(declare-fun m!352749 () Bool)

(assert (=> b!352961 m!352749))

(declare-fun m!352751 () Bool)

(assert (=> b!352961 m!352751))

(declare-fun m!352753 () Bool)

(assert (=> b!352961 m!352753))

(assert (=> b!352961 m!352749))

(assert (=> b!352961 m!352685))

(assert (=> b!352961 m!352751))

(declare-fun m!352755 () Bool)

(assert (=> b!352960 m!352755))

(assert (=> b!352962 m!352685))

(assert (=> b!352962 m!352685))

(assert (=> b!352962 m!352687))

(assert (=> b!352959 m!352685))

(assert (=> b!352959 m!352685))

(assert (=> b!352959 m!352687))

(assert (=> b!352956 m!352685))

(assert (=> b!352956 m!352685))

(declare-fun m!352757 () Bool)

(assert (=> b!352956 m!352757))

(assert (=> b!352812 d!71601))

(declare-fun d!71603 () Bool)

(assert (=> d!71603 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!352811 d!71603))

(declare-fun b!352985 () Bool)

(declare-fun e!216140 () Bool)

(declare-fun contains!2346 (List!5166 (_ BitVec 64)) Bool)

(assert (=> b!352985 (= e!216140 (contains!2346 Nil!5163 (select (arr!9033 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352986 () Bool)

(declare-fun e!216142 () Bool)

(declare-fun e!216141 () Bool)

(assert (=> b!352986 (= e!216142 e!216141)))

(declare-fun c!53630 () Bool)

(assert (=> b!352986 (= c!53630 (validKeyInArray!0 (select (arr!9033 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352987 () Bool)

(declare-fun call!27101 () Bool)

(assert (=> b!352987 (= e!216141 call!27101)))

(declare-fun b!352988 () Bool)

(assert (=> b!352988 (= e!216141 call!27101)))

(declare-fun d!71605 () Bool)

(declare-fun res!195759 () Bool)

(declare-fun e!216143 () Bool)

(assert (=> d!71605 (=> res!195759 e!216143)))

(assert (=> d!71605 (= res!195759 (bvsge #b00000000000000000000000000000000 (size!9385 _keys!1895)))))

(assert (=> d!71605 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5163) e!216143)))

(declare-fun bm!27098 () Bool)

(assert (=> bm!27098 (= call!27101 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53630 (Cons!5162 (select (arr!9033 _keys!1895) #b00000000000000000000000000000000) Nil!5163) Nil!5163)))))

(declare-fun b!352989 () Bool)

(assert (=> b!352989 (= e!216143 e!216142)))

(declare-fun res!195760 () Bool)

(assert (=> b!352989 (=> (not res!195760) (not e!216142))))

(assert (=> b!352989 (= res!195760 (not e!216140))))

(declare-fun res!195761 () Bool)

(assert (=> b!352989 (=> (not res!195761) (not e!216140))))

(assert (=> b!352989 (= res!195761 (validKeyInArray!0 (select (arr!9033 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71605 (not res!195759)) b!352989))

(assert (= (and b!352989 res!195761) b!352985))

(assert (= (and b!352989 res!195760) b!352986))

(assert (= (and b!352986 c!53630) b!352988))

(assert (= (and b!352986 (not c!53630)) b!352987))

(assert (= (or b!352988 b!352987) bm!27098))

(assert (=> b!352985 m!352685))

(assert (=> b!352985 m!352685))

(declare-fun m!352759 () Bool)

(assert (=> b!352985 m!352759))

(assert (=> b!352986 m!352685))

(assert (=> b!352986 m!352685))

(assert (=> b!352986 m!352687))

(assert (=> bm!27098 m!352685))

(declare-fun m!352761 () Bool)

(assert (=> bm!27098 m!352761))

(assert (=> b!352989 m!352685))

(assert (=> b!352989 m!352685))

(assert (=> b!352989 m!352687))

(assert (=> b!352810 d!71605))

(declare-fun d!71607 () Bool)

(assert (=> d!71607 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35182 d!71607))

(declare-fun d!71609 () Bool)

(assert (=> d!71609 (= (array_inv!6674 _values!1525) (bvsge (size!9384 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35182 d!71609))

(declare-fun d!71611 () Bool)

(assert (=> d!71611 (= (array_inv!6675 _keys!1895) (bvsge (size!9385 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35182 d!71611))

(declare-fun mapNonEmpty!13104 () Bool)

(declare-fun mapRes!13104 () Bool)

(declare-fun tp!26973 () Bool)

(declare-fun e!216149 () Bool)

(assert (=> mapNonEmpty!13104 (= mapRes!13104 (and tp!26973 e!216149))))

(declare-fun mapValue!13104 () ValueCell!3527)

(declare-fun mapRest!13104 () (Array (_ BitVec 32) ValueCell!3527))

(declare-fun mapKey!13104 () (_ BitVec 32))

(assert (=> mapNonEmpty!13104 (= mapRest!13095 (store mapRest!13104 mapKey!13104 mapValue!13104))))

(declare-fun b!352996 () Bool)

(assert (=> b!352996 (= e!216149 tp_is_empty!7741)))

(declare-fun condMapEmpty!13104 () Bool)

(declare-fun mapDefault!13104 () ValueCell!3527)

(assert (=> mapNonEmpty!13095 (= condMapEmpty!13104 (= mapRest!13095 ((as const (Array (_ BitVec 32) ValueCell!3527)) mapDefault!13104)))))

(declare-fun e!216148 () Bool)

(assert (=> mapNonEmpty!13095 (= tp!26958 (and e!216148 mapRes!13104))))

(declare-fun b!352997 () Bool)

(assert (=> b!352997 (= e!216148 tp_is_empty!7741)))

(declare-fun mapIsEmpty!13104 () Bool)

(assert (=> mapIsEmpty!13104 mapRes!13104))

(assert (= (and mapNonEmpty!13095 condMapEmpty!13104) mapIsEmpty!13104))

(assert (= (and mapNonEmpty!13095 (not condMapEmpty!13104)) mapNonEmpty!13104))

(assert (= (and mapNonEmpty!13104 ((_ is ValueCellFull!3527) mapValue!13104)) b!352996))

(assert (= (and mapNonEmpty!13095 ((_ is ValueCellFull!3527) mapDefault!13104)) b!352997))

(declare-fun m!352763 () Bool)

(assert (=> mapNonEmpty!13104 m!352763))

(declare-fun b_lambda!8543 () Bool)

(assert (= b_lambda!8541 (or (and start!35182 b_free!7789) b_lambda!8543)))

(check-sat (not bm!27074) (not bm!27098) (not b!352955) (not bm!27095) (not b!352989) (not b_lambda!8543) (not b!352954) tp_is_empty!7741 (not bm!27093) (not b!352965) (not b!352886) (not b!352962) (not b!352986) (not b!352956) (not d!71599) (not b!352909) b_and!15047 (not b!352985) (not b_next!7789) (not bm!27092) (not d!71601) (not b!352960) (not bm!27089) (not b!352898) (not b!352907) (not mapNonEmpty!13104) (not b!352899) (not b!352961) (not b!352959) (not d!71595))
(check-sat b_and!15047 (not b_next!7789))
