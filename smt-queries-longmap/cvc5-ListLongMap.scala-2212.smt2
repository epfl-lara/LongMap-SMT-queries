; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36686 () Bool)

(assert start!36686)

(declare-fun res!204837 () Bool)

(declare-fun e!224250 () Bool)

(assert (=> start!36686 (=> (not res!204837) (not e!224250))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36686 (= res!204837 (validMask!0 mask!970))))

(assert (=> start!36686 e!224250))

(assert (=> start!36686 true))

(declare-datatypes ((V!12451 0))(
  ( (V!12452 (val!4299 Int)) )
))
(declare-datatypes ((ValueCell!3911 0))(
  ( (ValueCellFull!3911 (v!6495 V!12451)) (EmptyCell!3911) )
))
(declare-datatypes ((array!20971 0))(
  ( (array!20972 (arr!9957 (Array (_ BitVec 32) ValueCell!3911)) (size!10309 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20971)

(declare-fun e!224248 () Bool)

(declare-fun array_inv!7364 (array!20971) Bool)

(assert (=> start!36686 (and (array_inv!7364 _values!506) e!224248)))

(declare-datatypes ((array!20973 0))(
  ( (array!20974 (arr!9958 (Array (_ BitVec 32) (_ BitVec 64))) (size!10310 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20973)

(declare-fun array_inv!7365 (array!20973) Bool)

(assert (=> start!36686 (array_inv!7365 _keys!658)))

(declare-fun b!366235 () Bool)

(declare-fun res!204832 () Bool)

(assert (=> b!366235 (=> (not res!204832) (not e!224250))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366235 (= res!204832 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!366236 () Bool)

(declare-fun e!224246 () Bool)

(declare-fun mapRes!14319 () Bool)

(assert (=> b!366236 (= e!224248 (and e!224246 mapRes!14319))))

(declare-fun condMapEmpty!14319 () Bool)

(declare-fun mapDefault!14319 () ValueCell!3911)

