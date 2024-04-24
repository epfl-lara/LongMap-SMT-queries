; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37500 () Bool)

(assert start!37500)

(declare-fun b_free!8641 () Bool)

(declare-fun b_next!8641 () Bool)

(assert (=> start!37500 (= b_free!8641 (not b_next!8641))))

(declare-fun tp!30639 () Bool)

(declare-fun b_and!15897 () Bool)

(assert (=> start!37500 (= tp!30639 b_and!15897)))

(declare-fun b!382689 () Bool)

(declare-fun e!232518 () Bool)

(declare-fun e!232520 () Bool)

(assert (=> b!382689 (= e!232518 e!232520)))

(declare-fun res!217765 () Bool)

(assert (=> b!382689 (=> (not res!217765) (not e!232520))))

(declare-datatypes ((array!22476 0))(
  ( (array!22477 (arr!10706 (Array (_ BitVec 32) (_ BitVec 64))) (size!11058 (_ BitVec 32))) )
))
(declare-fun lt!179636 () array!22476)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22476 (_ BitVec 32)) Bool)

(assert (=> b!382689 (= res!217765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179636 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22476)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382689 (= lt!179636 (array!22477 (store (arr!10706 _keys!658) i!548 k0!778) (size!11058 _keys!658)))))

(declare-fun b!382690 () Bool)

(declare-fun e!232523 () Bool)

(assert (=> b!382690 (= e!232523 true)))

(declare-datatypes ((V!13491 0))(
  ( (V!13492 (val!4689 Int)) )
))
(declare-datatypes ((tuple2!6182 0))(
  ( (tuple2!6183 (_1!3102 (_ BitVec 64)) (_2!3102 V!13491)) )
))
(declare-datatypes ((List!6018 0))(
  ( (Nil!6015) (Cons!6014 (h!6870 tuple2!6182) (t!11160 List!6018)) )
))
(declare-datatypes ((ListLongMap!5097 0))(
  ( (ListLongMap!5098 (toList!2564 List!6018)) )
))
(declare-fun lt!179639 () ListLongMap!5097)

(declare-fun lt!179637 () ListLongMap!5097)

(assert (=> b!382690 (= lt!179639 lt!179637)))

(declare-fun b!382691 () Bool)

(declare-fun e!232521 () Bool)

(declare-fun e!232519 () Bool)

(declare-fun mapRes!15498 () Bool)

(assert (=> b!382691 (= e!232521 (and e!232519 mapRes!15498))))

(declare-fun condMapEmpty!15498 () Bool)

