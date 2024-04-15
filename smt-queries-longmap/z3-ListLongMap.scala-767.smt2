; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18074 () Bool)

(assert start!18074)

(declare-fun b!179795 () Bool)

(declare-fun b_free!4441 () Bool)

(declare-fun b_next!4441 () Bool)

(assert (=> b!179795 (= b_free!4441 (not b_next!4441))))

(declare-fun tp!16053 () Bool)

(declare-fun b_and!10949 () Bool)

(assert (=> b!179795 (= tp!16053 b_and!10949)))

(declare-fun b!179791 () Bool)

(declare-fun e!118404 () Bool)

(declare-fun e!118401 () Bool)

(declare-fun mapRes!7213 () Bool)

(assert (=> b!179791 (= e!118404 (and e!118401 mapRes!7213))))

(declare-fun condMapEmpty!7213 () Bool)

(declare-datatypes ((V!5265 0))(
  ( (V!5266 (val!2151 Int)) )
))
(declare-datatypes ((ValueCell!1763 0))(
  ( (ValueCellFull!1763 (v!4034 V!5265)) (EmptyCell!1763) )
))
(declare-datatypes ((array!7575 0))(
  ( (array!7576 (arr!3586 (Array (_ BitVec 32) (_ BitVec 64))) (size!3895 (_ BitVec 32))) )
))
(declare-datatypes ((array!7577 0))(
  ( (array!7578 (arr!3587 (Array (_ BitVec 32) ValueCell!1763)) (size!3896 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2434 0))(
  ( (LongMapFixedSize!2435 (defaultEntry!3693 Int) (mask!8685 (_ BitVec 32)) (extraKeys!3430 (_ BitVec 32)) (zeroValue!3534 V!5265) (minValue!3534 V!5265) (_size!1266 (_ BitVec 32)) (_keys!5583 array!7575) (_values!3676 array!7577) (_vacant!1266 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2434)

(declare-fun mapDefault!7213 () ValueCell!1763)

(assert (=> b!179791 (= condMapEmpty!7213 (= (arr!3587 (_values!3676 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1763)) mapDefault!7213)))))

(declare-fun mapIsEmpty!7213 () Bool)

(assert (=> mapIsEmpty!7213 mapRes!7213))

(declare-fun b!179793 () Bool)

(declare-fun e!118403 () Bool)

(assert (=> b!179793 (= e!118403 false)))

(declare-datatypes ((tuple2!3322 0))(
  ( (tuple2!3323 (_1!1672 (_ BitVec 64)) (_2!1672 V!5265)) )
))
(declare-datatypes ((List!2285 0))(
  ( (Nil!2282) (Cons!2281 (h!2906 tuple2!3322) (t!7124 List!2285)) )
))
(declare-datatypes ((ListLongMap!2241 0))(
  ( (ListLongMap!2242 (toList!1136 List!2285)) )
))
(declare-fun lt!88672 () ListLongMap!2241)

(declare-fun map!1909 (LongMapFixedSize!2434) ListLongMap!2241)

(assert (=> b!179793 (= lt!88672 (map!1909 thiss!1248))))

(declare-datatypes ((Unit!5445 0))(
  ( (Unit!5446) )
))
(declare-fun lt!88671 () Unit!5445)

(declare-fun e!118400 () Unit!5445)

(assert (=> b!179793 (= lt!88671 e!118400)))

(declare-fun c!32214 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun contains!1217 (ListLongMap!2241 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!772 (array!7575 array!7577 (_ BitVec 32) (_ BitVec 32) V!5265 V!5265 (_ BitVec 32) Int) ListLongMap!2241)

(assert (=> b!179793 (= c!32214 (contains!1217 (getCurrentListMap!772 (_keys!5583 thiss!1248) (_values!3676 thiss!1248) (mask!8685 thiss!1248) (extraKeys!3430 thiss!1248) (zeroValue!3534 thiss!1248) (minValue!3534 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3693 thiss!1248)) key!828))))

(declare-fun b!179794 () Bool)

(declare-fun tp_is_empty!4213 () Bool)

(assert (=> b!179794 (= e!118401 tp_is_empty!4213)))

(declare-fun mapNonEmpty!7213 () Bool)

(declare-fun tp!16054 () Bool)

(declare-fun e!118405 () Bool)

(assert (=> mapNonEmpty!7213 (= mapRes!7213 (and tp!16054 e!118405))))

(declare-fun mapValue!7213 () ValueCell!1763)

(declare-fun mapKey!7213 () (_ BitVec 32))

(declare-fun mapRest!7213 () (Array (_ BitVec 32) ValueCell!1763))

(assert (=> mapNonEmpty!7213 (= (arr!3587 (_values!3676 thiss!1248)) (store mapRest!7213 mapKey!7213 mapValue!7213))))

(declare-fun e!118406 () Bool)

(declare-fun array_inv!2323 (array!7575) Bool)

(declare-fun array_inv!2324 (array!7577) Bool)

(assert (=> b!179795 (= e!118406 (and tp!16053 tp_is_empty!4213 (array_inv!2323 (_keys!5583 thiss!1248)) (array_inv!2324 (_values!3676 thiss!1248)) e!118404))))

(declare-fun b!179796 () Bool)

(declare-fun res!85151 () Bool)

(assert (=> b!179796 (=> (not res!85151) (not e!118403))))

(assert (=> b!179796 (= res!85151 (not (= key!828 (bvneg key!828))))))

(declare-fun b!179797 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!133 (array!7575 array!7577 (_ BitVec 32) (_ BitVec 32) V!5265 V!5265 (_ BitVec 64) Int) Unit!5445)

(assert (=> b!179797 (= e!118400 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!133 (_keys!5583 thiss!1248) (_values!3676 thiss!1248) (mask!8685 thiss!1248) (extraKeys!3430 thiss!1248) (zeroValue!3534 thiss!1248) (minValue!3534 thiss!1248) key!828 (defaultEntry!3693 thiss!1248)))))

(declare-fun res!85149 () Bool)

(assert (=> start!18074 (=> (not res!85149) (not e!118403))))

(declare-fun valid!1032 (LongMapFixedSize!2434) Bool)

(assert (=> start!18074 (= res!85149 (valid!1032 thiss!1248))))

(assert (=> start!18074 e!118403))

(assert (=> start!18074 e!118406))

(assert (=> start!18074 true))

(declare-fun b!179792 () Bool)

(declare-fun res!85150 () Bool)

(assert (=> b!179792 (=> (not res!85150) (not e!118403))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!597 0))(
  ( (MissingZero!597 (index!4556 (_ BitVec 32))) (Found!597 (index!4557 (_ BitVec 32))) (Intermediate!597 (undefined!1409 Bool) (index!4558 (_ BitVec 32)) (x!19678 (_ BitVec 32))) (Undefined!597) (MissingVacant!597 (index!4559 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7575 (_ BitVec 32)) SeekEntryResult!597)

(assert (=> b!179792 (= res!85150 ((_ is Undefined!597) (seekEntryOrOpen!0 key!828 (_keys!5583 thiss!1248) (mask!8685 thiss!1248))))))

(declare-fun b!179798 () Bool)

(assert (=> b!179798 (= e!118405 tp_is_empty!4213)))

(declare-fun b!179799 () Bool)

(declare-fun Unit!5447 () Unit!5445)

(assert (=> b!179799 (= e!118400 Unit!5447)))

(declare-fun lt!88670 () Unit!5445)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!138 (array!7575 array!7577 (_ BitVec 32) (_ BitVec 32) V!5265 V!5265 (_ BitVec 64) Int) Unit!5445)

(assert (=> b!179799 (= lt!88670 (lemmaInListMapThenSeekEntryOrOpenFindsIt!138 (_keys!5583 thiss!1248) (_values!3676 thiss!1248) (mask!8685 thiss!1248) (extraKeys!3430 thiss!1248) (zeroValue!3534 thiss!1248) (minValue!3534 thiss!1248) key!828 (defaultEntry!3693 thiss!1248)))))

(assert (=> b!179799 false))

(assert (= (and start!18074 res!85149) b!179796))

(assert (= (and b!179796 res!85151) b!179792))

(assert (= (and b!179792 res!85150) b!179793))

(assert (= (and b!179793 c!32214) b!179799))

(assert (= (and b!179793 (not c!32214)) b!179797))

(assert (= (and b!179791 condMapEmpty!7213) mapIsEmpty!7213))

(assert (= (and b!179791 (not condMapEmpty!7213)) mapNonEmpty!7213))

(assert (= (and mapNonEmpty!7213 ((_ is ValueCellFull!1763) mapValue!7213)) b!179798))

(assert (= (and b!179791 ((_ is ValueCellFull!1763) mapDefault!7213)) b!179794))

(assert (= b!179795 b!179791))

(assert (= start!18074 b!179795))

(declare-fun m!207405 () Bool)

(assert (=> b!179795 m!207405))

(declare-fun m!207407 () Bool)

(assert (=> b!179795 m!207407))

(declare-fun m!207409 () Bool)

(assert (=> start!18074 m!207409))

(declare-fun m!207411 () Bool)

(assert (=> b!179793 m!207411))

(declare-fun m!207413 () Bool)

(assert (=> b!179793 m!207413))

(assert (=> b!179793 m!207413))

(declare-fun m!207415 () Bool)

(assert (=> b!179793 m!207415))

(declare-fun m!207417 () Bool)

(assert (=> b!179799 m!207417))

(declare-fun m!207419 () Bool)

(assert (=> b!179797 m!207419))

(declare-fun m!207421 () Bool)

(assert (=> b!179792 m!207421))

(declare-fun m!207423 () Bool)

(assert (=> mapNonEmpty!7213 m!207423))

(check-sat (not b!179793) (not b!179799) (not b!179795) (not start!18074) (not b!179792) b_and!10949 (not mapNonEmpty!7213) tp_is_empty!4213 (not b_next!4441) (not b!179797))
(check-sat b_and!10949 (not b_next!4441))
