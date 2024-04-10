; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39808 () Bool)

(assert start!39808)

(declare-fun b_free!10075 () Bool)

(declare-fun b_next!10075 () Bool)

(assert (=> start!39808 (= b_free!10075 (not b_next!10075))))

(declare-fun tp!35754 () Bool)

(declare-fun b_and!17809 () Bool)

(assert (=> start!39808 (= tp!35754 b_and!17809)))

(declare-fun b!429551 () Bool)

(declare-fun res!252285 () Bool)

(declare-fun e!254410 () Bool)

(assert (=> b!429551 (=> (not res!252285) (not e!254410))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16075 0))(
  ( (V!16076 (val!5658 Int)) )
))
(declare-datatypes ((ValueCell!5270 0))(
  ( (ValueCellFull!5270 (v!7905 V!16075)) (EmptyCell!5270) )
))
(declare-datatypes ((array!26289 0))(
  ( (array!26290 (arr!12594 (Array (_ BitVec 32) ValueCell!5270)) (size!12946 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26289)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!26291 0))(
  ( (array!26292 (arr!12595 (Array (_ BitVec 32) (_ BitVec 64))) (size!12947 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26291)

(assert (=> b!429551 (= res!252285 (and (= (size!12946 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12947 _keys!709) (size!12946 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429552 () Bool)

(declare-fun res!252283 () Bool)

(assert (=> b!429552 (=> (not res!252283) (not e!254410))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429552 (= res!252283 (or (= (select (arr!12595 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12595 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429553 () Bool)

(declare-fun res!252290 () Bool)

(declare-fun e!254415 () Bool)

(assert (=> b!429553 (=> (not res!252290) (not e!254415))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!429553 (= res!252290 (bvsle from!863 i!563))))

(declare-fun b!429554 () Bool)

(declare-fun e!254413 () Bool)

(declare-fun e!254412 () Bool)

(assert (=> b!429554 (= e!254413 (not e!254412))))

(declare-fun res!252282 () Bool)

(assert (=> b!429554 (=> res!252282 e!254412)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429554 (= res!252282 (not (validKeyInArray!0 (select (arr!12595 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7450 0))(
  ( (tuple2!7451 (_1!3736 (_ BitVec 64)) (_2!3736 V!16075)) )
))
(declare-datatypes ((List!7466 0))(
  ( (Nil!7463) (Cons!7462 (h!8318 tuple2!7450) (t!12990 List!7466)) )
))
(declare-datatypes ((ListLongMap!6363 0))(
  ( (ListLongMap!6364 (toList!3197 List!7466)) )
))
(declare-fun lt!196325 () ListLongMap!6363)

(declare-fun lt!196321 () ListLongMap!6363)

(assert (=> b!429554 (= lt!196325 lt!196321)))

(declare-fun lt!196320 () ListLongMap!6363)

(declare-fun v!412 () V!16075)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun +!1346 (ListLongMap!6363 tuple2!7450) ListLongMap!6363)

(assert (=> b!429554 (= lt!196321 (+!1346 lt!196320 (tuple2!7451 k!794 v!412)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16075)

(declare-fun minValue!515 () V!16075)

(declare-fun lt!196317 () array!26289)

(declare-fun lt!196318 () array!26291)

(declare-fun getCurrentListMapNoExtraKeys!1399 (array!26291 array!26289 (_ BitVec 32) (_ BitVec 32) V!16075 V!16075 (_ BitVec 32) Int) ListLongMap!6363)

(assert (=> b!429554 (= lt!196325 (getCurrentListMapNoExtraKeys!1399 lt!196318 lt!196317 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!429554 (= lt!196320 (getCurrentListMapNoExtraKeys!1399 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12623 0))(
  ( (Unit!12624) )
))
(declare-fun lt!196324 () Unit!12623)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!535 (array!26291 array!26289 (_ BitVec 32) (_ BitVec 32) V!16075 V!16075 (_ BitVec 32) (_ BitVec 64) V!16075 (_ BitVec 32) Int) Unit!12623)

(assert (=> b!429554 (= lt!196324 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!535 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429555 () Bool)

(declare-fun res!252287 () Bool)

(assert (=> b!429555 (=> (not res!252287) (not e!254410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26291 (_ BitVec 32)) Bool)

(assert (=> b!429555 (= res!252287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429556 () Bool)

(assert (=> b!429556 (= e!254412 true)))

(assert (=> b!429556 (not (= (select (arr!12595 _keys!709) from!863) k!794))))

(declare-fun lt!196316 () Unit!12623)

(declare-fun e!254407 () Unit!12623)

(assert (=> b!429556 (= lt!196316 e!254407)))

(declare-fun c!55448 () Bool)

(assert (=> b!429556 (= c!55448 (= (select (arr!12595 _keys!709) from!863) k!794))))

(declare-fun lt!196322 () ListLongMap!6363)

(declare-fun get!6246 (ValueCell!5270 V!16075) V!16075)

(declare-fun dynLambda!773 (Int (_ BitVec 64)) V!16075)

(assert (=> b!429556 (= lt!196322 (+!1346 lt!196321 (tuple2!7451 (select (arr!12595 _keys!709) from!863) (get!6246 (select (arr!12594 _values!549) from!863) (dynLambda!773 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!18462 () Bool)

(declare-fun mapRes!18462 () Bool)

(assert (=> mapIsEmpty!18462 mapRes!18462))

(declare-fun mapNonEmpty!18462 () Bool)

(declare-fun tp!35753 () Bool)

(declare-fun e!254414 () Bool)

(assert (=> mapNonEmpty!18462 (= mapRes!18462 (and tp!35753 e!254414))))

(declare-fun mapValue!18462 () ValueCell!5270)

(declare-fun mapKey!18462 () (_ BitVec 32))

(declare-fun mapRest!18462 () (Array (_ BitVec 32) ValueCell!5270))

(assert (=> mapNonEmpty!18462 (= (arr!12594 _values!549) (store mapRest!18462 mapKey!18462 mapValue!18462))))

(declare-fun b!429557 () Bool)

(declare-fun e!254409 () Bool)

(declare-fun tp_is_empty!11227 () Bool)

(assert (=> b!429557 (= e!254409 tp_is_empty!11227)))

(declare-fun b!429558 () Bool)

(declare-fun res!252292 () Bool)

(assert (=> b!429558 (=> (not res!252292) (not e!254410))))

(assert (=> b!429558 (= res!252292 (validKeyInArray!0 k!794))))

(declare-fun b!429559 () Bool)

(declare-fun res!252281 () Bool)

(assert (=> b!429559 (=> (not res!252281) (not e!254415))))

(declare-datatypes ((List!7467 0))(
  ( (Nil!7464) (Cons!7463 (h!8319 (_ BitVec 64)) (t!12991 List!7467)) )
))
(declare-fun arrayNoDuplicates!0 (array!26291 (_ BitVec 32) List!7467) Bool)

(assert (=> b!429559 (= res!252281 (arrayNoDuplicates!0 lt!196318 #b00000000000000000000000000000000 Nil!7464))))

(declare-fun b!429560 () Bool)

(assert (=> b!429560 (= e!254410 e!254415)))

(declare-fun res!252291 () Bool)

(assert (=> b!429560 (=> (not res!252291) (not e!254415))))

(assert (=> b!429560 (= res!252291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196318 mask!1025))))

(assert (=> b!429560 (= lt!196318 (array!26292 (store (arr!12595 _keys!709) i!563 k!794) (size!12947 _keys!709)))))

(declare-fun b!429561 () Bool)

(declare-fun res!252284 () Bool)

(assert (=> b!429561 (=> (not res!252284) (not e!254410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429561 (= res!252284 (validMask!0 mask!1025))))

(declare-fun b!429562 () Bool)

(declare-fun res!252294 () Bool)

(assert (=> b!429562 (=> (not res!252294) (not e!254410))))

(assert (=> b!429562 (= res!252294 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12947 _keys!709))))))

(declare-fun b!429563 () Bool)

(declare-fun res!252289 () Bool)

(assert (=> b!429563 (=> (not res!252289) (not e!254410))))

(declare-fun arrayContainsKey!0 (array!26291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429563 (= res!252289 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!429564 () Bool)

(declare-fun e!254411 () Bool)

(assert (=> b!429564 (= e!254411 (and e!254409 mapRes!18462))))

(declare-fun condMapEmpty!18462 () Bool)

(declare-fun mapDefault!18462 () ValueCell!5270)

