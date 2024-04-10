; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34382 () Bool)

(assert start!34382)

(declare-fun b_free!7331 () Bool)

(declare-fun b_next!7331 () Bool)

(assert (=> start!34382 (= b_free!7331 (not b_next!7331))))

(declare-fun tp!25536 () Bool)

(declare-fun b_and!14537 () Bool)

(assert (=> start!34382 (= tp!25536 b_and!14537)))

(declare-fun mapIsEmpty!12360 () Bool)

(declare-fun mapRes!12360 () Bool)

(assert (=> mapIsEmpty!12360 mapRes!12360))

(declare-fun b!343372 () Bool)

(declare-fun res!189824 () Bool)

(declare-fun e!210545 () Bool)

(assert (=> b!343372 (=> (not res!189824) (not e!210545))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343372 (= res!189824 (validKeyInArray!0 k!1348))))

(declare-fun b!343373 () Bool)

(declare-fun e!210547 () Bool)

(assert (=> b!343373 (= e!210545 e!210547)))

(declare-fun res!189816 () Bool)

(assert (=> b!343373 (=> (not res!189816) (not e!210547))))

(declare-datatypes ((SeekEntryResult!3317 0))(
  ( (MissingZero!3317 (index!15447 (_ BitVec 32))) (Found!3317 (index!15448 (_ BitVec 32))) (Intermediate!3317 (undefined!4129 Bool) (index!15449 (_ BitVec 32)) (x!34173 (_ BitVec 32))) (Undefined!3317) (MissingVacant!3317 (index!15450 (_ BitVec 32))) )
))
(declare-fun lt!162468 () SeekEntryResult!3317)

(assert (=> b!343373 (= res!189816 (and (not (is-Found!3317 lt!162468)) (not (is-MissingZero!3317 lt!162468)) (is-MissingVacant!3317 lt!162468)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18157 0))(
  ( (array!18158 (arr!8596 (Array (_ BitVec 32) (_ BitVec 64))) (size!8948 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18157)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18157 (_ BitVec 32)) SeekEntryResult!3317)

(assert (=> b!343373 (= lt!162468 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!343374 () Bool)

(declare-fun res!189818 () Bool)

(assert (=> b!343374 (=> (not res!189818) (not e!210545))))

(declare-datatypes ((V!10687 0))(
  ( (V!10688 (val!3686 Int)) )
))
(declare-fun zeroValue!1467 () V!10687)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3298 0))(
  ( (ValueCellFull!3298 (v!5861 V!10687)) (EmptyCell!3298) )
))
(declare-datatypes ((array!18159 0))(
  ( (array!18160 (arr!8597 (Array (_ BitVec 32) ValueCell!3298)) (size!8949 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18159)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10687)

(declare-datatypes ((tuple2!5340 0))(
  ( (tuple2!5341 (_1!2681 (_ BitVec 64)) (_2!2681 V!10687)) )
))
(declare-datatypes ((List!4960 0))(
  ( (Nil!4957) (Cons!4956 (h!5812 tuple2!5340) (t!10074 List!4960)) )
))
(declare-datatypes ((ListLongMap!4253 0))(
  ( (ListLongMap!4254 (toList!2142 List!4960)) )
))
(declare-fun contains!2199 (ListLongMap!4253 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1663 (array!18157 array!18159 (_ BitVec 32) (_ BitVec 32) V!10687 V!10687 (_ BitVec 32) Int) ListLongMap!4253)

(assert (=> b!343374 (= res!189818 (not (contains!2199 (getCurrentListMap!1663 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!343375 () Bool)

(declare-fun e!210542 () Bool)

(assert (=> b!343375 (= e!210547 e!210542)))

(declare-fun res!189821 () Bool)

(assert (=> b!343375 (=> (not res!189821) (not e!210542))))

(declare-fun lt!162467 () Bool)

(assert (=> b!343375 (= res!189821 (not lt!162467))))

(declare-datatypes ((Unit!10724 0))(
  ( (Unit!10725) )
))
(declare-fun lt!162466 () Unit!10724)

(declare-fun e!210548 () Unit!10724)

(assert (=> b!343375 (= lt!162466 e!210548)))

(declare-fun c!52917 () Bool)

(assert (=> b!343375 (= c!52917 lt!162467)))

(declare-fun arrayContainsKey!0 (array!18157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!343375 (= lt!162467 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!343376 () Bool)

(declare-fun Unit!10726 () Unit!10724)

(assert (=> b!343376 (= e!210548 Unit!10726)))

(declare-fun lt!162469 () Unit!10724)

(declare-fun lemmaArrayContainsKeyThenInListMap!314 (array!18157 array!18159 (_ BitVec 32) (_ BitVec 32) V!10687 V!10687 (_ BitVec 64) (_ BitVec 32) Int) Unit!10724)

(declare-fun arrayScanForKey!0 (array!18157 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!343376 (= lt!162469 (lemmaArrayContainsKeyThenInListMap!314 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!343376 false))

(declare-fun b!343377 () Bool)

(declare-fun e!210543 () Bool)

(declare-fun tp_is_empty!7283 () Bool)

(assert (=> b!343377 (= e!210543 tp_is_empty!7283)))

(declare-fun b!343378 () Bool)

(declare-fun e!210546 () Bool)

(declare-fun e!210544 () Bool)

(assert (=> b!343378 (= e!210546 (and e!210544 mapRes!12360))))

(declare-fun condMapEmpty!12360 () Bool)

(declare-fun mapDefault!12360 () ValueCell!3298)

