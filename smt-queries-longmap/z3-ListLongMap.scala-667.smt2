; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16482 () Bool)

(assert start!16482)

(declare-fun b!163762 () Bool)

(declare-fun b_free!3811 () Bool)

(declare-fun b_next!3811 () Bool)

(assert (=> b!163762 (= b_free!3811 (not b_next!3811))))

(declare-fun tp!14028 () Bool)

(declare-fun b_and!10199 () Bool)

(assert (=> b!163762 (= tp!14028 b_and!10199)))

(declare-fun res!77451 () Bool)

(declare-fun e!107444 () Bool)

(assert (=> start!16482 (=> (not res!77451) (not e!107444))))

(declare-datatypes ((V!4465 0))(
  ( (V!4466 (val!1851 Int)) )
))
(declare-datatypes ((ValueCell!1463 0))(
  ( (ValueCellFull!1463 (v!3710 V!4465)) (EmptyCell!1463) )
))
(declare-datatypes ((array!6299 0))(
  ( (array!6300 (arr!2986 (Array (_ BitVec 32) (_ BitVec 64))) (size!3275 (_ BitVec 32))) )
))
(declare-datatypes ((array!6301 0))(
  ( (array!6302 (arr!2987 (Array (_ BitVec 32) ValueCell!1463)) (size!3276 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1834 0))(
  ( (LongMapFixedSize!1835 (defaultEntry!3359 Int) (mask!8035 (_ BitVec 32)) (extraKeys!3100 (_ BitVec 32)) (zeroValue!3202 V!4465) (minValue!3202 V!4465) (_size!966 (_ BitVec 32)) (_keys!5179 array!6299) (_values!3342 array!6301) (_vacant!966 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1834)

(declare-fun valid!827 (LongMapFixedSize!1834) Bool)

(assert (=> start!16482 (= res!77451 (valid!827 thiss!1248))))

(assert (=> start!16482 e!107444))

(declare-fun e!107443 () Bool)

(assert (=> start!16482 e!107443))

(assert (=> start!16482 true))

(declare-fun b!163754 () Bool)

(declare-fun e!107441 () Bool)

(assert (=> b!163754 (= e!107444 e!107441)))

(declare-fun res!77454 () Bool)

(assert (=> b!163754 (=> (not res!77454) (not e!107441))))

(declare-datatypes ((SeekEntryResult!416 0))(
  ( (MissingZero!416 (index!3832 (_ BitVec 32))) (Found!416 (index!3833 (_ BitVec 32))) (Intermediate!416 (undefined!1228 Bool) (index!3834 (_ BitVec 32)) (x!18187 (_ BitVec 32))) (Undefined!416) (MissingVacant!416 (index!3835 (_ BitVec 32))) )
))
(declare-fun lt!82611 () SeekEntryResult!416)

(get-info :version)

(assert (=> b!163754 (= res!77454 (and (not ((_ is Undefined!416) lt!82611)) (not ((_ is MissingVacant!416) lt!82611)) (not ((_ is MissingZero!416) lt!82611)) ((_ is Found!416) lt!82611)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6299 (_ BitVec 32)) SeekEntryResult!416)

(assert (=> b!163754 (= lt!82611 (seekEntryOrOpen!0 key!828 (_keys!5179 thiss!1248) (mask!8035 thiss!1248)))))

(declare-fun b!163755 () Bool)

(declare-fun res!77453 () Bool)

(assert (=> b!163755 (=> (not res!77453) (not e!107441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163755 (= res!77453 (validMask!0 (mask!8035 thiss!1248)))))

(declare-fun b!163756 () Bool)

(declare-fun res!77452 () Bool)

(assert (=> b!163756 (=> (not res!77452) (not e!107444))))

(assert (=> b!163756 (= res!77452 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6132 () Bool)

(declare-fun mapRes!6132 () Bool)

(assert (=> mapIsEmpty!6132 mapRes!6132))

(declare-fun b!163757 () Bool)

(declare-fun res!77450 () Bool)

(assert (=> b!163757 (=> (not res!77450) (not e!107441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6299 (_ BitVec 32)) Bool)

(assert (=> b!163757 (= res!77450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5179 thiss!1248) (mask!8035 thiss!1248)))))

(declare-fun mapNonEmpty!6132 () Bool)

(declare-fun tp!14027 () Bool)

(declare-fun e!107442 () Bool)

(assert (=> mapNonEmpty!6132 (= mapRes!6132 (and tp!14027 e!107442))))

(declare-fun mapValue!6132 () ValueCell!1463)

(declare-fun mapRest!6132 () (Array (_ BitVec 32) ValueCell!1463))

(declare-fun mapKey!6132 () (_ BitVec 32))

(assert (=> mapNonEmpty!6132 (= (arr!2987 (_values!3342 thiss!1248)) (store mapRest!6132 mapKey!6132 mapValue!6132))))

(declare-fun b!163758 () Bool)

(declare-fun res!77455 () Bool)

(assert (=> b!163758 (=> (not res!77455) (not e!107441))))

(assert (=> b!163758 (= res!77455 (and (= (size!3276 (_values!3342 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8035 thiss!1248))) (= (size!3275 (_keys!5179 thiss!1248)) (size!3276 (_values!3342 thiss!1248))) (bvsge (mask!8035 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3100 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3100 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!163759 () Bool)

(declare-datatypes ((List!2000 0))(
  ( (Nil!1997) (Cons!1996 (h!2613 (_ BitVec 64)) (t!6793 List!2000)) )
))
(declare-fun arrayNoDuplicates!0 (array!6299 (_ BitVec 32) List!2000) Bool)

(assert (=> b!163759 (= e!107441 (not (arrayNoDuplicates!0 (_keys!5179 thiss!1248) #b00000000000000000000000000000000 Nil!1997)))))

(declare-fun b!163760 () Bool)

(declare-fun e!107445 () Bool)

(declare-fun e!107439 () Bool)

(assert (=> b!163760 (= e!107445 (and e!107439 mapRes!6132))))

(declare-fun condMapEmpty!6132 () Bool)

(declare-fun mapDefault!6132 () ValueCell!1463)

(assert (=> b!163760 (= condMapEmpty!6132 (= (arr!2987 (_values!3342 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1463)) mapDefault!6132)))))

(declare-fun b!163761 () Bool)

(declare-fun tp_is_empty!3613 () Bool)

(assert (=> b!163761 (= e!107439 tp_is_empty!3613)))

(declare-fun array_inv!1925 (array!6299) Bool)

(declare-fun array_inv!1926 (array!6301) Bool)

(assert (=> b!163762 (= e!107443 (and tp!14028 tp_is_empty!3613 (array_inv!1925 (_keys!5179 thiss!1248)) (array_inv!1926 (_values!3342 thiss!1248)) e!107445))))

(declare-fun b!163763 () Bool)

(assert (=> b!163763 (= e!107442 tp_is_empty!3613)))

(assert (= (and start!16482 res!77451) b!163756))

(assert (= (and b!163756 res!77452) b!163754))

(assert (= (and b!163754 res!77454) b!163755))

(assert (= (and b!163755 res!77453) b!163758))

(assert (= (and b!163758 res!77455) b!163757))

(assert (= (and b!163757 res!77450) b!163759))

(assert (= (and b!163760 condMapEmpty!6132) mapIsEmpty!6132))

(assert (= (and b!163760 (not condMapEmpty!6132)) mapNonEmpty!6132))

(assert (= (and mapNonEmpty!6132 ((_ is ValueCellFull!1463) mapValue!6132)) b!163763))

(assert (= (and b!163760 ((_ is ValueCellFull!1463) mapDefault!6132)) b!163761))

(assert (= b!163762 b!163760))

(assert (= start!16482 b!163762))

(declare-fun m!193723 () Bool)

(assert (=> b!163754 m!193723))

(declare-fun m!193725 () Bool)

(assert (=> b!163757 m!193725))

(declare-fun m!193727 () Bool)

(assert (=> b!163759 m!193727))

(declare-fun m!193729 () Bool)

(assert (=> b!163755 m!193729))

(declare-fun m!193731 () Bool)

(assert (=> b!163762 m!193731))

(declare-fun m!193733 () Bool)

(assert (=> b!163762 m!193733))

(declare-fun m!193735 () Bool)

(assert (=> mapNonEmpty!6132 m!193735))

(declare-fun m!193737 () Bool)

(assert (=> start!16482 m!193737))

(check-sat tp_is_empty!3613 (not b!163754) (not start!16482) b_and!10199 (not mapNonEmpty!6132) (not b!163755) (not b!163757) (not b!163759) (not b!163762) (not b_next!3811))
(check-sat b_and!10199 (not b_next!3811))
(get-model)

(declare-fun d!51351 () Bool)

(assert (=> d!51351 (= (validMask!0 (mask!8035 thiss!1248)) (and (or (= (mask!8035 thiss!1248) #b00000000000000000000000000000111) (= (mask!8035 thiss!1248) #b00000000000000000000000000001111) (= (mask!8035 thiss!1248) #b00000000000000000000000000011111) (= (mask!8035 thiss!1248) #b00000000000000000000000000111111) (= (mask!8035 thiss!1248) #b00000000000000000000000001111111) (= (mask!8035 thiss!1248) #b00000000000000000000000011111111) (= (mask!8035 thiss!1248) #b00000000000000000000000111111111) (= (mask!8035 thiss!1248) #b00000000000000000000001111111111) (= (mask!8035 thiss!1248) #b00000000000000000000011111111111) (= (mask!8035 thiss!1248) #b00000000000000000000111111111111) (= (mask!8035 thiss!1248) #b00000000000000000001111111111111) (= (mask!8035 thiss!1248) #b00000000000000000011111111111111) (= (mask!8035 thiss!1248) #b00000000000000000111111111111111) (= (mask!8035 thiss!1248) #b00000000000000001111111111111111) (= (mask!8035 thiss!1248) #b00000000000000011111111111111111) (= (mask!8035 thiss!1248) #b00000000000000111111111111111111) (= (mask!8035 thiss!1248) #b00000000000001111111111111111111) (= (mask!8035 thiss!1248) #b00000000000011111111111111111111) (= (mask!8035 thiss!1248) #b00000000000111111111111111111111) (= (mask!8035 thiss!1248) #b00000000001111111111111111111111) (= (mask!8035 thiss!1248) #b00000000011111111111111111111111) (= (mask!8035 thiss!1248) #b00000000111111111111111111111111) (= (mask!8035 thiss!1248) #b00000001111111111111111111111111) (= (mask!8035 thiss!1248) #b00000011111111111111111111111111) (= (mask!8035 thiss!1248) #b00000111111111111111111111111111) (= (mask!8035 thiss!1248) #b00001111111111111111111111111111) (= (mask!8035 thiss!1248) #b00011111111111111111111111111111) (= (mask!8035 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8035 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163755 d!51351))

(declare-fun b!163834 () Bool)

(declare-fun e!107496 () Bool)

(declare-fun e!107499 () Bool)

(assert (=> b!163834 (= e!107496 e!107499)))

(declare-fun c!30140 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!163834 (= c!30140 (validKeyInArray!0 (select (arr!2986 (_keys!5179 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163835 () Bool)

(declare-fun call!17302 () Bool)

(assert (=> b!163835 (= e!107499 call!17302)))

(declare-fun d!51353 () Bool)

(declare-fun res!77500 () Bool)

(declare-fun e!107498 () Bool)

(assert (=> d!51353 (=> res!77500 e!107498)))

(assert (=> d!51353 (= res!77500 (bvsge #b00000000000000000000000000000000 (size!3275 (_keys!5179 thiss!1248))))))

(assert (=> d!51353 (= (arrayNoDuplicates!0 (_keys!5179 thiss!1248) #b00000000000000000000000000000000 Nil!1997) e!107498)))

(declare-fun b!163836 () Bool)

(declare-fun e!107497 () Bool)

(declare-fun contains!1032 (List!2000 (_ BitVec 64)) Bool)

(assert (=> b!163836 (= e!107497 (contains!1032 Nil!1997 (select (arr!2986 (_keys!5179 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163837 () Bool)

(assert (=> b!163837 (= e!107499 call!17302)))

(declare-fun bm!17299 () Bool)

(assert (=> bm!17299 (= call!17302 (arrayNoDuplicates!0 (_keys!5179 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30140 (Cons!1996 (select (arr!2986 (_keys!5179 thiss!1248)) #b00000000000000000000000000000000) Nil!1997) Nil!1997)))))

(declare-fun b!163838 () Bool)

(assert (=> b!163838 (= e!107498 e!107496)))

(declare-fun res!77498 () Bool)

(assert (=> b!163838 (=> (not res!77498) (not e!107496))))

(assert (=> b!163838 (= res!77498 (not e!107497))))

(declare-fun res!77499 () Bool)

(assert (=> b!163838 (=> (not res!77499) (not e!107497))))

(assert (=> b!163838 (= res!77499 (validKeyInArray!0 (select (arr!2986 (_keys!5179 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51353 (not res!77500)) b!163838))

(assert (= (and b!163838 res!77499) b!163836))

(assert (= (and b!163838 res!77498) b!163834))

(assert (= (and b!163834 c!30140) b!163835))

(assert (= (and b!163834 (not c!30140)) b!163837))

(assert (= (or b!163835 b!163837) bm!17299))

(declare-fun m!193771 () Bool)

(assert (=> b!163834 m!193771))

(assert (=> b!163834 m!193771))

(declare-fun m!193773 () Bool)

(assert (=> b!163834 m!193773))

(assert (=> b!163836 m!193771))

(assert (=> b!163836 m!193771))

(declare-fun m!193775 () Bool)

(assert (=> b!163836 m!193775))

(assert (=> bm!17299 m!193771))

(declare-fun m!193777 () Bool)

(assert (=> bm!17299 m!193777))

(assert (=> b!163838 m!193771))

(assert (=> b!163838 m!193771))

(assert (=> b!163838 m!193773))

(assert (=> b!163759 d!51353))

(declare-fun d!51355 () Bool)

(declare-fun res!77507 () Bool)

(declare-fun e!107502 () Bool)

(assert (=> d!51355 (=> (not res!77507) (not e!107502))))

(declare-fun simpleValid!125 (LongMapFixedSize!1834) Bool)

(assert (=> d!51355 (= res!77507 (simpleValid!125 thiss!1248))))

(assert (=> d!51355 (= (valid!827 thiss!1248) e!107502)))

(declare-fun b!163845 () Bool)

(declare-fun res!77508 () Bool)

(assert (=> b!163845 (=> (not res!77508) (not e!107502))))

(declare-fun arrayCountValidKeys!0 (array!6299 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163845 (= res!77508 (= (arrayCountValidKeys!0 (_keys!5179 thiss!1248) #b00000000000000000000000000000000 (size!3275 (_keys!5179 thiss!1248))) (_size!966 thiss!1248)))))

(declare-fun b!163846 () Bool)

(declare-fun res!77509 () Bool)

(assert (=> b!163846 (=> (not res!77509) (not e!107502))))

(assert (=> b!163846 (= res!77509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5179 thiss!1248) (mask!8035 thiss!1248)))))

(declare-fun b!163847 () Bool)

(assert (=> b!163847 (= e!107502 (arrayNoDuplicates!0 (_keys!5179 thiss!1248) #b00000000000000000000000000000000 Nil!1997))))

(assert (= (and d!51355 res!77507) b!163845))

(assert (= (and b!163845 res!77508) b!163846))

(assert (= (and b!163846 res!77509) b!163847))

(declare-fun m!193779 () Bool)

(assert (=> d!51355 m!193779))

(declare-fun m!193781 () Bool)

(assert (=> b!163845 m!193781))

(assert (=> b!163846 m!193725))

(assert (=> b!163847 m!193727))

(assert (=> start!16482 d!51355))

(declare-fun b!163856 () Bool)

(declare-fun e!107511 () Bool)

(declare-fun e!107509 () Bool)

(assert (=> b!163856 (= e!107511 e!107509)))

(declare-fun c!30143 () Bool)

(assert (=> b!163856 (= c!30143 (validKeyInArray!0 (select (arr!2986 (_keys!5179 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163857 () Bool)

(declare-fun e!107510 () Bool)

(declare-fun call!17305 () Bool)

(assert (=> b!163857 (= e!107510 call!17305)))

(declare-fun bm!17302 () Bool)

(assert (=> bm!17302 (= call!17305 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5179 thiss!1248) (mask!8035 thiss!1248)))))

(declare-fun b!163858 () Bool)

(assert (=> b!163858 (= e!107509 e!107510)))

(declare-fun lt!82626 () (_ BitVec 64))

(assert (=> b!163858 (= lt!82626 (select (arr!2986 (_keys!5179 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5015 0))(
  ( (Unit!5016) )
))
(declare-fun lt!82625 () Unit!5015)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6299 (_ BitVec 64) (_ BitVec 32)) Unit!5015)

(assert (=> b!163858 (= lt!82625 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5179 thiss!1248) lt!82626 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!163858 (arrayContainsKey!0 (_keys!5179 thiss!1248) lt!82626 #b00000000000000000000000000000000)))

(declare-fun lt!82624 () Unit!5015)

(assert (=> b!163858 (= lt!82624 lt!82625)))

(declare-fun res!77514 () Bool)

(assert (=> b!163858 (= res!77514 (= (seekEntryOrOpen!0 (select (arr!2986 (_keys!5179 thiss!1248)) #b00000000000000000000000000000000) (_keys!5179 thiss!1248) (mask!8035 thiss!1248)) (Found!416 #b00000000000000000000000000000000)))))

(assert (=> b!163858 (=> (not res!77514) (not e!107510))))

(declare-fun d!51357 () Bool)

(declare-fun res!77515 () Bool)

(assert (=> d!51357 (=> res!77515 e!107511)))

(assert (=> d!51357 (= res!77515 (bvsge #b00000000000000000000000000000000 (size!3275 (_keys!5179 thiss!1248))))))

(assert (=> d!51357 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5179 thiss!1248) (mask!8035 thiss!1248)) e!107511)))

(declare-fun b!163859 () Bool)

(assert (=> b!163859 (= e!107509 call!17305)))

(assert (= (and d!51357 (not res!77515)) b!163856))

(assert (= (and b!163856 c!30143) b!163858))

(assert (= (and b!163856 (not c!30143)) b!163859))

(assert (= (and b!163858 res!77514) b!163857))

(assert (= (or b!163857 b!163859) bm!17302))

(assert (=> b!163856 m!193771))

(assert (=> b!163856 m!193771))

(assert (=> b!163856 m!193773))

(declare-fun m!193783 () Bool)

(assert (=> bm!17302 m!193783))

(assert (=> b!163858 m!193771))

(declare-fun m!193785 () Bool)

(assert (=> b!163858 m!193785))

(declare-fun m!193787 () Bool)

(assert (=> b!163858 m!193787))

(assert (=> b!163858 m!193771))

(declare-fun m!193789 () Bool)

(assert (=> b!163858 m!193789))

(assert (=> b!163757 d!51357))

(declare-fun d!51359 () Bool)

(assert (=> d!51359 (= (array_inv!1925 (_keys!5179 thiss!1248)) (bvsge (size!3275 (_keys!5179 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163762 d!51359))

(declare-fun d!51361 () Bool)

(assert (=> d!51361 (= (array_inv!1926 (_values!3342 thiss!1248)) (bvsge (size!3276 (_values!3342 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163762 d!51361))

(declare-fun b!163872 () Bool)

(declare-fun e!107519 () SeekEntryResult!416)

(declare-fun lt!82634 () SeekEntryResult!416)

(assert (=> b!163872 (= e!107519 (MissingZero!416 (index!3834 lt!82634)))))

(declare-fun b!163873 () Bool)

(declare-fun e!107520 () SeekEntryResult!416)

(assert (=> b!163873 (= e!107520 (Found!416 (index!3834 lt!82634)))))

(declare-fun b!163874 () Bool)

(declare-fun e!107518 () SeekEntryResult!416)

(assert (=> b!163874 (= e!107518 e!107520)))

(declare-fun lt!82633 () (_ BitVec 64))

(assert (=> b!163874 (= lt!82633 (select (arr!2986 (_keys!5179 thiss!1248)) (index!3834 lt!82634)))))

(declare-fun c!30152 () Bool)

(assert (=> b!163874 (= c!30152 (= lt!82633 key!828))))

(declare-fun b!163876 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6299 (_ BitVec 32)) SeekEntryResult!416)

(assert (=> b!163876 (= e!107519 (seekKeyOrZeroReturnVacant!0 (x!18187 lt!82634) (index!3834 lt!82634) (index!3834 lt!82634) key!828 (_keys!5179 thiss!1248) (mask!8035 thiss!1248)))))

(declare-fun b!163877 () Bool)

(declare-fun c!30151 () Bool)

(assert (=> b!163877 (= c!30151 (= lt!82633 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163877 (= e!107520 e!107519)))

(declare-fun b!163875 () Bool)

(assert (=> b!163875 (= e!107518 Undefined!416)))

(declare-fun d!51363 () Bool)

(declare-fun lt!82635 () SeekEntryResult!416)

(assert (=> d!51363 (and (or ((_ is Undefined!416) lt!82635) (not ((_ is Found!416) lt!82635)) (and (bvsge (index!3833 lt!82635) #b00000000000000000000000000000000) (bvslt (index!3833 lt!82635) (size!3275 (_keys!5179 thiss!1248))))) (or ((_ is Undefined!416) lt!82635) ((_ is Found!416) lt!82635) (not ((_ is MissingZero!416) lt!82635)) (and (bvsge (index!3832 lt!82635) #b00000000000000000000000000000000) (bvslt (index!3832 lt!82635) (size!3275 (_keys!5179 thiss!1248))))) (or ((_ is Undefined!416) lt!82635) ((_ is Found!416) lt!82635) ((_ is MissingZero!416) lt!82635) (not ((_ is MissingVacant!416) lt!82635)) (and (bvsge (index!3835 lt!82635) #b00000000000000000000000000000000) (bvslt (index!3835 lt!82635) (size!3275 (_keys!5179 thiss!1248))))) (or ((_ is Undefined!416) lt!82635) (ite ((_ is Found!416) lt!82635) (= (select (arr!2986 (_keys!5179 thiss!1248)) (index!3833 lt!82635)) key!828) (ite ((_ is MissingZero!416) lt!82635) (= (select (arr!2986 (_keys!5179 thiss!1248)) (index!3832 lt!82635)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!416) lt!82635) (= (select (arr!2986 (_keys!5179 thiss!1248)) (index!3835 lt!82635)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51363 (= lt!82635 e!107518)))

(declare-fun c!30150 () Bool)

(assert (=> d!51363 (= c!30150 (and ((_ is Intermediate!416) lt!82634) (undefined!1228 lt!82634)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6299 (_ BitVec 32)) SeekEntryResult!416)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51363 (= lt!82634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8035 thiss!1248)) key!828 (_keys!5179 thiss!1248) (mask!8035 thiss!1248)))))

(assert (=> d!51363 (validMask!0 (mask!8035 thiss!1248))))

(assert (=> d!51363 (= (seekEntryOrOpen!0 key!828 (_keys!5179 thiss!1248) (mask!8035 thiss!1248)) lt!82635)))

(assert (= (and d!51363 c!30150) b!163875))

(assert (= (and d!51363 (not c!30150)) b!163874))

(assert (= (and b!163874 c!30152) b!163873))

(assert (= (and b!163874 (not c!30152)) b!163877))

(assert (= (and b!163877 c!30151) b!163872))

(assert (= (and b!163877 (not c!30151)) b!163876))

(declare-fun m!193791 () Bool)

(assert (=> b!163874 m!193791))

(declare-fun m!193793 () Bool)

(assert (=> b!163876 m!193793))

(declare-fun m!193795 () Bool)

(assert (=> d!51363 m!193795))

(declare-fun m!193797 () Bool)

(assert (=> d!51363 m!193797))

(declare-fun m!193799 () Bool)

(assert (=> d!51363 m!193799))

(assert (=> d!51363 m!193729))

(declare-fun m!193801 () Bool)

(assert (=> d!51363 m!193801))

(assert (=> d!51363 m!193799))

(declare-fun m!193803 () Bool)

(assert (=> d!51363 m!193803))

(assert (=> b!163754 d!51363))

(declare-fun condMapEmpty!6141 () Bool)

(declare-fun mapDefault!6141 () ValueCell!1463)

(assert (=> mapNonEmpty!6132 (= condMapEmpty!6141 (= mapRest!6132 ((as const (Array (_ BitVec 32) ValueCell!1463)) mapDefault!6141)))))

(declare-fun e!107525 () Bool)

(declare-fun mapRes!6141 () Bool)

(assert (=> mapNonEmpty!6132 (= tp!14027 (and e!107525 mapRes!6141))))

(declare-fun b!163885 () Bool)

(assert (=> b!163885 (= e!107525 tp_is_empty!3613)))

(declare-fun mapNonEmpty!6141 () Bool)

(declare-fun tp!14043 () Bool)

(declare-fun e!107526 () Bool)

(assert (=> mapNonEmpty!6141 (= mapRes!6141 (and tp!14043 e!107526))))

(declare-fun mapRest!6141 () (Array (_ BitVec 32) ValueCell!1463))

(declare-fun mapKey!6141 () (_ BitVec 32))

(declare-fun mapValue!6141 () ValueCell!1463)

(assert (=> mapNonEmpty!6141 (= mapRest!6132 (store mapRest!6141 mapKey!6141 mapValue!6141))))

(declare-fun b!163884 () Bool)

(assert (=> b!163884 (= e!107526 tp_is_empty!3613)))

(declare-fun mapIsEmpty!6141 () Bool)

(assert (=> mapIsEmpty!6141 mapRes!6141))

(assert (= (and mapNonEmpty!6132 condMapEmpty!6141) mapIsEmpty!6141))

(assert (= (and mapNonEmpty!6132 (not condMapEmpty!6141)) mapNonEmpty!6141))

(assert (= (and mapNonEmpty!6141 ((_ is ValueCellFull!1463) mapValue!6141)) b!163884))

(assert (= (and mapNonEmpty!6132 ((_ is ValueCellFull!1463) mapDefault!6141)) b!163885))

(declare-fun m!193805 () Bool)

(assert (=> mapNonEmpty!6141 m!193805))

(check-sat (not b!163845) tp_is_empty!3613 (not b!163858) (not bm!17302) b_and!10199 (not b!163834) (not d!51363) (not b!163846) (not b_next!3811) (not b!163836) (not b!163876) (not d!51355) (not mapNonEmpty!6141) (not b!163856) (not b!163838) (not b!163847) (not bm!17299))
(check-sat b_and!10199 (not b_next!3811))
