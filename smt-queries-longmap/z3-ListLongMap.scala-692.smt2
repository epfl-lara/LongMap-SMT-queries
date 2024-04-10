; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16658 () Bool)

(assert start!16658)

(declare-fun b!166601 () Bool)

(declare-fun b_free!3963 () Bool)

(declare-fun b_next!3963 () Bool)

(assert (=> b!166601 (= b_free!3963 (not b_next!3963))))

(declare-fun tp!14489 () Bool)

(declare-fun b_and!10377 () Bool)

(assert (=> b!166601 (= tp!14489 b_and!10377)))

(declare-fun b!166590 () Bool)

(declare-fun e!109312 () Bool)

(declare-fun tp_is_empty!3765 () Bool)

(assert (=> b!166590 (= e!109312 tp_is_empty!3765)))

(declare-fun mapIsEmpty!6366 () Bool)

(declare-fun mapRes!6366 () Bool)

(assert (=> mapIsEmpty!6366 mapRes!6366))

(declare-fun res!79186 () Bool)

(declare-fun e!109314 () Bool)

(assert (=> start!16658 (=> (not res!79186) (not e!109314))))

(declare-datatypes ((V!4667 0))(
  ( (V!4668 (val!1927 Int)) )
))
(declare-datatypes ((ValueCell!1539 0))(
  ( (ValueCellFull!1539 (v!3792 V!4667)) (EmptyCell!1539) )
))
(declare-datatypes ((array!6627 0))(
  ( (array!6628 (arr!3149 (Array (_ BitVec 32) (_ BitVec 64))) (size!3437 (_ BitVec 32))) )
))
(declare-datatypes ((array!6629 0))(
  ( (array!6630 (arr!3150 (Array (_ BitVec 32) ValueCell!1539)) (size!3438 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1986 0))(
  ( (LongMapFixedSize!1987 (defaultEntry!3435 Int) (mask!8168 (_ BitVec 32)) (extraKeys!3176 (_ BitVec 32)) (zeroValue!3278 V!4667) (minValue!3278 V!4667) (_size!1042 (_ BitVec 32)) (_keys!5260 array!6627) (_values!3418 array!6629) (_vacant!1042 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1986)

(declare-fun valid!872 (LongMapFixedSize!1986) Bool)

(assert (=> start!16658 (= res!79186 (valid!872 thiss!1248))))

(assert (=> start!16658 e!109314))

(declare-fun e!109318 () Bool)

(assert (=> start!16658 e!109318))

(assert (=> start!16658 true))

(declare-fun b!166591 () Bool)

(declare-datatypes ((Unit!5072 0))(
  ( (Unit!5073) )
))
(declare-fun e!109317 () Unit!5072)

(declare-fun lt!83367 () Unit!5072)

(assert (=> b!166591 (= e!109317 lt!83367)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!90 (array!6627 array!6629 (_ BitVec 32) (_ BitVec 32) V!4667 V!4667 (_ BitVec 64) Int) Unit!5072)

(assert (=> b!166591 (= lt!83367 (lemmaInListMapThenSeekEntryOrOpenFindsIt!90 (_keys!5260 thiss!1248) (_values!3418 thiss!1248) (mask!8168 thiss!1248) (extraKeys!3176 thiss!1248) (zeroValue!3278 thiss!1248) (minValue!3278 thiss!1248) key!828 (defaultEntry!3435 thiss!1248)))))

(declare-fun res!79188 () Bool)

(declare-datatypes ((SeekEntryResult!460 0))(
  ( (MissingZero!460 (index!4008 (_ BitVec 32))) (Found!460 (index!4009 (_ BitVec 32))) (Intermediate!460 (undefined!1272 Bool) (index!4010 (_ BitVec 32)) (x!18448 (_ BitVec 32))) (Undefined!460) (MissingVacant!460 (index!4011 (_ BitVec 32))) )
))
(declare-fun lt!83366 () SeekEntryResult!460)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166591 (= res!79188 (inRange!0 (index!4009 lt!83366) (mask!8168 thiss!1248)))))

(declare-fun e!109311 () Bool)

(assert (=> b!166591 (=> (not res!79188) (not e!109311))))

(assert (=> b!166591 e!109311))

(declare-fun b!166592 () Bool)

(declare-fun e!109313 () Bool)

(assert (=> b!166592 (= e!109313 tp_is_empty!3765)))

(declare-fun b!166593 () Bool)

(declare-fun Unit!5074 () Unit!5072)

(assert (=> b!166593 (= e!109317 Unit!5074)))

(declare-fun lt!83364 () Unit!5072)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!91 (array!6627 array!6629 (_ BitVec 32) (_ BitVec 32) V!4667 V!4667 (_ BitVec 64) Int) Unit!5072)

(assert (=> b!166593 (= lt!83364 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!91 (_keys!5260 thiss!1248) (_values!3418 thiss!1248) (mask!8168 thiss!1248) (extraKeys!3176 thiss!1248) (zeroValue!3278 thiss!1248) (minValue!3278 thiss!1248) key!828 (defaultEntry!3435 thiss!1248)))))

(assert (=> b!166593 false))

(declare-fun b!166594 () Bool)

(declare-fun e!109310 () Bool)

(assert (=> b!166594 (= e!109310 false)))

(declare-fun lt!83365 () Bool)

(declare-datatypes ((List!2098 0))(
  ( (Nil!2095) (Cons!2094 (h!2711 (_ BitVec 64)) (t!6900 List!2098)) )
))
(declare-fun arrayNoDuplicates!0 (array!6627 (_ BitVec 32) List!2098) Bool)

(assert (=> b!166594 (= lt!83365 (arrayNoDuplicates!0 (_keys!5260 thiss!1248) #b00000000000000000000000000000000 Nil!2095))))

(declare-fun b!166595 () Bool)

(declare-fun res!79187 () Bool)

(assert (=> b!166595 (=> (not res!79187) (not e!109310))))

(assert (=> b!166595 (= res!79187 (and (= (size!3438 (_values!3418 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8168 thiss!1248))) (= (size!3437 (_keys!5260 thiss!1248)) (size!3438 (_values!3418 thiss!1248))) (bvsge (mask!8168 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3176 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3176 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166596 () Bool)

(declare-fun e!109316 () Bool)

(assert (=> b!166596 (= e!109314 e!109316)))

(declare-fun res!79185 () Bool)

(assert (=> b!166596 (=> (not res!79185) (not e!109316))))

(get-info :version)

(assert (=> b!166596 (= res!79185 (and (not ((_ is Undefined!460) lt!83366)) (not ((_ is MissingVacant!460) lt!83366)) (not ((_ is MissingZero!460) lt!83366)) ((_ is Found!460) lt!83366)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6627 (_ BitVec 32)) SeekEntryResult!460)

(assert (=> b!166596 (= lt!83366 (seekEntryOrOpen!0 key!828 (_keys!5260 thiss!1248) (mask!8168 thiss!1248)))))

(declare-fun b!166597 () Bool)

(assert (=> b!166597 (= e!109311 (= (select (arr!3149 (_keys!5260 thiss!1248)) (index!4009 lt!83366)) key!828))))

(declare-fun b!166598 () Bool)

(declare-fun e!109319 () Bool)

(assert (=> b!166598 (= e!109319 (and e!109312 mapRes!6366))))

(declare-fun condMapEmpty!6366 () Bool)

(declare-fun mapDefault!6366 () ValueCell!1539)

(assert (=> b!166598 (= condMapEmpty!6366 (= (arr!3150 (_values!3418 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1539)) mapDefault!6366)))))

(declare-fun b!166599 () Bool)

(assert (=> b!166599 (= e!109316 e!109310)))

(declare-fun res!79182 () Bool)

(assert (=> b!166599 (=> (not res!79182) (not e!109310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166599 (= res!79182 (validMask!0 (mask!8168 thiss!1248)))))

(declare-fun lt!83368 () Unit!5072)

(assert (=> b!166599 (= lt!83368 e!109317)))

(declare-fun c!30226 () Bool)

(declare-datatypes ((tuple2!3110 0))(
  ( (tuple2!3111 (_1!1566 (_ BitVec 64)) (_2!1566 V!4667)) )
))
(declare-datatypes ((List!2099 0))(
  ( (Nil!2096) (Cons!2095 (h!2712 tuple2!3110) (t!6901 List!2099)) )
))
(declare-datatypes ((ListLongMap!2065 0))(
  ( (ListLongMap!2066 (toList!1048 List!2099)) )
))
(declare-fun contains!1090 (ListLongMap!2065 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!706 (array!6627 array!6629 (_ BitVec 32) (_ BitVec 32) V!4667 V!4667 (_ BitVec 32) Int) ListLongMap!2065)

(assert (=> b!166599 (= c!30226 (contains!1090 (getCurrentListMap!706 (_keys!5260 thiss!1248) (_values!3418 thiss!1248) (mask!8168 thiss!1248) (extraKeys!3176 thiss!1248) (zeroValue!3278 thiss!1248) (minValue!3278 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3435 thiss!1248)) key!828))))

(declare-fun b!166600 () Bool)

(declare-fun res!79184 () Bool)

(assert (=> b!166600 (=> (not res!79184) (not e!109310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6627 (_ BitVec 32)) Bool)

(assert (=> b!166600 (= res!79184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5260 thiss!1248) (mask!8168 thiss!1248)))))

(declare-fun mapNonEmpty!6366 () Bool)

(declare-fun tp!14490 () Bool)

(assert (=> mapNonEmpty!6366 (= mapRes!6366 (and tp!14490 e!109313))))

(declare-fun mapValue!6366 () ValueCell!1539)

(declare-fun mapKey!6366 () (_ BitVec 32))

(declare-fun mapRest!6366 () (Array (_ BitVec 32) ValueCell!1539))

(assert (=> mapNonEmpty!6366 (= (arr!3150 (_values!3418 thiss!1248)) (store mapRest!6366 mapKey!6366 mapValue!6366))))

(declare-fun array_inv!2023 (array!6627) Bool)

(declare-fun array_inv!2024 (array!6629) Bool)

(assert (=> b!166601 (= e!109318 (and tp!14489 tp_is_empty!3765 (array_inv!2023 (_keys!5260 thiss!1248)) (array_inv!2024 (_values!3418 thiss!1248)) e!109319))))

(declare-fun b!166602 () Bool)

(declare-fun res!79183 () Bool)

(assert (=> b!166602 (=> (not res!79183) (not e!109314))))

(assert (=> b!166602 (= res!79183 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16658 res!79186) b!166602))

(assert (= (and b!166602 res!79183) b!166596))

(assert (= (and b!166596 res!79185) b!166599))

(assert (= (and b!166599 c!30226) b!166591))

(assert (= (and b!166599 (not c!30226)) b!166593))

(assert (= (and b!166591 res!79188) b!166597))

(assert (= (and b!166599 res!79182) b!166595))

(assert (= (and b!166595 res!79187) b!166600))

(assert (= (and b!166600 res!79184) b!166594))

(assert (= (and b!166598 condMapEmpty!6366) mapIsEmpty!6366))

(assert (= (and b!166598 (not condMapEmpty!6366)) mapNonEmpty!6366))

(assert (= (and mapNonEmpty!6366 ((_ is ValueCellFull!1539) mapValue!6366)) b!166592))

(assert (= (and b!166598 ((_ is ValueCellFull!1539) mapDefault!6366)) b!166590))

(assert (= b!166601 b!166598))

(assert (= start!16658 b!166601))

(declare-fun m!195991 () Bool)

(assert (=> mapNonEmpty!6366 m!195991))

(declare-fun m!195993 () Bool)

(assert (=> b!166596 m!195993))

(declare-fun m!195995 () Bool)

(assert (=> b!166597 m!195995))

(declare-fun m!195997 () Bool)

(assert (=> b!166591 m!195997))

(declare-fun m!195999 () Bool)

(assert (=> b!166591 m!195999))

(declare-fun m!196001 () Bool)

(assert (=> b!166601 m!196001))

(declare-fun m!196003 () Bool)

(assert (=> b!166601 m!196003))

(declare-fun m!196005 () Bool)

(assert (=> b!166594 m!196005))

(declare-fun m!196007 () Bool)

(assert (=> b!166599 m!196007))

(declare-fun m!196009 () Bool)

(assert (=> b!166599 m!196009))

(assert (=> b!166599 m!196009))

(declare-fun m!196011 () Bool)

(assert (=> b!166599 m!196011))

(declare-fun m!196013 () Bool)

(assert (=> start!16658 m!196013))

(declare-fun m!196015 () Bool)

(assert (=> b!166593 m!196015))

(declare-fun m!196017 () Bool)

(assert (=> b!166600 m!196017))

(check-sat (not b!166600) (not start!16658) (not b!166599) b_and!10377 (not b!166594) (not b!166601) (not b!166593) (not b!166596) (not b_next!3963) (not b!166591) tp_is_empty!3765 (not mapNonEmpty!6366))
(check-sat b_and!10377 (not b_next!3963))
