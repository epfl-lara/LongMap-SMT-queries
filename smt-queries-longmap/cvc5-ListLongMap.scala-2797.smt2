; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40670 () Bool)

(assert start!40670)

(declare-fun b_free!10681 () Bool)

(declare-fun b_next!10681 () Bool)

(assert (=> start!40670 (= b_free!10681 (not b_next!10681))))

(declare-fun tp!37863 () Bool)

(declare-fun b_and!18689 () Bool)

(assert (=> start!40670 (= tp!37863 b_and!18689)))

(declare-fun b!449492 () Bool)

(declare-fun e!263547 () Bool)

(declare-fun tp_is_empty!12019 () Bool)

(assert (=> b!449492 (= e!263547 tp_is_empty!12019)))

(declare-fun b!449493 () Bool)

(declare-fun res!267376 () Bool)

(declare-fun e!263552 () Bool)

(assert (=> b!449493 (=> (not res!267376) (not e!263552))))

(declare-datatypes ((array!27845 0))(
  ( (array!27846 (arr!13368 (Array (_ BitVec 32) (_ BitVec 64))) (size!13720 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27845)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449493 (= res!267376 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!449495 () Bool)

(declare-fun e!263548 () Bool)

(assert (=> b!449495 (= e!263548 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17131 0))(
  ( (V!17132 (val!6054 Int)) )
))
(declare-datatypes ((tuple2!7950 0))(
  ( (tuple2!7951 (_1!3986 (_ BitVec 64)) (_2!3986 V!17131)) )
))
(declare-datatypes ((List!8016 0))(
  ( (Nil!8013) (Cons!8012 (h!8868 tuple2!7950) (t!13778 List!8016)) )
))
(declare-datatypes ((ListLongMap!6863 0))(
  ( (ListLongMap!6864 (toList!3447 List!8016)) )
))
(declare-fun lt!204378 () ListLongMap!6863)

(declare-fun minValue!515 () V!17131)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!204377 () array!27845)

(declare-fun zeroValue!515 () V!17131)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17131)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5666 0))(
  ( (ValueCellFull!5666 (v!8309 V!17131)) (EmptyCell!5666) )
))
(declare-datatypes ((array!27847 0))(
  ( (array!27848 (arr!13369 (Array (_ BitVec 32) ValueCell!5666)) (size!13721 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27847)

(declare-fun getCurrentListMapNoExtraKeys!1633 (array!27845 array!27847 (_ BitVec 32) (_ BitVec 32) V!17131 V!17131 (_ BitVec 32) Int) ListLongMap!6863)

(assert (=> b!449495 (= lt!204378 (getCurrentListMapNoExtraKeys!1633 lt!204377 (array!27848 (store (arr!13369 _values!549) i!563 (ValueCellFull!5666 v!412)) (size!13721 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204376 () ListLongMap!6863)

(assert (=> b!449495 (= lt!204376 (getCurrentListMapNoExtraKeys!1633 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449496 () Bool)

(declare-fun res!267387 () Bool)

(assert (=> b!449496 (=> (not res!267387) (not e!263552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27845 (_ BitVec 32)) Bool)

(assert (=> b!449496 (= res!267387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449497 () Bool)

(declare-fun e!263551 () Bool)

(declare-fun mapRes!19662 () Bool)

(assert (=> b!449497 (= e!263551 (and e!263547 mapRes!19662))))

(declare-fun condMapEmpty!19662 () Bool)

(declare-fun mapDefault!19662 () ValueCell!5666)

