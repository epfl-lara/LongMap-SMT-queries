; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37272 () Bool)

(assert start!37272)

(declare-fun b_free!8413 () Bool)

(declare-fun b_next!8413 () Bool)

(assert (=> start!37272 (= b_free!8413 (not b_next!8413))))

(declare-fun tp!29955 () Bool)

(declare-fun b_and!15629 () Bool)

(assert (=> start!37272 (= tp!29955 b_and!15629)))

(declare-fun b!377465 () Bool)

(declare-fun res!213655 () Bool)

(declare-fun e!229782 () Bool)

(assert (=> b!377465 (=> (not res!213655) (not e!229782))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377465 (= res!213655 (validKeyInArray!0 k0!778))))

(declare-fun b!377466 () Bool)

(declare-fun e!229779 () Bool)

(declare-fun tp_is_empty!9061 () Bool)

(assert (=> b!377466 (= e!229779 tp_is_empty!9061)))

(declare-fun b!377467 () Bool)

(declare-fun e!229777 () Bool)

(declare-fun e!229778 () Bool)

(assert (=> b!377467 (= e!229777 e!229778)))

(declare-fun res!213654 () Bool)

(assert (=> b!377467 (=> res!213654 e!229778)))

(assert (=> b!377467 (= res!213654 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13187 0))(
  ( (V!13188 (val!4575 Int)) )
))
(declare-datatypes ((tuple2!6084 0))(
  ( (tuple2!6085 (_1!3053 (_ BitVec 64)) (_2!3053 V!13187)) )
))
(declare-datatypes ((List!5913 0))(
  ( (Nil!5910) (Cons!5909 (h!6765 tuple2!6084) (t!11054 List!5913)) )
))
(declare-datatypes ((ListLongMap!4987 0))(
  ( (ListLongMap!4988 (toList!2509 List!5913)) )
))
(declare-fun lt!175526 () ListLongMap!4987)

(declare-fun lt!175519 () ListLongMap!4987)

(assert (=> b!377467 (= lt!175526 lt!175519)))

(declare-fun lt!175529 () ListLongMap!4987)

(declare-fun lt!175521 () tuple2!6084)

(declare-fun +!877 (ListLongMap!4987 tuple2!6084) ListLongMap!4987)

(assert (=> b!377467 (= lt!175519 (+!877 lt!175529 lt!175521))))

(declare-fun lt!175530 () ListLongMap!4987)

(declare-fun lt!175527 () ListLongMap!4987)

(assert (=> b!377467 (= lt!175530 lt!175527)))

(declare-fun lt!175525 () ListLongMap!4987)

(assert (=> b!377467 (= lt!175527 (+!877 lt!175525 lt!175521))))

(declare-fun lt!175528 () ListLongMap!4987)

(assert (=> b!377467 (= lt!175526 (+!877 lt!175528 lt!175521))))

(declare-fun zeroValue!472 () V!13187)

