; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39942 () Bool)

(assert start!39942)

(declare-fun b_free!10209 () Bool)

(declare-fun b_next!10209 () Bool)

(assert (=> start!39942 (= b_free!10209 (not b_next!10209))))

(declare-fun tp!36155 () Bool)

(declare-fun b_and!18077 () Bool)

(assert (=> start!39942 (= tp!36155 b_and!18077)))

(declare-fun b!433680 () Bool)

(declare-fun res!255272 () Bool)

(declare-fun e!256398 () Bool)

(assert (=> b!433680 (=> (not res!255272) (not e!256398))))

(declare-datatypes ((array!26555 0))(
  ( (array!26556 (arr!12727 (Array (_ BitVec 32) (_ BitVec 64))) (size!13079 (_ BitVec 32))) )
))
(declare-fun lt!199213 () array!26555)

(declare-datatypes ((List!7576 0))(
  ( (Nil!7573) (Cons!7572 (h!8428 (_ BitVec 64)) (t!13234 List!7576)) )
))
(declare-fun arrayNoDuplicates!0 (array!26555 (_ BitVec 32) List!7576) Bool)

(assert (=> b!433680 (= res!255272 (arrayNoDuplicates!0 lt!199213 #b00000000000000000000000000000000 Nil!7573))))

(declare-fun b!433681 () Bool)

(declare-fun res!255282 () Bool)

(declare-fun e!256401 () Bool)

(assert (=> b!433681 (=> (not res!255282) (not e!256401))))

(declare-fun _keys!709 () array!26555)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433681 (= res!255282 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!433682 () Bool)

(declare-fun res!255279 () Bool)

(assert (=> b!433682 (=> (not res!255279) (not e!256401))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16253 0))(
  ( (V!16254 (val!5725 Int)) )
))
(declare-datatypes ((ValueCell!5337 0))(
  ( (ValueCellFull!5337 (v!7972 V!16253)) (EmptyCell!5337) )
))
(declare-datatypes ((array!26557 0))(
  ( (array!26558 (arr!12728 (Array (_ BitVec 32) ValueCell!5337)) (size!13080 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26557)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!433682 (= res!255279 (and (= (size!13080 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13079 _keys!709) (size!13080 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433683 () Bool)

(declare-fun e!256397 () Bool)

(declare-fun tp_is_empty!11361 () Bool)

(assert (=> b!433683 (= e!256397 tp_is_empty!11361)))

(declare-fun b!433684 () Bool)

(declare-fun res!255278 () Bool)

(assert (=> b!433684 (=> (not res!255278) (not e!256398))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433684 (= res!255278 (bvsle from!863 i!563))))

(declare-fun b!433685 () Bool)

(declare-fun res!255284 () Bool)

(assert (=> b!433685 (=> (not res!255284) (not e!256401))))

(assert (=> b!433685 (= res!255284 (or (= (select (arr!12727 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12727 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433686 () Bool)

(declare-fun res!255276 () Bool)

(assert (=> b!433686 (=> (not res!255276) (not e!256401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433686 (= res!255276 (validKeyInArray!0 k0!794))))

(declare-fun b!433687 () Bool)

(declare-fun res!255274 () Bool)

(assert (=> b!433687 (=> (not res!255274) (not e!256401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26555 (_ BitVec 32)) Bool)

(assert (=> b!433687 (= res!255274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433688 () Bool)

(declare-fun e!256392 () Bool)

(declare-fun e!256393 () Bool)

(assert (=> b!433688 (= e!256392 (not e!256393))))

(declare-fun res!255275 () Bool)

(assert (=> b!433688 (=> res!255275 e!256393)))

(assert (=> b!433688 (= res!255275 (not (validKeyInArray!0 (select (arr!12727 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7568 0))(
  ( (tuple2!7569 (_1!3795 (_ BitVec 64)) (_2!3795 V!16253)) )
))
(declare-datatypes ((List!7577 0))(
  ( (Nil!7574) (Cons!7573 (h!8429 tuple2!7568) (t!13235 List!7577)) )
))
(declare-datatypes ((ListLongMap!6481 0))(
  ( (ListLongMap!6482 (toList!3256 List!7577)) )
))
(declare-fun lt!199216 () ListLongMap!6481)

(declare-fun lt!199218 () ListLongMap!6481)

(assert (=> b!433688 (= lt!199216 lt!199218)))

(declare-fun lt!199217 () ListLongMap!6481)

(declare-fun lt!199206 () tuple2!7568)

(declare-fun +!1404 (ListLongMap!6481 tuple2!7568) ListLongMap!6481)

(assert (=> b!433688 (= lt!199218 (+!1404 lt!199217 lt!199206))))

(declare-fun minValue!515 () V!16253)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16253)

(declare-fun lt!199219 () array!26557)

(declare-fun getCurrentListMapNoExtraKeys!1451 (array!26555 array!26557 (_ BitVec 32) (_ BitVec 32) V!16253 V!16253 (_ BitVec 32) Int) ListLongMap!6481)

(assert (=> b!433688 (= lt!199216 (getCurrentListMapNoExtraKeys!1451 lt!199213 lt!199219 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16253)

(assert (=> b!433688 (= lt!199206 (tuple2!7569 k0!794 v!412))))

(assert (=> b!433688 (= lt!199217 (getCurrentListMapNoExtraKeys!1451 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12843 0))(
  ( (Unit!12844) )
))
(declare-fun lt!199214 () Unit!12843)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!583 (array!26555 array!26557 (_ BitVec 32) (_ BitVec 32) V!16253 V!16253 (_ BitVec 32) (_ BitVec 64) V!16253 (_ BitVec 32) Int) Unit!12843)

(assert (=> b!433688 (= lt!199214 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!583 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433689 () Bool)

(declare-fun res!255285 () Bool)

(assert (=> b!433689 (=> (not res!255285) (not e!256401))))

(assert (=> b!433689 (= res!255285 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7573))))

(declare-fun b!433690 () Bool)

(declare-fun e!256399 () Bool)

(declare-fun mapRes!18663 () Bool)

(assert (=> b!433690 (= e!256399 (and e!256397 mapRes!18663))))

(declare-fun condMapEmpty!18663 () Bool)

(declare-fun mapDefault!18663 () ValueCell!5337)

(assert (=> b!433690 (= condMapEmpty!18663 (= (arr!12728 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5337)) mapDefault!18663)))))

(declare-fun b!433691 () Bool)

(assert (=> b!433691 (= e!256401 e!256398)))

(declare-fun res!255277 () Bool)

(assert (=> b!433691 (=> (not res!255277) (not e!256398))))

(assert (=> b!433691 (= res!255277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199213 mask!1025))))

(assert (=> b!433691 (= lt!199213 (array!26556 (store (arr!12727 _keys!709) i!563 k0!794) (size!13079 _keys!709)))))

(declare-fun mapNonEmpty!18663 () Bool)

(declare-fun tp!36156 () Bool)

(declare-fun e!256396 () Bool)

(assert (=> mapNonEmpty!18663 (= mapRes!18663 (and tp!36156 e!256396))))

(declare-fun mapKey!18663 () (_ BitVec 32))

(declare-fun mapValue!18663 () ValueCell!5337)

(declare-fun mapRest!18663 () (Array (_ BitVec 32) ValueCell!5337))

(assert (=> mapNonEmpty!18663 (= (arr!12728 _values!549) (store mapRest!18663 mapKey!18663 mapValue!18663))))

(declare-fun b!433692 () Bool)

(declare-fun e!256394 () Unit!12843)

(declare-fun Unit!12845 () Unit!12843)

(assert (=> b!433692 (= e!256394 Unit!12845)))

(declare-fun b!433693 () Bool)

(assert (=> b!433693 (= e!256396 tp_is_empty!11361)))

(declare-fun b!433694 () Bool)

(declare-fun Unit!12846 () Unit!12843)

(assert (=> b!433694 (= e!256394 Unit!12846)))

(declare-fun lt!199212 () Unit!12843)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26555 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12843)

(assert (=> b!433694 (= lt!199212 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433694 false))

(declare-fun b!433695 () Bool)

(declare-fun e!256400 () Bool)

(assert (=> b!433695 (= e!256400 true)))

(declare-fun lt!199207 () ListLongMap!6481)

(declare-fun lt!199209 () tuple2!7568)

(assert (=> b!433695 (= lt!199207 (+!1404 (+!1404 lt!199217 lt!199209) lt!199206))))

(declare-fun lt!199211 () V!16253)

(declare-fun lt!199215 () Unit!12843)

(declare-fun addCommutativeForDiffKeys!392 (ListLongMap!6481 (_ BitVec 64) V!16253 (_ BitVec 64) V!16253) Unit!12843)

(assert (=> b!433695 (= lt!199215 (addCommutativeForDiffKeys!392 lt!199217 k0!794 v!412 (select (arr!12727 _keys!709) from!863) lt!199211))))

(declare-fun mapIsEmpty!18663 () Bool)

(assert (=> mapIsEmpty!18663 mapRes!18663))

(declare-fun res!255271 () Bool)

(assert (=> start!39942 (=> (not res!255271) (not e!256401))))

(assert (=> start!39942 (= res!255271 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13079 _keys!709))))))

(assert (=> start!39942 e!256401))

(assert (=> start!39942 tp_is_empty!11361))

(assert (=> start!39942 tp!36155))

(assert (=> start!39942 true))

(declare-fun array_inv!9260 (array!26557) Bool)

(assert (=> start!39942 (and (array_inv!9260 _values!549) e!256399)))

(declare-fun array_inv!9261 (array!26555) Bool)

(assert (=> start!39942 (array_inv!9261 _keys!709)))

(declare-fun b!433696 () Bool)

(declare-fun res!255281 () Bool)

(assert (=> b!433696 (=> (not res!255281) (not e!256401))))

(assert (=> b!433696 (= res!255281 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13079 _keys!709))))))

(declare-fun b!433697 () Bool)

(assert (=> b!433697 (= e!256398 e!256392)))

(declare-fun res!255280 () Bool)

(assert (=> b!433697 (=> (not res!255280) (not e!256392))))

(assert (=> b!433697 (= res!255280 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!199220 () ListLongMap!6481)

(assert (=> b!433697 (= lt!199220 (getCurrentListMapNoExtraKeys!1451 lt!199213 lt!199219 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!433697 (= lt!199219 (array!26558 (store (arr!12728 _values!549) i!563 (ValueCellFull!5337 v!412)) (size!13080 _values!549)))))

(declare-fun lt!199208 () ListLongMap!6481)

(assert (=> b!433697 (= lt!199208 (getCurrentListMapNoExtraKeys!1451 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433698 () Bool)

(assert (=> b!433698 (= e!256393 e!256400)))

(declare-fun res!255273 () Bool)

(assert (=> b!433698 (=> res!255273 e!256400)))

(assert (=> b!433698 (= res!255273 (= k0!794 (select (arr!12727 _keys!709) from!863)))))

(assert (=> b!433698 (not (= (select (arr!12727 _keys!709) from!863) k0!794))))

(declare-fun lt!199210 () Unit!12843)

(assert (=> b!433698 (= lt!199210 e!256394)))

(declare-fun c!55649 () Bool)

(assert (=> b!433698 (= c!55649 (= (select (arr!12727 _keys!709) from!863) k0!794))))

(assert (=> b!433698 (= lt!199220 lt!199207)))

(assert (=> b!433698 (= lt!199207 (+!1404 lt!199218 lt!199209))))

(assert (=> b!433698 (= lt!199209 (tuple2!7569 (select (arr!12727 _keys!709) from!863) lt!199211))))

(declare-fun get!6333 (ValueCell!5337 V!16253) V!16253)

(declare-fun dynLambda!816 (Int (_ BitVec 64)) V!16253)

(assert (=> b!433698 (= lt!199211 (get!6333 (select (arr!12728 _values!549) from!863) (dynLambda!816 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433699 () Bool)

(declare-fun res!255283 () Bool)

(assert (=> b!433699 (=> (not res!255283) (not e!256401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433699 (= res!255283 (validMask!0 mask!1025))))

(assert (= (and start!39942 res!255271) b!433699))

(assert (= (and b!433699 res!255283) b!433682))

(assert (= (and b!433682 res!255279) b!433687))

(assert (= (and b!433687 res!255274) b!433689))

(assert (= (and b!433689 res!255285) b!433696))

(assert (= (and b!433696 res!255281) b!433686))

(assert (= (and b!433686 res!255276) b!433685))

(assert (= (and b!433685 res!255284) b!433681))

(assert (= (and b!433681 res!255282) b!433691))

(assert (= (and b!433691 res!255277) b!433680))

(assert (= (and b!433680 res!255272) b!433684))

(assert (= (and b!433684 res!255278) b!433697))

(assert (= (and b!433697 res!255280) b!433688))

(assert (= (and b!433688 (not res!255275)) b!433698))

(assert (= (and b!433698 c!55649) b!433694))

(assert (= (and b!433698 (not c!55649)) b!433692))

(assert (= (and b!433698 (not res!255273)) b!433695))

(assert (= (and b!433690 condMapEmpty!18663) mapIsEmpty!18663))

(assert (= (and b!433690 (not condMapEmpty!18663)) mapNonEmpty!18663))

(get-info :version)

(assert (= (and mapNonEmpty!18663 ((_ is ValueCellFull!5337) mapValue!18663)) b!433693))

(assert (= (and b!433690 ((_ is ValueCellFull!5337) mapDefault!18663)) b!433683))

(assert (= start!39942 b!433690))

(declare-fun b_lambda!9297 () Bool)

(assert (=> (not b_lambda!9297) (not b!433698)))

(declare-fun t!13233 () Bool)

(declare-fun tb!3615 () Bool)

(assert (=> (and start!39942 (= defaultEntry!557 defaultEntry!557) t!13233) tb!3615))

(declare-fun result!6757 () Bool)

(assert (=> tb!3615 (= result!6757 tp_is_empty!11361)))

(assert (=> b!433698 t!13233))

(declare-fun b_and!18079 () Bool)

(assert (= b_and!18077 (and (=> t!13233 result!6757) b_and!18079)))

(declare-fun m!421681 () Bool)

(assert (=> b!433699 m!421681))

(declare-fun m!421683 () Bool)

(assert (=> b!433685 m!421683))

(declare-fun m!421685 () Bool)

(assert (=> mapNonEmpty!18663 m!421685))

(declare-fun m!421687 () Bool)

(assert (=> b!433697 m!421687))

(declare-fun m!421689 () Bool)

(assert (=> b!433697 m!421689))

(declare-fun m!421691 () Bool)

(assert (=> b!433697 m!421691))

(declare-fun m!421693 () Bool)

(assert (=> b!433694 m!421693))

(declare-fun m!421695 () Bool)

(assert (=> b!433688 m!421695))

(declare-fun m!421697 () Bool)

(assert (=> b!433688 m!421697))

(declare-fun m!421699 () Bool)

(assert (=> b!433688 m!421699))

(declare-fun m!421701 () Bool)

(assert (=> b!433688 m!421701))

(assert (=> b!433688 m!421695))

(declare-fun m!421703 () Bool)

(assert (=> b!433688 m!421703))

(declare-fun m!421705 () Bool)

(assert (=> b!433688 m!421705))

(declare-fun m!421707 () Bool)

(assert (=> b!433689 m!421707))

(declare-fun m!421709 () Bool)

(assert (=> b!433687 m!421709))

(declare-fun m!421711 () Bool)

(assert (=> b!433695 m!421711))

(assert (=> b!433695 m!421711))

(declare-fun m!421713 () Bool)

(assert (=> b!433695 m!421713))

(assert (=> b!433695 m!421695))

(assert (=> b!433695 m!421695))

(declare-fun m!421715 () Bool)

(assert (=> b!433695 m!421715))

(declare-fun m!421717 () Bool)

(assert (=> start!39942 m!421717))

(declare-fun m!421719 () Bool)

(assert (=> start!39942 m!421719))

(declare-fun m!421721 () Bool)

(assert (=> b!433680 m!421721))

(declare-fun m!421723 () Bool)

(assert (=> b!433686 m!421723))

(declare-fun m!421725 () Bool)

(assert (=> b!433681 m!421725))

(assert (=> b!433698 m!421695))

(declare-fun m!421727 () Bool)

(assert (=> b!433698 m!421727))

(declare-fun m!421729 () Bool)

(assert (=> b!433698 m!421729))

(declare-fun m!421731 () Bool)

(assert (=> b!433698 m!421731))

(assert (=> b!433698 m!421731))

(assert (=> b!433698 m!421727))

(declare-fun m!421733 () Bool)

(assert (=> b!433698 m!421733))

(declare-fun m!421735 () Bool)

(assert (=> b!433691 m!421735))

(declare-fun m!421737 () Bool)

(assert (=> b!433691 m!421737))

(check-sat (not b!433694) (not b!433688) (not mapNonEmpty!18663) (not b!433681) tp_is_empty!11361 (not b!433695) b_and!18079 (not b!433697) (not b!433680) (not b!433686) (not b_lambda!9297) (not b!433699) (not b!433689) (not b!433691) (not b!433698) (not start!39942) (not b!433687) (not b_next!10209))
(check-sat b_and!18079 (not b_next!10209))
