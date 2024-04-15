; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39950 () Bool)

(assert start!39950)

(declare-fun b_free!10231 () Bool)

(declare-fun b_next!10231 () Bool)

(assert (=> start!39950 (= b_free!10231 (not b_next!10231))))

(declare-fun tp!36221 () Bool)

(declare-fun b_and!18095 () Bool)

(assert (=> start!39950 (= tp!36221 b_and!18095)))

(declare-fun b!434091 () Bool)

(declare-fun res!255640 () Bool)

(declare-fun e!256555 () Bool)

(assert (=> b!434091 (=> (not res!255640) (not e!256555))))

(declare-datatypes ((array!26589 0))(
  ( (array!26590 (arr!12744 (Array (_ BitVec 32) (_ BitVec 64))) (size!13097 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26589)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26589 (_ BitVec 32)) Bool)

(assert (=> b!434091 (= res!255640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434092 () Bool)

(declare-fun e!256554 () Bool)

(assert (=> b!434092 (= e!256554 true)))

(declare-datatypes ((V!16283 0))(
  ( (V!16284 (val!5736 Int)) )
))
(declare-datatypes ((tuple2!7594 0))(
  ( (tuple2!7595 (_1!3808 (_ BitVec 64)) (_2!3808 V!16283)) )
))
(declare-fun lt!199474 () tuple2!7594)

(declare-fun lt!199471 () tuple2!7594)

(declare-datatypes ((List!7585 0))(
  ( (Nil!7582) (Cons!7581 (h!8437 tuple2!7594) (t!13256 List!7585)) )
))
(declare-datatypes ((ListLongMap!6497 0))(
  ( (ListLongMap!6498 (toList!3264 List!7585)) )
))
(declare-fun lt!199468 () ListLongMap!6497)

(declare-fun lt!199472 () ListLongMap!6497)

(declare-fun +!1439 (ListLongMap!6497 tuple2!7594) ListLongMap!6497)

(assert (=> b!434092 (= lt!199472 (+!1439 (+!1439 lt!199468 lt!199471) lt!199474))))

(declare-fun lt!199473 () V!16283)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12840 0))(
  ( (Unit!12841) )
))
(declare-fun lt!199478 () Unit!12840)

(declare-fun v!412 () V!16283)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!394 (ListLongMap!6497 (_ BitVec 64) V!16283 (_ BitVec 64) V!16283) Unit!12840)

(assert (=> b!434092 (= lt!199478 (addCommutativeForDiffKeys!394 lt!199468 k0!794 v!412 (select (arr!12744 _keys!709) from!863) lt!199473))))

(declare-fun b!434093 () Bool)

(declare-fun res!255638 () Bool)

(declare-fun e!256550 () Bool)

(assert (=> b!434093 (=> (not res!255638) (not e!256550))))

(declare-fun lt!199475 () array!26589)

(declare-datatypes ((List!7586 0))(
  ( (Nil!7583) (Cons!7582 (h!8438 (_ BitVec 64)) (t!13257 List!7586)) )
))
(declare-fun arrayNoDuplicates!0 (array!26589 (_ BitVec 32) List!7586) Bool)

