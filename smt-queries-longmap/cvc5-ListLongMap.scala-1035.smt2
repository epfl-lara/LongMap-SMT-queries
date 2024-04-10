; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21892 () Bool)

(assert start!21892)

(declare-fun b!221669 () Bool)

(declare-fun b_free!5959 () Bool)

(declare-fun b_next!5959 () Bool)

(assert (=> b!221669 (= b_free!5959 (not b_next!5959))))

(declare-fun tp!21018 () Bool)

(declare-fun b_and!12857 () Bool)

(assert (=> b!221669 (= tp!21018 b_and!12857)))

(declare-fun b!221656 () Bool)

(declare-fun e!144049 () Bool)

(declare-fun e!144055 () Bool)

(assert (=> b!221656 (= e!144049 e!144055)))

(declare-fun res!108760 () Bool)

(declare-fun call!20712 () Bool)

(assert (=> b!221656 (= res!108760 call!20712)))

(assert (=> b!221656 (=> (not res!108760) (not e!144055))))

(declare-fun b!221657 () Bool)

(declare-fun e!144060 () Bool)

(declare-fun call!20711 () Bool)

(assert (=> b!221657 (= e!144060 (not call!20711))))

(declare-fun b!221658 () Bool)

(declare-fun e!144048 () Bool)

(declare-fun tp_is_empty!5821 () Bool)

(assert (=> b!221658 (= e!144048 tp_is_empty!5821)))

(declare-fun b!221659 () Bool)

(declare-datatypes ((Unit!6625 0))(
  ( (Unit!6626) )
))
(declare-fun e!144058 () Unit!6625)

(declare-fun Unit!6627 () Unit!6625)

(assert (=> b!221659 (= e!144058 Unit!6627)))

(declare-fun lt!112460 () Unit!6625)

