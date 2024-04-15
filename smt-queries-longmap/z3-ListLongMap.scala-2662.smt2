; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39776 () Bool)

(assert start!39776)

(declare-fun b_free!10057 () Bool)

(declare-fun b_next!10057 () Bool)

(assert (=> start!39776 (= b_free!10057 (not b_next!10057))))

(declare-fun tp!35699 () Bool)

(declare-fun b_and!17747 () Bool)

(assert (=> start!39776 (= tp!35699 b_and!17747)))

(declare-fun b!428749 () Bool)

(declare-fun res!251783 () Bool)

(declare-fun e!253994 () Bool)

(assert (=> b!428749 (=> (not res!251783) (not e!253994))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26247 0))(
  ( (array!26248 (arr!12573 (Array (_ BitVec 32) (_ BitVec 64))) (size!12926 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26247)

(assert (=> b!428749 (= res!251783 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12926 _keys!709))))))

(declare-fun b!428750 () Bool)

(declare-fun e!253996 () Bool)

(declare-fun e!253995 () Bool)

(assert (=> b!428750 (= e!253996 (not e!253995))))

(declare-fun res!251775 () Bool)

(assert (=> b!428750 (=> res!251775 e!253995)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428750 (= res!251775 (not (validKeyInArray!0 (select (arr!12573 _keys!709) from!863))))))

(declare-datatypes ((V!16051 0))(
  ( (V!16052 (val!5649 Int)) )
))
(declare-datatypes ((tuple2!7440 0))(
  ( (tuple2!7441 (_1!3731 (_ BitVec 64)) (_2!3731 V!16051)) )
))
(declare-datatypes ((List!7440 0))(
  ( (Nil!7437) (Cons!7436 (h!8292 tuple2!7440) (t!12937 List!7440)) )
))
(declare-datatypes ((ListLongMap!6343 0))(
  ( (ListLongMap!6344 (toList!3187 List!7440)) )
))
(declare-fun lt!195812 () ListLongMap!6343)

(declare-fun lt!195818 () ListLongMap!6343)

(assert (=> b!428750 (= lt!195812 lt!195818)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16051)

(declare-fun lt!195821 () ListLongMap!6343)

(declare-fun +!1365 (ListLongMap!6343 tuple2!7440) ListLongMap!6343)

(assert (=> b!428750 (= lt!195818 (+!1365 lt!195821 (tuple2!7441 k0!794 v!412)))))

(declare-fun minValue!515 () V!16051)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5261 0))(
  ( (ValueCellFull!5261 (v!7890 V!16051)) (EmptyCell!5261) )
))
(declare-datatypes ((array!26249 0))(
  ( (array!26250 (arr!12574 (Array (_ BitVec 32) ValueCell!5261)) (size!12927 (_ BitVec 32))) )
))
(declare-fun lt!195817 () array!26249)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!195820 () array!26247)

(declare-fun zeroValue!515 () V!16051)

(declare-fun getCurrentListMapNoExtraKeys!1394 (array!26247 array!26249 (_ BitVec 32) (_ BitVec 32) V!16051 V!16051 (_ BitVec 32) Int) ListLongMap!6343)

