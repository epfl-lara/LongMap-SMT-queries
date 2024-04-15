; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39806 () Bool)

(assert start!39806)

(declare-fun b_free!10087 () Bool)

(declare-fun b_next!10087 () Bool)

(assert (=> start!39806 (= b_free!10087 (not b_next!10087))))

(declare-fun tp!35789 () Bool)

(declare-fun b_and!17807 () Bool)

(assert (=> start!39806 (= tp!35789 b_and!17807)))

(declare-fun b!429634 () Bool)

(declare-fun res!252409 () Bool)

(declare-fun e!254399 () Bool)

(assert (=> b!429634 (=> (not res!252409) (not e!254399))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429634 (= res!252409 (validKeyInArray!0 k0!794))))

(declare-fun b!429635 () Bool)

(declare-fun e!254395 () Bool)

(declare-fun e!254398 () Bool)

(assert (=> b!429635 (= e!254395 (not e!254398))))

(declare-fun res!252411 () Bool)

(assert (=> b!429635 (=> res!252411 e!254398)))

(declare-datatypes ((array!26307 0))(
  ( (array!26308 (arr!12603 (Array (_ BitVec 32) (_ BitVec 64))) (size!12956 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26307)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!429635 (= res!252411 (not (validKeyInArray!0 (select (arr!12603 _keys!709) from!863))))))

(declare-datatypes ((V!16091 0))(
  ( (V!16092 (val!5664 Int)) )
))
(declare-datatypes ((tuple2!7466 0))(
  ( (tuple2!7467 (_1!3744 (_ BitVec 64)) (_2!3744 V!16091)) )
))
(declare-datatypes ((List!7464 0))(
  ( (Nil!7461) (Cons!7460 (h!8316 tuple2!7466) (t!12991 List!7464)) )
))
(declare-datatypes ((ListLongMap!6369 0))(
  ( (ListLongMap!6370 (toList!3200 List!7464)) )
))
(declare-fun lt!196262 () ListLongMap!6369)

(declare-fun lt!196265 () ListLongMap!6369)

(assert (=> b!429635 (= lt!196262 lt!196265)))

(declare-fun lt!196268 () ListLongMap!6369)

(declare-fun v!412 () V!16091)

(declare-fun +!1378 (ListLongMap!6369 tuple2!7466) ListLongMap!6369)

(assert (=> b!429635 (= lt!196265 (+!1378 lt!196268 (tuple2!7467 k0!794 v!412)))))

(declare-fun minValue!515 () V!16091)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5276 0))(
  ( (ValueCellFull!5276 (v!7905 V!16091)) (EmptyCell!5276) )
))
(declare-datatypes ((array!26309 0))(
  ( (array!26310 (arr!12604 (Array (_ BitVec 32) ValueCell!5276)) (size!12957 (_ BitVec 32))) )
))
(declare-fun lt!196269 () array!26309)

(declare-fun zeroValue!515 () V!16091)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!196271 () array!26307)

(declare-fun getCurrentListMapNoExtraKeys!1407 (array!26307 array!26309 (_ BitVec 32) (_ BitVec 32) V!16091 V!16091 (_ BitVec 32) Int) ListLongMap!6369)

