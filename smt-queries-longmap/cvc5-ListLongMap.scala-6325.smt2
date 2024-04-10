; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81376 () Bool)

(assert start!81376)

(declare-fun b!951548 () Bool)

(declare-fun b_free!18271 () Bool)

(declare-fun b_next!18271 () Bool)

(assert (=> b!951548 (= b_free!18271 (not b_next!18271))))

(declare-fun tp!63425 () Bool)

(declare-fun b_and!29741 () Bool)

(assert (=> b!951548 (= tp!63425 b_and!29741)))

(declare-fun b!951545 () Bool)

(declare-fun e!535829 () Bool)

(declare-datatypes ((V!32671 0))(
  ( (V!32672 (val!10440 Int)) )
))
(declare-datatypes ((ValueCell!9908 0))(
  ( (ValueCellFull!9908 (v!12988 V!32671)) (EmptyCell!9908) )
))
(declare-datatypes ((array!57586 0))(
  ( (array!57587 (arr!27688 (Array (_ BitVec 32) ValueCell!9908)) (size!28166 (_ BitVec 32))) )
))
(declare-datatypes ((array!57588 0))(
  ( (array!57589 (arr!27689 (Array (_ BitVec 32) (_ BitVec 64))) (size!28167 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4966 0))(
  ( (LongMapFixedSize!4967 (defaultEntry!5806 Int) (mask!27631 (_ BitVec 32)) (extraKeys!5538 (_ BitVec 32)) (zeroValue!5642 V!32671) (minValue!5642 V!32671) (_size!2538 (_ BitVec 32)) (_keys!10751 array!57588) (_values!5829 array!57586) (_vacant!2538 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4966)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951545 (= e!535829 (not (validMask!0 (mask!27631 thiss!1141))))))

(declare-fun lt!428637 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57588 (_ BitVec 32)) Bool)

(assert (=> b!951545 (arrayForallSeekEntryOrOpenFound!0 lt!428637 (_keys!10751 thiss!1141) (mask!27631 thiss!1141))))

(declare-datatypes ((Unit!32023 0))(
  ( (Unit!32024) )
))
(declare-fun lt!428636 () Unit!32023)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32023)

(assert (=> b!951545 (= lt!428636 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10751 thiss!1141) (mask!27631 thiss!1141) #b00000000000000000000000000000000 lt!428637))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57588 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951545 (= lt!428637 (arrayScanForKey!0 (_keys!10751 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951545 (arrayContainsKey!0 (_keys!10751 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!428635 () Unit!32023)

(declare-fun lemmaKeyInListMapIsInArray!329 (array!57588 array!57586 (_ BitVec 32) (_ BitVec 32) V!32671 V!32671 (_ BitVec 64) Int) Unit!32023)

(assert (=> b!951545 (= lt!428635 (lemmaKeyInListMapIsInArray!329 (_keys!10751 thiss!1141) (_values!5829 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) key!756 (defaultEntry!5806 thiss!1141)))))

(declare-fun b!951546 () Bool)

(declare-fun res!637683 () Bool)

(assert (=> b!951546 (=> (not res!637683) (not e!535829))))

(assert (=> b!951546 (= res!637683 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!951547 () Bool)

(declare-fun res!637682 () Bool)

(assert (=> b!951547 (=> (not res!637682) (not e!535829))))

(declare-datatypes ((SeekEntryResult!9154 0))(
  ( (MissingZero!9154 (index!38987 (_ BitVec 32))) (Found!9154 (index!38988 (_ BitVec 32))) (Intermediate!9154 (undefined!9966 Bool) (index!38989 (_ BitVec 32)) (x!81870 (_ BitVec 32))) (Undefined!9154) (MissingVacant!9154 (index!38990 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57588 (_ BitVec 32)) SeekEntryResult!9154)

(assert (=> b!951547 (= res!637682 (not (is-Found!9154 (seekEntry!0 key!756 (_keys!10751 thiss!1141) (mask!27631 thiss!1141)))))))

(declare-fun e!535824 () Bool)

(declare-fun tp_is_empty!20779 () Bool)

(declare-fun e!535827 () Bool)

(declare-fun array_inv!21494 (array!57588) Bool)

(declare-fun array_inv!21495 (array!57586) Bool)

(assert (=> b!951548 (= e!535827 (and tp!63425 tp_is_empty!20779 (array_inv!21494 (_keys!10751 thiss!1141)) (array_inv!21495 (_values!5829 thiss!1141)) e!535824))))

(declare-fun b!951549 () Bool)

(declare-fun res!637685 () Bool)

(assert (=> b!951549 (=> (not res!637685) (not e!535829))))

(declare-datatypes ((tuple2!13572 0))(
  ( (tuple2!13573 (_1!6797 (_ BitVec 64)) (_2!6797 V!32671)) )
))
(declare-datatypes ((List!19356 0))(
  ( (Nil!19353) (Cons!19352 (h!20513 tuple2!13572) (t!27705 List!19356)) )
))
(declare-datatypes ((ListLongMap!12269 0))(
  ( (ListLongMap!12270 (toList!6150 List!19356)) )
))
(declare-fun contains!5243 (ListLongMap!12269 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3383 (array!57588 array!57586 (_ BitVec 32) (_ BitVec 32) V!32671 V!32671 (_ BitVec 32) Int) ListLongMap!12269)

(assert (=> b!951549 (= res!637685 (contains!5243 (getCurrentListMap!3383 (_keys!10751 thiss!1141) (_values!5829 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)) key!756))))

(declare-fun mapIsEmpty!33096 () Bool)

(declare-fun mapRes!33096 () Bool)

(assert (=> mapIsEmpty!33096 mapRes!33096))

(declare-fun b!951550 () Bool)

(declare-fun e!535828 () Bool)

(assert (=> b!951550 (= e!535828 tp_is_empty!20779)))

(declare-fun res!637684 () Bool)

(assert (=> start!81376 (=> (not res!637684) (not e!535829))))

(declare-fun valid!1889 (LongMapFixedSize!4966) Bool)

(assert (=> start!81376 (= res!637684 (valid!1889 thiss!1141))))

(assert (=> start!81376 e!535829))

(assert (=> start!81376 e!535827))

(assert (=> start!81376 true))

(declare-fun mapNonEmpty!33096 () Bool)

(declare-fun tp!63424 () Bool)

(declare-fun e!535825 () Bool)

(assert (=> mapNonEmpty!33096 (= mapRes!33096 (and tp!63424 e!535825))))

(declare-fun mapRest!33096 () (Array (_ BitVec 32) ValueCell!9908))

(declare-fun mapValue!33096 () ValueCell!9908)

(declare-fun mapKey!33096 () (_ BitVec 32))

(assert (=> mapNonEmpty!33096 (= (arr!27688 (_values!5829 thiss!1141)) (store mapRest!33096 mapKey!33096 mapValue!33096))))

(declare-fun b!951551 () Bool)

(assert (=> b!951551 (= e!535824 (and e!535828 mapRes!33096))))

(declare-fun condMapEmpty!33096 () Bool)

(declare-fun mapDefault!33096 () ValueCell!9908)

