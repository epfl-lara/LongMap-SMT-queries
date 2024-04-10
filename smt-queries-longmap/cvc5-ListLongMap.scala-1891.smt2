; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33836 () Bool)

(assert start!33836)

(declare-fun b_free!7015 () Bool)

(declare-fun b_next!7015 () Bool)

(assert (=> start!33836 (= b_free!7015 (not b_next!7015))))

(declare-fun tp!24557 () Bool)

(declare-fun b_and!14201 () Bool)

(assert (=> start!33836 (= tp!24557 b_and!14201)))

(declare-fun b!336567 () Bool)

(declare-fun e!206590 () Bool)

(declare-fun e!206591 () Bool)

(assert (=> b!336567 (= e!206590 e!206591)))

(declare-fun res!185768 () Bool)

(assert (=> b!336567 (=> (not res!185768) (not e!206591))))

(declare-datatypes ((SeekEntryResult!3204 0))(
  ( (MissingZero!3204 (index!14995 (_ BitVec 32))) (Found!3204 (index!14996 (_ BitVec 32))) (Intermediate!3204 (undefined!4016 Bool) (index!14997 (_ BitVec 32)) (x!33544 (_ BitVec 32))) (Undefined!3204) (MissingVacant!3204 (index!14998 (_ BitVec 32))) )
))
(declare-fun lt!160276 () SeekEntryResult!3204)

(assert (=> b!336567 (= res!185768 (and (not (is-Found!3204 lt!160276)) (is-MissingZero!3204 lt!160276)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!17531 0))(
  ( (array!17532 (arr!8293 (Array (_ BitVec 32) (_ BitVec 64))) (size!8645 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17531)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17531 (_ BitVec 32)) SeekEntryResult!3204)

(assert (=> b!336567 (= lt!160276 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!336568 () Bool)

(declare-fun res!185764 () Bool)

(assert (=> b!336568 (=> (not res!185764) (not e!206590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17531 (_ BitVec 32)) Bool)

(assert (=> b!336568 (= res!185764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11856 () Bool)

(declare-fun mapRes!11856 () Bool)

(assert (=> mapIsEmpty!11856 mapRes!11856))

(declare-fun b!336569 () Bool)

(declare-fun res!185761 () Bool)

(assert (=> b!336569 (=> (not res!185761) (not e!206590))))

(declare-datatypes ((V!10267 0))(
  ( (V!10268 (val!3528 Int)) )
))
(declare-fun zeroValue!1467 () V!10267)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3140 0))(
  ( (ValueCellFull!3140 (v!5693 V!10267)) (EmptyCell!3140) )
))
(declare-datatypes ((array!17533 0))(
  ( (array!17534 (arr!8294 (Array (_ BitVec 32) ValueCell!3140)) (size!8646 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17533)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10267)

(declare-datatypes ((tuple2!5124 0))(
  ( (tuple2!5125 (_1!2573 (_ BitVec 64)) (_2!2573 V!10267)) )
))
(declare-datatypes ((List!4739 0))(
  ( (Nil!4736) (Cons!4735 (h!5591 tuple2!5124) (t!9833 List!4739)) )
))
(declare-datatypes ((ListLongMap!4037 0))(
  ( (ListLongMap!4038 (toList!2034 List!4739)) )
))
(declare-fun contains!2081 (ListLongMap!4037 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1555 (array!17531 array!17533 (_ BitVec 32) (_ BitVec 32) V!10267 V!10267 (_ BitVec 32) Int) ListLongMap!4037)

(assert (=> b!336569 (= res!185761 (not (contains!2081 (getCurrentListMap!1555 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!336570 () Bool)

(declare-fun res!185767 () Bool)

(assert (=> b!336570 (=> (not res!185767) (not e!206590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336570 (= res!185767 (validKeyInArray!0 k!1348))))

(declare-fun res!185762 () Bool)

(assert (=> start!33836 (=> (not res!185762) (not e!206590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33836 (= res!185762 (validMask!0 mask!2385))))

(assert (=> start!33836 e!206590))

(assert (=> start!33836 true))

(declare-fun tp_is_empty!6967 () Bool)

(assert (=> start!33836 tp_is_empty!6967))

(assert (=> start!33836 tp!24557))

(declare-fun e!206592 () Bool)

(declare-fun array_inv!6154 (array!17533) Bool)

(assert (=> start!33836 (and (array_inv!6154 _values!1525) e!206592)))

(declare-fun array_inv!6155 (array!17531) Bool)

(assert (=> start!33836 (array_inv!6155 _keys!1895)))

(declare-fun b!336571 () Bool)

(declare-fun e!206587 () Bool)

(assert (=> b!336571 (= e!206587 tp_is_empty!6967)))

(declare-fun b!336572 () Bool)

(declare-fun res!185763 () Bool)

(assert (=> b!336572 (=> (not res!185763) (not e!206590))))

(assert (=> b!336572 (= res!185763 (and (= (size!8646 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8645 _keys!1895) (size!8646 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336573 () Bool)

(assert (=> b!336573 (= e!206592 (and e!206587 mapRes!11856))))

(declare-fun condMapEmpty!11856 () Bool)

(declare-fun mapDefault!11856 () ValueCell!3140)

