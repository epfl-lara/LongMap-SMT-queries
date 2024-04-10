; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39960 () Bool)

(assert start!39960)

(declare-fun b_free!10227 () Bool)

(declare-fun b_next!10227 () Bool)

(assert (=> start!39960 (= b_free!10227 (not b_next!10227))))

(declare-fun tp!36209 () Bool)

(declare-fun b_and!18113 () Bool)

(assert (=> start!39960 (= tp!36209 b_and!18113)))

(declare-fun b!434238 () Bool)

(declare-fun e!256666 () Bool)

(declare-fun e!256667 () Bool)

(declare-fun mapRes!18690 () Bool)

(assert (=> b!434238 (= e!256666 (and e!256667 mapRes!18690))))

(declare-fun condMapEmpty!18690 () Bool)

(declare-datatypes ((V!16277 0))(
  ( (V!16278 (val!5734 Int)) )
))
(declare-datatypes ((ValueCell!5346 0))(
  ( (ValueCellFull!5346 (v!7981 V!16277)) (EmptyCell!5346) )
))
(declare-datatypes ((array!26591 0))(
  ( (array!26592 (arr!12745 (Array (_ BitVec 32) ValueCell!5346)) (size!13097 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26591)

(declare-fun mapDefault!18690 () ValueCell!5346)

(assert (=> b!434238 (= condMapEmpty!18690 (= (arr!12745 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5346)) mapDefault!18690)))))

(declare-fun b!434239 () Bool)

(declare-fun res!255678 () Bool)

(declare-fun e!256662 () Bool)

(assert (=> b!434239 (=> (not res!255678) (not e!256662))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!434239 (= res!255678 (bvsle from!863 i!563))))

(declare-fun b!434240 () Bool)

(declare-fun e!256663 () Bool)

(assert (=> b!434240 (= e!256663 true)))

(declare-datatypes ((tuple2!7586 0))(
  ( (tuple2!7587 (_1!3804 (_ BitVec 64)) (_2!3804 V!16277)) )
))
(declare-fun lt!199622 () tuple2!7586)

(declare-datatypes ((List!7590 0))(
  ( (Nil!7587) (Cons!7586 (h!8442 tuple2!7586) (t!13266 List!7590)) )
))
(declare-datatypes ((ListLongMap!6499 0))(
  ( (ListLongMap!6500 (toList!3265 List!7590)) )
))
(declare-fun lt!199612 () ListLongMap!6499)

(declare-fun lt!199613 () tuple2!7586)

(declare-fun lt!199625 () ListLongMap!6499)

(declare-fun +!1413 (ListLongMap!6499 tuple2!7586) ListLongMap!6499)

(assert (=> b!434240 (= lt!199625 (+!1413 (+!1413 lt!199612 lt!199613) lt!199622))))

(declare-fun lt!199619 () V!16277)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12873 0))(
  ( (Unit!12874) )
))
(declare-fun lt!199620 () Unit!12873)

(declare-fun v!412 () V!16277)

