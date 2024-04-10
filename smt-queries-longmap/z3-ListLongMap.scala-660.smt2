; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16310 () Bool)

(assert start!16310)

(declare-fun b!162768 () Bool)

(declare-fun b_free!3771 () Bool)

(declare-fun b_next!3771 () Bool)

(assert (=> b!162768 (= b_free!3771 (not b_next!3771))))

(declare-fun tp!13882 () Bool)

(declare-fun b_and!10185 () Bool)

(assert (=> b!162768 (= tp!13882 b_and!10185)))

(declare-fun mapNonEmpty!6047 () Bool)

(declare-fun mapRes!6047 () Bool)

(declare-fun tp!13883 () Bool)

(declare-fun e!106761 () Bool)

(assert (=> mapNonEmpty!6047 (= mapRes!6047 (and tp!13883 e!106761))))

(declare-fun mapKey!6047 () (_ BitVec 32))

(declare-datatypes ((V!4411 0))(
  ( (V!4412 (val!1831 Int)) )
))
(declare-datatypes ((ValueCell!1443 0))(
  ( (ValueCellFull!1443 (v!3696 V!4411)) (EmptyCell!1443) )
))
(declare-fun mapRest!6047 () (Array (_ BitVec 32) ValueCell!1443))

(declare-datatypes ((array!6225 0))(
  ( (array!6226 (arr!2957 (Array (_ BitVec 32) (_ BitVec 64))) (size!3241 (_ BitVec 32))) )
))
(declare-datatypes ((array!6227 0))(
  ( (array!6228 (arr!2958 (Array (_ BitVec 32) ValueCell!1443)) (size!3242 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1794 0))(
  ( (LongMapFixedSize!1795 (defaultEntry!3339 Int) (mask!7971 (_ BitVec 32)) (extraKeys!3080 (_ BitVec 32)) (zeroValue!3182 V!4411) (minValue!3182 V!4411) (_size!946 (_ BitVec 32)) (_keys!5140 array!6225) (_values!3322 array!6227) (_vacant!946 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1794)

(declare-fun mapValue!6047 () ValueCell!1443)

(assert (=> mapNonEmpty!6047 (= (arr!2958 (_values!3322 thiss!1248)) (store mapRest!6047 mapKey!6047 mapValue!6047))))

(declare-fun b!162763 () Bool)

(declare-fun e!106762 () Bool)

(declare-fun tp_is_empty!3573 () Bool)

(assert (=> b!162763 (= e!106762 tp_is_empty!3573)))

(declare-fun res!77081 () Bool)

(declare-fun e!106765 () Bool)

(assert (=> start!16310 (=> (not res!77081) (not e!106765))))

(declare-fun valid!807 (LongMapFixedSize!1794) Bool)

(assert (=> start!16310 (= res!77081 (valid!807 thiss!1248))))

(assert (=> start!16310 e!106765))

(declare-fun e!106764 () Bool)

(assert (=> start!16310 e!106764))

(assert (=> start!16310 true))

(declare-fun mapIsEmpty!6047 () Bool)

(assert (=> mapIsEmpty!6047 mapRes!6047))

(declare-fun b!162764 () Bool)

(assert (=> b!162764 (= e!106761 tp_is_empty!3573)))

(declare-fun b!162765 () Bool)

(declare-fun res!77080 () Bool)

(assert (=> b!162765 (=> (not res!77080) (not e!106765))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162765 (= res!77080 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162766 () Bool)

(declare-fun e!106763 () Bool)

(assert (=> b!162766 (= e!106763 (and e!106762 mapRes!6047))))

(declare-fun condMapEmpty!6047 () Bool)

(declare-fun mapDefault!6047 () ValueCell!1443)

(assert (=> b!162766 (= condMapEmpty!6047 (= (arr!2958 (_values!3322 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1443)) mapDefault!6047)))))

(declare-fun b!162767 () Bool)

(declare-fun e!106766 () Bool)

(assert (=> b!162767 (= e!106765 e!106766)))

(declare-fun res!77079 () Bool)

(assert (=> b!162767 (=> (not res!77079) (not e!106766))))

(declare-datatypes ((SeekEntryResult!391 0))(
  ( (MissingZero!391 (index!3732 (_ BitVec 32))) (Found!391 (index!3733 (_ BitVec 32))) (Intermediate!391 (undefined!1203 Bool) (index!3734 (_ BitVec 32)) (x!18015 (_ BitVec 32))) (Undefined!391) (MissingVacant!391 (index!3735 (_ BitVec 32))) )
))
(declare-fun lt!82540 () SeekEntryResult!391)

(get-info :version)

(assert (=> b!162767 (= res!77079 (and (not ((_ is Undefined!391) lt!82540)) (not ((_ is MissingVacant!391) lt!82540)) (not ((_ is MissingZero!391) lt!82540)) ((_ is Found!391) lt!82540)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6225 (_ BitVec 32)) SeekEntryResult!391)

(assert (=> b!162767 (= lt!82540 (seekEntryOrOpen!0 key!828 (_keys!5140 thiss!1248) (mask!7971 thiss!1248)))))

(declare-fun array_inv!1889 (array!6225) Bool)

(declare-fun array_inv!1890 (array!6227) Bool)

(assert (=> b!162768 (= e!106764 (and tp!13882 tp_is_empty!3573 (array_inv!1889 (_keys!5140 thiss!1248)) (array_inv!1890 (_values!3322 thiss!1248)) e!106763))))

(declare-fun b!162769 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!162769 (= e!106766 (not (validMask!0 (mask!7971 thiss!1248))))))

(assert (= (and start!16310 res!77081) b!162765))

(assert (= (and b!162765 res!77080) b!162767))

(assert (= (and b!162767 res!77079) b!162769))

(assert (= (and b!162766 condMapEmpty!6047) mapIsEmpty!6047))

(assert (= (and b!162766 (not condMapEmpty!6047)) mapNonEmpty!6047))

(assert (= (and mapNonEmpty!6047 ((_ is ValueCellFull!1443) mapValue!6047)) b!162764))

(assert (= (and b!162766 ((_ is ValueCellFull!1443) mapDefault!6047)) b!162763))

(assert (= b!162768 b!162766))

(assert (= start!16310 b!162768))

(declare-fun m!193767 () Bool)

(assert (=> start!16310 m!193767))

(declare-fun m!193769 () Bool)

(assert (=> b!162767 m!193769))

(declare-fun m!193771 () Bool)

(assert (=> b!162769 m!193771))

(declare-fun m!193773 () Bool)

(assert (=> mapNonEmpty!6047 m!193773))

(declare-fun m!193775 () Bool)

(assert (=> b!162768 m!193775))

(declare-fun m!193777 () Bool)

(assert (=> b!162768 m!193777))

(check-sat b_and!10185 (not b!162767) (not b!162769) (not start!16310) (not mapNonEmpty!6047) tp_is_empty!3573 (not b_next!3771) (not b!162768))
(check-sat b_and!10185 (not b_next!3771))
(get-model)

(declare-fun d!51357 () Bool)

(assert (=> d!51357 (= (array_inv!1889 (_keys!5140 thiss!1248)) (bvsge (size!3241 (_keys!5140 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!162768 d!51357))

(declare-fun d!51359 () Bool)

(assert (=> d!51359 (= (array_inv!1890 (_values!3322 thiss!1248)) (bvsge (size!3242 (_values!3322 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!162768 d!51359))

(declare-fun d!51361 () Bool)

(assert (=> d!51361 (= (validMask!0 (mask!7971 thiss!1248)) (and (or (= (mask!7971 thiss!1248) #b00000000000000000000000000000111) (= (mask!7971 thiss!1248) #b00000000000000000000000000001111) (= (mask!7971 thiss!1248) #b00000000000000000000000000011111) (= (mask!7971 thiss!1248) #b00000000000000000000000000111111) (= (mask!7971 thiss!1248) #b00000000000000000000000001111111) (= (mask!7971 thiss!1248) #b00000000000000000000000011111111) (= (mask!7971 thiss!1248) #b00000000000000000000000111111111) (= (mask!7971 thiss!1248) #b00000000000000000000001111111111) (= (mask!7971 thiss!1248) #b00000000000000000000011111111111) (= (mask!7971 thiss!1248) #b00000000000000000000111111111111) (= (mask!7971 thiss!1248) #b00000000000000000001111111111111) (= (mask!7971 thiss!1248) #b00000000000000000011111111111111) (= (mask!7971 thiss!1248) #b00000000000000000111111111111111) (= (mask!7971 thiss!1248) #b00000000000000001111111111111111) (= (mask!7971 thiss!1248) #b00000000000000011111111111111111) (= (mask!7971 thiss!1248) #b00000000000000111111111111111111) (= (mask!7971 thiss!1248) #b00000000000001111111111111111111) (= (mask!7971 thiss!1248) #b00000000000011111111111111111111) (= (mask!7971 thiss!1248) #b00000000000111111111111111111111) (= (mask!7971 thiss!1248) #b00000000001111111111111111111111) (= (mask!7971 thiss!1248) #b00000000011111111111111111111111) (= (mask!7971 thiss!1248) #b00000000111111111111111111111111) (= (mask!7971 thiss!1248) #b00000001111111111111111111111111) (= (mask!7971 thiss!1248) #b00000011111111111111111111111111) (= (mask!7971 thiss!1248) #b00000111111111111111111111111111) (= (mask!7971 thiss!1248) #b00001111111111111111111111111111) (= (mask!7971 thiss!1248) #b00011111111111111111111111111111) (= (mask!7971 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7971 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!162769 d!51361))

(declare-fun d!51363 () Bool)

(declare-fun res!77097 () Bool)

(declare-fun e!106791 () Bool)

(assert (=> d!51363 (=> (not res!77097) (not e!106791))))

(declare-fun simpleValid!118 (LongMapFixedSize!1794) Bool)

(assert (=> d!51363 (= res!77097 (simpleValid!118 thiss!1248))))

(assert (=> d!51363 (= (valid!807 thiss!1248) e!106791)))

(declare-fun b!162797 () Bool)

(declare-fun res!77098 () Bool)

(assert (=> b!162797 (=> (not res!77098) (not e!106791))))

(declare-fun arrayCountValidKeys!0 (array!6225 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!162797 (= res!77098 (= (arrayCountValidKeys!0 (_keys!5140 thiss!1248) #b00000000000000000000000000000000 (size!3241 (_keys!5140 thiss!1248))) (_size!946 thiss!1248)))))

(declare-fun b!162798 () Bool)

(declare-fun res!77099 () Bool)

(assert (=> b!162798 (=> (not res!77099) (not e!106791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6225 (_ BitVec 32)) Bool)

(assert (=> b!162798 (= res!77099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5140 thiss!1248) (mask!7971 thiss!1248)))))

(declare-fun b!162799 () Bool)

(declare-datatypes ((List!1987 0))(
  ( (Nil!1984) (Cons!1983 (h!2596 (_ BitVec 64)) (t!6789 List!1987)) )
))
(declare-fun arrayNoDuplicates!0 (array!6225 (_ BitVec 32) List!1987) Bool)

(assert (=> b!162799 (= e!106791 (arrayNoDuplicates!0 (_keys!5140 thiss!1248) #b00000000000000000000000000000000 Nil!1984))))

(assert (= (and d!51363 res!77097) b!162797))

(assert (= (and b!162797 res!77098) b!162798))

(assert (= (and b!162798 res!77099) b!162799))

(declare-fun m!193791 () Bool)

(assert (=> d!51363 m!193791))

(declare-fun m!193793 () Bool)

(assert (=> b!162797 m!193793))

(declare-fun m!193795 () Bool)

(assert (=> b!162798 m!193795))

(declare-fun m!193797 () Bool)

(assert (=> b!162799 m!193797))

(assert (=> start!16310 d!51363))

(declare-fun b!162812 () Bool)

(declare-fun e!106799 () SeekEntryResult!391)

(assert (=> b!162812 (= e!106799 Undefined!391)))

(declare-fun b!162813 () Bool)

(declare-fun e!106800 () SeekEntryResult!391)

(assert (=> b!162813 (= e!106799 e!106800)))

(declare-fun lt!82551 () (_ BitVec 64))

(declare-fun lt!82552 () SeekEntryResult!391)

(assert (=> b!162813 (= lt!82551 (select (arr!2957 (_keys!5140 thiss!1248)) (index!3734 lt!82552)))))

(declare-fun c!29986 () Bool)

(assert (=> b!162813 (= c!29986 (= lt!82551 key!828))))

(declare-fun b!162814 () Bool)

(declare-fun c!29985 () Bool)

(assert (=> b!162814 (= c!29985 (= lt!82551 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!106798 () SeekEntryResult!391)

(assert (=> b!162814 (= e!106800 e!106798)))

(declare-fun d!51365 () Bool)

(declare-fun lt!82550 () SeekEntryResult!391)

(assert (=> d!51365 (and (or ((_ is Undefined!391) lt!82550) (not ((_ is Found!391) lt!82550)) (and (bvsge (index!3733 lt!82550) #b00000000000000000000000000000000) (bvslt (index!3733 lt!82550) (size!3241 (_keys!5140 thiss!1248))))) (or ((_ is Undefined!391) lt!82550) ((_ is Found!391) lt!82550) (not ((_ is MissingZero!391) lt!82550)) (and (bvsge (index!3732 lt!82550) #b00000000000000000000000000000000) (bvslt (index!3732 lt!82550) (size!3241 (_keys!5140 thiss!1248))))) (or ((_ is Undefined!391) lt!82550) ((_ is Found!391) lt!82550) ((_ is MissingZero!391) lt!82550) (not ((_ is MissingVacant!391) lt!82550)) (and (bvsge (index!3735 lt!82550) #b00000000000000000000000000000000) (bvslt (index!3735 lt!82550) (size!3241 (_keys!5140 thiss!1248))))) (or ((_ is Undefined!391) lt!82550) (ite ((_ is Found!391) lt!82550) (= (select (arr!2957 (_keys!5140 thiss!1248)) (index!3733 lt!82550)) key!828) (ite ((_ is MissingZero!391) lt!82550) (= (select (arr!2957 (_keys!5140 thiss!1248)) (index!3732 lt!82550)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!391) lt!82550) (= (select (arr!2957 (_keys!5140 thiss!1248)) (index!3735 lt!82550)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51365 (= lt!82550 e!106799)))

(declare-fun c!29984 () Bool)

(assert (=> d!51365 (= c!29984 (and ((_ is Intermediate!391) lt!82552) (undefined!1203 lt!82552)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6225 (_ BitVec 32)) SeekEntryResult!391)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51365 (= lt!82552 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7971 thiss!1248)) key!828 (_keys!5140 thiss!1248) (mask!7971 thiss!1248)))))

(assert (=> d!51365 (validMask!0 (mask!7971 thiss!1248))))

(assert (=> d!51365 (= (seekEntryOrOpen!0 key!828 (_keys!5140 thiss!1248) (mask!7971 thiss!1248)) lt!82550)))

(declare-fun b!162815 () Bool)

(assert (=> b!162815 (= e!106800 (Found!391 (index!3734 lt!82552)))))

(declare-fun b!162816 () Bool)

(assert (=> b!162816 (= e!106798 (MissingZero!391 (index!3734 lt!82552)))))

(declare-fun b!162817 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6225 (_ BitVec 32)) SeekEntryResult!391)

(assert (=> b!162817 (= e!106798 (seekKeyOrZeroReturnVacant!0 (x!18015 lt!82552) (index!3734 lt!82552) (index!3734 lt!82552) key!828 (_keys!5140 thiss!1248) (mask!7971 thiss!1248)))))

(assert (= (and d!51365 c!29984) b!162812))

(assert (= (and d!51365 (not c!29984)) b!162813))

(assert (= (and b!162813 c!29986) b!162815))

(assert (= (and b!162813 (not c!29986)) b!162814))

(assert (= (and b!162814 c!29985) b!162816))

(assert (= (and b!162814 (not c!29985)) b!162817))

(declare-fun m!193799 () Bool)

(assert (=> b!162813 m!193799))

(assert (=> d!51365 m!193771))

(declare-fun m!193801 () Bool)

(assert (=> d!51365 m!193801))

(declare-fun m!193803 () Bool)

(assert (=> d!51365 m!193803))

(declare-fun m!193805 () Bool)

(assert (=> d!51365 m!193805))

(assert (=> d!51365 m!193803))

(declare-fun m!193807 () Bool)

(assert (=> d!51365 m!193807))

(declare-fun m!193809 () Bool)

(assert (=> d!51365 m!193809))

(declare-fun m!193811 () Bool)

(assert (=> b!162817 m!193811))

(assert (=> b!162767 d!51365))

(declare-fun mapNonEmpty!6053 () Bool)

(declare-fun mapRes!6053 () Bool)

(declare-fun tp!13892 () Bool)

(declare-fun e!106805 () Bool)

(assert (=> mapNonEmpty!6053 (= mapRes!6053 (and tp!13892 e!106805))))

(declare-fun mapKey!6053 () (_ BitVec 32))

(declare-fun mapRest!6053 () (Array (_ BitVec 32) ValueCell!1443))

(declare-fun mapValue!6053 () ValueCell!1443)

(assert (=> mapNonEmpty!6053 (= mapRest!6047 (store mapRest!6053 mapKey!6053 mapValue!6053))))

(declare-fun b!162824 () Bool)

(assert (=> b!162824 (= e!106805 tp_is_empty!3573)))

(declare-fun mapIsEmpty!6053 () Bool)

(assert (=> mapIsEmpty!6053 mapRes!6053))

(declare-fun condMapEmpty!6053 () Bool)

(declare-fun mapDefault!6053 () ValueCell!1443)

(assert (=> mapNonEmpty!6047 (= condMapEmpty!6053 (= mapRest!6047 ((as const (Array (_ BitVec 32) ValueCell!1443)) mapDefault!6053)))))

(declare-fun e!106806 () Bool)

(assert (=> mapNonEmpty!6047 (= tp!13883 (and e!106806 mapRes!6053))))

(declare-fun b!162825 () Bool)

(assert (=> b!162825 (= e!106806 tp_is_empty!3573)))

(assert (= (and mapNonEmpty!6047 condMapEmpty!6053) mapIsEmpty!6053))

(assert (= (and mapNonEmpty!6047 (not condMapEmpty!6053)) mapNonEmpty!6053))

(assert (= (and mapNonEmpty!6053 ((_ is ValueCellFull!1443) mapValue!6053)) b!162824))

(assert (= (and mapNonEmpty!6047 ((_ is ValueCellFull!1443) mapDefault!6053)) b!162825))

(declare-fun m!193813 () Bool)

(assert (=> mapNonEmpty!6053 m!193813))

(check-sat b_and!10185 tp_is_empty!3573 (not b!162799) (not d!51365) (not b!162797) (not d!51363) (not b!162798) (not b_next!3771) (not mapNonEmpty!6053) (not b!162817))
(check-sat b_and!10185 (not b_next!3771))
