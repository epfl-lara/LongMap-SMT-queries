; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76448 () Bool)

(assert start!76448)

(declare-fun b!896428 () Bool)

(declare-fun b_free!15951 () Bool)

(declare-fun b_next!15951 () Bool)

(assert (=> b!896428 (= b_free!15951 (not b_next!15951))))

(declare-fun tp!55884 () Bool)

(declare-fun b_and!26243 () Bool)

(assert (=> b!896428 (= tp!55884 b_and!26243)))

(declare-fun b!896425 () Bool)

(declare-fun e!501058 () Bool)

(declare-fun tp_is_empty!18279 () Bool)

(assert (=> b!896425 (= e!501058 tp_is_empty!18279)))

(declare-fun b!896426 () Bool)

(declare-fun res!606142 () Bool)

(declare-fun e!501060 () Bool)

(assert (=> b!896426 (=> (not res!606142) (not e!501060))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!896426 (= res!606142 (not (= key!785 (bvneg key!785))))))

(declare-fun b!896427 () Bool)

(declare-fun e!501061 () Bool)

(assert (=> b!896427 (= e!501060 (not e!501061))))

(declare-fun res!606141 () Bool)

(assert (=> b!896427 (=> res!606141 e!501061)))

(declare-datatypes ((SeekEntryResult!8897 0))(
  ( (MissingZero!8897 (index!37959 (_ BitVec 32))) (Found!8897 (index!37960 (_ BitVec 32))) (Intermediate!8897 (undefined!9709 Bool) (index!37961 (_ BitVec 32)) (x!76330 (_ BitVec 32))) (Undefined!8897) (MissingVacant!8897 (index!37962 (_ BitVec 32))) )
))
(declare-fun lt!404814 () SeekEntryResult!8897)

(get-info :version)

(assert (=> b!896427 (= res!606141 (not ((_ is Found!8897) lt!404814)))))

(declare-fun e!501055 () Bool)

(assert (=> b!896427 e!501055))

(declare-fun res!606144 () Bool)

(assert (=> b!896427 (=> res!606144 e!501055)))

(assert (=> b!896427 (= res!606144 (not ((_ is Found!8897) lt!404814)))))

(declare-datatypes ((Unit!30484 0))(
  ( (Unit!30485) )
))
(declare-fun lt!404813 () Unit!30484)

