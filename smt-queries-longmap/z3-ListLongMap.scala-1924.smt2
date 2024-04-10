; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34192 () Bool)

(assert start!34192)

(declare-fun b_free!7215 () Bool)

(declare-fun b_next!7215 () Bool)

(assert (=> start!34192 (= b_free!7215 (not b_next!7215))))

(declare-fun tp!25179 () Bool)

(declare-fun b_and!14415 () Bool)

(assert (=> start!34192 (= tp!25179 b_and!14415)))

(declare-fun b!340891 () Bool)

(declare-fun res!188359 () Bool)

(declare-fun e!209100 () Bool)

(assert (=> b!340891 (=> (not res!188359) (not e!209100))))

(declare-datatypes ((array!17935 0))(
  ( (array!17936 (arr!8488 (Array (_ BitVec 32) (_ BitVec 64))) (size!8840 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17935)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340891 (= res!188359 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340892 () Bool)

(declare-fun res!188357 () Bool)

(declare-fun e!209096 () Bool)

(assert (=> b!340892 (=> (not res!188357) (not e!209096))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10533 0))(
  ( (V!10534 (val!3628 Int)) )
))
(declare-fun zeroValue!1467 () V!10533)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3240 0))(
  ( (ValueCellFull!3240 (v!5800 V!10533)) (EmptyCell!3240) )
))
(declare-datatypes ((array!17937 0))(
  ( (array!17938 (arr!8489 (Array (_ BitVec 32) ValueCell!3240)) (size!8841 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17937)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10533)

(declare-datatypes ((tuple2!5264 0))(
  ( (tuple2!5265 (_1!2643 (_ BitVec 64)) (_2!2643 V!10533)) )
))
(declare-datatypes ((List!4884 0))(
  ( (Nil!4881) (Cons!4880 (h!5736 tuple2!5264) (t!9992 List!4884)) )
))
(declare-datatypes ((ListLongMap!4177 0))(
  ( (ListLongMap!4178 (toList!2104 List!4884)) )
))
(declare-fun contains!2158 (ListLongMap!4177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1625 (array!17935 array!17937 (_ BitVec 32) (_ BitVec 32) V!10533 V!10533 (_ BitVec 32) Int) ListLongMap!4177)

(assert (=> b!340892 (= res!188357 (not (contains!2158 (getCurrentListMap!1625 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340893 () Bool)

(declare-fun e!209095 () Bool)

(declare-fun e!209099 () Bool)

(declare-fun mapRes!12177 () Bool)

(assert (=> b!340893 (= e!209095 (and e!209099 mapRes!12177))))

(declare-fun condMapEmpty!12177 () Bool)

(declare-fun mapDefault!12177 () ValueCell!3240)

(assert (=> b!340893 (= condMapEmpty!12177 (= (arr!8489 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3240)) mapDefault!12177)))))

(declare-fun b!340894 () Bool)

(declare-fun tp_is_empty!7167 () Bool)

(assert (=> b!340894 (= e!209099 tp_is_empty!7167)))

(declare-fun b!340895 () Bool)

(declare-fun res!188358 () Bool)

(assert (=> b!340895 (=> (not res!188358) (not e!209096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17935 (_ BitVec 32)) Bool)

(assert (=> b!340895 (= res!188358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12177 () Bool)

(declare-fun tp!25178 () Bool)

(declare-fun e!209098 () Bool)

(assert (=> mapNonEmpty!12177 (= mapRes!12177 (and tp!25178 e!209098))))

(declare-fun mapValue!12177 () ValueCell!3240)

(declare-fun mapRest!12177 () (Array (_ BitVec 32) ValueCell!3240))

(declare-fun mapKey!12177 () (_ BitVec 32))

(assert (=> mapNonEmpty!12177 (= (arr!8489 _values!1525) (store mapRest!12177 mapKey!12177 mapValue!12177))))

(declare-fun b!340896 () Bool)

(assert (=> b!340896 (= e!209098 tp_is_empty!7167)))

(declare-fun b!340897 () Bool)

(declare-fun res!188356 () Bool)

(assert (=> b!340897 (=> (not res!188356) (not e!209096))))

(assert (=> b!340897 (= res!188356 (and (= (size!8841 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8840 _keys!1895) (size!8841 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340898 () Bool)

(assert (=> b!340898 (= e!209096 e!209100)))

(declare-fun res!188353 () Bool)

(assert (=> b!340898 (=> (not res!188353) (not e!209100))))

(declare-datatypes ((SeekEntryResult!3280 0))(
  ( (MissingZero!3280 (index!15299 (_ BitVec 32))) (Found!3280 (index!15300 (_ BitVec 32))) (Intermediate!3280 (undefined!4092 Bool) (index!15301 (_ BitVec 32)) (x!33954 (_ BitVec 32))) (Undefined!3280) (MissingVacant!3280 (index!15302 (_ BitVec 32))) )
))
(declare-fun lt!161670 () SeekEntryResult!3280)

(get-info :version)

(assert (=> b!340898 (= res!188353 (and (not ((_ is Found!3280) lt!161670)) (not ((_ is MissingZero!3280) lt!161670)) ((_ is MissingVacant!3280) lt!161670)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17935 (_ BitVec 32)) SeekEntryResult!3280)

(assert (=> b!340898 (= lt!161670 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!188355 () Bool)

(assert (=> start!34192 (=> (not res!188355) (not e!209096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34192 (= res!188355 (validMask!0 mask!2385))))

(assert (=> start!34192 e!209096))

(assert (=> start!34192 true))

(assert (=> start!34192 tp_is_empty!7167))

(assert (=> start!34192 tp!25179))

(declare-fun array_inv!6288 (array!17937) Bool)

(assert (=> start!34192 (and (array_inv!6288 _values!1525) e!209095)))

(declare-fun array_inv!6289 (array!17935) Bool)

(assert (=> start!34192 (array_inv!6289 _keys!1895)))

(declare-fun b!340899 () Bool)

(declare-fun res!188360 () Bool)

(assert (=> b!340899 (=> (not res!188360) (not e!209096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340899 (= res!188360 (validKeyInArray!0 k0!1348))))

(declare-fun b!340900 () Bool)

(assert (=> b!340900 (= e!209100 false)))

(declare-fun lt!161671 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17935 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340900 (= lt!161671 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12177 () Bool)

(assert (=> mapIsEmpty!12177 mapRes!12177))

(declare-fun b!340901 () Bool)

(declare-fun res!188354 () Bool)

(assert (=> b!340901 (=> (not res!188354) (not e!209096))))

(declare-datatypes ((List!4885 0))(
  ( (Nil!4882) (Cons!4881 (h!5737 (_ BitVec 64)) (t!9993 List!4885)) )
))
(declare-fun arrayNoDuplicates!0 (array!17935 (_ BitVec 32) List!4885) Bool)

(assert (=> b!340901 (= res!188354 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4882))))

(assert (= (and start!34192 res!188355) b!340897))

(assert (= (and b!340897 res!188356) b!340895))

(assert (= (and b!340895 res!188358) b!340901))

(assert (= (and b!340901 res!188354) b!340899))

(assert (= (and b!340899 res!188360) b!340892))

(assert (= (and b!340892 res!188357) b!340898))

(assert (= (and b!340898 res!188353) b!340891))

(assert (= (and b!340891 res!188359) b!340900))

(assert (= (and b!340893 condMapEmpty!12177) mapIsEmpty!12177))

(assert (= (and b!340893 (not condMapEmpty!12177)) mapNonEmpty!12177))

(assert (= (and mapNonEmpty!12177 ((_ is ValueCellFull!3240) mapValue!12177)) b!340896))

(assert (= (and b!340893 ((_ is ValueCellFull!3240) mapDefault!12177)) b!340894))

(assert (= start!34192 b!340893))

(declare-fun m!343471 () Bool)

(assert (=> b!340892 m!343471))

(assert (=> b!340892 m!343471))

(declare-fun m!343473 () Bool)

(assert (=> b!340892 m!343473))

(declare-fun m!343475 () Bool)

(assert (=> b!340895 m!343475))

(declare-fun m!343477 () Bool)

(assert (=> b!340901 m!343477))

(declare-fun m!343479 () Bool)

(assert (=> b!340891 m!343479))

(declare-fun m!343481 () Bool)

(assert (=> b!340898 m!343481))

(declare-fun m!343483 () Bool)

(assert (=> b!340899 m!343483))

(declare-fun m!343485 () Bool)

(assert (=> b!340900 m!343485))

(declare-fun m!343487 () Bool)

(assert (=> start!34192 m!343487))

(declare-fun m!343489 () Bool)

(assert (=> start!34192 m!343489))

(declare-fun m!343491 () Bool)

(assert (=> start!34192 m!343491))

(declare-fun m!343493 () Bool)

(assert (=> mapNonEmpty!12177 m!343493))

(check-sat (not b!340891) (not b!340898) (not b!340895) tp_is_empty!7167 (not b!340901) (not b!340892) (not start!34192) (not b!340900) (not mapNonEmpty!12177) (not b_next!7215) (not b!340899) b_and!14415)
(check-sat b_and!14415 (not b_next!7215))
