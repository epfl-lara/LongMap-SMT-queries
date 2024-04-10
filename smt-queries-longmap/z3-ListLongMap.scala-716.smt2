; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16802 () Bool)

(assert start!16802)

(declare-fun b!169265 () Bool)

(declare-fun b_free!4115 () Bool)

(declare-fun b_next!4115 () Bool)

(assert (=> b!169265 (= b_free!4115 (not b_next!4115))))

(declare-fun tp!14950 () Bool)

(declare-fun b_and!10529 () Bool)

(assert (=> b!169265 (= tp!14950 b_and!10529)))

(declare-fun b!169263 () Bool)

(declare-fun b_free!4117 () Bool)

(declare-fun b_next!4117 () Bool)

(assert (=> b!169263 (= b_free!4117 (not b_next!4117))))

(declare-fun tp!14952 () Bool)

(declare-fun b_and!10531 () Bool)

(assert (=> b!169263 (= tp!14952 b_and!10531)))

(declare-fun e!111480 () Bool)

(declare-fun e!111482 () Bool)

(declare-datatypes ((V!4859 0))(
  ( (V!4860 (val!1999 Int)) )
))
(declare-datatypes ((ValueCell!1611 0))(
  ( (ValueCellFull!1611 (v!3864 V!4859)) (EmptyCell!1611) )
))
(declare-datatypes ((array!6915 0))(
  ( (array!6916 (arr!3293 (Array (_ BitVec 32) (_ BitVec 64))) (size!3581 (_ BitVec 32))) )
))
(declare-datatypes ((array!6917 0))(
  ( (array!6918 (arr!3294 (Array (_ BitVec 32) ValueCell!1611)) (size!3582 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2130 0))(
  ( (LongMapFixedSize!2131 (defaultEntry!3507 Int) (mask!8288 (_ BitVec 32)) (extraKeys!3248 (_ BitVec 32)) (zeroValue!3350 V!4859) (minValue!3350 V!4859) (_size!1114 (_ BitVec 32)) (_keys!5332 array!6915) (_values!3490 array!6917) (_vacant!1114 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2130)

(declare-fun tp_is_empty!3909 () Bool)

(declare-fun array_inv!2117 (array!6915) Bool)

(declare-fun array_inv!2118 (array!6917) Bool)

(assert (=> b!169263 (= e!111482 (and tp!14952 tp_is_empty!3909 (array_inv!2117 (_keys!5332 thiss!1248)) (array_inv!2118 (_values!3490 thiss!1248)) e!111480))))

(declare-fun res!80535 () Bool)

(declare-fun e!111477 () Bool)

(assert (=> start!16802 (=> (not res!80535) (not e!111477))))

(declare-fun valid!921 (LongMapFixedSize!2130) Bool)

(assert (=> start!16802 (= res!80535 (valid!921 thiss!1248))))

(assert (=> start!16802 e!111477))

(assert (=> start!16802 e!111482))

(assert (=> start!16802 true))

(declare-fun b!169264 () Bool)

(declare-fun e!111488 () Bool)

(assert (=> b!169264 (= e!111488 tp_is_empty!3909)))

(declare-fun e!111483 () Bool)

(declare-datatypes ((tuple2!3204 0))(
  ( (tuple2!3205 (_1!1613 Bool) (_2!1613 LongMapFixedSize!2130)) )
))
(declare-fun err!55 () tuple2!3204)

(declare-fun e!111484 () Bool)

(assert (=> b!169265 (= e!111484 (and tp!14950 tp_is_empty!3909 (array_inv!2117 (_keys!5332 (_2!1613 err!55))) (array_inv!2118 (_values!3490 (_2!1613 err!55))) e!111483))))

(declare-fun b!169266 () Bool)

(declare-fun e!111485 () Bool)

(assert (=> b!169266 (= e!111485 tp_is_empty!3909)))

(declare-fun mapNonEmpty!6596 () Bool)

(declare-fun mapRes!6596 () Bool)

(declare-fun tp!14949 () Bool)

(declare-fun e!111476 () Bool)

(assert (=> mapNonEmpty!6596 (= mapRes!6596 (and tp!14949 e!111476))))

(declare-fun mapRest!6596 () (Array (_ BitVec 32) ValueCell!1611))

(declare-fun mapValue!6596 () ValueCell!1611)

(declare-fun mapKey!6597 () (_ BitVec 32))

(assert (=> mapNonEmpty!6596 (= (arr!3294 (_values!3490 thiss!1248)) (store mapRest!6596 mapKey!6597 mapValue!6596))))

(declare-fun b!169267 () Bool)

(declare-fun e!111481 () Bool)

(declare-fun e!111486 () Bool)

(assert (=> b!169267 (= e!111481 e!111486)))

(declare-fun res!80534 () Bool)

(assert (=> b!169267 (=> (not res!80534) (not e!111486))))

(declare-fun lt!84876 () tuple2!3204)

(assert (=> b!169267 (= res!80534 (valid!921 (_2!1613 lt!84876)))))

(assert (=> b!169267 (= lt!84876 err!55)))

(assert (=> b!169267 true))

(assert (=> b!169267 e!111484))

(declare-fun mapNonEmpty!6597 () Bool)

(declare-fun mapRes!6597 () Bool)

(declare-fun tp!14951 () Bool)

(assert (=> mapNonEmpty!6597 (= mapRes!6597 (and tp!14951 e!111485))))

(declare-fun mapRest!6597 () (Array (_ BitVec 32) ValueCell!1611))

(declare-fun mapValue!6597 () ValueCell!1611)

(declare-fun mapKey!6596 () (_ BitVec 32))

(assert (=> mapNonEmpty!6597 (= (arr!3294 (_values!3490 (_2!1613 err!55))) (store mapRest!6597 mapKey!6596 mapValue!6597))))

(declare-fun b!169268 () Bool)

(assert (=> b!169268 (= e!111483 (and e!111488 mapRes!6597))))

(declare-fun condMapEmpty!6596 () Bool)

(declare-fun mapDefault!6596 () ValueCell!1611)

(assert (=> b!169268 (= condMapEmpty!6596 (= (arr!3294 (_values!3490 (_2!1613 err!55))) ((as const (Array (_ BitVec 32) ValueCell!1611)) mapDefault!6596)))))

(declare-fun b!169269 () Bool)

(assert (=> b!169269 (= e!111486 false)))

(declare-fun lt!84875 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3206 0))(
  ( (tuple2!3207 (_1!1614 (_ BitVec 64)) (_2!1614 V!4859)) )
))
(declare-datatypes ((List!2180 0))(
  ( (Nil!2177) (Cons!2176 (h!2793 tuple2!3206) (t!6982 List!2180)) )
))
(declare-datatypes ((ListLongMap!2153 0))(
  ( (ListLongMap!2154 (toList!1092 List!2180)) )
))
(declare-fun contains!1134 (ListLongMap!2153 (_ BitVec 64)) Bool)

(declare-fun map!1817 (LongMapFixedSize!2130) ListLongMap!2153)

(assert (=> b!169269 (= lt!84875 (contains!1134 (map!1817 (_2!1613 lt!84876)) key!828))))

(declare-fun mapIsEmpty!6596 () Bool)

(assert (=> mapIsEmpty!6596 mapRes!6597))

(declare-fun b!169270 () Bool)

(declare-fun e!111487 () Bool)

(assert (=> b!169270 (= e!111487 tp_is_empty!3909)))

(declare-fun mapIsEmpty!6597 () Bool)

(assert (=> mapIsEmpty!6597 mapRes!6596))

(declare-fun b!169271 () Bool)

(declare-fun res!80531 () Bool)

(assert (=> b!169271 (=> (not res!80531) (not e!111486))))

(assert (=> b!169271 (= res!80531 (_1!1613 lt!84876))))

(declare-fun b!169272 () Bool)

(declare-fun res!80533 () Bool)

(assert (=> b!169272 (=> (not res!80533) (not e!111477))))

(assert (=> b!169272 (= res!80533 (not (= key!828 (bvneg key!828))))))

(declare-fun b!169273 () Bool)

(assert (=> b!169273 (= e!111476 tp_is_empty!3909)))

(declare-fun b!169274 () Bool)

(assert (=> b!169274 (= e!111477 e!111481)))

(declare-fun res!80532 () Bool)

(assert (=> b!169274 (=> (not res!80532) (not e!111481))))

(declare-datatypes ((SeekEntryResult!521 0))(
  ( (MissingZero!521 (index!4252 (_ BitVec 32))) (Found!521 (index!4253 (_ BitVec 32))) (Intermediate!521 (undefined!1333 Bool) (index!4254 (_ BitVec 32)) (x!18701 (_ BitVec 32))) (Undefined!521) (MissingVacant!521 (index!4255 (_ BitVec 32))) )
))
(declare-fun lt!84877 () SeekEntryResult!521)

(get-info :version)

(assert (=> b!169274 (= res!80532 (and (not ((_ is Undefined!521) lt!84877)) (not ((_ is MissingVacant!521) lt!84877)) (not ((_ is MissingZero!521) lt!84877)) (not ((_ is Found!521) lt!84877))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6915 (_ BitVec 32)) SeekEntryResult!521)

(assert (=> b!169274 (= lt!84877 (seekEntryOrOpen!0 key!828 (_keys!5332 thiss!1248) (mask!8288 thiss!1248)))))

(declare-fun b!169275 () Bool)

(assert (=> b!169275 (= e!111480 (and e!111487 mapRes!6596))))

(declare-fun condMapEmpty!6597 () Bool)

(declare-fun mapDefault!6597 () ValueCell!1611)

(assert (=> b!169275 (= condMapEmpty!6597 (= (arr!3294 (_values!3490 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1611)) mapDefault!6597)))))

(assert (= (and start!16802 res!80535) b!169272))

(assert (= (and b!169272 res!80533) b!169274))

(assert (= (and b!169274 res!80532) b!169267))

(assert (= (and b!169268 condMapEmpty!6596) mapIsEmpty!6596))

(assert (= (and b!169268 (not condMapEmpty!6596)) mapNonEmpty!6597))

(assert (= (and mapNonEmpty!6597 ((_ is ValueCellFull!1611) mapValue!6597)) b!169266))

(assert (= (and b!169268 ((_ is ValueCellFull!1611) mapDefault!6596)) b!169264))

(assert (= b!169265 b!169268))

(assert (= b!169267 b!169265))

(assert (= (and b!169267 res!80534) b!169271))

(assert (= (and b!169271 res!80531) b!169269))

(assert (= (and b!169275 condMapEmpty!6597) mapIsEmpty!6597))

(assert (= (and b!169275 (not condMapEmpty!6597)) mapNonEmpty!6596))

(assert (= (and mapNonEmpty!6596 ((_ is ValueCellFull!1611) mapValue!6596)) b!169273))

(assert (= (and b!169275 ((_ is ValueCellFull!1611) mapDefault!6597)) b!169270))

(assert (= b!169263 b!169275))

(assert (= start!16802 b!169263))

(declare-fun m!198355 () Bool)

(assert (=> mapNonEmpty!6597 m!198355))

(declare-fun m!198357 () Bool)

(assert (=> b!169269 m!198357))

(assert (=> b!169269 m!198357))

(declare-fun m!198359 () Bool)

(assert (=> b!169269 m!198359))

(declare-fun m!198361 () Bool)

(assert (=> b!169267 m!198361))

(declare-fun m!198363 () Bool)

(assert (=> b!169263 m!198363))

(declare-fun m!198365 () Bool)

(assert (=> b!169263 m!198365))

(declare-fun m!198367 () Bool)

(assert (=> b!169274 m!198367))

(declare-fun m!198369 () Bool)

(assert (=> mapNonEmpty!6596 m!198369))

(declare-fun m!198371 () Bool)

(assert (=> start!16802 m!198371))

(declare-fun m!198373 () Bool)

(assert (=> b!169265 m!198373))

(declare-fun m!198375 () Bool)

(assert (=> b!169265 m!198375))

(check-sat (not b!169267) (not start!16802) (not b!169274) (not b!169263) b_and!10529 (not b!169269) tp_is_empty!3909 (not b_next!4117) (not mapNonEmpty!6597) (not mapNonEmpty!6596) b_and!10531 (not b!169265) (not b_next!4115))
(check-sat b_and!10529 b_and!10531 (not b_next!4117) (not b_next!4115))
