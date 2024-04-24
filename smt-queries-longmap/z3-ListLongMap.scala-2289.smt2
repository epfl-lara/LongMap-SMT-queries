; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37182 () Bool)

(assert start!37182)

(declare-fun b_free!8323 () Bool)

(declare-fun b_next!8323 () Bool)

(assert (=> start!37182 (= b_free!8323 (not b_next!8323))))

(declare-fun tp!29685 () Bool)

(declare-fun b_and!15579 () Bool)

(assert (=> start!37182 (= tp!29685 b_and!15579)))

(declare-datatypes ((V!13067 0))(
  ( (V!13068 (val!4530 Int)) )
))
(declare-datatypes ((tuple2!5934 0))(
  ( (tuple2!5935 (_1!2978 (_ BitVec 64)) (_2!2978 V!13067)) )
))
(declare-datatypes ((List!5778 0))(
  ( (Nil!5775) (Cons!5774 (h!6630 tuple2!5934) (t!10920 List!5778)) )
))
(declare-datatypes ((ListLongMap!4849 0))(
  ( (ListLongMap!4850 (toList!2440 List!5778)) )
))
(declare-fun lt!174049 () ListLongMap!4849)

(declare-fun e!228845 () Bool)

(declare-fun b!375655 () Bool)

(declare-fun lt!174050 () tuple2!5934)

(declare-fun lt!174046 () ListLongMap!4849)

(declare-fun +!836 (ListLongMap!4849 tuple2!5934) ListLongMap!4849)

(assert (=> b!375655 (= e!228845 (= lt!174046 (+!836 lt!174049 lt!174050)))))

(declare-fun mapIsEmpty!15021 () Bool)

(declare-fun mapRes!15021 () Bool)

(assert (=> mapIsEmpty!15021 mapRes!15021))

(declare-fun b!375656 () Bool)

(declare-fun res!212163 () Bool)

(declare-fun e!228843 () Bool)

(assert (=> b!375656 (=> (not res!212163) (not e!228843))))

