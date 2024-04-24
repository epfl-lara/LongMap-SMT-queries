; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80538 () Bool)

(assert start!80538)

(declare-fun b!944797 () Bool)

(declare-fun b_free!18013 () Bool)

(declare-fun b_next!18013 () Bool)

(assert (=> b!944797 (= b_free!18013 (not b_next!18013))))

(declare-fun tp!62549 () Bool)

(declare-fun b_and!29441 () Bool)

(assert (=> b!944797 (= tp!62549 b_and!29441)))

(declare-fun b!944792 () Bool)

(declare-fun res!634466 () Bool)

(declare-fun e!531302 () Bool)

(assert (=> b!944792 (=> (not res!634466) (not e!531302))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32327 0))(
  ( (V!32328 (val!10311 Int)) )
))
(declare-datatypes ((ValueCell!9779 0))(
  ( (ValueCellFull!9779 (v!12840 V!32327)) (EmptyCell!9779) )
))
(declare-datatypes ((array!57061 0))(
  ( (array!57062 (arr!27451 (Array (_ BitVec 32) ValueCell!9779)) (size!27918 (_ BitVec 32))) )
))
(declare-datatypes ((array!57063 0))(
  ( (array!57064 (arr!27452 (Array (_ BitVec 32) (_ BitVec 64))) (size!27919 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4708 0))(
  ( (LongMapFixedSize!4709 (defaultEntry!5649 Int) (mask!27330 (_ BitVec 32)) (extraKeys!5381 (_ BitVec 32)) (zeroValue!5485 V!32327) (minValue!5485 V!32327) (_size!2409 (_ BitVec 32)) (_keys!10555 array!57063) (_values!5672 array!57061) (_vacant!2409 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4708)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9015 0))(
  ( (MissingZero!9015 (index!38431 (_ BitVec 32))) (Found!9015 (index!38432 (_ BitVec 32))) (Intermediate!9015 (undefined!9827 Bool) (index!38433 (_ BitVec 32)) (x!81032 (_ BitVec 32))) (Undefined!9015) (MissingVacant!9015 (index!38434 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57063 (_ BitVec 32)) SeekEntryResult!9015)

(assert (=> b!944792 (= res!634466 (not ((_ is Found!9015) (seekEntry!0 key!756 (_keys!10555 thiss!1141) (mask!27330 thiss!1141)))))))

(declare-fun b!944793 () Bool)

(declare-fun res!634469 () Bool)

(assert (=> b!944793 (=> (not res!634469) (not e!531302))))

(assert (=> b!944793 (= res!634469 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!634467 () Bool)

(assert (=> start!80538 (=> (not res!634467) (not e!531302))))

(declare-fun valid!1808 (LongMapFixedSize!4708) Bool)

(assert (=> start!80538 (= res!634467 (valid!1808 thiss!1141))))

(assert (=> start!80538 e!531302))

(declare-fun e!531304 () Bool)

(assert (=> start!80538 e!531304))

(assert (=> start!80538 true))

(declare-fun b!944794 () Bool)

(declare-fun e!531306 () Bool)

(declare-fun tp_is_empty!20521 () Bool)

(assert (=> b!944794 (= e!531306 tp_is_empty!20521)))

(declare-fun mapIsEmpty!32607 () Bool)

(declare-fun mapRes!32607 () Bool)

(assert (=> mapIsEmpty!32607 mapRes!32607))

(declare-fun b!944795 () Bool)

(assert (=> b!944795 (= e!531302 (not true))))

(declare-fun arrayContainsKey!0 (array!57063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944795 (arrayContainsKey!0 (_keys!10555 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31798 0))(
  ( (Unit!31799) )
))
(declare-fun lt!425833 () Unit!31798)

(declare-fun lemmaKeyInListMapIsInArray!290 (array!57063 array!57061 (_ BitVec 32) (_ BitVec 32) V!32327 V!32327 (_ BitVec 64) Int) Unit!31798)

(assert (=> b!944795 (= lt!425833 (lemmaKeyInListMapIsInArray!290 (_keys!10555 thiss!1141) (_values!5672 thiss!1141) (mask!27330 thiss!1141) (extraKeys!5381 thiss!1141) (zeroValue!5485 thiss!1141) (minValue!5485 thiss!1141) key!756 (defaultEntry!5649 thiss!1141)))))

(declare-fun b!944796 () Bool)

(declare-fun e!531307 () Bool)

(declare-fun e!531305 () Bool)

(assert (=> b!944796 (= e!531307 (and e!531305 mapRes!32607))))

(declare-fun condMapEmpty!32607 () Bool)

(declare-fun mapDefault!32607 () ValueCell!9779)

(assert (=> b!944796 (= condMapEmpty!32607 (= (arr!27451 (_values!5672 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9779)) mapDefault!32607)))))

(declare-fun mapNonEmpty!32607 () Bool)

(declare-fun tp!62550 () Bool)

(assert (=> mapNonEmpty!32607 (= mapRes!32607 (and tp!62550 e!531306))))

(declare-fun mapKey!32607 () (_ BitVec 32))

(declare-fun mapValue!32607 () ValueCell!9779)

(declare-fun mapRest!32607 () (Array (_ BitVec 32) ValueCell!9779))

(assert (=> mapNonEmpty!32607 (= (arr!27451 (_values!5672 thiss!1141)) (store mapRest!32607 mapKey!32607 mapValue!32607))))

(declare-fun array_inv!21416 (array!57063) Bool)

(declare-fun array_inv!21417 (array!57061) Bool)

(assert (=> b!944797 (= e!531304 (and tp!62549 tp_is_empty!20521 (array_inv!21416 (_keys!10555 thiss!1141)) (array_inv!21417 (_values!5672 thiss!1141)) e!531307))))

(declare-fun b!944798 () Bool)

(assert (=> b!944798 (= e!531305 tp_is_empty!20521)))

(declare-fun b!944799 () Bool)

(declare-fun res!634468 () Bool)

(assert (=> b!944799 (=> (not res!634468) (not e!531302))))

(declare-datatypes ((tuple2!13436 0))(
  ( (tuple2!13437 (_1!6729 (_ BitVec 64)) (_2!6729 V!32327)) )
))
(declare-datatypes ((List!19247 0))(
  ( (Nil!19244) (Cons!19243 (h!20400 tuple2!13436) (t!27556 List!19247)) )
))
(declare-datatypes ((ListLongMap!12135 0))(
  ( (ListLongMap!12136 (toList!6083 List!19247)) )
))
(declare-fun contains!5166 (ListLongMap!12135 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3317 (array!57063 array!57061 (_ BitVec 32) (_ BitVec 32) V!32327 V!32327 (_ BitVec 32) Int) ListLongMap!12135)

(assert (=> b!944799 (= res!634468 (contains!5166 (getCurrentListMap!3317 (_keys!10555 thiss!1141) (_values!5672 thiss!1141) (mask!27330 thiss!1141) (extraKeys!5381 thiss!1141) (zeroValue!5485 thiss!1141) (minValue!5485 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5649 thiss!1141)) key!756))))

(assert (= (and start!80538 res!634467) b!944793))

(assert (= (and b!944793 res!634469) b!944792))

(assert (= (and b!944792 res!634466) b!944799))

(assert (= (and b!944799 res!634468) b!944795))

(assert (= (and b!944796 condMapEmpty!32607) mapIsEmpty!32607))

(assert (= (and b!944796 (not condMapEmpty!32607)) mapNonEmpty!32607))

(assert (= (and mapNonEmpty!32607 ((_ is ValueCellFull!9779) mapValue!32607)) b!944794))

(assert (= (and b!944796 ((_ is ValueCellFull!9779) mapDefault!32607)) b!944798))

(assert (= b!944797 b!944796))

(assert (= start!80538 b!944797))

(declare-fun m!879301 () Bool)

(assert (=> mapNonEmpty!32607 m!879301))

(declare-fun m!879303 () Bool)

(assert (=> b!944797 m!879303))

(declare-fun m!879305 () Bool)

(assert (=> b!944797 m!879305))

(declare-fun m!879307 () Bool)

(assert (=> start!80538 m!879307))

(declare-fun m!879309 () Bool)

(assert (=> b!944799 m!879309))

(assert (=> b!944799 m!879309))

(declare-fun m!879311 () Bool)

(assert (=> b!944799 m!879311))

(declare-fun m!879313 () Bool)

(assert (=> b!944792 m!879313))

(declare-fun m!879315 () Bool)

(assert (=> b!944795 m!879315))

(declare-fun m!879317 () Bool)

(assert (=> b!944795 m!879317))

(check-sat (not b!944792) (not b!944795) (not mapNonEmpty!32607) (not b!944799) b_and!29441 tp_is_empty!20521 (not b_next!18013) (not b!944797) (not start!80538))
(check-sat b_and!29441 (not b_next!18013))
