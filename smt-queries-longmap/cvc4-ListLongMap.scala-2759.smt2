; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40410 () Bool)

(assert start!40410)

(declare-fun res!263466 () Bool)

(declare-fun e!261327 () Bool)

(assert (=> start!40410 (=> (not res!263466) (not e!261327))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27399 0))(
  ( (array!27400 (arr!13147 (Array (_ BitVec 32) (_ BitVec 64))) (size!13499 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27399)

(assert (=> start!40410 (= res!263466 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13499 _keys!709))))))

(assert (=> start!40410 e!261327))

(assert (=> start!40410 true))

(declare-datatypes ((V!16831 0))(
  ( (V!16832 (val!5942 Int)) )
))
(declare-datatypes ((ValueCell!5554 0))(
  ( (ValueCellFull!5554 (v!8193 V!16831)) (EmptyCell!5554) )
))
(declare-datatypes ((array!27401 0))(
  ( (array!27402 (arr!13148 (Array (_ BitVec 32) ValueCell!5554)) (size!13500 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27401)

(declare-fun e!261331 () Bool)

(declare-fun array_inv!9536 (array!27401) Bool)

(assert (=> start!40410 (and (array_inv!9536 _values!549) e!261331)))

(declare-fun array_inv!9537 (array!27399) Bool)

(assert (=> start!40410 (array_inv!9537 _keys!709)))

(declare-fun b!444341 () Bool)

(declare-fun e!261332 () Bool)

(declare-fun tp_is_empty!11795 () Bool)

(assert (=> b!444341 (= e!261332 tp_is_empty!11795)))

(declare-fun b!444342 () Bool)

(declare-fun e!261330 () Bool)

(assert (=> b!444342 (= e!261327 e!261330)))

(declare-fun res!263464 () Bool)

(assert (=> b!444342 (=> (not res!263464) (not e!261330))))

(declare-fun lt!203476 () array!27399)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27399 (_ BitVec 32)) Bool)

(assert (=> b!444342 (= res!263464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203476 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444342 (= lt!203476 (array!27400 (store (arr!13147 _keys!709) i!563 k!794) (size!13499 _keys!709)))))

(declare-fun b!444343 () Bool)

(declare-fun e!261329 () Bool)

(assert (=> b!444343 (= e!261329 tp_is_empty!11795)))

(declare-fun b!444344 () Bool)

(assert (=> b!444344 (= e!261330 false)))

(declare-fun lt!203477 () Bool)

(declare-datatypes ((List!7871 0))(
  ( (Nil!7868) (Cons!7867 (h!8723 (_ BitVec 64)) (t!13629 List!7871)) )
))
(declare-fun arrayNoDuplicates!0 (array!27399 (_ BitVec 32) List!7871) Bool)

(assert (=> b!444344 (= lt!203477 (arrayNoDuplicates!0 lt!203476 #b00000000000000000000000000000000 Nil!7868))))

(declare-fun b!444345 () Bool)

(declare-fun res!263463 () Bool)

(assert (=> b!444345 (=> (not res!263463) (not e!261327))))

(assert (=> b!444345 (= res!263463 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13499 _keys!709))))))

(declare-fun mapIsEmpty!19320 () Bool)

(declare-fun mapRes!19320 () Bool)

(assert (=> mapIsEmpty!19320 mapRes!19320))

(declare-fun b!444346 () Bool)

(declare-fun res!263461 () Bool)

(assert (=> b!444346 (=> (not res!263461) (not e!261327))))

(assert (=> b!444346 (= res!263461 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7868))))

(declare-fun b!444347 () Bool)

(declare-fun res!263469 () Bool)

(assert (=> b!444347 (=> (not res!263469) (not e!261327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444347 (= res!263469 (validMask!0 mask!1025))))

(declare-fun b!444348 () Bool)

(declare-fun res!263468 () Bool)

(assert (=> b!444348 (=> (not res!263468) (not e!261327))))

(assert (=> b!444348 (= res!263468 (or (= (select (arr!13147 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13147 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444349 () Bool)

(declare-fun res!263467 () Bool)

(assert (=> b!444349 (=> (not res!263467) (not e!261327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444349 (= res!263467 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!19320 () Bool)

(declare-fun tp!37302 () Bool)

(assert (=> mapNonEmpty!19320 (= mapRes!19320 (and tp!37302 e!261332))))

(declare-fun mapKey!19320 () (_ BitVec 32))

(declare-fun mapRest!19320 () (Array (_ BitVec 32) ValueCell!5554))

(declare-fun mapValue!19320 () ValueCell!5554)

(assert (=> mapNonEmpty!19320 (= (arr!13148 _values!549) (store mapRest!19320 mapKey!19320 mapValue!19320))))

(declare-fun b!444350 () Bool)

(declare-fun res!263470 () Bool)

(assert (=> b!444350 (=> (not res!263470) (not e!261327))))

(declare-fun arrayContainsKey!0 (array!27399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444350 (= res!263470 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!444351 () Bool)

(declare-fun res!263462 () Bool)

(assert (=> b!444351 (=> (not res!263462) (not e!261327))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444351 (= res!263462 (and (= (size!13500 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13499 _keys!709) (size!13500 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444352 () Bool)

(assert (=> b!444352 (= e!261331 (and e!261329 mapRes!19320))))

(declare-fun condMapEmpty!19320 () Bool)

(declare-fun mapDefault!19320 () ValueCell!5554)

