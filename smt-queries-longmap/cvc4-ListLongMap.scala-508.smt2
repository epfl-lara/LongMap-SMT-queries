; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12144 () Bool)

(assert start!12144)

(declare-fun b!102582 () Bool)

(declare-fun b_free!2493 () Bool)

(declare-fun b_next!2493 () Bool)

(assert (=> b!102582 (= b_free!2493 (not b_next!2493))))

(declare-fun tp!9789 () Bool)

(declare-fun b_and!6335 () Bool)

(assert (=> b!102582 (= tp!9789 b_and!6335)))

(declare-fun b!102584 () Bool)

(declare-fun b_free!2495 () Bool)

(declare-fun b_next!2495 () Bool)

(assert (=> b!102584 (= b_free!2495 (not b_next!2495))))

(declare-fun tp!9790 () Bool)

(declare-fun b_and!6337 () Bool)

(assert (=> b!102584 (= tp!9790 b_and!6337)))

(declare-fun b!102577 () Bool)

(declare-datatypes ((Unit!3132 0))(
  ( (Unit!3133) )
))
(declare-fun e!66800 () Unit!3132)

(declare-fun Unit!3134 () Unit!3132)

(assert (=> b!102577 (= e!66800 Unit!3134)))

(declare-fun b!102578 () Bool)

(declare-fun e!66804 () Bool)

(declare-fun tp_is_empty!2663 () Bool)

(assert (=> b!102578 (= e!66804 tp_is_empty!2663)))

(declare-fun b!102579 () Bool)

(declare-fun e!66807 () Bool)

(declare-fun e!66801 () Bool)

(assert (=> b!102579 (= e!66807 e!66801)))

(declare-fun res!51316 () Bool)

(assert (=> b!102579 (=> (not res!51316) (not e!66801))))

