; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33668 () Bool)

(assert start!33668)

(declare-fun b_free!6903 () Bool)

(declare-fun b_next!6903 () Bool)

(assert (=> start!33668 (= b_free!6903 (not b_next!6903))))

(declare-fun tp!24212 () Bool)

(declare-fun b_and!14083 () Bool)

(assert (=> start!33668 (= tp!24212 b_and!14083)))

(declare-fun b!334404 () Bool)

(declare-fun res!184352 () Bool)

(declare-fun e!205278 () Bool)

(assert (=> b!334404 (=> (not res!184352) (not e!205278))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10117 0))(
  ( (V!10118 (val!3472 Int)) )
))
(declare-fun zeroValue!1467 () V!10117)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3084 0))(
  ( (ValueCellFull!3084 (v!5634 V!10117)) (EmptyCell!3084) )
))
(declare-datatypes ((array!17303 0))(
  ( (array!17304 (arr!8182 (Array (_ BitVec 32) ValueCell!3084)) (size!8534 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17303)

(declare-datatypes ((array!17305 0))(
  ( (array!17306 (arr!8183 (Array (_ BitVec 32) (_ BitVec 64))) (size!8535 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17305)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10117)

(declare-datatypes ((tuple2!5040 0))(
  ( (tuple2!5041 (_1!2531 (_ BitVec 64)) (_2!2531 V!10117)) )
))
(declare-datatypes ((List!4663 0))(
  ( (Nil!4660) (Cons!4659 (h!5515 tuple2!5040) (t!9751 List!4663)) )
))
(declare-datatypes ((ListLongMap!3953 0))(
  ( (ListLongMap!3954 (toList!1992 List!4663)) )
))
(declare-fun contains!2036 (ListLongMap!3953 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1520 (array!17305 array!17303 (_ BitVec 32) (_ BitVec 32) V!10117 V!10117 (_ BitVec 32) Int) ListLongMap!3953)

(assert (=> b!334404 (= res!184352 (not (contains!2036 (getCurrentListMap!1520 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!11679 () Bool)

(declare-fun mapRes!11679 () Bool)

(assert (=> mapIsEmpty!11679 mapRes!11679))

(declare-fun b!334405 () Bool)

(declare-fun res!184351 () Bool)

(assert (=> b!334405 (=> (not res!184351) (not e!205278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334405 (= res!184351 (validKeyInArray!0 k0!1348))))

(declare-fun b!334406 () Bool)

(declare-fun e!205276 () Bool)

(declare-fun tp_is_empty!6855 () Bool)

(assert (=> b!334406 (= e!205276 tp_is_empty!6855)))

(declare-fun b!334407 () Bool)

(declare-fun res!184354 () Bool)

(assert (=> b!334407 (=> (not res!184354) (not e!205278))))

(declare-datatypes ((List!4664 0))(
  ( (Nil!4661) (Cons!4660 (h!5516 (_ BitVec 64)) (t!9752 List!4664)) )
))
(declare-fun arrayNoDuplicates!0 (array!17305 (_ BitVec 32) List!4664) Bool)

(assert (=> b!334407 (= res!184354 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4661))))

(declare-fun b!334408 () Bool)

(declare-fun e!205279 () Bool)

(declare-fun e!205277 () Bool)

(assert (=> b!334408 (= e!205279 (and e!205277 mapRes!11679))))

(declare-fun condMapEmpty!11679 () Bool)

(declare-fun mapDefault!11679 () ValueCell!3084)

(assert (=> b!334408 (= condMapEmpty!11679 (= (arr!8182 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3084)) mapDefault!11679)))))

(declare-fun res!184355 () Bool)

(assert (=> start!33668 (=> (not res!184355) (not e!205278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33668 (= res!184355 (validMask!0 mask!2385))))

(assert (=> start!33668 e!205278))

(assert (=> start!33668 true))

(assert (=> start!33668 tp_is_empty!6855))

(assert (=> start!33668 tp!24212))

(declare-fun array_inv!6082 (array!17303) Bool)

(assert (=> start!33668 (and (array_inv!6082 _values!1525) e!205279)))

(declare-fun array_inv!6083 (array!17305) Bool)

(assert (=> start!33668 (array_inv!6083 _keys!1895)))

(declare-fun b!334409 () Bool)

(declare-fun res!184350 () Bool)

(assert (=> b!334409 (=> (not res!184350) (not e!205278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17305 (_ BitVec 32)) Bool)

(assert (=> b!334409 (= res!184350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334410 () Bool)

(assert (=> b!334410 (= e!205277 tp_is_empty!6855)))

(declare-fun b!334411 () Bool)

(declare-fun res!184353 () Bool)

(declare-fun e!205280 () Bool)

(assert (=> b!334411 (=> (not res!184353) (not e!205280))))

(declare-datatypes ((SeekEntryResult!3161 0))(
  ( (MissingZero!3161 (index!14823 (_ BitVec 32))) (Found!3161 (index!14824 (_ BitVec 32))) (Intermediate!3161 (undefined!3973 Bool) (index!14825 (_ BitVec 32)) (x!33319 (_ BitVec 32))) (Undefined!3161) (MissingVacant!3161 (index!14826 (_ BitVec 32))) )
))
(declare-fun lt!159516 () SeekEntryResult!3161)

(declare-fun arrayContainsKey!0 (array!17305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334411 (= res!184353 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14824 lt!159516)))))

(declare-fun b!334412 () Bool)

(assert (=> b!334412 (= e!205280 (not true))))

(assert (=> b!334412 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10399 0))(
  ( (Unit!10400) )
))
(declare-fun lt!159517 () Unit!10399)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17305 (_ BitVec 64) (_ BitVec 32)) Unit!10399)

(assert (=> b!334412 (= lt!159517 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14824 lt!159516)))))

(declare-fun b!334413 () Bool)

(declare-fun res!184348 () Bool)

(assert (=> b!334413 (=> (not res!184348) (not e!205278))))

(assert (=> b!334413 (= res!184348 (and (= (size!8534 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8535 _keys!1895) (size!8534 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334414 () Bool)

(assert (=> b!334414 (= e!205278 e!205280)))

(declare-fun res!184349 () Bool)

(assert (=> b!334414 (=> (not res!184349) (not e!205280))))

(get-info :version)

(assert (=> b!334414 (= res!184349 (and ((_ is Found!3161) lt!159516) (= (select (arr!8183 _keys!1895) (index!14824 lt!159516)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17305 (_ BitVec 32)) SeekEntryResult!3161)

(assert (=> b!334414 (= lt!159516 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11679 () Bool)

(declare-fun tp!24213 () Bool)

(assert (=> mapNonEmpty!11679 (= mapRes!11679 (and tp!24213 e!205276))))

(declare-fun mapValue!11679 () ValueCell!3084)

(declare-fun mapRest!11679 () (Array (_ BitVec 32) ValueCell!3084))

(declare-fun mapKey!11679 () (_ BitVec 32))

(assert (=> mapNonEmpty!11679 (= (arr!8182 _values!1525) (store mapRest!11679 mapKey!11679 mapValue!11679))))

(assert (= (and start!33668 res!184355) b!334413))

(assert (= (and b!334413 res!184348) b!334409))

(assert (= (and b!334409 res!184350) b!334407))

(assert (= (and b!334407 res!184354) b!334405))

(assert (= (and b!334405 res!184351) b!334404))

(assert (= (and b!334404 res!184352) b!334414))

(assert (= (and b!334414 res!184349) b!334411))

(assert (= (and b!334411 res!184353) b!334412))

(assert (= (and b!334408 condMapEmpty!11679) mapIsEmpty!11679))

(assert (= (and b!334408 (not condMapEmpty!11679)) mapNonEmpty!11679))

(assert (= (and mapNonEmpty!11679 ((_ is ValueCellFull!3084) mapValue!11679)) b!334406))

(assert (= (and b!334408 ((_ is ValueCellFull!3084) mapDefault!11679)) b!334410))

(assert (= start!33668 b!334408))

(declare-fun m!338473 () Bool)

(assert (=> b!334405 m!338473))

(declare-fun m!338475 () Bool)

(assert (=> b!334404 m!338475))

(assert (=> b!334404 m!338475))

(declare-fun m!338477 () Bool)

(assert (=> b!334404 m!338477))

(declare-fun m!338479 () Bool)

(assert (=> mapNonEmpty!11679 m!338479))

(declare-fun m!338481 () Bool)

(assert (=> b!334409 m!338481))

(declare-fun m!338483 () Bool)

(assert (=> b!334407 m!338483))

(declare-fun m!338485 () Bool)

(assert (=> b!334411 m!338485))

(declare-fun m!338487 () Bool)

(assert (=> b!334414 m!338487))

(declare-fun m!338489 () Bool)

(assert (=> b!334414 m!338489))

(declare-fun m!338491 () Bool)

(assert (=> start!33668 m!338491))

(declare-fun m!338493 () Bool)

(assert (=> start!33668 m!338493))

(declare-fun m!338495 () Bool)

(assert (=> start!33668 m!338495))

(declare-fun m!338497 () Bool)

(assert (=> b!334412 m!338497))

(declare-fun m!338499 () Bool)

(assert (=> b!334412 m!338499))

(check-sat (not b!334407) (not b!334412) (not b!334411) (not b!334404) tp_is_empty!6855 (not mapNonEmpty!11679) (not start!33668) (not b!334409) b_and!14083 (not b!334405) (not b_next!6903) (not b!334414))
(check-sat b_and!14083 (not b_next!6903))
