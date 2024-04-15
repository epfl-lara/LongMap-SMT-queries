; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39314 () Bool)

(assert start!39314)

(declare-fun b_free!9595 () Bool)

(declare-fun b_next!9595 () Bool)

(assert (=> start!39314 (= b_free!9595 (not b_next!9595))))

(declare-fun tp!34314 () Bool)

(declare-fun b_and!17039 () Bool)

(assert (=> start!39314 (= tp!34314 b_and!17039)))

(declare-fun b!416569 () Bool)

(declare-fun e!248610 () Bool)

(declare-fun e!248616 () Bool)

(assert (=> b!416569 (= e!248610 e!248616)))

(declare-fun res!242550 () Bool)

(assert (=> b!416569 (=> (not res!242550) (not e!248616))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416569 (= res!242550 (= from!863 i!563))))

(declare-datatypes ((V!15435 0))(
  ( (V!15436 (val!5418 Int)) )
))
(declare-fun minValue!515 () V!15435)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!25337 0))(
  ( (array!25338 (arr!12118 (Array (_ BitVec 32) (_ BitVec 64))) (size!12471 (_ BitVec 32))) )
))
(declare-fun lt!190662 () array!25337)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7052 0))(
  ( (tuple2!7053 (_1!3537 (_ BitVec 64)) (_2!3537 V!15435)) )
))
(declare-datatypes ((List!7055 0))(
  ( (Nil!7052) (Cons!7051 (h!7907 tuple2!7052) (t!12306 List!7055)) )
))
(declare-datatypes ((ListLongMap!5955 0))(
  ( (ListLongMap!5956 (toList!2993 List!7055)) )
))
(declare-fun lt!190666 () ListLongMap!5955)

(declare-fun zeroValue!515 () V!15435)

(declare-datatypes ((ValueCell!5030 0))(
  ( (ValueCellFull!5030 (v!7659 V!15435)) (EmptyCell!5030) )
))
(declare-datatypes ((array!25339 0))(
  ( (array!25340 (arr!12119 (Array (_ BitVec 32) ValueCell!5030)) (size!12472 (_ BitVec 32))) )
))
(declare-fun lt!190657 () array!25339)

(declare-fun getCurrentListMapNoExtraKeys!1204 (array!25337 array!25339 (_ BitVec 32) (_ BitVec 32) V!15435 V!15435 (_ BitVec 32) Int) ListLongMap!5955)

