; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39992 () Bool)

(assert start!39992)

(declare-fun b_free!10273 () Bool)

(declare-fun b_next!10273 () Bool)

(assert (=> start!39992 (= b_free!10273 (not b_next!10273))))

(declare-fun tp!36347 () Bool)

(declare-fun b_and!18179 () Bool)

(assert (=> start!39992 (= tp!36347 b_and!18179)))

(declare-fun b!435393 () Bool)

(declare-fun res!256589 () Bool)

(declare-fun e!257179 () Bool)

(assert (=> b!435393 (=> (not res!256589) (not e!257179))))

(declare-datatypes ((array!26673 0))(
  ( (array!26674 (arr!12786 (Array (_ BitVec 32) (_ BitVec 64))) (size!13139 (_ BitVec 32))) )
))
(declare-fun lt!200413 () array!26673)

(declare-datatypes ((List!7623 0))(
  ( (Nil!7620) (Cons!7619 (h!8475 (_ BitVec 64)) (t!13336 List!7623)) )
))
(declare-fun arrayNoDuplicates!0 (array!26673 (_ BitVec 32) List!7623) Bool)

(assert (=> b!435393 (= res!256589 (arrayNoDuplicates!0 lt!200413 #b00000000000000000000000000000000 Nil!7620))))

(declare-fun b!435394 () Bool)

(declare-fun res!256590 () Bool)

(declare-fun e!257187 () Bool)

(assert (=> b!435394 (=> (not res!256590) (not e!257187))))

(declare-fun _keys!709 () array!26673)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16339 0))(
  ( (V!16340 (val!5757 Int)) )
))
(declare-datatypes ((ValueCell!5369 0))(
  ( (ValueCellFull!5369 (v!7998 V!16339)) (EmptyCell!5369) )
))
(declare-datatypes ((array!26675 0))(
  ( (array!26676 (arr!12787 (Array (_ BitVec 32) ValueCell!5369)) (size!13140 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26675)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!435394 (= res!256590 (and (= (size!13140 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13139 _keys!709) (size!13140 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18759 () Bool)

(declare-fun mapRes!18759 () Bool)

(assert (=> mapIsEmpty!18759 mapRes!18759))

(declare-fun b!435395 () Bool)

(declare-fun e!257186 () Bool)

(declare-fun e!257184 () Bool)

(assert (=> b!435395 (= e!257186 (and e!257184 mapRes!18759))))

(declare-fun condMapEmpty!18759 () Bool)

(declare-fun mapDefault!18759 () ValueCell!5369)

(assert (=> b!435395 (= condMapEmpty!18759 (= (arr!12787 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5369)) mapDefault!18759)))))

(declare-fun b!435396 () Bool)

(declare-fun e!257183 () Bool)

(declare-fun e!257181 () Bool)

(assert (=> b!435396 (= e!257183 e!257181)))

(declare-fun res!256593 () Bool)

(assert (=> b!435396 (=> res!256593 e!257181)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!435396 (= res!256593 (= k0!794 (select (arr!12786 _keys!709) from!863)))))

(assert (=> b!435396 (not (= (select (arr!12786 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12915 0))(
  ( (Unit!12916) )
))
(declare-fun lt!200423 () Unit!12915)

(declare-fun e!257178 () Unit!12915)

(assert (=> b!435396 (= lt!200423 e!257178)))

(declare-fun c!55674 () Bool)

(assert (=> b!435396 (= c!55674 (= (select (arr!12786 _keys!709) from!863) k0!794))))

(declare-datatypes ((tuple2!7636 0))(
  ( (tuple2!7637 (_1!3829 (_ BitVec 64)) (_2!3829 V!16339)) )
))
(declare-datatypes ((List!7624 0))(
  ( (Nil!7621) (Cons!7620 (h!8476 tuple2!7636) (t!13337 List!7624)) )
))
(declare-datatypes ((ListLongMap!6539 0))(
  ( (ListLongMap!6540 (toList!3285 List!7624)) )
))
(declare-fun lt!200416 () ListLongMap!6539)

(declare-fun lt!200418 () ListLongMap!6539)

(assert (=> b!435396 (= lt!200416 lt!200418)))

(declare-fun lt!200414 () ListLongMap!6539)

(declare-fun lt!200421 () tuple2!7636)

(declare-fun +!1460 (ListLongMap!6539 tuple2!7636) ListLongMap!6539)

(assert (=> b!435396 (= lt!200418 (+!1460 lt!200414 lt!200421))))

(declare-fun lt!200412 () V!16339)

(assert (=> b!435396 (= lt!200421 (tuple2!7637 (select (arr!12786 _keys!709) from!863) lt!200412))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6378 (ValueCell!5369 V!16339) V!16339)

(declare-fun dynLambda!836 (Int (_ BitVec 64)) V!16339)

(assert (=> b!435396 (= lt!200412 (get!6378 (select (arr!12787 _values!549) from!863) (dynLambda!836 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435397 () Bool)

(declare-fun res!256583 () Bool)

(assert (=> b!435397 (=> (not res!256583) (not e!257187))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435397 (= res!256583 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13139 _keys!709))))))

(declare-fun b!435398 () Bool)

(declare-fun e!257180 () Bool)

(assert (=> b!435398 (= e!257179 e!257180)))

(declare-fun res!256582 () Bool)

(assert (=> b!435398 (=> (not res!256582) (not e!257180))))

(assert (=> b!435398 (= res!256582 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16339)

(declare-fun zeroValue!515 () V!16339)

(declare-fun lt!200417 () array!26675)

(declare-fun getCurrentListMapNoExtraKeys!1485 (array!26673 array!26675 (_ BitVec 32) (_ BitVec 32) V!16339 V!16339 (_ BitVec 32) Int) ListLongMap!6539)

(assert (=> b!435398 (= lt!200416 (getCurrentListMapNoExtraKeys!1485 lt!200413 lt!200417 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16339)

(assert (=> b!435398 (= lt!200417 (array!26676 (store (arr!12787 _values!549) i!563 (ValueCellFull!5369 v!412)) (size!13140 _values!549)))))

(declare-fun lt!200426 () ListLongMap!6539)

(assert (=> b!435398 (= lt!200426 (getCurrentListMapNoExtraKeys!1485 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435399 () Bool)

(assert (=> b!435399 (= e!257181 true)))

(declare-fun lt!200424 () ListLongMap!6539)

(declare-fun lt!200422 () tuple2!7636)

(assert (=> b!435399 (= lt!200418 (+!1460 (+!1460 lt!200424 lt!200421) lt!200422))))

(declare-fun lt!200419 () Unit!12915)

(declare-fun addCommutativeForDiffKeys!410 (ListLongMap!6539 (_ BitVec 64) V!16339 (_ BitVec 64) V!16339) Unit!12915)

(assert (=> b!435399 (= lt!200419 (addCommutativeForDiffKeys!410 lt!200424 k0!794 v!412 (select (arr!12786 _keys!709) from!863) lt!200412))))

(declare-fun b!435400 () Bool)

(declare-fun Unit!12917 () Unit!12915)

(assert (=> b!435400 (= e!257178 Unit!12917)))

(declare-fun lt!200415 () Unit!12915)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26673 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12915)

(assert (=> b!435400 (= lt!200415 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435400 false))

(declare-fun b!435401 () Bool)

(assert (=> b!435401 (= e!257187 e!257179)))

(declare-fun res!256586 () Bool)

(assert (=> b!435401 (=> (not res!256586) (not e!257179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26673 (_ BitVec 32)) Bool)

(assert (=> b!435401 (= res!256586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200413 mask!1025))))

(assert (=> b!435401 (= lt!200413 (array!26674 (store (arr!12786 _keys!709) i!563 k0!794) (size!13139 _keys!709)))))

(declare-fun b!435402 () Bool)

(declare-fun res!256591 () Bool)

(assert (=> b!435402 (=> (not res!256591) (not e!257187))))

(declare-fun arrayContainsKey!0 (array!26673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435402 (= res!256591 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!435403 () Bool)

(declare-fun res!256596 () Bool)

(assert (=> b!435403 (=> (not res!256596) (not e!257187))))

(assert (=> b!435403 (= res!256596 (or (= (select (arr!12786 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12786 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435404 () Bool)

(declare-fun e!257185 () Bool)

(declare-fun tp_is_empty!11425 () Bool)

(assert (=> b!435404 (= e!257185 tp_is_empty!11425)))

(declare-fun res!256588 () Bool)

(assert (=> start!39992 (=> (not res!256588) (not e!257187))))

(assert (=> start!39992 (= res!256588 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13139 _keys!709))))))

(assert (=> start!39992 e!257187))

(assert (=> start!39992 tp_is_empty!11425))

(assert (=> start!39992 tp!36347))

(assert (=> start!39992 true))

(declare-fun array_inv!9334 (array!26675) Bool)

(assert (=> start!39992 (and (array_inv!9334 _values!549) e!257186)))

(declare-fun array_inv!9335 (array!26673) Bool)

(assert (=> start!39992 (array_inv!9335 _keys!709)))

(declare-fun b!435405 () Bool)

(declare-fun Unit!12918 () Unit!12915)

(assert (=> b!435405 (= e!257178 Unit!12918)))

(declare-fun mapNonEmpty!18759 () Bool)

(declare-fun tp!36348 () Bool)

(assert (=> mapNonEmpty!18759 (= mapRes!18759 (and tp!36348 e!257185))))

(declare-fun mapKey!18759 () (_ BitVec 32))

(declare-fun mapRest!18759 () (Array (_ BitVec 32) ValueCell!5369))

(declare-fun mapValue!18759 () ValueCell!5369)

(assert (=> mapNonEmpty!18759 (= (arr!12787 _values!549) (store mapRest!18759 mapKey!18759 mapValue!18759))))

(declare-fun b!435406 () Bool)

(declare-fun res!256587 () Bool)

(assert (=> b!435406 (=> (not res!256587) (not e!257187))))

(assert (=> b!435406 (= res!256587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435407 () Bool)

(assert (=> b!435407 (= e!257184 tp_is_empty!11425)))

(declare-fun b!435408 () Bool)

(declare-fun res!256592 () Bool)

(assert (=> b!435408 (=> (not res!256592) (not e!257187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435408 (= res!256592 (validKeyInArray!0 k0!794))))

(declare-fun b!435409 () Bool)

(assert (=> b!435409 (= e!257180 (not e!257183))))

(declare-fun res!256584 () Bool)

(assert (=> b!435409 (=> res!256584 e!257183)))

(assert (=> b!435409 (= res!256584 (not (validKeyInArray!0 (select (arr!12786 _keys!709) from!863))))))

(declare-fun lt!200420 () ListLongMap!6539)

(assert (=> b!435409 (= lt!200420 lt!200414)))

(assert (=> b!435409 (= lt!200414 (+!1460 lt!200424 lt!200422))))

(assert (=> b!435409 (= lt!200420 (getCurrentListMapNoExtraKeys!1485 lt!200413 lt!200417 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!435409 (= lt!200422 (tuple2!7637 k0!794 v!412))))

(assert (=> b!435409 (= lt!200424 (getCurrentListMapNoExtraKeys!1485 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200425 () Unit!12915)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!602 (array!26673 array!26675 (_ BitVec 32) (_ BitVec 32) V!16339 V!16339 (_ BitVec 32) (_ BitVec 64) V!16339 (_ BitVec 32) Int) Unit!12915)

(assert (=> b!435409 (= lt!200425 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!602 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435410 () Bool)

(declare-fun res!256585 () Bool)

(assert (=> b!435410 (=> (not res!256585) (not e!257187))))

(assert (=> b!435410 (= res!256585 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7620))))

(declare-fun b!435411 () Bool)

(declare-fun res!256594 () Bool)

(assert (=> b!435411 (=> (not res!256594) (not e!257187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435411 (= res!256594 (validMask!0 mask!1025))))

(declare-fun b!435412 () Bool)

(declare-fun res!256595 () Bool)

(assert (=> b!435412 (=> (not res!256595) (not e!257179))))

(assert (=> b!435412 (= res!256595 (bvsle from!863 i!563))))

(assert (= (and start!39992 res!256588) b!435411))

(assert (= (and b!435411 res!256594) b!435394))

(assert (= (and b!435394 res!256590) b!435406))

(assert (= (and b!435406 res!256587) b!435410))

(assert (= (and b!435410 res!256585) b!435397))

(assert (= (and b!435397 res!256583) b!435408))

(assert (= (and b!435408 res!256592) b!435403))

(assert (= (and b!435403 res!256596) b!435402))

(assert (= (and b!435402 res!256591) b!435401))

(assert (= (and b!435401 res!256586) b!435393))

(assert (= (and b!435393 res!256589) b!435412))

(assert (= (and b!435412 res!256595) b!435398))

(assert (= (and b!435398 res!256582) b!435409))

(assert (= (and b!435409 (not res!256584)) b!435396))

(assert (= (and b!435396 c!55674) b!435400))

(assert (= (and b!435396 (not c!55674)) b!435405))

(assert (= (and b!435396 (not res!256593)) b!435399))

(assert (= (and b!435395 condMapEmpty!18759) mapIsEmpty!18759))

(assert (= (and b!435395 (not condMapEmpty!18759)) mapNonEmpty!18759))

(get-info :version)

(assert (= (and mapNonEmpty!18759 ((_ is ValueCellFull!5369) mapValue!18759)) b!435404))

(assert (= (and b!435395 ((_ is ValueCellFull!5369) mapDefault!18759)) b!435407))

(assert (= start!39992 b!435395))

(declare-fun b_lambda!9343 () Bool)

(assert (=> (not b_lambda!9343) (not b!435396)))

(declare-fun t!13335 () Bool)

(declare-fun tb!3671 () Bool)

(assert (=> (and start!39992 (= defaultEntry!557 defaultEntry!557) t!13335) tb!3671))

(declare-fun result!6877 () Bool)

(assert (=> tb!3671 (= result!6877 tp_is_empty!11425)))

(assert (=> b!435396 t!13335))

(declare-fun b_and!18181 () Bool)

(assert (= b_and!18179 (and (=> t!13335 result!6877) b_and!18181)))

(declare-fun m!422805 () Bool)

(assert (=> b!435396 m!422805))

(declare-fun m!422807 () Bool)

(assert (=> b!435396 m!422807))

(declare-fun m!422809 () Bool)

(assert (=> b!435396 m!422809))

(declare-fun m!422811 () Bool)

(assert (=> b!435396 m!422811))

(assert (=> b!435396 m!422809))

(assert (=> b!435396 m!422807))

(declare-fun m!422813 () Bool)

(assert (=> b!435396 m!422813))

(declare-fun m!422815 () Bool)

(assert (=> b!435403 m!422815))

(declare-fun m!422817 () Bool)

(assert (=> mapNonEmpty!18759 m!422817))

(declare-fun m!422819 () Bool)

(assert (=> b!435399 m!422819))

(assert (=> b!435399 m!422819))

(declare-fun m!422821 () Bool)

(assert (=> b!435399 m!422821))

(assert (=> b!435399 m!422805))

(assert (=> b!435399 m!422805))

(declare-fun m!422823 () Bool)

(assert (=> b!435399 m!422823))

(declare-fun m!422825 () Bool)

(assert (=> b!435393 m!422825))

(assert (=> b!435409 m!422805))

(declare-fun m!422827 () Bool)

(assert (=> b!435409 m!422827))

(declare-fun m!422829 () Bool)

(assert (=> b!435409 m!422829))

(declare-fun m!422831 () Bool)

(assert (=> b!435409 m!422831))

(assert (=> b!435409 m!422805))

(declare-fun m!422833 () Bool)

(assert (=> b!435409 m!422833))

(declare-fun m!422835 () Bool)

(assert (=> b!435409 m!422835))

(declare-fun m!422837 () Bool)

(assert (=> b!435408 m!422837))

(declare-fun m!422839 () Bool)

(assert (=> b!435400 m!422839))

(declare-fun m!422841 () Bool)

(assert (=> b!435398 m!422841))

(declare-fun m!422843 () Bool)

(assert (=> b!435398 m!422843))

(declare-fun m!422845 () Bool)

(assert (=> b!435398 m!422845))

(declare-fun m!422847 () Bool)

(assert (=> b!435410 m!422847))

(declare-fun m!422849 () Bool)

(assert (=> b!435402 m!422849))

(declare-fun m!422851 () Bool)

(assert (=> start!39992 m!422851))

(declare-fun m!422853 () Bool)

(assert (=> start!39992 m!422853))

(declare-fun m!422855 () Bool)

(assert (=> b!435406 m!422855))

(declare-fun m!422857 () Bool)

(assert (=> b!435411 m!422857))

(declare-fun m!422859 () Bool)

(assert (=> b!435401 m!422859))

(declare-fun m!422861 () Bool)

(assert (=> b!435401 m!422861))

(check-sat (not mapNonEmpty!18759) (not b!435396) (not b!435408) (not b!435401) (not b!435409) (not b!435400) (not b!435398) (not start!39992) (not b_next!10273) (not b!435410) (not b_lambda!9343) b_and!18181 (not b!435411) (not b!435406) tp_is_empty!11425 (not b!435399) (not b!435402) (not b!435393))
(check-sat b_and!18181 (not b_next!10273))
