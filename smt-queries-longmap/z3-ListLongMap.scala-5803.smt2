; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74892 () Bool)

(assert start!74892)

(declare-fun b_free!15411 () Bool)

(declare-fun b_next!15411 () Bool)

(assert (=> start!74892 (= b_free!15411 (not b_next!15411))))

(declare-fun tp!53936 () Bool)

(declare-fun b_and!25521 () Bool)

(assert (=> start!74892 (= tp!53936 b_and!25521)))

(declare-fun b!882833 () Bool)

(declare-fun e!491355 () Bool)

(declare-fun e!491358 () Bool)

(assert (=> b!882833 (= e!491355 (not e!491358))))

(declare-fun res!599761 () Bool)

(assert (=> b!882833 (=> res!599761 e!491358)))

(declare-datatypes ((array!51438 0))(
  ( (array!51439 (arr!24738 (Array (_ BitVec 32) (_ BitVec 64))) (size!25178 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51438)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882833 (= res!599761 (not (validKeyInArray!0 (select (arr!24738 _keys!868) from!1053))))))

(declare-datatypes ((V!28587 0))(
  ( (V!28588 (val!8875 Int)) )
))
(declare-datatypes ((tuple2!11754 0))(
  ( (tuple2!11755 (_1!5888 (_ BitVec 64)) (_2!5888 V!28587)) )
))
(declare-datatypes ((List!17563 0))(
  ( (Nil!17560) (Cons!17559 (h!18690 tuple2!11754) (t!24776 List!17563)) )
))
(declare-datatypes ((ListLongMap!10523 0))(
  ( (ListLongMap!10524 (toList!5277 List!17563)) )
))
(declare-fun lt!399454 () ListLongMap!10523)

(declare-fun lt!399461 () ListLongMap!10523)

(assert (=> b!882833 (= lt!399454 lt!399461)))

(declare-fun v!557 () V!28587)

(declare-fun lt!399456 () ListLongMap!10523)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2547 (ListLongMap!10523 tuple2!11754) ListLongMap!10523)

(assert (=> b!882833 (= lt!399461 (+!2547 lt!399456 (tuple2!11755 k0!854 v!557)))))

(declare-datatypes ((ValueCell!8388 0))(
  ( (ValueCellFull!8388 (v!11344 V!28587)) (EmptyCell!8388) )
))
(declare-datatypes ((array!51440 0))(
  ( (array!51441 (arr!24739 (Array (_ BitVec 32) ValueCell!8388)) (size!25179 (_ BitVec 32))) )
))
(declare-fun lt!399458 () array!51440)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28587)

(declare-fun zeroValue!654 () V!28587)

(declare-fun getCurrentListMapNoExtraKeys!3238 (array!51438 array!51440 (_ BitVec 32) (_ BitVec 32) V!28587 V!28587 (_ BitVec 32) Int) ListLongMap!10523)

