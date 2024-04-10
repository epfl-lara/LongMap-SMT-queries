; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40238 () Bool)

(assert start!40238)

(declare-fun b_free!10505 () Bool)

(declare-fun b_next!10505 () Bool)

(assert (=> start!40238 (= b_free!10505 (not b_next!10505))))

(declare-fun tp!37043 () Bool)

(declare-fun b_and!18473 () Bool)

(assert (=> start!40238 (= tp!37043 b_and!18473)))

(declare-fun b!441476 () Bool)

(declare-fun res!261350 () Bool)

(declare-fun e!259949 () Bool)

(assert (=> b!441476 (=> (not res!261350) (not e!259949))))

(declare-datatypes ((array!27127 0))(
  ( (array!27128 (arr!13013 (Array (_ BitVec 32) (_ BitVec 64))) (size!13365 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27127)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441476 (= res!261350 (or (= (select (arr!13013 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13013 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19107 () Bool)

(declare-fun mapRes!19107 () Bool)

(assert (=> mapIsEmpty!19107 mapRes!19107))

(declare-fun b!441477 () Bool)

(declare-fun e!259948 () Bool)

(declare-fun tp_is_empty!11657 () Bool)

(assert (=> b!441477 (= e!259948 tp_is_empty!11657)))

(declare-fun b!441478 () Bool)

(declare-fun e!259944 () Bool)

(assert (=> b!441478 (= e!259944 tp_is_empty!11657)))

(declare-fun b!441480 () Bool)

(declare-fun res!261343 () Bool)

(assert (=> b!441480 (=> (not res!261343) (not e!259949))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27127 (_ BitVec 32)) Bool)

(assert (=> b!441480 (= res!261343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441481 () Bool)

(declare-fun res!261349 () Bool)

(assert (=> b!441481 (=> (not res!261349) (not e!259949))))

(declare-datatypes ((List!7812 0))(
  ( (Nil!7809) (Cons!7808 (h!8664 (_ BitVec 64)) (t!13568 List!7812)) )
))
(declare-fun arrayNoDuplicates!0 (array!27127 (_ BitVec 32) List!7812) Bool)

(assert (=> b!441481 (= res!261349 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7809))))

(declare-fun b!441482 () Bool)

(declare-fun res!261341 () Bool)

(declare-fun e!259945 () Bool)

(assert (=> b!441482 (=> (not res!261341) (not e!259945))))

(declare-fun lt!202908 () array!27127)

(assert (=> b!441482 (= res!261341 (arrayNoDuplicates!0 lt!202908 #b00000000000000000000000000000000 Nil!7809))))

(declare-fun b!441479 () Bool)

(declare-fun e!259946 () Bool)

(assert (=> b!441479 (= e!259946 (not true))))

(declare-datatypes ((V!16647 0))(
  ( (V!16648 (val!5873 Int)) )
))
(declare-fun minValue!515 () V!16647)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5485 0))(
  ( (ValueCellFull!5485 (v!8120 V!16647)) (EmptyCell!5485) )
))
(declare-datatypes ((array!27129 0))(
  ( (array!27130 (arr!13014 (Array (_ BitVec 32) ValueCell!5485)) (size!13366 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27129)

(declare-fun zeroValue!515 () V!16647)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!202910 () array!27129)

(declare-fun v!412 () V!16647)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7816 0))(
  ( (tuple2!7817 (_1!3919 (_ BitVec 64)) (_2!3919 V!16647)) )
))
(declare-datatypes ((List!7813 0))(
  ( (Nil!7810) (Cons!7809 (h!8665 tuple2!7816) (t!13569 List!7813)) )
))
(declare-datatypes ((ListLongMap!6729 0))(
  ( (ListLongMap!6730 (toList!3380 List!7813)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1569 (array!27127 array!27129 (_ BitVec 32) (_ BitVec 32) V!16647 V!16647 (_ BitVec 32) Int) ListLongMap!6729)

(declare-fun +!1516 (ListLongMap!6729 tuple2!7816) ListLongMap!6729)

(assert (=> b!441479 (= (getCurrentListMapNoExtraKeys!1569 lt!202908 lt!202910 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1516 (getCurrentListMapNoExtraKeys!1569 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7817 k!794 v!412)))))

(declare-datatypes ((Unit!13136 0))(
  ( (Unit!13137) )
))
(declare-fun lt!202909 () Unit!13136)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!685 (array!27127 array!27129 (_ BitVec 32) (_ BitVec 32) V!16647 V!16647 (_ BitVec 32) (_ BitVec 64) V!16647 (_ BitVec 32) Int) Unit!13136)

(assert (=> b!441479 (= lt!202909 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!685 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!261348 () Bool)

(assert (=> start!40238 (=> (not res!261348) (not e!259949))))

(assert (=> start!40238 (= res!261348 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13365 _keys!709))))))

(assert (=> start!40238 e!259949))

(assert (=> start!40238 tp_is_empty!11657))

(assert (=> start!40238 tp!37043))

(assert (=> start!40238 true))

(declare-fun e!259950 () Bool)

(declare-fun array_inv!9444 (array!27129) Bool)

(assert (=> start!40238 (and (array_inv!9444 _values!549) e!259950)))

(declare-fun array_inv!9445 (array!27127) Bool)

(assert (=> start!40238 (array_inv!9445 _keys!709)))

(declare-fun b!441483 () Bool)

(declare-fun res!261339 () Bool)

(assert (=> b!441483 (=> (not res!261339) (not e!259949))))

(assert (=> b!441483 (= res!261339 (and (= (size!13366 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13365 _keys!709) (size!13366 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441484 () Bool)

(assert (=> b!441484 (= e!259945 e!259946)))

(declare-fun res!261346 () Bool)

(assert (=> b!441484 (=> (not res!261346) (not e!259946))))

(assert (=> b!441484 (= res!261346 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202907 () ListLongMap!6729)

(assert (=> b!441484 (= lt!202907 (getCurrentListMapNoExtraKeys!1569 lt!202908 lt!202910 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441484 (= lt!202910 (array!27130 (store (arr!13014 _values!549) i!563 (ValueCellFull!5485 v!412)) (size!13366 _values!549)))))

(declare-fun lt!202906 () ListLongMap!6729)

(assert (=> b!441484 (= lt!202906 (getCurrentListMapNoExtraKeys!1569 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441485 () Bool)

(assert (=> b!441485 (= e!259950 (and e!259948 mapRes!19107))))

(declare-fun condMapEmpty!19107 () Bool)

(declare-fun mapDefault!19107 () ValueCell!5485)

