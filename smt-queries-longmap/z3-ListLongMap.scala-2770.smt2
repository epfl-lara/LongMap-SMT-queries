; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40458 () Bool)

(assert start!40458)

(declare-fun b_free!10543 () Bool)

(declare-fun b_next!10543 () Bool)

(assert (=> start!40458 (= b_free!10543 (not b_next!10543))))

(declare-fun tp!37406 () Bool)

(declare-fun b_and!18541 () Bool)

(assert (=> start!40458 (= tp!37406 b_and!18541)))

(declare-fun b!445554 () Bool)

(declare-fun res!264427 () Bool)

(declare-fun e!261869 () Bool)

(assert (=> b!445554 (=> (not res!264427) (not e!261869))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27526 0))(
  ( (array!27527 (arr!13210 (Array (_ BitVec 32) (_ BitVec 64))) (size!13562 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27526)

(assert (=> b!445554 (= res!264427 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13562 _keys!709))))))

(declare-fun res!264420 () Bool)

(assert (=> start!40458 (=> (not res!264420) (not e!261869))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40458 (= res!264420 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13562 _keys!709))))))

(assert (=> start!40458 e!261869))

(declare-fun tp_is_empty!11857 () Bool)

(assert (=> start!40458 tp_is_empty!11857))

(assert (=> start!40458 tp!37406))

(assert (=> start!40458 true))

