; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16828 () Bool)

(assert start!16828)

(declare-fun b!169499 () Bool)

(declare-fun b_free!4159 () Bool)

(declare-fun b_next!4159 () Bool)

(assert (=> b!169499 (= b_free!4159 (not b_next!4159))))

(declare-fun tp!15077 () Bool)

(declare-fun b_and!10547 () Bool)

(assert (=> b!169499 (= tp!15077 b_and!10547)))

(declare-fun mapIsEmpty!6660 () Bool)

(declare-fun mapRes!6660 () Bool)

(assert (=> mapIsEmpty!6660 mapRes!6660))

(declare-fun b!169495 () Bool)

(declare-fun e!111774 () Bool)

(declare-fun e!111775 () Bool)

(assert (=> b!169495 (= e!111774 (and e!111775 mapRes!6660))))

(declare-fun condMapEmpty!6660 () Bool)

(declare-datatypes ((V!4889 0))(
  ( (V!4890 (val!2010 Int)) )
))
(declare-datatypes ((ValueCell!1622 0))(
  ( (ValueCellFull!1622 (v!3869 V!4889)) (EmptyCell!1622) )
))
(declare-datatypes ((array!6939 0))(
  ( (array!6940 (arr!3304 (Array (_ BitVec 32) (_ BitVec 64))) (size!3593 (_ BitVec 32))) )
))
(declare-datatypes ((array!6941 0))(
  ( (array!6942 (arr!3305 (Array (_ BitVec 32) ValueCell!1622)) (size!3594 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2152 0))(
  ( (LongMapFixedSize!2153 (defaultEntry!3518 Int) (mask!8306 (_ BitVec 32)) (extraKeys!3259 (_ BitVec 32)) (zeroValue!3361 V!4889) (minValue!3361 V!4889) (_size!1125 (_ BitVec 32)) (_keys!5342 array!6939) (_values!3501 array!6941) (_vacant!1125 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2152)

(declare-fun mapDefault!6660 () ValueCell!1622)

(assert (=> b!169495 (= condMapEmpty!6660 (= (arr!3305 (_values!3501 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1622)) mapDefault!6660)))))

(declare-fun b!169496 () Bool)

(declare-fun e!111777 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!169496 (= e!111777 (not (validMask!0 (mask!8306 thiss!1248))))))

(declare-fun b!169497 () Bool)

(declare-fun tp_is_empty!3931 () Bool)

(assert (=> b!169497 (= e!111775 tp_is_empty!3931)))

(declare-fun b!169498 () Bool)

(declare-fun res!80559 () Bool)

(assert (=> b!169498 (=> (not res!80559) (not e!111777))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169498 (= res!80559 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!6660 () Bool)

(declare-fun tp!15078 () Bool)

(declare-fun e!111772 () Bool)

(assert (=> mapNonEmpty!6660 (= mapRes!6660 (and tp!15078 e!111772))))

(declare-fun mapValue!6660 () ValueCell!1622)

(declare-fun mapKey!6660 () (_ BitVec 32))

(declare-fun mapRest!6660 () (Array (_ BitVec 32) ValueCell!1622))

(assert (=> mapNonEmpty!6660 (= (arr!3305 (_values!3501 thiss!1248)) (store mapRest!6660 mapKey!6660 mapValue!6660))))

(declare-fun res!80560 () Bool)

(assert (=> start!16828 (=> (not res!80560) (not e!111777))))

(declare-fun valid!942 (LongMapFixedSize!2152) Bool)

(assert (=> start!16828 (= res!80560 (valid!942 thiss!1248))))

(assert (=> start!16828 e!111777))

(declare-fun e!111776 () Bool)

(assert (=> start!16828 e!111776))

(assert (=> start!16828 true))

(declare-fun array_inv!2125 (array!6939) Bool)

(declare-fun array_inv!2126 (array!6941) Bool)

(assert (=> b!169499 (= e!111776 (and tp!15077 tp_is_empty!3931 (array_inv!2125 (_keys!5342 thiss!1248)) (array_inv!2126 (_values!3501 thiss!1248)) e!111774))))

(declare-fun b!169500 () Bool)

(assert (=> b!169500 (= e!111772 tp_is_empty!3931)))

(assert (= (and start!16828 res!80560) b!169498))

(assert (= (and b!169498 res!80559) b!169496))

(assert (= (and b!169495 condMapEmpty!6660) mapIsEmpty!6660))

(assert (= (and b!169495 (not condMapEmpty!6660)) mapNonEmpty!6660))

(get-info :version)

(assert (= (and mapNonEmpty!6660 ((_ is ValueCellFull!1622) mapValue!6660)) b!169500))

(assert (= (and b!169495 ((_ is ValueCellFull!1622) mapDefault!6660)) b!169497))

(assert (= b!169499 b!169495))

(assert (= start!16828 b!169499))

(declare-fun m!197953 () Bool)

(assert (=> b!169496 m!197953))

(declare-fun m!197955 () Bool)

(assert (=> mapNonEmpty!6660 m!197955))

(declare-fun m!197957 () Bool)

(assert (=> start!16828 m!197957))

(declare-fun m!197959 () Bool)

(assert (=> b!169499 m!197959))

(declare-fun m!197961 () Bool)

(assert (=> b!169499 m!197961))

(check-sat (not mapNonEmpty!6660) tp_is_empty!3931 (not start!16828) (not b!169496) (not b_next!4159) b_and!10547 (not b!169499))
(check-sat b_and!10547 (not b_next!4159))
(get-model)

(declare-fun d!51485 () Bool)

(assert (=> d!51485 (= (array_inv!2125 (_keys!5342 thiss!1248)) (bvsge (size!3593 (_keys!5342 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169499 d!51485))

(declare-fun d!51487 () Bool)

(assert (=> d!51487 (= (array_inv!2126 (_values!3501 thiss!1248)) (bvsge (size!3594 (_values!3501 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169499 d!51487))

(declare-fun d!51489 () Bool)

(assert (=> d!51489 (= (validMask!0 (mask!8306 thiss!1248)) (and (or (= (mask!8306 thiss!1248) #b00000000000000000000000000000111) (= (mask!8306 thiss!1248) #b00000000000000000000000000001111) (= (mask!8306 thiss!1248) #b00000000000000000000000000011111) (= (mask!8306 thiss!1248) #b00000000000000000000000000111111) (= (mask!8306 thiss!1248) #b00000000000000000000000001111111) (= (mask!8306 thiss!1248) #b00000000000000000000000011111111) (= (mask!8306 thiss!1248) #b00000000000000000000000111111111) (= (mask!8306 thiss!1248) #b00000000000000000000001111111111) (= (mask!8306 thiss!1248) #b00000000000000000000011111111111) (= (mask!8306 thiss!1248) #b00000000000000000000111111111111) (= (mask!8306 thiss!1248) #b00000000000000000001111111111111) (= (mask!8306 thiss!1248) #b00000000000000000011111111111111) (= (mask!8306 thiss!1248) #b00000000000000000111111111111111) (= (mask!8306 thiss!1248) #b00000000000000001111111111111111) (= (mask!8306 thiss!1248) #b00000000000000011111111111111111) (= (mask!8306 thiss!1248) #b00000000000000111111111111111111) (= (mask!8306 thiss!1248) #b00000000000001111111111111111111) (= (mask!8306 thiss!1248) #b00000000000011111111111111111111) (= (mask!8306 thiss!1248) #b00000000000111111111111111111111) (= (mask!8306 thiss!1248) #b00000000001111111111111111111111) (= (mask!8306 thiss!1248) #b00000000011111111111111111111111) (= (mask!8306 thiss!1248) #b00000000111111111111111111111111) (= (mask!8306 thiss!1248) #b00000001111111111111111111111111) (= (mask!8306 thiss!1248) #b00000011111111111111111111111111) (= (mask!8306 thiss!1248) #b00000111111111111111111111111111) (= (mask!8306 thiss!1248) #b00001111111111111111111111111111) (= (mask!8306 thiss!1248) #b00011111111111111111111111111111) (= (mask!8306 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8306 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!169496 d!51489))

(declare-fun d!51491 () Bool)

(declare-fun res!80579 () Bool)

(declare-fun e!111816 () Bool)

(assert (=> d!51491 (=> (not res!80579) (not e!111816))))

(declare-fun simpleValid!127 (LongMapFixedSize!2152) Bool)

(assert (=> d!51491 (= res!80579 (simpleValid!127 thiss!1248))))

(assert (=> d!51491 (= (valid!942 thiss!1248) e!111816)))

(declare-fun b!169543 () Bool)

(declare-fun res!80580 () Bool)

(assert (=> b!169543 (=> (not res!80580) (not e!111816))))

(declare-fun arrayCountValidKeys!0 (array!6939 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!169543 (= res!80580 (= (arrayCountValidKeys!0 (_keys!5342 thiss!1248) #b00000000000000000000000000000000 (size!3593 (_keys!5342 thiss!1248))) (_size!1125 thiss!1248)))))

(declare-fun b!169544 () Bool)

(declare-fun res!80581 () Bool)

(assert (=> b!169544 (=> (not res!80581) (not e!111816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6939 (_ BitVec 32)) Bool)

(assert (=> b!169544 (= res!80581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5342 thiss!1248) (mask!8306 thiss!1248)))))

(declare-fun b!169545 () Bool)

(declare-datatypes ((List!2194 0))(
  ( (Nil!2191) (Cons!2190 (h!2807 (_ BitVec 64)) (t!6987 List!2194)) )
))
(declare-fun arrayNoDuplicates!0 (array!6939 (_ BitVec 32) List!2194) Bool)

(assert (=> b!169545 (= e!111816 (arrayNoDuplicates!0 (_keys!5342 thiss!1248) #b00000000000000000000000000000000 Nil!2191))))

(assert (= (and d!51491 res!80579) b!169543))

(assert (= (and b!169543 res!80580) b!169544))

(assert (= (and b!169544 res!80581) b!169545))

(declare-fun m!197983 () Bool)

(assert (=> d!51491 m!197983))

(declare-fun m!197985 () Bool)

(assert (=> b!169543 m!197985))

(declare-fun m!197987 () Bool)

(assert (=> b!169544 m!197987))

(declare-fun m!197989 () Bool)

(assert (=> b!169545 m!197989))

(assert (=> start!16828 d!51491))

(declare-fun b!169553 () Bool)

(declare-fun e!111822 () Bool)

(assert (=> b!169553 (= e!111822 tp_is_empty!3931)))

(declare-fun mapIsEmpty!6669 () Bool)

(declare-fun mapRes!6669 () Bool)

(assert (=> mapIsEmpty!6669 mapRes!6669))

(declare-fun b!169552 () Bool)

(declare-fun e!111821 () Bool)

(assert (=> b!169552 (= e!111821 tp_is_empty!3931)))

(declare-fun mapNonEmpty!6669 () Bool)

(declare-fun tp!15093 () Bool)

(assert (=> mapNonEmpty!6669 (= mapRes!6669 (and tp!15093 e!111821))))

(declare-fun mapKey!6669 () (_ BitVec 32))

(declare-fun mapRest!6669 () (Array (_ BitVec 32) ValueCell!1622))

(declare-fun mapValue!6669 () ValueCell!1622)

(assert (=> mapNonEmpty!6669 (= mapRest!6660 (store mapRest!6669 mapKey!6669 mapValue!6669))))

(declare-fun condMapEmpty!6669 () Bool)

(declare-fun mapDefault!6669 () ValueCell!1622)

(assert (=> mapNonEmpty!6660 (= condMapEmpty!6669 (= mapRest!6660 ((as const (Array (_ BitVec 32) ValueCell!1622)) mapDefault!6669)))))

(assert (=> mapNonEmpty!6660 (= tp!15078 (and e!111822 mapRes!6669))))

(assert (= (and mapNonEmpty!6660 condMapEmpty!6669) mapIsEmpty!6669))

(assert (= (and mapNonEmpty!6660 (not condMapEmpty!6669)) mapNonEmpty!6669))

(assert (= (and mapNonEmpty!6669 ((_ is ValueCellFull!1622) mapValue!6669)) b!169552))

(assert (= (and mapNonEmpty!6660 ((_ is ValueCellFull!1622) mapDefault!6669)) b!169553))

(declare-fun m!197991 () Bool)

(assert (=> mapNonEmpty!6669 m!197991))

(check-sat (not b!169545) (not d!51491) (not b!169543) tp_is_empty!3931 (not mapNonEmpty!6669) b_and!10547 (not b_next!4159) (not b!169544))
(check-sat b_and!10547 (not b_next!4159))
(get-model)

(declare-fun b!169565 () Bool)

(declare-fun e!111825 () Bool)

(assert (=> b!169565 (= e!111825 (and (bvsge (extraKeys!3259 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3259 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1125 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!169564 () Bool)

(declare-fun res!80593 () Bool)

(assert (=> b!169564 (=> (not res!80593) (not e!111825))))

(declare-fun size!3599 (LongMapFixedSize!2152) (_ BitVec 32))

(assert (=> b!169564 (= res!80593 (= (size!3599 thiss!1248) (bvadd (_size!1125 thiss!1248) (bvsdiv (bvadd (extraKeys!3259 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!169562 () Bool)

(declare-fun res!80592 () Bool)

(assert (=> b!169562 (=> (not res!80592) (not e!111825))))

(assert (=> b!169562 (= res!80592 (and (= (size!3594 (_values!3501 thiss!1248)) (bvadd (mask!8306 thiss!1248) #b00000000000000000000000000000001)) (= (size!3593 (_keys!5342 thiss!1248)) (size!3594 (_values!3501 thiss!1248))) (bvsge (_size!1125 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1125 thiss!1248) (bvadd (mask!8306 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!51493 () Bool)

(declare-fun res!80590 () Bool)

(assert (=> d!51493 (=> (not res!80590) (not e!111825))))

(assert (=> d!51493 (= res!80590 (validMask!0 (mask!8306 thiss!1248)))))

(assert (=> d!51493 (= (simpleValid!127 thiss!1248) e!111825)))

(declare-fun b!169563 () Bool)

(declare-fun res!80591 () Bool)

(assert (=> b!169563 (=> (not res!80591) (not e!111825))))

(assert (=> b!169563 (= res!80591 (bvsge (size!3599 thiss!1248) (_size!1125 thiss!1248)))))

(assert (= (and d!51493 res!80590) b!169562))

(assert (= (and b!169562 res!80592) b!169563))

(assert (= (and b!169563 res!80591) b!169564))

(assert (= (and b!169564 res!80593) b!169565))

(declare-fun m!197993 () Bool)

(assert (=> b!169564 m!197993))

(assert (=> d!51493 m!197953))

(assert (=> b!169563 m!197993))

(assert (=> d!51491 d!51493))

(declare-fun b!169574 () Bool)

(declare-fun e!111831 () (_ BitVec 32))

(declare-fun call!17314 () (_ BitVec 32))

(assert (=> b!169574 (= e!111831 (bvadd #b00000000000000000000000000000001 call!17314))))

(declare-fun bm!17311 () Bool)

(assert (=> bm!17311 (= call!17314 (arrayCountValidKeys!0 (_keys!5342 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3593 (_keys!5342 thiss!1248))))))

(declare-fun b!169575 () Bool)

(assert (=> b!169575 (= e!111831 call!17314)))

(declare-fun b!169576 () Bool)

(declare-fun e!111830 () (_ BitVec 32))

(assert (=> b!169576 (= e!111830 #b00000000000000000000000000000000)))

(declare-fun b!169577 () Bool)

(assert (=> b!169577 (= e!111830 e!111831)))

(declare-fun c!30406 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!169577 (= c!30406 (validKeyInArray!0 (select (arr!3304 (_keys!5342 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51495 () Bool)

(declare-fun lt!84771 () (_ BitVec 32))

(assert (=> d!51495 (and (bvsge lt!84771 #b00000000000000000000000000000000) (bvsle lt!84771 (bvsub (size!3593 (_keys!5342 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51495 (= lt!84771 e!111830)))

(declare-fun c!30407 () Bool)

(assert (=> d!51495 (= c!30407 (bvsge #b00000000000000000000000000000000 (size!3593 (_keys!5342 thiss!1248))))))

(assert (=> d!51495 (and (bvsle #b00000000000000000000000000000000 (size!3593 (_keys!5342 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3593 (_keys!5342 thiss!1248)) (size!3593 (_keys!5342 thiss!1248))))))

(assert (=> d!51495 (= (arrayCountValidKeys!0 (_keys!5342 thiss!1248) #b00000000000000000000000000000000 (size!3593 (_keys!5342 thiss!1248))) lt!84771)))

(assert (= (and d!51495 c!30407) b!169576))

(assert (= (and d!51495 (not c!30407)) b!169577))

(assert (= (and b!169577 c!30406) b!169574))

(assert (= (and b!169577 (not c!30406)) b!169575))

(assert (= (or b!169574 b!169575) bm!17311))

(declare-fun m!197995 () Bool)

(assert (=> bm!17311 m!197995))

(declare-fun m!197997 () Bool)

(assert (=> b!169577 m!197997))

(assert (=> b!169577 m!197997))

(declare-fun m!197999 () Bool)

(assert (=> b!169577 m!197999))

(assert (=> b!169543 d!51495))

(declare-fun b!169586 () Bool)

(declare-fun e!111839 () Bool)

(declare-fun call!17317 () Bool)

(assert (=> b!169586 (= e!111839 call!17317)))

(declare-fun bm!17314 () Bool)

(assert (=> bm!17314 (= call!17317 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5342 thiss!1248) (mask!8306 thiss!1248)))))

(declare-fun b!169587 () Bool)

(declare-fun e!111840 () Bool)

(assert (=> b!169587 (= e!111840 call!17317)))

(declare-fun b!169588 () Bool)

(declare-fun e!111838 () Bool)

(assert (=> b!169588 (= e!111838 e!111840)))

(declare-fun c!30410 () Bool)

(assert (=> b!169588 (= c!30410 (validKeyInArray!0 (select (arr!3304 (_keys!5342 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51497 () Bool)

(declare-fun res!80598 () Bool)

(assert (=> d!51497 (=> res!80598 e!111838)))

(assert (=> d!51497 (= res!80598 (bvsge #b00000000000000000000000000000000 (size!3593 (_keys!5342 thiss!1248))))))

(assert (=> d!51497 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5342 thiss!1248) (mask!8306 thiss!1248)) e!111838)))

(declare-fun b!169589 () Bool)

(assert (=> b!169589 (= e!111840 e!111839)))

(declare-fun lt!84780 () (_ BitVec 64))

(assert (=> b!169589 (= lt!84780 (select (arr!3304 (_keys!5342 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5213 0))(
  ( (Unit!5214) )
))
(declare-fun lt!84778 () Unit!5213)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6939 (_ BitVec 64) (_ BitVec 32)) Unit!5213)

(assert (=> b!169589 (= lt!84778 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5342 thiss!1248) lt!84780 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!169589 (arrayContainsKey!0 (_keys!5342 thiss!1248) lt!84780 #b00000000000000000000000000000000)))

(declare-fun lt!84779 () Unit!5213)

(assert (=> b!169589 (= lt!84779 lt!84778)))

(declare-fun res!80599 () Bool)

(declare-datatypes ((SeekEntryResult!538 0))(
  ( (MissingZero!538 (index!4320 (_ BitVec 32))) (Found!538 (index!4321 (_ BitVec 32))) (Intermediate!538 (undefined!1350 Bool) (index!4322 (_ BitVec 32)) (x!18763 (_ BitVec 32))) (Undefined!538) (MissingVacant!538 (index!4323 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6939 (_ BitVec 32)) SeekEntryResult!538)

(assert (=> b!169589 (= res!80599 (= (seekEntryOrOpen!0 (select (arr!3304 (_keys!5342 thiss!1248)) #b00000000000000000000000000000000) (_keys!5342 thiss!1248) (mask!8306 thiss!1248)) (Found!538 #b00000000000000000000000000000000)))))

(assert (=> b!169589 (=> (not res!80599) (not e!111839))))

(assert (= (and d!51497 (not res!80598)) b!169588))

(assert (= (and b!169588 c!30410) b!169589))

(assert (= (and b!169588 (not c!30410)) b!169587))

(assert (= (and b!169589 res!80599) b!169586))

(assert (= (or b!169586 b!169587) bm!17314))

(declare-fun m!198001 () Bool)

(assert (=> bm!17314 m!198001))

(assert (=> b!169588 m!197997))

(assert (=> b!169588 m!197997))

(assert (=> b!169588 m!197999))

(assert (=> b!169589 m!197997))

(declare-fun m!198003 () Bool)

(assert (=> b!169589 m!198003))

(declare-fun m!198005 () Bool)

(assert (=> b!169589 m!198005))

(assert (=> b!169589 m!197997))

(declare-fun m!198007 () Bool)

(assert (=> b!169589 m!198007))

(assert (=> b!169544 d!51497))

(declare-fun d!51499 () Bool)

(declare-fun res!80608 () Bool)

(declare-fun e!111850 () Bool)

(assert (=> d!51499 (=> res!80608 e!111850)))

(assert (=> d!51499 (= res!80608 (bvsge #b00000000000000000000000000000000 (size!3593 (_keys!5342 thiss!1248))))))

(assert (=> d!51499 (= (arrayNoDuplicates!0 (_keys!5342 thiss!1248) #b00000000000000000000000000000000 Nil!2191) e!111850)))

(declare-fun b!169600 () Bool)

(declare-fun e!111852 () Bool)

(declare-fun call!17320 () Bool)

(assert (=> b!169600 (= e!111852 call!17320)))

(declare-fun b!169601 () Bool)

(declare-fun e!111851 () Bool)

(declare-fun contains!1136 (List!2194 (_ BitVec 64)) Bool)

(assert (=> b!169601 (= e!111851 (contains!1136 Nil!2191 (select (arr!3304 (_keys!5342 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169602 () Bool)

(declare-fun e!111849 () Bool)

(assert (=> b!169602 (= e!111849 e!111852)))

(declare-fun c!30413 () Bool)

(assert (=> b!169602 (= c!30413 (validKeyInArray!0 (select (arr!3304 (_keys!5342 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17317 () Bool)

(assert (=> bm!17317 (= call!17320 (arrayNoDuplicates!0 (_keys!5342 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30413 (Cons!2190 (select (arr!3304 (_keys!5342 thiss!1248)) #b00000000000000000000000000000000) Nil!2191) Nil!2191)))))

(declare-fun b!169603 () Bool)

(assert (=> b!169603 (= e!111850 e!111849)))

(declare-fun res!80607 () Bool)

(assert (=> b!169603 (=> (not res!80607) (not e!111849))))

(assert (=> b!169603 (= res!80607 (not e!111851))))

(declare-fun res!80606 () Bool)

(assert (=> b!169603 (=> (not res!80606) (not e!111851))))

(assert (=> b!169603 (= res!80606 (validKeyInArray!0 (select (arr!3304 (_keys!5342 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169604 () Bool)

(assert (=> b!169604 (= e!111852 call!17320)))

(assert (= (and d!51499 (not res!80608)) b!169603))

(assert (= (and b!169603 res!80606) b!169601))

(assert (= (and b!169603 res!80607) b!169602))

(assert (= (and b!169602 c!30413) b!169600))

(assert (= (and b!169602 (not c!30413)) b!169604))

(assert (= (or b!169600 b!169604) bm!17317))

(assert (=> b!169601 m!197997))

(assert (=> b!169601 m!197997))

(declare-fun m!198009 () Bool)

(assert (=> b!169601 m!198009))

(assert (=> b!169602 m!197997))

(assert (=> b!169602 m!197997))

(assert (=> b!169602 m!197999))

(assert (=> bm!17317 m!197997))

(declare-fun m!198011 () Bool)

(assert (=> bm!17317 m!198011))

(assert (=> b!169603 m!197997))

(assert (=> b!169603 m!197997))

(assert (=> b!169603 m!197999))

(assert (=> b!169545 d!51499))

(declare-fun b!169606 () Bool)

(declare-fun e!111854 () Bool)

(assert (=> b!169606 (= e!111854 tp_is_empty!3931)))

(declare-fun mapIsEmpty!6670 () Bool)

(declare-fun mapRes!6670 () Bool)

(assert (=> mapIsEmpty!6670 mapRes!6670))

(declare-fun b!169605 () Bool)

(declare-fun e!111853 () Bool)

(assert (=> b!169605 (= e!111853 tp_is_empty!3931)))

(declare-fun mapNonEmpty!6670 () Bool)

(declare-fun tp!15094 () Bool)

(assert (=> mapNonEmpty!6670 (= mapRes!6670 (and tp!15094 e!111853))))

(declare-fun mapValue!6670 () ValueCell!1622)

(declare-fun mapRest!6670 () (Array (_ BitVec 32) ValueCell!1622))

(declare-fun mapKey!6670 () (_ BitVec 32))

(assert (=> mapNonEmpty!6670 (= mapRest!6669 (store mapRest!6670 mapKey!6670 mapValue!6670))))

(declare-fun condMapEmpty!6670 () Bool)

(declare-fun mapDefault!6670 () ValueCell!1622)

(assert (=> mapNonEmpty!6669 (= condMapEmpty!6670 (= mapRest!6669 ((as const (Array (_ BitVec 32) ValueCell!1622)) mapDefault!6670)))))

(assert (=> mapNonEmpty!6669 (= tp!15093 (and e!111854 mapRes!6670))))

(assert (= (and mapNonEmpty!6669 condMapEmpty!6670) mapIsEmpty!6670))

(assert (= (and mapNonEmpty!6669 (not condMapEmpty!6670)) mapNonEmpty!6670))

(assert (= (and mapNonEmpty!6670 ((_ is ValueCellFull!1622) mapValue!6670)) b!169605))

(assert (= (and mapNonEmpty!6669 ((_ is ValueCellFull!1622) mapDefault!6670)) b!169606))

(declare-fun m!198013 () Bool)

(assert (=> mapNonEmpty!6670 m!198013))

(check-sat (not b!169602) (not bm!17314) (not b!169589) (not b!169577) tp_is_empty!3931 (not b!169563) (not bm!17317) (not d!51493) (not bm!17311) (not b!169564) (not b_next!4159) (not b!169588) b_and!10547 (not b!169603) (not b!169601) (not mapNonEmpty!6670))
(check-sat b_and!10547 (not b_next!4159))
