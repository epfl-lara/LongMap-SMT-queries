; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16328 () Bool)

(assert start!16328)

(declare-fun b!162698 () Bool)

(declare-fun b_free!3775 () Bool)

(declare-fun b_next!3775 () Bool)

(assert (=> b!162698 (= b_free!3775 (not b_next!3775))))

(declare-fun tp!13898 () Bool)

(declare-fun b_and!10163 () Bool)

(assert (=> b!162698 (= tp!13898 b_and!10163)))

(declare-fun b!162695 () Bool)

(declare-fun e!106720 () Bool)

(declare-fun e!106726 () Bool)

(declare-fun mapRes!6056 () Bool)

(assert (=> b!162695 (= e!106720 (and e!106726 mapRes!6056))))

(declare-fun condMapEmpty!6056 () Bool)

(declare-datatypes ((V!4417 0))(
  ( (V!4418 (val!1833 Int)) )
))
(declare-datatypes ((ValueCell!1445 0))(
  ( (ValueCellFull!1445 (v!3692 V!4417)) (EmptyCell!1445) )
))
(declare-datatypes ((array!6215 0))(
  ( (array!6216 (arr!2950 (Array (_ BitVec 32) (_ BitVec 64))) (size!3235 (_ BitVec 32))) )
))
(declare-datatypes ((array!6217 0))(
  ( (array!6218 (arr!2951 (Array (_ BitVec 32) ValueCell!1445)) (size!3236 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1798 0))(
  ( (LongMapFixedSize!1799 (defaultEntry!3341 Int) (mask!7976 (_ BitVec 32)) (extraKeys!3082 (_ BitVec 32)) (zeroValue!3184 V!4417) (minValue!3184 V!4417) (_size!948 (_ BitVec 32)) (_keys!5142 array!6215) (_values!3324 array!6217) (_vacant!948 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1798)

(declare-fun mapDefault!6056 () ValueCell!1445)

(assert (=> b!162695 (= condMapEmpty!6056 (= (arr!2951 (_values!3324 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1445)) mapDefault!6056)))))

(declare-fun b!162696 () Bool)

(declare-fun res!77016 () Bool)

(declare-fun e!106721 () Bool)

(assert (=> b!162696 (=> (not res!77016) (not e!106721))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162696 (= res!77016 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162697 () Bool)

(declare-fun tp_is_empty!3577 () Bool)

(assert (=> b!162697 (= e!106726 tp_is_empty!3577)))

(declare-fun e!106724 () Bool)

(declare-fun array_inv!1901 (array!6215) Bool)

(declare-fun array_inv!1902 (array!6217) Bool)

(assert (=> b!162698 (= e!106724 (and tp!13898 tp_is_empty!3577 (array_inv!1901 (_keys!5142 thiss!1248)) (array_inv!1902 (_values!3324 thiss!1248)) e!106720))))

(declare-fun b!162699 () Bool)

(declare-fun e!106722 () Bool)

(assert (=> b!162699 (= e!106721 e!106722)))

(declare-fun res!77013 () Bool)

(assert (=> b!162699 (=> (not res!77013) (not e!106722))))

(declare-datatypes ((SeekEntryResult!404 0))(
  ( (MissingZero!404 (index!3784 (_ BitVec 32))) (Found!404 (index!3785 (_ BitVec 32))) (Intermediate!404 (undefined!1216 Bool) (index!3786 (_ BitVec 32)) (x!18043 (_ BitVec 32))) (Undefined!404) (MissingVacant!404 (index!3787 (_ BitVec 32))) )
))
(declare-fun lt!82374 () SeekEntryResult!404)

(get-info :version)

(assert (=> b!162699 (= res!77013 (and (not ((_ is Undefined!404) lt!82374)) (not ((_ is MissingVacant!404) lt!82374)) (not ((_ is MissingZero!404) lt!82374)) ((_ is Found!404) lt!82374)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6215 (_ BitVec 32)) SeekEntryResult!404)

(assert (=> b!162699 (= lt!82374 (seekEntryOrOpen!0 key!828 (_keys!5142 thiss!1248) (mask!7976 thiss!1248)))))

(declare-fun mapIsEmpty!6056 () Bool)

(assert (=> mapIsEmpty!6056 mapRes!6056))

(declare-fun b!162700 () Bool)

(declare-fun e!106723 () Bool)

(assert (=> b!162700 (= e!106723 tp_is_empty!3577)))

(declare-fun res!77014 () Bool)

(assert (=> start!16328 (=> (not res!77014) (not e!106721))))

(declare-fun valid!813 (LongMapFixedSize!1798) Bool)

(assert (=> start!16328 (= res!77014 (valid!813 thiss!1248))))

(assert (=> start!16328 e!106721))

(assert (=> start!16328 e!106724))

(assert (=> start!16328 true))

(declare-fun b!162701 () Bool)

(assert (=> b!162701 (= e!106722 (not (= (size!3236 (_values!3324 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7976 thiss!1248)))))))

(declare-fun b!162702 () Bool)

(declare-fun res!77015 () Bool)

(assert (=> b!162702 (=> (not res!77015) (not e!106722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!162702 (= res!77015 (validMask!0 (mask!7976 thiss!1248)))))

(declare-fun mapNonEmpty!6056 () Bool)

(declare-fun tp!13897 () Bool)

(assert (=> mapNonEmpty!6056 (= mapRes!6056 (and tp!13897 e!106723))))

(declare-fun mapRest!6056 () (Array (_ BitVec 32) ValueCell!1445))

(declare-fun mapKey!6056 () (_ BitVec 32))

(declare-fun mapValue!6056 () ValueCell!1445)

(assert (=> mapNonEmpty!6056 (= (arr!2951 (_values!3324 thiss!1248)) (store mapRest!6056 mapKey!6056 mapValue!6056))))

(assert (= (and start!16328 res!77014) b!162696))

(assert (= (and b!162696 res!77016) b!162699))

(assert (= (and b!162699 res!77013) b!162702))

(assert (= (and b!162702 res!77015) b!162701))

(assert (= (and b!162695 condMapEmpty!6056) mapIsEmpty!6056))

(assert (= (and b!162695 (not condMapEmpty!6056)) mapNonEmpty!6056))

(assert (= (and mapNonEmpty!6056 ((_ is ValueCellFull!1445) mapValue!6056)) b!162700))

(assert (= (and b!162695 ((_ is ValueCellFull!1445) mapDefault!6056)) b!162697))

(assert (= b!162698 b!162695))

(assert (= start!16328 b!162698))

(declare-fun m!193195 () Bool)

(assert (=> b!162702 m!193195))

(declare-fun m!193197 () Bool)

(assert (=> b!162698 m!193197))

(declare-fun m!193199 () Bool)

(assert (=> b!162698 m!193199))

(declare-fun m!193201 () Bool)

(assert (=> b!162699 m!193201))

(declare-fun m!193203 () Bool)

(assert (=> mapNonEmpty!6056 m!193203))

(declare-fun m!193205 () Bool)

(assert (=> start!16328 m!193205))

(check-sat (not b!162702) (not start!16328) (not b_next!3775) (not b!162698) b_and!10163 tp_is_empty!3577 (not mapNonEmpty!6056) (not b!162699))
(check-sat b_and!10163 (not b_next!3775))
(get-model)

(declare-fun b!162763 () Bool)

(declare-fun e!106775 () SeekEntryResult!404)

(declare-fun lt!82389 () SeekEntryResult!404)

(assert (=> b!162763 (= e!106775 (MissingZero!404 (index!3786 lt!82389)))))

(declare-fun d!51221 () Bool)

(declare-fun lt!82387 () SeekEntryResult!404)

(assert (=> d!51221 (and (or ((_ is Undefined!404) lt!82387) (not ((_ is Found!404) lt!82387)) (and (bvsge (index!3785 lt!82387) #b00000000000000000000000000000000) (bvslt (index!3785 lt!82387) (size!3235 (_keys!5142 thiss!1248))))) (or ((_ is Undefined!404) lt!82387) ((_ is Found!404) lt!82387) (not ((_ is MissingZero!404) lt!82387)) (and (bvsge (index!3784 lt!82387) #b00000000000000000000000000000000) (bvslt (index!3784 lt!82387) (size!3235 (_keys!5142 thiss!1248))))) (or ((_ is Undefined!404) lt!82387) ((_ is Found!404) lt!82387) ((_ is MissingZero!404) lt!82387) (not ((_ is MissingVacant!404) lt!82387)) (and (bvsge (index!3787 lt!82387) #b00000000000000000000000000000000) (bvslt (index!3787 lt!82387) (size!3235 (_keys!5142 thiss!1248))))) (or ((_ is Undefined!404) lt!82387) (ite ((_ is Found!404) lt!82387) (= (select (arr!2950 (_keys!5142 thiss!1248)) (index!3785 lt!82387)) key!828) (ite ((_ is MissingZero!404) lt!82387) (= (select (arr!2950 (_keys!5142 thiss!1248)) (index!3784 lt!82387)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!404) lt!82387) (= (select (arr!2950 (_keys!5142 thiss!1248)) (index!3787 lt!82387)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!106776 () SeekEntryResult!404)

(assert (=> d!51221 (= lt!82387 e!106776)))

(declare-fun c!29967 () Bool)

(assert (=> d!51221 (= c!29967 (and ((_ is Intermediate!404) lt!82389) (undefined!1216 lt!82389)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6215 (_ BitVec 32)) SeekEntryResult!404)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51221 (= lt!82389 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7976 thiss!1248)) key!828 (_keys!5142 thiss!1248) (mask!7976 thiss!1248)))))

(assert (=> d!51221 (validMask!0 (mask!7976 thiss!1248))))

(assert (=> d!51221 (= (seekEntryOrOpen!0 key!828 (_keys!5142 thiss!1248) (mask!7976 thiss!1248)) lt!82387)))

(declare-fun b!162764 () Bool)

(assert (=> b!162764 (= e!106776 Undefined!404)))

(declare-fun b!162765 () Bool)

(declare-fun e!106777 () SeekEntryResult!404)

(assert (=> b!162765 (= e!106777 (Found!404 (index!3786 lt!82389)))))

(declare-fun b!162766 () Bool)

(declare-fun c!29968 () Bool)

(declare-fun lt!82388 () (_ BitVec 64))

(assert (=> b!162766 (= c!29968 (= lt!82388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!162766 (= e!106777 e!106775)))

(declare-fun b!162767 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6215 (_ BitVec 32)) SeekEntryResult!404)

(assert (=> b!162767 (= e!106775 (seekKeyOrZeroReturnVacant!0 (x!18043 lt!82389) (index!3786 lt!82389) (index!3786 lt!82389) key!828 (_keys!5142 thiss!1248) (mask!7976 thiss!1248)))))

(declare-fun b!162768 () Bool)

(assert (=> b!162768 (= e!106776 e!106777)))

(assert (=> b!162768 (= lt!82388 (select (arr!2950 (_keys!5142 thiss!1248)) (index!3786 lt!82389)))))

(declare-fun c!29969 () Bool)

(assert (=> b!162768 (= c!29969 (= lt!82388 key!828))))

(assert (= (and d!51221 c!29967) b!162764))

(assert (= (and d!51221 (not c!29967)) b!162768))

(assert (= (and b!162768 c!29969) b!162765))

(assert (= (and b!162768 (not c!29969)) b!162766))

(assert (= (and b!162766 c!29968) b!162763))

(assert (= (and b!162766 (not c!29968)) b!162767))

(assert (=> d!51221 m!193195))

(declare-fun m!193231 () Bool)

(assert (=> d!51221 m!193231))

(declare-fun m!193233 () Bool)

(assert (=> d!51221 m!193233))

(declare-fun m!193235 () Bool)

(assert (=> d!51221 m!193235))

(declare-fun m!193237 () Bool)

(assert (=> d!51221 m!193237))

(assert (=> d!51221 m!193233))

(declare-fun m!193239 () Bool)

(assert (=> d!51221 m!193239))

(declare-fun m!193241 () Bool)

(assert (=> b!162767 m!193241))

(declare-fun m!193243 () Bool)

(assert (=> b!162768 m!193243))

(assert (=> b!162699 d!51221))

(declare-fun d!51223 () Bool)

(assert (=> d!51223 (= (validMask!0 (mask!7976 thiss!1248)) (and (or (= (mask!7976 thiss!1248) #b00000000000000000000000000000111) (= (mask!7976 thiss!1248) #b00000000000000000000000000001111) (= (mask!7976 thiss!1248) #b00000000000000000000000000011111) (= (mask!7976 thiss!1248) #b00000000000000000000000000111111) (= (mask!7976 thiss!1248) #b00000000000000000000000001111111) (= (mask!7976 thiss!1248) #b00000000000000000000000011111111) (= (mask!7976 thiss!1248) #b00000000000000000000000111111111) (= (mask!7976 thiss!1248) #b00000000000000000000001111111111) (= (mask!7976 thiss!1248) #b00000000000000000000011111111111) (= (mask!7976 thiss!1248) #b00000000000000000000111111111111) (= (mask!7976 thiss!1248) #b00000000000000000001111111111111) (= (mask!7976 thiss!1248) #b00000000000000000011111111111111) (= (mask!7976 thiss!1248) #b00000000000000000111111111111111) (= (mask!7976 thiss!1248) #b00000000000000001111111111111111) (= (mask!7976 thiss!1248) #b00000000000000011111111111111111) (= (mask!7976 thiss!1248) #b00000000000000111111111111111111) (= (mask!7976 thiss!1248) #b00000000000001111111111111111111) (= (mask!7976 thiss!1248) #b00000000000011111111111111111111) (= (mask!7976 thiss!1248) #b00000000000111111111111111111111) (= (mask!7976 thiss!1248) #b00000000001111111111111111111111) (= (mask!7976 thiss!1248) #b00000000011111111111111111111111) (= (mask!7976 thiss!1248) #b00000000111111111111111111111111) (= (mask!7976 thiss!1248) #b00000001111111111111111111111111) (= (mask!7976 thiss!1248) #b00000011111111111111111111111111) (= (mask!7976 thiss!1248) #b00000111111111111111111111111111) (= (mask!7976 thiss!1248) #b00001111111111111111111111111111) (= (mask!7976 thiss!1248) #b00011111111111111111111111111111) (= (mask!7976 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7976 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!162702 d!51223))

(declare-fun d!51225 () Bool)

(assert (=> d!51225 (= (array_inv!1901 (_keys!5142 thiss!1248)) (bvsge (size!3235 (_keys!5142 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!162698 d!51225))

(declare-fun d!51227 () Bool)

(assert (=> d!51227 (= (array_inv!1902 (_values!3324 thiss!1248)) (bvsge (size!3236 (_values!3324 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!162698 d!51227))

(declare-fun d!51229 () Bool)

(declare-fun res!77047 () Bool)

(declare-fun e!106780 () Bool)

(assert (=> d!51229 (=> (not res!77047) (not e!106780))))

(declare-fun simpleValid!119 (LongMapFixedSize!1798) Bool)

(assert (=> d!51229 (= res!77047 (simpleValid!119 thiss!1248))))

(assert (=> d!51229 (= (valid!813 thiss!1248) e!106780)))

(declare-fun b!162775 () Bool)

(declare-fun res!77048 () Bool)

(assert (=> b!162775 (=> (not res!77048) (not e!106780))))

(declare-fun arrayCountValidKeys!0 (array!6215 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!162775 (= res!77048 (= (arrayCountValidKeys!0 (_keys!5142 thiss!1248) #b00000000000000000000000000000000 (size!3235 (_keys!5142 thiss!1248))) (_size!948 thiss!1248)))))

(declare-fun b!162776 () Bool)

(declare-fun res!77049 () Bool)

(assert (=> b!162776 (=> (not res!77049) (not e!106780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6215 (_ BitVec 32)) Bool)

(assert (=> b!162776 (= res!77049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5142 thiss!1248) (mask!7976 thiss!1248)))))

(declare-fun b!162777 () Bool)

(declare-datatypes ((List!1994 0))(
  ( (Nil!1991) (Cons!1990 (h!2603 (_ BitVec 64)) (t!6787 List!1994)) )
))
(declare-fun arrayNoDuplicates!0 (array!6215 (_ BitVec 32) List!1994) Bool)

(assert (=> b!162777 (= e!106780 (arrayNoDuplicates!0 (_keys!5142 thiss!1248) #b00000000000000000000000000000000 Nil!1991))))

(assert (= (and d!51229 res!77047) b!162775))

(assert (= (and b!162775 res!77048) b!162776))

(assert (= (and b!162776 res!77049) b!162777))

(declare-fun m!193245 () Bool)

(assert (=> d!51229 m!193245))

(declare-fun m!193247 () Bool)

(assert (=> b!162775 m!193247))

(declare-fun m!193249 () Bool)

(assert (=> b!162776 m!193249))

(declare-fun m!193251 () Bool)

(assert (=> b!162777 m!193251))

(assert (=> start!16328 d!51229))

(declare-fun condMapEmpty!6065 () Bool)

(declare-fun mapDefault!6065 () ValueCell!1445)

(assert (=> mapNonEmpty!6056 (= condMapEmpty!6065 (= mapRest!6056 ((as const (Array (_ BitVec 32) ValueCell!1445)) mapDefault!6065)))))

(declare-fun e!106785 () Bool)

(declare-fun mapRes!6065 () Bool)

(assert (=> mapNonEmpty!6056 (= tp!13897 (and e!106785 mapRes!6065))))

(declare-fun mapIsEmpty!6065 () Bool)

(assert (=> mapIsEmpty!6065 mapRes!6065))

(declare-fun b!162785 () Bool)

(assert (=> b!162785 (= e!106785 tp_is_empty!3577)))

(declare-fun mapNonEmpty!6065 () Bool)

(declare-fun tp!13913 () Bool)

(declare-fun e!106786 () Bool)

(assert (=> mapNonEmpty!6065 (= mapRes!6065 (and tp!13913 e!106786))))

(declare-fun mapKey!6065 () (_ BitVec 32))

(declare-fun mapValue!6065 () ValueCell!1445)

(declare-fun mapRest!6065 () (Array (_ BitVec 32) ValueCell!1445))

(assert (=> mapNonEmpty!6065 (= mapRest!6056 (store mapRest!6065 mapKey!6065 mapValue!6065))))

(declare-fun b!162784 () Bool)

(assert (=> b!162784 (= e!106786 tp_is_empty!3577)))

(assert (= (and mapNonEmpty!6056 condMapEmpty!6065) mapIsEmpty!6065))

(assert (= (and mapNonEmpty!6056 (not condMapEmpty!6065)) mapNonEmpty!6065))

(assert (= (and mapNonEmpty!6065 ((_ is ValueCellFull!1445) mapValue!6065)) b!162784))

(assert (= (and mapNonEmpty!6056 ((_ is ValueCellFull!1445) mapDefault!6065)) b!162785))

(declare-fun m!193253 () Bool)

(assert (=> mapNonEmpty!6065 m!193253))

(check-sat (not mapNonEmpty!6065) (not b_next!3775) (not b!162776) (not b!162775) (not b!162777) (not d!51229) (not d!51221) (not b!162767) b_and!10163 tp_is_empty!3577)
(check-sat b_and!10163 (not b_next!3775))
(get-model)

(declare-fun b!162798 () Bool)

(declare-fun c!29976 () Bool)

(declare-fun lt!82394 () (_ BitVec 64))

(assert (=> b!162798 (= c!29976 (= lt!82394 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!106794 () SeekEntryResult!404)

(declare-fun e!106793 () SeekEntryResult!404)

(assert (=> b!162798 (= e!106794 e!106793)))

(declare-fun b!162799 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!162799 (= e!106793 (seekKeyOrZeroReturnVacant!0 (bvadd (x!18043 lt!82389) #b00000000000000000000000000000001) (nextIndex!0 (index!3786 lt!82389) (x!18043 lt!82389) (mask!7976 thiss!1248)) (index!3786 lt!82389) key!828 (_keys!5142 thiss!1248) (mask!7976 thiss!1248)))))

(declare-fun d!51231 () Bool)

(declare-fun lt!82395 () SeekEntryResult!404)

(assert (=> d!51231 (and (or ((_ is Undefined!404) lt!82395) (not ((_ is Found!404) lt!82395)) (and (bvsge (index!3785 lt!82395) #b00000000000000000000000000000000) (bvslt (index!3785 lt!82395) (size!3235 (_keys!5142 thiss!1248))))) (or ((_ is Undefined!404) lt!82395) ((_ is Found!404) lt!82395) (not ((_ is MissingVacant!404) lt!82395)) (not (= (index!3787 lt!82395) (index!3786 lt!82389))) (and (bvsge (index!3787 lt!82395) #b00000000000000000000000000000000) (bvslt (index!3787 lt!82395) (size!3235 (_keys!5142 thiss!1248))))) (or ((_ is Undefined!404) lt!82395) (ite ((_ is Found!404) lt!82395) (= (select (arr!2950 (_keys!5142 thiss!1248)) (index!3785 lt!82395)) key!828) (and ((_ is MissingVacant!404) lt!82395) (= (index!3787 lt!82395) (index!3786 lt!82389)) (= (select (arr!2950 (_keys!5142 thiss!1248)) (index!3787 lt!82395)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!106795 () SeekEntryResult!404)

(assert (=> d!51231 (= lt!82395 e!106795)))

(declare-fun c!29977 () Bool)

(assert (=> d!51231 (= c!29977 (bvsge (x!18043 lt!82389) #b01111111111111111111111111111110))))

(assert (=> d!51231 (= lt!82394 (select (arr!2950 (_keys!5142 thiss!1248)) (index!3786 lt!82389)))))

(assert (=> d!51231 (validMask!0 (mask!7976 thiss!1248))))

(assert (=> d!51231 (= (seekKeyOrZeroReturnVacant!0 (x!18043 lt!82389) (index!3786 lt!82389) (index!3786 lt!82389) key!828 (_keys!5142 thiss!1248) (mask!7976 thiss!1248)) lt!82395)))

(declare-fun b!162800 () Bool)

(assert (=> b!162800 (= e!106794 (Found!404 (index!3786 lt!82389)))))

(declare-fun b!162801 () Bool)

(assert (=> b!162801 (= e!106795 Undefined!404)))

(declare-fun b!162802 () Bool)

(assert (=> b!162802 (= e!106795 e!106794)))

(declare-fun c!29978 () Bool)

(assert (=> b!162802 (= c!29978 (= lt!82394 key!828))))

(declare-fun b!162803 () Bool)

(assert (=> b!162803 (= e!106793 (MissingVacant!404 (index!3786 lt!82389)))))

(assert (= (and d!51231 c!29977) b!162801))

(assert (= (and d!51231 (not c!29977)) b!162802))

(assert (= (and b!162802 c!29978) b!162800))

(assert (= (and b!162802 (not c!29978)) b!162798))

(assert (= (and b!162798 c!29976) b!162803))

(assert (= (and b!162798 (not c!29976)) b!162799))

(declare-fun m!193255 () Bool)

(assert (=> b!162799 m!193255))

(assert (=> b!162799 m!193255))

(declare-fun m!193257 () Bool)

(assert (=> b!162799 m!193257))

(declare-fun m!193259 () Bool)

(assert (=> d!51231 m!193259))

(declare-fun m!193261 () Bool)

(assert (=> d!51231 m!193261))

(assert (=> d!51231 m!193243))

(assert (=> d!51231 m!193195))

(assert (=> b!162767 d!51231))

(declare-fun b!162813 () Bool)

(declare-fun res!77058 () Bool)

(declare-fun e!106798 () Bool)

(assert (=> b!162813 (=> (not res!77058) (not e!106798))))

(declare-fun size!3241 (LongMapFixedSize!1798) (_ BitVec 32))

(assert (=> b!162813 (= res!77058 (bvsge (size!3241 thiss!1248) (_size!948 thiss!1248)))))

(declare-fun b!162812 () Bool)

(declare-fun res!77059 () Bool)

(assert (=> b!162812 (=> (not res!77059) (not e!106798))))

(assert (=> b!162812 (= res!77059 (and (= (size!3236 (_values!3324 thiss!1248)) (bvadd (mask!7976 thiss!1248) #b00000000000000000000000000000001)) (= (size!3235 (_keys!5142 thiss!1248)) (size!3236 (_values!3324 thiss!1248))) (bvsge (_size!948 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!948 thiss!1248) (bvadd (mask!7976 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!162815 () Bool)

(assert (=> b!162815 (= e!106798 (and (bvsge (extraKeys!3082 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3082 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!948 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!51233 () Bool)

(declare-fun res!77060 () Bool)

(assert (=> d!51233 (=> (not res!77060) (not e!106798))))

(assert (=> d!51233 (= res!77060 (validMask!0 (mask!7976 thiss!1248)))))

(assert (=> d!51233 (= (simpleValid!119 thiss!1248) e!106798)))

(declare-fun b!162814 () Bool)

(declare-fun res!77061 () Bool)

(assert (=> b!162814 (=> (not res!77061) (not e!106798))))

(assert (=> b!162814 (= res!77061 (= (size!3241 thiss!1248) (bvadd (_size!948 thiss!1248) (bvsdiv (bvadd (extraKeys!3082 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!51233 res!77060) b!162812))

(assert (= (and b!162812 res!77059) b!162813))

(assert (= (and b!162813 res!77058) b!162814))

(assert (= (and b!162814 res!77061) b!162815))

(declare-fun m!193263 () Bool)

(assert (=> b!162813 m!193263))

(assert (=> d!51233 m!193195))

(assert (=> b!162814 m!193263))

(assert (=> d!51229 d!51233))

(declare-fun b!162826 () Bool)

(declare-fun e!106807 () Bool)

(declare-fun e!106808 () Bool)

(assert (=> b!162826 (= e!106807 e!106808)))

(declare-fun c!29981 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!162826 (= c!29981 (validKeyInArray!0 (select (arr!2950 (_keys!5142 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!162827 () Bool)

(declare-fun e!106809 () Bool)

(assert (=> b!162827 (= e!106809 e!106807)))

(declare-fun res!77069 () Bool)

(assert (=> b!162827 (=> (not res!77069) (not e!106807))))

(declare-fun e!106810 () Bool)

(assert (=> b!162827 (= res!77069 (not e!106810))))

(declare-fun res!77070 () Bool)

(assert (=> b!162827 (=> (not res!77070) (not e!106810))))

(assert (=> b!162827 (= res!77070 (validKeyInArray!0 (select (arr!2950 (_keys!5142 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51235 () Bool)

(declare-fun res!77068 () Bool)

(assert (=> d!51235 (=> res!77068 e!106809)))

(assert (=> d!51235 (= res!77068 (bvsge #b00000000000000000000000000000000 (size!3235 (_keys!5142 thiss!1248))))))

(assert (=> d!51235 (= (arrayNoDuplicates!0 (_keys!5142 thiss!1248) #b00000000000000000000000000000000 Nil!1991) e!106809)))

(declare-fun bm!17260 () Bool)

(declare-fun call!17263 () Bool)

(assert (=> bm!17260 (= call!17263 (arrayNoDuplicates!0 (_keys!5142 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29981 (Cons!1990 (select (arr!2950 (_keys!5142 thiss!1248)) #b00000000000000000000000000000000) Nil!1991) Nil!1991)))))

(declare-fun b!162828 () Bool)

(assert (=> b!162828 (= e!106808 call!17263)))

(declare-fun b!162829 () Bool)

(assert (=> b!162829 (= e!106808 call!17263)))

(declare-fun b!162830 () Bool)

(declare-fun contains!1028 (List!1994 (_ BitVec 64)) Bool)

(assert (=> b!162830 (= e!106810 (contains!1028 Nil!1991 (select (arr!2950 (_keys!5142 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51235 (not res!77068)) b!162827))

(assert (= (and b!162827 res!77070) b!162830))

(assert (= (and b!162827 res!77069) b!162826))

(assert (= (and b!162826 c!29981) b!162828))

(assert (= (and b!162826 (not c!29981)) b!162829))

(assert (= (or b!162828 b!162829) bm!17260))

(declare-fun m!193265 () Bool)

(assert (=> b!162826 m!193265))

(assert (=> b!162826 m!193265))

(declare-fun m!193267 () Bool)

(assert (=> b!162826 m!193267))

(assert (=> b!162827 m!193265))

(assert (=> b!162827 m!193265))

(assert (=> b!162827 m!193267))

(assert (=> bm!17260 m!193265))

(declare-fun m!193269 () Bool)

(assert (=> bm!17260 m!193269))

(assert (=> b!162830 m!193265))

(assert (=> b!162830 m!193265))

(declare-fun m!193271 () Bool)

(assert (=> b!162830 m!193271))

(assert (=> b!162777 d!51235))

(declare-fun b!162849 () Bool)

(declare-fun e!106821 () SeekEntryResult!404)

(declare-fun e!106824 () SeekEntryResult!404)

(assert (=> b!162849 (= e!106821 e!106824)))

(declare-fun c!29989 () Bool)

(declare-fun lt!82400 () (_ BitVec 64))

(assert (=> b!162849 (= c!29989 (or (= lt!82400 key!828) (= (bvadd lt!82400 lt!82400) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!162850 () Bool)

(assert (=> b!162850 (= e!106821 (Intermediate!404 true (toIndex!0 key!828 (mask!7976 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!51237 () Bool)

(declare-fun e!106825 () Bool)

(assert (=> d!51237 e!106825))

(declare-fun c!29988 () Bool)

(declare-fun lt!82401 () SeekEntryResult!404)

(assert (=> d!51237 (= c!29988 (and ((_ is Intermediate!404) lt!82401) (undefined!1216 lt!82401)))))

(assert (=> d!51237 (= lt!82401 e!106821)))

(declare-fun c!29990 () Bool)

(assert (=> d!51237 (= c!29990 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!51237 (= lt!82400 (select (arr!2950 (_keys!5142 thiss!1248)) (toIndex!0 key!828 (mask!7976 thiss!1248))))))

(assert (=> d!51237 (validMask!0 (mask!7976 thiss!1248))))

(assert (=> d!51237 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7976 thiss!1248)) key!828 (_keys!5142 thiss!1248) (mask!7976 thiss!1248)) lt!82401)))

(declare-fun b!162851 () Bool)

(assert (=> b!162851 (and (bvsge (index!3786 lt!82401) #b00000000000000000000000000000000) (bvslt (index!3786 lt!82401) (size!3235 (_keys!5142 thiss!1248))))))

(declare-fun res!77078 () Bool)

(assert (=> b!162851 (= res!77078 (= (select (arr!2950 (_keys!5142 thiss!1248)) (index!3786 lt!82401)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!106822 () Bool)

(assert (=> b!162851 (=> res!77078 e!106822)))

(declare-fun b!162852 () Bool)

(assert (=> b!162852 (and (bvsge (index!3786 lt!82401) #b00000000000000000000000000000000) (bvslt (index!3786 lt!82401) (size!3235 (_keys!5142 thiss!1248))))))

(assert (=> b!162852 (= e!106822 (= (select (arr!2950 (_keys!5142 thiss!1248)) (index!3786 lt!82401)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!162853 () Bool)

(assert (=> b!162853 (= e!106824 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7976 thiss!1248)) #b00000000000000000000000000000000 (mask!7976 thiss!1248)) key!828 (_keys!5142 thiss!1248) (mask!7976 thiss!1248)))))

(declare-fun b!162854 () Bool)

(assert (=> b!162854 (= e!106824 (Intermediate!404 false (toIndex!0 key!828 (mask!7976 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!162855 () Bool)

(assert (=> b!162855 (= e!106825 (bvsge (x!18043 lt!82401) #b01111111111111111111111111111110))))

(declare-fun b!162856 () Bool)

(assert (=> b!162856 (and (bvsge (index!3786 lt!82401) #b00000000000000000000000000000000) (bvslt (index!3786 lt!82401) (size!3235 (_keys!5142 thiss!1248))))))

(declare-fun res!77079 () Bool)

(assert (=> b!162856 (= res!77079 (= (select (arr!2950 (_keys!5142 thiss!1248)) (index!3786 lt!82401)) key!828))))

(assert (=> b!162856 (=> res!77079 e!106822)))

(declare-fun e!106823 () Bool)

(assert (=> b!162856 (= e!106823 e!106822)))

(declare-fun b!162857 () Bool)

(assert (=> b!162857 (= e!106825 e!106823)))

(declare-fun res!77077 () Bool)

(assert (=> b!162857 (= res!77077 (and ((_ is Intermediate!404) lt!82401) (not (undefined!1216 lt!82401)) (bvslt (x!18043 lt!82401) #b01111111111111111111111111111110) (bvsge (x!18043 lt!82401) #b00000000000000000000000000000000) (bvsge (x!18043 lt!82401) #b00000000000000000000000000000000)))))

(assert (=> b!162857 (=> (not res!77077) (not e!106823))))

(assert (= (and d!51237 c!29990) b!162850))

(assert (= (and d!51237 (not c!29990)) b!162849))

(assert (= (and b!162849 c!29989) b!162854))

(assert (= (and b!162849 (not c!29989)) b!162853))

(assert (= (and d!51237 c!29988) b!162855))

(assert (= (and d!51237 (not c!29988)) b!162857))

(assert (= (and b!162857 res!77077) b!162856))

(assert (= (and b!162856 (not res!77079)) b!162851))

(assert (= (and b!162851 (not res!77078)) b!162852))

(declare-fun m!193273 () Bool)

(assert (=> b!162856 m!193273))

(assert (=> b!162851 m!193273))

(assert (=> d!51237 m!193233))

(declare-fun m!193275 () Bool)

(assert (=> d!51237 m!193275))

(assert (=> d!51237 m!193195))

(assert (=> b!162852 m!193273))

(assert (=> b!162853 m!193233))

(declare-fun m!193277 () Bool)

(assert (=> b!162853 m!193277))

(assert (=> b!162853 m!193277))

(declare-fun m!193279 () Bool)

(assert (=> b!162853 m!193279))

(assert (=> d!51221 d!51237))

(declare-fun d!51239 () Bool)

(declare-fun lt!82407 () (_ BitVec 32))

(declare-fun lt!82406 () (_ BitVec 32))

(assert (=> d!51239 (= lt!82407 (bvmul (bvxor lt!82406 (bvlshr lt!82406 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51239 (= lt!82406 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51239 (and (bvsge (mask!7976 thiss!1248) #b00000000000000000000000000000000) (let ((res!77080 (let ((h!2604 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!18061 (bvmul (bvxor h!2604 (bvlshr h!2604 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!18061 (bvlshr x!18061 #b00000000000000000000000000001101)) (mask!7976 thiss!1248)))))) (and (bvslt res!77080 (bvadd (mask!7976 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!77080 #b00000000000000000000000000000000))))))

(assert (=> d!51239 (= (toIndex!0 key!828 (mask!7976 thiss!1248)) (bvand (bvxor lt!82407 (bvlshr lt!82407 #b00000000000000000000000000001101)) (mask!7976 thiss!1248)))))

(assert (=> d!51221 d!51239))

(assert (=> d!51221 d!51223))

(declare-fun bm!17263 () Bool)

(declare-fun call!17266 () Bool)

(assert (=> bm!17263 (= call!17266 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5142 thiss!1248) (mask!7976 thiss!1248)))))

(declare-fun b!162866 () Bool)

(declare-fun e!106832 () Bool)

(assert (=> b!162866 (= e!106832 call!17266)))

(declare-fun b!162867 () Bool)

(declare-fun e!106833 () Bool)

(declare-fun e!106834 () Bool)

(assert (=> b!162867 (= e!106833 e!106834)))

(declare-fun c!29993 () Bool)

(assert (=> b!162867 (= c!29993 (validKeyInArray!0 (select (arr!2950 (_keys!5142 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51241 () Bool)

(declare-fun res!77086 () Bool)

(assert (=> d!51241 (=> res!77086 e!106833)))

(assert (=> d!51241 (= res!77086 (bvsge #b00000000000000000000000000000000 (size!3235 (_keys!5142 thiss!1248))))))

(assert (=> d!51241 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5142 thiss!1248) (mask!7976 thiss!1248)) e!106833)))

(declare-fun b!162868 () Bool)

(assert (=> b!162868 (= e!106834 call!17266)))

(declare-fun b!162869 () Bool)

(assert (=> b!162869 (= e!106834 e!106832)))

(declare-fun lt!82416 () (_ BitVec 64))

(assert (=> b!162869 (= lt!82416 (select (arr!2950 (_keys!5142 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5005 0))(
  ( (Unit!5006) )
))
(declare-fun lt!82414 () Unit!5005)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6215 (_ BitVec 64) (_ BitVec 32)) Unit!5005)

(assert (=> b!162869 (= lt!82414 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5142 thiss!1248) lt!82416 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!162869 (arrayContainsKey!0 (_keys!5142 thiss!1248) lt!82416 #b00000000000000000000000000000000)))

(declare-fun lt!82415 () Unit!5005)

(assert (=> b!162869 (= lt!82415 lt!82414)))

(declare-fun res!77085 () Bool)

(assert (=> b!162869 (= res!77085 (= (seekEntryOrOpen!0 (select (arr!2950 (_keys!5142 thiss!1248)) #b00000000000000000000000000000000) (_keys!5142 thiss!1248) (mask!7976 thiss!1248)) (Found!404 #b00000000000000000000000000000000)))))

(assert (=> b!162869 (=> (not res!77085) (not e!106832))))

(assert (= (and d!51241 (not res!77086)) b!162867))

(assert (= (and b!162867 c!29993) b!162869))

(assert (= (and b!162867 (not c!29993)) b!162868))

(assert (= (and b!162869 res!77085) b!162866))

(assert (= (or b!162866 b!162868) bm!17263))

(declare-fun m!193281 () Bool)

(assert (=> bm!17263 m!193281))

(assert (=> b!162867 m!193265))

(assert (=> b!162867 m!193265))

(assert (=> b!162867 m!193267))

(assert (=> b!162869 m!193265))

(declare-fun m!193283 () Bool)

(assert (=> b!162869 m!193283))

(declare-fun m!193285 () Bool)

(assert (=> b!162869 m!193285))

(assert (=> b!162869 m!193265))

(declare-fun m!193287 () Bool)

(assert (=> b!162869 m!193287))

(assert (=> b!162776 d!51241))

(declare-fun b!162878 () Bool)

(declare-fun e!106839 () (_ BitVec 32))

(assert (=> b!162878 (= e!106839 #b00000000000000000000000000000000)))

(declare-fun b!162879 () Bool)

(declare-fun e!106840 () (_ BitVec 32))

(declare-fun call!17269 () (_ BitVec 32))

(assert (=> b!162879 (= e!106840 (bvadd #b00000000000000000000000000000001 call!17269))))

(declare-fun b!162880 () Bool)

(assert (=> b!162880 (= e!106840 call!17269)))

(declare-fun bm!17266 () Bool)

(assert (=> bm!17266 (= call!17269 (arrayCountValidKeys!0 (_keys!5142 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3235 (_keys!5142 thiss!1248))))))

(declare-fun d!51243 () Bool)

(declare-fun lt!82419 () (_ BitVec 32))

(assert (=> d!51243 (and (bvsge lt!82419 #b00000000000000000000000000000000) (bvsle lt!82419 (bvsub (size!3235 (_keys!5142 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51243 (= lt!82419 e!106839)))

(declare-fun c!29998 () Bool)

(assert (=> d!51243 (= c!29998 (bvsge #b00000000000000000000000000000000 (size!3235 (_keys!5142 thiss!1248))))))

(assert (=> d!51243 (and (bvsle #b00000000000000000000000000000000 (size!3235 (_keys!5142 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3235 (_keys!5142 thiss!1248)) (size!3235 (_keys!5142 thiss!1248))))))

(assert (=> d!51243 (= (arrayCountValidKeys!0 (_keys!5142 thiss!1248) #b00000000000000000000000000000000 (size!3235 (_keys!5142 thiss!1248))) lt!82419)))

(declare-fun b!162881 () Bool)

(assert (=> b!162881 (= e!106839 e!106840)))

(declare-fun c!29999 () Bool)

(assert (=> b!162881 (= c!29999 (validKeyInArray!0 (select (arr!2950 (_keys!5142 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51243 c!29998) b!162878))

(assert (= (and d!51243 (not c!29998)) b!162881))

(assert (= (and b!162881 c!29999) b!162879))

(assert (= (and b!162881 (not c!29999)) b!162880))

(assert (= (or b!162879 b!162880) bm!17266))

(declare-fun m!193289 () Bool)

(assert (=> bm!17266 m!193289))

(assert (=> b!162881 m!193265))

(assert (=> b!162881 m!193265))

(assert (=> b!162881 m!193267))

(assert (=> b!162775 d!51243))

(declare-fun condMapEmpty!6066 () Bool)

(declare-fun mapDefault!6066 () ValueCell!1445)

(assert (=> mapNonEmpty!6065 (= condMapEmpty!6066 (= mapRest!6065 ((as const (Array (_ BitVec 32) ValueCell!1445)) mapDefault!6066)))))

(declare-fun e!106841 () Bool)

(declare-fun mapRes!6066 () Bool)

(assert (=> mapNonEmpty!6065 (= tp!13913 (and e!106841 mapRes!6066))))

(declare-fun mapIsEmpty!6066 () Bool)

(assert (=> mapIsEmpty!6066 mapRes!6066))

(declare-fun b!162883 () Bool)

(assert (=> b!162883 (= e!106841 tp_is_empty!3577)))

(declare-fun mapNonEmpty!6066 () Bool)

(declare-fun tp!13914 () Bool)

(declare-fun e!106842 () Bool)

(assert (=> mapNonEmpty!6066 (= mapRes!6066 (and tp!13914 e!106842))))

(declare-fun mapValue!6066 () ValueCell!1445)

(declare-fun mapKey!6066 () (_ BitVec 32))

(declare-fun mapRest!6066 () (Array (_ BitVec 32) ValueCell!1445))

(assert (=> mapNonEmpty!6066 (= mapRest!6065 (store mapRest!6066 mapKey!6066 mapValue!6066))))

(declare-fun b!162882 () Bool)

(assert (=> b!162882 (= e!106842 tp_is_empty!3577)))

(assert (= (and mapNonEmpty!6065 condMapEmpty!6066) mapIsEmpty!6066))

(assert (= (and mapNonEmpty!6065 (not condMapEmpty!6066)) mapNonEmpty!6066))

(assert (= (and mapNonEmpty!6066 ((_ is ValueCellFull!1445) mapValue!6066)) b!162882))

(assert (= (and mapNonEmpty!6065 ((_ is ValueCellFull!1445) mapDefault!6066)) b!162883))

(declare-fun m!193291 () Bool)

(assert (=> mapNonEmpty!6066 m!193291))

(check-sat (not d!51233) (not bm!17266) (not b!162827) (not d!51237) (not b!162814) (not bm!17263) (not b!162830) (not b!162869) (not d!51231) (not mapNonEmpty!6066) (not bm!17260) (not b!162853) (not b!162826) (not b_next!3775) (not b!162881) (not b!162799) b_and!10163 tp_is_empty!3577 (not b!162867) (not b!162813))
(check-sat b_and!10163 (not b_next!3775))
