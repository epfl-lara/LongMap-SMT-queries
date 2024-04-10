; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76314 () Bool)

(assert start!76314)

(declare-fun b!895622 () Bool)

(declare-fun b_free!15915 () Bool)

(declare-fun b_next!15915 () Bool)

(assert (=> b!895622 (= b_free!15915 (not b_next!15915))))

(declare-fun tp!55758 () Bool)

(declare-fun b_and!26207 () Bool)

(assert (=> b!895622 (= tp!55758 b_and!26207)))

(declare-fun b!895615 () Bool)

(declare-fun e!500435 () Bool)

(declare-fun tp_is_empty!18243 () Bool)

(assert (=> b!895615 (= e!500435 tp_is_empty!18243)))

(declare-fun b!895616 () Bool)

(declare-fun e!500439 () Bool)

(assert (=> b!895616 (= e!500439 tp_is_empty!18243)))

(declare-fun b!895617 () Bool)

(declare-fun e!500440 () Bool)

(declare-fun mapRes!28963 () Bool)

(assert (=> b!895617 (= e!500440 (and e!500439 mapRes!28963))))

(declare-fun condMapEmpty!28963 () Bool)

(declare-datatypes ((array!52490 0))(
  ( (array!52491 (arr!25239 (Array (_ BitVec 32) (_ BitVec 64))) (size!25689 (_ BitVec 32))) )
))
(declare-datatypes ((V!29289 0))(
  ( (V!29290 (val!9172 Int)) )
))
(declare-datatypes ((ValueCell!8640 0))(
  ( (ValueCellFull!8640 (v!11662 V!29289)) (EmptyCell!8640) )
))
(declare-datatypes ((array!52492 0))(
  ( (array!52493 (arr!25240 (Array (_ BitVec 32) ValueCell!8640)) (size!25690 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4296 0))(
  ( (LongMapFixedSize!4297 (defaultEntry!5360 Int) (mask!25964 (_ BitVec 32)) (extraKeys!5056 (_ BitVec 32)) (zeroValue!5160 V!29289) (minValue!5160 V!29289) (_size!2203 (_ BitVec 32)) (_keys!10077 array!52490) (_values!5347 array!52492) (_vacant!2203 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4296)

(declare-fun mapDefault!28963 () ValueCell!8640)

(assert (=> b!895617 (= condMapEmpty!28963 (= (arr!25240 (_values!5347 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8640)) mapDefault!28963)))))

(declare-fun b!895618 () Bool)

(declare-fun res!605790 () Bool)

(declare-fun e!500436 () Bool)

(assert (=> b!895618 (=> (not res!605790) (not e!500436))))

(assert (=> b!895618 (= res!605790 (and (= (size!25690 (_values!5347 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25964 thiss!1181))) (= (size!25689 (_keys!10077 thiss!1181)) (size!25690 (_values!5347 thiss!1181))) (bvsge (mask!25964 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5056 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5056 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!895619 () Bool)

(declare-fun e!500441 () Bool)

(assert (=> b!895619 (= e!500441 e!500436)))

(declare-fun res!605792 () Bool)

(assert (=> b!895619 (=> (not res!605792) (not e!500436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895619 (= res!605792 (validMask!0 (mask!25964 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8884 0))(
  ( (MissingZero!8884 (index!37907 (_ BitVec 32))) (Found!8884 (index!37908 (_ BitVec 32))) (Intermediate!8884 (undefined!9696 Bool) (index!37909 (_ BitVec 32)) (x!76212 (_ BitVec 32))) (Undefined!8884) (MissingVacant!8884 (index!37910 (_ BitVec 32))) )
))
(declare-fun lt!404566 () SeekEntryResult!8884)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52490 (_ BitVec 32)) SeekEntryResult!8884)

(assert (=> b!895619 (= lt!404566 (seekEntry!0 key!785 (_keys!10077 thiss!1181) (mask!25964 thiss!1181)))))

(declare-fun mapNonEmpty!28963 () Bool)

(declare-fun tp!55757 () Bool)

(assert (=> mapNonEmpty!28963 (= mapRes!28963 (and tp!55757 e!500435))))

(declare-fun mapKey!28963 () (_ BitVec 32))

(declare-fun mapValue!28963 () ValueCell!8640)

(declare-fun mapRest!28963 () (Array (_ BitVec 32) ValueCell!8640))

(assert (=> mapNonEmpty!28963 (= (arr!25240 (_values!5347 thiss!1181)) (store mapRest!28963 mapKey!28963 mapValue!28963))))

(declare-fun b!895620 () Bool)

(declare-fun res!605789 () Bool)

(assert (=> b!895620 (=> (not res!605789) (not e!500436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52490 (_ BitVec 32)) Bool)

(assert (=> b!895620 (= res!605789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10077 thiss!1181) (mask!25964 thiss!1181)))))

(declare-fun res!605791 () Bool)

(assert (=> start!76314 (=> (not res!605791) (not e!500441))))

(declare-fun valid!1657 (LongMapFixedSize!4296) Bool)

(assert (=> start!76314 (= res!605791 (valid!1657 thiss!1181))))

(assert (=> start!76314 e!500441))

(declare-fun e!500437 () Bool)

(assert (=> start!76314 e!500437))

(assert (=> start!76314 true))

(declare-fun b!895621 () Bool)

(declare-datatypes ((List!17815 0))(
  ( (Nil!17812) (Cons!17811 (h!18948 (_ BitVec 64)) (t!25154 List!17815)) )
))
(declare-fun arrayNoDuplicates!0 (array!52490 (_ BitVec 32) List!17815) Bool)

(assert (=> b!895621 (= e!500436 (not (arrayNoDuplicates!0 (_keys!10077 thiss!1181) #b00000000000000000000000000000000 Nil!17812)))))

(declare-fun mapIsEmpty!28963 () Bool)

(assert (=> mapIsEmpty!28963 mapRes!28963))

(declare-fun array_inv!19818 (array!52490) Bool)

(declare-fun array_inv!19819 (array!52492) Bool)

(assert (=> b!895622 (= e!500437 (and tp!55758 tp_is_empty!18243 (array_inv!19818 (_keys!10077 thiss!1181)) (array_inv!19819 (_values!5347 thiss!1181)) e!500440))))

(declare-fun b!895623 () Bool)

(declare-fun res!605788 () Bool)

(assert (=> b!895623 (=> (not res!605788) (not e!500441))))

(assert (=> b!895623 (= res!605788 (not (= key!785 (bvneg key!785))))))

(assert (= (and start!76314 res!605791) b!895623))

(assert (= (and b!895623 res!605788) b!895619))

(assert (= (and b!895619 res!605792) b!895618))

(assert (= (and b!895618 res!605790) b!895620))

(assert (= (and b!895620 res!605789) b!895621))

(assert (= (and b!895617 condMapEmpty!28963) mapIsEmpty!28963))

(assert (= (and b!895617 (not condMapEmpty!28963)) mapNonEmpty!28963))

(get-info :version)

(assert (= (and mapNonEmpty!28963 ((_ is ValueCellFull!8640) mapValue!28963)) b!895615))

(assert (= (and b!895617 ((_ is ValueCellFull!8640) mapDefault!28963)) b!895616))

(assert (= b!895622 b!895617))

(assert (= start!76314 b!895622))

(declare-fun m!833117 () Bool)

(assert (=> b!895620 m!833117))

(declare-fun m!833119 () Bool)

(assert (=> mapNonEmpty!28963 m!833119))

(declare-fun m!833121 () Bool)

(assert (=> b!895619 m!833121))

(declare-fun m!833123 () Bool)

(assert (=> b!895619 m!833123))

(declare-fun m!833125 () Bool)

(assert (=> b!895622 m!833125))

(declare-fun m!833127 () Bool)

(assert (=> b!895622 m!833127))

(declare-fun m!833129 () Bool)

(assert (=> b!895621 m!833129))

(declare-fun m!833131 () Bool)

(assert (=> start!76314 m!833131))

(check-sat (not b!895619) (not b_next!15915) (not b!895620) b_and!26207 (not b!895622) tp_is_empty!18243 (not mapNonEmpty!28963) (not start!76314) (not b!895621))
(check-sat b_and!26207 (not b_next!15915))
(get-model)

(declare-fun bm!39757 () Bool)

(declare-fun call!39760 () Bool)

(assert (=> bm!39757 (= call!39760 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10077 thiss!1181) (mask!25964 thiss!1181)))))

(declare-fun b!895659 () Bool)

(declare-fun e!500469 () Bool)

(declare-fun e!500471 () Bool)

(assert (=> b!895659 (= e!500469 e!500471)))

(declare-fun c!94589 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!895659 (= c!94589 (validKeyInArray!0 (select (arr!25239 (_keys!10077 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895660 () Bool)

(declare-fun e!500470 () Bool)

(assert (=> b!895660 (= e!500470 call!39760)))

(declare-fun d!110797 () Bool)

(declare-fun res!605812 () Bool)

(assert (=> d!110797 (=> res!605812 e!500469)))

(assert (=> d!110797 (= res!605812 (bvsge #b00000000000000000000000000000000 (size!25689 (_keys!10077 thiss!1181))))))

(assert (=> d!110797 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10077 thiss!1181) (mask!25964 thiss!1181)) e!500469)))

(declare-fun b!895661 () Bool)

(assert (=> b!895661 (= e!500471 e!500470)))

(declare-fun lt!404576 () (_ BitVec 64))

(assert (=> b!895661 (= lt!404576 (select (arr!25239 (_keys!10077 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30464 0))(
  ( (Unit!30465) )
))
(declare-fun lt!404577 () Unit!30464)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52490 (_ BitVec 64) (_ BitVec 32)) Unit!30464)

(assert (=> b!895661 (= lt!404577 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10077 thiss!1181) lt!404576 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!895661 (arrayContainsKey!0 (_keys!10077 thiss!1181) lt!404576 #b00000000000000000000000000000000)))

(declare-fun lt!404578 () Unit!30464)

(assert (=> b!895661 (= lt!404578 lt!404577)))

(declare-fun res!605813 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52490 (_ BitVec 32)) SeekEntryResult!8884)

(assert (=> b!895661 (= res!605813 (= (seekEntryOrOpen!0 (select (arr!25239 (_keys!10077 thiss!1181)) #b00000000000000000000000000000000) (_keys!10077 thiss!1181) (mask!25964 thiss!1181)) (Found!8884 #b00000000000000000000000000000000)))))

(assert (=> b!895661 (=> (not res!605813) (not e!500470))))

(declare-fun b!895662 () Bool)

(assert (=> b!895662 (= e!500471 call!39760)))

(assert (= (and d!110797 (not res!605812)) b!895659))

(assert (= (and b!895659 c!94589) b!895661))

(assert (= (and b!895659 (not c!94589)) b!895662))

(assert (= (and b!895661 res!605813) b!895660))

(assert (= (or b!895660 b!895662) bm!39757))

(declare-fun m!833149 () Bool)

(assert (=> bm!39757 m!833149))

(declare-fun m!833151 () Bool)

(assert (=> b!895659 m!833151))

(assert (=> b!895659 m!833151))

(declare-fun m!833153 () Bool)

(assert (=> b!895659 m!833153))

(assert (=> b!895661 m!833151))

(declare-fun m!833155 () Bool)

(assert (=> b!895661 m!833155))

(declare-fun m!833157 () Bool)

(assert (=> b!895661 m!833157))

(assert (=> b!895661 m!833151))

(declare-fun m!833159 () Bool)

(assert (=> b!895661 m!833159))

(assert (=> b!895620 d!110797))

(declare-fun d!110799 () Bool)

(declare-fun res!605820 () Bool)

(declare-fun e!500474 () Bool)

(assert (=> d!110799 (=> (not res!605820) (not e!500474))))

(declare-fun simpleValid!307 (LongMapFixedSize!4296) Bool)

(assert (=> d!110799 (= res!605820 (simpleValid!307 thiss!1181))))

(assert (=> d!110799 (= (valid!1657 thiss!1181) e!500474)))

(declare-fun b!895669 () Bool)

(declare-fun res!605821 () Bool)

(assert (=> b!895669 (=> (not res!605821) (not e!500474))))

(declare-fun arrayCountValidKeys!0 (array!52490 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895669 (= res!605821 (= (arrayCountValidKeys!0 (_keys!10077 thiss!1181) #b00000000000000000000000000000000 (size!25689 (_keys!10077 thiss!1181))) (_size!2203 thiss!1181)))))

(declare-fun b!895670 () Bool)

(declare-fun res!605822 () Bool)

(assert (=> b!895670 (=> (not res!605822) (not e!500474))))

(assert (=> b!895670 (= res!605822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10077 thiss!1181) (mask!25964 thiss!1181)))))

(declare-fun b!895671 () Bool)

(assert (=> b!895671 (= e!500474 (arrayNoDuplicates!0 (_keys!10077 thiss!1181) #b00000000000000000000000000000000 Nil!17812))))

(assert (= (and d!110799 res!605820) b!895669))

(assert (= (and b!895669 res!605821) b!895670))

(assert (= (and b!895670 res!605822) b!895671))

(declare-fun m!833161 () Bool)

(assert (=> d!110799 m!833161))

(declare-fun m!833163 () Bool)

(assert (=> b!895669 m!833163))

(assert (=> b!895670 m!833117))

(assert (=> b!895671 m!833129))

(assert (=> start!76314 d!110799))

(declare-fun b!895682 () Bool)

(declare-fun e!500484 () Bool)

(declare-fun contains!4398 (List!17815 (_ BitVec 64)) Bool)

(assert (=> b!895682 (= e!500484 (contains!4398 Nil!17812 (select (arr!25239 (_keys!10077 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110801 () Bool)

(declare-fun res!605829 () Bool)

(declare-fun e!500483 () Bool)

(assert (=> d!110801 (=> res!605829 e!500483)))

(assert (=> d!110801 (= res!605829 (bvsge #b00000000000000000000000000000000 (size!25689 (_keys!10077 thiss!1181))))))

(assert (=> d!110801 (= (arrayNoDuplicates!0 (_keys!10077 thiss!1181) #b00000000000000000000000000000000 Nil!17812) e!500483)))

(declare-fun b!895683 () Bool)

(declare-fun e!500486 () Bool)

(assert (=> b!895683 (= e!500483 e!500486)))

(declare-fun res!605830 () Bool)

(assert (=> b!895683 (=> (not res!605830) (not e!500486))))

(assert (=> b!895683 (= res!605830 (not e!500484))))

(declare-fun res!605831 () Bool)

(assert (=> b!895683 (=> (not res!605831) (not e!500484))))

(assert (=> b!895683 (= res!605831 (validKeyInArray!0 (select (arr!25239 (_keys!10077 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895684 () Bool)

(declare-fun e!500485 () Bool)

(assert (=> b!895684 (= e!500486 e!500485)))

(declare-fun c!94592 () Bool)

(assert (=> b!895684 (= c!94592 (validKeyInArray!0 (select (arr!25239 (_keys!10077 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39760 () Bool)

(declare-fun call!39763 () Bool)

(assert (=> bm!39760 (= call!39763 (arrayNoDuplicates!0 (_keys!10077 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94592 (Cons!17811 (select (arr!25239 (_keys!10077 thiss!1181)) #b00000000000000000000000000000000) Nil!17812) Nil!17812)))))

(declare-fun b!895685 () Bool)

(assert (=> b!895685 (= e!500485 call!39763)))

(declare-fun b!895686 () Bool)

(assert (=> b!895686 (= e!500485 call!39763)))

(assert (= (and d!110801 (not res!605829)) b!895683))

(assert (= (and b!895683 res!605831) b!895682))

(assert (= (and b!895683 res!605830) b!895684))

(assert (= (and b!895684 c!94592) b!895686))

(assert (= (and b!895684 (not c!94592)) b!895685))

(assert (= (or b!895686 b!895685) bm!39760))

(assert (=> b!895682 m!833151))

(assert (=> b!895682 m!833151))

(declare-fun m!833165 () Bool)

(assert (=> b!895682 m!833165))

(assert (=> b!895683 m!833151))

(assert (=> b!895683 m!833151))

(assert (=> b!895683 m!833153))

(assert (=> b!895684 m!833151))

(assert (=> b!895684 m!833151))

(assert (=> b!895684 m!833153))

(assert (=> bm!39760 m!833151))

(declare-fun m!833167 () Bool)

(assert (=> bm!39760 m!833167))

(assert (=> b!895621 d!110801))

(declare-fun d!110803 () Bool)

(assert (=> d!110803 (= (validMask!0 (mask!25964 thiss!1181)) (and (or (= (mask!25964 thiss!1181) #b00000000000000000000000000000111) (= (mask!25964 thiss!1181) #b00000000000000000000000000001111) (= (mask!25964 thiss!1181) #b00000000000000000000000000011111) (= (mask!25964 thiss!1181) #b00000000000000000000000000111111) (= (mask!25964 thiss!1181) #b00000000000000000000000001111111) (= (mask!25964 thiss!1181) #b00000000000000000000000011111111) (= (mask!25964 thiss!1181) #b00000000000000000000000111111111) (= (mask!25964 thiss!1181) #b00000000000000000000001111111111) (= (mask!25964 thiss!1181) #b00000000000000000000011111111111) (= (mask!25964 thiss!1181) #b00000000000000000000111111111111) (= (mask!25964 thiss!1181) #b00000000000000000001111111111111) (= (mask!25964 thiss!1181) #b00000000000000000011111111111111) (= (mask!25964 thiss!1181) #b00000000000000000111111111111111) (= (mask!25964 thiss!1181) #b00000000000000001111111111111111) (= (mask!25964 thiss!1181) #b00000000000000011111111111111111) (= (mask!25964 thiss!1181) #b00000000000000111111111111111111) (= (mask!25964 thiss!1181) #b00000000000001111111111111111111) (= (mask!25964 thiss!1181) #b00000000000011111111111111111111) (= (mask!25964 thiss!1181) #b00000000000111111111111111111111) (= (mask!25964 thiss!1181) #b00000000001111111111111111111111) (= (mask!25964 thiss!1181) #b00000000011111111111111111111111) (= (mask!25964 thiss!1181) #b00000000111111111111111111111111) (= (mask!25964 thiss!1181) #b00000001111111111111111111111111) (= (mask!25964 thiss!1181) #b00000011111111111111111111111111) (= (mask!25964 thiss!1181) #b00000111111111111111111111111111) (= (mask!25964 thiss!1181) #b00001111111111111111111111111111) (= (mask!25964 thiss!1181) #b00011111111111111111111111111111) (= (mask!25964 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25964 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!895619 d!110803))

(declare-fun b!895699 () Bool)

(declare-fun e!500494 () SeekEntryResult!8884)

(declare-fun lt!404589 () SeekEntryResult!8884)

(assert (=> b!895699 (= e!500494 (ite ((_ is MissingVacant!8884) lt!404589) (MissingZero!8884 (index!37910 lt!404589)) lt!404589))))

(declare-fun lt!404588 () SeekEntryResult!8884)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52490 (_ BitVec 32)) SeekEntryResult!8884)

(assert (=> b!895699 (= lt!404589 (seekKeyOrZeroReturnVacant!0 (x!76212 lt!404588) (index!37909 lt!404588) (index!37909 lt!404588) key!785 (_keys!10077 thiss!1181) (mask!25964 thiss!1181)))))

(declare-fun b!895700 () Bool)

(assert (=> b!895700 (= e!500494 (MissingZero!8884 (index!37909 lt!404588)))))

(declare-fun b!895701 () Bool)

(declare-fun e!500493 () SeekEntryResult!8884)

(assert (=> b!895701 (= e!500493 (Found!8884 (index!37909 lt!404588)))))

(declare-fun d!110805 () Bool)

(declare-fun lt!404590 () SeekEntryResult!8884)

(assert (=> d!110805 (and (or ((_ is MissingVacant!8884) lt!404590) (not ((_ is Found!8884) lt!404590)) (and (bvsge (index!37908 lt!404590) #b00000000000000000000000000000000) (bvslt (index!37908 lt!404590) (size!25689 (_keys!10077 thiss!1181))))) (not ((_ is MissingVacant!8884) lt!404590)) (or (not ((_ is Found!8884) lt!404590)) (= (select (arr!25239 (_keys!10077 thiss!1181)) (index!37908 lt!404590)) key!785)))))

(declare-fun e!500495 () SeekEntryResult!8884)

(assert (=> d!110805 (= lt!404590 e!500495)))

(declare-fun c!94599 () Bool)

(assert (=> d!110805 (= c!94599 (and ((_ is Intermediate!8884) lt!404588) (undefined!9696 lt!404588)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52490 (_ BitVec 32)) SeekEntryResult!8884)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110805 (= lt!404588 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25964 thiss!1181)) key!785 (_keys!10077 thiss!1181) (mask!25964 thiss!1181)))))

(assert (=> d!110805 (validMask!0 (mask!25964 thiss!1181))))

(assert (=> d!110805 (= (seekEntry!0 key!785 (_keys!10077 thiss!1181) (mask!25964 thiss!1181)) lt!404590)))

(declare-fun b!895702 () Bool)

(declare-fun c!94601 () Bool)

(declare-fun lt!404587 () (_ BitVec 64))

(assert (=> b!895702 (= c!94601 (= lt!404587 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895702 (= e!500493 e!500494)))

(declare-fun b!895703 () Bool)

(assert (=> b!895703 (= e!500495 e!500493)))

(assert (=> b!895703 (= lt!404587 (select (arr!25239 (_keys!10077 thiss!1181)) (index!37909 lt!404588)))))

(declare-fun c!94600 () Bool)

(assert (=> b!895703 (= c!94600 (= lt!404587 key!785))))

(declare-fun b!895704 () Bool)

(assert (=> b!895704 (= e!500495 Undefined!8884)))

(assert (= (and d!110805 c!94599) b!895704))

(assert (= (and d!110805 (not c!94599)) b!895703))

(assert (= (and b!895703 c!94600) b!895701))

(assert (= (and b!895703 (not c!94600)) b!895702))

(assert (= (and b!895702 c!94601) b!895700))

(assert (= (and b!895702 (not c!94601)) b!895699))

(declare-fun m!833169 () Bool)

(assert (=> b!895699 m!833169))

(declare-fun m!833171 () Bool)

(assert (=> d!110805 m!833171))

(declare-fun m!833173 () Bool)

(assert (=> d!110805 m!833173))

(assert (=> d!110805 m!833173))

(declare-fun m!833175 () Bool)

(assert (=> d!110805 m!833175))

(assert (=> d!110805 m!833121))

(declare-fun m!833177 () Bool)

(assert (=> b!895703 m!833177))

(assert (=> b!895619 d!110805))

(declare-fun d!110807 () Bool)

(assert (=> d!110807 (= (array_inv!19818 (_keys!10077 thiss!1181)) (bvsge (size!25689 (_keys!10077 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895622 d!110807))

(declare-fun d!110809 () Bool)

(assert (=> d!110809 (= (array_inv!19819 (_values!5347 thiss!1181)) (bvsge (size!25690 (_values!5347 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895622 d!110809))

(declare-fun condMapEmpty!28969 () Bool)

(declare-fun mapDefault!28969 () ValueCell!8640)

(assert (=> mapNonEmpty!28963 (= condMapEmpty!28969 (= mapRest!28963 ((as const (Array (_ BitVec 32) ValueCell!8640)) mapDefault!28969)))))

(declare-fun e!500501 () Bool)

(declare-fun mapRes!28969 () Bool)

(assert (=> mapNonEmpty!28963 (= tp!55757 (and e!500501 mapRes!28969))))

(declare-fun mapNonEmpty!28969 () Bool)

(declare-fun tp!55767 () Bool)

(declare-fun e!500500 () Bool)

(assert (=> mapNonEmpty!28969 (= mapRes!28969 (and tp!55767 e!500500))))

(declare-fun mapValue!28969 () ValueCell!8640)

(declare-fun mapRest!28969 () (Array (_ BitVec 32) ValueCell!8640))

(declare-fun mapKey!28969 () (_ BitVec 32))

(assert (=> mapNonEmpty!28969 (= mapRest!28963 (store mapRest!28969 mapKey!28969 mapValue!28969))))

(declare-fun mapIsEmpty!28969 () Bool)

(assert (=> mapIsEmpty!28969 mapRes!28969))

(declare-fun b!895711 () Bool)

(assert (=> b!895711 (= e!500500 tp_is_empty!18243)))

(declare-fun b!895712 () Bool)

(assert (=> b!895712 (= e!500501 tp_is_empty!18243)))

(assert (= (and mapNonEmpty!28963 condMapEmpty!28969) mapIsEmpty!28969))

(assert (= (and mapNonEmpty!28963 (not condMapEmpty!28969)) mapNonEmpty!28969))

(assert (= (and mapNonEmpty!28969 ((_ is ValueCellFull!8640) mapValue!28969)) b!895711))

(assert (= (and mapNonEmpty!28963 ((_ is ValueCellFull!8640) mapDefault!28969)) b!895712))

(declare-fun m!833179 () Bool)

(assert (=> mapNonEmpty!28969 m!833179))

(check-sat (not bm!39760) (not b!895659) (not b!895671) (not b!895670) (not b!895699) (not d!110799) (not b_next!15915) (not d!110805) (not mapNonEmpty!28969) (not b!895682) (not b!895683) b_and!26207 tp_is_empty!18243 (not b!895684) (not b!895661) (not bm!39757) (not b!895669))
(check-sat b_and!26207 (not b_next!15915))
