; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37510 () Bool)

(assert start!37510)

(declare-fun b_free!8637 () Bool)

(declare-fun b_next!8637 () Bool)

(assert (=> start!37510 (= b_free!8637 (not b_next!8637))))

(declare-fun tp!30626 () Bool)

(declare-fun b_and!15879 () Bool)

(assert (=> start!37510 (= tp!30626 b_and!15879)))

(declare-fun b!382654 () Bool)

(declare-fun e!232513 () Bool)

(declare-fun tp_is_empty!9285 () Bool)

(assert (=> b!382654 (= e!232513 tp_is_empty!9285)))

(declare-fun b!382655 () Bool)

(declare-fun res!217697 () Bool)

(declare-fun e!232509 () Bool)

(assert (=> b!382655 (=> (not res!217697) (not e!232509))))

(declare-datatypes ((array!22479 0))(
  ( (array!22480 (arr!10708 (Array (_ BitVec 32) (_ BitVec 64))) (size!11060 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22479)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382655 (= res!217697 (or (= (select (arr!10708 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10708 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382656 () Bool)

(declare-fun res!217703 () Bool)

(assert (=> b!382656 (=> (not res!217703) (not e!232509))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382656 (= res!217703 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382657 () Bool)

(declare-fun res!217699 () Bool)

(assert (=> b!382657 (=> (not res!217699) (not e!232509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382657 (= res!217699 (validKeyInArray!0 k0!778))))

(declare-fun b!382658 () Bool)

(declare-fun e!232510 () Bool)

(assert (=> b!382658 (= e!232510 tp_is_empty!9285)))

(declare-fun b!382659 () Bool)

(declare-fun e!232514 () Bool)

(assert (=> b!382659 (= e!232514 true)))

(declare-datatypes ((V!13485 0))(
  ( (V!13486 (val!4687 Int)) )
))
(declare-datatypes ((tuple2!6302 0))(
  ( (tuple2!6303 (_1!3162 (_ BitVec 64)) (_2!3162 V!13485)) )
))
(declare-datatypes ((List!6134 0))(
  ( (Nil!6131) (Cons!6130 (h!6986 tuple2!6302) (t!11284 List!6134)) )
))
(declare-datatypes ((ListLongMap!5215 0))(
  ( (ListLongMap!5216 (toList!2623 List!6134)) )
))
(declare-fun lt!179561 () ListLongMap!5215)

(declare-fun lt!179564 () ListLongMap!5215)

(assert (=> b!382659 (= lt!179561 lt!179564)))

(declare-fun res!217696 () Bool)

(assert (=> start!37510 (=> (not res!217696) (not e!232509))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37510 (= res!217696 (validMask!0 mask!970))))

(assert (=> start!37510 e!232509))

(declare-datatypes ((ValueCell!4299 0))(
  ( (ValueCellFull!4299 (v!6884 V!13485)) (EmptyCell!4299) )
))
(declare-datatypes ((array!22481 0))(
  ( (array!22482 (arr!10709 (Array (_ BitVec 32) ValueCell!4299)) (size!11061 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22481)

(declare-fun e!232511 () Bool)

(declare-fun array_inv!7884 (array!22481) Bool)

(assert (=> start!37510 (and (array_inv!7884 _values!506) e!232511)))

(assert (=> start!37510 tp!30626))

(assert (=> start!37510 true))

(assert (=> start!37510 tp_is_empty!9285))

(declare-fun array_inv!7885 (array!22479) Bool)

(assert (=> start!37510 (array_inv!7885 _keys!658)))

(declare-fun b!382660 () Bool)

(declare-fun res!217695 () Bool)

(assert (=> b!382660 (=> (not res!217695) (not e!232509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22479 (_ BitVec 32)) Bool)

(assert (=> b!382660 (= res!217695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15492 () Bool)

(declare-fun mapRes!15492 () Bool)

(assert (=> mapIsEmpty!15492 mapRes!15492))

(declare-fun b!382661 () Bool)

(declare-fun res!217701 () Bool)

(assert (=> b!382661 (=> (not res!217701) (not e!232509))))

(assert (=> b!382661 (= res!217701 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11060 _keys!658))))))

(declare-fun b!382662 () Bool)

(declare-fun e!232508 () Bool)

(assert (=> b!382662 (= e!232508 (not e!232514))))

(declare-fun res!217698 () Bool)

(assert (=> b!382662 (=> res!217698 e!232514)))

(declare-fun lt!179567 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382662 (= res!217698 (or (and (not lt!179567) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179567) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179567)))))

(assert (=> b!382662 (= lt!179567 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!179563 () ListLongMap!5215)

(declare-fun zeroValue!472 () V!13485)

(declare-fun minValue!472 () V!13485)

(declare-fun getCurrentListMap!2028 (array!22479 array!22481 (_ BitVec 32) (_ BitVec 32) V!13485 V!13485 (_ BitVec 32) Int) ListLongMap!5215)

(assert (=> b!382662 (= lt!179563 (getCurrentListMap!2028 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179566 () array!22481)

(declare-fun lt!179562 () array!22479)

(assert (=> b!382662 (= lt!179561 (getCurrentListMap!2028 lt!179562 lt!179566 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179560 () ListLongMap!5215)

(assert (=> b!382662 (and (= lt!179564 lt!179560) (= lt!179560 lt!179564))))

(declare-fun lt!179565 () ListLongMap!5215)

(declare-fun v!373 () V!13485)

(declare-fun +!958 (ListLongMap!5215 tuple2!6302) ListLongMap!5215)

(assert (=> b!382662 (= lt!179560 (+!958 lt!179565 (tuple2!6303 k0!778 v!373)))))

(declare-datatypes ((Unit!11810 0))(
  ( (Unit!11811) )
))
(declare-fun lt!179568 () Unit!11810)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!186 (array!22479 array!22481 (_ BitVec 32) (_ BitVec 32) V!13485 V!13485 (_ BitVec 32) (_ BitVec 64) V!13485 (_ BitVec 32) Int) Unit!11810)

(assert (=> b!382662 (= lt!179568 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!186 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!862 (array!22479 array!22481 (_ BitVec 32) (_ BitVec 32) V!13485 V!13485 (_ BitVec 32) Int) ListLongMap!5215)

(assert (=> b!382662 (= lt!179564 (getCurrentListMapNoExtraKeys!862 lt!179562 lt!179566 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382662 (= lt!179566 (array!22482 (store (arr!10709 _values!506) i!548 (ValueCellFull!4299 v!373)) (size!11061 _values!506)))))

(assert (=> b!382662 (= lt!179565 (getCurrentListMapNoExtraKeys!862 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382663 () Bool)

(assert (=> b!382663 (= e!232511 (and e!232510 mapRes!15492))))

(declare-fun condMapEmpty!15492 () Bool)

(declare-fun mapDefault!15492 () ValueCell!4299)

(assert (=> b!382663 (= condMapEmpty!15492 (= (arr!10709 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4299)) mapDefault!15492)))))

(declare-fun b!382664 () Bool)

(declare-fun res!217693 () Bool)

(assert (=> b!382664 (=> (not res!217693) (not e!232509))))

(assert (=> b!382664 (= res!217693 (and (= (size!11061 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11060 _keys!658) (size!11061 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382665 () Bool)

(declare-fun res!217694 () Bool)

(assert (=> b!382665 (=> (not res!217694) (not e!232508))))

(declare-datatypes ((List!6135 0))(
  ( (Nil!6132) (Cons!6131 (h!6987 (_ BitVec 64)) (t!11285 List!6135)) )
))
(declare-fun arrayNoDuplicates!0 (array!22479 (_ BitVec 32) List!6135) Bool)

(assert (=> b!382665 (= res!217694 (arrayNoDuplicates!0 lt!179562 #b00000000000000000000000000000000 Nil!6132))))

(declare-fun mapNonEmpty!15492 () Bool)

(declare-fun tp!30627 () Bool)

(assert (=> mapNonEmpty!15492 (= mapRes!15492 (and tp!30627 e!232513))))

(declare-fun mapKey!15492 () (_ BitVec 32))

(declare-fun mapRest!15492 () (Array (_ BitVec 32) ValueCell!4299))

(declare-fun mapValue!15492 () ValueCell!4299)

(assert (=> mapNonEmpty!15492 (= (arr!10709 _values!506) (store mapRest!15492 mapKey!15492 mapValue!15492))))

(declare-fun b!382666 () Bool)

(declare-fun res!217700 () Bool)

(assert (=> b!382666 (=> (not res!217700) (not e!232509))))

(assert (=> b!382666 (= res!217700 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6132))))

(declare-fun b!382667 () Bool)

(assert (=> b!382667 (= e!232509 e!232508)))

(declare-fun res!217702 () Bool)

(assert (=> b!382667 (=> (not res!217702) (not e!232508))))

(assert (=> b!382667 (= res!217702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179562 mask!970))))

(assert (=> b!382667 (= lt!179562 (array!22480 (store (arr!10708 _keys!658) i!548 k0!778) (size!11060 _keys!658)))))

(assert (= (and start!37510 res!217696) b!382664))

(assert (= (and b!382664 res!217693) b!382660))

(assert (= (and b!382660 res!217695) b!382666))

(assert (= (and b!382666 res!217700) b!382661))

(assert (= (and b!382661 res!217701) b!382657))

(assert (= (and b!382657 res!217699) b!382655))

(assert (= (and b!382655 res!217697) b!382656))

(assert (= (and b!382656 res!217703) b!382667))

(assert (= (and b!382667 res!217702) b!382665))

(assert (= (and b!382665 res!217694) b!382662))

(assert (= (and b!382662 (not res!217698)) b!382659))

(assert (= (and b!382663 condMapEmpty!15492) mapIsEmpty!15492))

(assert (= (and b!382663 (not condMapEmpty!15492)) mapNonEmpty!15492))

(get-info :version)

(assert (= (and mapNonEmpty!15492 ((_ is ValueCellFull!4299) mapValue!15492)) b!382654))

(assert (= (and b!382663 ((_ is ValueCellFull!4299) mapDefault!15492)) b!382658))

(assert (= start!37510 b!382663))

(declare-fun m!379457 () Bool)

(assert (=> b!382666 m!379457))

(declare-fun m!379459 () Bool)

(assert (=> b!382667 m!379459))

(declare-fun m!379461 () Bool)

(assert (=> b!382667 m!379461))

(declare-fun m!379463 () Bool)

(assert (=> b!382655 m!379463))

(declare-fun m!379465 () Bool)

(assert (=> start!37510 m!379465))

(declare-fun m!379467 () Bool)

(assert (=> start!37510 m!379467))

(declare-fun m!379469 () Bool)

(assert (=> start!37510 m!379469))

(declare-fun m!379471 () Bool)

(assert (=> mapNonEmpty!15492 m!379471))

(declare-fun m!379473 () Bool)

(assert (=> b!382660 m!379473))

(declare-fun m!379475 () Bool)

(assert (=> b!382665 m!379475))

(declare-fun m!379477 () Bool)

(assert (=> b!382662 m!379477))

(declare-fun m!379479 () Bool)

(assert (=> b!382662 m!379479))

(declare-fun m!379481 () Bool)

(assert (=> b!382662 m!379481))

(declare-fun m!379483 () Bool)

(assert (=> b!382662 m!379483))

(declare-fun m!379485 () Bool)

(assert (=> b!382662 m!379485))

(declare-fun m!379487 () Bool)

(assert (=> b!382662 m!379487))

(declare-fun m!379489 () Bool)

(assert (=> b!382662 m!379489))

(declare-fun m!379491 () Bool)

(assert (=> b!382657 m!379491))

(declare-fun m!379493 () Bool)

(assert (=> b!382656 m!379493))

(check-sat (not b!382667) (not b_next!8637) b_and!15879 (not b!382657) (not start!37510) (not b!382660) (not b!382666) (not b!382665) (not b!382656) (not b!382662) (not mapNonEmpty!15492) tp_is_empty!9285)
(check-sat b_and!15879 (not b_next!8637))
