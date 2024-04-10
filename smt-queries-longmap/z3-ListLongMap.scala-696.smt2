; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16682 () Bool)

(assert start!16682)

(declare-fun b!167069 () Bool)

(declare-fun b_free!3987 () Bool)

(declare-fun b_next!3987 () Bool)

(assert (=> b!167069 (= b_free!3987 (not b_next!3987))))

(declare-fun tp!14562 () Bool)

(declare-fun b_and!10401 () Bool)

(assert (=> b!167069 (= tp!14562 b_and!10401)))

(declare-fun b!167059 () Bool)

(declare-fun e!109675 () Bool)

(declare-fun e!109674 () Bool)

(declare-fun mapRes!6402 () Bool)

(assert (=> b!167059 (= e!109675 (and e!109674 mapRes!6402))))

(declare-fun condMapEmpty!6402 () Bool)

(declare-datatypes ((V!4699 0))(
  ( (V!4700 (val!1939 Int)) )
))
(declare-datatypes ((ValueCell!1551 0))(
  ( (ValueCellFull!1551 (v!3804 V!4699)) (EmptyCell!1551) )
))
(declare-datatypes ((array!6675 0))(
  ( (array!6676 (arr!3173 (Array (_ BitVec 32) (_ BitVec 64))) (size!3461 (_ BitVec 32))) )
))
(declare-datatypes ((array!6677 0))(
  ( (array!6678 (arr!3174 (Array (_ BitVec 32) ValueCell!1551)) (size!3462 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2010 0))(
  ( (LongMapFixedSize!2011 (defaultEntry!3447 Int) (mask!8188 (_ BitVec 32)) (extraKeys!3188 (_ BitVec 32)) (zeroValue!3290 V!4699) (minValue!3290 V!4699) (_size!1054 (_ BitVec 32)) (_keys!5272 array!6675) (_values!3430 array!6677) (_vacant!1054 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2010)

(declare-fun mapDefault!6402 () ValueCell!1551)

(assert (=> b!167059 (= condMapEmpty!6402 (= (arr!3174 (_values!3430 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1551)) mapDefault!6402)))))

(declare-fun b!167060 () Bool)

(declare-datatypes ((Unit!5101 0))(
  ( (Unit!5102) )
))
(declare-fun e!109679 () Unit!5101)

(declare-fun lt!83546 () Unit!5101)

(assert (=> b!167060 (= e!109679 lt!83546)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!98 (array!6675 array!6677 (_ BitVec 32) (_ BitVec 32) V!4699 V!4699 (_ BitVec 64) Int) Unit!5101)

(assert (=> b!167060 (= lt!83546 (lemmaInListMapThenSeekEntryOrOpenFindsIt!98 (_keys!5272 thiss!1248) (_values!3430 thiss!1248) (mask!8188 thiss!1248) (extraKeys!3188 thiss!1248) (zeroValue!3290 thiss!1248) (minValue!3290 thiss!1248) key!828 (defaultEntry!3447 thiss!1248)))))

(declare-fun res!79438 () Bool)

(declare-datatypes ((SeekEntryResult!470 0))(
  ( (MissingZero!470 (index!4048 (_ BitVec 32))) (Found!470 (index!4049 (_ BitVec 32))) (Intermediate!470 (undefined!1282 Bool) (index!4050 (_ BitVec 32)) (x!18490 (_ BitVec 32))) (Undefined!470) (MissingVacant!470 (index!4051 (_ BitVec 32))) )
))
(declare-fun lt!83544 () SeekEntryResult!470)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167060 (= res!79438 (inRange!0 (index!4049 lt!83544) (mask!8188 thiss!1248)))))

(declare-fun e!109671 () Bool)

(assert (=> b!167060 (=> (not res!79438) (not e!109671))))

(assert (=> b!167060 e!109671))

(declare-fun b!167061 () Bool)

(declare-fun e!109677 () Bool)

(assert (=> b!167061 (= e!109677 false)))

(declare-fun lt!83545 () Bool)

(declare-datatypes ((List!2114 0))(
  ( (Nil!2111) (Cons!2110 (h!2727 (_ BitVec 64)) (t!6916 List!2114)) )
))
(declare-fun arrayNoDuplicates!0 (array!6675 (_ BitVec 32) List!2114) Bool)

(assert (=> b!167061 (= lt!83545 (arrayNoDuplicates!0 (_keys!5272 thiss!1248) #b00000000000000000000000000000000 Nil!2111))))

(declare-fun b!167062 () Bool)

(declare-fun e!109676 () Bool)

(declare-fun e!109673 () Bool)

(assert (=> b!167062 (= e!109676 e!109673)))

(declare-fun res!79435 () Bool)

(assert (=> b!167062 (=> (not res!79435) (not e!109673))))

(get-info :version)

(assert (=> b!167062 (= res!79435 (and (not ((_ is Undefined!470) lt!83544)) (not ((_ is MissingVacant!470) lt!83544)) (not ((_ is MissingZero!470) lt!83544)) ((_ is Found!470) lt!83544)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6675 (_ BitVec 32)) SeekEntryResult!470)

(assert (=> b!167062 (= lt!83544 (seekEntryOrOpen!0 key!828 (_keys!5272 thiss!1248) (mask!8188 thiss!1248)))))

(declare-fun b!167063 () Bool)

(declare-fun res!79437 () Bool)

(assert (=> b!167063 (=> (not res!79437) (not e!109677))))

(assert (=> b!167063 (= res!79437 (and (= (size!3462 (_values!3430 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8188 thiss!1248))) (= (size!3461 (_keys!5272 thiss!1248)) (size!3462 (_values!3430 thiss!1248))) (bvsge (mask!8188 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3188 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3188 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167064 () Bool)

(assert (=> b!167064 (= e!109671 (= (select (arr!3173 (_keys!5272 thiss!1248)) (index!4049 lt!83544)) key!828))))

(declare-fun res!79436 () Bool)

(assert (=> start!16682 (=> (not res!79436) (not e!109676))))

(declare-fun valid!880 (LongMapFixedSize!2010) Bool)

(assert (=> start!16682 (= res!79436 (valid!880 thiss!1248))))

(assert (=> start!16682 e!109676))

(declare-fun e!109670 () Bool)

(assert (=> start!16682 e!109670))

(assert (=> start!16682 true))

(declare-fun b!167058 () Bool)

(declare-fun tp_is_empty!3789 () Bool)

(assert (=> b!167058 (= e!109674 tp_is_empty!3789)))

(declare-fun b!167065 () Bool)

(declare-fun res!79439 () Bool)

(assert (=> b!167065 (=> (not res!79439) (not e!109676))))

(assert (=> b!167065 (= res!79439 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167066 () Bool)

(declare-fun Unit!5103 () Unit!5101)

(assert (=> b!167066 (= e!109679 Unit!5103)))

(declare-fun lt!83548 () Unit!5101)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!100 (array!6675 array!6677 (_ BitVec 32) (_ BitVec 32) V!4699 V!4699 (_ BitVec 64) Int) Unit!5101)

(assert (=> b!167066 (= lt!83548 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!100 (_keys!5272 thiss!1248) (_values!3430 thiss!1248) (mask!8188 thiss!1248) (extraKeys!3188 thiss!1248) (zeroValue!3290 thiss!1248) (minValue!3290 thiss!1248) key!828 (defaultEntry!3447 thiss!1248)))))

(assert (=> b!167066 false))

(declare-fun mapIsEmpty!6402 () Bool)

(assert (=> mapIsEmpty!6402 mapRes!6402))

(declare-fun b!167067 () Bool)

(declare-fun e!109672 () Bool)

(assert (=> b!167067 (= e!109672 tp_is_empty!3789)))

(declare-fun b!167068 () Bool)

(assert (=> b!167068 (= e!109673 e!109677)))

(declare-fun res!79440 () Bool)

(assert (=> b!167068 (=> (not res!79440) (not e!109677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167068 (= res!79440 (validMask!0 (mask!8188 thiss!1248)))))

(declare-fun lt!83547 () Unit!5101)

(assert (=> b!167068 (= lt!83547 e!109679)))

(declare-fun c!30262 () Bool)

(declare-datatypes ((tuple2!3128 0))(
  ( (tuple2!3129 (_1!1575 (_ BitVec 64)) (_2!1575 V!4699)) )
))
(declare-datatypes ((List!2115 0))(
  ( (Nil!2112) (Cons!2111 (h!2728 tuple2!3128) (t!6917 List!2115)) )
))
(declare-datatypes ((ListLongMap!2083 0))(
  ( (ListLongMap!2084 (toList!1057 List!2115)) )
))
(declare-fun contains!1099 (ListLongMap!2083 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!715 (array!6675 array!6677 (_ BitVec 32) (_ BitVec 32) V!4699 V!4699 (_ BitVec 32) Int) ListLongMap!2083)

(assert (=> b!167068 (= c!30262 (contains!1099 (getCurrentListMap!715 (_keys!5272 thiss!1248) (_values!3430 thiss!1248) (mask!8188 thiss!1248) (extraKeys!3188 thiss!1248) (zeroValue!3290 thiss!1248) (minValue!3290 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3447 thiss!1248)) key!828))))

(declare-fun array_inv!2039 (array!6675) Bool)

(declare-fun array_inv!2040 (array!6677) Bool)

(assert (=> b!167069 (= e!109670 (and tp!14562 tp_is_empty!3789 (array_inv!2039 (_keys!5272 thiss!1248)) (array_inv!2040 (_values!3430 thiss!1248)) e!109675))))

(declare-fun b!167070 () Bool)

(declare-fun res!79434 () Bool)

(assert (=> b!167070 (=> (not res!79434) (not e!109677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6675 (_ BitVec 32)) Bool)

(assert (=> b!167070 (= res!79434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5272 thiss!1248) (mask!8188 thiss!1248)))))

(declare-fun mapNonEmpty!6402 () Bool)

(declare-fun tp!14561 () Bool)

(assert (=> mapNonEmpty!6402 (= mapRes!6402 (and tp!14561 e!109672))))

(declare-fun mapKey!6402 () (_ BitVec 32))

(declare-fun mapRest!6402 () (Array (_ BitVec 32) ValueCell!1551))

(declare-fun mapValue!6402 () ValueCell!1551)

(assert (=> mapNonEmpty!6402 (= (arr!3174 (_values!3430 thiss!1248)) (store mapRest!6402 mapKey!6402 mapValue!6402))))

(assert (= (and start!16682 res!79436) b!167065))

(assert (= (and b!167065 res!79439) b!167062))

(assert (= (and b!167062 res!79435) b!167068))

(assert (= (and b!167068 c!30262) b!167060))

(assert (= (and b!167068 (not c!30262)) b!167066))

(assert (= (and b!167060 res!79438) b!167064))

(assert (= (and b!167068 res!79440) b!167063))

(assert (= (and b!167063 res!79437) b!167070))

(assert (= (and b!167070 res!79434) b!167061))

(assert (= (and b!167059 condMapEmpty!6402) mapIsEmpty!6402))

(assert (= (and b!167059 (not condMapEmpty!6402)) mapNonEmpty!6402))

(assert (= (and mapNonEmpty!6402 ((_ is ValueCellFull!1551) mapValue!6402)) b!167067))

(assert (= (and b!167059 ((_ is ValueCellFull!1551) mapDefault!6402)) b!167058))

(assert (= b!167069 b!167059))

(assert (= start!16682 b!167069))

(declare-fun m!196327 () Bool)

(assert (=> b!167061 m!196327))

(declare-fun m!196329 () Bool)

(assert (=> b!167070 m!196329))

(declare-fun m!196331 () Bool)

(assert (=> b!167062 m!196331))

(declare-fun m!196333 () Bool)

(assert (=> b!167068 m!196333))

(declare-fun m!196335 () Bool)

(assert (=> b!167068 m!196335))

(assert (=> b!167068 m!196335))

(declare-fun m!196337 () Bool)

(assert (=> b!167068 m!196337))

(declare-fun m!196339 () Bool)

(assert (=> start!16682 m!196339))

(declare-fun m!196341 () Bool)

(assert (=> b!167066 m!196341))

(declare-fun m!196343 () Bool)

(assert (=> b!167060 m!196343))

(declare-fun m!196345 () Bool)

(assert (=> b!167060 m!196345))

(declare-fun m!196347 () Bool)

(assert (=> b!167069 m!196347))

(declare-fun m!196349 () Bool)

(assert (=> b!167069 m!196349))

(declare-fun m!196351 () Bool)

(assert (=> mapNonEmpty!6402 m!196351))

(declare-fun m!196353 () Bool)

(assert (=> b!167064 m!196353))

(check-sat (not b_next!3987) tp_is_empty!3789 (not b!167062) (not b!167070) (not b!167068) (not mapNonEmpty!6402) (not b!167069) (not start!16682) (not b!167060) (not b!167061) b_and!10401 (not b!167066))
(check-sat b_and!10401 (not b_next!3987))
