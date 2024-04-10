; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80306 () Bool)

(assert start!80306)

(declare-fun b!943466 () Bool)

(declare-fun b_free!18005 () Bool)

(declare-fun b_next!18005 () Bool)

(assert (=> b!943466 (= b_free!18005 (not b_next!18005))))

(declare-fun tp!62521 () Bool)

(declare-fun b_and!29417 () Bool)

(assert (=> b!943466 (= tp!62521 b_and!29417)))

(declare-fun b!943465 () Bool)

(declare-fun res!633946 () Bool)

(declare-fun e!530459 () Bool)

(assert (=> b!943465 (=> (not res!633946) (not e!530459))))

(declare-datatypes ((V!32315 0))(
  ( (V!32316 (val!10307 Int)) )
))
(declare-datatypes ((ValueCell!9775 0))(
  ( (ValueCellFull!9775 (v!12838 V!32315)) (EmptyCell!9775) )
))
(declare-datatypes ((array!56992 0))(
  ( (array!56993 (arr!27422 (Array (_ BitVec 32) ValueCell!9775)) (size!27887 (_ BitVec 32))) )
))
(declare-datatypes ((array!56994 0))(
  ( (array!56995 (arr!27423 (Array (_ BitVec 32) (_ BitVec 64))) (size!27888 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4700 0))(
  ( (LongMapFixedSize!4701 (defaultEntry!5641 Int) (mask!27269 (_ BitVec 32)) (extraKeys!5373 (_ BitVec 32)) (zeroValue!5477 V!32315) (minValue!5477 V!32315) (_size!2405 (_ BitVec 32)) (_keys!10515 array!56994) (_values!5664 array!56992) (_vacant!2405 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4700)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943465 (= res!633946 (validMask!0 (mask!27269 thiss!1141)))))

(declare-fun tp_is_empty!20513 () Bool)

(declare-fun e!530455 () Bool)

(declare-fun e!530458 () Bool)

(declare-fun array_inv!21308 (array!56994) Bool)

(declare-fun array_inv!21309 (array!56992) Bool)

(assert (=> b!943466 (= e!530455 (and tp!62521 tp_is_empty!20513 (array_inv!21308 (_keys!10515 thiss!1141)) (array_inv!21309 (_values!5664 thiss!1141)) e!530458))))

(declare-fun res!633945 () Bool)

(assert (=> start!80306 (=> (not res!633945) (not e!530459))))

(declare-fun valid!1797 (LongMapFixedSize!4700) Bool)

(assert (=> start!80306 (= res!633945 (valid!1797 thiss!1141))))

(assert (=> start!80306 e!530459))

(assert (=> start!80306 e!530455))

(assert (=> start!80306 true))

(declare-fun mapNonEmpty!32591 () Bool)

(declare-fun mapRes!32591 () Bool)

(declare-fun tp!62520 () Bool)

(declare-fun e!530457 () Bool)

(assert (=> mapNonEmpty!32591 (= mapRes!32591 (and tp!62520 e!530457))))

(declare-fun mapRest!32591 () (Array (_ BitVec 32) ValueCell!9775))

(declare-fun mapValue!32591 () ValueCell!9775)

(declare-fun mapKey!32591 () (_ BitVec 32))

(assert (=> mapNonEmpty!32591 (= (arr!27422 (_values!5664 thiss!1141)) (store mapRest!32591 mapKey!32591 mapValue!32591))))

(declare-fun b!943467 () Bool)

(declare-fun res!633942 () Bool)

(assert (=> b!943467 (=> (not res!633942) (not e!530459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56994 (_ BitVec 32)) Bool)

(assert (=> b!943467 (= res!633942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10515 thiss!1141) (mask!27269 thiss!1141)))))

(declare-fun mapIsEmpty!32591 () Bool)

(assert (=> mapIsEmpty!32591 mapRes!32591))

(declare-fun b!943468 () Bool)

(declare-fun res!633941 () Bool)

(assert (=> b!943468 (=> (not res!633941) (not e!530459))))

(assert (=> b!943468 (= res!633941 (and (= (size!27887 (_values!5664 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27269 thiss!1141))) (= (size!27888 (_keys!10515 thiss!1141)) (size!27887 (_values!5664 thiss!1141))) (bvsge (mask!27269 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5373 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5373 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!943469 () Bool)

(assert (=> b!943469 (= e!530459 false)))

(declare-fun lt!425257 () Bool)

(declare-datatypes ((List!19254 0))(
  ( (Nil!19251) (Cons!19250 (h!20400 (_ BitVec 64)) (t!27569 List!19254)) )
))
(declare-fun arrayNoDuplicates!0 (array!56994 (_ BitVec 32) List!19254) Bool)

(assert (=> b!943469 (= lt!425257 (arrayNoDuplicates!0 (_keys!10515 thiss!1141) #b00000000000000000000000000000000 Nil!19251))))

(declare-fun b!943470 () Bool)

(declare-fun res!633944 () Bool)

(assert (=> b!943470 (=> (not res!633944) (not e!530459))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9052 0))(
  ( (MissingZero!9052 (index!38579 (_ BitVec 32))) (Found!9052 (index!38580 (_ BitVec 32))) (Intermediate!9052 (undefined!9864 Bool) (index!38581 (_ BitVec 32)) (x!81021 (_ BitVec 32))) (Undefined!9052) (MissingVacant!9052 (index!38582 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56994 (_ BitVec 32)) SeekEntryResult!9052)

(assert (=> b!943470 (= res!633944 (not (is-Found!9052 (seekEntry!0 key!756 (_keys!10515 thiss!1141) (mask!27269 thiss!1141)))))))

(declare-fun b!943471 () Bool)

(declare-fun res!633947 () Bool)

(assert (=> b!943471 (=> (not res!633947) (not e!530459))))

(assert (=> b!943471 (= res!633947 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943472 () Bool)

(declare-fun res!633943 () Bool)

(assert (=> b!943472 (=> (not res!633943) (not e!530459))))

(declare-datatypes ((tuple2!13444 0))(
  ( (tuple2!13445 (_1!6733 (_ BitVec 64)) (_2!6733 V!32315)) )
))
(declare-datatypes ((List!19255 0))(
  ( (Nil!19252) (Cons!19251 (h!20401 tuple2!13444) (t!27570 List!19255)) )
))
(declare-datatypes ((ListLongMap!12141 0))(
  ( (ListLongMap!12142 (toList!6086 List!19255)) )
))
(declare-fun contains!5156 (ListLongMap!12141 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3320 (array!56994 array!56992 (_ BitVec 32) (_ BitVec 32) V!32315 V!32315 (_ BitVec 32) Int) ListLongMap!12141)

(assert (=> b!943472 (= res!633943 (contains!5156 (getCurrentListMap!3320 (_keys!10515 thiss!1141) (_values!5664 thiss!1141) (mask!27269 thiss!1141) (extraKeys!5373 thiss!1141) (zeroValue!5477 thiss!1141) (minValue!5477 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5641 thiss!1141)) key!756))))

(declare-fun b!943473 () Bool)

(declare-fun e!530460 () Bool)

(assert (=> b!943473 (= e!530460 tp_is_empty!20513)))

(declare-fun b!943474 () Bool)

(assert (=> b!943474 (= e!530458 (and e!530460 mapRes!32591))))

(declare-fun condMapEmpty!32591 () Bool)

(declare-fun mapDefault!32591 () ValueCell!9775)