(declare-datatypes ((V!3197 0))(
  ( (V!3198 (val!1376 Int)) )
))
(declare-datatypes ((array!4313 0))(
  ( (array!4314 (arr!2047 (Array (_ BitVec 32) (_ BitVec 64))) (size!2301 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!988 0))(
  ( (ValueCellFull!988 (v!2863 V!3197)) (EmptyCell!988) )
))
(declare-datatypes ((array!4315 0))(
  ( (array!4316 (arr!2048 (Array (_ BitVec 32) ValueCell!988)) (size!2302 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!884 0))(
  ( (LongMapFixedSize!885 (defaultEntry!2553 Int) (mask!6684 (_ BitVec 32)) (extraKeys!2362 (_ BitVec 32)) (zeroValue!2430 V!3197) (minValue!2430 V!3197) (_size!491 (_ BitVec 32)) (_keys!4255 array!4313) (_values!2536 array!4315) (_vacant!491 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2384 0))(
  ( (tuple2!2385 (_1!1203 Bool) (_2!1203 LongMapFixedSize!884)) )
))
(declare-fun lt!52143 () tuple2!2384)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!102579 (= res!51316 (and (_1!1203 lt!52143) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!52142 () Unit!3132)

(assert (=> b!102579 (= lt!52142 e!66800)))

(declare-fun c!17646 () Bool)

(declare-datatypes ((Cell!684 0))(
  ( (Cell!685 (v!2864 LongMapFixedSize!884)) )
))
(declare-datatypes ((LongMap!684 0))(
  ( (LongMap!685 (underlying!353 Cell!684)) )
))
(declare-fun thiss!992 () LongMap!684)

(declare-datatypes ((tuple2!2386 0))(
  ( (tuple2!2387 (_1!1204 (_ BitVec 64)) (_2!1204 V!3197)) )
))
(declare-datatypes ((List!1604 0))(
  ( (Nil!1601) (Cons!1600 (h!2196 tuple2!2386) (t!5646 List!1604)) )
))
(declare-datatypes ((ListLongMap!1559 0))(
  ( (ListLongMap!1560 (toList!795 List!1604)) )
))
(declare-fun lt!52147 () ListLongMap!1559)

(declare-fun contains!819 (ListLongMap!1559 (_ BitVec 64)) Bool)

(assert (=> b!102579 (= c!17646 (contains!819 lt!52147 (select (arr!2047 (_keys!4255 (v!2864 (underlying!353 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!884)

(declare-fun update!151 (LongMapFixedSize!884 (_ BitVec 64) V!3197) tuple2!2384)

(declare-fun get!1313 (ValueCell!988 V!3197) V!3197)

(declare-fun dynLambda!379 (Int (_ BitVec 64)) V!3197)

(assert (=> b!102579 (= lt!52143 (update!151 newMap!16 (select (arr!2047 (_keys!4255 (v!2864 (underlying!353 thiss!992)))) from!355) (get!1313 (select (arr!2048 (_values!2536 (v!2864 (underlying!353 thiss!992)))) from!355) (dynLambda!379 (defaultEntry!2553 (v!2864 (underlying!353 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!102580 () Bool)

(declare-fun e!66799 () Bool)

(assert (=> b!102580 (= e!66799 e!66807)))

(declare-fun res!51313 () Bool)

(assert (=> b!102580 (=> (not res!51313) (not e!66807))))

(declare-fun lt!52144 () ListLongMap!1559)

(assert (=> b!102580 (= res!51313 (and (= lt!52144 lt!52147) (not (= (select (arr!2047 (_keys!4255 (v!2864 (underlying!353 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2047 (_keys!4255 (v!2864 (underlying!353 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1275 (LongMapFixedSize!884) ListLongMap!1559)

(assert (=> b!102580 (= lt!52147 (map!1275 newMap!16))))

(declare-fun getCurrentListMap!484 (array!4313 array!4315 (_ BitVec 32) (_ BitVec 32) V!3197 V!3197 (_ BitVec 32) Int) ListLongMap!1559)

(assert (=> b!102580 (= lt!52144 (getCurrentListMap!484 (_keys!4255 (v!2864 (underlying!353 thiss!992))) (_values!2536 (v!2864 (underlying!353 thiss!992))) (mask!6684 (v!2864 (underlying!353 thiss!992))) (extraKeys!2362 (v!2864 (underlying!353 thiss!992))) (zeroValue!2430 (v!2864 (underlying!353 thiss!992))) (minValue!2430 (v!2864 (underlying!353 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2553 (v!2864 (underlying!353 thiss!992)))))))

(declare-fun b!102581 () Bool)

(declare-fun e!66809 () Bool)

(assert (=> b!102581 (= e!66809 tp_is_empty!2663)))

(declare-fun mapIsEmpty!3869 () Bool)

(declare-fun mapRes!3869 () Bool)

(assert (=> mapIsEmpty!3869 mapRes!3869))

(declare-fun e!66803 () Bool)

(declare-fun e!66796 () Bool)

(declare-fun array_inv!1285 (array!4313) Bool)

(declare-fun array_inv!1286 (array!4315) Bool)

(assert (=> b!102582 (= e!66796 (and tp!9789 tp_is_empty!2663 (array_inv!1285 (_keys!4255 (v!2864 (underlying!353 thiss!992)))) (array_inv!1286 (_values!2536 (v!2864 (underlying!353 thiss!992)))) e!66803))))

(declare-fun b!102583 () Bool)

(declare-fun res!51314 () Bool)

(assert (=> b!102583 (=> (not res!51314) (not e!66799))))

(assert (=> b!102583 (= res!51314 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6684 newMap!16)) (_size!491 (v!2864 (underlying!353 thiss!992)))))))

(declare-fun e!66806 () Bool)

(declare-fun e!66795 () Bool)

(assert (=> b!102584 (= e!66806 (and tp!9790 tp_is_empty!2663 (array_inv!1285 (_keys!4255 newMap!16)) (array_inv!1286 (_values!2536 newMap!16)) e!66795))))

(declare-fun b!102585 () Bool)

(declare-fun e!66798 () Bool)

(assert (=> b!102585 (= e!66798 e!66796)))

(declare-fun b!102586 () Bool)

(declare-fun res!51315 () Bool)

(assert (=> b!102586 (=> (not res!51315) (not e!66799))))

(assert (=> b!102586 (= res!51315 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2301 (_keys!4255 (v!2864 (underlying!353 thiss!992)))))))))

(declare-fun mapNonEmpty!3869 () Bool)

(declare-fun tp!9791 () Bool)

(declare-fun e!66805 () Bool)

(assert (=> mapNonEmpty!3869 (= mapRes!3869 (and tp!9791 e!66805))))

(declare-fun mapRest!3869 () (Array (_ BitVec 32) ValueCell!988))

(declare-fun mapKey!3869 () (_ BitVec 32))

(declare-fun mapValue!3870 () ValueCell!988)

(assert (=> mapNonEmpty!3869 (= (arr!2048 (_values!2536 newMap!16)) (store mapRest!3869 mapKey!3869 mapValue!3870))))

(declare-fun mapNonEmpty!3870 () Bool)

(declare-fun mapRes!3870 () Bool)

(declare-fun tp!9792 () Bool)

(assert (=> mapNonEmpty!3870 (= mapRes!3870 (and tp!9792 e!66809))))

(declare-fun mapRest!3870 () (Array (_ BitVec 32) ValueCell!988))

(declare-fun mapValue!3869 () ValueCell!988)

(declare-fun mapKey!3870 () (_ BitVec 32))

(assert (=> mapNonEmpty!3870 (= (arr!2048 (_values!2536 (v!2864 (underlying!353 thiss!992)))) (store mapRest!3870 mapKey!3870 mapValue!3869))))

(declare-fun res!51312 () Bool)

(assert (=> start!12144 (=> (not res!51312) (not e!66799))))

(declare-fun valid!409 (LongMap!684) Bool)

(assert (=> start!12144 (= res!51312 (valid!409 thiss!992))))

(assert (=> start!12144 e!66799))

(declare-fun e!66808 () Bool)

(assert (=> start!12144 e!66808))

(assert (=> start!12144 true))

(assert (=> start!12144 e!66806))

(declare-fun mapIsEmpty!3870 () Bool)

(assert (=> mapIsEmpty!3870 mapRes!3870))

(declare-fun b!102587 () Bool)

(declare-fun res!51311 () Bool)

(assert (=> b!102587 (=> (not res!51311) (not e!66799))))

(declare-fun valid!410 (LongMapFixedSize!884) Bool)

(assert (=> b!102587 (= res!51311 (valid!410 newMap!16))))

(declare-fun b!102588 () Bool)

(assert (=> b!102588 (= e!66795 (and e!66804 mapRes!3869))))

(declare-fun condMapEmpty!3870 () Bool)

(declare-fun mapDefault!3870 () ValueCell!988)

