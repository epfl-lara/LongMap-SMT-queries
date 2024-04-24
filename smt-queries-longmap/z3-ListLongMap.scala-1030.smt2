; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21866 () Bool)

(assert start!21866)

(declare-fun b!220710 () Bool)

(declare-fun b_free!5929 () Bool)

(declare-fun b_next!5929 () Bool)

(assert (=> b!220710 (= b_free!5929 (not b_next!5929))))

(declare-fun tp!20928 () Bool)

(declare-fun b_and!12841 () Bool)

(assert (=> b!220710 (= tp!20928 b_and!12841)))

(declare-fun b!220701 () Bool)

(declare-fun e!143482 () Bool)

(declare-fun tp_is_empty!5791 () Bool)

(assert (=> b!220701 (= e!143482 tp_is_empty!5791)))

(declare-fun b!220702 () Bool)

(declare-fun res!108238 () Bool)

(declare-datatypes ((V!7369 0))(
  ( (V!7370 (val!2940 Int)) )
))
(declare-datatypes ((ValueCell!2552 0))(
  ( (ValueCellFull!2552 (v!4961 V!7369)) (EmptyCell!2552) )
))
(declare-datatypes ((array!10823 0))(
  ( (array!10824 (arr!5131 (Array (_ BitVec 32) ValueCell!2552)) (size!5464 (_ BitVec 32))) )
))
(declare-datatypes ((array!10825 0))(
  ( (array!10826 (arr!5132 (Array (_ BitVec 32) (_ BitVec 64))) (size!5465 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3004 0))(
  ( (LongMapFixedSize!3005 (defaultEntry!4161 Int) (mask!9965 (_ BitVec 32)) (extraKeys!3898 (_ BitVec 32)) (zeroValue!4002 V!7369) (minValue!4002 V!7369) (_size!1551 (_ BitVec 32)) (_keys!6215 array!10825) (_values!4144 array!10823) (_vacant!1551 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3004)

(declare-datatypes ((SeekEntryResult!789 0))(
  ( (MissingZero!789 (index!5326 (_ BitVec 32))) (Found!789 (index!5327 (_ BitVec 32))) (Intermediate!789 (undefined!1601 Bool) (index!5328 (_ BitVec 32)) (x!22945 (_ BitVec 32))) (Undefined!789) (MissingVacant!789 (index!5329 (_ BitVec 32))) )
))
(declare-fun lt!112288 () SeekEntryResult!789)

(assert (=> b!220702 (= res!108238 (= (select (arr!5132 (_keys!6215 thiss!1504)) (index!5329 lt!112288)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143487 () Bool)

(assert (=> b!220702 (=> (not res!108238) (not e!143487))))

(declare-fun bm!20606 () Bool)

(declare-fun call!20610 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20606 (= call!20610 (arrayContainsKey!0 (_keys!6215 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220703 () Bool)

(declare-fun res!108228 () Bool)

(declare-fun e!143486 () Bool)

(assert (=> b!220703 (=> (not res!108228) (not e!143486))))

(assert (=> b!220703 (= res!108228 (= (select (arr!5132 (_keys!6215 thiss!1504)) (index!5326 lt!112288)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220704 () Bool)

(declare-datatypes ((Unit!6558 0))(
  ( (Unit!6559) )
))
(declare-fun e!143485 () Unit!6558)

(declare-fun Unit!6560 () Unit!6558)

(assert (=> b!220704 (= e!143485 Unit!6560)))

(declare-fun lt!112290 () Unit!6558)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!202 (array!10825 array!10823 (_ BitVec 32) (_ BitVec 32) V!7369 V!7369 (_ BitVec 64) Int) Unit!6558)

(assert (=> b!220704 (= lt!112290 (lemmaInListMapThenSeekEntryOrOpenFindsIt!202 (_keys!6215 thiss!1504) (_values!4144 thiss!1504) (mask!9965 thiss!1504) (extraKeys!3898 thiss!1504) (zeroValue!4002 thiss!1504) (minValue!4002 thiss!1504) key!932 (defaultEntry!4161 thiss!1504)))))

(assert (=> b!220704 false))

(declare-fun mapIsEmpty!9856 () Bool)

(declare-fun mapRes!9856 () Bool)

(assert (=> mapIsEmpty!9856 mapRes!9856))

(declare-fun b!220705 () Bool)

(declare-fun res!108237 () Bool)

(declare-fun e!143481 () Bool)

(assert (=> b!220705 (=> (not res!108237) (not e!143481))))

(assert (=> b!220705 (= res!108237 (arrayContainsKey!0 (_keys!6215 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220706 () Bool)

(declare-fun res!108232 () Bool)

(declare-fun e!143488 () Bool)

(assert (=> b!220706 (=> (not res!108232) (not e!143488))))

(assert (=> b!220706 (= res!108232 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220707 () Bool)

(declare-fun res!108233 () Bool)

(assert (=> b!220707 (=> (not res!108233) (not e!143481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10825 (_ BitVec 32)) Bool)

(assert (=> b!220707 (= res!108233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6215 thiss!1504) (mask!9965 thiss!1504)))))

(declare-fun bm!20607 () Bool)

(declare-fun call!20609 () Bool)

(declare-fun c!36726 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20607 (= call!20609 (inRange!0 (ite c!36726 (index!5326 lt!112288) (index!5329 lt!112288)) (mask!9965 thiss!1504)))))

(declare-fun res!108230 () Bool)

(assert (=> start!21866 (=> (not res!108230) (not e!143488))))

(declare-fun valid!1222 (LongMapFixedSize!3004) Bool)

(assert (=> start!21866 (= res!108230 (valid!1222 thiss!1504))))

(assert (=> start!21866 e!143488))

(declare-fun e!143477 () Bool)

(assert (=> start!21866 e!143477))

(assert (=> start!21866 true))

(declare-fun b!220708 () Bool)

(declare-fun res!108229 () Bool)

(assert (=> b!220708 (=> (not res!108229) (not e!143481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220708 (= res!108229 (validMask!0 (mask!9965 thiss!1504)))))

(declare-fun b!220709 () Bool)

(declare-fun e!143484 () Bool)

(get-info :version)

(assert (=> b!220709 (= e!143484 ((_ is Undefined!789) lt!112288))))

(declare-fun e!143478 () Bool)

(declare-fun array_inv!3367 (array!10825) Bool)

(declare-fun array_inv!3368 (array!10823) Bool)

(assert (=> b!220710 (= e!143477 (and tp!20928 tp_is_empty!5791 (array_inv!3367 (_keys!6215 thiss!1504)) (array_inv!3368 (_values!4144 thiss!1504)) e!143478))))

(declare-fun b!220711 () Bool)

(declare-fun lt!112287 () Unit!6558)

(assert (=> b!220711 (= e!143485 lt!112287)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!197 (array!10825 array!10823 (_ BitVec 32) (_ BitVec 32) V!7369 V!7369 (_ BitVec 64) Int) Unit!6558)

(assert (=> b!220711 (= lt!112287 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!197 (_keys!6215 thiss!1504) (_values!4144 thiss!1504) (mask!9965 thiss!1504) (extraKeys!3898 thiss!1504) (zeroValue!4002 thiss!1504) (minValue!4002 thiss!1504) key!932 (defaultEntry!4161 thiss!1504)))))

(assert (=> b!220711 (= c!36726 ((_ is MissingZero!789) lt!112288))))

(declare-fun e!143479 () Bool)

(assert (=> b!220711 e!143479))

(declare-fun b!220712 () Bool)

(assert (=> b!220712 (= e!143484 e!143487)))

(declare-fun res!108227 () Bool)

(assert (=> b!220712 (= res!108227 call!20609)))

(assert (=> b!220712 (=> (not res!108227) (not e!143487))))

(declare-fun b!220713 () Bool)

(declare-fun e!143480 () Bool)

(assert (=> b!220713 (= e!143478 (and e!143480 mapRes!9856))))

(declare-fun condMapEmpty!9856 () Bool)

(declare-fun mapDefault!9856 () ValueCell!2552)

(assert (=> b!220713 (= condMapEmpty!9856 (= (arr!5131 (_values!4144 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2552)) mapDefault!9856)))))

(declare-fun mapNonEmpty!9856 () Bool)

(declare-fun tp!20929 () Bool)

(assert (=> mapNonEmpty!9856 (= mapRes!9856 (and tp!20929 e!143482))))

(declare-fun mapKey!9856 () (_ BitVec 32))

(declare-fun mapValue!9856 () ValueCell!2552)

(declare-fun mapRest!9856 () (Array (_ BitVec 32) ValueCell!2552))

(assert (=> mapNonEmpty!9856 (= (arr!5131 (_values!4144 thiss!1504)) (store mapRest!9856 mapKey!9856 mapValue!9856))))

(declare-fun b!220714 () Bool)

(declare-fun e!143489 () Bool)

(assert (=> b!220714 (= e!143489 e!143481)))

(declare-fun res!108236 () Bool)

(assert (=> b!220714 (=> (not res!108236) (not e!143481))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220714 (= res!108236 (inRange!0 index!297 (mask!9965 thiss!1504)))))

(declare-fun lt!112291 () Unit!6558)

(assert (=> b!220714 (= lt!112291 e!143485)))

(declare-fun c!36725 () Bool)

(declare-datatypes ((tuple2!4280 0))(
  ( (tuple2!4281 (_1!2151 (_ BitVec 64)) (_2!2151 V!7369)) )
))
(declare-datatypes ((List!3176 0))(
  ( (Nil!3173) (Cons!3172 (h!3820 tuple2!4280) (t!8127 List!3176)) )
))
(declare-datatypes ((ListLongMap!3195 0))(
  ( (ListLongMap!3196 (toList!1613 List!3176)) )
))
(declare-fun contains!1470 (ListLongMap!3195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1145 (array!10825 array!10823 (_ BitVec 32) (_ BitVec 32) V!7369 V!7369 (_ BitVec 32) Int) ListLongMap!3195)

(assert (=> b!220714 (= c!36725 (contains!1470 (getCurrentListMap!1145 (_keys!6215 thiss!1504) (_values!4144 thiss!1504) (mask!9965 thiss!1504) (extraKeys!3898 thiss!1504) (zeroValue!4002 thiss!1504) (minValue!4002 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4161 thiss!1504)) key!932))))

(declare-fun b!220715 () Bool)

(assert (=> b!220715 (= e!143487 (not call!20610))))

(declare-fun b!220716 () Bool)

(declare-fun res!108234 () Bool)

(assert (=> b!220716 (=> (not res!108234) (not e!143486))))

(assert (=> b!220716 (= res!108234 call!20609)))

(assert (=> b!220716 (= e!143479 e!143486)))

(declare-fun b!220717 () Bool)

(assert (=> b!220717 (= e!143488 e!143489)))

(declare-fun res!108235 () Bool)

(assert (=> b!220717 (=> (not res!108235) (not e!143489))))

(assert (=> b!220717 (= res!108235 (or (= lt!112288 (MissingZero!789 index!297)) (= lt!112288 (MissingVacant!789 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10825 (_ BitVec 32)) SeekEntryResult!789)

(assert (=> b!220717 (= lt!112288 (seekEntryOrOpen!0 key!932 (_keys!6215 thiss!1504) (mask!9965 thiss!1504)))))

(declare-fun b!220718 () Bool)

(assert (=> b!220718 (= e!143486 (not call!20610))))

(declare-fun b!220719 () Bool)

(assert (=> b!220719 (= e!143481 false)))

(declare-fun lt!112289 () Bool)

(declare-datatypes ((List!3177 0))(
  ( (Nil!3174) (Cons!3173 (h!3821 (_ BitVec 64)) (t!8128 List!3177)) )
))
(declare-fun arrayNoDuplicates!0 (array!10825 (_ BitVec 32) List!3177) Bool)

(assert (=> b!220719 (= lt!112289 (arrayNoDuplicates!0 (_keys!6215 thiss!1504) #b00000000000000000000000000000000 Nil!3174))))

(declare-fun b!220720 () Bool)

(declare-fun res!108231 () Bool)

(assert (=> b!220720 (=> (not res!108231) (not e!143481))))

(assert (=> b!220720 (= res!108231 (and (= (size!5464 (_values!4144 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9965 thiss!1504))) (= (size!5465 (_keys!6215 thiss!1504)) (size!5464 (_values!4144 thiss!1504))) (bvsge (mask!9965 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3898 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3898 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!220721 () Bool)

(declare-fun c!36727 () Bool)

(assert (=> b!220721 (= c!36727 ((_ is MissingVacant!789) lt!112288))))

(assert (=> b!220721 (= e!143479 e!143484)))

(declare-fun b!220722 () Bool)

(assert (=> b!220722 (= e!143480 tp_is_empty!5791)))

(assert (= (and start!21866 res!108230) b!220706))

(assert (= (and b!220706 res!108232) b!220717))

(assert (= (and b!220717 res!108235) b!220714))

(assert (= (and b!220714 c!36725) b!220704))

(assert (= (and b!220714 (not c!36725)) b!220711))

(assert (= (and b!220711 c!36726) b!220716))

(assert (= (and b!220711 (not c!36726)) b!220721))

(assert (= (and b!220716 res!108234) b!220703))

(assert (= (and b!220703 res!108228) b!220718))

(assert (= (and b!220721 c!36727) b!220712))

(assert (= (and b!220721 (not c!36727)) b!220709))

(assert (= (and b!220712 res!108227) b!220702))

(assert (= (and b!220702 res!108238) b!220715))

(assert (= (or b!220716 b!220712) bm!20607))

(assert (= (or b!220718 b!220715) bm!20606))

(assert (= (and b!220714 res!108236) b!220705))

(assert (= (and b!220705 res!108237) b!220708))

(assert (= (and b!220708 res!108229) b!220720))

(assert (= (and b!220720 res!108231) b!220707))

(assert (= (and b!220707 res!108233) b!220719))

(assert (= (and b!220713 condMapEmpty!9856) mapIsEmpty!9856))

(assert (= (and b!220713 (not condMapEmpty!9856)) mapNonEmpty!9856))

(assert (= (and mapNonEmpty!9856 ((_ is ValueCellFull!2552) mapValue!9856)) b!220701))

(assert (= (and b!220713 ((_ is ValueCellFull!2552) mapDefault!9856)) b!220722))

(assert (= b!220710 b!220713))

(assert (= start!21866 b!220710))

(declare-fun m!245857 () Bool)

(assert (=> b!220711 m!245857))

(declare-fun m!245859 () Bool)

(assert (=> bm!20607 m!245859))

(declare-fun m!245861 () Bool)

(assert (=> mapNonEmpty!9856 m!245861))

(declare-fun m!245863 () Bool)

(assert (=> bm!20606 m!245863))

(declare-fun m!245865 () Bool)

(assert (=> start!21866 m!245865))

(declare-fun m!245867 () Bool)

(assert (=> b!220710 m!245867))

(declare-fun m!245869 () Bool)

(assert (=> b!220710 m!245869))

(declare-fun m!245871 () Bool)

(assert (=> b!220704 m!245871))

(declare-fun m!245873 () Bool)

(assert (=> b!220702 m!245873))

(declare-fun m!245875 () Bool)

(assert (=> b!220719 m!245875))

(declare-fun m!245877 () Bool)

(assert (=> b!220708 m!245877))

(declare-fun m!245879 () Bool)

(assert (=> b!220703 m!245879))

(declare-fun m!245881 () Bool)

(assert (=> b!220707 m!245881))

(assert (=> b!220705 m!245863))

(declare-fun m!245883 () Bool)

(assert (=> b!220714 m!245883))

(declare-fun m!245885 () Bool)

(assert (=> b!220714 m!245885))

(assert (=> b!220714 m!245885))

(declare-fun m!245887 () Bool)

(assert (=> b!220714 m!245887))

(declare-fun m!245889 () Bool)

(assert (=> b!220717 m!245889))

(check-sat (not b!220719) (not b!220711) (not bm!20606) (not b_next!5929) (not mapNonEmpty!9856) tp_is_empty!5791 (not b!220705) (not b!220704) b_and!12841 (not b!220707) (not b!220717) (not start!21866) (not b!220710) (not bm!20607) (not b!220708) (not b!220714))
(check-sat b_and!12841 (not b_next!5929))
