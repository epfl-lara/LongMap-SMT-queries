; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12516 () Bool)

(assert start!12516)

(declare-fun b!107279 () Bool)

(declare-fun b_free!2533 () Bool)

(declare-fun b_next!2533 () Bool)

(assert (=> b!107279 (= b_free!2533 (not b_next!2533))))

(declare-fun tp!9929 () Bool)

(declare-fun b_and!6605 () Bool)

(assert (=> b!107279 (= tp!9929 b_and!6605)))

(declare-fun b!107292 () Bool)

(declare-fun b_free!2535 () Bool)

(declare-fun b_next!2535 () Bool)

(assert (=> b!107292 (= b_free!2535 (not b_next!2535))))

(declare-fun tp!9932 () Bool)

(declare-fun b_and!6607 () Bool)

(assert (=> b!107292 (= tp!9932 b_and!6607)))

(declare-fun b!107278 () Bool)

(declare-datatypes ((Unit!3290 0))(
  ( (Unit!3291) )
))
(declare-fun e!69791 () Unit!3290)

(declare-fun Unit!3292 () Unit!3290)

(assert (=> b!107278 (= e!69791 Unit!3292)))

(declare-fun mapIsEmpty!3949 () Bool)

(declare-fun mapRes!3950 () Bool)

(assert (=> mapIsEmpty!3949 mapRes!3950))

(declare-fun mapNonEmpty!3949 () Bool)

(declare-fun mapRes!3949 () Bool)

(declare-fun tp!9930 () Bool)

(declare-fun e!69798 () Bool)

(assert (=> mapNonEmpty!3949 (= mapRes!3949 (and tp!9930 e!69798))))

(declare-fun mapKey!3949 () (_ BitVec 32))

