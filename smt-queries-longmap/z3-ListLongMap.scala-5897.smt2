; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76190 () Bool)

(assert start!76190)

(declare-fun b!894802 () Bool)

(declare-fun b_free!15885 () Bool)

(declare-fun b_next!15885 () Bool)

(assert (=> b!894802 (= b_free!15885 (not b_next!15885))))

(declare-fun tp!55649 () Bool)

(declare-fun b_and!26177 () Bool)

(assert (=> b!894802 (= tp!55649 b_and!26177)))

(declare-fun mapIsEmpty!28900 () Bool)

(declare-fun mapRes!28900 () Bool)

(assert (=> mapIsEmpty!28900 mapRes!28900))

(declare-fun b!894800 () Bool)

(declare-fun res!605474 () Bool)

(declare-fun e!499858 () Bool)

(assert (=> b!894800 (=> (not res!605474) (not e!499858))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!894800 (= res!605474 (not (= key!785 (bvneg key!785))))))

(declare-fun b!894801 () Bool)

(declare-fun e!499854 () Bool)

(declare-datatypes ((array!52420 0))(
  ( (array!52421 (arr!25209 (Array (_ BitVec 32) (_ BitVec 64))) (size!25656 (_ BitVec 32))) )
))
(declare-datatypes ((V!29249 0))(
  ( (V!29250 (val!9157 Int)) )
))
(declare-datatypes ((ValueCell!8625 0))(
  ( (ValueCellFull!8625 (v!11647 V!29249)) (EmptyCell!8625) )
))
(declare-datatypes ((array!52422 0))(
  ( (array!52423 (arr!25210 (Array (_ BitVec 32) ValueCell!8625)) (size!25657 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4266 0))(
  ( (LongMapFixedSize!4267 (defaultEntry!5345 Int) (mask!25916 (_ BitVec 32)) (extraKeys!5041 (_ BitVec 32)) (zeroValue!5145 V!29249) (minValue!5145 V!29249) (_size!2188 (_ BitVec 32)) (_keys!10047 array!52420) (_values!5332 array!52422) (_vacant!2188 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4266)

(assert (=> b!894801 (= e!499854 (and (= (size!25657 (_values!5332 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25916 thiss!1181))) (not (= (size!25656 (_keys!10047 thiss!1181)) (size!25657 (_values!5332 thiss!1181))))))))

(declare-fun e!499859 () Bool)

(declare-fun tp_is_empty!18213 () Bool)

(declare-fun e!499853 () Bool)

(declare-fun array_inv!19792 (array!52420) Bool)

(declare-fun array_inv!19793 (array!52422) Bool)

(assert (=> b!894802 (= e!499859 (and tp!55649 tp_is_empty!18213 (array_inv!19792 (_keys!10047 thiss!1181)) (array_inv!19793 (_values!5332 thiss!1181)) e!499853))))

(declare-fun b!894803 () Bool)

(assert (=> b!894803 (= e!499858 e!499854)))

(declare-fun res!605472 () Bool)

(assert (=> b!894803 (=> (not res!605472) (not e!499854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!894803 (= res!605472 (validMask!0 (mask!25916 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8871 0))(
  ( (MissingZero!8871 (index!37855 (_ BitVec 32))) (Found!8871 (index!37856 (_ BitVec 32))) (Intermediate!8871 (undefined!9683 Bool) (index!37857 (_ BitVec 32)) (x!76092 (_ BitVec 32))) (Undefined!8871) (MissingVacant!8871 (index!37858 (_ BitVec 32))) )
))
(declare-fun lt!404362 () SeekEntryResult!8871)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52420 (_ BitVec 32)) SeekEntryResult!8871)

(assert (=> b!894803 (= lt!404362 (seekEntry!0 key!785 (_keys!10047 thiss!1181) (mask!25916 thiss!1181)))))

(declare-fun mapNonEmpty!28900 () Bool)

(declare-fun tp!55650 () Bool)

(declare-fun e!499855 () Bool)

(assert (=> mapNonEmpty!28900 (= mapRes!28900 (and tp!55650 e!499855))))

(declare-fun mapKey!28900 () (_ BitVec 32))

(declare-fun mapValue!28900 () ValueCell!8625)

(declare-fun mapRest!28900 () (Array (_ BitVec 32) ValueCell!8625))

(assert (=> mapNonEmpty!28900 (= (arr!25210 (_values!5332 thiss!1181)) (store mapRest!28900 mapKey!28900 mapValue!28900))))

(declare-fun res!605473 () Bool)

(assert (=> start!76190 (=> (not res!605473) (not e!499858))))

(declare-fun valid!1645 (LongMapFixedSize!4266) Bool)

(assert (=> start!76190 (= res!605473 (valid!1645 thiss!1181))))

(assert (=> start!76190 e!499858))

(assert (=> start!76190 e!499859))

(assert (=> start!76190 true))

(declare-fun b!894804 () Bool)

(declare-fun e!499857 () Bool)

(assert (=> b!894804 (= e!499853 (and e!499857 mapRes!28900))))

(declare-fun condMapEmpty!28900 () Bool)

(declare-fun mapDefault!28900 () ValueCell!8625)

(assert (=> b!894804 (= condMapEmpty!28900 (= (arr!25210 (_values!5332 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8625)) mapDefault!28900)))))

(declare-fun b!894805 () Bool)

(assert (=> b!894805 (= e!499857 tp_is_empty!18213)))

(declare-fun b!894806 () Bool)

(assert (=> b!894806 (= e!499855 tp_is_empty!18213)))

(assert (= (and start!76190 res!605473) b!894800))

(assert (= (and b!894800 res!605474) b!894803))

(assert (= (and b!894803 res!605472) b!894801))

(assert (= (and b!894804 condMapEmpty!28900) mapIsEmpty!28900))

(assert (= (and b!894804 (not condMapEmpty!28900)) mapNonEmpty!28900))

(get-info :version)

(assert (= (and mapNonEmpty!28900 ((_ is ValueCellFull!8625) mapValue!28900)) b!894806))

(assert (= (and b!894804 ((_ is ValueCellFull!8625) mapDefault!28900)) b!894805))

(assert (= b!894802 b!894804))

(assert (= start!76190 b!894802))

(declare-fun m!832703 () Bool)

(assert (=> b!894802 m!832703))

(declare-fun m!832705 () Bool)

(assert (=> b!894802 m!832705))

(declare-fun m!832707 () Bool)

(assert (=> b!894803 m!832707))

(declare-fun m!832709 () Bool)

(assert (=> b!894803 m!832709))

(declare-fun m!832711 () Bool)

(assert (=> mapNonEmpty!28900 m!832711))

(declare-fun m!832713 () Bool)

(assert (=> start!76190 m!832713))

(check-sat (not mapNonEmpty!28900) (not start!76190) (not b!894803) b_and!26177 (not b_next!15885) tp_is_empty!18213 (not b!894802))
(check-sat b_and!26177 (not b_next!15885))
(get-model)

(declare-fun d!110693 () Bool)

(declare-fun res!605490 () Bool)

(declare-fun e!499883 () Bool)

(assert (=> d!110693 (=> (not res!605490) (not e!499883))))

(declare-fun simpleValid!302 (LongMapFixedSize!4266) Bool)

(assert (=> d!110693 (= res!605490 (simpleValid!302 thiss!1181))))

(assert (=> d!110693 (= (valid!1645 thiss!1181) e!499883)))

(declare-fun b!894834 () Bool)

(declare-fun res!605491 () Bool)

(assert (=> b!894834 (=> (not res!605491) (not e!499883))))

(declare-fun arrayCountValidKeys!0 (array!52420 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894834 (= res!605491 (= (arrayCountValidKeys!0 (_keys!10047 thiss!1181) #b00000000000000000000000000000000 (size!25656 (_keys!10047 thiss!1181))) (_size!2188 thiss!1181)))))

(declare-fun b!894835 () Bool)

(declare-fun res!605492 () Bool)

(assert (=> b!894835 (=> (not res!605492) (not e!499883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52420 (_ BitVec 32)) Bool)

(assert (=> b!894835 (= res!605492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10047 thiss!1181) (mask!25916 thiss!1181)))))

(declare-fun b!894836 () Bool)

(declare-datatypes ((List!17809 0))(
  ( (Nil!17806) (Cons!17805 (h!18939 (_ BitVec 64)) (t!25148 List!17809)) )
))
(declare-fun arrayNoDuplicates!0 (array!52420 (_ BitVec 32) List!17809) Bool)

(assert (=> b!894836 (= e!499883 (arrayNoDuplicates!0 (_keys!10047 thiss!1181) #b00000000000000000000000000000000 Nil!17806))))

(assert (= (and d!110693 res!605490) b!894834))

(assert (= (and b!894834 res!605491) b!894835))

(assert (= (and b!894835 res!605492) b!894836))

(declare-fun m!832727 () Bool)

(assert (=> d!110693 m!832727))

(declare-fun m!832729 () Bool)

(assert (=> b!894834 m!832729))

(declare-fun m!832731 () Bool)

(assert (=> b!894835 m!832731))

(declare-fun m!832733 () Bool)

(assert (=> b!894836 m!832733))

(assert (=> start!76190 d!110693))

(declare-fun d!110695 () Bool)

(assert (=> d!110695 (= (array_inv!19792 (_keys!10047 thiss!1181)) (bvsge (size!25656 (_keys!10047 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894802 d!110695))

(declare-fun d!110697 () Bool)

(assert (=> d!110697 (= (array_inv!19793 (_values!5332 thiss!1181)) (bvsge (size!25657 (_values!5332 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894802 d!110697))

(declare-fun d!110699 () Bool)

(assert (=> d!110699 (= (validMask!0 (mask!25916 thiss!1181)) (and (or (= (mask!25916 thiss!1181) #b00000000000000000000000000000111) (= (mask!25916 thiss!1181) #b00000000000000000000000000001111) (= (mask!25916 thiss!1181) #b00000000000000000000000000011111) (= (mask!25916 thiss!1181) #b00000000000000000000000000111111) (= (mask!25916 thiss!1181) #b00000000000000000000000001111111) (= (mask!25916 thiss!1181) #b00000000000000000000000011111111) (= (mask!25916 thiss!1181) #b00000000000000000000000111111111) (= (mask!25916 thiss!1181) #b00000000000000000000001111111111) (= (mask!25916 thiss!1181) #b00000000000000000000011111111111) (= (mask!25916 thiss!1181) #b00000000000000000000111111111111) (= (mask!25916 thiss!1181) #b00000000000000000001111111111111) (= (mask!25916 thiss!1181) #b00000000000000000011111111111111) (= (mask!25916 thiss!1181) #b00000000000000000111111111111111) (= (mask!25916 thiss!1181) #b00000000000000001111111111111111) (= (mask!25916 thiss!1181) #b00000000000000011111111111111111) (= (mask!25916 thiss!1181) #b00000000000000111111111111111111) (= (mask!25916 thiss!1181) #b00000000000001111111111111111111) (= (mask!25916 thiss!1181) #b00000000000011111111111111111111) (= (mask!25916 thiss!1181) #b00000000000111111111111111111111) (= (mask!25916 thiss!1181) #b00000000001111111111111111111111) (= (mask!25916 thiss!1181) #b00000000011111111111111111111111) (= (mask!25916 thiss!1181) #b00000000111111111111111111111111) (= (mask!25916 thiss!1181) #b00000001111111111111111111111111) (= (mask!25916 thiss!1181) #b00000011111111111111111111111111) (= (mask!25916 thiss!1181) #b00000111111111111111111111111111) (= (mask!25916 thiss!1181) #b00001111111111111111111111111111) (= (mask!25916 thiss!1181) #b00011111111111111111111111111111) (= (mask!25916 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25916 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!894803 d!110699))

(declare-fun b!894849 () Bool)

(declare-fun e!499892 () SeekEntryResult!8871)

(declare-fun e!499891 () SeekEntryResult!8871)

(assert (=> b!894849 (= e!499892 e!499891)))

(declare-fun lt!404375 () (_ BitVec 64))

(declare-fun lt!404374 () SeekEntryResult!8871)

(assert (=> b!894849 (= lt!404375 (select (arr!25209 (_keys!10047 thiss!1181)) (index!37857 lt!404374)))))

(declare-fun c!94457 () Bool)

(assert (=> b!894849 (= c!94457 (= lt!404375 key!785))))

(declare-fun b!894850 () Bool)

(declare-fun e!499890 () SeekEntryResult!8871)

(declare-fun lt!404376 () SeekEntryResult!8871)

(assert (=> b!894850 (= e!499890 (ite ((_ is MissingVacant!8871) lt!404376) (MissingZero!8871 (index!37858 lt!404376)) lt!404376))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52420 (_ BitVec 32)) SeekEntryResult!8871)

(assert (=> b!894850 (= lt!404376 (seekKeyOrZeroReturnVacant!0 (x!76092 lt!404374) (index!37857 lt!404374) (index!37857 lt!404374) key!785 (_keys!10047 thiss!1181) (mask!25916 thiss!1181)))))

(declare-fun b!894851 () Bool)

(assert (=> b!894851 (= e!499891 (Found!8871 (index!37857 lt!404374)))))

(declare-fun b!894852 () Bool)

(declare-fun c!94455 () Bool)

(assert (=> b!894852 (= c!94455 (= lt!404375 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894852 (= e!499891 e!499890)))

(declare-fun b!894853 () Bool)

(assert (=> b!894853 (= e!499890 (MissingZero!8871 (index!37857 lt!404374)))))

(declare-fun d!110701 () Bool)

(declare-fun lt!404377 () SeekEntryResult!8871)

(assert (=> d!110701 (and (or ((_ is MissingVacant!8871) lt!404377) (not ((_ is Found!8871) lt!404377)) (and (bvsge (index!37856 lt!404377) #b00000000000000000000000000000000) (bvslt (index!37856 lt!404377) (size!25656 (_keys!10047 thiss!1181))))) (not ((_ is MissingVacant!8871) lt!404377)) (or (not ((_ is Found!8871) lt!404377)) (= (select (arr!25209 (_keys!10047 thiss!1181)) (index!37856 lt!404377)) key!785)))))

(assert (=> d!110701 (= lt!404377 e!499892)))

(declare-fun c!94456 () Bool)

(assert (=> d!110701 (= c!94456 (and ((_ is Intermediate!8871) lt!404374) (undefined!9683 lt!404374)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52420 (_ BitVec 32)) SeekEntryResult!8871)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110701 (= lt!404374 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25916 thiss!1181)) key!785 (_keys!10047 thiss!1181) (mask!25916 thiss!1181)))))

(assert (=> d!110701 (validMask!0 (mask!25916 thiss!1181))))

(assert (=> d!110701 (= (seekEntry!0 key!785 (_keys!10047 thiss!1181) (mask!25916 thiss!1181)) lt!404377)))

(declare-fun b!894854 () Bool)

(assert (=> b!894854 (= e!499892 Undefined!8871)))

(assert (= (and d!110701 c!94456) b!894854))

(assert (= (and d!110701 (not c!94456)) b!894849))

(assert (= (and b!894849 c!94457) b!894851))

(assert (= (and b!894849 (not c!94457)) b!894852))

(assert (= (and b!894852 c!94455) b!894853))

(assert (= (and b!894852 (not c!94455)) b!894850))

(declare-fun m!832735 () Bool)

(assert (=> b!894849 m!832735))

(declare-fun m!832737 () Bool)

(assert (=> b!894850 m!832737))

(declare-fun m!832739 () Bool)

(assert (=> d!110701 m!832739))

(declare-fun m!832741 () Bool)

(assert (=> d!110701 m!832741))

(assert (=> d!110701 m!832741))

(declare-fun m!832743 () Bool)

(assert (=> d!110701 m!832743))

(assert (=> d!110701 m!832707))

(assert (=> b!894803 d!110701))

(declare-fun mapIsEmpty!28906 () Bool)

(declare-fun mapRes!28906 () Bool)

(assert (=> mapIsEmpty!28906 mapRes!28906))

(declare-fun b!894862 () Bool)

(declare-fun e!499897 () Bool)

(assert (=> b!894862 (= e!499897 tp_is_empty!18213)))

(declare-fun mapNonEmpty!28906 () Bool)

(declare-fun tp!55659 () Bool)

(declare-fun e!499898 () Bool)

(assert (=> mapNonEmpty!28906 (= mapRes!28906 (and tp!55659 e!499898))))

(declare-fun mapValue!28906 () ValueCell!8625)

(declare-fun mapRest!28906 () (Array (_ BitVec 32) ValueCell!8625))

(declare-fun mapKey!28906 () (_ BitVec 32))

(assert (=> mapNonEmpty!28906 (= mapRest!28900 (store mapRest!28906 mapKey!28906 mapValue!28906))))

(declare-fun condMapEmpty!28906 () Bool)

(declare-fun mapDefault!28906 () ValueCell!8625)

(assert (=> mapNonEmpty!28900 (= condMapEmpty!28906 (= mapRest!28900 ((as const (Array (_ BitVec 32) ValueCell!8625)) mapDefault!28906)))))

(assert (=> mapNonEmpty!28900 (= tp!55650 (and e!499897 mapRes!28906))))

(declare-fun b!894861 () Bool)

(assert (=> b!894861 (= e!499898 tp_is_empty!18213)))

(assert (= (and mapNonEmpty!28900 condMapEmpty!28906) mapIsEmpty!28906))

(assert (= (and mapNonEmpty!28900 (not condMapEmpty!28906)) mapNonEmpty!28906))

(assert (= (and mapNonEmpty!28906 ((_ is ValueCellFull!8625) mapValue!28906)) b!894861))

(assert (= (and mapNonEmpty!28900 ((_ is ValueCellFull!8625) mapDefault!28906)) b!894862))

(declare-fun m!832745 () Bool)

(assert (=> mapNonEmpty!28906 m!832745))

(check-sat (not b!894835) (not b!894836) (not mapNonEmpty!28906) (not b!894850) b_and!26177 (not b_next!15885) (not b!894834) (not d!110693) tp_is_empty!18213 (not d!110701))
(check-sat b_and!26177 (not b_next!15885))
(get-model)

(declare-fun b!894881 () Bool)

(declare-fun lt!404383 () SeekEntryResult!8871)

(assert (=> b!894881 (and (bvsge (index!37857 lt!404383) #b00000000000000000000000000000000) (bvslt (index!37857 lt!404383) (size!25656 (_keys!10047 thiss!1181))))))

(declare-fun res!605499 () Bool)

(assert (=> b!894881 (= res!605499 (= (select (arr!25209 (_keys!10047 thiss!1181)) (index!37857 lt!404383)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!499913 () Bool)

(assert (=> b!894881 (=> res!605499 e!499913)))

(declare-fun b!894882 () Bool)

(declare-fun e!499911 () SeekEntryResult!8871)

(assert (=> b!894882 (= e!499911 (Intermediate!8871 false (toIndex!0 key!785 (mask!25916 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!894883 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894883 (= e!499911 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25916 thiss!1181)) #b00000000000000000000000000000000 (mask!25916 thiss!1181)) key!785 (_keys!10047 thiss!1181) (mask!25916 thiss!1181)))))

(declare-fun b!894884 () Bool)

(assert (=> b!894884 (and (bvsge (index!37857 lt!404383) #b00000000000000000000000000000000) (bvslt (index!37857 lt!404383) (size!25656 (_keys!10047 thiss!1181))))))

(assert (=> b!894884 (= e!499913 (= (select (arr!25209 (_keys!10047 thiss!1181)) (index!37857 lt!404383)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894885 () Bool)

(declare-fun e!499910 () Bool)

(declare-fun e!499912 () Bool)

(assert (=> b!894885 (= e!499910 e!499912)))

(declare-fun res!605501 () Bool)

(assert (=> b!894885 (= res!605501 (and ((_ is Intermediate!8871) lt!404383) (not (undefined!9683 lt!404383)) (bvslt (x!76092 lt!404383) #b01111111111111111111111111111110) (bvsge (x!76092 lt!404383) #b00000000000000000000000000000000) (bvsge (x!76092 lt!404383) #b00000000000000000000000000000000)))))

(assert (=> b!894885 (=> (not res!605501) (not e!499912))))

(declare-fun b!894886 () Bool)

(declare-fun e!499909 () SeekEntryResult!8871)

(assert (=> b!894886 (= e!499909 (Intermediate!8871 true (toIndex!0 key!785 (mask!25916 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!894887 () Bool)

(assert (=> b!894887 (= e!499910 (bvsge (x!76092 lt!404383) #b01111111111111111111111111111110))))

(declare-fun b!894888 () Bool)

(assert (=> b!894888 (and (bvsge (index!37857 lt!404383) #b00000000000000000000000000000000) (bvslt (index!37857 lt!404383) (size!25656 (_keys!10047 thiss!1181))))))

(declare-fun res!605500 () Bool)

(assert (=> b!894888 (= res!605500 (= (select (arr!25209 (_keys!10047 thiss!1181)) (index!37857 lt!404383)) key!785))))

(assert (=> b!894888 (=> res!605500 e!499913)))

(assert (=> b!894888 (= e!499912 e!499913)))

(declare-fun b!894889 () Bool)

(assert (=> b!894889 (= e!499909 e!499911)))

(declare-fun c!94466 () Bool)

(declare-fun lt!404382 () (_ BitVec 64))

(assert (=> b!894889 (= c!94466 (or (= lt!404382 key!785) (= (bvadd lt!404382 lt!404382) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!110703 () Bool)

(assert (=> d!110703 e!499910))

(declare-fun c!94465 () Bool)

(assert (=> d!110703 (= c!94465 (and ((_ is Intermediate!8871) lt!404383) (undefined!9683 lt!404383)))))

(assert (=> d!110703 (= lt!404383 e!499909)))

(declare-fun c!94464 () Bool)

(assert (=> d!110703 (= c!94464 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!110703 (= lt!404382 (select (arr!25209 (_keys!10047 thiss!1181)) (toIndex!0 key!785 (mask!25916 thiss!1181))))))

(assert (=> d!110703 (validMask!0 (mask!25916 thiss!1181))))

(assert (=> d!110703 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25916 thiss!1181)) key!785 (_keys!10047 thiss!1181) (mask!25916 thiss!1181)) lt!404383)))

(assert (= (and d!110703 c!94464) b!894886))

(assert (= (and d!110703 (not c!94464)) b!894889))

(assert (= (and b!894889 c!94466) b!894882))

(assert (= (and b!894889 (not c!94466)) b!894883))

(assert (= (and d!110703 c!94465) b!894887))

(assert (= (and d!110703 (not c!94465)) b!894885))

(assert (= (and b!894885 res!605501) b!894888))

(assert (= (and b!894888 (not res!605500)) b!894881))

(assert (= (and b!894881 (not res!605499)) b!894884))

(declare-fun m!832747 () Bool)

(assert (=> b!894881 m!832747))

(assert (=> d!110703 m!832741))

(declare-fun m!832749 () Bool)

(assert (=> d!110703 m!832749))

(assert (=> d!110703 m!832707))

(assert (=> b!894888 m!832747))

(assert (=> b!894883 m!832741))

(declare-fun m!832751 () Bool)

(assert (=> b!894883 m!832751))

(assert (=> b!894883 m!832751))

(declare-fun m!832753 () Bool)

(assert (=> b!894883 m!832753))

(assert (=> b!894884 m!832747))

(assert (=> d!110701 d!110703))

(declare-fun d!110705 () Bool)

(declare-fun lt!404389 () (_ BitVec 32))

(declare-fun lt!404388 () (_ BitVec 32))

(assert (=> d!110705 (= lt!404389 (bvmul (bvxor lt!404388 (bvlshr lt!404388 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110705 (= lt!404388 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110705 (and (bvsge (mask!25916 thiss!1181) #b00000000000000000000000000000000) (let ((res!605502 (let ((h!18940 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76109 (bvmul (bvxor h!18940 (bvlshr h!18940 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76109 (bvlshr x!76109 #b00000000000000000000000000001101)) (mask!25916 thiss!1181)))))) (and (bvslt res!605502 (bvadd (mask!25916 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605502 #b00000000000000000000000000000000))))))

(assert (=> d!110705 (= (toIndex!0 key!785 (mask!25916 thiss!1181)) (bvand (bvxor lt!404389 (bvlshr lt!404389 #b00000000000000000000000000001101)) (mask!25916 thiss!1181)))))

(assert (=> d!110701 d!110705))

(assert (=> d!110701 d!110699))

(declare-fun b!894898 () Bool)

(declare-fun e!499919 () (_ BitVec 32))

(declare-fun e!499918 () (_ BitVec 32))

(assert (=> b!894898 (= e!499919 e!499918)))

(declare-fun c!94472 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!894898 (= c!94472 (validKeyInArray!0 (select (arr!25209 (_keys!10047 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39727 () Bool)

(declare-fun call!39730 () (_ BitVec 32))

(assert (=> bm!39727 (= call!39730 (arrayCountValidKeys!0 (_keys!10047 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25656 (_keys!10047 thiss!1181))))))

(declare-fun b!894899 () Bool)

(assert (=> b!894899 (= e!499918 (bvadd #b00000000000000000000000000000001 call!39730))))

(declare-fun d!110707 () Bool)

(declare-fun lt!404392 () (_ BitVec 32))

(assert (=> d!110707 (and (bvsge lt!404392 #b00000000000000000000000000000000) (bvsle lt!404392 (bvsub (size!25656 (_keys!10047 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110707 (= lt!404392 e!499919)))

(declare-fun c!94471 () Bool)

(assert (=> d!110707 (= c!94471 (bvsge #b00000000000000000000000000000000 (size!25656 (_keys!10047 thiss!1181))))))

(assert (=> d!110707 (and (bvsle #b00000000000000000000000000000000 (size!25656 (_keys!10047 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25656 (_keys!10047 thiss!1181)) (size!25656 (_keys!10047 thiss!1181))))))

(assert (=> d!110707 (= (arrayCountValidKeys!0 (_keys!10047 thiss!1181) #b00000000000000000000000000000000 (size!25656 (_keys!10047 thiss!1181))) lt!404392)))

(declare-fun b!894900 () Bool)

(assert (=> b!894900 (= e!499918 call!39730)))

(declare-fun b!894901 () Bool)

(assert (=> b!894901 (= e!499919 #b00000000000000000000000000000000)))

(assert (= (and d!110707 c!94471) b!894901))

(assert (= (and d!110707 (not c!94471)) b!894898))

(assert (= (and b!894898 c!94472) b!894899))

(assert (= (and b!894898 (not c!94472)) b!894900))

(assert (= (or b!894899 b!894900) bm!39727))

(declare-fun m!832755 () Bool)

(assert (=> b!894898 m!832755))

(assert (=> b!894898 m!832755))

(declare-fun m!832757 () Bool)

(assert (=> b!894898 m!832757))

(declare-fun m!832759 () Bool)

(assert (=> bm!39727 m!832759))

(assert (=> b!894834 d!110707))

(declare-fun b!894910 () Bool)

(declare-fun res!605511 () Bool)

(declare-fun e!499922 () Bool)

(assert (=> b!894910 (=> (not res!605511) (not e!499922))))

(assert (=> b!894910 (= res!605511 (and (= (size!25657 (_values!5332 thiss!1181)) (bvadd (mask!25916 thiss!1181) #b00000000000000000000000000000001)) (= (size!25656 (_keys!10047 thiss!1181)) (size!25657 (_values!5332 thiss!1181))) (bvsge (_size!2188 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2188 thiss!1181) (bvadd (mask!25916 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!894913 () Bool)

(assert (=> b!894913 (= e!499922 (and (bvsge (extraKeys!5041 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5041 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2188 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun d!110709 () Bool)

(declare-fun res!605514 () Bool)

(assert (=> d!110709 (=> (not res!605514) (not e!499922))))

(assert (=> d!110709 (= res!605514 (validMask!0 (mask!25916 thiss!1181)))))

(assert (=> d!110709 (= (simpleValid!302 thiss!1181) e!499922)))

(declare-fun b!894912 () Bool)

(declare-fun res!605513 () Bool)

(assert (=> b!894912 (=> (not res!605513) (not e!499922))))

(declare-fun size!25660 (LongMapFixedSize!4266) (_ BitVec 32))

(assert (=> b!894912 (= res!605513 (= (size!25660 thiss!1181) (bvadd (_size!2188 thiss!1181) (bvsdiv (bvadd (extraKeys!5041 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!894911 () Bool)

(declare-fun res!605512 () Bool)

(assert (=> b!894911 (=> (not res!605512) (not e!499922))))

(assert (=> b!894911 (= res!605512 (bvsge (size!25660 thiss!1181) (_size!2188 thiss!1181)))))

(assert (= (and d!110709 res!605514) b!894910))

(assert (= (and b!894910 res!605511) b!894911))

(assert (= (and b!894911 res!605512) b!894912))

(assert (= (and b!894912 res!605513) b!894913))

(assert (=> d!110709 m!832707))

(declare-fun m!832761 () Bool)

(assert (=> b!894912 m!832761))

(assert (=> b!894911 m!832761))

(assert (=> d!110693 d!110709))

(declare-fun b!894926 () Bool)

(declare-fun e!499930 () SeekEntryResult!8871)

(assert (=> b!894926 (= e!499930 (Found!8871 (index!37857 lt!404374)))))

(declare-fun b!894927 () Bool)

(declare-fun e!499929 () SeekEntryResult!8871)

(assert (=> b!894927 (= e!499929 Undefined!8871)))

(declare-fun b!894928 () Bool)

(declare-fun c!94481 () Bool)

(declare-fun lt!404397 () (_ BitVec 64))

(assert (=> b!894928 (= c!94481 (= lt!404397 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!499931 () SeekEntryResult!8871)

(assert (=> b!894928 (= e!499930 e!499931)))

(declare-fun lt!404398 () SeekEntryResult!8871)

(declare-fun d!110711 () Bool)

(assert (=> d!110711 (and (or ((_ is Undefined!8871) lt!404398) (not ((_ is Found!8871) lt!404398)) (and (bvsge (index!37856 lt!404398) #b00000000000000000000000000000000) (bvslt (index!37856 lt!404398) (size!25656 (_keys!10047 thiss!1181))))) (or ((_ is Undefined!8871) lt!404398) ((_ is Found!8871) lt!404398) (not ((_ is MissingVacant!8871) lt!404398)) (not (= (index!37858 lt!404398) (index!37857 lt!404374))) (and (bvsge (index!37858 lt!404398) #b00000000000000000000000000000000) (bvslt (index!37858 lt!404398) (size!25656 (_keys!10047 thiss!1181))))) (or ((_ is Undefined!8871) lt!404398) (ite ((_ is Found!8871) lt!404398) (= (select (arr!25209 (_keys!10047 thiss!1181)) (index!37856 lt!404398)) key!785) (and ((_ is MissingVacant!8871) lt!404398) (= (index!37858 lt!404398) (index!37857 lt!404374)) (= (select (arr!25209 (_keys!10047 thiss!1181)) (index!37858 lt!404398)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!110711 (= lt!404398 e!499929)))

(declare-fun c!94479 () Bool)

(assert (=> d!110711 (= c!94479 (bvsge (x!76092 lt!404374) #b01111111111111111111111111111110))))

(assert (=> d!110711 (= lt!404397 (select (arr!25209 (_keys!10047 thiss!1181)) (index!37857 lt!404374)))))

(assert (=> d!110711 (validMask!0 (mask!25916 thiss!1181))))

(assert (=> d!110711 (= (seekKeyOrZeroReturnVacant!0 (x!76092 lt!404374) (index!37857 lt!404374) (index!37857 lt!404374) key!785 (_keys!10047 thiss!1181) (mask!25916 thiss!1181)) lt!404398)))

(declare-fun b!894929 () Bool)

(assert (=> b!894929 (= e!499929 e!499930)))

(declare-fun c!94480 () Bool)

(assert (=> b!894929 (= c!94480 (= lt!404397 key!785))))

(declare-fun b!894930 () Bool)

(assert (=> b!894930 (= e!499931 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76092 lt!404374) #b00000000000000000000000000000001) (nextIndex!0 (index!37857 lt!404374) (x!76092 lt!404374) (mask!25916 thiss!1181)) (index!37857 lt!404374) key!785 (_keys!10047 thiss!1181) (mask!25916 thiss!1181)))))

(declare-fun b!894931 () Bool)

(assert (=> b!894931 (= e!499931 (MissingVacant!8871 (index!37857 lt!404374)))))

(assert (= (and d!110711 c!94479) b!894927))

(assert (= (and d!110711 (not c!94479)) b!894929))

(assert (= (and b!894929 c!94480) b!894926))

(assert (= (and b!894929 (not c!94480)) b!894928))

(assert (= (and b!894928 c!94481) b!894931))

(assert (= (and b!894928 (not c!94481)) b!894930))

(declare-fun m!832763 () Bool)

(assert (=> d!110711 m!832763))

(declare-fun m!832765 () Bool)

(assert (=> d!110711 m!832765))

(assert (=> d!110711 m!832735))

(assert (=> d!110711 m!832707))

(declare-fun m!832767 () Bool)

(assert (=> b!894930 m!832767))

(assert (=> b!894930 m!832767))

(declare-fun m!832769 () Bool)

(assert (=> b!894930 m!832769))

(assert (=> b!894850 d!110711))

(declare-fun b!894942 () Bool)

(declare-fun e!499943 () Bool)

(declare-fun e!499940 () Bool)

(assert (=> b!894942 (= e!499943 e!499940)))

(declare-fun c!94484 () Bool)

(assert (=> b!894942 (= c!94484 (validKeyInArray!0 (select (arr!25209 (_keys!10047 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894943 () Bool)

(declare-fun call!39733 () Bool)

(assert (=> b!894943 (= e!499940 call!39733)))

(declare-fun d!110713 () Bool)

(declare-fun res!605522 () Bool)

(declare-fun e!499941 () Bool)

(assert (=> d!110713 (=> res!605522 e!499941)))

(assert (=> d!110713 (= res!605522 (bvsge #b00000000000000000000000000000000 (size!25656 (_keys!10047 thiss!1181))))))

(assert (=> d!110713 (= (arrayNoDuplicates!0 (_keys!10047 thiss!1181) #b00000000000000000000000000000000 Nil!17806) e!499941)))

(declare-fun b!894944 () Bool)

(declare-fun e!499942 () Bool)

(declare-fun contains!4395 (List!17809 (_ BitVec 64)) Bool)

(assert (=> b!894944 (= e!499942 (contains!4395 Nil!17806 (select (arr!25209 (_keys!10047 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39730 () Bool)

(assert (=> bm!39730 (= call!39733 (arrayNoDuplicates!0 (_keys!10047 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94484 (Cons!17805 (select (arr!25209 (_keys!10047 thiss!1181)) #b00000000000000000000000000000000) Nil!17806) Nil!17806)))))

(declare-fun b!894945 () Bool)

(assert (=> b!894945 (= e!499941 e!499943)))

(declare-fun res!605521 () Bool)

(assert (=> b!894945 (=> (not res!605521) (not e!499943))))

(assert (=> b!894945 (= res!605521 (not e!499942))))

(declare-fun res!605523 () Bool)

(assert (=> b!894945 (=> (not res!605523) (not e!499942))))

(assert (=> b!894945 (= res!605523 (validKeyInArray!0 (select (arr!25209 (_keys!10047 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894946 () Bool)

(assert (=> b!894946 (= e!499940 call!39733)))

(assert (= (and d!110713 (not res!605522)) b!894945))

(assert (= (and b!894945 res!605523) b!894944))

(assert (= (and b!894945 res!605521) b!894942))

(assert (= (and b!894942 c!94484) b!894943))

(assert (= (and b!894942 (not c!94484)) b!894946))

(assert (= (or b!894943 b!894946) bm!39730))

(assert (=> b!894942 m!832755))

(assert (=> b!894942 m!832755))

(assert (=> b!894942 m!832757))

(assert (=> b!894944 m!832755))

(assert (=> b!894944 m!832755))

(declare-fun m!832771 () Bool)

(assert (=> b!894944 m!832771))

(assert (=> bm!39730 m!832755))

(declare-fun m!832773 () Bool)

(assert (=> bm!39730 m!832773))

(assert (=> b!894945 m!832755))

(assert (=> b!894945 m!832755))

(assert (=> b!894945 m!832757))

(assert (=> b!894836 d!110713))

(declare-fun b!894956 () Bool)

(declare-fun e!499950 () Bool)

(declare-fun e!499951 () Bool)

(assert (=> b!894956 (= e!499950 e!499951)))

(declare-fun c!94487 () Bool)

(assert (=> b!894956 (= c!94487 (validKeyInArray!0 (select (arr!25209 (_keys!10047 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39733 () Bool)

(declare-fun call!39736 () Bool)

(assert (=> bm!39733 (= call!39736 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10047 thiss!1181) (mask!25916 thiss!1181)))))

(declare-fun b!894957 () Bool)

(declare-fun e!499952 () Bool)

(assert (=> b!894957 (= e!499952 call!39736)))

(declare-fun b!894958 () Bool)

(assert (=> b!894958 (= e!499951 call!39736)))

(declare-fun b!894955 () Bool)

(assert (=> b!894955 (= e!499951 e!499952)))

(declare-fun lt!404405 () (_ BitVec 64))

(assert (=> b!894955 (= lt!404405 (select (arr!25209 (_keys!10047 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30456 0))(
  ( (Unit!30457) )
))
(declare-fun lt!404406 () Unit!30456)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52420 (_ BitVec 64) (_ BitVec 32)) Unit!30456)

(assert (=> b!894955 (= lt!404406 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10047 thiss!1181) lt!404405 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!894955 (arrayContainsKey!0 (_keys!10047 thiss!1181) lt!404405 #b00000000000000000000000000000000)))

(declare-fun lt!404407 () Unit!30456)

(assert (=> b!894955 (= lt!404407 lt!404406)))

(declare-fun res!605529 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52420 (_ BitVec 32)) SeekEntryResult!8871)

(assert (=> b!894955 (= res!605529 (= (seekEntryOrOpen!0 (select (arr!25209 (_keys!10047 thiss!1181)) #b00000000000000000000000000000000) (_keys!10047 thiss!1181) (mask!25916 thiss!1181)) (Found!8871 #b00000000000000000000000000000000)))))

(assert (=> b!894955 (=> (not res!605529) (not e!499952))))

(declare-fun d!110715 () Bool)

(declare-fun res!605528 () Bool)

(assert (=> d!110715 (=> res!605528 e!499950)))

(assert (=> d!110715 (= res!605528 (bvsge #b00000000000000000000000000000000 (size!25656 (_keys!10047 thiss!1181))))))

(assert (=> d!110715 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10047 thiss!1181) (mask!25916 thiss!1181)) e!499950)))

(assert (= (and d!110715 (not res!605528)) b!894956))

(assert (= (and b!894956 c!94487) b!894955))

(assert (= (and b!894956 (not c!94487)) b!894958))

(assert (= (and b!894955 res!605529) b!894957))

(assert (= (or b!894957 b!894958) bm!39733))

(assert (=> b!894956 m!832755))

(assert (=> b!894956 m!832755))

(assert (=> b!894956 m!832757))

(declare-fun m!832775 () Bool)

(assert (=> bm!39733 m!832775))

(assert (=> b!894955 m!832755))

(declare-fun m!832777 () Bool)

(assert (=> b!894955 m!832777))

(declare-fun m!832779 () Bool)

(assert (=> b!894955 m!832779))

(assert (=> b!894955 m!832755))

(declare-fun m!832781 () Bool)

(assert (=> b!894955 m!832781))

(assert (=> b!894835 d!110715))

(declare-fun mapIsEmpty!28907 () Bool)

(declare-fun mapRes!28907 () Bool)

(assert (=> mapIsEmpty!28907 mapRes!28907))

(declare-fun b!894960 () Bool)

(declare-fun e!499953 () Bool)

(assert (=> b!894960 (= e!499953 tp_is_empty!18213)))

(declare-fun mapNonEmpty!28907 () Bool)

(declare-fun tp!55660 () Bool)

(declare-fun e!499954 () Bool)

(assert (=> mapNonEmpty!28907 (= mapRes!28907 (and tp!55660 e!499954))))

(declare-fun mapValue!28907 () ValueCell!8625)

(declare-fun mapKey!28907 () (_ BitVec 32))

(declare-fun mapRest!28907 () (Array (_ BitVec 32) ValueCell!8625))

(assert (=> mapNonEmpty!28907 (= mapRest!28906 (store mapRest!28907 mapKey!28907 mapValue!28907))))

(declare-fun condMapEmpty!28907 () Bool)

(declare-fun mapDefault!28907 () ValueCell!8625)

(assert (=> mapNonEmpty!28906 (= condMapEmpty!28907 (= mapRest!28906 ((as const (Array (_ BitVec 32) ValueCell!8625)) mapDefault!28907)))))

(assert (=> mapNonEmpty!28906 (= tp!55659 (and e!499953 mapRes!28907))))

(declare-fun b!894959 () Bool)

(assert (=> b!894959 (= e!499954 tp_is_empty!18213)))

(assert (= (and mapNonEmpty!28906 condMapEmpty!28907) mapIsEmpty!28907))

(assert (= (and mapNonEmpty!28906 (not condMapEmpty!28907)) mapNonEmpty!28907))

(assert (= (and mapNonEmpty!28907 ((_ is ValueCellFull!8625) mapValue!28907)) b!894959))

(assert (= (and mapNonEmpty!28906 ((_ is ValueCellFull!8625) mapDefault!28907)) b!894960))

(declare-fun m!832783 () Bool)

(assert (=> mapNonEmpty!28907 m!832783))

(check-sat (not d!110703) (not bm!39727) (not b!894898) (not b!894955) (not b!894883) (not b!894930) b_and!26177 tp_is_empty!18213 (not b!894945) (not d!110711) (not b!894956) (not b!894942) (not d!110709) (not b!894911) (not b!894944) (not b_next!15885) (not b!894912) (not bm!39730) (not bm!39733) (not mapNonEmpty!28907))
(check-sat b_and!26177 (not b_next!15885))
