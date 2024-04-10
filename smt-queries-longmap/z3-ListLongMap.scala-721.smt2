; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16848 () Bool)

(assert start!16848)

(declare-fun b!169791 () Bool)

(declare-fun b_free!4167 () Bool)

(declare-fun b_next!4167 () Bool)

(assert (=> b!169791 (= b_free!4167 (not b_next!4167))))

(declare-fun tp!15105 () Bool)

(declare-fun b_and!10581 () Bool)

(assert (=> b!169791 (= tp!15105 b_and!10581)))

(declare-fun mapNonEmpty!6676 () Bool)

(declare-fun mapRes!6676 () Bool)

(declare-fun tp!15106 () Bool)

(declare-fun e!111987 () Bool)

(assert (=> mapNonEmpty!6676 (= mapRes!6676 (and tp!15106 e!111987))))

(declare-datatypes ((V!4899 0))(
  ( (V!4900 (val!2014 Int)) )
))
(declare-datatypes ((ValueCell!1626 0))(
  ( (ValueCellFull!1626 (v!3879 V!4899)) (EmptyCell!1626) )
))
(declare-fun mapRest!6676 () (Array (_ BitVec 32) ValueCell!1626))

(declare-fun mapValue!6676 () ValueCell!1626)

(declare-fun mapKey!6676 () (_ BitVec 32))

