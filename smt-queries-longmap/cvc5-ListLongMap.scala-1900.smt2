; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33890 () Bool)

(assert start!33890)

(declare-fun b_free!7069 () Bool)

(declare-fun b_next!7069 () Bool)

(assert (=> start!33890 (= b_free!7069 (not b_next!7069))))

(declare-fun tp!24719 () Bool)

(declare-fun b_and!14255 () Bool)

(assert (=> start!33890 (= tp!24719 b_and!14255)))

(declare-fun b!337458 () Bool)

(declare-fun res!186412 () Bool)

(declare-fun e!207077 () Bool)

(assert (=> b!337458 (=> (not res!186412) (not e!207077))))

(declare-datatypes ((array!17637 0))(
  ( (array!17638 (arr!8346 (Array (_ BitVec 32) (_ BitVec 64))) (size!8698 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17637)

(declare-datatypes ((List!4778 0))(
  ( (Nil!4775) (Cons!4774 (h!5630 (_ BitVec 64)) (t!9872 List!4778)) )
))
(declare-fun arrayNoDuplicates!0 (array!17637 (_ BitVec 32) List!4778) Bool)

(assert (=> b!337458 (= res!186412 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4775))))

(declare-fun mapNonEmpty!11937 () Bool)

(declare-fun mapRes!11937 () Bool)

(declare-fun tp!24720 () Bool)

(declare-fun e!207076 () Bool)

(assert (=> mapNonEmpty!11937 (= mapRes!11937 (and tp!24720 e!207076))))

(declare-fun mapKey!11937 () (_ BitVec 32))

(declare-datatypes ((V!10339 0))(
  ( (V!10340 (val!3555 Int)) )
))
(declare-datatypes ((ValueCell!3167 0))(
  ( (ValueCellFull!3167 (v!5720 V!10339)) (EmptyCell!3167) )
))
(declare-datatypes ((array!17639 0))(
  ( (array!17640 (arr!8347 (Array (_ BitVec 32) ValueCell!3167)) (size!8699 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17639)

(declare-fun mapRest!11937 () (Array (_ BitVec 32) ValueCell!3167))

(declare-fun mapValue!11937 () ValueCell!3167)

(assert (=> mapNonEmpty!11937 (= (arr!8347 _values!1525) (store mapRest!11937 mapKey!11937 mapValue!11937))))

(declare-fun b!337459 () Bool)

(declare-fun res!186409 () Bool)

(assert (=> b!337459 (=> (not res!186409) (not e!207077))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337459 (= res!186409 (validKeyInArray!0 k!1348))))

(declare-fun b!337460 () Bool)

(declare-fun res!186410 () Bool)

(assert (=> b!337460 (=> (not res!186410) (not e!207077))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17637 (_ BitVec 32)) Bool)

(assert (=> b!337460 (= res!186410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337461 () Bool)

(declare-fun e!207073 () Bool)

(assert (=> b!337461 (= e!207073 false)))

(declare-fun lt!160438 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17637 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337461 (= lt!160438 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!337462 () Bool)

(declare-fun e!207078 () Bool)

(declare-fun tp_is_empty!7021 () Bool)

(assert (=> b!337462 (= e!207078 tp_is_empty!7021)))

(declare-fun b!337463 () Bool)

(assert (=> b!337463 (= e!207077 e!207073)))

(declare-fun res!186415 () Bool)

(assert (=> b!337463 (=> (not res!186415) (not e!207073))))

(declare-datatypes ((SeekEntryResult!3225 0))(
  ( (MissingZero!3225 (index!15079 (_ BitVec 32))) (Found!3225 (index!15080 (_ BitVec 32))) (Intermediate!3225 (undefined!4037 Bool) (index!15081 (_ BitVec 32)) (x!33637 (_ BitVec 32))) (Undefined!3225) (MissingVacant!3225 (index!15082 (_ BitVec 32))) )
))
(declare-fun lt!160437 () SeekEntryResult!3225)

(assert (=> b!337463 (= res!186415 (and (not (is-Found!3225 lt!160437)) (is-MissingZero!3225 lt!160437)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17637 (_ BitVec 32)) SeekEntryResult!3225)

(assert (=> b!337463 (= lt!160437 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!337464 () Bool)

(declare-fun res!186416 () Bool)

(assert (=> b!337464 (=> (not res!186416) (not e!207073))))

(declare-fun arrayContainsKey!0 (array!17637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337464 (= res!186416 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!11937 () Bool)

(assert (=> mapIsEmpty!11937 mapRes!11937))

(declare-fun res!186414 () Bool)

(assert (=> start!33890 (=> (not res!186414) (not e!207077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33890 (= res!186414 (validMask!0 mask!2385))))

(assert (=> start!33890 e!207077))

(assert (=> start!33890 true))

(assert (=> start!33890 tp_is_empty!7021))

(assert (=> start!33890 tp!24719))

(declare-fun e!207074 () Bool)

(declare-fun array_inv!6194 (array!17639) Bool)

(assert (=> start!33890 (and (array_inv!6194 _values!1525) e!207074)))

(declare-fun array_inv!6195 (array!17637) Bool)

(assert (=> start!33890 (array_inv!6195 _keys!1895)))

(declare-fun b!337465 () Bool)

(declare-fun res!186411 () Bool)

(assert (=> b!337465 (=> (not res!186411) (not e!207077))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337465 (= res!186411 (and (= (size!8699 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8698 _keys!1895) (size!8699 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337466 () Bool)

(declare-fun res!186413 () Bool)

(assert (=> b!337466 (=> (not res!186413) (not e!207077))))

(declare-fun zeroValue!1467 () V!10339)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10339)

(declare-datatypes ((tuple2!5162 0))(
  ( (tuple2!5163 (_1!2592 (_ BitVec 64)) (_2!2592 V!10339)) )
))
(declare-datatypes ((List!4779 0))(
  ( (Nil!4776) (Cons!4775 (h!5631 tuple2!5162) (t!9873 List!4779)) )
))
(declare-datatypes ((ListLongMap!4075 0))(
  ( (ListLongMap!4076 (toList!2053 List!4779)) )
))
(declare-fun contains!2100 (ListLongMap!4075 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1574 (array!17637 array!17639 (_ BitVec 32) (_ BitVec 32) V!10339 V!10339 (_ BitVec 32) Int) ListLongMap!4075)

(assert (=> b!337466 (= res!186413 (not (contains!2100 (getCurrentListMap!1574 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!337467 () Bool)

(assert (=> b!337467 (= e!207076 tp_is_empty!7021)))

(declare-fun b!337468 () Bool)

(assert (=> b!337468 (= e!207074 (and e!207078 mapRes!11937))))

(declare-fun condMapEmpty!11937 () Bool)

(declare-fun mapDefault!11937 () ValueCell!3167)

