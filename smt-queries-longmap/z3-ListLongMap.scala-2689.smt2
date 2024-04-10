; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39954 () Bool)

(assert start!39954)

(declare-fun b_free!10221 () Bool)

(declare-fun b_next!10221 () Bool)

(assert (=> start!39954 (= b_free!10221 (not b_next!10221))))

(declare-fun tp!36191 () Bool)

(declare-fun b_and!18101 () Bool)

(assert (=> start!39954 (= tp!36191 b_and!18101)))

(declare-fun b!434052 () Bool)

(declare-fun res!255542 () Bool)

(declare-fun e!256581 () Bool)

(assert (=> b!434052 (=> (not res!255542) (not e!256581))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!434052 (= res!255542 (bvsle from!863 i!563))))

(declare-fun b!434053 () Bool)

(declare-fun res!255552 () Bool)

(assert (=> b!434053 (=> (not res!255552) (not e!256581))))

(declare-datatypes ((array!26579 0))(
  ( (array!26580 (arr!12739 (Array (_ BitVec 32) (_ BitVec 64))) (size!13091 (_ BitVec 32))) )
))
(declare-fun lt!199478 () array!26579)

(declare-datatypes ((List!7585 0))(
  ( (Nil!7582) (Cons!7581 (h!8437 (_ BitVec 64)) (t!13255 List!7585)) )
))
(declare-fun arrayNoDuplicates!0 (array!26579 (_ BitVec 32) List!7585) Bool)