(declare-datatypes ((V!3225 0))(
  ( (V!3226 (val!1386 Int)) )
))
(declare-datatypes ((array!4345 0))(
  ( (array!4346 (arr!2060 (Array (_ BitVec 32) (_ BitVec 64))) (size!2316 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!998 0))(
  ( (ValueCellFull!998 (v!2907 V!3225)) (EmptyCell!998) )
))
(declare-datatypes ((array!4347 0))(
  ( (array!4348 (arr!2061 (Array (_ BitVec 32) ValueCell!998)) (size!2317 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!904 0))(
  ( (LongMapFixedSize!905 (defaultEntry!2602 Int) (mask!6758 (_ BitVec 32)) (extraKeys!2403 (_ BitVec 32)) (zeroValue!2475 V!3225) (minValue!2475 V!3225) (_size!501 (_ BitVec 32)) (_keys!4312 array!4345) (_values!2585 array!4347) (_vacant!501 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!904)

(declare-fun mapValue!3949 () ValueCell!998)

(declare-fun mapRest!3949 () (Array (_ BitVec 32) ValueCell!998))

(assert (=> mapNonEmpty!3949 (= (arr!2061 (_values!2585 newMap!16)) (store mapRest!3949 mapKey!3949 mapValue!3949))))

(declare-datatypes ((Cell!706 0))(
  ( (Cell!707 (v!2908 LongMapFixedSize!904)) )
))
(declare-datatypes ((LongMap!706 0))(
  ( (LongMap!707 (underlying!364 Cell!706)) )
))
(declare-fun thiss!992 () LongMap!706)

(declare-fun tp_is_empty!2683 () Bool)

(declare-fun e!69802 () Bool)

(declare-fun e!69789 () Bool)

(declare-fun array_inv!1273 (array!4345) Bool)

(declare-fun array_inv!1274 (array!4347) Bool)

(assert (=> b!107279 (= e!69789 (and tp!9929 tp_is_empty!2683 (array_inv!1273 (_keys!4312 (v!2908 (underlying!364 thiss!992)))) (array_inv!1274 (_values!2585 (v!2908 (underlying!364 thiss!992)))) e!69802))))

(declare-fun b!107280 () Bool)

(declare-fun e!69794 () Bool)

(declare-fun e!69800 () Bool)

(assert (=> b!107280 (= e!69794 e!69800)))

(declare-fun res!53277 () Bool)

(assert (=> b!107280 (=> (not res!53277) (not e!69800))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!107280 (= res!53277 (and (not (= (select (arr!2060 (_keys!4312 (v!2908 (underlying!364 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2060 (_keys!4312 (v!2908 (underlying!364 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!54983 () V!3225)

(declare-fun get!1341 (ValueCell!998 V!3225) V!3225)

(declare-fun dynLambda!385 (Int (_ BitVec 64)) V!3225)

(assert (=> b!107280 (= lt!54983 (get!1341 (select (arr!2061 (_values!2585 (v!2908 (underlying!364 thiss!992)))) from!355) (dynLambda!385 (defaultEntry!2602 (v!2908 (underlying!364 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!107281 () Bool)

(declare-fun e!69799 () Bool)

(assert (=> b!107281 (= e!69799 e!69789)))

(declare-fun b!107282 () Bool)

(declare-fun e!69805 () Bool)

(assert (=> b!107282 (= e!69805 e!69799)))

(declare-fun b!107283 () Bool)

(declare-fun e!69797 () Bool)

(assert (=> b!107283 (= e!69797 tp_is_empty!2683)))

(declare-fun b!107284 () Bool)

(declare-fun e!69806 () Bool)

(assert (=> b!107284 (= e!69806 (or (not (= (size!2317 (_values!2585 (v!2908 (underlying!364 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6758 (v!2908 (underlying!364 thiss!992)))))) (not (= (size!2316 (_keys!4312 (v!2908 (underlying!364 thiss!992)))) (size!2317 (_values!2585 (v!2908 (underlying!364 thiss!992)))))) (bvsge (mask!6758 (v!2908 (underlying!364 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!107285 () Bool)

(assert (=> b!107285 (= e!69798 tp_is_empty!2683)))

(declare-fun b!107286 () Bool)

(declare-fun e!69796 () Bool)

(assert (=> b!107286 (= e!69796 tp_is_empty!2683)))

(declare-fun b!107287 () Bool)

(assert (=> b!107287 (= e!69802 (and e!69797 mapRes!3950))))

(declare-fun condMapEmpty!3949 () Bool)

(declare-fun mapDefault!3950 () ValueCell!998)

(assert (=> b!107287 (= condMapEmpty!3949 (= (arr!2061 (_values!2585 (v!2908 (underlying!364 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!998)) mapDefault!3950)))))

(declare-fun b!107288 () Bool)

(declare-fun e!69804 () Bool)

(assert (=> b!107288 (= e!69804 e!69794)))

(declare-fun res!53279 () Bool)

(assert (=> b!107288 (=> (not res!53279) (not e!69794))))

(declare-datatypes ((tuple2!2368 0))(
  ( (tuple2!2369 (_1!1195 (_ BitVec 64)) (_2!1195 V!3225)) )
))
(declare-datatypes ((List!1599 0))(
  ( (Nil!1596) (Cons!1595 (h!2193 tuple2!2368) (t!5695 List!1599)) )
))
(declare-datatypes ((ListLongMap!1537 0))(
  ( (ListLongMap!1538 (toList!784 List!1599)) )
))
(declare-fun lt!54986 () ListLongMap!1537)

(declare-fun lt!54989 () ListLongMap!1537)

(assert (=> b!107288 (= res!53279 (= lt!54986 lt!54989))))

(declare-fun map!1286 (LongMapFixedSize!904) ListLongMap!1537)

(assert (=> b!107288 (= lt!54989 (map!1286 newMap!16))))

(declare-fun getCurrentListMap!470 (array!4345 array!4347 (_ BitVec 32) (_ BitVec 32) V!3225 V!3225 (_ BitVec 32) Int) ListLongMap!1537)

(assert (=> b!107288 (= lt!54986 (getCurrentListMap!470 (_keys!4312 (v!2908 (underlying!364 thiss!992))) (_values!2585 (v!2908 (underlying!364 thiss!992))) (mask!6758 (v!2908 (underlying!364 thiss!992))) (extraKeys!2403 (v!2908 (underlying!364 thiss!992))) (zeroValue!2475 (v!2908 (underlying!364 thiss!992))) (minValue!2475 (v!2908 (underlying!364 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2602 (v!2908 (underlying!364 thiss!992)))))))

(declare-fun mapIsEmpty!3950 () Bool)

(assert (=> mapIsEmpty!3950 mapRes!3949))

(declare-fun b!107289 () Bool)

(declare-fun res!53274 () Bool)

(assert (=> b!107289 (=> (not res!53274) (not e!69804))))

(declare-fun valid!425 (LongMapFixedSize!904) Bool)

(assert (=> b!107289 (= res!53274 (valid!425 newMap!16))))

(declare-fun b!107290 () Bool)

(declare-fun res!53275 () Bool)

(assert (=> b!107290 (=> (not res!53275) (not e!69804))))

(assert (=> b!107290 (= res!53275 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2316 (_keys!4312 (v!2908 (underlying!364 thiss!992)))))))))

(declare-fun b!107291 () Bool)

(declare-fun e!69793 () Bool)

(assert (=> b!107291 (= e!69793 (not e!69806))))

(declare-fun res!53280 () Bool)

(assert (=> b!107291 (=> res!53280 e!69806)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!107291 (= res!53280 (not (validMask!0 (mask!6758 (v!2908 (underlying!364 thiss!992))))))))

(declare-fun lt!54993 () ListLongMap!1537)

(declare-fun lt!54988 () tuple2!2368)

(declare-fun lt!54991 () tuple2!2368)

(declare-fun +!140 (ListLongMap!1537 tuple2!2368) ListLongMap!1537)

(assert (=> b!107291 (= (+!140 (+!140 lt!54993 lt!54988) lt!54991) (+!140 (+!140 lt!54993 lt!54991) lt!54988))))

(assert (=> b!107291 (= lt!54991 (tuple2!2369 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2475 (v!2908 (underlying!364 thiss!992)))))))

(assert (=> b!107291 (= lt!54988 (tuple2!2369 (select (arr!2060 (_keys!4312 (v!2908 (underlying!364 thiss!992)))) from!355) lt!54983))))

(declare-fun lt!54985 () Unit!3290)

(declare-fun addCommutativeForDiffKeys!53 (ListLongMap!1537 (_ BitVec 64) V!3225 (_ BitVec 64) V!3225) Unit!3290)

(assert (=> b!107291 (= lt!54985 (addCommutativeForDiffKeys!53 lt!54993 (select (arr!2060 (_keys!4312 (v!2908 (underlying!364 thiss!992)))) from!355) lt!54983 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2475 (v!2908 (underlying!364 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!107 (array!4345 array!4347 (_ BitVec 32) (_ BitVec 32) V!3225 V!3225 (_ BitVec 32) Int) ListLongMap!1537)

(assert (=> b!107291 (= lt!54993 (getCurrentListMapNoExtraKeys!107 (_keys!4312 (v!2908 (underlying!364 thiss!992))) (_values!2585 (v!2908 (underlying!364 thiss!992))) (mask!6758 (v!2908 (underlying!364 thiss!992))) (extraKeys!2403 (v!2908 (underlying!364 thiss!992))) (zeroValue!2475 (v!2908 (underlying!364 thiss!992))) (minValue!2475 (v!2908 (underlying!364 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2602 (v!2908 (underlying!364 thiss!992)))))))

(declare-fun e!69803 () Bool)

(declare-fun e!69801 () Bool)

(assert (=> b!107292 (= e!69801 (and tp!9932 tp_is_empty!2683 (array_inv!1273 (_keys!4312 newMap!16)) (array_inv!1274 (_values!2585 newMap!16)) e!69803))))

(declare-fun b!107293 () Bool)

(assert (=> b!107293 (= e!69803 (and e!69796 mapRes!3949))))

(declare-fun condMapEmpty!3950 () Bool)

(declare-fun mapDefault!3949 () ValueCell!998)

(assert (=> b!107293 (= condMapEmpty!3950 (= (arr!2061 (_values!2585 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!998)) mapDefault!3949)))))

(declare-fun b!107294 () Bool)

(assert (=> b!107294 (= e!69800 e!69793)))

(declare-fun res!53281 () Bool)

(assert (=> b!107294 (=> (not res!53281) (not e!69793))))

(declare-datatypes ((tuple2!2370 0))(
  ( (tuple2!2371 (_1!1196 Bool) (_2!1196 LongMapFixedSize!904)) )
))
(declare-fun lt!54984 () tuple2!2370)

(assert (=> b!107294 (= res!53281 (and (_1!1196 lt!54984) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!54990 () Unit!3290)

(assert (=> b!107294 (= lt!54990 e!69791)))

(declare-fun c!18827 () Bool)

(declare-fun contains!818 (ListLongMap!1537 (_ BitVec 64)) Bool)

(assert (=> b!107294 (= c!18827 (contains!818 lt!54989 (select (arr!2060 (_keys!4312 (v!2908 (underlying!364 thiss!992)))) from!355)))))

(declare-fun update!161 (LongMapFixedSize!904 (_ BitVec 64) V!3225) tuple2!2370)

(assert (=> b!107294 (= lt!54984 (update!161 newMap!16 (select (arr!2060 (_keys!4312 (v!2908 (underlying!364 thiss!992)))) from!355) lt!54983))))

(declare-fun b!107295 () Bool)

(declare-fun Unit!3293 () Unit!3290)

(assert (=> b!107295 (= e!69791 Unit!3293)))

(declare-fun lt!54994 () Unit!3290)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!100 (array!4345 array!4347 (_ BitVec 32) (_ BitVec 32) V!3225 V!3225 (_ BitVec 64) (_ BitVec 32) Int) Unit!3290)

(assert (=> b!107295 (= lt!54994 (lemmaListMapContainsThenArrayContainsFrom!100 (_keys!4312 (v!2908 (underlying!364 thiss!992))) (_values!2585 (v!2908 (underlying!364 thiss!992))) (mask!6758 (v!2908 (underlying!364 thiss!992))) (extraKeys!2403 (v!2908 (underlying!364 thiss!992))) (zeroValue!2475 (v!2908 (underlying!364 thiss!992))) (minValue!2475 (v!2908 (underlying!364 thiss!992))) (select (arr!2060 (_keys!4312 (v!2908 (underlying!364 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2602 (v!2908 (underlying!364 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!107295 (arrayContainsKey!0 (_keys!4312 (v!2908 (underlying!364 thiss!992))) (select (arr!2060 (_keys!4312 (v!2908 (underlying!364 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!54987 () Unit!3290)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4345 (_ BitVec 32) (_ BitVec 32)) Unit!3290)

(assert (=> b!107295 (= lt!54987 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4312 (v!2908 (underlying!364 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1600 0))(
  ( (Nil!1597) (Cons!1596 (h!2194 (_ BitVec 64)) (t!5696 List!1600)) )
))
(declare-fun arrayNoDuplicates!0 (array!4345 (_ BitVec 32) List!1600) Bool)

(assert (=> b!107295 (arrayNoDuplicates!0 (_keys!4312 (v!2908 (underlying!364 thiss!992))) from!355 Nil!1597)))

(declare-fun lt!54992 () Unit!3290)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4345 (_ BitVec 32) (_ BitVec 64) List!1600) Unit!3290)

(assert (=> b!107295 (= lt!54992 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4312 (v!2908 (underlying!364 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2060 (_keys!4312 (v!2908 (underlying!364 thiss!992)))) from!355) (Cons!1596 (select (arr!2060 (_keys!4312 (v!2908 (underlying!364 thiss!992)))) from!355) Nil!1597)))))

(assert (=> b!107295 false))

(declare-fun b!107296 () Bool)

(declare-fun res!53278 () Bool)

(assert (=> b!107296 (=> (not res!53278) (not e!69804))))

(assert (=> b!107296 (= res!53278 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6758 newMap!16)) (_size!501 (v!2908 (underlying!364 thiss!992)))))))

(declare-fun b!107297 () Bool)

(declare-fun e!69795 () Bool)

(assert (=> b!107297 (= e!69795 tp_is_empty!2683)))

(declare-fun res!53276 () Bool)

(assert (=> start!12516 (=> (not res!53276) (not e!69804))))

(declare-fun valid!426 (LongMap!706) Bool)

(assert (=> start!12516 (= res!53276 (valid!426 thiss!992))))

(assert (=> start!12516 e!69804))

(assert (=> start!12516 e!69805))

(assert (=> start!12516 true))

(assert (=> start!12516 e!69801))

(declare-fun mapNonEmpty!3950 () Bool)

(declare-fun tp!9931 () Bool)

(assert (=> mapNonEmpty!3950 (= mapRes!3950 (and tp!9931 e!69795))))

(declare-fun mapKey!3950 () (_ BitVec 32))

(declare-fun mapRest!3950 () (Array (_ BitVec 32) ValueCell!998))

(declare-fun mapValue!3950 () ValueCell!998)

(assert (=> mapNonEmpty!3950 (= (arr!2061 (_values!2585 (v!2908 (underlying!364 thiss!992)))) (store mapRest!3950 mapKey!3950 mapValue!3950))))

(assert (= (and start!12516 res!53276) b!107290))

(assert (= (and b!107290 res!53275) b!107289))

(assert (= (and b!107289 res!53274) b!107296))

(assert (= (and b!107296 res!53278) b!107288))

(assert (= (and b!107288 res!53279) b!107280))

(assert (= (and b!107280 res!53277) b!107294))

(assert (= (and b!107294 c!18827) b!107295))

(assert (= (and b!107294 (not c!18827)) b!107278))

(assert (= (and b!107294 res!53281) b!107291))

(assert (= (and b!107291 (not res!53280)) b!107284))

(assert (= (and b!107287 condMapEmpty!3949) mapIsEmpty!3949))

(assert (= (and b!107287 (not condMapEmpty!3949)) mapNonEmpty!3950))

(get-info :version)

(assert (= (and mapNonEmpty!3950 ((_ is ValueCellFull!998) mapValue!3950)) b!107297))

(assert (= (and b!107287 ((_ is ValueCellFull!998) mapDefault!3950)) b!107283))

(assert (= b!107279 b!107287))

(assert (= b!107281 b!107279))

(assert (= b!107282 b!107281))

(assert (= start!12516 b!107282))

(assert (= (and b!107293 condMapEmpty!3950) mapIsEmpty!3950))

(assert (= (and b!107293 (not condMapEmpty!3950)) mapNonEmpty!3949))

(assert (= (and mapNonEmpty!3949 ((_ is ValueCellFull!998) mapValue!3949)) b!107285))

(assert (= (and b!107293 ((_ is ValueCellFull!998) mapDefault!3949)) b!107286))

(assert (= b!107292 b!107293))

(assert (= start!12516 b!107292))

(declare-fun b_lambda!4809 () Bool)

(assert (=> (not b_lambda!4809) (not b!107280)))

(declare-fun t!5692 () Bool)

(declare-fun tb!2061 () Bool)

(assert (=> (and b!107279 (= (defaultEntry!2602 (v!2908 (underlying!364 thiss!992))) (defaultEntry!2602 (v!2908 (underlying!364 thiss!992)))) t!5692) tb!2061))

(declare-fun result!3467 () Bool)

(assert (=> tb!2061 (= result!3467 tp_is_empty!2683)))

(assert (=> b!107280 t!5692))

(declare-fun b_and!6609 () Bool)

(assert (= b_and!6605 (and (=> t!5692 result!3467) b_and!6609)))

(declare-fun tb!2063 () Bool)

(declare-fun t!5694 () Bool)

(assert (=> (and b!107292 (= (defaultEntry!2602 newMap!16) (defaultEntry!2602 (v!2908 (underlying!364 thiss!992)))) t!5694) tb!2063))

(declare-fun result!3471 () Bool)

(assert (= result!3471 result!3467))

(assert (=> b!107280 t!5694))

(declare-fun b_and!6611 () Bool)

(assert (= b_and!6607 (and (=> t!5694 result!3471) b_and!6611)))

(declare-fun m!120583 () Bool)

(assert (=> mapNonEmpty!3950 m!120583))

(declare-fun m!120585 () Bool)

(assert (=> b!107288 m!120585))

(declare-fun m!120587 () Bool)

(assert (=> b!107288 m!120587))

(declare-fun m!120589 () Bool)

(assert (=> b!107280 m!120589))

(declare-fun m!120591 () Bool)

(assert (=> b!107280 m!120591))

(declare-fun m!120593 () Bool)

(assert (=> b!107280 m!120593))

(assert (=> b!107280 m!120591))

(assert (=> b!107280 m!120593))

(declare-fun m!120595 () Bool)

(assert (=> b!107280 m!120595))

(declare-fun m!120597 () Bool)

(assert (=> b!107292 m!120597))

(declare-fun m!120599 () Bool)

(assert (=> b!107292 m!120599))

(assert (=> b!107294 m!120589))

(assert (=> b!107294 m!120589))

(declare-fun m!120601 () Bool)

(assert (=> b!107294 m!120601))

(assert (=> b!107294 m!120589))

(declare-fun m!120603 () Bool)

(assert (=> b!107294 m!120603))

(declare-fun m!120605 () Bool)

(assert (=> mapNonEmpty!3949 m!120605))

(declare-fun m!120607 () Bool)

(assert (=> b!107289 m!120607))

(declare-fun m!120609 () Bool)

(assert (=> start!12516 m!120609))

(declare-fun m!120611 () Bool)

(assert (=> b!107291 m!120611))

(assert (=> b!107291 m!120589))

(declare-fun m!120613 () Bool)

(assert (=> b!107291 m!120613))

(declare-fun m!120615 () Bool)

(assert (=> b!107291 m!120615))

(assert (=> b!107291 m!120589))

(assert (=> b!107291 m!120611))

(declare-fun m!120617 () Bool)

(assert (=> b!107291 m!120617))

(declare-fun m!120619 () Bool)

(assert (=> b!107291 m!120619))

(declare-fun m!120621 () Bool)

(assert (=> b!107291 m!120621))

(assert (=> b!107291 m!120619))

(declare-fun m!120623 () Bool)

(assert (=> b!107291 m!120623))

(declare-fun m!120625 () Bool)

(assert (=> b!107295 m!120625))

(declare-fun m!120627 () Bool)

(assert (=> b!107295 m!120627))

(assert (=> b!107295 m!120589))

(declare-fun m!120629 () Bool)

(assert (=> b!107295 m!120629))

(assert (=> b!107295 m!120589))

(assert (=> b!107295 m!120589))

(declare-fun m!120631 () Bool)

(assert (=> b!107295 m!120631))

(assert (=> b!107295 m!120589))

(declare-fun m!120633 () Bool)

(assert (=> b!107295 m!120633))

(declare-fun m!120635 () Bool)

(assert (=> b!107279 m!120635))

(declare-fun m!120637 () Bool)

(assert (=> b!107279 m!120637))

(check-sat (not b!107291) (not mapNonEmpty!3949) (not b_lambda!4809) (not b!107295) (not mapNonEmpty!3950) (not b!107288) b_and!6611 (not b!107279) (not b_next!2535) (not b_next!2533) (not b!107280) (not start!12516) (not b!107294) tp_is_empty!2683 b_and!6609 (not b!107289) (not b!107292))
(check-sat b_and!6609 b_and!6611 (not b_next!2533) (not b_next!2535))
