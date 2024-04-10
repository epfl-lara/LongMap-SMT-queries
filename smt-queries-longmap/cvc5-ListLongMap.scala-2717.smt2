; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40120 () Bool)

(assert start!40120)

(declare-fun b_free!10387 () Bool)

(declare-fun b_next!10387 () Bool)

(assert (=> start!40120 (= b_free!10387 (not b_next!10387))))

(declare-fun tp!36690 () Bool)

(declare-fun b_and!18355 () Bool)

(assert (=> start!40120 (= tp!36690 b_and!18355)))

(declare-fun b!438644 () Bool)

(declare-fun e!258710 () Bool)

(assert (=> b!438644 (= e!258710 (not true))))

(declare-datatypes ((V!16491 0))(
  ( (V!16492 (val!5814 Int)) )
))
(declare-fun minValue!515 () V!16491)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5426 0))(
  ( (ValueCellFull!5426 (v!8061 V!16491)) (EmptyCell!5426) )
))
(declare-datatypes ((array!26895 0))(
  ( (array!26896 (arr!12897 (Array (_ BitVec 32) ValueCell!5426)) (size!13249 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26895)

(declare-fun zeroValue!515 () V!16491)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((array!26897 0))(
  ( (array!26898 (arr!12898 (Array (_ BitVec 32) (_ BitVec 64))) (size!13250 (_ BitVec 32))) )
))
(declare-fun lt!202023 () array!26897)

(declare-fun v!412 () V!16491)

(declare-fun _keys!709 () array!26897)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!202022 () array!26895)

(declare-datatypes ((tuple2!7714 0))(
  ( (tuple2!7715 (_1!3868 (_ BitVec 64)) (_2!3868 V!16491)) )
))
(declare-datatypes ((List!7712 0))(
  ( (Nil!7709) (Cons!7708 (h!8564 tuple2!7714) (t!13468 List!7712)) )
))
(declare-datatypes ((ListLongMap!6627 0))(
  ( (ListLongMap!6628 (toList!3329 List!7712)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1518 (array!26897 array!26895 (_ BitVec 32) (_ BitVec 32) V!16491 V!16491 (_ BitVec 32) Int) ListLongMap!6627)

(declare-fun +!1472 (ListLongMap!6627 tuple2!7714) ListLongMap!6627)

(assert (=> b!438644 (= (getCurrentListMapNoExtraKeys!1518 lt!202023 lt!202022 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1472 (getCurrentListMapNoExtraKeys!1518 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7715 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13048 0))(
  ( (Unit!13049) )
))
(declare-fun lt!202021 () Unit!13048)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!641 (array!26897 array!26895 (_ BitVec 32) (_ BitVec 32) V!16491 V!16491 (_ BitVec 32) (_ BitVec 64) V!16491 (_ BitVec 32) Int) Unit!13048)

(assert (=> b!438644 (= lt!202021 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!641 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438645 () Bool)

(declare-fun res!259041 () Bool)

(declare-fun e!258708 () Bool)

(assert (=> b!438645 (=> (not res!259041) (not e!258708))))

(declare-datatypes ((List!7713 0))(
  ( (Nil!7710) (Cons!7709 (h!8565 (_ BitVec 64)) (t!13469 List!7713)) )
))
(declare-fun arrayNoDuplicates!0 (array!26897 (_ BitVec 32) List!7713) Bool)

(assert (=> b!438645 (= res!259041 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7710))))

(declare-fun b!438646 () Bool)

(declare-fun res!259042 () Bool)

(assert (=> b!438646 (=> (not res!259042) (not e!258708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26897 (_ BitVec 32)) Bool)

(assert (=> b!438646 (= res!259042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438647 () Bool)

(declare-fun e!258709 () Bool)

(declare-fun tp_is_empty!11539 () Bool)

(assert (=> b!438647 (= e!258709 tp_is_empty!11539)))

(declare-fun res!259048 () Bool)

(assert (=> start!40120 (=> (not res!259048) (not e!258708))))

(assert (=> start!40120 (= res!259048 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13250 _keys!709))))))

(assert (=> start!40120 e!258708))

(assert (=> start!40120 tp_is_empty!11539))

(assert (=> start!40120 tp!36690))

(assert (=> start!40120 true))

(declare-fun e!258705 () Bool)

(declare-fun array_inv!9366 (array!26895) Bool)

(assert (=> start!40120 (and (array_inv!9366 _values!549) e!258705)))

(declare-fun array_inv!9367 (array!26897) Bool)

(assert (=> start!40120 (array_inv!9367 _keys!709)))

(declare-fun b!438648 () Bool)

(declare-fun mapRes!18930 () Bool)

(assert (=> b!438648 (= e!258705 (and e!258709 mapRes!18930))))

(declare-fun condMapEmpty!18930 () Bool)

(declare-fun mapDefault!18930 () ValueCell!5426)

