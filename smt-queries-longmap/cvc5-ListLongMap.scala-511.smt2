; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12350 () Bool)

(assert start!12350)

(declare-fun b!105235 () Bool)

(declare-fun b_free!2521 () Bool)

(declare-fun b_next!2521 () Bool)

(assert (=> b!105235 (= b_free!2521 (not b_next!2521))))

(declare-fun tp!9888 () Bool)

(declare-fun b_and!6495 () Bool)

(assert (=> b!105235 (= tp!9888 b_and!6495)))

(declare-fun b!105230 () Bool)

(declare-fun b_free!2523 () Bool)

(declare-fun b_next!2523 () Bool)

(assert (=> b!105230 (= b_free!2523 (not b_next!2523))))

(declare-fun tp!9886 () Bool)

(declare-fun b_and!6497 () Bool)

(assert (=> b!105230 (= tp!9886 b_and!6497)))

(declare-fun b!105222 () Bool)

(declare-fun e!68513 () Bool)

(declare-fun e!68504 () Bool)

(assert (=> b!105222 (= e!68513 e!68504)))

(declare-fun res!52415 () Bool)

(assert (=> b!105222 (=> (not res!52415) (not e!68504))))

(declare-datatypes ((V!3217 0))(
  ( (V!3218 (val!1383 Int)) )
))
(declare-datatypes ((array!4345 0))(
  ( (array!4346 (arr!2061 (Array (_ BitVec 32) (_ BitVec 64))) (size!2316 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!995 0))(
  ( (ValueCellFull!995 (v!2889 V!3217)) (EmptyCell!995) )
))
(declare-datatypes ((array!4347 0))(
  ( (array!4348 (arr!2062 (Array (_ BitVec 32) ValueCell!995)) (size!2317 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!898 0))(
  ( (LongMapFixedSize!899 (defaultEntry!2581 Int) (mask!6727 (_ BitVec 32)) (extraKeys!2386 (_ BitVec 32)) (zeroValue!2456 V!3217) (minValue!2456 V!3217) (_size!498 (_ BitVec 32)) (_keys!4287 array!4345) (_values!2564 array!4347) (_vacant!498 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!698 0))(
  ( (Cell!699 (v!2890 LongMapFixedSize!898)) )
))
(declare-datatypes ((LongMap!698 0))(
  ( (LongMap!699 (underlying!360 Cell!698)) )
))
(declare-fun thiss!992 () LongMap!698)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!105222 (= res!52415 (and (not (= (select (arr!2061 (_keys!4287 (v!2890 (underlying!360 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2061 (_keys!4287 (v!2890 (underlying!360 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!53772 () V!3217)

(declare-fun get!1329 (ValueCell!995 V!3217) V!3217)

(declare-fun dynLambda!384 (Int (_ BitVec 64)) V!3217)

(assert (=> b!105222 (= lt!53772 (get!1329 (select (arr!2062 (_values!2564 (v!2890 (underlying!360 thiss!992)))) from!355) (dynLambda!384 (defaultEntry!2581 (v!2890 (underlying!360 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!105223 () Bool)

(declare-fun e!68508 () Bool)

(declare-fun tp_is_empty!2677 () Bool)

(assert (=> b!105223 (= e!68508 tp_is_empty!2677)))

(declare-fun b!105224 () Bool)

(declare-datatypes ((Unit!3228 0))(
  ( (Unit!3229) )
))
(declare-fun e!68511 () Unit!3228)

(declare-fun Unit!3230 () Unit!3228)

(assert (=> b!105224 (= e!68511 Unit!3230)))

(declare-fun lt!53775 () Unit!3228)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!104 (array!4345 array!4347 (_ BitVec 32) (_ BitVec 32) V!3217 V!3217 (_ BitVec 64) (_ BitVec 32) Int) Unit!3228)

(assert (=> b!105224 (= lt!53775 (lemmaListMapContainsThenArrayContainsFrom!104 (_keys!4287 (v!2890 (underlying!360 thiss!992))) (_values!2564 (v!2890 (underlying!360 thiss!992))) (mask!6727 (v!2890 (underlying!360 thiss!992))) (extraKeys!2386 (v!2890 (underlying!360 thiss!992))) (zeroValue!2456 (v!2890 (underlying!360 thiss!992))) (minValue!2456 (v!2890 (underlying!360 thiss!992))) (select (arr!2061 (_keys!4287 (v!2890 (underlying!360 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2581 (v!2890 (underlying!360 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!105224 (arrayContainsKey!0 (_keys!4287 (v!2890 (underlying!360 thiss!992))) (select (arr!2061 (_keys!4287 (v!2890 (underlying!360 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!53779 () Unit!3228)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4345 (_ BitVec 32) (_ BitVec 32)) Unit!3228)

(assert (=> b!105224 (= lt!53779 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4287 (v!2890 (underlying!360 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1614 0))(
  ( (Nil!1611) (Cons!1610 (h!2207 (_ BitVec 64)) (t!5693 List!1614)) )
))
(declare-fun arrayNoDuplicates!0 (array!4345 (_ BitVec 32) List!1614) Bool)

(assert (=> b!105224 (arrayNoDuplicates!0 (_keys!4287 (v!2890 (underlying!360 thiss!992))) from!355 Nil!1611)))

(declare-fun lt!53771 () Unit!3228)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4345 (_ BitVec 32) (_ BitVec 64) List!1614) Unit!3228)

(assert (=> b!105224 (= lt!53771 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4287 (v!2890 (underlying!360 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2061 (_keys!4287 (v!2890 (underlying!360 thiss!992)))) from!355) (Cons!1610 (select (arr!2061 (_keys!4287 (v!2890 (underlying!360 thiss!992)))) from!355) Nil!1611)))))

(assert (=> b!105224 false))

(declare-fun b!105225 () Bool)

(declare-fun e!68506 () Bool)

(assert (=> b!105225 (= e!68506 (or (not (= (size!2317 (_values!2564 (v!2890 (underlying!360 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6727 (v!2890 (underlying!360 thiss!992)))))) (= (size!2316 (_keys!4287 (v!2890 (underlying!360 thiss!992)))) (size!2317 (_values!2564 (v!2890 (underlying!360 thiss!992)))))))))

(declare-fun b!105226 () Bool)

(declare-fun e!68499 () Bool)

(assert (=> b!105226 (= e!68504 e!68499)))

(declare-fun res!52414 () Bool)

(assert (=> b!105226 (=> (not res!52414) (not e!68499))))

(declare-datatypes ((tuple2!2406 0))(
  ( (tuple2!2407 (_1!1214 Bool) (_2!1214 LongMapFixedSize!898)) )
))
(declare-fun lt!53777 () tuple2!2406)

(assert (=> b!105226 (= res!52414 (and (_1!1214 lt!53777) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!53773 () Unit!3228)

(assert (=> b!105226 (= lt!53773 e!68511)))

(declare-datatypes ((tuple2!2408 0))(
  ( (tuple2!2409 (_1!1215 (_ BitVec 64)) (_2!1215 V!3217)) )
))
(declare-datatypes ((List!1615 0))(
  ( (Nil!1612) (Cons!1611 (h!2208 tuple2!2408) (t!5694 List!1615)) )
))
(declare-datatypes ((ListLongMap!1573 0))(
  ( (ListLongMap!1574 (toList!802 List!1615)) )
))
(declare-fun lt!53768 () ListLongMap!1573)

(declare-fun c!18290 () Bool)

(declare-fun contains!827 (ListLongMap!1573 (_ BitVec 64)) Bool)

(assert (=> b!105226 (= c!18290 (contains!827 lt!53768 (select (arr!2061 (_keys!4287 (v!2890 (underlying!360 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!898)

(declare-fun update!155 (LongMapFixedSize!898 (_ BitVec 64) V!3217) tuple2!2406)

(assert (=> b!105226 (= lt!53777 (update!155 newMap!16 (select (arr!2061 (_keys!4287 (v!2890 (underlying!360 thiss!992)))) from!355) lt!53772))))

(declare-fun b!105227 () Bool)

(declare-fun Unit!3231 () Unit!3228)

(assert (=> b!105227 (= e!68511 Unit!3231)))

(declare-fun b!105228 () Bool)

(assert (=> b!105228 (= e!68499 (not e!68506))))

(declare-fun res!52417 () Bool)

(assert (=> b!105228 (=> res!52417 e!68506)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!105228 (= res!52417 (not (validMask!0 (mask!6727 (v!2890 (underlying!360 thiss!992))))))))

(declare-fun lt!53778 () ListLongMap!1573)

(declare-fun lt!53769 () tuple2!2408)

(declare-fun lt!53770 () tuple2!2408)

(declare-fun +!143 (ListLongMap!1573 tuple2!2408) ListLongMap!1573)

(assert (=> b!105228 (= (+!143 (+!143 lt!53778 lt!53769) lt!53770) (+!143 (+!143 lt!53778 lt!53770) lt!53769))))

(assert (=> b!105228 (= lt!53770 (tuple2!2409 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2456 (v!2890 (underlying!360 thiss!992)))))))

(assert (=> b!105228 (= lt!53769 (tuple2!2409 (select (arr!2061 (_keys!4287 (v!2890 (underlying!360 thiss!992)))) from!355) lt!53772))))

(declare-fun lt!53776 () Unit!3228)

(declare-fun addCommutativeForDiffKeys!55 (ListLongMap!1573 (_ BitVec 64) V!3217 (_ BitVec 64) V!3217) Unit!3228)

(assert (=> b!105228 (= lt!53776 (addCommutativeForDiffKeys!55 lt!53778 (select (arr!2061 (_keys!4287 (v!2890 (underlying!360 thiss!992)))) from!355) lt!53772 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2456 (v!2890 (underlying!360 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!109 (array!4345 array!4347 (_ BitVec 32) (_ BitVec 32) V!3217 V!3217 (_ BitVec 32) Int) ListLongMap!1573)

(assert (=> b!105228 (= lt!53778 (getCurrentListMapNoExtraKeys!109 (_keys!4287 (v!2890 (underlying!360 thiss!992))) (_values!2564 (v!2890 (underlying!360 thiss!992))) (mask!6727 (v!2890 (underlying!360 thiss!992))) (extraKeys!2386 (v!2890 (underlying!360 thiss!992))) (zeroValue!2456 (v!2890 (underlying!360 thiss!992))) (minValue!2456 (v!2890 (underlying!360 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2581 (v!2890 (underlying!360 thiss!992)))))))

(declare-fun b!105229 () Bool)

(declare-fun res!52412 () Bool)

(declare-fun e!68502 () Bool)

(assert (=> b!105229 (=> (not res!52412) (not e!68502))))

(assert (=> b!105229 (= res!52412 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6727 newMap!16)) (_size!498 (v!2890 (underlying!360 thiss!992)))))))

(declare-fun e!68514 () Bool)

(declare-fun e!68512 () Bool)

(declare-fun array_inv!1297 (array!4345) Bool)

(declare-fun array_inv!1298 (array!4347) Bool)

(assert (=> b!105230 (= e!68514 (and tp!9886 tp_is_empty!2677 (array_inv!1297 (_keys!4287 newMap!16)) (array_inv!1298 (_values!2564 newMap!16)) e!68512))))

(declare-fun b!105231 () Bool)

(declare-fun res!52416 () Bool)

(assert (=> b!105231 (=> (not res!52416) (not e!68502))))

(assert (=> b!105231 (= res!52416 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2316 (_keys!4287 (v!2890 (underlying!360 thiss!992)))))))))

(declare-fun b!105232 () Bool)

(declare-fun e!68503 () Bool)

(declare-fun e!68500 () Bool)

(assert (=> b!105232 (= e!68503 e!68500)))

(declare-fun b!105233 () Bool)

(declare-fun e!68516 () Bool)

(assert (=> b!105233 (= e!68516 e!68503)))

(declare-fun b!105234 () Bool)

(assert (=> b!105234 (= e!68502 e!68513)))

(declare-fun res!52411 () Bool)

(assert (=> b!105234 (=> (not res!52411) (not e!68513))))

(declare-fun lt!53774 () ListLongMap!1573)

(assert (=> b!105234 (= res!52411 (= lt!53774 lt!53768))))

(declare-fun map!1285 (LongMapFixedSize!898) ListLongMap!1573)

(assert (=> b!105234 (= lt!53768 (map!1285 newMap!16))))

(declare-fun getCurrentListMap!488 (array!4345 array!4347 (_ BitVec 32) (_ BitVec 32) V!3217 V!3217 (_ BitVec 32) Int) ListLongMap!1573)

(assert (=> b!105234 (= lt!53774 (getCurrentListMap!488 (_keys!4287 (v!2890 (underlying!360 thiss!992))) (_values!2564 (v!2890 (underlying!360 thiss!992))) (mask!6727 (v!2890 (underlying!360 thiss!992))) (extraKeys!2386 (v!2890 (underlying!360 thiss!992))) (zeroValue!2456 (v!2890 (underlying!360 thiss!992))) (minValue!2456 (v!2890 (underlying!360 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2581 (v!2890 (underlying!360 thiss!992)))))))

(declare-fun mapIsEmpty!3923 () Bool)

(declare-fun mapRes!3924 () Bool)

(assert (=> mapIsEmpty!3923 mapRes!3924))

(declare-fun e!68509 () Bool)

(assert (=> b!105235 (= e!68500 (and tp!9888 tp_is_empty!2677 (array_inv!1297 (_keys!4287 (v!2890 (underlying!360 thiss!992)))) (array_inv!1298 (_values!2564 (v!2890 (underlying!360 thiss!992)))) e!68509))))

(declare-fun mapIsEmpty!3924 () Bool)

(declare-fun mapRes!3923 () Bool)

(assert (=> mapIsEmpty!3924 mapRes!3923))

(declare-fun b!105236 () Bool)

(declare-fun e!68507 () Bool)

(assert (=> b!105236 (= e!68509 (and e!68507 mapRes!3923))))

(declare-fun condMapEmpty!3924 () Bool)

(declare-fun mapDefault!3923 () ValueCell!995)

