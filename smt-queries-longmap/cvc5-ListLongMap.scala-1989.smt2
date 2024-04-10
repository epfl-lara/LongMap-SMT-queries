; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34818 () Bool)

(assert start!34818)

(declare-fun b_free!7603 () Bool)

(declare-fun b_next!7603 () Bool)

(assert (=> start!34818 (= b_free!7603 (not b_next!7603))))

(declare-fun tp!26376 () Bool)

(declare-fun b_and!14825 () Bool)

(assert (=> start!34818 (= tp!26376 b_and!14825)))

(declare-fun b!348509 () Bool)

(declare-fun e!213522 () Bool)

(declare-fun tp_is_empty!7555 () Bool)

(assert (=> b!348509 (= e!213522 tp_is_empty!7555)))

(declare-fun b!348510 () Bool)

(declare-fun res!193071 () Bool)

(declare-fun e!213524 () Bool)

(assert (=> b!348510 (=> (not res!193071) (not e!213524))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11051 0))(
  ( (V!11052 (val!3822 Int)) )
))
(declare-datatypes ((ValueCell!3434 0))(
  ( (ValueCellFull!3434 (v!6005 V!11051)) (EmptyCell!3434) )
))
(declare-datatypes ((array!18697 0))(
  ( (array!18698 (arr!8858 (Array (_ BitVec 32) ValueCell!3434)) (size!9210 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18697)

(declare-datatypes ((array!18699 0))(
  ( (array!18700 (arr!8859 (Array (_ BitVec 32) (_ BitVec 64))) (size!9211 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18699)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348510 (= res!193071 (and (= (size!9210 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9211 _keys!1895) (size!9210 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348511 () Bool)

(declare-fun e!213519 () Bool)

(assert (=> b!348511 (= e!213524 e!213519)))

(declare-fun res!193072 () Bool)

(assert (=> b!348511 (=> (not res!193072) (not e!213519))))

(declare-datatypes ((SeekEntryResult!3416 0))(
  ( (MissingZero!3416 (index!15843 (_ BitVec 32))) (Found!3416 (index!15844 (_ BitVec 32))) (Intermediate!3416 (undefined!4228 Bool) (index!15845 (_ BitVec 32)) (x!34720 (_ BitVec 32))) (Undefined!3416) (MissingVacant!3416 (index!15846 (_ BitVec 32))) )
))
(declare-fun lt!163891 () SeekEntryResult!3416)

(assert (=> b!348511 (= res!193072 (and (not (is-Found!3416 lt!163891)) (is-MissingZero!3416 lt!163891)))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18699 (_ BitVec 32)) SeekEntryResult!3416)

(assert (=> b!348511 (= lt!163891 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!348512 () Bool)

(declare-fun res!193065 () Bool)

(assert (=> b!348512 (=> (not res!193065) (not e!213524))))

(declare-fun zeroValue!1467 () V!11051)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11051)

(declare-datatypes ((tuple2!5526 0))(
  ( (tuple2!5527 (_1!2774 (_ BitVec 64)) (_2!2774 V!11051)) )
))
(declare-datatypes ((List!5146 0))(
  ( (Nil!5143) (Cons!5142 (h!5998 tuple2!5526) (t!10276 List!5146)) )
))
(declare-datatypes ((ListLongMap!4439 0))(
  ( (ListLongMap!4440 (toList!2235 List!5146)) )
))
(declare-fun contains!2300 (ListLongMap!4439 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1756 (array!18699 array!18697 (_ BitVec 32) (_ BitVec 32) V!11051 V!11051 (_ BitVec 32) Int) ListLongMap!4439)

(assert (=> b!348512 (= res!193065 (not (contains!2300 (getCurrentListMap!1756 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!348513 () Bool)

(declare-fun res!193070 () Bool)

(assert (=> b!348513 (=> (not res!193070) (not e!213519))))

(declare-fun arrayContainsKey!0 (array!18699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348513 (= res!193070 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!348514 () Bool)

(assert (=> b!348514 (= e!213519 false)))

(declare-fun lt!163890 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18699 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348514 (= lt!163890 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!348515 () Bool)

(declare-fun e!213520 () Bool)

(assert (=> b!348515 (= e!213520 tp_is_empty!7555)))

(declare-fun mapNonEmpty!12792 () Bool)

(declare-fun mapRes!12792 () Bool)

(declare-fun tp!26375 () Bool)

(assert (=> mapNonEmpty!12792 (= mapRes!12792 (and tp!26375 e!213520))))

(declare-fun mapRest!12792 () (Array (_ BitVec 32) ValueCell!3434))

(declare-fun mapValue!12792 () ValueCell!3434)

(declare-fun mapKey!12792 () (_ BitVec 32))

(assert (=> mapNonEmpty!12792 (= (arr!8858 _values!1525) (store mapRest!12792 mapKey!12792 mapValue!12792))))

(declare-fun b!348517 () Bool)

(declare-fun res!193069 () Bool)

(assert (=> b!348517 (=> (not res!193069) (not e!213524))))

(declare-datatypes ((List!5147 0))(
  ( (Nil!5144) (Cons!5143 (h!5999 (_ BitVec 64)) (t!10277 List!5147)) )
))
(declare-fun arrayNoDuplicates!0 (array!18699 (_ BitVec 32) List!5147) Bool)

(assert (=> b!348517 (= res!193069 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5144))))

(declare-fun b!348518 () Bool)

(declare-fun e!213523 () Bool)

(assert (=> b!348518 (= e!213523 (and e!213522 mapRes!12792))))

(declare-fun condMapEmpty!12792 () Bool)

(declare-fun mapDefault!12792 () ValueCell!3434)

