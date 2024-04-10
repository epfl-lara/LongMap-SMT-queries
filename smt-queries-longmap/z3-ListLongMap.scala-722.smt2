; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16870 () Bool)

(assert start!16870)

(declare-fun b!169926 () Bool)

(declare-fun b_free!4173 () Bool)

(declare-fun b_next!4173 () Bool)

(assert (=> b!169926 (= b_free!4173 (not b_next!4173))))

(declare-fun tp!15127 () Bool)

(declare-fun b_and!10587 () Bool)

(assert (=> b!169926 (= tp!15127 b_and!10587)))

(declare-fun b!169922 () Bool)

(declare-fun e!112081 () Bool)

(declare-fun tp_is_empty!3945 () Bool)

(assert (=> b!169922 (= e!112081 tp_is_empty!3945)))

(declare-fun res!80782 () Bool)

(declare-fun e!112084 () Bool)

(assert (=> start!16870 (=> (not res!80782) (not e!112084))))

(declare-datatypes ((V!4907 0))(
  ( (V!4908 (val!2017 Int)) )
))
(declare-datatypes ((ValueCell!1629 0))(
  ( (ValueCellFull!1629 (v!3882 V!4907)) (EmptyCell!1629) )
))
(declare-datatypes ((array!6991 0))(
  ( (array!6992 (arr!3329 (Array (_ BitVec 32) (_ BitVec 64))) (size!3619 (_ BitVec 32))) )
))
(declare-datatypes ((array!6993 0))(
  ( (array!6994 (arr!3330 (Array (_ BitVec 32) ValueCell!1629)) (size!3620 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2166 0))(
  ( (LongMapFixedSize!2167 (defaultEntry!3525 Int) (mask!8322 (_ BitVec 32)) (extraKeys!3266 (_ BitVec 32)) (zeroValue!3368 V!4907) (minValue!3368 V!4907) (_size!1132 (_ BitVec 32)) (_keys!5352 array!6991) (_values!3508 array!6993) (_vacant!1132 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2166)

(declare-fun valid!931 (LongMapFixedSize!2166) Bool)

(assert (=> start!16870 (= res!80782 (valid!931 thiss!1248))))

(assert (=> start!16870 e!112084))

(declare-fun e!112085 () Bool)

(assert (=> start!16870 e!112085))

(assert (=> start!16870 true))

(declare-fun b!169923 () Bool)

(declare-fun res!80784 () Bool)

(assert (=> b!169923 (=> (not res!80784) (not e!112084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!169923 (= res!80784 (validMask!0 (mask!8322 thiss!1248)))))

(declare-fun b!169924 () Bool)

(declare-fun e!112086 () Bool)

(declare-fun mapRes!6689 () Bool)

(assert (=> b!169924 (= e!112086 (and e!112081 mapRes!6689))))

(declare-fun condMapEmpty!6689 () Bool)

(declare-fun mapDefault!6689 () ValueCell!1629)

(assert (=> b!169924 (= condMapEmpty!6689 (= (arr!3330 (_values!3508 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1629)) mapDefault!6689)))))

(declare-fun b!169925 () Bool)

(declare-fun res!80783 () Bool)

(assert (=> b!169925 (=> (not res!80783) (not e!112084))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169925 (= res!80783 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun array_inv!2135 (array!6991) Bool)

(declare-fun array_inv!2136 (array!6993) Bool)

(assert (=> b!169926 (= e!112085 (and tp!15127 tp_is_empty!3945 (array_inv!2135 (_keys!5352 thiss!1248)) (array_inv!2136 (_values!3508 thiss!1248)) e!112086))))

(declare-fun mapNonEmpty!6689 () Bool)

(declare-fun tp!15128 () Bool)

(declare-fun e!112082 () Bool)

(assert (=> mapNonEmpty!6689 (= mapRes!6689 (and tp!15128 e!112082))))

(declare-fun mapRest!6689 () (Array (_ BitVec 32) ValueCell!1629))

(declare-fun mapKey!6689 () (_ BitVec 32))

(declare-fun mapValue!6689 () ValueCell!1629)

(assert (=> mapNonEmpty!6689 (= (arr!3330 (_values!3508 thiss!1248)) (store mapRest!6689 mapKey!6689 mapValue!6689))))

(declare-fun mapIsEmpty!6689 () Bool)

(assert (=> mapIsEmpty!6689 mapRes!6689))

(declare-fun b!169927 () Bool)

(assert (=> b!169927 (= e!112082 tp_is_empty!3945)))

(declare-fun b!169928 () Bool)

(assert (=> b!169928 (= e!112084 (and (= (size!3620 (_values!3508 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8322 thiss!1248))) (not (= (size!3619 (_keys!5352 thiss!1248)) (size!3620 (_values!3508 thiss!1248))))))))

(assert (= (and start!16870 res!80782) b!169925))

(assert (= (and b!169925 res!80783) b!169923))

(assert (= (and b!169923 res!80784) b!169928))

(assert (= (and b!169924 condMapEmpty!6689) mapIsEmpty!6689))

(assert (= (and b!169924 (not condMapEmpty!6689)) mapNonEmpty!6689))

(get-info :version)

(assert (= (and mapNonEmpty!6689 ((_ is ValueCellFull!1629) mapValue!6689)) b!169927))

(assert (= (and b!169924 ((_ is ValueCellFull!1629) mapDefault!6689)) b!169922))

(assert (= b!169926 b!169924))

(assert (= start!16870 b!169926))

(declare-fun m!198707 () Bool)

(assert (=> start!16870 m!198707))

(declare-fun m!198709 () Bool)

(assert (=> b!169923 m!198709))

(declare-fun m!198711 () Bool)

(assert (=> b!169926 m!198711))

(declare-fun m!198713 () Bool)

(assert (=> b!169926 m!198713))

(declare-fun m!198715 () Bool)

(assert (=> mapNonEmpty!6689 m!198715))

(check-sat (not b_next!4173) (not mapNonEmpty!6689) (not b!169923) tp_is_empty!3945 (not start!16870) b_and!10587 (not b!169926))
(check-sat b_and!10587 (not b_next!4173))
(get-model)

(declare-fun d!51669 () Bool)

(assert (=> d!51669 (= (array_inv!2135 (_keys!5352 thiss!1248)) (bvsge (size!3619 (_keys!5352 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169926 d!51669))

(declare-fun d!51671 () Bool)

(assert (=> d!51671 (= (array_inv!2136 (_values!3508 thiss!1248)) (bvsge (size!3620 (_values!3508 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169926 d!51671))

(declare-fun d!51673 () Bool)

(declare-fun res!80800 () Bool)

(declare-fun e!112107 () Bool)

(assert (=> d!51673 (=> (not res!80800) (not e!112107))))

(declare-fun simpleValid!129 (LongMapFixedSize!2166) Bool)

(assert (=> d!51673 (= res!80800 (simpleValid!129 thiss!1248))))

(assert (=> d!51673 (= (valid!931 thiss!1248) e!112107)))

(declare-fun b!169956 () Bool)

(declare-fun res!80801 () Bool)

(assert (=> b!169956 (=> (not res!80801) (not e!112107))))

(declare-fun arrayCountValidKeys!0 (array!6991 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!169956 (= res!80801 (= (arrayCountValidKeys!0 (_keys!5352 thiss!1248) #b00000000000000000000000000000000 (size!3619 (_keys!5352 thiss!1248))) (_size!1132 thiss!1248)))))

(declare-fun b!169957 () Bool)

(declare-fun res!80802 () Bool)

(assert (=> b!169957 (=> (not res!80802) (not e!112107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6991 (_ BitVec 32)) Bool)

(assert (=> b!169957 (= res!80802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5352 thiss!1248) (mask!8322 thiss!1248)))))

(declare-fun b!169958 () Bool)

(declare-datatypes ((List!2185 0))(
  ( (Nil!2182) (Cons!2181 (h!2798 (_ BitVec 64)) (t!6987 List!2185)) )
))
(declare-fun arrayNoDuplicates!0 (array!6991 (_ BitVec 32) List!2185) Bool)

(assert (=> b!169958 (= e!112107 (arrayNoDuplicates!0 (_keys!5352 thiss!1248) #b00000000000000000000000000000000 Nil!2182))))

(assert (= (and d!51673 res!80800) b!169956))

(assert (= (and b!169956 res!80801) b!169957))

(assert (= (and b!169957 res!80802) b!169958))

(declare-fun m!198727 () Bool)

(assert (=> d!51673 m!198727))

(declare-fun m!198729 () Bool)

(assert (=> b!169956 m!198729))

(declare-fun m!198731 () Bool)

(assert (=> b!169957 m!198731))

(declare-fun m!198733 () Bool)

(assert (=> b!169958 m!198733))

(assert (=> start!16870 d!51673))

(declare-fun d!51675 () Bool)

(assert (=> d!51675 (= (validMask!0 (mask!8322 thiss!1248)) (and (or (= (mask!8322 thiss!1248) #b00000000000000000000000000000111) (= (mask!8322 thiss!1248) #b00000000000000000000000000001111) (= (mask!8322 thiss!1248) #b00000000000000000000000000011111) (= (mask!8322 thiss!1248) #b00000000000000000000000000111111) (= (mask!8322 thiss!1248) #b00000000000000000000000001111111) (= (mask!8322 thiss!1248) #b00000000000000000000000011111111) (= (mask!8322 thiss!1248) #b00000000000000000000000111111111) (= (mask!8322 thiss!1248) #b00000000000000000000001111111111) (= (mask!8322 thiss!1248) #b00000000000000000000011111111111) (= (mask!8322 thiss!1248) #b00000000000000000000111111111111) (= (mask!8322 thiss!1248) #b00000000000000000001111111111111) (= (mask!8322 thiss!1248) #b00000000000000000011111111111111) (= (mask!8322 thiss!1248) #b00000000000000000111111111111111) (= (mask!8322 thiss!1248) #b00000000000000001111111111111111) (= (mask!8322 thiss!1248) #b00000000000000011111111111111111) (= (mask!8322 thiss!1248) #b00000000000000111111111111111111) (= (mask!8322 thiss!1248) #b00000000000001111111111111111111) (= (mask!8322 thiss!1248) #b00000000000011111111111111111111) (= (mask!8322 thiss!1248) #b00000000000111111111111111111111) (= (mask!8322 thiss!1248) #b00000000001111111111111111111111) (= (mask!8322 thiss!1248) #b00000000011111111111111111111111) (= (mask!8322 thiss!1248) #b00000000111111111111111111111111) (= (mask!8322 thiss!1248) #b00000001111111111111111111111111) (= (mask!8322 thiss!1248) #b00000011111111111111111111111111) (= (mask!8322 thiss!1248) #b00000111111111111111111111111111) (= (mask!8322 thiss!1248) #b00001111111111111111111111111111) (= (mask!8322 thiss!1248) #b00011111111111111111111111111111) (= (mask!8322 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8322 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!169923 d!51675))

(declare-fun b!169965 () Bool)

(declare-fun e!112112 () Bool)

(assert (=> b!169965 (= e!112112 tp_is_empty!3945)))

(declare-fun mapIsEmpty!6695 () Bool)

(declare-fun mapRes!6695 () Bool)

(assert (=> mapIsEmpty!6695 mapRes!6695))

(declare-fun condMapEmpty!6695 () Bool)

(declare-fun mapDefault!6695 () ValueCell!1629)

(assert (=> mapNonEmpty!6689 (= condMapEmpty!6695 (= mapRest!6689 ((as const (Array (_ BitVec 32) ValueCell!1629)) mapDefault!6695)))))

(declare-fun e!112113 () Bool)

(assert (=> mapNonEmpty!6689 (= tp!15128 (and e!112113 mapRes!6695))))

(declare-fun mapNonEmpty!6695 () Bool)

(declare-fun tp!15137 () Bool)

(assert (=> mapNonEmpty!6695 (= mapRes!6695 (and tp!15137 e!112112))))

(declare-fun mapKey!6695 () (_ BitVec 32))

(declare-fun mapRest!6695 () (Array (_ BitVec 32) ValueCell!1629))

(declare-fun mapValue!6695 () ValueCell!1629)

(assert (=> mapNonEmpty!6695 (= mapRest!6689 (store mapRest!6695 mapKey!6695 mapValue!6695))))

(declare-fun b!169966 () Bool)

(assert (=> b!169966 (= e!112113 tp_is_empty!3945)))

(assert (= (and mapNonEmpty!6689 condMapEmpty!6695) mapIsEmpty!6695))

(assert (= (and mapNonEmpty!6689 (not condMapEmpty!6695)) mapNonEmpty!6695))

(assert (= (and mapNonEmpty!6695 ((_ is ValueCellFull!1629) mapValue!6695)) b!169965))

(assert (= (and mapNonEmpty!6689 ((_ is ValueCellFull!1629) mapDefault!6695)) b!169966))

(declare-fun m!198735 () Bool)

(assert (=> mapNonEmpty!6695 m!198735))

(check-sat (not b_next!4173) b_and!10587 tp_is_empty!3945 (not b!169957) (not mapNonEmpty!6695) (not b!169956) (not d!51673) (not b!169958))
(check-sat b_and!10587 (not b_next!4173))
(get-model)

(declare-fun b!169975 () Bool)

(declare-fun e!112118 () (_ BitVec 32))

(declare-fun call!17356 () (_ BitVec 32))

(assert (=> b!169975 (= e!112118 (bvadd #b00000000000000000000000000000001 call!17356))))

(declare-fun b!169976 () Bool)

(declare-fun e!112119 () (_ BitVec 32))

(assert (=> b!169976 (= e!112119 #b00000000000000000000000000000000)))

(declare-fun d!51677 () Bool)

(declare-fun lt!84976 () (_ BitVec 32))

(assert (=> d!51677 (and (bvsge lt!84976 #b00000000000000000000000000000000) (bvsle lt!84976 (bvsub (size!3619 (_keys!5352 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51677 (= lt!84976 e!112119)))

(declare-fun c!30457 () Bool)

(assert (=> d!51677 (= c!30457 (bvsge #b00000000000000000000000000000000 (size!3619 (_keys!5352 thiss!1248))))))

(assert (=> d!51677 (and (bvsle #b00000000000000000000000000000000 (size!3619 (_keys!5352 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3619 (_keys!5352 thiss!1248)) (size!3619 (_keys!5352 thiss!1248))))))

(assert (=> d!51677 (= (arrayCountValidKeys!0 (_keys!5352 thiss!1248) #b00000000000000000000000000000000 (size!3619 (_keys!5352 thiss!1248))) lt!84976)))

(declare-fun b!169977 () Bool)

(assert (=> b!169977 (= e!112119 e!112118)))

(declare-fun c!30456 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!169977 (= c!30456 (validKeyInArray!0 (select (arr!3329 (_keys!5352 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169978 () Bool)

(assert (=> b!169978 (= e!112118 call!17356)))

(declare-fun bm!17353 () Bool)

(assert (=> bm!17353 (= call!17356 (arrayCountValidKeys!0 (_keys!5352 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3619 (_keys!5352 thiss!1248))))))

(assert (= (and d!51677 c!30457) b!169976))

(assert (= (and d!51677 (not c!30457)) b!169977))

(assert (= (and b!169977 c!30456) b!169975))

(assert (= (and b!169977 (not c!30456)) b!169978))

(assert (= (or b!169975 b!169978) bm!17353))

(declare-fun m!198737 () Bool)

(assert (=> b!169977 m!198737))

(assert (=> b!169977 m!198737))

(declare-fun m!198739 () Bool)

(assert (=> b!169977 m!198739))

(declare-fun m!198741 () Bool)

(assert (=> bm!17353 m!198741))

(assert (=> b!169956 d!51677))

(declare-fun b!169990 () Bool)

(declare-fun e!112122 () Bool)

(assert (=> b!169990 (= e!112122 (and (bvsge (extraKeys!3266 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3266 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1132 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!169987 () Bool)

(declare-fun res!80813 () Bool)

(assert (=> b!169987 (=> (not res!80813) (not e!112122))))

(assert (=> b!169987 (= res!80813 (and (= (size!3620 (_values!3508 thiss!1248)) (bvadd (mask!8322 thiss!1248) #b00000000000000000000000000000001)) (= (size!3619 (_keys!5352 thiss!1248)) (size!3620 (_values!3508 thiss!1248))) (bvsge (_size!1132 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1132 thiss!1248) (bvadd (mask!8322 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!169988 () Bool)

(declare-fun res!80812 () Bool)

(assert (=> b!169988 (=> (not res!80812) (not e!112122))))

(declare-fun size!3623 (LongMapFixedSize!2166) (_ BitVec 32))

(assert (=> b!169988 (= res!80812 (bvsge (size!3623 thiss!1248) (_size!1132 thiss!1248)))))

(declare-fun d!51679 () Bool)

(declare-fun res!80811 () Bool)

(assert (=> d!51679 (=> (not res!80811) (not e!112122))))

(assert (=> d!51679 (= res!80811 (validMask!0 (mask!8322 thiss!1248)))))

(assert (=> d!51679 (= (simpleValid!129 thiss!1248) e!112122)))

(declare-fun b!169989 () Bool)

(declare-fun res!80814 () Bool)

(assert (=> b!169989 (=> (not res!80814) (not e!112122))))

(assert (=> b!169989 (= res!80814 (= (size!3623 thiss!1248) (bvadd (_size!1132 thiss!1248) (bvsdiv (bvadd (extraKeys!3266 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!51679 res!80811) b!169987))

(assert (= (and b!169987 res!80813) b!169988))

(assert (= (and b!169988 res!80812) b!169989))

(assert (= (and b!169989 res!80814) b!169990))

(declare-fun m!198743 () Bool)

(assert (=> b!169988 m!198743))

(assert (=> d!51679 m!198709))

(assert (=> b!169989 m!198743))

(assert (=> d!51673 d!51679))

(declare-fun b!170001 () Bool)

(declare-fun e!112133 () Bool)

(declare-fun contains!1139 (List!2185 (_ BitVec 64)) Bool)

(assert (=> b!170001 (= e!112133 (contains!1139 Nil!2182 (select (arr!3329 (_keys!5352 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170002 () Bool)

(declare-fun e!112134 () Bool)

(declare-fun call!17359 () Bool)

(assert (=> b!170002 (= e!112134 call!17359)))

(declare-fun b!170004 () Bool)

(declare-fun e!112132 () Bool)

(declare-fun e!112131 () Bool)

(assert (=> b!170004 (= e!112132 e!112131)))

(declare-fun res!80823 () Bool)

(assert (=> b!170004 (=> (not res!80823) (not e!112131))))

(assert (=> b!170004 (= res!80823 (not e!112133))))

(declare-fun res!80821 () Bool)

(assert (=> b!170004 (=> (not res!80821) (not e!112133))))

(assert (=> b!170004 (= res!80821 (validKeyInArray!0 (select (arr!3329 (_keys!5352 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170005 () Bool)

(assert (=> b!170005 (= e!112131 e!112134)))

(declare-fun c!30460 () Bool)

(assert (=> b!170005 (= c!30460 (validKeyInArray!0 (select (arr!3329 (_keys!5352 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17356 () Bool)

(assert (=> bm!17356 (= call!17359 (arrayNoDuplicates!0 (_keys!5352 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30460 (Cons!2181 (select (arr!3329 (_keys!5352 thiss!1248)) #b00000000000000000000000000000000) Nil!2182) Nil!2182)))))

(declare-fun d!51681 () Bool)

(declare-fun res!80822 () Bool)

(assert (=> d!51681 (=> res!80822 e!112132)))

(assert (=> d!51681 (= res!80822 (bvsge #b00000000000000000000000000000000 (size!3619 (_keys!5352 thiss!1248))))))

(assert (=> d!51681 (= (arrayNoDuplicates!0 (_keys!5352 thiss!1248) #b00000000000000000000000000000000 Nil!2182) e!112132)))

(declare-fun b!170003 () Bool)

(assert (=> b!170003 (= e!112134 call!17359)))

(assert (= (and d!51681 (not res!80822)) b!170004))

(assert (= (and b!170004 res!80821) b!170001))

(assert (= (and b!170004 res!80823) b!170005))

(assert (= (and b!170005 c!30460) b!170003))

(assert (= (and b!170005 (not c!30460)) b!170002))

(assert (= (or b!170003 b!170002) bm!17356))

(assert (=> b!170001 m!198737))

(assert (=> b!170001 m!198737))

(declare-fun m!198745 () Bool)

(assert (=> b!170001 m!198745))

(assert (=> b!170004 m!198737))

(assert (=> b!170004 m!198737))

(assert (=> b!170004 m!198739))

(assert (=> b!170005 m!198737))

(assert (=> b!170005 m!198737))

(assert (=> b!170005 m!198739))

(assert (=> bm!17356 m!198737))

(declare-fun m!198747 () Bool)

(assert (=> bm!17356 m!198747))

(assert (=> b!169958 d!51681))

(declare-fun bm!17359 () Bool)

(declare-fun call!17362 () Bool)

(assert (=> bm!17359 (= call!17362 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5352 thiss!1248) (mask!8322 thiss!1248)))))

(declare-fun b!170014 () Bool)

(declare-fun e!112143 () Bool)

(assert (=> b!170014 (= e!112143 call!17362)))

(declare-fun d!51683 () Bool)

(declare-fun res!80828 () Bool)

(declare-fun e!112141 () Bool)

(assert (=> d!51683 (=> res!80828 e!112141)))

(assert (=> d!51683 (= res!80828 (bvsge #b00000000000000000000000000000000 (size!3619 (_keys!5352 thiss!1248))))))

(assert (=> d!51683 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5352 thiss!1248) (mask!8322 thiss!1248)) e!112141)))

(declare-fun b!170015 () Bool)

(declare-fun e!112142 () Bool)

(assert (=> b!170015 (= e!112142 call!17362)))

(declare-fun b!170016 () Bool)

(assert (=> b!170016 (= e!112141 e!112143)))

(declare-fun c!30463 () Bool)

(assert (=> b!170016 (= c!30463 (validKeyInArray!0 (select (arr!3329 (_keys!5352 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170017 () Bool)

(assert (=> b!170017 (= e!112143 e!112142)))

(declare-fun lt!84983 () (_ BitVec 64))

(assert (=> b!170017 (= lt!84983 (select (arr!3329 (_keys!5352 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5240 0))(
  ( (Unit!5241) )
))
(declare-fun lt!84984 () Unit!5240)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6991 (_ BitVec 64) (_ BitVec 32)) Unit!5240)

(assert (=> b!170017 (= lt!84984 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5352 thiss!1248) lt!84983 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!170017 (arrayContainsKey!0 (_keys!5352 thiss!1248) lt!84983 #b00000000000000000000000000000000)))

(declare-fun lt!84985 () Unit!5240)

(assert (=> b!170017 (= lt!84985 lt!84984)))

(declare-fun res!80829 () Bool)

(declare-datatypes ((SeekEntryResult!529 0))(
  ( (MissingZero!529 (index!4284 (_ BitVec 32))) (Found!529 (index!4285 (_ BitVec 32))) (Intermediate!529 (undefined!1341 Bool) (index!4286 (_ BitVec 32)) (x!18799 (_ BitVec 32))) (Undefined!529) (MissingVacant!529 (index!4287 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6991 (_ BitVec 32)) SeekEntryResult!529)

(assert (=> b!170017 (= res!80829 (= (seekEntryOrOpen!0 (select (arr!3329 (_keys!5352 thiss!1248)) #b00000000000000000000000000000000) (_keys!5352 thiss!1248) (mask!8322 thiss!1248)) (Found!529 #b00000000000000000000000000000000)))))

(assert (=> b!170017 (=> (not res!80829) (not e!112142))))

(assert (= (and d!51683 (not res!80828)) b!170016))

(assert (= (and b!170016 c!30463) b!170017))

(assert (= (and b!170016 (not c!30463)) b!170014))

(assert (= (and b!170017 res!80829) b!170015))

(assert (= (or b!170015 b!170014) bm!17359))

(declare-fun m!198749 () Bool)

(assert (=> bm!17359 m!198749))

(assert (=> b!170016 m!198737))

(assert (=> b!170016 m!198737))

(assert (=> b!170016 m!198739))

(assert (=> b!170017 m!198737))

(declare-fun m!198751 () Bool)

(assert (=> b!170017 m!198751))

(declare-fun m!198753 () Bool)

(assert (=> b!170017 m!198753))

(assert (=> b!170017 m!198737))

(declare-fun m!198755 () Bool)

(assert (=> b!170017 m!198755))

(assert (=> b!169957 d!51683))

(declare-fun b!170018 () Bool)

(declare-fun e!112144 () Bool)

(assert (=> b!170018 (= e!112144 tp_is_empty!3945)))

(declare-fun mapIsEmpty!6696 () Bool)

(declare-fun mapRes!6696 () Bool)

(assert (=> mapIsEmpty!6696 mapRes!6696))

(declare-fun condMapEmpty!6696 () Bool)

(declare-fun mapDefault!6696 () ValueCell!1629)

(assert (=> mapNonEmpty!6695 (= condMapEmpty!6696 (= mapRest!6695 ((as const (Array (_ BitVec 32) ValueCell!1629)) mapDefault!6696)))))

(declare-fun e!112145 () Bool)

(assert (=> mapNonEmpty!6695 (= tp!15137 (and e!112145 mapRes!6696))))

(declare-fun mapNonEmpty!6696 () Bool)

(declare-fun tp!15138 () Bool)

(assert (=> mapNonEmpty!6696 (= mapRes!6696 (and tp!15138 e!112144))))

(declare-fun mapRest!6696 () (Array (_ BitVec 32) ValueCell!1629))

(declare-fun mapKey!6696 () (_ BitVec 32))

(declare-fun mapValue!6696 () ValueCell!1629)

(assert (=> mapNonEmpty!6696 (= mapRest!6695 (store mapRest!6696 mapKey!6696 mapValue!6696))))

(declare-fun b!170019 () Bool)

(assert (=> b!170019 (= e!112145 tp_is_empty!3945)))

(assert (= (and mapNonEmpty!6695 condMapEmpty!6696) mapIsEmpty!6696))

(assert (= (and mapNonEmpty!6695 (not condMapEmpty!6696)) mapNonEmpty!6696))

(assert (= (and mapNonEmpty!6696 ((_ is ValueCellFull!1629) mapValue!6696)) b!170018))

(assert (= (and mapNonEmpty!6695 ((_ is ValueCellFull!1629) mapDefault!6696)) b!170019))

(declare-fun m!198757 () Bool)

(assert (=> mapNonEmpty!6696 m!198757))

(check-sat (not b_next!4173) (not bm!17359) tp_is_empty!3945 (not b!169989) (not b!170001) (not b!170016) (not d!51679) (not bm!17356) (not b!170017) (not bm!17353) (not mapNonEmpty!6696) (not b!170005) b_and!10587 (not b!170004) (not b!169977) (not b!169988))
(check-sat b_and!10587 (not b_next!4173))
