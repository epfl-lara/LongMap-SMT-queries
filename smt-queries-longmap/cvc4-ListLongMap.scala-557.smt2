; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15158 () Bool)

(assert start!15158)

(declare-fun b!145536 () Bool)

(declare-fun b_free!3081 () Bool)

(declare-fun b_next!3081 () Bool)

(assert (=> b!145536 (= b_free!3081 (not b_next!3081))))

(declare-fun tp!11744 () Bool)

(declare-fun b_and!9075 () Bool)

(assert (=> b!145536 (= tp!11744 b_and!9075)))

(declare-fun b!145538 () Bool)

(declare-fun b_free!3083 () Bool)

(declare-fun b_next!3083 () Bool)

(assert (=> b!145538 (= b_free!3083 (not b_next!3083))))

(declare-fun tp!11742 () Bool)

(declare-fun b_and!9077 () Bool)

(assert (=> b!145538 (= tp!11742 b_and!9077)))

(declare-fun b!145529 () Bool)

(declare-fun res!69321 () Bool)

(declare-fun e!94844 () Bool)

(assert (=> b!145529 (=> (not res!69321) (not e!94844))))

(declare-datatypes ((V!3589 0))(
  ( (V!3590 (val!1523 Int)) )
))
(declare-datatypes ((array!4957 0))(
  ( (array!4958 (arr!2341 (Array (_ BitVec 32) (_ BitVec 64))) (size!2617 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1135 0))(
  ( (ValueCellFull!1135 (v!3333 V!3589)) (EmptyCell!1135) )
))
(declare-datatypes ((array!4959 0))(
  ( (array!4960 (arr!2342 (Array (_ BitVec 32) ValueCell!1135)) (size!2618 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1178 0))(
  ( (LongMapFixedSize!1179 (defaultEntry!3003 Int) (mask!7373 (_ BitVec 32)) (extraKeys!2748 (_ BitVec 32)) (zeroValue!2848 V!3589) (minValue!2848 V!3589) (_size!638 (_ BitVec 32)) (_keys!4772 array!4957) (_values!2986 array!4959) (_vacant!638 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1178)

(declare-fun valid!572 (LongMapFixedSize!1178) Bool)

(assert (=> b!145529 (= res!69321 (valid!572 newMap!16))))

(declare-fun b!145530 () Bool)

(declare-fun e!94850 () Bool)

(declare-fun tp_is_empty!2957 () Bool)

(assert (=> b!145530 (= e!94850 tp_is_empty!2957)))

(declare-fun b!145531 () Bool)

(declare-fun res!69324 () Bool)

(declare-fun e!94840 () Bool)

(assert (=> b!145531 (=> res!69324 e!94840)))

(declare-datatypes ((List!1766 0))(
  ( (Nil!1763) (Cons!1762 (h!2370 (_ BitVec 64)) (t!6431 List!1766)) )
))
(declare-fun lt!76527 () List!1766)

(declare-fun contains!945 (List!1766 (_ BitVec 64)) Bool)

(assert (=> b!145531 (= res!69324 (contains!945 lt!76527 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Cell!962 0))(
  ( (Cell!963 (v!3334 LongMapFixedSize!1178)) )
))
(declare-datatypes ((LongMap!962 0))(
  ( (LongMap!963 (underlying!492 Cell!962)) )
))
(declare-fun thiss!992 () LongMap!962)

(declare-fun b!145532 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!145532 (= e!94840 (contains!945 lt!76527 (select (arr!2341 (_keys!4772 (v!3334 (underlying!492 thiss!992)))) from!355)))))

(declare-fun mapNonEmpty!4939 () Bool)

(declare-fun mapRes!4939 () Bool)

(declare-fun tp!11741 () Bool)

(declare-fun e!94851 () Bool)

(assert (=> mapNonEmpty!4939 (= mapRes!4939 (and tp!11741 e!94851))))

(declare-fun mapValue!4939 () ValueCell!1135)

(declare-fun mapKey!4940 () (_ BitVec 32))

(declare-fun mapRest!4939 () (Array (_ BitVec 32) ValueCell!1135))

(assert (=> mapNonEmpty!4939 (= (arr!2342 (_values!2986 (v!3334 (underlying!492 thiss!992)))) (store mapRest!4939 mapKey!4940 mapValue!4939))))

(declare-fun b!145533 () Bool)

(declare-fun e!94837 () Bool)

(declare-fun e!94847 () Bool)

(assert (=> b!145533 (= e!94837 e!94847)))

(declare-fun res!69328 () Bool)

(assert (=> b!145533 (=> (not res!69328) (not e!94847))))

(declare-datatypes ((tuple2!2738 0))(
  ( (tuple2!2739 (_1!1380 (_ BitVec 64)) (_2!1380 V!3589)) )
))
(declare-datatypes ((List!1767 0))(
  ( (Nil!1764) (Cons!1763 (h!2371 tuple2!2738) (t!6432 List!1767)) )
))
(declare-datatypes ((ListLongMap!1765 0))(
  ( (ListLongMap!1766 (toList!898 List!1767)) )
))
(declare-fun lt!76524 () ListLongMap!1765)

(declare-fun contains!946 (ListLongMap!1765 (_ BitVec 64)) Bool)

(assert (=> b!145533 (= res!69328 (contains!946 lt!76524 (select (arr!2341 (_keys!4772 (v!3334 (underlying!492 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2740 0))(
  ( (tuple2!2741 (_1!1381 Bool) (_2!1381 LongMapFixedSize!1178)) )
))
(declare-fun lt!76523 () tuple2!2740)

(declare-fun update!221 (LongMapFixedSize!1178 (_ BitVec 64) V!3589) tuple2!2740)

(declare-fun get!1558 (ValueCell!1135 V!3589) V!3589)

(declare-fun dynLambda!452 (Int (_ BitVec 64)) V!3589)

(assert (=> b!145533 (= lt!76523 (update!221 newMap!16 (select (arr!2341 (_keys!4772 (v!3334 (underlying!492 thiss!992)))) from!355) (get!1558 (select (arr!2342 (_values!2986 (v!3334 (underlying!492 thiss!992)))) from!355) (dynLambda!452 (defaultEntry!3003 (v!3334 (underlying!492 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!145534 () Bool)

(assert (=> b!145534 (= e!94844 e!94837)))

(declare-fun res!69323 () Bool)

(assert (=> b!145534 (=> (not res!69323) (not e!94837))))

(declare-fun lt!76522 () ListLongMap!1765)

(assert (=> b!145534 (= res!69323 (and (= lt!76522 lt!76524) (not (= (select (arr!2341 (_keys!4772 (v!3334 (underlying!492 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2341 (_keys!4772 (v!3334 (underlying!492 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1457 (LongMapFixedSize!1178) ListLongMap!1765)

(assert (=> b!145534 (= lt!76524 (map!1457 newMap!16))))

(declare-fun getCurrentListMap!568 (array!4957 array!4959 (_ BitVec 32) (_ BitVec 32) V!3589 V!3589 (_ BitVec 32) Int) ListLongMap!1765)

(assert (=> b!145534 (= lt!76522 (getCurrentListMap!568 (_keys!4772 (v!3334 (underlying!492 thiss!992))) (_values!2986 (v!3334 (underlying!492 thiss!992))) (mask!7373 (v!3334 (underlying!492 thiss!992))) (extraKeys!2748 (v!3334 (underlying!492 thiss!992))) (zeroValue!2848 (v!3334 (underlying!492 thiss!992))) (minValue!2848 (v!3334 (underlying!492 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3003 (v!3334 (underlying!492 thiss!992)))))))

(declare-fun b!145535 () Bool)

(declare-fun e!94845 () Bool)

(declare-fun e!94841 () Bool)

(declare-fun mapRes!4940 () Bool)

(assert (=> b!145535 (= e!94845 (and e!94841 mapRes!4940))))

(declare-fun condMapEmpty!4940 () Bool)

(declare-fun mapDefault!4940 () ValueCell!1135)

