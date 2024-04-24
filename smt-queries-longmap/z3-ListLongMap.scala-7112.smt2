; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90352 () Bool)

(assert start!90352)

(declare-fun b!1033669 () Bool)

(declare-fun b_free!20725 () Bool)

(declare-fun b_next!20725 () Bool)

(assert (=> b!1033669 (= b_free!20725 (not b_next!20725))))

(declare-fun tp!73246 () Bool)

(declare-fun b_and!33203 () Bool)

(assert (=> b!1033669 (= tp!73246 b_and!33203)))

(declare-fun tp_is_empty!24445 () Bool)

(declare-fun e!584149 () Bool)

(declare-datatypes ((V!37467 0))(
  ( (V!37468 (val!12273 Int)) )
))
(declare-datatypes ((ValueCell!11519 0))(
  ( (ValueCellFull!11519 (v!14846 V!37467)) (EmptyCell!11519) )
))
(declare-datatypes ((array!65003 0))(
  ( (array!65004 (arr!31297 (Array (_ BitVec 32) (_ BitVec 64))) (size!31815 (_ BitVec 32))) )
))
(declare-datatypes ((array!65005 0))(
  ( (array!65006 (arr!31298 (Array (_ BitVec 32) ValueCell!11519)) (size!31816 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5632 0))(
  ( (LongMapFixedSize!5633 (defaultEntry!6190 Int) (mask!30068 (_ BitVec 32)) (extraKeys!5922 (_ BitVec 32)) (zeroValue!6026 V!37467) (minValue!6026 V!37467) (_size!2871 (_ BitVec 32)) (_keys!11401 array!65003) (_values!6213 array!65005) (_vacant!2871 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5632)

(declare-fun e!584151 () Bool)

(declare-fun array_inv!24227 (array!65003) Bool)

(declare-fun array_inv!24228 (array!65005) Bool)

(assert (=> b!1033669 (= e!584151 (and tp!73246 tp_is_empty!24445 (array_inv!24227 (_keys!11401 thiss!1427)) (array_inv!24228 (_values!6213 thiss!1427)) e!584149))))

(declare-fun res!690515 () Bool)

(declare-fun e!584153 () Bool)

(assert (=> start!90352 (=> (not res!690515) (not e!584153))))

(declare-fun valid!2138 (LongMapFixedSize!5632) Bool)

(assert (=> start!90352 (= res!690515 (valid!2138 thiss!1427))))

(assert (=> start!90352 e!584153))

(assert (=> start!90352 e!584151))

(assert (=> start!90352 true))

(declare-fun b!1033670 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033670 (= e!584153 (not (validMask!0 (mask!30068 thiss!1427))))))

(declare-fun b!1033671 () Bool)

(declare-fun res!690514 () Bool)

(assert (=> b!1033671 (=> (not res!690514) (not e!584153))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033671 (= res!690514 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033672 () Bool)

(declare-fun e!584150 () Bool)

(assert (=> b!1033672 (= e!584150 tp_is_empty!24445)))

(declare-fun mapNonEmpty!38121 () Bool)

(declare-fun mapRes!38121 () Bool)

(declare-fun tp!73245 () Bool)

(assert (=> mapNonEmpty!38121 (= mapRes!38121 (and tp!73245 e!584150))))

(declare-fun mapKey!38121 () (_ BitVec 32))

(declare-fun mapValue!38121 () ValueCell!11519)

(declare-fun mapRest!38121 () (Array (_ BitVec 32) ValueCell!11519))

(assert (=> mapNonEmpty!38121 (= (arr!31298 (_values!6213 thiss!1427)) (store mapRest!38121 mapKey!38121 mapValue!38121))))

(declare-fun b!1033673 () Bool)

(declare-fun e!584152 () Bool)

(assert (=> b!1033673 (= e!584152 tp_is_empty!24445)))

(declare-fun mapIsEmpty!38121 () Bool)

(assert (=> mapIsEmpty!38121 mapRes!38121))

(declare-fun b!1033674 () Bool)

(assert (=> b!1033674 (= e!584149 (and e!584152 mapRes!38121))))

(declare-fun condMapEmpty!38121 () Bool)

(declare-fun mapDefault!38121 () ValueCell!11519)

(assert (=> b!1033674 (= condMapEmpty!38121 (= (arr!31298 (_values!6213 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11519)) mapDefault!38121)))))

(assert (= (and start!90352 res!690515) b!1033671))

(assert (= (and b!1033671 res!690514) b!1033670))

(assert (= (and b!1033674 condMapEmpty!38121) mapIsEmpty!38121))

(assert (= (and b!1033674 (not condMapEmpty!38121)) mapNonEmpty!38121))

(get-info :version)

(assert (= (and mapNonEmpty!38121 ((_ is ValueCellFull!11519) mapValue!38121)) b!1033672))

(assert (= (and b!1033674 ((_ is ValueCellFull!11519) mapDefault!38121)) b!1033673))

(assert (= b!1033669 b!1033674))

(assert (= start!90352 b!1033669))

(declare-fun m!954341 () Bool)

(assert (=> b!1033669 m!954341))

(declare-fun m!954343 () Bool)

(assert (=> b!1033669 m!954343))

(declare-fun m!954345 () Bool)

(assert (=> start!90352 m!954345))

(declare-fun m!954347 () Bool)

(assert (=> b!1033670 m!954347))

(declare-fun m!954349 () Bool)

(assert (=> mapNonEmpty!38121 m!954349))

(check-sat tp_is_empty!24445 (not mapNonEmpty!38121) (not b_next!20725) (not b!1033670) (not b!1033669) (not start!90352) b_and!33203)
(check-sat b_and!33203 (not b_next!20725))
(get-model)

(declare-fun d!124133 () Bool)

(declare-fun res!690534 () Bool)

(declare-fun e!584193 () Bool)

(assert (=> d!124133 (=> (not res!690534) (not e!584193))))

(declare-fun simpleValid!397 (LongMapFixedSize!5632) Bool)

(assert (=> d!124133 (= res!690534 (simpleValid!397 thiss!1427))))

(assert (=> d!124133 (= (valid!2138 thiss!1427) e!584193)))

(declare-fun b!1033717 () Bool)

(declare-fun res!690535 () Bool)

(assert (=> b!1033717 (=> (not res!690535) (not e!584193))))

(declare-fun arrayCountValidKeys!0 (array!65003 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1033717 (= res!690535 (= (arrayCountValidKeys!0 (_keys!11401 thiss!1427) #b00000000000000000000000000000000 (size!31815 (_keys!11401 thiss!1427))) (_size!2871 thiss!1427)))))

(declare-fun b!1033718 () Bool)

(declare-fun res!690536 () Bool)

(assert (=> b!1033718 (=> (not res!690536) (not e!584193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65003 (_ BitVec 32)) Bool)

(assert (=> b!1033718 (= res!690536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11401 thiss!1427) (mask!30068 thiss!1427)))))

(declare-fun b!1033719 () Bool)

(declare-datatypes ((List!21882 0))(
  ( (Nil!21879) (Cons!21878 (h!23089 (_ BitVec 64)) (t!31068 List!21882)) )
))
(declare-fun arrayNoDuplicates!0 (array!65003 (_ BitVec 32) List!21882) Bool)

(assert (=> b!1033719 (= e!584193 (arrayNoDuplicates!0 (_keys!11401 thiss!1427) #b00000000000000000000000000000000 Nil!21879))))

(assert (= (and d!124133 res!690534) b!1033717))

(assert (= (and b!1033717 res!690535) b!1033718))

(assert (= (and b!1033718 res!690536) b!1033719))

(declare-fun m!954371 () Bool)

(assert (=> d!124133 m!954371))

(declare-fun m!954373 () Bool)

(assert (=> b!1033717 m!954373))

(declare-fun m!954375 () Bool)

(assert (=> b!1033718 m!954375))

(declare-fun m!954377 () Bool)

(assert (=> b!1033719 m!954377))

(assert (=> start!90352 d!124133))

(declare-fun d!124135 () Bool)

(assert (=> d!124135 (= (validMask!0 (mask!30068 thiss!1427)) (and (or (= (mask!30068 thiss!1427) #b00000000000000000000000000000111) (= (mask!30068 thiss!1427) #b00000000000000000000000000001111) (= (mask!30068 thiss!1427) #b00000000000000000000000000011111) (= (mask!30068 thiss!1427) #b00000000000000000000000000111111) (= (mask!30068 thiss!1427) #b00000000000000000000000001111111) (= (mask!30068 thiss!1427) #b00000000000000000000000011111111) (= (mask!30068 thiss!1427) #b00000000000000000000000111111111) (= (mask!30068 thiss!1427) #b00000000000000000000001111111111) (= (mask!30068 thiss!1427) #b00000000000000000000011111111111) (= (mask!30068 thiss!1427) #b00000000000000000000111111111111) (= (mask!30068 thiss!1427) #b00000000000000000001111111111111) (= (mask!30068 thiss!1427) #b00000000000000000011111111111111) (= (mask!30068 thiss!1427) #b00000000000000000111111111111111) (= (mask!30068 thiss!1427) #b00000000000000001111111111111111) (= (mask!30068 thiss!1427) #b00000000000000011111111111111111) (= (mask!30068 thiss!1427) #b00000000000000111111111111111111) (= (mask!30068 thiss!1427) #b00000000000001111111111111111111) (= (mask!30068 thiss!1427) #b00000000000011111111111111111111) (= (mask!30068 thiss!1427) #b00000000000111111111111111111111) (= (mask!30068 thiss!1427) #b00000000001111111111111111111111) (= (mask!30068 thiss!1427) #b00000000011111111111111111111111) (= (mask!30068 thiss!1427) #b00000000111111111111111111111111) (= (mask!30068 thiss!1427) #b00000001111111111111111111111111) (= (mask!30068 thiss!1427) #b00000011111111111111111111111111) (= (mask!30068 thiss!1427) #b00000111111111111111111111111111) (= (mask!30068 thiss!1427) #b00001111111111111111111111111111) (= (mask!30068 thiss!1427) #b00011111111111111111111111111111) (= (mask!30068 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30068 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1033670 d!124135))

(declare-fun d!124137 () Bool)

(assert (=> d!124137 (= (array_inv!24227 (_keys!11401 thiss!1427)) (bvsge (size!31815 (_keys!11401 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033669 d!124137))

(declare-fun d!124139 () Bool)

(assert (=> d!124139 (= (array_inv!24228 (_values!6213 thiss!1427)) (bvsge (size!31816 (_values!6213 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033669 d!124139))

(declare-fun condMapEmpty!38130 () Bool)

(declare-fun mapDefault!38130 () ValueCell!11519)

(assert (=> mapNonEmpty!38121 (= condMapEmpty!38130 (= mapRest!38121 ((as const (Array (_ BitVec 32) ValueCell!11519)) mapDefault!38130)))))

(declare-fun e!584199 () Bool)

(declare-fun mapRes!38130 () Bool)

(assert (=> mapNonEmpty!38121 (= tp!73245 (and e!584199 mapRes!38130))))

(declare-fun b!1033727 () Bool)

(assert (=> b!1033727 (= e!584199 tp_is_empty!24445)))

(declare-fun mapIsEmpty!38130 () Bool)

(assert (=> mapIsEmpty!38130 mapRes!38130))

(declare-fun mapNonEmpty!38130 () Bool)

(declare-fun tp!73261 () Bool)

(declare-fun e!584198 () Bool)

(assert (=> mapNonEmpty!38130 (= mapRes!38130 (and tp!73261 e!584198))))

(declare-fun mapValue!38130 () ValueCell!11519)

(declare-fun mapRest!38130 () (Array (_ BitVec 32) ValueCell!11519))

(declare-fun mapKey!38130 () (_ BitVec 32))

(assert (=> mapNonEmpty!38130 (= mapRest!38121 (store mapRest!38130 mapKey!38130 mapValue!38130))))

(declare-fun b!1033726 () Bool)

(assert (=> b!1033726 (= e!584198 tp_is_empty!24445)))

(assert (= (and mapNonEmpty!38121 condMapEmpty!38130) mapIsEmpty!38130))

(assert (= (and mapNonEmpty!38121 (not condMapEmpty!38130)) mapNonEmpty!38130))

(assert (= (and mapNonEmpty!38130 ((_ is ValueCellFull!11519) mapValue!38130)) b!1033726))

(assert (= (and mapNonEmpty!38121 ((_ is ValueCellFull!11519) mapDefault!38130)) b!1033727))

(declare-fun m!954379 () Bool)

(assert (=> mapNonEmpty!38130 m!954379))

(check-sat (not d!124133) tp_is_empty!24445 (not b_next!20725) (not b!1033718) (not b!1033719) (not b!1033717) (not mapNonEmpty!38130) b_and!33203)
(check-sat b_and!33203 (not b_next!20725))
(get-model)

(declare-fun b!1033736 () Bool)

(declare-fun e!584204 () (_ BitVec 32))

(declare-fun call!43660 () (_ BitVec 32))

(assert (=> b!1033736 (= e!584204 (bvadd #b00000000000000000000000000000001 call!43660))))

(declare-fun d!124141 () Bool)

(declare-fun lt!456547 () (_ BitVec 32))

(assert (=> d!124141 (and (bvsge lt!456547 #b00000000000000000000000000000000) (bvsle lt!456547 (bvsub (size!31815 (_keys!11401 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!584205 () (_ BitVec 32))

(assert (=> d!124141 (= lt!456547 e!584205)))

(declare-fun c!104717 () Bool)

(assert (=> d!124141 (= c!104717 (bvsge #b00000000000000000000000000000000 (size!31815 (_keys!11401 thiss!1427))))))

(assert (=> d!124141 (and (bvsle #b00000000000000000000000000000000 (size!31815 (_keys!11401 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31815 (_keys!11401 thiss!1427)) (size!31815 (_keys!11401 thiss!1427))))))

(assert (=> d!124141 (= (arrayCountValidKeys!0 (_keys!11401 thiss!1427) #b00000000000000000000000000000000 (size!31815 (_keys!11401 thiss!1427))) lt!456547)))

(declare-fun b!1033737 () Bool)

(assert (=> b!1033737 (= e!584205 #b00000000000000000000000000000000)))

(declare-fun b!1033738 () Bool)

(assert (=> b!1033738 (= e!584204 call!43660)))

(declare-fun b!1033739 () Bool)

(assert (=> b!1033739 (= e!584205 e!584204)))

(declare-fun c!104716 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1033739 (= c!104716 (validKeyInArray!0 (select (arr!31297 (_keys!11401 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43657 () Bool)

(assert (=> bm!43657 (= call!43660 (arrayCountValidKeys!0 (_keys!11401 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31815 (_keys!11401 thiss!1427))))))

(assert (= (and d!124141 c!104717) b!1033737))

(assert (= (and d!124141 (not c!104717)) b!1033739))

(assert (= (and b!1033739 c!104716) b!1033736))

(assert (= (and b!1033739 (not c!104716)) b!1033738))

(assert (= (or b!1033736 b!1033738) bm!43657))

(declare-fun m!954381 () Bool)

(assert (=> b!1033739 m!954381))

(assert (=> b!1033739 m!954381))

(declare-fun m!954383 () Bool)

(assert (=> b!1033739 m!954383))

(declare-fun m!954385 () Bool)

(assert (=> bm!43657 m!954385))

(assert (=> b!1033717 d!124141))

(declare-fun b!1033749 () Bool)

(declare-fun res!690547 () Bool)

(declare-fun e!584208 () Bool)

(assert (=> b!1033749 (=> (not res!690547) (not e!584208))))

(declare-fun size!31821 (LongMapFixedSize!5632) (_ BitVec 32))

(assert (=> b!1033749 (= res!690547 (bvsge (size!31821 thiss!1427) (_size!2871 thiss!1427)))))

(declare-fun b!1033748 () Bool)

(declare-fun res!690546 () Bool)

(assert (=> b!1033748 (=> (not res!690546) (not e!584208))))

(assert (=> b!1033748 (= res!690546 (and (= (size!31816 (_values!6213 thiss!1427)) (bvadd (mask!30068 thiss!1427) #b00000000000000000000000000000001)) (= (size!31815 (_keys!11401 thiss!1427)) (size!31816 (_values!6213 thiss!1427))) (bvsge (_size!2871 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2871 thiss!1427) (bvadd (mask!30068 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun d!124143 () Bool)

(declare-fun res!690548 () Bool)

(assert (=> d!124143 (=> (not res!690548) (not e!584208))))

(assert (=> d!124143 (= res!690548 (validMask!0 (mask!30068 thiss!1427)))))

(assert (=> d!124143 (= (simpleValid!397 thiss!1427) e!584208)))

(declare-fun b!1033751 () Bool)

(assert (=> b!1033751 (= e!584208 (and (bvsge (extraKeys!5922 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5922 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2871 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1033750 () Bool)

(declare-fun res!690545 () Bool)

(assert (=> b!1033750 (=> (not res!690545) (not e!584208))))

(assert (=> b!1033750 (= res!690545 (= (size!31821 thiss!1427) (bvadd (_size!2871 thiss!1427) (bvsdiv (bvadd (extraKeys!5922 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!124143 res!690548) b!1033748))

(assert (= (and b!1033748 res!690546) b!1033749))

(assert (= (and b!1033749 res!690547) b!1033750))

(assert (= (and b!1033750 res!690545) b!1033751))

(declare-fun m!954387 () Bool)

(assert (=> b!1033749 m!954387))

(assert (=> d!124143 m!954347))

(assert (=> b!1033750 m!954387))

(assert (=> d!124133 d!124143))

(declare-fun b!1033762 () Bool)

(declare-fun e!584218 () Bool)

(declare-fun contains!6031 (List!21882 (_ BitVec 64)) Bool)

(assert (=> b!1033762 (= e!584218 (contains!6031 Nil!21879 (select (arr!31297 (_keys!11401 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033763 () Bool)

(declare-fun e!584220 () Bool)

(declare-fun e!584219 () Bool)

(assert (=> b!1033763 (= e!584220 e!584219)))

(declare-fun c!104720 () Bool)

(assert (=> b!1033763 (= c!104720 (validKeyInArray!0 (select (arr!31297 (_keys!11401 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033764 () Bool)

(declare-fun call!43663 () Bool)

(assert (=> b!1033764 (= e!584219 call!43663)))

(declare-fun b!1033765 () Bool)

(declare-fun e!584217 () Bool)

(assert (=> b!1033765 (= e!584217 e!584220)))

(declare-fun res!690557 () Bool)

(assert (=> b!1033765 (=> (not res!690557) (not e!584220))))

(assert (=> b!1033765 (= res!690557 (not e!584218))))

(declare-fun res!690555 () Bool)

(assert (=> b!1033765 (=> (not res!690555) (not e!584218))))

(assert (=> b!1033765 (= res!690555 (validKeyInArray!0 (select (arr!31297 (_keys!11401 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033766 () Bool)

(assert (=> b!1033766 (= e!584219 call!43663)))

(declare-fun d!124145 () Bool)

(declare-fun res!690556 () Bool)

(assert (=> d!124145 (=> res!690556 e!584217)))

(assert (=> d!124145 (= res!690556 (bvsge #b00000000000000000000000000000000 (size!31815 (_keys!11401 thiss!1427))))))

(assert (=> d!124145 (= (arrayNoDuplicates!0 (_keys!11401 thiss!1427) #b00000000000000000000000000000000 Nil!21879) e!584217)))

(declare-fun bm!43660 () Bool)

(assert (=> bm!43660 (= call!43663 (arrayNoDuplicates!0 (_keys!11401 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104720 (Cons!21878 (select (arr!31297 (_keys!11401 thiss!1427)) #b00000000000000000000000000000000) Nil!21879) Nil!21879)))))

(assert (= (and d!124145 (not res!690556)) b!1033765))

(assert (= (and b!1033765 res!690555) b!1033762))

(assert (= (and b!1033765 res!690557) b!1033763))

(assert (= (and b!1033763 c!104720) b!1033766))

(assert (= (and b!1033763 (not c!104720)) b!1033764))

(assert (= (or b!1033766 b!1033764) bm!43660))

(assert (=> b!1033762 m!954381))

(assert (=> b!1033762 m!954381))

(declare-fun m!954389 () Bool)

(assert (=> b!1033762 m!954389))

(assert (=> b!1033763 m!954381))

(assert (=> b!1033763 m!954381))

(assert (=> b!1033763 m!954383))

(assert (=> b!1033765 m!954381))

(assert (=> b!1033765 m!954381))

(assert (=> b!1033765 m!954383))

(assert (=> bm!43660 m!954381))

(declare-fun m!954391 () Bool)

(assert (=> bm!43660 m!954391))

(assert (=> b!1033719 d!124145))

(declare-fun d!124147 () Bool)

(declare-fun res!690562 () Bool)

(declare-fun e!584229 () Bool)

(assert (=> d!124147 (=> res!690562 e!584229)))

(assert (=> d!124147 (= res!690562 (bvsge #b00000000000000000000000000000000 (size!31815 (_keys!11401 thiss!1427))))))

(assert (=> d!124147 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11401 thiss!1427) (mask!30068 thiss!1427)) e!584229)))

(declare-fun b!1033775 () Bool)

(declare-fun e!584227 () Bool)

(declare-fun call!43666 () Bool)

(assert (=> b!1033775 (= e!584227 call!43666)))

(declare-fun bm!43663 () Bool)

(assert (=> bm!43663 (= call!43666 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11401 thiss!1427) (mask!30068 thiss!1427)))))

(declare-fun b!1033776 () Bool)

(assert (=> b!1033776 (= e!584229 e!584227)))

(declare-fun c!104723 () Bool)

(assert (=> b!1033776 (= c!104723 (validKeyInArray!0 (select (arr!31297 (_keys!11401 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033777 () Bool)

(declare-fun e!584228 () Bool)

(assert (=> b!1033777 (= e!584227 e!584228)))

(declare-fun lt!456555 () (_ BitVec 64))

(assert (=> b!1033777 (= lt!456555 (select (arr!31297 (_keys!11401 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33823 0))(
  ( (Unit!33824) )
))
(declare-fun lt!456556 () Unit!33823)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65003 (_ BitVec 64) (_ BitVec 32)) Unit!33823)

(assert (=> b!1033777 (= lt!456556 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11401 thiss!1427) lt!456555 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1033777 (arrayContainsKey!0 (_keys!11401 thiss!1427) lt!456555 #b00000000000000000000000000000000)))

(declare-fun lt!456554 () Unit!33823)

(assert (=> b!1033777 (= lt!456554 lt!456556)))

(declare-fun res!690563 () Bool)

(declare-datatypes ((SeekEntryResult!9688 0))(
  ( (MissingZero!9688 (index!41123 (_ BitVec 32))) (Found!9688 (index!41124 (_ BitVec 32))) (Intermediate!9688 (undefined!10500 Bool) (index!41125 (_ BitVec 32)) (x!91988 (_ BitVec 32))) (Undefined!9688) (MissingVacant!9688 (index!41126 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65003 (_ BitVec 32)) SeekEntryResult!9688)

(assert (=> b!1033777 (= res!690563 (= (seekEntryOrOpen!0 (select (arr!31297 (_keys!11401 thiss!1427)) #b00000000000000000000000000000000) (_keys!11401 thiss!1427) (mask!30068 thiss!1427)) (Found!9688 #b00000000000000000000000000000000)))))

(assert (=> b!1033777 (=> (not res!690563) (not e!584228))))

(declare-fun b!1033778 () Bool)

(assert (=> b!1033778 (= e!584228 call!43666)))

(assert (= (and d!124147 (not res!690562)) b!1033776))

(assert (= (and b!1033776 c!104723) b!1033777))

(assert (= (and b!1033776 (not c!104723)) b!1033775))

(assert (= (and b!1033777 res!690563) b!1033778))

(assert (= (or b!1033778 b!1033775) bm!43663))

(declare-fun m!954393 () Bool)

(assert (=> bm!43663 m!954393))

(assert (=> b!1033776 m!954381))

(assert (=> b!1033776 m!954381))

(assert (=> b!1033776 m!954383))

(assert (=> b!1033777 m!954381))

(declare-fun m!954395 () Bool)

(assert (=> b!1033777 m!954395))

(declare-fun m!954397 () Bool)

(assert (=> b!1033777 m!954397))

(assert (=> b!1033777 m!954381))

(declare-fun m!954399 () Bool)

(assert (=> b!1033777 m!954399))

(assert (=> b!1033718 d!124147))

(declare-fun condMapEmpty!38131 () Bool)

(declare-fun mapDefault!38131 () ValueCell!11519)

(assert (=> mapNonEmpty!38130 (= condMapEmpty!38131 (= mapRest!38130 ((as const (Array (_ BitVec 32) ValueCell!11519)) mapDefault!38131)))))

(declare-fun e!584231 () Bool)

(declare-fun mapRes!38131 () Bool)

(assert (=> mapNonEmpty!38130 (= tp!73261 (and e!584231 mapRes!38131))))

(declare-fun b!1033780 () Bool)

(assert (=> b!1033780 (= e!584231 tp_is_empty!24445)))

(declare-fun mapIsEmpty!38131 () Bool)

(assert (=> mapIsEmpty!38131 mapRes!38131))

(declare-fun mapNonEmpty!38131 () Bool)

(declare-fun tp!73262 () Bool)

(declare-fun e!584230 () Bool)

(assert (=> mapNonEmpty!38131 (= mapRes!38131 (and tp!73262 e!584230))))

(declare-fun mapKey!38131 () (_ BitVec 32))

(declare-fun mapValue!38131 () ValueCell!11519)

(declare-fun mapRest!38131 () (Array (_ BitVec 32) ValueCell!11519))

(assert (=> mapNonEmpty!38131 (= mapRest!38130 (store mapRest!38131 mapKey!38131 mapValue!38131))))

(declare-fun b!1033779 () Bool)

(assert (=> b!1033779 (= e!584230 tp_is_empty!24445)))

(assert (= (and mapNonEmpty!38130 condMapEmpty!38131) mapIsEmpty!38131))

(assert (= (and mapNonEmpty!38130 (not condMapEmpty!38131)) mapNonEmpty!38131))

(assert (= (and mapNonEmpty!38131 ((_ is ValueCellFull!11519) mapValue!38131)) b!1033779))

(assert (= (and mapNonEmpty!38130 ((_ is ValueCellFull!11519) mapDefault!38131)) b!1033780))

(declare-fun m!954401 () Bool)

(assert (=> mapNonEmpty!38131 m!954401))

(check-sat (not b!1033763) tp_is_empty!24445 (not d!124143) (not bm!43660) (not mapNonEmpty!38131) (not b!1033776) (not b!1033762) (not b_next!20725) (not bm!43657) (not b!1033750) (not b!1033749) (not b!1033739) (not b!1033777) (not bm!43663) (not b!1033765) b_and!33203)
(check-sat b_and!33203 (not b_next!20725))
