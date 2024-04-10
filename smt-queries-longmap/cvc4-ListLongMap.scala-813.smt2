; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19800 () Bool)

(assert start!19800)

(declare-fun b!194020 () Bool)

(declare-fun b_free!4721 () Bool)

(declare-fun b_next!4721 () Bool)

(assert (=> b!194020 (= b_free!4721 (not b_next!4721))))

(declare-fun tp!17032 () Bool)

(declare-fun b_and!11435 () Bool)

(assert (=> b!194020 (= tp!17032 b_and!11435)))

(declare-fun b!194018 () Bool)

(declare-fun res!91702 () Bool)

(declare-fun e!127667 () Bool)

(assert (=> b!194018 (=> (not res!91702) (not e!127667))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!194018 (= res!91702 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7772 () Bool)

(declare-fun mapRes!7772 () Bool)

(assert (=> mapIsEmpty!7772 mapRes!7772))

(declare-fun b!194019 () Bool)

(declare-fun e!127665 () Bool)

(declare-fun e!127666 () Bool)

(assert (=> b!194019 (= e!127665 e!127666)))

(declare-fun res!91705 () Bool)

(assert (=> b!194019 (=> (not res!91705) (not e!127666))))

(declare-datatypes ((V!5637 0))(
  ( (V!5638 (val!2291 Int)) )
))
(declare-datatypes ((tuple2!3562 0))(
  ( (tuple2!3563 (_1!1792 (_ BitVec 64)) (_2!1792 V!5637)) )
))
(declare-datatypes ((List!2450 0))(
  ( (Nil!2447) (Cons!2446 (h!3087 tuple2!3562) (t!7376 List!2450)) )
))
(declare-datatypes ((ListLongMap!2479 0))(
  ( (ListLongMap!2480 (toList!1255 List!2450)) )
))
(declare-fun lt!96718 () ListLongMap!2479)

(declare-fun contains!1380 (ListLongMap!2479 (_ BitVec 64)) Bool)

(assert (=> b!194019 (= res!91705 (contains!1380 lt!96718 key!828))))

(declare-datatypes ((ValueCell!1903 0))(
  ( (ValueCellFull!1903 (v!4253 V!5637)) (EmptyCell!1903) )
))
(declare-datatypes ((array!8237 0))(
  ( (array!8238 (arr!3877 (Array (_ BitVec 32) (_ BitVec 64))) (size!4201 (_ BitVec 32))) )
))
(declare-datatypes ((array!8239 0))(
  ( (array!8240 (arr!3878 (Array (_ BitVec 32) ValueCell!1903)) (size!4202 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2714 0))(
  ( (LongMapFixedSize!2715 (defaultEntry!3961 Int) (mask!9224 (_ BitVec 32)) (extraKeys!3698 (_ BitVec 32)) (zeroValue!3802 V!5637) (minValue!3802 V!5637) (_size!1406 (_ BitVec 32)) (_keys!5955 array!8237) (_values!3944 array!8239) (_vacant!1406 (_ BitVec 32))) )
))
(declare-fun lt!96716 () LongMapFixedSize!2714)

(declare-fun map!2030 (LongMapFixedSize!2714) ListLongMap!2479)

(assert (=> b!194019 (= lt!96718 (map!2030 lt!96716))))

(declare-fun mapNonEmpty!7772 () Bool)

(declare-fun tp!17033 () Bool)

(declare-fun e!127669 () Bool)

(assert (=> mapNonEmpty!7772 (= mapRes!7772 (and tp!17033 e!127669))))

(declare-fun mapRest!7772 () (Array (_ BitVec 32) ValueCell!1903))

(declare-fun thiss!1248 () LongMapFixedSize!2714)

(declare-fun mapValue!7772 () ValueCell!1903)

(declare-fun mapKey!7772 () (_ BitVec 32))

(assert (=> mapNonEmpty!7772 (= (arr!3878 (_values!3944 thiss!1248)) (store mapRest!7772 mapKey!7772 mapValue!7772))))

(declare-fun e!127673 () Bool)

(declare-fun e!127671 () Bool)

(declare-fun tp_is_empty!4493 () Bool)

(declare-fun array_inv!2515 (array!8237) Bool)

(declare-fun array_inv!2516 (array!8239) Bool)

(assert (=> b!194020 (= e!127671 (and tp!17032 tp_is_empty!4493 (array_inv!2515 (_keys!5955 thiss!1248)) (array_inv!2516 (_values!3944 thiss!1248)) e!127673))))

(declare-fun b!194021 () Bool)

(declare-datatypes ((Unit!5881 0))(
  ( (Unit!5882) )
))
(declare-fun e!127674 () Unit!5881)

(declare-fun Unit!5883 () Unit!5881)

(assert (=> b!194021 (= e!127674 Unit!5883)))

(declare-fun lt!96714 () Unit!5881)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!197 (array!8237 array!8239 (_ BitVec 32) (_ BitVec 32) V!5637 V!5637 (_ BitVec 64) Int) Unit!5881)

(assert (=> b!194021 (= lt!96714 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!197 (_keys!5955 thiss!1248) (_values!3944 thiss!1248) (mask!9224 thiss!1248) (extraKeys!3698 thiss!1248) (zeroValue!3802 thiss!1248) (minValue!3802 thiss!1248) key!828 (defaultEntry!3961 thiss!1248)))))

(assert (=> b!194021 false))

(declare-fun b!194022 () Bool)

(declare-fun e!127672 () Bool)

(assert (=> b!194022 (= e!127673 (and e!127672 mapRes!7772))))

(declare-fun condMapEmpty!7772 () Bool)

(declare-fun mapDefault!7772 () ValueCell!1903)