(assert (=> b!429635 (= lt!196262 (getCurrentListMapNoExtraKeys!1407 lt!196271 lt!196269 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!26309)

(assert (=> b!429635 (= lt!196268 (getCurrentListMapNoExtraKeys!1407 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12630 0))(
  ( (Unit!12631) )
))
(declare-fun lt!196266 () Unit!12630)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!543 (array!26307 array!26309 (_ BitVec 32) (_ BitVec 32) V!16091 V!16091 (_ BitVec 32) (_ BitVec 64) V!16091 (_ BitVec 32) Int) Unit!12630)

(assert (=> b!429635 (= lt!196266 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!543 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429636 () Bool)

(declare-fun res!252412 () Bool)

(assert (=> b!429636 (=> (not res!252412) (not e!254399))))

(declare-datatypes ((List!7465 0))(
  ( (Nil!7462) (Cons!7461 (h!8317 (_ BitVec 64)) (t!12992 List!7465)) )
))
(declare-fun arrayNoDuplicates!0 (array!26307 (_ BitVec 32) List!7465) Bool)

(assert (=> b!429636 (= res!252412 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7462))))

(declare-fun b!429637 () Bool)

(assert (=> b!429637 (= e!254398 true)))

(assert (=> b!429637 (not (= (select (arr!12603 _keys!709) from!863) k0!794))))

(declare-fun lt!196270 () Unit!12630)

(declare-fun e!254397 () Unit!12630)

(assert (=> b!429637 (= lt!196270 e!254397)))

(declare-fun c!55395 () Bool)

(assert (=> b!429637 (= c!55395 (= (select (arr!12603 _keys!709) from!863) k0!794))))

(declare-fun lt!196264 () ListLongMap!6369)

(declare-fun get!6252 (ValueCell!5276 V!16091) V!16091)

(declare-fun dynLambda!772 (Int (_ BitVec 64)) V!16091)

(assert (=> b!429637 (= lt!196264 (+!1378 lt!196265 (tuple2!7467 (select (arr!12603 _keys!709) from!863) (get!6252 (select (arr!12604 _values!549) from!863) (dynLambda!772 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!429638 () Bool)

(declare-fun Unit!12632 () Unit!12630)

(assert (=> b!429638 (= e!254397 Unit!12632)))

(declare-fun lt!196263 () Unit!12630)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26307 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12630)

(assert (=> b!429638 (= lt!196263 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429638 false))

(declare-fun mapIsEmpty!18480 () Bool)

(declare-fun mapRes!18480 () Bool)

(assert (=> mapIsEmpty!18480 mapRes!18480))

(declare-fun b!429639 () Bool)

(declare-fun res!252405 () Bool)

(assert (=> b!429639 (=> (not res!252405) (not e!254399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429639 (= res!252405 (validMask!0 mask!1025))))

(declare-fun b!429640 () Bool)

(declare-fun e!254396 () Bool)

(declare-fun tp_is_empty!11239 () Bool)

(assert (=> b!429640 (= e!254396 tp_is_empty!11239)))

(declare-fun b!429641 () Bool)

(declare-fun Unit!12633 () Unit!12630)

(assert (=> b!429641 (= e!254397 Unit!12633)))

(declare-fun mapNonEmpty!18480 () Bool)

(declare-fun tp!35790 () Bool)

(declare-fun e!254400 () Bool)

(assert (=> mapNonEmpty!18480 (= mapRes!18480 (and tp!35790 e!254400))))

(declare-fun mapValue!18480 () ValueCell!5276)

(declare-fun mapKey!18480 () (_ BitVec 32))

(declare-fun mapRest!18480 () (Array (_ BitVec 32) ValueCell!5276))

(assert (=> mapNonEmpty!18480 (= (arr!12604 _values!549) (store mapRest!18480 mapKey!18480 mapValue!18480))))

(declare-fun b!429642 () Bool)

(declare-fun res!252414 () Bool)

(assert (=> b!429642 (=> (not res!252414) (not e!254399))))

(assert (=> b!429642 (= res!252414 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12956 _keys!709))))))

(declare-fun res!252416 () Bool)

(assert (=> start!39806 (=> (not res!252416) (not e!254399))))

(assert (=> start!39806 (= res!252416 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12956 _keys!709))))))

(assert (=> start!39806 e!254399))

(assert (=> start!39806 tp_is_empty!11239))

(assert (=> start!39806 tp!35789))

(assert (=> start!39806 true))

(declare-fun e!254401 () Bool)

(declare-fun array_inv!9212 (array!26309) Bool)

(assert (=> start!39806 (and (array_inv!9212 _values!549) e!254401)))

(declare-fun array_inv!9213 (array!26307) Bool)

(assert (=> start!39806 (array_inv!9213 _keys!709)))

(declare-fun b!429643 () Bool)

(declare-fun res!252410 () Bool)

(assert (=> b!429643 (=> (not res!252410) (not e!254399))))

(assert (=> b!429643 (= res!252410 (or (= (select (arr!12603 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12603 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429644 () Bool)

(assert (=> b!429644 (= e!254400 tp_is_empty!11239)))

(declare-fun b!429645 () Bool)

(declare-fun e!254402 () Bool)

(assert (=> b!429645 (= e!254399 e!254402)))

(declare-fun res!252406 () Bool)

(assert (=> b!429645 (=> (not res!252406) (not e!254402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26307 (_ BitVec 32)) Bool)

(assert (=> b!429645 (= res!252406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196271 mask!1025))))

(assert (=> b!429645 (= lt!196271 (array!26308 (store (arr!12603 _keys!709) i!563 k0!794) (size!12956 _keys!709)))))

(declare-fun b!429646 () Bool)

(declare-fun res!252407 () Bool)

(assert (=> b!429646 (=> (not res!252407) (not e!254399))))

(assert (=> b!429646 (= res!252407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429647 () Bool)

(declare-fun res!252408 () Bool)

(assert (=> b!429647 (=> (not res!252408) (not e!254402))))

(assert (=> b!429647 (= res!252408 (bvsle from!863 i!563))))

(declare-fun b!429648 () Bool)

(declare-fun res!252404 () Bool)

(assert (=> b!429648 (=> (not res!252404) (not e!254399))))

(assert (=> b!429648 (= res!252404 (and (= (size!12957 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12956 _keys!709) (size!12957 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429649 () Bool)

(assert (=> b!429649 (= e!254401 (and e!254396 mapRes!18480))))

(declare-fun condMapEmpty!18480 () Bool)

(declare-fun mapDefault!18480 () ValueCell!5276)

(assert (=> b!429649 (= condMapEmpty!18480 (= (arr!12604 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5276)) mapDefault!18480)))))

(declare-fun b!429650 () Bool)

(assert (=> b!429650 (= e!254402 e!254395)))

(declare-fun res!252413 () Bool)

(assert (=> b!429650 (=> (not res!252413) (not e!254395))))

(assert (=> b!429650 (= res!252413 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!429650 (= lt!196264 (getCurrentListMapNoExtraKeys!1407 lt!196271 lt!196269 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!429650 (= lt!196269 (array!26310 (store (arr!12604 _values!549) i!563 (ValueCellFull!5276 v!412)) (size!12957 _values!549)))))

(declare-fun lt!196267 () ListLongMap!6369)

(assert (=> b!429650 (= lt!196267 (getCurrentListMapNoExtraKeys!1407 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429651 () Bool)

(declare-fun res!252417 () Bool)

(assert (=> b!429651 (=> (not res!252417) (not e!254399))))

(declare-fun arrayContainsKey!0 (array!26307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429651 (= res!252417 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!429652 () Bool)

(declare-fun res!252415 () Bool)

(assert (=> b!429652 (=> (not res!252415) (not e!254402))))

(assert (=> b!429652 (= res!252415 (arrayNoDuplicates!0 lt!196271 #b00000000000000000000000000000000 Nil!7462))))

(assert (= (and start!39806 res!252416) b!429639))

(assert (= (and b!429639 res!252405) b!429648))

(assert (= (and b!429648 res!252404) b!429646))

(assert (= (and b!429646 res!252407) b!429636))

(assert (= (and b!429636 res!252412) b!429642))

(assert (= (and b!429642 res!252414) b!429634))

(assert (= (and b!429634 res!252409) b!429643))

(assert (= (and b!429643 res!252410) b!429651))

(assert (= (and b!429651 res!252417) b!429645))

(assert (= (and b!429645 res!252406) b!429652))

(assert (= (and b!429652 res!252415) b!429647))

(assert (= (and b!429647 res!252408) b!429650))

(assert (= (and b!429650 res!252413) b!429635))

(assert (= (and b!429635 (not res!252411)) b!429637))

(assert (= (and b!429637 c!55395) b!429638))

(assert (= (and b!429637 (not c!55395)) b!429641))

(assert (= (and b!429649 condMapEmpty!18480) mapIsEmpty!18480))

(assert (= (and b!429649 (not condMapEmpty!18480)) mapNonEmpty!18480))

(get-info :version)

(assert (= (and mapNonEmpty!18480 ((_ is ValueCellFull!5276) mapValue!18480)) b!429644))

(assert (= (and b!429649 ((_ is ValueCellFull!5276) mapDefault!18480)) b!429640))

(assert (= start!39806 b!429649))

(declare-fun b_lambda!9157 () Bool)

(assert (=> (not b_lambda!9157) (not b!429637)))

(declare-fun t!12990 () Bool)

(declare-fun tb!3485 () Bool)

(assert (=> (and start!39806 (= defaultEntry!557 defaultEntry!557) t!12990) tb!3485))

(declare-fun result!6505 () Bool)

(assert (=> tb!3485 (= result!6505 tp_is_empty!11239)))

(assert (=> b!429637 t!12990))

(declare-fun b_and!17809 () Bool)

(assert (= b_and!17807 (and (=> t!12990 result!6505) b_and!17809)))

(declare-fun m!417429 () Bool)

(assert (=> b!429651 m!417429))

(declare-fun m!417431 () Bool)

(assert (=> b!429643 m!417431))

(declare-fun m!417433 () Bool)

(assert (=> b!429635 m!417433))

(declare-fun m!417435 () Bool)

(assert (=> b!429635 m!417435))

(declare-fun m!417437 () Bool)

(assert (=> b!429635 m!417437))

(declare-fun m!417439 () Bool)

(assert (=> b!429635 m!417439))

(assert (=> b!429635 m!417433))

(declare-fun m!417441 () Bool)

(assert (=> b!429635 m!417441))

(declare-fun m!417443 () Bool)

(assert (=> b!429635 m!417443))

(assert (=> b!429637 m!417433))

(declare-fun m!417445 () Bool)

(assert (=> b!429637 m!417445))

(declare-fun m!417447 () Bool)

(assert (=> b!429637 m!417447))

(declare-fun m!417449 () Bool)

(assert (=> b!429637 m!417449))

(assert (=> b!429637 m!417449))

(assert (=> b!429637 m!417445))

(declare-fun m!417451 () Bool)

(assert (=> b!429637 m!417451))

(declare-fun m!417453 () Bool)

(assert (=> b!429634 m!417453))

(declare-fun m!417455 () Bool)

(assert (=> b!429639 m!417455))

(declare-fun m!417457 () Bool)

(assert (=> mapNonEmpty!18480 m!417457))

(declare-fun m!417459 () Bool)

(assert (=> b!429638 m!417459))

(declare-fun m!417461 () Bool)

(assert (=> b!429645 m!417461))

(declare-fun m!417463 () Bool)

(assert (=> b!429645 m!417463))

(declare-fun m!417465 () Bool)

(assert (=> b!429636 m!417465))

(declare-fun m!417467 () Bool)

(assert (=> b!429646 m!417467))

(declare-fun m!417469 () Bool)

(assert (=> start!39806 m!417469))

(declare-fun m!417471 () Bool)

(assert (=> start!39806 m!417471))

(declare-fun m!417473 () Bool)

(assert (=> b!429650 m!417473))

(declare-fun m!417475 () Bool)

(assert (=> b!429650 m!417475))

(declare-fun m!417477 () Bool)

(assert (=> b!429650 m!417477))

(declare-fun m!417479 () Bool)

(assert (=> b!429652 m!417479))

(check-sat (not b!429635) (not b!429638) b_and!17809 (not b!429652) (not b!429645) (not b!429639) (not b_lambda!9157) (not b_next!10087) (not b!429646) (not b!429637) (not b!429636) (not mapNonEmpty!18480) (not start!39806) (not b!429634) (not b!429650) tp_is_empty!11239 (not b!429651))
(check-sat b_and!17809 (not b_next!10087))