(assert (=> b!882833 (= lt!399454 (getCurrentListMapNoExtraKeys!3238 _keys!868 lt!399458 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51440)

(assert (=> b!882833 (= lt!399456 (getCurrentListMapNoExtraKeys!3238 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30110 0))(
  ( (Unit!30111) )
))
(declare-fun lt!399457 () Unit!30110)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!734 (array!51438 array!51440 (_ BitVec 32) (_ BitVec 32) V!28587 V!28587 (_ BitVec 32) (_ BitVec 64) V!28587 (_ BitVec 32) Int) Unit!30110)

(assert (=> b!882833 (= lt!399457 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!734 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882834 () Bool)

(declare-fun e!491351 () Bool)

(assert (=> b!882834 (= e!491351 e!491355)))

(declare-fun res!599758 () Bool)

(assert (=> b!882834 (=> (not res!599758) (not e!491355))))

(assert (=> b!882834 (= res!599758 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399453 () ListLongMap!10523)

(assert (=> b!882834 (= lt!399453 (getCurrentListMapNoExtraKeys!3238 _keys!868 lt!399458 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!882834 (= lt!399458 (array!51441 (store (arr!24739 _values!688) i!612 (ValueCellFull!8388 v!557)) (size!25179 _values!688)))))

(declare-fun lt!399455 () ListLongMap!10523)

(assert (=> b!882834 (= lt!399455 (getCurrentListMapNoExtraKeys!3238 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!882835 () Bool)

(declare-fun res!599764 () Bool)

(assert (=> b!882835 (=> (not res!599764) (not e!491351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51438 (_ BitVec 32)) Bool)

(assert (=> b!882835 (= res!599764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!882836 () Bool)

(declare-fun e!491350 () Bool)

(declare-fun tp_is_empty!17655 () Bool)

(assert (=> b!882836 (= e!491350 tp_is_empty!17655)))

(declare-fun b!882837 () Bool)

(declare-fun res!599757 () Bool)

(assert (=> b!882837 (=> (not res!599757) (not e!491351))))

(assert (=> b!882837 (= res!599757 (and (= (size!25179 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25178 _keys!868) (size!25179 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!882838 () Bool)

(declare-fun res!599756 () Bool)

(declare-fun e!491357 () Bool)

(assert (=> b!882838 (=> res!599756 e!491357)))

(declare-datatypes ((List!17564 0))(
  ( (Nil!17561) (Cons!17560 (h!18691 (_ BitVec 64)) (t!24777 List!17564)) )
))
(declare-fun noDuplicate!1323 (List!17564) Bool)

(assert (=> b!882838 (= res!599756 (not (noDuplicate!1323 Nil!17561)))))

(declare-fun b!882839 () Bool)

(declare-fun e!491352 () Bool)

(assert (=> b!882839 (= e!491358 e!491352)))

(declare-fun res!599753 () Bool)

(assert (=> b!882839 (=> res!599753 e!491352)))

(assert (=> b!882839 (= res!599753 (not (= (select (arr!24738 _keys!868) from!1053) k0!854)))))

(declare-fun get!13029 (ValueCell!8388 V!28587) V!28587)

(declare-fun dynLambda!1260 (Int (_ BitVec 64)) V!28587)

(assert (=> b!882839 (= lt!399453 (+!2547 lt!399461 (tuple2!11755 (select (arr!24738 _keys!868) from!1053) (get!13029 (select (arr!24739 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882840 () Bool)

(declare-fun res!599762 () Bool)

(assert (=> b!882840 (=> (not res!599762) (not e!491351))))

(assert (=> b!882840 (= res!599762 (validKeyInArray!0 k0!854))))

(declare-fun res!599759 () Bool)

(assert (=> start!74892 (=> (not res!599759) (not e!491351))))

(assert (=> start!74892 (= res!599759 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25178 _keys!868))))))

(assert (=> start!74892 e!491351))

(assert (=> start!74892 tp_is_empty!17655))

(assert (=> start!74892 true))

(assert (=> start!74892 tp!53936))

(declare-fun array_inv!19478 (array!51438) Bool)

(assert (=> start!74892 (array_inv!19478 _keys!868)))

(declare-fun e!491354 () Bool)

(declare-fun array_inv!19479 (array!51440) Bool)

(assert (=> start!74892 (and (array_inv!19479 _values!688) e!491354)))

(declare-fun b!882841 () Bool)

(assert (=> b!882841 (= e!491357 true)))

(declare-fun lt!399460 () Bool)

(declare-fun contains!4274 (List!17564 (_ BitVec 64)) Bool)

(assert (=> b!882841 (= lt!399460 (contains!4274 Nil!17561 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!882842 () Bool)

(assert (=> b!882842 (= e!491352 e!491357)))

(declare-fun res!599754 () Bool)

(assert (=> b!882842 (=> res!599754 e!491357)))

(assert (=> b!882842 (= res!599754 (or (bvsge (size!25178 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25178 _keys!868)) (bvsge from!1053 (size!25178 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51438 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882842 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399459 () Unit!30110)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51438 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30110)

(assert (=> b!882842 (= lt!399459 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayNoDuplicates!0 (array!51438 (_ BitVec 32) List!17564) Bool)

(assert (=> b!882842 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17561)))

(declare-fun lt!399452 () Unit!30110)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51438 (_ BitVec 32) (_ BitVec 32)) Unit!30110)

(assert (=> b!882842 (= lt!399452 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!882843 () Bool)

(declare-fun res!599760 () Bool)

(assert (=> b!882843 (=> (not res!599760) (not e!491351))))

(assert (=> b!882843 (= res!599760 (and (= (select (arr!24738 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!882844 () Bool)

(declare-fun res!599755 () Bool)

(assert (=> b!882844 (=> (not res!599755) (not e!491351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882844 (= res!599755 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!28119 () Bool)

(declare-fun mapRes!28119 () Bool)

(declare-fun tp!53935 () Bool)

(declare-fun e!491353 () Bool)

(assert (=> mapNonEmpty!28119 (= mapRes!28119 (and tp!53935 e!491353))))

(declare-fun mapKey!28119 () (_ BitVec 32))

(declare-fun mapRest!28119 () (Array (_ BitVec 32) ValueCell!8388))

(declare-fun mapValue!28119 () ValueCell!8388)

(assert (=> mapNonEmpty!28119 (= (arr!24739 _values!688) (store mapRest!28119 mapKey!28119 mapValue!28119))))

(declare-fun b!882845 () Bool)

(assert (=> b!882845 (= e!491354 (and e!491350 mapRes!28119))))

(declare-fun condMapEmpty!28119 () Bool)

(declare-fun mapDefault!28119 () ValueCell!8388)

(assert (=> b!882845 (= condMapEmpty!28119 (= (arr!24739 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8388)) mapDefault!28119)))))

(declare-fun b!882846 () Bool)

(declare-fun res!599765 () Bool)

(assert (=> b!882846 (=> (not res!599765) (not e!491351))))

(assert (=> b!882846 (= res!599765 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25178 _keys!868))))))

(declare-fun mapIsEmpty!28119 () Bool)

(assert (=> mapIsEmpty!28119 mapRes!28119))

(declare-fun b!882847 () Bool)

(declare-fun res!599766 () Bool)

(assert (=> b!882847 (=> (not res!599766) (not e!491351))))

(assert (=> b!882847 (= res!599766 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17561))))

(declare-fun b!882848 () Bool)

(declare-fun res!599763 () Bool)

(assert (=> b!882848 (=> res!599763 e!491357)))

(assert (=> b!882848 (= res!599763 (contains!4274 Nil!17561 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!882849 () Bool)

(assert (=> b!882849 (= e!491353 tp_is_empty!17655)))

(assert (= (and start!74892 res!599759) b!882844))

(assert (= (and b!882844 res!599755) b!882837))

(assert (= (and b!882837 res!599757) b!882835))

(assert (= (and b!882835 res!599764) b!882847))

(assert (= (and b!882847 res!599766) b!882846))

(assert (= (and b!882846 res!599765) b!882840))

(assert (= (and b!882840 res!599762) b!882843))

(assert (= (and b!882843 res!599760) b!882834))

(assert (= (and b!882834 res!599758) b!882833))

(assert (= (and b!882833 (not res!599761)) b!882839))

(assert (= (and b!882839 (not res!599753)) b!882842))

(assert (= (and b!882842 (not res!599754)) b!882838))

(assert (= (and b!882838 (not res!599756)) b!882848))

(assert (= (and b!882848 (not res!599763)) b!882841))

(assert (= (and b!882845 condMapEmpty!28119) mapIsEmpty!28119))

(assert (= (and b!882845 (not condMapEmpty!28119)) mapNonEmpty!28119))

(get-info :version)

(assert (= (and mapNonEmpty!28119 ((_ is ValueCellFull!8388) mapValue!28119)) b!882849))

(assert (= (and b!882845 ((_ is ValueCellFull!8388) mapDefault!28119)) b!882836))

(assert (= start!74892 b!882845))

(declare-fun b_lambda!12689 () Bool)

(assert (=> (not b_lambda!12689) (not b!882839)))

(declare-fun t!24775 () Bool)

(declare-fun tb!5069 () Bool)

(assert (=> (and start!74892 (= defaultEntry!696 defaultEntry!696) t!24775) tb!5069))

(declare-fun result!9773 () Bool)

(assert (=> tb!5069 (= result!9773 tp_is_empty!17655)))

(assert (=> b!882839 t!24775))

(declare-fun b_and!25523 () Bool)

(assert (= b_and!25521 (and (=> t!24775 result!9773) b_and!25523)))

(declare-fun m!822829 () Bool)

(assert (=> b!882834 m!822829))

(declare-fun m!822831 () Bool)

(assert (=> b!882834 m!822831))

(declare-fun m!822833 () Bool)

(assert (=> b!882834 m!822833))

(declare-fun m!822835 () Bool)

(assert (=> b!882844 m!822835))

(declare-fun m!822837 () Bool)

(assert (=> start!74892 m!822837))

(declare-fun m!822839 () Bool)

(assert (=> start!74892 m!822839))

(declare-fun m!822841 () Bool)

(assert (=> b!882843 m!822841))

(declare-fun m!822843 () Bool)

(assert (=> b!882848 m!822843))

(declare-fun m!822845 () Bool)

(assert (=> b!882842 m!822845))

(declare-fun m!822847 () Bool)

(assert (=> b!882842 m!822847))

(declare-fun m!822849 () Bool)

(assert (=> b!882842 m!822849))

(declare-fun m!822851 () Bool)

(assert (=> b!882842 m!822851))

(declare-fun m!822853 () Bool)

(assert (=> b!882833 m!822853))

(declare-fun m!822855 () Bool)

(assert (=> b!882833 m!822855))

(declare-fun m!822857 () Bool)

(assert (=> b!882833 m!822857))

(assert (=> b!882833 m!822855))

(declare-fun m!822859 () Bool)

(assert (=> b!882833 m!822859))

(declare-fun m!822861 () Bool)

(assert (=> b!882833 m!822861))

(declare-fun m!822863 () Bool)

(assert (=> b!882833 m!822863))

(declare-fun m!822865 () Bool)

(assert (=> b!882847 m!822865))

(declare-fun m!822867 () Bool)

(assert (=> b!882835 m!822867))

(declare-fun m!822869 () Bool)

(assert (=> mapNonEmpty!28119 m!822869))

(declare-fun m!822871 () Bool)

(assert (=> b!882841 m!822871))

(declare-fun m!822873 () Bool)

(assert (=> b!882840 m!822873))

(declare-fun m!822875 () Bool)

(assert (=> b!882838 m!822875))

(declare-fun m!822877 () Bool)

(assert (=> b!882839 m!822877))

(declare-fun m!822879 () Bool)

(assert (=> b!882839 m!822879))

(declare-fun m!822881 () Bool)

(assert (=> b!882839 m!822881))

(declare-fun m!822883 () Bool)

(assert (=> b!882839 m!822883))

(assert (=> b!882839 m!822879))

(assert (=> b!882839 m!822855))

(assert (=> b!882839 m!822881))

(check-sat (not b!882844) (not b!882839) (not b!882848) (not mapNonEmpty!28119) tp_is_empty!17655 (not b!882835) (not b!882838) (not b!882847) (not b_next!15411) (not start!74892) (not b!882834) (not b!882840) (not b_lambda!12689) (not b!882842) (not b!882841) b_and!25523 (not b!882833))
(check-sat b_and!25523 (not b_next!15411))
