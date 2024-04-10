; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34732 () Bool)

(assert start!34732)

(declare-fun b_free!7539 () Bool)

(declare-fun b_next!7539 () Bool)

(assert (=> start!34732 (= b_free!7539 (not b_next!7539))))

(declare-fun tp!26180 () Bool)

(declare-fun b_and!14759 () Bool)

(assert (=> start!34732 (= tp!26180 b_and!14759)))

(declare-fun b!347309 () Bool)

(declare-fun res!192240 () Bool)

(declare-fun e!212811 () Bool)

(assert (=> b!347309 (=> (not res!192240) (not e!212811))))

(declare-datatypes ((array!18573 0))(
  ( (array!18574 (arr!8797 (Array (_ BitVec 32) (_ BitVec 64))) (size!9149 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18573)

(declare-datatypes ((List!5107 0))(
  ( (Nil!5104) (Cons!5103 (h!5959 (_ BitVec 64)) (t!10235 List!5107)) )
))
(declare-fun arrayNoDuplicates!0 (array!18573 (_ BitVec 32) List!5107) Bool)

(assert (=> b!347309 (= res!192240 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5104))))

(declare-fun b!347310 () Bool)

(declare-fun e!212812 () Bool)

(declare-fun e!212813 () Bool)

(declare-fun mapRes!12693 () Bool)

(assert (=> b!347310 (= e!212812 (and e!212813 mapRes!12693))))

(declare-fun condMapEmpty!12693 () Bool)

(declare-datatypes ((V!10965 0))(
  ( (V!10966 (val!3790 Int)) )
))
(declare-datatypes ((ValueCell!3402 0))(
  ( (ValueCellFull!3402 (v!5972 V!10965)) (EmptyCell!3402) )
))
(declare-datatypes ((array!18575 0))(
  ( (array!18576 (arr!8798 (Array (_ BitVec 32) ValueCell!3402)) (size!9150 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18575)

(declare-fun mapDefault!12693 () ValueCell!3402)

(assert (=> b!347310 (= condMapEmpty!12693 (= (arr!8798 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3402)) mapDefault!12693)))))

(declare-fun mapIsEmpty!12693 () Bool)

(assert (=> mapIsEmpty!12693 mapRes!12693))

(declare-fun b!347311 () Bool)

(declare-fun res!192238 () Bool)

(declare-fun e!212810 () Bool)

(assert (=> b!347311 (=> (not res!192238) (not e!212810))))

(declare-datatypes ((SeekEntryResult!3394 0))(
  ( (MissingZero!3394 (index!15755 (_ BitVec 32))) (Found!3394 (index!15756 (_ BitVec 32))) (Intermediate!3394 (undefined!4206 Bool) (index!15757 (_ BitVec 32)) (x!34600 (_ BitVec 32))) (Undefined!3394) (MissingVacant!3394 (index!15758 (_ BitVec 32))) )
))
(declare-fun lt!163528 () SeekEntryResult!3394)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347311 (= res!192238 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15756 lt!163528)))))

(declare-fun b!347312 () Bool)

(assert (=> b!347312 (= e!212810 (not true))))

(assert (=> b!347312 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10783 0))(
  ( (Unit!10784) )
))
(declare-fun lt!163527 () Unit!10783)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18573 (_ BitVec 64) (_ BitVec 32)) Unit!10783)

(assert (=> b!347312 (= lt!163527 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15756 lt!163528)))))

(declare-fun res!192242 () Bool)

(assert (=> start!34732 (=> (not res!192242) (not e!212811))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34732 (= res!192242 (validMask!0 mask!2385))))

(assert (=> start!34732 e!212811))

(assert (=> start!34732 true))

(declare-fun tp_is_empty!7491 () Bool)

(assert (=> start!34732 tp_is_empty!7491))

(assert (=> start!34732 tp!26180))

(declare-fun array_inv!6514 (array!18575) Bool)

(assert (=> start!34732 (and (array_inv!6514 _values!1525) e!212812)))

(declare-fun array_inv!6515 (array!18573) Bool)

(assert (=> start!34732 (array_inv!6515 _keys!1895)))

(declare-fun b!347313 () Bool)

(declare-fun res!192235 () Bool)

(assert (=> b!347313 (=> (not res!192235) (not e!212811))))

(declare-fun zeroValue!1467 () V!10965)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10965)

