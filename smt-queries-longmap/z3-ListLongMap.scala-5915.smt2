; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76670 () Bool)

(assert start!76670)

(declare-fun b!897467 () Bool)

(declare-fun b_free!15991 () Bool)

(declare-fun b_next!15991 () Bool)

(assert (=> b!897467 (= b_free!15991 (not b_next!15991))))

(declare-fun tp!56031 () Bool)

(declare-fun b_and!26257 () Bool)

(assert (=> b!897467 (= tp!56031 b_and!26257)))

(declare-fun tp_is_empty!18319 () Bool)

(declare-fun e!501891 () Bool)

(declare-datatypes ((array!52651 0))(
  ( (array!52652 (arr!25307 (Array (_ BitVec 32) (_ BitVec 64))) (size!25764 (_ BitVec 32))) )
))
(declare-datatypes ((V!29391 0))(
  ( (V!29392 (val!9210 Int)) )
))
(declare-datatypes ((ValueCell!8678 0))(
  ( (ValueCellFull!8678 (v!11697 V!29391)) (EmptyCell!8678) )
))
(declare-datatypes ((array!52653 0))(
  ( (array!52654 (arr!25308 (Array (_ BitVec 32) ValueCell!8678)) (size!25765 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4372 0))(
  ( (LongMapFixedSize!4373 (defaultEntry!5398 Int) (mask!26094 (_ BitVec 32)) (extraKeys!5110 (_ BitVec 32)) (zeroValue!5214 V!29391) (minValue!5214 V!29391) (_size!2241 (_ BitVec 32)) (_keys!10157 array!52651) (_values!5401 array!52653) (_vacant!2241 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4372)

(declare-fun e!501886 () Bool)

(declare-fun array_inv!19914 (array!52651) Bool)

(declare-fun array_inv!19915 (array!52653) Bool)

(assert (=> b!897467 (= e!501886 (and tp!56031 tp_is_empty!18319 (array_inv!19914 (_keys!10157 thiss!1181)) (array_inv!19915 (_values!5401 thiss!1181)) e!501891))))

(declare-fun b!897468 () Bool)

(declare-fun e!501885 () Bool)

(declare-datatypes ((SeekEntryResult!8916 0))(
  ( (MissingZero!8916 (index!38035 (_ BitVec 32))) (Found!8916 (index!38036 (_ BitVec 32))) (Intermediate!8916 (undefined!9728 Bool) (index!38037 (_ BitVec 32)) (x!76492 (_ BitVec 32))) (Undefined!8916) (MissingVacant!8916 (index!38038 (_ BitVec 32))) )
))
(declare-fun lt!405046 () SeekEntryResult!8916)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897468 (= e!501885 (inRange!0 (index!38036 lt!405046) (mask!26094 thiss!1181)))))

(declare-fun b!897469 () Bool)

(declare-fun res!606646 () Bool)

(declare-fun e!501892 () Bool)

(assert (=> b!897469 (=> res!606646 e!501892)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52651 (_ BitVec 32)) Bool)

(assert (=> b!897469 (= res!606646 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10157 thiss!1181) (mask!26094 thiss!1181))))))

(declare-fun b!897470 () Bool)

(declare-fun res!606644 () Bool)

(declare-fun e!501884 () Bool)

(assert (=> b!897470 (=> (not res!606644) (not e!501884))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!897470 (= res!606644 (not (= key!785 (bvneg key!785))))))

(declare-fun b!897471 () Bool)

(declare-fun e!501889 () Bool)

(declare-fun mapRes!29121 () Bool)

(assert (=> b!897471 (= e!501891 (and e!501889 mapRes!29121))))

(declare-fun condMapEmpty!29121 () Bool)

(declare-fun mapDefault!29121 () ValueCell!8678)

(assert (=> b!897471 (= condMapEmpty!29121 (= (arr!25308 (_values!5401 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8678)) mapDefault!29121)))))

(declare-fun b!897472 () Bool)

(declare-fun e!501890 () Bool)

(assert (=> b!897472 (= e!501890 e!501892)))

(declare-fun res!606640 () Bool)

