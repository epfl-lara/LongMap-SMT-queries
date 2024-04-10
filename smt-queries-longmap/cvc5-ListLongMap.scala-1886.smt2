; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33750 () Bool)

(assert start!33750)

(declare-fun b_free!6985 () Bool)

(declare-fun b_next!6985 () Bool)

(assert (=> start!33750 (= b_free!6985 (not b_next!6985))))

(declare-fun tp!24459 () Bool)

(declare-fun b_and!14165 () Bool)

(assert (=> start!33750 (= tp!24459 b_and!14165)))

(declare-fun b!335753 () Bool)

(declare-fun e!206106 () Bool)

(declare-fun tp_is_empty!6937 () Bool)

(assert (=> b!335753 (= e!206106 tp_is_empty!6937)))

(declare-fun b!335754 () Bool)

(declare-fun res!185332 () Bool)

(declare-fun e!206104 () Bool)

(assert (=> b!335754 (=> (not res!185332) (not e!206104))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335754 (= res!185332 (validKeyInArray!0 k!1348))))

(declare-fun b!335755 () Bool)

(assert (=> b!335755 (= e!206104 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!17467 0))(
  ( (array!17468 (arr!8264 (Array (_ BitVec 32) (_ BitVec 64))) (size!8616 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17467)

(declare-datatypes ((SeekEntryResult!3196 0))(
  ( (MissingZero!3196 (index!14963 (_ BitVec 32))) (Found!3196 (index!14964 (_ BitVec 32))) (Intermediate!3196 (undefined!4008 Bool) (index!14965 (_ BitVec 32)) (x!33466 (_ BitVec 32))) (Undefined!3196) (MissingVacant!3196 (index!14966 (_ BitVec 32))) )
))
(declare-fun lt!159940 () SeekEntryResult!3196)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17467 (_ BitVec 32)) SeekEntryResult!3196)

(assert (=> b!335755 (= lt!159940 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11802 () Bool)

(declare-fun mapRes!11802 () Bool)

(assert (=> mapIsEmpty!11802 mapRes!11802))

(declare-fun res!185329 () Bool)

(assert (=> start!33750 (=> (not res!185329) (not e!206104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33750 (= res!185329 (validMask!0 mask!2385))))

(assert (=> start!33750 e!206104))

(assert (=> start!33750 true))

(assert (=> start!33750 tp_is_empty!6937))

(assert (=> start!33750 tp!24459))

(declare-datatypes ((V!10227 0))(
  ( (V!10228 (val!3513 Int)) )
))
(declare-datatypes ((ValueCell!3125 0))(
  ( (ValueCellFull!3125 (v!5675 V!10227)) (EmptyCell!3125) )
))
(declare-datatypes ((array!17469 0))(
  ( (array!17470 (arr!8265 (Array (_ BitVec 32) ValueCell!3125)) (size!8617 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17469)

(declare-fun e!206105 () Bool)

(declare-fun array_inv!6138 (array!17469) Bool)

(assert (=> start!33750 (and (array_inv!6138 _values!1525) e!206105)))

(declare-fun array_inv!6139 (array!17467) Bool)

(assert (=> start!33750 (array_inv!6139 _keys!1895)))

(declare-fun b!335756 () Bool)

(declare-fun res!185328 () Bool)

(assert (=> b!335756 (=> (not res!185328) (not e!206104))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335756 (= res!185328 (and (= (size!8617 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8616 _keys!1895) (size!8617 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335757 () Bool)

(declare-fun res!185330 () Bool)

(assert (=> b!335757 (=> (not res!185330) (not e!206104))))

(declare-fun zeroValue!1467 () V!10227)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10227)

(declare-datatypes ((tuple2!5106 0))(
  ( (tuple2!5107 (_1!2564 (_ BitVec 64)) (_2!2564 V!10227)) )
))
(declare-datatypes ((List!4722 0))(
  ( (Nil!4719) (Cons!4718 (h!5574 tuple2!5106) (t!9810 List!4722)) )
))
(declare-datatypes ((ListLongMap!4019 0))(
  ( (ListLongMap!4020 (toList!2025 List!4722)) )
))
(declare-fun contains!2069 (ListLongMap!4019 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1546 (array!17467 array!17469 (_ BitVec 32) (_ BitVec 32) V!10227 V!10227 (_ BitVec 32) Int) ListLongMap!4019)

(assert (=> b!335757 (= res!185330 (not (contains!2069 (getCurrentListMap!1546 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapNonEmpty!11802 () Bool)

(declare-fun tp!24458 () Bool)

(assert (=> mapNonEmpty!11802 (= mapRes!11802 (and tp!24458 e!206106))))

(declare-fun mapValue!11802 () ValueCell!3125)

(declare-fun mapRest!11802 () (Array (_ BitVec 32) ValueCell!3125))

(declare-fun mapKey!11802 () (_ BitVec 32))

(assert (=> mapNonEmpty!11802 (= (arr!8265 _values!1525) (store mapRest!11802 mapKey!11802 mapValue!11802))))

(declare-fun b!335758 () Bool)

(declare-fun res!185333 () Bool)

(assert (=> b!335758 (=> (not res!185333) (not e!206104))))

(declare-datatypes ((List!4723 0))(
  ( (Nil!4720) (Cons!4719 (h!5575 (_ BitVec 64)) (t!9811 List!4723)) )
))
(declare-fun arrayNoDuplicates!0 (array!17467 (_ BitVec 32) List!4723) Bool)

(assert (=> b!335758 (= res!185333 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4720))))

(declare-fun b!335759 () Bool)

(declare-fun e!206102 () Bool)

(assert (=> b!335759 (= e!206102 tp_is_empty!6937)))

(declare-fun b!335760 () Bool)

(assert (=> b!335760 (= e!206105 (and e!206102 mapRes!11802))))

(declare-fun condMapEmpty!11802 () Bool)

(declare-fun mapDefault!11802 () ValueCell!3125)

