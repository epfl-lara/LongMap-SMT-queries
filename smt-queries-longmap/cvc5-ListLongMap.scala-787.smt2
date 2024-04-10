; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18748 () Bool)

(assert start!18748)

(declare-fun b!185264 () Bool)

(declare-fun b_free!4561 () Bool)

(declare-fun b_next!4561 () Bool)

(assert (=> b!185264 (= b_free!4561 (not b_next!4561))))

(declare-fun tp!16476 () Bool)

(declare-fun b_and!11159 () Bool)

(assert (=> b!185264 (= tp!16476 b_and!11159)))

(declare-fun mapNonEmpty!7455 () Bool)

(declare-fun mapRes!7455 () Bool)

(declare-fun tp!16475 () Bool)

(declare-fun e!121918 () Bool)

(assert (=> mapNonEmpty!7455 (= mapRes!7455 (and tp!16475 e!121918))))

(declare-datatypes ((V!5425 0))(
  ( (V!5426 (val!2211 Int)) )
))
(declare-datatypes ((ValueCell!1823 0))(
  ( (ValueCellFull!1823 (v!4120 V!5425)) (EmptyCell!1823) )
))
(declare-fun mapValue!7455 () ValueCell!1823)

(declare-fun mapKey!7455 () (_ BitVec 32))

(declare-datatypes ((array!7871 0))(
  ( (array!7872 (arr!3717 (Array (_ BitVec 32) (_ BitVec 64))) (size!4033 (_ BitVec 32))) )
))
(declare-datatypes ((array!7873 0))(
  ( (array!7874 (arr!3718 (Array (_ BitVec 32) ValueCell!1823)) (size!4034 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2554 0))(
  ( (LongMapFixedSize!2555 (defaultEntry!3777 Int) (mask!8880 (_ BitVec 32)) (extraKeys!3514 (_ BitVec 32)) (zeroValue!3618 V!5425) (minValue!3618 V!5425) (_size!1326 (_ BitVec 32)) (_keys!5714 array!7871) (_values!3760 array!7873) (_vacant!1326 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2554)

(declare-fun mapRest!7455 () (Array (_ BitVec 32) ValueCell!1823))

(assert (=> mapNonEmpty!7455 (= (arr!3718 (_values!3760 thiss!1248)) (store mapRest!7455 mapKey!7455 mapValue!7455))))

(declare-fun b!185259 () Bool)

(declare-fun e!121920 () Bool)

(declare-fun tp_is_empty!4333 () Bool)

(assert (=> b!185259 (= e!121920 tp_is_empty!4333)))

(declare-fun b!185260 () Bool)

(declare-fun res!87623 () Bool)

(declare-fun e!121915 () Bool)

(assert (=> b!185260 (=> (not res!87623) (not e!121915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7871 (_ BitVec 32)) Bool)

(assert (=> b!185260 (= res!87623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5714 thiss!1248) (mask!8880 thiss!1248)))))

(declare-fun b!185261 () Bool)

(assert (=> b!185261 (= e!121918 tp_is_empty!4333)))

(declare-fun b!185262 () Bool)

(declare-fun res!87624 () Bool)

(assert (=> b!185262 (=> (not res!87624) (not e!121915))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3444 0))(
  ( (tuple2!3445 (_1!1733 (_ BitVec 64)) (_2!1733 V!5425)) )
))
(declare-datatypes ((List!2355 0))(
  ( (Nil!2352) (Cons!2351 (h!2984 tuple2!3444) (t!7235 List!2355)) )
))
(declare-datatypes ((ListLongMap!2361 0))(
  ( (ListLongMap!2362 (toList!1196 List!2355)) )
))
(declare-fun contains!1290 (ListLongMap!2361 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!844 (array!7871 array!7873 (_ BitVec 32) (_ BitVec 32) V!5425 V!5425 (_ BitVec 32) Int) ListLongMap!2361)

(assert (=> b!185262 (= res!87624 (not (contains!1290 (getCurrentListMap!844 (_keys!5714 thiss!1248) (_values!3760 thiss!1248) (mask!8880 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)) key!828)))))

(declare-fun b!185263 () Bool)

(declare-fun e!121916 () Bool)

(assert (=> b!185263 (= e!121916 (and e!121920 mapRes!7455))))

(declare-fun condMapEmpty!7455 () Bool)

(declare-fun mapDefault!7455 () ValueCell!1823)