(declare-datatypes ((array!21860 0))(
  ( (array!21861 (arr!10398 (Array (_ BitVec 32) (_ BitVec 64))) (size!10750 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21860)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375656 (= res!212163 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!212155 () Bool)

(assert (=> start!37182 (=> (not res!212155) (not e!228843))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37182 (= res!212155 (validMask!0 mask!970))))

(assert (=> start!37182 e!228843))

(declare-datatypes ((ValueCell!4142 0))(
  ( (ValueCellFull!4142 (v!6728 V!13067)) (EmptyCell!4142) )
))
(declare-datatypes ((array!21862 0))(
  ( (array!21863 (arr!10399 (Array (_ BitVec 32) ValueCell!4142)) (size!10751 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21862)

(declare-fun e!228839 () Bool)

(declare-fun array_inv!7718 (array!21862) Bool)

(assert (=> start!37182 (and (array_inv!7718 _values!506) e!228839)))

(assert (=> start!37182 tp!29685))

(assert (=> start!37182 true))

(declare-fun tp_is_empty!8971 () Bool)

(assert (=> start!37182 tp_is_empty!8971))

(declare-fun array_inv!7719 (array!21860) Bool)

(assert (=> start!37182 (array_inv!7719 _keys!658)))

(declare-fun b!375657 () Bool)

(declare-fun e!228846 () Bool)

(assert (=> b!375657 (= e!228846 tp_is_empty!8971)))

(declare-fun b!375658 () Bool)

(declare-fun res!212165 () Bool)

(assert (=> b!375658 (=> (not res!212165) (not e!228843))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375658 (= res!212165 (and (= (size!10751 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10750 _keys!658) (size!10751 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375659 () Bool)

(declare-fun res!212158 () Bool)

(assert (=> b!375659 (=> (not res!212158) (not e!228843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21860 (_ BitVec 32)) Bool)

(assert (=> b!375659 (= res!212158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375660 () Bool)

(assert (=> b!375660 (= e!228839 (and e!228846 mapRes!15021))))

(declare-fun condMapEmpty!15021 () Bool)

(declare-fun mapDefault!15021 () ValueCell!4142)

(assert (=> b!375660 (= condMapEmpty!15021 (= (arr!10399 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4142)) mapDefault!15021)))))

(declare-fun b!375661 () Bool)

(declare-fun res!212157 () Bool)

(assert (=> b!375661 (=> (not res!212157) (not e!228843))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375661 (= res!212157 (or (= (select (arr!10398 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10398 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375662 () Bool)

(declare-fun e!228844 () Bool)

(assert (=> b!375662 (= e!228843 e!228844)))

(declare-fun res!212164 () Bool)

(assert (=> b!375662 (=> (not res!212164) (not e!228844))))

(declare-fun lt!174044 () array!21860)

(assert (=> b!375662 (= res!212164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174044 mask!970))))

(assert (=> b!375662 (= lt!174044 (array!21861 (store (arr!10398 _keys!658) i!548 k0!778) (size!10750 _keys!658)))))

(declare-fun b!375663 () Bool)

(declare-fun res!212162 () Bool)

(assert (=> b!375663 (=> (not res!212162) (not e!228845))))

(declare-fun lt!174045 () ListLongMap!4849)

(declare-fun lt!174051 () ListLongMap!4849)

(assert (=> b!375663 (= res!212162 (= lt!174051 (+!836 lt!174045 lt!174050)))))

(declare-fun b!375664 () Bool)

(declare-fun res!212156 () Bool)

(assert (=> b!375664 (=> (not res!212156) (not e!228843))))

(assert (=> b!375664 (= res!212156 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10750 _keys!658))))))

(declare-fun b!375665 () Bool)

(declare-fun e!228841 () Bool)

(assert (=> b!375665 (= e!228841 true)))

(assert (=> b!375665 e!228845))

(declare-fun res!212161 () Bool)

(assert (=> b!375665 (=> (not res!212161) (not e!228845))))

(declare-fun lt!174047 () ListLongMap!4849)

(assert (=> b!375665 (= res!212161 (= lt!174046 (+!836 lt!174047 lt!174050)))))

(declare-fun zeroValue!472 () V!13067)

(assert (=> b!375665 (= lt!174050 (tuple2!5935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375666 () Bool)

(assert (=> b!375666 (= e!228844 (not e!228841))))

(declare-fun res!212159 () Bool)

(assert (=> b!375666 (=> res!212159 e!228841)))

(assert (=> b!375666 (= res!212159 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13067)

(declare-fun getCurrentListMap!1893 (array!21860 array!21862 (_ BitVec 32) (_ BitVec 32) V!13067 V!13067 (_ BitVec 32) Int) ListLongMap!4849)

(assert (=> b!375666 (= lt!174051 (getCurrentListMap!1893 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174052 () array!21862)

(assert (=> b!375666 (= lt!174046 (getCurrentListMap!1893 lt!174044 lt!174052 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375666 (and (= lt!174047 lt!174049) (= lt!174049 lt!174047))))

(declare-fun v!373 () V!13067)

(assert (=> b!375666 (= lt!174049 (+!836 lt!174045 (tuple2!5935 k0!778 v!373)))))

(declare-datatypes ((Unit!11561 0))(
  ( (Unit!11562) )
))
(declare-fun lt!174048 () Unit!11561)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!80 (array!21860 array!21862 (_ BitVec 32) (_ BitVec 32) V!13067 V!13067 (_ BitVec 32) (_ BitVec 64) V!13067 (_ BitVec 32) Int) Unit!11561)

(assert (=> b!375666 (= lt!174048 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!80 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!740 (array!21860 array!21862 (_ BitVec 32) (_ BitVec 32) V!13067 V!13067 (_ BitVec 32) Int) ListLongMap!4849)

(assert (=> b!375666 (= lt!174047 (getCurrentListMapNoExtraKeys!740 lt!174044 lt!174052 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375666 (= lt!174052 (array!21863 (store (arr!10399 _values!506) i!548 (ValueCellFull!4142 v!373)) (size!10751 _values!506)))))

(assert (=> b!375666 (= lt!174045 (getCurrentListMapNoExtraKeys!740 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375667 () Bool)

(declare-fun res!212160 () Bool)

(assert (=> b!375667 (=> (not res!212160) (not e!228843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375667 (= res!212160 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15021 () Bool)

(declare-fun tp!29684 () Bool)

(declare-fun e!228840 () Bool)

(assert (=> mapNonEmpty!15021 (= mapRes!15021 (and tp!29684 e!228840))))

(declare-fun mapRest!15021 () (Array (_ BitVec 32) ValueCell!4142))

(declare-fun mapKey!15021 () (_ BitVec 32))

(declare-fun mapValue!15021 () ValueCell!4142)

(assert (=> mapNonEmpty!15021 (= (arr!10399 _values!506) (store mapRest!15021 mapKey!15021 mapValue!15021))))

(declare-fun b!375668 () Bool)

(assert (=> b!375668 (= e!228840 tp_is_empty!8971)))

(declare-fun b!375669 () Bool)

(declare-fun res!212153 () Bool)

(assert (=> b!375669 (=> (not res!212153) (not e!228843))))

(declare-datatypes ((List!5779 0))(
  ( (Nil!5776) (Cons!5775 (h!6631 (_ BitVec 64)) (t!10921 List!5779)) )
))
(declare-fun arrayNoDuplicates!0 (array!21860 (_ BitVec 32) List!5779) Bool)

(assert (=> b!375669 (= res!212153 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5776))))

(declare-fun b!375670 () Bool)

(declare-fun res!212154 () Bool)

(assert (=> b!375670 (=> (not res!212154) (not e!228844))))

(assert (=> b!375670 (= res!212154 (arrayNoDuplicates!0 lt!174044 #b00000000000000000000000000000000 Nil!5776))))

(assert (= (and start!37182 res!212155) b!375658))

(assert (= (and b!375658 res!212165) b!375659))

(assert (= (and b!375659 res!212158) b!375669))

(assert (= (and b!375669 res!212153) b!375664))

(assert (= (and b!375664 res!212156) b!375667))

(assert (= (and b!375667 res!212160) b!375661))

(assert (= (and b!375661 res!212157) b!375656))

(assert (= (and b!375656 res!212163) b!375662))

(assert (= (and b!375662 res!212164) b!375670))

(assert (= (and b!375670 res!212154) b!375666))

(assert (= (and b!375666 (not res!212159)) b!375665))

(assert (= (and b!375665 res!212161) b!375663))

(assert (= (and b!375663 res!212162) b!375655))

(assert (= (and b!375660 condMapEmpty!15021) mapIsEmpty!15021))

(assert (= (and b!375660 (not condMapEmpty!15021)) mapNonEmpty!15021))

(get-info :version)

(assert (= (and mapNonEmpty!15021 ((_ is ValueCellFull!4142) mapValue!15021)) b!375668))

(assert (= (and b!375660 ((_ is ValueCellFull!4142) mapDefault!15021)) b!375657))

(assert (= start!37182 b!375660))

(declare-fun m!372605 () Bool)

(assert (=> b!375655 m!372605))

(declare-fun m!372607 () Bool)

(assert (=> b!375661 m!372607))

(declare-fun m!372609 () Bool)

(assert (=> b!375670 m!372609))

(declare-fun m!372611 () Bool)

(assert (=> mapNonEmpty!15021 m!372611))

(declare-fun m!372613 () Bool)

(assert (=> b!375662 m!372613))

(declare-fun m!372615 () Bool)

(assert (=> b!375662 m!372615))

(declare-fun m!372617 () Bool)

(assert (=> b!375665 m!372617))

(declare-fun m!372619 () Bool)

(assert (=> b!375666 m!372619))

(declare-fun m!372621 () Bool)

(assert (=> b!375666 m!372621))

(declare-fun m!372623 () Bool)

(assert (=> b!375666 m!372623))

(declare-fun m!372625 () Bool)

(assert (=> b!375666 m!372625))

(declare-fun m!372627 () Bool)

(assert (=> b!375666 m!372627))

(declare-fun m!372629 () Bool)

(assert (=> b!375666 m!372629))

(declare-fun m!372631 () Bool)

(assert (=> b!375666 m!372631))

(declare-fun m!372633 () Bool)

(assert (=> b!375667 m!372633))

(declare-fun m!372635 () Bool)

(assert (=> start!37182 m!372635))

(declare-fun m!372637 () Bool)

(assert (=> start!37182 m!372637))

(declare-fun m!372639 () Bool)

(assert (=> start!37182 m!372639))

(declare-fun m!372641 () Bool)

(assert (=> b!375663 m!372641))

(declare-fun m!372643 () Bool)

(assert (=> b!375669 m!372643))

(declare-fun m!372645 () Bool)

(assert (=> b!375659 m!372645))

(declare-fun m!372647 () Bool)

(assert (=> b!375656 m!372647))

(check-sat (not mapNonEmpty!15021) tp_is_empty!8971 (not b!375666) (not b!375655) b_and!15579 (not b!375669) (not b!375665) (not b!375656) (not b!375670) (not start!37182) (not b_next!8323) (not b!375662) (not b!375659) (not b!375663) (not b!375667))
(check-sat b_and!15579 (not b_next!8323))
