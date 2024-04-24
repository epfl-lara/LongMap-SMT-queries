; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76522 () Bool)

(assert start!76522)

(declare-fun b!896783 () Bool)

(declare-fun b_free!15925 () Bool)

(declare-fun b_next!15925 () Bool)

(assert (=> b!896783 (= b_free!15925 (not b_next!15925))))

(declare-fun tp!55794 () Bool)

(declare-fun b_and!26227 () Bool)

(assert (=> b!896783 (= tp!55794 b_and!26227)))

(declare-fun b!896782 () Bool)

(declare-fun e!501204 () Bool)

(declare-fun e!501200 () Bool)

(declare-fun mapRes!28984 () Bool)

(assert (=> b!896782 (= e!501204 (and e!501200 mapRes!28984))))

(declare-fun condMapEmpty!28984 () Bool)

(declare-datatypes ((array!52553 0))(
  ( (array!52554 (arr!25264 (Array (_ BitVec 32) (_ BitVec 64))) (size!25715 (_ BitVec 32))) )
))
(declare-datatypes ((V!29303 0))(
  ( (V!29304 (val!9177 Int)) )
))
(declare-datatypes ((ValueCell!8645 0))(
  ( (ValueCellFull!8645 (v!11664 V!29303)) (EmptyCell!8645) )
))
(declare-datatypes ((array!52555 0))(
  ( (array!52556 (arr!25265 (Array (_ BitVec 32) ValueCell!8645)) (size!25716 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4306 0))(
  ( (LongMapFixedSize!4307 (defaultEntry!5365 Int) (mask!26022 (_ BitVec 32)) (extraKeys!5061 (_ BitVec 32)) (zeroValue!5165 V!29303) (minValue!5165 V!29303) (_size!2208 (_ BitVec 32)) (_keys!10114 array!52553) (_values!5352 array!52555) (_vacant!2208 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4306)

(declare-fun mapDefault!28984 () ValueCell!8645)

(assert (=> b!896782 (= condMapEmpty!28984 (= (arr!25265 (_values!5352 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8645)) mapDefault!28984)))))

(declare-fun mapNonEmpty!28984 () Bool)

(declare-fun tp!55795 () Bool)

(declare-fun e!501203 () Bool)

(assert (=> mapNonEmpty!28984 (= mapRes!28984 (and tp!55795 e!501203))))

(declare-fun mapRest!28984 () (Array (_ BitVec 32) ValueCell!8645))

(declare-fun mapKey!28984 () (_ BitVec 32))

(declare-fun mapValue!28984 () ValueCell!8645)

(assert (=> mapNonEmpty!28984 (= (arr!25265 (_values!5352 thiss!1181)) (store mapRest!28984 mapKey!28984 mapValue!28984))))

(declare-fun res!606261 () Bool)

(declare-fun e!501205 () Bool)

(assert (=> start!76522 (=> (not res!606261) (not e!501205))))

(declare-fun valid!1673 (LongMapFixedSize!4306) Bool)

(assert (=> start!76522 (= res!606261 (valid!1673 thiss!1181))))

(assert (=> start!76522 e!501205))

(declare-fun e!501201 () Bool)

(assert (=> start!76522 e!501201))

(assert (=> start!76522 true))

(declare-fun tp_is_empty!18253 () Bool)

(declare-fun array_inv!19880 (array!52553) Bool)

(declare-fun array_inv!19881 (array!52555) Bool)

(assert (=> b!896783 (= e!501201 (and tp!55794 tp_is_empty!18253 (array_inv!19880 (_keys!10114 thiss!1181)) (array_inv!19881 (_values!5352 thiss!1181)) e!501204))))

(declare-fun b!896784 () Bool)

(declare-fun res!606262 () Bool)

(assert (=> b!896784 (=> (not res!606262) (not e!501205))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!896784 (= res!606262 (not (= key!785 (bvneg key!785))))))

(declare-fun b!896785 () Bool)

(assert (=> b!896785 (= e!501203 tp_is_empty!18253)))

(declare-fun b!896786 () Bool)

(assert (=> b!896786 (= e!501200 tp_is_empty!18253)))

(declare-fun mapIsEmpty!28984 () Bool)

(assert (=> mapIsEmpty!28984 mapRes!28984))

(declare-fun b!896787 () Bool)

(declare-datatypes ((SeekEntryResult!8839 0))(
  ( (MissingZero!8839 (index!37727 (_ BitVec 32))) (Found!8839 (index!37728 (_ BitVec 32))) (Intermediate!8839 (undefined!9651 Bool) (index!37729 (_ BitVec 32)) (x!76213 (_ BitVec 32))) (Undefined!8839) (MissingVacant!8839 (index!37730 (_ BitVec 32))) )
))
(declare-fun lt!404986 () SeekEntryResult!8839)

(get-info :version)

(assert (=> b!896787 (= e!501205 (not (or (not ((_ is Found!8839) lt!404986)) (bvsge (index!37728 lt!404986) #b00000000000000000000000000000000))))))

(declare-fun e!501206 () Bool)

(assert (=> b!896787 e!501206))

(declare-fun res!606260 () Bool)

(assert (=> b!896787 (=> res!606260 e!501206)))

(assert (=> b!896787 (= res!606260 (not ((_ is Found!8839) lt!404986)))))

(declare-datatypes ((Unit!30454 0))(
  ( (Unit!30455) )
))
(declare-fun lt!404987 () Unit!30454)

(declare-fun lemmaSeekEntryGivesInRangeIndex!68 (array!52553 array!52555 (_ BitVec 32) (_ BitVec 32) V!29303 V!29303 (_ BitVec 64)) Unit!30454)

(assert (=> b!896787 (= lt!404987 (lemmaSeekEntryGivesInRangeIndex!68 (_keys!10114 thiss!1181) (_values!5352 thiss!1181) (mask!26022 thiss!1181) (extraKeys!5061 thiss!1181) (zeroValue!5165 thiss!1181) (minValue!5165 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52553 (_ BitVec 32)) SeekEntryResult!8839)

(assert (=> b!896787 (= lt!404986 (seekEntry!0 key!785 (_keys!10114 thiss!1181) (mask!26022 thiss!1181)))))

(declare-fun b!896788 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896788 (= e!501206 (inRange!0 (index!37728 lt!404986) (mask!26022 thiss!1181)))))

(assert (= (and start!76522 res!606261) b!896784))

(assert (= (and b!896784 res!606262) b!896787))

(assert (= (and b!896787 (not res!606260)) b!896788))

(assert (= (and b!896782 condMapEmpty!28984) mapIsEmpty!28984))

(assert (= (and b!896782 (not condMapEmpty!28984)) mapNonEmpty!28984))

(assert (= (and mapNonEmpty!28984 ((_ is ValueCellFull!8645) mapValue!28984)) b!896785))

(assert (= (and b!896782 ((_ is ValueCellFull!8645) mapDefault!28984)) b!896786))

(assert (= b!896783 b!896782))

(assert (= start!76522 b!896783))

(declare-fun m!834561 () Bool)

(assert (=> b!896788 m!834561))

(declare-fun m!834563 () Bool)

(assert (=> mapNonEmpty!28984 m!834563))

(declare-fun m!834565 () Bool)

(assert (=> b!896787 m!834565))

(declare-fun m!834567 () Bool)

(assert (=> b!896787 m!834567))

(declare-fun m!834569 () Bool)

(assert (=> b!896783 m!834569))

(declare-fun m!834571 () Bool)

(assert (=> b!896783 m!834571))

(declare-fun m!834573 () Bool)

(assert (=> start!76522 m!834573))

(check-sat (not b!896787) (not b!896788) (not start!76522) b_and!26227 (not mapNonEmpty!28984) (not b!896783) tp_is_empty!18253 (not b_next!15925))
(check-sat b_and!26227 (not b_next!15925))
(get-model)

(declare-fun d!111153 () Bool)

(assert (=> d!111153 (= (array_inv!19880 (_keys!10114 thiss!1181)) (bvsge (size!25715 (_keys!10114 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896783 d!111153))

(declare-fun d!111155 () Bool)

(assert (=> d!111155 (= (array_inv!19881 (_values!5352 thiss!1181)) (bvsge (size!25716 (_values!5352 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896783 d!111155))

(declare-fun d!111157 () Bool)

(declare-fun e!501251 () Bool)

(assert (=> d!111157 e!501251))

(declare-fun res!606283 () Bool)

(assert (=> d!111157 (=> res!606283 e!501251)))

(declare-fun lt!405005 () SeekEntryResult!8839)

(assert (=> d!111157 (= res!606283 (not ((_ is Found!8839) lt!405005)))))

(assert (=> d!111157 (= lt!405005 (seekEntry!0 key!785 (_keys!10114 thiss!1181) (mask!26022 thiss!1181)))))

(declare-fun lt!405004 () Unit!30454)

(declare-fun choose!1480 (array!52553 array!52555 (_ BitVec 32) (_ BitVec 32) V!29303 V!29303 (_ BitVec 64)) Unit!30454)

(assert (=> d!111157 (= lt!405004 (choose!1480 (_keys!10114 thiss!1181) (_values!5352 thiss!1181) (mask!26022 thiss!1181) (extraKeys!5061 thiss!1181) (zeroValue!5165 thiss!1181) (minValue!5165 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!111157 (validMask!0 (mask!26022 thiss!1181))))

(assert (=> d!111157 (= (lemmaSeekEntryGivesInRangeIndex!68 (_keys!10114 thiss!1181) (_values!5352 thiss!1181) (mask!26022 thiss!1181) (extraKeys!5061 thiss!1181) (zeroValue!5165 thiss!1181) (minValue!5165 thiss!1181) key!785) lt!405004)))

(declare-fun b!896833 () Bool)

(assert (=> b!896833 (= e!501251 (inRange!0 (index!37728 lt!405005) (mask!26022 thiss!1181)))))

(assert (= (and d!111157 (not res!606283)) b!896833))

(assert (=> d!111157 m!834567))

(declare-fun m!834603 () Bool)

(assert (=> d!111157 m!834603))

(declare-fun m!834605 () Bool)

(assert (=> d!111157 m!834605))

(declare-fun m!834607 () Bool)

(assert (=> b!896833 m!834607))

(assert (=> b!896787 d!111157))

(declare-fun b!896846 () Bool)

(declare-fun e!501258 () SeekEntryResult!8839)

(declare-fun lt!405014 () SeekEntryResult!8839)

(assert (=> b!896846 (= e!501258 (MissingZero!8839 (index!37729 lt!405014)))))

(declare-fun b!896847 () Bool)

(declare-fun c!94907 () Bool)

(declare-fun lt!405016 () (_ BitVec 64))

(assert (=> b!896847 (= c!94907 (= lt!405016 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501259 () SeekEntryResult!8839)

(assert (=> b!896847 (= e!501259 e!501258)))

(declare-fun b!896848 () Bool)

(declare-fun lt!405015 () SeekEntryResult!8839)

(assert (=> b!896848 (= e!501258 (ite ((_ is MissingVacant!8839) lt!405015) (MissingZero!8839 (index!37730 lt!405015)) lt!405015))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52553 (_ BitVec 32)) SeekEntryResult!8839)

(assert (=> b!896848 (= lt!405015 (seekKeyOrZeroReturnVacant!0 (x!76213 lt!405014) (index!37729 lt!405014) (index!37729 lt!405014) key!785 (_keys!10114 thiss!1181) (mask!26022 thiss!1181)))))

(declare-fun b!896849 () Bool)

(declare-fun e!501260 () SeekEntryResult!8839)

(assert (=> b!896849 (= e!501260 e!501259)))

(assert (=> b!896849 (= lt!405016 (select (arr!25264 (_keys!10114 thiss!1181)) (index!37729 lt!405014)))))

(declare-fun c!94905 () Bool)

(assert (=> b!896849 (= c!94905 (= lt!405016 key!785))))

(declare-fun b!896850 () Bool)

(assert (=> b!896850 (= e!501259 (Found!8839 (index!37729 lt!405014)))))

(declare-fun d!111159 () Bool)

(declare-fun lt!405017 () SeekEntryResult!8839)

(assert (=> d!111159 (and (or ((_ is MissingVacant!8839) lt!405017) (not ((_ is Found!8839) lt!405017)) (and (bvsge (index!37728 lt!405017) #b00000000000000000000000000000000) (bvslt (index!37728 lt!405017) (size!25715 (_keys!10114 thiss!1181))))) (not ((_ is MissingVacant!8839) lt!405017)) (or (not ((_ is Found!8839) lt!405017)) (= (select (arr!25264 (_keys!10114 thiss!1181)) (index!37728 lt!405017)) key!785)))))

(assert (=> d!111159 (= lt!405017 e!501260)))

(declare-fun c!94906 () Bool)

(assert (=> d!111159 (= c!94906 (and ((_ is Intermediate!8839) lt!405014) (undefined!9651 lt!405014)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52553 (_ BitVec 32)) SeekEntryResult!8839)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111159 (= lt!405014 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26022 thiss!1181)) key!785 (_keys!10114 thiss!1181) (mask!26022 thiss!1181)))))

(assert (=> d!111159 (validMask!0 (mask!26022 thiss!1181))))

(assert (=> d!111159 (= (seekEntry!0 key!785 (_keys!10114 thiss!1181) (mask!26022 thiss!1181)) lt!405017)))

(declare-fun b!896851 () Bool)

(assert (=> b!896851 (= e!501260 Undefined!8839)))

(assert (= (and d!111159 c!94906) b!896851))

(assert (= (and d!111159 (not c!94906)) b!896849))

(assert (= (and b!896849 c!94905) b!896850))

(assert (= (and b!896849 (not c!94905)) b!896847))

(assert (= (and b!896847 c!94907) b!896846))

(assert (= (and b!896847 (not c!94907)) b!896848))

(declare-fun m!834609 () Bool)

(assert (=> b!896848 m!834609))

(declare-fun m!834611 () Bool)

(assert (=> b!896849 m!834611))

(declare-fun m!834613 () Bool)

(assert (=> d!111159 m!834613))

(declare-fun m!834615 () Bool)

(assert (=> d!111159 m!834615))

(assert (=> d!111159 m!834615))

(declare-fun m!834617 () Bool)

(assert (=> d!111159 m!834617))

(assert (=> d!111159 m!834605))

(assert (=> b!896787 d!111159))

(declare-fun d!111161 () Bool)

(declare-fun res!606290 () Bool)

(declare-fun e!501263 () Bool)

(assert (=> d!111161 (=> (not res!606290) (not e!501263))))

(declare-fun simpleValid!309 (LongMapFixedSize!4306) Bool)

(assert (=> d!111161 (= res!606290 (simpleValid!309 thiss!1181))))

(assert (=> d!111161 (= (valid!1673 thiss!1181) e!501263)))

(declare-fun b!896858 () Bool)

(declare-fun res!606291 () Bool)

(assert (=> b!896858 (=> (not res!606291) (not e!501263))))

(declare-fun arrayCountValidKeys!0 (array!52553 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896858 (= res!606291 (= (arrayCountValidKeys!0 (_keys!10114 thiss!1181) #b00000000000000000000000000000000 (size!25715 (_keys!10114 thiss!1181))) (_size!2208 thiss!1181)))))

(declare-fun b!896859 () Bool)

(declare-fun res!606292 () Bool)

(assert (=> b!896859 (=> (not res!606292) (not e!501263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52553 (_ BitVec 32)) Bool)

(assert (=> b!896859 (= res!606292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10114 thiss!1181) (mask!26022 thiss!1181)))))

(declare-fun b!896860 () Bool)

(declare-datatypes ((List!17769 0))(
  ( (Nil!17766) (Cons!17765 (h!18908 (_ BitVec 64)) (t!25100 List!17769)) )
))
(declare-fun arrayNoDuplicates!0 (array!52553 (_ BitVec 32) List!17769) Bool)

(assert (=> b!896860 (= e!501263 (arrayNoDuplicates!0 (_keys!10114 thiss!1181) #b00000000000000000000000000000000 Nil!17766))))

(assert (= (and d!111161 res!606290) b!896858))

(assert (= (and b!896858 res!606291) b!896859))

(assert (= (and b!896859 res!606292) b!896860))

(declare-fun m!834619 () Bool)

(assert (=> d!111161 m!834619))

(declare-fun m!834621 () Bool)

(assert (=> b!896858 m!834621))

(declare-fun m!834623 () Bool)

(assert (=> b!896859 m!834623))

(declare-fun m!834625 () Bool)

(assert (=> b!896860 m!834625))

(assert (=> start!76522 d!111161))

(declare-fun d!111163 () Bool)

(assert (=> d!111163 (= (inRange!0 (index!37728 lt!404986) (mask!26022 thiss!1181)) (and (bvsge (index!37728 lt!404986) #b00000000000000000000000000000000) (bvslt (index!37728 lt!404986) (bvadd (mask!26022 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896788 d!111163))

(declare-fun mapNonEmpty!28993 () Bool)

(declare-fun mapRes!28993 () Bool)

(declare-fun tp!55810 () Bool)

(declare-fun e!501269 () Bool)

(assert (=> mapNonEmpty!28993 (= mapRes!28993 (and tp!55810 e!501269))))

(declare-fun mapRest!28993 () (Array (_ BitVec 32) ValueCell!8645))

(declare-fun mapKey!28993 () (_ BitVec 32))

(declare-fun mapValue!28993 () ValueCell!8645)

(assert (=> mapNonEmpty!28993 (= mapRest!28984 (store mapRest!28993 mapKey!28993 mapValue!28993))))

(declare-fun mapIsEmpty!28993 () Bool)

(assert (=> mapIsEmpty!28993 mapRes!28993))

(declare-fun b!896867 () Bool)

(assert (=> b!896867 (= e!501269 tp_is_empty!18253)))

(declare-fun b!896868 () Bool)

(declare-fun e!501268 () Bool)

(assert (=> b!896868 (= e!501268 tp_is_empty!18253)))

(declare-fun condMapEmpty!28993 () Bool)

(declare-fun mapDefault!28993 () ValueCell!8645)

(assert (=> mapNonEmpty!28984 (= condMapEmpty!28993 (= mapRest!28984 ((as const (Array (_ BitVec 32) ValueCell!8645)) mapDefault!28993)))))

(assert (=> mapNonEmpty!28984 (= tp!55795 (and e!501268 mapRes!28993))))

(assert (= (and mapNonEmpty!28984 condMapEmpty!28993) mapIsEmpty!28993))

(assert (= (and mapNonEmpty!28984 (not condMapEmpty!28993)) mapNonEmpty!28993))

(assert (= (and mapNonEmpty!28993 ((_ is ValueCellFull!8645) mapValue!28993)) b!896867))

(assert (= (and mapNonEmpty!28984 ((_ is ValueCellFull!8645) mapDefault!28993)) b!896868))

(declare-fun m!834627 () Bool)

(assert (=> mapNonEmpty!28993 m!834627))

(check-sat (not d!111157) (not d!111159) (not b!896858) (not b!896848) b_and!26227 (not b!896859) (not d!111161) (not b_next!15925) (not b!896833) (not b!896860) (not mapNonEmpty!28993) tp_is_empty!18253)
(check-sat b_and!26227 (not b_next!15925))
