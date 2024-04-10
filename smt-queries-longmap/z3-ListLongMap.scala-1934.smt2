; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34300 () Bool)

(assert start!34300)

(declare-fun b_free!7275 () Bool)

(declare-fun b_next!7275 () Bool)

(assert (=> start!34300 (= b_free!7275 (not b_next!7275))))

(declare-fun tp!25365 () Bool)

(declare-fun b_and!14479 () Bool)

(assert (=> start!34300 (= tp!25365 b_and!14479)))

(declare-fun b!342191 () Bool)

(declare-fun e!209851 () Bool)

(declare-fun tp_is_empty!7227 () Bool)

(assert (=> b!342191 (= e!209851 tp_is_empty!7227)))

(declare-fun b!342192 () Bool)

(declare-fun e!209853 () Bool)

(assert (=> b!342192 (= e!209853 false)))

(declare-datatypes ((Unit!10638 0))(
  ( (Unit!10639) )
))
(declare-fun lt!162086 () Unit!10638)

(declare-fun e!209849 () Unit!10638)

(assert (=> b!342192 (= lt!162086 e!209849)))

(declare-fun c!52794 () Bool)

(declare-datatypes ((array!18051 0))(
  ( (array!18052 (arr!8544 (Array (_ BitVec 32) (_ BitVec 64))) (size!8896 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18051)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342192 (= c!52794 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12273 () Bool)

(declare-fun mapRes!12273 () Bool)

(declare-fun tp!25364 () Bool)

(assert (=> mapNonEmpty!12273 (= mapRes!12273 (and tp!25364 e!209851))))

(declare-fun mapKey!12273 () (_ BitVec 32))

(declare-datatypes ((V!10613 0))(
  ( (V!10614 (val!3658 Int)) )
))
(declare-datatypes ((ValueCell!3270 0))(
  ( (ValueCellFull!3270 (v!5832 V!10613)) (EmptyCell!3270) )
))
(declare-datatypes ((array!18053 0))(
  ( (array!18054 (arr!8545 (Array (_ BitVec 32) ValueCell!3270)) (size!8897 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18053)

(declare-fun mapRest!12273 () (Array (_ BitVec 32) ValueCell!3270))

(declare-fun mapValue!12273 () ValueCell!3270)

(assert (=> mapNonEmpty!12273 (= (arr!8545 _values!1525) (store mapRest!12273 mapKey!12273 mapValue!12273))))

(declare-fun res!189148 () Bool)

(declare-fun e!209852 () Bool)

(assert (=> start!34300 (=> (not res!189148) (not e!209852))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34300 (= res!189148 (validMask!0 mask!2385))))

(assert (=> start!34300 e!209852))

(assert (=> start!34300 true))

(assert (=> start!34300 tp_is_empty!7227))

(assert (=> start!34300 tp!25365))

(declare-fun e!209847 () Bool)

(declare-fun array_inv!6326 (array!18053) Bool)

(assert (=> start!34300 (and (array_inv!6326 _values!1525) e!209847)))

(declare-fun array_inv!6327 (array!18051) Bool)

(assert (=> start!34300 (array_inv!6327 _keys!1895)))

(declare-fun b!342193 () Bool)

(declare-fun res!189143 () Bool)

(assert (=> b!342193 (=> (not res!189143) (not e!209852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342193 (= res!189143 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12273 () Bool)

(assert (=> mapIsEmpty!12273 mapRes!12273))

(declare-fun b!342194 () Bool)

(declare-fun e!209848 () Bool)

(assert (=> b!342194 (= e!209847 (and e!209848 mapRes!12273))))

(declare-fun condMapEmpty!12273 () Bool)

(declare-fun mapDefault!12273 () ValueCell!3270)

(assert (=> b!342194 (= condMapEmpty!12273 (= (arr!8545 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3270)) mapDefault!12273)))))

(declare-fun b!342195 () Bool)

(declare-fun Unit!10640 () Unit!10638)

(assert (=> b!342195 (= e!209849 Unit!10640)))

(declare-fun zeroValue!1467 () V!10613)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10613)

(declare-fun lt!162088 () Unit!10638)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun lemmaArrayContainsKeyThenInListMap!297 (array!18051 array!18053 (_ BitVec 32) (_ BitVec 32) V!10613 V!10613 (_ BitVec 64) (_ BitVec 32) Int) Unit!10638)

(declare-fun arrayScanForKey!0 (array!18051 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342195 (= lt!162088 (lemmaArrayContainsKeyThenInListMap!297 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342195 false))

(declare-fun b!342196 () Bool)

(declare-fun res!189144 () Bool)

(assert (=> b!342196 (=> (not res!189144) (not e!209852))))

(declare-datatypes ((List!4919 0))(
  ( (Nil!4916) (Cons!4915 (h!5771 (_ BitVec 64)) (t!10031 List!4919)) )
))
(declare-fun arrayNoDuplicates!0 (array!18051 (_ BitVec 32) List!4919) Bool)

(assert (=> b!342196 (= res!189144 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4916))))

(declare-fun b!342197 () Bool)

(declare-fun res!189145 () Bool)

(assert (=> b!342197 (=> (not res!189145) (not e!209852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18051 (_ BitVec 32)) Bool)

(assert (=> b!342197 (= res!189145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342198 () Bool)

(assert (=> b!342198 (= e!209852 e!209853)))

(declare-fun res!189149 () Bool)

(assert (=> b!342198 (=> (not res!189149) (not e!209853))))

(declare-datatypes ((SeekEntryResult!3298 0))(
  ( (MissingZero!3298 (index!15371 (_ BitVec 32))) (Found!3298 (index!15372 (_ BitVec 32))) (Intermediate!3298 (undefined!4110 Bool) (index!15373 (_ BitVec 32)) (x!34072 (_ BitVec 32))) (Undefined!3298) (MissingVacant!3298 (index!15374 (_ BitVec 32))) )
))
(declare-fun lt!162087 () SeekEntryResult!3298)

(get-info :version)

(assert (=> b!342198 (= res!189149 (and (not ((_ is Found!3298) lt!162087)) (not ((_ is MissingZero!3298) lt!162087)) ((_ is MissingVacant!3298) lt!162087)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18051 (_ BitVec 32)) SeekEntryResult!3298)

(assert (=> b!342198 (= lt!162087 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342199 () Bool)

(declare-fun Unit!10641 () Unit!10638)

(assert (=> b!342199 (= e!209849 Unit!10641)))

(declare-fun b!342200 () Bool)

(declare-fun res!189147 () Bool)

(assert (=> b!342200 (=> (not res!189147) (not e!209852))))

(declare-datatypes ((tuple2!5302 0))(
  ( (tuple2!5303 (_1!2662 (_ BitVec 64)) (_2!2662 V!10613)) )
))
(declare-datatypes ((List!4920 0))(
  ( (Nil!4917) (Cons!4916 (h!5772 tuple2!5302) (t!10032 List!4920)) )
))
(declare-datatypes ((ListLongMap!4215 0))(
  ( (ListLongMap!4216 (toList!2123 List!4920)) )
))
(declare-fun contains!2179 (ListLongMap!4215 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1644 (array!18051 array!18053 (_ BitVec 32) (_ BitVec 32) V!10613 V!10613 (_ BitVec 32) Int) ListLongMap!4215)

(assert (=> b!342200 (= res!189147 (not (contains!2179 (getCurrentListMap!1644 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342201 () Bool)

(declare-fun res!189146 () Bool)

(assert (=> b!342201 (=> (not res!189146) (not e!209852))))

(assert (=> b!342201 (= res!189146 (and (= (size!8897 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8896 _keys!1895) (size!8897 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342202 () Bool)

(assert (=> b!342202 (= e!209848 tp_is_empty!7227)))

(assert (= (and start!34300 res!189148) b!342201))

(assert (= (and b!342201 res!189146) b!342197))

(assert (= (and b!342197 res!189145) b!342196))

(assert (= (and b!342196 res!189144) b!342193))

(assert (= (and b!342193 res!189143) b!342200))

(assert (= (and b!342200 res!189147) b!342198))

(assert (= (and b!342198 res!189149) b!342192))

(assert (= (and b!342192 c!52794) b!342195))

(assert (= (and b!342192 (not c!52794)) b!342199))

(assert (= (and b!342194 condMapEmpty!12273) mapIsEmpty!12273))

(assert (= (and b!342194 (not condMapEmpty!12273)) mapNonEmpty!12273))

(assert (= (and mapNonEmpty!12273 ((_ is ValueCellFull!3270) mapValue!12273)) b!342191))

(assert (= (and b!342194 ((_ is ValueCellFull!3270) mapDefault!12273)) b!342202))

(assert (= start!34300 b!342194))

(declare-fun m!344415 () Bool)

(assert (=> b!342196 m!344415))

(declare-fun m!344417 () Bool)

(assert (=> b!342198 m!344417))

(declare-fun m!344419 () Bool)

(assert (=> mapNonEmpty!12273 m!344419))

(declare-fun m!344421 () Bool)

(assert (=> b!342195 m!344421))

(assert (=> b!342195 m!344421))

(declare-fun m!344423 () Bool)

(assert (=> b!342195 m!344423))

(declare-fun m!344425 () Bool)

(assert (=> b!342197 m!344425))

(declare-fun m!344427 () Bool)

(assert (=> b!342193 m!344427))

(declare-fun m!344429 () Bool)

(assert (=> b!342200 m!344429))

(assert (=> b!342200 m!344429))

(declare-fun m!344431 () Bool)

(assert (=> b!342200 m!344431))

(declare-fun m!344433 () Bool)

(assert (=> b!342192 m!344433))

(declare-fun m!344435 () Bool)

(assert (=> start!34300 m!344435))

(declare-fun m!344437 () Bool)

(assert (=> start!34300 m!344437))

(declare-fun m!344439 () Bool)

(assert (=> start!34300 m!344439))

(check-sat b_and!14479 (not b_next!7275) (not mapNonEmpty!12273) tp_is_empty!7227 (not b!342195) (not b!342200) (not b!342196) (not b!342197) (not b!342192) (not b!342193) (not start!34300) (not b!342198))
(check-sat b_and!14479 (not b_next!7275))