(declare-datatypes ((array!6977 0))(
  ( (array!6978 (arr!3323 (Array (_ BitVec 32) (_ BitVec 64))) (size!3612 (_ BitVec 32))) )
))
(declare-datatypes ((array!6979 0))(
  ( (array!6980 (arr!3324 (Array (_ BitVec 32) ValueCell!1626)) (size!3613 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2160 0))(
  ( (LongMapFixedSize!2161 (defaultEntry!3522 Int) (mask!8315 (_ BitVec 32)) (extraKeys!3263 (_ BitVec 32)) (zeroValue!3365 V!4899) (minValue!3365 V!4899) (_size!1129 (_ BitVec 32)) (_keys!5348 array!6977) (_values!3505 array!6979) (_vacant!1129 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2160)

(assert (=> mapNonEmpty!6676 (= (arr!3324 (_values!3505 thiss!1248)) (store mapRest!6676 mapKey!6676 mapValue!6676))))

(declare-fun b!169789 () Bool)

(declare-fun e!111986 () Bool)

(assert (=> b!169789 (= e!111986 (not (= (size!3613 (_values!3505 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8315 thiss!1248)))))))

(declare-fun b!169790 () Bool)

(declare-fun e!111989 () Bool)

(declare-fun e!111990 () Bool)

(assert (=> b!169790 (= e!111989 (and e!111990 mapRes!6676))))

(declare-fun condMapEmpty!6676 () Bool)

(declare-fun mapDefault!6676 () ValueCell!1626)

(assert (=> b!169790 (= condMapEmpty!6676 (= (arr!3324 (_values!3505 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1626)) mapDefault!6676)))))

(declare-fun mapIsEmpty!6676 () Bool)

(assert (=> mapIsEmpty!6676 mapRes!6676))

(declare-fun e!111991 () Bool)

(declare-fun tp_is_empty!3939 () Bool)

(declare-fun array_inv!2131 (array!6977) Bool)

(declare-fun array_inv!2132 (array!6979) Bool)

(assert (=> b!169791 (= e!111991 (and tp!15105 tp_is_empty!3939 (array_inv!2131 (_keys!5348 thiss!1248)) (array_inv!2132 (_values!3505 thiss!1248)) e!111989))))

(declare-fun res!80719 () Bool)

(assert (=> start!16848 (=> (not res!80719) (not e!111986))))

(declare-fun valid!928 (LongMapFixedSize!2160) Bool)

(assert (=> start!16848 (= res!80719 (valid!928 thiss!1248))))

(assert (=> start!16848 e!111986))

(assert (=> start!16848 e!111991))

(assert (=> start!16848 true))

(declare-fun b!169792 () Bool)

(declare-fun res!80720 () Bool)

(assert (=> b!169792 (=> (not res!80720) (not e!111986))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169792 (= res!80720 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!169793 () Bool)

(assert (=> b!169793 (= e!111987 tp_is_empty!3939)))

(declare-fun b!169794 () Bool)

(declare-fun res!80721 () Bool)

(assert (=> b!169794 (=> (not res!80721) (not e!111986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!169794 (= res!80721 (validMask!0 (mask!8315 thiss!1248)))))

(declare-fun b!169795 () Bool)

(assert (=> b!169795 (= e!111990 tp_is_empty!3939)))

(assert (= (and start!16848 res!80719) b!169792))

(assert (= (and b!169792 res!80720) b!169794))

(assert (= (and b!169794 res!80721) b!169789))

(assert (= (and b!169790 condMapEmpty!6676) mapIsEmpty!6676))

(assert (= (and b!169790 (not condMapEmpty!6676)) mapNonEmpty!6676))

(get-info :version)

(assert (= (and mapNonEmpty!6676 ((_ is ValueCellFull!1626) mapValue!6676)) b!169793))

(assert (= (and b!169790 ((_ is ValueCellFull!1626) mapDefault!6676)) b!169795))

(assert (= b!169791 b!169790))

(assert (= start!16848 b!169791))

(declare-fun m!198645 () Bool)

(assert (=> mapNonEmpty!6676 m!198645))

(declare-fun m!198647 () Bool)

(assert (=> b!169791 m!198647))

(declare-fun m!198649 () Bool)

(assert (=> b!169791 m!198649))

(declare-fun m!198651 () Bool)

(assert (=> start!16848 m!198651))

(declare-fun m!198653 () Bool)

(assert (=> b!169794 m!198653))

(check-sat (not b!169794) (not mapNonEmpty!6676) b_and!10581 (not b!169791) (not b_next!4167) (not start!16848) tp_is_empty!3939)
(check-sat b_and!10581 (not b_next!4167))
(get-model)

(declare-fun d!51651 () Bool)

(assert (=> d!51651 (= (array_inv!2131 (_keys!5348 thiss!1248)) (bvsge (size!3612 (_keys!5348 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169791 d!51651))

(declare-fun d!51653 () Bool)

(assert (=> d!51653 (= (array_inv!2132 (_values!3505 thiss!1248)) (bvsge (size!3613 (_values!3505 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169791 d!51653))

(declare-fun d!51655 () Bool)

(declare-fun res!80737 () Bool)

(declare-fun e!112012 () Bool)

(assert (=> d!51655 (=> (not res!80737) (not e!112012))))

(declare-fun simpleValid!128 (LongMapFixedSize!2160) Bool)

(assert (=> d!51655 (= res!80737 (simpleValid!128 thiss!1248))))

(assert (=> d!51655 (= (valid!928 thiss!1248) e!112012)))

(declare-fun b!169823 () Bool)

(declare-fun res!80738 () Bool)

(assert (=> b!169823 (=> (not res!80738) (not e!112012))))

(declare-fun arrayCountValidKeys!0 (array!6977 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!169823 (= res!80738 (= (arrayCountValidKeys!0 (_keys!5348 thiss!1248) #b00000000000000000000000000000000 (size!3612 (_keys!5348 thiss!1248))) (_size!1129 thiss!1248)))))

(declare-fun b!169824 () Bool)

(declare-fun res!80739 () Bool)

(assert (=> b!169824 (=> (not res!80739) (not e!112012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6977 (_ BitVec 32)) Bool)

(assert (=> b!169824 (= res!80739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5348 thiss!1248) (mask!8315 thiss!1248)))))

(declare-fun b!169825 () Bool)

(declare-datatypes ((List!2184 0))(
  ( (Nil!2181) (Cons!2180 (h!2797 (_ BitVec 64)) (t!6986 List!2184)) )
))
(declare-fun arrayNoDuplicates!0 (array!6977 (_ BitVec 32) List!2184) Bool)

(assert (=> b!169825 (= e!112012 (arrayNoDuplicates!0 (_keys!5348 thiss!1248) #b00000000000000000000000000000000 Nil!2181))))

(assert (= (and d!51655 res!80737) b!169823))

(assert (= (and b!169823 res!80738) b!169824))

(assert (= (and b!169824 res!80739) b!169825))

(declare-fun m!198665 () Bool)

(assert (=> d!51655 m!198665))

(declare-fun m!198667 () Bool)

(assert (=> b!169823 m!198667))

(declare-fun m!198669 () Bool)

(assert (=> b!169824 m!198669))

(declare-fun m!198671 () Bool)

(assert (=> b!169825 m!198671))

(assert (=> start!16848 d!51655))

(declare-fun d!51657 () Bool)

(assert (=> d!51657 (= (validMask!0 (mask!8315 thiss!1248)) (and (or (= (mask!8315 thiss!1248) #b00000000000000000000000000000111) (= (mask!8315 thiss!1248) #b00000000000000000000000000001111) (= (mask!8315 thiss!1248) #b00000000000000000000000000011111) (= (mask!8315 thiss!1248) #b00000000000000000000000000111111) (= (mask!8315 thiss!1248) #b00000000000000000000000001111111) (= (mask!8315 thiss!1248) #b00000000000000000000000011111111) (= (mask!8315 thiss!1248) #b00000000000000000000000111111111) (= (mask!8315 thiss!1248) #b00000000000000000000001111111111) (= (mask!8315 thiss!1248) #b00000000000000000000011111111111) (= (mask!8315 thiss!1248) #b00000000000000000000111111111111) (= (mask!8315 thiss!1248) #b00000000000000000001111111111111) (= (mask!8315 thiss!1248) #b00000000000000000011111111111111) (= (mask!8315 thiss!1248) #b00000000000000000111111111111111) (= (mask!8315 thiss!1248) #b00000000000000001111111111111111) (= (mask!8315 thiss!1248) #b00000000000000011111111111111111) (= (mask!8315 thiss!1248) #b00000000000000111111111111111111) (= (mask!8315 thiss!1248) #b00000000000001111111111111111111) (= (mask!8315 thiss!1248) #b00000000000011111111111111111111) (= (mask!8315 thiss!1248) #b00000000000111111111111111111111) (= (mask!8315 thiss!1248) #b00000000001111111111111111111111) (= (mask!8315 thiss!1248) #b00000000011111111111111111111111) (= (mask!8315 thiss!1248) #b00000000111111111111111111111111) (= (mask!8315 thiss!1248) #b00000001111111111111111111111111) (= (mask!8315 thiss!1248) #b00000011111111111111111111111111) (= (mask!8315 thiss!1248) #b00000111111111111111111111111111) (= (mask!8315 thiss!1248) #b00001111111111111111111111111111) (= (mask!8315 thiss!1248) #b00011111111111111111111111111111) (= (mask!8315 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8315 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!169794 d!51657))

(declare-fun condMapEmpty!6682 () Bool)

(declare-fun mapDefault!6682 () ValueCell!1626)

(assert (=> mapNonEmpty!6676 (= condMapEmpty!6682 (= mapRest!6676 ((as const (Array (_ BitVec 32) ValueCell!1626)) mapDefault!6682)))))

(declare-fun e!112017 () Bool)

(declare-fun mapRes!6682 () Bool)

(assert (=> mapNonEmpty!6676 (= tp!15106 (and e!112017 mapRes!6682))))

(declare-fun b!169832 () Bool)

(declare-fun e!112018 () Bool)

(assert (=> b!169832 (= e!112018 tp_is_empty!3939)))

(declare-fun mapNonEmpty!6682 () Bool)

(declare-fun tp!15115 () Bool)

(assert (=> mapNonEmpty!6682 (= mapRes!6682 (and tp!15115 e!112018))))

(declare-fun mapValue!6682 () ValueCell!1626)

(declare-fun mapKey!6682 () (_ BitVec 32))

(declare-fun mapRest!6682 () (Array (_ BitVec 32) ValueCell!1626))

(assert (=> mapNonEmpty!6682 (= mapRest!6676 (store mapRest!6682 mapKey!6682 mapValue!6682))))

(declare-fun mapIsEmpty!6682 () Bool)

(assert (=> mapIsEmpty!6682 mapRes!6682))

(declare-fun b!169833 () Bool)

(assert (=> b!169833 (= e!112017 tp_is_empty!3939)))

(assert (= (and mapNonEmpty!6676 condMapEmpty!6682) mapIsEmpty!6682))

(assert (= (and mapNonEmpty!6676 (not condMapEmpty!6682)) mapNonEmpty!6682))

(assert (= (and mapNonEmpty!6682 ((_ is ValueCellFull!1626) mapValue!6682)) b!169832))

(assert (= (and mapNonEmpty!6676 ((_ is ValueCellFull!1626) mapDefault!6682)) b!169833))

(declare-fun m!198673 () Bool)

(assert (=> mapNonEmpty!6682 m!198673))

(check-sat (not b!169823) b_and!10581 (not mapNonEmpty!6682) (not b_next!4167) (not d!51655) (not b!169825) (not b!169824) tp_is_empty!3939)
(check-sat b_and!10581 (not b_next!4167))
(get-model)

(declare-fun b!169842 () Bool)

(declare-fun e!112024 () (_ BitVec 32))

(assert (=> b!169842 (= e!112024 #b00000000000000000000000000000000)))

(declare-fun d!51659 () Bool)

(declare-fun lt!84964 () (_ BitVec 32))

(assert (=> d!51659 (and (bvsge lt!84964 #b00000000000000000000000000000000) (bvsle lt!84964 (bvsub (size!3612 (_keys!5348 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51659 (= lt!84964 e!112024)))

(declare-fun c!30444 () Bool)

(assert (=> d!51659 (= c!30444 (bvsge #b00000000000000000000000000000000 (size!3612 (_keys!5348 thiss!1248))))))

(assert (=> d!51659 (and (bvsle #b00000000000000000000000000000000 (size!3612 (_keys!5348 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3612 (_keys!5348 thiss!1248)) (size!3612 (_keys!5348 thiss!1248))))))

(assert (=> d!51659 (= (arrayCountValidKeys!0 (_keys!5348 thiss!1248) #b00000000000000000000000000000000 (size!3612 (_keys!5348 thiss!1248))) lt!84964)))

(declare-fun bm!17344 () Bool)

(declare-fun call!17347 () (_ BitVec 32))

(assert (=> bm!17344 (= call!17347 (arrayCountValidKeys!0 (_keys!5348 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3612 (_keys!5348 thiss!1248))))))

(declare-fun b!169843 () Bool)

(declare-fun e!112023 () (_ BitVec 32))

(assert (=> b!169843 (= e!112023 call!17347)))

(declare-fun b!169844 () Bool)

(assert (=> b!169844 (= e!112024 e!112023)))

(declare-fun c!30445 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!169844 (= c!30445 (validKeyInArray!0 (select (arr!3323 (_keys!5348 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169845 () Bool)

(assert (=> b!169845 (= e!112023 (bvadd #b00000000000000000000000000000001 call!17347))))

(assert (= (and d!51659 c!30444) b!169842))

(assert (= (and d!51659 (not c!30444)) b!169844))

(assert (= (and b!169844 c!30445) b!169845))

(assert (= (and b!169844 (not c!30445)) b!169843))

(assert (= (or b!169845 b!169843) bm!17344))

(declare-fun m!198675 () Bool)

(assert (=> bm!17344 m!198675))

(declare-fun m!198677 () Bool)

(assert (=> b!169844 m!198677))

(assert (=> b!169844 m!198677))

(declare-fun m!198679 () Bool)

(assert (=> b!169844 m!198679))

(assert (=> b!169823 d!51659))

(declare-fun b!169855 () Bool)

(declare-fun res!80750 () Bool)

(declare-fun e!112027 () Bool)

(assert (=> b!169855 (=> (not res!80750) (not e!112027))))

(declare-fun size!3616 (LongMapFixedSize!2160) (_ BitVec 32))

(assert (=> b!169855 (= res!80750 (bvsge (size!3616 thiss!1248) (_size!1129 thiss!1248)))))

(declare-fun b!169856 () Bool)

(declare-fun res!80751 () Bool)

(assert (=> b!169856 (=> (not res!80751) (not e!112027))))

(assert (=> b!169856 (= res!80751 (= (size!3616 thiss!1248) (bvadd (_size!1129 thiss!1248) (bvsdiv (bvadd (extraKeys!3263 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!169857 () Bool)

(assert (=> b!169857 (= e!112027 (and (bvsge (extraKeys!3263 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3263 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1129 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!169854 () Bool)

(declare-fun res!80749 () Bool)

(assert (=> b!169854 (=> (not res!80749) (not e!112027))))

(assert (=> b!169854 (= res!80749 (and (= (size!3613 (_values!3505 thiss!1248)) (bvadd (mask!8315 thiss!1248) #b00000000000000000000000000000001)) (= (size!3612 (_keys!5348 thiss!1248)) (size!3613 (_values!3505 thiss!1248))) (bvsge (_size!1129 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1129 thiss!1248) (bvadd (mask!8315 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!51661 () Bool)

(declare-fun res!80748 () Bool)

(assert (=> d!51661 (=> (not res!80748) (not e!112027))))

(assert (=> d!51661 (= res!80748 (validMask!0 (mask!8315 thiss!1248)))))

(assert (=> d!51661 (= (simpleValid!128 thiss!1248) e!112027)))

(assert (= (and d!51661 res!80748) b!169854))

(assert (= (and b!169854 res!80749) b!169855))

(assert (= (and b!169855 res!80750) b!169856))

(assert (= (and b!169856 res!80751) b!169857))

(declare-fun m!198681 () Bool)

(assert (=> b!169855 m!198681))

(assert (=> b!169856 m!198681))

(assert (=> d!51661 m!198653))

(assert (=> d!51655 d!51661))

(declare-fun b!169868 () Bool)

(declare-fun e!112037 () Bool)

(declare-fun contains!1138 (List!2184 (_ BitVec 64)) Bool)

(assert (=> b!169868 (= e!112037 (contains!1138 Nil!2181 (select (arr!3323 (_keys!5348 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169869 () Bool)

(declare-fun e!112036 () Bool)

(declare-fun e!112038 () Bool)

(assert (=> b!169869 (= e!112036 e!112038)))

(declare-fun res!80758 () Bool)

(assert (=> b!169869 (=> (not res!80758) (not e!112038))))

(assert (=> b!169869 (= res!80758 (not e!112037))))

(declare-fun res!80760 () Bool)

(assert (=> b!169869 (=> (not res!80760) (not e!112037))))

(assert (=> b!169869 (= res!80760 (validKeyInArray!0 (select (arr!3323 (_keys!5348 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169870 () Bool)

(declare-fun e!112039 () Bool)

(declare-fun call!17350 () Bool)

(assert (=> b!169870 (= e!112039 call!17350)))

(declare-fun b!169871 () Bool)

(assert (=> b!169871 (= e!112039 call!17350)))

(declare-fun bm!17347 () Bool)

(declare-fun c!30448 () Bool)

(assert (=> bm!17347 (= call!17350 (arrayNoDuplicates!0 (_keys!5348 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30448 (Cons!2180 (select (arr!3323 (_keys!5348 thiss!1248)) #b00000000000000000000000000000000) Nil!2181) Nil!2181)))))

(declare-fun d!51663 () Bool)

(declare-fun res!80759 () Bool)

(assert (=> d!51663 (=> res!80759 e!112036)))

(assert (=> d!51663 (= res!80759 (bvsge #b00000000000000000000000000000000 (size!3612 (_keys!5348 thiss!1248))))))

(assert (=> d!51663 (= (arrayNoDuplicates!0 (_keys!5348 thiss!1248) #b00000000000000000000000000000000 Nil!2181) e!112036)))

(declare-fun b!169872 () Bool)

(assert (=> b!169872 (= e!112038 e!112039)))

(assert (=> b!169872 (= c!30448 (validKeyInArray!0 (select (arr!3323 (_keys!5348 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51663 (not res!80759)) b!169869))

(assert (= (and b!169869 res!80760) b!169868))

(assert (= (and b!169869 res!80758) b!169872))

(assert (= (and b!169872 c!30448) b!169871))

(assert (= (and b!169872 (not c!30448)) b!169870))

(assert (= (or b!169871 b!169870) bm!17347))

(assert (=> b!169868 m!198677))

(assert (=> b!169868 m!198677))

(declare-fun m!198683 () Bool)

(assert (=> b!169868 m!198683))

(assert (=> b!169869 m!198677))

(assert (=> b!169869 m!198677))

(assert (=> b!169869 m!198679))

(assert (=> bm!17347 m!198677))

(declare-fun m!198685 () Bool)

(assert (=> bm!17347 m!198685))

(assert (=> b!169872 m!198677))

(assert (=> b!169872 m!198677))

(assert (=> b!169872 m!198679))

(assert (=> b!169825 d!51663))

(declare-fun b!169881 () Bool)

(declare-fun e!112048 () Bool)

(declare-fun call!17353 () Bool)

(assert (=> b!169881 (= e!112048 call!17353)))

(declare-fun b!169882 () Bool)

(declare-fun e!112047 () Bool)

(assert (=> b!169882 (= e!112047 e!112048)))

(declare-fun c!30451 () Bool)

(assert (=> b!169882 (= c!30451 (validKeyInArray!0 (select (arr!3323 (_keys!5348 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169883 () Bool)

(declare-fun e!112046 () Bool)

(assert (=> b!169883 (= e!112048 e!112046)))

(declare-fun lt!84972 () (_ BitVec 64))

(assert (=> b!169883 (= lt!84972 (select (arr!3323 (_keys!5348 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5238 0))(
  ( (Unit!5239) )
))
(declare-fun lt!84971 () Unit!5238)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6977 (_ BitVec 64) (_ BitVec 32)) Unit!5238)

(assert (=> b!169883 (= lt!84971 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5348 thiss!1248) lt!84972 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!169883 (arrayContainsKey!0 (_keys!5348 thiss!1248) lt!84972 #b00000000000000000000000000000000)))

(declare-fun lt!84973 () Unit!5238)

(assert (=> b!169883 (= lt!84973 lt!84971)))

(declare-fun res!80766 () Bool)

(declare-datatypes ((SeekEntryResult!528 0))(
  ( (MissingZero!528 (index!4280 (_ BitVec 32))) (Found!528 (index!4281 (_ BitVec 32))) (Intermediate!528 (undefined!1340 Bool) (index!4282 (_ BitVec 32)) (x!18776 (_ BitVec 32))) (Undefined!528) (MissingVacant!528 (index!4283 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6977 (_ BitVec 32)) SeekEntryResult!528)

(assert (=> b!169883 (= res!80766 (= (seekEntryOrOpen!0 (select (arr!3323 (_keys!5348 thiss!1248)) #b00000000000000000000000000000000) (_keys!5348 thiss!1248) (mask!8315 thiss!1248)) (Found!528 #b00000000000000000000000000000000)))))

(assert (=> b!169883 (=> (not res!80766) (not e!112046))))

(declare-fun b!169884 () Bool)

(assert (=> b!169884 (= e!112046 call!17353)))

(declare-fun d!51665 () Bool)

(declare-fun res!80765 () Bool)

(assert (=> d!51665 (=> res!80765 e!112047)))

(assert (=> d!51665 (= res!80765 (bvsge #b00000000000000000000000000000000 (size!3612 (_keys!5348 thiss!1248))))))

(assert (=> d!51665 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5348 thiss!1248) (mask!8315 thiss!1248)) e!112047)))

(declare-fun bm!17350 () Bool)

(assert (=> bm!17350 (= call!17353 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5348 thiss!1248) (mask!8315 thiss!1248)))))

(assert (= (and d!51665 (not res!80765)) b!169882))

(assert (= (and b!169882 c!30451) b!169883))

(assert (= (and b!169882 (not c!30451)) b!169881))

(assert (= (and b!169883 res!80766) b!169884))

(assert (= (or b!169884 b!169881) bm!17350))

(assert (=> b!169882 m!198677))

(assert (=> b!169882 m!198677))

(assert (=> b!169882 m!198679))

(assert (=> b!169883 m!198677))

(declare-fun m!198687 () Bool)

(assert (=> b!169883 m!198687))

(declare-fun m!198689 () Bool)

(assert (=> b!169883 m!198689))

(assert (=> b!169883 m!198677))

(declare-fun m!198691 () Bool)

(assert (=> b!169883 m!198691))

(declare-fun m!198693 () Bool)

(assert (=> bm!17350 m!198693))

(assert (=> b!169824 d!51665))

(declare-fun condMapEmpty!6683 () Bool)

(declare-fun mapDefault!6683 () ValueCell!1626)

(assert (=> mapNonEmpty!6682 (= condMapEmpty!6683 (= mapRest!6682 ((as const (Array (_ BitVec 32) ValueCell!1626)) mapDefault!6683)))))

(declare-fun e!112049 () Bool)

(declare-fun mapRes!6683 () Bool)

(assert (=> mapNonEmpty!6682 (= tp!15115 (and e!112049 mapRes!6683))))

(declare-fun b!169885 () Bool)

(declare-fun e!112050 () Bool)

(assert (=> b!169885 (= e!112050 tp_is_empty!3939)))

(declare-fun mapNonEmpty!6683 () Bool)

(declare-fun tp!15116 () Bool)

(assert (=> mapNonEmpty!6683 (= mapRes!6683 (and tp!15116 e!112050))))

(declare-fun mapKey!6683 () (_ BitVec 32))

(declare-fun mapValue!6683 () ValueCell!1626)

(declare-fun mapRest!6683 () (Array (_ BitVec 32) ValueCell!1626))

(assert (=> mapNonEmpty!6683 (= mapRest!6682 (store mapRest!6683 mapKey!6683 mapValue!6683))))

(declare-fun mapIsEmpty!6683 () Bool)

(assert (=> mapIsEmpty!6683 mapRes!6683))

(declare-fun b!169886 () Bool)

(assert (=> b!169886 (= e!112049 tp_is_empty!3939)))

(assert (= (and mapNonEmpty!6682 condMapEmpty!6683) mapIsEmpty!6683))

(assert (= (and mapNonEmpty!6682 (not condMapEmpty!6683)) mapNonEmpty!6683))

(assert (= (and mapNonEmpty!6683 ((_ is ValueCellFull!1626) mapValue!6683)) b!169885))

(assert (= (and mapNonEmpty!6682 ((_ is ValueCellFull!1626) mapDefault!6683)) b!169886))

(declare-fun m!198695 () Bool)

(assert (=> mapNonEmpty!6683 m!198695))

(check-sat (not mapNonEmpty!6683) (not b!169882) (not bm!17350) (not bm!17347) (not b!169868) (not b!169855) tp_is_empty!3939 (not bm!17344) (not b!169844) b_and!10581 (not b!169856) (not b!169872) (not d!51661) (not b!169883) (not b_next!4167) (not b!169869))
(check-sat b_and!10581 (not b_next!4167))
