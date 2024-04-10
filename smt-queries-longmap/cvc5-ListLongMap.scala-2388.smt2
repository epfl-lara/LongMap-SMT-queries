; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37790 () Bool)

(assert start!37790)

(declare-fun b_free!8893 () Bool)

(declare-fun b_next!8893 () Bool)

(assert (=> start!37790 (= b_free!8893 (not b_next!8893))))

(declare-fun tp!31430 () Bool)

(declare-fun b_and!16135 () Bool)

(assert (=> start!37790 (= tp!31430 b_and!16135)))

(declare-fun b!388118 () Bool)

(declare-fun res!221900 () Bool)

(declare-fun e!235207 () Bool)

(assert (=> b!388118 (=> (not res!221900) (not e!235207))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!23021 0))(
  ( (array!23022 (arr!10979 (Array (_ BitVec 32) (_ BitVec 64))) (size!11331 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23021)

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((V!13859 0))(
  ( (V!13860 (val!4827 Int)) )
))
(declare-datatypes ((ValueCell!4439 0))(
  ( (ValueCellFull!4439 (v!7024 V!13859)) (EmptyCell!4439) )
))
(declare-datatypes ((array!23023 0))(
  ( (array!23024 (arr!10980 (Array (_ BitVec 32) ValueCell!4439)) (size!11332 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23023)

(assert (=> b!388118 (= res!221900 (and (= (size!11332 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11331 _keys!658) (size!11332 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!388119 () Bool)

(declare-fun res!221905 () Bool)

(assert (=> b!388119 (=> (not res!221905) (not e!235207))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!388119 (= res!221905 (or (= (select (arr!10979 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10979 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388120 () Bool)

(declare-fun res!221906 () Bool)

(assert (=> b!388120 (=> (not res!221906) (not e!235207))))

(assert (=> b!388120 (= res!221906 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11331 _keys!658))))))

(declare-fun mapIsEmpty!15912 () Bool)

(declare-fun mapRes!15912 () Bool)

(assert (=> mapIsEmpty!15912 mapRes!15912))

(declare-fun b!388121 () Bool)

(declare-fun res!221903 () Bool)

(declare-fun e!235205 () Bool)

(assert (=> b!388121 (=> (not res!221903) (not e!235205))))

(declare-fun lt!182217 () array!23021)

(declare-datatypes ((List!6342 0))(
  ( (Nil!6339) (Cons!6338 (h!7194 (_ BitVec 64)) (t!11492 List!6342)) )
))
(declare-fun arrayNoDuplicates!0 (array!23021 (_ BitVec 32) List!6342) Bool)

(assert (=> b!388121 (= res!221903 (arrayNoDuplicates!0 lt!182217 #b00000000000000000000000000000000 Nil!6339))))

(declare-fun res!221899 () Bool)

(assert (=> start!37790 (=> (not res!221899) (not e!235207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37790 (= res!221899 (validMask!0 mask!970))))

(assert (=> start!37790 e!235207))

(declare-fun e!235204 () Bool)

(declare-fun array_inv!8072 (array!23023) Bool)

(assert (=> start!37790 (and (array_inv!8072 _values!506) e!235204)))

(assert (=> start!37790 tp!31430))

(assert (=> start!37790 true))

(declare-fun tp_is_empty!9565 () Bool)

(assert (=> start!37790 tp_is_empty!9565))

(declare-fun array_inv!8073 (array!23021) Bool)

(assert (=> start!37790 (array_inv!8073 _keys!658)))

(declare-fun b!388122 () Bool)

(assert (=> b!388122 (= e!235207 e!235205)))

(declare-fun res!221901 () Bool)

(assert (=> b!388122 (=> (not res!221901) (not e!235205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23021 (_ BitVec 32)) Bool)

(assert (=> b!388122 (= res!221901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182217 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!388122 (= lt!182217 (array!23022 (store (arr!10979 _keys!658) i!548 k!778) (size!11331 _keys!658)))))

(declare-fun mapNonEmpty!15912 () Bool)

(declare-fun tp!31431 () Bool)

(declare-fun e!235208 () Bool)

(assert (=> mapNonEmpty!15912 (= mapRes!15912 (and tp!31431 e!235208))))

(declare-fun mapValue!15912 () ValueCell!4439)

(declare-fun mapKey!15912 () (_ BitVec 32))

(declare-fun mapRest!15912 () (Array (_ BitVec 32) ValueCell!4439))

(assert (=> mapNonEmpty!15912 (= (arr!10980 _values!506) (store mapRest!15912 mapKey!15912 mapValue!15912))))

(declare-fun b!388123 () Bool)

(assert (=> b!388123 (= e!235208 tp_is_empty!9565)))

(declare-fun b!388124 () Bool)

(declare-fun res!221897 () Bool)

(assert (=> b!388124 (=> (not res!221897) (not e!235207))))

(assert (=> b!388124 (= res!221897 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6339))))

(declare-fun b!388125 () Bool)

(declare-fun e!235203 () Bool)

(assert (=> b!388125 (= e!235203 tp_is_empty!9565)))

(declare-fun b!388126 () Bool)

(declare-fun res!221904 () Bool)

(assert (=> b!388126 (=> (not res!221904) (not e!235207))))

(assert (=> b!388126 (= res!221904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!388127 () Bool)

(declare-fun res!221902 () Bool)

(assert (=> b!388127 (=> (not res!221902) (not e!235207))))

(declare-fun arrayContainsKey!0 (array!23021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388127 (= res!221902 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!388128 () Bool)

(assert (=> b!388128 (= e!235204 (and e!235203 mapRes!15912))))

(declare-fun condMapEmpty!15912 () Bool)

(declare-fun mapDefault!15912 () ValueCell!4439)

