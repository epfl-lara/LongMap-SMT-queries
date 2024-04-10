; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16742 () Bool)

(assert start!16742)

(declare-fun b!168228 () Bool)

(declare-fun b_free!4047 () Bool)

(declare-fun b_next!4047 () Bool)

(assert (=> b!168228 (= b_free!4047 (not b_next!4047))))

(declare-fun tp!14741 () Bool)

(declare-fun b_and!10461 () Bool)

(assert (=> b!168228 (= tp!14741 b_and!10461)))

(declare-fun res!80067 () Bool)

(declare-fun e!110574 () Bool)

(assert (=> start!16742 (=> (not res!80067) (not e!110574))))

(declare-datatypes ((V!4779 0))(
  ( (V!4780 (val!1969 Int)) )
))
(declare-datatypes ((ValueCell!1581 0))(
  ( (ValueCellFull!1581 (v!3834 V!4779)) (EmptyCell!1581) )
))
(declare-datatypes ((array!6795 0))(
  ( (array!6796 (arr!3233 (Array (_ BitVec 32) (_ BitVec 64))) (size!3521 (_ BitVec 32))) )
))
(declare-datatypes ((array!6797 0))(
  ( (array!6798 (arr!3234 (Array (_ BitVec 32) ValueCell!1581)) (size!3522 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2070 0))(
  ( (LongMapFixedSize!2071 (defaultEntry!3477 Int) (mask!8238 (_ BitVec 32)) (extraKeys!3218 (_ BitVec 32)) (zeroValue!3320 V!4779) (minValue!3320 V!4779) (_size!1084 (_ BitVec 32)) (_keys!5302 array!6795) (_values!3460 array!6797) (_vacant!1084 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2070)

(declare-fun valid!897 (LongMapFixedSize!2070) Bool)

(assert (=> start!16742 (= res!80067 (valid!897 thiss!1248))))

(assert (=> start!16742 e!110574))

(declare-fun e!110571 () Bool)

(assert (=> start!16742 e!110571))

(assert (=> start!16742 true))

(declare-fun tp_is_empty!3849 () Bool)

(assert (=> start!16742 tp_is_empty!3849))

(declare-fun e!110575 () Bool)

(declare-fun array_inv!2077 (array!6795) Bool)

(declare-fun array_inv!2078 (array!6797) Bool)

(assert (=> b!168228 (= e!110571 (and tp!14741 tp_is_empty!3849 (array_inv!2077 (_keys!5302 thiss!1248)) (array_inv!2078 (_values!3460 thiss!1248)) e!110575))))

(declare-fun b!168229 () Bool)

(declare-fun res!80065 () Bool)

(declare-fun e!110570 () Bool)

(assert (=> b!168229 (=> res!80065 e!110570)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6795 (_ BitVec 32)) Bool)

(assert (=> b!168229 (= res!80065 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5302 thiss!1248) (mask!8238 thiss!1248))))))

(declare-fun b!168230 () Bool)

(declare-fun e!110573 () Bool)

(assert (=> b!168230 (= e!110573 (not e!110570))))

(declare-fun res!80069 () Bool)

(assert (=> b!168230 (=> res!80069 e!110570)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168230 (= res!80069 (not (validMask!0 (mask!8238 thiss!1248))))))

(declare-datatypes ((SeekEntryResult!495 0))(
  ( (MissingZero!495 (index!4148 (_ BitVec 32))) (Found!495 (index!4149 (_ BitVec 32))) (Intermediate!495 (undefined!1307 Bool) (index!4150 (_ BitVec 32)) (x!18595 (_ BitVec 32))) (Undefined!495) (MissingVacant!495 (index!4151 (_ BitVec 32))) )
))
(declare-fun lt!84116 () SeekEntryResult!495)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!4779)

(declare-datatypes ((tuple2!3162 0))(
  ( (tuple2!3163 (_1!1592 (_ BitVec 64)) (_2!1592 V!4779)) )
))
(declare-datatypes ((List!2152 0))(
  ( (Nil!2149) (Cons!2148 (h!2765 tuple2!3162) (t!6954 List!2152)) )
))
(declare-datatypes ((ListLongMap!2117 0))(
  ( (ListLongMap!2118 (toList!1074 List!2152)) )
))
(declare-fun lt!84117 () ListLongMap!2117)

(declare-fun +!226 (ListLongMap!2117 tuple2!3162) ListLongMap!2117)

(declare-fun getCurrentListMap!732 (array!6795 array!6797 (_ BitVec 32) (_ BitVec 32) V!4779 V!4779 (_ BitVec 32) Int) ListLongMap!2117)

(assert (=> b!168230 (= (+!226 lt!84117 (tuple2!3163 key!828 v!309)) (getCurrentListMap!732 (_keys!5302 thiss!1248) (array!6798 (store (arr!3234 (_values!3460 thiss!1248)) (index!4149 lt!84116) (ValueCellFull!1581 v!309)) (size!3522 (_values!3460 thiss!1248))) (mask!8238 thiss!1248) (extraKeys!3218 thiss!1248) (zeroValue!3320 thiss!1248) (minValue!3320 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3477 thiss!1248)))))

(declare-datatypes ((Unit!5169 0))(
  ( (Unit!5170) )
))
(declare-fun lt!84114 () Unit!5169)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!81 (array!6795 array!6797 (_ BitVec 32) (_ BitVec 32) V!4779 V!4779 (_ BitVec 32) (_ BitVec 64) V!4779 Int) Unit!5169)

(assert (=> b!168230 (= lt!84114 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!81 (_keys!5302 thiss!1248) (_values!3460 thiss!1248) (mask!8238 thiss!1248) (extraKeys!3218 thiss!1248) (zeroValue!3320 thiss!1248) (minValue!3320 thiss!1248) (index!4149 lt!84116) key!828 v!309 (defaultEntry!3477 thiss!1248)))))

