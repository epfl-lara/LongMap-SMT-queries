; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81352 () Bool)

(assert start!81352)

(declare-fun b!951384 () Bool)

(declare-fun b_free!18269 () Bool)

(declare-fun b_next!18269 () Bool)

(assert (=> b!951384 (= b_free!18269 (not b_next!18269))))

(declare-fun tp!63415 () Bool)

(declare-fun b_and!29737 () Bool)

(assert (=> b!951384 (= tp!63415 b_and!29737)))

(declare-fun b!951380 () Bool)

(declare-fun e!535721 () Bool)

(declare-datatypes ((V!32667 0))(
  ( (V!32668 (val!10439 Int)) )
))
(declare-datatypes ((ValueCell!9907 0))(
  ( (ValueCellFull!9907 (v!12986 V!32667)) (EmptyCell!9907) )
))
(declare-datatypes ((array!57580 0))(
  ( (array!57581 (arr!27686 (Array (_ BitVec 32) ValueCell!9907)) (size!28164 (_ BitVec 32))) )
))
(declare-datatypes ((array!57582 0))(
  ( (array!57583 (arr!27687 (Array (_ BitVec 32) (_ BitVec 64))) (size!28165 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4964 0))(
  ( (LongMapFixedSize!4965 (defaultEntry!5803 Int) (mask!27623 (_ BitVec 32)) (extraKeys!5535 (_ BitVec 32)) (zeroValue!5639 V!32667) (minValue!5639 V!32667) (_size!2537 (_ BitVec 32)) (_keys!10746 array!57582) (_values!5826 array!57580) (_vacant!2537 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4964)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57582 (_ BitVec 32)) Bool)

(assert (=> b!951380 (= e!535721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10746 thiss!1141) (mask!27623 thiss!1141)))))

(declare-fun b!951381 () Bool)

(declare-fun res!637621 () Bool)

(declare-fun e!535724 () Bool)

(assert (=> b!951381 (=> (not res!637621) (not e!535724))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13570 0))(
  ( (tuple2!13571 (_1!6796 (_ BitVec 64)) (_2!6796 V!32667)) )
))
(declare-datatypes ((List!19354 0))(
  ( (Nil!19351) (Cons!19350 (h!20511 tuple2!13570) (t!27701 List!19354)) )
))
(declare-datatypes ((ListLongMap!12267 0))(
  ( (ListLongMap!12268 (toList!6149 List!19354)) )
))
(declare-fun contains!5242 (ListLongMap!12267 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3382 (array!57582 array!57580 (_ BitVec 32) (_ BitVec 32) V!32667 V!32667 (_ BitVec 32) Int) ListLongMap!12267)

(assert (=> b!951381 (= res!637621 (contains!5242 (getCurrentListMap!3382 (_keys!10746 thiss!1141) (_values!5826 thiss!1141) (mask!27623 thiss!1141) (extraKeys!5535 thiss!1141) (zeroValue!5639 thiss!1141) (minValue!5639 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5803 thiss!1141)) key!756))))

(declare-fun mapIsEmpty!33090 () Bool)

(declare-fun mapRes!33090 () Bool)

(assert (=> mapIsEmpty!33090 mapRes!33090))

(declare-fun b!951382 () Bool)

(declare-fun e!535723 () Bool)

(declare-fun tp_is_empty!20777 () Bool)

(assert (=> b!951382 (= e!535723 tp_is_empty!20777)))

(declare-fun b!951383 () Bool)

(assert (=> b!951383 (= e!535724 (not e!535721))))

(declare-fun res!637618 () Bool)

(assert (=> b!951383 (=> res!637618 e!535721)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951383 (= res!637618 (not (validMask!0 (mask!27623 thiss!1141))))))

(declare-fun lt!428522 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57582 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951383 (= lt!428522 (arrayScanForKey!0 (_keys!10746 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951383 (arrayContainsKey!0 (_keys!10746 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!32019 0))(
  ( (Unit!32020) )
))
(declare-fun lt!428523 () Unit!32019)

(declare-fun lemmaKeyInListMapIsInArray!328 (array!57582 array!57580 (_ BitVec 32) (_ BitVec 32) V!32667 V!32667 (_ BitVec 64) Int) Unit!32019)

(assert (=> b!951383 (= lt!428523 (lemmaKeyInListMapIsInArray!328 (_keys!10746 thiss!1141) (_values!5826 thiss!1141) (mask!27623 thiss!1141) (extraKeys!5535 thiss!1141) (zeroValue!5639 thiss!1141) (minValue!5639 thiss!1141) key!756 (defaultEntry!5803 thiss!1141)))))

(declare-fun res!637622 () Bool)

(assert (=> start!81352 (=> (not res!637622) (not e!535724))))

(declare-fun valid!1888 (LongMapFixedSize!4964) Bool)

(assert (=> start!81352 (= res!637622 (valid!1888 thiss!1141))))

(assert (=> start!81352 e!535724))

(declare-fun e!535722 () Bool)

(assert (=> start!81352 e!535722))

(assert (=> start!81352 true))

(declare-fun e!535727 () Bool)

(declare-fun array_inv!21492 (array!57582) Bool)

(declare-fun array_inv!21493 (array!57580) Bool)

(assert (=> b!951384 (= e!535722 (and tp!63415 tp_is_empty!20777 (array_inv!21492 (_keys!10746 thiss!1141)) (array_inv!21493 (_values!5826 thiss!1141)) e!535727))))

(declare-fun b!951385 () Bool)

(declare-fun res!637619 () Bool)

(assert (=> b!951385 (=> (not res!637619) (not e!535724))))

(declare-datatypes ((SeekEntryResult!9153 0))(
  ( (MissingZero!9153 (index!38983 (_ BitVec 32))) (Found!9153 (index!38984 (_ BitVec 32))) (Intermediate!9153 (undefined!9965 Bool) (index!38985 (_ BitVec 32)) (x!81851 (_ BitVec 32))) (Undefined!9153) (MissingVacant!9153 (index!38986 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57582 (_ BitVec 32)) SeekEntryResult!9153)

(assert (=> b!951385 (= res!637619 (not (is-Found!9153 (seekEntry!0 key!756 (_keys!10746 thiss!1141) (mask!27623 thiss!1141)))))))

(declare-fun b!951386 () Bool)

(declare-fun res!637617 () Bool)

(assert (=> b!951386 (=> (not res!637617) (not e!535724))))

(assert (=> b!951386 (= res!637617 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!33090 () Bool)

(declare-fun tp!63416 () Bool)

(declare-fun e!535726 () Bool)

(assert (=> mapNonEmpty!33090 (= mapRes!33090 (and tp!63416 e!535726))))

(declare-fun mapValue!33090 () ValueCell!9907)

(declare-fun mapRest!33090 () (Array (_ BitVec 32) ValueCell!9907))

(declare-fun mapKey!33090 () (_ BitVec 32))

(assert (=> mapNonEmpty!33090 (= (arr!27686 (_values!5826 thiss!1141)) (store mapRest!33090 mapKey!33090 mapValue!33090))))

(declare-fun b!951387 () Bool)

(assert (=> b!951387 (= e!535727 (and e!535723 mapRes!33090))))

(declare-fun condMapEmpty!33090 () Bool)

(declare-fun mapDefault!33090 () ValueCell!9907)

