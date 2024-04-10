; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76392 () Bool)

(assert start!76392)

(declare-fun b!896104 () Bool)

(declare-fun b_free!15939 () Bool)

(declare-fun b_next!15939 () Bool)

(assert (=> b!896104 (= b_free!15939 (not b_next!15939))))

(declare-fun tp!55842 () Bool)

(declare-fun b_and!26231 () Bool)

(assert (=> b!896104 (= tp!55842 b_and!26231)))

(declare-fun mapIsEmpty!29011 () Bool)

(declare-fun mapRes!29011 () Bool)

(assert (=> mapIsEmpty!29011 mapRes!29011))

(declare-fun b!896102 () Bool)

(declare-fun e!500808 () Bool)

(declare-fun tp_is_empty!18267 () Bool)

(assert (=> b!896102 (= e!500808 tp_is_empty!18267)))

(declare-fun b!896103 () Bool)

(declare-fun e!500811 () Bool)

(assert (=> b!896103 (= e!500811 tp_is_empty!18267)))

(declare-fun e!500810 () Bool)

(declare-fun e!500807 () Bool)

(declare-datatypes ((array!52546 0))(
  ( (array!52547 (arr!25263 (Array (_ BitVec 32) (_ BitVec 64))) (size!25713 (_ BitVec 32))) )
))
(declare-datatypes ((V!29321 0))(
  ( (V!29322 (val!9184 Int)) )
))
(declare-datatypes ((ValueCell!8652 0))(
  ( (ValueCellFull!8652 (v!11674 V!29321)) (EmptyCell!8652) )
))
(declare-datatypes ((array!52548 0))(
  ( (array!52549 (arr!25264 (Array (_ BitVec 32) ValueCell!8652)) (size!25714 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4320 0))(
  ( (LongMapFixedSize!4321 (defaultEntry!5372 Int) (mask!25996 (_ BitVec 32)) (extraKeys!5070 (_ BitVec 32)) (zeroValue!5174 V!29321) (minValue!5174 V!29321) (_size!2215 (_ BitVec 32)) (_keys!10097 array!52546) (_values!5361 array!52548) (_vacant!2215 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4320)

(declare-fun array_inv!19832 (array!52546) Bool)

(declare-fun array_inv!19833 (array!52548) Bool)

(assert (=> b!896104 (= e!500807 (and tp!55842 tp_is_empty!18267 (array_inv!19832 (_keys!10097 thiss!1181)) (array_inv!19833 (_values!5361 thiss!1181)) e!500810))))

(declare-fun b!896105 () Bool)

(declare-fun res!606003 () Bool)

(declare-fun e!500809 () Bool)

(assert (=> b!896105 (=> (not res!606003) (not e!500809))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!896105 (= res!606003 (not (= key!785 (bvneg key!785))))))

(declare-fun b!896106 () Bool)

(declare-datatypes ((SeekEntryResult!8891 0))(
  ( (MissingZero!8891 (index!37935 (_ BitVec 32))) (Found!8891 (index!37936 (_ BitVec 32))) (Intermediate!8891 (undefined!9703 Bool) (index!37937 (_ BitVec 32)) (x!76283 (_ BitVec 32))) (Undefined!8891) (MissingVacant!8891 (index!37938 (_ BitVec 32))) )
))
(declare-fun lt!404704 () SeekEntryResult!8891)

(get-info :version)

(assert (=> b!896106 (= e!500809 (not (or (not ((_ is Found!8891) lt!404704)) (bvslt (index!37936 lt!404704) #b00000000000000000000000000000000) (bvsge (index!37936 lt!404704) (size!25713 (_keys!10097 thiss!1181))) (bvslt (size!25713 (_keys!10097 thiss!1181)) #b01111111111111111111111111111111))))))

(declare-fun e!500813 () Bool)

(assert (=> b!896106 e!500813))

(declare-fun res!606005 () Bool)

(assert (=> b!896106 (=> res!606005 e!500813)))

(assert (=> b!896106 (= res!606005 (not ((_ is Found!8891) lt!404704)))))

(declare-datatypes ((Unit!30474 0))(
  ( (Unit!30475) )
))
(declare-fun lt!404703 () Unit!30474)

(declare-fun lemmaSeekEntryGivesInRangeIndex!65 (array!52546 array!52548 (_ BitVec 32) (_ BitVec 32) V!29321 V!29321 (_ BitVec 64)) Unit!30474)

(assert (=> b!896106 (= lt!404703 (lemmaSeekEntryGivesInRangeIndex!65 (_keys!10097 thiss!1181) (_values!5361 thiss!1181) (mask!25996 thiss!1181) (extraKeys!5070 thiss!1181) (zeroValue!5174 thiss!1181) (minValue!5174 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52546 (_ BitVec 32)) SeekEntryResult!8891)

(assert (=> b!896106 (= lt!404704 (seekEntry!0 key!785 (_keys!10097 thiss!1181) (mask!25996 thiss!1181)))))

(declare-fun b!896108 () Bool)

(assert (=> b!896108 (= e!500810 (and e!500811 mapRes!29011))))

(declare-fun condMapEmpty!29011 () Bool)

(declare-fun mapDefault!29011 () ValueCell!8652)

(assert (=> b!896108 (= condMapEmpty!29011 (= (arr!25264 (_values!5361 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8652)) mapDefault!29011)))))

(declare-fun mapNonEmpty!29011 () Bool)

(declare-fun tp!55841 () Bool)

(assert (=> mapNonEmpty!29011 (= mapRes!29011 (and tp!55841 e!500808))))

(declare-fun mapValue!29011 () ValueCell!8652)

(declare-fun mapKey!29011 () (_ BitVec 32))

(declare-fun mapRest!29011 () (Array (_ BitVec 32) ValueCell!8652))

(assert (=> mapNonEmpty!29011 (= (arr!25264 (_values!5361 thiss!1181)) (store mapRest!29011 mapKey!29011 mapValue!29011))))

(declare-fun res!606004 () Bool)

(assert (=> start!76392 (=> (not res!606004) (not e!500809))))

(declare-fun valid!1666 (LongMapFixedSize!4320) Bool)

(assert (=> start!76392 (= res!606004 (valid!1666 thiss!1181))))

(assert (=> start!76392 e!500809))

(assert (=> start!76392 e!500807))

(assert (=> start!76392 true))

(declare-fun b!896107 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896107 (= e!500813 (inRange!0 (index!37936 lt!404704) (mask!25996 thiss!1181)))))

(assert (= (and start!76392 res!606004) b!896105))

(assert (= (and b!896105 res!606003) b!896106))

(assert (= (and b!896106 (not res!606005)) b!896107))

(assert (= (and b!896108 condMapEmpty!29011) mapIsEmpty!29011))

(assert (= (and b!896108 (not condMapEmpty!29011)) mapNonEmpty!29011))

(assert (= (and mapNonEmpty!29011 ((_ is ValueCellFull!8652) mapValue!29011)) b!896102))

(assert (= (and b!896108 ((_ is ValueCellFull!8652) mapDefault!29011)) b!896103))

(assert (= b!896104 b!896108))

(assert (= start!76392 b!896104))

(declare-fun m!833417 () Bool)

(assert (=> mapNonEmpty!29011 m!833417))

(declare-fun m!833419 () Bool)

(assert (=> b!896107 m!833419))

(declare-fun m!833421 () Bool)

(assert (=> b!896104 m!833421))

(declare-fun m!833423 () Bool)

(assert (=> b!896104 m!833423))

(declare-fun m!833425 () Bool)

(assert (=> start!76392 m!833425))

(declare-fun m!833427 () Bool)

(assert (=> b!896106 m!833427))

(declare-fun m!833429 () Bool)

(assert (=> b!896106 m!833429))

(check-sat (not b!896104) (not b_next!15939) tp_is_empty!18267 (not mapNonEmpty!29011) (not start!76392) (not b!896106) b_and!26231 (not b!896107))
(check-sat b_and!26231 (not b_next!15939))
(get-model)

(declare-fun d!110859 () Bool)

(assert (=> d!110859 (= (array_inv!19832 (_keys!10097 thiss!1181)) (bvsge (size!25713 (_keys!10097 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896104 d!110859))

(declare-fun d!110861 () Bool)

(assert (=> d!110861 (= (array_inv!19833 (_values!5361 thiss!1181)) (bvsge (size!25714 (_values!5361 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896104 d!110861))

(declare-fun d!110863 () Bool)

(declare-fun res!606021 () Bool)

(declare-fun e!500837 () Bool)

(assert (=> d!110863 (=> (not res!606021) (not e!500837))))

(declare-fun simpleValid!311 (LongMapFixedSize!4320) Bool)

(assert (=> d!110863 (= res!606021 (simpleValid!311 thiss!1181))))

(assert (=> d!110863 (= (valid!1666 thiss!1181) e!500837)))

(declare-fun b!896136 () Bool)

(declare-fun res!606022 () Bool)

(assert (=> b!896136 (=> (not res!606022) (not e!500837))))

(declare-fun arrayCountValidKeys!0 (array!52546 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896136 (= res!606022 (= (arrayCountValidKeys!0 (_keys!10097 thiss!1181) #b00000000000000000000000000000000 (size!25713 (_keys!10097 thiss!1181))) (_size!2215 thiss!1181)))))

(declare-fun b!896137 () Bool)

(declare-fun res!606023 () Bool)

(assert (=> b!896137 (=> (not res!606023) (not e!500837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52546 (_ BitVec 32)) Bool)

(assert (=> b!896137 (= res!606023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10097 thiss!1181) (mask!25996 thiss!1181)))))

(declare-fun b!896138 () Bool)

(declare-datatypes ((List!17821 0))(
  ( (Nil!17818) (Cons!17817 (h!18954 (_ BitVec 64)) (t!25160 List!17821)) )
))
(declare-fun arrayNoDuplicates!0 (array!52546 (_ BitVec 32) List!17821) Bool)

(assert (=> b!896138 (= e!500837 (arrayNoDuplicates!0 (_keys!10097 thiss!1181) #b00000000000000000000000000000000 Nil!17818))))

(assert (= (and d!110863 res!606021) b!896136))

(assert (= (and b!896136 res!606022) b!896137))

(assert (= (and b!896137 res!606023) b!896138))

(declare-fun m!833445 () Bool)

(assert (=> d!110863 m!833445))

(declare-fun m!833447 () Bool)

(assert (=> b!896136 m!833447))

(declare-fun m!833449 () Bool)

(assert (=> b!896137 m!833449))

(declare-fun m!833451 () Bool)

(assert (=> b!896138 m!833451))

(assert (=> start!76392 d!110863))

(declare-fun d!110865 () Bool)

(declare-fun e!500840 () Bool)

(assert (=> d!110865 e!500840))

(declare-fun res!606026 () Bool)

(assert (=> d!110865 (=> res!606026 e!500840)))

(declare-fun lt!404716 () SeekEntryResult!8891)

(assert (=> d!110865 (= res!606026 (not ((_ is Found!8891) lt!404716)))))

(assert (=> d!110865 (= lt!404716 (seekEntry!0 key!785 (_keys!10097 thiss!1181) (mask!25996 thiss!1181)))))

(declare-fun lt!404715 () Unit!30474)

(declare-fun choose!1476 (array!52546 array!52548 (_ BitVec 32) (_ BitVec 32) V!29321 V!29321 (_ BitVec 64)) Unit!30474)

(assert (=> d!110865 (= lt!404715 (choose!1476 (_keys!10097 thiss!1181) (_values!5361 thiss!1181) (mask!25996 thiss!1181) (extraKeys!5070 thiss!1181) (zeroValue!5174 thiss!1181) (minValue!5174 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110865 (validMask!0 (mask!25996 thiss!1181))))

(assert (=> d!110865 (= (lemmaSeekEntryGivesInRangeIndex!65 (_keys!10097 thiss!1181) (_values!5361 thiss!1181) (mask!25996 thiss!1181) (extraKeys!5070 thiss!1181) (zeroValue!5174 thiss!1181) (minValue!5174 thiss!1181) key!785) lt!404715)))

(declare-fun b!896141 () Bool)

(assert (=> b!896141 (= e!500840 (inRange!0 (index!37936 lt!404716) (mask!25996 thiss!1181)))))

(assert (= (and d!110865 (not res!606026)) b!896141))

(assert (=> d!110865 m!833429))

(declare-fun m!833453 () Bool)

(assert (=> d!110865 m!833453))

(declare-fun m!833455 () Bool)

(assert (=> d!110865 m!833455))

(declare-fun m!833457 () Bool)

(assert (=> b!896141 m!833457))

(assert (=> b!896106 d!110865))

(declare-fun d!110867 () Bool)

(declare-fun lt!404725 () SeekEntryResult!8891)

(assert (=> d!110867 (and (or ((_ is MissingVacant!8891) lt!404725) (not ((_ is Found!8891) lt!404725)) (and (bvsge (index!37936 lt!404725) #b00000000000000000000000000000000) (bvslt (index!37936 lt!404725) (size!25713 (_keys!10097 thiss!1181))))) (not ((_ is MissingVacant!8891) lt!404725)) (or (not ((_ is Found!8891) lt!404725)) (= (select (arr!25263 (_keys!10097 thiss!1181)) (index!37936 lt!404725)) key!785)))))

(declare-fun e!500847 () SeekEntryResult!8891)

(assert (=> d!110867 (= lt!404725 e!500847)))

(declare-fun c!94641 () Bool)

(declare-fun lt!404728 () SeekEntryResult!8891)

(assert (=> d!110867 (= c!94641 (and ((_ is Intermediate!8891) lt!404728) (undefined!9703 lt!404728)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52546 (_ BitVec 32)) SeekEntryResult!8891)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110867 (= lt!404728 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25996 thiss!1181)) key!785 (_keys!10097 thiss!1181) (mask!25996 thiss!1181)))))

(assert (=> d!110867 (validMask!0 (mask!25996 thiss!1181))))

(assert (=> d!110867 (= (seekEntry!0 key!785 (_keys!10097 thiss!1181) (mask!25996 thiss!1181)) lt!404725)))

(declare-fun b!896154 () Bool)

(declare-fun e!500849 () SeekEntryResult!8891)

(assert (=> b!896154 (= e!500847 e!500849)))

(declare-fun lt!404726 () (_ BitVec 64))

(assert (=> b!896154 (= lt!404726 (select (arr!25263 (_keys!10097 thiss!1181)) (index!37937 lt!404728)))))

(declare-fun c!94642 () Bool)

(assert (=> b!896154 (= c!94642 (= lt!404726 key!785))))

(declare-fun b!896155 () Bool)

(declare-fun e!500848 () SeekEntryResult!8891)

(declare-fun lt!404727 () SeekEntryResult!8891)

(assert (=> b!896155 (= e!500848 (ite ((_ is MissingVacant!8891) lt!404727) (MissingZero!8891 (index!37938 lt!404727)) lt!404727))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52546 (_ BitVec 32)) SeekEntryResult!8891)

(assert (=> b!896155 (= lt!404727 (seekKeyOrZeroReturnVacant!0 (x!76283 lt!404728) (index!37937 lt!404728) (index!37937 lt!404728) key!785 (_keys!10097 thiss!1181) (mask!25996 thiss!1181)))))

(declare-fun b!896156 () Bool)

(assert (=> b!896156 (= e!500847 Undefined!8891)))

(declare-fun b!896157 () Bool)

(assert (=> b!896157 (= e!500848 (MissingZero!8891 (index!37937 lt!404728)))))

(declare-fun b!896158 () Bool)

(declare-fun c!94643 () Bool)

(assert (=> b!896158 (= c!94643 (= lt!404726 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!896158 (= e!500849 e!500848)))

(declare-fun b!896159 () Bool)

(assert (=> b!896159 (= e!500849 (Found!8891 (index!37937 lt!404728)))))

(assert (= (and d!110867 c!94641) b!896156))

(assert (= (and d!110867 (not c!94641)) b!896154))

(assert (= (and b!896154 c!94642) b!896159))

(assert (= (and b!896154 (not c!94642)) b!896158))

(assert (= (and b!896158 c!94643) b!896157))

(assert (= (and b!896158 (not c!94643)) b!896155))

(declare-fun m!833459 () Bool)

(assert (=> d!110867 m!833459))

(declare-fun m!833461 () Bool)

(assert (=> d!110867 m!833461))

(assert (=> d!110867 m!833461))

(declare-fun m!833463 () Bool)

(assert (=> d!110867 m!833463))

(assert (=> d!110867 m!833455))

(declare-fun m!833465 () Bool)

(assert (=> b!896154 m!833465))

(declare-fun m!833467 () Bool)

(assert (=> b!896155 m!833467))

(assert (=> b!896106 d!110867))

(declare-fun d!110869 () Bool)

(assert (=> d!110869 (= (inRange!0 (index!37936 lt!404704) (mask!25996 thiss!1181)) (and (bvsge (index!37936 lt!404704) #b00000000000000000000000000000000) (bvslt (index!37936 lt!404704) (bvadd (mask!25996 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896107 d!110869))

(declare-fun condMapEmpty!29017 () Bool)

(declare-fun mapDefault!29017 () ValueCell!8652)

(assert (=> mapNonEmpty!29011 (= condMapEmpty!29017 (= mapRest!29011 ((as const (Array (_ BitVec 32) ValueCell!8652)) mapDefault!29017)))))

(declare-fun e!500854 () Bool)

(declare-fun mapRes!29017 () Bool)

(assert (=> mapNonEmpty!29011 (= tp!55841 (and e!500854 mapRes!29017))))

(declare-fun mapNonEmpty!29017 () Bool)

(declare-fun tp!55851 () Bool)

(declare-fun e!500855 () Bool)

(assert (=> mapNonEmpty!29017 (= mapRes!29017 (and tp!55851 e!500855))))

(declare-fun mapKey!29017 () (_ BitVec 32))

(declare-fun mapRest!29017 () (Array (_ BitVec 32) ValueCell!8652))

(declare-fun mapValue!29017 () ValueCell!8652)

(assert (=> mapNonEmpty!29017 (= mapRest!29011 (store mapRest!29017 mapKey!29017 mapValue!29017))))

(declare-fun b!896167 () Bool)

(assert (=> b!896167 (= e!500854 tp_is_empty!18267)))

(declare-fun b!896166 () Bool)

(assert (=> b!896166 (= e!500855 tp_is_empty!18267)))

(declare-fun mapIsEmpty!29017 () Bool)

(assert (=> mapIsEmpty!29017 mapRes!29017))

(assert (= (and mapNonEmpty!29011 condMapEmpty!29017) mapIsEmpty!29017))

(assert (= (and mapNonEmpty!29011 (not condMapEmpty!29017)) mapNonEmpty!29017))

(assert (= (and mapNonEmpty!29017 ((_ is ValueCellFull!8652) mapValue!29017)) b!896166))

(assert (= (and mapNonEmpty!29011 ((_ is ValueCellFull!8652) mapDefault!29017)) b!896167))

(declare-fun m!833469 () Bool)

(assert (=> mapNonEmpty!29017 m!833469))

(check-sat (not b_next!15939) tp_is_empty!18267 (not d!110867) (not d!110865) (not b!896155) (not mapNonEmpty!29017) (not b!896137) (not b!896141) b_and!26231 (not b!896138) (not d!110863) (not b!896136))
(check-sat b_and!26231 (not b_next!15939))
(get-model)

(declare-fun d!110871 () Bool)

(assert (=> d!110871 (= (inRange!0 (index!37936 lt!404716) (mask!25996 thiss!1181)) (and (bvsge (index!37936 lt!404716) #b00000000000000000000000000000000) (bvslt (index!37936 lt!404716) (bvadd (mask!25996 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896141 d!110871))

(declare-fun b!896180 () Bool)

(declare-fun e!500863 () SeekEntryResult!8891)

(declare-fun e!500864 () SeekEntryResult!8891)

(assert (=> b!896180 (= e!500863 e!500864)))

(declare-fun c!94650 () Bool)

(declare-fun lt!404734 () (_ BitVec 64))

(assert (=> b!896180 (= c!94650 (= lt!404734 key!785))))

(declare-fun b!896181 () Bool)

(assert (=> b!896181 (= e!500863 Undefined!8891)))

(declare-fun b!896183 () Bool)

(assert (=> b!896183 (= e!500864 (Found!8891 (index!37937 lt!404728)))))

(declare-fun b!896184 () Bool)

(declare-fun c!94652 () Bool)

(assert (=> b!896184 (= c!94652 (= lt!404734 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500862 () SeekEntryResult!8891)

(assert (=> b!896184 (= e!500864 e!500862)))

(declare-fun b!896185 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896185 (= e!500862 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76283 lt!404728) #b00000000000000000000000000000001) (nextIndex!0 (index!37937 lt!404728) (x!76283 lt!404728) (mask!25996 thiss!1181)) (index!37937 lt!404728) key!785 (_keys!10097 thiss!1181) (mask!25996 thiss!1181)))))

(declare-fun b!896182 () Bool)

(assert (=> b!896182 (= e!500862 (MissingVacant!8891 (index!37937 lt!404728)))))

(declare-fun lt!404733 () SeekEntryResult!8891)

(declare-fun d!110873 () Bool)

(assert (=> d!110873 (and (or ((_ is Undefined!8891) lt!404733) (not ((_ is Found!8891) lt!404733)) (and (bvsge (index!37936 lt!404733) #b00000000000000000000000000000000) (bvslt (index!37936 lt!404733) (size!25713 (_keys!10097 thiss!1181))))) (or ((_ is Undefined!8891) lt!404733) ((_ is Found!8891) lt!404733) (not ((_ is MissingVacant!8891) lt!404733)) (not (= (index!37938 lt!404733) (index!37937 lt!404728))) (and (bvsge (index!37938 lt!404733) #b00000000000000000000000000000000) (bvslt (index!37938 lt!404733) (size!25713 (_keys!10097 thiss!1181))))) (or ((_ is Undefined!8891) lt!404733) (ite ((_ is Found!8891) lt!404733) (= (select (arr!25263 (_keys!10097 thiss!1181)) (index!37936 lt!404733)) key!785) (and ((_ is MissingVacant!8891) lt!404733) (= (index!37938 lt!404733) (index!37937 lt!404728)) (= (select (arr!25263 (_keys!10097 thiss!1181)) (index!37938 lt!404733)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!110873 (= lt!404733 e!500863)))

(declare-fun c!94651 () Bool)

(assert (=> d!110873 (= c!94651 (bvsge (x!76283 lt!404728) #b01111111111111111111111111111110))))

(assert (=> d!110873 (= lt!404734 (select (arr!25263 (_keys!10097 thiss!1181)) (index!37937 lt!404728)))))

(assert (=> d!110873 (validMask!0 (mask!25996 thiss!1181))))

(assert (=> d!110873 (= (seekKeyOrZeroReturnVacant!0 (x!76283 lt!404728) (index!37937 lt!404728) (index!37937 lt!404728) key!785 (_keys!10097 thiss!1181) (mask!25996 thiss!1181)) lt!404733)))

(assert (= (and d!110873 c!94651) b!896181))

(assert (= (and d!110873 (not c!94651)) b!896180))

(assert (= (and b!896180 c!94650) b!896183))

(assert (= (and b!896180 (not c!94650)) b!896184))

(assert (= (and b!896184 c!94652) b!896182))

(assert (= (and b!896184 (not c!94652)) b!896185))

(declare-fun m!833471 () Bool)

(assert (=> b!896185 m!833471))

(assert (=> b!896185 m!833471))

(declare-fun m!833473 () Bool)

(assert (=> b!896185 m!833473))

(declare-fun m!833475 () Bool)

(assert (=> d!110873 m!833475))

(declare-fun m!833477 () Bool)

(assert (=> d!110873 m!833477))

(assert (=> d!110873 m!833465))

(assert (=> d!110873 m!833455))

(assert (=> b!896155 d!110873))

(declare-fun b!896196 () Bool)

(declare-fun e!500874 () Bool)

(declare-fun e!500876 () Bool)

(assert (=> b!896196 (= e!500874 e!500876)))

(declare-fun c!94655 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!896196 (= c!94655 (validKeyInArray!0 (select (arr!25263 (_keys!10097 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896197 () Bool)

(declare-fun e!500875 () Bool)

(assert (=> b!896197 (= e!500875 e!500874)))

(declare-fun res!606034 () Bool)

(assert (=> b!896197 (=> (not res!606034) (not e!500874))))

(declare-fun e!500873 () Bool)

(assert (=> b!896197 (= res!606034 (not e!500873))))

(declare-fun res!606035 () Bool)

(assert (=> b!896197 (=> (not res!606035) (not e!500873))))

(assert (=> b!896197 (= res!606035 (validKeyInArray!0 (select (arr!25263 (_keys!10097 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896198 () Bool)

(declare-fun call!39772 () Bool)

(assert (=> b!896198 (= e!500876 call!39772)))

(declare-fun b!896199 () Bool)

(assert (=> b!896199 (= e!500876 call!39772)))

(declare-fun b!896200 () Bool)

(declare-fun contains!4400 (List!17821 (_ BitVec 64)) Bool)

(assert (=> b!896200 (= e!500873 (contains!4400 Nil!17818 (select (arr!25263 (_keys!10097 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39769 () Bool)

(assert (=> bm!39769 (= call!39772 (arrayNoDuplicates!0 (_keys!10097 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94655 (Cons!17817 (select (arr!25263 (_keys!10097 thiss!1181)) #b00000000000000000000000000000000) Nil!17818) Nil!17818)))))

(declare-fun d!110875 () Bool)

(declare-fun res!606033 () Bool)

(assert (=> d!110875 (=> res!606033 e!500875)))

(assert (=> d!110875 (= res!606033 (bvsge #b00000000000000000000000000000000 (size!25713 (_keys!10097 thiss!1181))))))

(assert (=> d!110875 (= (arrayNoDuplicates!0 (_keys!10097 thiss!1181) #b00000000000000000000000000000000 Nil!17818) e!500875)))

(assert (= (and d!110875 (not res!606033)) b!896197))

(assert (= (and b!896197 res!606035) b!896200))

(assert (= (and b!896197 res!606034) b!896196))

(assert (= (and b!896196 c!94655) b!896198))

(assert (= (and b!896196 (not c!94655)) b!896199))

(assert (= (or b!896198 b!896199) bm!39769))

(declare-fun m!833479 () Bool)

(assert (=> b!896196 m!833479))

(assert (=> b!896196 m!833479))

(declare-fun m!833481 () Bool)

(assert (=> b!896196 m!833481))

(assert (=> b!896197 m!833479))

(assert (=> b!896197 m!833479))

(assert (=> b!896197 m!833481))

(assert (=> b!896200 m!833479))

(assert (=> b!896200 m!833479))

(declare-fun m!833483 () Bool)

(assert (=> b!896200 m!833483))

(assert (=> bm!39769 m!833479))

(declare-fun m!833485 () Bool)

(assert (=> bm!39769 m!833485))

(assert (=> b!896138 d!110875))

(declare-fun b!896219 () Bool)

(declare-fun e!500888 () SeekEntryResult!8891)

(declare-fun e!500891 () SeekEntryResult!8891)

(assert (=> b!896219 (= e!500888 e!500891)))

(declare-fun c!94663 () Bool)

(declare-fun lt!404740 () (_ BitVec 64))

(assert (=> b!896219 (= c!94663 (or (= lt!404740 key!785) (= (bvadd lt!404740 lt!404740) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!896220 () Bool)

(assert (=> b!896220 (= e!500891 (Intermediate!8891 false (toIndex!0 key!785 (mask!25996 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!896221 () Bool)

(assert (=> b!896221 (= e!500891 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25996 thiss!1181)) #b00000000000000000000000000000000 (mask!25996 thiss!1181)) key!785 (_keys!10097 thiss!1181) (mask!25996 thiss!1181)))))

(declare-fun b!896223 () Bool)

(declare-fun lt!404739 () SeekEntryResult!8891)

(assert (=> b!896223 (and (bvsge (index!37937 lt!404739) #b00000000000000000000000000000000) (bvslt (index!37937 lt!404739) (size!25713 (_keys!10097 thiss!1181))))))

(declare-fun res!606042 () Bool)

(assert (=> b!896223 (= res!606042 (= (select (arr!25263 (_keys!10097 thiss!1181)) (index!37937 lt!404739)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500889 () Bool)

(assert (=> b!896223 (=> res!606042 e!500889)))

(declare-fun b!896224 () Bool)

(assert (=> b!896224 (and (bvsge (index!37937 lt!404739) #b00000000000000000000000000000000) (bvslt (index!37937 lt!404739) (size!25713 (_keys!10097 thiss!1181))))))

(assert (=> b!896224 (= e!500889 (= (select (arr!25263 (_keys!10097 thiss!1181)) (index!37937 lt!404739)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!896225 () Bool)

(declare-fun e!500890 () Bool)

(assert (=> b!896225 (= e!500890 (bvsge (x!76283 lt!404739) #b01111111111111111111111111111110))))

(declare-fun b!896226 () Bool)

(assert (=> b!896226 (= e!500888 (Intermediate!8891 true (toIndex!0 key!785 (mask!25996 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!896227 () Bool)

(declare-fun e!500887 () Bool)

(assert (=> b!896227 (= e!500890 e!500887)))

(declare-fun res!606044 () Bool)

(assert (=> b!896227 (= res!606044 (and ((_ is Intermediate!8891) lt!404739) (not (undefined!9703 lt!404739)) (bvslt (x!76283 lt!404739) #b01111111111111111111111111111110) (bvsge (x!76283 lt!404739) #b00000000000000000000000000000000) (bvsge (x!76283 lt!404739) #b00000000000000000000000000000000)))))

(assert (=> b!896227 (=> (not res!606044) (not e!500887))))

(declare-fun d!110877 () Bool)

(assert (=> d!110877 e!500890))

(declare-fun c!94664 () Bool)

(assert (=> d!110877 (= c!94664 (and ((_ is Intermediate!8891) lt!404739) (undefined!9703 lt!404739)))))

(assert (=> d!110877 (= lt!404739 e!500888)))

(declare-fun c!94662 () Bool)

(assert (=> d!110877 (= c!94662 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!110877 (= lt!404740 (select (arr!25263 (_keys!10097 thiss!1181)) (toIndex!0 key!785 (mask!25996 thiss!1181))))))

(assert (=> d!110877 (validMask!0 (mask!25996 thiss!1181))))

(assert (=> d!110877 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25996 thiss!1181)) key!785 (_keys!10097 thiss!1181) (mask!25996 thiss!1181)) lt!404739)))

(declare-fun b!896222 () Bool)

(assert (=> b!896222 (and (bvsge (index!37937 lt!404739) #b00000000000000000000000000000000) (bvslt (index!37937 lt!404739) (size!25713 (_keys!10097 thiss!1181))))))

(declare-fun res!606043 () Bool)

(assert (=> b!896222 (= res!606043 (= (select (arr!25263 (_keys!10097 thiss!1181)) (index!37937 lt!404739)) key!785))))

(assert (=> b!896222 (=> res!606043 e!500889)))

(assert (=> b!896222 (= e!500887 e!500889)))

(assert (= (and d!110877 c!94662) b!896226))

(assert (= (and d!110877 (not c!94662)) b!896219))

(assert (= (and b!896219 c!94663) b!896220))

(assert (= (and b!896219 (not c!94663)) b!896221))

(assert (= (and d!110877 c!94664) b!896225))

(assert (= (and d!110877 (not c!94664)) b!896227))

(assert (= (and b!896227 res!606044) b!896222))

(assert (= (and b!896222 (not res!606043)) b!896223))

(assert (= (and b!896223 (not res!606042)) b!896224))

(declare-fun m!833487 () Bool)

(assert (=> b!896224 m!833487))

(assert (=> b!896221 m!833461))

(declare-fun m!833489 () Bool)

(assert (=> b!896221 m!833489))

(assert (=> b!896221 m!833489))

(declare-fun m!833491 () Bool)

(assert (=> b!896221 m!833491))

(assert (=> b!896223 m!833487))

(assert (=> d!110877 m!833461))

(declare-fun m!833493 () Bool)

(assert (=> d!110877 m!833493))

(assert (=> d!110877 m!833455))

(assert (=> b!896222 m!833487))

(assert (=> d!110867 d!110877))

(declare-fun d!110879 () Bool)

(declare-fun lt!404746 () (_ BitVec 32))

(declare-fun lt!404745 () (_ BitVec 32))

(assert (=> d!110879 (= lt!404746 (bvmul (bvxor lt!404745 (bvlshr lt!404745 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110879 (= lt!404745 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110879 (and (bvsge (mask!25996 thiss!1181) #b00000000000000000000000000000000) (let ((res!606045 (let ((h!18955 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76301 (bvmul (bvxor h!18955 (bvlshr h!18955 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76301 (bvlshr x!76301 #b00000000000000000000000000001101)) (mask!25996 thiss!1181)))))) (and (bvslt res!606045 (bvadd (mask!25996 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!606045 #b00000000000000000000000000000000))))))

(assert (=> d!110879 (= (toIndex!0 key!785 (mask!25996 thiss!1181)) (bvand (bvxor lt!404746 (bvlshr lt!404746 #b00000000000000000000000000001101)) (mask!25996 thiss!1181)))))

(assert (=> d!110867 d!110879))

(declare-fun d!110881 () Bool)

(assert (=> d!110881 (= (validMask!0 (mask!25996 thiss!1181)) (and (or (= (mask!25996 thiss!1181) #b00000000000000000000000000000111) (= (mask!25996 thiss!1181) #b00000000000000000000000000001111) (= (mask!25996 thiss!1181) #b00000000000000000000000000011111) (= (mask!25996 thiss!1181) #b00000000000000000000000000111111) (= (mask!25996 thiss!1181) #b00000000000000000000000001111111) (= (mask!25996 thiss!1181) #b00000000000000000000000011111111) (= (mask!25996 thiss!1181) #b00000000000000000000000111111111) (= (mask!25996 thiss!1181) #b00000000000000000000001111111111) (= (mask!25996 thiss!1181) #b00000000000000000000011111111111) (= (mask!25996 thiss!1181) #b00000000000000000000111111111111) (= (mask!25996 thiss!1181) #b00000000000000000001111111111111) (= (mask!25996 thiss!1181) #b00000000000000000011111111111111) (= (mask!25996 thiss!1181) #b00000000000000000111111111111111) (= (mask!25996 thiss!1181) #b00000000000000001111111111111111) (= (mask!25996 thiss!1181) #b00000000000000011111111111111111) (= (mask!25996 thiss!1181) #b00000000000000111111111111111111) (= (mask!25996 thiss!1181) #b00000000000001111111111111111111) (= (mask!25996 thiss!1181) #b00000000000011111111111111111111) (= (mask!25996 thiss!1181) #b00000000000111111111111111111111) (= (mask!25996 thiss!1181) #b00000000001111111111111111111111) (= (mask!25996 thiss!1181) #b00000000011111111111111111111111) (= (mask!25996 thiss!1181) #b00000000111111111111111111111111) (= (mask!25996 thiss!1181) #b00000001111111111111111111111111) (= (mask!25996 thiss!1181) #b00000011111111111111111111111111) (= (mask!25996 thiss!1181) #b00000111111111111111111111111111) (= (mask!25996 thiss!1181) #b00001111111111111111111111111111) (= (mask!25996 thiss!1181) #b00011111111111111111111111111111) (= (mask!25996 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25996 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> d!110867 d!110881))

(assert (=> d!110865 d!110867))

(declare-fun d!110883 () Bool)

(declare-fun e!500894 () Bool)

(assert (=> d!110883 e!500894))

(declare-fun res!606048 () Bool)

(assert (=> d!110883 (=> res!606048 e!500894)))

(declare-fun lt!404749 () SeekEntryResult!8891)

(assert (=> d!110883 (= res!606048 (not ((_ is Found!8891) lt!404749)))))

(assert (=> d!110883 (= lt!404749 (seekEntry!0 key!785 (_keys!10097 thiss!1181) (mask!25996 thiss!1181)))))

(assert (=> d!110883 true))

(declare-fun _$36!351 () Unit!30474)

(assert (=> d!110883 (= (choose!1476 (_keys!10097 thiss!1181) (_values!5361 thiss!1181) (mask!25996 thiss!1181) (extraKeys!5070 thiss!1181) (zeroValue!5174 thiss!1181) (minValue!5174 thiss!1181) key!785) _$36!351)))

(declare-fun b!896230 () Bool)

(assert (=> b!896230 (= e!500894 (inRange!0 (index!37936 lt!404749) (mask!25996 thiss!1181)))))

(assert (= (and d!110883 (not res!606048)) b!896230))

(assert (=> d!110883 m!833429))

(declare-fun m!833495 () Bool)

(assert (=> b!896230 m!833495))

(assert (=> d!110865 d!110883))

(assert (=> d!110865 d!110881))

(declare-fun b!896239 () Bool)

(declare-fun e!500903 () Bool)

(declare-fun call!39775 () Bool)

(assert (=> b!896239 (= e!500903 call!39775)))

(declare-fun d!110885 () Bool)

(declare-fun res!606054 () Bool)

(declare-fun e!500901 () Bool)

(assert (=> d!110885 (=> res!606054 e!500901)))

(assert (=> d!110885 (= res!606054 (bvsge #b00000000000000000000000000000000 (size!25713 (_keys!10097 thiss!1181))))))

(assert (=> d!110885 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10097 thiss!1181) (mask!25996 thiss!1181)) e!500901)))

(declare-fun b!896240 () Bool)

(assert (=> b!896240 (= e!500901 e!500903)))

(declare-fun c!94667 () Bool)

(assert (=> b!896240 (= c!94667 (validKeyInArray!0 (select (arr!25263 (_keys!10097 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39772 () Bool)

(assert (=> bm!39772 (= call!39775 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10097 thiss!1181) (mask!25996 thiss!1181)))))

(declare-fun b!896241 () Bool)

(declare-fun e!500902 () Bool)

(assert (=> b!896241 (= e!500902 call!39775)))

(declare-fun b!896242 () Bool)

(assert (=> b!896242 (= e!500903 e!500902)))

(declare-fun lt!404757 () (_ BitVec 64))

(assert (=> b!896242 (= lt!404757 (select (arr!25263 (_keys!10097 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404756 () Unit!30474)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52546 (_ BitVec 64) (_ BitVec 32)) Unit!30474)

(assert (=> b!896242 (= lt!404756 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10097 thiss!1181) lt!404757 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896242 (arrayContainsKey!0 (_keys!10097 thiss!1181) lt!404757 #b00000000000000000000000000000000)))

(declare-fun lt!404758 () Unit!30474)

(assert (=> b!896242 (= lt!404758 lt!404756)))

(declare-fun res!606053 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52546 (_ BitVec 32)) SeekEntryResult!8891)

(assert (=> b!896242 (= res!606053 (= (seekEntryOrOpen!0 (select (arr!25263 (_keys!10097 thiss!1181)) #b00000000000000000000000000000000) (_keys!10097 thiss!1181) (mask!25996 thiss!1181)) (Found!8891 #b00000000000000000000000000000000)))))

(assert (=> b!896242 (=> (not res!606053) (not e!500902))))

(assert (= (and d!110885 (not res!606054)) b!896240))

(assert (= (and b!896240 c!94667) b!896242))

(assert (= (and b!896240 (not c!94667)) b!896239))

(assert (= (and b!896242 res!606053) b!896241))

(assert (= (or b!896241 b!896239) bm!39772))

(assert (=> b!896240 m!833479))

(assert (=> b!896240 m!833479))

(assert (=> b!896240 m!833481))

(declare-fun m!833497 () Bool)

(assert (=> bm!39772 m!833497))

(assert (=> b!896242 m!833479))

(declare-fun m!833499 () Bool)

(assert (=> b!896242 m!833499))

(declare-fun m!833501 () Bool)

(assert (=> b!896242 m!833501))

(assert (=> b!896242 m!833479))

(declare-fun m!833503 () Bool)

(assert (=> b!896242 m!833503))

(assert (=> b!896137 d!110885))

(declare-fun bm!39775 () Bool)

(declare-fun call!39778 () (_ BitVec 32))

(assert (=> bm!39775 (= call!39778 (arrayCountValidKeys!0 (_keys!10097 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25713 (_keys!10097 thiss!1181))))))

(declare-fun b!896251 () Bool)

(declare-fun e!500909 () (_ BitVec 32))

(declare-fun e!500908 () (_ BitVec 32))

(assert (=> b!896251 (= e!500909 e!500908)))

(declare-fun c!94673 () Bool)

(assert (=> b!896251 (= c!94673 (validKeyInArray!0 (select (arr!25263 (_keys!10097 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896252 () Bool)

(assert (=> b!896252 (= e!500908 (bvadd #b00000000000000000000000000000001 call!39778))))

(declare-fun b!896254 () Bool)

(assert (=> b!896254 (= e!500908 call!39778)))

(declare-fun b!896253 () Bool)

(assert (=> b!896253 (= e!500909 #b00000000000000000000000000000000)))

(declare-fun d!110887 () Bool)

(declare-fun lt!404761 () (_ BitVec 32))

(assert (=> d!110887 (and (bvsge lt!404761 #b00000000000000000000000000000000) (bvsle lt!404761 (bvsub (size!25713 (_keys!10097 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110887 (= lt!404761 e!500909)))

(declare-fun c!94672 () Bool)

(assert (=> d!110887 (= c!94672 (bvsge #b00000000000000000000000000000000 (size!25713 (_keys!10097 thiss!1181))))))

(assert (=> d!110887 (and (bvsle #b00000000000000000000000000000000 (size!25713 (_keys!10097 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25713 (_keys!10097 thiss!1181)) (size!25713 (_keys!10097 thiss!1181))))))

(assert (=> d!110887 (= (arrayCountValidKeys!0 (_keys!10097 thiss!1181) #b00000000000000000000000000000000 (size!25713 (_keys!10097 thiss!1181))) lt!404761)))

(assert (= (and d!110887 c!94672) b!896253))

(assert (= (and d!110887 (not c!94672)) b!896251))

(assert (= (and b!896251 c!94673) b!896252))

(assert (= (and b!896251 (not c!94673)) b!896254))

(assert (= (or b!896252 b!896254) bm!39775))

(declare-fun m!833505 () Bool)

(assert (=> bm!39775 m!833505))

(assert (=> b!896251 m!833479))

(assert (=> b!896251 m!833479))

(assert (=> b!896251 m!833481))

(assert (=> b!896136 d!110887))

(declare-fun b!896265 () Bool)

(declare-fun res!606066 () Bool)

(declare-fun e!500912 () Bool)

(assert (=> b!896265 (=> (not res!606066) (not e!500912))))

(declare-fun size!25717 (LongMapFixedSize!4320) (_ BitVec 32))

(assert (=> b!896265 (= res!606066 (= (size!25717 thiss!1181) (bvadd (_size!2215 thiss!1181) (bvsdiv (bvadd (extraKeys!5070 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!110889 () Bool)

(declare-fun res!606065 () Bool)

(assert (=> d!110889 (=> (not res!606065) (not e!500912))))

(assert (=> d!110889 (= res!606065 (validMask!0 (mask!25996 thiss!1181)))))

(assert (=> d!110889 (= (simpleValid!311 thiss!1181) e!500912)))

(declare-fun b!896263 () Bool)

(declare-fun res!606064 () Bool)

(assert (=> b!896263 (=> (not res!606064) (not e!500912))))

(assert (=> b!896263 (= res!606064 (and (= (size!25714 (_values!5361 thiss!1181)) (bvadd (mask!25996 thiss!1181) #b00000000000000000000000000000001)) (= (size!25713 (_keys!10097 thiss!1181)) (size!25714 (_values!5361 thiss!1181))) (bvsge (_size!2215 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2215 thiss!1181) (bvadd (mask!25996 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!896264 () Bool)

(declare-fun res!606063 () Bool)

(assert (=> b!896264 (=> (not res!606063) (not e!500912))))

(assert (=> b!896264 (= res!606063 (bvsge (size!25717 thiss!1181) (_size!2215 thiss!1181)))))

(declare-fun b!896266 () Bool)

(assert (=> b!896266 (= e!500912 (and (bvsge (extraKeys!5070 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5070 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2215 thiss!1181) #b00000000000000000000000000000000)))))

(assert (= (and d!110889 res!606065) b!896263))

(assert (= (and b!896263 res!606064) b!896264))

(assert (= (and b!896264 res!606063) b!896265))

(assert (= (and b!896265 res!606066) b!896266))

(declare-fun m!833507 () Bool)

(assert (=> b!896265 m!833507))

(assert (=> d!110889 m!833455))

(assert (=> b!896264 m!833507))

(assert (=> d!110863 d!110889))

(declare-fun condMapEmpty!29018 () Bool)

(declare-fun mapDefault!29018 () ValueCell!8652)

(assert (=> mapNonEmpty!29017 (= condMapEmpty!29018 (= mapRest!29017 ((as const (Array (_ BitVec 32) ValueCell!8652)) mapDefault!29018)))))

(declare-fun e!500913 () Bool)

(declare-fun mapRes!29018 () Bool)

(assert (=> mapNonEmpty!29017 (= tp!55851 (and e!500913 mapRes!29018))))

(declare-fun mapNonEmpty!29018 () Bool)

(declare-fun tp!55852 () Bool)

(declare-fun e!500914 () Bool)

(assert (=> mapNonEmpty!29018 (= mapRes!29018 (and tp!55852 e!500914))))

(declare-fun mapRest!29018 () (Array (_ BitVec 32) ValueCell!8652))

(declare-fun mapValue!29018 () ValueCell!8652)

(declare-fun mapKey!29018 () (_ BitVec 32))

(assert (=> mapNonEmpty!29018 (= mapRest!29017 (store mapRest!29018 mapKey!29018 mapValue!29018))))

(declare-fun b!896268 () Bool)

(assert (=> b!896268 (= e!500913 tp_is_empty!18267)))

(declare-fun b!896267 () Bool)

(assert (=> b!896267 (= e!500914 tp_is_empty!18267)))

(declare-fun mapIsEmpty!29018 () Bool)

(assert (=> mapIsEmpty!29018 mapRes!29018))

(assert (= (and mapNonEmpty!29017 condMapEmpty!29018) mapIsEmpty!29018))

(assert (= (and mapNonEmpty!29017 (not condMapEmpty!29018)) mapNonEmpty!29018))

(assert (= (and mapNonEmpty!29018 ((_ is ValueCellFull!8652) mapValue!29018)) b!896267))

(assert (= (and mapNonEmpty!29017 ((_ is ValueCellFull!8652) mapDefault!29018)) b!896268))

(declare-fun m!833509 () Bool)

(assert (=> mapNonEmpty!29018 m!833509))

(check-sat (not bm!39769) (not d!110873) (not b_next!15939) (not b!896242) (not b!896221) (not b!896251) (not d!110889) (not b!896197) (not b!896230) (not b!896264) (not b!896265) b_and!26231 tp_is_empty!18267 (not bm!39772) (not mapNonEmpty!29018) (not b!896240) (not b!896200) (not b!896185) (not b!896196) (not bm!39775) (not d!110883) (not d!110877))
(check-sat b_and!26231 (not b_next!15939))
