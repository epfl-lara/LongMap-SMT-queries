; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40024 () Bool)

(assert start!40024)

(declare-fun b_free!10291 () Bool)

(declare-fun b_next!10291 () Bool)

(assert (=> start!40024 (= b_free!10291 (not b_next!10291))))

(declare-fun tp!36402 () Bool)

(declare-fun b_and!18241 () Bool)

(assert (=> start!40024 (= tp!36402 b_and!18241)))

(declare-fun b!436222 () Bool)

(declare-fun e!257626 () Bool)

(declare-fun tp_is_empty!11443 () Bool)

(assert (=> b!436222 (= e!257626 tp_is_empty!11443)))

(declare-fun b!436223 () Bool)

(declare-fun e!257624 () Bool)

(assert (=> b!436223 (= e!257624 tp_is_empty!11443)))

(declare-fun b!436224 () Bool)

(declare-fun res!257129 () Bool)

(declare-fun e!257629 () Bool)

(assert (=> b!436224 (=> (not res!257129) (not e!257629))))

(declare-datatypes ((array!26711 0))(
  ( (array!26712 (arr!12805 (Array (_ BitVec 32) (_ BitVec 64))) (size!13157 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26711)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436224 (= res!257129 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!436225 () Bool)

(declare-fun e!257625 () Bool)

(declare-fun e!257630 () Bool)

(assert (=> b!436225 (= e!257625 e!257630)))

(declare-fun res!257124 () Bool)

(assert (=> b!436225 (=> (not res!257124) (not e!257630))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436225 (= res!257124 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16363 0))(
  ( (V!16364 (val!5766 Int)) )
))
(declare-fun minValue!515 () V!16363)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7638 0))(
  ( (tuple2!7639 (_1!3830 (_ BitVec 64)) (_2!3830 V!16363)) )
))
(declare-datatypes ((List!7639 0))(
  ( (Nil!7636) (Cons!7635 (h!8491 tuple2!7638) (t!13379 List!7639)) )
))
(declare-datatypes ((ListLongMap!6551 0))(
  ( (ListLongMap!6552 (toList!3291 List!7639)) )
))
(declare-fun lt!201057 () ListLongMap!6551)

(declare-datatypes ((ValueCell!5378 0))(
  ( (ValueCellFull!5378 (v!8013 V!16363)) (EmptyCell!5378) )
))
(declare-datatypes ((array!26713 0))(
  ( (array!26714 (arr!12806 (Array (_ BitVec 32) ValueCell!5378)) (size!13158 (_ BitVec 32))) )
))
(declare-fun lt!201060 () array!26713)

(declare-fun zeroValue!515 () V!16363)

(declare-fun lt!201062 () array!26711)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1481 (array!26711 array!26713 (_ BitVec 32) (_ BitVec 32) V!16363 V!16363 (_ BitVec 32) Int) ListLongMap!6551)

