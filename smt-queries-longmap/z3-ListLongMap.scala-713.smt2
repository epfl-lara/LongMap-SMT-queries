; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16786 () Bool)

(assert start!16786)

(declare-fun b!168994 () Bool)

(declare-fun b_free!4087 () Bool)

(declare-fun b_next!4087 () Bool)

(assert (=> b!168994 (= b_free!4087 (not b_next!4087))))

(declare-fun tp!14861 () Bool)

(declare-fun b_and!10515 () Bool)

(assert (=> b!168994 (= tp!14861 b_and!10515)))

(declare-fun b!168986 () Bool)

(declare-fun e!111189 () Bool)

(declare-fun e!111188 () Bool)

(assert (=> b!168986 (= e!111189 e!111188)))

(declare-fun res!80437 () Bool)

(assert (=> b!168986 (=> (not res!80437) (not e!111188))))

(declare-datatypes ((SeekEntryResult!505 0))(
  ( (MissingZero!505 (index!4188 (_ BitVec 32))) (Found!505 (index!4189 (_ BitVec 32))) (Intermediate!505 (undefined!1317 Bool) (index!4190 (_ BitVec 32)) (x!18661 (_ BitVec 32))) (Undefined!505) (MissingVacant!505 (index!4191 (_ BitVec 32))) )
))
(declare-fun lt!84732 () SeekEntryResult!505)

(get-info :version)

