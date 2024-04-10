; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37944 () Bool)

(assert start!37944)

(declare-fun b_free!8957 () Bool)

(declare-fun b_next!8957 () Bool)

(assert (=> start!37944 (= b_free!8957 (not b_next!8957))))

(declare-fun tp!31635 () Bool)

(declare-fun b_and!16247 () Bool)

(assert (=> start!37944 (= tp!31635 b_and!16247)))

(declare-fun b!390334 () Bool)

(declare-fun e!236442 () Bool)

(declare-fun e!236443 () Bool)

(assert (=> b!390334 (= e!236442 e!236443)))

(declare-fun res!223378 () Bool)

(assert (=> b!390334 (=> (not res!223378) (not e!236443))))

(declare-datatypes ((array!23155 0))(
  ( (array!23156 (arr!11042 (Array (_ BitVec 32) (_ BitVec 64))) (size!11394 (_ BitVec 32))) )
))
(declare-fun lt!183944 () array!23155)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23155 (_ BitVec 32)) Bool)

(assert (=> b!390334 (= res!223378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183944 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!23155)

(assert (=> b!390334 (= lt!183944 (array!23156 (store (arr!11042 _keys!658) i!548 k!778) (size!11394 _keys!658)))))

(declare-fun b!390335 () Bool)

(declare-fun e!236441 () Bool)

(declare-fun tp_is_empty!9629 () Bool)

(assert (=> b!390335 (= e!236441 tp_is_empty!9629)))

(declare-fun mapIsEmpty!16020 () Bool)

(declare-fun mapRes!16020 () Bool)

(assert (=> mapIsEmpty!16020 mapRes!16020))

(declare-fun b!390336 () Bool)

(declare-fun res!223382 () Bool)

(assert (=> b!390336 (=> (not res!223382) (not e!236442))))

(assert (=> b!390336 (= res!223382 (or (= (select (arr!11042 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11042 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((V!13943 0))(
  ( (V!13944 (val!4859 Int)) )
))
(declare-datatypes ((tuple2!6538 0))(
  ( (tuple2!6539 (_1!3280 (_ BitVec 64)) (_2!3280 V!13943)) )
))
(declare-datatypes ((List!6393 0))(
  ( (Nil!6390) (Cons!6389 (h!7245 tuple2!6538) (t!11551 List!6393)) )
))
(declare-datatypes ((ListLongMap!5451 0))(
  ( (ListLongMap!5452 (toList!2741 List!6393)) )
))
(declare-fun lt!183943 () ListLongMap!5451)

(declare-fun lt!183938 () ListLongMap!5451)

(declare-fun zeroValue!472 () V!13943)

(declare-fun e!236444 () Bool)

(declare-fun b!390337 () Bool)

(declare-fun +!1036 (ListLongMap!5451 tuple2!6538) ListLongMap!5451)

(assert (=> b!390337 (= e!236444 (= lt!183938 (+!1036 lt!183943 (tuple2!6539 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(declare-fun b!390338 () Bool)

(declare-fun res!223387 () Bool)

(assert (=> b!390338 (=> (not res!223387) (not e!236442))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4471 0))(
  ( (ValueCellFull!4471 (v!7072 V!13943)) (EmptyCell!4471) )
))
(declare-datatypes ((array!23157 0))(
  ( (array!23158 (arr!11043 (Array (_ BitVec 32) ValueCell!4471)) (size!11395 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23157)

(assert (=> b!390338 (= res!223387 (and (= (size!11395 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11394 _keys!658) (size!11395 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!390339 () Bool)

(declare-fun res!223380 () Bool)

(assert (=> b!390339 (=> (not res!223380) (not e!236442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390339 (= res!223380 (validKeyInArray!0 k!778))))

(declare-fun b!390340 () Bool)

(declare-fun res!223385 () Bool)

(assert (=> b!390340 (=> (not res!223385) (not e!236443))))

(declare-datatypes ((List!6394 0))(
  ( (Nil!6391) (Cons!6390 (h!7246 (_ BitVec 64)) (t!11552 List!6394)) )
))
(declare-fun arrayNoDuplicates!0 (array!23155 (_ BitVec 32) List!6394) Bool)

(assert (=> b!390340 (= res!223385 (arrayNoDuplicates!0 lt!183944 #b00000000000000000000000000000000 Nil!6391))))

(declare-fun res!223384 () Bool)

(assert (=> start!37944 (=> (not res!223384) (not e!236442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37944 (= res!223384 (validMask!0 mask!970))))

(assert (=> start!37944 e!236442))

(declare-fun e!236445 () Bool)

(declare-fun array_inv!8112 (array!23157) Bool)

(assert (=> start!37944 (and (array_inv!8112 _values!506) e!236445)))

(assert (=> start!37944 tp!31635))

(assert (=> start!37944 true))

(assert (=> start!37944 tp_is_empty!9629))

(declare-fun array_inv!8113 (array!23155) Bool)

(assert (=> start!37944 (array_inv!8113 _keys!658)))

(declare-fun b!390341 () Bool)

(declare-fun e!236440 () Bool)

(assert (=> b!390341 (= e!236440 tp_is_empty!9629)))

(declare-fun b!390342 () Bool)

(declare-fun res!223377 () Bool)

(assert (=> b!390342 (=> (not res!223377) (not e!236442))))

(assert (=> b!390342 (= res!223377 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11394 _keys!658))))))

(declare-fun b!390343 () Bool)

(assert (=> b!390343 (= e!236445 (and e!236440 mapRes!16020))))

(declare-fun condMapEmpty!16020 () Bool)

(declare-fun mapDefault!16020 () ValueCell!4471)

