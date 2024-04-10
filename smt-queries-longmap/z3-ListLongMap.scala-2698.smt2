; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40008 () Bool)

(assert start!40008)

(declare-fun b_free!10275 () Bool)

(declare-fun b_next!10275 () Bool)

(assert (=> start!40008 (= b_free!10275 (not b_next!10275))))

(declare-fun tp!36354 () Bool)

(declare-fun b_and!18209 () Bool)

(assert (=> start!40008 (= tp!36354 b_and!18209)))

(declare-fun b!435726 () Bool)

(declare-fun res!256756 () Bool)

(declare-fun e!257391 () Bool)

(assert (=> b!435726 (=> (not res!256756) (not e!257391))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26681 0))(
  ( (array!26682 (arr!12790 (Array (_ BitVec 32) (_ BitVec 64))) (size!13142 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26681)

(assert (=> b!435726 (= res!256756 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13142 _keys!709))))))

(declare-fun b!435727 () Bool)

(declare-fun e!257386 () Bool)

(declare-fun e!257387 () Bool)

(declare-fun mapRes!18762 () Bool)

(assert (=> b!435727 (= e!257386 (and e!257387 mapRes!18762))))

(declare-fun condMapEmpty!18762 () Bool)

(declare-datatypes ((V!16341 0))(
  ( (V!16342 (val!5758 Int)) )
))
(declare-datatypes ((ValueCell!5370 0))(
  ( (ValueCellFull!5370 (v!8005 V!16341)) (EmptyCell!5370) )
))
(declare-datatypes ((array!26683 0))(
  ( (array!26684 (arr!12791 (Array (_ BitVec 32) ValueCell!5370)) (size!13143 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26683)

(declare-fun mapDefault!18762 () ValueCell!5370)

(assert (=> b!435727 (= condMapEmpty!18762 (= (arr!12791 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5370)) mapDefault!18762)))))

(declare-fun mapNonEmpty!18762 () Bool)

(declare-fun tp!36353 () Bool)

(declare-fun e!257383 () Bool)

(assert (=> mapNonEmpty!18762 (= mapRes!18762 (and tp!36353 e!257383))))

(declare-fun mapValue!18762 () ValueCell!5370)

(declare-fun mapRest!18762 () (Array (_ BitVec 32) ValueCell!5370))

(declare-fun mapKey!18762 () (_ BitVec 32))

(assert (=> mapNonEmpty!18762 (= (arr!12791 _values!549) (store mapRest!18762 mapKey!18762 mapValue!18762))))

(declare-fun b!435729 () Bool)

(declare-fun e!257385 () Bool)

(declare-fun e!257388 () Bool)

(assert (=> b!435729 (= e!257385 (not e!257388))))

(declare-fun res!256764 () Bool)

(assert (=> b!435729 (=> res!256764 e!257388)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435729 (= res!256764 (not (validKeyInArray!0 (select (arr!12790 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7624 0))(
  ( (tuple2!7625 (_1!3823 (_ BitVec 64)) (_2!3823 V!16341)) )
))
(declare-datatypes ((List!7626 0))(
  ( (Nil!7623) (Cons!7622 (h!8478 tuple2!7624) (t!13350 List!7626)) )
))
(declare-datatypes ((ListLongMap!6537 0))(
  ( (ListLongMap!6538 (toList!3284 List!7626)) )
))
(declare-fun lt!200699 () ListLongMap!6537)

(declare-fun lt!200703 () ListLongMap!6537)

(assert (=> b!435729 (= lt!200699 lt!200703)))

(declare-fun lt!200696 () ListLongMap!6537)

(declare-fun lt!200697 () tuple2!7624)

(declare-fun +!1432 (ListLongMap!6537 tuple2!7624) ListLongMap!6537)

(assert (=> b!435729 (= lt!200703 (+!1432 lt!200696 lt!200697))))

(declare-fun lt!200698 () array!26683)

(declare-fun minValue!515 () V!16341)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!200702 () array!26681)

(declare-fun zeroValue!515 () V!16341)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1475 (array!26681 array!26683 (_ BitVec 32) (_ BitVec 32) V!16341 V!16341 (_ BitVec 32) Int) ListLongMap!6537)

(assert (=> b!435729 (= lt!200699 (getCurrentListMapNoExtraKeys!1475 lt!200702 lt!200698 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16341)

(assert (=> b!435729 (= lt!200697 (tuple2!7625 k0!794 v!412))))

(assert (=> b!435729 (= lt!200696 (getCurrentListMapNoExtraKeys!1475 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12943 0))(
  ( (Unit!12944) )
))
(declare-fun lt!200693 () Unit!12943)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!604 (array!26681 array!26683 (_ BitVec 32) (_ BitVec 32) V!16341 V!16341 (_ BitVec 32) (_ BitVec 64) V!16341 (_ BitVec 32) Int) Unit!12943)

(assert (=> b!435729 (= lt!200693 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!604 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435730 () Bool)

(declare-fun res!256769 () Bool)

(assert (=> b!435730 (=> (not res!256769) (not e!257391))))

(declare-datatypes ((List!7627 0))(
  ( (Nil!7624) (Cons!7623 (h!8479 (_ BitVec 64)) (t!13351 List!7627)) )
))
(declare-fun arrayNoDuplicates!0 (array!26681 (_ BitVec 32) List!7627) Bool)

(assert (=> b!435730 (= res!256769 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7624))))

(declare-fun b!435731 () Bool)

(declare-fun tp_is_empty!11427 () Bool)

(assert (=> b!435731 (= e!257383 tp_is_empty!11427)))

(declare-fun b!435732 () Bool)

(declare-fun e!257389 () Bool)

(assert (=> b!435732 (= e!257391 e!257389)))

(declare-fun res!256758 () Bool)

(assert (=> b!435732 (=> (not res!256758) (not e!257389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26681 (_ BitVec 32)) Bool)

(assert (=> b!435732 (= res!256758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200702 mask!1025))))

(assert (=> b!435732 (= lt!200702 (array!26682 (store (arr!12790 _keys!709) i!563 k0!794) (size!13142 _keys!709)))))

(declare-fun b!435733 () Bool)

(declare-fun res!256770 () Bool)

(assert (=> b!435733 (=> (not res!256770) (not e!257391))))

(assert (=> b!435733 (= res!256770 (and (= (size!13143 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13142 _keys!709) (size!13143 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!435734 () Bool)

(declare-fun res!256757 () Bool)

(assert (=> b!435734 (=> (not res!256757) (not e!257391))))

(assert (=> b!435734 (= res!256757 (or (= (select (arr!12790 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12790 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435735 () Bool)

(declare-fun res!256767 () Bool)

(assert (=> b!435735 (=> (not res!256767) (not e!257389))))

(assert (=> b!435735 (= res!256767 (bvsle from!863 i!563))))

(declare-fun b!435736 () Bool)

(declare-fun e!257384 () Bool)

(assert (=> b!435736 (= e!257384 true)))

(declare-fun lt!200691 () tuple2!7624)

(declare-fun lt!200701 () ListLongMap!6537)

(assert (=> b!435736 (= lt!200701 (+!1432 (+!1432 lt!200696 lt!200691) lt!200697))))

(declare-fun lt!200695 () Unit!12943)

(declare-fun lt!200704 () V!16341)

(declare-fun addCommutativeForDiffKeys!414 (ListLongMap!6537 (_ BitVec 64) V!16341 (_ BitVec 64) V!16341) Unit!12943)

(assert (=> b!435736 (= lt!200695 (addCommutativeForDiffKeys!414 lt!200696 k0!794 v!412 (select (arr!12790 _keys!709) from!863) lt!200704))))

(declare-fun b!435737 () Bool)

(declare-fun res!256761 () Bool)

(assert (=> b!435737 (=> (not res!256761) (not e!257391))))

(assert (=> b!435737 (= res!256761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435738 () Bool)

(declare-fun e!257382 () Unit!12943)

(declare-fun Unit!12945 () Unit!12943)

(assert (=> b!435738 (= e!257382 Unit!12945)))

(declare-fun lt!200694 () Unit!12943)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26681 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12943)

(assert (=> b!435738 (= lt!200694 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435738 false))

(declare-fun b!435739 () Bool)

(assert (=> b!435739 (= e!257387 tp_is_empty!11427)))

(declare-fun b!435740 () Bool)

(declare-fun res!256765 () Bool)

(assert (=> b!435740 (=> (not res!256765) (not e!257391))))

(declare-fun arrayContainsKey!0 (array!26681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435740 (= res!256765 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!435728 () Bool)

(declare-fun Unit!12946 () Unit!12943)

(assert (=> b!435728 (= e!257382 Unit!12946)))

(declare-fun res!256763 () Bool)

(assert (=> start!40008 (=> (not res!256763) (not e!257391))))

(assert (=> start!40008 (= res!256763 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13142 _keys!709))))))

(assert (=> start!40008 e!257391))

(assert (=> start!40008 tp_is_empty!11427))

(assert (=> start!40008 tp!36354))

(assert (=> start!40008 true))

(declare-fun array_inv!9296 (array!26683) Bool)

(assert (=> start!40008 (and (array_inv!9296 _values!549) e!257386)))

(declare-fun array_inv!9297 (array!26681) Bool)

(assert (=> start!40008 (array_inv!9297 _keys!709)))

(declare-fun b!435741 () Bool)

(declare-fun res!256766 () Bool)

(assert (=> b!435741 (=> (not res!256766) (not e!257391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435741 (= res!256766 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18762 () Bool)

(assert (=> mapIsEmpty!18762 mapRes!18762))

(declare-fun b!435742 () Bool)

(assert (=> b!435742 (= e!257389 e!257385)))

(declare-fun res!256762 () Bool)

(assert (=> b!435742 (=> (not res!256762) (not e!257385))))

(assert (=> b!435742 (= res!256762 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!200705 () ListLongMap!6537)

(assert (=> b!435742 (= lt!200705 (getCurrentListMapNoExtraKeys!1475 lt!200702 lt!200698 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435742 (= lt!200698 (array!26684 (store (arr!12791 _values!549) i!563 (ValueCellFull!5370 v!412)) (size!13143 _values!549)))))

(declare-fun lt!200692 () ListLongMap!6537)

(assert (=> b!435742 (= lt!200692 (getCurrentListMapNoExtraKeys!1475 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435743 () Bool)

(assert (=> b!435743 (= e!257388 e!257384)))

(declare-fun res!256759 () Bool)

(assert (=> b!435743 (=> res!256759 e!257384)))

(assert (=> b!435743 (= res!256759 (= k0!794 (select (arr!12790 _keys!709) from!863)))))

(assert (=> b!435743 (not (= (select (arr!12790 _keys!709) from!863) k0!794))))

(declare-fun lt!200700 () Unit!12943)

(assert (=> b!435743 (= lt!200700 e!257382)))

(declare-fun c!55748 () Bool)

(assert (=> b!435743 (= c!55748 (= (select (arr!12790 _keys!709) from!863) k0!794))))

(assert (=> b!435743 (= lt!200705 lt!200701)))

(assert (=> b!435743 (= lt!200701 (+!1432 lt!200703 lt!200691))))

(assert (=> b!435743 (= lt!200691 (tuple2!7625 (select (arr!12790 _keys!709) from!863) lt!200704))))

(declare-fun get!6377 (ValueCell!5370 V!16341) V!16341)

(declare-fun dynLambda!838 (Int (_ BitVec 64)) V!16341)

(assert (=> b!435743 (= lt!200704 (get!6377 (select (arr!12791 _values!549) from!863) (dynLambda!838 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435744 () Bool)

(declare-fun res!256768 () Bool)

(assert (=> b!435744 (=> (not res!256768) (not e!257391))))

(assert (=> b!435744 (= res!256768 (validKeyInArray!0 k0!794))))

(declare-fun b!435745 () Bool)

(declare-fun res!256760 () Bool)

(assert (=> b!435745 (=> (not res!256760) (not e!257389))))

(assert (=> b!435745 (= res!256760 (arrayNoDuplicates!0 lt!200702 #b00000000000000000000000000000000 Nil!7624))))

(assert (= (and start!40008 res!256763) b!435741))

(assert (= (and b!435741 res!256766) b!435733))

(assert (= (and b!435733 res!256770) b!435737))

(assert (= (and b!435737 res!256761) b!435730))

(assert (= (and b!435730 res!256769) b!435726))

(assert (= (and b!435726 res!256756) b!435744))

(assert (= (and b!435744 res!256768) b!435734))

(assert (= (and b!435734 res!256757) b!435740))

(assert (= (and b!435740 res!256765) b!435732))

(assert (= (and b!435732 res!256758) b!435745))

(assert (= (and b!435745 res!256760) b!435735))

(assert (= (and b!435735 res!256767) b!435742))

(assert (= (and b!435742 res!256762) b!435729))

(assert (= (and b!435729 (not res!256764)) b!435743))

(assert (= (and b!435743 c!55748) b!435738))

(assert (= (and b!435743 (not c!55748)) b!435728))

(assert (= (and b!435743 (not res!256759)) b!435736))

(assert (= (and b!435727 condMapEmpty!18762) mapIsEmpty!18762))

(assert (= (and b!435727 (not condMapEmpty!18762)) mapNonEmpty!18762))

(get-info :version)

(assert (= (and mapNonEmpty!18762 ((_ is ValueCellFull!5370) mapValue!18762)) b!435731))

(assert (= (and b!435727 ((_ is ValueCellFull!5370) mapDefault!18762)) b!435739))

(assert (= start!40008 b!435727))

(declare-fun b_lambda!9363 () Bool)

(assert (=> (not b_lambda!9363) (not b!435743)))

(declare-fun t!13349 () Bool)

(declare-fun tb!3681 () Bool)

(assert (=> (and start!40008 (= defaultEntry!557 defaultEntry!557) t!13349) tb!3681))

(declare-fun result!6889 () Bool)

(assert (=> tb!3681 (= result!6889 tp_is_empty!11427)))

(assert (=> b!435743 t!13349))

(declare-fun b_and!18211 () Bool)

(assert (= b_and!18209 (and (=> t!13349 result!6889) b_and!18211)))

(declare-fun m!423595 () Bool)

(assert (=> b!435730 m!423595))

(declare-fun m!423597 () Bool)

(assert (=> b!435741 m!423597))

(declare-fun m!423599 () Bool)

(assert (=> mapNonEmpty!18762 m!423599))

(declare-fun m!423601 () Bool)

(assert (=> b!435732 m!423601))

(declare-fun m!423603 () Bool)

(assert (=> b!435732 m!423603))

(declare-fun m!423605 () Bool)

(assert (=> b!435737 m!423605))

(declare-fun m!423607 () Bool)

(assert (=> b!435736 m!423607))

(assert (=> b!435736 m!423607))

(declare-fun m!423609 () Bool)

(assert (=> b!435736 m!423609))

(declare-fun m!423611 () Bool)

(assert (=> b!435736 m!423611))

(assert (=> b!435736 m!423611))

(declare-fun m!423613 () Bool)

(assert (=> b!435736 m!423613))

(assert (=> b!435743 m!423611))

(declare-fun m!423615 () Bool)

(assert (=> b!435743 m!423615))

(declare-fun m!423617 () Bool)

(assert (=> b!435743 m!423617))

(declare-fun m!423619 () Bool)

(assert (=> b!435743 m!423619))

(assert (=> b!435743 m!423619))

(assert (=> b!435743 m!423615))

(declare-fun m!423621 () Bool)

(assert (=> b!435743 m!423621))

(declare-fun m!423623 () Bool)

(assert (=> b!435738 m!423623))

(declare-fun m!423625 () Bool)

(assert (=> b!435734 m!423625))

(assert (=> b!435729 m!423611))

(declare-fun m!423627 () Bool)

(assert (=> b!435729 m!423627))

(declare-fun m!423629 () Bool)

(assert (=> b!435729 m!423629))

(assert (=> b!435729 m!423611))

(declare-fun m!423631 () Bool)

(assert (=> b!435729 m!423631))

(declare-fun m!423633 () Bool)

(assert (=> b!435729 m!423633))

(declare-fun m!423635 () Bool)

(assert (=> b!435729 m!423635))

(declare-fun m!423637 () Bool)

(assert (=> start!40008 m!423637))

(declare-fun m!423639 () Bool)

(assert (=> start!40008 m!423639))

(declare-fun m!423641 () Bool)

(assert (=> b!435740 m!423641))

(declare-fun m!423643 () Bool)

(assert (=> b!435745 m!423643))

(declare-fun m!423645 () Bool)

(assert (=> b!435744 m!423645))

(declare-fun m!423647 () Bool)

(assert (=> b!435742 m!423647))

(declare-fun m!423649 () Bool)

(assert (=> b!435742 m!423649))

(declare-fun m!423651 () Bool)

(assert (=> b!435742 m!423651))

(check-sat (not b!435744) (not mapNonEmpty!18762) (not b!435743) (not start!40008) (not b!435742) (not b!435732) (not b!435745) (not b!435740) (not b!435736) tp_is_empty!11427 (not b_lambda!9363) (not b!435738) (not b!435741) (not b!435729) (not b!435730) (not b!435737) b_and!18211 (not b_next!10275))
(check-sat b_and!18211 (not b_next!10275))
