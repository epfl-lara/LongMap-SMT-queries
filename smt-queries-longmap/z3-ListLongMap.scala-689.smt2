; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16642 () Bool)

(assert start!16642)

(declare-fun b!166062 () Bool)

(declare-fun b_free!3943 () Bool)

(declare-fun b_next!3943 () Bool)

(assert (=> b!166062 (= b_free!3943 (not b_next!3943))))

(declare-fun tp!14430 () Bool)

(declare-fun b_and!10331 () Bool)

(assert (=> b!166062 (= tp!14430 b_and!10331)))

(declare-fun b!166053 () Bool)

(declare-fun res!78882 () Bool)

(declare-fun e!108913 () Bool)

(assert (=> b!166053 (=> (not res!78882) (not e!108913))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!166053 (= res!78882 (not (= key!828 (bvneg key!828))))))

(declare-fun e!108916 () Bool)

(declare-datatypes ((SeekEntryResult!461 0))(
  ( (MissingZero!461 (index!4012 (_ BitVec 32))) (Found!461 (index!4013 (_ BitVec 32))) (Intermediate!461 (undefined!1273 Bool) (index!4014 (_ BitVec 32)) (x!18424 (_ BitVec 32))) (Undefined!461) (MissingVacant!461 (index!4015 (_ BitVec 32))) )
))
(declare-fun lt!83033 () SeekEntryResult!461)

(declare-fun b!166054 () Bool)

