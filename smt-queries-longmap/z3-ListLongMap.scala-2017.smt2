; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35164 () Bool)

(assert start!35164)

(declare-fun b_free!7771 () Bool)

(declare-fun b_next!7771 () Bool)

(assert (=> start!35164 (= b_free!7771 (not b_next!7771))))

(declare-fun tp!26903 () Bool)

(declare-fun b_and!14983 () Bool)

(assert (=> start!35164 (= tp!26903 b_and!14983)))

(declare-fun b!352343 () Bool)

(declare-fun e!215759 () Bool)

(declare-fun e!215761 () Bool)

(declare-fun mapRes!13068 () Bool)

(assert (=> b!352343 (= e!215759 (and e!215761 mapRes!13068))))

(declare-fun condMapEmpty!13068 () Bool)

(declare-datatypes ((V!11275 0))(
  ( (V!11276 (val!3906 Int)) )
))
(declare-datatypes ((ValueCell!3518 0))(
  ( (ValueCellFull!3518 (v!6091 V!11275)) (EmptyCell!3518) )
))
(declare-datatypes ((array!19017 0))(
  ( (array!19018 (arr!9010 (Array (_ BitVec 32) ValueCell!3518)) (size!9363 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19017)

(declare-fun mapDefault!13068 () ValueCell!3518)

(assert (=> b!352343 (= condMapEmpty!13068 (= (arr!9010 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3518)) mapDefault!13068)))))

(declare-fun b!352344 () Bool)

(declare-fun res!195391 () Bool)

(declare-fun e!215758 () Bool)

(assert (=> b!352344 (=> (not res!195391) (not e!215758))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11275)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!19019 0))(
  ( (array!19020 (arr!9011 (Array (_ BitVec 32) (_ BitVec 64))) (size!9364 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19019)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11275)

(declare-datatypes ((tuple2!5608 0))(
  ( (tuple2!5609 (_1!2815 (_ BitVec 64)) (_2!2815 V!11275)) )
))
(declare-datatypes ((List!5222 0))(
  ( (Nil!5219) (Cons!5218 (h!6074 tuple2!5608) (t!10359 List!5222)) )
))
(declare-datatypes ((ListLongMap!4511 0))(
  ( (ListLongMap!4512 (toList!2271 List!5222)) )
))
(declare-fun contains!2355 (ListLongMap!4511 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1776 (array!19019 array!19017 (_ BitVec 32) (_ BitVec 32) V!11275 V!11275 (_ BitVec 32) Int) ListLongMap!4511)

(assert (=> b!352344 (= res!195391 (not (contains!2355 (getCurrentListMap!1776 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!352345 () Bool)

(declare-fun res!195388 () Bool)

(assert (=> b!352345 (=> (not res!195388) (not e!215758))))

(assert (=> b!352345 (= res!195388 (and (= (size!9363 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9364 _keys!1895) (size!9363 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!195387 () Bool)

(assert (=> start!35164 (=> (not res!195387) (not e!215758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35164 (= res!195387 (validMask!0 mask!2385))))

(assert (=> start!35164 e!215758))

(assert (=> start!35164 true))

(declare-fun tp_is_empty!7723 () Bool)

(assert (=> start!35164 tp_is_empty!7723))

(assert (=> start!35164 tp!26903))

(declare-fun array_inv!6672 (array!19017) Bool)

(assert (=> start!35164 (and (array_inv!6672 _values!1525) e!215759)))

(declare-fun array_inv!6673 (array!19019) Bool)

(assert (=> start!35164 (array_inv!6673 _keys!1895)))

(declare-fun b!352346 () Bool)

(assert (=> b!352346 (= e!215758 false)))

(declare-datatypes ((SeekEntryResult!3470 0))(
  ( (MissingZero!3470 (index!16059 (_ BitVec 32))) (Found!3470 (index!16060 (_ BitVec 32))) (Intermediate!3470 (undefined!4282 Bool) (index!16061 (_ BitVec 32)) (x!35073 (_ BitVec 32))) (Undefined!3470) (MissingVacant!3470 (index!16062 (_ BitVec 32))) )
))
(declare-fun lt!165087 () SeekEntryResult!3470)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19019 (_ BitVec 32)) SeekEntryResult!3470)

(assert (=> b!352346 (= lt!165087 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352347 () Bool)

(declare-fun e!215760 () Bool)

(assert (=> b!352347 (= e!215760 tp_is_empty!7723)))

(declare-fun mapNonEmpty!13068 () Bool)

(declare-fun tp!26904 () Bool)

(assert (=> mapNonEmpty!13068 (= mapRes!13068 (and tp!26904 e!215760))))

(declare-fun mapKey!13068 () (_ BitVec 32))

(declare-fun mapValue!13068 () ValueCell!3518)

(declare-fun mapRest!13068 () (Array (_ BitVec 32) ValueCell!3518))

(assert (=> mapNonEmpty!13068 (= (arr!9010 _values!1525) (store mapRest!13068 mapKey!13068 mapValue!13068))))

(declare-fun mapIsEmpty!13068 () Bool)

(assert (=> mapIsEmpty!13068 mapRes!13068))

(declare-fun b!352348 () Bool)

(declare-fun res!195390 () Bool)

(assert (=> b!352348 (=> (not res!195390) (not e!215758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19019 (_ BitVec 32)) Bool)

(assert (=> b!352348 (= res!195390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352349 () Bool)

(assert (=> b!352349 (= e!215761 tp_is_empty!7723)))

(declare-fun b!352350 () Bool)

(declare-fun res!195392 () Bool)

(assert (=> b!352350 (=> (not res!195392) (not e!215758))))

(declare-datatypes ((List!5223 0))(
  ( (Nil!5220) (Cons!5219 (h!6075 (_ BitVec 64)) (t!10360 List!5223)) )
))
(declare-fun arrayNoDuplicates!0 (array!19019 (_ BitVec 32) List!5223) Bool)

(assert (=> b!352350 (= res!195392 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5220))))

(declare-fun b!352351 () Bool)

(declare-fun res!195389 () Bool)

(assert (=> b!352351 (=> (not res!195389) (not e!215758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352351 (= res!195389 (validKeyInArray!0 k0!1348))))

(assert (= (and start!35164 res!195387) b!352345))

(assert (= (and b!352345 res!195388) b!352348))

(assert (= (and b!352348 res!195390) b!352350))

(assert (= (and b!352350 res!195392) b!352351))

(assert (= (and b!352351 res!195389) b!352344))

(assert (= (and b!352344 res!195391) b!352346))

(assert (= (and b!352343 condMapEmpty!13068) mapIsEmpty!13068))

(assert (= (and b!352343 (not condMapEmpty!13068)) mapNonEmpty!13068))

(get-info :version)

(assert (= (and mapNonEmpty!13068 ((_ is ValueCellFull!3518) mapValue!13068)) b!352347))

(assert (= (and b!352343 ((_ is ValueCellFull!3518) mapDefault!13068)) b!352349))

(assert (= start!35164 b!352343))

(declare-fun m!351477 () Bool)

(assert (=> b!352348 m!351477))

(declare-fun m!351479 () Bool)

(assert (=> b!352344 m!351479))

(assert (=> b!352344 m!351479))

(declare-fun m!351481 () Bool)

(assert (=> b!352344 m!351481))

(declare-fun m!351483 () Bool)

(assert (=> b!352346 m!351483))

(declare-fun m!351485 () Bool)

(assert (=> start!35164 m!351485))

(declare-fun m!351487 () Bool)

(assert (=> start!35164 m!351487))

(declare-fun m!351489 () Bool)

(assert (=> start!35164 m!351489))

(declare-fun m!351491 () Bool)

(assert (=> mapNonEmpty!13068 m!351491))

(declare-fun m!351493 () Bool)

(assert (=> b!352350 m!351493))

(declare-fun m!351495 () Bool)

(assert (=> b!352351 m!351495))

(check-sat tp_is_empty!7723 (not start!35164) (not b!352346) (not b!352350) (not mapNonEmpty!13068) b_and!14983 (not b_next!7771) (not b!352351) (not b!352348) (not b!352344))
(check-sat b_and!14983 (not b_next!7771))
