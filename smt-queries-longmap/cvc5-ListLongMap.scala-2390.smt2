; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37802 () Bool)

(assert start!37802)

(declare-fun b_free!8905 () Bool)

(declare-fun b_next!8905 () Bool)

(assert (=> start!37802 (= b_free!8905 (not b_next!8905))))

(declare-fun tp!31466 () Bool)

(declare-fun b_and!16147 () Bool)

(assert (=> start!37802 (= tp!31466 b_and!16147)))

(declare-fun mapNonEmpty!15930 () Bool)

(declare-fun mapRes!15930 () Bool)

(declare-fun tp!31467 () Bool)

(declare-fun e!235314 () Bool)

(assert (=> mapNonEmpty!15930 (= mapRes!15930 (and tp!31467 e!235314))))

(declare-datatypes ((V!13875 0))(
  ( (V!13876 (val!4833 Int)) )
))
(declare-datatypes ((ValueCell!4445 0))(
  ( (ValueCellFull!4445 (v!7030 V!13875)) (EmptyCell!4445) )
))
(declare-fun mapValue!15930 () ValueCell!4445)

(declare-datatypes ((array!23045 0))(
  ( (array!23046 (arr!10991 (Array (_ BitVec 32) ValueCell!4445)) (size!11343 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23045)

(declare-fun mapKey!15930 () (_ BitVec 32))

(declare-fun mapRest!15930 () (Array (_ BitVec 32) ValueCell!4445))

(assert (=> mapNonEmpty!15930 (= (arr!10991 _values!506) (store mapRest!15930 mapKey!15930 mapValue!15930))))

(declare-fun b!388354 () Bool)

(declare-fun res!222079 () Bool)

(declare-fun e!235318 () Bool)

(assert (=> b!388354 (=> (not res!222079) (not e!235318))))

(declare-datatypes ((array!23047 0))(
  ( (array!23048 (arr!10992 (Array (_ BitVec 32) (_ BitVec 64))) (size!11344 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23047)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388354 (= res!222079 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!388355 () Bool)

(declare-fun tp_is_empty!9577 () Bool)

(assert (=> b!388355 (= e!235314 tp_is_empty!9577)))

(declare-fun b!388356 () Bool)

(declare-fun e!235317 () Bool)

(declare-fun e!235316 () Bool)

(assert (=> b!388356 (= e!235317 (not e!235316))))

(declare-fun res!222084 () Bool)

(assert (=> b!388356 (=> res!222084 e!235316)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!388356 (= res!222084 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13875)

(declare-datatypes ((tuple2!6496 0))(
  ( (tuple2!6497 (_1!3259 (_ BitVec 64)) (_2!3259 V!13875)) )
))
(declare-datatypes ((List!6350 0))(
  ( (Nil!6347) (Cons!6346 (h!7202 tuple2!6496) (t!11500 List!6350)) )
))
(declare-datatypes ((ListLongMap!5409 0))(
  ( (ListLongMap!5410 (toList!2720 List!6350)) )
))
(declare-fun lt!182315 () ListLongMap!5409)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13875)

(declare-fun getCurrentListMap!2069 (array!23047 array!23045 (_ BitVec 32) (_ BitVec 32) V!13875 V!13875 (_ BitVec 32) Int) ListLongMap!5409)

(assert (=> b!388356 (= lt!182315 (getCurrentListMap!2069 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182312 () ListLongMap!5409)

(declare-fun lt!182316 () array!23045)

(declare-fun lt!182314 () array!23047)

(assert (=> b!388356 (= lt!182312 (getCurrentListMap!2069 lt!182314 lt!182316 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182317 () ListLongMap!5409)

(declare-fun lt!182318 () ListLongMap!5409)

(assert (=> b!388356 (and (= lt!182317 lt!182318) (= lt!182318 lt!182317))))

(declare-fun v!373 () V!13875)

(declare-fun lt!182313 () ListLongMap!5409)

(declare-fun +!1015 (ListLongMap!5409 tuple2!6496) ListLongMap!5409)

(assert (=> b!388356 (= lt!182318 (+!1015 lt!182313 (tuple2!6497 k!778 v!373)))))

(declare-datatypes ((Unit!11904 0))(
  ( (Unit!11905) )
))
(declare-fun lt!182319 () Unit!11904)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!233 (array!23047 array!23045 (_ BitVec 32) (_ BitVec 32) V!13875 V!13875 (_ BitVec 32) (_ BitVec 64) V!13875 (_ BitVec 32) Int) Unit!11904)

(assert (=> b!388356 (= lt!182319 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!233 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!949 (array!23047 array!23045 (_ BitVec 32) (_ BitVec 32) V!13875 V!13875 (_ BitVec 32) Int) ListLongMap!5409)

(assert (=> b!388356 (= lt!182317 (getCurrentListMapNoExtraKeys!949 lt!182314 lt!182316 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388356 (= lt!182316 (array!23046 (store (arr!10991 _values!506) i!548 (ValueCellFull!4445 v!373)) (size!11343 _values!506)))))

(assert (=> b!388356 (= lt!182313 (getCurrentListMapNoExtraKeys!949 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388357 () Bool)

(declare-fun res!222087 () Bool)

(assert (=> b!388357 (=> (not res!222087) (not e!235318))))

(assert (=> b!388357 (= res!222087 (and (= (size!11343 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11344 _keys!658) (size!11343 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!388358 () Bool)

(declare-fun res!222080 () Bool)

(assert (=> b!388358 (=> (not res!222080) (not e!235318))))

(assert (=> b!388358 (= res!222080 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11344 _keys!658))))))

(declare-fun b!388359 () Bool)

(declare-fun e!235315 () Bool)

(assert (=> b!388359 (= e!235315 tp_is_empty!9577)))

(declare-fun b!388360 () Bool)

(declare-fun res!222083 () Bool)

(assert (=> b!388360 (=> (not res!222083) (not e!235318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23047 (_ BitVec 32)) Bool)

(assert (=> b!388360 (= res!222083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!388361 () Bool)

(assert (=> b!388361 (= e!235316 (= lt!182312 (+!1015 (+!1015 lt!182317 (tuple2!6497 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (tuple2!6497 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!388362 () Bool)

(declare-fun res!222082 () Bool)

(assert (=> b!388362 (=> (not res!222082) (not e!235317))))

(declare-datatypes ((List!6351 0))(
  ( (Nil!6348) (Cons!6347 (h!7203 (_ BitVec 64)) (t!11501 List!6351)) )
))
(declare-fun arrayNoDuplicates!0 (array!23047 (_ BitVec 32) List!6351) Bool)

(assert (=> b!388362 (= res!222082 (arrayNoDuplicates!0 lt!182314 #b00000000000000000000000000000000 Nil!6348))))

(declare-fun b!388363 () Bool)

(declare-fun res!222089 () Bool)

(assert (=> b!388363 (=> (not res!222089) (not e!235318))))

(assert (=> b!388363 (= res!222089 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6348))))

(declare-fun mapIsEmpty!15930 () Bool)

(assert (=> mapIsEmpty!15930 mapRes!15930))

(declare-fun b!388364 () Bool)

(declare-fun res!222085 () Bool)

(assert (=> b!388364 (=> (not res!222085) (not e!235318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388364 (= res!222085 (validKeyInArray!0 k!778))))

(declare-fun b!388366 () Bool)

(declare-fun res!222086 () Bool)

(assert (=> b!388366 (=> (not res!222086) (not e!235318))))

(assert (=> b!388366 (= res!222086 (or (= (select (arr!10992 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10992 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388367 () Bool)

(assert (=> b!388367 (= e!235318 e!235317)))

(declare-fun res!222088 () Bool)

(assert (=> b!388367 (=> (not res!222088) (not e!235317))))

(assert (=> b!388367 (= res!222088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182314 mask!970))))

(assert (=> b!388367 (= lt!182314 (array!23048 (store (arr!10992 _keys!658) i!548 k!778) (size!11344 _keys!658)))))

(declare-fun b!388365 () Bool)

(declare-fun e!235313 () Bool)

(assert (=> b!388365 (= e!235313 (and e!235315 mapRes!15930))))

(declare-fun condMapEmpty!15930 () Bool)

(declare-fun mapDefault!15930 () ValueCell!4445)

