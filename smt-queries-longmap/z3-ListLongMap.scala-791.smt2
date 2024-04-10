; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18812 () Bool)

(assert start!18812)

(declare-fun b!185945 () Bool)

(declare-fun b_free!4587 () Bool)

(declare-fun b_next!4587 () Bool)

(assert (=> b!185945 (= b_free!4587 (not b_next!4587))))

(declare-fun tp!16559 () Bool)

(declare-fun b_and!11189 () Bool)

(assert (=> b!185945 (= tp!16559 b_and!11189)))

(declare-fun b!185937 () Bool)

(declare-datatypes ((Unit!5602 0))(
  ( (Unit!5603) )
))
(declare-fun e!122367 () Unit!5602)

(declare-fun Unit!5604 () Unit!5602)

(assert (=> b!185937 (= e!122367 Unit!5604)))

(declare-fun lt!91909 () Unit!5602)

(declare-datatypes ((V!5459 0))(
  ( (V!5460 (val!2224 Int)) )
))
(declare-datatypes ((ValueCell!1836 0))(
  ( (ValueCellFull!1836 (v!4135 V!5459)) (EmptyCell!1836) )
))
(declare-datatypes ((array!7927 0))(
  ( (array!7928 (arr!3743 (Array (_ BitVec 32) (_ BitVec 64))) (size!4059 (_ BitVec 32))) )
))
(declare-datatypes ((array!7929 0))(
  ( (array!7930 (arr!3744 (Array (_ BitVec 32) ValueCell!1836)) (size!4060 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2580 0))(
  ( (LongMapFixedSize!2581 (defaultEntry!3792 Int) (mask!8909 (_ BitVec 32)) (extraKeys!3529 (_ BitVec 32)) (zeroValue!3633 V!5459) (minValue!3633 V!5459) (_size!1339 (_ BitVec 32)) (_keys!5733 array!7927) (_values!3775 array!7929) (_vacant!1339 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2580)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!145 (array!7927 array!7929 (_ BitVec 32) (_ BitVec 32) V!5459 V!5459 (_ BitVec 64) Int) Unit!5602)

(assert (=> b!185937 (= lt!91909 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!145 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) key!828 (defaultEntry!3792 thiss!1248)))))

(assert (=> b!185937 false))

(declare-fun b!185938 () Bool)

(declare-fun e!122368 () Bool)

(declare-datatypes ((SeekEntryResult!640 0))(
  ( (MissingZero!640 (index!4730 (_ BitVec 32))) (Found!640 (index!4731 (_ BitVec 32))) (Intermediate!640 (undefined!1452 Bool) (index!4732 (_ BitVec 32)) (x!20186 (_ BitVec 32))) (Undefined!640) (MissingVacant!640 (index!4733 (_ BitVec 32))) )
))
(declare-fun lt!91911 () SeekEntryResult!640)

(assert (=> b!185938 (= e!122368 (= (select (arr!3743 (_keys!5733 thiss!1248)) (index!4731 lt!91911)) key!828))))

(declare-fun b!185939 () Bool)

(declare-fun res!87973 () Bool)

(declare-fun e!122374 () Bool)

(assert (=> b!185939 (=> (not res!87973) (not e!122374))))

(assert (=> b!185939 (= res!87973 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7500 () Bool)

(declare-fun mapRes!7500 () Bool)

(assert (=> mapIsEmpty!7500 mapRes!7500))

(declare-fun b!185940 () Bool)

(declare-fun e!122366 () Bool)

(declare-fun e!122369 () Bool)

(assert (=> b!185940 (= e!122366 (and e!122369 mapRes!7500))))

(declare-fun condMapEmpty!7500 () Bool)

(declare-fun mapDefault!7500 () ValueCell!1836)

(assert (=> b!185940 (= condMapEmpty!7500 (= (arr!3744 (_values!3775 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1836)) mapDefault!7500)))))

(declare-fun b!185941 () Bool)

(declare-fun lt!91908 () Unit!5602)

(assert (=> b!185941 (= e!122367 lt!91908)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!143 (array!7927 array!7929 (_ BitVec 32) (_ BitVec 32) V!5459 V!5459 (_ BitVec 64) Int) Unit!5602)

(assert (=> b!185941 (= lt!91908 (lemmaInListMapThenSeekEntryOrOpenFindsIt!143 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) key!828 (defaultEntry!3792 thiss!1248)))))

(declare-fun res!87974 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!185941 (= res!87974 (inRange!0 (index!4731 lt!91911) (mask!8909 thiss!1248)))))

(assert (=> b!185941 (=> (not res!87974) (not e!122368))))

(assert (=> b!185941 e!122368))

(declare-fun res!87971 () Bool)

(assert (=> start!18812 (=> (not res!87971) (not e!122374))))

(declare-fun valid!1063 (LongMapFixedSize!2580) Bool)

(assert (=> start!18812 (= res!87971 (valid!1063 thiss!1248))))

(assert (=> start!18812 e!122374))

(declare-fun e!122370 () Bool)

(assert (=> start!18812 e!122370))

(assert (=> start!18812 true))

(declare-fun mapNonEmpty!7500 () Bool)

(declare-fun tp!16560 () Bool)

(declare-fun e!122373 () Bool)

(assert (=> mapNonEmpty!7500 (= mapRes!7500 (and tp!16560 e!122373))))

(declare-fun mapRest!7500 () (Array (_ BitVec 32) ValueCell!1836))

(declare-fun mapKey!7500 () (_ BitVec 32))

(declare-fun mapValue!7500 () ValueCell!1836)

(assert (=> mapNonEmpty!7500 (= (arr!3744 (_values!3775 thiss!1248)) (store mapRest!7500 mapKey!7500 mapValue!7500))))

(declare-fun b!185942 () Bool)

(declare-fun e!122372 () Bool)

(assert (=> b!185942 (= e!122374 e!122372)))

(declare-fun res!87972 () Bool)

(assert (=> b!185942 (=> (not res!87972) (not e!122372))))

(get-info :version)

(assert (=> b!185942 (= res!87972 (and (not ((_ is Undefined!640) lt!91911)) (not ((_ is MissingVacant!640) lt!91911)) (not ((_ is MissingZero!640) lt!91911)) ((_ is Found!640) lt!91911)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7927 (_ BitVec 32)) SeekEntryResult!640)

(assert (=> b!185942 (= lt!91911 (seekEntryOrOpen!0 key!828 (_keys!5733 thiss!1248) (mask!8909 thiss!1248)))))

(declare-fun b!185943 () Bool)

(declare-fun tp_is_empty!4359 () Bool)

(assert (=> b!185943 (= e!122369 tp_is_empty!4359)))

(declare-fun b!185944 () Bool)

(assert (=> b!185944 (= e!122373 tp_is_empty!4359)))

(declare-fun array_inv!2419 (array!7927) Bool)

(declare-fun array_inv!2420 (array!7929) Bool)

(assert (=> b!185945 (= e!122370 (and tp!16559 tp_is_empty!4359 (array_inv!2419 (_keys!5733 thiss!1248)) (array_inv!2420 (_values!3775 thiss!1248)) e!122366))))

(declare-fun b!185946 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185946 (= e!122372 (not (validMask!0 (mask!8909 thiss!1248))))))

(declare-fun lt!91910 () Unit!5602)

(assert (=> b!185946 (= lt!91910 e!122367)))

(declare-fun c!33328 () Bool)

(declare-datatypes ((tuple2!3464 0))(
  ( (tuple2!3465 (_1!1743 (_ BitVec 64)) (_2!1743 V!5459)) )
))
(declare-datatypes ((List!2371 0))(
  ( (Nil!2368) (Cons!2367 (h!3000 tuple2!3464) (t!7255 List!2371)) )
))
(declare-datatypes ((ListLongMap!2381 0))(
  ( (ListLongMap!2382 (toList!1206 List!2371)) )
))
(declare-fun contains!1302 (ListLongMap!2381 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!854 (array!7927 array!7929 (_ BitVec 32) (_ BitVec 32) V!5459 V!5459 (_ BitVec 32) Int) ListLongMap!2381)

(assert (=> b!185946 (= c!33328 (contains!1302 (getCurrentListMap!854 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3792 thiss!1248)) key!828))))

(assert (= (and start!18812 res!87971) b!185939))

(assert (= (and b!185939 res!87973) b!185942))

(assert (= (and b!185942 res!87972) b!185946))

(assert (= (and b!185946 c!33328) b!185941))

(assert (= (and b!185946 (not c!33328)) b!185937))

(assert (= (and b!185941 res!87974) b!185938))

(assert (= (and b!185940 condMapEmpty!7500) mapIsEmpty!7500))

(assert (= (and b!185940 (not condMapEmpty!7500)) mapNonEmpty!7500))

(assert (= (and mapNonEmpty!7500 ((_ is ValueCellFull!1836) mapValue!7500)) b!185944))

(assert (= (and b!185940 ((_ is ValueCellFull!1836) mapDefault!7500)) b!185943))

(assert (= b!185945 b!185940))

(assert (= start!18812 b!185945))

(declare-fun m!212997 () Bool)

(assert (=> b!185937 m!212997))

(declare-fun m!212999 () Bool)

(assert (=> mapNonEmpty!7500 m!212999))

(declare-fun m!213001 () Bool)

(assert (=> b!185941 m!213001))

(declare-fun m!213003 () Bool)

(assert (=> b!185941 m!213003))

(declare-fun m!213005 () Bool)

(assert (=> start!18812 m!213005))

(declare-fun m!213007 () Bool)

(assert (=> b!185945 m!213007))

(declare-fun m!213009 () Bool)

(assert (=> b!185945 m!213009))

(declare-fun m!213011 () Bool)

(assert (=> b!185946 m!213011))

(declare-fun m!213013 () Bool)

(assert (=> b!185946 m!213013))

(assert (=> b!185946 m!213013))

(declare-fun m!213015 () Bool)

(assert (=> b!185946 m!213015))

(declare-fun m!213017 () Bool)

(assert (=> b!185942 m!213017))

(declare-fun m!213019 () Bool)

(assert (=> b!185938 m!213019))

(check-sat (not b!185946) (not mapNonEmpty!7500) b_and!11189 (not b_next!4587) (not b!185937) (not b!185942) (not b!185945) (not b!185941) tp_is_empty!4359 (not start!18812))
(check-sat b_and!11189 (not b_next!4587))
(get-model)

(declare-fun b!185990 () Bool)

(declare-fun e!122409 () SeekEntryResult!640)

(declare-fun lt!91932 () SeekEntryResult!640)

(assert (=> b!185990 (= e!122409 (Found!640 (index!4732 lt!91932)))))

(declare-fun b!185991 () Bool)

(declare-fun e!122408 () SeekEntryResult!640)

(assert (=> b!185991 (= e!122408 (MissingZero!640 (index!4732 lt!91932)))))

(declare-fun b!185992 () Bool)

(declare-fun c!33338 () Bool)

(declare-fun lt!91931 () (_ BitVec 64))

(assert (=> b!185992 (= c!33338 (= lt!91931 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!185992 (= e!122409 e!122408)))

(declare-fun b!185993 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7927 (_ BitVec 32)) SeekEntryResult!640)

(assert (=> b!185993 (= e!122408 (seekKeyOrZeroReturnVacant!0 (x!20186 lt!91932) (index!4732 lt!91932) (index!4732 lt!91932) key!828 (_keys!5733 thiss!1248) (mask!8909 thiss!1248)))))

(declare-fun b!185994 () Bool)

(declare-fun e!122410 () SeekEntryResult!640)

(assert (=> b!185994 (= e!122410 e!122409)))

(assert (=> b!185994 (= lt!91931 (select (arr!3743 (_keys!5733 thiss!1248)) (index!4732 lt!91932)))))

(declare-fun c!33339 () Bool)

(assert (=> b!185994 (= c!33339 (= lt!91931 key!828))))

(declare-fun d!55143 () Bool)

(declare-fun lt!91930 () SeekEntryResult!640)

(assert (=> d!55143 (and (or ((_ is Undefined!640) lt!91930) (not ((_ is Found!640) lt!91930)) (and (bvsge (index!4731 lt!91930) #b00000000000000000000000000000000) (bvslt (index!4731 lt!91930) (size!4059 (_keys!5733 thiss!1248))))) (or ((_ is Undefined!640) lt!91930) ((_ is Found!640) lt!91930) (not ((_ is MissingZero!640) lt!91930)) (and (bvsge (index!4730 lt!91930) #b00000000000000000000000000000000) (bvslt (index!4730 lt!91930) (size!4059 (_keys!5733 thiss!1248))))) (or ((_ is Undefined!640) lt!91930) ((_ is Found!640) lt!91930) ((_ is MissingZero!640) lt!91930) (not ((_ is MissingVacant!640) lt!91930)) (and (bvsge (index!4733 lt!91930) #b00000000000000000000000000000000) (bvslt (index!4733 lt!91930) (size!4059 (_keys!5733 thiss!1248))))) (or ((_ is Undefined!640) lt!91930) (ite ((_ is Found!640) lt!91930) (= (select (arr!3743 (_keys!5733 thiss!1248)) (index!4731 lt!91930)) key!828) (ite ((_ is MissingZero!640) lt!91930) (= (select (arr!3743 (_keys!5733 thiss!1248)) (index!4730 lt!91930)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!640) lt!91930) (= (select (arr!3743 (_keys!5733 thiss!1248)) (index!4733 lt!91930)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55143 (= lt!91930 e!122410)))

(declare-fun c!33340 () Bool)

(assert (=> d!55143 (= c!33340 (and ((_ is Intermediate!640) lt!91932) (undefined!1452 lt!91932)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7927 (_ BitVec 32)) SeekEntryResult!640)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55143 (= lt!91932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8909 thiss!1248)) key!828 (_keys!5733 thiss!1248) (mask!8909 thiss!1248)))))

(assert (=> d!55143 (validMask!0 (mask!8909 thiss!1248))))

(assert (=> d!55143 (= (seekEntryOrOpen!0 key!828 (_keys!5733 thiss!1248) (mask!8909 thiss!1248)) lt!91930)))

(declare-fun b!185989 () Bool)

(assert (=> b!185989 (= e!122410 Undefined!640)))

(assert (= (and d!55143 c!33340) b!185989))

(assert (= (and d!55143 (not c!33340)) b!185994))

(assert (= (and b!185994 c!33339) b!185990))

(assert (= (and b!185994 (not c!33339)) b!185992))

(assert (= (and b!185992 c!33338) b!185991))

(assert (= (and b!185992 (not c!33338)) b!185993))

(declare-fun m!213045 () Bool)

(assert (=> b!185993 m!213045))

(declare-fun m!213047 () Bool)

(assert (=> b!185994 m!213047))

(assert (=> d!55143 m!213011))

(declare-fun m!213049 () Bool)

(assert (=> d!55143 m!213049))

(declare-fun m!213051 () Bool)

(assert (=> d!55143 m!213051))

(declare-fun m!213053 () Bool)

(assert (=> d!55143 m!213053))

(declare-fun m!213055 () Bool)

(assert (=> d!55143 m!213055))

(assert (=> d!55143 m!213049))

(declare-fun m!213057 () Bool)

(assert (=> d!55143 m!213057))

(assert (=> b!185942 d!55143))

(declare-fun d!55145 () Bool)

(declare-fun res!87993 () Bool)

(declare-fun e!122413 () Bool)

(assert (=> d!55145 (=> (not res!87993) (not e!122413))))

(declare-fun simpleValid!183 (LongMapFixedSize!2580) Bool)

(assert (=> d!55145 (= res!87993 (simpleValid!183 thiss!1248))))

(assert (=> d!55145 (= (valid!1063 thiss!1248) e!122413)))

(declare-fun b!186001 () Bool)

(declare-fun res!87994 () Bool)

(assert (=> b!186001 (=> (not res!87994) (not e!122413))))

(declare-fun arrayCountValidKeys!0 (array!7927 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!186001 (= res!87994 (= (arrayCountValidKeys!0 (_keys!5733 thiss!1248) #b00000000000000000000000000000000 (size!4059 (_keys!5733 thiss!1248))) (_size!1339 thiss!1248)))))

(declare-fun b!186002 () Bool)

(declare-fun res!87995 () Bool)

(assert (=> b!186002 (=> (not res!87995) (not e!122413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7927 (_ BitVec 32)) Bool)

(assert (=> b!186002 (= res!87995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5733 thiss!1248) (mask!8909 thiss!1248)))))

(declare-fun b!186003 () Bool)

(declare-datatypes ((List!2373 0))(
  ( (Nil!2370) (Cons!2369 (h!3002 (_ BitVec 64)) (t!7259 List!2373)) )
))
(declare-fun arrayNoDuplicates!0 (array!7927 (_ BitVec 32) List!2373) Bool)

(assert (=> b!186003 (= e!122413 (arrayNoDuplicates!0 (_keys!5733 thiss!1248) #b00000000000000000000000000000000 Nil!2370))))

(assert (= (and d!55145 res!87993) b!186001))

(assert (= (and b!186001 res!87994) b!186002))

(assert (= (and b!186002 res!87995) b!186003))

(declare-fun m!213059 () Bool)

(assert (=> d!55145 m!213059))

(declare-fun m!213061 () Bool)

(assert (=> b!186001 m!213061))

(declare-fun m!213063 () Bool)

(assert (=> b!186002 m!213063))

(declare-fun m!213065 () Bool)

(assert (=> b!186003 m!213065))

(assert (=> start!18812 d!55145))

(declare-fun d!55147 () Bool)

(declare-fun e!122416 () Bool)

(assert (=> d!55147 e!122416))

(declare-fun res!88001 () Bool)

(assert (=> d!55147 (=> (not res!88001) (not e!122416))))

(declare-fun lt!91938 () SeekEntryResult!640)

(assert (=> d!55147 (= res!88001 ((_ is Found!640) lt!91938))))

(assert (=> d!55147 (= lt!91938 (seekEntryOrOpen!0 key!828 (_keys!5733 thiss!1248) (mask!8909 thiss!1248)))))

(declare-fun lt!91937 () Unit!5602)

(declare-fun choose!982 (array!7927 array!7929 (_ BitVec 32) (_ BitVec 32) V!5459 V!5459 (_ BitVec 64) Int) Unit!5602)

(assert (=> d!55147 (= lt!91937 (choose!982 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) key!828 (defaultEntry!3792 thiss!1248)))))

(assert (=> d!55147 (validMask!0 (mask!8909 thiss!1248))))

(assert (=> d!55147 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!143 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) key!828 (defaultEntry!3792 thiss!1248)) lt!91937)))

(declare-fun b!186008 () Bool)

(declare-fun res!88000 () Bool)

(assert (=> b!186008 (=> (not res!88000) (not e!122416))))

(assert (=> b!186008 (= res!88000 (inRange!0 (index!4731 lt!91938) (mask!8909 thiss!1248)))))

(declare-fun b!186009 () Bool)

(assert (=> b!186009 (= e!122416 (= (select (arr!3743 (_keys!5733 thiss!1248)) (index!4731 lt!91938)) key!828))))

(assert (=> b!186009 (and (bvsge (index!4731 lt!91938) #b00000000000000000000000000000000) (bvslt (index!4731 lt!91938) (size!4059 (_keys!5733 thiss!1248))))))

(assert (= (and d!55147 res!88001) b!186008))

(assert (= (and b!186008 res!88000) b!186009))

(assert (=> d!55147 m!213017))

(declare-fun m!213067 () Bool)

(assert (=> d!55147 m!213067))

(assert (=> d!55147 m!213011))

(declare-fun m!213069 () Bool)

(assert (=> b!186008 m!213069))

(declare-fun m!213071 () Bool)

(assert (=> b!186009 m!213071))

(assert (=> b!185941 d!55147))

(declare-fun d!55149 () Bool)

(assert (=> d!55149 (= (inRange!0 (index!4731 lt!91911) (mask!8909 thiss!1248)) (and (bvsge (index!4731 lt!91911) #b00000000000000000000000000000000) (bvslt (index!4731 lt!91911) (bvadd (mask!8909 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!185941 d!55149))

(declare-fun d!55151 () Bool)

(assert (=> d!55151 (= (array_inv!2419 (_keys!5733 thiss!1248)) (bvsge (size!4059 (_keys!5733 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185945 d!55151))

(declare-fun d!55153 () Bool)

(assert (=> d!55153 (= (array_inv!2420 (_values!3775 thiss!1248)) (bvsge (size!4060 (_values!3775 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185945 d!55153))

(declare-fun d!55155 () Bool)

(assert (=> d!55155 (= (validMask!0 (mask!8909 thiss!1248)) (and (or (= (mask!8909 thiss!1248) #b00000000000000000000000000000111) (= (mask!8909 thiss!1248) #b00000000000000000000000000001111) (= (mask!8909 thiss!1248) #b00000000000000000000000000011111) (= (mask!8909 thiss!1248) #b00000000000000000000000000111111) (= (mask!8909 thiss!1248) #b00000000000000000000000001111111) (= (mask!8909 thiss!1248) #b00000000000000000000000011111111) (= (mask!8909 thiss!1248) #b00000000000000000000000111111111) (= (mask!8909 thiss!1248) #b00000000000000000000001111111111) (= (mask!8909 thiss!1248) #b00000000000000000000011111111111) (= (mask!8909 thiss!1248) #b00000000000000000000111111111111) (= (mask!8909 thiss!1248) #b00000000000000000001111111111111) (= (mask!8909 thiss!1248) #b00000000000000000011111111111111) (= (mask!8909 thiss!1248) #b00000000000000000111111111111111) (= (mask!8909 thiss!1248) #b00000000000000001111111111111111) (= (mask!8909 thiss!1248) #b00000000000000011111111111111111) (= (mask!8909 thiss!1248) #b00000000000000111111111111111111) (= (mask!8909 thiss!1248) #b00000000000001111111111111111111) (= (mask!8909 thiss!1248) #b00000000000011111111111111111111) (= (mask!8909 thiss!1248) #b00000000000111111111111111111111) (= (mask!8909 thiss!1248) #b00000000001111111111111111111111) (= (mask!8909 thiss!1248) #b00000000011111111111111111111111) (= (mask!8909 thiss!1248) #b00000000111111111111111111111111) (= (mask!8909 thiss!1248) #b00000001111111111111111111111111) (= (mask!8909 thiss!1248) #b00000011111111111111111111111111) (= (mask!8909 thiss!1248) #b00000111111111111111111111111111) (= (mask!8909 thiss!1248) #b00001111111111111111111111111111) (= (mask!8909 thiss!1248) #b00011111111111111111111111111111) (= (mask!8909 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8909 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!185946 d!55155))

(declare-fun d!55157 () Bool)

(declare-fun e!122421 () Bool)

(assert (=> d!55157 e!122421))

(declare-fun res!88004 () Bool)

(assert (=> d!55157 (=> res!88004 e!122421)))

(declare-fun lt!91950 () Bool)

(assert (=> d!55157 (= res!88004 (not lt!91950))))

(declare-fun lt!91948 () Bool)

(assert (=> d!55157 (= lt!91950 lt!91948)))

(declare-fun lt!91947 () Unit!5602)

(declare-fun e!122422 () Unit!5602)

(assert (=> d!55157 (= lt!91947 e!122422)))

(declare-fun c!33343 () Bool)

(assert (=> d!55157 (= c!33343 lt!91948)))

(declare-fun containsKey!228 (List!2371 (_ BitVec 64)) Bool)

(assert (=> d!55157 (= lt!91948 (containsKey!228 (toList!1206 (getCurrentListMap!854 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3792 thiss!1248))) key!828))))

(assert (=> d!55157 (= (contains!1302 (getCurrentListMap!854 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3792 thiss!1248)) key!828) lt!91950)))

(declare-fun b!186016 () Bool)

(declare-fun lt!91949 () Unit!5602)

(assert (=> b!186016 (= e!122422 lt!91949)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!176 (List!2371 (_ BitVec 64)) Unit!5602)

(assert (=> b!186016 (= lt!91949 (lemmaContainsKeyImpliesGetValueByKeyDefined!176 (toList!1206 (getCurrentListMap!854 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3792 thiss!1248))) key!828))))

(declare-datatypes ((Option!230 0))(
  ( (Some!229 (v!4137 V!5459)) (None!228) )
))
(declare-fun isDefined!177 (Option!230) Bool)

(declare-fun getValueByKey!224 (List!2371 (_ BitVec 64)) Option!230)

(assert (=> b!186016 (isDefined!177 (getValueByKey!224 (toList!1206 (getCurrentListMap!854 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3792 thiss!1248))) key!828))))

(declare-fun b!186017 () Bool)

(declare-fun Unit!5608 () Unit!5602)

(assert (=> b!186017 (= e!122422 Unit!5608)))

(declare-fun b!186018 () Bool)

(assert (=> b!186018 (= e!122421 (isDefined!177 (getValueByKey!224 (toList!1206 (getCurrentListMap!854 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3792 thiss!1248))) key!828)))))

(assert (= (and d!55157 c!33343) b!186016))

(assert (= (and d!55157 (not c!33343)) b!186017))

(assert (= (and d!55157 (not res!88004)) b!186018))

(declare-fun m!213073 () Bool)

(assert (=> d!55157 m!213073))

(declare-fun m!213075 () Bool)

(assert (=> b!186016 m!213075))

(declare-fun m!213077 () Bool)

(assert (=> b!186016 m!213077))

(assert (=> b!186016 m!213077))

(declare-fun m!213079 () Bool)

(assert (=> b!186016 m!213079))

(assert (=> b!186018 m!213077))

(assert (=> b!186018 m!213077))

(assert (=> b!186018 m!213079))

(assert (=> b!185946 d!55157))

(declare-fun b!186061 () Bool)

(declare-fun e!122455 () Bool)

(declare-fun e!122457 () Bool)

(assert (=> b!186061 (= e!122455 e!122457)))

(declare-fun res!88026 () Bool)

(declare-fun call!18754 () Bool)

(assert (=> b!186061 (= res!88026 call!18754)))

(assert (=> b!186061 (=> (not res!88026) (not e!122457))))

(declare-fun b!186062 () Bool)

(declare-fun res!88023 () Bool)

(declare-fun e!122459 () Bool)

(assert (=> b!186062 (=> (not res!88023) (not e!122459))))

(declare-fun e!122456 () Bool)

(assert (=> b!186062 (= res!88023 e!122456)))

(declare-fun c!33356 () Bool)

(assert (=> b!186062 (= c!33356 (not (= (bvand (extraKeys!3529 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!186063 () Bool)

(declare-fun lt!91998 () ListLongMap!2381)

(declare-fun apply!167 (ListLongMap!2381 (_ BitVec 64)) V!5459)

(assert (=> b!186063 (= e!122457 (= (apply!167 lt!91998 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3633 thiss!1248)))))

(declare-fun b!186064 () Bool)

(assert (=> b!186064 (= e!122455 (not call!18754))))

(declare-fun bm!18751 () Bool)

(declare-fun call!18760 () ListLongMap!2381)

(declare-fun getCurrentListMapNoExtraKeys!200 (array!7927 array!7929 (_ BitVec 32) (_ BitVec 32) V!5459 V!5459 (_ BitVec 32) Int) ListLongMap!2381)

(assert (=> bm!18751 (= call!18760 (getCurrentListMapNoExtraKeys!200 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3792 thiss!1248)))))

(declare-fun b!186065 () Bool)

(declare-fun res!88025 () Bool)

(assert (=> b!186065 (=> (not res!88025) (not e!122459))))

(declare-fun e!122453 () Bool)

(assert (=> b!186065 (= res!88025 e!122453)))

(declare-fun res!88027 () Bool)

(assert (=> b!186065 (=> res!88027 e!122453)))

(declare-fun e!122454 () Bool)

(assert (=> b!186065 (= res!88027 (not e!122454))))

(declare-fun res!88029 () Bool)

(assert (=> b!186065 (=> (not res!88029) (not e!122454))))

(assert (=> b!186065 (= res!88029 (bvslt #b00000000000000000000000000000000 (size!4059 (_keys!5733 thiss!1248))))))

(declare-fun b!186066 () Bool)

(declare-fun c!33360 () Bool)

(assert (=> b!186066 (= c!33360 (and (not (= (bvand (extraKeys!3529 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3529 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!122452 () ListLongMap!2381)

(declare-fun e!122460 () ListLongMap!2381)

(assert (=> b!186066 (= e!122452 e!122460)))

(declare-fun d!55159 () Bool)

(assert (=> d!55159 e!122459))

(declare-fun res!88031 () Bool)

(assert (=> d!55159 (=> (not res!88031) (not e!122459))))

(assert (=> d!55159 (= res!88031 (or (bvsge #b00000000000000000000000000000000 (size!4059 (_keys!5733 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4059 (_keys!5733 thiss!1248))))))))

(declare-fun lt!92014 () ListLongMap!2381)

(assert (=> d!55159 (= lt!91998 lt!92014)))

(declare-fun lt!92009 () Unit!5602)

(declare-fun e!122449 () Unit!5602)

(assert (=> d!55159 (= lt!92009 e!122449)))

(declare-fun c!33358 () Bool)

(declare-fun e!122451 () Bool)

(assert (=> d!55159 (= c!33358 e!122451)))

(declare-fun res!88028 () Bool)

(assert (=> d!55159 (=> (not res!88028) (not e!122451))))

(assert (=> d!55159 (= res!88028 (bvslt #b00000000000000000000000000000000 (size!4059 (_keys!5733 thiss!1248))))))

(declare-fun e!122461 () ListLongMap!2381)

(assert (=> d!55159 (= lt!92014 e!122461)))

(declare-fun c!33361 () Bool)

(assert (=> d!55159 (= c!33361 (and (not (= (bvand (extraKeys!3529 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3529 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55159 (validMask!0 (mask!8909 thiss!1248))))

(assert (=> d!55159 (= (getCurrentListMap!854 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3792 thiss!1248)) lt!91998)))

(declare-fun b!186067 () Bool)

(declare-fun e!122450 () Bool)

(declare-fun get!2148 (ValueCell!1836 V!5459) V!5459)

(declare-fun dynLambda!510 (Int (_ BitVec 64)) V!5459)

(assert (=> b!186067 (= e!122450 (= (apply!167 lt!91998 (select (arr!3743 (_keys!5733 thiss!1248)) #b00000000000000000000000000000000)) (get!2148 (select (arr!3744 (_values!3775 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!510 (defaultEntry!3792 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!186067 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4060 (_values!3775 thiss!1248))))))

(assert (=> b!186067 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4059 (_keys!5733 thiss!1248))))))

(declare-fun b!186068 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!186068 (= e!122451 (validKeyInArray!0 (select (arr!3743 (_keys!5733 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18752 () Bool)

(declare-fun call!18756 () Bool)

(assert (=> bm!18752 (= call!18756 (contains!1302 lt!91998 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186069 () Bool)

(declare-fun Unit!5609 () Unit!5602)

(assert (=> b!186069 (= e!122449 Unit!5609)))

(declare-fun b!186070 () Bool)

(assert (=> b!186070 (= e!122461 e!122452)))

(declare-fun c!33357 () Bool)

(assert (=> b!186070 (= c!33357 (and (not (= (bvand (extraKeys!3529 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3529 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!186071 () Bool)

(declare-fun call!18757 () ListLongMap!2381)

(declare-fun +!287 (ListLongMap!2381 tuple2!3464) ListLongMap!2381)

(assert (=> b!186071 (= e!122461 (+!287 call!18757 (tuple2!3465 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3633 thiss!1248))))))

(declare-fun bm!18753 () Bool)

(assert (=> bm!18753 (= call!18754 (contains!1302 lt!91998 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186072 () Bool)

(declare-fun e!122458 () Bool)

(assert (=> b!186072 (= e!122458 (= (apply!167 lt!91998 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3633 thiss!1248)))))

(declare-fun b!186073 () Bool)

(assert (=> b!186073 (= e!122454 (validKeyInArray!0 (select (arr!3743 (_keys!5733 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186074 () Bool)

(declare-fun call!18755 () ListLongMap!2381)

(assert (=> b!186074 (= e!122452 call!18755)))

(declare-fun bm!18754 () Bool)

(assert (=> bm!18754 (= call!18755 call!18757)))

(declare-fun b!186075 () Bool)

(assert (=> b!186075 (= e!122460 call!18755)))

(declare-fun b!186076 () Bool)

(assert (=> b!186076 (= e!122456 (not call!18756))))

(declare-fun b!186077 () Bool)

(declare-fun call!18758 () ListLongMap!2381)

(assert (=> b!186077 (= e!122460 call!18758)))

(declare-fun b!186078 () Bool)

(assert (=> b!186078 (= e!122456 e!122458)))

(declare-fun res!88030 () Bool)

(assert (=> b!186078 (= res!88030 call!18756)))

(assert (=> b!186078 (=> (not res!88030) (not e!122458))))

(declare-fun call!18759 () ListLongMap!2381)

(declare-fun bm!18755 () Bool)

(assert (=> bm!18755 (= call!18757 (+!287 (ite c!33361 call!18760 (ite c!33357 call!18759 call!18758)) (ite (or c!33361 c!33357) (tuple2!3465 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3633 thiss!1248)) (tuple2!3465 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3633 thiss!1248)))))))

(declare-fun b!186079 () Bool)

(declare-fun lt!92016 () Unit!5602)

(assert (=> b!186079 (= e!122449 lt!92016)))

(declare-fun lt!92013 () ListLongMap!2381)

(assert (=> b!186079 (= lt!92013 (getCurrentListMapNoExtraKeys!200 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3792 thiss!1248)))))

(declare-fun lt!91997 () (_ BitVec 64))

(assert (=> b!186079 (= lt!91997 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91996 () (_ BitVec 64))

(assert (=> b!186079 (= lt!91996 (select (arr!3743 (_keys!5733 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92010 () Unit!5602)

(declare-fun addStillContains!143 (ListLongMap!2381 (_ BitVec 64) V!5459 (_ BitVec 64)) Unit!5602)

(assert (=> b!186079 (= lt!92010 (addStillContains!143 lt!92013 lt!91997 (zeroValue!3633 thiss!1248) lt!91996))))

(assert (=> b!186079 (contains!1302 (+!287 lt!92013 (tuple2!3465 lt!91997 (zeroValue!3633 thiss!1248))) lt!91996)))

(declare-fun lt!91995 () Unit!5602)

(assert (=> b!186079 (= lt!91995 lt!92010)))

(declare-fun lt!92001 () ListLongMap!2381)

(assert (=> b!186079 (= lt!92001 (getCurrentListMapNoExtraKeys!200 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3792 thiss!1248)))))

(declare-fun lt!92000 () (_ BitVec 64))

(assert (=> b!186079 (= lt!92000 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92011 () (_ BitVec 64))

(assert (=> b!186079 (= lt!92011 (select (arr!3743 (_keys!5733 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92004 () Unit!5602)

(declare-fun addApplyDifferent!143 (ListLongMap!2381 (_ BitVec 64) V!5459 (_ BitVec 64)) Unit!5602)

(assert (=> b!186079 (= lt!92004 (addApplyDifferent!143 lt!92001 lt!92000 (minValue!3633 thiss!1248) lt!92011))))

(assert (=> b!186079 (= (apply!167 (+!287 lt!92001 (tuple2!3465 lt!92000 (minValue!3633 thiss!1248))) lt!92011) (apply!167 lt!92001 lt!92011))))

(declare-fun lt!92012 () Unit!5602)

(assert (=> b!186079 (= lt!92012 lt!92004)))

(declare-fun lt!92007 () ListLongMap!2381)

(assert (=> b!186079 (= lt!92007 (getCurrentListMapNoExtraKeys!200 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3792 thiss!1248)))))

(declare-fun lt!92015 () (_ BitVec 64))

(assert (=> b!186079 (= lt!92015 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92005 () (_ BitVec 64))

(assert (=> b!186079 (= lt!92005 (select (arr!3743 (_keys!5733 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91999 () Unit!5602)

(assert (=> b!186079 (= lt!91999 (addApplyDifferent!143 lt!92007 lt!92015 (zeroValue!3633 thiss!1248) lt!92005))))

(assert (=> b!186079 (= (apply!167 (+!287 lt!92007 (tuple2!3465 lt!92015 (zeroValue!3633 thiss!1248))) lt!92005) (apply!167 lt!92007 lt!92005))))

(declare-fun lt!92006 () Unit!5602)

(assert (=> b!186079 (= lt!92006 lt!91999)))

(declare-fun lt!92008 () ListLongMap!2381)

(assert (=> b!186079 (= lt!92008 (getCurrentListMapNoExtraKeys!200 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3792 thiss!1248)))))

(declare-fun lt!92003 () (_ BitVec 64))

(assert (=> b!186079 (= lt!92003 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92002 () (_ BitVec 64))

(assert (=> b!186079 (= lt!92002 (select (arr!3743 (_keys!5733 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186079 (= lt!92016 (addApplyDifferent!143 lt!92008 lt!92003 (minValue!3633 thiss!1248) lt!92002))))

(assert (=> b!186079 (= (apply!167 (+!287 lt!92008 (tuple2!3465 lt!92003 (minValue!3633 thiss!1248))) lt!92002) (apply!167 lt!92008 lt!92002))))

(declare-fun bm!18756 () Bool)

(assert (=> bm!18756 (= call!18759 call!18760)))

(declare-fun b!186080 () Bool)

(assert (=> b!186080 (= e!122459 e!122455)))

(declare-fun c!33359 () Bool)

(assert (=> b!186080 (= c!33359 (not (= (bvand (extraKeys!3529 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18757 () Bool)

(assert (=> bm!18757 (= call!18758 call!18759)))

(declare-fun b!186081 () Bool)

(assert (=> b!186081 (= e!122453 e!122450)))

(declare-fun res!88024 () Bool)

(assert (=> b!186081 (=> (not res!88024) (not e!122450))))

(assert (=> b!186081 (= res!88024 (contains!1302 lt!91998 (select (arr!3743 (_keys!5733 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186081 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4059 (_keys!5733 thiss!1248))))))

(assert (= (and d!55159 c!33361) b!186071))

(assert (= (and d!55159 (not c!33361)) b!186070))

(assert (= (and b!186070 c!33357) b!186074))

(assert (= (and b!186070 (not c!33357)) b!186066))

(assert (= (and b!186066 c!33360) b!186075))

(assert (= (and b!186066 (not c!33360)) b!186077))

(assert (= (or b!186075 b!186077) bm!18757))

(assert (= (or b!186074 bm!18757) bm!18756))

(assert (= (or b!186074 b!186075) bm!18754))

(assert (= (or b!186071 bm!18756) bm!18751))

(assert (= (or b!186071 bm!18754) bm!18755))

(assert (= (and d!55159 res!88028) b!186068))

(assert (= (and d!55159 c!33358) b!186079))

(assert (= (and d!55159 (not c!33358)) b!186069))

(assert (= (and d!55159 res!88031) b!186065))

(assert (= (and b!186065 res!88029) b!186073))

(assert (= (and b!186065 (not res!88027)) b!186081))

(assert (= (and b!186081 res!88024) b!186067))

(assert (= (and b!186065 res!88025) b!186062))

(assert (= (and b!186062 c!33356) b!186078))

(assert (= (and b!186062 (not c!33356)) b!186076))

(assert (= (and b!186078 res!88030) b!186072))

(assert (= (or b!186078 b!186076) bm!18752))

(assert (= (and b!186062 res!88023) b!186080))

(assert (= (and b!186080 c!33359) b!186061))

(assert (= (and b!186080 (not c!33359)) b!186064))

(assert (= (and b!186061 res!88026) b!186063))

(assert (= (or b!186061 b!186064) bm!18753))

(declare-fun b_lambda!7255 () Bool)

(assert (=> (not b_lambda!7255) (not b!186067)))

(declare-fun t!7258 () Bool)

(declare-fun tb!2845 () Bool)

(assert (=> (and b!185945 (= (defaultEntry!3792 thiss!1248) (defaultEntry!3792 thiss!1248)) t!7258) tb!2845))

(declare-fun result!4813 () Bool)

(assert (=> tb!2845 (= result!4813 tp_is_empty!4359)))

(assert (=> b!186067 t!7258))

(declare-fun b_and!11193 () Bool)

(assert (= b_and!11189 (and (=> t!7258 result!4813) b_and!11193)))

(declare-fun m!213081 () Bool)

(assert (=> b!186072 m!213081))

(declare-fun m!213083 () Bool)

(assert (=> bm!18755 m!213083))

(declare-fun m!213085 () Bool)

(assert (=> b!186073 m!213085))

(assert (=> b!186073 m!213085))

(declare-fun m!213087 () Bool)

(assert (=> b!186073 m!213087))

(assert (=> d!55159 m!213011))

(assert (=> b!186068 m!213085))

(assert (=> b!186068 m!213085))

(assert (=> b!186068 m!213087))

(declare-fun m!213089 () Bool)

(assert (=> bm!18751 m!213089))

(assert (=> b!186067 m!213085))

(assert (=> b!186067 m!213085))

(declare-fun m!213091 () Bool)

(assert (=> b!186067 m!213091))

(declare-fun m!213093 () Bool)

(assert (=> b!186067 m!213093))

(assert (=> b!186067 m!213093))

(declare-fun m!213095 () Bool)

(assert (=> b!186067 m!213095))

(declare-fun m!213097 () Bool)

(assert (=> b!186067 m!213097))

(assert (=> b!186067 m!213095))

(assert (=> b!186081 m!213085))

(assert (=> b!186081 m!213085))

(declare-fun m!213099 () Bool)

(assert (=> b!186081 m!213099))

(declare-fun m!213101 () Bool)

(assert (=> bm!18753 m!213101))

(declare-fun m!213103 () Bool)

(assert (=> b!186063 m!213103))

(declare-fun m!213105 () Bool)

(assert (=> bm!18752 m!213105))

(declare-fun m!213107 () Bool)

(assert (=> b!186071 m!213107))

(declare-fun m!213109 () Bool)

(assert (=> b!186079 m!213109))

(declare-fun m!213111 () Bool)

(assert (=> b!186079 m!213111))

(declare-fun m!213113 () Bool)

(assert (=> b!186079 m!213113))

(declare-fun m!213115 () Bool)

(assert (=> b!186079 m!213115))

(declare-fun m!213117 () Bool)

(assert (=> b!186079 m!213117))

(assert (=> b!186079 m!213109))

(declare-fun m!213119 () Bool)

(assert (=> b!186079 m!213119))

(declare-fun m!213121 () Bool)

(assert (=> b!186079 m!213121))

(assert (=> b!186079 m!213119))

(declare-fun m!213123 () Bool)

(assert (=> b!186079 m!213123))

(assert (=> b!186079 m!213123))

(declare-fun m!213125 () Bool)

(assert (=> b!186079 m!213125))

(declare-fun m!213127 () Bool)

(assert (=> b!186079 m!213127))

(declare-fun m!213129 () Bool)

(assert (=> b!186079 m!213129))

(assert (=> b!186079 m!213089))

(assert (=> b!186079 m!213085))

(declare-fun m!213131 () Bool)

(assert (=> b!186079 m!213131))

(declare-fun m!213133 () Bool)

(assert (=> b!186079 m!213133))

(assert (=> b!186079 m!213113))

(declare-fun m!213135 () Bool)

(assert (=> b!186079 m!213135))

(declare-fun m!213137 () Bool)

(assert (=> b!186079 m!213137))

(assert (=> b!185946 d!55159))

(declare-fun b!186100 () Bool)

(declare-fun e!122471 () Bool)

(declare-fun call!18765 () Bool)

(assert (=> b!186100 (= e!122471 (not call!18765))))

(declare-fun b!186101 () Bool)

(declare-fun res!88041 () Bool)

(declare-fun e!122472 () Bool)

(assert (=> b!186101 (=> (not res!88041) (not e!122472))))

(declare-fun lt!92021 () SeekEntryResult!640)

(assert (=> b!186101 (= res!88041 (= (select (arr!3743 (_keys!5733 thiss!1248)) (index!4733 lt!92021)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186101 (and (bvsge (index!4733 lt!92021) #b00000000000000000000000000000000) (bvslt (index!4733 lt!92021) (size!4059 (_keys!5733 thiss!1248))))))

(declare-fun b!186102 () Bool)

(declare-fun e!122473 () Bool)

(assert (=> b!186102 (= e!122473 e!122471)))

(declare-fun res!88042 () Bool)

(declare-fun call!18766 () Bool)

(assert (=> b!186102 (= res!88042 call!18766)))

(assert (=> b!186102 (=> (not res!88042) (not e!122471))))

(declare-fun b!186103 () Bool)

(declare-fun e!122470 () Bool)

(assert (=> b!186103 (= e!122473 e!122470)))

(declare-fun c!33366 () Bool)

(assert (=> b!186103 (= c!33366 ((_ is MissingVacant!640) lt!92021))))

(declare-fun bm!18762 () Bool)

(declare-fun arrayContainsKey!0 (array!7927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18762 (= call!18765 (arrayContainsKey!0 (_keys!5733 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!186104 () Bool)

(declare-fun res!88040 () Bool)

(assert (=> b!186104 (=> (not res!88040) (not e!122472))))

(assert (=> b!186104 (= res!88040 call!18766)))

(assert (=> b!186104 (= e!122470 e!122472)))

(declare-fun b!186105 () Bool)

(assert (=> b!186105 (and (bvsge (index!4730 lt!92021) #b00000000000000000000000000000000) (bvslt (index!4730 lt!92021) (size!4059 (_keys!5733 thiss!1248))))))

(declare-fun res!88043 () Bool)

(assert (=> b!186105 (= res!88043 (= (select (arr!3743 (_keys!5733 thiss!1248)) (index!4730 lt!92021)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186105 (=> (not res!88043) (not e!122471))))

(declare-fun b!186106 () Bool)

(assert (=> b!186106 (= e!122470 ((_ is Undefined!640) lt!92021))))

(declare-fun b!186107 () Bool)

(assert (=> b!186107 (= e!122472 (not call!18765))))

(declare-fun bm!18763 () Bool)

(declare-fun c!33367 () Bool)

(assert (=> bm!18763 (= call!18766 (inRange!0 (ite c!33367 (index!4730 lt!92021) (index!4733 lt!92021)) (mask!8909 thiss!1248)))))

(declare-fun d!55161 () Bool)

(assert (=> d!55161 e!122473))

(assert (=> d!55161 (= c!33367 ((_ is MissingZero!640) lt!92021))))

(assert (=> d!55161 (= lt!92021 (seekEntryOrOpen!0 key!828 (_keys!5733 thiss!1248) (mask!8909 thiss!1248)))))

(declare-fun lt!92022 () Unit!5602)

(declare-fun choose!983 (array!7927 array!7929 (_ BitVec 32) (_ BitVec 32) V!5459 V!5459 (_ BitVec 64) Int) Unit!5602)

(assert (=> d!55161 (= lt!92022 (choose!983 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) key!828 (defaultEntry!3792 thiss!1248)))))

(assert (=> d!55161 (validMask!0 (mask!8909 thiss!1248))))

(assert (=> d!55161 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!145 (_keys!5733 thiss!1248) (_values!3775 thiss!1248) (mask!8909 thiss!1248) (extraKeys!3529 thiss!1248) (zeroValue!3633 thiss!1248) (minValue!3633 thiss!1248) key!828 (defaultEntry!3792 thiss!1248)) lt!92022)))

(assert (= (and d!55161 c!33367) b!186102))

(assert (= (and d!55161 (not c!33367)) b!186103))

(assert (= (and b!186102 res!88042) b!186105))

(assert (= (and b!186105 res!88043) b!186100))

(assert (= (and b!186103 c!33366) b!186104))

(assert (= (and b!186103 (not c!33366)) b!186106))

(assert (= (and b!186104 res!88040) b!186101))

(assert (= (and b!186101 res!88041) b!186107))

(assert (= (or b!186102 b!186104) bm!18763))

(assert (= (or b!186100 b!186107) bm!18762))

(declare-fun m!213139 () Bool)

(assert (=> bm!18762 m!213139))

(declare-fun m!213141 () Bool)

(assert (=> bm!18763 m!213141))

(assert (=> d!55161 m!213017))

(declare-fun m!213143 () Bool)

(assert (=> d!55161 m!213143))

(assert (=> d!55161 m!213011))

(declare-fun m!213145 () Bool)

(assert (=> b!186101 m!213145))

(declare-fun m!213147 () Bool)

(assert (=> b!186105 m!213147))

(assert (=> b!185937 d!55161))

(declare-fun mapNonEmpty!7506 () Bool)

(declare-fun mapRes!7506 () Bool)

(declare-fun tp!16569 () Bool)

(declare-fun e!122478 () Bool)

(assert (=> mapNonEmpty!7506 (= mapRes!7506 (and tp!16569 e!122478))))

(declare-fun mapValue!7506 () ValueCell!1836)

(declare-fun mapRest!7506 () (Array (_ BitVec 32) ValueCell!1836))

(declare-fun mapKey!7506 () (_ BitVec 32))

(assert (=> mapNonEmpty!7506 (= mapRest!7500 (store mapRest!7506 mapKey!7506 mapValue!7506))))

(declare-fun mapIsEmpty!7506 () Bool)

(assert (=> mapIsEmpty!7506 mapRes!7506))

(declare-fun b!186115 () Bool)

(declare-fun e!122479 () Bool)

(assert (=> b!186115 (= e!122479 tp_is_empty!4359)))

(declare-fun condMapEmpty!7506 () Bool)

(declare-fun mapDefault!7506 () ValueCell!1836)

(assert (=> mapNonEmpty!7500 (= condMapEmpty!7506 (= mapRest!7500 ((as const (Array (_ BitVec 32) ValueCell!1836)) mapDefault!7506)))))

(assert (=> mapNonEmpty!7500 (= tp!16560 (and e!122479 mapRes!7506))))

(declare-fun b!186114 () Bool)

(assert (=> b!186114 (= e!122478 tp_is_empty!4359)))

(assert (= (and mapNonEmpty!7500 condMapEmpty!7506) mapIsEmpty!7506))

(assert (= (and mapNonEmpty!7500 (not condMapEmpty!7506)) mapNonEmpty!7506))

(assert (= (and mapNonEmpty!7506 ((_ is ValueCellFull!1836) mapValue!7506)) b!186114))

(assert (= (and mapNonEmpty!7500 ((_ is ValueCellFull!1836) mapDefault!7506)) b!186115))

(declare-fun m!213149 () Bool)

(assert (=> mapNonEmpty!7506 m!213149))

(declare-fun b_lambda!7257 () Bool)

(assert (= b_lambda!7255 (or (and b!185945 b_free!4587) b_lambda!7257)))

(check-sat (not b!186001) (not bm!18753) (not b!186072) (not b_next!4587) (not b!185993) (not b!186063) (not b!186018) (not d!55161) (not b_lambda!7257) (not bm!18755) tp_is_empty!4359 (not b!186003) (not b!186068) (not bm!18751) (not d!55145) b_and!11193 (not d!55143) (not b!186073) (not b!186002) (not b!186008) (not b!186016) (not mapNonEmpty!7506) (not bm!18762) (not b!186067) (not b!186079) (not d!55157) (not d!55147) (not bm!18763) (not bm!18752) (not b!186071) (not b!186081) (not d!55159))
(check-sat b_and!11193 (not b_next!4587))
