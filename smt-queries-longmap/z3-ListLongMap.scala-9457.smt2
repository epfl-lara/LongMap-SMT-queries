; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112352 () Bool)

(assert start!112352)

(declare-fun b_free!30747 () Bool)

(declare-fun b_next!30747 () Bool)

(assert (=> start!112352 (= b_free!30747 (not b_next!30747))))

(declare-fun tp!107877 () Bool)

(declare-fun b_and!49549 () Bool)

(assert (=> start!112352 (= tp!107877 b_and!49549)))

(declare-fun b!1331755 () Bool)

(declare-fun e!758806 () Bool)

(assert (=> b!1331755 (= e!758806 (not true))))

(declare-datatypes ((V!53979 0))(
  ( (V!53980 (val!18403 Int)) )
))
(declare-datatypes ((tuple2!23710 0))(
  ( (tuple2!23711 (_1!11866 (_ BitVec 64)) (_2!11866 V!53979)) )
))
(declare-datatypes ((List!30858 0))(
  ( (Nil!30855) (Cons!30854 (h!32063 tuple2!23710) (t!45018 List!30858)) )
))
(declare-datatypes ((ListLongMap!21367 0))(
  ( (ListLongMap!21368 (toList!10699 List!30858)) )
))
(declare-fun lt!591688 () ListLongMap!21367)

(declare-fun minValue!1262 () V!53979)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8863 (ListLongMap!21367 (_ BitVec 64)) Bool)

(declare-fun +!4693 (ListLongMap!21367 tuple2!23710) ListLongMap!21367)

