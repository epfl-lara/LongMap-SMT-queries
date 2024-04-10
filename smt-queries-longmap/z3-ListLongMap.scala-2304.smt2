; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37288 () Bool)

(assert start!37288)

(declare-fun b_free!8415 () Bool)

(declare-fun b_next!8415 () Bool)

(assert (=> start!37288 (= b_free!8415 (not b_next!8415))))

(declare-fun tp!29960 () Bool)

(declare-fun b_and!15657 () Bool)

(assert (=> start!37288 (= tp!29960 b_and!15657)))

(declare-fun b!377781 () Bool)

(declare-fun e!229977 () Bool)

(declare-fun e!229976 () Bool)

(assert (=> b!377781 (= e!229977 (not e!229976))))

(declare-fun res!213824 () Bool)

(assert (=> b!377781 (=> res!213824 e!229976)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377781 (= res!213824 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13189 0))(
  ( (V!13190 (val!4576 Int)) )
))
(declare-datatypes ((ValueCell!4188 0))(
  ( (ValueCellFull!4188 (v!6773 V!13189)) (EmptyCell!4188) )
))
(declare-datatypes ((array!22053 0))(
  ( (array!22054 (arr!10495 (Array (_ BitVec 32) ValueCell!4188)) (size!10847 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22053)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6104 0))(
  ( (tuple2!6105 (_1!3063 (_ BitVec 64)) (_2!3063 V!13189)) )
))
(declare-datatypes ((List!5943 0))(
  ( (Nil!5940) (Cons!5939 (h!6795 tuple2!6104) (t!11093 List!5943)) )
))
(declare-datatypes ((ListLongMap!5017 0))(
  ( (ListLongMap!5018 (toList!2524 List!5943)) )
))
(declare-fun lt!175799 () ListLongMap!5017)

(declare-fun zeroValue!472 () V!13189)

(declare-datatypes ((array!22055 0))(
  ( (array!22056 (arr!10496 (Array (_ BitVec 32) (_ BitVec 64))) (size!10848 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22055)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13189)

(declare-fun getCurrentListMap!1953 (array!22055 array!22053 (_ BitVec 32) (_ BitVec 32) V!13189 V!13189 (_ BitVec 32) Int) ListLongMap!5017)

(assert (=> b!377781 (= lt!175799 (getCurrentListMap!1953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175792 () ListLongMap!5017)

(declare-fun lt!175795 () array!22055)

(declare-fun lt!175793 () array!22053)

(assert (=> b!377781 (= lt!175792 (getCurrentListMap!1953 lt!175795 lt!175793 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175800 () ListLongMap!5017)

(declare-fun lt!175791 () ListLongMap!5017)

(assert (=> b!377781 (and (= lt!175800 lt!175791) (= lt!175791 lt!175800))))

(declare-fun lt!175802 () ListLongMap!5017)

(declare-fun lt!175803 () tuple2!6104)

(declare-fun +!870 (ListLongMap!5017 tuple2!6104) ListLongMap!5017)

(assert (=> b!377781 (= lt!175791 (+!870 lt!175802 lt!175803))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13189)

(assert (=> b!377781 (= lt!175803 (tuple2!6105 k0!778 v!373))))

(declare-datatypes ((Unit!11642 0))(
  ( (Unit!11643) )
))
(declare-fun lt!175794 () Unit!11642)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!111 (array!22055 array!22053 (_ BitVec 32) (_ BitVec 32) V!13189 V!13189 (_ BitVec 32) (_ BitVec 64) V!13189 (_ BitVec 32) Int) Unit!11642)

(assert (=> b!377781 (= lt!175794 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!111 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!787 (array!22055 array!22053 (_ BitVec 32) (_ BitVec 32) V!13189 V!13189 (_ BitVec 32) Int) ListLongMap!5017)

(assert (=> b!377781 (= lt!175800 (getCurrentListMapNoExtraKeys!787 lt!175795 lt!175793 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377781 (= lt!175793 (array!22054 (store (arr!10495 _values!506) i!548 (ValueCellFull!4188 v!373)) (size!10847 _values!506)))))

(assert (=> b!377781 (= lt!175802 (getCurrentListMapNoExtraKeys!787 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377782 () Bool)

(declare-fun e!229981 () Bool)

(assert (=> b!377782 (= e!229981 true)))

(declare-fun lt!175801 () ListLongMap!5017)

(declare-fun lt!175798 () ListLongMap!5017)

(assert (=> b!377782 (= lt!175801 (+!870 lt!175798 lt!175803))))

(declare-fun lt!175797 () Unit!11642)

(declare-fun addCommutativeForDiffKeys!278 (ListLongMap!5017 (_ BitVec 64) V!13189 (_ BitVec 64) V!13189) Unit!11642)

(assert (=> b!377782 (= lt!175797 (addCommutativeForDiffKeys!278 lt!175802 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377783 () Bool)

(declare-fun res!213828 () Bool)

(declare-fun e!229980 () Bool)

(assert (=> b!377783 (=> (not res!213828) (not e!229980))))

(declare-fun arrayContainsKey!0 (array!22055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377783 (= res!213828 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377784 () Bool)

(declare-fun res!213822 () Bool)

(assert (=> b!377784 (=> (not res!213822) (not e!229980))))

(declare-datatypes ((List!5944 0))(
  ( (Nil!5941) (Cons!5940 (h!6796 (_ BitVec 64)) (t!11094 List!5944)) )
))
(declare-fun arrayNoDuplicates!0 (array!22055 (_ BitVec 32) List!5944) Bool)

(assert (=> b!377784 (= res!213822 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5941))))

(declare-fun mapNonEmpty!15159 () Bool)

(declare-fun mapRes!15159 () Bool)

(declare-fun tp!29961 () Bool)

(declare-fun e!229979 () Bool)

(assert (=> mapNonEmpty!15159 (= mapRes!15159 (and tp!29961 e!229979))))

(declare-fun mapKey!15159 () (_ BitVec 32))

(declare-fun mapValue!15159 () ValueCell!4188)

(declare-fun mapRest!15159 () (Array (_ BitVec 32) ValueCell!4188))

(assert (=> mapNonEmpty!15159 (= (arr!10495 _values!506) (store mapRest!15159 mapKey!15159 mapValue!15159))))

(declare-fun b!377785 () Bool)

(declare-fun e!229975 () Bool)

(declare-fun e!229982 () Bool)

(assert (=> b!377785 (= e!229975 (and e!229982 mapRes!15159))))

(declare-fun condMapEmpty!15159 () Bool)

(declare-fun mapDefault!15159 () ValueCell!4188)

(assert (=> b!377785 (= condMapEmpty!15159 (= (arr!10495 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4188)) mapDefault!15159)))))

(declare-fun b!377786 () Bool)

(declare-fun tp_is_empty!9063 () Bool)

(assert (=> b!377786 (= e!229979 tp_is_empty!9063)))

(declare-fun b!377787 () Bool)

(declare-fun res!213829 () Bool)

(assert (=> b!377787 (=> (not res!213829) (not e!229980))))

(assert (=> b!377787 (= res!213829 (and (= (size!10847 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10848 _keys!658) (size!10847 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377788 () Bool)

(assert (=> b!377788 (= e!229982 tp_is_empty!9063)))

(declare-fun b!377789 () Bool)

(declare-fun res!213826 () Bool)

(assert (=> b!377789 (=> (not res!213826) (not e!229980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22055 (_ BitVec 32)) Bool)

(assert (=> b!377789 (= res!213826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377791 () Bool)

(declare-fun res!213825 () Bool)

(assert (=> b!377791 (=> (not res!213825) (not e!229977))))

(assert (=> b!377791 (= res!213825 (arrayNoDuplicates!0 lt!175795 #b00000000000000000000000000000000 Nil!5941))))

(declare-fun b!377792 () Bool)

(declare-fun res!213819 () Bool)

(assert (=> b!377792 (=> (not res!213819) (not e!229980))))

(assert (=> b!377792 (= res!213819 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10848 _keys!658))))))

(declare-fun mapIsEmpty!15159 () Bool)

(assert (=> mapIsEmpty!15159 mapRes!15159))

(declare-fun b!377793 () Bool)

(assert (=> b!377793 (= e!229980 e!229977)))

(declare-fun res!213830 () Bool)

(assert (=> b!377793 (=> (not res!213830) (not e!229977))))

(assert (=> b!377793 (= res!213830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175795 mask!970))))

(assert (=> b!377793 (= lt!175795 (array!22056 (store (arr!10496 _keys!658) i!548 k0!778) (size!10848 _keys!658)))))

(declare-fun b!377794 () Bool)

(assert (=> b!377794 (= e!229976 e!229981)))

(declare-fun res!213823 () Bool)

(assert (=> b!377794 (=> res!213823 e!229981)))

(assert (=> b!377794 (= res!213823 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!377794 (= lt!175792 lt!175801)))

(declare-fun lt!175796 () tuple2!6104)

(assert (=> b!377794 (= lt!175801 (+!870 lt!175791 lt!175796))))

(assert (=> b!377794 (= lt!175799 lt!175798)))

(assert (=> b!377794 (= lt!175798 (+!870 lt!175802 lt!175796))))

(assert (=> b!377794 (= lt!175792 (+!870 lt!175800 lt!175796))))

(assert (=> b!377794 (= lt!175796 (tuple2!6105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377795 () Bool)

(declare-fun res!213821 () Bool)

(assert (=> b!377795 (=> (not res!213821) (not e!229980))))

(assert (=> b!377795 (= res!213821 (or (= (select (arr!10496 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10496 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!213827 () Bool)

(assert (=> start!37288 (=> (not res!213827) (not e!229980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37288 (= res!213827 (validMask!0 mask!970))))

(assert (=> start!37288 e!229980))

(declare-fun array_inv!7732 (array!22053) Bool)

(assert (=> start!37288 (and (array_inv!7732 _values!506) e!229975)))

(assert (=> start!37288 tp!29960))

(assert (=> start!37288 true))

(assert (=> start!37288 tp_is_empty!9063))

(declare-fun array_inv!7733 (array!22055) Bool)

(assert (=> start!37288 (array_inv!7733 _keys!658)))

(declare-fun b!377790 () Bool)

(declare-fun res!213820 () Bool)

(assert (=> b!377790 (=> (not res!213820) (not e!229980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377790 (= res!213820 (validKeyInArray!0 k0!778))))

(assert (= (and start!37288 res!213827) b!377787))

(assert (= (and b!377787 res!213829) b!377789))

(assert (= (and b!377789 res!213826) b!377784))

(assert (= (and b!377784 res!213822) b!377792))

(assert (= (and b!377792 res!213819) b!377790))

(assert (= (and b!377790 res!213820) b!377795))

(assert (= (and b!377795 res!213821) b!377783))

(assert (= (and b!377783 res!213828) b!377793))

(assert (= (and b!377793 res!213830) b!377791))

(assert (= (and b!377791 res!213825) b!377781))

(assert (= (and b!377781 (not res!213824)) b!377794))

(assert (= (and b!377794 (not res!213823)) b!377782))

(assert (= (and b!377785 condMapEmpty!15159) mapIsEmpty!15159))

(assert (= (and b!377785 (not condMapEmpty!15159)) mapNonEmpty!15159))

(get-info :version)

(assert (= (and mapNonEmpty!15159 ((_ is ValueCellFull!4188) mapValue!15159)) b!377786))

(assert (= (and b!377785 ((_ is ValueCellFull!4188) mapDefault!15159)) b!377788))

(assert (= start!37288 b!377785))

(declare-fun m!374571 () Bool)

(assert (=> start!37288 m!374571))

(declare-fun m!374573 () Bool)

(assert (=> start!37288 m!374573))

(declare-fun m!374575 () Bool)

(assert (=> start!37288 m!374575))

(declare-fun m!374577 () Bool)

(assert (=> b!377795 m!374577))

(declare-fun m!374579 () Bool)

(assert (=> mapNonEmpty!15159 m!374579))

(declare-fun m!374581 () Bool)

(assert (=> b!377789 m!374581))

(declare-fun m!374583 () Bool)

(assert (=> b!377790 m!374583))

(declare-fun m!374585 () Bool)

(assert (=> b!377784 m!374585))

(declare-fun m!374587 () Bool)

(assert (=> b!377794 m!374587))

(declare-fun m!374589 () Bool)

(assert (=> b!377794 m!374589))

(declare-fun m!374591 () Bool)

(assert (=> b!377794 m!374591))

(declare-fun m!374593 () Bool)

(assert (=> b!377791 m!374593))

(declare-fun m!374595 () Bool)

(assert (=> b!377793 m!374595))

(declare-fun m!374597 () Bool)

(assert (=> b!377793 m!374597))

(declare-fun m!374599 () Bool)

(assert (=> b!377782 m!374599))

(declare-fun m!374601 () Bool)

(assert (=> b!377782 m!374601))

(declare-fun m!374603 () Bool)

(assert (=> b!377783 m!374603))

(declare-fun m!374605 () Bool)

(assert (=> b!377781 m!374605))

(declare-fun m!374607 () Bool)

(assert (=> b!377781 m!374607))

(declare-fun m!374609 () Bool)

(assert (=> b!377781 m!374609))

(declare-fun m!374611 () Bool)

(assert (=> b!377781 m!374611))

(declare-fun m!374613 () Bool)

(assert (=> b!377781 m!374613))

(declare-fun m!374615 () Bool)

(assert (=> b!377781 m!374615))

(declare-fun m!374617 () Bool)

(assert (=> b!377781 m!374617))

(check-sat (not b!377784) b_and!15657 (not b!377791) tp_is_empty!9063 (not mapNonEmpty!15159) (not b!377782) (not b!377793) (not b_next!8415) (not b!377781) (not b!377794) (not b!377789) (not b!377783) (not start!37288) (not b!377790))
(check-sat b_and!15657 (not b_next!8415))
