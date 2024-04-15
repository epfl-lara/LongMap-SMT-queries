; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15996 () Bool)

(assert start!15996)

(declare-fun b!158641 () Bool)

(declare-fun b_free!3493 () Bool)

(declare-fun b_next!3493 () Bool)

(assert (=> b!158641 (= b_free!3493 (not b_next!3493))))

(declare-fun tp!13039 () Bool)

(declare-fun b_and!9881 () Bool)

(assert (=> b!158641 (= tp!13039 b_and!9881)))

(declare-fun b!158639 () Bool)

(declare-fun res!74875 () Bool)

(declare-fun e!103878 () Bool)

(assert (=> b!158639 (=> (not res!74875) (not e!103878))))

(declare-datatypes ((V!4041 0))(
  ( (V!4042 (val!1692 Int)) )
))
(declare-datatypes ((ValueCell!1304 0))(
  ( (ValueCellFull!1304 (v!3551 V!4041)) (EmptyCell!1304) )
))
(declare-datatypes ((array!5643 0))(
  ( (array!5644 (arr!2668 (Array (_ BitVec 32) (_ BitVec 64))) (size!2953 (_ BitVec 32))) )
))
(declare-datatypes ((array!5645 0))(
  ( (array!5646 (arr!2669 (Array (_ BitVec 32) ValueCell!1304)) (size!2954 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1516 0))(
  ( (LongMapFixedSize!1517 (defaultEntry!3200 Int) (mask!7730 (_ BitVec 32)) (extraKeys!2941 (_ BitVec 32)) (zeroValue!3043 V!4041) (minValue!3043 V!4041) (_size!807 (_ BitVec 32)) (_keys!4994 array!5643) (_values!3183 array!5645) (_vacant!807 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1516)

(assert (=> b!158639 (= res!74875 (and (= (size!2954 (_values!3183 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7730 thiss!1248))) (= (size!2953 (_keys!4994 thiss!1248)) (size!2954 (_values!3183 thiss!1248))) (bvsge (mask!7730 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2941 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2941 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!158640 () Bool)

(declare-fun res!74876 () Bool)

(assert (=> b!158640 (=> (not res!74876) (not e!103878))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!306 0))(
  ( (MissingZero!306 (index!3392 (_ BitVec 32))) (Found!306 (index!3393 (_ BitVec 32))) (Intermediate!306 (undefined!1118 Bool) (index!3394 (_ BitVec 32)) (x!17537 (_ BitVec 32))) (Undefined!306) (MissingVacant!306 (index!3395 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5643 (_ BitVec 32)) SeekEntryResult!306)

(assert (=> b!158640 (= res!74876 ((_ is Undefined!306) (seekEntryOrOpen!0 key!828 (_keys!4994 thiss!1248) (mask!7730 thiss!1248))))))

(declare-fun tp_is_empty!3295 () Bool)

(declare-fun e!103877 () Bool)

(declare-fun e!103881 () Bool)

(declare-fun array_inv!1713 (array!5643) Bool)

(declare-fun array_inv!1714 (array!5645) Bool)

(assert (=> b!158641 (= e!103881 (and tp!13039 tp_is_empty!3295 (array_inv!1713 (_keys!4994 thiss!1248)) (array_inv!1714 (_values!3183 thiss!1248)) e!103877))))

(declare-fun b!158642 () Bool)

(declare-fun e!103879 () Bool)

(declare-fun mapRes!5621 () Bool)

(assert (=> b!158642 (= e!103877 (and e!103879 mapRes!5621))))

(declare-fun condMapEmpty!5621 () Bool)

(declare-fun mapDefault!5621 () ValueCell!1304)

(assert (=> b!158642 (= condMapEmpty!5621 (= (arr!2669 (_values!3183 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1304)) mapDefault!5621)))))

(declare-fun mapNonEmpty!5621 () Bool)

(declare-fun tp!13040 () Bool)

(declare-fun e!103880 () Bool)

(assert (=> mapNonEmpty!5621 (= mapRes!5621 (and tp!13040 e!103880))))

(declare-fun mapKey!5621 () (_ BitVec 32))

(declare-fun mapRest!5621 () (Array (_ BitVec 32) ValueCell!1304))

(declare-fun mapValue!5621 () ValueCell!1304)

(assert (=> mapNonEmpty!5621 (= (arr!2669 (_values!3183 thiss!1248)) (store mapRest!5621 mapKey!5621 mapValue!5621))))

(declare-fun b!158643 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5643 (_ BitVec 32)) Bool)

(assert (=> b!158643 (= e!103878 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4994 thiss!1248) (mask!7730 thiss!1248))))))

(declare-fun b!158644 () Bool)

(assert (=> b!158644 (= e!103880 tp_is_empty!3295)))

(declare-fun b!158645 () Bool)

(declare-fun res!74873 () Bool)

(assert (=> b!158645 (=> (not res!74873) (not e!103878))))

(assert (=> b!158645 (= res!74873 (not (= key!828 (bvneg key!828))))))

(declare-fun res!74874 () Bool)

(assert (=> start!15996 (=> (not res!74874) (not e!103878))))

(declare-fun valid!716 (LongMapFixedSize!1516) Bool)

(assert (=> start!15996 (= res!74874 (valid!716 thiss!1248))))

(assert (=> start!15996 e!103878))

(assert (=> start!15996 e!103881))

(assert (=> start!15996 true))

(declare-fun b!158646 () Bool)

(declare-fun res!74877 () Bool)

(assert (=> b!158646 (=> (not res!74877) (not e!103878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158646 (= res!74877 (validMask!0 (mask!7730 thiss!1248)))))

(declare-fun b!158647 () Bool)

(assert (=> b!158647 (= e!103879 tp_is_empty!3295)))

(declare-fun mapIsEmpty!5621 () Bool)

(assert (=> mapIsEmpty!5621 mapRes!5621))

(assert (= (and start!15996 res!74874) b!158645))

(assert (= (and b!158645 res!74873) b!158640))

(assert (= (and b!158640 res!74876) b!158646))

(assert (= (and b!158646 res!74877) b!158639))

(assert (= (and b!158639 res!74875) b!158643))

(assert (= (and b!158642 condMapEmpty!5621) mapIsEmpty!5621))

(assert (= (and b!158642 (not condMapEmpty!5621)) mapNonEmpty!5621))

(assert (= (and mapNonEmpty!5621 ((_ is ValueCellFull!1304) mapValue!5621)) b!158644))

(assert (= (and b!158642 ((_ is ValueCellFull!1304) mapDefault!5621)) b!158647))

(assert (= b!158641 b!158642))

(assert (= start!15996 b!158641))

(declare-fun m!190713 () Bool)

(assert (=> start!15996 m!190713))

(declare-fun m!190715 () Bool)

(assert (=> b!158646 m!190715))

(declare-fun m!190717 () Bool)

(assert (=> b!158643 m!190717))

(declare-fun m!190719 () Bool)

(assert (=> mapNonEmpty!5621 m!190719))

(declare-fun m!190721 () Bool)

(assert (=> b!158640 m!190721))

(declare-fun m!190723 () Bool)

(assert (=> b!158641 m!190723))

(declare-fun m!190725 () Bool)

(assert (=> b!158641 m!190725))

(check-sat (not b!158641) (not b_next!3493) (not b!158640) tp_is_empty!3295 b_and!9881 (not mapNonEmpty!5621) (not b!158643) (not b!158646) (not start!15996))
(check-sat b_and!9881 (not b_next!3493))
(get-model)

(declare-fun d!51077 () Bool)

(declare-fun res!74914 () Bool)

(declare-fun e!103921 () Bool)

(assert (=> d!51077 (=> (not res!74914) (not e!103921))))

(declare-fun simpleValid!115 (LongMapFixedSize!1516) Bool)

(assert (=> d!51077 (= res!74914 (simpleValid!115 thiss!1248))))

(assert (=> d!51077 (= (valid!716 thiss!1248) e!103921)))

(declare-fun b!158708 () Bool)

(declare-fun res!74915 () Bool)

(assert (=> b!158708 (=> (not res!74915) (not e!103921))))

(declare-fun arrayCountValidKeys!0 (array!5643 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158708 (= res!74915 (= (arrayCountValidKeys!0 (_keys!4994 thiss!1248) #b00000000000000000000000000000000 (size!2953 (_keys!4994 thiss!1248))) (_size!807 thiss!1248)))))

(declare-fun b!158709 () Bool)

(declare-fun res!74916 () Bool)

(assert (=> b!158709 (=> (not res!74916) (not e!103921))))

(assert (=> b!158709 (= res!74916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4994 thiss!1248) (mask!7730 thiss!1248)))))

(declare-fun b!158710 () Bool)

(declare-datatypes ((List!1889 0))(
  ( (Nil!1886) (Cons!1885 (h!2498 (_ BitVec 64)) (t!6682 List!1889)) )
))
(declare-fun arrayNoDuplicates!0 (array!5643 (_ BitVec 32) List!1889) Bool)

(assert (=> b!158710 (= e!103921 (arrayNoDuplicates!0 (_keys!4994 thiss!1248) #b00000000000000000000000000000000 Nil!1886))))

(assert (= (and d!51077 res!74914) b!158708))

(assert (= (and b!158708 res!74915) b!158709))

(assert (= (and b!158709 res!74916) b!158710))

(declare-fun m!190755 () Bool)

(assert (=> d!51077 m!190755))

(declare-fun m!190757 () Bool)

(assert (=> b!158708 m!190757))

(assert (=> b!158709 m!190717))

(declare-fun m!190759 () Bool)

(assert (=> b!158710 m!190759))

(assert (=> start!15996 d!51077))

(declare-fun d!51079 () Bool)

(assert (=> d!51079 (= (validMask!0 (mask!7730 thiss!1248)) (and (or (= (mask!7730 thiss!1248) #b00000000000000000000000000000111) (= (mask!7730 thiss!1248) #b00000000000000000000000000001111) (= (mask!7730 thiss!1248) #b00000000000000000000000000011111) (= (mask!7730 thiss!1248) #b00000000000000000000000000111111) (= (mask!7730 thiss!1248) #b00000000000000000000000001111111) (= (mask!7730 thiss!1248) #b00000000000000000000000011111111) (= (mask!7730 thiss!1248) #b00000000000000000000000111111111) (= (mask!7730 thiss!1248) #b00000000000000000000001111111111) (= (mask!7730 thiss!1248) #b00000000000000000000011111111111) (= (mask!7730 thiss!1248) #b00000000000000000000111111111111) (= (mask!7730 thiss!1248) #b00000000000000000001111111111111) (= (mask!7730 thiss!1248) #b00000000000000000011111111111111) (= (mask!7730 thiss!1248) #b00000000000000000111111111111111) (= (mask!7730 thiss!1248) #b00000000000000001111111111111111) (= (mask!7730 thiss!1248) #b00000000000000011111111111111111) (= (mask!7730 thiss!1248) #b00000000000000111111111111111111) (= (mask!7730 thiss!1248) #b00000000000001111111111111111111) (= (mask!7730 thiss!1248) #b00000000000011111111111111111111) (= (mask!7730 thiss!1248) #b00000000000111111111111111111111) (= (mask!7730 thiss!1248) #b00000000001111111111111111111111) (= (mask!7730 thiss!1248) #b00000000011111111111111111111111) (= (mask!7730 thiss!1248) #b00000000111111111111111111111111) (= (mask!7730 thiss!1248) #b00000001111111111111111111111111) (= (mask!7730 thiss!1248) #b00000011111111111111111111111111) (= (mask!7730 thiss!1248) #b00000111111111111111111111111111) (= (mask!7730 thiss!1248) #b00001111111111111111111111111111) (= (mask!7730 thiss!1248) #b00011111111111111111111111111111) (= (mask!7730 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7730 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158646 d!51079))

(declare-fun b!158719 () Bool)

(declare-fun e!103930 () Bool)

(declare-fun call!17248 () Bool)

(assert (=> b!158719 (= e!103930 call!17248)))

(declare-fun d!51081 () Bool)

(declare-fun res!74922 () Bool)

(declare-fun e!103928 () Bool)

(assert (=> d!51081 (=> res!74922 e!103928)))

(assert (=> d!51081 (= res!74922 (bvsge #b00000000000000000000000000000000 (size!2953 (_keys!4994 thiss!1248))))))

(assert (=> d!51081 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4994 thiss!1248) (mask!7730 thiss!1248)) e!103928)))

(declare-fun b!158720 () Bool)

(declare-fun e!103929 () Bool)

(assert (=> b!158720 (= e!103929 call!17248)))

(declare-fun bm!17245 () Bool)

(assert (=> bm!17245 (= call!17248 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4994 thiss!1248) (mask!7730 thiss!1248)))))

(declare-fun b!158721 () Bool)

(assert (=> b!158721 (= e!103929 e!103930)))

(declare-fun lt!81749 () (_ BitVec 64))

(assert (=> b!158721 (= lt!81749 (select (arr!2668 (_keys!4994 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4966 0))(
  ( (Unit!4967) )
))
(declare-fun lt!81748 () Unit!4966)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5643 (_ BitVec 64) (_ BitVec 32)) Unit!4966)

(assert (=> b!158721 (= lt!81748 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4994 thiss!1248) lt!81749 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158721 (arrayContainsKey!0 (_keys!4994 thiss!1248) lt!81749 #b00000000000000000000000000000000)))

(declare-fun lt!81750 () Unit!4966)

(assert (=> b!158721 (= lt!81750 lt!81748)))

(declare-fun res!74921 () Bool)

(assert (=> b!158721 (= res!74921 (= (seekEntryOrOpen!0 (select (arr!2668 (_keys!4994 thiss!1248)) #b00000000000000000000000000000000) (_keys!4994 thiss!1248) (mask!7730 thiss!1248)) (Found!306 #b00000000000000000000000000000000)))))

(assert (=> b!158721 (=> (not res!74921) (not e!103930))))

(declare-fun b!158722 () Bool)

(assert (=> b!158722 (= e!103928 e!103929)))

(declare-fun c!29867 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!158722 (= c!29867 (validKeyInArray!0 (select (arr!2668 (_keys!4994 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51081 (not res!74922)) b!158722))

(assert (= (and b!158722 c!29867) b!158721))

(assert (= (and b!158722 (not c!29867)) b!158720))

(assert (= (and b!158721 res!74921) b!158719))

(assert (= (or b!158719 b!158720) bm!17245))

(declare-fun m!190761 () Bool)

(assert (=> bm!17245 m!190761))

(declare-fun m!190763 () Bool)

(assert (=> b!158721 m!190763))

(declare-fun m!190765 () Bool)

(assert (=> b!158721 m!190765))

(declare-fun m!190767 () Bool)

(assert (=> b!158721 m!190767))

(assert (=> b!158721 m!190763))

(declare-fun m!190769 () Bool)

(assert (=> b!158721 m!190769))

(assert (=> b!158722 m!190763))

(assert (=> b!158722 m!190763))

(declare-fun m!190771 () Bool)

(assert (=> b!158722 m!190771))

(assert (=> b!158643 d!51081))

(declare-fun b!158735 () Bool)

(declare-fun e!103939 () SeekEntryResult!306)

(assert (=> b!158735 (= e!103939 Undefined!306)))

(declare-fun b!158736 () Bool)

(declare-fun e!103937 () SeekEntryResult!306)

(assert (=> b!158736 (= e!103939 e!103937)))

(declare-fun lt!81757 () (_ BitVec 64))

(declare-fun lt!81759 () SeekEntryResult!306)

(assert (=> b!158736 (= lt!81757 (select (arr!2668 (_keys!4994 thiss!1248)) (index!3394 lt!81759)))))

(declare-fun c!29876 () Bool)

(assert (=> b!158736 (= c!29876 (= lt!81757 key!828))))

(declare-fun b!158737 () Bool)

(declare-fun c!29875 () Bool)

(assert (=> b!158737 (= c!29875 (= lt!81757 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103938 () SeekEntryResult!306)

(assert (=> b!158737 (= e!103937 e!103938)))

(declare-fun d!51083 () Bool)

(declare-fun lt!81758 () SeekEntryResult!306)

(assert (=> d!51083 (and (or ((_ is Undefined!306) lt!81758) (not ((_ is Found!306) lt!81758)) (and (bvsge (index!3393 lt!81758) #b00000000000000000000000000000000) (bvslt (index!3393 lt!81758) (size!2953 (_keys!4994 thiss!1248))))) (or ((_ is Undefined!306) lt!81758) ((_ is Found!306) lt!81758) (not ((_ is MissingZero!306) lt!81758)) (and (bvsge (index!3392 lt!81758) #b00000000000000000000000000000000) (bvslt (index!3392 lt!81758) (size!2953 (_keys!4994 thiss!1248))))) (or ((_ is Undefined!306) lt!81758) ((_ is Found!306) lt!81758) ((_ is MissingZero!306) lt!81758) (not ((_ is MissingVacant!306) lt!81758)) (and (bvsge (index!3395 lt!81758) #b00000000000000000000000000000000) (bvslt (index!3395 lt!81758) (size!2953 (_keys!4994 thiss!1248))))) (or ((_ is Undefined!306) lt!81758) (ite ((_ is Found!306) lt!81758) (= (select (arr!2668 (_keys!4994 thiss!1248)) (index!3393 lt!81758)) key!828) (ite ((_ is MissingZero!306) lt!81758) (= (select (arr!2668 (_keys!4994 thiss!1248)) (index!3392 lt!81758)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!306) lt!81758) (= (select (arr!2668 (_keys!4994 thiss!1248)) (index!3395 lt!81758)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51083 (= lt!81758 e!103939)))

(declare-fun c!29874 () Bool)

(assert (=> d!51083 (= c!29874 (and ((_ is Intermediate!306) lt!81759) (undefined!1118 lt!81759)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5643 (_ BitVec 32)) SeekEntryResult!306)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51083 (= lt!81759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7730 thiss!1248)) key!828 (_keys!4994 thiss!1248) (mask!7730 thiss!1248)))))

(assert (=> d!51083 (validMask!0 (mask!7730 thiss!1248))))

(assert (=> d!51083 (= (seekEntryOrOpen!0 key!828 (_keys!4994 thiss!1248) (mask!7730 thiss!1248)) lt!81758)))

(declare-fun b!158738 () Bool)

(assert (=> b!158738 (= e!103938 (MissingZero!306 (index!3394 lt!81759)))))

(declare-fun b!158739 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5643 (_ BitVec 32)) SeekEntryResult!306)

(assert (=> b!158739 (= e!103938 (seekKeyOrZeroReturnVacant!0 (x!17537 lt!81759) (index!3394 lt!81759) (index!3394 lt!81759) key!828 (_keys!4994 thiss!1248) (mask!7730 thiss!1248)))))

(declare-fun b!158740 () Bool)

(assert (=> b!158740 (= e!103937 (Found!306 (index!3394 lt!81759)))))

(assert (= (and d!51083 c!29874) b!158735))

(assert (= (and d!51083 (not c!29874)) b!158736))

(assert (= (and b!158736 c!29876) b!158740))

(assert (= (and b!158736 (not c!29876)) b!158737))

(assert (= (and b!158737 c!29875) b!158738))

(assert (= (and b!158737 (not c!29875)) b!158739))

(declare-fun m!190773 () Bool)

(assert (=> b!158736 m!190773))

(declare-fun m!190775 () Bool)

(assert (=> d!51083 m!190775))

(declare-fun m!190777 () Bool)

(assert (=> d!51083 m!190777))

(declare-fun m!190779 () Bool)

(assert (=> d!51083 m!190779))

(assert (=> d!51083 m!190715))

(assert (=> d!51083 m!190775))

(declare-fun m!190781 () Bool)

(assert (=> d!51083 m!190781))

(declare-fun m!190783 () Bool)

(assert (=> d!51083 m!190783))

(declare-fun m!190785 () Bool)

(assert (=> b!158739 m!190785))

(assert (=> b!158640 d!51083))

(declare-fun d!51085 () Bool)

(assert (=> d!51085 (= (array_inv!1713 (_keys!4994 thiss!1248)) (bvsge (size!2953 (_keys!4994 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158641 d!51085))

(declare-fun d!51087 () Bool)

(assert (=> d!51087 (= (array_inv!1714 (_values!3183 thiss!1248)) (bvsge (size!2954 (_values!3183 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158641 d!51087))

(declare-fun condMapEmpty!5630 () Bool)

(declare-fun mapDefault!5630 () ValueCell!1304)

(assert (=> mapNonEmpty!5621 (= condMapEmpty!5630 (= mapRest!5621 ((as const (Array (_ BitVec 32) ValueCell!1304)) mapDefault!5630)))))

(declare-fun e!103945 () Bool)

(declare-fun mapRes!5630 () Bool)

(assert (=> mapNonEmpty!5621 (= tp!13040 (and e!103945 mapRes!5630))))

(declare-fun b!158748 () Bool)

(assert (=> b!158748 (= e!103945 tp_is_empty!3295)))

(declare-fun b!158747 () Bool)

(declare-fun e!103944 () Bool)

(assert (=> b!158747 (= e!103944 tp_is_empty!3295)))

(declare-fun mapIsEmpty!5630 () Bool)

(assert (=> mapIsEmpty!5630 mapRes!5630))

(declare-fun mapNonEmpty!5630 () Bool)

(declare-fun tp!13055 () Bool)

(assert (=> mapNonEmpty!5630 (= mapRes!5630 (and tp!13055 e!103944))))

(declare-fun mapKey!5630 () (_ BitVec 32))

(declare-fun mapRest!5630 () (Array (_ BitVec 32) ValueCell!1304))

(declare-fun mapValue!5630 () ValueCell!1304)

(assert (=> mapNonEmpty!5630 (= mapRest!5621 (store mapRest!5630 mapKey!5630 mapValue!5630))))

(assert (= (and mapNonEmpty!5621 condMapEmpty!5630) mapIsEmpty!5630))

(assert (= (and mapNonEmpty!5621 (not condMapEmpty!5630)) mapNonEmpty!5630))

(assert (= (and mapNonEmpty!5630 ((_ is ValueCellFull!1304) mapValue!5630)) b!158747))

(assert (= (and mapNonEmpty!5621 ((_ is ValueCellFull!1304) mapDefault!5630)) b!158748))

(declare-fun m!190787 () Bool)

(assert (=> mapNonEmpty!5630 m!190787))

(check-sat (not b!158710) (not b_next!3493) b_and!9881 (not b!158721) (not b!158739) (not b!158708) (not d!51077) (not b!158722) (not mapNonEmpty!5630) (not b!158709) tp_is_empty!3295 (not d!51083) (not bm!17245))
(check-sat b_and!9881 (not b_next!3493))
