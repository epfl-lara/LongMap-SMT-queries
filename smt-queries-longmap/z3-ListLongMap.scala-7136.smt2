; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90554 () Bool)

(assert start!90554)

(declare-fun b!1035609 () Bool)

(declare-fun b_free!20869 () Bool)

(declare-fun b_next!20869 () Bool)

(assert (=> b!1035609 (= b_free!20869 (not b_next!20869))))

(declare-fun tp!73737 () Bool)

(declare-fun b_and!33343 () Bool)

(assert (=> b!1035609 (= tp!73737 b_and!33343)))

(declare-fun b!1035606 () Bool)

(declare-fun e!585640 () Bool)

(declare-fun e!585641 () Bool)

(declare-fun mapRes!38397 () Bool)

(assert (=> b!1035606 (= e!585640 (and e!585641 mapRes!38397))))

(declare-fun condMapEmpty!38397 () Bool)

(declare-datatypes ((V!37659 0))(
  ( (V!37660 (val!12345 Int)) )
))
(declare-datatypes ((ValueCell!11591 0))(
  ( (ValueCellFull!11591 (v!14924 V!37659)) (EmptyCell!11591) )
))
(declare-datatypes ((array!65213 0))(
  ( (array!65214 (arr!31392 (Array (_ BitVec 32) (_ BitVec 64))) (size!31922 (_ BitVec 32))) )
))
(declare-datatypes ((array!65215 0))(
  ( (array!65216 (arr!31393 (Array (_ BitVec 32) ValueCell!11591)) (size!31923 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5776 0))(
  ( (LongMapFixedSize!5777 (defaultEntry!6266 Int) (mask!30158 (_ BitVec 32)) (extraKeys!5996 (_ BitVec 32)) (zeroValue!6100 V!37659) (minValue!6102 V!37659) (_size!2943 (_ BitVec 32)) (_keys!11450 array!65213) (_values!6289 array!65215) (_vacant!2943 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5776)

(declare-fun mapDefault!38397 () ValueCell!11591)

(assert (=> b!1035606 (= condMapEmpty!38397 (= (arr!31393 (_values!6289 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11591)) mapDefault!38397)))))

(declare-fun b!1035607 () Bool)

(declare-fun e!585638 () Bool)

(declare-datatypes ((List!21949 0))(
  ( (Nil!21946) (Cons!21945 (h!23147 (_ BitVec 64)) (t!31143 List!21949)) )
))
(declare-fun arrayNoDuplicates!0 (array!65213 (_ BitVec 32) List!21949) Bool)

(assert (=> b!1035607 (= e!585638 (not (arrayNoDuplicates!0 (_keys!11450 thiss!1427) #b00000000000000000000000000000000 Nil!21946)))))

(declare-fun b!1035608 () Bool)

(declare-fun res!691437 () Bool)

(assert (=> b!1035608 (=> (not res!691437) (not e!585638))))

(assert (=> b!1035608 (= res!691437 (and (= (size!31923 (_values!6289 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30158 thiss!1427))) (= (size!31922 (_keys!11450 thiss!1427)) (size!31923 (_values!6289 thiss!1427))) (bvsge (mask!30158 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5996 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5996 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5996 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5996 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5996 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5996 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5996 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!691438 () Bool)

(assert (=> start!90554 (=> (not res!691438) (not e!585638))))

(declare-fun valid!2169 (LongMapFixedSize!5776) Bool)

(assert (=> start!90554 (= res!691438 (valid!2169 thiss!1427))))

(assert (=> start!90554 e!585638))

(declare-fun e!585637 () Bool)

(assert (=> start!90554 e!585637))

(assert (=> start!90554 true))

(declare-fun tp_is_empty!24589 () Bool)

(declare-fun array_inv!24279 (array!65213) Bool)

(declare-fun array_inv!24280 (array!65215) Bool)

(assert (=> b!1035609 (= e!585637 (and tp!73737 tp_is_empty!24589 (array_inv!24279 (_keys!11450 thiss!1427)) (array_inv!24280 (_values!6289 thiss!1427)) e!585640))))

(declare-fun b!1035610 () Bool)

(declare-fun e!585639 () Bool)

(assert (=> b!1035610 (= e!585639 tp_is_empty!24589)))

(declare-fun b!1035611 () Bool)

(declare-fun res!691439 () Bool)

(assert (=> b!1035611 (=> (not res!691439) (not e!585638))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035611 (= res!691439 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035612 () Bool)

(declare-fun res!691441 () Bool)

(assert (=> b!1035612 (=> (not res!691441) (not e!585638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65213 (_ BitVec 32)) Bool)

(assert (=> b!1035612 (= res!691441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11450 thiss!1427) (mask!30158 thiss!1427)))))

(declare-fun b!1035613 () Bool)

(assert (=> b!1035613 (= e!585641 tp_is_empty!24589)))

(declare-fun mapNonEmpty!38397 () Bool)

(declare-fun tp!73738 () Bool)

(assert (=> mapNonEmpty!38397 (= mapRes!38397 (and tp!73738 e!585639))))

(declare-fun mapKey!38397 () (_ BitVec 32))

(declare-fun mapRest!38397 () (Array (_ BitVec 32) ValueCell!11591))

(declare-fun mapValue!38397 () ValueCell!11591)

(assert (=> mapNonEmpty!38397 (= (arr!31393 (_values!6289 thiss!1427)) (store mapRest!38397 mapKey!38397 mapValue!38397))))

(declare-fun b!1035614 () Bool)

(declare-fun res!691440 () Bool)

(assert (=> b!1035614 (=> (not res!691440) (not e!585638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035614 (= res!691440 (validMask!0 (mask!30158 thiss!1427)))))

(declare-fun mapIsEmpty!38397 () Bool)

(assert (=> mapIsEmpty!38397 mapRes!38397))

(assert (= (and start!90554 res!691438) b!1035611))

(assert (= (and b!1035611 res!691439) b!1035614))

(assert (= (and b!1035614 res!691440) b!1035608))

(assert (= (and b!1035608 res!691437) b!1035612))

(assert (= (and b!1035612 res!691441) b!1035607))

(assert (= (and b!1035606 condMapEmpty!38397) mapIsEmpty!38397))

(assert (= (and b!1035606 (not condMapEmpty!38397)) mapNonEmpty!38397))

(get-info :version)

(assert (= (and mapNonEmpty!38397 ((_ is ValueCellFull!11591) mapValue!38397)) b!1035610))

(assert (= (and b!1035606 ((_ is ValueCellFull!11591) mapDefault!38397)) b!1035613))

(assert (= b!1035609 b!1035606))

(assert (= start!90554 b!1035609))

(declare-fun m!954919 () Bool)

(assert (=> start!90554 m!954919))

(declare-fun m!954921 () Bool)

(assert (=> b!1035614 m!954921))

(declare-fun m!954923 () Bool)

(assert (=> b!1035612 m!954923))

(declare-fun m!954925 () Bool)

(assert (=> b!1035609 m!954925))

(declare-fun m!954927 () Bool)

(assert (=> b!1035609 m!954927))

(declare-fun m!954929 () Bool)

(assert (=> mapNonEmpty!38397 m!954929))

(declare-fun m!954931 () Bool)

(assert (=> b!1035607 m!954931))

(check-sat (not b!1035614) b_and!33343 (not b_next!20869) (not b!1035607) tp_is_empty!24589 (not b!1035612) (not start!90554) (not b!1035609) (not mapNonEmpty!38397))
(check-sat b_and!33343 (not b_next!20869))
(get-model)

(declare-fun b!1035677 () Bool)

(declare-fun e!585685 () Bool)

(declare-fun call!43774 () Bool)

(assert (=> b!1035677 (= e!585685 call!43774)))

(declare-fun b!1035678 () Bool)

(declare-fun e!585687 () Bool)

(declare-fun e!585686 () Bool)

(assert (=> b!1035678 (= e!585687 e!585686)))

(declare-fun c!104703 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1035678 (= c!104703 (validKeyInArray!0 (select (arr!31392 (_keys!11450 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124395 () Bool)

(declare-fun res!691476 () Bool)

(assert (=> d!124395 (=> res!691476 e!585687)))

(assert (=> d!124395 (= res!691476 (bvsge #b00000000000000000000000000000000 (size!31922 (_keys!11450 thiss!1427))))))

(assert (=> d!124395 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11450 thiss!1427) (mask!30158 thiss!1427)) e!585687)))

(declare-fun b!1035679 () Bool)

(assert (=> b!1035679 (= e!585686 e!585685)))

(declare-fun lt!456574 () (_ BitVec 64))

(assert (=> b!1035679 (= lt!456574 (select (arr!31392 (_keys!11450 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33772 0))(
  ( (Unit!33773) )
))
(declare-fun lt!456573 () Unit!33772)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65213 (_ BitVec 64) (_ BitVec 32)) Unit!33772)

(assert (=> b!1035679 (= lt!456573 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11450 thiss!1427) lt!456574 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1035679 (arrayContainsKey!0 (_keys!11450 thiss!1427) lt!456574 #b00000000000000000000000000000000)))

(declare-fun lt!456572 () Unit!33772)

(assert (=> b!1035679 (= lt!456572 lt!456573)))

(declare-fun res!691477 () Bool)

(declare-datatypes ((SeekEntryResult!9736 0))(
  ( (MissingZero!9736 (index!41315 (_ BitVec 32))) (Found!9736 (index!41316 (_ BitVec 32))) (Intermediate!9736 (undefined!10548 Bool) (index!41317 (_ BitVec 32)) (x!92418 (_ BitVec 32))) (Undefined!9736) (MissingVacant!9736 (index!41318 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65213 (_ BitVec 32)) SeekEntryResult!9736)

(assert (=> b!1035679 (= res!691477 (= (seekEntryOrOpen!0 (select (arr!31392 (_keys!11450 thiss!1427)) #b00000000000000000000000000000000) (_keys!11450 thiss!1427) (mask!30158 thiss!1427)) (Found!9736 #b00000000000000000000000000000000)))))

(assert (=> b!1035679 (=> (not res!691477) (not e!585685))))

(declare-fun bm!43771 () Bool)

(assert (=> bm!43771 (= call!43774 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11450 thiss!1427) (mask!30158 thiss!1427)))))

(declare-fun b!1035680 () Bool)

(assert (=> b!1035680 (= e!585686 call!43774)))

(assert (= (and d!124395 (not res!691476)) b!1035678))

(assert (= (and b!1035678 c!104703) b!1035679))

(assert (= (and b!1035678 (not c!104703)) b!1035680))

(assert (= (and b!1035679 res!691477) b!1035677))

(assert (= (or b!1035677 b!1035680) bm!43771))

(declare-fun m!954961 () Bool)

(assert (=> b!1035678 m!954961))

(assert (=> b!1035678 m!954961))

(declare-fun m!954963 () Bool)

(assert (=> b!1035678 m!954963))

(assert (=> b!1035679 m!954961))

(declare-fun m!954965 () Bool)

(assert (=> b!1035679 m!954965))

(declare-fun m!954967 () Bool)

(assert (=> b!1035679 m!954967))

(assert (=> b!1035679 m!954961))

(declare-fun m!954969 () Bool)

(assert (=> b!1035679 m!954969))

(declare-fun m!954971 () Bool)

(assert (=> bm!43771 m!954971))

(assert (=> b!1035612 d!124395))

(declare-fun b!1035691 () Bool)

(declare-fun e!585698 () Bool)

(declare-fun call!43777 () Bool)

(assert (=> b!1035691 (= e!585698 call!43777)))

(declare-fun b!1035692 () Bool)

(declare-fun e!585697 () Bool)

(assert (=> b!1035692 (= e!585697 e!585698)))

(declare-fun c!104706 () Bool)

(assert (=> b!1035692 (= c!104706 (validKeyInArray!0 (select (arr!31392 (_keys!11450 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124397 () Bool)

(declare-fun res!691485 () Bool)

(declare-fun e!585696 () Bool)

(assert (=> d!124397 (=> res!691485 e!585696)))

(assert (=> d!124397 (= res!691485 (bvsge #b00000000000000000000000000000000 (size!31922 (_keys!11450 thiss!1427))))))

(assert (=> d!124397 (= (arrayNoDuplicates!0 (_keys!11450 thiss!1427) #b00000000000000000000000000000000 Nil!21946) e!585696)))

(declare-fun b!1035693 () Bool)

(assert (=> b!1035693 (= e!585698 call!43777)))

(declare-fun b!1035694 () Bool)

(assert (=> b!1035694 (= e!585696 e!585697)))

(declare-fun res!691484 () Bool)

(assert (=> b!1035694 (=> (not res!691484) (not e!585697))))

(declare-fun e!585699 () Bool)

(assert (=> b!1035694 (= res!691484 (not e!585699))))

(declare-fun res!691486 () Bool)

(assert (=> b!1035694 (=> (not res!691486) (not e!585699))))

(assert (=> b!1035694 (= res!691486 (validKeyInArray!0 (select (arr!31392 (_keys!11450 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43774 () Bool)

(assert (=> bm!43774 (= call!43777 (arrayNoDuplicates!0 (_keys!11450 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104706 (Cons!21945 (select (arr!31392 (_keys!11450 thiss!1427)) #b00000000000000000000000000000000) Nil!21946) Nil!21946)))))

(declare-fun b!1035695 () Bool)

(declare-fun contains!6000 (List!21949 (_ BitVec 64)) Bool)

(assert (=> b!1035695 (= e!585699 (contains!6000 Nil!21946 (select (arr!31392 (_keys!11450 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124397 (not res!691485)) b!1035694))

(assert (= (and b!1035694 res!691486) b!1035695))

(assert (= (and b!1035694 res!691484) b!1035692))

(assert (= (and b!1035692 c!104706) b!1035691))

(assert (= (and b!1035692 (not c!104706)) b!1035693))

(assert (= (or b!1035691 b!1035693) bm!43774))

(assert (=> b!1035692 m!954961))

(assert (=> b!1035692 m!954961))

(assert (=> b!1035692 m!954963))

(assert (=> b!1035694 m!954961))

(assert (=> b!1035694 m!954961))

(assert (=> b!1035694 m!954963))

(assert (=> bm!43774 m!954961))

(declare-fun m!954973 () Bool)

(assert (=> bm!43774 m!954973))

(assert (=> b!1035695 m!954961))

(assert (=> b!1035695 m!954961))

(declare-fun m!954975 () Bool)

(assert (=> b!1035695 m!954975))

(assert (=> b!1035607 d!124397))

(declare-fun d!124399 () Bool)

(declare-fun res!691493 () Bool)

(declare-fun e!585702 () Bool)

(assert (=> d!124399 (=> (not res!691493) (not e!585702))))

(declare-fun simpleValid!413 (LongMapFixedSize!5776) Bool)

(assert (=> d!124399 (= res!691493 (simpleValid!413 thiss!1427))))

(assert (=> d!124399 (= (valid!2169 thiss!1427) e!585702)))

(declare-fun b!1035702 () Bool)

(declare-fun res!691494 () Bool)

(assert (=> b!1035702 (=> (not res!691494) (not e!585702))))

(declare-fun arrayCountValidKeys!0 (array!65213 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1035702 (= res!691494 (= (arrayCountValidKeys!0 (_keys!11450 thiss!1427) #b00000000000000000000000000000000 (size!31922 (_keys!11450 thiss!1427))) (_size!2943 thiss!1427)))))

(declare-fun b!1035703 () Bool)

(declare-fun res!691495 () Bool)

(assert (=> b!1035703 (=> (not res!691495) (not e!585702))))

(assert (=> b!1035703 (= res!691495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11450 thiss!1427) (mask!30158 thiss!1427)))))

(declare-fun b!1035704 () Bool)

(assert (=> b!1035704 (= e!585702 (arrayNoDuplicates!0 (_keys!11450 thiss!1427) #b00000000000000000000000000000000 Nil!21946))))

(assert (= (and d!124399 res!691493) b!1035702))

(assert (= (and b!1035702 res!691494) b!1035703))

(assert (= (and b!1035703 res!691495) b!1035704))

(declare-fun m!954977 () Bool)

(assert (=> d!124399 m!954977))

(declare-fun m!954979 () Bool)

(assert (=> b!1035702 m!954979))

(assert (=> b!1035703 m!954923))

(assert (=> b!1035704 m!954931))

(assert (=> start!90554 d!124399))

(declare-fun d!124401 () Bool)

(assert (=> d!124401 (= (array_inv!24279 (_keys!11450 thiss!1427)) (bvsge (size!31922 (_keys!11450 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035609 d!124401))

(declare-fun d!124403 () Bool)

(assert (=> d!124403 (= (array_inv!24280 (_values!6289 thiss!1427)) (bvsge (size!31923 (_values!6289 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035609 d!124403))

(declare-fun d!124405 () Bool)

(assert (=> d!124405 (= (validMask!0 (mask!30158 thiss!1427)) (and (or (= (mask!30158 thiss!1427) #b00000000000000000000000000000111) (= (mask!30158 thiss!1427) #b00000000000000000000000000001111) (= (mask!30158 thiss!1427) #b00000000000000000000000000011111) (= (mask!30158 thiss!1427) #b00000000000000000000000000111111) (= (mask!30158 thiss!1427) #b00000000000000000000000001111111) (= (mask!30158 thiss!1427) #b00000000000000000000000011111111) (= (mask!30158 thiss!1427) #b00000000000000000000000111111111) (= (mask!30158 thiss!1427) #b00000000000000000000001111111111) (= (mask!30158 thiss!1427) #b00000000000000000000011111111111) (= (mask!30158 thiss!1427) #b00000000000000000000111111111111) (= (mask!30158 thiss!1427) #b00000000000000000001111111111111) (= (mask!30158 thiss!1427) #b00000000000000000011111111111111) (= (mask!30158 thiss!1427) #b00000000000000000111111111111111) (= (mask!30158 thiss!1427) #b00000000000000001111111111111111) (= (mask!30158 thiss!1427) #b00000000000000011111111111111111) (= (mask!30158 thiss!1427) #b00000000000000111111111111111111) (= (mask!30158 thiss!1427) #b00000000000001111111111111111111) (= (mask!30158 thiss!1427) #b00000000000011111111111111111111) (= (mask!30158 thiss!1427) #b00000000000111111111111111111111) (= (mask!30158 thiss!1427) #b00000000001111111111111111111111) (= (mask!30158 thiss!1427) #b00000000011111111111111111111111) (= (mask!30158 thiss!1427) #b00000000111111111111111111111111) (= (mask!30158 thiss!1427) #b00000001111111111111111111111111) (= (mask!30158 thiss!1427) #b00000011111111111111111111111111) (= (mask!30158 thiss!1427) #b00000111111111111111111111111111) (= (mask!30158 thiss!1427) #b00001111111111111111111111111111) (= (mask!30158 thiss!1427) #b00011111111111111111111111111111) (= (mask!30158 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30158 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1035614 d!124405))

(declare-fun mapIsEmpty!38406 () Bool)

(declare-fun mapRes!38406 () Bool)

(assert (=> mapIsEmpty!38406 mapRes!38406))

(declare-fun b!1035712 () Bool)

(declare-fun e!585708 () Bool)

(assert (=> b!1035712 (= e!585708 tp_is_empty!24589)))

(declare-fun b!1035711 () Bool)

(declare-fun e!585707 () Bool)

(assert (=> b!1035711 (= e!585707 tp_is_empty!24589)))

(declare-fun condMapEmpty!38406 () Bool)

(declare-fun mapDefault!38406 () ValueCell!11591)

(assert (=> mapNonEmpty!38397 (= condMapEmpty!38406 (= mapRest!38397 ((as const (Array (_ BitVec 32) ValueCell!11591)) mapDefault!38406)))))

(assert (=> mapNonEmpty!38397 (= tp!73738 (and e!585708 mapRes!38406))))

(declare-fun mapNonEmpty!38406 () Bool)

(declare-fun tp!73753 () Bool)

(assert (=> mapNonEmpty!38406 (= mapRes!38406 (and tp!73753 e!585707))))

(declare-fun mapKey!38406 () (_ BitVec 32))

(declare-fun mapValue!38406 () ValueCell!11591)

(declare-fun mapRest!38406 () (Array (_ BitVec 32) ValueCell!11591))

(assert (=> mapNonEmpty!38406 (= mapRest!38397 (store mapRest!38406 mapKey!38406 mapValue!38406))))

(assert (= (and mapNonEmpty!38397 condMapEmpty!38406) mapIsEmpty!38406))

(assert (= (and mapNonEmpty!38397 (not condMapEmpty!38406)) mapNonEmpty!38406))

(assert (= (and mapNonEmpty!38406 ((_ is ValueCellFull!11591) mapValue!38406)) b!1035711))

(assert (= (and mapNonEmpty!38397 ((_ is ValueCellFull!11591) mapDefault!38406)) b!1035712))

(declare-fun m!954981 () Bool)

(assert (=> mapNonEmpty!38406 m!954981))

(check-sat tp_is_empty!24589 (not b!1035702) (not b!1035703) (not d!124399) (not bm!43774) (not b!1035678) (not b_next!20869) (not b!1035694) (not b!1035692) (not b!1035679) b_and!33343 (not b!1035704) (not bm!43771) (not b!1035695) (not mapNonEmpty!38406))
(check-sat b_and!33343 (not b_next!20869))
