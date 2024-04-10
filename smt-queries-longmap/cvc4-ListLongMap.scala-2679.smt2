; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39896 () Bool)

(assert start!39896)

(declare-fun b_free!10163 () Bool)

(declare-fun b_next!10163 () Bool)

(assert (=> start!39896 (= b_free!10163 (not b_next!10163))))

(declare-fun tp!36018 () Bool)

(declare-fun b_and!17985 () Bool)

(assert (=> start!39896 (= tp!36018 b_and!17985)))

(declare-fun b!432254 () Bool)

(declare-fun res!254243 () Bool)

(declare-fun e!255710 () Bool)

(assert (=> b!432254 (=> (not res!254243) (not e!255710))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26463 0))(
  ( (array!26464 (arr!12681 (Array (_ BitVec 32) (_ BitVec 64))) (size!13033 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26463)

(assert (=> b!432254 (= res!254243 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13033 _keys!709))))))

(declare-fun b!432255 () Bool)

(declare-fun res!254238 () Bool)

(declare-fun e!255708 () Bool)

(assert (=> b!432255 (=> (not res!254238) (not e!255708))))

(declare-fun lt!198183 () array!26463)

(declare-datatypes ((List!7539 0))(
  ( (Nil!7536) (Cons!7535 (h!8391 (_ BitVec 64)) (t!13151 List!7539)) )
))
(declare-fun arrayNoDuplicates!0 (array!26463 (_ BitVec 32) List!7539) Bool)

(assert (=> b!432255 (= res!254238 (arrayNoDuplicates!0 lt!198183 #b00000000000000000000000000000000 Nil!7536))))

(declare-fun b!432256 () Bool)

(declare-fun res!254242 () Bool)

(assert (=> b!432256 (=> (not res!254242) (not e!255710))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432256 (= res!254242 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18594 () Bool)

(declare-fun mapRes!18594 () Bool)

(declare-fun tp!36017 () Bool)

(declare-fun e!255706 () Bool)

(assert (=> mapNonEmpty!18594 (= mapRes!18594 (and tp!36017 e!255706))))

(declare-datatypes ((V!16191 0))(
  ( (V!16192 (val!5702 Int)) )
))
(declare-datatypes ((ValueCell!5314 0))(
  ( (ValueCellFull!5314 (v!7949 V!16191)) (EmptyCell!5314) )
))
(declare-fun mapValue!18594 () ValueCell!5314)

(declare-datatypes ((array!26465 0))(
  ( (array!26466 (arr!12682 (Array (_ BitVec 32) ValueCell!5314)) (size!13034 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26465)

(declare-fun mapRest!18594 () (Array (_ BitVec 32) ValueCell!5314))

(declare-fun mapKey!18594 () (_ BitVec 32))

(assert (=> mapNonEmpty!18594 (= (arr!12682 _values!549) (store mapRest!18594 mapKey!18594 mapValue!18594))))

(declare-fun b!432257 () Bool)

(declare-fun res!254240 () Bool)

(assert (=> b!432257 (=> (not res!254240) (not e!255710))))

(assert (=> b!432257 (= res!254240 (or (= (select (arr!12681 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12681 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432258 () Bool)

(declare-datatypes ((Unit!12763 0))(
  ( (Unit!12764) )
))
(declare-fun e!255702 () Unit!12763)

(declare-fun Unit!12765 () Unit!12763)

(assert (=> b!432258 (= e!255702 Unit!12765)))

(declare-fun lt!198172 () Unit!12763)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26463 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12763)

(assert (=> b!432258 (= lt!198172 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432258 false))

(declare-fun b!432260 () Bool)

(declare-fun e!255711 () Bool)

(assert (=> b!432260 (= e!255711 true)))

(declare-datatypes ((tuple2!7524 0))(
  ( (tuple2!7525 (_1!3773 (_ BitVec 64)) (_2!3773 V!16191)) )
))
(declare-datatypes ((List!7540 0))(
  ( (Nil!7537) (Cons!7536 (h!8392 tuple2!7524) (t!13152 List!7540)) )
))
(declare-datatypes ((ListLongMap!6437 0))(
  ( (ListLongMap!6438 (toList!3234 List!7540)) )
))
(declare-fun lt!198180 () ListLongMap!6437)

(declare-fun lt!198178 () tuple2!7524)

(declare-fun lt!198185 () ListLongMap!6437)

(declare-fun lt!198181 () tuple2!7524)

(declare-fun +!1382 (ListLongMap!6437 tuple2!7524) ListLongMap!6437)

(assert (=> b!432260 (= lt!198185 (+!1382 (+!1382 lt!198180 lt!198181) lt!198178))))

(declare-fun lt!198176 () V!16191)

(declare-fun v!412 () V!16191)

(declare-fun lt!198174 () Unit!12763)

(declare-fun addCommutativeForDiffKeys!372 (ListLongMap!6437 (_ BitVec 64) V!16191 (_ BitVec 64) V!16191) Unit!12763)

(assert (=> b!432260 (= lt!198174 (addCommutativeForDiffKeys!372 lt!198180 k!794 v!412 (select (arr!12681 _keys!709) from!863) lt!198176))))

(declare-fun b!432261 () Bool)

(declare-fun e!255703 () Bool)

(assert (=> b!432261 (= e!255708 e!255703)))

(declare-fun res!254236 () Bool)

(assert (=> b!432261 (=> (not res!254236) (not e!255703))))

(assert (=> b!432261 (= res!254236 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!198179 () ListLongMap!6437)

(declare-fun minValue!515 () V!16191)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!198177 () array!26465)

(declare-fun zeroValue!515 () V!16191)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1432 (array!26463 array!26465 (_ BitVec 32) (_ BitVec 32) V!16191 V!16191 (_ BitVec 32) Int) ListLongMap!6437)

(assert (=> b!432261 (= lt!198179 (getCurrentListMapNoExtraKeys!1432 lt!198183 lt!198177 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432261 (= lt!198177 (array!26466 (store (arr!12682 _values!549) i!563 (ValueCellFull!5314 v!412)) (size!13034 _values!549)))))

(declare-fun lt!198184 () ListLongMap!6437)

(assert (=> b!432261 (= lt!198184 (getCurrentListMapNoExtraKeys!1432 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432262 () Bool)

(declare-fun res!254244 () Bool)

(assert (=> b!432262 (=> (not res!254244) (not e!255708))))

(assert (=> b!432262 (= res!254244 (bvsle from!863 i!563))))

(declare-fun b!432263 () Bool)

(declare-fun e!255709 () Bool)

(declare-fun tp_is_empty!11315 () Bool)

(assert (=> b!432263 (= e!255709 tp_is_empty!11315)))

(declare-fun b!432264 () Bool)

(declare-fun res!254249 () Bool)

(assert (=> b!432264 (=> (not res!254249) (not e!255710))))

(assert (=> b!432264 (= res!254249 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7536))))

(declare-fun b!432265 () Bool)

(declare-fun res!254245 () Bool)

(assert (=> b!432265 (=> (not res!254245) (not e!255710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432265 (= res!254245 (validKeyInArray!0 k!794))))

(declare-fun b!432266 () Bool)

(declare-fun e!255705 () Bool)

(assert (=> b!432266 (= e!255705 (and e!255709 mapRes!18594))))

(declare-fun condMapEmpty!18594 () Bool)

(declare-fun mapDefault!18594 () ValueCell!5314)

