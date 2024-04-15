; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39812 () Bool)

(assert start!39812)

(declare-fun b_free!10093 () Bool)

(declare-fun b_next!10093 () Bool)

(assert (=> start!39812 (= b_free!10093 (not b_next!10093))))

(declare-fun tp!35808 () Bool)

(declare-fun b_and!17819 () Bool)

(assert (=> start!39812 (= tp!35808 b_and!17819)))

(declare-fun b!429813 () Bool)

(declare-fun e!254478 () Bool)

(declare-fun e!254479 () Bool)

(assert (=> b!429813 (= e!254478 (not e!254479))))

(declare-fun res!252539 () Bool)

(assert (=> b!429813 (=> res!252539 e!254479)))

(declare-datatypes ((array!26319 0))(
  ( (array!26320 (arr!12609 (Array (_ BitVec 32) (_ BitVec 64))) (size!12962 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26319)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429813 (= res!252539 (not (validKeyInArray!0 (select (arr!12609 _keys!709) from!863))))))

(declare-datatypes ((V!16099 0))(
  ( (V!16100 (val!5667 Int)) )
))
(declare-datatypes ((tuple2!7472 0))(
  ( (tuple2!7473 (_1!3747 (_ BitVec 64)) (_2!3747 V!16099)) )
))
(declare-datatypes ((List!7469 0))(
  ( (Nil!7466) (Cons!7465 (h!8321 tuple2!7472) (t!13002 List!7469)) )
))
(declare-datatypes ((ListLongMap!6375 0))(
  ( (ListLongMap!6376 (toList!3203 List!7469)) )
))
(declare-fun lt!196375 () ListLongMap!6375)

(declare-fun lt!196373 () ListLongMap!6375)

(assert (=> b!429813 (= lt!196375 lt!196373)))

(declare-fun lt!196371 () ListLongMap!6375)

(declare-fun lt!196365 () tuple2!7472)

(declare-fun +!1380 (ListLongMap!6375 tuple2!7472) ListLongMap!6375)

(assert (=> b!429813 (= lt!196373 (+!1380 lt!196371 lt!196365))))

(declare-fun minValue!515 () V!16099)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5279 0))(
  ( (ValueCellFull!5279 (v!7908 V!16099)) (EmptyCell!5279) )
))
(declare-datatypes ((array!26321 0))(
  ( (array!26322 (arr!12610 (Array (_ BitVec 32) ValueCell!5279)) (size!12963 (_ BitVec 32))) )
))
(declare-fun lt!196376 () array!26321)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16099)

(declare-fun lt!196370 () array!26319)

(declare-fun getCurrentListMapNoExtraKeys!1410 (array!26319 array!26321 (_ BitVec 32) (_ BitVec 32) V!16099 V!16099 (_ BitVec 32) Int) ListLongMap!6375)

