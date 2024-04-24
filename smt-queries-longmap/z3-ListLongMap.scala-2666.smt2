; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39800 () Bool)

(assert start!39800)

(declare-fun b_free!10081 () Bool)

(declare-fun b_next!10081 () Bool)

(assert (=> start!39800 (= b_free!10081 (not b_next!10081))))

(declare-fun tp!35772 () Bool)

(declare-fun b_and!17835 () Bool)

(assert (=> start!39800 (= tp!35772 b_and!17835)))

(declare-fun mapIsEmpty!18471 () Bool)

(declare-fun mapRes!18471 () Bool)

(assert (=> mapIsEmpty!18471 mapRes!18471))

(declare-fun b!429679 () Bool)

(declare-datatypes ((Unit!12629 0))(
  ( (Unit!12630) )
))
(declare-fun e!254462 () Unit!12629)

(declare-fun Unit!12631 () Unit!12629)

(assert (=> b!429679 (= e!254462 Unit!12631)))

(declare-fun res!252404 () Bool)

(declare-fun e!254461 () Bool)

(assert (=> start!39800 (=> (not res!252404) (not e!254461))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26306 0))(
  ( (array!26307 (arr!12602 (Array (_ BitVec 32) (_ BitVec 64))) (size!12954 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26306)

(assert (=> start!39800 (= res!252404 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12954 _keys!709))))))

(assert (=> start!39800 e!254461))

(declare-fun tp_is_empty!11233 () Bool)

(assert (=> start!39800 tp_is_empty!11233))

(assert (=> start!39800 tp!35772))

(assert (=> start!39800 true))

(declare-datatypes ((V!16083 0))(
  ( (V!16084 (val!5661 Int)) )
))
(declare-datatypes ((ValueCell!5273 0))(
  ( (ValueCellFull!5273 (v!7909 V!16083)) (EmptyCell!5273) )
))
(declare-datatypes ((array!26308 0))(
  ( (array!26309 (arr!12603 (Array (_ BitVec 32) ValueCell!5273)) (size!12955 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26308)

(declare-fun e!254456 () Bool)

(declare-fun array_inv!9242 (array!26308) Bool)

(assert (=> start!39800 (and (array_inv!9242 _values!549) e!254456)))

(declare-fun array_inv!9243 (array!26306) Bool)

(assert (=> start!39800 (array_inv!9243 _keys!709)))

(declare-fun b!429680 () Bool)

(declare-fun res!252410 () Bool)

(assert (=> b!429680 (=> (not res!252410) (not e!254461))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429680 (= res!252410 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12954 _keys!709))))))

(declare-fun b!429681 () Bool)

(declare-fun res!252405 () Bool)

(assert (=> b!429681 (=> (not res!252405) (not e!254461))))

(declare-datatypes ((List!7356 0))(
  ( (Nil!7353) (Cons!7352 (h!8208 (_ BitVec 64)) (t!12878 List!7356)) )
))
(declare-fun arrayNoDuplicates!0 (array!26306 (_ BitVec 32) List!7356) Bool)

(assert (=> b!429681 (= res!252405 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7353))))

(declare-fun b!429682 () Bool)

(declare-fun res!252411 () Bool)

(assert (=> b!429682 (=> (not res!252411) (not e!254461))))

