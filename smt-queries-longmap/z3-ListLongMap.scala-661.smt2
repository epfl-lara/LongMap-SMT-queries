; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16328 () Bool)

(assert start!16328)

(declare-fun b!162889 () Bool)

(declare-fun b_free!3775 () Bool)

(declare-fun b_next!3775 () Bool)

(assert (=> b!162889 (= b_free!3775 (not b_next!3775))))

(declare-fun tp!13897 () Bool)

(declare-fun b_and!10203 () Bool)

(assert (=> b!162889 (= tp!13897 b_and!10203)))

(declare-fun mapIsEmpty!6056 () Bool)

(declare-fun mapRes!6056 () Bool)

(assert (=> mapIsEmpty!6056 mapRes!6056))

(declare-fun e!106846 () Bool)

(declare-fun tp_is_empty!3577 () Bool)

(declare-fun e!106847 () Bool)

(declare-datatypes ((V!4417 0))(
  ( (V!4418 (val!1833 Int)) )
))
(declare-datatypes ((ValueCell!1445 0))(
  ( (ValueCellFull!1445 (v!3699 V!4417)) (EmptyCell!1445) )
))
(declare-datatypes ((array!6221 0))(
  ( (array!6222 (arr!2954 (Array (_ BitVec 32) (_ BitVec 64))) (size!3238 (_ BitVec 32))) )
))
(declare-datatypes ((array!6223 0))(
  ( (array!6224 (arr!2955 (Array (_ BitVec 32) ValueCell!1445)) (size!3239 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1798 0))(
  ( (LongMapFixedSize!1799 (defaultEntry!3341 Int) (mask!7977 (_ BitVec 32)) (extraKeys!3082 (_ BitVec 32)) (zeroValue!3184 V!4417) (minValue!3184 V!4417) (_size!948 (_ BitVec 32)) (_keys!5143 array!6221) (_values!3324 array!6223) (_vacant!948 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1798)

(declare-fun array_inv!1899 (array!6221) Bool)

(declare-fun array_inv!1900 (array!6223) Bool)

(assert (=> b!162889 (= e!106847 (and tp!13897 tp_is_empty!3577 (array_inv!1899 (_keys!5143 thiss!1248)) (array_inv!1900 (_values!3324 thiss!1248)) e!106846))))

(declare-fun b!162890 () Bool)

(declare-fun e!106850 () Bool)

(assert (=> b!162890 (= e!106850 (not (= (size!3239 (_values!3324 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7977 thiss!1248)))))))

(declare-fun b!162892 () Bool)

(declare-fun e!106845 () Bool)

(assert (=> b!162892 (= e!106845 tp_is_empty!3577)))

(declare-fun b!162893 () Bool)

(declare-fun res!77131 () Bool)

(declare-fun e!106849 () Bool)

(assert (=> b!162893 (=> (not res!77131) (not e!106849))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162893 (= res!77131 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6056 () Bool)

(declare-fun tp!13898 () Bool)

(declare-fun e!106851 () Bool)

(assert (=> mapNonEmpty!6056 (= mapRes!6056 (and tp!13898 e!106851))))

(declare-fun mapKey!6056 () (_ BitVec 32))

(declare-fun mapValue!6056 () ValueCell!1445)

(declare-fun mapRest!6056 () (Array (_ BitVec 32) ValueCell!1445))

(assert (=> mapNonEmpty!6056 (= (arr!2955 (_values!3324 thiss!1248)) (store mapRest!6056 mapKey!6056 mapValue!6056))))

(declare-fun b!162894 () Bool)

(assert (=> b!162894 (= e!106851 tp_is_empty!3577)))

(declare-fun res!77132 () Bool)

(assert (=> start!16328 (=> (not res!77132) (not e!106849))))

(declare-fun valid!830 (LongMapFixedSize!1798) Bool)

(assert (=> start!16328 (= res!77132 (valid!830 thiss!1248))))

(assert (=> start!16328 e!106849))

(assert (=> start!16328 e!106847))

(assert (=> start!16328 true))

(declare-fun b!162891 () Bool)

(declare-fun res!77130 () Bool)

(assert (=> b!162891 (=> (not res!77130) (not e!106850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!162891 (= res!77130 (validMask!0 (mask!7977 thiss!1248)))))

(declare-fun b!162895 () Bool)

(assert (=> b!162895 (= e!106849 e!106850)))

(declare-fun res!77129 () Bool)

(assert (=> b!162895 (=> (not res!77129) (not e!106850))))

(declare-datatypes ((SeekEntryResult!395 0))(
  ( (MissingZero!395 (index!3748 (_ BitVec 32))) (Found!395 (index!3749 (_ BitVec 32))) (Intermediate!395 (undefined!1207 Bool) (index!3750 (_ BitVec 32)) (x!18035 (_ BitVec 32))) (Undefined!395) (MissingVacant!395 (index!3751 (_ BitVec 32))) )
))
(declare-fun lt!82614 () SeekEntryResult!395)

(get-info :version)

(assert (=> b!162895 (= res!77129 (and (not ((_ is Undefined!395) lt!82614)) (not ((_ is MissingVacant!395) lt!82614)) (not ((_ is MissingZero!395) lt!82614)) ((_ is Found!395) lt!82614)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6221 (_ BitVec 32)) SeekEntryResult!395)

(assert (=> b!162895 (= lt!82614 (seekEntryOrOpen!0 key!828 (_keys!5143 thiss!1248) (mask!7977 thiss!1248)))))

(declare-fun b!162896 () Bool)

(assert (=> b!162896 (= e!106846 (and e!106845 mapRes!6056))))

(declare-fun condMapEmpty!6056 () Bool)

(declare-fun mapDefault!6056 () ValueCell!1445)

(assert (=> b!162896 (= condMapEmpty!6056 (= (arr!2955 (_values!3324 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1445)) mapDefault!6056)))))

(assert (= (and start!16328 res!77132) b!162893))

(assert (= (and b!162893 res!77131) b!162895))

(assert (= (and b!162895 res!77129) b!162891))

(assert (= (and b!162891 res!77130) b!162890))

(assert (= (and b!162896 condMapEmpty!6056) mapIsEmpty!6056))

(assert (= (and b!162896 (not condMapEmpty!6056)) mapNonEmpty!6056))

(assert (= (and mapNonEmpty!6056 ((_ is ValueCellFull!1445) mapValue!6056)) b!162894))

(assert (= (and b!162896 ((_ is ValueCellFull!1445) mapDefault!6056)) b!162892))

(assert (= b!162889 b!162896))

(assert (= start!16328 b!162889))

(declare-fun m!193997 () Bool)

(assert (=> b!162889 m!193997))

(declare-fun m!193999 () Bool)

(assert (=> b!162889 m!193999))

(declare-fun m!194001 () Bool)

(assert (=> start!16328 m!194001))

(declare-fun m!194003 () Bool)

(assert (=> mapNonEmpty!6056 m!194003))

(declare-fun m!194005 () Bool)

(assert (=> b!162895 m!194005))

(declare-fun m!194007 () Bool)

(assert (=> b!162891 m!194007))

(check-sat (not mapNonEmpty!6056) (not start!16328) (not b!162891) (not b!162889) (not b!162895) b_and!10203 tp_is_empty!3577 (not b_next!3775))
(check-sat b_and!10203 (not b_next!3775))
(get-model)

(declare-fun d!51443 () Bool)

(declare-fun res!77163 () Bool)

(declare-fun e!106896 () Bool)

(assert (=> d!51443 (=> (not res!77163) (not e!106896))))

(declare-fun simpleValid!119 (LongMapFixedSize!1798) Bool)

(assert (=> d!51443 (= res!77163 (simpleValid!119 thiss!1248))))

(assert (=> d!51443 (= (valid!830 thiss!1248) e!106896)))

(declare-fun b!162951 () Bool)

(declare-fun res!77164 () Bool)

(assert (=> b!162951 (=> (not res!77164) (not e!106896))))

(declare-fun arrayCountValidKeys!0 (array!6221 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!162951 (= res!77164 (= (arrayCountValidKeys!0 (_keys!5143 thiss!1248) #b00000000000000000000000000000000 (size!3238 (_keys!5143 thiss!1248))) (_size!948 thiss!1248)))))

(declare-fun b!162952 () Bool)

(declare-fun res!77165 () Bool)

(assert (=> b!162952 (=> (not res!77165) (not e!106896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6221 (_ BitVec 32)) Bool)

(assert (=> b!162952 (= res!77165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5143 thiss!1248) (mask!7977 thiss!1248)))))

(declare-fun b!162953 () Bool)

(declare-datatypes ((List!1984 0))(
  ( (Nil!1981) (Cons!1980 (h!2593 (_ BitVec 64)) (t!6778 List!1984)) )
))
(declare-fun arrayNoDuplicates!0 (array!6221 (_ BitVec 32) List!1984) Bool)

(assert (=> b!162953 (= e!106896 (arrayNoDuplicates!0 (_keys!5143 thiss!1248) #b00000000000000000000000000000000 Nil!1981))))

(assert (= (and d!51443 res!77163) b!162951))

(assert (= (and b!162951 res!77164) b!162952))

(assert (= (and b!162952 res!77165) b!162953))

(declare-fun m!194033 () Bool)

(assert (=> d!51443 m!194033))

(declare-fun m!194035 () Bool)

(assert (=> b!162951 m!194035))

(declare-fun m!194037 () Bool)

(assert (=> b!162952 m!194037))

(declare-fun m!194039 () Bool)

(assert (=> b!162953 m!194039))

(assert (=> start!16328 d!51443))

(declare-fun d!51445 () Bool)

(assert (=> d!51445 (= (validMask!0 (mask!7977 thiss!1248)) (and (or (= (mask!7977 thiss!1248) #b00000000000000000000000000000111) (= (mask!7977 thiss!1248) #b00000000000000000000000000001111) (= (mask!7977 thiss!1248) #b00000000000000000000000000011111) (= (mask!7977 thiss!1248) #b00000000000000000000000000111111) (= (mask!7977 thiss!1248) #b00000000000000000000000001111111) (= (mask!7977 thiss!1248) #b00000000000000000000000011111111) (= (mask!7977 thiss!1248) #b00000000000000000000000111111111) (= (mask!7977 thiss!1248) #b00000000000000000000001111111111) (= (mask!7977 thiss!1248) #b00000000000000000000011111111111) (= (mask!7977 thiss!1248) #b00000000000000000000111111111111) (= (mask!7977 thiss!1248) #b00000000000000000001111111111111) (= (mask!7977 thiss!1248) #b00000000000000000011111111111111) (= (mask!7977 thiss!1248) #b00000000000000000111111111111111) (= (mask!7977 thiss!1248) #b00000000000000001111111111111111) (= (mask!7977 thiss!1248) #b00000000000000011111111111111111) (= (mask!7977 thiss!1248) #b00000000000000111111111111111111) (= (mask!7977 thiss!1248) #b00000000000001111111111111111111) (= (mask!7977 thiss!1248) #b00000000000011111111111111111111) (= (mask!7977 thiss!1248) #b00000000000111111111111111111111) (= (mask!7977 thiss!1248) #b00000000001111111111111111111111) (= (mask!7977 thiss!1248) #b00000000011111111111111111111111) (= (mask!7977 thiss!1248) #b00000000111111111111111111111111) (= (mask!7977 thiss!1248) #b00000001111111111111111111111111) (= (mask!7977 thiss!1248) #b00000011111111111111111111111111) (= (mask!7977 thiss!1248) #b00000111111111111111111111111111) (= (mask!7977 thiss!1248) #b00001111111111111111111111111111) (= (mask!7977 thiss!1248) #b00011111111111111111111111111111) (= (mask!7977 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7977 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!162891 d!51445))

(declare-fun b!162966 () Bool)

(declare-fun e!106904 () SeekEntryResult!395)

(assert (=> b!162966 (= e!106904 Undefined!395)))

(declare-fun d!51447 () Bool)

(declare-fun lt!82628 () SeekEntryResult!395)

(assert (=> d!51447 (and (or ((_ is Undefined!395) lt!82628) (not ((_ is Found!395) lt!82628)) (and (bvsge (index!3749 lt!82628) #b00000000000000000000000000000000) (bvslt (index!3749 lt!82628) (size!3238 (_keys!5143 thiss!1248))))) (or ((_ is Undefined!395) lt!82628) ((_ is Found!395) lt!82628) (not ((_ is MissingZero!395) lt!82628)) (and (bvsge (index!3748 lt!82628) #b00000000000000000000000000000000) (bvslt (index!3748 lt!82628) (size!3238 (_keys!5143 thiss!1248))))) (or ((_ is Undefined!395) lt!82628) ((_ is Found!395) lt!82628) ((_ is MissingZero!395) lt!82628) (not ((_ is MissingVacant!395) lt!82628)) (and (bvsge (index!3751 lt!82628) #b00000000000000000000000000000000) (bvslt (index!3751 lt!82628) (size!3238 (_keys!5143 thiss!1248))))) (or ((_ is Undefined!395) lt!82628) (ite ((_ is Found!395) lt!82628) (= (select (arr!2954 (_keys!5143 thiss!1248)) (index!3749 lt!82628)) key!828) (ite ((_ is MissingZero!395) lt!82628) (= (select (arr!2954 (_keys!5143 thiss!1248)) (index!3748 lt!82628)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!395) lt!82628) (= (select (arr!2954 (_keys!5143 thiss!1248)) (index!3751 lt!82628)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51447 (= lt!82628 e!106904)))

(declare-fun c!30007 () Bool)

(declare-fun lt!82627 () SeekEntryResult!395)

(assert (=> d!51447 (= c!30007 (and ((_ is Intermediate!395) lt!82627) (undefined!1207 lt!82627)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6221 (_ BitVec 32)) SeekEntryResult!395)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51447 (= lt!82627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7977 thiss!1248)) key!828 (_keys!5143 thiss!1248) (mask!7977 thiss!1248)))))

(assert (=> d!51447 (validMask!0 (mask!7977 thiss!1248))))

(assert (=> d!51447 (= (seekEntryOrOpen!0 key!828 (_keys!5143 thiss!1248) (mask!7977 thiss!1248)) lt!82628)))

(declare-fun e!106905 () SeekEntryResult!395)

(declare-fun b!162967 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6221 (_ BitVec 32)) SeekEntryResult!395)

(assert (=> b!162967 (= e!106905 (seekKeyOrZeroReturnVacant!0 (x!18035 lt!82627) (index!3750 lt!82627) (index!3750 lt!82627) key!828 (_keys!5143 thiss!1248) (mask!7977 thiss!1248)))))

(declare-fun b!162968 () Bool)

(declare-fun e!106903 () SeekEntryResult!395)

(assert (=> b!162968 (= e!106903 (Found!395 (index!3750 lt!82627)))))

(declare-fun b!162969 () Bool)

(assert (=> b!162969 (= e!106904 e!106903)))

(declare-fun lt!82629 () (_ BitVec 64))

(assert (=> b!162969 (= lt!82629 (select (arr!2954 (_keys!5143 thiss!1248)) (index!3750 lt!82627)))))

(declare-fun c!30006 () Bool)

(assert (=> b!162969 (= c!30006 (= lt!82629 key!828))))

(declare-fun b!162970 () Bool)

(assert (=> b!162970 (= e!106905 (MissingZero!395 (index!3750 lt!82627)))))

(declare-fun b!162971 () Bool)

(declare-fun c!30008 () Bool)

(assert (=> b!162971 (= c!30008 (= lt!82629 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!162971 (= e!106903 e!106905)))

(assert (= (and d!51447 c!30007) b!162966))

(assert (= (and d!51447 (not c!30007)) b!162969))

(assert (= (and b!162969 c!30006) b!162968))

(assert (= (and b!162969 (not c!30006)) b!162971))

(assert (= (and b!162971 c!30008) b!162970))

(assert (= (and b!162971 (not c!30008)) b!162967))

(declare-fun m!194041 () Bool)

(assert (=> d!51447 m!194041))

(declare-fun m!194043 () Bool)

(assert (=> d!51447 m!194043))

(assert (=> d!51447 m!194007))

(assert (=> d!51447 m!194041))

(declare-fun m!194045 () Bool)

(assert (=> d!51447 m!194045))

(declare-fun m!194047 () Bool)

(assert (=> d!51447 m!194047))

(declare-fun m!194049 () Bool)

(assert (=> d!51447 m!194049))

(declare-fun m!194051 () Bool)

(assert (=> b!162967 m!194051))

(declare-fun m!194053 () Bool)

(assert (=> b!162969 m!194053))

(assert (=> b!162895 d!51447))

(declare-fun d!51449 () Bool)

(assert (=> d!51449 (= (array_inv!1899 (_keys!5143 thiss!1248)) (bvsge (size!3238 (_keys!5143 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!162889 d!51449))

(declare-fun d!51451 () Bool)

(assert (=> d!51451 (= (array_inv!1900 (_values!3324 thiss!1248)) (bvsge (size!3239 (_values!3324 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!162889 d!51451))

(declare-fun condMapEmpty!6065 () Bool)

(declare-fun mapDefault!6065 () ValueCell!1445)

(assert (=> mapNonEmpty!6056 (= condMapEmpty!6065 (= mapRest!6056 ((as const (Array (_ BitVec 32) ValueCell!1445)) mapDefault!6065)))))

(declare-fun e!106910 () Bool)

(declare-fun mapRes!6065 () Bool)

(assert (=> mapNonEmpty!6056 (= tp!13898 (and e!106910 mapRes!6065))))

(declare-fun b!162979 () Bool)

(assert (=> b!162979 (= e!106910 tp_is_empty!3577)))

(declare-fun b!162978 () Bool)

(declare-fun e!106911 () Bool)

(assert (=> b!162978 (= e!106911 tp_is_empty!3577)))

(declare-fun mapIsEmpty!6065 () Bool)

(assert (=> mapIsEmpty!6065 mapRes!6065))

(declare-fun mapNonEmpty!6065 () Bool)

(declare-fun tp!13913 () Bool)

(assert (=> mapNonEmpty!6065 (= mapRes!6065 (and tp!13913 e!106911))))

(declare-fun mapRest!6065 () (Array (_ BitVec 32) ValueCell!1445))

(declare-fun mapValue!6065 () ValueCell!1445)

(declare-fun mapKey!6065 () (_ BitVec 32))

(assert (=> mapNonEmpty!6065 (= mapRest!6056 (store mapRest!6065 mapKey!6065 mapValue!6065))))

(assert (= (and mapNonEmpty!6056 condMapEmpty!6065) mapIsEmpty!6065))

(assert (= (and mapNonEmpty!6056 (not condMapEmpty!6065)) mapNonEmpty!6065))

(assert (= (and mapNonEmpty!6065 ((_ is ValueCellFull!1445) mapValue!6065)) b!162978))

(assert (= (and mapNonEmpty!6056 ((_ is ValueCellFull!1445) mapDefault!6065)) b!162979))

(declare-fun m!194055 () Bool)

(assert (=> mapNonEmpty!6065 m!194055))

(check-sat (not b!162951) (not b!162953) (not b!162967) (not mapNonEmpty!6065) (not b!162952) b_and!10203 (not d!51447) (not d!51443) tp_is_empty!3577 (not b_next!3775))
(check-sat b_and!10203 (not b_next!3775))
(get-model)

(declare-fun b!162990 () Bool)

(declare-fun e!106920 () Bool)

(declare-fun e!106921 () Bool)

(assert (=> b!162990 (= e!106920 e!106921)))

(declare-fun c!30011 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!162990 (= c!30011 (validKeyInArray!0 (select (arr!2954 (_keys!5143 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!162991 () Bool)

(declare-fun call!17275 () Bool)

(assert (=> b!162991 (= e!106921 call!17275)))

(declare-fun b!162992 () Bool)

(declare-fun e!106922 () Bool)

(assert (=> b!162992 (= e!106922 e!106920)))

(declare-fun res!77173 () Bool)

(assert (=> b!162992 (=> (not res!77173) (not e!106920))))

(declare-fun e!106923 () Bool)

(assert (=> b!162992 (= res!77173 (not e!106923))))

(declare-fun res!77174 () Bool)

(assert (=> b!162992 (=> (not res!77174) (not e!106923))))

(assert (=> b!162992 (= res!77174 (validKeyInArray!0 (select (arr!2954 (_keys!5143 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51453 () Bool)

(declare-fun res!77172 () Bool)

(assert (=> d!51453 (=> res!77172 e!106922)))

(assert (=> d!51453 (= res!77172 (bvsge #b00000000000000000000000000000000 (size!3238 (_keys!5143 thiss!1248))))))

(assert (=> d!51453 (= (arrayNoDuplicates!0 (_keys!5143 thiss!1248) #b00000000000000000000000000000000 Nil!1981) e!106922)))

(declare-fun bm!17272 () Bool)

(assert (=> bm!17272 (= call!17275 (arrayNoDuplicates!0 (_keys!5143 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30011 (Cons!1980 (select (arr!2954 (_keys!5143 thiss!1248)) #b00000000000000000000000000000000) Nil!1981) Nil!1981)))))

(declare-fun b!162993 () Bool)

(assert (=> b!162993 (= e!106921 call!17275)))

(declare-fun b!162994 () Bool)

(declare-fun contains!1028 (List!1984 (_ BitVec 64)) Bool)

(assert (=> b!162994 (= e!106923 (contains!1028 Nil!1981 (select (arr!2954 (_keys!5143 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51453 (not res!77172)) b!162992))

(assert (= (and b!162992 res!77174) b!162994))

(assert (= (and b!162992 res!77173) b!162990))

(assert (= (and b!162990 c!30011) b!162991))

(assert (= (and b!162990 (not c!30011)) b!162993))

(assert (= (or b!162991 b!162993) bm!17272))

(declare-fun m!194057 () Bool)

(assert (=> b!162990 m!194057))

(assert (=> b!162990 m!194057))

(declare-fun m!194059 () Bool)

(assert (=> b!162990 m!194059))

(assert (=> b!162992 m!194057))

(assert (=> b!162992 m!194057))

(assert (=> b!162992 m!194059))

(assert (=> bm!17272 m!194057))

(declare-fun m!194061 () Bool)

(assert (=> bm!17272 m!194061))

(assert (=> b!162994 m!194057))

(assert (=> b!162994 m!194057))

(declare-fun m!194063 () Bool)

(assert (=> b!162994 m!194063))

(assert (=> b!162953 d!51453))

(declare-fun b!163008 () Bool)

(declare-fun e!106931 () SeekEntryResult!395)

(assert (=> b!163008 (= e!106931 (MissingVacant!395 (index!3750 lt!82627)))))

(declare-fun b!163009 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163009 (= e!106931 (seekKeyOrZeroReturnVacant!0 (bvadd (x!18035 lt!82627) #b00000000000000000000000000000001) (nextIndex!0 (index!3750 lt!82627) (bvadd (x!18035 lt!82627) #b00000000000000000000000000000001) (mask!7977 thiss!1248)) (index!3750 lt!82627) key!828 (_keys!5143 thiss!1248) (mask!7977 thiss!1248)))))

(declare-fun b!163010 () Bool)

(declare-fun e!106932 () SeekEntryResult!395)

(declare-fun e!106930 () SeekEntryResult!395)

(assert (=> b!163010 (= e!106932 e!106930)))

(declare-fun c!30019 () Bool)

(declare-fun lt!82634 () (_ BitVec 64))

(assert (=> b!163010 (= c!30019 (= lt!82634 key!828))))

(declare-fun lt!82635 () SeekEntryResult!395)

(declare-fun d!51455 () Bool)

(assert (=> d!51455 (and (or ((_ is Undefined!395) lt!82635) (not ((_ is Found!395) lt!82635)) (and (bvsge (index!3749 lt!82635) #b00000000000000000000000000000000) (bvslt (index!3749 lt!82635) (size!3238 (_keys!5143 thiss!1248))))) (or ((_ is Undefined!395) lt!82635) ((_ is Found!395) lt!82635) (not ((_ is MissingVacant!395) lt!82635)) (not (= (index!3751 lt!82635) (index!3750 lt!82627))) (and (bvsge (index!3751 lt!82635) #b00000000000000000000000000000000) (bvslt (index!3751 lt!82635) (size!3238 (_keys!5143 thiss!1248))))) (or ((_ is Undefined!395) lt!82635) (ite ((_ is Found!395) lt!82635) (= (select (arr!2954 (_keys!5143 thiss!1248)) (index!3749 lt!82635)) key!828) (and ((_ is MissingVacant!395) lt!82635) (= (index!3751 lt!82635) (index!3750 lt!82627)) (= (select (arr!2954 (_keys!5143 thiss!1248)) (index!3751 lt!82635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!51455 (= lt!82635 e!106932)))

(declare-fun c!30018 () Bool)

(assert (=> d!51455 (= c!30018 (bvsge (x!18035 lt!82627) #b01111111111111111111111111111110))))

(assert (=> d!51455 (= lt!82634 (select (arr!2954 (_keys!5143 thiss!1248)) (index!3750 lt!82627)))))

(assert (=> d!51455 (validMask!0 (mask!7977 thiss!1248))))

(assert (=> d!51455 (= (seekKeyOrZeroReturnVacant!0 (x!18035 lt!82627) (index!3750 lt!82627) (index!3750 lt!82627) key!828 (_keys!5143 thiss!1248) (mask!7977 thiss!1248)) lt!82635)))

(declare-fun b!163007 () Bool)

(assert (=> b!163007 (= e!106930 (Found!395 (index!3750 lt!82627)))))

(declare-fun b!163011 () Bool)

(assert (=> b!163011 (= e!106932 Undefined!395)))

(declare-fun b!163012 () Bool)

(declare-fun c!30020 () Bool)

(assert (=> b!163012 (= c!30020 (= lt!82634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163012 (= e!106930 e!106931)))

(assert (= (and d!51455 c!30018) b!163011))

(assert (= (and d!51455 (not c!30018)) b!163010))

(assert (= (and b!163010 c!30019) b!163007))

(assert (= (and b!163010 (not c!30019)) b!163012))

(assert (= (and b!163012 c!30020) b!163008))

(assert (= (and b!163012 (not c!30020)) b!163009))

(declare-fun m!194065 () Bool)

(assert (=> b!163009 m!194065))

(assert (=> b!163009 m!194065))

(declare-fun m!194067 () Bool)

(assert (=> b!163009 m!194067))

(declare-fun m!194069 () Bool)

(assert (=> d!51455 m!194069))

(declare-fun m!194071 () Bool)

(assert (=> d!51455 m!194071))

(assert (=> d!51455 m!194053))

(assert (=> d!51455 m!194007))

(assert (=> b!162967 d!51455))

(declare-fun d!51457 () Bool)

(declare-fun res!77180 () Bool)

(declare-fun e!106939 () Bool)

(assert (=> d!51457 (=> res!77180 e!106939)))

(assert (=> d!51457 (= res!77180 (bvsge #b00000000000000000000000000000000 (size!3238 (_keys!5143 thiss!1248))))))

(assert (=> d!51457 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5143 thiss!1248) (mask!7977 thiss!1248)) e!106939)))

(declare-fun bm!17275 () Bool)

(declare-fun call!17278 () Bool)

(assert (=> bm!17275 (= call!17278 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5143 thiss!1248) (mask!7977 thiss!1248)))))

(declare-fun b!163021 () Bool)

(declare-fun e!106941 () Bool)

(assert (=> b!163021 (= e!106941 call!17278)))

(declare-fun b!163022 () Bool)

(declare-fun e!106940 () Bool)

(assert (=> b!163022 (= e!106940 call!17278)))

(declare-fun b!163023 () Bool)

(assert (=> b!163023 (= e!106939 e!106940)))

(declare-fun c!30023 () Bool)

(assert (=> b!163023 (= c!30023 (validKeyInArray!0 (select (arr!2954 (_keys!5143 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163024 () Bool)

(assert (=> b!163024 (= e!106940 e!106941)))

(declare-fun lt!82642 () (_ BitVec 64))

(assert (=> b!163024 (= lt!82642 (select (arr!2954 (_keys!5143 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5042 0))(
  ( (Unit!5043) )
))
(declare-fun lt!82644 () Unit!5042)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6221 (_ BitVec 64) (_ BitVec 32)) Unit!5042)

(assert (=> b!163024 (= lt!82644 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5143 thiss!1248) lt!82642 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!163024 (arrayContainsKey!0 (_keys!5143 thiss!1248) lt!82642 #b00000000000000000000000000000000)))

(declare-fun lt!82643 () Unit!5042)

(assert (=> b!163024 (= lt!82643 lt!82644)))

(declare-fun res!77179 () Bool)

(assert (=> b!163024 (= res!77179 (= (seekEntryOrOpen!0 (select (arr!2954 (_keys!5143 thiss!1248)) #b00000000000000000000000000000000) (_keys!5143 thiss!1248) (mask!7977 thiss!1248)) (Found!395 #b00000000000000000000000000000000)))))

(assert (=> b!163024 (=> (not res!77179) (not e!106941))))

(assert (= (and d!51457 (not res!77180)) b!163023))

(assert (= (and b!163023 c!30023) b!163024))

(assert (= (and b!163023 (not c!30023)) b!163022))

(assert (= (and b!163024 res!77179) b!163021))

(assert (= (or b!163021 b!163022) bm!17275))

(declare-fun m!194073 () Bool)

(assert (=> bm!17275 m!194073))

(assert (=> b!163023 m!194057))

(assert (=> b!163023 m!194057))

(assert (=> b!163023 m!194059))

(assert (=> b!163024 m!194057))

(declare-fun m!194075 () Bool)

(assert (=> b!163024 m!194075))

(declare-fun m!194077 () Bool)

(assert (=> b!163024 m!194077))

(assert (=> b!163024 m!194057))

(declare-fun m!194079 () Bool)

(assert (=> b!163024 m!194079))

(assert (=> b!162952 d!51457))

(declare-fun b!163043 () Bool)

(declare-fun e!106955 () SeekEntryResult!395)

(assert (=> b!163043 (= e!106955 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7977 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!7977 thiss!1248)) key!828 (_keys!5143 thiss!1248) (mask!7977 thiss!1248)))))

(declare-fun b!163044 () Bool)

(declare-fun lt!82649 () SeekEntryResult!395)

(assert (=> b!163044 (and (bvsge (index!3750 lt!82649) #b00000000000000000000000000000000) (bvslt (index!3750 lt!82649) (size!3238 (_keys!5143 thiss!1248))))))

(declare-fun e!106952 () Bool)

(assert (=> b!163044 (= e!106952 (= (select (arr!2954 (_keys!5143 thiss!1248)) (index!3750 lt!82649)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!163046 () Bool)

(declare-fun e!106954 () SeekEntryResult!395)

(assert (=> b!163046 (= e!106954 (Intermediate!395 true (toIndex!0 key!828 (mask!7977 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163047 () Bool)

(assert (=> b!163047 (and (bvsge (index!3750 lt!82649) #b00000000000000000000000000000000) (bvslt (index!3750 lt!82649) (size!3238 (_keys!5143 thiss!1248))))))

(declare-fun res!77187 () Bool)

(assert (=> b!163047 (= res!77187 (= (select (arr!2954 (_keys!5143 thiss!1248)) (index!3750 lt!82649)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163047 (=> res!77187 e!106952)))

(declare-fun b!163048 () Bool)

(assert (=> b!163048 (and (bvsge (index!3750 lt!82649) #b00000000000000000000000000000000) (bvslt (index!3750 lt!82649) (size!3238 (_keys!5143 thiss!1248))))))

(declare-fun res!77188 () Bool)

(assert (=> b!163048 (= res!77188 (= (select (arr!2954 (_keys!5143 thiss!1248)) (index!3750 lt!82649)) key!828))))

(assert (=> b!163048 (=> res!77188 e!106952)))

(declare-fun e!106956 () Bool)

(assert (=> b!163048 (= e!106956 e!106952)))

(declare-fun b!163049 () Bool)

(assert (=> b!163049 (= e!106954 e!106955)))

(declare-fun c!30031 () Bool)

(declare-fun lt!82650 () (_ BitVec 64))

(assert (=> b!163049 (= c!30031 (or (= lt!82650 key!828) (= (bvadd lt!82650 lt!82650) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!163045 () Bool)

(assert (=> b!163045 (= e!106955 (Intermediate!395 false (toIndex!0 key!828 (mask!7977 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!51459 () Bool)

(declare-fun e!106953 () Bool)

(assert (=> d!51459 e!106953))

(declare-fun c!30032 () Bool)

(assert (=> d!51459 (= c!30032 (and ((_ is Intermediate!395) lt!82649) (undefined!1207 lt!82649)))))

(assert (=> d!51459 (= lt!82649 e!106954)))

(declare-fun c!30030 () Bool)

(assert (=> d!51459 (= c!30030 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!51459 (= lt!82650 (select (arr!2954 (_keys!5143 thiss!1248)) (toIndex!0 key!828 (mask!7977 thiss!1248))))))

(assert (=> d!51459 (validMask!0 (mask!7977 thiss!1248))))

(assert (=> d!51459 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7977 thiss!1248)) key!828 (_keys!5143 thiss!1248) (mask!7977 thiss!1248)) lt!82649)))

(declare-fun b!163050 () Bool)

(assert (=> b!163050 (= e!106953 e!106956)))

(declare-fun res!77189 () Bool)

(assert (=> b!163050 (= res!77189 (and ((_ is Intermediate!395) lt!82649) (not (undefined!1207 lt!82649)) (bvslt (x!18035 lt!82649) #b01111111111111111111111111111110) (bvsge (x!18035 lt!82649) #b00000000000000000000000000000000) (bvsge (x!18035 lt!82649) #b00000000000000000000000000000000)))))

(assert (=> b!163050 (=> (not res!77189) (not e!106956))))

(declare-fun b!163051 () Bool)

(assert (=> b!163051 (= e!106953 (bvsge (x!18035 lt!82649) #b01111111111111111111111111111110))))

(assert (= (and d!51459 c!30030) b!163046))

(assert (= (and d!51459 (not c!30030)) b!163049))

(assert (= (and b!163049 c!30031) b!163045))

(assert (= (and b!163049 (not c!30031)) b!163043))

(assert (= (and d!51459 c!30032) b!163051))

(assert (= (and d!51459 (not c!30032)) b!163050))

(assert (= (and b!163050 res!77189) b!163048))

(assert (= (and b!163048 (not res!77188)) b!163047))

(assert (= (and b!163047 (not res!77187)) b!163044))

(assert (=> b!163043 m!194041))

(declare-fun m!194081 () Bool)

(assert (=> b!163043 m!194081))

(assert (=> b!163043 m!194081))

(declare-fun m!194083 () Bool)

(assert (=> b!163043 m!194083))

(declare-fun m!194085 () Bool)

(assert (=> b!163048 m!194085))

(assert (=> b!163047 m!194085))

(assert (=> d!51459 m!194041))

(declare-fun m!194087 () Bool)

(assert (=> d!51459 m!194087))

(assert (=> d!51459 m!194007))

(assert (=> b!163044 m!194085))

(assert (=> d!51447 d!51459))

(declare-fun d!51461 () Bool)

(declare-fun lt!82656 () (_ BitVec 32))

(declare-fun lt!82655 () (_ BitVec 32))

(assert (=> d!51461 (= lt!82656 (bvmul (bvxor lt!82655 (bvlshr lt!82655 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51461 (= lt!82655 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51461 (and (bvsge (mask!7977 thiss!1248) #b00000000000000000000000000000000) (let ((res!77190 (let ((h!2594 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!18052 (bvmul (bvxor h!2594 (bvlshr h!2594 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!18052 (bvlshr x!18052 #b00000000000000000000000000001101)) (mask!7977 thiss!1248)))))) (and (bvslt res!77190 (bvadd (mask!7977 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!77190 #b00000000000000000000000000000000))))))

(assert (=> d!51461 (= (toIndex!0 key!828 (mask!7977 thiss!1248)) (bvand (bvxor lt!82656 (bvlshr lt!82656 #b00000000000000000000000000001101)) (mask!7977 thiss!1248)))))

(assert (=> d!51447 d!51461))

(assert (=> d!51447 d!51445))

(declare-fun b!163060 () Bool)

(declare-fun res!77202 () Bool)

(declare-fun e!106959 () Bool)

(assert (=> b!163060 (=> (not res!77202) (not e!106959))))

(assert (=> b!163060 (= res!77202 (and (= (size!3239 (_values!3324 thiss!1248)) (bvadd (mask!7977 thiss!1248) #b00000000000000000000000000000001)) (= (size!3238 (_keys!5143 thiss!1248)) (size!3239 (_values!3324 thiss!1248))) (bvsge (_size!948 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!948 thiss!1248) (bvadd (mask!7977 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!163062 () Bool)

(declare-fun res!77199 () Bool)

(assert (=> b!163062 (=> (not res!77199) (not e!106959))))

(declare-fun size!3244 (LongMapFixedSize!1798) (_ BitVec 32))

(assert (=> b!163062 (= res!77199 (= (size!3244 thiss!1248) (bvadd (_size!948 thiss!1248) (bvsdiv (bvadd (extraKeys!3082 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!163063 () Bool)

(assert (=> b!163063 (= e!106959 (and (bvsge (extraKeys!3082 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3082 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!948 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!51463 () Bool)

(declare-fun res!77201 () Bool)

(assert (=> d!51463 (=> (not res!77201) (not e!106959))))

(assert (=> d!51463 (= res!77201 (validMask!0 (mask!7977 thiss!1248)))))

(assert (=> d!51463 (= (simpleValid!119 thiss!1248) e!106959)))

(declare-fun b!163061 () Bool)

(declare-fun res!77200 () Bool)

(assert (=> b!163061 (=> (not res!77200) (not e!106959))))

(assert (=> b!163061 (= res!77200 (bvsge (size!3244 thiss!1248) (_size!948 thiss!1248)))))

(assert (= (and d!51463 res!77201) b!163060))

(assert (= (and b!163060 res!77202) b!163061))

(assert (= (and b!163061 res!77200) b!163062))

(assert (= (and b!163062 res!77199) b!163063))

(declare-fun m!194089 () Bool)

(assert (=> b!163062 m!194089))

(assert (=> d!51463 m!194007))

(assert (=> b!163061 m!194089))

(assert (=> d!51443 d!51463))

(declare-fun b!163072 () Bool)

(declare-fun e!106965 () (_ BitVec 32))

(declare-fun call!17281 () (_ BitVec 32))

(assert (=> b!163072 (= e!106965 (bvadd #b00000000000000000000000000000001 call!17281))))

(declare-fun b!163073 () Bool)

(declare-fun e!106964 () (_ BitVec 32))

(assert (=> b!163073 (= e!106964 e!106965)))

(declare-fun c!30038 () Bool)

(assert (=> b!163073 (= c!30038 (validKeyInArray!0 (select (arr!2954 (_keys!5143 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163074 () Bool)

(assert (=> b!163074 (= e!106964 #b00000000000000000000000000000000)))

(declare-fun b!163075 () Bool)

(assert (=> b!163075 (= e!106965 call!17281)))

(declare-fun bm!17278 () Bool)

(assert (=> bm!17278 (= call!17281 (arrayCountValidKeys!0 (_keys!5143 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3238 (_keys!5143 thiss!1248))))))

(declare-fun d!51465 () Bool)

(declare-fun lt!82659 () (_ BitVec 32))

(assert (=> d!51465 (and (bvsge lt!82659 #b00000000000000000000000000000000) (bvsle lt!82659 (bvsub (size!3238 (_keys!5143 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51465 (= lt!82659 e!106964)))

(declare-fun c!30037 () Bool)

(assert (=> d!51465 (= c!30037 (bvsge #b00000000000000000000000000000000 (size!3238 (_keys!5143 thiss!1248))))))

(assert (=> d!51465 (and (bvsle #b00000000000000000000000000000000 (size!3238 (_keys!5143 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3238 (_keys!5143 thiss!1248)) (size!3238 (_keys!5143 thiss!1248))))))

(assert (=> d!51465 (= (arrayCountValidKeys!0 (_keys!5143 thiss!1248) #b00000000000000000000000000000000 (size!3238 (_keys!5143 thiss!1248))) lt!82659)))

(assert (= (and d!51465 c!30037) b!163074))

(assert (= (and d!51465 (not c!30037)) b!163073))

(assert (= (and b!163073 c!30038) b!163072))

(assert (= (and b!163073 (not c!30038)) b!163075))

(assert (= (or b!163072 b!163075) bm!17278))

(assert (=> b!163073 m!194057))

(assert (=> b!163073 m!194057))

(assert (=> b!163073 m!194059))

(declare-fun m!194091 () Bool)

(assert (=> bm!17278 m!194091))

(assert (=> b!162951 d!51465))

(declare-fun condMapEmpty!6066 () Bool)

(declare-fun mapDefault!6066 () ValueCell!1445)

(assert (=> mapNonEmpty!6065 (= condMapEmpty!6066 (= mapRest!6065 ((as const (Array (_ BitVec 32) ValueCell!1445)) mapDefault!6066)))))

(declare-fun e!106966 () Bool)

(declare-fun mapRes!6066 () Bool)

(assert (=> mapNonEmpty!6065 (= tp!13913 (and e!106966 mapRes!6066))))

(declare-fun b!163077 () Bool)

(assert (=> b!163077 (= e!106966 tp_is_empty!3577)))

(declare-fun b!163076 () Bool)

(declare-fun e!106967 () Bool)

(assert (=> b!163076 (= e!106967 tp_is_empty!3577)))

(declare-fun mapIsEmpty!6066 () Bool)

(assert (=> mapIsEmpty!6066 mapRes!6066))

(declare-fun mapNonEmpty!6066 () Bool)

(declare-fun tp!13914 () Bool)

(assert (=> mapNonEmpty!6066 (= mapRes!6066 (and tp!13914 e!106967))))

(declare-fun mapRest!6066 () (Array (_ BitVec 32) ValueCell!1445))

(declare-fun mapValue!6066 () ValueCell!1445)

(declare-fun mapKey!6066 () (_ BitVec 32))

(assert (=> mapNonEmpty!6066 (= mapRest!6065 (store mapRest!6066 mapKey!6066 mapValue!6066))))

(assert (= (and mapNonEmpty!6065 condMapEmpty!6066) mapIsEmpty!6066))

(assert (= (and mapNonEmpty!6065 (not condMapEmpty!6066)) mapNonEmpty!6066))

(assert (= (and mapNonEmpty!6066 ((_ is ValueCellFull!1445) mapValue!6066)) b!163076))

(assert (= (and mapNonEmpty!6065 ((_ is ValueCellFull!1445) mapDefault!6066)) b!163077))

(declare-fun m!194093 () Bool)

(assert (=> mapNonEmpty!6066 m!194093))

(check-sat (not b!162990) (not b!163024) (not b!162992) (not b!162994) (not b!163073) (not bm!17278) (not bm!17275) (not d!51463) b_and!10203 (not d!51459) (not b!163061) (not mapNonEmpty!6066) (not b!163009) tp_is_empty!3577 (not b_next!3775) (not b!163023) (not b!163062) (not d!51455) (not bm!17272) (not b!163043))
(check-sat b_and!10203 (not b_next!3775))
