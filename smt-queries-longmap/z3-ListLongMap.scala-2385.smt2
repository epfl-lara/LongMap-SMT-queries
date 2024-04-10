; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37774 () Bool)

(assert start!37774)

(declare-fun b_free!8877 () Bool)

(declare-fun b_next!8877 () Bool)

(assert (=> start!37774 (= b_free!8877 (not b_next!8877))))

(declare-fun tp!31382 () Bool)

(declare-fun b_and!16119 () Bool)

(assert (=> start!37774 (= tp!31382 b_and!16119)))

(declare-fun mapIsEmpty!15888 () Bool)

(declare-fun mapRes!15888 () Bool)

(assert (=> mapIsEmpty!15888 mapRes!15888))

(declare-fun b!387806 () Bool)

(declare-fun res!221664 () Bool)

(declare-fun e!235059 () Bool)

(assert (=> b!387806 (=> (not res!221664) (not e!235059))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22989 0))(
  ( (array!22990 (arr!10963 (Array (_ BitVec 32) (_ BitVec 64))) (size!11315 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22989)

(assert (=> b!387806 (= res!221664 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11315 _keys!658))))))

(declare-fun b!387807 () Bool)

(declare-fun e!235061 () Bool)

(declare-fun tp_is_empty!9549 () Bool)

(assert (=> b!387807 (= e!235061 tp_is_empty!9549)))

(declare-fun mapNonEmpty!15888 () Bool)

(declare-fun tp!31383 () Bool)

(declare-fun e!235062 () Bool)

(assert (=> mapNonEmpty!15888 (= mapRes!15888 (and tp!31383 e!235062))))