(assert (=> b!168986 (= res!80437 (and (not ((_ is Undefined!505) lt!84732)) (not ((_ is MissingVacant!505) lt!84732)) (not ((_ is MissingZero!505) lt!84732)) ((_ is Found!505) lt!84732)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4833 0))(
  ( (V!4834 (val!1989 Int)) )
))
(declare-datatypes ((ValueCell!1601 0))(
  ( (ValueCellFull!1601 (v!3855 V!4833)) (EmptyCell!1601) )
))
(declare-datatypes ((array!6861 0))(
  ( (array!6862 (arr!3266 (Array (_ BitVec 32) (_ BitVec 64))) (size!3554 (_ BitVec 32))) )
))
(declare-datatypes ((array!6863 0))(
  ( (array!6864 (arr!3267 (Array (_ BitVec 32) ValueCell!1601)) (size!3555 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2110 0))(
  ( (LongMapFixedSize!2111 (defaultEntry!3497 Int) (mask!8272 (_ BitVec 32)) (extraKeys!3238 (_ BitVec 32)) (zeroValue!3340 V!4833) (minValue!3340 V!4833) (_size!1104 (_ BitVec 32)) (_keys!5322 array!6861) (_values!3480 array!6863) (_vacant!1104 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2110)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6861 (_ BitVec 32)) SeekEntryResult!505)

(assert (=> b!168986 (= lt!84732 (seekEntryOrOpen!0 key!828 (_keys!5322 thiss!1248) (mask!8272 thiss!1248)))))

(declare-fun b!168987 () Bool)

(declare-datatypes ((Unit!5222 0))(
  ( (Unit!5223) )
))
(declare-fun e!111185 () Unit!5222)

(declare-fun Unit!5224 () Unit!5222)

(assert (=> b!168987 (= e!111185 Unit!5224)))

(declare-fun lt!84733 () Unit!5222)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!126 (array!6861 array!6863 (_ BitVec 32) (_ BitVec 32) V!4833 V!4833 (_ BitVec 64) Int) Unit!5222)

(assert (=> b!168987 (= lt!84733 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!126 (_keys!5322 thiss!1248) (_values!3480 thiss!1248) (mask!8272 thiss!1248) (extraKeys!3238 thiss!1248) (zeroValue!3340 thiss!1248) (minValue!3340 thiss!1248) key!828 (defaultEntry!3497 thiss!1248)))))

(assert (=> b!168987 false))

(declare-fun b!168988 () Bool)

(declare-fun e!111191 () Bool)

(declare-fun tp_is_empty!3889 () Bool)

(assert (=> b!168988 (= e!111191 tp_is_empty!3889)))

(declare-fun mapNonEmpty!6552 () Bool)

(declare-fun mapRes!6552 () Bool)

(declare-fun tp!14862 () Bool)

(declare-fun e!111183 () Bool)

(assert (=> mapNonEmpty!6552 (= mapRes!6552 (and tp!14862 e!111183))))

(declare-fun mapValue!6552 () ValueCell!1601)

(declare-fun mapKey!6552 () (_ BitVec 32))

(declare-fun mapRest!6552 () (Array (_ BitVec 32) ValueCell!1601))

(assert (=> mapNonEmpty!6552 (= (arr!3267 (_values!3480 thiss!1248)) (store mapRest!6552 mapKey!6552 mapValue!6552))))

(declare-fun b!168989 () Bool)

(assert (=> b!168989 (= e!111183 tp_is_empty!3889)))

(declare-fun b!168990 () Bool)

(assert (=> b!168990 (= e!111188 (not true))))

(declare-fun lt!84734 () Bool)

(declare-fun lt!84730 () array!6863)

(declare-fun valid!922 (LongMapFixedSize!2110) Bool)

(assert (=> b!168990 (= lt!84734 (valid!922 (LongMapFixedSize!2111 (defaultEntry!3497 thiss!1248) (mask!8272 thiss!1248) (extraKeys!3238 thiss!1248) (zeroValue!3340 thiss!1248) (minValue!3340 thiss!1248) (_size!1104 thiss!1248) (_keys!5322 thiss!1248) lt!84730 (_vacant!1104 thiss!1248))))))

(declare-datatypes ((tuple2!3152 0))(
  ( (tuple2!3153 (_1!1587 (_ BitVec 64)) (_2!1587 V!4833)) )
))
(declare-datatypes ((List!2157 0))(
  ( (Nil!2154) (Cons!2153 (h!2770 tuple2!3152) (t!6951 List!2157)) )
))
(declare-datatypes ((ListLongMap!2113 0))(
  ( (ListLongMap!2114 (toList!1072 List!2157)) )
))
(declare-fun lt!84725 () ListLongMap!2113)

(declare-fun contains!1124 (ListLongMap!2113 (_ BitVec 64)) Bool)

(assert (=> b!168990 (contains!1124 lt!84725 (select (arr!3266 (_keys!5322 thiss!1248)) (index!4189 lt!84732)))))

(declare-fun lt!84726 () Unit!5222)

(declare-fun lemmaValidKeyInArrayIsInListMap!136 (array!6861 array!6863 (_ BitVec 32) (_ BitVec 32) V!4833 V!4833 (_ BitVec 32) Int) Unit!5222)

(assert (=> b!168990 (= lt!84726 (lemmaValidKeyInArrayIsInListMap!136 (_keys!5322 thiss!1248) lt!84730 (mask!8272 thiss!1248) (extraKeys!3238 thiss!1248) (zeroValue!3340 thiss!1248) (minValue!3340 thiss!1248) (index!4189 lt!84732) (defaultEntry!3497 thiss!1248)))))

(declare-fun lt!84735 () ListLongMap!2113)

(assert (=> b!168990 (= lt!84735 lt!84725)))

(declare-fun getCurrentListMap!732 (array!6861 array!6863 (_ BitVec 32) (_ BitVec 32) V!4833 V!4833 (_ BitVec 32) Int) ListLongMap!2113)

(assert (=> b!168990 (= lt!84725 (getCurrentListMap!732 (_keys!5322 thiss!1248) lt!84730 (mask!8272 thiss!1248) (extraKeys!3238 thiss!1248) (zeroValue!3340 thiss!1248) (minValue!3340 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3497 thiss!1248)))))

(declare-fun lt!84729 () ListLongMap!2113)

(declare-fun v!309 () V!4833)

(declare-fun +!238 (ListLongMap!2113 tuple2!3152) ListLongMap!2113)

(assert (=> b!168990 (= lt!84735 (+!238 lt!84729 (tuple2!3153 key!828 v!309)))))

(assert (=> b!168990 (= lt!84730 (array!6864 (store (arr!3267 (_values!3480 thiss!1248)) (index!4189 lt!84732) (ValueCellFull!1601 v!309)) (size!3555 (_values!3480 thiss!1248))))))

(declare-fun lt!84731 () Unit!5222)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!96 (array!6861 array!6863 (_ BitVec 32) (_ BitVec 32) V!4833 V!4833 (_ BitVec 32) (_ BitVec 64) V!4833 Int) Unit!5222)

(assert (=> b!168990 (= lt!84731 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!96 (_keys!5322 thiss!1248) (_values!3480 thiss!1248) (mask!8272 thiss!1248) (extraKeys!3238 thiss!1248) (zeroValue!3340 thiss!1248) (minValue!3340 thiss!1248) (index!4189 lt!84732) key!828 v!309 (defaultEntry!3497 thiss!1248)))))

(declare-fun lt!84727 () Unit!5222)

(assert (=> b!168990 (= lt!84727 e!111185)))

(declare-fun c!30425 () Bool)

(assert (=> b!168990 (= c!30425 (contains!1124 lt!84729 key!828))))

(assert (=> b!168990 (= lt!84729 (getCurrentListMap!732 (_keys!5322 thiss!1248) (_values!3480 thiss!1248) (mask!8272 thiss!1248) (extraKeys!3238 thiss!1248) (zeroValue!3340 thiss!1248) (minValue!3340 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3497 thiss!1248)))))

(declare-fun b!168991 () Bool)

(declare-fun e!111186 () Bool)

(assert (=> b!168991 (= e!111186 (and e!111191 mapRes!6552))))

(declare-fun condMapEmpty!6552 () Bool)

(declare-fun mapDefault!6552 () ValueCell!1601)

(assert (=> b!168991 (= condMapEmpty!6552 (= (arr!3267 (_values!3480 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1601)) mapDefault!6552)))))

(declare-fun e!111187 () Bool)

(declare-fun b!168992 () Bool)