(declare-datatypes ((array!52574 0))(
  ( (array!52575 (arr!25275 (Array (_ BitVec 32) (_ BitVec 64))) (size!25726 (_ BitVec 32))) )
))
(declare-datatypes ((V!29337 0))(
  ( (V!29338 (val!9190 Int)) )
))
(declare-datatypes ((ValueCell!8658 0))(
  ( (ValueCellFull!8658 (v!11680 V!29337)) (EmptyCell!8658) )
))
(declare-datatypes ((array!52576 0))(
  ( (array!52577 (arr!25276 (Array (_ BitVec 32) ValueCell!8658)) (size!25727 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4332 0))(
  ( (LongMapFixedSize!4333 (defaultEntry!5378 Int) (mask!26018 (_ BitVec 32)) (extraKeys!5079 (_ BitVec 32)) (zeroValue!5183 V!29337) (minValue!5183 V!29337) (_size!2221 (_ BitVec 32)) (_keys!10111 array!52574) (_values!5370 array!52576) (_vacant!2221 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4332)

(declare-fun lemmaSeekEntryGivesInRangeIndex!70 (array!52574 array!52576 (_ BitVec 32) (_ BitVec 32) V!29337 V!29337 (_ BitVec 64)) Unit!30484)

(assert (=> b!896427 (= lt!404813 (lemmaSeekEntryGivesInRangeIndex!70 (_keys!10111 thiss!1181) (_values!5370 thiss!1181) (mask!26018 thiss!1181) (extraKeys!5079 thiss!1181) (zeroValue!5183 thiss!1181) (minValue!5183 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52574 (_ BitVec 32)) SeekEntryResult!8897)

(assert (=> b!896427 (= lt!404814 (seekEntry!0 key!785 (_keys!10111 thiss!1181) (mask!26018 thiss!1181)))))

(declare-fun e!501057 () Bool)

(declare-fun e!501054 () Bool)

(declare-fun array_inv!19840 (array!52574) Bool)

(declare-fun array_inv!19841 (array!52576) Bool)

(assert (=> b!896428 (= e!501054 (and tp!55884 tp_is_empty!18279 (array_inv!19840 (_keys!10111 thiss!1181)) (array_inv!19841 (_values!5370 thiss!1181)) e!501057))))

(declare-fun b!896429 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!896429 (= e!501061 (validMask!0 (mask!26018 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896429 (arrayContainsKey!0 (_keys!10111 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404815 () Unit!30484)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52574 (_ BitVec 64) (_ BitVec 32)) Unit!30484)

(assert (=> b!896429 (= lt!404815 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10111 thiss!1181) key!785 (index!37960 lt!404814)))))

(declare-fun b!896430 () Bool)

(declare-fun e!501056 () Bool)

(assert (=> b!896430 (= e!501056 tp_is_empty!18279)))

(declare-fun mapIsEmpty!29036 () Bool)

(declare-fun mapRes!29036 () Bool)

(assert (=> mapIsEmpty!29036 mapRes!29036))

(declare-fun res!606143 () Bool)

(assert (=> start!76448 (=> (not res!606143) (not e!501060))))

(declare-fun valid!1671 (LongMapFixedSize!4332) Bool)

(assert (=> start!76448 (= res!606143 (valid!1671 thiss!1181))))

(assert (=> start!76448 e!501060))

(assert (=> start!76448 e!501054))

(assert (=> start!76448 true))

(declare-fun b!896431 () Bool)

(assert (=> b!896431 (= e!501057 (and e!501058 mapRes!29036))))

(declare-fun condMapEmpty!29036 () Bool)

(declare-fun mapDefault!29036 () ValueCell!8658)

(assert (=> b!896431 (= condMapEmpty!29036 (= (arr!25276 (_values!5370 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8658)) mapDefault!29036)))))

(declare-fun b!896432 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896432 (= e!501055 (inRange!0 (index!37960 lt!404814) (mask!26018 thiss!1181)))))

(declare-fun mapNonEmpty!29036 () Bool)

(declare-fun tp!55885 () Bool)

(assert (=> mapNonEmpty!29036 (= mapRes!29036 (and tp!55885 e!501056))))

(declare-fun mapKey!29036 () (_ BitVec 32))

(declare-fun mapValue!29036 () ValueCell!8658)

(declare-fun mapRest!29036 () (Array (_ BitVec 32) ValueCell!8658))

(assert (=> mapNonEmpty!29036 (= (arr!25276 (_values!5370 thiss!1181)) (store mapRest!29036 mapKey!29036 mapValue!29036))))

(assert (= (and start!76448 res!606143) b!896426))

(assert (= (and b!896426 res!606142) b!896427))

(assert (= (and b!896427 (not res!606144)) b!896432))

(assert (= (and b!896427 (not res!606141)) b!896429))

(assert (= (and b!896431 condMapEmpty!29036) mapIsEmpty!29036))

(assert (= (and b!896431 (not condMapEmpty!29036)) mapNonEmpty!29036))

(assert (= (and mapNonEmpty!29036 ((_ is ValueCellFull!8658) mapValue!29036)) b!896430))

(assert (= (and b!896431 ((_ is ValueCellFull!8658) mapDefault!29036)) b!896425))

(assert (= b!896428 b!896431))

(assert (= start!76448 b!896428))

(declare-fun m!833609 () Bool)

(assert (=> b!896427 m!833609))

(declare-fun m!833611 () Bool)

(assert (=> b!896427 m!833611))

(declare-fun m!833613 () Bool)

(assert (=> mapNonEmpty!29036 m!833613))

(declare-fun m!833615 () Bool)

(assert (=> b!896429 m!833615))

(declare-fun m!833617 () Bool)

(assert (=> b!896429 m!833617))

(declare-fun m!833619 () Bool)

(assert (=> b!896429 m!833619))

(declare-fun m!833621 () Bool)

(assert (=> b!896428 m!833621))

(declare-fun m!833623 () Bool)

(assert (=> b!896428 m!833623))

(declare-fun m!833625 () Bool)

(assert (=> start!76448 m!833625))

(declare-fun m!833627 () Bool)

(assert (=> b!896432 m!833627))

(check-sat (not b!896429) tp_is_empty!18279 (not start!76448) (not mapNonEmpty!29036) (not b_next!15951) (not b!896432) (not b!896427) b_and!26243 (not b!896428))
(check-sat b_and!26243 (not b_next!15951))
(get-model)

(declare-fun d!110909 () Bool)

(assert (=> d!110909 (= (inRange!0 (index!37960 lt!404814) (mask!26018 thiss!1181)) (and (bvsge (index!37960 lt!404814) #b00000000000000000000000000000000) (bvslt (index!37960 lt!404814) (bvadd (mask!26018 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896432 d!110909))

(declare-fun d!110911 () Bool)

(assert (=> d!110911 (= (array_inv!19840 (_keys!10111 thiss!1181)) (bvsge (size!25726 (_keys!10111 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896428 d!110911))

(declare-fun d!110913 () Bool)

(assert (=> d!110913 (= (array_inv!19841 (_values!5370 thiss!1181)) (bvsge (size!25727 (_values!5370 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896428 d!110913))

(declare-fun d!110915 () Bool)

(declare-fun e!501088 () Bool)

(assert (=> d!110915 e!501088))

(declare-fun res!606159 () Bool)

(assert (=> d!110915 (=> res!606159 e!501088)))

(declare-fun lt!404830 () SeekEntryResult!8897)

(assert (=> d!110915 (= res!606159 (not ((_ is Found!8897) lt!404830)))))

(assert (=> d!110915 (= lt!404830 (seekEntry!0 key!785 (_keys!10111 thiss!1181) (mask!26018 thiss!1181)))))

(declare-fun lt!404829 () Unit!30484)

(declare-fun choose!1478 (array!52574 array!52576 (_ BitVec 32) (_ BitVec 32) V!29337 V!29337 (_ BitVec 64)) Unit!30484)

(assert (=> d!110915 (= lt!404829 (choose!1478 (_keys!10111 thiss!1181) (_values!5370 thiss!1181) (mask!26018 thiss!1181) (extraKeys!5079 thiss!1181) (zeroValue!5183 thiss!1181) (minValue!5183 thiss!1181) key!785))))

(assert (=> d!110915 (validMask!0 (mask!26018 thiss!1181))))

(assert (=> d!110915 (= (lemmaSeekEntryGivesInRangeIndex!70 (_keys!10111 thiss!1181) (_values!5370 thiss!1181) (mask!26018 thiss!1181) (extraKeys!5079 thiss!1181) (zeroValue!5183 thiss!1181) (minValue!5183 thiss!1181) key!785) lt!404829)))

(declare-fun b!896459 () Bool)

(assert (=> b!896459 (= e!501088 (inRange!0 (index!37960 lt!404830) (mask!26018 thiss!1181)))))

(assert (= (and d!110915 (not res!606159)) b!896459))

(assert (=> d!110915 m!833611))

(declare-fun m!833649 () Bool)

(assert (=> d!110915 m!833649))

(assert (=> d!110915 m!833615))

(declare-fun m!833651 () Bool)

(assert (=> b!896459 m!833651))

(assert (=> b!896427 d!110915))

(declare-fun b!896472 () Bool)

(declare-fun c!94691 () Bool)

(declare-fun lt!404840 () (_ BitVec 64))

(assert (=> b!896472 (= c!94691 (= lt!404840 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501095 () SeekEntryResult!8897)

(declare-fun e!501097 () SeekEntryResult!8897)

(assert (=> b!896472 (= e!501095 e!501097)))

(declare-fun b!896473 () Bool)

(declare-fun lt!404839 () SeekEntryResult!8897)

(assert (=> b!896473 (= e!501095 (Found!8897 (index!37961 lt!404839)))))

(declare-fun b!896474 () Bool)

(declare-fun lt!404841 () SeekEntryResult!8897)

(assert (=> b!896474 (= e!501097 (ite ((_ is MissingVacant!8897) lt!404841) (MissingZero!8897 (index!37962 lt!404841)) lt!404841))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52574 (_ BitVec 32)) SeekEntryResult!8897)

(assert (=> b!896474 (= lt!404841 (seekKeyOrZeroReturnVacant!0 (x!76330 lt!404839) (index!37961 lt!404839) (index!37961 lt!404839) key!785 (_keys!10111 thiss!1181) (mask!26018 thiss!1181)))))

(declare-fun b!896475 () Bool)

(declare-fun e!501096 () SeekEntryResult!8897)

(assert (=> b!896475 (= e!501096 e!501095)))

(assert (=> b!896475 (= lt!404840 (select (arr!25275 (_keys!10111 thiss!1181)) (index!37961 lt!404839)))))

(declare-fun c!94690 () Bool)

(assert (=> b!896475 (= c!94690 (= lt!404840 key!785))))

(declare-fun b!896476 () Bool)

(assert (=> b!896476 (= e!501097 (MissingZero!8897 (index!37961 lt!404839)))))

(declare-fun b!896477 () Bool)

(assert (=> b!896477 (= e!501096 Undefined!8897)))

(declare-fun d!110917 () Bool)

(declare-fun lt!404842 () SeekEntryResult!8897)

(assert (=> d!110917 (and (or ((_ is MissingVacant!8897) lt!404842) (not ((_ is Found!8897) lt!404842)) (and (bvsge (index!37960 lt!404842) #b00000000000000000000000000000000) (bvslt (index!37960 lt!404842) (size!25726 (_keys!10111 thiss!1181))))) (not ((_ is MissingVacant!8897) lt!404842)) (or (not ((_ is Found!8897) lt!404842)) (= (select (arr!25275 (_keys!10111 thiss!1181)) (index!37960 lt!404842)) key!785)))))

(assert (=> d!110917 (= lt!404842 e!501096)))

(declare-fun c!94689 () Bool)

(assert (=> d!110917 (= c!94689 (and ((_ is Intermediate!8897) lt!404839) (undefined!9709 lt!404839)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52574 (_ BitVec 32)) SeekEntryResult!8897)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110917 (= lt!404839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26018 thiss!1181)) key!785 (_keys!10111 thiss!1181) (mask!26018 thiss!1181)))))

(assert (=> d!110917 (validMask!0 (mask!26018 thiss!1181))))

(assert (=> d!110917 (= (seekEntry!0 key!785 (_keys!10111 thiss!1181) (mask!26018 thiss!1181)) lt!404842)))

(assert (= (and d!110917 c!94689) b!896477))

(assert (= (and d!110917 (not c!94689)) b!896475))

(assert (= (and b!896475 c!94690) b!896473))

(assert (= (and b!896475 (not c!94690)) b!896472))

(assert (= (and b!896472 c!94691) b!896476))

(assert (= (and b!896472 (not c!94691)) b!896474))

(declare-fun m!833653 () Bool)

(assert (=> b!896474 m!833653))

(declare-fun m!833655 () Bool)

(assert (=> b!896475 m!833655))

(declare-fun m!833657 () Bool)

(assert (=> d!110917 m!833657))

(declare-fun m!833659 () Bool)

(assert (=> d!110917 m!833659))

(assert (=> d!110917 m!833659))

(declare-fun m!833661 () Bool)

(assert (=> d!110917 m!833661))

(assert (=> d!110917 m!833615))

(assert (=> b!896427 d!110917))

(declare-fun d!110919 () Bool)

(assert (=> d!110919 (= (validMask!0 (mask!26018 thiss!1181)) (and (or (= (mask!26018 thiss!1181) #b00000000000000000000000000000111) (= (mask!26018 thiss!1181) #b00000000000000000000000000001111) (= (mask!26018 thiss!1181) #b00000000000000000000000000011111) (= (mask!26018 thiss!1181) #b00000000000000000000000000111111) (= (mask!26018 thiss!1181) #b00000000000000000000000001111111) (= (mask!26018 thiss!1181) #b00000000000000000000000011111111) (= (mask!26018 thiss!1181) #b00000000000000000000000111111111) (= (mask!26018 thiss!1181) #b00000000000000000000001111111111) (= (mask!26018 thiss!1181) #b00000000000000000000011111111111) (= (mask!26018 thiss!1181) #b00000000000000000000111111111111) (= (mask!26018 thiss!1181) #b00000000000000000001111111111111) (= (mask!26018 thiss!1181) #b00000000000000000011111111111111) (= (mask!26018 thiss!1181) #b00000000000000000111111111111111) (= (mask!26018 thiss!1181) #b00000000000000001111111111111111) (= (mask!26018 thiss!1181) #b00000000000000011111111111111111) (= (mask!26018 thiss!1181) #b00000000000000111111111111111111) (= (mask!26018 thiss!1181) #b00000000000001111111111111111111) (= (mask!26018 thiss!1181) #b00000000000011111111111111111111) (= (mask!26018 thiss!1181) #b00000000000111111111111111111111) (= (mask!26018 thiss!1181) #b00000000001111111111111111111111) (= (mask!26018 thiss!1181) #b00000000011111111111111111111111) (= (mask!26018 thiss!1181) #b00000000111111111111111111111111) (= (mask!26018 thiss!1181) #b00000001111111111111111111111111) (= (mask!26018 thiss!1181) #b00000011111111111111111111111111) (= (mask!26018 thiss!1181) #b00000111111111111111111111111111) (= (mask!26018 thiss!1181) #b00001111111111111111111111111111) (= (mask!26018 thiss!1181) #b00011111111111111111111111111111) (= (mask!26018 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26018 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!896429 d!110919))

(declare-fun d!110921 () Bool)

(declare-fun res!606164 () Bool)

(declare-fun e!501102 () Bool)

(assert (=> d!110921 (=> res!606164 e!501102)))

(assert (=> d!110921 (= res!606164 (= (select (arr!25275 (_keys!10111 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110921 (= (arrayContainsKey!0 (_keys!10111 thiss!1181) key!785 #b00000000000000000000000000000000) e!501102)))

(declare-fun b!896482 () Bool)

(declare-fun e!501103 () Bool)

(assert (=> b!896482 (= e!501102 e!501103)))

(declare-fun res!606165 () Bool)

(assert (=> b!896482 (=> (not res!606165) (not e!501103))))

(assert (=> b!896482 (= res!606165 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25726 (_keys!10111 thiss!1181))))))

(declare-fun b!896483 () Bool)

(assert (=> b!896483 (= e!501103 (arrayContainsKey!0 (_keys!10111 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110921 (not res!606164)) b!896482))

(assert (= (and b!896482 res!606165) b!896483))

(declare-fun m!833663 () Bool)

(assert (=> d!110921 m!833663))

(declare-fun m!833665 () Bool)

(assert (=> b!896483 m!833665))

(assert (=> b!896429 d!110921))

(declare-fun d!110923 () Bool)

(assert (=> d!110923 (arrayContainsKey!0 (_keys!10111 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404845 () Unit!30484)

(declare-fun choose!13 (array!52574 (_ BitVec 64) (_ BitVec 32)) Unit!30484)

(assert (=> d!110923 (= lt!404845 (choose!13 (_keys!10111 thiss!1181) key!785 (index!37960 lt!404814)))))

(assert (=> d!110923 (bvsge (index!37960 lt!404814) #b00000000000000000000000000000000)))

(assert (=> d!110923 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10111 thiss!1181) key!785 (index!37960 lt!404814)) lt!404845)))

(declare-fun bs!25166 () Bool)

(assert (= bs!25166 d!110923))

(assert (=> bs!25166 m!833617))

(declare-fun m!833667 () Bool)

(assert (=> bs!25166 m!833667))

(assert (=> b!896429 d!110923))

(declare-fun d!110925 () Bool)

(declare-fun res!606172 () Bool)

(declare-fun e!501106 () Bool)

(assert (=> d!110925 (=> (not res!606172) (not e!501106))))

(declare-fun simpleValid!313 (LongMapFixedSize!4332) Bool)

(assert (=> d!110925 (= res!606172 (simpleValid!313 thiss!1181))))

(assert (=> d!110925 (= (valid!1671 thiss!1181) e!501106)))

(declare-fun b!896490 () Bool)

(declare-fun res!606173 () Bool)

(assert (=> b!896490 (=> (not res!606173) (not e!501106))))

(declare-fun arrayCountValidKeys!0 (array!52574 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896490 (= res!606173 (= (arrayCountValidKeys!0 (_keys!10111 thiss!1181) #b00000000000000000000000000000000 (size!25726 (_keys!10111 thiss!1181))) (_size!2221 thiss!1181)))))

(declare-fun b!896491 () Bool)

(declare-fun res!606174 () Bool)

(assert (=> b!896491 (=> (not res!606174) (not e!501106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52574 (_ BitVec 32)) Bool)

(assert (=> b!896491 (= res!606174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10111 thiss!1181) (mask!26018 thiss!1181)))))

(declare-fun b!896492 () Bool)

(declare-datatypes ((List!17823 0))(
  ( (Nil!17820) (Cons!17819 (h!18957 (_ BitVec 64)) (t!25162 List!17823)) )
))
(declare-fun arrayNoDuplicates!0 (array!52574 (_ BitVec 32) List!17823) Bool)

(assert (=> b!896492 (= e!501106 (arrayNoDuplicates!0 (_keys!10111 thiss!1181) #b00000000000000000000000000000000 Nil!17820))))

(assert (= (and d!110925 res!606172) b!896490))

(assert (= (and b!896490 res!606173) b!896491))

(assert (= (and b!896491 res!606174) b!896492))

(declare-fun m!833669 () Bool)

(assert (=> d!110925 m!833669))

(declare-fun m!833671 () Bool)

(assert (=> b!896490 m!833671))

(declare-fun m!833673 () Bool)

(assert (=> b!896491 m!833673))

(declare-fun m!833675 () Bool)

(assert (=> b!896492 m!833675))

(assert (=> start!76448 d!110925))

(declare-fun mapNonEmpty!29042 () Bool)

(declare-fun mapRes!29042 () Bool)

(declare-fun tp!55894 () Bool)

(declare-fun e!501112 () Bool)

(assert (=> mapNonEmpty!29042 (= mapRes!29042 (and tp!55894 e!501112))))

(declare-fun mapValue!29042 () ValueCell!8658)

(declare-fun mapKey!29042 () (_ BitVec 32))

(declare-fun mapRest!29042 () (Array (_ BitVec 32) ValueCell!8658))

(assert (=> mapNonEmpty!29042 (= mapRest!29036 (store mapRest!29042 mapKey!29042 mapValue!29042))))

(declare-fun mapIsEmpty!29042 () Bool)

(assert (=> mapIsEmpty!29042 mapRes!29042))

(declare-fun b!896499 () Bool)

(assert (=> b!896499 (= e!501112 tp_is_empty!18279)))

(declare-fun b!896500 () Bool)

(declare-fun e!501111 () Bool)

(assert (=> b!896500 (= e!501111 tp_is_empty!18279)))

(declare-fun condMapEmpty!29042 () Bool)

(declare-fun mapDefault!29042 () ValueCell!8658)

(assert (=> mapNonEmpty!29036 (= condMapEmpty!29042 (= mapRest!29036 ((as const (Array (_ BitVec 32) ValueCell!8658)) mapDefault!29042)))))

(assert (=> mapNonEmpty!29036 (= tp!55885 (and e!501111 mapRes!29042))))

(assert (= (and mapNonEmpty!29036 condMapEmpty!29042) mapIsEmpty!29042))

(assert (= (and mapNonEmpty!29036 (not condMapEmpty!29042)) mapNonEmpty!29042))

(assert (= (and mapNonEmpty!29042 ((_ is ValueCellFull!8658) mapValue!29042)) b!896499))

(assert (= (and mapNonEmpty!29036 ((_ is ValueCellFull!8658) mapDefault!29042)) b!896500))

(declare-fun m!833677 () Bool)

(assert (=> mapNonEmpty!29042 m!833677))

(check-sat (not d!110925) (not d!110917) (not b!896459) b_and!26243 (not b!896492) tp_is_empty!18279 (not mapNonEmpty!29042) (not b!896491) (not b!896490) (not d!110915) (not b_next!15951) (not d!110923) (not b!896474) (not b!896483))
(check-sat b_and!26243 (not b_next!15951))
