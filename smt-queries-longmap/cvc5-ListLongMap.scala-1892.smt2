; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33842 () Bool)

(assert start!33842)

(declare-fun b_free!7021 () Bool)

(declare-fun b_next!7021 () Bool)

(assert (=> start!33842 (= b_free!7021 (not b_next!7021))))

(declare-fun tp!24576 () Bool)

(declare-fun b_and!14207 () Bool)

(assert (=> start!33842 (= tp!24576 b_and!14207)))

(declare-fun b!336666 () Bool)

(declare-fun res!185836 () Bool)

(declare-fun e!206645 () Bool)

(assert (=> b!336666 (=> (not res!185836) (not e!206645))))

(declare-datatypes ((array!17543 0))(
  ( (array!17544 (arr!8299 (Array (_ BitVec 32) (_ BitVec 64))) (size!8651 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17543)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336666 (= res!185836 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!336667 () Bool)

(assert (=> b!336667 (= e!206645 false)))

(declare-fun lt!160294 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17543 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336667 (= lt!160294 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!336668 () Bool)

(declare-fun e!206646 () Bool)

(declare-fun tp_is_empty!6973 () Bool)

(assert (=> b!336668 (= e!206646 tp_is_empty!6973)))

(declare-fun mapIsEmpty!11865 () Bool)

(declare-fun mapRes!11865 () Bool)

(assert (=> mapIsEmpty!11865 mapRes!11865))

(declare-fun b!336669 () Bool)

(declare-fun res!185838 () Bool)

(declare-fun e!206641 () Bool)

(assert (=> b!336669 (=> (not res!185838) (not e!206641))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10275 0))(
  ( (V!10276 (val!3531 Int)) )
))
(declare-datatypes ((ValueCell!3143 0))(
  ( (ValueCellFull!3143 (v!5696 V!10275)) (EmptyCell!3143) )
))
(declare-datatypes ((array!17545 0))(
  ( (array!17546 (arr!8300 (Array (_ BitVec 32) ValueCell!3143)) (size!8652 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17545)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!336669 (= res!185838 (and (= (size!8652 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8651 _keys!1895) (size!8652 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336670 () Bool)

(assert (=> b!336670 (= e!206641 e!206645)))

(declare-fun res!185833 () Bool)

(assert (=> b!336670 (=> (not res!185833) (not e!206645))))

(declare-datatypes ((SeekEntryResult!3207 0))(
  ( (MissingZero!3207 (index!15007 (_ BitVec 32))) (Found!3207 (index!15008 (_ BitVec 32))) (Intermediate!3207 (undefined!4019 Bool) (index!15009 (_ BitVec 32)) (x!33555 (_ BitVec 32))) (Undefined!3207) (MissingVacant!3207 (index!15010 (_ BitVec 32))) )
))
(declare-fun lt!160293 () SeekEntryResult!3207)

(assert (=> b!336670 (= res!185833 (and (not (is-Found!3207 lt!160293)) (is-MissingZero!3207 lt!160293)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17543 (_ BitVec 32)) SeekEntryResult!3207)

(assert (=> b!336670 (= lt!160293 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!336671 () Bool)

(declare-fun res!185837 () Bool)

(assert (=> b!336671 (=> (not res!185837) (not e!206641))))

(declare-datatypes ((List!4743 0))(
  ( (Nil!4740) (Cons!4739 (h!5595 (_ BitVec 64)) (t!9837 List!4743)) )
))
(declare-fun arrayNoDuplicates!0 (array!17543 (_ BitVec 32) List!4743) Bool)

(assert (=> b!336671 (= res!185837 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4740))))

(declare-fun b!336672 () Bool)

(declare-fun e!206644 () Bool)

(assert (=> b!336672 (= e!206644 tp_is_empty!6973)))

(declare-fun res!185839 () Bool)

(assert (=> start!33842 (=> (not res!185839) (not e!206641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33842 (= res!185839 (validMask!0 mask!2385))))

(assert (=> start!33842 e!206641))

(assert (=> start!33842 true))

(assert (=> start!33842 tp_is_empty!6973))

(assert (=> start!33842 tp!24576))

(declare-fun e!206643 () Bool)

(declare-fun array_inv!6160 (array!17545) Bool)

(assert (=> start!33842 (and (array_inv!6160 _values!1525) e!206643)))

(declare-fun array_inv!6161 (array!17543) Bool)

(assert (=> start!33842 (array_inv!6161 _keys!1895)))

(declare-fun b!336673 () Bool)

(declare-fun res!185840 () Bool)

(assert (=> b!336673 (=> (not res!185840) (not e!206641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336673 (= res!185840 (validKeyInArray!0 k!1348))))

(declare-fun mapNonEmpty!11865 () Bool)

(declare-fun tp!24575 () Bool)

(assert (=> mapNonEmpty!11865 (= mapRes!11865 (and tp!24575 e!206646))))

(declare-fun mapRest!11865 () (Array (_ BitVec 32) ValueCell!3143))

(declare-fun mapValue!11865 () ValueCell!3143)

(declare-fun mapKey!11865 () (_ BitVec 32))

(assert (=> mapNonEmpty!11865 (= (arr!8300 _values!1525) (store mapRest!11865 mapKey!11865 mapValue!11865))))

(declare-fun b!336674 () Bool)

(declare-fun res!185835 () Bool)

(assert (=> b!336674 (=> (not res!185835) (not e!206641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17543 (_ BitVec 32)) Bool)

(assert (=> b!336674 (= res!185835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336675 () Bool)

(declare-fun res!185834 () Bool)

(assert (=> b!336675 (=> (not res!185834) (not e!206641))))

(declare-fun zeroValue!1467 () V!10275)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10275)

(declare-datatypes ((tuple2!5128 0))(
  ( (tuple2!5129 (_1!2575 (_ BitVec 64)) (_2!2575 V!10275)) )
))
(declare-datatypes ((List!4744 0))(
  ( (Nil!4741) (Cons!4740 (h!5596 tuple2!5128) (t!9838 List!4744)) )
))
(declare-datatypes ((ListLongMap!4041 0))(
  ( (ListLongMap!4042 (toList!2036 List!4744)) )
))
(declare-fun contains!2083 (ListLongMap!4041 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1557 (array!17543 array!17545 (_ BitVec 32) (_ BitVec 32) V!10275 V!10275 (_ BitVec 32) Int) ListLongMap!4041)

(assert (=> b!336675 (= res!185834 (not (contains!2083 (getCurrentListMap!1557 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!336676 () Bool)

(assert (=> b!336676 (= e!206643 (and e!206644 mapRes!11865))))

(declare-fun condMapEmpty!11865 () Bool)

(declare-fun mapDefault!11865 () ValueCell!3143)