(declare-datatypes ((array!26593 0))(
  ( (array!26594 (arr!12746 (Array (_ BitVec 32) (_ BitVec 64))) (size!13098 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26593)

(declare-fun addCommutativeForDiffKeys!399 (ListLongMap!6499 (_ BitVec 64) V!16277 (_ BitVec 64) V!16277) Unit!12873)

(assert (=> b!434240 (= lt!199620 (addCommutativeForDiffKeys!399 lt!199612 k0!794 v!412 (select (arr!12746 _keys!709) from!863) lt!199619))))

(declare-fun b!434241 () Bool)

(declare-fun res!255685 () Bool)

(declare-fun e!256664 () Bool)

(assert (=> b!434241 (=> (not res!255685) (not e!256664))))

(declare-datatypes ((List!7591 0))(
  ( (Nil!7588) (Cons!7587 (h!8443 (_ BitVec 64)) (t!13267 List!7591)) )
))
(declare-fun arrayNoDuplicates!0 (array!26593 (_ BitVec 32) List!7591) Bool)

(assert (=> b!434241 (= res!255685 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7588))))

(declare-fun b!434242 () Bool)

(declare-fun res!255686 () Bool)

(assert (=> b!434242 (=> (not res!255686) (not e!256664))))

(assert (=> b!434242 (= res!255686 (or (= (select (arr!12746 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12746 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434243 () Bool)

(declare-fun res!255679 () Bool)

(assert (=> b!434243 (=> (not res!255679) (not e!256664))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26593 (_ BitVec 32)) Bool)

(assert (=> b!434243 (= res!255679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434244 () Bool)

(declare-fun res!255687 () Bool)

(assert (=> b!434244 (=> (not res!255687) (not e!256664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434244 (= res!255687 (validMask!0 mask!1025))))

(declare-fun b!434245 () Bool)

(declare-fun e!256665 () Bool)

(assert (=> b!434245 (= e!256662 e!256665)))

(declare-fun res!255677 () Bool)

(assert (=> b!434245 (=> (not res!255677) (not e!256665))))

(assert (=> b!434245 (= res!255677 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16277)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!199616 () ListLongMap!6499)

(declare-fun zeroValue!515 () V!16277)

(declare-fun lt!199618 () array!26593)

(declare-fun lt!199615 () array!26591)

(declare-fun getCurrentListMapNoExtraKeys!1458 (array!26593 array!26591 (_ BitVec 32) (_ BitVec 32) V!16277 V!16277 (_ BitVec 32) Int) ListLongMap!6499)

(assert (=> b!434245 (= lt!199616 (getCurrentListMapNoExtraKeys!1458 lt!199618 lt!199615 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!434245 (= lt!199615 (array!26592 (store (arr!12745 _values!549) i!563 (ValueCellFull!5346 v!412)) (size!13097 _values!549)))))

(declare-fun lt!199611 () ListLongMap!6499)

(assert (=> b!434245 (= lt!199611 (getCurrentListMapNoExtraKeys!1458 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18690 () Bool)

(declare-fun tp!36210 () Bool)

(declare-fun e!256669 () Bool)

(assert (=> mapNonEmpty!18690 (= mapRes!18690 (and tp!36210 e!256669))))

(declare-fun mapRest!18690 () (Array (_ BitVec 32) ValueCell!5346))

(declare-fun mapKey!18690 () (_ BitVec 32))

(declare-fun mapValue!18690 () ValueCell!5346)

(assert (=> mapNonEmpty!18690 (= (arr!12745 _values!549) (store mapRest!18690 mapKey!18690 mapValue!18690))))

(declare-fun b!434246 () Bool)

(declare-fun e!256670 () Unit!12873)

(declare-fun Unit!12875 () Unit!12873)

(assert (=> b!434246 (= e!256670 Unit!12875)))

(declare-fun res!255684 () Bool)

(assert (=> start!39960 (=> (not res!255684) (not e!256664))))

(assert (=> start!39960 (= res!255684 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13098 _keys!709))))))

(assert (=> start!39960 e!256664))

(declare-fun tp_is_empty!11379 () Bool)

(assert (=> start!39960 tp_is_empty!11379))

(assert (=> start!39960 tp!36209))

(assert (=> start!39960 true))

(declare-fun array_inv!9272 (array!26591) Bool)

(assert (=> start!39960 (and (array_inv!9272 _values!549) e!256666)))

(declare-fun array_inv!9273 (array!26593) Bool)

(assert (=> start!39960 (array_inv!9273 _keys!709)))

(declare-fun b!434247 () Bool)

(declare-fun res!255681 () Bool)

(assert (=> b!434247 (=> (not res!255681) (not e!256664))))

(assert (=> b!434247 (= res!255681 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13098 _keys!709))))))

(declare-fun b!434248 () Bool)

(declare-fun res!255689 () Bool)

(assert (=> b!434248 (=> (not res!255689) (not e!256664))))

(assert (=> b!434248 (= res!255689 (and (= (size!13097 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13098 _keys!709) (size!13097 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!434249 () Bool)

(declare-fun e!256671 () Bool)

(assert (=> b!434249 (= e!256671 e!256663)))

(declare-fun res!255682 () Bool)

(assert (=> b!434249 (=> res!255682 e!256663)))

(assert (=> b!434249 (= res!255682 (= k0!794 (select (arr!12746 _keys!709) from!863)))))

(assert (=> b!434249 (not (= (select (arr!12746 _keys!709) from!863) k0!794))))

(declare-fun lt!199621 () Unit!12873)

(assert (=> b!434249 (= lt!199621 e!256670)))

(declare-fun c!55676 () Bool)

(assert (=> b!434249 (= c!55676 (= (select (arr!12746 _keys!709) from!863) k0!794))))

(assert (=> b!434249 (= lt!199616 lt!199625)))

(declare-fun lt!199614 () ListLongMap!6499)

(assert (=> b!434249 (= lt!199625 (+!1413 lt!199614 lt!199613))))

(assert (=> b!434249 (= lt!199613 (tuple2!7587 (select (arr!12746 _keys!709) from!863) lt!199619))))

(declare-fun get!6347 (ValueCell!5346 V!16277) V!16277)

(declare-fun dynLambda!824 (Int (_ BitVec 64)) V!16277)

(assert (=> b!434249 (= lt!199619 (get!6347 (select (arr!12745 _values!549) from!863) (dynLambda!824 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434250 () Bool)

(declare-fun res!255676 () Bool)

(assert (=> b!434250 (=> (not res!255676) (not e!256662))))

(assert (=> b!434250 (= res!255676 (arrayNoDuplicates!0 lt!199618 #b00000000000000000000000000000000 Nil!7588))))

(declare-fun b!434251 () Bool)

(declare-fun res!255683 () Bool)

(assert (=> b!434251 (=> (not res!255683) (not e!256664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434251 (= res!255683 (validKeyInArray!0 k0!794))))

(declare-fun b!434252 () Bool)

(assert (=> b!434252 (= e!256665 (not e!256671))))

(declare-fun res!255680 () Bool)

(assert (=> b!434252 (=> res!255680 e!256671)))

(assert (=> b!434252 (= res!255680 (not (validKeyInArray!0 (select (arr!12746 _keys!709) from!863))))))

(declare-fun lt!199623 () ListLongMap!6499)

(assert (=> b!434252 (= lt!199623 lt!199614)))

(assert (=> b!434252 (= lt!199614 (+!1413 lt!199612 lt!199622))))

(assert (=> b!434252 (= lt!199623 (getCurrentListMapNoExtraKeys!1458 lt!199618 lt!199615 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!434252 (= lt!199622 (tuple2!7587 k0!794 v!412))))

(assert (=> b!434252 (= lt!199612 (getCurrentListMapNoExtraKeys!1458 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199624 () Unit!12873)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!589 (array!26593 array!26591 (_ BitVec 32) (_ BitVec 32) V!16277 V!16277 (_ BitVec 32) (_ BitVec 64) V!16277 (_ BitVec 32) Int) Unit!12873)

(assert (=> b!434252 (= lt!199624 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!589 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!434253 () Bool)

(assert (=> b!434253 (= e!256664 e!256662)))

(declare-fun res!255688 () Bool)

(assert (=> b!434253 (=> (not res!255688) (not e!256662))))

(assert (=> b!434253 (= res!255688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199618 mask!1025))))

(assert (=> b!434253 (= lt!199618 (array!26594 (store (arr!12746 _keys!709) i!563 k0!794) (size!13098 _keys!709)))))

(declare-fun b!434254 () Bool)

(assert (=> b!434254 (= e!256669 tp_is_empty!11379)))

(declare-fun b!434255 () Bool)

(declare-fun Unit!12876 () Unit!12873)

(assert (=> b!434255 (= e!256670 Unit!12876)))

(declare-fun lt!199617 () Unit!12873)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26593 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12873)

(assert (=> b!434255 (= lt!199617 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434255 false))

(declare-fun mapIsEmpty!18690 () Bool)

(assert (=> mapIsEmpty!18690 mapRes!18690))

(declare-fun b!434256 () Bool)

(declare-fun res!255690 () Bool)

(assert (=> b!434256 (=> (not res!255690) (not e!256664))))

(declare-fun arrayContainsKey!0 (array!26593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434256 (= res!255690 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!434257 () Bool)

(assert (=> b!434257 (= e!256667 tp_is_empty!11379)))

(assert (= (and start!39960 res!255684) b!434244))

(assert (= (and b!434244 res!255687) b!434248))

(assert (= (and b!434248 res!255689) b!434243))

(assert (= (and b!434243 res!255679) b!434241))

(assert (= (and b!434241 res!255685) b!434247))

(assert (= (and b!434247 res!255681) b!434251))

(assert (= (and b!434251 res!255683) b!434242))

(assert (= (and b!434242 res!255686) b!434256))

(assert (= (and b!434256 res!255690) b!434253))

(assert (= (and b!434253 res!255688) b!434250))

(assert (= (and b!434250 res!255676) b!434239))

(assert (= (and b!434239 res!255678) b!434245))

(assert (= (and b!434245 res!255677) b!434252))

(assert (= (and b!434252 (not res!255680)) b!434249))

(assert (= (and b!434249 c!55676) b!434255))

(assert (= (and b!434249 (not c!55676)) b!434246))

(assert (= (and b!434249 (not res!255682)) b!434240))

(assert (= (and b!434238 condMapEmpty!18690) mapIsEmpty!18690))

(assert (= (and b!434238 (not condMapEmpty!18690)) mapNonEmpty!18690))

(get-info :version)

(assert (= (and mapNonEmpty!18690 ((_ is ValueCellFull!5346) mapValue!18690)) b!434254))

(assert (= (and b!434238 ((_ is ValueCellFull!5346) mapDefault!18690)) b!434257))

(assert (= start!39960 b!434238))

(declare-fun b_lambda!9315 () Bool)

(assert (=> (not b_lambda!9315) (not b!434249)))

(declare-fun t!13265 () Bool)

(declare-fun tb!3633 () Bool)

(assert (=> (and start!39960 (= defaultEntry!557 defaultEntry!557) t!13265) tb!3633))

(declare-fun result!6793 () Bool)

(assert (=> tb!3633 (= result!6793 tp_is_empty!11379)))

(assert (=> b!434249 t!13265))

(declare-fun b_and!18115 () Bool)

(assert (= b_and!18113 (and (=> t!13265 result!6793) b_and!18115)))

(declare-fun m!422203 () Bool)

(assert (=> b!434244 m!422203))

(declare-fun m!422205 () Bool)

(assert (=> b!434251 m!422205))

(declare-fun m!422207 () Bool)

(assert (=> b!434256 m!422207))

(declare-fun m!422209 () Bool)

(assert (=> b!434243 m!422209))

(declare-fun m!422211 () Bool)

(assert (=> b!434255 m!422211))

(declare-fun m!422213 () Bool)

(assert (=> b!434250 m!422213))

(declare-fun m!422215 () Bool)

(assert (=> b!434245 m!422215))

(declare-fun m!422217 () Bool)

(assert (=> b!434245 m!422217))

(declare-fun m!422219 () Bool)

(assert (=> b!434245 m!422219))

(declare-fun m!422221 () Bool)

(assert (=> b!434249 m!422221))

(declare-fun m!422223 () Bool)

(assert (=> b!434249 m!422223))

(declare-fun m!422225 () Bool)

(assert (=> b!434249 m!422225))

(declare-fun m!422227 () Bool)

(assert (=> b!434249 m!422227))

(assert (=> b!434249 m!422227))

(assert (=> b!434249 m!422225))

(declare-fun m!422229 () Bool)

(assert (=> b!434249 m!422229))

(declare-fun m!422231 () Bool)

(assert (=> b!434241 m!422231))

(assert (=> b!434252 m!422221))

(declare-fun m!422233 () Bool)

(assert (=> b!434252 m!422233))

(declare-fun m!422235 () Bool)

(assert (=> b!434252 m!422235))

(assert (=> b!434252 m!422221))

(declare-fun m!422237 () Bool)

(assert (=> b!434252 m!422237))

(declare-fun m!422239 () Bool)

(assert (=> b!434252 m!422239))

(declare-fun m!422241 () Bool)

(assert (=> b!434252 m!422241))

(declare-fun m!422243 () Bool)

(assert (=> start!39960 m!422243))

(declare-fun m!422245 () Bool)

(assert (=> start!39960 m!422245))

(declare-fun m!422247 () Bool)

(assert (=> b!434242 m!422247))

(declare-fun m!422249 () Bool)

(assert (=> b!434253 m!422249))

(declare-fun m!422251 () Bool)

(assert (=> b!434253 m!422251))

(declare-fun m!422253 () Bool)

(assert (=> mapNonEmpty!18690 m!422253))

(declare-fun m!422255 () Bool)

(assert (=> b!434240 m!422255))

(assert (=> b!434240 m!422255))

(declare-fun m!422257 () Bool)

(assert (=> b!434240 m!422257))

(assert (=> b!434240 m!422221))

(assert (=> b!434240 m!422221))

(declare-fun m!422259 () Bool)

(assert (=> b!434240 m!422259))

(check-sat (not b!434240) (not mapNonEmpty!18690) (not b!434255) (not b!434244) (not b!434256) b_and!18115 (not b!434249) (not start!39960) (not b!434241) (not b!434251) (not b!434252) (not b_next!10227) (not b!434243) (not b!434250) tp_is_empty!11379 (not b!434245) (not b!434253) (not b_lambda!9315))
(check-sat b_and!18115 (not b_next!10227))
