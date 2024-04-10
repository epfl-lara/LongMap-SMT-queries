; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80040 () Bool)

(assert start!80040)

(declare-fun b!941093 () Bool)

(declare-fun b_free!17895 () Bool)

(declare-fun b_next!17895 () Bool)

(assert (=> b!941093 (= b_free!17895 (not b_next!17895))))

(declare-fun tp!62160 () Bool)

(declare-fun b_and!29307 () Bool)

(assert (=> b!941093 (= tp!62160 b_and!29307)))

(declare-fun b!941091 () Bool)

(declare-fun e!529026 () Bool)

(assert (=> b!941091 (= e!529026 (not true))))

(declare-datatypes ((V!32169 0))(
  ( (V!32170 (val!10252 Int)) )
))
(declare-datatypes ((ValueCell!9720 0))(
  ( (ValueCellFull!9720 (v!12783 V!32169)) (EmptyCell!9720) )
))
(declare-datatypes ((array!56754 0))(
  ( (array!56755 (arr!27312 (Array (_ BitVec 32) ValueCell!9720)) (size!27773 (_ BitVec 32))) )
))
(declare-datatypes ((array!56756 0))(
  ( (array!56757 (arr!27313 (Array (_ BitVec 32) (_ BitVec 64))) (size!27774 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4590 0))(
  ( (LongMapFixedSize!4591 (defaultEntry!5586 Int) (mask!27141 (_ BitVec 32)) (extraKeys!5318 (_ BitVec 32)) (zeroValue!5422 V!32169) (minValue!5422 V!32169) (_size!2350 (_ BitVec 32)) (_keys!10436 array!56756) (_values!5609 array!56754) (_vacant!2350 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4590)

(declare-datatypes ((SeekEntryResult!9015 0))(
  ( (MissingZero!9015 (index!38431 (_ BitVec 32))) (Found!9015 (index!38432 (_ BitVec 32))) (Intermediate!9015 (undefined!9827 Bool) (index!38433 (_ BitVec 32)) (x!80732 (_ BitVec 32))) (Undefined!9015) (MissingVacant!9015 (index!38434 (_ BitVec 32))) )
))
(declare-fun lt!424910 () SeekEntryResult!9015)

(declare-datatypes ((tuple2!13402 0))(
  ( (tuple2!13403 (_1!6712 (_ BitVec 64)) (_2!6712 V!32169)) )
))
(declare-datatypes ((List!19202 0))(
  ( (Nil!19199) (Cons!19198 (h!20344 tuple2!13402) (t!27517 List!19202)) )
))
(declare-datatypes ((ListLongMap!12099 0))(
  ( (ListLongMap!12100 (toList!6065 List!19202)) )
))
(declare-fun contains!5129 (ListLongMap!12099 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3299 (array!56756 array!56754 (_ BitVec 32) (_ BitVec 32) V!32169 V!32169 (_ BitVec 32) Int) ListLongMap!12099)

(assert (=> b!941091 (contains!5129 (getCurrentListMap!3299 (_keys!10436 thiss!1141) (_values!5609 thiss!1141) (mask!27141 thiss!1141) (extraKeys!5318 thiss!1141) (zeroValue!5422 thiss!1141) (minValue!5422 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5586 thiss!1141)) (select (arr!27313 (_keys!10436 thiss!1141)) (index!38432 lt!424910)))))

(declare-datatypes ((Unit!31796 0))(
  ( (Unit!31797) )
))
(declare-fun lt!424912 () Unit!31796)

(declare-fun lemmaValidKeyInArrayIsInListMap!264 (array!56756 array!56754 (_ BitVec 32) (_ BitVec 32) V!32169 V!32169 (_ BitVec 32) Int) Unit!31796)

(assert (=> b!941091 (= lt!424912 (lemmaValidKeyInArrayIsInListMap!264 (_keys!10436 thiss!1141) (_values!5609 thiss!1141) (mask!27141 thiss!1141) (extraKeys!5318 thiss!1141) (zeroValue!5422 thiss!1141) (minValue!5422 thiss!1141) (index!38432 lt!424910) (defaultEntry!5586 thiss!1141)))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941091 (arrayContainsKey!0 (_keys!10436 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!424911 () Unit!31796)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56756 (_ BitVec 64) (_ BitVec 32)) Unit!31796)

(assert (=> b!941091 (= lt!424911 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10436 thiss!1141) key!756 (index!38432 lt!424910)))))

(declare-fun res!632737 () Bool)

(declare-fun e!529029 () Bool)

(assert (=> start!80040 (=> (not res!632737) (not e!529029))))

(declare-fun valid!1758 (LongMapFixedSize!4590) Bool)

(assert (=> start!80040 (= res!632737 (valid!1758 thiss!1141))))

(assert (=> start!80040 e!529029))

(declare-fun e!529025 () Bool)

(assert (=> start!80040 e!529025))

(assert (=> start!80040 true))

(declare-fun b!941092 () Bool)

(declare-fun e!529028 () Bool)

(declare-fun tp_is_empty!20403 () Bool)

(assert (=> b!941092 (= e!529028 tp_is_empty!20403)))

(declare-fun mapIsEmpty!32395 () Bool)

(declare-fun mapRes!32395 () Bool)

(assert (=> mapIsEmpty!32395 mapRes!32395))

(declare-fun mapNonEmpty!32395 () Bool)

(declare-fun tp!62159 () Bool)

(assert (=> mapNonEmpty!32395 (= mapRes!32395 (and tp!62159 e!529028))))

(declare-fun mapValue!32395 () ValueCell!9720)

(declare-fun mapRest!32395 () (Array (_ BitVec 32) ValueCell!9720))

(declare-fun mapKey!32395 () (_ BitVec 32))

(assert (=> mapNonEmpty!32395 (= (arr!27312 (_values!5609 thiss!1141)) (store mapRest!32395 mapKey!32395 mapValue!32395))))

(declare-fun e!529027 () Bool)

(declare-fun array_inv!21226 (array!56756) Bool)

(declare-fun array_inv!21227 (array!56754) Bool)

(assert (=> b!941093 (= e!529025 (and tp!62160 tp_is_empty!20403 (array_inv!21226 (_keys!10436 thiss!1141)) (array_inv!21227 (_values!5609 thiss!1141)) e!529027))))

(declare-fun b!941094 () Bool)

(declare-fun res!632736 () Bool)

(assert (=> b!941094 (=> (not res!632736) (not e!529029))))

(assert (=> b!941094 (= res!632736 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941095 () Bool)

(assert (=> b!941095 (= e!529029 e!529026)))

(declare-fun res!632735 () Bool)

(assert (=> b!941095 (=> (not res!632735) (not e!529026))))

(get-info :version)

(assert (=> b!941095 (= res!632735 ((_ is Found!9015) lt!424910))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56756 (_ BitVec 32)) SeekEntryResult!9015)

(assert (=> b!941095 (= lt!424910 (seekEntry!0 key!756 (_keys!10436 thiss!1141) (mask!27141 thiss!1141)))))

(declare-fun b!941096 () Bool)

(declare-fun e!529024 () Bool)

(assert (=> b!941096 (= e!529027 (and e!529024 mapRes!32395))))

(declare-fun condMapEmpty!32395 () Bool)

(declare-fun mapDefault!32395 () ValueCell!9720)

(assert (=> b!941096 (= condMapEmpty!32395 (= (arr!27312 (_values!5609 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9720)) mapDefault!32395)))))

(declare-fun b!941097 () Bool)

(assert (=> b!941097 (= e!529024 tp_is_empty!20403)))

(assert (= (and start!80040 res!632737) b!941094))

(assert (= (and b!941094 res!632736) b!941095))

(assert (= (and b!941095 res!632735) b!941091))

(assert (= (and b!941096 condMapEmpty!32395) mapIsEmpty!32395))

(assert (= (and b!941096 (not condMapEmpty!32395)) mapNonEmpty!32395))

(assert (= (and mapNonEmpty!32395 ((_ is ValueCellFull!9720) mapValue!32395)) b!941092))

(assert (= (and b!941096 ((_ is ValueCellFull!9720) mapDefault!32395)) b!941097))

(assert (= b!941093 b!941096))

(assert (= start!80040 b!941093))

(declare-fun m!876335 () Bool)

(assert (=> start!80040 m!876335))

(declare-fun m!876337 () Bool)

(assert (=> mapNonEmpty!32395 m!876337))

(declare-fun m!876339 () Bool)

(assert (=> b!941091 m!876339))

(declare-fun m!876341 () Bool)

(assert (=> b!941091 m!876341))

(declare-fun m!876343 () Bool)

(assert (=> b!941091 m!876343))

(declare-fun m!876345 () Bool)

(assert (=> b!941091 m!876345))

(declare-fun m!876347 () Bool)

(assert (=> b!941091 m!876347))

(declare-fun m!876349 () Bool)

(assert (=> b!941091 m!876349))

(assert (=> b!941091 m!876343))

(assert (=> b!941091 m!876341))

(declare-fun m!876351 () Bool)

(assert (=> b!941093 m!876351))

(declare-fun m!876353 () Bool)

(assert (=> b!941093 m!876353))

(declare-fun m!876355 () Bool)

(assert (=> b!941095 m!876355))

(check-sat (not b!941091) tp_is_empty!20403 (not mapNonEmpty!32395) (not b!941093) (not b_next!17895) (not start!80040) b_and!29307 (not b!941095))
(check-sat b_and!29307 (not b_next!17895))