(declare-datatypes ((V!13837 0))(
  ( (V!13838 (val!4819 Int)) )
))
(declare-datatypes ((ValueCell!4431 0))(
  ( (ValueCellFull!4431 (v!7016 V!13837)) (EmptyCell!4431) )
))
(declare-datatypes ((array!22991 0))(
  ( (array!22992 (arr!10964 (Array (_ BitVec 32) ValueCell!4431)) (size!11316 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22991)

(declare-fun mapRest!15888 () (Array (_ BitVec 32) ValueCell!4431))

(declare-fun mapKey!15888 () (_ BitVec 32))

(declare-fun mapValue!15888 () ValueCell!4431)

(assert (=> mapNonEmpty!15888 (= (arr!10964 _values!506) (store mapRest!15888 mapKey!15888 mapValue!15888))))

(declare-fun b!387808 () Bool)

(declare-fun res!221659 () Bool)

(assert (=> b!387808 (=> (not res!221659) (not e!235059))))

(assert (=> b!387808 (= res!221659 (or (= (select (arr!10963 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10963 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387809 () Bool)

(declare-fun res!221661 () Bool)

(assert (=> b!387809 (=> (not res!221661) (not e!235059))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387809 (= res!221661 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387810 () Bool)

(declare-fun res!221663 () Bool)

(assert (=> b!387810 (=> (not res!221663) (not e!235059))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22989 (_ BitVec 32)) Bool)

(assert (=> b!387810 (= res!221663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!221666 () Bool)

(assert (=> start!37774 (=> (not res!221666) (not e!235059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37774 (= res!221666 (validMask!0 mask!970))))

(assert (=> start!37774 e!235059))

(declare-fun e!235064 () Bool)

(declare-fun array_inv!8062 (array!22991) Bool)

(assert (=> start!37774 (and (array_inv!8062 _values!506) e!235064)))

(assert (=> start!37774 tp!31382))

(assert (=> start!37774 true))

(assert (=> start!37774 tp_is_empty!9549))

(declare-fun array_inv!8063 (array!22989) Bool)

(assert (=> start!37774 (array_inv!8063 _keys!658)))

(declare-fun b!387811 () Bool)

(declare-fun res!221657 () Bool)

(assert (=> b!387811 (=> (not res!221657) (not e!235059))))

(declare-datatypes ((List!6328 0))(
  ( (Nil!6325) (Cons!6324 (h!7180 (_ BitVec 64)) (t!11478 List!6328)) )
))
(declare-fun arrayNoDuplicates!0 (array!22989 (_ BitVec 32) List!6328) Bool)

(assert (=> b!387811 (= res!221657 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6325))))

(declare-fun b!387812 () Bool)

(declare-fun res!221658 () Bool)

(assert (=> b!387812 (=> (not res!221658) (not e!235059))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!387812 (= res!221658 (and (= (size!11316 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11315 _keys!658) (size!11316 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387813 () Bool)

(assert (=> b!387813 (= e!235062 tp_is_empty!9549)))

(declare-fun b!387814 () Bool)

(declare-fun e!235060 () Bool)

(assert (=> b!387814 (= e!235060 false)))

(declare-datatypes ((tuple2!6476 0))(
  ( (tuple2!6477 (_1!3249 (_ BitVec 64)) (_2!3249 V!13837)) )
))
(declare-datatypes ((List!6329 0))(
  ( (Nil!6326) (Cons!6325 (h!7181 tuple2!6476) (t!11479 List!6329)) )
))
(declare-datatypes ((ListLongMap!5389 0))(
  ( (ListLongMap!5390 (toList!2710 List!6329)) )
))
(declare-fun lt!182124 () ListLongMap!5389)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!182123 () array!22989)

(declare-fun zeroValue!472 () V!13837)

(declare-fun v!373 () V!13837)

(declare-fun minValue!472 () V!13837)

(declare-fun getCurrentListMapNoExtraKeys!939 (array!22989 array!22991 (_ BitVec 32) (_ BitVec 32) V!13837 V!13837 (_ BitVec 32) Int) ListLongMap!5389)

(assert (=> b!387814 (= lt!182124 (getCurrentListMapNoExtraKeys!939 lt!182123 (array!22992 (store (arr!10964 _values!506) i!548 (ValueCellFull!4431 v!373)) (size!11316 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182122 () ListLongMap!5389)

(assert (=> b!387814 (= lt!182122 (getCurrentListMapNoExtraKeys!939 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387815 () Bool)

(declare-fun res!221662 () Bool)

(assert (=> b!387815 (=> (not res!221662) (not e!235060))))

(assert (=> b!387815 (= res!221662 (arrayNoDuplicates!0 lt!182123 #b00000000000000000000000000000000 Nil!6325))))

(declare-fun b!387816 () Bool)

(assert (=> b!387816 (= e!235059 e!235060)))

(declare-fun res!221660 () Bool)

(assert (=> b!387816 (=> (not res!221660) (not e!235060))))

(assert (=> b!387816 (= res!221660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182123 mask!970))))

(assert (=> b!387816 (= lt!182123 (array!22990 (store (arr!10963 _keys!658) i!548 k0!778) (size!11315 _keys!658)))))

(declare-fun b!387817 () Bool)

(declare-fun res!221665 () Bool)

(assert (=> b!387817 (=> (not res!221665) (not e!235059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387817 (= res!221665 (validKeyInArray!0 k0!778))))

(declare-fun b!387818 () Bool)

(assert (=> b!387818 (= e!235064 (and e!235061 mapRes!15888))))

(declare-fun condMapEmpty!15888 () Bool)

(declare-fun mapDefault!15888 () ValueCell!4431)

(assert (=> b!387818 (= condMapEmpty!15888 (= (arr!10964 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4431)) mapDefault!15888)))))

(assert (= (and start!37774 res!221666) b!387812))

(assert (= (and b!387812 res!221658) b!387810))

(assert (= (and b!387810 res!221663) b!387811))

(assert (= (and b!387811 res!221657) b!387806))

(assert (= (and b!387806 res!221664) b!387817))

(assert (= (and b!387817 res!221665) b!387808))

(assert (= (and b!387808 res!221659) b!387809))

(assert (= (and b!387809 res!221661) b!387816))

(assert (= (and b!387816 res!221660) b!387815))

(assert (= (and b!387815 res!221662) b!387814))

(assert (= (and b!387818 condMapEmpty!15888) mapIsEmpty!15888))

(assert (= (and b!387818 (not condMapEmpty!15888)) mapNonEmpty!15888))

(get-info :version)

(assert (= (and mapNonEmpty!15888 ((_ is ValueCellFull!4431) mapValue!15888)) b!387813))

(assert (= (and b!387818 ((_ is ValueCellFull!4431) mapDefault!15888)) b!387807))

(assert (= start!37774 b!387818))

(declare-fun m!383835 () Bool)

(assert (=> b!387816 m!383835))

(declare-fun m!383837 () Bool)

(assert (=> b!387816 m!383837))

(declare-fun m!383839 () Bool)

(assert (=> start!37774 m!383839))

(declare-fun m!383841 () Bool)

(assert (=> start!37774 m!383841))

(declare-fun m!383843 () Bool)

(assert (=> start!37774 m!383843))

(declare-fun m!383845 () Bool)

(assert (=> b!387814 m!383845))

(declare-fun m!383847 () Bool)

(assert (=> b!387814 m!383847))

(declare-fun m!383849 () Bool)

(assert (=> b!387814 m!383849))

(declare-fun m!383851 () Bool)

(assert (=> b!387809 m!383851))

(declare-fun m!383853 () Bool)

(assert (=> b!387808 m!383853))

(declare-fun m!383855 () Bool)

(assert (=> mapNonEmpty!15888 m!383855))

(declare-fun m!383857 () Bool)

(assert (=> b!387810 m!383857))

(declare-fun m!383859 () Bool)

(assert (=> b!387817 m!383859))

(declare-fun m!383861 () Bool)

(assert (=> b!387815 m!383861))

(declare-fun m!383863 () Bool)

(assert (=> b!387811 m!383863))

(check-sat (not b!387814) (not start!37774) tp_is_empty!9549 (not mapNonEmpty!15888) (not b!387817) (not b!387810) (not b!387815) (not b!387816) (not b_next!8877) (not b!387811) (not b!387809) b_and!16119)
(check-sat b_and!16119 (not b_next!8877))
