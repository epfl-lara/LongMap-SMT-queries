; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33840 () Bool)

(assert start!33840)

(declare-fun b_free!7019 () Bool)

(declare-fun b_next!7019 () Bool)

(assert (=> start!33840 (= b_free!7019 (not b_next!7019))))

(declare-fun tp!24569 () Bool)

(declare-fun b_and!14205 () Bool)

(assert (=> start!33840 (= tp!24569 b_and!14205)))

(declare-fun b!336633 () Bool)

(declare-fun e!206624 () Bool)

(declare-fun tp_is_empty!6971 () Bool)

(assert (=> b!336633 (= e!206624 tp_is_empty!6971)))

(declare-fun b!336634 () Bool)

(declare-fun res!185811 () Bool)

(declare-fun e!206625 () Bool)

(assert (=> b!336634 (=> (not res!185811) (not e!206625))))

(declare-datatypes ((array!17539 0))(
  ( (array!17540 (arr!8297 (Array (_ BitVec 32) (_ BitVec 64))) (size!8649 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17539)

(declare-datatypes ((List!4742 0))(
  ( (Nil!4739) (Cons!4738 (h!5594 (_ BitVec 64)) (t!9836 List!4742)) )
))
(declare-fun arrayNoDuplicates!0 (array!17539 (_ BitVec 32) List!4742) Bool)

(assert (=> b!336634 (= res!185811 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4739))))

(declare-fun res!185814 () Bool)

(assert (=> start!33840 (=> (not res!185814) (not e!206625))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33840 (= res!185814 (validMask!0 mask!2385))))

(assert (=> start!33840 e!206625))

(assert (=> start!33840 true))

(assert (=> start!33840 tp_is_empty!6971))

(assert (=> start!33840 tp!24569))

(declare-datatypes ((V!10271 0))(
  ( (V!10272 (val!3530 Int)) )
))
(declare-datatypes ((ValueCell!3142 0))(
  ( (ValueCellFull!3142 (v!5695 V!10271)) (EmptyCell!3142) )
))
(declare-datatypes ((array!17541 0))(
  ( (array!17542 (arr!8298 (Array (_ BitVec 32) ValueCell!3142)) (size!8650 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17541)

(declare-fun e!206628 () Bool)

(declare-fun array_inv!6158 (array!17541) Bool)

(assert (=> start!33840 (and (array_inv!6158 _values!1525) e!206628)))

(declare-fun array_inv!6159 (array!17539) Bool)

(assert (=> start!33840 (array_inv!6159 _keys!1895)))

(declare-fun b!336635 () Bool)

(declare-fun res!185816 () Bool)

(assert (=> b!336635 (=> (not res!185816) (not e!206625))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336635 (= res!185816 (validKeyInArray!0 k!1348))))

(declare-fun b!336636 () Bool)

(declare-fun e!206626 () Bool)

(assert (=> b!336636 (= e!206625 e!206626)))

(declare-fun res!185815 () Bool)

(assert (=> b!336636 (=> (not res!185815) (not e!206626))))

(declare-datatypes ((SeekEntryResult!3206 0))(
  ( (MissingZero!3206 (index!15003 (_ BitVec 32))) (Found!3206 (index!15004 (_ BitVec 32))) (Intermediate!3206 (undefined!4018 Bool) (index!15005 (_ BitVec 32)) (x!33546 (_ BitVec 32))) (Undefined!3206) (MissingVacant!3206 (index!15006 (_ BitVec 32))) )
))
(declare-fun lt!160287 () SeekEntryResult!3206)

(assert (=> b!336636 (= res!185815 (and (not (is-Found!3206 lt!160287)) (is-MissingZero!3206 lt!160287)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17539 (_ BitVec 32)) SeekEntryResult!3206)

(assert (=> b!336636 (= lt!160287 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!336637 () Bool)

(declare-fun e!206627 () Bool)

(declare-fun mapRes!11862 () Bool)

(assert (=> b!336637 (= e!206628 (and e!206627 mapRes!11862))))

(declare-fun condMapEmpty!11862 () Bool)

(declare-fun mapDefault!11862 () ValueCell!3142)

