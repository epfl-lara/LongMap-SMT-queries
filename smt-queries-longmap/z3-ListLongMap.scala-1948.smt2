; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34420 () Bool)

(assert start!34420)

(declare-fun b_free!7357 () Bool)

(declare-fun b_next!7357 () Bool)

(assert (=> start!34420 (= b_free!7357 (not b_next!7357))))

(declare-fun tp!25616 () Bool)

(declare-fun b_and!14539 () Bool)

(assert (=> start!34420 (= tp!25616 b_and!14539)))

(declare-fun mapNonEmpty!12402 () Bool)

(declare-fun mapRes!12402 () Bool)

(declare-fun tp!25617 () Bool)

(declare-fun e!210658 () Bool)

(assert (=> mapNonEmpty!12402 (= mapRes!12402 (and tp!25617 e!210658))))

(declare-datatypes ((V!10723 0))(
  ( (V!10724 (val!3699 Int)) )
))
(declare-datatypes ((ValueCell!3311 0))(
  ( (ValueCellFull!3311 (v!5869 V!10723)) (EmptyCell!3311) )
))
(declare-datatypes ((array!18201 0))(
  ( (array!18202 (arr!8617 (Array (_ BitVec 32) ValueCell!3311)) (size!8970 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18201)

(declare-fun mapRest!12402 () (Array (_ BitVec 32) ValueCell!3311))

(declare-fun mapKey!12402 () (_ BitVec 32))

(declare-fun mapValue!12402 () ValueCell!3311)

(assert (=> mapNonEmpty!12402 (= (arr!8617 _values!1525) (store mapRest!12402 mapKey!12402 mapValue!12402))))

(declare-fun b!343592 () Bool)

(declare-fun res!189980 () Bool)

(declare-fun e!210656 () Bool)

(assert (=> b!343592 (=> (not res!189980) (not e!210656))))

(declare-datatypes ((array!18203 0))(
  ( (array!18204 (arr!8618 (Array (_ BitVec 32) (_ BitVec 64))) (size!8971 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18203)

(declare-datatypes ((List!4930 0))(
  ( (Nil!4927) (Cons!4926 (h!5782 (_ BitVec 64)) (t!10037 List!4930)) )
))
(declare-fun arrayNoDuplicates!0 (array!18203 (_ BitVec 32) List!4930) Bool)

(assert (=> b!343592 (= res!189980 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4927))))

(declare-fun res!189978 () Bool)

(assert (=> start!34420 (=> (not res!189978) (not e!210656))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34420 (= res!189978 (validMask!0 mask!2385))))

(assert (=> start!34420 e!210656))

(assert (=> start!34420 true))

(declare-fun tp_is_empty!7309 () Bool)

(assert (=> start!34420 tp_is_empty!7309))

(assert (=> start!34420 tp!25616))

(declare-fun e!210657 () Bool)

(declare-fun array_inv!6404 (array!18201) Bool)

(assert (=> start!34420 (and (array_inv!6404 _values!1525) e!210657)))

(declare-fun array_inv!6405 (array!18203) Bool)

(assert (=> start!34420 (array_inv!6405 _keys!1895)))

(declare-fun b!343593 () Bool)

(declare-fun e!210655 () Bool)

(assert (=> b!343593 (= e!210655 tp_is_empty!7309)))

(declare-fun b!343594 () Bool)

(assert (=> b!343594 (= e!210656 false)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3321 0))(
  ( (MissingZero!3321 (index!15463 (_ BitVec 32))) (Found!3321 (index!15464 (_ BitVec 32))) (Intermediate!3321 (undefined!4133 Bool) (index!15465 (_ BitVec 32)) (x!34222 (_ BitVec 32))) (Undefined!3321) (MissingVacant!3321 (index!15466 (_ BitVec 32))) )
))
(declare-fun lt!162375 () SeekEntryResult!3321)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18203 (_ BitVec 32)) SeekEntryResult!3321)

(assert (=> b!343594 (= lt!162375 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343595 () Bool)

(assert (=> b!343595 (= e!210658 tp_is_empty!7309)))

(declare-fun b!343596 () Bool)

(declare-fun res!189977 () Bool)

(assert (=> b!343596 (=> (not res!189977) (not e!210656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18203 (_ BitVec 32)) Bool)

(assert (=> b!343596 (= res!189977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343597 () Bool)

(assert (=> b!343597 (= e!210657 (and e!210655 mapRes!12402))))

(declare-fun condMapEmpty!12402 () Bool)

(declare-fun mapDefault!12402 () ValueCell!3311)

(assert (=> b!343597 (= condMapEmpty!12402 (= (arr!8617 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3311)) mapDefault!12402)))))

(declare-fun b!343598 () Bool)

(declare-fun res!189979 () Bool)

(assert (=> b!343598 (=> (not res!189979) (not e!210656))))

(declare-fun zeroValue!1467 () V!10723)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10723)

(declare-datatypes ((tuple2!5306 0))(
  ( (tuple2!5307 (_1!2664 (_ BitVec 64)) (_2!2664 V!10723)) )
))
(declare-datatypes ((List!4931 0))(
  ( (Nil!4928) (Cons!4927 (h!5783 tuple2!5306) (t!10038 List!4931)) )
))
(declare-datatypes ((ListLongMap!4209 0))(
  ( (ListLongMap!4210 (toList!2120 List!4931)) )
))
(declare-fun contains!2189 (ListLongMap!4209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1626 (array!18203 array!18201 (_ BitVec 32) (_ BitVec 32) V!10723 V!10723 (_ BitVec 32) Int) ListLongMap!4209)

(assert (=> b!343598 (= res!189979 (not (contains!2189 (getCurrentListMap!1626 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!343599 () Bool)

(declare-fun res!189976 () Bool)

(assert (=> b!343599 (=> (not res!189976) (not e!210656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343599 (= res!189976 (validKeyInArray!0 k0!1348))))

(declare-fun b!343600 () Bool)

(declare-fun res!189975 () Bool)

(assert (=> b!343600 (=> (not res!189975) (not e!210656))))

(assert (=> b!343600 (= res!189975 (and (= (size!8970 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8971 _keys!1895) (size!8970 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12402 () Bool)

(assert (=> mapIsEmpty!12402 mapRes!12402))

(assert (= (and start!34420 res!189978) b!343600))

(assert (= (and b!343600 res!189975) b!343596))

(assert (= (and b!343596 res!189977) b!343592))

(assert (= (and b!343592 res!189980) b!343599))

(assert (= (and b!343599 res!189976) b!343598))

(assert (= (and b!343598 res!189979) b!343594))

(assert (= (and b!343597 condMapEmpty!12402) mapIsEmpty!12402))

(assert (= (and b!343597 (not condMapEmpty!12402)) mapNonEmpty!12402))

(get-info :version)

(assert (= (and mapNonEmpty!12402 ((_ is ValueCellFull!3311) mapValue!12402)) b!343595))

(assert (= (and b!343597 ((_ is ValueCellFull!3311) mapDefault!12402)) b!343593))

(assert (= start!34420 b!343597))

(declare-fun m!344907 () Bool)

(assert (=> b!343592 m!344907))

(declare-fun m!344909 () Bool)

(assert (=> mapNonEmpty!12402 m!344909))

(declare-fun m!344911 () Bool)

(assert (=> b!343596 m!344911))

(declare-fun m!344913 () Bool)

(assert (=> start!34420 m!344913))

(declare-fun m!344915 () Bool)

(assert (=> start!34420 m!344915))

(declare-fun m!344917 () Bool)

(assert (=> start!34420 m!344917))

(declare-fun m!344919 () Bool)

(assert (=> b!343594 m!344919))

(declare-fun m!344921 () Bool)

(assert (=> b!343599 m!344921))

(declare-fun m!344923 () Bool)

(assert (=> b!343598 m!344923))

(assert (=> b!343598 m!344923))

(declare-fun m!344925 () Bool)

(assert (=> b!343598 m!344925))

(check-sat (not b!343594) (not mapNonEmpty!12402) (not b!343599) b_and!14539 (not start!34420) (not b!343598) (not b_next!7357) (not b!343596) tp_is_empty!7309 (not b!343592))
(check-sat b_and!14539 (not b_next!7357))
