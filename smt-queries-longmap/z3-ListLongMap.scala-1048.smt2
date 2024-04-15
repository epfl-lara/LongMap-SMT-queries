; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21974 () Bool)

(assert start!21974)

(declare-fun b!224926 () Bool)

(declare-fun b_free!6037 () Bool)

(declare-fun b_next!6037 () Bool)

(assert (=> b!224926 (= b_free!6037 (not b_next!6037))))

(declare-fun tp!21253 () Bool)

(declare-fun b_and!12909 () Bool)

(assert (=> b!224926 (= tp!21253 b_and!12909)))

(declare-fun b!224905 () Bool)

(declare-fun res!110651 () Bool)

(declare-fun e!145987 () Bool)

(assert (=> b!224905 (=> res!110651 e!145987)))

(declare-datatypes ((V!7513 0))(
  ( (V!7514 (val!2994 Int)) )
))
(declare-datatypes ((ValueCell!2606 0))(
  ( (ValueCellFull!2606 (v!5008 V!7513)) (EmptyCell!2606) )
))
(declare-datatypes ((array!11033 0))(
  ( (array!11034 (arr!5235 (Array (_ BitVec 32) ValueCell!2606)) (size!5569 (_ BitVec 32))) )
))
(declare-datatypes ((array!11035 0))(
  ( (array!11036 (arr!5236 (Array (_ BitVec 32) (_ BitVec 64))) (size!5570 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3112 0))(
  ( (LongMapFixedSize!3113 (defaultEntry!4215 Int) (mask!10054 (_ BitVec 32)) (extraKeys!3952 (_ BitVec 32)) (zeroValue!4056 V!7513) (minValue!4056 V!7513) (_size!1605 (_ BitVec 32)) (_keys!6268 array!11035) (_values!4198 array!11033) (_vacant!1605 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3112)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!224905 (= res!110651 (or (not (= (size!5570 (_keys!6268 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10054 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5570 (_keys!6268 thiss!1504)))))))

(declare-fun b!224906 () Bool)

(declare-fun res!110655 () Bool)

(assert (=> b!224906 (=> res!110655 e!145987)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!224906 (= res!110655 (not (validKeyInArray!0 key!932)))))

(declare-datatypes ((SeekEntryResult!862 0))(
  ( (MissingZero!862 (index!5618 (_ BitVec 32))) (Found!862 (index!5619 (_ BitVec 32))) (Intermediate!862 (undefined!1674 Bool) (index!5620 (_ BitVec 32)) (x!23161 (_ BitVec 32))) (Undefined!862) (MissingVacant!862 (index!5621 (_ BitVec 32))) )
))
(declare-fun lt!113203 () SeekEntryResult!862)

(declare-fun bm!20918 () Bool)

(declare-fun c!37293 () Bool)

(declare-fun call!20921 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20918 (= call!20921 (inRange!0 (ite c!37293 (index!5618 lt!113203) (index!5621 lt!113203)) (mask!10054 thiss!1504)))))

(declare-fun b!224907 () Bool)

(declare-fun e!145993 () Bool)

(declare-fun e!145992 () Bool)

(assert (=> b!224907 (= e!145993 e!145992)))

(declare-fun res!110656 () Bool)

(assert (=> b!224907 (= res!110656 call!20921)))

(assert (=> b!224907 (=> (not res!110656) (not e!145992))))

(declare-fun mapIsEmpty!10018 () Bool)

(declare-fun mapRes!10018 () Bool)

(assert (=> mapIsEmpty!10018 mapRes!10018))

(declare-fun b!224908 () Bool)

(declare-datatypes ((Unit!6725 0))(
  ( (Unit!6726) )
))
(declare-fun e!145995 () Unit!6725)

(declare-fun Unit!6727 () Unit!6725)

(assert (=> b!224908 (= e!145995 Unit!6727)))

(declare-fun lt!113193 () Unit!6725)

(declare-fun lemmaArrayContainsKeyThenInListMap!82 (array!11035 array!11033 (_ BitVec 32) (_ BitVec 32) V!7513 V!7513 (_ BitVec 64) (_ BitVec 32) Int) Unit!6725)

(assert (=> b!224908 (= lt!113193 (lemmaArrayContainsKeyThenInListMap!82 (_keys!6268 thiss!1504) (_values!4198 thiss!1504) (mask!10054 thiss!1504) (extraKeys!3952 thiss!1504) (zeroValue!4056 thiss!1504) (minValue!4056 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4215 thiss!1504)))))

(assert (=> b!224908 false))

(declare-fun b!224909 () Bool)

(declare-fun res!110657 () Bool)

(declare-fun e!145989 () Bool)

(assert (=> b!224909 (=> (not res!110657) (not e!145989))))

(assert (=> b!224909 (= res!110657 call!20921)))

(declare-fun e!145991 () Bool)

(assert (=> b!224909 (= e!145991 e!145989)))

(declare-fun b!224910 () Bool)

(declare-fun res!110654 () Bool)

(assert (=> b!224910 (=> res!110654 e!145987)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11035 (_ BitVec 32)) Bool)

(assert (=> b!224910 (= res!110654 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6268 thiss!1504) (mask!10054 thiss!1504))))))

(declare-fun b!224911 () Bool)

(assert (=> b!224911 (= e!145987 true)))

(declare-fun lt!113196 () Bool)

(declare-datatypes ((List!3330 0))(
  ( (Nil!3327) (Cons!3326 (h!3974 (_ BitVec 64)) (t!8280 List!3330)) )
))
(declare-fun arrayNoDuplicates!0 (array!11035 (_ BitVec 32) List!3330) Bool)

(assert (=> b!224911 (= lt!113196 (arrayNoDuplicates!0 (_keys!6268 thiss!1504) #b00000000000000000000000000000000 Nil!3327))))

(declare-fun b!224912 () Bool)

(declare-fun c!37292 () Bool)

(get-info :version)

(assert (=> b!224912 (= c!37292 ((_ is MissingVacant!862) lt!113203))))

(assert (=> b!224912 (= e!145991 e!145993)))

(declare-fun b!224913 () Bool)

(assert (=> b!224913 (= e!145993 ((_ is Undefined!862) lt!113203))))

(declare-fun b!224914 () Bool)

(declare-fun e!145985 () Bool)

(declare-fun e!145994 () Bool)

(assert (=> b!224914 (= e!145985 (and e!145994 mapRes!10018))))

(declare-fun condMapEmpty!10018 () Bool)

(declare-fun mapDefault!10018 () ValueCell!2606)

(assert (=> b!224914 (= condMapEmpty!10018 (= (arr!5235 (_values!4198 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2606)) mapDefault!10018)))))

(declare-fun b!224915 () Bool)

(declare-fun Unit!6728 () Unit!6725)

(assert (=> b!224915 (= e!145995 Unit!6728)))

(declare-fun b!224916 () Bool)

(declare-fun e!145996 () Unit!6725)

(declare-fun lt!113201 () Unit!6725)

(assert (=> b!224916 (= e!145996 lt!113201)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!237 (array!11035 array!11033 (_ BitVec 32) (_ BitVec 32) V!7513 V!7513 (_ BitVec 64) Int) Unit!6725)

(assert (=> b!224916 (= lt!113201 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!237 (_keys!6268 thiss!1504) (_values!4198 thiss!1504) (mask!10054 thiss!1504) (extraKeys!3952 thiss!1504) (zeroValue!4056 thiss!1504) (minValue!4056 thiss!1504) key!932 (defaultEntry!4215 thiss!1504)))))

(assert (=> b!224916 (= c!37293 ((_ is MissingZero!862) lt!113203))))

(assert (=> b!224916 e!145991))

(declare-fun b!224917 () Bool)

(declare-fun e!145998 () Bool)

(declare-fun e!145984 () Bool)

(assert (=> b!224917 (= e!145998 e!145984)))

(declare-fun res!110663 () Bool)

(assert (=> b!224917 (=> (not res!110663) (not e!145984))))

(assert (=> b!224917 (= res!110663 (inRange!0 index!297 (mask!10054 thiss!1504)))))

(declare-fun lt!113200 () Unit!6725)

(assert (=> b!224917 (= lt!113200 e!145996)))

(declare-fun c!37294 () Bool)

(declare-datatypes ((tuple2!4402 0))(
  ( (tuple2!4403 (_1!2212 (_ BitVec 64)) (_2!2212 V!7513)) )
))
(declare-datatypes ((List!3331 0))(
  ( (Nil!3328) (Cons!3327 (h!3975 tuple2!4402) (t!8281 List!3331)) )
))
(declare-datatypes ((ListLongMap!3305 0))(
  ( (ListLongMap!3306 (toList!1668 List!3331)) )
))
(declare-fun contains!1543 (ListLongMap!3305 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1177 (array!11035 array!11033 (_ BitVec 32) (_ BitVec 32) V!7513 V!7513 (_ BitVec 32) Int) ListLongMap!3305)

(assert (=> b!224917 (= c!37294 (contains!1543 (getCurrentListMap!1177 (_keys!6268 thiss!1504) (_values!4198 thiss!1504) (mask!10054 thiss!1504) (extraKeys!3952 thiss!1504) (zeroValue!4056 thiss!1504) (minValue!4056 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4215 thiss!1504)) key!932))))

(declare-fun b!224918 () Bool)

(declare-fun call!20922 () Bool)

(assert (=> b!224918 (= e!145989 (not call!20922))))

(declare-fun b!224919 () Bool)

(declare-fun res!110660 () Bool)

(assert (=> b!224919 (=> res!110660 e!145987)))

(declare-fun lt!113198 () Bool)

(assert (=> b!224919 (= res!110660 lt!113198)))

(declare-fun b!224920 () Bool)

(declare-fun tp_is_empty!5899 () Bool)

(assert (=> b!224920 (= e!145994 tp_is_empty!5899)))

(declare-fun b!224921 () Bool)

(assert (=> b!224921 (= e!145992 (not call!20922))))

(declare-fun b!224922 () Bool)

(declare-fun res!110653 () Bool)

(assert (=> b!224922 (= res!110653 (= (select (arr!5236 (_keys!6268 thiss!1504)) (index!5621 lt!113203)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!224922 (=> (not res!110653) (not e!145992))))

(declare-fun b!224923 () Bool)

(declare-fun e!145990 () Bool)

(assert (=> b!224923 (= e!145990 e!145998)))

(declare-fun res!110659 () Bool)

(assert (=> b!224923 (=> (not res!110659) (not e!145998))))

(assert (=> b!224923 (= res!110659 (or (= lt!113203 (MissingZero!862 index!297)) (= lt!113203 (MissingVacant!862 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11035 (_ BitVec 32)) SeekEntryResult!862)

(assert (=> b!224923 (= lt!113203 (seekEntryOrOpen!0 key!932 (_keys!6268 thiss!1504) (mask!10054 thiss!1504)))))

(declare-fun bm!20919 () Bool)

(declare-fun arrayContainsKey!0 (array!11035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20919 (= call!20922 (arrayContainsKey!0 (_keys!6268 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224924 () Bool)

(declare-fun e!145986 () Bool)

(assert (=> b!224924 (= e!145986 tp_is_empty!5899)))

(declare-fun b!224925 () Bool)

(declare-fun Unit!6729 () Unit!6725)

(assert (=> b!224925 (= e!145996 Unit!6729)))

(declare-fun lt!113199 () Unit!6725)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!238 (array!11035 array!11033 (_ BitVec 32) (_ BitVec 32) V!7513 V!7513 (_ BitVec 64) Int) Unit!6725)

(assert (=> b!224925 (= lt!113199 (lemmaInListMapThenSeekEntryOrOpenFindsIt!238 (_keys!6268 thiss!1504) (_values!4198 thiss!1504) (mask!10054 thiss!1504) (extraKeys!3952 thiss!1504) (zeroValue!4056 thiss!1504) (minValue!4056 thiss!1504) key!932 (defaultEntry!4215 thiss!1504)))))

(assert (=> b!224925 false))

(declare-fun e!145988 () Bool)

(declare-fun array_inv!3451 (array!11035) Bool)

(declare-fun array_inv!3452 (array!11033) Bool)

(assert (=> b!224926 (= e!145988 (and tp!21253 tp_is_empty!5899 (array_inv!3451 (_keys!6268 thiss!1504)) (array_inv!3452 (_values!4198 thiss!1504)) e!145985))))

(declare-fun b!224927 () Bool)

(assert (=> b!224927 (= e!145984 (not e!145987))))

(declare-fun res!110652 () Bool)

(assert (=> b!224927 (=> res!110652 e!145987)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!224927 (= res!110652 (not (validMask!0 (mask!10054 thiss!1504))))))

(declare-fun lt!113195 () array!11035)

(declare-fun arrayCountValidKeys!0 (array!11035 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!224927 (= (arrayCountValidKeys!0 lt!113195 #b00000000000000000000000000000000 (size!5570 (_keys!6268 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6268 thiss!1504) #b00000000000000000000000000000000 (size!5570 (_keys!6268 thiss!1504)))))))

(declare-fun lt!113194 () Unit!6725)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11035 (_ BitVec 32) (_ BitVec 64)) Unit!6725)

(assert (=> b!224927 (= lt!113194 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6268 thiss!1504) index!297 key!932))))

(assert (=> b!224927 (arrayNoDuplicates!0 lt!113195 #b00000000000000000000000000000000 Nil!3327)))

(assert (=> b!224927 (= lt!113195 (array!11036 (store (arr!5236 (_keys!6268 thiss!1504)) index!297 key!932) (size!5570 (_keys!6268 thiss!1504))))))

(declare-fun lt!113197 () Unit!6725)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11035 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3330) Unit!6725)

(assert (=> b!224927 (= lt!113197 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6268 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3327))))

(declare-fun lt!113202 () Unit!6725)

(assert (=> b!224927 (= lt!113202 e!145995)))

(declare-fun c!37291 () Bool)

(assert (=> b!224927 (= c!37291 lt!113198)))

(assert (=> b!224927 (= lt!113198 (arrayContainsKey!0 (_keys!6268 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!10018 () Bool)

(declare-fun tp!21252 () Bool)

(assert (=> mapNonEmpty!10018 (= mapRes!10018 (and tp!21252 e!145986))))

(declare-fun mapValue!10018 () ValueCell!2606)

(declare-fun mapRest!10018 () (Array (_ BitVec 32) ValueCell!2606))

(declare-fun mapKey!10018 () (_ BitVec 32))

(assert (=> mapNonEmpty!10018 (= (arr!5235 (_values!4198 thiss!1504)) (store mapRest!10018 mapKey!10018 mapValue!10018))))

(declare-fun res!110658 () Bool)

(assert (=> start!21974 (=> (not res!110658) (not e!145990))))

(declare-fun valid!1264 (LongMapFixedSize!3112) Bool)

(assert (=> start!21974 (= res!110658 (valid!1264 thiss!1504))))

(assert (=> start!21974 e!145990))

(assert (=> start!21974 e!145988))

(assert (=> start!21974 true))

(declare-fun b!224928 () Bool)

(declare-fun res!110662 () Bool)

(assert (=> b!224928 (=> (not res!110662) (not e!145990))))

(assert (=> b!224928 (= res!110662 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!224929 () Bool)

(declare-fun res!110661 () Bool)

(assert (=> b!224929 (=> (not res!110661) (not e!145989))))

(assert (=> b!224929 (= res!110661 (= (select (arr!5236 (_keys!6268 thiss!1504)) (index!5618 lt!113203)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!21974 res!110658) b!224928))

(assert (= (and b!224928 res!110662) b!224923))

(assert (= (and b!224923 res!110659) b!224917))

(assert (= (and b!224917 c!37294) b!224925))

(assert (= (and b!224917 (not c!37294)) b!224916))

(assert (= (and b!224916 c!37293) b!224909))

(assert (= (and b!224916 (not c!37293)) b!224912))

(assert (= (and b!224909 res!110657) b!224929))

(assert (= (and b!224929 res!110661) b!224918))

(assert (= (and b!224912 c!37292) b!224907))

(assert (= (and b!224912 (not c!37292)) b!224913))

(assert (= (and b!224907 res!110656) b!224922))

(assert (= (and b!224922 res!110653) b!224921))

(assert (= (or b!224909 b!224907) bm!20918))

(assert (= (or b!224918 b!224921) bm!20919))

(assert (= (and b!224917 res!110663) b!224927))

(assert (= (and b!224927 c!37291) b!224908))

(assert (= (and b!224927 (not c!37291)) b!224915))

(assert (= (and b!224927 (not res!110652)) b!224905))

(assert (= (and b!224905 (not res!110651)) b!224906))

(assert (= (and b!224906 (not res!110655)) b!224919))

(assert (= (and b!224919 (not res!110660)) b!224910))

(assert (= (and b!224910 (not res!110654)) b!224911))

(assert (= (and b!224914 condMapEmpty!10018) mapIsEmpty!10018))

(assert (= (and b!224914 (not condMapEmpty!10018)) mapNonEmpty!10018))

(assert (= (and mapNonEmpty!10018 ((_ is ValueCellFull!2606) mapValue!10018)) b!224924))

(assert (= (and b!224914 ((_ is ValueCellFull!2606) mapDefault!10018)) b!224920))

(assert (= b!224926 b!224914))

(assert (= start!21974 b!224926))

(declare-fun m!247183 () Bool)

(assert (=> b!224926 m!247183))

(declare-fun m!247185 () Bool)

(assert (=> b!224926 m!247185))

(declare-fun m!247187 () Bool)

(assert (=> b!224929 m!247187))

(declare-fun m!247189 () Bool)

(assert (=> bm!20918 m!247189))

(declare-fun m!247191 () Bool)

(assert (=> b!224906 m!247191))

(declare-fun m!247193 () Bool)

(assert (=> b!224911 m!247193))

(declare-fun m!247195 () Bool)

(assert (=> b!224925 m!247195))

(declare-fun m!247197 () Bool)

(assert (=> b!224922 m!247197))

(declare-fun m!247199 () Bool)

(assert (=> b!224923 m!247199))

(declare-fun m!247201 () Bool)

(assert (=> b!224908 m!247201))

(declare-fun m!247203 () Bool)

(assert (=> b!224927 m!247203))

(declare-fun m!247205 () Bool)

(assert (=> b!224927 m!247205))

(declare-fun m!247207 () Bool)

(assert (=> b!224927 m!247207))

(declare-fun m!247209 () Bool)

(assert (=> b!224927 m!247209))

(declare-fun m!247211 () Bool)

(assert (=> b!224927 m!247211))

(declare-fun m!247213 () Bool)

(assert (=> b!224927 m!247213))

(declare-fun m!247215 () Bool)

(assert (=> b!224927 m!247215))

(declare-fun m!247217 () Bool)

(assert (=> b!224927 m!247217))

(declare-fun m!247219 () Bool)

(assert (=> start!21974 m!247219))

(declare-fun m!247221 () Bool)

(assert (=> b!224916 m!247221))

(assert (=> bm!20919 m!247205))

(declare-fun m!247223 () Bool)

(assert (=> mapNonEmpty!10018 m!247223))

(declare-fun m!247225 () Bool)

(assert (=> b!224910 m!247225))

(declare-fun m!247227 () Bool)

(assert (=> b!224917 m!247227))

(declare-fun m!247229 () Bool)

(assert (=> b!224917 m!247229))

(assert (=> b!224917 m!247229))

(declare-fun m!247231 () Bool)

(assert (=> b!224917 m!247231))

(check-sat (not b!224926) (not start!21974) (not bm!20918) (not bm!20919) (not mapNonEmpty!10018) (not b!224916) (not b!224925) (not b!224910) (not b!224917) (not b!224927) (not b!224908) tp_is_empty!5899 (not b!224923) (not b!224911) (not b_next!6037) (not b!224906) b_and!12909)
(check-sat b_and!12909 (not b_next!6037))
