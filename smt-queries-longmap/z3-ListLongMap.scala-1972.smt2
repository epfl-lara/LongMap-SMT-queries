; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34680 () Bool)

(assert start!34680)

(declare-fun b_free!7501 () Bool)

(declare-fun b_next!7501 () Bool)

(assert (=> start!34680 (= b_free!7501 (not b_next!7501))))

(declare-fun tp!26067 () Bool)

(declare-fun b_and!14695 () Bool)

(assert (=> start!34680 (= tp!26067 b_and!14695)))

(declare-fun res!191655 () Bool)

(declare-fun e!212296 () Bool)

(assert (=> start!34680 (=> (not res!191655) (not e!212296))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34680 (= res!191655 (validMask!0 mask!2385))))

(assert (=> start!34680 e!212296))

(assert (=> start!34680 true))

(declare-fun tp_is_empty!7453 () Bool)

(assert (=> start!34680 tp_is_empty!7453))

(assert (=> start!34680 tp!26067))

(declare-datatypes ((V!10915 0))(
  ( (V!10916 (val!3771 Int)) )
))
(declare-datatypes ((ValueCell!3383 0))(
  ( (ValueCellFull!3383 (v!5947 V!10915)) (EmptyCell!3383) )
))
(declare-datatypes ((array!18485 0))(
  ( (array!18486 (arr!8753 (Array (_ BitVec 32) ValueCell!3383)) (size!9106 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18485)

(declare-fun e!212293 () Bool)

(declare-fun array_inv!6502 (array!18485) Bool)

(assert (=> start!34680 (and (array_inv!6502 _values!1525) e!212293)))

(declare-datatypes ((array!18487 0))(
  ( (array!18488 (arr!8754 (Array (_ BitVec 32) (_ BitVec 64))) (size!9107 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18487)

(declare-fun array_inv!6503 (array!18487) Bool)

(assert (=> start!34680 (array_inv!6503 _keys!1895)))

(declare-fun b!346407 () Bool)

(declare-fun e!212291 () Bool)

(assert (=> b!346407 (= e!212291 tp_is_empty!7453)))

(declare-fun b!346408 () Bool)

(declare-fun res!191653 () Bool)

(assert (=> b!346408 (=> (not res!191653) (not e!212296))))

(declare-datatypes ((List!5033 0))(
  ( (Nil!5030) (Cons!5029 (h!5885 (_ BitVec 64)) (t!10152 List!5033)) )
))
(declare-fun arrayNoDuplicates!0 (array!18487 (_ BitVec 32) List!5033) Bool)

(assert (=> b!346408 (= res!191653 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5030))))

(declare-fun mapNonEmpty!12636 () Bool)

(declare-fun mapRes!12636 () Bool)

(declare-fun tp!26066 () Bool)

(declare-fun e!212294 () Bool)

(assert (=> mapNonEmpty!12636 (= mapRes!12636 (and tp!26066 e!212294))))

(declare-fun mapValue!12636 () ValueCell!3383)

(declare-fun mapRest!12636 () (Array (_ BitVec 32) ValueCell!3383))

(declare-fun mapKey!12636 () (_ BitVec 32))

(assert (=> mapNonEmpty!12636 (= (arr!8753 _values!1525) (store mapRest!12636 mapKey!12636 mapValue!12636))))

(declare-fun b!346409 () Bool)

(assert (=> b!346409 (= e!212293 (and e!212291 mapRes!12636))))

(declare-fun condMapEmpty!12636 () Bool)

(declare-fun mapDefault!12636 () ValueCell!3383)

(assert (=> b!346409 (= condMapEmpty!12636 (= (arr!8753 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3383)) mapDefault!12636)))))

(declare-fun b!346410 () Bool)

(declare-fun e!212295 () Bool)

(assert (=> b!346410 (= e!212296 e!212295)))

(declare-fun res!191657 () Bool)

(assert (=> b!346410 (=> (not res!191657) (not e!212295))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3372 0))(
  ( (MissingZero!3372 (index!15667 (_ BitVec 32))) (Found!3372 (index!15668 (_ BitVec 32))) (Intermediate!3372 (undefined!4184 Bool) (index!15669 (_ BitVec 32)) (x!34525 (_ BitVec 32))) (Undefined!3372) (MissingVacant!3372 (index!15670 (_ BitVec 32))) )
))
(declare-fun lt!163178 () SeekEntryResult!3372)

(get-info :version)

(assert (=> b!346410 (= res!191657 (and ((_ is Found!3372) lt!163178) (= (select (arr!8754 _keys!1895) (index!15668 lt!163178)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18487 (_ BitVec 32)) SeekEntryResult!3372)

(assert (=> b!346410 (= lt!163178 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346411 () Bool)

(declare-fun res!191651 () Bool)

(assert (=> b!346411 (=> (not res!191651) (not e!212296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18487 (_ BitVec 32)) Bool)

(assert (=> b!346411 (= res!191651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346412 () Bool)

(declare-fun res!191650 () Bool)

(assert (=> b!346412 (=> (not res!191650) (not e!212296))))

(declare-fun zeroValue!1467 () V!10915)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10915)

(declare-datatypes ((tuple2!5416 0))(
  ( (tuple2!5417 (_1!2719 (_ BitVec 64)) (_2!2719 V!10915)) )
))
(declare-datatypes ((List!5034 0))(
  ( (Nil!5031) (Cons!5030 (h!5886 tuple2!5416) (t!10153 List!5034)) )
))
(declare-datatypes ((ListLongMap!4319 0))(
  ( (ListLongMap!4320 (toList!2175 List!5034)) )
))
(declare-fun contains!2250 (ListLongMap!4319 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1681 (array!18487 array!18485 (_ BitVec 32) (_ BitVec 32) V!10915 V!10915 (_ BitVec 32) Int) ListLongMap!4319)

(assert (=> b!346412 (= res!191650 (not (contains!2250 (getCurrentListMap!1681 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!346413 () Bool)

(declare-fun res!191652 () Bool)

(assert (=> b!346413 (=> (not res!191652) (not e!212295))))

(declare-fun arrayContainsKey!0 (array!18487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346413 (= res!191652 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15668 lt!163178)))))

(declare-fun b!346414 () Bool)

(assert (=> b!346414 (= e!212294 tp_is_empty!7453)))

(declare-fun mapIsEmpty!12636 () Bool)

(assert (=> mapIsEmpty!12636 mapRes!12636))

(declare-fun b!346415 () Bool)

(assert (=> b!346415 (= e!212295 (not true))))

(assert (=> b!346415 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10732 0))(
  ( (Unit!10733) )
))
(declare-fun lt!163179 () Unit!10732)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18487 (_ BitVec 64) (_ BitVec 32)) Unit!10732)

(assert (=> b!346415 (= lt!163179 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15668 lt!163178)))))

(declare-fun b!346416 () Bool)

(declare-fun res!191656 () Bool)

(assert (=> b!346416 (=> (not res!191656) (not e!212296))))

(assert (=> b!346416 (= res!191656 (and (= (size!9106 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9107 _keys!1895) (size!9106 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346417 () Bool)

(declare-fun res!191654 () Bool)

(assert (=> b!346417 (=> (not res!191654) (not e!212296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346417 (= res!191654 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34680 res!191655) b!346416))

(assert (= (and b!346416 res!191656) b!346411))

(assert (= (and b!346411 res!191651) b!346408))

(assert (= (and b!346408 res!191653) b!346417))

(assert (= (and b!346417 res!191654) b!346412))

(assert (= (and b!346412 res!191650) b!346410))

(assert (= (and b!346410 res!191657) b!346413))

(assert (= (and b!346413 res!191652) b!346415))

(assert (= (and b!346409 condMapEmpty!12636) mapIsEmpty!12636))

(assert (= (and b!346409 (not condMapEmpty!12636)) mapNonEmpty!12636))

(assert (= (and mapNonEmpty!12636 ((_ is ValueCellFull!3383) mapValue!12636)) b!346414))

(assert (= (and b!346409 ((_ is ValueCellFull!3383) mapDefault!12636)) b!346407))

(assert (= start!34680 b!346409))

(declare-fun m!346997 () Bool)

(assert (=> b!346413 m!346997))

(declare-fun m!346999 () Bool)

(assert (=> b!346408 m!346999))

(declare-fun m!347001 () Bool)

(assert (=> start!34680 m!347001))

(declare-fun m!347003 () Bool)

(assert (=> start!34680 m!347003))

(declare-fun m!347005 () Bool)

(assert (=> start!34680 m!347005))

(declare-fun m!347007 () Bool)

(assert (=> mapNonEmpty!12636 m!347007))

(declare-fun m!347009 () Bool)

(assert (=> b!346415 m!347009))

(declare-fun m!347011 () Bool)

(assert (=> b!346415 m!347011))

(declare-fun m!347013 () Bool)

(assert (=> b!346411 m!347013))

(declare-fun m!347015 () Bool)

(assert (=> b!346412 m!347015))

(assert (=> b!346412 m!347015))

(declare-fun m!347017 () Bool)

(assert (=> b!346412 m!347017))

(declare-fun m!347019 () Bool)

(assert (=> b!346410 m!347019))

(declare-fun m!347021 () Bool)

(assert (=> b!346410 m!347021))

(declare-fun m!347023 () Bool)

(assert (=> b!346417 m!347023))

(check-sat (not b!346413) tp_is_empty!7453 (not b!346412) (not b!346417) (not b_next!7501) b_and!14695 (not b!346415) (not b!346411) (not b!346410) (not b!346408) (not mapNonEmpty!12636) (not start!34680))
(check-sat b_and!14695 (not b_next!7501))
