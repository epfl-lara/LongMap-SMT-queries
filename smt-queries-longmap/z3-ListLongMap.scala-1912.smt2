; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34064 () Bool)

(assert start!34064)

(declare-fun b_free!7143 () Bool)

(declare-fun b_next!7143 () Bool)

(assert (=> start!34064 (= b_free!7143 (not b_next!7143))))

(declare-fun tp!24954 () Bool)

(declare-fun b_and!14337 () Bool)

(assert (=> start!34064 (= tp!24954 b_and!14337)))

(declare-fun mapIsEmpty!12060 () Bool)

(declare-fun mapRes!12060 () Bool)

(assert (=> mapIsEmpty!12060 mapRes!12060))

(declare-fun b!339366 () Bool)

(declare-fun e!208214 () Bool)

(declare-fun e!208215 () Bool)

(assert (=> b!339366 (= e!208214 e!208215)))

(declare-fun res!187446 () Bool)

(assert (=> b!339366 (=> (not res!187446) (not e!208215))))

(declare-datatypes ((SeekEntryResult!3252 0))(
  ( (MissingZero!3252 (index!15187 (_ BitVec 32))) (Found!3252 (index!15188 (_ BitVec 32))) (Intermediate!3252 (undefined!4064 Bool) (index!15189 (_ BitVec 32)) (x!33800 (_ BitVec 32))) (Undefined!3252) (MissingVacant!3252 (index!15190 (_ BitVec 32))) )
))
(declare-fun lt!161189 () SeekEntryResult!3252)

(get-info :version)

