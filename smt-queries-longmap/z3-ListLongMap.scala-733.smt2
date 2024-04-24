; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17106 () Bool)

(assert start!17106)

(declare-fun b!172095 () Bool)

(declare-fun b_free!4237 () Bool)

(declare-fun b_next!4237 () Bool)

(assert (=> b!172095 (= b_free!4237 (not b_next!4237))))

(declare-fun tp!15346 () Bool)

(declare-fun b_and!10691 () Bool)

(assert (=> b!172095 (= tp!15346 b_and!10691)))

(declare-fun b!172094 () Bool)

(declare-fun e!113563 () Bool)

(declare-datatypes ((V!4993 0))(
  ( (V!4994 (val!2049 Int)) )
))
(declare-datatypes ((ValueCell!1661 0))(
  ( (ValueCellFull!1661 (v!3918 V!4993)) (EmptyCell!1661) )
))
(declare-datatypes ((array!7119 0))(
  ( (array!7120 (arr!3386 (Array (_ BitVec 32) (_ BitVec 64))) (size!3680 (_ BitVec 32))) )
))
(declare-datatypes ((array!7121 0))(
  ( (array!7122 (arr!3387 (Array (_ BitVec 32) ValueCell!1661)) (size!3681 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2230 0))(
  ( (LongMapFixedSize!2231 (defaultEntry!3561 Int) (mask!8394 (_ BitVec 32)) (extraKeys!3300 (_ BitVec 32)) (zeroValue!3402 V!4993) (minValue!3404 V!4993) (_size!1164 (_ BitVec 32)) (_keys!5395 array!7119) (_values!3544 array!7121) (_vacant!1164 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2230)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172094 (= e!113563 (not (validMask!0 (mask!8394 thiss!1248))))))

(declare-fun mapIsEmpty!6811 () Bool)

(declare-fun mapRes!6811 () Bool)

(assert (=> mapIsEmpty!6811 mapRes!6811))

(declare-fun tp_is_empty!4009 () Bool)

(declare-fun e!113565 () Bool)

(declare-fun e!113562 () Bool)

(declare-fun array_inv!2179 (array!7119) Bool)

(declare-fun array_inv!2180 (array!7121) Bool)

(assert (=> b!172095 (= e!113562 (and tp!15346 tp_is_empty!4009 (array_inv!2179 (_keys!5395 thiss!1248)) (array_inv!2180 (_values!3544 thiss!1248)) e!113565))))

(declare-fun b!172096 () Bool)

(declare-fun e!113566 () Bool)

(assert (=> b!172096 (= e!113566 tp_is_empty!4009)))

(declare-fun mapNonEmpty!6811 () Bool)

(declare-fun tp!15345 () Bool)

(declare-fun e!113564 () Bool)

(assert (=> mapNonEmpty!6811 (= mapRes!6811 (and tp!15345 e!113564))))

(declare-fun mapKey!6811 () (_ BitVec 32))

(declare-fun mapRest!6811 () (Array (_ BitVec 32) ValueCell!1661))

(declare-fun mapValue!6811 () ValueCell!1661)

(assert (=> mapNonEmpty!6811 (= (arr!3387 (_values!3544 thiss!1248)) (store mapRest!6811 mapKey!6811 mapValue!6811))))

(declare-fun res!81720 () Bool)

(assert (=> start!17106 (=> (not res!81720) (not e!113563))))

(declare-fun valid!965 (LongMapFixedSize!2230) Bool)

(assert (=> start!17106 (= res!81720 (valid!965 thiss!1248))))

(assert (=> start!17106 e!113563))

(assert (=> start!17106 e!113562))

(assert (=> start!17106 true))

(declare-fun b!172097 () Bool)

(declare-fun res!81719 () Bool)

(assert (=> b!172097 (=> (not res!81719) (not e!113563))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172097 (= res!81719 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172098 () Bool)

(assert (=> b!172098 (= e!113565 (and e!113566 mapRes!6811))))

(declare-fun condMapEmpty!6811 () Bool)

(declare-fun mapDefault!6811 () ValueCell!1661)

(assert (=> b!172098 (= condMapEmpty!6811 (= (arr!3387 (_values!3544 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1661)) mapDefault!6811)))))

(declare-fun b!172099 () Bool)

(assert (=> b!172099 (= e!113564 tp_is_empty!4009)))

(assert (= (and start!17106 res!81720) b!172097))

(assert (= (and b!172097 res!81719) b!172094))

(assert (= (and b!172098 condMapEmpty!6811) mapIsEmpty!6811))

(assert (= (and b!172098 (not condMapEmpty!6811)) mapNonEmpty!6811))

(get-info :version)

(assert (= (and mapNonEmpty!6811 ((_ is ValueCellFull!1661) mapValue!6811)) b!172099))

(assert (= (and b!172098 ((_ is ValueCellFull!1661) mapDefault!6811)) b!172096))

(assert (= b!172095 b!172098))

(assert (= start!17106 b!172095))

(declare-fun m!201225 () Bool)

(assert (=> b!172094 m!201225))

(declare-fun m!201227 () Bool)

(assert (=> b!172095 m!201227))

(declare-fun m!201229 () Bool)

(assert (=> b!172095 m!201229))

(declare-fun m!201231 () Bool)

(assert (=> mapNonEmpty!6811 m!201231))

(declare-fun m!201233 () Bool)

(assert (=> start!17106 m!201233))

(check-sat (not mapNonEmpty!6811) tp_is_empty!4009 (not b!172094) b_and!10691 (not start!17106) (not b!172095) (not b_next!4237))
(check-sat b_and!10691 (not b_next!4237))
(get-model)

(declare-fun d!52529 () Bool)

(assert (=> d!52529 (= (validMask!0 (mask!8394 thiss!1248)) (and (or (= (mask!8394 thiss!1248) #b00000000000000000000000000000111) (= (mask!8394 thiss!1248) #b00000000000000000000000000001111) (= (mask!8394 thiss!1248) #b00000000000000000000000000011111) (= (mask!8394 thiss!1248) #b00000000000000000000000000111111) (= (mask!8394 thiss!1248) #b00000000000000000000000001111111) (= (mask!8394 thiss!1248) #b00000000000000000000000011111111) (= (mask!8394 thiss!1248) #b00000000000000000000000111111111) (= (mask!8394 thiss!1248) #b00000000000000000000001111111111) (= (mask!8394 thiss!1248) #b00000000000000000000011111111111) (= (mask!8394 thiss!1248) #b00000000000000000000111111111111) (= (mask!8394 thiss!1248) #b00000000000000000001111111111111) (= (mask!8394 thiss!1248) #b00000000000000000011111111111111) (= (mask!8394 thiss!1248) #b00000000000000000111111111111111) (= (mask!8394 thiss!1248) #b00000000000000001111111111111111) (= (mask!8394 thiss!1248) #b00000000000000011111111111111111) (= (mask!8394 thiss!1248) #b00000000000000111111111111111111) (= (mask!8394 thiss!1248) #b00000000000001111111111111111111) (= (mask!8394 thiss!1248) #b00000000000011111111111111111111) (= (mask!8394 thiss!1248) #b00000000000111111111111111111111) (= (mask!8394 thiss!1248) #b00000000001111111111111111111111) (= (mask!8394 thiss!1248) #b00000000011111111111111111111111) (= (mask!8394 thiss!1248) #b00000000111111111111111111111111) (= (mask!8394 thiss!1248) #b00000001111111111111111111111111) (= (mask!8394 thiss!1248) #b00000011111111111111111111111111) (= (mask!8394 thiss!1248) #b00000111111111111111111111111111) (= (mask!8394 thiss!1248) #b00001111111111111111111111111111) (= (mask!8394 thiss!1248) #b00011111111111111111111111111111) (= (mask!8394 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8394 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172094 d!52529))

(declare-fun d!52531 () Bool)

(assert (=> d!52531 (= (array_inv!2179 (_keys!5395 thiss!1248)) (bvsge (size!3680 (_keys!5395 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172095 d!52531))

(declare-fun d!52533 () Bool)

(assert (=> d!52533 (= (array_inv!2180 (_values!3544 thiss!1248)) (bvsge (size!3681 (_values!3544 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172095 d!52533))

(declare-fun d!52535 () Bool)

(declare-fun res!81739 () Bool)

(declare-fun e!113605 () Bool)

(assert (=> d!52535 (=> (not res!81739) (not e!113605))))

(declare-fun simpleValid!136 (LongMapFixedSize!2230) Bool)

(assert (=> d!52535 (= res!81739 (simpleValid!136 thiss!1248))))

(assert (=> d!52535 (= (valid!965 thiss!1248) e!113605)))

(declare-fun b!172142 () Bool)

(declare-fun res!81740 () Bool)

(assert (=> b!172142 (=> (not res!81740) (not e!113605))))

(declare-fun arrayCountValidKeys!0 (array!7119 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172142 (= res!81740 (= (arrayCountValidKeys!0 (_keys!5395 thiss!1248) #b00000000000000000000000000000000 (size!3680 (_keys!5395 thiss!1248))) (_size!1164 thiss!1248)))))

(declare-fun b!172143 () Bool)

(declare-fun res!81741 () Bool)

(assert (=> b!172143 (=> (not res!81741) (not e!113605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7119 (_ BitVec 32)) Bool)

(assert (=> b!172143 (= res!81741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5395 thiss!1248) (mask!8394 thiss!1248)))))

(declare-fun b!172144 () Bool)

(declare-datatypes ((List!2179 0))(
  ( (Nil!2176) (Cons!2175 (h!2792 (_ BitVec 64)) (t!6978 List!2179)) )
))
(declare-fun arrayNoDuplicates!0 (array!7119 (_ BitVec 32) List!2179) Bool)

(assert (=> b!172144 (= e!113605 (arrayNoDuplicates!0 (_keys!5395 thiss!1248) #b00000000000000000000000000000000 Nil!2176))))

(assert (= (and d!52535 res!81739) b!172142))

(assert (= (and b!172142 res!81740) b!172143))

(assert (= (and b!172143 res!81741) b!172144))

(declare-fun m!201255 () Bool)

(assert (=> d!52535 m!201255))

(declare-fun m!201257 () Bool)

(assert (=> b!172142 m!201257))

(declare-fun m!201259 () Bool)

(assert (=> b!172143 m!201259))

(declare-fun m!201261 () Bool)

(assert (=> b!172144 m!201261))

(assert (=> start!17106 d!52535))

(declare-fun b!172152 () Bool)

(declare-fun e!113611 () Bool)

(assert (=> b!172152 (= e!113611 tp_is_empty!4009)))

(declare-fun mapNonEmpty!6820 () Bool)

(declare-fun mapRes!6820 () Bool)

(declare-fun tp!15361 () Bool)

(declare-fun e!113610 () Bool)

(assert (=> mapNonEmpty!6820 (= mapRes!6820 (and tp!15361 e!113610))))

(declare-fun mapKey!6820 () (_ BitVec 32))

(declare-fun mapRest!6820 () (Array (_ BitVec 32) ValueCell!1661))

(declare-fun mapValue!6820 () ValueCell!1661)

(assert (=> mapNonEmpty!6820 (= mapRest!6811 (store mapRest!6820 mapKey!6820 mapValue!6820))))

(declare-fun b!172151 () Bool)

(assert (=> b!172151 (= e!113610 tp_is_empty!4009)))

(declare-fun mapIsEmpty!6820 () Bool)

(assert (=> mapIsEmpty!6820 mapRes!6820))

(declare-fun condMapEmpty!6820 () Bool)

(declare-fun mapDefault!6820 () ValueCell!1661)

(assert (=> mapNonEmpty!6811 (= condMapEmpty!6820 (= mapRest!6811 ((as const (Array (_ BitVec 32) ValueCell!1661)) mapDefault!6820)))))

(assert (=> mapNonEmpty!6811 (= tp!15345 (and e!113611 mapRes!6820))))

(assert (= (and mapNonEmpty!6811 condMapEmpty!6820) mapIsEmpty!6820))

(assert (= (and mapNonEmpty!6811 (not condMapEmpty!6820)) mapNonEmpty!6820))

(assert (= (and mapNonEmpty!6820 ((_ is ValueCellFull!1661) mapValue!6820)) b!172151))

(assert (= (and mapNonEmpty!6811 ((_ is ValueCellFull!1661) mapDefault!6820)) b!172152))

(declare-fun m!201263 () Bool)

(assert (=> mapNonEmpty!6820 m!201263))

(check-sat (not d!52535) (not mapNonEmpty!6820) tp_is_empty!4009 (not b_next!4237) (not b!172143) (not b!172144) (not b!172142) b_and!10691)
(check-sat b_and!10691 (not b_next!4237))
(get-model)

(declare-fun bm!17491 () Bool)

(declare-fun call!17494 () Bool)

(declare-fun c!30843 () Bool)

(assert (=> bm!17491 (= call!17494 (arrayNoDuplicates!0 (_keys!5395 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30843 (Cons!2175 (select (arr!3386 (_keys!5395 thiss!1248)) #b00000000000000000000000000000000) Nil!2176) Nil!2176)))))

(declare-fun b!172163 () Bool)

(declare-fun e!113621 () Bool)

(declare-fun e!113622 () Bool)

(assert (=> b!172163 (= e!113621 e!113622)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!172163 (= c!30843 (validKeyInArray!0 (select (arr!3386 (_keys!5395 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52537 () Bool)

(declare-fun res!81748 () Bool)

(declare-fun e!113623 () Bool)

(assert (=> d!52537 (=> res!81748 e!113623)))

(assert (=> d!52537 (= res!81748 (bvsge #b00000000000000000000000000000000 (size!3680 (_keys!5395 thiss!1248))))))

(assert (=> d!52537 (= (arrayNoDuplicates!0 (_keys!5395 thiss!1248) #b00000000000000000000000000000000 Nil!2176) e!113623)))

(declare-fun b!172164 () Bool)

(declare-fun e!113620 () Bool)

(declare-fun contains!1143 (List!2179 (_ BitVec 64)) Bool)

(assert (=> b!172164 (= e!113620 (contains!1143 Nil!2176 (select (arr!3386 (_keys!5395 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172165 () Bool)

(assert (=> b!172165 (= e!113623 e!113621)))

(declare-fun res!81749 () Bool)

(assert (=> b!172165 (=> (not res!81749) (not e!113621))))

(assert (=> b!172165 (= res!81749 (not e!113620))))

(declare-fun res!81750 () Bool)

(assert (=> b!172165 (=> (not res!81750) (not e!113620))))

(assert (=> b!172165 (= res!81750 (validKeyInArray!0 (select (arr!3386 (_keys!5395 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172166 () Bool)

(assert (=> b!172166 (= e!113622 call!17494)))

(declare-fun b!172167 () Bool)

(assert (=> b!172167 (= e!113622 call!17494)))

(assert (= (and d!52537 (not res!81748)) b!172165))

(assert (= (and b!172165 res!81750) b!172164))

(assert (= (and b!172165 res!81749) b!172163))

(assert (= (and b!172163 c!30843) b!172167))

(assert (= (and b!172163 (not c!30843)) b!172166))

(assert (= (or b!172167 b!172166) bm!17491))

(declare-fun m!201265 () Bool)

(assert (=> bm!17491 m!201265))

(declare-fun m!201267 () Bool)

(assert (=> bm!17491 m!201267))

(assert (=> b!172163 m!201265))

(assert (=> b!172163 m!201265))

(declare-fun m!201269 () Bool)

(assert (=> b!172163 m!201269))

(assert (=> b!172164 m!201265))

(assert (=> b!172164 m!201265))

(declare-fun m!201271 () Bool)

(assert (=> b!172164 m!201271))

(assert (=> b!172165 m!201265))

(assert (=> b!172165 m!201265))

(assert (=> b!172165 m!201269))

(assert (=> b!172144 d!52537))

(declare-fun d!52539 () Bool)

(declare-fun res!81762 () Bool)

(declare-fun e!113626 () Bool)

(assert (=> d!52539 (=> (not res!81762) (not e!113626))))

(assert (=> d!52539 (= res!81762 (validMask!0 (mask!8394 thiss!1248)))))

(assert (=> d!52539 (= (simpleValid!136 thiss!1248) e!113626)))

(declare-fun b!172179 () Bool)

(assert (=> b!172179 (= e!113626 (and (bvsge (extraKeys!3300 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3300 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1164 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!172177 () Bool)

(declare-fun res!81760 () Bool)

(assert (=> b!172177 (=> (not res!81760) (not e!113626))))

(declare-fun size!3686 (LongMapFixedSize!2230) (_ BitVec 32))

(assert (=> b!172177 (= res!81760 (bvsge (size!3686 thiss!1248) (_size!1164 thiss!1248)))))

(declare-fun b!172176 () Bool)

(declare-fun res!81759 () Bool)

(assert (=> b!172176 (=> (not res!81759) (not e!113626))))

(assert (=> b!172176 (= res!81759 (and (= (size!3681 (_values!3544 thiss!1248)) (bvadd (mask!8394 thiss!1248) #b00000000000000000000000000000001)) (= (size!3680 (_keys!5395 thiss!1248)) (size!3681 (_values!3544 thiss!1248))) (bvsge (_size!1164 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1164 thiss!1248) (bvadd (mask!8394 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!172178 () Bool)

(declare-fun res!81761 () Bool)

(assert (=> b!172178 (=> (not res!81761) (not e!113626))))

(assert (=> b!172178 (= res!81761 (= (size!3686 thiss!1248) (bvadd (_size!1164 thiss!1248) (bvsdiv (bvadd (extraKeys!3300 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!52539 res!81762) b!172176))

(assert (= (and b!172176 res!81759) b!172177))

(assert (= (and b!172177 res!81760) b!172178))

(assert (= (and b!172178 res!81761) b!172179))

(assert (=> d!52539 m!201225))

(declare-fun m!201273 () Bool)

(assert (=> b!172177 m!201273))

(assert (=> b!172178 m!201273))

(assert (=> d!52535 d!52539))

(declare-fun b!172188 () Bool)

(declare-fun e!113631 () (_ BitVec 32))

(declare-fun e!113632 () (_ BitVec 32))

(assert (=> b!172188 (= e!113631 e!113632)))

(declare-fun c!30849 () Bool)

(assert (=> b!172188 (= c!30849 (validKeyInArray!0 (select (arr!3386 (_keys!5395 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172189 () Bool)

(assert (=> b!172189 (= e!113631 #b00000000000000000000000000000000)))

(declare-fun bm!17494 () Bool)

(declare-fun call!17497 () (_ BitVec 32))

(assert (=> bm!17494 (= call!17497 (arrayCountValidKeys!0 (_keys!5395 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3680 (_keys!5395 thiss!1248))))))

(declare-fun b!172190 () Bool)

(assert (=> b!172190 (= e!113632 (bvadd #b00000000000000000000000000000001 call!17497))))

(declare-fun b!172191 () Bool)

(assert (=> b!172191 (= e!113632 call!17497)))

(declare-fun d!52541 () Bool)

(declare-fun lt!85695 () (_ BitVec 32))

(assert (=> d!52541 (and (bvsge lt!85695 #b00000000000000000000000000000000) (bvsle lt!85695 (bvsub (size!3680 (_keys!5395 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52541 (= lt!85695 e!113631)))

(declare-fun c!30848 () Bool)

(assert (=> d!52541 (= c!30848 (bvsge #b00000000000000000000000000000000 (size!3680 (_keys!5395 thiss!1248))))))

(assert (=> d!52541 (and (bvsle #b00000000000000000000000000000000 (size!3680 (_keys!5395 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3680 (_keys!5395 thiss!1248)) (size!3680 (_keys!5395 thiss!1248))))))

(assert (=> d!52541 (= (arrayCountValidKeys!0 (_keys!5395 thiss!1248) #b00000000000000000000000000000000 (size!3680 (_keys!5395 thiss!1248))) lt!85695)))

(assert (= (and d!52541 c!30848) b!172189))

(assert (= (and d!52541 (not c!30848)) b!172188))

(assert (= (and b!172188 c!30849) b!172190))

(assert (= (and b!172188 (not c!30849)) b!172191))

(assert (= (or b!172190 b!172191) bm!17494))

(assert (=> b!172188 m!201265))

(assert (=> b!172188 m!201265))

(assert (=> b!172188 m!201269))

(declare-fun m!201275 () Bool)

(assert (=> bm!17494 m!201275))

(assert (=> b!172142 d!52541))

(declare-fun b!172200 () Bool)

(declare-fun e!113639 () Bool)

(declare-fun call!17500 () Bool)

(assert (=> b!172200 (= e!113639 call!17500)))

(declare-fun b!172201 () Bool)

(declare-fun e!113641 () Bool)

(declare-fun e!113640 () Bool)

(assert (=> b!172201 (= e!113641 e!113640)))

(declare-fun c!30852 () Bool)

(assert (=> b!172201 (= c!30852 (validKeyInArray!0 (select (arr!3386 (_keys!5395 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52543 () Bool)

(declare-fun res!81768 () Bool)

(assert (=> d!52543 (=> res!81768 e!113641)))

(assert (=> d!52543 (= res!81768 (bvsge #b00000000000000000000000000000000 (size!3680 (_keys!5395 thiss!1248))))))

(assert (=> d!52543 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5395 thiss!1248) (mask!8394 thiss!1248)) e!113641)))

(declare-fun b!172202 () Bool)

(assert (=> b!172202 (= e!113640 e!113639)))

(declare-fun lt!85702 () (_ BitVec 64))

(assert (=> b!172202 (= lt!85702 (select (arr!3386 (_keys!5395 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5301 0))(
  ( (Unit!5302) )
))
(declare-fun lt!85703 () Unit!5301)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7119 (_ BitVec 64) (_ BitVec 32)) Unit!5301)

(assert (=> b!172202 (= lt!85703 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5395 thiss!1248) lt!85702 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!172202 (arrayContainsKey!0 (_keys!5395 thiss!1248) lt!85702 #b00000000000000000000000000000000)))

(declare-fun lt!85704 () Unit!5301)

(assert (=> b!172202 (= lt!85704 lt!85703)))

(declare-fun res!81767 () Bool)

(declare-datatypes ((SeekEntryResult!529 0))(
  ( (MissingZero!529 (index!4284 (_ BitVec 32))) (Found!529 (index!4285 (_ BitVec 32))) (Intermediate!529 (undefined!1341 Bool) (index!4286 (_ BitVec 32)) (x!18984 (_ BitVec 32))) (Undefined!529) (MissingVacant!529 (index!4287 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7119 (_ BitVec 32)) SeekEntryResult!529)

(assert (=> b!172202 (= res!81767 (= (seekEntryOrOpen!0 (select (arr!3386 (_keys!5395 thiss!1248)) #b00000000000000000000000000000000) (_keys!5395 thiss!1248) (mask!8394 thiss!1248)) (Found!529 #b00000000000000000000000000000000)))))

(assert (=> b!172202 (=> (not res!81767) (not e!113639))))

(declare-fun bm!17497 () Bool)

(assert (=> bm!17497 (= call!17500 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5395 thiss!1248) (mask!8394 thiss!1248)))))

(declare-fun b!172203 () Bool)

(assert (=> b!172203 (= e!113640 call!17500)))

(assert (= (and d!52543 (not res!81768)) b!172201))

(assert (= (and b!172201 c!30852) b!172202))

(assert (= (and b!172201 (not c!30852)) b!172203))

(assert (= (and b!172202 res!81767) b!172200))

(assert (= (or b!172200 b!172203) bm!17497))

(assert (=> b!172201 m!201265))

(assert (=> b!172201 m!201265))

(assert (=> b!172201 m!201269))

(assert (=> b!172202 m!201265))

(declare-fun m!201277 () Bool)

(assert (=> b!172202 m!201277))

(declare-fun m!201279 () Bool)

(assert (=> b!172202 m!201279))

(assert (=> b!172202 m!201265))

(declare-fun m!201281 () Bool)

(assert (=> b!172202 m!201281))

(declare-fun m!201283 () Bool)

(assert (=> bm!17497 m!201283))

(assert (=> b!172143 d!52543))

(declare-fun b!172205 () Bool)

(declare-fun e!113643 () Bool)

(assert (=> b!172205 (= e!113643 tp_is_empty!4009)))

(declare-fun mapNonEmpty!6821 () Bool)

(declare-fun mapRes!6821 () Bool)

(declare-fun tp!15362 () Bool)

(declare-fun e!113642 () Bool)

(assert (=> mapNonEmpty!6821 (= mapRes!6821 (and tp!15362 e!113642))))

(declare-fun mapKey!6821 () (_ BitVec 32))

(declare-fun mapValue!6821 () ValueCell!1661)

(declare-fun mapRest!6821 () (Array (_ BitVec 32) ValueCell!1661))

(assert (=> mapNonEmpty!6821 (= mapRest!6820 (store mapRest!6821 mapKey!6821 mapValue!6821))))

(declare-fun b!172204 () Bool)

(assert (=> b!172204 (= e!113642 tp_is_empty!4009)))

(declare-fun mapIsEmpty!6821 () Bool)

(assert (=> mapIsEmpty!6821 mapRes!6821))

(declare-fun condMapEmpty!6821 () Bool)

(declare-fun mapDefault!6821 () ValueCell!1661)

(assert (=> mapNonEmpty!6820 (= condMapEmpty!6821 (= mapRest!6820 ((as const (Array (_ BitVec 32) ValueCell!1661)) mapDefault!6821)))))

(assert (=> mapNonEmpty!6820 (= tp!15361 (and e!113643 mapRes!6821))))

(assert (= (and mapNonEmpty!6820 condMapEmpty!6821) mapIsEmpty!6821))

(assert (= (and mapNonEmpty!6820 (not condMapEmpty!6821)) mapNonEmpty!6821))

(assert (= (and mapNonEmpty!6821 ((_ is ValueCellFull!1661) mapValue!6821)) b!172204))

(assert (= (and mapNonEmpty!6820 ((_ is ValueCellFull!1661) mapDefault!6821)) b!172205))

(declare-fun m!201285 () Bool)

(assert (=> mapNonEmpty!6821 m!201285))

(check-sat (not bm!17494) (not bm!17491) (not mapNonEmpty!6821) (not b!172163) (not bm!17497) (not b!172202) (not d!52539) (not b!172177) (not b!172201) (not b!172165) (not b!172188) tp_is_empty!4009 b_and!10691 (not b!172164) (not b!172178) (not b_next!4237))
(check-sat b_and!10691 (not b_next!4237))
