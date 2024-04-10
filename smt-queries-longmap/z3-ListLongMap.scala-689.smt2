; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16640 () Bool)

(assert start!16640)

(declare-fun b!166244 () Bool)

(declare-fun b_free!3945 () Bool)

(declare-fun b_next!3945 () Bool)

(assert (=> b!166244 (= b_free!3945 (not b_next!3945))))

(declare-fun tp!14436 () Bool)

(declare-fun b_and!10359 () Bool)

(assert (=> b!166244 (= tp!14436 b_and!10359)))

(declare-fun b!166239 () Bool)

(declare-datatypes ((Unit!5052 0))(
  ( (Unit!5053) )
))
(declare-fun e!109044 () Unit!5052)

(declare-fun Unit!5054 () Unit!5052)

(assert (=> b!166239 (= e!109044 Unit!5054)))

(declare-fun lt!83230 () Unit!5052)

(declare-datatypes ((V!4643 0))(
  ( (V!4644 (val!1918 Int)) )
))
(declare-datatypes ((ValueCell!1530 0))(
  ( (ValueCellFull!1530 (v!3783 V!4643)) (EmptyCell!1530) )
))
(declare-datatypes ((array!6591 0))(
  ( (array!6592 (arr!3131 (Array (_ BitVec 32) (_ BitVec 64))) (size!3419 (_ BitVec 32))) )
))
(declare-datatypes ((array!6593 0))(
  ( (array!6594 (arr!3132 (Array (_ BitVec 32) ValueCell!1530)) (size!3420 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1968 0))(
  ( (LongMapFixedSize!1969 (defaultEntry!3426 Int) (mask!8153 (_ BitVec 32)) (extraKeys!3167 (_ BitVec 32)) (zeroValue!3269 V!4643) (minValue!3269 V!4643) (_size!1033 (_ BitVec 32)) (_keys!5251 array!6591) (_values!3409 array!6593) (_vacant!1033 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1968)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!85 (array!6591 array!6593 (_ BitVec 32) (_ BitVec 32) V!4643 V!4643 (_ BitVec 64) Int) Unit!5052)

(assert (=> b!166239 (= lt!83230 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!85 (_keys!5251 thiss!1248) (_values!3409 thiss!1248) (mask!8153 thiss!1248) (extraKeys!3167 thiss!1248) (zeroValue!3269 thiss!1248) (minValue!3269 thiss!1248) key!828 (defaultEntry!3426 thiss!1248)))))

(assert (=> b!166239 false))

(declare-fun b!166240 () Bool)

(declare-fun e!109049 () Bool)

(declare-fun e!109043 () Bool)

(declare-fun mapRes!6339 () Bool)

(assert (=> b!166240 (= e!109049 (and e!109043 mapRes!6339))))

(declare-fun condMapEmpty!6339 () Bool)

(declare-fun mapDefault!6339 () ValueCell!1530)

(assert (=> b!166240 (= condMapEmpty!6339 (= (arr!3132 (_values!3409 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1530)) mapDefault!6339)))))

(declare-fun b!166241 () Bool)

(declare-fun e!109040 () Bool)

(assert (=> b!166241 (= e!109040 false)))

(declare-fun lt!83233 () Bool)

(declare-datatypes ((List!2084 0))(
  ( (Nil!2081) (Cons!2080 (h!2697 (_ BitVec 64)) (t!6886 List!2084)) )
))
(declare-fun arrayNoDuplicates!0 (array!6591 (_ BitVec 32) List!2084) Bool)

(assert (=> b!166241 (= lt!83233 (arrayNoDuplicates!0 (_keys!5251 thiss!1248) #b00000000000000000000000000000000 Nil!2081))))

(declare-fun b!166242 () Bool)

(declare-fun res!78995 () Bool)

(assert (=> b!166242 (=> (not res!78995) (not e!109040))))

(assert (=> b!166242 (= res!78995 (and (= (size!3420 (_values!3409 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8153 thiss!1248))) (= (size!3419 (_keys!5251 thiss!1248)) (size!3420 (_values!3409 thiss!1248))) (bvsge (mask!8153 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3167 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3167 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!78998 () Bool)

(declare-fun e!109042 () Bool)

(assert (=> start!16640 (=> (not res!78998) (not e!109042))))

(declare-fun valid!865 (LongMapFixedSize!1968) Bool)

(assert (=> start!16640 (= res!78998 (valid!865 thiss!1248))))

(assert (=> start!16640 e!109042))

(declare-fun e!109045 () Bool)

(assert (=> start!16640 e!109045))

(assert (=> start!16640 true))

(declare-fun mapIsEmpty!6339 () Bool)

(assert (=> mapIsEmpty!6339 mapRes!6339))

(declare-fun b!166243 () Bool)

(declare-fun e!109046 () Bool)

(declare-datatypes ((SeekEntryResult!452 0))(
  ( (MissingZero!452 (index!3976 (_ BitVec 32))) (Found!452 (index!3977 (_ BitVec 32))) (Intermediate!452 (undefined!1264 Bool) (index!3978 (_ BitVec 32)) (x!18416 (_ BitVec 32))) (Undefined!452) (MissingVacant!452 (index!3979 (_ BitVec 32))) )
))
(declare-fun lt!83229 () SeekEntryResult!452)

(assert (=> b!166243 (= e!109046 (= (select (arr!3131 (_keys!5251 thiss!1248)) (index!3977 lt!83229)) key!828))))

(declare-fun tp_is_empty!3747 () Bool)

(declare-fun array_inv!2007 (array!6591) Bool)

(declare-fun array_inv!2008 (array!6593) Bool)

(assert (=> b!166244 (= e!109045 (and tp!14436 tp_is_empty!3747 (array_inv!2007 (_keys!5251 thiss!1248)) (array_inv!2008 (_values!3409 thiss!1248)) e!109049))))

(declare-fun mapNonEmpty!6339 () Bool)

(declare-fun tp!14435 () Bool)

(declare-fun e!109041 () Bool)

(assert (=> mapNonEmpty!6339 (= mapRes!6339 (and tp!14435 e!109041))))

(declare-fun mapValue!6339 () ValueCell!1530)

(declare-fun mapRest!6339 () (Array (_ BitVec 32) ValueCell!1530))

(declare-fun mapKey!6339 () (_ BitVec 32))

(assert (=> mapNonEmpty!6339 (= (arr!3132 (_values!3409 thiss!1248)) (store mapRest!6339 mapKey!6339 mapValue!6339))))

(declare-fun b!166245 () Bool)

(declare-fun lt!83231 () Unit!5052)

(assert (=> b!166245 (= e!109044 lt!83231)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!84 (array!6591 array!6593 (_ BitVec 32) (_ BitVec 32) V!4643 V!4643 (_ BitVec 64) Int) Unit!5052)

(assert (=> b!166245 (= lt!83231 (lemmaInListMapThenSeekEntryOrOpenFindsIt!84 (_keys!5251 thiss!1248) (_values!3409 thiss!1248) (mask!8153 thiss!1248) (extraKeys!3167 thiss!1248) (zeroValue!3269 thiss!1248) (minValue!3269 thiss!1248) key!828 (defaultEntry!3426 thiss!1248)))))

(declare-fun res!78997 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166245 (= res!78997 (inRange!0 (index!3977 lt!83229) (mask!8153 thiss!1248)))))

(assert (=> b!166245 (=> (not res!78997) (not e!109046))))

(assert (=> b!166245 e!109046))

(declare-fun b!166246 () Bool)

(declare-fun e!109048 () Bool)

(assert (=> b!166246 (= e!109048 e!109040)))

(declare-fun res!78994 () Bool)

(assert (=> b!166246 (=> (not res!78994) (not e!109040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166246 (= res!78994 (validMask!0 (mask!8153 thiss!1248)))))

(declare-fun lt!83232 () Unit!5052)

(assert (=> b!166246 (= lt!83232 e!109044)))

(declare-fun c!30199 () Bool)

(declare-datatypes ((tuple2!3098 0))(
  ( (tuple2!3099 (_1!1560 (_ BitVec 64)) (_2!1560 V!4643)) )
))
(declare-datatypes ((List!2085 0))(
  ( (Nil!2082) (Cons!2081 (h!2698 tuple2!3098) (t!6887 List!2085)) )
))
(declare-datatypes ((ListLongMap!2053 0))(
  ( (ListLongMap!2054 (toList!1042 List!2085)) )
))
(declare-fun contains!1084 (ListLongMap!2053 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!700 (array!6591 array!6593 (_ BitVec 32) (_ BitVec 32) V!4643 V!4643 (_ BitVec 32) Int) ListLongMap!2053)

(assert (=> b!166246 (= c!30199 (contains!1084 (getCurrentListMap!700 (_keys!5251 thiss!1248) (_values!3409 thiss!1248) (mask!8153 thiss!1248) (extraKeys!3167 thiss!1248) (zeroValue!3269 thiss!1248) (minValue!3269 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3426 thiss!1248)) key!828))))

(declare-fun b!166247 () Bool)

(declare-fun res!78993 () Bool)

(assert (=> b!166247 (=> (not res!78993) (not e!109042))))

(assert (=> b!166247 (= res!78993 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166248 () Bool)

(assert (=> b!166248 (= e!109042 e!109048)))

(declare-fun res!78996 () Bool)

(assert (=> b!166248 (=> (not res!78996) (not e!109048))))

(get-info :version)

(assert (=> b!166248 (= res!78996 (and (not ((_ is Undefined!452) lt!83229)) (not ((_ is MissingVacant!452) lt!83229)) (not ((_ is MissingZero!452) lt!83229)) ((_ is Found!452) lt!83229)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6591 (_ BitVec 32)) SeekEntryResult!452)

(assert (=> b!166248 (= lt!83229 (seekEntryOrOpen!0 key!828 (_keys!5251 thiss!1248) (mask!8153 thiss!1248)))))

(declare-fun b!166249 () Bool)

(declare-fun res!78999 () Bool)

(assert (=> b!166249 (=> (not res!78999) (not e!109040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6591 (_ BitVec 32)) Bool)

(assert (=> b!166249 (= res!78999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5251 thiss!1248) (mask!8153 thiss!1248)))))

(declare-fun b!166250 () Bool)

(assert (=> b!166250 (= e!109041 tp_is_empty!3747)))

(declare-fun b!166251 () Bool)

(assert (=> b!166251 (= e!109043 tp_is_empty!3747)))

(assert (= (and start!16640 res!78998) b!166247))

(assert (= (and b!166247 res!78993) b!166248))

(assert (= (and b!166248 res!78996) b!166246))

(assert (= (and b!166246 c!30199) b!166245))

(assert (= (and b!166246 (not c!30199)) b!166239))

(assert (= (and b!166245 res!78997) b!166243))

(assert (= (and b!166246 res!78994) b!166242))

(assert (= (and b!166242 res!78995) b!166249))

(assert (= (and b!166249 res!78999) b!166241))

(assert (= (and b!166240 condMapEmpty!6339) mapIsEmpty!6339))

(assert (= (and b!166240 (not condMapEmpty!6339)) mapNonEmpty!6339))

(assert (= (and mapNonEmpty!6339 ((_ is ValueCellFull!1530) mapValue!6339)) b!166250))

(assert (= (and b!166240 ((_ is ValueCellFull!1530) mapDefault!6339)) b!166251))

(assert (= b!166244 b!166240))

(assert (= start!16640 b!166244))

(declare-fun m!195739 () Bool)

(assert (=> b!166249 m!195739))

(declare-fun m!195741 () Bool)

(assert (=> b!166243 m!195741))

(declare-fun m!195743 () Bool)

(assert (=> mapNonEmpty!6339 m!195743))

(declare-fun m!195745 () Bool)

(assert (=> b!166241 m!195745))

(declare-fun m!195747 () Bool)

(assert (=> b!166248 m!195747))

(declare-fun m!195749 () Bool)

(assert (=> b!166245 m!195749))

(declare-fun m!195751 () Bool)

(assert (=> b!166245 m!195751))

(declare-fun m!195753 () Bool)

(assert (=> b!166244 m!195753))

(declare-fun m!195755 () Bool)

(assert (=> b!166244 m!195755))

(declare-fun m!195757 () Bool)

(assert (=> b!166239 m!195757))

(declare-fun m!195759 () Bool)

(assert (=> b!166246 m!195759))

(declare-fun m!195761 () Bool)

(assert (=> b!166246 m!195761))

(assert (=> b!166246 m!195761))

(declare-fun m!195763 () Bool)

(assert (=> b!166246 m!195763))

(declare-fun m!195765 () Bool)

(assert (=> start!16640 m!195765))

(check-sat (not start!16640) (not b_next!3945) tp_is_empty!3747 (not b!166244) (not b!166245) (not b!166248) (not b!166249) b_and!10359 (not mapNonEmpty!6339) (not b!166239) (not b!166246) (not b!166241))
(check-sat b_and!10359 (not b_next!3945))