(assert (=> b!339366 (= res!187446 (and (not ((_ is Found!3252) lt!161189)) ((_ is MissingZero!3252) lt!161189)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17789 0))(
  ( (array!17790 (arr!8418 (Array (_ BitVec 32) (_ BitVec 64))) (size!8770 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17789)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17789 (_ BitVec 32)) SeekEntryResult!3252)

(assert (=> b!339366 (= lt!161189 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339367 () Bool)

(declare-fun res!187443 () Bool)

(assert (=> b!339367 (=> (not res!187443) (not e!208214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339367 (= res!187443 (validKeyInArray!0 k0!1348))))

(declare-fun b!339368 () Bool)

(declare-fun res!187444 () Bool)

(assert (=> b!339368 (=> (not res!187444) (not e!208214))))

(declare-datatypes ((List!4832 0))(
  ( (Nil!4829) (Cons!4828 (h!5684 (_ BitVec 64)) (t!9934 List!4832)) )
))
(declare-fun arrayNoDuplicates!0 (array!17789 (_ BitVec 32) List!4832) Bool)

(assert (=> b!339368 (= res!187444 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4829))))

(declare-fun b!339369 () Bool)

(declare-fun e!208217 () Bool)

(declare-fun tp_is_empty!7095 () Bool)

(assert (=> b!339369 (= e!208217 tp_is_empty!7095)))

(declare-fun b!339370 () Bool)

(declare-fun res!187445 () Bool)

(assert (=> b!339370 (=> (not res!187445) (not e!208214))))

(declare-datatypes ((V!10437 0))(
  ( (V!10438 (val!3592 Int)) )
))
(declare-datatypes ((ValueCell!3204 0))(
  ( (ValueCellFull!3204 (v!5761 V!10437)) (EmptyCell!3204) )
))
(declare-datatypes ((array!17791 0))(
  ( (array!17792 (arr!8419 (Array (_ BitVec 32) ValueCell!3204)) (size!8771 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17791)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!339370 (= res!187445 (and (= (size!8771 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8770 _keys!1895) (size!8771 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!187447 () Bool)

(assert (=> start!34064 (=> (not res!187447) (not e!208214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34064 (= res!187447 (validMask!0 mask!2385))))

(assert (=> start!34064 e!208214))

(assert (=> start!34064 true))

(assert (=> start!34064 tp_is_empty!7095))

(assert (=> start!34064 tp!24954))

(declare-fun e!208218 () Bool)

(declare-fun array_inv!6240 (array!17791) Bool)

(assert (=> start!34064 (and (array_inv!6240 _values!1525) e!208218)))

(declare-fun array_inv!6241 (array!17789) Bool)

(assert (=> start!34064 (array_inv!6241 _keys!1895)))

(declare-fun b!339371 () Bool)

(declare-fun res!187448 () Bool)

(assert (=> b!339371 (=> (not res!187448) (not e!208214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17789 (_ BitVec 32)) Bool)

(assert (=> b!339371 (= res!187448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339372 () Bool)

(assert (=> b!339372 (= e!208218 (and e!208217 mapRes!12060))))

(declare-fun condMapEmpty!12060 () Bool)

(declare-fun mapDefault!12060 () ValueCell!3204)

(assert (=> b!339372 (= condMapEmpty!12060 (= (arr!8419 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3204)) mapDefault!12060)))))

(declare-fun b!339373 () Bool)

(declare-fun e!208212 () Bool)

(assert (=> b!339373 (= e!208212 tp_is_empty!7095)))

(declare-fun b!339374 () Bool)

(declare-fun res!187442 () Bool)

(assert (=> b!339374 (=> (not res!187442) (not e!208214))))

(declare-fun zeroValue!1467 () V!10437)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10437)

(declare-datatypes ((tuple2!5214 0))(
  ( (tuple2!5215 (_1!2618 (_ BitVec 64)) (_2!2618 V!10437)) )
))
(declare-datatypes ((List!4833 0))(
  ( (Nil!4830) (Cons!4829 (h!5685 tuple2!5214) (t!9935 List!4833)) )
))
(declare-datatypes ((ListLongMap!4127 0))(
  ( (ListLongMap!4128 (toList!2079 List!4833)) )
))
(declare-fun contains!2130 (ListLongMap!4127 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1600 (array!17789 array!17791 (_ BitVec 32) (_ BitVec 32) V!10437 V!10437 (_ BitVec 32) Int) ListLongMap!4127)

(assert (=> b!339374 (= res!187442 (not (contains!2130 (getCurrentListMap!1600 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!12060 () Bool)

(declare-fun tp!24953 () Bool)

(assert (=> mapNonEmpty!12060 (= mapRes!12060 (and tp!24953 e!208212))))

(declare-fun mapRest!12060 () (Array (_ BitVec 32) ValueCell!3204))

(declare-fun mapValue!12060 () ValueCell!3204)

(declare-fun mapKey!12060 () (_ BitVec 32))

(assert (=> mapNonEmpty!12060 (= (arr!8419 _values!1525) (store mapRest!12060 mapKey!12060 mapValue!12060))))

(declare-fun b!339375 () Bool)

(declare-datatypes ((Unit!10565 0))(
  ( (Unit!10566) )
))
(declare-fun e!208216 () Unit!10565)

(declare-fun Unit!10567 () Unit!10565)

(assert (=> b!339375 (= e!208216 Unit!10567)))

(declare-fun b!339376 () Bool)

(declare-fun Unit!10568 () Unit!10565)

(assert (=> b!339376 (= e!208216 Unit!10568)))

(declare-fun lt!161190 () Unit!10565)

(declare-fun lemmaArrayContainsKeyThenInListMap!284 (array!17789 array!17791 (_ BitVec 32) (_ BitVec 32) V!10437 V!10437 (_ BitVec 64) (_ BitVec 32) Int) Unit!10565)

(declare-fun arrayScanForKey!0 (array!17789 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!339376 (= lt!161190 (lemmaArrayContainsKeyThenInListMap!284 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!339376 false))

(declare-fun b!339377 () Bool)

(assert (=> b!339377 (= e!208215 false)))

(declare-fun lt!161191 () Unit!10565)

(assert (=> b!339377 (= lt!161191 e!208216)))

(declare-fun c!52554 () Bool)

(declare-fun arrayContainsKey!0 (array!17789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339377 (= c!52554 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!34064 res!187447) b!339370))

(assert (= (and b!339370 res!187445) b!339371))

(assert (= (and b!339371 res!187448) b!339368))

(assert (= (and b!339368 res!187444) b!339367))

(assert (= (and b!339367 res!187443) b!339374))

(assert (= (and b!339374 res!187442) b!339366))

(assert (= (and b!339366 res!187446) b!339377))

(assert (= (and b!339377 c!52554) b!339376))

(assert (= (and b!339377 (not c!52554)) b!339375))

(assert (= (and b!339372 condMapEmpty!12060) mapIsEmpty!12060))

(assert (= (and b!339372 (not condMapEmpty!12060)) mapNonEmpty!12060))

(assert (= (and mapNonEmpty!12060 ((_ is ValueCellFull!3204) mapValue!12060)) b!339373))

(assert (= (and b!339372 ((_ is ValueCellFull!3204) mapDefault!12060)) b!339369))

(assert (= start!34064 b!339372))

(declare-fun m!342361 () Bool)

(assert (=> b!339366 m!342361))

(declare-fun m!342363 () Bool)

(assert (=> b!339371 m!342363))

(declare-fun m!342365 () Bool)

(assert (=> b!339368 m!342365))

(declare-fun m!342367 () Bool)

(assert (=> b!339374 m!342367))

(assert (=> b!339374 m!342367))

(declare-fun m!342369 () Bool)

(assert (=> b!339374 m!342369))

(declare-fun m!342371 () Bool)

(assert (=> b!339377 m!342371))

(declare-fun m!342373 () Bool)

(assert (=> mapNonEmpty!12060 m!342373))

(declare-fun m!342375 () Bool)

(assert (=> start!34064 m!342375))

(declare-fun m!342377 () Bool)

(assert (=> start!34064 m!342377))

(declare-fun m!342379 () Bool)

(assert (=> start!34064 m!342379))

(declare-fun m!342381 () Bool)

(assert (=> b!339367 m!342381))

(declare-fun m!342383 () Bool)

(assert (=> b!339376 m!342383))

(assert (=> b!339376 m!342383))

(declare-fun m!342385 () Bool)

(assert (=> b!339376 m!342385))

(check-sat (not b!339366) (not b!339371) b_and!14337 (not b_next!7143) tp_is_empty!7095 (not b!339377) (not b!339368) (not mapNonEmpty!12060) (not b!339374) (not b!339376) (not start!34064) (not b!339367))
(check-sat b_and!14337 (not b_next!7143))
