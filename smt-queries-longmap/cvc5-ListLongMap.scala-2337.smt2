; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37484 () Bool)

(assert start!37484)

(declare-fun b_free!8611 () Bool)

(declare-fun b_next!8611 () Bool)

(assert (=> start!37484 (= b_free!8611 (not b_next!8611))))

(declare-fun tp!30548 () Bool)

(declare-fun b_and!15853 () Bool)

(assert (=> start!37484 (= tp!30548 b_and!15853)))

(declare-fun b!382108 () Bool)

(declare-fun res!217270 () Bool)

(declare-fun e!232239 () Bool)

(assert (=> b!382108 (=> (not res!217270) (not e!232239))))

(declare-datatypes ((array!22427 0))(
  ( (array!22428 (arr!10682 (Array (_ BitVec 32) (_ BitVec 64))) (size!11034 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22427)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22427 (_ BitVec 32)) Bool)

(assert (=> b!382108 (= res!217270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382109 () Bool)

(declare-fun res!217274 () Bool)

(assert (=> b!382109 (=> (not res!217274) (not e!232239))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382109 (= res!217274 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!382110 () Bool)

(declare-fun e!232237 () Bool)

(assert (=> b!382110 (= e!232239 e!232237)))

(declare-fun res!217269 () Bool)

(assert (=> b!382110 (=> (not res!217269) (not e!232237))))

(declare-fun lt!179211 () array!22427)

(assert (=> b!382110 (= res!217269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179211 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382110 (= lt!179211 (array!22428 (store (arr!10682 _keys!658) i!548 k!778) (size!11034 _keys!658)))))

(declare-fun mapIsEmpty!15453 () Bool)

(declare-fun mapRes!15453 () Bool)

(assert (=> mapIsEmpty!15453 mapRes!15453))

(declare-fun mapNonEmpty!15453 () Bool)

(declare-fun tp!30549 () Bool)

(declare-fun e!232238 () Bool)

(assert (=> mapNonEmpty!15453 (= mapRes!15453 (and tp!30549 e!232238))))

(declare-datatypes ((V!13451 0))(
  ( (V!13452 (val!4674 Int)) )
))
(declare-datatypes ((ValueCell!4286 0))(
  ( (ValueCellFull!4286 (v!6871 V!13451)) (EmptyCell!4286) )
))
(declare-fun mapValue!15453 () ValueCell!4286)

(declare-datatypes ((array!22429 0))(
  ( (array!22430 (arr!10683 (Array (_ BitVec 32) ValueCell!4286)) (size!11035 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22429)

(declare-fun mapKey!15453 () (_ BitVec 32))

(declare-fun mapRest!15453 () (Array (_ BitVec 32) ValueCell!4286))

(assert (=> mapNonEmpty!15453 (= (arr!10683 _values!506) (store mapRest!15453 mapKey!15453 mapValue!15453))))

(declare-fun b!382111 () Bool)

(declare-fun res!217266 () Bool)

(assert (=> b!382111 (=> (not res!217266) (not e!232239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382111 (= res!217266 (validKeyInArray!0 k!778))))

(declare-fun b!382113 () Bool)

(declare-fun e!232240 () Bool)

(assert (=> b!382113 (= e!232240 true)))

(declare-datatypes ((tuple2!6282 0))(
  ( (tuple2!6283 (_1!3152 (_ BitVec 64)) (_2!3152 V!13451)) )
))
(declare-datatypes ((List!6112 0))(
  ( (Nil!6109) (Cons!6108 (h!6964 tuple2!6282) (t!11262 List!6112)) )
))
(declare-datatypes ((ListLongMap!5195 0))(
  ( (ListLongMap!5196 (toList!2613 List!6112)) )
))
(declare-fun lt!179209 () ListLongMap!5195)

(declare-fun lt!179215 () ListLongMap!5195)

(assert (=> b!382113 (= lt!179209 lt!179215)))

(declare-fun b!382114 () Bool)

(declare-fun res!217264 () Bool)

(assert (=> b!382114 (=> (not res!217264) (not e!232239))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382114 (= res!217264 (and (= (size!11035 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11034 _keys!658) (size!11035 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382115 () Bool)

(declare-fun tp_is_empty!9259 () Bool)

(assert (=> b!382115 (= e!232238 tp_is_empty!9259)))

(declare-fun b!382116 () Bool)

(declare-fun res!217268 () Bool)

(assert (=> b!382116 (=> (not res!217268) (not e!232239))))

(declare-datatypes ((List!6113 0))(
  ( (Nil!6110) (Cons!6109 (h!6965 (_ BitVec 64)) (t!11263 List!6113)) )
))
(declare-fun arrayNoDuplicates!0 (array!22427 (_ BitVec 32) List!6113) Bool)

(assert (=> b!382116 (= res!217268 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6110))))

(declare-fun b!382117 () Bool)

(assert (=> b!382117 (= e!232237 (not e!232240))))

(declare-fun res!217267 () Bool)

(assert (=> b!382117 (=> res!217267 e!232240)))

(declare-fun lt!179212 () Bool)

(assert (=> b!382117 (= res!217267 (or (and (not lt!179212) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179212) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179212)))))

(assert (=> b!382117 (= lt!179212 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!179214 () ListLongMap!5195)

(declare-fun zeroValue!472 () V!13451)

(declare-fun minValue!472 () V!13451)

(declare-fun getCurrentListMap!2020 (array!22427 array!22429 (_ BitVec 32) (_ BitVec 32) V!13451 V!13451 (_ BitVec 32) Int) ListLongMap!5195)

(assert (=> b!382117 (= lt!179214 (getCurrentListMap!2020 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179217 () array!22429)

(assert (=> b!382117 (= lt!179209 (getCurrentListMap!2020 lt!179211 lt!179217 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179213 () ListLongMap!5195)

(assert (=> b!382117 (and (= lt!179215 lt!179213) (= lt!179213 lt!179215))))

(declare-fun v!373 () V!13451)

(declare-fun lt!179216 () ListLongMap!5195)

(declare-fun +!950 (ListLongMap!5195 tuple2!6282) ListLongMap!5195)

(assert (=> b!382117 (= lt!179213 (+!950 lt!179216 (tuple2!6283 k!778 v!373)))))

(declare-datatypes ((Unit!11794 0))(
  ( (Unit!11795) )
))
(declare-fun lt!179210 () Unit!11794)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!178 (array!22427 array!22429 (_ BitVec 32) (_ BitVec 32) V!13451 V!13451 (_ BitVec 32) (_ BitVec 64) V!13451 (_ BitVec 32) Int) Unit!11794)

(assert (=> b!382117 (= lt!179210 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!178 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!854 (array!22427 array!22429 (_ BitVec 32) (_ BitVec 32) V!13451 V!13451 (_ BitVec 32) Int) ListLongMap!5195)

(assert (=> b!382117 (= lt!179215 (getCurrentListMapNoExtraKeys!854 lt!179211 lt!179217 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382117 (= lt!179217 (array!22430 (store (arr!10683 _values!506) i!548 (ValueCellFull!4286 v!373)) (size!11035 _values!506)))))

(assert (=> b!382117 (= lt!179216 (getCurrentListMapNoExtraKeys!854 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382118 () Bool)

(declare-fun res!217272 () Bool)

(assert (=> b!382118 (=> (not res!217272) (not e!232239))))

(assert (=> b!382118 (= res!217272 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11034 _keys!658))))))

(declare-fun b!382119 () Bool)

(declare-fun e!232241 () Bool)

(declare-fun e!232236 () Bool)

(assert (=> b!382119 (= e!232241 (and e!232236 mapRes!15453))))

(declare-fun condMapEmpty!15453 () Bool)

(declare-fun mapDefault!15453 () ValueCell!4286)

