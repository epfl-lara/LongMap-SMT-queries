; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16828 () Bool)

(assert start!16828)

(declare-fun b!169694 () Bool)

(declare-fun b_free!4159 () Bool)

(declare-fun b_next!4159 () Bool)

(assert (=> b!169694 (= b_free!4159 (not b_next!4159))))

(declare-fun tp!15078 () Bool)

(declare-fun b_and!10587 () Bool)

(assert (=> b!169694 (= tp!15078 b_and!10587)))

(declare-fun b!169689 () Bool)

(declare-fun e!111902 () Bool)

(declare-datatypes ((V!4889 0))(
  ( (V!4890 (val!2010 Int)) )
))
(declare-datatypes ((ValueCell!1622 0))(
  ( (ValueCellFull!1622 (v!3876 V!4889)) (EmptyCell!1622) )
))
(declare-datatypes ((array!6945 0))(
  ( (array!6946 (arr!3308 (Array (_ BitVec 32) (_ BitVec 64))) (size!3596 (_ BitVec 32))) )
))
(declare-datatypes ((array!6947 0))(
  ( (array!6948 (arr!3309 (Array (_ BitVec 32) ValueCell!1622)) (size!3597 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2152 0))(
  ( (LongMapFixedSize!2153 (defaultEntry!3518 Int) (mask!8307 (_ BitVec 32)) (extraKeys!3259 (_ BitVec 32)) (zeroValue!3361 V!4889) (minValue!3361 V!4889) (_size!1125 (_ BitVec 32)) (_keys!5343 array!6945) (_values!3501 array!6947) (_vacant!1125 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2152)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!169689 (= e!111902 (not (validMask!0 (mask!8307 thiss!1248))))))

(declare-fun res!80676 () Bool)

(assert (=> start!16828 (=> (not res!80676) (not e!111902))))

(declare-fun valid!938 (LongMapFixedSize!2152) Bool)

(assert (=> start!16828 (= res!80676 (valid!938 thiss!1248))))

(assert (=> start!16828 e!111902))

(declare-fun e!111897 () Bool)

(assert (=> start!16828 e!111897))

(assert (=> start!16828 true))

(declare-fun mapNonEmpty!6660 () Bool)

(declare-fun mapRes!6660 () Bool)

(declare-fun tp!15077 () Bool)

(declare-fun e!111901 () Bool)

(assert (=> mapNonEmpty!6660 (= mapRes!6660 (and tp!15077 e!111901))))

(declare-fun mapValue!6660 () ValueCell!1622)

(declare-fun mapRest!6660 () (Array (_ BitVec 32) ValueCell!1622))

(declare-fun mapKey!6660 () (_ BitVec 32))

(assert (=> mapNonEmpty!6660 (= (arr!3309 (_values!3501 thiss!1248)) (store mapRest!6660 mapKey!6660 mapValue!6660))))

(declare-fun b!169690 () Bool)

(declare-fun res!80675 () Bool)

(assert (=> b!169690 (=> (not res!80675) (not e!111902))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169690 (= res!80675 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!169691 () Bool)

(declare-fun e!111899 () Bool)

(declare-fun e!111900 () Bool)

(assert (=> b!169691 (= e!111899 (and e!111900 mapRes!6660))))

(declare-fun condMapEmpty!6660 () Bool)

(declare-fun mapDefault!6660 () ValueCell!1622)

(assert (=> b!169691 (= condMapEmpty!6660 (= (arr!3309 (_values!3501 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1622)) mapDefault!6660)))))

(declare-fun b!169692 () Bool)

(declare-fun tp_is_empty!3931 () Bool)

(assert (=> b!169692 (= e!111901 tp_is_empty!3931)))

(declare-fun b!169693 () Bool)

(assert (=> b!169693 (= e!111900 tp_is_empty!3931)))

(declare-fun mapIsEmpty!6660 () Bool)

(assert (=> mapIsEmpty!6660 mapRes!6660))

(declare-fun array_inv!2121 (array!6945) Bool)

(declare-fun array_inv!2122 (array!6947) Bool)

(assert (=> b!169694 (= e!111897 (and tp!15078 tp_is_empty!3931 (array_inv!2121 (_keys!5343 thiss!1248)) (array_inv!2122 (_values!3501 thiss!1248)) e!111899))))

(assert (= (and start!16828 res!80676) b!169690))

(assert (= (and b!169690 res!80675) b!169689))

(assert (= (and b!169691 condMapEmpty!6660) mapIsEmpty!6660))

(assert (= (and b!169691 (not condMapEmpty!6660)) mapNonEmpty!6660))

(get-info :version)

(assert (= (and mapNonEmpty!6660 ((_ is ValueCellFull!1622) mapValue!6660)) b!169692))

(assert (= (and b!169691 ((_ is ValueCellFull!1622) mapDefault!6660)) b!169693))

(assert (= b!169694 b!169691))

(assert (= start!16828 b!169694))

(declare-fun m!198755 () Bool)

(assert (=> b!169689 m!198755))

(declare-fun m!198757 () Bool)

(assert (=> start!16828 m!198757))

(declare-fun m!198759 () Bool)

(assert (=> mapNonEmpty!6660 m!198759))

(declare-fun m!198761 () Bool)

(assert (=> b!169694 m!198761))

(declare-fun m!198763 () Bool)

(assert (=> b!169694 m!198763))

(check-sat (not b!169694) b_and!10587 (not start!16828) (not mapNonEmpty!6660) (not b_next!4159) (not b!169689) tp_is_empty!3931)
(check-sat b_and!10587 (not b_next!4159))
(get-model)

(declare-fun d!51707 () Bool)

(assert (=> d!51707 (= (validMask!0 (mask!8307 thiss!1248)) (and (or (= (mask!8307 thiss!1248) #b00000000000000000000000000000111) (= (mask!8307 thiss!1248) #b00000000000000000000000000001111) (= (mask!8307 thiss!1248) #b00000000000000000000000000011111) (= (mask!8307 thiss!1248) #b00000000000000000000000000111111) (= (mask!8307 thiss!1248) #b00000000000000000000000001111111) (= (mask!8307 thiss!1248) #b00000000000000000000000011111111) (= (mask!8307 thiss!1248) #b00000000000000000000000111111111) (= (mask!8307 thiss!1248) #b00000000000000000000001111111111) (= (mask!8307 thiss!1248) #b00000000000000000000011111111111) (= (mask!8307 thiss!1248) #b00000000000000000000111111111111) (= (mask!8307 thiss!1248) #b00000000000000000001111111111111) (= (mask!8307 thiss!1248) #b00000000000000000011111111111111) (= (mask!8307 thiss!1248) #b00000000000000000111111111111111) (= (mask!8307 thiss!1248) #b00000000000000001111111111111111) (= (mask!8307 thiss!1248) #b00000000000000011111111111111111) (= (mask!8307 thiss!1248) #b00000000000000111111111111111111) (= (mask!8307 thiss!1248) #b00000000000001111111111111111111) (= (mask!8307 thiss!1248) #b00000000000011111111111111111111) (= (mask!8307 thiss!1248) #b00000000000111111111111111111111) (= (mask!8307 thiss!1248) #b00000000001111111111111111111111) (= (mask!8307 thiss!1248) #b00000000011111111111111111111111) (= (mask!8307 thiss!1248) #b00000000111111111111111111111111) (= (mask!8307 thiss!1248) #b00000001111111111111111111111111) (= (mask!8307 thiss!1248) #b00000011111111111111111111111111) (= (mask!8307 thiss!1248) #b00000111111111111111111111111111) (= (mask!8307 thiss!1248) #b00001111111111111111111111111111) (= (mask!8307 thiss!1248) #b00011111111111111111111111111111) (= (mask!8307 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8307 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!169689 d!51707))

(declare-fun d!51709 () Bool)

(declare-fun res!80695 () Bool)

(declare-fun e!111941 () Bool)

(assert (=> d!51709 (=> (not res!80695) (not e!111941))))

(declare-fun simpleValid!127 (LongMapFixedSize!2152) Bool)

(assert (=> d!51709 (= res!80695 (simpleValid!127 thiss!1248))))

(assert (=> d!51709 (= (valid!938 thiss!1248) e!111941)))

(declare-fun b!169737 () Bool)

(declare-fun res!80696 () Bool)

(assert (=> b!169737 (=> (not res!80696) (not e!111941))))

(declare-fun arrayCountValidKeys!0 (array!6945 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!169737 (= res!80696 (= (arrayCountValidKeys!0 (_keys!5343 thiss!1248) #b00000000000000000000000000000000 (size!3596 (_keys!5343 thiss!1248))) (_size!1125 thiss!1248)))))

(declare-fun b!169738 () Bool)

(declare-fun res!80697 () Bool)

(assert (=> b!169738 (=> (not res!80697) (not e!111941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6945 (_ BitVec 32)) Bool)

(assert (=> b!169738 (= res!80697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5343 thiss!1248) (mask!8307 thiss!1248)))))

(declare-fun b!169739 () Bool)

(declare-datatypes ((List!2166 0))(
  ( (Nil!2163) (Cons!2162 (h!2779 (_ BitVec 64)) (t!6960 List!2166)) )
))
(declare-fun arrayNoDuplicates!0 (array!6945 (_ BitVec 32) List!2166) Bool)

(assert (=> b!169739 (= e!111941 (arrayNoDuplicates!0 (_keys!5343 thiss!1248) #b00000000000000000000000000000000 Nil!2163))))

(assert (= (and d!51709 res!80695) b!169737))

(assert (= (and b!169737 res!80696) b!169738))

(assert (= (and b!169738 res!80697) b!169739))

(declare-fun m!198785 () Bool)

(assert (=> d!51709 m!198785))

(declare-fun m!198787 () Bool)

(assert (=> b!169737 m!198787))

(declare-fun m!198789 () Bool)

(assert (=> b!169738 m!198789))

(declare-fun m!198791 () Bool)

(assert (=> b!169739 m!198791))

(assert (=> start!16828 d!51709))

(declare-fun d!51711 () Bool)

(assert (=> d!51711 (= (array_inv!2121 (_keys!5343 thiss!1248)) (bvsge (size!3596 (_keys!5343 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169694 d!51711))

(declare-fun d!51713 () Bool)

(assert (=> d!51713 (= (array_inv!2122 (_values!3501 thiss!1248)) (bvsge (size!3597 (_values!3501 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169694 d!51713))

(declare-fun mapNonEmpty!6669 () Bool)

(declare-fun mapRes!6669 () Bool)

(declare-fun tp!15093 () Bool)

(declare-fun e!111946 () Bool)

(assert (=> mapNonEmpty!6669 (= mapRes!6669 (and tp!15093 e!111946))))

(declare-fun mapRest!6669 () (Array (_ BitVec 32) ValueCell!1622))

(declare-fun mapValue!6669 () ValueCell!1622)

(declare-fun mapKey!6669 () (_ BitVec 32))

(assert (=> mapNonEmpty!6669 (= mapRest!6660 (store mapRest!6669 mapKey!6669 mapValue!6669))))

(declare-fun condMapEmpty!6669 () Bool)

(declare-fun mapDefault!6669 () ValueCell!1622)

(assert (=> mapNonEmpty!6660 (= condMapEmpty!6669 (= mapRest!6660 ((as const (Array (_ BitVec 32) ValueCell!1622)) mapDefault!6669)))))

(declare-fun e!111947 () Bool)

(assert (=> mapNonEmpty!6660 (= tp!15077 (and e!111947 mapRes!6669))))

(declare-fun b!169747 () Bool)

(assert (=> b!169747 (= e!111947 tp_is_empty!3931)))

(declare-fun mapIsEmpty!6669 () Bool)

(assert (=> mapIsEmpty!6669 mapRes!6669))

(declare-fun b!169746 () Bool)

(assert (=> b!169746 (= e!111946 tp_is_empty!3931)))

(assert (= (and mapNonEmpty!6660 condMapEmpty!6669) mapIsEmpty!6669))

(assert (= (and mapNonEmpty!6660 (not condMapEmpty!6669)) mapNonEmpty!6669))

(assert (= (and mapNonEmpty!6669 ((_ is ValueCellFull!1622) mapValue!6669)) b!169746))

(assert (= (and mapNonEmpty!6660 ((_ is ValueCellFull!1622) mapDefault!6669)) b!169747))

(declare-fun m!198793 () Bool)

(assert (=> mapNonEmpty!6669 m!198793))

(check-sat (not b!169738) (not b!169737) b_and!10587 (not b!169739) (not b_next!4159) (not d!51709) tp_is_empty!3931 (not mapNonEmpty!6669))
(check-sat b_and!10587 (not b_next!4159))
(get-model)

(declare-fun b!169756 () Bool)

(declare-fun e!111956 () Bool)

(declare-fun e!111954 () Bool)

(assert (=> b!169756 (= e!111956 e!111954)))

(declare-fun lt!85015 () (_ BitVec 64))

(assert (=> b!169756 (= lt!85015 (select (arr!3308 (_keys!5343 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5237 0))(
  ( (Unit!5238) )
))
(declare-fun lt!85017 () Unit!5237)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6945 (_ BitVec 64) (_ BitVec 32)) Unit!5237)

(assert (=> b!169756 (= lt!85017 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5343 thiss!1248) lt!85015 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!169756 (arrayContainsKey!0 (_keys!5343 thiss!1248) lt!85015 #b00000000000000000000000000000000)))

(declare-fun lt!85016 () Unit!5237)

(assert (=> b!169756 (= lt!85016 lt!85017)))

(declare-fun res!80703 () Bool)

(declare-datatypes ((SeekEntryResult!521 0))(
  ( (MissingZero!521 (index!4252 (_ BitVec 32))) (Found!521 (index!4253 (_ BitVec 32))) (Intermediate!521 (undefined!1333 Bool) (index!4254 (_ BitVec 32)) (x!18747 (_ BitVec 32))) (Undefined!521) (MissingVacant!521 (index!4255 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6945 (_ BitVec 32)) SeekEntryResult!521)

(assert (=> b!169756 (= res!80703 (= (seekEntryOrOpen!0 (select (arr!3308 (_keys!5343 thiss!1248)) #b00000000000000000000000000000000) (_keys!5343 thiss!1248) (mask!8307 thiss!1248)) (Found!521 #b00000000000000000000000000000000)))))

(assert (=> b!169756 (=> (not res!80703) (not e!111954))))

(declare-fun b!169757 () Bool)

(declare-fun call!17326 () Bool)

(assert (=> b!169757 (= e!111956 call!17326)))

(declare-fun b!169758 () Bool)

(assert (=> b!169758 (= e!111954 call!17326)))

(declare-fun b!169759 () Bool)

(declare-fun e!111955 () Bool)

(assert (=> b!169759 (= e!111955 e!111956)))

(declare-fun c!30443 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!169759 (= c!30443 (validKeyInArray!0 (select (arr!3308 (_keys!5343 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51715 () Bool)

(declare-fun res!80702 () Bool)

(assert (=> d!51715 (=> res!80702 e!111955)))

(assert (=> d!51715 (= res!80702 (bvsge #b00000000000000000000000000000000 (size!3596 (_keys!5343 thiss!1248))))))

(assert (=> d!51715 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5343 thiss!1248) (mask!8307 thiss!1248)) e!111955)))

(declare-fun bm!17323 () Bool)

(assert (=> bm!17323 (= call!17326 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5343 thiss!1248) (mask!8307 thiss!1248)))))

(assert (= (and d!51715 (not res!80702)) b!169759))

(assert (= (and b!169759 c!30443) b!169756))

(assert (= (and b!169759 (not c!30443)) b!169757))

(assert (= (and b!169756 res!80703) b!169758))

(assert (= (or b!169758 b!169757) bm!17323))

(declare-fun m!198795 () Bool)

(assert (=> b!169756 m!198795))

(declare-fun m!198797 () Bool)

(assert (=> b!169756 m!198797))

(declare-fun m!198799 () Bool)

(assert (=> b!169756 m!198799))

(assert (=> b!169756 m!198795))

(declare-fun m!198801 () Bool)

(assert (=> b!169756 m!198801))

(assert (=> b!169759 m!198795))

(assert (=> b!169759 m!198795))

(declare-fun m!198803 () Bool)

(assert (=> b!169759 m!198803))

(declare-fun m!198805 () Bool)

(assert (=> bm!17323 m!198805))

(assert (=> b!169738 d!51715))

(declare-fun b!169768 () Bool)

(declare-fun e!111961 () (_ BitVec 32))

(assert (=> b!169768 (= e!111961 #b00000000000000000000000000000000)))

(declare-fun b!169769 () Bool)

(declare-fun e!111962 () (_ BitVec 32))

(declare-fun call!17329 () (_ BitVec 32))

(assert (=> b!169769 (= e!111962 call!17329)))

(declare-fun bm!17326 () Bool)

(assert (=> bm!17326 (= call!17329 (arrayCountValidKeys!0 (_keys!5343 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3596 (_keys!5343 thiss!1248))))))

(declare-fun d!51717 () Bool)

(declare-fun lt!85020 () (_ BitVec 32))

(assert (=> d!51717 (and (bvsge lt!85020 #b00000000000000000000000000000000) (bvsle lt!85020 (bvsub (size!3596 (_keys!5343 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51717 (= lt!85020 e!111961)))

(declare-fun c!30449 () Bool)

(assert (=> d!51717 (= c!30449 (bvsge #b00000000000000000000000000000000 (size!3596 (_keys!5343 thiss!1248))))))

(assert (=> d!51717 (and (bvsle #b00000000000000000000000000000000 (size!3596 (_keys!5343 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3596 (_keys!5343 thiss!1248)) (size!3596 (_keys!5343 thiss!1248))))))

(assert (=> d!51717 (= (arrayCountValidKeys!0 (_keys!5343 thiss!1248) #b00000000000000000000000000000000 (size!3596 (_keys!5343 thiss!1248))) lt!85020)))

(declare-fun b!169770 () Bool)

(assert (=> b!169770 (= e!111961 e!111962)))

(declare-fun c!30448 () Bool)

(assert (=> b!169770 (= c!30448 (validKeyInArray!0 (select (arr!3308 (_keys!5343 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169771 () Bool)

(assert (=> b!169771 (= e!111962 (bvadd #b00000000000000000000000000000001 call!17329))))

(assert (= (and d!51717 c!30449) b!169768))

(assert (= (and d!51717 (not c!30449)) b!169770))

(assert (= (and b!169770 c!30448) b!169771))

(assert (= (and b!169770 (not c!30448)) b!169769))

(assert (= (or b!169771 b!169769) bm!17326))

(declare-fun m!198807 () Bool)

(assert (=> bm!17326 m!198807))

(assert (=> b!169770 m!198795))

(assert (=> b!169770 m!198795))

(assert (=> b!169770 m!198803))

(assert (=> b!169737 d!51717))

(declare-fun b!169783 () Bool)

(declare-fun e!111965 () Bool)

(assert (=> b!169783 (= e!111965 (and (bvsge (extraKeys!3259 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3259 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1125 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!169781 () Bool)

(declare-fun res!80714 () Bool)

(assert (=> b!169781 (=> (not res!80714) (not e!111965))))

(declare-fun size!3602 (LongMapFixedSize!2152) (_ BitVec 32))

(assert (=> b!169781 (= res!80714 (bvsge (size!3602 thiss!1248) (_size!1125 thiss!1248)))))

(declare-fun b!169782 () Bool)

(declare-fun res!80712 () Bool)

(assert (=> b!169782 (=> (not res!80712) (not e!111965))))

(assert (=> b!169782 (= res!80712 (= (size!3602 thiss!1248) (bvadd (_size!1125 thiss!1248) (bvsdiv (bvadd (extraKeys!3259 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!51719 () Bool)

(declare-fun res!80715 () Bool)

(assert (=> d!51719 (=> (not res!80715) (not e!111965))))

(assert (=> d!51719 (= res!80715 (validMask!0 (mask!8307 thiss!1248)))))

(assert (=> d!51719 (= (simpleValid!127 thiss!1248) e!111965)))

(declare-fun b!169780 () Bool)

(declare-fun res!80713 () Bool)

(assert (=> b!169780 (=> (not res!80713) (not e!111965))))

(assert (=> b!169780 (= res!80713 (and (= (size!3597 (_values!3501 thiss!1248)) (bvadd (mask!8307 thiss!1248) #b00000000000000000000000000000001)) (= (size!3596 (_keys!5343 thiss!1248)) (size!3597 (_values!3501 thiss!1248))) (bvsge (_size!1125 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1125 thiss!1248) (bvadd (mask!8307 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!51719 res!80715) b!169780))

(assert (= (and b!169780 res!80713) b!169781))

(assert (= (and b!169781 res!80714) b!169782))

(assert (= (and b!169782 res!80712) b!169783))

(declare-fun m!198809 () Bool)

(assert (=> b!169781 m!198809))

(assert (=> b!169782 m!198809))

(assert (=> d!51719 m!198755))

(assert (=> d!51709 d!51719))

(declare-fun b!169794 () Bool)

(declare-fun e!111976 () Bool)

(declare-fun e!111975 () Bool)

(assert (=> b!169794 (= e!111976 e!111975)))

(declare-fun c!30452 () Bool)

(assert (=> b!169794 (= c!30452 (validKeyInArray!0 (select (arr!3308 (_keys!5343 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169795 () Bool)

(declare-fun call!17332 () Bool)

(assert (=> b!169795 (= e!111975 call!17332)))

(declare-fun bm!17329 () Bool)

(assert (=> bm!17329 (= call!17332 (arrayNoDuplicates!0 (_keys!5343 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30452 (Cons!2162 (select (arr!3308 (_keys!5343 thiss!1248)) #b00000000000000000000000000000000) Nil!2163) Nil!2163)))))

(declare-fun b!169796 () Bool)

(assert (=> b!169796 (= e!111975 call!17332)))

(declare-fun d!51721 () Bool)

(declare-fun res!80722 () Bool)

(declare-fun e!111974 () Bool)

(assert (=> d!51721 (=> res!80722 e!111974)))

(assert (=> d!51721 (= res!80722 (bvsge #b00000000000000000000000000000000 (size!3596 (_keys!5343 thiss!1248))))))

(assert (=> d!51721 (= (arrayNoDuplicates!0 (_keys!5343 thiss!1248) #b00000000000000000000000000000000 Nil!2163) e!111974)))

(declare-fun b!169797 () Bool)

(assert (=> b!169797 (= e!111974 e!111976)))

(declare-fun res!80724 () Bool)

(assert (=> b!169797 (=> (not res!80724) (not e!111976))))

(declare-fun e!111977 () Bool)

(assert (=> b!169797 (= res!80724 (not e!111977))))

(declare-fun res!80723 () Bool)

(assert (=> b!169797 (=> (not res!80723) (not e!111977))))

(assert (=> b!169797 (= res!80723 (validKeyInArray!0 (select (arr!3308 (_keys!5343 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169798 () Bool)

(declare-fun contains!1133 (List!2166 (_ BitVec 64)) Bool)

(assert (=> b!169798 (= e!111977 (contains!1133 Nil!2163 (select (arr!3308 (_keys!5343 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51721 (not res!80722)) b!169797))

(assert (= (and b!169797 res!80723) b!169798))

(assert (= (and b!169797 res!80724) b!169794))

(assert (= (and b!169794 c!30452) b!169795))

(assert (= (and b!169794 (not c!30452)) b!169796))

(assert (= (or b!169795 b!169796) bm!17329))

(assert (=> b!169794 m!198795))

(assert (=> b!169794 m!198795))

(assert (=> b!169794 m!198803))

(assert (=> bm!17329 m!198795))

(declare-fun m!198811 () Bool)

(assert (=> bm!17329 m!198811))

(assert (=> b!169797 m!198795))

(assert (=> b!169797 m!198795))

(assert (=> b!169797 m!198803))

(assert (=> b!169798 m!198795))

(assert (=> b!169798 m!198795))

(declare-fun m!198813 () Bool)

(assert (=> b!169798 m!198813))

(assert (=> b!169739 d!51721))

(declare-fun mapNonEmpty!6670 () Bool)

(declare-fun mapRes!6670 () Bool)

(declare-fun tp!15094 () Bool)

(declare-fun e!111978 () Bool)

(assert (=> mapNonEmpty!6670 (= mapRes!6670 (and tp!15094 e!111978))))

(declare-fun mapKey!6670 () (_ BitVec 32))

(declare-fun mapRest!6670 () (Array (_ BitVec 32) ValueCell!1622))

(declare-fun mapValue!6670 () ValueCell!1622)

(assert (=> mapNonEmpty!6670 (= mapRest!6669 (store mapRest!6670 mapKey!6670 mapValue!6670))))

(declare-fun condMapEmpty!6670 () Bool)

(declare-fun mapDefault!6670 () ValueCell!1622)

(assert (=> mapNonEmpty!6669 (= condMapEmpty!6670 (= mapRest!6669 ((as const (Array (_ BitVec 32) ValueCell!1622)) mapDefault!6670)))))

(declare-fun e!111979 () Bool)

(assert (=> mapNonEmpty!6669 (= tp!15093 (and e!111979 mapRes!6670))))

(declare-fun b!169800 () Bool)

(assert (=> b!169800 (= e!111979 tp_is_empty!3931)))

(declare-fun mapIsEmpty!6670 () Bool)

(assert (=> mapIsEmpty!6670 mapRes!6670))

(declare-fun b!169799 () Bool)

(assert (=> b!169799 (= e!111978 tp_is_empty!3931)))

(assert (= (and mapNonEmpty!6669 condMapEmpty!6670) mapIsEmpty!6670))

(assert (= (and mapNonEmpty!6669 (not condMapEmpty!6670)) mapNonEmpty!6670))

(assert (= (and mapNonEmpty!6670 ((_ is ValueCellFull!1622) mapValue!6670)) b!169799))

(assert (= (and mapNonEmpty!6669 ((_ is ValueCellFull!1622) mapDefault!6670)) b!169800))

(declare-fun m!198815 () Bool)

(assert (=> mapNonEmpty!6670 m!198815))

(check-sat (not b!169770) (not mapNonEmpty!6670) b_and!10587 (not b_next!4159) (not d!51719) (not bm!17326) (not b!169798) (not b!169797) (not b!169794) (not b!169781) (not bm!17323) (not b!169759) (not b!169782) (not b!169756) (not bm!17329) tp_is_empty!3931)
(check-sat b_and!10587 (not b_next!4159))
