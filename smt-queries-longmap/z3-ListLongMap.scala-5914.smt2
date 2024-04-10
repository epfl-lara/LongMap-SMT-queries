; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76664 () Bool)

(assert start!76664)

(declare-fun b!897592 () Bool)

(declare-fun b_free!15987 () Bool)

(declare-fun b_next!15987 () Bool)

(assert (=> b!897592 (= b_free!15987 (not b_next!15987))))

(declare-fun tp!56015 () Bool)

(declare-fun b_and!26279 () Bool)

(assert (=> b!897592 (= tp!56015 b_and!26279)))

(declare-fun b!897588 () Bool)

(declare-fun e!501947 () Bool)

(declare-fun e!501946 () Bool)

(assert (=> b!897588 (= e!501947 (not e!501946))))

(declare-fun res!606688 () Bool)

(assert (=> b!897588 (=> res!606688 e!501946)))

(declare-datatypes ((SeekEntryResult!8911 0))(
  ( (MissingZero!8911 (index!38015 (_ BitVec 32))) (Found!8911 (index!38016 (_ BitVec 32))) (Intermediate!8911 (undefined!9723 Bool) (index!38017 (_ BitVec 32)) (x!76476 (_ BitVec 32))) (Undefined!8911) (MissingVacant!8911 (index!38018 (_ BitVec 32))) )
))
(declare-fun lt!405234 () SeekEntryResult!8911)

(get-info :version)

(assert (=> b!897588 (= res!606688 (not ((_ is Found!8911) lt!405234)))))

(declare-fun e!501950 () Bool)

(assert (=> b!897588 e!501950))

(declare-fun res!606691 () Bool)

(assert (=> b!897588 (=> res!606691 e!501950)))

(assert (=> b!897588 (= res!606691 (not ((_ is Found!8911) lt!405234)))))

(declare-datatypes ((Unit!30512 0))(
  ( (Unit!30513) )
))
(declare-fun lt!405233 () Unit!30512)