(declare-datatypes ((ValueCell!4301 0))(
  ( (ValueCellFull!4301 (v!6887 V!13491)) (EmptyCell!4301) )
))
(declare-datatypes ((array!22478 0))(
  ( (array!22479 (arr!10707 (Array (_ BitVec 32) ValueCell!4301)) (size!11059 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22478)

(declare-fun mapDefault!15498 () ValueCell!4301)

(assert (=> b!382691 (= condMapEmpty!15498 (= (arr!10707 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4301)) mapDefault!15498)))))

(declare-fun b!382692 () Bool)

(declare-fun res!217764 () Bool)

(assert (=> b!382692 (=> (not res!217764) (not e!232518))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382692 (= res!217764 (and (= (size!11059 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11058 _keys!658) (size!11059 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15498 () Bool)

(assert (=> mapIsEmpty!15498 mapRes!15498))

(declare-fun b!382693 () Bool)

(declare-fun res!217756 () Bool)

(assert (=> b!382693 (=> (not res!217756) (not e!232520))))

(declare-datatypes ((List!6019 0))(
  ( (Nil!6016) (Cons!6015 (h!6871 (_ BitVec 64)) (t!11161 List!6019)) )
))
(declare-fun arrayNoDuplicates!0 (array!22476 (_ BitVec 32) List!6019) Bool)

(assert (=> b!382693 (= res!217756 (arrayNoDuplicates!0 lt!179636 #b00000000000000000000000000000000 Nil!6016))))

(declare-fun res!217763 () Bool)

(assert (=> start!37500 (=> (not res!217763) (not e!232518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37500 (= res!217763 (validMask!0 mask!970))))

(assert (=> start!37500 e!232518))

(declare-fun array_inv!7926 (array!22478) Bool)

(assert (=> start!37500 (and (array_inv!7926 _values!506) e!232521)))

(assert (=> start!37500 tp!30639))

(assert (=> start!37500 true))

(declare-fun tp_is_empty!9289 () Bool)

(assert (=> start!37500 tp_is_empty!9289))

(declare-fun array_inv!7927 (array!22476) Bool)

(assert (=> start!37500 (array_inv!7927 _keys!658)))

(declare-fun b!382694 () Bool)

(assert (=> b!382694 (= e!232519 tp_is_empty!9289)))

(declare-fun b!382695 () Bool)

(declare-fun res!217762 () Bool)

(assert (=> b!382695 (=> (not res!217762) (not e!232518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382695 (= res!217762 (validKeyInArray!0 k0!778))))

(declare-fun b!382696 () Bool)

(declare-fun res!217758 () Bool)

(assert (=> b!382696 (=> (not res!217758) (not e!232518))))

(assert (=> b!382696 (= res!217758 (or (= (select (arr!10706 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10706 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15498 () Bool)

(declare-fun tp!30638 () Bool)

(declare-fun e!232522 () Bool)

(assert (=> mapNonEmpty!15498 (= mapRes!15498 (and tp!30638 e!232522))))

(declare-fun mapValue!15498 () ValueCell!4301)

(declare-fun mapRest!15498 () (Array (_ BitVec 32) ValueCell!4301))

(declare-fun mapKey!15498 () (_ BitVec 32))

(assert (=> mapNonEmpty!15498 (= (arr!10707 _values!506) (store mapRest!15498 mapKey!15498 mapValue!15498))))

(declare-fun b!382697 () Bool)

(declare-fun res!217759 () Bool)

(assert (=> b!382697 (=> (not res!217759) (not e!232518))))

(assert (=> b!382697 (= res!217759 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6016))))

(declare-fun b!382698 () Bool)

(assert (=> b!382698 (= e!232520 (not e!232523))))

(declare-fun res!217761 () Bool)

(assert (=> b!382698 (=> res!217761 e!232523)))

(declare-fun lt!179638 () Bool)

(assert (=> b!382698 (= res!217761 (or (and (not lt!179638) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179638) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179638)))))

(assert (=> b!382698 (= lt!179638 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!179641 () ListLongMap!5097)

(declare-fun zeroValue!472 () V!13491)

(declare-fun minValue!472 () V!13491)

(declare-fun getCurrentListMap!1999 (array!22476 array!22478 (_ BitVec 32) (_ BitVec 32) V!13491 V!13491 (_ BitVec 32) Int) ListLongMap!5097)

(assert (=> b!382698 (= lt!179641 (getCurrentListMap!1999 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179634 () array!22478)

(assert (=> b!382698 (= lt!179639 (getCurrentListMap!1999 lt!179636 lt!179634 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179640 () ListLongMap!5097)

(assert (=> b!382698 (and (= lt!179637 lt!179640) (= lt!179640 lt!179637))))

(declare-fun v!373 () V!13491)

(declare-fun lt!179635 () ListLongMap!5097)

(declare-fun +!957 (ListLongMap!5097 tuple2!6182) ListLongMap!5097)

(assert (=> b!382698 (= lt!179640 (+!957 lt!179635 (tuple2!6183 k0!778 v!373)))))

(declare-datatypes ((Unit!11793 0))(
  ( (Unit!11794) )
))
(declare-fun lt!179633 () Unit!11793)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!186 (array!22476 array!22478 (_ BitVec 32) (_ BitVec 32) V!13491 V!13491 (_ BitVec 32) (_ BitVec 64) V!13491 (_ BitVec 32) Int) Unit!11793)

(assert (=> b!382698 (= lt!179633 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!186 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!846 (array!22476 array!22478 (_ BitVec 32) (_ BitVec 32) V!13491 V!13491 (_ BitVec 32) Int) ListLongMap!5097)

(assert (=> b!382698 (= lt!179637 (getCurrentListMapNoExtraKeys!846 lt!179636 lt!179634 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382698 (= lt!179634 (array!22479 (store (arr!10707 _values!506) i!548 (ValueCellFull!4301 v!373)) (size!11059 _values!506)))))

(assert (=> b!382698 (= lt!179635 (getCurrentListMapNoExtraKeys!846 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382699 () Bool)

(assert (=> b!382699 (= e!232522 tp_is_empty!9289)))

(declare-fun b!382700 () Bool)

(declare-fun res!217757 () Bool)

(assert (=> b!382700 (=> (not res!217757) (not e!232518))))

(declare-fun arrayContainsKey!0 (array!22476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382700 (= res!217757 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382701 () Bool)

(declare-fun res!217760 () Bool)

(assert (=> b!382701 (=> (not res!217760) (not e!232518))))

(assert (=> b!382701 (= res!217760 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11058 _keys!658))))))

(declare-fun b!382702 () Bool)

(declare-fun res!217766 () Bool)

(assert (=> b!382702 (=> (not res!217766) (not e!232518))))

(assert (=> b!382702 (= res!217766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37500 res!217763) b!382692))

(assert (= (and b!382692 res!217764) b!382702))

(assert (= (and b!382702 res!217766) b!382697))

(assert (= (and b!382697 res!217759) b!382701))

(assert (= (and b!382701 res!217760) b!382695))

(assert (= (and b!382695 res!217762) b!382696))

(assert (= (and b!382696 res!217758) b!382700))

(assert (= (and b!382700 res!217757) b!382689))

(assert (= (and b!382689 res!217765) b!382693))

(assert (= (and b!382693 res!217756) b!382698))

(assert (= (and b!382698 (not res!217761)) b!382690))

(assert (= (and b!382691 condMapEmpty!15498) mapIsEmpty!15498))

(assert (= (and b!382691 (not condMapEmpty!15498)) mapNonEmpty!15498))

(get-info :version)

(assert (= (and mapNonEmpty!15498 ((_ is ValueCellFull!4301) mapValue!15498)) b!382699))

(assert (= (and b!382691 ((_ is ValueCellFull!4301) mapDefault!15498)) b!382694))

(assert (= start!37500 b!382691))

(declare-fun m!379763 () Bool)

(assert (=> b!382695 m!379763))

(declare-fun m!379765 () Bool)

(assert (=> b!382689 m!379765))

(declare-fun m!379767 () Bool)

(assert (=> b!382689 m!379767))

(declare-fun m!379769 () Bool)

(assert (=> b!382693 m!379769))

(declare-fun m!379771 () Bool)

(assert (=> mapNonEmpty!15498 m!379771))

(declare-fun m!379773 () Bool)

(assert (=> b!382697 m!379773))

(declare-fun m!379775 () Bool)

(assert (=> b!382698 m!379775))

(declare-fun m!379777 () Bool)

(assert (=> b!382698 m!379777))

(declare-fun m!379779 () Bool)

(assert (=> b!382698 m!379779))

(declare-fun m!379781 () Bool)

(assert (=> b!382698 m!379781))

(declare-fun m!379783 () Bool)

(assert (=> b!382698 m!379783))

(declare-fun m!379785 () Bool)

(assert (=> b!382698 m!379785))

(declare-fun m!379787 () Bool)

(assert (=> b!382698 m!379787))

(declare-fun m!379789 () Bool)

(assert (=> b!382702 m!379789))

(declare-fun m!379791 () Bool)

(assert (=> start!37500 m!379791))

(declare-fun m!379793 () Bool)

(assert (=> start!37500 m!379793))

(declare-fun m!379795 () Bool)

(assert (=> start!37500 m!379795))

(declare-fun m!379797 () Bool)

(assert (=> b!382696 m!379797))

(declare-fun m!379799 () Bool)

(assert (=> b!382700 m!379799))

(check-sat (not b!382702) (not b!382700) (not b!382695) (not b!382693) (not mapNonEmpty!15498) (not start!37500) (not b!382689) b_and!15897 (not b!382698) (not b!382697) (not b_next!8641) tp_is_empty!9289)
(check-sat b_and!15897 (not b_next!8641))
