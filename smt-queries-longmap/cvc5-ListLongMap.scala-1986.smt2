; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34800 () Bool)

(assert start!34800)

(declare-fun b_free!7585 () Bool)

(declare-fun b_next!7585 () Bool)

(assert (=> start!34800 (= b_free!7585 (not b_next!7585))))

(declare-fun tp!26321 () Bool)

(declare-fun b_and!14807 () Bool)

(assert (=> start!34800 (= tp!26321 b_and!14807)))

(declare-fun b!348212 () Bool)

(declare-fun e!213362 () Bool)

(declare-fun tp_is_empty!7537 () Bool)

(assert (=> b!348212 (= e!213362 tp_is_empty!7537)))

(declare-fun b!348213 () Bool)

(declare-fun e!213358 () Bool)

(assert (=> b!348213 (= e!213358 tp_is_empty!7537)))

(declare-fun b!348214 () Bool)

(declare-fun res!192856 () Bool)

(declare-fun e!213359 () Bool)

(assert (=> b!348214 (=> (not res!192856) (not e!213359))))

(declare-datatypes ((array!18661 0))(
  ( (array!18662 (arr!8840 (Array (_ BitVec 32) (_ BitVec 64))) (size!9192 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18661)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18661 (_ BitVec 32)) Bool)

(assert (=> b!348214 (= res!192856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348215 () Bool)

(declare-fun res!192852 () Bool)

(assert (=> b!348215 (=> (not res!192852) (not e!213359))))

(declare-datatypes ((List!5135 0))(
  ( (Nil!5132) (Cons!5131 (h!5987 (_ BitVec 64)) (t!10265 List!5135)) )
))
(declare-fun arrayNoDuplicates!0 (array!18661 (_ BitVec 32) List!5135) Bool)

(assert (=> b!348215 (= res!192852 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5132))))

(declare-fun b!348216 () Bool)

(declare-fun res!192851 () Bool)

(declare-fun e!213361 () Bool)

(assert (=> b!348216 (=> (not res!192851) (not e!213361))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348216 (= res!192851 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun res!192855 () Bool)

(assert (=> start!34800 (=> (not res!192855) (not e!213359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34800 (= res!192855 (validMask!0 mask!2385))))

(assert (=> start!34800 e!213359))

(assert (=> start!34800 true))

(assert (=> start!34800 tp_is_empty!7537))

(assert (=> start!34800 tp!26321))

(declare-datatypes ((V!11027 0))(
  ( (V!11028 (val!3813 Int)) )
))
(declare-datatypes ((ValueCell!3425 0))(
  ( (ValueCellFull!3425 (v!5996 V!11027)) (EmptyCell!3425) )
))
(declare-datatypes ((array!18663 0))(
  ( (array!18664 (arr!8841 (Array (_ BitVec 32) ValueCell!3425)) (size!9193 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18663)

(declare-fun e!213360 () Bool)

(declare-fun array_inv!6546 (array!18663) Bool)

(assert (=> start!34800 (and (array_inv!6546 _values!1525) e!213360)))

(declare-fun array_inv!6547 (array!18661) Bool)

(assert (=> start!34800 (array_inv!6547 _keys!1895)))

(declare-fun b!348217 () Bool)

(assert (=> b!348217 (= e!213359 e!213361)))

(declare-fun res!192850 () Bool)

(assert (=> b!348217 (=> (not res!192850) (not e!213361))))

(declare-datatypes ((SeekEntryResult!3410 0))(
  ( (MissingZero!3410 (index!15819 (_ BitVec 32))) (Found!3410 (index!15820 (_ BitVec 32))) (Intermediate!3410 (undefined!4222 Bool) (index!15821 (_ BitVec 32)) (x!34690 (_ BitVec 32))) (Undefined!3410) (MissingVacant!3410 (index!15822 (_ BitVec 32))) )
))
(declare-fun lt!163837 () SeekEntryResult!3410)

(assert (=> b!348217 (= res!192850 (and (not (is-Found!3410 lt!163837)) (is-MissingZero!3410 lt!163837)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18661 (_ BitVec 32)) SeekEntryResult!3410)

(assert (=> b!348217 (= lt!163837 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!348218 () Bool)

(declare-fun mapRes!12765 () Bool)

(assert (=> b!348218 (= e!213360 (and e!213362 mapRes!12765))))

(declare-fun condMapEmpty!12765 () Bool)

(declare-fun mapDefault!12765 () ValueCell!3425)

