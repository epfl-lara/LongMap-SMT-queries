; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34136 () Bool)

(assert start!34136)

(declare-fun b_free!7179 () Bool)

(declare-fun b_next!7179 () Bool)

(assert (=> start!34136 (= b_free!7179 (not b_next!7179))))

(declare-fun tp!25067 () Bool)

(declare-fun b_and!14377 () Bool)

(assert (=> start!34136 (= tp!25067 b_and!14377)))

(declare-fun mapNonEmpty!12120 () Bool)

(declare-fun mapRes!12120 () Bool)

(declare-fun tp!25068 () Bool)

(declare-fun e!208694 () Bool)

(assert (=> mapNonEmpty!12120 (= mapRes!12120 (and tp!25068 e!208694))))

(declare-fun mapKey!12120 () (_ BitVec 32))

(declare-datatypes ((V!10485 0))(
  ( (V!10486 (val!3610 Int)) )
))
(declare-datatypes ((ValueCell!3222 0))(
  ( (ValueCellFull!3222 (v!5781 V!10485)) (EmptyCell!3222) )
))
(declare-fun mapValue!12120 () ValueCell!3222)

(declare-datatypes ((array!17865 0))(
  ( (array!17866 (arr!8454 (Array (_ BitVec 32) ValueCell!3222)) (size!8806 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17865)

(declare-fun mapRest!12120 () (Array (_ BitVec 32) ValueCell!3222))

(assert (=> mapNonEmpty!12120 (= (arr!8454 _values!1525) (store mapRest!12120 mapKey!12120 mapValue!12120))))

(declare-fun b!340182 () Bool)

(declare-fun tp_is_empty!7131 () Bool)

(assert (=> b!340182 (= e!208694 tp_is_empty!7131)))

(declare-fun mapIsEmpty!12120 () Bool)

(assert (=> mapIsEmpty!12120 mapRes!12120))

(declare-fun b!340183 () Bool)

(declare-fun res!187891 () Bool)

(declare-fun e!208693 () Bool)

(assert (=> b!340183 (=> (not res!187891) (not e!208693))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!17867 0))(
  ( (array!17868 (arr!8455 (Array (_ BitVec 32) (_ BitVec 64))) (size!8807 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17867)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340183 (= res!187891 (and (= (size!8806 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8807 _keys!1895) (size!8806 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340184 () Bool)

(declare-fun e!208696 () Bool)

(assert (=> b!340184 (= e!208696 (or (bvsge #b00000000000000000000000000000000 (size!8807 _keys!1895)) (bvsge (size!8807 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!340185 () Bool)

(declare-fun res!187894 () Bool)

(assert (=> b!340185 (=> (not res!187894) (not e!208693))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10485)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10485)

(declare-datatypes ((tuple2!5242 0))(
  ( (tuple2!5243 (_1!2632 (_ BitVec 64)) (_2!2632 V!10485)) )
))
(declare-datatypes ((List!4860 0))(
  ( (Nil!4857) (Cons!4856 (h!5712 tuple2!5242) (t!9966 List!4860)) )
))
(declare-datatypes ((ListLongMap!4155 0))(
  ( (ListLongMap!4156 (toList!2093 List!4860)) )
))
(declare-fun contains!2146 (ListLongMap!4155 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1614 (array!17867 array!17865 (_ BitVec 32) (_ BitVec 32) V!10485 V!10485 (_ BitVec 32) Int) ListLongMap!4155)

(assert (=> b!340185 (= res!187894 (not (contains!2146 (getCurrentListMap!1614 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340186 () Bool)

(declare-fun e!208697 () Bool)

(declare-fun e!208698 () Bool)

(assert (=> b!340186 (= e!208697 (and e!208698 mapRes!12120))))

(declare-fun condMapEmpty!12120 () Bool)

(declare-fun mapDefault!12120 () ValueCell!3222)

(assert (=> b!340186 (= condMapEmpty!12120 (= (arr!8454 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3222)) mapDefault!12120)))))

(declare-fun b!340187 () Bool)

(declare-fun res!187889 () Bool)

(assert (=> b!340187 (=> (not res!187889) (not e!208696))))

(declare-fun arrayContainsKey!0 (array!17867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340187 (= res!187889 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340189 () Bool)

(declare-fun res!187892 () Bool)

(assert (=> b!340189 (=> (not res!187892) (not e!208693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340189 (= res!187892 (validKeyInArray!0 k0!1348))))

(declare-fun b!340190 () Bool)

(assert (=> b!340190 (= e!208698 tp_is_empty!7131)))

(declare-fun b!340191 () Bool)

(assert (=> b!340191 (= e!208693 e!208696)))

(declare-fun res!187888 () Bool)

(assert (=> b!340191 (=> (not res!187888) (not e!208696))))

(declare-datatypes ((SeekEntryResult!3266 0))(
  ( (MissingZero!3266 (index!15243 (_ BitVec 32))) (Found!3266 (index!15244 (_ BitVec 32))) (Intermediate!3266 (undefined!4078 Bool) (index!15245 (_ BitVec 32)) (x!33882 (_ BitVec 32))) (Undefined!3266) (MissingVacant!3266 (index!15246 (_ BitVec 32))) )
))
(declare-fun lt!161479 () SeekEntryResult!3266)

(get-info :version)

(assert (=> b!340191 (= res!187888 (and (not ((_ is Found!3266) lt!161479)) (not ((_ is MissingZero!3266) lt!161479)) ((_ is MissingVacant!3266) lt!161479)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17867 (_ BitVec 32)) SeekEntryResult!3266)

(assert (=> b!340191 (= lt!161479 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340192 () Bool)

(declare-fun res!187890 () Bool)

(assert (=> b!340192 (=> (not res!187890) (not e!208693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17867 (_ BitVec 32)) Bool)

(assert (=> b!340192 (= res!187890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340188 () Bool)

(declare-fun res!187893 () Bool)

(assert (=> b!340188 (=> (not res!187893) (not e!208693))))

(declare-datatypes ((List!4861 0))(
  ( (Nil!4858) (Cons!4857 (h!5713 (_ BitVec 64)) (t!9967 List!4861)) )
))
(declare-fun arrayNoDuplicates!0 (array!17867 (_ BitVec 32) List!4861) Bool)

(assert (=> b!340188 (= res!187893 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4858))))

(declare-fun res!187895 () Bool)

(assert (=> start!34136 (=> (not res!187895) (not e!208693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34136 (= res!187895 (validMask!0 mask!2385))))

(assert (=> start!34136 e!208693))

(assert (=> start!34136 true))

(assert (=> start!34136 tp_is_empty!7131))

(assert (=> start!34136 tp!25067))

(declare-fun array_inv!6264 (array!17865) Bool)

(assert (=> start!34136 (and (array_inv!6264 _values!1525) e!208697)))

(declare-fun array_inv!6265 (array!17867) Bool)

(assert (=> start!34136 (array_inv!6265 _keys!1895)))

(assert (= (and start!34136 res!187895) b!340183))

(assert (= (and b!340183 res!187891) b!340192))

(assert (= (and b!340192 res!187890) b!340188))

(assert (= (and b!340188 res!187893) b!340189))

(assert (= (and b!340189 res!187892) b!340185))

(assert (= (and b!340185 res!187894) b!340191))

(assert (= (and b!340191 res!187888) b!340187))

(assert (= (and b!340187 res!187889) b!340184))

(assert (= (and b!340186 condMapEmpty!12120) mapIsEmpty!12120))

(assert (= (and b!340186 (not condMapEmpty!12120)) mapNonEmpty!12120))

(assert (= (and mapNonEmpty!12120 ((_ is ValueCellFull!3222) mapValue!12120)) b!340182))

(assert (= (and b!340186 ((_ is ValueCellFull!3222) mapDefault!12120)) b!340190))

(assert (= start!34136 b!340186))

(declare-fun m!342959 () Bool)

(assert (=> b!340185 m!342959))

(assert (=> b!340185 m!342959))

(declare-fun m!342961 () Bool)

(assert (=> b!340185 m!342961))

(declare-fun m!342963 () Bool)

(assert (=> b!340191 m!342963))

(declare-fun m!342965 () Bool)

(assert (=> b!340192 m!342965))

(declare-fun m!342967 () Bool)

(assert (=> b!340188 m!342967))

(declare-fun m!342969 () Bool)

(assert (=> b!340187 m!342969))

(declare-fun m!342971 () Bool)

(assert (=> b!340189 m!342971))

(declare-fun m!342973 () Bool)

(assert (=> mapNonEmpty!12120 m!342973))

(declare-fun m!342975 () Bool)

(assert (=> start!34136 m!342975))

(declare-fun m!342977 () Bool)

(assert (=> start!34136 m!342977))

(declare-fun m!342979 () Bool)

(assert (=> start!34136 m!342979))

(check-sat (not b!340188) (not start!34136) (not b_next!7179) (not b!340189) (not b!340187) (not b!340192) (not b!340191) (not b!340185) (not mapNonEmpty!12120) b_and!14377 tp_is_empty!7131)
(check-sat b_and!14377 (not b_next!7179))
(get-model)

(declare-fun d!70907 () Bool)

(assert (=> d!70907 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!340189 d!70907))

(declare-fun d!70909 () Bool)

(assert (=> d!70909 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34136 d!70909))

(declare-fun d!70911 () Bool)

(assert (=> d!70911 (= (array_inv!6264 _values!1525) (bvsge (size!8806 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34136 d!70911))

(declare-fun d!70913 () Bool)

(assert (=> d!70913 (= (array_inv!6265 _keys!1895) (bvsge (size!8807 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34136 d!70913))

(declare-fun d!70915 () Bool)

(declare-fun e!208722 () Bool)

(assert (=> d!70915 e!208722))

(declare-fun res!187922 () Bool)

(assert (=> d!70915 (=> res!187922 e!208722)))

(declare-fun lt!161491 () Bool)

(assert (=> d!70915 (= res!187922 (not lt!161491))))

(declare-fun lt!161493 () Bool)

(assert (=> d!70915 (= lt!161491 lt!161493)))

(declare-datatypes ((Unit!10601 0))(
  ( (Unit!10602) )
))
(declare-fun lt!161492 () Unit!10601)

(declare-fun e!208721 () Unit!10601)

(assert (=> d!70915 (= lt!161492 e!208721)))

(declare-fun c!52650 () Bool)

(assert (=> d!70915 (= c!52650 lt!161493)))

(declare-fun containsKey!325 (List!4860 (_ BitVec 64)) Bool)

(assert (=> d!70915 (= lt!161493 (containsKey!325 (toList!2093 (getCurrentListMap!1614 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70915 (= (contains!2146 (getCurrentListMap!1614 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!161491)))

(declare-fun b!340232 () Bool)

(declare-fun lt!161494 () Unit!10601)

(assert (=> b!340232 (= e!208721 lt!161494)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!273 (List!4860 (_ BitVec 64)) Unit!10601)

(assert (=> b!340232 (= lt!161494 (lemmaContainsKeyImpliesGetValueByKeyDefined!273 (toList!2093 (getCurrentListMap!1614 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!339 0))(
  ( (Some!338 (v!5783 V!10485)) (None!337) )
))
(declare-fun isDefined!274 (Option!339) Bool)

(declare-fun getValueByKey!333 (List!4860 (_ BitVec 64)) Option!339)

(assert (=> b!340232 (isDefined!274 (getValueByKey!333 (toList!2093 (getCurrentListMap!1614 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!340233 () Bool)

(declare-fun Unit!10603 () Unit!10601)

(assert (=> b!340233 (= e!208721 Unit!10603)))

(declare-fun b!340234 () Bool)

(assert (=> b!340234 (= e!208722 (isDefined!274 (getValueByKey!333 (toList!2093 (getCurrentListMap!1614 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70915 c!52650) b!340232))

(assert (= (and d!70915 (not c!52650)) b!340233))

(assert (= (and d!70915 (not res!187922)) b!340234))

(declare-fun m!343003 () Bool)

(assert (=> d!70915 m!343003))

(declare-fun m!343005 () Bool)

(assert (=> b!340232 m!343005))

(declare-fun m!343007 () Bool)

(assert (=> b!340232 m!343007))

(assert (=> b!340232 m!343007))

(declare-fun m!343009 () Bool)

(assert (=> b!340232 m!343009))

(assert (=> b!340234 m!343007))

(assert (=> b!340234 m!343007))

(assert (=> b!340234 m!343009))

(assert (=> b!340185 d!70915))

(declare-fun b!340277 () Bool)

(declare-fun e!208754 () Bool)

(declare-fun e!208757 () Bool)

(assert (=> b!340277 (= e!208754 e!208757)))

(declare-fun res!187945 () Bool)

(declare-fun call!26557 () Bool)

(assert (=> b!340277 (= res!187945 call!26557)))

(assert (=> b!340277 (=> (not res!187945) (not e!208757))))

(declare-fun b!340278 () Bool)

(declare-fun lt!161542 () ListLongMap!4155)

(declare-fun e!208755 () Bool)

(declare-fun apply!275 (ListLongMap!4155 (_ BitVec 64)) V!10485)

(declare-fun get!4597 (ValueCell!3222 V!10485) V!10485)

(declare-fun dynLambda!618 (Int (_ BitVec 64)) V!10485)

(assert (=> b!340278 (= e!208755 (= (apply!275 lt!161542 (select (arr!8455 _keys!1895) #b00000000000000000000000000000000)) (get!4597 (select (arr!8454 _values!1525) #b00000000000000000000000000000000) (dynLambda!618 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!340278 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8806 _values!1525)))))

(assert (=> b!340278 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8807 _keys!1895)))))

(declare-fun b!340279 () Bool)

(assert (=> b!340279 (= e!208754 (not call!26557))))

(declare-fun d!70917 () Bool)

(declare-fun e!208751 () Bool)

(assert (=> d!70917 e!208751))

(declare-fun res!187946 () Bool)

(assert (=> d!70917 (=> (not res!187946) (not e!208751))))

(assert (=> d!70917 (= res!187946 (or (bvsge #b00000000000000000000000000000000 (size!8807 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8807 _keys!1895)))))))

(declare-fun lt!161547 () ListLongMap!4155)

(assert (=> d!70917 (= lt!161542 lt!161547)))

(declare-fun lt!161554 () Unit!10601)

(declare-fun e!208752 () Unit!10601)

(assert (=> d!70917 (= lt!161554 e!208752)))

(declare-fun c!52664 () Bool)

(declare-fun e!208758 () Bool)

(assert (=> d!70917 (= c!52664 e!208758)))

(declare-fun res!187948 () Bool)

(assert (=> d!70917 (=> (not res!187948) (not e!208758))))

(assert (=> d!70917 (= res!187948 (bvslt #b00000000000000000000000000000000 (size!8807 _keys!1895)))))

(declare-fun e!208760 () ListLongMap!4155)

(assert (=> d!70917 (= lt!161547 e!208760)))

(declare-fun c!52663 () Bool)

(assert (=> d!70917 (= c!52663 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70917 (validMask!0 mask!2385)))

(assert (=> d!70917 (= (getCurrentListMap!1614 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161542)))

(declare-fun b!340280 () Bool)

(declare-fun e!208749 () ListLongMap!4155)

(declare-fun call!26559 () ListLongMap!4155)

(assert (=> b!340280 (= e!208749 call!26559)))

(declare-fun bm!26551 () Bool)

(declare-fun call!26560 () ListLongMap!4155)

(assert (=> bm!26551 (= call!26559 call!26560)))

(declare-fun bm!26552 () Bool)

(declare-fun call!26555 () Bool)

(assert (=> bm!26552 (= call!26555 (contains!2146 lt!161542 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!340281 () Bool)

(declare-fun e!208759 () ListLongMap!4155)

(assert (=> b!340281 (= e!208759 call!26559)))

(declare-fun b!340282 () Bool)

(declare-fun lt!161551 () Unit!10601)

(assert (=> b!340282 (= e!208752 lt!161551)))

(declare-fun lt!161558 () ListLongMap!4155)

(declare-fun getCurrentListMapNoExtraKeys!597 (array!17867 array!17865 (_ BitVec 32) (_ BitVec 32) V!10485 V!10485 (_ BitVec 32) Int) ListLongMap!4155)

(assert (=> b!340282 (= lt!161558 (getCurrentListMapNoExtraKeys!597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161552 () (_ BitVec 64))

(assert (=> b!340282 (= lt!161552 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161559 () (_ BitVec 64))

(assert (=> b!340282 (= lt!161559 (select (arr!8455 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161553 () Unit!10601)

(declare-fun addStillContains!251 (ListLongMap!4155 (_ BitVec 64) V!10485 (_ BitVec 64)) Unit!10601)

(assert (=> b!340282 (= lt!161553 (addStillContains!251 lt!161558 lt!161552 zeroValue!1467 lt!161559))))

(declare-fun +!724 (ListLongMap!4155 tuple2!5242) ListLongMap!4155)

(assert (=> b!340282 (contains!2146 (+!724 lt!161558 (tuple2!5243 lt!161552 zeroValue!1467)) lt!161559)))

(declare-fun lt!161548 () Unit!10601)

(assert (=> b!340282 (= lt!161548 lt!161553)))

(declare-fun lt!161545 () ListLongMap!4155)

(assert (=> b!340282 (= lt!161545 (getCurrentListMapNoExtraKeys!597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161544 () (_ BitVec 64))

(assert (=> b!340282 (= lt!161544 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161560 () (_ BitVec 64))

(assert (=> b!340282 (= lt!161560 (select (arr!8455 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161555 () Unit!10601)

(declare-fun addApplyDifferent!251 (ListLongMap!4155 (_ BitVec 64) V!10485 (_ BitVec 64)) Unit!10601)

(assert (=> b!340282 (= lt!161555 (addApplyDifferent!251 lt!161545 lt!161544 minValue!1467 lt!161560))))

(assert (=> b!340282 (= (apply!275 (+!724 lt!161545 (tuple2!5243 lt!161544 minValue!1467)) lt!161560) (apply!275 lt!161545 lt!161560))))

(declare-fun lt!161540 () Unit!10601)

(assert (=> b!340282 (= lt!161540 lt!161555)))

(declare-fun lt!161543 () ListLongMap!4155)

(assert (=> b!340282 (= lt!161543 (getCurrentListMapNoExtraKeys!597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161550 () (_ BitVec 64))

(assert (=> b!340282 (= lt!161550 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161541 () (_ BitVec 64))

(assert (=> b!340282 (= lt!161541 (select (arr!8455 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161539 () Unit!10601)

(assert (=> b!340282 (= lt!161539 (addApplyDifferent!251 lt!161543 lt!161550 zeroValue!1467 lt!161541))))

(assert (=> b!340282 (= (apply!275 (+!724 lt!161543 (tuple2!5243 lt!161550 zeroValue!1467)) lt!161541) (apply!275 lt!161543 lt!161541))))

(declare-fun lt!161557 () Unit!10601)

(assert (=> b!340282 (= lt!161557 lt!161539)))

(declare-fun lt!161556 () ListLongMap!4155)

(assert (=> b!340282 (= lt!161556 (getCurrentListMapNoExtraKeys!597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161546 () (_ BitVec 64))

(assert (=> b!340282 (= lt!161546 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161549 () (_ BitVec 64))

(assert (=> b!340282 (= lt!161549 (select (arr!8455 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!340282 (= lt!161551 (addApplyDifferent!251 lt!161556 lt!161546 minValue!1467 lt!161549))))

(assert (=> b!340282 (= (apply!275 (+!724 lt!161556 (tuple2!5243 lt!161546 minValue!1467)) lt!161549) (apply!275 lt!161556 lt!161549))))

(declare-fun b!340283 () Bool)

(declare-fun e!208750 () Bool)

(declare-fun e!208761 () Bool)

(assert (=> b!340283 (= e!208750 e!208761)))

(declare-fun res!187943 () Bool)

(assert (=> b!340283 (= res!187943 call!26555)))

(assert (=> b!340283 (=> (not res!187943) (not e!208761))))

(declare-fun b!340284 () Bool)

(declare-fun e!208753 () Bool)

(assert (=> b!340284 (= e!208753 (validKeyInArray!0 (select (arr!8455 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340285 () Bool)

(declare-fun c!52666 () Bool)

(assert (=> b!340285 (= c!52666 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!340285 (= e!208749 e!208759)))

(declare-fun b!340286 () Bool)

(assert (=> b!340286 (= e!208758 (validKeyInArray!0 (select (arr!8455 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26553 () Bool)

(declare-fun call!26554 () ListLongMap!4155)

(declare-fun call!26556 () ListLongMap!4155)

(assert (=> bm!26553 (= call!26554 call!26556)))

(declare-fun b!340287 () Bool)

(assert (=> b!340287 (= e!208751 e!208750)))

(declare-fun c!52667 () Bool)

(assert (=> b!340287 (= c!52667 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!340288 () Bool)

(declare-fun res!187944 () Bool)

(assert (=> b!340288 (=> (not res!187944) (not e!208751))))

(assert (=> b!340288 (= res!187944 e!208754)))

(declare-fun c!52668 () Bool)

(assert (=> b!340288 (= c!52668 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!340289 () Bool)

(declare-fun call!26558 () ListLongMap!4155)

(assert (=> b!340289 (= e!208759 call!26558)))

(declare-fun b!340290 () Bool)

(declare-fun Unit!10604 () Unit!10601)

(assert (=> b!340290 (= e!208752 Unit!10604)))

(declare-fun b!340291 () Bool)

(declare-fun res!187947 () Bool)

(assert (=> b!340291 (=> (not res!187947) (not e!208751))))

(declare-fun e!208756 () Bool)

(assert (=> b!340291 (= res!187947 e!208756)))

(declare-fun res!187949 () Bool)

(assert (=> b!340291 (=> res!187949 e!208756)))

(assert (=> b!340291 (= res!187949 (not e!208753))))

(declare-fun res!187942 () Bool)

(assert (=> b!340291 (=> (not res!187942) (not e!208753))))

(assert (=> b!340291 (= res!187942 (bvslt #b00000000000000000000000000000000 (size!8807 _keys!1895)))))

(declare-fun b!340292 () Bool)

(assert (=> b!340292 (= e!208760 e!208749)))

(declare-fun c!52665 () Bool)

(assert (=> b!340292 (= c!52665 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26554 () Bool)

(assert (=> bm!26554 (= call!26560 (+!724 (ite c!52663 call!26556 (ite c!52665 call!26554 call!26558)) (ite (or c!52663 c!52665) (tuple2!5243 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5243 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!340293 () Bool)

(assert (=> b!340293 (= e!208757 (= (apply!275 lt!161542 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!340294 () Bool)

(assert (=> b!340294 (= e!208756 e!208755)))

(declare-fun res!187941 () Bool)

(assert (=> b!340294 (=> (not res!187941) (not e!208755))))

(assert (=> b!340294 (= res!187941 (contains!2146 lt!161542 (select (arr!8455 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!340294 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8807 _keys!1895)))))

(declare-fun b!340295 () Bool)

(assert (=> b!340295 (= e!208750 (not call!26555))))

(declare-fun bm!26555 () Bool)

(assert (=> bm!26555 (= call!26558 call!26554)))

(declare-fun b!340296 () Bool)

(assert (=> b!340296 (= e!208761 (= (apply!275 lt!161542 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!26556 () Bool)

(assert (=> bm!26556 (= call!26556 (getCurrentListMapNoExtraKeys!597 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26557 () Bool)

(assert (=> bm!26557 (= call!26557 (contains!2146 lt!161542 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!340297 () Bool)

(assert (=> b!340297 (= e!208760 (+!724 call!26560 (tuple2!5243 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(assert (= (and d!70917 c!52663) b!340297))

(assert (= (and d!70917 (not c!52663)) b!340292))

(assert (= (and b!340292 c!52665) b!340280))

(assert (= (and b!340292 (not c!52665)) b!340285))

(assert (= (and b!340285 c!52666) b!340281))

(assert (= (and b!340285 (not c!52666)) b!340289))

(assert (= (or b!340281 b!340289) bm!26555))

(assert (= (or b!340280 bm!26555) bm!26553))

(assert (= (or b!340280 b!340281) bm!26551))

(assert (= (or b!340297 bm!26553) bm!26556))

(assert (= (or b!340297 bm!26551) bm!26554))

(assert (= (and d!70917 res!187948) b!340286))

(assert (= (and d!70917 c!52664) b!340282))

(assert (= (and d!70917 (not c!52664)) b!340290))

(assert (= (and d!70917 res!187946) b!340291))

(assert (= (and b!340291 res!187942) b!340284))

(assert (= (and b!340291 (not res!187949)) b!340294))

(assert (= (and b!340294 res!187941) b!340278))

(assert (= (and b!340291 res!187947) b!340288))

(assert (= (and b!340288 c!52668) b!340277))

(assert (= (and b!340288 (not c!52668)) b!340279))

(assert (= (and b!340277 res!187945) b!340293))

(assert (= (or b!340277 b!340279) bm!26557))

(assert (= (and b!340288 res!187944) b!340287))

(assert (= (and b!340287 c!52667) b!340283))

(assert (= (and b!340287 (not c!52667)) b!340295))

(assert (= (and b!340283 res!187943) b!340296))

(assert (= (or b!340283 b!340295) bm!26552))

(declare-fun b_lambda!8439 () Bool)

(assert (=> (not b_lambda!8439) (not b!340278)))

(declare-fun t!9970 () Bool)

(declare-fun tb!3065 () Bool)

(assert (=> (and start!34136 (= defaultEntry!1528 defaultEntry!1528) t!9970) tb!3065))

(declare-fun result!5525 () Bool)

(assert (=> tb!3065 (= result!5525 tp_is_empty!7131)))

(assert (=> b!340278 t!9970))

(declare-fun b_and!14381 () Bool)

(assert (= b_and!14377 (and (=> t!9970 result!5525) b_and!14381)))

(declare-fun m!343011 () Bool)

(assert (=> b!340286 m!343011))

(assert (=> b!340286 m!343011))

(declare-fun m!343013 () Bool)

(assert (=> b!340286 m!343013))

(declare-fun m!343015 () Bool)

(assert (=> bm!26556 m!343015))

(declare-fun m!343017 () Bool)

(assert (=> bm!26557 m!343017))

(assert (=> b!340284 m!343011))

(assert (=> b!340284 m!343011))

(assert (=> b!340284 m!343013))

(declare-fun m!343019 () Bool)

(assert (=> b!340293 m!343019))

(assert (=> b!340294 m!343011))

(assert (=> b!340294 m!343011))

(declare-fun m!343021 () Bool)

(assert (=> b!340294 m!343021))

(declare-fun m!343023 () Bool)

(assert (=> bm!26554 m!343023))

(declare-fun m!343025 () Bool)

(assert (=> b!340278 m!343025))

(declare-fun m!343027 () Bool)

(assert (=> b!340278 m!343027))

(assert (=> b!340278 m!343025))

(declare-fun m!343029 () Bool)

(assert (=> b!340278 m!343029))

(assert (=> b!340278 m!343027))

(assert (=> b!340278 m!343011))

(assert (=> b!340278 m!343011))

(declare-fun m!343031 () Bool)

(assert (=> b!340278 m!343031))

(declare-fun m!343033 () Bool)

(assert (=> b!340296 m!343033))

(assert (=> d!70917 m!342975))

(declare-fun m!343035 () Bool)

(assert (=> bm!26552 m!343035))

(declare-fun m!343037 () Bool)

(assert (=> b!340282 m!343037))

(declare-fun m!343039 () Bool)

(assert (=> b!340282 m!343039))

(declare-fun m!343041 () Bool)

(assert (=> b!340282 m!343041))

(declare-fun m!343043 () Bool)

(assert (=> b!340282 m!343043))

(declare-fun m!343045 () Bool)

(assert (=> b!340282 m!343045))

(declare-fun m!343047 () Bool)

(assert (=> b!340282 m!343047))

(declare-fun m!343049 () Bool)

(assert (=> b!340282 m!343049))

(declare-fun m!343051 () Bool)

(assert (=> b!340282 m!343051))

(assert (=> b!340282 m!343041))

(declare-fun m!343053 () Bool)

(assert (=> b!340282 m!343053))

(declare-fun m!343055 () Bool)

(assert (=> b!340282 m!343055))

(assert (=> b!340282 m!343045))

(assert (=> b!340282 m!343015))

(assert (=> b!340282 m!343049))

(declare-fun m!343057 () Bool)

(assert (=> b!340282 m!343057))

(assert (=> b!340282 m!343011))

(declare-fun m!343059 () Bool)

(assert (=> b!340282 m!343059))

(declare-fun m!343061 () Bool)

(assert (=> b!340282 m!343061))

(declare-fun m!343063 () Bool)

(assert (=> b!340282 m!343063))

(assert (=> b!340282 m!343059))

(declare-fun m!343065 () Bool)

(assert (=> b!340282 m!343065))

(declare-fun m!343067 () Bool)

(assert (=> b!340297 m!343067))

(assert (=> b!340185 d!70917))

(declare-fun b!340308 () Bool)

(declare-fun e!208770 () Bool)

(declare-fun call!26563 () Bool)

(assert (=> b!340308 (= e!208770 call!26563)))

(declare-fun b!340309 () Bool)

(declare-fun e!208769 () Bool)

(assert (=> b!340309 (= e!208769 e!208770)))

(declare-fun lt!161567 () (_ BitVec 64))

(assert (=> b!340309 (= lt!161567 (select (arr!8455 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161568 () Unit!10601)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17867 (_ BitVec 64) (_ BitVec 32)) Unit!10601)

(assert (=> b!340309 (= lt!161568 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!161567 #b00000000000000000000000000000000))))

(assert (=> b!340309 (arrayContainsKey!0 _keys!1895 lt!161567 #b00000000000000000000000000000000)))

(declare-fun lt!161569 () Unit!10601)

(assert (=> b!340309 (= lt!161569 lt!161568)))

(declare-fun res!187955 () Bool)

(assert (=> b!340309 (= res!187955 (= (seekEntryOrOpen!0 (select (arr!8455 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3266 #b00000000000000000000000000000000)))))

(assert (=> b!340309 (=> (not res!187955) (not e!208770))))

(declare-fun b!340310 () Bool)

(assert (=> b!340310 (= e!208769 call!26563)))

(declare-fun bm!26560 () Bool)

(assert (=> bm!26560 (= call!26563 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!340311 () Bool)

(declare-fun e!208768 () Bool)

(assert (=> b!340311 (= e!208768 e!208769)))

(declare-fun c!52671 () Bool)

(assert (=> b!340311 (= c!52671 (validKeyInArray!0 (select (arr!8455 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70919 () Bool)

(declare-fun res!187954 () Bool)

(assert (=> d!70919 (=> res!187954 e!208768)))

(assert (=> d!70919 (= res!187954 (bvsge #b00000000000000000000000000000000 (size!8807 _keys!1895)))))

(assert (=> d!70919 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!208768)))

(assert (= (and d!70919 (not res!187954)) b!340311))

(assert (= (and b!340311 c!52671) b!340309))

(assert (= (and b!340311 (not c!52671)) b!340310))

(assert (= (and b!340309 res!187955) b!340308))

(assert (= (or b!340308 b!340310) bm!26560))

(assert (=> b!340309 m!343011))

(declare-fun m!343069 () Bool)

(assert (=> b!340309 m!343069))

(declare-fun m!343071 () Bool)

(assert (=> b!340309 m!343071))

(assert (=> b!340309 m!343011))

(declare-fun m!343073 () Bool)

(assert (=> b!340309 m!343073))

(declare-fun m!343075 () Bool)

(assert (=> bm!26560 m!343075))

(assert (=> b!340311 m!343011))

(assert (=> b!340311 m!343011))

(assert (=> b!340311 m!343013))

(assert (=> b!340192 d!70919))

(declare-fun b!340324 () Bool)

(declare-fun e!208777 () SeekEntryResult!3266)

(declare-fun e!208778 () SeekEntryResult!3266)

(assert (=> b!340324 (= e!208777 e!208778)))

(declare-fun lt!161577 () (_ BitVec 64))

(declare-fun lt!161578 () SeekEntryResult!3266)

(assert (=> b!340324 (= lt!161577 (select (arr!8455 _keys!1895) (index!15245 lt!161578)))))

(declare-fun c!52678 () Bool)

(assert (=> b!340324 (= c!52678 (= lt!161577 k0!1348))))

(declare-fun b!340325 () Bool)

(assert (=> b!340325 (= e!208778 (Found!3266 (index!15245 lt!161578)))))

(declare-fun b!340326 () Bool)

(declare-fun e!208779 () SeekEntryResult!3266)

(assert (=> b!340326 (= e!208779 (MissingZero!3266 (index!15245 lt!161578)))))

(declare-fun d!70921 () Bool)

(declare-fun lt!161576 () SeekEntryResult!3266)

(assert (=> d!70921 (and (or ((_ is Undefined!3266) lt!161576) (not ((_ is Found!3266) lt!161576)) (and (bvsge (index!15244 lt!161576) #b00000000000000000000000000000000) (bvslt (index!15244 lt!161576) (size!8807 _keys!1895)))) (or ((_ is Undefined!3266) lt!161576) ((_ is Found!3266) lt!161576) (not ((_ is MissingZero!3266) lt!161576)) (and (bvsge (index!15243 lt!161576) #b00000000000000000000000000000000) (bvslt (index!15243 lt!161576) (size!8807 _keys!1895)))) (or ((_ is Undefined!3266) lt!161576) ((_ is Found!3266) lt!161576) ((_ is MissingZero!3266) lt!161576) (not ((_ is MissingVacant!3266) lt!161576)) (and (bvsge (index!15246 lt!161576) #b00000000000000000000000000000000) (bvslt (index!15246 lt!161576) (size!8807 _keys!1895)))) (or ((_ is Undefined!3266) lt!161576) (ite ((_ is Found!3266) lt!161576) (= (select (arr!8455 _keys!1895) (index!15244 lt!161576)) k0!1348) (ite ((_ is MissingZero!3266) lt!161576) (= (select (arr!8455 _keys!1895) (index!15243 lt!161576)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3266) lt!161576) (= (select (arr!8455 _keys!1895) (index!15246 lt!161576)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70921 (= lt!161576 e!208777)))

(declare-fun c!52679 () Bool)

(assert (=> d!70921 (= c!52679 (and ((_ is Intermediate!3266) lt!161578) (undefined!4078 lt!161578)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17867 (_ BitVec 32)) SeekEntryResult!3266)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70921 (= lt!161578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70921 (validMask!0 mask!2385)))

(assert (=> d!70921 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161576)))

(declare-fun b!340327 () Bool)

(declare-fun c!52680 () Bool)

(assert (=> b!340327 (= c!52680 (= lt!161577 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!340327 (= e!208778 e!208779)))

(declare-fun b!340328 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17867 (_ BitVec 32)) SeekEntryResult!3266)

(assert (=> b!340328 (= e!208779 (seekKeyOrZeroReturnVacant!0 (x!33882 lt!161578) (index!15245 lt!161578) (index!15245 lt!161578) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340329 () Bool)

(assert (=> b!340329 (= e!208777 Undefined!3266)))

(assert (= (and d!70921 c!52679) b!340329))

(assert (= (and d!70921 (not c!52679)) b!340324))

(assert (= (and b!340324 c!52678) b!340325))

(assert (= (and b!340324 (not c!52678)) b!340327))

(assert (= (and b!340327 c!52680) b!340326))

(assert (= (and b!340327 (not c!52680)) b!340328))

(declare-fun m!343077 () Bool)

(assert (=> b!340324 m!343077))

(declare-fun m!343079 () Bool)

(assert (=> d!70921 m!343079))

(declare-fun m!343081 () Bool)

(assert (=> d!70921 m!343081))

(assert (=> d!70921 m!342975))

(declare-fun m!343083 () Bool)

(assert (=> d!70921 m!343083))

(assert (=> d!70921 m!343081))

(declare-fun m!343085 () Bool)

(assert (=> d!70921 m!343085))

(declare-fun m!343087 () Bool)

(assert (=> d!70921 m!343087))

(declare-fun m!343089 () Bool)

(assert (=> b!340328 m!343089))

(assert (=> b!340191 d!70921))

(declare-fun b!340340 () Bool)

(declare-fun e!208790 () Bool)

(declare-fun contains!2148 (List!4861 (_ BitVec 64)) Bool)

(assert (=> b!340340 (= e!208790 (contains!2148 Nil!4858 (select (arr!8455 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!340341 () Bool)

(declare-fun e!208789 () Bool)

(declare-fun call!26566 () Bool)

(assert (=> b!340341 (= e!208789 call!26566)))

(declare-fun b!340343 () Bool)

(assert (=> b!340343 (= e!208789 call!26566)))

(declare-fun b!340344 () Bool)

(declare-fun e!208788 () Bool)

(assert (=> b!340344 (= e!208788 e!208789)))

(declare-fun c!52683 () Bool)

(assert (=> b!340344 (= c!52683 (validKeyInArray!0 (select (arr!8455 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26563 () Bool)

(assert (=> bm!26563 (= call!26566 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52683 (Cons!4857 (select (arr!8455 _keys!1895) #b00000000000000000000000000000000) Nil!4858) Nil!4858)))))

(declare-fun b!340342 () Bool)

(declare-fun e!208791 () Bool)

(assert (=> b!340342 (= e!208791 e!208788)))

(declare-fun res!187963 () Bool)

(assert (=> b!340342 (=> (not res!187963) (not e!208788))))

(assert (=> b!340342 (= res!187963 (not e!208790))))

(declare-fun res!187964 () Bool)

(assert (=> b!340342 (=> (not res!187964) (not e!208790))))

(assert (=> b!340342 (= res!187964 (validKeyInArray!0 (select (arr!8455 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70923 () Bool)

(declare-fun res!187962 () Bool)

(assert (=> d!70923 (=> res!187962 e!208791)))

(assert (=> d!70923 (= res!187962 (bvsge #b00000000000000000000000000000000 (size!8807 _keys!1895)))))

(assert (=> d!70923 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4858) e!208791)))

(assert (= (and d!70923 (not res!187962)) b!340342))

(assert (= (and b!340342 res!187964) b!340340))

(assert (= (and b!340342 res!187963) b!340344))

(assert (= (and b!340344 c!52683) b!340343))

(assert (= (and b!340344 (not c!52683)) b!340341))

(assert (= (or b!340343 b!340341) bm!26563))

(assert (=> b!340340 m!343011))

(assert (=> b!340340 m!343011))

(declare-fun m!343091 () Bool)

(assert (=> b!340340 m!343091))

(assert (=> b!340344 m!343011))

(assert (=> b!340344 m!343011))

(assert (=> b!340344 m!343013))

(assert (=> bm!26563 m!343011))

(declare-fun m!343093 () Bool)

(assert (=> bm!26563 m!343093))

(assert (=> b!340342 m!343011))

(assert (=> b!340342 m!343011))

(assert (=> b!340342 m!343013))

(assert (=> b!340188 d!70923))

(declare-fun d!70925 () Bool)

(declare-fun res!187969 () Bool)

(declare-fun e!208796 () Bool)

(assert (=> d!70925 (=> res!187969 e!208796)))

(assert (=> d!70925 (= res!187969 (= (select (arr!8455 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70925 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!208796)))

(declare-fun b!340349 () Bool)

(declare-fun e!208797 () Bool)

(assert (=> b!340349 (= e!208796 e!208797)))

(declare-fun res!187970 () Bool)

(assert (=> b!340349 (=> (not res!187970) (not e!208797))))

(assert (=> b!340349 (= res!187970 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8807 _keys!1895)))))

(declare-fun b!340350 () Bool)

(assert (=> b!340350 (= e!208797 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70925 (not res!187969)) b!340349))

(assert (= (and b!340349 res!187970) b!340350))

(assert (=> d!70925 m!343011))

(declare-fun m!343095 () Bool)

(assert (=> b!340350 m!343095))

(assert (=> b!340187 d!70925))

(declare-fun b!340358 () Bool)

(declare-fun e!208803 () Bool)

(assert (=> b!340358 (= e!208803 tp_is_empty!7131)))

(declare-fun mapNonEmpty!12126 () Bool)

(declare-fun mapRes!12126 () Bool)

(declare-fun tp!25077 () Bool)

(declare-fun e!208802 () Bool)

(assert (=> mapNonEmpty!12126 (= mapRes!12126 (and tp!25077 e!208802))))

(declare-fun mapKey!12126 () (_ BitVec 32))

(declare-fun mapValue!12126 () ValueCell!3222)

(declare-fun mapRest!12126 () (Array (_ BitVec 32) ValueCell!3222))

(assert (=> mapNonEmpty!12126 (= mapRest!12120 (store mapRest!12126 mapKey!12126 mapValue!12126))))

(declare-fun mapIsEmpty!12126 () Bool)

(assert (=> mapIsEmpty!12126 mapRes!12126))

(declare-fun b!340357 () Bool)

(assert (=> b!340357 (= e!208802 tp_is_empty!7131)))

(declare-fun condMapEmpty!12126 () Bool)

(declare-fun mapDefault!12126 () ValueCell!3222)

(assert (=> mapNonEmpty!12120 (= condMapEmpty!12126 (= mapRest!12120 ((as const (Array (_ BitVec 32) ValueCell!3222)) mapDefault!12126)))))

(assert (=> mapNonEmpty!12120 (= tp!25068 (and e!208803 mapRes!12126))))

(assert (= (and mapNonEmpty!12120 condMapEmpty!12126) mapIsEmpty!12126))

(assert (= (and mapNonEmpty!12120 (not condMapEmpty!12126)) mapNonEmpty!12126))

(assert (= (and mapNonEmpty!12126 ((_ is ValueCellFull!3222) mapValue!12126)) b!340357))

(assert (= (and mapNonEmpty!12120 ((_ is ValueCellFull!3222) mapDefault!12126)) b!340358))

(declare-fun m!343097 () Bool)

(assert (=> mapNonEmpty!12126 m!343097))

(declare-fun b_lambda!8441 () Bool)

(assert (= b_lambda!8439 (or (and start!34136 b_free!7179) b_lambda!8441)))

(check-sat (not bm!26557) (not b!340293) (not b!340340) (not b_next!7179) (not b!340342) (not b!340309) b_and!14381 (not d!70917) (not b!340282) (not bm!26554) tp_is_empty!7131 (not mapNonEmpty!12126) (not b!340294) (not b!340296) (not bm!26563) (not bm!26552) (not d!70921) (not bm!26560) (not b!340328) (not b_lambda!8441) (not b!340234) (not b!340284) (not b!340232) (not b!340350) (not bm!26556) (not b!340286) (not b!340344) (not d!70915) (not b!340278) (not b!340297) (not b!340311))
(check-sat b_and!14381 (not b_next!7179))
