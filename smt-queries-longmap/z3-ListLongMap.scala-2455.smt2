; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38534 () Bool)

(assert start!38534)

(declare-fun b_free!9085 () Bool)

(declare-fun b_next!9085 () Bool)

(assert (=> start!38534 (= b_free!9085 (not b_next!9085))))

(declare-fun tp!32379 () Bool)

(declare-fun b_and!16445 () Bool)

(assert (=> start!38534 (= tp!32379 b_and!16445)))

(declare-fun b!398355 () Bool)

(declare-fun res!228982 () Bool)

(declare-fun e!240721 () Bool)

(assert (=> b!398355 (=> (not res!228982) (not e!240721))))

(declare-datatypes ((array!23823 0))(
  ( (array!23824 (arr!11361 (Array (_ BitVec 32) (_ BitVec 64))) (size!11714 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23823)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398355 (= res!228982 (or (= (select (arr!11361 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11361 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16572 () Bool)

(declare-fun mapRes!16572 () Bool)

(declare-fun tp!32378 () Bool)

(declare-fun e!240720 () Bool)

(assert (=> mapNonEmpty!16572 (= mapRes!16572 (and tp!32378 e!240720))))

(declare-datatypes ((V!14395 0))(
  ( (V!14396 (val!5028 Int)) )
))
(declare-datatypes ((ValueCell!4640 0))(
  ( (ValueCellFull!4640 (v!7269 V!14395)) (EmptyCell!4640) )
))
(declare-datatypes ((array!23825 0))(
  ( (array!23826 (arr!11362 (Array (_ BitVec 32) ValueCell!4640)) (size!11715 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23825)

(declare-fun mapKey!16572 () (_ BitVec 32))

(declare-fun mapValue!16572 () ValueCell!4640)

(declare-fun mapRest!16572 () (Array (_ BitVec 32) ValueCell!4640))

(assert (=> mapNonEmpty!16572 (= (arr!11362 _values!549) (store mapRest!16572 mapKey!16572 mapValue!16572))))

(declare-fun b!398356 () Bool)

(declare-fun e!240722 () Bool)

(assert (=> b!398356 (= e!240722 (not true))))

(declare-fun e!240724 () Bool)

(assert (=> b!398356 e!240724))

(declare-fun c!54513 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!398356 (= c!54513 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14395)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12052 0))(
  ( (Unit!12053) )
))
(declare-fun lt!187247 () Unit!12052)

(declare-fun zeroValue!515 () V!14395)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!14395)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!289 (array!23823 array!23825 (_ BitVec 32) (_ BitVec 32) V!14395 V!14395 (_ BitVec 32) (_ BitVec 64) V!14395 (_ BitVec 32) Int) Unit!12052)

(assert (=> b!398356 (= lt!187247 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!289 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398357 () Bool)

(declare-fun e!240726 () Bool)

(declare-fun e!240725 () Bool)

(assert (=> b!398357 (= e!240726 (and e!240725 mapRes!16572))))

(declare-fun condMapEmpty!16572 () Bool)

(declare-fun mapDefault!16572 () ValueCell!4640)

(assert (=> b!398357 (= condMapEmpty!16572 (= (arr!11362 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4640)) mapDefault!16572)))))

(declare-fun b!398358 () Bool)

(declare-fun res!228973 () Bool)

(assert (=> b!398358 (=> (not res!228973) (not e!240721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398358 (= res!228973 (validKeyInArray!0 k0!794))))

(declare-fun b!398359 () Bool)

(declare-datatypes ((tuple2!6620 0))(
  ( (tuple2!6621 (_1!3321 (_ BitVec 64)) (_2!3321 V!14395)) )
))
(declare-datatypes ((List!6532 0))(
  ( (Nil!6529) (Cons!6528 (h!7384 tuple2!6620) (t!11697 List!6532)) )
))
(declare-datatypes ((ListLongMap!5523 0))(
  ( (ListLongMap!5524 (toList!2777 List!6532)) )
))
(declare-fun call!27895 () ListLongMap!5523)

(declare-fun call!27894 () ListLongMap!5523)

(assert (=> b!398359 (= e!240724 (= call!27895 call!27894))))

(declare-fun mapIsEmpty!16572 () Bool)

(assert (=> mapIsEmpty!16572 mapRes!16572))

(declare-fun res!228975 () Bool)

(assert (=> start!38534 (=> (not res!228975) (not e!240721))))

(assert (=> start!38534 (= res!228975 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11714 _keys!709))))))

(assert (=> start!38534 e!240721))

(declare-fun tp_is_empty!9967 () Bool)

(assert (=> start!38534 tp_is_empty!9967))

(assert (=> start!38534 tp!32379))

(assert (=> start!38534 true))

(declare-fun array_inv!8338 (array!23825) Bool)

(assert (=> start!38534 (and (array_inv!8338 _values!549) e!240726)))

(declare-fun array_inv!8339 (array!23823) Bool)

(assert (=> start!38534 (array_inv!8339 _keys!709)))

(declare-fun b!398360 () Bool)

(declare-fun res!228977 () Bool)

(assert (=> b!398360 (=> (not res!228977) (not e!240721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398360 (= res!228977 (validMask!0 mask!1025))))

(declare-fun b!398361 () Bool)

(declare-fun res!228981 () Bool)

(assert (=> b!398361 (=> (not res!228981) (not e!240721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23823 (_ BitVec 32)) Bool)

(assert (=> b!398361 (= res!228981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398362 () Bool)

(declare-fun +!1096 (ListLongMap!5523 tuple2!6620) ListLongMap!5523)

(assert (=> b!398362 (= e!240724 (= call!27894 (+!1096 call!27895 (tuple2!6621 k0!794 v!412))))))

(declare-fun b!398363 () Bool)

(declare-fun res!228978 () Bool)

(assert (=> b!398363 (=> (not res!228978) (not e!240721))))

(assert (=> b!398363 (= res!228978 (and (= (size!11715 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11714 _keys!709) (size!11715 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398364 () Bool)

(assert (=> b!398364 (= e!240721 e!240722)))

(declare-fun res!228979 () Bool)

(assert (=> b!398364 (=> (not res!228979) (not e!240722))))

(declare-fun lt!187246 () array!23823)

(assert (=> b!398364 (= res!228979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187246 mask!1025))))

(assert (=> b!398364 (= lt!187246 (array!23824 (store (arr!11361 _keys!709) i!563 k0!794) (size!11714 _keys!709)))))

(declare-fun b!398365 () Bool)

(declare-fun res!228984 () Bool)

(assert (=> b!398365 (=> (not res!228984) (not e!240721))))

(assert (=> b!398365 (= res!228984 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11714 _keys!709))))))

(declare-fun b!398366 () Bool)

(declare-fun res!228976 () Bool)

(assert (=> b!398366 (=> (not res!228976) (not e!240722))))

(declare-datatypes ((List!6533 0))(
  ( (Nil!6530) (Cons!6529 (h!7385 (_ BitVec 64)) (t!11698 List!6533)) )
))
(declare-fun arrayNoDuplicates!0 (array!23823 (_ BitVec 32) List!6533) Bool)

(assert (=> b!398366 (= res!228976 (arrayNoDuplicates!0 lt!187246 #b00000000000000000000000000000000 Nil!6530))))

(declare-fun b!398367 () Bool)

(declare-fun res!228983 () Bool)

(assert (=> b!398367 (=> (not res!228983) (not e!240722))))

(assert (=> b!398367 (= res!228983 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11714 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun bm!27891 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!998 (array!23823 array!23825 (_ BitVec 32) (_ BitVec 32) V!14395 V!14395 (_ BitVec 32) Int) ListLongMap!5523)

(assert (=> bm!27891 (= call!27894 (getCurrentListMapNoExtraKeys!998 (ite c!54513 lt!187246 _keys!709) (ite c!54513 (array!23826 (store (arr!11362 _values!549) i!563 (ValueCellFull!4640 v!412)) (size!11715 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!27892 () Bool)

(assert (=> bm!27892 (= call!27895 (getCurrentListMapNoExtraKeys!998 (ite c!54513 _keys!709 lt!187246) (ite c!54513 _values!549 (array!23826 (store (arr!11362 _values!549) i!563 (ValueCellFull!4640 v!412)) (size!11715 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398368 () Bool)

(assert (=> b!398368 (= e!240725 tp_is_empty!9967)))

(declare-fun b!398369 () Bool)

(declare-fun res!228980 () Bool)

(assert (=> b!398369 (=> (not res!228980) (not e!240721))))

(assert (=> b!398369 (= res!228980 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6530))))

(declare-fun b!398370 () Bool)

(declare-fun res!228974 () Bool)

(assert (=> b!398370 (=> (not res!228974) (not e!240721))))

(declare-fun arrayContainsKey!0 (array!23823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398370 (= res!228974 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!398371 () Bool)

(assert (=> b!398371 (= e!240720 tp_is_empty!9967)))

(assert (= (and start!38534 res!228975) b!398360))

(assert (= (and b!398360 res!228977) b!398363))

(assert (= (and b!398363 res!228978) b!398361))

(assert (= (and b!398361 res!228981) b!398369))

(assert (= (and b!398369 res!228980) b!398365))

(assert (= (and b!398365 res!228984) b!398358))

(assert (= (and b!398358 res!228973) b!398355))

(assert (= (and b!398355 res!228982) b!398370))

(assert (= (and b!398370 res!228974) b!398364))

(assert (= (and b!398364 res!228979) b!398366))

(assert (= (and b!398366 res!228976) b!398367))

(assert (= (and b!398367 res!228983) b!398356))

(assert (= (and b!398356 c!54513) b!398362))

(assert (= (and b!398356 (not c!54513)) b!398359))

(assert (= (or b!398362 b!398359) bm!27891))

(assert (= (or b!398362 b!398359) bm!27892))

(assert (= (and b!398357 condMapEmpty!16572) mapIsEmpty!16572))

(assert (= (and b!398357 (not condMapEmpty!16572)) mapNonEmpty!16572))

(get-info :version)

(assert (= (and mapNonEmpty!16572 ((_ is ValueCellFull!4640) mapValue!16572)) b!398371))

(assert (= (and b!398357 ((_ is ValueCellFull!4640) mapDefault!16572)) b!398368))

(assert (= start!38534 b!398357))

(declare-fun m!392697 () Bool)

(assert (=> b!398360 m!392697))

(declare-fun m!392699 () Bool)

(assert (=> b!398356 m!392699))

(declare-fun m!392701 () Bool)

(assert (=> b!398355 m!392701))

(declare-fun m!392703 () Bool)

(assert (=> start!38534 m!392703))

(declare-fun m!392705 () Bool)

(assert (=> start!38534 m!392705))

(declare-fun m!392707 () Bool)

(assert (=> b!398366 m!392707))

(declare-fun m!392709 () Bool)

(assert (=> bm!27892 m!392709))

(declare-fun m!392711 () Bool)

(assert (=> bm!27892 m!392711))

(declare-fun m!392713 () Bool)

(assert (=> b!398369 m!392713))

(declare-fun m!392715 () Bool)

(assert (=> b!398362 m!392715))

(declare-fun m!392717 () Bool)

(assert (=> b!398370 m!392717))

(declare-fun m!392719 () Bool)

(assert (=> b!398364 m!392719))

(declare-fun m!392721 () Bool)

(assert (=> b!398364 m!392721))

(declare-fun m!392723 () Bool)

(assert (=> b!398358 m!392723))

(assert (=> bm!27891 m!392709))

(declare-fun m!392725 () Bool)

(assert (=> bm!27891 m!392725))

(declare-fun m!392727 () Bool)

(assert (=> b!398361 m!392727))

(declare-fun m!392729 () Bool)

(assert (=> mapNonEmpty!16572 m!392729))

(check-sat (not b_next!9085) (not b!398362) (not b!398356) (not b!398361) b_and!16445 (not b!398366) tp_is_empty!9967 (not b!398369) (not mapNonEmpty!16572) (not start!38534) (not bm!27892) (not b!398370) (not b!398358) (not b!398360) (not bm!27891) (not b!398364))
(check-sat b_and!16445 (not b_next!9085))