(declare-datatypes ((V!7409 0))(
  ( (V!7410 (val!2955 Int)) )
))
(declare-datatypes ((ValueCell!2567 0))(
  ( (ValueCellFull!2567 (v!4975 V!7409)) (EmptyCell!2567) )
))
(declare-datatypes ((array!10885 0))(
  ( (array!10886 (arr!5162 (Array (_ BitVec 32) ValueCell!2567)) (size!5495 (_ BitVec 32))) )
))
(declare-datatypes ((array!10887 0))(
  ( (array!10888 (arr!5163 (Array (_ BitVec 32) (_ BitVec 64))) (size!5496 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3034 0))(
  ( (LongMapFixedSize!3035 (defaultEntry!4176 Int) (mask!9990 (_ BitVec 32)) (extraKeys!3913 (_ BitVec 32)) (zeroValue!4017 V!7409) (minValue!4017 V!7409) (_size!1566 (_ BitVec 32)) (_keys!6230 array!10887) (_values!4159 array!10885) (_vacant!1566 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3034)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!52 (array!10887 array!10885 (_ BitVec 32) (_ BitVec 32) V!7409 V!7409 (_ BitVec 64) (_ BitVec 32) Int) Unit!6625)

(assert (=> b!221659 (= lt!112460 (lemmaArrayContainsKeyThenInListMap!52 (_keys!6230 thiss!1504) (_values!4159 thiss!1504) (mask!9990 thiss!1504) (extraKeys!3913 thiss!1504) (zeroValue!4017 thiss!1504) (minValue!4017 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4176 thiss!1504)))))

(assert (=> b!221659 false))

(declare-fun res!108755 () Bool)

(declare-fun e!144063 () Bool)

(assert (=> start!21892 (=> (not res!108755) (not e!144063))))

(declare-fun valid!1225 (LongMapFixedSize!3034) Bool)

(assert (=> start!21892 (= res!108755 (valid!1225 thiss!1504))))

(assert (=> start!21892 e!144063))

(declare-fun e!144052 () Bool)

(assert (=> start!21892 e!144052))

(assert (=> start!21892 true))

(declare-fun b!221660 () Bool)

(declare-fun e!144050 () Bool)

(assert (=> b!221660 (= e!144050 false)))

(declare-fun lt!112459 () Bool)

(declare-datatypes ((List!3288 0))(
  ( (Nil!3285) (Cons!3284 (h!3932 (_ BitVec 64)) (t!8247 List!3288)) )
))
(declare-fun arrayNoDuplicates!0 (array!10887 (_ BitVec 32) List!3288) Bool)

(assert (=> b!221660 (= lt!112459 (arrayNoDuplicates!0 (_keys!6230 thiss!1504) #b00000000000000000000000000000000 Nil!3285))))

(declare-fun mapNonEmpty!9901 () Bool)

(declare-fun mapRes!9901 () Bool)

(declare-fun tp!21019 () Bool)

(declare-fun e!144062 () Bool)

(assert (=> mapNonEmpty!9901 (= mapRes!9901 (and tp!21019 e!144062))))

(declare-fun mapValue!9901 () ValueCell!2567)

(declare-fun mapKey!9901 () (_ BitVec 32))

(declare-fun mapRest!9901 () (Array (_ BitVec 32) ValueCell!2567))

(assert (=> mapNonEmpty!9901 (= (arr!5162 (_values!4159 thiss!1504)) (store mapRest!9901 mapKey!9901 mapValue!9901))))

(declare-fun b!221661 () Bool)

(declare-fun res!108759 () Bool)

(assert (=> b!221661 (=> (not res!108759) (not e!144050))))

(declare-fun noDuplicate!63 (List!3288) Bool)

(assert (=> b!221661 (= res!108759 (noDuplicate!63 Nil!3285))))

(declare-fun b!221662 () Bool)

(declare-fun e!144065 () Bool)

(declare-fun e!144051 () Bool)

(assert (=> b!221662 (= e!144065 e!144051)))

(declare-fun res!108767 () Bool)

(assert (=> b!221662 (=> (not res!108767) (not e!144051))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!221662 (= res!108767 (inRange!0 index!297 (mask!9990 thiss!1504)))))

(declare-fun lt!112463 () Unit!6625)

(declare-fun e!144056 () Unit!6625)

(assert (=> b!221662 (= lt!112463 e!144056)))

(declare-fun c!36849 () Bool)

(declare-datatypes ((tuple2!4386 0))(
  ( (tuple2!4387 (_1!2204 (_ BitVec 64)) (_2!2204 V!7409)) )
))
(declare-datatypes ((List!3289 0))(
  ( (Nil!3286) (Cons!3285 (h!3933 tuple2!4386) (t!8248 List!3289)) )
))
(declare-datatypes ((ListLongMap!3299 0))(
  ( (ListLongMap!3300 (toList!1665 List!3289)) )
))
(declare-fun contains!1508 (ListLongMap!3299 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1193 (array!10887 array!10885 (_ BitVec 32) (_ BitVec 32) V!7409 V!7409 (_ BitVec 32) Int) ListLongMap!3299)

(assert (=> b!221662 (= c!36849 (contains!1508 (getCurrentListMap!1193 (_keys!6230 thiss!1504) (_values!4159 thiss!1504) (mask!9990 thiss!1504) (extraKeys!3913 thiss!1504) (zeroValue!4017 thiss!1504) (minValue!4017 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4176 thiss!1504)) key!932))))

(declare-fun b!221663 () Bool)

(declare-fun res!108765 () Bool)

(assert (=> b!221663 (=> (not res!108765) (not e!144050))))

(declare-fun e!144061 () Bool)

(assert (=> b!221663 (= res!108765 e!144061)))

(declare-fun res!108761 () Bool)

(assert (=> b!221663 (=> res!108761 e!144061)))

(declare-fun e!144053 () Bool)

(assert (=> b!221663 (= res!108761 e!144053)))

(declare-fun res!108764 () Bool)

(assert (=> b!221663 (=> (not res!108764) (not e!144053))))

(assert (=> b!221663 (= res!108764 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun mapIsEmpty!9901 () Bool)

(assert (=> mapIsEmpty!9901 mapRes!9901))

(declare-fun c!36852 () Bool)

(declare-fun bm!20708 () Bool)

(declare-datatypes ((SeekEntryResult!828 0))(
  ( (MissingZero!828 (index!5482 (_ BitVec 32))) (Found!828 (index!5483 (_ BitVec 32))) (Intermediate!828 (undefined!1640 Bool) (index!5484 (_ BitVec 32)) (x!23024 (_ BitVec 32))) (Undefined!828) (MissingVacant!828 (index!5485 (_ BitVec 32))) )
))
(declare-fun lt!112462 () SeekEntryResult!828)

(assert (=> bm!20708 (= call!20712 (inRange!0 (ite c!36852 (index!5482 lt!112462) (index!5485 lt!112462)) (mask!9990 thiss!1504)))))

(declare-fun b!221664 () Bool)

(declare-fun lt!112458 () Unit!6625)

(assert (=> b!221664 (= e!144056 lt!112458)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!230 (array!10887 array!10885 (_ BitVec 32) (_ BitVec 32) V!7409 V!7409 (_ BitVec 64) Int) Unit!6625)

(assert (=> b!221664 (= lt!112458 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!230 (_keys!6230 thiss!1504) (_values!4159 thiss!1504) (mask!9990 thiss!1504) (extraKeys!3913 thiss!1504) (zeroValue!4017 thiss!1504) (minValue!4017 thiss!1504) key!932 (defaultEntry!4176 thiss!1504)))))

(assert (=> b!221664 (= c!36852 (is-MissingZero!828 lt!112462))))

(declare-fun e!144059 () Bool)

(assert (=> b!221664 e!144059))

(declare-fun b!221665 () Bool)

(declare-fun contains!1509 (List!3288 (_ BitVec 64)) Bool)

(assert (=> b!221665 (= e!144053 (contains!1509 Nil!3285 key!932))))

(declare-fun b!221666 () Bool)

(declare-fun e!144057 () Bool)

(assert (=> b!221666 (= e!144057 (and e!144048 mapRes!9901))))

(declare-fun condMapEmpty!9901 () Bool)

(declare-fun mapDefault!9901 () ValueCell!2567)

