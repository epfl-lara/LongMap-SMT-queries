; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34896 () Bool)

(assert start!34896)

(declare-fun b_free!7651 () Bool)

(declare-fun b_next!7651 () Bool)

(assert (=> start!34896 (= b_free!7651 (not b_next!7651))))

(declare-fun tp!26526 () Bool)

(declare-fun b_and!14851 () Bool)

(assert (=> start!34896 (= tp!26526 b_and!14851)))

(declare-fun b!349317 () Bool)

(declare-fun res!193629 () Bool)

(declare-fun e!213974 () Bool)

(assert (=> b!349317 (=> (not res!193629) (not e!213974))))

(declare-datatypes ((array!18771 0))(
  ( (array!18772 (arr!8893 (Array (_ BitVec 32) (_ BitVec 64))) (size!9246 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18771)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18771 (_ BitVec 32)) Bool)

(assert (=> b!349317 (= res!193629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!349318 () Bool)

(declare-fun e!213973 () Bool)

(declare-fun tp_is_empty!7603 () Bool)

(assert (=> b!349318 (= e!213973 tp_is_empty!7603)))

(declare-fun b!349319 () Bool)

(declare-fun e!213970 () Bool)

(declare-fun lt!164003 () Bool)

(assert (=> b!349319 (= e!213970 lt!164003)))

(declare-datatypes ((Unit!10806 0))(
  ( (Unit!10807) )
))
(declare-fun lt!164002 () Unit!10806)

(declare-fun e!213968 () Unit!10806)

(assert (=> b!349319 (= lt!164002 e!213968)))

(declare-fun c!53216 () Bool)

(assert (=> b!349319 (= c!53216 lt!164003)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349319 (= lt!164003 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!349320 () Bool)

(declare-fun res!193624 () Bool)

(assert (=> b!349320 (=> (not res!193624) (not e!213974))))

(declare-datatypes ((V!11115 0))(
  ( (V!11116 (val!3846 Int)) )
))
(declare-fun zeroValue!1467 () V!11115)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3458 0))(
  ( (ValueCellFull!3458 (v!6025 V!11115)) (EmptyCell!3458) )
))
(declare-datatypes ((array!18773 0))(
  ( (array!18774 (arr!8894 (Array (_ BitVec 32) ValueCell!3458)) (size!9247 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18773)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11115)

(declare-datatypes ((tuple2!5522 0))(
  ( (tuple2!5523 (_1!2772 (_ BitVec 64)) (_2!2772 V!11115)) )
))
(declare-datatypes ((List!5135 0))(
  ( (Nil!5132) (Cons!5131 (h!5987 tuple2!5522) (t!10260 List!5135)) )
))
(declare-datatypes ((ListLongMap!4425 0))(
  ( (ListLongMap!4426 (toList!2228 List!5135)) )
))
(declare-fun contains!2306 (ListLongMap!4425 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1733 (array!18771 array!18773 (_ BitVec 32) (_ BitVec 32) V!11115 V!11115 (_ BitVec 32) Int) ListLongMap!4425)

(assert (=> b!349320 (= res!193624 (not (contains!2306 (getCurrentListMap!1733 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!349321 () Bool)

(declare-fun res!193623 () Bool)

(assert (=> b!349321 (=> (not res!193623) (not e!213974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349321 (= res!193623 (validKeyInArray!0 k0!1348))))

(declare-fun b!349322 () Bool)

(declare-fun e!213972 () Bool)

(declare-fun mapRes!12870 () Bool)

(assert (=> b!349322 (= e!213972 (and e!213973 mapRes!12870))))

(declare-fun condMapEmpty!12870 () Bool)

(declare-fun mapDefault!12870 () ValueCell!3458)

(assert (=> b!349322 (= condMapEmpty!12870 (= (arr!8894 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3458)) mapDefault!12870)))))

(declare-fun b!349323 () Bool)

(declare-fun e!213971 () Bool)

(assert (=> b!349323 (= e!213971 tp_is_empty!7603)))

(declare-fun b!349324 () Bool)

(declare-fun res!193628 () Bool)

(assert (=> b!349324 (=> (not res!193628) (not e!213974))))

(declare-datatypes ((List!5136 0))(
  ( (Nil!5133) (Cons!5132 (h!5988 (_ BitVec 64)) (t!10261 List!5136)) )
))
(declare-fun arrayNoDuplicates!0 (array!18771 (_ BitVec 32) List!5136) Bool)

(assert (=> b!349324 (= res!193628 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5133))))

(declare-fun res!193626 () Bool)

(assert (=> start!34896 (=> (not res!193626) (not e!213974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34896 (= res!193626 (validMask!0 mask!2385))))

(assert (=> start!34896 e!213974))

(assert (=> start!34896 true))

(assert (=> start!34896 tp_is_empty!7603))

(assert (=> start!34896 tp!26526))

(declare-fun array_inv!6596 (array!18773) Bool)

(assert (=> start!34896 (and (array_inv!6596 _values!1525) e!213972)))

(declare-fun array_inv!6597 (array!18771) Bool)

(assert (=> start!34896 (array_inv!6597 _keys!1895)))

(declare-fun b!349325 () Bool)

(declare-fun Unit!10808 () Unit!10806)

(assert (=> b!349325 (= e!213968 Unit!10808)))

(declare-fun lt!164001 () Unit!10806)

(declare-fun lemmaArrayContainsKeyThenInListMap!319 (array!18771 array!18773 (_ BitVec 32) (_ BitVec 32) V!11115 V!11115 (_ BitVec 64) (_ BitVec 32) Int) Unit!10806)

(declare-fun arrayScanForKey!0 (array!18771 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349325 (= lt!164001 (lemmaArrayContainsKeyThenInListMap!319 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!349325 false))

(declare-fun b!349326 () Bool)

(declare-fun Unit!10809 () Unit!10806)

(assert (=> b!349326 (= e!213968 Unit!10809)))

(declare-fun mapNonEmpty!12870 () Bool)

(declare-fun tp!26525 () Bool)

(assert (=> mapNonEmpty!12870 (= mapRes!12870 (and tp!26525 e!213971))))

(declare-fun mapValue!12870 () ValueCell!3458)

(declare-fun mapKey!12870 () (_ BitVec 32))

(declare-fun mapRest!12870 () (Array (_ BitVec 32) ValueCell!3458))

(assert (=> mapNonEmpty!12870 (= (arr!8894 _values!1525) (store mapRest!12870 mapKey!12870 mapValue!12870))))

(declare-fun b!349327 () Bool)

(declare-fun res!193625 () Bool)

(assert (=> b!349327 (=> (not res!193625) (not e!213974))))

(assert (=> b!349327 (= res!193625 (and (= (size!9247 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9246 _keys!1895) (size!9247 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12870 () Bool)

(assert (=> mapIsEmpty!12870 mapRes!12870))

(declare-fun b!349328 () Bool)

(assert (=> b!349328 (= e!213974 e!213970)))

(declare-fun res!193627 () Bool)

(assert (=> b!349328 (=> (not res!193627) (not e!213970))))

(declare-datatypes ((SeekEntryResult!3428 0))(
  ( (MissingZero!3428 (index!15891 (_ BitVec 32))) (Found!3428 (index!15892 (_ BitVec 32))) (Intermediate!3428 (undefined!4240 Bool) (index!15893 (_ BitVec 32)) (x!34811 (_ BitVec 32))) (Undefined!3428) (MissingVacant!3428 (index!15894 (_ BitVec 32))) )
))
(declare-fun lt!164004 () SeekEntryResult!3428)

(get-info :version)

(assert (=> b!349328 (= res!193627 (and (not ((_ is Found!3428) lt!164004)) ((_ is MissingZero!3428) lt!164004)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18771 (_ BitVec 32)) SeekEntryResult!3428)

(assert (=> b!349328 (= lt!164004 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34896 res!193626) b!349327))

(assert (= (and b!349327 res!193625) b!349317))

(assert (= (and b!349317 res!193629) b!349324))

(assert (= (and b!349324 res!193628) b!349321))

(assert (= (and b!349321 res!193623) b!349320))

(assert (= (and b!349320 res!193624) b!349328))

(assert (= (and b!349328 res!193627) b!349319))

(assert (= (and b!349319 c!53216) b!349325))

(assert (= (and b!349319 (not c!53216)) b!349326))

(assert (= (and b!349322 condMapEmpty!12870) mapIsEmpty!12870))

(assert (= (and b!349322 (not condMapEmpty!12870)) mapNonEmpty!12870))

(assert (= (and mapNonEmpty!12870 ((_ is ValueCellFull!3458) mapValue!12870)) b!349323))

(assert (= (and b!349322 ((_ is ValueCellFull!3458) mapDefault!12870)) b!349318))

(assert (= start!34896 b!349322))

(declare-fun m!349323 () Bool)

(assert (=> start!34896 m!349323))

(declare-fun m!349325 () Bool)

(assert (=> start!34896 m!349325))

(declare-fun m!349327 () Bool)

(assert (=> start!34896 m!349327))

(declare-fun m!349329 () Bool)

(assert (=> b!349319 m!349329))

(declare-fun m!349331 () Bool)

(assert (=> b!349320 m!349331))

(assert (=> b!349320 m!349331))

(declare-fun m!349333 () Bool)

(assert (=> b!349320 m!349333))

(declare-fun m!349335 () Bool)

(assert (=> b!349317 m!349335))

(declare-fun m!349337 () Bool)

(assert (=> b!349321 m!349337))

(declare-fun m!349339 () Bool)

(assert (=> b!349325 m!349339))

(assert (=> b!349325 m!349339))

(declare-fun m!349341 () Bool)

(assert (=> b!349325 m!349341))

(declare-fun m!349343 () Bool)

(assert (=> b!349328 m!349343))

(declare-fun m!349345 () Bool)

(assert (=> b!349324 m!349345))

(declare-fun m!349347 () Bool)

(assert (=> mapNonEmpty!12870 m!349347))

(check-sat (not mapNonEmpty!12870) (not b!349324) (not b!349328) (not b!349320) (not b!349319) tp_is_empty!7603 (not b_next!7651) (not b!349321) (not b!349325) (not start!34896) b_and!14851 (not b!349317))
(check-sat b_and!14851 (not b_next!7651))
