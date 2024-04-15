; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133484 () Bool)

(assert start!133484)

(declare-fun b_free!31951 () Bool)

(declare-fun b_next!31951 () Bool)

(assert (=> start!133484 (= b_free!31951 (not b_next!31951))))

(declare-fun tp!112977 () Bool)

(declare-fun b_and!51395 () Bool)

(assert (=> start!133484 (= tp!112977 b_and!51395)))

(declare-fun res!1067268 () Bool)

(declare-fun e!869758 () Bool)

(assert (=> start!133484 (=> (not res!1067268) (not e!869758))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133484 (= res!1067268 (validMask!0 mask!947))))

(assert (=> start!133484 e!869758))

(assert (=> start!133484 tp!112977))

(declare-fun tp_is_empty!38617 () Bool)

(assert (=> start!133484 tp_is_empty!38617))

(assert (=> start!133484 true))

(declare-datatypes ((array!103870 0))(
  ( (array!103871 (arr!50128 (Array (_ BitVec 32) (_ BitVec 64))) (size!50680 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103870)

(declare-fun array_inv!39157 (array!103870) Bool)

(assert (=> start!133484 (array_inv!39157 _keys!637)))

(declare-datatypes ((V!59697 0))(
  ( (V!59698 (val!19392 Int)) )
))
(declare-datatypes ((ValueCell!18278 0))(
  ( (ValueCellFull!18278 (v!22140 V!59697)) (EmptyCell!18278) )
))
(declare-datatypes ((array!103872 0))(
  ( (array!103873 (arr!50129 (Array (_ BitVec 32) ValueCell!18278)) (size!50681 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103872)

(declare-fun e!869759 () Bool)

(declare-fun array_inv!39158 (array!103872) Bool)

(assert (=> start!133484 (and (array_inv!39158 _values!487) e!869759)))

(declare-fun b!1560752 () Bool)

(assert (=> b!1560752 (= e!869758 (not true))))

(declare-fun lt!670809 () V!59697)

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((tuple2!25118 0))(
  ( (tuple2!25119 (_1!12570 (_ BitVec 64)) (_2!12570 V!59697)) )
))
(declare-datatypes ((List!36456 0))(
  ( (Nil!36453) (Cons!36452 (h!37899 tuple2!25118) (t!51189 List!36456)) )
))
(declare-datatypes ((ListLongMap!22553 0))(
  ( (ListLongMap!22554 (toList!11292 List!36456)) )
))
(declare-fun lt!670811 () ListLongMap!22553)

(declare-fun contains!10202 (ListLongMap!22553 (_ BitVec 64)) Bool)

(declare-fun +!5057 (ListLongMap!22553 tuple2!25118) ListLongMap!22553)

(assert (=> b!1560752 (not (contains!10202 (+!5057 lt!670811 (tuple2!25119 (select (arr!50128 _keys!637) from!782) lt!670809)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51722 0))(
  ( (Unit!51723) )
))
(declare-fun lt!670810 () Unit!51722)

(declare-fun addStillNotContains!504 (ListLongMap!22553 (_ BitVec 64) V!59697 (_ BitVec 64)) Unit!51722)

(assert (=> b!1560752 (= lt!670810 (addStillNotContains!504 lt!670811 (select (arr!50128 _keys!637) from!782) lt!670809 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26186 (ValueCell!18278 V!59697) V!59697)

(declare-fun dynLambda!3833 (Int (_ BitVec 64)) V!59697)

(assert (=> b!1560752 (= lt!670809 (get!26186 (select (arr!50129 _values!487) from!782) (dynLambda!3833 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59697)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59697)

(declare-fun getCurrentListMapNoExtraKeys!6666 (array!103870 array!103872 (_ BitVec 32) (_ BitVec 32) V!59697 V!59697 (_ BitVec 32) Int) ListLongMap!22553)

(assert (=> b!1560752 (= lt!670811 (getCurrentListMapNoExtraKeys!6666 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1560753 () Bool)

(declare-fun res!1067264 () Bool)

(assert (=> b!1560753 (=> (not res!1067264) (not e!869758))))

(assert (=> b!1560753 (= res!1067264 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50680 _keys!637)) (bvslt from!782 (size!50680 _keys!637))))))

(declare-fun b!1560754 () Bool)

(declare-fun res!1067266 () Bool)

(assert (=> b!1560754 (=> (not res!1067266) (not e!869758))))

(declare-datatypes ((List!36457 0))(
  ( (Nil!36454) (Cons!36453 (h!37900 (_ BitVec 64)) (t!51190 List!36457)) )
))
(declare-fun arrayNoDuplicates!0 (array!103870 (_ BitVec 32) List!36457) Bool)

(assert (=> b!1560754 (= res!1067266 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36454))))

(declare-fun b!1560755 () Bool)

(declare-fun e!869761 () Bool)

(assert (=> b!1560755 (= e!869761 tp_is_empty!38617)))

(declare-fun mapIsEmpty!59301 () Bool)

(declare-fun mapRes!59301 () Bool)

(assert (=> mapIsEmpty!59301 mapRes!59301))

(declare-fun b!1560756 () Bool)

(declare-fun res!1067265 () Bool)

(assert (=> b!1560756 (=> (not res!1067265) (not e!869758))))

(assert (=> b!1560756 (= res!1067265 (and (= (size!50681 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50680 _keys!637) (size!50681 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560757 () Bool)

(declare-fun e!869760 () Bool)

(assert (=> b!1560757 (= e!869759 (and e!869760 mapRes!59301))))

(declare-fun condMapEmpty!59301 () Bool)

(declare-fun mapDefault!59301 () ValueCell!18278)

(assert (=> b!1560757 (= condMapEmpty!59301 (= (arr!50129 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18278)) mapDefault!59301)))))

(declare-fun b!1560758 () Bool)

(assert (=> b!1560758 (= e!869760 tp_is_empty!38617)))

(declare-fun b!1560759 () Bool)

(declare-fun res!1067263 () Bool)

(assert (=> b!1560759 (=> (not res!1067263) (not e!869758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103870 (_ BitVec 32)) Bool)

(assert (=> b!1560759 (= res!1067263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560760 () Bool)

(declare-fun res!1067267 () Bool)

(assert (=> b!1560760 (=> (not res!1067267) (not e!869758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1560760 (= res!1067267 (validKeyInArray!0 (select (arr!50128 _keys!637) from!782)))))

(declare-fun mapNonEmpty!59301 () Bool)

(declare-fun tp!112978 () Bool)

(assert (=> mapNonEmpty!59301 (= mapRes!59301 (and tp!112978 e!869761))))

(declare-fun mapKey!59301 () (_ BitVec 32))

(declare-fun mapRest!59301 () (Array (_ BitVec 32) ValueCell!18278))

(declare-fun mapValue!59301 () ValueCell!18278)

(assert (=> mapNonEmpty!59301 (= (arr!50129 _values!487) (store mapRest!59301 mapKey!59301 mapValue!59301))))

(assert (= (and start!133484 res!1067268) b!1560756))

(assert (= (and b!1560756 res!1067265) b!1560759))

(assert (= (and b!1560759 res!1067263) b!1560754))

(assert (= (and b!1560754 res!1067266) b!1560753))

(assert (= (and b!1560753 res!1067264) b!1560760))

(assert (= (and b!1560760 res!1067267) b!1560752))

(assert (= (and b!1560757 condMapEmpty!59301) mapIsEmpty!59301))

(assert (= (and b!1560757 (not condMapEmpty!59301)) mapNonEmpty!59301))

(get-info :version)

(assert (= (and mapNonEmpty!59301 ((_ is ValueCellFull!18278) mapValue!59301)) b!1560755))

(assert (= (and b!1560757 ((_ is ValueCellFull!18278) mapDefault!59301)) b!1560758))

(assert (= start!133484 b!1560757))

(declare-fun b_lambda!24815 () Bool)

(assert (=> (not b_lambda!24815) (not b!1560752)))

(declare-fun t!51188 () Bool)

(declare-fun tb!12487 () Bool)

(assert (=> (and start!133484 (= defaultEntry!495 defaultEntry!495) t!51188) tb!12487))

(declare-fun result!26263 () Bool)

(assert (=> tb!12487 (= result!26263 tp_is_empty!38617)))

(assert (=> b!1560752 t!51188))

(declare-fun b_and!51397 () Bool)

(assert (= b_and!51395 (and (=> t!51188 result!26263) b_and!51397)))

(declare-fun m!1435839 () Bool)

(assert (=> mapNonEmpty!59301 m!1435839))

(declare-fun m!1435841 () Bool)

(assert (=> start!133484 m!1435841))

(declare-fun m!1435843 () Bool)

(assert (=> start!133484 m!1435843))

(declare-fun m!1435845 () Bool)

(assert (=> start!133484 m!1435845))

(declare-fun m!1435847 () Bool)

(assert (=> b!1560759 m!1435847))

(declare-fun m!1435849 () Bool)

(assert (=> b!1560754 m!1435849))

(declare-fun m!1435851 () Bool)

(assert (=> b!1560752 m!1435851))

(declare-fun m!1435853 () Bool)

(assert (=> b!1560752 m!1435853))

(declare-fun m!1435855 () Bool)

(assert (=> b!1560752 m!1435855))

(declare-fun m!1435857 () Bool)

(assert (=> b!1560752 m!1435857))

(declare-fun m!1435859 () Bool)

(assert (=> b!1560752 m!1435859))

(assert (=> b!1560752 m!1435851))

(declare-fun m!1435861 () Bool)

(assert (=> b!1560752 m!1435861))

(assert (=> b!1560752 m!1435857))

(assert (=> b!1560752 m!1435861))

(declare-fun m!1435863 () Bool)

(assert (=> b!1560752 m!1435863))

(assert (=> b!1560752 m!1435853))

(declare-fun m!1435865 () Bool)

(assert (=> b!1560752 m!1435865))

(assert (=> b!1560760 m!1435857))

(assert (=> b!1560760 m!1435857))

(declare-fun m!1435867 () Bool)

(assert (=> b!1560760 m!1435867))

(check-sat (not b!1560760) tp_is_empty!38617 (not mapNonEmpty!59301) b_and!51397 (not b_lambda!24815) (not start!133484) (not b!1560754) (not b!1560752) (not b_next!31951) (not b!1560759))
(check-sat b_and!51397 (not b_next!31951))
