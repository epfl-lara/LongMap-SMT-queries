; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17010 () Bool)

(assert start!17010)

(declare-fun b!170714 () Bool)

(declare-fun b_free!4231 () Bool)

(declare-fun b_next!4231 () Bool)

(assert (=> b!170714 (= b_free!4231 (not b_next!4231))))

(declare-fun tp!15322 () Bool)

(declare-fun b_and!10619 () Bool)

(assert (=> b!170714 (= tp!15322 b_and!10619)))

(declare-fun b!170713 () Bool)

(declare-fun e!112689 () Bool)

(declare-fun tp_is_empty!4003 () Bool)

(assert (=> b!170713 (= e!112689 tp_is_empty!4003)))

(declare-fun e!112693 () Bool)

(declare-datatypes ((V!4985 0))(
  ( (V!4986 (val!2046 Int)) )
))
(declare-datatypes ((ValueCell!1658 0))(
  ( (ValueCellFull!1658 (v!3905 V!4985)) (EmptyCell!1658) )
))
(declare-datatypes ((array!7099 0))(
  ( (array!7100 (arr!3376 (Array (_ BitVec 32) (_ BitVec 64))) (size!3670 (_ BitVec 32))) )
))
(declare-datatypes ((array!7101 0))(
  ( (array!7102 (arr!3377 (Array (_ BitVec 32) ValueCell!1658)) (size!3671 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2224 0))(
  ( (LongMapFixedSize!2225 (defaultEntry!3554 Int) (mask!8381 (_ BitVec 32)) (extraKeys!3295 (_ BitVec 32)) (zeroValue!3397 V!4985) (minValue!3397 V!4985) (_size!1161 (_ BitVec 32)) (_keys!5385 array!7099) (_values!3537 array!7101) (_vacant!1161 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2224)

(declare-fun e!112690 () Bool)

(declare-fun array_inv!2177 (array!7099) Bool)

(declare-fun array_inv!2178 (array!7101) Bool)

(assert (=> b!170714 (= e!112693 (and tp!15322 tp_is_empty!4003 (array_inv!2177 (_keys!5385 thiss!1248)) (array_inv!2178 (_values!3537 thiss!1248)) e!112690))))

(declare-fun b!170715 () Bool)

(declare-fun e!112686 () Bool)

(declare-fun e!112688 () Bool)

(assert (=> b!170715 (= e!112686 e!112688)))

(declare-fun res!81135 () Bool)

(assert (=> b!170715 (=> (not res!81135) (not e!112688))))

(declare-datatypes ((tuple2!3232 0))(
  ( (tuple2!3233 (_1!1627 (_ BitVec 64)) (_2!1627 V!4985)) )
))
(declare-datatypes ((List!2203 0))(
  ( (Nil!2200) (Cons!2199 (h!2816 tuple2!3232) (t!6996 List!2203)) )
))
(declare-datatypes ((ListLongMap!2151 0))(
  ( (ListLongMap!2152 (toList!1091 List!2203)) )
))
(declare-fun lt!84853 () ListLongMap!2151)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun contains!1142 (ListLongMap!2151 (_ BitVec 64)) Bool)

(assert (=> b!170715 (= res!81135 (contains!1142 lt!84853 key!828))))

(declare-fun lt!84854 () LongMapFixedSize!2224)

(declare-fun map!1834 (LongMapFixedSize!2224) ListLongMap!2151)

(assert (=> b!170715 (= lt!84853 (map!1834 lt!84854))))

(declare-fun b!170716 () Bool)

(declare-fun v!309 () V!4985)

(declare-fun +!238 (ListLongMap!2151 tuple2!3232) ListLongMap!2151)

(assert (=> b!170716 (= e!112688 (= lt!84853 (+!238 (map!1834 thiss!1248) (tuple2!3233 key!828 v!309))))))

(declare-fun b!170717 () Bool)

(declare-fun e!112692 () Bool)

(declare-fun mapRes!6797 () Bool)

(assert (=> b!170717 (= e!112690 (and e!112692 mapRes!6797))))

(declare-fun condMapEmpty!6797 () Bool)

(declare-fun mapDefault!6797 () ValueCell!1658)

(assert (=> b!170717 (= condMapEmpty!6797 (= (arr!3377 (_values!3537 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1658)) mapDefault!6797)))))

(declare-fun b!170718 () Bool)

(declare-fun res!81134 () Bool)

(declare-fun e!112691 () Bool)

(assert (=> b!170718 (=> (not res!81134) (not e!112691))))

(assert (=> b!170718 (= res!81134 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!6797 () Bool)

(declare-fun tp!15323 () Bool)

(assert (=> mapNonEmpty!6797 (= mapRes!6797 (and tp!15323 e!112689))))

(declare-fun mapRest!6797 () (Array (_ BitVec 32) ValueCell!1658))

(declare-fun mapKey!6797 () (_ BitVec 32))

(declare-fun mapValue!6797 () ValueCell!1658)

(assert (=> mapNonEmpty!6797 (= (arr!3377 (_values!3537 thiss!1248)) (store mapRest!6797 mapKey!6797 mapValue!6797))))

(declare-fun b!170719 () Bool)

(assert (=> b!170719 (= e!112692 tp_is_empty!4003)))

(declare-fun b!170720 () Bool)

(assert (=> b!170720 (= e!112691 (not e!112686))))

(declare-fun res!81136 () Bool)

(assert (=> b!170720 (=> (not res!81136) (not e!112686))))

(declare-fun valid!966 (LongMapFixedSize!2224) Bool)

(assert (=> b!170720 (= res!81136 (valid!966 lt!84854))))

(assert (=> b!170720 (= lt!84854 (LongMapFixedSize!2225 (defaultEntry!3554 thiss!1248) (mask!8381 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) (_size!1161 thiss!1248) (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (_vacant!1161 thiss!1248)))))

(declare-fun getCurrentListMap!729 (array!7099 array!7101 (_ BitVec 32) (_ BitVec 32) V!4985 V!4985 (_ BitVec 32) Int) ListLongMap!2151)

(assert (=> b!170720 (= (+!238 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-datatypes ((Unit!5227 0))(
  ( (Unit!5228) )
))
(declare-fun lt!84855 () Unit!5227)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!81 (array!7099 array!7101 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!4985 V!4985 V!4985 Int) Unit!5227)

(assert (=> b!170720 (= lt!84855 (lemmaChangeZeroKeyThenAddPairToListMap!81 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) (zeroValue!3397 thiss!1248) v!309 (minValue!3397 thiss!1248) (defaultEntry!3554 thiss!1248)))))

(declare-fun res!81133 () Bool)

(assert (=> start!17010 (=> (not res!81133) (not e!112691))))

(assert (=> start!17010 (= res!81133 (valid!966 thiss!1248))))

(assert (=> start!17010 e!112691))

(assert (=> start!17010 e!112693))

(assert (=> start!17010 true))

(assert (=> start!17010 tp_is_empty!4003))

(declare-fun mapIsEmpty!6797 () Bool)

(assert (=> mapIsEmpty!6797 mapRes!6797))

(assert (= (and start!17010 res!81133) b!170718))

(assert (= (and b!170718 res!81134) b!170720))

(assert (= (and b!170720 res!81136) b!170715))

(assert (= (and b!170715 res!81135) b!170716))

(assert (= (and b!170717 condMapEmpty!6797) mapIsEmpty!6797))

(assert (= (and b!170717 (not condMapEmpty!6797)) mapNonEmpty!6797))

(get-info :version)

(assert (= (and mapNonEmpty!6797 ((_ is ValueCellFull!1658) mapValue!6797)) b!170713))

(assert (= (and b!170717 ((_ is ValueCellFull!1658) mapDefault!6797)) b!170719))

(assert (= b!170714 b!170717))

(assert (= start!17010 b!170714))

(declare-fun m!198543 () Bool)

(assert (=> mapNonEmpty!6797 m!198543))

(declare-fun m!198545 () Bool)

(assert (=> b!170715 m!198545))

(declare-fun m!198547 () Bool)

(assert (=> b!170715 m!198547))

(declare-fun m!198549 () Bool)

(assert (=> b!170720 m!198549))

(declare-fun m!198551 () Bool)

(assert (=> b!170720 m!198551))

(declare-fun m!198553 () Bool)

(assert (=> b!170720 m!198553))

(declare-fun m!198555 () Bool)

(assert (=> b!170720 m!198555))

(assert (=> b!170720 m!198549))

(declare-fun m!198557 () Bool)

(assert (=> b!170720 m!198557))

(declare-fun m!198559 () Bool)

(assert (=> start!17010 m!198559))

(declare-fun m!198561 () Bool)

(assert (=> b!170716 m!198561))

(assert (=> b!170716 m!198561))

(declare-fun m!198563 () Bool)

(assert (=> b!170716 m!198563))

(declare-fun m!198565 () Bool)

(assert (=> b!170714 m!198565))

(declare-fun m!198567 () Bool)

(assert (=> b!170714 m!198567))

(check-sat tp_is_empty!4003 (not b!170716) (not b_next!4231) (not start!17010) b_and!10619 (not b!170715) (not b!170720) (not b!170714) (not mapNonEmpty!6797))
(check-sat b_and!10619 (not b_next!4231))
(get-model)

(declare-fun d!51619 () Bool)

(declare-fun e!112747 () Bool)

(assert (=> d!51619 e!112747))

(declare-fun res!81163 () Bool)

(assert (=> d!51619 (=> res!81163 e!112747)))

(declare-fun lt!84885 () Bool)

(assert (=> d!51619 (= res!81163 (not lt!84885))))

(declare-fun lt!84883 () Bool)

(assert (=> d!51619 (= lt!84885 lt!84883)))

(declare-fun lt!84882 () Unit!5227)

(declare-fun e!112746 () Unit!5227)

(assert (=> d!51619 (= lt!84882 e!112746)))

(declare-fun c!30473 () Bool)

(assert (=> d!51619 (= c!30473 lt!84883)))

(declare-fun containsKey!186 (List!2203 (_ BitVec 64)) Bool)

(assert (=> d!51619 (= lt!84883 (containsKey!186 (toList!1091 lt!84853) key!828))))

(assert (=> d!51619 (= (contains!1142 lt!84853 key!828) lt!84885)))

(declare-fun b!170775 () Bool)

(declare-fun lt!84884 () Unit!5227)

(assert (=> b!170775 (= e!112746 lt!84884)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!135 (List!2203 (_ BitVec 64)) Unit!5227)

(assert (=> b!170775 (= lt!84884 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84853) key!828))))

(declare-datatypes ((Option!188 0))(
  ( (Some!187 (v!3908 V!4985)) (None!186) )
))
(declare-fun isDefined!136 (Option!188) Bool)

(declare-fun getValueByKey!182 (List!2203 (_ BitVec 64)) Option!188)

(assert (=> b!170775 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84853) key!828))))

(declare-fun b!170776 () Bool)

(declare-fun Unit!5231 () Unit!5227)

(assert (=> b!170776 (= e!112746 Unit!5231)))

(declare-fun b!170777 () Bool)

(assert (=> b!170777 (= e!112747 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84853) key!828)))))

(assert (= (and d!51619 c!30473) b!170775))

(assert (= (and d!51619 (not c!30473)) b!170776))

(assert (= (and d!51619 (not res!81163)) b!170777))

(declare-fun m!198621 () Bool)

(assert (=> d!51619 m!198621))

(declare-fun m!198623 () Bool)

(assert (=> b!170775 m!198623))

(declare-fun m!198625 () Bool)

(assert (=> b!170775 m!198625))

(assert (=> b!170775 m!198625))

(declare-fun m!198627 () Bool)

(assert (=> b!170775 m!198627))

(assert (=> b!170777 m!198625))

(assert (=> b!170777 m!198625))

(assert (=> b!170777 m!198627))

(assert (=> b!170715 d!51619))

(declare-fun d!51621 () Bool)

(assert (=> d!51621 (= (map!1834 lt!84854) (getCurrentListMap!729 (_keys!5385 lt!84854) (_values!3537 lt!84854) (mask!8381 lt!84854) (extraKeys!3295 lt!84854) (zeroValue!3397 lt!84854) (minValue!3397 lt!84854) #b00000000000000000000000000000000 (defaultEntry!3554 lt!84854)))))

(declare-fun bs!7022 () Bool)

(assert (= bs!7022 d!51621))

(declare-fun m!198629 () Bool)

(assert (=> bs!7022 m!198629))

(assert (=> b!170715 d!51621))

(declare-fun d!51623 () Bool)

(declare-fun e!112750 () Bool)

(assert (=> d!51623 e!112750))

(declare-fun res!81169 () Bool)

(assert (=> d!51623 (=> (not res!81169) (not e!112750))))

(declare-fun lt!84897 () ListLongMap!2151)

(assert (=> d!51623 (= res!81169 (contains!1142 lt!84897 (_1!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun lt!84895 () List!2203)

(assert (=> d!51623 (= lt!84897 (ListLongMap!2152 lt!84895))))

(declare-fun lt!84896 () Unit!5227)

(declare-fun lt!84894 () Unit!5227)

(assert (=> d!51623 (= lt!84896 lt!84894)))

(assert (=> d!51623 (= (getValueByKey!182 lt!84895 (_1!1627 (tuple2!3233 key!828 v!309))) (Some!187 (_2!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!98 (List!2203 (_ BitVec 64) V!4985) Unit!5227)

(assert (=> d!51623 (= lt!84894 (lemmaContainsTupThenGetReturnValue!98 lt!84895 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun insertStrictlySorted!101 (List!2203 (_ BitVec 64) V!4985) List!2203)

(assert (=> d!51623 (= lt!84895 (insertStrictlySorted!101 (toList!1091 (map!1834 thiss!1248)) (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309))))))

(assert (=> d!51623 (= (+!238 (map!1834 thiss!1248) (tuple2!3233 key!828 v!309)) lt!84897)))

(declare-fun b!170782 () Bool)

(declare-fun res!81168 () Bool)

(assert (=> b!170782 (=> (not res!81168) (not e!112750))))

(assert (=> b!170782 (= res!81168 (= (getValueByKey!182 (toList!1091 lt!84897) (_1!1627 (tuple2!3233 key!828 v!309))) (Some!187 (_2!1627 (tuple2!3233 key!828 v!309)))))))

(declare-fun b!170783 () Bool)

(declare-fun contains!1144 (List!2203 tuple2!3232) Bool)

(assert (=> b!170783 (= e!112750 (contains!1144 (toList!1091 lt!84897) (tuple2!3233 key!828 v!309)))))

(assert (= (and d!51623 res!81169) b!170782))

(assert (= (and b!170782 res!81168) b!170783))

(declare-fun m!198631 () Bool)

(assert (=> d!51623 m!198631))

(declare-fun m!198633 () Bool)

(assert (=> d!51623 m!198633))

(declare-fun m!198635 () Bool)

(assert (=> d!51623 m!198635))

(declare-fun m!198637 () Bool)

(assert (=> d!51623 m!198637))

(declare-fun m!198639 () Bool)

(assert (=> b!170782 m!198639))

(declare-fun m!198641 () Bool)

(assert (=> b!170783 m!198641))

(assert (=> b!170716 d!51623))

(declare-fun d!51625 () Bool)

(assert (=> d!51625 (= (map!1834 thiss!1248) (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun bs!7023 () Bool)

(assert (= bs!7023 d!51625))

(assert (=> bs!7023 m!198549))

(assert (=> b!170716 d!51625))

(declare-fun b!170826 () Bool)

(declare-fun e!112789 () ListLongMap!2151)

(declare-fun call!17385 () ListLongMap!2151)

(assert (=> b!170826 (= e!112789 call!17385)))

(declare-fun b!170827 () Bool)

(declare-fun res!81191 () Bool)

(declare-fun e!112784 () Bool)

(assert (=> b!170827 (=> (not res!81191) (not e!112784))))

(declare-fun e!112782 () Bool)

(assert (=> b!170827 (= res!81191 e!112782)))

(declare-fun c!30491 () Bool)

(assert (=> b!170827 (= c!30491 (not (= (bvand (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!170828 () Bool)

(declare-fun e!112785 () ListLongMap!2151)

(declare-fun call!17382 () ListLongMap!2151)

(assert (=> b!170828 (= e!112785 (+!238 call!17382 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(declare-fun b!170829 () Bool)

(declare-fun e!112788 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!170829 (= e!112788 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170830 () Bool)

(declare-fun e!112781 () Bool)

(declare-fun lt!84962 () ListLongMap!2151)

(declare-fun apply!129 (ListLongMap!2151 (_ BitVec 64)) V!4985)

(assert (=> b!170830 (= e!112781 (= (apply!129 lt!84962 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3397 thiss!1248)))))

(declare-fun b!170832 () Bool)

(declare-fun e!112779 () Bool)

(declare-fun get!1932 (ValueCell!1658 V!4985) V!4985)

(declare-fun dynLambda!463 (Int (_ BitVec 64)) V!4985)

(assert (=> b!170832 (= e!112779 (= (apply!129 lt!84962 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!170832 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3671 (_values!3537 thiss!1248))))))

(assert (=> b!170832 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun bm!17377 () Bool)

(declare-fun call!17384 () ListLongMap!2151)

(declare-fun call!17380 () ListLongMap!2151)

(assert (=> bm!17377 (= call!17384 call!17380)))

(declare-fun bm!17378 () Bool)

(declare-fun call!17381 () Bool)

(assert (=> bm!17378 (= call!17381 (contains!1142 lt!84962 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!170833 () Bool)

(declare-fun e!112780 () Bool)

(assert (=> b!170833 (= e!112784 e!112780)))

(declare-fun c!30489 () Bool)

(assert (=> b!170833 (= c!30489 (not (= (bvand (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!170834 () Bool)

(declare-fun call!17386 () Bool)

(assert (=> b!170834 (= e!112780 (not call!17386))))

(declare-fun b!170835 () Bool)

(assert (=> b!170835 (= e!112780 e!112781)))

(declare-fun res!81189 () Bool)

(assert (=> b!170835 (= res!81189 call!17386)))

(assert (=> b!170835 (=> (not res!81189) (not e!112781))))

(declare-fun b!170836 () Bool)

(assert (=> b!170836 (= e!112782 (not call!17381))))

(declare-fun bm!17379 () Bool)

(assert (=> bm!17379 (= call!17386 (contains!1142 lt!84962 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17380 () Bool)

(declare-fun call!17383 () ListLongMap!2151)

(declare-fun getCurrentListMapNoExtraKeys!150 (array!7099 array!7101 (_ BitVec 32) (_ BitVec 32) V!4985 V!4985 (_ BitVec 32) Int) ListLongMap!2151)

(assert (=> bm!17380 (= call!17383 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun d!51627 () Bool)

(assert (=> d!51627 e!112784))

(declare-fun res!81195 () Bool)

(assert (=> d!51627 (=> (not res!81195) (not e!112784))))

(assert (=> d!51627 (= res!81195 (or (bvsge #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))))

(declare-fun lt!84953 () ListLongMap!2151)

(assert (=> d!51627 (= lt!84962 lt!84953)))

(declare-fun lt!84958 () Unit!5227)

(declare-fun e!112786 () Unit!5227)

(assert (=> d!51627 (= lt!84958 e!112786)))

(declare-fun c!30486 () Bool)

(assert (=> d!51627 (= c!30486 e!112788)))

(declare-fun res!81188 () Bool)

(assert (=> d!51627 (=> (not res!81188) (not e!112788))))

(assert (=> d!51627 (= res!81188 (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> d!51627 (= lt!84953 e!112785)))

(declare-fun c!30490 () Bool)

(assert (=> d!51627 (= c!30490 (and (not (= (bvand (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!51627 (validMask!0 (mask!8381 thiss!1248))))

(assert (=> d!51627 (= (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) lt!84962)))

(declare-fun b!170831 () Bool)

(declare-fun e!112777 () ListLongMap!2151)

(assert (=> b!170831 (= e!112777 call!17384)))

(declare-fun b!170837 () Bool)

(declare-fun lt!84951 () Unit!5227)

(assert (=> b!170837 (= e!112786 lt!84951)))

(declare-fun lt!84960 () ListLongMap!2151)

(assert (=> b!170837 (= lt!84960 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!84945 () (_ BitVec 64))

(assert (=> b!170837 (= lt!84945 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!84949 () (_ BitVec 64))

(assert (=> b!170837 (= lt!84949 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!84952 () Unit!5227)

(declare-fun addStillContains!105 (ListLongMap!2151 (_ BitVec 64) V!4985 (_ BitVec 64)) Unit!5227)

(assert (=> b!170837 (= lt!84952 (addStillContains!105 lt!84960 lt!84945 v!309 lt!84949))))

(assert (=> b!170837 (contains!1142 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309)) lt!84949)))

(declare-fun lt!84957 () Unit!5227)

(assert (=> b!170837 (= lt!84957 lt!84952)))

(declare-fun lt!84942 () ListLongMap!2151)

(assert (=> b!170837 (= lt!84942 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!84963 () (_ BitVec 64))

(assert (=> b!170837 (= lt!84963 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!84954 () (_ BitVec 64))

(assert (=> b!170837 (= lt!84954 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!84956 () Unit!5227)

(declare-fun addApplyDifferent!105 (ListLongMap!2151 (_ BitVec 64) V!4985 (_ BitVec 64)) Unit!5227)

(assert (=> b!170837 (= lt!84956 (addApplyDifferent!105 lt!84942 lt!84963 (minValue!3397 thiss!1248) lt!84954))))

(assert (=> b!170837 (= (apply!129 (+!238 lt!84942 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))) lt!84954) (apply!129 lt!84942 lt!84954))))

(declare-fun lt!84959 () Unit!5227)

(assert (=> b!170837 (= lt!84959 lt!84956)))

(declare-fun lt!84947 () ListLongMap!2151)

(assert (=> b!170837 (= lt!84947 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!84944 () (_ BitVec 64))

(assert (=> b!170837 (= lt!84944 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!84961 () (_ BitVec 64))

(assert (=> b!170837 (= lt!84961 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!84955 () Unit!5227)

(assert (=> b!170837 (= lt!84955 (addApplyDifferent!105 lt!84947 lt!84944 v!309 lt!84961))))

(assert (=> b!170837 (= (apply!129 (+!238 lt!84947 (tuple2!3233 lt!84944 v!309)) lt!84961) (apply!129 lt!84947 lt!84961))))

(declare-fun lt!84950 () Unit!5227)

(assert (=> b!170837 (= lt!84950 lt!84955)))

(declare-fun lt!84948 () ListLongMap!2151)

(assert (=> b!170837 (= lt!84948 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!84946 () (_ BitVec 64))

(assert (=> b!170837 (= lt!84946 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!84943 () (_ BitVec 64))

(assert (=> b!170837 (= lt!84943 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170837 (= lt!84951 (addApplyDifferent!105 lt!84948 lt!84946 (minValue!3397 thiss!1248) lt!84943))))

(assert (=> b!170837 (= (apply!129 (+!238 lt!84948 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))) lt!84943) (apply!129 lt!84948 lt!84943))))

(declare-fun b!170838 () Bool)

(assert (=> b!170838 (= e!112785 e!112789)))

(declare-fun c!30488 () Bool)

(assert (=> b!170838 (= c!30488 (and (not (= (bvand (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!170839 () Bool)

(declare-fun e!112778 () Bool)

(assert (=> b!170839 (= e!112782 e!112778)))

(declare-fun res!81193 () Bool)

(assert (=> b!170839 (= res!81193 call!17381)))

(assert (=> b!170839 (=> (not res!81193) (not e!112778))))

(declare-fun bm!17381 () Bool)

(assert (=> bm!17381 (= call!17385 call!17382)))

(declare-fun bm!17382 () Bool)

(assert (=> bm!17382 (= call!17382 (+!238 (ite c!30490 call!17383 (ite c!30488 call!17380 call!17384)) (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!170840 () Bool)

(declare-fun e!112783 () Bool)

(assert (=> b!170840 (= e!112783 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170841 () Bool)

(assert (=> b!170841 (= e!112778 (= (apply!129 lt!84962 #b0000000000000000000000000000000000000000000000000000000000000000) v!309))))

(declare-fun b!170842 () Bool)

(declare-fun res!81190 () Bool)

(assert (=> b!170842 (=> (not res!81190) (not e!112784))))

(declare-fun e!112787 () Bool)

(assert (=> b!170842 (= res!81190 e!112787)))

(declare-fun res!81194 () Bool)

(assert (=> b!170842 (=> res!81194 e!112787)))

(assert (=> b!170842 (= res!81194 (not e!112783))))

(declare-fun res!81196 () Bool)

(assert (=> b!170842 (=> (not res!81196) (not e!112783))))

(assert (=> b!170842 (= res!81196 (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun b!170843 () Bool)

(declare-fun c!30487 () Bool)

(assert (=> b!170843 (= c!30487 (and (not (= (bvand (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!170843 (= e!112789 e!112777)))

(declare-fun bm!17383 () Bool)

(assert (=> bm!17383 (= call!17380 call!17383)))

(declare-fun b!170844 () Bool)

(assert (=> b!170844 (= e!112787 e!112779)))

(declare-fun res!81192 () Bool)

(assert (=> b!170844 (=> (not res!81192) (not e!112779))))

(assert (=> b!170844 (= res!81192 (contains!1142 lt!84962 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!170844 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun b!170845 () Bool)

(assert (=> b!170845 (= e!112777 call!17385)))

(declare-fun b!170846 () Bool)

(declare-fun Unit!5232 () Unit!5227)

(assert (=> b!170846 (= e!112786 Unit!5232)))

(assert (= (and d!51627 c!30490) b!170828))

(assert (= (and d!51627 (not c!30490)) b!170838))

(assert (= (and b!170838 c!30488) b!170826))

(assert (= (and b!170838 (not c!30488)) b!170843))

(assert (= (and b!170843 c!30487) b!170845))

(assert (= (and b!170843 (not c!30487)) b!170831))

(assert (= (or b!170845 b!170831) bm!17377))

(assert (= (or b!170826 bm!17377) bm!17383))

(assert (= (or b!170826 b!170845) bm!17381))

(assert (= (or b!170828 bm!17383) bm!17380))

(assert (= (or b!170828 bm!17381) bm!17382))

(assert (= (and d!51627 res!81188) b!170829))

(assert (= (and d!51627 c!30486) b!170837))

(assert (= (and d!51627 (not c!30486)) b!170846))

(assert (= (and d!51627 res!81195) b!170842))

(assert (= (and b!170842 res!81196) b!170840))

(assert (= (and b!170842 (not res!81194)) b!170844))

(assert (= (and b!170844 res!81192) b!170832))

(assert (= (and b!170842 res!81190) b!170827))

(assert (= (and b!170827 c!30491) b!170839))

(assert (= (and b!170827 (not c!30491)) b!170836))

(assert (= (and b!170839 res!81193) b!170841))

(assert (= (or b!170839 b!170836) bm!17378))

(assert (= (and b!170827 res!81191) b!170833))

(assert (= (and b!170833 c!30489) b!170835))

(assert (= (and b!170833 (not c!30489)) b!170834))

(assert (= (and b!170835 res!81189) b!170830))

(assert (= (or b!170835 b!170834) bm!17379))

(declare-fun b_lambda!6869 () Bool)

(assert (=> (not b_lambda!6869) (not b!170832)))

(declare-fun t!6999 () Bool)

(declare-fun tb!2757 () Bool)

(assert (=> (and b!170714 (= (defaultEntry!3554 thiss!1248) (defaultEntry!3554 thiss!1248)) t!6999) tb!2757))

(declare-fun result!4553 () Bool)

(assert (=> tb!2757 (= result!4553 tp_is_empty!4003)))

(assert (=> b!170832 t!6999))

(declare-fun b_and!10625 () Bool)

(assert (= b_and!10619 (and (=> t!6999 result!4553) b_and!10625)))

(declare-fun m!198643 () Bool)

(assert (=> b!170829 m!198643))

(assert (=> b!170829 m!198643))

(declare-fun m!198645 () Bool)

(assert (=> b!170829 m!198645))

(declare-fun m!198647 () Bool)

(assert (=> bm!17379 m!198647))

(declare-fun m!198649 () Bool)

(assert (=> bm!17380 m!198649))

(declare-fun m!198651 () Bool)

(assert (=> b!170828 m!198651))

(declare-fun m!198653 () Bool)

(assert (=> b!170832 m!198653))

(assert (=> b!170832 m!198643))

(assert (=> b!170832 m!198653))

(declare-fun m!198655 () Bool)

(assert (=> b!170832 m!198655))

(declare-fun m!198657 () Bool)

(assert (=> b!170832 m!198657))

(assert (=> b!170832 m!198643))

(declare-fun m!198659 () Bool)

(assert (=> b!170832 m!198659))

(assert (=> b!170832 m!198655))

(assert (=> b!170840 m!198643))

(assert (=> b!170840 m!198643))

(assert (=> b!170840 m!198645))

(assert (=> b!170844 m!198643))

(assert (=> b!170844 m!198643))

(declare-fun m!198661 () Bool)

(assert (=> b!170844 m!198661))

(declare-fun m!198663 () Bool)

(assert (=> b!170830 m!198663))

(declare-fun m!198665 () Bool)

(assert (=> bm!17378 m!198665))

(declare-fun m!198667 () Bool)

(assert (=> d!51627 m!198667))

(declare-fun m!198669 () Bool)

(assert (=> bm!17382 m!198669))

(declare-fun m!198671 () Bool)

(assert (=> b!170841 m!198671))

(declare-fun m!198673 () Bool)

(assert (=> b!170837 m!198673))

(declare-fun m!198675 () Bool)

(assert (=> b!170837 m!198675))

(assert (=> b!170837 m!198649))

(declare-fun m!198677 () Bool)

(assert (=> b!170837 m!198677))

(declare-fun m!198679 () Bool)

(assert (=> b!170837 m!198679))

(declare-fun m!198681 () Bool)

(assert (=> b!170837 m!198681))

(declare-fun m!198683 () Bool)

(assert (=> b!170837 m!198683))

(assert (=> b!170837 m!198677))

(declare-fun m!198685 () Bool)

(assert (=> b!170837 m!198685))

(assert (=> b!170837 m!198643))

(declare-fun m!198687 () Bool)

(assert (=> b!170837 m!198687))

(declare-fun m!198689 () Bool)

(assert (=> b!170837 m!198689))

(declare-fun m!198691 () Bool)

(assert (=> b!170837 m!198691))

(declare-fun m!198693 () Bool)

(assert (=> b!170837 m!198693))

(declare-fun m!198695 () Bool)

(assert (=> b!170837 m!198695))

(declare-fun m!198697 () Bool)

(assert (=> b!170837 m!198697))

(declare-fun m!198699 () Bool)

(assert (=> b!170837 m!198699))

(assert (=> b!170837 m!198679))

(declare-fun m!198701 () Bool)

(assert (=> b!170837 m!198701))

(assert (=> b!170837 m!198693))

(assert (=> b!170837 m!198697))

(assert (=> b!170720 d!51627))

(declare-fun d!51629 () Bool)

(assert (=> d!51629 (= (+!238 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!84966 () Unit!5227)

(declare-fun choose!929 (array!7099 array!7101 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!4985 V!4985 V!4985 Int) Unit!5227)

(assert (=> d!51629 (= lt!84966 (choose!929 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) (zeroValue!3397 thiss!1248) v!309 (minValue!3397 thiss!1248) (defaultEntry!3554 thiss!1248)))))

(assert (=> d!51629 (validMask!0 (mask!8381 thiss!1248))))

(assert (=> d!51629 (= (lemmaChangeZeroKeyThenAddPairToListMap!81 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) (zeroValue!3397 thiss!1248) v!309 (minValue!3397 thiss!1248) (defaultEntry!3554 thiss!1248)) lt!84966)))

(declare-fun bs!7024 () Bool)

(assert (= bs!7024 d!51629))

(assert (=> bs!7024 m!198553))

(assert (=> bs!7024 m!198667))

(assert (=> bs!7024 m!198549))

(assert (=> bs!7024 m!198549))

(assert (=> bs!7024 m!198557))

(declare-fun m!198703 () Bool)

(assert (=> bs!7024 m!198703))

(assert (=> b!170720 d!51629))

(declare-fun d!51631 () Bool)

(declare-fun res!81203 () Bool)

(declare-fun e!112792 () Bool)

(assert (=> d!51631 (=> (not res!81203) (not e!112792))))

(declare-fun simpleValid!135 (LongMapFixedSize!2224) Bool)

(assert (=> d!51631 (= res!81203 (simpleValid!135 lt!84854))))

(assert (=> d!51631 (= (valid!966 lt!84854) e!112792)))

(declare-fun b!170855 () Bool)

(declare-fun res!81204 () Bool)

(assert (=> b!170855 (=> (not res!81204) (not e!112792))))

(declare-fun arrayCountValidKeys!0 (array!7099 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170855 (= res!81204 (= (arrayCountValidKeys!0 (_keys!5385 lt!84854) #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))) (_size!1161 lt!84854)))))

(declare-fun b!170856 () Bool)

(declare-fun res!81205 () Bool)

(assert (=> b!170856 (=> (not res!81205) (not e!112792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7099 (_ BitVec 32)) Bool)

(assert (=> b!170856 (= res!81205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5385 lt!84854) (mask!8381 lt!84854)))))

(declare-fun b!170857 () Bool)

(declare-datatypes ((List!2205 0))(
  ( (Nil!2202) (Cons!2201 (h!2818 (_ BitVec 64)) (t!7000 List!2205)) )
))
(declare-fun arrayNoDuplicates!0 (array!7099 (_ BitVec 32) List!2205) Bool)

(assert (=> b!170857 (= e!112792 (arrayNoDuplicates!0 (_keys!5385 lt!84854) #b00000000000000000000000000000000 Nil!2202))))

(assert (= (and d!51631 res!81203) b!170855))

(assert (= (and b!170855 res!81204) b!170856))

(assert (= (and b!170856 res!81205) b!170857))

(declare-fun m!198705 () Bool)

(assert (=> d!51631 m!198705))

(declare-fun m!198707 () Bool)

(assert (=> b!170855 m!198707))

(declare-fun m!198709 () Bool)

(assert (=> b!170856 m!198709))

(declare-fun m!198711 () Bool)

(assert (=> b!170857 m!198711))

(assert (=> b!170720 d!51631))

(declare-fun b!170858 () Bool)

(declare-fun e!112805 () ListLongMap!2151)

(declare-fun call!17392 () ListLongMap!2151)

(assert (=> b!170858 (= e!112805 call!17392)))

(declare-fun b!170859 () Bool)

(declare-fun res!81209 () Bool)

(declare-fun e!112800 () Bool)

(assert (=> b!170859 (=> (not res!81209) (not e!112800))))

(declare-fun e!112798 () Bool)

(assert (=> b!170859 (= res!81209 e!112798)))

(declare-fun c!30497 () Bool)

(assert (=> b!170859 (= c!30497 (not (= (bvand (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!170860 () Bool)

(declare-fun e!112801 () ListLongMap!2151)

(declare-fun call!17389 () ListLongMap!2151)

(assert (=> b!170860 (= e!112801 (+!238 call!17389 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(declare-fun b!170861 () Bool)

(declare-fun e!112804 () Bool)

(assert (=> b!170861 (= e!112804 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170862 () Bool)

(declare-fun e!112797 () Bool)

(declare-fun lt!84987 () ListLongMap!2151)

(assert (=> b!170862 (= e!112797 (= (apply!129 lt!84987 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3397 thiss!1248)))))

(declare-fun b!170864 () Bool)

(declare-fun e!112795 () Bool)

(assert (=> b!170864 (= e!112795 (= (apply!129 lt!84987 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!170864 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3671 (_values!3537 thiss!1248))))))

(assert (=> b!170864 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun bm!17384 () Bool)

(declare-fun call!17391 () ListLongMap!2151)

(declare-fun call!17387 () ListLongMap!2151)

(assert (=> bm!17384 (= call!17391 call!17387)))

(declare-fun bm!17385 () Bool)

(declare-fun call!17388 () Bool)

(assert (=> bm!17385 (= call!17388 (contains!1142 lt!84987 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!170865 () Bool)

(declare-fun e!112796 () Bool)

(assert (=> b!170865 (= e!112800 e!112796)))

(declare-fun c!30495 () Bool)

(assert (=> b!170865 (= c!30495 (not (= (bvand (extraKeys!3295 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!170866 () Bool)

(declare-fun call!17393 () Bool)

(assert (=> b!170866 (= e!112796 (not call!17393))))

(declare-fun b!170867 () Bool)

(assert (=> b!170867 (= e!112796 e!112797)))

(declare-fun res!81207 () Bool)

(assert (=> b!170867 (= res!81207 call!17393)))

(assert (=> b!170867 (=> (not res!81207) (not e!112797))))

(declare-fun b!170868 () Bool)

(assert (=> b!170868 (= e!112798 (not call!17388))))

(declare-fun bm!17386 () Bool)

(assert (=> bm!17386 (= call!17393 (contains!1142 lt!84987 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17387 () Bool)

(declare-fun call!17390 () ListLongMap!2151)

(assert (=> bm!17387 (= call!17390 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun d!51633 () Bool)

(assert (=> d!51633 e!112800))

(declare-fun res!81213 () Bool)

(assert (=> d!51633 (=> (not res!81213) (not e!112800))))

(assert (=> d!51633 (= res!81213 (or (bvsge #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))))

(declare-fun lt!84978 () ListLongMap!2151)

(assert (=> d!51633 (= lt!84987 lt!84978)))

(declare-fun lt!84983 () Unit!5227)

(declare-fun e!112802 () Unit!5227)

(assert (=> d!51633 (= lt!84983 e!112802)))

(declare-fun c!30492 () Bool)

(assert (=> d!51633 (= c!30492 e!112804)))

(declare-fun res!81206 () Bool)

(assert (=> d!51633 (=> (not res!81206) (not e!112804))))

(assert (=> d!51633 (= res!81206 (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> d!51633 (= lt!84978 e!112801)))

(declare-fun c!30496 () Bool)

(assert (=> d!51633 (= c!30496 (and (not (= (bvand (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3295 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!51633 (validMask!0 (mask!8381 thiss!1248))))

(assert (=> d!51633 (= (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) lt!84987)))

(declare-fun b!170863 () Bool)

(declare-fun e!112793 () ListLongMap!2151)

(assert (=> b!170863 (= e!112793 call!17391)))

(declare-fun b!170869 () Bool)

(declare-fun lt!84976 () Unit!5227)

(assert (=> b!170869 (= e!112802 lt!84976)))

(declare-fun lt!84985 () ListLongMap!2151)

(assert (=> b!170869 (= lt!84985 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!84970 () (_ BitVec 64))

(assert (=> b!170869 (= lt!84970 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!84974 () (_ BitVec 64))

(assert (=> b!170869 (= lt!84974 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!84977 () Unit!5227)

(assert (=> b!170869 (= lt!84977 (addStillContains!105 lt!84985 lt!84970 (zeroValue!3397 thiss!1248) lt!84974))))

(assert (=> b!170869 (contains!1142 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))) lt!84974)))

(declare-fun lt!84982 () Unit!5227)

(assert (=> b!170869 (= lt!84982 lt!84977)))

(declare-fun lt!84967 () ListLongMap!2151)

(assert (=> b!170869 (= lt!84967 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!84988 () (_ BitVec 64))

(assert (=> b!170869 (= lt!84988 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!84979 () (_ BitVec 64))

(assert (=> b!170869 (= lt!84979 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!84981 () Unit!5227)

(assert (=> b!170869 (= lt!84981 (addApplyDifferent!105 lt!84967 lt!84988 (minValue!3397 thiss!1248) lt!84979))))

(assert (=> b!170869 (= (apply!129 (+!238 lt!84967 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))) lt!84979) (apply!129 lt!84967 lt!84979))))

(declare-fun lt!84984 () Unit!5227)

(assert (=> b!170869 (= lt!84984 lt!84981)))

(declare-fun lt!84972 () ListLongMap!2151)

(assert (=> b!170869 (= lt!84972 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!84969 () (_ BitVec 64))

(assert (=> b!170869 (= lt!84969 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!84986 () (_ BitVec 64))

(assert (=> b!170869 (= lt!84986 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!84980 () Unit!5227)

(assert (=> b!170869 (= lt!84980 (addApplyDifferent!105 lt!84972 lt!84969 (zeroValue!3397 thiss!1248) lt!84986))))

(assert (=> b!170869 (= (apply!129 (+!238 lt!84972 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))) lt!84986) (apply!129 lt!84972 lt!84986))))

(declare-fun lt!84975 () Unit!5227)

(assert (=> b!170869 (= lt!84975 lt!84980)))

(declare-fun lt!84973 () ListLongMap!2151)

(assert (=> b!170869 (= lt!84973 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!84971 () (_ BitVec 64))

(assert (=> b!170869 (= lt!84971 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!84968 () (_ BitVec 64))

(assert (=> b!170869 (= lt!84968 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170869 (= lt!84976 (addApplyDifferent!105 lt!84973 lt!84971 (minValue!3397 thiss!1248) lt!84968))))

(assert (=> b!170869 (= (apply!129 (+!238 lt!84973 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))) lt!84968) (apply!129 lt!84973 lt!84968))))

(declare-fun b!170870 () Bool)

(assert (=> b!170870 (= e!112801 e!112805)))

(declare-fun c!30494 () Bool)

(assert (=> b!170870 (= c!30494 (and (not (= (bvand (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3295 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!170871 () Bool)

(declare-fun e!112794 () Bool)

(assert (=> b!170871 (= e!112798 e!112794)))

(declare-fun res!81211 () Bool)

(assert (=> b!170871 (= res!81211 call!17388)))

(assert (=> b!170871 (=> (not res!81211) (not e!112794))))

(declare-fun bm!17388 () Bool)

(assert (=> bm!17388 (= call!17392 call!17389)))

(declare-fun bm!17389 () Bool)

(assert (=> bm!17389 (= call!17389 (+!238 (ite c!30496 call!17390 (ite c!30494 call!17387 call!17391)) (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!170872 () Bool)

(declare-fun e!112799 () Bool)

(assert (=> b!170872 (= e!112799 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170873 () Bool)

(assert (=> b!170873 (= e!112794 (= (apply!129 lt!84987 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3397 thiss!1248)))))

(declare-fun b!170874 () Bool)

(declare-fun res!81208 () Bool)

(assert (=> b!170874 (=> (not res!81208) (not e!112800))))

(declare-fun e!112803 () Bool)

(assert (=> b!170874 (= res!81208 e!112803)))

(declare-fun res!81212 () Bool)

(assert (=> b!170874 (=> res!81212 e!112803)))

(assert (=> b!170874 (= res!81212 (not e!112799))))

(declare-fun res!81214 () Bool)

(assert (=> b!170874 (=> (not res!81214) (not e!112799))))

(assert (=> b!170874 (= res!81214 (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun b!170875 () Bool)

(declare-fun c!30493 () Bool)

(assert (=> b!170875 (= c!30493 (and (not (= (bvand (extraKeys!3295 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!170875 (= e!112805 e!112793)))

(declare-fun bm!17390 () Bool)

(assert (=> bm!17390 (= call!17387 call!17390)))

(declare-fun b!170876 () Bool)

(assert (=> b!170876 (= e!112803 e!112795)))

(declare-fun res!81210 () Bool)

(assert (=> b!170876 (=> (not res!81210) (not e!112795))))

(assert (=> b!170876 (= res!81210 (contains!1142 lt!84987 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!170876 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun b!170877 () Bool)

(assert (=> b!170877 (= e!112793 call!17392)))

(declare-fun b!170878 () Bool)

(declare-fun Unit!5233 () Unit!5227)

(assert (=> b!170878 (= e!112802 Unit!5233)))

(assert (= (and d!51633 c!30496) b!170860))

(assert (= (and d!51633 (not c!30496)) b!170870))

(assert (= (and b!170870 c!30494) b!170858))

(assert (= (and b!170870 (not c!30494)) b!170875))

(assert (= (and b!170875 c!30493) b!170877))

(assert (= (and b!170875 (not c!30493)) b!170863))

(assert (= (or b!170877 b!170863) bm!17384))

(assert (= (or b!170858 bm!17384) bm!17390))

(assert (= (or b!170858 b!170877) bm!17388))

(assert (= (or b!170860 bm!17390) bm!17387))

(assert (= (or b!170860 bm!17388) bm!17389))

(assert (= (and d!51633 res!81206) b!170861))

(assert (= (and d!51633 c!30492) b!170869))

(assert (= (and d!51633 (not c!30492)) b!170878))

(assert (= (and d!51633 res!81213) b!170874))

(assert (= (and b!170874 res!81214) b!170872))

(assert (= (and b!170874 (not res!81212)) b!170876))

(assert (= (and b!170876 res!81210) b!170864))

(assert (= (and b!170874 res!81208) b!170859))

(assert (= (and b!170859 c!30497) b!170871))

(assert (= (and b!170859 (not c!30497)) b!170868))

(assert (= (and b!170871 res!81211) b!170873))

(assert (= (or b!170871 b!170868) bm!17385))

(assert (= (and b!170859 res!81209) b!170865))

(assert (= (and b!170865 c!30495) b!170867))

(assert (= (and b!170865 (not c!30495)) b!170866))

(assert (= (and b!170867 res!81207) b!170862))

(assert (= (or b!170867 b!170866) bm!17386))

(declare-fun b_lambda!6871 () Bool)

(assert (=> (not b_lambda!6871) (not b!170864)))

(assert (=> b!170864 t!6999))

(declare-fun b_and!10627 () Bool)

(assert (= b_and!10625 (and (=> t!6999 result!4553) b_and!10627)))

(assert (=> b!170861 m!198643))

(assert (=> b!170861 m!198643))

(assert (=> b!170861 m!198645))

(declare-fun m!198713 () Bool)

(assert (=> bm!17386 m!198713))

(declare-fun m!198715 () Bool)

(assert (=> bm!17387 m!198715))

(declare-fun m!198717 () Bool)

(assert (=> b!170860 m!198717))

(assert (=> b!170864 m!198653))

(assert (=> b!170864 m!198643))

(assert (=> b!170864 m!198653))

(assert (=> b!170864 m!198655))

(assert (=> b!170864 m!198657))

(assert (=> b!170864 m!198643))

(declare-fun m!198719 () Bool)

(assert (=> b!170864 m!198719))

(assert (=> b!170864 m!198655))

(assert (=> b!170872 m!198643))

(assert (=> b!170872 m!198643))

(assert (=> b!170872 m!198645))

(assert (=> b!170876 m!198643))

(assert (=> b!170876 m!198643))

(declare-fun m!198721 () Bool)

(assert (=> b!170876 m!198721))

(declare-fun m!198723 () Bool)

(assert (=> b!170862 m!198723))

(declare-fun m!198725 () Bool)

(assert (=> bm!17385 m!198725))

(assert (=> d!51633 m!198667))

(declare-fun m!198727 () Bool)

(assert (=> bm!17389 m!198727))

(declare-fun m!198729 () Bool)

(assert (=> b!170873 m!198729))

(declare-fun m!198731 () Bool)

(assert (=> b!170869 m!198731))

(declare-fun m!198733 () Bool)

(assert (=> b!170869 m!198733))

(assert (=> b!170869 m!198715))

(declare-fun m!198735 () Bool)

(assert (=> b!170869 m!198735))

(declare-fun m!198737 () Bool)

(assert (=> b!170869 m!198737))

(declare-fun m!198739 () Bool)

(assert (=> b!170869 m!198739))

(declare-fun m!198741 () Bool)

(assert (=> b!170869 m!198741))

(assert (=> b!170869 m!198735))

(declare-fun m!198743 () Bool)

(assert (=> b!170869 m!198743))

(assert (=> b!170869 m!198643))

(declare-fun m!198745 () Bool)

(assert (=> b!170869 m!198745))

(declare-fun m!198747 () Bool)

(assert (=> b!170869 m!198747))

(declare-fun m!198749 () Bool)

(assert (=> b!170869 m!198749))

(declare-fun m!198751 () Bool)

(assert (=> b!170869 m!198751))

(declare-fun m!198753 () Bool)

(assert (=> b!170869 m!198753))

(declare-fun m!198755 () Bool)

(assert (=> b!170869 m!198755))

(declare-fun m!198757 () Bool)

(assert (=> b!170869 m!198757))

(assert (=> b!170869 m!198737))

(declare-fun m!198759 () Bool)

(assert (=> b!170869 m!198759))

(assert (=> b!170869 m!198751))

(assert (=> b!170869 m!198755))

(assert (=> b!170720 d!51633))

(declare-fun d!51635 () Bool)

(declare-fun e!112806 () Bool)

(assert (=> d!51635 e!112806))

(declare-fun res!81216 () Bool)

(assert (=> d!51635 (=> (not res!81216) (not e!112806))))

(declare-fun lt!84992 () ListLongMap!2151)

(assert (=> d!51635 (= res!81216 (contains!1142 lt!84992 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!84990 () List!2203)

(assert (=> d!51635 (= lt!84992 (ListLongMap!2152 lt!84990))))

(declare-fun lt!84991 () Unit!5227)

(declare-fun lt!84989 () Unit!5227)

(assert (=> d!51635 (= lt!84991 lt!84989)))

(assert (=> d!51635 (= (getValueByKey!182 lt!84990 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!187 (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!51635 (= lt!84989 (lemmaContainsTupThenGetReturnValue!98 lt!84990 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!51635 (= lt!84990 (insertStrictlySorted!101 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!51635 (= (+!238 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!84992)))

(declare-fun b!170879 () Bool)

(declare-fun res!81215 () Bool)

(assert (=> b!170879 (=> (not res!81215) (not e!112806))))

(assert (=> b!170879 (= res!81215 (= (getValueByKey!182 (toList!1091 lt!84992) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!187 (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!170880 () Bool)

(assert (=> b!170880 (= e!112806 (contains!1144 (toList!1091 lt!84992) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!51635 res!81216) b!170879))

(assert (= (and b!170879 res!81215) b!170880))

(declare-fun m!198761 () Bool)

(assert (=> d!51635 m!198761))

(declare-fun m!198763 () Bool)

(assert (=> d!51635 m!198763))

(declare-fun m!198765 () Bool)

(assert (=> d!51635 m!198765))

(declare-fun m!198767 () Bool)

(assert (=> d!51635 m!198767))

(declare-fun m!198769 () Bool)

(assert (=> b!170879 m!198769))

(declare-fun m!198771 () Bool)

(assert (=> b!170880 m!198771))

(assert (=> b!170720 d!51635))

(declare-fun d!51637 () Bool)

(declare-fun res!81217 () Bool)

(declare-fun e!112807 () Bool)

(assert (=> d!51637 (=> (not res!81217) (not e!112807))))

(assert (=> d!51637 (= res!81217 (simpleValid!135 thiss!1248))))

(assert (=> d!51637 (= (valid!966 thiss!1248) e!112807)))

(declare-fun b!170881 () Bool)

(declare-fun res!81218 () Bool)

(assert (=> b!170881 (=> (not res!81218) (not e!112807))))

(assert (=> b!170881 (= res!81218 (= (arrayCountValidKeys!0 (_keys!5385 thiss!1248) #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))) (_size!1161 thiss!1248)))))

(declare-fun b!170882 () Bool)

(declare-fun res!81219 () Bool)

(assert (=> b!170882 (=> (not res!81219) (not e!112807))))

(assert (=> b!170882 (= res!81219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5385 thiss!1248) (mask!8381 thiss!1248)))))

(declare-fun b!170883 () Bool)

(assert (=> b!170883 (= e!112807 (arrayNoDuplicates!0 (_keys!5385 thiss!1248) #b00000000000000000000000000000000 Nil!2202))))

(assert (= (and d!51637 res!81217) b!170881))

(assert (= (and b!170881 res!81218) b!170882))

(assert (= (and b!170882 res!81219) b!170883))

(declare-fun m!198773 () Bool)

(assert (=> d!51637 m!198773))

(declare-fun m!198775 () Bool)

(assert (=> b!170881 m!198775))

(declare-fun m!198777 () Bool)

(assert (=> b!170882 m!198777))

(declare-fun m!198779 () Bool)

(assert (=> b!170883 m!198779))

(assert (=> start!17010 d!51637))

(declare-fun d!51639 () Bool)

(assert (=> d!51639 (= (array_inv!2177 (_keys!5385 thiss!1248)) (bvsge (size!3670 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170714 d!51639))

(declare-fun d!51641 () Bool)

(assert (=> d!51641 (= (array_inv!2178 (_values!3537 thiss!1248)) (bvsge (size!3671 (_values!3537 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170714 d!51641))

(declare-fun mapNonEmpty!6806 () Bool)

(declare-fun mapRes!6806 () Bool)

(declare-fun tp!15338 () Bool)

(declare-fun e!112813 () Bool)

(assert (=> mapNonEmpty!6806 (= mapRes!6806 (and tp!15338 e!112813))))

(declare-fun mapValue!6806 () ValueCell!1658)

(declare-fun mapRest!6806 () (Array (_ BitVec 32) ValueCell!1658))

(declare-fun mapKey!6806 () (_ BitVec 32))

(assert (=> mapNonEmpty!6806 (= mapRest!6797 (store mapRest!6806 mapKey!6806 mapValue!6806))))

(declare-fun condMapEmpty!6806 () Bool)

(declare-fun mapDefault!6806 () ValueCell!1658)

(assert (=> mapNonEmpty!6797 (= condMapEmpty!6806 (= mapRest!6797 ((as const (Array (_ BitVec 32) ValueCell!1658)) mapDefault!6806)))))

(declare-fun e!112812 () Bool)

(assert (=> mapNonEmpty!6797 (= tp!15323 (and e!112812 mapRes!6806))))

(declare-fun mapIsEmpty!6806 () Bool)

(assert (=> mapIsEmpty!6806 mapRes!6806))

(declare-fun b!170891 () Bool)

(assert (=> b!170891 (= e!112812 tp_is_empty!4003)))

(declare-fun b!170890 () Bool)

(assert (=> b!170890 (= e!112813 tp_is_empty!4003)))

(assert (= (and mapNonEmpty!6797 condMapEmpty!6806) mapIsEmpty!6806))

(assert (= (and mapNonEmpty!6797 (not condMapEmpty!6806)) mapNonEmpty!6806))

(assert (= (and mapNonEmpty!6806 ((_ is ValueCellFull!1658) mapValue!6806)) b!170890))

(assert (= (and mapNonEmpty!6797 ((_ is ValueCellFull!1658) mapDefault!6806)) b!170891))

(declare-fun m!198781 () Bool)

(assert (=> mapNonEmpty!6806 m!198781))

(declare-fun b_lambda!6873 () Bool)

(assert (= b_lambda!6871 (or (and b!170714 b_free!4231) b_lambda!6873)))

(declare-fun b_lambda!6875 () Bool)

(assert (= b_lambda!6869 (or (and b!170714 b_free!4231) b_lambda!6875)))

(check-sat (not b!170876) (not b!170860) (not bm!17385) (not bm!17387) (not b_lambda!6875) (not d!51631) (not b!170872) (not b!170873) (not b!170864) (not bm!17379) (not b!170841) (not b!170828) (not bm!17380) (not d!51633) (not b!170775) (not b!170857) (not d!51619) (not b!170855) (not b!170837) (not b!170881) tp_is_empty!4003 b_and!10627 (not b!170830) (not b!170880) (not b!170832) (not b!170783) (not bm!17382) (not b_next!4231) (not bm!17386) (not b!170777) (not mapNonEmpty!6806) (not b!170879) (not b!170882) (not d!51637) (not bm!17389) (not b!170861) (not d!51635) (not b_lambda!6873) (not b!170869) (not b!170829) (not d!51629) (not d!51623) (not b!170856) (not d!51627) (not b!170883) (not b!170840) (not b!170782) (not bm!17378) (not b!170844) (not d!51621) (not b!170862) (not d!51625))
(check-sat b_and!10627 (not b_next!4231))
(get-model)

(declare-fun d!51643 () Bool)

(declare-fun e!112815 () Bool)

(assert (=> d!51643 e!112815))

(declare-fun res!81220 () Bool)

(assert (=> d!51643 (=> res!81220 e!112815)))

(declare-fun lt!84996 () Bool)

(assert (=> d!51643 (= res!81220 (not lt!84996))))

(declare-fun lt!84994 () Bool)

(assert (=> d!51643 (= lt!84996 lt!84994)))

(declare-fun lt!84993 () Unit!5227)

(declare-fun e!112814 () Unit!5227)

(assert (=> d!51643 (= lt!84993 e!112814)))

(declare-fun c!30498 () Bool)

(assert (=> d!51643 (= c!30498 lt!84994)))

(assert (=> d!51643 (= lt!84994 (containsKey!186 (toList!1091 lt!84962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!51643 (= (contains!1142 lt!84962 #b0000000000000000000000000000000000000000000000000000000000000000) lt!84996)))

(declare-fun b!170892 () Bool)

(declare-fun lt!84995 () Unit!5227)

(assert (=> b!170892 (= e!112814 lt!84995)))

(assert (=> b!170892 (= lt!84995 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!170892 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!170893 () Bool)

(declare-fun Unit!5234 () Unit!5227)

(assert (=> b!170893 (= e!112814 Unit!5234)))

(declare-fun b!170894 () Bool)

(assert (=> b!170894 (= e!112815 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84962) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51643 c!30498) b!170892))

(assert (= (and d!51643 (not c!30498)) b!170893))

(assert (= (and d!51643 (not res!81220)) b!170894))

(declare-fun m!198783 () Bool)

(assert (=> d!51643 m!198783))

(declare-fun m!198785 () Bool)

(assert (=> b!170892 m!198785))

(declare-fun m!198787 () Bool)

(assert (=> b!170892 m!198787))

(assert (=> b!170892 m!198787))

(declare-fun m!198789 () Bool)

(assert (=> b!170892 m!198789))

(assert (=> b!170894 m!198787))

(assert (=> b!170894 m!198787))

(assert (=> b!170894 m!198789))

(assert (=> bm!17378 d!51643))

(declare-fun d!51645 () Bool)

(declare-fun get!1933 (Option!188) V!4985)

(assert (=> d!51645 (= (apply!129 lt!84987 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) (get!1933 (getValueByKey!182 (toList!1091 lt!84987) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7025 () Bool)

(assert (= bs!7025 d!51645))

(assert (=> bs!7025 m!198643))

(declare-fun m!198791 () Bool)

(assert (=> bs!7025 m!198791))

(assert (=> bs!7025 m!198791))

(declare-fun m!198793 () Bool)

(assert (=> bs!7025 m!198793))

(assert (=> b!170864 d!51645))

(declare-fun d!51647 () Bool)

(declare-fun c!30501 () Bool)

(assert (=> d!51647 (= c!30501 ((_ is ValueCellFull!1658) (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!112818 () V!4985)

(assert (=> d!51647 (= (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!112818)))

(declare-fun b!170899 () Bool)

(declare-fun get!1934 (ValueCell!1658 V!4985) V!4985)

(assert (=> b!170899 (= e!112818 (get!1934 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!170900 () Bool)

(declare-fun get!1935 (ValueCell!1658 V!4985) V!4985)

(assert (=> b!170900 (= e!112818 (get!1935 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51647 c!30501) b!170899))

(assert (= (and d!51647 (not c!30501)) b!170900))

(assert (=> b!170899 m!198653))

(assert (=> b!170899 m!198655))

(declare-fun m!198795 () Bool)

(assert (=> b!170899 m!198795))

(assert (=> b!170900 m!198653))

(assert (=> b!170900 m!198655))

(declare-fun m!198797 () Bool)

(assert (=> b!170900 m!198797))

(assert (=> b!170864 d!51647))

(declare-fun d!51649 () Bool)

(assert (=> d!51649 (= (validMask!0 (mask!8381 thiss!1248)) (and (or (= (mask!8381 thiss!1248) #b00000000000000000000000000000111) (= (mask!8381 thiss!1248) #b00000000000000000000000000001111) (= (mask!8381 thiss!1248) #b00000000000000000000000000011111) (= (mask!8381 thiss!1248) #b00000000000000000000000000111111) (= (mask!8381 thiss!1248) #b00000000000000000000000001111111) (= (mask!8381 thiss!1248) #b00000000000000000000000011111111) (= (mask!8381 thiss!1248) #b00000000000000000000000111111111) (= (mask!8381 thiss!1248) #b00000000000000000000001111111111) (= (mask!8381 thiss!1248) #b00000000000000000000011111111111) (= (mask!8381 thiss!1248) #b00000000000000000000111111111111) (= (mask!8381 thiss!1248) #b00000000000000000001111111111111) (= (mask!8381 thiss!1248) #b00000000000000000011111111111111) (= (mask!8381 thiss!1248) #b00000000000000000111111111111111) (= (mask!8381 thiss!1248) #b00000000000000001111111111111111) (= (mask!8381 thiss!1248) #b00000000000000011111111111111111) (= (mask!8381 thiss!1248) #b00000000000000111111111111111111) (= (mask!8381 thiss!1248) #b00000000000001111111111111111111) (= (mask!8381 thiss!1248) #b00000000000011111111111111111111) (= (mask!8381 thiss!1248) #b00000000000111111111111111111111) (= (mask!8381 thiss!1248) #b00000000001111111111111111111111) (= (mask!8381 thiss!1248) #b00000000011111111111111111111111) (= (mask!8381 thiss!1248) #b00000000111111111111111111111111) (= (mask!8381 thiss!1248) #b00000001111111111111111111111111) (= (mask!8381 thiss!1248) #b00000011111111111111111111111111) (= (mask!8381 thiss!1248) #b00000111111111111111111111111111) (= (mask!8381 thiss!1248) #b00001111111111111111111111111111) (= (mask!8381 thiss!1248) #b00011111111111111111111111111111) (= (mask!8381 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8381 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> d!51633 d!51649))

(declare-fun d!51651 () Bool)

(assert (=> d!51651 (= (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!170861 d!51651))

(declare-fun b!170909 () Bool)

(declare-fun e!112826 () Bool)

(declare-fun call!17396 () Bool)

(assert (=> b!170909 (= e!112826 call!17396)))

(declare-fun b!170910 () Bool)

(declare-fun e!112827 () Bool)

(assert (=> b!170910 (= e!112827 call!17396)))

(declare-fun b!170911 () Bool)

(declare-fun e!112825 () Bool)

(assert (=> b!170911 (= e!112825 e!112826)))

(declare-fun c!30504 () Bool)

(assert (=> b!170911 (= c!30504 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51653 () Bool)

(declare-fun res!81225 () Bool)

(assert (=> d!51653 (=> res!81225 e!112825)))

(assert (=> d!51653 (= res!81225 (bvsge #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> d!51653 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5385 thiss!1248) (mask!8381 thiss!1248)) e!112825)))

(declare-fun b!170912 () Bool)

(assert (=> b!170912 (= e!112826 e!112827)))

(declare-fun lt!85005 () (_ BitVec 64))

(assert (=> b!170912 (= lt!85005 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85004 () Unit!5227)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7099 (_ BitVec 64) (_ BitVec 32)) Unit!5227)

(assert (=> b!170912 (= lt!85004 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5385 thiss!1248) lt!85005 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!170912 (arrayContainsKey!0 (_keys!5385 thiss!1248) lt!85005 #b00000000000000000000000000000000)))

(declare-fun lt!85003 () Unit!5227)

(assert (=> b!170912 (= lt!85003 lt!85004)))

(declare-fun res!81226 () Bool)

(declare-datatypes ((SeekEntryResult!545 0))(
  ( (MissingZero!545 (index!4348 (_ BitVec 32))) (Found!545 (index!4349 (_ BitVec 32))) (Intermediate!545 (undefined!1357 Bool) (index!4350 (_ BitVec 32)) (x!18969 (_ BitVec 32))) (Undefined!545) (MissingVacant!545 (index!4351 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7099 (_ BitVec 32)) SeekEntryResult!545)

(assert (=> b!170912 (= res!81226 (= (seekEntryOrOpen!0 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (_keys!5385 thiss!1248) (mask!8381 thiss!1248)) (Found!545 #b00000000000000000000000000000000)))))

(assert (=> b!170912 (=> (not res!81226) (not e!112827))))

(declare-fun bm!17393 () Bool)

(assert (=> bm!17393 (= call!17396 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5385 thiss!1248) (mask!8381 thiss!1248)))))

(assert (= (and d!51653 (not res!81225)) b!170911))

(assert (= (and b!170911 c!30504) b!170912))

(assert (= (and b!170911 (not c!30504)) b!170909))

(assert (= (and b!170912 res!81226) b!170910))

(assert (= (or b!170910 b!170909) bm!17393))

(assert (=> b!170911 m!198643))

(assert (=> b!170911 m!198643))

(assert (=> b!170911 m!198645))

(assert (=> b!170912 m!198643))

(declare-fun m!198799 () Bool)

(assert (=> b!170912 m!198799))

(declare-fun m!198801 () Bool)

(assert (=> b!170912 m!198801))

(assert (=> b!170912 m!198643))

(declare-fun m!198803 () Bool)

(assert (=> b!170912 m!198803))

(declare-fun m!198805 () Bool)

(assert (=> bm!17393 m!198805))

(assert (=> b!170882 d!51653))

(declare-fun d!51655 () Bool)

(assert (=> d!51655 (= (apply!129 lt!84962 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) (get!1933 (getValueByKey!182 (toList!1091 lt!84962) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7026 () Bool)

(assert (= bs!7026 d!51655))

(assert (=> bs!7026 m!198643))

(declare-fun m!198807 () Bool)

(assert (=> bs!7026 m!198807))

(assert (=> bs!7026 m!198807))

(declare-fun m!198809 () Bool)

(assert (=> bs!7026 m!198809))

(assert (=> b!170832 d!51655))

(assert (=> b!170832 d!51647))

(declare-fun d!51657 () Bool)

(declare-fun e!112829 () Bool)

(assert (=> d!51657 e!112829))

(declare-fun res!81227 () Bool)

(assert (=> d!51657 (=> res!81227 e!112829)))

(declare-fun lt!85009 () Bool)

(assert (=> d!51657 (= res!81227 (not lt!85009))))

(declare-fun lt!85007 () Bool)

(assert (=> d!51657 (= lt!85009 lt!85007)))

(declare-fun lt!85006 () Unit!5227)

(declare-fun e!112828 () Unit!5227)

(assert (=> d!51657 (= lt!85006 e!112828)))

(declare-fun c!30505 () Bool)

(assert (=> d!51657 (= c!30505 lt!85007)))

(assert (=> d!51657 (= lt!85007 (containsKey!186 (toList!1091 lt!84987) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51657 (= (contains!1142 lt!84987 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) lt!85009)))

(declare-fun b!170913 () Bool)

(declare-fun lt!85008 () Unit!5227)

(assert (=> b!170913 (= e!112828 lt!85008)))

(assert (=> b!170913 (= lt!85008 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84987) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!170913 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84987) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170914 () Bool)

(declare-fun Unit!5235 () Unit!5227)

(assert (=> b!170914 (= e!112828 Unit!5235)))

(declare-fun b!170915 () Bool)

(assert (=> b!170915 (= e!112829 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84987) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!51657 c!30505) b!170913))

(assert (= (and d!51657 (not c!30505)) b!170914))

(assert (= (and d!51657 (not res!81227)) b!170915))

(assert (=> d!51657 m!198643))

(declare-fun m!198811 () Bool)

(assert (=> d!51657 m!198811))

(assert (=> b!170913 m!198643))

(declare-fun m!198813 () Bool)

(assert (=> b!170913 m!198813))

(assert (=> b!170913 m!198643))

(assert (=> b!170913 m!198791))

(assert (=> b!170913 m!198791))

(declare-fun m!198815 () Bool)

(assert (=> b!170913 m!198815))

(assert (=> b!170915 m!198643))

(assert (=> b!170915 m!198791))

(assert (=> b!170915 m!198791))

(assert (=> b!170915 m!198815))

(assert (=> b!170876 d!51657))

(declare-fun b!170924 () Bool)

(declare-fun e!112834 () Option!188)

(assert (=> b!170924 (= e!112834 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!84992)))))))

(declare-fun b!170926 () Bool)

(declare-fun e!112835 () Option!188)

(assert (=> b!170926 (= e!112835 (getValueByKey!182 (t!6996 (toList!1091 lt!84992)) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!170927 () Bool)

(assert (=> b!170927 (= e!112835 None!186)))

(declare-fun d!51659 () Bool)

(declare-fun c!30510 () Bool)

(assert (=> d!51659 (= c!30510 (and ((_ is Cons!2199) (toList!1091 lt!84992)) (= (_1!1627 (h!2816 (toList!1091 lt!84992))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!51659 (= (getValueByKey!182 (toList!1091 lt!84992) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!112834)))

(declare-fun b!170925 () Bool)

(assert (=> b!170925 (= e!112834 e!112835)))

(declare-fun c!30511 () Bool)

(assert (=> b!170925 (= c!30511 (and ((_ is Cons!2199) (toList!1091 lt!84992)) (not (= (_1!1627 (h!2816 (toList!1091 lt!84992))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (= (and d!51659 c!30510) b!170924))

(assert (= (and d!51659 (not c!30510)) b!170925))

(assert (= (and b!170925 c!30511) b!170926))

(assert (= (and b!170925 (not c!30511)) b!170927))

(declare-fun m!198817 () Bool)

(assert (=> b!170926 m!198817))

(assert (=> b!170879 d!51659))

(declare-fun d!51661 () Bool)

(assert (=> d!51661 (= (apply!129 lt!84987 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1933 (getValueByKey!182 (toList!1091 lt!84987) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7027 () Bool)

(assert (= bs!7027 d!51661))

(declare-fun m!198819 () Bool)

(assert (=> bs!7027 m!198819))

(assert (=> bs!7027 m!198819))

(declare-fun m!198821 () Bool)

(assert (=> bs!7027 m!198821))

(assert (=> b!170862 d!51661))

(declare-fun b!170938 () Bool)

(declare-fun e!112846 () Bool)

(declare-fun contains!1145 (List!2205 (_ BitVec 64)) Bool)

(assert (=> b!170938 (= e!112846 (contains!1145 Nil!2202 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170939 () Bool)

(declare-fun e!112845 () Bool)

(declare-fun e!112844 () Bool)

(assert (=> b!170939 (= e!112845 e!112844)))

(declare-fun res!81234 () Bool)

(assert (=> b!170939 (=> (not res!81234) (not e!112844))))

(assert (=> b!170939 (= res!81234 (not e!112846))))

(declare-fun res!81235 () Bool)

(assert (=> b!170939 (=> (not res!81235) (not e!112846))))

(assert (=> b!170939 (= res!81235 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51663 () Bool)

(declare-fun res!81236 () Bool)

(assert (=> d!51663 (=> res!81236 e!112845)))

(assert (=> d!51663 (= res!81236 (bvsge #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> d!51663 (= (arrayNoDuplicates!0 (_keys!5385 thiss!1248) #b00000000000000000000000000000000 Nil!2202) e!112845)))

(declare-fun b!170940 () Bool)

(declare-fun e!112847 () Bool)

(assert (=> b!170940 (= e!112844 e!112847)))

(declare-fun c!30514 () Bool)

(assert (=> b!170940 (= c!30514 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17396 () Bool)

(declare-fun call!17399 () Bool)

(assert (=> bm!17396 (= call!17399 (arrayNoDuplicates!0 (_keys!5385 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30514 (Cons!2201 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) Nil!2202) Nil!2202)))))

(declare-fun b!170941 () Bool)

(assert (=> b!170941 (= e!112847 call!17399)))

(declare-fun b!170942 () Bool)

(assert (=> b!170942 (= e!112847 call!17399)))

(assert (= (and d!51663 (not res!81236)) b!170939))

(assert (= (and b!170939 res!81235) b!170938))

(assert (= (and b!170939 res!81234) b!170940))

(assert (= (and b!170940 c!30514) b!170941))

(assert (= (and b!170940 (not c!30514)) b!170942))

(assert (= (or b!170941 b!170942) bm!17396))

(assert (=> b!170938 m!198643))

(assert (=> b!170938 m!198643))

(declare-fun m!198823 () Bool)

(assert (=> b!170938 m!198823))

(assert (=> b!170939 m!198643))

(assert (=> b!170939 m!198643))

(assert (=> b!170939 m!198645))

(assert (=> b!170940 m!198643))

(assert (=> b!170940 m!198643))

(assert (=> b!170940 m!198645))

(assert (=> bm!17396 m!198643))

(declare-fun m!198825 () Bool)

(assert (=> bm!17396 m!198825))

(assert (=> b!170883 d!51663))

(declare-fun d!51665 () Bool)

(declare-fun lt!85012 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!147 (List!2203) (InoxSet tuple2!3232))

(assert (=> d!51665 (= lt!85012 (select (content!147 (toList!1091 lt!84992)) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun e!112853 () Bool)

(assert (=> d!51665 (= lt!85012 e!112853)))

(declare-fun res!81241 () Bool)

(assert (=> d!51665 (=> (not res!81241) (not e!112853))))

(assert (=> d!51665 (= res!81241 ((_ is Cons!2199) (toList!1091 lt!84992)))))

(assert (=> d!51665 (= (contains!1144 (toList!1091 lt!84992) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!85012)))

(declare-fun b!170947 () Bool)

(declare-fun e!112852 () Bool)

(assert (=> b!170947 (= e!112853 e!112852)))

(declare-fun res!81242 () Bool)

(assert (=> b!170947 (=> res!81242 e!112852)))

(assert (=> b!170947 (= res!81242 (= (h!2816 (toList!1091 lt!84992)) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!170948 () Bool)

(assert (=> b!170948 (= e!112852 (contains!1144 (t!6996 (toList!1091 lt!84992)) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!51665 res!81241) b!170947))

(assert (= (and b!170947 (not res!81242)) b!170948))

(declare-fun m!198827 () Bool)

(assert (=> d!51665 m!198827))

(declare-fun m!198829 () Bool)

(assert (=> d!51665 m!198829))

(declare-fun m!198831 () Bool)

(assert (=> b!170948 m!198831))

(assert (=> b!170880 d!51665))

(declare-fun b!170973 () Bool)

(declare-fun lt!85030 () Unit!5227)

(declare-fun lt!85027 () Unit!5227)

(assert (=> b!170973 (= lt!85030 lt!85027)))

(declare-fun lt!85032 () (_ BitVec 64))

(declare-fun lt!85029 () V!4985)

(declare-fun lt!85028 () ListLongMap!2151)

(declare-fun lt!85033 () (_ BitVec 64))

(assert (=> b!170973 (not (contains!1142 (+!238 lt!85028 (tuple2!3233 lt!85033 lt!85029)) lt!85032))))

(declare-fun addStillNotContains!72 (ListLongMap!2151 (_ BitVec 64) V!4985 (_ BitVec 64)) Unit!5227)

(assert (=> b!170973 (= lt!85027 (addStillNotContains!72 lt!85028 lt!85033 lt!85029 lt!85032))))

(assert (=> b!170973 (= lt!85032 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!170973 (= lt!85029 (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!170973 (= lt!85033 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!17402 () ListLongMap!2151)

(assert (=> b!170973 (= lt!85028 call!17402)))

(declare-fun e!112870 () ListLongMap!2151)

(assert (=> b!170973 (= e!112870 (+!238 call!17402 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!170974 () Bool)

(declare-fun e!112869 () Bool)

(declare-fun e!112873 () Bool)

(assert (=> b!170974 (= e!112869 e!112873)))

(declare-fun c!30525 () Bool)

(declare-fun e!112871 () Bool)

(assert (=> b!170974 (= c!30525 e!112871)))

(declare-fun res!81251 () Bool)

(assert (=> b!170974 (=> (not res!81251) (not e!112871))))

(assert (=> b!170974 (= res!81251 (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun b!170975 () Bool)

(declare-fun e!112874 () Bool)

(assert (=> b!170975 (= e!112873 e!112874)))

(assert (=> b!170975 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun res!81252 () Bool)

(declare-fun lt!85031 () ListLongMap!2151)

(assert (=> b!170975 (= res!81252 (contains!1142 lt!85031 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!170975 (=> (not res!81252) (not e!112874))))

(declare-fun b!170976 () Bool)

(assert (=> b!170976 (= e!112871 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!170976 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!170977 () Bool)

(declare-fun e!112872 () Bool)

(assert (=> b!170977 (= e!112873 e!112872)))

(declare-fun c!30524 () Bool)

(assert (=> b!170977 (= c!30524 (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun b!170978 () Bool)

(declare-fun e!112868 () ListLongMap!2151)

(assert (=> b!170978 (= e!112868 e!112870)))

(declare-fun c!30526 () Bool)

(assert (=> b!170978 (= c!30526 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170979 () Bool)

(assert (=> b!170979 (= e!112872 (= lt!85031 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248))))))

(declare-fun b!170980 () Bool)

(declare-fun isEmpty!437 (ListLongMap!2151) Bool)

(assert (=> b!170980 (= e!112872 (isEmpty!437 lt!85031))))

(declare-fun b!170981 () Bool)

(assert (=> b!170981 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> b!170981 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3671 (_values!3537 thiss!1248))))))

(assert (=> b!170981 (= e!112874 (= (apply!129 lt!85031 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!170982 () Bool)

(declare-fun res!81254 () Bool)

(assert (=> b!170982 (=> (not res!81254) (not e!112869))))

(assert (=> b!170982 (= res!81254 (not (contains!1142 lt!85031 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!170983 () Bool)

(assert (=> b!170983 (= e!112870 call!17402)))

(declare-fun b!170984 () Bool)

(assert (=> b!170984 (= e!112868 (ListLongMap!2152 Nil!2200))))

(declare-fun d!51667 () Bool)

(assert (=> d!51667 e!112869))

(declare-fun res!81253 () Bool)

(assert (=> d!51667 (=> (not res!81253) (not e!112869))))

(assert (=> d!51667 (= res!81253 (not (contains!1142 lt!85031 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51667 (= lt!85031 e!112868)))

(declare-fun c!30523 () Bool)

(assert (=> d!51667 (= c!30523 (bvsge #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> d!51667 (validMask!0 (mask!8381 thiss!1248))))

(assert (=> d!51667 (= (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) lt!85031)))

(declare-fun bm!17399 () Bool)

(assert (=> bm!17399 (= call!17402 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248)))))

(assert (= (and d!51667 c!30523) b!170984))

(assert (= (and d!51667 (not c!30523)) b!170978))

(assert (= (and b!170978 c!30526) b!170973))

(assert (= (and b!170978 (not c!30526)) b!170983))

(assert (= (or b!170973 b!170983) bm!17399))

(assert (= (and d!51667 res!81253) b!170982))

(assert (= (and b!170982 res!81254) b!170974))

(assert (= (and b!170974 res!81251) b!170976))

(assert (= (and b!170974 c!30525) b!170975))

(assert (= (and b!170974 (not c!30525)) b!170977))

(assert (= (and b!170975 res!81252) b!170981))

(assert (= (and b!170977 c!30524) b!170979))

(assert (= (and b!170977 (not c!30524)) b!170980))

(declare-fun b_lambda!6877 () Bool)

(assert (=> (not b_lambda!6877) (not b!170973)))

(assert (=> b!170973 t!6999))

(declare-fun b_and!10629 () Bool)

(assert (= b_and!10627 (and (=> t!6999 result!4553) b_and!10629)))

(declare-fun b_lambda!6879 () Bool)

(assert (=> (not b_lambda!6879) (not b!170981)))

(assert (=> b!170981 t!6999))

(declare-fun b_and!10631 () Bool)

(assert (= b_and!10629 (and (=> t!6999 result!4553) b_and!10631)))

(declare-fun m!198833 () Bool)

(assert (=> b!170979 m!198833))

(declare-fun m!198835 () Bool)

(assert (=> b!170982 m!198835))

(assert (=> b!170976 m!198643))

(assert (=> b!170976 m!198643))

(assert (=> b!170976 m!198645))

(declare-fun m!198837 () Bool)

(assert (=> d!51667 m!198837))

(assert (=> d!51667 m!198667))

(assert (=> b!170973 m!198655))

(assert (=> b!170973 m!198653))

(assert (=> b!170973 m!198653))

(assert (=> b!170973 m!198655))

(assert (=> b!170973 m!198657))

(assert (=> b!170973 m!198643))

(declare-fun m!198839 () Bool)

(assert (=> b!170973 m!198839))

(declare-fun m!198841 () Bool)

(assert (=> b!170973 m!198841))

(declare-fun m!198843 () Bool)

(assert (=> b!170973 m!198843))

(declare-fun m!198845 () Bool)

(assert (=> b!170973 m!198845))

(assert (=> b!170973 m!198841))

(assert (=> b!170981 m!198655))

(assert (=> b!170981 m!198653))

(assert (=> b!170981 m!198653))

(assert (=> b!170981 m!198655))

(assert (=> b!170981 m!198657))

(assert (=> b!170981 m!198643))

(declare-fun m!198847 () Bool)

(assert (=> b!170981 m!198847))

(assert (=> b!170981 m!198643))

(assert (=> bm!17399 m!198833))

(assert (=> b!170975 m!198643))

(assert (=> b!170975 m!198643))

(declare-fun m!198849 () Bool)

(assert (=> b!170975 m!198849))

(assert (=> b!170978 m!198643))

(assert (=> b!170978 m!198643))

(assert (=> b!170978 m!198645))

(declare-fun m!198851 () Bool)

(assert (=> b!170980 m!198851))

(assert (=> bm!17380 d!51667))

(declare-fun d!51669 () Bool)

(assert (=> d!51669 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84853) key!828))))

(declare-fun lt!85036 () Unit!5227)

(declare-fun choose!930 (List!2203 (_ BitVec 64)) Unit!5227)

(assert (=> d!51669 (= lt!85036 (choose!930 (toList!1091 lt!84853) key!828))))

(declare-fun e!112877 () Bool)

(assert (=> d!51669 e!112877))

(declare-fun res!81257 () Bool)

(assert (=> d!51669 (=> (not res!81257) (not e!112877))))

(declare-fun isStrictlySorted!326 (List!2203) Bool)

(assert (=> d!51669 (= res!81257 (isStrictlySorted!326 (toList!1091 lt!84853)))))

(assert (=> d!51669 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84853) key!828) lt!85036)))

(declare-fun b!170987 () Bool)

(assert (=> b!170987 (= e!112877 (containsKey!186 (toList!1091 lt!84853) key!828))))

(assert (= (and d!51669 res!81257) b!170987))

(assert (=> d!51669 m!198625))

(assert (=> d!51669 m!198625))

(assert (=> d!51669 m!198627))

(declare-fun m!198853 () Bool)

(assert (=> d!51669 m!198853))

(declare-fun m!198855 () Bool)

(assert (=> d!51669 m!198855))

(assert (=> b!170987 m!198621))

(assert (=> b!170775 d!51669))

(declare-fun d!51671 () Bool)

(declare-fun isEmpty!438 (Option!188) Bool)

(assert (=> d!51671 (= (isDefined!136 (getValueByKey!182 (toList!1091 lt!84853) key!828)) (not (isEmpty!438 (getValueByKey!182 (toList!1091 lt!84853) key!828))))))

(declare-fun bs!7028 () Bool)

(assert (= bs!7028 d!51671))

(assert (=> bs!7028 m!198625))

(declare-fun m!198857 () Bool)

(assert (=> bs!7028 m!198857))

(assert (=> b!170775 d!51671))

(declare-fun b!170988 () Bool)

(declare-fun e!112878 () Option!188)

(assert (=> b!170988 (= e!112878 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!84853)))))))

(declare-fun b!170990 () Bool)

(declare-fun e!112879 () Option!188)

(assert (=> b!170990 (= e!112879 (getValueByKey!182 (t!6996 (toList!1091 lt!84853)) key!828))))

(declare-fun b!170991 () Bool)

(assert (=> b!170991 (= e!112879 None!186)))

(declare-fun d!51673 () Bool)

(declare-fun c!30527 () Bool)

(assert (=> d!51673 (= c!30527 (and ((_ is Cons!2199) (toList!1091 lt!84853)) (= (_1!1627 (h!2816 (toList!1091 lt!84853))) key!828)))))

(assert (=> d!51673 (= (getValueByKey!182 (toList!1091 lt!84853) key!828) e!112878)))

(declare-fun b!170989 () Bool)

(assert (=> b!170989 (= e!112878 e!112879)))

(declare-fun c!30528 () Bool)

(assert (=> b!170989 (= c!30528 (and ((_ is Cons!2199) (toList!1091 lt!84853)) (not (= (_1!1627 (h!2816 (toList!1091 lt!84853))) key!828))))))

(assert (= (and d!51673 c!30527) b!170988))

(assert (= (and d!51673 (not c!30527)) b!170989))

(assert (= (and b!170989 c!30528) b!170990))

(assert (= (and b!170989 (not c!30528)) b!170991))

(declare-fun m!198859 () Bool)

(assert (=> b!170990 m!198859))

(assert (=> b!170775 d!51673))

(declare-fun d!51675 () Bool)

(assert (=> d!51675 (= (apply!129 lt!84947 lt!84961) (get!1933 (getValueByKey!182 (toList!1091 lt!84947) lt!84961)))))

(declare-fun bs!7029 () Bool)

(assert (= bs!7029 d!51675))

(declare-fun m!198861 () Bool)

(assert (=> bs!7029 m!198861))

(assert (=> bs!7029 m!198861))

(declare-fun m!198863 () Bool)

(assert (=> bs!7029 m!198863))

(assert (=> b!170837 d!51675))

(declare-fun d!51677 () Bool)

(assert (=> d!51677 (= (apply!129 (+!238 lt!84947 (tuple2!3233 lt!84944 v!309)) lt!84961) (apply!129 lt!84947 lt!84961))))

(declare-fun lt!85039 () Unit!5227)

(declare-fun choose!931 (ListLongMap!2151 (_ BitVec 64) V!4985 (_ BitVec 64)) Unit!5227)

(assert (=> d!51677 (= lt!85039 (choose!931 lt!84947 lt!84944 v!309 lt!84961))))

(declare-fun e!112882 () Bool)

(assert (=> d!51677 e!112882))

(declare-fun res!81260 () Bool)

(assert (=> d!51677 (=> (not res!81260) (not e!112882))))

(assert (=> d!51677 (= res!81260 (contains!1142 lt!84947 lt!84961))))

(assert (=> d!51677 (= (addApplyDifferent!105 lt!84947 lt!84944 v!309 lt!84961) lt!85039)))

(declare-fun b!170995 () Bool)

(assert (=> b!170995 (= e!112882 (not (= lt!84961 lt!84944)))))

(assert (= (and d!51677 res!81260) b!170995))

(assert (=> d!51677 m!198675))

(assert (=> d!51677 m!198697))

(declare-fun m!198865 () Bool)

(assert (=> d!51677 m!198865))

(assert (=> d!51677 m!198697))

(assert (=> d!51677 m!198699))

(declare-fun m!198867 () Bool)

(assert (=> d!51677 m!198867))

(assert (=> b!170837 d!51677))

(declare-fun d!51679 () Bool)

(declare-fun e!112883 () Bool)

(assert (=> d!51679 e!112883))

(declare-fun res!81262 () Bool)

(assert (=> d!51679 (=> (not res!81262) (not e!112883))))

(declare-fun lt!85043 () ListLongMap!2151)

(assert (=> d!51679 (= res!81262 (contains!1142 lt!85043 (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85041 () List!2203)

(assert (=> d!51679 (= lt!85043 (ListLongMap!2152 lt!85041))))

(declare-fun lt!85042 () Unit!5227)

(declare-fun lt!85040 () Unit!5227)

(assert (=> d!51679 (= lt!85042 lt!85040)))

(assert (=> d!51679 (= (getValueByKey!182 lt!85041 (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))

(assert (=> d!51679 (= lt!85040 (lemmaContainsTupThenGetReturnValue!98 lt!85041 (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))

(assert (=> d!51679 (= lt!85041 (insertStrictlySorted!101 (toList!1091 lt!84948) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))

(assert (=> d!51679 (= (+!238 lt!84948 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))) lt!85043)))

(declare-fun b!170996 () Bool)

(declare-fun res!81261 () Bool)

(assert (=> b!170996 (=> (not res!81261) (not e!112883))))

(assert (=> b!170996 (= res!81261 (= (getValueByKey!182 (toList!1091 lt!85043) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))))))

(declare-fun b!170997 () Bool)

(assert (=> b!170997 (= e!112883 (contains!1144 (toList!1091 lt!85043) (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))))

(assert (= (and d!51679 res!81262) b!170996))

(assert (= (and b!170996 res!81261) b!170997))

(declare-fun m!198869 () Bool)

(assert (=> d!51679 m!198869))

(declare-fun m!198871 () Bool)

(assert (=> d!51679 m!198871))

(declare-fun m!198873 () Bool)

(assert (=> d!51679 m!198873))

(declare-fun m!198875 () Bool)

(assert (=> d!51679 m!198875))

(declare-fun m!198877 () Bool)

(assert (=> b!170996 m!198877))

(declare-fun m!198879 () Bool)

(assert (=> b!170997 m!198879))

(assert (=> b!170837 d!51679))

(declare-fun d!51681 () Bool)

(assert (=> d!51681 (= (apply!129 lt!84942 lt!84954) (get!1933 (getValueByKey!182 (toList!1091 lt!84942) lt!84954)))))

(declare-fun bs!7030 () Bool)

(assert (= bs!7030 d!51681))

(declare-fun m!198881 () Bool)

(assert (=> bs!7030 m!198881))

(assert (=> bs!7030 m!198881))

(declare-fun m!198883 () Bool)

(assert (=> bs!7030 m!198883))

(assert (=> b!170837 d!51681))

(declare-fun d!51683 () Bool)

(assert (=> d!51683 (= (apply!129 (+!238 lt!84942 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))) lt!84954) (apply!129 lt!84942 lt!84954))))

(declare-fun lt!85044 () Unit!5227)

(assert (=> d!51683 (= lt!85044 (choose!931 lt!84942 lt!84963 (minValue!3397 thiss!1248) lt!84954))))

(declare-fun e!112884 () Bool)

(assert (=> d!51683 e!112884))

(declare-fun res!81263 () Bool)

(assert (=> d!51683 (=> (not res!81263) (not e!112884))))

(assert (=> d!51683 (= res!81263 (contains!1142 lt!84942 lt!84954))))

(assert (=> d!51683 (= (addApplyDifferent!105 lt!84942 lt!84963 (minValue!3397 thiss!1248) lt!84954) lt!85044)))

(declare-fun b!170998 () Bool)

(assert (=> b!170998 (= e!112884 (not (= lt!84954 lt!84963)))))

(assert (= (and d!51683 res!81263) b!170998))

(assert (=> d!51683 m!198681))

(assert (=> d!51683 m!198679))

(declare-fun m!198885 () Bool)

(assert (=> d!51683 m!198885))

(assert (=> d!51683 m!198679))

(assert (=> d!51683 m!198701))

(declare-fun m!198887 () Bool)

(assert (=> d!51683 m!198887))

(assert (=> b!170837 d!51683))

(declare-fun d!51685 () Bool)

(declare-fun e!112885 () Bool)

(assert (=> d!51685 e!112885))

(declare-fun res!81265 () Bool)

(assert (=> d!51685 (=> (not res!81265) (not e!112885))))

(declare-fun lt!85048 () ListLongMap!2151)

(assert (=> d!51685 (= res!81265 (contains!1142 lt!85048 (_1!1627 (tuple2!3233 lt!84945 v!309))))))

(declare-fun lt!85046 () List!2203)

(assert (=> d!51685 (= lt!85048 (ListLongMap!2152 lt!85046))))

(declare-fun lt!85047 () Unit!5227)

(declare-fun lt!85045 () Unit!5227)

(assert (=> d!51685 (= lt!85047 lt!85045)))

(assert (=> d!51685 (= (getValueByKey!182 lt!85046 (_1!1627 (tuple2!3233 lt!84945 v!309))) (Some!187 (_2!1627 (tuple2!3233 lt!84945 v!309))))))

(assert (=> d!51685 (= lt!85045 (lemmaContainsTupThenGetReturnValue!98 lt!85046 (_1!1627 (tuple2!3233 lt!84945 v!309)) (_2!1627 (tuple2!3233 lt!84945 v!309))))))

(assert (=> d!51685 (= lt!85046 (insertStrictlySorted!101 (toList!1091 lt!84960) (_1!1627 (tuple2!3233 lt!84945 v!309)) (_2!1627 (tuple2!3233 lt!84945 v!309))))))

(assert (=> d!51685 (= (+!238 lt!84960 (tuple2!3233 lt!84945 v!309)) lt!85048)))

(declare-fun b!170999 () Bool)

(declare-fun res!81264 () Bool)

(assert (=> b!170999 (=> (not res!81264) (not e!112885))))

(assert (=> b!170999 (= res!81264 (= (getValueByKey!182 (toList!1091 lt!85048) (_1!1627 (tuple2!3233 lt!84945 v!309))) (Some!187 (_2!1627 (tuple2!3233 lt!84945 v!309)))))))

(declare-fun b!171000 () Bool)

(assert (=> b!171000 (= e!112885 (contains!1144 (toList!1091 lt!85048) (tuple2!3233 lt!84945 v!309)))))

(assert (= (and d!51685 res!81265) b!170999))

(assert (= (and b!170999 res!81264) b!171000))

(declare-fun m!198889 () Bool)

(assert (=> d!51685 m!198889))

(declare-fun m!198891 () Bool)

(assert (=> d!51685 m!198891))

(declare-fun m!198893 () Bool)

(assert (=> d!51685 m!198893))

(declare-fun m!198895 () Bool)

(assert (=> d!51685 m!198895))

(declare-fun m!198897 () Bool)

(assert (=> b!170999 m!198897))

(declare-fun m!198899 () Bool)

(assert (=> b!171000 m!198899))

(assert (=> b!170837 d!51685))

(declare-fun d!51687 () Bool)

(declare-fun e!112886 () Bool)

(assert (=> d!51687 e!112886))

(declare-fun res!81267 () Bool)

(assert (=> d!51687 (=> (not res!81267) (not e!112886))))

(declare-fun lt!85052 () ListLongMap!2151)

(assert (=> d!51687 (= res!81267 (contains!1142 lt!85052 (_1!1627 (tuple2!3233 lt!84944 v!309))))))

(declare-fun lt!85050 () List!2203)

(assert (=> d!51687 (= lt!85052 (ListLongMap!2152 lt!85050))))

(declare-fun lt!85051 () Unit!5227)

(declare-fun lt!85049 () Unit!5227)

(assert (=> d!51687 (= lt!85051 lt!85049)))

(assert (=> d!51687 (= (getValueByKey!182 lt!85050 (_1!1627 (tuple2!3233 lt!84944 v!309))) (Some!187 (_2!1627 (tuple2!3233 lt!84944 v!309))))))

(assert (=> d!51687 (= lt!85049 (lemmaContainsTupThenGetReturnValue!98 lt!85050 (_1!1627 (tuple2!3233 lt!84944 v!309)) (_2!1627 (tuple2!3233 lt!84944 v!309))))))

(assert (=> d!51687 (= lt!85050 (insertStrictlySorted!101 (toList!1091 lt!84947) (_1!1627 (tuple2!3233 lt!84944 v!309)) (_2!1627 (tuple2!3233 lt!84944 v!309))))))

(assert (=> d!51687 (= (+!238 lt!84947 (tuple2!3233 lt!84944 v!309)) lt!85052)))

(declare-fun b!171001 () Bool)

(declare-fun res!81266 () Bool)

(assert (=> b!171001 (=> (not res!81266) (not e!112886))))

(assert (=> b!171001 (= res!81266 (= (getValueByKey!182 (toList!1091 lt!85052) (_1!1627 (tuple2!3233 lt!84944 v!309))) (Some!187 (_2!1627 (tuple2!3233 lt!84944 v!309)))))))

(declare-fun b!171002 () Bool)

(assert (=> b!171002 (= e!112886 (contains!1144 (toList!1091 lt!85052) (tuple2!3233 lt!84944 v!309)))))

(assert (= (and d!51687 res!81267) b!171001))

(assert (= (and b!171001 res!81266) b!171002))

(declare-fun m!198901 () Bool)

(assert (=> d!51687 m!198901))

(declare-fun m!198903 () Bool)

(assert (=> d!51687 m!198903))

(declare-fun m!198905 () Bool)

(assert (=> d!51687 m!198905))

(declare-fun m!198907 () Bool)

(assert (=> d!51687 m!198907))

(declare-fun m!198909 () Bool)

(assert (=> b!171001 m!198909))

(declare-fun m!198911 () Bool)

(assert (=> b!171002 m!198911))

(assert (=> b!170837 d!51687))

(declare-fun d!51689 () Bool)

(declare-fun e!112888 () Bool)

(assert (=> d!51689 e!112888))

(declare-fun res!81268 () Bool)

(assert (=> d!51689 (=> res!81268 e!112888)))

(declare-fun lt!85056 () Bool)

(assert (=> d!51689 (= res!81268 (not lt!85056))))

(declare-fun lt!85054 () Bool)

(assert (=> d!51689 (= lt!85056 lt!85054)))

(declare-fun lt!85053 () Unit!5227)

(declare-fun e!112887 () Unit!5227)

(assert (=> d!51689 (= lt!85053 e!112887)))

(declare-fun c!30529 () Bool)

(assert (=> d!51689 (= c!30529 lt!85054)))

(assert (=> d!51689 (= lt!85054 (containsKey!186 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))) lt!84949))))

(assert (=> d!51689 (= (contains!1142 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309)) lt!84949) lt!85056)))

(declare-fun b!171003 () Bool)

(declare-fun lt!85055 () Unit!5227)

(assert (=> b!171003 (= e!112887 lt!85055)))

(assert (=> b!171003 (= lt!85055 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))) lt!84949))))

(assert (=> b!171003 (isDefined!136 (getValueByKey!182 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))) lt!84949))))

(declare-fun b!171004 () Bool)

(declare-fun Unit!5236 () Unit!5227)

(assert (=> b!171004 (= e!112887 Unit!5236)))

(declare-fun b!171005 () Bool)

(assert (=> b!171005 (= e!112888 (isDefined!136 (getValueByKey!182 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))) lt!84949)))))

(assert (= (and d!51689 c!30529) b!171003))

(assert (= (and d!51689 (not c!30529)) b!171004))

(assert (= (and d!51689 (not res!81268)) b!171005))

(declare-fun m!198913 () Bool)

(assert (=> d!51689 m!198913))

(declare-fun m!198915 () Bool)

(assert (=> b!171003 m!198915))

(declare-fun m!198917 () Bool)

(assert (=> b!171003 m!198917))

(assert (=> b!171003 m!198917))

(declare-fun m!198919 () Bool)

(assert (=> b!171003 m!198919))

(assert (=> b!171005 m!198917))

(assert (=> b!171005 m!198917))

(assert (=> b!171005 m!198919))

(assert (=> b!170837 d!51689))

(declare-fun d!51691 () Bool)

(assert (=> d!51691 (= (apply!129 (+!238 lt!84948 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))) lt!84943) (apply!129 lt!84948 lt!84943))))

(declare-fun lt!85057 () Unit!5227)

(assert (=> d!51691 (= lt!85057 (choose!931 lt!84948 lt!84946 (minValue!3397 thiss!1248) lt!84943))))

(declare-fun e!112889 () Bool)

(assert (=> d!51691 e!112889))

(declare-fun res!81269 () Bool)

(assert (=> d!51691 (=> (not res!81269) (not e!112889))))

(assert (=> d!51691 (= res!81269 (contains!1142 lt!84948 lt!84943))))

(assert (=> d!51691 (= (addApplyDifferent!105 lt!84948 lt!84946 (minValue!3397 thiss!1248) lt!84943) lt!85057)))

(declare-fun b!171006 () Bool)

(assert (=> b!171006 (= e!112889 (not (= lt!84943 lt!84946)))))

(assert (= (and d!51691 res!81269) b!171006))

(assert (=> d!51691 m!198673))

(assert (=> d!51691 m!198677))

(declare-fun m!198921 () Bool)

(assert (=> d!51691 m!198921))

(assert (=> d!51691 m!198677))

(assert (=> d!51691 m!198685))

(declare-fun m!198923 () Bool)

(assert (=> d!51691 m!198923))

(assert (=> b!170837 d!51691))

(declare-fun d!51693 () Bool)

(assert (=> d!51693 (= (apply!129 (+!238 lt!84942 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))) lt!84954) (get!1933 (getValueByKey!182 (toList!1091 (+!238 lt!84942 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))) lt!84954)))))

(declare-fun bs!7031 () Bool)

(assert (= bs!7031 d!51693))

(declare-fun m!198925 () Bool)

(assert (=> bs!7031 m!198925))

(assert (=> bs!7031 m!198925))

(declare-fun m!198927 () Bool)

(assert (=> bs!7031 m!198927))

(assert (=> b!170837 d!51693))

(declare-fun d!51695 () Bool)

(assert (=> d!51695 (= (apply!129 lt!84948 lt!84943) (get!1933 (getValueByKey!182 (toList!1091 lt!84948) lt!84943)))))

(declare-fun bs!7032 () Bool)

(assert (= bs!7032 d!51695))

(declare-fun m!198929 () Bool)

(assert (=> bs!7032 m!198929))

(assert (=> bs!7032 m!198929))

(declare-fun m!198931 () Bool)

(assert (=> bs!7032 m!198931))

(assert (=> b!170837 d!51695))

(declare-fun d!51697 () Bool)

(declare-fun e!112890 () Bool)

(assert (=> d!51697 e!112890))

(declare-fun res!81271 () Bool)

(assert (=> d!51697 (=> (not res!81271) (not e!112890))))

(declare-fun lt!85061 () ListLongMap!2151)

(assert (=> d!51697 (= res!81271 (contains!1142 lt!85061 (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85059 () List!2203)

(assert (=> d!51697 (= lt!85061 (ListLongMap!2152 lt!85059))))

(declare-fun lt!85060 () Unit!5227)

(declare-fun lt!85058 () Unit!5227)

(assert (=> d!51697 (= lt!85060 lt!85058)))

(assert (=> d!51697 (= (getValueByKey!182 lt!85059 (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))

(assert (=> d!51697 (= lt!85058 (lemmaContainsTupThenGetReturnValue!98 lt!85059 (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))

(assert (=> d!51697 (= lt!85059 (insertStrictlySorted!101 (toList!1091 lt!84942) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))

(assert (=> d!51697 (= (+!238 lt!84942 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))) lt!85061)))

(declare-fun b!171007 () Bool)

(declare-fun res!81270 () Bool)

(assert (=> b!171007 (=> (not res!81270) (not e!112890))))

(assert (=> b!171007 (= res!81270 (= (getValueByKey!182 (toList!1091 lt!85061) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))))))

(declare-fun b!171008 () Bool)

(assert (=> b!171008 (= e!112890 (contains!1144 (toList!1091 lt!85061) (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))))

(assert (= (and d!51697 res!81271) b!171007))

(assert (= (and b!171007 res!81270) b!171008))

(declare-fun m!198933 () Bool)

(assert (=> d!51697 m!198933))

(declare-fun m!198935 () Bool)

(assert (=> d!51697 m!198935))

(declare-fun m!198937 () Bool)

(assert (=> d!51697 m!198937))

(declare-fun m!198939 () Bool)

(assert (=> d!51697 m!198939))

(declare-fun m!198941 () Bool)

(assert (=> b!171007 m!198941))

(declare-fun m!198943 () Bool)

(assert (=> b!171008 m!198943))

(assert (=> b!170837 d!51697))

(declare-fun d!51699 () Bool)

(assert (=> d!51699 (= (apply!129 (+!238 lt!84947 (tuple2!3233 lt!84944 v!309)) lt!84961) (get!1933 (getValueByKey!182 (toList!1091 (+!238 lt!84947 (tuple2!3233 lt!84944 v!309))) lt!84961)))))

(declare-fun bs!7033 () Bool)

(assert (= bs!7033 d!51699))

(declare-fun m!198945 () Bool)

(assert (=> bs!7033 m!198945))

(assert (=> bs!7033 m!198945))

(declare-fun m!198947 () Bool)

(assert (=> bs!7033 m!198947))

(assert (=> b!170837 d!51699))

(assert (=> b!170837 d!51667))

(declare-fun d!51701 () Bool)

(assert (=> d!51701 (contains!1142 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309)) lt!84949)))

(declare-fun lt!85064 () Unit!5227)

(declare-fun choose!932 (ListLongMap!2151 (_ BitVec 64) V!4985 (_ BitVec 64)) Unit!5227)

(assert (=> d!51701 (= lt!85064 (choose!932 lt!84960 lt!84945 v!309 lt!84949))))

(assert (=> d!51701 (contains!1142 lt!84960 lt!84949)))

(assert (=> d!51701 (= (addStillContains!105 lt!84960 lt!84945 v!309 lt!84949) lt!85064)))

(declare-fun bs!7034 () Bool)

(assert (= bs!7034 d!51701))

(assert (=> bs!7034 m!198693))

(assert (=> bs!7034 m!198693))

(assert (=> bs!7034 m!198695))

(declare-fun m!198949 () Bool)

(assert (=> bs!7034 m!198949))

(declare-fun m!198951 () Bool)

(assert (=> bs!7034 m!198951))

(assert (=> b!170837 d!51701))

(declare-fun d!51703 () Bool)

(assert (=> d!51703 (= (apply!129 (+!238 lt!84948 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))) lt!84943) (get!1933 (getValueByKey!182 (toList!1091 (+!238 lt!84948 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))) lt!84943)))))

(declare-fun bs!7035 () Bool)

(assert (= bs!7035 d!51703))

(declare-fun m!198953 () Bool)

(assert (=> bs!7035 m!198953))

(assert (=> bs!7035 m!198953))

(declare-fun m!198955 () Bool)

(assert (=> bs!7035 m!198955))

(assert (=> b!170837 d!51703))

(assert (=> d!51625 d!51633))

(declare-fun d!51705 () Bool)

(declare-fun e!112892 () Bool)

(assert (=> d!51705 e!112892))

(declare-fun res!81272 () Bool)

(assert (=> d!51705 (=> res!81272 e!112892)))

(declare-fun lt!85068 () Bool)

(assert (=> d!51705 (= res!81272 (not lt!85068))))

(declare-fun lt!85066 () Bool)

(assert (=> d!51705 (= lt!85068 lt!85066)))

(declare-fun lt!85065 () Unit!5227)

(declare-fun e!112891 () Unit!5227)

(assert (=> d!51705 (= lt!85065 e!112891)))

(declare-fun c!30530 () Bool)

(assert (=> d!51705 (= c!30530 lt!85066)))

(assert (=> d!51705 (= lt!85066 (containsKey!186 (toList!1091 lt!84987) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!51705 (= (contains!1142 lt!84987 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85068)))

(declare-fun b!171010 () Bool)

(declare-fun lt!85067 () Unit!5227)

(assert (=> b!171010 (= e!112891 lt!85067)))

(assert (=> b!171010 (= lt!85067 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84987) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171010 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84987) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171011 () Bool)

(declare-fun Unit!5237 () Unit!5227)

(assert (=> b!171011 (= e!112891 Unit!5237)))

(declare-fun b!171012 () Bool)

(assert (=> b!171012 (= e!112892 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84987) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51705 c!30530) b!171010))

(assert (= (and d!51705 (not c!30530)) b!171011))

(assert (= (and d!51705 (not res!81272)) b!171012))

(declare-fun m!198957 () Bool)

(assert (=> d!51705 m!198957))

(declare-fun m!198959 () Bool)

(assert (=> b!171010 m!198959))

(assert (=> b!171010 m!198819))

(assert (=> b!171010 m!198819))

(declare-fun m!198961 () Bool)

(assert (=> b!171010 m!198961))

(assert (=> b!171012 m!198819))

(assert (=> b!171012 m!198819))

(assert (=> b!171012 m!198961))

(assert (=> bm!17386 d!51705))

(declare-fun d!51707 () Bool)

(declare-fun e!112894 () Bool)

(assert (=> d!51707 e!112894))

(declare-fun res!81273 () Bool)

(assert (=> d!51707 (=> res!81273 e!112894)))

(declare-fun lt!85072 () Bool)

(assert (=> d!51707 (= res!81273 (not lt!85072))))

(declare-fun lt!85070 () Bool)

(assert (=> d!51707 (= lt!85072 lt!85070)))

(declare-fun lt!85069 () Unit!5227)

(declare-fun e!112893 () Unit!5227)

(assert (=> d!51707 (= lt!85069 e!112893)))

(declare-fun c!30531 () Bool)

(assert (=> d!51707 (= c!30531 lt!85070)))

(assert (=> d!51707 (= lt!85070 (containsKey!186 (toList!1091 lt!84987) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!51707 (= (contains!1142 lt!84987 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85072)))

(declare-fun b!171013 () Bool)

(declare-fun lt!85071 () Unit!5227)

(assert (=> b!171013 (= e!112893 lt!85071)))

(assert (=> b!171013 (= lt!85071 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84987) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171013 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84987) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171014 () Bool)

(declare-fun Unit!5238 () Unit!5227)

(assert (=> b!171014 (= e!112893 Unit!5238)))

(declare-fun b!171015 () Bool)

(assert (=> b!171015 (= e!112894 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84987) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51707 c!30531) b!171013))

(assert (= (and d!51707 (not c!30531)) b!171014))

(assert (= (and d!51707 (not res!81273)) b!171015))

(declare-fun m!198963 () Bool)

(assert (=> d!51707 m!198963))

(declare-fun m!198965 () Bool)

(assert (=> b!171013 m!198965))

(declare-fun m!198967 () Bool)

(assert (=> b!171013 m!198967))

(assert (=> b!171013 m!198967))

(declare-fun m!198969 () Bool)

(assert (=> b!171013 m!198969))

(assert (=> b!171015 m!198967))

(assert (=> b!171015 m!198967))

(assert (=> b!171015 m!198969))

(assert (=> bm!17385 d!51707))

(declare-fun d!51709 () Bool)

(declare-fun e!112896 () Bool)

(assert (=> d!51709 e!112896))

(declare-fun res!81274 () Bool)

(assert (=> d!51709 (=> res!81274 e!112896)))

(declare-fun lt!85076 () Bool)

(assert (=> d!51709 (= res!81274 (not lt!85076))))

(declare-fun lt!85074 () Bool)

(assert (=> d!51709 (= lt!85076 lt!85074)))

(declare-fun lt!85073 () Unit!5227)

(declare-fun e!112895 () Unit!5227)

(assert (=> d!51709 (= lt!85073 e!112895)))

(declare-fun c!30532 () Bool)

(assert (=> d!51709 (= c!30532 lt!85074)))

(assert (=> d!51709 (= lt!85074 (containsKey!186 (toList!1091 lt!84897) (_1!1627 (tuple2!3233 key!828 v!309))))))

(assert (=> d!51709 (= (contains!1142 lt!84897 (_1!1627 (tuple2!3233 key!828 v!309))) lt!85076)))

(declare-fun b!171016 () Bool)

(declare-fun lt!85075 () Unit!5227)

(assert (=> b!171016 (= e!112895 lt!85075)))

(assert (=> b!171016 (= lt!85075 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84897) (_1!1627 (tuple2!3233 key!828 v!309))))))

(assert (=> b!171016 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84897) (_1!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun b!171017 () Bool)

(declare-fun Unit!5239 () Unit!5227)

(assert (=> b!171017 (= e!112895 Unit!5239)))

(declare-fun b!171018 () Bool)

(assert (=> b!171018 (= e!112896 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84897) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(assert (= (and d!51709 c!30532) b!171016))

(assert (= (and d!51709 (not c!30532)) b!171017))

(assert (= (and d!51709 (not res!81274)) b!171018))

(declare-fun m!198971 () Bool)

(assert (=> d!51709 m!198971))

(declare-fun m!198973 () Bool)

(assert (=> b!171016 m!198973))

(assert (=> b!171016 m!198639))

(assert (=> b!171016 m!198639))

(declare-fun m!198975 () Bool)

(assert (=> b!171016 m!198975))

(assert (=> b!171018 m!198639))

(assert (=> b!171018 m!198639))

(assert (=> b!171018 m!198975))

(assert (=> d!51623 d!51709))

(declare-fun b!171019 () Bool)

(declare-fun e!112897 () Option!188)

(assert (=> b!171019 (= e!112897 (Some!187 (_2!1627 (h!2816 lt!84895))))))

(declare-fun e!112898 () Option!188)

(declare-fun b!171021 () Bool)

(assert (=> b!171021 (= e!112898 (getValueByKey!182 (t!6996 lt!84895) (_1!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun b!171022 () Bool)

(assert (=> b!171022 (= e!112898 None!186)))

(declare-fun c!30533 () Bool)

(declare-fun d!51711 () Bool)

(assert (=> d!51711 (= c!30533 (and ((_ is Cons!2199) lt!84895) (= (_1!1627 (h!2816 lt!84895)) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(assert (=> d!51711 (= (getValueByKey!182 lt!84895 (_1!1627 (tuple2!3233 key!828 v!309))) e!112897)))

(declare-fun b!171020 () Bool)

(assert (=> b!171020 (= e!112897 e!112898)))

(declare-fun c!30534 () Bool)

(assert (=> b!171020 (= c!30534 (and ((_ is Cons!2199) lt!84895) (not (= (_1!1627 (h!2816 lt!84895)) (_1!1627 (tuple2!3233 key!828 v!309))))))))

(assert (= (and d!51711 c!30533) b!171019))

(assert (= (and d!51711 (not c!30533)) b!171020))

(assert (= (and b!171020 c!30534) b!171021))

(assert (= (and b!171020 (not c!30534)) b!171022))

(declare-fun m!198977 () Bool)

(assert (=> b!171021 m!198977))

(assert (=> d!51623 d!51711))

(declare-fun d!51713 () Bool)

(assert (=> d!51713 (= (getValueByKey!182 lt!84895 (_1!1627 (tuple2!3233 key!828 v!309))) (Some!187 (_2!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun lt!85079 () Unit!5227)

(declare-fun choose!933 (List!2203 (_ BitVec 64) V!4985) Unit!5227)

(assert (=> d!51713 (= lt!85079 (choose!933 lt!84895 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun e!112901 () Bool)

(assert (=> d!51713 e!112901))

(declare-fun res!81279 () Bool)

(assert (=> d!51713 (=> (not res!81279) (not e!112901))))

(assert (=> d!51713 (= res!81279 (isStrictlySorted!326 lt!84895))))

(assert (=> d!51713 (= (lemmaContainsTupThenGetReturnValue!98 lt!84895 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309))) lt!85079)))

(declare-fun b!171027 () Bool)

(declare-fun res!81280 () Bool)

(assert (=> b!171027 (=> (not res!81280) (not e!112901))))

(assert (=> b!171027 (= res!81280 (containsKey!186 lt!84895 (_1!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun b!171028 () Bool)

(assert (=> b!171028 (= e!112901 (contains!1144 lt!84895 (tuple2!3233 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309)))))))

(assert (= (and d!51713 res!81279) b!171027))

(assert (= (and b!171027 res!81280) b!171028))

(assert (=> d!51713 m!198633))

(declare-fun m!198979 () Bool)

(assert (=> d!51713 m!198979))

(declare-fun m!198981 () Bool)

(assert (=> d!51713 m!198981))

(declare-fun m!198983 () Bool)

(assert (=> b!171027 m!198983))

(declare-fun m!198985 () Bool)

(assert (=> b!171028 m!198985))

(assert (=> d!51623 d!51713))

(declare-fun b!171049 () Bool)

(declare-fun e!112912 () List!2203)

(assert (=> b!171049 (= e!112912 (insertStrictlySorted!101 (t!6996 (toList!1091 (map!1834 thiss!1248))) (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun b!171050 () Bool)

(declare-fun e!112914 () List!2203)

(declare-fun call!17410 () List!2203)

(assert (=> b!171050 (= e!112914 call!17410)))

(declare-fun b!171051 () Bool)

(declare-fun e!112913 () List!2203)

(declare-fun call!17409 () List!2203)

(assert (=> b!171051 (= e!112913 call!17409)))

(declare-fun bm!17406 () Bool)

(declare-fun call!17411 () List!2203)

(assert (=> bm!17406 (= call!17411 call!17410)))

(declare-fun b!171052 () Bool)

(declare-fun e!112916 () List!2203)

(assert (=> b!171052 (= e!112914 e!112916)))

(declare-fun c!30543 () Bool)

(assert (=> b!171052 (= c!30543 (and ((_ is Cons!2199) (toList!1091 (map!1834 thiss!1248))) (= (_1!1627 (h!2816 (toList!1091 (map!1834 thiss!1248)))) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(declare-fun d!51715 () Bool)

(declare-fun e!112915 () Bool)

(assert (=> d!51715 e!112915))

(declare-fun res!81285 () Bool)

(assert (=> d!51715 (=> (not res!81285) (not e!112915))))

(declare-fun lt!85082 () List!2203)

(assert (=> d!51715 (= res!81285 (isStrictlySorted!326 lt!85082))))

(assert (=> d!51715 (= lt!85082 e!112914)))

(declare-fun c!30545 () Bool)

(assert (=> d!51715 (= c!30545 (and ((_ is Cons!2199) (toList!1091 (map!1834 thiss!1248))) (bvslt (_1!1627 (h!2816 (toList!1091 (map!1834 thiss!1248)))) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(assert (=> d!51715 (isStrictlySorted!326 (toList!1091 (map!1834 thiss!1248)))))

(assert (=> d!51715 (= (insertStrictlySorted!101 (toList!1091 (map!1834 thiss!1248)) (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309))) lt!85082)))

(declare-fun b!171053 () Bool)

(assert (=> b!171053 (= e!112916 call!17411)))

(declare-fun c!30544 () Bool)

(declare-fun b!171054 () Bool)

(assert (=> b!171054 (= e!112912 (ite c!30543 (t!6996 (toList!1091 (map!1834 thiss!1248))) (ite c!30544 (Cons!2199 (h!2816 (toList!1091 (map!1834 thiss!1248))) (t!6996 (toList!1091 (map!1834 thiss!1248)))) Nil!2200)))))

(declare-fun bm!17407 () Bool)

(assert (=> bm!17407 (= call!17409 call!17411)))

(declare-fun b!171055 () Bool)

(assert (=> b!171055 (= c!30544 (and ((_ is Cons!2199) (toList!1091 (map!1834 thiss!1248))) (bvsgt (_1!1627 (h!2816 (toList!1091 (map!1834 thiss!1248)))) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(assert (=> b!171055 (= e!112916 e!112913)))

(declare-fun bm!17408 () Bool)

(declare-fun $colon$colon!96 (List!2203 tuple2!3232) List!2203)

(assert (=> bm!17408 (= call!17410 ($colon$colon!96 e!112912 (ite c!30545 (h!2816 (toList!1091 (map!1834 thiss!1248))) (tuple2!3233 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309))))))))

(declare-fun c!30546 () Bool)

(assert (=> bm!17408 (= c!30546 c!30545)))

(declare-fun b!171056 () Bool)

(declare-fun res!81286 () Bool)

(assert (=> b!171056 (=> (not res!81286) (not e!112915))))

(assert (=> b!171056 (= res!81286 (containsKey!186 lt!85082 (_1!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun b!171057 () Bool)

(assert (=> b!171057 (= e!112913 call!17409)))

(declare-fun b!171058 () Bool)

(assert (=> b!171058 (= e!112915 (contains!1144 lt!85082 (tuple2!3233 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309)))))))

(assert (= (and d!51715 c!30545) b!171050))

(assert (= (and d!51715 (not c!30545)) b!171052))

(assert (= (and b!171052 c!30543) b!171053))

(assert (= (and b!171052 (not c!30543)) b!171055))

(assert (= (and b!171055 c!30544) b!171057))

(assert (= (and b!171055 (not c!30544)) b!171051))

(assert (= (or b!171057 b!171051) bm!17407))

(assert (= (or b!171053 bm!17407) bm!17406))

(assert (= (or b!171050 bm!17406) bm!17408))

(assert (= (and bm!17408 c!30546) b!171049))

(assert (= (and bm!17408 (not c!30546)) b!171054))

(assert (= (and d!51715 res!81285) b!171056))

(assert (= (and b!171056 res!81286) b!171058))

(declare-fun m!198987 () Bool)

(assert (=> b!171049 m!198987))

(declare-fun m!198989 () Bool)

(assert (=> b!171058 m!198989))

(declare-fun m!198991 () Bool)

(assert (=> bm!17408 m!198991))

(declare-fun m!198993 () Bool)

(assert (=> b!171056 m!198993))

(declare-fun m!198995 () Bool)

(assert (=> d!51715 m!198995))

(declare-fun m!198997 () Bool)

(assert (=> d!51715 m!198997))

(assert (=> d!51623 d!51715))

(declare-fun d!51717 () Bool)

(declare-fun e!112918 () Bool)

(assert (=> d!51717 e!112918))

(declare-fun res!81287 () Bool)

(assert (=> d!51717 (=> res!81287 e!112918)))

(declare-fun lt!85086 () Bool)

(assert (=> d!51717 (= res!81287 (not lt!85086))))

(declare-fun lt!85084 () Bool)

(assert (=> d!51717 (= lt!85086 lt!85084)))

(declare-fun lt!85083 () Unit!5227)

(declare-fun e!112917 () Unit!5227)

(assert (=> d!51717 (= lt!85083 e!112917)))

(declare-fun c!30547 () Bool)

(assert (=> d!51717 (= c!30547 lt!85084)))

(assert (=> d!51717 (= lt!85084 (containsKey!186 (toList!1091 lt!84962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!51717 (= (contains!1142 lt!84962 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85086)))

(declare-fun b!171059 () Bool)

(declare-fun lt!85085 () Unit!5227)

(assert (=> b!171059 (= e!112917 lt!85085)))

(assert (=> b!171059 (= lt!85085 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171059 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171060 () Bool)

(declare-fun Unit!5240 () Unit!5227)

(assert (=> b!171060 (= e!112917 Unit!5240)))

(declare-fun b!171061 () Bool)

(assert (=> b!171061 (= e!112918 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51717 c!30547) b!171059))

(assert (= (and d!51717 (not c!30547)) b!171060))

(assert (= (and d!51717 (not res!81287)) b!171061))

(declare-fun m!198999 () Bool)

(assert (=> d!51717 m!198999))

(declare-fun m!199001 () Bool)

(assert (=> b!171059 m!199001))

(declare-fun m!199003 () Bool)

(assert (=> b!171059 m!199003))

(assert (=> b!171059 m!199003))

(declare-fun m!199005 () Bool)

(assert (=> b!171059 m!199005))

(assert (=> b!171061 m!199003))

(assert (=> b!171061 m!199003))

(assert (=> b!171061 m!199005))

(assert (=> bm!17379 d!51717))

(declare-fun b!171062 () Bool)

(declare-fun e!112920 () Bool)

(declare-fun call!17412 () Bool)

(assert (=> b!171062 (= e!112920 call!17412)))

(declare-fun b!171063 () Bool)

(declare-fun e!112921 () Bool)

(assert (=> b!171063 (= e!112921 call!17412)))

(declare-fun b!171064 () Bool)

(declare-fun e!112919 () Bool)

(assert (=> b!171064 (= e!112919 e!112920)))

(declare-fun c!30548 () Bool)

(assert (=> b!171064 (= c!30548 (validKeyInArray!0 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(declare-fun d!51719 () Bool)

(declare-fun res!81288 () Bool)

(assert (=> d!51719 (=> res!81288 e!112919)))

(assert (=> d!51719 (= res!81288 (bvsge #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))))))

(assert (=> d!51719 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5385 lt!84854) (mask!8381 lt!84854)) e!112919)))

(declare-fun b!171065 () Bool)

(assert (=> b!171065 (= e!112920 e!112921)))

(declare-fun lt!85089 () (_ BitVec 64))

(assert (=> b!171065 (= lt!85089 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000))))

(declare-fun lt!85088 () Unit!5227)

(assert (=> b!171065 (= lt!85088 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5385 lt!84854) lt!85089 #b00000000000000000000000000000000))))

(assert (=> b!171065 (arrayContainsKey!0 (_keys!5385 lt!84854) lt!85089 #b00000000000000000000000000000000)))

(declare-fun lt!85087 () Unit!5227)

(assert (=> b!171065 (= lt!85087 lt!85088)))

(declare-fun res!81289 () Bool)

(assert (=> b!171065 (= res!81289 (= (seekEntryOrOpen!0 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000) (_keys!5385 lt!84854) (mask!8381 lt!84854)) (Found!545 #b00000000000000000000000000000000)))))

(assert (=> b!171065 (=> (not res!81289) (not e!112921))))

(declare-fun bm!17409 () Bool)

(assert (=> bm!17409 (= call!17412 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5385 lt!84854) (mask!8381 lt!84854)))))

(assert (= (and d!51719 (not res!81288)) b!171064))

(assert (= (and b!171064 c!30548) b!171065))

(assert (= (and b!171064 (not c!30548)) b!171062))

(assert (= (and b!171065 res!81289) b!171063))

(assert (= (or b!171063 b!171062) bm!17409))

(declare-fun m!199007 () Bool)

(assert (=> b!171064 m!199007))

(assert (=> b!171064 m!199007))

(declare-fun m!199009 () Bool)

(assert (=> b!171064 m!199009))

(assert (=> b!171065 m!199007))

(declare-fun m!199011 () Bool)

(assert (=> b!171065 m!199011))

(declare-fun m!199013 () Bool)

(assert (=> b!171065 m!199013))

(assert (=> b!171065 m!199007))

(declare-fun m!199015 () Bool)

(assert (=> b!171065 m!199015))

(declare-fun m!199017 () Bool)

(assert (=> bm!17409 m!199017))

(assert (=> b!170856 d!51719))

(declare-fun d!51721 () Bool)

(declare-fun e!112922 () Bool)

(assert (=> d!51721 e!112922))

(declare-fun res!81291 () Bool)

(assert (=> d!51721 (=> (not res!81291) (not e!112922))))

(declare-fun lt!85093 () ListLongMap!2151)

(assert (=> d!51721 (= res!81291 (contains!1142 lt!85093 (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun lt!85091 () List!2203)

(assert (=> d!51721 (= lt!85093 (ListLongMap!2152 lt!85091))))

(declare-fun lt!85092 () Unit!5227)

(declare-fun lt!85090 () Unit!5227)

(assert (=> d!51721 (= lt!85092 lt!85090)))

(assert (=> d!51721 (= (getValueByKey!182 lt!85091 (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) (Some!187 (_2!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!51721 (= lt!85090 (lemmaContainsTupThenGetReturnValue!98 lt!85091 (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!51721 (= lt!85091 (insertStrictlySorted!101 (toList!1091 (ite c!30490 call!17383 (ite c!30488 call!17380 call!17384))) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!51721 (= (+!238 (ite c!30490 call!17383 (ite c!30488 call!17380 call!17384)) (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85093)))

(declare-fun b!171066 () Bool)

(declare-fun res!81290 () Bool)

(assert (=> b!171066 (=> (not res!81290) (not e!112922))))

(assert (=> b!171066 (= res!81290 (= (getValueByKey!182 (toList!1091 lt!85093) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) (Some!187 (_2!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171067 () Bool)

(assert (=> b!171067 (= e!112922 (contains!1144 (toList!1091 lt!85093) (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (= (and d!51721 res!81291) b!171066))

(assert (= (and b!171066 res!81290) b!171067))

(declare-fun m!199019 () Bool)

(assert (=> d!51721 m!199019))

(declare-fun m!199021 () Bool)

(assert (=> d!51721 m!199021))

(declare-fun m!199023 () Bool)

(assert (=> d!51721 m!199023))

(declare-fun m!199025 () Bool)

(assert (=> d!51721 m!199025))

(declare-fun m!199027 () Bool)

(assert (=> b!171066 m!199027))

(declare-fun m!199029 () Bool)

(assert (=> b!171067 m!199029))

(assert (=> bm!17382 d!51721))

(declare-fun d!51723 () Bool)

(declare-fun e!112924 () Bool)

(assert (=> d!51723 e!112924))

(declare-fun res!81292 () Bool)

(assert (=> d!51723 (=> res!81292 e!112924)))

(declare-fun lt!85097 () Bool)

(assert (=> d!51723 (= res!81292 (not lt!85097))))

(declare-fun lt!85095 () Bool)

(assert (=> d!51723 (= lt!85097 lt!85095)))

(declare-fun lt!85094 () Unit!5227)

(declare-fun e!112923 () Unit!5227)

(assert (=> d!51723 (= lt!85094 e!112923)))

(declare-fun c!30549 () Bool)

(assert (=> d!51723 (= c!30549 lt!85095)))

(assert (=> d!51723 (= lt!85095 (containsKey!186 (toList!1091 lt!84992) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!51723 (= (contains!1142 lt!84992 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85097)))

(declare-fun b!171068 () Bool)

(declare-fun lt!85096 () Unit!5227)

(assert (=> b!171068 (= e!112923 lt!85096)))

(assert (=> b!171068 (= lt!85096 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84992) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> b!171068 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84992) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!171069 () Bool)

(declare-fun Unit!5241 () Unit!5227)

(assert (=> b!171069 (= e!112923 Unit!5241)))

(declare-fun b!171070 () Bool)

(assert (=> b!171070 (= e!112924 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84992) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!51723 c!30549) b!171068))

(assert (= (and d!51723 (not c!30549)) b!171069))

(assert (= (and d!51723 (not res!81292)) b!171070))

(declare-fun m!199031 () Bool)

(assert (=> d!51723 m!199031))

(declare-fun m!199033 () Bool)

(assert (=> b!171068 m!199033))

(assert (=> b!171068 m!198769))

(assert (=> b!171068 m!198769))

(declare-fun m!199035 () Bool)

(assert (=> b!171068 m!199035))

(assert (=> b!171070 m!198769))

(assert (=> b!171070 m!198769))

(assert (=> b!171070 m!199035))

(assert (=> d!51635 d!51723))

(declare-fun b!171071 () Bool)

(declare-fun e!112925 () Option!188)

(assert (=> b!171071 (= e!112925 (Some!187 (_2!1627 (h!2816 lt!84990))))))

(declare-fun b!171073 () Bool)

(declare-fun e!112926 () Option!188)

(assert (=> b!171073 (= e!112926 (getValueByKey!182 (t!6996 lt!84990) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!171074 () Bool)

(assert (=> b!171074 (= e!112926 None!186)))

(declare-fun d!51725 () Bool)

(declare-fun c!30550 () Bool)

(assert (=> d!51725 (= c!30550 (and ((_ is Cons!2199) lt!84990) (= (_1!1627 (h!2816 lt!84990)) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!51725 (= (getValueByKey!182 lt!84990 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!112925)))

(declare-fun b!171072 () Bool)

(assert (=> b!171072 (= e!112925 e!112926)))

(declare-fun c!30551 () Bool)

(assert (=> b!171072 (= c!30551 (and ((_ is Cons!2199) lt!84990) (not (= (_1!1627 (h!2816 lt!84990)) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (= (and d!51725 c!30550) b!171071))

(assert (= (and d!51725 (not c!30550)) b!171072))

(assert (= (and b!171072 c!30551) b!171073))

(assert (= (and b!171072 (not c!30551)) b!171074))

(declare-fun m!199037 () Bool)

(assert (=> b!171073 m!199037))

(assert (=> d!51635 d!51725))

(declare-fun d!51727 () Bool)

(assert (=> d!51727 (= (getValueByKey!182 lt!84990 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!187 (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!85098 () Unit!5227)

(assert (=> d!51727 (= lt!85098 (choose!933 lt!84990 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!112927 () Bool)

(assert (=> d!51727 e!112927))

(declare-fun res!81293 () Bool)

(assert (=> d!51727 (=> (not res!81293) (not e!112927))))

(assert (=> d!51727 (= res!81293 (isStrictlySorted!326 lt!84990))))

(assert (=> d!51727 (= (lemmaContainsTupThenGetReturnValue!98 lt!84990 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85098)))

(declare-fun b!171075 () Bool)

(declare-fun res!81294 () Bool)

(assert (=> b!171075 (=> (not res!81294) (not e!112927))))

(assert (=> b!171075 (= res!81294 (containsKey!186 lt!84990 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!171076 () Bool)

(assert (=> b!171076 (= e!112927 (contains!1144 lt!84990 (tuple2!3233 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!51727 res!81293) b!171075))

(assert (= (and b!171075 res!81294) b!171076))

(assert (=> d!51727 m!198763))

(declare-fun m!199039 () Bool)

(assert (=> d!51727 m!199039))

(declare-fun m!199041 () Bool)

(assert (=> d!51727 m!199041))

(declare-fun m!199043 () Bool)

(assert (=> b!171075 m!199043))

(declare-fun m!199045 () Bool)

(assert (=> b!171076 m!199045))

(assert (=> d!51635 d!51727))

(declare-fun b!171077 () Bool)

(declare-fun e!112928 () List!2203)

(assert (=> b!171077 (= e!112928 (insertStrictlySorted!101 (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!171078 () Bool)

(declare-fun e!112930 () List!2203)

(declare-fun call!17414 () List!2203)

(assert (=> b!171078 (= e!112930 call!17414)))

(declare-fun b!171079 () Bool)

(declare-fun e!112929 () List!2203)

(declare-fun call!17413 () List!2203)

(assert (=> b!171079 (= e!112929 call!17413)))

(declare-fun bm!17410 () Bool)

(declare-fun call!17415 () List!2203)

(assert (=> bm!17410 (= call!17415 call!17414)))

(declare-fun b!171080 () Bool)

(declare-fun e!112932 () List!2203)

(assert (=> b!171080 (= e!112930 e!112932)))

(declare-fun c!30552 () Bool)

(assert (=> b!171080 (= c!30552 (and ((_ is Cons!2199) (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (= (_1!1627 (h!2816 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun d!51729 () Bool)

(declare-fun e!112931 () Bool)

(assert (=> d!51729 e!112931))

(declare-fun res!81295 () Bool)

(assert (=> d!51729 (=> (not res!81295) (not e!112931))))

(declare-fun lt!85099 () List!2203)

(assert (=> d!51729 (= res!81295 (isStrictlySorted!326 lt!85099))))

(assert (=> d!51729 (= lt!85099 e!112930)))

(declare-fun c!30554 () Bool)

(assert (=> d!51729 (= c!30554 (and ((_ is Cons!2199) (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (bvslt (_1!1627 (h!2816 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!51729 (isStrictlySorted!326 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))))

(assert (=> d!51729 (= (insertStrictlySorted!101 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85099)))

(declare-fun b!171081 () Bool)

(assert (=> b!171081 (= e!112932 call!17415)))

(declare-fun c!30553 () Bool)

(declare-fun b!171082 () Bool)

(assert (=> b!171082 (= e!112928 (ite c!30552 (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (ite c!30553 (Cons!2199 (h!2816 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) Nil!2200)))))

(declare-fun bm!17411 () Bool)

(assert (=> bm!17411 (= call!17413 call!17415)))

(declare-fun b!171083 () Bool)

(assert (=> b!171083 (= c!30553 (and ((_ is Cons!2199) (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (bvsgt (_1!1627 (h!2816 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> b!171083 (= e!112932 e!112929)))

(declare-fun bm!17412 () Bool)

(assert (=> bm!17412 (= call!17414 ($colon$colon!96 e!112928 (ite c!30554 (h!2816 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (tuple2!3233 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!30555 () Bool)

(assert (=> bm!17412 (= c!30555 c!30554)))

(declare-fun b!171084 () Bool)

(declare-fun res!81296 () Bool)

(assert (=> b!171084 (=> (not res!81296) (not e!112931))))

(assert (=> b!171084 (= res!81296 (containsKey!186 lt!85099 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!171085 () Bool)

(assert (=> b!171085 (= e!112929 call!17413)))

(declare-fun b!171086 () Bool)

(assert (=> b!171086 (= e!112931 (contains!1144 lt!85099 (tuple2!3233 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!51729 c!30554) b!171078))

(assert (= (and d!51729 (not c!30554)) b!171080))

(assert (= (and b!171080 c!30552) b!171081))

(assert (= (and b!171080 (not c!30552)) b!171083))

(assert (= (and b!171083 c!30553) b!171085))

(assert (= (and b!171083 (not c!30553)) b!171079))

(assert (= (or b!171085 b!171079) bm!17411))

(assert (= (or b!171081 bm!17411) bm!17410))

(assert (= (or b!171078 bm!17410) bm!17412))

(assert (= (and bm!17412 c!30555) b!171077))

(assert (= (and bm!17412 (not c!30555)) b!171082))

(assert (= (and d!51729 res!81295) b!171084))

(assert (= (and b!171084 res!81296) b!171086))

(declare-fun m!199047 () Bool)

(assert (=> b!171077 m!199047))

(declare-fun m!199049 () Bool)

(assert (=> b!171086 m!199049))

(declare-fun m!199051 () Bool)

(assert (=> bm!17412 m!199051))

(declare-fun m!199053 () Bool)

(assert (=> b!171084 m!199053))

(declare-fun m!199055 () Bool)

(assert (=> d!51729 m!199055))

(declare-fun m!199057 () Bool)

(assert (=> d!51729 m!199057))

(assert (=> d!51635 d!51729))

(assert (=> d!51629 d!51627))

(declare-fun d!51731 () Bool)

(assert (=> d!51731 (= (+!238 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(assert (=> d!51731 true))

(declare-fun _$7!128 () Unit!5227)

(assert (=> d!51731 (= (choose!929 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) (zeroValue!3397 thiss!1248) v!309 (minValue!3397 thiss!1248) (defaultEntry!3554 thiss!1248)) _$7!128)))

(declare-fun bs!7036 () Bool)

(assert (= bs!7036 d!51731))

(assert (=> bs!7036 m!198549))

(assert (=> bs!7036 m!198549))

(assert (=> bs!7036 m!198557))

(assert (=> bs!7036 m!198553))

(assert (=> d!51629 d!51731))

(assert (=> d!51629 d!51649))

(assert (=> d!51629 d!51633))

(assert (=> d!51629 d!51635))

(declare-fun b!171087 () Bool)

(declare-fun e!112935 () Bool)

(assert (=> b!171087 (= e!112935 (contains!1145 Nil!2202 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(declare-fun b!171088 () Bool)

(declare-fun e!112934 () Bool)

(declare-fun e!112933 () Bool)

(assert (=> b!171088 (= e!112934 e!112933)))

(declare-fun res!81297 () Bool)

(assert (=> b!171088 (=> (not res!81297) (not e!112933))))

(assert (=> b!171088 (= res!81297 (not e!112935))))

(declare-fun res!81298 () Bool)

(assert (=> b!171088 (=> (not res!81298) (not e!112935))))

(assert (=> b!171088 (= res!81298 (validKeyInArray!0 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(declare-fun d!51733 () Bool)

(declare-fun res!81299 () Bool)

(assert (=> d!51733 (=> res!81299 e!112934)))

(assert (=> d!51733 (= res!81299 (bvsge #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))))))

(assert (=> d!51733 (= (arrayNoDuplicates!0 (_keys!5385 lt!84854) #b00000000000000000000000000000000 Nil!2202) e!112934)))

(declare-fun b!171089 () Bool)

(declare-fun e!112936 () Bool)

(assert (=> b!171089 (= e!112933 e!112936)))

(declare-fun c!30556 () Bool)

(assert (=> b!171089 (= c!30556 (validKeyInArray!0 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(declare-fun bm!17413 () Bool)

(declare-fun call!17416 () Bool)

(assert (=> bm!17413 (= call!17416 (arrayNoDuplicates!0 (_keys!5385 lt!84854) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30556 (Cons!2201 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000) Nil!2202) Nil!2202)))))

(declare-fun b!171090 () Bool)

(assert (=> b!171090 (= e!112936 call!17416)))

(declare-fun b!171091 () Bool)

(assert (=> b!171091 (= e!112936 call!17416)))

(assert (= (and d!51733 (not res!81299)) b!171088))

(assert (= (and b!171088 res!81298) b!171087))

(assert (= (and b!171088 res!81297) b!171089))

(assert (= (and b!171089 c!30556) b!171090))

(assert (= (and b!171089 (not c!30556)) b!171091))

(assert (= (or b!171090 b!171091) bm!17413))

(assert (=> b!171087 m!199007))

(assert (=> b!171087 m!199007))

(declare-fun m!199059 () Bool)

(assert (=> b!171087 m!199059))

(assert (=> b!171088 m!199007))

(assert (=> b!171088 m!199007))

(assert (=> b!171088 m!199009))

(assert (=> b!171089 m!199007))

(assert (=> b!171089 m!199007))

(assert (=> b!171089 m!199009))

(assert (=> bm!17413 m!199007))

(declare-fun m!199061 () Bool)

(assert (=> bm!17413 m!199061))

(assert (=> b!170857 d!51733))

(assert (=> b!170840 d!51651))

(declare-fun d!51735 () Bool)

(assert (=> d!51735 (= (apply!129 lt!84962 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1933 (getValueByKey!182 (toList!1091 lt!84962) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7037 () Bool)

(assert (= bs!7037 d!51735))

(assert (=> bs!7037 m!198787))

(assert (=> bs!7037 m!198787))

(declare-fun m!199063 () Bool)

(assert (=> bs!7037 m!199063))

(assert (=> b!170841 d!51735))

(assert (=> b!170777 d!51671))

(assert (=> b!170777 d!51673))

(declare-fun b!171092 () Bool)

(declare-fun lt!85103 () Unit!5227)

(declare-fun lt!85100 () Unit!5227)

(assert (=> b!171092 (= lt!85103 lt!85100)))

(declare-fun lt!85106 () (_ BitVec 64))

(declare-fun lt!85105 () (_ BitVec 64))

(declare-fun lt!85101 () ListLongMap!2151)

(declare-fun lt!85102 () V!4985)

(assert (=> b!171092 (not (contains!1142 (+!238 lt!85101 (tuple2!3233 lt!85106 lt!85102)) lt!85105))))

(assert (=> b!171092 (= lt!85100 (addStillNotContains!72 lt!85101 lt!85106 lt!85102 lt!85105))))

(assert (=> b!171092 (= lt!85105 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!171092 (= lt!85102 (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171092 (= lt!85106 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!17417 () ListLongMap!2151)

(assert (=> b!171092 (= lt!85101 call!17417)))

(declare-fun e!112939 () ListLongMap!2151)

(assert (=> b!171092 (= e!112939 (+!238 call!17417 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!171093 () Bool)

(declare-fun e!112938 () Bool)

(declare-fun e!112942 () Bool)

(assert (=> b!171093 (= e!112938 e!112942)))

(declare-fun c!30559 () Bool)

(declare-fun e!112940 () Bool)

(assert (=> b!171093 (= c!30559 e!112940)))

(declare-fun res!81300 () Bool)

(assert (=> b!171093 (=> (not res!81300) (not e!112940))))

(assert (=> b!171093 (= res!81300 (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun b!171094 () Bool)

(declare-fun e!112943 () Bool)

(assert (=> b!171094 (= e!112942 e!112943)))

(assert (=> b!171094 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun res!81301 () Bool)

(declare-fun lt!85104 () ListLongMap!2151)

(assert (=> b!171094 (= res!81301 (contains!1142 lt!85104 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171094 (=> (not res!81301) (not e!112943))))

(declare-fun b!171095 () Bool)

(assert (=> b!171095 (= e!112940 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171095 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!171096 () Bool)

(declare-fun e!112941 () Bool)

(assert (=> b!171096 (= e!112942 e!112941)))

(declare-fun c!30558 () Bool)

(assert (=> b!171096 (= c!30558 (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun b!171097 () Bool)

(declare-fun e!112937 () ListLongMap!2151)

(assert (=> b!171097 (= e!112937 e!112939)))

(declare-fun c!30560 () Bool)

(assert (=> b!171097 (= c!30560 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171098 () Bool)

(assert (=> b!171098 (= e!112941 (= lt!85104 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248))))))

(declare-fun b!171099 () Bool)

(assert (=> b!171099 (= e!112941 (isEmpty!437 lt!85104))))

(declare-fun b!171100 () Bool)

(assert (=> b!171100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> b!171100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3671 (_values!3537 thiss!1248))))))

(assert (=> b!171100 (= e!112943 (= (apply!129 lt!85104 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171101 () Bool)

(declare-fun res!81303 () Bool)

(assert (=> b!171101 (=> (not res!81303) (not e!112938))))

(assert (=> b!171101 (= res!81303 (not (contains!1142 lt!85104 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171102 () Bool)

(assert (=> b!171102 (= e!112939 call!17417)))

(declare-fun b!171103 () Bool)

(assert (=> b!171103 (= e!112937 (ListLongMap!2152 Nil!2200))))

(declare-fun d!51737 () Bool)

(assert (=> d!51737 e!112938))

(declare-fun res!81302 () Bool)

(assert (=> d!51737 (=> (not res!81302) (not e!112938))))

(assert (=> d!51737 (= res!81302 (not (contains!1142 lt!85104 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51737 (= lt!85104 e!112937)))

(declare-fun c!30557 () Bool)

(assert (=> d!51737 (= c!30557 (bvsge #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> d!51737 (validMask!0 (mask!8381 thiss!1248))))

(assert (=> d!51737 (= (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) lt!85104)))

(declare-fun bm!17414 () Bool)

(assert (=> bm!17414 (= call!17417 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248)))))

(assert (= (and d!51737 c!30557) b!171103))

(assert (= (and d!51737 (not c!30557)) b!171097))

(assert (= (and b!171097 c!30560) b!171092))

(assert (= (and b!171097 (not c!30560)) b!171102))

(assert (= (or b!171092 b!171102) bm!17414))

(assert (= (and d!51737 res!81302) b!171101))

(assert (= (and b!171101 res!81303) b!171093))

(assert (= (and b!171093 res!81300) b!171095))

(assert (= (and b!171093 c!30559) b!171094))

(assert (= (and b!171093 (not c!30559)) b!171096))

(assert (= (and b!171094 res!81301) b!171100))

(assert (= (and b!171096 c!30558) b!171098))

(assert (= (and b!171096 (not c!30558)) b!171099))

(declare-fun b_lambda!6881 () Bool)

(assert (=> (not b_lambda!6881) (not b!171092)))

(assert (=> b!171092 t!6999))

(declare-fun b_and!10633 () Bool)

(assert (= b_and!10631 (and (=> t!6999 result!4553) b_and!10633)))

(declare-fun b_lambda!6883 () Bool)

(assert (=> (not b_lambda!6883) (not b!171100)))

(assert (=> b!171100 t!6999))

(declare-fun b_and!10635 () Bool)

(assert (= b_and!10633 (and (=> t!6999 result!4553) b_and!10635)))

(declare-fun m!199065 () Bool)

(assert (=> b!171098 m!199065))

(declare-fun m!199067 () Bool)

(assert (=> b!171101 m!199067))

(assert (=> b!171095 m!198643))

(assert (=> b!171095 m!198643))

(assert (=> b!171095 m!198645))

(declare-fun m!199069 () Bool)

(assert (=> d!51737 m!199069))

(assert (=> d!51737 m!198667))

(assert (=> b!171092 m!198655))

(assert (=> b!171092 m!198653))

(assert (=> b!171092 m!198653))

(assert (=> b!171092 m!198655))

(assert (=> b!171092 m!198657))

(assert (=> b!171092 m!198643))

(declare-fun m!199071 () Bool)

(assert (=> b!171092 m!199071))

(declare-fun m!199073 () Bool)

(assert (=> b!171092 m!199073))

(declare-fun m!199075 () Bool)

(assert (=> b!171092 m!199075))

(declare-fun m!199077 () Bool)

(assert (=> b!171092 m!199077))

(assert (=> b!171092 m!199073))

(assert (=> b!171100 m!198655))

(assert (=> b!171100 m!198653))

(assert (=> b!171100 m!198653))

(assert (=> b!171100 m!198655))

(assert (=> b!171100 m!198657))

(assert (=> b!171100 m!198643))

(declare-fun m!199079 () Bool)

(assert (=> b!171100 m!199079))

(assert (=> b!171100 m!198643))

(assert (=> bm!17414 m!199065))

(assert (=> b!171094 m!198643))

(assert (=> b!171094 m!198643))

(declare-fun m!199081 () Bool)

(assert (=> b!171094 m!199081))

(assert (=> b!171097 m!198643))

(assert (=> b!171097 m!198643))

(assert (=> b!171097 m!198645))

(declare-fun m!199083 () Bool)

(assert (=> b!171099 m!199083))

(assert (=> bm!17387 d!51737))

(declare-fun d!51739 () Bool)

(declare-fun res!81314 () Bool)

(declare-fun e!112946 () Bool)

(assert (=> d!51739 (=> (not res!81314) (not e!112946))))

(assert (=> d!51739 (= res!81314 (validMask!0 (mask!8381 lt!84854)))))

(assert (=> d!51739 (= (simpleValid!135 lt!84854) e!112946)))

(declare-fun b!171114 () Bool)

(declare-fun res!81313 () Bool)

(assert (=> b!171114 (=> (not res!81313) (not e!112946))))

(declare-fun size!3676 (LongMapFixedSize!2224) (_ BitVec 32))

(assert (=> b!171114 (= res!81313 (= (size!3676 lt!84854) (bvadd (_size!1161 lt!84854) (bvsdiv (bvadd (extraKeys!3295 lt!84854) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!171112 () Bool)

(declare-fun res!81315 () Bool)

(assert (=> b!171112 (=> (not res!81315) (not e!112946))))

(assert (=> b!171112 (= res!81315 (and (= (size!3671 (_values!3537 lt!84854)) (bvadd (mask!8381 lt!84854) #b00000000000000000000000000000001)) (= (size!3670 (_keys!5385 lt!84854)) (size!3671 (_values!3537 lt!84854))) (bvsge (_size!1161 lt!84854) #b00000000000000000000000000000000) (bvsle (_size!1161 lt!84854) (bvadd (mask!8381 lt!84854) #b00000000000000000000000000000001))))))

(declare-fun b!171113 () Bool)

(declare-fun res!81312 () Bool)

(assert (=> b!171113 (=> (not res!81312) (not e!112946))))

(assert (=> b!171113 (= res!81312 (bvsge (size!3676 lt!84854) (_size!1161 lt!84854)))))

(declare-fun b!171115 () Bool)

(assert (=> b!171115 (= e!112946 (and (bvsge (extraKeys!3295 lt!84854) #b00000000000000000000000000000000) (bvsle (extraKeys!3295 lt!84854) #b00000000000000000000000000000011) (bvsge (_vacant!1161 lt!84854) #b00000000000000000000000000000000)))))

(assert (= (and d!51739 res!81314) b!171112))

(assert (= (and b!171112 res!81315) b!171113))

(assert (= (and b!171113 res!81312) b!171114))

(assert (= (and b!171114 res!81313) b!171115))

(declare-fun m!199085 () Bool)

(assert (=> d!51739 m!199085))

(declare-fun m!199087 () Bool)

(assert (=> b!171114 m!199087))

(assert (=> b!171113 m!199087))

(assert (=> d!51631 d!51739))

(declare-fun d!51741 () Bool)

(assert (=> d!51741 (contains!1142 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))) lt!84974)))

(declare-fun lt!85107 () Unit!5227)

(assert (=> d!51741 (= lt!85107 (choose!932 lt!84985 lt!84970 (zeroValue!3397 thiss!1248) lt!84974))))

(assert (=> d!51741 (contains!1142 lt!84985 lt!84974)))

(assert (=> d!51741 (= (addStillContains!105 lt!84985 lt!84970 (zeroValue!3397 thiss!1248) lt!84974) lt!85107)))

(declare-fun bs!7038 () Bool)

(assert (= bs!7038 d!51741))

(assert (=> bs!7038 m!198751))

(assert (=> bs!7038 m!198751))

(assert (=> bs!7038 m!198753))

(declare-fun m!199089 () Bool)

(assert (=> bs!7038 m!199089))

(declare-fun m!199091 () Bool)

(assert (=> bs!7038 m!199091))

(assert (=> b!170869 d!51741))

(declare-fun d!51743 () Bool)

(assert (=> d!51743 (= (apply!129 (+!238 lt!84972 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))) lt!84986) (get!1933 (getValueByKey!182 (toList!1091 (+!238 lt!84972 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))) lt!84986)))))

(declare-fun bs!7039 () Bool)

(assert (= bs!7039 d!51743))

(declare-fun m!199093 () Bool)

(assert (=> bs!7039 m!199093))

(assert (=> bs!7039 m!199093))

(declare-fun m!199095 () Bool)

(assert (=> bs!7039 m!199095))

(assert (=> b!170869 d!51743))

(assert (=> b!170869 d!51737))

(declare-fun d!51745 () Bool)

(declare-fun e!112947 () Bool)

(assert (=> d!51745 e!112947))

(declare-fun res!81317 () Bool)

(assert (=> d!51745 (=> (not res!81317) (not e!112947))))

(declare-fun lt!85111 () ListLongMap!2151)

(assert (=> d!51745 (= res!81317 (contains!1142 lt!85111 (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))

(declare-fun lt!85109 () List!2203)

(assert (=> d!51745 (= lt!85111 (ListLongMap!2152 lt!85109))))

(declare-fun lt!85110 () Unit!5227)

(declare-fun lt!85108 () Unit!5227)

(assert (=> d!51745 (= lt!85110 lt!85108)))

(assert (=> d!51745 (= (getValueByKey!182 lt!85109 (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))

(assert (=> d!51745 (= lt!85108 (lemmaContainsTupThenGetReturnValue!98 lt!85109 (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))

(assert (=> d!51745 (= lt!85109 (insertStrictlySorted!101 (toList!1091 lt!84985) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))

(assert (=> d!51745 (= (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))) lt!85111)))

(declare-fun b!171116 () Bool)

(declare-fun res!81316 () Bool)

(assert (=> b!171116 (=> (not res!81316) (not e!112947))))

(assert (=> b!171116 (= res!81316 (= (getValueByKey!182 (toList!1091 lt!85111) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))))))

(declare-fun b!171117 () Bool)

(assert (=> b!171117 (= e!112947 (contains!1144 (toList!1091 lt!85111) (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))))

(assert (= (and d!51745 res!81317) b!171116))

(assert (= (and b!171116 res!81316) b!171117))

(declare-fun m!199097 () Bool)

(assert (=> d!51745 m!199097))

(declare-fun m!199099 () Bool)

(assert (=> d!51745 m!199099))

(declare-fun m!199101 () Bool)

(assert (=> d!51745 m!199101))

(declare-fun m!199103 () Bool)

(assert (=> d!51745 m!199103))

(declare-fun m!199105 () Bool)

(assert (=> b!171116 m!199105))

(declare-fun m!199107 () Bool)

(assert (=> b!171117 m!199107))

(assert (=> b!170869 d!51745))

(declare-fun d!51747 () Bool)

(assert (=> d!51747 (= (apply!129 lt!84967 lt!84979) (get!1933 (getValueByKey!182 (toList!1091 lt!84967) lt!84979)))))

(declare-fun bs!7040 () Bool)

(assert (= bs!7040 d!51747))

(declare-fun m!199109 () Bool)

(assert (=> bs!7040 m!199109))

(assert (=> bs!7040 m!199109))

(declare-fun m!199111 () Bool)

(assert (=> bs!7040 m!199111))

(assert (=> b!170869 d!51747))

(declare-fun d!51749 () Bool)

(declare-fun e!112948 () Bool)

(assert (=> d!51749 e!112948))

(declare-fun res!81319 () Bool)

(assert (=> d!51749 (=> (not res!81319) (not e!112948))))

(declare-fun lt!85115 () ListLongMap!2151)

(assert (=> d!51749 (= res!81319 (contains!1142 lt!85115 (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85113 () List!2203)

(assert (=> d!51749 (= lt!85115 (ListLongMap!2152 lt!85113))))

(declare-fun lt!85114 () Unit!5227)

(declare-fun lt!85112 () Unit!5227)

(assert (=> d!51749 (= lt!85114 lt!85112)))

(assert (=> d!51749 (= (getValueByKey!182 lt!85113 (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))

(assert (=> d!51749 (= lt!85112 (lemmaContainsTupThenGetReturnValue!98 lt!85113 (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))

(assert (=> d!51749 (= lt!85113 (insertStrictlySorted!101 (toList!1091 lt!84967) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))

(assert (=> d!51749 (= (+!238 lt!84967 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))) lt!85115)))

(declare-fun b!171118 () Bool)

(declare-fun res!81318 () Bool)

(assert (=> b!171118 (=> (not res!81318) (not e!112948))))

(assert (=> b!171118 (= res!81318 (= (getValueByKey!182 (toList!1091 lt!85115) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))))))

(declare-fun b!171119 () Bool)

(assert (=> b!171119 (= e!112948 (contains!1144 (toList!1091 lt!85115) (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))))

(assert (= (and d!51749 res!81319) b!171118))

(assert (= (and b!171118 res!81318) b!171119))

(declare-fun m!199113 () Bool)

(assert (=> d!51749 m!199113))

(declare-fun m!199115 () Bool)

(assert (=> d!51749 m!199115))

(declare-fun m!199117 () Bool)

(assert (=> d!51749 m!199117))

(declare-fun m!199119 () Bool)

(assert (=> d!51749 m!199119))

(declare-fun m!199121 () Bool)

(assert (=> b!171118 m!199121))

(declare-fun m!199123 () Bool)

(assert (=> b!171119 m!199123))

(assert (=> b!170869 d!51749))

(declare-fun d!51751 () Bool)

(assert (=> d!51751 (= (apply!129 (+!238 lt!84967 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))) lt!84979) (get!1933 (getValueByKey!182 (toList!1091 (+!238 lt!84967 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))) lt!84979)))))

(declare-fun bs!7041 () Bool)

(assert (= bs!7041 d!51751))

(declare-fun m!199125 () Bool)

(assert (=> bs!7041 m!199125))

(assert (=> bs!7041 m!199125))

(declare-fun m!199127 () Bool)

(assert (=> bs!7041 m!199127))

(assert (=> b!170869 d!51751))

(declare-fun d!51753 () Bool)

(assert (=> d!51753 (= (apply!129 (+!238 lt!84967 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))) lt!84979) (apply!129 lt!84967 lt!84979))))

(declare-fun lt!85116 () Unit!5227)

(assert (=> d!51753 (= lt!85116 (choose!931 lt!84967 lt!84988 (minValue!3397 thiss!1248) lt!84979))))

(declare-fun e!112949 () Bool)

(assert (=> d!51753 e!112949))

(declare-fun res!81320 () Bool)

(assert (=> d!51753 (=> (not res!81320) (not e!112949))))

(assert (=> d!51753 (= res!81320 (contains!1142 lt!84967 lt!84979))))

(assert (=> d!51753 (= (addApplyDifferent!105 lt!84967 lt!84988 (minValue!3397 thiss!1248) lt!84979) lt!85116)))

(declare-fun b!171120 () Bool)

(assert (=> b!171120 (= e!112949 (not (= lt!84979 lt!84988)))))

(assert (= (and d!51753 res!81320) b!171120))

(assert (=> d!51753 m!198739))

(assert (=> d!51753 m!198737))

(declare-fun m!199129 () Bool)

(assert (=> d!51753 m!199129))

(assert (=> d!51753 m!198737))

(assert (=> d!51753 m!198759))

(declare-fun m!199131 () Bool)

(assert (=> d!51753 m!199131))

(assert (=> b!170869 d!51753))

(declare-fun d!51755 () Bool)

(declare-fun e!112950 () Bool)

(assert (=> d!51755 e!112950))

(declare-fun res!81322 () Bool)

(assert (=> d!51755 (=> (not res!81322) (not e!112950))))

(declare-fun lt!85120 () ListLongMap!2151)

(assert (=> d!51755 (= res!81322 (contains!1142 lt!85120 (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85118 () List!2203)

(assert (=> d!51755 (= lt!85120 (ListLongMap!2152 lt!85118))))

(declare-fun lt!85119 () Unit!5227)

(declare-fun lt!85117 () Unit!5227)

(assert (=> d!51755 (= lt!85119 lt!85117)))

(assert (=> d!51755 (= (getValueByKey!182 lt!85118 (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))

(assert (=> d!51755 (= lt!85117 (lemmaContainsTupThenGetReturnValue!98 lt!85118 (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))

(assert (=> d!51755 (= lt!85118 (insertStrictlySorted!101 (toList!1091 lt!84973) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))

(assert (=> d!51755 (= (+!238 lt!84973 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))) lt!85120)))

(declare-fun b!171121 () Bool)

(declare-fun res!81321 () Bool)

(assert (=> b!171121 (=> (not res!81321) (not e!112950))))

(assert (=> b!171121 (= res!81321 (= (getValueByKey!182 (toList!1091 lt!85120) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))))))

(declare-fun b!171122 () Bool)

(assert (=> b!171122 (= e!112950 (contains!1144 (toList!1091 lt!85120) (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))))

(assert (= (and d!51755 res!81322) b!171121))

(assert (= (and b!171121 res!81321) b!171122))

(declare-fun m!199133 () Bool)

(assert (=> d!51755 m!199133))

(declare-fun m!199135 () Bool)

(assert (=> d!51755 m!199135))

(declare-fun m!199137 () Bool)

(assert (=> d!51755 m!199137))

(declare-fun m!199139 () Bool)

(assert (=> d!51755 m!199139))

(declare-fun m!199141 () Bool)

(assert (=> b!171121 m!199141))

(declare-fun m!199143 () Bool)

(assert (=> b!171122 m!199143))

(assert (=> b!170869 d!51755))

(declare-fun d!51757 () Bool)

(assert (=> d!51757 (= (apply!129 (+!238 lt!84973 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))) lt!84968) (get!1933 (getValueByKey!182 (toList!1091 (+!238 lt!84973 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))) lt!84968)))))

(declare-fun bs!7042 () Bool)

(assert (= bs!7042 d!51757))

(declare-fun m!199145 () Bool)

(assert (=> bs!7042 m!199145))

(assert (=> bs!7042 m!199145))

(declare-fun m!199147 () Bool)

(assert (=> bs!7042 m!199147))

(assert (=> b!170869 d!51757))

(declare-fun d!51759 () Bool)

(assert (=> d!51759 (= (apply!129 lt!84973 lt!84968) (get!1933 (getValueByKey!182 (toList!1091 lt!84973) lt!84968)))))

(declare-fun bs!7043 () Bool)

(assert (= bs!7043 d!51759))

(declare-fun m!199149 () Bool)

(assert (=> bs!7043 m!199149))

(assert (=> bs!7043 m!199149))

(declare-fun m!199151 () Bool)

(assert (=> bs!7043 m!199151))

(assert (=> b!170869 d!51759))

(declare-fun d!51761 () Bool)

(assert (=> d!51761 (= (apply!129 (+!238 lt!84972 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))) lt!84986) (apply!129 lt!84972 lt!84986))))

(declare-fun lt!85121 () Unit!5227)

(assert (=> d!51761 (= lt!85121 (choose!931 lt!84972 lt!84969 (zeroValue!3397 thiss!1248) lt!84986))))

(declare-fun e!112951 () Bool)

(assert (=> d!51761 e!112951))

(declare-fun res!81323 () Bool)

(assert (=> d!51761 (=> (not res!81323) (not e!112951))))

(assert (=> d!51761 (= res!81323 (contains!1142 lt!84972 lt!84986))))

(assert (=> d!51761 (= (addApplyDifferent!105 lt!84972 lt!84969 (zeroValue!3397 thiss!1248) lt!84986) lt!85121)))

(declare-fun b!171123 () Bool)

(assert (=> b!171123 (= e!112951 (not (= lt!84986 lt!84969)))))

(assert (= (and d!51761 res!81323) b!171123))

(assert (=> d!51761 m!198733))

(assert (=> d!51761 m!198755))

(declare-fun m!199153 () Bool)

(assert (=> d!51761 m!199153))

(assert (=> d!51761 m!198755))

(assert (=> d!51761 m!198757))

(declare-fun m!199155 () Bool)

(assert (=> d!51761 m!199155))

(assert (=> b!170869 d!51761))

(declare-fun d!51763 () Bool)

(assert (=> d!51763 (= (apply!129 lt!84972 lt!84986) (get!1933 (getValueByKey!182 (toList!1091 lt!84972) lt!84986)))))

(declare-fun bs!7044 () Bool)

(assert (= bs!7044 d!51763))

(declare-fun m!199157 () Bool)

(assert (=> bs!7044 m!199157))

(assert (=> bs!7044 m!199157))

(declare-fun m!199159 () Bool)

(assert (=> bs!7044 m!199159))

(assert (=> b!170869 d!51763))

(declare-fun d!51765 () Bool)

(assert (=> d!51765 (= (apply!129 (+!238 lt!84973 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))) lt!84968) (apply!129 lt!84973 lt!84968))))

(declare-fun lt!85122 () Unit!5227)

(assert (=> d!51765 (= lt!85122 (choose!931 lt!84973 lt!84971 (minValue!3397 thiss!1248) lt!84968))))

(declare-fun e!112952 () Bool)

(assert (=> d!51765 e!112952))

(declare-fun res!81324 () Bool)

(assert (=> d!51765 (=> (not res!81324) (not e!112952))))

(assert (=> d!51765 (= res!81324 (contains!1142 lt!84973 lt!84968))))

(assert (=> d!51765 (= (addApplyDifferent!105 lt!84973 lt!84971 (minValue!3397 thiss!1248) lt!84968) lt!85122)))

(declare-fun b!171124 () Bool)

(assert (=> b!171124 (= e!112952 (not (= lt!84968 lt!84971)))))

(assert (= (and d!51765 res!81324) b!171124))

(assert (=> d!51765 m!198731))

(assert (=> d!51765 m!198735))

(declare-fun m!199161 () Bool)

(assert (=> d!51765 m!199161))

(assert (=> d!51765 m!198735))

(assert (=> d!51765 m!198743))

(declare-fun m!199163 () Bool)

(assert (=> d!51765 m!199163))

(assert (=> b!170869 d!51765))

(declare-fun d!51767 () Bool)

(declare-fun e!112953 () Bool)

(assert (=> d!51767 e!112953))

(declare-fun res!81326 () Bool)

(assert (=> d!51767 (=> (not res!81326) (not e!112953))))

(declare-fun lt!85126 () ListLongMap!2151)

(assert (=> d!51767 (= res!81326 (contains!1142 lt!85126 (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))

(declare-fun lt!85124 () List!2203)

(assert (=> d!51767 (= lt!85126 (ListLongMap!2152 lt!85124))))

(declare-fun lt!85125 () Unit!5227)

(declare-fun lt!85123 () Unit!5227)

(assert (=> d!51767 (= lt!85125 lt!85123)))

(assert (=> d!51767 (= (getValueByKey!182 lt!85124 (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))

(assert (=> d!51767 (= lt!85123 (lemmaContainsTupThenGetReturnValue!98 lt!85124 (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))

(assert (=> d!51767 (= lt!85124 (insertStrictlySorted!101 (toList!1091 lt!84972) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))

(assert (=> d!51767 (= (+!238 lt!84972 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))) lt!85126)))

(declare-fun b!171125 () Bool)

(declare-fun res!81325 () Bool)

(assert (=> b!171125 (=> (not res!81325) (not e!112953))))

(assert (=> b!171125 (= res!81325 (= (getValueByKey!182 (toList!1091 lt!85126) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))))))

(declare-fun b!171126 () Bool)

(assert (=> b!171126 (= e!112953 (contains!1144 (toList!1091 lt!85126) (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))))

(assert (= (and d!51767 res!81326) b!171125))

(assert (= (and b!171125 res!81325) b!171126))

(declare-fun m!199165 () Bool)

(assert (=> d!51767 m!199165))

(declare-fun m!199167 () Bool)

(assert (=> d!51767 m!199167))

(declare-fun m!199169 () Bool)

(assert (=> d!51767 m!199169))

(declare-fun m!199171 () Bool)

(assert (=> d!51767 m!199171))

(declare-fun m!199173 () Bool)

(assert (=> b!171125 m!199173))

(declare-fun m!199175 () Bool)

(assert (=> b!171126 m!199175))

(assert (=> b!170869 d!51767))

(declare-fun d!51769 () Bool)

(declare-fun e!112955 () Bool)

(assert (=> d!51769 e!112955))

(declare-fun res!81327 () Bool)

(assert (=> d!51769 (=> res!81327 e!112955)))

(declare-fun lt!85130 () Bool)

(assert (=> d!51769 (= res!81327 (not lt!85130))))

(declare-fun lt!85128 () Bool)

(assert (=> d!51769 (= lt!85130 lt!85128)))

(declare-fun lt!85127 () Unit!5227)

(declare-fun e!112954 () Unit!5227)

(assert (=> d!51769 (= lt!85127 e!112954)))

(declare-fun c!30561 () Bool)

(assert (=> d!51769 (= c!30561 lt!85128)))

(assert (=> d!51769 (= lt!85128 (containsKey!186 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) lt!84974))))

(assert (=> d!51769 (= (contains!1142 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))) lt!84974) lt!85130)))

(declare-fun b!171127 () Bool)

(declare-fun lt!85129 () Unit!5227)

(assert (=> b!171127 (= e!112954 lt!85129)))

(assert (=> b!171127 (= lt!85129 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) lt!84974))))

(assert (=> b!171127 (isDefined!136 (getValueByKey!182 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) lt!84974))))

(declare-fun b!171128 () Bool)

(declare-fun Unit!5242 () Unit!5227)

(assert (=> b!171128 (= e!112954 Unit!5242)))

(declare-fun b!171129 () Bool)

(assert (=> b!171129 (= e!112955 (isDefined!136 (getValueByKey!182 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) lt!84974)))))

(assert (= (and d!51769 c!30561) b!171127))

(assert (= (and d!51769 (not c!30561)) b!171128))

(assert (= (and d!51769 (not res!81327)) b!171129))

(declare-fun m!199177 () Bool)

(assert (=> d!51769 m!199177))

(declare-fun m!199179 () Bool)

(assert (=> b!171127 m!199179))

(declare-fun m!199181 () Bool)

(assert (=> b!171127 m!199181))

(assert (=> b!171127 m!199181))

(declare-fun m!199183 () Bool)

(assert (=> b!171127 m!199183))

(assert (=> b!171129 m!199181))

(assert (=> b!171129 m!199181))

(assert (=> b!171129 m!199183))

(assert (=> b!170869 d!51769))

(declare-fun b!171138 () Bool)

(declare-fun e!112961 () (_ BitVec 32))

(assert (=> b!171138 (= e!112961 #b00000000000000000000000000000000)))

(declare-fun b!171139 () Bool)

(declare-fun e!112960 () (_ BitVec 32))

(declare-fun call!17420 () (_ BitVec 32))

(assert (=> b!171139 (= e!112960 call!17420)))

(declare-fun b!171140 () Bool)

(assert (=> b!171140 (= e!112961 e!112960)))

(declare-fun c!30567 () Bool)

(assert (=> b!171140 (= c!30567 (validKeyInArray!0 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(declare-fun d!51771 () Bool)

(declare-fun lt!85133 () (_ BitVec 32))

(assert (=> d!51771 (and (bvsge lt!85133 #b00000000000000000000000000000000) (bvsle lt!85133 (bvsub (size!3670 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(assert (=> d!51771 (= lt!85133 e!112961)))

(declare-fun c!30566 () Bool)

(assert (=> d!51771 (= c!30566 (bvsge #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))))))

(assert (=> d!51771 (and (bvsle #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3670 (_keys!5385 lt!84854)) (size!3670 (_keys!5385 lt!84854))))))

(assert (=> d!51771 (= (arrayCountValidKeys!0 (_keys!5385 lt!84854) #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))) lt!85133)))

(declare-fun bm!17417 () Bool)

(assert (=> bm!17417 (= call!17420 (arrayCountValidKeys!0 (_keys!5385 lt!84854) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 lt!84854))))))

(declare-fun b!171141 () Bool)

(assert (=> b!171141 (= e!112960 (bvadd #b00000000000000000000000000000001 call!17420))))

(assert (= (and d!51771 c!30566) b!171138))

(assert (= (and d!51771 (not c!30566)) b!171140))

(assert (= (and b!171140 c!30567) b!171141))

(assert (= (and b!171140 (not c!30567)) b!171139))

(assert (= (or b!171141 b!171139) bm!17417))

(assert (=> b!171140 m!199007))

(assert (=> b!171140 m!199007))

(assert (=> b!171140 m!199009))

(declare-fun m!199185 () Bool)

(assert (=> bm!17417 m!199185))

(assert (=> b!170855 d!51771))

(assert (=> d!51627 d!51649))

(assert (=> b!170829 d!51651))

(declare-fun d!51773 () Bool)

(declare-fun e!112963 () Bool)

(assert (=> d!51773 e!112963))

(declare-fun res!81328 () Bool)

(assert (=> d!51773 (=> res!81328 e!112963)))

(declare-fun lt!85137 () Bool)

(assert (=> d!51773 (= res!81328 (not lt!85137))))

(declare-fun lt!85135 () Bool)

(assert (=> d!51773 (= lt!85137 lt!85135)))

(declare-fun lt!85134 () Unit!5227)

(declare-fun e!112962 () Unit!5227)

(assert (=> d!51773 (= lt!85134 e!112962)))

(declare-fun c!30568 () Bool)

(assert (=> d!51773 (= c!30568 lt!85135)))

(assert (=> d!51773 (= lt!85135 (containsKey!186 (toList!1091 lt!84962) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51773 (= (contains!1142 lt!84962 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) lt!85137)))

(declare-fun b!171142 () Bool)

(declare-fun lt!85136 () Unit!5227)

(assert (=> b!171142 (= e!112962 lt!85136)))

(assert (=> b!171142 (= lt!85136 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84962) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171142 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84962) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171143 () Bool)

(declare-fun Unit!5243 () Unit!5227)

(assert (=> b!171143 (= e!112962 Unit!5243)))

(declare-fun b!171144 () Bool)

(assert (=> b!171144 (= e!112963 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84962) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!51773 c!30568) b!171142))

(assert (= (and d!51773 (not c!30568)) b!171143))

(assert (= (and d!51773 (not res!81328)) b!171144))

(assert (=> d!51773 m!198643))

(declare-fun m!199187 () Bool)

(assert (=> d!51773 m!199187))

(assert (=> b!171142 m!198643))

(declare-fun m!199189 () Bool)

(assert (=> b!171142 m!199189))

(assert (=> b!171142 m!198643))

(assert (=> b!171142 m!198807))

(assert (=> b!171142 m!198807))

(declare-fun m!199191 () Bool)

(assert (=> b!171142 m!199191))

(assert (=> b!171144 m!198643))

(assert (=> b!171144 m!198807))

(assert (=> b!171144 m!198807))

(assert (=> b!171144 m!199191))

(assert (=> b!170844 d!51773))

(declare-fun d!51775 () Bool)

(assert (=> d!51775 (= (apply!129 lt!84962 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1933 (getValueByKey!182 (toList!1091 lt!84962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7045 () Bool)

(assert (= bs!7045 d!51775))

(assert (=> bs!7045 m!199003))

(assert (=> bs!7045 m!199003))

(declare-fun m!199193 () Bool)

(assert (=> bs!7045 m!199193))

(assert (=> b!170830 d!51775))

(declare-fun d!51777 () Bool)

(declare-fun e!112964 () Bool)

(assert (=> d!51777 e!112964))

(declare-fun res!81330 () Bool)

(assert (=> d!51777 (=> (not res!81330) (not e!112964))))

(declare-fun lt!85141 () ListLongMap!2151)

(assert (=> d!51777 (= res!81330 (contains!1142 lt!85141 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85139 () List!2203)

(assert (=> d!51777 (= lt!85141 (ListLongMap!2152 lt!85139))))

(declare-fun lt!85140 () Unit!5227)

(declare-fun lt!85138 () Unit!5227)

(assert (=> d!51777 (= lt!85140 lt!85138)))

(assert (=> d!51777 (= (getValueByKey!182 lt!85139 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> d!51777 (= lt!85138 (lemmaContainsTupThenGetReturnValue!98 lt!85139 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> d!51777 (= lt!85139 (insertStrictlySorted!101 (toList!1091 call!17389) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> d!51777 (= (+!238 call!17389 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) lt!85141)))

(declare-fun b!171145 () Bool)

(declare-fun res!81329 () Bool)

(assert (=> b!171145 (=> (not res!81329) (not e!112964))))

(assert (=> b!171145 (= res!81329 (= (getValueByKey!182 (toList!1091 lt!85141) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171146 () Bool)

(assert (=> b!171146 (= e!112964 (contains!1144 (toList!1091 lt!85141) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(assert (= (and d!51777 res!81330) b!171145))

(assert (= (and b!171145 res!81329) b!171146))

(declare-fun m!199195 () Bool)

(assert (=> d!51777 m!199195))

(declare-fun m!199197 () Bool)

(assert (=> d!51777 m!199197))

(declare-fun m!199199 () Bool)

(assert (=> d!51777 m!199199))

(declare-fun m!199201 () Bool)

(assert (=> d!51777 m!199201))

(declare-fun m!199203 () Bool)

(assert (=> b!171145 m!199203))

(declare-fun m!199205 () Bool)

(assert (=> b!171146 m!199205))

(assert (=> b!170860 d!51777))

(declare-fun b!171147 () Bool)

(declare-fun e!112977 () ListLongMap!2151)

(declare-fun call!17426 () ListLongMap!2151)

(assert (=> b!171147 (= e!112977 call!17426)))

(declare-fun b!171148 () Bool)

(declare-fun res!81334 () Bool)

(declare-fun e!112972 () Bool)

(assert (=> b!171148 (=> (not res!81334) (not e!112972))))

(declare-fun e!112970 () Bool)

(assert (=> b!171148 (= res!81334 e!112970)))

(declare-fun c!30574 () Bool)

(assert (=> b!171148 (= c!30574 (not (= (bvand (extraKeys!3295 lt!84854) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!171149 () Bool)

(declare-fun e!112973 () ListLongMap!2151)

(declare-fun call!17423 () ListLongMap!2151)

(assert (=> b!171149 (= e!112973 (+!238 call!17423 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854))))))

(declare-fun b!171150 () Bool)

(declare-fun e!112976 () Bool)

(assert (=> b!171150 (= e!112976 (validKeyInArray!0 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(declare-fun b!171151 () Bool)

(declare-fun e!112969 () Bool)

(declare-fun lt!85162 () ListLongMap!2151)

(assert (=> b!171151 (= e!112969 (= (apply!129 lt!85162 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3397 lt!84854)))))

(declare-fun b!171153 () Bool)

(declare-fun e!112967 () Bool)

(assert (=> b!171153 (= e!112967 (= (apply!129 lt!85162 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)) (get!1932 (select (arr!3377 (_values!3537 lt!84854)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 lt!84854) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!171153 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3671 (_values!3537 lt!84854))))))

(assert (=> b!171153 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))))))

(declare-fun bm!17418 () Bool)

(declare-fun call!17425 () ListLongMap!2151)

(declare-fun call!17421 () ListLongMap!2151)

(assert (=> bm!17418 (= call!17425 call!17421)))

(declare-fun bm!17419 () Bool)

(declare-fun call!17422 () Bool)

(assert (=> bm!17419 (= call!17422 (contains!1142 lt!85162 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171154 () Bool)

(declare-fun e!112968 () Bool)

(assert (=> b!171154 (= e!112972 e!112968)))

(declare-fun c!30572 () Bool)

(assert (=> b!171154 (= c!30572 (not (= (bvand (extraKeys!3295 lt!84854) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!171155 () Bool)

(declare-fun call!17427 () Bool)

(assert (=> b!171155 (= e!112968 (not call!17427))))

(declare-fun b!171156 () Bool)

(assert (=> b!171156 (= e!112968 e!112969)))

(declare-fun res!81332 () Bool)

(assert (=> b!171156 (= res!81332 call!17427)))

(assert (=> b!171156 (=> (not res!81332) (not e!112969))))

(declare-fun b!171157 () Bool)

(assert (=> b!171157 (= e!112970 (not call!17422))))

(declare-fun bm!17420 () Bool)

(assert (=> bm!17420 (= call!17427 (contains!1142 lt!85162 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17421 () Bool)

(declare-fun call!17424 () ListLongMap!2151)

(assert (=> bm!17421 (= call!17424 (getCurrentListMapNoExtraKeys!150 (_keys!5385 lt!84854) (_values!3537 lt!84854) (mask!8381 lt!84854) (extraKeys!3295 lt!84854) (zeroValue!3397 lt!84854) (minValue!3397 lt!84854) #b00000000000000000000000000000000 (defaultEntry!3554 lt!84854)))))

(declare-fun d!51779 () Bool)

(assert (=> d!51779 e!112972))

(declare-fun res!81338 () Bool)

(assert (=> d!51779 (=> (not res!81338) (not e!112972))))

(assert (=> d!51779 (= res!81338 (or (bvsge #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))))))))

(declare-fun lt!85153 () ListLongMap!2151)

(assert (=> d!51779 (= lt!85162 lt!85153)))

(declare-fun lt!85158 () Unit!5227)

(declare-fun e!112974 () Unit!5227)

(assert (=> d!51779 (= lt!85158 e!112974)))

(declare-fun c!30569 () Bool)

(assert (=> d!51779 (= c!30569 e!112976)))

(declare-fun res!81331 () Bool)

(assert (=> d!51779 (=> (not res!81331) (not e!112976))))

(assert (=> d!51779 (= res!81331 (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))))))

(assert (=> d!51779 (= lt!85153 e!112973)))

(declare-fun c!30573 () Bool)

(assert (=> d!51779 (= c!30573 (and (not (= (bvand (extraKeys!3295 lt!84854) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3295 lt!84854) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!51779 (validMask!0 (mask!8381 lt!84854))))

(assert (=> d!51779 (= (getCurrentListMap!729 (_keys!5385 lt!84854) (_values!3537 lt!84854) (mask!8381 lt!84854) (extraKeys!3295 lt!84854) (zeroValue!3397 lt!84854) (minValue!3397 lt!84854) #b00000000000000000000000000000000 (defaultEntry!3554 lt!84854)) lt!85162)))

(declare-fun b!171152 () Bool)

(declare-fun e!112965 () ListLongMap!2151)

(assert (=> b!171152 (= e!112965 call!17425)))

(declare-fun b!171158 () Bool)

(declare-fun lt!85151 () Unit!5227)

(assert (=> b!171158 (= e!112974 lt!85151)))

(declare-fun lt!85160 () ListLongMap!2151)

(assert (=> b!171158 (= lt!85160 (getCurrentListMapNoExtraKeys!150 (_keys!5385 lt!84854) (_values!3537 lt!84854) (mask!8381 lt!84854) (extraKeys!3295 lt!84854) (zeroValue!3397 lt!84854) (minValue!3397 lt!84854) #b00000000000000000000000000000000 (defaultEntry!3554 lt!84854)))))

(declare-fun lt!85145 () (_ BitVec 64))

(assert (=> b!171158 (= lt!85145 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85149 () (_ BitVec 64))

(assert (=> b!171158 (= lt!85149 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000))))

(declare-fun lt!85152 () Unit!5227)

(assert (=> b!171158 (= lt!85152 (addStillContains!105 lt!85160 lt!85145 (zeroValue!3397 lt!84854) lt!85149))))

(assert (=> b!171158 (contains!1142 (+!238 lt!85160 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854))) lt!85149)))

(declare-fun lt!85157 () Unit!5227)

(assert (=> b!171158 (= lt!85157 lt!85152)))

(declare-fun lt!85142 () ListLongMap!2151)

(assert (=> b!171158 (= lt!85142 (getCurrentListMapNoExtraKeys!150 (_keys!5385 lt!84854) (_values!3537 lt!84854) (mask!8381 lt!84854) (extraKeys!3295 lt!84854) (zeroValue!3397 lt!84854) (minValue!3397 lt!84854) #b00000000000000000000000000000000 (defaultEntry!3554 lt!84854)))))

(declare-fun lt!85163 () (_ BitVec 64))

(assert (=> b!171158 (= lt!85163 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85154 () (_ BitVec 64))

(assert (=> b!171158 (= lt!85154 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000))))

(declare-fun lt!85156 () Unit!5227)

(assert (=> b!171158 (= lt!85156 (addApplyDifferent!105 lt!85142 lt!85163 (minValue!3397 lt!84854) lt!85154))))

(assert (=> b!171158 (= (apply!129 (+!238 lt!85142 (tuple2!3233 lt!85163 (minValue!3397 lt!84854))) lt!85154) (apply!129 lt!85142 lt!85154))))

(declare-fun lt!85159 () Unit!5227)

(assert (=> b!171158 (= lt!85159 lt!85156)))

(declare-fun lt!85147 () ListLongMap!2151)

(assert (=> b!171158 (= lt!85147 (getCurrentListMapNoExtraKeys!150 (_keys!5385 lt!84854) (_values!3537 lt!84854) (mask!8381 lt!84854) (extraKeys!3295 lt!84854) (zeroValue!3397 lt!84854) (minValue!3397 lt!84854) #b00000000000000000000000000000000 (defaultEntry!3554 lt!84854)))))

(declare-fun lt!85144 () (_ BitVec 64))

(assert (=> b!171158 (= lt!85144 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85161 () (_ BitVec 64))

(assert (=> b!171158 (= lt!85161 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000))))

(declare-fun lt!85155 () Unit!5227)

(assert (=> b!171158 (= lt!85155 (addApplyDifferent!105 lt!85147 lt!85144 (zeroValue!3397 lt!84854) lt!85161))))

(assert (=> b!171158 (= (apply!129 (+!238 lt!85147 (tuple2!3233 lt!85144 (zeroValue!3397 lt!84854))) lt!85161) (apply!129 lt!85147 lt!85161))))

(declare-fun lt!85150 () Unit!5227)

(assert (=> b!171158 (= lt!85150 lt!85155)))

(declare-fun lt!85148 () ListLongMap!2151)

(assert (=> b!171158 (= lt!85148 (getCurrentListMapNoExtraKeys!150 (_keys!5385 lt!84854) (_values!3537 lt!84854) (mask!8381 lt!84854) (extraKeys!3295 lt!84854) (zeroValue!3397 lt!84854) (minValue!3397 lt!84854) #b00000000000000000000000000000000 (defaultEntry!3554 lt!84854)))))

(declare-fun lt!85146 () (_ BitVec 64))

(assert (=> b!171158 (= lt!85146 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85143 () (_ BitVec 64))

(assert (=> b!171158 (= lt!85143 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000))))

(assert (=> b!171158 (= lt!85151 (addApplyDifferent!105 lt!85148 lt!85146 (minValue!3397 lt!84854) lt!85143))))

(assert (=> b!171158 (= (apply!129 (+!238 lt!85148 (tuple2!3233 lt!85146 (minValue!3397 lt!84854))) lt!85143) (apply!129 lt!85148 lt!85143))))

(declare-fun b!171159 () Bool)

(assert (=> b!171159 (= e!112973 e!112977)))

(declare-fun c!30571 () Bool)

(assert (=> b!171159 (= c!30571 (and (not (= (bvand (extraKeys!3295 lt!84854) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3295 lt!84854) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!171160 () Bool)

(declare-fun e!112966 () Bool)

(assert (=> b!171160 (= e!112970 e!112966)))

(declare-fun res!81336 () Bool)

(assert (=> b!171160 (= res!81336 call!17422)))

(assert (=> b!171160 (=> (not res!81336) (not e!112966))))

(declare-fun bm!17422 () Bool)

(assert (=> bm!17422 (= call!17426 call!17423)))

(declare-fun bm!17423 () Bool)

(assert (=> bm!17423 (= call!17423 (+!238 (ite c!30573 call!17424 (ite c!30571 call!17421 call!17425)) (ite (or c!30573 c!30571) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!84854)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854)))))))

(declare-fun b!171161 () Bool)

(declare-fun e!112971 () Bool)

(assert (=> b!171161 (= e!112971 (validKeyInArray!0 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(declare-fun b!171162 () Bool)

(assert (=> b!171162 (= e!112966 (= (apply!129 lt!85162 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3397 lt!84854)))))

(declare-fun b!171163 () Bool)

(declare-fun res!81333 () Bool)

(assert (=> b!171163 (=> (not res!81333) (not e!112972))))

(declare-fun e!112975 () Bool)

(assert (=> b!171163 (= res!81333 e!112975)))

(declare-fun res!81337 () Bool)

(assert (=> b!171163 (=> res!81337 e!112975)))

(assert (=> b!171163 (= res!81337 (not e!112971))))

(declare-fun res!81339 () Bool)

(assert (=> b!171163 (=> (not res!81339) (not e!112971))))

(assert (=> b!171163 (= res!81339 (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))))))

(declare-fun b!171164 () Bool)

(declare-fun c!30570 () Bool)

(assert (=> b!171164 (= c!30570 (and (not (= (bvand (extraKeys!3295 lt!84854) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3295 lt!84854) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!171164 (= e!112977 e!112965)))

(declare-fun bm!17424 () Bool)

(assert (=> bm!17424 (= call!17421 call!17424)))

(declare-fun b!171165 () Bool)

(assert (=> b!171165 (= e!112975 e!112967)))

(declare-fun res!81335 () Bool)

(assert (=> b!171165 (=> (not res!81335) (not e!112967))))

(assert (=> b!171165 (= res!81335 (contains!1142 lt!85162 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(assert (=> b!171165 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))))))

(declare-fun b!171166 () Bool)

(assert (=> b!171166 (= e!112965 call!17426)))

(declare-fun b!171167 () Bool)

(declare-fun Unit!5244 () Unit!5227)

(assert (=> b!171167 (= e!112974 Unit!5244)))

(assert (= (and d!51779 c!30573) b!171149))

(assert (= (and d!51779 (not c!30573)) b!171159))

(assert (= (and b!171159 c!30571) b!171147))

(assert (= (and b!171159 (not c!30571)) b!171164))

(assert (= (and b!171164 c!30570) b!171166))

(assert (= (and b!171164 (not c!30570)) b!171152))

(assert (= (or b!171166 b!171152) bm!17418))

(assert (= (or b!171147 bm!17418) bm!17424))

(assert (= (or b!171147 b!171166) bm!17422))

(assert (= (or b!171149 bm!17424) bm!17421))

(assert (= (or b!171149 bm!17422) bm!17423))

(assert (= (and d!51779 res!81331) b!171150))

(assert (= (and d!51779 c!30569) b!171158))

(assert (= (and d!51779 (not c!30569)) b!171167))

(assert (= (and d!51779 res!81338) b!171163))

(assert (= (and b!171163 res!81339) b!171161))

(assert (= (and b!171163 (not res!81337)) b!171165))

(assert (= (and b!171165 res!81335) b!171153))

(assert (= (and b!171163 res!81333) b!171148))

(assert (= (and b!171148 c!30574) b!171160))

(assert (= (and b!171148 (not c!30574)) b!171157))

(assert (= (and b!171160 res!81336) b!171162))

(assert (= (or b!171160 b!171157) bm!17419))

(assert (= (and b!171148 res!81334) b!171154))

(assert (= (and b!171154 c!30572) b!171156))

(assert (= (and b!171154 (not c!30572)) b!171155))

(assert (= (and b!171156 res!81332) b!171151))

(assert (= (or b!171156 b!171155) bm!17420))

(declare-fun b_lambda!6885 () Bool)

(assert (=> (not b_lambda!6885) (not b!171153)))

(declare-fun tb!2759 () Bool)

(declare-fun t!7002 () Bool)

(assert (=> (and b!170714 (= (defaultEntry!3554 thiss!1248) (defaultEntry!3554 lt!84854)) t!7002) tb!2759))

(declare-fun result!4559 () Bool)

(assert (=> tb!2759 (= result!4559 tp_is_empty!4003)))

(assert (=> b!171153 t!7002))

(declare-fun b_and!10637 () Bool)

(assert (= b_and!10635 (and (=> t!7002 result!4559) b_and!10637)))

(assert (=> b!171150 m!199007))

(assert (=> b!171150 m!199007))

(assert (=> b!171150 m!199009))

(declare-fun m!199207 () Bool)

(assert (=> bm!17420 m!199207))

(declare-fun m!199209 () Bool)

(assert (=> bm!17421 m!199209))

(declare-fun m!199211 () Bool)

(assert (=> b!171149 m!199211))

(declare-fun m!199213 () Bool)

(assert (=> b!171153 m!199213))

(assert (=> b!171153 m!199007))

(assert (=> b!171153 m!199213))

(declare-fun m!199215 () Bool)

(assert (=> b!171153 m!199215))

(declare-fun m!199217 () Bool)

(assert (=> b!171153 m!199217))

(assert (=> b!171153 m!199007))

(declare-fun m!199219 () Bool)

(assert (=> b!171153 m!199219))

(assert (=> b!171153 m!199215))

(assert (=> b!171161 m!199007))

(assert (=> b!171161 m!199007))

(assert (=> b!171161 m!199009))

(assert (=> b!171165 m!199007))

(assert (=> b!171165 m!199007))

(declare-fun m!199221 () Bool)

(assert (=> b!171165 m!199221))

(declare-fun m!199223 () Bool)

(assert (=> b!171151 m!199223))

(declare-fun m!199225 () Bool)

(assert (=> bm!17419 m!199225))

(assert (=> d!51779 m!199085))

(declare-fun m!199227 () Bool)

(assert (=> bm!17423 m!199227))

(declare-fun m!199229 () Bool)

(assert (=> b!171162 m!199229))

(declare-fun m!199231 () Bool)

(assert (=> b!171158 m!199231))

(declare-fun m!199233 () Bool)

(assert (=> b!171158 m!199233))

(assert (=> b!171158 m!199209))

(declare-fun m!199235 () Bool)

(assert (=> b!171158 m!199235))

(declare-fun m!199237 () Bool)

(assert (=> b!171158 m!199237))

(declare-fun m!199239 () Bool)

(assert (=> b!171158 m!199239))

(declare-fun m!199241 () Bool)

(assert (=> b!171158 m!199241))

(assert (=> b!171158 m!199235))

(declare-fun m!199243 () Bool)

(assert (=> b!171158 m!199243))

(assert (=> b!171158 m!199007))

(declare-fun m!199245 () Bool)

(assert (=> b!171158 m!199245))

(declare-fun m!199247 () Bool)

(assert (=> b!171158 m!199247))

(declare-fun m!199249 () Bool)

(assert (=> b!171158 m!199249))

(declare-fun m!199251 () Bool)

(assert (=> b!171158 m!199251))

(declare-fun m!199253 () Bool)

(assert (=> b!171158 m!199253))

(declare-fun m!199255 () Bool)

(assert (=> b!171158 m!199255))

(declare-fun m!199257 () Bool)

(assert (=> b!171158 m!199257))

(assert (=> b!171158 m!199237))

(declare-fun m!199259 () Bool)

(assert (=> b!171158 m!199259))

(assert (=> b!171158 m!199251))

(assert (=> b!171158 m!199255))

(assert (=> d!51621 d!51779))

(declare-fun b!171168 () Bool)

(declare-fun e!112979 () (_ BitVec 32))

(assert (=> b!171168 (= e!112979 #b00000000000000000000000000000000)))

(declare-fun b!171169 () Bool)

(declare-fun e!112978 () (_ BitVec 32))

(declare-fun call!17428 () (_ BitVec 32))

(assert (=> b!171169 (= e!112978 call!17428)))

(declare-fun b!171170 () Bool)

(assert (=> b!171170 (= e!112979 e!112978)))

(declare-fun c!30576 () Bool)

(assert (=> b!171170 (= c!30576 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51781 () Bool)

(declare-fun lt!85164 () (_ BitVec 32))

(assert (=> d!51781 (and (bvsge lt!85164 #b00000000000000000000000000000000) (bvsle lt!85164 (bvsub (size!3670 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51781 (= lt!85164 e!112979)))

(declare-fun c!30575 () Bool)

(assert (=> d!51781 (= c!30575 (bvsge #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> d!51781 (and (bvsle #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3670 (_keys!5385 thiss!1248)) (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> d!51781 (= (arrayCountValidKeys!0 (_keys!5385 thiss!1248) #b00000000000000000000000000000000 (size!3670 (_keys!5385 thiss!1248))) lt!85164)))

(declare-fun bm!17425 () Bool)

(assert (=> bm!17425 (= call!17428 (arrayCountValidKeys!0 (_keys!5385 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun b!171171 () Bool)

(assert (=> b!171171 (= e!112978 (bvadd #b00000000000000000000000000000001 call!17428))))

(assert (= (and d!51781 c!30575) b!171168))

(assert (= (and d!51781 (not c!30575)) b!171170))

(assert (= (and b!171170 c!30576) b!171171))

(assert (= (and b!171170 (not c!30576)) b!171169))

(assert (= (or b!171171 b!171169) bm!17425))

(assert (=> b!171170 m!198643))

(assert (=> b!171170 m!198643))

(assert (=> b!171170 m!198645))

(declare-fun m!199261 () Bool)

(assert (=> bm!17425 m!199261))

(assert (=> b!170881 d!51781))

(declare-fun d!51783 () Bool)

(declare-fun res!81342 () Bool)

(declare-fun e!112980 () Bool)

(assert (=> d!51783 (=> (not res!81342) (not e!112980))))

(assert (=> d!51783 (= res!81342 (validMask!0 (mask!8381 thiss!1248)))))

(assert (=> d!51783 (= (simpleValid!135 thiss!1248) e!112980)))

(declare-fun b!171174 () Bool)

(declare-fun res!81341 () Bool)

(assert (=> b!171174 (=> (not res!81341) (not e!112980))))

(assert (=> b!171174 (= res!81341 (= (size!3676 thiss!1248) (bvadd (_size!1161 thiss!1248) (bvsdiv (bvadd (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!171172 () Bool)

(declare-fun res!81343 () Bool)

(assert (=> b!171172 (=> (not res!81343) (not e!112980))))

(assert (=> b!171172 (= res!81343 (and (= (size!3671 (_values!3537 thiss!1248)) (bvadd (mask!8381 thiss!1248) #b00000000000000000000000000000001)) (= (size!3670 (_keys!5385 thiss!1248)) (size!3671 (_values!3537 thiss!1248))) (bvsge (_size!1161 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1161 thiss!1248) (bvadd (mask!8381 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!171173 () Bool)

(declare-fun res!81340 () Bool)

(assert (=> b!171173 (=> (not res!81340) (not e!112980))))

(assert (=> b!171173 (= res!81340 (bvsge (size!3676 thiss!1248) (_size!1161 thiss!1248)))))

(declare-fun b!171175 () Bool)

(assert (=> b!171175 (= e!112980 (and (bvsge (extraKeys!3295 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3295 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1161 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!51783 res!81342) b!171172))

(assert (= (and b!171172 res!81343) b!171173))

(assert (= (and b!171173 res!81340) b!171174))

(assert (= (and b!171174 res!81341) b!171175))

(assert (=> d!51783 m!198667))

(declare-fun m!199263 () Bool)

(assert (=> b!171174 m!199263))

(assert (=> b!171173 m!199263))

(assert (=> d!51637 d!51783))

(declare-fun b!171176 () Bool)

(declare-fun e!112981 () Option!188)

(assert (=> b!171176 (= e!112981 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!84897)))))))

(declare-fun b!171178 () Bool)

(declare-fun e!112982 () Option!188)

(assert (=> b!171178 (= e!112982 (getValueByKey!182 (t!6996 (toList!1091 lt!84897)) (_1!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun b!171179 () Bool)

(assert (=> b!171179 (= e!112982 None!186)))

(declare-fun d!51785 () Bool)

(declare-fun c!30577 () Bool)

(assert (=> d!51785 (= c!30577 (and ((_ is Cons!2199) (toList!1091 lt!84897)) (= (_1!1627 (h!2816 (toList!1091 lt!84897))) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(assert (=> d!51785 (= (getValueByKey!182 (toList!1091 lt!84897) (_1!1627 (tuple2!3233 key!828 v!309))) e!112981)))

(declare-fun b!171177 () Bool)

(assert (=> b!171177 (= e!112981 e!112982)))

(declare-fun c!30578 () Bool)

(assert (=> b!171177 (= c!30578 (and ((_ is Cons!2199) (toList!1091 lt!84897)) (not (= (_1!1627 (h!2816 (toList!1091 lt!84897))) (_1!1627 (tuple2!3233 key!828 v!309))))))))

(assert (= (and d!51785 c!30577) b!171176))

(assert (= (and d!51785 (not c!30577)) b!171177))

(assert (= (and b!171177 c!30578) b!171178))

(assert (= (and b!171177 (not c!30578)) b!171179))

(declare-fun m!199265 () Bool)

(assert (=> b!171178 m!199265))

(assert (=> b!170782 d!51785))

(declare-fun d!51787 () Bool)

(declare-fun e!112983 () Bool)

(assert (=> d!51787 e!112983))

(declare-fun res!81345 () Bool)

(assert (=> d!51787 (=> (not res!81345) (not e!112983))))

(declare-fun lt!85168 () ListLongMap!2151)

(assert (=> d!51787 (= res!81345 (contains!1142 lt!85168 (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun lt!85166 () List!2203)

(assert (=> d!51787 (= lt!85168 (ListLongMap!2152 lt!85166))))

(declare-fun lt!85167 () Unit!5227)

(declare-fun lt!85165 () Unit!5227)

(assert (=> d!51787 (= lt!85167 lt!85165)))

(assert (=> d!51787 (= (getValueByKey!182 lt!85166 (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) (Some!187 (_2!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!51787 (= lt!85165 (lemmaContainsTupThenGetReturnValue!98 lt!85166 (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!51787 (= lt!85166 (insertStrictlySorted!101 (toList!1091 (ite c!30496 call!17390 (ite c!30494 call!17387 call!17391))) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!51787 (= (+!238 (ite c!30496 call!17390 (ite c!30494 call!17387 call!17391)) (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85168)))

(declare-fun b!171180 () Bool)

(declare-fun res!81344 () Bool)

(assert (=> b!171180 (=> (not res!81344) (not e!112983))))

(assert (=> b!171180 (= res!81344 (= (getValueByKey!182 (toList!1091 lt!85168) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) (Some!187 (_2!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171181 () Bool)

(assert (=> b!171181 (= e!112983 (contains!1144 (toList!1091 lt!85168) (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (= (and d!51787 res!81345) b!171180))

(assert (= (and b!171180 res!81344) b!171181))

(declare-fun m!199267 () Bool)

(assert (=> d!51787 m!199267))

(declare-fun m!199269 () Bool)

(assert (=> d!51787 m!199269))

(declare-fun m!199271 () Bool)

(assert (=> d!51787 m!199271))

(declare-fun m!199273 () Bool)

(assert (=> d!51787 m!199273))

(declare-fun m!199275 () Bool)

(assert (=> b!171180 m!199275))

(declare-fun m!199277 () Bool)

(assert (=> b!171181 m!199277))

(assert (=> bm!17389 d!51787))

(declare-fun d!51789 () Bool)

(declare-fun res!81350 () Bool)

(declare-fun e!112988 () Bool)

(assert (=> d!51789 (=> res!81350 e!112988)))

(assert (=> d!51789 (= res!81350 (and ((_ is Cons!2199) (toList!1091 lt!84853)) (= (_1!1627 (h!2816 (toList!1091 lt!84853))) key!828)))))

(assert (=> d!51789 (= (containsKey!186 (toList!1091 lt!84853) key!828) e!112988)))

(declare-fun b!171186 () Bool)

(declare-fun e!112989 () Bool)

(assert (=> b!171186 (= e!112988 e!112989)))

(declare-fun res!81351 () Bool)

(assert (=> b!171186 (=> (not res!81351) (not e!112989))))

(assert (=> b!171186 (= res!81351 (and (or (not ((_ is Cons!2199) (toList!1091 lt!84853))) (bvsle (_1!1627 (h!2816 (toList!1091 lt!84853))) key!828)) ((_ is Cons!2199) (toList!1091 lt!84853)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84853))) key!828)))))

(declare-fun b!171187 () Bool)

(assert (=> b!171187 (= e!112989 (containsKey!186 (t!6996 (toList!1091 lt!84853)) key!828))))

(assert (= (and d!51789 (not res!81350)) b!171186))

(assert (= (and b!171186 res!81351) b!171187))

(declare-fun m!199279 () Bool)

(assert (=> b!171187 m!199279))

(assert (=> d!51619 d!51789))

(declare-fun d!51791 () Bool)

(declare-fun lt!85169 () Bool)

(assert (=> d!51791 (= lt!85169 (select (content!147 (toList!1091 lt!84897)) (tuple2!3233 key!828 v!309)))))

(declare-fun e!112991 () Bool)

(assert (=> d!51791 (= lt!85169 e!112991)))

(declare-fun res!81352 () Bool)

(assert (=> d!51791 (=> (not res!81352) (not e!112991))))

(assert (=> d!51791 (= res!81352 ((_ is Cons!2199) (toList!1091 lt!84897)))))

(assert (=> d!51791 (= (contains!1144 (toList!1091 lt!84897) (tuple2!3233 key!828 v!309)) lt!85169)))

(declare-fun b!171188 () Bool)

(declare-fun e!112990 () Bool)

(assert (=> b!171188 (= e!112991 e!112990)))

(declare-fun res!81353 () Bool)

(assert (=> b!171188 (=> res!81353 e!112990)))

(assert (=> b!171188 (= res!81353 (= (h!2816 (toList!1091 lt!84897)) (tuple2!3233 key!828 v!309)))))

(declare-fun b!171189 () Bool)

(assert (=> b!171189 (= e!112990 (contains!1144 (t!6996 (toList!1091 lt!84897)) (tuple2!3233 key!828 v!309)))))

(assert (= (and d!51791 res!81352) b!171188))

(assert (= (and b!171188 (not res!81353)) b!171189))

(declare-fun m!199281 () Bool)

(assert (=> d!51791 m!199281))

(declare-fun m!199283 () Bool)

(assert (=> d!51791 m!199283))

(declare-fun m!199285 () Bool)

(assert (=> b!171189 m!199285))

(assert (=> b!170783 d!51791))

(assert (=> b!170872 d!51651))

(declare-fun d!51793 () Bool)

(declare-fun e!112992 () Bool)

(assert (=> d!51793 e!112992))

(declare-fun res!81355 () Bool)

(assert (=> d!51793 (=> (not res!81355) (not e!112992))))

(declare-fun lt!85173 () ListLongMap!2151)

(assert (=> d!51793 (= res!81355 (contains!1142 lt!85173 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85171 () List!2203)

(assert (=> d!51793 (= lt!85173 (ListLongMap!2152 lt!85171))))

(declare-fun lt!85172 () Unit!5227)

(declare-fun lt!85170 () Unit!5227)

(assert (=> d!51793 (= lt!85172 lt!85170)))

(assert (=> d!51793 (= (getValueByKey!182 lt!85171 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> d!51793 (= lt!85170 (lemmaContainsTupThenGetReturnValue!98 lt!85171 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> d!51793 (= lt!85171 (insertStrictlySorted!101 (toList!1091 call!17382) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> d!51793 (= (+!238 call!17382 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) lt!85173)))

(declare-fun b!171190 () Bool)

(declare-fun res!81354 () Bool)

(assert (=> b!171190 (=> (not res!81354) (not e!112992))))

(assert (=> b!171190 (= res!81354 (= (getValueByKey!182 (toList!1091 lt!85173) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171191 () Bool)

(assert (=> b!171191 (= e!112992 (contains!1144 (toList!1091 lt!85173) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(assert (= (and d!51793 res!81355) b!171190))

(assert (= (and b!171190 res!81354) b!171191))

(declare-fun m!199287 () Bool)

(assert (=> d!51793 m!199287))

(declare-fun m!199289 () Bool)

(assert (=> d!51793 m!199289))

(declare-fun m!199291 () Bool)

(assert (=> d!51793 m!199291))

(declare-fun m!199293 () Bool)

(assert (=> d!51793 m!199293))

(declare-fun m!199295 () Bool)

(assert (=> b!171190 m!199295))

(declare-fun m!199297 () Bool)

(assert (=> b!171191 m!199297))

(assert (=> b!170828 d!51793))

(declare-fun d!51795 () Bool)

(assert (=> d!51795 (= (apply!129 lt!84987 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1933 (getValueByKey!182 (toList!1091 lt!84987) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7046 () Bool)

(assert (= bs!7046 d!51795))

(assert (=> bs!7046 m!198967))

(assert (=> bs!7046 m!198967))

(declare-fun m!199299 () Bool)

(assert (=> bs!7046 m!199299))

(assert (=> b!170873 d!51795))

(declare-fun mapNonEmpty!6807 () Bool)

(declare-fun mapRes!6807 () Bool)

(declare-fun tp!15339 () Bool)

(declare-fun e!112994 () Bool)

(assert (=> mapNonEmpty!6807 (= mapRes!6807 (and tp!15339 e!112994))))

(declare-fun mapRest!6807 () (Array (_ BitVec 32) ValueCell!1658))

(declare-fun mapKey!6807 () (_ BitVec 32))

(declare-fun mapValue!6807 () ValueCell!1658)

(assert (=> mapNonEmpty!6807 (= mapRest!6806 (store mapRest!6807 mapKey!6807 mapValue!6807))))

(declare-fun condMapEmpty!6807 () Bool)

(declare-fun mapDefault!6807 () ValueCell!1658)

(assert (=> mapNonEmpty!6806 (= condMapEmpty!6807 (= mapRest!6806 ((as const (Array (_ BitVec 32) ValueCell!1658)) mapDefault!6807)))))

(declare-fun e!112993 () Bool)

(assert (=> mapNonEmpty!6806 (= tp!15338 (and e!112993 mapRes!6807))))

(declare-fun mapIsEmpty!6807 () Bool)

(assert (=> mapIsEmpty!6807 mapRes!6807))

(declare-fun b!171193 () Bool)

(assert (=> b!171193 (= e!112993 tp_is_empty!4003)))

(declare-fun b!171192 () Bool)

(assert (=> b!171192 (= e!112994 tp_is_empty!4003)))

(assert (= (and mapNonEmpty!6806 condMapEmpty!6807) mapIsEmpty!6807))

(assert (= (and mapNonEmpty!6806 (not condMapEmpty!6807)) mapNonEmpty!6807))

(assert (= (and mapNonEmpty!6807 ((_ is ValueCellFull!1658) mapValue!6807)) b!171192))

(assert (= (and mapNonEmpty!6806 ((_ is ValueCellFull!1658) mapDefault!6807)) b!171193))

(declare-fun m!199301 () Bool)

(assert (=> mapNonEmpty!6807 m!199301))

(declare-fun b_lambda!6887 () Bool)

(assert (= b_lambda!6879 (or (and b!170714 b_free!4231) b_lambda!6887)))

(declare-fun b_lambda!6889 () Bool)

(assert (= b_lambda!6883 (or (and b!170714 b_free!4231) b_lambda!6889)))

(declare-fun b_lambda!6891 () Bool)

(assert (= b_lambda!6877 (or (and b!170714 b_free!4231) b_lambda!6891)))

(declare-fun b_lambda!6893 () Bool)

(assert (= b_lambda!6881 (or (and b!170714 b_free!4231) b_lambda!6893)))

(check-sat (not d!51731) (not d!51685) (not b!171012) (not b!171027) (not b!170976) (not b!171007) (not d!51727) (not d!51777) (not b_lambda!6889) (not b!171101) (not b!171075) (not b!171127) (not bm!17399) (not d!51691) (not d!51661) (not d!51759) (not b_lambda!6885) (not b!170926) (not bm!17414) (not b!170990) (not d!51687) (not b!171122) (not d!51743) (not b!170979) (not b!170948) (not b!171153) (not b!171089) (not b!170999) (not b!171145) (not d!51689) (not d!51671) tp_is_empty!4003 (not d!51729) (not d!51655) (not bm!17417) (not b!170939) (not b!171092) (not d!51681) (not d!51695) (not d!51675) (not d!51735) (not b_lambda!6887) (not d!51645) (not b!171191) (not b!171049) (not b!171016) (not b!171021) (not b!171129) (not d!51701) (not d!51699) (not d!51783) (not d!51679) (not b!171088) (not b!171056) (not b!171121) (not b!171119) (not d!51665) (not b!171003) (not b!170900) (not b!171113) (not bm!17412) (not d!51763) (not b!171190) (not d!51643) (not b!171181) (not b!171158) (not d!51757) (not b!170996) (not b!171165) (not b!171002) (not d!51755) (not b!170940) (not b!171073) (not mapNonEmpty!6807) (not d!51693) (not b_lambda!6891) (not b!171187) (not d!51747) (not d!51749) (not b!171008) (not bm!17408) (not b!171015) (not d!51793) (not b!170913) (not d!51709) (not b!171117) (not b!171005) (not b!171097) (not d!51697) (not b!171161) (not b!170911) (not b!171140) (not b!171116) (not b_next!4231) (not b!171066) (not b!171173) (not b!171028) (not bm!17396) (not b!171058) (not b!170978) (not d!51707) (not b!170975) (not b!171000) (not b!171086) (not d!51739) (not b!170973) (not b!171170) (not d!51703) (not bm!17419) (not b!170899) (not b!171174) (not b!170981) (not bm!17413) (not b!171013) (not b!170980) (not b_lambda!6873) (not d!51787) b_and!10637 (not b!171076) (not b!171087) (not d!51723) (not b!171125) (not d!51761) (not b!171084) (not b!171180) (not d!51705) (not b!170997) (not bm!17421) (not b!171099) (not b!171070) (not d!51677) (not b!171151) (not b!171118) (not d!51767) (not d!51721) (not d!51745) (not b!171149) (not b!171067) (not bm!17393) (not b_lambda!6875) (not d!51737) (not b!171100) (not b!171001) (not b!171098) (not b!170915) (not b!170912) (not d!51667) (not b!171010) (not d!51773) (not bm!17423) (not d!51669) (not b!171077) (not b!170892) (not b!171094) (not d!51657) (not b!171146) (not d!51775) (not d!51769) (not b!170982) (not b!171068) (not b!170938) (not d!51717) (not d!51741) (not bm!17425) (not bm!17409) (not d!51795) (not b!171064) (not d!51779) (not b!171065) (not b_lambda!6893) (not d!51715) (not b!171162) (not b!171189) (not b!171178) (not b!171144) (not b!171126) (not bm!17420) (not b!170894) (not b!170987) (not d!51683) (not d!51791) (not b!171114) (not d!51753) (not b!171150) (not b!171095) (not b!171061) (not d!51713) (not d!51751) (not b!171142) (not b!171059) (not d!51765) (not b!171018))
(check-sat b_and!10637 (not b_next!4231))
(get-model)

(declare-fun d!51797 () Bool)

(assert (=> d!51797 (= (size!3676 lt!84854) (bvadd (_size!1161 lt!84854) (bvsdiv (bvadd (extraKeys!3295 lt!84854) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!171114 d!51797))

(declare-fun b!171194 () Bool)

(declare-fun lt!85177 () Unit!5227)

(declare-fun lt!85174 () Unit!5227)

(assert (=> b!171194 (= lt!85177 lt!85174)))

(declare-fun lt!85175 () ListLongMap!2151)

(declare-fun lt!85179 () (_ BitVec 64))

(declare-fun lt!85176 () V!4985)

(declare-fun lt!85180 () (_ BitVec 64))

(assert (=> b!171194 (not (contains!1142 (+!238 lt!85175 (tuple2!3233 lt!85180 lt!85176)) lt!85179))))

(assert (=> b!171194 (= lt!85174 (addStillNotContains!72 lt!85175 lt!85180 lt!85176 lt!85179))))

(assert (=> b!171194 (= lt!85179 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!171194 (= lt!85176 (get!1932 (select (arr!3377 (_values!3537 lt!84854)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 lt!84854) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171194 (= lt!85180 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000))))

(declare-fun call!17429 () ListLongMap!2151)

(assert (=> b!171194 (= lt!85175 call!17429)))

(declare-fun e!112997 () ListLongMap!2151)

(assert (=> b!171194 (= e!112997 (+!238 call!17429 (tuple2!3233 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 lt!84854)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 lt!84854) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!171195 () Bool)

(declare-fun e!112996 () Bool)

(declare-fun e!113000 () Bool)

(assert (=> b!171195 (= e!112996 e!113000)))

(declare-fun c!30581 () Bool)

(declare-fun e!112998 () Bool)

(assert (=> b!171195 (= c!30581 e!112998)))

(declare-fun res!81356 () Bool)

(assert (=> b!171195 (=> (not res!81356) (not e!112998))))

(assert (=> b!171195 (= res!81356 (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))))))

(declare-fun b!171196 () Bool)

(declare-fun e!113001 () Bool)

(assert (=> b!171196 (= e!113000 e!113001)))

(assert (=> b!171196 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))))))

(declare-fun res!81357 () Bool)

(declare-fun lt!85178 () ListLongMap!2151)

(assert (=> b!171196 (= res!81357 (contains!1142 lt!85178 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(assert (=> b!171196 (=> (not res!81357) (not e!113001))))

(declare-fun b!171197 () Bool)

(assert (=> b!171197 (= e!112998 (validKeyInArray!0 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(assert (=> b!171197 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!171198 () Bool)

(declare-fun e!112999 () Bool)

(assert (=> b!171198 (= e!113000 e!112999)))

(declare-fun c!30580 () Bool)

(assert (=> b!171198 (= c!30580 (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))))))

(declare-fun b!171199 () Bool)

(declare-fun e!112995 () ListLongMap!2151)

(assert (=> b!171199 (= e!112995 e!112997)))

(declare-fun c!30582 () Bool)

(assert (=> b!171199 (= c!30582 (validKeyInArray!0 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(declare-fun b!171200 () Bool)

(assert (=> b!171200 (= e!112999 (= lt!85178 (getCurrentListMapNoExtraKeys!150 (_keys!5385 lt!84854) (_values!3537 lt!84854) (mask!8381 lt!84854) (extraKeys!3295 lt!84854) (zeroValue!3397 lt!84854) (minValue!3397 lt!84854) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3554 lt!84854))))))

(declare-fun b!171201 () Bool)

(assert (=> b!171201 (= e!112999 (isEmpty!437 lt!85178))))

(declare-fun b!171202 () Bool)

(assert (=> b!171202 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))))))

(assert (=> b!171202 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3671 (_values!3537 lt!84854))))))

(assert (=> b!171202 (= e!113001 (= (apply!129 lt!85178 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)) (get!1932 (select (arr!3377 (_values!3537 lt!84854)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 lt!84854) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171203 () Bool)

(declare-fun res!81359 () Bool)

(assert (=> b!171203 (=> (not res!81359) (not e!112996))))

(assert (=> b!171203 (= res!81359 (not (contains!1142 lt!85178 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171204 () Bool)

(assert (=> b!171204 (= e!112997 call!17429)))

(declare-fun b!171205 () Bool)

(assert (=> b!171205 (= e!112995 (ListLongMap!2152 Nil!2200))))

(declare-fun d!51799 () Bool)

(assert (=> d!51799 e!112996))

(declare-fun res!81358 () Bool)

(assert (=> d!51799 (=> (not res!81358) (not e!112996))))

(assert (=> d!51799 (= res!81358 (not (contains!1142 lt!85178 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51799 (= lt!85178 e!112995)))

(declare-fun c!30579 () Bool)

(assert (=> d!51799 (= c!30579 (bvsge #b00000000000000000000000000000000 (size!3670 (_keys!5385 lt!84854))))))

(assert (=> d!51799 (validMask!0 (mask!8381 lt!84854))))

(assert (=> d!51799 (= (getCurrentListMapNoExtraKeys!150 (_keys!5385 lt!84854) (_values!3537 lt!84854) (mask!8381 lt!84854) (extraKeys!3295 lt!84854) (zeroValue!3397 lt!84854) (minValue!3397 lt!84854) #b00000000000000000000000000000000 (defaultEntry!3554 lt!84854)) lt!85178)))

(declare-fun bm!17426 () Bool)

(assert (=> bm!17426 (= call!17429 (getCurrentListMapNoExtraKeys!150 (_keys!5385 lt!84854) (_values!3537 lt!84854) (mask!8381 lt!84854) (extraKeys!3295 lt!84854) (zeroValue!3397 lt!84854) (minValue!3397 lt!84854) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3554 lt!84854)))))

(assert (= (and d!51799 c!30579) b!171205))

(assert (= (and d!51799 (not c!30579)) b!171199))

(assert (= (and b!171199 c!30582) b!171194))

(assert (= (and b!171199 (not c!30582)) b!171204))

(assert (= (or b!171194 b!171204) bm!17426))

(assert (= (and d!51799 res!81358) b!171203))

(assert (= (and b!171203 res!81359) b!171195))

(assert (= (and b!171195 res!81356) b!171197))

(assert (= (and b!171195 c!30581) b!171196))

(assert (= (and b!171195 (not c!30581)) b!171198))

(assert (= (and b!171196 res!81357) b!171202))

(assert (= (and b!171198 c!30580) b!171200))

(assert (= (and b!171198 (not c!30580)) b!171201))

(declare-fun b_lambda!6895 () Bool)

(assert (=> (not b_lambda!6895) (not b!171194)))

(assert (=> b!171194 t!7002))

(declare-fun b_and!10639 () Bool)

(assert (= b_and!10637 (and (=> t!7002 result!4559) b_and!10639)))

(declare-fun b_lambda!6897 () Bool)

(assert (=> (not b_lambda!6897) (not b!171202)))

(assert (=> b!171202 t!7002))

(declare-fun b_and!10641 () Bool)

(assert (= b_and!10639 (and (=> t!7002 result!4559) b_and!10641)))

(declare-fun m!199303 () Bool)

(assert (=> b!171200 m!199303))

(declare-fun m!199305 () Bool)

(assert (=> b!171203 m!199305))

(assert (=> b!171197 m!199007))

(assert (=> b!171197 m!199007))

(assert (=> b!171197 m!199009))

(declare-fun m!199307 () Bool)

(assert (=> d!51799 m!199307))

(assert (=> d!51799 m!199085))

(assert (=> b!171194 m!199215))

(assert (=> b!171194 m!199213))

(assert (=> b!171194 m!199213))

(assert (=> b!171194 m!199215))

(assert (=> b!171194 m!199217))

(assert (=> b!171194 m!199007))

(declare-fun m!199309 () Bool)

(assert (=> b!171194 m!199309))

(declare-fun m!199311 () Bool)

(assert (=> b!171194 m!199311))

(declare-fun m!199313 () Bool)

(assert (=> b!171194 m!199313))

(declare-fun m!199315 () Bool)

(assert (=> b!171194 m!199315))

(assert (=> b!171194 m!199311))

(assert (=> b!171202 m!199215))

(assert (=> b!171202 m!199213))

(assert (=> b!171202 m!199213))

(assert (=> b!171202 m!199215))

(assert (=> b!171202 m!199217))

(assert (=> b!171202 m!199007))

(declare-fun m!199317 () Bool)

(assert (=> b!171202 m!199317))

(assert (=> b!171202 m!199007))

(assert (=> bm!17426 m!199303))

(assert (=> b!171196 m!199007))

(assert (=> b!171196 m!199007))

(declare-fun m!199319 () Bool)

(assert (=> b!171196 m!199319))

(assert (=> b!171199 m!199007))

(assert (=> b!171199 m!199007))

(assert (=> b!171199 m!199009))

(declare-fun m!199321 () Bool)

(assert (=> b!171201 m!199321))

(assert (=> bm!17421 d!51799))

(declare-fun lt!85181 () Bool)

(declare-fun d!51801 () Bool)

(assert (=> d!51801 (= lt!85181 (select (content!147 (toList!1091 lt!85048)) (tuple2!3233 lt!84945 v!309)))))

(declare-fun e!113003 () Bool)

(assert (=> d!51801 (= lt!85181 e!113003)))

(declare-fun res!81360 () Bool)

(assert (=> d!51801 (=> (not res!81360) (not e!113003))))

(assert (=> d!51801 (= res!81360 ((_ is Cons!2199) (toList!1091 lt!85048)))))

(assert (=> d!51801 (= (contains!1144 (toList!1091 lt!85048) (tuple2!3233 lt!84945 v!309)) lt!85181)))

(declare-fun b!171206 () Bool)

(declare-fun e!113002 () Bool)

(assert (=> b!171206 (= e!113003 e!113002)))

(declare-fun res!81361 () Bool)

(assert (=> b!171206 (=> res!81361 e!113002)))

(assert (=> b!171206 (= res!81361 (= (h!2816 (toList!1091 lt!85048)) (tuple2!3233 lt!84945 v!309)))))

(declare-fun b!171207 () Bool)

(assert (=> b!171207 (= e!113002 (contains!1144 (t!6996 (toList!1091 lt!85048)) (tuple2!3233 lt!84945 v!309)))))

(assert (= (and d!51801 res!81360) b!171206))

(assert (= (and b!171206 (not res!81361)) b!171207))

(declare-fun m!199323 () Bool)

(assert (=> d!51801 m!199323))

(declare-fun m!199325 () Bool)

(assert (=> d!51801 m!199325))

(declare-fun m!199327 () Bool)

(assert (=> b!171207 m!199327))

(assert (=> b!171000 d!51801))

(declare-fun d!51803 () Bool)

(assert (=> d!51803 (= (validKeyInArray!0 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!171089 d!51803))

(declare-fun d!51805 () Bool)

(declare-fun res!81366 () Bool)

(declare-fun e!113008 () Bool)

(assert (=> d!51805 (=> res!81366 e!113008)))

(assert (=> d!51805 (= res!81366 (or ((_ is Nil!2200) lt!85082) ((_ is Nil!2200) (t!6996 lt!85082))))))

(assert (=> d!51805 (= (isStrictlySorted!326 lt!85082) e!113008)))

(declare-fun b!171212 () Bool)

(declare-fun e!113009 () Bool)

(assert (=> b!171212 (= e!113008 e!113009)))

(declare-fun res!81367 () Bool)

(assert (=> b!171212 (=> (not res!81367) (not e!113009))))

(assert (=> b!171212 (= res!81367 (bvslt (_1!1627 (h!2816 lt!85082)) (_1!1627 (h!2816 (t!6996 lt!85082)))))))

(declare-fun b!171213 () Bool)

(assert (=> b!171213 (= e!113009 (isStrictlySorted!326 (t!6996 lt!85082)))))

(assert (= (and d!51805 (not res!81366)) b!171212))

(assert (= (and b!171212 res!81367) b!171213))

(declare-fun m!199329 () Bool)

(assert (=> b!171213 m!199329))

(assert (=> d!51715 d!51805))

(declare-fun d!51807 () Bool)

(declare-fun res!81368 () Bool)

(declare-fun e!113010 () Bool)

(assert (=> d!51807 (=> res!81368 e!113010)))

(assert (=> d!51807 (= res!81368 (or ((_ is Nil!2200) (toList!1091 (map!1834 thiss!1248))) ((_ is Nil!2200) (t!6996 (toList!1091 (map!1834 thiss!1248))))))))

(assert (=> d!51807 (= (isStrictlySorted!326 (toList!1091 (map!1834 thiss!1248))) e!113010)))

(declare-fun b!171214 () Bool)

(declare-fun e!113011 () Bool)

(assert (=> b!171214 (= e!113010 e!113011)))

(declare-fun res!81369 () Bool)

(assert (=> b!171214 (=> (not res!81369) (not e!113011))))

(assert (=> b!171214 (= res!81369 (bvslt (_1!1627 (h!2816 (toList!1091 (map!1834 thiss!1248)))) (_1!1627 (h!2816 (t!6996 (toList!1091 (map!1834 thiss!1248)))))))))

(declare-fun b!171215 () Bool)

(assert (=> b!171215 (= e!113011 (isStrictlySorted!326 (t!6996 (toList!1091 (map!1834 thiss!1248)))))))

(assert (= (and d!51807 (not res!81368)) b!171214))

(assert (= (and b!171214 res!81369) b!171215))

(declare-fun m!199331 () Bool)

(assert (=> b!171215 m!199331))

(assert (=> d!51715 d!51807))

(declare-fun d!51809 () Bool)

(assert (=> d!51809 (isDefined!136 (getValueByKey!182 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))) lt!84949))))

(declare-fun lt!85182 () Unit!5227)

(assert (=> d!51809 (= lt!85182 (choose!930 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))) lt!84949))))

(declare-fun e!113012 () Bool)

(assert (=> d!51809 e!113012))

(declare-fun res!81370 () Bool)

(assert (=> d!51809 (=> (not res!81370) (not e!113012))))

(assert (=> d!51809 (= res!81370 (isStrictlySorted!326 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309)))))))

(assert (=> d!51809 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))) lt!84949) lt!85182)))

(declare-fun b!171216 () Bool)

(assert (=> b!171216 (= e!113012 (containsKey!186 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))) lt!84949))))

(assert (= (and d!51809 res!81370) b!171216))

(assert (=> d!51809 m!198917))

(assert (=> d!51809 m!198917))

(assert (=> d!51809 m!198919))

(declare-fun m!199333 () Bool)

(assert (=> d!51809 m!199333))

(declare-fun m!199335 () Bool)

(assert (=> d!51809 m!199335))

(assert (=> b!171216 m!198913))

(assert (=> b!171003 d!51809))

(declare-fun d!51811 () Bool)

(assert (=> d!51811 (= (isDefined!136 (getValueByKey!182 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))) lt!84949)) (not (isEmpty!438 (getValueByKey!182 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))) lt!84949))))))

(declare-fun bs!7047 () Bool)

(assert (= bs!7047 d!51811))

(assert (=> bs!7047 m!198917))

(declare-fun m!199337 () Bool)

(assert (=> bs!7047 m!199337))

(assert (=> b!171003 d!51811))

(declare-fun b!171217 () Bool)

(declare-fun e!113013 () Option!188)

(assert (=> b!171217 (= e!113013 (Some!187 (_2!1627 (h!2816 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309)))))))))

(declare-fun e!113014 () Option!188)

(declare-fun b!171219 () Bool)

(assert (=> b!171219 (= e!113014 (getValueByKey!182 (t!6996 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309)))) lt!84949))))

(declare-fun b!171220 () Bool)

(assert (=> b!171220 (= e!113014 None!186)))

(declare-fun d!51813 () Bool)

(declare-fun c!30583 () Bool)

(assert (=> d!51813 (= c!30583 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309)))) (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))))) lt!84949)))))

(assert (=> d!51813 (= (getValueByKey!182 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))) lt!84949) e!113013)))

(declare-fun b!171218 () Bool)

(assert (=> b!171218 (= e!113013 e!113014)))

(declare-fun c!30584 () Bool)

(assert (=> b!171218 (= c!30584 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309)))) (not (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))))) lt!84949))))))

(assert (= (and d!51813 c!30583) b!171217))

(assert (= (and d!51813 (not c!30583)) b!171218))

(assert (= (and b!171218 c!30584) b!171219))

(assert (= (and b!171218 (not c!30584)) b!171220))

(declare-fun m!199339 () Bool)

(assert (=> b!171219 m!199339))

(assert (=> b!171003 d!51813))

(assert (=> b!171170 d!51651))

(declare-fun d!51815 () Bool)

(declare-fun isEmpty!439 (List!2203) Bool)

(assert (=> d!51815 (= (isEmpty!437 lt!85104) (isEmpty!439 (toList!1091 lt!85104)))))

(declare-fun bs!7048 () Bool)

(assert (= bs!7048 d!51815))

(declare-fun m!199341 () Bool)

(assert (=> bs!7048 m!199341))

(assert (=> b!171099 d!51815))

(declare-fun d!51817 () Bool)

(declare-fun e!113015 () Bool)

(assert (=> d!51817 e!113015))

(declare-fun res!81372 () Bool)

(assert (=> d!51817 (=> (not res!81372) (not e!113015))))

(declare-fun lt!85186 () ListLongMap!2151)

(assert (=> d!51817 (= res!81372 (contains!1142 lt!85186 (_1!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!85184 () List!2203)

(assert (=> d!51817 (= lt!85186 (ListLongMap!2152 lt!85184))))

(declare-fun lt!85185 () Unit!5227)

(declare-fun lt!85183 () Unit!5227)

(assert (=> d!51817 (= lt!85185 lt!85183)))

(assert (=> d!51817 (= (getValueByKey!182 lt!85184 (_1!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!187 (_2!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51817 (= lt!85183 (lemmaContainsTupThenGetReturnValue!98 lt!85184 (_1!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51817 (= lt!85184 (insertStrictlySorted!101 (toList!1091 call!17402) (_1!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51817 (= (+!238 call!17402 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!85186)))

(declare-fun b!171221 () Bool)

(declare-fun res!81371 () Bool)

(assert (=> b!171221 (=> (not res!81371) (not e!113015))))

(assert (=> b!171221 (= res!81371 (= (getValueByKey!182 (toList!1091 lt!85186) (_1!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!187 (_2!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!171222 () Bool)

(assert (=> b!171222 (= e!113015 (contains!1144 (toList!1091 lt!85186) (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!51817 res!81372) b!171221))

(assert (= (and b!171221 res!81371) b!171222))

(declare-fun m!199343 () Bool)

(assert (=> d!51817 m!199343))

(declare-fun m!199345 () Bool)

(assert (=> d!51817 m!199345))

(declare-fun m!199347 () Bool)

(assert (=> d!51817 m!199347))

(declare-fun m!199349 () Bool)

(assert (=> d!51817 m!199349))

(declare-fun m!199351 () Bool)

(assert (=> b!171221 m!199351))

(declare-fun m!199353 () Bool)

(assert (=> b!171222 m!199353))

(assert (=> b!170973 d!51817))

(declare-fun d!51819 () Bool)

(declare-fun e!113017 () Bool)

(assert (=> d!51819 e!113017))

(declare-fun res!81373 () Bool)

(assert (=> d!51819 (=> res!81373 e!113017)))

(declare-fun lt!85190 () Bool)

(assert (=> d!51819 (= res!81373 (not lt!85190))))

(declare-fun lt!85188 () Bool)

(assert (=> d!51819 (= lt!85190 lt!85188)))

(declare-fun lt!85187 () Unit!5227)

(declare-fun e!113016 () Unit!5227)

(assert (=> d!51819 (= lt!85187 e!113016)))

(declare-fun c!30585 () Bool)

(assert (=> d!51819 (= c!30585 lt!85188)))

(assert (=> d!51819 (= lt!85188 (containsKey!186 (toList!1091 (+!238 lt!85028 (tuple2!3233 lt!85033 lt!85029))) lt!85032))))

(assert (=> d!51819 (= (contains!1142 (+!238 lt!85028 (tuple2!3233 lt!85033 lt!85029)) lt!85032) lt!85190)))

(declare-fun b!171223 () Bool)

(declare-fun lt!85189 () Unit!5227)

(assert (=> b!171223 (= e!113016 lt!85189)))

(assert (=> b!171223 (= lt!85189 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 (+!238 lt!85028 (tuple2!3233 lt!85033 lt!85029))) lt!85032))))

(assert (=> b!171223 (isDefined!136 (getValueByKey!182 (toList!1091 (+!238 lt!85028 (tuple2!3233 lt!85033 lt!85029))) lt!85032))))

(declare-fun b!171224 () Bool)

(declare-fun Unit!5245 () Unit!5227)

(assert (=> b!171224 (= e!113016 Unit!5245)))

(declare-fun b!171225 () Bool)

(assert (=> b!171225 (= e!113017 (isDefined!136 (getValueByKey!182 (toList!1091 (+!238 lt!85028 (tuple2!3233 lt!85033 lt!85029))) lt!85032)))))

(assert (= (and d!51819 c!30585) b!171223))

(assert (= (and d!51819 (not c!30585)) b!171224))

(assert (= (and d!51819 (not res!81373)) b!171225))

(declare-fun m!199355 () Bool)

(assert (=> d!51819 m!199355))

(declare-fun m!199357 () Bool)

(assert (=> b!171223 m!199357))

(declare-fun m!199359 () Bool)

(assert (=> b!171223 m!199359))

(assert (=> b!171223 m!199359))

(declare-fun m!199361 () Bool)

(assert (=> b!171223 m!199361))

(assert (=> b!171225 m!199359))

(assert (=> b!171225 m!199359))

(assert (=> b!171225 m!199361))

(assert (=> b!170973 d!51819))

(declare-fun d!51821 () Bool)

(declare-fun e!113018 () Bool)

(assert (=> d!51821 e!113018))

(declare-fun res!81375 () Bool)

(assert (=> d!51821 (=> (not res!81375) (not e!113018))))

(declare-fun lt!85194 () ListLongMap!2151)

(assert (=> d!51821 (= res!81375 (contains!1142 lt!85194 (_1!1627 (tuple2!3233 lt!85033 lt!85029))))))

(declare-fun lt!85192 () List!2203)

(assert (=> d!51821 (= lt!85194 (ListLongMap!2152 lt!85192))))

(declare-fun lt!85193 () Unit!5227)

(declare-fun lt!85191 () Unit!5227)

(assert (=> d!51821 (= lt!85193 lt!85191)))

(assert (=> d!51821 (= (getValueByKey!182 lt!85192 (_1!1627 (tuple2!3233 lt!85033 lt!85029))) (Some!187 (_2!1627 (tuple2!3233 lt!85033 lt!85029))))))

(assert (=> d!51821 (= lt!85191 (lemmaContainsTupThenGetReturnValue!98 lt!85192 (_1!1627 (tuple2!3233 lt!85033 lt!85029)) (_2!1627 (tuple2!3233 lt!85033 lt!85029))))))

(assert (=> d!51821 (= lt!85192 (insertStrictlySorted!101 (toList!1091 lt!85028) (_1!1627 (tuple2!3233 lt!85033 lt!85029)) (_2!1627 (tuple2!3233 lt!85033 lt!85029))))))

(assert (=> d!51821 (= (+!238 lt!85028 (tuple2!3233 lt!85033 lt!85029)) lt!85194)))

(declare-fun b!171226 () Bool)

(declare-fun res!81374 () Bool)

(assert (=> b!171226 (=> (not res!81374) (not e!113018))))

(assert (=> b!171226 (= res!81374 (= (getValueByKey!182 (toList!1091 lt!85194) (_1!1627 (tuple2!3233 lt!85033 lt!85029))) (Some!187 (_2!1627 (tuple2!3233 lt!85033 lt!85029)))))))

(declare-fun b!171227 () Bool)

(assert (=> b!171227 (= e!113018 (contains!1144 (toList!1091 lt!85194) (tuple2!3233 lt!85033 lt!85029)))))

(assert (= (and d!51821 res!81375) b!171226))

(assert (= (and b!171226 res!81374) b!171227))

(declare-fun m!199363 () Bool)

(assert (=> d!51821 m!199363))

(declare-fun m!199365 () Bool)

(assert (=> d!51821 m!199365))

(declare-fun m!199367 () Bool)

(assert (=> d!51821 m!199367))

(declare-fun m!199369 () Bool)

(assert (=> d!51821 m!199369))

(declare-fun m!199371 () Bool)

(assert (=> b!171226 m!199371))

(declare-fun m!199373 () Bool)

(assert (=> b!171227 m!199373))

(assert (=> b!170973 d!51821))

(assert (=> b!170973 d!51647))

(declare-fun d!51823 () Bool)

(assert (=> d!51823 (not (contains!1142 (+!238 lt!85028 (tuple2!3233 lt!85033 lt!85029)) lt!85032))))

(declare-fun lt!85197 () Unit!5227)

(declare-fun choose!934 (ListLongMap!2151 (_ BitVec 64) V!4985 (_ BitVec 64)) Unit!5227)

(assert (=> d!51823 (= lt!85197 (choose!934 lt!85028 lt!85033 lt!85029 lt!85032))))

(declare-fun e!113021 () Bool)

(assert (=> d!51823 e!113021))

(declare-fun res!81378 () Bool)

(assert (=> d!51823 (=> (not res!81378) (not e!113021))))

(assert (=> d!51823 (= res!81378 (not (contains!1142 lt!85028 lt!85032)))))

(assert (=> d!51823 (= (addStillNotContains!72 lt!85028 lt!85033 lt!85029 lt!85032) lt!85197)))

(declare-fun b!171231 () Bool)

(assert (=> b!171231 (= e!113021 (not (= lt!85033 lt!85032)))))

(assert (= (and d!51823 res!81378) b!171231))

(assert (=> d!51823 m!198841))

(assert (=> d!51823 m!198841))

(assert (=> d!51823 m!198843))

(declare-fun m!199375 () Bool)

(assert (=> d!51823 m!199375))

(declare-fun m!199377 () Bool)

(assert (=> d!51823 m!199377))

(assert (=> b!170973 d!51823))

(assert (=> d!51669 d!51671))

(assert (=> d!51669 d!51673))

(declare-fun d!51825 () Bool)

(assert (=> d!51825 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84853) key!828))))

(assert (=> d!51825 true))

(declare-fun _$12!443 () Unit!5227)

(assert (=> d!51825 (= (choose!930 (toList!1091 lt!84853) key!828) _$12!443)))

(declare-fun bs!7049 () Bool)

(assert (= bs!7049 d!51825))

(assert (=> bs!7049 m!198625))

(assert (=> bs!7049 m!198625))

(assert (=> bs!7049 m!198627))

(assert (=> d!51669 d!51825))

(declare-fun d!51827 () Bool)

(declare-fun res!81379 () Bool)

(declare-fun e!113022 () Bool)

(assert (=> d!51827 (=> res!81379 e!113022)))

(assert (=> d!51827 (= res!81379 (or ((_ is Nil!2200) (toList!1091 lt!84853)) ((_ is Nil!2200) (t!6996 (toList!1091 lt!84853)))))))

(assert (=> d!51827 (= (isStrictlySorted!326 (toList!1091 lt!84853)) e!113022)))

(declare-fun b!171232 () Bool)

(declare-fun e!113023 () Bool)

(assert (=> b!171232 (= e!113022 e!113023)))

(declare-fun res!81380 () Bool)

(assert (=> b!171232 (=> (not res!81380) (not e!113023))))

(assert (=> b!171232 (= res!81380 (bvslt (_1!1627 (h!2816 (toList!1091 lt!84853))) (_1!1627 (h!2816 (t!6996 (toList!1091 lt!84853))))))))

(declare-fun b!171233 () Bool)

(assert (=> b!171233 (= e!113023 (isStrictlySorted!326 (t!6996 (toList!1091 lt!84853))))))

(assert (= (and d!51827 (not res!81379)) b!171232))

(assert (= (and b!171232 res!81380) b!171233))

(declare-fun m!199379 () Bool)

(assert (=> b!171233 m!199379))

(assert (=> d!51669 d!51827))

(declare-fun d!51829 () Bool)

(assert (=> d!51829 (= (get!1933 (getValueByKey!182 (toList!1091 lt!84947) lt!84961)) (v!3908 (getValueByKey!182 (toList!1091 lt!84947) lt!84961)))))

(assert (=> d!51675 d!51829))

(declare-fun b!171234 () Bool)

(declare-fun e!113024 () Option!188)

(assert (=> b!171234 (= e!113024 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!84947)))))))

(declare-fun b!171236 () Bool)

(declare-fun e!113025 () Option!188)

(assert (=> b!171236 (= e!113025 (getValueByKey!182 (t!6996 (toList!1091 lt!84947)) lt!84961))))

(declare-fun b!171237 () Bool)

(assert (=> b!171237 (= e!113025 None!186)))

(declare-fun d!51831 () Bool)

(declare-fun c!30586 () Bool)

(assert (=> d!51831 (= c!30586 (and ((_ is Cons!2199) (toList!1091 lt!84947)) (= (_1!1627 (h!2816 (toList!1091 lt!84947))) lt!84961)))))

(assert (=> d!51831 (= (getValueByKey!182 (toList!1091 lt!84947) lt!84961) e!113024)))

(declare-fun b!171235 () Bool)

(assert (=> b!171235 (= e!113024 e!113025)))

(declare-fun c!30587 () Bool)

(assert (=> b!171235 (= c!30587 (and ((_ is Cons!2199) (toList!1091 lt!84947)) (not (= (_1!1627 (h!2816 (toList!1091 lt!84947))) lt!84961))))))

(assert (= (and d!51831 c!30586) b!171234))

(assert (= (and d!51831 (not c!30586)) b!171235))

(assert (= (and b!171235 c!30587) b!171236))

(assert (= (and b!171235 (not c!30587)) b!171237))

(declare-fun m!199381 () Bool)

(assert (=> b!171236 m!199381))

(assert (=> d!51675 d!51831))

(declare-fun d!51833 () Bool)

(declare-fun lt!85200 () Bool)

(declare-fun content!148 (List!2205) (InoxSet (_ BitVec 64)))

(assert (=> d!51833 (= lt!85200 (select (content!148 Nil!2202) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!113030 () Bool)

(assert (=> d!51833 (= lt!85200 e!113030)))

(declare-fun res!81386 () Bool)

(assert (=> d!51833 (=> (not res!81386) (not e!113030))))

(assert (=> d!51833 (= res!81386 ((_ is Cons!2201) Nil!2202))))

(assert (=> d!51833 (= (contains!1145 Nil!2202 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) lt!85200)))

(declare-fun b!171242 () Bool)

(declare-fun e!113031 () Bool)

(assert (=> b!171242 (= e!113030 e!113031)))

(declare-fun res!81385 () Bool)

(assert (=> b!171242 (=> res!81385 e!113031)))

(assert (=> b!171242 (= res!81385 (= (h!2818 Nil!2202) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171243 () Bool)

(assert (=> b!171243 (= e!113031 (contains!1145 (t!7000 Nil!2202) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51833 res!81386) b!171242))

(assert (= (and b!171242 (not res!81385)) b!171243))

(declare-fun m!199383 () Bool)

(assert (=> d!51833 m!199383))

(assert (=> d!51833 m!198643))

(declare-fun m!199385 () Bool)

(assert (=> d!51833 m!199385))

(assert (=> b!171243 m!198643))

(declare-fun m!199387 () Bool)

(assert (=> b!171243 m!199387))

(assert (=> b!170938 d!51833))

(declare-fun d!51835 () Bool)

(declare-fun res!81387 () Bool)

(declare-fun e!113032 () Bool)

(assert (=> d!51835 (=> res!81387 e!113032)))

(assert (=> d!51835 (= res!81387 (and ((_ is Cons!2199) (toList!1091 lt!84992)) (= (_1!1627 (h!2816 (toList!1091 lt!84992))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!51835 (= (containsKey!186 (toList!1091 lt!84992) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113032)))

(declare-fun b!171244 () Bool)

(declare-fun e!113033 () Bool)

(assert (=> b!171244 (= e!113032 e!113033)))

(declare-fun res!81388 () Bool)

(assert (=> b!171244 (=> (not res!81388) (not e!113033))))

(assert (=> b!171244 (= res!81388 (and (or (not ((_ is Cons!2199) (toList!1091 lt!84992))) (bvsle (_1!1627 (h!2816 (toList!1091 lt!84992))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2199) (toList!1091 lt!84992)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84992))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171245 () Bool)

(assert (=> b!171245 (= e!113033 (containsKey!186 (t!6996 (toList!1091 lt!84992)) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!51835 (not res!81387)) b!171244))

(assert (= (and b!171244 res!81388) b!171245))

(declare-fun m!199389 () Bool)

(assert (=> b!171245 m!199389))

(assert (=> d!51723 d!51835))

(declare-fun b!171246 () Bool)

(declare-fun e!113034 () Option!188)

(assert (=> b!171246 (= e!113034 (Some!187 (_2!1627 (h!2816 (t!6996 lt!84895)))))))

(declare-fun e!113035 () Option!188)

(declare-fun b!171248 () Bool)

(assert (=> b!171248 (= e!113035 (getValueByKey!182 (t!6996 (t!6996 lt!84895)) (_1!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun b!171249 () Bool)

(assert (=> b!171249 (= e!113035 None!186)))

(declare-fun c!30588 () Bool)

(declare-fun d!51837 () Bool)

(assert (=> d!51837 (= c!30588 (and ((_ is Cons!2199) (t!6996 lt!84895)) (= (_1!1627 (h!2816 (t!6996 lt!84895))) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(assert (=> d!51837 (= (getValueByKey!182 (t!6996 lt!84895) (_1!1627 (tuple2!3233 key!828 v!309))) e!113034)))

(declare-fun b!171247 () Bool)

(assert (=> b!171247 (= e!113034 e!113035)))

(declare-fun c!30589 () Bool)

(assert (=> b!171247 (= c!30589 (and ((_ is Cons!2199) (t!6996 lt!84895)) (not (= (_1!1627 (h!2816 (t!6996 lt!84895))) (_1!1627 (tuple2!3233 key!828 v!309))))))))

(assert (= (and d!51837 c!30588) b!171246))

(assert (= (and d!51837 (not c!30588)) b!171247))

(assert (= (and b!171247 c!30589) b!171248))

(assert (= (and b!171247 (not c!30589)) b!171249))

(declare-fun m!199391 () Bool)

(assert (=> b!171248 m!199391))

(assert (=> b!171021 d!51837))

(declare-fun b!171250 () Bool)

(declare-fun e!113036 () List!2203)

(assert (=> b!171250 (= e!113036 (insertStrictlySorted!101 (t!6996 (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!171251 () Bool)

(declare-fun e!113038 () List!2203)

(declare-fun call!17431 () List!2203)

(assert (=> b!171251 (= e!113038 call!17431)))

(declare-fun b!171252 () Bool)

(declare-fun e!113037 () List!2203)

(declare-fun call!17430 () List!2203)

(assert (=> b!171252 (= e!113037 call!17430)))

(declare-fun bm!17427 () Bool)

(declare-fun call!17432 () List!2203)

(assert (=> bm!17427 (= call!17432 call!17431)))

(declare-fun b!171253 () Bool)

(declare-fun e!113040 () List!2203)

(assert (=> b!171253 (= e!113038 e!113040)))

(declare-fun c!30590 () Bool)

(assert (=> b!171253 (= c!30590 (and ((_ is Cons!2199) (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (= (_1!1627 (h!2816 (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun d!51839 () Bool)

(declare-fun e!113039 () Bool)

(assert (=> d!51839 e!113039))

(declare-fun res!81389 () Bool)

(assert (=> d!51839 (=> (not res!81389) (not e!113039))))

(declare-fun lt!85201 () List!2203)

(assert (=> d!51839 (= res!81389 (isStrictlySorted!326 lt!85201))))

(assert (=> d!51839 (= lt!85201 e!113038)))

(declare-fun c!30592 () Bool)

(assert (=> d!51839 (= c!30592 (and ((_ is Cons!2199) (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (bvslt (_1!1627 (h!2816 (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!51839 (isStrictlySorted!326 (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))))

(assert (=> d!51839 (= (insertStrictlySorted!101 (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85201)))

(declare-fun b!171254 () Bool)

(assert (=> b!171254 (= e!113040 call!17432)))

(declare-fun b!171255 () Bool)

(declare-fun c!30591 () Bool)

(assert (=> b!171255 (= e!113036 (ite c!30590 (t!6996 (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (ite c!30591 (Cons!2199 (h!2816 (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (t!6996 (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))) Nil!2200)))))

(declare-fun bm!17428 () Bool)

(assert (=> bm!17428 (= call!17430 call!17432)))

(declare-fun b!171256 () Bool)

(assert (=> b!171256 (= c!30591 (and ((_ is Cons!2199) (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (bvsgt (_1!1627 (h!2816 (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> b!171256 (= e!113040 e!113037)))

(declare-fun bm!17429 () Bool)

(assert (=> bm!17429 (= call!17431 ($colon$colon!96 e!113036 (ite c!30592 (h!2816 (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (tuple2!3233 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!30593 () Bool)

(assert (=> bm!17429 (= c!30593 c!30592)))

(declare-fun b!171257 () Bool)

(declare-fun res!81390 () Bool)

(assert (=> b!171257 (=> (not res!81390) (not e!113039))))

(assert (=> b!171257 (= res!81390 (containsKey!186 lt!85201 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!171258 () Bool)

(assert (=> b!171258 (= e!113037 call!17430)))

(declare-fun b!171259 () Bool)

(assert (=> b!171259 (= e!113039 (contains!1144 lt!85201 (tuple2!3233 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!51839 c!30592) b!171251))

(assert (= (and d!51839 (not c!30592)) b!171253))

(assert (= (and b!171253 c!30590) b!171254))

(assert (= (and b!171253 (not c!30590)) b!171256))

(assert (= (and b!171256 c!30591) b!171258))

(assert (= (and b!171256 (not c!30591)) b!171252))

(assert (= (or b!171258 b!171252) bm!17428))

(assert (= (or b!171254 bm!17428) bm!17427))

(assert (= (or b!171251 bm!17427) bm!17429))

(assert (= (and bm!17429 c!30593) b!171250))

(assert (= (and bm!17429 (not c!30593)) b!171255))

(assert (= (and d!51839 res!81389) b!171257))

(assert (= (and b!171257 res!81390) b!171259))

(declare-fun m!199393 () Bool)

(assert (=> b!171250 m!199393))

(declare-fun m!199395 () Bool)

(assert (=> b!171259 m!199395))

(declare-fun m!199397 () Bool)

(assert (=> bm!17429 m!199397))

(declare-fun m!199399 () Bool)

(assert (=> b!171257 m!199399))

(declare-fun m!199401 () Bool)

(assert (=> d!51839 m!199401))

(declare-fun m!199403 () Bool)

(assert (=> d!51839 m!199403))

(assert (=> b!171077 d!51839))

(declare-fun d!51841 () Bool)

(declare-fun e!113042 () Bool)

(assert (=> d!51841 e!113042))

(declare-fun res!81391 () Bool)

(assert (=> d!51841 (=> res!81391 e!113042)))

(declare-fun lt!85205 () Bool)

(assert (=> d!51841 (= res!81391 (not lt!85205))))

(declare-fun lt!85203 () Bool)

(assert (=> d!51841 (= lt!85205 lt!85203)))

(declare-fun lt!85202 () Unit!5227)

(declare-fun e!113041 () Unit!5227)

(assert (=> d!51841 (= lt!85202 e!113041)))

(declare-fun c!30594 () Bool)

(assert (=> d!51841 (= c!30594 lt!85203)))

(assert (=> d!51841 (= lt!85203 (containsKey!186 (toList!1091 lt!85120) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))

(assert (=> d!51841 (= (contains!1142 lt!85120 (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))) lt!85205)))

(declare-fun b!171260 () Bool)

(declare-fun lt!85204 () Unit!5227)

(assert (=> b!171260 (= e!113041 lt!85204)))

(assert (=> b!171260 (= lt!85204 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85120) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))

(assert (=> b!171260 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85120) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))

(declare-fun b!171261 () Bool)

(declare-fun Unit!5246 () Unit!5227)

(assert (=> b!171261 (= e!113041 Unit!5246)))

(declare-fun b!171262 () Bool)

(assert (=> b!171262 (= e!113042 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85120) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))))))

(assert (= (and d!51841 c!30594) b!171260))

(assert (= (and d!51841 (not c!30594)) b!171261))

(assert (= (and d!51841 (not res!81391)) b!171262))

(declare-fun m!199405 () Bool)

(assert (=> d!51841 m!199405))

(declare-fun m!199407 () Bool)

(assert (=> b!171260 m!199407))

(assert (=> b!171260 m!199141))

(assert (=> b!171260 m!199141))

(declare-fun m!199409 () Bool)

(assert (=> b!171260 m!199409))

(assert (=> b!171262 m!199141))

(assert (=> b!171262 m!199141))

(assert (=> b!171262 m!199409))

(assert (=> d!51755 d!51841))

(declare-fun b!171263 () Bool)

(declare-fun e!113043 () Option!188)

(assert (=> b!171263 (= e!113043 (Some!187 (_2!1627 (h!2816 lt!85118))))))

(declare-fun e!113044 () Option!188)

(declare-fun b!171265 () Bool)

(assert (=> b!171265 (= e!113044 (getValueByKey!182 (t!6996 lt!85118) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))

(declare-fun b!171266 () Bool)

(assert (=> b!171266 (= e!113044 None!186)))

(declare-fun c!30595 () Bool)

(declare-fun d!51843 () Bool)

(assert (=> d!51843 (= c!30595 (and ((_ is Cons!2199) lt!85118) (= (_1!1627 (h!2816 lt!85118)) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))))))

(assert (=> d!51843 (= (getValueByKey!182 lt!85118 (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))) e!113043)))

(declare-fun b!171264 () Bool)

(assert (=> b!171264 (= e!113043 e!113044)))

(declare-fun c!30596 () Bool)

(assert (=> b!171264 (= c!30596 (and ((_ is Cons!2199) lt!85118) (not (= (_1!1627 (h!2816 lt!85118)) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!51843 c!30595) b!171263))

(assert (= (and d!51843 (not c!30595)) b!171264))

(assert (= (and b!171264 c!30596) b!171265))

(assert (= (and b!171264 (not c!30596)) b!171266))

(declare-fun m!199411 () Bool)

(assert (=> b!171265 m!199411))

(assert (=> d!51755 d!51843))

(declare-fun d!51845 () Bool)

(assert (=> d!51845 (= (getValueByKey!182 lt!85118 (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85206 () Unit!5227)

(assert (=> d!51845 (= lt!85206 (choose!933 lt!85118 (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))

(declare-fun e!113045 () Bool)

(assert (=> d!51845 e!113045))

(declare-fun res!81392 () Bool)

(assert (=> d!51845 (=> (not res!81392) (not e!113045))))

(assert (=> d!51845 (= res!81392 (isStrictlySorted!326 lt!85118))))

(assert (=> d!51845 (= (lemmaContainsTupThenGetReturnValue!98 lt!85118 (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))) lt!85206)))

(declare-fun b!171267 () Bool)

(declare-fun res!81393 () Bool)

(assert (=> b!171267 (=> (not res!81393) (not e!113045))))

(assert (=> b!171267 (= res!81393 (containsKey!186 lt!85118 (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))

(declare-fun b!171268 () Bool)

(assert (=> b!171268 (= e!113045 (contains!1144 lt!85118 (tuple2!3233 (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))))))

(assert (= (and d!51845 res!81392) b!171267))

(assert (= (and b!171267 res!81393) b!171268))

(assert (=> d!51845 m!199135))

(declare-fun m!199413 () Bool)

(assert (=> d!51845 m!199413))

(declare-fun m!199415 () Bool)

(assert (=> d!51845 m!199415))

(declare-fun m!199417 () Bool)

(assert (=> b!171267 m!199417))

(declare-fun m!199419 () Bool)

(assert (=> b!171268 m!199419))

(assert (=> d!51755 d!51845))

(declare-fun b!171269 () Bool)

(declare-fun e!113046 () List!2203)

(assert (=> b!171269 (= e!113046 (insertStrictlySorted!101 (t!6996 (toList!1091 lt!84973)) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))

(declare-fun b!171270 () Bool)

(declare-fun e!113048 () List!2203)

(declare-fun call!17434 () List!2203)

(assert (=> b!171270 (= e!113048 call!17434)))

(declare-fun b!171271 () Bool)

(declare-fun e!113047 () List!2203)

(declare-fun call!17433 () List!2203)

(assert (=> b!171271 (= e!113047 call!17433)))

(declare-fun bm!17430 () Bool)

(declare-fun call!17435 () List!2203)

(assert (=> bm!17430 (= call!17435 call!17434)))

(declare-fun b!171272 () Bool)

(declare-fun e!113050 () List!2203)

(assert (=> b!171272 (= e!113048 e!113050)))

(declare-fun c!30597 () Bool)

(assert (=> b!171272 (= c!30597 (and ((_ is Cons!2199) (toList!1091 lt!84973)) (= (_1!1627 (h!2816 (toList!1091 lt!84973))) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))))))

(declare-fun d!51847 () Bool)

(declare-fun e!113049 () Bool)

(assert (=> d!51847 e!113049))

(declare-fun res!81394 () Bool)

(assert (=> d!51847 (=> (not res!81394) (not e!113049))))

(declare-fun lt!85207 () List!2203)

(assert (=> d!51847 (= res!81394 (isStrictlySorted!326 lt!85207))))

(assert (=> d!51847 (= lt!85207 e!113048)))

(declare-fun c!30599 () Bool)

(assert (=> d!51847 (= c!30599 (and ((_ is Cons!2199) (toList!1091 lt!84973)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84973))) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))))))

(assert (=> d!51847 (isStrictlySorted!326 (toList!1091 lt!84973))))

(assert (=> d!51847 (= (insertStrictlySorted!101 (toList!1091 lt!84973) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))) lt!85207)))

(declare-fun b!171273 () Bool)

(assert (=> b!171273 (= e!113050 call!17435)))

(declare-fun b!171274 () Bool)

(declare-fun c!30598 () Bool)

(assert (=> b!171274 (= e!113046 (ite c!30597 (t!6996 (toList!1091 lt!84973)) (ite c!30598 (Cons!2199 (h!2816 (toList!1091 lt!84973)) (t!6996 (toList!1091 lt!84973))) Nil!2200)))))

(declare-fun bm!17431 () Bool)

(assert (=> bm!17431 (= call!17433 call!17435)))

(declare-fun b!171275 () Bool)

(assert (=> b!171275 (= c!30598 (and ((_ is Cons!2199) (toList!1091 lt!84973)) (bvsgt (_1!1627 (h!2816 (toList!1091 lt!84973))) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))))))

(assert (=> b!171275 (= e!113050 e!113047)))

(declare-fun bm!17432 () Bool)

(assert (=> bm!17432 (= call!17434 ($colon$colon!96 e!113046 (ite c!30599 (h!2816 (toList!1091 lt!84973)) (tuple2!3233 (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))))

(declare-fun c!30600 () Bool)

(assert (=> bm!17432 (= c!30600 c!30599)))

(declare-fun b!171276 () Bool)

(declare-fun res!81395 () Bool)

(assert (=> b!171276 (=> (not res!81395) (not e!113049))))

(assert (=> b!171276 (= res!81395 (containsKey!186 lt!85207 (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))

(declare-fun b!171277 () Bool)

(assert (=> b!171277 (= e!113047 call!17433)))

(declare-fun b!171278 () Bool)

(assert (=> b!171278 (= e!113049 (contains!1144 lt!85207 (tuple2!3233 (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))))))

(assert (= (and d!51847 c!30599) b!171270))

(assert (= (and d!51847 (not c!30599)) b!171272))

(assert (= (and b!171272 c!30597) b!171273))

(assert (= (and b!171272 (not c!30597)) b!171275))

(assert (= (and b!171275 c!30598) b!171277))

(assert (= (and b!171275 (not c!30598)) b!171271))

(assert (= (or b!171277 b!171271) bm!17431))

(assert (= (or b!171273 bm!17431) bm!17430))

(assert (= (or b!171270 bm!17430) bm!17432))

(assert (= (and bm!17432 c!30600) b!171269))

(assert (= (and bm!17432 (not c!30600)) b!171274))

(assert (= (and d!51847 res!81394) b!171276))

(assert (= (and b!171276 res!81395) b!171278))

(declare-fun m!199421 () Bool)

(assert (=> b!171269 m!199421))

(declare-fun m!199423 () Bool)

(assert (=> b!171278 m!199423))

(declare-fun m!199425 () Bool)

(assert (=> bm!17432 m!199425))

(declare-fun m!199427 () Bool)

(assert (=> b!171276 m!199427))

(declare-fun m!199429 () Bool)

(assert (=> d!51847 m!199429))

(declare-fun m!199431 () Bool)

(assert (=> d!51847 m!199431))

(assert (=> d!51755 d!51847))

(declare-fun d!51849 () Bool)

(assert (=> d!51849 (= (isDefined!136 (getValueByKey!182 (toList!1091 lt!84962) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!438 (getValueByKey!182 (toList!1091 lt!84962) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7050 () Bool)

(assert (= bs!7050 d!51849))

(assert (=> bs!7050 m!199003))

(declare-fun m!199433 () Bool)

(assert (=> bs!7050 m!199433))

(assert (=> b!171061 d!51849))

(declare-fun b!171279 () Bool)

(declare-fun e!113051 () Option!188)

(assert (=> b!171279 (= e!113051 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!84962)))))))

(declare-fun b!171281 () Bool)

(declare-fun e!113052 () Option!188)

(assert (=> b!171281 (= e!113052 (getValueByKey!182 (t!6996 (toList!1091 lt!84962)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171282 () Bool)

(assert (=> b!171282 (= e!113052 None!186)))

(declare-fun d!51851 () Bool)

(declare-fun c!30601 () Bool)

(assert (=> d!51851 (= c!30601 (and ((_ is Cons!2199) (toList!1091 lt!84962)) (= (_1!1627 (h!2816 (toList!1091 lt!84962))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51851 (= (getValueByKey!182 (toList!1091 lt!84962) #b1000000000000000000000000000000000000000000000000000000000000000) e!113051)))

(declare-fun b!171280 () Bool)

(assert (=> b!171280 (= e!113051 e!113052)))

(declare-fun c!30602 () Bool)

(assert (=> b!171280 (= c!30602 (and ((_ is Cons!2199) (toList!1091 lt!84962)) (not (= (_1!1627 (h!2816 (toList!1091 lt!84962))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!51851 c!30601) b!171279))

(assert (= (and d!51851 (not c!30601)) b!171280))

(assert (= (and b!171280 c!30602) b!171281))

(assert (= (and b!171280 (not c!30602)) b!171282))

(declare-fun m!199435 () Bool)

(assert (=> b!171281 m!199435))

(assert (=> b!171061 d!51851))

(declare-fun b!171283 () Bool)

(declare-fun lt!85211 () Unit!5227)

(declare-fun lt!85208 () Unit!5227)

(assert (=> b!171283 (= lt!85211 lt!85208)))

(declare-fun lt!85214 () (_ BitVec 64))

(declare-fun lt!85213 () (_ BitVec 64))

(declare-fun lt!85210 () V!4985)

(declare-fun lt!85209 () ListLongMap!2151)

(assert (=> b!171283 (not (contains!1142 (+!238 lt!85209 (tuple2!3233 lt!85214 lt!85210)) lt!85213))))

(assert (=> b!171283 (= lt!85208 (addStillNotContains!72 lt!85209 lt!85214 lt!85210 lt!85213))))

(assert (=> b!171283 (= lt!85213 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!171283 (= lt!85210 (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171283 (= lt!85214 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun call!17436 () ListLongMap!2151)

(assert (=> b!171283 (= lt!85209 call!17436)))

(declare-fun e!113055 () ListLongMap!2151)

(assert (=> b!171283 (= e!113055 (+!238 call!17436 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!171284 () Bool)

(declare-fun e!113054 () Bool)

(declare-fun e!113058 () Bool)

(assert (=> b!171284 (= e!113054 e!113058)))

(declare-fun c!30605 () Bool)

(declare-fun e!113056 () Bool)

(assert (=> b!171284 (= c!30605 e!113056)))

(declare-fun res!81396 () Bool)

(assert (=> b!171284 (=> (not res!81396) (not e!113056))))

(assert (=> b!171284 (= res!81396 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun b!171285 () Bool)

(declare-fun e!113059 () Bool)

(assert (=> b!171285 (= e!113058 e!113059)))

(assert (=> b!171285 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun res!81397 () Bool)

(declare-fun lt!85212 () ListLongMap!2151)

(assert (=> b!171285 (= res!81397 (contains!1142 lt!85212 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171285 (=> (not res!81397) (not e!113059))))

(declare-fun b!171286 () Bool)

(assert (=> b!171286 (= e!113056 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171286 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!171287 () Bool)

(declare-fun e!113057 () Bool)

(assert (=> b!171287 (= e!113058 e!113057)))

(declare-fun c!30604 () Bool)

(assert (=> b!171287 (= c!30604 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun b!171288 () Bool)

(declare-fun e!113053 () ListLongMap!2151)

(assert (=> b!171288 (= e!113053 e!113055)))

(declare-fun c!30606 () Bool)

(assert (=> b!171288 (= c!30606 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!171289 () Bool)

(assert (=> b!171289 (= e!113057 (= lt!85212 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248))))))

(declare-fun b!171290 () Bool)

(assert (=> b!171290 (= e!113057 (isEmpty!437 lt!85212))))

(declare-fun b!171291 () Bool)

(assert (=> b!171291 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> b!171291 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3671 (_values!3537 thiss!1248))))))

(assert (=> b!171291 (= e!113059 (= (apply!129 lt!85212 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171292 () Bool)

(declare-fun res!81399 () Bool)

(assert (=> b!171292 (=> (not res!81399) (not e!113054))))

(assert (=> b!171292 (= res!81399 (not (contains!1142 lt!85212 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171293 () Bool)

(assert (=> b!171293 (= e!113055 call!17436)))

(declare-fun b!171294 () Bool)

(assert (=> b!171294 (= e!113053 (ListLongMap!2152 Nil!2200))))

(declare-fun d!51853 () Bool)

(assert (=> d!51853 e!113054))

(declare-fun res!81398 () Bool)

(assert (=> d!51853 (=> (not res!81398) (not e!113054))))

(assert (=> d!51853 (= res!81398 (not (contains!1142 lt!85212 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51853 (= lt!85212 e!113053)))

(declare-fun c!30603 () Bool)

(assert (=> d!51853 (= c!30603 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> d!51853 (validMask!0 (mask!8381 thiss!1248))))

(assert (=> d!51853 (= (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248)) lt!85212)))

(declare-fun bm!17433 () Bool)

(assert (=> bm!17433 (= call!17436 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248)))))

(assert (= (and d!51853 c!30603) b!171294))

(assert (= (and d!51853 (not c!30603)) b!171288))

(assert (= (and b!171288 c!30606) b!171283))

(assert (= (and b!171288 (not c!30606)) b!171293))

(assert (= (or b!171283 b!171293) bm!17433))

(assert (= (and d!51853 res!81398) b!171292))

(assert (= (and b!171292 res!81399) b!171284))

(assert (= (and b!171284 res!81396) b!171286))

(assert (= (and b!171284 c!30605) b!171285))

(assert (= (and b!171284 (not c!30605)) b!171287))

(assert (= (and b!171285 res!81397) b!171291))

(assert (= (and b!171287 c!30604) b!171289))

(assert (= (and b!171287 (not c!30604)) b!171290))

(declare-fun b_lambda!6899 () Bool)

(assert (=> (not b_lambda!6899) (not b!171283)))

(assert (=> b!171283 t!6999))

(declare-fun b_and!10643 () Bool)

(assert (= b_and!10641 (and (=> t!6999 result!4553) b_and!10643)))

(declare-fun b_lambda!6901 () Bool)

(assert (=> (not b_lambda!6901) (not b!171291)))

(assert (=> b!171291 t!6999))

(declare-fun b_and!10645 () Bool)

(assert (= b_and!10643 (and (=> t!6999 result!4553) b_and!10645)))

(declare-fun m!199437 () Bool)

(assert (=> b!171289 m!199437))

(declare-fun m!199439 () Bool)

(assert (=> b!171292 m!199439))

(declare-fun m!199441 () Bool)

(assert (=> b!171286 m!199441))

(assert (=> b!171286 m!199441))

(declare-fun m!199443 () Bool)

(assert (=> b!171286 m!199443))

(declare-fun m!199445 () Bool)

(assert (=> d!51853 m!199445))

(assert (=> d!51853 m!198667))

(assert (=> b!171283 m!198655))

(declare-fun m!199447 () Bool)

(assert (=> b!171283 m!199447))

(assert (=> b!171283 m!199447))

(assert (=> b!171283 m!198655))

(declare-fun m!199449 () Bool)

(assert (=> b!171283 m!199449))

(assert (=> b!171283 m!199441))

(declare-fun m!199451 () Bool)

(assert (=> b!171283 m!199451))

(declare-fun m!199453 () Bool)

(assert (=> b!171283 m!199453))

(declare-fun m!199455 () Bool)

(assert (=> b!171283 m!199455))

(declare-fun m!199457 () Bool)

(assert (=> b!171283 m!199457))

(assert (=> b!171283 m!199453))

(assert (=> b!171291 m!198655))

(assert (=> b!171291 m!199447))

(assert (=> b!171291 m!199447))

(assert (=> b!171291 m!198655))

(assert (=> b!171291 m!199449))

(assert (=> b!171291 m!199441))

(declare-fun m!199459 () Bool)

(assert (=> b!171291 m!199459))

(assert (=> b!171291 m!199441))

(assert (=> bm!17433 m!199437))

(assert (=> b!171285 m!199441))

(assert (=> b!171285 m!199441))

(declare-fun m!199461 () Bool)

(assert (=> b!171285 m!199461))

(assert (=> b!171288 m!199441))

(assert (=> b!171288 m!199441))

(assert (=> b!171288 m!199443))

(declare-fun m!199463 () Bool)

(assert (=> b!171290 m!199463))

(assert (=> bm!17399 d!51853))

(declare-fun b!171295 () Bool)

(declare-fun e!113060 () Option!188)

(assert (=> b!171295 (= e!113060 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!85111)))))))

(declare-fun b!171297 () Bool)

(declare-fun e!113061 () Option!188)

(assert (=> b!171297 (= e!113061 (getValueByKey!182 (t!6996 (toList!1091 lt!85111)) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))

(declare-fun b!171298 () Bool)

(assert (=> b!171298 (= e!113061 None!186)))

(declare-fun c!30607 () Bool)

(declare-fun d!51855 () Bool)

(assert (=> d!51855 (= c!30607 (and ((_ is Cons!2199) (toList!1091 lt!85111)) (= (_1!1627 (h!2816 (toList!1091 lt!85111))) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))))))

(assert (=> d!51855 (= (getValueByKey!182 (toList!1091 lt!85111) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) e!113060)))

(declare-fun b!171296 () Bool)

(assert (=> b!171296 (= e!113060 e!113061)))

(declare-fun c!30608 () Bool)

(assert (=> b!171296 (= c!30608 (and ((_ is Cons!2199) (toList!1091 lt!85111)) (not (= (_1!1627 (h!2816 (toList!1091 lt!85111))) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))))

(assert (= (and d!51855 c!30607) b!171295))

(assert (= (and d!51855 (not c!30607)) b!171296))

(assert (= (and b!171296 c!30608) b!171297))

(assert (= (and b!171296 (not c!30608)) b!171298))

(declare-fun m!199465 () Bool)

(assert (=> b!171297 m!199465))

(assert (=> b!171116 d!51855))

(declare-fun b!171299 () Bool)

(declare-fun e!113063 () Bool)

(declare-fun call!17437 () Bool)

(assert (=> b!171299 (= e!113063 call!17437)))

(declare-fun b!171300 () Bool)

(declare-fun e!113064 () Bool)

(assert (=> b!171300 (= e!113064 call!17437)))

(declare-fun b!171301 () Bool)

(declare-fun e!113062 () Bool)

(assert (=> b!171301 (= e!113062 e!113063)))

(declare-fun c!30609 () Bool)

(assert (=> b!171301 (= c!30609 (validKeyInArray!0 (select (arr!3376 (_keys!5385 lt!84854)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!51857 () Bool)

(declare-fun res!81400 () Bool)

(assert (=> d!51857 (=> res!81400 e!113062)))

(assert (=> d!51857 (= res!81400 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 lt!84854))))))

(assert (=> d!51857 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5385 lt!84854) (mask!8381 lt!84854)) e!113062)))

(declare-fun b!171302 () Bool)

(assert (=> b!171302 (= e!113063 e!113064)))

(declare-fun lt!85217 () (_ BitVec 64))

(assert (=> b!171302 (= lt!85217 (select (arr!3376 (_keys!5385 lt!84854)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!85216 () Unit!5227)

(assert (=> b!171302 (= lt!85216 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5385 lt!84854) lt!85217 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!171302 (arrayContainsKey!0 (_keys!5385 lt!84854) lt!85217 #b00000000000000000000000000000000)))

(declare-fun lt!85215 () Unit!5227)

(assert (=> b!171302 (= lt!85215 lt!85216)))

(declare-fun res!81401 () Bool)

(assert (=> b!171302 (= res!81401 (= (seekEntryOrOpen!0 (select (arr!3376 (_keys!5385 lt!84854)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5385 lt!84854) (mask!8381 lt!84854)) (Found!545 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171302 (=> (not res!81401) (not e!113064))))

(declare-fun bm!17434 () Bool)

(assert (=> bm!17434 (= call!17437 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5385 lt!84854) (mask!8381 lt!84854)))))

(assert (= (and d!51857 (not res!81400)) b!171301))

(assert (= (and b!171301 c!30609) b!171302))

(assert (= (and b!171301 (not c!30609)) b!171299))

(assert (= (and b!171302 res!81401) b!171300))

(assert (= (or b!171300 b!171299) bm!17434))

(declare-fun m!199467 () Bool)

(assert (=> b!171301 m!199467))

(assert (=> b!171301 m!199467))

(declare-fun m!199469 () Bool)

(assert (=> b!171301 m!199469))

(assert (=> b!171302 m!199467))

(declare-fun m!199471 () Bool)

(assert (=> b!171302 m!199471))

(declare-fun m!199473 () Bool)

(assert (=> b!171302 m!199473))

(assert (=> b!171302 m!199467))

(declare-fun m!199475 () Bool)

(assert (=> b!171302 m!199475))

(declare-fun m!199477 () Bool)

(assert (=> bm!17434 m!199477))

(assert (=> bm!17409 d!51857))

(declare-fun d!51859 () Bool)

(declare-fun res!81402 () Bool)

(declare-fun e!113065 () Bool)

(assert (=> d!51859 (=> res!81402 e!113065)))

(assert (=> d!51859 (= res!81402 (and ((_ is Cons!2199) (t!6996 (toList!1091 lt!84853))) (= (_1!1627 (h!2816 (t!6996 (toList!1091 lt!84853)))) key!828)))))

(assert (=> d!51859 (= (containsKey!186 (t!6996 (toList!1091 lt!84853)) key!828) e!113065)))

(declare-fun b!171303 () Bool)

(declare-fun e!113066 () Bool)

(assert (=> b!171303 (= e!113065 e!113066)))

(declare-fun res!81403 () Bool)

(assert (=> b!171303 (=> (not res!81403) (not e!113066))))

(assert (=> b!171303 (= res!81403 (and (or (not ((_ is Cons!2199) (t!6996 (toList!1091 lt!84853)))) (bvsle (_1!1627 (h!2816 (t!6996 (toList!1091 lt!84853)))) key!828)) ((_ is Cons!2199) (t!6996 (toList!1091 lt!84853))) (bvslt (_1!1627 (h!2816 (t!6996 (toList!1091 lt!84853)))) key!828)))))

(declare-fun b!171304 () Bool)

(assert (=> b!171304 (= e!113066 (containsKey!186 (t!6996 (t!6996 (toList!1091 lt!84853))) key!828))))

(assert (= (and d!51859 (not res!81402)) b!171303))

(assert (= (and b!171303 res!81403) b!171304))

(declare-fun m!199479 () Bool)

(assert (=> b!171304 m!199479))

(assert (=> b!171187 d!51859))

(declare-fun d!51861 () Bool)

(assert (=> d!51861 (= (get!1933 (getValueByKey!182 (toList!1091 lt!84987) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3908 (getValueByKey!182 (toList!1091 lt!84987) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51795 d!51861))

(declare-fun b!171305 () Bool)

(declare-fun e!113067 () Option!188)

(assert (=> b!171305 (= e!113067 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!84987)))))))

(declare-fun b!171307 () Bool)

(declare-fun e!113068 () Option!188)

(assert (=> b!171307 (= e!113068 (getValueByKey!182 (t!6996 (toList!1091 lt!84987)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171308 () Bool)

(assert (=> b!171308 (= e!113068 None!186)))

(declare-fun d!51863 () Bool)

(declare-fun c!30610 () Bool)

(assert (=> d!51863 (= c!30610 (and ((_ is Cons!2199) (toList!1091 lt!84987)) (= (_1!1627 (h!2816 (toList!1091 lt!84987))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51863 (= (getValueByKey!182 (toList!1091 lt!84987) #b0000000000000000000000000000000000000000000000000000000000000000) e!113067)))

(declare-fun b!171306 () Bool)

(assert (=> b!171306 (= e!113067 e!113068)))

(declare-fun c!30611 () Bool)

(assert (=> b!171306 (= c!30611 (and ((_ is Cons!2199) (toList!1091 lt!84987)) (not (= (_1!1627 (h!2816 (toList!1091 lt!84987))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!51863 c!30610) b!171305))

(assert (= (and d!51863 (not c!30610)) b!171306))

(assert (= (and b!171306 c!30611) b!171307))

(assert (= (and b!171306 (not c!30611)) b!171308))

(declare-fun m!199481 () Bool)

(assert (=> b!171307 m!199481))

(assert (=> d!51795 d!51863))

(declare-fun b!171309 () Bool)

(declare-fun e!113069 () Option!188)

(assert (=> b!171309 (= e!113069 (Some!187 (_2!1627 (h!2816 (t!6996 lt!84990)))))))

(declare-fun b!171311 () Bool)

(declare-fun e!113070 () Option!188)

(assert (=> b!171311 (= e!113070 (getValueByKey!182 (t!6996 (t!6996 lt!84990)) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!171312 () Bool)

(assert (=> b!171312 (= e!113070 None!186)))

(declare-fun d!51865 () Bool)

(declare-fun c!30612 () Bool)

(assert (=> d!51865 (= c!30612 (and ((_ is Cons!2199) (t!6996 lt!84990)) (= (_1!1627 (h!2816 (t!6996 lt!84990))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!51865 (= (getValueByKey!182 (t!6996 lt!84990) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113069)))

(declare-fun b!171310 () Bool)

(assert (=> b!171310 (= e!113069 e!113070)))

(declare-fun c!30613 () Bool)

(assert (=> b!171310 (= c!30613 (and ((_ is Cons!2199) (t!6996 lt!84990)) (not (= (_1!1627 (h!2816 (t!6996 lt!84990))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (= (and d!51865 c!30612) b!171309))

(assert (= (and d!51865 (not c!30612)) b!171310))

(assert (= (and b!171310 c!30613) b!171311))

(assert (= (and b!171310 (not c!30613)) b!171312))

(declare-fun m!199483 () Bool)

(assert (=> b!171311 m!199483))

(assert (=> b!171073 d!51865))

(declare-fun d!51867 () Bool)

(declare-fun res!81404 () Bool)

(declare-fun e!113071 () Bool)

(assert (=> d!51867 (=> res!81404 e!113071)))

(assert (=> d!51867 (= res!81404 (or ((_ is Nil!2200) lt!85099) ((_ is Nil!2200) (t!6996 lt!85099))))))

(assert (=> d!51867 (= (isStrictlySorted!326 lt!85099) e!113071)))

(declare-fun b!171313 () Bool)

(declare-fun e!113072 () Bool)

(assert (=> b!171313 (= e!113071 e!113072)))

(declare-fun res!81405 () Bool)

(assert (=> b!171313 (=> (not res!81405) (not e!113072))))

(assert (=> b!171313 (= res!81405 (bvslt (_1!1627 (h!2816 lt!85099)) (_1!1627 (h!2816 (t!6996 lt!85099)))))))

(declare-fun b!171314 () Bool)

(assert (=> b!171314 (= e!113072 (isStrictlySorted!326 (t!6996 lt!85099)))))

(assert (= (and d!51867 (not res!81404)) b!171313))

(assert (= (and b!171313 res!81405) b!171314))

(declare-fun m!199485 () Bool)

(assert (=> b!171314 m!199485))

(assert (=> d!51729 d!51867))

(declare-fun d!51869 () Bool)

(declare-fun res!81406 () Bool)

(declare-fun e!113073 () Bool)

(assert (=> d!51869 (=> res!81406 e!113073)))

(assert (=> d!51869 (= res!81406 (or ((_ is Nil!2200) (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) ((_ is Nil!2200) (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))))))

(assert (=> d!51869 (= (isStrictlySorted!326 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) e!113073)))

(declare-fun b!171315 () Bool)

(declare-fun e!113074 () Bool)

(assert (=> b!171315 (= e!113073 e!113074)))

(declare-fun res!81407 () Bool)

(assert (=> b!171315 (=> (not res!81407) (not e!113074))))

(assert (=> b!171315 (= res!81407 (bvslt (_1!1627 (h!2816 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (_1!1627 (h!2816 (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))))))))

(declare-fun b!171316 () Bool)

(assert (=> b!171316 (= e!113074 (isStrictlySorted!326 (t!6996 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))))))

(assert (= (and d!51869 (not res!81406)) b!171315))

(assert (= (and b!171315 res!81407) b!171316))

(assert (=> b!171316 m!199403))

(assert (=> d!51729 d!51869))

(assert (=> d!51713 d!51711))

(declare-fun d!51871 () Bool)

(assert (=> d!51871 (= (getValueByKey!182 lt!84895 (_1!1627 (tuple2!3233 key!828 v!309))) (Some!187 (_2!1627 (tuple2!3233 key!828 v!309))))))

(assert (=> d!51871 true))

(declare-fun _$22!531 () Unit!5227)

(assert (=> d!51871 (= (choose!933 lt!84895 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309))) _$22!531)))

(declare-fun bs!7051 () Bool)

(assert (= bs!7051 d!51871))

(assert (=> bs!7051 m!198633))

(assert (=> d!51713 d!51871))

(declare-fun d!51873 () Bool)

(declare-fun res!81408 () Bool)

(declare-fun e!113075 () Bool)

(assert (=> d!51873 (=> res!81408 e!113075)))

(assert (=> d!51873 (= res!81408 (or ((_ is Nil!2200) lt!84895) ((_ is Nil!2200) (t!6996 lt!84895))))))

(assert (=> d!51873 (= (isStrictlySorted!326 lt!84895) e!113075)))

(declare-fun b!171317 () Bool)

(declare-fun e!113076 () Bool)

(assert (=> b!171317 (= e!113075 e!113076)))

(declare-fun res!81409 () Bool)

(assert (=> b!171317 (=> (not res!81409) (not e!113076))))

(assert (=> b!171317 (= res!81409 (bvslt (_1!1627 (h!2816 lt!84895)) (_1!1627 (h!2816 (t!6996 lt!84895)))))))

(declare-fun b!171318 () Bool)

(assert (=> b!171318 (= e!113076 (isStrictlySorted!326 (t!6996 lt!84895)))))

(assert (= (and d!51873 (not res!81408)) b!171317))

(assert (= (and b!171317 res!81409) b!171318))

(declare-fun m!199487 () Bool)

(assert (=> b!171318 m!199487))

(assert (=> d!51713 d!51873))

(declare-fun d!51875 () Bool)

(assert (=> d!51875 (= (apply!129 lt!85162 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)) (get!1933 (getValueByKey!182 (toList!1091 lt!85162) (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000))))))

(declare-fun bs!7052 () Bool)

(assert (= bs!7052 d!51875))

(assert (=> bs!7052 m!199007))

(declare-fun m!199489 () Bool)

(assert (=> bs!7052 m!199489))

(assert (=> bs!7052 m!199489))

(declare-fun m!199491 () Bool)

(assert (=> bs!7052 m!199491))

(assert (=> b!171153 d!51875))

(declare-fun d!51877 () Bool)

(declare-fun c!30614 () Bool)

(assert (=> d!51877 (= c!30614 ((_ is ValueCellFull!1658) (select (arr!3377 (_values!3537 lt!84854)) #b00000000000000000000000000000000)))))

(declare-fun e!113077 () V!4985)

(assert (=> d!51877 (= (get!1932 (select (arr!3377 (_values!3537 lt!84854)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 lt!84854) #b0000000000000000000000000000000000000000000000000000000000000000)) e!113077)))

(declare-fun b!171319 () Bool)

(assert (=> b!171319 (= e!113077 (get!1934 (select (arr!3377 (_values!3537 lt!84854)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 lt!84854) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171320 () Bool)

(assert (=> b!171320 (= e!113077 (get!1935 (select (arr!3377 (_values!3537 lt!84854)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 lt!84854) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51877 c!30614) b!171319))

(assert (= (and d!51877 (not c!30614)) b!171320))

(assert (=> b!171319 m!199213))

(assert (=> b!171319 m!199215))

(declare-fun m!199493 () Bool)

(assert (=> b!171319 m!199493))

(assert (=> b!171320 m!199213))

(assert (=> b!171320 m!199215))

(declare-fun m!199495 () Bool)

(assert (=> b!171320 m!199495))

(assert (=> b!171153 d!51877))

(declare-fun d!51879 () Bool)

(assert (=> d!51879 (arrayContainsKey!0 (_keys!5385 thiss!1248) lt!85005 #b00000000000000000000000000000000)))

(declare-fun lt!85220 () Unit!5227)

(declare-fun choose!13 (array!7099 (_ BitVec 64) (_ BitVec 32)) Unit!5227)

(assert (=> d!51879 (= lt!85220 (choose!13 (_keys!5385 thiss!1248) lt!85005 #b00000000000000000000000000000000))))

(assert (=> d!51879 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!51879 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5385 thiss!1248) lt!85005 #b00000000000000000000000000000000) lt!85220)))

(declare-fun bs!7053 () Bool)

(assert (= bs!7053 d!51879))

(assert (=> bs!7053 m!198801))

(declare-fun m!199497 () Bool)

(assert (=> bs!7053 m!199497))

(assert (=> b!170912 d!51879))

(declare-fun d!51881 () Bool)

(declare-fun res!81414 () Bool)

(declare-fun e!113082 () Bool)

(assert (=> d!51881 (=> res!81414 e!113082)))

(assert (=> d!51881 (= res!81414 (= (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) lt!85005))))

(assert (=> d!51881 (= (arrayContainsKey!0 (_keys!5385 thiss!1248) lt!85005 #b00000000000000000000000000000000) e!113082)))

(declare-fun b!171325 () Bool)

(declare-fun e!113083 () Bool)

(assert (=> b!171325 (= e!113082 e!113083)))

(declare-fun res!81415 () Bool)

(assert (=> b!171325 (=> (not res!81415) (not e!113083))))

(assert (=> b!171325 (= res!81415 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun b!171326 () Bool)

(assert (=> b!171326 (= e!113083 (arrayContainsKey!0 (_keys!5385 thiss!1248) lt!85005 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!51881 (not res!81414)) b!171325))

(assert (= (and b!171325 res!81415) b!171326))

(assert (=> d!51881 m!198643))

(declare-fun m!199499 () Bool)

(assert (=> b!171326 m!199499))

(assert (=> b!170912 d!51881))

(declare-fun b!171339 () Bool)

(declare-fun e!113091 () SeekEntryResult!545)

(assert (=> b!171339 (= e!113091 Undefined!545)))

(declare-fun b!171340 () Bool)

(declare-fun c!30621 () Bool)

(declare-fun lt!85227 () (_ BitVec 64))

(assert (=> b!171340 (= c!30621 (= lt!85227 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!113090 () SeekEntryResult!545)

(declare-fun e!113092 () SeekEntryResult!545)

(assert (=> b!171340 (= e!113090 e!113092)))

(declare-fun d!51883 () Bool)

(declare-fun lt!85228 () SeekEntryResult!545)

(assert (=> d!51883 (and (or ((_ is Undefined!545) lt!85228) (not ((_ is Found!545) lt!85228)) (and (bvsge (index!4349 lt!85228) #b00000000000000000000000000000000) (bvslt (index!4349 lt!85228) (size!3670 (_keys!5385 thiss!1248))))) (or ((_ is Undefined!545) lt!85228) ((_ is Found!545) lt!85228) (not ((_ is MissingZero!545) lt!85228)) (and (bvsge (index!4348 lt!85228) #b00000000000000000000000000000000) (bvslt (index!4348 lt!85228) (size!3670 (_keys!5385 thiss!1248))))) (or ((_ is Undefined!545) lt!85228) ((_ is Found!545) lt!85228) ((_ is MissingZero!545) lt!85228) (not ((_ is MissingVacant!545) lt!85228)) (and (bvsge (index!4351 lt!85228) #b00000000000000000000000000000000) (bvslt (index!4351 lt!85228) (size!3670 (_keys!5385 thiss!1248))))) (or ((_ is Undefined!545) lt!85228) (ite ((_ is Found!545) lt!85228) (= (select (arr!3376 (_keys!5385 thiss!1248)) (index!4349 lt!85228)) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!545) lt!85228) (= (select (arr!3376 (_keys!5385 thiss!1248)) (index!4348 lt!85228)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!545) lt!85228) (= (select (arr!3376 (_keys!5385 thiss!1248)) (index!4351 lt!85228)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51883 (= lt!85228 e!113091)))

(declare-fun c!30622 () Bool)

(declare-fun lt!85229 () SeekEntryResult!545)

(assert (=> d!51883 (= c!30622 (and ((_ is Intermediate!545) lt!85229) (undefined!1357 lt!85229)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7099 (_ BitVec 32)) SeekEntryResult!545)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51883 (= lt!85229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (mask!8381 thiss!1248)) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (_keys!5385 thiss!1248) (mask!8381 thiss!1248)))))

(assert (=> d!51883 (validMask!0 (mask!8381 thiss!1248))))

(assert (=> d!51883 (= (seekEntryOrOpen!0 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (_keys!5385 thiss!1248) (mask!8381 thiss!1248)) lt!85228)))

(declare-fun b!171341 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7099 (_ BitVec 32)) SeekEntryResult!545)

(assert (=> b!171341 (= e!113092 (seekKeyOrZeroReturnVacant!0 (x!18969 lt!85229) (index!4350 lt!85229) (index!4350 lt!85229) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (_keys!5385 thiss!1248) (mask!8381 thiss!1248)))))

(declare-fun b!171342 () Bool)

(assert (=> b!171342 (= e!113092 (MissingZero!545 (index!4350 lt!85229)))))

(declare-fun b!171343 () Bool)

(assert (=> b!171343 (= e!113090 (Found!545 (index!4350 lt!85229)))))

(declare-fun b!171344 () Bool)

(assert (=> b!171344 (= e!113091 e!113090)))

(assert (=> b!171344 (= lt!85227 (select (arr!3376 (_keys!5385 thiss!1248)) (index!4350 lt!85229)))))

(declare-fun c!30623 () Bool)

(assert (=> b!171344 (= c!30623 (= lt!85227 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51883 c!30622) b!171339))

(assert (= (and d!51883 (not c!30622)) b!171344))

(assert (= (and b!171344 c!30623) b!171343))

(assert (= (and b!171344 (not c!30623)) b!171340))

(assert (= (and b!171340 c!30621) b!171342))

(assert (= (and b!171340 (not c!30621)) b!171341))

(declare-fun m!199501 () Bool)

(assert (=> d!51883 m!199501))

(declare-fun m!199503 () Bool)

(assert (=> d!51883 m!199503))

(declare-fun m!199505 () Bool)

(assert (=> d!51883 m!199505))

(declare-fun m!199507 () Bool)

(assert (=> d!51883 m!199507))

(assert (=> d!51883 m!198643))

(declare-fun m!199509 () Bool)

(assert (=> d!51883 m!199509))

(assert (=> d!51883 m!198667))

(assert (=> d!51883 m!198643))

(assert (=> d!51883 m!199507))

(assert (=> b!171341 m!198643))

(declare-fun m!199511 () Bool)

(assert (=> b!171341 m!199511))

(declare-fun m!199513 () Bool)

(assert (=> b!171344 m!199513))

(assert (=> b!170912 d!51883))

(assert (=> d!51731 d!51635))

(assert (=> d!51731 d!51633))

(assert (=> d!51731 d!51627))

(declare-fun d!51885 () Bool)

(assert (=> d!51885 (= (get!1933 (getValueByKey!182 (toList!1091 lt!84972) lt!84986)) (v!3908 (getValueByKey!182 (toList!1091 lt!84972) lt!84986)))))

(assert (=> d!51763 d!51885))

(declare-fun b!171345 () Bool)

(declare-fun e!113093 () Option!188)

(assert (=> b!171345 (= e!113093 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!84972)))))))

(declare-fun b!171347 () Bool)

(declare-fun e!113094 () Option!188)

(assert (=> b!171347 (= e!113094 (getValueByKey!182 (t!6996 (toList!1091 lt!84972)) lt!84986))))

(declare-fun b!171348 () Bool)

(assert (=> b!171348 (= e!113094 None!186)))

(declare-fun d!51887 () Bool)

(declare-fun c!30624 () Bool)

(assert (=> d!51887 (= c!30624 (and ((_ is Cons!2199) (toList!1091 lt!84972)) (= (_1!1627 (h!2816 (toList!1091 lt!84972))) lt!84986)))))

(assert (=> d!51887 (= (getValueByKey!182 (toList!1091 lt!84972) lt!84986) e!113093)))

(declare-fun b!171346 () Bool)

(assert (=> b!171346 (= e!113093 e!113094)))

(declare-fun c!30625 () Bool)

(assert (=> b!171346 (= c!30625 (and ((_ is Cons!2199) (toList!1091 lt!84972)) (not (= (_1!1627 (h!2816 (toList!1091 lt!84972))) lt!84986))))))

(assert (= (and d!51887 c!30624) b!171345))

(assert (= (and d!51887 (not c!30624)) b!171346))

(assert (= (and b!171346 c!30625) b!171347))

(assert (= (and b!171346 (not c!30625)) b!171348))

(declare-fun m!199515 () Bool)

(assert (=> b!171347 m!199515))

(assert (=> d!51763 d!51887))

(declare-fun d!51889 () Bool)

(declare-fun lt!85230 () Bool)

(assert (=> d!51889 (= lt!85230 (select (content!147 (toList!1091 lt!85120)) (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))))

(declare-fun e!113096 () Bool)

(assert (=> d!51889 (= lt!85230 e!113096)))

(declare-fun res!81416 () Bool)

(assert (=> d!51889 (=> (not res!81416) (not e!113096))))

(assert (=> d!51889 (= res!81416 ((_ is Cons!2199) (toList!1091 lt!85120)))))

(assert (=> d!51889 (= (contains!1144 (toList!1091 lt!85120) (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))) lt!85230)))

(declare-fun b!171349 () Bool)

(declare-fun e!113095 () Bool)

(assert (=> b!171349 (= e!113096 e!113095)))

(declare-fun res!81417 () Bool)

(assert (=> b!171349 (=> res!81417 e!113095)))

(assert (=> b!171349 (= res!81417 (= (h!2816 (toList!1091 lt!85120)) (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))))

(declare-fun b!171350 () Bool)

(assert (=> b!171350 (= e!113095 (contains!1144 (t!6996 (toList!1091 lt!85120)) (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))))

(assert (= (and d!51889 res!81416) b!171349))

(assert (= (and b!171349 (not res!81417)) b!171350))

(declare-fun m!199517 () Bool)

(assert (=> d!51889 m!199517))

(declare-fun m!199519 () Bool)

(assert (=> d!51889 m!199519))

(declare-fun m!199521 () Bool)

(assert (=> b!171350 m!199521))

(assert (=> b!171122 d!51889))

(declare-fun d!51891 () Bool)

(assert (=> d!51891 (= ($colon$colon!96 e!112928 (ite c!30554 (h!2816 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (tuple2!3233 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))) (Cons!2199 (ite c!30554 (h!2816 (toList!1091 (getCurrentListMap!729 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (tuple2!3233 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) e!112928))))

(assert (=> bm!17412 d!51891))

(declare-fun d!51893 () Bool)

(assert (=> d!51893 (= (get!1933 (getValueByKey!182 (toList!1091 lt!84973) lt!84968)) (v!3908 (getValueByKey!182 (toList!1091 lt!84973) lt!84968)))))

(assert (=> d!51759 d!51893))

(declare-fun b!171351 () Bool)

(declare-fun e!113097 () Option!188)

(assert (=> b!171351 (= e!113097 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!84973)))))))

(declare-fun b!171353 () Bool)

(declare-fun e!113098 () Option!188)

(assert (=> b!171353 (= e!113098 (getValueByKey!182 (t!6996 (toList!1091 lt!84973)) lt!84968))))

(declare-fun b!171354 () Bool)

(assert (=> b!171354 (= e!113098 None!186)))

(declare-fun d!51895 () Bool)

(declare-fun c!30626 () Bool)

(assert (=> d!51895 (= c!30626 (and ((_ is Cons!2199) (toList!1091 lt!84973)) (= (_1!1627 (h!2816 (toList!1091 lt!84973))) lt!84968)))))

(assert (=> d!51895 (= (getValueByKey!182 (toList!1091 lt!84973) lt!84968) e!113097)))

(declare-fun b!171352 () Bool)

(assert (=> b!171352 (= e!113097 e!113098)))

(declare-fun c!30627 () Bool)

(assert (=> b!171352 (= c!30627 (and ((_ is Cons!2199) (toList!1091 lt!84973)) (not (= (_1!1627 (h!2816 (toList!1091 lt!84973))) lt!84968))))))

(assert (= (and d!51895 c!30626) b!171351))

(assert (= (and d!51895 (not c!30626)) b!171352))

(assert (= (and b!171352 c!30627) b!171353))

(assert (= (and b!171352 (not c!30627)) b!171354))

(declare-fun m!199523 () Bool)

(assert (=> b!171353 m!199523))

(assert (=> d!51759 d!51895))

(declare-fun d!51897 () Bool)

(assert (=> d!51897 (= (isDefined!136 (getValueByKey!182 (toList!1091 lt!84987) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!438 (getValueByKey!182 (toList!1091 lt!84987) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7054 () Bool)

(assert (= bs!7054 d!51897))

(assert (=> bs!7054 m!198791))

(declare-fun m!199525 () Bool)

(assert (=> bs!7054 m!199525))

(assert (=> b!170915 d!51897))

(declare-fun b!171355 () Bool)

(declare-fun e!113099 () Option!188)

(assert (=> b!171355 (= e!113099 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!84987)))))))

(declare-fun b!171357 () Bool)

(declare-fun e!113100 () Option!188)

(assert (=> b!171357 (= e!113100 (getValueByKey!182 (t!6996 (toList!1091 lt!84987)) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171358 () Bool)

(assert (=> b!171358 (= e!113100 None!186)))

(declare-fun d!51899 () Bool)

(declare-fun c!30628 () Bool)

(assert (=> d!51899 (= c!30628 (and ((_ is Cons!2199) (toList!1091 lt!84987)) (= (_1!1627 (h!2816 (toList!1091 lt!84987))) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!51899 (= (getValueByKey!182 (toList!1091 lt!84987) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) e!113099)))

(declare-fun b!171356 () Bool)

(assert (=> b!171356 (= e!113099 e!113100)))

(declare-fun c!30629 () Bool)

(assert (=> b!171356 (= c!30629 (and ((_ is Cons!2199) (toList!1091 lt!84987)) (not (= (_1!1627 (h!2816 (toList!1091 lt!84987))) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))))

(assert (= (and d!51899 c!30628) b!171355))

(assert (= (and d!51899 (not c!30628)) b!171356))

(assert (= (and b!171356 c!30629) b!171357))

(assert (= (and b!171356 (not c!30629)) b!171358))

(assert (=> b!171357 m!198643))

(declare-fun m!199527 () Bool)

(assert (=> b!171357 m!199527))

(assert (=> b!170915 d!51899))

(declare-fun d!51901 () Bool)

(declare-fun e!113101 () Bool)

(assert (=> d!51901 e!113101))

(declare-fun res!81419 () Bool)

(assert (=> d!51901 (=> (not res!81419) (not e!113101))))

(declare-fun lt!85234 () ListLongMap!2151)

(assert (=> d!51901 (= res!81419 (contains!1142 lt!85234 (_1!1627 (tuple2!3233 lt!85106 lt!85102))))))

(declare-fun lt!85232 () List!2203)

(assert (=> d!51901 (= lt!85234 (ListLongMap!2152 lt!85232))))

(declare-fun lt!85233 () Unit!5227)

(declare-fun lt!85231 () Unit!5227)

(assert (=> d!51901 (= lt!85233 lt!85231)))

(assert (=> d!51901 (= (getValueByKey!182 lt!85232 (_1!1627 (tuple2!3233 lt!85106 lt!85102))) (Some!187 (_2!1627 (tuple2!3233 lt!85106 lt!85102))))))

(assert (=> d!51901 (= lt!85231 (lemmaContainsTupThenGetReturnValue!98 lt!85232 (_1!1627 (tuple2!3233 lt!85106 lt!85102)) (_2!1627 (tuple2!3233 lt!85106 lt!85102))))))

(assert (=> d!51901 (= lt!85232 (insertStrictlySorted!101 (toList!1091 lt!85101) (_1!1627 (tuple2!3233 lt!85106 lt!85102)) (_2!1627 (tuple2!3233 lt!85106 lt!85102))))))

(assert (=> d!51901 (= (+!238 lt!85101 (tuple2!3233 lt!85106 lt!85102)) lt!85234)))

(declare-fun b!171359 () Bool)

(declare-fun res!81418 () Bool)

(assert (=> b!171359 (=> (not res!81418) (not e!113101))))

(assert (=> b!171359 (= res!81418 (= (getValueByKey!182 (toList!1091 lt!85234) (_1!1627 (tuple2!3233 lt!85106 lt!85102))) (Some!187 (_2!1627 (tuple2!3233 lt!85106 lt!85102)))))))

(declare-fun b!171360 () Bool)

(assert (=> b!171360 (= e!113101 (contains!1144 (toList!1091 lt!85234) (tuple2!3233 lt!85106 lt!85102)))))

(assert (= (and d!51901 res!81419) b!171359))

(assert (= (and b!171359 res!81418) b!171360))

(declare-fun m!199529 () Bool)

(assert (=> d!51901 m!199529))

(declare-fun m!199531 () Bool)

(assert (=> d!51901 m!199531))

(declare-fun m!199533 () Bool)

(assert (=> d!51901 m!199533))

(declare-fun m!199535 () Bool)

(assert (=> d!51901 m!199535))

(declare-fun m!199537 () Bool)

(assert (=> b!171359 m!199537))

(declare-fun m!199539 () Bool)

(assert (=> b!171360 m!199539))

(assert (=> b!171092 d!51901))

(declare-fun d!51903 () Bool)

(declare-fun e!113102 () Bool)

(assert (=> d!51903 e!113102))

(declare-fun res!81421 () Bool)

(assert (=> d!51903 (=> (not res!81421) (not e!113102))))

(declare-fun lt!85238 () ListLongMap!2151)

(assert (=> d!51903 (= res!81421 (contains!1142 lt!85238 (_1!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!85236 () List!2203)

(assert (=> d!51903 (= lt!85238 (ListLongMap!2152 lt!85236))))

(declare-fun lt!85237 () Unit!5227)

(declare-fun lt!85235 () Unit!5227)

(assert (=> d!51903 (= lt!85237 lt!85235)))

(assert (=> d!51903 (= (getValueByKey!182 lt!85236 (_1!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!187 (_2!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51903 (= lt!85235 (lemmaContainsTupThenGetReturnValue!98 lt!85236 (_1!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51903 (= lt!85236 (insertStrictlySorted!101 (toList!1091 call!17417) (_1!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51903 (= (+!238 call!17417 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!85238)))

(declare-fun b!171361 () Bool)

(declare-fun res!81420 () Bool)

(assert (=> b!171361 (=> (not res!81420) (not e!113102))))

(assert (=> b!171361 (= res!81420 (= (getValueByKey!182 (toList!1091 lt!85238) (_1!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!187 (_2!1627 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!171362 () Bool)

(assert (=> b!171362 (= e!113102 (contains!1144 (toList!1091 lt!85238) (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!51903 res!81421) b!171361))

(assert (= (and b!171361 res!81420) b!171362))

(declare-fun m!199541 () Bool)

(assert (=> d!51903 m!199541))

(declare-fun m!199543 () Bool)

(assert (=> d!51903 m!199543))

(declare-fun m!199545 () Bool)

(assert (=> d!51903 m!199545))

(declare-fun m!199547 () Bool)

(assert (=> d!51903 m!199547))

(declare-fun m!199549 () Bool)

(assert (=> b!171361 m!199549))

(declare-fun m!199551 () Bool)

(assert (=> b!171362 m!199551))

(assert (=> b!171092 d!51903))

(declare-fun d!51905 () Bool)

(assert (=> d!51905 (not (contains!1142 (+!238 lt!85101 (tuple2!3233 lt!85106 lt!85102)) lt!85105))))

(declare-fun lt!85239 () Unit!5227)

(assert (=> d!51905 (= lt!85239 (choose!934 lt!85101 lt!85106 lt!85102 lt!85105))))

(declare-fun e!113103 () Bool)

(assert (=> d!51905 e!113103))

(declare-fun res!81422 () Bool)

(assert (=> d!51905 (=> (not res!81422) (not e!113103))))

(assert (=> d!51905 (= res!81422 (not (contains!1142 lt!85101 lt!85105)))))

(assert (=> d!51905 (= (addStillNotContains!72 lt!85101 lt!85106 lt!85102 lt!85105) lt!85239)))

(declare-fun b!171363 () Bool)

(assert (=> b!171363 (= e!113103 (not (= lt!85106 lt!85105)))))

(assert (= (and d!51905 res!81422) b!171363))

(assert (=> d!51905 m!199073))

(assert (=> d!51905 m!199073))

(assert (=> d!51905 m!199075))

(declare-fun m!199553 () Bool)

(assert (=> d!51905 m!199553))

(declare-fun m!199555 () Bool)

(assert (=> d!51905 m!199555))

(assert (=> b!171092 d!51905))

(assert (=> b!171092 d!51647))

(declare-fun d!51907 () Bool)

(declare-fun e!113105 () Bool)

(assert (=> d!51907 e!113105))

(declare-fun res!81423 () Bool)

(assert (=> d!51907 (=> res!81423 e!113105)))

(declare-fun lt!85243 () Bool)

(assert (=> d!51907 (= res!81423 (not lt!85243))))

(declare-fun lt!85241 () Bool)

(assert (=> d!51907 (= lt!85243 lt!85241)))

(declare-fun lt!85240 () Unit!5227)

(declare-fun e!113104 () Unit!5227)

(assert (=> d!51907 (= lt!85240 e!113104)))

(declare-fun c!30630 () Bool)

(assert (=> d!51907 (= c!30630 lt!85241)))

(assert (=> d!51907 (= lt!85241 (containsKey!186 (toList!1091 (+!238 lt!85101 (tuple2!3233 lt!85106 lt!85102))) lt!85105))))

(assert (=> d!51907 (= (contains!1142 (+!238 lt!85101 (tuple2!3233 lt!85106 lt!85102)) lt!85105) lt!85243)))

(declare-fun b!171364 () Bool)

(declare-fun lt!85242 () Unit!5227)

(assert (=> b!171364 (= e!113104 lt!85242)))

(assert (=> b!171364 (= lt!85242 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 (+!238 lt!85101 (tuple2!3233 lt!85106 lt!85102))) lt!85105))))

(assert (=> b!171364 (isDefined!136 (getValueByKey!182 (toList!1091 (+!238 lt!85101 (tuple2!3233 lt!85106 lt!85102))) lt!85105))))

(declare-fun b!171365 () Bool)

(declare-fun Unit!5247 () Unit!5227)

(assert (=> b!171365 (= e!113104 Unit!5247)))

(declare-fun b!171366 () Bool)

(assert (=> b!171366 (= e!113105 (isDefined!136 (getValueByKey!182 (toList!1091 (+!238 lt!85101 (tuple2!3233 lt!85106 lt!85102))) lt!85105)))))

(assert (= (and d!51907 c!30630) b!171364))

(assert (= (and d!51907 (not c!30630)) b!171365))

(assert (= (and d!51907 (not res!81423)) b!171366))

(declare-fun m!199557 () Bool)

(assert (=> d!51907 m!199557))

(declare-fun m!199559 () Bool)

(assert (=> b!171364 m!199559))

(declare-fun m!199561 () Bool)

(assert (=> b!171364 m!199561))

(assert (=> b!171364 m!199561))

(declare-fun m!199563 () Bool)

(assert (=> b!171364 m!199563))

(assert (=> b!171366 m!199561))

(assert (=> b!171366 m!199561))

(assert (=> b!171366 m!199563))

(assert (=> b!171092 d!51907))

(declare-fun b!171367 () Bool)

(declare-fun e!113106 () Option!188)

(assert (=> b!171367 (= e!113106 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!85126)))))))

(declare-fun e!113107 () Option!188)

(declare-fun b!171369 () Bool)

(assert (=> b!171369 (= e!113107 (getValueByKey!182 (t!6996 (toList!1091 lt!85126)) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))

(declare-fun b!171370 () Bool)

(assert (=> b!171370 (= e!113107 None!186)))

(declare-fun d!51909 () Bool)

(declare-fun c!30631 () Bool)

(assert (=> d!51909 (= c!30631 (and ((_ is Cons!2199) (toList!1091 lt!85126)) (= (_1!1627 (h!2816 (toList!1091 lt!85126))) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))))))

(assert (=> d!51909 (= (getValueByKey!182 (toList!1091 lt!85126) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))) e!113106)))

(declare-fun b!171368 () Bool)

(assert (=> b!171368 (= e!113106 e!113107)))

(declare-fun c!30632 () Bool)

(assert (=> b!171368 (= c!30632 (and ((_ is Cons!2199) (toList!1091 lt!85126)) (not (= (_1!1627 (h!2816 (toList!1091 lt!85126))) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))))

(assert (= (and d!51909 c!30631) b!171367))

(assert (= (and d!51909 (not c!30631)) b!171368))

(assert (= (and b!171368 c!30632) b!171369))

(assert (= (and b!171368 (not c!30632)) b!171370))

(declare-fun m!199565 () Bool)

(assert (=> b!171369 m!199565))

(assert (=> b!171125 d!51909))

(declare-fun d!51911 () Bool)

(assert (=> d!51911 (= (validMask!0 (mask!8381 lt!84854)) (and (or (= (mask!8381 lt!84854) #b00000000000000000000000000000111) (= (mask!8381 lt!84854) #b00000000000000000000000000001111) (= (mask!8381 lt!84854) #b00000000000000000000000000011111) (= (mask!8381 lt!84854) #b00000000000000000000000000111111) (= (mask!8381 lt!84854) #b00000000000000000000000001111111) (= (mask!8381 lt!84854) #b00000000000000000000000011111111) (= (mask!8381 lt!84854) #b00000000000000000000000111111111) (= (mask!8381 lt!84854) #b00000000000000000000001111111111) (= (mask!8381 lt!84854) #b00000000000000000000011111111111) (= (mask!8381 lt!84854) #b00000000000000000000111111111111) (= (mask!8381 lt!84854) #b00000000000000000001111111111111) (= (mask!8381 lt!84854) #b00000000000000000011111111111111) (= (mask!8381 lt!84854) #b00000000000000000111111111111111) (= (mask!8381 lt!84854) #b00000000000000001111111111111111) (= (mask!8381 lt!84854) #b00000000000000011111111111111111) (= (mask!8381 lt!84854) #b00000000000000111111111111111111) (= (mask!8381 lt!84854) #b00000000000001111111111111111111) (= (mask!8381 lt!84854) #b00000000000011111111111111111111) (= (mask!8381 lt!84854) #b00000000000111111111111111111111) (= (mask!8381 lt!84854) #b00000000001111111111111111111111) (= (mask!8381 lt!84854) #b00000000011111111111111111111111) (= (mask!8381 lt!84854) #b00000000111111111111111111111111) (= (mask!8381 lt!84854) #b00000001111111111111111111111111) (= (mask!8381 lt!84854) #b00000011111111111111111111111111) (= (mask!8381 lt!84854) #b00000111111111111111111111111111) (= (mask!8381 lt!84854) #b00001111111111111111111111111111) (= (mask!8381 lt!84854) #b00011111111111111111111111111111) (= (mask!8381 lt!84854) #b00111111111111111111111111111111)) (bvsle (mask!8381 lt!84854) #b00111111111111111111111111111111)))))

(assert (=> d!51739 d!51911))

(declare-fun d!51913 () Bool)

(assert (=> d!51913 (= (apply!129 lt!85031 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) (get!1933 (getValueByKey!182 (toList!1091 lt!85031) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7055 () Bool)

(assert (= bs!7055 d!51913))

(assert (=> bs!7055 m!198643))

(declare-fun m!199567 () Bool)

(assert (=> bs!7055 m!199567))

(assert (=> bs!7055 m!199567))

(declare-fun m!199569 () Bool)

(assert (=> bs!7055 m!199569))

(assert (=> b!170981 d!51913))

(assert (=> b!170981 d!51647))

(declare-fun d!51915 () Bool)

(assert (=> d!51915 (= (size!3676 thiss!1248) (bvadd (_size!1161 thiss!1248) (bvsdiv (bvadd (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!171173 d!51915))

(declare-fun d!51917 () Bool)

(assert (=> d!51917 (= (get!1933 (getValueByKey!182 (toList!1091 (+!238 lt!84947 (tuple2!3233 lt!84944 v!309))) lt!84961)) (v!3908 (getValueByKey!182 (toList!1091 (+!238 lt!84947 (tuple2!3233 lt!84944 v!309))) lt!84961)))))

(assert (=> d!51699 d!51917))

(declare-fun e!113108 () Option!188)

(declare-fun b!171371 () Bool)

(assert (=> b!171371 (= e!113108 (Some!187 (_2!1627 (h!2816 (toList!1091 (+!238 lt!84947 (tuple2!3233 lt!84944 v!309)))))))))

(declare-fun b!171373 () Bool)

(declare-fun e!113109 () Option!188)

(assert (=> b!171373 (= e!113109 (getValueByKey!182 (t!6996 (toList!1091 (+!238 lt!84947 (tuple2!3233 lt!84944 v!309)))) lt!84961))))

(declare-fun b!171374 () Bool)

(assert (=> b!171374 (= e!113109 None!186)))

(declare-fun c!30633 () Bool)

(declare-fun d!51919 () Bool)

(assert (=> d!51919 (= c!30633 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84947 (tuple2!3233 lt!84944 v!309)))) (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84947 (tuple2!3233 lt!84944 v!309))))) lt!84961)))))

(assert (=> d!51919 (= (getValueByKey!182 (toList!1091 (+!238 lt!84947 (tuple2!3233 lt!84944 v!309))) lt!84961) e!113108)))

(declare-fun b!171372 () Bool)

(assert (=> b!171372 (= e!113108 e!113109)))

(declare-fun c!30634 () Bool)

(assert (=> b!171372 (= c!30634 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84947 (tuple2!3233 lt!84944 v!309)))) (not (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84947 (tuple2!3233 lt!84944 v!309))))) lt!84961))))))

(assert (= (and d!51919 c!30633) b!171371))

(assert (= (and d!51919 (not c!30633)) b!171372))

(assert (= (and b!171372 c!30634) b!171373))

(assert (= (and b!171372 (not c!30634)) b!171374))

(declare-fun m!199571 () Bool)

(assert (=> b!171373 m!199571))

(assert (=> d!51699 d!51919))

(declare-fun d!51921 () Bool)

(declare-fun c!30637 () Bool)

(assert (=> d!51921 (= c!30637 ((_ is Nil!2200) (toList!1091 lt!84897)))))

(declare-fun e!113112 () (InoxSet tuple2!3232))

(assert (=> d!51921 (= (content!147 (toList!1091 lt!84897)) e!113112)))

(declare-fun b!171379 () Bool)

(assert (=> b!171379 (= e!113112 ((as const (Array tuple2!3232 Bool)) false))))

(declare-fun b!171380 () Bool)

(assert (=> b!171380 (= e!113112 ((_ map or) (store ((as const (Array tuple2!3232 Bool)) false) (h!2816 (toList!1091 lt!84897)) true) (content!147 (t!6996 (toList!1091 lt!84897)))))))

(assert (= (and d!51921 c!30637) b!171379))

(assert (= (and d!51921 (not c!30637)) b!171380))

(declare-fun m!199573 () Bool)

(assert (=> b!171380 m!199573))

(declare-fun m!199575 () Bool)

(assert (=> b!171380 m!199575))

(assert (=> d!51791 d!51921))

(declare-fun d!51923 () Bool)

(assert (=> d!51923 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84992) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!85244 () Unit!5227)

(assert (=> d!51923 (= lt!85244 (choose!930 (toList!1091 lt!84992) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!113113 () Bool)

(assert (=> d!51923 e!113113))

(declare-fun res!81424 () Bool)

(assert (=> d!51923 (=> (not res!81424) (not e!113113))))

(assert (=> d!51923 (= res!81424 (isStrictlySorted!326 (toList!1091 lt!84992)))))

(assert (=> d!51923 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84992) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85244)))

(declare-fun b!171381 () Bool)

(assert (=> b!171381 (= e!113113 (containsKey!186 (toList!1091 lt!84992) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!51923 res!81424) b!171381))

(assert (=> d!51923 m!198769))

(assert (=> d!51923 m!198769))

(assert (=> d!51923 m!199035))

(declare-fun m!199577 () Bool)

(assert (=> d!51923 m!199577))

(declare-fun m!199579 () Bool)

(assert (=> d!51923 m!199579))

(assert (=> b!171381 m!199031))

(assert (=> b!171068 d!51923))

(declare-fun d!51925 () Bool)

(assert (=> d!51925 (= (isDefined!136 (getValueByKey!182 (toList!1091 lt!84992) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) (not (isEmpty!438 (getValueByKey!182 (toList!1091 lt!84992) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun bs!7056 () Bool)

(assert (= bs!7056 d!51925))

(assert (=> bs!7056 m!198769))

(declare-fun m!199581 () Bool)

(assert (=> bs!7056 m!199581))

(assert (=> b!171068 d!51925))

(assert (=> b!171068 d!51659))

(declare-fun b!171382 () Bool)

(declare-fun lt!85248 () Unit!5227)

(declare-fun lt!85245 () Unit!5227)

(assert (=> b!171382 (= lt!85248 lt!85245)))

(declare-fun lt!85251 () (_ BitVec 64))

(declare-fun lt!85250 () (_ BitVec 64))

(declare-fun lt!85247 () V!4985)

(declare-fun lt!85246 () ListLongMap!2151)

(assert (=> b!171382 (not (contains!1142 (+!238 lt!85246 (tuple2!3233 lt!85251 lt!85247)) lt!85250))))

(assert (=> b!171382 (= lt!85245 (addStillNotContains!72 lt!85246 lt!85251 lt!85247 lt!85250))))

(assert (=> b!171382 (= lt!85250 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!171382 (= lt!85247 (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171382 (= lt!85251 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun call!17438 () ListLongMap!2151)

(assert (=> b!171382 (= lt!85246 call!17438)))

(declare-fun e!113116 () ListLongMap!2151)

(assert (=> b!171382 (= e!113116 (+!238 call!17438 (tuple2!3233 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!171383 () Bool)

(declare-fun e!113115 () Bool)

(declare-fun e!113119 () Bool)

(assert (=> b!171383 (= e!113115 e!113119)))

(declare-fun c!30640 () Bool)

(declare-fun e!113117 () Bool)

(assert (=> b!171383 (= c!30640 e!113117)))

(declare-fun res!81425 () Bool)

(assert (=> b!171383 (=> (not res!81425) (not e!113117))))

(assert (=> b!171383 (= res!81425 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun b!171384 () Bool)

(declare-fun e!113120 () Bool)

(assert (=> b!171384 (= e!113119 e!113120)))

(assert (=> b!171384 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun res!81426 () Bool)

(declare-fun lt!85249 () ListLongMap!2151)

(assert (=> b!171384 (= res!81426 (contains!1142 lt!85249 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171384 (=> (not res!81426) (not e!113120))))

(declare-fun b!171385 () Bool)

(assert (=> b!171385 (= e!113117 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171385 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!171386 () Bool)

(declare-fun e!113118 () Bool)

(assert (=> b!171386 (= e!113119 e!113118)))

(declare-fun c!30639 () Bool)

(assert (=> b!171386 (= c!30639 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun b!171387 () Bool)

(declare-fun e!113114 () ListLongMap!2151)

(assert (=> b!171387 (= e!113114 e!113116)))

(declare-fun c!30641 () Bool)

(assert (=> b!171387 (= c!30641 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!171388 () Bool)

(assert (=> b!171388 (= e!113118 (= lt!85249 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248))))))

(declare-fun b!171389 () Bool)

(assert (=> b!171389 (= e!113118 (isEmpty!437 lt!85249))))

(declare-fun b!171390 () Bool)

(assert (=> b!171390 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> b!171390 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3671 (_values!3537 thiss!1248))))))

(assert (=> b!171390 (= e!113120 (= (apply!129 lt!85249 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!1932 (select (arr!3377 (_values!3537 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171391 () Bool)

(declare-fun res!81428 () Bool)

(assert (=> b!171391 (=> (not res!81428) (not e!113115))))

(assert (=> b!171391 (= res!81428 (not (contains!1142 lt!85249 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171392 () Bool)

(assert (=> b!171392 (= e!113116 call!17438)))

(declare-fun b!171393 () Bool)

(assert (=> b!171393 (= e!113114 (ListLongMap!2152 Nil!2200))))

(declare-fun d!51927 () Bool)

(assert (=> d!51927 e!113115))

(declare-fun res!81427 () Bool)

(assert (=> d!51927 (=> (not res!81427) (not e!113115))))

(assert (=> d!51927 (= res!81427 (not (contains!1142 lt!85249 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51927 (= lt!85249 e!113114)))

(declare-fun c!30638 () Bool)

(assert (=> d!51927 (= c!30638 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> d!51927 (validMask!0 (mask!8381 thiss!1248))))

(assert (=> d!51927 (= (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248)) lt!85249)))

(declare-fun bm!17435 () Bool)

(assert (=> bm!17435 (= call!17438 (getCurrentListMapNoExtraKeys!150 (_keys!5385 thiss!1248) (_values!3537 thiss!1248) (mask!8381 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248)))))

(assert (= (and d!51927 c!30638) b!171393))

(assert (= (and d!51927 (not c!30638)) b!171387))

(assert (= (and b!171387 c!30641) b!171382))

(assert (= (and b!171387 (not c!30641)) b!171392))

(assert (= (or b!171382 b!171392) bm!17435))

(assert (= (and d!51927 res!81427) b!171391))

(assert (= (and b!171391 res!81428) b!171383))

(assert (= (and b!171383 res!81425) b!171385))

(assert (= (and b!171383 c!30640) b!171384))

(assert (= (and b!171383 (not c!30640)) b!171386))

(assert (= (and b!171384 res!81426) b!171390))

(assert (= (and b!171386 c!30639) b!171388))

(assert (= (and b!171386 (not c!30639)) b!171389))

(declare-fun b_lambda!6903 () Bool)

(assert (=> (not b_lambda!6903) (not b!171382)))

(assert (=> b!171382 t!6999))

(declare-fun b_and!10647 () Bool)

(assert (= b_and!10645 (and (=> t!6999 result!4553) b_and!10647)))

(declare-fun b_lambda!6905 () Bool)

(assert (=> (not b_lambda!6905) (not b!171390)))

(assert (=> b!171390 t!6999))

(declare-fun b_and!10649 () Bool)

(assert (= b_and!10647 (and (=> t!6999 result!4553) b_and!10649)))

(declare-fun m!199583 () Bool)

(assert (=> b!171388 m!199583))

(declare-fun m!199585 () Bool)

(assert (=> b!171391 m!199585))

(assert (=> b!171385 m!199441))

(assert (=> b!171385 m!199441))

(assert (=> b!171385 m!199443))

(declare-fun m!199587 () Bool)

(assert (=> d!51927 m!199587))

(assert (=> d!51927 m!198667))

(assert (=> b!171382 m!198655))

(assert (=> b!171382 m!199447))

(assert (=> b!171382 m!199447))

(assert (=> b!171382 m!198655))

(assert (=> b!171382 m!199449))

(assert (=> b!171382 m!199441))

(declare-fun m!199589 () Bool)

(assert (=> b!171382 m!199589))

(declare-fun m!199591 () Bool)

(assert (=> b!171382 m!199591))

(declare-fun m!199593 () Bool)

(assert (=> b!171382 m!199593))

(declare-fun m!199595 () Bool)

(assert (=> b!171382 m!199595))

(assert (=> b!171382 m!199591))

(assert (=> b!171390 m!198655))

(assert (=> b!171390 m!199447))

(assert (=> b!171390 m!199447))

(assert (=> b!171390 m!198655))

(assert (=> b!171390 m!199449))

(assert (=> b!171390 m!199441))

(declare-fun m!199597 () Bool)

(assert (=> b!171390 m!199597))

(assert (=> b!171390 m!199441))

(assert (=> bm!17435 m!199583))

(assert (=> b!171384 m!199441))

(assert (=> b!171384 m!199441))

(declare-fun m!199599 () Bool)

(assert (=> b!171384 m!199599))

(assert (=> b!171387 m!199441))

(assert (=> b!171387 m!199441))

(assert (=> b!171387 m!199443))

(declare-fun m!199601 () Bool)

(assert (=> b!171389 m!199601))

(assert (=> b!171098 d!51927))

(assert (=> b!171113 d!51797))

(assert (=> b!170987 d!51789))

(declare-fun d!51929 () Bool)

(declare-fun lt!85252 () Bool)

(assert (=> d!51929 (= lt!85252 (select (content!147 (toList!1091 lt!85173)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(declare-fun e!113122 () Bool)

(assert (=> d!51929 (= lt!85252 e!113122)))

(declare-fun res!81429 () Bool)

(assert (=> d!51929 (=> (not res!81429) (not e!113122))))

(assert (=> d!51929 (= res!81429 ((_ is Cons!2199) (toList!1091 lt!85173)))))

(assert (=> d!51929 (= (contains!1144 (toList!1091 lt!85173) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) lt!85252)))

(declare-fun b!171394 () Bool)

(declare-fun e!113121 () Bool)

(assert (=> b!171394 (= e!113122 e!113121)))

(declare-fun res!81430 () Bool)

(assert (=> b!171394 (=> res!81430 e!113121)))

(assert (=> b!171394 (= res!81430 (= (h!2816 (toList!1091 lt!85173)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(declare-fun b!171395 () Bool)

(assert (=> b!171395 (= e!113121 (contains!1144 (t!6996 (toList!1091 lt!85173)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(assert (= (and d!51929 res!81429) b!171394))

(assert (= (and b!171394 (not res!81430)) b!171395))

(declare-fun m!199603 () Bool)

(assert (=> d!51929 m!199603))

(declare-fun m!199605 () Bool)

(assert (=> d!51929 m!199605))

(declare-fun m!199607 () Bool)

(assert (=> b!171395 m!199607))

(assert (=> b!171191 d!51929))

(declare-fun b!171396 () Bool)

(declare-fun e!113123 () Option!188)

(assert (=> b!171396 (= e!113123 (Some!187 (_2!1627 (h!2816 (t!6996 (toList!1091 lt!84853))))))))

(declare-fun b!171398 () Bool)

(declare-fun e!113124 () Option!188)

(assert (=> b!171398 (= e!113124 (getValueByKey!182 (t!6996 (t!6996 (toList!1091 lt!84853))) key!828))))

(declare-fun b!171399 () Bool)

(assert (=> b!171399 (= e!113124 None!186)))

(declare-fun d!51931 () Bool)

(declare-fun c!30642 () Bool)

(assert (=> d!51931 (= c!30642 (and ((_ is Cons!2199) (t!6996 (toList!1091 lt!84853))) (= (_1!1627 (h!2816 (t!6996 (toList!1091 lt!84853)))) key!828)))))

(assert (=> d!51931 (= (getValueByKey!182 (t!6996 (toList!1091 lt!84853)) key!828) e!113123)))

(declare-fun b!171397 () Bool)

(assert (=> b!171397 (= e!113123 e!113124)))

(declare-fun c!30643 () Bool)

(assert (=> b!171397 (= c!30643 (and ((_ is Cons!2199) (t!6996 (toList!1091 lt!84853))) (not (= (_1!1627 (h!2816 (t!6996 (toList!1091 lt!84853)))) key!828))))))

(assert (= (and d!51931 c!30642) b!171396))

(assert (= (and d!51931 (not c!30642)) b!171397))

(assert (= (and b!171397 c!30643) b!171398))

(assert (= (and b!171397 (not c!30643)) b!171399))

(declare-fun m!199609 () Bool)

(assert (=> b!171398 m!199609))

(assert (=> b!170990 d!51931))

(declare-fun d!51933 () Bool)

(declare-fun res!81431 () Bool)

(declare-fun e!113125 () Bool)

(assert (=> d!51933 (=> res!81431 e!113125)))

(assert (=> d!51933 (= res!81431 (and ((_ is Cons!2199) (toList!1091 lt!84987)) (= (_1!1627 (h!2816 (toList!1091 lt!84987))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51933 (= (containsKey!186 (toList!1091 lt!84987) #b0000000000000000000000000000000000000000000000000000000000000000) e!113125)))

(declare-fun b!171400 () Bool)

(declare-fun e!113126 () Bool)

(assert (=> b!171400 (= e!113125 e!113126)))

(declare-fun res!81432 () Bool)

(assert (=> b!171400 (=> (not res!81432) (not e!113126))))

(assert (=> b!171400 (= res!81432 (and (or (not ((_ is Cons!2199) (toList!1091 lt!84987))) (bvsle (_1!1627 (h!2816 (toList!1091 lt!84987))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2199) (toList!1091 lt!84987)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84987))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171401 () Bool)

(assert (=> b!171401 (= e!113126 (containsKey!186 (t!6996 (toList!1091 lt!84987)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!51933 (not res!81431)) b!171400))

(assert (= (and b!171400 res!81432) b!171401))

(declare-fun m!199611 () Bool)

(assert (=> b!171401 m!199611))

(assert (=> d!51707 d!51933))

(declare-fun d!51935 () Bool)

(assert (=> d!51935 (= (get!1933 (getValueByKey!182 (toList!1091 lt!84967) lt!84979)) (v!3908 (getValueByKey!182 (toList!1091 lt!84967) lt!84979)))))

(assert (=> d!51747 d!51935))

(declare-fun b!171402 () Bool)

(declare-fun e!113127 () Option!188)

(assert (=> b!171402 (= e!113127 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!84967)))))))

(declare-fun b!171404 () Bool)

(declare-fun e!113128 () Option!188)

(assert (=> b!171404 (= e!113128 (getValueByKey!182 (t!6996 (toList!1091 lt!84967)) lt!84979))))

(declare-fun b!171405 () Bool)

(assert (=> b!171405 (= e!113128 None!186)))

(declare-fun d!51937 () Bool)

(declare-fun c!30644 () Bool)

(assert (=> d!51937 (= c!30644 (and ((_ is Cons!2199) (toList!1091 lt!84967)) (= (_1!1627 (h!2816 (toList!1091 lt!84967))) lt!84979)))))

(assert (=> d!51937 (= (getValueByKey!182 (toList!1091 lt!84967) lt!84979) e!113127)))

(declare-fun b!171403 () Bool)

(assert (=> b!171403 (= e!113127 e!113128)))

(declare-fun c!30645 () Bool)

(assert (=> b!171403 (= c!30645 (and ((_ is Cons!2199) (toList!1091 lt!84967)) (not (= (_1!1627 (h!2816 (toList!1091 lt!84967))) lt!84979))))))

(assert (= (and d!51937 c!30644) b!171402))

(assert (= (and d!51937 (not c!30644)) b!171403))

(assert (= (and b!171403 c!30645) b!171404))

(assert (= (and b!171403 (not c!30645)) b!171405))

(declare-fun m!199613 () Bool)

(assert (=> b!171404 m!199613))

(assert (=> d!51747 d!51937))

(declare-fun d!51939 () Bool)

(declare-fun res!81433 () Bool)

(declare-fun e!113129 () Bool)

(assert (=> d!51939 (=> res!81433 e!113129)))

(assert (=> d!51939 (= res!81433 (and ((_ is Cons!2199) (toList!1091 lt!84897)) (= (_1!1627 (h!2816 (toList!1091 lt!84897))) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(assert (=> d!51939 (= (containsKey!186 (toList!1091 lt!84897) (_1!1627 (tuple2!3233 key!828 v!309))) e!113129)))

(declare-fun b!171406 () Bool)

(declare-fun e!113130 () Bool)

(assert (=> b!171406 (= e!113129 e!113130)))

(declare-fun res!81434 () Bool)

(assert (=> b!171406 (=> (not res!81434) (not e!113130))))

(assert (=> b!171406 (= res!81434 (and (or (not ((_ is Cons!2199) (toList!1091 lt!84897))) (bvsle (_1!1627 (h!2816 (toList!1091 lt!84897))) (_1!1627 (tuple2!3233 key!828 v!309)))) ((_ is Cons!2199) (toList!1091 lt!84897)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84897))) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(declare-fun b!171407 () Bool)

(assert (=> b!171407 (= e!113130 (containsKey!186 (t!6996 (toList!1091 lt!84897)) (_1!1627 (tuple2!3233 key!828 v!309))))))

(assert (= (and d!51939 (not res!81433)) b!171406))

(assert (= (and b!171406 res!81434) b!171407))

(declare-fun m!199615 () Bool)

(assert (=> b!171407 m!199615))

(assert (=> d!51709 d!51939))

(declare-fun d!51941 () Bool)

(declare-fun lt!85253 () Bool)

(assert (=> d!51941 (= lt!85253 (select (content!147 (t!6996 (toList!1091 lt!84897))) (tuple2!3233 key!828 v!309)))))

(declare-fun e!113132 () Bool)

(assert (=> d!51941 (= lt!85253 e!113132)))

(declare-fun res!81435 () Bool)

(assert (=> d!51941 (=> (not res!81435) (not e!113132))))

(assert (=> d!51941 (= res!81435 ((_ is Cons!2199) (t!6996 (toList!1091 lt!84897))))))

(assert (=> d!51941 (= (contains!1144 (t!6996 (toList!1091 lt!84897)) (tuple2!3233 key!828 v!309)) lt!85253)))

(declare-fun b!171408 () Bool)

(declare-fun e!113131 () Bool)

(assert (=> b!171408 (= e!113132 e!113131)))

(declare-fun res!81436 () Bool)

(assert (=> b!171408 (=> res!81436 e!113131)))

(assert (=> b!171408 (= res!81436 (= (h!2816 (t!6996 (toList!1091 lt!84897))) (tuple2!3233 key!828 v!309)))))

(declare-fun b!171409 () Bool)

(assert (=> b!171409 (= e!113131 (contains!1144 (t!6996 (t!6996 (toList!1091 lt!84897))) (tuple2!3233 key!828 v!309)))))

(assert (= (and d!51941 res!81435) b!171408))

(assert (= (and b!171408 (not res!81436)) b!171409))

(assert (=> d!51941 m!199575))

(declare-fun m!199617 () Bool)

(assert (=> d!51941 m!199617))

(declare-fun m!199619 () Bool)

(assert (=> b!171409 m!199619))

(assert (=> b!171189 d!51941))

(declare-fun d!51943 () Bool)

(declare-fun lt!85254 () Bool)

(assert (=> d!51943 (= lt!85254 (select (content!147 lt!84990) (tuple2!3233 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!113134 () Bool)

(assert (=> d!51943 (= lt!85254 e!113134)))

(declare-fun res!81437 () Bool)

(assert (=> d!51943 (=> (not res!81437) (not e!113134))))

(assert (=> d!51943 (= res!81437 ((_ is Cons!2199) lt!84990))))

(assert (=> d!51943 (= (contains!1144 lt!84990 (tuple2!3233 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!85254)))

(declare-fun b!171410 () Bool)

(declare-fun e!113133 () Bool)

(assert (=> b!171410 (= e!113134 e!113133)))

(declare-fun res!81438 () Bool)

(assert (=> b!171410 (=> res!81438 e!113133)))

(assert (=> b!171410 (= res!81438 (= (h!2816 lt!84990) (tuple2!3233 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171411 () Bool)

(assert (=> b!171411 (= e!113133 (contains!1144 (t!6996 lt!84990) (tuple2!3233 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!51943 res!81437) b!171410))

(assert (= (and b!171410 (not res!81438)) b!171411))

(declare-fun m!199621 () Bool)

(assert (=> d!51943 m!199621))

(declare-fun m!199623 () Bool)

(assert (=> d!51943 m!199623))

(declare-fun m!199625 () Bool)

(assert (=> b!171411 m!199625))

(assert (=> b!171076 d!51943))

(assert (=> d!51761 d!51743))

(declare-fun d!51945 () Bool)

(declare-fun e!113136 () Bool)

(assert (=> d!51945 e!113136))

(declare-fun res!81439 () Bool)

(assert (=> d!51945 (=> res!81439 e!113136)))

(declare-fun lt!85258 () Bool)

(assert (=> d!51945 (= res!81439 (not lt!85258))))

(declare-fun lt!85256 () Bool)

(assert (=> d!51945 (= lt!85258 lt!85256)))

(declare-fun lt!85255 () Unit!5227)

(declare-fun e!113135 () Unit!5227)

(assert (=> d!51945 (= lt!85255 e!113135)))

(declare-fun c!30646 () Bool)

(assert (=> d!51945 (= c!30646 lt!85256)))

(assert (=> d!51945 (= lt!85256 (containsKey!186 (toList!1091 lt!84972) lt!84986))))

(assert (=> d!51945 (= (contains!1142 lt!84972 lt!84986) lt!85258)))

(declare-fun b!171412 () Bool)

(declare-fun lt!85257 () Unit!5227)

(assert (=> b!171412 (= e!113135 lt!85257)))

(assert (=> b!171412 (= lt!85257 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84972) lt!84986))))

(assert (=> b!171412 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84972) lt!84986))))

(declare-fun b!171413 () Bool)

(declare-fun Unit!5248 () Unit!5227)

(assert (=> b!171413 (= e!113135 Unit!5248)))

(declare-fun b!171414 () Bool)

(assert (=> b!171414 (= e!113136 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84972) lt!84986)))))

(assert (= (and d!51945 c!30646) b!171412))

(assert (= (and d!51945 (not c!30646)) b!171413))

(assert (= (and d!51945 (not res!81439)) b!171414))

(declare-fun m!199627 () Bool)

(assert (=> d!51945 m!199627))

(declare-fun m!199629 () Bool)

(assert (=> b!171412 m!199629))

(assert (=> b!171412 m!199157))

(assert (=> b!171412 m!199157))

(declare-fun m!199631 () Bool)

(assert (=> b!171412 m!199631))

(assert (=> b!171414 m!199157))

(assert (=> b!171414 m!199157))

(assert (=> b!171414 m!199631))

(assert (=> d!51761 d!51945))

(assert (=> d!51761 d!51763))

(declare-fun d!51947 () Bool)

(assert (=> d!51947 (= (apply!129 (+!238 lt!84972 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))) lt!84986) (apply!129 lt!84972 lt!84986))))

(assert (=> d!51947 true))

(declare-fun _$34!1047 () Unit!5227)

(assert (=> d!51947 (= (choose!931 lt!84972 lt!84969 (zeroValue!3397 thiss!1248) lt!84986) _$34!1047)))

(declare-fun bs!7057 () Bool)

(assert (= bs!7057 d!51947))

(assert (=> bs!7057 m!198755))

(assert (=> bs!7057 m!198755))

(assert (=> bs!7057 m!198757))

(assert (=> bs!7057 m!198733))

(assert (=> d!51761 d!51947))

(assert (=> d!51761 d!51767))

(declare-fun d!51949 () Bool)

(assert (=> d!51949 (= (get!1933 (getValueByKey!182 (toList!1091 lt!84962) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))) (v!3908 (getValueByKey!182 (toList!1091 lt!84962) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!51655 d!51949))

(declare-fun b!171416 () Bool)

(declare-fun e!113137 () Option!188)

(assert (=> b!171416 (= e!113137 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!84962)))))))

(declare-fun b!171418 () Bool)

(declare-fun e!113138 () Option!188)

(assert (=> b!171418 (= e!113138 (getValueByKey!182 (t!6996 (toList!1091 lt!84962)) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171419 () Bool)

(assert (=> b!171419 (= e!113138 None!186)))

(declare-fun d!51951 () Bool)

(declare-fun c!30647 () Bool)

(assert (=> d!51951 (= c!30647 (and ((_ is Cons!2199) (toList!1091 lt!84962)) (= (_1!1627 (h!2816 (toList!1091 lt!84962))) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!51951 (= (getValueByKey!182 (toList!1091 lt!84962) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) e!113137)))

(declare-fun b!171417 () Bool)

(assert (=> b!171417 (= e!113137 e!113138)))

(declare-fun c!30648 () Bool)

(assert (=> b!171417 (= c!30648 (and ((_ is Cons!2199) (toList!1091 lt!84962)) (not (= (_1!1627 (h!2816 (toList!1091 lt!84962))) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))))

(assert (= (and d!51951 c!30647) b!171416))

(assert (= (and d!51951 (not c!30647)) b!171417))

(assert (= (and b!171417 c!30648) b!171418))

(assert (= (and b!171417 (not c!30648)) b!171419))

(assert (=> b!171418 m!198643))

(declare-fun m!199633 () Bool)

(assert (=> b!171418 m!199633))

(assert (=> d!51655 d!51951))

(declare-fun d!51953 () Bool)

(assert (=> d!51953 (= (apply!129 lt!85162 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1933 (getValueByKey!182 (toList!1091 lt!85162) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7058 () Bool)

(assert (= bs!7058 d!51953))

(declare-fun m!199635 () Bool)

(assert (=> bs!7058 m!199635))

(assert (=> bs!7058 m!199635))

(declare-fun m!199637 () Bool)

(assert (=> bs!7058 m!199637))

(assert (=> b!171162 d!51953))

(declare-fun d!51955 () Bool)

(declare-fun res!81440 () Bool)

(declare-fun e!113139 () Bool)

(assert (=> d!51955 (=> res!81440 e!113139)))

(assert (=> d!51955 (= res!81440 (and ((_ is Cons!2199) lt!85082) (= (_1!1627 (h!2816 lt!85082)) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(assert (=> d!51955 (= (containsKey!186 lt!85082 (_1!1627 (tuple2!3233 key!828 v!309))) e!113139)))

(declare-fun b!171420 () Bool)

(declare-fun e!113140 () Bool)

(assert (=> b!171420 (= e!113139 e!113140)))

(declare-fun res!81441 () Bool)

(assert (=> b!171420 (=> (not res!81441) (not e!113140))))

(assert (=> b!171420 (= res!81441 (and (or (not ((_ is Cons!2199) lt!85082)) (bvsle (_1!1627 (h!2816 lt!85082)) (_1!1627 (tuple2!3233 key!828 v!309)))) ((_ is Cons!2199) lt!85082) (bvslt (_1!1627 (h!2816 lt!85082)) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(declare-fun b!171421 () Bool)

(assert (=> b!171421 (= e!113140 (containsKey!186 (t!6996 lt!85082) (_1!1627 (tuple2!3233 key!828 v!309))))))

(assert (= (and d!51955 (not res!81440)) b!171420))

(assert (= (and b!171420 res!81441) b!171421))

(declare-fun m!199639 () Bool)

(assert (=> b!171421 m!199639))

(assert (=> b!171056 d!51955))

(declare-fun lt!85259 () Bool)

(declare-fun d!51957 () Bool)

(assert (=> d!51957 (= lt!85259 (select (content!147 (toList!1091 lt!85061)) (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))))

(declare-fun e!113142 () Bool)

(assert (=> d!51957 (= lt!85259 e!113142)))

(declare-fun res!81442 () Bool)

(assert (=> d!51957 (=> (not res!81442) (not e!113142))))

(assert (=> d!51957 (= res!81442 ((_ is Cons!2199) (toList!1091 lt!85061)))))

(assert (=> d!51957 (= (contains!1144 (toList!1091 lt!85061) (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))) lt!85259)))

(declare-fun b!171422 () Bool)

(declare-fun e!113141 () Bool)

(assert (=> b!171422 (= e!113142 e!113141)))

(declare-fun res!81443 () Bool)

(assert (=> b!171422 (=> res!81443 e!113141)))

(assert (=> b!171422 (= res!81443 (= (h!2816 (toList!1091 lt!85061)) (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))))

(declare-fun b!171423 () Bool)

(assert (=> b!171423 (= e!113141 (contains!1144 (t!6996 (toList!1091 lt!85061)) (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))))

(assert (= (and d!51957 res!81442) b!171422))

(assert (= (and b!171422 (not res!81443)) b!171423))

(declare-fun m!199641 () Bool)

(assert (=> d!51957 m!199641))

(declare-fun m!199643 () Bool)

(assert (=> d!51957 m!199643))

(declare-fun m!199645 () Bool)

(assert (=> b!171423 m!199645))

(assert (=> b!171008 d!51957))

(assert (=> d!51701 d!51689))

(assert (=> d!51701 d!51685))

(declare-fun d!51959 () Bool)

(assert (=> d!51959 (contains!1142 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309)) lt!84949)))

(assert (=> d!51959 true))

(declare-fun _$35!408 () Unit!5227)

(assert (=> d!51959 (= (choose!932 lt!84960 lt!84945 v!309 lt!84949) _$35!408)))

(declare-fun bs!7059 () Bool)

(assert (= bs!7059 d!51959))

(assert (=> bs!7059 m!198693))

(assert (=> bs!7059 m!198693))

(assert (=> bs!7059 m!198695))

(assert (=> d!51701 d!51959))

(declare-fun d!51961 () Bool)

(declare-fun e!113144 () Bool)

(assert (=> d!51961 e!113144))

(declare-fun res!81444 () Bool)

(assert (=> d!51961 (=> res!81444 e!113144)))

(declare-fun lt!85263 () Bool)

(assert (=> d!51961 (= res!81444 (not lt!85263))))

(declare-fun lt!85261 () Bool)

(assert (=> d!51961 (= lt!85263 lt!85261)))

(declare-fun lt!85260 () Unit!5227)

(declare-fun e!113143 () Unit!5227)

(assert (=> d!51961 (= lt!85260 e!113143)))

(declare-fun c!30649 () Bool)

(assert (=> d!51961 (= c!30649 lt!85261)))

(assert (=> d!51961 (= lt!85261 (containsKey!186 (toList!1091 lt!84960) lt!84949))))

(assert (=> d!51961 (= (contains!1142 lt!84960 lt!84949) lt!85263)))

(declare-fun b!171425 () Bool)

(declare-fun lt!85262 () Unit!5227)

(assert (=> b!171425 (= e!113143 lt!85262)))

(assert (=> b!171425 (= lt!85262 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84960) lt!84949))))

(assert (=> b!171425 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84960) lt!84949))))

(declare-fun b!171426 () Bool)

(declare-fun Unit!5249 () Unit!5227)

(assert (=> b!171426 (= e!113143 Unit!5249)))

(declare-fun b!171427 () Bool)

(assert (=> b!171427 (= e!113144 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84960) lt!84949)))))

(assert (= (and d!51961 c!30649) b!171425))

(assert (= (and d!51961 (not c!30649)) b!171426))

(assert (= (and d!51961 (not res!81444)) b!171427))

(declare-fun m!199647 () Bool)

(assert (=> d!51961 m!199647))

(declare-fun m!199649 () Bool)

(assert (=> b!171425 m!199649))

(declare-fun m!199651 () Bool)

(assert (=> b!171425 m!199651))

(assert (=> b!171425 m!199651))

(declare-fun m!199653 () Bool)

(assert (=> b!171425 m!199653))

(assert (=> b!171427 m!199651))

(assert (=> b!171427 m!199651))

(assert (=> b!171427 m!199653))

(assert (=> d!51701 d!51961))

(declare-fun d!51963 () Bool)

(assert (=> d!51963 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85264 () Unit!5227)

(assert (=> d!51963 (= lt!85264 (choose!930 (toList!1091 lt!84962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!113145 () Bool)

(assert (=> d!51963 e!113145))

(declare-fun res!81445 () Bool)

(assert (=> d!51963 (=> (not res!81445) (not e!113145))))

(assert (=> d!51963 (= res!81445 (isStrictlySorted!326 (toList!1091 lt!84962)))))

(assert (=> d!51963 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84962) #b1000000000000000000000000000000000000000000000000000000000000000) lt!85264)))

(declare-fun b!171428 () Bool)

(assert (=> b!171428 (= e!113145 (containsKey!186 (toList!1091 lt!84962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!51963 res!81445) b!171428))

(assert (=> d!51963 m!199003))

(assert (=> d!51963 m!199003))

(assert (=> d!51963 m!199005))

(declare-fun m!199655 () Bool)

(assert (=> d!51963 m!199655))

(declare-fun m!199657 () Bool)

(assert (=> d!51963 m!199657))

(assert (=> b!171428 m!198999))

(assert (=> b!171059 d!51963))

(assert (=> b!171059 d!51849))

(assert (=> b!171059 d!51851))

(assert (=> b!170976 d!51651))

(assert (=> d!51741 d!51769))

(assert (=> d!51741 d!51745))

(declare-fun d!51965 () Bool)

(assert (=> d!51965 (contains!1142 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))) lt!84974)))

(assert (=> d!51965 true))

(declare-fun _$35!409 () Unit!5227)

(assert (=> d!51965 (= (choose!932 lt!84985 lt!84970 (zeroValue!3397 thiss!1248) lt!84974) _$35!409)))

(declare-fun bs!7060 () Bool)

(assert (= bs!7060 d!51965))

(assert (=> bs!7060 m!198751))

(assert (=> bs!7060 m!198751))

(assert (=> bs!7060 m!198753))

(assert (=> d!51741 d!51965))

(declare-fun d!51967 () Bool)

(declare-fun e!113147 () Bool)

(assert (=> d!51967 e!113147))

(declare-fun res!81446 () Bool)

(assert (=> d!51967 (=> res!81446 e!113147)))

(declare-fun lt!85268 () Bool)

(assert (=> d!51967 (= res!81446 (not lt!85268))))

(declare-fun lt!85266 () Bool)

(assert (=> d!51967 (= lt!85268 lt!85266)))

(declare-fun lt!85265 () Unit!5227)

(declare-fun e!113146 () Unit!5227)

(assert (=> d!51967 (= lt!85265 e!113146)))

(declare-fun c!30650 () Bool)

(assert (=> d!51967 (= c!30650 lt!85266)))

(assert (=> d!51967 (= lt!85266 (containsKey!186 (toList!1091 lt!84985) lt!84974))))

(assert (=> d!51967 (= (contains!1142 lt!84985 lt!84974) lt!85268)))

(declare-fun b!171429 () Bool)

(declare-fun lt!85267 () Unit!5227)

(assert (=> b!171429 (= e!113146 lt!85267)))

(assert (=> b!171429 (= lt!85267 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84985) lt!84974))))

(assert (=> b!171429 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84985) lt!84974))))

(declare-fun b!171430 () Bool)

(declare-fun Unit!5250 () Unit!5227)

(assert (=> b!171430 (= e!113146 Unit!5250)))

(declare-fun b!171431 () Bool)

(assert (=> b!171431 (= e!113147 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84985) lt!84974)))))

(assert (= (and d!51967 c!30650) b!171429))

(assert (= (and d!51967 (not c!30650)) b!171430))

(assert (= (and d!51967 (not res!81446)) b!171431))

(declare-fun m!199659 () Bool)

(assert (=> d!51967 m!199659))

(declare-fun m!199661 () Bool)

(assert (=> b!171429 m!199661))

(declare-fun m!199663 () Bool)

(assert (=> b!171429 m!199663))

(assert (=> b!171429 m!199663))

(declare-fun m!199665 () Bool)

(assert (=> b!171429 m!199665))

(assert (=> b!171431 m!199663))

(assert (=> b!171431 m!199663))

(assert (=> b!171431 m!199665))

(assert (=> d!51741 d!51967))

(declare-fun d!51969 () Bool)

(declare-fun res!81447 () Bool)

(declare-fun e!113148 () Bool)

(assert (=> d!51969 (=> res!81447 e!113148)))

(assert (=> d!51969 (= res!81447 (and ((_ is Cons!2199) (toList!1091 lt!84962)) (= (_1!1627 (h!2816 (toList!1091 lt!84962))) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!51969 (= (containsKey!186 (toList!1091 lt!84962) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) e!113148)))

(declare-fun b!171432 () Bool)

(declare-fun e!113149 () Bool)

(assert (=> b!171432 (= e!113148 e!113149)))

(declare-fun res!81448 () Bool)

(assert (=> b!171432 (=> (not res!81448) (not e!113149))))

(assert (=> b!171432 (= res!81448 (and (or (not ((_ is Cons!2199) (toList!1091 lt!84962))) (bvsle (_1!1627 (h!2816 (toList!1091 lt!84962))) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2199) (toList!1091 lt!84962)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84962))) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!171433 () Bool)

(assert (=> b!171433 (= e!113149 (containsKey!186 (t!6996 (toList!1091 lt!84962)) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51969 (not res!81447)) b!171432))

(assert (= (and b!171432 res!81448) b!171433))

(assert (=> b!171433 m!198643))

(declare-fun m!199667 () Bool)

(assert (=> b!171433 m!199667))

(assert (=> d!51773 d!51969))

(declare-fun b!171434 () Bool)

(declare-fun e!113152 () Bool)

(assert (=> b!171434 (= e!113152 (contains!1145 (ite c!30514 (Cons!2201 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) Nil!2202) Nil!2202) (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!171435 () Bool)

(declare-fun e!113151 () Bool)

(declare-fun e!113150 () Bool)

(assert (=> b!171435 (= e!113151 e!113150)))

(declare-fun res!81449 () Bool)

(assert (=> b!171435 (=> (not res!81449) (not e!113150))))

(assert (=> b!171435 (= res!81449 (not e!113152))))

(declare-fun res!81450 () Bool)

(assert (=> b!171435 (=> (not res!81450) (not e!113152))))

(assert (=> b!171435 (= res!81450 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!51971 () Bool)

(declare-fun res!81451 () Bool)

(assert (=> d!51971 (=> res!81451 e!113151)))

(assert (=> d!51971 (= res!81451 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> d!51971 (= (arrayNoDuplicates!0 (_keys!5385 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30514 (Cons!2201 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) Nil!2202) Nil!2202)) e!113151)))

(declare-fun b!171436 () Bool)

(declare-fun e!113153 () Bool)

(assert (=> b!171436 (= e!113150 e!113153)))

(declare-fun c!30651 () Bool)

(assert (=> b!171436 (= c!30651 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!17436 () Bool)

(declare-fun call!17439 () Bool)

(assert (=> bm!17436 (= call!17439 (arrayNoDuplicates!0 (_keys!5385 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!30651 (Cons!2201 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!30514 (Cons!2201 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) Nil!2202) Nil!2202)) (ite c!30514 (Cons!2201 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000) Nil!2202) Nil!2202))))))

(declare-fun b!171437 () Bool)

(assert (=> b!171437 (= e!113153 call!17439)))

(declare-fun b!171438 () Bool)

(assert (=> b!171438 (= e!113153 call!17439)))

(assert (= (and d!51971 (not res!81451)) b!171435))

(assert (= (and b!171435 res!81450) b!171434))

(assert (= (and b!171435 res!81449) b!171436))

(assert (= (and b!171436 c!30651) b!171437))

(assert (= (and b!171436 (not c!30651)) b!171438))

(assert (= (or b!171437 b!171438) bm!17436))

(assert (=> b!171434 m!199441))

(assert (=> b!171434 m!199441))

(declare-fun m!199669 () Bool)

(assert (=> b!171434 m!199669))

(assert (=> b!171435 m!199441))

(assert (=> b!171435 m!199441))

(assert (=> b!171435 m!199443))

(assert (=> b!171436 m!199441))

(assert (=> b!171436 m!199441))

(assert (=> b!171436 m!199443))

(assert (=> bm!17436 m!199441))

(declare-fun m!199671 () Bool)

(assert (=> bm!17436 m!199671))

(assert (=> bm!17396 d!51971))

(declare-fun d!51973 () Bool)

(declare-fun e!113155 () Bool)

(assert (=> d!51973 e!113155))

(declare-fun res!81452 () Bool)

(assert (=> d!51973 (=> res!81452 e!113155)))

(declare-fun lt!85272 () Bool)

(assert (=> d!51973 (= res!81452 (not lt!85272))))

(declare-fun lt!85270 () Bool)

(assert (=> d!51973 (= lt!85272 lt!85270)))

(declare-fun lt!85269 () Unit!5227)

(declare-fun e!113154 () Unit!5227)

(assert (=> d!51973 (= lt!85269 e!113154)))

(declare-fun c!30652 () Bool)

(assert (=> d!51973 (= c!30652 lt!85270)))

(assert (=> d!51973 (= lt!85270 (containsKey!186 (toList!1091 lt!85048) (_1!1627 (tuple2!3233 lt!84945 v!309))))))

(assert (=> d!51973 (= (contains!1142 lt!85048 (_1!1627 (tuple2!3233 lt!84945 v!309))) lt!85272)))

(declare-fun b!171439 () Bool)

(declare-fun lt!85271 () Unit!5227)

(assert (=> b!171439 (= e!113154 lt!85271)))

(assert (=> b!171439 (= lt!85271 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85048) (_1!1627 (tuple2!3233 lt!84945 v!309))))))

(assert (=> b!171439 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85048) (_1!1627 (tuple2!3233 lt!84945 v!309))))))

(declare-fun b!171440 () Bool)

(declare-fun Unit!5251 () Unit!5227)

(assert (=> b!171440 (= e!113154 Unit!5251)))

(declare-fun b!171441 () Bool)

(assert (=> b!171441 (= e!113155 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85048) (_1!1627 (tuple2!3233 lt!84945 v!309)))))))

(assert (= (and d!51973 c!30652) b!171439))

(assert (= (and d!51973 (not c!30652)) b!171440))

(assert (= (and d!51973 (not res!81452)) b!171441))

(declare-fun m!199673 () Bool)

(assert (=> d!51973 m!199673))

(declare-fun m!199675 () Bool)

(assert (=> b!171439 m!199675))

(assert (=> b!171439 m!198897))

(assert (=> b!171439 m!198897))

(declare-fun m!199677 () Bool)

(assert (=> b!171439 m!199677))

(assert (=> b!171441 m!198897))

(assert (=> b!171441 m!198897))

(assert (=> b!171441 m!199677))

(assert (=> d!51685 d!51973))

(declare-fun b!171442 () Bool)

(declare-fun e!113156 () Option!188)

(assert (=> b!171442 (= e!113156 (Some!187 (_2!1627 (h!2816 lt!85046))))))

(declare-fun b!171444 () Bool)

(declare-fun e!113157 () Option!188)

(assert (=> b!171444 (= e!113157 (getValueByKey!182 (t!6996 lt!85046) (_1!1627 (tuple2!3233 lt!84945 v!309))))))

(declare-fun b!171445 () Bool)

(assert (=> b!171445 (= e!113157 None!186)))

(declare-fun c!30653 () Bool)

(declare-fun d!51975 () Bool)

(assert (=> d!51975 (= c!30653 (and ((_ is Cons!2199) lt!85046) (= (_1!1627 (h!2816 lt!85046)) (_1!1627 (tuple2!3233 lt!84945 v!309)))))))

(assert (=> d!51975 (= (getValueByKey!182 lt!85046 (_1!1627 (tuple2!3233 lt!84945 v!309))) e!113156)))

(declare-fun b!171443 () Bool)

(assert (=> b!171443 (= e!113156 e!113157)))

(declare-fun c!30654 () Bool)

(assert (=> b!171443 (= c!30654 (and ((_ is Cons!2199) lt!85046) (not (= (_1!1627 (h!2816 lt!85046)) (_1!1627 (tuple2!3233 lt!84945 v!309))))))))

(assert (= (and d!51975 c!30653) b!171442))

(assert (= (and d!51975 (not c!30653)) b!171443))

(assert (= (and b!171443 c!30654) b!171444))

(assert (= (and b!171443 (not c!30654)) b!171445))

(declare-fun m!199679 () Bool)

(assert (=> b!171444 m!199679))

(assert (=> d!51685 d!51975))

(declare-fun d!51977 () Bool)

(assert (=> d!51977 (= (getValueByKey!182 lt!85046 (_1!1627 (tuple2!3233 lt!84945 v!309))) (Some!187 (_2!1627 (tuple2!3233 lt!84945 v!309))))))

(declare-fun lt!85273 () Unit!5227)

(assert (=> d!51977 (= lt!85273 (choose!933 lt!85046 (_1!1627 (tuple2!3233 lt!84945 v!309)) (_2!1627 (tuple2!3233 lt!84945 v!309))))))

(declare-fun e!113158 () Bool)

(assert (=> d!51977 e!113158))

(declare-fun res!81453 () Bool)

(assert (=> d!51977 (=> (not res!81453) (not e!113158))))

(assert (=> d!51977 (= res!81453 (isStrictlySorted!326 lt!85046))))

(assert (=> d!51977 (= (lemmaContainsTupThenGetReturnValue!98 lt!85046 (_1!1627 (tuple2!3233 lt!84945 v!309)) (_2!1627 (tuple2!3233 lt!84945 v!309))) lt!85273)))

(declare-fun b!171446 () Bool)

(declare-fun res!81454 () Bool)

(assert (=> b!171446 (=> (not res!81454) (not e!113158))))

(assert (=> b!171446 (= res!81454 (containsKey!186 lt!85046 (_1!1627 (tuple2!3233 lt!84945 v!309))))))

(declare-fun b!171447 () Bool)

(assert (=> b!171447 (= e!113158 (contains!1144 lt!85046 (tuple2!3233 (_1!1627 (tuple2!3233 lt!84945 v!309)) (_2!1627 (tuple2!3233 lt!84945 v!309)))))))

(assert (= (and d!51977 res!81453) b!171446))

(assert (= (and b!171446 res!81454) b!171447))

(assert (=> d!51977 m!198891))

(declare-fun m!199681 () Bool)

(assert (=> d!51977 m!199681))

(declare-fun m!199683 () Bool)

(assert (=> d!51977 m!199683))

(declare-fun m!199685 () Bool)

(assert (=> b!171446 m!199685))

(declare-fun m!199687 () Bool)

(assert (=> b!171447 m!199687))

(assert (=> d!51685 d!51977))

(declare-fun e!113159 () List!2203)

(declare-fun b!171448 () Bool)

(assert (=> b!171448 (= e!113159 (insertStrictlySorted!101 (t!6996 (toList!1091 lt!84960)) (_1!1627 (tuple2!3233 lt!84945 v!309)) (_2!1627 (tuple2!3233 lt!84945 v!309))))))

(declare-fun b!171449 () Bool)

(declare-fun e!113161 () List!2203)

(declare-fun call!17441 () List!2203)

(assert (=> b!171449 (= e!113161 call!17441)))

(declare-fun b!171450 () Bool)

(declare-fun e!113160 () List!2203)

(declare-fun call!17440 () List!2203)

(assert (=> b!171450 (= e!113160 call!17440)))

(declare-fun bm!17437 () Bool)

(declare-fun call!17442 () List!2203)

(assert (=> bm!17437 (= call!17442 call!17441)))

(declare-fun b!171451 () Bool)

(declare-fun e!113163 () List!2203)

(assert (=> b!171451 (= e!113161 e!113163)))

(declare-fun c!30655 () Bool)

(assert (=> b!171451 (= c!30655 (and ((_ is Cons!2199) (toList!1091 lt!84960)) (= (_1!1627 (h!2816 (toList!1091 lt!84960))) (_1!1627 (tuple2!3233 lt!84945 v!309)))))))

(declare-fun d!51979 () Bool)

(declare-fun e!113162 () Bool)

(assert (=> d!51979 e!113162))

(declare-fun res!81455 () Bool)

(assert (=> d!51979 (=> (not res!81455) (not e!113162))))

(declare-fun lt!85274 () List!2203)

(assert (=> d!51979 (= res!81455 (isStrictlySorted!326 lt!85274))))

(assert (=> d!51979 (= lt!85274 e!113161)))

(declare-fun c!30657 () Bool)

(assert (=> d!51979 (= c!30657 (and ((_ is Cons!2199) (toList!1091 lt!84960)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84960))) (_1!1627 (tuple2!3233 lt!84945 v!309)))))))

(assert (=> d!51979 (isStrictlySorted!326 (toList!1091 lt!84960))))

(assert (=> d!51979 (= (insertStrictlySorted!101 (toList!1091 lt!84960) (_1!1627 (tuple2!3233 lt!84945 v!309)) (_2!1627 (tuple2!3233 lt!84945 v!309))) lt!85274)))

(declare-fun b!171452 () Bool)

(assert (=> b!171452 (= e!113163 call!17442)))

(declare-fun b!171453 () Bool)

(declare-fun c!30656 () Bool)

(assert (=> b!171453 (= e!113159 (ite c!30655 (t!6996 (toList!1091 lt!84960)) (ite c!30656 (Cons!2199 (h!2816 (toList!1091 lt!84960)) (t!6996 (toList!1091 lt!84960))) Nil!2200)))))

(declare-fun bm!17438 () Bool)

(assert (=> bm!17438 (= call!17440 call!17442)))

(declare-fun b!171454 () Bool)

(assert (=> b!171454 (= c!30656 (and ((_ is Cons!2199) (toList!1091 lt!84960)) (bvsgt (_1!1627 (h!2816 (toList!1091 lt!84960))) (_1!1627 (tuple2!3233 lt!84945 v!309)))))))

(assert (=> b!171454 (= e!113163 e!113160)))

(declare-fun bm!17439 () Bool)

(assert (=> bm!17439 (= call!17441 ($colon$colon!96 e!113159 (ite c!30657 (h!2816 (toList!1091 lt!84960)) (tuple2!3233 (_1!1627 (tuple2!3233 lt!84945 v!309)) (_2!1627 (tuple2!3233 lt!84945 v!309))))))))

(declare-fun c!30658 () Bool)

(assert (=> bm!17439 (= c!30658 c!30657)))

(declare-fun b!171455 () Bool)

(declare-fun res!81456 () Bool)

(assert (=> b!171455 (=> (not res!81456) (not e!113162))))

(assert (=> b!171455 (= res!81456 (containsKey!186 lt!85274 (_1!1627 (tuple2!3233 lt!84945 v!309))))))

(declare-fun b!171456 () Bool)

(assert (=> b!171456 (= e!113160 call!17440)))

(declare-fun b!171457 () Bool)

(assert (=> b!171457 (= e!113162 (contains!1144 lt!85274 (tuple2!3233 (_1!1627 (tuple2!3233 lt!84945 v!309)) (_2!1627 (tuple2!3233 lt!84945 v!309)))))))

(assert (= (and d!51979 c!30657) b!171449))

(assert (= (and d!51979 (not c!30657)) b!171451))

(assert (= (and b!171451 c!30655) b!171452))

(assert (= (and b!171451 (not c!30655)) b!171454))

(assert (= (and b!171454 c!30656) b!171456))

(assert (= (and b!171454 (not c!30656)) b!171450))

(assert (= (or b!171456 b!171450) bm!17438))

(assert (= (or b!171452 bm!17438) bm!17437))

(assert (= (or b!171449 bm!17437) bm!17439))

(assert (= (and bm!17439 c!30658) b!171448))

(assert (= (and bm!17439 (not c!30658)) b!171453))

(assert (= (and d!51979 res!81455) b!171455))

(assert (= (and b!171455 res!81456) b!171457))

(declare-fun m!199689 () Bool)

(assert (=> b!171448 m!199689))

(declare-fun m!199691 () Bool)

(assert (=> b!171457 m!199691))

(declare-fun m!199693 () Bool)

(assert (=> bm!17439 m!199693))

(declare-fun m!199695 () Bool)

(assert (=> b!171455 m!199695))

(declare-fun m!199697 () Bool)

(assert (=> d!51979 m!199697))

(declare-fun m!199699 () Bool)

(assert (=> d!51979 m!199699))

(assert (=> d!51685 d!51979))

(declare-fun d!51981 () Bool)

(assert (=> d!51981 (= (get!1933 (getValueByKey!182 (toList!1091 lt!84948) lt!84943)) (v!3908 (getValueByKey!182 (toList!1091 lt!84948) lt!84943)))))

(assert (=> d!51695 d!51981))

(declare-fun b!171458 () Bool)

(declare-fun e!113164 () Option!188)

(assert (=> b!171458 (= e!113164 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!84948)))))))

(declare-fun b!171460 () Bool)

(declare-fun e!113165 () Option!188)

(assert (=> b!171460 (= e!113165 (getValueByKey!182 (t!6996 (toList!1091 lt!84948)) lt!84943))))

(declare-fun b!171461 () Bool)

(assert (=> b!171461 (= e!113165 None!186)))

(declare-fun d!51983 () Bool)

(declare-fun c!30659 () Bool)

(assert (=> d!51983 (= c!30659 (and ((_ is Cons!2199) (toList!1091 lt!84948)) (= (_1!1627 (h!2816 (toList!1091 lt!84948))) lt!84943)))))

(assert (=> d!51983 (= (getValueByKey!182 (toList!1091 lt!84948) lt!84943) e!113164)))

(declare-fun b!171459 () Bool)

(assert (=> b!171459 (= e!113164 e!113165)))

(declare-fun c!30660 () Bool)

(assert (=> b!171459 (= c!30660 (and ((_ is Cons!2199) (toList!1091 lt!84948)) (not (= (_1!1627 (h!2816 (toList!1091 lt!84948))) lt!84943))))))

(assert (= (and d!51983 c!30659) b!171458))

(assert (= (and d!51983 (not c!30659)) b!171459))

(assert (= (and b!171459 c!30660) b!171460))

(assert (= (and b!171459 (not c!30660)) b!171461))

(declare-fun m!199701 () Bool)

(assert (=> b!171460 m!199701))

(assert (=> d!51695 d!51983))

(assert (=> d!51691 d!51695))

(assert (=> d!51691 d!51679))

(declare-fun d!51985 () Bool)

(assert (=> d!51985 (= (apply!129 (+!238 lt!84948 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))) lt!84943) (apply!129 lt!84948 lt!84943))))

(assert (=> d!51985 true))

(declare-fun _$34!1048 () Unit!5227)

(assert (=> d!51985 (= (choose!931 lt!84948 lt!84946 (minValue!3397 thiss!1248) lt!84943) _$34!1048)))

(declare-fun bs!7061 () Bool)

(assert (= bs!7061 d!51985))

(assert (=> bs!7061 m!198677))

(assert (=> bs!7061 m!198677))

(assert (=> bs!7061 m!198685))

(assert (=> bs!7061 m!198673))

(assert (=> d!51691 d!51985))

(assert (=> d!51691 d!51703))

(declare-fun d!51987 () Bool)

(declare-fun e!113167 () Bool)

(assert (=> d!51987 e!113167))

(declare-fun res!81457 () Bool)

(assert (=> d!51987 (=> res!81457 e!113167)))

(declare-fun lt!85278 () Bool)

(assert (=> d!51987 (= res!81457 (not lt!85278))))

(declare-fun lt!85276 () Bool)

(assert (=> d!51987 (= lt!85278 lt!85276)))

(declare-fun lt!85275 () Unit!5227)

(declare-fun e!113166 () Unit!5227)

(assert (=> d!51987 (= lt!85275 e!113166)))

(declare-fun c!30661 () Bool)

(assert (=> d!51987 (= c!30661 lt!85276)))

(assert (=> d!51987 (= lt!85276 (containsKey!186 (toList!1091 lt!84948) lt!84943))))

(assert (=> d!51987 (= (contains!1142 lt!84948 lt!84943) lt!85278)))

(declare-fun b!171462 () Bool)

(declare-fun lt!85277 () Unit!5227)

(assert (=> b!171462 (= e!113166 lt!85277)))

(assert (=> b!171462 (= lt!85277 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84948) lt!84943))))

(assert (=> b!171462 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84948) lt!84943))))

(declare-fun b!171463 () Bool)

(declare-fun Unit!5252 () Unit!5227)

(assert (=> b!171463 (= e!113166 Unit!5252)))

(declare-fun b!171464 () Bool)

(assert (=> b!171464 (= e!113167 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84948) lt!84943)))))

(assert (= (and d!51987 c!30661) b!171462))

(assert (= (and d!51987 (not c!30661)) b!171463))

(assert (= (and d!51987 (not res!81457)) b!171464))

(declare-fun m!199703 () Bool)

(assert (=> d!51987 m!199703))

(declare-fun m!199705 () Bool)

(assert (=> b!171462 m!199705))

(assert (=> b!171462 m!198929))

(assert (=> b!171462 m!198929))

(declare-fun m!199707 () Bool)

(assert (=> b!171462 m!199707))

(assert (=> b!171464 m!198929))

(assert (=> b!171464 m!198929))

(assert (=> b!171464 m!199707))

(assert (=> d!51691 d!51987))

(assert (=> b!170911 d!51651))

(declare-fun d!51989 () Bool)

(assert (=> d!51989 (= (isEmpty!437 lt!85031) (isEmpty!439 (toList!1091 lt!85031)))))

(declare-fun bs!7062 () Bool)

(assert (= bs!7062 d!51989))

(declare-fun m!199709 () Bool)

(assert (=> bs!7062 m!199709))

(assert (=> b!170980 d!51989))

(declare-fun d!51991 () Bool)

(assert (=> d!51991 (arrayContainsKey!0 (_keys!5385 lt!84854) lt!85089 #b00000000000000000000000000000000)))

(declare-fun lt!85279 () Unit!5227)

(assert (=> d!51991 (= lt!85279 (choose!13 (_keys!5385 lt!84854) lt!85089 #b00000000000000000000000000000000))))

(assert (=> d!51991 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!51991 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5385 lt!84854) lt!85089 #b00000000000000000000000000000000) lt!85279)))

(declare-fun bs!7063 () Bool)

(assert (= bs!7063 d!51991))

(assert (=> bs!7063 m!199013))

(declare-fun m!199711 () Bool)

(assert (=> bs!7063 m!199711))

(assert (=> b!171065 d!51991))

(declare-fun d!51993 () Bool)

(declare-fun res!81458 () Bool)

(declare-fun e!113168 () Bool)

(assert (=> d!51993 (=> res!81458 e!113168)))

(assert (=> d!51993 (= res!81458 (= (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000) lt!85089))))

(assert (=> d!51993 (= (arrayContainsKey!0 (_keys!5385 lt!84854) lt!85089 #b00000000000000000000000000000000) e!113168)))

(declare-fun b!171465 () Bool)

(declare-fun e!113169 () Bool)

(assert (=> b!171465 (= e!113168 e!113169)))

(declare-fun res!81459 () Bool)

(assert (=> b!171465 (=> (not res!81459) (not e!113169))))

(assert (=> b!171465 (= res!81459 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 lt!84854))))))

(declare-fun b!171466 () Bool)

(assert (=> b!171466 (= e!113169 (arrayContainsKey!0 (_keys!5385 lt!84854) lt!85089 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!51993 (not res!81458)) b!171465))

(assert (= (and b!171465 res!81459) b!171466))

(assert (=> d!51993 m!199007))

(declare-fun m!199713 () Bool)

(assert (=> b!171466 m!199713))

(assert (=> b!171065 d!51993))

(declare-fun b!171467 () Bool)

(declare-fun e!113171 () SeekEntryResult!545)

(assert (=> b!171467 (= e!113171 Undefined!545)))

(declare-fun b!171468 () Bool)

(declare-fun c!30662 () Bool)

(declare-fun lt!85280 () (_ BitVec 64))

(assert (=> b!171468 (= c!30662 (= lt!85280 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!113170 () SeekEntryResult!545)

(declare-fun e!113172 () SeekEntryResult!545)

(assert (=> b!171468 (= e!113170 e!113172)))

(declare-fun d!51995 () Bool)

(declare-fun lt!85281 () SeekEntryResult!545)

(assert (=> d!51995 (and (or ((_ is Undefined!545) lt!85281) (not ((_ is Found!545) lt!85281)) (and (bvsge (index!4349 lt!85281) #b00000000000000000000000000000000) (bvslt (index!4349 lt!85281) (size!3670 (_keys!5385 lt!84854))))) (or ((_ is Undefined!545) lt!85281) ((_ is Found!545) lt!85281) (not ((_ is MissingZero!545) lt!85281)) (and (bvsge (index!4348 lt!85281) #b00000000000000000000000000000000) (bvslt (index!4348 lt!85281) (size!3670 (_keys!5385 lt!84854))))) (or ((_ is Undefined!545) lt!85281) ((_ is Found!545) lt!85281) ((_ is MissingZero!545) lt!85281) (not ((_ is MissingVacant!545) lt!85281)) (and (bvsge (index!4351 lt!85281) #b00000000000000000000000000000000) (bvslt (index!4351 lt!85281) (size!3670 (_keys!5385 lt!84854))))) (or ((_ is Undefined!545) lt!85281) (ite ((_ is Found!545) lt!85281) (= (select (arr!3376 (_keys!5385 lt!84854)) (index!4349 lt!85281)) (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!545) lt!85281) (= (select (arr!3376 (_keys!5385 lt!84854)) (index!4348 lt!85281)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!545) lt!85281) (= (select (arr!3376 (_keys!5385 lt!84854)) (index!4351 lt!85281)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51995 (= lt!85281 e!113171)))

(declare-fun c!30663 () Bool)

(declare-fun lt!85282 () SeekEntryResult!545)

(assert (=> d!51995 (= c!30663 (and ((_ is Intermediate!545) lt!85282) (undefined!1357 lt!85282)))))

(assert (=> d!51995 (= lt!85282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000) (mask!8381 lt!84854)) (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000) (_keys!5385 lt!84854) (mask!8381 lt!84854)))))

(assert (=> d!51995 (validMask!0 (mask!8381 lt!84854))))

(assert (=> d!51995 (= (seekEntryOrOpen!0 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000) (_keys!5385 lt!84854) (mask!8381 lt!84854)) lt!85281)))

(declare-fun b!171469 () Bool)

(assert (=> b!171469 (= e!113172 (seekKeyOrZeroReturnVacant!0 (x!18969 lt!85282) (index!4350 lt!85282) (index!4350 lt!85282) (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000) (_keys!5385 lt!84854) (mask!8381 lt!84854)))))

(declare-fun b!171470 () Bool)

(assert (=> b!171470 (= e!113172 (MissingZero!545 (index!4350 lt!85282)))))

(declare-fun b!171471 () Bool)

(assert (=> b!171471 (= e!113170 (Found!545 (index!4350 lt!85282)))))

(declare-fun b!171472 () Bool)

(assert (=> b!171472 (= e!113171 e!113170)))

(assert (=> b!171472 (= lt!85280 (select (arr!3376 (_keys!5385 lt!84854)) (index!4350 lt!85282)))))

(declare-fun c!30664 () Bool)

(assert (=> b!171472 (= c!30664 (= lt!85280 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(assert (= (and d!51995 c!30663) b!171467))

(assert (= (and d!51995 (not c!30663)) b!171472))

(assert (= (and b!171472 c!30664) b!171471))

(assert (= (and b!171472 (not c!30664)) b!171468))

(assert (= (and b!171468 c!30662) b!171470))

(assert (= (and b!171468 (not c!30662)) b!171469))

(declare-fun m!199715 () Bool)

(assert (=> d!51995 m!199715))

(declare-fun m!199717 () Bool)

(assert (=> d!51995 m!199717))

(declare-fun m!199719 () Bool)

(assert (=> d!51995 m!199719))

(declare-fun m!199721 () Bool)

(assert (=> d!51995 m!199721))

(assert (=> d!51995 m!199007))

(declare-fun m!199723 () Bool)

(assert (=> d!51995 m!199723))

(assert (=> d!51995 m!199085))

(assert (=> d!51995 m!199007))

(assert (=> d!51995 m!199721))

(assert (=> b!171469 m!199007))

(declare-fun m!199725 () Bool)

(assert (=> b!171469 m!199725))

(declare-fun m!199727 () Bool)

(assert (=> b!171472 m!199727))

(assert (=> b!171065 d!51995))

(assert (=> d!51779 d!51911))

(declare-fun d!51997 () Bool)

(assert (=> d!51997 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84987) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85283 () Unit!5227)

(assert (=> d!51997 (= lt!85283 (choose!930 (toList!1091 lt!84987) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!113173 () Bool)

(assert (=> d!51997 e!113173))

(declare-fun res!81460 () Bool)

(assert (=> d!51997 (=> (not res!81460) (not e!113173))))

(assert (=> d!51997 (= res!81460 (isStrictlySorted!326 (toList!1091 lt!84987)))))

(assert (=> d!51997 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84987) #b0000000000000000000000000000000000000000000000000000000000000000) lt!85283)))

(declare-fun b!171473 () Bool)

(assert (=> b!171473 (= e!113173 (containsKey!186 (toList!1091 lt!84987) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!51997 res!81460) b!171473))

(assert (=> d!51997 m!198967))

(assert (=> d!51997 m!198967))

(assert (=> d!51997 m!198969))

(declare-fun m!199729 () Bool)

(assert (=> d!51997 m!199729))

(declare-fun m!199731 () Bool)

(assert (=> d!51997 m!199731))

(assert (=> b!171473 m!198963))

(assert (=> b!171013 d!51997))

(declare-fun d!51999 () Bool)

(assert (=> d!51999 (= (isDefined!136 (getValueByKey!182 (toList!1091 lt!84987) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!438 (getValueByKey!182 (toList!1091 lt!84987) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7064 () Bool)

(assert (= bs!7064 d!51999))

(assert (=> bs!7064 m!198967))

(declare-fun m!199733 () Bool)

(assert (=> bs!7064 m!199733))

(assert (=> b!171013 d!51999))

(assert (=> b!171013 d!51863))

(declare-fun d!52001 () Bool)

(assert (=> d!52001 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84897) (_1!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun lt!85284 () Unit!5227)

(assert (=> d!52001 (= lt!85284 (choose!930 (toList!1091 lt!84897) (_1!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun e!113174 () Bool)

(assert (=> d!52001 e!113174))

(declare-fun res!81461 () Bool)

(assert (=> d!52001 (=> (not res!81461) (not e!113174))))

(assert (=> d!52001 (= res!81461 (isStrictlySorted!326 (toList!1091 lt!84897)))))

(assert (=> d!52001 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84897) (_1!1627 (tuple2!3233 key!828 v!309))) lt!85284)))

(declare-fun b!171474 () Bool)

(assert (=> b!171474 (= e!113174 (containsKey!186 (toList!1091 lt!84897) (_1!1627 (tuple2!3233 key!828 v!309))))))

(assert (= (and d!52001 res!81461) b!171474))

(assert (=> d!52001 m!198639))

(assert (=> d!52001 m!198639))

(assert (=> d!52001 m!198975))

(declare-fun m!199735 () Bool)

(assert (=> d!52001 m!199735))

(declare-fun m!199737 () Bool)

(assert (=> d!52001 m!199737))

(assert (=> b!171474 m!198971))

(assert (=> b!171016 d!52001))

(declare-fun d!52003 () Bool)

(assert (=> d!52003 (= (isDefined!136 (getValueByKey!182 (toList!1091 lt!84897) (_1!1627 (tuple2!3233 key!828 v!309)))) (not (isEmpty!438 (getValueByKey!182 (toList!1091 lt!84897) (_1!1627 (tuple2!3233 key!828 v!309))))))))

(declare-fun bs!7065 () Bool)

(assert (= bs!7065 d!52003))

(assert (=> bs!7065 m!198639))

(declare-fun m!199739 () Bool)

(assert (=> bs!7065 m!199739))

(assert (=> b!171016 d!52003))

(assert (=> b!171016 d!51785))

(declare-fun d!52005 () Bool)

(assert (=> d!52005 (= (get!1933 (getValueByKey!182 (toList!1091 (+!238 lt!84967 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))) lt!84979)) (v!3908 (getValueByKey!182 (toList!1091 (+!238 lt!84967 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))) lt!84979)))))

(assert (=> d!51751 d!52005))

(declare-fun e!113175 () Option!188)

(declare-fun b!171475 () Bool)

(assert (=> b!171475 (= e!113175 (Some!187 (_2!1627 (h!2816 (toList!1091 (+!238 lt!84967 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))))))))

(declare-fun e!113176 () Option!188)

(declare-fun b!171477 () Bool)

(assert (=> b!171477 (= e!113176 (getValueByKey!182 (t!6996 (toList!1091 (+!238 lt!84967 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))) lt!84979))))

(declare-fun b!171478 () Bool)

(assert (=> b!171478 (= e!113176 None!186)))

(declare-fun d!52007 () Bool)

(declare-fun c!30665 () Bool)

(assert (=> d!52007 (= c!30665 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84967 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))) (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84967 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))) lt!84979)))))

(assert (=> d!52007 (= (getValueByKey!182 (toList!1091 (+!238 lt!84967 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))) lt!84979) e!113175)))

(declare-fun b!171476 () Bool)

(assert (=> b!171476 (= e!113175 e!113176)))

(declare-fun c!30666 () Bool)

(assert (=> b!171476 (= c!30666 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84967 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))) (not (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84967 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))) lt!84979))))))

(assert (= (and d!52007 c!30665) b!171475))

(assert (= (and d!52007 (not c!30665)) b!171476))

(assert (= (and b!171476 c!30666) b!171477))

(assert (= (and b!171476 (not c!30666)) b!171478))

(declare-fun m!199741 () Bool)

(assert (=> b!171477 m!199741))

(assert (=> d!51751 d!52007))

(declare-fun d!52009 () Bool)

(assert (=> d!52009 (= (isDefined!136 (getValueByKey!182 (toList!1091 lt!84987) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!438 (getValueByKey!182 (toList!1091 lt!84987) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7066 () Bool)

(assert (= bs!7066 d!52009))

(assert (=> bs!7066 m!198819))

(declare-fun m!199743 () Bool)

(assert (=> bs!7066 m!199743))

(assert (=> b!171012 d!52009))

(declare-fun b!171479 () Bool)

(declare-fun e!113177 () Option!188)

(assert (=> b!171479 (= e!113177 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!84987)))))))

(declare-fun b!171481 () Bool)

(declare-fun e!113178 () Option!188)

(assert (=> b!171481 (= e!113178 (getValueByKey!182 (t!6996 (toList!1091 lt!84987)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171482 () Bool)

(assert (=> b!171482 (= e!113178 None!186)))

(declare-fun d!52011 () Bool)

(declare-fun c!30667 () Bool)

(assert (=> d!52011 (= c!30667 (and ((_ is Cons!2199) (toList!1091 lt!84987)) (= (_1!1627 (h!2816 (toList!1091 lt!84987))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52011 (= (getValueByKey!182 (toList!1091 lt!84987) #b1000000000000000000000000000000000000000000000000000000000000000) e!113177)))

(declare-fun b!171480 () Bool)

(assert (=> b!171480 (= e!113177 e!113178)))

(declare-fun c!30668 () Bool)

(assert (=> b!171480 (= c!30668 (and ((_ is Cons!2199) (toList!1091 lt!84987)) (not (= (_1!1627 (h!2816 (toList!1091 lt!84987))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!52011 c!30667) b!171479))

(assert (= (and d!52011 (not c!30667)) b!171480))

(assert (= (and b!171480 c!30668) b!171481))

(assert (= (and b!171480 (not c!30668)) b!171482))

(declare-fun m!199745 () Bool)

(assert (=> b!171481 m!199745))

(assert (=> b!171012 d!52011))

(declare-fun d!52013 () Bool)

(assert (=> d!52013 (= (get!1933 (getValueByKey!182 (toList!1091 lt!84942) lt!84954)) (v!3908 (getValueByKey!182 (toList!1091 lt!84942) lt!84954)))))

(assert (=> d!51681 d!52013))

(declare-fun b!171483 () Bool)

(declare-fun e!113179 () Option!188)

(assert (=> b!171483 (= e!113179 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!84942)))))))

(declare-fun b!171485 () Bool)

(declare-fun e!113180 () Option!188)

(assert (=> b!171485 (= e!113180 (getValueByKey!182 (t!6996 (toList!1091 lt!84942)) lt!84954))))

(declare-fun b!171486 () Bool)

(assert (=> b!171486 (= e!113180 None!186)))

(declare-fun d!52015 () Bool)

(declare-fun c!30669 () Bool)

(assert (=> d!52015 (= c!30669 (and ((_ is Cons!2199) (toList!1091 lt!84942)) (= (_1!1627 (h!2816 (toList!1091 lt!84942))) lt!84954)))))

(assert (=> d!52015 (= (getValueByKey!182 (toList!1091 lt!84942) lt!84954) e!113179)))

(declare-fun b!171484 () Bool)

(assert (=> b!171484 (= e!113179 e!113180)))

(declare-fun c!30670 () Bool)

(assert (=> b!171484 (= c!30670 (and ((_ is Cons!2199) (toList!1091 lt!84942)) (not (= (_1!1627 (h!2816 (toList!1091 lt!84942))) lt!84954))))))

(assert (= (and d!52015 c!30669) b!171483))

(assert (= (and d!52015 (not c!30669)) b!171484))

(assert (= (and b!171484 c!30670) b!171485))

(assert (= (and b!171484 (not c!30670)) b!171486))

(declare-fun m!199747 () Bool)

(assert (=> b!171485 m!199747))

(assert (=> d!51681 d!52015))

(declare-fun b!171487 () Bool)

(declare-fun e!113181 () Option!188)

(assert (=> b!171487 (= e!113181 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!85120)))))))

(declare-fun e!113182 () Option!188)

(declare-fun b!171489 () Bool)

(assert (=> b!171489 (= e!113182 (getValueByKey!182 (t!6996 (toList!1091 lt!85120)) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))

(declare-fun b!171490 () Bool)

(assert (=> b!171490 (= e!113182 None!186)))

(declare-fun c!30671 () Bool)

(declare-fun d!52017 () Bool)

(assert (=> d!52017 (= c!30671 (and ((_ is Cons!2199) (toList!1091 lt!85120)) (= (_1!1627 (h!2816 (toList!1091 lt!85120))) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))))))

(assert (=> d!52017 (= (getValueByKey!182 (toList!1091 lt!85120) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))) e!113181)))

(declare-fun b!171488 () Bool)

(assert (=> b!171488 (= e!113181 e!113182)))

(declare-fun c!30672 () Bool)

(assert (=> b!171488 (= c!30672 (and ((_ is Cons!2199) (toList!1091 lt!85120)) (not (= (_1!1627 (h!2816 (toList!1091 lt!85120))) (_1!1627 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52017 c!30671) b!171487))

(assert (= (and d!52017 (not c!30671)) b!171488))

(assert (= (and b!171488 c!30672) b!171489))

(assert (= (and b!171488 (not c!30672)) b!171490))

(declare-fun m!199749 () Bool)

(assert (=> b!171489 m!199749))

(assert (=> b!171121 d!52017))

(declare-fun d!52019 () Bool)

(declare-fun res!81462 () Bool)

(declare-fun e!113183 () Bool)

(assert (=> d!52019 (=> res!81462 e!113183)))

(assert (=> d!52019 (= res!81462 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309)))) (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))))) lt!84949)))))

(assert (=> d!52019 (= (containsKey!186 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))) lt!84949) e!113183)))

(declare-fun b!171491 () Bool)

(declare-fun e!113184 () Bool)

(assert (=> b!171491 (= e!113183 e!113184)))

(declare-fun res!81463 () Bool)

(assert (=> b!171491 (=> (not res!81463) (not e!113184))))

(assert (=> b!171491 (= res!81463 (and (or (not ((_ is Cons!2199) (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))))) (bvsle (_1!1627 (h!2816 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))))) lt!84949)) ((_ is Cons!2199) (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309)))) (bvslt (_1!1627 (h!2816 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309))))) lt!84949)))))

(declare-fun b!171492 () Bool)

(assert (=> b!171492 (= e!113184 (containsKey!186 (t!6996 (toList!1091 (+!238 lt!84960 (tuple2!3233 lt!84945 v!309)))) lt!84949))))

(assert (= (and d!52019 (not res!81462)) b!171491))

(assert (= (and b!171491 res!81463) b!171492))

(declare-fun m!199751 () Bool)

(assert (=> b!171492 m!199751))

(assert (=> d!51689 d!52019))

(declare-fun d!52021 () Bool)

(declare-fun lt!85285 () Bool)

(assert (=> d!52021 (= lt!85285 (select (content!147 lt!85099) (tuple2!3233 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!113186 () Bool)

(assert (=> d!52021 (= lt!85285 e!113186)))

(declare-fun res!81464 () Bool)

(assert (=> d!52021 (=> (not res!81464) (not e!113186))))

(assert (=> d!52021 (= res!81464 ((_ is Cons!2199) lt!85099))))

(assert (=> d!52021 (= (contains!1144 lt!85099 (tuple2!3233 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!85285)))

(declare-fun b!171493 () Bool)

(declare-fun e!113185 () Bool)

(assert (=> b!171493 (= e!113186 e!113185)))

(declare-fun res!81465 () Bool)

(assert (=> b!171493 (=> res!81465 e!113185)))

(assert (=> b!171493 (= res!81465 (= (h!2816 lt!85099) (tuple2!3233 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171494 () Bool)

(assert (=> b!171494 (= e!113185 (contains!1144 (t!6996 lt!85099) (tuple2!3233 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52021 res!81464) b!171493))

(assert (= (and b!171493 (not res!81465)) b!171494))

(declare-fun m!199753 () Bool)

(assert (=> d!52021 m!199753))

(declare-fun m!199755 () Bool)

(assert (=> d!52021 m!199755))

(declare-fun m!199757 () Bool)

(assert (=> b!171494 m!199757))

(assert (=> b!171086 d!52021))

(declare-fun b!171495 () Bool)

(declare-fun e!113187 () Option!188)

(assert (=> b!171495 (= e!113187 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!85048)))))))

(declare-fun e!113188 () Option!188)

(declare-fun b!171497 () Bool)

(assert (=> b!171497 (= e!113188 (getValueByKey!182 (t!6996 (toList!1091 lt!85048)) (_1!1627 (tuple2!3233 lt!84945 v!309))))))

(declare-fun b!171498 () Bool)

(assert (=> b!171498 (= e!113188 None!186)))

(declare-fun c!30673 () Bool)

(declare-fun d!52023 () Bool)

(assert (=> d!52023 (= c!30673 (and ((_ is Cons!2199) (toList!1091 lt!85048)) (= (_1!1627 (h!2816 (toList!1091 lt!85048))) (_1!1627 (tuple2!3233 lt!84945 v!309)))))))

(assert (=> d!52023 (= (getValueByKey!182 (toList!1091 lt!85048) (_1!1627 (tuple2!3233 lt!84945 v!309))) e!113187)))

(declare-fun b!171496 () Bool)

(assert (=> b!171496 (= e!113187 e!113188)))

(declare-fun c!30674 () Bool)

(assert (=> b!171496 (= c!30674 (and ((_ is Cons!2199) (toList!1091 lt!85048)) (not (= (_1!1627 (h!2816 (toList!1091 lt!85048))) (_1!1627 (tuple2!3233 lt!84945 v!309))))))))

(assert (= (and d!52023 c!30673) b!171495))

(assert (= (and d!52023 (not c!30673)) b!171496))

(assert (= (and b!171496 c!30674) b!171497))

(assert (= (and b!171496 (not c!30674)) b!171498))

(declare-fun m!199759 () Bool)

(assert (=> b!171497 m!199759))

(assert (=> b!170999 d!52023))

(declare-fun d!52025 () Bool)

(declare-fun e!113190 () Bool)

(assert (=> d!52025 e!113190))

(declare-fun res!81466 () Bool)

(assert (=> d!52025 (=> res!81466 e!113190)))

(declare-fun lt!85289 () Bool)

(assert (=> d!52025 (= res!81466 (not lt!85289))))

(declare-fun lt!85287 () Bool)

(assert (=> d!52025 (= lt!85289 lt!85287)))

(declare-fun lt!85286 () Unit!5227)

(declare-fun e!113189 () Unit!5227)

(assert (=> d!52025 (= lt!85286 e!113189)))

(declare-fun c!30675 () Bool)

(assert (=> d!52025 (= c!30675 lt!85287)))

(assert (=> d!52025 (= lt!85287 (containsKey!186 (toList!1091 lt!85162) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52025 (= (contains!1142 lt!85162 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85289)))

(declare-fun b!171499 () Bool)

(declare-fun lt!85288 () Unit!5227)

(assert (=> b!171499 (= e!113189 lt!85288)))

(assert (=> b!171499 (= lt!85288 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85162) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171499 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85162) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171500 () Bool)

(declare-fun Unit!5253 () Unit!5227)

(assert (=> b!171500 (= e!113189 Unit!5253)))

(declare-fun b!171501 () Bool)

(assert (=> b!171501 (= e!113190 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52025 c!30675) b!171499))

(assert (= (and d!52025 (not c!30675)) b!171500))

(assert (= (and d!52025 (not res!81466)) b!171501))

(declare-fun m!199761 () Bool)

(assert (=> d!52025 m!199761))

(declare-fun m!199763 () Bool)

(assert (=> b!171499 m!199763))

(declare-fun m!199765 () Bool)

(assert (=> b!171499 m!199765))

(assert (=> b!171499 m!199765))

(declare-fun m!199767 () Bool)

(assert (=> b!171499 m!199767))

(assert (=> b!171501 m!199765))

(assert (=> b!171501 m!199765))

(assert (=> b!171501 m!199767))

(assert (=> bm!17420 d!52025))

(assert (=> b!171088 d!51803))

(declare-fun d!52027 () Bool)

(assert (=> d!52027 (= (isDefined!136 (getValueByKey!182 (toList!1091 lt!84962) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!438 (getValueByKey!182 (toList!1091 lt!84962) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7067 () Bool)

(assert (= bs!7067 d!52027))

(assert (=> bs!7067 m!198787))

(declare-fun m!199769 () Bool)

(assert (=> bs!7067 m!199769))

(assert (=> b!170894 d!52027))

(declare-fun b!171502 () Bool)

(declare-fun e!113191 () Option!188)

(assert (=> b!171502 (= e!113191 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!84962)))))))

(declare-fun b!171504 () Bool)

(declare-fun e!113192 () Option!188)

(assert (=> b!171504 (= e!113192 (getValueByKey!182 (t!6996 (toList!1091 lt!84962)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171505 () Bool)

(assert (=> b!171505 (= e!113192 None!186)))

(declare-fun d!52029 () Bool)

(declare-fun c!30676 () Bool)

(assert (=> d!52029 (= c!30676 (and ((_ is Cons!2199) (toList!1091 lt!84962)) (= (_1!1627 (h!2816 (toList!1091 lt!84962))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52029 (= (getValueByKey!182 (toList!1091 lt!84962) #b0000000000000000000000000000000000000000000000000000000000000000) e!113191)))

(declare-fun b!171503 () Bool)

(assert (=> b!171503 (= e!113191 e!113192)))

(declare-fun c!30677 () Bool)

(assert (=> b!171503 (= c!30677 (and ((_ is Cons!2199) (toList!1091 lt!84962)) (not (= (_1!1627 (h!2816 (toList!1091 lt!84962))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!52029 c!30676) b!171502))

(assert (= (and d!52029 (not c!30676)) b!171503))

(assert (= (and b!171503 c!30677) b!171504))

(assert (= (and b!171503 (not c!30677)) b!171505))

(declare-fun m!199771 () Bool)

(assert (=> b!171504 m!199771))

(assert (=> b!170894 d!52029))

(declare-fun d!52031 () Bool)

(assert (=> d!52031 (= (apply!129 (+!238 lt!84973 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))) lt!84968) (apply!129 lt!84973 lt!84968))))

(assert (=> d!52031 true))

(declare-fun _$34!1049 () Unit!5227)

(assert (=> d!52031 (= (choose!931 lt!84973 lt!84971 (minValue!3397 thiss!1248) lt!84968) _$34!1049)))

(declare-fun bs!7068 () Bool)

(assert (= bs!7068 d!52031))

(assert (=> bs!7068 m!198735))

(assert (=> bs!7068 m!198735))

(assert (=> bs!7068 m!198743))

(assert (=> bs!7068 m!198731))

(assert (=> d!51765 d!52031))

(declare-fun d!52033 () Bool)

(declare-fun e!113194 () Bool)

(assert (=> d!52033 e!113194))

(declare-fun res!81467 () Bool)

(assert (=> d!52033 (=> res!81467 e!113194)))

(declare-fun lt!85293 () Bool)

(assert (=> d!52033 (= res!81467 (not lt!85293))))

(declare-fun lt!85291 () Bool)

(assert (=> d!52033 (= lt!85293 lt!85291)))

(declare-fun lt!85290 () Unit!5227)

(declare-fun e!113193 () Unit!5227)

(assert (=> d!52033 (= lt!85290 e!113193)))

(declare-fun c!30678 () Bool)

(assert (=> d!52033 (= c!30678 lt!85291)))

(assert (=> d!52033 (= lt!85291 (containsKey!186 (toList!1091 lt!84973) lt!84968))))

(assert (=> d!52033 (= (contains!1142 lt!84973 lt!84968) lt!85293)))

(declare-fun b!171506 () Bool)

(declare-fun lt!85292 () Unit!5227)

(assert (=> b!171506 (= e!113193 lt!85292)))

(assert (=> b!171506 (= lt!85292 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84973) lt!84968))))

(assert (=> b!171506 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84973) lt!84968))))

(declare-fun b!171507 () Bool)

(declare-fun Unit!5254 () Unit!5227)

(assert (=> b!171507 (= e!113193 Unit!5254)))

(declare-fun b!171508 () Bool)

(assert (=> b!171508 (= e!113194 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84973) lt!84968)))))

(assert (= (and d!52033 c!30678) b!171506))

(assert (= (and d!52033 (not c!30678)) b!171507))

(assert (= (and d!52033 (not res!81467)) b!171508))

(declare-fun m!199773 () Bool)

(assert (=> d!52033 m!199773))

(declare-fun m!199775 () Bool)

(assert (=> b!171506 m!199775))

(assert (=> b!171506 m!199149))

(assert (=> b!171506 m!199149))

(declare-fun m!199777 () Bool)

(assert (=> b!171506 m!199777))

(assert (=> b!171508 m!199149))

(assert (=> b!171508 m!199149))

(assert (=> b!171508 m!199777))

(assert (=> d!51765 d!52033))

(assert (=> d!51765 d!51755))

(assert (=> d!51765 d!51757))

(assert (=> d!51765 d!51759))

(assert (=> b!171095 d!51651))

(declare-fun d!52035 () Bool)

(assert (=> d!52035 (isDefined!136 (getValueByKey!182 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) lt!84974))))

(declare-fun lt!85294 () Unit!5227)

(assert (=> d!52035 (= lt!85294 (choose!930 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) lt!84974))))

(declare-fun e!113195 () Bool)

(assert (=> d!52035 e!113195))

(declare-fun res!81468 () Bool)

(assert (=> d!52035 (=> (not res!81468) (not e!113195))))

(assert (=> d!52035 (= res!81468 (isStrictlySorted!326 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))))))

(assert (=> d!52035 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) lt!84974) lt!85294)))

(declare-fun b!171509 () Bool)

(assert (=> b!171509 (= e!113195 (containsKey!186 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) lt!84974))))

(assert (= (and d!52035 res!81468) b!171509))

(assert (=> d!52035 m!199181))

(assert (=> d!52035 m!199181))

(assert (=> d!52035 m!199183))

(declare-fun m!199779 () Bool)

(assert (=> d!52035 m!199779))

(declare-fun m!199781 () Bool)

(assert (=> d!52035 m!199781))

(assert (=> b!171509 m!199177))

(assert (=> b!171127 d!52035))

(declare-fun d!52037 () Bool)

(assert (=> d!52037 (= (isDefined!136 (getValueByKey!182 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) lt!84974)) (not (isEmpty!438 (getValueByKey!182 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) lt!84974))))))

(declare-fun bs!7069 () Bool)

(assert (= bs!7069 d!52037))

(assert (=> bs!7069 m!199181))

(declare-fun m!199783 () Bool)

(assert (=> bs!7069 m!199783))

(assert (=> b!171127 d!52037))

(declare-fun b!171510 () Bool)

(declare-fun e!113196 () Option!188)

(assert (=> b!171510 (= e!113196 (Some!187 (_2!1627 (h!2816 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))))))))

(declare-fun e!113197 () Option!188)

(declare-fun b!171512 () Bool)

(assert (=> b!171512 (= e!113197 (getValueByKey!182 (t!6996 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))) lt!84974))))

(declare-fun b!171513 () Bool)

(assert (=> b!171513 (= e!113197 None!186)))

(declare-fun d!52039 () Bool)

(declare-fun c!30679 () Bool)

(assert (=> d!52039 (= c!30679 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))) (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))) lt!84974)))))

(assert (=> d!52039 (= (getValueByKey!182 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) lt!84974) e!113196)))

(declare-fun b!171511 () Bool)

(assert (=> b!171511 (= e!113196 e!113197)))

(declare-fun c!30680 () Bool)

(assert (=> b!171511 (= c!30680 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))) (not (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))) lt!84974))))))

(assert (= (and d!52039 c!30679) b!171510))

(assert (= (and d!52039 (not c!30679)) b!171511))

(assert (= (and b!171511 c!30680) b!171512))

(assert (= (and b!171511 (not c!30680)) b!171513))

(declare-fun m!199785 () Bool)

(assert (=> b!171512 m!199785))

(assert (=> b!171127 d!52039))

(declare-fun d!52041 () Bool)

(assert (=> d!52041 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84962) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!85295 () Unit!5227)

(assert (=> d!52041 (= lt!85295 (choose!930 (toList!1091 lt!84962) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!113198 () Bool)

(assert (=> d!52041 e!113198))

(declare-fun res!81469 () Bool)

(assert (=> d!52041 (=> (not res!81469) (not e!113198))))

(assert (=> d!52041 (= res!81469 (isStrictlySorted!326 (toList!1091 lt!84962)))))

(assert (=> d!52041 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84962) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) lt!85295)))

(declare-fun b!171514 () Bool)

(assert (=> b!171514 (= e!113198 (containsKey!186 (toList!1091 lt!84962) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52041 res!81469) b!171514))

(assert (=> d!52041 m!198643))

(assert (=> d!52041 m!198807))

(assert (=> d!52041 m!198807))

(assert (=> d!52041 m!199191))

(assert (=> d!52041 m!198643))

(declare-fun m!199787 () Bool)

(assert (=> d!52041 m!199787))

(assert (=> d!52041 m!199657))

(assert (=> b!171514 m!198643))

(assert (=> b!171514 m!199187))

(assert (=> b!171142 d!52041))

(declare-fun d!52043 () Bool)

(assert (=> d!52043 (= (isDefined!136 (getValueByKey!182 (toList!1091 lt!84962) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!438 (getValueByKey!182 (toList!1091 lt!84962) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7070 () Bool)

(assert (= bs!7070 d!52043))

(assert (=> bs!7070 m!198807))

(declare-fun m!199789 () Bool)

(assert (=> bs!7070 m!199789))

(assert (=> b!171142 d!52043))

(assert (=> b!171142 d!51951))

(declare-fun lt!85296 () Bool)

(declare-fun d!52045 () Bool)

(assert (=> d!52045 (= lt!85296 (select (content!147 (toList!1091 lt!85052)) (tuple2!3233 lt!84944 v!309)))))

(declare-fun e!113200 () Bool)

(assert (=> d!52045 (= lt!85296 e!113200)))

(declare-fun res!81470 () Bool)

(assert (=> d!52045 (=> (not res!81470) (not e!113200))))

(assert (=> d!52045 (= res!81470 ((_ is Cons!2199) (toList!1091 lt!85052)))))

(assert (=> d!52045 (= (contains!1144 (toList!1091 lt!85052) (tuple2!3233 lt!84944 v!309)) lt!85296)))

(declare-fun b!171515 () Bool)

(declare-fun e!113199 () Bool)

(assert (=> b!171515 (= e!113200 e!113199)))

(declare-fun res!81471 () Bool)

(assert (=> b!171515 (=> res!81471 e!113199)))

(assert (=> b!171515 (= res!81471 (= (h!2816 (toList!1091 lt!85052)) (tuple2!3233 lt!84944 v!309)))))

(declare-fun b!171516 () Bool)

(assert (=> b!171516 (= e!113199 (contains!1144 (t!6996 (toList!1091 lt!85052)) (tuple2!3233 lt!84944 v!309)))))

(assert (= (and d!52045 res!81470) b!171515))

(assert (= (and b!171515 (not res!81471)) b!171516))

(declare-fun m!199791 () Bool)

(assert (=> d!52045 m!199791))

(declare-fun m!199793 () Bool)

(assert (=> d!52045 m!199793))

(declare-fun m!199795 () Bool)

(assert (=> b!171516 m!199795))

(assert (=> b!171002 d!52045))

(assert (=> b!171097 d!51651))

(declare-fun d!52047 () Bool)

(declare-fun res!81472 () Bool)

(declare-fun e!113201 () Bool)

(assert (=> d!52047 (=> res!81472 e!113201)))

(assert (=> d!52047 (= res!81472 (and ((_ is Cons!2199) (toList!1091 lt!84962)) (= (_1!1627 (h!2816 (toList!1091 lt!84962))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52047 (= (containsKey!186 (toList!1091 lt!84962) #b1000000000000000000000000000000000000000000000000000000000000000) e!113201)))

(declare-fun b!171517 () Bool)

(declare-fun e!113202 () Bool)

(assert (=> b!171517 (= e!113201 e!113202)))

(declare-fun res!81473 () Bool)

(assert (=> b!171517 (=> (not res!81473) (not e!113202))))

(assert (=> b!171517 (= res!81473 (and (or (not ((_ is Cons!2199) (toList!1091 lt!84962))) (bvsle (_1!1627 (h!2816 (toList!1091 lt!84962))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2199) (toList!1091 lt!84962)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84962))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171518 () Bool)

(assert (=> b!171518 (= e!113202 (containsKey!186 (t!6996 (toList!1091 lt!84962)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52047 (not res!81472)) b!171517))

(assert (= (and b!171517 res!81473) b!171518))

(declare-fun m!199797 () Bool)

(assert (=> b!171518 m!199797))

(assert (=> d!51717 d!52047))

(declare-fun d!52049 () Bool)

(declare-fun lt!85297 () Bool)

(assert (=> d!52049 (= lt!85297 (select (content!147 (toList!1091 lt!85168)) (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun e!113204 () Bool)

(assert (=> d!52049 (= lt!85297 e!113204)))

(declare-fun res!81474 () Bool)

(assert (=> d!52049 (=> (not res!81474) (not e!113204))))

(assert (=> d!52049 (= res!81474 ((_ is Cons!2199) (toList!1091 lt!85168)))))

(assert (=> d!52049 (= (contains!1144 (toList!1091 lt!85168) (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85297)))

(declare-fun b!171519 () Bool)

(declare-fun e!113203 () Bool)

(assert (=> b!171519 (= e!113204 e!113203)))

(declare-fun res!81475 () Bool)

(assert (=> b!171519 (=> res!81475 e!113203)))

(assert (=> b!171519 (= res!81475 (= (h!2816 (toList!1091 lt!85168)) (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171520 () Bool)

(assert (=> b!171520 (= e!113203 (contains!1144 (t!6996 (toList!1091 lt!85168)) (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (= (and d!52049 res!81474) b!171519))

(assert (= (and b!171519 (not res!81475)) b!171520))

(declare-fun m!199799 () Bool)

(assert (=> d!52049 m!199799))

(declare-fun m!199801 () Bool)

(assert (=> d!52049 m!199801))

(declare-fun m!199803 () Bool)

(assert (=> b!171520 m!199803))

(assert (=> b!171181 d!52049))

(declare-fun d!52051 () Bool)

(assert (=> d!52051 (= (get!1933 (getValueByKey!182 (toList!1091 (+!238 lt!84948 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))) lt!84943)) (v!3908 (getValueByKey!182 (toList!1091 (+!238 lt!84948 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))) lt!84943)))))

(assert (=> d!51703 d!52051))

(declare-fun b!171521 () Bool)

(declare-fun e!113205 () Option!188)

(assert (=> b!171521 (= e!113205 (Some!187 (_2!1627 (h!2816 (toList!1091 (+!238 lt!84948 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))))))))

(declare-fun b!171523 () Bool)

(declare-fun e!113206 () Option!188)

(assert (=> b!171523 (= e!113206 (getValueByKey!182 (t!6996 (toList!1091 (+!238 lt!84948 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))) lt!84943))))

(declare-fun b!171524 () Bool)

(assert (=> b!171524 (= e!113206 None!186)))

(declare-fun d!52053 () Bool)

(declare-fun c!30681 () Bool)

(assert (=> d!52053 (= c!30681 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84948 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))) (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84948 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))) lt!84943)))))

(assert (=> d!52053 (= (getValueByKey!182 (toList!1091 (+!238 lt!84948 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))) lt!84943) e!113205)))

(declare-fun b!171522 () Bool)

(assert (=> b!171522 (= e!113205 e!113206)))

(declare-fun c!30682 () Bool)

(assert (=> b!171522 (= c!30682 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84948 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))) (not (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84948 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))) lt!84943))))))

(assert (= (and d!52053 c!30681) b!171521))

(assert (= (and d!52053 (not c!30681)) b!171522))

(assert (= (and b!171522 c!30682) b!171523))

(assert (= (and b!171522 (not c!30682)) b!171524))

(declare-fun m!199805 () Bool)

(assert (=> b!171523 m!199805))

(assert (=> d!51703 d!52053))

(declare-fun d!52055 () Bool)

(declare-fun lt!85298 () Bool)

(assert (=> d!52055 (= lt!85298 (select (content!147 (toList!1091 lt!85141)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(declare-fun e!113208 () Bool)

(assert (=> d!52055 (= lt!85298 e!113208)))

(declare-fun res!81476 () Bool)

(assert (=> d!52055 (=> (not res!81476) (not e!113208))))

(assert (=> d!52055 (= res!81476 ((_ is Cons!2199) (toList!1091 lt!85141)))))

(assert (=> d!52055 (= (contains!1144 (toList!1091 lt!85141) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) lt!85298)))

(declare-fun b!171525 () Bool)

(declare-fun e!113207 () Bool)

(assert (=> b!171525 (= e!113208 e!113207)))

(declare-fun res!81477 () Bool)

(assert (=> b!171525 (=> res!81477 e!113207)))

(assert (=> b!171525 (= res!81477 (= (h!2816 (toList!1091 lt!85141)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(declare-fun b!171526 () Bool)

(assert (=> b!171526 (= e!113207 (contains!1144 (t!6996 (toList!1091 lt!85141)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(assert (= (and d!52055 res!81476) b!171525))

(assert (= (and b!171525 (not res!81477)) b!171526))

(declare-fun m!199807 () Bool)

(assert (=> d!52055 m!199807))

(declare-fun m!199809 () Bool)

(assert (=> d!52055 m!199809))

(declare-fun m!199811 () Bool)

(assert (=> b!171526 m!199811))

(assert (=> b!171146 d!52055))

(declare-fun b!171527 () Bool)

(declare-fun e!113209 () Option!188)

(assert (=> b!171527 (= e!113209 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!85061)))))))

(declare-fun b!171529 () Bool)

(declare-fun e!113210 () Option!188)

(assert (=> b!171529 (= e!113210 (getValueByKey!182 (t!6996 (toList!1091 lt!85061)) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))

(declare-fun b!171530 () Bool)

(assert (=> b!171530 (= e!113210 None!186)))

(declare-fun d!52057 () Bool)

(declare-fun c!30683 () Bool)

(assert (=> d!52057 (= c!30683 (and ((_ is Cons!2199) (toList!1091 lt!85061)) (= (_1!1627 (h!2816 (toList!1091 lt!85061))) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))))))

(assert (=> d!52057 (= (getValueByKey!182 (toList!1091 lt!85061) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))) e!113209)))

(declare-fun b!171528 () Bool)

(assert (=> b!171528 (= e!113209 e!113210)))

(declare-fun c!30684 () Bool)

(assert (=> b!171528 (= c!30684 (and ((_ is Cons!2199) (toList!1091 lt!85061)) (not (= (_1!1627 (h!2816 (toList!1091 lt!85061))) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52057 c!30683) b!171527))

(assert (= (and d!52057 (not c!30683)) b!171528))

(assert (= (and b!171528 c!30684) b!171529))

(assert (= (and b!171528 (not c!30684)) b!171530))

(declare-fun m!199813 () Bool)

(assert (=> b!171529 m!199813))

(assert (=> b!171007 d!52057))

(declare-fun b!171531 () Bool)

(declare-fun e!113212 () (_ BitVec 32))

(assert (=> b!171531 (= e!113212 #b00000000000000000000000000000000)))

(declare-fun b!171532 () Bool)

(declare-fun e!113211 () (_ BitVec 32))

(declare-fun call!17443 () (_ BitVec 32))

(assert (=> b!171532 (= e!113211 call!17443)))

(declare-fun b!171533 () Bool)

(assert (=> b!171533 (= e!113212 e!113211)))

(declare-fun c!30686 () Bool)

(assert (=> b!171533 (= c!30686 (validKeyInArray!0 (select (arr!3376 (_keys!5385 lt!84854)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!52059 () Bool)

(declare-fun lt!85299 () (_ BitVec 32))

(assert (=> d!52059 (and (bvsge lt!85299 #b00000000000000000000000000000000) (bvsle lt!85299 (bvsub (size!3670 (_keys!5385 lt!84854)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!52059 (= lt!85299 e!113212)))

(declare-fun c!30685 () Bool)

(assert (=> d!52059 (= c!30685 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 lt!84854))))))

(assert (=> d!52059 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 lt!84854))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!3670 (_keys!5385 lt!84854)) (size!3670 (_keys!5385 lt!84854))))))

(assert (=> d!52059 (= (arrayCountValidKeys!0 (_keys!5385 lt!84854) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 lt!84854))) lt!85299)))

(declare-fun bm!17440 () Bool)

(assert (=> bm!17440 (= call!17443 (arrayCountValidKeys!0 (_keys!5385 lt!84854) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!3670 (_keys!5385 lt!84854))))))

(declare-fun b!171534 () Bool)

(assert (=> b!171534 (= e!113211 (bvadd #b00000000000000000000000000000001 call!17443))))

(assert (= (and d!52059 c!30685) b!171531))

(assert (= (and d!52059 (not c!30685)) b!171533))

(assert (= (and b!171533 c!30686) b!171534))

(assert (= (and b!171533 (not c!30686)) b!171532))

(assert (= (or b!171534 b!171532) bm!17440))

(assert (=> b!171533 m!199467))

(assert (=> b!171533 m!199467))

(assert (=> b!171533 m!199469))

(declare-fun m!199815 () Bool)

(assert (=> bm!17440 m!199815))

(assert (=> bm!17417 d!52059))

(declare-fun d!52061 () Bool)

(declare-fun res!81478 () Bool)

(declare-fun e!113213 () Bool)

(assert (=> d!52061 (=> res!81478 e!113213)))

(assert (=> d!52061 (= res!81478 (and ((_ is Cons!2199) lt!84990) (= (_1!1627 (h!2816 lt!84990)) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52061 (= (containsKey!186 lt!84990 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113213)))

(declare-fun b!171535 () Bool)

(declare-fun e!113214 () Bool)

(assert (=> b!171535 (= e!113213 e!113214)))

(declare-fun res!81479 () Bool)

(assert (=> b!171535 (=> (not res!81479) (not e!113214))))

(assert (=> b!171535 (= res!81479 (and (or (not ((_ is Cons!2199) lt!84990)) (bvsle (_1!1627 (h!2816 lt!84990)) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2199) lt!84990) (bvslt (_1!1627 (h!2816 lt!84990)) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171536 () Bool)

(assert (=> b!171536 (= e!113214 (containsKey!186 (t!6996 lt!84990) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52061 (not res!81478)) b!171535))

(assert (= (and b!171535 res!81479) b!171536))

(declare-fun m!199817 () Bool)

(assert (=> b!171536 m!199817))

(assert (=> b!171075 d!52061))

(declare-fun lt!85300 () Bool)

(declare-fun d!52063 () Bool)

(assert (=> d!52063 (= lt!85300 (select (content!147 (toList!1091 lt!85043)) (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))))

(declare-fun e!113216 () Bool)

(assert (=> d!52063 (= lt!85300 e!113216)))

(declare-fun res!81480 () Bool)

(assert (=> d!52063 (=> (not res!81480) (not e!113216))))

(assert (=> d!52063 (= res!81480 ((_ is Cons!2199) (toList!1091 lt!85043)))))

(assert (=> d!52063 (= (contains!1144 (toList!1091 lt!85043) (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))) lt!85300)))

(declare-fun b!171537 () Bool)

(declare-fun e!113215 () Bool)

(assert (=> b!171537 (= e!113216 e!113215)))

(declare-fun res!81481 () Bool)

(assert (=> b!171537 (=> res!81481 e!113215)))

(assert (=> b!171537 (= res!81481 (= (h!2816 (toList!1091 lt!85043)) (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))))

(declare-fun b!171538 () Bool)

(assert (=> b!171538 (= e!113215 (contains!1144 (t!6996 (toList!1091 lt!85043)) (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))))

(assert (= (and d!52063 res!81480) b!171537))

(assert (= (and b!171537 (not res!81481)) b!171538))

(declare-fun m!199819 () Bool)

(assert (=> d!52063 m!199819))

(declare-fun m!199821 () Bool)

(assert (=> d!52063 m!199821))

(declare-fun m!199823 () Bool)

(assert (=> b!171538 m!199823))

(assert (=> b!170997 d!52063))

(declare-fun d!52065 () Bool)

(assert (=> d!52065 (= (apply!129 (+!238 lt!84942 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))) lt!84954) (apply!129 lt!84942 lt!84954))))

(assert (=> d!52065 true))

(declare-fun _$34!1050 () Unit!5227)

(assert (=> d!52065 (= (choose!931 lt!84942 lt!84963 (minValue!3397 thiss!1248) lt!84954) _$34!1050)))

(declare-fun bs!7071 () Bool)

(assert (= bs!7071 d!52065))

(assert (=> bs!7071 m!198679))

(assert (=> bs!7071 m!198679))

(assert (=> bs!7071 m!198701))

(assert (=> bs!7071 m!198681))

(assert (=> d!51683 d!52065))

(assert (=> d!51683 d!51697))

(assert (=> d!51683 d!51681))

(declare-fun d!52067 () Bool)

(declare-fun e!113218 () Bool)

(assert (=> d!52067 e!113218))

(declare-fun res!81482 () Bool)

(assert (=> d!52067 (=> res!81482 e!113218)))

(declare-fun lt!85304 () Bool)

(assert (=> d!52067 (= res!81482 (not lt!85304))))

(declare-fun lt!85302 () Bool)

(assert (=> d!52067 (= lt!85304 lt!85302)))

(declare-fun lt!85301 () Unit!5227)

(declare-fun e!113217 () Unit!5227)

(assert (=> d!52067 (= lt!85301 e!113217)))

(declare-fun c!30687 () Bool)

(assert (=> d!52067 (= c!30687 lt!85302)))

(assert (=> d!52067 (= lt!85302 (containsKey!186 (toList!1091 lt!84942) lt!84954))))

(assert (=> d!52067 (= (contains!1142 lt!84942 lt!84954) lt!85304)))

(declare-fun b!171539 () Bool)

(declare-fun lt!85303 () Unit!5227)

(assert (=> b!171539 (= e!113217 lt!85303)))

(assert (=> b!171539 (= lt!85303 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84942) lt!84954))))

(assert (=> b!171539 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84942) lt!84954))))

(declare-fun b!171540 () Bool)

(declare-fun Unit!5255 () Unit!5227)

(assert (=> b!171540 (= e!113217 Unit!5255)))

(declare-fun b!171541 () Bool)

(assert (=> b!171541 (= e!113218 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84942) lt!84954)))))

(assert (= (and d!52067 c!30687) b!171539))

(assert (= (and d!52067 (not c!30687)) b!171540))

(assert (= (and d!52067 (not res!81482)) b!171541))

(declare-fun m!199825 () Bool)

(assert (=> d!52067 m!199825))

(declare-fun m!199827 () Bool)

(assert (=> b!171539 m!199827))

(assert (=> b!171539 m!198881))

(assert (=> b!171539 m!198881))

(declare-fun m!199829 () Bool)

(assert (=> b!171539 m!199829))

(assert (=> b!171541 m!198881))

(assert (=> b!171541 m!198881))

(assert (=> b!171541 m!199829))

(assert (=> d!51683 d!52067))

(assert (=> d!51683 d!51693))

(assert (=> b!170940 d!51651))

(assert (=> b!171161 d!51803))

(declare-fun d!52069 () Bool)

(declare-fun res!81483 () Bool)

(declare-fun e!113219 () Bool)

(assert (=> d!52069 (=> res!81483 e!113219)))

(assert (=> d!52069 (= res!81483 (and ((_ is Cons!2199) (toList!1091 lt!84987)) (= (_1!1627 (h!2816 (toList!1091 lt!84987))) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52069 (= (containsKey!186 (toList!1091 lt!84987) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) e!113219)))

(declare-fun b!171542 () Bool)

(declare-fun e!113220 () Bool)

(assert (=> b!171542 (= e!113219 e!113220)))

(declare-fun res!81484 () Bool)

(assert (=> b!171542 (=> (not res!81484) (not e!113220))))

(assert (=> b!171542 (= res!81484 (and (or (not ((_ is Cons!2199) (toList!1091 lt!84987))) (bvsle (_1!1627 (h!2816 (toList!1091 lt!84987))) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2199) (toList!1091 lt!84987)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84987))) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!171543 () Bool)

(assert (=> b!171543 (= e!113220 (containsKey!186 (t!6996 (toList!1091 lt!84987)) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52069 (not res!81483)) b!171542))

(assert (= (and b!171542 res!81484) b!171543))

(assert (=> b!171543 m!198643))

(declare-fun m!199831 () Bool)

(assert (=> b!171543 m!199831))

(assert (=> d!51657 d!52069))

(declare-fun d!52071 () Bool)

(declare-fun e!113222 () Bool)

(assert (=> d!52071 e!113222))

(declare-fun res!81485 () Bool)

(assert (=> d!52071 (=> res!81485 e!113222)))

(declare-fun lt!85308 () Bool)

(assert (=> d!52071 (= res!81485 (not lt!85308))))

(declare-fun lt!85306 () Bool)

(assert (=> d!52071 (= lt!85308 lt!85306)))

(declare-fun lt!85305 () Unit!5227)

(declare-fun e!113221 () Unit!5227)

(assert (=> d!52071 (= lt!85305 e!113221)))

(declare-fun c!30688 () Bool)

(assert (=> d!52071 (= c!30688 lt!85306)))

(assert (=> d!52071 (= lt!85306 (containsKey!186 (toList!1091 lt!85031) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52071 (= (contains!1142 lt!85031 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85308)))

(declare-fun b!171544 () Bool)

(declare-fun lt!85307 () Unit!5227)

(assert (=> b!171544 (= e!113221 lt!85307)))

(assert (=> b!171544 (= lt!85307 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85031) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171544 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85031) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171545 () Bool)

(declare-fun Unit!5256 () Unit!5227)

(assert (=> b!171545 (= e!113221 Unit!5256)))

(declare-fun b!171546 () Bool)

(assert (=> b!171546 (= e!113222 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85031) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52071 c!30688) b!171544))

(assert (= (and d!52071 (not c!30688)) b!171545))

(assert (= (and d!52071 (not res!81485)) b!171546))

(declare-fun m!199833 () Bool)

(assert (=> d!52071 m!199833))

(declare-fun m!199835 () Bool)

(assert (=> b!171544 m!199835))

(declare-fun m!199837 () Bool)

(assert (=> b!171544 m!199837))

(assert (=> b!171544 m!199837))

(declare-fun m!199839 () Bool)

(assert (=> b!171544 m!199839))

(assert (=> b!171546 m!199837))

(assert (=> b!171546 m!199837))

(assert (=> b!171546 m!199839))

(assert (=> d!51667 d!52071))

(assert (=> d!51667 d!51649))

(assert (=> b!171005 d!51811))

(assert (=> b!171005 d!51813))

(declare-fun d!52073 () Bool)

(assert (=> d!52073 (= (get!1934 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3905 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!170899 d!52073))

(declare-fun d!52075 () Bool)

(declare-fun e!113224 () Bool)

(assert (=> d!52075 e!113224))

(declare-fun res!81486 () Bool)

(assert (=> d!52075 (=> res!81486 e!113224)))

(declare-fun lt!85312 () Bool)

(assert (=> d!52075 (= res!81486 (not lt!85312))))

(declare-fun lt!85310 () Bool)

(assert (=> d!52075 (= lt!85312 lt!85310)))

(declare-fun lt!85309 () Unit!5227)

(declare-fun e!113223 () Unit!5227)

(assert (=> d!52075 (= lt!85309 e!113223)))

(declare-fun c!30689 () Bool)

(assert (=> d!52075 (= c!30689 lt!85310)))

(assert (=> d!52075 (= lt!85310 (containsKey!186 (toList!1091 lt!85104) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52075 (= (contains!1142 lt!85104 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85312)))

(declare-fun b!171547 () Bool)

(declare-fun lt!85311 () Unit!5227)

(assert (=> b!171547 (= e!113223 lt!85311)))

(assert (=> b!171547 (= lt!85311 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85104) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171547 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85104) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171548 () Bool)

(declare-fun Unit!5257 () Unit!5227)

(assert (=> b!171548 (= e!113223 Unit!5257)))

(declare-fun b!171549 () Bool)

(assert (=> b!171549 (= e!113224 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85104) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52075 c!30689) b!171547))

(assert (= (and d!52075 (not c!30689)) b!171548))

(assert (= (and d!52075 (not res!81486)) b!171549))

(declare-fun m!199841 () Bool)

(assert (=> d!52075 m!199841))

(declare-fun m!199843 () Bool)

(assert (=> b!171547 m!199843))

(declare-fun m!199845 () Bool)

(assert (=> b!171547 m!199845))

(assert (=> b!171547 m!199845))

(declare-fun m!199847 () Bool)

(assert (=> b!171547 m!199847))

(assert (=> b!171549 m!199845))

(assert (=> b!171549 m!199845))

(assert (=> b!171549 m!199847))

(assert (=> b!171101 d!52075))

(declare-fun d!52077 () Bool)

(assert (=> d!52077 (= ($colon$colon!96 e!112912 (ite c!30545 (h!2816 (toList!1091 (map!1834 thiss!1248))) (tuple2!3233 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309))))) (Cons!2199 (ite c!30545 (h!2816 (toList!1091 (map!1834 thiss!1248))) (tuple2!3233 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309)))) e!112912))))

(assert (=> bm!17408 d!52077))

(assert (=> d!51783 d!51649))

(declare-fun d!52079 () Bool)

(declare-fun e!113226 () Bool)

(assert (=> d!52079 e!113226))

(declare-fun res!81487 () Bool)

(assert (=> d!52079 (=> res!81487 e!113226)))

(declare-fun lt!85316 () Bool)

(assert (=> d!52079 (= res!81487 (not lt!85316))))

(declare-fun lt!85314 () Bool)

(assert (=> d!52079 (= lt!85316 lt!85314)))

(declare-fun lt!85313 () Unit!5227)

(declare-fun e!113225 () Unit!5227)

(assert (=> d!52079 (= lt!85313 e!113225)))

(declare-fun c!30690 () Bool)

(assert (=> d!52079 (= c!30690 lt!85314)))

(assert (=> d!52079 (= lt!85314 (containsKey!186 (toList!1091 lt!85031) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52079 (= (contains!1142 lt!85031 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) lt!85316)))

(declare-fun b!171550 () Bool)

(declare-fun lt!85315 () Unit!5227)

(assert (=> b!171550 (= e!113225 lt!85315)))

(assert (=> b!171550 (= lt!85315 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85031) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171550 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85031) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171551 () Bool)

(declare-fun Unit!5258 () Unit!5227)

(assert (=> b!171551 (= e!113225 Unit!5258)))

(declare-fun b!171552 () Bool)

(assert (=> b!171552 (= e!113226 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85031) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!52079 c!30690) b!171550))

(assert (= (and d!52079 (not c!30690)) b!171551))

(assert (= (and d!52079 (not res!81487)) b!171552))

(assert (=> d!52079 m!198643))

(declare-fun m!199849 () Bool)

(assert (=> d!52079 m!199849))

(assert (=> b!171550 m!198643))

(declare-fun m!199851 () Bool)

(assert (=> b!171550 m!199851))

(assert (=> b!171550 m!198643))

(assert (=> b!171550 m!199567))

(assert (=> b!171550 m!199567))

(declare-fun m!199853 () Bool)

(assert (=> b!171550 m!199853))

(assert (=> b!171552 m!198643))

(assert (=> b!171552 m!199567))

(assert (=> b!171552 m!199567))

(assert (=> b!171552 m!199853))

(assert (=> b!170975 d!52079))

(declare-fun d!52081 () Bool)

(declare-fun e!113228 () Bool)

(assert (=> d!52081 e!113228))

(declare-fun res!81488 () Bool)

(assert (=> d!52081 (=> res!81488 e!113228)))

(declare-fun lt!85320 () Bool)

(assert (=> d!52081 (= res!81488 (not lt!85320))))

(declare-fun lt!85318 () Bool)

(assert (=> d!52081 (= lt!85320 lt!85318)))

(declare-fun lt!85317 () Unit!5227)

(declare-fun e!113227 () Unit!5227)

(assert (=> d!52081 (= lt!85317 e!113227)))

(declare-fun c!30691 () Bool)

(assert (=> d!52081 (= c!30691 lt!85318)))

(assert (=> d!52081 (= lt!85318 (containsKey!186 (toList!1091 lt!85093) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!52081 (= (contains!1142 lt!85093 (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) lt!85320)))

(declare-fun b!171553 () Bool)

(declare-fun lt!85319 () Unit!5227)

(assert (=> b!171553 (= e!113227 lt!85319)))

(assert (=> b!171553 (= lt!85319 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85093) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> b!171553 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85093) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171554 () Bool)

(declare-fun Unit!5259 () Unit!5227)

(assert (=> b!171554 (= e!113227 Unit!5259)))

(declare-fun b!171555 () Bool)

(assert (=> b!171555 (= e!113228 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85093) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52081 c!30691) b!171553))

(assert (= (and d!52081 (not c!30691)) b!171554))

(assert (= (and d!52081 (not res!81488)) b!171555))

(declare-fun m!199855 () Bool)

(assert (=> d!52081 m!199855))

(declare-fun m!199857 () Bool)

(assert (=> b!171553 m!199857))

(assert (=> b!171553 m!199027))

(assert (=> b!171553 m!199027))

(declare-fun m!199859 () Bool)

(assert (=> b!171553 m!199859))

(assert (=> b!171555 m!199027))

(assert (=> b!171555 m!199027))

(assert (=> b!171555 m!199859))

(assert (=> d!51721 d!52081))

(declare-fun b!171556 () Bool)

(declare-fun e!113229 () Option!188)

(assert (=> b!171556 (= e!113229 (Some!187 (_2!1627 (h!2816 lt!85091))))))

(declare-fun e!113230 () Option!188)

(declare-fun b!171558 () Bool)

(assert (=> b!171558 (= e!113230 (getValueByKey!182 (t!6996 lt!85091) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171559 () Bool)

(assert (=> b!171559 (= e!113230 None!186)))

(declare-fun c!30692 () Bool)

(declare-fun d!52083 () Bool)

(assert (=> d!52083 (= c!30692 (and ((_ is Cons!2199) lt!85091) (= (_1!1627 (h!2816 lt!85091)) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (=> d!52083 (= (getValueByKey!182 lt!85091 (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) e!113229)))

(declare-fun b!171557 () Bool)

(assert (=> b!171557 (= e!113229 e!113230)))

(declare-fun c!30693 () Bool)

(assert (=> b!171557 (= c!30693 (and ((_ is Cons!2199) lt!85091) (not (= (_1!1627 (h!2816 lt!85091)) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))))

(assert (= (and d!52083 c!30692) b!171556))

(assert (= (and d!52083 (not c!30692)) b!171557))

(assert (= (and b!171557 c!30693) b!171558))

(assert (= (and b!171557 (not c!30693)) b!171559))

(declare-fun m!199861 () Bool)

(assert (=> b!171558 m!199861))

(assert (=> d!51721 d!52083))

(declare-fun d!52085 () Bool)

(assert (=> d!52085 (= (getValueByKey!182 lt!85091 (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) (Some!187 (_2!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun lt!85321 () Unit!5227)

(assert (=> d!52085 (= lt!85321 (choose!933 lt!85091 (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun e!113231 () Bool)

(assert (=> d!52085 e!113231))

(declare-fun res!81489 () Bool)

(assert (=> d!52085 (=> (not res!81489) (not e!113231))))

(assert (=> d!52085 (= res!81489 (isStrictlySorted!326 lt!85091))))

(assert (=> d!52085 (= (lemmaContainsTupThenGetReturnValue!98 lt!85091 (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) lt!85321)))

(declare-fun b!171560 () Bool)

(declare-fun res!81490 () Bool)

(assert (=> b!171560 (=> (not res!81490) (not e!113231))))

(assert (=> b!171560 (= res!81490 (containsKey!186 lt!85091 (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171561 () Bool)

(assert (=> b!171561 (= e!113231 (contains!1144 lt!85091 (tuple2!3233 (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52085 res!81489) b!171560))

(assert (= (and b!171560 res!81490) b!171561))

(assert (=> d!52085 m!199021))

(declare-fun m!199863 () Bool)

(assert (=> d!52085 m!199863))

(declare-fun m!199865 () Bool)

(assert (=> d!52085 m!199865))

(declare-fun m!199867 () Bool)

(assert (=> b!171560 m!199867))

(declare-fun m!199869 () Bool)

(assert (=> b!171561 m!199869))

(assert (=> d!51721 d!52085))

(declare-fun b!171562 () Bool)

(declare-fun e!113232 () List!2203)

(assert (=> b!171562 (= e!113232 (insertStrictlySorted!101 (t!6996 (toList!1091 (ite c!30490 call!17383 (ite c!30488 call!17380 call!17384)))) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171563 () Bool)

(declare-fun e!113234 () List!2203)

(declare-fun call!17445 () List!2203)

(assert (=> b!171563 (= e!113234 call!17445)))

(declare-fun b!171564 () Bool)

(declare-fun e!113233 () List!2203)

(declare-fun call!17444 () List!2203)

(assert (=> b!171564 (= e!113233 call!17444)))

(declare-fun bm!17441 () Bool)

(declare-fun call!17446 () List!2203)

(assert (=> bm!17441 (= call!17446 call!17445)))

(declare-fun b!171565 () Bool)

(declare-fun e!113236 () List!2203)

(assert (=> b!171565 (= e!113234 e!113236)))

(declare-fun c!30694 () Bool)

(assert (=> b!171565 (= c!30694 (and ((_ is Cons!2199) (toList!1091 (ite c!30490 call!17383 (ite c!30488 call!17380 call!17384)))) (= (_1!1627 (h!2816 (toList!1091 (ite c!30490 call!17383 (ite c!30488 call!17380 call!17384))))) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun d!52087 () Bool)

(declare-fun e!113235 () Bool)

(assert (=> d!52087 e!113235))

(declare-fun res!81491 () Bool)

(assert (=> d!52087 (=> (not res!81491) (not e!113235))))

(declare-fun lt!85322 () List!2203)

(assert (=> d!52087 (= res!81491 (isStrictlySorted!326 lt!85322))))

(assert (=> d!52087 (= lt!85322 e!113234)))

(declare-fun c!30696 () Bool)

(assert (=> d!52087 (= c!30696 (and ((_ is Cons!2199) (toList!1091 (ite c!30490 call!17383 (ite c!30488 call!17380 call!17384)))) (bvslt (_1!1627 (h!2816 (toList!1091 (ite c!30490 call!17383 (ite c!30488 call!17380 call!17384))))) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (=> d!52087 (isStrictlySorted!326 (toList!1091 (ite c!30490 call!17383 (ite c!30488 call!17380 call!17384))))))

(assert (=> d!52087 (= (insertStrictlySorted!101 (toList!1091 (ite c!30490 call!17383 (ite c!30488 call!17380 call!17384))) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) lt!85322)))

(declare-fun b!171566 () Bool)

(assert (=> b!171566 (= e!113236 call!17446)))

(declare-fun b!171567 () Bool)

(declare-fun c!30695 () Bool)

(assert (=> b!171567 (= e!113232 (ite c!30694 (t!6996 (toList!1091 (ite c!30490 call!17383 (ite c!30488 call!17380 call!17384)))) (ite c!30695 (Cons!2199 (h!2816 (toList!1091 (ite c!30490 call!17383 (ite c!30488 call!17380 call!17384)))) (t!6996 (toList!1091 (ite c!30490 call!17383 (ite c!30488 call!17380 call!17384))))) Nil!2200)))))

(declare-fun bm!17442 () Bool)

(assert (=> bm!17442 (= call!17444 call!17446)))

(declare-fun b!171568 () Bool)

(assert (=> b!171568 (= c!30695 (and ((_ is Cons!2199) (toList!1091 (ite c!30490 call!17383 (ite c!30488 call!17380 call!17384)))) (bvsgt (_1!1627 (h!2816 (toList!1091 (ite c!30490 call!17383 (ite c!30488 call!17380 call!17384))))) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (=> b!171568 (= e!113236 e!113233)))

(declare-fun bm!17443 () Bool)

(assert (=> bm!17443 (= call!17445 ($colon$colon!96 e!113232 (ite c!30696 (h!2816 (toList!1091 (ite c!30490 call!17383 (ite c!30488 call!17380 call!17384)))) (tuple2!3233 (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))))

(declare-fun c!30697 () Bool)

(assert (=> bm!17443 (= c!30697 c!30696)))

(declare-fun b!171569 () Bool)

(declare-fun res!81492 () Bool)

(assert (=> b!171569 (=> (not res!81492) (not e!113235))))

(assert (=> b!171569 (= res!81492 (containsKey!186 lt!85322 (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171570 () Bool)

(assert (=> b!171570 (= e!113233 call!17444)))

(declare-fun b!171571 () Bool)

(assert (=> b!171571 (= e!113235 (contains!1144 lt!85322 (tuple2!3233 (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52087 c!30696) b!171563))

(assert (= (and d!52087 (not c!30696)) b!171565))

(assert (= (and b!171565 c!30694) b!171566))

(assert (= (and b!171565 (not c!30694)) b!171568))

(assert (= (and b!171568 c!30695) b!171570))

(assert (= (and b!171568 (not c!30695)) b!171564))

(assert (= (or b!171570 b!171564) bm!17442))

(assert (= (or b!171566 bm!17442) bm!17441))

(assert (= (or b!171563 bm!17441) bm!17443))

(assert (= (and bm!17443 c!30697) b!171562))

(assert (= (and bm!17443 (not c!30697)) b!171567))

(assert (= (and d!52087 res!81491) b!171569))

(assert (= (and b!171569 res!81492) b!171571))

(declare-fun m!199871 () Bool)

(assert (=> b!171562 m!199871))

(declare-fun m!199873 () Bool)

(assert (=> b!171571 m!199873))

(declare-fun m!199875 () Bool)

(assert (=> bm!17443 m!199875))

(declare-fun m!199877 () Bool)

(assert (=> b!171569 m!199877))

(declare-fun m!199879 () Bool)

(assert (=> d!52087 m!199879))

(declare-fun m!199881 () Bool)

(assert (=> d!52087 m!199881))

(assert (=> d!51721 d!52087))

(assert (=> d!51677 d!51699))

(assert (=> d!51677 d!51675))

(declare-fun d!52089 () Bool)

(assert (=> d!52089 (= (apply!129 (+!238 lt!84947 (tuple2!3233 lt!84944 v!309)) lt!84961) (apply!129 lt!84947 lt!84961))))

(assert (=> d!52089 true))

(declare-fun _$34!1051 () Unit!5227)

(assert (=> d!52089 (= (choose!931 lt!84947 lt!84944 v!309 lt!84961) _$34!1051)))

(declare-fun bs!7072 () Bool)

(assert (= bs!7072 d!52089))

(assert (=> bs!7072 m!198697))

(assert (=> bs!7072 m!198697))

(assert (=> bs!7072 m!198699))

(assert (=> bs!7072 m!198675))

(assert (=> d!51677 d!52089))

(assert (=> d!51677 d!51687))

(declare-fun d!52091 () Bool)

(declare-fun e!113238 () Bool)

(assert (=> d!52091 e!113238))

(declare-fun res!81493 () Bool)

(assert (=> d!52091 (=> res!81493 e!113238)))

(declare-fun lt!85326 () Bool)

(assert (=> d!52091 (= res!81493 (not lt!85326))))

(declare-fun lt!85324 () Bool)

(assert (=> d!52091 (= lt!85326 lt!85324)))

(declare-fun lt!85323 () Unit!5227)

(declare-fun e!113237 () Unit!5227)

(assert (=> d!52091 (= lt!85323 e!113237)))

(declare-fun c!30698 () Bool)

(assert (=> d!52091 (= c!30698 lt!85324)))

(assert (=> d!52091 (= lt!85324 (containsKey!186 (toList!1091 lt!84947) lt!84961))))

(assert (=> d!52091 (= (contains!1142 lt!84947 lt!84961) lt!85326)))

(declare-fun b!171572 () Bool)

(declare-fun lt!85325 () Unit!5227)

(assert (=> b!171572 (= e!113237 lt!85325)))

(assert (=> b!171572 (= lt!85325 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84947) lt!84961))))

(assert (=> b!171572 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84947) lt!84961))))

(declare-fun b!171573 () Bool)

(declare-fun Unit!5260 () Unit!5227)

(assert (=> b!171573 (= e!113237 Unit!5260)))

(declare-fun b!171574 () Bool)

(assert (=> b!171574 (= e!113238 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84947) lt!84961)))))

(assert (= (and d!52091 c!30698) b!171572))

(assert (= (and d!52091 (not c!30698)) b!171573))

(assert (= (and d!52091 (not res!81493)) b!171574))

(declare-fun m!199883 () Bool)

(assert (=> d!52091 m!199883))

(declare-fun m!199885 () Bool)

(assert (=> b!171572 m!199885))

(assert (=> b!171572 m!198861))

(assert (=> b!171572 m!198861))

(declare-fun m!199887 () Bool)

(assert (=> b!171572 m!199887))

(assert (=> b!171574 m!198861))

(assert (=> b!171574 m!198861))

(assert (=> b!171574 m!199887))

(assert (=> d!51677 d!52091))

(declare-fun d!52093 () Bool)

(declare-fun e!113240 () Bool)

(assert (=> d!52093 e!113240))

(declare-fun res!81494 () Bool)

(assert (=> d!52093 (=> res!81494 e!113240)))

(declare-fun lt!85330 () Bool)

(assert (=> d!52093 (= res!81494 (not lt!85330))))

(declare-fun lt!85328 () Bool)

(assert (=> d!52093 (= lt!85330 lt!85328)))

(declare-fun lt!85327 () Unit!5227)

(declare-fun e!113239 () Unit!5227)

(assert (=> d!52093 (= lt!85327 e!113239)))

(declare-fun c!30699 () Bool)

(assert (=> d!52093 (= c!30699 lt!85328)))

(assert (=> d!52093 (= lt!85328 (containsKey!186 (toList!1091 lt!85173) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> d!52093 (= (contains!1142 lt!85173 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85330)))

(declare-fun b!171575 () Bool)

(declare-fun lt!85329 () Unit!5227)

(assert (=> b!171575 (= e!113239 lt!85329)))

(assert (=> b!171575 (= lt!85329 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85173) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> b!171575 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85173) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171576 () Bool)

(declare-fun Unit!5261 () Unit!5227)

(assert (=> b!171576 (= e!113239 Unit!5261)))

(declare-fun b!171577 () Bool)

(assert (=> b!171577 (= e!113240 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85173) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52093 c!30699) b!171575))

(assert (= (and d!52093 (not c!30699)) b!171576))

(assert (= (and d!52093 (not res!81494)) b!171577))

(declare-fun m!199889 () Bool)

(assert (=> d!52093 m!199889))

(declare-fun m!199891 () Bool)

(assert (=> b!171575 m!199891))

(assert (=> b!171575 m!199295))

(assert (=> b!171575 m!199295))

(declare-fun m!199893 () Bool)

(assert (=> b!171575 m!199893))

(assert (=> b!171577 m!199295))

(assert (=> b!171577 m!199295))

(assert (=> b!171577 m!199893))

(assert (=> d!51793 d!52093))

(declare-fun b!171578 () Bool)

(declare-fun e!113241 () Option!188)

(assert (=> b!171578 (= e!113241 (Some!187 (_2!1627 (h!2816 lt!85171))))))

(declare-fun b!171580 () Bool)

(declare-fun e!113242 () Option!188)

(assert (=> b!171580 (= e!113242 (getValueByKey!182 (t!6996 lt!85171) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171581 () Bool)

(assert (=> b!171581 (= e!113242 None!186)))

(declare-fun d!52095 () Bool)

(declare-fun c!30700 () Bool)

(assert (=> d!52095 (= c!30700 (and ((_ is Cons!2199) lt!85171) (= (_1!1627 (h!2816 lt!85171)) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!52095 (= (getValueByKey!182 lt!85171 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) e!113241)))

(declare-fun b!171579 () Bool)

(assert (=> b!171579 (= e!113241 e!113242)))

(declare-fun c!30701 () Bool)

(assert (=> b!171579 (= c!30701 (and ((_ is Cons!2199) lt!85171) (not (= (_1!1627 (h!2816 lt!85171)) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52095 c!30700) b!171578))

(assert (= (and d!52095 (not c!30700)) b!171579))

(assert (= (and b!171579 c!30701) b!171580))

(assert (= (and b!171579 (not c!30701)) b!171581))

(declare-fun m!199895 () Bool)

(assert (=> b!171580 m!199895))

(assert (=> d!51793 d!52095))

(declare-fun d!52097 () Bool)

(assert (=> d!52097 (= (getValueByKey!182 lt!85171 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85331 () Unit!5227)

(assert (=> d!52097 (= lt!85331 (choose!933 lt!85171 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun e!113243 () Bool)

(assert (=> d!52097 e!113243))

(declare-fun res!81495 () Bool)

(assert (=> d!52097 (=> (not res!81495) (not e!113243))))

(assert (=> d!52097 (= res!81495 (isStrictlySorted!326 lt!85171))))

(assert (=> d!52097 (= (lemmaContainsTupThenGetReturnValue!98 lt!85171 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85331)))

(declare-fun b!171582 () Bool)

(declare-fun res!81496 () Bool)

(assert (=> b!171582 (=> (not res!81496) (not e!113243))))

(assert (=> b!171582 (= res!81496 (containsKey!186 lt!85171 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171583 () Bool)

(assert (=> b!171583 (= e!113243 (contains!1144 lt!85171 (tuple2!3233 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52097 res!81495) b!171582))

(assert (= (and b!171582 res!81496) b!171583))

(assert (=> d!52097 m!199289))

(declare-fun m!199897 () Bool)

(assert (=> d!52097 m!199897))

(declare-fun m!199899 () Bool)

(assert (=> d!52097 m!199899))

(declare-fun m!199901 () Bool)

(assert (=> b!171582 m!199901))

(declare-fun m!199903 () Bool)

(assert (=> b!171583 m!199903))

(assert (=> d!51793 d!52097))

(declare-fun b!171584 () Bool)

(declare-fun e!113244 () List!2203)

(assert (=> b!171584 (= e!113244 (insertStrictlySorted!101 (t!6996 (toList!1091 call!17382)) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171585 () Bool)

(declare-fun e!113246 () List!2203)

(declare-fun call!17448 () List!2203)

(assert (=> b!171585 (= e!113246 call!17448)))

(declare-fun b!171586 () Bool)

(declare-fun e!113245 () List!2203)

(declare-fun call!17447 () List!2203)

(assert (=> b!171586 (= e!113245 call!17447)))

(declare-fun bm!17444 () Bool)

(declare-fun call!17449 () List!2203)

(assert (=> bm!17444 (= call!17449 call!17448)))

(declare-fun b!171587 () Bool)

(declare-fun e!113248 () List!2203)

(assert (=> b!171587 (= e!113246 e!113248)))

(declare-fun c!30702 () Bool)

(assert (=> b!171587 (= c!30702 (and ((_ is Cons!2199) (toList!1091 call!17382)) (= (_1!1627 (h!2816 (toList!1091 call!17382))) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun d!52099 () Bool)

(declare-fun e!113247 () Bool)

(assert (=> d!52099 e!113247))

(declare-fun res!81497 () Bool)

(assert (=> d!52099 (=> (not res!81497) (not e!113247))))

(declare-fun lt!85332 () List!2203)

(assert (=> d!52099 (= res!81497 (isStrictlySorted!326 lt!85332))))

(assert (=> d!52099 (= lt!85332 e!113246)))

(declare-fun c!30704 () Bool)

(assert (=> d!52099 (= c!30704 (and ((_ is Cons!2199) (toList!1091 call!17382)) (bvslt (_1!1627 (h!2816 (toList!1091 call!17382))) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!52099 (isStrictlySorted!326 (toList!1091 call!17382))))

(assert (=> d!52099 (= (insertStrictlySorted!101 (toList!1091 call!17382) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85332)))

(declare-fun b!171588 () Bool)

(assert (=> b!171588 (= e!113248 call!17449)))

(declare-fun b!171589 () Bool)

(declare-fun c!30703 () Bool)

(assert (=> b!171589 (= e!113244 (ite c!30702 (t!6996 (toList!1091 call!17382)) (ite c!30703 (Cons!2199 (h!2816 (toList!1091 call!17382)) (t!6996 (toList!1091 call!17382))) Nil!2200)))))

(declare-fun bm!17445 () Bool)

(assert (=> bm!17445 (= call!17447 call!17449)))

(declare-fun b!171590 () Bool)

(assert (=> b!171590 (= c!30703 (and ((_ is Cons!2199) (toList!1091 call!17382)) (bvsgt (_1!1627 (h!2816 (toList!1091 call!17382))) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> b!171590 (= e!113248 e!113245)))

(declare-fun bm!17446 () Bool)

(assert (=> bm!17446 (= call!17448 ($colon$colon!96 e!113244 (ite c!30704 (h!2816 (toList!1091 call!17382)) (tuple2!3233 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun c!30705 () Bool)

(assert (=> bm!17446 (= c!30705 c!30704)))

(declare-fun b!171591 () Bool)

(declare-fun res!81498 () Bool)

(assert (=> b!171591 (=> (not res!81498) (not e!113247))))

(assert (=> b!171591 (= res!81498 (containsKey!186 lt!85332 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171592 () Bool)

(assert (=> b!171592 (= e!113245 call!17447)))

(declare-fun b!171593 () Bool)

(assert (=> b!171593 (= e!113247 (contains!1144 lt!85332 (tuple2!3233 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52099 c!30704) b!171585))

(assert (= (and d!52099 (not c!30704)) b!171587))

(assert (= (and b!171587 c!30702) b!171588))

(assert (= (and b!171587 (not c!30702)) b!171590))

(assert (= (and b!171590 c!30703) b!171592))

(assert (= (and b!171590 (not c!30703)) b!171586))

(assert (= (or b!171592 b!171586) bm!17445))

(assert (= (or b!171588 bm!17445) bm!17444))

(assert (= (or b!171585 bm!17444) bm!17446))

(assert (= (and bm!17446 c!30705) b!171584))

(assert (= (and bm!17446 (not c!30705)) b!171589))

(assert (= (and d!52099 res!81497) b!171591))

(assert (= (and b!171591 res!81498) b!171593))

(declare-fun m!199905 () Bool)

(assert (=> b!171584 m!199905))

(declare-fun m!199907 () Bool)

(assert (=> b!171593 m!199907))

(declare-fun m!199909 () Bool)

(assert (=> bm!17446 m!199909))

(declare-fun m!199911 () Bool)

(assert (=> b!171591 m!199911))

(declare-fun m!199913 () Bool)

(assert (=> d!52099 m!199913))

(declare-fun m!199915 () Bool)

(assert (=> d!52099 m!199915))

(assert (=> d!51793 d!52099))

(declare-fun d!52101 () Bool)

(assert (=> d!52101 (= (apply!129 lt!85162 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1933 (getValueByKey!182 (toList!1091 lt!85162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7073 () Bool)

(assert (= bs!7073 d!52101))

(assert (=> bs!7073 m!199765))

(assert (=> bs!7073 m!199765))

(declare-fun m!199917 () Bool)

(assert (=> bs!7073 m!199917))

(assert (=> b!171151 d!52101))

(declare-fun d!52103 () Bool)

(declare-fun e!113250 () Bool)

(assert (=> d!52103 e!113250))

(declare-fun res!81499 () Bool)

(assert (=> d!52103 (=> res!81499 e!113250)))

(declare-fun lt!85336 () Bool)

(assert (=> d!52103 (= res!81499 (not lt!85336))))

(declare-fun lt!85334 () Bool)

(assert (=> d!52103 (= lt!85336 lt!85334)))

(declare-fun lt!85333 () Unit!5227)

(declare-fun e!113249 () Unit!5227)

(assert (=> d!52103 (= lt!85333 e!113249)))

(declare-fun c!30706 () Bool)

(assert (=> d!52103 (= c!30706 lt!85334)))

(assert (=> d!52103 (= lt!85334 (containsKey!186 (toList!1091 lt!85162) (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(assert (=> d!52103 (= (contains!1142 lt!85162 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)) lt!85336)))

(declare-fun b!171594 () Bool)

(declare-fun lt!85335 () Unit!5227)

(assert (=> b!171594 (= e!113249 lt!85335)))

(assert (=> b!171594 (= lt!85335 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85162) (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(assert (=> b!171594 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85162) (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(declare-fun b!171595 () Bool)

(declare-fun Unit!5262 () Unit!5227)

(assert (=> b!171595 (= e!113249 Unit!5262)))

(declare-fun b!171596 () Bool)

(assert (=> b!171596 (= e!113250 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85162) (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000))))))

(assert (= (and d!52103 c!30706) b!171594))

(assert (= (and d!52103 (not c!30706)) b!171595))

(assert (= (and d!52103 (not res!81499)) b!171596))

(assert (=> d!52103 m!199007))

(declare-fun m!199919 () Bool)

(assert (=> d!52103 m!199919))

(assert (=> b!171594 m!199007))

(declare-fun m!199921 () Bool)

(assert (=> b!171594 m!199921))

(assert (=> b!171594 m!199007))

(assert (=> b!171594 m!199489))

(assert (=> b!171594 m!199489))

(declare-fun m!199923 () Bool)

(assert (=> b!171594 m!199923))

(assert (=> b!171596 m!199007))

(assert (=> b!171596 m!199489))

(assert (=> b!171596 m!199489))

(assert (=> b!171596 m!199923))

(assert (=> b!171165 d!52103))

(declare-fun d!52105 () Bool)

(declare-fun res!81500 () Bool)

(declare-fun e!113251 () Bool)

(assert (=> d!52105 (=> res!81500 e!113251)))

(assert (=> d!52105 (= res!81500 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))) (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))) lt!84974)))))

(assert (=> d!52105 (= (containsKey!186 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) lt!84974) e!113251)))

(declare-fun b!171597 () Bool)

(declare-fun e!113252 () Bool)

(assert (=> b!171597 (= e!113251 e!113252)))

(declare-fun res!81501 () Bool)

(assert (=> b!171597 (=> (not res!81501) (not e!113252))))

(assert (=> b!171597 (= res!81501 (and (or (not ((_ is Cons!2199) (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))) (bvsle (_1!1627 (h!2816 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))) lt!84974)) ((_ is Cons!2199) (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))) (bvslt (_1!1627 (h!2816 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))) lt!84974)))))

(declare-fun b!171598 () Bool)

(assert (=> b!171598 (= e!113252 (containsKey!186 (t!6996 (toList!1091 (+!238 lt!84985 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))) lt!84974))))

(assert (= (and d!52105 (not res!81500)) b!171597))

(assert (= (and b!171597 res!81501) b!171598))

(declare-fun m!199925 () Bool)

(assert (=> b!171598 m!199925))

(assert (=> d!51769 d!52105))

(declare-fun d!52107 () Bool)

(assert (=> d!52107 (= (get!1935 (select (arr!3377 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!463 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!170900 d!52107))

(assert (=> b!170979 d!51853))

(assert (=> b!171064 d!51803))

(declare-fun d!52109 () Bool)

(declare-fun e!113254 () Bool)

(assert (=> d!52109 e!113254))

(declare-fun res!81502 () Bool)

(assert (=> d!52109 (=> res!81502 e!113254)))

(declare-fun lt!85340 () Bool)

(assert (=> d!52109 (= res!81502 (not lt!85340))))

(declare-fun lt!85338 () Bool)

(assert (=> d!52109 (= lt!85340 lt!85338)))

(declare-fun lt!85337 () Unit!5227)

(declare-fun e!113253 () Unit!5227)

(assert (=> d!52109 (= lt!85337 e!113253)))

(declare-fun c!30707 () Bool)

(assert (=> d!52109 (= c!30707 lt!85338)))

(assert (=> d!52109 (= lt!85338 (containsKey!186 (toList!1091 lt!85061) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))

(assert (=> d!52109 (= (contains!1142 lt!85061 (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))) lt!85340)))

(declare-fun b!171599 () Bool)

(declare-fun lt!85339 () Unit!5227)

(assert (=> b!171599 (= e!113253 lt!85339)))

(assert (=> b!171599 (= lt!85339 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85061) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))

(assert (=> b!171599 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85061) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))

(declare-fun b!171600 () Bool)

(declare-fun Unit!5263 () Unit!5227)

(assert (=> b!171600 (= e!113253 Unit!5263)))

(declare-fun b!171601 () Bool)

(assert (=> b!171601 (= e!113254 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85061) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52109 c!30707) b!171599))

(assert (= (and d!52109 (not c!30707)) b!171600))

(assert (= (and d!52109 (not res!81502)) b!171601))

(declare-fun m!199927 () Bool)

(assert (=> d!52109 m!199927))

(declare-fun m!199929 () Bool)

(assert (=> b!171599 m!199929))

(assert (=> b!171599 m!198941))

(assert (=> b!171599 m!198941))

(declare-fun m!199931 () Bool)

(assert (=> b!171599 m!199931))

(assert (=> b!171601 m!198941))

(assert (=> b!171601 m!198941))

(assert (=> b!171601 m!199931))

(assert (=> d!51697 d!52109))

(declare-fun b!171602 () Bool)

(declare-fun e!113255 () Option!188)

(assert (=> b!171602 (= e!113255 (Some!187 (_2!1627 (h!2816 lt!85059))))))

(declare-fun b!171604 () Bool)

(declare-fun e!113256 () Option!188)

(assert (=> b!171604 (= e!113256 (getValueByKey!182 (t!6996 lt!85059) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))

(declare-fun b!171605 () Bool)

(assert (=> b!171605 (= e!113256 None!186)))

(declare-fun c!30708 () Bool)

(declare-fun d!52111 () Bool)

(assert (=> d!52111 (= c!30708 (and ((_ is Cons!2199) lt!85059) (= (_1!1627 (h!2816 lt!85059)) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))))))

(assert (=> d!52111 (= (getValueByKey!182 lt!85059 (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))) e!113255)))

(declare-fun b!171603 () Bool)

(assert (=> b!171603 (= e!113255 e!113256)))

(declare-fun c!30709 () Bool)

(assert (=> b!171603 (= c!30709 (and ((_ is Cons!2199) lt!85059) (not (= (_1!1627 (h!2816 lt!85059)) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52111 c!30708) b!171602))

(assert (= (and d!52111 (not c!30708)) b!171603))

(assert (= (and b!171603 c!30709) b!171604))

(assert (= (and b!171603 (not c!30709)) b!171605))

(declare-fun m!199933 () Bool)

(assert (=> b!171604 m!199933))

(assert (=> d!51697 d!52111))

(declare-fun d!52113 () Bool)

(assert (=> d!52113 (= (getValueByKey!182 lt!85059 (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85341 () Unit!5227)

(assert (=> d!52113 (= lt!85341 (choose!933 lt!85059 (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))

(declare-fun e!113257 () Bool)

(assert (=> d!52113 e!113257))

(declare-fun res!81503 () Bool)

(assert (=> d!52113 (=> (not res!81503) (not e!113257))))

(assert (=> d!52113 (= res!81503 (isStrictlySorted!326 lt!85059))))

(assert (=> d!52113 (= (lemmaContainsTupThenGetReturnValue!98 lt!85059 (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))) lt!85341)))

(declare-fun b!171606 () Bool)

(declare-fun res!81504 () Bool)

(assert (=> b!171606 (=> (not res!81504) (not e!113257))))

(assert (=> b!171606 (= res!81504 (containsKey!186 lt!85059 (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))

(declare-fun b!171607 () Bool)

(assert (=> b!171607 (= e!113257 (contains!1144 lt!85059 (tuple2!3233 (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52113 res!81503) b!171606))

(assert (= (and b!171606 res!81504) b!171607))

(assert (=> d!52113 m!198935))

(declare-fun m!199935 () Bool)

(assert (=> d!52113 m!199935))

(declare-fun m!199937 () Bool)

(assert (=> d!52113 m!199937))

(declare-fun m!199939 () Bool)

(assert (=> b!171606 m!199939))

(declare-fun m!199941 () Bool)

(assert (=> b!171607 m!199941))

(assert (=> d!51697 d!52113))

(declare-fun b!171608 () Bool)

(declare-fun e!113258 () List!2203)

(assert (=> b!171608 (= e!113258 (insertStrictlySorted!101 (t!6996 (toList!1091 lt!84942)) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))

(declare-fun b!171609 () Bool)

(declare-fun e!113260 () List!2203)

(declare-fun call!17451 () List!2203)

(assert (=> b!171609 (= e!113260 call!17451)))

(declare-fun b!171610 () Bool)

(declare-fun e!113259 () List!2203)

(declare-fun call!17450 () List!2203)

(assert (=> b!171610 (= e!113259 call!17450)))

(declare-fun bm!17447 () Bool)

(declare-fun call!17452 () List!2203)

(assert (=> bm!17447 (= call!17452 call!17451)))

(declare-fun b!171611 () Bool)

(declare-fun e!113262 () List!2203)

(assert (=> b!171611 (= e!113260 e!113262)))

(declare-fun c!30710 () Bool)

(assert (=> b!171611 (= c!30710 (and ((_ is Cons!2199) (toList!1091 lt!84942)) (= (_1!1627 (h!2816 (toList!1091 lt!84942))) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))))))

(declare-fun d!52115 () Bool)

(declare-fun e!113261 () Bool)

(assert (=> d!52115 e!113261))

(declare-fun res!81505 () Bool)

(assert (=> d!52115 (=> (not res!81505) (not e!113261))))

(declare-fun lt!85342 () List!2203)

(assert (=> d!52115 (= res!81505 (isStrictlySorted!326 lt!85342))))

(assert (=> d!52115 (= lt!85342 e!113260)))

(declare-fun c!30712 () Bool)

(assert (=> d!52115 (= c!30712 (and ((_ is Cons!2199) (toList!1091 lt!84942)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84942))) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))))))

(assert (=> d!52115 (isStrictlySorted!326 (toList!1091 lt!84942))))

(assert (=> d!52115 (= (insertStrictlySorted!101 (toList!1091 lt!84942) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))) lt!85342)))

(declare-fun b!171612 () Bool)

(assert (=> b!171612 (= e!113262 call!17452)))

(declare-fun c!30711 () Bool)

(declare-fun b!171613 () Bool)

(assert (=> b!171613 (= e!113258 (ite c!30710 (t!6996 (toList!1091 lt!84942)) (ite c!30711 (Cons!2199 (h!2816 (toList!1091 lt!84942)) (t!6996 (toList!1091 lt!84942))) Nil!2200)))))

(declare-fun bm!17448 () Bool)

(assert (=> bm!17448 (= call!17450 call!17452)))

(declare-fun b!171614 () Bool)

(assert (=> b!171614 (= c!30711 (and ((_ is Cons!2199) (toList!1091 lt!84942)) (bvsgt (_1!1627 (h!2816 (toList!1091 lt!84942))) (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))))))

(assert (=> b!171614 (= e!113262 e!113259)))

(declare-fun bm!17449 () Bool)

(assert (=> bm!17449 (= call!17451 ($colon$colon!96 e!113258 (ite c!30712 (h!2816 (toList!1091 lt!84942)) (tuple2!3233 (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))))

(declare-fun c!30713 () Bool)

(assert (=> bm!17449 (= c!30713 c!30712)))

(declare-fun b!171615 () Bool)

(declare-fun res!81506 () Bool)

(assert (=> b!171615 (=> (not res!81506) (not e!113261))))

(assert (=> b!171615 (= res!81506 (containsKey!186 lt!85342 (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))))

(declare-fun b!171616 () Bool)

(assert (=> b!171616 (= e!113259 call!17450)))

(declare-fun b!171617 () Bool)

(assert (=> b!171617 (= e!113261 (contains!1144 lt!85342 (tuple2!3233 (_1!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52115 c!30712) b!171609))

(assert (= (and d!52115 (not c!30712)) b!171611))

(assert (= (and b!171611 c!30710) b!171612))

(assert (= (and b!171611 (not c!30710)) b!171614))

(assert (= (and b!171614 c!30711) b!171616))

(assert (= (and b!171614 (not c!30711)) b!171610))

(assert (= (or b!171616 b!171610) bm!17448))

(assert (= (or b!171612 bm!17448) bm!17447))

(assert (= (or b!171609 bm!17447) bm!17449))

(assert (= (and bm!17449 c!30713) b!171608))

(assert (= (and bm!17449 (not c!30713)) b!171613))

(assert (= (and d!52115 res!81505) b!171615))

(assert (= (and b!171615 res!81506) b!171617))

(declare-fun m!199943 () Bool)

(assert (=> b!171608 m!199943))

(declare-fun m!199945 () Bool)

(assert (=> b!171617 m!199945))

(declare-fun m!199947 () Bool)

(assert (=> bm!17449 m!199947))

(declare-fun m!199949 () Bool)

(assert (=> b!171615 m!199949))

(declare-fun m!199951 () Bool)

(assert (=> d!52115 m!199951))

(declare-fun m!199953 () Bool)

(assert (=> d!52115 m!199953))

(assert (=> d!51697 d!52115))

(declare-fun d!52117 () Bool)

(assert (=> d!52117 (= (get!1933 (getValueByKey!182 (toList!1091 (+!238 lt!84972 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))) lt!84986)) (v!3908 (getValueByKey!182 (toList!1091 (+!238 lt!84972 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))) lt!84986)))))

(assert (=> d!51743 d!52117))

(declare-fun b!171618 () Bool)

(declare-fun e!113263 () Option!188)

(assert (=> b!171618 (= e!113263 (Some!187 (_2!1627 (h!2816 (toList!1091 (+!238 lt!84972 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))))))))

(declare-fun e!113264 () Option!188)

(declare-fun b!171620 () Bool)

(assert (=> b!171620 (= e!113264 (getValueByKey!182 (t!6996 (toList!1091 (+!238 lt!84972 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))) lt!84986))))

(declare-fun b!171621 () Bool)

(assert (=> b!171621 (= e!113264 None!186)))

(declare-fun d!52119 () Bool)

(declare-fun c!30714 () Bool)

(assert (=> d!52119 (= c!30714 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84972 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))) (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84972 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))) lt!84986)))))

(assert (=> d!52119 (= (getValueByKey!182 (toList!1091 (+!238 lt!84972 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))) lt!84986) e!113263)))

(declare-fun b!171619 () Bool)

(assert (=> b!171619 (= e!113263 e!113264)))

(declare-fun c!30715 () Bool)

(assert (=> b!171619 (= c!30715 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84972 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))) (not (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84972 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))) lt!84986))))))

(assert (= (and d!52119 c!30714) b!171618))

(assert (= (and d!52119 (not c!30714)) b!171619))

(assert (= (and b!171619 c!30715) b!171620))

(assert (= (and b!171619 (not c!30715)) b!171621))

(declare-fun m!199955 () Bool)

(assert (=> b!171620 m!199955))

(assert (=> d!51743 d!52119))

(declare-fun d!52121 () Bool)

(declare-fun lt!85343 () Bool)

(assert (=> d!52121 (= lt!85343 (select (content!147 (toList!1091 lt!85093)) (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun e!113266 () Bool)

(assert (=> d!52121 (= lt!85343 e!113266)))

(declare-fun res!81507 () Bool)

(assert (=> d!52121 (=> (not res!81507) (not e!113266))))

(assert (=> d!52121 (= res!81507 ((_ is Cons!2199) (toList!1091 lt!85093)))))

(assert (=> d!52121 (= (contains!1144 (toList!1091 lt!85093) (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85343)))

(declare-fun b!171622 () Bool)

(declare-fun e!113265 () Bool)

(assert (=> b!171622 (= e!113266 e!113265)))

(declare-fun res!81508 () Bool)

(assert (=> b!171622 (=> res!81508 e!113265)))

(assert (=> b!171622 (= res!81508 (= (h!2816 (toList!1091 lt!85093)) (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171623 () Bool)

(assert (=> b!171623 (= e!113265 (contains!1144 (t!6996 (toList!1091 lt!85093)) (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (= (and d!52121 res!81507) b!171622))

(assert (= (and b!171622 (not res!81508)) b!171623))

(declare-fun m!199957 () Bool)

(assert (=> d!52121 m!199957))

(declare-fun m!199959 () Bool)

(assert (=> d!52121 m!199959))

(declare-fun m!199961 () Bool)

(assert (=> b!171623 m!199961))

(assert (=> b!171067 d!52121))

(declare-fun d!52123 () Bool)

(declare-fun c!30716 () Bool)

(assert (=> d!52123 (= c!30716 ((_ is Nil!2200) (toList!1091 lt!84992)))))

(declare-fun e!113267 () (InoxSet tuple2!3232))

(assert (=> d!52123 (= (content!147 (toList!1091 lt!84992)) e!113267)))

(declare-fun b!171624 () Bool)

(assert (=> b!171624 (= e!113267 ((as const (Array tuple2!3232 Bool)) false))))

(declare-fun b!171625 () Bool)

(assert (=> b!171625 (= e!113267 ((_ map or) (store ((as const (Array tuple2!3232 Bool)) false) (h!2816 (toList!1091 lt!84992)) true) (content!147 (t!6996 (toList!1091 lt!84992)))))))

(assert (= (and d!52123 c!30716) b!171624))

(assert (= (and d!52123 (not c!30716)) b!171625))

(declare-fun m!199963 () Bool)

(assert (=> b!171625 m!199963))

(declare-fun m!199965 () Bool)

(assert (=> b!171625 m!199965))

(assert (=> d!51665 d!52123))

(declare-fun d!52125 () Bool)

(declare-fun e!113269 () Bool)

(assert (=> d!52125 e!113269))

(declare-fun res!81509 () Bool)

(assert (=> d!52125 (=> res!81509 e!113269)))

(declare-fun lt!85347 () Bool)

(assert (=> d!52125 (= res!81509 (not lt!85347))))

(declare-fun lt!85345 () Bool)

(assert (=> d!52125 (= lt!85347 lt!85345)))

(declare-fun lt!85344 () Unit!5227)

(declare-fun e!113268 () Unit!5227)

(assert (=> d!52125 (= lt!85344 e!113268)))

(declare-fun c!30717 () Bool)

(assert (=> d!52125 (= c!30717 lt!85345)))

(assert (=> d!52125 (= lt!85345 (containsKey!186 (toList!1091 lt!85162) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52125 (= (contains!1142 lt!85162 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85347)))

(declare-fun b!171626 () Bool)

(declare-fun lt!85346 () Unit!5227)

(assert (=> b!171626 (= e!113268 lt!85346)))

(assert (=> b!171626 (= lt!85346 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85162) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171626 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85162) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171627 () Bool)

(declare-fun Unit!5264 () Unit!5227)

(assert (=> b!171627 (= e!113268 Unit!5264)))

(declare-fun b!171628 () Bool)

(assert (=> b!171628 (= e!113269 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85162) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52125 c!30717) b!171626))

(assert (= (and d!52125 (not c!30717)) b!171627))

(assert (= (and d!52125 (not res!81509)) b!171628))

(declare-fun m!199967 () Bool)

(assert (=> d!52125 m!199967))

(declare-fun m!199969 () Bool)

(assert (=> b!171626 m!199969))

(assert (=> b!171626 m!199635))

(assert (=> b!171626 m!199635))

(declare-fun m!199971 () Bool)

(assert (=> b!171626 m!199971))

(assert (=> b!171628 m!199635))

(assert (=> b!171628 m!199635))

(assert (=> b!171628 m!199971))

(assert (=> bm!17419 d!52125))

(declare-fun lt!85348 () Bool)

(declare-fun d!52127 () Bool)

(assert (=> d!52127 (= lt!85348 (select (content!147 lt!84895) (tuple2!3233 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309)))))))

(declare-fun e!113271 () Bool)

(assert (=> d!52127 (= lt!85348 e!113271)))

(declare-fun res!81510 () Bool)

(assert (=> d!52127 (=> (not res!81510) (not e!113271))))

(assert (=> d!52127 (= res!81510 ((_ is Cons!2199) lt!84895))))

(assert (=> d!52127 (= (contains!1144 lt!84895 (tuple2!3233 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309)))) lt!85348)))

(declare-fun b!171629 () Bool)

(declare-fun e!113270 () Bool)

(assert (=> b!171629 (= e!113271 e!113270)))

(declare-fun res!81511 () Bool)

(assert (=> b!171629 (=> res!81511 e!113270)))

(assert (=> b!171629 (= res!81511 (= (h!2816 lt!84895) (tuple2!3233 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309)))))))

(declare-fun b!171630 () Bool)

(assert (=> b!171630 (= e!113270 (contains!1144 (t!6996 lt!84895) (tuple2!3233 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309)))))))

(assert (= (and d!52127 res!81510) b!171629))

(assert (= (and b!171629 (not res!81511)) b!171630))

(declare-fun m!199973 () Bool)

(assert (=> d!52127 m!199973))

(declare-fun m!199975 () Bool)

(assert (=> d!52127 m!199975))

(declare-fun m!199977 () Bool)

(assert (=> b!171630 m!199977))

(assert (=> b!171028 d!52127))

(assert (=> b!171070 d!51925))

(assert (=> b!171070 d!51659))

(declare-fun d!52129 () Bool)

(declare-fun lt!85349 () Bool)

(assert (=> d!52129 (= lt!85349 (select (content!147 (toList!1091 lt!85115)) (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))))

(declare-fun e!113273 () Bool)

(assert (=> d!52129 (= lt!85349 e!113273)))

(declare-fun res!81512 () Bool)

(assert (=> d!52129 (=> (not res!81512) (not e!113273))))

(assert (=> d!52129 (= res!81512 ((_ is Cons!2199) (toList!1091 lt!85115)))))

(assert (=> d!52129 (= (contains!1144 (toList!1091 lt!85115) (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))) lt!85349)))

(declare-fun b!171631 () Bool)

(declare-fun e!113272 () Bool)

(assert (=> b!171631 (= e!113273 e!113272)))

(declare-fun res!81513 () Bool)

(assert (=> b!171631 (=> res!81513 e!113272)))

(assert (=> b!171631 (= res!81513 (= (h!2816 (toList!1091 lt!85115)) (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))))

(declare-fun b!171632 () Bool)

(assert (=> b!171632 (= e!113272 (contains!1144 (t!6996 (toList!1091 lt!85115)) (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))))

(assert (= (and d!52129 res!81512) b!171631))

(assert (= (and b!171631 (not res!81513)) b!171632))

(declare-fun m!199979 () Bool)

(assert (=> d!52129 m!199979))

(declare-fun m!199981 () Bool)

(assert (=> d!52129 m!199981))

(declare-fun m!199983 () Bool)

(assert (=> b!171632 m!199983))

(assert (=> b!171119 d!52129))

(declare-fun b!171633 () Bool)

(declare-fun e!113274 () Option!188)

(assert (=> b!171633 (= e!113274 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!85173)))))))

(declare-fun b!171635 () Bool)

(declare-fun e!113275 () Option!188)

(assert (=> b!171635 (= e!113275 (getValueByKey!182 (t!6996 (toList!1091 lt!85173)) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171636 () Bool)

(assert (=> b!171636 (= e!113275 None!186)))

(declare-fun d!52131 () Bool)

(declare-fun c!30718 () Bool)

(assert (=> d!52131 (= c!30718 (and ((_ is Cons!2199) (toList!1091 lt!85173)) (= (_1!1627 (h!2816 (toList!1091 lt!85173))) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!52131 (= (getValueByKey!182 (toList!1091 lt!85173) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) e!113274)))

(declare-fun b!171634 () Bool)

(assert (=> b!171634 (= e!113274 e!113275)))

(declare-fun c!30719 () Bool)

(assert (=> b!171634 (= c!30719 (and ((_ is Cons!2199) (toList!1091 lt!85173)) (not (= (_1!1627 (h!2816 (toList!1091 lt!85173))) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52131 c!30718) b!171633))

(assert (= (and d!52131 (not c!30718)) b!171634))

(assert (= (and b!171634 c!30719) b!171635))

(assert (= (and b!171634 (not c!30719)) b!171636))

(declare-fun m!199985 () Bool)

(assert (=> b!171635 m!199985))

(assert (=> b!171190 d!52131))

(declare-fun d!52133 () Bool)

(declare-fun lt!85350 () Bool)

(assert (=> d!52133 (= lt!85350 (select (content!147 (t!6996 (toList!1091 lt!84992))) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun e!113277 () Bool)

(assert (=> d!52133 (= lt!85350 e!113277)))

(declare-fun res!81514 () Bool)

(assert (=> d!52133 (=> (not res!81514) (not e!113277))))

(assert (=> d!52133 (= res!81514 ((_ is Cons!2199) (t!6996 (toList!1091 lt!84992))))))

(assert (=> d!52133 (= (contains!1144 (t!6996 (toList!1091 lt!84992)) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!85350)))

(declare-fun b!171637 () Bool)

(declare-fun e!113276 () Bool)

(assert (=> b!171637 (= e!113277 e!113276)))

(declare-fun res!81515 () Bool)

(assert (=> b!171637 (=> res!81515 e!113276)))

(assert (=> b!171637 (= res!81515 (= (h!2816 (t!6996 (toList!1091 lt!84992))) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!171638 () Bool)

(assert (=> b!171638 (= e!113276 (contains!1144 (t!6996 (t!6996 (toList!1091 lt!84992))) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!52133 res!81514) b!171637))

(assert (= (and b!171637 (not res!81515)) b!171638))

(assert (=> d!52133 m!199965))

(declare-fun m!199987 () Bool)

(assert (=> d!52133 m!199987))

(declare-fun m!199989 () Bool)

(assert (=> b!171638 m!199989))

(assert (=> b!170948 d!52133))

(declare-fun d!52135 () Bool)

(assert (=> d!52135 (= (apply!129 (+!238 lt!84967 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))) lt!84979) (apply!129 lt!84967 lt!84979))))

(assert (=> d!52135 true))

(declare-fun _$34!1052 () Unit!5227)

(assert (=> d!52135 (= (choose!931 lt!84967 lt!84988 (minValue!3397 thiss!1248) lt!84979) _$34!1052)))

(declare-fun bs!7074 () Bool)

(assert (= bs!7074 d!52135))

(assert (=> bs!7074 m!198737))

(assert (=> bs!7074 m!198737))

(assert (=> bs!7074 m!198759))

(assert (=> bs!7074 m!198739))

(assert (=> d!51753 d!52135))

(assert (=> d!51753 d!51747))

(assert (=> d!51753 d!51749))

(assert (=> d!51753 d!51751))

(declare-fun d!52137 () Bool)

(declare-fun e!113279 () Bool)

(assert (=> d!52137 e!113279))

(declare-fun res!81516 () Bool)

(assert (=> d!52137 (=> res!81516 e!113279)))

(declare-fun lt!85354 () Bool)

(assert (=> d!52137 (= res!81516 (not lt!85354))))

(declare-fun lt!85352 () Bool)

(assert (=> d!52137 (= lt!85354 lt!85352)))

(declare-fun lt!85351 () Unit!5227)

(declare-fun e!113278 () Unit!5227)

(assert (=> d!52137 (= lt!85351 e!113278)))

(declare-fun c!30720 () Bool)

(assert (=> d!52137 (= c!30720 lt!85352)))

(assert (=> d!52137 (= lt!85352 (containsKey!186 (toList!1091 lt!84967) lt!84979))))

(assert (=> d!52137 (= (contains!1142 lt!84967 lt!84979) lt!85354)))

(declare-fun b!171639 () Bool)

(declare-fun lt!85353 () Unit!5227)

(assert (=> b!171639 (= e!113278 lt!85353)))

(assert (=> b!171639 (= lt!85353 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84967) lt!84979))))

(assert (=> b!171639 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84967) lt!84979))))

(declare-fun b!171640 () Bool)

(declare-fun Unit!5265 () Unit!5227)

(assert (=> b!171640 (= e!113278 Unit!5265)))

(declare-fun b!171641 () Bool)

(assert (=> b!171641 (= e!113279 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84967) lt!84979)))))

(assert (= (and d!52137 c!30720) b!171639))

(assert (= (and d!52137 (not c!30720)) b!171640))

(assert (= (and d!52137 (not res!81516)) b!171641))

(declare-fun m!199991 () Bool)

(assert (=> d!52137 m!199991))

(declare-fun m!199993 () Bool)

(assert (=> b!171639 m!199993))

(assert (=> b!171639 m!199109))

(assert (=> b!171639 m!199109))

(declare-fun m!199995 () Bool)

(assert (=> b!171639 m!199995))

(assert (=> b!171641 m!199109))

(assert (=> b!171641 m!199109))

(assert (=> b!171641 m!199995))

(assert (=> d!51753 d!52137))

(declare-fun d!52139 () Bool)

(assert (=> d!52139 (= (get!1933 (getValueByKey!182 (toList!1091 lt!84987) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3908 (getValueByKey!182 (toList!1091 lt!84987) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51661 d!52139))

(assert (=> d!51661 d!52011))

(declare-fun d!52141 () Bool)

(declare-fun lt!85355 () Bool)

(assert (=> d!52141 (= lt!85355 (select (content!148 Nil!2202) (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(declare-fun e!113280 () Bool)

(assert (=> d!52141 (= lt!85355 e!113280)))

(declare-fun res!81518 () Bool)

(assert (=> d!52141 (=> (not res!81518) (not e!113280))))

(assert (=> d!52141 (= res!81518 ((_ is Cons!2201) Nil!2202))))

(assert (=> d!52141 (= (contains!1145 Nil!2202 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)) lt!85355)))

(declare-fun b!171642 () Bool)

(declare-fun e!113281 () Bool)

(assert (=> b!171642 (= e!113280 e!113281)))

(declare-fun res!81517 () Bool)

(assert (=> b!171642 (=> res!81517 e!113281)))

(assert (=> b!171642 (= res!81517 (= (h!2818 Nil!2202) (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(declare-fun b!171643 () Bool)

(assert (=> b!171643 (= e!113281 (contains!1145 (t!7000 Nil!2202) (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000)))))

(assert (= (and d!52141 res!81518) b!171642))

(assert (= (and b!171642 (not res!81517)) b!171643))

(assert (=> d!52141 m!199383))

(assert (=> d!52141 m!199007))

(declare-fun m!199997 () Bool)

(assert (=> d!52141 m!199997))

(assert (=> b!171643 m!199007))

(declare-fun m!199999 () Bool)

(assert (=> b!171643 m!199999))

(assert (=> b!171087 d!52141))

(declare-fun d!52143 () Bool)

(assert (=> d!52143 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84987) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!85356 () Unit!5227)

(assert (=> d!52143 (= lt!85356 (choose!930 (toList!1091 lt!84987) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!113282 () Bool)

(assert (=> d!52143 e!113282))

(declare-fun res!81519 () Bool)

(assert (=> d!52143 (=> (not res!81519) (not e!113282))))

(assert (=> d!52143 (= res!81519 (isStrictlySorted!326 (toList!1091 lt!84987)))))

(assert (=> d!52143 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84987) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) lt!85356)))

(declare-fun b!171644 () Bool)

(assert (=> b!171644 (= e!113282 (containsKey!186 (toList!1091 lt!84987) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52143 res!81519) b!171644))

(assert (=> d!52143 m!198643))

(assert (=> d!52143 m!198791))

(assert (=> d!52143 m!198791))

(assert (=> d!52143 m!198815))

(assert (=> d!52143 m!198643))

(declare-fun m!200001 () Bool)

(assert (=> d!52143 m!200001))

(assert (=> d!52143 m!199731))

(assert (=> b!171644 m!198643))

(assert (=> b!171644 m!198811))

(assert (=> b!170913 d!52143))

(assert (=> b!170913 d!51897))

(assert (=> b!170913 d!51899))

(declare-fun d!52145 () Bool)

(declare-fun e!113284 () Bool)

(assert (=> d!52145 e!113284))

(declare-fun res!81520 () Bool)

(assert (=> d!52145 (=> res!81520 e!113284)))

(declare-fun lt!85360 () Bool)

(assert (=> d!52145 (= res!81520 (not lt!85360))))

(declare-fun lt!85358 () Bool)

(assert (=> d!52145 (= lt!85360 lt!85358)))

(declare-fun lt!85357 () Unit!5227)

(declare-fun e!113283 () Unit!5227)

(assert (=> d!52145 (= lt!85357 e!113283)))

(declare-fun c!30721 () Bool)

(assert (=> d!52145 (= c!30721 lt!85358)))

(assert (=> d!52145 (= lt!85358 (containsKey!186 (toList!1091 lt!85104) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52145 (= (contains!1142 lt!85104 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) lt!85360)))

(declare-fun b!171645 () Bool)

(declare-fun lt!85359 () Unit!5227)

(assert (=> b!171645 (= e!113283 lt!85359)))

(assert (=> b!171645 (= lt!85359 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85104) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171645 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85104) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171646 () Bool)

(declare-fun Unit!5266 () Unit!5227)

(assert (=> b!171646 (= e!113283 Unit!5266)))

(declare-fun b!171647 () Bool)

(assert (=> b!171647 (= e!113284 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85104) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!52145 c!30721) b!171645))

(assert (= (and d!52145 (not c!30721)) b!171646))

(assert (= (and d!52145 (not res!81520)) b!171647))

(assert (=> d!52145 m!198643))

(declare-fun m!200003 () Bool)

(assert (=> d!52145 m!200003))

(assert (=> b!171645 m!198643))

(declare-fun m!200005 () Bool)

(assert (=> b!171645 m!200005))

(assert (=> b!171645 m!198643))

(declare-fun m!200007 () Bool)

(assert (=> b!171645 m!200007))

(assert (=> b!171645 m!200007))

(declare-fun m!200009 () Bool)

(assert (=> b!171645 m!200009))

(assert (=> b!171647 m!198643))

(assert (=> b!171647 m!200007))

(assert (=> b!171647 m!200007))

(assert (=> b!171647 m!200009))

(assert (=> b!171094 d!52145))

(declare-fun b!171648 () Bool)

(declare-fun e!113285 () Option!188)

(assert (=> b!171648 (= e!113285 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!85043)))))))

(declare-fun e!113286 () Option!188)

(declare-fun b!171650 () Bool)

(assert (=> b!171650 (= e!113286 (getValueByKey!182 (t!6996 (toList!1091 lt!85043)) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))

(declare-fun b!171651 () Bool)

(assert (=> b!171651 (= e!113286 None!186)))

(declare-fun d!52147 () Bool)

(declare-fun c!30722 () Bool)

(assert (=> d!52147 (= c!30722 (and ((_ is Cons!2199) (toList!1091 lt!85043)) (= (_1!1627 (h!2816 (toList!1091 lt!85043))) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))))))

(assert (=> d!52147 (= (getValueByKey!182 (toList!1091 lt!85043) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))) e!113285)))

(declare-fun b!171649 () Bool)

(assert (=> b!171649 (= e!113285 e!113286)))

(declare-fun c!30723 () Bool)

(assert (=> b!171649 (= c!30723 (and ((_ is Cons!2199) (toList!1091 lt!85043)) (not (= (_1!1627 (h!2816 (toList!1091 lt!85043))) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52147 c!30722) b!171648))

(assert (= (and d!52147 (not c!30722)) b!171649))

(assert (= (and b!171649 c!30723) b!171650))

(assert (= (and b!171649 (not c!30723)) b!171651))

(declare-fun m!200011 () Bool)

(assert (=> b!171650 m!200011))

(assert (=> b!170996 d!52147))

(declare-fun d!52149 () Bool)

(assert (=> d!52149 (= (apply!129 (+!238 lt!85147 (tuple2!3233 lt!85144 (zeroValue!3397 lt!84854))) lt!85161) (get!1933 (getValueByKey!182 (toList!1091 (+!238 lt!85147 (tuple2!3233 lt!85144 (zeroValue!3397 lt!84854)))) lt!85161)))))

(declare-fun bs!7075 () Bool)

(assert (= bs!7075 d!52149))

(declare-fun m!200013 () Bool)

(assert (=> bs!7075 m!200013))

(assert (=> bs!7075 m!200013))

(declare-fun m!200015 () Bool)

(assert (=> bs!7075 m!200015))

(assert (=> b!171158 d!52149))

(declare-fun d!52151 () Bool)

(assert (=> d!52151 (= (apply!129 (+!238 lt!85142 (tuple2!3233 lt!85163 (minValue!3397 lt!84854))) lt!85154) (apply!129 lt!85142 lt!85154))))

(declare-fun lt!85361 () Unit!5227)

(assert (=> d!52151 (= lt!85361 (choose!931 lt!85142 lt!85163 (minValue!3397 lt!84854) lt!85154))))

(declare-fun e!113287 () Bool)

(assert (=> d!52151 e!113287))

(declare-fun res!81521 () Bool)

(assert (=> d!52151 (=> (not res!81521) (not e!113287))))

(assert (=> d!52151 (= res!81521 (contains!1142 lt!85142 lt!85154))))

(assert (=> d!52151 (= (addApplyDifferent!105 lt!85142 lt!85163 (minValue!3397 lt!84854) lt!85154) lt!85361)))

(declare-fun b!171652 () Bool)

(assert (=> b!171652 (= e!113287 (not (= lt!85154 lt!85163)))))

(assert (= (and d!52151 res!81521) b!171652))

(assert (=> d!52151 m!199239))

(assert (=> d!52151 m!199237))

(declare-fun m!200017 () Bool)

(assert (=> d!52151 m!200017))

(assert (=> d!52151 m!199237))

(assert (=> d!52151 m!199259))

(declare-fun m!200019 () Bool)

(assert (=> d!52151 m!200019))

(assert (=> b!171158 d!52151))

(declare-fun d!52153 () Bool)

(assert (=> d!52153 (= (apply!129 lt!85148 lt!85143) (get!1933 (getValueByKey!182 (toList!1091 lt!85148) lt!85143)))))

(declare-fun bs!7076 () Bool)

(assert (= bs!7076 d!52153))

(declare-fun m!200021 () Bool)

(assert (=> bs!7076 m!200021))

(assert (=> bs!7076 m!200021))

(declare-fun m!200023 () Bool)

(assert (=> bs!7076 m!200023))

(assert (=> b!171158 d!52153))

(declare-fun d!52155 () Bool)

(assert (=> d!52155 (= (apply!129 lt!85147 lt!85161) (get!1933 (getValueByKey!182 (toList!1091 lt!85147) lt!85161)))))

(declare-fun bs!7077 () Bool)

(assert (= bs!7077 d!52155))

(declare-fun m!200025 () Bool)

(assert (=> bs!7077 m!200025))

(assert (=> bs!7077 m!200025))

(declare-fun m!200027 () Bool)

(assert (=> bs!7077 m!200027))

(assert (=> b!171158 d!52155))

(declare-fun d!52157 () Bool)

(assert (=> d!52157 (= (apply!129 (+!238 lt!85142 (tuple2!3233 lt!85163 (minValue!3397 lt!84854))) lt!85154) (get!1933 (getValueByKey!182 (toList!1091 (+!238 lt!85142 (tuple2!3233 lt!85163 (minValue!3397 lt!84854)))) lt!85154)))))

(declare-fun bs!7078 () Bool)

(assert (= bs!7078 d!52157))

(declare-fun m!200029 () Bool)

(assert (=> bs!7078 m!200029))

(assert (=> bs!7078 m!200029))

(declare-fun m!200031 () Bool)

(assert (=> bs!7078 m!200031))

(assert (=> b!171158 d!52157))

(declare-fun d!52159 () Bool)

(declare-fun e!113289 () Bool)

(assert (=> d!52159 e!113289))

(declare-fun res!81522 () Bool)

(assert (=> d!52159 (=> res!81522 e!113289)))

(declare-fun lt!85365 () Bool)

(assert (=> d!52159 (= res!81522 (not lt!85365))))

(declare-fun lt!85363 () Bool)

(assert (=> d!52159 (= lt!85365 lt!85363)))

(declare-fun lt!85362 () Unit!5227)

(declare-fun e!113288 () Unit!5227)

(assert (=> d!52159 (= lt!85362 e!113288)))

(declare-fun c!30724 () Bool)

(assert (=> d!52159 (= c!30724 lt!85363)))

(assert (=> d!52159 (= lt!85363 (containsKey!186 (toList!1091 (+!238 lt!85160 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854)))) lt!85149))))

(assert (=> d!52159 (= (contains!1142 (+!238 lt!85160 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854))) lt!85149) lt!85365)))

(declare-fun b!171653 () Bool)

(declare-fun lt!85364 () Unit!5227)

(assert (=> b!171653 (= e!113288 lt!85364)))

(assert (=> b!171653 (= lt!85364 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 (+!238 lt!85160 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854)))) lt!85149))))

(assert (=> b!171653 (isDefined!136 (getValueByKey!182 (toList!1091 (+!238 lt!85160 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854)))) lt!85149))))

(declare-fun b!171654 () Bool)

(declare-fun Unit!5267 () Unit!5227)

(assert (=> b!171654 (= e!113288 Unit!5267)))

(declare-fun b!171655 () Bool)

(assert (=> b!171655 (= e!113289 (isDefined!136 (getValueByKey!182 (toList!1091 (+!238 lt!85160 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854)))) lt!85149)))))

(assert (= (and d!52159 c!30724) b!171653))

(assert (= (and d!52159 (not c!30724)) b!171654))

(assert (= (and d!52159 (not res!81522)) b!171655))

(declare-fun m!200033 () Bool)

(assert (=> d!52159 m!200033))

(declare-fun m!200035 () Bool)

(assert (=> b!171653 m!200035))

(declare-fun m!200037 () Bool)

(assert (=> b!171653 m!200037))

(assert (=> b!171653 m!200037))

(declare-fun m!200039 () Bool)

(assert (=> b!171653 m!200039))

(assert (=> b!171655 m!200037))

(assert (=> b!171655 m!200037))

(assert (=> b!171655 m!200039))

(assert (=> b!171158 d!52159))

(declare-fun d!52161 () Bool)

(declare-fun e!113290 () Bool)

(assert (=> d!52161 e!113290))

(declare-fun res!81524 () Bool)

(assert (=> d!52161 (=> (not res!81524) (not e!113290))))

(declare-fun lt!85369 () ListLongMap!2151)

(assert (=> d!52161 (= res!81524 (contains!1142 lt!85369 (_1!1627 (tuple2!3233 lt!85163 (minValue!3397 lt!84854)))))))

(declare-fun lt!85367 () List!2203)

(assert (=> d!52161 (= lt!85369 (ListLongMap!2152 lt!85367))))

(declare-fun lt!85368 () Unit!5227)

(declare-fun lt!85366 () Unit!5227)

(assert (=> d!52161 (= lt!85368 lt!85366)))

(assert (=> d!52161 (= (getValueByKey!182 lt!85367 (_1!1627 (tuple2!3233 lt!85163 (minValue!3397 lt!84854)))) (Some!187 (_2!1627 (tuple2!3233 lt!85163 (minValue!3397 lt!84854)))))))

(assert (=> d!52161 (= lt!85366 (lemmaContainsTupThenGetReturnValue!98 lt!85367 (_1!1627 (tuple2!3233 lt!85163 (minValue!3397 lt!84854))) (_2!1627 (tuple2!3233 lt!85163 (minValue!3397 lt!84854)))))))

(assert (=> d!52161 (= lt!85367 (insertStrictlySorted!101 (toList!1091 lt!85142) (_1!1627 (tuple2!3233 lt!85163 (minValue!3397 lt!84854))) (_2!1627 (tuple2!3233 lt!85163 (minValue!3397 lt!84854)))))))

(assert (=> d!52161 (= (+!238 lt!85142 (tuple2!3233 lt!85163 (minValue!3397 lt!84854))) lt!85369)))

(declare-fun b!171656 () Bool)

(declare-fun res!81523 () Bool)

(assert (=> b!171656 (=> (not res!81523) (not e!113290))))

(assert (=> b!171656 (= res!81523 (= (getValueByKey!182 (toList!1091 lt!85369) (_1!1627 (tuple2!3233 lt!85163 (minValue!3397 lt!84854)))) (Some!187 (_2!1627 (tuple2!3233 lt!85163 (minValue!3397 lt!84854))))))))

(declare-fun b!171657 () Bool)

(assert (=> b!171657 (= e!113290 (contains!1144 (toList!1091 lt!85369) (tuple2!3233 lt!85163 (minValue!3397 lt!84854))))))

(assert (= (and d!52161 res!81524) b!171656))

(assert (= (and b!171656 res!81523) b!171657))

(declare-fun m!200041 () Bool)

(assert (=> d!52161 m!200041))

(declare-fun m!200043 () Bool)

(assert (=> d!52161 m!200043))

(declare-fun m!200045 () Bool)

(assert (=> d!52161 m!200045))

(declare-fun m!200047 () Bool)

(assert (=> d!52161 m!200047))

(declare-fun m!200049 () Bool)

(assert (=> b!171656 m!200049))

(declare-fun m!200051 () Bool)

(assert (=> b!171657 m!200051))

(assert (=> b!171158 d!52161))

(declare-fun d!52163 () Bool)

(assert (=> d!52163 (= (apply!129 (+!238 lt!85148 (tuple2!3233 lt!85146 (minValue!3397 lt!84854))) lt!85143) (get!1933 (getValueByKey!182 (toList!1091 (+!238 lt!85148 (tuple2!3233 lt!85146 (minValue!3397 lt!84854)))) lt!85143)))))

(declare-fun bs!7079 () Bool)

(assert (= bs!7079 d!52163))

(declare-fun m!200053 () Bool)

(assert (=> bs!7079 m!200053))

(assert (=> bs!7079 m!200053))

(declare-fun m!200055 () Bool)

(assert (=> bs!7079 m!200055))

(assert (=> b!171158 d!52163))

(declare-fun d!52165 () Bool)

(assert (=> d!52165 (= (apply!129 (+!238 lt!85148 (tuple2!3233 lt!85146 (minValue!3397 lt!84854))) lt!85143) (apply!129 lt!85148 lt!85143))))

(declare-fun lt!85370 () Unit!5227)

(assert (=> d!52165 (= lt!85370 (choose!931 lt!85148 lt!85146 (minValue!3397 lt!84854) lt!85143))))

(declare-fun e!113291 () Bool)

(assert (=> d!52165 e!113291))

(declare-fun res!81525 () Bool)

(assert (=> d!52165 (=> (not res!81525) (not e!113291))))

(assert (=> d!52165 (= res!81525 (contains!1142 lt!85148 lt!85143))))

(assert (=> d!52165 (= (addApplyDifferent!105 lt!85148 lt!85146 (minValue!3397 lt!84854) lt!85143) lt!85370)))

(declare-fun b!171658 () Bool)

(assert (=> b!171658 (= e!113291 (not (= lt!85143 lt!85146)))))

(assert (= (and d!52165 res!81525) b!171658))

(assert (=> d!52165 m!199231))

(assert (=> d!52165 m!199235))

(declare-fun m!200057 () Bool)

(assert (=> d!52165 m!200057))

(assert (=> d!52165 m!199235))

(assert (=> d!52165 m!199243))

(declare-fun m!200059 () Bool)

(assert (=> d!52165 m!200059))

(assert (=> b!171158 d!52165))

(declare-fun d!52167 () Bool)

(declare-fun e!113292 () Bool)

(assert (=> d!52167 e!113292))

(declare-fun res!81527 () Bool)

(assert (=> d!52167 (=> (not res!81527) (not e!113292))))

(declare-fun lt!85374 () ListLongMap!2151)

(assert (=> d!52167 (= res!81527 (contains!1142 lt!85374 (_1!1627 (tuple2!3233 lt!85146 (minValue!3397 lt!84854)))))))

(declare-fun lt!85372 () List!2203)

(assert (=> d!52167 (= lt!85374 (ListLongMap!2152 lt!85372))))

(declare-fun lt!85373 () Unit!5227)

(declare-fun lt!85371 () Unit!5227)

(assert (=> d!52167 (= lt!85373 lt!85371)))

(assert (=> d!52167 (= (getValueByKey!182 lt!85372 (_1!1627 (tuple2!3233 lt!85146 (minValue!3397 lt!84854)))) (Some!187 (_2!1627 (tuple2!3233 lt!85146 (minValue!3397 lt!84854)))))))

(assert (=> d!52167 (= lt!85371 (lemmaContainsTupThenGetReturnValue!98 lt!85372 (_1!1627 (tuple2!3233 lt!85146 (minValue!3397 lt!84854))) (_2!1627 (tuple2!3233 lt!85146 (minValue!3397 lt!84854)))))))

(assert (=> d!52167 (= lt!85372 (insertStrictlySorted!101 (toList!1091 lt!85148) (_1!1627 (tuple2!3233 lt!85146 (minValue!3397 lt!84854))) (_2!1627 (tuple2!3233 lt!85146 (minValue!3397 lt!84854)))))))

(assert (=> d!52167 (= (+!238 lt!85148 (tuple2!3233 lt!85146 (minValue!3397 lt!84854))) lt!85374)))

(declare-fun b!171659 () Bool)

(declare-fun res!81526 () Bool)

(assert (=> b!171659 (=> (not res!81526) (not e!113292))))

(assert (=> b!171659 (= res!81526 (= (getValueByKey!182 (toList!1091 lt!85374) (_1!1627 (tuple2!3233 lt!85146 (minValue!3397 lt!84854)))) (Some!187 (_2!1627 (tuple2!3233 lt!85146 (minValue!3397 lt!84854))))))))

(declare-fun b!171660 () Bool)

(assert (=> b!171660 (= e!113292 (contains!1144 (toList!1091 lt!85374) (tuple2!3233 lt!85146 (minValue!3397 lt!84854))))))

(assert (= (and d!52167 res!81527) b!171659))

(assert (= (and b!171659 res!81526) b!171660))

(declare-fun m!200061 () Bool)

(assert (=> d!52167 m!200061))

(declare-fun m!200063 () Bool)

(assert (=> d!52167 m!200063))

(declare-fun m!200065 () Bool)

(assert (=> d!52167 m!200065))

(declare-fun m!200067 () Bool)

(assert (=> d!52167 m!200067))

(declare-fun m!200069 () Bool)

(assert (=> b!171659 m!200069))

(declare-fun m!200071 () Bool)

(assert (=> b!171660 m!200071))

(assert (=> b!171158 d!52167))

(declare-fun d!52169 () Bool)

(declare-fun e!113293 () Bool)

(assert (=> d!52169 e!113293))

(declare-fun res!81529 () Bool)

(assert (=> d!52169 (=> (not res!81529) (not e!113293))))

(declare-fun lt!85378 () ListLongMap!2151)

(assert (=> d!52169 (= res!81529 (contains!1142 lt!85378 (_1!1627 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854)))))))

(declare-fun lt!85376 () List!2203)

(assert (=> d!52169 (= lt!85378 (ListLongMap!2152 lt!85376))))

(declare-fun lt!85377 () Unit!5227)

(declare-fun lt!85375 () Unit!5227)

(assert (=> d!52169 (= lt!85377 lt!85375)))

(assert (=> d!52169 (= (getValueByKey!182 lt!85376 (_1!1627 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854)))) (Some!187 (_2!1627 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854)))))))

(assert (=> d!52169 (= lt!85375 (lemmaContainsTupThenGetReturnValue!98 lt!85376 (_1!1627 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854))) (_2!1627 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854)))))))

(assert (=> d!52169 (= lt!85376 (insertStrictlySorted!101 (toList!1091 lt!85160) (_1!1627 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854))) (_2!1627 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854)))))))

(assert (=> d!52169 (= (+!238 lt!85160 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854))) lt!85378)))

(declare-fun b!171661 () Bool)

(declare-fun res!81528 () Bool)

(assert (=> b!171661 (=> (not res!81528) (not e!113293))))

(assert (=> b!171661 (= res!81528 (= (getValueByKey!182 (toList!1091 lt!85378) (_1!1627 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854)))) (Some!187 (_2!1627 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854))))))))

(declare-fun b!171662 () Bool)

(assert (=> b!171662 (= e!113293 (contains!1144 (toList!1091 lt!85378) (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854))))))

(assert (= (and d!52169 res!81529) b!171661))

(assert (= (and b!171661 res!81528) b!171662))

(declare-fun m!200073 () Bool)

(assert (=> d!52169 m!200073))

(declare-fun m!200075 () Bool)

(assert (=> d!52169 m!200075))

(declare-fun m!200077 () Bool)

(assert (=> d!52169 m!200077))

(declare-fun m!200079 () Bool)

(assert (=> d!52169 m!200079))

(declare-fun m!200081 () Bool)

(assert (=> b!171661 m!200081))

(declare-fun m!200083 () Bool)

(assert (=> b!171662 m!200083))

(assert (=> b!171158 d!52169))

(declare-fun d!52171 () Bool)

(assert (=> d!52171 (contains!1142 (+!238 lt!85160 (tuple2!3233 lt!85145 (zeroValue!3397 lt!84854))) lt!85149)))

(declare-fun lt!85379 () Unit!5227)

(assert (=> d!52171 (= lt!85379 (choose!932 lt!85160 lt!85145 (zeroValue!3397 lt!84854) lt!85149))))

(assert (=> d!52171 (contains!1142 lt!85160 lt!85149)))

(assert (=> d!52171 (= (addStillContains!105 lt!85160 lt!85145 (zeroValue!3397 lt!84854) lt!85149) lt!85379)))

(declare-fun bs!7080 () Bool)

(assert (= bs!7080 d!52171))

(assert (=> bs!7080 m!199251))

(assert (=> bs!7080 m!199251))

(assert (=> bs!7080 m!199253))

(declare-fun m!200085 () Bool)

(assert (=> bs!7080 m!200085))

(declare-fun m!200087 () Bool)

(assert (=> bs!7080 m!200087))

(assert (=> b!171158 d!52171))

(declare-fun d!52173 () Bool)

(declare-fun e!113294 () Bool)

(assert (=> d!52173 e!113294))

(declare-fun res!81531 () Bool)

(assert (=> d!52173 (=> (not res!81531) (not e!113294))))

(declare-fun lt!85383 () ListLongMap!2151)

(assert (=> d!52173 (= res!81531 (contains!1142 lt!85383 (_1!1627 (tuple2!3233 lt!85144 (zeroValue!3397 lt!84854)))))))

(declare-fun lt!85381 () List!2203)

(assert (=> d!52173 (= lt!85383 (ListLongMap!2152 lt!85381))))

(declare-fun lt!85382 () Unit!5227)

(declare-fun lt!85380 () Unit!5227)

(assert (=> d!52173 (= lt!85382 lt!85380)))

(assert (=> d!52173 (= (getValueByKey!182 lt!85381 (_1!1627 (tuple2!3233 lt!85144 (zeroValue!3397 lt!84854)))) (Some!187 (_2!1627 (tuple2!3233 lt!85144 (zeroValue!3397 lt!84854)))))))

(assert (=> d!52173 (= lt!85380 (lemmaContainsTupThenGetReturnValue!98 lt!85381 (_1!1627 (tuple2!3233 lt!85144 (zeroValue!3397 lt!84854))) (_2!1627 (tuple2!3233 lt!85144 (zeroValue!3397 lt!84854)))))))

(assert (=> d!52173 (= lt!85381 (insertStrictlySorted!101 (toList!1091 lt!85147) (_1!1627 (tuple2!3233 lt!85144 (zeroValue!3397 lt!84854))) (_2!1627 (tuple2!3233 lt!85144 (zeroValue!3397 lt!84854)))))))

(assert (=> d!52173 (= (+!238 lt!85147 (tuple2!3233 lt!85144 (zeroValue!3397 lt!84854))) lt!85383)))

(declare-fun b!171663 () Bool)

(declare-fun res!81530 () Bool)

(assert (=> b!171663 (=> (not res!81530) (not e!113294))))

(assert (=> b!171663 (= res!81530 (= (getValueByKey!182 (toList!1091 lt!85383) (_1!1627 (tuple2!3233 lt!85144 (zeroValue!3397 lt!84854)))) (Some!187 (_2!1627 (tuple2!3233 lt!85144 (zeroValue!3397 lt!84854))))))))

(declare-fun b!171664 () Bool)

(assert (=> b!171664 (= e!113294 (contains!1144 (toList!1091 lt!85383) (tuple2!3233 lt!85144 (zeroValue!3397 lt!84854))))))

(assert (= (and d!52173 res!81531) b!171663))

(assert (= (and b!171663 res!81530) b!171664))

(declare-fun m!200089 () Bool)

(assert (=> d!52173 m!200089))

(declare-fun m!200091 () Bool)

(assert (=> d!52173 m!200091))

(declare-fun m!200093 () Bool)

(assert (=> d!52173 m!200093))

(declare-fun m!200095 () Bool)

(assert (=> d!52173 m!200095))

(declare-fun m!200097 () Bool)

(assert (=> b!171663 m!200097))

(declare-fun m!200099 () Bool)

(assert (=> b!171664 m!200099))

(assert (=> b!171158 d!52173))

(assert (=> b!171158 d!51799))

(declare-fun d!52175 () Bool)

(assert (=> d!52175 (= (apply!129 lt!85142 lt!85154) (get!1933 (getValueByKey!182 (toList!1091 lt!85142) lt!85154)))))

(declare-fun bs!7081 () Bool)

(assert (= bs!7081 d!52175))

(declare-fun m!200101 () Bool)

(assert (=> bs!7081 m!200101))

(assert (=> bs!7081 m!200101))

(declare-fun m!200103 () Bool)

(assert (=> bs!7081 m!200103))

(assert (=> b!171158 d!52175))

(declare-fun d!52177 () Bool)

(assert (=> d!52177 (= (apply!129 (+!238 lt!85147 (tuple2!3233 lt!85144 (zeroValue!3397 lt!84854))) lt!85161) (apply!129 lt!85147 lt!85161))))

(declare-fun lt!85384 () Unit!5227)

(assert (=> d!52177 (= lt!85384 (choose!931 lt!85147 lt!85144 (zeroValue!3397 lt!84854) lt!85161))))

(declare-fun e!113295 () Bool)

(assert (=> d!52177 e!113295))

(declare-fun res!81532 () Bool)

(assert (=> d!52177 (=> (not res!81532) (not e!113295))))

(assert (=> d!52177 (= res!81532 (contains!1142 lt!85147 lt!85161))))

(assert (=> d!52177 (= (addApplyDifferent!105 lt!85147 lt!85144 (zeroValue!3397 lt!84854) lt!85161) lt!85384)))

(declare-fun b!171665 () Bool)

(assert (=> b!171665 (= e!113295 (not (= lt!85161 lt!85144)))))

(assert (= (and d!52177 res!81532) b!171665))

(assert (=> d!52177 m!199233))

(assert (=> d!52177 m!199255))

(declare-fun m!200105 () Bool)

(assert (=> d!52177 m!200105))

(assert (=> d!52177 m!199255))

(assert (=> d!52177 m!199257))

(declare-fun m!200107 () Bool)

(assert (=> d!52177 m!200107))

(assert (=> b!171158 d!52177))

(declare-fun b!171666 () Bool)

(declare-fun e!113298 () Bool)

(assert (=> b!171666 (= e!113298 (contains!1145 (ite c!30556 (Cons!2201 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000) Nil!2202) Nil!2202) (select (arr!3376 (_keys!5385 lt!84854)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!171667 () Bool)

(declare-fun e!113297 () Bool)

(declare-fun e!113296 () Bool)

(assert (=> b!171667 (= e!113297 e!113296)))

(declare-fun res!81533 () Bool)

(assert (=> b!171667 (=> (not res!81533) (not e!113296))))

(assert (=> b!171667 (= res!81533 (not e!113298))))

(declare-fun res!81534 () Bool)

(assert (=> b!171667 (=> (not res!81534) (not e!113298))))

(assert (=> b!171667 (= res!81534 (validKeyInArray!0 (select (arr!3376 (_keys!5385 lt!84854)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!52179 () Bool)

(declare-fun res!81535 () Bool)

(assert (=> d!52179 (=> res!81535 e!113297)))

(assert (=> d!52179 (= res!81535 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 lt!84854))))))

(assert (=> d!52179 (= (arrayNoDuplicates!0 (_keys!5385 lt!84854) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30556 (Cons!2201 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000) Nil!2202) Nil!2202)) e!113297)))

(declare-fun b!171668 () Bool)

(declare-fun e!113299 () Bool)

(assert (=> b!171668 (= e!113296 e!113299)))

(declare-fun c!30725 () Bool)

(assert (=> b!171668 (= c!30725 (validKeyInArray!0 (select (arr!3376 (_keys!5385 lt!84854)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!17453 () Bool)

(declare-fun bm!17450 () Bool)

(assert (=> bm!17450 (= call!17453 (arrayNoDuplicates!0 (_keys!5385 lt!84854) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!30725 (Cons!2201 (select (arr!3376 (_keys!5385 lt!84854)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!30556 (Cons!2201 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000) Nil!2202) Nil!2202)) (ite c!30556 (Cons!2201 (select (arr!3376 (_keys!5385 lt!84854)) #b00000000000000000000000000000000) Nil!2202) Nil!2202))))))

(declare-fun b!171669 () Bool)

(assert (=> b!171669 (= e!113299 call!17453)))

(declare-fun b!171670 () Bool)

(assert (=> b!171670 (= e!113299 call!17453)))

(assert (= (and d!52179 (not res!81535)) b!171667))

(assert (= (and b!171667 res!81534) b!171666))

(assert (= (and b!171667 res!81533) b!171668))

(assert (= (and b!171668 c!30725) b!171669))

(assert (= (and b!171668 (not c!30725)) b!171670))

(assert (= (or b!171669 b!171670) bm!17450))

(assert (=> b!171666 m!199467))

(assert (=> b!171666 m!199467))

(declare-fun m!200109 () Bool)

(assert (=> b!171666 m!200109))

(assert (=> b!171667 m!199467))

(assert (=> b!171667 m!199467))

(assert (=> b!171667 m!199469))

(assert (=> b!171668 m!199467))

(assert (=> b!171668 m!199467))

(assert (=> b!171668 m!199469))

(assert (=> bm!17450 m!199467))

(declare-fun m!200111 () Bool)

(assert (=> bm!17450 m!200111))

(assert (=> bm!17413 d!52179))

(declare-fun b!171671 () Bool)

(declare-fun e!113300 () Option!188)

(assert (=> b!171671 (= e!113300 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!85052)))))))

(declare-fun b!171673 () Bool)

(declare-fun e!113301 () Option!188)

(assert (=> b!171673 (= e!113301 (getValueByKey!182 (t!6996 (toList!1091 lt!85052)) (_1!1627 (tuple2!3233 lt!84944 v!309))))))

(declare-fun b!171674 () Bool)

(assert (=> b!171674 (= e!113301 None!186)))

(declare-fun c!30726 () Bool)

(declare-fun d!52181 () Bool)

(assert (=> d!52181 (= c!30726 (and ((_ is Cons!2199) (toList!1091 lt!85052)) (= (_1!1627 (h!2816 (toList!1091 lt!85052))) (_1!1627 (tuple2!3233 lt!84944 v!309)))))))

(assert (=> d!52181 (= (getValueByKey!182 (toList!1091 lt!85052) (_1!1627 (tuple2!3233 lt!84944 v!309))) e!113300)))

(declare-fun b!171672 () Bool)

(assert (=> b!171672 (= e!113300 e!113301)))

(declare-fun c!30727 () Bool)

(assert (=> b!171672 (= c!30727 (and ((_ is Cons!2199) (toList!1091 lt!85052)) (not (= (_1!1627 (h!2816 (toList!1091 lt!85052))) (_1!1627 (tuple2!3233 lt!84944 v!309))))))))

(assert (= (and d!52181 c!30726) b!171671))

(assert (= (and d!52181 (not c!30726)) b!171672))

(assert (= (and b!171672 c!30727) b!171673))

(assert (= (and b!171672 (not c!30727)) b!171674))

(declare-fun m!200113 () Bool)

(assert (=> b!171673 m!200113))

(assert (=> b!171001 d!52181))

(assert (=> bm!17414 d!51927))

(assert (=> b!171129 d!52037))

(assert (=> b!171129 d!52039))

(declare-fun d!52183 () Bool)

(assert (=> d!52183 (= (apply!129 lt!85104 (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000)) (get!1933 (getValueByKey!182 (toList!1091 lt!85104) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7082 () Bool)

(assert (= bs!7082 d!52183))

(assert (=> bs!7082 m!198643))

(assert (=> bs!7082 m!200007))

(assert (=> bs!7082 m!200007))

(declare-fun m!200115 () Bool)

(assert (=> bs!7082 m!200115))

(assert (=> b!171100 d!52183))

(assert (=> b!171100 d!51647))

(declare-fun d!52185 () Bool)

(assert (=> d!52185 (= (get!1933 (getValueByKey!182 (toList!1091 (+!238 lt!84942 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))) lt!84954)) (v!3908 (getValueByKey!182 (toList!1091 (+!238 lt!84942 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))) lt!84954)))))

(assert (=> d!51693 d!52185))

(declare-fun e!113302 () Option!188)

(declare-fun b!171675 () Bool)

(assert (=> b!171675 (= e!113302 (Some!187 (_2!1627 (h!2816 (toList!1091 (+!238 lt!84942 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))))))))

(declare-fun b!171677 () Bool)

(declare-fun e!113303 () Option!188)

(assert (=> b!171677 (= e!113303 (getValueByKey!182 (t!6996 (toList!1091 (+!238 lt!84942 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))) lt!84954))))

(declare-fun b!171678 () Bool)

(assert (=> b!171678 (= e!113303 None!186)))

(declare-fun d!52187 () Bool)

(declare-fun c!30728 () Bool)

(assert (=> d!52187 (= c!30728 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84942 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))) (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84942 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))) lt!84954)))))

(assert (=> d!52187 (= (getValueByKey!182 (toList!1091 (+!238 lt!84942 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))) lt!84954) e!113302)))

(declare-fun b!171676 () Bool)

(assert (=> b!171676 (= e!113302 e!113303)))

(declare-fun c!30729 () Bool)

(assert (=> b!171676 (= c!30729 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84942 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248))))) (not (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84942 (tuple2!3233 lt!84963 (minValue!3397 thiss!1248)))))) lt!84954))))))

(assert (= (and d!52187 c!30728) b!171675))

(assert (= (and d!52187 (not c!30728)) b!171676))

(assert (= (and b!171676 c!30729) b!171677))

(assert (= (and b!171676 (not c!30729)) b!171678))

(declare-fun m!200117 () Bool)

(assert (=> b!171677 m!200117))

(assert (=> d!51693 d!52187))

(declare-fun b!171679 () Bool)

(declare-fun e!113305 () (_ BitVec 32))

(assert (=> b!171679 (= e!113305 #b00000000000000000000000000000000)))

(declare-fun b!171680 () Bool)

(declare-fun e!113304 () (_ BitVec 32))

(declare-fun call!17454 () (_ BitVec 32))

(assert (=> b!171680 (= e!113304 call!17454)))

(declare-fun b!171681 () Bool)

(assert (=> b!171681 (= e!113305 e!113304)))

(declare-fun c!30731 () Bool)

(assert (=> b!171681 (= c!30731 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!52189 () Bool)

(declare-fun lt!85385 () (_ BitVec 32))

(assert (=> d!52189 (and (bvsge lt!85385 #b00000000000000000000000000000000) (bvsle lt!85385 (bvsub (size!3670 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!52189 (= lt!85385 e!113305)))

(declare-fun c!30730 () Bool)

(assert (=> d!52189 (= c!30730 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> d!52189 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!3670 (_keys!5385 thiss!1248)) (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> d!52189 (= (arrayCountValidKeys!0 (_keys!5385 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))) lt!85385)))

(declare-fun bm!17451 () Bool)

(assert (=> bm!17451 (= call!17454 (arrayCountValidKeys!0 (_keys!5385 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))))))

(declare-fun b!171682 () Bool)

(assert (=> b!171682 (= e!113304 (bvadd #b00000000000000000000000000000001 call!17454))))

(assert (= (and d!52189 c!30730) b!171679))

(assert (= (and d!52189 (not c!30730)) b!171681))

(assert (= (and b!171681 c!30731) b!171682))

(assert (= (and b!171681 (not c!30731)) b!171680))

(assert (= (or b!171682 b!171680) bm!17451))

(assert (=> b!171681 m!199441))

(assert (=> b!171681 m!199441))

(assert (=> b!171681 m!199443))

(declare-fun m!200119 () Bool)

(assert (=> bm!17451 m!200119))

(assert (=> bm!17425 d!52189))

(assert (=> b!171140 d!51803))

(declare-fun d!52191 () Bool)

(declare-fun e!113307 () Bool)

(assert (=> d!52191 e!113307))

(declare-fun res!81536 () Bool)

(assert (=> d!52191 (=> res!81536 e!113307)))

(declare-fun lt!85389 () Bool)

(assert (=> d!52191 (= res!81536 (not lt!85389))))

(declare-fun lt!85387 () Bool)

(assert (=> d!52191 (= lt!85389 lt!85387)))

(declare-fun lt!85386 () Unit!5227)

(declare-fun e!113306 () Unit!5227)

(assert (=> d!52191 (= lt!85386 e!113306)))

(declare-fun c!30732 () Bool)

(assert (=> d!52191 (= c!30732 lt!85387)))

(assert (=> d!52191 (= lt!85387 (containsKey!186 (toList!1091 lt!85111) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))

(assert (=> d!52191 (= (contains!1142 lt!85111 (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) lt!85389)))

(declare-fun b!171683 () Bool)

(declare-fun lt!85388 () Unit!5227)

(assert (=> b!171683 (= e!113306 lt!85388)))

(assert (=> b!171683 (= lt!85388 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85111) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))

(assert (=> b!171683 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85111) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))

(declare-fun b!171684 () Bool)

(declare-fun Unit!5268 () Unit!5227)

(assert (=> b!171684 (= e!113306 Unit!5268)))

(declare-fun b!171685 () Bool)

(assert (=> b!171685 (= e!113307 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85111) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))))))

(assert (= (and d!52191 c!30732) b!171683))

(assert (= (and d!52191 (not c!30732)) b!171684))

(assert (= (and d!52191 (not res!81536)) b!171685))

(declare-fun m!200121 () Bool)

(assert (=> d!52191 m!200121))

(declare-fun m!200123 () Bool)

(assert (=> b!171683 m!200123))

(assert (=> b!171683 m!199105))

(assert (=> b!171683 m!199105))

(declare-fun m!200125 () Bool)

(assert (=> b!171683 m!200125))

(assert (=> b!171685 m!199105))

(assert (=> b!171685 m!199105))

(assert (=> b!171685 m!200125))

(assert (=> d!51745 d!52191))

(declare-fun b!171686 () Bool)

(declare-fun e!113308 () Option!188)

(assert (=> b!171686 (= e!113308 (Some!187 (_2!1627 (h!2816 lt!85109))))))

(declare-fun e!113309 () Option!188)

(declare-fun b!171688 () Bool)

(assert (=> b!171688 (= e!113309 (getValueByKey!182 (t!6996 lt!85109) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))

(declare-fun b!171689 () Bool)

(assert (=> b!171689 (= e!113309 None!186)))

(declare-fun d!52193 () Bool)

(declare-fun c!30733 () Bool)

(assert (=> d!52193 (= c!30733 (and ((_ is Cons!2199) lt!85109) (= (_1!1627 (h!2816 lt!85109)) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))))))

(assert (=> d!52193 (= (getValueByKey!182 lt!85109 (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) e!113308)))

(declare-fun b!171687 () Bool)

(assert (=> b!171687 (= e!113308 e!113309)))

(declare-fun c!30734 () Bool)

(assert (=> b!171687 (= c!30734 (and ((_ is Cons!2199) lt!85109) (not (= (_1!1627 (h!2816 lt!85109)) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))))

(assert (= (and d!52193 c!30733) b!171686))

(assert (= (and d!52193 (not c!30733)) b!171687))

(assert (= (and b!171687 c!30734) b!171688))

(assert (= (and b!171687 (not c!30734)) b!171689))

(declare-fun m!200127 () Bool)

(assert (=> b!171688 m!200127))

(assert (=> d!51745 d!52193))

(declare-fun d!52195 () Bool)

(assert (=> d!52195 (= (getValueByKey!182 lt!85109 (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))

(declare-fun lt!85390 () Unit!5227)

(assert (=> d!52195 (= lt!85390 (choose!933 lt!85109 (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))

(declare-fun e!113310 () Bool)

(assert (=> d!52195 e!113310))

(declare-fun res!81537 () Bool)

(assert (=> d!52195 (=> (not res!81537) (not e!113310))))

(assert (=> d!52195 (= res!81537 (isStrictlySorted!326 lt!85109))))

(assert (=> d!52195 (= (lemmaContainsTupThenGetReturnValue!98 lt!85109 (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) lt!85390)))

(declare-fun b!171690 () Bool)

(declare-fun res!81538 () Bool)

(assert (=> b!171690 (=> (not res!81538) (not e!113310))))

(assert (=> b!171690 (= res!81538 (containsKey!186 lt!85109 (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))

(declare-fun b!171691 () Bool)

(assert (=> b!171691 (= e!113310 (contains!1144 lt!85109 (tuple2!3233 (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))))))

(assert (= (and d!52195 res!81537) b!171690))

(assert (= (and b!171690 res!81538) b!171691))

(assert (=> d!52195 m!199099))

(declare-fun m!200129 () Bool)

(assert (=> d!52195 m!200129))

(declare-fun m!200131 () Bool)

(assert (=> d!52195 m!200131))

(declare-fun m!200133 () Bool)

(assert (=> b!171690 m!200133))

(declare-fun m!200135 () Bool)

(assert (=> b!171691 m!200135))

(assert (=> d!51745 d!52195))

(declare-fun e!113311 () List!2203)

(declare-fun b!171692 () Bool)

(assert (=> b!171692 (= e!113311 (insertStrictlySorted!101 (t!6996 (toList!1091 lt!84985)) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))

(declare-fun b!171693 () Bool)

(declare-fun e!113313 () List!2203)

(declare-fun call!17456 () List!2203)

(assert (=> b!171693 (= e!113313 call!17456)))

(declare-fun b!171694 () Bool)

(declare-fun e!113312 () List!2203)

(declare-fun call!17455 () List!2203)

(assert (=> b!171694 (= e!113312 call!17455)))

(declare-fun bm!17452 () Bool)

(declare-fun call!17457 () List!2203)

(assert (=> bm!17452 (= call!17457 call!17456)))

(declare-fun b!171695 () Bool)

(declare-fun e!113315 () List!2203)

(assert (=> b!171695 (= e!113313 e!113315)))

(declare-fun c!30735 () Bool)

(assert (=> b!171695 (= c!30735 (and ((_ is Cons!2199) (toList!1091 lt!84985)) (= (_1!1627 (h!2816 (toList!1091 lt!84985))) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))))))

(declare-fun d!52197 () Bool)

(declare-fun e!113314 () Bool)

(assert (=> d!52197 e!113314))

(declare-fun res!81539 () Bool)

(assert (=> d!52197 (=> (not res!81539) (not e!113314))))

(declare-fun lt!85391 () List!2203)

(assert (=> d!52197 (= res!81539 (isStrictlySorted!326 lt!85391))))

(assert (=> d!52197 (= lt!85391 e!113313)))

(declare-fun c!30737 () Bool)

(assert (=> d!52197 (= c!30737 (and ((_ is Cons!2199) (toList!1091 lt!84985)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84985))) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))))))

(assert (=> d!52197 (isStrictlySorted!326 (toList!1091 lt!84985))))

(assert (=> d!52197 (= (insertStrictlySorted!101 (toList!1091 lt!84985) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))) lt!85391)))

(declare-fun b!171696 () Bool)

(assert (=> b!171696 (= e!113315 call!17457)))

(declare-fun c!30736 () Bool)

(declare-fun b!171697 () Bool)

(assert (=> b!171697 (= e!113311 (ite c!30735 (t!6996 (toList!1091 lt!84985)) (ite c!30736 (Cons!2199 (h!2816 (toList!1091 lt!84985)) (t!6996 (toList!1091 lt!84985))) Nil!2200)))))

(declare-fun bm!17453 () Bool)

(assert (=> bm!17453 (= call!17455 call!17457)))

(declare-fun b!171698 () Bool)

(assert (=> b!171698 (= c!30736 (and ((_ is Cons!2199) (toList!1091 lt!84985)) (bvsgt (_1!1627 (h!2816 (toList!1091 lt!84985))) (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))))))

(assert (=> b!171698 (= e!113315 e!113312)))

(declare-fun bm!17454 () Bool)

(assert (=> bm!17454 (= call!17456 ($colon$colon!96 e!113311 (ite c!30737 (h!2816 (toList!1091 lt!84985)) (tuple2!3233 (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))))

(declare-fun c!30738 () Bool)

(assert (=> bm!17454 (= c!30738 c!30737)))

(declare-fun b!171699 () Bool)

(declare-fun res!81540 () Bool)

(assert (=> b!171699 (=> (not res!81540) (not e!113314))))

(assert (=> b!171699 (= res!81540 (containsKey!186 lt!85391 (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248)))))))

(declare-fun b!171700 () Bool)

(assert (=> b!171700 (= e!113312 call!17455)))

(declare-fun b!171701 () Bool)

(assert (=> b!171701 (= e!113314 (contains!1144 lt!85391 (tuple2!3233 (_1!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))))))

(assert (= (and d!52197 c!30737) b!171693))

(assert (= (and d!52197 (not c!30737)) b!171695))

(assert (= (and b!171695 c!30735) b!171696))

(assert (= (and b!171695 (not c!30735)) b!171698))

(assert (= (and b!171698 c!30736) b!171700))

(assert (= (and b!171698 (not c!30736)) b!171694))

(assert (= (or b!171700 b!171694) bm!17453))

(assert (= (or b!171696 bm!17453) bm!17452))

(assert (= (or b!171693 bm!17452) bm!17454))

(assert (= (and bm!17454 c!30738) b!171692))

(assert (= (and bm!17454 (not c!30738)) b!171697))

(assert (= (and d!52197 res!81539) b!171699))

(assert (= (and b!171699 res!81540) b!171701))

(declare-fun m!200137 () Bool)

(assert (=> b!171692 m!200137))

(declare-fun m!200139 () Bool)

(assert (=> b!171701 m!200139))

(declare-fun m!200141 () Bool)

(assert (=> bm!17454 m!200141))

(declare-fun m!200143 () Bool)

(assert (=> b!171699 m!200143))

(declare-fun m!200145 () Bool)

(assert (=> d!52197 m!200145))

(declare-fun m!200147 () Bool)

(assert (=> d!52197 m!200147))

(assert (=> d!51745 d!52197))

(declare-fun d!52199 () Bool)

(assert (=> d!52199 (= (get!1933 (getValueByKey!182 (toList!1091 lt!84962) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3908 (getValueByKey!182 (toList!1091 lt!84962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51775 d!52199))

(assert (=> d!51775 d!51851))

(declare-fun d!52201 () Bool)

(declare-fun res!81541 () Bool)

(declare-fun e!113316 () Bool)

(assert (=> d!52201 (=> res!81541 e!113316)))

(assert (=> d!52201 (= res!81541 (and ((_ is Cons!2199) (toList!1091 lt!84987)) (= (_1!1627 (h!2816 (toList!1091 lt!84987))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52201 (= (containsKey!186 (toList!1091 lt!84987) #b1000000000000000000000000000000000000000000000000000000000000000) e!113316)))

(declare-fun b!171702 () Bool)

(declare-fun e!113317 () Bool)

(assert (=> b!171702 (= e!113316 e!113317)))

(declare-fun res!81542 () Bool)

(assert (=> b!171702 (=> (not res!81542) (not e!113317))))

(assert (=> b!171702 (= res!81542 (and (or (not ((_ is Cons!2199) (toList!1091 lt!84987))) (bvsle (_1!1627 (h!2816 (toList!1091 lt!84987))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2199) (toList!1091 lt!84987)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84987))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171703 () Bool)

(assert (=> b!171703 (= e!113317 (containsKey!186 (t!6996 (toList!1091 lt!84987)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52201 (not res!81541)) b!171702))

(assert (= (and b!171702 res!81542) b!171703))

(declare-fun m!200149 () Bool)

(assert (=> b!171703 m!200149))

(assert (=> d!51705 d!52201))

(declare-fun d!52203 () Bool)

(assert (=> d!52203 (= (isEmpty!438 (getValueByKey!182 (toList!1091 lt!84853) key!828)) (not ((_ is Some!187) (getValueByKey!182 (toList!1091 lt!84853) key!828))))))

(assert (=> d!51671 d!52203))

(assert (=> b!170939 d!51651))

(declare-fun d!52205 () Bool)

(declare-fun e!113318 () Bool)

(assert (=> d!52205 e!113318))

(declare-fun res!81544 () Bool)

(assert (=> d!52205 (=> (not res!81544) (not e!113318))))

(declare-fun lt!85395 () ListLongMap!2151)

(assert (=> d!52205 (= res!81544 (contains!1142 lt!85395 (_1!1627 (ite (or c!30573 c!30571) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!84854)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854))))))))

(declare-fun lt!85393 () List!2203)

(assert (=> d!52205 (= lt!85395 (ListLongMap!2152 lt!85393))))

(declare-fun lt!85394 () Unit!5227)

(declare-fun lt!85392 () Unit!5227)

(assert (=> d!52205 (= lt!85394 lt!85392)))

(assert (=> d!52205 (= (getValueByKey!182 lt!85393 (_1!1627 (ite (or c!30573 c!30571) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!84854)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854))))) (Some!187 (_2!1627 (ite (or c!30573 c!30571) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!84854)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854))))))))

(assert (=> d!52205 (= lt!85392 (lemmaContainsTupThenGetReturnValue!98 lt!85393 (_1!1627 (ite (or c!30573 c!30571) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!84854)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854)))) (_2!1627 (ite (or c!30573 c!30571) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!84854)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854))))))))

(assert (=> d!52205 (= lt!85393 (insertStrictlySorted!101 (toList!1091 (ite c!30573 call!17424 (ite c!30571 call!17421 call!17425))) (_1!1627 (ite (or c!30573 c!30571) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!84854)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854)))) (_2!1627 (ite (or c!30573 c!30571) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!84854)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854))))))))

(assert (=> d!52205 (= (+!238 (ite c!30573 call!17424 (ite c!30571 call!17421 call!17425)) (ite (or c!30573 c!30571) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!84854)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854)))) lt!85395)))

(declare-fun b!171704 () Bool)

(declare-fun res!81543 () Bool)

(assert (=> b!171704 (=> (not res!81543) (not e!113318))))

(assert (=> b!171704 (= res!81543 (= (getValueByKey!182 (toList!1091 lt!85395) (_1!1627 (ite (or c!30573 c!30571) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!84854)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854))))) (Some!187 (_2!1627 (ite (or c!30573 c!30571) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!84854)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854)))))))))

(declare-fun b!171705 () Bool)

(assert (=> b!171705 (= e!113318 (contains!1144 (toList!1091 lt!85395) (ite (or c!30573 c!30571) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!84854)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854)))))))

(assert (= (and d!52205 res!81544) b!171704))

(assert (= (and b!171704 res!81543) b!171705))

(declare-fun m!200151 () Bool)

(assert (=> d!52205 m!200151))

(declare-fun m!200153 () Bool)

(assert (=> d!52205 m!200153))

(declare-fun m!200155 () Bool)

(assert (=> d!52205 m!200155))

(declare-fun m!200157 () Bool)

(assert (=> d!52205 m!200157))

(declare-fun m!200159 () Bool)

(assert (=> b!171704 m!200159))

(declare-fun m!200161 () Bool)

(assert (=> b!171705 m!200161))

(assert (=> bm!17423 d!52205))

(declare-fun d!52207 () Bool)

(declare-fun e!113319 () Bool)

(assert (=> d!52207 e!113319))

(declare-fun res!81546 () Bool)

(assert (=> d!52207 (=> (not res!81546) (not e!113319))))

(declare-fun lt!85399 () ListLongMap!2151)

(assert (=> d!52207 (= res!81546 (contains!1142 lt!85399 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854)))))))

(declare-fun lt!85397 () List!2203)

(assert (=> d!52207 (= lt!85399 (ListLongMap!2152 lt!85397))))

(declare-fun lt!85398 () Unit!5227)

(declare-fun lt!85396 () Unit!5227)

(assert (=> d!52207 (= lt!85398 lt!85396)))

(assert (=> d!52207 (= (getValueByKey!182 lt!85397 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854)))) (Some!187 (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854)))))))

(assert (=> d!52207 (= lt!85396 (lemmaContainsTupThenGetReturnValue!98 lt!85397 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854)))))))

(assert (=> d!52207 (= lt!85397 (insertStrictlySorted!101 (toList!1091 call!17423) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854)))))))

(assert (=> d!52207 (= (+!238 call!17423 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854))) lt!85399)))

(declare-fun b!171706 () Bool)

(declare-fun res!81545 () Bool)

(assert (=> b!171706 (=> (not res!81545) (not e!113319))))

(assert (=> b!171706 (= res!81545 (= (getValueByKey!182 (toList!1091 lt!85399) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854)))) (Some!187 (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854))))))))

(declare-fun b!171707 () Bool)

(assert (=> b!171707 (= e!113319 (contains!1144 (toList!1091 lt!85399) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!84854))))))

(assert (= (and d!52207 res!81546) b!171706))

(assert (= (and b!171706 res!81545) b!171707))

(declare-fun m!200163 () Bool)

(assert (=> d!52207 m!200163))

(declare-fun m!200165 () Bool)

(assert (=> d!52207 m!200165))

(declare-fun m!200167 () Bool)

(assert (=> d!52207 m!200167))

(declare-fun m!200169 () Bool)

(assert (=> d!52207 m!200169))

(declare-fun m!200171 () Bool)

(assert (=> b!171706 m!200171))

(declare-fun m!200173 () Bool)

(assert (=> b!171707 m!200173))

(assert (=> b!171149 d!52207))

(declare-fun d!52209 () Bool)

(assert (=> d!52209 (= (get!1933 (getValueByKey!182 (toList!1091 lt!84987) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))) (v!3908 (getValueByKey!182 (toList!1091 lt!84987) (select (arr!3376 (_keys!5385 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!51645 d!52209))

(assert (=> d!51645 d!51899))

(declare-fun d!52211 () Bool)

(declare-fun res!81547 () Bool)

(declare-fun e!113320 () Bool)

(assert (=> d!52211 (=> res!81547 e!113320)))

(assert (=> d!52211 (= res!81547 (and ((_ is Cons!2199) (toList!1091 lt!84962)) (= (_1!1627 (h!2816 (toList!1091 lt!84962))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52211 (= (containsKey!186 (toList!1091 lt!84962) #b0000000000000000000000000000000000000000000000000000000000000000) e!113320)))

(declare-fun b!171708 () Bool)

(declare-fun e!113321 () Bool)

(assert (=> b!171708 (= e!113320 e!113321)))

(declare-fun res!81548 () Bool)

(assert (=> b!171708 (=> (not res!81548) (not e!113321))))

(assert (=> b!171708 (= res!81548 (and (or (not ((_ is Cons!2199) (toList!1091 lt!84962))) (bvsle (_1!1627 (h!2816 (toList!1091 lt!84962))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2199) (toList!1091 lt!84962)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84962))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171709 () Bool)

(assert (=> b!171709 (= e!113321 (containsKey!186 (t!6996 (toList!1091 lt!84962)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52211 (not res!81547)) b!171708))

(assert (= (and b!171708 res!81548) b!171709))

(declare-fun m!200175 () Bool)

(assert (=> b!171709 m!200175))

(assert (=> d!51643 d!52211))

(declare-fun d!52213 () Bool)

(assert (=> d!52213 (= (get!1933 (getValueByKey!182 (toList!1091 lt!84962) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3908 (getValueByKey!182 (toList!1091 lt!84962) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51735 d!52213))

(assert (=> d!51735 d!52029))

(declare-fun d!52215 () Bool)

(declare-fun e!113323 () Bool)

(assert (=> d!52215 e!113323))

(declare-fun res!81549 () Bool)

(assert (=> d!52215 (=> res!81549 e!113323)))

(declare-fun lt!85403 () Bool)

(assert (=> d!52215 (= res!81549 (not lt!85403))))

(declare-fun lt!85401 () Bool)

(assert (=> d!52215 (= lt!85403 lt!85401)))

(declare-fun lt!85400 () Unit!5227)

(declare-fun e!113322 () Unit!5227)

(assert (=> d!52215 (= lt!85400 e!113322)))

(declare-fun c!30739 () Bool)

(assert (=> d!52215 (= c!30739 lt!85401)))

(assert (=> d!52215 (= lt!85401 (containsKey!186 (toList!1091 lt!85126) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))

(assert (=> d!52215 (= (contains!1142 lt!85126 (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))) lt!85403)))

(declare-fun b!171710 () Bool)

(declare-fun lt!85402 () Unit!5227)

(assert (=> b!171710 (= e!113322 lt!85402)))

(assert (=> b!171710 (= lt!85402 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85126) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))

(assert (=> b!171710 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85126) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))

(declare-fun b!171711 () Bool)

(declare-fun Unit!5269 () Unit!5227)

(assert (=> b!171711 (= e!113322 Unit!5269)))

(declare-fun b!171712 () Bool)

(assert (=> b!171712 (= e!113323 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85126) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))))))

(assert (= (and d!52215 c!30739) b!171710))

(assert (= (and d!52215 (not c!30739)) b!171711))

(assert (= (and d!52215 (not res!81549)) b!171712))

(declare-fun m!200177 () Bool)

(assert (=> d!52215 m!200177))

(declare-fun m!200179 () Bool)

(assert (=> b!171710 m!200179))

(assert (=> b!171710 m!199173))

(assert (=> b!171710 m!199173))

(declare-fun m!200181 () Bool)

(assert (=> b!171710 m!200181))

(assert (=> b!171712 m!199173))

(assert (=> b!171712 m!199173))

(assert (=> b!171712 m!200181))

(assert (=> d!51767 d!52215))

(declare-fun b!171713 () Bool)

(declare-fun e!113324 () Option!188)

(assert (=> b!171713 (= e!113324 (Some!187 (_2!1627 (h!2816 lt!85124))))))

(declare-fun e!113325 () Option!188)

(declare-fun b!171715 () Bool)

(assert (=> b!171715 (= e!113325 (getValueByKey!182 (t!6996 lt!85124) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))

(declare-fun b!171716 () Bool)

(assert (=> b!171716 (= e!113325 None!186)))

(declare-fun c!30740 () Bool)

(declare-fun d!52217 () Bool)

(assert (=> d!52217 (= c!30740 (and ((_ is Cons!2199) lt!85124) (= (_1!1627 (h!2816 lt!85124)) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))))))

(assert (=> d!52217 (= (getValueByKey!182 lt!85124 (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))) e!113324)))

(declare-fun b!171714 () Bool)

(assert (=> b!171714 (= e!113324 e!113325)))

(declare-fun c!30741 () Bool)

(assert (=> b!171714 (= c!30741 (and ((_ is Cons!2199) lt!85124) (not (= (_1!1627 (h!2816 lt!85124)) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))))

(assert (= (and d!52217 c!30740) b!171713))

(assert (= (and d!52217 (not c!30740)) b!171714))

(assert (= (and b!171714 c!30741) b!171715))

(assert (= (and b!171714 (not c!30741)) b!171716))

(declare-fun m!200183 () Bool)

(assert (=> b!171715 m!200183))

(assert (=> d!51767 d!52217))

(declare-fun d!52219 () Bool)

(assert (=> d!52219 (= (getValueByKey!182 lt!85124 (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))

(declare-fun lt!85404 () Unit!5227)

(assert (=> d!52219 (= lt!85404 (choose!933 lt!85124 (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))

(declare-fun e!113326 () Bool)

(assert (=> d!52219 e!113326))

(declare-fun res!81550 () Bool)

(assert (=> d!52219 (=> (not res!81550) (not e!113326))))

(assert (=> d!52219 (= res!81550 (isStrictlySorted!326 lt!85124))))

(assert (=> d!52219 (= (lemmaContainsTupThenGetReturnValue!98 lt!85124 (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))) lt!85404)))

(declare-fun b!171717 () Bool)

(declare-fun res!81551 () Bool)

(assert (=> b!171717 (=> (not res!81551) (not e!113326))))

(assert (=> b!171717 (= res!81551 (containsKey!186 lt!85124 (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))

(declare-fun b!171718 () Bool)

(assert (=> b!171718 (= e!113326 (contains!1144 lt!85124 (tuple2!3233 (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))))))

(assert (= (and d!52219 res!81550) b!171717))

(assert (= (and b!171717 res!81551) b!171718))

(assert (=> d!52219 m!199167))

(declare-fun m!200185 () Bool)

(assert (=> d!52219 m!200185))

(declare-fun m!200187 () Bool)

(assert (=> d!52219 m!200187))

(declare-fun m!200189 () Bool)

(assert (=> b!171717 m!200189))

(declare-fun m!200191 () Bool)

(assert (=> b!171718 m!200191))

(assert (=> d!51767 d!52219))

(declare-fun b!171719 () Bool)

(declare-fun e!113327 () List!2203)

(assert (=> b!171719 (= e!113327 (insertStrictlySorted!101 (t!6996 (toList!1091 lt!84972)) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))

(declare-fun b!171720 () Bool)

(declare-fun e!113329 () List!2203)

(declare-fun call!17459 () List!2203)

(assert (=> b!171720 (= e!113329 call!17459)))

(declare-fun b!171721 () Bool)

(declare-fun e!113328 () List!2203)

(declare-fun call!17458 () List!2203)

(assert (=> b!171721 (= e!113328 call!17458)))

(declare-fun bm!17455 () Bool)

(declare-fun call!17460 () List!2203)

(assert (=> bm!17455 (= call!17460 call!17459)))

(declare-fun b!171722 () Bool)

(declare-fun e!113331 () List!2203)

(assert (=> b!171722 (= e!113329 e!113331)))

(declare-fun c!30742 () Bool)

(assert (=> b!171722 (= c!30742 (and ((_ is Cons!2199) (toList!1091 lt!84972)) (= (_1!1627 (h!2816 (toList!1091 lt!84972))) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))))))

(declare-fun d!52221 () Bool)

(declare-fun e!113330 () Bool)

(assert (=> d!52221 e!113330))

(declare-fun res!81552 () Bool)

(assert (=> d!52221 (=> (not res!81552) (not e!113330))))

(declare-fun lt!85405 () List!2203)

(assert (=> d!52221 (= res!81552 (isStrictlySorted!326 lt!85405))))

(assert (=> d!52221 (= lt!85405 e!113329)))

(declare-fun c!30744 () Bool)

(assert (=> d!52221 (= c!30744 (and ((_ is Cons!2199) (toList!1091 lt!84972)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84972))) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))))))

(assert (=> d!52221 (isStrictlySorted!326 (toList!1091 lt!84972))))

(assert (=> d!52221 (= (insertStrictlySorted!101 (toList!1091 lt!84972) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))) lt!85405)))

(declare-fun b!171723 () Bool)

(assert (=> b!171723 (= e!113331 call!17460)))

(declare-fun b!171724 () Bool)

(declare-fun c!30743 () Bool)

(assert (=> b!171724 (= e!113327 (ite c!30742 (t!6996 (toList!1091 lt!84972)) (ite c!30743 (Cons!2199 (h!2816 (toList!1091 lt!84972)) (t!6996 (toList!1091 lt!84972))) Nil!2200)))))

(declare-fun bm!17456 () Bool)

(assert (=> bm!17456 (= call!17458 call!17460)))

(declare-fun b!171725 () Bool)

(assert (=> b!171725 (= c!30743 (and ((_ is Cons!2199) (toList!1091 lt!84972)) (bvsgt (_1!1627 (h!2816 (toList!1091 lt!84972))) (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))))))

(assert (=> b!171725 (= e!113331 e!113328)))

(declare-fun bm!17457 () Bool)

(assert (=> bm!17457 (= call!17459 ($colon$colon!96 e!113327 (ite c!30744 (h!2816 (toList!1091 lt!84972)) (tuple2!3233 (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))))

(declare-fun c!30745 () Bool)

(assert (=> bm!17457 (= c!30745 c!30744)))

(declare-fun b!171726 () Bool)

(declare-fun res!81553 () Bool)

(assert (=> b!171726 (=> (not res!81553) (not e!113330))))

(assert (=> b!171726 (= res!81553 (containsKey!186 lt!85405 (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248)))))))

(declare-fun b!171727 () Bool)

(assert (=> b!171727 (= e!113328 call!17458)))

(declare-fun b!171728 () Bool)

(assert (=> b!171728 (= e!113330 (contains!1144 lt!85405 (tuple2!3233 (_1!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))))))

(assert (= (and d!52221 c!30744) b!171720))

(assert (= (and d!52221 (not c!30744)) b!171722))

(assert (= (and b!171722 c!30742) b!171723))

(assert (= (and b!171722 (not c!30742)) b!171725))

(assert (= (and b!171725 c!30743) b!171727))

(assert (= (and b!171725 (not c!30743)) b!171721))

(assert (= (or b!171727 b!171721) bm!17456))

(assert (= (or b!171723 bm!17456) bm!17455))

(assert (= (or b!171720 bm!17455) bm!17457))

(assert (= (and bm!17457 c!30745) b!171719))

(assert (= (and bm!17457 (not c!30745)) b!171724))

(assert (= (and d!52221 res!81552) b!171726))

(assert (= (and b!171726 res!81553) b!171728))

(declare-fun m!200193 () Bool)

(assert (=> b!171719 m!200193))

(declare-fun m!200195 () Bool)

(assert (=> b!171728 m!200195))

(declare-fun m!200197 () Bool)

(assert (=> bm!17457 m!200197))

(declare-fun m!200199 () Bool)

(assert (=> b!171726 m!200199))

(declare-fun m!200201 () Bool)

(assert (=> d!52221 m!200201))

(declare-fun m!200203 () Bool)

(assert (=> d!52221 m!200203))

(assert (=> d!51767 d!52221))

(declare-fun d!52223 () Bool)

(declare-fun lt!85406 () Bool)

(assert (=> d!52223 (= lt!85406 (select (content!147 lt!85082) (tuple2!3233 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309)))))))

(declare-fun e!113333 () Bool)

(assert (=> d!52223 (= lt!85406 e!113333)))

(declare-fun res!81554 () Bool)

(assert (=> d!52223 (=> (not res!81554) (not e!113333))))

(assert (=> d!52223 (= res!81554 ((_ is Cons!2199) lt!85082))))

(assert (=> d!52223 (= (contains!1144 lt!85082 (tuple2!3233 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309)))) lt!85406)))

(declare-fun b!171729 () Bool)

(declare-fun e!113332 () Bool)

(assert (=> b!171729 (= e!113333 e!113332)))

(declare-fun res!81555 () Bool)

(assert (=> b!171729 (=> res!81555 e!113332)))

(assert (=> b!171729 (= res!81555 (= (h!2816 lt!85082) (tuple2!3233 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309)))))))

(declare-fun b!171730 () Bool)

(assert (=> b!171730 (= e!113332 (contains!1144 (t!6996 lt!85082) (tuple2!3233 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309)))))))

(assert (= (and d!52223 res!81554) b!171729))

(assert (= (and b!171729 (not res!81555)) b!171730))

(declare-fun m!200205 () Bool)

(assert (=> d!52223 m!200205))

(declare-fun m!200207 () Bool)

(assert (=> d!52223 m!200207))

(declare-fun m!200209 () Bool)

(assert (=> b!171730 m!200209))

(assert (=> b!171058 d!52223))

(declare-fun b!171731 () Bool)

(declare-fun e!113334 () Option!188)

(assert (=> b!171731 (= e!113334 (Some!187 (_2!1627 (h!2816 (t!6996 (toList!1091 lt!84897))))))))

(declare-fun e!113335 () Option!188)

(declare-fun b!171733 () Bool)

(assert (=> b!171733 (= e!113335 (getValueByKey!182 (t!6996 (t!6996 (toList!1091 lt!84897))) (_1!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun b!171734 () Bool)

(assert (=> b!171734 (= e!113335 None!186)))

(declare-fun d!52225 () Bool)

(declare-fun c!30746 () Bool)

(assert (=> d!52225 (= c!30746 (and ((_ is Cons!2199) (t!6996 (toList!1091 lt!84897))) (= (_1!1627 (h!2816 (t!6996 (toList!1091 lt!84897)))) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(assert (=> d!52225 (= (getValueByKey!182 (t!6996 (toList!1091 lt!84897)) (_1!1627 (tuple2!3233 key!828 v!309))) e!113334)))

(declare-fun b!171732 () Bool)

(assert (=> b!171732 (= e!113334 e!113335)))

(declare-fun c!30747 () Bool)

(assert (=> b!171732 (= c!30747 (and ((_ is Cons!2199) (t!6996 (toList!1091 lt!84897))) (not (= (_1!1627 (h!2816 (t!6996 (toList!1091 lt!84897)))) (_1!1627 (tuple2!3233 key!828 v!309))))))))

(assert (= (and d!52225 c!30746) b!171731))

(assert (= (and d!52225 (not c!30746)) b!171732))

(assert (= (and b!171732 c!30747) b!171733))

(assert (= (and b!171732 (not c!30747)) b!171734))

(declare-fun m!200211 () Bool)

(assert (=> b!171733 m!200211))

(assert (=> b!171178 d!52225))

(declare-fun b!171735 () Bool)

(declare-fun e!113337 () Bool)

(declare-fun call!17461 () Bool)

(assert (=> b!171735 (= e!113337 call!17461)))

(declare-fun b!171736 () Bool)

(declare-fun e!113338 () Bool)

(assert (=> b!171736 (= e!113338 call!17461)))

(declare-fun b!171737 () Bool)

(declare-fun e!113336 () Bool)

(assert (=> b!171737 (= e!113336 e!113337)))

(declare-fun c!30748 () Bool)

(assert (=> b!171737 (= c!30748 (validKeyInArray!0 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!52227 () Bool)

(declare-fun res!81556 () Bool)

(assert (=> d!52227 (=> res!81556 e!113336)))

(assert (=> d!52227 (= res!81556 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3670 (_keys!5385 thiss!1248))))))

(assert (=> d!52227 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5385 thiss!1248) (mask!8381 thiss!1248)) e!113336)))

(declare-fun b!171738 () Bool)

(assert (=> b!171738 (= e!113337 e!113338)))

(declare-fun lt!85409 () (_ BitVec 64))

(assert (=> b!171738 (= lt!85409 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!85408 () Unit!5227)

(assert (=> b!171738 (= lt!85408 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5385 thiss!1248) lt!85409 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!171738 (arrayContainsKey!0 (_keys!5385 thiss!1248) lt!85409 #b00000000000000000000000000000000)))

(declare-fun lt!85407 () Unit!5227)

(assert (=> b!171738 (= lt!85407 lt!85408)))

(declare-fun res!81557 () Bool)

(assert (=> b!171738 (= res!81557 (= (seekEntryOrOpen!0 (select (arr!3376 (_keys!5385 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5385 thiss!1248) (mask!8381 thiss!1248)) (Found!545 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171738 (=> (not res!81557) (not e!113338))))

(declare-fun bm!17458 () Bool)

(assert (=> bm!17458 (= call!17461 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5385 thiss!1248) (mask!8381 thiss!1248)))))

(assert (= (and d!52227 (not res!81556)) b!171737))

(assert (= (and b!171737 c!30748) b!171738))

(assert (= (and b!171737 (not c!30748)) b!171735))

(assert (= (and b!171738 res!81557) b!171736))

(assert (= (or b!171736 b!171735) bm!17458))

(assert (=> b!171737 m!199441))

(assert (=> b!171737 m!199441))

(assert (=> b!171737 m!199443))

(assert (=> b!171738 m!199441))

(declare-fun m!200213 () Bool)

(assert (=> b!171738 m!200213))

(declare-fun m!200215 () Bool)

(assert (=> b!171738 m!200215))

(assert (=> b!171738 m!199441))

(declare-fun m!200217 () Bool)

(assert (=> b!171738 m!200217))

(declare-fun m!200219 () Bool)

(assert (=> bm!17458 m!200219))

(assert (=> bm!17393 d!52227))

(assert (=> b!170978 d!51651))

(declare-fun d!52229 () Bool)

(declare-fun e!113340 () Bool)

(assert (=> d!52229 e!113340))

(declare-fun res!81558 () Bool)

(assert (=> d!52229 (=> res!81558 e!113340)))

(declare-fun lt!85413 () Bool)

(assert (=> d!52229 (= res!81558 (not lt!85413))))

(declare-fun lt!85411 () Bool)

(assert (=> d!52229 (= lt!85413 lt!85411)))

(declare-fun lt!85410 () Unit!5227)

(declare-fun e!113339 () Unit!5227)

(assert (=> d!52229 (= lt!85410 e!113339)))

(declare-fun c!30749 () Bool)

(assert (=> d!52229 (= c!30749 lt!85411)))

(assert (=> d!52229 (= lt!85411 (containsKey!186 (toList!1091 lt!85168) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!52229 (= (contains!1142 lt!85168 (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) lt!85413)))

(declare-fun b!171739 () Bool)

(declare-fun lt!85412 () Unit!5227)

(assert (=> b!171739 (= e!113339 lt!85412)))

(assert (=> b!171739 (= lt!85412 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85168) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> b!171739 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85168) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171740 () Bool)

(declare-fun Unit!5270 () Unit!5227)

(assert (=> b!171740 (= e!113339 Unit!5270)))

(declare-fun b!171741 () Bool)

(assert (=> b!171741 (= e!113340 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85168) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52229 c!30749) b!171739))

(assert (= (and d!52229 (not c!30749)) b!171740))

(assert (= (and d!52229 (not res!81558)) b!171741))

(declare-fun m!200221 () Bool)

(assert (=> d!52229 m!200221))

(declare-fun m!200223 () Bool)

(assert (=> b!171739 m!200223))

(assert (=> b!171739 m!199275))

(assert (=> b!171739 m!199275))

(declare-fun m!200225 () Bool)

(assert (=> b!171739 m!200225))

(assert (=> b!171741 m!199275))

(assert (=> b!171741 m!199275))

(assert (=> b!171741 m!200225))

(assert (=> d!51787 d!52229))

(declare-fun b!171742 () Bool)

(declare-fun e!113341 () Option!188)

(assert (=> b!171742 (= e!113341 (Some!187 (_2!1627 (h!2816 lt!85166))))))

(declare-fun b!171744 () Bool)

(declare-fun e!113342 () Option!188)

(assert (=> b!171744 (= e!113342 (getValueByKey!182 (t!6996 lt!85166) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171745 () Bool)

(assert (=> b!171745 (= e!113342 None!186)))

(declare-fun d!52231 () Bool)

(declare-fun c!30750 () Bool)

(assert (=> d!52231 (= c!30750 (and ((_ is Cons!2199) lt!85166) (= (_1!1627 (h!2816 lt!85166)) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (=> d!52231 (= (getValueByKey!182 lt!85166 (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) e!113341)))

(declare-fun b!171743 () Bool)

(assert (=> b!171743 (= e!113341 e!113342)))

(declare-fun c!30751 () Bool)

(assert (=> b!171743 (= c!30751 (and ((_ is Cons!2199) lt!85166) (not (= (_1!1627 (h!2816 lt!85166)) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))))

(assert (= (and d!52231 c!30750) b!171742))

(assert (= (and d!52231 (not c!30750)) b!171743))

(assert (= (and b!171743 c!30751) b!171744))

(assert (= (and b!171743 (not c!30751)) b!171745))

(declare-fun m!200227 () Bool)

(assert (=> b!171744 m!200227))

(assert (=> d!51787 d!52231))

(declare-fun d!52233 () Bool)

(assert (=> d!52233 (= (getValueByKey!182 lt!85166 (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) (Some!187 (_2!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun lt!85414 () Unit!5227)

(assert (=> d!52233 (= lt!85414 (choose!933 lt!85166 (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun e!113343 () Bool)

(assert (=> d!52233 e!113343))

(declare-fun res!81559 () Bool)

(assert (=> d!52233 (=> (not res!81559) (not e!113343))))

(assert (=> d!52233 (= res!81559 (isStrictlySorted!326 lt!85166))))

(assert (=> d!52233 (= (lemmaContainsTupThenGetReturnValue!98 lt!85166 (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) lt!85414)))

(declare-fun b!171746 () Bool)

(declare-fun res!81560 () Bool)

(assert (=> b!171746 (=> (not res!81560) (not e!113343))))

(assert (=> b!171746 (= res!81560 (containsKey!186 lt!85166 (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171747 () Bool)

(assert (=> b!171747 (= e!113343 (contains!1144 lt!85166 (tuple2!3233 (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52233 res!81559) b!171746))

(assert (= (and b!171746 res!81560) b!171747))

(assert (=> d!52233 m!199269))

(declare-fun m!200229 () Bool)

(assert (=> d!52233 m!200229))

(declare-fun m!200231 () Bool)

(assert (=> d!52233 m!200231))

(declare-fun m!200233 () Bool)

(assert (=> b!171746 m!200233))

(declare-fun m!200235 () Bool)

(assert (=> b!171747 m!200235))

(assert (=> d!51787 d!52233))

(declare-fun e!113344 () List!2203)

(declare-fun b!171748 () Bool)

(assert (=> b!171748 (= e!113344 (insertStrictlySorted!101 (t!6996 (toList!1091 (ite c!30496 call!17390 (ite c!30494 call!17387 call!17391)))) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171749 () Bool)

(declare-fun e!113346 () List!2203)

(declare-fun call!17463 () List!2203)

(assert (=> b!171749 (= e!113346 call!17463)))

(declare-fun b!171750 () Bool)

(declare-fun e!113345 () List!2203)

(declare-fun call!17462 () List!2203)

(assert (=> b!171750 (= e!113345 call!17462)))

(declare-fun bm!17459 () Bool)

(declare-fun call!17464 () List!2203)

(assert (=> bm!17459 (= call!17464 call!17463)))

(declare-fun b!171751 () Bool)

(declare-fun e!113348 () List!2203)

(assert (=> b!171751 (= e!113346 e!113348)))

(declare-fun c!30752 () Bool)

(assert (=> b!171751 (= c!30752 (and ((_ is Cons!2199) (toList!1091 (ite c!30496 call!17390 (ite c!30494 call!17387 call!17391)))) (= (_1!1627 (h!2816 (toList!1091 (ite c!30496 call!17390 (ite c!30494 call!17387 call!17391))))) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun d!52235 () Bool)

(declare-fun e!113347 () Bool)

(assert (=> d!52235 e!113347))

(declare-fun res!81561 () Bool)

(assert (=> d!52235 (=> (not res!81561) (not e!113347))))

(declare-fun lt!85415 () List!2203)

(assert (=> d!52235 (= res!81561 (isStrictlySorted!326 lt!85415))))

(assert (=> d!52235 (= lt!85415 e!113346)))

(declare-fun c!30754 () Bool)

(assert (=> d!52235 (= c!30754 (and ((_ is Cons!2199) (toList!1091 (ite c!30496 call!17390 (ite c!30494 call!17387 call!17391)))) (bvslt (_1!1627 (h!2816 (toList!1091 (ite c!30496 call!17390 (ite c!30494 call!17387 call!17391))))) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (=> d!52235 (isStrictlySorted!326 (toList!1091 (ite c!30496 call!17390 (ite c!30494 call!17387 call!17391))))))

(assert (=> d!52235 (= (insertStrictlySorted!101 (toList!1091 (ite c!30496 call!17390 (ite c!30494 call!17387 call!17391))) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) lt!85415)))

(declare-fun b!171752 () Bool)

(assert (=> b!171752 (= e!113348 call!17464)))

(declare-fun b!171753 () Bool)

(declare-fun c!30753 () Bool)

(assert (=> b!171753 (= e!113344 (ite c!30752 (t!6996 (toList!1091 (ite c!30496 call!17390 (ite c!30494 call!17387 call!17391)))) (ite c!30753 (Cons!2199 (h!2816 (toList!1091 (ite c!30496 call!17390 (ite c!30494 call!17387 call!17391)))) (t!6996 (toList!1091 (ite c!30496 call!17390 (ite c!30494 call!17387 call!17391))))) Nil!2200)))))

(declare-fun bm!17460 () Bool)

(assert (=> bm!17460 (= call!17462 call!17464)))

(declare-fun b!171754 () Bool)

(assert (=> b!171754 (= c!30753 (and ((_ is Cons!2199) (toList!1091 (ite c!30496 call!17390 (ite c!30494 call!17387 call!17391)))) (bvsgt (_1!1627 (h!2816 (toList!1091 (ite c!30496 call!17390 (ite c!30494 call!17387 call!17391))))) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (=> b!171754 (= e!113348 e!113345)))

(declare-fun bm!17461 () Bool)

(assert (=> bm!17461 (= call!17463 ($colon$colon!96 e!113344 (ite c!30754 (h!2816 (toList!1091 (ite c!30496 call!17390 (ite c!30494 call!17387 call!17391)))) (tuple2!3233 (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))))

(declare-fun c!30755 () Bool)

(assert (=> bm!17461 (= c!30755 c!30754)))

(declare-fun b!171755 () Bool)

(declare-fun res!81562 () Bool)

(assert (=> b!171755 (=> (not res!81562) (not e!113347))))

(assert (=> b!171755 (= res!81562 (containsKey!186 lt!85415 (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171756 () Bool)

(assert (=> b!171756 (= e!113345 call!17462)))

(declare-fun b!171757 () Bool)

(assert (=> b!171757 (= e!113347 (contains!1144 lt!85415 (tuple2!3233 (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52235 c!30754) b!171749))

(assert (= (and d!52235 (not c!30754)) b!171751))

(assert (= (and b!171751 c!30752) b!171752))

(assert (= (and b!171751 (not c!30752)) b!171754))

(assert (= (and b!171754 c!30753) b!171756))

(assert (= (and b!171754 (not c!30753)) b!171750))

(assert (= (or b!171756 b!171750) bm!17460))

(assert (= (or b!171752 bm!17460) bm!17459))

(assert (= (or b!171749 bm!17459) bm!17461))

(assert (= (and bm!17461 c!30755) b!171748))

(assert (= (and bm!17461 (not c!30755)) b!171753))

(assert (= (and d!52235 res!81561) b!171755))

(assert (= (and b!171755 res!81562) b!171757))

(declare-fun m!200237 () Bool)

(assert (=> b!171748 m!200237))

(declare-fun m!200239 () Bool)

(assert (=> b!171757 m!200239))

(declare-fun m!200241 () Bool)

(assert (=> bm!17461 m!200241))

(declare-fun m!200243 () Bool)

(assert (=> b!171755 m!200243))

(declare-fun m!200245 () Bool)

(assert (=> d!52235 m!200245))

(declare-fun m!200247 () Bool)

(assert (=> d!52235 m!200247))

(assert (=> d!51787 d!52235))

(declare-fun lt!85416 () Bool)

(declare-fun d!52237 () Bool)

(assert (=> d!52237 (= lt!85416 (select (content!147 (toList!1091 lt!85111)) (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))))

(declare-fun e!113350 () Bool)

(assert (=> d!52237 (= lt!85416 e!113350)))

(declare-fun res!81563 () Bool)

(assert (=> d!52237 (=> (not res!81563) (not e!113350))))

(assert (=> d!52237 (= res!81563 ((_ is Cons!2199) (toList!1091 lt!85111)))))

(assert (=> d!52237 (= (contains!1144 (toList!1091 lt!85111) (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))) lt!85416)))

(declare-fun b!171758 () Bool)

(declare-fun e!113349 () Bool)

(assert (=> b!171758 (= e!113350 e!113349)))

(declare-fun res!81564 () Bool)

(assert (=> b!171758 (=> res!81564 e!113349)))

(assert (=> b!171758 (= res!81564 (= (h!2816 (toList!1091 lt!85111)) (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))))

(declare-fun b!171759 () Bool)

(assert (=> b!171759 (= e!113349 (contains!1144 (t!6996 (toList!1091 lt!85111)) (tuple2!3233 lt!84970 (zeroValue!3397 thiss!1248))))))

(assert (= (and d!52237 res!81563) b!171758))

(assert (= (and b!171758 (not res!81564)) b!171759))

(declare-fun m!200249 () Bool)

(assert (=> d!52237 m!200249))

(declare-fun m!200251 () Bool)

(assert (=> d!52237 m!200251))

(declare-fun m!200253 () Bool)

(assert (=> b!171759 m!200253))

(assert (=> b!171117 d!52237))

(declare-fun d!52239 () Bool)

(declare-fun e!113352 () Bool)

(assert (=> d!52239 e!113352))

(declare-fun res!81565 () Bool)

(assert (=> d!52239 (=> res!81565 e!113352)))

(declare-fun lt!85420 () Bool)

(assert (=> d!52239 (= res!81565 (not lt!85420))))

(declare-fun lt!85418 () Bool)

(assert (=> d!52239 (= lt!85420 lt!85418)))

(declare-fun lt!85417 () Unit!5227)

(declare-fun e!113351 () Unit!5227)

(assert (=> d!52239 (= lt!85417 e!113351)))

(declare-fun c!30756 () Bool)

(assert (=> d!52239 (= c!30756 lt!85418)))

(assert (=> d!52239 (= lt!85418 (containsKey!186 (toList!1091 lt!85141) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> d!52239 (= (contains!1142 lt!85141 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85420)))

(declare-fun b!171760 () Bool)

(declare-fun lt!85419 () Unit!5227)

(assert (=> b!171760 (= e!113351 lt!85419)))

(assert (=> b!171760 (= lt!85419 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85141) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> b!171760 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85141) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171761 () Bool)

(declare-fun Unit!5271 () Unit!5227)

(assert (=> b!171761 (= e!113351 Unit!5271)))

(declare-fun b!171762 () Bool)

(assert (=> b!171762 (= e!113352 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85141) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52239 c!30756) b!171760))

(assert (= (and d!52239 (not c!30756)) b!171761))

(assert (= (and d!52239 (not res!81565)) b!171762))

(declare-fun m!200255 () Bool)

(assert (=> d!52239 m!200255))

(declare-fun m!200257 () Bool)

(assert (=> b!171760 m!200257))

(assert (=> b!171760 m!199203))

(assert (=> b!171760 m!199203))

(declare-fun m!200259 () Bool)

(assert (=> b!171760 m!200259))

(assert (=> b!171762 m!199203))

(assert (=> b!171762 m!199203))

(assert (=> b!171762 m!200259))

(assert (=> d!51777 d!52239))

(declare-fun b!171763 () Bool)

(declare-fun e!113353 () Option!188)

(assert (=> b!171763 (= e!113353 (Some!187 (_2!1627 (h!2816 lt!85139))))))

(declare-fun b!171765 () Bool)

(declare-fun e!113354 () Option!188)

(assert (=> b!171765 (= e!113354 (getValueByKey!182 (t!6996 lt!85139) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171766 () Bool)

(assert (=> b!171766 (= e!113354 None!186)))

(declare-fun d!52241 () Bool)

(declare-fun c!30757 () Bool)

(assert (=> d!52241 (= c!30757 (and ((_ is Cons!2199) lt!85139) (= (_1!1627 (h!2816 lt!85139)) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!52241 (= (getValueByKey!182 lt!85139 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) e!113353)))

(declare-fun b!171764 () Bool)

(assert (=> b!171764 (= e!113353 e!113354)))

(declare-fun c!30758 () Bool)

(assert (=> b!171764 (= c!30758 (and ((_ is Cons!2199) lt!85139) (not (= (_1!1627 (h!2816 lt!85139)) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52241 c!30757) b!171763))

(assert (= (and d!52241 (not c!30757)) b!171764))

(assert (= (and b!171764 c!30758) b!171765))

(assert (= (and b!171764 (not c!30758)) b!171766))

(declare-fun m!200261 () Bool)

(assert (=> b!171765 m!200261))

(assert (=> d!51777 d!52241))

(declare-fun d!52243 () Bool)

(assert (=> d!52243 (= (getValueByKey!182 lt!85139 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85421 () Unit!5227)

(assert (=> d!52243 (= lt!85421 (choose!933 lt!85139 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun e!113355 () Bool)

(assert (=> d!52243 e!113355))

(declare-fun res!81566 () Bool)

(assert (=> d!52243 (=> (not res!81566) (not e!113355))))

(assert (=> d!52243 (= res!81566 (isStrictlySorted!326 lt!85139))))

(assert (=> d!52243 (= (lemmaContainsTupThenGetReturnValue!98 lt!85139 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85421)))

(declare-fun b!171767 () Bool)

(declare-fun res!81567 () Bool)

(assert (=> b!171767 (=> (not res!81567) (not e!113355))))

(assert (=> b!171767 (= res!81567 (containsKey!186 lt!85139 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171768 () Bool)

(assert (=> b!171768 (= e!113355 (contains!1144 lt!85139 (tuple2!3233 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52243 res!81566) b!171767))

(assert (= (and b!171767 res!81567) b!171768))

(assert (=> d!52243 m!199197))

(declare-fun m!200263 () Bool)

(assert (=> d!52243 m!200263))

(declare-fun m!200265 () Bool)

(assert (=> d!52243 m!200265))

(declare-fun m!200267 () Bool)

(assert (=> b!171767 m!200267))

(declare-fun m!200269 () Bool)

(assert (=> b!171768 m!200269))

(assert (=> d!51777 d!52243))

(declare-fun b!171769 () Bool)

(declare-fun e!113356 () List!2203)

(assert (=> b!171769 (= e!113356 (insertStrictlySorted!101 (t!6996 (toList!1091 call!17389)) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171770 () Bool)

(declare-fun e!113358 () List!2203)

(declare-fun call!17466 () List!2203)

(assert (=> b!171770 (= e!113358 call!17466)))

(declare-fun b!171771 () Bool)

(declare-fun e!113357 () List!2203)

(declare-fun call!17465 () List!2203)

(assert (=> b!171771 (= e!113357 call!17465)))

(declare-fun bm!17462 () Bool)

(declare-fun call!17467 () List!2203)

(assert (=> bm!17462 (= call!17467 call!17466)))

(declare-fun b!171772 () Bool)

(declare-fun e!113360 () List!2203)

(assert (=> b!171772 (= e!113358 e!113360)))

(declare-fun c!30759 () Bool)

(assert (=> b!171772 (= c!30759 (and ((_ is Cons!2199) (toList!1091 call!17389)) (= (_1!1627 (h!2816 (toList!1091 call!17389))) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun d!52245 () Bool)

(declare-fun e!113359 () Bool)

(assert (=> d!52245 e!113359))

(declare-fun res!81568 () Bool)

(assert (=> d!52245 (=> (not res!81568) (not e!113359))))

(declare-fun lt!85422 () List!2203)

(assert (=> d!52245 (= res!81568 (isStrictlySorted!326 lt!85422))))

(assert (=> d!52245 (= lt!85422 e!113358)))

(declare-fun c!30761 () Bool)

(assert (=> d!52245 (= c!30761 (and ((_ is Cons!2199) (toList!1091 call!17389)) (bvslt (_1!1627 (h!2816 (toList!1091 call!17389))) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!52245 (isStrictlySorted!326 (toList!1091 call!17389))))

(assert (=> d!52245 (= (insertStrictlySorted!101 (toList!1091 call!17389) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85422)))

(declare-fun b!171773 () Bool)

(assert (=> b!171773 (= e!113360 call!17467)))

(declare-fun c!30760 () Bool)

(declare-fun b!171774 () Bool)

(assert (=> b!171774 (= e!113356 (ite c!30759 (t!6996 (toList!1091 call!17389)) (ite c!30760 (Cons!2199 (h!2816 (toList!1091 call!17389)) (t!6996 (toList!1091 call!17389))) Nil!2200)))))

(declare-fun bm!17463 () Bool)

(assert (=> bm!17463 (= call!17465 call!17467)))

(declare-fun b!171775 () Bool)

(assert (=> b!171775 (= c!30760 (and ((_ is Cons!2199) (toList!1091 call!17389)) (bvsgt (_1!1627 (h!2816 (toList!1091 call!17389))) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> b!171775 (= e!113360 e!113357)))

(declare-fun bm!17464 () Bool)

(assert (=> bm!17464 (= call!17466 ($colon$colon!96 e!113356 (ite c!30761 (h!2816 (toList!1091 call!17389)) (tuple2!3233 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun c!30762 () Bool)

(assert (=> bm!17464 (= c!30762 c!30761)))

(declare-fun b!171776 () Bool)

(declare-fun res!81569 () Bool)

(assert (=> b!171776 (=> (not res!81569) (not e!113359))))

(assert (=> b!171776 (= res!81569 (containsKey!186 lt!85422 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171777 () Bool)

(assert (=> b!171777 (= e!113357 call!17465)))

(declare-fun b!171778 () Bool)

(assert (=> b!171778 (= e!113359 (contains!1144 lt!85422 (tuple2!3233 (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52245 c!30761) b!171770))

(assert (= (and d!52245 (not c!30761)) b!171772))

(assert (= (and b!171772 c!30759) b!171773))

(assert (= (and b!171772 (not c!30759)) b!171775))

(assert (= (and b!171775 c!30760) b!171777))

(assert (= (and b!171775 (not c!30760)) b!171771))

(assert (= (or b!171777 b!171771) bm!17463))

(assert (= (or b!171773 bm!17463) bm!17462))

(assert (= (or b!171770 bm!17462) bm!17464))

(assert (= (and bm!17464 c!30762) b!171769))

(assert (= (and bm!17464 (not c!30762)) b!171774))

(assert (= (and d!52245 res!81568) b!171776))

(assert (= (and b!171776 res!81569) b!171778))

(declare-fun m!200271 () Bool)

(assert (=> b!171769 m!200271))

(declare-fun m!200273 () Bool)

(assert (=> b!171778 m!200273))

(declare-fun m!200275 () Bool)

(assert (=> bm!17464 m!200275))

(declare-fun m!200277 () Bool)

(assert (=> b!171776 m!200277))

(declare-fun m!200279 () Bool)

(assert (=> d!52245 m!200279))

(declare-fun m!200281 () Bool)

(assert (=> d!52245 m!200281))

(assert (=> d!51777 d!52245))

(declare-fun d!52247 () Bool)

(declare-fun e!113362 () Bool)

(assert (=> d!52247 e!113362))

(declare-fun res!81570 () Bool)

(assert (=> d!52247 (=> res!81570 e!113362)))

(declare-fun lt!85426 () Bool)

(assert (=> d!52247 (= res!81570 (not lt!85426))))

(declare-fun lt!85424 () Bool)

(assert (=> d!52247 (= lt!85426 lt!85424)))

(declare-fun lt!85423 () Unit!5227)

(declare-fun e!113361 () Unit!5227)

(assert (=> d!52247 (= lt!85423 e!113361)))

(declare-fun c!30763 () Bool)

(assert (=> d!52247 (= c!30763 lt!85424)))

(assert (=> d!52247 (= lt!85424 (containsKey!186 (toList!1091 lt!85115) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))

(assert (=> d!52247 (= (contains!1142 lt!85115 (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))) lt!85426)))

(declare-fun b!171779 () Bool)

(declare-fun lt!85425 () Unit!5227)

(assert (=> b!171779 (= e!113361 lt!85425)))

(assert (=> b!171779 (= lt!85425 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85115) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))

(assert (=> b!171779 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85115) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))

(declare-fun b!171780 () Bool)

(declare-fun Unit!5272 () Unit!5227)

(assert (=> b!171780 (= e!113361 Unit!5272)))

(declare-fun b!171781 () Bool)

(assert (=> b!171781 (= e!113362 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85115) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52247 c!30763) b!171779))

(assert (= (and d!52247 (not c!30763)) b!171780))

(assert (= (and d!52247 (not res!81570)) b!171781))

(declare-fun m!200283 () Bool)

(assert (=> d!52247 m!200283))

(declare-fun m!200285 () Bool)

(assert (=> b!171779 m!200285))

(assert (=> b!171779 m!199121))

(assert (=> b!171779 m!199121))

(declare-fun m!200287 () Bool)

(assert (=> b!171779 m!200287))

(assert (=> b!171781 m!199121))

(assert (=> b!171781 m!199121))

(assert (=> b!171781 m!200287))

(assert (=> d!51749 d!52247))

(declare-fun b!171782 () Bool)

(declare-fun e!113363 () Option!188)

(assert (=> b!171782 (= e!113363 (Some!187 (_2!1627 (h!2816 lt!85113))))))

(declare-fun e!113364 () Option!188)

(declare-fun b!171784 () Bool)

(assert (=> b!171784 (= e!113364 (getValueByKey!182 (t!6996 lt!85113) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))

(declare-fun b!171785 () Bool)

(assert (=> b!171785 (= e!113364 None!186)))

(declare-fun d!52249 () Bool)

(declare-fun c!30764 () Bool)

(assert (=> d!52249 (= c!30764 (and ((_ is Cons!2199) lt!85113) (= (_1!1627 (h!2816 lt!85113)) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))))))

(assert (=> d!52249 (= (getValueByKey!182 lt!85113 (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))) e!113363)))

(declare-fun b!171783 () Bool)

(assert (=> b!171783 (= e!113363 e!113364)))

(declare-fun c!30765 () Bool)

(assert (=> b!171783 (= c!30765 (and ((_ is Cons!2199) lt!85113) (not (= (_1!1627 (h!2816 lt!85113)) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52249 c!30764) b!171782))

(assert (= (and d!52249 (not c!30764)) b!171783))

(assert (= (and b!171783 c!30765) b!171784))

(assert (= (and b!171783 (not c!30765)) b!171785))

(declare-fun m!200289 () Bool)

(assert (=> b!171784 m!200289))

(assert (=> d!51749 d!52249))

(declare-fun d!52251 () Bool)

(assert (=> d!52251 (= (getValueByKey!182 lt!85113 (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85427 () Unit!5227)

(assert (=> d!52251 (= lt!85427 (choose!933 lt!85113 (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))

(declare-fun e!113365 () Bool)

(assert (=> d!52251 e!113365))

(declare-fun res!81571 () Bool)

(assert (=> d!52251 (=> (not res!81571) (not e!113365))))

(assert (=> d!52251 (= res!81571 (isStrictlySorted!326 lt!85113))))

(assert (=> d!52251 (= (lemmaContainsTupThenGetReturnValue!98 lt!85113 (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))) lt!85427)))

(declare-fun b!171786 () Bool)

(declare-fun res!81572 () Bool)

(assert (=> b!171786 (=> (not res!81572) (not e!113365))))

(assert (=> b!171786 (= res!81572 (containsKey!186 lt!85113 (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))

(declare-fun b!171787 () Bool)

(assert (=> b!171787 (= e!113365 (contains!1144 lt!85113 (tuple2!3233 (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52251 res!81571) b!171786))

(assert (= (and b!171786 res!81572) b!171787))

(assert (=> d!52251 m!199115))

(declare-fun m!200291 () Bool)

(assert (=> d!52251 m!200291))

(declare-fun m!200293 () Bool)

(assert (=> d!52251 m!200293))

(declare-fun m!200295 () Bool)

(assert (=> b!171786 m!200295))

(declare-fun m!200297 () Bool)

(assert (=> b!171787 m!200297))

(assert (=> d!51749 d!52251))

(declare-fun e!113366 () List!2203)

(declare-fun b!171788 () Bool)

(assert (=> b!171788 (= e!113366 (insertStrictlySorted!101 (t!6996 (toList!1091 lt!84967)) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))

(declare-fun b!171789 () Bool)

(declare-fun e!113368 () List!2203)

(declare-fun call!17469 () List!2203)

(assert (=> b!171789 (= e!113368 call!17469)))

(declare-fun b!171790 () Bool)

(declare-fun e!113367 () List!2203)

(declare-fun call!17468 () List!2203)

(assert (=> b!171790 (= e!113367 call!17468)))

(declare-fun bm!17465 () Bool)

(declare-fun call!17470 () List!2203)

(assert (=> bm!17465 (= call!17470 call!17469)))

(declare-fun b!171791 () Bool)

(declare-fun e!113370 () List!2203)

(assert (=> b!171791 (= e!113368 e!113370)))

(declare-fun c!30766 () Bool)

(assert (=> b!171791 (= c!30766 (and ((_ is Cons!2199) (toList!1091 lt!84967)) (= (_1!1627 (h!2816 (toList!1091 lt!84967))) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))))))

(declare-fun d!52253 () Bool)

(declare-fun e!113369 () Bool)

(assert (=> d!52253 e!113369))

(declare-fun res!81573 () Bool)

(assert (=> d!52253 (=> (not res!81573) (not e!113369))))

(declare-fun lt!85428 () List!2203)

(assert (=> d!52253 (= res!81573 (isStrictlySorted!326 lt!85428))))

(assert (=> d!52253 (= lt!85428 e!113368)))

(declare-fun c!30768 () Bool)

(assert (=> d!52253 (= c!30768 (and ((_ is Cons!2199) (toList!1091 lt!84967)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84967))) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))))))

(assert (=> d!52253 (isStrictlySorted!326 (toList!1091 lt!84967))))

(assert (=> d!52253 (= (insertStrictlySorted!101 (toList!1091 lt!84967) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))) lt!85428)))

(declare-fun b!171792 () Bool)

(assert (=> b!171792 (= e!113370 call!17470)))

(declare-fun c!30767 () Bool)

(declare-fun b!171793 () Bool)

(assert (=> b!171793 (= e!113366 (ite c!30766 (t!6996 (toList!1091 lt!84967)) (ite c!30767 (Cons!2199 (h!2816 (toList!1091 lt!84967)) (t!6996 (toList!1091 lt!84967))) Nil!2200)))))

(declare-fun bm!17466 () Bool)

(assert (=> bm!17466 (= call!17468 call!17470)))

(declare-fun b!171794 () Bool)

(assert (=> b!171794 (= c!30767 (and ((_ is Cons!2199) (toList!1091 lt!84967)) (bvsgt (_1!1627 (h!2816 (toList!1091 lt!84967))) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))))))

(assert (=> b!171794 (= e!113370 e!113367)))

(declare-fun bm!17467 () Bool)

(assert (=> bm!17467 (= call!17469 ($colon$colon!96 e!113366 (ite c!30768 (h!2816 (toList!1091 lt!84967)) (tuple2!3233 (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))))

(declare-fun c!30769 () Bool)

(assert (=> bm!17467 (= c!30769 c!30768)))

(declare-fun b!171795 () Bool)

(declare-fun res!81574 () Bool)

(assert (=> b!171795 (=> (not res!81574) (not e!113369))))

(assert (=> b!171795 (= res!81574 (containsKey!186 lt!85428 (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))

(declare-fun b!171796 () Bool)

(assert (=> b!171796 (= e!113367 call!17468)))

(declare-fun b!171797 () Bool)

(assert (=> b!171797 (= e!113369 (contains!1144 lt!85428 (tuple2!3233 (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52253 c!30768) b!171789))

(assert (= (and d!52253 (not c!30768)) b!171791))

(assert (= (and b!171791 c!30766) b!171792))

(assert (= (and b!171791 (not c!30766)) b!171794))

(assert (= (and b!171794 c!30767) b!171796))

(assert (= (and b!171794 (not c!30767)) b!171790))

(assert (= (or b!171796 b!171790) bm!17466))

(assert (= (or b!171792 bm!17466) bm!17465))

(assert (= (or b!171789 bm!17465) bm!17467))

(assert (= (and bm!17467 c!30769) b!171788))

(assert (= (and bm!17467 (not c!30769)) b!171793))

(assert (= (and d!52253 res!81573) b!171795))

(assert (= (and b!171795 res!81574) b!171797))

(declare-fun m!200299 () Bool)

(assert (=> b!171788 m!200299))

(declare-fun m!200301 () Bool)

(assert (=> b!171797 m!200301))

(declare-fun m!200303 () Bool)

(assert (=> bm!17467 m!200303))

(declare-fun m!200305 () Bool)

(assert (=> b!171795 m!200305))

(declare-fun m!200307 () Bool)

(assert (=> d!52253 m!200307))

(declare-fun m!200309 () Bool)

(assert (=> d!52253 m!200309))

(assert (=> d!51749 d!52253))

(declare-fun d!52255 () Bool)

(assert (=> d!52255 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85429 () Unit!5227)

(assert (=> d!52255 (= lt!85429 (choose!930 (toList!1091 lt!84962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!113371 () Bool)

(assert (=> d!52255 e!113371))

(declare-fun res!81575 () Bool)

(assert (=> d!52255 (=> (not res!81575) (not e!113371))))

(assert (=> d!52255 (= res!81575 (isStrictlySorted!326 (toList!1091 lt!84962)))))

(assert (=> d!52255 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84962) #b0000000000000000000000000000000000000000000000000000000000000000) lt!85429)))

(declare-fun b!171798 () Bool)

(assert (=> b!171798 (= e!113371 (containsKey!186 (toList!1091 lt!84962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52255 res!81575) b!171798))

(assert (=> d!52255 m!198787))

(assert (=> d!52255 m!198787))

(assert (=> d!52255 m!198789))

(declare-fun m!200311 () Bool)

(assert (=> d!52255 m!200311))

(assert (=> d!52255 m!199657))

(assert (=> b!171798 m!198783))

(assert (=> b!170892 d!52255))

(assert (=> b!170892 d!52027))

(assert (=> b!170892 d!52029))

(declare-fun d!52257 () Bool)

(assert (=> d!52257 (= (get!1933 (getValueByKey!182 (toList!1091 (+!238 lt!84973 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))) lt!84968)) (v!3908 (getValueByKey!182 (toList!1091 (+!238 lt!84973 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))) lt!84968)))))

(assert (=> d!51757 d!52257))

(declare-fun e!113372 () Option!188)

(declare-fun b!171799 () Bool)

(assert (=> b!171799 (= e!113372 (Some!187 (_2!1627 (h!2816 (toList!1091 (+!238 lt!84973 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))))))))

(declare-fun b!171801 () Bool)

(declare-fun e!113373 () Option!188)

(assert (=> b!171801 (= e!113373 (getValueByKey!182 (t!6996 (toList!1091 (+!238 lt!84973 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))) lt!84968))))

(declare-fun b!171802 () Bool)

(assert (=> b!171802 (= e!113373 None!186)))

(declare-fun c!30770 () Bool)

(declare-fun d!52259 () Bool)

(assert (=> d!52259 (= c!30770 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84973 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))) (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84973 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))) lt!84968)))))

(assert (=> d!52259 (= (getValueByKey!182 (toList!1091 (+!238 lt!84973 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))) lt!84968) e!113372)))

(declare-fun b!171800 () Bool)

(assert (=> b!171800 (= e!113372 e!113373)))

(declare-fun c!30771 () Bool)

(assert (=> b!171800 (= c!30771 (and ((_ is Cons!2199) (toList!1091 (+!238 lt!84973 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248))))) (not (= (_1!1627 (h!2816 (toList!1091 (+!238 lt!84973 (tuple2!3233 lt!84971 (minValue!3397 thiss!1248)))))) lt!84968))))))

(assert (= (and d!52259 c!30770) b!171799))

(assert (= (and d!52259 (not c!30770)) b!171800))

(assert (= (and b!171800 c!30771) b!171801))

(assert (= (and b!171800 (not c!30771)) b!171802))

(declare-fun m!200313 () Bool)

(assert (=> b!171801 m!200313))

(assert (=> d!51757 d!52259))

(assert (=> b!171150 d!51803))

(assert (=> b!171018 d!52003))

(assert (=> b!171018 d!51785))

(declare-fun d!52261 () Bool)

(declare-fun e!113375 () Bool)

(assert (=> d!52261 e!113375))

(declare-fun res!81576 () Bool)

(assert (=> d!52261 (=> res!81576 e!113375)))

(declare-fun lt!85433 () Bool)

(assert (=> d!52261 (= res!81576 (not lt!85433))))

(declare-fun lt!85431 () Bool)

(assert (=> d!52261 (= lt!85433 lt!85431)))

(declare-fun lt!85430 () Unit!5227)

(declare-fun e!113374 () Unit!5227)

(assert (=> d!52261 (= lt!85430 e!113374)))

(declare-fun c!30772 () Bool)

(assert (=> d!52261 (= c!30772 lt!85431)))

(assert (=> d!52261 (= lt!85431 (containsKey!186 (toList!1091 lt!85043) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))

(assert (=> d!52261 (= (contains!1142 lt!85043 (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))) lt!85433)))

(declare-fun b!171803 () Bool)

(declare-fun lt!85432 () Unit!5227)

(assert (=> b!171803 (= e!113374 lt!85432)))

(assert (=> b!171803 (= lt!85432 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85043) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))

(assert (=> b!171803 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85043) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))

(declare-fun b!171804 () Bool)

(declare-fun Unit!5273 () Unit!5227)

(assert (=> b!171804 (= e!113374 Unit!5273)))

(declare-fun b!171805 () Bool)

(assert (=> b!171805 (= e!113375 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85043) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52261 c!30772) b!171803))

(assert (= (and d!52261 (not c!30772)) b!171804))

(assert (= (and d!52261 (not res!81576)) b!171805))

(declare-fun m!200315 () Bool)

(assert (=> d!52261 m!200315))

(declare-fun m!200317 () Bool)

(assert (=> b!171803 m!200317))

(assert (=> b!171803 m!198877))

(assert (=> b!171803 m!198877))

(declare-fun m!200319 () Bool)

(assert (=> b!171803 m!200319))

(assert (=> b!171805 m!198877))

(assert (=> b!171805 m!198877))

(assert (=> b!171805 m!200319))

(assert (=> d!51679 d!52261))

(declare-fun b!171806 () Bool)

(declare-fun e!113376 () Option!188)

(assert (=> b!171806 (= e!113376 (Some!187 (_2!1627 (h!2816 lt!85041))))))

(declare-fun b!171808 () Bool)

(declare-fun e!113377 () Option!188)

(assert (=> b!171808 (= e!113377 (getValueByKey!182 (t!6996 lt!85041) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))

(declare-fun b!171809 () Bool)

(assert (=> b!171809 (= e!113377 None!186)))

(declare-fun d!52263 () Bool)

(declare-fun c!30773 () Bool)

(assert (=> d!52263 (= c!30773 (and ((_ is Cons!2199) lt!85041) (= (_1!1627 (h!2816 lt!85041)) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))))))

(assert (=> d!52263 (= (getValueByKey!182 lt!85041 (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))) e!113376)))

(declare-fun b!171807 () Bool)

(assert (=> b!171807 (= e!113376 e!113377)))

(declare-fun c!30774 () Bool)

(assert (=> b!171807 (= c!30774 (and ((_ is Cons!2199) lt!85041) (not (= (_1!1627 (h!2816 lt!85041)) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52263 c!30773) b!171806))

(assert (= (and d!52263 (not c!30773)) b!171807))

(assert (= (and b!171807 c!30774) b!171808))

(assert (= (and b!171807 (not c!30774)) b!171809))

(declare-fun m!200321 () Bool)

(assert (=> b!171808 m!200321))

(assert (=> d!51679 d!52263))

(declare-fun d!52265 () Bool)

(assert (=> d!52265 (= (getValueByKey!182 lt!85041 (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))) (Some!187 (_2!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85434 () Unit!5227)

(assert (=> d!52265 (= lt!85434 (choose!933 lt!85041 (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))

(declare-fun e!113378 () Bool)

(assert (=> d!52265 e!113378))

(declare-fun res!81577 () Bool)

(assert (=> d!52265 (=> (not res!81577) (not e!113378))))

(assert (=> d!52265 (= res!81577 (isStrictlySorted!326 lt!85041))))

(assert (=> d!52265 (= (lemmaContainsTupThenGetReturnValue!98 lt!85041 (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))) lt!85434)))

(declare-fun b!171810 () Bool)

(declare-fun res!81578 () Bool)

(assert (=> b!171810 (=> (not res!81578) (not e!113378))))

(assert (=> b!171810 (= res!81578 (containsKey!186 lt!85041 (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))

(declare-fun b!171811 () Bool)

(assert (=> b!171811 (= e!113378 (contains!1144 lt!85041 (tuple2!3233 (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52265 res!81577) b!171810))

(assert (= (and b!171810 res!81578) b!171811))

(assert (=> d!52265 m!198871))

(declare-fun m!200323 () Bool)

(assert (=> d!52265 m!200323))

(declare-fun m!200325 () Bool)

(assert (=> d!52265 m!200325))

(declare-fun m!200327 () Bool)

(assert (=> b!171810 m!200327))

(declare-fun m!200329 () Bool)

(assert (=> b!171811 m!200329))

(assert (=> d!51679 d!52265))

(declare-fun b!171812 () Bool)

(declare-fun e!113379 () List!2203)

(assert (=> b!171812 (= e!113379 (insertStrictlySorted!101 (t!6996 (toList!1091 lt!84948)) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))

(declare-fun b!171813 () Bool)

(declare-fun e!113381 () List!2203)

(declare-fun call!17472 () List!2203)

(assert (=> b!171813 (= e!113381 call!17472)))

(declare-fun b!171814 () Bool)

(declare-fun e!113380 () List!2203)

(declare-fun call!17471 () List!2203)

(assert (=> b!171814 (= e!113380 call!17471)))

(declare-fun bm!17468 () Bool)

(declare-fun call!17473 () List!2203)

(assert (=> bm!17468 (= call!17473 call!17472)))

(declare-fun b!171815 () Bool)

(declare-fun e!113383 () List!2203)

(assert (=> b!171815 (= e!113381 e!113383)))

(declare-fun c!30775 () Bool)

(assert (=> b!171815 (= c!30775 (and ((_ is Cons!2199) (toList!1091 lt!84948)) (= (_1!1627 (h!2816 (toList!1091 lt!84948))) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))))))

(declare-fun d!52267 () Bool)

(declare-fun e!113382 () Bool)

(assert (=> d!52267 e!113382))

(declare-fun res!81579 () Bool)

(assert (=> d!52267 (=> (not res!81579) (not e!113382))))

(declare-fun lt!85435 () List!2203)

(assert (=> d!52267 (= res!81579 (isStrictlySorted!326 lt!85435))))

(assert (=> d!52267 (= lt!85435 e!113381)))

(declare-fun c!30777 () Bool)

(assert (=> d!52267 (= c!30777 (and ((_ is Cons!2199) (toList!1091 lt!84948)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84948))) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))))))

(assert (=> d!52267 (isStrictlySorted!326 (toList!1091 lt!84948))))

(assert (=> d!52267 (= (insertStrictlySorted!101 (toList!1091 lt!84948) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))) lt!85435)))

(declare-fun b!171816 () Bool)

(assert (=> b!171816 (= e!113383 call!17473)))

(declare-fun b!171817 () Bool)

(declare-fun c!30776 () Bool)

(assert (=> b!171817 (= e!113379 (ite c!30775 (t!6996 (toList!1091 lt!84948)) (ite c!30776 (Cons!2199 (h!2816 (toList!1091 lt!84948)) (t!6996 (toList!1091 lt!84948))) Nil!2200)))))

(declare-fun bm!17469 () Bool)

(assert (=> bm!17469 (= call!17471 call!17473)))

(declare-fun b!171818 () Bool)

(assert (=> b!171818 (= c!30776 (and ((_ is Cons!2199) (toList!1091 lt!84948)) (bvsgt (_1!1627 (h!2816 (toList!1091 lt!84948))) (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))))))

(assert (=> b!171818 (= e!113383 e!113380)))

(declare-fun bm!17470 () Bool)

(assert (=> bm!17470 (= call!17472 ($colon$colon!96 e!113379 (ite c!30777 (h!2816 (toList!1091 lt!84948)) (tuple2!3233 (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))))

(declare-fun c!30778 () Bool)

(assert (=> bm!17470 (= c!30778 c!30777)))

(declare-fun b!171819 () Bool)

(declare-fun res!81580 () Bool)

(assert (=> b!171819 (=> (not res!81580) (not e!113382))))

(assert (=> b!171819 (= res!81580 (containsKey!186 lt!85435 (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248)))))))

(declare-fun b!171820 () Bool)

(assert (=> b!171820 (= e!113380 call!17471)))

(declare-fun b!171821 () Bool)

(assert (=> b!171821 (= e!113382 (contains!1144 lt!85435 (tuple2!3233 (_1!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))) (_2!1627 (tuple2!3233 lt!84946 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52267 c!30777) b!171813))

(assert (= (and d!52267 (not c!30777)) b!171815))

(assert (= (and b!171815 c!30775) b!171816))

(assert (= (and b!171815 (not c!30775)) b!171818))

(assert (= (and b!171818 c!30776) b!171820))

(assert (= (and b!171818 (not c!30776)) b!171814))

(assert (= (or b!171820 b!171814) bm!17469))

(assert (= (or b!171816 bm!17469) bm!17468))

(assert (= (or b!171813 bm!17468) bm!17470))

(assert (= (and bm!17470 c!30778) b!171812))

(assert (= (and bm!17470 (not c!30778)) b!171817))

(assert (= (and d!52267 res!81579) b!171819))

(assert (= (and b!171819 res!81580) b!171821))

(declare-fun m!200331 () Bool)

(assert (=> b!171812 m!200331))

(declare-fun m!200333 () Bool)

(assert (=> b!171821 m!200333))

(declare-fun m!200335 () Bool)

(assert (=> bm!17470 m!200335))

(declare-fun m!200337 () Bool)

(assert (=> b!171819 m!200337))

(declare-fun m!200339 () Bool)

(assert (=> d!52267 m!200339))

(declare-fun m!200341 () Bool)

(assert (=> d!52267 m!200341))

(assert (=> d!51679 d!52267))

(declare-fun d!52269 () Bool)

(declare-fun res!81581 () Bool)

(declare-fun e!113384 () Bool)

(assert (=> d!52269 (=> res!81581 e!113384)))

(assert (=> d!52269 (= res!81581 (and ((_ is Cons!2199) lt!84895) (= (_1!1627 (h!2816 lt!84895)) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(assert (=> d!52269 (= (containsKey!186 lt!84895 (_1!1627 (tuple2!3233 key!828 v!309))) e!113384)))

(declare-fun b!171822 () Bool)

(declare-fun e!113385 () Bool)

(assert (=> b!171822 (= e!113384 e!113385)))

(declare-fun res!81582 () Bool)

(assert (=> b!171822 (=> (not res!81582) (not e!113385))))

(assert (=> b!171822 (= res!81582 (and (or (not ((_ is Cons!2199) lt!84895)) (bvsle (_1!1627 (h!2816 lt!84895)) (_1!1627 (tuple2!3233 key!828 v!309)))) ((_ is Cons!2199) lt!84895) (bvslt (_1!1627 (h!2816 lt!84895)) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(declare-fun b!171823 () Bool)

(assert (=> b!171823 (= e!113385 (containsKey!186 (t!6996 lt!84895) (_1!1627 (tuple2!3233 key!828 v!309))))))

(assert (= (and d!52269 (not res!81581)) b!171822))

(assert (= (and b!171822 res!81582) b!171823))

(declare-fun m!200343 () Bool)

(assert (=> b!171823 m!200343))

(assert (=> b!171027 d!52269))

(declare-fun d!52271 () Bool)

(declare-fun e!113387 () Bool)

(assert (=> d!52271 e!113387))

(declare-fun res!81583 () Bool)

(assert (=> d!52271 (=> res!81583 e!113387)))

(declare-fun lt!85439 () Bool)

(assert (=> d!52271 (= res!81583 (not lt!85439))))

(declare-fun lt!85437 () Bool)

(assert (=> d!52271 (= lt!85439 lt!85437)))

(declare-fun lt!85436 () Unit!5227)

(declare-fun e!113386 () Unit!5227)

(assert (=> d!52271 (= lt!85436 e!113386)))

(declare-fun c!30779 () Bool)

(assert (=> d!52271 (= c!30779 lt!85437)))

(assert (=> d!52271 (= lt!85437 (containsKey!186 (toList!1091 lt!85052) (_1!1627 (tuple2!3233 lt!84944 v!309))))))

(assert (=> d!52271 (= (contains!1142 lt!85052 (_1!1627 (tuple2!3233 lt!84944 v!309))) lt!85439)))

(declare-fun b!171824 () Bool)

(declare-fun lt!85438 () Unit!5227)

(assert (=> b!171824 (= e!113386 lt!85438)))

(assert (=> b!171824 (= lt!85438 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85052) (_1!1627 (tuple2!3233 lt!84944 v!309))))))

(assert (=> b!171824 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85052) (_1!1627 (tuple2!3233 lt!84944 v!309))))))

(declare-fun b!171825 () Bool)

(declare-fun Unit!5274 () Unit!5227)

(assert (=> b!171825 (= e!113386 Unit!5274)))

(declare-fun b!171826 () Bool)

(assert (=> b!171826 (= e!113387 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85052) (_1!1627 (tuple2!3233 lt!84944 v!309)))))))

(assert (= (and d!52271 c!30779) b!171824))

(assert (= (and d!52271 (not c!30779)) b!171825))

(assert (= (and d!52271 (not res!81583)) b!171826))

(declare-fun m!200345 () Bool)

(assert (=> d!52271 m!200345))

(declare-fun m!200347 () Bool)

(assert (=> b!171824 m!200347))

(assert (=> b!171824 m!198909))

(assert (=> b!171824 m!198909))

(declare-fun m!200349 () Bool)

(assert (=> b!171824 m!200349))

(assert (=> b!171826 m!198909))

(assert (=> b!171826 m!198909))

(assert (=> b!171826 m!200349))

(assert (=> d!51687 d!52271))

(declare-fun b!171827 () Bool)

(declare-fun e!113388 () Option!188)

(assert (=> b!171827 (= e!113388 (Some!187 (_2!1627 (h!2816 lt!85050))))))

(declare-fun b!171829 () Bool)

(declare-fun e!113389 () Option!188)

(assert (=> b!171829 (= e!113389 (getValueByKey!182 (t!6996 lt!85050) (_1!1627 (tuple2!3233 lt!84944 v!309))))))

(declare-fun b!171830 () Bool)

(assert (=> b!171830 (= e!113389 None!186)))

(declare-fun d!52273 () Bool)

(declare-fun c!30780 () Bool)

(assert (=> d!52273 (= c!30780 (and ((_ is Cons!2199) lt!85050) (= (_1!1627 (h!2816 lt!85050)) (_1!1627 (tuple2!3233 lt!84944 v!309)))))))

(assert (=> d!52273 (= (getValueByKey!182 lt!85050 (_1!1627 (tuple2!3233 lt!84944 v!309))) e!113388)))

(declare-fun b!171828 () Bool)

(assert (=> b!171828 (= e!113388 e!113389)))

(declare-fun c!30781 () Bool)

(assert (=> b!171828 (= c!30781 (and ((_ is Cons!2199) lt!85050) (not (= (_1!1627 (h!2816 lt!85050)) (_1!1627 (tuple2!3233 lt!84944 v!309))))))))

(assert (= (and d!52273 c!30780) b!171827))

(assert (= (and d!52273 (not c!30780)) b!171828))

(assert (= (and b!171828 c!30781) b!171829))

(assert (= (and b!171828 (not c!30781)) b!171830))

(declare-fun m!200351 () Bool)

(assert (=> b!171829 m!200351))

(assert (=> d!51687 d!52273))

(declare-fun d!52275 () Bool)

(assert (=> d!52275 (= (getValueByKey!182 lt!85050 (_1!1627 (tuple2!3233 lt!84944 v!309))) (Some!187 (_2!1627 (tuple2!3233 lt!84944 v!309))))))

(declare-fun lt!85440 () Unit!5227)

(assert (=> d!52275 (= lt!85440 (choose!933 lt!85050 (_1!1627 (tuple2!3233 lt!84944 v!309)) (_2!1627 (tuple2!3233 lt!84944 v!309))))))

(declare-fun e!113390 () Bool)

(assert (=> d!52275 e!113390))

(declare-fun res!81584 () Bool)

(assert (=> d!52275 (=> (not res!81584) (not e!113390))))

(assert (=> d!52275 (= res!81584 (isStrictlySorted!326 lt!85050))))

(assert (=> d!52275 (= (lemmaContainsTupThenGetReturnValue!98 lt!85050 (_1!1627 (tuple2!3233 lt!84944 v!309)) (_2!1627 (tuple2!3233 lt!84944 v!309))) lt!85440)))

(declare-fun b!171831 () Bool)

(declare-fun res!81585 () Bool)

(assert (=> b!171831 (=> (not res!81585) (not e!113390))))

(assert (=> b!171831 (= res!81585 (containsKey!186 lt!85050 (_1!1627 (tuple2!3233 lt!84944 v!309))))))

(declare-fun b!171832 () Bool)

(assert (=> b!171832 (= e!113390 (contains!1144 lt!85050 (tuple2!3233 (_1!1627 (tuple2!3233 lt!84944 v!309)) (_2!1627 (tuple2!3233 lt!84944 v!309)))))))

(assert (= (and d!52275 res!81584) b!171831))

(assert (= (and b!171831 res!81585) b!171832))

(assert (=> d!52275 m!198903))

(declare-fun m!200353 () Bool)

(assert (=> d!52275 m!200353))

(declare-fun m!200355 () Bool)

(assert (=> d!52275 m!200355))

(declare-fun m!200357 () Bool)

(assert (=> b!171831 m!200357))

(declare-fun m!200359 () Bool)

(assert (=> b!171832 m!200359))

(assert (=> d!51687 d!52275))

(declare-fun b!171833 () Bool)

(declare-fun e!113391 () List!2203)

(assert (=> b!171833 (= e!113391 (insertStrictlySorted!101 (t!6996 (toList!1091 lt!84947)) (_1!1627 (tuple2!3233 lt!84944 v!309)) (_2!1627 (tuple2!3233 lt!84944 v!309))))))

(declare-fun b!171834 () Bool)

(declare-fun e!113393 () List!2203)

(declare-fun call!17475 () List!2203)

(assert (=> b!171834 (= e!113393 call!17475)))

(declare-fun b!171835 () Bool)

(declare-fun e!113392 () List!2203)

(declare-fun call!17474 () List!2203)

(assert (=> b!171835 (= e!113392 call!17474)))

(declare-fun bm!17471 () Bool)

(declare-fun call!17476 () List!2203)

(assert (=> bm!17471 (= call!17476 call!17475)))

(declare-fun b!171836 () Bool)

(declare-fun e!113395 () List!2203)

(assert (=> b!171836 (= e!113393 e!113395)))

(declare-fun c!30782 () Bool)

(assert (=> b!171836 (= c!30782 (and ((_ is Cons!2199) (toList!1091 lt!84947)) (= (_1!1627 (h!2816 (toList!1091 lt!84947))) (_1!1627 (tuple2!3233 lt!84944 v!309)))))))

(declare-fun d!52277 () Bool)

(declare-fun e!113394 () Bool)

(assert (=> d!52277 e!113394))

(declare-fun res!81586 () Bool)

(assert (=> d!52277 (=> (not res!81586) (not e!113394))))

(declare-fun lt!85441 () List!2203)

(assert (=> d!52277 (= res!81586 (isStrictlySorted!326 lt!85441))))

(assert (=> d!52277 (= lt!85441 e!113393)))

(declare-fun c!30784 () Bool)

(assert (=> d!52277 (= c!30784 (and ((_ is Cons!2199) (toList!1091 lt!84947)) (bvslt (_1!1627 (h!2816 (toList!1091 lt!84947))) (_1!1627 (tuple2!3233 lt!84944 v!309)))))))

(assert (=> d!52277 (isStrictlySorted!326 (toList!1091 lt!84947))))

(assert (=> d!52277 (= (insertStrictlySorted!101 (toList!1091 lt!84947) (_1!1627 (tuple2!3233 lt!84944 v!309)) (_2!1627 (tuple2!3233 lt!84944 v!309))) lt!85441)))

(declare-fun b!171837 () Bool)

(assert (=> b!171837 (= e!113395 call!17476)))

(declare-fun c!30783 () Bool)

(declare-fun b!171838 () Bool)

(assert (=> b!171838 (= e!113391 (ite c!30782 (t!6996 (toList!1091 lt!84947)) (ite c!30783 (Cons!2199 (h!2816 (toList!1091 lt!84947)) (t!6996 (toList!1091 lt!84947))) Nil!2200)))))

(declare-fun bm!17472 () Bool)

(assert (=> bm!17472 (= call!17474 call!17476)))

(declare-fun b!171839 () Bool)

(assert (=> b!171839 (= c!30783 (and ((_ is Cons!2199) (toList!1091 lt!84947)) (bvsgt (_1!1627 (h!2816 (toList!1091 lt!84947))) (_1!1627 (tuple2!3233 lt!84944 v!309)))))))

(assert (=> b!171839 (= e!113395 e!113392)))

(declare-fun bm!17473 () Bool)

(assert (=> bm!17473 (= call!17475 ($colon$colon!96 e!113391 (ite c!30784 (h!2816 (toList!1091 lt!84947)) (tuple2!3233 (_1!1627 (tuple2!3233 lt!84944 v!309)) (_2!1627 (tuple2!3233 lt!84944 v!309))))))))

(declare-fun c!30785 () Bool)

(assert (=> bm!17473 (= c!30785 c!30784)))

(declare-fun b!171840 () Bool)

(declare-fun res!81587 () Bool)

(assert (=> b!171840 (=> (not res!81587) (not e!113394))))

(assert (=> b!171840 (= res!81587 (containsKey!186 lt!85441 (_1!1627 (tuple2!3233 lt!84944 v!309))))))

(declare-fun b!171841 () Bool)

(assert (=> b!171841 (= e!113392 call!17474)))

(declare-fun b!171842 () Bool)

(assert (=> b!171842 (= e!113394 (contains!1144 lt!85441 (tuple2!3233 (_1!1627 (tuple2!3233 lt!84944 v!309)) (_2!1627 (tuple2!3233 lt!84944 v!309)))))))

(assert (= (and d!52277 c!30784) b!171834))

(assert (= (and d!52277 (not c!30784)) b!171836))

(assert (= (and b!171836 c!30782) b!171837))

(assert (= (and b!171836 (not c!30782)) b!171839))

(assert (= (and b!171839 c!30783) b!171841))

(assert (= (and b!171839 (not c!30783)) b!171835))

(assert (= (or b!171841 b!171835) bm!17472))

(assert (= (or b!171837 bm!17472) bm!17471))

(assert (= (or b!171834 bm!17471) bm!17473))

(assert (= (and bm!17473 c!30785) b!171833))

(assert (= (and bm!17473 (not c!30785)) b!171838))

(assert (= (and d!52277 res!81586) b!171840))

(assert (= (and b!171840 res!81587) b!171842))

(declare-fun m!200361 () Bool)

(assert (=> b!171833 m!200361))

(declare-fun m!200363 () Bool)

(assert (=> b!171842 m!200363))

(declare-fun m!200365 () Bool)

(assert (=> bm!17473 m!200365))

(declare-fun m!200367 () Bool)

(assert (=> b!171840 m!200367))

(declare-fun m!200369 () Bool)

(assert (=> d!52277 m!200369))

(declare-fun m!200371 () Bool)

(assert (=> d!52277 m!200371))

(assert (=> d!51687 d!52277))

(declare-fun b!171843 () Bool)

(declare-fun e!113396 () Option!188)

(assert (=> b!171843 (= e!113396 (Some!187 (_2!1627 (h!2816 (t!6996 (toList!1091 lt!84992))))))))

(declare-fun b!171845 () Bool)

(declare-fun e!113397 () Option!188)

(assert (=> b!171845 (= e!113397 (getValueByKey!182 (t!6996 (t!6996 (toList!1091 lt!84992))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!171846 () Bool)

(assert (=> b!171846 (= e!113397 None!186)))

(declare-fun d!52279 () Bool)

(declare-fun c!30786 () Bool)

(assert (=> d!52279 (= c!30786 (and ((_ is Cons!2199) (t!6996 (toList!1091 lt!84992))) (= (_1!1627 (h!2816 (t!6996 (toList!1091 lt!84992)))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52279 (= (getValueByKey!182 (t!6996 (toList!1091 lt!84992)) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113396)))

(declare-fun b!171844 () Bool)

(assert (=> b!171844 (= e!113396 e!113397)))

(declare-fun c!30787 () Bool)

(assert (=> b!171844 (= c!30787 (and ((_ is Cons!2199) (t!6996 (toList!1091 lt!84992))) (not (= (_1!1627 (h!2816 (t!6996 (toList!1091 lt!84992)))) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (= (and d!52279 c!30786) b!171843))

(assert (= (and d!52279 (not c!30786)) b!171844))

(assert (= (and b!171844 c!30787) b!171845))

(assert (= (and b!171844 (not c!30787)) b!171846))

(declare-fun m!200373 () Bool)

(assert (=> b!171845 m!200373))

(assert (=> b!170926 d!52279))

(declare-fun d!52281 () Bool)

(declare-fun e!113399 () Bool)

(assert (=> d!52281 e!113399))

(declare-fun res!81588 () Bool)

(assert (=> d!52281 (=> res!81588 e!113399)))

(declare-fun lt!85445 () Bool)

(assert (=> d!52281 (= res!81588 (not lt!85445))))

(declare-fun lt!85443 () Bool)

(assert (=> d!52281 (= lt!85445 lt!85443)))

(declare-fun lt!85442 () Unit!5227)

(declare-fun e!113398 () Unit!5227)

(assert (=> d!52281 (= lt!85442 e!113398)))

(declare-fun c!30788 () Bool)

(assert (=> d!52281 (= c!30788 lt!85443)))

(assert (=> d!52281 (= lt!85443 (containsKey!186 (toList!1091 lt!85104) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52281 (= (contains!1142 lt!85104 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85445)))

(declare-fun b!171847 () Bool)

(declare-fun lt!85444 () Unit!5227)

(assert (=> b!171847 (= e!113398 lt!85444)))

(assert (=> b!171847 (= lt!85444 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85104) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171847 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85104) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171848 () Bool)

(declare-fun Unit!5275 () Unit!5227)

(assert (=> b!171848 (= e!113398 Unit!5275)))

(declare-fun b!171849 () Bool)

(assert (=> b!171849 (= e!113399 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85104) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52281 c!30788) b!171847))

(assert (= (and d!52281 (not c!30788)) b!171848))

(assert (= (and d!52281 (not res!81588)) b!171849))

(declare-fun m!200375 () Bool)

(assert (=> d!52281 m!200375))

(declare-fun m!200377 () Bool)

(assert (=> b!171847 m!200377))

(declare-fun m!200379 () Bool)

(assert (=> b!171847 m!200379))

(assert (=> b!171847 m!200379))

(declare-fun m!200381 () Bool)

(assert (=> b!171847 m!200381))

(assert (=> b!171849 m!200379))

(assert (=> b!171849 m!200379))

(assert (=> b!171849 m!200381))

(assert (=> d!51737 d!52281))

(assert (=> d!51737 d!51649))

(declare-fun lt!85446 () Bool)

(declare-fun d!52283 () Bool)

(assert (=> d!52283 (= lt!85446 (select (content!147 (toList!1091 lt!85126)) (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))))

(declare-fun e!113401 () Bool)

(assert (=> d!52283 (= lt!85446 e!113401)))

(declare-fun res!81589 () Bool)

(assert (=> d!52283 (=> (not res!81589) (not e!113401))))

(assert (=> d!52283 (= res!81589 ((_ is Cons!2199) (toList!1091 lt!85126)))))

(assert (=> d!52283 (= (contains!1144 (toList!1091 lt!85126) (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))) lt!85446)))

(declare-fun b!171850 () Bool)

(declare-fun e!113400 () Bool)

(assert (=> b!171850 (= e!113401 e!113400)))

(declare-fun res!81590 () Bool)

(assert (=> b!171850 (=> res!81590 e!113400)))

(assert (=> b!171850 (= res!81590 (= (h!2816 (toList!1091 lt!85126)) (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))))

(declare-fun b!171851 () Bool)

(assert (=> b!171851 (= e!113400 (contains!1144 (t!6996 (toList!1091 lt!85126)) (tuple2!3233 lt!84969 (zeroValue!3397 thiss!1248))))))

(assert (= (and d!52283 res!81589) b!171850))

(assert (= (and b!171850 (not res!81590)) b!171851))

(declare-fun m!200383 () Bool)

(assert (=> d!52283 m!200383))

(declare-fun m!200385 () Bool)

(assert (=> d!52283 m!200385))

(declare-fun m!200387 () Bool)

(assert (=> b!171851 m!200387))

(assert (=> b!171126 d!52283))

(declare-fun e!113402 () List!2203)

(declare-fun b!171852 () Bool)

(assert (=> b!171852 (= e!113402 (insertStrictlySorted!101 (t!6996 (t!6996 (toList!1091 (map!1834 thiss!1248)))) (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun b!171853 () Bool)

(declare-fun e!113404 () List!2203)

(declare-fun call!17478 () List!2203)

(assert (=> b!171853 (= e!113404 call!17478)))

(declare-fun b!171854 () Bool)

(declare-fun e!113403 () List!2203)

(declare-fun call!17477 () List!2203)

(assert (=> b!171854 (= e!113403 call!17477)))

(declare-fun bm!17474 () Bool)

(declare-fun call!17479 () List!2203)

(assert (=> bm!17474 (= call!17479 call!17478)))

(declare-fun b!171855 () Bool)

(declare-fun e!113406 () List!2203)

(assert (=> b!171855 (= e!113404 e!113406)))

(declare-fun c!30789 () Bool)

(assert (=> b!171855 (= c!30789 (and ((_ is Cons!2199) (t!6996 (toList!1091 (map!1834 thiss!1248)))) (= (_1!1627 (h!2816 (t!6996 (toList!1091 (map!1834 thiss!1248))))) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(declare-fun d!52285 () Bool)

(declare-fun e!113405 () Bool)

(assert (=> d!52285 e!113405))

(declare-fun res!81591 () Bool)

(assert (=> d!52285 (=> (not res!81591) (not e!113405))))

(declare-fun lt!85447 () List!2203)

(assert (=> d!52285 (= res!81591 (isStrictlySorted!326 lt!85447))))

(assert (=> d!52285 (= lt!85447 e!113404)))

(declare-fun c!30791 () Bool)

(assert (=> d!52285 (= c!30791 (and ((_ is Cons!2199) (t!6996 (toList!1091 (map!1834 thiss!1248)))) (bvslt (_1!1627 (h!2816 (t!6996 (toList!1091 (map!1834 thiss!1248))))) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(assert (=> d!52285 (isStrictlySorted!326 (t!6996 (toList!1091 (map!1834 thiss!1248))))))

(assert (=> d!52285 (= (insertStrictlySorted!101 (t!6996 (toList!1091 (map!1834 thiss!1248))) (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309))) lt!85447)))

(declare-fun b!171856 () Bool)

(assert (=> b!171856 (= e!113406 call!17479)))

(declare-fun b!171857 () Bool)

(declare-fun c!30790 () Bool)

(assert (=> b!171857 (= e!113402 (ite c!30789 (t!6996 (t!6996 (toList!1091 (map!1834 thiss!1248)))) (ite c!30790 (Cons!2199 (h!2816 (t!6996 (toList!1091 (map!1834 thiss!1248)))) (t!6996 (t!6996 (toList!1091 (map!1834 thiss!1248))))) Nil!2200)))))

(declare-fun bm!17475 () Bool)

(assert (=> bm!17475 (= call!17477 call!17479)))

(declare-fun b!171858 () Bool)

(assert (=> b!171858 (= c!30790 (and ((_ is Cons!2199) (t!6996 (toList!1091 (map!1834 thiss!1248)))) (bvsgt (_1!1627 (h!2816 (t!6996 (toList!1091 (map!1834 thiss!1248))))) (_1!1627 (tuple2!3233 key!828 v!309)))))))

(assert (=> b!171858 (= e!113406 e!113403)))

(declare-fun bm!17476 () Bool)

(assert (=> bm!17476 (= call!17478 ($colon$colon!96 e!113402 (ite c!30791 (h!2816 (t!6996 (toList!1091 (map!1834 thiss!1248)))) (tuple2!3233 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309))))))))

(declare-fun c!30792 () Bool)

(assert (=> bm!17476 (= c!30792 c!30791)))

(declare-fun b!171859 () Bool)

(declare-fun res!81592 () Bool)

(assert (=> b!171859 (=> (not res!81592) (not e!113405))))

(assert (=> b!171859 (= res!81592 (containsKey!186 lt!85447 (_1!1627 (tuple2!3233 key!828 v!309))))))

(declare-fun b!171860 () Bool)

(assert (=> b!171860 (= e!113403 call!17477)))

(declare-fun b!171861 () Bool)

(assert (=> b!171861 (= e!113405 (contains!1144 lt!85447 (tuple2!3233 (_1!1627 (tuple2!3233 key!828 v!309)) (_2!1627 (tuple2!3233 key!828 v!309)))))))

(assert (= (and d!52285 c!30791) b!171853))

(assert (= (and d!52285 (not c!30791)) b!171855))

(assert (= (and b!171855 c!30789) b!171856))

(assert (= (and b!171855 (not c!30789)) b!171858))

(assert (= (and b!171858 c!30790) b!171860))

(assert (= (and b!171858 (not c!30790)) b!171854))

(assert (= (or b!171860 b!171854) bm!17475))

(assert (= (or b!171856 bm!17475) bm!17474))

(assert (= (or b!171853 bm!17474) bm!17476))

(assert (= (and bm!17476 c!30792) b!171852))

(assert (= (and bm!17476 (not c!30792)) b!171857))

(assert (= (and d!52285 res!81591) b!171859))

(assert (= (and b!171859 res!81592) b!171861))

(declare-fun m!200389 () Bool)

(assert (=> b!171852 m!200389))

(declare-fun m!200391 () Bool)

(assert (=> b!171861 m!200391))

(declare-fun m!200393 () Bool)

(assert (=> bm!17476 m!200393))

(declare-fun m!200395 () Bool)

(assert (=> b!171859 m!200395))

(declare-fun m!200397 () Bool)

(assert (=> d!52285 m!200397))

(assert (=> d!52285 m!199331))

(assert (=> b!171049 d!52285))

(assert (=> b!171174 d!51915))

(declare-fun d!52287 () Bool)

(declare-fun e!113408 () Bool)

(assert (=> d!52287 e!113408))

(declare-fun res!81593 () Bool)

(assert (=> d!52287 (=> res!81593 e!113408)))

(declare-fun lt!85451 () Bool)

(assert (=> d!52287 (= res!81593 (not lt!85451))))

(declare-fun lt!85449 () Bool)

(assert (=> d!52287 (= lt!85451 lt!85449)))

(declare-fun lt!85448 () Unit!5227)

(declare-fun e!113407 () Unit!5227)

(assert (=> d!52287 (= lt!85448 e!113407)))

(declare-fun c!30793 () Bool)

(assert (=> d!52287 (= c!30793 lt!85449)))

(assert (=> d!52287 (= lt!85449 (containsKey!186 (toList!1091 lt!85031) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52287 (= (contains!1142 lt!85031 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85451)))

(declare-fun b!171862 () Bool)

(declare-fun lt!85450 () Unit!5227)

(assert (=> b!171862 (= e!113407 lt!85450)))

(assert (=> b!171862 (= lt!85450 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!85031) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171862 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85031) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171863 () Bool)

(declare-fun Unit!5276 () Unit!5227)

(assert (=> b!171863 (= e!113407 Unit!5276)))

(declare-fun b!171864 () Bool)

(assert (=> b!171864 (= e!113408 (isDefined!136 (getValueByKey!182 (toList!1091 lt!85031) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52287 c!30793) b!171862))

(assert (= (and d!52287 (not c!30793)) b!171863))

(assert (= (and d!52287 (not res!81593)) b!171864))

(declare-fun m!200399 () Bool)

(assert (=> d!52287 m!200399))

(declare-fun m!200401 () Bool)

(assert (=> b!171862 m!200401))

(declare-fun m!200403 () Bool)

(assert (=> b!171862 m!200403))

(assert (=> b!171862 m!200403))

(declare-fun m!200405 () Bool)

(assert (=> b!171862 m!200405))

(assert (=> b!171864 m!200403))

(assert (=> b!171864 m!200403))

(assert (=> b!171864 m!200405))

(assert (=> b!170982 d!52287))

(declare-fun b!171865 () Bool)

(declare-fun e!113409 () Option!188)

(assert (=> b!171865 (= e!113409 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!85093)))))))

(declare-fun b!171867 () Bool)

(declare-fun e!113410 () Option!188)

(assert (=> b!171867 (= e!113410 (getValueByKey!182 (t!6996 (toList!1091 lt!85093)) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171868 () Bool)

(assert (=> b!171868 (= e!113410 None!186)))

(declare-fun d!52289 () Bool)

(declare-fun c!30794 () Bool)

(assert (=> d!52289 (= c!30794 (and ((_ is Cons!2199) (toList!1091 lt!85093)) (= (_1!1627 (h!2816 (toList!1091 lt!85093))) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (=> d!52289 (= (getValueByKey!182 (toList!1091 lt!85093) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) e!113409)))

(declare-fun b!171866 () Bool)

(assert (=> b!171866 (= e!113409 e!113410)))

(declare-fun c!30795 () Bool)

(assert (=> b!171866 (= c!30795 (and ((_ is Cons!2199) (toList!1091 lt!85093)) (not (= (_1!1627 (h!2816 (toList!1091 lt!85093))) (_1!1627 (ite (or c!30490 c!30488) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))))

(assert (= (and d!52289 c!30794) b!171865))

(assert (= (and d!52289 (not c!30794)) b!171866))

(assert (= (and b!171866 c!30795) b!171867))

(assert (= (and b!171866 (not c!30795)) b!171868))

(declare-fun m!200407 () Bool)

(assert (=> b!171867 m!200407))

(assert (=> b!171066 d!52289))

(declare-fun d!52291 () Bool)

(assert (=> d!52291 (isDefined!136 (getValueByKey!182 (toList!1091 lt!84987) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85452 () Unit!5227)

(assert (=> d!52291 (= lt!85452 (choose!930 (toList!1091 lt!84987) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!113411 () Bool)

(assert (=> d!52291 e!113411))

(declare-fun res!81594 () Bool)

(assert (=> d!52291 (=> (not res!81594) (not e!113411))))

(assert (=> d!52291 (= res!81594 (isStrictlySorted!326 (toList!1091 lt!84987)))))

(assert (=> d!52291 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!1091 lt!84987) #b1000000000000000000000000000000000000000000000000000000000000000) lt!85452)))

(declare-fun b!171869 () Bool)

(assert (=> b!171869 (= e!113411 (containsKey!186 (toList!1091 lt!84987) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52291 res!81594) b!171869))

(assert (=> d!52291 m!198819))

(assert (=> d!52291 m!198819))

(assert (=> d!52291 m!198961))

(declare-fun m!200409 () Bool)

(assert (=> d!52291 m!200409))

(assert (=> d!52291 m!199731))

(assert (=> b!171869 m!198957))

(assert (=> b!171010 d!52291))

(assert (=> b!171010 d!52009))

(assert (=> b!171010 d!52011))

(assert (=> b!171015 d!51999))

(assert (=> b!171015 d!51863))

(assert (=> b!171144 d!52043))

(assert (=> b!171144 d!51951))

(declare-fun b!171870 () Bool)

(declare-fun e!113412 () Option!188)

(assert (=> b!171870 (= e!113412 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!85168)))))))

(declare-fun b!171872 () Bool)

(declare-fun e!113413 () Option!188)

(assert (=> b!171872 (= e!113413 (getValueByKey!182 (t!6996 (toList!1091 lt!85168)) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171873 () Bool)

(assert (=> b!171873 (= e!113413 None!186)))

(declare-fun c!30796 () Bool)

(declare-fun d!52293 () Bool)

(assert (=> d!52293 (= c!30796 (and ((_ is Cons!2199) (toList!1091 lt!85168)) (= (_1!1627 (h!2816 (toList!1091 lt!85168))) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (=> d!52293 (= (getValueByKey!182 (toList!1091 lt!85168) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) e!113412)))

(declare-fun b!171871 () Bool)

(assert (=> b!171871 (= e!113412 e!113413)))

(declare-fun c!30797 () Bool)

(assert (=> b!171871 (= c!30797 (and ((_ is Cons!2199) (toList!1091 lt!85168)) (not (= (_1!1627 (h!2816 (toList!1091 lt!85168))) (_1!1627 (ite (or c!30496 c!30494) (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))))

(assert (= (and d!52293 c!30796) b!171870))

(assert (= (and d!52293 (not c!30796)) b!171871))

(assert (= (and b!171871 c!30797) b!171872))

(assert (= (and b!171871 (not c!30797)) b!171873))

(declare-fun m!200411 () Bool)

(assert (=> b!171872 m!200411))

(assert (=> b!171180 d!52293))

(declare-fun b!171874 () Bool)

(declare-fun e!113414 () Option!188)

(assert (=> b!171874 (= e!113414 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!85141)))))))

(declare-fun b!171876 () Bool)

(declare-fun e!113415 () Option!188)

(assert (=> b!171876 (= e!113415 (getValueByKey!182 (t!6996 (toList!1091 lt!85141)) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171877 () Bool)

(assert (=> b!171877 (= e!113415 None!186)))

(declare-fun d!52295 () Bool)

(declare-fun c!30798 () Bool)

(assert (=> d!52295 (= c!30798 (and ((_ is Cons!2199) (toList!1091 lt!85141)) (= (_1!1627 (h!2816 (toList!1091 lt!85141))) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!52295 (= (getValueByKey!182 (toList!1091 lt!85141) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) e!113414)))

(declare-fun b!171875 () Bool)

(assert (=> b!171875 (= e!113414 e!113415)))

(declare-fun c!30799 () Bool)

(assert (=> b!171875 (= c!30799 (and ((_ is Cons!2199) (toList!1091 lt!85141)) (not (= (_1!1627 (h!2816 (toList!1091 lt!85141))) (_1!1627 (tuple2!3233 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52295 c!30798) b!171874))

(assert (= (and d!52295 (not c!30798)) b!171875))

(assert (= (and b!171875 c!30799) b!171876))

(assert (= (and b!171875 (not c!30799)) b!171877))

(declare-fun m!200413 () Bool)

(assert (=> b!171876 m!200413))

(assert (=> b!171145 d!52295))

(declare-fun b!171878 () Bool)

(declare-fun e!113416 () Option!188)

(assert (=> b!171878 (= e!113416 (Some!187 (_2!1627 (h!2816 (toList!1091 lt!85115)))))))

(declare-fun b!171880 () Bool)

(declare-fun e!113417 () Option!188)

(assert (=> b!171880 (= e!113417 (getValueByKey!182 (t!6996 (toList!1091 lt!85115)) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))

(declare-fun b!171881 () Bool)

(assert (=> b!171881 (= e!113417 None!186)))

(declare-fun c!30800 () Bool)

(declare-fun d!52297 () Bool)

(assert (=> d!52297 (= c!30800 (and ((_ is Cons!2199) (toList!1091 lt!85115)) (= (_1!1627 (h!2816 (toList!1091 lt!85115))) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248))))))))

(assert (=> d!52297 (= (getValueByKey!182 (toList!1091 lt!85115) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))) e!113416)))

(declare-fun b!171879 () Bool)

(assert (=> b!171879 (= e!113416 e!113417)))

(declare-fun c!30801 () Bool)

(assert (=> b!171879 (= c!30801 (and ((_ is Cons!2199) (toList!1091 lt!85115)) (not (= (_1!1627 (h!2816 (toList!1091 lt!85115))) (_1!1627 (tuple2!3233 lt!84988 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52297 c!30800) b!171878))

(assert (= (and d!52297 (not c!30800)) b!171879))

(assert (= (and b!171879 c!30801) b!171880))

(assert (= (and b!171879 (not c!30801)) b!171881))

(declare-fun m!200415 () Bool)

(assert (=> b!171880 m!200415))

(assert (=> b!171118 d!52297))

(assert (=> d!51727 d!51725))

(declare-fun d!52299 () Bool)

(assert (=> d!52299 (= (getValueByKey!182 lt!84990 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!187 (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52299 true))

(declare-fun _$22!532 () Unit!5227)

(assert (=> d!52299 (= (choose!933 lt!84990 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) _$22!532)))

(declare-fun bs!7083 () Bool)

(assert (= bs!7083 d!52299))

(assert (=> bs!7083 m!198763))

(assert (=> d!51727 d!52299))

(declare-fun d!52301 () Bool)

(declare-fun res!81595 () Bool)

(declare-fun e!113418 () Bool)

(assert (=> d!52301 (=> res!81595 e!113418)))

(assert (=> d!52301 (= res!81595 (or ((_ is Nil!2200) lt!84990) ((_ is Nil!2200) (t!6996 lt!84990))))))

(assert (=> d!52301 (= (isStrictlySorted!326 lt!84990) e!113418)))

(declare-fun b!171882 () Bool)

(declare-fun e!113419 () Bool)

(assert (=> b!171882 (= e!113418 e!113419)))

(declare-fun res!81596 () Bool)

(assert (=> b!171882 (=> (not res!81596) (not e!113419))))

(assert (=> b!171882 (= res!81596 (bvslt (_1!1627 (h!2816 lt!84990)) (_1!1627 (h!2816 (t!6996 lt!84990)))))))

(declare-fun b!171883 () Bool)

(assert (=> b!171883 (= e!113419 (isStrictlySorted!326 (t!6996 lt!84990)))))

(assert (= (and d!52301 (not res!81595)) b!171882))

(assert (= (and b!171882 res!81596) b!171883))

(declare-fun m!200417 () Bool)

(assert (=> b!171883 m!200417))

(assert (=> d!51727 d!52301))

(declare-fun d!52303 () Bool)

(declare-fun res!81597 () Bool)

(declare-fun e!113420 () Bool)

(assert (=> d!52303 (=> res!81597 e!113420)))

(assert (=> d!52303 (= res!81597 (and ((_ is Cons!2199) lt!85099) (= (_1!1627 (h!2816 lt!85099)) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52303 (= (containsKey!186 lt!85099 (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113420)))

(declare-fun b!171884 () Bool)

(declare-fun e!113421 () Bool)

(assert (=> b!171884 (= e!113420 e!113421)))

(declare-fun res!81598 () Bool)

(assert (=> b!171884 (=> (not res!81598) (not e!113421))))

(assert (=> b!171884 (= res!81598 (and (or (not ((_ is Cons!2199) lt!85099)) (bvsle (_1!1627 (h!2816 lt!85099)) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2199) lt!85099) (bvslt (_1!1627 (h!2816 lt!85099)) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171885 () Bool)

(assert (=> b!171885 (= e!113421 (containsKey!186 (t!6996 lt!85099) (_1!1627 (tuple2!3233 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52303 (not res!81597)) b!171884))

(assert (= (and b!171884 res!81598) b!171885))

(declare-fun m!200419 () Bool)

(assert (=> b!171885 m!200419))

(assert (=> b!171084 d!52303))

(declare-fun mapNonEmpty!6808 () Bool)

(declare-fun mapRes!6808 () Bool)

(declare-fun tp!15340 () Bool)

(declare-fun e!113423 () Bool)

(assert (=> mapNonEmpty!6808 (= mapRes!6808 (and tp!15340 e!113423))))

(declare-fun mapValue!6808 () ValueCell!1658)

(declare-fun mapRest!6808 () (Array (_ BitVec 32) ValueCell!1658))

(declare-fun mapKey!6808 () (_ BitVec 32))

(assert (=> mapNonEmpty!6808 (= mapRest!6807 (store mapRest!6808 mapKey!6808 mapValue!6808))))

(declare-fun condMapEmpty!6808 () Bool)

(declare-fun mapDefault!6808 () ValueCell!1658)

(assert (=> mapNonEmpty!6807 (= condMapEmpty!6808 (= mapRest!6807 ((as const (Array (_ BitVec 32) ValueCell!1658)) mapDefault!6808)))))

(declare-fun e!113422 () Bool)

(assert (=> mapNonEmpty!6807 (= tp!15339 (and e!113422 mapRes!6808))))

(declare-fun mapIsEmpty!6808 () Bool)

(assert (=> mapIsEmpty!6808 mapRes!6808))

(declare-fun b!171887 () Bool)

(assert (=> b!171887 (= e!113422 tp_is_empty!4003)))

(declare-fun b!171886 () Bool)

(assert (=> b!171886 (= e!113423 tp_is_empty!4003)))

(assert (= (and mapNonEmpty!6807 condMapEmpty!6808) mapIsEmpty!6808))

(assert (= (and mapNonEmpty!6807 (not condMapEmpty!6808)) mapNonEmpty!6808))

(assert (= (and mapNonEmpty!6808 ((_ is ValueCellFull!1658) mapValue!6808)) b!171886))

(assert (= (and mapNonEmpty!6807 ((_ is ValueCellFull!1658) mapDefault!6808)) b!171887))

(declare-fun m!200421 () Bool)

(assert (=> mapNonEmpty!6808 m!200421))

(declare-fun b_lambda!6907 () Bool)

(assert (= b_lambda!6899 (or (and b!170714 b_free!4231) b_lambda!6907)))

(declare-fun b_lambda!6909 () Bool)

(assert (= b_lambda!6903 (or (and b!170714 b_free!4231) b_lambda!6909)))

(declare-fun b_lambda!6911 () Bool)

(assert (= b_lambda!6885 (or (and b!170714 b_free!4231 (= (defaultEntry!3554 thiss!1248) (defaultEntry!3554 lt!84854))) b_lambda!6911)))

(declare-fun b_lambda!6913 () Bool)

(assert (= b_lambda!6901 (or (and b!170714 b_free!4231) b_lambda!6913)))

(declare-fun b_lambda!6915 () Bool)

(assert (= b_lambda!6905 (or (and b!170714 b_free!4231) b_lambda!6915)))

(check-sat (not b!171730) (not b!171657) (not b!171663) (not d!51841) (not bm!17461) (not bm!17464) (not b!171872) (not d!51845) (not b!171248) (not d!52097) (not b!171861) (not b!171728) (not d!51947) (not d!51889) (not d!52165) (not b!171703) (not b_lambda!6889) (not d!52221) (not b!171717) (not b!171398) (not d!52063) (not b!171550) (not b!171641) (not b!171385) (not b!171539) (not b!171765) (not b!171477) (not d!52081) (not b!171755) (not d!52265) (not b!171276) (not b!171862) (not b!171464) (not b!171558) (not b!171798) (not d!52237) (not b!171384) (not b!171520) (not b!171360) (not b!171677) (not b!171767) (not d!52037) (not d!51945) (not b!171599) (not bm!17470) (not b!171412) (not bm!17454) (not d!52247) (not b!171823) (not b!171421) (not d!52245) (not b!171623) (not b!171572) (not d!52071) (not b!171797) (not b!171292) (not b!171552) (not b!171601) (not d!52145) (not b!171473) (not b!171832) (not b!171285) (not b!171787) (not b!171650) (not b!171757) (not d!51903) (not b!171466) (not b!171501) (not b!171701) (not b!171824) (not d!52093) (not d!51995) (not d!52215) (not d!52283) (not d!52085) (not b!171748) (not d!51839) (not b!171831) (not b!171739) (not b!171628) (not d!52137) (not b!171316) (not b!171710) (not d!51987) (not bm!17432) (not d!52177) (not b!171319) (not b!171596) (not d!52115) (not b!171364) (not d!52261) (not b!171196) (not b!171547) tp_is_empty!4003 (not b!171885) (not b!171460) (not d!51941) (not b!171320) (not b!171685) (not b!171625) (not d!51801) (not d!51825) (not d!52049) (not b!171301) (not b!171536) (not d!51817) (not b!171268) (not b!171350) (not b!171361) (not b!171635) (not b!171425) (not b!171512) (not b!171543) (not b!171859) (not b!171407) (not b_lambda!6887) (not bm!17451) (not b!171661) (not b!171216) (not bm!17457) (not b!171842) (not b_lambda!6911) (not d!52255) (not b!171462) (not d!51925) (not d!52025) (not d!52091) (not b!171233) (not d!52079) (not d!52043) (not b_lambda!6909) (not b!171441) (not b_lambda!6915) (not b!171561) (not bm!17446) (not b!171516) (not d!52129) (not b!171447) (not b!171429) (not b!171215) (not b!171683) (not d!51999) (not b!171200) (not d!51883) (not b!171704) (not b!171715) (not b!171390) (not d!52167) (not b!171584) (not d!52149) (not b!171598) (not d!51923) (not d!52027) (not d!51799) (not d!52155) (not d!52271) (not b!171448) (not d!51811) (not b!171786) (not b!171497) (not d!51913) (not b!171883) (not b!171692) (not b!171260) (not bm!17449) (not b!171494) (not b!171481) (not d!52101) (not b!171617) (not b!171630) (not b!171257) (not d!51991) (not b!171769) (not d!52229) (not d!51977) (not d!51953) (not d!52157) (not b!171314) (not b!171290) (not d!52031) (not bm!17440) (not b_lambda!6907) (not d!52135) (not b!171553) (not d!52183) (not d!52191) (not b!171726) (not b!171546) (not b!171593) (not d!52235) (not b!171851) (not b!171664) (not b!171662) (not b!171283) (not d!51815) (not d!52089) (not b!171281) (not b!171226) (not b!171411) (not b!171779) (not b!171810) (not d!52175) (not b!171845) (not b!171197) (not bm!17458) (not b!171236) (not d!52253) (not d!52065) (not b!171286) (not b!171414) (not b_lambda!6891) (not b!171768) (not b!171737) (not b!171582) (not bm!17439) (not b!171801) (not b!171428) (not b!171353) (not b!171632) (not b!171741) (not b!171474) (not b!171203) (not b!171562) (not b!171433) (not b!171250) (not b!171864) (not b!171431) (not d!52067) (not b!171867) (not b_next!4231) (not d!52285) (not d!52151) (not b!171391) (not b!171297) (not b!171227) (not d!52009) (not b!171423) (not d!52001) (not d!52041) (not b!171659) (not b!171776) (not b!171747) (not b!171265) (not d!51927) (not b!171302) (not bm!17429) (not b!171712) (not d!52291) (not b!171688) (not d!52141) (not b!171638) (not b!171709) (not d!52287) (not b!171311) (not b!171262) (not d!51819) (not b!171404) (not d!51897) (not d!52281) (not d!52127) (not d!51907) (not b!171318) (not d!52161) (not d!51985) (not b!171760) (not b!171580) (not b!171455) (not b!171362) (not b!171819) (not d!51809) (not d!52113) (not d!52197) (not b!171514) (not b!171620) (not b!171574) (not b!171307) (not d!52163) (not d!51821) (not b!171591) (not b_lambda!6895) (not b!171699) (not b!171369) (not d!52099) (not b_lambda!6913) (not b!171194) (not bm!17473) (not b!171668) (not b!171436) (not d!51901) (not d!52277) (not b!171733) (not d!52169) (not bm!17443) (not b!171821) (not b!171555) (not b!171626) (not b_lambda!6873) (not b!171738) (not b!171840) (not b!171506) (not d!51979) (not bm!17476) (not b!171849) (not b!171341) (not b!171288) (not b!171508) (not bm!17467) (not b!171788) (not b!171781) (not d!52153) (not bm!17435) (not b!171719) (not b!171388) (not d!52243) (not d!52267) (not b!171560) (not b!171607) (not b!171653) (not d!52109) (not b!171259) (not b!171457) (not b!171812) (not b!171762) (not b!171202) (not b!171380) (not d!51849) (not b!171387) (not d!51833) (not b!171645) (not b!171444) (not b!171509) (not b!171409) (not b!171213) (not b!171876) (not b!171533) (not b!171852) (not d!51929) (not b!171655) (not b!171223) (not b!171489) (not d!51943) (not d!51973) (not b!171291) (not b!171439) (not d!51957) (not b!171681) (not b!171504) (not b!171647) (not b!171784) (not b!171326) (not b!171705) (not b!171485) (not b!171401) (not b!171691) (not b_lambda!6875) (not b!171201) (not d!52075) (not b!171808) (not b!171529) (not b!171639) (not b!171759) (not b!171221) (not d!52275) (not b!171577) (not b!171673) (not b!171304) (not d!52021) (not d!52195) (not b!171811) (not b!171469) (not b!171615) (not b!171357) (not d!51871) (not d!52173) (not b!171366) (not b!171382) (not b!171608) (not b!171243) (not d!52251) (not b!171829) (not b!171644) (not b!171499) (not b!171207) (not d!52103) (not b!171199) (not d!51875) (not b!171667) (not b!171222) (not d!51961) (not b!171538) (not b!171571) (not d!51965) (not d!51963) (not b!171826) (not d!52233) (not bm!17426) (not b!171549) (not d!51823) (not b!171518) (not d!51879) (not d!51989) (not d!51997) (not b!171381) (not b!171544) (not b!171805) (not b!171803) (not b!171523) (not b!171718) (not d!51853) (not bm!17433) b_and!10649 (not mapNonEmpty!6808) (not b!171583) (not bm!17434) (not b!171434) (not d!52299) (not d!52239) (not b!171267) (not b!171594) (not d!52045) (not b!171746) (not b!171347) (not b!171656) (not bm!17436) (not b!171526) (not b!171373) (not b!171418) (not b!171604) (not b!171706) (not b!171219) (not d!51959) (not b!171435) (not b!171359) (not b!171880) (not b!171278) (not b!171833) (not d!52003) (not d!52223) (not d!52143) (not d!52207) (not b!171847) (not b!171427) (not b!171541) (not b!171245) (not b!171744) (not b!171395) (not d!52121) (not b_lambda!6893) (not b!171707) (not b!171690) (not d!52159) (not d!52055) (not b!171778) (not d!51905) (not d!51967) (not d!52171) (not b!171575) (not b!171446) (not d!51847) (not b!171289) (not b!171569) (not b!171606) (not b!171225) (not b!171643) (not b!171660) (not d!52133) (not bm!17450) (not b!171492) (not d!52125) (not b!171389) (not d!52087) (not b!171666) (not d!52033) (not b!171269) (not d!52205) (not b_lambda!6897) (not b!171869) (not d!52219) (not b!171795) (not d!52035))
(check-sat b_and!10649 (not b_next!4231))
