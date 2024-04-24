; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75730 () Bool)

(assert start!75730)

(declare-fun b!889715 () Bool)

(declare-fun b_free!15589 () Bool)

(declare-fun b_next!15589 () Bool)

(assert (=> b!889715 (= b_free!15589 (not b_next!15589))))

(declare-fun tp!54723 () Bool)

(declare-fun b_and!25839 () Bool)

(assert (=> b!889715 (= tp!54723 b_and!25839)))

(declare-fun res!602838 () Bool)

(declare-fun e!495911 () Bool)

(assert (=> start!75730 (=> (not res!602838) (not e!495911))))

(declare-datatypes ((array!51845 0))(
  ( (array!51846 (arr!24928 (Array (_ BitVec 32) (_ BitVec 64))) (size!25371 (_ BitVec 32))) )
))
(declare-datatypes ((V!28855 0))(
  ( (V!28856 (val!9009 Int)) )
))
(declare-datatypes ((ValueCell!8477 0))(
  ( (ValueCellFull!8477 (v!11481 V!28855)) (EmptyCell!8477) )
))
(declare-datatypes ((array!51847 0))(
  ( (array!51848 (arr!24929 (Array (_ BitVec 32) ValueCell!8477)) (size!25372 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3970 0))(
  ( (LongMapFixedSize!3971 (defaultEntry!5182 Int) (mask!25657 (_ BitVec 32)) (extraKeys!4876 (_ BitVec 32)) (zeroValue!4980 V!28855) (minValue!4980 V!28855) (_size!2040 (_ BitVec 32)) (_keys!9891 array!51845) (_values!5167 array!51847) (_vacant!2040 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3970)

(declare-fun valid!1559 (LongMapFixedSize!3970) Bool)

(assert (=> start!75730 (= res!602838 (valid!1559 thiss!1181))))

(assert (=> start!75730 e!495911))

(declare-fun e!495910 () Bool)

(assert (=> start!75730 e!495910))

(assert (=> start!75730 true))

(declare-fun b!889713 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((Option!446 0))(
  ( (Some!445 (v!11482 V!28855)) (None!444) )
))
(declare-fun isDefined!320 (Option!446) Bool)

(declare-datatypes ((tuple2!11860 0))(
  ( (tuple2!11861 (_1!5941 (_ BitVec 64)) (_2!5941 V!28855)) )
))
(declare-datatypes ((List!17644 0))(
  ( (Nil!17641) (Cons!17640 (h!18777 tuple2!11860) (t!24935 List!17644)) )
))
(declare-fun getValueByKey!440 (List!17644 (_ BitVec 64)) Option!446)

(declare-datatypes ((ListLongMap!10559 0))(
  ( (ListLongMap!10560 (toList!5295 List!17644)) )
))
(declare-fun map!12107 (LongMapFixedSize!3970) ListLongMap!10559)

(assert (=> b!889713 (= e!495911 (not (isDefined!320 (getValueByKey!440 (toList!5295 (map!12107 thiss!1181)) key!785))))))

(declare-fun mapIsEmpty!28416 () Bool)

(declare-fun mapRes!28416 () Bool)

(assert (=> mapIsEmpty!28416 mapRes!28416))

(declare-fun b!889714 () Bool)

(declare-fun e!495909 () Bool)

(declare-fun tp_is_empty!17917 () Bool)

(assert (=> b!889714 (= e!495909 tp_is_empty!17917)))

(declare-fun e!495907 () Bool)

(declare-fun array_inv!19654 (array!51845) Bool)

(declare-fun array_inv!19655 (array!51847) Bool)

(assert (=> b!889715 (= e!495910 (and tp!54723 tp_is_empty!17917 (array_inv!19654 (_keys!9891 thiss!1181)) (array_inv!19655 (_values!5167 thiss!1181)) e!495907))))

(declare-fun b!889716 () Bool)

(declare-fun e!495908 () Bool)

(assert (=> b!889716 (= e!495907 (and e!495908 mapRes!28416))))

(declare-fun condMapEmpty!28416 () Bool)

(declare-fun mapDefault!28416 () ValueCell!8477)

(assert (=> b!889716 (= condMapEmpty!28416 (= (arr!24929 (_values!5167 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8477)) mapDefault!28416)))))

(declare-fun mapNonEmpty!28416 () Bool)

(declare-fun tp!54722 () Bool)

(assert (=> mapNonEmpty!28416 (= mapRes!28416 (and tp!54722 e!495909))))

(declare-fun mapKey!28416 () (_ BitVec 32))

(declare-fun mapValue!28416 () ValueCell!8477)

(declare-fun mapRest!28416 () (Array (_ BitVec 32) ValueCell!8477))

(assert (=> mapNonEmpty!28416 (= (arr!24929 (_values!5167 thiss!1181)) (store mapRest!28416 mapKey!28416 mapValue!28416))))

(declare-fun b!889717 () Bool)

(declare-fun res!602837 () Bool)

(assert (=> b!889717 (=> (not res!602837) (not e!495911))))

(declare-fun contains!4306 (LongMapFixedSize!3970 (_ BitVec 64)) Bool)

(assert (=> b!889717 (= res!602837 (contains!4306 thiss!1181 key!785))))

(declare-fun b!889718 () Bool)

(declare-fun res!602839 () Bool)

(assert (=> b!889718 (=> (not res!602839) (not e!495911))))

(assert (=> b!889718 (= res!602839 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4876 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (or (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4876 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!889719 () Bool)

(assert (=> b!889719 (= e!495908 tp_is_empty!17917)))

(assert (= (and start!75730 res!602838) b!889718))

(assert (= (and b!889718 res!602839) b!889717))

(assert (= (and b!889717 res!602837) b!889713))

(assert (= (and b!889716 condMapEmpty!28416) mapIsEmpty!28416))

(assert (= (and b!889716 (not condMapEmpty!28416)) mapNonEmpty!28416))

(get-info :version)

(assert (= (and mapNonEmpty!28416 ((_ is ValueCellFull!8477) mapValue!28416)) b!889714))

(assert (= (and b!889716 ((_ is ValueCellFull!8477) mapDefault!28416)) b!889719))

(assert (= b!889715 b!889716))

(assert (= start!75730 b!889715))

(declare-fun m!829297 () Bool)

(assert (=> b!889713 m!829297))

(declare-fun m!829299 () Bool)

(assert (=> b!889713 m!829299))

(assert (=> b!889713 m!829299))

(declare-fun m!829301 () Bool)

(assert (=> b!889713 m!829301))

(declare-fun m!829303 () Bool)

(assert (=> b!889717 m!829303))

(declare-fun m!829305 () Bool)

(assert (=> start!75730 m!829305))

(declare-fun m!829307 () Bool)

(assert (=> mapNonEmpty!28416 m!829307))

(declare-fun m!829309 () Bool)

(assert (=> b!889715 m!829309))

(declare-fun m!829311 () Bool)

(assert (=> b!889715 m!829311))

(check-sat (not b!889715) (not mapNonEmpty!28416) (not b!889717) (not start!75730) tp_is_empty!17917 (not b!889713) (not b_next!15589) b_and!25839)
(check-sat b_and!25839 (not b_next!15589))
(get-model)

(declare-fun d!110425 () Bool)

(declare-fun res!602864 () Bool)

(declare-fun e!495950 () Bool)

(assert (=> d!110425 (=> (not res!602864) (not e!495950))))

(declare-fun simpleValid!291 (LongMapFixedSize!3970) Bool)

(assert (=> d!110425 (= res!602864 (simpleValid!291 thiss!1181))))

(assert (=> d!110425 (= (valid!1559 thiss!1181) e!495950)))

(declare-fun b!889768 () Bool)

(declare-fun res!602865 () Bool)

(assert (=> b!889768 (=> (not res!602865) (not e!495950))))

(declare-fun arrayCountValidKeys!0 (array!51845 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!889768 (= res!602865 (= (arrayCountValidKeys!0 (_keys!9891 thiss!1181) #b00000000000000000000000000000000 (size!25371 (_keys!9891 thiss!1181))) (_size!2040 thiss!1181)))))

(declare-fun b!889769 () Bool)

(declare-fun res!602866 () Bool)

(assert (=> b!889769 (=> (not res!602866) (not e!495950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51845 (_ BitVec 32)) Bool)

(assert (=> b!889769 (= res!602866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9891 thiss!1181) (mask!25657 thiss!1181)))))

(declare-fun b!889770 () Bool)

(declare-datatypes ((List!17647 0))(
  ( (Nil!17644) (Cons!17643 (h!18780 (_ BitVec 64)) (t!24938 List!17647)) )
))
(declare-fun arrayNoDuplicates!0 (array!51845 (_ BitVec 32) List!17647) Bool)

(assert (=> b!889770 (= e!495950 (arrayNoDuplicates!0 (_keys!9891 thiss!1181) #b00000000000000000000000000000000 Nil!17644))))

(assert (= (and d!110425 res!602864) b!889768))

(assert (= (and b!889768 res!602865) b!889769))

(assert (= (and b!889769 res!602866) b!889770))

(declare-fun m!829345 () Bool)

(assert (=> d!110425 m!829345))

(declare-fun m!829347 () Bool)

(assert (=> b!889768 m!829347))

(declare-fun m!829349 () Bool)

(assert (=> b!889769 m!829349))

(declare-fun m!829351 () Bool)

(assert (=> b!889770 m!829351))

(assert (=> start!75730 d!110425))

(declare-fun b!889791 () Bool)

(declare-fun e!495964 () Bool)

(declare-fun e!495961 () Bool)

(assert (=> b!889791 (= e!495964 e!495961)))

(declare-fun c!94193 () Bool)

(assert (=> b!889791 (= c!94193 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!39532 () Bool)

(declare-fun call!39536 () ListLongMap!10559)

(declare-datatypes ((SeekEntryResult!8719 0))(
  ( (MissingZero!8719 (index!37247 (_ BitVec 32))) (Found!8719 (index!37248 (_ BitVec 32))) (Intermediate!8719 (undefined!9531 Bool) (index!37249 (_ BitVec 32)) (x!75393 (_ BitVec 32))) (Undefined!8719) (MissingVacant!8719 (index!37250 (_ BitVec 32))) )
))
(declare-fun lt!402320 () SeekEntryResult!8719)

(declare-fun c!94195 () Bool)

(declare-fun call!39535 () Bool)

(declare-fun contains!4308 (ListLongMap!10559 (_ BitVec 64)) Bool)

(assert (=> bm!39532 (= call!39535 (contains!4308 call!39536 (ite c!94195 (select (arr!24928 (_keys!9891 thiss!1181)) (index!37248 lt!402320)) key!785)))))

(declare-fun bm!39533 () Bool)

(declare-fun call!39537 () Bool)

(declare-fun arrayContainsKey!0 (array!51845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39533 (= call!39537 (arrayContainsKey!0 (_keys!9891 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!889793 () Bool)

(assert (=> b!889793 false))

(declare-datatypes ((Unit!30254 0))(
  ( (Unit!30255) )
))
(declare-fun lt!402327 () Unit!30254)

(declare-fun lt!402321 () Unit!30254)

(assert (=> b!889793 (= lt!402327 lt!402321)))

(declare-fun lt!402315 () SeekEntryResult!8719)

(declare-fun lt!402317 () (_ BitVec 32))

(assert (=> b!889793 (and ((_ is Found!8719) lt!402315) (= (index!37248 lt!402315) lt!402317))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51845 (_ BitVec 32)) SeekEntryResult!8719)

(assert (=> b!889793 (= lt!402315 (seekEntry!0 key!785 (_keys!9891 thiss!1181) (mask!25657 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!51845 (_ BitVec 32)) Unit!30254)

(assert (=> b!889793 (= lt!402321 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!402317 (_keys!9891 thiss!1181) (mask!25657 thiss!1181)))))

(declare-fun lt!402319 () Unit!30254)

(declare-fun lt!402326 () Unit!30254)

(assert (=> b!889793 (= lt!402319 lt!402326)))

(assert (=> b!889793 (arrayForallSeekEntryOrOpenFound!0 lt!402317 (_keys!9891 thiss!1181) (mask!25657 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!51845 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30254)

(assert (=> b!889793 (= lt!402326 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9891 thiss!1181) (mask!25657 thiss!1181) #b00000000000000000000000000000000 lt!402317))))

(declare-fun arrayScanForKey!0 (array!51845 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!889793 (= lt!402317 (arrayScanForKey!0 (_keys!9891 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!402328 () Unit!30254)

(declare-fun lt!402316 () Unit!30254)

(assert (=> b!889793 (= lt!402328 lt!402316)))

(declare-fun e!495963 () Bool)

(assert (=> b!889793 e!495963))

(declare-fun c!94196 () Bool)

(assert (=> b!889793 (= c!94196 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!162 (array!51845 array!51847 (_ BitVec 32) (_ BitVec 32) V!28855 V!28855 (_ BitVec 64) Int) Unit!30254)

(assert (=> b!889793 (= lt!402316 (lemmaKeyInListMapIsInArray!162 (_keys!9891 thiss!1181) (_values!5167 thiss!1181) (mask!25657 thiss!1181) (extraKeys!4876 thiss!1181) (zeroValue!4980 thiss!1181) (minValue!4980 thiss!1181) key!785 (defaultEntry!5182 thiss!1181)))))

(declare-fun e!495962 () Unit!30254)

(declare-fun Unit!30256 () Unit!30254)

(assert (=> b!889793 (= e!495962 Unit!30256)))

(declare-fun bm!39534 () Bool)

(declare-fun getCurrentListMap!2575 (array!51845 array!51847 (_ BitVec 32) (_ BitVec 32) V!28855 V!28855 (_ BitVec 32) Int) ListLongMap!10559)

(assert (=> bm!39534 (= call!39536 (getCurrentListMap!2575 (_keys!9891 thiss!1181) (_values!5167 thiss!1181) (mask!25657 thiss!1181) (extraKeys!4876 thiss!1181) (zeroValue!4980 thiss!1181) (minValue!4980 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5182 thiss!1181)))))

(declare-fun b!889794 () Bool)

(assert (=> b!889794 (= e!495964 (not (= (bvand (extraKeys!4876 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!889795 () Bool)

(declare-fun e!495965 () Bool)

(assert (=> b!889795 (= e!495965 false)))

(declare-fun c!94194 () Bool)

(assert (=> b!889795 (= c!94194 call!39535)))

(declare-fun lt!402323 () Unit!30254)

(assert (=> b!889795 (= lt!402323 e!495962)))

(declare-fun b!889796 () Bool)

(declare-fun Unit!30257 () Unit!30254)

(assert (=> b!889796 (= e!495962 Unit!30257)))

(declare-fun b!889797 () Bool)

(assert (=> b!889797 (= c!94195 ((_ is Found!8719) lt!402320))))

(assert (=> b!889797 (= lt!402320 (seekEntry!0 key!785 (_keys!9891 thiss!1181) (mask!25657 thiss!1181)))))

(assert (=> b!889797 (= e!495961 e!495965)))

(declare-fun b!889798 () Bool)

(assert (=> b!889798 (= e!495961 (not (= (bvand (extraKeys!4876 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!110427 () Bool)

(declare-fun lt!402322 () Bool)

(assert (=> d!110427 (= lt!402322 (contains!4308 (map!12107 thiss!1181) key!785))))

(assert (=> d!110427 (= lt!402322 e!495964)))

(declare-fun c!94197 () Bool)

(assert (=> d!110427 (= c!94197 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110427 (valid!1559 thiss!1181)))

(assert (=> d!110427 (= (contains!4306 thiss!1181 key!785) lt!402322)))

(declare-fun b!889792 () Bool)

(assert (=> b!889792 (= e!495963 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4876 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4876 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!889799 () Bool)

(assert (=> b!889799 (= e!495963 call!39537)))

(declare-fun b!889800 () Bool)

(assert (=> b!889800 (= e!495965 true)))

(declare-fun lt!402325 () Unit!30254)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51845 (_ BitVec 64) (_ BitVec 32)) Unit!30254)

(assert (=> b!889800 (= lt!402325 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9891 thiss!1181) key!785 (index!37248 lt!402320)))))

(assert (=> b!889800 call!39537))

(declare-fun lt!402324 () Unit!30254)

(assert (=> b!889800 (= lt!402324 lt!402325)))

(declare-fun lt!402318 () Unit!30254)

(declare-fun lemmaValidKeyInArrayIsInListMap!205 (array!51845 array!51847 (_ BitVec 32) (_ BitVec 32) V!28855 V!28855 (_ BitVec 32) Int) Unit!30254)

(assert (=> b!889800 (= lt!402318 (lemmaValidKeyInArrayIsInListMap!205 (_keys!9891 thiss!1181) (_values!5167 thiss!1181) (mask!25657 thiss!1181) (extraKeys!4876 thiss!1181) (zeroValue!4980 thiss!1181) (minValue!4980 thiss!1181) (index!37248 lt!402320) (defaultEntry!5182 thiss!1181)))))

(assert (=> b!889800 call!39535))

(declare-fun lt!402329 () Unit!30254)

(assert (=> b!889800 (= lt!402329 lt!402318)))

(assert (= (and d!110427 c!94197) b!889794))

(assert (= (and d!110427 (not c!94197)) b!889791))

(assert (= (and b!889791 c!94193) b!889798))

(assert (= (and b!889791 (not c!94193)) b!889797))

(assert (= (and b!889797 c!94195) b!889800))

(assert (= (and b!889797 (not c!94195)) b!889795))

(assert (= (and b!889795 c!94194) b!889793))

(assert (= (and b!889795 (not c!94194)) b!889796))

(assert (= (and b!889793 c!94196) b!889799))

(assert (= (and b!889793 (not c!94196)) b!889792))

(assert (= (or b!889800 b!889799) bm!39533))

(assert (= (or b!889800 b!889795) bm!39534))

(assert (= (or b!889800 b!889795) bm!39532))

(assert (=> d!110427 m!829297))

(assert (=> d!110427 m!829297))

(declare-fun m!829353 () Bool)

(assert (=> d!110427 m!829353))

(assert (=> d!110427 m!829305))

(declare-fun m!829355 () Bool)

(assert (=> b!889800 m!829355))

(declare-fun m!829357 () Bool)

(assert (=> b!889800 m!829357))

(declare-fun m!829359 () Bool)

(assert (=> b!889797 m!829359))

(declare-fun m!829361 () Bool)

(assert (=> bm!39533 m!829361))

(declare-fun m!829363 () Bool)

(assert (=> bm!39534 m!829363))

(declare-fun m!829365 () Bool)

(assert (=> bm!39532 m!829365))

(declare-fun m!829367 () Bool)

(assert (=> bm!39532 m!829367))

(declare-fun m!829369 () Bool)

(assert (=> b!889793 m!829369))

(assert (=> b!889793 m!829359))

(declare-fun m!829371 () Bool)

(assert (=> b!889793 m!829371))

(declare-fun m!829373 () Bool)

(assert (=> b!889793 m!829373))

(declare-fun m!829375 () Bool)

(assert (=> b!889793 m!829375))

(declare-fun m!829377 () Bool)

(assert (=> b!889793 m!829377))

(assert (=> b!889717 d!110427))

(declare-fun d!110429 () Bool)

(declare-fun isEmpty!683 (Option!446) Bool)

(assert (=> d!110429 (= (isDefined!320 (getValueByKey!440 (toList!5295 (map!12107 thiss!1181)) key!785)) (not (isEmpty!683 (getValueByKey!440 (toList!5295 (map!12107 thiss!1181)) key!785))))))

(declare-fun bs!24946 () Bool)

(assert (= bs!24946 d!110429))

(assert (=> bs!24946 m!829299))

(declare-fun m!829379 () Bool)

(assert (=> bs!24946 m!829379))

(assert (=> b!889713 d!110429))

(declare-fun b!889811 () Bool)

(declare-fun e!495971 () Option!446)

(assert (=> b!889811 (= e!495971 (getValueByKey!440 (t!24935 (toList!5295 (map!12107 thiss!1181))) key!785))))

(declare-fun b!889810 () Bool)

(declare-fun e!495970 () Option!446)

(assert (=> b!889810 (= e!495970 e!495971)))

(declare-fun c!94203 () Bool)

(assert (=> b!889810 (= c!94203 (and ((_ is Cons!17640) (toList!5295 (map!12107 thiss!1181))) (not (= (_1!5941 (h!18777 (toList!5295 (map!12107 thiss!1181)))) key!785))))))

(declare-fun d!110431 () Bool)

(declare-fun c!94202 () Bool)

(assert (=> d!110431 (= c!94202 (and ((_ is Cons!17640) (toList!5295 (map!12107 thiss!1181))) (= (_1!5941 (h!18777 (toList!5295 (map!12107 thiss!1181)))) key!785)))))

(assert (=> d!110431 (= (getValueByKey!440 (toList!5295 (map!12107 thiss!1181)) key!785) e!495970)))

(declare-fun b!889812 () Bool)

(assert (=> b!889812 (= e!495971 None!444)))

(declare-fun b!889809 () Bool)

(assert (=> b!889809 (= e!495970 (Some!445 (_2!5941 (h!18777 (toList!5295 (map!12107 thiss!1181))))))))

(assert (= (and d!110431 c!94202) b!889809))

(assert (= (and d!110431 (not c!94202)) b!889810))

(assert (= (and b!889810 c!94203) b!889811))

(assert (= (and b!889810 (not c!94203)) b!889812))

(declare-fun m!829381 () Bool)

(assert (=> b!889811 m!829381))

(assert (=> b!889713 d!110431))

(declare-fun d!110433 () Bool)

(assert (=> d!110433 (= (map!12107 thiss!1181) (getCurrentListMap!2575 (_keys!9891 thiss!1181) (_values!5167 thiss!1181) (mask!25657 thiss!1181) (extraKeys!4876 thiss!1181) (zeroValue!4980 thiss!1181) (minValue!4980 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5182 thiss!1181)))))

(declare-fun bs!24947 () Bool)

(assert (= bs!24947 d!110433))

(assert (=> bs!24947 m!829363))

(assert (=> b!889713 d!110433))

(declare-fun d!110435 () Bool)

(assert (=> d!110435 (= (array_inv!19654 (_keys!9891 thiss!1181)) (bvsge (size!25371 (_keys!9891 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!889715 d!110435))

(declare-fun d!110437 () Bool)

(assert (=> d!110437 (= (array_inv!19655 (_values!5167 thiss!1181)) (bvsge (size!25372 (_values!5167 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!889715 d!110437))

(declare-fun mapIsEmpty!28425 () Bool)

(declare-fun mapRes!28425 () Bool)

(assert (=> mapIsEmpty!28425 mapRes!28425))

(declare-fun condMapEmpty!28425 () Bool)

(declare-fun mapDefault!28425 () ValueCell!8477)

(assert (=> mapNonEmpty!28416 (= condMapEmpty!28425 (= mapRest!28416 ((as const (Array (_ BitVec 32) ValueCell!8477)) mapDefault!28425)))))

(declare-fun e!495977 () Bool)

(assert (=> mapNonEmpty!28416 (= tp!54722 (and e!495977 mapRes!28425))))

(declare-fun b!889820 () Bool)

(assert (=> b!889820 (= e!495977 tp_is_empty!17917)))

(declare-fun b!889819 () Bool)

(declare-fun e!495976 () Bool)

(assert (=> b!889819 (= e!495976 tp_is_empty!17917)))

(declare-fun mapNonEmpty!28425 () Bool)

(declare-fun tp!54738 () Bool)

(assert (=> mapNonEmpty!28425 (= mapRes!28425 (and tp!54738 e!495976))))

(declare-fun mapValue!28425 () ValueCell!8477)

(declare-fun mapKey!28425 () (_ BitVec 32))

(declare-fun mapRest!28425 () (Array (_ BitVec 32) ValueCell!8477))

(assert (=> mapNonEmpty!28425 (= mapRest!28416 (store mapRest!28425 mapKey!28425 mapValue!28425))))

(assert (= (and mapNonEmpty!28416 condMapEmpty!28425) mapIsEmpty!28425))

(assert (= (and mapNonEmpty!28416 (not condMapEmpty!28425)) mapNonEmpty!28425))

(assert (= (and mapNonEmpty!28425 ((_ is ValueCellFull!8477) mapValue!28425)) b!889819))

(assert (= (and mapNonEmpty!28416 ((_ is ValueCellFull!8477) mapDefault!28425)) b!889820))

(declare-fun m!829383 () Bool)

(assert (=> mapNonEmpty!28425 m!829383))

(check-sat (not bm!39533) (not d!110425) tp_is_empty!17917 (not b!889769) (not b!889768) (not b!889800) (not b!889811) (not b_next!15589) b_and!25839 (not bm!39532) (not d!110433) (not b!889770) (not b!889797) (not bm!39534) (not b!889793) (not d!110429) (not mapNonEmpty!28425) (not d!110427))
(check-sat b_and!25839 (not b_next!15589))