(assert (=> b!1331755 (contains!8863 (+!4693 lt!591688 (tuple2!23711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43835 0))(
  ( (Unit!43836) )
))
(declare-fun lt!591684 () Unit!43835)

(declare-fun addStillContains!1172 (ListLongMap!21367 (_ BitVec 64) V!53979 (_ BitVec 64)) Unit!43835)

(assert (=> b!1331755 (= lt!591684 (addStillContains!1172 lt!591688 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1331755 (contains!8863 lt!591688 k0!1153)))

(declare-fun lt!591685 () Unit!43835)

(declare-datatypes ((array!90194 0))(
  ( (array!90195 (arr!43563 (Array (_ BitVec 32) (_ BitVec 64))) (size!44113 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90194)

(declare-fun lt!591687 () V!53979)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!280 ((_ BitVec 64) (_ BitVec 64) V!53979 ListLongMap!21367) Unit!43835)

(assert (=> b!1331755 (= lt!591685 (lemmaInListMapAfterAddingDiffThenInBefore!280 k0!1153 (select (arr!43563 _keys!1590) from!1980) lt!591687 lt!591688))))

(declare-fun lt!591686 () ListLongMap!21367)

(assert (=> b!1331755 (contains!8863 lt!591686 k0!1153)))

(declare-fun lt!591683 () Unit!43835)

(assert (=> b!1331755 (= lt!591683 (lemmaInListMapAfterAddingDiffThenInBefore!280 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591686))))

(assert (=> b!1331755 (= lt!591686 (+!4693 lt!591688 (tuple2!23711 (select (arr!43563 _keys!1590) from!1980) lt!591687)))))

(declare-datatypes ((ValueCell!17430 0))(
  ( (ValueCellFull!17430 (v!21040 V!53979)) (EmptyCell!17430) )
))
(declare-datatypes ((array!90196 0))(
  ( (array!90197 (arr!43564 (Array (_ BitVec 32) ValueCell!17430)) (size!44114 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90196)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21971 (ValueCell!17430 V!53979) V!53979)

(declare-fun dynLambda!3632 (Int (_ BitVec 64)) V!53979)

(assert (=> b!1331755 (= lt!591687 (get!21971 (select (arr!43564 _values!1320) from!1980) (dynLambda!3632 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53979)

(declare-fun getCurrentListMapNoExtraKeys!6331 (array!90194 array!90196 (_ BitVec 32) (_ BitVec 32) V!53979 V!53979 (_ BitVec 32) Int) ListLongMap!21367)

(assert (=> b!1331755 (= lt!591688 (getCurrentListMapNoExtraKeys!6331 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331756 () Bool)

(declare-fun e!758803 () Bool)

(declare-fun tp_is_empty!36657 () Bool)

(assert (=> b!1331756 (= e!758803 tp_is_empty!36657)))

(declare-fun b!1331757 () Bool)

(declare-fun res!883746 () Bool)

(assert (=> b!1331757 (=> (not res!883746) (not e!758806))))

(assert (=> b!1331757 (= res!883746 (and (= (size!44114 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44113 _keys!1590) (size!44114 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!883743 () Bool)

(assert (=> start!112352 (=> (not res!883743) (not e!758806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112352 (= res!883743 (validMask!0 mask!1998))))

(assert (=> start!112352 e!758806))

(declare-fun e!758805 () Bool)

(declare-fun array_inv!32859 (array!90196) Bool)

(assert (=> start!112352 (and (array_inv!32859 _values!1320) e!758805)))

(assert (=> start!112352 true))

(declare-fun array_inv!32860 (array!90194) Bool)

(assert (=> start!112352 (array_inv!32860 _keys!1590)))

(assert (=> start!112352 tp!107877))

(assert (=> start!112352 tp_is_empty!36657))

(declare-fun b!1331758 () Bool)

(declare-fun mapRes!56659 () Bool)

(assert (=> b!1331758 (= e!758805 (and e!758803 mapRes!56659))))

(declare-fun condMapEmpty!56659 () Bool)

(declare-fun mapDefault!56659 () ValueCell!17430)

(assert (=> b!1331758 (= condMapEmpty!56659 (= (arr!43564 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17430)) mapDefault!56659)))))

(declare-fun mapIsEmpty!56659 () Bool)

(assert (=> mapIsEmpty!56659 mapRes!56659))

(declare-fun b!1331759 () Bool)

(declare-fun res!883745 () Bool)

(assert (=> b!1331759 (=> (not res!883745) (not e!758806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331759 (= res!883745 (validKeyInArray!0 (select (arr!43563 _keys!1590) from!1980)))))

(declare-fun b!1331760 () Bool)

(declare-fun res!883749 () Bool)

(assert (=> b!1331760 (=> (not res!883749) (not e!758806))))

(assert (=> b!1331760 (= res!883749 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331761 () Bool)

(declare-fun res!883742 () Bool)

(assert (=> b!1331761 (=> (not res!883742) (not e!758806))))

(assert (=> b!1331761 (= res!883742 (not (= (select (arr!43563 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331762 () Bool)

(declare-fun res!883748 () Bool)

(assert (=> b!1331762 (=> (not res!883748) (not e!758806))))

(assert (=> b!1331762 (= res!883748 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44113 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56659 () Bool)

(declare-fun tp!107878 () Bool)

(declare-fun e!758804 () Bool)

(assert (=> mapNonEmpty!56659 (= mapRes!56659 (and tp!107878 e!758804))))

(declare-fun mapRest!56659 () (Array (_ BitVec 32) ValueCell!17430))

(declare-fun mapValue!56659 () ValueCell!17430)

(declare-fun mapKey!56659 () (_ BitVec 32))

(assert (=> mapNonEmpty!56659 (= (arr!43564 _values!1320) (store mapRest!56659 mapKey!56659 mapValue!56659))))

(declare-fun b!1331763 () Bool)

(declare-fun res!883744 () Bool)

(assert (=> b!1331763 (=> (not res!883744) (not e!758806))))

(declare-fun getCurrentListMap!5682 (array!90194 array!90196 (_ BitVec 32) (_ BitVec 32) V!53979 V!53979 (_ BitVec 32) Int) ListLongMap!21367)

(assert (=> b!1331763 (= res!883744 (contains!8863 (getCurrentListMap!5682 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331764 () Bool)

(declare-fun res!883741 () Bool)

(assert (=> b!1331764 (=> (not res!883741) (not e!758806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90194 (_ BitVec 32)) Bool)

(assert (=> b!1331764 (= res!883741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331765 () Bool)

(assert (=> b!1331765 (= e!758804 tp_is_empty!36657)))

(declare-fun b!1331766 () Bool)

(declare-fun res!883747 () Bool)

(assert (=> b!1331766 (=> (not res!883747) (not e!758806))))

(declare-datatypes ((List!30859 0))(
  ( (Nil!30856) (Cons!30855 (h!32064 (_ BitVec 64)) (t!45019 List!30859)) )
))
(declare-fun arrayNoDuplicates!0 (array!90194 (_ BitVec 32) List!30859) Bool)

(assert (=> b!1331766 (= res!883747 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30856))))

(assert (= (and start!112352 res!883743) b!1331757))

(assert (= (and b!1331757 res!883746) b!1331764))

(assert (= (and b!1331764 res!883741) b!1331766))

(assert (= (and b!1331766 res!883747) b!1331762))

(assert (= (and b!1331762 res!883748) b!1331763))

(assert (= (and b!1331763 res!883744) b!1331761))

(assert (= (and b!1331761 res!883742) b!1331759))

(assert (= (and b!1331759 res!883745) b!1331760))

(assert (= (and b!1331760 res!883749) b!1331755))

(assert (= (and b!1331758 condMapEmpty!56659) mapIsEmpty!56659))

(assert (= (and b!1331758 (not condMapEmpty!56659)) mapNonEmpty!56659))

(get-info :version)

(assert (= (and mapNonEmpty!56659 ((_ is ValueCellFull!17430) mapValue!56659)) b!1331765))

(assert (= (and b!1331758 ((_ is ValueCellFull!17430) mapDefault!56659)) b!1331756))

(assert (= start!112352 b!1331758))

(declare-fun b_lambda!24007 () Bool)

(assert (=> (not b_lambda!24007) (not b!1331755)))

(declare-fun t!45017 () Bool)

(declare-fun tb!11963 () Bool)

(assert (=> (and start!112352 (= defaultEntry!1323 defaultEntry!1323) t!45017) tb!11963))

(declare-fun result!24997 () Bool)

(assert (=> tb!11963 (= result!24997 tp_is_empty!36657)))

(assert (=> b!1331755 t!45017))

(declare-fun b_and!49551 () Bool)

(assert (= b_and!49549 (and (=> t!45017 result!24997) b_and!49551)))

(declare-fun m!1220459 () Bool)

(assert (=> start!112352 m!1220459))

(declare-fun m!1220461 () Bool)

(assert (=> start!112352 m!1220461))

(declare-fun m!1220463 () Bool)

(assert (=> start!112352 m!1220463))

(declare-fun m!1220465 () Bool)

(assert (=> b!1331766 m!1220465))

(declare-fun m!1220467 () Bool)

(assert (=> b!1331759 m!1220467))

(assert (=> b!1331759 m!1220467))

(declare-fun m!1220469 () Bool)

(assert (=> b!1331759 m!1220469))

(declare-fun m!1220471 () Bool)

(assert (=> b!1331764 m!1220471))

(assert (=> b!1331761 m!1220467))

(declare-fun m!1220473 () Bool)

(assert (=> b!1331755 m!1220473))

(declare-fun m!1220475 () Bool)

(assert (=> b!1331755 m!1220475))

(declare-fun m!1220477 () Bool)

(assert (=> b!1331755 m!1220477))

(declare-fun m!1220479 () Bool)

(assert (=> b!1331755 m!1220479))

(declare-fun m!1220481 () Bool)

(assert (=> b!1331755 m!1220481))

(declare-fun m!1220483 () Bool)

(assert (=> b!1331755 m!1220483))

(declare-fun m!1220485 () Bool)

(assert (=> b!1331755 m!1220485))

(declare-fun m!1220487 () Bool)

(assert (=> b!1331755 m!1220487))

(assert (=> b!1331755 m!1220473))

(declare-fun m!1220489 () Bool)

(assert (=> b!1331755 m!1220489))

(declare-fun m!1220491 () Bool)

(assert (=> b!1331755 m!1220491))

(assert (=> b!1331755 m!1220467))

(declare-fun m!1220493 () Bool)

(assert (=> b!1331755 m!1220493))

(assert (=> b!1331755 m!1220467))

(assert (=> b!1331755 m!1220475))

(assert (=> b!1331755 m!1220479))

(declare-fun m!1220495 () Bool)

(assert (=> b!1331755 m!1220495))

(declare-fun m!1220497 () Bool)

(assert (=> mapNonEmpty!56659 m!1220497))

(declare-fun m!1220499 () Bool)

(assert (=> b!1331763 m!1220499))

(assert (=> b!1331763 m!1220499))

(declare-fun m!1220501 () Bool)

(assert (=> b!1331763 m!1220501))

(check-sat (not start!112352) tp_is_empty!36657 (not b!1331755) b_and!49551 (not b_lambda!24007) (not b!1331763) (not b!1331766) (not b!1331764) (not b!1331759) (not b_next!30747) (not mapNonEmpty!56659))
(check-sat b_and!49551 (not b_next!30747))
