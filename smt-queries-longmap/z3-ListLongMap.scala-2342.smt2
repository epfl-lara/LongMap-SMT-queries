; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37516 () Bool)

(assert start!37516)

(declare-fun b_free!8643 () Bool)

(declare-fun b_next!8643 () Bool)

(assert (=> start!37516 (= b_free!8643 (not b_next!8643))))

(declare-fun tp!30644 () Bool)

(declare-fun b_and!15885 () Bool)

(assert (=> start!37516 (= tp!30644 b_and!15885)))

(declare-fun b!382780 () Bool)

(declare-fun res!217799 () Bool)

(declare-fun e!232575 () Bool)

(assert (=> b!382780 (=> (not res!217799) (not e!232575))))

(declare-datatypes ((array!22491 0))(
  ( (array!22492 (arr!10714 (Array (_ BitVec 32) (_ BitVec 64))) (size!11066 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22491)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382780 (= res!217799 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382781 () Bool)

(declare-fun res!217800 () Bool)

(assert (=> b!382781 (=> (not res!217800) (not e!232575))))

(declare-datatypes ((List!6140 0))(
  ( (Nil!6137) (Cons!6136 (h!6992 (_ BitVec 64)) (t!11290 List!6140)) )
))
(declare-fun arrayNoDuplicates!0 (array!22491 (_ BitVec 32) List!6140) Bool)

(assert (=> b!382781 (= res!217800 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6137))))

(declare-fun res!217797 () Bool)

(assert (=> start!37516 (=> (not res!217797) (not e!232575))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37516 (= res!217797 (validMask!0 mask!970))))

(assert (=> start!37516 e!232575))

(declare-datatypes ((V!13493 0))(
  ( (V!13494 (val!4690 Int)) )
))
(declare-datatypes ((ValueCell!4302 0))(
  ( (ValueCellFull!4302 (v!6887 V!13493)) (EmptyCell!4302) )
))
(declare-datatypes ((array!22493 0))(
  ( (array!22494 (arr!10715 (Array (_ BitVec 32) ValueCell!4302)) (size!11067 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22493)

(declare-fun e!232576 () Bool)

(declare-fun array_inv!7888 (array!22493) Bool)

(assert (=> start!37516 (and (array_inv!7888 _values!506) e!232576)))

(assert (=> start!37516 tp!30644))

(assert (=> start!37516 true))

(declare-fun tp_is_empty!9291 () Bool)

(assert (=> start!37516 tp_is_empty!9291))

(declare-fun array_inv!7889 (array!22491) Bool)

(assert (=> start!37516 (array_inv!7889 _keys!658)))

(declare-fun b!382782 () Bool)

(declare-fun res!217801 () Bool)

(assert (=> b!382782 (=> (not res!217801) (not e!232575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382782 (= res!217801 (validKeyInArray!0 k0!778))))

(declare-fun b!382783 () Bool)

(declare-fun res!217798 () Bool)

(assert (=> b!382783 (=> (not res!217798) (not e!232575))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382783 (= res!217798 (and (= (size!11067 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11066 _keys!658) (size!11067 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382784 () Bool)

(declare-fun e!232574 () Bool)

(declare-fun e!232577 () Bool)

(assert (=> b!382784 (= e!232574 (not e!232577))))

(declare-fun res!217793 () Bool)

(assert (=> b!382784 (=> res!217793 e!232577)))

(declare-fun lt!179643 () Bool)

(assert (=> b!382784 (= res!217793 (or (and (not lt!179643) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179643) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179643)))))

(assert (=> b!382784 (= lt!179643 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6308 0))(
  ( (tuple2!6309 (_1!3165 (_ BitVec 64)) (_2!3165 V!13493)) )
))
(declare-datatypes ((List!6141 0))(
  ( (Nil!6138) (Cons!6137 (h!6993 tuple2!6308) (t!11291 List!6141)) )
))
(declare-datatypes ((ListLongMap!5221 0))(
  ( (ListLongMap!5222 (toList!2626 List!6141)) )
))
(declare-fun lt!179642 () ListLongMap!5221)

(declare-fun zeroValue!472 () V!13493)

(declare-fun minValue!472 () V!13493)

(declare-fun getCurrentListMap!2031 (array!22491 array!22493 (_ BitVec 32) (_ BitVec 32) V!13493 V!13493 (_ BitVec 32) Int) ListLongMap!5221)

(assert (=> b!382784 (= lt!179642 (getCurrentListMap!2031 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179645 () array!22493)

(declare-fun lt!179646 () ListLongMap!5221)

(declare-fun lt!179644 () array!22491)

(assert (=> b!382784 (= lt!179646 (getCurrentListMap!2031 lt!179644 lt!179645 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179648 () ListLongMap!5221)

(declare-fun lt!179641 () ListLongMap!5221)

(assert (=> b!382784 (and (= lt!179648 lt!179641) (= lt!179641 lt!179648))))

(declare-fun v!373 () V!13493)

(declare-fun lt!179647 () ListLongMap!5221)

(declare-fun +!961 (ListLongMap!5221 tuple2!6308) ListLongMap!5221)

(assert (=> b!382784 (= lt!179641 (+!961 lt!179647 (tuple2!6309 k0!778 v!373)))))

(declare-datatypes ((Unit!11816 0))(
  ( (Unit!11817) )
))
(declare-fun lt!179649 () Unit!11816)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!189 (array!22491 array!22493 (_ BitVec 32) (_ BitVec 32) V!13493 V!13493 (_ BitVec 32) (_ BitVec 64) V!13493 (_ BitVec 32) Int) Unit!11816)

(assert (=> b!382784 (= lt!179649 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!189 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!865 (array!22491 array!22493 (_ BitVec 32) (_ BitVec 32) V!13493 V!13493 (_ BitVec 32) Int) ListLongMap!5221)

(assert (=> b!382784 (= lt!179648 (getCurrentListMapNoExtraKeys!865 lt!179644 lt!179645 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382784 (= lt!179645 (array!22494 (store (arr!10715 _values!506) i!548 (ValueCellFull!4302 v!373)) (size!11067 _values!506)))))

(assert (=> b!382784 (= lt!179647 (getCurrentListMapNoExtraKeys!865 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382785 () Bool)

(declare-fun res!217795 () Bool)

(assert (=> b!382785 (=> (not res!217795) (not e!232575))))

(assert (=> b!382785 (= res!217795 (or (= (select (arr!10714 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10714 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382786 () Bool)

(assert (=> b!382786 (= e!232577 true)))

(assert (=> b!382786 (= lt!179646 lt!179648)))

(declare-fun mapNonEmpty!15501 () Bool)

(declare-fun mapRes!15501 () Bool)

(declare-fun tp!30645 () Bool)

(declare-fun e!232572 () Bool)

(assert (=> mapNonEmpty!15501 (= mapRes!15501 (and tp!30645 e!232572))))

(declare-fun mapValue!15501 () ValueCell!4302)

(declare-fun mapKey!15501 () (_ BitVec 32))

(declare-fun mapRest!15501 () (Array (_ BitVec 32) ValueCell!4302))

(assert (=> mapNonEmpty!15501 (= (arr!10715 _values!506) (store mapRest!15501 mapKey!15501 mapValue!15501))))

(declare-fun mapIsEmpty!15501 () Bool)

(assert (=> mapIsEmpty!15501 mapRes!15501))

(declare-fun b!382787 () Bool)

(assert (=> b!382787 (= e!232572 tp_is_empty!9291)))

(declare-fun b!382788 () Bool)

(declare-fun res!217796 () Bool)

(assert (=> b!382788 (=> (not res!217796) (not e!232575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22491 (_ BitVec 32)) Bool)

(assert (=> b!382788 (= res!217796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382789 () Bool)

(assert (=> b!382789 (= e!232575 e!232574)))

(declare-fun res!217794 () Bool)

(assert (=> b!382789 (=> (not res!217794) (not e!232574))))

(assert (=> b!382789 (= res!217794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179644 mask!970))))

(assert (=> b!382789 (= lt!179644 (array!22492 (store (arr!10714 _keys!658) i!548 k0!778) (size!11066 _keys!658)))))

(declare-fun b!382790 () Bool)

(declare-fun res!217792 () Bool)

(assert (=> b!382790 (=> (not res!217792) (not e!232574))))

(assert (=> b!382790 (= res!217792 (arrayNoDuplicates!0 lt!179644 #b00000000000000000000000000000000 Nil!6137))))

(declare-fun b!382791 () Bool)

(declare-fun e!232573 () Bool)

(assert (=> b!382791 (= e!232573 tp_is_empty!9291)))

(declare-fun b!382792 () Bool)

(assert (=> b!382792 (= e!232576 (and e!232573 mapRes!15501))))

(declare-fun condMapEmpty!15501 () Bool)

(declare-fun mapDefault!15501 () ValueCell!4302)

(assert (=> b!382792 (= condMapEmpty!15501 (= (arr!10715 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4302)) mapDefault!15501)))))

(declare-fun b!382793 () Bool)

(declare-fun res!217802 () Bool)

(assert (=> b!382793 (=> (not res!217802) (not e!232575))))

(assert (=> b!382793 (= res!217802 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11066 _keys!658))))))

(assert (= (and start!37516 res!217797) b!382783))

(assert (= (and b!382783 res!217798) b!382788))

(assert (= (and b!382788 res!217796) b!382781))

(assert (= (and b!382781 res!217800) b!382793))

(assert (= (and b!382793 res!217802) b!382782))

(assert (= (and b!382782 res!217801) b!382785))

(assert (= (and b!382785 res!217795) b!382780))

(assert (= (and b!382780 res!217799) b!382789))

(assert (= (and b!382789 res!217794) b!382790))

(assert (= (and b!382790 res!217792) b!382784))

(assert (= (and b!382784 (not res!217793)) b!382786))

(assert (= (and b!382792 condMapEmpty!15501) mapIsEmpty!15501))

(assert (= (and b!382792 (not condMapEmpty!15501)) mapNonEmpty!15501))

(get-info :version)

(assert (= (and mapNonEmpty!15501 ((_ is ValueCellFull!4302) mapValue!15501)) b!382787))

(assert (= (and b!382792 ((_ is ValueCellFull!4302) mapDefault!15501)) b!382791))

(assert (= start!37516 b!382792))

(declare-fun m!379571 () Bool)

(assert (=> b!382790 m!379571))

(declare-fun m!379573 () Bool)

(assert (=> b!382785 m!379573))

(declare-fun m!379575 () Bool)

(assert (=> b!382784 m!379575))

(declare-fun m!379577 () Bool)

(assert (=> b!382784 m!379577))

(declare-fun m!379579 () Bool)

(assert (=> b!382784 m!379579))

(declare-fun m!379581 () Bool)

(assert (=> b!382784 m!379581))

(declare-fun m!379583 () Bool)

(assert (=> b!382784 m!379583))

(declare-fun m!379585 () Bool)

(assert (=> b!382784 m!379585))

(declare-fun m!379587 () Bool)

(assert (=> b!382784 m!379587))

(declare-fun m!379589 () Bool)

(assert (=> start!37516 m!379589))

(declare-fun m!379591 () Bool)

(assert (=> start!37516 m!379591))

(declare-fun m!379593 () Bool)

(assert (=> start!37516 m!379593))

(declare-fun m!379595 () Bool)

(assert (=> b!382780 m!379595))

(declare-fun m!379597 () Bool)

(assert (=> b!382789 m!379597))

(declare-fun m!379599 () Bool)

(assert (=> b!382789 m!379599))

(declare-fun m!379601 () Bool)

(assert (=> mapNonEmpty!15501 m!379601))

(declare-fun m!379603 () Bool)

(assert (=> b!382782 m!379603))

(declare-fun m!379605 () Bool)

(assert (=> b!382788 m!379605))

(declare-fun m!379607 () Bool)

(assert (=> b!382781 m!379607))

(check-sat (not b!382789) (not start!37516) (not b!382782) (not b!382781) (not b!382784) (not b_next!8643) (not mapNonEmpty!15501) tp_is_empty!9291 (not b!382780) b_and!15885 (not b!382788) (not b!382790))
(check-sat b_and!15885 (not b_next!8643))
