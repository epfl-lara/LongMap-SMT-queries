; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34218 () Bool)

(assert start!34218)

(declare-fun b_free!7255 () Bool)

(declare-fun b_next!7255 () Bool)

(assert (=> start!34218 (= b_free!7255 (not b_next!7255))))

(declare-fun tp!25298 () Bool)

(declare-fun b_and!14429 () Bool)

(assert (=> start!34218 (= tp!25298 b_and!14429)))

(declare-fun b!341278 () Bool)

(declare-fun res!188708 () Bool)

(declare-fun e!209282 () Bool)

(assert (=> b!341278 (=> (not res!188708) (not e!209282))))

(declare-datatypes ((array!17989 0))(
  ( (array!17990 (arr!8515 (Array (_ BitVec 32) (_ BitVec 64))) (size!8868 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17989)

(declare-datatypes ((List!4856 0))(
  ( (Nil!4853) (Cons!4852 (h!5708 (_ BitVec 64)) (t!9955 List!4856)) )
))
(declare-fun arrayNoDuplicates!0 (array!17989 (_ BitVec 32) List!4856) Bool)

(assert (=> b!341278 (= res!188708 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4853))))

(declare-fun b!341279 () Bool)

(declare-fun res!188707 () Bool)

(assert (=> b!341279 (=> (not res!188707) (not e!209282))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341279 (= res!188707 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12237 () Bool)

(declare-fun mapRes!12237 () Bool)

(declare-fun tp!25299 () Bool)

(declare-fun e!209281 () Bool)

(assert (=> mapNonEmpty!12237 (= mapRes!12237 (and tp!25299 e!209281))))

(declare-datatypes ((V!10587 0))(
  ( (V!10588 (val!3648 Int)) )
))
(declare-datatypes ((ValueCell!3260 0))(
  ( (ValueCellFull!3260 (v!5814 V!10587)) (EmptyCell!3260) )
))
(declare-fun mapValue!12237 () ValueCell!3260)

(declare-datatypes ((array!17991 0))(
  ( (array!17992 (arr!8516 (Array (_ BitVec 32) ValueCell!3260)) (size!8869 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17991)

(declare-fun mapRest!12237 () (Array (_ BitVec 32) ValueCell!3260))

(declare-fun mapKey!12237 () (_ BitVec 32))

(assert (=> mapNonEmpty!12237 (= (arr!8516 _values!1525) (store mapRest!12237 mapKey!12237 mapValue!12237))))

(declare-fun res!188703 () Bool)

(assert (=> start!34218 (=> (not res!188703) (not e!209282))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34218 (= res!188703 (validMask!0 mask!2385))))

(assert (=> start!34218 e!209282))

(assert (=> start!34218 true))

(declare-fun tp_is_empty!7207 () Bool)

(assert (=> start!34218 tp_is_empty!7207))

(assert (=> start!34218 tp!25298))

(declare-fun e!209285 () Bool)

(declare-fun array_inv!6334 (array!17991) Bool)

(assert (=> start!34218 (and (array_inv!6334 _values!1525) e!209285)))

(declare-fun array_inv!6335 (array!17989) Bool)

(assert (=> start!34218 (array_inv!6335 _keys!1895)))

(declare-fun b!341280 () Bool)

(declare-fun e!209283 () Bool)

(assert (=> b!341280 (= e!209285 (and e!209283 mapRes!12237))))

(declare-fun condMapEmpty!12237 () Bool)

(declare-fun mapDefault!12237 () ValueCell!3260)

(assert (=> b!341280 (= condMapEmpty!12237 (= (arr!8516 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3260)) mapDefault!12237)))))

(declare-fun b!341281 () Bool)

(declare-fun res!188702 () Bool)

(assert (=> b!341281 (=> (not res!188702) (not e!209282))))

(declare-fun zeroValue!1467 () V!10587)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10587)

(declare-datatypes ((tuple2!5232 0))(
  ( (tuple2!5233 (_1!2627 (_ BitVec 64)) (_2!2627 V!10587)) )
))
(declare-datatypes ((List!4857 0))(
  ( (Nil!4854) (Cons!4853 (h!5709 tuple2!5232) (t!9956 List!4857)) )
))
(declare-datatypes ((ListLongMap!4135 0))(
  ( (ListLongMap!4136 (toList!2083 List!4857)) )
))
(declare-fun contains!2148 (ListLongMap!4135 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1589 (array!17989 array!17991 (_ BitVec 32) (_ BitVec 32) V!10587 V!10587 (_ BitVec 32) Int) ListLongMap!4135)

(assert (=> b!341281 (= res!188702 (not (contains!2148 (getCurrentListMap!1589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!341282 () Bool)

(assert (=> b!341282 (= e!209283 tp_is_empty!7207)))

(declare-fun b!341283 () Bool)

(declare-fun e!209284 () Bool)

(assert (=> b!341283 (= e!209282 e!209284)))

(declare-fun res!188704 () Bool)

(assert (=> b!341283 (=> (not res!188704) (not e!209284))))

(declare-datatypes ((SeekEntryResult!3280 0))(
  ( (MissingZero!3280 (index!15299 (_ BitVec 32))) (Found!3280 (index!15300 (_ BitVec 32))) (Intermediate!3280 (undefined!4092 Bool) (index!15301 (_ BitVec 32)) (x!34005 (_ BitVec 32))) (Undefined!3280) (MissingVacant!3280 (index!15302 (_ BitVec 32))) )
))
(declare-fun lt!161557 () SeekEntryResult!3280)

(get-info :version)

(assert (=> b!341283 (= res!188704 (and (not ((_ is Found!3280) lt!161557)) (not ((_ is MissingZero!3280) lt!161557)) ((_ is MissingVacant!3280) lt!161557)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17989 (_ BitVec 32)) SeekEntryResult!3280)

(assert (=> b!341283 (= lt!161557 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!341284 () Bool)

(assert (=> b!341284 (= e!209281 tp_is_empty!7207)))

(declare-fun mapIsEmpty!12237 () Bool)

(assert (=> mapIsEmpty!12237 mapRes!12237))

(declare-fun b!341285 () Bool)

(declare-datatypes ((Unit!10570 0))(
  ( (Unit!10571) )
))
(declare-fun e!209286 () Unit!10570)

(declare-fun Unit!10572 () Unit!10570)

(assert (=> b!341285 (= e!209286 Unit!10572)))

(declare-fun lt!161559 () Unit!10570)

(declare-fun lemmaArrayContainsKeyThenInListMap!288 (array!17989 array!17991 (_ BitVec 32) (_ BitVec 32) V!10587 V!10587 (_ BitVec 64) (_ BitVec 32) Int) Unit!10570)

(declare-fun arrayScanForKey!0 (array!17989 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341285 (= lt!161559 (lemmaArrayContainsKeyThenInListMap!288 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!341285 false))

(declare-fun b!341286 () Bool)

(declare-fun res!188706 () Bool)

(assert (=> b!341286 (=> (not res!188706) (not e!209282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17989 (_ BitVec 32)) Bool)

(assert (=> b!341286 (= res!188706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341287 () Bool)

(declare-fun Unit!10573 () Unit!10570)

(assert (=> b!341287 (= e!209286 Unit!10573)))

(declare-fun b!341288 () Bool)

(declare-fun res!188705 () Bool)

(assert (=> b!341288 (=> (not res!188705) (not e!209282))))

(assert (=> b!341288 (= res!188705 (and (= (size!8869 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8868 _keys!1895) (size!8869 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341289 () Bool)

(assert (=> b!341289 (= e!209284 false)))

(declare-fun lt!161558 () Unit!10570)

(assert (=> b!341289 (= lt!161558 e!209286)))

(declare-fun c!52613 () Bool)

(declare-fun arrayContainsKey!0 (array!17989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341289 (= c!52613 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!34218 res!188703) b!341288))

(assert (= (and b!341288 res!188705) b!341286))

(assert (= (and b!341286 res!188706) b!341278))

(assert (= (and b!341278 res!188708) b!341279))

(assert (= (and b!341279 res!188707) b!341281))

(assert (= (and b!341281 res!188702) b!341283))

(assert (= (and b!341283 res!188704) b!341289))

(assert (= (and b!341289 c!52613) b!341285))

(assert (= (and b!341289 (not c!52613)) b!341287))

(assert (= (and b!341280 condMapEmpty!12237) mapIsEmpty!12237))

(assert (= (and b!341280 (not condMapEmpty!12237)) mapNonEmpty!12237))

(assert (= (and mapNonEmpty!12237 ((_ is ValueCellFull!3260) mapValue!12237)) b!341284))

(assert (= (and b!341280 ((_ is ValueCellFull!3260) mapDefault!12237)) b!341282))

(assert (= start!34218 b!341280))

(declare-fun m!343221 () Bool)

(assert (=> b!341283 m!343221))

(declare-fun m!343223 () Bool)

(assert (=> b!341286 m!343223))

(declare-fun m!343225 () Bool)

(assert (=> b!341285 m!343225))

(assert (=> b!341285 m!343225))

(declare-fun m!343227 () Bool)

(assert (=> b!341285 m!343227))

(declare-fun m!343229 () Bool)

(assert (=> mapNonEmpty!12237 m!343229))

(declare-fun m!343231 () Bool)

(assert (=> b!341281 m!343231))

(assert (=> b!341281 m!343231))

(declare-fun m!343233 () Bool)

(assert (=> b!341281 m!343233))

(declare-fun m!343235 () Bool)

(assert (=> b!341278 m!343235))

(declare-fun m!343237 () Bool)

(assert (=> start!34218 m!343237))

(declare-fun m!343239 () Bool)

(assert (=> start!34218 m!343239))

(declare-fun m!343241 () Bool)

(assert (=> start!34218 m!343241))

(declare-fun m!343243 () Bool)

(assert (=> b!341279 m!343243))

(declare-fun m!343245 () Bool)

(assert (=> b!341289 m!343245))

(check-sat (not mapNonEmpty!12237) (not start!34218) (not b!341285) (not b_next!7255) (not b!341289) b_and!14429 (not b!341279) (not b!341281) (not b!341278) tp_is_empty!7207 (not b!341283) (not b!341286))
(check-sat b_and!14429 (not b_next!7255))