(assert (=> b!436225 (= lt!201057 (getCurrentListMapNoExtraKeys!1481 lt!201062 lt!201060 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26713)

(declare-fun v!412 () V!16363)

(assert (=> b!436225 (= lt!201060 (array!26714 (store (arr!12806 _values!549) i!563 (ValueCellFull!5378 v!412)) (size!13158 _values!549)))))

(declare-fun lt!201064 () ListLongMap!6551)

(assert (=> b!436225 (= lt!201064 (getCurrentListMapNoExtraKeys!1481 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436226 () Bool)

(declare-fun res!257125 () Bool)

(assert (=> b!436226 (=> (not res!257125) (not e!257629))))

(assert (=> b!436226 (= res!257125 (and (= (size!13158 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13157 _keys!709) (size!13158 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436227 () Bool)

(assert (=> b!436227 (= e!257629 e!257625)))

(declare-fun res!257123 () Bool)

(assert (=> b!436227 (=> (not res!257123) (not e!257625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26711 (_ BitVec 32)) Bool)

(assert (=> b!436227 (= res!257123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201062 mask!1025))))

(assert (=> b!436227 (= lt!201062 (array!26712 (store (arr!12805 _keys!709) i!563 k!794) (size!13157 _keys!709)))))

(declare-fun b!436228 () Bool)

(declare-fun res!257127 () Bool)

(assert (=> b!436228 (=> (not res!257127) (not e!257629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436228 (= res!257127 (validMask!0 mask!1025))))

(declare-fun b!436229 () Bool)

(declare-fun res!257117 () Bool)

(assert (=> b!436229 (=> (not res!257117) (not e!257625))))

(declare-datatypes ((List!7640 0))(
  ( (Nil!7637) (Cons!7636 (h!8492 (_ BitVec 64)) (t!13380 List!7640)) )
))
(declare-fun arrayNoDuplicates!0 (array!26711 (_ BitVec 32) List!7640) Bool)

(assert (=> b!436229 (= res!257117 (arrayNoDuplicates!0 lt!201062 #b00000000000000000000000000000000 Nil!7637))))

(declare-fun b!436230 () Bool)

(declare-fun e!257628 () Bool)

(declare-fun e!257631 () Bool)

(assert (=> b!436230 (= e!257628 e!257631)))

(declare-fun res!257126 () Bool)

(assert (=> b!436230 (=> res!257126 e!257631)))

(assert (=> b!436230 (= res!257126 (= k!794 (select (arr!12805 _keys!709) from!863)))))

(assert (=> b!436230 (not (= (select (arr!12805 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12969 0))(
  ( (Unit!12970) )
))
(declare-fun lt!201059 () Unit!12969)

(declare-fun e!257623 () Unit!12969)

(assert (=> b!436230 (= lt!201059 e!257623)))

(declare-fun c!55772 () Bool)

(assert (=> b!436230 (= c!55772 (= (select (arr!12805 _keys!709) from!863) k!794))))

(declare-fun lt!201053 () ListLongMap!6551)

(assert (=> b!436230 (= lt!201057 lt!201053)))

(declare-fun lt!201055 () ListLongMap!6551)

(declare-fun lt!201051 () tuple2!7638)

(declare-fun +!1439 (ListLongMap!6551 tuple2!7638) ListLongMap!6551)

(assert (=> b!436230 (= lt!201053 (+!1439 lt!201055 lt!201051))))

(declare-fun lt!201058 () V!16363)

(assert (=> b!436230 (= lt!201051 (tuple2!7639 (select (arr!12805 _keys!709) from!863) lt!201058))))

(declare-fun get!6389 (ValueCell!5378 V!16363) V!16363)

(declare-fun dynLambda!844 (Int (_ BitVec 64)) V!16363)

(assert (=> b!436230 (= lt!201058 (get!6389 (select (arr!12806 _values!549) from!863) (dynLambda!844 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436231 () Bool)

(declare-fun res!257128 () Bool)

(assert (=> b!436231 (=> (not res!257128) (not e!257629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436231 (= res!257128 (validKeyInArray!0 k!794))))

(declare-fun b!436232 () Bool)

(assert (=> b!436232 (= e!257631 true)))

(declare-fun lt!201063 () ListLongMap!6551)

(declare-fun lt!201061 () tuple2!7638)

(assert (=> b!436232 (= lt!201053 (+!1439 (+!1439 lt!201063 lt!201051) lt!201061))))

(declare-fun lt!201065 () Unit!12969)

(declare-fun addCommutativeForDiffKeys!421 (ListLongMap!6551 (_ BitVec 64) V!16363 (_ BitVec 64) V!16363) Unit!12969)

(assert (=> b!436232 (= lt!201065 (addCommutativeForDiffKeys!421 lt!201063 k!794 v!412 (select (arr!12805 _keys!709) from!863) lt!201058))))

(declare-fun b!436233 () Bool)

(declare-fun res!257119 () Bool)

(assert (=> b!436233 (=> (not res!257119) (not e!257629))))

(assert (=> b!436233 (= res!257119 (or (= (select (arr!12805 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12805 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436234 () Bool)

(declare-fun res!257116 () Bool)

(assert (=> b!436234 (=> (not res!257116) (not e!257629))))

(assert (=> b!436234 (= res!257116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436235 () Bool)

(declare-fun res!257130 () Bool)

(assert (=> b!436235 (=> (not res!257130) (not e!257629))))

(assert (=> b!436235 (= res!257130 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7637))))

(declare-fun b!436236 () Bool)

(assert (=> b!436236 (= e!257630 (not e!257628))))

(declare-fun res!257120 () Bool)

(assert (=> b!436236 (=> res!257120 e!257628)))

(assert (=> b!436236 (= res!257120 (not (validKeyInArray!0 (select (arr!12805 _keys!709) from!863))))))

(declare-fun lt!201052 () ListLongMap!6551)

(assert (=> b!436236 (= lt!201052 lt!201055)))

(assert (=> b!436236 (= lt!201055 (+!1439 lt!201063 lt!201061))))

(assert (=> b!436236 (= lt!201052 (getCurrentListMapNoExtraKeys!1481 lt!201062 lt!201060 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!436236 (= lt!201061 (tuple2!7639 k!794 v!412))))

(assert (=> b!436236 (= lt!201063 (getCurrentListMapNoExtraKeys!1481 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!201054 () Unit!12969)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!610 (array!26711 array!26713 (_ BitVec 32) (_ BitVec 32) V!16363 V!16363 (_ BitVec 32) (_ BitVec 64) V!16363 (_ BitVec 32) Int) Unit!12969)

(assert (=> b!436236 (= lt!201054 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!610 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18786 () Bool)

(declare-fun mapRes!18786 () Bool)

(declare-fun tp!36401 () Bool)

(assert (=> mapNonEmpty!18786 (= mapRes!18786 (and tp!36401 e!257626))))

(declare-fun mapKey!18786 () (_ BitVec 32))

(declare-fun mapValue!18786 () ValueCell!5378)

(declare-fun mapRest!18786 () (Array (_ BitVec 32) ValueCell!5378))

(assert (=> mapNonEmpty!18786 (= (arr!12806 _values!549) (store mapRest!18786 mapKey!18786 mapValue!18786))))

(declare-fun b!436237 () Bool)

(declare-fun Unit!12971 () Unit!12969)

(assert (=> b!436237 (= e!257623 Unit!12971)))

(declare-fun b!436238 () Bool)

(declare-fun e!257622 () Bool)

(assert (=> b!436238 (= e!257622 (and e!257624 mapRes!18786))))

(declare-fun condMapEmpty!18786 () Bool)

(declare-fun mapDefault!18786 () ValueCell!5378)

