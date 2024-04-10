; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39318 () Bool)

(assert start!39318)

(declare-fun b_free!9585 () Bool)

(declare-fun b_next!9585 () Bool)

(assert (=> start!39318 (= b_free!9585 (not b_next!9585))))

(declare-fun tp!34283 () Bool)

(declare-fun b_and!17045 () Bool)

(assert (=> start!39318 (= tp!34283 b_and!17045)))

(declare-fun b!416545 () Bool)

(declare-fun res!242480 () Bool)

(declare-fun e!248652 () Bool)

(assert (=> b!416545 (=> (not res!242480) (not e!248652))))

(declare-datatypes ((array!25329 0))(
  ( (array!25330 (arr!12114 (Array (_ BitVec 32) (_ BitVec 64))) (size!12466 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25329)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416545 (= res!242480 (or (= (select (arr!12114 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12114 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!416546 () Bool)

(declare-fun e!248653 () Bool)

(declare-datatypes ((V!15421 0))(
  ( (V!15422 (val!5413 Int)) )
))
(declare-datatypes ((tuple2!7060 0))(
  ( (tuple2!7061 (_1!3541 (_ BitVec 64)) (_2!3541 V!15421)) )
))
(declare-datatypes ((List!7078 0))(
  ( (Nil!7075) (Cons!7074 (h!7930 tuple2!7060) (t!12328 List!7078)) )
))
(declare-datatypes ((ListLongMap!5973 0))(
  ( (ListLongMap!5974 (toList!3002 List!7078)) )
))
(declare-fun call!28933 () ListLongMap!5973)

(declare-fun call!28934 () ListLongMap!5973)

(assert (=> b!416546 (= e!248653 (= call!28933 call!28934))))

(declare-fun b!416547 () Bool)

(declare-fun res!242478 () Bool)

(assert (=> b!416547 (=> (not res!242478) (not e!248652))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25329 (_ BitVec 32)) Bool)

(assert (=> b!416547 (= res!242478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416548 () Bool)

(declare-fun res!242479 () Bool)

(assert (=> b!416548 (=> (not res!242479) (not e!248652))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5025 0))(
  ( (ValueCellFull!5025 (v!7660 V!15421)) (EmptyCell!5025) )
))
(declare-datatypes ((array!25331 0))(
  ( (array!25332 (arr!12115 (Array (_ BitVec 32) ValueCell!5025)) (size!12467 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25331)

(assert (=> b!416548 (= res!242479 (and (= (size!12467 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12466 _keys!709) (size!12467 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416549 () Bool)

(declare-fun res!242475 () Bool)

(declare-fun e!248649 () Bool)

(assert (=> b!416549 (=> (not res!242475) (not e!248649))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!416549 (= res!242475 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!17727 () Bool)

(declare-fun mapRes!17727 () Bool)

(assert (=> mapIsEmpty!17727 mapRes!17727))

(declare-fun res!242472 () Bool)

(assert (=> start!39318 (=> (not res!242472) (not e!248652))))

(assert (=> start!39318 (= res!242472 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12466 _keys!709))))))

(assert (=> start!39318 e!248652))

(declare-fun tp_is_empty!10737 () Bool)

(assert (=> start!39318 tp_is_empty!10737))

(assert (=> start!39318 tp!34283))

(assert (=> start!39318 true))

(declare-fun e!248650 () Bool)

(declare-fun array_inv!8834 (array!25331) Bool)

(assert (=> start!39318 (and (array_inv!8834 _values!549) e!248650)))

(declare-fun array_inv!8835 (array!25329) Bool)

(assert (=> start!39318 (array_inv!8835 _keys!709)))

(declare-fun b!416550 () Bool)

(declare-fun res!242476 () Bool)

(assert (=> b!416550 (=> (not res!242476) (not e!248652))))

(declare-datatypes ((List!7079 0))(
  ( (Nil!7076) (Cons!7075 (h!7931 (_ BitVec 64)) (t!12329 List!7079)) )
))
(declare-fun arrayNoDuplicates!0 (array!25329 (_ BitVec 32) List!7079) Bool)

(assert (=> b!416550 (= res!242476 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7076))))

(declare-fun b!416551 () Bool)

(declare-fun res!242468 () Bool)

(assert (=> b!416551 (=> (not res!242468) (not e!248652))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416551 (= res!242468 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!416552 () Bool)

(declare-fun v!412 () V!15421)

(declare-fun +!1204 (ListLongMap!5973 tuple2!7060) ListLongMap!5973)

(assert (=> b!416552 (= e!248653 (= call!28934 (+!1204 call!28933 (tuple2!7061 k0!794 v!412))))))

(declare-fun b!416553 () Bool)

(assert (=> b!416553 (= e!248652 e!248649)))

(declare-fun res!242470 () Bool)

(assert (=> b!416553 (=> (not res!242470) (not e!248649))))

(declare-fun lt!190732 () array!25329)

(assert (=> b!416553 (= res!242470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190732 mask!1025))))

(assert (=> b!416553 (= lt!190732 (array!25330 (store (arr!12114 _keys!709) i!563 k0!794) (size!12466 _keys!709)))))

(declare-fun b!416554 () Bool)

(declare-fun e!248651 () Bool)

(declare-fun e!248648 () Bool)

(assert (=> b!416554 (= e!248651 (not e!248648))))

(declare-fun res!242477 () Bool)

(assert (=> b!416554 (=> res!242477 e!248648)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416554 (= res!242477 (validKeyInArray!0 (select (arr!12114 _keys!709) from!863)))))

(assert (=> b!416554 e!248653))

(declare-fun c!55091 () Bool)

(assert (=> b!416554 (= c!55091 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((Unit!12312 0))(
  ( (Unit!12313) )
))
(declare-fun lt!190728 () Unit!12312)

(declare-fun zeroValue!515 () V!15421)

(declare-fun minValue!515 () V!15421)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!412 (array!25329 array!25331 (_ BitVec 32) (_ BitVec 32) V!15421 V!15421 (_ BitVec 32) (_ BitVec 64) V!15421 (_ BitVec 32) Int) Unit!12312)

(assert (=> b!416554 (= lt!190728 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!412 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416555 () Bool)

(declare-fun res!242474 () Bool)

(assert (=> b!416555 (=> (not res!242474) (not e!248649))))

(assert (=> b!416555 (= res!242474 (arrayNoDuplicates!0 lt!190732 #b00000000000000000000000000000000 Nil!7076))))

(declare-fun b!416556 () Bool)

(declare-fun res!242481 () Bool)

(assert (=> b!416556 (=> (not res!242481) (not e!248652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416556 (= res!242481 (validMask!0 mask!1025))))

(declare-fun b!416557 () Bool)

(declare-fun e!248655 () Bool)

(assert (=> b!416557 (= e!248650 (and e!248655 mapRes!17727))))

(declare-fun condMapEmpty!17727 () Bool)

(declare-fun mapDefault!17727 () ValueCell!5025)

(assert (=> b!416557 (= condMapEmpty!17727 (= (arr!12115 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5025)) mapDefault!17727)))))

(declare-fun b!416558 () Bool)

(assert (=> b!416558 (= e!248649 e!248651)))

(declare-fun res!242469 () Bool)

(assert (=> b!416558 (=> (not res!242469) (not e!248651))))

(assert (=> b!416558 (= res!242469 (= from!863 i!563))))

(declare-fun lt!190730 () array!25331)

(declare-fun lt!190734 () ListLongMap!5973)

(declare-fun getCurrentListMapNoExtraKeys!1207 (array!25329 array!25331 (_ BitVec 32) (_ BitVec 32) V!15421 V!15421 (_ BitVec 32) Int) ListLongMap!5973)

(assert (=> b!416558 (= lt!190734 (getCurrentListMapNoExtraKeys!1207 lt!190732 lt!190730 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!416558 (= lt!190730 (array!25332 (store (arr!12115 _values!549) i!563 (ValueCellFull!5025 v!412)) (size!12467 _values!549)))))

(declare-fun lt!190726 () ListLongMap!5973)

(assert (=> b!416558 (= lt!190726 (getCurrentListMapNoExtraKeys!1207 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!17727 () Bool)

(declare-fun tp!34284 () Bool)

(declare-fun e!248654 () Bool)

(assert (=> mapNonEmpty!17727 (= mapRes!17727 (and tp!34284 e!248654))))

(declare-fun mapRest!17727 () (Array (_ BitVec 32) ValueCell!5025))

(declare-fun mapValue!17727 () ValueCell!5025)

(declare-fun mapKey!17727 () (_ BitVec 32))

(assert (=> mapNonEmpty!17727 (= (arr!12115 _values!549) (store mapRest!17727 mapKey!17727 mapValue!17727))))

(declare-fun b!416559 () Bool)

(assert (=> b!416559 (= e!248655 tp_is_empty!10737)))

(declare-fun bm!28930 () Bool)

(assert (=> bm!28930 (= call!28933 (getCurrentListMapNoExtraKeys!1207 (ite c!55091 _keys!709 lt!190732) (ite c!55091 _values!549 lt!190730) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28931 () Bool)

(assert (=> bm!28931 (= call!28934 (getCurrentListMapNoExtraKeys!1207 (ite c!55091 lt!190732 _keys!709) (ite c!55091 lt!190730 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416560 () Bool)

(assert (=> b!416560 (= e!248648 true)))

(declare-fun lt!190733 () tuple2!7060)

(declare-fun lt!190735 () V!15421)

(declare-fun lt!190731 () ListLongMap!5973)

(assert (=> b!416560 (= (+!1204 lt!190731 lt!190733) (+!1204 (+!1204 lt!190731 (tuple2!7061 k0!794 lt!190735)) lt!190733))))

(declare-fun lt!190727 () V!15421)

(assert (=> b!416560 (= lt!190733 (tuple2!7061 k0!794 lt!190727))))

(declare-fun lt!190736 () Unit!12312)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!8 (ListLongMap!5973 (_ BitVec 64) V!15421 V!15421) Unit!12312)

(assert (=> b!416560 (= lt!190736 (addSameAsAddTwiceSameKeyDiffValues!8 lt!190731 k0!794 lt!190735 lt!190727))))

(declare-fun lt!190729 () V!15421)

(declare-fun get!5988 (ValueCell!5025 V!15421) V!15421)

(assert (=> b!416560 (= lt!190735 (get!5988 (select (arr!12115 _values!549) from!863) lt!190729))))

(assert (=> b!416560 (= lt!190734 (+!1204 lt!190731 (tuple2!7061 (select (arr!12114 lt!190732) from!863) lt!190727)))))

(assert (=> b!416560 (= lt!190727 (get!5988 (select (store (arr!12115 _values!549) i!563 (ValueCellFull!5025 v!412)) from!863) lt!190729))))

(declare-fun dynLambda!679 (Int (_ BitVec 64)) V!15421)

(assert (=> b!416560 (= lt!190729 (dynLambda!679 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416560 (= lt!190731 (getCurrentListMapNoExtraKeys!1207 lt!190732 lt!190730 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416561 () Bool)

(assert (=> b!416561 (= e!248654 tp_is_empty!10737)))

(declare-fun b!416562 () Bool)

(declare-fun res!242473 () Bool)

(assert (=> b!416562 (=> (not res!242473) (not e!248652))))

(assert (=> b!416562 (= res!242473 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12466 _keys!709))))))

(declare-fun b!416563 () Bool)

(declare-fun res!242471 () Bool)

(assert (=> b!416563 (=> (not res!242471) (not e!248652))))

(assert (=> b!416563 (= res!242471 (validKeyInArray!0 k0!794))))

(assert (= (and start!39318 res!242472) b!416556))

(assert (= (and b!416556 res!242481) b!416548))

(assert (= (and b!416548 res!242479) b!416547))

(assert (= (and b!416547 res!242478) b!416550))

(assert (= (and b!416550 res!242476) b!416562))

(assert (= (and b!416562 res!242473) b!416563))

(assert (= (and b!416563 res!242471) b!416545))

(assert (= (and b!416545 res!242480) b!416551))

(assert (= (and b!416551 res!242468) b!416553))

(assert (= (and b!416553 res!242470) b!416555))

(assert (= (and b!416555 res!242474) b!416549))

(assert (= (and b!416549 res!242475) b!416558))

(assert (= (and b!416558 res!242469) b!416554))

(assert (= (and b!416554 c!55091) b!416552))

(assert (= (and b!416554 (not c!55091)) b!416546))

(assert (= (or b!416552 b!416546) bm!28931))

(assert (= (or b!416552 b!416546) bm!28930))

(assert (= (and b!416554 (not res!242477)) b!416560))

(assert (= (and b!416557 condMapEmpty!17727) mapIsEmpty!17727))

(assert (= (and b!416557 (not condMapEmpty!17727)) mapNonEmpty!17727))

(get-info :version)

(assert (= (and mapNonEmpty!17727 ((_ is ValueCellFull!5025) mapValue!17727)) b!416561))

(assert (= (and b!416557 ((_ is ValueCellFull!5025) mapDefault!17727)) b!416559))

(assert (= start!39318 b!416557))

(declare-fun b_lambda!8889 () Bool)

(assert (=> (not b_lambda!8889) (not b!416560)))

(declare-fun t!12327 () Bool)

(declare-fun tb!3207 () Bool)

(assert (=> (and start!39318 (= defaultEntry!557 defaultEntry!557) t!12327) tb!3207))

(declare-fun result!5941 () Bool)

(assert (=> tb!3207 (= result!5941 tp_is_empty!10737)))

(assert (=> b!416560 t!12327))

(declare-fun b_and!17047 () Bool)

(assert (= b_and!17045 (and (=> t!12327 result!5941) b_and!17047)))

(declare-fun m!405707 () Bool)

(assert (=> b!416547 m!405707))

(declare-fun m!405709 () Bool)

(assert (=> b!416552 m!405709))

(declare-fun m!405711 () Bool)

(assert (=> bm!28930 m!405711))

(declare-fun m!405713 () Bool)

(assert (=> b!416554 m!405713))

(assert (=> b!416554 m!405713))

(declare-fun m!405715 () Bool)

(assert (=> b!416554 m!405715))

(declare-fun m!405717 () Bool)

(assert (=> b!416554 m!405717))

(declare-fun m!405719 () Bool)

(assert (=> b!416550 m!405719))

(declare-fun m!405721 () Bool)

(assert (=> b!416563 m!405721))

(declare-fun m!405723 () Bool)

(assert (=> bm!28931 m!405723))

(declare-fun m!405725 () Bool)

(assert (=> b!416556 m!405725))

(declare-fun m!405727 () Bool)

(assert (=> b!416553 m!405727))

(declare-fun m!405729 () Bool)

(assert (=> b!416553 m!405729))

(declare-fun m!405731 () Bool)

(assert (=> start!39318 m!405731))

(declare-fun m!405733 () Bool)

(assert (=> start!39318 m!405733))

(declare-fun m!405735 () Bool)

(assert (=> b!416560 m!405735))

(declare-fun m!405737 () Bool)

(assert (=> b!416560 m!405737))

(declare-fun m!405739 () Bool)

(assert (=> b!416560 m!405739))

(declare-fun m!405741 () Bool)

(assert (=> b!416560 m!405741))

(declare-fun m!405743 () Bool)

(assert (=> b!416560 m!405743))

(declare-fun m!405745 () Bool)

(assert (=> b!416560 m!405745))

(declare-fun m!405747 () Bool)

(assert (=> b!416560 m!405747))

(assert (=> b!416560 m!405747))

(declare-fun m!405749 () Bool)

(assert (=> b!416560 m!405749))

(assert (=> b!416560 m!405735))

(declare-fun m!405751 () Bool)

(assert (=> b!416560 m!405751))

(declare-fun m!405753 () Bool)

(assert (=> b!416560 m!405753))

(declare-fun m!405755 () Bool)

(assert (=> b!416560 m!405755))

(declare-fun m!405757 () Bool)

(assert (=> b!416560 m!405757))

(declare-fun m!405759 () Bool)

(assert (=> b!416560 m!405759))

(assert (=> b!416560 m!405737))

(declare-fun m!405761 () Bool)

(assert (=> mapNonEmpty!17727 m!405761))

(declare-fun m!405763 () Bool)

(assert (=> b!416551 m!405763))

(declare-fun m!405765 () Bool)

(assert (=> b!416555 m!405765))

(declare-fun m!405767 () Bool)

(assert (=> b!416558 m!405767))

(assert (=> b!416558 m!405745))

(declare-fun m!405769 () Bool)

(assert (=> b!416558 m!405769))

(declare-fun m!405771 () Bool)

(assert (=> b!416545 m!405771))

(check-sat (not start!39318) (not b!416554) (not bm!28931) (not bm!28930) (not b_next!9585) tp_is_empty!10737 (not b!416551) (not b!416558) (not b_lambda!8889) (not b!416550) (not b!416552) (not mapNonEmpty!17727) (not b!416547) (not b!416560) (not b!416555) b_and!17047 (not b!416556) (not b!416553) (not b!416563))
(check-sat b_and!17047 (not b_next!9585))
