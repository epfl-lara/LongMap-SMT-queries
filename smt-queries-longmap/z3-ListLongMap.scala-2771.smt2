; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40464 () Bool)

(assert start!40464)

(declare-fun b_free!10549 () Bool)

(declare-fun b_next!10549 () Bool)

(assert (=> start!40464 (= b_free!10549 (not b_next!10549))))

(declare-fun tp!37424 () Bool)

(declare-fun b_and!18507 () Bool)

(assert (=> start!40464 (= tp!37424 b_and!18507)))

(declare-fun b!445485 () Bool)

(declare-fun res!264407 () Bool)

(declare-fun e!261786 () Bool)

(assert (=> b!445485 (=> (not res!264407) (not e!261786))))

(declare-datatypes ((array!27537 0))(
  ( (array!27538 (arr!13216 (Array (_ BitVec 32) (_ BitVec 64))) (size!13569 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27537)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16923 0))(
  ( (V!16924 (val!5976 Int)) )
))
(declare-datatypes ((ValueCell!5588 0))(
  ( (ValueCellFull!5588 (v!8221 V!16923)) (EmptyCell!5588) )
))
(declare-datatypes ((array!27539 0))(
  ( (array!27540 (arr!13217 (Array (_ BitVec 32) ValueCell!5588)) (size!13570 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27539)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!445485 (= res!264407 (and (= (size!13570 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13569 _keys!709) (size!13570 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445486 () Bool)

(declare-fun e!261789 () Bool)

(assert (=> b!445486 (= e!261789 (not true))))

(declare-fun e!261787 () Bool)

(assert (=> b!445486 e!261787))

(declare-fun c!55798 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445486 (= c!55798 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!16923)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16923)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!13123 0))(
  ( (Unit!13124) )
))
(declare-fun lt!203437 () Unit!13123)

(declare-fun v!412 () V!16923)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!690 (array!27537 array!27539 (_ BitVec 32) (_ BitVec 32) V!16923 V!16923 (_ BitVec 32) (_ BitVec 64) V!16923 (_ BitVec 32) Int) Unit!13123)

(assert (=> b!445486 (= lt!203437 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!690 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445487 () Bool)

(declare-fun e!261788 () Bool)

(declare-fun e!261790 () Bool)

(declare-fun mapRes!19422 () Bool)

(assert (=> b!445487 (= e!261788 (and e!261790 mapRes!19422))))

(declare-fun condMapEmpty!19422 () Bool)

(declare-fun mapDefault!19422 () ValueCell!5588)

(assert (=> b!445487 (= condMapEmpty!19422 (= (arr!13217 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5588)) mapDefault!19422)))))

(declare-fun mapNonEmpty!19422 () Bool)

(declare-fun tp!37425 () Bool)

(declare-fun e!261785 () Bool)

(assert (=> mapNonEmpty!19422 (= mapRes!19422 (and tp!37425 e!261785))))

(declare-fun mapValue!19422 () ValueCell!5588)

(declare-fun mapRest!19422 () (Array (_ BitVec 32) ValueCell!5588))

(declare-fun mapKey!19422 () (_ BitVec 32))

(assert (=> mapNonEmpty!19422 (= (arr!13217 _values!549) (store mapRest!19422 mapKey!19422 mapValue!19422))))

(declare-fun mapIsEmpty!19422 () Bool)

(assert (=> mapIsEmpty!19422 mapRes!19422))

(declare-fun b!445489 () Bool)

(declare-fun res!264401 () Bool)

(assert (=> b!445489 (=> (not res!264401) (not e!261789))))

(declare-fun lt!203438 () array!27537)

(declare-datatypes ((List!7907 0))(
  ( (Nil!7904) (Cons!7903 (h!8759 (_ BitVec 64)) (t!13656 List!7907)) )
))
(declare-fun arrayNoDuplicates!0 (array!27537 (_ BitVec 32) List!7907) Bool)

(assert (=> b!445489 (= res!264401 (arrayNoDuplicates!0 lt!203438 #b00000000000000000000000000000000 Nil!7904))))

(declare-datatypes ((tuple2!7858 0))(
  ( (tuple2!7859 (_1!3940 (_ BitVec 64)) (_2!3940 V!16923)) )
))
(declare-datatypes ((List!7908 0))(
  ( (Nil!7905) (Cons!7904 (h!8760 tuple2!7858) (t!13657 List!7908)) )
))
(declare-datatypes ((ListLongMap!6761 0))(
  ( (ListLongMap!6762 (toList!3396 List!7908)) )
))
(declare-fun call!29578 () ListLongMap!6761)

(declare-fun bm!29575 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1595 (array!27537 array!27539 (_ BitVec 32) (_ BitVec 32) V!16923 V!16923 (_ BitVec 32) Int) ListLongMap!6761)

(assert (=> bm!29575 (= call!29578 (getCurrentListMapNoExtraKeys!1595 (ite c!55798 lt!203438 _keys!709) (ite c!55798 (array!27540 (store (arr!13217 _values!549) i!563 (ValueCellFull!5588 v!412)) (size!13570 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445490 () Bool)

(declare-fun res!264404 () Bool)

(assert (=> b!445490 (=> (not res!264404) (not e!261786))))

(assert (=> b!445490 (= res!264404 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13569 _keys!709))))))

(declare-fun b!445491 () Bool)

(declare-fun tp_is_empty!11863 () Bool)

(assert (=> b!445491 (= e!261790 tp_is_empty!11863)))

(declare-fun b!445492 () Bool)

(declare-fun res!264412 () Bool)

(assert (=> b!445492 (=> (not res!264412) (not e!261786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445492 (= res!264412 (validMask!0 mask!1025))))

(declare-fun b!445493 () Bool)

(declare-fun res!264403 () Bool)

(assert (=> b!445493 (=> (not res!264403) (not e!261786))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445493 (= res!264403 (validKeyInArray!0 k0!794))))

(declare-fun b!445494 () Bool)

(declare-fun res!264406 () Bool)

(assert (=> b!445494 (=> (not res!264406) (not e!261789))))

(assert (=> b!445494 (= res!264406 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13569 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!445488 () Bool)

(declare-fun res!264409 () Bool)

(assert (=> b!445488 (=> (not res!264409) (not e!261786))))

(assert (=> b!445488 (= res!264409 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7904))))

(declare-fun res!264405 () Bool)

(assert (=> start!40464 (=> (not res!264405) (not e!261786))))

(assert (=> start!40464 (= res!264405 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13569 _keys!709))))))

(assert (=> start!40464 e!261786))

(assert (=> start!40464 tp_is_empty!11863))

(assert (=> start!40464 tp!37424))

(assert (=> start!40464 true))

(declare-fun array_inv!9632 (array!27539) Bool)

(assert (=> start!40464 (and (array_inv!9632 _values!549) e!261788)))

(declare-fun array_inv!9633 (array!27537) Bool)

(assert (=> start!40464 (array_inv!9633 _keys!709)))

(declare-fun b!445495 () Bool)

(assert (=> b!445495 (= e!261785 tp_is_empty!11863)))

(declare-fun b!445496 () Bool)

(declare-fun res!264410 () Bool)

(assert (=> b!445496 (=> (not res!264410) (not e!261786))))

(declare-fun arrayContainsKey!0 (array!27537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445496 (= res!264410 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun call!29579 () ListLongMap!6761)

(declare-fun bm!29576 () Bool)

(assert (=> bm!29576 (= call!29579 (getCurrentListMapNoExtraKeys!1595 (ite c!55798 _keys!709 lt!203438) (ite c!55798 _values!549 (array!27540 (store (arr!13217 _values!549) i!563 (ValueCellFull!5588 v!412)) (size!13570 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445497 () Bool)

(declare-fun res!264408 () Bool)

(assert (=> b!445497 (=> (not res!264408) (not e!261786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27537 (_ BitVec 32)) Bool)

(assert (=> b!445497 (= res!264408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445498 () Bool)

(declare-fun res!264411 () Bool)

(assert (=> b!445498 (=> (not res!264411) (not e!261786))))

(assert (=> b!445498 (= res!264411 (or (= (select (arr!13216 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13216 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445499 () Bool)

(assert (=> b!445499 (= e!261787 (= call!29579 call!29578))))

(declare-fun b!445500 () Bool)

(assert (=> b!445500 (= e!261786 e!261789)))

(declare-fun res!264402 () Bool)

(assert (=> b!445500 (=> (not res!264402) (not e!261789))))

(assert (=> b!445500 (= res!264402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203438 mask!1025))))

(assert (=> b!445500 (= lt!203438 (array!27538 (store (arr!13216 _keys!709) i!563 k0!794) (size!13569 _keys!709)))))

(declare-fun b!445501 () Bool)

(declare-fun +!1552 (ListLongMap!6761 tuple2!7858) ListLongMap!6761)

(assert (=> b!445501 (= e!261787 (= call!29578 (+!1552 call!29579 (tuple2!7859 k0!794 v!412))))))

(assert (= (and start!40464 res!264405) b!445492))

(assert (= (and b!445492 res!264412) b!445485))

(assert (= (and b!445485 res!264407) b!445497))

(assert (= (and b!445497 res!264408) b!445488))

(assert (= (and b!445488 res!264409) b!445490))

(assert (= (and b!445490 res!264404) b!445493))

(assert (= (and b!445493 res!264403) b!445498))

(assert (= (and b!445498 res!264411) b!445496))

(assert (= (and b!445496 res!264410) b!445500))

(assert (= (and b!445500 res!264402) b!445489))

(assert (= (and b!445489 res!264401) b!445494))

(assert (= (and b!445494 res!264406) b!445486))

(assert (= (and b!445486 c!55798) b!445501))

(assert (= (and b!445486 (not c!55798)) b!445499))

(assert (= (or b!445501 b!445499) bm!29575))

(assert (= (or b!445501 b!445499) bm!29576))

(assert (= (and b!445487 condMapEmpty!19422) mapIsEmpty!19422))

(assert (= (and b!445487 (not condMapEmpty!19422)) mapNonEmpty!19422))

(get-info :version)

(assert (= (and mapNonEmpty!19422 ((_ is ValueCellFull!5588) mapValue!19422)) b!445495))

(assert (= (and b!445487 ((_ is ValueCellFull!5588) mapDefault!19422)) b!445491))

(assert (= start!40464 b!445487))

(declare-fun m!430405 () Bool)

(assert (=> b!445501 m!430405))

(declare-fun m!430407 () Bool)

(assert (=> b!445496 m!430407))

(declare-fun m!430409 () Bool)

(assert (=> b!445486 m!430409))

(declare-fun m!430411 () Bool)

(assert (=> b!445492 m!430411))

(declare-fun m!430413 () Bool)

(assert (=> b!445489 m!430413))

(declare-fun m!430415 () Bool)

(assert (=> b!445493 m!430415))

(declare-fun m!430417 () Bool)

(assert (=> bm!29576 m!430417))

(declare-fun m!430419 () Bool)

(assert (=> bm!29576 m!430419))

(declare-fun m!430421 () Bool)

(assert (=> b!445500 m!430421))

(declare-fun m!430423 () Bool)

(assert (=> b!445500 m!430423))

(assert (=> bm!29575 m!430417))

(declare-fun m!430425 () Bool)

(assert (=> bm!29575 m!430425))

(declare-fun m!430427 () Bool)

(assert (=> b!445488 m!430427))

(declare-fun m!430429 () Bool)

(assert (=> start!40464 m!430429))

(declare-fun m!430431 () Bool)

(assert (=> start!40464 m!430431))

(declare-fun m!430433 () Bool)

(assert (=> b!445498 m!430433))

(declare-fun m!430435 () Bool)

(assert (=> mapNonEmpty!19422 m!430435))

(declare-fun m!430437 () Bool)

(assert (=> b!445497 m!430437))

(check-sat (not b!445492) (not b!445501) (not bm!29576) (not mapNonEmpty!19422) b_and!18507 (not start!40464) (not b!445497) (not b!445500) tp_is_empty!11863 (not b!445486) (not b!445496) (not b!445489) (not bm!29575) (not b!445493) (not b!445488) (not b_next!10549))
(check-sat b_and!18507 (not b_next!10549))
