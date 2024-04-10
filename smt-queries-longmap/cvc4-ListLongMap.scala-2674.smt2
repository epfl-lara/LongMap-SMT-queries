; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39866 () Bool)

(assert start!39866)

(declare-fun b_free!10133 () Bool)

(declare-fun b_next!10133 () Bool)

(assert (=> start!39866 (= b_free!10133 (not b_next!10133))))

(declare-fun tp!35927 () Bool)

(declare-fun b_and!17925 () Bool)

(assert (=> start!39866 (= tp!35927 b_and!17925)))

(declare-fun b!431324 () Bool)

(declare-fun e!255252 () Bool)

(declare-fun e!255253 () Bool)

(assert (=> b!431324 (= e!255252 e!255253)))

(declare-fun res!253562 () Bool)

(assert (=> b!431324 (=> (not res!253562) (not e!255253))))

(declare-datatypes ((array!26405 0))(
  ( (array!26406 (arr!12652 (Array (_ BitVec 32) (_ BitVec 64))) (size!13004 (_ BitVec 32))) )
))
(declare-fun lt!197508 () array!26405)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26405 (_ BitVec 32)) Bool)

(assert (=> b!431324 (= res!253562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197508 mask!1025))))

(declare-fun _keys!709 () array!26405)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!431324 (= lt!197508 (array!26406 (store (arr!12652 _keys!709) i!563 k!794) (size!13004 _keys!709)))))

(declare-fun b!431325 () Bool)

(declare-fun res!253561 () Bool)

(assert (=> b!431325 (=> (not res!253561) (not e!255252))))

(assert (=> b!431325 (= res!253561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!431326 () Bool)

(declare-fun e!255258 () Bool)

(declare-fun tp_is_empty!11285 () Bool)

(assert (=> b!431326 (= e!255258 tp_is_empty!11285)))

(declare-fun b!431327 () Bool)

(declare-fun res!253571 () Bool)

(assert (=> b!431327 (=> (not res!253571) (not e!255252))))

(declare-fun arrayContainsKey!0 (array!26405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431327 (= res!253571 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18549 () Bool)

(declare-fun mapRes!18549 () Bool)

(assert (=> mapIsEmpty!18549 mapRes!18549))

(declare-fun mapNonEmpty!18549 () Bool)

(declare-fun tp!35928 () Bool)

(declare-fun e!255255 () Bool)

(assert (=> mapNonEmpty!18549 (= mapRes!18549 (and tp!35928 e!255255))))

(declare-datatypes ((V!16151 0))(
  ( (V!16152 (val!5687 Int)) )
))
(declare-datatypes ((ValueCell!5299 0))(
  ( (ValueCellFull!5299 (v!7934 V!16151)) (EmptyCell!5299) )
))
(declare-fun mapRest!18549 () (Array (_ BitVec 32) ValueCell!5299))

(declare-datatypes ((array!26407 0))(
  ( (array!26408 (arr!12653 (Array (_ BitVec 32) ValueCell!5299)) (size!13005 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26407)

(declare-fun mapValue!18549 () ValueCell!5299)

(declare-fun mapKey!18549 () (_ BitVec 32))

(assert (=> mapNonEmpty!18549 (= (arr!12653 _values!549) (store mapRest!18549 mapKey!18549 mapValue!18549))))

(declare-fun b!431328 () Bool)

(assert (=> b!431328 (= e!255255 tp_is_empty!11285)))

(declare-fun b!431329 () Bool)

(declare-fun res!253566 () Bool)

(assert (=> b!431329 (=> (not res!253566) (not e!255252))))

(assert (=> b!431329 (= res!253566 (or (= (select (arr!12652 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12652 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431330 () Bool)

(declare-fun e!255256 () Bool)

(declare-fun e!255261 () Bool)

(assert (=> b!431330 (= e!255256 e!255261)))

(declare-fun res!253569 () Bool)

(assert (=> b!431330 (=> res!253569 e!255261)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!431330 (= res!253569 (= k!794 (select (arr!12652 _keys!709) from!863)))))

(assert (=> b!431330 (not (= (select (arr!12652 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12711 0))(
  ( (Unit!12712) )
))
(declare-fun lt!197496 () Unit!12711)

(declare-fun e!255259 () Unit!12711)

(assert (=> b!431330 (= lt!197496 e!255259)))

(declare-fun c!55535 () Bool)

(assert (=> b!431330 (= c!55535 (= (select (arr!12652 _keys!709) from!863) k!794))))

(declare-datatypes ((tuple2!7498 0))(
  ( (tuple2!7499 (_1!3760 (_ BitVec 64)) (_2!3760 V!16151)) )
))
(declare-datatypes ((List!7514 0))(
  ( (Nil!7511) (Cons!7510 (h!8366 tuple2!7498) (t!13096 List!7514)) )
))
(declare-datatypes ((ListLongMap!6411 0))(
  ( (ListLongMap!6412 (toList!3221 List!7514)) )
))
(declare-fun lt!197505 () ListLongMap!6411)

(declare-fun lt!197500 () ListLongMap!6411)

(assert (=> b!431330 (= lt!197505 lt!197500)))

(declare-fun lt!197503 () ListLongMap!6411)

(declare-fun lt!197497 () tuple2!7498)

(declare-fun +!1369 (ListLongMap!6411 tuple2!7498) ListLongMap!6411)

(assert (=> b!431330 (= lt!197500 (+!1369 lt!197503 lt!197497))))

(declare-fun lt!197509 () V!16151)

(assert (=> b!431330 (= lt!197497 (tuple2!7499 (select (arr!12652 _keys!709) from!863) lt!197509))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6282 (ValueCell!5299 V!16151) V!16151)

(declare-fun dynLambda!791 (Int (_ BitVec 64)) V!16151)

(assert (=> b!431330 (= lt!197509 (get!6282 (select (arr!12653 _values!549) from!863) (dynLambda!791 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431331 () Bool)

(declare-fun res!253563 () Bool)

(assert (=> b!431331 (=> (not res!253563) (not e!255252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431331 (= res!253563 (validKeyInArray!0 k!794))))

(declare-fun b!431332 () Bool)

(declare-fun res!253565 () Bool)

(assert (=> b!431332 (=> (not res!253565) (not e!255253))))

(declare-datatypes ((List!7515 0))(
  ( (Nil!7512) (Cons!7511 (h!8367 (_ BitVec 64)) (t!13097 List!7515)) )
))
(declare-fun arrayNoDuplicates!0 (array!26405 (_ BitVec 32) List!7515) Bool)

(assert (=> b!431332 (= res!253565 (arrayNoDuplicates!0 lt!197508 #b00000000000000000000000000000000 Nil!7512))))

(declare-fun b!431334 () Bool)

(declare-fun res!253574 () Bool)

(assert (=> b!431334 (=> (not res!253574) (not e!255252))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!431334 (= res!253574 (and (= (size!13005 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13004 _keys!709) (size!13005 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431335 () Bool)

(declare-fun Unit!12713 () Unit!12711)

(assert (=> b!431335 (= e!255259 Unit!12713)))

(declare-fun b!431336 () Bool)

(declare-fun e!255260 () Bool)

(assert (=> b!431336 (= e!255260 (and e!255258 mapRes!18549))))

(declare-fun condMapEmpty!18549 () Bool)

(declare-fun mapDefault!18549 () ValueCell!5299)

