; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16482 () Bool)

(assert start!16482)

(declare-fun b!163951 () Bool)

(declare-fun b_free!3811 () Bool)

(declare-fun b_next!3811 () Bool)

(assert (=> b!163951 (= b_free!3811 (not b_next!3811))))

(declare-fun tp!14028 () Bool)

(declare-fun b_and!10239 () Bool)

(assert (=> b!163951 (= tp!14028 b_and!10239)))

(declare-fun b!163948 () Bool)

(declare-fun e!107566 () Bool)

(declare-fun e!107570 () Bool)

(declare-fun mapRes!6132 () Bool)

(assert (=> b!163948 (= e!107566 (and e!107570 mapRes!6132))))

(declare-fun condMapEmpty!6132 () Bool)

(declare-datatypes ((V!4465 0))(
  ( (V!4466 (val!1851 Int)) )
))
(declare-datatypes ((ValueCell!1463 0))(
  ( (ValueCellFull!1463 (v!3717 V!4465)) (EmptyCell!1463) )
))
(declare-datatypes ((array!6305 0))(
  ( (array!6306 (arr!2990 (Array (_ BitVec 32) (_ BitVec 64))) (size!3278 (_ BitVec 32))) )
))
(declare-datatypes ((array!6307 0))(
  ( (array!6308 (arr!2991 (Array (_ BitVec 32) ValueCell!1463)) (size!3279 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1834 0))(
  ( (LongMapFixedSize!1835 (defaultEntry!3359 Int) (mask!8036 (_ BitVec 32)) (extraKeys!3100 (_ BitVec 32)) (zeroValue!3202 V!4465) (minValue!3202 V!4465) (_size!966 (_ BitVec 32)) (_keys!5180 array!6305) (_values!3342 array!6307) (_vacant!966 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1834)

(declare-fun mapDefault!6132 () ValueCell!1463)

(assert (=> b!163948 (= condMapEmpty!6132 (= (arr!2991 (_values!3342 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1463)) mapDefault!6132)))))

(declare-fun b!163949 () Bool)

(declare-fun res!77571 () Bool)

(declare-fun e!107568 () Bool)

(assert (=> b!163949 (=> (not res!77571) (not e!107568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163949 (= res!77571 (validMask!0 (mask!8036 thiss!1248)))))

(declare-fun b!163950 () Bool)

(declare-fun e!107567 () Bool)

(declare-fun tp_is_empty!3613 () Bool)

(assert (=> b!163950 (= e!107567 tp_is_empty!3613)))

(declare-fun e!107565 () Bool)

(declare-fun array_inv!1921 (array!6305) Bool)

(declare-fun array_inv!1922 (array!6307) Bool)

(assert (=> b!163951 (= e!107565 (and tp!14028 tp_is_empty!3613 (array_inv!1921 (_keys!5180 thiss!1248)) (array_inv!1922 (_values!3342 thiss!1248)) e!107566))))

(declare-fun b!163952 () Bool)

(assert (=> b!163952 (= e!107570 tp_is_empty!3613)))

(declare-fun res!77569 () Bool)

(declare-fun e!107569 () Bool)

(assert (=> start!16482 (=> (not res!77569) (not e!107569))))

(declare-fun valid!840 (LongMapFixedSize!1834) Bool)

(assert (=> start!16482 (= res!77569 (valid!840 thiss!1248))))

(assert (=> start!16482 e!107569))

(assert (=> start!16482 e!107565))

(assert (=> start!16482 true))

(declare-fun mapNonEmpty!6132 () Bool)

(declare-fun tp!14027 () Bool)

(assert (=> mapNonEmpty!6132 (= mapRes!6132 (and tp!14027 e!107567))))

(declare-fun mapRest!6132 () (Array (_ BitVec 32) ValueCell!1463))

(declare-fun mapKey!6132 () (_ BitVec 32))

(declare-fun mapValue!6132 () ValueCell!1463)

(assert (=> mapNonEmpty!6132 (= (arr!2991 (_values!3342 thiss!1248)) (store mapRest!6132 mapKey!6132 mapValue!6132))))

(declare-fun b!163953 () Bool)

(declare-fun res!77568 () Bool)

(assert (=> b!163953 (=> (not res!77568) (not e!107569))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!163953 (= res!77568 (not (= key!828 (bvneg key!828))))))

(declare-fun b!163954 () Bool)

(declare-fun res!77570 () Bool)

(assert (=> b!163954 (=> (not res!77570) (not e!107568))))

(assert (=> b!163954 (= res!77570 (and (= (size!3279 (_values!3342 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8036 thiss!1248))) (= (size!3278 (_keys!5180 thiss!1248)) (size!3279 (_values!3342 thiss!1248))) (bvsge (mask!8036 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3100 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3100 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!163955 () Bool)

(declare-datatypes ((List!1990 0))(
  ( (Nil!1987) (Cons!1986 (h!2603 (_ BitVec 64)) (t!6784 List!1990)) )
))
(declare-fun arrayNoDuplicates!0 (array!6305 (_ BitVec 32) List!1990) Bool)

(assert (=> b!163955 (= e!107568 (not (arrayNoDuplicates!0 (_keys!5180 thiss!1248) #b00000000000000000000000000000000 Nil!1987)))))

(declare-fun b!163956 () Bool)

(assert (=> b!163956 (= e!107569 e!107568)))

(declare-fun res!77566 () Bool)

(assert (=> b!163956 (=> (not res!77566) (not e!107568))))

(declare-datatypes ((SeekEntryResult!404 0))(
  ( (MissingZero!404 (index!3784 (_ BitVec 32))) (Found!404 (index!3785 (_ BitVec 32))) (Intermediate!404 (undefined!1216 Bool) (index!3786 (_ BitVec 32)) (x!18176 (_ BitVec 32))) (Undefined!404) (MissingVacant!404 (index!3787 (_ BitVec 32))) )
))
(declare-fun lt!82851 () SeekEntryResult!404)

(get-info :version)

(assert (=> b!163956 (= res!77566 (and (not ((_ is Undefined!404) lt!82851)) (not ((_ is MissingVacant!404) lt!82851)) (not ((_ is MissingZero!404) lt!82851)) ((_ is Found!404) lt!82851)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6305 (_ BitVec 32)) SeekEntryResult!404)

(assert (=> b!163956 (= lt!82851 (seekEntryOrOpen!0 key!828 (_keys!5180 thiss!1248) (mask!8036 thiss!1248)))))

(declare-fun b!163957 () Bool)

(declare-fun res!77567 () Bool)

(assert (=> b!163957 (=> (not res!77567) (not e!107568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6305 (_ BitVec 32)) Bool)

(assert (=> b!163957 (= res!77567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5180 thiss!1248) (mask!8036 thiss!1248)))))

(declare-fun mapIsEmpty!6132 () Bool)

(assert (=> mapIsEmpty!6132 mapRes!6132))

(assert (= (and start!16482 res!77569) b!163953))

(assert (= (and b!163953 res!77568) b!163956))

(assert (= (and b!163956 res!77566) b!163949))

(assert (= (and b!163949 res!77571) b!163954))

(assert (= (and b!163954 res!77570) b!163957))

(assert (= (and b!163957 res!77567) b!163955))

(assert (= (and b!163948 condMapEmpty!6132) mapIsEmpty!6132))

(assert (= (and b!163948 (not condMapEmpty!6132)) mapNonEmpty!6132))

(assert (= (and mapNonEmpty!6132 ((_ is ValueCellFull!1463) mapValue!6132)) b!163950))

(assert (= (and b!163948 ((_ is ValueCellFull!1463) mapDefault!6132)) b!163952))

(assert (= b!163951 b!163948))

(assert (= start!16482 b!163951))

(declare-fun m!194525 () Bool)

(assert (=> mapNonEmpty!6132 m!194525))

(declare-fun m!194527 () Bool)

(assert (=> b!163951 m!194527))

(declare-fun m!194529 () Bool)

(assert (=> b!163951 m!194529))

(declare-fun m!194531 () Bool)

(assert (=> b!163957 m!194531))

(declare-fun m!194533 () Bool)

(assert (=> b!163949 m!194533))

(declare-fun m!194535 () Bool)

(assert (=> b!163956 m!194535))

(declare-fun m!194537 () Bool)

(assert (=> b!163955 m!194537))

(declare-fun m!194539 () Bool)

(assert (=> start!16482 m!194539))

(check-sat (not b!163957) (not b!163955) (not b_next!3811) b_and!10239 (not b!163951) (not mapNonEmpty!6132) tp_is_empty!3613 (not b!163949) (not b!163956) (not start!16482))
(check-sat b_and!10239 (not b_next!3811))
(get-model)

(declare-fun b!164030 () Bool)

(declare-fun e!107621 () SeekEntryResult!404)

(declare-fun e!107619 () SeekEntryResult!404)

(assert (=> b!164030 (= e!107621 e!107619)))

(declare-fun lt!82865 () (_ BitVec 64))

(declare-fun lt!82866 () SeekEntryResult!404)

(assert (=> b!164030 (= lt!82865 (select (arr!2990 (_keys!5180 thiss!1248)) (index!3786 lt!82866)))))

(declare-fun c!30185 () Bool)

(assert (=> b!164030 (= c!30185 (= lt!82865 key!828))))

(declare-fun b!164031 () Bool)

(declare-fun c!30184 () Bool)

(assert (=> b!164031 (= c!30184 (= lt!82865 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107620 () SeekEntryResult!404)

(assert (=> b!164031 (= e!107619 e!107620)))

(declare-fun b!164032 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6305 (_ BitVec 32)) SeekEntryResult!404)

(assert (=> b!164032 (= e!107620 (seekKeyOrZeroReturnVacant!0 (x!18176 lt!82866) (index!3786 lt!82866) (index!3786 lt!82866) key!828 (_keys!5180 thiss!1248) (mask!8036 thiss!1248)))))

(declare-fun d!51573 () Bool)

(declare-fun lt!82864 () SeekEntryResult!404)

(assert (=> d!51573 (and (or ((_ is Undefined!404) lt!82864) (not ((_ is Found!404) lt!82864)) (and (bvsge (index!3785 lt!82864) #b00000000000000000000000000000000) (bvslt (index!3785 lt!82864) (size!3278 (_keys!5180 thiss!1248))))) (or ((_ is Undefined!404) lt!82864) ((_ is Found!404) lt!82864) (not ((_ is MissingZero!404) lt!82864)) (and (bvsge (index!3784 lt!82864) #b00000000000000000000000000000000) (bvslt (index!3784 lt!82864) (size!3278 (_keys!5180 thiss!1248))))) (or ((_ is Undefined!404) lt!82864) ((_ is Found!404) lt!82864) ((_ is MissingZero!404) lt!82864) (not ((_ is MissingVacant!404) lt!82864)) (and (bvsge (index!3787 lt!82864) #b00000000000000000000000000000000) (bvslt (index!3787 lt!82864) (size!3278 (_keys!5180 thiss!1248))))) (or ((_ is Undefined!404) lt!82864) (ite ((_ is Found!404) lt!82864) (= (select (arr!2990 (_keys!5180 thiss!1248)) (index!3785 lt!82864)) key!828) (ite ((_ is MissingZero!404) lt!82864) (= (select (arr!2990 (_keys!5180 thiss!1248)) (index!3784 lt!82864)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!404) lt!82864) (= (select (arr!2990 (_keys!5180 thiss!1248)) (index!3787 lt!82864)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51573 (= lt!82864 e!107621)))

(declare-fun c!30183 () Bool)

(assert (=> d!51573 (= c!30183 (and ((_ is Intermediate!404) lt!82866) (undefined!1216 lt!82866)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6305 (_ BitVec 32)) SeekEntryResult!404)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51573 (= lt!82866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8036 thiss!1248)) key!828 (_keys!5180 thiss!1248) (mask!8036 thiss!1248)))))

(assert (=> d!51573 (validMask!0 (mask!8036 thiss!1248))))

(assert (=> d!51573 (= (seekEntryOrOpen!0 key!828 (_keys!5180 thiss!1248) (mask!8036 thiss!1248)) lt!82864)))

(declare-fun b!164033 () Bool)

(assert (=> b!164033 (= e!107619 (Found!404 (index!3786 lt!82866)))))

(declare-fun b!164034 () Bool)

(assert (=> b!164034 (= e!107621 Undefined!404)))

(declare-fun b!164035 () Bool)

(assert (=> b!164035 (= e!107620 (MissingZero!404 (index!3786 lt!82866)))))

(assert (= (and d!51573 c!30183) b!164034))

(assert (= (and d!51573 (not c!30183)) b!164030))

(assert (= (and b!164030 c!30185) b!164033))

(assert (= (and b!164030 (not c!30185)) b!164031))

(assert (= (and b!164031 c!30184) b!164035))

(assert (= (and b!164031 (not c!30184)) b!164032))

(declare-fun m!194573 () Bool)

(assert (=> b!164030 m!194573))

(declare-fun m!194575 () Bool)

(assert (=> b!164032 m!194575))

(declare-fun m!194577 () Bool)

(assert (=> d!51573 m!194577))

(assert (=> d!51573 m!194533))

(declare-fun m!194579 () Bool)

(assert (=> d!51573 m!194579))

(declare-fun m!194581 () Bool)

(assert (=> d!51573 m!194581))

(declare-fun m!194583 () Bool)

(assert (=> d!51573 m!194583))

(declare-fun m!194585 () Bool)

(assert (=> d!51573 m!194585))

(assert (=> d!51573 m!194579))

(assert (=> b!163956 d!51573))

(declare-fun d!51575 () Bool)

(assert (=> d!51575 (= (array_inv!1921 (_keys!5180 thiss!1248)) (bvsge (size!3278 (_keys!5180 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163951 d!51575))

(declare-fun d!51577 () Bool)

(assert (=> d!51577 (= (array_inv!1922 (_values!3342 thiss!1248)) (bvsge (size!3279 (_values!3342 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163951 d!51577))

(declare-fun d!51579 () Bool)

(declare-fun res!77614 () Bool)

(declare-fun e!107624 () Bool)

(assert (=> d!51579 (=> (not res!77614) (not e!107624))))

(declare-fun simpleValid!125 (LongMapFixedSize!1834) Bool)

(assert (=> d!51579 (= res!77614 (simpleValid!125 thiss!1248))))

(assert (=> d!51579 (= (valid!840 thiss!1248) e!107624)))

(declare-fun b!164042 () Bool)

(declare-fun res!77615 () Bool)

(assert (=> b!164042 (=> (not res!77615) (not e!107624))))

(declare-fun arrayCountValidKeys!0 (array!6305 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!164042 (= res!77615 (= (arrayCountValidKeys!0 (_keys!5180 thiss!1248) #b00000000000000000000000000000000 (size!3278 (_keys!5180 thiss!1248))) (_size!966 thiss!1248)))))

(declare-fun b!164043 () Bool)

(declare-fun res!77616 () Bool)

(assert (=> b!164043 (=> (not res!77616) (not e!107624))))

(assert (=> b!164043 (= res!77616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5180 thiss!1248) (mask!8036 thiss!1248)))))

(declare-fun b!164044 () Bool)

(assert (=> b!164044 (= e!107624 (arrayNoDuplicates!0 (_keys!5180 thiss!1248) #b00000000000000000000000000000000 Nil!1987))))

(assert (= (and d!51579 res!77614) b!164042))

(assert (= (and b!164042 res!77615) b!164043))

(assert (= (and b!164043 res!77616) b!164044))

(declare-fun m!194587 () Bool)

(assert (=> d!51579 m!194587))

(declare-fun m!194589 () Bool)

(assert (=> b!164042 m!194589))

(assert (=> b!164043 m!194531))

(assert (=> b!164044 m!194537))

(assert (=> start!16482 d!51579))

(declare-fun b!164055 () Bool)

(declare-fun e!107635 () Bool)

(declare-fun e!107636 () Bool)

(assert (=> b!164055 (= e!107635 e!107636)))

(declare-fun c!30188 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!164055 (= c!30188 (validKeyInArray!0 (select (arr!2990 (_keys!5180 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!164056 () Bool)

(declare-fun e!107634 () Bool)

(declare-fun contains!1032 (List!1990 (_ BitVec 64)) Bool)

(assert (=> b!164056 (= e!107634 (contains!1032 Nil!1987 (select (arr!2990 (_keys!5180 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!164057 () Bool)

(declare-fun call!17314 () Bool)

(assert (=> b!164057 (= e!107636 call!17314)))

(declare-fun b!164058 () Bool)

(declare-fun e!107633 () Bool)

(assert (=> b!164058 (= e!107633 e!107635)))

(declare-fun res!77623 () Bool)

(assert (=> b!164058 (=> (not res!77623) (not e!107635))))

(assert (=> b!164058 (= res!77623 (not e!107634))))

(declare-fun res!77624 () Bool)

(assert (=> b!164058 (=> (not res!77624) (not e!107634))))

(assert (=> b!164058 (= res!77624 (validKeyInArray!0 (select (arr!2990 (_keys!5180 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51581 () Bool)

(declare-fun res!77625 () Bool)

(assert (=> d!51581 (=> res!77625 e!107633)))

(assert (=> d!51581 (= res!77625 (bvsge #b00000000000000000000000000000000 (size!3278 (_keys!5180 thiss!1248))))))

(assert (=> d!51581 (= (arrayNoDuplicates!0 (_keys!5180 thiss!1248) #b00000000000000000000000000000000 Nil!1987) e!107633)))

(declare-fun b!164059 () Bool)

(assert (=> b!164059 (= e!107636 call!17314)))

(declare-fun bm!17311 () Bool)

(assert (=> bm!17311 (= call!17314 (arrayNoDuplicates!0 (_keys!5180 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30188 (Cons!1986 (select (arr!2990 (_keys!5180 thiss!1248)) #b00000000000000000000000000000000) Nil!1987) Nil!1987)))))

(assert (= (and d!51581 (not res!77625)) b!164058))

(assert (= (and b!164058 res!77624) b!164056))

(assert (= (and b!164058 res!77623) b!164055))

(assert (= (and b!164055 c!30188) b!164057))

(assert (= (and b!164055 (not c!30188)) b!164059))

(assert (= (or b!164057 b!164059) bm!17311))

(declare-fun m!194591 () Bool)

(assert (=> b!164055 m!194591))

(assert (=> b!164055 m!194591))

(declare-fun m!194593 () Bool)

(assert (=> b!164055 m!194593))

(assert (=> b!164056 m!194591))

(assert (=> b!164056 m!194591))

(declare-fun m!194595 () Bool)

(assert (=> b!164056 m!194595))

(assert (=> b!164058 m!194591))

(assert (=> b!164058 m!194591))

(assert (=> b!164058 m!194593))

(assert (=> bm!17311 m!194591))

(declare-fun m!194597 () Bool)

(assert (=> bm!17311 m!194597))

(assert (=> b!163955 d!51581))

(declare-fun d!51583 () Bool)

(assert (=> d!51583 (= (validMask!0 (mask!8036 thiss!1248)) (and (or (= (mask!8036 thiss!1248) #b00000000000000000000000000000111) (= (mask!8036 thiss!1248) #b00000000000000000000000000001111) (= (mask!8036 thiss!1248) #b00000000000000000000000000011111) (= (mask!8036 thiss!1248) #b00000000000000000000000000111111) (= (mask!8036 thiss!1248) #b00000000000000000000000001111111) (= (mask!8036 thiss!1248) #b00000000000000000000000011111111) (= (mask!8036 thiss!1248) #b00000000000000000000000111111111) (= (mask!8036 thiss!1248) #b00000000000000000000001111111111) (= (mask!8036 thiss!1248) #b00000000000000000000011111111111) (= (mask!8036 thiss!1248) #b00000000000000000000111111111111) (= (mask!8036 thiss!1248) #b00000000000000000001111111111111) (= (mask!8036 thiss!1248) #b00000000000000000011111111111111) (= (mask!8036 thiss!1248) #b00000000000000000111111111111111) (= (mask!8036 thiss!1248) #b00000000000000001111111111111111) (= (mask!8036 thiss!1248) #b00000000000000011111111111111111) (= (mask!8036 thiss!1248) #b00000000000000111111111111111111) (= (mask!8036 thiss!1248) #b00000000000001111111111111111111) (= (mask!8036 thiss!1248) #b00000000000011111111111111111111) (= (mask!8036 thiss!1248) #b00000000000111111111111111111111) (= (mask!8036 thiss!1248) #b00000000001111111111111111111111) (= (mask!8036 thiss!1248) #b00000000011111111111111111111111) (= (mask!8036 thiss!1248) #b00000000111111111111111111111111) (= (mask!8036 thiss!1248) #b00000001111111111111111111111111) (= (mask!8036 thiss!1248) #b00000011111111111111111111111111) (= (mask!8036 thiss!1248) #b00000111111111111111111111111111) (= (mask!8036 thiss!1248) #b00001111111111111111111111111111) (= (mask!8036 thiss!1248) #b00011111111111111111111111111111) (= (mask!8036 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8036 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163949 d!51583))

(declare-fun b!164068 () Bool)

(declare-fun e!107644 () Bool)

(declare-fun call!17317 () Bool)

(assert (=> b!164068 (= e!107644 call!17317)))

(declare-fun d!51585 () Bool)

(declare-fun res!77631 () Bool)

(declare-fun e!107645 () Bool)

(assert (=> d!51585 (=> res!77631 e!107645)))

(assert (=> d!51585 (= res!77631 (bvsge #b00000000000000000000000000000000 (size!3278 (_keys!5180 thiss!1248))))))

(assert (=> d!51585 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5180 thiss!1248) (mask!8036 thiss!1248)) e!107645)))

(declare-fun b!164069 () Bool)

(declare-fun e!107643 () Bool)

(assert (=> b!164069 (= e!107645 e!107643)))

(declare-fun c!30191 () Bool)

(assert (=> b!164069 (= c!30191 (validKeyInArray!0 (select (arr!2990 (_keys!5180 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!164070 () Bool)

(assert (=> b!164070 (= e!107643 call!17317)))

(declare-fun bm!17314 () Bool)

(assert (=> bm!17314 (= call!17317 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5180 thiss!1248) (mask!8036 thiss!1248)))))

(declare-fun b!164071 () Bool)

(assert (=> b!164071 (= e!107643 e!107644)))

(declare-fun lt!82874 () (_ BitVec 64))

(assert (=> b!164071 (= lt!82874 (select (arr!2990 (_keys!5180 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5052 0))(
  ( (Unit!5053) )
))
(declare-fun lt!82875 () Unit!5052)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6305 (_ BitVec 64) (_ BitVec 32)) Unit!5052)

(assert (=> b!164071 (= lt!82875 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5180 thiss!1248) lt!82874 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!164071 (arrayContainsKey!0 (_keys!5180 thiss!1248) lt!82874 #b00000000000000000000000000000000)))

(declare-fun lt!82873 () Unit!5052)

(assert (=> b!164071 (= lt!82873 lt!82875)))

(declare-fun res!77630 () Bool)

(assert (=> b!164071 (= res!77630 (= (seekEntryOrOpen!0 (select (arr!2990 (_keys!5180 thiss!1248)) #b00000000000000000000000000000000) (_keys!5180 thiss!1248) (mask!8036 thiss!1248)) (Found!404 #b00000000000000000000000000000000)))))

(assert (=> b!164071 (=> (not res!77630) (not e!107644))))

(assert (= (and d!51585 (not res!77631)) b!164069))

(assert (= (and b!164069 c!30191) b!164071))

(assert (= (and b!164069 (not c!30191)) b!164070))

(assert (= (and b!164071 res!77630) b!164068))

(assert (= (or b!164068 b!164070) bm!17314))

(assert (=> b!164069 m!194591))

(assert (=> b!164069 m!194591))

(assert (=> b!164069 m!194593))

(declare-fun m!194599 () Bool)

(assert (=> bm!17314 m!194599))

(assert (=> b!164071 m!194591))

(declare-fun m!194601 () Bool)

(assert (=> b!164071 m!194601))

(declare-fun m!194603 () Bool)

(assert (=> b!164071 m!194603))

(assert (=> b!164071 m!194591))

(declare-fun m!194605 () Bool)

(assert (=> b!164071 m!194605))

(assert (=> b!163957 d!51585))

(declare-fun mapIsEmpty!6141 () Bool)

(declare-fun mapRes!6141 () Bool)

(assert (=> mapIsEmpty!6141 mapRes!6141))

(declare-fun b!164079 () Bool)

(declare-fun e!107650 () Bool)

(assert (=> b!164079 (= e!107650 tp_is_empty!3613)))

(declare-fun b!164078 () Bool)

(declare-fun e!107651 () Bool)

(assert (=> b!164078 (= e!107651 tp_is_empty!3613)))

(declare-fun condMapEmpty!6141 () Bool)

(declare-fun mapDefault!6141 () ValueCell!1463)

(assert (=> mapNonEmpty!6132 (= condMapEmpty!6141 (= mapRest!6132 ((as const (Array (_ BitVec 32) ValueCell!1463)) mapDefault!6141)))))

(assert (=> mapNonEmpty!6132 (= tp!14027 (and e!107650 mapRes!6141))))

(declare-fun mapNonEmpty!6141 () Bool)

(declare-fun tp!14043 () Bool)

(assert (=> mapNonEmpty!6141 (= mapRes!6141 (and tp!14043 e!107651))))

(declare-fun mapValue!6141 () ValueCell!1463)

(declare-fun mapRest!6141 () (Array (_ BitVec 32) ValueCell!1463))

(declare-fun mapKey!6141 () (_ BitVec 32))

(assert (=> mapNonEmpty!6141 (= mapRest!6132 (store mapRest!6141 mapKey!6141 mapValue!6141))))

(assert (= (and mapNonEmpty!6132 condMapEmpty!6141) mapIsEmpty!6141))

(assert (= (and mapNonEmpty!6132 (not condMapEmpty!6141)) mapNonEmpty!6141))

(assert (= (and mapNonEmpty!6141 ((_ is ValueCellFull!1463) mapValue!6141)) b!164078))

(assert (= (and mapNonEmpty!6132 ((_ is ValueCellFull!1463) mapDefault!6141)) b!164079))

(declare-fun m!194607 () Bool)

(assert (=> mapNonEmpty!6141 m!194607))

(check-sat (not b!164044) (not bm!17314) (not b!164043) tp_is_empty!3613 (not b_next!3811) (not b!164056) (not b!164055) (not d!51573) (not b!164042) (not mapNonEmpty!6141) (not d!51579) (not b!164069) (not b!164032) (not b!164071) (not bm!17311) b_and!10239 (not b!164058))
(check-sat b_and!10239 (not b_next!3811))
