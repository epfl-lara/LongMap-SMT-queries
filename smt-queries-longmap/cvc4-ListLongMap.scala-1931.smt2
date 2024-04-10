; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34236 () Bool)

(assert start!34236)

(declare-fun b_free!7259 () Bool)

(declare-fun b_next!7259 () Bool)

(assert (=> start!34236 (= b_free!7259 (not b_next!7259))))

(declare-fun tp!25311 () Bool)

(declare-fun b_and!14459 () Bool)

(assert (=> start!34236 (= tp!25311 b_and!14459)))

(declare-fun b!341625 () Bool)

(declare-fun e!209505 () Bool)

(declare-fun tp_is_empty!7211 () Bool)

(assert (=> b!341625 (= e!209505 tp_is_empty!7211)))

(declare-fun mapNonEmpty!12243 () Bool)

(declare-fun mapRes!12243 () Bool)

(declare-fun tp!25310 () Bool)

(declare-fun e!209500 () Bool)

(assert (=> mapNonEmpty!12243 (= mapRes!12243 (and tp!25310 e!209500))))

(declare-fun mapKey!12243 () (_ BitVec 32))

(declare-datatypes ((V!10591 0))(
  ( (V!10592 (val!3650 Int)) )
))
(declare-datatypes ((ValueCell!3262 0))(
  ( (ValueCellFull!3262 (v!5822 V!10591)) (EmptyCell!3262) )
))
(declare-datatypes ((array!18015 0))(
  ( (array!18016 (arr!8528 (Array (_ BitVec 32) ValueCell!3262)) (size!8880 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18015)

(declare-fun mapRest!12243 () (Array (_ BitVec 32) ValueCell!3262))

(declare-fun mapValue!12243 () ValueCell!3262)

(assert (=> mapNonEmpty!12243 (= (arr!8528 _values!1525) (store mapRest!12243 mapKey!12243 mapValue!12243))))

(declare-fun b!341626 () Bool)

(declare-fun e!209501 () Bool)

(declare-fun e!209503 () Bool)

(assert (=> b!341626 (= e!209501 e!209503)))

(declare-fun res!188876 () Bool)

(assert (=> b!341626 (=> (not res!188876) (not e!209503))))

(declare-datatypes ((SeekEntryResult!3293 0))(
  ( (MissingZero!3293 (index!15351 (_ BitVec 32))) (Found!3293 (index!15352 (_ BitVec 32))) (Intermediate!3293 (undefined!4105 Bool) (index!15353 (_ BitVec 32)) (x!34023 (_ BitVec 32))) (Undefined!3293) (MissingVacant!3293 (index!15354 (_ BitVec 32))) )
))
(declare-fun lt!161810 () SeekEntryResult!3293)

(assert (=> b!341626 (= res!188876 (and (not (is-Found!3293 lt!161810)) (not (is-MissingZero!3293 lt!161810)) (is-MissingVacant!3293 lt!161810)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!18017 0))(
  ( (array!18018 (arr!8529 (Array (_ BitVec 32) (_ BitVec 64))) (size!8881 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18017)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18017 (_ BitVec 32)) SeekEntryResult!3293)

(assert (=> b!341626 (= lt!161810 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!341627 () Bool)

(declare-datatypes ((Unit!10612 0))(
  ( (Unit!10613) )
))
(declare-fun e!209499 () Unit!10612)

(declare-fun Unit!10614 () Unit!10612)

(assert (=> b!341627 (= e!209499 Unit!10614)))

(declare-fun lt!161811 () Unit!10612)

(declare-fun zeroValue!1467 () V!10591)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10591)

(declare-fun lemmaArrayContainsKeyThenInListMap!291 (array!18017 array!18015 (_ BitVec 32) (_ BitVec 32) V!10591 V!10591 (_ BitVec 64) (_ BitVec 32) Int) Unit!10612)

(declare-fun arrayScanForKey!0 (array!18017 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341627 (= lt!161811 (lemmaArrayContainsKeyThenInListMap!291 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!341627 false))

(declare-fun b!341628 () Bool)

(declare-fun res!188879 () Bool)

(assert (=> b!341628 (=> (not res!188879) (not e!209501))))

(assert (=> b!341628 (= res!188879 (and (= (size!8880 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8881 _keys!1895) (size!8880 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341629 () Bool)

(declare-fun res!188873 () Bool)

(assert (=> b!341629 (=> (not res!188873) (not e!209501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341629 (= res!188873 (validKeyInArray!0 k!1348))))

(declare-fun b!341630 () Bool)

(assert (=> b!341630 (= e!209503 false)))

(declare-fun lt!161812 () Unit!10612)

(assert (=> b!341630 (= lt!161812 e!209499)))

(declare-fun c!52692 () Bool)

(declare-fun arrayContainsKey!0 (array!18017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341630 (= c!52692 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun res!188874 () Bool)

(assert (=> start!34236 (=> (not res!188874) (not e!209501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34236 (= res!188874 (validMask!0 mask!2385))))

(assert (=> start!34236 e!209501))

(assert (=> start!34236 true))

(assert (=> start!34236 tp_is_empty!7211))

(assert (=> start!34236 tp!25311))

(declare-fun e!209504 () Bool)

(declare-fun array_inv!6312 (array!18015) Bool)

(assert (=> start!34236 (and (array_inv!6312 _values!1525) e!209504)))

(declare-fun array_inv!6313 (array!18017) Bool)

(assert (=> start!34236 (array_inv!6313 _keys!1895)))

(declare-fun b!341631 () Bool)

(assert (=> b!341631 (= e!209504 (and e!209505 mapRes!12243))))

(declare-fun condMapEmpty!12243 () Bool)

(declare-fun mapDefault!12243 () ValueCell!3262)

