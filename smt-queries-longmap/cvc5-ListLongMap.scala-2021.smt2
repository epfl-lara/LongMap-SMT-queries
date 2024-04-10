; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35220 () Bool)

(assert start!35220)

(declare-fun b_free!7795 () Bool)

(declare-fun b_next!7795 () Bool)

(assert (=> start!35220 (= b_free!7795 (not b_next!7795))))

(declare-fun tp!26979 () Bool)

(declare-fun b_and!15035 () Bool)

(assert (=> start!35220 (= tp!26979 b_and!15035)))

(declare-fun b!353069 () Bool)

(declare-fun res!195778 () Bool)

(declare-fun e!216198 () Bool)

(assert (=> b!353069 (=> (not res!195778) (not e!216198))))

(declare-datatypes ((array!19085 0))(
  ( (array!19086 (arr!9043 (Array (_ BitVec 32) (_ BitVec 64))) (size!9395 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19085)

(declare-datatypes ((List!5264 0))(
  ( (Nil!5261) (Cons!5260 (h!6116 (_ BitVec 64)) (t!10412 List!5264)) )
))
(declare-fun arrayNoDuplicates!0 (array!19085 (_ BitVec 32) List!5264) Bool)

(assert (=> b!353069 (= res!195778 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5261))))

(declare-fun b!353070 () Bool)

(assert (=> b!353070 (= e!216198 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3478 0))(
  ( (MissingZero!3478 (index!16091 (_ BitVec 32))) (Found!3478 (index!16092 (_ BitVec 32))) (Intermediate!3478 (undefined!4290 Bool) (index!16093 (_ BitVec 32)) (x!35128 (_ BitVec 32))) (Undefined!3478) (MissingVacant!3478 (index!16094 (_ BitVec 32))) )
))
(declare-fun lt!165454 () SeekEntryResult!3478)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19085 (_ BitVec 32)) SeekEntryResult!3478)

(assert (=> b!353070 (= lt!165454 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!353071 () Bool)

(declare-fun e!216197 () Bool)

(declare-fun tp_is_empty!7747 () Bool)

(assert (=> b!353071 (= e!216197 tp_is_empty!7747)))

(declare-fun b!353072 () Bool)

(declare-fun e!216194 () Bool)

(assert (=> b!353072 (= e!216194 tp_is_empty!7747)))

(declare-fun mapIsEmpty!13107 () Bool)

(declare-fun mapRes!13107 () Bool)

(assert (=> mapIsEmpty!13107 mapRes!13107))

(declare-fun b!353074 () Bool)

(declare-fun res!195782 () Bool)

(assert (=> b!353074 (=> (not res!195782) (not e!216198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19085 (_ BitVec 32)) Bool)

(assert (=> b!353074 (= res!195782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!353075 () Bool)

(declare-fun e!216196 () Bool)

(assert (=> b!353075 (= e!216196 (and e!216197 mapRes!13107))))

(declare-fun condMapEmpty!13107 () Bool)

(declare-datatypes ((V!11307 0))(
  ( (V!11308 (val!3918 Int)) )
))
(declare-datatypes ((ValueCell!3530 0))(
  ( (ValueCellFull!3530 (v!6110 V!11307)) (EmptyCell!3530) )
))
(declare-datatypes ((array!19087 0))(
  ( (array!19088 (arr!9044 (Array (_ BitVec 32) ValueCell!3530)) (size!9396 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19087)

(declare-fun mapDefault!13107 () ValueCell!3530)