(assert (=> b!428750 (= lt!195812 (getCurrentListMapNoExtraKeys!1394 lt!195820 lt!195817 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!26249)

(assert (=> b!428750 (= lt!195821 (getCurrentListMapNoExtraKeys!1394 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12583 0))(
  ( (Unit!12584) )
))
(declare-fun lt!195815 () Unit!12583)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!530 (array!26247 array!26249 (_ BitVec 32) (_ BitVec 32) V!16051 V!16051 (_ BitVec 32) (_ BitVec 64) V!16051 (_ BitVec 32) Int) Unit!12583)

(assert (=> b!428750 (= lt!195815 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!530 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428751 () Bool)

(declare-fun res!251781 () Bool)

(assert (=> b!428751 (=> (not res!251781) (not e!253994))))

(assert (=> b!428751 (= res!251781 (and (= (size!12927 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12926 _keys!709) (size!12927 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428752 () Bool)

(assert (=> b!428752 (= e!253995 true)))

(assert (=> b!428752 (not (= (select (arr!12573 _keys!709) from!863) k0!794))))

(declare-fun lt!195814 () Unit!12583)

(declare-fun e!253997 () Unit!12583)

(assert (=> b!428752 (= lt!195814 e!253997)))

(declare-fun c!55350 () Bool)

(assert (=> b!428752 (= c!55350 (= (select (arr!12573 _keys!709) from!863) k0!794))))

(declare-fun lt!195813 () ListLongMap!6343)

(declare-fun get!6232 (ValueCell!5261 V!16051) V!16051)

(declare-fun dynLambda!762 (Int (_ BitVec 64)) V!16051)

(assert (=> b!428752 (= lt!195813 (+!1365 lt!195818 (tuple2!7441 (select (arr!12573 _keys!709) from!863) (get!6232 (select (arr!12574 _values!549) from!863) (dynLambda!762 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428753 () Bool)

(declare-fun res!251782 () Bool)

(assert (=> b!428753 (=> (not res!251782) (not e!253994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428753 (= res!251782 (validMask!0 mask!1025))))

(declare-fun b!428754 () Bool)

(declare-fun e!253990 () Bool)

(assert (=> b!428754 (= e!253994 e!253990)))

(declare-fun res!251784 () Bool)

(assert (=> b!428754 (=> (not res!251784) (not e!253990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26247 (_ BitVec 32)) Bool)

(assert (=> b!428754 (= res!251784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195820 mask!1025))))

(assert (=> b!428754 (= lt!195820 (array!26248 (store (arr!12573 _keys!709) i!563 k0!794) (size!12926 _keys!709)))))

(declare-fun b!428755 () Bool)

(declare-fun e!253991 () Bool)

(declare-fun e!253998 () Bool)

(declare-fun mapRes!18435 () Bool)

(assert (=> b!428755 (= e!253991 (and e!253998 mapRes!18435))))

(declare-fun condMapEmpty!18435 () Bool)

(declare-fun mapDefault!18435 () ValueCell!5261)

(assert (=> b!428755 (= condMapEmpty!18435 (= (arr!12574 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5261)) mapDefault!18435)))))

(declare-fun b!428756 () Bool)

(declare-fun res!251776 () Bool)

(assert (=> b!428756 (=> (not res!251776) (not e!253994))))

(declare-fun arrayContainsKey!0 (array!26247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428756 (= res!251776 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!428757 () Bool)

(declare-fun Unit!12585 () Unit!12583)

(assert (=> b!428757 (= e!253997 Unit!12585)))

(declare-fun b!428758 () Bool)

(assert (=> b!428758 (= e!253990 e!253996)))

(declare-fun res!251787 () Bool)

(assert (=> b!428758 (=> (not res!251787) (not e!253996))))

(assert (=> b!428758 (= res!251787 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!428758 (= lt!195813 (getCurrentListMapNoExtraKeys!1394 lt!195820 lt!195817 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!428758 (= lt!195817 (array!26250 (store (arr!12574 _values!549) i!563 (ValueCellFull!5261 v!412)) (size!12927 _values!549)))))

(declare-fun lt!195816 () ListLongMap!6343)

(assert (=> b!428758 (= lt!195816 (getCurrentListMapNoExtraKeys!1394 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428759 () Bool)

(declare-fun res!251785 () Bool)

(assert (=> b!428759 (=> (not res!251785) (not e!253994))))

(declare-datatypes ((List!7441 0))(
  ( (Nil!7438) (Cons!7437 (h!8293 (_ BitVec 64)) (t!12938 List!7441)) )
))
(declare-fun arrayNoDuplicates!0 (array!26247 (_ BitVec 32) List!7441) Bool)

(assert (=> b!428759 (= res!251785 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7438))))

(declare-fun b!428760 () Bool)

(declare-fun Unit!12586 () Unit!12583)

(assert (=> b!428760 (= e!253997 Unit!12586)))

(declare-fun lt!195819 () Unit!12583)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26247 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12583)

(assert (=> b!428760 (= lt!195819 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428760 false))

(declare-fun mapIsEmpty!18435 () Bool)

(assert (=> mapIsEmpty!18435 mapRes!18435))

(declare-fun b!428761 () Bool)

(declare-fun e!253993 () Bool)

(declare-fun tp_is_empty!11209 () Bool)

(assert (=> b!428761 (= e!253993 tp_is_empty!11209)))

(declare-fun b!428762 () Bool)

(declare-fun res!251778 () Bool)

(assert (=> b!428762 (=> (not res!251778) (not e!253994))))

(assert (=> b!428762 (= res!251778 (or (= (select (arr!12573 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12573 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!251780 () Bool)

(assert (=> start!39776 (=> (not res!251780) (not e!253994))))

(assert (=> start!39776 (= res!251780 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12926 _keys!709))))))

(assert (=> start!39776 e!253994))

(assert (=> start!39776 tp_is_empty!11209))

(assert (=> start!39776 tp!35699))

(assert (=> start!39776 true))

(declare-fun array_inv!9190 (array!26249) Bool)

(assert (=> start!39776 (and (array_inv!9190 _values!549) e!253991)))

(declare-fun array_inv!9191 (array!26247) Bool)

(assert (=> start!39776 (array_inv!9191 _keys!709)))

(declare-fun mapNonEmpty!18435 () Bool)

(declare-fun tp!35700 () Bool)

(assert (=> mapNonEmpty!18435 (= mapRes!18435 (and tp!35700 e!253993))))

(declare-fun mapRest!18435 () (Array (_ BitVec 32) ValueCell!5261))

(declare-fun mapValue!18435 () ValueCell!5261)

(declare-fun mapKey!18435 () (_ BitVec 32))

(assert (=> mapNonEmpty!18435 (= (arr!12574 _values!549) (store mapRest!18435 mapKey!18435 mapValue!18435))))

(declare-fun b!428763 () Bool)

(declare-fun res!251779 () Bool)

(assert (=> b!428763 (=> (not res!251779) (not e!253994))))

(assert (=> b!428763 (= res!251779 (validKeyInArray!0 k0!794))))

(declare-fun b!428764 () Bool)

(declare-fun res!251777 () Bool)

(assert (=> b!428764 (=> (not res!251777) (not e!253990))))

(assert (=> b!428764 (= res!251777 (bvsle from!863 i!563))))

(declare-fun b!428765 () Bool)

(declare-fun res!251786 () Bool)

(assert (=> b!428765 (=> (not res!251786) (not e!253994))))

(assert (=> b!428765 (= res!251786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428766 () Bool)

(assert (=> b!428766 (= e!253998 tp_is_empty!11209)))

(declare-fun b!428767 () Bool)

(declare-fun res!251774 () Bool)

(assert (=> b!428767 (=> (not res!251774) (not e!253990))))

(assert (=> b!428767 (= res!251774 (arrayNoDuplicates!0 lt!195820 #b00000000000000000000000000000000 Nil!7438))))

(assert (= (and start!39776 res!251780) b!428753))

(assert (= (and b!428753 res!251782) b!428751))

(assert (= (and b!428751 res!251781) b!428765))

(assert (= (and b!428765 res!251786) b!428759))

(assert (= (and b!428759 res!251785) b!428749))

(assert (= (and b!428749 res!251783) b!428763))

(assert (= (and b!428763 res!251779) b!428762))

(assert (= (and b!428762 res!251778) b!428756))

(assert (= (and b!428756 res!251776) b!428754))

(assert (= (and b!428754 res!251784) b!428767))

(assert (= (and b!428767 res!251774) b!428764))

(assert (= (and b!428764 res!251777) b!428758))

(assert (= (and b!428758 res!251787) b!428750))

(assert (= (and b!428750 (not res!251775)) b!428752))

(assert (= (and b!428752 c!55350) b!428760))

(assert (= (and b!428752 (not c!55350)) b!428757))

(assert (= (and b!428755 condMapEmpty!18435) mapIsEmpty!18435))

(assert (= (and b!428755 (not condMapEmpty!18435)) mapNonEmpty!18435))

(get-info :version)

(assert (= (and mapNonEmpty!18435 ((_ is ValueCellFull!5261) mapValue!18435)) b!428761))

(assert (= (and b!428755 ((_ is ValueCellFull!5261) mapDefault!18435)) b!428766))

(assert (= start!39776 b!428755))

(declare-fun b_lambda!9127 () Bool)

(assert (=> (not b_lambda!9127) (not b!428752)))

(declare-fun t!12936 () Bool)

(declare-fun tb!3455 () Bool)

(assert (=> (and start!39776 (= defaultEntry!557 defaultEntry!557) t!12936) tb!3455))

(declare-fun result!6445 () Bool)

(assert (=> tb!3455 (= result!6445 tp_is_empty!11209)))

(assert (=> b!428752 t!12936))

(declare-fun b_and!17749 () Bool)

(assert (= b_and!17747 (and (=> t!12936 result!6445) b_and!17749)))

(declare-fun m!416649 () Bool)

(assert (=> b!428767 m!416649))

(declare-fun m!416651 () Bool)

(assert (=> b!428753 m!416651))

(declare-fun m!416653 () Bool)

(assert (=> b!428763 m!416653))

(declare-fun m!416655 () Bool)

(assert (=> b!428750 m!416655))

(declare-fun m!416657 () Bool)

(assert (=> b!428750 m!416657))

(declare-fun m!416659 () Bool)

(assert (=> b!428750 m!416659))

(declare-fun m!416661 () Bool)

(assert (=> b!428750 m!416661))

(assert (=> b!428750 m!416655))

(declare-fun m!416663 () Bool)

(assert (=> b!428750 m!416663))

(declare-fun m!416665 () Bool)

(assert (=> b!428750 m!416665))

(declare-fun m!416667 () Bool)

(assert (=> b!428759 m!416667))

(declare-fun m!416669 () Bool)

(assert (=> b!428765 m!416669))

(declare-fun m!416671 () Bool)

(assert (=> start!39776 m!416671))

(declare-fun m!416673 () Bool)

(assert (=> start!39776 m!416673))

(declare-fun m!416675 () Bool)

(assert (=> b!428760 m!416675))

(declare-fun m!416677 () Bool)

(assert (=> mapNonEmpty!18435 m!416677))

(declare-fun m!416679 () Bool)

(assert (=> b!428762 m!416679))

(declare-fun m!416681 () Bool)

(assert (=> b!428758 m!416681))

(declare-fun m!416683 () Bool)

(assert (=> b!428758 m!416683))

(declare-fun m!416685 () Bool)

(assert (=> b!428758 m!416685))

(declare-fun m!416687 () Bool)

(assert (=> b!428754 m!416687))

(declare-fun m!416689 () Bool)

(assert (=> b!428754 m!416689))

(assert (=> b!428752 m!416655))

(declare-fun m!416691 () Bool)

(assert (=> b!428752 m!416691))

(declare-fun m!416693 () Bool)

(assert (=> b!428752 m!416693))

(declare-fun m!416695 () Bool)

(assert (=> b!428752 m!416695))

(assert (=> b!428752 m!416695))

(assert (=> b!428752 m!416691))

(declare-fun m!416697 () Bool)

(assert (=> b!428752 m!416697))

(declare-fun m!416699 () Bool)

(assert (=> b!428756 m!416699))

(check-sat (not start!39776) (not b!428759) (not b!428754) (not b!428767) b_and!17749 (not b!428752) (not b!428760) (not b!428765) (not b!428756) (not b!428753) (not b_next!10057) (not b!428750) (not b!428763) tp_is_empty!11209 (not mapNonEmpty!18435) (not b!428758) (not b_lambda!9127))
(check-sat b_and!17749 (not b_next!10057))
