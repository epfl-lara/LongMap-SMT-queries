; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37662 () Bool)

(assert start!37662)

(declare-fun b!385624 () Bool)

(declare-fun res!219984 () Bool)

(declare-fun e!234055 () Bool)

(assert (=> b!385624 (=> (not res!219984) (not e!234055))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22773 0))(
  ( (array!22774 (arr!10855 (Array (_ BitVec 32) (_ BitVec 64))) (size!11207 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22773)

(assert (=> b!385624 (= res!219984 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11207 _keys!658))))))

(declare-fun b!385625 () Bool)

(declare-fun res!219985 () Bool)

(assert (=> b!385625 (=> (not res!219985) (not e!234055))))

(declare-datatypes ((List!6249 0))(
  ( (Nil!6246) (Cons!6245 (h!7101 (_ BitVec 64)) (t!11399 List!6249)) )
))
(declare-fun arrayNoDuplicates!0 (array!22773 (_ BitVec 32) List!6249) Bool)

(assert (=> b!385625 (= res!219985 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6246))))

(declare-fun mapIsEmpty!15720 () Bool)

(declare-fun mapRes!15720 () Bool)

(assert (=> mapIsEmpty!15720 mapRes!15720))

(declare-fun b!385626 () Bool)

(declare-fun res!219981 () Bool)

(assert (=> b!385626 (=> (not res!219981) (not e!234055))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13687 0))(
  ( (V!13688 (val!4763 Int)) )
))
(declare-datatypes ((ValueCell!4375 0))(
  ( (ValueCellFull!4375 (v!6960 V!13687)) (EmptyCell!4375) )
))
(declare-datatypes ((array!22775 0))(
  ( (array!22776 (arr!10856 (Array (_ BitVec 32) ValueCell!4375)) (size!11208 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22775)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!385626 (= res!219981 (and (= (size!11208 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11207 _keys!658) (size!11208 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385627 () Bool)

(declare-fun res!219983 () Bool)

(assert (=> b!385627 (=> (not res!219983) (not e!234055))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385627 (= res!219983 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!385628 () Bool)

(declare-fun res!219986 () Bool)

(assert (=> b!385628 (=> (not res!219986) (not e!234055))))

(assert (=> b!385628 (= res!219986 (or (= (select (arr!10855 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10855 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!385629 () Bool)

(declare-fun res!219982 () Bool)

(assert (=> b!385629 (=> (not res!219982) (not e!234055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385629 (= res!219982 (validKeyInArray!0 k!778))))

(declare-fun b!385630 () Bool)

(assert (=> b!385630 (= e!234055 false)))

(declare-fun lt!181638 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22773 (_ BitVec 32)) Bool)

(assert (=> b!385630 (= lt!181638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!22774 (store (arr!10855 _keys!658) i!548 k!778) (size!11207 _keys!658)) mask!970))))

(declare-fun b!385631 () Bool)

(declare-fun e!234056 () Bool)

(declare-fun tp_is_empty!9437 () Bool)

(assert (=> b!385631 (= e!234056 tp_is_empty!9437)))

(declare-fun res!219979 () Bool)

(assert (=> start!37662 (=> (not res!219979) (not e!234055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37662 (= res!219979 (validMask!0 mask!970))))

(assert (=> start!37662 e!234055))

(assert (=> start!37662 true))

(declare-fun e!234052 () Bool)

(declare-fun array_inv!7992 (array!22775) Bool)

(assert (=> start!37662 (and (array_inv!7992 _values!506) e!234052)))

(declare-fun array_inv!7993 (array!22773) Bool)

(assert (=> start!37662 (array_inv!7993 _keys!658)))

(declare-fun b!385632 () Bool)

(declare-fun e!234053 () Bool)

(assert (=> b!385632 (= e!234053 tp_is_empty!9437)))

(declare-fun b!385633 () Bool)

(assert (=> b!385633 (= e!234052 (and e!234053 mapRes!15720))))

(declare-fun condMapEmpty!15720 () Bool)

(declare-fun mapDefault!15720 () ValueCell!4375)