(assert (=> b!434093 (= res!255638 (arrayNoDuplicates!0 lt!199475 #b00000000000000000000000000000000 Nil!7583))))

(declare-fun b!434094 () Bool)

(declare-fun res!255642 () Bool)

(assert (=> b!434094 (=> (not res!255642) (not e!256555))))

(declare-fun arrayContainsKey!0 (array!26589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434094 (= res!255642 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!434095 () Bool)

(declare-fun res!255644 () Bool)

(assert (=> b!434095 (=> (not res!255644) (not e!256555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434095 (= res!255644 (validKeyInArray!0 k0!794))))

(declare-fun b!434096 () Bool)

(declare-fun e!256551 () Bool)

(assert (=> b!434096 (= e!256551 e!256554)))

(declare-fun res!255639 () Bool)

(assert (=> b!434096 (=> res!255639 e!256554)))

(assert (=> b!434096 (= res!255639 (= k0!794 (select (arr!12744 _keys!709) from!863)))))

(assert (=> b!434096 (not (= (select (arr!12744 _keys!709) from!863) k0!794))))

(declare-fun lt!199467 () Unit!12840)

(declare-fun e!256557 () Unit!12840)

(assert (=> b!434096 (= lt!199467 e!256557)))

(declare-fun c!55611 () Bool)

(assert (=> b!434096 (= c!55611 (= (select (arr!12744 _keys!709) from!863) k0!794))))

(declare-fun lt!199480 () ListLongMap!6497)

(assert (=> b!434096 (= lt!199480 lt!199472)))

(declare-fun lt!199470 () ListLongMap!6497)

(assert (=> b!434096 (= lt!199472 (+!1439 lt!199470 lt!199471))))

(assert (=> b!434096 (= lt!199471 (tuple2!7595 (select (arr!12744 _keys!709) from!863) lt!199473))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5348 0))(
  ( (ValueCellFull!5348 (v!7977 V!16283)) (EmptyCell!5348) )
))
(declare-datatypes ((array!26591 0))(
  ( (array!26592 (arr!12745 (Array (_ BitVec 32) ValueCell!5348)) (size!13098 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26591)

(declare-fun get!6346 (ValueCell!5348 V!16283) V!16283)

(declare-fun dynLambda!818 (Int (_ BitVec 64)) V!16283)

(assert (=> b!434096 (= lt!199473 (get!6346 (select (arr!12745 _values!549) from!863) (dynLambda!818 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434097 () Bool)

(declare-fun e!256556 () Bool)

(assert (=> b!434097 (= e!256550 e!256556)))

(declare-fun res!255646 () Bool)

(assert (=> b!434097 (=> (not res!255646) (not e!256556))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!434097 (= res!255646 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!199481 () array!26591)

(declare-fun minValue!515 () V!16283)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16283)

(declare-fun getCurrentListMapNoExtraKeys!1467 (array!26589 array!26591 (_ BitVec 32) (_ BitVec 32) V!16283 V!16283 (_ BitVec 32) Int) ListLongMap!6497)

(assert (=> b!434097 (= lt!199480 (getCurrentListMapNoExtraKeys!1467 lt!199475 lt!199481 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!434097 (= lt!199481 (array!26592 (store (arr!12745 _values!549) i!563 (ValueCellFull!5348 v!412)) (size!13098 _values!549)))))

(declare-fun lt!199479 () ListLongMap!6497)

(assert (=> b!434097 (= lt!199479 (getCurrentListMapNoExtraKeys!1467 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!434098 () Bool)

(declare-fun e!256553 () Bool)

(declare-fun e!256548 () Bool)

(declare-fun mapRes!18696 () Bool)

(assert (=> b!434098 (= e!256553 (and e!256548 mapRes!18696))))

(declare-fun condMapEmpty!18696 () Bool)

(declare-fun mapDefault!18696 () ValueCell!5348)

(assert (=> b!434098 (= condMapEmpty!18696 (= (arr!12745 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5348)) mapDefault!18696)))))

(declare-fun b!434099 () Bool)

(assert (=> b!434099 (= e!256555 e!256550)))

(declare-fun res!255641 () Bool)

(assert (=> b!434099 (=> (not res!255641) (not e!256550))))

(assert (=> b!434099 (= res!255641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199475 mask!1025))))

(assert (=> b!434099 (= lt!199475 (array!26590 (store (arr!12744 _keys!709) i!563 k0!794) (size!13097 _keys!709)))))

(declare-fun b!434100 () Bool)

(declare-fun Unit!12842 () Unit!12840)

(assert (=> b!434100 (= e!256557 Unit!12842)))

(declare-fun lt!199476 () Unit!12840)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26589 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12840)

(assert (=> b!434100 (= lt!199476 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434100 false))

(declare-fun b!434101 () Bool)

(declare-fun tp_is_empty!11383 () Bool)

(assert (=> b!434101 (= e!256548 tp_is_empty!11383)))

(declare-fun mapNonEmpty!18696 () Bool)

(declare-fun tp!36222 () Bool)

(declare-fun e!256549 () Bool)

(assert (=> mapNonEmpty!18696 (= mapRes!18696 (and tp!36222 e!256549))))

(declare-fun mapValue!18696 () ValueCell!5348)

(declare-fun mapRest!18696 () (Array (_ BitVec 32) ValueCell!5348))

(declare-fun mapKey!18696 () (_ BitVec 32))

(assert (=> mapNonEmpty!18696 (= (arr!12745 _values!549) (store mapRest!18696 mapKey!18696 mapValue!18696))))

(declare-fun b!434102 () Bool)

(assert (=> b!434102 (= e!256549 tp_is_empty!11383)))

(declare-fun b!434103 () Bool)

(declare-fun Unit!12843 () Unit!12840)

(assert (=> b!434103 (= e!256557 Unit!12843)))

(declare-fun mapIsEmpty!18696 () Bool)

(assert (=> mapIsEmpty!18696 mapRes!18696))

(declare-fun res!255645 () Bool)

(assert (=> start!39950 (=> (not res!255645) (not e!256555))))

(assert (=> start!39950 (= res!255645 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13097 _keys!709))))))

(assert (=> start!39950 e!256555))

(assert (=> start!39950 tp_is_empty!11383))

(assert (=> start!39950 tp!36221))

(assert (=> start!39950 true))

(declare-fun array_inv!9304 (array!26591) Bool)

(assert (=> start!39950 (and (array_inv!9304 _values!549) e!256553)))

(declare-fun array_inv!9305 (array!26589) Bool)

(assert (=> start!39950 (array_inv!9305 _keys!709)))

(declare-fun b!434104 () Bool)

(declare-fun res!255647 () Bool)

(assert (=> b!434104 (=> (not res!255647) (not e!256550))))

(assert (=> b!434104 (= res!255647 (bvsle from!863 i!563))))

(declare-fun b!434105 () Bool)

(declare-fun res!255643 () Bool)

(assert (=> b!434105 (=> (not res!255643) (not e!256555))))

(assert (=> b!434105 (= res!255643 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7583))))

(declare-fun b!434106 () Bool)

(assert (=> b!434106 (= e!256556 (not e!256551))))

(declare-fun res!255650 () Bool)

(assert (=> b!434106 (=> res!255650 e!256551)))

(assert (=> b!434106 (= res!255650 (not (validKeyInArray!0 (select (arr!12744 _keys!709) from!863))))))

(declare-fun lt!199469 () ListLongMap!6497)

(assert (=> b!434106 (= lt!199469 lt!199470)))

(assert (=> b!434106 (= lt!199470 (+!1439 lt!199468 lt!199474))))

(assert (=> b!434106 (= lt!199469 (getCurrentListMapNoExtraKeys!1467 lt!199475 lt!199481 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!434106 (= lt!199474 (tuple2!7595 k0!794 v!412))))

(assert (=> b!434106 (= lt!199468 (getCurrentListMapNoExtraKeys!1467 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199477 () Unit!12840)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!588 (array!26589 array!26591 (_ BitVec 32) (_ BitVec 32) V!16283 V!16283 (_ BitVec 32) (_ BitVec 64) V!16283 (_ BitVec 32) Int) Unit!12840)

(assert (=> b!434106 (= lt!199477 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!588 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!434107 () Bool)

(declare-fun res!255637 () Bool)

(assert (=> b!434107 (=> (not res!255637) (not e!256555))))

(assert (=> b!434107 (= res!255637 (or (= (select (arr!12744 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12744 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434108 () Bool)

(declare-fun res!255651 () Bool)

(assert (=> b!434108 (=> (not res!255651) (not e!256555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434108 (= res!255651 (validMask!0 mask!1025))))

(declare-fun b!434109 () Bool)

(declare-fun res!255648 () Bool)

(assert (=> b!434109 (=> (not res!255648) (not e!256555))))

(assert (=> b!434109 (= res!255648 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13097 _keys!709))))))

(declare-fun b!434110 () Bool)

(declare-fun res!255649 () Bool)

(assert (=> b!434110 (=> (not res!255649) (not e!256555))))

(assert (=> b!434110 (= res!255649 (and (= (size!13098 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13097 _keys!709) (size!13098 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39950 res!255645) b!434108))

(assert (= (and b!434108 res!255651) b!434110))

(assert (= (and b!434110 res!255649) b!434091))

(assert (= (and b!434091 res!255640) b!434105))

(assert (= (and b!434105 res!255643) b!434109))

(assert (= (and b!434109 res!255648) b!434095))

(assert (= (and b!434095 res!255644) b!434107))

(assert (= (and b!434107 res!255637) b!434094))

(assert (= (and b!434094 res!255642) b!434099))

(assert (= (and b!434099 res!255641) b!434093))

(assert (= (and b!434093 res!255638) b!434104))

(assert (= (and b!434104 res!255647) b!434097))

(assert (= (and b!434097 res!255646) b!434106))

(assert (= (and b!434106 (not res!255650)) b!434096))

(assert (= (and b!434096 c!55611) b!434100))

(assert (= (and b!434096 (not c!55611)) b!434103))

(assert (= (and b!434096 (not res!255639)) b!434092))

(assert (= (and b!434098 condMapEmpty!18696) mapIsEmpty!18696))

(assert (= (and b!434098 (not condMapEmpty!18696)) mapNonEmpty!18696))

(get-info :version)

(assert (= (and mapNonEmpty!18696 ((_ is ValueCellFull!5348) mapValue!18696)) b!434102))

(assert (= (and b!434098 ((_ is ValueCellFull!5348) mapDefault!18696)) b!434101))

(assert (= start!39950 b!434098))

(declare-fun b_lambda!9301 () Bool)

(assert (=> (not b_lambda!9301) (not b!434096)))

(declare-fun t!13255 () Bool)

(declare-fun tb!3629 () Bool)

(assert (=> (and start!39950 (= defaultEntry!557 defaultEntry!557) t!13255) tb!3629))

(declare-fun result!6793 () Bool)

(assert (=> tb!3629 (= result!6793 tp_is_empty!11383)))

(assert (=> b!434096 t!13255))

(declare-fun b_and!18097 () Bool)

(assert (= b_and!18095 (and (=> t!13255 result!6793) b_and!18097)))

(declare-fun m!421587 () Bool)

(assert (=> b!434091 m!421587))

(declare-fun m!421589 () Bool)

(assert (=> b!434096 m!421589))

(declare-fun m!421591 () Bool)

(assert (=> b!434096 m!421591))

(declare-fun m!421593 () Bool)

(assert (=> b!434096 m!421593))

(declare-fun m!421595 () Bool)

(assert (=> b!434096 m!421595))

(assert (=> b!434096 m!421593))

(assert (=> b!434096 m!421591))

(declare-fun m!421597 () Bool)

(assert (=> b!434096 m!421597))

(declare-fun m!421599 () Bool)

(assert (=> b!434100 m!421599))

(declare-fun m!421601 () Bool)

(assert (=> b!434092 m!421601))

(assert (=> b!434092 m!421601))

(declare-fun m!421603 () Bool)

(assert (=> b!434092 m!421603))

(assert (=> b!434092 m!421589))

(assert (=> b!434092 m!421589))

(declare-fun m!421605 () Bool)

(assert (=> b!434092 m!421605))

(declare-fun m!421607 () Bool)

(assert (=> b!434105 m!421607))

(declare-fun m!421609 () Bool)

(assert (=> b!434093 m!421609))

(declare-fun m!421611 () Bool)

(assert (=> b!434099 m!421611))

(declare-fun m!421613 () Bool)

(assert (=> b!434099 m!421613))

(declare-fun m!421615 () Bool)

(assert (=> b!434094 m!421615))

(declare-fun m!421617 () Bool)

(assert (=> b!434097 m!421617))

(declare-fun m!421619 () Bool)

(assert (=> b!434097 m!421619))

(declare-fun m!421621 () Bool)

(assert (=> b!434097 m!421621))

(declare-fun m!421623 () Bool)

(assert (=> b!434108 m!421623))

(declare-fun m!421625 () Bool)

(assert (=> b!434095 m!421625))

(declare-fun m!421627 () Bool)

(assert (=> b!434107 m!421627))

(declare-fun m!421629 () Bool)

(assert (=> mapNonEmpty!18696 m!421629))

(assert (=> b!434106 m!421589))

(declare-fun m!421631 () Bool)

(assert (=> b!434106 m!421631))

(declare-fun m!421633 () Bool)

(assert (=> b!434106 m!421633))

(declare-fun m!421635 () Bool)

(assert (=> b!434106 m!421635))

(assert (=> b!434106 m!421589))

(declare-fun m!421637 () Bool)

(assert (=> b!434106 m!421637))

(declare-fun m!421639 () Bool)

(assert (=> b!434106 m!421639))

(declare-fun m!421641 () Bool)

(assert (=> start!39950 m!421641))

(declare-fun m!421643 () Bool)

(assert (=> start!39950 m!421643))

(check-sat (not b!434094) (not mapNonEmpty!18696) (not b!434099) (not b!434105) (not b_lambda!9301) (not b!434095) (not b!434108) (not b_next!10231) b_and!18097 (not start!39950) (not b!434100) (not b!434097) (not b!434091) (not b!434096) tp_is_empty!11383 (not b!434093) (not b!434106) (not b!434092))
(check-sat b_and!18097 (not b_next!10231))
