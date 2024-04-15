; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76698 () Bool)

(assert start!76698)

(declare-fun b!897643 () Bool)

(declare-fun b_free!15997 () Bool)

(declare-fun b_next!15997 () Bool)

(assert (=> b!897643 (= b_free!15997 (not b_next!15997))))

(declare-fun tp!56052 () Bool)

(declare-fun b_and!26263 () Bool)

(assert (=> b!897643 (= tp!56052 b_and!26263)))

(declare-fun b!897639 () Bool)

(declare-fun res!606739 () Bool)

(declare-fun e!502021 () Bool)

(assert (=> b!897639 (=> res!606739 e!502021)))

(declare-datatypes ((array!52665 0))(
  ( (array!52666 (arr!25313 (Array (_ BitVec 32) (_ BitVec 64))) (size!25770 (_ BitVec 32))) )
))
(declare-datatypes ((V!29399 0))(
  ( (V!29400 (val!9213 Int)) )
))
(declare-datatypes ((ValueCell!8681 0))(
  ( (ValueCellFull!8681 (v!11700 V!29399)) (EmptyCell!8681) )
))
(declare-datatypes ((array!52667 0))(
  ( (array!52668 (arr!25314 (Array (_ BitVec 32) ValueCell!8681)) (size!25771 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4378 0))(
  ( (LongMapFixedSize!4379 (defaultEntry!5401 Int) (mask!26104 (_ BitVec 32)) (extraKeys!5114 (_ BitVec 32)) (zeroValue!5218 V!29399) (minValue!5218 V!29399) (_size!2244 (_ BitVec 32)) (_keys!10163 array!52665) (_values!5405 array!52667) (_vacant!2244 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4378)

(declare-datatypes ((List!17839 0))(
  ( (Nil!17836) (Cons!17835 (h!18977 (_ BitVec 64)) (t!25169 List!17839)) )
))
(declare-fun arrayNoDuplicates!0 (array!52665 (_ BitVec 32) List!17839) Bool)

(assert (=> b!897639 (= res!606739 (not (arrayNoDuplicates!0 (_keys!10163 thiss!1181) #b00000000000000000000000000000000 Nil!17836)))))

(declare-fun b!897640 () Bool)

(declare-fun e!502020 () Bool)

(assert (=> b!897640 (= e!502020 e!502021)))

(declare-fun res!606741 () Bool)

(assert (=> b!897640 (=> res!606741 e!502021)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897640 (= res!606741 (not (validMask!0 (mask!26104 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897640 (arrayContainsKey!0 (_keys!10163 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!8919 0))(
  ( (MissingZero!8919 (index!38047 (_ BitVec 32))) (Found!8919 (index!38048 (_ BitVec 32))) (Intermediate!8919 (undefined!9731 Bool) (index!38049 (_ BitVec 32)) (x!76511 (_ BitVec 32))) (Undefined!8919) (MissingVacant!8919 (index!38050 (_ BitVec 32))) )
))
(declare-fun lt!405102 () SeekEntryResult!8919)

(declare-datatypes ((Unit!30458 0))(
  ( (Unit!30459) )
))
(declare-fun lt!405103 () Unit!30458)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52665 (_ BitVec 64) (_ BitVec 32)) Unit!30458)

(assert (=> b!897640 (= lt!405103 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10163 thiss!1181) key!785 (index!38048 lt!405102)))))

(declare-fun b!897641 () Bool)

(declare-fun e!502014 () Bool)

(declare-fun tp_is_empty!18325 () Bool)

(assert (=> b!897641 (= e!502014 tp_is_empty!18325)))

(declare-fun b!897642 () Bool)

(declare-fun e!502013 () Bool)

(declare-fun e!502019 () Bool)

(declare-fun mapRes!29133 () Bool)

(assert (=> b!897642 (= e!502013 (and e!502019 mapRes!29133))))

(declare-fun condMapEmpty!29133 () Bool)

(declare-fun mapDefault!29133 () ValueCell!8681)

(assert (=> b!897642 (= condMapEmpty!29133 (= (arr!25314 (_values!5405 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8681)) mapDefault!29133)))))

(declare-fun e!502017 () Bool)

(declare-fun array_inv!19920 (array!52665) Bool)

(declare-fun array_inv!19921 (array!52667) Bool)

(assert (=> b!897643 (= e!502017 (and tp!56052 tp_is_empty!18325 (array_inv!19920 (_keys!10163 thiss!1181)) (array_inv!19921 (_values!5405 thiss!1181)) e!502013))))

(declare-fun b!897644 () Bool)

(declare-fun e!502016 () Bool)

(assert (=> b!897644 (= e!502016 (not e!502020))))

(declare-fun res!606745 () Bool)

(assert (=> b!897644 (=> res!606745 e!502020)))

(get-info :version)

(assert (=> b!897644 (= res!606745 (not ((_ is Found!8919) lt!405102)))))

(declare-fun e!502015 () Bool)

(assert (=> b!897644 e!502015))

(declare-fun res!606744 () Bool)

(assert (=> b!897644 (=> res!606744 e!502015)))

(assert (=> b!897644 (= res!606744 (not ((_ is Found!8919) lt!405102)))))

(declare-fun lt!405104 () Unit!30458)

(declare-fun lemmaSeekEntryGivesInRangeIndex!85 (array!52665 array!52667 (_ BitVec 32) (_ BitVec 32) V!29399 V!29399 (_ BitVec 64)) Unit!30458)

(assert (=> b!897644 (= lt!405104 (lemmaSeekEntryGivesInRangeIndex!85 (_keys!10163 thiss!1181) (_values!5405 thiss!1181) (mask!26104 thiss!1181) (extraKeys!5114 thiss!1181) (zeroValue!5218 thiss!1181) (minValue!5218 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52665 (_ BitVec 32)) SeekEntryResult!8919)

(assert (=> b!897644 (= lt!405102 (seekEntry!0 key!785 (_keys!10163 thiss!1181) (mask!26104 thiss!1181)))))

(declare-fun mapNonEmpty!29133 () Bool)

(declare-fun tp!56051 () Bool)

(assert (=> mapNonEmpty!29133 (= mapRes!29133 (and tp!56051 e!502014))))

(declare-fun mapKey!29133 () (_ BitVec 32))

(declare-fun mapRest!29133 () (Array (_ BitVec 32) ValueCell!8681))

(declare-fun mapValue!29133 () ValueCell!8681)

(assert (=> mapNonEmpty!29133 (= (arr!25314 (_values!5405 thiss!1181)) (store mapRest!29133 mapKey!29133 mapValue!29133))))

(declare-fun b!897645 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897645 (= e!502015 (inRange!0 (index!38048 lt!405102) (mask!26104 thiss!1181)))))

(declare-fun b!897646 () Bool)

(declare-fun res!606740 () Bool)

(assert (=> b!897646 (=> res!606740 e!502021)))

(assert (=> b!897646 (= res!606740 (or (not (= (size!25771 (_values!5405 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26104 thiss!1181)))) (not (= (size!25770 (_keys!10163 thiss!1181)) (size!25771 (_values!5405 thiss!1181)))) (bvslt (mask!26104 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5114 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5114 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!897647 () Bool)

(assert (=> b!897647 (= e!502019 tp_is_empty!18325)))

(declare-fun b!897648 () Bool)

(assert (=> b!897648 (= e!502021 (and (bvsge (index!38048 lt!405102) #b00000000000000000000000000000000) (bvslt (index!38048 lt!405102) (size!25770 (_keys!10163 thiss!1181)))))))

(declare-fun mapIsEmpty!29133 () Bool)

(assert (=> mapIsEmpty!29133 mapRes!29133))

(declare-fun b!897650 () Bool)

(declare-fun res!606742 () Bool)

(assert (=> b!897650 (=> res!606742 e!502021)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52665 (_ BitVec 32)) Bool)

(assert (=> b!897650 (= res!606742 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10163 thiss!1181) (mask!26104 thiss!1181))))))

(declare-fun res!606738 () Bool)

(assert (=> start!76698 (=> (not res!606738) (not e!502016))))

(declare-fun valid!1693 (LongMapFixedSize!4378) Bool)

(assert (=> start!76698 (= res!606738 (valid!1693 thiss!1181))))

(assert (=> start!76698 e!502016))

(assert (=> start!76698 e!502017))

(assert (=> start!76698 true))

(declare-fun b!897649 () Bool)

(declare-fun res!606743 () Bool)

(assert (=> b!897649 (=> (not res!606743) (not e!502016))))

(assert (=> b!897649 (= res!606743 (not (= key!785 (bvneg key!785))))))

(assert (= (and start!76698 res!606738) b!897649))

(assert (= (and b!897649 res!606743) b!897644))

(assert (= (and b!897644 (not res!606744)) b!897645))

(assert (= (and b!897644 (not res!606745)) b!897640))

(assert (= (and b!897640 (not res!606741)) b!897646))

(assert (= (and b!897646 (not res!606740)) b!897650))

(assert (= (and b!897650 (not res!606742)) b!897639))

(assert (= (and b!897639 (not res!606739)) b!897648))

(assert (= (and b!897642 condMapEmpty!29133) mapIsEmpty!29133))

(assert (= (and b!897642 (not condMapEmpty!29133)) mapNonEmpty!29133))

(assert (= (and mapNonEmpty!29133 ((_ is ValueCellFull!8681) mapValue!29133)) b!897641))

(assert (= (and b!897642 ((_ is ValueCellFull!8681) mapDefault!29133)) b!897647))

(assert (= b!897643 b!897642))

(assert (= start!76698 b!897643))

(declare-fun m!833755 () Bool)

(assert (=> b!897644 m!833755))

(declare-fun m!833757 () Bool)

(assert (=> b!897644 m!833757))

(declare-fun m!833759 () Bool)

(assert (=> b!897640 m!833759))

(declare-fun m!833761 () Bool)

(assert (=> b!897640 m!833761))

(declare-fun m!833763 () Bool)

(assert (=> b!897640 m!833763))

(declare-fun m!833765 () Bool)

(assert (=> b!897650 m!833765))

(declare-fun m!833767 () Bool)

(assert (=> start!76698 m!833767))

(declare-fun m!833769 () Bool)

(assert (=> b!897645 m!833769))

(declare-fun m!833771 () Bool)

(assert (=> mapNonEmpty!29133 m!833771))

(declare-fun m!833773 () Bool)

(assert (=> b!897643 m!833773))

(declare-fun m!833775 () Bool)

(assert (=> b!897643 m!833775))

(declare-fun m!833777 () Bool)

(assert (=> b!897639 m!833777))

(check-sat (not b!897644) (not mapNonEmpty!29133) (not b!897643) (not b!897640) tp_is_empty!18325 (not start!76698) (not b_next!15997) b_and!26263 (not b!897650) (not b!897639) (not b!897645))
(check-sat b_and!26263 (not b_next!15997))
(get-model)

(declare-fun b!897733 () Bool)

(declare-fun e!502085 () Bool)

(declare-fun call!39800 () Bool)

(assert (=> b!897733 (= e!502085 call!39800)))

(declare-fun bm!39797 () Bool)

(declare-fun c!94821 () Bool)

(assert (=> bm!39797 (= call!39800 (arrayNoDuplicates!0 (_keys!10163 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94821 (Cons!17835 (select (arr!25313 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000) Nil!17836) Nil!17836)))))

(declare-fun b!897734 () Bool)

(declare-fun e!502087 () Bool)

(declare-fun e!502084 () Bool)

(assert (=> b!897734 (= e!502087 e!502084)))

(declare-fun res!606802 () Bool)

(assert (=> b!897734 (=> (not res!606802) (not e!502084))))

(declare-fun e!502086 () Bool)

(assert (=> b!897734 (= res!606802 (not e!502086))))

(declare-fun res!606800 () Bool)

(assert (=> b!897734 (=> (not res!606800) (not e!502086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!897734 (= res!606800 (validKeyInArray!0 (select (arr!25313 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897735 () Bool)

(declare-fun contains!4376 (List!17839 (_ BitVec 64)) Bool)

(assert (=> b!897735 (= e!502086 (contains!4376 Nil!17836 (select (arr!25313 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897736 () Bool)

(assert (=> b!897736 (= e!502085 call!39800)))

(declare-fun b!897737 () Bool)

(assert (=> b!897737 (= e!502084 e!502085)))

(assert (=> b!897737 (= c!94821 (validKeyInArray!0 (select (arr!25313 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110965 () Bool)

(declare-fun res!606801 () Bool)

(assert (=> d!110965 (=> res!606801 e!502087)))

(assert (=> d!110965 (= res!606801 (bvsge #b00000000000000000000000000000000 (size!25770 (_keys!10163 thiss!1181))))))

(assert (=> d!110965 (= (arrayNoDuplicates!0 (_keys!10163 thiss!1181) #b00000000000000000000000000000000 Nil!17836) e!502087)))

(assert (= (and d!110965 (not res!606801)) b!897734))

(assert (= (and b!897734 res!606800) b!897735))

(assert (= (and b!897734 res!606802) b!897737))

(assert (= (and b!897737 c!94821) b!897733))

(assert (= (and b!897737 (not c!94821)) b!897736))

(assert (= (or b!897733 b!897736) bm!39797))

(declare-fun m!833827 () Bool)

(assert (=> bm!39797 m!833827))

(declare-fun m!833829 () Bool)

(assert (=> bm!39797 m!833829))

(assert (=> b!897734 m!833827))

(assert (=> b!897734 m!833827))

(declare-fun m!833831 () Bool)

(assert (=> b!897734 m!833831))

(assert (=> b!897735 m!833827))

(assert (=> b!897735 m!833827))

(declare-fun m!833833 () Bool)

(assert (=> b!897735 m!833833))

(assert (=> b!897737 m!833827))

(assert (=> b!897737 m!833827))

(assert (=> b!897737 m!833831))

(assert (=> b!897639 d!110965))

(declare-fun d!110967 () Bool)

(declare-fun e!502090 () Bool)

(assert (=> d!110967 e!502090))

(declare-fun res!606805 () Bool)

(assert (=> d!110967 (=> res!606805 e!502090)))

(declare-fun lt!405128 () SeekEntryResult!8919)

(assert (=> d!110967 (= res!606805 (not ((_ is Found!8919) lt!405128)))))

(assert (=> d!110967 (= lt!405128 (seekEntry!0 key!785 (_keys!10163 thiss!1181) (mask!26104 thiss!1181)))))

(declare-fun lt!405127 () Unit!30458)

(declare-fun choose!1495 (array!52665 array!52667 (_ BitVec 32) (_ BitVec 32) V!29399 V!29399 (_ BitVec 64)) Unit!30458)

(assert (=> d!110967 (= lt!405127 (choose!1495 (_keys!10163 thiss!1181) (_values!5405 thiss!1181) (mask!26104 thiss!1181) (extraKeys!5114 thiss!1181) (zeroValue!5218 thiss!1181) (minValue!5218 thiss!1181) key!785))))

(assert (=> d!110967 (validMask!0 (mask!26104 thiss!1181))))

(assert (=> d!110967 (= (lemmaSeekEntryGivesInRangeIndex!85 (_keys!10163 thiss!1181) (_values!5405 thiss!1181) (mask!26104 thiss!1181) (extraKeys!5114 thiss!1181) (zeroValue!5218 thiss!1181) (minValue!5218 thiss!1181) key!785) lt!405127)))

(declare-fun b!897740 () Bool)

(assert (=> b!897740 (= e!502090 (inRange!0 (index!38048 lt!405128) (mask!26104 thiss!1181)))))

(assert (= (and d!110967 (not res!606805)) b!897740))

(assert (=> d!110967 m!833757))

(declare-fun m!833835 () Bool)

(assert (=> d!110967 m!833835))

(assert (=> d!110967 m!833759))

(declare-fun m!833837 () Bool)

(assert (=> b!897740 m!833837))

(assert (=> b!897644 d!110967))

(declare-fun b!897753 () Bool)

(declare-fun c!94830 () Bool)

(declare-fun lt!405139 () (_ BitVec 64))

(assert (=> b!897753 (= c!94830 (= lt!405139 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!502097 () SeekEntryResult!8919)

(declare-fun e!502099 () SeekEntryResult!8919)

(assert (=> b!897753 (= e!502097 e!502099)))

(declare-fun b!897754 () Bool)

(declare-fun e!502098 () SeekEntryResult!8919)

(assert (=> b!897754 (= e!502098 e!502097)))

(declare-fun lt!405137 () SeekEntryResult!8919)

(assert (=> b!897754 (= lt!405139 (select (arr!25313 (_keys!10163 thiss!1181)) (index!38049 lt!405137)))))

(declare-fun c!94828 () Bool)

(assert (=> b!897754 (= c!94828 (= lt!405139 key!785))))

(declare-fun d!110969 () Bool)

(declare-fun lt!405138 () SeekEntryResult!8919)

(assert (=> d!110969 (and (or ((_ is MissingVacant!8919) lt!405138) (not ((_ is Found!8919) lt!405138)) (and (bvsge (index!38048 lt!405138) #b00000000000000000000000000000000) (bvslt (index!38048 lt!405138) (size!25770 (_keys!10163 thiss!1181))))) (not ((_ is MissingVacant!8919) lt!405138)) (or (not ((_ is Found!8919) lt!405138)) (= (select (arr!25313 (_keys!10163 thiss!1181)) (index!38048 lt!405138)) key!785)))))

(assert (=> d!110969 (= lt!405138 e!502098)))

(declare-fun c!94829 () Bool)

(assert (=> d!110969 (= c!94829 (and ((_ is Intermediate!8919) lt!405137) (undefined!9731 lt!405137)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52665 (_ BitVec 32)) SeekEntryResult!8919)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110969 (= lt!405137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26104 thiss!1181)) key!785 (_keys!10163 thiss!1181) (mask!26104 thiss!1181)))))

(assert (=> d!110969 (validMask!0 (mask!26104 thiss!1181))))

(assert (=> d!110969 (= (seekEntry!0 key!785 (_keys!10163 thiss!1181) (mask!26104 thiss!1181)) lt!405138)))

(declare-fun b!897755 () Bool)

(assert (=> b!897755 (= e!502098 Undefined!8919)))

(declare-fun b!897756 () Bool)

(assert (=> b!897756 (= e!502097 (Found!8919 (index!38049 lt!405137)))))

(declare-fun b!897757 () Bool)

(declare-fun lt!405140 () SeekEntryResult!8919)

(assert (=> b!897757 (= e!502099 (ite ((_ is MissingVacant!8919) lt!405140) (MissingZero!8919 (index!38050 lt!405140)) lt!405140))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52665 (_ BitVec 32)) SeekEntryResult!8919)

(assert (=> b!897757 (= lt!405140 (seekKeyOrZeroReturnVacant!0 (x!76511 lt!405137) (index!38049 lt!405137) (index!38049 lt!405137) key!785 (_keys!10163 thiss!1181) (mask!26104 thiss!1181)))))

(declare-fun b!897758 () Bool)

(assert (=> b!897758 (= e!502099 (MissingZero!8919 (index!38049 lt!405137)))))

(assert (= (and d!110969 c!94829) b!897755))

(assert (= (and d!110969 (not c!94829)) b!897754))

(assert (= (and b!897754 c!94828) b!897756))

(assert (= (and b!897754 (not c!94828)) b!897753))

(assert (= (and b!897753 c!94830) b!897758))

(assert (= (and b!897753 (not c!94830)) b!897757))

(declare-fun m!833839 () Bool)

(assert (=> b!897754 m!833839))

(declare-fun m!833841 () Bool)

(assert (=> d!110969 m!833841))

(declare-fun m!833843 () Bool)

(assert (=> d!110969 m!833843))

(assert (=> d!110969 m!833843))

(declare-fun m!833845 () Bool)

(assert (=> d!110969 m!833845))

(assert (=> d!110969 m!833759))

(declare-fun m!833847 () Bool)

(assert (=> b!897757 m!833847))

(assert (=> b!897644 d!110969))

(declare-fun d!110971 () Bool)

(assert (=> d!110971 (= (array_inv!19920 (_keys!10163 thiss!1181)) (bvsge (size!25770 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897643 d!110971))

(declare-fun d!110973 () Bool)

(assert (=> d!110973 (= (array_inv!19921 (_values!5405 thiss!1181)) (bvsge (size!25771 (_values!5405 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897643 d!110973))

(declare-fun b!897767 () Bool)

(declare-fun e!502108 () Bool)

(declare-fun call!39803 () Bool)

(assert (=> b!897767 (= e!502108 call!39803)))

(declare-fun b!897768 () Bool)

(declare-fun e!502106 () Bool)

(assert (=> b!897768 (= e!502106 e!502108)))

(declare-fun lt!405148 () (_ BitVec 64))

(assert (=> b!897768 (= lt!405148 (select (arr!25313 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405149 () Unit!30458)

(assert (=> b!897768 (= lt!405149 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10163 thiss!1181) lt!405148 #b00000000000000000000000000000000))))

(assert (=> b!897768 (arrayContainsKey!0 (_keys!10163 thiss!1181) lt!405148 #b00000000000000000000000000000000)))

(declare-fun lt!405147 () Unit!30458)

(assert (=> b!897768 (= lt!405147 lt!405149)))

(declare-fun res!606810 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52665 (_ BitVec 32)) SeekEntryResult!8919)

(assert (=> b!897768 (= res!606810 (= (seekEntryOrOpen!0 (select (arr!25313 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000) (_keys!10163 thiss!1181) (mask!26104 thiss!1181)) (Found!8919 #b00000000000000000000000000000000)))))

(assert (=> b!897768 (=> (not res!606810) (not e!502108))))

(declare-fun d!110975 () Bool)

(declare-fun res!606811 () Bool)

(declare-fun e!502107 () Bool)

(assert (=> d!110975 (=> res!606811 e!502107)))

(assert (=> d!110975 (= res!606811 (bvsge #b00000000000000000000000000000000 (size!25770 (_keys!10163 thiss!1181))))))

(assert (=> d!110975 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10163 thiss!1181) (mask!26104 thiss!1181)) e!502107)))

(declare-fun b!897769 () Bool)

(assert (=> b!897769 (= e!502107 e!502106)))

(declare-fun c!94833 () Bool)

(assert (=> b!897769 (= c!94833 (validKeyInArray!0 (select (arr!25313 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39800 () Bool)

(assert (=> bm!39800 (= call!39803 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10163 thiss!1181) (mask!26104 thiss!1181)))))

(declare-fun b!897770 () Bool)

(assert (=> b!897770 (= e!502106 call!39803)))

(assert (= (and d!110975 (not res!606811)) b!897769))

(assert (= (and b!897769 c!94833) b!897768))

(assert (= (and b!897769 (not c!94833)) b!897770))

(assert (= (and b!897768 res!606810) b!897767))

(assert (= (or b!897767 b!897770) bm!39800))

(assert (=> b!897768 m!833827))

(declare-fun m!833849 () Bool)

(assert (=> b!897768 m!833849))

(declare-fun m!833851 () Bool)

(assert (=> b!897768 m!833851))

(assert (=> b!897768 m!833827))

(declare-fun m!833853 () Bool)

(assert (=> b!897768 m!833853))

(assert (=> b!897769 m!833827))

(assert (=> b!897769 m!833827))

(assert (=> b!897769 m!833831))

(declare-fun m!833855 () Bool)

(assert (=> bm!39800 m!833855))

(assert (=> b!897650 d!110975))

(declare-fun d!110977 () Bool)

(declare-fun res!606818 () Bool)

(declare-fun e!502111 () Bool)

(assert (=> d!110977 (=> (not res!606818) (not e!502111))))

(declare-fun simpleValid!321 (LongMapFixedSize!4378) Bool)

(assert (=> d!110977 (= res!606818 (simpleValid!321 thiss!1181))))

(assert (=> d!110977 (= (valid!1693 thiss!1181) e!502111)))

(declare-fun b!897777 () Bool)

(declare-fun res!606819 () Bool)

(assert (=> b!897777 (=> (not res!606819) (not e!502111))))

(declare-fun arrayCountValidKeys!0 (array!52665 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897777 (= res!606819 (= (arrayCountValidKeys!0 (_keys!10163 thiss!1181) #b00000000000000000000000000000000 (size!25770 (_keys!10163 thiss!1181))) (_size!2244 thiss!1181)))))

(declare-fun b!897778 () Bool)

(declare-fun res!606820 () Bool)

(assert (=> b!897778 (=> (not res!606820) (not e!502111))))

(assert (=> b!897778 (= res!606820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10163 thiss!1181) (mask!26104 thiss!1181)))))

(declare-fun b!897779 () Bool)

(assert (=> b!897779 (= e!502111 (arrayNoDuplicates!0 (_keys!10163 thiss!1181) #b00000000000000000000000000000000 Nil!17836))))

(assert (= (and d!110977 res!606818) b!897777))

(assert (= (and b!897777 res!606819) b!897778))

(assert (= (and b!897778 res!606820) b!897779))

(declare-fun m!833857 () Bool)

(assert (=> d!110977 m!833857))

(declare-fun m!833859 () Bool)

(assert (=> b!897777 m!833859))

(assert (=> b!897778 m!833765))

(assert (=> b!897779 m!833777))

(assert (=> start!76698 d!110977))

(declare-fun d!110979 () Bool)

(assert (=> d!110979 (= (inRange!0 (index!38048 lt!405102) (mask!26104 thiss!1181)) (and (bvsge (index!38048 lt!405102) #b00000000000000000000000000000000) (bvslt (index!38048 lt!405102) (bvadd (mask!26104 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897645 d!110979))

(declare-fun d!110981 () Bool)

(assert (=> d!110981 (= (validMask!0 (mask!26104 thiss!1181)) (and (or (= (mask!26104 thiss!1181) #b00000000000000000000000000000111) (= (mask!26104 thiss!1181) #b00000000000000000000000000001111) (= (mask!26104 thiss!1181) #b00000000000000000000000000011111) (= (mask!26104 thiss!1181) #b00000000000000000000000000111111) (= (mask!26104 thiss!1181) #b00000000000000000000000001111111) (= (mask!26104 thiss!1181) #b00000000000000000000000011111111) (= (mask!26104 thiss!1181) #b00000000000000000000000111111111) (= (mask!26104 thiss!1181) #b00000000000000000000001111111111) (= (mask!26104 thiss!1181) #b00000000000000000000011111111111) (= (mask!26104 thiss!1181) #b00000000000000000000111111111111) (= (mask!26104 thiss!1181) #b00000000000000000001111111111111) (= (mask!26104 thiss!1181) #b00000000000000000011111111111111) (= (mask!26104 thiss!1181) #b00000000000000000111111111111111) (= (mask!26104 thiss!1181) #b00000000000000001111111111111111) (= (mask!26104 thiss!1181) #b00000000000000011111111111111111) (= (mask!26104 thiss!1181) #b00000000000000111111111111111111) (= (mask!26104 thiss!1181) #b00000000000001111111111111111111) (= (mask!26104 thiss!1181) #b00000000000011111111111111111111) (= (mask!26104 thiss!1181) #b00000000000111111111111111111111) (= (mask!26104 thiss!1181) #b00000000001111111111111111111111) (= (mask!26104 thiss!1181) #b00000000011111111111111111111111) (= (mask!26104 thiss!1181) #b00000000111111111111111111111111) (= (mask!26104 thiss!1181) #b00000001111111111111111111111111) (= (mask!26104 thiss!1181) #b00000011111111111111111111111111) (= (mask!26104 thiss!1181) #b00000111111111111111111111111111) (= (mask!26104 thiss!1181) #b00001111111111111111111111111111) (= (mask!26104 thiss!1181) #b00011111111111111111111111111111) (= (mask!26104 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26104 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!897640 d!110981))

(declare-fun d!110983 () Bool)

(declare-fun res!606825 () Bool)

(declare-fun e!502116 () Bool)

(assert (=> d!110983 (=> res!606825 e!502116)))

(assert (=> d!110983 (= res!606825 (= (select (arr!25313 (_keys!10163 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110983 (= (arrayContainsKey!0 (_keys!10163 thiss!1181) key!785 #b00000000000000000000000000000000) e!502116)))

(declare-fun b!897784 () Bool)

(declare-fun e!502117 () Bool)

(assert (=> b!897784 (= e!502116 e!502117)))

(declare-fun res!606826 () Bool)

(assert (=> b!897784 (=> (not res!606826) (not e!502117))))

(assert (=> b!897784 (= res!606826 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25770 (_keys!10163 thiss!1181))))))

(declare-fun b!897785 () Bool)

(assert (=> b!897785 (= e!502117 (arrayContainsKey!0 (_keys!10163 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110983 (not res!606825)) b!897784))

(assert (= (and b!897784 res!606826) b!897785))

(assert (=> d!110983 m!833827))

(declare-fun m!833861 () Bool)

(assert (=> b!897785 m!833861))

(assert (=> b!897640 d!110983))

(declare-fun d!110985 () Bool)

(assert (=> d!110985 (arrayContainsKey!0 (_keys!10163 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405152 () Unit!30458)

(declare-fun choose!13 (array!52665 (_ BitVec 64) (_ BitVec 32)) Unit!30458)

(assert (=> d!110985 (= lt!405152 (choose!13 (_keys!10163 thiss!1181) key!785 (index!38048 lt!405102)))))

(assert (=> d!110985 (bvsge (index!38048 lt!405102) #b00000000000000000000000000000000)))

(assert (=> d!110985 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10163 thiss!1181) key!785 (index!38048 lt!405102)) lt!405152)))

(declare-fun bs!25169 () Bool)

(assert (= bs!25169 d!110985))

(assert (=> bs!25169 m!833761))

(declare-fun m!833863 () Bool)

(assert (=> bs!25169 m!833863))

(assert (=> b!897640 d!110985))

(declare-fun b!897793 () Bool)

(declare-fun e!502123 () Bool)

(assert (=> b!897793 (= e!502123 tp_is_empty!18325)))

(declare-fun condMapEmpty!29142 () Bool)

(declare-fun mapDefault!29142 () ValueCell!8681)

(assert (=> mapNonEmpty!29133 (= condMapEmpty!29142 (= mapRest!29133 ((as const (Array (_ BitVec 32) ValueCell!8681)) mapDefault!29142)))))

(declare-fun mapRes!29142 () Bool)

(assert (=> mapNonEmpty!29133 (= tp!56051 (and e!502123 mapRes!29142))))

(declare-fun b!897792 () Bool)

(declare-fun e!502122 () Bool)

(assert (=> b!897792 (= e!502122 tp_is_empty!18325)))

(declare-fun mapIsEmpty!29142 () Bool)

(assert (=> mapIsEmpty!29142 mapRes!29142))

(declare-fun mapNonEmpty!29142 () Bool)

(declare-fun tp!56067 () Bool)

(assert (=> mapNonEmpty!29142 (= mapRes!29142 (and tp!56067 e!502122))))

(declare-fun mapRest!29142 () (Array (_ BitVec 32) ValueCell!8681))

(declare-fun mapKey!29142 () (_ BitVec 32))

(declare-fun mapValue!29142 () ValueCell!8681)

(assert (=> mapNonEmpty!29142 (= mapRest!29133 (store mapRest!29142 mapKey!29142 mapValue!29142))))

(assert (= (and mapNonEmpty!29133 condMapEmpty!29142) mapIsEmpty!29142))

(assert (= (and mapNonEmpty!29133 (not condMapEmpty!29142)) mapNonEmpty!29142))

(assert (= (and mapNonEmpty!29142 ((_ is ValueCellFull!8681) mapValue!29142)) b!897792))

(assert (= (and mapNonEmpty!29133 ((_ is ValueCellFull!8681) mapDefault!29142)) b!897793))

(declare-fun m!833865 () Bool)

(assert (=> mapNonEmpty!29142 m!833865))

(check-sat (not b!897737) (not b!897779) (not bm!39797) (not b!897757) (not d!110985) (not b!897785) (not d!110969) (not b!897735) tp_is_empty!18325 (not b_next!15997) (not d!110967) (not b!897778) (not mapNonEmpty!29142) (not b!897769) (not b!897768) (not b!897777) b_and!26263 (not d!110977) (not bm!39800) (not b!897734) (not b!897740))
(check-sat b_and!26263 (not b_next!15997))