(assert (=> b!377467 (= lt!175521 (tuple2!6085 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!15156 () Bool)

(declare-fun mapRes!15156 () Bool)

(declare-fun tp!29954 () Bool)

(declare-fun e!229784 () Bool)

(assert (=> mapNonEmpty!15156 (= mapRes!15156 (and tp!29954 e!229784))))

(declare-datatypes ((ValueCell!4187 0))(
  ( (ValueCellFull!4187 (v!6766 V!13187)) (EmptyCell!4187) )
))
(declare-fun mapValue!15156 () ValueCell!4187)

(declare-fun mapKey!15156 () (_ BitVec 32))

(declare-datatypes ((array!22033 0))(
  ( (array!22034 (arr!10485 (Array (_ BitVec 32) ValueCell!4187)) (size!10838 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22033)

(declare-fun mapRest!15156 () (Array (_ BitVec 32) ValueCell!4187))

(assert (=> mapNonEmpty!15156 (= (arr!10485 _values!506) (store mapRest!15156 mapKey!15156 mapValue!15156))))

(declare-fun b!377468 () Bool)

(declare-fun res!213657 () Bool)

(assert (=> b!377468 (=> (not res!213657) (not e!229782))))

(declare-datatypes ((array!22035 0))(
  ( (array!22036 (arr!10486 (Array (_ BitVec 32) (_ BitVec 64))) (size!10839 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22035)

(declare-fun arrayContainsKey!0 (array!22035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377468 (= res!213657 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377469 () Bool)

(declare-fun e!229780 () Bool)

(assert (=> b!377469 (= e!229780 (and e!229779 mapRes!15156))))

(declare-fun condMapEmpty!15156 () Bool)

(declare-fun mapDefault!15156 () ValueCell!4187)

(assert (=> b!377469 (= condMapEmpty!15156 (= (arr!10485 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4187)) mapDefault!15156)))))

(declare-fun b!377470 () Bool)

(declare-fun res!213665 () Bool)

(assert (=> b!377470 (=> (not res!213665) (not e!229782))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377470 (= res!213665 (or (= (select (arr!10486 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10486 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377471 () Bool)

(declare-fun res!213662 () Bool)

(declare-fun e!229783 () Bool)

(assert (=> b!377471 (=> (not res!213662) (not e!229783))))

(declare-fun lt!175524 () array!22035)

(declare-datatypes ((List!5914 0))(
  ( (Nil!5911) (Cons!5910 (h!6766 (_ BitVec 64)) (t!11055 List!5914)) )
))
(declare-fun arrayNoDuplicates!0 (array!22035 (_ BitVec 32) List!5914) Bool)

(assert (=> b!377471 (= res!213662 (arrayNoDuplicates!0 lt!175524 #b00000000000000000000000000000000 Nil!5911))))

(declare-fun b!377472 () Bool)

(declare-fun res!213661 () Bool)

(assert (=> b!377472 (=> (not res!213661) (not e!229782))))

(assert (=> b!377472 (= res!213661 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10839 _keys!658))))))

(declare-fun b!377473 () Bool)

(declare-fun res!213663 () Bool)

(assert (=> b!377473 (=> (not res!213663) (not e!229782))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22035 (_ BitVec 32)) Bool)

(assert (=> b!377473 (= res!213663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377474 () Bool)

(assert (=> b!377474 (= e!229783 (not e!229777))))

(declare-fun res!213656 () Bool)

(assert (=> b!377474 (=> res!213656 e!229777)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377474 (= res!213656 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13187)

(declare-fun getCurrentListMap!1917 (array!22035 array!22033 (_ BitVec 32) (_ BitVec 32) V!13187 V!13187 (_ BitVec 32) Int) ListLongMap!4987)

(assert (=> b!377474 (= lt!175530 (getCurrentListMap!1917 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175518 () array!22033)

(assert (=> b!377474 (= lt!175526 (getCurrentListMap!1917 lt!175524 lt!175518 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377474 (and (= lt!175528 lt!175529) (= lt!175529 lt!175528))))

(declare-fun lt!175520 () tuple2!6084)

(assert (=> b!377474 (= lt!175529 (+!877 lt!175525 lt!175520))))

(declare-fun v!373 () V!13187)

(assert (=> b!377474 (= lt!175520 (tuple2!6085 k0!778 v!373))))

(declare-datatypes ((Unit!11622 0))(
  ( (Unit!11623) )
))
(declare-fun lt!175522 () Unit!11622)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!110 (array!22035 array!22033 (_ BitVec 32) (_ BitVec 32) V!13187 V!13187 (_ BitVec 32) (_ BitVec 64) V!13187 (_ BitVec 32) Int) Unit!11622)

(assert (=> b!377474 (= lt!175522 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!110 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!782 (array!22035 array!22033 (_ BitVec 32) (_ BitVec 32) V!13187 V!13187 (_ BitVec 32) Int) ListLongMap!4987)

(assert (=> b!377474 (= lt!175528 (getCurrentListMapNoExtraKeys!782 lt!175524 lt!175518 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377474 (= lt!175518 (array!22034 (store (arr!10485 _values!506) i!548 (ValueCellFull!4187 v!373)) (size!10838 _values!506)))))

(assert (=> b!377474 (= lt!175525 (getCurrentListMapNoExtraKeys!782 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377475 () Bool)

(assert (=> b!377475 (= e!229778 true)))

(assert (=> b!377475 (= lt!175519 (+!877 lt!175527 lt!175520))))

(declare-fun lt!175523 () Unit!11622)

(declare-fun addCommutativeForDiffKeys!282 (ListLongMap!4987 (_ BitVec 64) V!13187 (_ BitVec 64) V!13187) Unit!11622)

(assert (=> b!377475 (= lt!175523 (addCommutativeForDiffKeys!282 lt!175525 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377476 () Bool)

(declare-fun res!213660 () Bool)

(assert (=> b!377476 (=> (not res!213660) (not e!229782))))

(assert (=> b!377476 (= res!213660 (and (= (size!10838 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10839 _keys!658) (size!10838 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!213659 () Bool)

(assert (=> start!37272 (=> (not res!213659) (not e!229782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37272 (= res!213659 (validMask!0 mask!970))))

(assert (=> start!37272 e!229782))

(declare-fun array_inv!7728 (array!22033) Bool)

(assert (=> start!37272 (and (array_inv!7728 _values!506) e!229780)))

(assert (=> start!37272 tp!29955))

(assert (=> start!37272 true))

(assert (=> start!37272 tp_is_empty!9061))

(declare-fun array_inv!7729 (array!22035) Bool)

(assert (=> start!37272 (array_inv!7729 _keys!658)))

(declare-fun mapIsEmpty!15156 () Bool)

(assert (=> mapIsEmpty!15156 mapRes!15156))

(declare-fun b!377477 () Bool)

(assert (=> b!377477 (= e!229782 e!229783)))

(declare-fun res!213658 () Bool)

(assert (=> b!377477 (=> (not res!213658) (not e!229783))))

(assert (=> b!377477 (= res!213658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175524 mask!970))))

(assert (=> b!377477 (= lt!175524 (array!22036 (store (arr!10486 _keys!658) i!548 k0!778) (size!10839 _keys!658)))))

(declare-fun b!377478 () Bool)

(declare-fun res!213664 () Bool)

(assert (=> b!377478 (=> (not res!213664) (not e!229782))))

(assert (=> b!377478 (= res!213664 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5911))))

(declare-fun b!377479 () Bool)

(assert (=> b!377479 (= e!229784 tp_is_empty!9061)))

(assert (= (and start!37272 res!213659) b!377476))

(assert (= (and b!377476 res!213660) b!377473))

(assert (= (and b!377473 res!213663) b!377478))

(assert (= (and b!377478 res!213664) b!377472))

(assert (= (and b!377472 res!213661) b!377465))

(assert (= (and b!377465 res!213655) b!377470))

(assert (= (and b!377470 res!213665) b!377468))

(assert (= (and b!377468 res!213657) b!377477))

(assert (= (and b!377477 res!213658) b!377471))

(assert (= (and b!377471 res!213662) b!377474))

(assert (= (and b!377474 (not res!213656)) b!377467))

(assert (= (and b!377467 (not res!213654)) b!377475))

(assert (= (and b!377469 condMapEmpty!15156) mapIsEmpty!15156))

(assert (= (and b!377469 (not condMapEmpty!15156)) mapNonEmpty!15156))

(get-info :version)

(assert (= (and mapNonEmpty!15156 ((_ is ValueCellFull!4187) mapValue!15156)) b!377479))

(assert (= (and b!377469 ((_ is ValueCellFull!4187) mapDefault!15156)) b!377466))

(assert (= start!37272 b!377469))

(declare-fun m!373799 () Bool)

(assert (=> start!37272 m!373799))

(declare-fun m!373801 () Bool)

(assert (=> start!37272 m!373801))

(declare-fun m!373803 () Bool)

(assert (=> start!37272 m!373803))

(declare-fun m!373805 () Bool)

(assert (=> b!377474 m!373805))

(declare-fun m!373807 () Bool)

(assert (=> b!377474 m!373807))

(declare-fun m!373809 () Bool)

(assert (=> b!377474 m!373809))

(declare-fun m!373811 () Bool)

(assert (=> b!377474 m!373811))

(declare-fun m!373813 () Bool)

(assert (=> b!377474 m!373813))

(declare-fun m!373815 () Bool)

(assert (=> b!377474 m!373815))

(declare-fun m!373817 () Bool)

(assert (=> b!377474 m!373817))

(declare-fun m!373819 () Bool)

(assert (=> b!377478 m!373819))

(declare-fun m!373821 () Bool)

(assert (=> b!377470 m!373821))

(declare-fun m!373823 () Bool)

(assert (=> b!377475 m!373823))

(declare-fun m!373825 () Bool)

(assert (=> b!377475 m!373825))

(declare-fun m!373827 () Bool)

(assert (=> b!377468 m!373827))

(declare-fun m!373829 () Bool)

(assert (=> b!377471 m!373829))

(declare-fun m!373831 () Bool)

(assert (=> mapNonEmpty!15156 m!373831))

(declare-fun m!373833 () Bool)

(assert (=> b!377467 m!373833))

(declare-fun m!373835 () Bool)

(assert (=> b!377467 m!373835))

(declare-fun m!373837 () Bool)

(assert (=> b!377467 m!373837))

(declare-fun m!373839 () Bool)

(assert (=> b!377473 m!373839))

(declare-fun m!373841 () Bool)

(assert (=> b!377465 m!373841))

(declare-fun m!373843 () Bool)

(assert (=> b!377477 m!373843))

(declare-fun m!373845 () Bool)

(assert (=> b!377477 m!373845))

(check-sat (not b!377474) (not b!377467) (not b!377465) (not b!377471) tp_is_empty!9061 (not b!377477) (not b!377478) (not b_next!8413) (not b!377468) b_and!15629 (not b!377473) (not b!377475) (not start!37272) (not mapNonEmpty!15156))
(check-sat b_and!15629 (not b_next!8413))