(declare-datatypes ((V!16915 0))(
  ( (V!16916 (val!5973 Int)) )
))
(declare-datatypes ((ValueCell!5585 0))(
  ( (ValueCellFull!5585 (v!8225 V!16915)) (EmptyCell!5585) )
))
(declare-datatypes ((array!27528 0))(
  ( (array!27529 (arr!13211 (Array (_ BitVec 32) ValueCell!5585)) (size!13563 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27528)

(declare-fun e!261868 () Bool)

(declare-fun array_inv!9658 (array!27528) Bool)

(assert (=> start!40458 (and (array_inv!9658 _values!549) e!261868)))

(declare-fun array_inv!9659 (array!27526) Bool)

(assert (=> start!40458 (array_inv!9659 _keys!709)))

(declare-fun b!445555 () Bool)

(declare-fun res!264422 () Bool)

(assert (=> b!445555 (=> (not res!264422) (not e!261869))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27526 (_ BitVec 32)) Bool)

(assert (=> b!445555 (= res!264422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!445556 () Bool)

(declare-datatypes ((tuple2!7752 0))(
  ( (tuple2!7753 (_1!3887 (_ BitVec 64)) (_2!3887 V!16915)) )
))
(declare-datatypes ((List!7813 0))(
  ( (Nil!7810) (Cons!7809 (h!8665 tuple2!7752) (t!13563 List!7813)) )
))
(declare-datatypes ((ListLongMap!6667 0))(
  ( (ListLongMap!6668 (toList!3349 List!7813)) )
))
(declare-fun call!29573 () ListLongMap!6667)

(declare-fun e!261867 () Bool)

(declare-fun call!29572 () ListLongMap!6667)

(declare-fun v!412 () V!16915)

(declare-fun +!1529 (ListLongMap!6667 tuple2!7752) ListLongMap!6667)

(assert (=> b!445556 (= e!261867 (= call!29572 (+!1529 call!29573 (tuple2!7753 k0!794 v!412))))))

(declare-fun b!445557 () Bool)

(declare-fun res!264426 () Bool)

(declare-fun e!261865 () Bool)

(assert (=> b!445557 (=> (not res!264426) (not e!261865))))

(assert (=> b!445557 (= res!264426 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13562 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun minValue!515 () V!16915)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!55837 () Bool)

(declare-fun lt!203672 () array!27526)

(declare-fun zeroValue!515 () V!16915)

(declare-fun bm!29569 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1580 (array!27526 array!27528 (_ BitVec 32) (_ BitVec 32) V!16915 V!16915 (_ BitVec 32) Int) ListLongMap!6667)

(assert (=> bm!29569 (= call!29573 (getCurrentListMapNoExtraKeys!1580 (ite c!55837 _keys!709 lt!203672) (ite c!55837 _values!549 (array!27529 (store (arr!13211 _values!549) i!563 (ValueCellFull!5585 v!412)) (size!13563 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445558 () Bool)

(declare-fun res!264428 () Bool)

(assert (=> b!445558 (=> (not res!264428) (not e!261865))))

(declare-datatypes ((List!7814 0))(
  ( (Nil!7811) (Cons!7810 (h!8666 (_ BitVec 64)) (t!13564 List!7814)) )
))
(declare-fun arrayNoDuplicates!0 (array!27526 (_ BitVec 32) List!7814) Bool)

(assert (=> b!445558 (= res!264428 (arrayNoDuplicates!0 lt!203672 #b00000000000000000000000000000000 Nil!7811))))

(declare-fun b!445559 () Bool)

(declare-fun e!261866 () Bool)

(assert (=> b!445559 (= e!261866 tp_is_empty!11857)))

(declare-fun mapNonEmpty!19413 () Bool)

(declare-fun mapRes!19413 () Bool)

(declare-fun tp!37407 () Bool)

(declare-fun e!261870 () Bool)

(assert (=> mapNonEmpty!19413 (= mapRes!19413 (and tp!37407 e!261870))))

(declare-fun mapKey!19413 () (_ BitVec 32))

(declare-fun mapValue!19413 () ValueCell!5585)

(declare-fun mapRest!19413 () (Array (_ BitVec 32) ValueCell!5585))

(assert (=> mapNonEmpty!19413 (= (arr!13211 _values!549) (store mapRest!19413 mapKey!19413 mapValue!19413))))

(declare-fun mapIsEmpty!19413 () Bool)

(assert (=> mapIsEmpty!19413 mapRes!19413))

(declare-fun b!445560 () Bool)

(declare-fun res!264430 () Bool)

(assert (=> b!445560 (=> (not res!264430) (not e!261869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445560 (= res!264430 (validKeyInArray!0 k0!794))))

(declare-fun bm!29570 () Bool)

(assert (=> bm!29570 (= call!29572 (getCurrentListMapNoExtraKeys!1580 (ite c!55837 lt!203672 _keys!709) (ite c!55837 (array!27529 (store (arr!13211 _values!549) i!563 (ValueCellFull!5585 v!412)) (size!13563 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445561 () Bool)

(assert (=> b!445561 (= e!261865 (not true))))

(assert (=> b!445561 e!261867))

(assert (=> b!445561 (= c!55837 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13135 0))(
  ( (Unit!13136) )
))
(declare-fun lt!203673 () Unit!13135)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!689 (array!27526 array!27528 (_ BitVec 32) (_ BitVec 32) V!16915 V!16915 (_ BitVec 32) (_ BitVec 64) V!16915 (_ BitVec 32) Int) Unit!13135)

(assert (=> b!445561 (= lt!203673 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!689 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445562 () Bool)

(declare-fun res!264423 () Bool)

(assert (=> b!445562 (=> (not res!264423) (not e!261869))))

(declare-fun arrayContainsKey!0 (array!27526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445562 (= res!264423 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445563 () Bool)

(declare-fun res!264429 () Bool)

(assert (=> b!445563 (=> (not res!264429) (not e!261869))))

(assert (=> b!445563 (= res!264429 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7811))))

(declare-fun b!445564 () Bool)

(declare-fun res!264419 () Bool)

(assert (=> b!445564 (=> (not res!264419) (not e!261869))))

(assert (=> b!445564 (= res!264419 (or (= (select (arr!13210 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13210 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445565 () Bool)

(declare-fun res!264421 () Bool)

(assert (=> b!445565 (=> (not res!264421) (not e!261869))))

(assert (=> b!445565 (= res!264421 (and (= (size!13563 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13562 _keys!709) (size!13563 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445566 () Bool)

(assert (=> b!445566 (= e!261870 tp_is_empty!11857)))

(declare-fun b!445567 () Bool)

(assert (=> b!445567 (= e!261869 e!261865)))

(declare-fun res!264424 () Bool)

(assert (=> b!445567 (=> (not res!264424) (not e!261865))))

(assert (=> b!445567 (= res!264424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203672 mask!1025))))

(assert (=> b!445567 (= lt!203672 (array!27527 (store (arr!13210 _keys!709) i!563 k0!794) (size!13562 _keys!709)))))

(declare-fun b!445568 () Bool)

(assert (=> b!445568 (= e!261868 (and e!261866 mapRes!19413))))

(declare-fun condMapEmpty!19413 () Bool)

(declare-fun mapDefault!19413 () ValueCell!5585)

(assert (=> b!445568 (= condMapEmpty!19413 (= (arr!13211 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5585)) mapDefault!19413)))))

(declare-fun b!445569 () Bool)

(declare-fun res!264425 () Bool)

(assert (=> b!445569 (=> (not res!264425) (not e!261869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445569 (= res!264425 (validMask!0 mask!1025))))

(declare-fun b!445570 () Bool)

(assert (=> b!445570 (= e!261867 (= call!29573 call!29572))))

(assert (= (and start!40458 res!264420) b!445569))

(assert (= (and b!445569 res!264425) b!445565))

(assert (= (and b!445565 res!264421) b!445555))

(assert (= (and b!445555 res!264422) b!445563))

(assert (= (and b!445563 res!264429) b!445554))

(assert (= (and b!445554 res!264427) b!445560))

(assert (= (and b!445560 res!264430) b!445564))

(assert (= (and b!445564 res!264419) b!445562))

(assert (= (and b!445562 res!264423) b!445567))

(assert (= (and b!445567 res!264424) b!445558))

(assert (= (and b!445558 res!264428) b!445557))

(assert (= (and b!445557 res!264426) b!445561))

(assert (= (and b!445561 c!55837) b!445556))

(assert (= (and b!445561 (not c!55837)) b!445570))

(assert (= (or b!445556 b!445570) bm!29570))

(assert (= (or b!445556 b!445570) bm!29569))

(assert (= (and b!445568 condMapEmpty!19413) mapIsEmpty!19413))

(assert (= (and b!445568 (not condMapEmpty!19413)) mapNonEmpty!19413))

(get-info :version)

(assert (= (and mapNonEmpty!19413 ((_ is ValueCellFull!5585) mapValue!19413)) b!445566))

(assert (= (and b!445568 ((_ is ValueCellFull!5585) mapDefault!19413)) b!445559))

(assert (= start!40458 b!445568))

(declare-fun m!431253 () Bool)

(assert (=> b!445569 m!431253))

(declare-fun m!431255 () Bool)

(assert (=> b!445562 m!431255))

(declare-fun m!431257 () Bool)

(assert (=> b!445564 m!431257))

(declare-fun m!431259 () Bool)

(assert (=> start!40458 m!431259))

(declare-fun m!431261 () Bool)

(assert (=> start!40458 m!431261))

(declare-fun m!431263 () Bool)

(assert (=> b!445556 m!431263))

(declare-fun m!431265 () Bool)

(assert (=> b!445561 m!431265))

(declare-fun m!431267 () Bool)

(assert (=> b!445560 m!431267))

(declare-fun m!431269 () Bool)

(assert (=> bm!29570 m!431269))

(declare-fun m!431271 () Bool)

(assert (=> bm!29570 m!431271))

(declare-fun m!431273 () Bool)

(assert (=> b!445567 m!431273))

(declare-fun m!431275 () Bool)

(assert (=> b!445567 m!431275))

(declare-fun m!431277 () Bool)

(assert (=> b!445558 m!431277))

(declare-fun m!431279 () Bool)

(assert (=> b!445563 m!431279))

(assert (=> bm!29569 m!431269))

(declare-fun m!431281 () Bool)

(assert (=> bm!29569 m!431281))

(declare-fun m!431283 () Bool)

(assert (=> mapNonEmpty!19413 m!431283))

(declare-fun m!431285 () Bool)

(assert (=> b!445555 m!431285))

(check-sat (not b!445569) tp_is_empty!11857 (not bm!29569) (not bm!29570) (not b!445563) (not b!445555) (not b!445558) (not b!445556) (not b!445561) (not b_next!10543) (not b!445562) (not b!445567) (not mapNonEmpty!19413) (not b!445560) (not start!40458) b_and!18541)
(check-sat b_and!18541 (not b_next!10543))