(assert (=> b!434053 (= res!255552 (arrayNoDuplicates!0 lt!199478 #b00000000000000000000000000000000 Nil!7582))))

(declare-fun b!434054 () Bool)

(declare-fun res!255547 () Bool)

(declare-fun e!256580 () Bool)

(assert (=> b!434054 (=> (not res!255547) (not e!256580))))

(declare-fun _keys!709 () array!26579)

(assert (=> b!434054 (= res!255547 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7582))))

(declare-fun b!434055 () Bool)

(declare-fun e!256573 () Bool)

(declare-fun tp_is_empty!11373 () Bool)

(assert (=> b!434055 (= e!256573 tp_is_empty!11373)))

(declare-fun b!434057 () Bool)

(declare-datatypes ((Unit!12862 0))(
  ( (Unit!12863) )
))
(declare-fun e!256572 () Unit!12862)

(declare-fun Unit!12864 () Unit!12862)

(assert (=> b!434057 (= e!256572 Unit!12864)))

(declare-fun lt!199482 () Unit!12862)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26579 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12862)

(assert (=> b!434057 (= lt!199482 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434057 false))

(declare-fun b!434058 () Bool)

(declare-fun res!255554 () Bool)

(assert (=> b!434058 (=> (not res!255554) (not e!256580))))

(declare-fun arrayContainsKey!0 (array!26579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434058 (= res!255554 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!434059 () Bool)

(declare-fun res!255549 () Bool)

(assert (=> b!434059 (=> (not res!255549) (not e!256580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434059 (= res!255549 (validKeyInArray!0 k0!794))))

(declare-fun b!434060 () Bool)

(declare-fun e!256577 () Bool)

(declare-fun mapRes!18681 () Bool)

(assert (=> b!434060 (= e!256577 (and e!256573 mapRes!18681))))

(declare-fun condMapEmpty!18681 () Bool)

(declare-datatypes ((V!16269 0))(
  ( (V!16270 (val!5731 Int)) )
))
(declare-datatypes ((ValueCell!5343 0))(
  ( (ValueCellFull!5343 (v!7978 V!16269)) (EmptyCell!5343) )
))
(declare-datatypes ((array!26581 0))(
  ( (array!26582 (arr!12740 (Array (_ BitVec 32) ValueCell!5343)) (size!13092 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26581)

(declare-fun mapDefault!18681 () ValueCell!5343)

(assert (=> b!434060 (= condMapEmpty!18681 (= (arr!12740 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5343)) mapDefault!18681)))))

(declare-fun b!434061 () Bool)

(assert (=> b!434061 (= e!256580 e!256581)))

(declare-fun res!255551 () Bool)

(assert (=> b!434061 (=> (not res!255551) (not e!256581))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26579 (_ BitVec 32)) Bool)

(assert (=> b!434061 (= res!255551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199478 mask!1025))))

(assert (=> b!434061 (= lt!199478 (array!26580 (store (arr!12739 _keys!709) i!563 k0!794) (size!13091 _keys!709)))))

(declare-fun b!434062 () Bool)

(declare-fun res!255544 () Bool)

(assert (=> b!434062 (=> (not res!255544) (not e!256580))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!434062 (= res!255544 (and (= (size!13092 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13091 _keys!709) (size!13092 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!434063 () Bool)

(declare-fun e!256579 () Bool)

(assert (=> b!434063 (= e!256579 tp_is_empty!11373)))

(declare-fun b!434064 () Bool)

(declare-fun e!256578 () Bool)

(assert (=> b!434064 (= e!256581 e!256578)))

(declare-fun res!255546 () Bool)

(assert (=> b!434064 (=> (not res!255546) (not e!256578))))

(assert (=> b!434064 (= res!255546 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16269)

(declare-fun zeroValue!515 () V!16269)

(declare-datatypes ((tuple2!7580 0))(
  ( (tuple2!7581 (_1!3801 (_ BitVec 64)) (_2!3801 V!16269)) )
))
(declare-datatypes ((List!7586 0))(
  ( (Nil!7583) (Cons!7582 (h!8438 tuple2!7580) (t!13256 List!7586)) )
))
(declare-datatypes ((ListLongMap!6493 0))(
  ( (ListLongMap!6494 (toList!3262 List!7586)) )
))
(declare-fun lt!199483 () ListLongMap!6493)

(declare-fun lt!199488 () array!26581)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1456 (array!26579 array!26581 (_ BitVec 32) (_ BitVec 32) V!16269 V!16269 (_ BitVec 32) Int) ListLongMap!6493)

(assert (=> b!434064 (= lt!199483 (getCurrentListMapNoExtraKeys!1456 lt!199478 lt!199488 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16269)

(assert (=> b!434064 (= lt!199488 (array!26582 (store (arr!12740 _values!549) i!563 (ValueCellFull!5343 v!412)) (size!13092 _values!549)))))

(declare-fun lt!199489 () ListLongMap!6493)

(assert (=> b!434064 (= lt!199489 (getCurrentListMapNoExtraKeys!1456 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!434065 () Bool)

(declare-fun e!256576 () Bool)

(assert (=> b!434065 (= e!256578 (not e!256576))))

(declare-fun res!255555 () Bool)

(assert (=> b!434065 (=> res!255555 e!256576)))

(assert (=> b!434065 (= res!255555 (not (validKeyInArray!0 (select (arr!12739 _keys!709) from!863))))))

(declare-fun lt!199486 () ListLongMap!6493)

(declare-fun lt!199480 () ListLongMap!6493)

(assert (=> b!434065 (= lt!199486 lt!199480)))

(declare-fun lt!199485 () ListLongMap!6493)

(declare-fun lt!199477 () tuple2!7580)

(declare-fun +!1410 (ListLongMap!6493 tuple2!7580) ListLongMap!6493)

(assert (=> b!434065 (= lt!199480 (+!1410 lt!199485 lt!199477))))

(assert (=> b!434065 (= lt!199486 (getCurrentListMapNoExtraKeys!1456 lt!199478 lt!199488 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!434065 (= lt!199477 (tuple2!7581 k0!794 v!412))))

(assert (=> b!434065 (= lt!199485 (getCurrentListMapNoExtraKeys!1456 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199484 () Unit!12862)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!587 (array!26579 array!26581 (_ BitVec 32) (_ BitVec 32) V!16269 V!16269 (_ BitVec 32) (_ BitVec 64) V!16269 (_ BitVec 32) Int) Unit!12862)

(assert (=> b!434065 (= lt!199484 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!587 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18681 () Bool)

(declare-fun tp!36192 () Bool)

(assert (=> mapNonEmpty!18681 (= mapRes!18681 (and tp!36192 e!256579))))

(declare-fun mapKey!18681 () (_ BitVec 32))

(declare-fun mapRest!18681 () (Array (_ BitVec 32) ValueCell!5343))

(declare-fun mapValue!18681 () ValueCell!5343)

(assert (=> mapNonEmpty!18681 (= (arr!12740 _values!549) (store mapRest!18681 mapKey!18681 mapValue!18681))))

(declare-fun b!434066 () Bool)

(declare-fun Unit!12865 () Unit!12862)

(assert (=> b!434066 (= e!256572 Unit!12865)))

(declare-fun b!434067 () Bool)

(declare-fun e!256574 () Bool)

(assert (=> b!434067 (= e!256576 e!256574)))

(declare-fun res!255553 () Bool)

(assert (=> b!434067 (=> res!255553 e!256574)))

(assert (=> b!434067 (= res!255553 (= k0!794 (select (arr!12739 _keys!709) from!863)))))

(assert (=> b!434067 (not (= (select (arr!12739 _keys!709) from!863) k0!794))))

(declare-fun lt!199487 () Unit!12862)

(assert (=> b!434067 (= lt!199487 e!256572)))

(declare-fun c!55667 () Bool)

(assert (=> b!434067 (= c!55667 (= (select (arr!12739 _keys!709) from!863) k0!794))))

(declare-fun lt!199490 () ListLongMap!6493)

(assert (=> b!434067 (= lt!199483 lt!199490)))

(declare-fun lt!199479 () tuple2!7580)

(assert (=> b!434067 (= lt!199490 (+!1410 lt!199480 lt!199479))))

(declare-fun lt!199476 () V!16269)

(assert (=> b!434067 (= lt!199479 (tuple2!7581 (select (arr!12739 _keys!709) from!863) lt!199476))))

(declare-fun get!6342 (ValueCell!5343 V!16269) V!16269)

(declare-fun dynLambda!821 (Int (_ BitVec 64)) V!16269)

(assert (=> b!434067 (= lt!199476 (get!6342 (select (arr!12740 _values!549) from!863) (dynLambda!821 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434068 () Bool)

(declare-fun res!255541 () Bool)

(assert (=> b!434068 (=> (not res!255541) (not e!256580))))

(assert (=> b!434068 (= res!255541 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13091 _keys!709))))))

(declare-fun res!255548 () Bool)

(assert (=> start!39954 (=> (not res!255548) (not e!256580))))

(assert (=> start!39954 (= res!255548 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13091 _keys!709))))))

(assert (=> start!39954 e!256580))

(assert (=> start!39954 tp_is_empty!11373))

(assert (=> start!39954 tp!36191))

(assert (=> start!39954 true))

(declare-fun array_inv!9268 (array!26581) Bool)

(assert (=> start!39954 (and (array_inv!9268 _values!549) e!256577)))

(declare-fun array_inv!9269 (array!26579) Bool)

(assert (=> start!39954 (array_inv!9269 _keys!709)))

(declare-fun b!434056 () Bool)

(declare-fun res!255545 () Bool)

(assert (=> b!434056 (=> (not res!255545) (not e!256580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434056 (= res!255545 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18681 () Bool)

(assert (=> mapIsEmpty!18681 mapRes!18681))

(declare-fun b!434069 () Bool)

(declare-fun res!255550 () Bool)

(assert (=> b!434069 (=> (not res!255550) (not e!256580))))

(assert (=> b!434069 (= res!255550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434070 () Bool)

(assert (=> b!434070 (= e!256574 true)))

(assert (=> b!434070 (= lt!199490 (+!1410 (+!1410 lt!199485 lt!199479) lt!199477))))

(declare-fun lt!199481 () Unit!12862)

(declare-fun addCommutativeForDiffKeys!397 (ListLongMap!6493 (_ BitVec 64) V!16269 (_ BitVec 64) V!16269) Unit!12862)

(assert (=> b!434070 (= lt!199481 (addCommutativeForDiffKeys!397 lt!199485 k0!794 v!412 (select (arr!12739 _keys!709) from!863) lt!199476))))

(declare-fun b!434071 () Bool)

(declare-fun res!255543 () Bool)

(assert (=> b!434071 (=> (not res!255543) (not e!256580))))

(assert (=> b!434071 (= res!255543 (or (= (select (arr!12739 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12739 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39954 res!255548) b!434056))

(assert (= (and b!434056 res!255545) b!434062))

(assert (= (and b!434062 res!255544) b!434069))

(assert (= (and b!434069 res!255550) b!434054))

(assert (= (and b!434054 res!255547) b!434068))

(assert (= (and b!434068 res!255541) b!434059))

(assert (= (and b!434059 res!255549) b!434071))

(assert (= (and b!434071 res!255543) b!434058))

(assert (= (and b!434058 res!255554) b!434061))

(assert (= (and b!434061 res!255551) b!434053))

(assert (= (and b!434053 res!255552) b!434052))

(assert (= (and b!434052 res!255542) b!434064))

(assert (= (and b!434064 res!255546) b!434065))

(assert (= (and b!434065 (not res!255555)) b!434067))

(assert (= (and b!434067 c!55667) b!434057))

(assert (= (and b!434067 (not c!55667)) b!434066))

(assert (= (and b!434067 (not res!255553)) b!434070))

(assert (= (and b!434060 condMapEmpty!18681) mapIsEmpty!18681))

(assert (= (and b!434060 (not condMapEmpty!18681)) mapNonEmpty!18681))

(get-info :version)

(assert (= (and mapNonEmpty!18681 ((_ is ValueCellFull!5343) mapValue!18681)) b!434063))

(assert (= (and b!434060 ((_ is ValueCellFull!5343) mapDefault!18681)) b!434055))

(assert (= start!39954 b!434060))

(declare-fun b_lambda!9309 () Bool)

(assert (=> (not b_lambda!9309) (not b!434067)))

(declare-fun t!13254 () Bool)

(declare-fun tb!3627 () Bool)

(assert (=> (and start!39954 (= defaultEntry!557 defaultEntry!557) t!13254) tb!3627))

(declare-fun result!6781 () Bool)

(assert (=> tb!3627 (= result!6781 tp_is_empty!11373)))

(assert (=> b!434067 t!13254))

(declare-fun b_and!18103 () Bool)

(assert (= b_and!18101 (and (=> t!13254 result!6781) b_and!18103)))

(declare-fun m!422029 () Bool)

(assert (=> b!434067 m!422029))

(declare-fun m!422031 () Bool)

(assert (=> b!434067 m!422031))

(assert (=> b!434067 m!422031))

(assert (=> b!434067 m!422029))

(declare-fun m!422033 () Bool)

(assert (=> b!434067 m!422033))

(declare-fun m!422035 () Bool)

(assert (=> b!434067 m!422035))

(declare-fun m!422037 () Bool)

(assert (=> b!434067 m!422037))

(declare-fun m!422039 () Bool)

(assert (=> b!434057 m!422039))

(declare-fun m!422041 () Bool)

(assert (=> b!434053 m!422041))

(declare-fun m!422043 () Bool)

(assert (=> b!434056 m!422043))

(declare-fun m!422045 () Bool)

(assert (=> b!434059 m!422045))

(declare-fun m!422047 () Bool)

(assert (=> b!434061 m!422047))

(declare-fun m!422049 () Bool)

(assert (=> b!434061 m!422049))

(declare-fun m!422051 () Bool)

(assert (=> b!434054 m!422051))

(declare-fun m!422053 () Bool)

(assert (=> start!39954 m!422053))

(declare-fun m!422055 () Bool)

(assert (=> start!39954 m!422055))

(declare-fun m!422057 () Bool)

(assert (=> b!434070 m!422057))

(assert (=> b!434070 m!422057))

(declare-fun m!422059 () Bool)

(assert (=> b!434070 m!422059))

(assert (=> b!434070 m!422035))

(assert (=> b!434070 m!422035))

(declare-fun m!422061 () Bool)

(assert (=> b!434070 m!422061))

(assert (=> b!434065 m!422035))

(declare-fun m!422063 () Bool)

(assert (=> b!434065 m!422063))

(declare-fun m!422065 () Bool)

(assert (=> b!434065 m!422065))

(declare-fun m!422067 () Bool)

(assert (=> b!434065 m!422067))

(assert (=> b!434065 m!422035))

(declare-fun m!422069 () Bool)

(assert (=> b!434065 m!422069))

(declare-fun m!422071 () Bool)

(assert (=> b!434065 m!422071))

(declare-fun m!422073 () Bool)

(assert (=> mapNonEmpty!18681 m!422073))

(declare-fun m!422075 () Bool)

(assert (=> b!434069 m!422075))

(declare-fun m!422077 () Bool)

(assert (=> b!434058 m!422077))

(declare-fun m!422079 () Bool)

(assert (=> b!434064 m!422079))

(declare-fun m!422081 () Bool)

(assert (=> b!434064 m!422081))

(declare-fun m!422083 () Bool)

(assert (=> b!434064 m!422083))

(declare-fun m!422085 () Bool)

(assert (=> b!434071 m!422085))

(check-sat tp_is_empty!11373 (not b!434065) (not b!434054) b_and!18103 (not b!434064) (not start!39954) (not b!434053) (not b!434061) (not b!434058) (not b!434070) (not b_lambda!9309) (not b!434056) (not b!434059) (not b_next!10221) (not b!434069) (not b!434057) (not b!434067) (not mapNonEmpty!18681))
(check-sat b_and!18103 (not b_next!10221))