(declare-datatypes ((tuple2!5486 0))(
  ( (tuple2!5487 (_1!2754 (_ BitVec 64)) (_2!2754 V!10965)) )
))
(declare-datatypes ((List!5108 0))(
  ( (Nil!5105) (Cons!5104 (h!5960 tuple2!5486) (t!10236 List!5108)) )
))
(declare-datatypes ((ListLongMap!4399 0))(
  ( (ListLongMap!4400 (toList!2215 List!5108)) )
))
(declare-fun contains!2279 (ListLongMap!4399 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1736 (array!18573 array!18575 (_ BitVec 32) (_ BitVec 32) V!10965 V!10965 (_ BitVec 32) Int) ListLongMap!4399)

(assert (=> b!347313 (= res!192235 (not (contains!2279 (getCurrentListMap!1736 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!347314 () Bool)

(declare-fun res!192236 () Bool)

(assert (=> b!347314 (=> (not res!192236) (not e!212811))))

(assert (=> b!347314 (= res!192236 (and (= (size!9150 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9149 _keys!1895) (size!9150 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347315 () Bool)

(declare-fun e!212814 () Bool)

(assert (=> b!347315 (= e!212814 tp_is_empty!7491)))

(declare-fun mapNonEmpty!12693 () Bool)

(declare-fun tp!26181 () Bool)

(assert (=> mapNonEmpty!12693 (= mapRes!12693 (and tp!26181 e!212814))))

(declare-fun mapValue!12693 () ValueCell!3402)

(declare-fun mapKey!12693 () (_ BitVec 32))

(declare-fun mapRest!12693 () (Array (_ BitVec 32) ValueCell!3402))

(assert (=> mapNonEmpty!12693 (= (arr!8798 _values!1525) (store mapRest!12693 mapKey!12693 mapValue!12693))))

(declare-fun b!347316 () Bool)

(declare-fun res!192241 () Bool)

(assert (=> b!347316 (=> (not res!192241) (not e!212811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18573 (_ BitVec 32)) Bool)

(assert (=> b!347316 (= res!192241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347317 () Bool)

(assert (=> b!347317 (= e!212811 e!212810)))

(declare-fun res!192239 () Bool)

(assert (=> b!347317 (=> (not res!192239) (not e!212810))))

(get-info :version)

(assert (=> b!347317 (= res!192239 (and ((_ is Found!3394) lt!163528) (= (select (arr!8797 _keys!1895) (index!15756 lt!163528)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18573 (_ BitVec 32)) SeekEntryResult!3394)

(assert (=> b!347317 (= lt!163528 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347318 () Bool)

(assert (=> b!347318 (= e!212813 tp_is_empty!7491)))

(declare-fun b!347319 () Bool)

(declare-fun res!192237 () Bool)

(assert (=> b!347319 (=> (not res!192237) (not e!212811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347319 (= res!192237 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34732 res!192242) b!347314))

(assert (= (and b!347314 res!192236) b!347316))

(assert (= (and b!347316 res!192241) b!347309))

(assert (= (and b!347309 res!192240) b!347319))

(assert (= (and b!347319 res!192237) b!347313))

(assert (= (and b!347313 res!192235) b!347317))

(assert (= (and b!347317 res!192239) b!347311))

(assert (= (and b!347311 res!192238) b!347312))

(assert (= (and b!347310 condMapEmpty!12693) mapIsEmpty!12693))

(assert (= (and b!347310 (not condMapEmpty!12693)) mapNonEmpty!12693))

(assert (= (and mapNonEmpty!12693 ((_ is ValueCellFull!3402) mapValue!12693)) b!347315))

(assert (= (and b!347310 ((_ is ValueCellFull!3402) mapDefault!12693)) b!347318))

(assert (= start!34732 b!347310))

(declare-fun m!348259 () Bool)

(assert (=> b!347312 m!348259))

(declare-fun m!348261 () Bool)

(assert (=> b!347312 m!348261))

(declare-fun m!348263 () Bool)

(assert (=> b!347316 m!348263))

(declare-fun m!348265 () Bool)

(assert (=> start!34732 m!348265))

(declare-fun m!348267 () Bool)

(assert (=> start!34732 m!348267))

(declare-fun m!348269 () Bool)

(assert (=> start!34732 m!348269))

(declare-fun m!348271 () Bool)

(assert (=> b!347309 m!348271))

(declare-fun m!348273 () Bool)

(assert (=> b!347311 m!348273))

(declare-fun m!348275 () Bool)

(assert (=> mapNonEmpty!12693 m!348275))

(declare-fun m!348277 () Bool)

(assert (=> b!347319 m!348277))

(declare-fun m!348279 () Bool)

(assert (=> b!347317 m!348279))

(declare-fun m!348281 () Bool)

(assert (=> b!347317 m!348281))

(declare-fun m!348283 () Bool)

(assert (=> b!347313 m!348283))

(assert (=> b!347313 m!348283))

(declare-fun m!348285 () Bool)

(assert (=> b!347313 m!348285))

(check-sat (not b_next!7539) (not mapNonEmpty!12693) (not b!347309) b_and!14759 (not b!347311) (not b!347319) (not b!347313) (not b!347316) tp_is_empty!7491 (not b!347312) (not start!34732) (not b!347317))
(check-sat b_and!14759 (not b_next!7539))
