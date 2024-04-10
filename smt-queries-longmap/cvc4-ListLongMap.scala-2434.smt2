; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38392 () Bool)

(assert start!38392)

(declare-fun b!396065 () Bool)

(declare-fun res!227162 () Bool)

(declare-fun e!239697 () Bool)

(assert (=> b!396065 (=> (not res!227162) (not e!239697))))

(declare-datatypes ((array!23599 0))(
  ( (array!23600 (arr!11251 (Array (_ BitVec 32) (_ BitVec 64))) (size!11603 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23599)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23599 (_ BitVec 32)) Bool)

(assert (=> b!396065 (= res!227162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23600 (store (arr!11251 _keys!709) i!563 k!794) (size!11603 _keys!709)) mask!1025))))

(declare-fun b!396066 () Bool)

(declare-fun res!227157 () Bool)

(assert (=> b!396066 (=> (not res!227157) (not e!239697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396066 (= res!227157 (validKeyInArray!0 k!794))))

(declare-fun b!396067 () Bool)

(declare-fun res!227165 () Bool)

(assert (=> b!396067 (=> (not res!227165) (not e!239697))))

(assert (=> b!396067 (= res!227165 (and (bvsle #b00000000000000000000000000000000 (size!11603 _keys!709)) (bvslt (size!11603 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!396069 () Bool)

(declare-fun res!227161 () Bool)

(assert (=> b!396069 (=> (not res!227161) (not e!239697))))

(declare-fun arrayContainsKey!0 (array!23599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396069 (= res!227161 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!396070 () Bool)

(declare-fun res!227166 () Bool)

(assert (=> b!396070 (=> (not res!227166) (not e!239697))))

(declare-datatypes ((List!6521 0))(
  ( (Nil!6518) (Cons!6517 (h!7373 (_ BitVec 64)) (t!11695 List!6521)) )
))
(declare-fun arrayNoDuplicates!0 (array!23599 (_ BitVec 32) List!6521) Bool)

(assert (=> b!396070 (= res!227166 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6518))))

(declare-fun mapIsEmpty!16383 () Bool)

(declare-fun mapRes!16383 () Bool)

(assert (=> mapIsEmpty!16383 mapRes!16383))

(declare-fun b!396071 () Bool)

(declare-fun e!239698 () Bool)

(declare-fun e!239695 () Bool)

(assert (=> b!396071 (= e!239698 (and e!239695 mapRes!16383))))

(declare-fun condMapEmpty!16383 () Bool)

(declare-datatypes ((V!14231 0))(
  ( (V!14232 (val!4967 Int)) )
))
(declare-datatypes ((ValueCell!4579 0))(
  ( (ValueCellFull!4579 (v!7213 V!14231)) (EmptyCell!4579) )
))
(declare-datatypes ((array!23601 0))(
  ( (array!23602 (arr!11252 (Array (_ BitVec 32) ValueCell!4579)) (size!11604 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23601)

(declare-fun mapDefault!16383 () ValueCell!4579)

