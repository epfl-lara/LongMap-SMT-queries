; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34306 () Bool)

(assert start!34306)

(declare-fun b_free!7281 () Bool)

(declare-fun b_next!7281 () Bool)

(assert (=> start!34306 (= b_free!7281 (not b_next!7281))))

(declare-fun tp!25382 () Bool)

(declare-fun b_and!14485 () Bool)

(assert (=> start!34306 (= tp!25382 b_and!14485)))

(declare-fun b!342299 () Bool)

(declare-fun res!189212 () Bool)

(declare-fun e!209916 () Bool)

(assert (=> b!342299 (=> (not res!189212) (not e!209916))))

(declare-datatypes ((array!18063 0))(
  ( (array!18064 (arr!8550 (Array (_ BitVec 32) (_ BitVec 64))) (size!8902 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18063)

(declare-datatypes ((List!4925 0))(
  ( (Nil!4922) (Cons!4921 (h!5777 (_ BitVec 64)) (t!10037 List!4925)) )
))
(declare-fun arrayNoDuplicates!0 (array!18063 (_ BitVec 32) List!4925) Bool)

(assert (=> b!342299 (= res!189212 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4922))))

(declare-fun b!342300 () Bool)

(declare-datatypes ((Unit!10649 0))(
  ( (Unit!10650) )
))
(declare-fun e!209910 () Unit!10649)

(declare-fun Unit!10651 () Unit!10649)

(assert (=> b!342300 (= e!209910 Unit!10651)))

(declare-fun b!342301 () Bool)

(declare-fun res!189207 () Bool)

(assert (=> b!342301 (=> (not res!189207) (not e!209916))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342301 (= res!189207 (validKeyInArray!0 k0!1348))))

(declare-fun b!342302 () Bool)

(declare-fun e!209912 () Bool)

(assert (=> b!342302 (= e!209916 e!209912)))

(declare-fun res!189208 () Bool)

(assert (=> b!342302 (=> (not res!189208) (not e!209912))))

(declare-datatypes ((SeekEntryResult!3300 0))(
  ( (MissingZero!3300 (index!15379 (_ BitVec 32))) (Found!3300 (index!15380 (_ BitVec 32))) (Intermediate!3300 (undefined!4112 Bool) (index!15381 (_ BitVec 32)) (x!34082 (_ BitVec 32))) (Undefined!3300) (MissingVacant!3300 (index!15382 (_ BitVec 32))) )
))
(declare-fun lt!162115 () SeekEntryResult!3300)

(get-info :version)

(assert (=> b!342302 (= res!189208 (and (not ((_ is Found!3300) lt!162115)) (not ((_ is MissingZero!3300) lt!162115)) ((_ is MissingVacant!3300) lt!162115)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18063 (_ BitVec 32)) SeekEntryResult!3300)

(assert (=> b!342302 (= lt!162115 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!189206 () Bool)

(assert (=> start!34306 (=> (not res!189206) (not e!209916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34306 (= res!189206 (validMask!0 mask!2385))))

(assert (=> start!34306 e!209916))

(assert (=> start!34306 true))

(declare-fun tp_is_empty!7233 () Bool)

(assert (=> start!34306 tp_is_empty!7233))

(assert (=> start!34306 tp!25382))

(declare-datatypes ((V!10621 0))(
  ( (V!10622 (val!3661 Int)) )
))
(declare-datatypes ((ValueCell!3273 0))(
  ( (ValueCellFull!3273 (v!5835 V!10621)) (EmptyCell!3273) )
))
(declare-datatypes ((array!18065 0))(
  ( (array!18066 (arr!8551 (Array (_ BitVec 32) ValueCell!3273)) (size!8903 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18065)

(declare-fun e!209911 () Bool)

(declare-fun array_inv!6332 (array!18065) Bool)

(assert (=> start!34306 (and (array_inv!6332 _values!1525) e!209911)))

(declare-fun array_inv!6333 (array!18063) Bool)

(assert (=> start!34306 (array_inv!6333 _keys!1895)))

(declare-fun b!342303 () Bool)

(declare-fun res!189210 () Bool)

(assert (=> b!342303 (=> (not res!189210) (not e!209916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18063 (_ BitVec 32)) Bool)

(assert (=> b!342303 (= res!189210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12282 () Bool)

(declare-fun mapRes!12282 () Bool)

(declare-fun tp!25383 () Bool)

(declare-fun e!209915 () Bool)

(assert (=> mapNonEmpty!12282 (= mapRes!12282 (and tp!25383 e!209915))))

(declare-fun mapValue!12282 () ValueCell!3273)

(declare-fun mapRest!12282 () (Array (_ BitVec 32) ValueCell!3273))

(declare-fun mapKey!12282 () (_ BitVec 32))

(assert (=> mapNonEmpty!12282 (= (arr!8551 _values!1525) (store mapRest!12282 mapKey!12282 mapValue!12282))))

(declare-fun b!342304 () Bool)

(assert (=> b!342304 (= e!209915 tp_is_empty!7233)))

(declare-fun mapIsEmpty!12282 () Bool)

(assert (=> mapIsEmpty!12282 mapRes!12282))

(declare-fun b!342305 () Bool)

(declare-fun Unit!10652 () Unit!10649)

(assert (=> b!342305 (= e!209910 Unit!10652)))

(declare-fun zeroValue!1467 () V!10621)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10621)

(declare-fun lt!162113 () Unit!10649)

(declare-fun lemmaArrayContainsKeyThenInListMap!299 (array!18063 array!18065 (_ BitVec 32) (_ BitVec 32) V!10621 V!10621 (_ BitVec 64) (_ BitVec 32) Int) Unit!10649)

(declare-fun arrayScanForKey!0 (array!18063 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342305 (= lt!162113 (lemmaArrayContainsKeyThenInListMap!299 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342305 false))

(declare-fun b!342306 () Bool)

(declare-fun res!189209 () Bool)

(assert (=> b!342306 (=> (not res!189209) (not e!209916))))

(assert (=> b!342306 (= res!189209 (and (= (size!8903 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8902 _keys!1895) (size!8903 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342307 () Bool)

(declare-fun e!209914 () Bool)

(assert (=> b!342307 (= e!209911 (and e!209914 mapRes!12282))))

(declare-fun condMapEmpty!12282 () Bool)

(declare-fun mapDefault!12282 () ValueCell!3273)

(assert (=> b!342307 (= condMapEmpty!12282 (= (arr!8551 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3273)) mapDefault!12282)))))

(declare-fun b!342308 () Bool)

(declare-fun res!189211 () Bool)

(assert (=> b!342308 (=> (not res!189211) (not e!209916))))

(declare-datatypes ((tuple2!5308 0))(
  ( (tuple2!5309 (_1!2665 (_ BitVec 64)) (_2!2665 V!10621)) )
))
(declare-datatypes ((List!4926 0))(
  ( (Nil!4923) (Cons!4922 (h!5778 tuple2!5308) (t!10038 List!4926)) )
))
(declare-datatypes ((ListLongMap!4221 0))(
  ( (ListLongMap!4222 (toList!2126 List!4926)) )
))
(declare-fun contains!2182 (ListLongMap!4221 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1647 (array!18063 array!18065 (_ BitVec 32) (_ BitVec 32) V!10621 V!10621 (_ BitVec 32) Int) ListLongMap!4221)

(assert (=> b!342308 (= res!189211 (not (contains!2182 (getCurrentListMap!1647 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342309 () Bool)

(assert (=> b!342309 (= e!209912 false)))

(declare-fun lt!162114 () Unit!10649)

(assert (=> b!342309 (= lt!162114 e!209910)))

(declare-fun c!52803 () Bool)

(declare-fun arrayContainsKey!0 (array!18063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342309 (= c!52803 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342310 () Bool)

(assert (=> b!342310 (= e!209914 tp_is_empty!7233)))

(assert (= (and start!34306 res!189206) b!342306))

(assert (= (and b!342306 res!189209) b!342303))

(assert (= (and b!342303 res!189210) b!342299))

(assert (= (and b!342299 res!189212) b!342301))

(assert (= (and b!342301 res!189207) b!342308))

(assert (= (and b!342308 res!189211) b!342302))

(assert (= (and b!342302 res!189208) b!342309))

(assert (= (and b!342309 c!52803) b!342305))

(assert (= (and b!342309 (not c!52803)) b!342300))

(assert (= (and b!342307 condMapEmpty!12282) mapIsEmpty!12282))

(assert (= (and b!342307 (not condMapEmpty!12282)) mapNonEmpty!12282))

(assert (= (and mapNonEmpty!12282 ((_ is ValueCellFull!3273) mapValue!12282)) b!342304))

(assert (= (and b!342307 ((_ is ValueCellFull!3273) mapDefault!12282)) b!342310))

(assert (= start!34306 b!342307))

(declare-fun m!344493 () Bool)

(assert (=> b!342308 m!344493))

(assert (=> b!342308 m!344493))

(declare-fun m!344495 () Bool)

(assert (=> b!342308 m!344495))

(declare-fun m!344497 () Bool)

(assert (=> mapNonEmpty!12282 m!344497))

(declare-fun m!344499 () Bool)

(assert (=> b!342299 m!344499))

(declare-fun m!344501 () Bool)

(assert (=> b!342309 m!344501))

(declare-fun m!344503 () Bool)

(assert (=> b!342305 m!344503))

(assert (=> b!342305 m!344503))

(declare-fun m!344505 () Bool)

(assert (=> b!342305 m!344505))

(declare-fun m!344507 () Bool)

(assert (=> b!342302 m!344507))

(declare-fun m!344509 () Bool)

(assert (=> b!342301 m!344509))

(declare-fun m!344511 () Bool)

(assert (=> start!34306 m!344511))

(declare-fun m!344513 () Bool)

(assert (=> start!34306 m!344513))

(declare-fun m!344515 () Bool)

(assert (=> start!34306 m!344515))

(declare-fun m!344517 () Bool)

(assert (=> b!342303 m!344517))

(check-sat tp_is_empty!7233 (not b!342308) (not b_next!7281) (not start!34306) (not b!342299) (not b!342303) (not b!342301) (not b!342302) (not b!342305) (not b!342309) b_and!14485 (not mapNonEmpty!12282))
(check-sat b_and!14485 (not b_next!7281))
