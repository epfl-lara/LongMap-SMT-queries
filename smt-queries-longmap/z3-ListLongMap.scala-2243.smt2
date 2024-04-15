; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36906 () Bool)

(assert start!36906)

(declare-fun b_free!8047 () Bool)

(declare-fun b_next!8047 () Bool)

(assert (=> start!36906 (= b_free!8047 (not b_next!8047))))

(declare-fun tp!28857 () Bool)

(declare-fun b_and!15263 () Bool)

(assert (=> start!36906 (= tp!28857 b_and!15263)))

(declare-fun b!369685 () Bool)

(declare-fun res!207527 () Bool)

(declare-fun e!225862 () Bool)

(assert (=> b!369685 (=> (not res!207527) (not e!225862))))

(declare-datatypes ((array!21321 0))(
  ( (array!21322 (arr!10129 (Array (_ BitVec 32) (_ BitVec 64))) (size!10482 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21321)

(declare-datatypes ((List!5625 0))(
  ( (Nil!5622) (Cons!5621 (h!6477 (_ BitVec 64)) (t!10766 List!5625)) )
))
(declare-fun arrayNoDuplicates!0 (array!21321 (_ BitVec 32) List!5625) Bool)

(assert (=> b!369685 (= res!207527 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5622))))

(declare-fun res!207528 () Bool)

(assert (=> start!36906 (=> (not res!207528) (not e!225862))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36906 (= res!207528 (validMask!0 mask!970))))

(assert (=> start!36906 e!225862))

(declare-datatypes ((V!12699 0))(
  ( (V!12700 (val!4392 Int)) )
))
(declare-datatypes ((ValueCell!4004 0))(
  ( (ValueCellFull!4004 (v!6583 V!12699)) (EmptyCell!4004) )
))
(declare-datatypes ((array!21323 0))(
  ( (array!21324 (arr!10130 (Array (_ BitVec 32) ValueCell!4004)) (size!10483 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21323)

(declare-fun e!225863 () Bool)

(declare-fun array_inv!7494 (array!21323) Bool)

(assert (=> start!36906 (and (array_inv!7494 _values!506) e!225863)))

(assert (=> start!36906 tp!28857))

(assert (=> start!36906 true))

(declare-fun tp_is_empty!8695 () Bool)

(assert (=> start!36906 tp_is_empty!8695))

(declare-fun array_inv!7495 (array!21321) Bool)

(assert (=> start!36906 (array_inv!7495 _keys!658)))

(declare-fun b!369686 () Bool)

(declare-fun res!207521 () Bool)

(assert (=> b!369686 (=> (not res!207521) (not e!225862))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369686 (= res!207521 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369687 () Bool)

(declare-fun res!207530 () Bool)

(assert (=> b!369687 (=> (not res!207530) (not e!225862))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369687 (= res!207530 (or (= (select (arr!10129 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10129 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369688 () Bool)

(declare-fun e!225858 () Bool)

(declare-fun mapRes!14607 () Bool)

(assert (=> b!369688 (= e!225863 (and e!225858 mapRes!14607))))

(declare-fun condMapEmpty!14607 () Bool)

(declare-fun mapDefault!14607 () ValueCell!4004)

(assert (=> b!369688 (= condMapEmpty!14607 (= (arr!10130 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4004)) mapDefault!14607)))))

(declare-fun b!369689 () Bool)

(declare-fun res!207525 () Bool)

(assert (=> b!369689 (=> (not res!207525) (not e!225862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21321 (_ BitVec 32)) Bool)

(assert (=> b!369689 (= res!207525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369690 () Bool)

(assert (=> b!369690 (= e!225858 tp_is_empty!8695)))

(declare-fun b!369691 () Bool)

(declare-fun e!225861 () Bool)

(assert (=> b!369691 (= e!225861 false)))

(declare-datatypes ((tuple2!5794 0))(
  ( (tuple2!5795 (_1!2908 (_ BitVec 64)) (_2!2908 V!12699)) )
))
(declare-datatypes ((List!5626 0))(
  ( (Nil!5623) (Cons!5622 (h!6478 tuple2!5794) (t!10767 List!5626)) )
))
(declare-datatypes ((ListLongMap!4697 0))(
  ( (ListLongMap!4698 (toList!2364 List!5626)) )
))
(declare-fun lt!169623 () ListLongMap!4697)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!169621 () array!21321)

(declare-fun zeroValue!472 () V!12699)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12699)

(declare-fun minValue!472 () V!12699)

(declare-fun getCurrentListMapNoExtraKeys!655 (array!21321 array!21323 (_ BitVec 32) (_ BitVec 32) V!12699 V!12699 (_ BitVec 32) Int) ListLongMap!4697)

(assert (=> b!369691 (= lt!169623 (getCurrentListMapNoExtraKeys!655 lt!169621 (array!21324 (store (arr!10130 _values!506) i!548 (ValueCellFull!4004 v!373)) (size!10483 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169622 () ListLongMap!4697)

(assert (=> b!369691 (= lt!169622 (getCurrentListMapNoExtraKeys!655 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369692 () Bool)

(declare-fun res!207526 () Bool)

(assert (=> b!369692 (=> (not res!207526) (not e!225862))))

(assert (=> b!369692 (= res!207526 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10482 _keys!658))))))

(declare-fun mapIsEmpty!14607 () Bool)

(assert (=> mapIsEmpty!14607 mapRes!14607))

(declare-fun mapNonEmpty!14607 () Bool)

(declare-fun tp!28856 () Bool)

(declare-fun e!225859 () Bool)

(assert (=> mapNonEmpty!14607 (= mapRes!14607 (and tp!28856 e!225859))))

(declare-fun mapValue!14607 () ValueCell!4004)

(declare-fun mapRest!14607 () (Array (_ BitVec 32) ValueCell!4004))

(declare-fun mapKey!14607 () (_ BitVec 32))

(assert (=> mapNonEmpty!14607 (= (arr!10130 _values!506) (store mapRest!14607 mapKey!14607 mapValue!14607))))

(declare-fun b!369693 () Bool)

(declare-fun res!207522 () Bool)

(assert (=> b!369693 (=> (not res!207522) (not e!225862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369693 (= res!207522 (validKeyInArray!0 k0!778))))

(declare-fun b!369694 () Bool)

(declare-fun res!207523 () Bool)

(assert (=> b!369694 (=> (not res!207523) (not e!225862))))

(assert (=> b!369694 (= res!207523 (and (= (size!10483 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10482 _keys!658) (size!10483 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369695 () Bool)

(assert (=> b!369695 (= e!225862 e!225861)))

(declare-fun res!207524 () Bool)

(assert (=> b!369695 (=> (not res!207524) (not e!225861))))

(assert (=> b!369695 (= res!207524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169621 mask!970))))

(assert (=> b!369695 (= lt!169621 (array!21322 (store (arr!10129 _keys!658) i!548 k0!778) (size!10482 _keys!658)))))

(declare-fun b!369696 () Bool)

(assert (=> b!369696 (= e!225859 tp_is_empty!8695)))

(declare-fun b!369697 () Bool)

(declare-fun res!207529 () Bool)

(assert (=> b!369697 (=> (not res!207529) (not e!225861))))

(assert (=> b!369697 (= res!207529 (arrayNoDuplicates!0 lt!169621 #b00000000000000000000000000000000 Nil!5622))))

(assert (= (and start!36906 res!207528) b!369694))

(assert (= (and b!369694 res!207523) b!369689))

(assert (= (and b!369689 res!207525) b!369685))

(assert (= (and b!369685 res!207527) b!369692))

(assert (= (and b!369692 res!207526) b!369693))

(assert (= (and b!369693 res!207522) b!369687))

(assert (= (and b!369687 res!207530) b!369686))

(assert (= (and b!369686 res!207521) b!369695))

(assert (= (and b!369695 res!207524) b!369697))

(assert (= (and b!369697 res!207529) b!369691))

(assert (= (and b!369688 condMapEmpty!14607) mapIsEmpty!14607))

(assert (= (and b!369688 (not condMapEmpty!14607)) mapNonEmpty!14607))

(get-info :version)

(assert (= (and mapNonEmpty!14607 ((_ is ValueCellFull!4004) mapValue!14607)) b!369696))

(assert (= (and b!369688 ((_ is ValueCellFull!4004) mapDefault!14607)) b!369690))

(assert (= start!36906 b!369688))

(declare-fun m!365489 () Bool)

(assert (=> b!369685 m!365489))

(declare-fun m!365491 () Bool)

(assert (=> b!369695 m!365491))

(declare-fun m!365493 () Bool)

(assert (=> b!369695 m!365493))

(declare-fun m!365495 () Bool)

(assert (=> b!369697 m!365495))

(declare-fun m!365497 () Bool)

(assert (=> start!36906 m!365497))

(declare-fun m!365499 () Bool)

(assert (=> start!36906 m!365499))

(declare-fun m!365501 () Bool)

(assert (=> start!36906 m!365501))

(declare-fun m!365503 () Bool)

(assert (=> b!369693 m!365503))

(declare-fun m!365505 () Bool)

(assert (=> mapNonEmpty!14607 m!365505))

(declare-fun m!365507 () Bool)

(assert (=> b!369691 m!365507))

(declare-fun m!365509 () Bool)

(assert (=> b!369691 m!365509))

(declare-fun m!365511 () Bool)

(assert (=> b!369691 m!365511))

(declare-fun m!365513 () Bool)

(assert (=> b!369686 m!365513))

(declare-fun m!365515 () Bool)

(assert (=> b!369687 m!365515))

(declare-fun m!365517 () Bool)

(assert (=> b!369689 m!365517))

(check-sat (not b!369695) (not b!369693) (not b_next!8047) (not start!36906) (not b!369691) (not b!369685) (not mapNonEmpty!14607) (not b!369697) tp_is_empty!8695 b_and!15263 (not b!369686) (not b!369689))
(check-sat b_and!15263 (not b_next!8047))
