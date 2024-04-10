; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33852 () Bool)

(assert start!33852)

(declare-fun b_free!7031 () Bool)

(declare-fun b_next!7031 () Bool)

(assert (=> start!33852 (= b_free!7031 (not b_next!7031))))

(declare-fun tp!24605 () Bool)

(declare-fun b_and!14217 () Bool)

(assert (=> start!33852 (= tp!24605 b_and!14217)))

(declare-fun b!336831 () Bool)

(declare-fun e!206736 () Bool)

(declare-fun tp_is_empty!6983 () Bool)

(assert (=> b!336831 (= e!206736 tp_is_empty!6983)))

(declare-fun mapIsEmpty!11880 () Bool)

(declare-fun mapRes!11880 () Bool)

(assert (=> mapIsEmpty!11880 mapRes!11880))

(declare-fun b!336832 () Bool)

(declare-fun res!185953 () Bool)

(declare-fun e!206734 () Bool)

(assert (=> b!336832 (=> (not res!185953) (not e!206734))))

(declare-datatypes ((array!17563 0))(
  ( (array!17564 (arr!8309 (Array (_ BitVec 32) (_ BitVec 64))) (size!8661 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17563)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17563 (_ BitVec 32)) Bool)

(assert (=> b!336832 (= res!185953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336833 () Bool)

(declare-fun res!185957 () Bool)

(assert (=> b!336833 (=> (not res!185957) (not e!206734))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10287 0))(
  ( (V!10288 (val!3536 Int)) )
))
(declare-fun zeroValue!1467 () V!10287)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3148 0))(
  ( (ValueCellFull!3148 (v!5701 V!10287)) (EmptyCell!3148) )
))
(declare-datatypes ((array!17565 0))(
  ( (array!17566 (arr!8310 (Array (_ BitVec 32) ValueCell!3148)) (size!8662 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17565)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10287)

(declare-datatypes ((tuple2!5136 0))(
  ( (tuple2!5137 (_1!2579 (_ BitVec 64)) (_2!2579 V!10287)) )
))
(declare-datatypes ((List!4752 0))(
  ( (Nil!4749) (Cons!4748 (h!5604 tuple2!5136) (t!9846 List!4752)) )
))
(declare-datatypes ((ListLongMap!4049 0))(
  ( (ListLongMap!4050 (toList!2040 List!4752)) )
))
(declare-fun contains!2087 (ListLongMap!4049 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1561 (array!17563 array!17565 (_ BitVec 32) (_ BitVec 32) V!10287 V!10287 (_ BitVec 32) Int) ListLongMap!4049)

(assert (=> b!336833 (= res!185957 (not (contains!2087 (getCurrentListMap!1561 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!336834 () Bool)

(declare-fun res!185956 () Bool)

(assert (=> b!336834 (=> (not res!185956) (not e!206734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336834 (= res!185956 (validKeyInArray!0 k!1348))))

(declare-fun b!336835 () Bool)

(declare-fun res!185959 () Bool)

(assert (=> b!336835 (=> (not res!185959) (not e!206734))))

(assert (=> b!336835 (= res!185959 (and (= (size!8662 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8661 _keys!1895) (size!8662 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336836 () Bool)

(declare-fun e!206735 () Bool)

(assert (=> b!336836 (= e!206734 e!206735)))

(declare-fun res!185958 () Bool)

(assert (=> b!336836 (=> (not res!185958) (not e!206735))))

(declare-datatypes ((SeekEntryResult!3211 0))(
  ( (MissingZero!3211 (index!15023 (_ BitVec 32))) (Found!3211 (index!15024 (_ BitVec 32))) (Intermediate!3211 (undefined!4023 Bool) (index!15025 (_ BitVec 32)) (x!33567 (_ BitVec 32))) (Undefined!3211) (MissingVacant!3211 (index!15026 (_ BitVec 32))) )
))
(declare-fun lt!160324 () SeekEntryResult!3211)

(assert (=> b!336836 (= res!185958 (and (not (is-Found!3211 lt!160324)) (is-MissingZero!3211 lt!160324)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17563 (_ BitVec 32)) SeekEntryResult!3211)

(assert (=> b!336836 (= lt!160324 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun res!185955 () Bool)

(assert (=> start!33852 (=> (not res!185955) (not e!206734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33852 (= res!185955 (validMask!0 mask!2385))))

(assert (=> start!33852 e!206734))

(assert (=> start!33852 true))

(assert (=> start!33852 tp_is_empty!6983))

(assert (=> start!33852 tp!24605))

(declare-fun e!206731 () Bool)

(declare-fun array_inv!6168 (array!17565) Bool)

(assert (=> start!33852 (and (array_inv!6168 _values!1525) e!206731)))

(declare-fun array_inv!6169 (array!17563) Bool)

(assert (=> start!33852 (array_inv!6169 _keys!1895)))

(declare-fun b!336837 () Bool)

(assert (=> b!336837 (= e!206735 false)))

(declare-fun lt!160323 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17563 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336837 (= lt!160323 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!336838 () Bool)

(declare-fun e!206732 () Bool)

(assert (=> b!336838 (= e!206731 (and e!206732 mapRes!11880))))

(declare-fun condMapEmpty!11880 () Bool)

(declare-fun mapDefault!11880 () ValueCell!3148)

