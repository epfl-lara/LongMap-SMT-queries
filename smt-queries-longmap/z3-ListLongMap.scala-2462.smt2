; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38576 () Bool)

(assert start!38576)

(declare-fun b_free!9127 () Bool)

(declare-fun b_next!9127 () Bool)

(assert (=> start!38576 (= b_free!9127 (not b_next!9127))))

(declare-fun tp!32504 () Bool)

(declare-fun b_and!16487 () Bool)

(assert (=> start!38576 (= tp!32504 b_and!16487)))

(declare-fun b!399426 () Bool)

(declare-fun res!229734 () Bool)

(declare-fun e!241166 () Bool)

(assert (=> b!399426 (=> (not res!229734) (not e!241166))))

(declare-datatypes ((array!23907 0))(
  ( (array!23908 (arr!11403 (Array (_ BitVec 32) (_ BitVec 64))) (size!11756 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23907)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((V!14451 0))(
  ( (V!14452 (val!5049 Int)) )
))
(declare-datatypes ((ValueCell!4661 0))(
  ( (ValueCellFull!4661 (v!7290 V!14451)) (EmptyCell!4661) )
))
(declare-datatypes ((array!23909 0))(
  ( (array!23910 (arr!11404 (Array (_ BitVec 32) ValueCell!4661)) (size!11757 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23909)

(assert (=> b!399426 (= res!229734 (and (= (size!11757 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11756 _keys!709) (size!11757 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun minValue!515 () V!14451)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14451)

(declare-fun c!54576 () Bool)

(declare-datatypes ((tuple2!6660 0))(
  ( (tuple2!6661 (_1!3341 (_ BitVec 64)) (_2!3341 V!14451)) )
))
(declare-datatypes ((List!6570 0))(
  ( (Nil!6567) (Cons!6566 (h!7422 tuple2!6660) (t!11735 List!6570)) )
))
(declare-datatypes ((ListLongMap!5563 0))(
  ( (ListLongMap!5564 (toList!2797 List!6570)) )
))
(declare-fun call!28020 () ListLongMap!5563)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun bm!28017 () Bool)

(declare-fun lt!187373 () array!23907)

(declare-fun v!412 () V!14451)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1017 (array!23907 array!23909 (_ BitVec 32) (_ BitVec 32) V!14451 V!14451 (_ BitVec 32) Int) ListLongMap!5563)

(assert (=> bm!28017 (= call!28020 (getCurrentListMapNoExtraKeys!1017 (ite c!54576 lt!187373 _keys!709) (ite c!54576 (array!23910 (store (arr!11404 _values!549) i!563 (ValueCellFull!4661 v!412)) (size!11757 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16635 () Bool)

(declare-fun mapRes!16635 () Bool)

(assert (=> mapIsEmpty!16635 mapRes!16635))

(declare-fun mapNonEmpty!16635 () Bool)

(declare-fun tp!32505 () Bool)

(declare-fun e!241165 () Bool)

(assert (=> mapNonEmpty!16635 (= mapRes!16635 (and tp!32505 e!241165))))

(declare-fun mapRest!16635 () (Array (_ BitVec 32) ValueCell!4661))

(declare-fun mapKey!16635 () (_ BitVec 32))

(declare-fun mapValue!16635 () ValueCell!4661)

(assert (=> mapNonEmpty!16635 (= (arr!11404 _values!549) (store mapRest!16635 mapKey!16635 mapValue!16635))))

(declare-fun res!229735 () Bool)

(assert (=> start!38576 (=> (not res!229735) (not e!241166))))

(assert (=> start!38576 (= res!229735 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11756 _keys!709))))))

(assert (=> start!38576 e!241166))

(declare-fun tp_is_empty!10009 () Bool)

(assert (=> start!38576 tp_is_empty!10009))

(assert (=> start!38576 tp!32504))

(assert (=> start!38576 true))

(declare-fun e!241163 () Bool)

(declare-fun array_inv!8370 (array!23909) Bool)

(assert (=> start!38576 (and (array_inv!8370 _values!549) e!241163)))

(declare-fun array_inv!8371 (array!23907) Bool)

(assert (=> start!38576 (array_inv!8371 _keys!709)))

(declare-fun b!399427 () Bool)

(declare-fun res!229732 () Bool)

(assert (=> b!399427 (=> (not res!229732) (not e!241166))))

(assert (=> b!399427 (= res!229732 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11756 _keys!709))))))

(declare-fun b!399428 () Bool)

(declare-fun e!241167 () Bool)

(assert (=> b!399428 (= e!241167 (not true))))

(declare-fun e!241162 () Bool)

(assert (=> b!399428 e!241162))

(assert (=> b!399428 (= c!54576 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12084 0))(
  ( (Unit!12085) )
))
(declare-fun lt!187372 () Unit!12084)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!305 (array!23907 array!23909 (_ BitVec 32) (_ BitVec 32) V!14451 V!14451 (_ BitVec 32) (_ BitVec 64) V!14451 (_ BitVec 32) Int) Unit!12084)

(assert (=> b!399428 (= lt!187372 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!305 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399429 () Bool)

(declare-fun res!229733 () Bool)

(assert (=> b!399429 (=> (not res!229733) (not e!241167))))

(assert (=> b!399429 (= res!229733 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11756 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399430 () Bool)

(declare-fun res!229740 () Bool)

(assert (=> b!399430 (=> (not res!229740) (not e!241167))))

(declare-datatypes ((List!6571 0))(
  ( (Nil!6568) (Cons!6567 (h!7423 (_ BitVec 64)) (t!11736 List!6571)) )
))
(declare-fun arrayNoDuplicates!0 (array!23907 (_ BitVec 32) List!6571) Bool)

(assert (=> b!399430 (= res!229740 (arrayNoDuplicates!0 lt!187373 #b00000000000000000000000000000000 Nil!6568))))

(declare-fun b!399431 () Bool)

(declare-fun res!229729 () Bool)

(assert (=> b!399431 (=> (not res!229729) (not e!241166))))

(assert (=> b!399431 (= res!229729 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6568))))

(declare-fun b!399432 () Bool)

(declare-fun e!241164 () Bool)

(assert (=> b!399432 (= e!241164 tp_is_empty!10009)))

(declare-fun b!399433 () Bool)

(declare-fun res!229737 () Bool)

(assert (=> b!399433 (=> (not res!229737) (not e!241166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399433 (= res!229737 (validMask!0 mask!1025))))

(declare-fun b!399434 () Bool)

(assert (=> b!399434 (= e!241163 (and e!241164 mapRes!16635))))

(declare-fun condMapEmpty!16635 () Bool)

(declare-fun mapDefault!16635 () ValueCell!4661)

(assert (=> b!399434 (= condMapEmpty!16635 (= (arr!11404 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4661)) mapDefault!16635)))))

(declare-fun b!399435 () Bool)

(declare-fun res!229739 () Bool)

(assert (=> b!399435 (=> (not res!229739) (not e!241166))))

(declare-fun arrayContainsKey!0 (array!23907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399435 (= res!229739 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399436 () Bool)

(declare-fun res!229738 () Bool)

(assert (=> b!399436 (=> (not res!229738) (not e!241166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399436 (= res!229738 (validKeyInArray!0 k0!794))))

(declare-fun b!399437 () Bool)

(assert (=> b!399437 (= e!241166 e!241167)))

(declare-fun res!229736 () Bool)

(assert (=> b!399437 (=> (not res!229736) (not e!241167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23907 (_ BitVec 32)) Bool)

(assert (=> b!399437 (= res!229736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187373 mask!1025))))

(assert (=> b!399437 (= lt!187373 (array!23908 (store (arr!11403 _keys!709) i!563 k0!794) (size!11756 _keys!709)))))

(declare-fun b!399438 () Bool)

(assert (=> b!399438 (= e!241165 tp_is_empty!10009)))

(declare-fun b!399439 () Bool)

(declare-fun res!229731 () Bool)

(assert (=> b!399439 (=> (not res!229731) (not e!241166))))

(assert (=> b!399439 (= res!229731 (or (= (select (arr!11403 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11403 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399440 () Bool)

(declare-fun call!28021 () ListLongMap!5563)

(assert (=> b!399440 (= e!241162 (= call!28021 call!28020))))

(declare-fun b!399441 () Bool)

(declare-fun res!229730 () Bool)

(assert (=> b!399441 (=> (not res!229730) (not e!241166))))

(assert (=> b!399441 (= res!229730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!28018 () Bool)

(assert (=> bm!28018 (= call!28021 (getCurrentListMapNoExtraKeys!1017 (ite c!54576 _keys!709 lt!187373) (ite c!54576 _values!549 (array!23910 (store (arr!11404 _values!549) i!563 (ValueCellFull!4661 v!412)) (size!11757 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399442 () Bool)

(declare-fun +!1111 (ListLongMap!5563 tuple2!6660) ListLongMap!5563)

(assert (=> b!399442 (= e!241162 (= call!28020 (+!1111 call!28021 (tuple2!6661 k0!794 v!412))))))

(assert (= (and start!38576 res!229735) b!399433))

(assert (= (and b!399433 res!229737) b!399426))

(assert (= (and b!399426 res!229734) b!399441))

(assert (= (and b!399441 res!229730) b!399431))

(assert (= (and b!399431 res!229729) b!399427))

(assert (= (and b!399427 res!229732) b!399436))

(assert (= (and b!399436 res!229738) b!399439))

(assert (= (and b!399439 res!229731) b!399435))

(assert (= (and b!399435 res!229739) b!399437))

(assert (= (and b!399437 res!229736) b!399430))

(assert (= (and b!399430 res!229740) b!399429))

(assert (= (and b!399429 res!229733) b!399428))

(assert (= (and b!399428 c!54576) b!399442))

(assert (= (and b!399428 (not c!54576)) b!399440))

(assert (= (or b!399442 b!399440) bm!28017))

(assert (= (or b!399442 b!399440) bm!28018))

(assert (= (and b!399434 condMapEmpty!16635) mapIsEmpty!16635))

(assert (= (and b!399434 (not condMapEmpty!16635)) mapNonEmpty!16635))

(get-info :version)

(assert (= (and mapNonEmpty!16635 ((_ is ValueCellFull!4661) mapValue!16635)) b!399438))

(assert (= (and b!399434 ((_ is ValueCellFull!4661) mapDefault!16635)) b!399432))

(assert (= start!38576 b!399434))

(declare-fun m!393411 () Bool)

(assert (=> start!38576 m!393411))

(declare-fun m!393413 () Bool)

(assert (=> start!38576 m!393413))

(declare-fun m!393415 () Bool)

(assert (=> bm!28017 m!393415))

(declare-fun m!393417 () Bool)

(assert (=> bm!28017 m!393417))

(declare-fun m!393419 () Bool)

(assert (=> b!399439 m!393419))

(declare-fun m!393421 () Bool)

(assert (=> b!399435 m!393421))

(declare-fun m!393423 () Bool)

(assert (=> b!399436 m!393423))

(declare-fun m!393425 () Bool)

(assert (=> b!399437 m!393425))

(declare-fun m!393427 () Bool)

(assert (=> b!399437 m!393427))

(declare-fun m!393429 () Bool)

(assert (=> b!399442 m!393429))

(declare-fun m!393431 () Bool)

(assert (=> mapNonEmpty!16635 m!393431))

(declare-fun m!393433 () Bool)

(assert (=> b!399430 m!393433))

(assert (=> bm!28018 m!393415))

(declare-fun m!393435 () Bool)

(assert (=> bm!28018 m!393435))

(declare-fun m!393437 () Bool)

(assert (=> b!399441 m!393437))

(declare-fun m!393439 () Bool)

(assert (=> b!399433 m!393439))

(declare-fun m!393441 () Bool)

(assert (=> b!399431 m!393441))

(declare-fun m!393443 () Bool)

(assert (=> b!399428 m!393443))

(check-sat (not b_next!9127) (not b!399428) (not b!399435) (not start!38576) (not bm!28017) (not b!399442) (not b!399433) (not mapNonEmpty!16635) (not b!399437) tp_is_empty!10009 (not b!399430) (not b!399441) b_and!16487 (not b!399436) (not b!399431) (not bm!28018))
(check-sat b_and!16487 (not b_next!9127))
