; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33894 () Bool)

(assert start!33894)

(declare-fun b_free!7073 () Bool)

(declare-fun b_next!7073 () Bool)

(assert (=> start!33894 (= b_free!7073 (not b_next!7073))))

(declare-fun tp!24732 () Bool)

(declare-fun b_and!14259 () Bool)

(assert (=> start!33894 (= tp!24732 b_and!14259)))

(declare-fun res!186463 () Bool)

(declare-fun e!207109 () Bool)

(assert (=> start!33894 (=> (not res!186463) (not e!207109))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33894 (= res!186463 (validMask!0 mask!2385))))

(assert (=> start!33894 e!207109))

(assert (=> start!33894 true))

(declare-fun tp_is_empty!7025 () Bool)

(assert (=> start!33894 tp_is_empty!7025))

(assert (=> start!33894 tp!24732))

(declare-datatypes ((V!10343 0))(
  ( (V!10344 (val!3557 Int)) )
))
(declare-datatypes ((ValueCell!3169 0))(
  ( (ValueCellFull!3169 (v!5722 V!10343)) (EmptyCell!3169) )
))
(declare-datatypes ((array!17645 0))(
  ( (array!17646 (arr!8350 (Array (_ BitVec 32) ValueCell!3169)) (size!8702 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17645)

(declare-fun e!207113 () Bool)

(declare-fun array_inv!6198 (array!17645) Bool)

(assert (=> start!33894 (and (array_inv!6198 _values!1525) e!207113)))

(declare-datatypes ((array!17647 0))(
  ( (array!17648 (arr!8351 (Array (_ BitVec 32) (_ BitVec 64))) (size!8703 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17647)

(declare-fun array_inv!6199 (array!17647) Bool)

(assert (=> start!33894 (array_inv!6199 _keys!1895)))

(declare-fun b!337524 () Bool)

(declare-fun e!207111 () Bool)

(assert (=> b!337524 (= e!207111 false)))

(declare-fun lt!160449 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17647 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337524 (= lt!160449 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!337525 () Bool)

(declare-fun e!207114 () Bool)

(assert (=> b!337525 (= e!207114 tp_is_empty!7025)))

(declare-fun b!337526 () Bool)

(declare-fun e!207110 () Bool)

(assert (=> b!337526 (= e!207110 tp_is_empty!7025)))

(declare-fun mapIsEmpty!11943 () Bool)

(declare-fun mapRes!11943 () Bool)

(assert (=> mapIsEmpty!11943 mapRes!11943))

(declare-fun b!337527 () Bool)

(declare-fun res!186461 () Bool)

(assert (=> b!337527 (=> (not res!186461) (not e!207111))))

(declare-fun arrayContainsKey!0 (array!17647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337527 (= res!186461 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!337528 () Bool)

(declare-fun res!186458 () Bool)

(assert (=> b!337528 (=> (not res!186458) (not e!207109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337528 (= res!186458 (validKeyInArray!0 k!1348))))

(declare-fun b!337529 () Bool)

(assert (=> b!337529 (= e!207109 e!207111)))

(declare-fun res!186462 () Bool)

(assert (=> b!337529 (=> (not res!186462) (not e!207111))))

(declare-datatypes ((SeekEntryResult!3227 0))(
  ( (MissingZero!3227 (index!15087 (_ BitVec 32))) (Found!3227 (index!15088 (_ BitVec 32))) (Intermediate!3227 (undefined!4039 Bool) (index!15089 (_ BitVec 32)) (x!33639 (_ BitVec 32))) (Undefined!3227) (MissingVacant!3227 (index!15090 (_ BitVec 32))) )
))
(declare-fun lt!160450 () SeekEntryResult!3227)

(assert (=> b!337529 (= res!186462 (and (not (is-Found!3227 lt!160450)) (is-MissingZero!3227 lt!160450)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17647 (_ BitVec 32)) SeekEntryResult!3227)

(assert (=> b!337529 (= lt!160450 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!337530 () Bool)

(declare-fun res!186464 () Bool)

(assert (=> b!337530 (=> (not res!186464) (not e!207109))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337530 (= res!186464 (and (= (size!8702 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8703 _keys!1895) (size!8702 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337531 () Bool)

(declare-fun res!186459 () Bool)

(assert (=> b!337531 (=> (not res!186459) (not e!207109))))

(declare-fun zeroValue!1467 () V!10343)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10343)

(declare-datatypes ((tuple2!5166 0))(
  ( (tuple2!5167 (_1!2594 (_ BitVec 64)) (_2!2594 V!10343)) )
))
(declare-datatypes ((List!4782 0))(
  ( (Nil!4779) (Cons!4778 (h!5634 tuple2!5166) (t!9876 List!4782)) )
))
(declare-datatypes ((ListLongMap!4079 0))(
  ( (ListLongMap!4080 (toList!2055 List!4782)) )
))
(declare-fun contains!2102 (ListLongMap!4079 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1576 (array!17647 array!17645 (_ BitVec 32) (_ BitVec 32) V!10343 V!10343 (_ BitVec 32) Int) ListLongMap!4079)

(assert (=> b!337531 (= res!186459 (not (contains!2102 (getCurrentListMap!1576 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapNonEmpty!11943 () Bool)

(declare-fun tp!24731 () Bool)

(assert (=> mapNonEmpty!11943 (= mapRes!11943 (and tp!24731 e!207110))))

(declare-fun mapValue!11943 () ValueCell!3169)

(declare-fun mapKey!11943 () (_ BitVec 32))

(declare-fun mapRest!11943 () (Array (_ BitVec 32) ValueCell!3169))

(assert (=> mapNonEmpty!11943 (= (arr!8350 _values!1525) (store mapRest!11943 mapKey!11943 mapValue!11943))))

(declare-fun b!337532 () Bool)

(declare-fun res!186460 () Bool)

(assert (=> b!337532 (=> (not res!186460) (not e!207109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17647 (_ BitVec 32)) Bool)

(assert (=> b!337532 (= res!186460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337533 () Bool)

(assert (=> b!337533 (= e!207113 (and e!207114 mapRes!11943))))

(declare-fun condMapEmpty!11943 () Bool)

(declare-fun mapDefault!11943 () ValueCell!3169)

