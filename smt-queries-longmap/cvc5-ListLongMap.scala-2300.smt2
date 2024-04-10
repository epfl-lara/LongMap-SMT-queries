; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37262 () Bool)

(assert start!37262)

(declare-fun b_free!8389 () Bool)

(declare-fun b_next!8389 () Bool)

(assert (=> start!37262 (= b_free!8389 (not b_next!8389))))

(declare-fun tp!29883 () Bool)

(declare-fun b_and!15631 () Bool)

(assert (=> start!37262 (= tp!29883 b_and!15631)))

(declare-fun b!377196 () Bool)

(declare-fun res!213358 () Bool)

(declare-fun e!229665 () Bool)

(assert (=> b!377196 (=> (not res!213358) (not e!229665))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13155 0))(
  ( (V!13156 (val!4563 Int)) )
))
(declare-datatypes ((ValueCell!4175 0))(
  ( (ValueCellFull!4175 (v!6760 V!13155)) (EmptyCell!4175) )
))
(declare-datatypes ((array!22003 0))(
  ( (array!22004 (arr!10470 (Array (_ BitVec 32) ValueCell!4175)) (size!10822 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22003)

(declare-datatypes ((array!22005 0))(
  ( (array!22006 (arr!10471 (Array (_ BitVec 32) (_ BitVec 64))) (size!10823 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22005)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!377196 (= res!213358 (and (= (size!10822 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10823 _keys!658) (size!10822 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377197 () Bool)

(declare-fun e!229664 () Bool)

(declare-fun tp_is_empty!9037 () Bool)

(assert (=> b!377197 (= e!229664 tp_is_empty!9037)))

(declare-fun b!377198 () Bool)

(declare-fun res!213360 () Bool)

(assert (=> b!377198 (=> (not res!213360) (not e!229665))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377198 (= res!213360 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!377199 () Bool)

(declare-fun e!229663 () Bool)

(declare-fun e!229670 () Bool)

(assert (=> b!377199 (= e!229663 e!229670)))

(declare-fun res!213359 () Bool)

(assert (=> b!377199 (=> res!213359 e!229670)))

(assert (=> b!377199 (= res!213359 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6080 0))(
  ( (tuple2!6081 (_1!3051 (_ BitVec 64)) (_2!3051 V!13155)) )
))
(declare-datatypes ((List!5921 0))(
  ( (Nil!5918) (Cons!5917 (h!6773 tuple2!6080) (t!11071 List!5921)) )
))
(declare-datatypes ((ListLongMap!4993 0))(
  ( (ListLongMap!4994 (toList!2512 List!5921)) )
))
(declare-fun lt!175292 () ListLongMap!4993)

(declare-fun lt!175296 () ListLongMap!4993)

(assert (=> b!377199 (= lt!175292 lt!175296)))

(declare-fun lt!175293 () ListLongMap!4993)

(declare-fun lt!175285 () tuple2!6080)

(declare-fun +!858 (ListLongMap!4993 tuple2!6080) ListLongMap!4993)

(assert (=> b!377199 (= lt!175296 (+!858 lt!175293 lt!175285))))

(declare-fun lt!175288 () ListLongMap!4993)

(declare-fun lt!175290 () ListLongMap!4993)

(assert (=> b!377199 (= lt!175288 lt!175290)))

(declare-fun lt!175294 () ListLongMap!4993)

(assert (=> b!377199 (= lt!175290 (+!858 lt!175294 lt!175285))))

(declare-fun lt!175289 () ListLongMap!4993)

(assert (=> b!377199 (= lt!175292 (+!858 lt!175289 lt!175285))))

(declare-fun zeroValue!472 () V!13155)

(assert (=> b!377199 (= lt!175285 (tuple2!6081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377200 () Bool)

(declare-fun res!213352 () Bool)

(assert (=> b!377200 (=> (not res!213352) (not e!229665))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377200 (= res!213352 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10823 _keys!658))))))

(declare-fun b!377201 () Bool)

(declare-fun res!213355 () Bool)

(assert (=> b!377201 (=> (not res!213355) (not e!229665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22005 (_ BitVec 32)) Bool)

(assert (=> b!377201 (= res!213355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15120 () Bool)

(declare-fun mapRes!15120 () Bool)

(declare-fun tp!29882 () Bool)

(assert (=> mapNonEmpty!15120 (= mapRes!15120 (and tp!29882 e!229664))))

(declare-fun mapRest!15120 () (Array (_ BitVec 32) ValueCell!4175))

(declare-fun mapValue!15120 () ValueCell!4175)

(declare-fun mapKey!15120 () (_ BitVec 32))

(assert (=> mapNonEmpty!15120 (= (arr!10470 _values!506) (store mapRest!15120 mapKey!15120 mapValue!15120))))

(declare-fun b!377202 () Bool)

(declare-fun e!229669 () Bool)

(assert (=> b!377202 (= e!229665 e!229669)))

(declare-fun res!213351 () Bool)

(assert (=> b!377202 (=> (not res!213351) (not e!229669))))

(declare-fun lt!175287 () array!22005)

(assert (=> b!377202 (= res!213351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175287 mask!970))))

(assert (=> b!377202 (= lt!175287 (array!22006 (store (arr!10471 _keys!658) i!548 k!778) (size!10823 _keys!658)))))

(declare-fun b!377203 () Bool)

(declare-fun res!213361 () Bool)

(assert (=> b!377203 (=> (not res!213361) (not e!229669))))

(declare-datatypes ((List!5922 0))(
  ( (Nil!5919) (Cons!5918 (h!6774 (_ BitVec 64)) (t!11072 List!5922)) )
))
(declare-fun arrayNoDuplicates!0 (array!22005 (_ BitVec 32) List!5922) Bool)

(assert (=> b!377203 (= res!213361 (arrayNoDuplicates!0 lt!175287 #b00000000000000000000000000000000 Nil!5919))))

(declare-fun res!213362 () Bool)

(assert (=> start!37262 (=> (not res!213362) (not e!229665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37262 (= res!213362 (validMask!0 mask!970))))

(assert (=> start!37262 e!229665))

(declare-fun e!229668 () Bool)

(declare-fun array_inv!7716 (array!22003) Bool)

(assert (=> start!37262 (and (array_inv!7716 _values!506) e!229668)))

(assert (=> start!37262 tp!29883))

(assert (=> start!37262 true))

(assert (=> start!37262 tp_is_empty!9037))

(declare-fun array_inv!7717 (array!22005) Bool)

(assert (=> start!37262 (array_inv!7717 _keys!658)))

(declare-fun b!377204 () Bool)

(declare-fun res!213353 () Bool)

(assert (=> b!377204 (=> (not res!213353) (not e!229665))))

(assert (=> b!377204 (= res!213353 (or (= (select (arr!10471 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10471 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15120 () Bool)

(assert (=> mapIsEmpty!15120 mapRes!15120))

(declare-fun b!377205 () Bool)

(assert (=> b!377205 (= e!229670 true)))

(declare-fun lt!175286 () tuple2!6080)

(assert (=> b!377205 (= lt!175296 (+!858 lt!175290 lt!175286))))

(declare-fun v!373 () V!13155)

(declare-datatypes ((Unit!11620 0))(
  ( (Unit!11621) )
))
(declare-fun lt!175291 () Unit!11620)

(declare-fun addCommutativeForDiffKeys!268 (ListLongMap!4993 (_ BitVec 64) V!13155 (_ BitVec 64) V!13155) Unit!11620)

(assert (=> b!377205 (= lt!175291 (addCommutativeForDiffKeys!268 lt!175294 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377206 () Bool)

(declare-fun e!229667 () Bool)

(assert (=> b!377206 (= e!229668 (and e!229667 mapRes!15120))))

(declare-fun condMapEmpty!15120 () Bool)

(declare-fun mapDefault!15120 () ValueCell!4175)

