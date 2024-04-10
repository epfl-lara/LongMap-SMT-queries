; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37768 () Bool)

(assert start!37768)

(declare-fun b_free!8871 () Bool)

(declare-fun b_next!8871 () Bool)

(assert (=> start!37768 (= b_free!8871 (not b_next!8871))))

(declare-fun tp!31365 () Bool)

(declare-fun b_and!16113 () Bool)

(assert (=> start!37768 (= tp!31365 b_and!16113)))

(declare-fun b!387689 () Bool)

(declare-fun e!235009 () Bool)

(declare-fun e!235005 () Bool)

(declare-fun mapRes!15879 () Bool)

(assert (=> b!387689 (= e!235009 (and e!235005 mapRes!15879))))

(declare-fun condMapEmpty!15879 () Bool)

(declare-datatypes ((V!13829 0))(
  ( (V!13830 (val!4816 Int)) )
))
(declare-datatypes ((ValueCell!4428 0))(
  ( (ValueCellFull!4428 (v!7013 V!13829)) (EmptyCell!4428) )
))
(declare-datatypes ((array!22977 0))(
  ( (array!22978 (arr!10957 (Array (_ BitVec 32) ValueCell!4428)) (size!11309 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22977)

(declare-fun mapDefault!15879 () ValueCell!4428)

(assert (=> b!387689 (= condMapEmpty!15879 (= (arr!10957 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4428)) mapDefault!15879)))))

(declare-fun b!387690 () Bool)

(declare-fun res!221570 () Bool)

(declare-fun e!235006 () Bool)

(assert (=> b!387690 (=> (not res!221570) (not e!235006))))

(declare-datatypes ((array!22979 0))(
  ( (array!22980 (arr!10958 (Array (_ BitVec 32) (_ BitVec 64))) (size!11310 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22979)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387690 (= res!221570 (or (= (select (arr!10958 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10958 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387691 () Bool)

(declare-fun res!221572 () Bool)

(assert (=> b!387691 (=> (not res!221572) (not e!235006))))

(declare-datatypes ((List!6323 0))(
  ( (Nil!6320) (Cons!6319 (h!7175 (_ BitVec 64)) (t!11473 List!6323)) )
))
(declare-fun arrayNoDuplicates!0 (array!22979 (_ BitVec 32) List!6323) Bool)

(assert (=> b!387691 (= res!221572 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6320))))

(declare-fun res!221575 () Bool)

(assert (=> start!37768 (=> (not res!221575) (not e!235006))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37768 (= res!221575 (validMask!0 mask!970))))

(assert (=> start!37768 e!235006))

(declare-fun array_inv!8060 (array!22977) Bool)

(assert (=> start!37768 (and (array_inv!8060 _values!506) e!235009)))

(assert (=> start!37768 tp!31365))

(assert (=> start!37768 true))

(declare-fun tp_is_empty!9543 () Bool)

(assert (=> start!37768 tp_is_empty!9543))

(declare-fun array_inv!8061 (array!22979) Bool)

(assert (=> start!37768 (array_inv!8061 _keys!658)))

(declare-fun b!387692 () Bool)

(declare-fun res!221567 () Bool)

(assert (=> b!387692 (=> (not res!221567) (not e!235006))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387692 (= res!221567 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387693 () Bool)

(declare-fun e!235010 () Bool)

(assert (=> b!387693 (= e!235010 tp_is_empty!9543)))

(declare-fun mapIsEmpty!15879 () Bool)

(assert (=> mapIsEmpty!15879 mapRes!15879))

(declare-fun b!387694 () Bool)

(declare-fun res!221576 () Bool)

(assert (=> b!387694 (=> (not res!221576) (not e!235006))))

(assert (=> b!387694 (= res!221576 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11310 _keys!658))))))

(declare-fun b!387695 () Bool)

(declare-fun e!235008 () Bool)

(assert (=> b!387695 (= e!235006 e!235008)))

(declare-fun res!221574 () Bool)

(assert (=> b!387695 (=> (not res!221574) (not e!235008))))

(declare-fun lt!182095 () array!22979)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22979 (_ BitVec 32)) Bool)

(assert (=> b!387695 (= res!221574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182095 mask!970))))

(assert (=> b!387695 (= lt!182095 (array!22980 (store (arr!10958 _keys!658) i!548 k0!778) (size!11310 _keys!658)))))

(declare-fun b!387696 () Bool)

(declare-fun res!221569 () Bool)

(assert (=> b!387696 (=> (not res!221569) (not e!235008))))

(assert (=> b!387696 (= res!221569 (arrayNoDuplicates!0 lt!182095 #b00000000000000000000000000000000 Nil!6320))))

(declare-fun b!387697 () Bool)

(assert (=> b!387697 (= e!235008 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6472 0))(
  ( (tuple2!6473 (_1!3247 (_ BitVec 64)) (_2!3247 V!13829)) )
))
(declare-datatypes ((List!6324 0))(
  ( (Nil!6321) (Cons!6320 (h!7176 tuple2!6472) (t!11474 List!6324)) )
))
(declare-datatypes ((ListLongMap!5385 0))(
  ( (ListLongMap!5386 (toList!2708 List!6324)) )
))
(declare-fun lt!182096 () ListLongMap!5385)

(declare-fun zeroValue!472 () V!13829)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13829)

(declare-fun minValue!472 () V!13829)

(declare-fun getCurrentListMapNoExtraKeys!937 (array!22979 array!22977 (_ BitVec 32) (_ BitVec 32) V!13829 V!13829 (_ BitVec 32) Int) ListLongMap!5385)

(assert (=> b!387697 (= lt!182096 (getCurrentListMapNoExtraKeys!937 lt!182095 (array!22978 (store (arr!10957 _values!506) i!548 (ValueCellFull!4428 v!373)) (size!11309 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182097 () ListLongMap!5385)

(assert (=> b!387697 (= lt!182097 (getCurrentListMapNoExtraKeys!937 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387698 () Bool)

(declare-fun res!221571 () Bool)

(assert (=> b!387698 (=> (not res!221571) (not e!235006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387698 (= res!221571 (validKeyInArray!0 k0!778))))

(declare-fun b!387699 () Bool)

(declare-fun res!221568 () Bool)

(assert (=> b!387699 (=> (not res!221568) (not e!235006))))

(assert (=> b!387699 (= res!221568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387700 () Bool)

(assert (=> b!387700 (= e!235005 tp_is_empty!9543)))

(declare-fun b!387701 () Bool)

(declare-fun res!221573 () Bool)

(assert (=> b!387701 (=> (not res!221573) (not e!235006))))

(assert (=> b!387701 (= res!221573 (and (= (size!11309 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11310 _keys!658) (size!11309 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15879 () Bool)

(declare-fun tp!31364 () Bool)

(assert (=> mapNonEmpty!15879 (= mapRes!15879 (and tp!31364 e!235010))))

(declare-fun mapRest!15879 () (Array (_ BitVec 32) ValueCell!4428))

(declare-fun mapKey!15879 () (_ BitVec 32))

(declare-fun mapValue!15879 () ValueCell!4428)

(assert (=> mapNonEmpty!15879 (= (arr!10957 _values!506) (store mapRest!15879 mapKey!15879 mapValue!15879))))

(assert (= (and start!37768 res!221575) b!387701))

(assert (= (and b!387701 res!221573) b!387699))

(assert (= (and b!387699 res!221568) b!387691))

(assert (= (and b!387691 res!221572) b!387694))

(assert (= (and b!387694 res!221576) b!387698))

(assert (= (and b!387698 res!221571) b!387690))

(assert (= (and b!387690 res!221570) b!387692))

(assert (= (and b!387692 res!221567) b!387695))

(assert (= (and b!387695 res!221574) b!387696))

(assert (= (and b!387696 res!221569) b!387697))

(assert (= (and b!387689 condMapEmpty!15879) mapIsEmpty!15879))

(assert (= (and b!387689 (not condMapEmpty!15879)) mapNonEmpty!15879))

(get-info :version)

(assert (= (and mapNonEmpty!15879 ((_ is ValueCellFull!4428) mapValue!15879)) b!387693))

(assert (= (and b!387689 ((_ is ValueCellFull!4428) mapDefault!15879)) b!387700))

(assert (= start!37768 b!387689))

(declare-fun m!383745 () Bool)

(assert (=> mapNonEmpty!15879 m!383745))

(declare-fun m!383747 () Bool)

(assert (=> b!387698 m!383747))

(declare-fun m!383749 () Bool)

(assert (=> b!387695 m!383749))

(declare-fun m!383751 () Bool)

(assert (=> b!387695 m!383751))

(declare-fun m!383753 () Bool)

(assert (=> b!387691 m!383753))

(declare-fun m!383755 () Bool)

(assert (=> b!387699 m!383755))

(declare-fun m!383757 () Bool)

(assert (=> b!387697 m!383757))

(declare-fun m!383759 () Bool)

(assert (=> b!387697 m!383759))

(declare-fun m!383761 () Bool)

(assert (=> b!387697 m!383761))

(declare-fun m!383763 () Bool)

(assert (=> b!387696 m!383763))

(declare-fun m!383765 () Bool)

(assert (=> b!387690 m!383765))

(declare-fun m!383767 () Bool)

(assert (=> start!37768 m!383767))

(declare-fun m!383769 () Bool)

(assert (=> start!37768 m!383769))

(declare-fun m!383771 () Bool)

(assert (=> start!37768 m!383771))

(declare-fun m!383773 () Bool)

(assert (=> b!387692 m!383773))

(check-sat (not b!387695) (not b!387697) (not start!37768) b_and!16113 (not b!387696) (not mapNonEmpty!15879) (not b!387698) (not b!387699) tp_is_empty!9543 (not b!387692) (not b_next!8871) (not b!387691))
(check-sat b_and!16113 (not b_next!8871))
