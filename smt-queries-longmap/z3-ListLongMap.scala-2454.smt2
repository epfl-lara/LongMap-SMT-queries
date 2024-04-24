; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38528 () Bool)

(assert start!38528)

(declare-fun b_free!9079 () Bool)

(declare-fun b_next!9079 () Bool)

(assert (=> start!38528 (= b_free!9079 (not b_next!9079))))

(declare-fun tp!32361 () Bool)

(declare-fun b_and!16479 () Bool)

(assert (=> start!38528 (= tp!32361 b_and!16479)))

(declare-fun b!398424 () Bool)

(declare-fun e!240801 () Bool)

(assert (=> b!398424 (= e!240801 (not true))))

(declare-fun e!240805 () Bool)

(assert (=> b!398424 e!240805))

(declare-fun c!54552 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398424 (= c!54552 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14387 0))(
  ( (V!14388 (val!5025 Int)) )
))
(declare-fun minValue!515 () V!14387)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4637 0))(
  ( (ValueCellFull!4637 (v!7273 V!14387)) (EmptyCell!4637) )
))
(declare-datatypes ((array!23814 0))(
  ( (array!23815 (arr!11356 (Array (_ BitVec 32) ValueCell!4637)) (size!11708 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23814)

(declare-fun zeroValue!515 () V!14387)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12047 0))(
  ( (Unit!12048) )
))
(declare-fun lt!187482 () Unit!12047)

(declare-fun v!412 () V!14387)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!23816 0))(
  ( (array!23817 (arr!11357 (Array (_ BitVec 32) (_ BitVec 64))) (size!11709 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23816)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!291 (array!23816 array!23814 (_ BitVec 32) (_ BitVec 32) V!14387 V!14387 (_ BitVec 32) (_ BitVec 64) V!14387 (_ BitVec 32) Int) Unit!12047)

(assert (=> b!398424 (= lt!187482 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!291 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((tuple2!6510 0))(
  ( (tuple2!6511 (_1!3266 (_ BitVec 64)) (_2!3266 V!14387)) )
))
(declare-datatypes ((List!6430 0))(
  ( (Nil!6427) (Cons!6426 (h!7282 tuple2!6510) (t!11596 List!6430)) )
))
(declare-datatypes ((ListLongMap!5425 0))(
  ( (ListLongMap!5426 (toList!2728 List!6430)) )
))
(declare-fun call!27889 () ListLongMap!5425)

(declare-fun lt!187481 () array!23816)

(declare-fun bm!27885 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!989 (array!23816 array!23814 (_ BitVec 32) (_ BitVec 32) V!14387 V!14387 (_ BitVec 32) Int) ListLongMap!5425)

(assert (=> bm!27885 (= call!27889 (getCurrentListMapNoExtraKeys!989 (ite c!54552 _keys!709 lt!187481) (ite c!54552 _values!549 (array!23815 (store (arr!11356 _values!549) i!563 (ValueCellFull!4637 v!412)) (size!11708 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16563 () Bool)

(declare-fun mapRes!16563 () Bool)

(declare-fun tp!32360 () Bool)

(declare-fun e!240803 () Bool)

(assert (=> mapNonEmpty!16563 (= mapRes!16563 (and tp!32360 e!240803))))

(declare-fun mapRest!16563 () (Array (_ BitVec 32) ValueCell!4637))

(declare-fun mapKey!16563 () (_ BitVec 32))

(declare-fun mapValue!16563 () ValueCell!4637)

(assert (=> mapNonEmpty!16563 (= (arr!11356 _values!549) (store mapRest!16563 mapKey!16563 mapValue!16563))))

(declare-fun b!398425 () Bool)

(declare-fun res!228994 () Bool)

(declare-fun e!240800 () Bool)

(assert (=> b!398425 (=> (not res!228994) (not e!240800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398425 (= res!228994 (validMask!0 mask!1025))))

(declare-fun b!398426 () Bool)

(declare-fun res!228999 () Bool)

(assert (=> b!398426 (=> (not res!228999) (not e!240800))))

(assert (=> b!398426 (= res!228999 (and (= (size!11708 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11709 _keys!709) (size!11708 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398428 () Bool)

(assert (=> b!398428 (= e!240800 e!240801)))

(declare-fun res!229001 () Bool)

(assert (=> b!398428 (=> (not res!229001) (not e!240801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23816 (_ BitVec 32)) Bool)

(assert (=> b!398428 (= res!229001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187481 mask!1025))))

(assert (=> b!398428 (= lt!187481 (array!23817 (store (arr!11357 _keys!709) i!563 k0!794) (size!11709 _keys!709)))))

(declare-fun mapIsEmpty!16563 () Bool)

(assert (=> mapIsEmpty!16563 mapRes!16563))

(declare-fun b!398429 () Bool)

(declare-fun res!228992 () Bool)

(assert (=> b!398429 (=> (not res!228992) (not e!240800))))

(declare-fun arrayContainsKey!0 (array!23816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398429 (= res!228992 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!398430 () Bool)

(declare-fun res!229002 () Bool)

(assert (=> b!398430 (=> (not res!229002) (not e!240801))))

(declare-datatypes ((List!6431 0))(
  ( (Nil!6428) (Cons!6427 (h!7283 (_ BitVec 64)) (t!11597 List!6431)) )
))
(declare-fun arrayNoDuplicates!0 (array!23816 (_ BitVec 32) List!6431) Bool)

(assert (=> b!398430 (= res!229002 (arrayNoDuplicates!0 lt!187481 #b00000000000000000000000000000000 Nil!6428))))

(declare-fun b!398431 () Bool)

(declare-fun res!228993 () Bool)

(assert (=> b!398431 (=> (not res!228993) (not e!240800))))

(assert (=> b!398431 (= res!228993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398432 () Bool)

(declare-fun res!228995 () Bool)

(assert (=> b!398432 (=> (not res!228995) (not e!240800))))

(assert (=> b!398432 (= res!228995 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6428))))

(declare-fun b!398433 () Bool)

(declare-fun res!228996 () Bool)

(assert (=> b!398433 (=> (not res!228996) (not e!240801))))

(assert (=> b!398433 (= res!228996 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11709 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!398434 () Bool)

(declare-fun e!240804 () Bool)

(declare-fun tp_is_empty!9961 () Bool)

(assert (=> b!398434 (= e!240804 tp_is_empty!9961)))

(declare-fun b!398435 () Bool)

(declare-fun call!27888 () ListLongMap!5425)

(assert (=> b!398435 (= e!240805 (= call!27889 call!27888))))

(declare-fun b!398436 () Bool)

(declare-fun +!1082 (ListLongMap!5425 tuple2!6510) ListLongMap!5425)

(assert (=> b!398436 (= e!240805 (= call!27888 (+!1082 call!27889 (tuple2!6511 k0!794 v!412))))))

(declare-fun b!398437 () Bool)

(declare-fun res!229000 () Bool)

(assert (=> b!398437 (=> (not res!229000) (not e!240800))))

(assert (=> b!398437 (= res!229000 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11709 _keys!709))))))

(declare-fun res!228997 () Bool)

(assert (=> start!38528 (=> (not res!228997) (not e!240800))))

(assert (=> start!38528 (= res!228997 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11709 _keys!709))))))

(assert (=> start!38528 e!240800))

(assert (=> start!38528 tp_is_empty!9961))

(assert (=> start!38528 tp!32361))

(assert (=> start!38528 true))

(declare-fun e!240799 () Bool)

(declare-fun array_inv!8390 (array!23814) Bool)

(assert (=> start!38528 (and (array_inv!8390 _values!549) e!240799)))

(declare-fun array_inv!8391 (array!23816) Bool)

(assert (=> start!38528 (array_inv!8391 _keys!709)))

(declare-fun b!398427 () Bool)

(declare-fun res!228998 () Bool)

(assert (=> b!398427 (=> (not res!228998) (not e!240800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398427 (= res!228998 (validKeyInArray!0 k0!794))))

(declare-fun bm!27886 () Bool)

(assert (=> bm!27886 (= call!27888 (getCurrentListMapNoExtraKeys!989 (ite c!54552 lt!187481 _keys!709) (ite c!54552 (array!23815 (store (arr!11356 _values!549) i!563 (ValueCellFull!4637 v!412)) (size!11708 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398438 () Bool)

(assert (=> b!398438 (= e!240803 tp_is_empty!9961)))

(declare-fun b!398439 () Bool)

(declare-fun res!228991 () Bool)

(assert (=> b!398439 (=> (not res!228991) (not e!240800))))

(assert (=> b!398439 (= res!228991 (or (= (select (arr!11357 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11357 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398440 () Bool)

(assert (=> b!398440 (= e!240799 (and e!240804 mapRes!16563))))

(declare-fun condMapEmpty!16563 () Bool)

(declare-fun mapDefault!16563 () ValueCell!4637)

(assert (=> b!398440 (= condMapEmpty!16563 (= (arr!11356 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4637)) mapDefault!16563)))))

(assert (= (and start!38528 res!228997) b!398425))

(assert (= (and b!398425 res!228994) b!398426))

(assert (= (and b!398426 res!228999) b!398431))

(assert (= (and b!398431 res!228993) b!398432))

(assert (= (and b!398432 res!228995) b!398437))

(assert (= (and b!398437 res!229000) b!398427))

(assert (= (and b!398427 res!228998) b!398439))

(assert (= (and b!398439 res!228991) b!398429))

(assert (= (and b!398429 res!228992) b!398428))

(assert (= (and b!398428 res!229001) b!398430))

(assert (= (and b!398430 res!229002) b!398433))

(assert (= (and b!398433 res!228996) b!398424))

(assert (= (and b!398424 c!54552) b!398436))

(assert (= (and b!398424 (not c!54552)) b!398435))

(assert (= (or b!398436 b!398435) bm!27886))

(assert (= (or b!398436 b!398435) bm!27885))

(assert (= (and b!398440 condMapEmpty!16563) mapIsEmpty!16563))

(assert (= (and b!398440 (not condMapEmpty!16563)) mapNonEmpty!16563))

(get-info :version)

(assert (= (and mapNonEmpty!16563 ((_ is ValueCellFull!4637) mapValue!16563)) b!398438))

(assert (= (and b!398440 ((_ is ValueCellFull!4637) mapDefault!16563)) b!398434))

(assert (= start!38528 b!398440))

(declare-fun m!393549 () Bool)

(assert (=> b!398431 m!393549))

(declare-fun m!393551 () Bool)

(assert (=> b!398425 m!393551))

(declare-fun m!393553 () Bool)

(assert (=> b!398424 m!393553))

(declare-fun m!393555 () Bool)

(assert (=> bm!27886 m!393555))

(declare-fun m!393557 () Bool)

(assert (=> bm!27886 m!393557))

(declare-fun m!393559 () Bool)

(assert (=> b!398429 m!393559))

(declare-fun m!393561 () Bool)

(assert (=> b!398430 m!393561))

(declare-fun m!393563 () Bool)

(assert (=> b!398436 m!393563))

(declare-fun m!393565 () Bool)

(assert (=> b!398428 m!393565))

(declare-fun m!393567 () Bool)

(assert (=> b!398428 m!393567))

(declare-fun m!393569 () Bool)

(assert (=> b!398439 m!393569))

(declare-fun m!393571 () Bool)

(assert (=> start!38528 m!393571))

(declare-fun m!393573 () Bool)

(assert (=> start!38528 m!393573))

(assert (=> bm!27885 m!393555))

(declare-fun m!393575 () Bool)

(assert (=> bm!27885 m!393575))

(declare-fun m!393577 () Bool)

(assert (=> b!398427 m!393577))

(declare-fun m!393579 () Bool)

(assert (=> b!398432 m!393579))

(declare-fun m!393581 () Bool)

(assert (=> mapNonEmpty!16563 m!393581))

(check-sat (not b!398436) (not start!38528) (not b!398424) (not b!398427) (not b!398429) b_and!16479 (not b!398432) (not bm!27886) tp_is_empty!9961 (not b!398430) (not b!398428) (not mapNonEmpty!16563) (not b!398431) (not b!398425) (not bm!27885) (not b_next!9079))
(check-sat b_and!16479 (not b_next!9079))
