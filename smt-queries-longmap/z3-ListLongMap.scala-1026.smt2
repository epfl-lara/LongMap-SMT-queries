; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21840 () Bool)

(assert start!21840)

(declare-fun b!219939 () Bool)

(declare-fun b_free!5907 () Bool)

(declare-fun b_next!5907 () Bool)

(assert (=> b!219939 (= b_free!5907 (not b_next!5907))))

(declare-fun tp!20863 () Bool)

(declare-fun b_and!12805 () Bool)

(assert (=> b!219939 (= tp!20863 b_and!12805)))

(declare-fun b!219928 () Bool)

(declare-fun res!107816 () Bool)

(declare-fun e!143036 () Bool)

(assert (=> b!219928 (=> (not res!107816) (not e!143036))))

(declare-datatypes ((V!7339 0))(
  ( (V!7340 (val!2929 Int)) )
))
(declare-datatypes ((ValueCell!2541 0))(
  ( (ValueCellFull!2541 (v!4949 V!7339)) (EmptyCell!2541) )
))
(declare-datatypes ((array!10781 0))(
  ( (array!10782 (arr!5110 (Array (_ BitVec 32) ValueCell!2541)) (size!5443 (_ BitVec 32))) )
))
(declare-datatypes ((array!10783 0))(
  ( (array!10784 (arr!5111 (Array (_ BitVec 32) (_ BitVec 64))) (size!5444 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2982 0))(
  ( (LongMapFixedSize!2983 (defaultEntry!4150 Int) (mask!9946 (_ BitVec 32)) (extraKeys!3887 (_ BitVec 32)) (zeroValue!3991 V!7339) (minValue!3991 V!7339) (_size!1540 (_ BitVec 32)) (_keys!6204 array!10783) (_values!4133 array!10781) (_vacant!1540 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2982)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10783 (_ BitVec 32)) Bool)

(assert (=> b!219928 (= res!107816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6204 thiss!1504) (mask!9946 thiss!1504)))))

(declare-fun b!219929 () Bool)

(declare-fun res!107819 () Bool)

(declare-datatypes ((SeekEntryResult!804 0))(
  ( (MissingZero!804 (index!5386 (_ BitVec 32))) (Found!804 (index!5387 (_ BitVec 32))) (Intermediate!804 (undefined!1616 Bool) (index!5388 (_ BitVec 32)) (x!22928 (_ BitVec 32))) (Undefined!804) (MissingVacant!804 (index!5389 (_ BitVec 32))) )
))
(declare-fun lt!112064 () SeekEntryResult!804)

(assert (=> b!219929 (= res!107819 (= (select (arr!5111 (_keys!6204 thiss!1504)) (index!5389 lt!112064)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143033 () Bool)

(assert (=> b!219929 (=> (not res!107819) (not e!143033))))

(declare-fun b!219930 () Bool)

(declare-fun c!36615 () Bool)

(get-info :version)

(assert (=> b!219930 (= c!36615 ((_ is MissingVacant!804) lt!112064))))

(declare-fun e!143034 () Bool)

(declare-fun e!143027 () Bool)

(assert (=> b!219930 (= e!143034 e!143027)))

(declare-fun b!219931 () Bool)

(assert (=> b!219931 (= e!143036 false)))

(declare-fun lt!112067 () Bool)

(declare-datatypes ((List!3252 0))(
  ( (Nil!3249) (Cons!3248 (h!3896 (_ BitVec 64)) (t!8211 List!3252)) )
))
(declare-fun arrayNoDuplicates!0 (array!10783 (_ BitVec 32) List!3252) Bool)

(assert (=> b!219931 (= lt!112067 (arrayNoDuplicates!0 (_keys!6204 thiss!1504) #b00000000000000000000000000000000 Nil!3249))))

(declare-fun b!219932 () Bool)

(declare-fun e!143024 () Bool)

(declare-fun call!20555 () Bool)

(assert (=> b!219932 (= e!143024 (not call!20555))))

(declare-fun b!219933 () Bool)

(declare-fun e!143032 () Bool)

(assert (=> b!219933 (= e!143032 e!143036)))

(declare-fun res!107813 () Bool)

(assert (=> b!219933 (=> (not res!107813) (not e!143036))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!219933 (= res!107813 (inRange!0 index!297 (mask!9946 thiss!1504)))))

(declare-datatypes ((Unit!6560 0))(
  ( (Unit!6561) )
))
(declare-fun lt!112065 () Unit!6560)

(declare-fun e!143025 () Unit!6560)

(assert (=> b!219933 (= lt!112065 e!143025)))

(declare-fun c!36613 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4350 0))(
  ( (tuple2!4351 (_1!2186 (_ BitVec 64)) (_2!2186 V!7339)) )
))
(declare-datatypes ((List!3253 0))(
  ( (Nil!3250) (Cons!3249 (h!3897 tuple2!4350) (t!8212 List!3253)) )
))
(declare-datatypes ((ListLongMap!3263 0))(
  ( (ListLongMap!3264 (toList!1647 List!3253)) )
))
(declare-fun contains!1490 (ListLongMap!3263 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1175 (array!10783 array!10781 (_ BitVec 32) (_ BitVec 32) V!7339 V!7339 (_ BitVec 32) Int) ListLongMap!3263)

(assert (=> b!219933 (= c!36613 (contains!1490 (getCurrentListMap!1175 (_keys!6204 thiss!1504) (_values!4133 thiss!1504) (mask!9946 thiss!1504) (extraKeys!3887 thiss!1504) (zeroValue!3991 thiss!1504) (minValue!3991 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4150 thiss!1504)) key!932))))

(declare-fun b!219934 () Bool)

(declare-fun res!107818 () Bool)

(assert (=> b!219934 (=> (not res!107818) (not e!143024))))

(declare-fun call!20556 () Bool)

(assert (=> b!219934 (= res!107818 call!20556)))

(assert (=> b!219934 (= e!143034 e!143024)))

(declare-fun mapIsEmpty!9823 () Bool)

(declare-fun mapRes!9823 () Bool)

(assert (=> mapIsEmpty!9823 mapRes!9823))

(declare-fun b!219935 () Bool)

(declare-fun res!107811 () Bool)

(assert (=> b!219935 (=> (not res!107811) (not e!143024))))

(assert (=> b!219935 (= res!107811 (= (select (arr!5111 (_keys!6204 thiss!1504)) (index!5386 lt!112064)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!9823 () Bool)

(declare-fun tp!20862 () Bool)

(declare-fun e!143028 () Bool)

(assert (=> mapNonEmpty!9823 (= mapRes!9823 (and tp!20862 e!143028))))

(declare-fun mapValue!9823 () ValueCell!2541)

(declare-fun mapRest!9823 () (Array (_ BitVec 32) ValueCell!2541))

(declare-fun mapKey!9823 () (_ BitVec 32))

(assert (=> mapNonEmpty!9823 (= (arr!5110 (_values!4133 thiss!1504)) (store mapRest!9823 mapKey!9823 mapValue!9823))))

(declare-fun b!219936 () Bool)

(assert (=> b!219936 (= e!143027 ((_ is Undefined!804) lt!112064))))

(declare-fun c!36614 () Bool)

(declare-fun bm!20552 () Bool)

(assert (=> bm!20552 (= call!20556 (inRange!0 (ite c!36614 (index!5386 lt!112064) (index!5389 lt!112064)) (mask!9946 thiss!1504)))))

(declare-fun res!107810 () Bool)

(declare-fun e!143026 () Bool)

(assert (=> start!21840 (=> (not res!107810) (not e!143026))))

(declare-fun valid!1206 (LongMapFixedSize!2982) Bool)

(assert (=> start!21840 (= res!107810 (valid!1206 thiss!1504))))

(assert (=> start!21840 e!143026))

(declare-fun e!143030 () Bool)

(assert (=> start!21840 e!143030))

(assert (=> start!21840 true))

(declare-fun b!219937 () Bool)

(declare-fun res!107814 () Bool)

(assert (=> b!219937 (=> (not res!107814) (not e!143036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!219937 (= res!107814 (validMask!0 (mask!9946 thiss!1504)))))

(declare-fun b!219938 () Bool)

(declare-fun res!107820 () Bool)

(assert (=> b!219938 (=> (not res!107820) (not e!143036))))

(assert (=> b!219938 (= res!107820 (and (= (size!5443 (_values!4133 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9946 thiss!1504))) (= (size!5444 (_keys!6204 thiss!1504)) (size!5443 (_values!4133 thiss!1504))) (bvsge (mask!9946 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3887 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3887 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun tp_is_empty!5769 () Bool)

(declare-fun e!143031 () Bool)

(declare-fun array_inv!3383 (array!10783) Bool)

(declare-fun array_inv!3384 (array!10781) Bool)

(assert (=> b!219939 (= e!143030 (and tp!20863 tp_is_empty!5769 (array_inv!3383 (_keys!6204 thiss!1504)) (array_inv!3384 (_values!4133 thiss!1504)) e!143031))))

(declare-fun b!219940 () Bool)

(declare-fun lt!112066 () Unit!6560)

(assert (=> b!219940 (= e!143025 lt!112066)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!211 (array!10783 array!10781 (_ BitVec 32) (_ BitVec 32) V!7339 V!7339 (_ BitVec 64) Int) Unit!6560)

(assert (=> b!219940 (= lt!112066 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!211 (_keys!6204 thiss!1504) (_values!4133 thiss!1504) (mask!9946 thiss!1504) (extraKeys!3887 thiss!1504) (zeroValue!3991 thiss!1504) (minValue!3991 thiss!1504) key!932 (defaultEntry!4150 thiss!1504)))))

(assert (=> b!219940 (= c!36614 ((_ is MissingZero!804) lt!112064))))

(assert (=> b!219940 e!143034))

(declare-fun b!219941 () Bool)

(declare-fun e!143029 () Bool)

(assert (=> b!219941 (= e!143031 (and e!143029 mapRes!9823))))

(declare-fun condMapEmpty!9823 () Bool)

(declare-fun mapDefault!9823 () ValueCell!2541)

(assert (=> b!219941 (= condMapEmpty!9823 (= (arr!5110 (_values!4133 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2541)) mapDefault!9823)))))

(declare-fun bm!20553 () Bool)

(declare-fun arrayContainsKey!0 (array!10783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20553 (= call!20555 (arrayContainsKey!0 (_keys!6204 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219942 () Bool)

(declare-fun res!107812 () Bool)

(assert (=> b!219942 (=> (not res!107812) (not e!143036))))

(assert (=> b!219942 (= res!107812 (arrayContainsKey!0 (_keys!6204 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219943 () Bool)

(assert (=> b!219943 (= e!143027 e!143033)))

(declare-fun res!107821 () Bool)

(assert (=> b!219943 (= res!107821 call!20556)))

(assert (=> b!219943 (=> (not res!107821) (not e!143033))))

(declare-fun b!219944 () Bool)

(declare-fun Unit!6562 () Unit!6560)

(assert (=> b!219944 (= e!143025 Unit!6562)))

(declare-fun lt!112063 () Unit!6560)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!199 (array!10783 array!10781 (_ BitVec 32) (_ BitVec 32) V!7339 V!7339 (_ BitVec 64) Int) Unit!6560)

(assert (=> b!219944 (= lt!112063 (lemmaInListMapThenSeekEntryOrOpenFindsIt!199 (_keys!6204 thiss!1504) (_values!4133 thiss!1504) (mask!9946 thiss!1504) (extraKeys!3887 thiss!1504) (zeroValue!3991 thiss!1504) (minValue!3991 thiss!1504) key!932 (defaultEntry!4150 thiss!1504)))))

(assert (=> b!219944 false))

(declare-fun b!219945 () Bool)

(declare-fun res!107817 () Bool)

(assert (=> b!219945 (=> (not res!107817) (not e!143026))))

(assert (=> b!219945 (= res!107817 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!219946 () Bool)

(assert (=> b!219946 (= e!143026 e!143032)))

(declare-fun res!107815 () Bool)

(assert (=> b!219946 (=> (not res!107815) (not e!143032))))

(assert (=> b!219946 (= res!107815 (or (= lt!112064 (MissingZero!804 index!297)) (= lt!112064 (MissingVacant!804 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10783 (_ BitVec 32)) SeekEntryResult!804)

(assert (=> b!219946 (= lt!112064 (seekEntryOrOpen!0 key!932 (_keys!6204 thiss!1504) (mask!9946 thiss!1504)))))

(declare-fun b!219947 () Bool)

(assert (=> b!219947 (= e!143033 (not call!20555))))

(declare-fun b!219948 () Bool)

(assert (=> b!219948 (= e!143029 tp_is_empty!5769)))

(declare-fun b!219949 () Bool)

(assert (=> b!219949 (= e!143028 tp_is_empty!5769)))

(assert (= (and start!21840 res!107810) b!219945))

(assert (= (and b!219945 res!107817) b!219946))

(assert (= (and b!219946 res!107815) b!219933))

(assert (= (and b!219933 c!36613) b!219944))

(assert (= (and b!219933 (not c!36613)) b!219940))

(assert (= (and b!219940 c!36614) b!219934))

(assert (= (and b!219940 (not c!36614)) b!219930))

(assert (= (and b!219934 res!107818) b!219935))

(assert (= (and b!219935 res!107811) b!219932))

(assert (= (and b!219930 c!36615) b!219943))

(assert (= (and b!219930 (not c!36615)) b!219936))

(assert (= (and b!219943 res!107821) b!219929))

(assert (= (and b!219929 res!107819) b!219947))

(assert (= (or b!219934 b!219943) bm!20552))

(assert (= (or b!219932 b!219947) bm!20553))

(assert (= (and b!219933 res!107813) b!219942))

(assert (= (and b!219942 res!107812) b!219937))

(assert (= (and b!219937 res!107814) b!219938))

(assert (= (and b!219938 res!107820) b!219928))

(assert (= (and b!219928 res!107816) b!219931))

(assert (= (and b!219941 condMapEmpty!9823) mapIsEmpty!9823))

(assert (= (and b!219941 (not condMapEmpty!9823)) mapNonEmpty!9823))

(assert (= (and mapNonEmpty!9823 ((_ is ValueCellFull!2541) mapValue!9823)) b!219949))

(assert (= (and b!219941 ((_ is ValueCellFull!2541) mapDefault!9823)) b!219948))

(assert (= b!219939 b!219941))

(assert (= start!21840 b!219939))

(declare-fun m!245301 () Bool)

(assert (=> b!219931 m!245301))

(declare-fun m!245303 () Bool)

(assert (=> b!219944 m!245303))

(declare-fun m!245305 () Bool)

(assert (=> b!219939 m!245305))

(declare-fun m!245307 () Bool)

(assert (=> b!219939 m!245307))

(declare-fun m!245309 () Bool)

(assert (=> b!219946 m!245309))

(declare-fun m!245311 () Bool)

(assert (=> b!219942 m!245311))

(declare-fun m!245313 () Bool)

(assert (=> b!219937 m!245313))

(declare-fun m!245315 () Bool)

(assert (=> b!219928 m!245315))

(declare-fun m!245317 () Bool)

(assert (=> start!21840 m!245317))

(declare-fun m!245319 () Bool)

(assert (=> mapNonEmpty!9823 m!245319))

(declare-fun m!245321 () Bool)

(assert (=> b!219929 m!245321))

(declare-fun m!245323 () Bool)

(assert (=> bm!20552 m!245323))

(assert (=> bm!20553 m!245311))

(declare-fun m!245325 () Bool)

(assert (=> b!219933 m!245325))

(declare-fun m!245327 () Bool)

(assert (=> b!219933 m!245327))

(assert (=> b!219933 m!245327))

(declare-fun m!245329 () Bool)

(assert (=> b!219933 m!245329))

(declare-fun m!245331 () Bool)

(assert (=> b!219940 m!245331))

(declare-fun m!245333 () Bool)

(assert (=> b!219935 m!245333))

(check-sat tp_is_empty!5769 (not bm!20553) (not b!219933) (not start!21840) (not b!219928) (not b!219939) (not b_next!5907) b_and!12805 (not b!219940) (not b!219931) (not b!219937) (not b!219944) (not mapNonEmpty!9823) (not b!219946) (not b!219942) (not bm!20552))
(check-sat b_and!12805 (not b_next!5907))
