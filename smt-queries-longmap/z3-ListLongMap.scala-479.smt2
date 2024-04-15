; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10026 () Bool)

(assert start!10026)

(declare-fun b!75774 () Bool)

(declare-fun b_free!2137 () Bool)

(declare-fun b_next!2137 () Bool)

(assert (=> b!75774 (= b_free!2137 (not b_next!2137))))

(declare-fun tp!8601 () Bool)

(declare-fun b_and!4621 () Bool)

(assert (=> b!75774 (= tp!8601 b_and!4621)))

(declare-fun b!75783 () Bool)

(declare-fun b_free!2139 () Bool)

(declare-fun b_next!2139 () Bool)

(assert (=> b!75783 (= b_free!2139 (not b_next!2139))))

(declare-fun tp!8603 () Bool)

(declare-fun b_and!4623 () Bool)

(assert (=> b!75783 (= tp!8603 b_and!4623)))

(declare-fun b!75766 () Bool)

(declare-fun res!39936 () Bool)

(declare-fun e!49498 () Bool)

(assert (=> b!75766 (=> res!39936 e!49498)))

(declare-datatypes ((V!2961 0))(
  ( (V!2962 (val!1287 Int)) )
))
(declare-datatypes ((array!3899 0))(
  ( (array!3900 (arr!1858 (Array (_ BitVec 32) (_ BitVec 64))) (size!2099 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!899 0))(
  ( (ValueCellFull!899 (v!2551 V!2961)) (EmptyCell!899) )
))
(declare-datatypes ((array!3901 0))(
  ( (array!3902 (arr!1859 (Array (_ BitVec 32) ValueCell!899)) (size!2100 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!706 0))(
  ( (LongMapFixedSize!707 (defaultEntry!2246 Int) (mask!6228 (_ BitVec 32)) (extraKeys!2099 (_ BitVec 32)) (zeroValue!2145 V!2961) (minValue!2145 V!2961) (_size!402 (_ BitVec 32)) (_keys!3903 array!3899) (_values!2229 array!3901) (_vacant!402 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!502 0))(
  ( (Cell!503 (v!2552 LongMapFixedSize!706)) )
))
(declare-datatypes ((LongMap!502 0))(
  ( (LongMap!503 (underlying!262 Cell!502)) )
))
(declare-fun thiss!992 () LongMap!502)

(assert (=> b!75766 (= res!39936 (or (not (= (size!2100 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6228 (v!2552 (underlying!262 thiss!992)))))) (not (= (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (size!2100 (_values!2229 (v!2552 (underlying!262 thiss!992)))))) (bvslt (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun res!39939 () Bool)

(declare-fun e!49490 () Bool)

(assert (=> start!10026 (=> (not res!39939) (not e!49490))))

(declare-fun valid!306 (LongMap!502) Bool)

(assert (=> start!10026 (= res!39939 (valid!306 thiss!992))))

(assert (=> start!10026 e!49490))

(declare-fun e!49494 () Bool)

(assert (=> start!10026 e!49494))

(assert (=> start!10026 true))

(declare-fun e!49484 () Bool)

(assert (=> start!10026 e!49484))

(declare-fun mapNonEmpty!3215 () Bool)

(declare-fun mapRes!3215 () Bool)

(declare-fun tp!8604 () Bool)

(declare-fun e!49496 () Bool)

(assert (=> mapNonEmpty!3215 (= mapRes!3215 (and tp!8604 e!49496))))

(declare-fun mapValue!3215 () ValueCell!899)

(declare-fun mapRest!3216 () (Array (_ BitVec 32) ValueCell!899))

(declare-fun mapKey!3216 () (_ BitVec 32))

(assert (=> mapNonEmpty!3215 (= (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (store mapRest!3216 mapKey!3216 mapValue!3215))))

(declare-fun b!75767 () Bool)

(declare-fun res!39940 () Bool)

(assert (=> b!75767 (=> res!39940 e!49498)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3899 (_ BitVec 32)) Bool)

(assert (=> b!75767 (= res!39940 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun b!75768 () Bool)

(declare-fun e!49500 () Bool)

(declare-fun e!49485 () Bool)

(assert (=> b!75768 (= e!49500 (and e!49485 mapRes!3215))))

(declare-fun condMapEmpty!3216 () Bool)

(declare-fun mapDefault!3215 () ValueCell!899)

(assert (=> b!75768 (= condMapEmpty!3216 (= (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!899)) mapDefault!3215)))))

(declare-fun b!75769 () Bool)

(declare-fun e!49501 () Bool)

(declare-fun tp_is_empty!2485 () Bool)

(assert (=> b!75769 (= e!49501 tp_is_empty!2485)))

(declare-fun b!75770 () Bool)

(declare-fun e!49497 () Bool)

(declare-fun mapRes!3216 () Bool)

(assert (=> b!75770 (= e!49497 (and e!49501 mapRes!3216))))

(declare-fun condMapEmpty!3215 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!706)

(declare-fun mapDefault!3216 () ValueCell!899)

(assert (=> b!75770 (= condMapEmpty!3215 (= (arr!1859 (_values!2229 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!899)) mapDefault!3216)))))

(declare-fun b!75771 () Bool)

(declare-datatypes ((List!1493 0))(
  ( (Nil!1490) (Cons!1489 (h!2077 (_ BitVec 64)) (t!5078 List!1493)) )
))
(declare-fun arrayNoDuplicates!0 (array!3899 (_ BitVec 32) List!1493) Bool)

(assert (=> b!75771 (= e!49498 (arrayNoDuplicates!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000000 Nil!1490))))

(declare-fun b!75772 () Bool)

(declare-fun e!49499 () Bool)

(assert (=> b!75772 (= e!49499 tp_is_empty!2485)))

(declare-fun b!75773 () Bool)

(declare-fun res!39941 () Bool)

(assert (=> b!75773 (=> (not res!39941) (not e!49490))))

(declare-fun valid!307 (LongMapFixedSize!706) Bool)

(assert (=> b!75773 (= res!39941 (valid!307 newMap!16))))

(declare-fun e!49487 () Bool)

(declare-fun array_inv!1165 (array!3899) Bool)

(declare-fun array_inv!1166 (array!3901) Bool)

(assert (=> b!75774 (= e!49487 (and tp!8601 tp_is_empty!2485 (array_inv!1165 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (array_inv!1166 (_values!2229 (v!2552 (underlying!262 thiss!992)))) e!49500))))

(declare-fun mapIsEmpty!3215 () Bool)

(assert (=> mapIsEmpty!3215 mapRes!3216))

(declare-fun b!75775 () Bool)

(assert (=> b!75775 (= e!49485 tp_is_empty!2485)))

(declare-fun b!75776 () Bool)

(declare-datatypes ((Unit!2179 0))(
  ( (Unit!2180) )
))
(declare-fun e!49489 () Unit!2179)

(declare-fun Unit!2181 () Unit!2179)

(assert (=> b!75776 (= e!49489 Unit!2181)))

(declare-fun b!75777 () Bool)

(declare-fun res!39934 () Bool)

(assert (=> b!75777 (=> (not res!39934) (not e!49490))))

(assert (=> b!75777 (= res!39934 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6228 newMap!16)) (_size!402 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun b!75778 () Bool)

(assert (=> b!75778 (= e!49496 tp_is_empty!2485)))

(declare-fun b!75779 () Bool)

(declare-fun e!49493 () Bool)

(assert (=> b!75779 (= e!49490 e!49493)))

(declare-fun res!39937 () Bool)

(assert (=> b!75779 (=> (not res!39937) (not e!49493))))

(declare-datatypes ((tuple2!2138 0))(
  ( (tuple2!2139 (_1!1080 (_ BitVec 64)) (_2!1080 V!2961)) )
))
(declare-datatypes ((List!1494 0))(
  ( (Nil!1491) (Cons!1490 (h!2078 tuple2!2138) (t!5079 List!1494)) )
))
(declare-datatypes ((ListLongMap!1415 0))(
  ( (ListLongMap!1416 (toList!723 List!1494)) )
))
(declare-fun lt!34349 () ListLongMap!1415)

(declare-fun lt!34347 () ListLongMap!1415)

(assert (=> b!75779 (= res!39937 (= lt!34349 lt!34347))))

(declare-fun map!1159 (LongMapFixedSize!706) ListLongMap!1415)

(assert (=> b!75779 (= lt!34347 (map!1159 newMap!16))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!415 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 32) Int) ListLongMap!1415)

(assert (=> b!75779 (= lt!34349 (getCurrentListMap!415 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun b!75780 () Bool)

(declare-fun e!49491 () Bool)

(declare-fun e!49488 () Bool)

(assert (=> b!75780 (= e!49491 e!49488)))

(declare-fun res!39933 () Bool)

(assert (=> b!75780 (=> (not res!39933) (not e!49488))))

(declare-datatypes ((tuple2!2140 0))(
  ( (tuple2!2141 (_1!1081 Bool) (_2!1081 LongMapFixedSize!706)) )
))
(declare-fun lt!34350 () tuple2!2140)

(assert (=> b!75780 (= res!39933 (and (_1!1081 lt!34350) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!34348 () Unit!2179)

(assert (=> b!75780 (= lt!34348 e!49489)))

(declare-fun c!11519 () Bool)

(declare-fun contains!726 (ListLongMap!1415 (_ BitVec 64)) Bool)

(assert (=> b!75780 (= c!11519 (contains!726 lt!34347 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun lt!34341 () V!2961)

(declare-fun update!106 (LongMapFixedSize!706 (_ BitVec 64) V!2961) tuple2!2140)

(assert (=> b!75780 (= lt!34350 (update!106 newMap!16 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))

(declare-fun mapIsEmpty!3216 () Bool)

(assert (=> mapIsEmpty!3216 mapRes!3215))

(declare-fun b!75781 () Bool)

(declare-fun res!39932 () Bool)

(assert (=> b!75781 (=> (not res!39932) (not e!49490))))

(assert (=> b!75781 (= res!39932 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992)))))))))

(declare-fun b!75782 () Bool)

(declare-fun Unit!2182 () Unit!2179)

(assert (=> b!75782 (= e!49489 Unit!2182)))

(declare-fun lt!34344 () Unit!2179)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!52 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 64) (_ BitVec 32) Int) Unit!2179)

(assert (=> b!75782 (= lt!34344 (lemmaListMapContainsThenArrayContainsFrom!52 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!75782 (arrayContainsKey!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!34346 () Unit!2179)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3899 (_ BitVec 32) (_ BitVec 32)) Unit!2179)

(assert (=> b!75782 (= lt!34346 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> b!75782 (arrayNoDuplicates!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) from!355 Nil!1490)))

(declare-fun lt!34343 () Unit!2179)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3899 (_ BitVec 32) (_ BitVec 64) List!1493) Unit!2179)

(assert (=> b!75782 (= lt!34343 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (Cons!1489 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) Nil!1490)))))

(assert (=> b!75782 false))

(assert (=> b!75783 (= e!49484 (and tp!8603 tp_is_empty!2485 (array_inv!1165 (_keys!3903 newMap!16)) (array_inv!1166 (_values!2229 newMap!16)) e!49497))))

(declare-fun b!75784 () Bool)

(declare-fun e!49492 () Bool)

(assert (=> b!75784 (= e!49494 e!49492)))

(declare-fun b!75785 () Bool)

(assert (=> b!75785 (= e!49492 e!49487)))

(declare-fun b!75786 () Bool)

(assert (=> b!75786 (= e!49488 (not e!49498))))

(declare-fun res!39935 () Bool)

(assert (=> b!75786 (=> res!39935 e!49498)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!75786 (= res!39935 (not (validMask!0 (mask!6228 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun lt!34345 () ListLongMap!1415)

(declare-fun lt!34342 () tuple2!2138)

(declare-fun lt!34352 () tuple2!2138)

(declare-fun +!97 (ListLongMap!1415 tuple2!2138) ListLongMap!1415)

(assert (=> b!75786 (= (+!97 (+!97 lt!34345 lt!34342) lt!34352) (+!97 (+!97 lt!34345 lt!34352) lt!34342))))

(assert (=> b!75786 (= lt!34352 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))

(assert (=> b!75786 (= lt!34342 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))

(declare-fun lt!34351 () Unit!2179)

(declare-fun addCommutativeForDiffKeys!16 (ListLongMap!1415 (_ BitVec 64) V!2961 (_ BitVec 64) V!2961) Unit!2179)

(assert (=> b!75786 (= lt!34351 (addCommutativeForDiffKeys!16 lt!34345 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!61 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 32) Int) ListLongMap!1415)

(assert (=> b!75786 (= lt!34345 (getCurrentListMapNoExtraKeys!61 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun b!75787 () Bool)

(assert (=> b!75787 (= e!49493 e!49491)))

(declare-fun res!39938 () Bool)

(assert (=> b!75787 (=> (not res!39938) (not e!49491))))

(assert (=> b!75787 (= res!39938 (and (not (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1156 (ValueCell!899 V!2961) V!2961)

(declare-fun dynLambda!329 (Int (_ BitVec 64)) V!2961)

(assert (=> b!75787 (= lt!34341 (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) from!355) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!3216 () Bool)

(declare-fun tp!8602 () Bool)

(assert (=> mapNonEmpty!3216 (= mapRes!3216 (and tp!8602 e!49499))))

(declare-fun mapRest!3215 () (Array (_ BitVec 32) ValueCell!899))

(declare-fun mapValue!3216 () ValueCell!899)

(declare-fun mapKey!3215 () (_ BitVec 32))

(assert (=> mapNonEmpty!3216 (= (arr!1859 (_values!2229 newMap!16)) (store mapRest!3215 mapKey!3215 mapValue!3216))))

(assert (= (and start!10026 res!39939) b!75781))

(assert (= (and b!75781 res!39932) b!75773))

(assert (= (and b!75773 res!39941) b!75777))

(assert (= (and b!75777 res!39934) b!75779))

(assert (= (and b!75779 res!39937) b!75787))

(assert (= (and b!75787 res!39938) b!75780))

(assert (= (and b!75780 c!11519) b!75782))

(assert (= (and b!75780 (not c!11519)) b!75776))

(assert (= (and b!75780 res!39933) b!75786))

(assert (= (and b!75786 (not res!39935)) b!75766))

(assert (= (and b!75766 (not res!39936)) b!75767))

(assert (= (and b!75767 (not res!39940)) b!75771))

(assert (= (and b!75768 condMapEmpty!3216) mapIsEmpty!3216))

(assert (= (and b!75768 (not condMapEmpty!3216)) mapNonEmpty!3215))

(get-info :version)

(assert (= (and mapNonEmpty!3215 ((_ is ValueCellFull!899) mapValue!3215)) b!75778))

(assert (= (and b!75768 ((_ is ValueCellFull!899) mapDefault!3215)) b!75775))

(assert (= b!75774 b!75768))

(assert (= b!75785 b!75774))

(assert (= b!75784 b!75785))

(assert (= start!10026 b!75784))

(assert (= (and b!75770 condMapEmpty!3215) mapIsEmpty!3215))

(assert (= (and b!75770 (not condMapEmpty!3215)) mapNonEmpty!3216))

(assert (= (and mapNonEmpty!3216 ((_ is ValueCellFull!899) mapValue!3216)) b!75772))

(assert (= (and b!75770 ((_ is ValueCellFull!899) mapDefault!3216)) b!75769))

(assert (= b!75783 b!75770))

(assert (= start!10026 b!75783))

(declare-fun b_lambda!3397 () Bool)

(assert (=> (not b_lambda!3397) (not b!75787)))

(declare-fun t!5075 () Bool)

(declare-fun tb!1557 () Bool)

(assert (=> (and b!75774 (= (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))) t!5075) tb!1557))

(declare-fun result!2721 () Bool)

(assert (=> tb!1557 (= result!2721 tp_is_empty!2485)))

(assert (=> b!75787 t!5075))

(declare-fun b_and!4625 () Bool)

(assert (= b_and!4621 (and (=> t!5075 result!2721) b_and!4625)))

(declare-fun t!5077 () Bool)

(declare-fun tb!1559 () Bool)

(assert (=> (and b!75783 (= (defaultEntry!2246 newMap!16) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))) t!5077) tb!1559))

(declare-fun result!2725 () Bool)

(assert (= result!2725 result!2721))

(assert (=> b!75787 t!5077))

(declare-fun b_and!4627 () Bool)

(assert (= b_and!4623 (and (=> t!5077 result!2725) b_and!4627)))

(declare-fun m!75367 () Bool)

(assert (=> b!75783 m!75367))

(declare-fun m!75369 () Bool)

(assert (=> b!75783 m!75369))

(declare-fun m!75371 () Bool)

(assert (=> b!75767 m!75371))

(declare-fun m!75373 () Bool)

(assert (=> b!75779 m!75373))

(declare-fun m!75375 () Bool)

(assert (=> b!75779 m!75375))

(declare-fun m!75377 () Bool)

(assert (=> b!75786 m!75377))

(declare-fun m!75379 () Bool)

(assert (=> b!75786 m!75379))

(declare-fun m!75381 () Bool)

(assert (=> b!75786 m!75381))

(declare-fun m!75383 () Bool)

(assert (=> b!75786 m!75383))

(declare-fun m!75385 () Bool)

(assert (=> b!75786 m!75385))

(declare-fun m!75387 () Bool)

(assert (=> b!75786 m!75387))

(assert (=> b!75786 m!75385))

(assert (=> b!75786 m!75377))

(assert (=> b!75786 m!75383))

(declare-fun m!75389 () Bool)

(assert (=> b!75786 m!75389))

(declare-fun m!75391 () Bool)

(assert (=> b!75786 m!75391))

(assert (=> b!75780 m!75383))

(assert (=> b!75780 m!75383))

(declare-fun m!75393 () Bool)

(assert (=> b!75780 m!75393))

(assert (=> b!75780 m!75383))

(declare-fun m!75395 () Bool)

(assert (=> b!75780 m!75395))

(declare-fun m!75397 () Bool)

(assert (=> mapNonEmpty!3215 m!75397))

(declare-fun m!75399 () Bool)

(assert (=> b!75774 m!75399))

(declare-fun m!75401 () Bool)

(assert (=> b!75774 m!75401))

(declare-fun m!75403 () Bool)

(assert (=> start!10026 m!75403))

(declare-fun m!75405 () Bool)

(assert (=> b!75773 m!75405))

(declare-fun m!75407 () Bool)

(assert (=> b!75782 m!75407))

(declare-fun m!75409 () Bool)

(assert (=> b!75782 m!75409))

(assert (=> b!75782 m!75383))

(declare-fun m!75411 () Bool)

(assert (=> b!75782 m!75411))

(assert (=> b!75782 m!75383))

(assert (=> b!75782 m!75383))

(declare-fun m!75413 () Bool)

(assert (=> b!75782 m!75413))

(assert (=> b!75782 m!75383))

(declare-fun m!75415 () Bool)

(assert (=> b!75782 m!75415))

(declare-fun m!75417 () Bool)

(assert (=> b!75771 m!75417))

(declare-fun m!75419 () Bool)

(assert (=> mapNonEmpty!3216 m!75419))

(assert (=> b!75787 m!75383))

(declare-fun m!75421 () Bool)

(assert (=> b!75787 m!75421))

(declare-fun m!75423 () Bool)

(assert (=> b!75787 m!75423))

(assert (=> b!75787 m!75421))

(assert (=> b!75787 m!75423))

(declare-fun m!75425 () Bool)

(assert (=> b!75787 m!75425))

(check-sat tp_is_empty!2485 (not b_next!2137) (not b!75786) (not b!75780) (not start!10026) (not b_next!2139) (not b_lambda!3397) b_and!4625 (not b!75767) (not b!75787) (not b!75774) b_and!4627 (not b!75771) (not b!75779) (not b!75783) (not b!75773) (not mapNonEmpty!3216) (not b!75782) (not mapNonEmpty!3215))
(check-sat b_and!4625 b_and!4627 (not b_next!2137) (not b_next!2139))
(get-model)

(declare-fun b_lambda!3403 () Bool)

(assert (= b_lambda!3397 (or (and b!75774 b_free!2137) (and b!75783 b_free!2139 (= (defaultEntry!2246 newMap!16) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))))) b_lambda!3403)))

(check-sat tp_is_empty!2485 (not b_lambda!3403) (not b_next!2137) (not b!75786) (not b!75780) (not start!10026) (not b_next!2139) b_and!4625 (not b!75767) (not b!75787) (not b!75774) b_and!4627 (not b!75771) (not b!75779) (not b!75783) (not b!75773) (not mapNonEmpty!3216) (not b!75782) (not mapNonEmpty!3215))
(check-sat b_and!4625 b_and!4627 (not b_next!2137) (not b_next!2139))
(get-model)

(declare-fun d!18019 () Bool)

(assert (=> d!18019 (= (array_inv!1165 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvsge (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!75774 d!18019))

(declare-fun d!18021 () Bool)

(assert (=> d!18021 (= (array_inv!1166 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvsge (size!2100 (_values!2229 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!75774 d!18021))

(declare-fun d!18023 () Bool)

(assert (=> d!18023 (= (array_inv!1165 (_keys!3903 newMap!16)) (bvsge (size!2099 (_keys!3903 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!75783 d!18023))

(declare-fun d!18025 () Bool)

(assert (=> d!18025 (= (array_inv!1166 (_values!2229 newMap!16)) (bvsge (size!2100 (_values!2229 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!75783 d!18025))

(declare-fun d!18027 () Bool)

(assert (=> d!18027 (not (arrayContainsKey!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!34427 () Unit!2179)

(declare-fun choose!68 (array!3899 (_ BitVec 32) (_ BitVec 64) List!1493) Unit!2179)

(assert (=> d!18027 (= lt!34427 (choose!68 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (Cons!1489 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) Nil!1490)))))

(assert (=> d!18027 (bvslt (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!18027 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (Cons!1489 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) Nil!1490)) lt!34427)))

(declare-fun bs!3249 () Bool)

(assert (= bs!3249 d!18027))

(assert (=> bs!3249 m!75383))

(assert (=> bs!3249 m!75413))

(assert (=> bs!3249 m!75383))

(declare-fun m!75547 () Bool)

(assert (=> bs!3249 m!75547))

(assert (=> b!75782 d!18027))

(declare-fun d!18029 () Bool)

(assert (=> d!18029 (arrayNoDuplicates!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) from!355 Nil!1490)))

(declare-fun lt!34430 () Unit!2179)

(declare-fun choose!39 (array!3899 (_ BitVec 32) (_ BitVec 32)) Unit!2179)

(assert (=> d!18029 (= lt!34430 (choose!39 (_keys!3903 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!18029 (bvslt (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!18029 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000000 from!355) lt!34430)))

(declare-fun bs!3250 () Bool)

(assert (= bs!3250 d!18029))

(assert (=> bs!3250 m!75409))

(declare-fun m!75549 () Bool)

(assert (=> bs!3250 m!75549))

(assert (=> b!75782 d!18029))

(declare-fun d!18031 () Bool)

(declare-fun res!40006 () Bool)

(declare-fun e!49614 () Bool)

(assert (=> d!18031 (=> res!40006 e!49614)))

(assert (=> d!18031 (= res!40006 (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(assert (=> d!18031 (= (arrayContainsKey!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!49614)))

(declare-fun b!75930 () Bool)

(declare-fun e!49615 () Bool)

(assert (=> b!75930 (= e!49614 e!49615)))

(declare-fun res!40007 () Bool)

(assert (=> b!75930 (=> (not res!40007) (not e!49615))))

(assert (=> b!75930 (= res!40007 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun b!75931 () Bool)

(assert (=> b!75931 (= e!49615 (arrayContainsKey!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!18031 (not res!40006)) b!75930))

(assert (= (and b!75930 res!40007) b!75931))

(declare-fun m!75551 () Bool)

(assert (=> d!18031 m!75551))

(assert (=> b!75931 m!75383))

(declare-fun m!75553 () Bool)

(assert (=> b!75931 m!75553))

(assert (=> b!75782 d!18031))

(declare-fun d!18033 () Bool)

(declare-fun e!49618 () Bool)

(assert (=> d!18033 e!49618))

(declare-fun c!11528 () Bool)

(assert (=> d!18033 (= c!11528 (and (not (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!34433 () Unit!2179)

(declare-fun choose!445 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 64) (_ BitVec 32) Int) Unit!2179)

(assert (=> d!18033 (= lt!34433 (choose!445 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))))))

(assert (=> d!18033 (validMask!0 (mask!6228 (v!2552 (underlying!262 thiss!992))))))

(assert (=> d!18033 (= (lemmaListMapContainsThenArrayContainsFrom!52 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))) lt!34433)))

(declare-fun b!75936 () Bool)

(assert (=> b!75936 (= e!49618 (arrayContainsKey!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!75937 () Bool)

(assert (=> b!75937 (= e!49618 (ite (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!18033 c!11528) b!75936))

(assert (= (and d!18033 (not c!11528)) b!75937))

(assert (=> d!18033 m!75383))

(declare-fun m!75555 () Bool)

(assert (=> d!18033 m!75555))

(assert (=> d!18033 m!75381))

(assert (=> b!75936 m!75383))

(assert (=> b!75936 m!75413))

(assert (=> b!75782 d!18033))

(declare-fun d!18035 () Bool)

(declare-fun res!40016 () Bool)

(declare-fun e!49628 () Bool)

(assert (=> d!18035 (=> res!40016 e!49628)))

(assert (=> d!18035 (= res!40016 (bvsge from!355 (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(assert (=> d!18035 (= (arrayNoDuplicates!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) from!355 Nil!1490) e!49628)))

(declare-fun b!75948 () Bool)

(declare-fun e!49627 () Bool)

(declare-fun contains!729 (List!1493 (_ BitVec 64)) Bool)

(assert (=> b!75948 (= e!49627 (contains!729 Nil!1490 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun b!75949 () Bool)

(declare-fun e!49629 () Bool)

(declare-fun e!49630 () Bool)

(assert (=> b!75949 (= e!49629 e!49630)))

(declare-fun c!11531 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!75949 (= c!11531 (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun b!75950 () Bool)

(declare-fun call!6790 () Bool)

(assert (=> b!75950 (= e!49630 call!6790)))

(declare-fun b!75951 () Bool)

(assert (=> b!75951 (= e!49628 e!49629)))

(declare-fun res!40015 () Bool)

(assert (=> b!75951 (=> (not res!40015) (not e!49629))))

(assert (=> b!75951 (= res!40015 (not e!49627))))

(declare-fun res!40014 () Bool)

(assert (=> b!75951 (=> (not res!40014) (not e!49627))))

(assert (=> b!75951 (= res!40014 (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun b!75952 () Bool)

(assert (=> b!75952 (= e!49630 call!6790)))

(declare-fun bm!6787 () Bool)

(assert (=> bm!6787 (= call!6790 (arrayNoDuplicates!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!11531 (Cons!1489 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) Nil!1490) Nil!1490)))))

(assert (= (and d!18035 (not res!40016)) b!75951))

(assert (= (and b!75951 res!40014) b!75948))

(assert (= (and b!75951 res!40015) b!75949))

(assert (= (and b!75949 c!11531) b!75952))

(assert (= (and b!75949 (not c!11531)) b!75950))

(assert (= (or b!75952 b!75950) bm!6787))

(assert (=> b!75948 m!75383))

(assert (=> b!75948 m!75383))

(declare-fun m!75557 () Bool)

(assert (=> b!75948 m!75557))

(assert (=> b!75949 m!75383))

(assert (=> b!75949 m!75383))

(declare-fun m!75559 () Bool)

(assert (=> b!75949 m!75559))

(assert (=> b!75951 m!75383))

(assert (=> b!75951 m!75383))

(assert (=> b!75951 m!75559))

(assert (=> bm!6787 m!75383))

(declare-fun m!75561 () Bool)

(assert (=> bm!6787 m!75561))

(assert (=> b!75782 d!18035))

(declare-fun d!18037 () Bool)

(assert (=> d!18037 (= (valid!306 thiss!992) (valid!307 (v!2552 (underlying!262 thiss!992))))))

(declare-fun bs!3251 () Bool)

(assert (= bs!3251 d!18037))

(declare-fun m!75563 () Bool)

(assert (=> bs!3251 m!75563))

(assert (=> start!10026 d!18037))

(declare-fun d!18039 () Bool)

(declare-fun res!40023 () Bool)

(declare-fun e!49633 () Bool)

(assert (=> d!18039 (=> (not res!40023) (not e!49633))))

(declare-fun simpleValid!53 (LongMapFixedSize!706) Bool)

(assert (=> d!18039 (= res!40023 (simpleValid!53 newMap!16))))

(assert (=> d!18039 (= (valid!307 newMap!16) e!49633)))

(declare-fun b!75959 () Bool)

(declare-fun res!40024 () Bool)

(assert (=> b!75959 (=> (not res!40024) (not e!49633))))

(declare-fun arrayCountValidKeys!0 (array!3899 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!75959 (= res!40024 (= (arrayCountValidKeys!0 (_keys!3903 newMap!16) #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))) (_size!402 newMap!16)))))

(declare-fun b!75960 () Bool)

(declare-fun res!40025 () Bool)

(assert (=> b!75960 (=> (not res!40025) (not e!49633))))

(assert (=> b!75960 (= res!40025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3903 newMap!16) (mask!6228 newMap!16)))))

(declare-fun b!75961 () Bool)

(assert (=> b!75961 (= e!49633 (arrayNoDuplicates!0 (_keys!3903 newMap!16) #b00000000000000000000000000000000 Nil!1490))))

(assert (= (and d!18039 res!40023) b!75959))

(assert (= (and b!75959 res!40024) b!75960))

(assert (= (and b!75960 res!40025) b!75961))

(declare-fun m!75565 () Bool)

(assert (=> d!18039 m!75565))

(declare-fun m!75567 () Bool)

(assert (=> b!75959 m!75567))

(declare-fun m!75569 () Bool)

(assert (=> b!75960 m!75569))

(declare-fun m!75571 () Bool)

(assert (=> b!75961 m!75571))

(assert (=> b!75773 d!18039))

(declare-fun d!18041 () Bool)

(declare-fun res!40028 () Bool)

(declare-fun e!49635 () Bool)

(assert (=> d!18041 (=> res!40028 e!49635)))

(assert (=> d!18041 (= res!40028 (bvsge #b00000000000000000000000000000000 (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(assert (=> d!18041 (= (arrayNoDuplicates!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000000 Nil!1490) e!49635)))

(declare-fun b!75962 () Bool)

(declare-fun e!49634 () Bool)

(assert (=> b!75962 (= e!49634 (contains!729 Nil!1490 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!75963 () Bool)

(declare-fun e!49636 () Bool)

(declare-fun e!49637 () Bool)

(assert (=> b!75963 (= e!49636 e!49637)))

(declare-fun c!11532 () Bool)

(assert (=> b!75963 (= c!11532 (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!75964 () Bool)

(declare-fun call!6791 () Bool)

(assert (=> b!75964 (= e!49637 call!6791)))

(declare-fun b!75965 () Bool)

(assert (=> b!75965 (= e!49635 e!49636)))

(declare-fun res!40027 () Bool)

(assert (=> b!75965 (=> (not res!40027) (not e!49636))))

(assert (=> b!75965 (= res!40027 (not e!49634))))

(declare-fun res!40026 () Bool)

(assert (=> b!75965 (=> (not res!40026) (not e!49634))))

(assert (=> b!75965 (= res!40026 (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!75966 () Bool)

(assert (=> b!75966 (= e!49637 call!6791)))

(declare-fun bm!6788 () Bool)

(assert (=> bm!6788 (= call!6791 (arrayNoDuplicates!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!11532 (Cons!1489 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000) Nil!1490) Nil!1490)))))

(assert (= (and d!18041 (not res!40028)) b!75965))

(assert (= (and b!75965 res!40026) b!75962))

(assert (= (and b!75965 res!40027) b!75963))

(assert (= (and b!75963 c!11532) b!75966))

(assert (= (and b!75963 (not c!11532)) b!75964))

(assert (= (or b!75966 b!75964) bm!6788))

(declare-fun m!75573 () Bool)

(assert (=> b!75962 m!75573))

(assert (=> b!75962 m!75573))

(declare-fun m!75575 () Bool)

(assert (=> b!75962 m!75575))

(assert (=> b!75963 m!75573))

(assert (=> b!75963 m!75573))

(declare-fun m!75577 () Bool)

(assert (=> b!75963 m!75577))

(assert (=> b!75965 m!75573))

(assert (=> b!75965 m!75573))

(assert (=> b!75965 m!75577))

(assert (=> bm!6788 m!75573))

(declare-fun m!75579 () Bool)

(assert (=> bm!6788 m!75579))

(assert (=> b!75771 d!18041))

(declare-fun d!18043 () Bool)

(declare-fun e!49642 () Bool)

(assert (=> d!18043 e!49642))

(declare-fun res!40031 () Bool)

(assert (=> d!18043 (=> res!40031 e!49642)))

(declare-fun lt!34445 () Bool)

(assert (=> d!18043 (= res!40031 (not lt!34445))))

(declare-fun lt!34444 () Bool)

(assert (=> d!18043 (= lt!34445 lt!34444)))

(declare-fun lt!34443 () Unit!2179)

(declare-fun e!49643 () Unit!2179)

(assert (=> d!18043 (= lt!34443 e!49643)))

(declare-fun c!11535 () Bool)

(assert (=> d!18043 (= c!11535 lt!34444)))

(declare-fun containsKey!137 (List!1494 (_ BitVec 64)) Bool)

(assert (=> d!18043 (= lt!34444 (containsKey!137 (toList!723 lt!34347) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(assert (=> d!18043 (= (contains!726 lt!34347 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) lt!34445)))

(declare-fun b!75973 () Bool)

(declare-fun lt!34442 () Unit!2179)

(assert (=> b!75973 (= e!49643 lt!34442)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!86 (List!1494 (_ BitVec 64)) Unit!2179)

(assert (=> b!75973 (= lt!34442 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 lt!34347) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-datatypes ((Option!139 0))(
  ( (Some!138 (v!2558 V!2961)) (None!137) )
))
(declare-fun isDefined!87 (Option!139) Bool)

(declare-fun getValueByKey!133 (List!1494 (_ BitVec 64)) Option!139)

(assert (=> b!75973 (isDefined!87 (getValueByKey!133 (toList!723 lt!34347) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun b!75974 () Bool)

(declare-fun Unit!2190 () Unit!2179)

(assert (=> b!75974 (= e!49643 Unit!2190)))

(declare-fun b!75975 () Bool)

(assert (=> b!75975 (= e!49642 (isDefined!87 (getValueByKey!133 (toList!723 lt!34347) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355))))))

(assert (= (and d!18043 c!11535) b!75973))

(assert (= (and d!18043 (not c!11535)) b!75974))

(assert (= (and d!18043 (not res!40031)) b!75975))

(assert (=> d!18043 m!75383))

(declare-fun m!75581 () Bool)

(assert (=> d!18043 m!75581))

(assert (=> b!75973 m!75383))

(declare-fun m!75583 () Bool)

(assert (=> b!75973 m!75583))

(assert (=> b!75973 m!75383))

(declare-fun m!75585 () Bool)

(assert (=> b!75973 m!75585))

(assert (=> b!75973 m!75585))

(declare-fun m!75587 () Bool)

(assert (=> b!75973 m!75587))

(assert (=> b!75975 m!75383))

(assert (=> b!75975 m!75585))

(assert (=> b!75975 m!75585))

(assert (=> b!75975 m!75587))

(assert (=> b!75780 d!18043))

(declare-fun b!76056 () Bool)

(declare-fun e!49700 () Bool)

(declare-fun e!49699 () Bool)

(assert (=> b!76056 (= e!49700 e!49699)))

(declare-fun call!6853 () ListLongMap!1415)

(declare-fun res!40067 () Bool)

(assert (=> b!76056 (= res!40067 (contains!726 call!6853 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(assert (=> b!76056 (=> (not res!40067) (not e!49699))))

(declare-fun b!76057 () Bool)

(declare-fun e!49690 () Bool)

(declare-datatypes ((SeekEntryResult!241 0))(
  ( (MissingZero!241 (index!3097 (_ BitVec 32))) (Found!241 (index!3098 (_ BitVec 32))) (Intermediate!241 (undefined!1053 Bool) (index!3099 (_ BitVec 32)) (x!11389 (_ BitVec 32))) (Undefined!241) (MissingVacant!241 (index!3100 (_ BitVec 32))) )
))
(declare-fun lt!34509 () SeekEntryResult!241)

(assert (=> b!76057 (= e!49690 ((_ is Undefined!241) lt!34509))))

(declare-fun c!11569 () Bool)

(declare-fun c!11567 () Bool)

(declare-fun call!6856 () ListLongMap!1415)

(declare-fun lt!34514 () SeekEntryResult!241)

(declare-fun bm!6837 () Bool)

(declare-fun lt!34507 () (_ BitVec 32))

(assert (=> bm!6837 (= call!6856 (getCurrentListMap!415 (_keys!3903 newMap!16) (ite c!11567 (_values!2229 newMap!16) (array!3902 (store (arr!1859 (_values!2229 newMap!16)) (index!3098 lt!34514) (ValueCellFull!899 lt!34341)) (size!2100 (_values!2229 newMap!16)))) (mask!6228 newMap!16) (ite (and c!11567 c!11569) lt!34507 (extraKeys!2099 newMap!16)) (ite (and c!11567 c!11569) lt!34341 (zeroValue!2145 newMap!16)) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun b!76058 () Bool)

(declare-fun lt!34510 () Unit!2179)

(declare-fun lt!34501 () Unit!2179)

(assert (=> b!76058 (= lt!34510 lt!34501)))

(declare-fun call!6840 () Bool)

(assert (=> b!76058 call!6840))

(declare-fun lt!34516 () array!3901)

(declare-fun lemmaValidKeyInArrayIsInListMap!85 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 32) Int) Unit!2179)

(assert (=> b!76058 (= lt!34501 (lemmaValidKeyInArrayIsInListMap!85 (_keys!3903 newMap!16) lt!34516 (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (index!3098 lt!34514) (defaultEntry!2246 newMap!16)))))

(assert (=> b!76058 (= lt!34516 (array!3902 (store (arr!1859 (_values!2229 newMap!16)) (index!3098 lt!34514) (ValueCellFull!899 lt!34341)) (size!2100 (_values!2229 newMap!16))))))

(declare-fun lt!34508 () Unit!2179)

(declare-fun lt!34513 () Unit!2179)

(assert (=> b!76058 (= lt!34508 lt!34513)))

(declare-fun call!6850 () ListLongMap!1415)

(assert (=> b!76058 (= call!6850 call!6856)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!26 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 32) (_ BitVec 64) V!2961 Int) Unit!2179)

(assert (=> b!76058 (= lt!34513 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!26 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (index!3098 lt!34514) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34523 () Unit!2179)

(declare-fun e!49695 () Unit!2179)

(assert (=> b!76058 (= lt!34523 e!49695)))

(declare-fun c!11572 () Bool)

(assert (=> b!76058 (= c!11572 (contains!726 (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun e!49689 () tuple2!2140)

(assert (=> b!76058 (= e!49689 (tuple2!2141 true (LongMapFixedSize!707 (defaultEntry!2246 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (_size!402 newMap!16) (_keys!3903 newMap!16) (array!3902 (store (arr!1859 (_values!2229 newMap!16)) (index!3098 lt!34514) (ValueCellFull!899 lt!34341)) (size!2100 (_values!2229 newMap!16))) (_vacant!402 newMap!16))))))

(declare-fun bm!6838 () Bool)

(declare-fun call!6847 () Bool)

(assert (=> bm!6838 (= call!6847 (arrayContainsKey!0 (_keys!3903 newMap!16) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun c!11562 () Bool)

(declare-fun bm!6839 () Bool)

(declare-fun call!6858 () tuple2!2140)

(declare-fun updateHelperNewKey!26 (LongMapFixedSize!706 (_ BitVec 64) V!2961 (_ BitVec 32)) tuple2!2140)

(assert (=> bm!6839 (= call!6858 (updateHelperNewKey!26 newMap!16 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341 (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514))))))

(declare-fun b!76059 () Bool)

(declare-fun e!49693 () Bool)

(assert (=> b!76059 (= e!49690 e!49693)))

(declare-fun res!40063 () Bool)

(declare-fun call!6848 () Bool)

(assert (=> b!76059 (= res!40063 call!6848)))

(assert (=> b!76059 (=> (not res!40063) (not e!49693))))

(declare-fun b!76060 () Bool)

(declare-fun lt!34502 () Unit!2179)

(declare-fun e!49687 () Unit!2179)

(assert (=> b!76060 (= lt!34502 e!49687)))

(declare-fun c!11571 () Bool)

(assert (=> b!76060 (= c!11571 call!6840)))

(declare-fun e!49697 () tuple2!2140)

(assert (=> b!76060 (= e!49697 (tuple2!2141 false newMap!16))))

(declare-fun b!76061 () Bool)

(declare-fun res!40070 () Bool)

(declare-fun lt!34511 () SeekEntryResult!241)

(assert (=> b!76061 (= res!40070 (= (select (arr!1858 (_keys!3903 newMap!16)) (index!3100 lt!34511)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49688 () Bool)

(assert (=> b!76061 (=> (not res!40070) (not e!49688))))

(declare-fun bm!6841 () Bool)

(declare-fun call!6841 () SeekEntryResult!241)

(declare-fun call!6863 () SeekEntryResult!241)

(assert (=> bm!6841 (= call!6841 call!6863)))

(declare-fun bm!6842 () Bool)

(declare-fun lt!34525 () tuple2!2140)

(assert (=> bm!6842 (= call!6853 (map!1159 (_2!1081 lt!34525)))))

(declare-fun b!76062 () Bool)

(declare-fun res!40071 () Bool)

(declare-fun call!6857 () Bool)

(assert (=> b!76062 (= res!40071 call!6857)))

(declare-fun e!49702 () Bool)

(assert (=> b!76062 (=> (not res!40071) (not e!49702))))

(declare-fun bm!6843 () Bool)

(assert (=> bm!6843 (= call!6848 call!6857)))

(declare-fun bm!6844 () Bool)

(declare-fun call!6859 () Bool)

(declare-fun call!6844 () Bool)

(assert (=> bm!6844 (= call!6859 call!6844)))

(declare-fun b!76063 () Bool)

(declare-fun e!49692 () tuple2!2140)

(declare-fun e!49698 () tuple2!2140)

(assert (=> b!76063 (= e!49692 e!49698)))

(assert (=> b!76063 (= c!11569 (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76064 () Bool)

(declare-fun lt!34506 () tuple2!2140)

(assert (=> b!76064 (= lt!34506 call!6858)))

(assert (=> b!76064 (= e!49689 (tuple2!2141 (_1!1081 lt!34506) (_2!1081 lt!34506)))))

(declare-fun b!76065 () Bool)

(declare-fun e!49704 () tuple2!2140)

(declare-fun lt!34521 () tuple2!2140)

(assert (=> b!76065 (= e!49704 (tuple2!2141 (_1!1081 lt!34521) (_2!1081 lt!34521)))))

(assert (=> b!76065 (= lt!34521 call!6858)))

(declare-fun bm!6845 () Bool)

(declare-fun call!6855 () Bool)

(assert (=> bm!6845 (= call!6857 call!6855)))

(declare-fun b!76066 () Bool)

(declare-fun c!11564 () Bool)

(assert (=> b!76066 (= c!11564 ((_ is MissingVacant!241) lt!34511))))

(declare-fun e!49691 () Bool)

(declare-fun e!49701 () Bool)

(assert (=> b!76066 (= e!49691 e!49701)))

(declare-fun c!11573 () Bool)

(declare-fun bm!6846 () Bool)

(declare-fun call!6842 () ListLongMap!1415)

(assert (=> bm!6846 (= call!6840 (contains!726 call!6842 (ite c!11573 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (select (arr!1858 (_keys!3903 newMap!16)) (index!3098 lt!34514)))))))

(declare-fun bm!6847 () Bool)

(declare-fun call!6861 () SeekEntryResult!241)

(assert (=> bm!6847 (= call!6861 call!6863)))

(declare-fun b!76067 () Bool)

(assert (=> b!76067 (= e!49692 e!49697)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3899 (_ BitVec 32)) SeekEntryResult!241)

(assert (=> b!76067 (= lt!34514 (seekEntryOrOpen!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (_keys!3903 newMap!16) (mask!6228 newMap!16)))))

(assert (=> b!76067 (= c!11573 ((_ is Undefined!241) lt!34514))))

(declare-fun b!76068 () Bool)

(assert (=> b!76068 (= e!49701 ((_ is Undefined!241) lt!34511))))

(declare-fun b!76069 () Bool)

(declare-fun e!49686 () Bool)

(declare-fun call!6846 () Bool)

(assert (=> b!76069 (= e!49686 (not call!6846))))

(declare-fun b!76070 () Bool)

(declare-fun call!6845 () ListLongMap!1415)

(assert (=> b!76070 (= e!49700 (= call!6853 call!6845))))

(declare-fun b!76071 () Bool)

(assert (=> b!76071 (= e!49688 (not call!6846))))

(declare-fun b!76072 () Bool)

(declare-fun lt!34504 () Unit!2179)

(assert (=> b!76072 (= e!49695 lt!34504)))

(declare-fun call!6860 () Unit!2179)

(assert (=> b!76072 (= lt!34504 call!6860)))

(declare-fun lt!34524 () SeekEntryResult!241)

(assert (=> b!76072 (= lt!34524 call!6841)))

(declare-fun res!40060 () Bool)

(assert (=> b!76072 (= res!40060 ((_ is Found!241) lt!34524))))

(declare-fun e!49706 () Bool)

(assert (=> b!76072 (=> (not res!40060) (not e!49706))))

(assert (=> b!76072 e!49706))

(declare-fun b!76073 () Bool)

(declare-fun res!40073 () Bool)

(declare-fun e!49696 () Bool)

(assert (=> b!76073 (=> (not res!40073) (not e!49696))))

(assert (=> b!76073 (= res!40073 call!6848)))

(declare-fun e!49705 () Bool)

(assert (=> b!76073 (= e!49705 e!49696)))

(declare-fun b!76074 () Bool)

(assert (=> b!76074 (= e!49701 e!49688)))

(declare-fun res!40062 () Bool)

(assert (=> b!76074 (= res!40062 call!6859)))

(assert (=> b!76074 (=> (not res!40062) (not e!49688))))

(declare-fun bm!6848 () Bool)

(declare-fun e!49694 () ListLongMap!1415)

(assert (=> bm!6848 (= call!6850 (+!97 e!49694 (ite c!11567 (ite c!11569 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34341) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34341)) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))

(declare-fun c!11574 () Bool)

(assert (=> bm!6848 (= c!11574 c!11567)))

(declare-fun b!76075 () Bool)

(declare-fun call!6851 () Bool)

(assert (=> b!76075 (= e!49693 (not call!6851))))

(declare-fun bm!6849 () Bool)

(assert (=> bm!6849 (= call!6845 (map!1159 newMap!16))))

(declare-fun b!76076 () Bool)

(declare-fun res!40072 () Bool)

(assert (=> b!76076 (= res!40072 call!6844)))

(assert (=> b!76076 (=> (not res!40072) (not e!49706))))

(declare-fun b!76077 () Bool)

(assert (=> b!76077 (= e!49706 (= (select (arr!1858 (_keys!3903 newMap!16)) (index!3098 lt!34524)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun bm!6850 () Bool)

(assert (=> bm!6850 (= call!6851 call!6847)))

(declare-fun b!76078 () Bool)

(assert (=> b!76078 (= e!49699 (= call!6853 (+!97 call!6845 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))

(declare-fun b!76079 () Bool)

(assert (=> b!76079 (= e!49696 (not call!6851))))

(declare-fun b!76080 () Bool)

(declare-fun Unit!2191 () Unit!2179)

(assert (=> b!76080 (= e!49687 Unit!2191)))

(declare-fun lt!34519 () Unit!2179)

(assert (=> b!76080 (= lt!34519 call!6860)))

(declare-fun lt!34522 () SeekEntryResult!241)

(assert (=> b!76080 (= lt!34522 call!6861)))

(declare-fun res!40066 () Bool)

(assert (=> b!76080 (= res!40066 ((_ is Found!241) lt!34522))))

(assert (=> b!76080 (=> (not res!40066) (not e!49702))))

(assert (=> b!76080 e!49702))

(declare-fun lt!34517 () Unit!2179)

(assert (=> b!76080 (= lt!34517 lt!34519)))

(assert (=> b!76080 false))

(declare-fun b!76081 () Bool)

(declare-fun lt!34512 () Unit!2179)

(declare-fun lt!34526 () Unit!2179)

(assert (=> b!76081 (= lt!34512 lt!34526)))

(declare-fun call!6852 () ListLongMap!1415)

(declare-fun call!6843 () ListLongMap!1415)

(assert (=> b!76081 (= call!6852 call!6843)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!26 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 V!2961 Int) Unit!2179)

(assert (=> b!76081 (= lt!34526 (lemmaChangeZeroKeyThenAddPairToListMap!26 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) lt!34507 (zeroValue!2145 newMap!16) lt!34341 (minValue!2145 newMap!16) (defaultEntry!2246 newMap!16)))))

(assert (=> b!76081 (= lt!34507 (bvor (extraKeys!2099 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!76081 (= e!49698 (tuple2!2141 true (LongMapFixedSize!707 (defaultEntry!2246 newMap!16) (mask!6228 newMap!16) (bvor (extraKeys!2099 newMap!16) #b00000000000000000000000000000001) lt!34341 (minValue!2145 newMap!16) (_size!402 newMap!16) (_keys!3903 newMap!16) (_values!2229 newMap!16) (_vacant!402 newMap!16))))))

(declare-fun b!76082 () Bool)

(declare-fun c!11563 () Bool)

(assert (=> b!76082 (= c!11563 ((_ is MissingVacant!241) lt!34509))))

(assert (=> b!76082 (= e!49705 e!49690)))

(declare-fun b!76083 () Bool)

(assert (=> b!76083 (= e!49704 e!49689)))

(declare-fun c!11566 () Bool)

(assert (=> b!76083 (= c!11566 ((_ is MissingZero!241) lt!34514))))

(declare-fun b!76084 () Bool)

(declare-fun e!49703 () Bool)

(assert (=> b!76084 (= e!49703 e!49700)))

(declare-fun c!11565 () Bool)

(assert (=> b!76084 (= c!11565 (_1!1081 lt!34525))))

(declare-fun b!76085 () Bool)

(declare-fun res!40069 () Bool)

(assert (=> b!76085 (=> (not res!40069) (not e!49696))))

(assert (=> b!76085 (= res!40069 (= (select (arr!1858 (_keys!3903 newMap!16)) (index!3097 lt!34509)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!11570 () Bool)

(declare-fun c!11568 () Bool)

(declare-fun bm!6840 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!6840 (= call!6855 (inRange!0 (ite c!11573 (ite c!11571 (index!3098 lt!34522) (ite c!11570 (index!3097 lt!34509) (index!3100 lt!34509))) (ite c!11572 (index!3098 lt!34524) (ite c!11568 (index!3097 lt!34511) (index!3100 lt!34511)))) (mask!6228 newMap!16)))))

(declare-fun d!18045 () Bool)

(assert (=> d!18045 e!49703))

(declare-fun res!40065 () Bool)

(assert (=> d!18045 (=> (not res!40065) (not e!49703))))

(assert (=> d!18045 (= res!40065 (valid!307 (_2!1081 lt!34525)))))

(assert (=> d!18045 (= lt!34525 e!49692)))

(assert (=> d!18045 (= c!11567 (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (bvneg (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355))))))

(assert (=> d!18045 (valid!307 newMap!16)))

(assert (=> d!18045 (= (update!106 newMap!16 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341) lt!34525)))

(declare-fun b!76086 () Bool)

(declare-fun lt!34515 () Unit!2179)

(assert (=> b!76086 (= e!49687 lt!34515)))

(declare-fun call!6862 () Unit!2179)

(assert (=> b!76086 (= lt!34515 call!6862)))

(assert (=> b!76086 (= lt!34509 call!6861)))

(assert (=> b!76086 (= c!11570 ((_ is MissingZero!241) lt!34509))))

(assert (=> b!76086 e!49705))

(declare-fun bm!6851 () Bool)

(declare-fun lt!34520 () (_ BitVec 32))

(declare-fun call!6854 () ListLongMap!1415)

(assert (=> bm!6851 (= call!6854 (getCurrentListMap!415 (_keys!3903 newMap!16) (ite (or c!11567 c!11573) (_values!2229 newMap!16) lt!34516) (mask!6228 newMap!16) (ite c!11567 (ite c!11569 (extraKeys!2099 newMap!16) lt!34520) (extraKeys!2099 newMap!16)) (zeroValue!2145 newMap!16) (ite c!11567 (ite c!11569 (minValue!2145 newMap!16) lt!34341) (minValue!2145 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun b!76087 () Bool)

(declare-fun res!40061 () Bool)

(assert (=> b!76087 (=> (not res!40061) (not e!49686))))

(assert (=> b!76087 (= res!40061 call!6859)))

(assert (=> b!76087 (= e!49691 e!49686)))

(declare-fun b!76088 () Bool)

(assert (=> b!76088 (= c!11562 ((_ is MissingVacant!241) lt!34514))))

(assert (=> b!76088 (= e!49697 e!49704)))

(declare-fun b!76089 () Bool)

(declare-fun call!6849 () ListLongMap!1415)

(assert (=> b!76089 (= e!49694 (ite c!11569 call!6849 call!6843))))

(declare-fun b!76090 () Bool)

(assert (=> b!76090 (= e!49702 (= (select (arr!1858 (_keys!3903 newMap!16)) (index!3098 lt!34522)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun bm!6852 () Bool)

(assert (=> bm!6852 (= call!6843 call!6856)))

(declare-fun b!76091 () Bool)

(declare-fun Unit!2192 () Unit!2179)

(assert (=> b!76091 (= e!49695 Unit!2192)))

(declare-fun lt!34518 () Unit!2179)

(assert (=> b!76091 (= lt!34518 call!6862)))

(assert (=> b!76091 (= lt!34511 call!6841)))

(assert (=> b!76091 (= c!11568 ((_ is MissingZero!241) lt!34511))))

(assert (=> b!76091 e!49691))

(declare-fun lt!34505 () Unit!2179)

(assert (=> b!76091 (= lt!34505 lt!34518)))

(assert (=> b!76091 false))

(declare-fun bm!6853 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!26 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 64) Int) Unit!2179)

(assert (=> bm!6853 (= call!6860 (lemmaInListMapThenSeekEntryOrOpenFindsIt!26 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (defaultEntry!2246 newMap!16)))))

(declare-fun bm!6854 () Bool)

(assert (=> bm!6854 (= call!6846 call!6847)))

(declare-fun bm!6855 () Bool)

(assert (=> bm!6855 (= call!6842 call!6854)))

(declare-fun b!76092 () Bool)

(declare-fun res!40068 () Bool)

(assert (=> b!76092 (=> (not res!40068) (not e!49686))))

(assert (=> b!76092 (= res!40068 (= (select (arr!1858 (_keys!3903 newMap!16)) (index!3097 lt!34511)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6856 () Bool)

(assert (=> bm!6856 (= call!6852 call!6850)))

(declare-fun bm!6857 () Bool)

(assert (=> bm!6857 (= call!6863 (seekEntryOrOpen!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (_keys!3903 newMap!16) (mask!6228 newMap!16)))))

(declare-fun bm!6858 () Bool)

(assert (=> bm!6858 (= call!6844 call!6855)))

(declare-fun bm!6859 () Bool)

(assert (=> bm!6859 (= call!6849 call!6854)))

(declare-fun b!76093 () Bool)

(declare-fun lt!34503 () Unit!2179)

(declare-fun lt!34500 () Unit!2179)

(assert (=> b!76093 (= lt!34503 lt!34500)))

(assert (=> b!76093 (= call!6852 call!6849)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!26 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 V!2961 Int) Unit!2179)

(assert (=> b!76093 (= lt!34500 (lemmaChangeLongMinValueKeyThenAddPairToListMap!26 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) lt!34520 (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) lt!34341 (defaultEntry!2246 newMap!16)))))

(assert (=> b!76093 (= lt!34520 (bvor (extraKeys!2099 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!76093 (= e!49698 (tuple2!2141 true (LongMapFixedSize!707 (defaultEntry!2246 newMap!16) (mask!6228 newMap!16) (bvor (extraKeys!2099 newMap!16) #b00000000000000000000000000000010) (zeroValue!2145 newMap!16) lt!34341 (_size!402 newMap!16) (_keys!3903 newMap!16) (_values!2229 newMap!16) (_vacant!402 newMap!16))))))

(declare-fun b!76094 () Bool)

(declare-fun res!40064 () Bool)

(assert (=> b!76094 (= res!40064 (= (select (arr!1858 (_keys!3903 newMap!16)) (index!3100 lt!34509)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76094 (=> (not res!40064) (not e!49693))))

(declare-fun b!76095 () Bool)

(assert (=> b!76095 (= e!49694 (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun bm!6860 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!26 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 64) Int) Unit!2179)

(assert (=> bm!6860 (= call!6862 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!26 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (defaultEntry!2246 newMap!16)))))

(assert (= (and d!18045 c!11567) b!76063))

(assert (= (and d!18045 (not c!11567)) b!76067))

(assert (= (and b!76063 c!11569) b!76081))

(assert (= (and b!76063 (not c!11569)) b!76093))

(assert (= (or b!76081 b!76093) bm!6852))

(assert (= (or b!76081 b!76093) bm!6859))

(assert (= (or b!76081 b!76093) bm!6856))

(assert (= (and b!76067 c!11573) b!76060))

(assert (= (and b!76067 (not c!11573)) b!76088))

(assert (= (and b!76060 c!11571) b!76080))

(assert (= (and b!76060 (not c!11571)) b!76086))

(assert (= (and b!76080 res!40066) b!76062))

(assert (= (and b!76062 res!40071) b!76090))

(assert (= (and b!76086 c!11570) b!76073))

(assert (= (and b!76086 (not c!11570)) b!76082))

(assert (= (and b!76073 res!40073) b!76085))

(assert (= (and b!76085 res!40069) b!76079))

(assert (= (and b!76082 c!11563) b!76059))

(assert (= (and b!76082 (not c!11563)) b!76057))

(assert (= (and b!76059 res!40063) b!76094))

(assert (= (and b!76094 res!40064) b!76075))

(assert (= (or b!76073 b!76059) bm!6843))

(assert (= (or b!76079 b!76075) bm!6850))

(assert (= (or b!76062 bm!6843) bm!6845))

(assert (= (or b!76080 b!76086) bm!6847))

(assert (= (and b!76088 c!11562) b!76065))

(assert (= (and b!76088 (not c!11562)) b!76083))

(assert (= (and b!76083 c!11566) b!76064))

(assert (= (and b!76083 (not c!11566)) b!76058))

(assert (= (and b!76058 c!11572) b!76072))

(assert (= (and b!76058 (not c!11572)) b!76091))

(assert (= (and b!76072 res!40060) b!76076))

(assert (= (and b!76076 res!40072) b!76077))

(assert (= (and b!76091 c!11568) b!76087))

(assert (= (and b!76091 (not c!11568)) b!76066))

(assert (= (and b!76087 res!40061) b!76092))

(assert (= (and b!76092 res!40068) b!76069))

(assert (= (and b!76066 c!11564) b!76074))

(assert (= (and b!76066 (not c!11564)) b!76068))

(assert (= (and b!76074 res!40062) b!76061))

(assert (= (and b!76061 res!40070) b!76071))

(assert (= (or b!76087 b!76074) bm!6844))

(assert (= (or b!76069 b!76071) bm!6854))

(assert (= (or b!76076 bm!6844) bm!6858))

(assert (= (or b!76072 b!76091) bm!6841))

(assert (= (or b!76065 b!76064) bm!6839))

(assert (= (or b!76080 b!76072) bm!6853))

(assert (= (or bm!6847 bm!6841) bm!6857))

(assert (= (or bm!6850 bm!6854) bm!6838))

(assert (= (or b!76086 b!76091) bm!6860))

(assert (= (or bm!6845 bm!6858) bm!6840))

(assert (= (or b!76060 b!76058) bm!6855))

(assert (= (or b!76060 b!76058) bm!6846))

(assert (= (or bm!6859 bm!6855) bm!6851))

(assert (= (or bm!6852 b!76058) bm!6837))

(assert (= (or bm!6856 b!76058) bm!6848))

(assert (= (and bm!6848 c!11574) b!76089))

(assert (= (and bm!6848 (not c!11574)) b!76095))

(assert (= (and d!18045 res!40065) b!76084))

(assert (= (and b!76084 c!11565) b!76056))

(assert (= (and b!76084 (not c!11565)) b!76070))

(assert (= (and b!76056 res!40067) b!76078))

(assert (= (or b!76078 b!76070) bm!6849))

(assert (= (or b!76056 b!76078 b!76070) bm!6842))

(assert (=> bm!6853 m!75383))

(declare-fun m!75589 () Bool)

(assert (=> bm!6853 m!75589))

(declare-fun m!75591 () Bool)

(assert (=> b!76094 m!75591))

(declare-fun m!75593 () Bool)

(assert (=> b!76085 m!75593))

(assert (=> b!76067 m!75383))

(declare-fun m!75595 () Bool)

(assert (=> b!76067 m!75595))

(declare-fun m!75597 () Bool)

(assert (=> b!76061 m!75597))

(declare-fun m!75599 () Bool)

(assert (=> d!18045 m!75599))

(assert (=> d!18045 m!75405))

(assert (=> b!76056 m!75383))

(declare-fun m!75601 () Bool)

(assert (=> b!76056 m!75601))

(declare-fun m!75603 () Bool)

(assert (=> bm!6851 m!75603))

(declare-fun m!75605 () Bool)

(assert (=> b!76093 m!75605))

(declare-fun m!75607 () Bool)

(assert (=> b!76058 m!75607))

(assert (=> b!76058 m!75607))

(assert (=> b!76058 m!75383))

(declare-fun m!75609 () Bool)

(assert (=> b!76058 m!75609))

(declare-fun m!75611 () Bool)

(assert (=> b!76058 m!75611))

(assert (=> b!76058 m!75383))

(declare-fun m!75613 () Bool)

(assert (=> b!76058 m!75613))

(declare-fun m!75615 () Bool)

(assert (=> b!76058 m!75615))

(declare-fun m!75617 () Bool)

(assert (=> b!76081 m!75617))

(declare-fun m!75619 () Bool)

(assert (=> b!76090 m!75619))

(assert (=> b!76095 m!75607))

(declare-fun m!75621 () Bool)

(assert (=> bm!6842 m!75621))

(declare-fun m!75623 () Bool)

(assert (=> bm!6846 m!75623))

(declare-fun m!75625 () Bool)

(assert (=> bm!6846 m!75625))

(declare-fun m!75627 () Bool)

(assert (=> bm!6840 m!75627))

(assert (=> bm!6839 m!75383))

(declare-fun m!75629 () Bool)

(assert (=> bm!6839 m!75629))

(declare-fun m!75631 () Bool)

(assert (=> b!76092 m!75631))

(declare-fun m!75633 () Bool)

(assert (=> b!76077 m!75633))

(assert (=> bm!6849 m!75373))

(declare-fun m!75635 () Bool)

(assert (=> bm!6848 m!75635))

(assert (=> bm!6860 m!75383))

(declare-fun m!75637 () Bool)

(assert (=> bm!6860 m!75637))

(declare-fun m!75639 () Bool)

(assert (=> b!76078 m!75639))

(assert (=> bm!6837 m!75611))

(declare-fun m!75641 () Bool)

(assert (=> bm!6837 m!75641))

(assert (=> bm!6857 m!75383))

(assert (=> bm!6857 m!75595))

(assert (=> bm!6838 m!75383))

(declare-fun m!75643 () Bool)

(assert (=> bm!6838 m!75643))

(assert (=> b!75780 d!18045))

(declare-fun d!18047 () Bool)

(assert (=> d!18047 (= (map!1159 newMap!16) (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun bs!3252 () Bool)

(assert (= bs!3252 d!18047))

(assert (=> bs!3252 m!75607))

(assert (=> b!75779 d!18047))

(declare-fun b!76138 () Bool)

(declare-fun e!49737 () ListLongMap!1415)

(declare-fun call!6881 () ListLongMap!1415)

(assert (=> b!76138 (= e!49737 call!6881)))

(declare-fun lt!34576 () ListLongMap!1415)

(declare-fun e!49734 () Bool)

(declare-fun b!76139 () Bool)

(declare-fun apply!77 (ListLongMap!1415 (_ BitVec 64)) V!2961)

(assert (=> b!76139 (= e!49734 (= (apply!77 lt!34576 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76139 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2100 (_values!2229 (v!2552 (underlying!262 thiss!992))))))))

(assert (=> b!76139 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun b!76140 () Bool)

(declare-fun e!49745 () ListLongMap!1415)

(declare-fun call!6879 () ListLongMap!1415)

(assert (=> b!76140 (= e!49745 (+!97 call!6879 (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun b!76141 () Bool)

(declare-fun e!49740 () Bool)

(assert (=> b!76141 (= e!49740 (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!76142 () Bool)

(declare-fun e!49739 () Unit!2179)

(declare-fun lt!34592 () Unit!2179)

(assert (=> b!76142 (= e!49739 lt!34592)))

(declare-fun lt!34573 () ListLongMap!1415)

(assert (=> b!76142 (= lt!34573 (getCurrentListMapNoExtraKeys!61 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun lt!34590 () (_ BitVec 64))

(assert (=> b!76142 (= lt!34590 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34586 () (_ BitVec 64))

(assert (=> b!76142 (= lt!34586 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!34577 () Unit!2179)

(declare-fun addStillContains!53 (ListLongMap!1415 (_ BitVec 64) V!2961 (_ BitVec 64)) Unit!2179)

(assert (=> b!76142 (= lt!34577 (addStillContains!53 lt!34573 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) lt!34586))))

(assert (=> b!76142 (contains!726 (+!97 lt!34573 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34586)))

(declare-fun lt!34588 () Unit!2179)

(assert (=> b!76142 (= lt!34588 lt!34577)))

(declare-fun lt!34572 () ListLongMap!1415)

(assert (=> b!76142 (= lt!34572 (getCurrentListMapNoExtraKeys!61 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun lt!34574 () (_ BitVec 64))

(assert (=> b!76142 (= lt!34574 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34578 () (_ BitVec 64))

(assert (=> b!76142 (= lt!34578 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!34591 () Unit!2179)

(declare-fun addApplyDifferent!53 (ListLongMap!1415 (_ BitVec 64) V!2961 (_ BitVec 64)) Unit!2179)

(assert (=> b!76142 (= lt!34591 (addApplyDifferent!53 lt!34572 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992))) lt!34578))))

(assert (=> b!76142 (= (apply!77 (+!97 lt!34572 (tuple2!2139 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34578) (apply!77 lt!34572 lt!34578))))

(declare-fun lt!34571 () Unit!2179)

(assert (=> b!76142 (= lt!34571 lt!34591)))

(declare-fun lt!34580 () ListLongMap!1415)

(assert (=> b!76142 (= lt!34580 (getCurrentListMapNoExtraKeys!61 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun lt!34584 () (_ BitVec 64))

(assert (=> b!76142 (= lt!34584 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34589 () (_ BitVec 64))

(assert (=> b!76142 (= lt!34589 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!34582 () Unit!2179)

(assert (=> b!76142 (= lt!34582 (addApplyDifferent!53 lt!34580 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) lt!34589))))

(assert (=> b!76142 (= (apply!77 (+!97 lt!34580 (tuple2!2139 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34589) (apply!77 lt!34580 lt!34589))))

(declare-fun lt!34581 () Unit!2179)

(assert (=> b!76142 (= lt!34581 lt!34582)))

(declare-fun lt!34579 () ListLongMap!1415)

(assert (=> b!76142 (= lt!34579 (getCurrentListMapNoExtraKeys!61 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun lt!34585 () (_ BitVec 64))

(assert (=> b!76142 (= lt!34585 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34575 () (_ BitVec 64))

(assert (=> b!76142 (= lt!34575 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!76142 (= lt!34592 (addApplyDifferent!53 lt!34579 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992))) lt!34575))))

(assert (=> b!76142 (= (apply!77 (+!97 lt!34579 (tuple2!2139 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34575) (apply!77 lt!34579 lt!34575))))

(declare-fun b!76143 () Bool)

(declare-fun e!49743 () ListLongMap!1415)

(declare-fun call!6882 () ListLongMap!1415)

(assert (=> b!76143 (= e!49743 call!6882)))

(declare-fun b!76144 () Bool)

(declare-fun Unit!2193 () Unit!2179)

(assert (=> b!76144 (= e!49739 Unit!2193)))

(declare-fun b!76145 () Bool)

(declare-fun e!49738 () Bool)

(assert (=> b!76145 (= e!49738 e!49734)))

(declare-fun res!40095 () Bool)

(assert (=> b!76145 (=> (not res!40095) (not e!49734))))

(assert (=> b!76145 (= res!40095 (contains!726 lt!34576 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!76145 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun bm!6876 () Bool)

(declare-fun call!6883 () ListLongMap!1415)

(assert (=> bm!6876 (= call!6883 (getCurrentListMapNoExtraKeys!61 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun b!76146 () Bool)

(declare-fun e!49742 () Bool)

(assert (=> b!76146 (= e!49742 (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!6877 () Bool)

(declare-fun call!6884 () Bool)

(assert (=> bm!6877 (= call!6884 (contains!726 lt!34576 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76147 () Bool)

(declare-fun e!49736 () Bool)

(declare-fun e!49741 () Bool)

(assert (=> b!76147 (= e!49736 e!49741)))

(declare-fun res!40093 () Bool)

(declare-fun call!6878 () Bool)

(assert (=> b!76147 (= res!40093 call!6878)))

(assert (=> b!76147 (=> (not res!40093) (not e!49741))))

(declare-fun b!76148 () Bool)

(declare-fun c!11588 () Bool)

(assert (=> b!76148 (= c!11588 (and (not (= (bvand (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!76148 (= e!49737 e!49743)))

(declare-fun b!76149 () Bool)

(declare-fun res!40099 () Bool)

(declare-fun e!49744 () Bool)

(assert (=> b!76149 (=> (not res!40099) (not e!49744))))

(assert (=> b!76149 (= res!40099 e!49736)))

(declare-fun c!11589 () Bool)

(assert (=> b!76149 (= c!11589 (not (= (bvand (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!76150 () Bool)

(assert (=> b!76150 (= e!49745 e!49737)))

(declare-fun c!11592 () Bool)

(assert (=> b!76150 (= c!11592 (and (not (= (bvand (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!76151 () Bool)

(declare-fun e!49733 () Bool)

(declare-fun e!49735 () Bool)

(assert (=> b!76151 (= e!49733 e!49735)))

(declare-fun res!40098 () Bool)

(assert (=> b!76151 (= res!40098 call!6884)))

(assert (=> b!76151 (=> (not res!40098) (not e!49735))))

(declare-fun b!76152 () Bool)

(assert (=> b!76152 (= e!49741 (= (apply!77 lt!34576 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun b!76153 () Bool)

(assert (=> b!76153 (= e!49735 (= (apply!77 lt!34576 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2145 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun b!76154 () Bool)

(assert (=> b!76154 (= e!49744 e!49733)))

(declare-fun c!11590 () Bool)

(assert (=> b!76154 (= c!11590 (not (= (bvand (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6875 () Bool)

(declare-fun call!6880 () ListLongMap!1415)

(assert (=> bm!6875 (= call!6880 call!6883)))

(declare-fun d!18049 () Bool)

(assert (=> d!18049 e!49744))

(declare-fun res!40096 () Bool)

(assert (=> d!18049 (=> (not res!40096) (not e!49744))))

(assert (=> d!18049 (= res!40096 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))))

(declare-fun lt!34583 () ListLongMap!1415)

(assert (=> d!18049 (= lt!34576 lt!34583)))

(declare-fun lt!34587 () Unit!2179)

(assert (=> d!18049 (= lt!34587 e!49739)))

(declare-fun c!11587 () Bool)

(assert (=> d!18049 (= c!11587 e!49742)))

(declare-fun res!40097 () Bool)

(assert (=> d!18049 (=> (not res!40097) (not e!49742))))

(assert (=> d!18049 (= res!40097 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(assert (=> d!18049 (= lt!34583 e!49745)))

(declare-fun c!11591 () Bool)

(assert (=> d!18049 (= c!11591 (and (not (= (bvand (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18049 (validMask!0 (mask!6228 (v!2552 (underlying!262 thiss!992))))))

(assert (=> d!18049 (= (getCurrentListMap!415 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))) lt!34576)))

(declare-fun bm!6878 () Bool)

(assert (=> bm!6878 (= call!6881 call!6879)))

(declare-fun bm!6879 () Bool)

(assert (=> bm!6879 (= call!6878 (contains!726 lt!34576 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6880 () Bool)

(assert (=> bm!6880 (= call!6882 call!6880)))

(declare-fun b!76155 () Bool)

(assert (=> b!76155 (= e!49743 call!6881)))

(declare-fun b!76156 () Bool)

(assert (=> b!76156 (= e!49736 (not call!6878))))

(declare-fun b!76157 () Bool)

(declare-fun res!40094 () Bool)

(assert (=> b!76157 (=> (not res!40094) (not e!49744))))

(assert (=> b!76157 (= res!40094 e!49738)))

(declare-fun res!40100 () Bool)

(assert (=> b!76157 (=> res!40100 e!49738)))

(assert (=> b!76157 (= res!40100 (not e!49740))))

(declare-fun res!40092 () Bool)

(assert (=> b!76157 (=> (not res!40092) (not e!49740))))

(assert (=> b!76157 (= res!40092 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun bm!6881 () Bool)

(assert (=> bm!6881 (= call!6879 (+!97 (ite c!11591 call!6883 (ite c!11592 call!6880 call!6882)) (ite (or c!11591 c!11592) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(declare-fun b!76158 () Bool)

(assert (=> b!76158 (= e!49733 (not call!6884))))

(assert (= (and d!18049 c!11591) b!76140))

(assert (= (and d!18049 (not c!11591)) b!76150))

(assert (= (and b!76150 c!11592) b!76138))

(assert (= (and b!76150 (not c!11592)) b!76148))

(assert (= (and b!76148 c!11588) b!76155))

(assert (= (and b!76148 (not c!11588)) b!76143))

(assert (= (or b!76155 b!76143) bm!6880))

(assert (= (or b!76138 bm!6880) bm!6875))

(assert (= (or b!76138 b!76155) bm!6878))

(assert (= (or b!76140 bm!6875) bm!6876))

(assert (= (or b!76140 bm!6878) bm!6881))

(assert (= (and d!18049 res!40097) b!76146))

(assert (= (and d!18049 c!11587) b!76142))

(assert (= (and d!18049 (not c!11587)) b!76144))

(assert (= (and d!18049 res!40096) b!76157))

(assert (= (and b!76157 res!40092) b!76141))

(assert (= (and b!76157 (not res!40100)) b!76145))

(assert (= (and b!76145 res!40095) b!76139))

(assert (= (and b!76157 res!40094) b!76149))

(assert (= (and b!76149 c!11589) b!76147))

(assert (= (and b!76149 (not c!11589)) b!76156))

(assert (= (and b!76147 res!40093) b!76152))

(assert (= (or b!76147 b!76156) bm!6879))

(assert (= (and b!76149 res!40099) b!76154))

(assert (= (and b!76154 c!11590) b!76151))

(assert (= (and b!76154 (not c!11590)) b!76158))

(assert (= (and b!76151 res!40098) b!76153))

(assert (= (or b!76151 b!76158) bm!6877))

(declare-fun b_lambda!3405 () Bool)

(assert (=> (not b_lambda!3405) (not b!76139)))

(assert (=> b!76139 t!5075))

(declare-fun b_and!4645 () Bool)

(assert (= b_and!4625 (and (=> t!5075 result!2721) b_and!4645)))

(assert (=> b!76139 t!5077))

(declare-fun b_and!4647 () Bool)

(assert (= b_and!4627 (and (=> t!5077 result!2725) b_and!4647)))

(assert (=> bm!6876 m!75391))

(assert (=> b!76146 m!75551))

(assert (=> b!76146 m!75551))

(declare-fun m!75645 () Bool)

(assert (=> b!76146 m!75645))

(assert (=> b!76141 m!75551))

(assert (=> b!76141 m!75551))

(assert (=> b!76141 m!75645))

(assert (=> d!18049 m!75381))

(declare-fun m!75647 () Bool)

(assert (=> b!76152 m!75647))

(declare-fun m!75649 () Bool)

(assert (=> b!76140 m!75649))

(declare-fun m!75651 () Bool)

(assert (=> bm!6881 m!75651))

(declare-fun m!75653 () Bool)

(assert (=> b!76139 m!75653))

(assert (=> b!76139 m!75423))

(declare-fun m!75655 () Bool)

(assert (=> b!76139 m!75655))

(assert (=> b!76139 m!75423))

(assert (=> b!76139 m!75551))

(declare-fun m!75657 () Bool)

(assert (=> b!76139 m!75657))

(assert (=> b!76139 m!75551))

(assert (=> b!76139 m!75653))

(declare-fun m!75659 () Bool)

(assert (=> bm!6879 m!75659))

(declare-fun m!75661 () Bool)

(assert (=> b!76153 m!75661))

(declare-fun m!75663 () Bool)

(assert (=> b!76142 m!75663))

(declare-fun m!75665 () Bool)

(assert (=> b!76142 m!75665))

(declare-fun m!75667 () Bool)

(assert (=> b!76142 m!75667))

(assert (=> b!76142 m!75663))

(declare-fun m!75669 () Bool)

(assert (=> b!76142 m!75669))

(declare-fun m!75671 () Bool)

(assert (=> b!76142 m!75671))

(declare-fun m!75673 () Bool)

(assert (=> b!76142 m!75673))

(declare-fun m!75675 () Bool)

(assert (=> b!76142 m!75675))

(assert (=> b!76142 m!75665))

(declare-fun m!75677 () Bool)

(assert (=> b!76142 m!75677))

(declare-fun m!75679 () Bool)

(assert (=> b!76142 m!75679))

(declare-fun m!75681 () Bool)

(assert (=> b!76142 m!75681))

(declare-fun m!75683 () Bool)

(assert (=> b!76142 m!75683))

(declare-fun m!75685 () Bool)

(assert (=> b!76142 m!75685))

(assert (=> b!76142 m!75391))

(declare-fun m!75687 () Bool)

(assert (=> b!76142 m!75687))

(assert (=> b!76142 m!75679))

(declare-fun m!75689 () Bool)

(assert (=> b!76142 m!75689))

(assert (=> b!76142 m!75671))

(assert (=> b!76142 m!75551))

(declare-fun m!75691 () Bool)

(assert (=> b!76142 m!75691))

(assert (=> b!76145 m!75551))

(assert (=> b!76145 m!75551))

(declare-fun m!75693 () Bool)

(assert (=> b!76145 m!75693))

(declare-fun m!75695 () Bool)

(assert (=> bm!6877 m!75695))

(assert (=> b!75779 d!18049))

(declare-fun d!18051 () Bool)

(declare-fun c!11595 () Bool)

(assert (=> d!18051 (= c!11595 ((_ is ValueCellFull!899) (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun e!49748 () V!2961)

(assert (=> d!18051 (= (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) from!355) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!49748)))

(declare-fun b!76163 () Bool)

(declare-fun get!1158 (ValueCell!899 V!2961) V!2961)

(assert (=> b!76163 (= e!49748 (get!1158 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) from!355) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!76164 () Bool)

(declare-fun get!1159 (ValueCell!899 V!2961) V!2961)

(assert (=> b!76164 (= e!49748 (get!1159 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) from!355) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18051 c!11595) b!76163))

(assert (= (and d!18051 (not c!11595)) b!76164))

(assert (=> b!76163 m!75421))

(assert (=> b!76163 m!75423))

(declare-fun m!75697 () Bool)

(assert (=> b!76163 m!75697))

(assert (=> b!76164 m!75421))

(assert (=> b!76164 m!75423))

(declare-fun m!75699 () Bool)

(assert (=> b!76164 m!75699))

(assert (=> b!75787 d!18051))

(declare-fun d!18053 () Bool)

(declare-fun e!49751 () Bool)

(assert (=> d!18053 e!49751))

(declare-fun res!40106 () Bool)

(assert (=> d!18053 (=> (not res!40106) (not e!49751))))

(declare-fun lt!34603 () ListLongMap!1415)

(assert (=> d!18053 (= res!40106 (contains!726 lt!34603 (_1!1080 lt!34352)))))

(declare-fun lt!34602 () List!1494)

(assert (=> d!18053 (= lt!34603 (ListLongMap!1416 lt!34602))))

(declare-fun lt!34601 () Unit!2179)

(declare-fun lt!34604 () Unit!2179)

(assert (=> d!18053 (= lt!34601 lt!34604)))

(assert (=> d!18053 (= (getValueByKey!133 lt!34602 (_1!1080 lt!34352)) (Some!138 (_2!1080 lt!34352)))))

(declare-fun lemmaContainsTupThenGetReturnValue!53 (List!1494 (_ BitVec 64) V!2961) Unit!2179)

(assert (=> d!18053 (= lt!34604 (lemmaContainsTupThenGetReturnValue!53 lt!34602 (_1!1080 lt!34352) (_2!1080 lt!34352)))))

(declare-fun insertStrictlySorted!56 (List!1494 (_ BitVec 64) V!2961) List!1494)

(assert (=> d!18053 (= lt!34602 (insertStrictlySorted!56 (toList!723 lt!34345) (_1!1080 lt!34352) (_2!1080 lt!34352)))))

(assert (=> d!18053 (= (+!97 lt!34345 lt!34352) lt!34603)))

(declare-fun b!76169 () Bool)

(declare-fun res!40105 () Bool)

(assert (=> b!76169 (=> (not res!40105) (not e!49751))))

(assert (=> b!76169 (= res!40105 (= (getValueByKey!133 (toList!723 lt!34603) (_1!1080 lt!34352)) (Some!138 (_2!1080 lt!34352))))))

(declare-fun b!76170 () Bool)

(declare-fun contains!730 (List!1494 tuple2!2138) Bool)

(assert (=> b!76170 (= e!49751 (contains!730 (toList!723 lt!34603) lt!34352))))

(assert (= (and d!18053 res!40106) b!76169))

(assert (= (and b!76169 res!40105) b!76170))

(declare-fun m!75701 () Bool)

(assert (=> d!18053 m!75701))

(declare-fun m!75703 () Bool)

(assert (=> d!18053 m!75703))

(declare-fun m!75705 () Bool)

(assert (=> d!18053 m!75705))

(declare-fun m!75707 () Bool)

(assert (=> d!18053 m!75707))

(declare-fun m!75709 () Bool)

(assert (=> b!76169 m!75709))

(declare-fun m!75711 () Bool)

(assert (=> b!76170 m!75711))

(assert (=> b!75786 d!18053))

(declare-fun b!76195 () Bool)

(declare-fun res!40115 () Bool)

(declare-fun e!49766 () Bool)

(assert (=> b!76195 (=> (not res!40115) (not e!49766))))

(declare-fun lt!34620 () ListLongMap!1415)

(assert (=> b!76195 (= res!40115 (not (contains!726 lt!34620 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!6884 () Bool)

(declare-fun call!6887 () ListLongMap!1415)

(assert (=> bm!6884 (= call!6887 (getCurrentListMapNoExtraKeys!61 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun b!76196 () Bool)

(declare-fun lt!34621 () Unit!2179)

(declare-fun lt!34625 () Unit!2179)

(assert (=> b!76196 (= lt!34621 lt!34625)))

(declare-fun lt!34622 () ListLongMap!1415)

(declare-fun lt!34623 () (_ BitVec 64))

(declare-fun lt!34624 () (_ BitVec 64))

(declare-fun lt!34619 () V!2961)

(assert (=> b!76196 (not (contains!726 (+!97 lt!34622 (tuple2!2139 lt!34623 lt!34619)) lt!34624))))

(declare-fun addStillNotContains!27 (ListLongMap!1415 (_ BitVec 64) V!2961 (_ BitVec 64)) Unit!2179)

(assert (=> b!76196 (= lt!34625 (addStillNotContains!27 lt!34622 lt!34623 lt!34619 lt!34624))))

(assert (=> b!76196 (= lt!34624 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!76196 (= lt!34619 (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76196 (= lt!34623 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!76196 (= lt!34622 call!6887)))

(declare-fun e!49770 () ListLongMap!1415)

(assert (=> b!76196 (= e!49770 (+!97 call!6887 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!76197 () Bool)

(declare-fun e!49771 () Bool)

(declare-fun isEmpty!326 (ListLongMap!1415) Bool)

(assert (=> b!76197 (= e!49771 (isEmpty!326 lt!34620))))

(declare-fun b!76198 () Bool)

(assert (=> b!76198 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(assert (=> b!76198 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2100 (_values!2229 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun e!49769 () Bool)

(assert (=> b!76198 (= e!49769 (= (apply!77 lt!34620 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!76199 () Bool)

(declare-fun e!49772 () ListLongMap!1415)

(assert (=> b!76199 (= e!49772 (ListLongMap!1416 Nil!1491))))

(declare-fun b!76200 () Bool)

(assert (=> b!76200 (= e!49772 e!49770)))

(declare-fun c!11607 () Bool)

(assert (=> b!76200 (= c!11607 (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!76201 () Bool)

(assert (=> b!76201 (= e!49771 (= lt!34620 (getCurrentListMapNoExtraKeys!61 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun b!76202 () Bool)

(declare-fun e!49768 () Bool)

(assert (=> b!76202 (= e!49766 e!49768)))

(declare-fun c!11606 () Bool)

(declare-fun e!49767 () Bool)

(assert (=> b!76202 (= c!11606 e!49767)))

(declare-fun res!40117 () Bool)

(assert (=> b!76202 (=> (not res!40117) (not e!49767))))

(assert (=> b!76202 (= res!40117 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun d!18055 () Bool)

(assert (=> d!18055 e!49766))

(declare-fun res!40118 () Bool)

(assert (=> d!18055 (=> (not res!40118) (not e!49766))))

(assert (=> d!18055 (= res!40118 (not (contains!726 lt!34620 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18055 (= lt!34620 e!49772)))

(declare-fun c!11604 () Bool)

(assert (=> d!18055 (= c!11604 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(assert (=> d!18055 (validMask!0 (mask!6228 (v!2552 (underlying!262 thiss!992))))))

(assert (=> d!18055 (= (getCurrentListMapNoExtraKeys!61 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))) lt!34620)))

(declare-fun b!76203 () Bool)

(assert (=> b!76203 (= e!49767 (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!76203 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!76204 () Bool)

(assert (=> b!76204 (= e!49770 call!6887)))

(declare-fun b!76205 () Bool)

(assert (=> b!76205 (= e!49768 e!49769)))

(assert (=> b!76205 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun res!40116 () Bool)

(assert (=> b!76205 (= res!40116 (contains!726 lt!34620 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!76205 (=> (not res!40116) (not e!49769))))

(declare-fun b!76206 () Bool)

(assert (=> b!76206 (= e!49768 e!49771)))

(declare-fun c!11605 () Bool)

(assert (=> b!76206 (= c!11605 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(assert (= (and d!18055 c!11604) b!76199))

(assert (= (and d!18055 (not c!11604)) b!76200))

(assert (= (and b!76200 c!11607) b!76196))

(assert (= (and b!76200 (not c!11607)) b!76204))

(assert (= (or b!76196 b!76204) bm!6884))

(assert (= (and d!18055 res!40118) b!76195))

(assert (= (and b!76195 res!40115) b!76202))

(assert (= (and b!76202 res!40117) b!76203))

(assert (= (and b!76202 c!11606) b!76205))

(assert (= (and b!76202 (not c!11606)) b!76206))

(assert (= (and b!76205 res!40116) b!76198))

(assert (= (and b!76206 c!11605) b!76201))

(assert (= (and b!76206 (not c!11605)) b!76197))

(declare-fun b_lambda!3407 () Bool)

(assert (=> (not b_lambda!3407) (not b!76196)))

(assert (=> b!76196 t!5075))

(declare-fun b_and!4649 () Bool)

(assert (= b_and!4645 (and (=> t!5075 result!2721) b_and!4649)))

(assert (=> b!76196 t!5077))

(declare-fun b_and!4651 () Bool)

(assert (= b_and!4647 (and (=> t!5077 result!2725) b_and!4651)))

(declare-fun b_lambda!3409 () Bool)

(assert (=> (not b_lambda!3409) (not b!76198)))

(assert (=> b!76198 t!5075))

(declare-fun b_and!4653 () Bool)

(assert (= b_and!4649 (and (=> t!5075 result!2721) b_and!4653)))

(assert (=> b!76198 t!5077))

(declare-fun b_and!4655 () Bool)

(assert (= b_and!4651 (and (=> t!5077 result!2725) b_and!4655)))

(declare-fun m!75713 () Bool)

(assert (=> b!76195 m!75713))

(assert (=> b!76205 m!75551))

(assert (=> b!76205 m!75551))

(declare-fun m!75715 () Bool)

(assert (=> b!76205 m!75715))

(assert (=> b!76203 m!75551))

(assert (=> b!76203 m!75551))

(assert (=> b!76203 m!75645))

(declare-fun m!75717 () Bool)

(assert (=> b!76201 m!75717))

(assert (=> b!76196 m!75551))

(declare-fun m!75719 () Bool)

(assert (=> b!76196 m!75719))

(declare-fun m!75721 () Bool)

(assert (=> b!76196 m!75721))

(assert (=> b!76196 m!75423))

(declare-fun m!75723 () Bool)

(assert (=> b!76196 m!75723))

(assert (=> b!76196 m!75719))

(declare-fun m!75725 () Bool)

(assert (=> b!76196 m!75725))

(assert (=> b!76196 m!75653))

(assert (=> b!76196 m!75653))

(assert (=> b!76196 m!75423))

(assert (=> b!76196 m!75655))

(declare-fun m!75727 () Bool)

(assert (=> b!76197 m!75727))

(assert (=> b!76198 m!75551))

(assert (=> b!76198 m!75423))

(assert (=> b!76198 m!75551))

(declare-fun m!75729 () Bool)

(assert (=> b!76198 m!75729))

(assert (=> b!76198 m!75653))

(assert (=> b!76198 m!75653))

(assert (=> b!76198 m!75423))

(assert (=> b!76198 m!75655))

(assert (=> b!76200 m!75551))

(assert (=> b!76200 m!75551))

(assert (=> b!76200 m!75645))

(assert (=> bm!6884 m!75717))

(declare-fun m!75731 () Bool)

(assert (=> d!18055 m!75731))

(assert (=> d!18055 m!75381))

(assert (=> b!75786 d!18055))

(declare-fun d!18057 () Bool)

(declare-fun e!49773 () Bool)

(assert (=> d!18057 e!49773))

(declare-fun res!40120 () Bool)

(assert (=> d!18057 (=> (not res!40120) (not e!49773))))

(declare-fun lt!34628 () ListLongMap!1415)

(assert (=> d!18057 (= res!40120 (contains!726 lt!34628 (_1!1080 lt!34342)))))

(declare-fun lt!34627 () List!1494)

(assert (=> d!18057 (= lt!34628 (ListLongMap!1416 lt!34627))))

(declare-fun lt!34626 () Unit!2179)

(declare-fun lt!34629 () Unit!2179)

(assert (=> d!18057 (= lt!34626 lt!34629)))

(assert (=> d!18057 (= (getValueByKey!133 lt!34627 (_1!1080 lt!34342)) (Some!138 (_2!1080 lt!34342)))))

(assert (=> d!18057 (= lt!34629 (lemmaContainsTupThenGetReturnValue!53 lt!34627 (_1!1080 lt!34342) (_2!1080 lt!34342)))))

(assert (=> d!18057 (= lt!34627 (insertStrictlySorted!56 (toList!723 lt!34345) (_1!1080 lt!34342) (_2!1080 lt!34342)))))

(assert (=> d!18057 (= (+!97 lt!34345 lt!34342) lt!34628)))

(declare-fun b!76207 () Bool)

(declare-fun res!40119 () Bool)

(assert (=> b!76207 (=> (not res!40119) (not e!49773))))

(assert (=> b!76207 (= res!40119 (= (getValueByKey!133 (toList!723 lt!34628) (_1!1080 lt!34342)) (Some!138 (_2!1080 lt!34342))))))

(declare-fun b!76208 () Bool)

(assert (=> b!76208 (= e!49773 (contains!730 (toList!723 lt!34628) lt!34342))))

(assert (= (and d!18057 res!40120) b!76207))

(assert (= (and b!76207 res!40119) b!76208))

(declare-fun m!75733 () Bool)

(assert (=> d!18057 m!75733))

(declare-fun m!75735 () Bool)

(assert (=> d!18057 m!75735))

(declare-fun m!75737 () Bool)

(assert (=> d!18057 m!75737))

(declare-fun m!75739 () Bool)

(assert (=> d!18057 m!75739))

(declare-fun m!75741 () Bool)

(assert (=> b!76207 m!75741))

(declare-fun m!75743 () Bool)

(assert (=> b!76208 m!75743))

(assert (=> b!75786 d!18057))

(declare-fun d!18059 () Bool)

(declare-fun e!49774 () Bool)

(assert (=> d!18059 e!49774))

(declare-fun res!40122 () Bool)

(assert (=> d!18059 (=> (not res!40122) (not e!49774))))

(declare-fun lt!34632 () ListLongMap!1415)

(assert (=> d!18059 (= res!40122 (contains!726 lt!34632 (_1!1080 lt!34352)))))

(declare-fun lt!34631 () List!1494)

(assert (=> d!18059 (= lt!34632 (ListLongMap!1416 lt!34631))))

(declare-fun lt!34630 () Unit!2179)

(declare-fun lt!34633 () Unit!2179)

(assert (=> d!18059 (= lt!34630 lt!34633)))

(assert (=> d!18059 (= (getValueByKey!133 lt!34631 (_1!1080 lt!34352)) (Some!138 (_2!1080 lt!34352)))))

(assert (=> d!18059 (= lt!34633 (lemmaContainsTupThenGetReturnValue!53 lt!34631 (_1!1080 lt!34352) (_2!1080 lt!34352)))))

(assert (=> d!18059 (= lt!34631 (insertStrictlySorted!56 (toList!723 (+!97 lt!34345 lt!34342)) (_1!1080 lt!34352) (_2!1080 lt!34352)))))

(assert (=> d!18059 (= (+!97 (+!97 lt!34345 lt!34342) lt!34352) lt!34632)))

(declare-fun b!76209 () Bool)

(declare-fun res!40121 () Bool)

(assert (=> b!76209 (=> (not res!40121) (not e!49774))))

(assert (=> b!76209 (= res!40121 (= (getValueByKey!133 (toList!723 lt!34632) (_1!1080 lt!34352)) (Some!138 (_2!1080 lt!34352))))))

(declare-fun b!76210 () Bool)

(assert (=> b!76210 (= e!49774 (contains!730 (toList!723 lt!34632) lt!34352))))

(assert (= (and d!18059 res!40122) b!76209))

(assert (= (and b!76209 res!40121) b!76210))

(declare-fun m!75745 () Bool)

(assert (=> d!18059 m!75745))

(declare-fun m!75747 () Bool)

(assert (=> d!18059 m!75747))

(declare-fun m!75749 () Bool)

(assert (=> d!18059 m!75749))

(declare-fun m!75751 () Bool)

(assert (=> d!18059 m!75751))

(declare-fun m!75753 () Bool)

(assert (=> b!76209 m!75753))

(declare-fun m!75755 () Bool)

(assert (=> b!76210 m!75755))

(assert (=> b!75786 d!18059))

(declare-fun d!18061 () Bool)

(assert (=> d!18061 (= (validMask!0 (mask!6228 (v!2552 (underlying!262 thiss!992)))) (and (or (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000001111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000011111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000001111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000011111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000001111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000011111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000000001111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000000011111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000000111111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000001111111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000011111111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000000111111111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000001111111111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000011111111111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000000111111111111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000001111111111111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000011111111111111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000000111111111111111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000001111111111111111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000011111111111111111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00000111111111111111111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00001111111111111111111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00011111111111111111111111111111) (= (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6228 (v!2552 (underlying!262 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!75786 d!18061))

(declare-fun d!18063 () Bool)

(declare-fun e!49775 () Bool)

(assert (=> d!18063 e!49775))

(declare-fun res!40124 () Bool)

(assert (=> d!18063 (=> (not res!40124) (not e!49775))))

(declare-fun lt!34636 () ListLongMap!1415)

(assert (=> d!18063 (= res!40124 (contains!726 lt!34636 (_1!1080 lt!34342)))))

(declare-fun lt!34635 () List!1494)

(assert (=> d!18063 (= lt!34636 (ListLongMap!1416 lt!34635))))

(declare-fun lt!34634 () Unit!2179)

(declare-fun lt!34637 () Unit!2179)

(assert (=> d!18063 (= lt!34634 lt!34637)))

(assert (=> d!18063 (= (getValueByKey!133 lt!34635 (_1!1080 lt!34342)) (Some!138 (_2!1080 lt!34342)))))

(assert (=> d!18063 (= lt!34637 (lemmaContainsTupThenGetReturnValue!53 lt!34635 (_1!1080 lt!34342) (_2!1080 lt!34342)))))

(assert (=> d!18063 (= lt!34635 (insertStrictlySorted!56 (toList!723 (+!97 lt!34345 lt!34352)) (_1!1080 lt!34342) (_2!1080 lt!34342)))))

(assert (=> d!18063 (= (+!97 (+!97 lt!34345 lt!34352) lt!34342) lt!34636)))

(declare-fun b!76211 () Bool)

(declare-fun res!40123 () Bool)

(assert (=> b!76211 (=> (not res!40123) (not e!49775))))

(assert (=> b!76211 (= res!40123 (= (getValueByKey!133 (toList!723 lt!34636) (_1!1080 lt!34342)) (Some!138 (_2!1080 lt!34342))))))

(declare-fun b!76212 () Bool)

(assert (=> b!76212 (= e!49775 (contains!730 (toList!723 lt!34636) lt!34342))))

(assert (= (and d!18063 res!40124) b!76211))

(assert (= (and b!76211 res!40123) b!76212))

(declare-fun m!75757 () Bool)

(assert (=> d!18063 m!75757))

(declare-fun m!75759 () Bool)

(assert (=> d!18063 m!75759))

(declare-fun m!75761 () Bool)

(assert (=> d!18063 m!75761))

(declare-fun m!75763 () Bool)

(assert (=> d!18063 m!75763))

(declare-fun m!75765 () Bool)

(assert (=> b!76211 m!75765))

(declare-fun m!75767 () Bool)

(assert (=> b!76212 m!75767))

(assert (=> b!75786 d!18063))

(declare-fun d!18065 () Bool)

(assert (=> d!18065 (= (+!97 (+!97 lt!34345 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) (+!97 (+!97 lt!34345 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)))))

(declare-fun lt!34640 () Unit!2179)

(declare-fun choose!446 (ListLongMap!1415 (_ BitVec 64) V!2961 (_ BitVec 64) V!2961) Unit!2179)

(assert (=> d!18065 (= lt!34640 (choose!446 lt!34345 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))

(assert (=> d!18065 (not (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18065 (= (addCommutativeForDiffKeys!16 lt!34345 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))) lt!34640)))

(declare-fun bs!3253 () Bool)

(assert (= bs!3253 d!18065))

(declare-fun m!75769 () Bool)

(assert (=> bs!3253 m!75769))

(declare-fun m!75771 () Bool)

(assert (=> bs!3253 m!75771))

(assert (=> bs!3253 m!75769))

(declare-fun m!75773 () Bool)

(assert (=> bs!3253 m!75773))

(assert (=> bs!3253 m!75383))

(declare-fun m!75775 () Bool)

(assert (=> bs!3253 m!75775))

(assert (=> bs!3253 m!75771))

(declare-fun m!75777 () Bool)

(assert (=> bs!3253 m!75777))

(assert (=> b!75786 d!18065))

(declare-fun b!76221 () Bool)

(declare-fun e!49783 () Bool)

(declare-fun e!49782 () Bool)

(assert (=> b!76221 (= e!49783 e!49782)))

(declare-fun c!11610 () Bool)

(assert (=> b!76221 (= c!11610 (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!76222 () Bool)

(declare-fun call!6890 () Bool)

(assert (=> b!76222 (= e!49782 call!6890)))

(declare-fun b!76223 () Bool)

(declare-fun e!49784 () Bool)

(assert (=> b!76223 (= e!49782 e!49784)))

(declare-fun lt!34649 () (_ BitVec 64))

(assert (=> b!76223 (= lt!34649 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!34647 () Unit!2179)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3899 (_ BitVec 64) (_ BitVec 32)) Unit!2179)

(assert (=> b!76223 (= lt!34647 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) lt!34649 #b00000000000000000000000000000000))))

(assert (=> b!76223 (arrayContainsKey!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) lt!34649 #b00000000000000000000000000000000)))

(declare-fun lt!34648 () Unit!2179)

(assert (=> b!76223 (= lt!34648 lt!34647)))

(declare-fun res!40130 () Bool)

(assert (=> b!76223 (= res!40130 (= (seekEntryOrOpen!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000) (_keys!3903 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992)))) (Found!241 #b00000000000000000000000000000000)))))

(assert (=> b!76223 (=> (not res!40130) (not e!49784))))

(declare-fun bm!6887 () Bool)

(assert (=> bm!6887 (= call!6890 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3903 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun d!18067 () Bool)

(declare-fun res!40129 () Bool)

(assert (=> d!18067 (=> res!40129 e!49783)))

(assert (=> d!18067 (= res!40129 (bvsge #b00000000000000000000000000000000 (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(assert (=> d!18067 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992)))) e!49783)))

(declare-fun b!76224 () Bool)

(assert (=> b!76224 (= e!49784 call!6890)))

(assert (= (and d!18067 (not res!40129)) b!76221))

(assert (= (and b!76221 c!11610) b!76223))

(assert (= (and b!76221 (not c!11610)) b!76222))

(assert (= (and b!76223 res!40130) b!76224))

(assert (= (or b!76224 b!76222) bm!6887))

(assert (=> b!76221 m!75573))

(assert (=> b!76221 m!75573))

(assert (=> b!76221 m!75577))

(assert (=> b!76223 m!75573))

(declare-fun m!75779 () Bool)

(assert (=> b!76223 m!75779))

(declare-fun m!75781 () Bool)

(assert (=> b!76223 m!75781))

(assert (=> b!76223 m!75573))

(declare-fun m!75783 () Bool)

(assert (=> b!76223 m!75783))

(declare-fun m!75785 () Bool)

(assert (=> bm!6887 m!75785))

(assert (=> b!75767 d!18067))

(declare-fun b!76232 () Bool)

(declare-fun e!49789 () Bool)

(assert (=> b!76232 (= e!49789 tp_is_empty!2485)))

(declare-fun condMapEmpty!3231 () Bool)

(declare-fun mapDefault!3231 () ValueCell!899)

(assert (=> mapNonEmpty!3216 (= condMapEmpty!3231 (= mapRest!3215 ((as const (Array (_ BitVec 32) ValueCell!899)) mapDefault!3231)))))

(declare-fun mapRes!3231 () Bool)

(assert (=> mapNonEmpty!3216 (= tp!8602 (and e!49789 mapRes!3231))))

(declare-fun mapIsEmpty!3231 () Bool)

(assert (=> mapIsEmpty!3231 mapRes!3231))

(declare-fun b!76231 () Bool)

(declare-fun e!49790 () Bool)

(assert (=> b!76231 (= e!49790 tp_is_empty!2485)))

(declare-fun mapNonEmpty!3231 () Bool)

(declare-fun tp!8631 () Bool)

(assert (=> mapNonEmpty!3231 (= mapRes!3231 (and tp!8631 e!49790))))

(declare-fun mapKey!3231 () (_ BitVec 32))

(declare-fun mapRest!3231 () (Array (_ BitVec 32) ValueCell!899))

(declare-fun mapValue!3231 () ValueCell!899)

(assert (=> mapNonEmpty!3231 (= mapRest!3215 (store mapRest!3231 mapKey!3231 mapValue!3231))))

(assert (= (and mapNonEmpty!3216 condMapEmpty!3231) mapIsEmpty!3231))

(assert (= (and mapNonEmpty!3216 (not condMapEmpty!3231)) mapNonEmpty!3231))

(assert (= (and mapNonEmpty!3231 ((_ is ValueCellFull!899) mapValue!3231)) b!76231))

(assert (= (and mapNonEmpty!3216 ((_ is ValueCellFull!899) mapDefault!3231)) b!76232))

(declare-fun m!75787 () Bool)

(assert (=> mapNonEmpty!3231 m!75787))

(declare-fun b!76234 () Bool)

(declare-fun e!49791 () Bool)

(assert (=> b!76234 (= e!49791 tp_is_empty!2485)))

(declare-fun condMapEmpty!3232 () Bool)

(declare-fun mapDefault!3232 () ValueCell!899)

(assert (=> mapNonEmpty!3215 (= condMapEmpty!3232 (= mapRest!3216 ((as const (Array (_ BitVec 32) ValueCell!899)) mapDefault!3232)))))

(declare-fun mapRes!3232 () Bool)

(assert (=> mapNonEmpty!3215 (= tp!8604 (and e!49791 mapRes!3232))))

(declare-fun mapIsEmpty!3232 () Bool)

(assert (=> mapIsEmpty!3232 mapRes!3232))

(declare-fun b!76233 () Bool)

(declare-fun e!49792 () Bool)

(assert (=> b!76233 (= e!49792 tp_is_empty!2485)))

(declare-fun mapNonEmpty!3232 () Bool)

(declare-fun tp!8632 () Bool)

(assert (=> mapNonEmpty!3232 (= mapRes!3232 (and tp!8632 e!49792))))

(declare-fun mapKey!3232 () (_ BitVec 32))

(declare-fun mapRest!3232 () (Array (_ BitVec 32) ValueCell!899))

(declare-fun mapValue!3232 () ValueCell!899)

(assert (=> mapNonEmpty!3232 (= mapRest!3216 (store mapRest!3232 mapKey!3232 mapValue!3232))))

(assert (= (and mapNonEmpty!3215 condMapEmpty!3232) mapIsEmpty!3232))

(assert (= (and mapNonEmpty!3215 (not condMapEmpty!3232)) mapNonEmpty!3232))

(assert (= (and mapNonEmpty!3232 ((_ is ValueCellFull!899) mapValue!3232)) b!76233))

(assert (= (and mapNonEmpty!3215 ((_ is ValueCellFull!899) mapDefault!3232)) b!76234))

(declare-fun m!75789 () Bool)

(assert (=> mapNonEmpty!3232 m!75789))

(declare-fun b_lambda!3411 () Bool)

(assert (= b_lambda!3407 (or (and b!75774 b_free!2137) (and b!75783 b_free!2139 (= (defaultEntry!2246 newMap!16) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))))) b_lambda!3411)))

(declare-fun b_lambda!3413 () Bool)

(assert (= b_lambda!3405 (or (and b!75774 b_free!2137) (and b!75783 b_free!2139 (= (defaultEntry!2246 newMap!16) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))))) b_lambda!3413)))

(declare-fun b_lambda!3415 () Bool)

(assert (= b_lambda!3409 (or (and b!75774 b_free!2137) (and b!75783 b_free!2139 (= (defaultEntry!2246 newMap!16) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))))) b_lambda!3415)))

(check-sat (not b!75963) (not d!18053) tp_is_empty!2485 (not bm!6787) (not bm!6860) (not b!75949) (not bm!6884) (not b_lambda!3403) (not d!18063) (not d!18029) (not b_lambda!3411) (not b!76081) (not bm!6838) (not b_lambda!3415) (not b!75975) (not b_next!2137) (not b!76163) (not bm!6839) (not b!76195) (not b!76203) (not b!76067) (not d!18045) (not bm!6788) (not b!76078) (not b!75961) (not b!76140) (not b!75959) (not b!75965) (not b!76221) (not b!76212) (not d!18055) (not b!75962) (not bm!6840) (not d!18065) (not bm!6879) (not mapNonEmpty!3232) (not d!18049) (not bm!6846) (not b!76211) (not b!76058) (not d!18057) (not b!76153) (not b!76205) (not b!75960) (not d!18027) (not b!76164) (not b!76201) (not b!76170) (not b!76093) (not b!76208) (not b!76196) (not b!76200) (not d!18047) (not bm!6857) (not b!75973) (not bm!6848) (not d!18043) (not b!75951) (not b!76056) (not b!76141) (not b!76169) b_and!4655 (not bm!6876) (not b_next!2139) (not bm!6851) (not b!76209) (not bm!6887) (not b!75931) (not b!75948) (not d!18037) (not bm!6853) (not b_lambda!3413) (not b!76207) (not bm!6881) (not b!76223) (not b!76152) (not b!76197) (not b!76145) (not b!76142) (not mapNonEmpty!3231) (not d!18033) (not d!18059) b_and!4653 (not bm!6837) (not b!76139) (not b!76095) (not d!18039) (not bm!6877) (not bm!6849) (not b!76146) (not b!76210) (not b!75936) (not b!76198) (not bm!6842))
(check-sat b_and!4653 b_and!4655 (not b_next!2137) (not b_next!2139))
(get-model)

(declare-fun b!76247 () Bool)

(declare-fun c!11617 () Bool)

(declare-fun lt!34658 () (_ BitVec 64))

(assert (=> b!76247 (= c!11617 (= lt!34658 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49801 () SeekEntryResult!241)

(declare-fun e!49799 () SeekEntryResult!241)

(assert (=> b!76247 (= e!49801 e!49799)))

(declare-fun b!76248 () Bool)

(declare-fun e!49800 () SeekEntryResult!241)

(assert (=> b!76248 (= e!49800 e!49801)))

(declare-fun lt!34657 () SeekEntryResult!241)

(assert (=> b!76248 (= lt!34658 (select (arr!1858 (_keys!3903 newMap!16)) (index!3099 lt!34657)))))

(declare-fun c!11618 () Bool)

(assert (=> b!76248 (= c!11618 (= lt!34658 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun b!76249 () Bool)

(assert (=> b!76249 (= e!49799 (MissingZero!241 (index!3099 lt!34657)))))

(declare-fun b!76250 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3899 (_ BitVec 32)) SeekEntryResult!241)

(assert (=> b!76250 (= e!49799 (seekKeyOrZeroReturnVacant!0 (x!11389 lt!34657) (index!3099 lt!34657) (index!3099 lt!34657) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (_keys!3903 newMap!16) (mask!6228 newMap!16)))))

(declare-fun d!18069 () Bool)

(declare-fun lt!34656 () SeekEntryResult!241)

(assert (=> d!18069 (and (or ((_ is Undefined!241) lt!34656) (not ((_ is Found!241) lt!34656)) (and (bvsge (index!3098 lt!34656) #b00000000000000000000000000000000) (bvslt (index!3098 lt!34656) (size!2099 (_keys!3903 newMap!16))))) (or ((_ is Undefined!241) lt!34656) ((_ is Found!241) lt!34656) (not ((_ is MissingZero!241) lt!34656)) (and (bvsge (index!3097 lt!34656) #b00000000000000000000000000000000) (bvslt (index!3097 lt!34656) (size!2099 (_keys!3903 newMap!16))))) (or ((_ is Undefined!241) lt!34656) ((_ is Found!241) lt!34656) ((_ is MissingZero!241) lt!34656) (not ((_ is MissingVacant!241) lt!34656)) (and (bvsge (index!3100 lt!34656) #b00000000000000000000000000000000) (bvslt (index!3100 lt!34656) (size!2099 (_keys!3903 newMap!16))))) (or ((_ is Undefined!241) lt!34656) (ite ((_ is Found!241) lt!34656) (= (select (arr!1858 (_keys!3903 newMap!16)) (index!3098 lt!34656)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) (ite ((_ is MissingZero!241) lt!34656) (= (select (arr!1858 (_keys!3903 newMap!16)) (index!3097 lt!34656)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!241) lt!34656) (= (select (arr!1858 (_keys!3903 newMap!16)) (index!3100 lt!34656)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18069 (= lt!34656 e!49800)))

(declare-fun c!11619 () Bool)

(assert (=> d!18069 (= c!11619 (and ((_ is Intermediate!241) lt!34657) (undefined!1053 lt!34657)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3899 (_ BitVec 32)) SeekEntryResult!241)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!18069 (= lt!34657 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (mask!6228 newMap!16)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (_keys!3903 newMap!16) (mask!6228 newMap!16)))))

(assert (=> d!18069 (validMask!0 (mask!6228 newMap!16))))

(assert (=> d!18069 (= (seekEntryOrOpen!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (_keys!3903 newMap!16) (mask!6228 newMap!16)) lt!34656)))

(declare-fun b!76251 () Bool)

(assert (=> b!76251 (= e!49800 Undefined!241)))

(declare-fun b!76252 () Bool)

(assert (=> b!76252 (= e!49801 (Found!241 (index!3099 lt!34657)))))

(assert (= (and d!18069 c!11619) b!76251))

(assert (= (and d!18069 (not c!11619)) b!76248))

(assert (= (and b!76248 c!11618) b!76252))

(assert (= (and b!76248 (not c!11618)) b!76247))

(assert (= (and b!76247 c!11617) b!76249))

(assert (= (and b!76247 (not c!11617)) b!76250))

(declare-fun m!75791 () Bool)

(assert (=> b!76248 m!75791))

(assert (=> b!76250 m!75383))

(declare-fun m!75793 () Bool)

(assert (=> b!76250 m!75793))

(assert (=> d!18069 m!75383))

(declare-fun m!75795 () Bool)

(assert (=> d!18069 m!75795))

(declare-fun m!75797 () Bool)

(assert (=> d!18069 m!75797))

(declare-fun m!75799 () Bool)

(assert (=> d!18069 m!75799))

(declare-fun m!75801 () Bool)

(assert (=> d!18069 m!75801))

(assert (=> d!18069 m!75795))

(assert (=> d!18069 m!75383))

(declare-fun m!75803 () Bool)

(assert (=> d!18069 m!75803))

(declare-fun m!75805 () Bool)

(assert (=> d!18069 m!75805))

(assert (=> bm!6857 d!18069))

(declare-fun d!18071 () Bool)

(declare-fun e!49802 () Bool)

(assert (=> d!18071 e!49802))

(declare-fun res!40132 () Bool)

(assert (=> d!18071 (=> (not res!40132) (not e!49802))))

(declare-fun lt!34661 () ListLongMap!1415)

(assert (=> d!18071 (= res!40132 (contains!726 lt!34661 (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))

(declare-fun lt!34660 () List!1494)

(assert (=> d!18071 (= lt!34661 (ListLongMap!1416 lt!34660))))

(declare-fun lt!34659 () Unit!2179)

(declare-fun lt!34662 () Unit!2179)

(assert (=> d!18071 (= lt!34659 lt!34662)))

(assert (=> d!18071 (= (getValueByKey!133 lt!34660 (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))) (Some!138 (_2!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))

(assert (=> d!18071 (= lt!34662 (lemmaContainsTupThenGetReturnValue!53 lt!34660 (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)) (_2!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))

(assert (=> d!18071 (= lt!34660 (insertStrictlySorted!56 (toList!723 call!6845) (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)) (_2!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))

(assert (=> d!18071 (= (+!97 call!6845 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)) lt!34661)))

(declare-fun b!76253 () Bool)

(declare-fun res!40131 () Bool)

(assert (=> b!76253 (=> (not res!40131) (not e!49802))))

(assert (=> b!76253 (= res!40131 (= (getValueByKey!133 (toList!723 lt!34661) (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))) (Some!138 (_2!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)))))))

(declare-fun b!76254 () Bool)

(assert (=> b!76254 (= e!49802 (contains!730 (toList!723 lt!34661) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)))))

(assert (= (and d!18071 res!40132) b!76253))

(assert (= (and b!76253 res!40131) b!76254))

(declare-fun m!75807 () Bool)

(assert (=> d!18071 m!75807))

(declare-fun m!75809 () Bool)

(assert (=> d!18071 m!75809))

(declare-fun m!75811 () Bool)

(assert (=> d!18071 m!75811))

(declare-fun m!75813 () Bool)

(assert (=> d!18071 m!75813))

(declare-fun m!75815 () Bool)

(assert (=> b!76253 m!75815))

(declare-fun m!75817 () Bool)

(assert (=> b!76254 m!75817))

(assert (=> b!76078 d!18071))

(declare-fun d!18073 () Bool)

(declare-fun res!40137 () Bool)

(declare-fun e!49807 () Bool)

(assert (=> d!18073 (=> res!40137 e!49807)))

(assert (=> d!18073 (= res!40137 (and ((_ is Cons!1490) (toList!723 lt!34347)) (= (_1!1080 (h!2078 (toList!723 lt!34347))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355))))))

(assert (=> d!18073 (= (containsKey!137 (toList!723 lt!34347) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) e!49807)))

(declare-fun b!76259 () Bool)

(declare-fun e!49808 () Bool)

(assert (=> b!76259 (= e!49807 e!49808)))

(declare-fun res!40138 () Bool)

(assert (=> b!76259 (=> (not res!40138) (not e!49808))))

(assert (=> b!76259 (= res!40138 (and (or (not ((_ is Cons!1490) (toList!723 lt!34347))) (bvsle (_1!1080 (h!2078 (toList!723 lt!34347))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355))) ((_ is Cons!1490) (toList!723 lt!34347)) (bvslt (_1!1080 (h!2078 (toList!723 lt!34347))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355))))))

(declare-fun b!76260 () Bool)

(assert (=> b!76260 (= e!49808 (containsKey!137 (t!5079 (toList!723 lt!34347)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(assert (= (and d!18073 (not res!40137)) b!76259))

(assert (= (and b!76259 res!40138) b!76260))

(assert (=> b!76260 m!75383))

(declare-fun m!75819 () Bool)

(assert (=> b!76260 m!75819))

(assert (=> d!18043 d!18073))

(declare-fun d!18075 () Bool)

(declare-fun e!49809 () Bool)

(assert (=> d!18075 e!49809))

(declare-fun res!40139 () Bool)

(assert (=> d!18075 (=> res!40139 e!49809)))

(declare-fun lt!34666 () Bool)

(assert (=> d!18075 (= res!40139 (not lt!34666))))

(declare-fun lt!34665 () Bool)

(assert (=> d!18075 (= lt!34666 lt!34665)))

(declare-fun lt!34664 () Unit!2179)

(declare-fun e!49810 () Unit!2179)

(assert (=> d!18075 (= lt!34664 e!49810)))

(declare-fun c!11620 () Bool)

(assert (=> d!18075 (= c!11620 lt!34665)))

(assert (=> d!18075 (= lt!34665 (containsKey!137 (toList!723 lt!34632) (_1!1080 lt!34352)))))

(assert (=> d!18075 (= (contains!726 lt!34632 (_1!1080 lt!34352)) lt!34666)))

(declare-fun b!76261 () Bool)

(declare-fun lt!34663 () Unit!2179)

(assert (=> b!76261 (= e!49810 lt!34663)))

(assert (=> b!76261 (= lt!34663 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 lt!34632) (_1!1080 lt!34352)))))

(assert (=> b!76261 (isDefined!87 (getValueByKey!133 (toList!723 lt!34632) (_1!1080 lt!34352)))))

(declare-fun b!76262 () Bool)

(declare-fun Unit!2194 () Unit!2179)

(assert (=> b!76262 (= e!49810 Unit!2194)))

(declare-fun b!76263 () Bool)

(assert (=> b!76263 (= e!49809 (isDefined!87 (getValueByKey!133 (toList!723 lt!34632) (_1!1080 lt!34352))))))

(assert (= (and d!18075 c!11620) b!76261))

(assert (= (and d!18075 (not c!11620)) b!76262))

(assert (= (and d!18075 (not res!40139)) b!76263))

(declare-fun m!75821 () Bool)

(assert (=> d!18075 m!75821))

(declare-fun m!75823 () Bool)

(assert (=> b!76261 m!75823))

(assert (=> b!76261 m!75753))

(assert (=> b!76261 m!75753))

(declare-fun m!75825 () Bool)

(assert (=> b!76261 m!75825))

(assert (=> b!76263 m!75753))

(assert (=> b!76263 m!75753))

(assert (=> b!76263 m!75825))

(assert (=> d!18059 d!18075))

(declare-fun b!76274 () Bool)

(declare-fun e!49816 () Option!139)

(assert (=> b!76274 (= e!49816 (getValueByKey!133 (t!5079 lt!34631) (_1!1080 lt!34352)))))

(declare-fun b!76275 () Bool)

(assert (=> b!76275 (= e!49816 None!137)))

(declare-fun b!76273 () Bool)

(declare-fun e!49815 () Option!139)

(assert (=> b!76273 (= e!49815 e!49816)))

(declare-fun c!11626 () Bool)

(assert (=> b!76273 (= c!11626 (and ((_ is Cons!1490) lt!34631) (not (= (_1!1080 (h!2078 lt!34631)) (_1!1080 lt!34352)))))))

(declare-fun b!76272 () Bool)

(assert (=> b!76272 (= e!49815 (Some!138 (_2!1080 (h!2078 lt!34631))))))

(declare-fun d!18077 () Bool)

(declare-fun c!11625 () Bool)

(assert (=> d!18077 (= c!11625 (and ((_ is Cons!1490) lt!34631) (= (_1!1080 (h!2078 lt!34631)) (_1!1080 lt!34352))))))

(assert (=> d!18077 (= (getValueByKey!133 lt!34631 (_1!1080 lt!34352)) e!49815)))

(assert (= (and d!18077 c!11625) b!76272))

(assert (= (and d!18077 (not c!11625)) b!76273))

(assert (= (and b!76273 c!11626) b!76274))

(assert (= (and b!76273 (not c!11626)) b!76275))

(declare-fun m!75827 () Bool)

(assert (=> b!76274 m!75827))

(assert (=> d!18059 d!18077))

(declare-fun d!18079 () Bool)

(assert (=> d!18079 (= (getValueByKey!133 lt!34631 (_1!1080 lt!34352)) (Some!138 (_2!1080 lt!34352)))))

(declare-fun lt!34669 () Unit!2179)

(declare-fun choose!447 (List!1494 (_ BitVec 64) V!2961) Unit!2179)

(assert (=> d!18079 (= lt!34669 (choose!447 lt!34631 (_1!1080 lt!34352) (_2!1080 lt!34352)))))

(declare-fun e!49819 () Bool)

(assert (=> d!18079 e!49819))

(declare-fun res!40144 () Bool)

(assert (=> d!18079 (=> (not res!40144) (not e!49819))))

(declare-fun isStrictlySorted!289 (List!1494) Bool)

(assert (=> d!18079 (= res!40144 (isStrictlySorted!289 lt!34631))))

(assert (=> d!18079 (= (lemmaContainsTupThenGetReturnValue!53 lt!34631 (_1!1080 lt!34352) (_2!1080 lt!34352)) lt!34669)))

(declare-fun b!76280 () Bool)

(declare-fun res!40145 () Bool)

(assert (=> b!76280 (=> (not res!40145) (not e!49819))))

(assert (=> b!76280 (= res!40145 (containsKey!137 lt!34631 (_1!1080 lt!34352)))))

(declare-fun b!76281 () Bool)

(assert (=> b!76281 (= e!49819 (contains!730 lt!34631 (tuple2!2139 (_1!1080 lt!34352) (_2!1080 lt!34352))))))

(assert (= (and d!18079 res!40144) b!76280))

(assert (= (and b!76280 res!40145) b!76281))

(assert (=> d!18079 m!75747))

(declare-fun m!75829 () Bool)

(assert (=> d!18079 m!75829))

(declare-fun m!75831 () Bool)

(assert (=> d!18079 m!75831))

(declare-fun m!75833 () Bool)

(assert (=> b!76280 m!75833))

(declare-fun m!75835 () Bool)

(assert (=> b!76281 m!75835))

(assert (=> d!18059 d!18079))

(declare-fun b!76302 () Bool)

(declare-fun c!11638 () Bool)

(declare-fun c!11635 () Bool)

(declare-fun e!49834 () List!1494)

(assert (=> b!76302 (= e!49834 (ite c!11635 (t!5079 (toList!723 (+!97 lt!34345 lt!34342))) (ite c!11638 (Cons!1490 (h!2078 (toList!723 (+!97 lt!34345 lt!34342))) (t!5079 (toList!723 (+!97 lt!34345 lt!34342)))) Nil!1491)))))

(declare-fun d!18081 () Bool)

(declare-fun e!49833 () Bool)

(assert (=> d!18081 e!49833))

(declare-fun res!40151 () Bool)

(assert (=> d!18081 (=> (not res!40151) (not e!49833))))

(declare-fun lt!34672 () List!1494)

(assert (=> d!18081 (= res!40151 (isStrictlySorted!289 lt!34672))))

(declare-fun e!49832 () List!1494)

(assert (=> d!18081 (= lt!34672 e!49832)))

(declare-fun c!11637 () Bool)

(assert (=> d!18081 (= c!11637 (and ((_ is Cons!1490) (toList!723 (+!97 lt!34345 lt!34342))) (bvslt (_1!1080 (h!2078 (toList!723 (+!97 lt!34345 lt!34342)))) (_1!1080 lt!34352))))))

(assert (=> d!18081 (isStrictlySorted!289 (toList!723 (+!97 lt!34345 lt!34342)))))

(assert (=> d!18081 (= (insertStrictlySorted!56 (toList!723 (+!97 lt!34345 lt!34342)) (_1!1080 lt!34352) (_2!1080 lt!34352)) lt!34672)))

(declare-fun b!76303 () Bool)

(assert (=> b!76303 (= e!49834 (insertStrictlySorted!56 (t!5079 (toList!723 (+!97 lt!34345 lt!34342))) (_1!1080 lt!34352) (_2!1080 lt!34352)))))

(declare-fun call!6898 () List!1494)

(declare-fun bm!6894 () Bool)

(declare-fun $colon$colon!67 (List!1494 tuple2!2138) List!1494)

(assert (=> bm!6894 (= call!6898 ($colon$colon!67 e!49834 (ite c!11637 (h!2078 (toList!723 (+!97 lt!34345 lt!34342))) (tuple2!2139 (_1!1080 lt!34352) (_2!1080 lt!34352)))))))

(declare-fun c!11636 () Bool)

(assert (=> bm!6894 (= c!11636 c!11637)))

(declare-fun bm!6895 () Bool)

(declare-fun call!6899 () List!1494)

(declare-fun call!6897 () List!1494)

(assert (=> bm!6895 (= call!6899 call!6897)))

(declare-fun b!76304 () Bool)

(declare-fun e!49831 () List!1494)

(assert (=> b!76304 (= e!49831 call!6897)))

(declare-fun b!76305 () Bool)

(assert (=> b!76305 (= e!49833 (contains!730 lt!34672 (tuple2!2139 (_1!1080 lt!34352) (_2!1080 lt!34352))))))

(declare-fun bm!6896 () Bool)

(assert (=> bm!6896 (= call!6897 call!6898)))

(declare-fun b!76306 () Bool)

(assert (=> b!76306 (= e!49832 e!49831)))

(assert (=> b!76306 (= c!11635 (and ((_ is Cons!1490) (toList!723 (+!97 lt!34345 lt!34342))) (= (_1!1080 (h!2078 (toList!723 (+!97 lt!34345 lt!34342)))) (_1!1080 lt!34352))))))

(declare-fun b!76307 () Bool)

(declare-fun res!40150 () Bool)

(assert (=> b!76307 (=> (not res!40150) (not e!49833))))

(assert (=> b!76307 (= res!40150 (containsKey!137 lt!34672 (_1!1080 lt!34352)))))

(declare-fun b!76308 () Bool)

(declare-fun e!49830 () List!1494)

(assert (=> b!76308 (= e!49830 call!6899)))

(declare-fun b!76309 () Bool)

(assert (=> b!76309 (= c!11638 (and ((_ is Cons!1490) (toList!723 (+!97 lt!34345 lt!34342))) (bvsgt (_1!1080 (h!2078 (toList!723 (+!97 lt!34345 lt!34342)))) (_1!1080 lt!34352))))))

(assert (=> b!76309 (= e!49831 e!49830)))

(declare-fun b!76310 () Bool)

(assert (=> b!76310 (= e!49830 call!6899)))

(declare-fun b!76311 () Bool)

(assert (=> b!76311 (= e!49832 call!6898)))

(assert (= (and d!18081 c!11637) b!76311))

(assert (= (and d!18081 (not c!11637)) b!76306))

(assert (= (and b!76306 c!11635) b!76304))

(assert (= (and b!76306 (not c!11635)) b!76309))

(assert (= (and b!76309 c!11638) b!76308))

(assert (= (and b!76309 (not c!11638)) b!76310))

(assert (= (or b!76308 b!76310) bm!6895))

(assert (= (or b!76304 bm!6895) bm!6896))

(assert (= (or b!76311 bm!6896) bm!6894))

(assert (= (and bm!6894 c!11636) b!76303))

(assert (= (and bm!6894 (not c!11636)) b!76302))

(assert (= (and d!18081 res!40151) b!76307))

(assert (= (and b!76307 res!40150) b!76305))

(declare-fun m!75837 () Bool)

(assert (=> b!76303 m!75837))

(declare-fun m!75839 () Bool)

(assert (=> b!76307 m!75839))

(declare-fun m!75841 () Bool)

(assert (=> d!18081 m!75841))

(declare-fun m!75843 () Bool)

(assert (=> d!18081 m!75843))

(declare-fun m!75845 () Bool)

(assert (=> bm!6894 m!75845))

(declare-fun m!75847 () Bool)

(assert (=> b!76305 m!75847))

(assert (=> d!18059 d!18081))

(declare-fun d!18083 () Bool)

(assert (=> d!18083 (= (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76200 d!18083))

(declare-fun b!76314 () Bool)

(declare-fun e!49836 () Option!139)

(assert (=> b!76314 (= e!49836 (getValueByKey!133 (t!5079 (toList!723 lt!34603)) (_1!1080 lt!34352)))))

(declare-fun b!76315 () Bool)

(assert (=> b!76315 (= e!49836 None!137)))

(declare-fun b!76313 () Bool)

(declare-fun e!49835 () Option!139)

(assert (=> b!76313 (= e!49835 e!49836)))

(declare-fun c!11640 () Bool)

(assert (=> b!76313 (= c!11640 (and ((_ is Cons!1490) (toList!723 lt!34603)) (not (= (_1!1080 (h!2078 (toList!723 lt!34603))) (_1!1080 lt!34352)))))))

(declare-fun b!76312 () Bool)

(assert (=> b!76312 (= e!49835 (Some!138 (_2!1080 (h!2078 (toList!723 lt!34603)))))))

(declare-fun d!18085 () Bool)

(declare-fun c!11639 () Bool)

(assert (=> d!18085 (= c!11639 (and ((_ is Cons!1490) (toList!723 lt!34603)) (= (_1!1080 (h!2078 (toList!723 lt!34603))) (_1!1080 lt!34352))))))

(assert (=> d!18085 (= (getValueByKey!133 (toList!723 lt!34603) (_1!1080 lt!34352)) e!49835)))

(assert (= (and d!18085 c!11639) b!76312))

(assert (= (and d!18085 (not c!11639)) b!76313))

(assert (= (and b!76313 c!11640) b!76314))

(assert (= (and b!76313 (not c!11640)) b!76315))

(declare-fun m!75849 () Bool)

(assert (=> b!76314 m!75849))

(assert (=> b!76169 d!18085))

(declare-fun d!18087 () Bool)

(declare-fun e!49837 () Bool)

(assert (=> d!18087 e!49837))

(declare-fun res!40152 () Bool)

(assert (=> d!18087 (=> res!40152 e!49837)))

(declare-fun lt!34676 () Bool)

(assert (=> d!18087 (= res!40152 (not lt!34676))))

(declare-fun lt!34675 () Bool)

(assert (=> d!18087 (= lt!34676 lt!34675)))

(declare-fun lt!34674 () Unit!2179)

(declare-fun e!49838 () Unit!2179)

(assert (=> d!18087 (= lt!34674 e!49838)))

(declare-fun c!11641 () Bool)

(assert (=> d!18087 (= c!11641 lt!34675)))

(assert (=> d!18087 (= lt!34675 (containsKey!137 (toList!723 lt!34576) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18087 (= (contains!726 lt!34576 #b1000000000000000000000000000000000000000000000000000000000000000) lt!34676)))

(declare-fun b!76316 () Bool)

(declare-fun lt!34673 () Unit!2179)

(assert (=> b!76316 (= e!49838 lt!34673)))

(assert (=> b!76316 (= lt!34673 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 lt!34576) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76316 (isDefined!87 (getValueByKey!133 (toList!723 lt!34576) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76317 () Bool)

(declare-fun Unit!2195 () Unit!2179)

(assert (=> b!76317 (= e!49838 Unit!2195)))

(declare-fun b!76318 () Bool)

(assert (=> b!76318 (= e!49837 (isDefined!87 (getValueByKey!133 (toList!723 lt!34576) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18087 c!11641) b!76316))

(assert (= (and d!18087 (not c!11641)) b!76317))

(assert (= (and d!18087 (not res!40152)) b!76318))

(declare-fun m!75851 () Bool)

(assert (=> d!18087 m!75851))

(declare-fun m!75853 () Bool)

(assert (=> b!76316 m!75853))

(declare-fun m!75855 () Bool)

(assert (=> b!76316 m!75855))

(assert (=> b!76316 m!75855))

(declare-fun m!75857 () Bool)

(assert (=> b!76316 m!75857))

(assert (=> b!76318 m!75855))

(assert (=> b!76318 m!75855))

(assert (=> b!76318 m!75857))

(assert (=> bm!6877 d!18087))

(declare-fun d!18089 () Bool)

(assert (=> d!18089 (= (map!1159 (_2!1081 lt!34525)) (getCurrentListMap!415 (_keys!3903 (_2!1081 lt!34525)) (_values!2229 (_2!1081 lt!34525)) (mask!6228 (_2!1081 lt!34525)) (extraKeys!2099 (_2!1081 lt!34525)) (zeroValue!2145 (_2!1081 lt!34525)) (minValue!2145 (_2!1081 lt!34525)) #b00000000000000000000000000000000 (defaultEntry!2246 (_2!1081 lt!34525))))))

(declare-fun bs!3254 () Bool)

(assert (= bs!3254 d!18089))

(declare-fun m!75859 () Bool)

(assert (=> bs!3254 m!75859))

(assert (=> bm!6842 d!18089))

(declare-fun d!18091 () Bool)

(declare-fun get!1160 (Option!139) V!2961)

(assert (=> d!18091 (= (apply!77 lt!34620 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1160 (getValueByKey!133 (toList!723 lt!34620) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3255 () Bool)

(assert (= bs!3255 d!18091))

(assert (=> bs!3255 m!75551))

(declare-fun m!75861 () Bool)

(assert (=> bs!3255 m!75861))

(assert (=> bs!3255 m!75861))

(declare-fun m!75863 () Bool)

(assert (=> bs!3255 m!75863))

(assert (=> b!76198 d!18091))

(declare-fun d!18093 () Bool)

(declare-fun c!11642 () Bool)

(assert (=> d!18093 (= c!11642 ((_ is ValueCellFull!899) (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!49839 () V!2961)

(assert (=> d!18093 (= (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!49839)))

(declare-fun b!76319 () Bool)

(assert (=> b!76319 (= e!49839 (get!1158 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!76320 () Bool)

(assert (=> b!76320 (= e!49839 (get!1159 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18093 c!11642) b!76319))

(assert (= (and d!18093 (not c!11642)) b!76320))

(assert (=> b!76319 m!75653))

(assert (=> b!76319 m!75423))

(declare-fun m!75865 () Bool)

(assert (=> b!76319 m!75865))

(assert (=> b!76320 m!75653))

(assert (=> b!76320 m!75423))

(declare-fun m!75867 () Bool)

(assert (=> b!76320 m!75867))

(assert (=> b!76198 d!18093))

(assert (=> bm!6876 d!18055))

(declare-fun d!18095 () Bool)

(declare-fun res!40153 () Bool)

(declare-fun e!49840 () Bool)

(assert (=> d!18095 (=> (not res!40153) (not e!49840))))

(assert (=> d!18095 (= res!40153 (simpleValid!53 (v!2552 (underlying!262 thiss!992))))))

(assert (=> d!18095 (= (valid!307 (v!2552 (underlying!262 thiss!992))) e!49840)))

(declare-fun b!76321 () Bool)

(declare-fun res!40154 () Bool)

(assert (=> b!76321 (=> (not res!40154) (not e!49840))))

(assert (=> b!76321 (= res!40154 (= (arrayCountValidKeys!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000000 (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))) (_size!402 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun b!76322 () Bool)

(declare-fun res!40155 () Bool)

(assert (=> b!76322 (=> (not res!40155) (not e!49840))))

(assert (=> b!76322 (= res!40155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun b!76323 () Bool)

(assert (=> b!76323 (= e!49840 (arrayNoDuplicates!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000000 Nil!1490))))

(assert (= (and d!18095 res!40153) b!76321))

(assert (= (and b!76321 res!40154) b!76322))

(assert (= (and b!76322 res!40155) b!76323))

(declare-fun m!75869 () Bool)

(assert (=> d!18095 m!75869))

(declare-fun m!75871 () Bool)

(assert (=> b!76321 m!75871))

(assert (=> b!76322 m!75371))

(assert (=> b!76323 m!75417))

(assert (=> d!18037 d!18095))

(assert (=> b!75936 d!18031))

(declare-fun d!18097 () Bool)

(declare-fun e!49841 () Bool)

(assert (=> d!18097 e!49841))

(declare-fun res!40156 () Bool)

(assert (=> d!18097 (=> res!40156 e!49841)))

(declare-fun lt!34680 () Bool)

(assert (=> d!18097 (= res!40156 (not lt!34680))))

(declare-fun lt!34679 () Bool)

(assert (=> d!18097 (= lt!34680 lt!34679)))

(declare-fun lt!34678 () Unit!2179)

(declare-fun e!49842 () Unit!2179)

(assert (=> d!18097 (= lt!34678 e!49842)))

(declare-fun c!11643 () Bool)

(assert (=> d!18097 (= c!11643 lt!34679)))

(assert (=> d!18097 (= lt!34679 (containsKey!137 (toList!723 lt!34628) (_1!1080 lt!34342)))))

(assert (=> d!18097 (= (contains!726 lt!34628 (_1!1080 lt!34342)) lt!34680)))

(declare-fun b!76324 () Bool)

(declare-fun lt!34677 () Unit!2179)

(assert (=> b!76324 (= e!49842 lt!34677)))

(assert (=> b!76324 (= lt!34677 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 lt!34628) (_1!1080 lt!34342)))))

(assert (=> b!76324 (isDefined!87 (getValueByKey!133 (toList!723 lt!34628) (_1!1080 lt!34342)))))

(declare-fun b!76325 () Bool)

(declare-fun Unit!2196 () Unit!2179)

(assert (=> b!76325 (= e!49842 Unit!2196)))

(declare-fun b!76326 () Bool)

(assert (=> b!76326 (= e!49841 (isDefined!87 (getValueByKey!133 (toList!723 lt!34628) (_1!1080 lt!34342))))))

(assert (= (and d!18097 c!11643) b!76324))

(assert (= (and d!18097 (not c!11643)) b!76325))

(assert (= (and d!18097 (not res!40156)) b!76326))

(declare-fun m!75873 () Bool)

(assert (=> d!18097 m!75873))

(declare-fun m!75875 () Bool)

(assert (=> b!76324 m!75875))

(assert (=> b!76324 m!75741))

(assert (=> b!76324 m!75741))

(declare-fun m!75877 () Bool)

(assert (=> b!76324 m!75877))

(assert (=> b!76326 m!75741))

(assert (=> b!76326 m!75741))

(assert (=> b!76326 m!75877))

(assert (=> d!18057 d!18097))

(declare-fun b!76329 () Bool)

(declare-fun e!49844 () Option!139)

(assert (=> b!76329 (= e!49844 (getValueByKey!133 (t!5079 lt!34627) (_1!1080 lt!34342)))))

(declare-fun b!76330 () Bool)

(assert (=> b!76330 (= e!49844 None!137)))

(declare-fun b!76328 () Bool)

(declare-fun e!49843 () Option!139)

(assert (=> b!76328 (= e!49843 e!49844)))

(declare-fun c!11645 () Bool)

(assert (=> b!76328 (= c!11645 (and ((_ is Cons!1490) lt!34627) (not (= (_1!1080 (h!2078 lt!34627)) (_1!1080 lt!34342)))))))

(declare-fun b!76327 () Bool)

(assert (=> b!76327 (= e!49843 (Some!138 (_2!1080 (h!2078 lt!34627))))))

(declare-fun d!18099 () Bool)

(declare-fun c!11644 () Bool)

(assert (=> d!18099 (= c!11644 (and ((_ is Cons!1490) lt!34627) (= (_1!1080 (h!2078 lt!34627)) (_1!1080 lt!34342))))))

(assert (=> d!18099 (= (getValueByKey!133 lt!34627 (_1!1080 lt!34342)) e!49843)))

(assert (= (and d!18099 c!11644) b!76327))

(assert (= (and d!18099 (not c!11644)) b!76328))

(assert (= (and b!76328 c!11645) b!76329))

(assert (= (and b!76328 (not c!11645)) b!76330))

(declare-fun m!75879 () Bool)

(assert (=> b!76329 m!75879))

(assert (=> d!18057 d!18099))

(declare-fun d!18101 () Bool)

(assert (=> d!18101 (= (getValueByKey!133 lt!34627 (_1!1080 lt!34342)) (Some!138 (_2!1080 lt!34342)))))

(declare-fun lt!34681 () Unit!2179)

(assert (=> d!18101 (= lt!34681 (choose!447 lt!34627 (_1!1080 lt!34342) (_2!1080 lt!34342)))))

(declare-fun e!49845 () Bool)

(assert (=> d!18101 e!49845))

(declare-fun res!40157 () Bool)

(assert (=> d!18101 (=> (not res!40157) (not e!49845))))

(assert (=> d!18101 (= res!40157 (isStrictlySorted!289 lt!34627))))

(assert (=> d!18101 (= (lemmaContainsTupThenGetReturnValue!53 lt!34627 (_1!1080 lt!34342) (_2!1080 lt!34342)) lt!34681)))

(declare-fun b!76331 () Bool)

(declare-fun res!40158 () Bool)

(assert (=> b!76331 (=> (not res!40158) (not e!49845))))

(assert (=> b!76331 (= res!40158 (containsKey!137 lt!34627 (_1!1080 lt!34342)))))

(declare-fun b!76332 () Bool)

(assert (=> b!76332 (= e!49845 (contains!730 lt!34627 (tuple2!2139 (_1!1080 lt!34342) (_2!1080 lt!34342))))))

(assert (= (and d!18101 res!40157) b!76331))

(assert (= (and b!76331 res!40158) b!76332))

(assert (=> d!18101 m!75735))

(declare-fun m!75881 () Bool)

(assert (=> d!18101 m!75881))

(declare-fun m!75883 () Bool)

(assert (=> d!18101 m!75883))

(declare-fun m!75885 () Bool)

(assert (=> b!76331 m!75885))

(declare-fun m!75887 () Bool)

(assert (=> b!76332 m!75887))

(assert (=> d!18057 d!18101))

(declare-fun c!11649 () Bool)

(declare-fun b!76333 () Bool)

(declare-fun e!49850 () List!1494)

(declare-fun c!11646 () Bool)

(assert (=> b!76333 (= e!49850 (ite c!11646 (t!5079 (toList!723 lt!34345)) (ite c!11649 (Cons!1490 (h!2078 (toList!723 lt!34345)) (t!5079 (toList!723 lt!34345))) Nil!1491)))))

(declare-fun d!18103 () Bool)

(declare-fun e!49849 () Bool)

(assert (=> d!18103 e!49849))

(declare-fun res!40160 () Bool)

(assert (=> d!18103 (=> (not res!40160) (not e!49849))))

(declare-fun lt!34682 () List!1494)

(assert (=> d!18103 (= res!40160 (isStrictlySorted!289 lt!34682))))

(declare-fun e!49848 () List!1494)

(assert (=> d!18103 (= lt!34682 e!49848)))

(declare-fun c!11648 () Bool)

(assert (=> d!18103 (= c!11648 (and ((_ is Cons!1490) (toList!723 lt!34345)) (bvslt (_1!1080 (h!2078 (toList!723 lt!34345))) (_1!1080 lt!34342))))))

(assert (=> d!18103 (isStrictlySorted!289 (toList!723 lt!34345))))

(assert (=> d!18103 (= (insertStrictlySorted!56 (toList!723 lt!34345) (_1!1080 lt!34342) (_2!1080 lt!34342)) lt!34682)))

(declare-fun b!76334 () Bool)

(assert (=> b!76334 (= e!49850 (insertStrictlySorted!56 (t!5079 (toList!723 lt!34345)) (_1!1080 lt!34342) (_2!1080 lt!34342)))))

(declare-fun bm!6897 () Bool)

(declare-fun call!6901 () List!1494)

(assert (=> bm!6897 (= call!6901 ($colon$colon!67 e!49850 (ite c!11648 (h!2078 (toList!723 lt!34345)) (tuple2!2139 (_1!1080 lt!34342) (_2!1080 lt!34342)))))))

(declare-fun c!11647 () Bool)

(assert (=> bm!6897 (= c!11647 c!11648)))

(declare-fun bm!6898 () Bool)

(declare-fun call!6902 () List!1494)

(declare-fun call!6900 () List!1494)

(assert (=> bm!6898 (= call!6902 call!6900)))

(declare-fun b!76335 () Bool)

(declare-fun e!49847 () List!1494)

(assert (=> b!76335 (= e!49847 call!6900)))

(declare-fun b!76336 () Bool)

(assert (=> b!76336 (= e!49849 (contains!730 lt!34682 (tuple2!2139 (_1!1080 lt!34342) (_2!1080 lt!34342))))))

(declare-fun bm!6899 () Bool)

(assert (=> bm!6899 (= call!6900 call!6901)))

(declare-fun b!76337 () Bool)

(assert (=> b!76337 (= e!49848 e!49847)))

(assert (=> b!76337 (= c!11646 (and ((_ is Cons!1490) (toList!723 lt!34345)) (= (_1!1080 (h!2078 (toList!723 lt!34345))) (_1!1080 lt!34342))))))

(declare-fun b!76338 () Bool)

(declare-fun res!40159 () Bool)

(assert (=> b!76338 (=> (not res!40159) (not e!49849))))

(assert (=> b!76338 (= res!40159 (containsKey!137 lt!34682 (_1!1080 lt!34342)))))

(declare-fun b!76339 () Bool)

(declare-fun e!49846 () List!1494)

(assert (=> b!76339 (= e!49846 call!6902)))

(declare-fun b!76340 () Bool)

(assert (=> b!76340 (= c!11649 (and ((_ is Cons!1490) (toList!723 lt!34345)) (bvsgt (_1!1080 (h!2078 (toList!723 lt!34345))) (_1!1080 lt!34342))))))

(assert (=> b!76340 (= e!49847 e!49846)))

(declare-fun b!76341 () Bool)

(assert (=> b!76341 (= e!49846 call!6902)))

(declare-fun b!76342 () Bool)

(assert (=> b!76342 (= e!49848 call!6901)))

(assert (= (and d!18103 c!11648) b!76342))

(assert (= (and d!18103 (not c!11648)) b!76337))

(assert (= (and b!76337 c!11646) b!76335))

(assert (= (and b!76337 (not c!11646)) b!76340))

(assert (= (and b!76340 c!11649) b!76339))

(assert (= (and b!76340 (not c!11649)) b!76341))

(assert (= (or b!76339 b!76341) bm!6898))

(assert (= (or b!76335 bm!6898) bm!6899))

(assert (= (or b!76342 bm!6899) bm!6897))

(assert (= (and bm!6897 c!11647) b!76334))

(assert (= (and bm!6897 (not c!11647)) b!76333))

(assert (= (and d!18103 res!40160) b!76338))

(assert (= (and b!76338 res!40159) b!76336))

(declare-fun m!75889 () Bool)

(assert (=> b!76334 m!75889))

(declare-fun m!75891 () Bool)

(assert (=> b!76338 m!75891))

(declare-fun m!75893 () Bool)

(assert (=> d!18103 m!75893))

(declare-fun m!75895 () Bool)

(assert (=> d!18103 m!75895))

(declare-fun m!75897 () Bool)

(assert (=> bm!6897 m!75897))

(declare-fun m!75899 () Bool)

(assert (=> b!76336 m!75899))

(assert (=> d!18057 d!18103))

(assert (=> bm!6849 d!18047))

(declare-fun d!18105 () Bool)

(declare-fun e!49851 () Bool)

(assert (=> d!18105 e!49851))

(declare-fun res!40162 () Bool)

(assert (=> d!18105 (=> (not res!40162) (not e!49851))))

(declare-fun lt!34685 () ListLongMap!1415)

(assert (=> d!18105 (= res!40162 (contains!726 lt!34685 (_1!1080 (ite c!11567 (ite c!11569 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34341) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34341)) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)))))))

(declare-fun lt!34684 () List!1494)

(assert (=> d!18105 (= lt!34685 (ListLongMap!1416 lt!34684))))

(declare-fun lt!34683 () Unit!2179)

(declare-fun lt!34686 () Unit!2179)

(assert (=> d!18105 (= lt!34683 lt!34686)))

(assert (=> d!18105 (= (getValueByKey!133 lt!34684 (_1!1080 (ite c!11567 (ite c!11569 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34341) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34341)) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)))) (Some!138 (_2!1080 (ite c!11567 (ite c!11569 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34341) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34341)) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)))))))

(assert (=> d!18105 (= lt!34686 (lemmaContainsTupThenGetReturnValue!53 lt!34684 (_1!1080 (ite c!11567 (ite c!11569 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34341) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34341)) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))) (_2!1080 (ite c!11567 (ite c!11569 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34341) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34341)) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)))))))

(assert (=> d!18105 (= lt!34684 (insertStrictlySorted!56 (toList!723 e!49694) (_1!1080 (ite c!11567 (ite c!11569 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34341) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34341)) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))) (_2!1080 (ite c!11567 (ite c!11569 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34341) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34341)) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)))))))

(assert (=> d!18105 (= (+!97 e!49694 (ite c!11567 (ite c!11569 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34341) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34341)) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))) lt!34685)))

(declare-fun b!76343 () Bool)

(declare-fun res!40161 () Bool)

(assert (=> b!76343 (=> (not res!40161) (not e!49851))))

(assert (=> b!76343 (= res!40161 (= (getValueByKey!133 (toList!723 lt!34685) (_1!1080 (ite c!11567 (ite c!11569 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34341) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34341)) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)))) (Some!138 (_2!1080 (ite c!11567 (ite c!11569 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34341) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34341)) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))))

(declare-fun b!76344 () Bool)

(assert (=> b!76344 (= e!49851 (contains!730 (toList!723 lt!34685) (ite c!11567 (ite c!11569 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34341) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34341)) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))

(assert (= (and d!18105 res!40162) b!76343))

(assert (= (and b!76343 res!40161) b!76344))

(declare-fun m!75901 () Bool)

(assert (=> d!18105 m!75901))

(declare-fun m!75903 () Bool)

(assert (=> d!18105 m!75903))

(declare-fun m!75905 () Bool)

(assert (=> d!18105 m!75905))

(declare-fun m!75907 () Bool)

(assert (=> d!18105 m!75907))

(declare-fun m!75909 () Bool)

(assert (=> b!76343 m!75909))

(declare-fun m!75911 () Bool)

(assert (=> b!76344 m!75911))

(assert (=> bm!6848 d!18105))

(declare-fun d!18107 () Bool)

(assert (=> d!18107 (not (contains!726 (+!97 lt!34622 (tuple2!2139 lt!34623 lt!34619)) lt!34624))))

(declare-fun lt!34689 () Unit!2179)

(declare-fun choose!448 (ListLongMap!1415 (_ BitVec 64) V!2961 (_ BitVec 64)) Unit!2179)

(assert (=> d!18107 (= lt!34689 (choose!448 lt!34622 lt!34623 lt!34619 lt!34624))))

(declare-fun e!49854 () Bool)

(assert (=> d!18107 e!49854))

(declare-fun res!40165 () Bool)

(assert (=> d!18107 (=> (not res!40165) (not e!49854))))

(assert (=> d!18107 (= res!40165 (not (contains!726 lt!34622 lt!34624)))))

(assert (=> d!18107 (= (addStillNotContains!27 lt!34622 lt!34623 lt!34619 lt!34624) lt!34689)))

(declare-fun b!76348 () Bool)

(assert (=> b!76348 (= e!49854 (not (= lt!34623 lt!34624)))))

(assert (= (and d!18107 res!40165) b!76348))

(assert (=> d!18107 m!75719))

(assert (=> d!18107 m!75719))

(assert (=> d!18107 m!75721))

(declare-fun m!75913 () Bool)

(assert (=> d!18107 m!75913))

(declare-fun m!75915 () Bool)

(assert (=> d!18107 m!75915))

(assert (=> b!76196 d!18107))

(assert (=> b!76196 d!18093))

(declare-fun d!18109 () Bool)

(declare-fun e!49855 () Bool)

(assert (=> d!18109 e!49855))

(declare-fun res!40167 () Bool)

(assert (=> d!18109 (=> (not res!40167) (not e!49855))))

(declare-fun lt!34692 () ListLongMap!1415)

(assert (=> d!18109 (= res!40167 (contains!726 lt!34692 (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!34691 () List!1494)

(assert (=> d!18109 (= lt!34692 (ListLongMap!1416 lt!34691))))

(declare-fun lt!34690 () Unit!2179)

(declare-fun lt!34693 () Unit!2179)

(assert (=> d!18109 (= lt!34690 lt!34693)))

(assert (=> d!18109 (= (getValueByKey!133 lt!34691 (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!138 (_2!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18109 (= lt!34693 (lemmaContainsTupThenGetReturnValue!53 lt!34691 (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18109 (= lt!34691 (insertStrictlySorted!56 (toList!723 call!6887) (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18109 (= (+!97 call!6887 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!34692)))

(declare-fun b!76349 () Bool)

(declare-fun res!40166 () Bool)

(assert (=> b!76349 (=> (not res!40166) (not e!49855))))

(assert (=> b!76349 (= res!40166 (= (getValueByKey!133 (toList!723 lt!34692) (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!138 (_2!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!76350 () Bool)

(assert (=> b!76350 (= e!49855 (contains!730 (toList!723 lt!34692) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!18109 res!40167) b!76349))

(assert (= (and b!76349 res!40166) b!76350))

(declare-fun m!75917 () Bool)

(assert (=> d!18109 m!75917))

(declare-fun m!75919 () Bool)

(assert (=> d!18109 m!75919))

(declare-fun m!75921 () Bool)

(assert (=> d!18109 m!75921))

(declare-fun m!75923 () Bool)

(assert (=> d!18109 m!75923))

(declare-fun m!75925 () Bool)

(assert (=> b!76349 m!75925))

(declare-fun m!75927 () Bool)

(assert (=> b!76350 m!75927))

(assert (=> b!76196 d!18109))

(declare-fun d!18111 () Bool)

(declare-fun e!49856 () Bool)

(assert (=> d!18111 e!49856))

(declare-fun res!40169 () Bool)

(assert (=> d!18111 (=> (not res!40169) (not e!49856))))

(declare-fun lt!34696 () ListLongMap!1415)

(assert (=> d!18111 (= res!40169 (contains!726 lt!34696 (_1!1080 (tuple2!2139 lt!34623 lt!34619))))))

(declare-fun lt!34695 () List!1494)

(assert (=> d!18111 (= lt!34696 (ListLongMap!1416 lt!34695))))

(declare-fun lt!34694 () Unit!2179)

(declare-fun lt!34697 () Unit!2179)

(assert (=> d!18111 (= lt!34694 lt!34697)))

(assert (=> d!18111 (= (getValueByKey!133 lt!34695 (_1!1080 (tuple2!2139 lt!34623 lt!34619))) (Some!138 (_2!1080 (tuple2!2139 lt!34623 lt!34619))))))

(assert (=> d!18111 (= lt!34697 (lemmaContainsTupThenGetReturnValue!53 lt!34695 (_1!1080 (tuple2!2139 lt!34623 lt!34619)) (_2!1080 (tuple2!2139 lt!34623 lt!34619))))))

(assert (=> d!18111 (= lt!34695 (insertStrictlySorted!56 (toList!723 lt!34622) (_1!1080 (tuple2!2139 lt!34623 lt!34619)) (_2!1080 (tuple2!2139 lt!34623 lt!34619))))))

(assert (=> d!18111 (= (+!97 lt!34622 (tuple2!2139 lt!34623 lt!34619)) lt!34696)))

(declare-fun b!76351 () Bool)

(declare-fun res!40168 () Bool)

(assert (=> b!76351 (=> (not res!40168) (not e!49856))))

(assert (=> b!76351 (= res!40168 (= (getValueByKey!133 (toList!723 lt!34696) (_1!1080 (tuple2!2139 lt!34623 lt!34619))) (Some!138 (_2!1080 (tuple2!2139 lt!34623 lt!34619)))))))

(declare-fun b!76352 () Bool)

(assert (=> b!76352 (= e!49856 (contains!730 (toList!723 lt!34696) (tuple2!2139 lt!34623 lt!34619)))))

(assert (= (and d!18111 res!40169) b!76351))

(assert (= (and b!76351 res!40168) b!76352))

(declare-fun m!75929 () Bool)

(assert (=> d!18111 m!75929))

(declare-fun m!75931 () Bool)

(assert (=> d!18111 m!75931))

(declare-fun m!75933 () Bool)

(assert (=> d!18111 m!75933))

(declare-fun m!75935 () Bool)

(assert (=> d!18111 m!75935))

(declare-fun m!75937 () Bool)

(assert (=> b!76351 m!75937))

(declare-fun m!75939 () Bool)

(assert (=> b!76352 m!75939))

(assert (=> b!76196 d!18111))

(declare-fun d!18113 () Bool)

(declare-fun e!49857 () Bool)

(assert (=> d!18113 e!49857))

(declare-fun res!40170 () Bool)

(assert (=> d!18113 (=> res!40170 e!49857)))

(declare-fun lt!34701 () Bool)

(assert (=> d!18113 (= res!40170 (not lt!34701))))

(declare-fun lt!34700 () Bool)

(assert (=> d!18113 (= lt!34701 lt!34700)))

(declare-fun lt!34699 () Unit!2179)

(declare-fun e!49858 () Unit!2179)

(assert (=> d!18113 (= lt!34699 e!49858)))

(declare-fun c!11650 () Bool)

(assert (=> d!18113 (= c!11650 lt!34700)))

(assert (=> d!18113 (= lt!34700 (containsKey!137 (toList!723 (+!97 lt!34622 (tuple2!2139 lt!34623 lt!34619))) lt!34624))))

(assert (=> d!18113 (= (contains!726 (+!97 lt!34622 (tuple2!2139 lt!34623 lt!34619)) lt!34624) lt!34701)))

(declare-fun b!76353 () Bool)

(declare-fun lt!34698 () Unit!2179)

(assert (=> b!76353 (= e!49858 lt!34698)))

(assert (=> b!76353 (= lt!34698 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 (+!97 lt!34622 (tuple2!2139 lt!34623 lt!34619))) lt!34624))))

(assert (=> b!76353 (isDefined!87 (getValueByKey!133 (toList!723 (+!97 lt!34622 (tuple2!2139 lt!34623 lt!34619))) lt!34624))))

(declare-fun b!76354 () Bool)

(declare-fun Unit!2197 () Unit!2179)

(assert (=> b!76354 (= e!49858 Unit!2197)))

(declare-fun b!76355 () Bool)

(assert (=> b!76355 (= e!49857 (isDefined!87 (getValueByKey!133 (toList!723 (+!97 lt!34622 (tuple2!2139 lt!34623 lt!34619))) lt!34624)))))

(assert (= (and d!18113 c!11650) b!76353))

(assert (= (and d!18113 (not c!11650)) b!76354))

(assert (= (and d!18113 (not res!40170)) b!76355))

(declare-fun m!75941 () Bool)

(assert (=> d!18113 m!75941))

(declare-fun m!75943 () Bool)

(assert (=> b!76353 m!75943))

(declare-fun m!75945 () Bool)

(assert (=> b!76353 m!75945))

(assert (=> b!76353 m!75945))

(declare-fun m!75947 () Bool)

(assert (=> b!76353 m!75947))

(assert (=> b!76355 m!75945))

(assert (=> b!76355 m!75945))

(assert (=> b!76355 m!75947))

(assert (=> b!76196 d!18113))

(declare-fun d!18115 () Bool)

(declare-fun e!49859 () Bool)

(assert (=> d!18115 e!49859))

(declare-fun res!40171 () Bool)

(assert (=> d!18115 (=> res!40171 e!49859)))

(declare-fun lt!34705 () Bool)

(assert (=> d!18115 (= res!40171 (not lt!34705))))

(declare-fun lt!34704 () Bool)

(assert (=> d!18115 (= lt!34705 lt!34704)))

(declare-fun lt!34703 () Unit!2179)

(declare-fun e!49860 () Unit!2179)

(assert (=> d!18115 (= lt!34703 e!49860)))

(declare-fun c!11651 () Bool)

(assert (=> d!18115 (= c!11651 lt!34704)))

(assert (=> d!18115 (= lt!34704 (containsKey!137 (toList!723 lt!34620) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18115 (= (contains!726 lt!34620 #b0000000000000000000000000000000000000000000000000000000000000000) lt!34705)))

(declare-fun b!76356 () Bool)

(declare-fun lt!34702 () Unit!2179)

(assert (=> b!76356 (= e!49860 lt!34702)))

(assert (=> b!76356 (= lt!34702 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 lt!34620) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76356 (isDefined!87 (getValueByKey!133 (toList!723 lt!34620) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76357 () Bool)

(declare-fun Unit!2198 () Unit!2179)

(assert (=> b!76357 (= e!49860 Unit!2198)))

(declare-fun b!76358 () Bool)

(assert (=> b!76358 (= e!49859 (isDefined!87 (getValueByKey!133 (toList!723 lt!34620) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18115 c!11651) b!76356))

(assert (= (and d!18115 (not c!11651)) b!76357))

(assert (= (and d!18115 (not res!40171)) b!76358))

(declare-fun m!75949 () Bool)

(assert (=> d!18115 m!75949))

(declare-fun m!75951 () Bool)

(assert (=> b!76356 m!75951))

(declare-fun m!75953 () Bool)

(assert (=> b!76356 m!75953))

(assert (=> b!76356 m!75953))

(declare-fun m!75955 () Bool)

(assert (=> b!76356 m!75955))

(assert (=> b!76358 m!75953))

(assert (=> b!76358 m!75953))

(assert (=> b!76358 m!75955))

(assert (=> d!18055 d!18115))

(assert (=> d!18055 d!18061))

(declare-fun d!18117 () Bool)

(declare-fun e!49861 () Bool)

(assert (=> d!18117 e!49861))

(declare-fun res!40173 () Bool)

(assert (=> d!18117 (=> (not res!40173) (not e!49861))))

(declare-fun lt!34708 () ListLongMap!1415)

(assert (=> d!18117 (= res!40173 (contains!726 lt!34708 (_1!1080 (ite (or c!11591 c!11592) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992))))))))))

(declare-fun lt!34707 () List!1494)

(assert (=> d!18117 (= lt!34708 (ListLongMap!1416 lt!34707))))

(declare-fun lt!34706 () Unit!2179)

(declare-fun lt!34709 () Unit!2179)

(assert (=> d!18117 (= lt!34706 lt!34709)))

(assert (=> d!18117 (= (getValueByKey!133 lt!34707 (_1!1080 (ite (or c!11591 c!11592) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992))))))) (Some!138 (_2!1080 (ite (or c!11591 c!11592) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992))))))))))

(assert (=> d!18117 (= lt!34709 (lemmaContainsTupThenGetReturnValue!53 lt!34707 (_1!1080 (ite (or c!11591 c!11592) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))) (_2!1080 (ite (or c!11591 c!11592) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992))))))))))

(assert (=> d!18117 (= lt!34707 (insertStrictlySorted!56 (toList!723 (ite c!11591 call!6883 (ite c!11592 call!6880 call!6882))) (_1!1080 (ite (or c!11591 c!11592) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))) (_2!1080 (ite (or c!11591 c!11592) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992))))))))))

(assert (=> d!18117 (= (+!97 (ite c!11591 call!6883 (ite c!11592 call!6880 call!6882)) (ite (or c!11591 c!11592) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))) lt!34708)))

(declare-fun b!76359 () Bool)

(declare-fun res!40172 () Bool)

(assert (=> b!76359 (=> (not res!40172) (not e!49861))))

(assert (=> b!76359 (= res!40172 (= (getValueByKey!133 (toList!723 lt!34708) (_1!1080 (ite (or c!11591 c!11592) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992))))))) (Some!138 (_2!1080 (ite (or c!11591 c!11592) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))))))))

(declare-fun b!76360 () Bool)

(assert (=> b!76360 (= e!49861 (contains!730 (toList!723 lt!34708) (ite (or c!11591 c!11592) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (= (and d!18117 res!40173) b!76359))

(assert (= (and b!76359 res!40172) b!76360))

(declare-fun m!75957 () Bool)

(assert (=> d!18117 m!75957))

(declare-fun m!75959 () Bool)

(assert (=> d!18117 m!75959))

(declare-fun m!75961 () Bool)

(assert (=> d!18117 m!75961))

(declare-fun m!75963 () Bool)

(assert (=> d!18117 m!75963))

(declare-fun m!75965 () Bool)

(assert (=> b!76359 m!75965))

(declare-fun m!75967 () Bool)

(assert (=> b!76360 m!75967))

(assert (=> bm!6881 d!18117))

(declare-fun d!18119 () Bool)

(assert (=> d!18119 (= (inRange!0 (ite c!11573 (ite c!11571 (index!3098 lt!34522) (ite c!11570 (index!3097 lt!34509) (index!3100 lt!34509))) (ite c!11572 (index!3098 lt!34524) (ite c!11568 (index!3097 lt!34511) (index!3100 lt!34511)))) (mask!6228 newMap!16)) (and (bvsge (ite c!11573 (ite c!11571 (index!3098 lt!34522) (ite c!11570 (index!3097 lt!34509) (index!3100 lt!34509))) (ite c!11572 (index!3098 lt!34524) (ite c!11568 (index!3097 lt!34511) (index!3100 lt!34511)))) #b00000000000000000000000000000000) (bvslt (ite c!11573 (ite c!11571 (index!3098 lt!34522) (ite c!11570 (index!3097 lt!34509) (index!3100 lt!34509))) (ite c!11572 (index!3098 lt!34524) (ite c!11568 (index!3097 lt!34511) (index!3100 lt!34511)))) (bvadd (mask!6228 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!6840 d!18119))

(declare-fun d!18121 () Bool)

(declare-fun e!49864 () Bool)

(assert (=> d!18121 e!49864))

(declare-fun c!11654 () Bool)

(assert (=> d!18121 (= c!11654 (and (not (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!18121 true))

(declare-fun _$29!96 () Unit!2179)

(assert (=> d!18121 (= (choose!445 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))) _$29!96)))

(declare-fun b!76365 () Bool)

(assert (=> b!76365 (= e!49864 (arrayContainsKey!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!76366 () Bool)

(assert (=> b!76366 (= e!49864 (ite (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!18121 c!11654) b!76365))

(assert (= (and d!18121 (not c!11654)) b!76366))

(assert (=> b!76365 m!75383))

(assert (=> b!76365 m!75413))

(assert (=> d!18033 d!18121))

(assert (=> d!18033 d!18061))

(declare-fun d!18123 () Bool)

(declare-fun e!49865 () Bool)

(assert (=> d!18123 e!49865))

(declare-fun res!40174 () Bool)

(assert (=> d!18123 (=> res!40174 e!49865)))

(declare-fun lt!34713 () Bool)

(assert (=> d!18123 (= res!40174 (not lt!34713))))

(declare-fun lt!34712 () Bool)

(assert (=> d!18123 (= lt!34713 lt!34712)))

(declare-fun lt!34711 () Unit!2179)

(declare-fun e!49866 () Unit!2179)

(assert (=> d!18123 (= lt!34711 e!49866)))

(declare-fun c!11655 () Bool)

(assert (=> d!18123 (= c!11655 lt!34712)))

(assert (=> d!18123 (= lt!34712 (containsKey!137 (toList!723 lt!34620) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18123 (= (contains!726 lt!34620 #b1000000000000000000000000000000000000000000000000000000000000000) lt!34713)))

(declare-fun b!76367 () Bool)

(declare-fun lt!34710 () Unit!2179)

(assert (=> b!76367 (= e!49866 lt!34710)))

(assert (=> b!76367 (= lt!34710 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 lt!34620) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76367 (isDefined!87 (getValueByKey!133 (toList!723 lt!34620) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76368 () Bool)

(declare-fun Unit!2199 () Unit!2179)

(assert (=> b!76368 (= e!49866 Unit!2199)))

(declare-fun b!76369 () Bool)

(assert (=> b!76369 (= e!49865 (isDefined!87 (getValueByKey!133 (toList!723 lt!34620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18123 c!11655) b!76367))

(assert (= (and d!18123 (not c!11655)) b!76368))

(assert (= (and d!18123 (not res!40174)) b!76369))

(declare-fun m!75969 () Bool)

(assert (=> d!18123 m!75969))

(declare-fun m!75971 () Bool)

(assert (=> b!76367 m!75971))

(declare-fun m!75973 () Bool)

(assert (=> b!76367 m!75973))

(assert (=> b!76367 m!75973))

(declare-fun m!75975 () Bool)

(assert (=> b!76367 m!75975))

(assert (=> b!76369 m!75973))

(assert (=> b!76369 m!75973))

(assert (=> b!76369 m!75975))

(assert (=> b!76195 d!18123))

(declare-fun d!18125 () Bool)

(assert (=> d!18125 (= (apply!77 lt!34579 lt!34575) (get!1160 (getValueByKey!133 (toList!723 lt!34579) lt!34575)))))

(declare-fun bs!3256 () Bool)

(assert (= bs!3256 d!18125))

(declare-fun m!75977 () Bool)

(assert (=> bs!3256 m!75977))

(assert (=> bs!3256 m!75977))

(declare-fun m!75979 () Bool)

(assert (=> bs!3256 m!75979))

(assert (=> b!76142 d!18125))

(declare-fun d!18127 () Bool)

(assert (=> d!18127 (= (apply!77 (+!97 lt!34572 (tuple2!2139 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34578) (get!1160 (getValueByKey!133 (toList!723 (+!97 lt!34572 (tuple2!2139 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))) lt!34578)))))

(declare-fun bs!3257 () Bool)

(assert (= bs!3257 d!18127))

(declare-fun m!75981 () Bool)

(assert (=> bs!3257 m!75981))

(assert (=> bs!3257 m!75981))

(declare-fun m!75983 () Bool)

(assert (=> bs!3257 m!75983))

(assert (=> b!76142 d!18127))

(declare-fun d!18129 () Bool)

(assert (=> d!18129 (= (apply!77 (+!97 lt!34572 (tuple2!2139 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34578) (apply!77 lt!34572 lt!34578))))

(declare-fun lt!34716 () Unit!2179)

(declare-fun choose!449 (ListLongMap!1415 (_ BitVec 64) V!2961 (_ BitVec 64)) Unit!2179)

(assert (=> d!18129 (= lt!34716 (choose!449 lt!34572 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992))) lt!34578))))

(declare-fun e!49869 () Bool)

(assert (=> d!18129 e!49869))

(declare-fun res!40177 () Bool)

(assert (=> d!18129 (=> (not res!40177) (not e!49869))))

(assert (=> d!18129 (= res!40177 (contains!726 lt!34572 lt!34578))))

(assert (=> d!18129 (= (addApplyDifferent!53 lt!34572 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992))) lt!34578) lt!34716)))

(declare-fun b!76373 () Bool)

(assert (=> b!76373 (= e!49869 (not (= lt!34578 lt!34574)))))

(assert (= (and d!18129 res!40177) b!76373))

(declare-fun m!75985 () Bool)

(assert (=> d!18129 m!75985))

(declare-fun m!75987 () Bool)

(assert (=> d!18129 m!75987))

(assert (=> d!18129 m!75665))

(assert (=> d!18129 m!75667))

(assert (=> d!18129 m!75665))

(assert (=> d!18129 m!75691))

(assert (=> b!76142 d!18129))

(assert (=> b!76142 d!18055))

(declare-fun d!18131 () Bool)

(assert (=> d!18131 (contains!726 (+!97 lt!34573 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34586)))

(declare-fun lt!34719 () Unit!2179)

(declare-fun choose!450 (ListLongMap!1415 (_ BitVec 64) V!2961 (_ BitVec 64)) Unit!2179)

(assert (=> d!18131 (= lt!34719 (choose!450 lt!34573 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) lt!34586))))

(assert (=> d!18131 (contains!726 lt!34573 lt!34586)))

(assert (=> d!18131 (= (addStillContains!53 lt!34573 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) lt!34586) lt!34719)))

(declare-fun bs!3258 () Bool)

(assert (= bs!3258 d!18131))

(assert (=> bs!3258 m!75671))

(assert (=> bs!3258 m!75671))

(assert (=> bs!3258 m!75673))

(declare-fun m!75989 () Bool)

(assert (=> bs!3258 m!75989))

(declare-fun m!75991 () Bool)

(assert (=> bs!3258 m!75991))

(assert (=> b!76142 d!18131))

(declare-fun d!18133 () Bool)

(assert (=> d!18133 (= (apply!77 lt!34572 lt!34578) (get!1160 (getValueByKey!133 (toList!723 lt!34572) lt!34578)))))

(declare-fun bs!3259 () Bool)

(assert (= bs!3259 d!18133))

(declare-fun m!75993 () Bool)

(assert (=> bs!3259 m!75993))

(assert (=> bs!3259 m!75993))

(declare-fun m!75995 () Bool)

(assert (=> bs!3259 m!75995))

(assert (=> b!76142 d!18133))

(declare-fun d!18135 () Bool)

(declare-fun e!49870 () Bool)

(assert (=> d!18135 e!49870))

(declare-fun res!40179 () Bool)

(assert (=> d!18135 (=> (not res!40179) (not e!49870))))

(declare-fun lt!34722 () ListLongMap!1415)

(assert (=> d!18135 (= res!40179 (contains!726 lt!34722 (_1!1080 (tuple2!2139 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(declare-fun lt!34721 () List!1494)

(assert (=> d!18135 (= lt!34722 (ListLongMap!1416 lt!34721))))

(declare-fun lt!34720 () Unit!2179)

(declare-fun lt!34723 () Unit!2179)

(assert (=> d!18135 (= lt!34720 lt!34723)))

(assert (=> d!18135 (= (getValueByKey!133 lt!34721 (_1!1080 (tuple2!2139 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))) (Some!138 (_2!1080 (tuple2!2139 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18135 (= lt!34723 (lemmaContainsTupThenGetReturnValue!53 lt!34721 (_1!1080 (tuple2!2139 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992))))) (_2!1080 (tuple2!2139 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18135 (= lt!34721 (insertStrictlySorted!56 (toList!723 lt!34579) (_1!1080 (tuple2!2139 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992))))) (_2!1080 (tuple2!2139 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18135 (= (+!97 lt!34579 (tuple2!2139 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34722)))

(declare-fun b!76375 () Bool)

(declare-fun res!40178 () Bool)

(assert (=> b!76375 (=> (not res!40178) (not e!49870))))

(assert (=> b!76375 (= res!40178 (= (getValueByKey!133 (toList!723 lt!34722) (_1!1080 (tuple2!2139 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))) (Some!138 (_2!1080 (tuple2!2139 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992))))))))))

(declare-fun b!76376 () Bool)

(assert (=> b!76376 (= e!49870 (contains!730 (toList!723 lt!34722) (tuple2!2139 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992))))))))

(assert (= (and d!18135 res!40179) b!76375))

(assert (= (and b!76375 res!40178) b!76376))

(declare-fun m!75997 () Bool)

(assert (=> d!18135 m!75997))

(declare-fun m!75999 () Bool)

(assert (=> d!18135 m!75999))

(declare-fun m!76001 () Bool)

(assert (=> d!18135 m!76001))

(declare-fun m!76003 () Bool)

(assert (=> d!18135 m!76003))

(declare-fun m!76005 () Bool)

(assert (=> b!76375 m!76005))

(declare-fun m!76007 () Bool)

(assert (=> b!76376 m!76007))

(assert (=> b!76142 d!18135))

(declare-fun d!18137 () Bool)

(assert (=> d!18137 (= (apply!77 (+!97 lt!34579 (tuple2!2139 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34575) (apply!77 lt!34579 lt!34575))))

(declare-fun lt!34724 () Unit!2179)

(assert (=> d!18137 (= lt!34724 (choose!449 lt!34579 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992))) lt!34575))))

(declare-fun e!49871 () Bool)

(assert (=> d!18137 e!49871))

(declare-fun res!40180 () Bool)

(assert (=> d!18137 (=> (not res!40180) (not e!49871))))

(assert (=> d!18137 (= res!40180 (contains!726 lt!34579 lt!34575))))

(assert (=> d!18137 (= (addApplyDifferent!53 lt!34579 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992))) lt!34575) lt!34724)))

(declare-fun b!76377 () Bool)

(assert (=> b!76377 (= e!49871 (not (= lt!34575 lt!34585)))))

(assert (= (and d!18137 res!40180) b!76377))

(declare-fun m!76009 () Bool)

(assert (=> d!18137 m!76009))

(declare-fun m!76011 () Bool)

(assert (=> d!18137 m!76011))

(assert (=> d!18137 m!75679))

(assert (=> d!18137 m!75689))

(assert (=> d!18137 m!75679))

(assert (=> d!18137 m!75687))

(assert (=> b!76142 d!18137))

(declare-fun d!18139 () Bool)

(declare-fun e!49872 () Bool)

(assert (=> d!18139 e!49872))

(declare-fun res!40182 () Bool)

(assert (=> d!18139 (=> (not res!40182) (not e!49872))))

(declare-fun lt!34727 () ListLongMap!1415)

(assert (=> d!18139 (= res!40182 (contains!726 lt!34727 (_1!1080 (tuple2!2139 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(declare-fun lt!34726 () List!1494)

(assert (=> d!18139 (= lt!34727 (ListLongMap!1416 lt!34726))))

(declare-fun lt!34725 () Unit!2179)

(declare-fun lt!34728 () Unit!2179)

(assert (=> d!18139 (= lt!34725 lt!34728)))

(assert (=> d!18139 (= (getValueByKey!133 lt!34726 (_1!1080 (tuple2!2139 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))) (Some!138 (_2!1080 (tuple2!2139 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18139 (= lt!34728 (lemmaContainsTupThenGetReturnValue!53 lt!34726 (_1!1080 (tuple2!2139 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992))))) (_2!1080 (tuple2!2139 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18139 (= lt!34726 (insertStrictlySorted!56 (toList!723 lt!34572) (_1!1080 (tuple2!2139 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992))))) (_2!1080 (tuple2!2139 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18139 (= (+!97 lt!34572 (tuple2!2139 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34727)))

(declare-fun b!76378 () Bool)

(declare-fun res!40181 () Bool)

(assert (=> b!76378 (=> (not res!40181) (not e!49872))))

(assert (=> b!76378 (= res!40181 (= (getValueByKey!133 (toList!723 lt!34727) (_1!1080 (tuple2!2139 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))) (Some!138 (_2!1080 (tuple2!2139 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992))))))))))

(declare-fun b!76379 () Bool)

(assert (=> b!76379 (= e!49872 (contains!730 (toList!723 lt!34727) (tuple2!2139 lt!34574 (minValue!2145 (v!2552 (underlying!262 thiss!992))))))))

(assert (= (and d!18139 res!40182) b!76378))

(assert (= (and b!76378 res!40181) b!76379))

(declare-fun m!76013 () Bool)

(assert (=> d!18139 m!76013))

(declare-fun m!76015 () Bool)

(assert (=> d!18139 m!76015))

(declare-fun m!76017 () Bool)

(assert (=> d!18139 m!76017))

(declare-fun m!76019 () Bool)

(assert (=> d!18139 m!76019))

(declare-fun m!76021 () Bool)

(assert (=> b!76378 m!76021))

(declare-fun m!76023 () Bool)

(assert (=> b!76379 m!76023))

(assert (=> b!76142 d!18139))

(declare-fun d!18141 () Bool)

(declare-fun e!49873 () Bool)

(assert (=> d!18141 e!49873))

(declare-fun res!40184 () Bool)

(assert (=> d!18141 (=> (not res!40184) (not e!49873))))

(declare-fun lt!34731 () ListLongMap!1415)

(assert (=> d!18141 (= res!40184 (contains!726 lt!34731 (_1!1080 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(declare-fun lt!34730 () List!1494)

(assert (=> d!18141 (= lt!34731 (ListLongMap!1416 lt!34730))))

(declare-fun lt!34729 () Unit!2179)

(declare-fun lt!34732 () Unit!2179)

(assert (=> d!18141 (= lt!34729 lt!34732)))

(assert (=> d!18141 (= (getValueByKey!133 lt!34730 (_1!1080 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))) (Some!138 (_2!1080 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18141 (= lt!34732 (lemmaContainsTupThenGetReturnValue!53 lt!34730 (_1!1080 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) (_2!1080 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18141 (= lt!34730 (insertStrictlySorted!56 (toList!723 lt!34573) (_1!1080 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) (_2!1080 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18141 (= (+!97 lt!34573 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34731)))

(declare-fun b!76380 () Bool)

(declare-fun res!40183 () Bool)

(assert (=> b!76380 (=> (not res!40183) (not e!49873))))

(assert (=> b!76380 (= res!40183 (= (getValueByKey!133 (toList!723 lt!34731) (_1!1080 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))) (Some!138 (_2!1080 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))))))))

(declare-fun b!76381 () Bool)

(assert (=> b!76381 (= e!49873 (contains!730 (toList!723 lt!34731) (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))))))

(assert (= (and d!18141 res!40184) b!76380))

(assert (= (and b!76380 res!40183) b!76381))

(declare-fun m!76025 () Bool)

(assert (=> d!18141 m!76025))

(declare-fun m!76027 () Bool)

(assert (=> d!18141 m!76027))

(declare-fun m!76029 () Bool)

(assert (=> d!18141 m!76029))

(declare-fun m!76031 () Bool)

(assert (=> d!18141 m!76031))

(declare-fun m!76033 () Bool)

(assert (=> b!76380 m!76033))

(declare-fun m!76035 () Bool)

(assert (=> b!76381 m!76035))

(assert (=> b!76142 d!18141))

(declare-fun d!18143 () Bool)

(assert (=> d!18143 (= (apply!77 lt!34580 lt!34589) (get!1160 (getValueByKey!133 (toList!723 lt!34580) lt!34589)))))

(declare-fun bs!3260 () Bool)

(assert (= bs!3260 d!18143))

(declare-fun m!76037 () Bool)

(assert (=> bs!3260 m!76037))

(assert (=> bs!3260 m!76037))

(declare-fun m!76039 () Bool)

(assert (=> bs!3260 m!76039))

(assert (=> b!76142 d!18143))

(declare-fun d!18145 () Bool)

(assert (=> d!18145 (= (apply!77 (+!97 lt!34579 (tuple2!2139 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34575) (get!1160 (getValueByKey!133 (toList!723 (+!97 lt!34579 (tuple2!2139 lt!34585 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))) lt!34575)))))

(declare-fun bs!3261 () Bool)

(assert (= bs!3261 d!18145))

(declare-fun m!76041 () Bool)

(assert (=> bs!3261 m!76041))

(assert (=> bs!3261 m!76041))

(declare-fun m!76043 () Bool)

(assert (=> bs!3261 m!76043))

(assert (=> b!76142 d!18145))

(declare-fun d!18147 () Bool)

(declare-fun e!49874 () Bool)

(assert (=> d!18147 e!49874))

(declare-fun res!40185 () Bool)

(assert (=> d!18147 (=> res!40185 e!49874)))

(declare-fun lt!34736 () Bool)

(assert (=> d!18147 (= res!40185 (not lt!34736))))

(declare-fun lt!34735 () Bool)

(assert (=> d!18147 (= lt!34736 lt!34735)))

(declare-fun lt!34734 () Unit!2179)

(declare-fun e!49875 () Unit!2179)

(assert (=> d!18147 (= lt!34734 e!49875)))

(declare-fun c!11656 () Bool)

(assert (=> d!18147 (= c!11656 lt!34735)))

(assert (=> d!18147 (= lt!34735 (containsKey!137 (toList!723 (+!97 lt!34573 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))) lt!34586))))

(assert (=> d!18147 (= (contains!726 (+!97 lt!34573 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34586) lt!34736)))

(declare-fun b!76382 () Bool)

(declare-fun lt!34733 () Unit!2179)

(assert (=> b!76382 (= e!49875 lt!34733)))

(assert (=> b!76382 (= lt!34733 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 (+!97 lt!34573 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))) lt!34586))))

(assert (=> b!76382 (isDefined!87 (getValueByKey!133 (toList!723 (+!97 lt!34573 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))) lt!34586))))

(declare-fun b!76383 () Bool)

(declare-fun Unit!2200 () Unit!2179)

(assert (=> b!76383 (= e!49875 Unit!2200)))

(declare-fun b!76384 () Bool)

(assert (=> b!76384 (= e!49874 (isDefined!87 (getValueByKey!133 (toList!723 (+!97 lt!34573 (tuple2!2139 lt!34590 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))) lt!34586)))))

(assert (= (and d!18147 c!11656) b!76382))

(assert (= (and d!18147 (not c!11656)) b!76383))

(assert (= (and d!18147 (not res!40185)) b!76384))

(declare-fun m!76045 () Bool)

(assert (=> d!18147 m!76045))

(declare-fun m!76047 () Bool)

(assert (=> b!76382 m!76047))

(declare-fun m!76049 () Bool)

(assert (=> b!76382 m!76049))

(assert (=> b!76382 m!76049))

(declare-fun m!76051 () Bool)

(assert (=> b!76382 m!76051))

(assert (=> b!76384 m!76049))

(assert (=> b!76384 m!76049))

(assert (=> b!76384 m!76051))

(assert (=> b!76142 d!18147))

(declare-fun d!18149 () Bool)

(declare-fun e!49876 () Bool)

(assert (=> d!18149 e!49876))

(declare-fun res!40187 () Bool)

(assert (=> d!18149 (=> (not res!40187) (not e!49876))))

(declare-fun lt!34739 () ListLongMap!1415)

(assert (=> d!18149 (= res!40187 (contains!726 lt!34739 (_1!1080 (tuple2!2139 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(declare-fun lt!34738 () List!1494)

(assert (=> d!18149 (= lt!34739 (ListLongMap!1416 lt!34738))))

(declare-fun lt!34737 () Unit!2179)

(declare-fun lt!34740 () Unit!2179)

(assert (=> d!18149 (= lt!34737 lt!34740)))

(assert (=> d!18149 (= (getValueByKey!133 lt!34738 (_1!1080 (tuple2!2139 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))) (Some!138 (_2!1080 (tuple2!2139 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18149 (= lt!34740 (lemmaContainsTupThenGetReturnValue!53 lt!34738 (_1!1080 (tuple2!2139 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) (_2!1080 (tuple2!2139 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18149 (= lt!34738 (insertStrictlySorted!56 (toList!723 lt!34580) (_1!1080 (tuple2!2139 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) (_2!1080 (tuple2!2139 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18149 (= (+!97 lt!34580 (tuple2!2139 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34739)))

(declare-fun b!76385 () Bool)

(declare-fun res!40186 () Bool)

(assert (=> b!76385 (=> (not res!40186) (not e!49876))))

(assert (=> b!76385 (= res!40186 (= (getValueByKey!133 (toList!723 lt!34739) (_1!1080 (tuple2!2139 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))) (Some!138 (_2!1080 (tuple2!2139 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))))))))

(declare-fun b!76386 () Bool)

(assert (=> b!76386 (= e!49876 (contains!730 (toList!723 lt!34739) (tuple2!2139 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))))))

(assert (= (and d!18149 res!40187) b!76385))

(assert (= (and b!76385 res!40186) b!76386))

(declare-fun m!76053 () Bool)

(assert (=> d!18149 m!76053))

(declare-fun m!76055 () Bool)

(assert (=> d!18149 m!76055))

(declare-fun m!76057 () Bool)

(assert (=> d!18149 m!76057))

(declare-fun m!76059 () Bool)

(assert (=> d!18149 m!76059))

(declare-fun m!76061 () Bool)

(assert (=> b!76385 m!76061))

(declare-fun m!76063 () Bool)

(assert (=> b!76386 m!76063))

(assert (=> b!76142 d!18149))

(declare-fun d!18151 () Bool)

(assert (=> d!18151 (= (apply!77 (+!97 lt!34580 (tuple2!2139 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34589) (apply!77 lt!34580 lt!34589))))

(declare-fun lt!34741 () Unit!2179)

(assert (=> d!18151 (= lt!34741 (choose!449 lt!34580 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) lt!34589))))

(declare-fun e!49877 () Bool)

(assert (=> d!18151 e!49877))

(declare-fun res!40188 () Bool)

(assert (=> d!18151 (=> (not res!40188) (not e!49877))))

(assert (=> d!18151 (= res!40188 (contains!726 lt!34580 lt!34589))))

(assert (=> d!18151 (= (addApplyDifferent!53 lt!34580 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) lt!34589) lt!34741)))

(declare-fun b!76387 () Bool)

(assert (=> b!76387 (= e!49877 (not (= lt!34589 lt!34584)))))

(assert (= (and d!18151 res!40188) b!76387))

(declare-fun m!76065 () Bool)

(assert (=> d!18151 m!76065))

(declare-fun m!76067 () Bool)

(assert (=> d!18151 m!76067))

(assert (=> d!18151 m!75663))

(assert (=> d!18151 m!75669))

(assert (=> d!18151 m!75663))

(assert (=> d!18151 m!75681))

(assert (=> b!76142 d!18151))

(declare-fun d!18153 () Bool)

(assert (=> d!18153 (= (apply!77 (+!97 lt!34580 (tuple2!2139 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34589) (get!1160 (getValueByKey!133 (toList!723 (+!97 lt!34580 (tuple2!2139 lt!34584 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))) lt!34589)))))

(declare-fun bs!3262 () Bool)

(assert (= bs!3262 d!18153))

(declare-fun m!76069 () Bool)

(assert (=> bs!3262 m!76069))

(assert (=> bs!3262 m!76069))

(declare-fun m!76071 () Bool)

(assert (=> bs!3262 m!76071))

(assert (=> b!76142 d!18153))

(assert (=> d!18029 d!18035))

(declare-fun d!18155 () Bool)

(assert (=> d!18155 (arrayNoDuplicates!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) from!355 Nil!1490)))

(assert (=> d!18155 true))

(declare-fun _$71!102 () Unit!2179)

(assert (=> d!18155 (= (choose!39 (_keys!3903 (v!2552 (underlying!262 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!102)))

(declare-fun bs!3263 () Bool)

(assert (= bs!3263 d!18155))

(assert (=> bs!3263 m!75409))

(assert (=> d!18029 d!18155))

(declare-fun b!76390 () Bool)

(declare-fun e!49879 () Option!139)

(assert (=> b!76390 (= e!49879 (getValueByKey!133 (t!5079 (toList!723 lt!34636)) (_1!1080 lt!34342)))))

(declare-fun b!76391 () Bool)

(assert (=> b!76391 (= e!49879 None!137)))

(declare-fun b!76389 () Bool)

(declare-fun e!49878 () Option!139)

(assert (=> b!76389 (= e!49878 e!49879)))

(declare-fun c!11658 () Bool)

(assert (=> b!76389 (= c!11658 (and ((_ is Cons!1490) (toList!723 lt!34636)) (not (= (_1!1080 (h!2078 (toList!723 lt!34636))) (_1!1080 lt!34342)))))))

(declare-fun b!76388 () Bool)

(assert (=> b!76388 (= e!49878 (Some!138 (_2!1080 (h!2078 (toList!723 lt!34636)))))))

(declare-fun d!18157 () Bool)

(declare-fun c!11657 () Bool)

(assert (=> d!18157 (= c!11657 (and ((_ is Cons!1490) (toList!723 lt!34636)) (= (_1!1080 (h!2078 (toList!723 lt!34636))) (_1!1080 lt!34342))))))

(assert (=> d!18157 (= (getValueByKey!133 (toList!723 lt!34636) (_1!1080 lt!34342)) e!49878)))

(assert (= (and d!18157 c!11657) b!76388))

(assert (= (and d!18157 (not c!11657)) b!76389))

(assert (= (and b!76389 c!11658) b!76390))

(assert (= (and b!76389 (not c!11658)) b!76391))

(declare-fun m!76073 () Bool)

(assert (=> b!76390 m!76073))

(assert (=> b!76211 d!18157))

(declare-fun d!18159 () Bool)

(assert (=> d!18159 (arrayContainsKey!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) lt!34649 #b00000000000000000000000000000000)))

(declare-fun lt!34744 () Unit!2179)

(declare-fun choose!13 (array!3899 (_ BitVec 64) (_ BitVec 32)) Unit!2179)

(assert (=> d!18159 (= lt!34744 (choose!13 (_keys!3903 (v!2552 (underlying!262 thiss!992))) lt!34649 #b00000000000000000000000000000000))))

(assert (=> d!18159 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!18159 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) lt!34649 #b00000000000000000000000000000000) lt!34744)))

(declare-fun bs!3264 () Bool)

(assert (= bs!3264 d!18159))

(assert (=> bs!3264 m!75781))

(declare-fun m!76075 () Bool)

(assert (=> bs!3264 m!76075))

(assert (=> b!76223 d!18159))

(declare-fun d!18161 () Bool)

(declare-fun res!40189 () Bool)

(declare-fun e!49880 () Bool)

(assert (=> d!18161 (=> res!40189 e!49880)))

(assert (=> d!18161 (= res!40189 (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000) lt!34649))))

(assert (=> d!18161 (= (arrayContainsKey!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) lt!34649 #b00000000000000000000000000000000) e!49880)))

(declare-fun b!76392 () Bool)

(declare-fun e!49881 () Bool)

(assert (=> b!76392 (= e!49880 e!49881)))

(declare-fun res!40190 () Bool)

(assert (=> b!76392 (=> (not res!40190) (not e!49881))))

(assert (=> b!76392 (= res!40190 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun b!76393 () Bool)

(assert (=> b!76393 (= e!49881 (arrayContainsKey!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) lt!34649 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!18161 (not res!40189)) b!76392))

(assert (= (and b!76392 res!40190) b!76393))

(assert (=> d!18161 m!75573))

(declare-fun m!76077 () Bool)

(assert (=> b!76393 m!76077))

(assert (=> b!76223 d!18161))

(declare-fun b!76394 () Bool)

(declare-fun c!11659 () Bool)

(declare-fun lt!34747 () (_ BitVec 64))

(assert (=> b!76394 (= c!11659 (= lt!34747 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49884 () SeekEntryResult!241)

(declare-fun e!49882 () SeekEntryResult!241)

(assert (=> b!76394 (= e!49884 e!49882)))

(declare-fun b!76395 () Bool)

(declare-fun e!49883 () SeekEntryResult!241)

(assert (=> b!76395 (= e!49883 e!49884)))

(declare-fun lt!34746 () SeekEntryResult!241)

(assert (=> b!76395 (= lt!34747 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (index!3099 lt!34746)))))

(declare-fun c!11660 () Bool)

(assert (=> b!76395 (= c!11660 (= lt!34747 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!76396 () Bool)

(assert (=> b!76396 (= e!49882 (MissingZero!241 (index!3099 lt!34746)))))

(declare-fun b!76397 () Bool)

(assert (=> b!76397 (= e!49882 (seekKeyOrZeroReturnVacant!0 (x!11389 lt!34746) (index!3099 lt!34746) (index!3099 lt!34746) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000) (_keys!3903 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun d!18163 () Bool)

(declare-fun lt!34745 () SeekEntryResult!241)

(assert (=> d!18163 (and (or ((_ is Undefined!241) lt!34745) (not ((_ is Found!241) lt!34745)) (and (bvsge (index!3098 lt!34745) #b00000000000000000000000000000000) (bvslt (index!3098 lt!34745) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))) (or ((_ is Undefined!241) lt!34745) ((_ is Found!241) lt!34745) (not ((_ is MissingZero!241) lt!34745)) (and (bvsge (index!3097 lt!34745) #b00000000000000000000000000000000) (bvslt (index!3097 lt!34745) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))) (or ((_ is Undefined!241) lt!34745) ((_ is Found!241) lt!34745) ((_ is MissingZero!241) lt!34745) (not ((_ is MissingVacant!241) lt!34745)) (and (bvsge (index!3100 lt!34745) #b00000000000000000000000000000000) (bvslt (index!3100 lt!34745) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))) (or ((_ is Undefined!241) lt!34745) (ite ((_ is Found!241) lt!34745) (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (index!3098 lt!34745)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!241) lt!34745) (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (index!3097 lt!34745)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!241) lt!34745) (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (index!3100 lt!34745)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18163 (= lt!34745 e!49883)))

(declare-fun c!11661 () Bool)

(assert (=> d!18163 (= c!11661 (and ((_ is Intermediate!241) lt!34746) (undefined!1053 lt!34746)))))

(assert (=> d!18163 (= lt!34746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000) (mask!6228 (v!2552 (underlying!262 thiss!992)))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000) (_keys!3903 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992)))))))

(assert (=> d!18163 (validMask!0 (mask!6228 (v!2552 (underlying!262 thiss!992))))))

(assert (=> d!18163 (= (seekEntryOrOpen!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000) (_keys!3903 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992)))) lt!34745)))

(declare-fun b!76398 () Bool)

(assert (=> b!76398 (= e!49883 Undefined!241)))

(declare-fun b!76399 () Bool)

(assert (=> b!76399 (= e!49884 (Found!241 (index!3099 lt!34746)))))

(assert (= (and d!18163 c!11661) b!76398))

(assert (= (and d!18163 (not c!11661)) b!76395))

(assert (= (and b!76395 c!11660) b!76399))

(assert (= (and b!76395 (not c!11660)) b!76394))

(assert (= (and b!76394 c!11659) b!76396))

(assert (= (and b!76394 (not c!11659)) b!76397))

(declare-fun m!76079 () Bool)

(assert (=> b!76395 m!76079))

(assert (=> b!76397 m!75573))

(declare-fun m!76081 () Bool)

(assert (=> b!76397 m!76081))

(assert (=> d!18163 m!75573))

(declare-fun m!76083 () Bool)

(assert (=> d!18163 m!76083))

(declare-fun m!76085 () Bool)

(assert (=> d!18163 m!76085))

(assert (=> d!18163 m!75381))

(declare-fun m!76087 () Bool)

(assert (=> d!18163 m!76087))

(assert (=> d!18163 m!76083))

(assert (=> d!18163 m!75573))

(declare-fun m!76089 () Bool)

(assert (=> d!18163 m!76089))

(declare-fun m!76091 () Bool)

(assert (=> d!18163 m!76091))

(assert (=> b!76223 d!18163))

(declare-fun d!18165 () Bool)

(assert (=> d!18165 (= (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76221 d!18165))

(declare-fun b!76434 () Bool)

(declare-fun e!49908 () Bool)

(declare-fun call!6914 () Bool)

(assert (=> b!76434 (= e!49908 (not call!6914))))

(declare-fun b!76435 () Bool)

(declare-fun c!11671 () Bool)

(declare-fun lt!34834 () SeekEntryResult!241)

(assert (=> b!76435 (= c!11671 ((_ is MissingVacant!241) lt!34834))))

(declare-fun e!49904 () Bool)

(declare-fun e!49907 () Bool)

(assert (=> b!76435 (= e!49904 e!49907)))

(declare-fun b!76436 () Bool)

(declare-fun res!40212 () Bool)

(assert (=> b!76436 (=> (not res!40212) (not e!49908))))

(assert (=> b!76436 (= res!40212 (= (select (arr!1858 (_keys!3903 newMap!16)) (index!3097 lt!34834)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76437 () Bool)

(declare-fun res!40213 () Bool)

(declare-fun call!6912 () Bool)

(assert (=> b!76437 (= res!40213 call!6912)))

(declare-fun e!49906 () Bool)

(assert (=> b!76437 (=> (not res!40213) (not e!49906))))

(declare-fun lt!34828 () SeekEntryResult!241)

(declare-fun b!76438 () Bool)

(assert (=> b!76438 (= e!49906 (= (select (arr!1858 (_keys!3903 newMap!16)) (index!3098 lt!34828)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun b!76439 () Bool)

(assert (=> b!76439 (= e!49907 ((_ is Undefined!241) lt!34834))))

(declare-fun d!18167 () Bool)

(declare-fun e!49905 () Bool)

(assert (=> d!18167 e!49905))

(declare-fun res!40211 () Bool)

(assert (=> d!18167 (=> (not res!40211) (not e!49905))))

(declare-fun lt!34823 () tuple2!2140)

(assert (=> d!18167 (= res!40211 (_1!1081 lt!34823))))

(assert (=> d!18167 (= lt!34823 (tuple2!2141 true (LongMapFixedSize!707 (defaultEntry!2246 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (bvadd (_size!402 newMap!16) #b00000000000000000000000000000001) (array!3900 (store (arr!1858 (_keys!3903 newMap!16)) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) (size!2099 (_keys!3903 newMap!16))) (array!3902 (store (arr!1859 (_values!2229 newMap!16)) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (ValueCellFull!899 lt!34341)) (size!2100 (_values!2229 newMap!16))) (_vacant!402 newMap!16))))))

(declare-fun lt!34825 () Unit!2179)

(declare-fun lt!34835 () Unit!2179)

(assert (=> d!18167 (= lt!34825 lt!34835)))

(declare-fun lt!34827 () array!3901)

(declare-fun lt!34832 () array!3899)

(assert (=> d!18167 (contains!726 (getCurrentListMap!415 lt!34832 lt!34827 (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (select (store (arr!1858 (_keys!3903 newMap!16)) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514))))))

(assert (=> d!18167 (= lt!34835 (lemmaValidKeyInArrayIsInListMap!85 lt!34832 lt!34827 (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (defaultEntry!2246 newMap!16)))))

(assert (=> d!18167 (= lt!34827 (array!3902 (store (arr!1859 (_values!2229 newMap!16)) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (ValueCellFull!899 lt!34341)) (size!2100 (_values!2229 newMap!16))))))

(assert (=> d!18167 (= lt!34832 (array!3900 (store (arr!1858 (_keys!3903 newMap!16)) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) (size!2099 (_keys!3903 newMap!16))))))

(declare-fun lt!34813 () Unit!2179)

(declare-fun lt!34815 () Unit!2179)

(assert (=> d!18167 (= lt!34813 lt!34815)))

(declare-fun lt!34833 () array!3899)

(assert (=> d!18167 (= (arrayCountValidKeys!0 lt!34833 (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (bvadd (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!3899 (_ BitVec 32)) Unit!2179)

(assert (=> d!18167 (= lt!34815 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!34833 (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514))))))

(assert (=> d!18167 (= lt!34833 (array!3900 (store (arr!1858 (_keys!3903 newMap!16)) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) (size!2099 (_keys!3903 newMap!16))))))

(declare-fun lt!34817 () Unit!2179)

(declare-fun lt!34819 () Unit!2179)

(assert (=> d!18167 (= lt!34817 lt!34819)))

(declare-fun lt!34826 () array!3899)

(assert (=> d!18167 (arrayContainsKey!0 lt!34826 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!18167 (= lt!34819 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!34826 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514))))))

(assert (=> d!18167 (= lt!34826 (array!3900 (store (arr!1858 (_keys!3903 newMap!16)) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) (size!2099 (_keys!3903 newMap!16))))))

(declare-fun lt!34824 () Unit!2179)

(declare-fun lt!34814 () Unit!2179)

(assert (=> d!18167 (= lt!34824 lt!34814)))

(assert (=> d!18167 (= (+!97 (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)) (getCurrentListMap!415 (array!3900 (store (arr!1858 (_keys!3903 newMap!16)) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) (size!2099 (_keys!3903 newMap!16))) (array!3902 (store (arr!1859 (_values!2229 newMap!16)) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (ValueCellFull!899 lt!34341)) (size!2100 (_values!2229 newMap!16))) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!15 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 32) (_ BitVec 64) V!2961 Int) Unit!2179)

(assert (=> d!18167 (= lt!34814 (lemmaAddValidKeyToArrayThenAddPairToListMap!15 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34837 () Unit!2179)

(declare-fun lt!34830 () Unit!2179)

(assert (=> d!18167 (= lt!34837 lt!34830)))

(assert (=> d!18167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!3900 (store (arr!1858 (_keys!3903 newMap!16)) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) (size!2099 (_keys!3903 newMap!16))) (mask!6228 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!3899 (_ BitVec 32) (_ BitVec 32)) Unit!2179)

(assert (=> d!18167 (= lt!34830 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (_keys!3903 newMap!16) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (mask!6228 newMap!16)))))

(declare-fun lt!34829 () Unit!2179)

(declare-fun lt!34831 () Unit!2179)

(assert (=> d!18167 (= lt!34829 lt!34831)))

(assert (=> d!18167 (= (arrayCountValidKeys!0 (array!3900 (store (arr!1858 (_keys!3903 newMap!16)) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) (size!2099 (_keys!3903 newMap!16))) #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!3903 newMap!16) #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!3899 (_ BitVec 32) (_ BitVec 64)) Unit!2179)

(assert (=> d!18167 (= lt!34831 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3903 newMap!16) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun lt!34822 () Unit!2179)

(declare-fun lt!34818 () Unit!2179)

(assert (=> d!18167 (= lt!34822 lt!34818)))

(declare-fun lt!34808 () List!1493)

(declare-fun lt!34811 () (_ BitVec 32))

(assert (=> d!18167 (arrayNoDuplicates!0 (array!3900 (store (arr!1858 (_keys!3903 newMap!16)) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) (size!2099 (_keys!3903 newMap!16))) lt!34811 lt!34808)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!3899 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1493) Unit!2179)

(assert (=> d!18167 (= lt!34818 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3903 newMap!16) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514)) lt!34811 lt!34808))))

(assert (=> d!18167 (= lt!34808 Nil!1490)))

(assert (=> d!18167 (= lt!34811 #b00000000000000000000000000000000)))

(declare-fun lt!34816 () Unit!2179)

(declare-fun e!49903 () Unit!2179)

(assert (=> d!18167 (= lt!34816 e!49903)))

(declare-fun c!11672 () Bool)

(assert (=> d!18167 (= c!11672 (arrayContainsKey!0 (_keys!3903 newMap!16) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!34810 () Unit!2179)

(declare-fun e!49901 () Unit!2179)

(assert (=> d!18167 (= lt!34810 e!49901)))

(declare-fun c!11670 () Bool)

(assert (=> d!18167 (= c!11670 (contains!726 (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(assert (=> d!18167 (valid!307 newMap!16)))

(assert (=> d!18167 (= (updateHelperNewKey!26 newMap!16 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341 (ite c!11562 (index!3100 lt!34514) (index!3097 lt!34514))) lt!34823)))

(declare-fun bm!6908 () Bool)

(declare-fun call!6913 () SeekEntryResult!241)

(assert (=> bm!6908 (= call!6913 (seekEntryOrOpen!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (_keys!3903 newMap!16) (mask!6228 newMap!16)))))

(declare-fun b!76440 () Bool)

(declare-fun res!40209 () Bool)

(assert (=> b!76440 (=> (not res!40209) (not e!49908))))

(declare-fun call!6911 () Bool)

(assert (=> b!76440 (= res!40209 call!6911)))

(assert (=> b!76440 (= e!49904 e!49908)))

(declare-fun b!76441 () Bool)

(assert (=> b!76441 (= e!49905 (= (map!1159 (_2!1081 lt!34823)) (+!97 (map!1159 newMap!16) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))

(declare-fun b!76442 () Bool)

(declare-fun e!49902 () Bool)

(assert (=> b!76442 (= e!49907 e!49902)))

(declare-fun res!40216 () Bool)

(assert (=> b!76442 (= res!40216 call!6911)))

(assert (=> b!76442 (=> (not res!40216) (not e!49902))))

(declare-fun b!76443 () Bool)

(declare-fun Unit!2201 () Unit!2179)

(assert (=> b!76443 (= e!49903 Unit!2201)))

(declare-fun lt!34836 () Unit!2179)

(declare-fun lemmaArrayContainsKeyThenInListMap!15 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 64) (_ BitVec 32) Int) Unit!2179)

(assert (=> b!76443 (= lt!34836 (lemmaArrayContainsKeyThenInListMap!15 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(assert (=> b!76443 (contains!726 (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355))))

(declare-fun lt!34809 () Unit!2179)

(assert (=> b!76443 (= lt!34809 lt!34836)))

(assert (=> b!76443 false))

(declare-fun b!76444 () Bool)

(declare-fun res!40215 () Bool)

(assert (=> b!76444 (=> (not res!40215) (not e!49905))))

(assert (=> b!76444 (= res!40215 (contains!726 (map!1159 (_2!1081 lt!34823)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun bm!6909 () Bool)

(assert (=> bm!6909 (= call!6914 (arrayContainsKey!0 (_keys!3903 newMap!16) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!76445 () Bool)

(declare-fun res!40214 () Bool)

(assert (=> b!76445 (= res!40214 (= (select (arr!1858 (_keys!3903 newMap!16)) (index!3100 lt!34834)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76445 (=> (not res!40214) (not e!49902))))

(declare-fun b!76446 () Bool)

(declare-fun Unit!2202 () Unit!2179)

(assert (=> b!76446 (= e!49901 Unit!2202)))

(declare-fun lt!34821 () Unit!2179)

(assert (=> b!76446 (= lt!34821 (lemmaInListMapThenSeekEntryOrOpenFindsIt!26 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (defaultEntry!2246 newMap!16)))))

(assert (=> b!76446 (= lt!34828 call!6913)))

(declare-fun res!40217 () Bool)

(assert (=> b!76446 (= res!40217 ((_ is Found!241) lt!34828))))

(assert (=> b!76446 (=> (not res!40217) (not e!49906))))

(assert (=> b!76446 e!49906))

(declare-fun lt!34812 () Unit!2179)

(assert (=> b!76446 (= lt!34812 lt!34821)))

(assert (=> b!76446 false))

(declare-fun b!76447 () Bool)

(assert (=> b!76447 (= e!49902 (not call!6914))))

(declare-fun b!76448 () Bool)

(declare-fun lt!34820 () Unit!2179)

(assert (=> b!76448 (= e!49901 lt!34820)))

(assert (=> b!76448 (= lt!34820 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!26 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (defaultEntry!2246 newMap!16)))))

(assert (=> b!76448 (= lt!34834 call!6913)))

(declare-fun c!11673 () Bool)

(assert (=> b!76448 (= c!11673 ((_ is MissingZero!241) lt!34834))))

(assert (=> b!76448 e!49904))

(declare-fun bm!6910 () Bool)

(assert (=> bm!6910 (= call!6911 call!6912)))

(declare-fun bm!6911 () Bool)

(assert (=> bm!6911 (= call!6912 (inRange!0 (ite c!11670 (index!3098 lt!34828) (ite c!11673 (index!3097 lt!34834) (index!3100 lt!34834))) (mask!6228 newMap!16)))))

(declare-fun b!76449 () Bool)

(declare-fun Unit!2203 () Unit!2179)

(assert (=> b!76449 (= e!49903 Unit!2203)))

(declare-fun b!76450 () Bool)

(declare-fun res!40210 () Bool)

(assert (=> b!76450 (=> (not res!40210) (not e!49905))))

(assert (=> b!76450 (= res!40210 (valid!307 (_2!1081 lt!34823)))))

(assert (= (and d!18167 c!11670) b!76446))

(assert (= (and d!18167 (not c!11670)) b!76448))

(assert (= (and b!76446 res!40217) b!76437))

(assert (= (and b!76437 res!40213) b!76438))

(assert (= (and b!76448 c!11673) b!76440))

(assert (= (and b!76448 (not c!11673)) b!76435))

(assert (= (and b!76440 res!40209) b!76436))

(assert (= (and b!76436 res!40212) b!76434))

(assert (= (and b!76435 c!11671) b!76442))

(assert (= (and b!76435 (not c!11671)) b!76439))

(assert (= (and b!76442 res!40216) b!76445))

(assert (= (and b!76445 res!40214) b!76447))

(assert (= (or b!76440 b!76442) bm!6910))

(assert (= (or b!76434 b!76447) bm!6909))

(assert (= (or b!76437 bm!6910) bm!6911))

(assert (= (or b!76446 b!76448) bm!6908))

(assert (= (and d!18167 c!11672) b!76443))

(assert (= (and d!18167 (not c!11672)) b!76449))

(assert (= (and d!18167 res!40211) b!76450))

(assert (= (and b!76450 res!40210) b!76444))

(assert (= (and b!76444 res!40215) b!76441))

(declare-fun m!76093 () Bool)

(assert (=> b!76444 m!76093))

(assert (=> b!76444 m!76093))

(assert (=> b!76444 m!75383))

(declare-fun m!76095 () Bool)

(assert (=> b!76444 m!76095))

(assert (=> b!76448 m!75383))

(assert (=> b!76448 m!75637))

(assert (=> b!76443 m!75383))

(declare-fun m!76097 () Bool)

(assert (=> b!76443 m!76097))

(assert (=> b!76443 m!75607))

(assert (=> b!76443 m!75607))

(assert (=> b!76443 m!75383))

(assert (=> b!76443 m!75609))

(declare-fun m!76099 () Bool)

(assert (=> bm!6911 m!76099))

(declare-fun m!76101 () Bool)

(assert (=> b!76438 m!76101))

(assert (=> bm!6909 m!75383))

(assert (=> bm!6909 m!75643))

(assert (=> b!76441 m!76093))

(assert (=> b!76441 m!75373))

(assert (=> b!76441 m!75373))

(declare-fun m!76103 () Bool)

(assert (=> b!76441 m!76103))

(declare-fun m!76105 () Bool)

(assert (=> b!76450 m!76105))

(declare-fun m!76107 () Bool)

(assert (=> d!18167 m!76107))

(assert (=> d!18167 m!75383))

(assert (=> d!18167 m!75643))

(declare-fun m!76109 () Bool)

(assert (=> d!18167 m!76109))

(declare-fun m!76111 () Bool)

(assert (=> d!18167 m!76111))

(assert (=> d!18167 m!76107))

(declare-fun m!76113 () Bool)

(assert (=> d!18167 m!76113))

(assert (=> d!18167 m!75405))

(assert (=> d!18167 m!75383))

(declare-fun m!76115 () Bool)

(assert (=> d!18167 m!76115))

(assert (=> d!18167 m!75607))

(assert (=> d!18167 m!75383))

(assert (=> d!18167 m!75609))

(assert (=> d!18167 m!75383))

(declare-fun m!76117 () Bool)

(assert (=> d!18167 m!76117))

(assert (=> d!18167 m!75607))

(assert (=> d!18167 m!75383))

(declare-fun m!76119 () Bool)

(assert (=> d!18167 m!76119))

(declare-fun m!76121 () Bool)

(assert (=> d!18167 m!76121))

(declare-fun m!76123 () Bool)

(assert (=> d!18167 m!76123))

(declare-fun m!76125 () Bool)

(assert (=> d!18167 m!76125))

(assert (=> d!18167 m!75607))

(declare-fun m!76127 () Bool)

(assert (=> d!18167 m!76127))

(assert (=> d!18167 m!75383))

(declare-fun m!76129 () Bool)

(assert (=> d!18167 m!76129))

(assert (=> d!18167 m!76111))

(declare-fun m!76131 () Bool)

(assert (=> d!18167 m!76131))

(assert (=> d!18167 m!75383))

(declare-fun m!76133 () Bool)

(assert (=> d!18167 m!76133))

(declare-fun m!76135 () Bool)

(assert (=> d!18167 m!76135))

(assert (=> d!18167 m!75383))

(declare-fun m!76137 () Bool)

(assert (=> d!18167 m!76137))

(assert (=> d!18167 m!75567))

(declare-fun m!76139 () Bool)

(assert (=> d!18167 m!76139))

(declare-fun m!76141 () Bool)

(assert (=> d!18167 m!76141))

(declare-fun m!76143 () Bool)

(assert (=> d!18167 m!76143))

(assert (=> bm!6908 m!75383))

(assert (=> bm!6908 m!75595))

(declare-fun m!76145 () Bool)

(assert (=> b!76436 m!76145))

(assert (=> b!76446 m!75383))

(assert (=> b!76446 m!75589))

(declare-fun m!76147 () Bool)

(assert (=> b!76445 m!76147))

(assert (=> bm!6839 d!18167))

(declare-fun d!18169 () Bool)

(declare-fun res!40218 () Bool)

(declare-fun e!49909 () Bool)

(assert (=> d!18169 (=> res!40218 e!49909)))

(assert (=> d!18169 (= res!40218 (= (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(assert (=> d!18169 (= (arrayContainsKey!0 (_keys!3903 newMap!16) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b00000000000000000000000000000000) e!49909)))

(declare-fun b!76451 () Bool)

(declare-fun e!49910 () Bool)

(assert (=> b!76451 (= e!49909 e!49910)))

(declare-fun res!40219 () Bool)

(assert (=> b!76451 (=> (not res!40219) (not e!49910))))

(assert (=> b!76451 (= res!40219 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2099 (_keys!3903 newMap!16))))))

(declare-fun b!76452 () Bool)

(assert (=> b!76452 (= e!49910 (arrayContainsKey!0 (_keys!3903 newMap!16) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!18169 (not res!40218)) b!76451))

(assert (= (and b!76451 res!40219) b!76452))

(declare-fun m!76149 () Bool)

(assert (=> d!18169 m!76149))

(assert (=> b!76452 m!75383))

(declare-fun m!76151 () Bool)

(assert (=> b!76452 m!76151))

(assert (=> bm!6838 d!18169))

(declare-fun d!18171 () Bool)

(declare-fun e!49911 () Bool)

(assert (=> d!18171 e!49911))

(declare-fun res!40220 () Bool)

(assert (=> d!18171 (=> res!40220 e!49911)))

(declare-fun lt!34841 () Bool)

(assert (=> d!18171 (= res!40220 (not lt!34841))))

(declare-fun lt!34840 () Bool)

(assert (=> d!18171 (= lt!34841 lt!34840)))

(declare-fun lt!34839 () Unit!2179)

(declare-fun e!49912 () Unit!2179)

(assert (=> d!18171 (= lt!34839 e!49912)))

(declare-fun c!11674 () Bool)

(assert (=> d!18171 (= c!11674 lt!34840)))

(assert (=> d!18171 (= lt!34840 (containsKey!137 (toList!723 lt!34576) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18171 (= (contains!726 lt!34576 #b0000000000000000000000000000000000000000000000000000000000000000) lt!34841)))

(declare-fun b!76453 () Bool)

(declare-fun lt!34838 () Unit!2179)

(assert (=> b!76453 (= e!49912 lt!34838)))

(assert (=> b!76453 (= lt!34838 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 lt!34576) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76453 (isDefined!87 (getValueByKey!133 (toList!723 lt!34576) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76454 () Bool)

(declare-fun Unit!2204 () Unit!2179)

(assert (=> b!76454 (= e!49912 Unit!2204)))

(declare-fun b!76455 () Bool)

(assert (=> b!76455 (= e!49911 (isDefined!87 (getValueByKey!133 (toList!723 lt!34576) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18171 c!11674) b!76453))

(assert (= (and d!18171 (not c!11674)) b!76454))

(assert (= (and d!18171 (not res!40220)) b!76455))

(declare-fun m!76153 () Bool)

(assert (=> d!18171 m!76153))

(declare-fun m!76155 () Bool)

(assert (=> b!76453 m!76155))

(declare-fun m!76157 () Bool)

(assert (=> b!76453 m!76157))

(assert (=> b!76453 m!76157))

(declare-fun m!76159 () Bool)

(assert (=> b!76453 m!76159))

(assert (=> b!76455 m!76157))

(assert (=> b!76455 m!76157))

(assert (=> b!76455 m!76159))

(assert (=> bm!6879 d!18171))

(declare-fun b!76456 () Bool)

(declare-fun e!49917 () ListLongMap!1415)

(declare-fun call!6918 () ListLongMap!1415)

(assert (=> b!76456 (= e!49917 call!6918)))

(declare-fun lt!34847 () ListLongMap!1415)

(declare-fun b!76457 () Bool)

(declare-fun e!49914 () Bool)

(assert (=> b!76457 (= e!49914 (= (apply!77 lt!34847 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)) (get!1156 (select (arr!1859 (ite c!11567 (_values!2229 newMap!16) (array!3902 (store (arr!1859 (_values!2229 newMap!16)) (index!3098 lt!34514) (ValueCellFull!899 lt!34341)) (size!2100 (_values!2229 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!329 (defaultEntry!2246 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76457 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2100 (ite c!11567 (_values!2229 newMap!16) (array!3902 (store (arr!1859 (_values!2229 newMap!16)) (index!3098 lt!34514) (ValueCellFull!899 lt!34341)) (size!2100 (_values!2229 newMap!16)))))))))

(assert (=> b!76457 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))

(declare-fun b!76458 () Bool)

(declare-fun e!49925 () ListLongMap!1415)

(declare-fun call!6916 () ListLongMap!1415)

(assert (=> b!76458 (= e!49925 (+!97 call!6916 (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 newMap!16))))))

(declare-fun b!76459 () Bool)

(declare-fun e!49920 () Bool)

(assert (=> b!76459 (= e!49920 (validKeyInArray!0 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76460 () Bool)

(declare-fun e!49919 () Unit!2179)

(declare-fun lt!34863 () Unit!2179)

(assert (=> b!76460 (= e!49919 lt!34863)))

(declare-fun lt!34844 () ListLongMap!1415)

(assert (=> b!76460 (= lt!34844 (getCurrentListMapNoExtraKeys!61 (_keys!3903 newMap!16) (ite c!11567 (_values!2229 newMap!16) (array!3902 (store (arr!1859 (_values!2229 newMap!16)) (index!3098 lt!34514) (ValueCellFull!899 lt!34341)) (size!2100 (_values!2229 newMap!16)))) (mask!6228 newMap!16) (ite (and c!11567 c!11569) lt!34507 (extraKeys!2099 newMap!16)) (ite (and c!11567 c!11569) lt!34341 (zeroValue!2145 newMap!16)) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34861 () (_ BitVec 64))

(assert (=> b!76460 (= lt!34861 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34857 () (_ BitVec 64))

(assert (=> b!76460 (= lt!34857 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34848 () Unit!2179)

(assert (=> b!76460 (= lt!34848 (addStillContains!53 lt!34844 lt!34861 (ite (and c!11567 c!11569) lt!34341 (zeroValue!2145 newMap!16)) lt!34857))))

(assert (=> b!76460 (contains!726 (+!97 lt!34844 (tuple2!2139 lt!34861 (ite (and c!11567 c!11569) lt!34341 (zeroValue!2145 newMap!16)))) lt!34857)))

(declare-fun lt!34859 () Unit!2179)

(assert (=> b!76460 (= lt!34859 lt!34848)))

(declare-fun lt!34843 () ListLongMap!1415)

(assert (=> b!76460 (= lt!34843 (getCurrentListMapNoExtraKeys!61 (_keys!3903 newMap!16) (ite c!11567 (_values!2229 newMap!16) (array!3902 (store (arr!1859 (_values!2229 newMap!16)) (index!3098 lt!34514) (ValueCellFull!899 lt!34341)) (size!2100 (_values!2229 newMap!16)))) (mask!6228 newMap!16) (ite (and c!11567 c!11569) lt!34507 (extraKeys!2099 newMap!16)) (ite (and c!11567 c!11569) lt!34341 (zeroValue!2145 newMap!16)) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34845 () (_ BitVec 64))

(assert (=> b!76460 (= lt!34845 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34849 () (_ BitVec 64))

(assert (=> b!76460 (= lt!34849 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34862 () Unit!2179)

(assert (=> b!76460 (= lt!34862 (addApplyDifferent!53 lt!34843 lt!34845 (minValue!2145 newMap!16) lt!34849))))

(assert (=> b!76460 (= (apply!77 (+!97 lt!34843 (tuple2!2139 lt!34845 (minValue!2145 newMap!16))) lt!34849) (apply!77 lt!34843 lt!34849))))

(declare-fun lt!34842 () Unit!2179)

(assert (=> b!76460 (= lt!34842 lt!34862)))

(declare-fun lt!34851 () ListLongMap!1415)

(assert (=> b!76460 (= lt!34851 (getCurrentListMapNoExtraKeys!61 (_keys!3903 newMap!16) (ite c!11567 (_values!2229 newMap!16) (array!3902 (store (arr!1859 (_values!2229 newMap!16)) (index!3098 lt!34514) (ValueCellFull!899 lt!34341)) (size!2100 (_values!2229 newMap!16)))) (mask!6228 newMap!16) (ite (and c!11567 c!11569) lt!34507 (extraKeys!2099 newMap!16)) (ite (and c!11567 c!11569) lt!34341 (zeroValue!2145 newMap!16)) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34855 () (_ BitVec 64))

(assert (=> b!76460 (= lt!34855 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34860 () (_ BitVec 64))

(assert (=> b!76460 (= lt!34860 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34853 () Unit!2179)

(assert (=> b!76460 (= lt!34853 (addApplyDifferent!53 lt!34851 lt!34855 (ite (and c!11567 c!11569) lt!34341 (zeroValue!2145 newMap!16)) lt!34860))))

(assert (=> b!76460 (= (apply!77 (+!97 lt!34851 (tuple2!2139 lt!34855 (ite (and c!11567 c!11569) lt!34341 (zeroValue!2145 newMap!16)))) lt!34860) (apply!77 lt!34851 lt!34860))))

(declare-fun lt!34852 () Unit!2179)

(assert (=> b!76460 (= lt!34852 lt!34853)))

(declare-fun lt!34850 () ListLongMap!1415)

(assert (=> b!76460 (= lt!34850 (getCurrentListMapNoExtraKeys!61 (_keys!3903 newMap!16) (ite c!11567 (_values!2229 newMap!16) (array!3902 (store (arr!1859 (_values!2229 newMap!16)) (index!3098 lt!34514) (ValueCellFull!899 lt!34341)) (size!2100 (_values!2229 newMap!16)))) (mask!6228 newMap!16) (ite (and c!11567 c!11569) lt!34507 (extraKeys!2099 newMap!16)) (ite (and c!11567 c!11569) lt!34341 (zeroValue!2145 newMap!16)) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34856 () (_ BitVec 64))

(assert (=> b!76460 (= lt!34856 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34846 () (_ BitVec 64))

(assert (=> b!76460 (= lt!34846 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!76460 (= lt!34863 (addApplyDifferent!53 lt!34850 lt!34856 (minValue!2145 newMap!16) lt!34846))))

(assert (=> b!76460 (= (apply!77 (+!97 lt!34850 (tuple2!2139 lt!34856 (minValue!2145 newMap!16))) lt!34846) (apply!77 lt!34850 lt!34846))))

(declare-fun b!76461 () Bool)

(declare-fun e!49923 () ListLongMap!1415)

(declare-fun call!6919 () ListLongMap!1415)

(assert (=> b!76461 (= e!49923 call!6919)))

(declare-fun b!76462 () Bool)

(declare-fun Unit!2205 () Unit!2179)

(assert (=> b!76462 (= e!49919 Unit!2205)))

(declare-fun b!76463 () Bool)

(declare-fun e!49918 () Bool)

(assert (=> b!76463 (= e!49918 e!49914)))

(declare-fun res!40224 () Bool)

(assert (=> b!76463 (=> (not res!40224) (not e!49914))))

(assert (=> b!76463 (= res!40224 (contains!726 lt!34847 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!76463 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))

(declare-fun call!6920 () ListLongMap!1415)

(declare-fun bm!6913 () Bool)

(assert (=> bm!6913 (= call!6920 (getCurrentListMapNoExtraKeys!61 (_keys!3903 newMap!16) (ite c!11567 (_values!2229 newMap!16) (array!3902 (store (arr!1859 (_values!2229 newMap!16)) (index!3098 lt!34514) (ValueCellFull!899 lt!34341)) (size!2100 (_values!2229 newMap!16)))) (mask!6228 newMap!16) (ite (and c!11567 c!11569) lt!34507 (extraKeys!2099 newMap!16)) (ite (and c!11567 c!11569) lt!34341 (zeroValue!2145 newMap!16)) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun b!76464 () Bool)

(declare-fun e!49922 () Bool)

(assert (=> b!76464 (= e!49922 (validKeyInArray!0 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6914 () Bool)

(declare-fun call!6921 () Bool)

(assert (=> bm!6914 (= call!6921 (contains!726 lt!34847 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76465 () Bool)

(declare-fun e!49916 () Bool)

(declare-fun e!49921 () Bool)

(assert (=> b!76465 (= e!49916 e!49921)))

(declare-fun res!40222 () Bool)

(declare-fun call!6915 () Bool)

(assert (=> b!76465 (= res!40222 call!6915)))

(assert (=> b!76465 (=> (not res!40222) (not e!49921))))

(declare-fun b!76466 () Bool)

(declare-fun c!11676 () Bool)

(assert (=> b!76466 (= c!11676 (and (not (= (bvand (ite (and c!11567 c!11569) lt!34507 (extraKeys!2099 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!11567 c!11569) lt!34507 (extraKeys!2099 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!76466 (= e!49917 e!49923)))

(declare-fun b!76467 () Bool)

(declare-fun res!40228 () Bool)

(declare-fun e!49924 () Bool)

(assert (=> b!76467 (=> (not res!40228) (not e!49924))))

(assert (=> b!76467 (= res!40228 e!49916)))

(declare-fun c!11677 () Bool)

(assert (=> b!76467 (= c!11677 (not (= (bvand (ite (and c!11567 c!11569) lt!34507 (extraKeys!2099 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!76468 () Bool)

(assert (=> b!76468 (= e!49925 e!49917)))

(declare-fun c!11680 () Bool)

(assert (=> b!76468 (= c!11680 (and (not (= (bvand (ite (and c!11567 c!11569) lt!34507 (extraKeys!2099 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!11567 c!11569) lt!34507 (extraKeys!2099 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!76469 () Bool)

(declare-fun e!49913 () Bool)

(declare-fun e!49915 () Bool)

(assert (=> b!76469 (= e!49913 e!49915)))

(declare-fun res!40227 () Bool)

(assert (=> b!76469 (= res!40227 call!6921)))

(assert (=> b!76469 (=> (not res!40227) (not e!49915))))

(declare-fun b!76470 () Bool)

(assert (=> b!76470 (= e!49921 (= (apply!77 lt!34847 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!11567 c!11569) lt!34341 (zeroValue!2145 newMap!16))))))

(declare-fun b!76471 () Bool)

(assert (=> b!76471 (= e!49915 (= (apply!77 lt!34847 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2145 newMap!16)))))

(declare-fun b!76472 () Bool)

(assert (=> b!76472 (= e!49924 e!49913)))

(declare-fun c!11678 () Bool)

(assert (=> b!76472 (= c!11678 (not (= (bvand (ite (and c!11567 c!11569) lt!34507 (extraKeys!2099 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6912 () Bool)

(declare-fun call!6917 () ListLongMap!1415)

(assert (=> bm!6912 (= call!6917 call!6920)))

(declare-fun d!18173 () Bool)

(assert (=> d!18173 e!49924))

(declare-fun res!40225 () Bool)

(assert (=> d!18173 (=> (not res!40225) (not e!49924))))

(assert (=> d!18173 (= res!40225 (or (bvsge #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))))

(declare-fun lt!34854 () ListLongMap!1415)

(assert (=> d!18173 (= lt!34847 lt!34854)))

(declare-fun lt!34858 () Unit!2179)

(assert (=> d!18173 (= lt!34858 e!49919)))

(declare-fun c!11675 () Bool)

(assert (=> d!18173 (= c!11675 e!49922)))

(declare-fun res!40226 () Bool)

(assert (=> d!18173 (=> (not res!40226) (not e!49922))))

(assert (=> d!18173 (= res!40226 (bvslt #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))

(assert (=> d!18173 (= lt!34854 e!49925)))

(declare-fun c!11679 () Bool)

(assert (=> d!18173 (= c!11679 (and (not (= (bvand (ite (and c!11567 c!11569) lt!34507 (extraKeys!2099 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!11567 c!11569) lt!34507 (extraKeys!2099 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18173 (validMask!0 (mask!6228 newMap!16))))

(assert (=> d!18173 (= (getCurrentListMap!415 (_keys!3903 newMap!16) (ite c!11567 (_values!2229 newMap!16) (array!3902 (store (arr!1859 (_values!2229 newMap!16)) (index!3098 lt!34514) (ValueCellFull!899 lt!34341)) (size!2100 (_values!2229 newMap!16)))) (mask!6228 newMap!16) (ite (and c!11567 c!11569) lt!34507 (extraKeys!2099 newMap!16)) (ite (and c!11567 c!11569) lt!34341 (zeroValue!2145 newMap!16)) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) lt!34847)))

(declare-fun bm!6915 () Bool)

(assert (=> bm!6915 (= call!6918 call!6916)))

(declare-fun bm!6916 () Bool)

(assert (=> bm!6916 (= call!6915 (contains!726 lt!34847 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6917 () Bool)

(assert (=> bm!6917 (= call!6919 call!6917)))

(declare-fun b!76473 () Bool)

(assert (=> b!76473 (= e!49923 call!6918)))

(declare-fun b!76474 () Bool)

(assert (=> b!76474 (= e!49916 (not call!6915))))

(declare-fun b!76475 () Bool)

(declare-fun res!40223 () Bool)

(assert (=> b!76475 (=> (not res!40223) (not e!49924))))

(assert (=> b!76475 (= res!40223 e!49918)))

(declare-fun res!40229 () Bool)

(assert (=> b!76475 (=> res!40229 e!49918)))

(assert (=> b!76475 (= res!40229 (not e!49920))))

(declare-fun res!40221 () Bool)

(assert (=> b!76475 (=> (not res!40221) (not e!49920))))

(assert (=> b!76475 (= res!40221 (bvslt #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))

(declare-fun bm!6918 () Bool)

(assert (=> bm!6918 (= call!6916 (+!97 (ite c!11679 call!6920 (ite c!11680 call!6917 call!6919)) (ite (or c!11679 c!11680) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!11567 c!11569) lt!34341 (zeroValue!2145 newMap!16))) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 newMap!16)))))))

(declare-fun b!76476 () Bool)

(assert (=> b!76476 (= e!49913 (not call!6921))))

(assert (= (and d!18173 c!11679) b!76458))

(assert (= (and d!18173 (not c!11679)) b!76468))

(assert (= (and b!76468 c!11680) b!76456))

(assert (= (and b!76468 (not c!11680)) b!76466))

(assert (= (and b!76466 c!11676) b!76473))

(assert (= (and b!76466 (not c!11676)) b!76461))

(assert (= (or b!76473 b!76461) bm!6917))

(assert (= (or b!76456 bm!6917) bm!6912))

(assert (= (or b!76456 b!76473) bm!6915))

(assert (= (or b!76458 bm!6912) bm!6913))

(assert (= (or b!76458 bm!6915) bm!6918))

(assert (= (and d!18173 res!40226) b!76464))

(assert (= (and d!18173 c!11675) b!76460))

(assert (= (and d!18173 (not c!11675)) b!76462))

(assert (= (and d!18173 res!40225) b!76475))

(assert (= (and b!76475 res!40221) b!76459))

(assert (= (and b!76475 (not res!40229)) b!76463))

(assert (= (and b!76463 res!40224) b!76457))

(assert (= (and b!76475 res!40223) b!76467))

(assert (= (and b!76467 c!11677) b!76465))

(assert (= (and b!76467 (not c!11677)) b!76474))

(assert (= (and b!76465 res!40222) b!76470))

(assert (= (or b!76465 b!76474) bm!6916))

(assert (= (and b!76467 res!40228) b!76472))

(assert (= (and b!76472 c!11678) b!76469))

(assert (= (and b!76472 (not c!11678)) b!76476))

(assert (= (and b!76469 res!40227) b!76471))

(assert (= (or b!76469 b!76476) bm!6914))

(declare-fun b_lambda!3417 () Bool)

(assert (=> (not b_lambda!3417) (not b!76457)))

(declare-fun t!5093 () Bool)

(declare-fun tb!1569 () Bool)

(assert (=> (and b!75774 (= (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) (defaultEntry!2246 newMap!16)) t!5093) tb!1569))

(declare-fun result!2741 () Bool)

(assert (=> tb!1569 (= result!2741 tp_is_empty!2485)))

(assert (=> b!76457 t!5093))

(declare-fun b_and!4657 () Bool)

(assert (= b_and!4653 (and (=> t!5093 result!2741) b_and!4657)))

(declare-fun t!5095 () Bool)

(declare-fun tb!1571 () Bool)

(assert (=> (and b!75783 (= (defaultEntry!2246 newMap!16) (defaultEntry!2246 newMap!16)) t!5095) tb!1571))

(declare-fun result!2743 () Bool)

(assert (= result!2743 result!2741))

(assert (=> b!76457 t!5095))

(declare-fun b_and!4659 () Bool)

(assert (= b_and!4655 (and (=> t!5095 result!2743) b_and!4659)))

(declare-fun m!76161 () Bool)

(assert (=> bm!6913 m!76161))

(assert (=> b!76464 m!76149))

(assert (=> b!76464 m!76149))

(declare-fun m!76163 () Bool)

(assert (=> b!76464 m!76163))

(assert (=> b!76459 m!76149))

(assert (=> b!76459 m!76149))

(assert (=> b!76459 m!76163))

(assert (=> d!18173 m!75799))

(declare-fun m!76165 () Bool)

(assert (=> b!76470 m!76165))

(declare-fun m!76167 () Bool)

(assert (=> b!76458 m!76167))

(declare-fun m!76169 () Bool)

(assert (=> bm!6918 m!76169))

(declare-fun m!76171 () Bool)

(assert (=> b!76457 m!76171))

(declare-fun m!76173 () Bool)

(assert (=> b!76457 m!76173))

(declare-fun m!76175 () Bool)

(assert (=> b!76457 m!76175))

(assert (=> b!76457 m!76173))

(assert (=> b!76457 m!76149))

(declare-fun m!76177 () Bool)

(assert (=> b!76457 m!76177))

(assert (=> b!76457 m!76149))

(assert (=> b!76457 m!76171))

(declare-fun m!76179 () Bool)

(assert (=> bm!6916 m!76179))

(declare-fun m!76181 () Bool)

(assert (=> b!76471 m!76181))

(declare-fun m!76183 () Bool)

(assert (=> b!76460 m!76183))

(declare-fun m!76185 () Bool)

(assert (=> b!76460 m!76185))

(declare-fun m!76187 () Bool)

(assert (=> b!76460 m!76187))

(assert (=> b!76460 m!76183))

(declare-fun m!76189 () Bool)

(assert (=> b!76460 m!76189))

(declare-fun m!76191 () Bool)

(assert (=> b!76460 m!76191))

(declare-fun m!76193 () Bool)

(assert (=> b!76460 m!76193))

(declare-fun m!76195 () Bool)

(assert (=> b!76460 m!76195))

(assert (=> b!76460 m!76185))

(declare-fun m!76197 () Bool)

(assert (=> b!76460 m!76197))

(declare-fun m!76199 () Bool)

(assert (=> b!76460 m!76199))

(declare-fun m!76201 () Bool)

(assert (=> b!76460 m!76201))

(declare-fun m!76203 () Bool)

(assert (=> b!76460 m!76203))

(declare-fun m!76205 () Bool)

(assert (=> b!76460 m!76205))

(assert (=> b!76460 m!76161))

(declare-fun m!76207 () Bool)

(assert (=> b!76460 m!76207))

(assert (=> b!76460 m!76199))

(declare-fun m!76209 () Bool)

(assert (=> b!76460 m!76209))

(assert (=> b!76460 m!76191))

(assert (=> b!76460 m!76149))

(declare-fun m!76211 () Bool)

(assert (=> b!76460 m!76211))

(assert (=> b!76463 m!76149))

(assert (=> b!76463 m!76149))

(declare-fun m!76213 () Bool)

(assert (=> b!76463 m!76213))

(declare-fun m!76215 () Bool)

(assert (=> bm!6914 m!76215))

(assert (=> bm!6837 d!18173))

(declare-fun b!76479 () Bool)

(declare-fun e!49927 () Option!139)

(assert (=> b!76479 (= e!49927 (getValueByKey!133 (t!5079 (toList!723 lt!34632)) (_1!1080 lt!34352)))))

(declare-fun b!76480 () Bool)

(assert (=> b!76480 (= e!49927 None!137)))

(declare-fun b!76478 () Bool)

(declare-fun e!49926 () Option!139)

(assert (=> b!76478 (= e!49926 e!49927)))

(declare-fun c!11682 () Bool)

(assert (=> b!76478 (= c!11682 (and ((_ is Cons!1490) (toList!723 lt!34632)) (not (= (_1!1080 (h!2078 (toList!723 lt!34632))) (_1!1080 lt!34352)))))))

(declare-fun b!76477 () Bool)

(assert (=> b!76477 (= e!49926 (Some!138 (_2!1080 (h!2078 (toList!723 lt!34632)))))))

(declare-fun d!18175 () Bool)

(declare-fun c!11681 () Bool)

(assert (=> d!18175 (= c!11681 (and ((_ is Cons!1490) (toList!723 lt!34632)) (= (_1!1080 (h!2078 (toList!723 lt!34632))) (_1!1080 lt!34352))))))

(assert (=> d!18175 (= (getValueByKey!133 (toList!723 lt!34632) (_1!1080 lt!34352)) e!49926)))

(assert (= (and d!18175 c!11681) b!76477))

(assert (= (and d!18175 (not c!11681)) b!76478))

(assert (= (and b!76478 c!11682) b!76479))

(assert (= (and b!76478 (not c!11682)) b!76480))

(declare-fun m!76217 () Bool)

(assert (=> b!76479 m!76217))

(assert (=> b!76209 d!18175))

(declare-fun call!6926 () Bool)

(declare-fun lt!34869 () SeekEntryResult!241)

(declare-fun c!11688 () Bool)

(declare-fun bm!6923 () Bool)

(assert (=> bm!6923 (= call!6926 (inRange!0 (ite c!11688 (index!3097 lt!34869) (index!3100 lt!34869)) (mask!6228 newMap!16)))))

(declare-fun b!76497 () Bool)

(declare-fun e!49939 () Bool)

(declare-fun call!6927 () Bool)

(assert (=> b!76497 (= e!49939 (not call!6927))))

(declare-fun b!76498 () Bool)

(declare-fun res!40241 () Bool)

(assert (=> b!76498 (=> (not res!40241) (not e!49939))))

(assert (=> b!76498 (= res!40241 call!6926)))

(declare-fun e!49937 () Bool)

(assert (=> b!76498 (= e!49937 e!49939)))

(declare-fun d!18177 () Bool)

(declare-fun e!49936 () Bool)

(assert (=> d!18177 e!49936))

(assert (=> d!18177 (= c!11688 ((_ is MissingZero!241) lt!34869))))

(assert (=> d!18177 (= lt!34869 (seekEntryOrOpen!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (_keys!3903 newMap!16) (mask!6228 newMap!16)))))

(declare-fun lt!34868 () Unit!2179)

(declare-fun choose!451 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 64) Int) Unit!2179)

(assert (=> d!18177 (= lt!34868 (choose!451 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (defaultEntry!2246 newMap!16)))))

(assert (=> d!18177 (validMask!0 (mask!6228 newMap!16))))

(assert (=> d!18177 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!26 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (defaultEntry!2246 newMap!16)) lt!34868)))

(declare-fun b!76499 () Bool)

(assert (=> b!76499 (and (bvsge (index!3097 lt!34869) #b00000000000000000000000000000000) (bvslt (index!3097 lt!34869) (size!2099 (_keys!3903 newMap!16))))))

(declare-fun res!40240 () Bool)

(assert (=> b!76499 (= res!40240 (= (select (arr!1858 (_keys!3903 newMap!16)) (index!3097 lt!34869)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49938 () Bool)

(assert (=> b!76499 (=> (not res!40240) (not e!49938))))

(declare-fun b!76500 () Bool)

(assert (=> b!76500 (= e!49937 ((_ is Undefined!241) lt!34869))))

(declare-fun bm!6924 () Bool)

(assert (=> bm!6924 (= call!6927 (arrayContainsKey!0 (_keys!3903 newMap!16) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!76501 () Bool)

(assert (=> b!76501 (= e!49936 e!49937)))

(declare-fun c!11687 () Bool)

(assert (=> b!76501 (= c!11687 ((_ is MissingVacant!241) lt!34869))))

(declare-fun b!76502 () Bool)

(declare-fun res!40238 () Bool)

(assert (=> b!76502 (=> (not res!40238) (not e!49939))))

(assert (=> b!76502 (= res!40238 (= (select (arr!1858 (_keys!3903 newMap!16)) (index!3100 lt!34869)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76502 (and (bvsge (index!3100 lt!34869) #b00000000000000000000000000000000) (bvslt (index!3100 lt!34869) (size!2099 (_keys!3903 newMap!16))))))

(declare-fun b!76503 () Bool)

(assert (=> b!76503 (= e!49936 e!49938)))

(declare-fun res!40239 () Bool)

(assert (=> b!76503 (= res!40239 call!6926)))

(assert (=> b!76503 (=> (not res!40239) (not e!49938))))

(declare-fun b!76504 () Bool)

(assert (=> b!76504 (= e!49938 (not call!6927))))

(assert (= (and d!18177 c!11688) b!76503))

(assert (= (and d!18177 (not c!11688)) b!76501))

(assert (= (and b!76503 res!40239) b!76499))

(assert (= (and b!76499 res!40240) b!76504))

(assert (= (and b!76501 c!11687) b!76498))

(assert (= (and b!76501 (not c!11687)) b!76500))

(assert (= (and b!76498 res!40241) b!76502))

(assert (= (and b!76502 res!40238) b!76497))

(assert (= (or b!76503 b!76498) bm!6923))

(assert (= (or b!76504 b!76497) bm!6924))

(declare-fun m!76219 () Bool)

(assert (=> b!76502 m!76219))

(declare-fun m!76221 () Bool)

(assert (=> b!76499 m!76221))

(declare-fun m!76223 () Bool)

(assert (=> bm!6923 m!76223))

(assert (=> bm!6924 m!75383))

(assert (=> bm!6924 m!75643))

(assert (=> d!18177 m!75383))

(assert (=> d!18177 m!75595))

(assert (=> d!18177 m!75383))

(declare-fun m!76225 () Bool)

(assert (=> d!18177 m!76225))

(assert (=> d!18177 m!75799))

(assert (=> bm!6860 d!18177))

(declare-fun d!18179 () Bool)

(declare-fun e!49940 () Bool)

(assert (=> d!18179 e!49940))

(declare-fun res!40242 () Bool)

(assert (=> d!18179 (=> res!40242 e!49940)))

(declare-fun lt!34873 () Bool)

(assert (=> d!18179 (= res!40242 (not lt!34873))))

(declare-fun lt!34872 () Bool)

(assert (=> d!18179 (= lt!34873 lt!34872)))

(declare-fun lt!34871 () Unit!2179)

(declare-fun e!49941 () Unit!2179)

(assert (=> d!18179 (= lt!34871 e!49941)))

(declare-fun c!11689 () Bool)

(assert (=> d!18179 (= c!11689 lt!34872)))

(assert (=> d!18179 (= lt!34872 (containsKey!137 (toList!723 call!6853) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(assert (=> d!18179 (= (contains!726 call!6853 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) lt!34873)))

(declare-fun b!76505 () Bool)

(declare-fun lt!34870 () Unit!2179)

(assert (=> b!76505 (= e!49941 lt!34870)))

(assert (=> b!76505 (= lt!34870 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 call!6853) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(assert (=> b!76505 (isDefined!87 (getValueByKey!133 (toList!723 call!6853) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun b!76506 () Bool)

(declare-fun Unit!2206 () Unit!2179)

(assert (=> b!76506 (= e!49941 Unit!2206)))

(declare-fun b!76507 () Bool)

(assert (=> b!76507 (= e!49940 (isDefined!87 (getValueByKey!133 (toList!723 call!6853) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355))))))

(assert (= (and d!18179 c!11689) b!76505))

(assert (= (and d!18179 (not c!11689)) b!76506))

(assert (= (and d!18179 (not res!40242)) b!76507))

(assert (=> d!18179 m!75383))

(declare-fun m!76227 () Bool)

(assert (=> d!18179 m!76227))

(assert (=> b!76505 m!75383))

(declare-fun m!76229 () Bool)

(assert (=> b!76505 m!76229))

(assert (=> b!76505 m!75383))

(declare-fun m!76231 () Bool)

(assert (=> b!76505 m!76231))

(assert (=> b!76505 m!76231))

(declare-fun m!76233 () Bool)

(assert (=> b!76505 m!76233))

(assert (=> b!76507 m!75383))

(assert (=> b!76507 m!76231))

(assert (=> b!76507 m!76231))

(assert (=> b!76507 m!76233))

(assert (=> b!76056 d!18179))

(declare-fun b!76508 () Bool)

(declare-fun e!49943 () Bool)

(declare-fun e!49942 () Bool)

(assert (=> b!76508 (= e!49943 e!49942)))

(declare-fun c!11690 () Bool)

(assert (=> b!76508 (= c!11690 (validKeyInArray!0 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76509 () Bool)

(declare-fun call!6928 () Bool)

(assert (=> b!76509 (= e!49942 call!6928)))

(declare-fun b!76510 () Bool)

(declare-fun e!49944 () Bool)

(assert (=> b!76510 (= e!49942 e!49944)))

(declare-fun lt!34876 () (_ BitVec 64))

(assert (=> b!76510 (= lt!34876 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34874 () Unit!2179)

(assert (=> b!76510 (= lt!34874 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3903 newMap!16) lt!34876 #b00000000000000000000000000000000))))

(assert (=> b!76510 (arrayContainsKey!0 (_keys!3903 newMap!16) lt!34876 #b00000000000000000000000000000000)))

(declare-fun lt!34875 () Unit!2179)

(assert (=> b!76510 (= lt!34875 lt!34874)))

(declare-fun res!40244 () Bool)

(assert (=> b!76510 (= res!40244 (= (seekEntryOrOpen!0 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000) (_keys!3903 newMap!16) (mask!6228 newMap!16)) (Found!241 #b00000000000000000000000000000000)))))

(assert (=> b!76510 (=> (not res!40244) (not e!49944))))

(declare-fun bm!6925 () Bool)

(assert (=> bm!6925 (= call!6928 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3903 newMap!16) (mask!6228 newMap!16)))))

(declare-fun d!18181 () Bool)

(declare-fun res!40243 () Bool)

(assert (=> d!18181 (=> res!40243 e!49943)))

(assert (=> d!18181 (= res!40243 (bvsge #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))

(assert (=> d!18181 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3903 newMap!16) (mask!6228 newMap!16)) e!49943)))

(declare-fun b!76511 () Bool)

(assert (=> b!76511 (= e!49944 call!6928)))

(assert (= (and d!18181 (not res!40243)) b!76508))

(assert (= (and b!76508 c!11690) b!76510))

(assert (= (and b!76508 (not c!11690)) b!76509))

(assert (= (and b!76510 res!40244) b!76511))

(assert (= (or b!76511 b!76509) bm!6925))

(assert (=> b!76508 m!76149))

(assert (=> b!76508 m!76149))

(assert (=> b!76508 m!76163))

(assert (=> b!76510 m!76149))

(declare-fun m!76235 () Bool)

(assert (=> b!76510 m!76235))

(declare-fun m!76237 () Bool)

(assert (=> b!76510 m!76237))

(assert (=> b!76510 m!76149))

(declare-fun m!76239 () Bool)

(assert (=> b!76510 m!76239))

(declare-fun m!76241 () Bool)

(assert (=> bm!6925 m!76241))

(assert (=> b!75960 d!18181))

(declare-fun d!18183 () Bool)

(declare-fun lt!34879 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!81 (List!1493) (InoxSet (_ BitVec 64)))

(assert (=> d!18183 (= lt!34879 (select (content!81 Nil!1490) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!49950 () Bool)

(assert (=> d!18183 (= lt!34879 e!49950)))

(declare-fun res!40250 () Bool)

(assert (=> d!18183 (=> (not res!40250) (not e!49950))))

(assert (=> d!18183 (= res!40250 ((_ is Cons!1489) Nil!1490))))

(assert (=> d!18183 (= (contains!729 Nil!1490 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000)) lt!34879)))

(declare-fun b!76516 () Bool)

(declare-fun e!49949 () Bool)

(assert (=> b!76516 (= e!49950 e!49949)))

(declare-fun res!40249 () Bool)

(assert (=> b!76516 (=> res!40249 e!49949)))

(assert (=> b!76516 (= res!40249 (= (h!2077 Nil!1490) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!76517 () Bool)

(assert (=> b!76517 (= e!49949 (contains!729 (t!5078 Nil!1490) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!18183 res!40250) b!76516))

(assert (= (and b!76516 (not res!40249)) b!76517))

(declare-fun m!76243 () Bool)

(assert (=> d!18183 m!76243))

(assert (=> d!18183 m!75573))

(declare-fun m!76245 () Bool)

(assert (=> d!18183 m!76245))

(assert (=> b!76517 m!75573))

(declare-fun m!76247 () Bool)

(assert (=> b!76517 m!76247))

(assert (=> b!75962 d!18183))

(declare-fun d!18185 () Bool)

(assert (=> d!18185 (= (apply!77 lt!34576 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1160 (getValueByKey!133 (toList!723 lt!34576) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3265 () Bool)

(assert (= bs!3265 d!18185))

(assert (=> bs!3265 m!76157))

(assert (=> bs!3265 m!76157))

(declare-fun m!76249 () Bool)

(assert (=> bs!3265 m!76249))

(assert (=> b!76152 d!18185))

(declare-fun d!18187 () Bool)

(assert (=> d!18187 (= (get!1159 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) from!355) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76164 d!18187))

(declare-fun d!18189 () Bool)

(declare-fun lt!34880 () Bool)

(assert (=> d!18189 (= lt!34880 (select (content!81 Nil!1490) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun e!49952 () Bool)

(assert (=> d!18189 (= lt!34880 e!49952)))

(declare-fun res!40252 () Bool)

(assert (=> d!18189 (=> (not res!40252) (not e!49952))))

(assert (=> d!18189 (= res!40252 ((_ is Cons!1489) Nil!1490))))

(assert (=> d!18189 (= (contains!729 Nil!1490 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) lt!34880)))

(declare-fun b!76518 () Bool)

(declare-fun e!49951 () Bool)

(assert (=> b!76518 (= e!49952 e!49951)))

(declare-fun res!40251 () Bool)

(assert (=> b!76518 (=> res!40251 e!49951)))

(assert (=> b!76518 (= res!40251 (= (h!2077 Nil!1490) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun b!76519 () Bool)

(assert (=> b!76519 (= e!49951 (contains!729 (t!5078 Nil!1490) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(assert (= (and d!18189 res!40252) b!76518))

(assert (= (and b!76518 (not res!40251)) b!76519))

(assert (=> d!18189 m!76243))

(assert (=> d!18189 m!75383))

(declare-fun m!76251 () Bool)

(assert (=> d!18189 m!76251))

(assert (=> b!76519 m!75383))

(declare-fun m!76253 () Bool)

(assert (=> b!76519 m!76253))

(assert (=> b!75948 d!18189))

(declare-fun b!76528 () Bool)

(declare-fun res!40264 () Bool)

(declare-fun e!49955 () Bool)

(assert (=> b!76528 (=> (not res!40264) (not e!49955))))

(assert (=> b!76528 (= res!40264 (and (= (size!2100 (_values!2229 newMap!16)) (bvadd (mask!6228 newMap!16) #b00000000000000000000000000000001)) (= (size!2099 (_keys!3903 newMap!16)) (size!2100 (_values!2229 newMap!16))) (bvsge (_size!402 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!402 newMap!16) (bvadd (mask!6228 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!76529 () Bool)

(declare-fun res!40262 () Bool)

(assert (=> b!76529 (=> (not res!40262) (not e!49955))))

(declare-fun size!2105 (LongMapFixedSize!706) (_ BitVec 32))

(assert (=> b!76529 (= res!40262 (bvsge (size!2105 newMap!16) (_size!402 newMap!16)))))

(declare-fun b!76531 () Bool)

(assert (=> b!76531 (= e!49955 (and (bvsge (extraKeys!2099 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2099 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!402 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!76530 () Bool)

(declare-fun res!40263 () Bool)

(assert (=> b!76530 (=> (not res!40263) (not e!49955))))

(assert (=> b!76530 (= res!40263 (= (size!2105 newMap!16) (bvadd (_size!402 newMap!16) (bvsdiv (bvadd (extraKeys!2099 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!18191 () Bool)

(declare-fun res!40261 () Bool)

(assert (=> d!18191 (=> (not res!40261) (not e!49955))))

(assert (=> d!18191 (= res!40261 (validMask!0 (mask!6228 newMap!16)))))

(assert (=> d!18191 (= (simpleValid!53 newMap!16) e!49955)))

(assert (= (and d!18191 res!40261) b!76528))

(assert (= (and b!76528 res!40264) b!76529))

(assert (= (and b!76529 res!40262) b!76530))

(assert (= (and b!76530 res!40263) b!76531))

(declare-fun m!76255 () Bool)

(assert (=> b!76529 m!76255))

(assert (=> b!76530 m!76255))

(assert (=> d!18191 m!75799))

(assert (=> d!18039 d!18191))

(declare-fun b!76534 () Bool)

(declare-fun e!49957 () Option!139)

(assert (=> b!76534 (= e!49957 (getValueByKey!133 (t!5079 (toList!723 lt!34628)) (_1!1080 lt!34342)))))

(declare-fun b!76535 () Bool)

(assert (=> b!76535 (= e!49957 None!137)))

(declare-fun b!76533 () Bool)

(declare-fun e!49956 () Option!139)

(assert (=> b!76533 (= e!49956 e!49957)))

(declare-fun c!11692 () Bool)

(assert (=> b!76533 (= c!11692 (and ((_ is Cons!1490) (toList!723 lt!34628)) (not (= (_1!1080 (h!2078 (toList!723 lt!34628))) (_1!1080 lt!34342)))))))

(declare-fun b!76532 () Bool)

(assert (=> b!76532 (= e!49956 (Some!138 (_2!1080 (h!2078 (toList!723 lt!34628)))))))

(declare-fun d!18193 () Bool)

(declare-fun c!11691 () Bool)

(assert (=> d!18193 (= c!11691 (and ((_ is Cons!1490) (toList!723 lt!34628)) (= (_1!1080 (h!2078 (toList!723 lt!34628))) (_1!1080 lt!34342))))))

(assert (=> d!18193 (= (getValueByKey!133 (toList!723 lt!34628) (_1!1080 lt!34342)) e!49956)))

(assert (= (and d!18193 c!11691) b!76532))

(assert (= (and d!18193 (not c!11691)) b!76533))

(assert (= (and b!76533 c!11692) b!76534))

(assert (= (and b!76533 (not c!11692)) b!76535))

(declare-fun m!76257 () Bool)

(assert (=> b!76534 m!76257))

(assert (=> b!76207 d!18193))

(declare-fun b!76536 () Bool)

(declare-fun res!40265 () Bool)

(declare-fun e!49958 () Bool)

(assert (=> b!76536 (=> (not res!40265) (not e!49958))))

(declare-fun lt!34882 () ListLongMap!1415)

(assert (=> b!76536 (= res!40265 (not (contains!726 lt!34882 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!6926 () Bool)

(declare-fun call!6929 () ListLongMap!1415)

(assert (=> bm!6926 (= call!6929 (getCurrentListMapNoExtraKeys!61 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun b!76537 () Bool)

(declare-fun lt!34883 () Unit!2179)

(declare-fun lt!34887 () Unit!2179)

(assert (=> b!76537 (= lt!34883 lt!34887)))

(declare-fun lt!34886 () (_ BitVec 64))

(declare-fun lt!34881 () V!2961)

(declare-fun lt!34885 () (_ BitVec 64))

(declare-fun lt!34884 () ListLongMap!1415)

(assert (=> b!76537 (not (contains!726 (+!97 lt!34884 (tuple2!2139 lt!34885 lt!34881)) lt!34886))))

(assert (=> b!76537 (= lt!34887 (addStillNotContains!27 lt!34884 lt!34885 lt!34881 lt!34886))))

(assert (=> b!76537 (= lt!34886 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!76537 (= lt!34881 (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76537 (= lt!34885 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!76537 (= lt!34884 call!6929)))

(declare-fun e!49962 () ListLongMap!1415)

(assert (=> b!76537 (= e!49962 (+!97 call!6929 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!76538 () Bool)

(declare-fun e!49963 () Bool)

(assert (=> b!76538 (= e!49963 (isEmpty!326 lt!34882))))

(declare-fun b!76539 () Bool)

(assert (=> b!76539 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(assert (=> b!76539 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2100 (_values!2229 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun e!49961 () Bool)

(assert (=> b!76539 (= e!49961 (= (apply!77 lt!34882 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1156 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!76540 () Bool)

(declare-fun e!49964 () ListLongMap!1415)

(assert (=> b!76540 (= e!49964 (ListLongMap!1416 Nil!1491))))

(declare-fun b!76541 () Bool)

(assert (=> b!76541 (= e!49964 e!49962)))

(declare-fun c!11696 () Bool)

(assert (=> b!76541 (= c!11696 (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!76542 () Bool)

(assert (=> b!76542 (= e!49963 (= lt!34882 (getCurrentListMapNoExtraKeys!61 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun b!76543 () Bool)

(declare-fun e!49960 () Bool)

(assert (=> b!76543 (= e!49958 e!49960)))

(declare-fun c!11695 () Bool)

(declare-fun e!49959 () Bool)

(assert (=> b!76543 (= c!11695 e!49959)))

(declare-fun res!40267 () Bool)

(assert (=> b!76543 (=> (not res!40267) (not e!49959))))

(assert (=> b!76543 (= res!40267 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun d!18195 () Bool)

(assert (=> d!18195 e!49958))

(declare-fun res!40268 () Bool)

(assert (=> d!18195 (=> (not res!40268) (not e!49958))))

(assert (=> d!18195 (= res!40268 (not (contains!726 lt!34882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18195 (= lt!34882 e!49964)))

(declare-fun c!11693 () Bool)

(assert (=> d!18195 (= c!11693 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(assert (=> d!18195 (validMask!0 (mask!6228 (v!2552 (underlying!262 thiss!992))))))

(assert (=> d!18195 (= (getCurrentListMapNoExtraKeys!61 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (_values!2229 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992))) (extraKeys!2099 (v!2552 (underlying!262 thiss!992))) (zeroValue!2145 (v!2552 (underlying!262 thiss!992))) (minValue!2145 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992)))) lt!34882)))

(declare-fun b!76544 () Bool)

(assert (=> b!76544 (= e!49959 (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!76544 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!76545 () Bool)

(assert (=> b!76545 (= e!49962 call!6929)))

(declare-fun b!76546 () Bool)

(assert (=> b!76546 (= e!49960 e!49961)))

(assert (=> b!76546 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun res!40266 () Bool)

(assert (=> b!76546 (= res!40266 (contains!726 lt!34882 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!76546 (=> (not res!40266) (not e!49961))))

(declare-fun b!76547 () Bool)

(assert (=> b!76547 (= e!49960 e!49963)))

(declare-fun c!11694 () Bool)

(assert (=> b!76547 (= c!11694 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(assert (= (and d!18195 c!11693) b!76540))

(assert (= (and d!18195 (not c!11693)) b!76541))

(assert (= (and b!76541 c!11696) b!76537))

(assert (= (and b!76541 (not c!11696)) b!76545))

(assert (= (or b!76537 b!76545) bm!6926))

(assert (= (and d!18195 res!40268) b!76536))

(assert (= (and b!76536 res!40265) b!76543))

(assert (= (and b!76543 res!40267) b!76544))

(assert (= (and b!76543 c!11695) b!76546))

(assert (= (and b!76543 (not c!11695)) b!76547))

(assert (= (and b!76546 res!40266) b!76539))

(assert (= (and b!76547 c!11694) b!76542))

(assert (= (and b!76547 (not c!11694)) b!76538))

(declare-fun b_lambda!3419 () Bool)

(assert (=> (not b_lambda!3419) (not b!76537)))

(assert (=> b!76537 t!5075))

(declare-fun b_and!4661 () Bool)

(assert (= b_and!4657 (and (=> t!5075 result!2721) b_and!4661)))

(assert (=> b!76537 t!5077))

(declare-fun b_and!4663 () Bool)

(assert (= b_and!4659 (and (=> t!5077 result!2725) b_and!4663)))

(declare-fun b_lambda!3421 () Bool)

(assert (=> (not b_lambda!3421) (not b!76539)))

(assert (=> b!76539 t!5075))

(declare-fun b_and!4665 () Bool)

(assert (= b_and!4661 (and (=> t!5075 result!2721) b_and!4665)))

(assert (=> b!76539 t!5077))

(declare-fun b_and!4667 () Bool)

(assert (= b_and!4663 (and (=> t!5077 result!2725) b_and!4667)))

(declare-fun m!76259 () Bool)

(assert (=> b!76536 m!76259))

(declare-fun m!76261 () Bool)

(assert (=> b!76546 m!76261))

(assert (=> b!76546 m!76261))

(declare-fun m!76263 () Bool)

(assert (=> b!76546 m!76263))

(assert (=> b!76544 m!76261))

(assert (=> b!76544 m!76261))

(declare-fun m!76265 () Bool)

(assert (=> b!76544 m!76265))

(declare-fun m!76267 () Bool)

(assert (=> b!76542 m!76267))

(assert (=> b!76537 m!76261))

(declare-fun m!76269 () Bool)

(assert (=> b!76537 m!76269))

(declare-fun m!76271 () Bool)

(assert (=> b!76537 m!76271))

(assert (=> b!76537 m!75423))

(declare-fun m!76273 () Bool)

(assert (=> b!76537 m!76273))

(assert (=> b!76537 m!76269))

(declare-fun m!76275 () Bool)

(assert (=> b!76537 m!76275))

(declare-fun m!76277 () Bool)

(assert (=> b!76537 m!76277))

(assert (=> b!76537 m!76277))

(assert (=> b!76537 m!75423))

(declare-fun m!76279 () Bool)

(assert (=> b!76537 m!76279))

(declare-fun m!76281 () Bool)

(assert (=> b!76538 m!76281))

(assert (=> b!76539 m!76261))

(assert (=> b!76539 m!75423))

(assert (=> b!76539 m!76261))

(declare-fun m!76283 () Bool)

(assert (=> b!76539 m!76283))

(assert (=> b!76539 m!76277))

(assert (=> b!76539 m!76277))

(assert (=> b!76539 m!75423))

(assert (=> b!76539 m!76279))

(assert (=> b!76541 m!76261))

(assert (=> b!76541 m!76261))

(assert (=> b!76541 m!76265))

(assert (=> bm!6926 m!76267))

(declare-fun m!76285 () Bool)

(assert (=> d!18195 m!76285))

(assert (=> d!18195 m!75381))

(assert (=> b!76201 d!18195))

(declare-fun d!18197 () Bool)

(declare-fun lt!34890 () Bool)

(declare-fun content!82 (List!1494) (InoxSet tuple2!2138))

(assert (=> d!18197 (= lt!34890 (select (content!82 (toList!723 lt!34603)) lt!34352))))

(declare-fun e!49969 () Bool)

(assert (=> d!18197 (= lt!34890 e!49969)))

(declare-fun res!40273 () Bool)

(assert (=> d!18197 (=> (not res!40273) (not e!49969))))

(assert (=> d!18197 (= res!40273 ((_ is Cons!1490) (toList!723 lt!34603)))))

(assert (=> d!18197 (= (contains!730 (toList!723 lt!34603) lt!34352) lt!34890)))

(declare-fun b!76552 () Bool)

(declare-fun e!49970 () Bool)

(assert (=> b!76552 (= e!49969 e!49970)))

(declare-fun res!40274 () Bool)

(assert (=> b!76552 (=> res!40274 e!49970)))

(assert (=> b!76552 (= res!40274 (= (h!2078 (toList!723 lt!34603)) lt!34352))))

(declare-fun b!76553 () Bool)

(assert (=> b!76553 (= e!49970 (contains!730 (t!5079 (toList!723 lt!34603)) lt!34352))))

(assert (= (and d!18197 res!40273) b!76552))

(assert (= (and b!76552 (not res!40274)) b!76553))

(declare-fun m!76287 () Bool)

(assert (=> d!18197 m!76287))

(declare-fun m!76289 () Bool)

(assert (=> d!18197 m!76289))

(declare-fun m!76291 () Bool)

(assert (=> b!76553 m!76291))

(assert (=> b!76170 d!18197))

(declare-fun b!76554 () Bool)

(declare-fun e!49975 () ListLongMap!1415)

(declare-fun call!6933 () ListLongMap!1415)

(assert (=> b!76554 (= e!49975 call!6933)))

(declare-fun b!76555 () Bool)

(declare-fun e!49972 () Bool)

(declare-fun lt!34896 () ListLongMap!1415)

(assert (=> b!76555 (= e!49972 (= (apply!77 lt!34896 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)) (get!1156 (select (arr!1859 (_values!2229 newMap!16)) #b00000000000000000000000000000000) (dynLambda!329 (defaultEntry!2246 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76555 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2100 (_values!2229 newMap!16))))))

(assert (=> b!76555 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))

(declare-fun b!76556 () Bool)

(declare-fun e!49983 () ListLongMap!1415)

(declare-fun call!6931 () ListLongMap!1415)

(assert (=> b!76556 (= e!49983 (+!97 call!6931 (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 newMap!16))))))

(declare-fun b!76557 () Bool)

(declare-fun e!49978 () Bool)

(assert (=> b!76557 (= e!49978 (validKeyInArray!0 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76558 () Bool)

(declare-fun e!49977 () Unit!2179)

(declare-fun lt!34912 () Unit!2179)

(assert (=> b!76558 (= e!49977 lt!34912)))

(declare-fun lt!34893 () ListLongMap!1415)

(assert (=> b!76558 (= lt!34893 (getCurrentListMapNoExtraKeys!61 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34910 () (_ BitVec 64))

(assert (=> b!76558 (= lt!34910 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34906 () (_ BitVec 64))

(assert (=> b!76558 (= lt!34906 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34897 () Unit!2179)

(assert (=> b!76558 (= lt!34897 (addStillContains!53 lt!34893 lt!34910 (zeroValue!2145 newMap!16) lt!34906))))

(assert (=> b!76558 (contains!726 (+!97 lt!34893 (tuple2!2139 lt!34910 (zeroValue!2145 newMap!16))) lt!34906)))

(declare-fun lt!34908 () Unit!2179)

(assert (=> b!76558 (= lt!34908 lt!34897)))

(declare-fun lt!34892 () ListLongMap!1415)

(assert (=> b!76558 (= lt!34892 (getCurrentListMapNoExtraKeys!61 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34894 () (_ BitVec 64))

(assert (=> b!76558 (= lt!34894 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34898 () (_ BitVec 64))

(assert (=> b!76558 (= lt!34898 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34911 () Unit!2179)

(assert (=> b!76558 (= lt!34911 (addApplyDifferent!53 lt!34892 lt!34894 (minValue!2145 newMap!16) lt!34898))))

(assert (=> b!76558 (= (apply!77 (+!97 lt!34892 (tuple2!2139 lt!34894 (minValue!2145 newMap!16))) lt!34898) (apply!77 lt!34892 lt!34898))))

(declare-fun lt!34891 () Unit!2179)

(assert (=> b!76558 (= lt!34891 lt!34911)))

(declare-fun lt!34900 () ListLongMap!1415)

(assert (=> b!76558 (= lt!34900 (getCurrentListMapNoExtraKeys!61 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34904 () (_ BitVec 64))

(assert (=> b!76558 (= lt!34904 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34909 () (_ BitVec 64))

(assert (=> b!76558 (= lt!34909 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34902 () Unit!2179)

(assert (=> b!76558 (= lt!34902 (addApplyDifferent!53 lt!34900 lt!34904 (zeroValue!2145 newMap!16) lt!34909))))

(assert (=> b!76558 (= (apply!77 (+!97 lt!34900 (tuple2!2139 lt!34904 (zeroValue!2145 newMap!16))) lt!34909) (apply!77 lt!34900 lt!34909))))

(declare-fun lt!34901 () Unit!2179)

(assert (=> b!76558 (= lt!34901 lt!34902)))

(declare-fun lt!34899 () ListLongMap!1415)

(assert (=> b!76558 (= lt!34899 (getCurrentListMapNoExtraKeys!61 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34905 () (_ BitVec 64))

(assert (=> b!76558 (= lt!34905 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34895 () (_ BitVec 64))

(assert (=> b!76558 (= lt!34895 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!76558 (= lt!34912 (addApplyDifferent!53 lt!34899 lt!34905 (minValue!2145 newMap!16) lt!34895))))

(assert (=> b!76558 (= (apply!77 (+!97 lt!34899 (tuple2!2139 lt!34905 (minValue!2145 newMap!16))) lt!34895) (apply!77 lt!34899 lt!34895))))

(declare-fun b!76559 () Bool)

(declare-fun e!49981 () ListLongMap!1415)

(declare-fun call!6934 () ListLongMap!1415)

(assert (=> b!76559 (= e!49981 call!6934)))

(declare-fun b!76560 () Bool)

(declare-fun Unit!2207 () Unit!2179)

(assert (=> b!76560 (= e!49977 Unit!2207)))

(declare-fun b!76561 () Bool)

(declare-fun e!49976 () Bool)

(assert (=> b!76561 (= e!49976 e!49972)))

(declare-fun res!40278 () Bool)

(assert (=> b!76561 (=> (not res!40278) (not e!49972))))

(assert (=> b!76561 (= res!40278 (contains!726 lt!34896 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!76561 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))

(declare-fun bm!6928 () Bool)

(declare-fun call!6935 () ListLongMap!1415)

(assert (=> bm!6928 (= call!6935 (getCurrentListMapNoExtraKeys!61 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun b!76562 () Bool)

(declare-fun e!49980 () Bool)

(assert (=> b!76562 (= e!49980 (validKeyInArray!0 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6929 () Bool)

(declare-fun call!6936 () Bool)

(assert (=> bm!6929 (= call!6936 (contains!726 lt!34896 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76563 () Bool)

(declare-fun e!49974 () Bool)

(declare-fun e!49979 () Bool)

(assert (=> b!76563 (= e!49974 e!49979)))

(declare-fun res!40276 () Bool)

(declare-fun call!6930 () Bool)

(assert (=> b!76563 (= res!40276 call!6930)))

(assert (=> b!76563 (=> (not res!40276) (not e!49979))))

(declare-fun b!76564 () Bool)

(declare-fun c!11698 () Bool)

(assert (=> b!76564 (= c!11698 (and (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!76564 (= e!49975 e!49981)))

(declare-fun b!76565 () Bool)

(declare-fun res!40282 () Bool)

(declare-fun e!49982 () Bool)

(assert (=> b!76565 (=> (not res!40282) (not e!49982))))

(assert (=> b!76565 (= res!40282 e!49974)))

(declare-fun c!11699 () Bool)

(assert (=> b!76565 (= c!11699 (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!76566 () Bool)

(assert (=> b!76566 (= e!49983 e!49975)))

(declare-fun c!11702 () Bool)

(assert (=> b!76566 (= c!11702 (and (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!76567 () Bool)

(declare-fun e!49971 () Bool)

(declare-fun e!49973 () Bool)

(assert (=> b!76567 (= e!49971 e!49973)))

(declare-fun res!40281 () Bool)

(assert (=> b!76567 (= res!40281 call!6936)))

(assert (=> b!76567 (=> (not res!40281) (not e!49973))))

(declare-fun b!76568 () Bool)

(assert (=> b!76568 (= e!49979 (= (apply!77 lt!34896 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2145 newMap!16)))))

(declare-fun b!76569 () Bool)

(assert (=> b!76569 (= e!49973 (= (apply!77 lt!34896 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2145 newMap!16)))))

(declare-fun b!76570 () Bool)

(assert (=> b!76570 (= e!49982 e!49971)))

(declare-fun c!11700 () Bool)

(assert (=> b!76570 (= c!11700 (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6927 () Bool)

(declare-fun call!6932 () ListLongMap!1415)

(assert (=> bm!6927 (= call!6932 call!6935)))

(declare-fun d!18199 () Bool)

(assert (=> d!18199 e!49982))

(declare-fun res!40279 () Bool)

(assert (=> d!18199 (=> (not res!40279) (not e!49982))))

(assert (=> d!18199 (= res!40279 (or (bvsge #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))))

(declare-fun lt!34903 () ListLongMap!1415)

(assert (=> d!18199 (= lt!34896 lt!34903)))

(declare-fun lt!34907 () Unit!2179)

(assert (=> d!18199 (= lt!34907 e!49977)))

(declare-fun c!11697 () Bool)

(assert (=> d!18199 (= c!11697 e!49980)))

(declare-fun res!40280 () Bool)

(assert (=> d!18199 (=> (not res!40280) (not e!49980))))

(assert (=> d!18199 (= res!40280 (bvslt #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))

(assert (=> d!18199 (= lt!34903 e!49983)))

(declare-fun c!11701 () Bool)

(assert (=> d!18199 (= c!11701 (and (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18199 (validMask!0 (mask!6228 newMap!16))))

(assert (=> d!18199 (= (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) lt!34896)))

(declare-fun bm!6930 () Bool)

(assert (=> bm!6930 (= call!6933 call!6931)))

(declare-fun bm!6931 () Bool)

(assert (=> bm!6931 (= call!6930 (contains!726 lt!34896 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6932 () Bool)

(assert (=> bm!6932 (= call!6934 call!6932)))

(declare-fun b!76571 () Bool)

(assert (=> b!76571 (= e!49981 call!6933)))

(declare-fun b!76572 () Bool)

(assert (=> b!76572 (= e!49974 (not call!6930))))

(declare-fun b!76573 () Bool)

(declare-fun res!40277 () Bool)

(assert (=> b!76573 (=> (not res!40277) (not e!49982))))

(assert (=> b!76573 (= res!40277 e!49976)))

(declare-fun res!40283 () Bool)

(assert (=> b!76573 (=> res!40283 e!49976)))

(assert (=> b!76573 (= res!40283 (not e!49978))))

(declare-fun res!40275 () Bool)

(assert (=> b!76573 (=> (not res!40275) (not e!49978))))

(assert (=> b!76573 (= res!40275 (bvslt #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))

(declare-fun bm!6933 () Bool)

(assert (=> bm!6933 (= call!6931 (+!97 (ite c!11701 call!6935 (ite c!11702 call!6932 call!6934)) (ite (or c!11701 c!11702) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 newMap!16)) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 newMap!16)))))))

(declare-fun b!76574 () Bool)

(assert (=> b!76574 (= e!49971 (not call!6936))))

(assert (= (and d!18199 c!11701) b!76556))

(assert (= (and d!18199 (not c!11701)) b!76566))

(assert (= (and b!76566 c!11702) b!76554))

(assert (= (and b!76566 (not c!11702)) b!76564))

(assert (= (and b!76564 c!11698) b!76571))

(assert (= (and b!76564 (not c!11698)) b!76559))

(assert (= (or b!76571 b!76559) bm!6932))

(assert (= (or b!76554 bm!6932) bm!6927))

(assert (= (or b!76554 b!76571) bm!6930))

(assert (= (or b!76556 bm!6927) bm!6928))

(assert (= (or b!76556 bm!6930) bm!6933))

(assert (= (and d!18199 res!40280) b!76562))

(assert (= (and d!18199 c!11697) b!76558))

(assert (= (and d!18199 (not c!11697)) b!76560))

(assert (= (and d!18199 res!40279) b!76573))

(assert (= (and b!76573 res!40275) b!76557))

(assert (= (and b!76573 (not res!40283)) b!76561))

(assert (= (and b!76561 res!40278) b!76555))

(assert (= (and b!76573 res!40277) b!76565))

(assert (= (and b!76565 c!11699) b!76563))

(assert (= (and b!76565 (not c!11699)) b!76572))

(assert (= (and b!76563 res!40276) b!76568))

(assert (= (or b!76563 b!76572) bm!6931))

(assert (= (and b!76565 res!40282) b!76570))

(assert (= (and b!76570 c!11700) b!76567))

(assert (= (and b!76570 (not c!11700)) b!76574))

(assert (= (and b!76567 res!40281) b!76569))

(assert (= (or b!76567 b!76574) bm!6929))

(declare-fun b_lambda!3423 () Bool)

(assert (=> (not b_lambda!3423) (not b!76555)))

(assert (=> b!76555 t!5093))

(declare-fun b_and!4669 () Bool)

(assert (= b_and!4665 (and (=> t!5093 result!2741) b_and!4669)))

(assert (=> b!76555 t!5095))

(declare-fun b_and!4671 () Bool)

(assert (= b_and!4667 (and (=> t!5095 result!2743) b_and!4671)))

(declare-fun m!76293 () Bool)

(assert (=> bm!6928 m!76293))

(assert (=> b!76562 m!76149))

(assert (=> b!76562 m!76149))

(assert (=> b!76562 m!76163))

(assert (=> b!76557 m!76149))

(assert (=> b!76557 m!76149))

(assert (=> b!76557 m!76163))

(assert (=> d!18199 m!75799))

(declare-fun m!76295 () Bool)

(assert (=> b!76568 m!76295))

(declare-fun m!76297 () Bool)

(assert (=> b!76556 m!76297))

(declare-fun m!76299 () Bool)

(assert (=> bm!6933 m!76299))

(declare-fun m!76301 () Bool)

(assert (=> b!76555 m!76301))

(assert (=> b!76555 m!76173))

(declare-fun m!76303 () Bool)

(assert (=> b!76555 m!76303))

(assert (=> b!76555 m!76173))

(assert (=> b!76555 m!76149))

(declare-fun m!76305 () Bool)

(assert (=> b!76555 m!76305))

(assert (=> b!76555 m!76149))

(assert (=> b!76555 m!76301))

(declare-fun m!76307 () Bool)

(assert (=> bm!6931 m!76307))

(declare-fun m!76309 () Bool)

(assert (=> b!76569 m!76309))

(declare-fun m!76311 () Bool)

(assert (=> b!76558 m!76311))

(declare-fun m!76313 () Bool)

(assert (=> b!76558 m!76313))

(declare-fun m!76315 () Bool)

(assert (=> b!76558 m!76315))

(assert (=> b!76558 m!76311))

(declare-fun m!76317 () Bool)

(assert (=> b!76558 m!76317))

(declare-fun m!76319 () Bool)

(assert (=> b!76558 m!76319))

(declare-fun m!76321 () Bool)

(assert (=> b!76558 m!76321))

(declare-fun m!76323 () Bool)

(assert (=> b!76558 m!76323))

(assert (=> b!76558 m!76313))

(declare-fun m!76325 () Bool)

(assert (=> b!76558 m!76325))

(declare-fun m!76327 () Bool)

(assert (=> b!76558 m!76327))

(declare-fun m!76329 () Bool)

(assert (=> b!76558 m!76329))

(declare-fun m!76331 () Bool)

(assert (=> b!76558 m!76331))

(declare-fun m!76333 () Bool)

(assert (=> b!76558 m!76333))

(assert (=> b!76558 m!76293))

(declare-fun m!76335 () Bool)

(assert (=> b!76558 m!76335))

(assert (=> b!76558 m!76327))

(declare-fun m!76337 () Bool)

(assert (=> b!76558 m!76337))

(assert (=> b!76558 m!76319))

(assert (=> b!76558 m!76149))

(declare-fun m!76339 () Bool)

(assert (=> b!76558 m!76339))

(assert (=> b!76561 m!76149))

(assert (=> b!76561 m!76149))

(declare-fun m!76341 () Bool)

(assert (=> b!76561 m!76341))

(declare-fun m!76343 () Bool)

(assert (=> bm!6929 m!76343))

(assert (=> d!18047 d!18199))

(assert (=> b!76146 d!18083))

(declare-fun d!18201 () Bool)

(declare-fun isEmpty!327 (List!1494) Bool)

(assert (=> d!18201 (= (isEmpty!326 lt!34620) (isEmpty!327 (toList!723 lt!34620)))))

(declare-fun bs!3266 () Bool)

(assert (= bs!3266 d!18201))

(declare-fun m!76345 () Bool)

(assert (=> bs!3266 m!76345))

(assert (=> b!76197 d!18201))

(declare-fun d!18203 () Bool)

(declare-fun e!49984 () Bool)

(assert (=> d!18203 e!49984))

(declare-fun res!40284 () Bool)

(assert (=> d!18203 (=> res!40284 e!49984)))

(declare-fun lt!34916 () Bool)

(assert (=> d!18203 (= res!40284 (not lt!34916))))

(declare-fun lt!34915 () Bool)

(assert (=> d!18203 (= lt!34916 lt!34915)))

(declare-fun lt!34914 () Unit!2179)

(declare-fun e!49985 () Unit!2179)

(assert (=> d!18203 (= lt!34914 e!49985)))

(declare-fun c!11703 () Bool)

(assert (=> d!18203 (= c!11703 lt!34915)))

(assert (=> d!18203 (= lt!34915 (containsKey!137 (toList!723 lt!34576) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!18203 (= (contains!726 lt!34576 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!34916)))

(declare-fun b!76575 () Bool)

(declare-fun lt!34913 () Unit!2179)

(assert (=> b!76575 (= e!49985 lt!34913)))

(assert (=> b!76575 (= lt!34913 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 lt!34576) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!76575 (isDefined!87 (getValueByKey!133 (toList!723 lt!34576) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!76576 () Bool)

(declare-fun Unit!2208 () Unit!2179)

(assert (=> b!76576 (= e!49985 Unit!2208)))

(declare-fun b!76577 () Bool)

(assert (=> b!76577 (= e!49984 (isDefined!87 (getValueByKey!133 (toList!723 lt!34576) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!18203 c!11703) b!76575))

(assert (= (and d!18203 (not c!11703)) b!76576))

(assert (= (and d!18203 (not res!40284)) b!76577))

(assert (=> d!18203 m!75551))

(declare-fun m!76347 () Bool)

(assert (=> d!18203 m!76347))

(assert (=> b!76575 m!75551))

(declare-fun m!76349 () Bool)

(assert (=> b!76575 m!76349))

(assert (=> b!76575 m!75551))

(declare-fun m!76351 () Bool)

(assert (=> b!76575 m!76351))

(assert (=> b!76575 m!76351))

(declare-fun m!76353 () Bool)

(assert (=> b!76575 m!76353))

(assert (=> b!76577 m!75551))

(assert (=> b!76577 m!76351))

(assert (=> b!76577 m!76351))

(assert (=> b!76577 m!76353))

(assert (=> b!76145 d!18203))

(assert (=> bm!6884 d!18195))

(declare-fun d!18205 () Bool)

(declare-fun e!49988 () Bool)

(assert (=> d!18205 e!49988))

(declare-fun res!40290 () Bool)

(assert (=> d!18205 (=> (not res!40290) (not e!49988))))

(declare-fun lt!34922 () SeekEntryResult!241)

(assert (=> d!18205 (= res!40290 ((_ is Found!241) lt!34922))))

(assert (=> d!18205 (= lt!34922 (seekEntryOrOpen!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (_keys!3903 newMap!16) (mask!6228 newMap!16)))))

(declare-fun lt!34921 () Unit!2179)

(declare-fun choose!452 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 64) Int) Unit!2179)

(assert (=> d!18205 (= lt!34921 (choose!452 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (defaultEntry!2246 newMap!16)))))

(assert (=> d!18205 (validMask!0 (mask!6228 newMap!16))))

(assert (=> d!18205 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!26 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (defaultEntry!2246 newMap!16)) lt!34921)))

(declare-fun b!76582 () Bool)

(declare-fun res!40289 () Bool)

(assert (=> b!76582 (=> (not res!40289) (not e!49988))))

(assert (=> b!76582 (= res!40289 (inRange!0 (index!3098 lt!34922) (mask!6228 newMap!16)))))

(declare-fun b!76583 () Bool)

(assert (=> b!76583 (= e!49988 (= (select (arr!1858 (_keys!3903 newMap!16)) (index!3098 lt!34922)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(assert (=> b!76583 (and (bvsge (index!3098 lt!34922) #b00000000000000000000000000000000) (bvslt (index!3098 lt!34922) (size!2099 (_keys!3903 newMap!16))))))

(assert (= (and d!18205 res!40290) b!76582))

(assert (= (and b!76582 res!40289) b!76583))

(assert (=> d!18205 m!75383))

(assert (=> d!18205 m!75595))

(assert (=> d!18205 m!75383))

(declare-fun m!76355 () Bool)

(assert (=> d!18205 m!76355))

(assert (=> d!18205 m!75799))

(declare-fun m!76357 () Bool)

(assert (=> b!76582 m!76357))

(declare-fun m!76359 () Bool)

(assert (=> b!76583 m!76359))

(assert (=> bm!6853 d!18205))

(declare-fun d!18207 () Bool)

(declare-fun isEmpty!328 (Option!139) Bool)

(assert (=> d!18207 (= (isDefined!87 (getValueByKey!133 (toList!723 lt!34347) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355))) (not (isEmpty!328 (getValueByKey!133 (toList!723 lt!34347) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))))

(declare-fun bs!3267 () Bool)

(assert (= bs!3267 d!18207))

(assert (=> bs!3267 m!75585))

(declare-fun m!76361 () Bool)

(assert (=> bs!3267 m!76361))

(assert (=> b!75975 d!18207))

(declare-fun e!49990 () Option!139)

(declare-fun b!76586 () Bool)

(assert (=> b!76586 (= e!49990 (getValueByKey!133 (t!5079 (toList!723 lt!34347)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun b!76587 () Bool)

(assert (=> b!76587 (= e!49990 None!137)))

(declare-fun b!76585 () Bool)

(declare-fun e!49989 () Option!139)

(assert (=> b!76585 (= e!49989 e!49990)))

(declare-fun c!11705 () Bool)

(assert (=> b!76585 (= c!11705 (and ((_ is Cons!1490) (toList!723 lt!34347)) (not (= (_1!1080 (h!2078 (toList!723 lt!34347))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))))

(declare-fun b!76584 () Bool)

(assert (=> b!76584 (= e!49989 (Some!138 (_2!1080 (h!2078 (toList!723 lt!34347)))))))

(declare-fun c!11704 () Bool)

(declare-fun d!18209 () Bool)

(assert (=> d!18209 (= c!11704 (and ((_ is Cons!1490) (toList!723 lt!34347)) (= (_1!1080 (h!2078 (toList!723 lt!34347))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355))))))

(assert (=> d!18209 (= (getValueByKey!133 (toList!723 lt!34347) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) e!49989)))

(assert (= (and d!18209 c!11704) b!76584))

(assert (= (and d!18209 (not c!11704)) b!76585))

(assert (= (and b!76585 c!11705) b!76586))

(assert (= (and b!76585 (not c!11705)) b!76587))

(assert (=> b!76586 m!75383))

(declare-fun m!76363 () Bool)

(assert (=> b!76586 m!76363))

(assert (=> b!75975 d!18209))

(declare-fun b!76588 () Bool)

(declare-fun e!49992 () Bool)

(declare-fun e!49991 () Bool)

(assert (=> b!76588 (= e!49992 e!49991)))

(declare-fun c!11706 () Bool)

(assert (=> b!76588 (= c!11706 (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!76589 () Bool)

(declare-fun call!6937 () Bool)

(assert (=> b!76589 (= e!49991 call!6937)))

(declare-fun b!76590 () Bool)

(declare-fun e!49993 () Bool)

(assert (=> b!76590 (= e!49991 e!49993)))

(declare-fun lt!34925 () (_ BitVec 64))

(assert (=> b!76590 (= lt!34925 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!34923 () Unit!2179)

(assert (=> b!76590 (= lt!34923 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) lt!34925 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!76590 (arrayContainsKey!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) lt!34925 #b00000000000000000000000000000000)))

(declare-fun lt!34924 () Unit!2179)

(assert (=> b!76590 (= lt!34924 lt!34923)))

(declare-fun res!40292 () Bool)

(assert (=> b!76590 (= res!40292 (= (seekEntryOrOpen!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3903 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992)))) (Found!241 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!76590 (=> (not res!40292) (not e!49993))))

(declare-fun bm!6934 () Bool)

(assert (=> bm!6934 (= call!6937 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3903 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992)))))))

(declare-fun d!18211 () Bool)

(declare-fun res!40291 () Bool)

(assert (=> d!18211 (=> res!40291 e!49992)))

(assert (=> d!18211 (= res!40291 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(assert (=> d!18211 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3903 (v!2552 (underlying!262 thiss!992))) (mask!6228 (v!2552 (underlying!262 thiss!992)))) e!49992)))

(declare-fun b!76591 () Bool)

(assert (=> b!76591 (= e!49993 call!6937)))

(assert (= (and d!18211 (not res!40291)) b!76588))

(assert (= (and b!76588 c!11706) b!76590))

(assert (= (and b!76588 (not c!11706)) b!76589))

(assert (= (and b!76590 res!40292) b!76591))

(assert (= (or b!76591 b!76589) bm!6934))

(declare-fun m!76365 () Bool)

(assert (=> b!76588 m!76365))

(assert (=> b!76588 m!76365))

(declare-fun m!76367 () Bool)

(assert (=> b!76588 m!76367))

(assert (=> b!76590 m!76365))

(declare-fun m!76369 () Bool)

(assert (=> b!76590 m!76369))

(declare-fun m!76371 () Bool)

(assert (=> b!76590 m!76371))

(assert (=> b!76590 m!76365))

(declare-fun m!76373 () Bool)

(assert (=> b!76590 m!76373))

(declare-fun m!76375 () Bool)

(assert (=> bm!6934 m!76375))

(assert (=> bm!6887 d!18211))

(assert (=> b!76141 d!18083))

(declare-fun d!18213 () Bool)

(declare-fun lt!34926 () Bool)

(assert (=> d!18213 (= lt!34926 (select (content!82 (toList!723 lt!34636)) lt!34342))))

(declare-fun e!49994 () Bool)

(assert (=> d!18213 (= lt!34926 e!49994)))

(declare-fun res!40293 () Bool)

(assert (=> d!18213 (=> (not res!40293) (not e!49994))))

(assert (=> d!18213 (= res!40293 ((_ is Cons!1490) (toList!723 lt!34636)))))

(assert (=> d!18213 (= (contains!730 (toList!723 lt!34636) lt!34342) lt!34926)))

(declare-fun b!76592 () Bool)

(declare-fun e!49995 () Bool)

(assert (=> b!76592 (= e!49994 e!49995)))

(declare-fun res!40294 () Bool)

(assert (=> b!76592 (=> res!40294 e!49995)))

(assert (=> b!76592 (= res!40294 (= (h!2078 (toList!723 lt!34636)) lt!34342))))

(declare-fun b!76593 () Bool)

(assert (=> b!76593 (= e!49995 (contains!730 (t!5079 (toList!723 lt!34636)) lt!34342))))

(assert (= (and d!18213 res!40293) b!76592))

(assert (= (and b!76592 (not res!40294)) b!76593))

(declare-fun m!76377 () Bool)

(assert (=> d!18213 m!76377))

(declare-fun m!76379 () Bool)

(assert (=> d!18213 m!76379))

(declare-fun m!76381 () Bool)

(assert (=> b!76593 m!76381))

(assert (=> b!76212 d!18213))

(declare-fun d!18215 () Bool)

(declare-fun e!49996 () Bool)

(assert (=> d!18215 e!49996))

(declare-fun res!40296 () Bool)

(assert (=> d!18215 (=> (not res!40296) (not e!49996))))

(declare-fun lt!34929 () ListLongMap!1415)

(assert (=> d!18215 (= res!40296 (contains!726 lt!34929 (_1!1080 (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(declare-fun lt!34928 () List!1494)

(assert (=> d!18215 (= lt!34929 (ListLongMap!1416 lt!34928))))

(declare-fun lt!34927 () Unit!2179)

(declare-fun lt!34930 () Unit!2179)

(assert (=> d!18215 (= lt!34927 lt!34930)))

(assert (=> d!18215 (= (getValueByKey!133 lt!34928 (_1!1080 (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))) (Some!138 (_2!1080 (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18215 (= lt!34930 (lemmaContainsTupThenGetReturnValue!53 lt!34928 (_1!1080 (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992))))) (_2!1080 (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18215 (= lt!34928 (insertStrictlySorted!56 (toList!723 call!6879) (_1!1080 (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992))))) (_2!1080 (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18215 (= (+!97 call!6879 (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34929)))

(declare-fun b!76594 () Bool)

(declare-fun res!40295 () Bool)

(assert (=> b!76594 (=> (not res!40295) (not e!49996))))

(assert (=> b!76594 (= res!40295 (= (getValueByKey!133 (toList!723 lt!34929) (_1!1080 (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992)))))) (Some!138 (_2!1080 (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992))))))))))

(declare-fun b!76595 () Bool)

(assert (=> b!76595 (= e!49996 (contains!730 (toList!723 lt!34929) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2552 (underlying!262 thiss!992))))))))

(assert (= (and d!18215 res!40296) b!76594))

(assert (= (and b!76594 res!40295) b!76595))

(declare-fun m!76383 () Bool)

(assert (=> d!18215 m!76383))

(declare-fun m!76385 () Bool)

(assert (=> d!18215 m!76385))

(declare-fun m!76387 () Bool)

(assert (=> d!18215 m!76387))

(declare-fun m!76389 () Bool)

(assert (=> d!18215 m!76389))

(declare-fun m!76391 () Bool)

(assert (=> b!76594 m!76391))

(declare-fun m!76393 () Bool)

(assert (=> b!76595 m!76393))

(assert (=> b!76140 d!18215))

(declare-fun d!18217 () Bool)

(declare-fun e!49997 () Bool)

(assert (=> d!18217 e!49997))

(declare-fun res!40297 () Bool)

(assert (=> d!18217 (=> res!40297 e!49997)))

(declare-fun lt!34934 () Bool)

(assert (=> d!18217 (= res!40297 (not lt!34934))))

(declare-fun lt!34933 () Bool)

(assert (=> d!18217 (= lt!34934 lt!34933)))

(declare-fun lt!34932 () Unit!2179)

(declare-fun e!49998 () Unit!2179)

(assert (=> d!18217 (= lt!34932 e!49998)))

(declare-fun c!11707 () Bool)

(assert (=> d!18217 (= c!11707 lt!34933)))

(assert (=> d!18217 (= lt!34933 (containsKey!137 (toList!723 lt!34603) (_1!1080 lt!34352)))))

(assert (=> d!18217 (= (contains!726 lt!34603 (_1!1080 lt!34352)) lt!34934)))

(declare-fun b!76596 () Bool)

(declare-fun lt!34931 () Unit!2179)

(assert (=> b!76596 (= e!49998 lt!34931)))

(assert (=> b!76596 (= lt!34931 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 lt!34603) (_1!1080 lt!34352)))))

(assert (=> b!76596 (isDefined!87 (getValueByKey!133 (toList!723 lt!34603) (_1!1080 lt!34352)))))

(declare-fun b!76597 () Bool)

(declare-fun Unit!2209 () Unit!2179)

(assert (=> b!76597 (= e!49998 Unit!2209)))

(declare-fun b!76598 () Bool)

(assert (=> b!76598 (= e!49997 (isDefined!87 (getValueByKey!133 (toList!723 lt!34603) (_1!1080 lt!34352))))))

(assert (= (and d!18217 c!11707) b!76596))

(assert (= (and d!18217 (not c!11707)) b!76597))

(assert (= (and d!18217 (not res!40297)) b!76598))

(declare-fun m!76395 () Bool)

(assert (=> d!18217 m!76395))

(declare-fun m!76397 () Bool)

(assert (=> b!76596 m!76397))

(assert (=> b!76596 m!75709))

(assert (=> b!76596 m!75709))

(declare-fun m!76399 () Bool)

(assert (=> b!76596 m!76399))

(assert (=> b!76598 m!75709))

(assert (=> b!76598 m!75709))

(assert (=> b!76598 m!76399))

(assert (=> d!18053 d!18217))

(declare-fun b!76601 () Bool)

(declare-fun e!50000 () Option!139)

(assert (=> b!76601 (= e!50000 (getValueByKey!133 (t!5079 lt!34602) (_1!1080 lt!34352)))))

(declare-fun b!76602 () Bool)

(assert (=> b!76602 (= e!50000 None!137)))

(declare-fun b!76600 () Bool)

(declare-fun e!49999 () Option!139)

(assert (=> b!76600 (= e!49999 e!50000)))

(declare-fun c!11709 () Bool)

(assert (=> b!76600 (= c!11709 (and ((_ is Cons!1490) lt!34602) (not (= (_1!1080 (h!2078 lt!34602)) (_1!1080 lt!34352)))))))

(declare-fun b!76599 () Bool)

(assert (=> b!76599 (= e!49999 (Some!138 (_2!1080 (h!2078 lt!34602))))))

(declare-fun d!18219 () Bool)

(declare-fun c!11708 () Bool)

(assert (=> d!18219 (= c!11708 (and ((_ is Cons!1490) lt!34602) (= (_1!1080 (h!2078 lt!34602)) (_1!1080 lt!34352))))))

(assert (=> d!18219 (= (getValueByKey!133 lt!34602 (_1!1080 lt!34352)) e!49999)))

(assert (= (and d!18219 c!11708) b!76599))

(assert (= (and d!18219 (not c!11708)) b!76600))

(assert (= (and b!76600 c!11709) b!76601))

(assert (= (and b!76600 (not c!11709)) b!76602))

(declare-fun m!76401 () Bool)

(assert (=> b!76601 m!76401))

(assert (=> d!18053 d!18219))

(declare-fun d!18221 () Bool)

(assert (=> d!18221 (= (getValueByKey!133 lt!34602 (_1!1080 lt!34352)) (Some!138 (_2!1080 lt!34352)))))

(declare-fun lt!34935 () Unit!2179)

(assert (=> d!18221 (= lt!34935 (choose!447 lt!34602 (_1!1080 lt!34352) (_2!1080 lt!34352)))))

(declare-fun e!50001 () Bool)

(assert (=> d!18221 e!50001))

(declare-fun res!40298 () Bool)

(assert (=> d!18221 (=> (not res!40298) (not e!50001))))

(assert (=> d!18221 (= res!40298 (isStrictlySorted!289 lt!34602))))

(assert (=> d!18221 (= (lemmaContainsTupThenGetReturnValue!53 lt!34602 (_1!1080 lt!34352) (_2!1080 lt!34352)) lt!34935)))

(declare-fun b!76603 () Bool)

(declare-fun res!40299 () Bool)

(assert (=> b!76603 (=> (not res!40299) (not e!50001))))

(assert (=> b!76603 (= res!40299 (containsKey!137 lt!34602 (_1!1080 lt!34352)))))

(declare-fun b!76604 () Bool)

(assert (=> b!76604 (= e!50001 (contains!730 lt!34602 (tuple2!2139 (_1!1080 lt!34352) (_2!1080 lt!34352))))))

(assert (= (and d!18221 res!40298) b!76603))

(assert (= (and b!76603 res!40299) b!76604))

(assert (=> d!18221 m!75703))

(declare-fun m!76403 () Bool)

(assert (=> d!18221 m!76403))

(declare-fun m!76405 () Bool)

(assert (=> d!18221 m!76405))

(declare-fun m!76407 () Bool)

(assert (=> b!76603 m!76407))

(declare-fun m!76409 () Bool)

(assert (=> b!76604 m!76409))

(assert (=> d!18053 d!18221))

(declare-fun c!11710 () Bool)

(declare-fun e!50006 () List!1494)

(declare-fun b!76605 () Bool)

(declare-fun c!11713 () Bool)

(assert (=> b!76605 (= e!50006 (ite c!11710 (t!5079 (toList!723 lt!34345)) (ite c!11713 (Cons!1490 (h!2078 (toList!723 lt!34345)) (t!5079 (toList!723 lt!34345))) Nil!1491)))))

(declare-fun d!18223 () Bool)

(declare-fun e!50005 () Bool)

(assert (=> d!18223 e!50005))

(declare-fun res!40301 () Bool)

(assert (=> d!18223 (=> (not res!40301) (not e!50005))))

(declare-fun lt!34936 () List!1494)

(assert (=> d!18223 (= res!40301 (isStrictlySorted!289 lt!34936))))

(declare-fun e!50004 () List!1494)

(assert (=> d!18223 (= lt!34936 e!50004)))

(declare-fun c!11712 () Bool)

(assert (=> d!18223 (= c!11712 (and ((_ is Cons!1490) (toList!723 lt!34345)) (bvslt (_1!1080 (h!2078 (toList!723 lt!34345))) (_1!1080 lt!34352))))))

(assert (=> d!18223 (isStrictlySorted!289 (toList!723 lt!34345))))

(assert (=> d!18223 (= (insertStrictlySorted!56 (toList!723 lt!34345) (_1!1080 lt!34352) (_2!1080 lt!34352)) lt!34936)))

(declare-fun b!76606 () Bool)

(assert (=> b!76606 (= e!50006 (insertStrictlySorted!56 (t!5079 (toList!723 lt!34345)) (_1!1080 lt!34352) (_2!1080 lt!34352)))))

(declare-fun bm!6935 () Bool)

(declare-fun call!6939 () List!1494)

(assert (=> bm!6935 (= call!6939 ($colon$colon!67 e!50006 (ite c!11712 (h!2078 (toList!723 lt!34345)) (tuple2!2139 (_1!1080 lt!34352) (_2!1080 lt!34352)))))))

(declare-fun c!11711 () Bool)

(assert (=> bm!6935 (= c!11711 c!11712)))

(declare-fun bm!6936 () Bool)

(declare-fun call!6940 () List!1494)

(declare-fun call!6938 () List!1494)

(assert (=> bm!6936 (= call!6940 call!6938)))

(declare-fun b!76607 () Bool)

(declare-fun e!50003 () List!1494)

(assert (=> b!76607 (= e!50003 call!6938)))

(declare-fun b!76608 () Bool)

(assert (=> b!76608 (= e!50005 (contains!730 lt!34936 (tuple2!2139 (_1!1080 lt!34352) (_2!1080 lt!34352))))))

(declare-fun bm!6937 () Bool)

(assert (=> bm!6937 (= call!6938 call!6939)))

(declare-fun b!76609 () Bool)

(assert (=> b!76609 (= e!50004 e!50003)))

(assert (=> b!76609 (= c!11710 (and ((_ is Cons!1490) (toList!723 lt!34345)) (= (_1!1080 (h!2078 (toList!723 lt!34345))) (_1!1080 lt!34352))))))

(declare-fun b!76610 () Bool)

(declare-fun res!40300 () Bool)

(assert (=> b!76610 (=> (not res!40300) (not e!50005))))

(assert (=> b!76610 (= res!40300 (containsKey!137 lt!34936 (_1!1080 lt!34352)))))

(declare-fun b!76611 () Bool)

(declare-fun e!50002 () List!1494)

(assert (=> b!76611 (= e!50002 call!6940)))

(declare-fun b!76612 () Bool)

(assert (=> b!76612 (= c!11713 (and ((_ is Cons!1490) (toList!723 lt!34345)) (bvsgt (_1!1080 (h!2078 (toList!723 lt!34345))) (_1!1080 lt!34352))))))

(assert (=> b!76612 (= e!50003 e!50002)))

(declare-fun b!76613 () Bool)

(assert (=> b!76613 (= e!50002 call!6940)))

(declare-fun b!76614 () Bool)

(assert (=> b!76614 (= e!50004 call!6939)))

(assert (= (and d!18223 c!11712) b!76614))

(assert (= (and d!18223 (not c!11712)) b!76609))

(assert (= (and b!76609 c!11710) b!76607))

(assert (= (and b!76609 (not c!11710)) b!76612))

(assert (= (and b!76612 c!11713) b!76611))

(assert (= (and b!76612 (not c!11713)) b!76613))

(assert (= (or b!76611 b!76613) bm!6936))

(assert (= (or b!76607 bm!6936) bm!6937))

(assert (= (or b!76614 bm!6937) bm!6935))

(assert (= (and bm!6935 c!11711) b!76606))

(assert (= (and bm!6935 (not c!11711)) b!76605))

(assert (= (and d!18223 res!40301) b!76610))

(assert (= (and b!76610 res!40300) b!76608))

(declare-fun m!76411 () Bool)

(assert (=> b!76606 m!76411))

(declare-fun m!76413 () Bool)

(assert (=> b!76610 m!76413))

(declare-fun m!76415 () Bool)

(assert (=> d!18223 m!76415))

(assert (=> d!18223 m!75895))

(declare-fun m!76417 () Bool)

(assert (=> bm!6935 m!76417))

(declare-fun m!76419 () Bool)

(assert (=> b!76608 m!76419))

(assert (=> d!18053 d!18223))

(declare-fun d!18225 () Bool)

(assert (=> d!18225 (isDefined!87 (getValueByKey!133 (toList!723 lt!34347) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun lt!34939 () Unit!2179)

(declare-fun choose!453 (List!1494 (_ BitVec 64)) Unit!2179)

(assert (=> d!18225 (= lt!34939 (choose!453 (toList!723 lt!34347) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun e!50009 () Bool)

(assert (=> d!18225 e!50009))

(declare-fun res!40304 () Bool)

(assert (=> d!18225 (=> (not res!40304) (not e!50009))))

(assert (=> d!18225 (= res!40304 (isStrictlySorted!289 (toList!723 lt!34347)))))

(assert (=> d!18225 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 lt!34347) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) lt!34939)))

(declare-fun b!76617 () Bool)

(assert (=> b!76617 (= e!50009 (containsKey!137 (toList!723 lt!34347) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(assert (= (and d!18225 res!40304) b!76617))

(assert (=> d!18225 m!75383))

(assert (=> d!18225 m!75585))

(assert (=> d!18225 m!75585))

(assert (=> d!18225 m!75587))

(assert (=> d!18225 m!75383))

(declare-fun m!76421 () Bool)

(assert (=> d!18225 m!76421))

(declare-fun m!76423 () Bool)

(assert (=> d!18225 m!76423))

(assert (=> b!76617 m!75383))

(assert (=> b!76617 m!75581))

(assert (=> b!75973 d!18225))

(assert (=> b!75973 d!18207))

(assert (=> b!75973 d!18209))

(declare-fun d!18227 () Bool)

(declare-fun e!50012 () Bool)

(assert (=> d!18227 e!50012))

(declare-fun res!40307 () Bool)

(assert (=> d!18227 (=> (not res!40307) (not e!50012))))

(assert (=> d!18227 (= res!40307 (and (bvsge (index!3098 lt!34514) #b00000000000000000000000000000000) (bvslt (index!3098 lt!34514) (size!2099 (_keys!3903 newMap!16)))))))

(declare-fun lt!34942 () Unit!2179)

(declare-fun choose!454 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 32) Int) Unit!2179)

(assert (=> d!18227 (= lt!34942 (choose!454 (_keys!3903 newMap!16) lt!34516 (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (index!3098 lt!34514) (defaultEntry!2246 newMap!16)))))

(assert (=> d!18227 (validMask!0 (mask!6228 newMap!16))))

(assert (=> d!18227 (= (lemmaValidKeyInArrayIsInListMap!85 (_keys!3903 newMap!16) lt!34516 (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (index!3098 lt!34514) (defaultEntry!2246 newMap!16)) lt!34942)))

(declare-fun b!76620 () Bool)

(assert (=> b!76620 (= e!50012 (contains!726 (getCurrentListMap!415 (_keys!3903 newMap!16) lt!34516 (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (select (arr!1858 (_keys!3903 newMap!16)) (index!3098 lt!34514))))))

(assert (= (and d!18227 res!40307) b!76620))

(declare-fun m!76425 () Bool)

(assert (=> d!18227 m!76425))

(assert (=> d!18227 m!75799))

(declare-fun m!76427 () Bool)

(assert (=> b!76620 m!76427))

(assert (=> b!76620 m!75623))

(assert (=> b!76620 m!76427))

(assert (=> b!76620 m!75623))

(declare-fun m!76429 () Bool)

(assert (=> b!76620 m!76429))

(assert (=> b!76058 d!18227))

(declare-fun d!18229 () Bool)

(declare-fun e!50015 () Bool)

(assert (=> d!18229 e!50015))

(declare-fun res!40310 () Bool)

(assert (=> d!18229 (=> (not res!40310) (not e!50015))))

(assert (=> d!18229 (= res!40310 (and (bvsge (index!3098 lt!34514) #b00000000000000000000000000000000) (bvslt (index!3098 lt!34514) (size!2100 (_values!2229 newMap!16)))))))

(declare-fun lt!34945 () Unit!2179)

(declare-fun choose!455 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 32) (_ BitVec 64) V!2961 Int) Unit!2179)

(assert (=> d!18229 (= lt!34945 (choose!455 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (index!3098 lt!34514) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341 (defaultEntry!2246 newMap!16)))))

(assert (=> d!18229 (validMask!0 (mask!6228 newMap!16))))

(assert (=> d!18229 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!26 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (index!3098 lt!34514) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341 (defaultEntry!2246 newMap!16)) lt!34945)))

(declare-fun b!76623 () Bool)

(assert (=> b!76623 (= e!50015 (= (+!97 (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)) (getCurrentListMap!415 (_keys!3903 newMap!16) (array!3902 (store (arr!1859 (_values!2229 newMap!16)) (index!3098 lt!34514) (ValueCellFull!899 lt!34341)) (size!2100 (_values!2229 newMap!16))) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16))))))

(assert (= (and d!18229 res!40310) b!76623))

(assert (=> d!18229 m!75383))

(declare-fun m!76431 () Bool)

(assert (=> d!18229 m!76431))

(assert (=> d!18229 m!75799))

(assert (=> b!76623 m!75607))

(assert (=> b!76623 m!75607))

(assert (=> b!76623 m!76127))

(assert (=> b!76623 m!75611))

(declare-fun m!76433 () Bool)

(assert (=> b!76623 m!76433))

(assert (=> b!76058 d!18229))

(declare-fun d!18231 () Bool)

(declare-fun e!50016 () Bool)

(assert (=> d!18231 e!50016))

(declare-fun res!40311 () Bool)

(assert (=> d!18231 (=> res!40311 e!50016)))

(declare-fun lt!34949 () Bool)

(assert (=> d!18231 (= res!40311 (not lt!34949))))

(declare-fun lt!34948 () Bool)

(assert (=> d!18231 (= lt!34949 lt!34948)))

(declare-fun lt!34947 () Unit!2179)

(declare-fun e!50017 () Unit!2179)

(assert (=> d!18231 (= lt!34947 e!50017)))

(declare-fun c!11714 () Bool)

(assert (=> d!18231 (= c!11714 lt!34948)))

(assert (=> d!18231 (= lt!34948 (containsKey!137 (toList!723 (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(assert (=> d!18231 (= (contains!726 (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) lt!34949)))

(declare-fun b!76624 () Bool)

(declare-fun lt!34946 () Unit!2179)

(assert (=> b!76624 (= e!50017 lt!34946)))

(assert (=> b!76624 (= lt!34946 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(assert (=> b!76624 (isDefined!87 (getValueByKey!133 (toList!723 (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(declare-fun b!76625 () Bool)

(declare-fun Unit!2210 () Unit!2179)

(assert (=> b!76625 (= e!50017 Unit!2210)))

(declare-fun b!76626 () Bool)

(assert (=> b!76626 (= e!50016 (isDefined!87 (getValueByKey!133 (toList!723 (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355))))))

(assert (= (and d!18231 c!11714) b!76624))

(assert (= (and d!18231 (not c!11714)) b!76625))

(assert (= (and d!18231 (not res!40311)) b!76626))

(assert (=> d!18231 m!75383))

(declare-fun m!76435 () Bool)

(assert (=> d!18231 m!76435))

(assert (=> b!76624 m!75383))

(declare-fun m!76437 () Bool)

(assert (=> b!76624 m!76437))

(assert (=> b!76624 m!75383))

(declare-fun m!76439 () Bool)

(assert (=> b!76624 m!76439))

(assert (=> b!76624 m!76439))

(declare-fun m!76441 () Bool)

(assert (=> b!76624 m!76441))

(assert (=> b!76626 m!75383))

(assert (=> b!76626 m!76439))

(assert (=> b!76626 m!76439))

(assert (=> b!76626 m!76441))

(assert (=> b!76058 d!18231))

(assert (=> b!76058 d!18199))

(declare-fun d!18233 () Bool)

(assert (=> d!18233 (= (apply!77 lt!34576 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1160 (getValueByKey!133 (toList!723 lt!34576) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3268 () Bool)

(assert (= bs!3268 d!18233))

(assert (=> bs!3268 m!75551))

(assert (=> bs!3268 m!76351))

(assert (=> bs!3268 m!76351))

(declare-fun m!76443 () Bool)

(assert (=> bs!3268 m!76443))

(assert (=> b!76139 d!18233))

(assert (=> b!76139 d!18093))

(declare-fun d!18235 () Bool)

(declare-fun res!40314 () Bool)

(declare-fun e!50019 () Bool)

(assert (=> d!18235 (=> res!40314 e!50019)))

(assert (=> d!18235 (= res!40314 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(assert (=> d!18235 (= (arrayNoDuplicates!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!11531 (Cons!1489 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) Nil!1490) Nil!1490)) e!50019)))

(declare-fun b!76627 () Bool)

(declare-fun e!50018 () Bool)

(assert (=> b!76627 (= e!50018 (contains!729 (ite c!11531 (Cons!1489 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) Nil!1490) Nil!1490) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!76628 () Bool)

(declare-fun e!50020 () Bool)

(declare-fun e!50021 () Bool)

(assert (=> b!76628 (= e!50020 e!50021)))

(declare-fun c!11715 () Bool)

(assert (=> b!76628 (= c!11715 (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!76629 () Bool)

(declare-fun call!6941 () Bool)

(assert (=> b!76629 (= e!50021 call!6941)))

(declare-fun b!76630 () Bool)

(assert (=> b!76630 (= e!50019 e!50020)))

(declare-fun res!40313 () Bool)

(assert (=> b!76630 (=> (not res!40313) (not e!50020))))

(assert (=> b!76630 (= res!40313 (not e!50018))))

(declare-fun res!40312 () Bool)

(assert (=> b!76630 (=> (not res!40312) (not e!50018))))

(assert (=> b!76630 (= res!40312 (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!76631 () Bool)

(assert (=> b!76631 (= e!50021 call!6941)))

(declare-fun bm!6938 () Bool)

(assert (=> bm!6938 (= call!6941 (arrayNoDuplicates!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!11715 (Cons!1489 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!11531 (Cons!1489 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) Nil!1490) Nil!1490)) (ite c!11531 (Cons!1489 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) Nil!1490) Nil!1490))))))

(assert (= (and d!18235 (not res!40314)) b!76630))

(assert (= (and b!76630 res!40312) b!76627))

(assert (= (and b!76630 res!40313) b!76628))

(assert (= (and b!76628 c!11715) b!76631))

(assert (= (and b!76628 (not c!11715)) b!76629))

(assert (= (or b!76631 b!76629) bm!6938))

(declare-fun m!76445 () Bool)

(assert (=> b!76627 m!76445))

(assert (=> b!76627 m!76445))

(declare-fun m!76447 () Bool)

(assert (=> b!76627 m!76447))

(assert (=> b!76628 m!76445))

(assert (=> b!76628 m!76445))

(declare-fun m!76449 () Bool)

(assert (=> b!76628 m!76449))

(assert (=> b!76630 m!76445))

(assert (=> b!76630 m!76445))

(assert (=> b!76630 m!76449))

(assert (=> bm!6938 m!76445))

(declare-fun m!76451 () Bool)

(assert (=> bm!6938 m!76451))

(assert (=> bm!6787 d!18235))

(declare-fun d!18237 () Bool)

(declare-fun res!40317 () Bool)

(declare-fun e!50023 () Bool)

(assert (=> d!18237 (=> res!40317 e!50023)))

(assert (=> d!18237 (= res!40317 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(assert (=> d!18237 (= (arrayNoDuplicates!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!11532 (Cons!1489 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000) Nil!1490) Nil!1490)) e!50023)))

(declare-fun b!76632 () Bool)

(declare-fun e!50022 () Bool)

(assert (=> b!76632 (= e!50022 (contains!729 (ite c!11532 (Cons!1489 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000) Nil!1490) Nil!1490) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!76633 () Bool)

(declare-fun e!50024 () Bool)

(declare-fun e!50025 () Bool)

(assert (=> b!76633 (= e!50024 e!50025)))

(declare-fun c!11716 () Bool)

(assert (=> b!76633 (= c!11716 (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!76634 () Bool)

(declare-fun call!6942 () Bool)

(assert (=> b!76634 (= e!50025 call!6942)))

(declare-fun b!76635 () Bool)

(assert (=> b!76635 (= e!50023 e!50024)))

(declare-fun res!40316 () Bool)

(assert (=> b!76635 (=> (not res!40316) (not e!50024))))

(assert (=> b!76635 (= res!40316 (not e!50022))))

(declare-fun res!40315 () Bool)

(assert (=> b!76635 (=> (not res!40315) (not e!50022))))

(assert (=> b!76635 (= res!40315 (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!76636 () Bool)

(assert (=> b!76636 (= e!50025 call!6942)))

(declare-fun bm!6939 () Bool)

(assert (=> bm!6939 (= call!6942 (arrayNoDuplicates!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!11716 (Cons!1489 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!11532 (Cons!1489 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000) Nil!1490) Nil!1490)) (ite c!11532 (Cons!1489 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) #b00000000000000000000000000000000) Nil!1490) Nil!1490))))))

(assert (= (and d!18237 (not res!40317)) b!76635))

(assert (= (and b!76635 res!40315) b!76632))

(assert (= (and b!76635 res!40316) b!76633))

(assert (= (and b!76633 c!11716) b!76636))

(assert (= (and b!76633 (not c!11716)) b!76634))

(assert (= (or b!76636 b!76634) bm!6939))

(assert (=> b!76632 m!76365))

(assert (=> b!76632 m!76365))

(declare-fun m!76453 () Bool)

(assert (=> b!76632 m!76453))

(assert (=> b!76633 m!76365))

(assert (=> b!76633 m!76365))

(assert (=> b!76633 m!76367))

(assert (=> b!76635 m!76365))

(assert (=> b!76635 m!76365))

(assert (=> b!76635 m!76367))

(assert (=> bm!6939 m!76365))

(declare-fun m!76455 () Bool)

(assert (=> bm!6939 m!76455))

(assert (=> bm!6788 d!18237))

(declare-fun b!76637 () Bool)

(declare-fun e!50030 () ListLongMap!1415)

(declare-fun call!6946 () ListLongMap!1415)

(assert (=> b!76637 (= e!50030 call!6946)))

(declare-fun b!76638 () Bool)

(declare-fun e!50027 () Bool)

(declare-fun lt!34955 () ListLongMap!1415)

(assert (=> b!76638 (= e!50027 (= (apply!77 lt!34955 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)) (get!1156 (select (arr!1859 (ite (or c!11567 c!11573) (_values!2229 newMap!16) lt!34516)) #b00000000000000000000000000000000) (dynLambda!329 (defaultEntry!2246 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76638 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2100 (ite (or c!11567 c!11573) (_values!2229 newMap!16) lt!34516))))))

(assert (=> b!76638 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))

(declare-fun call!6944 () ListLongMap!1415)

(declare-fun b!76639 () Bool)

(declare-fun e!50038 () ListLongMap!1415)

(assert (=> b!76639 (= e!50038 (+!97 call!6944 (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!11567 (ite c!11569 (minValue!2145 newMap!16) lt!34341) (minValue!2145 newMap!16)))))))

(declare-fun b!76640 () Bool)

(declare-fun e!50033 () Bool)

(assert (=> b!76640 (= e!50033 (validKeyInArray!0 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76641 () Bool)

(declare-fun e!50032 () Unit!2179)

(declare-fun lt!34971 () Unit!2179)

(assert (=> b!76641 (= e!50032 lt!34971)))

(declare-fun lt!34952 () ListLongMap!1415)

(assert (=> b!76641 (= lt!34952 (getCurrentListMapNoExtraKeys!61 (_keys!3903 newMap!16) (ite (or c!11567 c!11573) (_values!2229 newMap!16) lt!34516) (mask!6228 newMap!16) (ite c!11567 (ite c!11569 (extraKeys!2099 newMap!16) lt!34520) (extraKeys!2099 newMap!16)) (zeroValue!2145 newMap!16) (ite c!11567 (ite c!11569 (minValue!2145 newMap!16) lt!34341) (minValue!2145 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34969 () (_ BitVec 64))

(assert (=> b!76641 (= lt!34969 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34965 () (_ BitVec 64))

(assert (=> b!76641 (= lt!34965 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34956 () Unit!2179)

(assert (=> b!76641 (= lt!34956 (addStillContains!53 lt!34952 lt!34969 (zeroValue!2145 newMap!16) lt!34965))))

(assert (=> b!76641 (contains!726 (+!97 lt!34952 (tuple2!2139 lt!34969 (zeroValue!2145 newMap!16))) lt!34965)))

(declare-fun lt!34967 () Unit!2179)

(assert (=> b!76641 (= lt!34967 lt!34956)))

(declare-fun lt!34951 () ListLongMap!1415)

(assert (=> b!76641 (= lt!34951 (getCurrentListMapNoExtraKeys!61 (_keys!3903 newMap!16) (ite (or c!11567 c!11573) (_values!2229 newMap!16) lt!34516) (mask!6228 newMap!16) (ite c!11567 (ite c!11569 (extraKeys!2099 newMap!16) lt!34520) (extraKeys!2099 newMap!16)) (zeroValue!2145 newMap!16) (ite c!11567 (ite c!11569 (minValue!2145 newMap!16) lt!34341) (minValue!2145 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34953 () (_ BitVec 64))

(assert (=> b!76641 (= lt!34953 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34957 () (_ BitVec 64))

(assert (=> b!76641 (= lt!34957 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34970 () Unit!2179)

(assert (=> b!76641 (= lt!34970 (addApplyDifferent!53 lt!34951 lt!34953 (ite c!11567 (ite c!11569 (minValue!2145 newMap!16) lt!34341) (minValue!2145 newMap!16)) lt!34957))))

(assert (=> b!76641 (= (apply!77 (+!97 lt!34951 (tuple2!2139 lt!34953 (ite c!11567 (ite c!11569 (minValue!2145 newMap!16) lt!34341) (minValue!2145 newMap!16)))) lt!34957) (apply!77 lt!34951 lt!34957))))

(declare-fun lt!34950 () Unit!2179)

(assert (=> b!76641 (= lt!34950 lt!34970)))

(declare-fun lt!34959 () ListLongMap!1415)

(assert (=> b!76641 (= lt!34959 (getCurrentListMapNoExtraKeys!61 (_keys!3903 newMap!16) (ite (or c!11567 c!11573) (_values!2229 newMap!16) lt!34516) (mask!6228 newMap!16) (ite c!11567 (ite c!11569 (extraKeys!2099 newMap!16) lt!34520) (extraKeys!2099 newMap!16)) (zeroValue!2145 newMap!16) (ite c!11567 (ite c!11569 (minValue!2145 newMap!16) lt!34341) (minValue!2145 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34963 () (_ BitVec 64))

(assert (=> b!76641 (= lt!34963 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34968 () (_ BitVec 64))

(assert (=> b!76641 (= lt!34968 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34961 () Unit!2179)

(assert (=> b!76641 (= lt!34961 (addApplyDifferent!53 lt!34959 lt!34963 (zeroValue!2145 newMap!16) lt!34968))))

(assert (=> b!76641 (= (apply!77 (+!97 lt!34959 (tuple2!2139 lt!34963 (zeroValue!2145 newMap!16))) lt!34968) (apply!77 lt!34959 lt!34968))))

(declare-fun lt!34960 () Unit!2179)

(assert (=> b!76641 (= lt!34960 lt!34961)))

(declare-fun lt!34958 () ListLongMap!1415)

(assert (=> b!76641 (= lt!34958 (getCurrentListMapNoExtraKeys!61 (_keys!3903 newMap!16) (ite (or c!11567 c!11573) (_values!2229 newMap!16) lt!34516) (mask!6228 newMap!16) (ite c!11567 (ite c!11569 (extraKeys!2099 newMap!16) lt!34520) (extraKeys!2099 newMap!16)) (zeroValue!2145 newMap!16) (ite c!11567 (ite c!11569 (minValue!2145 newMap!16) lt!34341) (minValue!2145 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34964 () (_ BitVec 64))

(assert (=> b!76641 (= lt!34964 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34954 () (_ BitVec 64))

(assert (=> b!76641 (= lt!34954 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!76641 (= lt!34971 (addApplyDifferent!53 lt!34958 lt!34964 (ite c!11567 (ite c!11569 (minValue!2145 newMap!16) lt!34341) (minValue!2145 newMap!16)) lt!34954))))

(assert (=> b!76641 (= (apply!77 (+!97 lt!34958 (tuple2!2139 lt!34964 (ite c!11567 (ite c!11569 (minValue!2145 newMap!16) lt!34341) (minValue!2145 newMap!16)))) lt!34954) (apply!77 lt!34958 lt!34954))))

(declare-fun b!76642 () Bool)

(declare-fun e!50036 () ListLongMap!1415)

(declare-fun call!6947 () ListLongMap!1415)

(assert (=> b!76642 (= e!50036 call!6947)))

(declare-fun b!76643 () Bool)

(declare-fun Unit!2211 () Unit!2179)

(assert (=> b!76643 (= e!50032 Unit!2211)))

(declare-fun b!76644 () Bool)

(declare-fun e!50031 () Bool)

(assert (=> b!76644 (= e!50031 e!50027)))

(declare-fun res!40321 () Bool)

(assert (=> b!76644 (=> (not res!40321) (not e!50027))))

(assert (=> b!76644 (= res!40321 (contains!726 lt!34955 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!76644 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))

(declare-fun call!6948 () ListLongMap!1415)

(declare-fun bm!6941 () Bool)

(assert (=> bm!6941 (= call!6948 (getCurrentListMapNoExtraKeys!61 (_keys!3903 newMap!16) (ite (or c!11567 c!11573) (_values!2229 newMap!16) lt!34516) (mask!6228 newMap!16) (ite c!11567 (ite c!11569 (extraKeys!2099 newMap!16) lt!34520) (extraKeys!2099 newMap!16)) (zeroValue!2145 newMap!16) (ite c!11567 (ite c!11569 (minValue!2145 newMap!16) lt!34341) (minValue!2145 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun b!76645 () Bool)

(declare-fun e!50035 () Bool)

(assert (=> b!76645 (= e!50035 (validKeyInArray!0 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6942 () Bool)

(declare-fun call!6949 () Bool)

(assert (=> bm!6942 (= call!6949 (contains!726 lt!34955 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76646 () Bool)

(declare-fun e!50029 () Bool)

(declare-fun e!50034 () Bool)

(assert (=> b!76646 (= e!50029 e!50034)))

(declare-fun res!40319 () Bool)

(declare-fun call!6943 () Bool)

(assert (=> b!76646 (= res!40319 call!6943)))

(assert (=> b!76646 (=> (not res!40319) (not e!50034))))

(declare-fun c!11718 () Bool)

(declare-fun b!76647 () Bool)

(assert (=> b!76647 (= c!11718 (and (not (= (bvand (ite c!11567 (ite c!11569 (extraKeys!2099 newMap!16) lt!34520) (extraKeys!2099 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!11567 (ite c!11569 (extraKeys!2099 newMap!16) lt!34520) (extraKeys!2099 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!76647 (= e!50030 e!50036)))

(declare-fun b!76648 () Bool)

(declare-fun res!40325 () Bool)

(declare-fun e!50037 () Bool)

(assert (=> b!76648 (=> (not res!40325) (not e!50037))))

(assert (=> b!76648 (= res!40325 e!50029)))

(declare-fun c!11719 () Bool)

(assert (=> b!76648 (= c!11719 (not (= (bvand (ite c!11567 (ite c!11569 (extraKeys!2099 newMap!16) lt!34520) (extraKeys!2099 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!76649 () Bool)

(assert (=> b!76649 (= e!50038 e!50030)))

(declare-fun c!11722 () Bool)

(assert (=> b!76649 (= c!11722 (and (not (= (bvand (ite c!11567 (ite c!11569 (extraKeys!2099 newMap!16) lt!34520) (extraKeys!2099 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!11567 (ite c!11569 (extraKeys!2099 newMap!16) lt!34520) (extraKeys!2099 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!76650 () Bool)

(declare-fun e!50026 () Bool)

(declare-fun e!50028 () Bool)

(assert (=> b!76650 (= e!50026 e!50028)))

(declare-fun res!40324 () Bool)

(assert (=> b!76650 (= res!40324 call!6949)))

(assert (=> b!76650 (=> (not res!40324) (not e!50028))))

(declare-fun b!76651 () Bool)

(assert (=> b!76651 (= e!50034 (= (apply!77 lt!34955 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2145 newMap!16)))))

(declare-fun b!76652 () Bool)

(assert (=> b!76652 (= e!50028 (= (apply!77 lt!34955 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!11567 (ite c!11569 (minValue!2145 newMap!16) lt!34341) (minValue!2145 newMap!16))))))

(declare-fun b!76653 () Bool)

(assert (=> b!76653 (= e!50037 e!50026)))

(declare-fun c!11720 () Bool)

(assert (=> b!76653 (= c!11720 (not (= (bvand (ite c!11567 (ite c!11569 (extraKeys!2099 newMap!16) lt!34520) (extraKeys!2099 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6940 () Bool)

(declare-fun call!6945 () ListLongMap!1415)

(assert (=> bm!6940 (= call!6945 call!6948)))

(declare-fun d!18239 () Bool)

(assert (=> d!18239 e!50037))

(declare-fun res!40322 () Bool)

(assert (=> d!18239 (=> (not res!40322) (not e!50037))))

(assert (=> d!18239 (= res!40322 (or (bvsge #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))))

(declare-fun lt!34962 () ListLongMap!1415)

(assert (=> d!18239 (= lt!34955 lt!34962)))

(declare-fun lt!34966 () Unit!2179)

(assert (=> d!18239 (= lt!34966 e!50032)))

(declare-fun c!11717 () Bool)

(assert (=> d!18239 (= c!11717 e!50035)))

(declare-fun res!40323 () Bool)

(assert (=> d!18239 (=> (not res!40323) (not e!50035))))

(assert (=> d!18239 (= res!40323 (bvslt #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))

(assert (=> d!18239 (= lt!34962 e!50038)))

(declare-fun c!11721 () Bool)

(assert (=> d!18239 (= c!11721 (and (not (= (bvand (ite c!11567 (ite c!11569 (extraKeys!2099 newMap!16) lt!34520) (extraKeys!2099 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!11567 (ite c!11569 (extraKeys!2099 newMap!16) lt!34520) (extraKeys!2099 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18239 (validMask!0 (mask!6228 newMap!16))))

(assert (=> d!18239 (= (getCurrentListMap!415 (_keys!3903 newMap!16) (ite (or c!11567 c!11573) (_values!2229 newMap!16) lt!34516) (mask!6228 newMap!16) (ite c!11567 (ite c!11569 (extraKeys!2099 newMap!16) lt!34520) (extraKeys!2099 newMap!16)) (zeroValue!2145 newMap!16) (ite c!11567 (ite c!11569 (minValue!2145 newMap!16) lt!34341) (minValue!2145 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) lt!34955)))

(declare-fun bm!6943 () Bool)

(assert (=> bm!6943 (= call!6946 call!6944)))

(declare-fun bm!6944 () Bool)

(assert (=> bm!6944 (= call!6943 (contains!726 lt!34955 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6945 () Bool)

(assert (=> bm!6945 (= call!6947 call!6945)))

(declare-fun b!76654 () Bool)

(assert (=> b!76654 (= e!50036 call!6946)))

(declare-fun b!76655 () Bool)

(assert (=> b!76655 (= e!50029 (not call!6943))))

(declare-fun b!76656 () Bool)

(declare-fun res!40320 () Bool)

(assert (=> b!76656 (=> (not res!40320) (not e!50037))))

(assert (=> b!76656 (= res!40320 e!50031)))

(declare-fun res!40326 () Bool)

(assert (=> b!76656 (=> res!40326 e!50031)))

(assert (=> b!76656 (= res!40326 (not e!50033))))

(declare-fun res!40318 () Bool)

(assert (=> b!76656 (=> (not res!40318) (not e!50033))))

(assert (=> b!76656 (= res!40318 (bvslt #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))

(declare-fun bm!6946 () Bool)

(assert (=> bm!6946 (= call!6944 (+!97 (ite c!11721 call!6948 (ite c!11722 call!6945 call!6947)) (ite (or c!11721 c!11722) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 newMap!16)) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!11567 (ite c!11569 (minValue!2145 newMap!16) lt!34341) (minValue!2145 newMap!16))))))))

(declare-fun b!76657 () Bool)

(assert (=> b!76657 (= e!50026 (not call!6949))))

(assert (= (and d!18239 c!11721) b!76639))

(assert (= (and d!18239 (not c!11721)) b!76649))

(assert (= (and b!76649 c!11722) b!76637))

(assert (= (and b!76649 (not c!11722)) b!76647))

(assert (= (and b!76647 c!11718) b!76654))

(assert (= (and b!76647 (not c!11718)) b!76642))

(assert (= (or b!76654 b!76642) bm!6945))

(assert (= (or b!76637 bm!6945) bm!6940))

(assert (= (or b!76637 b!76654) bm!6943))

(assert (= (or b!76639 bm!6940) bm!6941))

(assert (= (or b!76639 bm!6943) bm!6946))

(assert (= (and d!18239 res!40323) b!76645))

(assert (= (and d!18239 c!11717) b!76641))

(assert (= (and d!18239 (not c!11717)) b!76643))

(assert (= (and d!18239 res!40322) b!76656))

(assert (= (and b!76656 res!40318) b!76640))

(assert (= (and b!76656 (not res!40326)) b!76644))

(assert (= (and b!76644 res!40321) b!76638))

(assert (= (and b!76656 res!40320) b!76648))

(assert (= (and b!76648 c!11719) b!76646))

(assert (= (and b!76648 (not c!11719)) b!76655))

(assert (= (and b!76646 res!40319) b!76651))

(assert (= (or b!76646 b!76655) bm!6944))

(assert (= (and b!76648 res!40325) b!76653))

(assert (= (and b!76653 c!11720) b!76650))

(assert (= (and b!76653 (not c!11720)) b!76657))

(assert (= (and b!76650 res!40324) b!76652))

(assert (= (or b!76650 b!76657) bm!6942))

(declare-fun b_lambda!3425 () Bool)

(assert (=> (not b_lambda!3425) (not b!76638)))

(assert (=> b!76638 t!5093))

(declare-fun b_and!4673 () Bool)

(assert (= b_and!4669 (and (=> t!5093 result!2741) b_and!4673)))

(assert (=> b!76638 t!5095))

(declare-fun b_and!4675 () Bool)

(assert (= b_and!4671 (and (=> t!5095 result!2743) b_and!4675)))

(declare-fun m!76457 () Bool)

(assert (=> bm!6941 m!76457))

(assert (=> b!76645 m!76149))

(assert (=> b!76645 m!76149))

(assert (=> b!76645 m!76163))

(assert (=> b!76640 m!76149))

(assert (=> b!76640 m!76149))

(assert (=> b!76640 m!76163))

(assert (=> d!18239 m!75799))

(declare-fun m!76459 () Bool)

(assert (=> b!76651 m!76459))

(declare-fun m!76461 () Bool)

(assert (=> b!76639 m!76461))

(declare-fun m!76463 () Bool)

(assert (=> bm!6946 m!76463))

(declare-fun m!76465 () Bool)

(assert (=> b!76638 m!76465))

(assert (=> b!76638 m!76173))

(declare-fun m!76467 () Bool)

(assert (=> b!76638 m!76467))

(assert (=> b!76638 m!76173))

(assert (=> b!76638 m!76149))

(declare-fun m!76469 () Bool)

(assert (=> b!76638 m!76469))

(assert (=> b!76638 m!76149))

(assert (=> b!76638 m!76465))

(declare-fun m!76471 () Bool)

(assert (=> bm!6944 m!76471))

(declare-fun m!76473 () Bool)

(assert (=> b!76652 m!76473))

(declare-fun m!76475 () Bool)

(assert (=> b!76641 m!76475))

(declare-fun m!76477 () Bool)

(assert (=> b!76641 m!76477))

(declare-fun m!76479 () Bool)

(assert (=> b!76641 m!76479))

(assert (=> b!76641 m!76475))

(declare-fun m!76481 () Bool)

(assert (=> b!76641 m!76481))

(declare-fun m!76483 () Bool)

(assert (=> b!76641 m!76483))

(declare-fun m!76485 () Bool)

(assert (=> b!76641 m!76485))

(declare-fun m!76487 () Bool)

(assert (=> b!76641 m!76487))

(assert (=> b!76641 m!76477))

(declare-fun m!76489 () Bool)

(assert (=> b!76641 m!76489))

(declare-fun m!76491 () Bool)

(assert (=> b!76641 m!76491))

(declare-fun m!76493 () Bool)

(assert (=> b!76641 m!76493))

(declare-fun m!76495 () Bool)

(assert (=> b!76641 m!76495))

(declare-fun m!76497 () Bool)

(assert (=> b!76641 m!76497))

(assert (=> b!76641 m!76457))

(declare-fun m!76499 () Bool)

(assert (=> b!76641 m!76499))

(assert (=> b!76641 m!76491))

(declare-fun m!76501 () Bool)

(assert (=> b!76641 m!76501))

(assert (=> b!76641 m!76483))

(assert (=> b!76641 m!76149))

(declare-fun m!76503 () Bool)

(assert (=> b!76641 m!76503))

(assert (=> b!76644 m!76149))

(assert (=> b!76644 m!76149))

(declare-fun m!76505 () Bool)

(assert (=> b!76644 m!76505))

(declare-fun m!76507 () Bool)

(assert (=> bm!6942 m!76507))

(assert (=> bm!6851 d!18239))

(assert (=> b!75965 d!18165))

(assert (=> b!76067 d!18069))

(declare-fun d!18241 () Bool)

(declare-fun res!40327 () Bool)

(declare-fun e!50039 () Bool)

(assert (=> d!18241 (=> res!40327 e!50039)))

(assert (=> d!18241 (= res!40327 (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(assert (=> d!18241 (= (arrayContainsKey!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!50039)))

(declare-fun b!76658 () Bool)

(declare-fun e!50040 () Bool)

(assert (=> b!76658 (= e!50039 e!50040)))

(declare-fun res!40328 () Bool)

(assert (=> b!76658 (=> (not res!40328) (not e!50040))))

(assert (=> b!76658 (= res!40328 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2099 (_keys!3903 (v!2552 (underlying!262 thiss!992))))))))

(declare-fun b!76659 () Bool)

(assert (=> b!76659 (= e!50040 (arrayContainsKey!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!18241 (not res!40327)) b!76658))

(assert (= (and b!76658 res!40328) b!76659))

(assert (=> d!18241 m!76261))

(assert (=> b!76659 m!75383))

(declare-fun m!76509 () Bool)

(assert (=> b!76659 m!76509))

(assert (=> b!75931 d!18241))

(declare-fun d!18243 () Bool)

(assert (=> d!18243 (= (apply!77 lt!34576 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1160 (getValueByKey!133 (toList!723 lt!34576) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3269 () Bool)

(assert (= bs!3269 d!18243))

(assert (=> bs!3269 m!75855))

(assert (=> bs!3269 m!75855))

(declare-fun m!76511 () Bool)

(assert (=> bs!3269 m!76511))

(assert (=> b!76153 d!18243))

(assert (=> d!18049 d!18061))

(declare-fun d!18245 () Bool)

(declare-fun res!40331 () Bool)

(declare-fun e!50042 () Bool)

(assert (=> d!18245 (=> res!40331 e!50042)))

(assert (=> d!18245 (= res!40331 (bvsge #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))

(assert (=> d!18245 (= (arrayNoDuplicates!0 (_keys!3903 newMap!16) #b00000000000000000000000000000000 Nil!1490) e!50042)))

(declare-fun b!76660 () Bool)

(declare-fun e!50041 () Bool)

(assert (=> b!76660 (= e!50041 (contains!729 Nil!1490 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76661 () Bool)

(declare-fun e!50043 () Bool)

(declare-fun e!50044 () Bool)

(assert (=> b!76661 (= e!50043 e!50044)))

(declare-fun c!11723 () Bool)

(assert (=> b!76661 (= c!11723 (validKeyInArray!0 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76662 () Bool)

(declare-fun call!6950 () Bool)

(assert (=> b!76662 (= e!50044 call!6950)))

(declare-fun b!76663 () Bool)

(assert (=> b!76663 (= e!50042 e!50043)))

(declare-fun res!40330 () Bool)

(assert (=> b!76663 (=> (not res!40330) (not e!50043))))

(assert (=> b!76663 (= res!40330 (not e!50041))))

(declare-fun res!40329 () Bool)

(assert (=> b!76663 (=> (not res!40329) (not e!50041))))

(assert (=> b!76663 (= res!40329 (validKeyInArray!0 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76664 () Bool)

(assert (=> b!76664 (= e!50044 call!6950)))

(declare-fun bm!6947 () Bool)

(assert (=> bm!6947 (= call!6950 (arrayNoDuplicates!0 (_keys!3903 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!11723 (Cons!1489 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000) Nil!1490) Nil!1490)))))

(assert (= (and d!18245 (not res!40331)) b!76663))

(assert (= (and b!76663 res!40329) b!76660))

(assert (= (and b!76663 res!40330) b!76661))

(assert (= (and b!76661 c!11723) b!76664))

(assert (= (and b!76661 (not c!11723)) b!76662))

(assert (= (or b!76664 b!76662) bm!6947))

(assert (=> b!76660 m!76149))

(assert (=> b!76660 m!76149))

(declare-fun m!76513 () Bool)

(assert (=> b!76660 m!76513))

(assert (=> b!76661 m!76149))

(assert (=> b!76661 m!76149))

(assert (=> b!76661 m!76163))

(assert (=> b!76663 m!76149))

(assert (=> b!76663 m!76149))

(assert (=> b!76663 m!76163))

(assert (=> bm!6947 m!76149))

(declare-fun m!76515 () Bool)

(assert (=> bm!6947 m!76515))

(assert (=> b!75961 d!18245))

(declare-fun d!18247 () Bool)

(declare-fun e!50045 () Bool)

(assert (=> d!18247 e!50045))

(declare-fun res!40333 () Bool)

(assert (=> d!18247 (=> (not res!40333) (not e!50045))))

(declare-fun lt!34974 () ListLongMap!1415)

(assert (=> d!18247 (= res!40333 (contains!726 lt!34974 (_1!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(declare-fun lt!34973 () List!1494)

(assert (=> d!18247 (= lt!34974 (ListLongMap!1416 lt!34973))))

(declare-fun lt!34972 () Unit!2179)

(declare-fun lt!34975 () Unit!2179)

(assert (=> d!18247 (= lt!34972 lt!34975)))

(assert (=> d!18247 (= (getValueByKey!133 lt!34973 (_1!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))) (Some!138 (_2!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18247 (= lt!34975 (lemmaContainsTupThenGetReturnValue!53 lt!34973 (_1!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) (_2!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18247 (= lt!34973 (insertStrictlySorted!56 (toList!723 (+!97 lt!34345 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))) (_1!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) (_2!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18247 (= (+!97 (+!97 lt!34345 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34974)))

(declare-fun b!76665 () Bool)

(declare-fun res!40332 () Bool)

(assert (=> b!76665 (=> (not res!40332) (not e!50045))))

(assert (=> b!76665 (= res!40332 (= (getValueByKey!133 (toList!723 lt!34974) (_1!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))) (Some!138 (_2!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))))))))

(declare-fun b!76666 () Bool)

(assert (=> b!76666 (= e!50045 (contains!730 (toList!723 lt!34974) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))))))

(assert (= (and d!18247 res!40333) b!76665))

(assert (= (and b!76665 res!40332) b!76666))

(declare-fun m!76517 () Bool)

(assert (=> d!18247 m!76517))

(declare-fun m!76519 () Bool)

(assert (=> d!18247 m!76519))

(declare-fun m!76521 () Bool)

(assert (=> d!18247 m!76521))

(declare-fun m!76523 () Bool)

(assert (=> d!18247 m!76523))

(declare-fun m!76525 () Bool)

(assert (=> b!76665 m!76525))

(declare-fun m!76527 () Bool)

(assert (=> b!76666 m!76527))

(assert (=> d!18065 d!18247))

(declare-fun d!18249 () Bool)

(declare-fun e!50046 () Bool)

(assert (=> d!18249 e!50046))

(declare-fun res!40335 () Bool)

(assert (=> d!18249 (=> (not res!40335) (not e!50046))))

(declare-fun lt!34978 () ListLongMap!1415)

(assert (=> d!18249 (= res!40335 (contains!726 lt!34978 (_1!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(declare-fun lt!34977 () List!1494)

(assert (=> d!18249 (= lt!34978 (ListLongMap!1416 lt!34977))))

(declare-fun lt!34976 () Unit!2179)

(declare-fun lt!34979 () Unit!2179)

(assert (=> d!18249 (= lt!34976 lt!34979)))

(assert (=> d!18249 (= (getValueByKey!133 lt!34977 (_1!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))) (Some!138 (_2!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18249 (= lt!34979 (lemmaContainsTupThenGetReturnValue!53 lt!34977 (_1!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) (_2!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18249 (= lt!34977 (insertStrictlySorted!56 (toList!723 lt!34345) (_1!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) (_2!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))))))

(assert (=> d!18249 (= (+!97 lt!34345 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) lt!34978)))

(declare-fun b!76667 () Bool)

(declare-fun res!40334 () Bool)

(assert (=> b!76667 (=> (not res!40334) (not e!50046))))

(assert (=> b!76667 (= res!40334 (= (getValueByKey!133 (toList!723 lt!34978) (_1!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))) (Some!138 (_2!1080 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))))))))

(declare-fun b!76668 () Bool)

(assert (=> b!76668 (= e!50046 (contains!730 (toList!723 lt!34978) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))))))

(assert (= (and d!18249 res!40335) b!76667))

(assert (= (and b!76667 res!40334) b!76668))

(declare-fun m!76529 () Bool)

(assert (=> d!18249 m!76529))

(declare-fun m!76531 () Bool)

(assert (=> d!18249 m!76531))

(declare-fun m!76533 () Bool)

(assert (=> d!18249 m!76533))

(declare-fun m!76535 () Bool)

(assert (=> d!18249 m!76535))

(declare-fun m!76537 () Bool)

(assert (=> b!76667 m!76537))

(declare-fun m!76539 () Bool)

(assert (=> b!76668 m!76539))

(assert (=> d!18065 d!18249))

(declare-fun d!18251 () Bool)

(assert (=> d!18251 (= (+!97 (+!97 lt!34345 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) (+!97 (+!97 lt!34345 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)))))

(assert (=> d!18251 true))

(declare-fun _$28!127 () Unit!2179)

(assert (=> d!18251 (= (choose!446 lt!34345 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))) _$28!127)))

(declare-fun bs!3270 () Bool)

(assert (= bs!3270 d!18251))

(assert (=> bs!3270 m!75771))

(assert (=> bs!3270 m!75771))

(assert (=> bs!3270 m!75777))

(assert (=> bs!3270 m!75769))

(assert (=> bs!3270 m!75769))

(assert (=> bs!3270 m!75773))

(assert (=> d!18065 d!18251))

(declare-fun d!18253 () Bool)

(declare-fun e!50047 () Bool)

(assert (=> d!18253 e!50047))

(declare-fun res!40337 () Bool)

(assert (=> d!18253 (=> (not res!40337) (not e!50047))))

(declare-fun lt!34982 () ListLongMap!1415)

(assert (=> d!18253 (= res!40337 (contains!726 lt!34982 (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))

(declare-fun lt!34981 () List!1494)

(assert (=> d!18253 (= lt!34982 (ListLongMap!1416 lt!34981))))

(declare-fun lt!34980 () Unit!2179)

(declare-fun lt!34983 () Unit!2179)

(assert (=> d!18253 (= lt!34980 lt!34983)))

(assert (=> d!18253 (= (getValueByKey!133 lt!34981 (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))) (Some!138 (_2!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))

(assert (=> d!18253 (= lt!34983 (lemmaContainsTupThenGetReturnValue!53 lt!34981 (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)) (_2!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))

(assert (=> d!18253 (= lt!34981 (insertStrictlySorted!56 (toList!723 (+!97 lt!34345 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992)))))) (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)) (_2!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))

(assert (=> d!18253 (= (+!97 (+!97 lt!34345 (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2552 (underlying!262 thiss!992))))) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)) lt!34982)))

(declare-fun b!76669 () Bool)

(declare-fun res!40336 () Bool)

(assert (=> b!76669 (=> (not res!40336) (not e!50047))))

(assert (=> b!76669 (= res!40336 (= (getValueByKey!133 (toList!723 lt!34982) (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))) (Some!138 (_2!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)))))))

(declare-fun b!76670 () Bool)

(assert (=> b!76670 (= e!50047 (contains!730 (toList!723 lt!34982) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)))))

(assert (= (and d!18253 res!40337) b!76669))

(assert (= (and b!76669 res!40336) b!76670))

(declare-fun m!76541 () Bool)

(assert (=> d!18253 m!76541))

(declare-fun m!76543 () Bool)

(assert (=> d!18253 m!76543))

(declare-fun m!76545 () Bool)

(assert (=> d!18253 m!76545))

(declare-fun m!76547 () Bool)

(assert (=> d!18253 m!76547))

(declare-fun m!76549 () Bool)

(assert (=> b!76669 m!76549))

(declare-fun m!76551 () Bool)

(assert (=> b!76670 m!76551))

(assert (=> d!18065 d!18253))

(declare-fun d!18255 () Bool)

(declare-fun e!50048 () Bool)

(assert (=> d!18255 e!50048))

(declare-fun res!40339 () Bool)

(assert (=> d!18255 (=> (not res!40339) (not e!50048))))

(declare-fun lt!34986 () ListLongMap!1415)

(assert (=> d!18255 (= res!40339 (contains!726 lt!34986 (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))

(declare-fun lt!34985 () List!1494)

(assert (=> d!18255 (= lt!34986 (ListLongMap!1416 lt!34985))))

(declare-fun lt!34984 () Unit!2179)

(declare-fun lt!34987 () Unit!2179)

(assert (=> d!18255 (= lt!34984 lt!34987)))

(assert (=> d!18255 (= (getValueByKey!133 lt!34985 (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))) (Some!138 (_2!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))

(assert (=> d!18255 (= lt!34987 (lemmaContainsTupThenGetReturnValue!53 lt!34985 (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)) (_2!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))

(assert (=> d!18255 (= lt!34985 (insertStrictlySorted!56 (toList!723 lt!34345) (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)) (_2!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))))))

(assert (=> d!18255 (= (+!97 lt!34345 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)) lt!34986)))

(declare-fun b!76671 () Bool)

(declare-fun res!40338 () Bool)

(assert (=> b!76671 (=> (not res!40338) (not e!50048))))

(assert (=> b!76671 (= res!40338 (= (getValueByKey!133 (toList!723 lt!34986) (_1!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341))) (Some!138 (_2!1080 (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)))))))

(declare-fun b!76672 () Bool)

(assert (=> b!76672 (= e!50048 (contains!730 (toList!723 lt!34986) (tuple2!2139 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) lt!34341)))))

(assert (= (and d!18255 res!40339) b!76671))

(assert (= (and b!76671 res!40338) b!76672))

(declare-fun m!76553 () Bool)

(assert (=> d!18255 m!76553))

(declare-fun m!76555 () Bool)

(assert (=> d!18255 m!76555))

(declare-fun m!76557 () Bool)

(assert (=> d!18255 m!76557))

(declare-fun m!76559 () Bool)

(assert (=> d!18255 m!76559))

(declare-fun m!76561 () Bool)

(assert (=> b!76671 m!76561))

(declare-fun m!76563 () Bool)

(assert (=> b!76672 m!76563))

(assert (=> d!18065 d!18255))

(declare-fun d!18257 () Bool)

(assert (=> d!18257 (= (validKeyInArray!0 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355)) (and (not (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75951 d!18257))

(declare-fun d!18259 () Bool)

(declare-fun lt!34988 () Bool)

(assert (=> d!18259 (= lt!34988 (select (content!82 (toList!723 lt!34632)) lt!34352))))

(declare-fun e!50049 () Bool)

(assert (=> d!18259 (= lt!34988 e!50049)))

(declare-fun res!40340 () Bool)

(assert (=> d!18259 (=> (not res!40340) (not e!50049))))

(assert (=> d!18259 (= res!40340 ((_ is Cons!1490) (toList!723 lt!34632)))))

(assert (=> d!18259 (= (contains!730 (toList!723 lt!34632) lt!34352) lt!34988)))

(declare-fun b!76673 () Bool)

(declare-fun e!50050 () Bool)

(assert (=> b!76673 (= e!50049 e!50050)))

(declare-fun res!40341 () Bool)

(assert (=> b!76673 (=> res!40341 e!50050)))

(assert (=> b!76673 (= res!40341 (= (h!2078 (toList!723 lt!34632)) lt!34352))))

(declare-fun b!76674 () Bool)

(assert (=> b!76674 (= e!50050 (contains!730 (t!5079 (toList!723 lt!34632)) lt!34352))))

(assert (= (and d!18259 res!40340) b!76673))

(assert (= (and b!76673 (not res!40341)) b!76674))

(declare-fun m!76565 () Bool)

(assert (=> d!18259 m!76565))

(declare-fun m!76567 () Bool)

(assert (=> d!18259 m!76567))

(declare-fun m!76569 () Bool)

(assert (=> b!76674 m!76569))

(assert (=> b!76210 d!18259))

(declare-fun d!18261 () Bool)

(declare-fun e!50051 () Bool)

(assert (=> d!18261 e!50051))

(declare-fun res!40342 () Bool)

(assert (=> d!18261 (=> res!40342 e!50051)))

(declare-fun lt!34992 () Bool)

(assert (=> d!18261 (= res!40342 (not lt!34992))))

(declare-fun lt!34991 () Bool)

(assert (=> d!18261 (= lt!34992 lt!34991)))

(declare-fun lt!34990 () Unit!2179)

(declare-fun e!50052 () Unit!2179)

(assert (=> d!18261 (= lt!34990 e!50052)))

(declare-fun c!11724 () Bool)

(assert (=> d!18261 (= c!11724 lt!34991)))

(assert (=> d!18261 (= lt!34991 (containsKey!137 (toList!723 lt!34636) (_1!1080 lt!34342)))))

(assert (=> d!18261 (= (contains!726 lt!34636 (_1!1080 lt!34342)) lt!34992)))

(declare-fun b!76675 () Bool)

(declare-fun lt!34989 () Unit!2179)

(assert (=> b!76675 (= e!50052 lt!34989)))

(assert (=> b!76675 (= lt!34989 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 lt!34636) (_1!1080 lt!34342)))))

(assert (=> b!76675 (isDefined!87 (getValueByKey!133 (toList!723 lt!34636) (_1!1080 lt!34342)))))

(declare-fun b!76676 () Bool)

(declare-fun Unit!2212 () Unit!2179)

(assert (=> b!76676 (= e!50052 Unit!2212)))

(declare-fun b!76677 () Bool)

(assert (=> b!76677 (= e!50051 (isDefined!87 (getValueByKey!133 (toList!723 lt!34636) (_1!1080 lt!34342))))))

(assert (= (and d!18261 c!11724) b!76675))

(assert (= (and d!18261 (not c!11724)) b!76676))

(assert (= (and d!18261 (not res!40342)) b!76677))

(declare-fun m!76571 () Bool)

(assert (=> d!18261 m!76571))

(declare-fun m!76573 () Bool)

(assert (=> b!76675 m!76573))

(assert (=> b!76675 m!75765))

(assert (=> b!76675 m!75765))

(declare-fun m!76575 () Bool)

(assert (=> b!76675 m!76575))

(assert (=> b!76677 m!75765))

(assert (=> b!76677 m!75765))

(assert (=> b!76677 m!76575))

(assert (=> d!18063 d!18261))

(declare-fun b!76680 () Bool)

(declare-fun e!50054 () Option!139)

(assert (=> b!76680 (= e!50054 (getValueByKey!133 (t!5079 lt!34635) (_1!1080 lt!34342)))))

(declare-fun b!76681 () Bool)

(assert (=> b!76681 (= e!50054 None!137)))

(declare-fun b!76679 () Bool)

(declare-fun e!50053 () Option!139)

(assert (=> b!76679 (= e!50053 e!50054)))

(declare-fun c!11726 () Bool)

(assert (=> b!76679 (= c!11726 (and ((_ is Cons!1490) lt!34635) (not (= (_1!1080 (h!2078 lt!34635)) (_1!1080 lt!34342)))))))

(declare-fun b!76678 () Bool)

(assert (=> b!76678 (= e!50053 (Some!138 (_2!1080 (h!2078 lt!34635))))))

(declare-fun d!18263 () Bool)

(declare-fun c!11725 () Bool)

(assert (=> d!18263 (= c!11725 (and ((_ is Cons!1490) lt!34635) (= (_1!1080 (h!2078 lt!34635)) (_1!1080 lt!34342))))))

(assert (=> d!18263 (= (getValueByKey!133 lt!34635 (_1!1080 lt!34342)) e!50053)))

(assert (= (and d!18263 c!11725) b!76678))

(assert (= (and d!18263 (not c!11725)) b!76679))

(assert (= (and b!76679 c!11726) b!76680))

(assert (= (and b!76679 (not c!11726)) b!76681))

(declare-fun m!76577 () Bool)

(assert (=> b!76680 m!76577))

(assert (=> d!18063 d!18263))

(declare-fun d!18265 () Bool)

(assert (=> d!18265 (= (getValueByKey!133 lt!34635 (_1!1080 lt!34342)) (Some!138 (_2!1080 lt!34342)))))

(declare-fun lt!34993 () Unit!2179)

(assert (=> d!18265 (= lt!34993 (choose!447 lt!34635 (_1!1080 lt!34342) (_2!1080 lt!34342)))))

(declare-fun e!50055 () Bool)

(assert (=> d!18265 e!50055))

(declare-fun res!40343 () Bool)

(assert (=> d!18265 (=> (not res!40343) (not e!50055))))

(assert (=> d!18265 (= res!40343 (isStrictlySorted!289 lt!34635))))

(assert (=> d!18265 (= (lemmaContainsTupThenGetReturnValue!53 lt!34635 (_1!1080 lt!34342) (_2!1080 lt!34342)) lt!34993)))

(declare-fun b!76682 () Bool)

(declare-fun res!40344 () Bool)

(assert (=> b!76682 (=> (not res!40344) (not e!50055))))

(assert (=> b!76682 (= res!40344 (containsKey!137 lt!34635 (_1!1080 lt!34342)))))

(declare-fun b!76683 () Bool)

(assert (=> b!76683 (= e!50055 (contains!730 lt!34635 (tuple2!2139 (_1!1080 lt!34342) (_2!1080 lt!34342))))))

(assert (= (and d!18265 res!40343) b!76682))

(assert (= (and b!76682 res!40344) b!76683))

(assert (=> d!18265 m!75759))

(declare-fun m!76579 () Bool)

(assert (=> d!18265 m!76579))

(declare-fun m!76581 () Bool)

(assert (=> d!18265 m!76581))

(declare-fun m!76583 () Bool)

(assert (=> b!76682 m!76583))

(declare-fun m!76585 () Bool)

(assert (=> b!76683 m!76585))

(assert (=> d!18063 d!18265))

(declare-fun e!50060 () List!1494)

(declare-fun b!76684 () Bool)

(declare-fun c!11727 () Bool)

(declare-fun c!11730 () Bool)

(assert (=> b!76684 (= e!50060 (ite c!11727 (t!5079 (toList!723 (+!97 lt!34345 lt!34352))) (ite c!11730 (Cons!1490 (h!2078 (toList!723 (+!97 lt!34345 lt!34352))) (t!5079 (toList!723 (+!97 lt!34345 lt!34352)))) Nil!1491)))))

(declare-fun d!18267 () Bool)

(declare-fun e!50059 () Bool)

(assert (=> d!18267 e!50059))

(declare-fun res!40346 () Bool)

(assert (=> d!18267 (=> (not res!40346) (not e!50059))))

(declare-fun lt!34994 () List!1494)

(assert (=> d!18267 (= res!40346 (isStrictlySorted!289 lt!34994))))

(declare-fun e!50058 () List!1494)

(assert (=> d!18267 (= lt!34994 e!50058)))

(declare-fun c!11729 () Bool)

(assert (=> d!18267 (= c!11729 (and ((_ is Cons!1490) (toList!723 (+!97 lt!34345 lt!34352))) (bvslt (_1!1080 (h!2078 (toList!723 (+!97 lt!34345 lt!34352)))) (_1!1080 lt!34342))))))

(assert (=> d!18267 (isStrictlySorted!289 (toList!723 (+!97 lt!34345 lt!34352)))))

(assert (=> d!18267 (= (insertStrictlySorted!56 (toList!723 (+!97 lt!34345 lt!34352)) (_1!1080 lt!34342) (_2!1080 lt!34342)) lt!34994)))

(declare-fun b!76685 () Bool)

(assert (=> b!76685 (= e!50060 (insertStrictlySorted!56 (t!5079 (toList!723 (+!97 lt!34345 lt!34352))) (_1!1080 lt!34342) (_2!1080 lt!34342)))))

(declare-fun call!6952 () List!1494)

(declare-fun bm!6948 () Bool)

(assert (=> bm!6948 (= call!6952 ($colon$colon!67 e!50060 (ite c!11729 (h!2078 (toList!723 (+!97 lt!34345 lt!34352))) (tuple2!2139 (_1!1080 lt!34342) (_2!1080 lt!34342)))))))

(declare-fun c!11728 () Bool)

(assert (=> bm!6948 (= c!11728 c!11729)))

(declare-fun bm!6949 () Bool)

(declare-fun call!6953 () List!1494)

(declare-fun call!6951 () List!1494)

(assert (=> bm!6949 (= call!6953 call!6951)))

(declare-fun b!76686 () Bool)

(declare-fun e!50057 () List!1494)

(assert (=> b!76686 (= e!50057 call!6951)))

(declare-fun b!76687 () Bool)

(assert (=> b!76687 (= e!50059 (contains!730 lt!34994 (tuple2!2139 (_1!1080 lt!34342) (_2!1080 lt!34342))))))

(declare-fun bm!6950 () Bool)

(assert (=> bm!6950 (= call!6951 call!6952)))

(declare-fun b!76688 () Bool)

(assert (=> b!76688 (= e!50058 e!50057)))

(assert (=> b!76688 (= c!11727 (and ((_ is Cons!1490) (toList!723 (+!97 lt!34345 lt!34352))) (= (_1!1080 (h!2078 (toList!723 (+!97 lt!34345 lt!34352)))) (_1!1080 lt!34342))))))

(declare-fun b!76689 () Bool)

(declare-fun res!40345 () Bool)

(assert (=> b!76689 (=> (not res!40345) (not e!50059))))

(assert (=> b!76689 (= res!40345 (containsKey!137 lt!34994 (_1!1080 lt!34342)))))

(declare-fun b!76690 () Bool)

(declare-fun e!50056 () List!1494)

(assert (=> b!76690 (= e!50056 call!6953)))

(declare-fun b!76691 () Bool)

(assert (=> b!76691 (= c!11730 (and ((_ is Cons!1490) (toList!723 (+!97 lt!34345 lt!34352))) (bvsgt (_1!1080 (h!2078 (toList!723 (+!97 lt!34345 lt!34352)))) (_1!1080 lt!34342))))))

(assert (=> b!76691 (= e!50057 e!50056)))

(declare-fun b!76692 () Bool)

(assert (=> b!76692 (= e!50056 call!6953)))

(declare-fun b!76693 () Bool)

(assert (=> b!76693 (= e!50058 call!6952)))

(assert (= (and d!18267 c!11729) b!76693))

(assert (= (and d!18267 (not c!11729)) b!76688))

(assert (= (and b!76688 c!11727) b!76686))

(assert (= (and b!76688 (not c!11727)) b!76691))

(assert (= (and b!76691 c!11730) b!76690))

(assert (= (and b!76691 (not c!11730)) b!76692))

(assert (= (or b!76690 b!76692) bm!6949))

(assert (= (or b!76686 bm!6949) bm!6950))

(assert (= (or b!76693 bm!6950) bm!6948))

(assert (= (and bm!6948 c!11728) b!76685))

(assert (= (and bm!6948 (not c!11728)) b!76684))

(assert (= (and d!18267 res!40346) b!76689))

(assert (= (and b!76689 res!40345) b!76687))

(declare-fun m!76587 () Bool)

(assert (=> b!76685 m!76587))

(declare-fun m!76589 () Bool)

(assert (=> b!76689 m!76589))

(declare-fun m!76591 () Bool)

(assert (=> d!18267 m!76591))

(declare-fun m!76593 () Bool)

(assert (=> d!18267 m!76593))

(declare-fun m!76595 () Bool)

(assert (=> bm!6948 m!76595))

(declare-fun m!76597 () Bool)

(assert (=> b!76687 m!76597))

(assert (=> d!18063 d!18267))

(declare-fun d!18269 () Bool)

(assert (=> d!18269 (= (get!1158 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) from!355) (dynLambda!329 (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2551 (select (arr!1859 (_values!2229 (v!2552 (underlying!262 thiss!992)))) from!355)))))

(assert (=> b!76163 d!18269))

(assert (=> b!75949 d!18257))

(assert (=> b!76095 d!18199))

(assert (=> b!75963 d!18165))

(declare-fun d!18271 () Bool)

(declare-fun lt!34995 () Bool)

(assert (=> d!18271 (= lt!34995 (select (content!82 (toList!723 lt!34628)) lt!34342))))

(declare-fun e!50061 () Bool)

(assert (=> d!18271 (= lt!34995 e!50061)))

(declare-fun res!40347 () Bool)

(assert (=> d!18271 (=> (not res!40347) (not e!50061))))

(assert (=> d!18271 (= res!40347 ((_ is Cons!1490) (toList!723 lt!34628)))))

(assert (=> d!18271 (= (contains!730 (toList!723 lt!34628) lt!34342) lt!34995)))

(declare-fun b!76694 () Bool)

(declare-fun e!50062 () Bool)

(assert (=> b!76694 (= e!50061 e!50062)))

(declare-fun res!40348 () Bool)

(assert (=> b!76694 (=> res!40348 e!50062)))

(assert (=> b!76694 (= res!40348 (= (h!2078 (toList!723 lt!34628)) lt!34342))))

(declare-fun b!76695 () Bool)

(assert (=> b!76695 (= e!50062 (contains!730 (t!5079 (toList!723 lt!34628)) lt!34342))))

(assert (= (and d!18271 res!40347) b!76694))

(assert (= (and b!76694 (not res!40348)) b!76695))

(declare-fun m!76599 () Bool)

(assert (=> d!18271 m!76599))

(declare-fun m!76601 () Bool)

(assert (=> d!18271 m!76601))

(declare-fun m!76603 () Bool)

(assert (=> b!76695 m!76603))

(assert (=> b!76208 d!18271))

(declare-fun d!18273 () Bool)

(declare-fun e!50063 () Bool)

(assert (=> d!18273 e!50063))

(declare-fun res!40349 () Bool)

(assert (=> d!18273 (=> res!40349 e!50063)))

(declare-fun lt!34999 () Bool)

(assert (=> d!18273 (= res!40349 (not lt!34999))))

(declare-fun lt!34998 () Bool)

(assert (=> d!18273 (= lt!34999 lt!34998)))

(declare-fun lt!34997 () Unit!2179)

(declare-fun e!50064 () Unit!2179)

(assert (=> d!18273 (= lt!34997 e!50064)))

(declare-fun c!11731 () Bool)

(assert (=> d!18273 (= c!11731 lt!34998)))

(assert (=> d!18273 (= lt!34998 (containsKey!137 (toList!723 call!6842) (ite c!11573 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (select (arr!1858 (_keys!3903 newMap!16)) (index!3098 lt!34514)))))))

(assert (=> d!18273 (= (contains!726 call!6842 (ite c!11573 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (select (arr!1858 (_keys!3903 newMap!16)) (index!3098 lt!34514)))) lt!34999)))

(declare-fun b!76696 () Bool)

(declare-fun lt!34996 () Unit!2179)

(assert (=> b!76696 (= e!50064 lt!34996)))

(assert (=> b!76696 (= lt!34996 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 call!6842) (ite c!11573 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (select (arr!1858 (_keys!3903 newMap!16)) (index!3098 lt!34514)))))))

(assert (=> b!76696 (isDefined!87 (getValueByKey!133 (toList!723 call!6842) (ite c!11573 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (select (arr!1858 (_keys!3903 newMap!16)) (index!3098 lt!34514)))))))

(declare-fun b!76697 () Bool)

(declare-fun Unit!2213 () Unit!2179)

(assert (=> b!76697 (= e!50064 Unit!2213)))

(declare-fun b!76698 () Bool)

(assert (=> b!76698 (= e!50063 (isDefined!87 (getValueByKey!133 (toList!723 call!6842) (ite c!11573 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (select (arr!1858 (_keys!3903 newMap!16)) (index!3098 lt!34514))))))))

(assert (= (and d!18273 c!11731) b!76696))

(assert (= (and d!18273 (not c!11731)) b!76697))

(assert (= (and d!18273 (not res!40349)) b!76698))

(declare-fun m!76605 () Bool)

(assert (=> d!18273 m!76605))

(declare-fun m!76607 () Bool)

(assert (=> b!76696 m!76607))

(declare-fun m!76609 () Bool)

(assert (=> b!76696 m!76609))

(assert (=> b!76696 m!76609))

(declare-fun m!76611 () Bool)

(assert (=> b!76696 m!76611))

(assert (=> b!76698 m!76609))

(assert (=> b!76698 m!76609))

(assert (=> b!76698 m!76611))

(assert (=> bm!6846 d!18273))

(declare-fun d!18275 () Bool)

(assert (=> d!18275 (= (+!97 (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (tuple2!2139 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34341)) (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) lt!34507 lt!34341 (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!35002 () Unit!2179)

(declare-fun choose!456 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 V!2961 Int) Unit!2179)

(assert (=> d!18275 (= lt!35002 (choose!456 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) lt!34507 (zeroValue!2145 newMap!16) lt!34341 (minValue!2145 newMap!16) (defaultEntry!2246 newMap!16)))))

(assert (=> d!18275 (validMask!0 (mask!6228 newMap!16))))

(assert (=> d!18275 (= (lemmaChangeZeroKeyThenAddPairToListMap!26 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) lt!34507 (zeroValue!2145 newMap!16) lt!34341 (minValue!2145 newMap!16) (defaultEntry!2246 newMap!16)) lt!35002)))

(declare-fun bs!3271 () Bool)

(assert (= bs!3271 d!18275))

(declare-fun m!76613 () Bool)

(assert (=> bs!3271 m!76613))

(assert (=> bs!3271 m!75607))

(assert (=> bs!3271 m!75799))

(declare-fun m!76615 () Bool)

(assert (=> bs!3271 m!76615))

(assert (=> bs!3271 m!75607))

(declare-fun m!76617 () Bool)

(assert (=> bs!3271 m!76617))

(assert (=> b!76081 d!18275))

(declare-fun d!18277 () Bool)

(declare-fun e!50065 () Bool)

(assert (=> d!18277 e!50065))

(declare-fun res!40350 () Bool)

(assert (=> d!18277 (=> res!40350 e!50065)))

(declare-fun lt!35006 () Bool)

(assert (=> d!18277 (= res!40350 (not lt!35006))))

(declare-fun lt!35005 () Bool)

(assert (=> d!18277 (= lt!35006 lt!35005)))

(declare-fun lt!35004 () Unit!2179)

(declare-fun e!50066 () Unit!2179)

(assert (=> d!18277 (= lt!35004 e!50066)))

(declare-fun c!11732 () Bool)

(assert (=> d!18277 (= c!11732 lt!35005)))

(assert (=> d!18277 (= lt!35005 (containsKey!137 (toList!723 lt!34620) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!18277 (= (contains!726 lt!34620 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!35006)))

(declare-fun b!76699 () Bool)

(declare-fun lt!35003 () Unit!2179)

(assert (=> b!76699 (= e!50066 lt!35003)))

(assert (=> b!76699 (= lt!35003 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!723 lt!34620) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!76699 (isDefined!87 (getValueByKey!133 (toList!723 lt!34620) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!76700 () Bool)

(declare-fun Unit!2214 () Unit!2179)

(assert (=> b!76700 (= e!50066 Unit!2214)))

(declare-fun b!76701 () Bool)

(assert (=> b!76701 (= e!50065 (isDefined!87 (getValueByKey!133 (toList!723 lt!34620) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!18277 c!11732) b!76699))

(assert (= (and d!18277 (not c!11732)) b!76700))

(assert (= (and d!18277 (not res!40350)) b!76701))

(assert (=> d!18277 m!75551))

(declare-fun m!76619 () Bool)

(assert (=> d!18277 m!76619))

(assert (=> b!76699 m!75551))

(declare-fun m!76621 () Bool)

(assert (=> b!76699 m!76621))

(assert (=> b!76699 m!75551))

(assert (=> b!76699 m!75861))

(assert (=> b!76699 m!75861))

(declare-fun m!76623 () Bool)

(assert (=> b!76699 m!76623))

(assert (=> b!76701 m!75551))

(assert (=> b!76701 m!75861))

(assert (=> b!76701 m!75861))

(assert (=> b!76701 m!76623))

(assert (=> b!76205 d!18277))

(declare-fun b!76710 () Bool)

(declare-fun e!50072 () (_ BitVec 32))

(declare-fun call!6956 () (_ BitVec 32))

(assert (=> b!76710 (= e!50072 call!6956)))

(declare-fun d!18279 () Bool)

(declare-fun lt!35009 () (_ BitVec 32))

(assert (=> d!18279 (and (bvsge lt!35009 #b00000000000000000000000000000000) (bvsle lt!35009 (bvsub (size!2099 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!50071 () (_ BitVec 32))

(assert (=> d!18279 (= lt!35009 e!50071)))

(declare-fun c!11737 () Bool)

(assert (=> d!18279 (= c!11737 (bvsge #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))))))

(assert (=> d!18279 (and (bvsle #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2099 (_keys!3903 newMap!16)) (size!2099 (_keys!3903 newMap!16))))))

(assert (=> d!18279 (= (arrayCountValidKeys!0 (_keys!3903 newMap!16) #b00000000000000000000000000000000 (size!2099 (_keys!3903 newMap!16))) lt!35009)))

(declare-fun b!76711 () Bool)

(assert (=> b!76711 (= e!50071 #b00000000000000000000000000000000)))

(declare-fun bm!6953 () Bool)

(assert (=> bm!6953 (= call!6956 (arrayCountValidKeys!0 (_keys!3903 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2099 (_keys!3903 newMap!16))))))

(declare-fun b!76712 () Bool)

(assert (=> b!76712 (= e!50072 (bvadd #b00000000000000000000000000000001 call!6956))))

(declare-fun b!76713 () Bool)

(assert (=> b!76713 (= e!50071 e!50072)))

(declare-fun c!11738 () Bool)

(assert (=> b!76713 (= c!11738 (validKeyInArray!0 (select (arr!1858 (_keys!3903 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!18279 c!11737) b!76711))

(assert (= (and d!18279 (not c!11737)) b!76713))

(assert (= (and b!76713 c!11738) b!76712))

(assert (= (and b!76713 (not c!11738)) b!76710))

(assert (= (or b!76712 b!76710) bm!6953))

(declare-fun m!76625 () Bool)

(assert (=> bm!6953 m!76625))

(assert (=> b!76713 m!76149))

(assert (=> b!76713 m!76149))

(assert (=> b!76713 m!76163))

(assert (=> b!75959 d!18279))

(assert (=> b!76203 d!18083))

(declare-fun d!18281 () Bool)

(declare-fun res!40351 () Bool)

(declare-fun e!50073 () Bool)

(assert (=> d!18281 (=> (not res!40351) (not e!50073))))

(assert (=> d!18281 (= res!40351 (simpleValid!53 (_2!1081 lt!34525)))))

(assert (=> d!18281 (= (valid!307 (_2!1081 lt!34525)) e!50073)))

(declare-fun b!76714 () Bool)

(declare-fun res!40352 () Bool)

(assert (=> b!76714 (=> (not res!40352) (not e!50073))))

(assert (=> b!76714 (= res!40352 (= (arrayCountValidKeys!0 (_keys!3903 (_2!1081 lt!34525)) #b00000000000000000000000000000000 (size!2099 (_keys!3903 (_2!1081 lt!34525)))) (_size!402 (_2!1081 lt!34525))))))

(declare-fun b!76715 () Bool)

(declare-fun res!40353 () Bool)

(assert (=> b!76715 (=> (not res!40353) (not e!50073))))

(assert (=> b!76715 (= res!40353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3903 (_2!1081 lt!34525)) (mask!6228 (_2!1081 lt!34525))))))

(declare-fun b!76716 () Bool)

(assert (=> b!76716 (= e!50073 (arrayNoDuplicates!0 (_keys!3903 (_2!1081 lt!34525)) #b00000000000000000000000000000000 Nil!1490))))

(assert (= (and d!18281 res!40351) b!76714))

(assert (= (and b!76714 res!40352) b!76715))

(assert (= (and b!76715 res!40353) b!76716))

(declare-fun m!76627 () Bool)

(assert (=> d!18281 m!76627))

(declare-fun m!76629 () Bool)

(assert (=> b!76714 m!76629))

(declare-fun m!76631 () Bool)

(assert (=> b!76715 m!76631))

(declare-fun m!76633 () Bool)

(assert (=> b!76716 m!76633))

(assert (=> d!18045 d!18281))

(assert (=> d!18045 d!18039))

(declare-fun d!18283 () Bool)

(assert (=> d!18283 (= (+!97 (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (tuple2!2139 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34341)) (getCurrentListMap!415 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) lt!34520 (zeroValue!2145 newMap!16) lt!34341 #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!35012 () Unit!2179)

(declare-fun choose!457 (array!3899 array!3901 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 V!2961 Int) Unit!2179)

(assert (=> d!18283 (= lt!35012 (choose!457 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) lt!34520 (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) lt!34341 (defaultEntry!2246 newMap!16)))))

(assert (=> d!18283 (validMask!0 (mask!6228 newMap!16))))

(assert (=> d!18283 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!26 (_keys!3903 newMap!16) (_values!2229 newMap!16) (mask!6228 newMap!16) (extraKeys!2099 newMap!16) lt!34520 (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) lt!34341 (defaultEntry!2246 newMap!16)) lt!35012)))

(declare-fun bs!3272 () Bool)

(assert (= bs!3272 d!18283))

(assert (=> bs!3272 m!75607))

(declare-fun m!76635 () Bool)

(assert (=> bs!3272 m!76635))

(declare-fun m!76637 () Bool)

(assert (=> bs!3272 m!76637))

(assert (=> bs!3272 m!75799))

(assert (=> bs!3272 m!75607))

(declare-fun m!76639 () Bool)

(assert (=> bs!3272 m!76639))

(assert (=> b!76093 d!18283))

(assert (=> d!18027 d!18031))

(declare-fun d!18285 () Bool)

(assert (=> d!18285 (not (arrayContainsKey!0 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!18285 true))

(declare-fun _$68!61 () Unit!2179)

(assert (=> d!18285 (= (choose!68 (_keys!3903 (v!2552 (underlying!262 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) (Cons!1489 (select (arr!1858 (_keys!3903 (v!2552 (underlying!262 thiss!992)))) from!355) Nil!1490)) _$68!61)))

(declare-fun bs!3273 () Bool)

(assert (= bs!3273 d!18285))

(assert (=> bs!3273 m!75383))

(assert (=> bs!3273 m!75413))

(assert (=> d!18027 d!18285))

(declare-fun b!76718 () Bool)

(declare-fun e!50074 () Bool)

(assert (=> b!76718 (= e!50074 tp_is_empty!2485)))

(declare-fun condMapEmpty!3233 () Bool)

(declare-fun mapDefault!3233 () ValueCell!899)

(assert (=> mapNonEmpty!3231 (= condMapEmpty!3233 (= mapRest!3231 ((as const (Array (_ BitVec 32) ValueCell!899)) mapDefault!3233)))))

(declare-fun mapRes!3233 () Bool)

(assert (=> mapNonEmpty!3231 (= tp!8631 (and e!50074 mapRes!3233))))

(declare-fun mapIsEmpty!3233 () Bool)

(assert (=> mapIsEmpty!3233 mapRes!3233))

(declare-fun b!76717 () Bool)

(declare-fun e!50075 () Bool)

(assert (=> b!76717 (= e!50075 tp_is_empty!2485)))

(declare-fun mapNonEmpty!3233 () Bool)

(declare-fun tp!8633 () Bool)

(assert (=> mapNonEmpty!3233 (= mapRes!3233 (and tp!8633 e!50075))))

(declare-fun mapRest!3233 () (Array (_ BitVec 32) ValueCell!899))

(declare-fun mapKey!3233 () (_ BitVec 32))

(declare-fun mapValue!3233 () ValueCell!899)

(assert (=> mapNonEmpty!3233 (= mapRest!3231 (store mapRest!3233 mapKey!3233 mapValue!3233))))

(assert (= (and mapNonEmpty!3231 condMapEmpty!3233) mapIsEmpty!3233))

(assert (= (and mapNonEmpty!3231 (not condMapEmpty!3233)) mapNonEmpty!3233))

(assert (= (and mapNonEmpty!3233 ((_ is ValueCellFull!899) mapValue!3233)) b!76717))

(assert (= (and mapNonEmpty!3231 ((_ is ValueCellFull!899) mapDefault!3233)) b!76718))

(declare-fun m!76641 () Bool)

(assert (=> mapNonEmpty!3233 m!76641))

(declare-fun b!76720 () Bool)

(declare-fun e!50076 () Bool)

(assert (=> b!76720 (= e!50076 tp_is_empty!2485)))

(declare-fun condMapEmpty!3234 () Bool)

(declare-fun mapDefault!3234 () ValueCell!899)

(assert (=> mapNonEmpty!3232 (= condMapEmpty!3234 (= mapRest!3232 ((as const (Array (_ BitVec 32) ValueCell!899)) mapDefault!3234)))))

(declare-fun mapRes!3234 () Bool)

(assert (=> mapNonEmpty!3232 (= tp!8632 (and e!50076 mapRes!3234))))

(declare-fun mapIsEmpty!3234 () Bool)

(assert (=> mapIsEmpty!3234 mapRes!3234))

(declare-fun b!76719 () Bool)

(declare-fun e!50077 () Bool)

(assert (=> b!76719 (= e!50077 tp_is_empty!2485)))

(declare-fun mapNonEmpty!3234 () Bool)

(declare-fun tp!8634 () Bool)

(assert (=> mapNonEmpty!3234 (= mapRes!3234 (and tp!8634 e!50077))))

(declare-fun mapValue!3234 () ValueCell!899)

(declare-fun mapKey!3234 () (_ BitVec 32))

(declare-fun mapRest!3234 () (Array (_ BitVec 32) ValueCell!899))

(assert (=> mapNonEmpty!3234 (= mapRest!3232 (store mapRest!3234 mapKey!3234 mapValue!3234))))

(assert (= (and mapNonEmpty!3232 condMapEmpty!3234) mapIsEmpty!3234))

(assert (= (and mapNonEmpty!3232 (not condMapEmpty!3234)) mapNonEmpty!3234))

(assert (= (and mapNonEmpty!3234 ((_ is ValueCellFull!899) mapValue!3234)) b!76719))

(assert (= (and mapNonEmpty!3232 ((_ is ValueCellFull!899) mapDefault!3234)) b!76720))

(declare-fun m!76643 () Bool)

(assert (=> mapNonEmpty!3234 m!76643))

(declare-fun b_lambda!3427 () Bool)

(assert (= b_lambda!3423 (or (and b!75774 b_free!2137 (= (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) (defaultEntry!2246 newMap!16))) (and b!75783 b_free!2139) b_lambda!3427)))

(declare-fun b_lambda!3429 () Bool)

(assert (= b_lambda!3419 (or (and b!75774 b_free!2137) (and b!75783 b_free!2139 (= (defaultEntry!2246 newMap!16) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))))) b_lambda!3429)))

(declare-fun b_lambda!3431 () Bool)

(assert (= b_lambda!3425 (or (and b!75774 b_free!2137 (= (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) (defaultEntry!2246 newMap!16))) (and b!75783 b_free!2139) b_lambda!3431)))

(declare-fun b_lambda!3433 () Bool)

(assert (= b_lambda!3417 (or (and b!75774 b_free!2137 (= (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))) (defaultEntry!2246 newMap!16))) (and b!75783 b_free!2139) b_lambda!3433)))

(declare-fun b_lambda!3435 () Bool)

(assert (= b_lambda!3421 (or (and b!75774 b_free!2137) (and b!75783 b_free!2139 (= (defaultEntry!2246 newMap!16) (defaultEntry!2246 (v!2552 (underlying!262 thiss!992))))) b_lambda!3435)))

(check-sat tp_is_empty!2485 (not b!76588) (not b!76274) (not b!76323) (not b!76314) (not b_lambda!3429) (not bm!6911) (not b!76663) (not d!18173) (not b!76375) (not b!76539) (not b!76682) (not b!76594) (not bm!6926) (not b!76351) (not d!18239) (not b!76250) (not b!76695) (not b!76253) (not d!18251) (not b!76638) (not b!76319) (not b!76604) (not b_lambda!3403) (not d!18197) (not d!18205) (not b!76390) (not b!76322) (not b!76479) (not bm!6918) (not b!76460) (not d!18223) (not b_lambda!3411) (not d!18091) (not bm!6924) (not bm!6931) (not b!76715) (not b!76582) (not bm!6923) (not d!18247) (not b!76260) (not b!76463) (not b!76352) (not d!18215) (not b!76303) (not b!76698) (not b!76668) (not b!76617) (not b!76510) (not d!18243) (not b!76632) b_and!4673 (not b!76353) (not b!76628) (not b_lambda!3415) (not d!18117) (not b!76280) (not b!76577) (not bm!6928) (not d!18167) (not b!76367) (not b!76670) (not d!18153) (not b_next!2137) (not b!76635) (not bm!6944) (not b!76380) (not b!76596) (not bm!6916) (not b!76669) (not b!76281) (not d!18147) (not b!76458) (not bm!6897) (not b!76350) (not b!76620) (not d!18213) (not b!76457) (not b!76666) (not b!76683) (not bm!6929) (not b!76446) (not b!76459) (not b!76334) (not d!18195) (not b!76598) (not bm!6938) (not b!76651) (not b!76689) (not b!76448) (not b!76263) (not b!76608) (not b!76675) (not d!18139) (not b!76453) (not b!76305) (not d!18145) (not b!76536) (not b!76685) (not b!76633) (not b!76505) (not d!18233) (not b!76320) (not d!18103) (not b!76464) (not b_lambda!3435) (not b!76640) (not b!76623) (not b!76558) (not b!76529) (not d!18079) (not b!76441) (not bm!6946) (not d!18203) (not b!76590) (not b!76557) (not b!76660) (not b!76701) (not b!76586) (not d!18127) (not b_lambda!3433) (not d!18143) b_and!4675 (not b!76595) (not b!76575) (not b!76307) (not b!76687) (not d!18183) (not d!18177) (not b!76671) (not d!18199) (not b_lambda!3431) (not b!76444) (not b!76659) (not d!18115) (not b!76713) (not b!76326) (not b!76349) (not b!76517) (not b!76677) (not d!18101) (not d!18113) (not d!18281) (not b!76716) (not d!18069) (not d!18089) (not d!18155) (not b!76443) (not bm!6948) (not b!76384) (not b!76699) (not b!76665) (not b!76338) (not d!18071) (not b!76561) (not d!18097) (not d!18217) (not b!76331) (not bm!6913) (not b!76356) (not b!76344) (not b!76627) (not d!18273) (not b!76378) (not d!18255) (not b!76318) (not b!76606) (not b!76569) (not mapNonEmpty!3233) (not b!76385) (not d!18137) (not b!76530) (not bm!6894) (not d!18151) (not b!76630) (not b!76355) (not b_lambda!3427) (not mapNonEmpty!3234) (not bm!6941) (not b!76316) (not d!18159) (not b!76508) (not bm!6909) (not b!76452) (not b!76644) (not b!76568) (not b!76542) (not bm!6935) (not d!18261) (not b!76553) (not b!76674) (not bm!6914) (not b_next!2139) (not b!76555) (not d!18285) (not b!76603) (not d!18171) (not b!76645) (not bm!6947) (not d!18111) (not b!76541) (not d!18283) (not bm!6934) (not d!18087) (not d!18275) (not b!76507) (not bm!6939) (not d!18249) (not b!76382) (not b!76359) (not d!18277) (not b!76519) (not b!76556) (not d!18207) (not b!76593) (not b!76624) (not b!76336) (not d!18095) (not b!76544) (not b!76386) (not b_lambda!3413) (not b!76534) (not d!18221) (not d!18259) (not bm!6953) (not d!18107) (not d!18265) (not d!18191) (not b!76696) (not d!18109) (not d!18229) (not b!76261) (not d!18133) (not d!18201) (not d!18135) (not b!76639) (not b!76455) (not b!76626) (not b!76470) (not b!76546) (not d!18189) (not bm!6925) (not b!76381) (not d!18149) (not d!18227) (not d!18231) (not b!76667) (not d!18141) (not b!76376) (not b!76680) (not d!18253) (not bm!6933) (not b!76343) (not b!76365) (not b!76397) (not b!76641) (not d!18131) (not b!76661) (not bm!6942) (not d!18267) (not b!76601) (not b!76332) (not b!76450) (not b!76393) (not b!76610) (not b!76360) (not d!18225) (not b!76254) (not b!76538) (not d!18125) (not b!76537) (not d!18185) (not d!18271) (not bm!6908) (not b!76379) (not b!76652) (not b!76329) (not d!18075) (not d!18179) (not b!76562) (not b!76471) (not b!76321) (not d!18123) (not d!18163) (not d!18081) (not b!76672) (not b!76358) (not b!76714) (not d!18129) (not b!76324) (not d!18105) (not b!76369))
(check-sat b_and!4673 b_and!4675 (not b_next!2137) (not b_next!2139))
