; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39206 () Bool)

(assert start!39206)

(declare-fun b_free!9487 () Bool)

(declare-fun b_next!9487 () Bool)

(assert (=> start!39206 (= b_free!9487 (not b_next!9487))))

(declare-fun tp!33990 () Bool)

(declare-fun b_and!16887 () Bool)

(assert (=> start!39206 (= tp!33990 b_and!16887)))

(declare-fun b!413654 () Bool)

(declare-fun e!247317 () Bool)

(declare-fun e!247324 () Bool)

(declare-fun mapRes!17580 () Bool)

(assert (=> b!413654 (= e!247317 (and e!247324 mapRes!17580))))

(declare-fun condMapEmpty!17580 () Bool)

(declare-datatypes ((V!15291 0))(
  ( (V!15292 (val!5364 Int)) )
))
(declare-datatypes ((ValueCell!4976 0))(
  ( (ValueCellFull!4976 (v!7612 V!15291)) (EmptyCell!4976) )
))
(declare-datatypes ((array!25140 0))(
  ( (array!25141 (arr!12019 (Array (_ BitVec 32) ValueCell!4976)) (size!12371 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25140)

(declare-fun mapDefault!17580 () ValueCell!4976)

(assert (=> b!413654 (= condMapEmpty!17580 (= (arr!12019 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4976)) mapDefault!17580)))))

(declare-fun b!413655 () Bool)

(declare-fun tp_is_empty!10639 () Bool)

(assert (=> b!413655 (= e!247324 tp_is_empty!10639)))

(declare-datatypes ((array!25142 0))(
  ( (array!25143 (arr!12020 (Array (_ BitVec 32) (_ BitVec 64))) (size!12372 (_ BitVec 32))) )
))
(declare-fun lt!189820 () array!25142)

(declare-fun minValue!515 () V!15291)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15291)

(declare-fun bm!28623 () Bool)

(declare-fun c!54921 () Bool)

(declare-datatypes ((tuple2!6842 0))(
  ( (tuple2!6843 (_1!3432 (_ BitVec 64)) (_2!3432 V!15291)) )
))
(declare-datatypes ((List!6862 0))(
  ( (Nil!6859) (Cons!6858 (h!7714 tuple2!6842) (t!12028 List!6862)) )
))
(declare-datatypes ((ListLongMap!5757 0))(
  ( (ListLongMap!5758 (toList!2894 List!6862)) )
))
(declare-fun call!28626 () ListLongMap!5757)

(declare-fun _keys!709 () array!25142)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!189821 () array!25140)

(declare-fun getCurrentListMapNoExtraKeys!1144 (array!25142 array!25140 (_ BitVec 32) (_ BitVec 32) V!15291 V!15291 (_ BitVec 32) Int) ListLongMap!5757)

