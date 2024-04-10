; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39892 () Bool)

(assert start!39892)

(declare-fun b_free!10159 () Bool)

(declare-fun b_next!10159 () Bool)

(assert (=> start!39892 (= b_free!10159 (not b_next!10159))))

(declare-fun tp!36006 () Bool)

(declare-fun b_and!17977 () Bool)

(assert (=> start!39892 (= tp!36006 b_and!17977)))

(declare-fun b!432130 () Bool)

(declare-fun res!254153 () Bool)

(declare-fun e!255643 () Bool)

(assert (=> b!432130 (=> (not res!254153) (not e!255643))))

(declare-datatypes ((array!26455 0))(
  ( (array!26456 (arr!12677 (Array (_ BitVec 32) (_ BitVec 64))) (size!13029 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26455)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16187 0))(
  ( (V!16188 (val!5700 Int)) )
))
(declare-datatypes ((ValueCell!5312 0))(
  ( (ValueCellFull!5312 (v!7947 V!16187)) (EmptyCell!5312) )
))
(declare-datatypes ((array!26457 0))(
  ( (array!26458 (arr!12678 (Array (_ BitVec 32) ValueCell!5312)) (size!13030 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26457)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!432130 (= res!254153 (and (= (size!13030 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13029 _keys!709) (size!13030 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432131 () Bool)

(declare-fun res!254160 () Bool)

(assert (=> b!432131 (=> (not res!254160) (not e!255643))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432131 (= res!254160 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13029 _keys!709))))))

(declare-fun b!432132 () Bool)

(declare-fun e!255649 () Bool)

(declare-fun e!255648 () Bool)

(assert (=> b!432132 (= e!255649 e!255648)))

(declare-fun res!254159 () Bool)

(assert (=> b!432132 (=> res!254159 e!255648)))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!432132 (= res!254159 (= k!794 (select (arr!12677 _keys!709) from!863)))))

(assert (=> b!432132 (not (= (select (arr!12677 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12755 0))(
  ( (Unit!12756) )
))
(declare-fun lt!198091 () Unit!12755)

(declare-fun e!255644 () Unit!12755)

(assert (=> b!432132 (= lt!198091 e!255644)))

(declare-fun c!55574 () Bool)

(assert (=> b!432132 (= c!55574 (= (select (arr!12677 _keys!709) from!863) k!794))))

(declare-datatypes ((tuple2!7520 0))(
  ( (tuple2!7521 (_1!3771 (_ BitVec 64)) (_2!3771 V!16187)) )
))
(declare-datatypes ((List!7535 0))(
  ( (Nil!7532) (Cons!7531 (h!8387 tuple2!7520) (t!13143 List!7535)) )
))
(declare-datatypes ((ListLongMap!6433 0))(
  ( (ListLongMap!6434 (toList!3232 List!7535)) )
))
(declare-fun lt!198084 () ListLongMap!6433)

(declare-fun lt!198081 () ListLongMap!6433)

(assert (=> b!432132 (= lt!198084 lt!198081)))

(declare-fun lt!198083 () ListLongMap!6433)

(declare-fun lt!198082 () tuple2!7520)

(declare-fun +!1380 (ListLongMap!6433 tuple2!7520) ListLongMap!6433)

(assert (=> b!432132 (= lt!198081 (+!1380 lt!198083 lt!198082))))

(declare-fun lt!198085 () V!16187)

(assert (=> b!432132 (= lt!198082 (tuple2!7521 (select (arr!12677 _keys!709) from!863) lt!198085))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6302 (ValueCell!5312 V!16187) V!16187)

(declare-fun dynLambda!801 (Int (_ BitVec 64)) V!16187)

(assert (=> b!432132 (= lt!198085 (get!6302 (select (arr!12678 _values!549) from!863) (dynLambda!801 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432133 () Bool)

(declare-fun Unit!12757 () Unit!12755)

(assert (=> b!432133 (= e!255644 Unit!12757)))

(declare-fun lt!198094 () Unit!12755)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26455 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12755)

(assert (=> b!432133 (= lt!198094 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432133 false))

(declare-fun b!432134 () Bool)

(declare-fun res!254148 () Bool)

(assert (=> b!432134 (=> (not res!254148) (not e!255643))))

(declare-fun arrayContainsKey!0 (array!26455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432134 (= res!254148 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!432135 () Bool)

(declare-fun e!255651 () Bool)

(assert (=> b!432135 (= e!255651 (not e!255649))))

(declare-fun res!254155 () Bool)

(assert (=> b!432135 (=> res!254155 e!255649)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432135 (= res!254155 (not (validKeyInArray!0 (select (arr!12677 _keys!709) from!863))))))

(declare-fun lt!198093 () ListLongMap!6433)

(assert (=> b!432135 (= lt!198093 lt!198083)))

(declare-fun lt!198095 () ListLongMap!6433)

(declare-fun lt!198089 () tuple2!7520)

(assert (=> b!432135 (= lt!198083 (+!1380 lt!198095 lt!198089))))

(declare-fun minValue!515 () V!16187)

(declare-fun zeroValue!515 () V!16187)

(declare-fun lt!198092 () array!26457)

(declare-fun lt!198087 () array!26455)

(declare-fun getCurrentListMapNoExtraKeys!1430 (array!26455 array!26457 (_ BitVec 32) (_ BitVec 32) V!16187 V!16187 (_ BitVec 32) Int) ListLongMap!6433)

(assert (=> b!432135 (= lt!198093 (getCurrentListMapNoExtraKeys!1430 lt!198087 lt!198092 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16187)

(assert (=> b!432135 (= lt!198089 (tuple2!7521 k!794 v!412))))

(assert (=> b!432135 (= lt!198095 (getCurrentListMapNoExtraKeys!1430 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198086 () Unit!12755)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!565 (array!26455 array!26457 (_ BitVec 32) (_ BitVec 32) V!16187 V!16187 (_ BitVec 32) (_ BitVec 64) V!16187 (_ BitVec 32) Int) Unit!12755)

(assert (=> b!432135 (= lt!198086 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!565 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432137 () Bool)

(declare-fun res!254152 () Bool)

(assert (=> b!432137 (=> (not res!254152) (not e!255643))))

(assert (=> b!432137 (= res!254152 (validKeyInArray!0 k!794))))

(declare-fun b!432138 () Bool)

(declare-fun e!255646 () Bool)

(declare-fun tp_is_empty!11311 () Bool)

(assert (=> b!432138 (= e!255646 tp_is_empty!11311)))

(declare-fun mapNonEmpty!18588 () Bool)

(declare-fun mapRes!18588 () Bool)

(declare-fun tp!36005 () Bool)

(declare-fun e!255650 () Bool)

(assert (=> mapNonEmpty!18588 (= mapRes!18588 (and tp!36005 e!255650))))

(declare-fun mapRest!18588 () (Array (_ BitVec 32) ValueCell!5312))

(declare-fun mapValue!18588 () ValueCell!5312)

(declare-fun mapKey!18588 () (_ BitVec 32))

(assert (=> mapNonEmpty!18588 (= (arr!12678 _values!549) (store mapRest!18588 mapKey!18588 mapValue!18588))))

(declare-fun b!432139 () Bool)

(assert (=> b!432139 (= e!255650 tp_is_empty!11311)))

(declare-fun b!432140 () Bool)

(declare-fun res!254157 () Bool)

(declare-fun e!255645 () Bool)

(assert (=> b!432140 (=> (not res!254157) (not e!255645))))

(declare-datatypes ((List!7536 0))(
  ( (Nil!7533) (Cons!7532 (h!8388 (_ BitVec 64)) (t!13144 List!7536)) )
))
(declare-fun arrayNoDuplicates!0 (array!26455 (_ BitVec 32) List!7536) Bool)

(assert (=> b!432140 (= res!254157 (arrayNoDuplicates!0 lt!198087 #b00000000000000000000000000000000 Nil!7533))))

(declare-fun b!432141 () Bool)

(declare-fun res!254147 () Bool)

(assert (=> b!432141 (=> (not res!254147) (not e!255643))))

(assert (=> b!432141 (= res!254147 (or (= (select (arr!12677 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12677 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432142 () Bool)

(declare-fun res!254154 () Bool)

(assert (=> b!432142 (=> (not res!254154) (not e!255643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432142 (= res!254154 (validMask!0 mask!1025))))

(declare-fun b!432143 () Bool)

(declare-fun Unit!12758 () Unit!12755)

(assert (=> b!432143 (= e!255644 Unit!12758)))

(declare-fun b!432144 () Bool)

(assert (=> b!432144 (= e!255645 e!255651)))

(declare-fun res!254150 () Bool)

(assert (=> b!432144 (=> (not res!254150) (not e!255651))))

(assert (=> b!432144 (= res!254150 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!432144 (= lt!198084 (getCurrentListMapNoExtraKeys!1430 lt!198087 lt!198092 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432144 (= lt!198092 (array!26458 (store (arr!12678 _values!549) i!563 (ValueCellFull!5312 v!412)) (size!13030 _values!549)))))

(declare-fun lt!198088 () ListLongMap!6433)

(assert (=> b!432144 (= lt!198088 (getCurrentListMapNoExtraKeys!1430 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432145 () Bool)

(assert (=> b!432145 (= e!255643 e!255645)))

(declare-fun res!254156 () Bool)

(assert (=> b!432145 (=> (not res!254156) (not e!255645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26455 (_ BitVec 32)) Bool)

(assert (=> b!432145 (= res!254156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198087 mask!1025))))

(assert (=> b!432145 (= lt!198087 (array!26456 (store (arr!12677 _keys!709) i!563 k!794) (size!13029 _keys!709)))))

(declare-fun b!432146 () Bool)

(declare-fun e!255642 () Bool)

(assert (=> b!432146 (= e!255642 (and e!255646 mapRes!18588))))

(declare-fun condMapEmpty!18588 () Bool)

(declare-fun mapDefault!18588 () ValueCell!5312)

