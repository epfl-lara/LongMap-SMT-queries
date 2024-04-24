; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34716 () Bool)

(assert start!34716)

(declare-fun b_free!7537 () Bool)

(declare-fun b_next!7537 () Bool)

(assert (=> start!34716 (= b_free!7537 (not b_next!7537))))

(declare-fun tp!26174 () Bool)

(declare-fun b_and!14771 () Bool)

(assert (=> start!34716 (= tp!26174 b_and!14771)))

(declare-fun b!347223 () Bool)

(declare-fun e!212760 () Bool)

(declare-fun tp_is_empty!7489 () Bool)

(assert (=> b!347223 (= e!212760 tp_is_empty!7489)))

(declare-fun b!347224 () Bool)

(declare-fun res!192210 () Bool)

(declare-fun e!212757 () Bool)

(assert (=> b!347224 (=> (not res!192210) (not e!212757))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347224 (= res!192210 (validKeyInArray!0 k0!1348))))

(declare-fun b!347225 () Bool)

(declare-fun e!212759 () Bool)

(assert (=> b!347225 (= e!212757 e!212759)))

(declare-fun res!192212 () Bool)

(assert (=> b!347225 (=> (not res!192212) (not e!212759))))

(declare-datatypes ((array!18560 0))(
  ( (array!18561 (arr!8790 (Array (_ BitVec 32) (_ BitVec 64))) (size!9142 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18560)

(declare-datatypes ((SeekEntryResult!3346 0))(
  ( (MissingZero!3346 (index!15563 (_ BitVec 32))) (Found!3346 (index!15564 (_ BitVec 32))) (Intermediate!3346 (undefined!4158 Bool) (index!15565 (_ BitVec 32)) (x!34549 (_ BitVec 32))) (Undefined!3346) (MissingVacant!3346 (index!15566 (_ BitVec 32))) )
))
(declare-fun lt!163539 () SeekEntryResult!3346)

(get-info :version)

(assert (=> b!347225 (= res!192212 (and ((_ is Found!3346) lt!163539) (= (select (arr!8790 _keys!1895) (index!15564 lt!163539)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18560 (_ BitVec 32)) SeekEntryResult!3346)

(assert (=> b!347225 (= lt!163539 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12690 () Bool)

(declare-fun mapRes!12690 () Bool)

(declare-fun tp!26175 () Bool)

(declare-fun e!212762 () Bool)

(assert (=> mapNonEmpty!12690 (= mapRes!12690 (and tp!26175 e!212762))))

(declare-fun mapKey!12690 () (_ BitVec 32))

(declare-datatypes ((V!10963 0))(
  ( (V!10964 (val!3789 Int)) )
))
(declare-datatypes ((ValueCell!3401 0))(
  ( (ValueCellFull!3401 (v!5972 V!10963)) (EmptyCell!3401) )
))
(declare-fun mapRest!12690 () (Array (_ BitVec 32) ValueCell!3401))

(declare-datatypes ((array!18562 0))(
  ( (array!18563 (arr!8791 (Array (_ BitVec 32) ValueCell!3401)) (size!9143 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18562)

(declare-fun mapValue!12690 () ValueCell!3401)

(assert (=> mapNonEmpty!12690 (= (arr!8791 _values!1525) (store mapRest!12690 mapKey!12690 mapValue!12690))))

(declare-fun b!347226 () Bool)

(declare-fun res!192213 () Bool)

(assert (=> b!347226 (=> (not res!192213) (not e!212759))))

(declare-fun arrayContainsKey!0 (array!18560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347226 (= res!192213 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15564 lt!163539)))))

(declare-fun b!347227 () Bool)

(declare-fun res!192214 () Bool)

(assert (=> b!347227 (=> (not res!192214) (not e!212757))))

(declare-datatypes ((List!5002 0))(
  ( (Nil!4999) (Cons!4998 (h!5854 (_ BitVec 64)) (t!10122 List!5002)) )
))
(declare-fun arrayNoDuplicates!0 (array!18560 (_ BitVec 32) List!5002) Bool)

(assert (=> b!347227 (= res!192214 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4999))))

(declare-fun mapIsEmpty!12690 () Bool)

(assert (=> mapIsEmpty!12690 mapRes!12690))

(declare-fun b!347228 () Bool)

(assert (=> b!347228 (= e!212759 (not true))))

(assert (=> b!347228 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10749 0))(
  ( (Unit!10750) )
))
(declare-fun lt!163540 () Unit!10749)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18560 (_ BitVec 64) (_ BitVec 32)) Unit!10749)

(assert (=> b!347228 (= lt!163540 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15564 lt!163539)))))

(declare-fun b!347229 () Bool)

(declare-fun e!212761 () Bool)

(assert (=> b!347229 (= e!212761 (and e!212760 mapRes!12690))))

(declare-fun condMapEmpty!12690 () Bool)

(declare-fun mapDefault!12690 () ValueCell!3401)

(assert (=> b!347229 (= condMapEmpty!12690 (= (arr!8791 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3401)) mapDefault!12690)))))

(declare-fun b!347230 () Bool)

(declare-fun res!192215 () Bool)

(assert (=> b!347230 (=> (not res!192215) (not e!212757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18560 (_ BitVec 32)) Bool)

(assert (=> b!347230 (= res!192215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!192209 () Bool)

(assert (=> start!34716 (=> (not res!192209) (not e!212757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34716 (= res!192209 (validMask!0 mask!2385))))

(assert (=> start!34716 e!212757))

(assert (=> start!34716 true))

(assert (=> start!34716 tp_is_empty!7489))

(assert (=> start!34716 tp!26174))

(declare-fun array_inv!6496 (array!18562) Bool)

(assert (=> start!34716 (and (array_inv!6496 _values!1525) e!212761)))

(declare-fun array_inv!6497 (array!18560) Bool)

(assert (=> start!34716 (array_inv!6497 _keys!1895)))

(declare-fun b!347231 () Bool)

(declare-fun res!192211 () Bool)

(assert (=> b!347231 (=> (not res!192211) (not e!212757))))

(declare-fun zeroValue!1467 () V!10963)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10963)

(declare-datatypes ((tuple2!5396 0))(
  ( (tuple2!5397 (_1!2709 (_ BitVec 64)) (_2!2709 V!10963)) )
))
(declare-datatypes ((List!5003 0))(
  ( (Nil!5000) (Cons!4999 (h!5855 tuple2!5396) (t!10123 List!5003)) )
))
(declare-datatypes ((ListLongMap!4311 0))(
  ( (ListLongMap!4312 (toList!2171 List!5003)) )
))
(declare-fun contains!2254 (ListLongMap!4311 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1700 (array!18560 array!18562 (_ BitVec 32) (_ BitVec 32) V!10963 V!10963 (_ BitVec 32) Int) ListLongMap!4311)

(assert (=> b!347231 (= res!192211 (not (contains!2254 (getCurrentListMap!1700 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!347232 () Bool)

(assert (=> b!347232 (= e!212762 tp_is_empty!7489)))

(declare-fun b!347233 () Bool)

(declare-fun res!192208 () Bool)

(assert (=> b!347233 (=> (not res!192208) (not e!212757))))

(assert (=> b!347233 (= res!192208 (and (= (size!9143 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9142 _keys!1895) (size!9143 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!34716 res!192209) b!347233))

(assert (= (and b!347233 res!192208) b!347230))

(assert (= (and b!347230 res!192215) b!347227))

(assert (= (and b!347227 res!192214) b!347224))

(assert (= (and b!347224 res!192210) b!347231))

(assert (= (and b!347231 res!192211) b!347225))

(assert (= (and b!347225 res!192212) b!347226))

(assert (= (and b!347226 res!192213) b!347228))

(assert (= (and b!347229 condMapEmpty!12690) mapIsEmpty!12690))

(assert (= (and b!347229 (not condMapEmpty!12690)) mapNonEmpty!12690))

(assert (= (and mapNonEmpty!12690 ((_ is ValueCellFull!3401) mapValue!12690)) b!347232))

(assert (= (and b!347229 ((_ is ValueCellFull!3401) mapDefault!12690)) b!347223))

(assert (= start!34716 b!347229))

(declare-fun m!348455 () Bool)

(assert (=> b!347226 m!348455))

(declare-fun m!348457 () Bool)

(assert (=> b!347224 m!348457))

(declare-fun m!348459 () Bool)

(assert (=> b!347231 m!348459))

(assert (=> b!347231 m!348459))

(declare-fun m!348461 () Bool)

(assert (=> b!347231 m!348461))

(declare-fun m!348463 () Bool)

(assert (=> b!347227 m!348463))

(declare-fun m!348465 () Bool)

(assert (=> start!34716 m!348465))

(declare-fun m!348467 () Bool)

(assert (=> start!34716 m!348467))

(declare-fun m!348469 () Bool)

(assert (=> start!34716 m!348469))

(declare-fun m!348471 () Bool)

(assert (=> mapNonEmpty!12690 m!348471))

(declare-fun m!348473 () Bool)

(assert (=> b!347225 m!348473))

(declare-fun m!348475 () Bool)

(assert (=> b!347225 m!348475))

(declare-fun m!348477 () Bool)

(assert (=> b!347230 m!348477))

(declare-fun m!348479 () Bool)

(assert (=> b!347228 m!348479))

(declare-fun m!348481 () Bool)

(assert (=> b!347228 m!348481))

(check-sat (not b!347227) (not b!347226) (not mapNonEmpty!12690) b_and!14771 tp_is_empty!7489 (not b!347225) (not b!347228) (not b!347231) (not b!347230) (not b!347224) (not start!34716) (not b_next!7537))
(check-sat b_and!14771 (not b_next!7537))
