; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37692 () Bool)

(assert start!37692)

(declare-fun b_free!8809 () Bool)

(declare-fun b_next!8809 () Bool)

(assert (=> start!37692 (= b_free!8809 (not b_next!8809))))

(declare-fun tp!31178 () Bool)

(declare-fun b_and!16065 () Bool)

(assert (=> start!37692 (= tp!31178 b_and!16065)))

(declare-fun b!386431 () Bool)

(declare-fun res!220641 () Bool)

(declare-fun e!234418 () Bool)

(assert (=> b!386431 (=> (not res!220641) (not e!234418))))

(declare-datatypes ((array!22848 0))(
  ( (array!22849 (arr!10892 (Array (_ BitVec 32) (_ BitVec 64))) (size!11244 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22848)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22848 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386431 (= res!220641 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!220640 () Bool)

(assert (=> start!37692 (=> (not res!220640) (not e!234418))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37692 (= res!220640 (validMask!0 mask!970))))

(assert (=> start!37692 e!234418))

(declare-datatypes ((V!13747 0))(
  ( (V!13748 (val!4785 Int)) )
))
(declare-datatypes ((ValueCell!4397 0))(
  ( (ValueCellFull!4397 (v!6983 V!13747)) (EmptyCell!4397) )
))
(declare-datatypes ((array!22850 0))(
  ( (array!22851 (arr!10893 (Array (_ BitVec 32) ValueCell!4397)) (size!11245 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22850)

(declare-fun e!234419 () Bool)

(declare-fun array_inv!8052 (array!22850) Bool)

(assert (=> start!37692 (and (array_inv!8052 _values!506) e!234419)))

(assert (=> start!37692 tp!31178))

(assert (=> start!37692 true))

(declare-fun tp_is_empty!9481 () Bool)

(assert (=> start!37692 tp_is_empty!9481))

(declare-fun array_inv!8053 (array!22848) Bool)

(assert (=> start!37692 (array_inv!8053 _keys!658)))

(declare-fun b!386432 () Bool)

(declare-fun e!234417 () Bool)

(assert (=> b!386432 (= e!234417 tp_is_empty!9481)))

(declare-fun b!386433 () Bool)

(declare-fun e!234415 () Bool)

(assert (=> b!386433 (= e!234415 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13747)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13747)

(declare-fun lt!181837 () array!22848)

(declare-datatypes ((tuple2!6294 0))(
  ( (tuple2!6295 (_1!3158 (_ BitVec 64)) (_2!3158 V!13747)) )
))
(declare-datatypes ((List!6145 0))(
  ( (Nil!6142) (Cons!6141 (h!6997 tuple2!6294) (t!11287 List!6145)) )
))
(declare-datatypes ((ListLongMap!5209 0))(
  ( (ListLongMap!5210 (toList!2620 List!6145)) )
))
(declare-fun lt!181835 () ListLongMap!5209)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!13747)

(declare-fun getCurrentListMapNoExtraKeys!895 (array!22848 array!22850 (_ BitVec 32) (_ BitVec 32) V!13747 V!13747 (_ BitVec 32) Int) ListLongMap!5209)

(assert (=> b!386433 (= lt!181835 (getCurrentListMapNoExtraKeys!895 lt!181837 (array!22851 (store (arr!10893 _values!506) i!548 (ValueCellFull!4397 v!373)) (size!11245 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181836 () ListLongMap!5209)

(assert (=> b!386433 (= lt!181836 (getCurrentListMapNoExtraKeys!895 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386434 () Bool)

(declare-fun res!220637 () Bool)

(assert (=> b!386434 (=> (not res!220637) (not e!234418))))

(declare-datatypes ((List!6146 0))(
  ( (Nil!6143) (Cons!6142 (h!6998 (_ BitVec 64)) (t!11288 List!6146)) )
))
(declare-fun arrayNoDuplicates!0 (array!22848 (_ BitVec 32) List!6146) Bool)

(assert (=> b!386434 (= res!220637 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6143))))

(declare-fun b!386435 () Bool)

(declare-fun res!220638 () Bool)

(assert (=> b!386435 (=> (not res!220638) (not e!234418))))

(assert (=> b!386435 (= res!220638 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11244 _keys!658))))))

(declare-fun b!386436 () Bool)

(declare-fun res!220642 () Bool)

(assert (=> b!386436 (=> (not res!220642) (not e!234418))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386436 (= res!220642 (validKeyInArray!0 k0!778))))

(declare-fun b!386437 () Bool)

(assert (=> b!386437 (= e!234418 e!234415)))

(declare-fun res!220643 () Bool)

(assert (=> b!386437 (=> (not res!220643) (not e!234415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22848 (_ BitVec 32)) Bool)

(assert (=> b!386437 (= res!220643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181837 mask!970))))

(assert (=> b!386437 (= lt!181837 (array!22849 (store (arr!10892 _keys!658) i!548 k0!778) (size!11244 _keys!658)))))

(declare-fun b!386438 () Bool)

(declare-fun mapRes!15786 () Bool)

(assert (=> b!386438 (= e!234419 (and e!234417 mapRes!15786))))

(declare-fun condMapEmpty!15786 () Bool)

(declare-fun mapDefault!15786 () ValueCell!4397)

(assert (=> b!386438 (= condMapEmpty!15786 (= (arr!10893 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4397)) mapDefault!15786)))))

(declare-fun mapIsEmpty!15786 () Bool)

(assert (=> mapIsEmpty!15786 mapRes!15786))

(declare-fun b!386439 () Bool)

(declare-fun res!220636 () Bool)

(assert (=> b!386439 (=> (not res!220636) (not e!234418))))

(assert (=> b!386439 (= res!220636 (or (= (select (arr!10892 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10892 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386440 () Bool)

(declare-fun res!220634 () Bool)

(assert (=> b!386440 (=> (not res!220634) (not e!234418))))

(assert (=> b!386440 (= res!220634 (and (= (size!11245 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11244 _keys!658) (size!11245 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386441 () Bool)

(declare-fun res!220635 () Bool)

(assert (=> b!386441 (=> (not res!220635) (not e!234418))))

(assert (=> b!386441 (= res!220635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386442 () Bool)

(declare-fun e!234420 () Bool)

(assert (=> b!386442 (= e!234420 tp_is_empty!9481)))

(declare-fun mapNonEmpty!15786 () Bool)

(declare-fun tp!31179 () Bool)

(assert (=> mapNonEmpty!15786 (= mapRes!15786 (and tp!31179 e!234420))))

(declare-fun mapRest!15786 () (Array (_ BitVec 32) ValueCell!4397))

(declare-fun mapValue!15786 () ValueCell!4397)

(declare-fun mapKey!15786 () (_ BitVec 32))

(assert (=> mapNonEmpty!15786 (= (arr!10893 _values!506) (store mapRest!15786 mapKey!15786 mapValue!15786))))

(declare-fun b!386443 () Bool)

(declare-fun res!220639 () Bool)

(assert (=> b!386443 (=> (not res!220639) (not e!234415))))

(assert (=> b!386443 (= res!220639 (arrayNoDuplicates!0 lt!181837 #b00000000000000000000000000000000 Nil!6143))))

(assert (= (and start!37692 res!220640) b!386440))

(assert (= (and b!386440 res!220634) b!386441))

(assert (= (and b!386441 res!220635) b!386434))

(assert (= (and b!386434 res!220637) b!386435))

(assert (= (and b!386435 res!220638) b!386436))

(assert (= (and b!386436 res!220642) b!386439))

(assert (= (and b!386439 res!220636) b!386431))

(assert (= (and b!386431 res!220641) b!386437))

(assert (= (and b!386437 res!220643) b!386443))

(assert (= (and b!386443 res!220639) b!386433))

(assert (= (and b!386438 condMapEmpty!15786) mapIsEmpty!15786))

(assert (= (and b!386438 (not condMapEmpty!15786)) mapNonEmpty!15786))

(get-info :version)

(assert (= (and mapNonEmpty!15786 ((_ is ValueCellFull!4397) mapValue!15786)) b!386442))

(assert (= (and b!386438 ((_ is ValueCellFull!4397) mapDefault!15786)) b!386432))

(assert (= start!37692 b!386438))

(declare-fun m!383045 () Bool)

(assert (=> b!386437 m!383045))

(declare-fun m!383047 () Bool)

(assert (=> b!386437 m!383047))

(declare-fun m!383049 () Bool)

(assert (=> b!386433 m!383049))

(declare-fun m!383051 () Bool)

(assert (=> b!386433 m!383051))

(declare-fun m!383053 () Bool)

(assert (=> b!386433 m!383053))

(declare-fun m!383055 () Bool)

(assert (=> b!386436 m!383055))

(declare-fun m!383057 () Bool)

(assert (=> b!386441 m!383057))

(declare-fun m!383059 () Bool)

(assert (=> b!386439 m!383059))

(declare-fun m!383061 () Bool)

(assert (=> b!386434 m!383061))

(declare-fun m!383063 () Bool)

(assert (=> b!386443 m!383063))

(declare-fun m!383065 () Bool)

(assert (=> mapNonEmpty!15786 m!383065))

(declare-fun m!383067 () Bool)

(assert (=> b!386431 m!383067))

(declare-fun m!383069 () Bool)

(assert (=> start!37692 m!383069))

(declare-fun m!383071 () Bool)

(assert (=> start!37692 m!383071))

(declare-fun m!383073 () Bool)

(assert (=> start!37692 m!383073))

(check-sat (not b!386437) tp_is_empty!9481 (not b!386431) (not b!386434) (not b!386441) (not start!37692) b_and!16065 (not b!386436) (not b!386433) (not b_next!8809) (not mapNonEmpty!15786) (not b!386443))
(check-sat b_and!16065 (not b_next!8809))
