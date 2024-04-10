; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34088 () Bool)

(assert start!34088)

(declare-fun b_free!7167 () Bool)

(declare-fun b_next!7167 () Bool)

(assert (=> start!34088 (= b_free!7167 (not b_next!7167))))

(declare-fun tp!25025 () Bool)

(declare-fun b_and!14361 () Bool)

(assert (=> start!34088 (= tp!25025 b_and!14361)))

(declare-fun b!339756 () Bool)

(declare-fun res!187681 () Bool)

(declare-fun e!208440 () Bool)

(assert (=> b!339756 (=> (not res!187681) (not e!208440))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339756 (= res!187681 (validKeyInArray!0 k0!1348))))

(declare-fun b!339757 () Bool)

(declare-fun res!187682 () Bool)

(assert (=> b!339757 (=> (not res!187682) (not e!208440))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10469 0))(
  ( (V!10470 (val!3604 Int)) )
))
(declare-fun zeroValue!1467 () V!10469)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3216 0))(
  ( (ValueCellFull!3216 (v!5773 V!10469)) (EmptyCell!3216) )
))
(declare-datatypes ((array!17837 0))(
  ( (array!17838 (arr!8442 (Array (_ BitVec 32) ValueCell!3216)) (size!8794 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17837)

(declare-datatypes ((array!17839 0))(
  ( (array!17840 (arr!8443 (Array (_ BitVec 32) (_ BitVec 64))) (size!8795 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17839)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10469)

(declare-datatypes ((tuple2!5234 0))(
  ( (tuple2!5235 (_1!2628 (_ BitVec 64)) (_2!2628 V!10469)) )
))
(declare-datatypes ((List!4853 0))(
  ( (Nil!4850) (Cons!4849 (h!5705 tuple2!5234) (t!9955 List!4853)) )
))
(declare-datatypes ((ListLongMap!4147 0))(
  ( (ListLongMap!4148 (toList!2089 List!4853)) )
))
(declare-fun contains!2140 (ListLongMap!4147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1610 (array!17839 array!17837 (_ BitVec 32) (_ BitVec 32) V!10469 V!10469 (_ BitVec 32) Int) ListLongMap!4147)

(assert (=> b!339757 (= res!187682 (not (contains!2140 (getCurrentListMap!1610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!339758 () Bool)

(declare-fun res!187683 () Bool)

(assert (=> b!339758 (=> (not res!187683) (not e!208440))))

(assert (=> b!339758 (= res!187683 (and (= (size!8794 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8795 _keys!1895) (size!8794 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12096 () Bool)

(declare-fun mapRes!12096 () Bool)

(assert (=> mapIsEmpty!12096 mapRes!12096))

(declare-fun mapNonEmpty!12096 () Bool)

(declare-fun tp!25026 () Bool)

(declare-fun e!208439 () Bool)

(assert (=> mapNonEmpty!12096 (= mapRes!12096 (and tp!25026 e!208439))))

(declare-fun mapRest!12096 () (Array (_ BitVec 32) ValueCell!3216))

(declare-fun mapValue!12096 () ValueCell!3216)

(declare-fun mapKey!12096 () (_ BitVec 32))

(assert (=> mapNonEmpty!12096 (= (arr!8442 _values!1525) (store mapRest!12096 mapKey!12096 mapValue!12096))))

(declare-fun b!339759 () Bool)

(declare-fun e!208437 () Bool)

(declare-fun e!208438 () Bool)

(assert (=> b!339759 (= e!208437 (and e!208438 mapRes!12096))))

(declare-fun condMapEmpty!12096 () Bool)

(declare-fun mapDefault!12096 () ValueCell!3216)

(assert (=> b!339759 (= condMapEmpty!12096 (= (arr!8442 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3216)) mapDefault!12096)))))

(declare-fun b!339760 () Bool)

(declare-fun tp_is_empty!7119 () Bool)

(assert (=> b!339760 (= e!208439 tp_is_empty!7119)))

(declare-fun res!187685 () Bool)

(assert (=> start!34088 (=> (not res!187685) (not e!208440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34088 (= res!187685 (validMask!0 mask!2385))))

(assert (=> start!34088 e!208440))

(assert (=> start!34088 true))

(assert (=> start!34088 tp_is_empty!7119))

(assert (=> start!34088 tp!25025))

(declare-fun array_inv!6258 (array!17837) Bool)

(assert (=> start!34088 (and (array_inv!6258 _values!1525) e!208437)))

(declare-fun array_inv!6259 (array!17839) Bool)

(assert (=> start!34088 (array_inv!6259 _keys!1895)))

(declare-fun b!339761 () Bool)

(declare-datatypes ((SeekEntryResult!3261 0))(
  ( (MissingZero!3261 (index!15223 (_ BitVec 32))) (Found!3261 (index!15224 (_ BitVec 32))) (Intermediate!3261 (undefined!4073 Bool) (index!15225 (_ BitVec 32)) (x!33841 (_ BitVec 32))) (Undefined!3261) (MissingVacant!3261 (index!15226 (_ BitVec 32))) )
))
(declare-fun lt!161269 () SeekEntryResult!3261)

(get-info :version)

(assert (=> b!339761 (= e!208440 (and (not ((_ is Found!3261) lt!161269)) (not ((_ is MissingZero!3261) lt!161269)) ((_ is MissingVacant!3261) lt!161269) (bvsge #b00000000000000000000000000000000 (size!8795 _keys!1895))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17839 (_ BitVec 32)) SeekEntryResult!3261)

(assert (=> b!339761 (= lt!161269 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339762 () Bool)

(declare-fun res!187680 () Bool)

(assert (=> b!339762 (=> (not res!187680) (not e!208440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17839 (_ BitVec 32)) Bool)

(assert (=> b!339762 (= res!187680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339763 () Bool)

(declare-fun res!187684 () Bool)

(assert (=> b!339763 (=> (not res!187684) (not e!208440))))

(declare-datatypes ((List!4854 0))(
  ( (Nil!4851) (Cons!4850 (h!5706 (_ BitVec 64)) (t!9956 List!4854)) )
))
(declare-fun arrayNoDuplicates!0 (array!17839 (_ BitVec 32) List!4854) Bool)

(assert (=> b!339763 (= res!187684 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4851))))

(declare-fun b!339764 () Bool)

(assert (=> b!339764 (= e!208438 tp_is_empty!7119)))

(assert (= (and start!34088 res!187685) b!339758))

(assert (= (and b!339758 res!187683) b!339762))

(assert (= (and b!339762 res!187680) b!339763))

(assert (= (and b!339763 res!187684) b!339756))

(assert (= (and b!339756 res!187681) b!339757))

(assert (= (and b!339757 res!187682) b!339761))

(assert (= (and b!339759 condMapEmpty!12096) mapIsEmpty!12096))

(assert (= (and b!339759 (not condMapEmpty!12096)) mapNonEmpty!12096))

(assert (= (and mapNonEmpty!12096 ((_ is ValueCellFull!3216) mapValue!12096)) b!339760))

(assert (= (and b!339759 ((_ is ValueCellFull!3216) mapDefault!12096)) b!339764))

(assert (= start!34088 b!339759))

(declare-fun m!342649 () Bool)

(assert (=> mapNonEmpty!12096 m!342649))

(declare-fun m!342651 () Bool)

(assert (=> b!339761 m!342651))

(declare-fun m!342653 () Bool)

(assert (=> start!34088 m!342653))

(declare-fun m!342655 () Bool)

(assert (=> start!34088 m!342655))

(declare-fun m!342657 () Bool)

(assert (=> start!34088 m!342657))

(declare-fun m!342659 () Bool)

(assert (=> b!339757 m!342659))

(assert (=> b!339757 m!342659))

(declare-fun m!342661 () Bool)

(assert (=> b!339757 m!342661))

(declare-fun m!342663 () Bool)

(assert (=> b!339763 m!342663))

(declare-fun m!342665 () Bool)

(assert (=> b!339762 m!342665))

(declare-fun m!342667 () Bool)

(assert (=> b!339756 m!342667))

(check-sat (not start!34088) (not b_next!7167) (not b!339762) (not b!339763) b_and!14361 (not b!339756) (not b!339757) tp_is_empty!7119 (not b!339761) (not mapNonEmpty!12096))
(check-sat b_and!14361 (not b_next!7167))
(get-model)

(declare-fun b!339800 () Bool)

(declare-fun e!208463 () Bool)

(declare-fun e!208462 () Bool)

(assert (=> b!339800 (= e!208463 e!208462)))

(declare-fun lt!161279 () (_ BitVec 64))

(assert (=> b!339800 (= lt!161279 (select (arr!8443 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10593 0))(
  ( (Unit!10594) )
))
(declare-fun lt!161281 () Unit!10593)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17839 (_ BitVec 64) (_ BitVec 32)) Unit!10593)

(assert (=> b!339800 (= lt!161281 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!161279 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339800 (arrayContainsKey!0 _keys!1895 lt!161279 #b00000000000000000000000000000000)))

(declare-fun lt!161280 () Unit!10593)

(assert (=> b!339800 (= lt!161280 lt!161281)))

(declare-fun res!187708 () Bool)

(assert (=> b!339800 (= res!187708 (= (seekEntryOrOpen!0 (select (arr!8443 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3261 #b00000000000000000000000000000000)))))

(assert (=> b!339800 (=> (not res!187708) (not e!208462))))

(declare-fun b!339801 () Bool)

(declare-fun call!26488 () Bool)

(assert (=> b!339801 (= e!208463 call!26488)))

(declare-fun bm!26485 () Bool)

(assert (=> bm!26485 (= call!26488 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!70867 () Bool)

(declare-fun res!187709 () Bool)

(declare-fun e!208464 () Bool)

(assert (=> d!70867 (=> res!187709 e!208464)))

(assert (=> d!70867 (= res!187709 (bvsge #b00000000000000000000000000000000 (size!8795 _keys!1895)))))

(assert (=> d!70867 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!208464)))

(declare-fun b!339802 () Bool)

(assert (=> b!339802 (= e!208462 call!26488)))

(declare-fun b!339803 () Bool)

(assert (=> b!339803 (= e!208464 e!208463)))

(declare-fun c!52578 () Bool)

(assert (=> b!339803 (= c!52578 (validKeyInArray!0 (select (arr!8443 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70867 (not res!187709)) b!339803))

(assert (= (and b!339803 c!52578) b!339800))

(assert (= (and b!339803 (not c!52578)) b!339801))

(assert (= (and b!339800 res!187708) b!339802))

(assert (= (or b!339802 b!339801) bm!26485))

(declare-fun m!342689 () Bool)

(assert (=> b!339800 m!342689))

(declare-fun m!342691 () Bool)

(assert (=> b!339800 m!342691))

(declare-fun m!342693 () Bool)

(assert (=> b!339800 m!342693))

(assert (=> b!339800 m!342689))

(declare-fun m!342695 () Bool)

(assert (=> b!339800 m!342695))

(declare-fun m!342697 () Bool)

(assert (=> bm!26485 m!342697))

(assert (=> b!339803 m!342689))

(assert (=> b!339803 m!342689))

(declare-fun m!342699 () Bool)

(assert (=> b!339803 m!342699))

(assert (=> b!339762 d!70867))

(declare-fun b!339814 () Bool)

(declare-fun e!208476 () Bool)

(declare-fun call!26491 () Bool)

(assert (=> b!339814 (= e!208476 call!26491)))

(declare-fun b!339815 () Bool)

(declare-fun e!208475 () Bool)

(assert (=> b!339815 (= e!208475 e!208476)))

(declare-fun c!52581 () Bool)

(assert (=> b!339815 (= c!52581 (validKeyInArray!0 (select (arr!8443 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26488 () Bool)

(assert (=> bm!26488 (= call!26491 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52581 (Cons!4850 (select (arr!8443 _keys!1895) #b00000000000000000000000000000000) Nil!4851) Nil!4851)))))

(declare-fun d!70869 () Bool)

(declare-fun res!187717 () Bool)

(declare-fun e!208474 () Bool)

(assert (=> d!70869 (=> res!187717 e!208474)))

(assert (=> d!70869 (= res!187717 (bvsge #b00000000000000000000000000000000 (size!8795 _keys!1895)))))

(assert (=> d!70869 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4851) e!208474)))

(declare-fun b!339816 () Bool)

(assert (=> b!339816 (= e!208476 call!26491)))

(declare-fun b!339817 () Bool)

(declare-fun e!208473 () Bool)

(declare-fun contains!2141 (List!4854 (_ BitVec 64)) Bool)

(assert (=> b!339817 (= e!208473 (contains!2141 Nil!4851 (select (arr!8443 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339818 () Bool)

(assert (=> b!339818 (= e!208474 e!208475)))

(declare-fun res!187716 () Bool)

(assert (=> b!339818 (=> (not res!187716) (not e!208475))))

(assert (=> b!339818 (= res!187716 (not e!208473))))

(declare-fun res!187718 () Bool)

(assert (=> b!339818 (=> (not res!187718) (not e!208473))))

(assert (=> b!339818 (= res!187718 (validKeyInArray!0 (select (arr!8443 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70869 (not res!187717)) b!339818))

(assert (= (and b!339818 res!187718) b!339817))

(assert (= (and b!339818 res!187716) b!339815))

(assert (= (and b!339815 c!52581) b!339816))

(assert (= (and b!339815 (not c!52581)) b!339814))

(assert (= (or b!339816 b!339814) bm!26488))

(assert (=> b!339815 m!342689))

(assert (=> b!339815 m!342689))

(assert (=> b!339815 m!342699))

(assert (=> bm!26488 m!342689))

(declare-fun m!342701 () Bool)

(assert (=> bm!26488 m!342701))

(assert (=> b!339817 m!342689))

(assert (=> b!339817 m!342689))

(declare-fun m!342703 () Bool)

(assert (=> b!339817 m!342703))

(assert (=> b!339818 m!342689))

(assert (=> b!339818 m!342689))

(assert (=> b!339818 m!342699))

(assert (=> b!339763 d!70869))

(declare-fun b!339831 () Bool)

(declare-fun e!208485 () SeekEntryResult!3261)

(declare-fun e!208483 () SeekEntryResult!3261)

(assert (=> b!339831 (= e!208485 e!208483)))

(declare-fun lt!161290 () (_ BitVec 64))

(declare-fun lt!161289 () SeekEntryResult!3261)

(assert (=> b!339831 (= lt!161290 (select (arr!8443 _keys!1895) (index!15225 lt!161289)))))

(declare-fun c!52589 () Bool)

(assert (=> b!339831 (= c!52589 (= lt!161290 k0!1348))))

(declare-fun b!339832 () Bool)

(declare-fun e!208484 () SeekEntryResult!3261)

(assert (=> b!339832 (= e!208484 (MissingZero!3261 (index!15225 lt!161289)))))

(declare-fun b!339833 () Bool)

(assert (=> b!339833 (= e!208483 (Found!3261 (index!15225 lt!161289)))))

(declare-fun d!70871 () Bool)

(declare-fun lt!161288 () SeekEntryResult!3261)

(assert (=> d!70871 (and (or ((_ is Undefined!3261) lt!161288) (not ((_ is Found!3261) lt!161288)) (and (bvsge (index!15224 lt!161288) #b00000000000000000000000000000000) (bvslt (index!15224 lt!161288) (size!8795 _keys!1895)))) (or ((_ is Undefined!3261) lt!161288) ((_ is Found!3261) lt!161288) (not ((_ is MissingZero!3261) lt!161288)) (and (bvsge (index!15223 lt!161288) #b00000000000000000000000000000000) (bvslt (index!15223 lt!161288) (size!8795 _keys!1895)))) (or ((_ is Undefined!3261) lt!161288) ((_ is Found!3261) lt!161288) ((_ is MissingZero!3261) lt!161288) (not ((_ is MissingVacant!3261) lt!161288)) (and (bvsge (index!15226 lt!161288) #b00000000000000000000000000000000) (bvslt (index!15226 lt!161288) (size!8795 _keys!1895)))) (or ((_ is Undefined!3261) lt!161288) (ite ((_ is Found!3261) lt!161288) (= (select (arr!8443 _keys!1895) (index!15224 lt!161288)) k0!1348) (ite ((_ is MissingZero!3261) lt!161288) (= (select (arr!8443 _keys!1895) (index!15223 lt!161288)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3261) lt!161288) (= (select (arr!8443 _keys!1895) (index!15226 lt!161288)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70871 (= lt!161288 e!208485)))

(declare-fun c!52590 () Bool)

(assert (=> d!70871 (= c!52590 (and ((_ is Intermediate!3261) lt!161289) (undefined!4073 lt!161289)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17839 (_ BitVec 32)) SeekEntryResult!3261)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70871 (= lt!161289 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70871 (validMask!0 mask!2385)))

(assert (=> d!70871 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161288)))

(declare-fun b!339834 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17839 (_ BitVec 32)) SeekEntryResult!3261)

(assert (=> b!339834 (= e!208484 (seekKeyOrZeroReturnVacant!0 (x!33841 lt!161289) (index!15225 lt!161289) (index!15225 lt!161289) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339835 () Bool)

(assert (=> b!339835 (= e!208485 Undefined!3261)))

(declare-fun b!339836 () Bool)

(declare-fun c!52588 () Bool)

(assert (=> b!339836 (= c!52588 (= lt!161290 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!339836 (= e!208483 e!208484)))

(assert (= (and d!70871 c!52590) b!339835))

(assert (= (and d!70871 (not c!52590)) b!339831))

(assert (= (and b!339831 c!52589) b!339833))

(assert (= (and b!339831 (not c!52589)) b!339836))

(assert (= (and b!339836 c!52588) b!339832))

(assert (= (and b!339836 (not c!52588)) b!339834))

(declare-fun m!342705 () Bool)

(assert (=> b!339831 m!342705))

(assert (=> d!70871 m!342653))

(declare-fun m!342707 () Bool)

(assert (=> d!70871 m!342707))

(declare-fun m!342709 () Bool)

(assert (=> d!70871 m!342709))

(assert (=> d!70871 m!342707))

(declare-fun m!342711 () Bool)

(assert (=> d!70871 m!342711))

(declare-fun m!342713 () Bool)

(assert (=> d!70871 m!342713))

(declare-fun m!342715 () Bool)

(assert (=> d!70871 m!342715))

(declare-fun m!342717 () Bool)

(assert (=> b!339834 m!342717))

(assert (=> b!339761 d!70871))

(declare-fun d!70873 () Bool)

(assert (=> d!70873 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34088 d!70873))

(declare-fun d!70875 () Bool)

(assert (=> d!70875 (= (array_inv!6258 _values!1525) (bvsge (size!8794 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34088 d!70875))

(declare-fun d!70877 () Bool)

(assert (=> d!70877 (= (array_inv!6259 _keys!1895) (bvsge (size!8795 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34088 d!70877))

(declare-fun d!70879 () Bool)

(assert (=> d!70879 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!339756 d!70879))

(declare-fun d!70881 () Bool)

(declare-fun e!208490 () Bool)

(assert (=> d!70881 e!208490))

(declare-fun res!187721 () Bool)

(assert (=> d!70881 (=> res!187721 e!208490)))

(declare-fun lt!161300 () Bool)

(assert (=> d!70881 (= res!187721 (not lt!161300))))

(declare-fun lt!161301 () Bool)

(assert (=> d!70881 (= lt!161300 lt!161301)))

(declare-fun lt!161302 () Unit!10593)

(declare-fun e!208491 () Unit!10593)

(assert (=> d!70881 (= lt!161302 e!208491)))

(declare-fun c!52593 () Bool)

(assert (=> d!70881 (= c!52593 lt!161301)))

(declare-fun containsKey!323 (List!4853 (_ BitVec 64)) Bool)

(assert (=> d!70881 (= lt!161301 (containsKey!323 (toList!2089 (getCurrentListMap!1610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70881 (= (contains!2140 (getCurrentListMap!1610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!161300)))

(declare-fun b!339843 () Bool)

(declare-fun lt!161299 () Unit!10593)

(assert (=> b!339843 (= e!208491 lt!161299)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!271 (List!4853 (_ BitVec 64)) Unit!10593)

(assert (=> b!339843 (= lt!161299 (lemmaContainsKeyImpliesGetValueByKeyDefined!271 (toList!2089 (getCurrentListMap!1610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!337 0))(
  ( (Some!336 (v!5775 V!10469)) (None!335) )
))
(declare-fun isDefined!272 (Option!337) Bool)

(declare-fun getValueByKey!331 (List!4853 (_ BitVec 64)) Option!337)

(assert (=> b!339843 (isDefined!272 (getValueByKey!331 (toList!2089 (getCurrentListMap!1610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!339844 () Bool)

(declare-fun Unit!10595 () Unit!10593)

(assert (=> b!339844 (= e!208491 Unit!10595)))

(declare-fun b!339845 () Bool)

(assert (=> b!339845 (= e!208490 (isDefined!272 (getValueByKey!331 (toList!2089 (getCurrentListMap!1610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70881 c!52593) b!339843))

(assert (= (and d!70881 (not c!52593)) b!339844))

(assert (= (and d!70881 (not res!187721)) b!339845))

(declare-fun m!342719 () Bool)

(assert (=> d!70881 m!342719))

(declare-fun m!342721 () Bool)

(assert (=> b!339843 m!342721))

(declare-fun m!342723 () Bool)

(assert (=> b!339843 m!342723))

(assert (=> b!339843 m!342723))

(declare-fun m!342725 () Bool)

(assert (=> b!339843 m!342725))

(assert (=> b!339845 m!342723))

(assert (=> b!339845 m!342723))

(assert (=> b!339845 m!342725))

(assert (=> b!339757 d!70881))

(declare-fun b!339888 () Bool)

(declare-fun e!208522 () Bool)

(declare-fun e!208528 () Bool)

(assert (=> b!339888 (= e!208522 e!208528)))

(declare-fun res!187744 () Bool)

(assert (=> b!339888 (=> (not res!187744) (not e!208528))))

(declare-fun lt!161364 () ListLongMap!4147)

(assert (=> b!339888 (= res!187744 (contains!2140 lt!161364 (select (arr!8443 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!339888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8795 _keys!1895)))))

(declare-fun b!339889 () Bool)

(declare-fun e!208523 () ListLongMap!4147)

(declare-fun call!26509 () ListLongMap!4147)

(assert (=> b!339889 (= e!208523 call!26509)))

(declare-fun b!339890 () Bool)

(declare-fun e!208527 () Bool)

(declare-fun e!208519 () Bool)

(assert (=> b!339890 (= e!208527 e!208519)))

(declare-fun res!187741 () Bool)

(declare-fun call!26506 () Bool)

(assert (=> b!339890 (= res!187741 call!26506)))

(assert (=> b!339890 (=> (not res!187741) (not e!208519))))

(declare-fun b!339891 () Bool)

(declare-fun apply!273 (ListLongMap!4147 (_ BitVec 64)) V!10469)

(assert (=> b!339891 (= e!208519 (= (apply!273 lt!161364 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!339892 () Bool)

(declare-fun res!187745 () Bool)

(declare-fun e!208525 () Bool)

(assert (=> b!339892 (=> (not res!187745) (not e!208525))))

(assert (=> b!339892 (= res!187745 e!208522)))

(declare-fun res!187747 () Bool)

(assert (=> b!339892 (=> res!187747 e!208522)))

(declare-fun e!208526 () Bool)

(assert (=> b!339892 (= res!187747 (not e!208526))))

(declare-fun res!187740 () Bool)

(assert (=> b!339892 (=> (not res!187740) (not e!208526))))

(assert (=> b!339892 (= res!187740 (bvslt #b00000000000000000000000000000000 (size!8795 _keys!1895)))))

(declare-fun b!339893 () Bool)

(declare-fun e!208520 () Bool)

(assert (=> b!339893 (= e!208520 (validKeyInArray!0 (select (arr!8443 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26503 () Bool)

(declare-fun call!26510 () ListLongMap!4147)

(declare-fun getCurrentListMapNoExtraKeys!595 (array!17839 array!17837 (_ BitVec 32) (_ BitVec 32) V!10469 V!10469 (_ BitVec 32) Int) ListLongMap!4147)

(assert (=> bm!26503 (= call!26510 (getCurrentListMapNoExtraKeys!595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!339894 () Bool)

(declare-fun e!208524 () Unit!10593)

(declare-fun lt!161367 () Unit!10593)

(assert (=> b!339894 (= e!208524 lt!161367)))

(declare-fun lt!161357 () ListLongMap!4147)

(assert (=> b!339894 (= lt!161357 (getCurrentListMapNoExtraKeys!595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161363 () (_ BitVec 64))

(assert (=> b!339894 (= lt!161363 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161362 () (_ BitVec 64))

(assert (=> b!339894 (= lt!161362 (select (arr!8443 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161361 () Unit!10593)

(declare-fun addStillContains!249 (ListLongMap!4147 (_ BitVec 64) V!10469 (_ BitVec 64)) Unit!10593)

(assert (=> b!339894 (= lt!161361 (addStillContains!249 lt!161357 lt!161363 zeroValue!1467 lt!161362))))

(declare-fun +!722 (ListLongMap!4147 tuple2!5234) ListLongMap!4147)

(assert (=> b!339894 (contains!2140 (+!722 lt!161357 (tuple2!5235 lt!161363 zeroValue!1467)) lt!161362)))

(declare-fun lt!161349 () Unit!10593)

(assert (=> b!339894 (= lt!161349 lt!161361)))

(declare-fun lt!161354 () ListLongMap!4147)

(assert (=> b!339894 (= lt!161354 (getCurrentListMapNoExtraKeys!595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161365 () (_ BitVec 64))

(assert (=> b!339894 (= lt!161365 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161360 () (_ BitVec 64))

(assert (=> b!339894 (= lt!161360 (select (arr!8443 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161358 () Unit!10593)

(declare-fun addApplyDifferent!249 (ListLongMap!4147 (_ BitVec 64) V!10469 (_ BitVec 64)) Unit!10593)

(assert (=> b!339894 (= lt!161358 (addApplyDifferent!249 lt!161354 lt!161365 minValue!1467 lt!161360))))

(assert (=> b!339894 (= (apply!273 (+!722 lt!161354 (tuple2!5235 lt!161365 minValue!1467)) lt!161360) (apply!273 lt!161354 lt!161360))))

(declare-fun lt!161352 () Unit!10593)

(assert (=> b!339894 (= lt!161352 lt!161358)))

(declare-fun lt!161348 () ListLongMap!4147)

(assert (=> b!339894 (= lt!161348 (getCurrentListMapNoExtraKeys!595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161366 () (_ BitVec 64))

(assert (=> b!339894 (= lt!161366 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161347 () (_ BitVec 64))

(assert (=> b!339894 (= lt!161347 (select (arr!8443 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161368 () Unit!10593)

(assert (=> b!339894 (= lt!161368 (addApplyDifferent!249 lt!161348 lt!161366 zeroValue!1467 lt!161347))))

(assert (=> b!339894 (= (apply!273 (+!722 lt!161348 (tuple2!5235 lt!161366 zeroValue!1467)) lt!161347) (apply!273 lt!161348 lt!161347))))

(declare-fun lt!161353 () Unit!10593)

(assert (=> b!339894 (= lt!161353 lt!161368)))

(declare-fun lt!161356 () ListLongMap!4147)

(assert (=> b!339894 (= lt!161356 (getCurrentListMapNoExtraKeys!595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161355 () (_ BitVec 64))

(assert (=> b!339894 (= lt!161355 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161350 () (_ BitVec 64))

(assert (=> b!339894 (= lt!161350 (select (arr!8443 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!339894 (= lt!161367 (addApplyDifferent!249 lt!161356 lt!161355 minValue!1467 lt!161350))))

(assert (=> b!339894 (= (apply!273 (+!722 lt!161356 (tuple2!5235 lt!161355 minValue!1467)) lt!161350) (apply!273 lt!161356 lt!161350))))

(declare-fun call!26507 () ListLongMap!4147)

(declare-fun c!52610 () Bool)

(declare-fun c!52606 () Bool)

(declare-fun call!26508 () ListLongMap!4147)

(declare-fun bm!26504 () Bool)

(declare-fun call!26511 () ListLongMap!4147)

(assert (=> bm!26504 (= call!26507 (+!722 (ite c!52610 call!26510 (ite c!52606 call!26511 call!26508)) (ite (or c!52610 c!52606) (tuple2!5235 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5235 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!339895 () Bool)

(declare-fun res!187748 () Bool)

(assert (=> b!339895 (=> (not res!187748) (not e!208525))))

(assert (=> b!339895 (= res!187748 e!208527)))

(declare-fun c!52611 () Bool)

(assert (=> b!339895 (= c!52611 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!339896 () Bool)

(declare-fun e!208521 () ListLongMap!4147)

(assert (=> b!339896 (= e!208521 e!208523)))

(assert (=> b!339896 (= c!52606 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!339897 () Bool)

(assert (=> b!339897 (= e!208521 (+!722 call!26507 (tuple2!5235 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun d!70883 () Bool)

(assert (=> d!70883 e!208525))

(declare-fun res!187743 () Bool)

(assert (=> d!70883 (=> (not res!187743) (not e!208525))))

(assert (=> d!70883 (= res!187743 (or (bvsge #b00000000000000000000000000000000 (size!8795 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8795 _keys!1895)))))))

(declare-fun lt!161351 () ListLongMap!4147)

(assert (=> d!70883 (= lt!161364 lt!161351)))

(declare-fun lt!161359 () Unit!10593)

(assert (=> d!70883 (= lt!161359 e!208524)))

(declare-fun c!52608 () Bool)

(assert (=> d!70883 (= c!52608 e!208520)))

(declare-fun res!187746 () Bool)

(assert (=> d!70883 (=> (not res!187746) (not e!208520))))

(assert (=> d!70883 (= res!187746 (bvslt #b00000000000000000000000000000000 (size!8795 _keys!1895)))))

(assert (=> d!70883 (= lt!161351 e!208521)))

(assert (=> d!70883 (= c!52610 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70883 (validMask!0 mask!2385)))

(assert (=> d!70883 (= (getCurrentListMap!1610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161364)))

(declare-fun b!339898 () Bool)

(assert (=> b!339898 (= e!208527 (not call!26506))))

(declare-fun bm!26505 () Bool)

(assert (=> bm!26505 (= call!26508 call!26511)))

(declare-fun b!339899 () Bool)

(declare-fun e!208529 () Bool)

(assert (=> b!339899 (= e!208525 e!208529)))

(declare-fun c!52609 () Bool)

(assert (=> b!339899 (= c!52609 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26506 () Bool)

(assert (=> bm!26506 (= call!26511 call!26510)))

(declare-fun b!339900 () Bool)

(assert (=> b!339900 (= e!208526 (validKeyInArray!0 (select (arr!8443 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339901 () Bool)

(declare-fun e!208530 () Bool)

(assert (=> b!339901 (= e!208530 (= (apply!273 lt!161364 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!339902 () Bool)

(declare-fun c!52607 () Bool)

(assert (=> b!339902 (= c!52607 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!208518 () ListLongMap!4147)

(assert (=> b!339902 (= e!208523 e!208518)))

(declare-fun bm!26507 () Bool)

(assert (=> bm!26507 (= call!26509 call!26507)))

(declare-fun bm!26508 () Bool)

(declare-fun call!26512 () Bool)

(assert (=> bm!26508 (= call!26512 (contains!2140 lt!161364 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!339903 () Bool)

(assert (=> b!339903 (= e!208529 (not call!26512))))

(declare-fun b!339904 () Bool)

(assert (=> b!339904 (= e!208518 call!26509)))

(declare-fun b!339905 () Bool)

(declare-fun Unit!10596 () Unit!10593)

(assert (=> b!339905 (= e!208524 Unit!10596)))

(declare-fun b!339906 () Bool)

(assert (=> b!339906 (= e!208529 e!208530)))

(declare-fun res!187742 () Bool)

(assert (=> b!339906 (= res!187742 call!26512)))

(assert (=> b!339906 (=> (not res!187742) (not e!208530))))

(declare-fun bm!26509 () Bool)

(assert (=> bm!26509 (= call!26506 (contains!2140 lt!161364 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!339907 () Bool)

(assert (=> b!339907 (= e!208518 call!26508)))

(declare-fun b!339908 () Bool)

(declare-fun get!4591 (ValueCell!3216 V!10469) V!10469)

(declare-fun dynLambda!616 (Int (_ BitVec 64)) V!10469)

(assert (=> b!339908 (= e!208528 (= (apply!273 lt!161364 (select (arr!8443 _keys!1895) #b00000000000000000000000000000000)) (get!4591 (select (arr!8442 _values!1525) #b00000000000000000000000000000000) (dynLambda!616 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!339908 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8794 _values!1525)))))

(assert (=> b!339908 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8795 _keys!1895)))))

(assert (= (and d!70883 c!52610) b!339897))

(assert (= (and d!70883 (not c!52610)) b!339896))

(assert (= (and b!339896 c!52606) b!339889))

(assert (= (and b!339896 (not c!52606)) b!339902))

(assert (= (and b!339902 c!52607) b!339904))

(assert (= (and b!339902 (not c!52607)) b!339907))

(assert (= (or b!339904 b!339907) bm!26505))

(assert (= (or b!339889 bm!26505) bm!26506))

(assert (= (or b!339889 b!339904) bm!26507))

(assert (= (or b!339897 bm!26506) bm!26503))

(assert (= (or b!339897 bm!26507) bm!26504))

(assert (= (and d!70883 res!187746) b!339893))

(assert (= (and d!70883 c!52608) b!339894))

(assert (= (and d!70883 (not c!52608)) b!339905))

(assert (= (and d!70883 res!187743) b!339892))

(assert (= (and b!339892 res!187740) b!339900))

(assert (= (and b!339892 (not res!187747)) b!339888))

(assert (= (and b!339888 res!187744) b!339908))

(assert (= (and b!339892 res!187745) b!339895))

(assert (= (and b!339895 c!52611) b!339890))

(assert (= (and b!339895 (not c!52611)) b!339898))

(assert (= (and b!339890 res!187741) b!339891))

(assert (= (or b!339890 b!339898) bm!26509))

(assert (= (and b!339895 res!187748) b!339899))

(assert (= (and b!339899 c!52609) b!339906))

(assert (= (and b!339899 (not c!52609)) b!339903))

(assert (= (and b!339906 res!187742) b!339901))

(assert (= (or b!339906 b!339903) bm!26508))

(declare-fun b_lambda!8431 () Bool)

(assert (=> (not b_lambda!8431) (not b!339908)))

(declare-fun t!9958 () Bool)

(declare-fun tb!3061 () Bool)

(assert (=> (and start!34088 (= defaultEntry!1528 defaultEntry!1528) t!9958) tb!3061))

(declare-fun result!5513 () Bool)

(assert (=> tb!3061 (= result!5513 tp_is_empty!7119)))

(assert (=> b!339908 t!9958))

(declare-fun b_and!14365 () Bool)

(assert (= b_and!14361 (and (=> t!9958 result!5513) b_and!14365)))

(assert (=> b!339888 m!342689))

(assert (=> b!339888 m!342689))

(declare-fun m!342727 () Bool)

(assert (=> b!339888 m!342727))

(declare-fun m!342729 () Bool)

(assert (=> b!339897 m!342729))

(declare-fun m!342731 () Bool)

(assert (=> bm!26509 m!342731))

(assert (=> b!339900 m!342689))

(assert (=> b!339900 m!342689))

(assert (=> b!339900 m!342699))

(assert (=> b!339908 m!342689))

(declare-fun m!342733 () Bool)

(assert (=> b!339908 m!342733))

(declare-fun m!342735 () Bool)

(assert (=> b!339908 m!342735))

(declare-fun m!342737 () Bool)

(assert (=> b!339908 m!342737))

(assert (=> b!339908 m!342737))

(assert (=> b!339908 m!342735))

(declare-fun m!342739 () Bool)

(assert (=> b!339908 m!342739))

(assert (=> b!339908 m!342689))

(declare-fun m!342741 () Bool)

(assert (=> b!339891 m!342741))

(assert (=> b!339893 m!342689))

(assert (=> b!339893 m!342689))

(assert (=> b!339893 m!342699))

(assert (=> d!70883 m!342653))

(declare-fun m!342743 () Bool)

(assert (=> bm!26504 m!342743))

(declare-fun m!342745 () Bool)

(assert (=> b!339901 m!342745))

(declare-fun m!342747 () Bool)

(assert (=> b!339894 m!342747))

(declare-fun m!342749 () Bool)

(assert (=> b!339894 m!342749))

(declare-fun m!342751 () Bool)

(assert (=> b!339894 m!342751))

(declare-fun m!342753 () Bool)

(assert (=> b!339894 m!342753))

(declare-fun m!342755 () Bool)

(assert (=> b!339894 m!342755))

(assert (=> b!339894 m!342747))

(declare-fun m!342757 () Bool)

(assert (=> b!339894 m!342757))

(declare-fun m!342759 () Bool)

(assert (=> b!339894 m!342759))

(declare-fun m!342761 () Bool)

(assert (=> b!339894 m!342761))

(assert (=> b!339894 m!342689))

(declare-fun m!342763 () Bool)

(assert (=> b!339894 m!342763))

(declare-fun m!342765 () Bool)

(assert (=> b!339894 m!342765))

(declare-fun m!342767 () Bool)

(assert (=> b!339894 m!342767))

(assert (=> b!339894 m!342753))

(declare-fun m!342769 () Bool)

(assert (=> b!339894 m!342769))

(declare-fun m!342771 () Bool)

(assert (=> b!339894 m!342771))

(assert (=> b!339894 m!342769))

(declare-fun m!342773 () Bool)

(assert (=> b!339894 m!342773))

(assert (=> b!339894 m!342765))

(declare-fun m!342775 () Bool)

(assert (=> b!339894 m!342775))

(declare-fun m!342777 () Bool)

(assert (=> b!339894 m!342777))

(declare-fun m!342779 () Bool)

(assert (=> bm!26508 m!342779))

(assert (=> bm!26503 m!342759))

(assert (=> b!339757 d!70883))

(declare-fun b!339917 () Bool)

(declare-fun e!208535 () Bool)

(assert (=> b!339917 (= e!208535 tp_is_empty!7119)))

(declare-fun condMapEmpty!12102 () Bool)

(declare-fun mapDefault!12102 () ValueCell!3216)

(assert (=> mapNonEmpty!12096 (= condMapEmpty!12102 (= mapRest!12096 ((as const (Array (_ BitVec 32) ValueCell!3216)) mapDefault!12102)))))

(declare-fun e!208536 () Bool)

(declare-fun mapRes!12102 () Bool)

(assert (=> mapNonEmpty!12096 (= tp!25026 (and e!208536 mapRes!12102))))

(declare-fun b!339918 () Bool)

(assert (=> b!339918 (= e!208536 tp_is_empty!7119)))

(declare-fun mapNonEmpty!12102 () Bool)

(declare-fun tp!25035 () Bool)

(assert (=> mapNonEmpty!12102 (= mapRes!12102 (and tp!25035 e!208535))))

(declare-fun mapKey!12102 () (_ BitVec 32))

(declare-fun mapValue!12102 () ValueCell!3216)

(declare-fun mapRest!12102 () (Array (_ BitVec 32) ValueCell!3216))

(assert (=> mapNonEmpty!12102 (= mapRest!12096 (store mapRest!12102 mapKey!12102 mapValue!12102))))

(declare-fun mapIsEmpty!12102 () Bool)

(assert (=> mapIsEmpty!12102 mapRes!12102))

(assert (= (and mapNonEmpty!12096 condMapEmpty!12102) mapIsEmpty!12102))

(assert (= (and mapNonEmpty!12096 (not condMapEmpty!12102)) mapNonEmpty!12102))

(assert (= (and mapNonEmpty!12102 ((_ is ValueCellFull!3216) mapValue!12102)) b!339917))

(assert (= (and mapNonEmpty!12096 ((_ is ValueCellFull!3216) mapDefault!12102)) b!339918))

(declare-fun m!342781 () Bool)

(assert (=> mapNonEmpty!12102 m!342781))

(declare-fun b_lambda!8433 () Bool)

(assert (= b_lambda!8431 (or (and start!34088 b_free!7167) b_lambda!8433)))

(check-sat (not b_next!7167) (not b!339888) (not mapNonEmpty!12102) (not bm!26488) (not b!339817) (not b!339800) tp_is_empty!7119 b_and!14365 (not b!339897) (not d!70883) (not d!70871) (not b!339818) (not b!339901) (not b!339891) (not b!339900) (not b!339815) (not bm!26508) (not b!339834) (not bm!26504) (not bm!26509) (not b!339893) (not bm!26503) (not bm!26485) (not b!339803) (not b!339843) (not b!339894) (not d!70881) (not b_lambda!8433) (not b!339908) (not b!339845))
(check-sat b_and!14365 (not b_next!7167))