(assert (=> b!897472 (=> res!606640 e!501892)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897472 (= res!606640 (not (validMask!0 (mask!26094 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897472 (arrayContainsKey!0 (_keys!10157 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30452 0))(
  ( (Unit!30453) )
))
(declare-fun lt!405047 () Unit!30452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52651 (_ BitVec 64) (_ BitVec 32)) Unit!30452)

(assert (=> b!897472 (= lt!405047 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10157 thiss!1181) key!785 (index!38036 lt!405046)))))

(declare-fun res!606642 () Bool)

(assert (=> start!76670 (=> (not res!606642) (not e!501884))))

(declare-fun valid!1691 (LongMapFixedSize!4372) Bool)

(assert (=> start!76670 (= res!606642 (valid!1691 thiss!1181))))

(assert (=> start!76670 e!501884))

(assert (=> start!76670 e!501886))

(assert (=> start!76670 true))

(declare-fun b!897473 () Bool)

(assert (=> b!897473 (= e!501884 (not e!501890))))

(declare-fun res!606641 () Bool)

(assert (=> b!897473 (=> res!606641 e!501890)))

(get-info :version)

(assert (=> b!897473 (= res!606641 (not ((_ is Found!8916) lt!405046)))))

(assert (=> b!897473 e!501885))

(declare-fun res!606643 () Bool)

(assert (=> b!897473 (=> res!606643 e!501885)))

(assert (=> b!897473 (= res!606643 (not ((_ is Found!8916) lt!405046)))))

(declare-fun lt!405045 () Unit!30452)

(declare-fun lemmaSeekEntryGivesInRangeIndex!82 (array!52651 array!52653 (_ BitVec 32) (_ BitVec 32) V!29391 V!29391 (_ BitVec 64)) Unit!30452)

(assert (=> b!897473 (= lt!405045 (lemmaSeekEntryGivesInRangeIndex!82 (_keys!10157 thiss!1181) (_values!5401 thiss!1181) (mask!26094 thiss!1181) (extraKeys!5110 thiss!1181) (zeroValue!5214 thiss!1181) (minValue!5214 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52651 (_ BitVec 32)) SeekEntryResult!8916)

(assert (=> b!897473 (= lt!405046 (seekEntry!0 key!785 (_keys!10157 thiss!1181) (mask!26094 thiss!1181)))))

(declare-fun b!897474 () Bool)

(declare-datatypes ((List!17838 0))(
  ( (Nil!17835) (Cons!17834 (h!18976 (_ BitVec 64)) (t!25168 List!17838)) )
))
(declare-fun arrayNoDuplicates!0 (array!52651 (_ BitVec 32) List!17838) Bool)

(assert (=> b!897474 (= e!501892 (arrayNoDuplicates!0 (_keys!10157 thiss!1181) #b00000000000000000000000000000000 Nil!17835))))

(declare-fun mapIsEmpty!29121 () Bool)

(assert (=> mapIsEmpty!29121 mapRes!29121))

(declare-fun b!897475 () Bool)

(declare-fun e!501887 () Bool)

(assert (=> b!897475 (= e!501887 tp_is_empty!18319)))

(declare-fun b!897476 () Bool)

(assert (=> b!897476 (= e!501889 tp_is_empty!18319)))

(declare-fun mapNonEmpty!29121 () Bool)

(declare-fun tp!56030 () Bool)

(assert (=> mapNonEmpty!29121 (= mapRes!29121 (and tp!56030 e!501887))))

(declare-fun mapValue!29121 () ValueCell!8678)

(declare-fun mapRest!29121 () (Array (_ BitVec 32) ValueCell!8678))

(declare-fun mapKey!29121 () (_ BitVec 32))

(assert (=> mapNonEmpty!29121 (= (arr!25308 (_values!5401 thiss!1181)) (store mapRest!29121 mapKey!29121 mapValue!29121))))

(declare-fun b!897477 () Bool)

(declare-fun res!606645 () Bool)

(assert (=> b!897477 (=> res!606645 e!501892)))

(assert (=> b!897477 (= res!606645 (or (not (= (size!25765 (_values!5401 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26094 thiss!1181)))) (not (= (size!25764 (_keys!10157 thiss!1181)) (size!25765 (_values!5401 thiss!1181)))) (bvslt (mask!26094 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5110 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5110 thiss!1181) #b00000000000000000000000000000011)))))

(assert (= (and start!76670 res!606642) b!897470))

(assert (= (and b!897470 res!606644) b!897473))

(assert (= (and b!897473 (not res!606643)) b!897468))

(assert (= (and b!897473 (not res!606641)) b!897472))

(assert (= (and b!897472 (not res!606640)) b!897477))

(assert (= (and b!897477 (not res!606645)) b!897469))

(assert (= (and b!897469 (not res!606646)) b!897474))

(assert (= (and b!897471 condMapEmpty!29121) mapIsEmpty!29121))

(assert (= (and b!897471 (not condMapEmpty!29121)) mapNonEmpty!29121))

(assert (= (and mapNonEmpty!29121 ((_ is ValueCellFull!8678) mapValue!29121)) b!897475))

(assert (= (and b!897471 ((_ is ValueCellFull!8678) mapDefault!29121)) b!897476))

(assert (= b!897467 b!897471))

(assert (= start!76670 b!897467))

(declare-fun m!833643 () Bool)

(assert (=> b!897474 m!833643))

(declare-fun m!833645 () Bool)

(assert (=> b!897469 m!833645))

(declare-fun m!833647 () Bool)

(assert (=> b!897472 m!833647))

(declare-fun m!833649 () Bool)

(assert (=> b!897472 m!833649))

(declare-fun m!833651 () Bool)

(assert (=> b!897472 m!833651))

(declare-fun m!833653 () Bool)

(assert (=> b!897467 m!833653))

(declare-fun m!833655 () Bool)

(assert (=> b!897467 m!833655))

(declare-fun m!833657 () Bool)

(assert (=> mapNonEmpty!29121 m!833657))

(declare-fun m!833659 () Bool)

(assert (=> start!76670 m!833659))

(declare-fun m!833661 () Bool)

(assert (=> b!897473 m!833661))

(declare-fun m!833663 () Bool)

(assert (=> b!897473 m!833663))

(declare-fun m!833665 () Bool)

(assert (=> b!897468 m!833665))

(check-sat tp_is_empty!18319 (not b!897468) (not b!897467) (not start!76670) (not b!897469) (not b!897472) (not b!897473) (not b!897474) b_and!26257 (not b_next!15991) (not mapNonEmpty!29121))
(check-sat b_and!26257 (not b_next!15991))
(get-model)

(declare-fun d!110941 () Bool)

(assert (=> d!110941 (= (validMask!0 (mask!26094 thiss!1181)) (and (or (= (mask!26094 thiss!1181) #b00000000000000000000000000000111) (= (mask!26094 thiss!1181) #b00000000000000000000000000001111) (= (mask!26094 thiss!1181) #b00000000000000000000000000011111) (= (mask!26094 thiss!1181) #b00000000000000000000000000111111) (= (mask!26094 thiss!1181) #b00000000000000000000000001111111) (= (mask!26094 thiss!1181) #b00000000000000000000000011111111) (= (mask!26094 thiss!1181) #b00000000000000000000000111111111) (= (mask!26094 thiss!1181) #b00000000000000000000001111111111) (= (mask!26094 thiss!1181) #b00000000000000000000011111111111) (= (mask!26094 thiss!1181) #b00000000000000000000111111111111) (= (mask!26094 thiss!1181) #b00000000000000000001111111111111) (= (mask!26094 thiss!1181) #b00000000000000000011111111111111) (= (mask!26094 thiss!1181) #b00000000000000000111111111111111) (= (mask!26094 thiss!1181) #b00000000000000001111111111111111) (= (mask!26094 thiss!1181) #b00000000000000011111111111111111) (= (mask!26094 thiss!1181) #b00000000000000111111111111111111) (= (mask!26094 thiss!1181) #b00000000000001111111111111111111) (= (mask!26094 thiss!1181) #b00000000000011111111111111111111) (= (mask!26094 thiss!1181) #b00000000000111111111111111111111) (= (mask!26094 thiss!1181) #b00000000001111111111111111111111) (= (mask!26094 thiss!1181) #b00000000011111111111111111111111) (= (mask!26094 thiss!1181) #b00000000111111111111111111111111) (= (mask!26094 thiss!1181) #b00000001111111111111111111111111) (= (mask!26094 thiss!1181) #b00000011111111111111111111111111) (= (mask!26094 thiss!1181) #b00000111111111111111111111111111) (= (mask!26094 thiss!1181) #b00001111111111111111111111111111) (= (mask!26094 thiss!1181) #b00011111111111111111111111111111) (= (mask!26094 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26094 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!897472 d!110941))

(declare-fun d!110943 () Bool)

(declare-fun res!606693 () Bool)

(declare-fun e!501951 () Bool)

(assert (=> d!110943 (=> res!606693 e!501951)))

(assert (=> d!110943 (= res!606693 (= (select (arr!25307 (_keys!10157 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110943 (= (arrayContainsKey!0 (_keys!10157 thiss!1181) key!785 #b00000000000000000000000000000000) e!501951)))

(declare-fun b!897548 () Bool)

(declare-fun e!501952 () Bool)

(assert (=> b!897548 (= e!501951 e!501952)))

(declare-fun res!606694 () Bool)

(assert (=> b!897548 (=> (not res!606694) (not e!501952))))

(assert (=> b!897548 (= res!606694 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25764 (_keys!10157 thiss!1181))))))

(declare-fun b!897549 () Bool)

(assert (=> b!897549 (= e!501952 (arrayContainsKey!0 (_keys!10157 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110943 (not res!606693)) b!897548))

(assert (= (and b!897548 res!606694) b!897549))

(declare-fun m!833715 () Bool)

(assert (=> d!110943 m!833715))

(declare-fun m!833717 () Bool)

(assert (=> b!897549 m!833717))

(assert (=> b!897472 d!110943))

(declare-fun d!110945 () Bool)

(assert (=> d!110945 (arrayContainsKey!0 (_keys!10157 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405068 () Unit!30452)

(declare-fun choose!13 (array!52651 (_ BitVec 64) (_ BitVec 32)) Unit!30452)

(assert (=> d!110945 (= lt!405068 (choose!13 (_keys!10157 thiss!1181) key!785 (index!38036 lt!405046)))))

(assert (=> d!110945 (bvsge (index!38036 lt!405046) #b00000000000000000000000000000000)))

(assert (=> d!110945 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10157 thiss!1181) key!785 (index!38036 lt!405046)) lt!405068)))

(declare-fun bs!25165 () Bool)

(assert (= bs!25165 d!110945))

(assert (=> bs!25165 m!833649))

(declare-fun m!833719 () Bool)

(assert (=> bs!25165 m!833719))

(assert (=> b!897472 d!110945))

(declare-fun d!110947 () Bool)

(assert (=> d!110947 (= (array_inv!19914 (_keys!10157 thiss!1181)) (bvsge (size!25764 (_keys!10157 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897467 d!110947))

(declare-fun d!110949 () Bool)

(assert (=> d!110949 (= (array_inv!19915 (_values!5401 thiss!1181)) (bvsge (size!25765 (_values!5401 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897467 d!110949))

(declare-fun d!110951 () Bool)

(declare-fun e!501955 () Bool)

(assert (=> d!110951 e!501955))

(declare-fun res!606697 () Bool)

(assert (=> d!110951 (=> res!606697 e!501955)))

(declare-fun lt!405074 () SeekEntryResult!8916)

(assert (=> d!110951 (= res!606697 (not ((_ is Found!8916) lt!405074)))))

(assert (=> d!110951 (= lt!405074 (seekEntry!0 key!785 (_keys!10157 thiss!1181) (mask!26094 thiss!1181)))))

(declare-fun lt!405073 () Unit!30452)

(declare-fun choose!1494 (array!52651 array!52653 (_ BitVec 32) (_ BitVec 32) V!29391 V!29391 (_ BitVec 64)) Unit!30452)

(assert (=> d!110951 (= lt!405073 (choose!1494 (_keys!10157 thiss!1181) (_values!5401 thiss!1181) (mask!26094 thiss!1181) (extraKeys!5110 thiss!1181) (zeroValue!5214 thiss!1181) (minValue!5214 thiss!1181) key!785))))

(assert (=> d!110951 (validMask!0 (mask!26094 thiss!1181))))

(assert (=> d!110951 (= (lemmaSeekEntryGivesInRangeIndex!82 (_keys!10157 thiss!1181) (_values!5401 thiss!1181) (mask!26094 thiss!1181) (extraKeys!5110 thiss!1181) (zeroValue!5214 thiss!1181) (minValue!5214 thiss!1181) key!785) lt!405073)))

(declare-fun b!897552 () Bool)

(assert (=> b!897552 (= e!501955 (inRange!0 (index!38036 lt!405074) (mask!26094 thiss!1181)))))

(assert (= (and d!110951 (not res!606697)) b!897552))

(assert (=> d!110951 m!833663))

(declare-fun m!833721 () Bool)

(assert (=> d!110951 m!833721))

(assert (=> d!110951 m!833647))

(declare-fun m!833723 () Bool)

(assert (=> b!897552 m!833723))

(assert (=> b!897473 d!110951))

(declare-fun b!897565 () Bool)

(declare-fun e!501962 () SeekEntryResult!8916)

(declare-fun e!501964 () SeekEntryResult!8916)

(assert (=> b!897565 (= e!501962 e!501964)))

(declare-fun lt!405085 () (_ BitVec 64))

(declare-fun lt!405086 () SeekEntryResult!8916)

(assert (=> b!897565 (= lt!405085 (select (arr!25307 (_keys!10157 thiss!1181)) (index!38037 lt!405086)))))

(declare-fun c!94810 () Bool)

(assert (=> b!897565 (= c!94810 (= lt!405085 key!785))))

(declare-fun b!897566 () Bool)

(declare-fun c!94811 () Bool)

(assert (=> b!897566 (= c!94811 (= lt!405085 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501963 () SeekEntryResult!8916)

(assert (=> b!897566 (= e!501964 e!501963)))

(declare-fun b!897567 () Bool)

(declare-fun lt!405084 () SeekEntryResult!8916)

(assert (=> b!897567 (= e!501963 (ite ((_ is MissingVacant!8916) lt!405084) (MissingZero!8916 (index!38038 lt!405084)) lt!405084))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52651 (_ BitVec 32)) SeekEntryResult!8916)

(assert (=> b!897567 (= lt!405084 (seekKeyOrZeroReturnVacant!0 (x!76492 lt!405086) (index!38037 lt!405086) (index!38037 lt!405086) key!785 (_keys!10157 thiss!1181) (mask!26094 thiss!1181)))))

(declare-fun b!897568 () Bool)

(assert (=> b!897568 (= e!501962 Undefined!8916)))

(declare-fun d!110953 () Bool)

(declare-fun lt!405083 () SeekEntryResult!8916)

(assert (=> d!110953 (and (or ((_ is MissingVacant!8916) lt!405083) (not ((_ is Found!8916) lt!405083)) (and (bvsge (index!38036 lt!405083) #b00000000000000000000000000000000) (bvslt (index!38036 lt!405083) (size!25764 (_keys!10157 thiss!1181))))) (not ((_ is MissingVacant!8916) lt!405083)) (or (not ((_ is Found!8916) lt!405083)) (= (select (arr!25307 (_keys!10157 thiss!1181)) (index!38036 lt!405083)) key!785)))))

(assert (=> d!110953 (= lt!405083 e!501962)))

(declare-fun c!94812 () Bool)

(assert (=> d!110953 (= c!94812 (and ((_ is Intermediate!8916) lt!405086) (undefined!9728 lt!405086)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52651 (_ BitVec 32)) SeekEntryResult!8916)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110953 (= lt!405086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26094 thiss!1181)) key!785 (_keys!10157 thiss!1181) (mask!26094 thiss!1181)))))

(assert (=> d!110953 (validMask!0 (mask!26094 thiss!1181))))

(assert (=> d!110953 (= (seekEntry!0 key!785 (_keys!10157 thiss!1181) (mask!26094 thiss!1181)) lt!405083)))

(declare-fun b!897569 () Bool)

(assert (=> b!897569 (= e!501963 (MissingZero!8916 (index!38037 lt!405086)))))

(declare-fun b!897570 () Bool)

(assert (=> b!897570 (= e!501964 (Found!8916 (index!38037 lt!405086)))))

(assert (= (and d!110953 c!94812) b!897568))

(assert (= (and d!110953 (not c!94812)) b!897565))

(assert (= (and b!897565 c!94810) b!897570))

(assert (= (and b!897565 (not c!94810)) b!897566))

(assert (= (and b!897566 c!94811) b!897569))

(assert (= (and b!897566 (not c!94811)) b!897567))

(declare-fun m!833725 () Bool)

(assert (=> b!897565 m!833725))

(declare-fun m!833727 () Bool)

(assert (=> b!897567 m!833727))

(declare-fun m!833729 () Bool)

(assert (=> d!110953 m!833729))

(declare-fun m!833731 () Bool)

(assert (=> d!110953 m!833731))

(assert (=> d!110953 m!833731))

(declare-fun m!833733 () Bool)

(assert (=> d!110953 m!833733))

(assert (=> d!110953 m!833647))

(assert (=> b!897473 d!110953))

(declare-fun d!110955 () Bool)

(assert (=> d!110955 (= (inRange!0 (index!38036 lt!405046) (mask!26094 thiss!1181)) (and (bvsge (index!38036 lt!405046) #b00000000000000000000000000000000) (bvslt (index!38036 lt!405046) (bvadd (mask!26094 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897468 d!110955))

(declare-fun d!110957 () Bool)

(declare-fun res!606705 () Bool)

(declare-fun e!501975 () Bool)

(assert (=> d!110957 (=> res!606705 e!501975)))

(assert (=> d!110957 (= res!606705 (bvsge #b00000000000000000000000000000000 (size!25764 (_keys!10157 thiss!1181))))))

(assert (=> d!110957 (= (arrayNoDuplicates!0 (_keys!10157 thiss!1181) #b00000000000000000000000000000000 Nil!17835) e!501975)))

(declare-fun b!897581 () Bool)

(declare-fun e!501974 () Bool)

(declare-fun e!501976 () Bool)

(assert (=> b!897581 (= e!501974 e!501976)))

(declare-fun c!94815 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!897581 (= c!94815 (validKeyInArray!0 (select (arr!25307 (_keys!10157 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897582 () Bool)

(declare-fun call!39794 () Bool)

(assert (=> b!897582 (= e!501976 call!39794)))

(declare-fun bm!39791 () Bool)

(assert (=> bm!39791 (= call!39794 (arrayNoDuplicates!0 (_keys!10157 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94815 (Cons!17834 (select (arr!25307 (_keys!10157 thiss!1181)) #b00000000000000000000000000000000) Nil!17835) Nil!17835)))))

(declare-fun b!897583 () Bool)

(assert (=> b!897583 (= e!501975 e!501974)))

(declare-fun res!606704 () Bool)

(assert (=> b!897583 (=> (not res!606704) (not e!501974))))

(declare-fun e!501973 () Bool)

(assert (=> b!897583 (= res!606704 (not e!501973))))

(declare-fun res!606706 () Bool)

(assert (=> b!897583 (=> (not res!606706) (not e!501973))))

(assert (=> b!897583 (= res!606706 (validKeyInArray!0 (select (arr!25307 (_keys!10157 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897584 () Bool)

(assert (=> b!897584 (= e!501976 call!39794)))

(declare-fun b!897585 () Bool)

(declare-fun contains!4375 (List!17838 (_ BitVec 64)) Bool)

(assert (=> b!897585 (= e!501973 (contains!4375 Nil!17835 (select (arr!25307 (_keys!10157 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110957 (not res!606705)) b!897583))

(assert (= (and b!897583 res!606706) b!897585))

(assert (= (and b!897583 res!606704) b!897581))

(assert (= (and b!897581 c!94815) b!897582))

(assert (= (and b!897581 (not c!94815)) b!897584))

(assert (= (or b!897582 b!897584) bm!39791))

(assert (=> b!897581 m!833715))

(assert (=> b!897581 m!833715))

(declare-fun m!833735 () Bool)

(assert (=> b!897581 m!833735))

(assert (=> bm!39791 m!833715))

(declare-fun m!833737 () Bool)

(assert (=> bm!39791 m!833737))

(assert (=> b!897583 m!833715))

(assert (=> b!897583 m!833715))

(assert (=> b!897583 m!833735))

(assert (=> b!897585 m!833715))

(assert (=> b!897585 m!833715))

(declare-fun m!833739 () Bool)

(assert (=> b!897585 m!833739))

(assert (=> b!897474 d!110957))

(declare-fun d!110959 () Bool)

(declare-fun res!606712 () Bool)

(declare-fun e!501985 () Bool)

(assert (=> d!110959 (=> res!606712 e!501985)))

(assert (=> d!110959 (= res!606712 (bvsge #b00000000000000000000000000000000 (size!25764 (_keys!10157 thiss!1181))))))

(assert (=> d!110959 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10157 thiss!1181) (mask!26094 thiss!1181)) e!501985)))

(declare-fun b!897594 () Bool)

(declare-fun e!501983 () Bool)

(declare-fun call!39797 () Bool)

(assert (=> b!897594 (= e!501983 call!39797)))

(declare-fun bm!39794 () Bool)

(assert (=> bm!39794 (= call!39797 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10157 thiss!1181) (mask!26094 thiss!1181)))))

(declare-fun b!897595 () Bool)

(declare-fun e!501984 () Bool)

(assert (=> b!897595 (= e!501985 e!501984)))

(declare-fun c!94818 () Bool)

(assert (=> b!897595 (= c!94818 (validKeyInArray!0 (select (arr!25307 (_keys!10157 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897596 () Bool)

(assert (=> b!897596 (= e!501984 e!501983)))

(declare-fun lt!405095 () (_ BitVec 64))

(assert (=> b!897596 (= lt!405095 (select (arr!25307 (_keys!10157 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405093 () Unit!30452)

(assert (=> b!897596 (= lt!405093 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10157 thiss!1181) lt!405095 #b00000000000000000000000000000000))))

(assert (=> b!897596 (arrayContainsKey!0 (_keys!10157 thiss!1181) lt!405095 #b00000000000000000000000000000000)))

(declare-fun lt!405094 () Unit!30452)

(assert (=> b!897596 (= lt!405094 lt!405093)))

(declare-fun res!606711 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52651 (_ BitVec 32)) SeekEntryResult!8916)

(assert (=> b!897596 (= res!606711 (= (seekEntryOrOpen!0 (select (arr!25307 (_keys!10157 thiss!1181)) #b00000000000000000000000000000000) (_keys!10157 thiss!1181) (mask!26094 thiss!1181)) (Found!8916 #b00000000000000000000000000000000)))))

(assert (=> b!897596 (=> (not res!606711) (not e!501983))))

(declare-fun b!897597 () Bool)

(assert (=> b!897597 (= e!501984 call!39797)))

(assert (= (and d!110959 (not res!606712)) b!897595))

(assert (= (and b!897595 c!94818) b!897596))

(assert (= (and b!897595 (not c!94818)) b!897597))

(assert (= (and b!897596 res!606711) b!897594))

(assert (= (or b!897594 b!897597) bm!39794))

(declare-fun m!833741 () Bool)

(assert (=> bm!39794 m!833741))

(assert (=> b!897595 m!833715))

(assert (=> b!897595 m!833715))

(assert (=> b!897595 m!833735))

(assert (=> b!897596 m!833715))

(declare-fun m!833743 () Bool)

(assert (=> b!897596 m!833743))

(declare-fun m!833745 () Bool)

(assert (=> b!897596 m!833745))

(assert (=> b!897596 m!833715))

(declare-fun m!833747 () Bool)

(assert (=> b!897596 m!833747))

(assert (=> b!897469 d!110959))

(declare-fun d!110961 () Bool)

(declare-fun res!606719 () Bool)

(declare-fun e!501988 () Bool)

(assert (=> d!110961 (=> (not res!606719) (not e!501988))))

(declare-fun simpleValid!320 (LongMapFixedSize!4372) Bool)

(assert (=> d!110961 (= res!606719 (simpleValid!320 thiss!1181))))

(assert (=> d!110961 (= (valid!1691 thiss!1181) e!501988)))

(declare-fun b!897604 () Bool)

(declare-fun res!606720 () Bool)

(assert (=> b!897604 (=> (not res!606720) (not e!501988))))

(declare-fun arrayCountValidKeys!0 (array!52651 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897604 (= res!606720 (= (arrayCountValidKeys!0 (_keys!10157 thiss!1181) #b00000000000000000000000000000000 (size!25764 (_keys!10157 thiss!1181))) (_size!2241 thiss!1181)))))

(declare-fun b!897605 () Bool)

(declare-fun res!606721 () Bool)

(assert (=> b!897605 (=> (not res!606721) (not e!501988))))

(assert (=> b!897605 (= res!606721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10157 thiss!1181) (mask!26094 thiss!1181)))))

(declare-fun b!897606 () Bool)

(assert (=> b!897606 (= e!501988 (arrayNoDuplicates!0 (_keys!10157 thiss!1181) #b00000000000000000000000000000000 Nil!17835))))

(assert (= (and d!110961 res!606719) b!897604))

(assert (= (and b!897604 res!606720) b!897605))

(assert (= (and b!897605 res!606721) b!897606))

(declare-fun m!833749 () Bool)

(assert (=> d!110961 m!833749))

(declare-fun m!833751 () Bool)

(assert (=> b!897604 m!833751))

(assert (=> b!897605 m!833645))

(assert (=> b!897606 m!833643))

(assert (=> start!76670 d!110961))

(declare-fun mapIsEmpty!29130 () Bool)

(declare-fun mapRes!29130 () Bool)

(assert (=> mapIsEmpty!29130 mapRes!29130))

(declare-fun b!897614 () Bool)

(declare-fun e!501993 () Bool)

(assert (=> b!897614 (= e!501993 tp_is_empty!18319)))

(declare-fun b!897613 () Bool)

(declare-fun e!501994 () Bool)

(assert (=> b!897613 (= e!501994 tp_is_empty!18319)))

(declare-fun mapNonEmpty!29130 () Bool)

(declare-fun tp!56046 () Bool)

(assert (=> mapNonEmpty!29130 (= mapRes!29130 (and tp!56046 e!501994))))

(declare-fun mapRest!29130 () (Array (_ BitVec 32) ValueCell!8678))

(declare-fun mapKey!29130 () (_ BitVec 32))

(declare-fun mapValue!29130 () ValueCell!8678)

(assert (=> mapNonEmpty!29130 (= mapRest!29121 (store mapRest!29130 mapKey!29130 mapValue!29130))))

(declare-fun condMapEmpty!29130 () Bool)

(declare-fun mapDefault!29130 () ValueCell!8678)

(assert (=> mapNonEmpty!29121 (= condMapEmpty!29130 (= mapRest!29121 ((as const (Array (_ BitVec 32) ValueCell!8678)) mapDefault!29130)))))

(assert (=> mapNonEmpty!29121 (= tp!56030 (and e!501993 mapRes!29130))))

(assert (= (and mapNonEmpty!29121 condMapEmpty!29130) mapIsEmpty!29130))

(assert (= (and mapNonEmpty!29121 (not condMapEmpty!29130)) mapNonEmpty!29130))

(assert (= (and mapNonEmpty!29130 ((_ is ValueCellFull!8678) mapValue!29130)) b!897613))

(assert (= (and mapNonEmpty!29121 ((_ is ValueCellFull!8678) mapDefault!29130)) b!897614))

(declare-fun m!833753 () Bool)

(assert (=> mapNonEmpty!29130 m!833753))

(check-sat tp_is_empty!18319 (not bm!39791) (not b!897605) (not b!897595) (not b!897552) (not d!110961) (not bm!39794) (not d!110953) (not b!897604) (not b!897549) (not b!897581) b_and!26257 (not b_next!15991) (not b!897567) (not b!897585) (not mapNonEmpty!29130) (not d!110951) (not b!897596) (not d!110945) (not b!897583) (not b!897606))
(check-sat b_and!26257 (not b_next!15991))
