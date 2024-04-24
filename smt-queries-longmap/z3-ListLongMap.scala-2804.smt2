; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40698 () Bool)

(assert start!40698)

(declare-fun b_free!10723 () Bool)

(declare-fun b_next!10723 () Bool)

(assert (=> start!40698 (= b_free!10723 (not b_next!10723))))

(declare-fun tp!37989 () Bool)

(declare-fun b_and!18745 () Bool)

(assert (=> start!40698 (= tp!37989 b_and!18745)))

(declare-fun b!450513 () Bool)

(declare-fun e!263987 () Bool)

(declare-fun tp_is_empty!12061 () Bool)

(assert (=> b!450513 (= e!263987 tp_is_empty!12061)))

(declare-fun b!450514 () Bool)

(declare-fun res!268179 () Bool)

(declare-fun e!263988 () Bool)

(assert (=> b!450514 (=> (not res!268179) (not e!263988))))

(declare-datatypes ((array!27922 0))(
  ( (array!27923 (arr!13406 (Array (_ BitVec 32) (_ BitVec 64))) (size!13758 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27922)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27922 (_ BitVec 32)) Bool)

(assert (=> b!450514 (= res!268179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450515 () Bool)

(declare-fun e!263980 () Bool)

(assert (=> b!450515 (= e!263988 e!263980)))

(declare-fun res!268183 () Bool)

(assert (=> b!450515 (=> (not res!268183) (not e!263980))))

(declare-fun lt!204661 () array!27922)

(assert (=> b!450515 (= res!268183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204661 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450515 (= lt!204661 (array!27923 (store (arr!13406 _keys!709) i!563 k0!794) (size!13758 _keys!709)))))

(declare-fun b!450517 () Bool)

(declare-fun res!268181 () Bool)

(assert (=> b!450517 (=> (not res!268181) (not e!263988))))

(assert (=> b!450517 (= res!268181 (or (= (select (arr!13406 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13406 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!450518 () Bool)

(declare-fun e!263984 () Bool)

(declare-datatypes ((V!17187 0))(
  ( (V!17188 (val!6075 Int)) )
))
(declare-datatypes ((tuple2!7886 0))(
  ( (tuple2!7887 (_1!3954 (_ BitVec 64)) (_2!3954 V!17187)) )
))
(declare-datatypes ((List!7958 0))(
  ( (Nil!7955) (Cons!7954 (h!8810 tuple2!7886) (t!13712 List!7958)) )
))
(declare-datatypes ((ListLongMap!6801 0))(
  ( (ListLongMap!6802 (toList!3416 List!7958)) )
))
(declare-fun call!29749 () ListLongMap!6801)

(declare-fun call!29748 () ListLongMap!6801)

(assert (=> b!450518 (= e!263984 (= call!29749 call!29748))))

(declare-fun b!450519 () Bool)

(declare-fun res!268189 () Bool)

(assert (=> b!450519 (=> (not res!268189) (not e!263988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450519 (= res!268189 (validMask!0 mask!1025))))

(declare-fun b!450520 () Bool)

(declare-fun res!268180 () Bool)

(assert (=> b!450520 (=> (not res!268180) (not e!263980))))

(declare-datatypes ((List!7959 0))(
  ( (Nil!7956) (Cons!7955 (h!8811 (_ BitVec 64)) (t!13713 List!7959)) )
))
(declare-fun arrayNoDuplicates!0 (array!27922 (_ BitVec 32) List!7959) Bool)

(assert (=> b!450520 (= res!268180 (arrayNoDuplicates!0 lt!204661 #b00000000000000000000000000000000 Nil!7956))))

(declare-fun b!450521 () Bool)

(declare-fun res!268182 () Bool)

(assert (=> b!450521 (=> (not res!268182) (not e!263988))))

(assert (=> b!450521 (= res!268182 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7956))))

(declare-fun b!450522 () Bool)

(declare-fun e!263981 () Bool)

(assert (=> b!450522 (= e!263980 e!263981)))

(declare-fun res!268186 () Bool)

(assert (=> b!450522 (=> (not res!268186) (not e!263981))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!450522 (= res!268186 (= from!863 i!563))))

(declare-fun minValue!515 () V!17187)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17187)

(declare-fun lt!204663 () ListLongMap!6801)

(declare-datatypes ((ValueCell!5687 0))(
  ( (ValueCellFull!5687 (v!8331 V!17187)) (EmptyCell!5687) )
))
(declare-datatypes ((array!27924 0))(
  ( (array!27925 (arr!13407 (Array (_ BitVec 32) ValueCell!5687)) (size!13759 (_ BitVec 32))) )
))
(declare-fun lt!204660 () array!27924)

(declare-fun getCurrentListMapNoExtraKeys!1646 (array!27922 array!27924 (_ BitVec 32) (_ BitVec 32) V!17187 V!17187 (_ BitVec 32) Int) ListLongMap!6801)

(assert (=> b!450522 (= lt!204663 (getCurrentListMapNoExtraKeys!1646 lt!204661 lt!204660 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27924)

(declare-fun v!412 () V!17187)

(assert (=> b!450522 (= lt!204660 (array!27925 (store (arr!13407 _values!549) i!563 (ValueCellFull!5687 v!412)) (size!13759 _values!549)))))

(declare-fun lt!204662 () ListLongMap!6801)

(assert (=> b!450522 (= lt!204662 (getCurrentListMapNoExtraKeys!1646 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450523 () Bool)

(declare-fun res!268184 () Bool)

(assert (=> b!450523 (=> (not res!268184) (not e!263988))))

(assert (=> b!450523 (= res!268184 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13758 _keys!709))))))

(declare-fun b!450524 () Bool)

(declare-fun res!268185 () Bool)

(assert (=> b!450524 (=> (not res!268185) (not e!263988))))

(assert (=> b!450524 (= res!268185 (and (= (size!13759 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13758 _keys!709) (size!13759 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19725 () Bool)

(declare-fun mapRes!19725 () Bool)

(declare-fun tp!37988 () Bool)

(assert (=> mapNonEmpty!19725 (= mapRes!19725 (and tp!37988 e!263987))))

(declare-fun mapKey!19725 () (_ BitVec 32))

(declare-fun mapValue!19725 () ValueCell!5687)

(declare-fun mapRest!19725 () (Array (_ BitVec 32) ValueCell!5687))

(assert (=> mapNonEmpty!19725 (= (arr!13407 _values!549) (store mapRest!19725 mapKey!19725 mapValue!19725))))

(declare-fun b!450516 () Bool)

(declare-fun +!1545 (ListLongMap!6801 tuple2!7886) ListLongMap!6801)

(assert (=> b!450516 (= e!263984 (= call!29748 (+!1545 call!29749 (tuple2!7887 k0!794 v!412))))))

(declare-fun res!268190 () Bool)

(assert (=> start!40698 (=> (not res!268190) (not e!263988))))

(assert (=> start!40698 (= res!268190 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13758 _keys!709))))))

(assert (=> start!40698 e!263988))

(assert (=> start!40698 tp_is_empty!12061))

(assert (=> start!40698 tp!37989))

(assert (=> start!40698 true))

(declare-fun e!263985 () Bool)

(declare-fun array_inv!9790 (array!27924) Bool)

(assert (=> start!40698 (and (array_inv!9790 _values!549) e!263985)))

(declare-fun array_inv!9791 (array!27922) Bool)

(assert (=> start!40698 (array_inv!9791 _keys!709)))

(declare-fun bm!29745 () Bool)

(declare-fun c!55968 () Bool)

(assert (=> bm!29745 (= call!29748 (getCurrentListMapNoExtraKeys!1646 (ite c!55968 lt!204661 _keys!709) (ite c!55968 lt!204660 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450525 () Bool)

(declare-fun res!268178 () Bool)

(assert (=> b!450525 (=> (not res!268178) (not e!263988))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450525 (= res!268178 (validKeyInArray!0 k0!794))))

(declare-fun bm!29746 () Bool)

(assert (=> bm!29746 (= call!29749 (getCurrentListMapNoExtraKeys!1646 (ite c!55968 _keys!709 lt!204661) (ite c!55968 _values!549 lt!204660) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450526 () Bool)

(declare-fun e!263986 () Bool)

(assert (=> b!450526 (= e!263985 (and e!263986 mapRes!19725))))

(declare-fun condMapEmpty!19725 () Bool)

(declare-fun mapDefault!19725 () ValueCell!5687)

(assert (=> b!450526 (= condMapEmpty!19725 (= (arr!13407 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5687)) mapDefault!19725)))))

(declare-fun b!450527 () Bool)

(declare-fun e!263983 () Bool)

(assert (=> b!450527 (= e!263983 (bvslt i!563 (size!13759 _values!549)))))

(declare-fun b!450528 () Bool)

(assert (=> b!450528 (= e!263986 tp_is_empty!12061)))

(declare-fun mapIsEmpty!19725 () Bool)

(assert (=> mapIsEmpty!19725 mapRes!19725))

(declare-fun b!450529 () Bool)

(declare-fun res!268187 () Bool)

(assert (=> b!450529 (=> (not res!268187) (not e!263988))))

(declare-fun arrayContainsKey!0 (array!27922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450529 (= res!268187 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!450530 () Bool)

(declare-fun res!268188 () Bool)

(assert (=> b!450530 (=> (not res!268188) (not e!263980))))

(assert (=> b!450530 (= res!268188 (bvsle from!863 i!563))))

(declare-fun b!450531 () Bool)

(assert (=> b!450531 (= e!263981 (not e!263983))))

(declare-fun res!268191 () Bool)

(assert (=> b!450531 (=> res!268191 e!263983)))

(assert (=> b!450531 (= res!268191 (validKeyInArray!0 (select (arr!13406 _keys!709) from!863)))))

(assert (=> b!450531 e!263984))

(assert (=> b!450531 (= c!55968 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13175 0))(
  ( (Unit!13176) )
))
(declare-fun lt!204664 () Unit!13175)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!708 (array!27922 array!27924 (_ BitVec 32) (_ BitVec 32) V!17187 V!17187 (_ BitVec 32) (_ BitVec 64) V!17187 (_ BitVec 32) Int) Unit!13175)

(assert (=> b!450531 (= lt!204664 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!708 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40698 res!268190) b!450519))

(assert (= (and b!450519 res!268189) b!450524))

(assert (= (and b!450524 res!268185) b!450514))

(assert (= (and b!450514 res!268179) b!450521))

(assert (= (and b!450521 res!268182) b!450523))

(assert (= (and b!450523 res!268184) b!450525))

(assert (= (and b!450525 res!268178) b!450517))

(assert (= (and b!450517 res!268181) b!450529))

(assert (= (and b!450529 res!268187) b!450515))

(assert (= (and b!450515 res!268183) b!450520))

(assert (= (and b!450520 res!268180) b!450530))

(assert (= (and b!450530 res!268188) b!450522))

(assert (= (and b!450522 res!268186) b!450531))

(assert (= (and b!450531 c!55968) b!450516))

(assert (= (and b!450531 (not c!55968)) b!450518))

(assert (= (or b!450516 b!450518) bm!29745))

(assert (= (or b!450516 b!450518) bm!29746))

(assert (= (and b!450531 (not res!268191)) b!450527))

(assert (= (and b!450526 condMapEmpty!19725) mapIsEmpty!19725))

(assert (= (and b!450526 (not condMapEmpty!19725)) mapNonEmpty!19725))

(get-info :version)

(assert (= (and mapNonEmpty!19725 ((_ is ValueCellFull!5687) mapValue!19725)) b!450513))

(assert (= (and b!450526 ((_ is ValueCellFull!5687) mapDefault!19725)) b!450528))

(assert (= start!40698 b!450526))

(declare-fun m!434649 () Bool)

(assert (=> b!450525 m!434649))

(declare-fun m!434651 () Bool)

(assert (=> b!450522 m!434651))

(declare-fun m!434653 () Bool)

(assert (=> b!450522 m!434653))

(declare-fun m!434655 () Bool)

(assert (=> b!450522 m!434655))

(declare-fun m!434657 () Bool)

(assert (=> mapNonEmpty!19725 m!434657))

(declare-fun m!434659 () Bool)

(assert (=> bm!29745 m!434659))

(declare-fun m!434661 () Bool)

(assert (=> b!450517 m!434661))

(declare-fun m!434663 () Bool)

(assert (=> b!450516 m!434663))

(declare-fun m!434665 () Bool)

(assert (=> bm!29746 m!434665))

(declare-fun m!434667 () Bool)

(assert (=> b!450529 m!434667))

(declare-fun m!434669 () Bool)

(assert (=> b!450515 m!434669))

(declare-fun m!434671 () Bool)

(assert (=> b!450515 m!434671))

(declare-fun m!434673 () Bool)

(assert (=> b!450520 m!434673))

(declare-fun m!434675 () Bool)

(assert (=> start!40698 m!434675))

(declare-fun m!434677 () Bool)

(assert (=> start!40698 m!434677))

(declare-fun m!434679 () Bool)

(assert (=> b!450514 m!434679))

(declare-fun m!434681 () Bool)

(assert (=> b!450521 m!434681))

(declare-fun m!434683 () Bool)

(assert (=> b!450531 m!434683))

(assert (=> b!450531 m!434683))

(declare-fun m!434685 () Bool)

(assert (=> b!450531 m!434685))

(declare-fun m!434687 () Bool)

(assert (=> b!450531 m!434687))

(declare-fun m!434689 () Bool)

(assert (=> b!450519 m!434689))

(check-sat (not b!450514) (not start!40698) (not b!450531) (not b!450520) (not bm!29745) (not b!450515) (not b_next!10723) (not b!450519) (not b!450516) (not mapNonEmpty!19725) tp_is_empty!12061 (not b!450522) (not b!450521) (not b!450529) (not bm!29746) b_and!18745 (not b!450525))
(check-sat b_and!18745 (not b_next!10723))
