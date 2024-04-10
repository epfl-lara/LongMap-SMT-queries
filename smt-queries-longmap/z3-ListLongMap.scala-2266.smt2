; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37060 () Bool)

(assert start!37060)

(declare-fun b_free!8187 () Bool)

(declare-fun b_next!8187 () Bool)

(assert (=> start!37060 (= b_free!8187 (not b_next!8187))))

(declare-fun tp!29276 () Bool)

(declare-fun b_and!15429 () Bool)

(assert (=> start!37060 (= tp!29276 b_and!15429)))

(declare-fun b!372686 () Bool)

(declare-fun res!209752 () Bool)

(declare-fun e!227295 () Bool)

(assert (=> b!372686 (=> (not res!209752) (not e!227295))))

(declare-datatypes ((array!21611 0))(
  ( (array!21612 (arr!10274 (Array (_ BitVec 32) (_ BitVec 64))) (size!10626 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21611)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21611 (_ BitVec 32)) Bool)

(assert (=> b!372686 (= res!209752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372687 () Bool)

(declare-fun res!209759 () Bool)

(assert (=> b!372687 (=> (not res!209759) (not e!227295))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372687 (= res!209759 (or (= (select (arr!10274 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10274 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372688 () Bool)

(declare-fun e!227294 () Bool)

(declare-fun e!227296 () Bool)

(declare-fun mapRes!14817 () Bool)

(assert (=> b!372688 (= e!227294 (and e!227296 mapRes!14817))))

(declare-fun condMapEmpty!14817 () Bool)

(declare-datatypes ((V!12885 0))(
  ( (V!12886 (val!4462 Int)) )
))
(declare-datatypes ((ValueCell!4074 0))(
  ( (ValueCellFull!4074 (v!6659 V!12885)) (EmptyCell!4074) )
))
(declare-datatypes ((array!21613 0))(
  ( (array!21614 (arr!10275 (Array (_ BitVec 32) ValueCell!4074)) (size!10627 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21613)

(declare-fun mapDefault!14817 () ValueCell!4074)

(assert (=> b!372688 (= condMapEmpty!14817 (= (arr!10275 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4074)) mapDefault!14817)))))

(declare-fun b!372689 () Bool)

(declare-fun e!227292 () Bool)

(assert (=> b!372689 (= e!227295 e!227292)))

(declare-fun res!209754 () Bool)

(assert (=> b!372689 (=> (not res!209754) (not e!227292))))

(declare-fun lt!170889 () array!21611)

(assert (=> b!372689 (= res!209754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170889 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!372689 (= lt!170889 (array!21612 (store (arr!10274 _keys!658) i!548 k0!778) (size!10626 _keys!658)))))

(declare-fun b!372690 () Bool)

(declare-fun res!209756 () Bool)

(assert (=> b!372690 (=> (not res!209756) (not e!227295))))

(declare-fun arrayContainsKey!0 (array!21611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372690 (= res!209756 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372691 () Bool)

(declare-fun e!227293 () Bool)

(declare-fun tp_is_empty!8835 () Bool)

(assert (=> b!372691 (= e!227293 tp_is_empty!8835)))

(declare-fun b!372692 () Bool)

(declare-fun res!209750 () Bool)

(assert (=> b!372692 (=> (not res!209750) (not e!227295))))

(assert (=> b!372692 (= res!209750 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10626 _keys!658))))))

(declare-fun mapIsEmpty!14817 () Bool)

(assert (=> mapIsEmpty!14817 mapRes!14817))

(declare-fun mapNonEmpty!14817 () Bool)

(declare-fun tp!29277 () Bool)

(assert (=> mapNonEmpty!14817 (= mapRes!14817 (and tp!29277 e!227293))))

(declare-fun mapKey!14817 () (_ BitVec 32))

(declare-fun mapRest!14817 () (Array (_ BitVec 32) ValueCell!4074))

(declare-fun mapValue!14817 () ValueCell!4074)

(assert (=> mapNonEmpty!14817 (= (arr!10275 _values!506) (store mapRest!14817 mapKey!14817 mapValue!14817))))

(declare-fun b!372694 () Bool)

(declare-fun res!209758 () Bool)

(assert (=> b!372694 (=> (not res!209758) (not e!227295))))

(declare-datatypes ((List!5760 0))(
  ( (Nil!5757) (Cons!5756 (h!6612 (_ BitVec 64)) (t!10910 List!5760)) )
))
(declare-fun arrayNoDuplicates!0 (array!21611 (_ BitVec 32) List!5760) Bool)

(assert (=> b!372694 (= res!209758 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5757))))

(declare-fun b!372695 () Bool)

(assert (=> b!372695 (= e!227296 tp_is_empty!8835)))

(declare-fun b!372696 () Bool)

(declare-fun res!209751 () Bool)

(assert (=> b!372696 (=> (not res!209751) (not e!227295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372696 (= res!209751 (validKeyInArray!0 k0!778))))

(declare-fun b!372697 () Bool)

(declare-fun res!209757 () Bool)

(assert (=> b!372697 (=> (not res!209757) (not e!227292))))

(assert (=> b!372697 (= res!209757 (arrayNoDuplicates!0 lt!170889 #b00000000000000000000000000000000 Nil!5757))))

(declare-fun b!372698 () Bool)

(declare-fun res!209753 () Bool)

(assert (=> b!372698 (=> (not res!209753) (not e!227295))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!372698 (= res!209753 (and (= (size!10627 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10626 _keys!658) (size!10627 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!209755 () Bool)

(assert (=> start!37060 (=> (not res!209755) (not e!227295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37060 (= res!209755 (validMask!0 mask!970))))

(assert (=> start!37060 e!227295))

(declare-fun array_inv!7574 (array!21613) Bool)

(assert (=> start!37060 (and (array_inv!7574 _values!506) e!227294)))

(assert (=> start!37060 tp!29276))

(assert (=> start!37060 true))

(assert (=> start!37060 tp_is_empty!8835))

(declare-fun array_inv!7575 (array!21611) Bool)

(assert (=> start!37060 (array_inv!7575 _keys!658)))

(declare-fun b!372693 () Bool)

(assert (=> b!372693 (= e!227292 (not true))))

(declare-datatypes ((tuple2!5914 0))(
  ( (tuple2!5915 (_1!2968 (_ BitVec 64)) (_2!2968 V!12885)) )
))
(declare-datatypes ((List!5761 0))(
  ( (Nil!5758) (Cons!5757 (h!6613 tuple2!5914) (t!10911 List!5761)) )
))
(declare-datatypes ((ListLongMap!4827 0))(
  ( (ListLongMap!4828 (toList!2429 List!5761)) )
))
(declare-fun lt!170886 () ListLongMap!4827)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!170887 () array!21613)

(declare-fun zeroValue!472 () V!12885)

(declare-fun minValue!472 () V!12885)

(declare-fun getCurrentListMap!1872 (array!21611 array!21613 (_ BitVec 32) (_ BitVec 32) V!12885 V!12885 (_ BitVec 32) Int) ListLongMap!4827)

(assert (=> b!372693 (= lt!170886 (getCurrentListMap!1872 lt!170889 lt!170887 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170884 () ListLongMap!4827)

(declare-fun lt!170888 () ListLongMap!4827)

(assert (=> b!372693 (and (= lt!170884 lt!170888) (= lt!170888 lt!170884))))

(declare-fun lt!170885 () ListLongMap!4827)

(declare-fun v!373 () V!12885)

(declare-fun +!775 (ListLongMap!4827 tuple2!5914) ListLongMap!4827)

(assert (=> b!372693 (= lt!170888 (+!775 lt!170885 (tuple2!5915 k0!778 v!373)))))

(declare-datatypes ((Unit!11456 0))(
  ( (Unit!11457) )
))
(declare-fun lt!170883 () Unit!11456)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!30 (array!21611 array!21613 (_ BitVec 32) (_ BitVec 32) V!12885 V!12885 (_ BitVec 32) (_ BitVec 64) V!12885 (_ BitVec 32) Int) Unit!11456)

(assert (=> b!372693 (= lt!170883 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!30 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!706 (array!21611 array!21613 (_ BitVec 32) (_ BitVec 32) V!12885 V!12885 (_ BitVec 32) Int) ListLongMap!4827)

(assert (=> b!372693 (= lt!170884 (getCurrentListMapNoExtraKeys!706 lt!170889 lt!170887 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372693 (= lt!170887 (array!21614 (store (arr!10275 _values!506) i!548 (ValueCellFull!4074 v!373)) (size!10627 _values!506)))))

(assert (=> b!372693 (= lt!170885 (getCurrentListMapNoExtraKeys!706 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37060 res!209755) b!372698))

(assert (= (and b!372698 res!209753) b!372686))

(assert (= (and b!372686 res!209752) b!372694))

(assert (= (and b!372694 res!209758) b!372692))

(assert (= (and b!372692 res!209750) b!372696))

(assert (= (and b!372696 res!209751) b!372687))

(assert (= (and b!372687 res!209759) b!372690))

(assert (= (and b!372690 res!209756) b!372689))

(assert (= (and b!372689 res!209754) b!372697))

(assert (= (and b!372697 res!209757) b!372693))

(assert (= (and b!372688 condMapEmpty!14817) mapIsEmpty!14817))

(assert (= (and b!372688 (not condMapEmpty!14817)) mapNonEmpty!14817))

(get-info :version)

(assert (= (and mapNonEmpty!14817 ((_ is ValueCellFull!4074) mapValue!14817)) b!372691))

(assert (= (and b!372688 ((_ is ValueCellFull!4074) mapDefault!14817)) b!372695))

(assert (= start!37060 b!372688))

(declare-fun m!368535 () Bool)

(assert (=> start!37060 m!368535))

(declare-fun m!368537 () Bool)

(assert (=> start!37060 m!368537))

(declare-fun m!368539 () Bool)

(assert (=> start!37060 m!368539))

(declare-fun m!368541 () Bool)

(assert (=> b!372693 m!368541))

(declare-fun m!368543 () Bool)

(assert (=> b!372693 m!368543))

(declare-fun m!368545 () Bool)

(assert (=> b!372693 m!368545))

(declare-fun m!368547 () Bool)

(assert (=> b!372693 m!368547))

(declare-fun m!368549 () Bool)

(assert (=> b!372693 m!368549))

(declare-fun m!368551 () Bool)

(assert (=> b!372693 m!368551))

(declare-fun m!368553 () Bool)

(assert (=> b!372686 m!368553))

(declare-fun m!368555 () Bool)

(assert (=> mapNonEmpty!14817 m!368555))

(declare-fun m!368557 () Bool)

(assert (=> b!372697 m!368557))

(declare-fun m!368559 () Bool)

(assert (=> b!372690 m!368559))

(declare-fun m!368561 () Bool)

(assert (=> b!372689 m!368561))

(declare-fun m!368563 () Bool)

(assert (=> b!372689 m!368563))

(declare-fun m!368565 () Bool)

(assert (=> b!372696 m!368565))

(declare-fun m!368567 () Bool)

(assert (=> b!372694 m!368567))

(declare-fun m!368569 () Bool)

(assert (=> b!372687 m!368569))

(check-sat (not b!372693) (not b!372694) (not b!372697) b_and!15429 (not mapNonEmpty!14817) (not start!37060) tp_is_empty!8835 (not b!372686) (not b_next!8187) (not b!372690) (not b!372696) (not b!372689))
(check-sat b_and!15429 (not b_next!8187))
