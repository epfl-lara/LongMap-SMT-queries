; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39992 () Bool)

(assert start!39992)

(declare-fun b_free!10273 () Bool)

(declare-fun b_next!10273 () Bool)

(assert (=> start!39992 (= b_free!10273 (not b_next!10273))))

(declare-fun tp!36348 () Bool)

(declare-fun b_and!18219 () Bool)

(assert (=> start!39992 (= tp!36348 b_and!18219)))

(declare-fun mapIsEmpty!18759 () Bool)

(declare-fun mapRes!18759 () Bool)

(assert (=> mapIsEmpty!18759 mapRes!18759))

(declare-fun b!435615 () Bool)

(declare-fun res!256714 () Bool)

(declare-fun e!257326 () Bool)

(assert (=> b!435615 (=> (not res!256714) (not e!257326))))

(declare-datatypes ((array!26680 0))(
  ( (array!26681 (arr!12789 (Array (_ BitVec 32) (_ BitVec 64))) (size!13141 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26680)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435615 (= res!256714 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!435616 () Bool)

(declare-datatypes ((Unit!12933 0))(
  ( (Unit!12934) )
))
(declare-fun e!257329 () Unit!12933)

(declare-fun Unit!12935 () Unit!12933)

(assert (=> b!435616 (= e!257329 Unit!12935)))

(declare-fun b!435617 () Bool)

(declare-fun e!257321 () Bool)

(declare-fun e!257320 () Bool)

(assert (=> b!435617 (= e!257321 (and e!257320 mapRes!18759))))

(declare-fun condMapEmpty!18759 () Bool)

(declare-datatypes ((V!16339 0))(
  ( (V!16340 (val!5757 Int)) )
))
(declare-datatypes ((ValueCell!5369 0))(
  ( (ValueCellFull!5369 (v!8005 V!16339)) (EmptyCell!5369) )
))
(declare-datatypes ((array!26682 0))(
  ( (array!26683 (arr!12790 (Array (_ BitVec 32) ValueCell!5369)) (size!13142 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26682)

(declare-fun mapDefault!18759 () ValueCell!5369)

(assert (=> b!435617 (= condMapEmpty!18759 (= (arr!12790 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5369)) mapDefault!18759)))))

(declare-fun b!435618 () Bool)

(declare-fun e!257328 () Bool)

(declare-fun tp_is_empty!11425 () Bool)

(assert (=> b!435618 (= e!257328 tp_is_empty!11425)))

(declare-fun b!435619 () Bool)

(declare-fun res!256715 () Bool)

(declare-fun e!257324 () Bool)

(assert (=> b!435619 (=> (not res!256715) (not e!257324))))

(declare-fun lt!200668 () array!26680)

(declare-datatypes ((List!7516 0))(
  ( (Nil!7513) (Cons!7512 (h!8368 (_ BitVec 64)) (t!13230 List!7516)) )
))
(declare-fun arrayNoDuplicates!0 (array!26680 (_ BitVec 32) List!7516) Bool)

(assert (=> b!435619 (= res!256715 (arrayNoDuplicates!0 lt!200668 #b00000000000000000000000000000000 Nil!7513))))

(declare-fun b!435620 () Bool)

(declare-fun e!257322 () Bool)

(assert (=> b!435620 (= e!257322 true)))

(declare-datatypes ((tuple2!7526 0))(
  ( (tuple2!7527 (_1!3774 (_ BitVec 64)) (_2!3774 V!16339)) )
))
(declare-fun lt!200677 () tuple2!7526)

(declare-fun lt!200674 () tuple2!7526)

(declare-datatypes ((List!7517 0))(
  ( (Nil!7514) (Cons!7513 (h!8369 tuple2!7526) (t!13231 List!7517)) )
))
(declare-datatypes ((ListLongMap!6441 0))(
  ( (ListLongMap!6442 (toList!3236 List!7517)) )
))
(declare-fun lt!200675 () ListLongMap!6441)

(declare-fun lt!200666 () ListLongMap!6441)

(declare-fun +!1440 (ListLongMap!6441 tuple2!7526) ListLongMap!6441)

(assert (=> b!435620 (= lt!200666 (+!1440 (+!1440 lt!200675 lt!200674) lt!200677))))

(declare-fun lt!200669 () V!16339)

(declare-fun v!412 () V!16339)

(declare-fun lt!200679 () Unit!12933)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!409 (ListLongMap!6441 (_ BitVec 64) V!16339 (_ BitVec 64) V!16339) Unit!12933)

(assert (=> b!435620 (= lt!200679 (addCommutativeForDiffKeys!409 lt!200675 k0!794 v!412 (select (arr!12789 _keys!709) from!863) lt!200669))))

(declare-fun mapNonEmpty!18759 () Bool)

(declare-fun tp!36347 () Bool)

(assert (=> mapNonEmpty!18759 (= mapRes!18759 (and tp!36347 e!257328))))

(declare-fun mapValue!18759 () ValueCell!5369)

(declare-fun mapKey!18759 () (_ BitVec 32))

(declare-fun mapRest!18759 () (Array (_ BitVec 32) ValueCell!5369))

(assert (=> mapNonEmpty!18759 (= (arr!12790 _values!549) (store mapRest!18759 mapKey!18759 mapValue!18759))))

(declare-fun b!435621 () Bool)

(declare-fun res!256710 () Bool)

(assert (=> b!435621 (=> (not res!256710) (not e!257326))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26680 (_ BitVec 32)) Bool)

(assert (=> b!435621 (= res!256710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435622 () Bool)

(assert (=> b!435622 (= e!257326 e!257324)))

(declare-fun res!256721 () Bool)

(assert (=> b!435622 (=> (not res!256721) (not e!257324))))

(assert (=> b!435622 (= res!256721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200668 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435622 (= lt!200668 (array!26681 (store (arr!12789 _keys!709) i!563 k0!794) (size!13141 _keys!709)))))

(declare-fun b!435623 () Bool)

(declare-fun res!256722 () Bool)

(assert (=> b!435623 (=> (not res!256722) (not e!257326))))

(assert (=> b!435623 (= res!256722 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7513))))

(declare-fun b!435624 () Bool)

(declare-fun e!257323 () Bool)

(assert (=> b!435624 (= e!257324 e!257323)))

(declare-fun res!256711 () Bool)

(assert (=> b!435624 (=> (not res!256711) (not e!257323))))

(assert (=> b!435624 (= res!256711 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!200672 () ListLongMap!6441)

(declare-fun minValue!515 () V!16339)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16339)

(declare-fun lt!200671 () array!26682)

(declare-fun getCurrentListMapNoExtraKeys!1470 (array!26680 array!26682 (_ BitVec 32) (_ BitVec 32) V!16339 V!16339 (_ BitVec 32) Int) ListLongMap!6441)

(assert (=> b!435624 (= lt!200672 (getCurrentListMapNoExtraKeys!1470 lt!200668 lt!200671 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435624 (= lt!200671 (array!26683 (store (arr!12790 _values!549) i!563 (ValueCellFull!5369 v!412)) (size!13142 _values!549)))))

(declare-fun lt!200667 () ListLongMap!6441)

(assert (=> b!435624 (= lt!200667 (getCurrentListMapNoExtraKeys!1470 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435625 () Bool)

(assert (=> b!435625 (= e!257320 tp_is_empty!11425)))

(declare-fun b!435626 () Bool)

(declare-fun e!257325 () Bool)

(assert (=> b!435626 (= e!257323 (not e!257325))))

(declare-fun res!256712 () Bool)

(assert (=> b!435626 (=> res!256712 e!257325)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435626 (= res!256712 (not (validKeyInArray!0 (select (arr!12789 _keys!709) from!863))))))

(declare-fun lt!200673 () ListLongMap!6441)

(declare-fun lt!200676 () ListLongMap!6441)

(assert (=> b!435626 (= lt!200673 lt!200676)))

(assert (=> b!435626 (= lt!200676 (+!1440 lt!200675 lt!200677))))

(assert (=> b!435626 (= lt!200673 (getCurrentListMapNoExtraKeys!1470 lt!200668 lt!200671 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!435626 (= lt!200677 (tuple2!7527 k0!794 v!412))))

(assert (=> b!435626 (= lt!200675 (getCurrentListMapNoExtraKeys!1470 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200678 () Unit!12933)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!602 (array!26680 array!26682 (_ BitVec 32) (_ BitVec 32) V!16339 V!16339 (_ BitVec 32) (_ BitVec 64) V!16339 (_ BitVec 32) Int) Unit!12933)

(assert (=> b!435626 (= lt!200678 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!602 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435627 () Bool)

(declare-fun res!256717 () Bool)

(assert (=> b!435627 (=> (not res!256717) (not e!257324))))

(assert (=> b!435627 (= res!256717 (bvsle from!863 i!563))))

(declare-fun b!435628 () Bool)

(declare-fun res!256709 () Bool)

(assert (=> b!435628 (=> (not res!256709) (not e!257326))))

(assert (=> b!435628 (= res!256709 (validKeyInArray!0 k0!794))))

(declare-fun b!435629 () Bool)

(declare-fun Unit!12936 () Unit!12933)

(assert (=> b!435629 (= e!257329 Unit!12936)))

(declare-fun lt!200670 () Unit!12933)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26680 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12933)

(assert (=> b!435629 (= lt!200670 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435629 false))

(declare-fun b!435630 () Bool)

(declare-fun res!256713 () Bool)

(assert (=> b!435630 (=> (not res!256713) (not e!257326))))

(assert (=> b!435630 (= res!256713 (or (= (select (arr!12789 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12789 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435631 () Bool)

(assert (=> b!435631 (= e!257325 e!257322)))

(declare-fun res!256718 () Bool)

(assert (=> b!435631 (=> res!256718 e!257322)))

(assert (=> b!435631 (= res!256718 (= k0!794 (select (arr!12789 _keys!709) from!863)))))

(assert (=> b!435631 (not (= (select (arr!12789 _keys!709) from!863) k0!794))))

(declare-fun lt!200665 () Unit!12933)

(assert (=> b!435631 (= lt!200665 e!257329)))

(declare-fun c!55722 () Bool)

(assert (=> b!435631 (= c!55722 (= (select (arr!12789 _keys!709) from!863) k0!794))))

(assert (=> b!435631 (= lt!200672 lt!200666)))

(assert (=> b!435631 (= lt!200666 (+!1440 lt!200676 lt!200674))))

(assert (=> b!435631 (= lt!200674 (tuple2!7527 (select (arr!12789 _keys!709) from!863) lt!200669))))

(declare-fun get!6385 (ValueCell!5369 V!16339) V!16339)

(declare-fun dynLambda!840 (Int (_ BitVec 64)) V!16339)

(assert (=> b!435631 (= lt!200669 (get!6385 (select (arr!12790 _values!549) from!863) (dynLambda!840 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435632 () Bool)

(declare-fun res!256720 () Bool)

(assert (=> b!435632 (=> (not res!256720) (not e!257326))))

(assert (=> b!435632 (= res!256720 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13141 _keys!709))))))

(declare-fun res!256716 () Bool)

(assert (=> start!39992 (=> (not res!256716) (not e!257326))))

(assert (=> start!39992 (= res!256716 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13141 _keys!709))))))

(assert (=> start!39992 e!257326))

(assert (=> start!39992 tp_is_empty!11425))

(assert (=> start!39992 tp!36348))

(assert (=> start!39992 true))

(declare-fun array_inv!9358 (array!26682) Bool)

(assert (=> start!39992 (and (array_inv!9358 _values!549) e!257321)))

(declare-fun array_inv!9359 (array!26680) Bool)

(assert (=> start!39992 (array_inv!9359 _keys!709)))

(declare-fun b!435633 () Bool)

(declare-fun res!256708 () Bool)

(assert (=> b!435633 (=> (not res!256708) (not e!257326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435633 (= res!256708 (validMask!0 mask!1025))))

(declare-fun b!435634 () Bool)

(declare-fun res!256719 () Bool)

(assert (=> b!435634 (=> (not res!256719) (not e!257326))))

(assert (=> b!435634 (= res!256719 (and (= (size!13142 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13141 _keys!709) (size!13142 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39992 res!256716) b!435633))

(assert (= (and b!435633 res!256708) b!435634))

(assert (= (and b!435634 res!256719) b!435621))

(assert (= (and b!435621 res!256710) b!435623))

(assert (= (and b!435623 res!256722) b!435632))

(assert (= (and b!435632 res!256720) b!435628))

(assert (= (and b!435628 res!256709) b!435630))

(assert (= (and b!435630 res!256713) b!435615))

(assert (= (and b!435615 res!256714) b!435622))

(assert (= (and b!435622 res!256721) b!435619))

(assert (= (and b!435619 res!256715) b!435627))

(assert (= (and b!435627 res!256717) b!435624))

(assert (= (and b!435624 res!256711) b!435626))

(assert (= (and b!435626 (not res!256712)) b!435631))

(assert (= (and b!435631 c!55722) b!435629))

(assert (= (and b!435631 (not c!55722)) b!435616))

(assert (= (and b!435631 (not res!256718)) b!435620))

(assert (= (and b!435617 condMapEmpty!18759) mapIsEmpty!18759))

(assert (= (and b!435617 (not condMapEmpty!18759)) mapNonEmpty!18759))

(get-info :version)

(assert (= (and mapNonEmpty!18759 ((_ is ValueCellFull!5369) mapValue!18759)) b!435618))

(assert (= (and b!435617 ((_ is ValueCellFull!5369) mapDefault!18759)) b!435625))

(assert (= start!39992 b!435617))

(declare-fun b_lambda!9383 () Bool)

(assert (=> (not b_lambda!9383) (not b!435631)))

(declare-fun t!13229 () Bool)

(declare-fun tb!3671 () Bool)

(assert (=> (and start!39992 (= defaultEntry!557 defaultEntry!557) t!13229) tb!3671))

(declare-fun result!6877 () Bool)

(assert (=> tb!3671 (= result!6877 tp_is_empty!11425)))

(assert (=> b!435631 t!13229))

(declare-fun b_and!18221 () Bool)

(assert (= b_and!18219 (and (=> t!13229 result!6877) b_and!18221)))

(declare-fun m!423755 () Bool)

(assert (=> b!435623 m!423755))

(declare-fun m!423757 () Bool)

(assert (=> b!435622 m!423757))

(declare-fun m!423759 () Bool)

(assert (=> b!435622 m!423759))

(declare-fun m!423761 () Bool)

(assert (=> b!435621 m!423761))

(declare-fun m!423763 () Bool)

(assert (=> b!435619 m!423763))

(declare-fun m!423765 () Bool)

(assert (=> b!435624 m!423765))

(declare-fun m!423767 () Bool)

(assert (=> b!435624 m!423767))

(declare-fun m!423769 () Bool)

(assert (=> b!435624 m!423769))

(declare-fun m!423771 () Bool)

(assert (=> start!39992 m!423771))

(declare-fun m!423773 () Bool)

(assert (=> start!39992 m!423773))

(declare-fun m!423775 () Bool)

(assert (=> b!435615 m!423775))

(declare-fun m!423777 () Bool)

(assert (=> b!435630 m!423777))

(declare-fun m!423779 () Bool)

(assert (=> mapNonEmpty!18759 m!423779))

(declare-fun m!423781 () Bool)

(assert (=> b!435628 m!423781))

(declare-fun m!423783 () Bool)

(assert (=> b!435633 m!423783))

(declare-fun m!423785 () Bool)

(assert (=> b!435626 m!423785))

(declare-fun m!423787 () Bool)

(assert (=> b!435626 m!423787))

(declare-fun m!423789 () Bool)

(assert (=> b!435626 m!423789))

(declare-fun m!423791 () Bool)

(assert (=> b!435626 m!423791))

(assert (=> b!435626 m!423785))

(declare-fun m!423793 () Bool)

(assert (=> b!435626 m!423793))

(declare-fun m!423795 () Bool)

(assert (=> b!435626 m!423795))

(declare-fun m!423797 () Bool)

(assert (=> b!435629 m!423797))

(declare-fun m!423799 () Bool)

(assert (=> b!435620 m!423799))

(assert (=> b!435620 m!423799))

(declare-fun m!423801 () Bool)

(assert (=> b!435620 m!423801))

(assert (=> b!435620 m!423785))

(assert (=> b!435620 m!423785))

(declare-fun m!423803 () Bool)

(assert (=> b!435620 m!423803))

(assert (=> b!435631 m!423785))

(declare-fun m!423805 () Bool)

(assert (=> b!435631 m!423805))

(declare-fun m!423807 () Bool)

(assert (=> b!435631 m!423807))

(declare-fun m!423809 () Bool)

(assert (=> b!435631 m!423809))

(assert (=> b!435631 m!423807))

(assert (=> b!435631 m!423805))

(declare-fun m!423811 () Bool)

(assert (=> b!435631 m!423811))

(check-sat (not start!39992) tp_is_empty!11425 (not b!435633) (not b!435615) (not b!435622) b_and!18221 (not mapNonEmpty!18759) (not b!435624) (not b!435631) (not b_lambda!9383) (not b!435621) (not b_next!10273) (not b!435619) (not b!435628) (not b!435626) (not b!435620) (not b!435623) (not b!435629))
(check-sat b_and!18221 (not b_next!10273))
