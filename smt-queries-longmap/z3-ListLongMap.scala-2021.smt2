; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35222 () Bool)

(assert start!35222)

(declare-fun b_free!7797 () Bool)

(declare-fun b_next!7797 () Bool)

(assert (=> start!35222 (= b_free!7797 (not b_next!7797))))

(declare-fun tp!26985 () Bool)

(declare-fun b_and!15037 () Bool)

(assert (=> start!35222 (= tp!26985 b_and!15037)))

(declare-fun b!353096 () Bool)

(declare-fun res!195800 () Bool)

(declare-fun e!216209 () Bool)

(assert (=> b!353096 (=> (not res!195800) (not e!216209))))

(declare-datatypes ((array!19089 0))(
  ( (array!19090 (arr!9045 (Array (_ BitVec 32) (_ BitVec 64))) (size!9397 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19089)

(declare-datatypes ((List!5265 0))(
  ( (Nil!5262) (Cons!5261 (h!6117 (_ BitVec 64)) (t!10413 List!5265)) )
))
(declare-fun arrayNoDuplicates!0 (array!19089 (_ BitVec 32) List!5265) Bool)

(assert (=> b!353096 (= res!195800 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5262))))

(declare-fun b!353097 () Bool)

(declare-fun e!216210 () Bool)

(declare-fun tp_is_empty!7749 () Bool)

(assert (=> b!353097 (= e!216210 tp_is_empty!7749)))

(declare-fun mapIsEmpty!13110 () Bool)

(declare-fun mapRes!13110 () Bool)

(assert (=> mapIsEmpty!13110 mapRes!13110))

(declare-fun b!353098 () Bool)

(declare-fun res!195797 () Bool)

(assert (=> b!353098 (=> (not res!195797) (not e!216209))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19089 (_ BitVec 32)) Bool)

(assert (=> b!353098 (= res!195797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!353099 () Bool)

(declare-fun res!195798 () Bool)

(assert (=> b!353099 (=> (not res!195798) (not e!216209))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353099 (= res!195798 (validKeyInArray!0 k0!1348))))

(declare-fun b!353101 () Bool)

(declare-fun e!216212 () Bool)

(assert (=> b!353101 (= e!216212 tp_is_empty!7749)))

(declare-fun b!353102 () Bool)

(declare-fun res!195796 () Bool)

(assert (=> b!353102 (=> (not res!195796) (not e!216209))))

(declare-datatypes ((V!11309 0))(
  ( (V!11310 (val!3919 Int)) )
))
(declare-fun zeroValue!1467 () V!11309)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11309)

(declare-datatypes ((ValueCell!3531 0))(
  ( (ValueCellFull!3531 (v!6111 V!11309)) (EmptyCell!3531) )
))
(declare-datatypes ((array!19091 0))(
  ( (array!19092 (arr!9046 (Array (_ BitVec 32) ValueCell!3531)) (size!9398 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19091)

(declare-datatypes ((tuple2!5646 0))(
  ( (tuple2!5647 (_1!2834 (_ BitVec 64)) (_2!2834 V!11309)) )
))
(declare-datatypes ((List!5266 0))(
  ( (Nil!5263) (Cons!5262 (h!6118 tuple2!5646) (t!10414 List!5266)) )
))
(declare-datatypes ((ListLongMap!4559 0))(
  ( (ListLongMap!4560 (toList!2295 List!5266)) )
))
(declare-fun contains!2369 (ListLongMap!4559 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1816 (array!19089 array!19091 (_ BitVec 32) (_ BitVec 32) V!11309 V!11309 (_ BitVec 32) Int) ListLongMap!4559)

(assert (=> b!353102 (= res!195796 (not (contains!2369 (getCurrentListMap!1816 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!13110 () Bool)

(declare-fun tp!26984 () Bool)

(assert (=> mapNonEmpty!13110 (= mapRes!13110 (and tp!26984 e!216212))))

(declare-fun mapValue!13110 () ValueCell!3531)

(declare-fun mapRest!13110 () (Array (_ BitVec 32) ValueCell!3531))

(declare-fun mapKey!13110 () (_ BitVec 32))

(assert (=> mapNonEmpty!13110 (= (arr!9046 _values!1525) (store mapRest!13110 mapKey!13110 mapValue!13110))))

(declare-fun b!353103 () Bool)

(declare-fun e!216213 () Bool)

(assert (=> b!353103 (= e!216213 (and e!216210 mapRes!13110))))

(declare-fun condMapEmpty!13110 () Bool)

(declare-fun mapDefault!13110 () ValueCell!3531)

(assert (=> b!353103 (= condMapEmpty!13110 (= (arr!9046 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3531)) mapDefault!13110)))))

(declare-fun b!353104 () Bool)

(declare-fun res!195795 () Bool)

(assert (=> b!353104 (=> (not res!195795) (not e!216209))))

(assert (=> b!353104 (= res!195795 (and (= (size!9398 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9397 _keys!1895) (size!9398 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!353100 () Bool)

(assert (=> b!353100 (= e!216209 false)))

(declare-datatypes ((SeekEntryResult!3479 0))(
  ( (MissingZero!3479 (index!16095 (_ BitVec 32))) (Found!3479 (index!16096 (_ BitVec 32))) (Intermediate!3479 (undefined!4291 Bool) (index!16097 (_ BitVec 32)) (x!35129 (_ BitVec 32))) (Undefined!3479) (MissingVacant!3479 (index!16098 (_ BitVec 32))) )
))
(declare-fun lt!165457 () SeekEntryResult!3479)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19089 (_ BitVec 32)) SeekEntryResult!3479)

(assert (=> b!353100 (= lt!165457 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!195799 () Bool)

(assert (=> start!35222 (=> (not res!195799) (not e!216209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35222 (= res!195799 (validMask!0 mask!2385))))

(assert (=> start!35222 e!216209))

(assert (=> start!35222 true))

(assert (=> start!35222 tp_is_empty!7749))

(assert (=> start!35222 tp!26985))

(declare-fun array_inv!6666 (array!19091) Bool)

(assert (=> start!35222 (and (array_inv!6666 _values!1525) e!216213)))

(declare-fun array_inv!6667 (array!19089) Bool)

(assert (=> start!35222 (array_inv!6667 _keys!1895)))

(assert (= (and start!35222 res!195799) b!353104))

(assert (= (and b!353104 res!195795) b!353098))

(assert (= (and b!353098 res!195797) b!353096))

(assert (= (and b!353096 res!195800) b!353099))

(assert (= (and b!353099 res!195798) b!353102))

(assert (= (and b!353102 res!195796) b!353100))

(assert (= (and b!353103 condMapEmpty!13110) mapIsEmpty!13110))

(assert (= (and b!353103 (not condMapEmpty!13110)) mapNonEmpty!13110))

(get-info :version)

(assert (= (and mapNonEmpty!13110 ((_ is ValueCellFull!3531) mapValue!13110)) b!353101))

(assert (= (and b!353103 ((_ is ValueCellFull!3531) mapDefault!13110)) b!353097))

(assert (= start!35222 b!353103))

(declare-fun m!352561 () Bool)

(assert (=> b!353102 m!352561))

(assert (=> b!353102 m!352561))

(declare-fun m!352563 () Bool)

(assert (=> b!353102 m!352563))

(declare-fun m!352565 () Bool)

(assert (=> mapNonEmpty!13110 m!352565))

(declare-fun m!352567 () Bool)

(assert (=> b!353099 m!352567))

(declare-fun m!352569 () Bool)

(assert (=> b!353098 m!352569))

(declare-fun m!352571 () Bool)

(assert (=> start!35222 m!352571))

(declare-fun m!352573 () Bool)

(assert (=> start!35222 m!352573))

(declare-fun m!352575 () Bool)

(assert (=> start!35222 m!352575))

(declare-fun m!352577 () Bool)

(assert (=> b!353096 m!352577))

(declare-fun m!352579 () Bool)

(assert (=> b!353100 m!352579))

(check-sat (not b!353102) (not b!353100) b_and!15037 (not mapNonEmpty!13110) (not b_next!7797) (not b!353099) tp_is_empty!7749 (not b!353098) (not start!35222) (not b!353096))
(check-sat b_and!15037 (not b_next!7797))
