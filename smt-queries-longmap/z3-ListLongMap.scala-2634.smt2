; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39624 () Bool)

(assert start!39624)

(declare-fun b_free!9891 () Bool)

(declare-fun b_next!9891 () Bool)

(assert (=> start!39624 (= b_free!9891 (not b_next!9891))))

(declare-fun tp!35201 () Bool)

(declare-fun b_and!17547 () Bool)

(assert (=> start!39624 (= tp!35201 b_and!17547)))

(declare-fun b!424799 () Bool)

(declare-fun res!248576 () Bool)

(declare-fun e!252283 () Bool)

(assert (=> b!424799 (=> (not res!248576) (not e!252283))))

(declare-datatypes ((array!25925 0))(
  ( (array!25926 (arr!12412 (Array (_ BitVec 32) (_ BitVec 64))) (size!12764 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25925)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424799 (= res!248576 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424800 () Bool)

(declare-fun e!252284 () Bool)

(assert (=> b!424800 (= e!252283 e!252284)))

(declare-fun res!248573 () Bool)

(assert (=> b!424800 (=> (not res!248573) (not e!252284))))

(declare-fun lt!194449 () array!25925)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25925 (_ BitVec 32)) Bool)

(assert (=> b!424800 (= res!248573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194449 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424800 (= lt!194449 (array!25926 (store (arr!12412 _keys!709) i!563 k0!794) (size!12764 _keys!709)))))

(declare-fun b!424801 () Bool)

(declare-fun e!252287 () Bool)

(declare-fun tp_is_empty!11043 () Bool)

(assert (=> b!424801 (= e!252287 tp_is_empty!11043)))

(declare-fun b!424802 () Bool)

(declare-fun e!252282 () Bool)

(assert (=> b!424802 (= e!252282 tp_is_empty!11043)))

(declare-fun b!424803 () Bool)

(declare-fun res!248570 () Bool)

(assert (=> b!424803 (=> (not res!248570) (not e!252283))))

(assert (=> b!424803 (= res!248570 (or (= (select (arr!12412 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12412 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424804 () Bool)

(declare-fun res!248568 () Bool)

(assert (=> b!424804 (=> (not res!248568) (not e!252283))))

(assert (=> b!424804 (= res!248568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424805 () Bool)

(declare-fun res!248571 () Bool)

(assert (=> b!424805 (=> (not res!248571) (not e!252283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424805 (= res!248571 (validKeyInArray!0 k0!794))))

(declare-fun b!424806 () Bool)

(declare-fun res!248565 () Bool)

(assert (=> b!424806 (=> (not res!248565) (not e!252283))))

(assert (=> b!424806 (= res!248565 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12764 _keys!709))))))

(declare-fun b!424807 () Bool)

(declare-fun e!252288 () Bool)

(declare-fun mapRes!18186 () Bool)

(assert (=> b!424807 (= e!252288 (and e!252287 mapRes!18186))))

(declare-fun condMapEmpty!18186 () Bool)

(declare-datatypes ((V!15829 0))(
  ( (V!15830 (val!5566 Int)) )
))
(declare-datatypes ((ValueCell!5178 0))(
  ( (ValueCellFull!5178 (v!7813 V!15829)) (EmptyCell!5178) )
))
(declare-datatypes ((array!25927 0))(
  ( (array!25928 (arr!12413 (Array (_ BitVec 32) ValueCell!5178)) (size!12765 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25927)

(declare-fun mapDefault!18186 () ValueCell!5178)

(assert (=> b!424807 (= condMapEmpty!18186 (= (arr!12413 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5178)) mapDefault!18186)))))

(declare-fun b!424808 () Bool)

(declare-fun res!248567 () Bool)

(assert (=> b!424808 (=> (not res!248567) (not e!252283))))

(declare-datatypes ((List!7319 0))(
  ( (Nil!7316) (Cons!7315 (h!8171 (_ BitVec 64)) (t!12763 List!7319)) )
))
(declare-fun arrayNoDuplicates!0 (array!25925 (_ BitVec 32) List!7319) Bool)

(assert (=> b!424808 (= res!248567 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7316))))

(declare-fun mapIsEmpty!18186 () Bool)

(assert (=> mapIsEmpty!18186 mapRes!18186))

(declare-fun b!424810 () Bool)

(declare-fun res!248569 () Bool)

(assert (=> b!424810 (=> (not res!248569) (not e!252284))))

(assert (=> b!424810 (= res!248569 (arrayNoDuplicates!0 lt!194449 #b00000000000000000000000000000000 Nil!7316))))

(declare-fun b!424811 () Bool)

(declare-fun res!248574 () Bool)

(assert (=> b!424811 (=> (not res!248574) (not e!252283))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!424811 (= res!248574 (and (= (size!12765 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12764 _keys!709) (size!12765 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424812 () Bool)

(declare-fun e!252285 () Bool)

(assert (=> b!424812 (= e!252284 e!252285)))

(declare-fun res!248572 () Bool)

(assert (=> b!424812 (=> (not res!248572) (not e!252285))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!424812 (= res!248572 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15829)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7308 0))(
  ( (tuple2!7309 (_1!3665 (_ BitVec 64)) (_2!3665 V!15829)) )
))
(declare-datatypes ((List!7320 0))(
  ( (Nil!7317) (Cons!7316 (h!8172 tuple2!7308) (t!12764 List!7320)) )
))
(declare-datatypes ((ListLongMap!6221 0))(
  ( (ListLongMap!6222 (toList!3126 List!7320)) )
))
(declare-fun lt!194452 () ListLongMap!6221)

(declare-fun lt!194450 () array!25927)

(declare-fun zeroValue!515 () V!15829)

(declare-fun getCurrentListMapNoExtraKeys!1330 (array!25925 array!25927 (_ BitVec 32) (_ BitVec 32) V!15829 V!15829 (_ BitVec 32) Int) ListLongMap!6221)

(assert (=> b!424812 (= lt!194452 (getCurrentListMapNoExtraKeys!1330 lt!194449 lt!194450 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15829)

(assert (=> b!424812 (= lt!194450 (array!25928 (store (arr!12413 _values!549) i!563 (ValueCellFull!5178 v!412)) (size!12765 _values!549)))))

(declare-fun lt!194453 () ListLongMap!6221)

(assert (=> b!424812 (= lt!194453 (getCurrentListMapNoExtraKeys!1330 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424813 () Bool)

(declare-fun res!248566 () Bool)

(assert (=> b!424813 (=> (not res!248566) (not e!252283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424813 (= res!248566 (validMask!0 mask!1025))))

(declare-fun b!424814 () Bool)

(declare-fun res!248577 () Bool)

(assert (=> b!424814 (=> (not res!248577) (not e!252284))))

(assert (=> b!424814 (= res!248577 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18186 () Bool)

(declare-fun tp!35202 () Bool)

(assert (=> mapNonEmpty!18186 (= mapRes!18186 (and tp!35202 e!252282))))

(declare-fun mapValue!18186 () ValueCell!5178)

(declare-fun mapKey!18186 () (_ BitVec 32))

(declare-fun mapRest!18186 () (Array (_ BitVec 32) ValueCell!5178))

(assert (=> mapNonEmpty!18186 (= (arr!12413 _values!549) (store mapRest!18186 mapKey!18186 mapValue!18186))))

(declare-fun res!248575 () Bool)

(assert (=> start!39624 (=> (not res!248575) (not e!252283))))

(assert (=> start!39624 (= res!248575 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12764 _keys!709))))))

(assert (=> start!39624 e!252283))

(assert (=> start!39624 tp_is_empty!11043))

(assert (=> start!39624 tp!35201))

(assert (=> start!39624 true))

(declare-fun array_inv!9044 (array!25927) Bool)

(assert (=> start!39624 (and (array_inv!9044 _values!549) e!252288)))

(declare-fun array_inv!9045 (array!25925) Bool)

(assert (=> start!39624 (array_inv!9045 _keys!709)))

(declare-fun b!424809 () Bool)

(assert (=> b!424809 (= e!252285 (not true))))

(declare-fun +!1285 (ListLongMap!6221 tuple2!7308) ListLongMap!6221)

(assert (=> b!424809 (= (getCurrentListMapNoExtraKeys!1330 lt!194449 lt!194450 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1285 (getCurrentListMapNoExtraKeys!1330 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7309 k0!794 v!412)))))

(declare-datatypes ((Unit!12472 0))(
  ( (Unit!12473) )
))
(declare-fun lt!194451 () Unit!12472)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!480 (array!25925 array!25927 (_ BitVec 32) (_ BitVec 32) V!15829 V!15829 (_ BitVec 32) (_ BitVec 64) V!15829 (_ BitVec 32) Int) Unit!12472)

(assert (=> b!424809 (= lt!194451 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!480 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39624 res!248575) b!424813))

(assert (= (and b!424813 res!248566) b!424811))

(assert (= (and b!424811 res!248574) b!424804))

(assert (= (and b!424804 res!248568) b!424808))

(assert (= (and b!424808 res!248567) b!424806))

(assert (= (and b!424806 res!248565) b!424805))

(assert (= (and b!424805 res!248571) b!424803))

(assert (= (and b!424803 res!248570) b!424799))

(assert (= (and b!424799 res!248576) b!424800))

(assert (= (and b!424800 res!248573) b!424810))

(assert (= (and b!424810 res!248569) b!424814))

(assert (= (and b!424814 res!248577) b!424812))

(assert (= (and b!424812 res!248572) b!424809))

(assert (= (and b!424807 condMapEmpty!18186) mapIsEmpty!18186))

(assert (= (and b!424807 (not condMapEmpty!18186)) mapNonEmpty!18186))

(get-info :version)

(assert (= (and mapNonEmpty!18186 ((_ is ValueCellFull!5178) mapValue!18186)) b!424802))

(assert (= (and b!424807 ((_ is ValueCellFull!5178) mapDefault!18186)) b!424801))

(assert (= start!39624 b!424807))

(declare-fun m!413831 () Bool)

(assert (=> b!424799 m!413831))

(declare-fun m!413833 () Bool)

(assert (=> b!424809 m!413833))

(declare-fun m!413835 () Bool)

(assert (=> b!424809 m!413835))

(assert (=> b!424809 m!413835))

(declare-fun m!413837 () Bool)

(assert (=> b!424809 m!413837))

(declare-fun m!413839 () Bool)

(assert (=> b!424809 m!413839))

(declare-fun m!413841 () Bool)

(assert (=> b!424813 m!413841))

(declare-fun m!413843 () Bool)

(assert (=> b!424812 m!413843))

(declare-fun m!413845 () Bool)

(assert (=> b!424812 m!413845))

(declare-fun m!413847 () Bool)

(assert (=> b!424812 m!413847))

(declare-fun m!413849 () Bool)

(assert (=> mapNonEmpty!18186 m!413849))

(declare-fun m!413851 () Bool)

(assert (=> b!424800 m!413851))

(declare-fun m!413853 () Bool)

(assert (=> b!424800 m!413853))

(declare-fun m!413855 () Bool)

(assert (=> b!424810 m!413855))

(declare-fun m!413857 () Bool)

(assert (=> b!424803 m!413857))

(declare-fun m!413859 () Bool)

(assert (=> b!424805 m!413859))

(declare-fun m!413861 () Bool)

(assert (=> start!39624 m!413861))

(declare-fun m!413863 () Bool)

(assert (=> start!39624 m!413863))

(declare-fun m!413865 () Bool)

(assert (=> b!424808 m!413865))

(declare-fun m!413867 () Bool)

(assert (=> b!424804 m!413867))

(check-sat (not b!424808) (not mapNonEmpty!18186) (not b!424800) (not start!39624) (not b!424809) (not b!424813) (not b_next!9891) (not b!424805) (not b!424812) tp_is_empty!11043 (not b!424799) (not b!424810) b_and!17547 (not b!424804))
(check-sat b_and!17547 (not b_next!9891))
