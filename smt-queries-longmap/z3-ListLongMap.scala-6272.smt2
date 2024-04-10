; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80256 () Bool)

(assert start!80256)

(declare-fun b!942649 () Bool)

(declare-fun b_free!17955 () Bool)

(declare-fun b_next!17955 () Bool)

(assert (=> b!942649 (= b_free!17955 (not b_next!17955))))

(declare-fun tp!62370 () Bool)

(declare-fun b_and!29367 () Bool)

(assert (=> b!942649 (= tp!62370 b_and!29367)))

(declare-fun b!942640 () Bool)

(declare-fun res!633420 () Bool)

(declare-fun e!530007 () Bool)

(assert (=> b!942640 (=> (not res!633420) (not e!530007))))

(declare-datatypes ((V!32249 0))(
  ( (V!32250 (val!10282 Int)) )
))
(declare-datatypes ((ValueCell!9750 0))(
  ( (ValueCellFull!9750 (v!12813 V!32249)) (EmptyCell!9750) )
))
(declare-datatypes ((array!56892 0))(
  ( (array!56893 (arr!27372 (Array (_ BitVec 32) ValueCell!9750)) (size!27837 (_ BitVec 32))) )
))
(declare-datatypes ((array!56894 0))(
  ( (array!56895 (arr!27373 (Array (_ BitVec 32) (_ BitVec 64))) (size!27838 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4650 0))(
  ( (LongMapFixedSize!4651 (defaultEntry!5616 Int) (mask!27228 (_ BitVec 32)) (extraKeys!5348 (_ BitVec 32)) (zeroValue!5452 V!32249) (minValue!5452 V!32249) (_size!2380 (_ BitVec 32)) (_keys!10490 array!56894) (_values!5639 array!56892) (_vacant!2380 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4650)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56894 (_ BitVec 32)) Bool)

(assert (=> b!942640 (= res!633420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10490 thiss!1141) (mask!27228 thiss!1141)))))

(declare-fun b!942641 () Bool)

(declare-fun e!530008 () Bool)

(declare-fun tp_is_empty!20463 () Bool)

(assert (=> b!942641 (= e!530008 tp_is_empty!20463)))

(declare-fun b!942642 () Bool)

(assert (=> b!942642 (= e!530007 false)))

(declare-fun lt!425182 () Bool)

(declare-datatypes ((List!19217 0))(
  ( (Nil!19214) (Cons!19213 (h!20363 (_ BitVec 64)) (t!27532 List!19217)) )
))
(declare-fun arrayNoDuplicates!0 (array!56894 (_ BitVec 32) List!19217) Bool)

(assert (=> b!942642 (= lt!425182 (arrayNoDuplicates!0 (_keys!10490 thiss!1141) #b00000000000000000000000000000000 Nil!19214))))

(declare-fun b!942643 () Bool)

(declare-fun res!633421 () Bool)

(assert (=> b!942643 (=> (not res!633421) (not e!530007))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9034 0))(
  ( (MissingZero!9034 (index!38507 (_ BitVec 32))) (Found!9034 (index!38508 (_ BitVec 32))) (Intermediate!9034 (undefined!9846 Bool) (index!38509 (_ BitVec 32)) (x!80939 (_ BitVec 32))) (Undefined!9034) (MissingVacant!9034 (index!38510 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56894 (_ BitVec 32)) SeekEntryResult!9034)

(assert (=> b!942643 (= res!633421 (not ((_ is Found!9034) (seekEntry!0 key!756 (_keys!10490 thiss!1141) (mask!27228 thiss!1141)))))))

(declare-fun b!942644 () Bool)

(declare-fun e!530005 () Bool)

(assert (=> b!942644 (= e!530005 tp_is_empty!20463)))

(declare-fun b!942645 () Bool)

(declare-fun e!530009 () Bool)

(declare-fun mapRes!32516 () Bool)

(assert (=> b!942645 (= e!530009 (and e!530008 mapRes!32516))))

(declare-fun condMapEmpty!32516 () Bool)

(declare-fun mapDefault!32516 () ValueCell!9750)

(assert (=> b!942645 (= condMapEmpty!32516 (= (arr!27372 (_values!5639 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9750)) mapDefault!32516)))))

(declare-fun mapIsEmpty!32516 () Bool)

(assert (=> mapIsEmpty!32516 mapRes!32516))

(declare-fun res!633418 () Bool)

(assert (=> start!80256 (=> (not res!633418) (not e!530007))))

(declare-fun valid!1780 (LongMapFixedSize!4650) Bool)

(assert (=> start!80256 (= res!633418 (valid!1780 thiss!1141))))

(assert (=> start!80256 e!530007))

(declare-fun e!530010 () Bool)

(assert (=> start!80256 e!530010))

(assert (=> start!80256 true))

(declare-fun b!942646 () Bool)

(declare-fun res!633416 () Bool)

(assert (=> b!942646 (=> (not res!633416) (not e!530007))))

(assert (=> b!942646 (= res!633416 (and (= (size!27837 (_values!5639 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27228 thiss!1141))) (= (size!27838 (_keys!10490 thiss!1141)) (size!27837 (_values!5639 thiss!1141))) (bvsge (mask!27228 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5348 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5348 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942647 () Bool)

(declare-fun res!633422 () Bool)

(assert (=> b!942647 (=> (not res!633422) (not e!530007))))

(assert (=> b!942647 (= res!633422 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942648 () Bool)

(declare-fun res!633419 () Bool)

(assert (=> b!942648 (=> (not res!633419) (not e!530007))))

(declare-datatypes ((tuple2!13406 0))(
  ( (tuple2!13407 (_1!6714 (_ BitVec 64)) (_2!6714 V!32249)) )
))
(declare-datatypes ((List!19218 0))(
  ( (Nil!19215) (Cons!19214 (h!20364 tuple2!13406) (t!27533 List!19218)) )
))
(declare-datatypes ((ListLongMap!12103 0))(
  ( (ListLongMap!12104 (toList!6067 List!19218)) )
))
(declare-fun contains!5137 (ListLongMap!12103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3301 (array!56894 array!56892 (_ BitVec 32) (_ BitVec 32) V!32249 V!32249 (_ BitVec 32) Int) ListLongMap!12103)

(assert (=> b!942648 (= res!633419 (contains!5137 (getCurrentListMap!3301 (_keys!10490 thiss!1141) (_values!5639 thiss!1141) (mask!27228 thiss!1141) (extraKeys!5348 thiss!1141) (zeroValue!5452 thiss!1141) (minValue!5452 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5616 thiss!1141)) key!756))))

(declare-fun array_inv!21266 (array!56894) Bool)

(declare-fun array_inv!21267 (array!56892) Bool)

(assert (=> b!942649 (= e!530010 (and tp!62370 tp_is_empty!20463 (array_inv!21266 (_keys!10490 thiss!1141)) (array_inv!21267 (_values!5639 thiss!1141)) e!530009))))

(declare-fun b!942650 () Bool)

(declare-fun res!633417 () Bool)

(assert (=> b!942650 (=> (not res!633417) (not e!530007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942650 (= res!633417 (validMask!0 (mask!27228 thiss!1141)))))

(declare-fun mapNonEmpty!32516 () Bool)

(declare-fun tp!62371 () Bool)

(assert (=> mapNonEmpty!32516 (= mapRes!32516 (and tp!62371 e!530005))))

(declare-fun mapRest!32516 () (Array (_ BitVec 32) ValueCell!9750))

(declare-fun mapValue!32516 () ValueCell!9750)

(declare-fun mapKey!32516 () (_ BitVec 32))

(assert (=> mapNonEmpty!32516 (= (arr!27372 (_values!5639 thiss!1141)) (store mapRest!32516 mapKey!32516 mapValue!32516))))

(assert (= (and start!80256 res!633418) b!942647))

(assert (= (and b!942647 res!633422) b!942643))

(assert (= (and b!942643 res!633421) b!942648))

(assert (= (and b!942648 res!633419) b!942650))

(assert (= (and b!942650 res!633417) b!942646))

(assert (= (and b!942646 res!633416) b!942640))

(assert (= (and b!942640 res!633420) b!942642))

(assert (= (and b!942645 condMapEmpty!32516) mapIsEmpty!32516))

(assert (= (and b!942645 (not condMapEmpty!32516)) mapNonEmpty!32516))

(assert (= (and mapNonEmpty!32516 ((_ is ValueCellFull!9750) mapValue!32516)) b!942644))

(assert (= (and b!942645 ((_ is ValueCellFull!9750) mapDefault!32516)) b!942641))

(assert (= b!942649 b!942645))

(assert (= start!80256 b!942649))

(declare-fun m!877119 () Bool)

(assert (=> b!942648 m!877119))

(assert (=> b!942648 m!877119))

(declare-fun m!877121 () Bool)

(assert (=> b!942648 m!877121))

(declare-fun m!877123 () Bool)

(assert (=> mapNonEmpty!32516 m!877123))

(declare-fun m!877125 () Bool)

(assert (=> b!942640 m!877125))

(declare-fun m!877127 () Bool)

(assert (=> b!942642 m!877127))

(declare-fun m!877129 () Bool)

(assert (=> b!942650 m!877129))

(declare-fun m!877131 () Bool)

(assert (=> b!942643 m!877131))

(declare-fun m!877133 () Bool)

(assert (=> start!80256 m!877133))

(declare-fun m!877135 () Bool)

(assert (=> b!942649 m!877135))

(declare-fun m!877137 () Bool)

(assert (=> b!942649 m!877137))

(check-sat (not b_next!17955) (not b!942642) (not b!942650) b_and!29367 (not b!942640) (not mapNonEmpty!32516) (not b!942648) (not b!942643) tp_is_empty!20463 (not b!942649) (not start!80256))
(check-sat b_and!29367 (not b_next!17955))
