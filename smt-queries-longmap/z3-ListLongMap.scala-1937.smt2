; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34318 () Bool)

(assert start!34318)

(declare-fun b_free!7293 () Bool)

(declare-fun b_next!7293 () Bool)

(assert (=> start!34318 (= b_free!7293 (not b_next!7293))))

(declare-fun tp!25418 () Bool)

(declare-fun b_and!14497 () Bool)

(assert (=> start!34318 (= tp!25418 b_and!14497)))

(declare-fun b!342515 () Bool)

(declare-fun res!189336 () Bool)

(declare-fun e!210041 () Bool)

(assert (=> b!342515 (=> (not res!189336) (not e!210041))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10637 0))(
  ( (V!10638 (val!3667 Int)) )
))
(declare-fun zeroValue!1467 () V!10637)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3279 0))(
  ( (ValueCellFull!3279 (v!5841 V!10637)) (EmptyCell!3279) )
))
(declare-datatypes ((array!18083 0))(
  ( (array!18084 (arr!8560 (Array (_ BitVec 32) ValueCell!3279)) (size!8912 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18083)

(declare-datatypes ((array!18085 0))(
  ( (array!18086 (arr!8561 (Array (_ BitVec 32) (_ BitVec 64))) (size!8913 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18085)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10637)

(declare-datatypes ((tuple2!5314 0))(
  ( (tuple2!5315 (_1!2668 (_ BitVec 64)) (_2!2668 V!10637)) )
))
(declare-datatypes ((List!4932 0))(
  ( (Nil!4929) (Cons!4928 (h!5784 tuple2!5314) (t!10044 List!4932)) )
))
(declare-datatypes ((ListLongMap!4227 0))(
  ( (ListLongMap!4228 (toList!2129 List!4932)) )
))
(declare-fun contains!2185 (ListLongMap!4227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1650 (array!18085 array!18083 (_ BitVec 32) (_ BitVec 32) V!10637 V!10637 (_ BitVec 32) Int) ListLongMap!4227)

(assert (=> b!342515 (= res!189336 (not (contains!2185 (getCurrentListMap!1650 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342516 () Bool)

(declare-fun e!210042 () Bool)

(assert (=> b!342516 (= e!210041 e!210042)))

(declare-fun res!189338 () Bool)

(assert (=> b!342516 (=> (not res!189338) (not e!210042))))

(declare-datatypes ((SeekEntryResult!3303 0))(
  ( (MissingZero!3303 (index!15391 (_ BitVec 32))) (Found!3303 (index!15392 (_ BitVec 32))) (Intermediate!3303 (undefined!4115 Bool) (index!15393 (_ BitVec 32)) (x!34101 (_ BitVec 32))) (Undefined!3303) (MissingVacant!3303 (index!15394 (_ BitVec 32))) )
))
(declare-fun lt!162177 () SeekEntryResult!3303)

(get-info :version)

(assert (=> b!342516 (= res!189338 (and (not ((_ is Found!3303) lt!162177)) (not ((_ is MissingZero!3303) lt!162177)) ((_ is MissingVacant!3303) lt!162177)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18085 (_ BitVec 32)) SeekEntryResult!3303)

(assert (=> b!342516 (= lt!162177 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342517 () Bool)

(declare-datatypes ((Unit!10666 0))(
  ( (Unit!10667) )
))
(declare-fun e!210039 () Unit!10666)

(declare-fun Unit!10668 () Unit!10666)

(assert (=> b!342517 (= e!210039 Unit!10668)))

(declare-fun mapNonEmpty!12300 () Bool)

(declare-fun mapRes!12300 () Bool)

(declare-fun tp!25419 () Bool)

(declare-fun e!210037 () Bool)

(assert (=> mapNonEmpty!12300 (= mapRes!12300 (and tp!25419 e!210037))))

(declare-fun mapKey!12300 () (_ BitVec 32))

(declare-fun mapRest!12300 () (Array (_ BitVec 32) ValueCell!3279))

(declare-fun mapValue!12300 () ValueCell!3279)

(assert (=> mapNonEmpty!12300 (= (arr!8560 _values!1525) (store mapRest!12300 mapKey!12300 mapValue!12300))))

(declare-fun b!342518 () Bool)

(declare-fun res!189332 () Bool)

(assert (=> b!342518 (=> (not res!189332) (not e!210041))))

(declare-datatypes ((List!4933 0))(
  ( (Nil!4930) (Cons!4929 (h!5785 (_ BitVec 64)) (t!10045 List!4933)) )
))
(declare-fun arrayNoDuplicates!0 (array!18085 (_ BitVec 32) List!4933) Bool)

(assert (=> b!342518 (= res!189332 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4930))))

(declare-fun b!342519 () Bool)

(declare-fun res!189335 () Bool)

(assert (=> b!342519 (=> (not res!189335) (not e!210041))))

(assert (=> b!342519 (= res!189335 (and (= (size!8912 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8913 _keys!1895) (size!8912 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342520 () Bool)

(declare-fun tp_is_empty!7245 () Bool)

(assert (=> b!342520 (= e!210037 tp_is_empty!7245)))

(declare-fun mapIsEmpty!12300 () Bool)

(assert (=> mapIsEmpty!12300 mapRes!12300))

(declare-fun b!342522 () Bool)

(assert (=> b!342522 (= e!210042 false)))

(declare-fun lt!162178 () Unit!10666)

(assert (=> b!342522 (= lt!162178 e!210039)))

(declare-fun c!52821 () Bool)

(declare-fun arrayContainsKey!0 (array!18085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342522 (= c!52821 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342523 () Bool)

(declare-fun e!210040 () Bool)

(declare-fun e!210038 () Bool)

(assert (=> b!342523 (= e!210040 (and e!210038 mapRes!12300))))

(declare-fun condMapEmpty!12300 () Bool)

(declare-fun mapDefault!12300 () ValueCell!3279)

(assert (=> b!342523 (= condMapEmpty!12300 (= (arr!8560 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3279)) mapDefault!12300)))))

(declare-fun b!342524 () Bool)

(declare-fun res!189333 () Bool)

(assert (=> b!342524 (=> (not res!189333) (not e!210041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342524 (= res!189333 (validKeyInArray!0 k0!1348))))

(declare-fun res!189337 () Bool)

(assert (=> start!34318 (=> (not res!189337) (not e!210041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34318 (= res!189337 (validMask!0 mask!2385))))

(assert (=> start!34318 e!210041))

(assert (=> start!34318 true))

(assert (=> start!34318 tp_is_empty!7245))

(assert (=> start!34318 tp!25418))

(declare-fun array_inv!6338 (array!18083) Bool)

(assert (=> start!34318 (and (array_inv!6338 _values!1525) e!210040)))

(declare-fun array_inv!6339 (array!18085) Bool)

(assert (=> start!34318 (array_inv!6339 _keys!1895)))

(declare-fun b!342521 () Bool)

(declare-fun Unit!10669 () Unit!10666)

(assert (=> b!342521 (= e!210039 Unit!10669)))

(declare-fun lt!162176 () Unit!10666)

(declare-fun lemmaArrayContainsKeyThenInListMap!302 (array!18085 array!18083 (_ BitVec 32) (_ BitVec 32) V!10637 V!10637 (_ BitVec 64) (_ BitVec 32) Int) Unit!10666)

(declare-fun arrayScanForKey!0 (array!18085 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342521 (= lt!162176 (lemmaArrayContainsKeyThenInListMap!302 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342521 false))

(declare-fun b!342525 () Bool)

(declare-fun res!189334 () Bool)

(assert (=> b!342525 (=> (not res!189334) (not e!210041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18085 (_ BitVec 32)) Bool)

(assert (=> b!342525 (= res!189334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342526 () Bool)

(assert (=> b!342526 (= e!210038 tp_is_empty!7245)))

(assert (= (and start!34318 res!189337) b!342519))

(assert (= (and b!342519 res!189335) b!342525))

(assert (= (and b!342525 res!189334) b!342518))

(assert (= (and b!342518 res!189332) b!342524))

(assert (= (and b!342524 res!189333) b!342515))

(assert (= (and b!342515 res!189336) b!342516))

(assert (= (and b!342516 res!189338) b!342522))

(assert (= (and b!342522 c!52821) b!342521))

(assert (= (and b!342522 (not c!52821)) b!342517))

(assert (= (and b!342523 condMapEmpty!12300) mapIsEmpty!12300))

(assert (= (and b!342523 (not condMapEmpty!12300)) mapNonEmpty!12300))

(assert (= (and mapNonEmpty!12300 ((_ is ValueCellFull!3279) mapValue!12300)) b!342520))

(assert (= (and b!342523 ((_ is ValueCellFull!3279) mapDefault!12300)) b!342526))

(assert (= start!34318 b!342523))

(declare-fun m!344649 () Bool)

(assert (=> b!342521 m!344649))

(assert (=> b!342521 m!344649))

(declare-fun m!344651 () Bool)

(assert (=> b!342521 m!344651))

(declare-fun m!344653 () Bool)

(assert (=> start!34318 m!344653))

(declare-fun m!344655 () Bool)

(assert (=> start!34318 m!344655))

(declare-fun m!344657 () Bool)

(assert (=> start!34318 m!344657))

(declare-fun m!344659 () Bool)

(assert (=> b!342516 m!344659))

(declare-fun m!344661 () Bool)

(assert (=> b!342522 m!344661))

(declare-fun m!344663 () Bool)

(assert (=> b!342515 m!344663))

(assert (=> b!342515 m!344663))

(declare-fun m!344665 () Bool)

(assert (=> b!342515 m!344665))

(declare-fun m!344667 () Bool)

(assert (=> b!342525 m!344667))

(declare-fun m!344669 () Bool)

(assert (=> b!342518 m!344669))

(declare-fun m!344671 () Bool)

(assert (=> mapNonEmpty!12300 m!344671))

(declare-fun m!344673 () Bool)

(assert (=> b!342524 m!344673))

(check-sat (not b!342525) tp_is_empty!7245 (not b!342518) (not b!342521) (not b!342522) (not b!342524) (not b!342516) (not start!34318) (not mapNonEmpty!12300) (not b_next!7293) (not b!342515) b_and!14497)
(check-sat b_and!14497 (not b_next!7293))