(declare-datatypes ((array!52658 0))(
  ( (array!52659 (arr!25311 (Array (_ BitVec 32) (_ BitVec 64))) (size!25766 (_ BitVec 32))) )
))
(declare-datatypes ((V!29385 0))(
  ( (V!29386 (val!9208 Int)) )
))
(declare-datatypes ((ValueCell!8676 0))(
  ( (ValueCellFull!8676 (v!11698 V!29385)) (EmptyCell!8676) )
))
(declare-datatypes ((array!52660 0))(
  ( (array!52661 (arr!25312 (Array (_ BitVec 32) ValueCell!8676)) (size!25767 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4368 0))(
  ( (LongMapFixedSize!4369 (defaultEntry!5396 Int) (mask!26092 (_ BitVec 32)) (extraKeys!5107 (_ BitVec 32)) (zeroValue!5211 V!29385) (minValue!5211 V!29385) (_size!2239 (_ BitVec 32)) (_keys!10157 array!52658) (_values!5398 array!52660) (_vacant!2239 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4368)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!81 (array!52658 array!52660 (_ BitVec 32) (_ BitVec 32) V!29385 V!29385 (_ BitVec 64)) Unit!30512)

(assert (=> b!897588 (= lt!405233 (lemmaSeekEntryGivesInRangeIndex!81 (_keys!10157 thiss!1181) (_values!5398 thiss!1181) (mask!26092 thiss!1181) (extraKeys!5107 thiss!1181) (zeroValue!5211 thiss!1181) (minValue!5211 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52658 (_ BitVec 32)) SeekEntryResult!8911)

(assert (=> b!897588 (= lt!405234 (seekEntry!0 key!785 (_keys!10157 thiss!1181) (mask!26092 thiss!1181)))))

(declare-fun b!897589 () Bool)

(declare-fun e!501944 () Bool)

(declare-fun tp_is_empty!18315 () Bool)

(assert (=> b!897589 (= e!501944 tp_is_empty!18315)))

(declare-fun b!897590 () Bool)

(declare-fun e!501945 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52658 (_ BitVec 32)) Bool)

(assert (=> b!897590 (= e!501945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10157 thiss!1181) (mask!26092 thiss!1181)))))

(declare-fun b!897591 () Bool)

(declare-fun e!501942 () Bool)

(assert (=> b!897591 (= e!501942 tp_is_empty!18315)))

(declare-fun mapNonEmpty!29112 () Bool)

(declare-fun mapRes!29112 () Bool)

(declare-fun tp!56014 () Bool)

(assert (=> mapNonEmpty!29112 (= mapRes!29112 (and tp!56014 e!501944))))

(declare-fun mapKey!29112 () (_ BitVec 32))

(declare-fun mapRest!29112 () (Array (_ BitVec 32) ValueCell!8676))

(declare-fun mapValue!29112 () ValueCell!8676)

(assert (=> mapNonEmpty!29112 (= (arr!25312 (_values!5398 thiss!1181)) (store mapRest!29112 mapKey!29112 mapValue!29112))))

(declare-fun e!501943 () Bool)

(declare-fun e!501949 () Bool)

(declare-fun array_inv!19866 (array!52658) Bool)

(declare-fun array_inv!19867 (array!52660) Bool)

(assert (=> b!897592 (= e!501949 (and tp!56015 tp_is_empty!18315 (array_inv!19866 (_keys!10157 thiss!1181)) (array_inv!19867 (_values!5398 thiss!1181)) e!501943))))

(declare-fun b!897593 () Bool)

(assert (=> b!897593 (= e!501943 (and e!501942 mapRes!29112))))

(declare-fun condMapEmpty!29112 () Bool)

(declare-fun mapDefault!29112 () ValueCell!8676)

(assert (=> b!897593 (= condMapEmpty!29112 (= (arr!25312 (_values!5398 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8676)) mapDefault!29112)))))

(declare-fun b!897594 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897594 (= e!501950 (inRange!0 (index!38016 lt!405234) (mask!26092 thiss!1181)))))

(declare-fun b!897595 () Bool)

(assert (=> b!897595 (= e!501946 e!501945)))

(declare-fun res!606692 () Bool)

(assert (=> b!897595 (=> res!606692 e!501945)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897595 (= res!606692 (not (validMask!0 (mask!26092 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897595 (arrayContainsKey!0 (_keys!10157 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405235 () Unit!30512)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52658 (_ BitVec 64) (_ BitVec 32)) Unit!30512)

(assert (=> b!897595 (= lt!405235 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10157 thiss!1181) key!785 (index!38016 lt!405234)))))

(declare-fun mapIsEmpty!29112 () Bool)

(assert (=> mapIsEmpty!29112 mapRes!29112))

(declare-fun res!606693 () Bool)

(assert (=> start!76664 (=> (not res!606693) (not e!501947))))

(declare-fun valid!1682 (LongMapFixedSize!4368) Bool)

(assert (=> start!76664 (= res!606693 (valid!1682 thiss!1181))))

(assert (=> start!76664 e!501947))

(assert (=> start!76664 e!501949))

(assert (=> start!76664 true))

(declare-fun b!897596 () Bool)

(declare-fun res!606689 () Bool)

(assert (=> b!897596 (=> (not res!606689) (not e!501947))))

(assert (=> b!897596 (= res!606689 (not (= key!785 (bvneg key!785))))))

(declare-fun b!897597 () Bool)

(declare-fun res!606690 () Bool)

(assert (=> b!897597 (=> res!606690 e!501945)))

(assert (=> b!897597 (= res!606690 (or (not (= (size!25767 (_values!5398 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26092 thiss!1181)))) (not (= (size!25766 (_keys!10157 thiss!1181)) (size!25767 (_values!5398 thiss!1181)))) (bvslt (mask!26092 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5107 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5107 thiss!1181) #b00000000000000000000000000000011)))))

(assert (= (and start!76664 res!606693) b!897596))

(assert (= (and b!897596 res!606689) b!897588))

(assert (= (and b!897588 (not res!606691)) b!897594))

(assert (= (and b!897588 (not res!606688)) b!897595))

(assert (= (and b!897595 (not res!606692)) b!897597))

(assert (= (and b!897597 (not res!606690)) b!897590))

(assert (= (and b!897593 condMapEmpty!29112) mapIsEmpty!29112))

(assert (= (and b!897593 (not condMapEmpty!29112)) mapNonEmpty!29112))

(assert (= (and mapNonEmpty!29112 ((_ is ValueCellFull!8676) mapValue!29112)) b!897589))

(assert (= (and b!897593 ((_ is ValueCellFull!8676) mapDefault!29112)) b!897591))

(assert (= b!897592 b!897593))

(assert (= start!76664 b!897592))

(declare-fun m!834319 () Bool)

(assert (=> b!897590 m!834319))

(declare-fun m!834321 () Bool)

(assert (=> b!897588 m!834321))

(declare-fun m!834323 () Bool)

(assert (=> b!897588 m!834323))

(declare-fun m!834325 () Bool)

(assert (=> start!76664 m!834325))

(declare-fun m!834327 () Bool)

(assert (=> mapNonEmpty!29112 m!834327))

(declare-fun m!834329 () Bool)

(assert (=> b!897592 m!834329))

(declare-fun m!834331 () Bool)

(assert (=> b!897592 m!834331))

(declare-fun m!834333 () Bool)

(assert (=> b!897595 m!834333))

(declare-fun m!834335 () Bool)

(assert (=> b!897595 m!834335))

(declare-fun m!834337 () Bool)

(assert (=> b!897595 m!834337))

(declare-fun m!834339 () Bool)

(assert (=> b!897594 m!834339))

(check-sat (not b!897595) (not b_next!15987) (not b!897588) tp_is_empty!18315 (not mapNonEmpty!29112) (not start!76664) (not b!897594) b_and!26279 (not b!897590) (not b!897592))
(check-sat b_and!26279 (not b_next!15987))
(get-model)

(declare-fun d!111117 () Bool)

(assert (=> d!111117 (= (array_inv!19866 (_keys!10157 thiss!1181)) (bvsge (size!25766 (_keys!10157 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897592 d!111117))

(declare-fun d!111119 () Bool)

(assert (=> d!111119 (= (array_inv!19867 (_values!5398 thiss!1181)) (bvsge (size!25767 (_values!5398 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897592 d!111119))

(declare-fun d!111121 () Bool)

(declare-fun e!501980 () Bool)

(assert (=> d!111121 e!501980))

(declare-fun res!606714 () Bool)

(assert (=> d!111121 (=> res!606714 e!501980)))

(declare-fun lt!405250 () SeekEntryResult!8911)

(assert (=> d!111121 (= res!606714 (not ((_ is Found!8911) lt!405250)))))

(assert (=> d!111121 (= lt!405250 (seekEntry!0 key!785 (_keys!10157 thiss!1181) (mask!26092 thiss!1181)))))

(declare-fun lt!405249 () Unit!30512)

(declare-fun choose!1484 (array!52658 array!52660 (_ BitVec 32) (_ BitVec 32) V!29385 V!29385 (_ BitVec 64)) Unit!30512)

(assert (=> d!111121 (= lt!405249 (choose!1484 (_keys!10157 thiss!1181) (_values!5398 thiss!1181) (mask!26092 thiss!1181) (extraKeys!5107 thiss!1181) (zeroValue!5211 thiss!1181) (minValue!5211 thiss!1181) key!785))))

(assert (=> d!111121 (validMask!0 (mask!26092 thiss!1181))))

(assert (=> d!111121 (= (lemmaSeekEntryGivesInRangeIndex!81 (_keys!10157 thiss!1181) (_values!5398 thiss!1181) (mask!26092 thiss!1181) (extraKeys!5107 thiss!1181) (zeroValue!5211 thiss!1181) (minValue!5211 thiss!1181) key!785) lt!405249)))

(declare-fun b!897630 () Bool)

(assert (=> b!897630 (= e!501980 (inRange!0 (index!38016 lt!405250) (mask!26092 thiss!1181)))))

(assert (= (and d!111121 (not res!606714)) b!897630))

(assert (=> d!111121 m!834323))

(declare-fun m!834363 () Bool)

(assert (=> d!111121 m!834363))

(assert (=> d!111121 m!834333))

(declare-fun m!834365 () Bool)

(assert (=> b!897630 m!834365))

(assert (=> b!897588 d!111121))

(declare-fun b!897643 () Bool)

(declare-fun e!501988 () SeekEntryResult!8911)

(declare-fun lt!405261 () SeekEntryResult!8911)

(assert (=> b!897643 (= e!501988 (Found!8911 (index!38017 lt!405261)))))

(declare-fun b!897644 () Bool)

(declare-fun e!501987 () SeekEntryResult!8911)

(assert (=> b!897644 (= e!501987 (MissingZero!8911 (index!38017 lt!405261)))))

(declare-fun b!897645 () Bool)

(declare-fun lt!405259 () SeekEntryResult!8911)

(assert (=> b!897645 (= e!501987 (ite ((_ is MissingVacant!8911) lt!405259) (MissingZero!8911 (index!38018 lt!405259)) lt!405259))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52658 (_ BitVec 32)) SeekEntryResult!8911)

(assert (=> b!897645 (= lt!405259 (seekKeyOrZeroReturnVacant!0 (x!76476 lt!405261) (index!38017 lt!405261) (index!38017 lt!405261) key!785 (_keys!10157 thiss!1181) (mask!26092 thiss!1181)))))

(declare-fun d!111123 () Bool)

(declare-fun lt!405262 () SeekEntryResult!8911)

(assert (=> d!111123 (and (or ((_ is MissingVacant!8911) lt!405262) (not ((_ is Found!8911) lt!405262)) (and (bvsge (index!38016 lt!405262) #b00000000000000000000000000000000) (bvslt (index!38016 lt!405262) (size!25766 (_keys!10157 thiss!1181))))) (not ((_ is MissingVacant!8911) lt!405262)) (or (not ((_ is Found!8911) lt!405262)) (= (select (arr!25311 (_keys!10157 thiss!1181)) (index!38016 lt!405262)) key!785)))))

(declare-fun e!501989 () SeekEntryResult!8911)

(assert (=> d!111123 (= lt!405262 e!501989)))

(declare-fun c!94865 () Bool)

(assert (=> d!111123 (= c!94865 (and ((_ is Intermediate!8911) lt!405261) (undefined!9723 lt!405261)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52658 (_ BitVec 32)) SeekEntryResult!8911)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111123 (= lt!405261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26092 thiss!1181)) key!785 (_keys!10157 thiss!1181) (mask!26092 thiss!1181)))))

(assert (=> d!111123 (validMask!0 (mask!26092 thiss!1181))))

(assert (=> d!111123 (= (seekEntry!0 key!785 (_keys!10157 thiss!1181) (mask!26092 thiss!1181)) lt!405262)))

(declare-fun b!897646 () Bool)

(assert (=> b!897646 (= e!501989 Undefined!8911)))

(declare-fun b!897647 () Bool)

(declare-fun c!94864 () Bool)

(declare-fun lt!405260 () (_ BitVec 64))

(assert (=> b!897647 (= c!94864 (= lt!405260 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!897647 (= e!501988 e!501987)))

(declare-fun b!897648 () Bool)

(assert (=> b!897648 (= e!501989 e!501988)))

(assert (=> b!897648 (= lt!405260 (select (arr!25311 (_keys!10157 thiss!1181)) (index!38017 lt!405261)))))

(declare-fun c!94863 () Bool)

(assert (=> b!897648 (= c!94863 (= lt!405260 key!785))))

(assert (= (and d!111123 c!94865) b!897646))

(assert (= (and d!111123 (not c!94865)) b!897648))

(assert (= (and b!897648 c!94863) b!897643))

(assert (= (and b!897648 (not c!94863)) b!897647))

(assert (= (and b!897647 c!94864) b!897644))

(assert (= (and b!897647 (not c!94864)) b!897645))

(declare-fun m!834367 () Bool)

(assert (=> b!897645 m!834367))

(declare-fun m!834369 () Bool)

(assert (=> d!111123 m!834369))

(declare-fun m!834371 () Bool)

(assert (=> d!111123 m!834371))

(assert (=> d!111123 m!834371))

(declare-fun m!834373 () Bool)

(assert (=> d!111123 m!834373))

(assert (=> d!111123 m!834333))

(declare-fun m!834375 () Bool)

(assert (=> b!897648 m!834375))

(assert (=> b!897588 d!111123))

(declare-fun d!111125 () Bool)

(assert (=> d!111125 (= (validMask!0 (mask!26092 thiss!1181)) (and (or (= (mask!26092 thiss!1181) #b00000000000000000000000000000111) (= (mask!26092 thiss!1181) #b00000000000000000000000000001111) (= (mask!26092 thiss!1181) #b00000000000000000000000000011111) (= (mask!26092 thiss!1181) #b00000000000000000000000000111111) (= (mask!26092 thiss!1181) #b00000000000000000000000001111111) (= (mask!26092 thiss!1181) #b00000000000000000000000011111111) (= (mask!26092 thiss!1181) #b00000000000000000000000111111111) (= (mask!26092 thiss!1181) #b00000000000000000000001111111111) (= (mask!26092 thiss!1181) #b00000000000000000000011111111111) (= (mask!26092 thiss!1181) #b00000000000000000000111111111111) (= (mask!26092 thiss!1181) #b00000000000000000001111111111111) (= (mask!26092 thiss!1181) #b00000000000000000011111111111111) (= (mask!26092 thiss!1181) #b00000000000000000111111111111111) (= (mask!26092 thiss!1181) #b00000000000000001111111111111111) (= (mask!26092 thiss!1181) #b00000000000000011111111111111111) (= (mask!26092 thiss!1181) #b00000000000000111111111111111111) (= (mask!26092 thiss!1181) #b00000000000001111111111111111111) (= (mask!26092 thiss!1181) #b00000000000011111111111111111111) (= (mask!26092 thiss!1181) #b00000000000111111111111111111111) (= (mask!26092 thiss!1181) #b00000000001111111111111111111111) (= (mask!26092 thiss!1181) #b00000000011111111111111111111111) (= (mask!26092 thiss!1181) #b00000000111111111111111111111111) (= (mask!26092 thiss!1181) #b00000001111111111111111111111111) (= (mask!26092 thiss!1181) #b00000011111111111111111111111111) (= (mask!26092 thiss!1181) #b00000111111111111111111111111111) (= (mask!26092 thiss!1181) #b00001111111111111111111111111111) (= (mask!26092 thiss!1181) #b00011111111111111111111111111111) (= (mask!26092 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26092 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!897595 d!111125))

(declare-fun d!111127 () Bool)

(declare-fun res!606719 () Bool)

(declare-fun e!501994 () Bool)

(assert (=> d!111127 (=> res!606719 e!501994)))

(assert (=> d!111127 (= res!606719 (= (select (arr!25311 (_keys!10157 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111127 (= (arrayContainsKey!0 (_keys!10157 thiss!1181) key!785 #b00000000000000000000000000000000) e!501994)))

(declare-fun b!897653 () Bool)

(declare-fun e!501995 () Bool)

(assert (=> b!897653 (= e!501994 e!501995)))

(declare-fun res!606720 () Bool)

(assert (=> b!897653 (=> (not res!606720) (not e!501995))))

(assert (=> b!897653 (= res!606720 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25766 (_keys!10157 thiss!1181))))))

(declare-fun b!897654 () Bool)

(assert (=> b!897654 (= e!501995 (arrayContainsKey!0 (_keys!10157 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111127 (not res!606719)) b!897653))

(assert (= (and b!897653 res!606720) b!897654))

(declare-fun m!834377 () Bool)

(assert (=> d!111127 m!834377))

(declare-fun m!834379 () Bool)

(assert (=> b!897654 m!834379))

(assert (=> b!897595 d!111127))

(declare-fun d!111129 () Bool)

(assert (=> d!111129 (arrayContainsKey!0 (_keys!10157 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405265 () Unit!30512)

(declare-fun choose!13 (array!52658 (_ BitVec 64) (_ BitVec 32)) Unit!30512)

(assert (=> d!111129 (= lt!405265 (choose!13 (_keys!10157 thiss!1181) key!785 (index!38016 lt!405234)))))

(assert (=> d!111129 (bvsge (index!38016 lt!405234) #b00000000000000000000000000000000)))

(assert (=> d!111129 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10157 thiss!1181) key!785 (index!38016 lt!405234)) lt!405265)))

(declare-fun bs!25194 () Bool)

(assert (= bs!25194 d!111129))

(assert (=> bs!25194 m!834335))

(declare-fun m!834381 () Bool)

(assert (=> bs!25194 m!834381))

(assert (=> b!897595 d!111129))

(declare-fun d!111131 () Bool)

(assert (=> d!111131 (= (inRange!0 (index!38016 lt!405234) (mask!26092 thiss!1181)) (and (bvsge (index!38016 lt!405234) #b00000000000000000000000000000000) (bvslt (index!38016 lt!405234) (bvadd (mask!26092 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897594 d!111131))

(declare-fun d!111133 () Bool)

(declare-fun res!606726 () Bool)

(declare-fun e!502003 () Bool)

(assert (=> d!111133 (=> res!606726 e!502003)))

(assert (=> d!111133 (= res!606726 (bvsge #b00000000000000000000000000000000 (size!25766 (_keys!10157 thiss!1181))))))

(assert (=> d!111133 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10157 thiss!1181) (mask!26092 thiss!1181)) e!502003)))

(declare-fun b!897663 () Bool)

(declare-fun e!502002 () Bool)

(assert (=> b!897663 (= e!502003 e!502002)))

(declare-fun c!94868 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!897663 (= c!94868 (validKeyInArray!0 (select (arr!25311 (_keys!10157 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897664 () Bool)

(declare-fun call!39817 () Bool)

(assert (=> b!897664 (= e!502002 call!39817)))

(declare-fun bm!39814 () Bool)

(assert (=> bm!39814 (= call!39817 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10157 thiss!1181) (mask!26092 thiss!1181)))))

(declare-fun b!897665 () Bool)

(declare-fun e!502004 () Bool)

(assert (=> b!897665 (= e!502004 call!39817)))

(declare-fun b!897666 () Bool)

(assert (=> b!897666 (= e!502002 e!502004)))

(declare-fun lt!405273 () (_ BitVec 64))

(assert (=> b!897666 (= lt!405273 (select (arr!25311 (_keys!10157 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405274 () Unit!30512)

(assert (=> b!897666 (= lt!405274 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10157 thiss!1181) lt!405273 #b00000000000000000000000000000000))))

(assert (=> b!897666 (arrayContainsKey!0 (_keys!10157 thiss!1181) lt!405273 #b00000000000000000000000000000000)))

(declare-fun lt!405272 () Unit!30512)

(assert (=> b!897666 (= lt!405272 lt!405274)))

(declare-fun res!606725 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52658 (_ BitVec 32)) SeekEntryResult!8911)

(assert (=> b!897666 (= res!606725 (= (seekEntryOrOpen!0 (select (arr!25311 (_keys!10157 thiss!1181)) #b00000000000000000000000000000000) (_keys!10157 thiss!1181) (mask!26092 thiss!1181)) (Found!8911 #b00000000000000000000000000000000)))))

(assert (=> b!897666 (=> (not res!606725) (not e!502004))))

(assert (= (and d!111133 (not res!606726)) b!897663))

(assert (= (and b!897663 c!94868) b!897666))

(assert (= (and b!897663 (not c!94868)) b!897664))

(assert (= (and b!897666 res!606725) b!897665))

(assert (= (or b!897665 b!897664) bm!39814))

(assert (=> b!897663 m!834377))

(assert (=> b!897663 m!834377))

(declare-fun m!834383 () Bool)

(assert (=> b!897663 m!834383))

(declare-fun m!834385 () Bool)

(assert (=> bm!39814 m!834385))

(assert (=> b!897666 m!834377))

(declare-fun m!834387 () Bool)

(assert (=> b!897666 m!834387))

(declare-fun m!834389 () Bool)

(assert (=> b!897666 m!834389))

(assert (=> b!897666 m!834377))

(declare-fun m!834391 () Bool)

(assert (=> b!897666 m!834391))

(assert (=> b!897590 d!111133))

(declare-fun d!111135 () Bool)

(declare-fun res!606733 () Bool)

(declare-fun e!502007 () Bool)

(assert (=> d!111135 (=> (not res!606733) (not e!502007))))

(declare-fun simpleValid!319 (LongMapFixedSize!4368) Bool)

(assert (=> d!111135 (= res!606733 (simpleValid!319 thiss!1181))))

(assert (=> d!111135 (= (valid!1682 thiss!1181) e!502007)))

(declare-fun b!897673 () Bool)

(declare-fun res!606734 () Bool)

(assert (=> b!897673 (=> (not res!606734) (not e!502007))))

(declare-fun arrayCountValidKeys!0 (array!52658 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897673 (= res!606734 (= (arrayCountValidKeys!0 (_keys!10157 thiss!1181) #b00000000000000000000000000000000 (size!25766 (_keys!10157 thiss!1181))) (_size!2239 thiss!1181)))))

(declare-fun b!897674 () Bool)

(declare-fun res!606735 () Bool)

(assert (=> b!897674 (=> (not res!606735) (not e!502007))))

(assert (=> b!897674 (= res!606735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10157 thiss!1181) (mask!26092 thiss!1181)))))

(declare-fun b!897675 () Bool)

(declare-datatypes ((List!17829 0))(
  ( (Nil!17826) (Cons!17825 (h!18967 (_ BitVec 64)) (t!25168 List!17829)) )
))
(declare-fun arrayNoDuplicates!0 (array!52658 (_ BitVec 32) List!17829) Bool)

(assert (=> b!897675 (= e!502007 (arrayNoDuplicates!0 (_keys!10157 thiss!1181) #b00000000000000000000000000000000 Nil!17826))))

(assert (= (and d!111135 res!606733) b!897673))

(assert (= (and b!897673 res!606734) b!897674))

(assert (= (and b!897674 res!606735) b!897675))

(declare-fun m!834393 () Bool)

(assert (=> d!111135 m!834393))

(declare-fun m!834395 () Bool)

(assert (=> b!897673 m!834395))

(assert (=> b!897674 m!834319))

(declare-fun m!834397 () Bool)

(assert (=> b!897675 m!834397))

(assert (=> start!76664 d!111135))

(declare-fun b!897683 () Bool)

(declare-fun e!502012 () Bool)

(assert (=> b!897683 (= e!502012 tp_is_empty!18315)))

(declare-fun b!897682 () Bool)

(declare-fun e!502013 () Bool)

(assert (=> b!897682 (= e!502013 tp_is_empty!18315)))

(declare-fun condMapEmpty!29118 () Bool)

(declare-fun mapDefault!29118 () ValueCell!8676)

(assert (=> mapNonEmpty!29112 (= condMapEmpty!29118 (= mapRest!29112 ((as const (Array (_ BitVec 32) ValueCell!8676)) mapDefault!29118)))))

(declare-fun mapRes!29118 () Bool)

(assert (=> mapNonEmpty!29112 (= tp!56014 (and e!502012 mapRes!29118))))

(declare-fun mapIsEmpty!29118 () Bool)

(assert (=> mapIsEmpty!29118 mapRes!29118))

(declare-fun mapNonEmpty!29118 () Bool)

(declare-fun tp!56024 () Bool)

(assert (=> mapNonEmpty!29118 (= mapRes!29118 (and tp!56024 e!502013))))

(declare-fun mapRest!29118 () (Array (_ BitVec 32) ValueCell!8676))

(declare-fun mapKey!29118 () (_ BitVec 32))

(declare-fun mapValue!29118 () ValueCell!8676)

(assert (=> mapNonEmpty!29118 (= mapRest!29112 (store mapRest!29118 mapKey!29118 mapValue!29118))))

(assert (= (and mapNonEmpty!29112 condMapEmpty!29118) mapIsEmpty!29118))

(assert (= (and mapNonEmpty!29112 (not condMapEmpty!29118)) mapNonEmpty!29118))

(assert (= (and mapNonEmpty!29118 ((_ is ValueCellFull!8676) mapValue!29118)) b!897682))

(assert (= (and mapNonEmpty!29112 ((_ is ValueCellFull!8676) mapDefault!29118)) b!897683))

(declare-fun m!834399 () Bool)

(assert (=> mapNonEmpty!29118 m!834399))

(check-sat (not b!897666) (not b_next!15987) (not b!897674) (not d!111129) (not b!897630) (not d!111123) tp_is_empty!18315 (not d!111121) (not b!897645) (not b!897654) (not mapNonEmpty!29118) (not b!897673) b_and!26279 (not d!111135) (not b!897675) (not b!897663) (not bm!39814))
(check-sat b_and!26279 (not b_next!15987))
