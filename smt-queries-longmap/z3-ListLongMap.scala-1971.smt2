; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34690 () Bool)

(assert start!34690)

(declare-fun b_free!7497 () Bool)

(declare-fun b_next!7497 () Bool)

(assert (=> start!34690 (= b_free!7497 (not b_next!7497))))

(declare-fun tp!26054 () Bool)

(declare-fun b_and!14717 () Bool)

(assert (=> start!34690 (= tp!26054 b_and!14717)))

(declare-fun mapIsEmpty!12630 () Bool)

(declare-fun mapRes!12630 () Bool)

(assert (=> mapIsEmpty!12630 mapRes!12630))

(declare-fun mapNonEmpty!12630 () Bool)

(declare-fun tp!26055 () Bool)

(declare-fun e!212435 () Bool)

(assert (=> mapNonEmpty!12630 (= mapRes!12630 (and tp!26055 e!212435))))

(declare-fun mapKey!12630 () (_ BitVec 32))

(declare-datatypes ((V!10909 0))(
  ( (V!10910 (val!3769 Int)) )
))
(declare-datatypes ((ValueCell!3381 0))(
  ( (ValueCellFull!3381 (v!5951 V!10909)) (EmptyCell!3381) )
))
(declare-datatypes ((array!18491 0))(
  ( (array!18492 (arr!8756 (Array (_ BitVec 32) ValueCell!3381)) (size!9108 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18491)

(declare-fun mapRest!12630 () (Array (_ BitVec 32) ValueCell!3381))

(declare-fun mapValue!12630 () ValueCell!3381)

(assert (=> mapNonEmpty!12630 (= (arr!8756 _values!1525) (store mapRest!12630 mapKey!12630 mapValue!12630))))

(declare-fun b!346616 () Bool)

(declare-fun res!191732 () Bool)

(declare-fun e!212433 () Bool)

(assert (=> b!346616 (=> (not res!191732) (not e!212433))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346616 (= res!191732 (validKeyInArray!0 k0!1348))))

(declare-fun res!191735 () Bool)

(assert (=> start!34690 (=> (not res!191735) (not e!212433))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34690 (= res!191735 (validMask!0 mask!2385))))

(assert (=> start!34690 e!212433))

(assert (=> start!34690 true))

(declare-fun tp_is_empty!7449 () Bool)

(assert (=> start!34690 tp_is_empty!7449))

(assert (=> start!34690 tp!26054))

(declare-fun e!212434 () Bool)

(declare-fun array_inv!6484 (array!18491) Bool)

(assert (=> start!34690 (and (array_inv!6484 _values!1525) e!212434)))

(declare-datatypes ((array!18493 0))(
  ( (array!18494 (arr!8757 (Array (_ BitVec 32) (_ BitVec 64))) (size!9109 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18493)

(declare-fun array_inv!6485 (array!18493) Bool)

(assert (=> start!34690 (array_inv!6485 _keys!1895)))

(declare-fun b!346617 () Bool)

(declare-fun e!212431 () Bool)

(assert (=> b!346617 (= e!212431 tp_is_empty!7449)))

(declare-fun b!346618 () Bool)

(declare-fun res!191736 () Bool)

(assert (=> b!346618 (=> (not res!191736) (not e!212433))))

(declare-fun zeroValue!1467 () V!10909)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10909)

(declare-datatypes ((tuple2!5452 0))(
  ( (tuple2!5453 (_1!2737 (_ BitVec 64)) (_2!2737 V!10909)) )
))
(declare-datatypes ((List!5075 0))(
  ( (Nil!5072) (Cons!5071 (h!5927 tuple2!5452) (t!10203 List!5075)) )
))
(declare-datatypes ((ListLongMap!4365 0))(
  ( (ListLongMap!4366 (toList!2198 List!5075)) )
))
(declare-fun contains!2262 (ListLongMap!4365 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1719 (array!18493 array!18491 (_ BitVec 32) (_ BitVec 32) V!10909 V!10909 (_ BitVec 32) Int) ListLongMap!4365)

(assert (=> b!346618 (= res!191736 (not (contains!2262 (getCurrentListMap!1719 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!346619 () Bool)

(declare-fun res!191738 () Bool)

(assert (=> b!346619 (=> (not res!191738) (not e!212433))))

(declare-datatypes ((List!5076 0))(
  ( (Nil!5073) (Cons!5072 (h!5928 (_ BitVec 64)) (t!10204 List!5076)) )
))
(declare-fun arrayNoDuplicates!0 (array!18493 (_ BitVec 32) List!5076) Bool)

(assert (=> b!346619 (= res!191738 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5073))))

(declare-fun b!346620 () Bool)

(declare-fun res!191734 () Bool)

(assert (=> b!346620 (=> (not res!191734) (not e!212433))))

(assert (=> b!346620 (= res!191734 (and (= (size!9108 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9109 _keys!1895) (size!9108 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346621 () Bool)

(assert (=> b!346621 (= e!212434 (and e!212431 mapRes!12630))))

(declare-fun condMapEmpty!12630 () Bool)

(declare-fun mapDefault!12630 () ValueCell!3381)

(assert (=> b!346621 (= condMapEmpty!12630 (= (arr!8756 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3381)) mapDefault!12630)))))

(declare-fun b!346622 () Bool)

(declare-fun res!191733 () Bool)

(declare-fun e!212436 () Bool)

(assert (=> b!346622 (=> (not res!191733) (not e!212436))))

(declare-datatypes ((SeekEntryResult!3377 0))(
  ( (MissingZero!3377 (index!15687 (_ BitVec 32))) (Found!3377 (index!15688 (_ BitVec 32))) (Intermediate!3377 (undefined!4189 Bool) (index!15689 (_ BitVec 32)) (x!34527 (_ BitVec 32))) (Undefined!3377) (MissingVacant!3377 (index!15690 (_ BitVec 32))) )
))
(declare-fun lt!163402 () SeekEntryResult!3377)

(declare-fun arrayContainsKey!0 (array!18493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346622 (= res!191733 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15688 lt!163402)))))

(declare-fun b!346623 () Bool)

(assert (=> b!346623 (= e!212433 e!212436)))

(declare-fun res!191731 () Bool)

(assert (=> b!346623 (=> (not res!191731) (not e!212436))))

(get-info :version)

(assert (=> b!346623 (= res!191731 (and ((_ is Found!3377) lt!163402) (= (select (arr!8757 _keys!1895) (index!15688 lt!163402)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18493 (_ BitVec 32)) SeekEntryResult!3377)

(assert (=> b!346623 (= lt!163402 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346624 () Bool)

(assert (=> b!346624 (= e!212435 tp_is_empty!7449)))

(declare-fun b!346625 () Bool)

(assert (=> b!346625 (= e!212436 (not true))))

(assert (=> b!346625 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10755 0))(
  ( (Unit!10756) )
))
(declare-fun lt!163401 () Unit!10755)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18493 (_ BitVec 64) (_ BitVec 32)) Unit!10755)

(assert (=> b!346625 (= lt!163401 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15688 lt!163402)))))

(declare-fun b!346626 () Bool)

(declare-fun res!191737 () Bool)

(assert (=> b!346626 (=> (not res!191737) (not e!212433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18493 (_ BitVec 32)) Bool)

(assert (=> b!346626 (= res!191737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34690 res!191735) b!346620))

(assert (= (and b!346620 res!191734) b!346626))

(assert (= (and b!346626 res!191737) b!346619))

(assert (= (and b!346619 res!191738) b!346616))

(assert (= (and b!346616 res!191732) b!346618))

(assert (= (and b!346618 res!191736) b!346623))

(assert (= (and b!346623 res!191731) b!346622))

(assert (= (and b!346622 res!191733) b!346625))

(assert (= (and b!346621 condMapEmpty!12630) mapIsEmpty!12630))

(assert (= (and b!346621 (not condMapEmpty!12630)) mapNonEmpty!12630))

(assert (= (and mapNonEmpty!12630 ((_ is ValueCellFull!3381) mapValue!12630)) b!346624))

(assert (= (and b!346621 ((_ is ValueCellFull!3381) mapDefault!12630)) b!346617))

(assert (= start!34690 b!346621))

(declare-fun m!347671 () Bool)

(assert (=> mapNonEmpty!12630 m!347671))

(declare-fun m!347673 () Bool)

(assert (=> b!346623 m!347673))

(declare-fun m!347675 () Bool)

(assert (=> b!346623 m!347675))

(declare-fun m!347677 () Bool)

(assert (=> b!346626 m!347677))

(declare-fun m!347679 () Bool)

(assert (=> start!34690 m!347679))

(declare-fun m!347681 () Bool)

(assert (=> start!34690 m!347681))

(declare-fun m!347683 () Bool)

(assert (=> start!34690 m!347683))

(declare-fun m!347685 () Bool)

(assert (=> b!346618 m!347685))

(assert (=> b!346618 m!347685))

(declare-fun m!347687 () Bool)

(assert (=> b!346618 m!347687))

(declare-fun m!347689 () Bool)

(assert (=> b!346619 m!347689))

(declare-fun m!347691 () Bool)

(assert (=> b!346625 m!347691))

(declare-fun m!347693 () Bool)

(assert (=> b!346625 m!347693))

(declare-fun m!347695 () Bool)

(assert (=> b!346622 m!347695))

(declare-fun m!347697 () Bool)

(assert (=> b!346616 m!347697))

(check-sat (not b!346622) (not b!346618) (not b!346616) (not b!346619) tp_is_empty!7449 (not b!346625) (not b!346626) (not start!34690) (not b!346623) b_and!14717 (not mapNonEmpty!12630) (not b_next!7497))
(check-sat b_and!14717 (not b_next!7497))
