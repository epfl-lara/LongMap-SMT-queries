; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33888 () Bool)

(assert start!33888)

(declare-fun b_free!7081 () Bool)

(declare-fun b_next!7081 () Bool)

(assert (=> start!33888 (= b_free!7081 (not b_next!7081))))

(declare-fun tp!24755 () Bool)

(declare-fun b_and!14281 () Bool)

(assert (=> start!33888 (= tp!24755 b_and!14281)))

(declare-fun b!337605 () Bool)

(declare-fun e!207152 () Bool)

(declare-fun e!207151 () Bool)

(assert (=> b!337605 (= e!207152 e!207151)))

(declare-fun res!186549 () Bool)

(assert (=> b!337605 (=> (not res!186549) (not e!207151))))

(declare-datatypes ((SeekEntryResult!3186 0))(
  ( (MissingZero!3186 (index!14923 (_ BitVec 32))) (Found!3186 (index!14924 (_ BitVec 32))) (Intermediate!3186 (undefined!3998 Bool) (index!14925 (_ BitVec 32)) (x!33611 (_ BitVec 32))) (Undefined!3186) (MissingVacant!3186 (index!14926 (_ BitVec 32))) )
))
(declare-fun lt!160493 () SeekEntryResult!3186)

(get-info :version)

(assert (=> b!337605 (= res!186549 (and (not ((_ is Found!3186) lt!160493)) ((_ is MissingZero!3186) lt!160493)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17644 0))(
  ( (array!17645 (arr!8349 (Array (_ BitVec 32) (_ BitVec 64))) (size!8701 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17644)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17644 (_ BitVec 32)) SeekEntryResult!3186)

(assert (=> b!337605 (= lt!160493 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337606 () Bool)

(declare-datatypes ((Unit!10437 0))(
  ( (Unit!10438) )
))
(declare-fun e!207150 () Unit!10437)

(declare-fun Unit!10439 () Unit!10437)

(assert (=> b!337606 (= e!207150 Unit!10439)))

(declare-datatypes ((V!10355 0))(
  ( (V!10356 (val!3561 Int)) )
))
(declare-fun zeroValue!1467 () V!10355)

(declare-datatypes ((ValueCell!3173 0))(
  ( (ValueCellFull!3173 (v!5727 V!10355)) (EmptyCell!3173) )
))
(declare-datatypes ((array!17646 0))(
  ( (array!17647 (arr!8350 (Array (_ BitVec 32) ValueCell!3173)) (size!8702 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17646)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10355)

(declare-fun lt!160495 () Unit!10437)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lemmaArrayContainsKeyThenInListMap!272 (array!17644 array!17646 (_ BitVec 32) (_ BitVec 32) V!10355 V!10355 (_ BitVec 64) (_ BitVec 32) Int) Unit!10437)

(declare-fun arrayScanForKey!0 (array!17644 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337606 (= lt!160495 (lemmaArrayContainsKeyThenInListMap!272 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!337606 false))

(declare-fun res!186548 () Bool)

(assert (=> start!33888 (=> (not res!186548) (not e!207152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33888 (= res!186548 (validMask!0 mask!2385))))

(assert (=> start!33888 e!207152))

(assert (=> start!33888 true))

(declare-fun tp_is_empty!7033 () Bool)

(assert (=> start!33888 tp_is_empty!7033))

(assert (=> start!33888 tp!24755))

(declare-fun e!207154 () Bool)

(declare-fun array_inv!6206 (array!17646) Bool)

(assert (=> start!33888 (and (array_inv!6206 _values!1525) e!207154)))

(declare-fun array_inv!6207 (array!17644) Bool)

(assert (=> start!33888 (array_inv!6207 _keys!1895)))

(declare-fun b!337607 () Bool)

(declare-fun Unit!10440 () Unit!10437)

(assert (=> b!337607 (= e!207150 Unit!10440)))

(declare-fun b!337608 () Bool)

(declare-fun res!186552 () Bool)

(assert (=> b!337608 (=> (not res!186552) (not e!207152))))

(declare-datatypes ((List!4695 0))(
  ( (Nil!4692) (Cons!4691 (h!5547 (_ BitVec 64)) (t!9781 List!4695)) )
))
(declare-fun arrayNoDuplicates!0 (array!17644 (_ BitVec 32) List!4695) Bool)

(assert (=> b!337608 (= res!186552 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4692))))

(declare-fun b!337609 () Bool)

(assert (=> b!337609 (= e!207151 false)))

(declare-fun lt!160494 () Unit!10437)

(assert (=> b!337609 (= lt!160494 e!207150)))

(declare-fun c!52280 () Bool)

(declare-fun arrayContainsKey!0 (array!17644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337609 (= c!52280 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337610 () Bool)

(declare-fun res!186553 () Bool)

(assert (=> b!337610 (=> (not res!186553) (not e!207152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17644 (_ BitVec 32)) Bool)

(assert (=> b!337610 (= res!186553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11955 () Bool)

(declare-fun mapRes!11955 () Bool)

(assert (=> mapIsEmpty!11955 mapRes!11955))

(declare-fun b!337611 () Bool)

(declare-fun e!207155 () Bool)

(assert (=> b!337611 (= e!207154 (and e!207155 mapRes!11955))))

(declare-fun condMapEmpty!11955 () Bool)

(declare-fun mapDefault!11955 () ValueCell!3173)

(assert (=> b!337611 (= condMapEmpty!11955 (= (arr!8350 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3173)) mapDefault!11955)))))

(declare-fun mapNonEmpty!11955 () Bool)

(declare-fun tp!24756 () Bool)

(declare-fun e!207153 () Bool)

(assert (=> mapNonEmpty!11955 (= mapRes!11955 (and tp!24756 e!207153))))

(declare-fun mapKey!11955 () (_ BitVec 32))

(declare-fun mapValue!11955 () ValueCell!3173)

(declare-fun mapRest!11955 () (Array (_ BitVec 32) ValueCell!3173))

(assert (=> mapNonEmpty!11955 (= (arr!8350 _values!1525) (store mapRest!11955 mapKey!11955 mapValue!11955))))

(declare-fun b!337612 () Bool)

(assert (=> b!337612 (= e!207155 tp_is_empty!7033)))

(declare-fun b!337613 () Bool)

(declare-fun res!186551 () Bool)

(assert (=> b!337613 (=> (not res!186551) (not e!207152))))

(assert (=> b!337613 (= res!186551 (and (= (size!8702 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8701 _keys!1895) (size!8702 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337614 () Bool)

(declare-fun res!186550 () Bool)

(assert (=> b!337614 (=> (not res!186550) (not e!207152))))

(declare-datatypes ((tuple2!5084 0))(
  ( (tuple2!5085 (_1!2553 (_ BitVec 64)) (_2!2553 V!10355)) )
))
(declare-datatypes ((List!4696 0))(
  ( (Nil!4693) (Cons!4692 (h!5548 tuple2!5084) (t!9782 List!4696)) )
))
(declare-datatypes ((ListLongMap!3999 0))(
  ( (ListLongMap!4000 (toList!2015 List!4696)) )
))
(declare-fun contains!2081 (ListLongMap!3999 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1544 (array!17644 array!17646 (_ BitVec 32) (_ BitVec 32) V!10355 V!10355 (_ BitVec 32) Int) ListLongMap!3999)

(assert (=> b!337614 (= res!186550 (not (contains!2081 (getCurrentListMap!1544 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337615 () Bool)

(assert (=> b!337615 (= e!207153 tp_is_empty!7033)))

(declare-fun b!337616 () Bool)

(declare-fun res!186554 () Bool)

(assert (=> b!337616 (=> (not res!186554) (not e!207152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337616 (= res!186554 (validKeyInArray!0 k0!1348))))

(assert (= (and start!33888 res!186548) b!337613))

(assert (= (and b!337613 res!186551) b!337610))

(assert (= (and b!337610 res!186553) b!337608))

(assert (= (and b!337608 res!186552) b!337616))

(assert (= (and b!337616 res!186554) b!337614))

(assert (= (and b!337614 res!186550) b!337605))

(assert (= (and b!337605 res!186549) b!337609))

(assert (= (and b!337609 c!52280) b!337606))

(assert (= (and b!337609 (not c!52280)) b!337607))

(assert (= (and b!337611 condMapEmpty!11955) mapIsEmpty!11955))

(assert (= (and b!337611 (not condMapEmpty!11955)) mapNonEmpty!11955))

(assert (= (and mapNonEmpty!11955 ((_ is ValueCellFull!3173) mapValue!11955)) b!337615))

(assert (= (and b!337611 ((_ is ValueCellFull!3173) mapDefault!11955)) b!337612))

(assert (= start!33888 b!337611))

(declare-fun m!341347 () Bool)

(assert (=> b!337605 m!341347))

(declare-fun m!341349 () Bool)

(assert (=> b!337610 m!341349))

(declare-fun m!341351 () Bool)

(assert (=> b!337606 m!341351))

(assert (=> b!337606 m!341351))

(declare-fun m!341353 () Bool)

(assert (=> b!337606 m!341353))

(declare-fun m!341355 () Bool)

(assert (=> b!337609 m!341355))

(declare-fun m!341357 () Bool)

(assert (=> b!337614 m!341357))

(assert (=> b!337614 m!341357))

(declare-fun m!341359 () Bool)

(assert (=> b!337614 m!341359))

(declare-fun m!341361 () Bool)

(assert (=> mapNonEmpty!11955 m!341361))

(declare-fun m!341363 () Bool)

(assert (=> start!33888 m!341363))

(declare-fun m!341365 () Bool)

(assert (=> start!33888 m!341365))

(declare-fun m!341367 () Bool)

(assert (=> start!33888 m!341367))

(declare-fun m!341369 () Bool)

(assert (=> b!337616 m!341369))

(declare-fun m!341371 () Bool)

(assert (=> b!337608 m!341371))

(check-sat (not b!337605) tp_is_empty!7033 (not mapNonEmpty!11955) (not b!337606) (not b_next!7081) (not b!337609) (not b!337616) (not start!33888) (not b!337608) (not b!337610) b_and!14281 (not b!337614))
(check-sat b_and!14281 (not b_next!7081))