(assert (=> b!429813 (= lt!196375 (getCurrentListMapNoExtraKeys!1410 lt!196370 lt!196376 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16099)

(assert (=> b!429813 (= lt!196365 (tuple2!7473 k0!794 v!412))))

(declare-fun _values!549 () array!26321)

(assert (=> b!429813 (= lt!196371 (getCurrentListMapNoExtraKeys!1410 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12641 0))(
  ( (Unit!12642) )
))
(declare-fun lt!196363 () Unit!12641)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!544 (array!26319 array!26321 (_ BitVec 32) (_ BitVec 32) V!16099 V!16099 (_ BitVec 32) (_ BitVec 64) V!16099 (_ BitVec 32) Int) Unit!12641)

(assert (=> b!429813 (= lt!196363 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!544 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429814 () Bool)

(declare-fun res!252541 () Bool)

(declare-fun e!254481 () Bool)

(assert (=> b!429814 (=> (not res!252541) (not e!254481))))

(assert (=> b!429814 (= res!252541 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12962 _keys!709))))))

(declare-fun b!429815 () Bool)

(declare-fun res!252535 () Bool)

(assert (=> b!429815 (=> (not res!252535) (not e!254481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26319 (_ BitVec 32)) Bool)

(assert (=> b!429815 (= res!252535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429816 () Bool)

(declare-fun e!254487 () Unit!12641)

(declare-fun Unit!12643 () Unit!12641)

(assert (=> b!429816 (= e!254487 Unit!12643)))

(declare-fun lt!196366 () Unit!12641)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26319 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12641)

(assert (=> b!429816 (= lt!196366 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429816 false))

(declare-fun b!429817 () Bool)

(declare-fun e!254485 () Bool)

(assert (=> b!429817 (= e!254485 true)))

(declare-fun lt!196374 () ListLongMap!6375)

(declare-fun lt!196362 () tuple2!7472)

(assert (=> b!429817 (= lt!196374 (+!1380 (+!1380 lt!196371 lt!196362) lt!196365))))

(declare-fun lt!196364 () V!16099)

(declare-fun lt!196372 () Unit!12641)

(declare-fun addCommutativeForDiffKeys!347 (ListLongMap!6375 (_ BitVec 64) V!16099 (_ BitVec 64) V!16099) Unit!12641)

(assert (=> b!429817 (= lt!196372 (addCommutativeForDiffKeys!347 lt!196371 k0!794 v!412 (select (arr!12609 _keys!709) from!863) lt!196364))))

(declare-fun b!429818 () Bool)

(declare-fun e!254484 () Bool)

(declare-fun tp_is_empty!11245 () Bool)

(assert (=> b!429818 (= e!254484 tp_is_empty!11245)))

(declare-fun b!429820 () Bool)

(declare-fun res!252532 () Bool)

(assert (=> b!429820 (=> (not res!252532) (not e!254481))))

(declare-fun arrayContainsKey!0 (array!26319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429820 (= res!252532 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!429821 () Bool)

(declare-fun e!254486 () Bool)

(assert (=> b!429821 (= e!254486 e!254478)))

(declare-fun res!252542 () Bool)

(assert (=> b!429821 (=> (not res!252542) (not e!254478))))

(assert (=> b!429821 (= res!252542 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!196369 () ListLongMap!6375)

(assert (=> b!429821 (= lt!196369 (getCurrentListMapNoExtraKeys!1410 lt!196370 lt!196376 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!429821 (= lt!196376 (array!26322 (store (arr!12610 _values!549) i!563 (ValueCellFull!5279 v!412)) (size!12963 _values!549)))))

(declare-fun lt!196368 () ListLongMap!6375)

(assert (=> b!429821 (= lt!196368 (getCurrentListMapNoExtraKeys!1410 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429822 () Bool)

(declare-fun res!252533 () Bool)

(assert (=> b!429822 (=> (not res!252533) (not e!254481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429822 (= res!252533 (validMask!0 mask!1025))))

(declare-fun b!429823 () Bool)

(declare-fun res!252534 () Bool)

(assert (=> b!429823 (=> (not res!252534) (not e!254486))))

(declare-datatypes ((List!7470 0))(
  ( (Nil!7467) (Cons!7466 (h!8322 (_ BitVec 64)) (t!13003 List!7470)) )
))
(declare-fun arrayNoDuplicates!0 (array!26319 (_ BitVec 32) List!7470) Bool)

(assert (=> b!429823 (= res!252534 (arrayNoDuplicates!0 lt!196370 #b00000000000000000000000000000000 Nil!7467))))

(declare-fun b!429824 () Bool)

(declare-fun Unit!12644 () Unit!12641)

(assert (=> b!429824 (= e!254487 Unit!12644)))

(declare-fun b!429825 () Bool)

(declare-fun res!252538 () Bool)

(assert (=> b!429825 (=> (not res!252538) (not e!254481))))

(assert (=> b!429825 (= res!252538 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7467))))

(declare-fun b!429826 () Bool)

(declare-fun res!252543 () Bool)

(assert (=> b!429826 (=> (not res!252543) (not e!254486))))

(assert (=> b!429826 (= res!252543 (bvsle from!863 i!563))))

(declare-fun b!429827 () Bool)

(declare-fun res!252537 () Bool)

(assert (=> b!429827 (=> (not res!252537) (not e!254481))))

(assert (=> b!429827 (= res!252537 (and (= (size!12963 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12962 _keys!709) (size!12963 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429819 () Bool)

(declare-fun res!252546 () Bool)

(assert (=> b!429819 (=> (not res!252546) (not e!254481))))

(assert (=> b!429819 (= res!252546 (or (= (select (arr!12609 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12609 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!252536 () Bool)

(assert (=> start!39812 (=> (not res!252536) (not e!254481))))

(assert (=> start!39812 (= res!252536 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12962 _keys!709))))))

(assert (=> start!39812 e!254481))

(assert (=> start!39812 tp_is_empty!11245))

(assert (=> start!39812 tp!35808))

(assert (=> start!39812 true))

(declare-fun e!254483 () Bool)

(declare-fun array_inv!9214 (array!26321) Bool)

(assert (=> start!39812 (and (array_inv!9214 _values!549) e!254483)))

(declare-fun array_inv!9215 (array!26319) Bool)

(assert (=> start!39812 (array_inv!9215 _keys!709)))

(declare-fun b!429828 () Bool)

(declare-fun res!252540 () Bool)

(assert (=> b!429828 (=> (not res!252540) (not e!254481))))

(assert (=> b!429828 (= res!252540 (validKeyInArray!0 k0!794))))

(declare-fun b!429829 () Bool)

(declare-fun e!254480 () Bool)

(assert (=> b!429829 (= e!254480 tp_is_empty!11245)))

(declare-fun b!429830 () Bool)

(declare-fun mapRes!18489 () Bool)

(assert (=> b!429830 (= e!254483 (and e!254484 mapRes!18489))))

(declare-fun condMapEmpty!18489 () Bool)

(declare-fun mapDefault!18489 () ValueCell!5279)

(assert (=> b!429830 (= condMapEmpty!18489 (= (arr!12610 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5279)) mapDefault!18489)))))

(declare-fun mapIsEmpty!18489 () Bool)

(assert (=> mapIsEmpty!18489 mapRes!18489))

(declare-fun mapNonEmpty!18489 () Bool)

(declare-fun tp!35807 () Bool)

(assert (=> mapNonEmpty!18489 (= mapRes!18489 (and tp!35807 e!254480))))

(declare-fun mapValue!18489 () ValueCell!5279)

(declare-fun mapKey!18489 () (_ BitVec 32))

(declare-fun mapRest!18489 () (Array (_ BitVec 32) ValueCell!5279))

(assert (=> mapNonEmpty!18489 (= (arr!12610 _values!549) (store mapRest!18489 mapKey!18489 mapValue!18489))))

(declare-fun b!429831 () Bool)

(assert (=> b!429831 (= e!254479 e!254485)))

(declare-fun res!252544 () Bool)

(assert (=> b!429831 (=> res!252544 e!254485)))

(assert (=> b!429831 (= res!252544 (= k0!794 (select (arr!12609 _keys!709) from!863)))))

(assert (=> b!429831 (not (= (select (arr!12609 _keys!709) from!863) k0!794))))

(declare-fun lt!196367 () Unit!12641)

(assert (=> b!429831 (= lt!196367 e!254487)))

(declare-fun c!55404 () Bool)

(assert (=> b!429831 (= c!55404 (= (select (arr!12609 _keys!709) from!863) k0!794))))

(assert (=> b!429831 (= lt!196369 lt!196374)))

(assert (=> b!429831 (= lt!196374 (+!1380 lt!196373 lt!196362))))

(assert (=> b!429831 (= lt!196362 (tuple2!7473 (select (arr!12609 _keys!709) from!863) lt!196364))))

(declare-fun get!6256 (ValueCell!5279 V!16099) V!16099)

(declare-fun dynLambda!774 (Int (_ BitVec 64)) V!16099)

(assert (=> b!429831 (= lt!196364 (get!6256 (select (arr!12610 _values!549) from!863) (dynLambda!774 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429832 () Bool)

(assert (=> b!429832 (= e!254481 e!254486)))

(declare-fun res!252545 () Bool)

(assert (=> b!429832 (=> (not res!252545) (not e!254486))))

(assert (=> b!429832 (= res!252545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196370 mask!1025))))

(assert (=> b!429832 (= lt!196370 (array!26320 (store (arr!12609 _keys!709) i!563 k0!794) (size!12962 _keys!709)))))

(assert (= (and start!39812 res!252536) b!429822))

(assert (= (and b!429822 res!252533) b!429827))

(assert (= (and b!429827 res!252537) b!429815))

(assert (= (and b!429815 res!252535) b!429825))

(assert (= (and b!429825 res!252538) b!429814))

(assert (= (and b!429814 res!252541) b!429828))

(assert (= (and b!429828 res!252540) b!429819))

(assert (= (and b!429819 res!252546) b!429820))

(assert (= (and b!429820 res!252532) b!429832))

(assert (= (and b!429832 res!252545) b!429823))

(assert (= (and b!429823 res!252534) b!429826))

(assert (= (and b!429826 res!252543) b!429821))

(assert (= (and b!429821 res!252542) b!429813))

(assert (= (and b!429813 (not res!252539)) b!429831))

(assert (= (and b!429831 c!55404) b!429816))

(assert (= (and b!429831 (not c!55404)) b!429824))

(assert (= (and b!429831 (not res!252544)) b!429817))

(assert (= (and b!429830 condMapEmpty!18489) mapIsEmpty!18489))

(assert (= (and b!429830 (not condMapEmpty!18489)) mapNonEmpty!18489))

(get-info :version)

(assert (= (and mapNonEmpty!18489 ((_ is ValueCellFull!5279) mapValue!18489)) b!429829))

(assert (= (and b!429830 ((_ is ValueCellFull!5279) mapDefault!18489)) b!429818))

(assert (= start!39812 b!429830))

(declare-fun b_lambda!9163 () Bool)

(assert (=> (not b_lambda!9163) (not b!429831)))

(declare-fun t!13001 () Bool)

(declare-fun tb!3491 () Bool)

(assert (=> (and start!39812 (= defaultEntry!557 defaultEntry!557) t!13001) tb!3491))

(declare-fun result!6517 () Bool)

(assert (=> tb!3491 (= result!6517 tp_is_empty!11245)))

(assert (=> b!429831 t!13001))

(declare-fun b_and!17821 () Bool)

(assert (= b_and!17819 (and (=> t!13001 result!6517) b_and!17821)))

(declare-fun m!417585 () Bool)

(assert (=> b!429825 m!417585))

(declare-fun m!417587 () Bool)

(assert (=> b!429816 m!417587))

(declare-fun m!417589 () Bool)

(assert (=> b!429828 m!417589))

(declare-fun m!417591 () Bool)

(assert (=> b!429822 m!417591))

(declare-fun m!417593 () Bool)

(assert (=> b!429832 m!417593))

(declare-fun m!417595 () Bool)

(assert (=> b!429832 m!417595))

(declare-fun m!417597 () Bool)

(assert (=> b!429831 m!417597))

(declare-fun m!417599 () Bool)

(assert (=> b!429831 m!417599))

(declare-fun m!417601 () Bool)

(assert (=> b!429831 m!417601))

(assert (=> b!429831 m!417601))

(assert (=> b!429831 m!417599))

(declare-fun m!417603 () Bool)

(assert (=> b!429831 m!417603))

(declare-fun m!417605 () Bool)

(assert (=> b!429831 m!417605))

(assert (=> b!429813 m!417597))

(declare-fun m!417607 () Bool)

(assert (=> b!429813 m!417607))

(declare-fun m!417609 () Bool)

(assert (=> b!429813 m!417609))

(assert (=> b!429813 m!417597))

(declare-fun m!417611 () Bool)

(assert (=> b!429813 m!417611))

(declare-fun m!417613 () Bool)

(assert (=> b!429813 m!417613))

(declare-fun m!417615 () Bool)

(assert (=> b!429813 m!417615))

(declare-fun m!417617 () Bool)

(assert (=> start!39812 m!417617))

(declare-fun m!417619 () Bool)

(assert (=> start!39812 m!417619))

(declare-fun m!417621 () Bool)

(assert (=> b!429819 m!417621))

(declare-fun m!417623 () Bool)

(assert (=> b!429821 m!417623))

(declare-fun m!417625 () Bool)

(assert (=> b!429821 m!417625))

(declare-fun m!417627 () Bool)

(assert (=> b!429821 m!417627))

(declare-fun m!417629 () Bool)

(assert (=> b!429820 m!417629))

(declare-fun m!417631 () Bool)

(assert (=> b!429823 m!417631))

(declare-fun m!417633 () Bool)

(assert (=> b!429817 m!417633))

(assert (=> b!429817 m!417633))

(declare-fun m!417635 () Bool)

(assert (=> b!429817 m!417635))

(assert (=> b!429817 m!417597))

(assert (=> b!429817 m!417597))

(declare-fun m!417637 () Bool)

(assert (=> b!429817 m!417637))

(declare-fun m!417639 () Bool)

(assert (=> b!429815 m!417639))

(declare-fun m!417641 () Bool)

(assert (=> mapNonEmpty!18489 m!417641))

(check-sat (not b!429828) (not b_next!10093) (not b!429823) (not b!429815) (not b!429817) tp_is_empty!11245 b_and!17821 (not b_lambda!9163) (not b!429825) (not b!429820) (not b!429813) (not b!429831) (not b!429816) (not start!39812) (not mapNonEmpty!18489) (not b!429821) (not b!429822) (not b!429832))
(check-sat b_and!17821 (not b_next!10093))
