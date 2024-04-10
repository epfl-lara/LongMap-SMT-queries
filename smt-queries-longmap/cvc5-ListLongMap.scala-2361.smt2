; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37628 () Bool)

(assert start!37628)

(declare-fun b_free!8755 () Bool)

(declare-fun b_next!8755 () Bool)

(assert (=> start!37628 (= b_free!8755 (not b_next!8755))))

(declare-fun tp!30980 () Bool)

(declare-fun b_and!15997 () Bool)

(assert (=> start!37628 (= tp!30980 b_and!15997)))

(declare-fun b!385141 () Bool)

(declare-fun res!219653 () Bool)

(declare-fun e!233757 () Bool)

(assert (=> b!385141 (=> (not res!219653) (not e!233757))))

(declare-datatypes ((array!22707 0))(
  ( (array!22708 (arr!10822 (Array (_ BitVec 32) (_ BitVec 64))) (size!11174 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22707)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22707 (_ BitVec 32)) Bool)

(assert (=> b!385141 (= res!219653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385142 () Bool)

(declare-fun res!219652 () Bool)

(declare-fun e!233762 () Bool)

(assert (=> b!385142 (=> (not res!219652) (not e!233762))))

(declare-fun lt!181442 () array!22707)

(declare-datatypes ((List!6228 0))(
  ( (Nil!6225) (Cons!6224 (h!7080 (_ BitVec 64)) (t!11378 List!6228)) )
))
(declare-fun arrayNoDuplicates!0 (array!22707 (_ BitVec 32) List!6228) Bool)

(assert (=> b!385142 (= res!219652 (arrayNoDuplicates!0 lt!181442 #b00000000000000000000000000000000 Nil!6225))))

(declare-fun b!385143 () Bool)

(assert (=> b!385143 (= e!233757 e!233762)))

(declare-fun res!219657 () Bool)

(assert (=> b!385143 (=> (not res!219657) (not e!233762))))

(assert (=> b!385143 (= res!219657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181442 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385143 (= lt!181442 (array!22708 (store (arr!10822 _keys!658) i!548 k!778) (size!11174 _keys!658)))))

(declare-fun b!385144 () Bool)

(declare-fun e!233756 () Bool)

(declare-fun e!233761 () Bool)

(declare-fun mapRes!15669 () Bool)

(assert (=> b!385144 (= e!233756 (and e!233761 mapRes!15669))))

(declare-fun condMapEmpty!15669 () Bool)

(declare-datatypes ((V!13643 0))(
  ( (V!13644 (val!4746 Int)) )
))
(declare-datatypes ((ValueCell!4358 0))(
  ( (ValueCellFull!4358 (v!6943 V!13643)) (EmptyCell!4358) )
))
(declare-datatypes ((array!22709 0))(
  ( (array!22710 (arr!10823 (Array (_ BitVec 32) ValueCell!4358)) (size!11175 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22709)

(declare-fun mapDefault!15669 () ValueCell!4358)