(declare-datatypes ((V!4641 0))(
  ( (V!4642 (val!1917 Int)) )
))
(declare-datatypes ((ValueCell!1529 0))(
  ( (ValueCellFull!1529 (v!3776 V!4641)) (EmptyCell!1529) )
))
(declare-datatypes ((array!6567 0))(
  ( (array!6568 (arr!3118 (Array (_ BitVec 32) (_ BitVec 64))) (size!3407 (_ BitVec 32))) )
))
(declare-datatypes ((array!6569 0))(
  ( (array!6570 (arr!3119 (Array (_ BitVec 32) ValueCell!1529)) (size!3408 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1966 0))(
  ( (LongMapFixedSize!1967 (defaultEntry!3425 Int) (mask!8151 (_ BitVec 32)) (extraKeys!3166 (_ BitVec 32)) (zeroValue!3268 V!4641) (minValue!3268 V!4641) (_size!1032 (_ BitVec 32)) (_keys!5249 array!6567) (_values!3408 array!6569) (_vacant!1032 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1966)

(assert (=> b!166054 (= e!108916 (= (select (arr!3118 (_keys!5249 thiss!1248)) (index!4013 lt!83033)) key!828))))

(declare-fun b!166055 () Bool)

(declare-datatypes ((Unit!5019 0))(
  ( (Unit!5020) )
))
(declare-fun e!108911 () Unit!5019)

(declare-fun lt!83036 () Unit!5019)

(assert (=> b!166055 (= e!108911 lt!83036)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!81 (array!6567 array!6569 (_ BitVec 32) (_ BitVec 32) V!4641 V!4641 (_ BitVec 64) Int) Unit!5019)

(assert (=> b!166055 (= lt!83036 (lemmaInListMapThenSeekEntryOrOpenFindsIt!81 (_keys!5249 thiss!1248) (_values!3408 thiss!1248) (mask!8151 thiss!1248) (extraKeys!3166 thiss!1248) (zeroValue!3268 thiss!1248) (minValue!3268 thiss!1248) key!828 (defaultEntry!3425 thiss!1248)))))

(declare-fun res!78879 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166055 (= res!78879 (inRange!0 (index!4013 lt!83033) (mask!8151 thiss!1248)))))

(assert (=> b!166055 (=> (not res!78879) (not e!108916))))

(assert (=> b!166055 e!108916))

(declare-fun res!78878 () Bool)

(assert (=> start!16642 (=> (not res!78878) (not e!108913))))

(declare-fun valid!870 (LongMapFixedSize!1966) Bool)

(assert (=> start!16642 (= res!78878 (valid!870 thiss!1248))))

(assert (=> start!16642 e!108913))

(declare-fun e!108917 () Bool)

(assert (=> start!16642 e!108917))

(assert (=> start!16642 true))

(declare-fun b!166056 () Bool)

(declare-fun e!108915 () Bool)

(declare-fun tp_is_empty!3745 () Bool)

(assert (=> b!166056 (= e!108915 tp_is_empty!3745)))

(declare-fun b!166057 () Bool)

(declare-fun e!108910 () Bool)

(declare-fun e!108912 () Bool)

(declare-fun mapRes!6336 () Bool)

(assert (=> b!166057 (= e!108910 (and e!108912 mapRes!6336))))

(declare-fun condMapEmpty!6336 () Bool)

(declare-fun mapDefault!6336 () ValueCell!1529)

(assert (=> b!166057 (= condMapEmpty!6336 (= (arr!3119 (_values!3408 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1529)) mapDefault!6336)))))

(declare-fun b!166058 () Bool)

(declare-fun res!78881 () Bool)

(declare-fun e!108909 () Bool)

(assert (=> b!166058 (=> (not res!78881) (not e!108909))))

(assert (=> b!166058 (= res!78881 (and (= (size!3408 (_values!3408 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8151 thiss!1248))) (= (size!3407 (_keys!5249 thiss!1248)) (size!3408 (_values!3408 thiss!1248))) (bvsge (mask!8151 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3166 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3166 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166059 () Bool)

(declare-fun e!108918 () Bool)

(assert (=> b!166059 (= e!108918 e!108909)))

(declare-fun res!78883 () Bool)

(assert (=> b!166059 (=> (not res!78883) (not e!108909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166059 (= res!78883 (validMask!0 (mask!8151 thiss!1248)))))

(declare-fun lt!83034 () Unit!5019)

(assert (=> b!166059 (= lt!83034 e!108911)))

(declare-fun c!30170 () Bool)

(declare-datatypes ((tuple2!3080 0))(
  ( (tuple2!3081 (_1!1551 (_ BitVec 64)) (_2!1551 V!4641)) )
))
(declare-datatypes ((List!2084 0))(
  ( (Nil!2081) (Cons!2080 (h!2697 tuple2!3080) (t!6877 List!2084)) )
))
(declare-datatypes ((ListLongMap!2023 0))(
  ( (ListLongMap!2024 (toList!1027 List!2084)) )
))
(declare-fun contains!1072 (ListLongMap!2023 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!669 (array!6567 array!6569 (_ BitVec 32) (_ BitVec 32) V!4641 V!4641 (_ BitVec 32) Int) ListLongMap!2023)

(assert (=> b!166059 (= c!30170 (contains!1072 (getCurrentListMap!669 (_keys!5249 thiss!1248) (_values!3408 thiss!1248) (mask!8151 thiss!1248) (extraKeys!3166 thiss!1248) (zeroValue!3268 thiss!1248) (minValue!3268 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3425 thiss!1248)) key!828))))

(declare-fun b!166060 () Bool)

(assert (=> b!166060 (= e!108909 false)))

(declare-fun lt!83037 () Bool)

(declare-datatypes ((List!2085 0))(
  ( (Nil!2082) (Cons!2081 (h!2698 (_ BitVec 64)) (t!6878 List!2085)) )
))
(declare-fun arrayNoDuplicates!0 (array!6567 (_ BitVec 32) List!2085) Bool)

(assert (=> b!166060 (= lt!83037 (arrayNoDuplicates!0 (_keys!5249 thiss!1248) #b00000000000000000000000000000000 Nil!2082))))

(declare-fun b!166061 () Bool)

(assert (=> b!166061 (= e!108913 e!108918)))

(declare-fun res!78880 () Bool)

(assert (=> b!166061 (=> (not res!78880) (not e!108918))))

(get-info :version)

(assert (=> b!166061 (= res!78880 (and (not ((_ is Undefined!461) lt!83033)) (not ((_ is MissingVacant!461) lt!83033)) (not ((_ is MissingZero!461) lt!83033)) ((_ is Found!461) lt!83033)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6567 (_ BitVec 32)) SeekEntryResult!461)

(assert (=> b!166061 (= lt!83033 (seekEntryOrOpen!0 key!828 (_keys!5249 thiss!1248) (mask!8151 thiss!1248)))))

(declare-fun array_inv!2005 (array!6567) Bool)

(declare-fun array_inv!2006 (array!6569) Bool)

(assert (=> b!166062 (= e!108917 (and tp!14430 tp_is_empty!3745 (array_inv!2005 (_keys!5249 thiss!1248)) (array_inv!2006 (_values!3408 thiss!1248)) e!108910))))

(declare-fun mapNonEmpty!6336 () Bool)

(declare-fun tp!14429 () Bool)

(assert (=> mapNonEmpty!6336 (= mapRes!6336 (and tp!14429 e!108915))))

(declare-fun mapKey!6336 () (_ BitVec 32))

(declare-fun mapRest!6336 () (Array (_ BitVec 32) ValueCell!1529))

(declare-fun mapValue!6336 () ValueCell!1529)

(assert (=> mapNonEmpty!6336 (= (arr!3119 (_values!3408 thiss!1248)) (store mapRest!6336 mapKey!6336 mapValue!6336))))

(declare-fun b!166063 () Bool)

(assert (=> b!166063 (= e!108912 tp_is_empty!3745)))

(declare-fun mapIsEmpty!6336 () Bool)

(assert (=> mapIsEmpty!6336 mapRes!6336))

(declare-fun b!166064 () Bool)

(declare-fun Unit!5021 () Unit!5019)

(assert (=> b!166064 (= e!108911 Unit!5021)))

(declare-fun lt!83035 () Unit!5019)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!79 (array!6567 array!6569 (_ BitVec 32) (_ BitVec 32) V!4641 V!4641 (_ BitVec 64) Int) Unit!5019)

(assert (=> b!166064 (= lt!83035 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!79 (_keys!5249 thiss!1248) (_values!3408 thiss!1248) (mask!8151 thiss!1248) (extraKeys!3166 thiss!1248) (zeroValue!3268 thiss!1248) (minValue!3268 thiss!1248) key!828 (defaultEntry!3425 thiss!1248)))))

(assert (=> b!166064 false))

(declare-fun b!166065 () Bool)

(declare-fun res!78877 () Bool)

(assert (=> b!166065 (=> (not res!78877) (not e!108909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6567 (_ BitVec 32)) Bool)

(assert (=> b!166065 (= res!78877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5249 thiss!1248) (mask!8151 thiss!1248)))))

(assert (= (and start!16642 res!78878) b!166053))

(assert (= (and b!166053 res!78882) b!166061))

(assert (= (and b!166061 res!78880) b!166059))

(assert (= (and b!166059 c!30170) b!166055))

(assert (= (and b!166059 (not c!30170)) b!166064))

(assert (= (and b!166055 res!78879) b!166054))

(assert (= (and b!166059 res!78883) b!166058))

(assert (= (and b!166058 res!78881) b!166065))

(assert (= (and b!166065 res!78877) b!166060))

(assert (= (and b!166057 condMapEmpty!6336) mapIsEmpty!6336))

(assert (= (and b!166057 (not condMapEmpty!6336)) mapNonEmpty!6336))

(assert (= (and mapNonEmpty!6336 ((_ is ValueCellFull!1529) mapValue!6336)) b!166056))

(assert (= (and b!166057 ((_ is ValueCellFull!1529) mapDefault!6336)) b!166063))

(assert (= b!166062 b!166057))

(assert (= start!16642 b!166062))

(declare-fun m!195091 () Bool)

(assert (=> b!166061 m!195091))

(declare-fun m!195093 () Bool)

(assert (=> b!166062 m!195093))

(declare-fun m!195095 () Bool)

(assert (=> b!166062 m!195095))

(declare-fun m!195097 () Bool)

(assert (=> b!166059 m!195097))

(declare-fun m!195099 () Bool)

(assert (=> b!166059 m!195099))

(assert (=> b!166059 m!195099))

(declare-fun m!195101 () Bool)

(assert (=> b!166059 m!195101))

(declare-fun m!195103 () Bool)

(assert (=> b!166055 m!195103))

(declare-fun m!195105 () Bool)

(assert (=> b!166055 m!195105))

(declare-fun m!195107 () Bool)

(assert (=> b!166065 m!195107))

(declare-fun m!195109 () Bool)

(assert (=> b!166054 m!195109))

(declare-fun m!195111 () Bool)

(assert (=> b!166064 m!195111))

(declare-fun m!195113 () Bool)

(assert (=> mapNonEmpty!6336 m!195113))

(declare-fun m!195115 () Bool)

(assert (=> b!166060 m!195115))

(declare-fun m!195117 () Bool)

(assert (=> start!16642 m!195117))

(check-sat (not b!166059) (not mapNonEmpty!6336) (not b!166062) tp_is_empty!3745 (not b!166061) (not start!16642) (not b!166064) b_and!10331 (not b!166065) (not b_next!3943) (not b!166060) (not b!166055))
(check-sat b_and!10331 (not b_next!3943))