(assert (=> b!429682 (= res!252411 (or (= (select (arr!12602 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12602 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429683 () Bool)

(declare-fun Unit!12632 () Unit!12629)

(assert (=> b!429683 (= e!254462 Unit!12632)))

(declare-fun lt!196425 () Unit!12629)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26306 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12629)

(assert (=> b!429683 (= lt!196425 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429683 false))

(declare-fun b!429684 () Bool)

(declare-fun res!252413 () Bool)

(assert (=> b!429684 (=> (not res!252413) (not e!254461))))

(declare-fun arrayContainsKey!0 (array!26306 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429684 (= res!252413 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!429685 () Bool)

(declare-fun res!252414 () Bool)

(declare-fun e!254464 () Bool)

(assert (=> b!429685 (=> (not res!252414) (not e!254464))))

(declare-fun lt!196431 () array!26306)

(assert (=> b!429685 (= res!252414 (arrayNoDuplicates!0 lt!196431 #b00000000000000000000000000000000 Nil!7353))))

(declare-fun b!429686 () Bool)

(declare-fun res!252417 () Bool)

(assert (=> b!429686 (=> (not res!252417) (not e!254461))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26306 (_ BitVec 32)) Bool)

(assert (=> b!429686 (= res!252417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429687 () Bool)

(declare-fun e!254458 () Bool)

(assert (=> b!429687 (= e!254458 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!12954 _keys!709))))))

(assert (=> b!429687 (not (= (select (arr!12602 _keys!709) from!863) k0!794))))

(declare-fun lt!196433 () Unit!12629)

(assert (=> b!429687 (= lt!196433 e!254462)))

(declare-fun c!55434 () Bool)

(assert (=> b!429687 (= c!55434 (= (select (arr!12602 _keys!709) from!863) k0!794))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7356 0))(
  ( (tuple2!7357 (_1!3689 (_ BitVec 64)) (_2!3689 V!16083)) )
))
(declare-datatypes ((List!7357 0))(
  ( (Nil!7354) (Cons!7353 (h!8209 tuple2!7356) (t!12879 List!7357)) )
))
(declare-datatypes ((ListLongMap!6271 0))(
  ( (ListLongMap!6272 (toList!3151 List!7357)) )
))
(declare-fun lt!196426 () ListLongMap!6271)

(declare-fun lt!196428 () ListLongMap!6271)

(declare-fun +!1362 (ListLongMap!6271 tuple2!7356) ListLongMap!6271)

(declare-fun get!6257 (ValueCell!5273 V!16083) V!16083)

(declare-fun dynLambda!776 (Int (_ BitVec 64)) V!16083)

(assert (=> b!429687 (= lt!196426 (+!1362 lt!196428 (tuple2!7357 (select (arr!12602 _keys!709) from!863) (get!6257 (select (arr!12603 _values!549) from!863) (dynLambda!776 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!429688 () Bool)

(declare-fun e!254460 () Bool)

(assert (=> b!429688 (= e!254460 tp_is_empty!11233)))

(declare-fun b!429689 () Bool)

(declare-fun e!254463 () Bool)

(assert (=> b!429689 (= e!254464 e!254463)))

(declare-fun res!252407 () Bool)

(assert (=> b!429689 (=> (not res!252407) (not e!254463))))

(assert (=> b!429689 (= res!252407 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16083)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16083)

(declare-fun lt!196434 () array!26308)

(declare-fun getCurrentListMapNoExtraKeys!1395 (array!26306 array!26308 (_ BitVec 32) (_ BitVec 32) V!16083 V!16083 (_ BitVec 32) Int) ListLongMap!6271)

(assert (=> b!429689 (= lt!196426 (getCurrentListMapNoExtraKeys!1395 lt!196431 lt!196434 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16083)

(assert (=> b!429689 (= lt!196434 (array!26309 (store (arr!12603 _values!549) i!563 (ValueCellFull!5273 v!412)) (size!12955 _values!549)))))

(declare-fun lt!196430 () ListLongMap!6271)

(assert (=> b!429689 (= lt!196430 (getCurrentListMapNoExtraKeys!1395 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429690 () Bool)

(assert (=> b!429690 (= e!254463 (not e!254458))))

(declare-fun res!252409 () Bool)

(assert (=> b!429690 (=> res!252409 e!254458)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429690 (= res!252409 (not (validKeyInArray!0 (select (arr!12602 _keys!709) from!863))))))

(declare-fun lt!196427 () ListLongMap!6271)

(assert (=> b!429690 (= lt!196427 lt!196428)))

(declare-fun lt!196429 () ListLongMap!6271)

(assert (=> b!429690 (= lt!196428 (+!1362 lt!196429 (tuple2!7357 k0!794 v!412)))))

(assert (=> b!429690 (= lt!196427 (getCurrentListMapNoExtraKeys!1395 lt!196431 lt!196434 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!429690 (= lt!196429 (getCurrentListMapNoExtraKeys!1395 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196432 () Unit!12629)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!540 (array!26306 array!26308 (_ BitVec 32) (_ BitVec 32) V!16083 V!16083 (_ BitVec 32) (_ BitVec 64) V!16083 (_ BitVec 32) Int) Unit!12629)

(assert (=> b!429690 (= lt!196432 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!540 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429691 () Bool)

(assert (=> b!429691 (= e!254456 (and e!254460 mapRes!18471))))

(declare-fun condMapEmpty!18471 () Bool)

(declare-fun mapDefault!18471 () ValueCell!5273)

(assert (=> b!429691 (= condMapEmpty!18471 (= (arr!12603 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5273)) mapDefault!18471)))))

(declare-fun b!429692 () Bool)

(declare-fun res!252406 () Bool)

(assert (=> b!429692 (=> (not res!252406) (not e!254461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429692 (= res!252406 (validMask!0 mask!1025))))

(declare-fun b!429693 () Bool)

(declare-fun res!252415 () Bool)

(assert (=> b!429693 (=> (not res!252415) (not e!254464))))

(assert (=> b!429693 (= res!252415 (bvsle from!863 i!563))))

(declare-fun b!429694 () Bool)

(assert (=> b!429694 (= e!254461 e!254464)))

(declare-fun res!252408 () Bool)

(assert (=> b!429694 (=> (not res!252408) (not e!254464))))

(assert (=> b!429694 (= res!252408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196431 mask!1025))))

(assert (=> b!429694 (= lt!196431 (array!26307 (store (arr!12602 _keys!709) i!563 k0!794) (size!12954 _keys!709)))))

(declare-fun b!429695 () Bool)

(declare-fun res!252416 () Bool)

(assert (=> b!429695 (=> (not res!252416) (not e!254461))))

(assert (=> b!429695 (= res!252416 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!18471 () Bool)

(declare-fun tp!35771 () Bool)

(declare-fun e!254457 () Bool)

(assert (=> mapNonEmpty!18471 (= mapRes!18471 (and tp!35771 e!254457))))

(declare-fun mapRest!18471 () (Array (_ BitVec 32) ValueCell!5273))

(declare-fun mapValue!18471 () ValueCell!5273)

(declare-fun mapKey!18471 () (_ BitVec 32))

(assert (=> mapNonEmpty!18471 (= (arr!12603 _values!549) (store mapRest!18471 mapKey!18471 mapValue!18471))))

(declare-fun b!429696 () Bool)

(declare-fun res!252412 () Bool)

(assert (=> b!429696 (=> (not res!252412) (not e!254461))))

(assert (=> b!429696 (= res!252412 (and (= (size!12955 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12954 _keys!709) (size!12955 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429697 () Bool)

(assert (=> b!429697 (= e!254457 tp_is_empty!11233)))

(assert (= (and start!39800 res!252404) b!429692))

(assert (= (and b!429692 res!252406) b!429696))

(assert (= (and b!429696 res!252412) b!429686))

(assert (= (and b!429686 res!252417) b!429681))

(assert (= (and b!429681 res!252405) b!429680))

(assert (= (and b!429680 res!252410) b!429695))

(assert (= (and b!429695 res!252416) b!429682))

(assert (= (and b!429682 res!252411) b!429684))

(assert (= (and b!429684 res!252413) b!429694))

(assert (= (and b!429694 res!252408) b!429685))

(assert (= (and b!429685 res!252414) b!429693))

(assert (= (and b!429693 res!252415) b!429689))

(assert (= (and b!429689 res!252407) b!429690))

(assert (= (and b!429690 (not res!252409)) b!429687))

(assert (= (and b!429687 c!55434) b!429683))

(assert (= (and b!429687 (not c!55434)) b!429679))

(assert (= (and b!429691 condMapEmpty!18471) mapIsEmpty!18471))

(assert (= (and b!429691 (not condMapEmpty!18471)) mapNonEmpty!18471))

(get-info :version)

(assert (= (and mapNonEmpty!18471 ((_ is ValueCellFull!5273) mapValue!18471)) b!429697))

(assert (= (and b!429691 ((_ is ValueCellFull!5273) mapDefault!18471)) b!429688))

(assert (= start!39800 b!429691))

(declare-fun b_lambda!9191 () Bool)

(assert (=> (not b_lambda!9191) (not b!429687)))

(declare-fun t!12877 () Bool)

(declare-fun tb!3479 () Bool)

(assert (=> (and start!39800 (= defaultEntry!557 defaultEntry!557) t!12877) tb!3479))

(declare-fun result!6493 () Bool)

(assert (=> tb!3479 (= result!6493 tp_is_empty!11233)))

(assert (=> b!429687 t!12877))

(declare-fun b_and!17837 () Bool)

(assert (= b_and!17835 (and (=> t!12877 result!6493) b_and!17837)))

(declare-fun m!418223 () Bool)

(assert (=> b!429692 m!418223))

(declare-fun m!418225 () Bool)

(assert (=> b!429694 m!418225))

(declare-fun m!418227 () Bool)

(assert (=> b!429694 m!418227))

(declare-fun m!418229 () Bool)

(assert (=> b!429681 m!418229))

(declare-fun m!418231 () Bool)

(assert (=> start!39800 m!418231))

(declare-fun m!418233 () Bool)

(assert (=> start!39800 m!418233))

(declare-fun m!418235 () Bool)

(assert (=> b!429682 m!418235))

(declare-fun m!418237 () Bool)

(assert (=> b!429686 m!418237))

(declare-fun m!418239 () Bool)

(assert (=> b!429684 m!418239))

(declare-fun m!418241 () Bool)

(assert (=> b!429685 m!418241))

(declare-fun m!418243 () Bool)

(assert (=> b!429687 m!418243))

(declare-fun m!418245 () Bool)

(assert (=> b!429687 m!418245))

(declare-fun m!418247 () Bool)

(assert (=> b!429687 m!418247))

(declare-fun m!418249 () Bool)

(assert (=> b!429687 m!418249))

(assert (=> b!429687 m!418249))

(assert (=> b!429687 m!418247))

(declare-fun m!418251 () Bool)

(assert (=> b!429687 m!418251))

(declare-fun m!418253 () Bool)

(assert (=> b!429689 m!418253))

(declare-fun m!418255 () Bool)

(assert (=> b!429689 m!418255))

(declare-fun m!418257 () Bool)

(assert (=> b!429689 m!418257))

(declare-fun m!418259 () Bool)

(assert (=> mapNonEmpty!18471 m!418259))

(declare-fun m!418261 () Bool)

(assert (=> b!429695 m!418261))

(declare-fun m!418263 () Bool)

(assert (=> b!429683 m!418263))

(assert (=> b!429690 m!418243))

(declare-fun m!418265 () Bool)

(assert (=> b!429690 m!418265))

(declare-fun m!418267 () Bool)

(assert (=> b!429690 m!418267))

(declare-fun m!418269 () Bool)

(assert (=> b!429690 m!418269))

(assert (=> b!429690 m!418243))

(declare-fun m!418271 () Bool)

(assert (=> b!429690 m!418271))

(declare-fun m!418273 () Bool)

(assert (=> b!429690 m!418273))

(check-sat (not b!429685) (not b!429686) (not b!429690) (not mapNonEmpty!18471) tp_is_empty!11233 (not b!429689) (not b!429681) (not b_next!10081) (not b_lambda!9191) (not start!39800) (not b!429695) (not b!429687) (not b!429692) (not b!429683) b_and!17837 (not b!429684) (not b!429694))
(check-sat b_and!17837 (not b_next!10081))
