; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37378 () Bool)

(assert start!37378)

(declare-fun b_free!8505 () Bool)

(declare-fun b_next!8505 () Bool)

(assert (=> start!37378 (= b_free!8505 (not b_next!8505))))

(declare-fun tp!30231 () Bool)

(declare-fun b_and!15747 () Bool)

(assert (=> start!37378 (= tp!30231 b_and!15747)))

(declare-fun b!379815 () Bool)

(declare-fun res!215450 () Bool)

(declare-fun e!231058 () Bool)

(assert (=> b!379815 (=> (not res!215450) (not e!231058))))

(declare-datatypes ((array!22227 0))(
  ( (array!22228 (arr!10582 (Array (_ BitVec 32) (_ BitVec 64))) (size!10934 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22227)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379815 (= res!215450 (or (= (select (arr!10582 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10582 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379816 () Bool)

(declare-fun e!231057 () Bool)

(declare-fun e!231061 () Bool)

(declare-fun mapRes!15294 () Bool)

(assert (=> b!379816 (= e!231057 (and e!231061 mapRes!15294))))

(declare-fun condMapEmpty!15294 () Bool)

(declare-datatypes ((V!13309 0))(
  ( (V!13310 (val!4621 Int)) )
))
(declare-datatypes ((ValueCell!4233 0))(
  ( (ValueCellFull!4233 (v!6818 V!13309)) (EmptyCell!4233) )
))
(declare-datatypes ((array!22229 0))(
  ( (array!22230 (arr!10583 (Array (_ BitVec 32) ValueCell!4233)) (size!10935 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22229)

(declare-fun mapDefault!15294 () ValueCell!4233)

(assert (=> b!379816 (= condMapEmpty!15294 (= (arr!10583 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4233)) mapDefault!15294)))))

(declare-fun b!379817 () Bool)

(declare-fun res!215453 () Bool)

(assert (=> b!379817 (=> (not res!215453) (not e!231058))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22227 (_ BitVec 32)) Bool)

(assert (=> b!379817 (= res!215453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379818 () Bool)

(declare-fun res!215448 () Bool)

(assert (=> b!379818 (=> (not res!215448) (not e!231058))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379818 (= res!215448 (and (= (size!10935 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10934 _keys!658) (size!10935 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379819 () Bool)

(declare-fun e!231060 () Bool)

(assert (=> b!379819 (= e!231058 e!231060)))

(declare-fun res!215455 () Bool)

(assert (=> b!379819 (=> (not res!215455) (not e!231060))))

(declare-fun lt!177511 () array!22227)

(assert (=> b!379819 (= res!215455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177511 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!379819 (= lt!177511 (array!22228 (store (arr!10582 _keys!658) i!548 k0!778) (size!10934 _keys!658)))))

(declare-fun b!379820 () Bool)

(declare-fun res!215454 () Bool)

(assert (=> b!379820 (=> (not res!215454) (not e!231058))))

(declare-fun arrayContainsKey!0 (array!22227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379820 (= res!215454 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379821 () Bool)

(declare-fun res!215456 () Bool)

(assert (=> b!379821 (=> (not res!215456) (not e!231058))))

(assert (=> b!379821 (= res!215456 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10934 _keys!658))))))

(declare-fun res!215457 () Bool)

(assert (=> start!37378 (=> (not res!215457) (not e!231058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37378 (= res!215457 (validMask!0 mask!970))))

(assert (=> start!37378 e!231058))

(declare-fun array_inv!7790 (array!22229) Bool)

(assert (=> start!37378 (and (array_inv!7790 _values!506) e!231057)))

(assert (=> start!37378 tp!30231))

(assert (=> start!37378 true))

(declare-fun tp_is_empty!9153 () Bool)

(assert (=> start!37378 tp_is_empty!9153))

(declare-fun array_inv!7791 (array!22227) Bool)

(assert (=> start!37378 (array_inv!7791 _keys!658)))

(declare-fun b!379822 () Bool)

(declare-fun e!231055 () Bool)

(assert (=> b!379822 (= e!231055 true)))

(declare-datatypes ((tuple2!6188 0))(
  ( (tuple2!6189 (_1!3105 (_ BitVec 64)) (_2!3105 V!13309)) )
))
(declare-datatypes ((List!6023 0))(
  ( (Nil!6020) (Cons!6019 (h!6875 tuple2!6188) (t!11173 List!6023)) )
))
(declare-datatypes ((ListLongMap!5101 0))(
  ( (ListLongMap!5102 (toList!2566 List!6023)) )
))
(declare-fun lt!177512 () ListLongMap!5101)

(declare-fun lt!177519 () ListLongMap!5101)

(declare-fun lt!177522 () tuple2!6188)

(declare-fun +!912 (ListLongMap!5101 tuple2!6188) ListLongMap!5101)

(assert (=> b!379822 (= lt!177512 (+!912 lt!177519 lt!177522))))

(declare-fun lt!177518 () ListLongMap!5101)

(declare-fun v!373 () V!13309)

(declare-datatypes ((Unit!11718 0))(
  ( (Unit!11719) )
))
(declare-fun lt!177510 () Unit!11718)

(declare-fun minValue!472 () V!13309)

(declare-fun addCommutativeForDiffKeys!309 (ListLongMap!5101 (_ BitVec 64) V!13309 (_ BitVec 64) V!13309) Unit!11718)

(assert (=> b!379822 (= lt!177510 (addCommutativeForDiffKeys!309 lt!177518 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapIsEmpty!15294 () Bool)

(assert (=> mapIsEmpty!15294 mapRes!15294))

(declare-fun mapNonEmpty!15294 () Bool)

(declare-fun tp!30230 () Bool)

(declare-fun e!231062 () Bool)

(assert (=> mapNonEmpty!15294 (= mapRes!15294 (and tp!30230 e!231062))))

(declare-fun mapRest!15294 () (Array (_ BitVec 32) ValueCell!4233))

(declare-fun mapKey!15294 () (_ BitVec 32))

(declare-fun mapValue!15294 () ValueCell!4233)

(assert (=> mapNonEmpty!15294 (= (arr!10583 _values!506) (store mapRest!15294 mapKey!15294 mapValue!15294))))

(declare-fun b!379823 () Bool)

(declare-fun e!231056 () Bool)

(assert (=> b!379823 (= e!231060 (not e!231056))))

(declare-fun res!215452 () Bool)

(assert (=> b!379823 (=> res!215452 e!231056)))

(assert (=> b!379823 (= res!215452 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!177520 () ListLongMap!5101)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13309)

(declare-fun getCurrentListMap!1984 (array!22227 array!22229 (_ BitVec 32) (_ BitVec 32) V!13309 V!13309 (_ BitVec 32) Int) ListLongMap!5101)

(assert (=> b!379823 (= lt!177520 (getCurrentListMap!1984 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177513 () ListLongMap!5101)

(declare-fun lt!177514 () array!22229)

(assert (=> b!379823 (= lt!177513 (getCurrentListMap!1984 lt!177511 lt!177514 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177521 () ListLongMap!5101)

(declare-fun lt!177516 () ListLongMap!5101)

(assert (=> b!379823 (and (= lt!177521 lt!177516) (= lt!177516 lt!177521))))

(assert (=> b!379823 (= lt!177516 (+!912 lt!177518 lt!177522))))

(assert (=> b!379823 (= lt!177522 (tuple2!6189 k0!778 v!373))))

(declare-fun lt!177515 () Unit!11718)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!142 (array!22227 array!22229 (_ BitVec 32) (_ BitVec 32) V!13309 V!13309 (_ BitVec 32) (_ BitVec 64) V!13309 (_ BitVec 32) Int) Unit!11718)

(assert (=> b!379823 (= lt!177515 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!142 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!818 (array!22227 array!22229 (_ BitVec 32) (_ BitVec 32) V!13309 V!13309 (_ BitVec 32) Int) ListLongMap!5101)

(assert (=> b!379823 (= lt!177521 (getCurrentListMapNoExtraKeys!818 lt!177511 lt!177514 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379823 (= lt!177514 (array!22230 (store (arr!10583 _values!506) i!548 (ValueCellFull!4233 v!373)) (size!10935 _values!506)))))

(assert (=> b!379823 (= lt!177518 (getCurrentListMapNoExtraKeys!818 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379824 () Bool)

(declare-fun res!215449 () Bool)

(assert (=> b!379824 (=> (not res!215449) (not e!231060))))

(declare-datatypes ((List!6024 0))(
  ( (Nil!6021) (Cons!6020 (h!6876 (_ BitVec 64)) (t!11174 List!6024)) )
))
(declare-fun arrayNoDuplicates!0 (array!22227 (_ BitVec 32) List!6024) Bool)

(assert (=> b!379824 (= res!215449 (arrayNoDuplicates!0 lt!177511 #b00000000000000000000000000000000 Nil!6021))))

(declare-fun b!379825 () Bool)

(assert (=> b!379825 (= e!231061 tp_is_empty!9153)))

(declare-fun b!379826 () Bool)

(assert (=> b!379826 (= e!231062 tp_is_empty!9153)))

(declare-fun b!379827 () Bool)

(declare-fun res!215459 () Bool)

(assert (=> b!379827 (=> (not res!215459) (not e!231058))))

(assert (=> b!379827 (= res!215459 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6021))))

(declare-fun b!379828 () Bool)

(declare-fun res!215451 () Bool)

(assert (=> b!379828 (=> (not res!215451) (not e!231058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379828 (= res!215451 (validKeyInArray!0 k0!778))))

(declare-fun b!379829 () Bool)

(assert (=> b!379829 (= e!231056 e!231055)))

(declare-fun res!215458 () Bool)

(assert (=> b!379829 (=> res!215458 e!231055)))

(assert (=> b!379829 (= res!215458 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!379829 (= lt!177520 lt!177519)))

(declare-fun lt!177517 () tuple2!6188)

(assert (=> b!379829 (= lt!177519 (+!912 lt!177518 lt!177517))))

(assert (=> b!379829 (= lt!177513 lt!177512)))

(assert (=> b!379829 (= lt!177512 (+!912 lt!177516 lt!177517))))

(assert (=> b!379829 (= lt!177513 (+!912 lt!177521 lt!177517))))

(assert (=> b!379829 (= lt!177517 (tuple2!6189 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (= (and start!37378 res!215457) b!379818))

(assert (= (and b!379818 res!215448) b!379817))

(assert (= (and b!379817 res!215453) b!379827))

(assert (= (and b!379827 res!215459) b!379821))

(assert (= (and b!379821 res!215456) b!379828))

(assert (= (and b!379828 res!215451) b!379815))

(assert (= (and b!379815 res!215450) b!379820))

(assert (= (and b!379820 res!215454) b!379819))

(assert (= (and b!379819 res!215455) b!379824))

(assert (= (and b!379824 res!215449) b!379823))

(assert (= (and b!379823 (not res!215452)) b!379829))

(assert (= (and b!379829 (not res!215458)) b!379822))

(assert (= (and b!379816 condMapEmpty!15294) mapIsEmpty!15294))

(assert (= (and b!379816 (not condMapEmpty!15294)) mapNonEmpty!15294))

(get-info :version)

(assert (= (and mapNonEmpty!15294 ((_ is ValueCellFull!4233) mapValue!15294)) b!379826))

(assert (= (and b!379816 ((_ is ValueCellFull!4233) mapDefault!15294)) b!379825))

(assert (= start!37378 b!379816))

(declare-fun m!376719 () Bool)

(assert (=> b!379815 m!376719))

(declare-fun m!376721 () Bool)

(assert (=> b!379817 m!376721))

(declare-fun m!376723 () Bool)

(assert (=> b!379823 m!376723))

(declare-fun m!376725 () Bool)

(assert (=> b!379823 m!376725))

(declare-fun m!376727 () Bool)

(assert (=> b!379823 m!376727))

(declare-fun m!376729 () Bool)

(assert (=> b!379823 m!376729))

(declare-fun m!376731 () Bool)

(assert (=> b!379823 m!376731))

(declare-fun m!376733 () Bool)

(assert (=> b!379823 m!376733))

(declare-fun m!376735 () Bool)

(assert (=> b!379823 m!376735))

(declare-fun m!376737 () Bool)

(assert (=> b!379828 m!376737))

(declare-fun m!376739 () Bool)

(assert (=> b!379822 m!376739))

(declare-fun m!376741 () Bool)

(assert (=> b!379822 m!376741))

(declare-fun m!376743 () Bool)

(assert (=> start!37378 m!376743))

(declare-fun m!376745 () Bool)

(assert (=> start!37378 m!376745))

(declare-fun m!376747 () Bool)

(assert (=> start!37378 m!376747))

(declare-fun m!376749 () Bool)

(assert (=> mapNonEmpty!15294 m!376749))

(declare-fun m!376751 () Bool)

(assert (=> b!379819 m!376751))

(declare-fun m!376753 () Bool)

(assert (=> b!379819 m!376753))

(declare-fun m!376755 () Bool)

(assert (=> b!379824 m!376755))

(declare-fun m!376757 () Bool)

(assert (=> b!379820 m!376757))

(declare-fun m!376759 () Bool)

(assert (=> b!379827 m!376759))

(declare-fun m!376761 () Bool)

(assert (=> b!379829 m!376761))

(declare-fun m!376763 () Bool)

(assert (=> b!379829 m!376763))

(declare-fun m!376765 () Bool)

(assert (=> b!379829 m!376765))

(check-sat (not b!379823) (not b!379817) (not b!379822) (not b_next!8505) (not b!379828) (not b!379820) (not b!379824) b_and!15747 (not b!379829) (not start!37378) (not mapNonEmpty!15294) (not b!379819) (not b!379827) tp_is_empty!9153)
(check-sat b_and!15747 (not b_next!8505))
