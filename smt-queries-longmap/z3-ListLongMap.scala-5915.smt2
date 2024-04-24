; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76856 () Bool)

(assert start!76856)

(declare-fun b!898611 () Bool)

(declare-fun b_free!15991 () Bool)

(declare-fun b_next!15991 () Bool)

(assert (=> b!898611 (= b_free!15991 (not b_next!15991))))

(declare-fun tp!56031 () Bool)

(declare-fun b_and!26293 () Bool)

(assert (=> b!898611 (= tp!56031 b_and!26293)))

(declare-fun b!898609 () Bool)

(declare-fun e!502622 () Bool)

(declare-fun tp_is_empty!18319 () Bool)

(assert (=> b!898609 (= e!502622 tp_is_empty!18319)))

(declare-fun b!898610 () Bool)

(declare-fun res!607098 () Bool)

(declare-fun e!502620 () Bool)

(assert (=> b!898610 (=> res!607098 e!502620)))

(declare-datatypes ((array!52707 0))(
  ( (array!52708 (arr!25330 (Array (_ BitVec 32) (_ BitVec 64))) (size!25786 (_ BitVec 32))) )
))
(declare-datatypes ((V!29391 0))(
  ( (V!29392 (val!9210 Int)) )
))
(declare-datatypes ((ValueCell!8678 0))(
  ( (ValueCellFull!8678 (v!11697 V!29391)) (EmptyCell!8678) )
))
(declare-datatypes ((array!52709 0))(
  ( (array!52710 (arr!25331 (Array (_ BitVec 32) ValueCell!8678)) (size!25787 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4372 0))(
  ( (LongMapFixedSize!4373 (defaultEntry!5398 Int) (mask!26144 (_ BitVec 32)) (extraKeys!5110 (_ BitVec 32)) (zeroValue!5214 V!29391) (minValue!5214 V!29391) (_size!2241 (_ BitVec 32)) (_keys!10190 array!52707) (_values!5401 array!52709) (_vacant!2241 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4372)

(assert (=> b!898610 (= res!607098 (or (not (= (size!25787 (_values!5401 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26144 thiss!1181)))) (not (= (size!25786 (_keys!10190 thiss!1181)) (size!25787 (_values!5401 thiss!1181)))) (bvslt (mask!26144 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5110 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5110 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun e!502617 () Bool)

(declare-fun e!502616 () Bool)

(declare-fun array_inv!19936 (array!52707) Bool)

(declare-fun array_inv!19937 (array!52709) Bool)

(assert (=> b!898611 (= e!502617 (and tp!56031 tp_is_empty!18319 (array_inv!19936 (_keys!10190 thiss!1181)) (array_inv!19937 (_values!5401 thiss!1181)) e!502616))))

(declare-fun b!898612 () Bool)

(declare-fun e!502615 () Bool)

(assert (=> b!898612 (= e!502615 tp_is_empty!18319)))

(declare-fun res!607099 () Bool)

(declare-fun e!502614 () Bool)

(assert (=> start!76856 (=> (not res!607099) (not e!502614))))

(declare-fun valid!1693 (LongMapFixedSize!4372) Bool)

(assert (=> start!76856 (= res!607099 (valid!1693 thiss!1181))))

(assert (=> start!76856 e!502614))

(assert (=> start!76856 e!502617))

(assert (=> start!76856 true))

(declare-fun b!898613 () Bool)

(declare-datatypes ((List!17780 0))(
  ( (Nil!17777) (Cons!17776 (h!18924 (_ BitVec 64)) (t!25111 List!17780)) )
))
(declare-fun arrayNoDuplicates!0 (array!52707 (_ BitVec 32) List!17780) Bool)

(assert (=> b!898613 (= e!502620 (arrayNoDuplicates!0 (_keys!10190 thiss!1181) #b00000000000000000000000000000000 Nil!17777))))

(declare-fun b!898614 () Bool)

(declare-fun mapRes!29121 () Bool)

(assert (=> b!898614 (= e!502616 (and e!502615 mapRes!29121))))

(declare-fun condMapEmpty!29121 () Bool)

(declare-fun mapDefault!29121 () ValueCell!8678)

(assert (=> b!898614 (= condMapEmpty!29121 (= (arr!25331 (_values!5401 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8678)) mapDefault!29121)))))

(declare-fun b!898615 () Bool)

(declare-fun res!607100 () Bool)

(assert (=> b!898615 (=> res!607100 e!502620)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52707 (_ BitVec 32)) Bool)

(assert (=> b!898615 (= res!607100 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10190 thiss!1181) (mask!26144 thiss!1181))))))

(declare-fun mapIsEmpty!29121 () Bool)

(assert (=> mapIsEmpty!29121 mapRes!29121))

(declare-fun b!898616 () Bool)

(declare-fun e!502619 () Bool)

(assert (=> b!898616 (= e!502614 (not e!502619))))

(declare-fun res!607096 () Bool)

(assert (=> b!898616 (=> res!607096 e!502619)))

(declare-datatypes ((SeekEntryResult!8867 0))(
  ( (MissingZero!8867 (index!37839 (_ BitVec 32))) (Found!8867 (index!37840 (_ BitVec 32))) (Intermediate!8867 (undefined!9679 Bool) (index!37841 (_ BitVec 32)) (x!76462 (_ BitVec 32))) (Undefined!8867) (MissingVacant!8867 (index!37842 (_ BitVec 32))) )
))
(declare-fun lt!405644 () SeekEntryResult!8867)

(get-info :version)

(assert (=> b!898616 (= res!607096 (not ((_ is Found!8867) lt!405644)))))

(declare-fun e!502621 () Bool)

(assert (=> b!898616 e!502621))

(declare-fun res!607097 () Bool)

(assert (=> b!898616 (=> res!607097 e!502621)))

(assert (=> b!898616 (= res!607097 (not ((_ is Found!8867) lt!405644)))))

(declare-datatypes ((Unit!30502 0))(
  ( (Unit!30503) )
))
(declare-fun lt!405642 () Unit!30502)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!89 (array!52707 array!52709 (_ BitVec 32) (_ BitVec 32) V!29391 V!29391 (_ BitVec 64)) Unit!30502)

(assert (=> b!898616 (= lt!405642 (lemmaSeekEntryGivesInRangeIndex!89 (_keys!10190 thiss!1181) (_values!5401 thiss!1181) (mask!26144 thiss!1181) (extraKeys!5110 thiss!1181) (zeroValue!5214 thiss!1181) (minValue!5214 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52707 (_ BitVec 32)) SeekEntryResult!8867)

(assert (=> b!898616 (= lt!405644 (seekEntry!0 key!785 (_keys!10190 thiss!1181) (mask!26144 thiss!1181)))))

(declare-fun mapNonEmpty!29121 () Bool)

(declare-fun tp!56030 () Bool)

(assert (=> mapNonEmpty!29121 (= mapRes!29121 (and tp!56030 e!502622))))

(declare-fun mapKey!29121 () (_ BitVec 32))

(declare-fun mapValue!29121 () ValueCell!8678)

(declare-fun mapRest!29121 () (Array (_ BitVec 32) ValueCell!8678))

(assert (=> mapNonEmpty!29121 (= (arr!25331 (_values!5401 thiss!1181)) (store mapRest!29121 mapKey!29121 mapValue!29121))))

(declare-fun b!898617 () Bool)

(assert (=> b!898617 (= e!502619 e!502620)))

(declare-fun res!607094 () Bool)

(assert (=> b!898617 (=> res!607094 e!502620)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898617 (= res!607094 (not (validMask!0 (mask!26144 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898617 (arrayContainsKey!0 (_keys!10190 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405643 () Unit!30502)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52707 (_ BitVec 64) (_ BitVec 32)) Unit!30502)

(assert (=> b!898617 (= lt!405643 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10190 thiss!1181) key!785 (index!37840 lt!405644)))))

(declare-fun b!898618 () Bool)

(declare-fun res!607095 () Bool)

(assert (=> b!898618 (=> (not res!607095) (not e!502614))))

(assert (=> b!898618 (= res!607095 (not (= key!785 (bvneg key!785))))))

(declare-fun b!898619 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898619 (= e!502621 (inRange!0 (index!37840 lt!405644) (mask!26144 thiss!1181)))))

(assert (= (and start!76856 res!607099) b!898618))

(assert (= (and b!898618 res!607095) b!898616))

(assert (= (and b!898616 (not res!607097)) b!898619))

(assert (= (and b!898616 (not res!607096)) b!898617))

(assert (= (and b!898617 (not res!607094)) b!898610))

(assert (= (and b!898610 (not res!607098)) b!898615))

(assert (= (and b!898615 (not res!607100)) b!898613))

(assert (= (and b!898614 condMapEmpty!29121) mapIsEmpty!29121))

(assert (= (and b!898614 (not condMapEmpty!29121)) mapNonEmpty!29121))

(assert (= (and mapNonEmpty!29121 ((_ is ValueCellFull!8678) mapValue!29121)) b!898609))

(assert (= (and b!898614 ((_ is ValueCellFull!8678) mapDefault!29121)) b!898612))

(assert (= b!898611 b!898614))

(assert (= start!76856 b!898611))

(declare-fun m!835695 () Bool)

(assert (=> b!898615 m!835695))

(declare-fun m!835697 () Bool)

(assert (=> b!898613 m!835697))

(declare-fun m!835699 () Bool)

(assert (=> b!898611 m!835699))

(declare-fun m!835701 () Bool)

(assert (=> b!898611 m!835701))

(declare-fun m!835703 () Bool)

(assert (=> start!76856 m!835703))

(declare-fun m!835705 () Bool)

(assert (=> mapNonEmpty!29121 m!835705))

(declare-fun m!835707 () Bool)

(assert (=> b!898616 m!835707))

(declare-fun m!835709 () Bool)

(assert (=> b!898616 m!835709))

(declare-fun m!835711 () Bool)

(assert (=> b!898619 m!835711))

(declare-fun m!835713 () Bool)

(assert (=> b!898617 m!835713))

(declare-fun m!835715 () Bool)

(assert (=> b!898617 m!835715))

(declare-fun m!835717 () Bool)

(assert (=> b!898617 m!835717))

(check-sat (not mapNonEmpty!29121) (not b!898611) (not start!76856) tp_is_empty!18319 (not b!898617) b_and!26293 (not b!898613) (not b_next!15991) (not b!898616) (not b!898619) (not b!898615))
(check-sat b_and!26293 (not b_next!15991))
(get-model)

(declare-fun d!111461 () Bool)

(assert (=> d!111461 (= (validMask!0 (mask!26144 thiss!1181)) (and (or (= (mask!26144 thiss!1181) #b00000000000000000000000000000111) (= (mask!26144 thiss!1181) #b00000000000000000000000000001111) (= (mask!26144 thiss!1181) #b00000000000000000000000000011111) (= (mask!26144 thiss!1181) #b00000000000000000000000000111111) (= (mask!26144 thiss!1181) #b00000000000000000000000001111111) (= (mask!26144 thiss!1181) #b00000000000000000000000011111111) (= (mask!26144 thiss!1181) #b00000000000000000000000111111111) (= (mask!26144 thiss!1181) #b00000000000000000000001111111111) (= (mask!26144 thiss!1181) #b00000000000000000000011111111111) (= (mask!26144 thiss!1181) #b00000000000000000000111111111111) (= (mask!26144 thiss!1181) #b00000000000000000001111111111111) (= (mask!26144 thiss!1181) #b00000000000000000011111111111111) (= (mask!26144 thiss!1181) #b00000000000000000111111111111111) (= (mask!26144 thiss!1181) #b00000000000000001111111111111111) (= (mask!26144 thiss!1181) #b00000000000000011111111111111111) (= (mask!26144 thiss!1181) #b00000000000000111111111111111111) (= (mask!26144 thiss!1181) #b00000000000001111111111111111111) (= (mask!26144 thiss!1181) #b00000000000011111111111111111111) (= (mask!26144 thiss!1181) #b00000000000111111111111111111111) (= (mask!26144 thiss!1181) #b00000000001111111111111111111111) (= (mask!26144 thiss!1181) #b00000000011111111111111111111111) (= (mask!26144 thiss!1181) #b00000000111111111111111111111111) (= (mask!26144 thiss!1181) #b00000001111111111111111111111111) (= (mask!26144 thiss!1181) #b00000011111111111111111111111111) (= (mask!26144 thiss!1181) #b00000111111111111111111111111111) (= (mask!26144 thiss!1181) #b00001111111111111111111111111111) (= (mask!26144 thiss!1181) #b00011111111111111111111111111111) (= (mask!26144 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26144 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!898617 d!111461))

(declare-fun d!111463 () Bool)

(declare-fun res!607147 () Bool)

(declare-fun e!502681 () Bool)

(assert (=> d!111463 (=> res!607147 e!502681)))

(assert (=> d!111463 (= res!607147 (= (select (arr!25330 (_keys!10190 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111463 (= (arrayContainsKey!0 (_keys!10190 thiss!1181) key!785 #b00000000000000000000000000000000) e!502681)))

(declare-fun b!898690 () Bool)

(declare-fun e!502682 () Bool)

(assert (=> b!898690 (= e!502681 e!502682)))

(declare-fun res!607148 () Bool)

(assert (=> b!898690 (=> (not res!607148) (not e!502682))))

(assert (=> b!898690 (= res!607148 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25786 (_keys!10190 thiss!1181))))))

(declare-fun b!898691 () Bool)

(assert (=> b!898691 (= e!502682 (arrayContainsKey!0 (_keys!10190 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111463 (not res!607147)) b!898690))

(assert (= (and b!898690 res!607148) b!898691))

(declare-fun m!835767 () Bool)

(assert (=> d!111463 m!835767))

(declare-fun m!835769 () Bool)

(assert (=> b!898691 m!835769))

(assert (=> b!898617 d!111463))

(declare-fun d!111465 () Bool)

(assert (=> d!111465 (arrayContainsKey!0 (_keys!10190 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405665 () Unit!30502)

(declare-fun choose!13 (array!52707 (_ BitVec 64) (_ BitVec 32)) Unit!30502)

(assert (=> d!111465 (= lt!405665 (choose!13 (_keys!10190 thiss!1181) key!785 (index!37840 lt!405644)))))

(assert (=> d!111465 (bvsge (index!37840 lt!405644) #b00000000000000000000000000000000)))

(assert (=> d!111465 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10190 thiss!1181) key!785 (index!37840 lt!405644)) lt!405665)))

(declare-fun bs!25211 () Bool)

(assert (= bs!25211 d!111465))

(assert (=> bs!25211 m!835715))

(declare-fun m!835771 () Bool)

(assert (=> bs!25211 m!835771))

(assert (=> b!898617 d!111465))

(declare-fun d!111467 () Bool)

(assert (=> d!111467 (= (inRange!0 (index!37840 lt!405644) (mask!26144 thiss!1181)) (and (bvsge (index!37840 lt!405644) #b00000000000000000000000000000000) (bvslt (index!37840 lt!405644) (bvadd (mask!26144 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898619 d!111467))

(declare-fun bm!39862 () Bool)

(declare-fun call!39865 () Bool)

(assert (=> bm!39862 (= call!39865 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10190 thiss!1181) (mask!26144 thiss!1181)))))

(declare-fun b!898700 () Bool)

(declare-fun e!502691 () Bool)

(declare-fun e!502690 () Bool)

(assert (=> b!898700 (= e!502691 e!502690)))

(declare-fun lt!405674 () (_ BitVec 64))

(assert (=> b!898700 (= lt!405674 (select (arr!25330 (_keys!10190 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405672 () Unit!30502)

(assert (=> b!898700 (= lt!405672 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10190 thiss!1181) lt!405674 #b00000000000000000000000000000000))))

(assert (=> b!898700 (arrayContainsKey!0 (_keys!10190 thiss!1181) lt!405674 #b00000000000000000000000000000000)))

(declare-fun lt!405673 () Unit!30502)

(assert (=> b!898700 (= lt!405673 lt!405672)))

(declare-fun res!607153 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52707 (_ BitVec 32)) SeekEntryResult!8867)

(assert (=> b!898700 (= res!607153 (= (seekEntryOrOpen!0 (select (arr!25330 (_keys!10190 thiss!1181)) #b00000000000000000000000000000000) (_keys!10190 thiss!1181) (mask!26144 thiss!1181)) (Found!8867 #b00000000000000000000000000000000)))))

(assert (=> b!898700 (=> (not res!607153) (not e!502690))))

(declare-fun b!898701 () Bool)

(assert (=> b!898701 (= e!502691 call!39865)))

(declare-fun b!898703 () Bool)

(assert (=> b!898703 (= e!502690 call!39865)))

(declare-fun b!898702 () Bool)

(declare-fun e!502689 () Bool)

(assert (=> b!898702 (= e!502689 e!502691)))

(declare-fun c!95153 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!898702 (= c!95153 (validKeyInArray!0 (select (arr!25330 (_keys!10190 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111469 () Bool)

(declare-fun res!607154 () Bool)

(assert (=> d!111469 (=> res!607154 e!502689)))

(assert (=> d!111469 (= res!607154 (bvsge #b00000000000000000000000000000000 (size!25786 (_keys!10190 thiss!1181))))))

(assert (=> d!111469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10190 thiss!1181) (mask!26144 thiss!1181)) e!502689)))

(assert (= (and d!111469 (not res!607154)) b!898702))

(assert (= (and b!898702 c!95153) b!898700))

(assert (= (and b!898702 (not c!95153)) b!898701))

(assert (= (and b!898700 res!607153) b!898703))

(assert (= (or b!898703 b!898701) bm!39862))

(declare-fun m!835773 () Bool)

(assert (=> bm!39862 m!835773))

(assert (=> b!898700 m!835767))

(declare-fun m!835775 () Bool)

(assert (=> b!898700 m!835775))

(declare-fun m!835777 () Bool)

(assert (=> b!898700 m!835777))

(assert (=> b!898700 m!835767))

(declare-fun m!835779 () Bool)

(assert (=> b!898700 m!835779))

(assert (=> b!898702 m!835767))

(assert (=> b!898702 m!835767))

(declare-fun m!835781 () Bool)

(assert (=> b!898702 m!835781))

(assert (=> b!898615 d!111469))

(declare-fun d!111471 () Bool)

(declare-fun e!502694 () Bool)

(assert (=> d!111471 e!502694))

(declare-fun res!607157 () Bool)

(assert (=> d!111471 (=> res!607157 e!502694)))

(declare-fun lt!405680 () SeekEntryResult!8867)

(assert (=> d!111471 (= res!607157 (not ((_ is Found!8867) lt!405680)))))

(assert (=> d!111471 (= lt!405680 (seekEntry!0 key!785 (_keys!10190 thiss!1181) (mask!26144 thiss!1181)))))

(declare-fun lt!405679 () Unit!30502)

(declare-fun choose!1491 (array!52707 array!52709 (_ BitVec 32) (_ BitVec 32) V!29391 V!29391 (_ BitVec 64)) Unit!30502)

(assert (=> d!111471 (= lt!405679 (choose!1491 (_keys!10190 thiss!1181) (_values!5401 thiss!1181) (mask!26144 thiss!1181) (extraKeys!5110 thiss!1181) (zeroValue!5214 thiss!1181) (minValue!5214 thiss!1181) key!785))))

(assert (=> d!111471 (validMask!0 (mask!26144 thiss!1181))))

(assert (=> d!111471 (= (lemmaSeekEntryGivesInRangeIndex!89 (_keys!10190 thiss!1181) (_values!5401 thiss!1181) (mask!26144 thiss!1181) (extraKeys!5110 thiss!1181) (zeroValue!5214 thiss!1181) (minValue!5214 thiss!1181) key!785) lt!405679)))

(declare-fun b!898706 () Bool)

(assert (=> b!898706 (= e!502694 (inRange!0 (index!37840 lt!405680) (mask!26144 thiss!1181)))))

(assert (= (and d!111471 (not res!607157)) b!898706))

(assert (=> d!111471 m!835709))

(declare-fun m!835783 () Bool)

(assert (=> d!111471 m!835783))

(assert (=> d!111471 m!835713))

(declare-fun m!835785 () Bool)

(assert (=> b!898706 m!835785))

(assert (=> b!898616 d!111471))

(declare-fun b!898719 () Bool)

(declare-fun e!502701 () SeekEntryResult!8867)

(declare-fun lt!405692 () SeekEntryResult!8867)

(assert (=> b!898719 (= e!502701 (MissingZero!8867 (index!37841 lt!405692)))))

(declare-fun b!898720 () Bool)

(declare-fun e!502702 () SeekEntryResult!8867)

(assert (=> b!898720 (= e!502702 (Found!8867 (index!37841 lt!405692)))))

(declare-fun d!111473 () Bool)

(declare-fun lt!405689 () SeekEntryResult!8867)

(assert (=> d!111473 (and (or ((_ is MissingVacant!8867) lt!405689) (not ((_ is Found!8867) lt!405689)) (and (bvsge (index!37840 lt!405689) #b00000000000000000000000000000000) (bvslt (index!37840 lt!405689) (size!25786 (_keys!10190 thiss!1181))))) (not ((_ is MissingVacant!8867) lt!405689)) (or (not ((_ is Found!8867) lt!405689)) (= (select (arr!25330 (_keys!10190 thiss!1181)) (index!37840 lt!405689)) key!785)))))

(declare-fun e!502703 () SeekEntryResult!8867)

(assert (=> d!111473 (= lt!405689 e!502703)))

(declare-fun c!95160 () Bool)

(assert (=> d!111473 (= c!95160 (and ((_ is Intermediate!8867) lt!405692) (undefined!9679 lt!405692)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52707 (_ BitVec 32)) SeekEntryResult!8867)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111473 (= lt!405692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26144 thiss!1181)) key!785 (_keys!10190 thiss!1181) (mask!26144 thiss!1181)))))

(assert (=> d!111473 (validMask!0 (mask!26144 thiss!1181))))

(assert (=> d!111473 (= (seekEntry!0 key!785 (_keys!10190 thiss!1181) (mask!26144 thiss!1181)) lt!405689)))

(declare-fun b!898721 () Bool)

(assert (=> b!898721 (= e!502703 Undefined!8867)))

(declare-fun b!898722 () Bool)

(assert (=> b!898722 (= e!502703 e!502702)))

(declare-fun lt!405690 () (_ BitVec 64))

(assert (=> b!898722 (= lt!405690 (select (arr!25330 (_keys!10190 thiss!1181)) (index!37841 lt!405692)))))

(declare-fun c!95162 () Bool)

(assert (=> b!898722 (= c!95162 (= lt!405690 key!785))))

(declare-fun b!898723 () Bool)

(declare-fun lt!405691 () SeekEntryResult!8867)

(assert (=> b!898723 (= e!502701 (ite ((_ is MissingVacant!8867) lt!405691) (MissingZero!8867 (index!37842 lt!405691)) lt!405691))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52707 (_ BitVec 32)) SeekEntryResult!8867)

(assert (=> b!898723 (= lt!405691 (seekKeyOrZeroReturnVacant!0 (x!76462 lt!405692) (index!37841 lt!405692) (index!37841 lt!405692) key!785 (_keys!10190 thiss!1181) (mask!26144 thiss!1181)))))

(declare-fun b!898724 () Bool)

(declare-fun c!95161 () Bool)

(assert (=> b!898724 (= c!95161 (= lt!405690 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898724 (= e!502702 e!502701)))

(assert (= (and d!111473 c!95160) b!898721))

(assert (= (and d!111473 (not c!95160)) b!898722))

(assert (= (and b!898722 c!95162) b!898720))

(assert (= (and b!898722 (not c!95162)) b!898724))

(assert (= (and b!898724 c!95161) b!898719))

(assert (= (and b!898724 (not c!95161)) b!898723))

(declare-fun m!835787 () Bool)

(assert (=> d!111473 m!835787))

(declare-fun m!835789 () Bool)

(assert (=> d!111473 m!835789))

(assert (=> d!111473 m!835789))

(declare-fun m!835791 () Bool)

(assert (=> d!111473 m!835791))

(assert (=> d!111473 m!835713))

(declare-fun m!835793 () Bool)

(assert (=> b!898722 m!835793))

(declare-fun m!835795 () Bool)

(assert (=> b!898723 m!835795))

(assert (=> b!898616 d!111473))

(declare-fun d!111475 () Bool)

(assert (=> d!111475 (= (array_inv!19936 (_keys!10190 thiss!1181)) (bvsge (size!25786 (_keys!10190 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898611 d!111475))

(declare-fun d!111477 () Bool)

(assert (=> d!111477 (= (array_inv!19937 (_values!5401 thiss!1181)) (bvsge (size!25787 (_values!5401 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898611 d!111477))

(declare-fun d!111479 () Bool)

(declare-fun res!607164 () Bool)

(declare-fun e!502706 () Bool)

(assert (=> d!111479 (=> (not res!607164) (not e!502706))))

(declare-fun simpleValid!320 (LongMapFixedSize!4372) Bool)

(assert (=> d!111479 (= res!607164 (simpleValid!320 thiss!1181))))

(assert (=> d!111479 (= (valid!1693 thiss!1181) e!502706)))

(declare-fun b!898731 () Bool)

(declare-fun res!607165 () Bool)

(assert (=> b!898731 (=> (not res!607165) (not e!502706))))

(declare-fun arrayCountValidKeys!0 (array!52707 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898731 (= res!607165 (= (arrayCountValidKeys!0 (_keys!10190 thiss!1181) #b00000000000000000000000000000000 (size!25786 (_keys!10190 thiss!1181))) (_size!2241 thiss!1181)))))

(declare-fun b!898732 () Bool)

(declare-fun res!607166 () Bool)

(assert (=> b!898732 (=> (not res!607166) (not e!502706))))

(assert (=> b!898732 (= res!607166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10190 thiss!1181) (mask!26144 thiss!1181)))))

(declare-fun b!898733 () Bool)

(assert (=> b!898733 (= e!502706 (arrayNoDuplicates!0 (_keys!10190 thiss!1181) #b00000000000000000000000000000000 Nil!17777))))

(assert (= (and d!111479 res!607164) b!898731))

(assert (= (and b!898731 res!607165) b!898732))

(assert (= (and b!898732 res!607166) b!898733))

(declare-fun m!835797 () Bool)

(assert (=> d!111479 m!835797))

(declare-fun m!835799 () Bool)

(assert (=> b!898731 m!835799))

(assert (=> b!898732 m!835695))

(assert (=> b!898733 m!835697))

(assert (=> start!76856 d!111479))

(declare-fun b!898744 () Bool)

(declare-fun e!502717 () Bool)

(declare-fun call!39868 () Bool)

(assert (=> b!898744 (= e!502717 call!39868)))

(declare-fun b!898745 () Bool)

(declare-fun e!502718 () Bool)

(declare-fun contains!4376 (List!17780 (_ BitVec 64)) Bool)

(assert (=> b!898745 (= e!502718 (contains!4376 Nil!17777 (select (arr!25330 (_keys!10190 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898746 () Bool)

(declare-fun e!502715 () Bool)

(assert (=> b!898746 (= e!502715 e!502717)))

(declare-fun c!95165 () Bool)

(assert (=> b!898746 (= c!95165 (validKeyInArray!0 (select (arr!25330 (_keys!10190 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39865 () Bool)

(assert (=> bm!39865 (= call!39868 (arrayNoDuplicates!0 (_keys!10190 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95165 (Cons!17776 (select (arr!25330 (_keys!10190 thiss!1181)) #b00000000000000000000000000000000) Nil!17777) Nil!17777)))))

(declare-fun d!111481 () Bool)

(declare-fun res!607175 () Bool)

(declare-fun e!502716 () Bool)

(assert (=> d!111481 (=> res!607175 e!502716)))

(assert (=> d!111481 (= res!607175 (bvsge #b00000000000000000000000000000000 (size!25786 (_keys!10190 thiss!1181))))))

(assert (=> d!111481 (= (arrayNoDuplicates!0 (_keys!10190 thiss!1181) #b00000000000000000000000000000000 Nil!17777) e!502716)))

(declare-fun b!898747 () Bool)

(assert (=> b!898747 (= e!502716 e!502715)))

(declare-fun res!607174 () Bool)

(assert (=> b!898747 (=> (not res!607174) (not e!502715))))

(assert (=> b!898747 (= res!607174 (not e!502718))))

(declare-fun res!607173 () Bool)

(assert (=> b!898747 (=> (not res!607173) (not e!502718))))

(assert (=> b!898747 (= res!607173 (validKeyInArray!0 (select (arr!25330 (_keys!10190 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898748 () Bool)

(assert (=> b!898748 (= e!502717 call!39868)))

(assert (= (and d!111481 (not res!607175)) b!898747))

(assert (= (and b!898747 res!607173) b!898745))

(assert (= (and b!898747 res!607174) b!898746))

(assert (= (and b!898746 c!95165) b!898748))

(assert (= (and b!898746 (not c!95165)) b!898744))

(assert (= (or b!898748 b!898744) bm!39865))

(assert (=> b!898745 m!835767))

(assert (=> b!898745 m!835767))

(declare-fun m!835801 () Bool)

(assert (=> b!898745 m!835801))

(assert (=> b!898746 m!835767))

(assert (=> b!898746 m!835767))

(assert (=> b!898746 m!835781))

(assert (=> bm!39865 m!835767))

(declare-fun m!835803 () Bool)

(assert (=> bm!39865 m!835803))

(assert (=> b!898747 m!835767))

(assert (=> b!898747 m!835767))

(assert (=> b!898747 m!835781))

(assert (=> b!898613 d!111481))

(declare-fun mapIsEmpty!29130 () Bool)

(declare-fun mapRes!29130 () Bool)

(assert (=> mapIsEmpty!29130 mapRes!29130))

(declare-fun b!898756 () Bool)

(declare-fun e!502724 () Bool)

(assert (=> b!898756 (= e!502724 tp_is_empty!18319)))

(declare-fun mapNonEmpty!29130 () Bool)

(declare-fun tp!56046 () Bool)

(declare-fun e!502723 () Bool)

(assert (=> mapNonEmpty!29130 (= mapRes!29130 (and tp!56046 e!502723))))

(declare-fun mapValue!29130 () ValueCell!8678)

(declare-fun mapRest!29130 () (Array (_ BitVec 32) ValueCell!8678))

(declare-fun mapKey!29130 () (_ BitVec 32))

(assert (=> mapNonEmpty!29130 (= mapRest!29121 (store mapRest!29130 mapKey!29130 mapValue!29130))))

(declare-fun condMapEmpty!29130 () Bool)

(declare-fun mapDefault!29130 () ValueCell!8678)

(assert (=> mapNonEmpty!29121 (= condMapEmpty!29130 (= mapRest!29121 ((as const (Array (_ BitVec 32) ValueCell!8678)) mapDefault!29130)))))

(assert (=> mapNonEmpty!29121 (= tp!56030 (and e!502724 mapRes!29130))))

(declare-fun b!898755 () Bool)

(assert (=> b!898755 (= e!502723 tp_is_empty!18319)))

(assert (= (and mapNonEmpty!29121 condMapEmpty!29130) mapIsEmpty!29130))

(assert (= (and mapNonEmpty!29121 (not condMapEmpty!29130)) mapNonEmpty!29130))

(assert (= (and mapNonEmpty!29130 ((_ is ValueCellFull!8678) mapValue!29130)) b!898755))

(assert (= (and mapNonEmpty!29121 ((_ is ValueCellFull!8678) mapDefault!29130)) b!898756))

(declare-fun m!835805 () Bool)

(assert (=> mapNonEmpty!29130 m!835805))

(check-sat b_and!26293 (not b!898702) (not bm!39862) (not b!898732) (not d!111471) (not b_next!15991) (not b!898733) (not mapNonEmpty!29130) (not b!898746) tp_is_empty!18319 (not b!898747) (not b!898691) (not b!898706) (not b!898731) (not d!111465) (not b!898745) (not d!111479) (not b!898700) (not d!111473) (not b!898723) (not bm!39865))
(check-sat b_and!26293 (not b_next!15991))