(assert (=> bm!28623 (= call!28626 (getCurrentListMapNoExtraKeys!1144 (ite c!54921 _keys!709 lt!189820) (ite c!54921 _values!549 lt!189821) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413656 () Bool)

(declare-fun e!247318 () Bool)

(assert (=> b!413656 (= e!247318 tp_is_empty!10639)))

(declare-fun mapNonEmpty!17580 () Bool)

(declare-fun tp!33989 () Bool)

(assert (=> mapNonEmpty!17580 (= mapRes!17580 (and tp!33989 e!247318))))

(declare-fun mapRest!17580 () (Array (_ BitVec 32) ValueCell!4976))

(declare-fun mapValue!17580 () ValueCell!4976)

(declare-fun mapKey!17580 () (_ BitVec 32))

(assert (=> mapNonEmpty!17580 (= (arr!12019 _values!549) (store mapRest!17580 mapKey!17580 mapValue!17580))))

(declare-fun b!413657 () Bool)

(declare-fun e!247322 () Bool)

(assert (=> b!413657 (= e!247322 (not true))))

(declare-fun e!247319 () Bool)

(assert (=> b!413657 e!247319))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413657 (= c!54921 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15291)

(declare-datatypes ((Unit!12233 0))(
  ( (Unit!12234) )
))
(declare-fun lt!189822 () Unit!12233)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!384 (array!25142 array!25140 (_ BitVec 32) (_ BitVec 32) V!15291 V!15291 (_ BitVec 32) (_ BitVec 64) V!15291 (_ BitVec 32) Int) Unit!12233)

(assert (=> b!413657 (= lt!189822 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!384 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413658 () Bool)

(declare-fun res!240444 () Bool)

(declare-fun e!247321 () Bool)

(assert (=> b!413658 (=> (not res!240444) (not e!247321))))

(declare-datatypes ((List!6863 0))(
  ( (Nil!6860) (Cons!6859 (h!7715 (_ BitVec 64)) (t!12029 List!6863)) )
))
(declare-fun arrayNoDuplicates!0 (array!25142 (_ BitVec 32) List!6863) Bool)

(assert (=> b!413658 (= res!240444 (arrayNoDuplicates!0 lt!189820 #b00000000000000000000000000000000 Nil!6860))))

(declare-fun b!413659 () Bool)

(declare-fun res!240435 () Bool)

(declare-fun e!247320 () Bool)

(assert (=> b!413659 (=> (not res!240435) (not e!247320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413659 (= res!240435 (validKeyInArray!0 k0!794))))

(declare-fun b!413660 () Bool)

(declare-fun res!240432 () Bool)

(assert (=> b!413660 (=> (not res!240432) (not e!247320))))

(assert (=> b!413660 (= res!240432 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6860))))

(declare-fun b!413661 () Bool)

(declare-fun res!240439 () Bool)

(assert (=> b!413661 (=> (not res!240439) (not e!247320))))

(declare-fun arrayContainsKey!0 (array!25142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413661 (= res!240439 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413662 () Bool)

(declare-fun res!240440 () Bool)

(assert (=> b!413662 (=> (not res!240440) (not e!247320))))

(assert (=> b!413662 (= res!240440 (or (= (select (arr!12020 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12020 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17580 () Bool)

(assert (=> mapIsEmpty!17580 mapRes!17580))

(declare-fun bm!28624 () Bool)

(declare-fun call!28627 () ListLongMap!5757)

(assert (=> bm!28624 (= call!28627 (getCurrentListMapNoExtraKeys!1144 (ite c!54921 lt!189820 _keys!709) (ite c!54921 lt!189821 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413663 () Bool)

(declare-fun res!240436 () Bool)

(assert (=> b!413663 (=> (not res!240436) (not e!247321))))

(assert (=> b!413663 (= res!240436 (bvsle from!863 i!563))))

(declare-fun b!413664 () Bool)

(assert (=> b!413664 (= e!247321 e!247322)))

(declare-fun res!240442 () Bool)

(assert (=> b!413664 (=> (not res!240442) (not e!247322))))

(assert (=> b!413664 (= res!240442 (= from!863 i!563))))

(declare-fun lt!189819 () ListLongMap!5757)

(assert (=> b!413664 (= lt!189819 (getCurrentListMapNoExtraKeys!1144 lt!189820 lt!189821 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!413664 (= lt!189821 (array!25141 (store (arr!12019 _values!549) i!563 (ValueCellFull!4976 v!412)) (size!12371 _values!549)))))

(declare-fun lt!189818 () ListLongMap!5757)

(assert (=> b!413664 (= lt!189818 (getCurrentListMapNoExtraKeys!1144 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413665 () Bool)

(assert (=> b!413665 (= e!247320 e!247321)))

(declare-fun res!240438 () Bool)

(assert (=> b!413665 (=> (not res!240438) (not e!247321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25142 (_ BitVec 32)) Bool)

(assert (=> b!413665 (= res!240438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189820 mask!1025))))

(assert (=> b!413665 (= lt!189820 (array!25143 (store (arr!12020 _keys!709) i!563 k0!794) (size!12372 _keys!709)))))

(declare-fun b!413666 () Bool)

(declare-fun res!240443 () Bool)

(assert (=> b!413666 (=> (not res!240443) (not e!247320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413666 (= res!240443 (validMask!0 mask!1025))))

(declare-fun b!413667 () Bool)

(declare-fun res!240434 () Bool)

(assert (=> b!413667 (=> (not res!240434) (not e!247320))))

(assert (=> b!413667 (= res!240434 (and (= (size!12371 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12372 _keys!709) (size!12371 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413668 () Bool)

(declare-fun +!1171 (ListLongMap!5757 tuple2!6842) ListLongMap!5757)

(assert (=> b!413668 (= e!247319 (= call!28627 (+!1171 call!28626 (tuple2!6843 k0!794 v!412))))))

(declare-fun res!240437 () Bool)

(assert (=> start!39206 (=> (not res!240437) (not e!247320))))

(assert (=> start!39206 (= res!240437 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12372 _keys!709))))))

(assert (=> start!39206 e!247320))

(assert (=> start!39206 tp_is_empty!10639))

(assert (=> start!39206 tp!33990))

(assert (=> start!39206 true))

(declare-fun array_inv!8846 (array!25140) Bool)

(assert (=> start!39206 (and (array_inv!8846 _values!549) e!247317)))

(declare-fun array_inv!8847 (array!25142) Bool)

(assert (=> start!39206 (array_inv!8847 _keys!709)))

(declare-fun b!413669 () Bool)

(declare-fun res!240441 () Bool)

(assert (=> b!413669 (=> (not res!240441) (not e!247320))))

(assert (=> b!413669 (= res!240441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!413670 () Bool)

(assert (=> b!413670 (= e!247319 (= call!28626 call!28627))))

(declare-fun b!413671 () Bool)

(declare-fun res!240433 () Bool)

(assert (=> b!413671 (=> (not res!240433) (not e!247320))))

(assert (=> b!413671 (= res!240433 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12372 _keys!709))))))

(assert (= (and start!39206 res!240437) b!413666))

(assert (= (and b!413666 res!240443) b!413667))

(assert (= (and b!413667 res!240434) b!413669))

(assert (= (and b!413669 res!240441) b!413660))

(assert (= (and b!413660 res!240432) b!413671))

(assert (= (and b!413671 res!240433) b!413659))

(assert (= (and b!413659 res!240435) b!413662))

(assert (= (and b!413662 res!240440) b!413661))

(assert (= (and b!413661 res!240439) b!413665))

(assert (= (and b!413665 res!240438) b!413658))

(assert (= (and b!413658 res!240444) b!413663))

(assert (= (and b!413663 res!240436) b!413664))

(assert (= (and b!413664 res!240442) b!413657))

(assert (= (and b!413657 c!54921) b!413668))

(assert (= (and b!413657 (not c!54921)) b!413670))

(assert (= (or b!413668 b!413670) bm!28624))

(assert (= (or b!413668 b!413670) bm!28623))

(assert (= (and b!413654 condMapEmpty!17580) mapIsEmpty!17580))

(assert (= (and b!413654 (not condMapEmpty!17580)) mapNonEmpty!17580))

(get-info :version)

(assert (= (and mapNonEmpty!17580 ((_ is ValueCellFull!4976) mapValue!17580)) b!413656))

(assert (= (and b!413654 ((_ is ValueCellFull!4976) mapDefault!17580)) b!413655))

(assert (= start!39206 b!413654))

(declare-fun m!403353 () Bool)

(assert (=> b!413658 m!403353))

(declare-fun m!403355 () Bool)

(assert (=> b!413661 m!403355))

(declare-fun m!403357 () Bool)

(assert (=> b!413659 m!403357))

(declare-fun m!403359 () Bool)

(assert (=> b!413666 m!403359))

(declare-fun m!403361 () Bool)

(assert (=> b!413662 m!403361))

(declare-fun m!403363 () Bool)

(assert (=> bm!28623 m!403363))

(declare-fun m!403365 () Bool)

(assert (=> b!413657 m!403365))

(declare-fun m!403367 () Bool)

(assert (=> b!413664 m!403367))

(declare-fun m!403369 () Bool)

(assert (=> b!413664 m!403369))

(declare-fun m!403371 () Bool)

(assert (=> b!413664 m!403371))

(declare-fun m!403373 () Bool)

(assert (=> mapNonEmpty!17580 m!403373))

(declare-fun m!403375 () Bool)

(assert (=> b!413665 m!403375))

(declare-fun m!403377 () Bool)

(assert (=> b!413665 m!403377))

(declare-fun m!403379 () Bool)

(assert (=> start!39206 m!403379))

(declare-fun m!403381 () Bool)

(assert (=> start!39206 m!403381))

(declare-fun m!403383 () Bool)

(assert (=> b!413669 m!403383))

(declare-fun m!403385 () Bool)

(assert (=> bm!28624 m!403385))

(declare-fun m!403387 () Bool)

(assert (=> b!413668 m!403387))

(declare-fun m!403389 () Bool)

(assert (=> b!413660 m!403389))

(check-sat (not b!413659) (not bm!28623) (not b!413664) (not b!413668) tp_is_empty!10639 b_and!16887 (not bm!28624) (not b!413665) (not mapNonEmpty!17580) (not b!413661) (not b!413657) (not b!413660) (not b!413669) (not b!413658) (not b!413666) (not start!39206) (not b_next!9487))
(check-sat b_and!16887 (not b_next!9487))
