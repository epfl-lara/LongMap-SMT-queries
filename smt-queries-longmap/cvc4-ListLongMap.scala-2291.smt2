; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37212 () Bool)

(assert start!37212)

(declare-fun b_free!8339 () Bool)

(declare-fun b_next!8339 () Bool)

(assert (=> start!37212 (= b_free!8339 (not b_next!8339))))

(declare-fun tp!29733 () Bool)

(declare-fun b_and!15581 () Bool)

(assert (=> start!37212 (= tp!29733 b_and!15581)))

(declare-fun b!376071 () Bool)

(declare-fun res!212454 () Bool)

(declare-fun e!229064 () Bool)

(assert (=> b!376071 (=> (not res!212454) (not e!229064))))

(declare-datatypes ((array!21907 0))(
  ( (array!21908 (arr!10422 (Array (_ BitVec 32) (_ BitVec 64))) (size!10774 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21907)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21907 (_ BitVec 32)) Bool)

(assert (=> b!376071 (= res!212454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376072 () Bool)

(declare-fun res!212451 () Bool)

(assert (=> b!376072 (=> (not res!212451) (not e!229064))))

(declare-datatypes ((List!5884 0))(
  ( (Nil!5881) (Cons!5880 (h!6736 (_ BitVec 64)) (t!11034 List!5884)) )
))
(declare-fun arrayNoDuplicates!0 (array!21907 (_ BitVec 32) List!5884) Bool)

(assert (=> b!376072 (= res!212451 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5881))))

(declare-fun b!376073 () Bool)

(declare-fun res!212455 () Bool)

(declare-fun e!229063 () Bool)

(assert (=> b!376073 (=> (not res!212455) (not e!229063))))

(declare-fun lt!174312 () array!21907)

(assert (=> b!376073 (= res!212455 (arrayNoDuplicates!0 lt!174312 #b00000000000000000000000000000000 Nil!5881))))

(declare-fun b!376074 () Bool)

(declare-fun e!229070 () Bool)

(declare-fun e!229065 () Bool)

(declare-fun mapRes!15045 () Bool)

(assert (=> b!376074 (= e!229070 (and e!229065 mapRes!15045))))

(declare-fun condMapEmpty!15045 () Bool)

(declare-datatypes ((V!13087 0))(
  ( (V!13088 (val!4538 Int)) )
))
(declare-datatypes ((ValueCell!4150 0))(
  ( (ValueCellFull!4150 (v!6735 V!13087)) (EmptyCell!4150) )
))
(declare-datatypes ((array!21909 0))(
  ( (array!21910 (arr!10423 (Array (_ BitVec 32) ValueCell!4150)) (size!10775 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21909)

(declare-fun mapDefault!15045 () ValueCell!4150)

