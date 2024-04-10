; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37720 () Bool)

(assert start!37720)

(declare-fun b_free!8823 () Bool)

(declare-fun b_next!8823 () Bool)

(assert (=> start!37720 (= b_free!8823 (not b_next!8823))))

(declare-fun tp!31221 () Bool)

(declare-fun b_and!16065 () Bool)

(assert (=> start!37720 (= tp!31221 b_and!16065)))

(declare-fun res!220850 () Bool)

(declare-fun e!234576 () Bool)

(assert (=> start!37720 (=> (not res!220850) (not e!234576))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37720 (= res!220850 (validMask!0 mask!970))))

(assert (=> start!37720 e!234576))

(declare-datatypes ((V!13765 0))(
  ( (V!13766 (val!4792 Int)) )
))
(declare-datatypes ((ValueCell!4404 0))(
  ( (ValueCellFull!4404 (v!6989 V!13765)) (EmptyCell!4404) )
))
(declare-datatypes ((array!22885 0))(
  ( (array!22886 (arr!10911 (Array (_ BitVec 32) ValueCell!4404)) (size!11263 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22885)

(declare-fun e!234573 () Bool)

(declare-fun array_inv!8026 (array!22885) Bool)

(assert (=> start!37720 (and (array_inv!8026 _values!506) e!234573)))

(assert (=> start!37720 tp!31221))

(assert (=> start!37720 true))

(declare-fun tp_is_empty!9495 () Bool)

(assert (=> start!37720 tp_is_empty!9495))

(declare-datatypes ((array!22887 0))(
  ( (array!22888 (arr!10912 (Array (_ BitVec 32) (_ BitVec 64))) (size!11264 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22887)

(declare-fun array_inv!8027 (array!22887) Bool)

(assert (=> start!37720 (array_inv!8027 _keys!658)))

(declare-fun b!386753 () Bool)

(declare-fun e!234574 () Bool)

(assert (=> b!386753 (= e!234574 false)))

(declare-datatypes ((tuple2!6442 0))(
  ( (tuple2!6443 (_1!3232 (_ BitVec 64)) (_2!3232 V!13765)) )
))
(declare-datatypes ((List!6291 0))(
  ( (Nil!6288) (Cons!6287 (h!7143 tuple2!6442) (t!11441 List!6291)) )
))
(declare-datatypes ((ListLongMap!5355 0))(
  ( (ListLongMap!5356 (toList!2693 List!6291)) )
))
(declare-fun lt!181880 () ListLongMap!5355)

(declare-fun zeroValue!472 () V!13765)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13765)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!181879 () array!22887)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!13765)

(declare-fun getCurrentListMapNoExtraKeys!922 (array!22887 array!22885 (_ BitVec 32) (_ BitVec 32) V!13765 V!13765 (_ BitVec 32) Int) ListLongMap!5355)

(assert (=> b!386753 (= lt!181880 (getCurrentListMapNoExtraKeys!922 lt!181879 (array!22886 (store (arr!10911 _values!506) i!548 (ValueCellFull!4404 v!373)) (size!11263 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181881 () ListLongMap!5355)

(assert (=> b!386753 (= lt!181881 (getCurrentListMapNoExtraKeys!922 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15807 () Bool)

(declare-fun mapRes!15807 () Bool)

(assert (=> mapIsEmpty!15807 mapRes!15807))

(declare-fun b!386754 () Bool)

(declare-fun res!220852 () Bool)

(assert (=> b!386754 (=> (not res!220852) (not e!234576))))

(declare-datatypes ((List!6292 0))(
  ( (Nil!6289) (Cons!6288 (h!7144 (_ BitVec 64)) (t!11442 List!6292)) )
))
(declare-fun arrayNoDuplicates!0 (array!22887 (_ BitVec 32) List!6292) Bool)

(assert (=> b!386754 (= res!220852 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6289))))

(declare-fun b!386755 () Bool)

(declare-fun res!220849 () Bool)

(assert (=> b!386755 (=> (not res!220849) (not e!234576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22887 (_ BitVec 32)) Bool)

(assert (=> b!386755 (= res!220849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386756 () Bool)

(declare-fun res!220851 () Bool)

(assert (=> b!386756 (=> (not res!220851) (not e!234576))))

(assert (=> b!386756 (= res!220851 (or (= (select (arr!10912 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10912 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386757 () Bool)

(declare-fun res!220856 () Bool)

(assert (=> b!386757 (=> (not res!220856) (not e!234574))))

(assert (=> b!386757 (= res!220856 (arrayNoDuplicates!0 lt!181879 #b00000000000000000000000000000000 Nil!6289))))

(declare-fun b!386758 () Bool)

(declare-fun res!220855 () Bool)

(assert (=> b!386758 (=> (not res!220855) (not e!234576))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386758 (= res!220855 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!386759 () Bool)

(declare-fun e!234577 () Bool)

(assert (=> b!386759 (= e!234577 tp_is_empty!9495)))

(declare-fun mapNonEmpty!15807 () Bool)

(declare-fun tp!31220 () Bool)

(declare-fun e!234575 () Bool)

(assert (=> mapNonEmpty!15807 (= mapRes!15807 (and tp!31220 e!234575))))

(declare-fun mapKey!15807 () (_ BitVec 32))

(declare-fun mapRest!15807 () (Array (_ BitVec 32) ValueCell!4404))

(declare-fun mapValue!15807 () ValueCell!4404)

(assert (=> mapNonEmpty!15807 (= (arr!10911 _values!506) (store mapRest!15807 mapKey!15807 mapValue!15807))))

(declare-fun b!386760 () Bool)

(assert (=> b!386760 (= e!234573 (and e!234577 mapRes!15807))))

(declare-fun condMapEmpty!15807 () Bool)

(declare-fun mapDefault!15807 () ValueCell!4404)

(assert (=> b!386760 (= condMapEmpty!15807 (= (arr!10911 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4404)) mapDefault!15807)))))

(declare-fun b!386761 () Bool)

(assert (=> b!386761 (= e!234575 tp_is_empty!9495)))

(declare-fun b!386762 () Bool)

(declare-fun res!220848 () Bool)

(assert (=> b!386762 (=> (not res!220848) (not e!234576))))

(assert (=> b!386762 (= res!220848 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11264 _keys!658))))))

(declare-fun b!386763 () Bool)

(declare-fun res!220854 () Bool)

(assert (=> b!386763 (=> (not res!220854) (not e!234576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386763 (= res!220854 (validKeyInArray!0 k0!778))))

(declare-fun b!386764 () Bool)

(assert (=> b!386764 (= e!234576 e!234574)))

(declare-fun res!220847 () Bool)

(assert (=> b!386764 (=> (not res!220847) (not e!234574))))

(assert (=> b!386764 (= res!220847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181879 mask!970))))

(assert (=> b!386764 (= lt!181879 (array!22888 (store (arr!10912 _keys!658) i!548 k0!778) (size!11264 _keys!658)))))

(declare-fun b!386765 () Bool)

(declare-fun res!220853 () Bool)

(assert (=> b!386765 (=> (not res!220853) (not e!234576))))

(assert (=> b!386765 (= res!220853 (and (= (size!11263 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11264 _keys!658) (size!11263 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37720 res!220850) b!386765))

(assert (= (and b!386765 res!220853) b!386755))

(assert (= (and b!386755 res!220849) b!386754))

(assert (= (and b!386754 res!220852) b!386762))

(assert (= (and b!386762 res!220848) b!386763))

(assert (= (and b!386763 res!220854) b!386756))

(assert (= (and b!386756 res!220851) b!386758))

(assert (= (and b!386758 res!220855) b!386764))

(assert (= (and b!386764 res!220847) b!386757))

(assert (= (and b!386757 res!220856) b!386753))

(assert (= (and b!386760 condMapEmpty!15807) mapIsEmpty!15807))

(assert (= (and b!386760 (not condMapEmpty!15807)) mapNonEmpty!15807))

(get-info :version)

(assert (= (and mapNonEmpty!15807 ((_ is ValueCellFull!4404) mapValue!15807)) b!386761))

(assert (= (and b!386760 ((_ is ValueCellFull!4404) mapDefault!15807)) b!386759))

(assert (= start!37720 b!386760))

(declare-fun m!383025 () Bool)

(assert (=> b!386754 m!383025))

(declare-fun m!383027 () Bool)

(assert (=> start!37720 m!383027))

(declare-fun m!383029 () Bool)

(assert (=> start!37720 m!383029))

(declare-fun m!383031 () Bool)

(assert (=> start!37720 m!383031))

(declare-fun m!383033 () Bool)

(assert (=> b!386753 m!383033))

(declare-fun m!383035 () Bool)

(assert (=> b!386753 m!383035))

(declare-fun m!383037 () Bool)

(assert (=> b!386753 m!383037))

(declare-fun m!383039 () Bool)

(assert (=> mapNonEmpty!15807 m!383039))

(declare-fun m!383041 () Bool)

(assert (=> b!386755 m!383041))

(declare-fun m!383043 () Bool)

(assert (=> b!386757 m!383043))

(declare-fun m!383045 () Bool)

(assert (=> b!386756 m!383045))

(declare-fun m!383047 () Bool)

(assert (=> b!386763 m!383047))

(declare-fun m!383049 () Bool)

(assert (=> b!386764 m!383049))

(declare-fun m!383051 () Bool)

(assert (=> b!386764 m!383051))

(declare-fun m!383053 () Bool)

(assert (=> b!386758 m!383053))

(check-sat (not b!386754) (not b!386755) (not b!386753) (not b_next!8823) tp_is_empty!9495 (not mapNonEmpty!15807) (not b!386757) (not start!37720) b_and!16065 (not b!386758) (not b!386763) (not b!386764))
(check-sat b_and!16065 (not b_next!8823))