(assert (=> b!416569 (= lt!190666 (getCurrentListMapNoExtraKeys!1204 lt!190662 lt!190657 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25339)

(declare-fun v!412 () V!15435)

(assert (=> b!416569 (= lt!190657 (array!25340 (store (arr!12119 _values!549) i!563 (ValueCellFull!5030 v!412)) (size!12472 _values!549)))))

(declare-fun lt!190664 () ListLongMap!5955)

(declare-fun _keys!709 () array!25337)

(assert (=> b!416569 (= lt!190664 (getCurrentListMapNoExtraKeys!1204 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416570 () Bool)

(declare-fun e!248611 () Bool)

(declare-fun call!28939 () ListLongMap!5955)

(declare-fun call!28938 () ListLongMap!5955)

(assert (=> b!416570 (= e!248611 (= call!28939 call!28938))))

(declare-fun b!416571 () Bool)

(declare-fun e!248613 () Bool)

(assert (=> b!416571 (= e!248616 (not e!248613))))

(declare-fun res!242551 () Bool)

(assert (=> b!416571 (=> res!242551 e!248613)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416571 (= res!242551 (validKeyInArray!0 (select (arr!12118 _keys!709) from!863)))))

(assert (=> b!416571 e!248611))

(declare-fun c!55035 () Bool)

(assert (=> b!416571 (= c!55035 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12286 0))(
  ( (Unit!12287) )
))
(declare-fun lt!190667 () Unit!12286)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!403 (array!25337 array!25339 (_ BitVec 32) (_ BitVec 32) V!15435 V!15435 (_ BitVec 32) (_ BitVec 64) V!15435 (_ BitVec 32) Int) Unit!12286)

(assert (=> b!416571 (= lt!190667 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!403 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28935 () Bool)

(assert (=> bm!28935 (= call!28939 (getCurrentListMapNoExtraKeys!1204 (ite c!55035 _keys!709 lt!190662) (ite c!55035 _values!549 lt!190657) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416572 () Bool)

(declare-fun res!242549 () Bool)

(assert (=> b!416572 (=> (not res!242549) (not e!248610))))

(assert (=> b!416572 (= res!242549 (bvsle from!863 i!563))))

(declare-fun bm!28936 () Bool)

(assert (=> bm!28936 (= call!28938 (getCurrentListMapNoExtraKeys!1204 (ite c!55035 lt!190662 _keys!709) (ite c!55035 lt!190657 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416573 () Bool)

(declare-fun res!242552 () Bool)

(declare-fun e!248609 () Bool)

(assert (=> b!416573 (=> (not res!242552) (not e!248609))))

(assert (=> b!416573 (= res!242552 (and (= (size!12472 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12471 _keys!709) (size!12472 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416574 () Bool)

(declare-fun res!242555 () Bool)

(assert (=> b!416574 (=> (not res!242555) (not e!248609))))

(declare-datatypes ((List!7056 0))(
  ( (Nil!7053) (Cons!7052 (h!7908 (_ BitVec 64)) (t!12307 List!7056)) )
))
(declare-fun arrayNoDuplicates!0 (array!25337 (_ BitVec 32) List!7056) Bool)

(assert (=> b!416574 (= res!242555 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7053))))

(declare-fun b!416575 () Bool)

(declare-fun res!242554 () Bool)

(assert (=> b!416575 (=> (not res!242554) (not e!248609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416575 (= res!242554 (validMask!0 mask!1025))))

(declare-fun b!416576 () Bool)

(declare-fun res!242558 () Bool)

(assert (=> b!416576 (=> (not res!242558) (not e!248609))))

(declare-fun arrayContainsKey!0 (array!25337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416576 (= res!242558 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!416577 () Bool)

(assert (=> b!416577 (= e!248609 e!248610)))

(declare-fun res!242562 () Bool)

(assert (=> b!416577 (=> (not res!242562) (not e!248610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25337 (_ BitVec 32)) Bool)

(assert (=> b!416577 (= res!242562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190662 mask!1025))))

(assert (=> b!416577 (= lt!190662 (array!25338 (store (arr!12118 _keys!709) i!563 k0!794) (size!12471 _keys!709)))))

(declare-fun mapNonEmpty!17742 () Bool)

(declare-fun mapRes!17742 () Bool)

(declare-fun tp!34313 () Bool)

(declare-fun e!248612 () Bool)

(assert (=> mapNonEmpty!17742 (= mapRes!17742 (and tp!34313 e!248612))))

(declare-fun mapRest!17742 () (Array (_ BitVec 32) ValueCell!5030))

(declare-fun mapValue!17742 () ValueCell!5030)

(declare-fun mapKey!17742 () (_ BitVec 32))

(assert (=> mapNonEmpty!17742 (= (arr!12119 _values!549) (store mapRest!17742 mapKey!17742 mapValue!17742))))

(declare-fun b!416578 () Bool)

(declare-fun res!242556 () Bool)

(assert (=> b!416578 (=> (not res!242556) (not e!248609))))

(assert (=> b!416578 (= res!242556 (or (= (select (arr!12118 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12118 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!416579 () Bool)

(declare-fun res!242557 () Bool)

(assert (=> b!416579 (=> (not res!242557) (not e!248609))))

(assert (=> b!416579 (= res!242557 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12471 _keys!709))))))

(declare-fun b!416580 () Bool)

(declare-fun res!242553 () Bool)

(assert (=> b!416580 (=> (not res!242553) (not e!248609))))

(assert (=> b!416580 (= res!242553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416581 () Bool)

(declare-fun res!242561 () Bool)

(assert (=> b!416581 (=> (not res!242561) (not e!248610))))

(assert (=> b!416581 (= res!242561 (arrayNoDuplicates!0 lt!190662 #b00000000000000000000000000000000 Nil!7053))))

(declare-fun b!416582 () Bool)

(declare-fun e!248615 () Bool)

(declare-fun tp_is_empty!10747 () Bool)

(assert (=> b!416582 (= e!248615 tp_is_empty!10747)))

(declare-fun b!416583 () Bool)

(assert (=> b!416583 (= e!248612 tp_is_empty!10747)))

(declare-fun b!416584 () Bool)

(declare-fun res!242560 () Bool)

(assert (=> b!416584 (=> (not res!242560) (not e!248609))))

(assert (=> b!416584 (= res!242560 (validKeyInArray!0 k0!794))))

(declare-fun b!416585 () Bool)

(declare-fun e!248614 () Bool)

(assert (=> b!416585 (= e!248614 (and e!248615 mapRes!17742))))

(declare-fun condMapEmpty!17742 () Bool)

(declare-fun mapDefault!17742 () ValueCell!5030)

(assert (=> b!416585 (= condMapEmpty!17742 (= (arr!12119 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5030)) mapDefault!17742)))))

(declare-fun res!242559 () Bool)

(assert (=> start!39314 (=> (not res!242559) (not e!248609))))

(assert (=> start!39314 (= res!242559 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12471 _keys!709))))))

(assert (=> start!39314 e!248609))

(assert (=> start!39314 tp_is_empty!10747))

(assert (=> start!39314 tp!34314))

(assert (=> start!39314 true))

(declare-fun array_inv!8878 (array!25339) Bool)

(assert (=> start!39314 (and (array_inv!8878 _values!549) e!248614)))

(declare-fun array_inv!8879 (array!25337) Bool)

(assert (=> start!39314 (array_inv!8879 _keys!709)))

(declare-fun mapIsEmpty!17742 () Bool)

(assert (=> mapIsEmpty!17742 mapRes!17742))

(declare-fun b!416586 () Bool)

(declare-fun +!1224 (ListLongMap!5955 tuple2!7052) ListLongMap!5955)

(assert (=> b!416586 (= e!248611 (= call!28938 (+!1224 call!28939 (tuple2!7053 k0!794 v!412))))))

(declare-fun b!416587 () Bool)

(assert (=> b!416587 (= e!248613 true)))

(declare-fun lt!190660 () ListLongMap!5955)

(declare-fun lt!190658 () V!15435)

(declare-fun lt!190665 () tuple2!7052)

(assert (=> b!416587 (= (+!1224 lt!190660 lt!190665) (+!1224 (+!1224 lt!190660 (tuple2!7053 k0!794 lt!190658)) lt!190665))))

(declare-fun lt!190661 () V!15435)

(assert (=> b!416587 (= lt!190665 (tuple2!7053 k0!794 lt!190661))))

(declare-fun lt!190663 () Unit!12286)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!13 (ListLongMap!5955 (_ BitVec 64) V!15435 V!15435) Unit!12286)

(assert (=> b!416587 (= lt!190663 (addSameAsAddTwiceSameKeyDiffValues!13 lt!190660 k0!794 lt!190658 lt!190661))))

(declare-fun lt!190659 () V!15435)

(declare-fun get!5986 (ValueCell!5030 V!15435) V!15435)

(assert (=> b!416587 (= lt!190658 (get!5986 (select (arr!12119 _values!549) from!863) lt!190659))))

(assert (=> b!416587 (= lt!190666 (+!1224 lt!190660 (tuple2!7053 (select (arr!12118 lt!190662) from!863) lt!190661)))))

(assert (=> b!416587 (= lt!190661 (get!5986 (select (store (arr!12119 _values!549) i!563 (ValueCellFull!5030 v!412)) from!863) lt!190659))))

(declare-fun dynLambda!670 (Int (_ BitVec 64)) V!15435)

(assert (=> b!416587 (= lt!190659 (dynLambda!670 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416587 (= lt!190660 (getCurrentListMapNoExtraKeys!1204 lt!190662 lt!190657 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39314 res!242559) b!416575))

(assert (= (and b!416575 res!242554) b!416573))

(assert (= (and b!416573 res!242552) b!416580))

(assert (= (and b!416580 res!242553) b!416574))

(assert (= (and b!416574 res!242555) b!416579))

(assert (= (and b!416579 res!242557) b!416584))

(assert (= (and b!416584 res!242560) b!416578))

(assert (= (and b!416578 res!242556) b!416576))

(assert (= (and b!416576 res!242558) b!416577))

(assert (= (and b!416577 res!242562) b!416581))

(assert (= (and b!416581 res!242561) b!416572))

(assert (= (and b!416572 res!242549) b!416569))

(assert (= (and b!416569 res!242550) b!416571))

(assert (= (and b!416571 c!55035) b!416586))

(assert (= (and b!416571 (not c!55035)) b!416570))

(assert (= (or b!416586 b!416570) bm!28936))

(assert (= (or b!416586 b!416570) bm!28935))

(assert (= (and b!416571 (not res!242551)) b!416587))

(assert (= (and b!416585 condMapEmpty!17742) mapIsEmpty!17742))

(assert (= (and b!416585 (not condMapEmpty!17742)) mapNonEmpty!17742))

(get-info :version)

(assert (= (and mapNonEmpty!17742 ((_ is ValueCellFull!5030) mapValue!17742)) b!416583))

(assert (= (and b!416585 ((_ is ValueCellFull!5030) mapDefault!17742)) b!416582))

(assert (= start!39314 b!416585))

(declare-fun b_lambda!8881 () Bool)

(assert (=> (not b_lambda!8881) (not b!416587)))

(declare-fun t!12305 () Bool)

(declare-fun tb!3209 () Bool)

(assert (=> (and start!39314 (= defaultEntry!557 defaultEntry!557) t!12305) tb!3209))

(declare-fun result!5953 () Bool)

(assert (=> tb!3209 (= result!5953 tp_is_empty!10747)))

(assert (=> b!416587 t!12305))

(declare-fun b_and!17041 () Bool)

(assert (= b_and!17039 (and (=> t!12305 result!5953) b_and!17041)))

(declare-fun m!405309 () Bool)

(assert (=> b!416574 m!405309))

(declare-fun m!405311 () Bool)

(assert (=> mapNonEmpty!17742 m!405311))

(declare-fun m!405313 () Bool)

(assert (=> b!416578 m!405313))

(declare-fun m!405315 () Bool)

(assert (=> b!416587 m!405315))

(declare-fun m!405317 () Bool)

(assert (=> b!416587 m!405317))

(declare-fun m!405319 () Bool)

(assert (=> b!416587 m!405319))

(declare-fun m!405321 () Bool)

(assert (=> b!416587 m!405321))

(declare-fun m!405323 () Bool)

(assert (=> b!416587 m!405323))

(declare-fun m!405325 () Bool)

(assert (=> b!416587 m!405325))

(declare-fun m!405327 () Bool)

(assert (=> b!416587 m!405327))

(declare-fun m!405329 () Bool)

(assert (=> b!416587 m!405329))

(assert (=> b!416587 m!405323))

(declare-fun m!405331 () Bool)

(assert (=> b!416587 m!405331))

(declare-fun m!405333 () Bool)

(assert (=> b!416587 m!405333))

(assert (=> b!416587 m!405315))

(declare-fun m!405335 () Bool)

(assert (=> b!416587 m!405335))

(declare-fun m!405337 () Bool)

(assert (=> b!416587 m!405337))

(assert (=> b!416587 m!405333))

(declare-fun m!405339 () Bool)

(assert (=> b!416587 m!405339))

(declare-fun m!405341 () Bool)

(assert (=> b!416569 m!405341))

(assert (=> b!416569 m!405321))

(declare-fun m!405343 () Bool)

(assert (=> b!416569 m!405343))

(declare-fun m!405345 () Bool)

(assert (=> b!416577 m!405345))

(declare-fun m!405347 () Bool)

(assert (=> b!416577 m!405347))

(declare-fun m!405349 () Bool)

(assert (=> bm!28935 m!405349))

(declare-fun m!405351 () Bool)

(assert (=> b!416575 m!405351))

(declare-fun m!405353 () Bool)

(assert (=> b!416584 m!405353))

(declare-fun m!405355 () Bool)

(assert (=> start!39314 m!405355))

(declare-fun m!405357 () Bool)

(assert (=> start!39314 m!405357))

(declare-fun m!405359 () Bool)

(assert (=> b!416586 m!405359))

(declare-fun m!405361 () Bool)

(assert (=> b!416581 m!405361))

(declare-fun m!405363 () Bool)

(assert (=> b!416576 m!405363))

(declare-fun m!405365 () Bool)

(assert (=> b!416571 m!405365))

(assert (=> b!416571 m!405365))

(declare-fun m!405367 () Bool)

(assert (=> b!416571 m!405367))

(declare-fun m!405369 () Bool)

(assert (=> b!416571 m!405369))

(declare-fun m!405371 () Bool)

(assert (=> bm!28936 m!405371))

(declare-fun m!405373 () Bool)

(assert (=> b!416580 m!405373))

(check-sat (not start!39314) b_and!17041 (not b!416586) (not bm!28936) (not bm!28935) (not b!416587) (not b_next!9595) (not b!416584) (not b!416581) (not b!416576) (not b!416574) (not b!416571) tp_is_empty!10747 (not b!416577) (not b!416580) (not b!416569) (not b!416575) (not b_lambda!8881) (not mapNonEmpty!17742))
(check-sat b_and!17041 (not b_next!9595))
