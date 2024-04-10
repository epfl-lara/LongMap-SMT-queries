; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37800 () Bool)

(assert start!37800)

(declare-fun b_free!8903 () Bool)

(declare-fun b_next!8903 () Bool)

(assert (=> start!37800 (= b_free!8903 (not b_next!8903))))

(declare-fun tp!31461 () Bool)

(declare-fun b_and!16145 () Bool)

(assert (=> start!37800 (= tp!31461 b_and!16145)))

(declare-fun b!388313 () Bool)

(declare-fun res!222048 () Bool)

(declare-fun e!235298 () Bool)

(assert (=> b!388313 (=> (not res!222048) (not e!235298))))

(declare-datatypes ((array!23041 0))(
  ( (array!23042 (arr!10989 (Array (_ BitVec 32) (_ BitVec 64))) (size!11341 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23041)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!388313 (= res!222048 (or (= (select (arr!10989 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10989 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15927 () Bool)

(declare-fun mapRes!15927 () Bool)

(assert (=> mapIsEmpty!15927 mapRes!15927))

(declare-fun b!388314 () Bool)

(declare-fun res!222053 () Bool)

(assert (=> b!388314 (=> (not res!222053) (not e!235298))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388314 (= res!222053 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!388315 () Bool)

(declare-fun e!235294 () Bool)

(declare-fun tp_is_empty!9575 () Bool)

(assert (=> b!388315 (= e!235294 tp_is_empty!9575)))

(declare-fun b!388316 () Bool)

(declare-fun res!222055 () Bool)

(assert (=> b!388316 (=> (not res!222055) (not e!235298))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13871 0))(
  ( (V!13872 (val!4832 Int)) )
))
(declare-datatypes ((ValueCell!4444 0))(
  ( (ValueCellFull!4444 (v!7029 V!13871)) (EmptyCell!4444) )
))
(declare-datatypes ((array!23043 0))(
  ( (array!23044 (arr!10990 (Array (_ BitVec 32) ValueCell!4444)) (size!11342 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23043)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!388316 (= res!222055 (and (= (size!11342 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11341 _keys!658) (size!11342 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15927 () Bool)

(declare-fun tp!31460 () Bool)

(assert (=> mapNonEmpty!15927 (= mapRes!15927 (and tp!31460 e!235294))))

(declare-fun mapRest!15927 () (Array (_ BitVec 32) ValueCell!4444))

(declare-fun mapKey!15927 () (_ BitVec 32))

(declare-fun mapValue!15927 () ValueCell!4444)

(assert (=> mapNonEmpty!15927 (= (arr!10990 _values!506) (store mapRest!15927 mapKey!15927 mapValue!15927))))

(declare-fun b!388317 () Bool)

(declare-fun res!222056 () Bool)

(assert (=> b!388317 (=> (not res!222056) (not e!235298))))

(assert (=> b!388317 (= res!222056 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11341 _keys!658))))))

(declare-fun b!388318 () Bool)

(declare-fun res!222050 () Bool)

(assert (=> b!388318 (=> (not res!222050) (not e!235298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388318 (= res!222050 (validKeyInArray!0 k!778))))

(declare-fun b!388319 () Bool)

(declare-fun res!222047 () Bool)

(declare-fun e!235296 () Bool)

(assert (=> b!388319 (=> (not res!222047) (not e!235296))))

(declare-fun lt!182293 () array!23041)

(declare-datatypes ((List!6349 0))(
  ( (Nil!6346) (Cons!6345 (h!7201 (_ BitVec 64)) (t!11499 List!6349)) )
))
(declare-fun arrayNoDuplicates!0 (array!23041 (_ BitVec 32) List!6349) Bool)

(assert (=> b!388319 (= res!222047 (arrayNoDuplicates!0 lt!182293 #b00000000000000000000000000000000 Nil!6346))))

(declare-fun b!388320 () Bool)

(declare-fun res!222054 () Bool)

(assert (=> b!388320 (=> (not res!222054) (not e!235298))))

(assert (=> b!388320 (= res!222054 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6346))))

(declare-fun res!222051 () Bool)

(assert (=> start!37800 (=> (not res!222051) (not e!235298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37800 (= res!222051 (validMask!0 mask!970))))

(assert (=> start!37800 e!235298))

(declare-fun e!235297 () Bool)

(declare-fun array_inv!8078 (array!23043) Bool)

(assert (=> start!37800 (and (array_inv!8078 _values!506) e!235297)))

(assert (=> start!37800 tp!31461))

(assert (=> start!37800 true))

(assert (=> start!37800 tp_is_empty!9575))

(declare-fun array_inv!8079 (array!23041) Bool)

(assert (=> start!37800 (array_inv!8079 _keys!658)))

(declare-fun b!388321 () Bool)

(declare-fun e!235293 () Bool)

(assert (=> b!388321 (= e!235297 (and e!235293 mapRes!15927))))

(declare-fun condMapEmpty!15927 () Bool)

(declare-fun mapDefault!15927 () ValueCell!4444)

