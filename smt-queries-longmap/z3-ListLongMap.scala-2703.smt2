; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40038 () Bool)

(assert start!40038)

(declare-fun b_free!10305 () Bool)

(declare-fun b_next!10305 () Bool)

(assert (=> start!40038 (= b_free!10305 (not b_next!10305))))

(declare-fun tp!36443 () Bool)

(declare-fun b_and!18269 () Bool)

(assert (=> start!40038 (= tp!36443 b_and!18269)))

(declare-fun b!436656 () Bool)

(declare-fun res!257440 () Bool)

(declare-fun e!257838 () Bool)

(assert (=> b!436656 (=> (not res!257440) (not e!257838))))

(declare-datatypes ((array!26739 0))(
  ( (array!26740 (arr!12819 (Array (_ BitVec 32) (_ BitVec 64))) (size!13171 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26739)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436656 (= res!257440 (or (= (select (arr!12819 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12819 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436657 () Bool)

(declare-fun res!257435 () Bool)

(assert (=> b!436657 (=> (not res!257435) (not e!257838))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436657 (= res!257435 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!436658 () Bool)

(declare-datatypes ((Unit!12992 0))(
  ( (Unit!12993) )
))
(declare-fun e!257839 () Unit!12992)

(declare-fun Unit!12994 () Unit!12992)

(assert (=> b!436658 (= e!257839 Unit!12994)))

(declare-fun b!436660 () Bool)

(declare-fun res!257442 () Bool)

(assert (=> b!436660 (=> (not res!257442) (not e!257838))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26739 (_ BitVec 32)) Bool)

(assert (=> b!436660 (= res!257442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436661 () Bool)

(declare-fun e!257835 () Bool)

(declare-fun e!257833 () Bool)

(assert (=> b!436661 (= e!257835 e!257833)))

(declare-fun res!257441 () Bool)

(assert (=> b!436661 (=> (not res!257441) (not e!257833))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!436661 (= res!257441 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16381 0))(
  ( (V!16382 (val!5773 Int)) )
))
(declare-fun minValue!515 () V!16381)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7652 0))(
  ( (tuple2!7653 (_1!3837 (_ BitVec 64)) (_2!3837 V!16381)) )
))
(declare-datatypes ((List!7650 0))(
  ( (Nil!7647) (Cons!7646 (h!8502 tuple2!7652) (t!13404 List!7650)) )
))
(declare-datatypes ((ListLongMap!6565 0))(
  ( (ListLongMap!6566 (toList!3298 List!7650)) )
))
(declare-fun lt!201370 () ListLongMap!6565)

(declare-fun zeroValue!515 () V!16381)

(declare-datatypes ((ValueCell!5385 0))(
  ( (ValueCellFull!5385 (v!8020 V!16381)) (EmptyCell!5385) )
))
(declare-datatypes ((array!26741 0))(
  ( (array!26742 (arr!12820 (Array (_ BitVec 32) ValueCell!5385)) (size!13172 (_ BitVec 32))) )
))
(declare-fun lt!201374 () array!26741)

(declare-fun lt!201377 () array!26739)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1487 (array!26739 array!26741 (_ BitVec 32) (_ BitVec 32) V!16381 V!16381 (_ BitVec 32) Int) ListLongMap!6565)

(assert (=> b!436661 (= lt!201370 (getCurrentListMapNoExtraKeys!1487 lt!201377 lt!201374 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26741)

(declare-fun v!412 () V!16381)

(assert (=> b!436661 (= lt!201374 (array!26742 (store (arr!12820 _values!549) i!563 (ValueCellFull!5385 v!412)) (size!13172 _values!549)))))

(declare-fun lt!201376 () ListLongMap!6565)

(assert (=> b!436661 (= lt!201376 (getCurrentListMapNoExtraKeys!1487 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436662 () Bool)

(declare-fun e!257836 () Bool)

(assert (=> b!436662 (= e!257836 true)))

(declare-fun lt!201371 () tuple2!7652)

(declare-fun lt!201379 () ListLongMap!6565)

(declare-fun lt!201375 () tuple2!7652)

(declare-fun lt!201378 () ListLongMap!6565)

(declare-fun +!1445 (ListLongMap!6565 tuple2!7652) ListLongMap!6565)

(assert (=> b!436662 (= lt!201378 (+!1445 (+!1445 lt!201379 lt!201371) lt!201375))))

(declare-fun lt!201372 () Unit!12992)

(declare-fun lt!201366 () V!16381)

(declare-fun addCommutativeForDiffKeys!426 (ListLongMap!6565 (_ BitVec 64) V!16381 (_ BitVec 64) V!16381) Unit!12992)

(assert (=> b!436662 (= lt!201372 (addCommutativeForDiffKeys!426 lt!201379 k0!794 v!412 (select (arr!12819 _keys!709) from!863) lt!201366))))

(declare-fun b!436663 () Bool)

(declare-fun e!257840 () Bool)

(declare-fun tp_is_empty!11457 () Bool)

(assert (=> b!436663 (= e!257840 tp_is_empty!11457)))

(declare-fun mapNonEmpty!18807 () Bool)

(declare-fun mapRes!18807 () Bool)

(declare-fun tp!36444 () Bool)

(declare-fun e!257832 () Bool)

(assert (=> mapNonEmpty!18807 (= mapRes!18807 (and tp!36444 e!257832))))

(declare-fun mapRest!18807 () (Array (_ BitVec 32) ValueCell!5385))

(declare-fun mapValue!18807 () ValueCell!5385)

(declare-fun mapKey!18807 () (_ BitVec 32))

(assert (=> mapNonEmpty!18807 (= (arr!12820 _values!549) (store mapRest!18807 mapKey!18807 mapValue!18807))))

(declare-fun mapIsEmpty!18807 () Bool)

(assert (=> mapIsEmpty!18807 mapRes!18807))

(declare-fun b!436664 () Bool)

(declare-fun res!257444 () Bool)

(assert (=> b!436664 (=> (not res!257444) (not e!257838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436664 (= res!257444 (validKeyInArray!0 k0!794))))

(declare-fun b!436665 () Bool)

(declare-fun res!257436 () Bool)

(assert (=> b!436665 (=> (not res!257436) (not e!257838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436665 (= res!257436 (validMask!0 mask!1025))))

(declare-fun b!436666 () Bool)

(declare-fun e!257834 () Bool)

(assert (=> b!436666 (= e!257834 e!257836)))

(declare-fun res!257432 () Bool)

(assert (=> b!436666 (=> res!257432 e!257836)))

(assert (=> b!436666 (= res!257432 (= k0!794 (select (arr!12819 _keys!709) from!863)))))

(assert (=> b!436666 (not (= (select (arr!12819 _keys!709) from!863) k0!794))))

(declare-fun lt!201380 () Unit!12992)

(assert (=> b!436666 (= lt!201380 e!257839)))

(declare-fun c!55793 () Bool)

(assert (=> b!436666 (= c!55793 (= (select (arr!12819 _keys!709) from!863) k0!794))))

(assert (=> b!436666 (= lt!201370 lt!201378)))

(declare-fun lt!201369 () ListLongMap!6565)

(assert (=> b!436666 (= lt!201378 (+!1445 lt!201369 lt!201371))))

(assert (=> b!436666 (= lt!201371 (tuple2!7653 (select (arr!12819 _keys!709) from!863) lt!201366))))

(declare-fun get!6396 (ValueCell!5385 V!16381) V!16381)

(declare-fun dynLambda!847 (Int (_ BitVec 64)) V!16381)

(assert (=> b!436666 (= lt!201366 (get!6396 (select (arr!12820 _values!549) from!863) (dynLambda!847 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436667 () Bool)

(assert (=> b!436667 (= e!257832 tp_is_empty!11457)))

(declare-fun b!436668 () Bool)

(declare-fun res!257445 () Bool)

(assert (=> b!436668 (=> (not res!257445) (not e!257838))))

(assert (=> b!436668 (= res!257445 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13171 _keys!709))))))

(declare-fun b!436669 () Bool)

(declare-fun res!257443 () Bool)

(assert (=> b!436669 (=> (not res!257443) (not e!257838))))

(assert (=> b!436669 (= res!257443 (and (= (size!13172 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13171 _keys!709) (size!13172 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436670 () Bool)

(declare-fun res!257433 () Bool)

(assert (=> b!436670 (=> (not res!257433) (not e!257835))))

(declare-datatypes ((List!7651 0))(
  ( (Nil!7648) (Cons!7647 (h!8503 (_ BitVec 64)) (t!13405 List!7651)) )
))
(declare-fun arrayNoDuplicates!0 (array!26739 (_ BitVec 32) List!7651) Bool)

(assert (=> b!436670 (= res!257433 (arrayNoDuplicates!0 lt!201377 #b00000000000000000000000000000000 Nil!7648))))

(declare-fun b!436671 () Bool)

(declare-fun res!257431 () Bool)

(assert (=> b!436671 (=> (not res!257431) (not e!257838))))

(assert (=> b!436671 (= res!257431 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7648))))

(declare-fun res!257434 () Bool)

(assert (=> start!40038 (=> (not res!257434) (not e!257838))))

(assert (=> start!40038 (= res!257434 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13171 _keys!709))))))

(assert (=> start!40038 e!257838))

(assert (=> start!40038 tp_is_empty!11457))

(assert (=> start!40038 tp!36443))

(assert (=> start!40038 true))

(declare-fun e!257841 () Bool)

(declare-fun array_inv!9312 (array!26741) Bool)

(assert (=> start!40038 (and (array_inv!9312 _values!549) e!257841)))

(declare-fun array_inv!9313 (array!26739) Bool)

(assert (=> start!40038 (array_inv!9313 _keys!709)))

(declare-fun b!436659 () Bool)

(assert (=> b!436659 (= e!257833 (not e!257834))))

(declare-fun res!257437 () Bool)

(assert (=> b!436659 (=> res!257437 e!257834)))

(assert (=> b!436659 (= res!257437 (not (validKeyInArray!0 (select (arr!12819 _keys!709) from!863))))))

(declare-fun lt!201373 () ListLongMap!6565)

(assert (=> b!436659 (= lt!201373 lt!201369)))

(assert (=> b!436659 (= lt!201369 (+!1445 lt!201379 lt!201375))))

(assert (=> b!436659 (= lt!201373 (getCurrentListMapNoExtraKeys!1487 lt!201377 lt!201374 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!436659 (= lt!201375 (tuple2!7653 k0!794 v!412))))

(assert (=> b!436659 (= lt!201379 (getCurrentListMapNoExtraKeys!1487 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!201367 () Unit!12992)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!614 (array!26739 array!26741 (_ BitVec 32) (_ BitVec 32) V!16381 V!16381 (_ BitVec 32) (_ BitVec 64) V!16381 (_ BitVec 32) Int) Unit!12992)

(assert (=> b!436659 (= lt!201367 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!614 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436672 () Bool)

(declare-fun res!257438 () Bool)

(assert (=> b!436672 (=> (not res!257438) (not e!257835))))

(assert (=> b!436672 (= res!257438 (bvsle from!863 i!563))))

(declare-fun b!436673 () Bool)

(assert (=> b!436673 (= e!257841 (and e!257840 mapRes!18807))))

(declare-fun condMapEmpty!18807 () Bool)

(declare-fun mapDefault!18807 () ValueCell!5385)

(assert (=> b!436673 (= condMapEmpty!18807 (= (arr!12820 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5385)) mapDefault!18807)))))

(declare-fun b!436674 () Bool)

(declare-fun Unit!12995 () Unit!12992)

(assert (=> b!436674 (= e!257839 Unit!12995)))

(declare-fun lt!201368 () Unit!12992)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26739 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12992)

(assert (=> b!436674 (= lt!201368 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!436674 false))

(declare-fun b!436675 () Bool)

(assert (=> b!436675 (= e!257838 e!257835)))

(declare-fun res!257439 () Bool)

(assert (=> b!436675 (=> (not res!257439) (not e!257835))))

(assert (=> b!436675 (= res!257439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201377 mask!1025))))

(assert (=> b!436675 (= lt!201377 (array!26740 (store (arr!12819 _keys!709) i!563 k0!794) (size!13171 _keys!709)))))

(assert (= (and start!40038 res!257434) b!436665))

(assert (= (and b!436665 res!257436) b!436669))

(assert (= (and b!436669 res!257443) b!436660))

(assert (= (and b!436660 res!257442) b!436671))

(assert (= (and b!436671 res!257431) b!436668))

(assert (= (and b!436668 res!257445) b!436664))

(assert (= (and b!436664 res!257444) b!436656))

(assert (= (and b!436656 res!257440) b!436657))

(assert (= (and b!436657 res!257435) b!436675))

(assert (= (and b!436675 res!257439) b!436670))

(assert (= (and b!436670 res!257433) b!436672))

(assert (= (and b!436672 res!257438) b!436661))

(assert (= (and b!436661 res!257441) b!436659))

(assert (= (and b!436659 (not res!257437)) b!436666))

(assert (= (and b!436666 c!55793) b!436674))

(assert (= (and b!436666 (not c!55793)) b!436658))

(assert (= (and b!436666 (not res!257432)) b!436662))

(assert (= (and b!436673 condMapEmpty!18807) mapIsEmpty!18807))

(assert (= (and b!436673 (not condMapEmpty!18807)) mapNonEmpty!18807))

(get-info :version)

(assert (= (and mapNonEmpty!18807 ((_ is ValueCellFull!5385) mapValue!18807)) b!436667))

(assert (= (and b!436673 ((_ is ValueCellFull!5385) mapDefault!18807)) b!436663))

(assert (= start!40038 b!436673))

(declare-fun b_lambda!9393 () Bool)

(assert (=> (not b_lambda!9393) (not b!436666)))

(declare-fun t!13403 () Bool)

(declare-fun tb!3711 () Bool)

(assert (=> (and start!40038 (= defaultEntry!557 defaultEntry!557) t!13403) tb!3711))

(declare-fun result!6949 () Bool)

(assert (=> tb!3711 (= result!6949 tp_is_empty!11457)))

(assert (=> b!436666 t!13403))

(declare-fun b_and!18271 () Bool)

(assert (= b_and!18269 (and (=> t!13403 result!6949) b_and!18271)))

(declare-fun m!424465 () Bool)

(assert (=> mapNonEmpty!18807 m!424465))

(declare-fun m!424467 () Bool)

(assert (=> b!436661 m!424467))

(declare-fun m!424469 () Bool)

(assert (=> b!436661 m!424469))

(declare-fun m!424471 () Bool)

(assert (=> b!436661 m!424471))

(declare-fun m!424473 () Bool)

(assert (=> b!436659 m!424473))

(declare-fun m!424475 () Bool)

(assert (=> b!436659 m!424475))

(declare-fun m!424477 () Bool)

(assert (=> b!436659 m!424477))

(declare-fun m!424479 () Bool)

(assert (=> b!436659 m!424479))

(assert (=> b!436659 m!424473))

(declare-fun m!424481 () Bool)

(assert (=> b!436659 m!424481))

(declare-fun m!424483 () Bool)

(assert (=> b!436659 m!424483))

(declare-fun m!424485 () Bool)

(assert (=> b!436660 m!424485))

(declare-fun m!424487 () Bool)

(assert (=> start!40038 m!424487))

(declare-fun m!424489 () Bool)

(assert (=> start!40038 m!424489))

(assert (=> b!436666 m!424473))

(declare-fun m!424491 () Bool)

(assert (=> b!436666 m!424491))

(declare-fun m!424493 () Bool)

(assert (=> b!436666 m!424493))

(assert (=> b!436666 m!424491))

(declare-fun m!424495 () Bool)

(assert (=> b!436666 m!424495))

(declare-fun m!424497 () Bool)

(assert (=> b!436666 m!424497))

(assert (=> b!436666 m!424493))

(declare-fun m!424499 () Bool)

(assert (=> b!436674 m!424499))

(declare-fun m!424501 () Bool)

(assert (=> b!436670 m!424501))

(declare-fun m!424503 () Bool)

(assert (=> b!436671 m!424503))

(declare-fun m!424505 () Bool)

(assert (=> b!436656 m!424505))

(declare-fun m!424507 () Bool)

(assert (=> b!436675 m!424507))

(declare-fun m!424509 () Bool)

(assert (=> b!436675 m!424509))

(declare-fun m!424511 () Bool)

(assert (=> b!436664 m!424511))

(declare-fun m!424513 () Bool)

(assert (=> b!436662 m!424513))

(assert (=> b!436662 m!424513))

(declare-fun m!424515 () Bool)

(assert (=> b!436662 m!424515))

(assert (=> b!436662 m!424473))

(assert (=> b!436662 m!424473))

(declare-fun m!424517 () Bool)

(assert (=> b!436662 m!424517))

(declare-fun m!424519 () Bool)

(assert (=> b!436657 m!424519))

(declare-fun m!424521 () Bool)

(assert (=> b!436665 m!424521))

(check-sat (not b!436674) (not mapNonEmpty!18807) (not b!436659) (not b!436657) (not b!436662) (not b!436670) (not b!436661) b_and!18271 (not b!436665) (not b_next!10305) (not b_lambda!9393) (not b!436671) (not b!436660) (not start!40038) tp_is_empty!11457 (not b!436664) (not b!436666) (not b!436675))
(check-sat b_and!18271 (not b_next!10305))