(declare-fun lt!84113 () Unit!5169)

(declare-fun e!110577 () Unit!5169)

(assert (=> b!168230 (= lt!84113 e!110577)))

(declare-fun c!30352 () Bool)

(declare-fun contains!1116 (ListLongMap!2117 (_ BitVec 64)) Bool)

(assert (=> b!168230 (= c!30352 (contains!1116 lt!84117 key!828))))

(assert (=> b!168230 (= lt!84117 (getCurrentListMap!732 (_keys!5302 thiss!1248) (_values!3460 thiss!1248) (mask!8238 thiss!1248) (extraKeys!3218 thiss!1248) (zeroValue!3320 thiss!1248) (minValue!3320 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3477 thiss!1248)))))

(declare-fun b!168231 () Bool)

(declare-fun e!110572 () Bool)

(assert (=> b!168231 (= e!110572 tp_is_empty!3849)))

(declare-fun b!168232 () Bool)

(assert (=> b!168232 (= e!110574 e!110573)))

(declare-fun res!80068 () Bool)

(assert (=> b!168232 (=> (not res!80068) (not e!110573))))

(get-info :version)

(assert (=> b!168232 (= res!80068 (and (not ((_ is Undefined!495) lt!84116)) (not ((_ is MissingVacant!495) lt!84116)) (not ((_ is MissingZero!495) lt!84116)) ((_ is Found!495) lt!84116)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6795 (_ BitVec 32)) SeekEntryResult!495)

(assert (=> b!168232 (= lt!84116 (seekEntryOrOpen!0 key!828 (_keys!5302 thiss!1248) (mask!8238 thiss!1248)))))

(declare-fun e!110578 () Bool)

(declare-fun b!168233 () Bool)

(assert (=> b!168233 (= e!110578 (= (select (arr!3233 (_keys!5302 thiss!1248)) (index!4149 lt!84116)) key!828))))

(declare-fun b!168234 () Bool)

(declare-fun res!80064 () Bool)

(assert (=> b!168234 (=> (not res!80064) (not e!110574))))

(assert (=> b!168234 (= res!80064 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168235 () Bool)

(declare-fun res!80066 () Bool)

(assert (=> b!168235 (=> res!80066 e!110570)))

(assert (=> b!168235 (= res!80066 (or (not (= (size!3522 (_values!3460 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8238 thiss!1248)))) (not (= (size!3521 (_keys!5302 thiss!1248)) (size!3522 (_values!3460 thiss!1248)))) (bvslt (mask!8238 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3218 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3218 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!168236 () Bool)

(declare-fun Unit!5171 () Unit!5169)

(assert (=> b!168236 (= e!110577 Unit!5171)))

(declare-fun lt!84112 () Unit!5169)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!120 (array!6795 array!6797 (_ BitVec 32) (_ BitVec 32) V!4779 V!4779 (_ BitVec 64) Int) Unit!5169)

(assert (=> b!168236 (= lt!84112 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!120 (_keys!5302 thiss!1248) (_values!3460 thiss!1248) (mask!8238 thiss!1248) (extraKeys!3218 thiss!1248) (zeroValue!3320 thiss!1248) (minValue!3320 thiss!1248) key!828 (defaultEntry!3477 thiss!1248)))))

(assert (=> b!168236 false))

(declare-fun mapIsEmpty!6492 () Bool)

(declare-fun mapRes!6492 () Bool)

(assert (=> mapIsEmpty!6492 mapRes!6492))

(declare-fun b!168237 () Bool)

(declare-fun e!110576 () Bool)

(assert (=> b!168237 (= e!110576 tp_is_empty!3849)))

(declare-fun b!168238 () Bool)

(declare-fun lt!84118 () Unit!5169)

(assert (=> b!168238 (= e!110577 lt!84118)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!118 (array!6795 array!6797 (_ BitVec 32) (_ BitVec 32) V!4779 V!4779 (_ BitVec 64) Int) Unit!5169)

(assert (=> b!168238 (= lt!84118 (lemmaInListMapThenSeekEntryOrOpenFindsIt!118 (_keys!5302 thiss!1248) (_values!3460 thiss!1248) (mask!8238 thiss!1248) (extraKeys!3218 thiss!1248) (zeroValue!3320 thiss!1248) (minValue!3320 thiss!1248) key!828 (defaultEntry!3477 thiss!1248)))))

(declare-fun res!80070 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168238 (= res!80070 (inRange!0 (index!4149 lt!84116) (mask!8238 thiss!1248)))))

(assert (=> b!168238 (=> (not res!80070) (not e!110578))))

(assert (=> b!168238 e!110578))

(declare-fun b!168239 () Bool)

(assert (=> b!168239 (= e!110570 true)))

(declare-fun lt!84115 () Bool)

(declare-datatypes ((List!2153 0))(
  ( (Nil!2150) (Cons!2149 (h!2766 (_ BitVec 64)) (t!6955 List!2153)) )
))
(declare-fun arrayNoDuplicates!0 (array!6795 (_ BitVec 32) List!2153) Bool)

(assert (=> b!168239 (= lt!84115 (arrayNoDuplicates!0 (_keys!5302 thiss!1248) #b00000000000000000000000000000000 Nil!2150))))

(declare-fun b!168240 () Bool)

(assert (=> b!168240 (= e!110575 (and e!110576 mapRes!6492))))

(declare-fun condMapEmpty!6492 () Bool)

(declare-fun mapDefault!6492 () ValueCell!1581)

(assert (=> b!168240 (= condMapEmpty!6492 (= (arr!3234 (_values!3460 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1581)) mapDefault!6492)))))

(declare-fun mapNonEmpty!6492 () Bool)

(declare-fun tp!14742 () Bool)

(assert (=> mapNonEmpty!6492 (= mapRes!6492 (and tp!14742 e!110572))))

(declare-fun mapRest!6492 () (Array (_ BitVec 32) ValueCell!1581))

(declare-fun mapKey!6492 () (_ BitVec 32))

(declare-fun mapValue!6492 () ValueCell!1581)

(assert (=> mapNonEmpty!6492 (= (arr!3234 (_values!3460 thiss!1248)) (store mapRest!6492 mapKey!6492 mapValue!6492))))

(assert (= (and start!16742 res!80067) b!168234))

(assert (= (and b!168234 res!80064) b!168232))

(assert (= (and b!168232 res!80068) b!168230))

(assert (= (and b!168230 c!30352) b!168238))

(assert (= (and b!168230 (not c!30352)) b!168236))

(assert (= (and b!168238 res!80070) b!168233))

(assert (= (and b!168230 (not res!80069)) b!168235))

(assert (= (and b!168235 (not res!80066)) b!168229))

(assert (= (and b!168229 (not res!80065)) b!168239))

(assert (= (and b!168240 condMapEmpty!6492) mapIsEmpty!6492))

(assert (= (and b!168240 (not condMapEmpty!6492)) mapNonEmpty!6492))

(assert (= (and mapNonEmpty!6492 ((_ is ValueCellFull!1581) mapValue!6492)) b!168231))

(assert (= (and b!168240 ((_ is ValueCellFull!1581) mapDefault!6492)) b!168237))

(assert (= b!168228 b!168240))

(assert (= start!16742 b!168228))

(declare-fun m!197319 () Bool)

(assert (=> b!168228 m!197319))

(declare-fun m!197321 () Bool)

(assert (=> b!168228 m!197321))

(declare-fun m!197323 () Bool)

(assert (=> b!168232 m!197323))

(declare-fun m!197325 () Bool)

(assert (=> mapNonEmpty!6492 m!197325))

(declare-fun m!197327 () Bool)

(assert (=> b!168229 m!197327))

(declare-fun m!197329 () Bool)

(assert (=> b!168230 m!197329))

(declare-fun m!197331 () Bool)

(assert (=> b!168230 m!197331))

(declare-fun m!197333 () Bool)

(assert (=> b!168230 m!197333))

(declare-fun m!197335 () Bool)

(assert (=> b!168230 m!197335))

(declare-fun m!197337 () Bool)

(assert (=> b!168230 m!197337))

(declare-fun m!197339 () Bool)

(assert (=> b!168230 m!197339))

(declare-fun m!197341 () Bool)

(assert (=> b!168230 m!197341))

(declare-fun m!197343 () Bool)

(assert (=> b!168238 m!197343))

(declare-fun m!197345 () Bool)

(assert (=> b!168238 m!197345))

(declare-fun m!197347 () Bool)

(assert (=> b!168233 m!197347))

(declare-fun m!197349 () Bool)

(assert (=> b!168239 m!197349))

(declare-fun m!197351 () Bool)

(assert (=> b!168236 m!197351))

(declare-fun m!197353 () Bool)

(assert (=> start!16742 m!197353))

(check-sat tp_is_empty!3849 (not b!168230) (not b!168232) (not start!16742) (not b!168229) (not b_next!4047) (not b!168238) (not b!168228) (not b!168239) b_and!10461 (not mapNonEmpty!6492) (not b!168236))
(check-sat b_and!10461 (not b_next!4047))
