; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34216 () Bool)

(assert start!34216)

(declare-fun b_free!7239 () Bool)

(declare-fun b_next!7239 () Bool)

(assert (=> start!34216 (= b_free!7239 (not b_next!7239))))

(declare-fun tp!25250 () Bool)

(declare-fun b_and!14439 () Bool)

(assert (=> start!34216 (= tp!25250 b_and!14439)))

(declare-fun b!341287 () Bool)

(declare-fun e!209311 () Bool)

(assert (=> b!341287 (= e!209311 false)))

(declare-fun lt!161742 () (_ BitVec 32))

(declare-datatypes ((array!17977 0))(
  ( (array!17978 (arr!8509 (Array (_ BitVec 32) (_ BitVec 64))) (size!8861 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17977)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17977 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341287 (= lt!161742 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341288 () Bool)

(declare-fun res!188646 () Bool)

(assert (=> b!341288 (=> (not res!188646) (not e!209311))))

(declare-fun arrayContainsKey!0 (array!17977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341288 (= res!188646 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341289 () Bool)

(declare-fun e!209316 () Bool)

(declare-fun tp_is_empty!7191 () Bool)

(assert (=> b!341289 (= e!209316 tp_is_empty!7191)))

(declare-fun b!341290 () Bool)

(declare-fun res!188642 () Bool)

(declare-fun e!209313 () Bool)

(assert (=> b!341290 (=> (not res!188642) (not e!209313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341290 (= res!188642 (validKeyInArray!0 k0!1348))))

(declare-fun b!341291 () Bool)

(assert (=> b!341291 (= e!209313 e!209311)))

(declare-fun res!188643 () Bool)

(assert (=> b!341291 (=> (not res!188643) (not e!209311))))

(declare-datatypes ((SeekEntryResult!3286 0))(
  ( (MissingZero!3286 (index!15323 (_ BitVec 32))) (Found!3286 (index!15324 (_ BitVec 32))) (Intermediate!3286 (undefined!4098 Bool) (index!15325 (_ BitVec 32)) (x!33992 (_ BitVec 32))) (Undefined!3286) (MissingVacant!3286 (index!15326 (_ BitVec 32))) )
))
(declare-fun lt!161743 () SeekEntryResult!3286)

(get-info :version)

(assert (=> b!341291 (= res!188643 (and (not ((_ is Found!3286) lt!161743)) (not ((_ is MissingZero!3286) lt!161743)) ((_ is MissingVacant!3286) lt!161743)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17977 (_ BitVec 32)) SeekEntryResult!3286)

(assert (=> b!341291 (= lt!161743 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!188647 () Bool)

(assert (=> start!34216 (=> (not res!188647) (not e!209313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34216 (= res!188647 (validMask!0 mask!2385))))

(assert (=> start!34216 e!209313))

(assert (=> start!34216 true))

(assert (=> start!34216 tp_is_empty!7191))

(assert (=> start!34216 tp!25250))

(declare-datatypes ((V!10565 0))(
  ( (V!10566 (val!3640 Int)) )
))
(declare-datatypes ((ValueCell!3252 0))(
  ( (ValueCellFull!3252 (v!5812 V!10565)) (EmptyCell!3252) )
))
(declare-datatypes ((array!17979 0))(
  ( (array!17980 (arr!8510 (Array (_ BitVec 32) ValueCell!3252)) (size!8862 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17979)

(declare-fun e!209315 () Bool)

(declare-fun array_inv!6302 (array!17979) Bool)

(assert (=> start!34216 (and (array_inv!6302 _values!1525) e!209315)))

(declare-fun array_inv!6303 (array!17977) Bool)

(assert (=> start!34216 (array_inv!6303 _keys!1895)))

(declare-fun b!341292 () Bool)

(declare-fun res!188641 () Bool)

(assert (=> b!341292 (=> (not res!188641) (not e!209313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17977 (_ BitVec 32)) Bool)

(assert (=> b!341292 (= res!188641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341293 () Bool)

(declare-fun res!188644 () Bool)

(assert (=> b!341293 (=> (not res!188644) (not e!209313))))

(declare-fun zeroValue!1467 () V!10565)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10565)

(declare-datatypes ((tuple2!5280 0))(
  ( (tuple2!5281 (_1!2651 (_ BitVec 64)) (_2!2651 V!10565)) )
))
(declare-datatypes ((List!4896 0))(
  ( (Nil!4893) (Cons!4892 (h!5748 tuple2!5280) (t!10004 List!4896)) )
))
(declare-datatypes ((ListLongMap!4193 0))(
  ( (ListLongMap!4194 (toList!2112 List!4896)) )
))
(declare-fun contains!2166 (ListLongMap!4193 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1633 (array!17977 array!17979 (_ BitVec 32) (_ BitVec 32) V!10565 V!10565 (_ BitVec 32) Int) ListLongMap!4193)

(assert (=> b!341293 (= res!188644 (not (contains!2166 (getCurrentListMap!1633 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!12213 () Bool)

(declare-fun mapRes!12213 () Bool)

(declare-fun tp!25251 () Bool)

(assert (=> mapNonEmpty!12213 (= mapRes!12213 (and tp!25251 e!209316))))

(declare-fun mapRest!12213 () (Array (_ BitVec 32) ValueCell!3252))

(declare-fun mapValue!12213 () ValueCell!3252)

(declare-fun mapKey!12213 () (_ BitVec 32))

(assert (=> mapNonEmpty!12213 (= (arr!8510 _values!1525) (store mapRest!12213 mapKey!12213 mapValue!12213))))

(declare-fun b!341294 () Bool)

(declare-fun res!188645 () Bool)

(assert (=> b!341294 (=> (not res!188645) (not e!209313))))

(declare-datatypes ((List!4897 0))(
  ( (Nil!4894) (Cons!4893 (h!5749 (_ BitVec 64)) (t!10005 List!4897)) )
))
(declare-fun arrayNoDuplicates!0 (array!17977 (_ BitVec 32) List!4897) Bool)

(assert (=> b!341294 (= res!188645 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4894))))

(declare-fun mapIsEmpty!12213 () Bool)

(assert (=> mapIsEmpty!12213 mapRes!12213))

(declare-fun b!341295 () Bool)

(declare-fun e!209312 () Bool)

(assert (=> b!341295 (= e!209312 tp_is_empty!7191)))

(declare-fun b!341296 () Bool)

(assert (=> b!341296 (= e!209315 (and e!209312 mapRes!12213))))

(declare-fun condMapEmpty!12213 () Bool)

(declare-fun mapDefault!12213 () ValueCell!3252)

(assert (=> b!341296 (= condMapEmpty!12213 (= (arr!8510 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3252)) mapDefault!12213)))))

(declare-fun b!341297 () Bool)

(declare-fun res!188648 () Bool)

(assert (=> b!341297 (=> (not res!188648) (not e!209313))))

(assert (=> b!341297 (= res!188648 (and (= (size!8862 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8861 _keys!1895) (size!8862 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!34216 res!188647) b!341297))

(assert (= (and b!341297 res!188648) b!341292))

(assert (= (and b!341292 res!188641) b!341294))

(assert (= (and b!341294 res!188645) b!341290))

(assert (= (and b!341290 res!188642) b!341293))

(assert (= (and b!341293 res!188644) b!341291))

(assert (= (and b!341291 res!188643) b!341288))

(assert (= (and b!341288 res!188646) b!341287))

(assert (= (and b!341296 condMapEmpty!12213) mapIsEmpty!12213))

(assert (= (and b!341296 (not condMapEmpty!12213)) mapNonEmpty!12213))

(assert (= (and mapNonEmpty!12213 ((_ is ValueCellFull!3252) mapValue!12213)) b!341289))

(assert (= (and b!341296 ((_ is ValueCellFull!3252) mapDefault!12213)) b!341295))

(assert (= start!34216 b!341296))

(declare-fun m!343759 () Bool)

(assert (=> b!341294 m!343759))

(declare-fun m!343761 () Bool)

(assert (=> b!341293 m!343761))

(assert (=> b!341293 m!343761))

(declare-fun m!343763 () Bool)

(assert (=> b!341293 m!343763))

(declare-fun m!343765 () Bool)

(assert (=> b!341287 m!343765))

(declare-fun m!343767 () Bool)

(assert (=> mapNonEmpty!12213 m!343767))

(declare-fun m!343769 () Bool)

(assert (=> b!341288 m!343769))

(declare-fun m!343771 () Bool)

(assert (=> b!341292 m!343771))

(declare-fun m!343773 () Bool)

(assert (=> b!341290 m!343773))

(declare-fun m!343775 () Bool)

(assert (=> start!34216 m!343775))

(declare-fun m!343777 () Bool)

(assert (=> start!34216 m!343777))

(declare-fun m!343779 () Bool)

(assert (=> start!34216 m!343779))

(declare-fun m!343781 () Bool)

(assert (=> b!341291 m!343781))

(check-sat (not b!341294) b_and!14439 (not b_next!7239) (not b!341287) tp_is_empty!7191 (not start!34216) (not b!341291) (not b!341288) (not mapNonEmpty!12213) (not b!341292) (not b!341290) (not b!341293))
(check-sat b_and!14439 (not b_next!7239))