(assert (=> b!168992 (= e!111187 (= (select (arr!3266 (_keys!5322 thiss!1248)) (index!4189 lt!84732)) key!828))))

(declare-fun res!80439 () Bool)

(assert (=> start!16786 (=> (not res!80439) (not e!111189))))

(assert (=> start!16786 (= res!80439 (valid!922 thiss!1248))))

(assert (=> start!16786 e!111189))

(declare-fun e!111190 () Bool)

(assert (=> start!16786 e!111190))

(assert (=> start!16786 true))

(assert (=> start!16786 tp_is_empty!3889))

(declare-fun mapIsEmpty!6552 () Bool)

(assert (=> mapIsEmpty!6552 mapRes!6552))

(declare-fun b!168993 () Bool)

(declare-fun res!80438 () Bool)

(assert (=> b!168993 (=> (not res!80438) (not e!111189))))

(assert (=> b!168993 (= res!80438 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!2093 (array!6861) Bool)

(declare-fun array_inv!2094 (array!6863) Bool)

(assert (=> b!168994 (= e!111190 (and tp!14861 tp_is_empty!3889 (array_inv!2093 (_keys!5322 thiss!1248)) (array_inv!2094 (_values!3480 thiss!1248)) e!111186))))

(declare-fun b!168995 () Bool)

(declare-fun lt!84728 () Unit!5222)

(assert (=> b!168995 (= e!111185 lt!84728)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!133 (array!6861 array!6863 (_ BitVec 32) (_ BitVec 32) V!4833 V!4833 (_ BitVec 64) Int) Unit!5222)

(assert (=> b!168995 (= lt!84728 (lemmaInListMapThenSeekEntryOrOpenFindsIt!133 (_keys!5322 thiss!1248) (_values!3480 thiss!1248) (mask!8272 thiss!1248) (extraKeys!3238 thiss!1248) (zeroValue!3340 thiss!1248) (minValue!3340 thiss!1248) key!828 (defaultEntry!3497 thiss!1248)))))

(declare-fun res!80436 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168995 (= res!80436 (inRange!0 (index!4189 lt!84732) (mask!8272 thiss!1248)))))

(assert (=> b!168995 (=> (not res!80436) (not e!111187))))

(assert (=> b!168995 e!111187))

(assert (= (and start!16786 res!80439) b!168993))

(assert (= (and b!168993 res!80438) b!168986))

(assert (= (and b!168986 res!80437) b!168990))

(assert (= (and b!168990 c!30425) b!168995))

(assert (= (and b!168990 (not c!30425)) b!168987))

(assert (= (and b!168995 res!80436) b!168992))

(assert (= (and b!168991 condMapEmpty!6552) mapIsEmpty!6552))

(assert (= (and b!168991 (not condMapEmpty!6552)) mapNonEmpty!6552))

(assert (= (and mapNonEmpty!6552 ((_ is ValueCellFull!1601) mapValue!6552)) b!168989))

(assert (= (and b!168991 ((_ is ValueCellFull!1601) mapDefault!6552)) b!168988))

(assert (= b!168994 b!168991))

(assert (= start!16786 b!168994))

(declare-fun m!198245 () Bool)

(assert (=> b!168994 m!198245))

(declare-fun m!198247 () Bool)

(assert (=> b!168994 m!198247))

(declare-fun m!198249 () Bool)

(assert (=> b!168995 m!198249))

(declare-fun m!198251 () Bool)

(assert (=> b!168995 m!198251))

(declare-fun m!198253 () Bool)

(assert (=> b!168987 m!198253))

(declare-fun m!198255 () Bool)

(assert (=> b!168990 m!198255))

(declare-fun m!198257 () Bool)

(assert (=> b!168990 m!198257))

(declare-fun m!198259 () Bool)

(assert (=> b!168990 m!198259))

(declare-fun m!198261 () Bool)

(assert (=> b!168990 m!198261))

(declare-fun m!198263 () Bool)

(assert (=> b!168990 m!198263))

(declare-fun m!198265 () Bool)

(assert (=> b!168990 m!198265))

(assert (=> b!168990 m!198259))

(declare-fun m!198267 () Bool)

(assert (=> b!168990 m!198267))

(declare-fun m!198269 () Bool)

(assert (=> b!168990 m!198269))

(declare-fun m!198271 () Bool)

(assert (=> b!168990 m!198271))

(declare-fun m!198273 () Bool)

(assert (=> b!168990 m!198273))

(declare-fun m!198275 () Bool)

(assert (=> mapNonEmpty!6552 m!198275))

(declare-fun m!198277 () Bool)

(assert (=> start!16786 m!198277))

(declare-fun m!198279 () Bool)

(assert (=> b!168986 m!198279))

(assert (=> b!168992 m!198259))

(check-sat tp_is_empty!3889 (not b!168986) (not b!168990) (not b!168987) b_and!10515 (not b!168994) (not b_next!4087) (not mapNonEmpty!6552) (not start!16786) (not b!168995))
(check-sat b_and!10515 (not b_next!4087))
