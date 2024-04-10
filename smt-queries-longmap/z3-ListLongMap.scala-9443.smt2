; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112268 () Bool)

(assert start!112268)

(declare-fun b_free!30663 () Bool)

(declare-fun b_next!30663 () Bool)

(assert (=> start!112268 (= b_free!30663 (not b_next!30663))))

(declare-fun tp!107625 () Bool)

(declare-fun b_and!49381 () Bool)

(assert (=> start!112268 (= tp!107625 b_and!49381)))

(declare-fun b!1330159 () Bool)

(declare-fun res!882609 () Bool)

(declare-fun e!758176 () Bool)

(assert (=> b!1330159 (=> (not res!882609) (not e!758176))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1330159 (= res!882609 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330160 () Bool)

(declare-fun e!758172 () Bool)

(declare-fun tp_is_empty!36573 () Bool)

(assert (=> b!1330160 (= e!758172 tp_is_empty!36573)))

(declare-fun b!1330161 () Bool)

(declare-fun res!882611 () Bool)

(assert (=> b!1330161 (=> (not res!882611) (not e!758176))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90036 0))(
  ( (array!90037 (arr!43484 (Array (_ BitVec 32) (_ BitVec 64))) (size!44034 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90036)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1330161 (= res!882611 (not (= (select (arr!43484 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330162 () Bool)

(assert (=> b!1330162 (= e!758176 (not true))))

(declare-datatypes ((V!53867 0))(
  ( (V!53868 (val!18361 Int)) )
))
(declare-datatypes ((tuple2!23644 0))(
  ( (tuple2!23645 (_1!11833 (_ BitVec 64)) (_2!11833 V!53867)) )
))
(declare-datatypes ((List!30796 0))(
  ( (Nil!30793) (Cons!30792 (h!32001 tuple2!23644) (t!44872 List!30796)) )
))
(declare-datatypes ((ListLongMap!21301 0))(
  ( (ListLongMap!21302 (toList!10666 List!30796)) )
))
(declare-fun lt!591069 () ListLongMap!21301)

(declare-fun contains!8830 (ListLongMap!21301 (_ BitVec 64)) Bool)

(assert (=> b!1330162 (contains!8830 lt!591069 k0!1153)))

(declare-datatypes ((Unit!43777 0))(
  ( (Unit!43778) )
))
(declare-fun lt!591070 () Unit!43777)

(declare-fun minValue!1262 () V!53867)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!251 ((_ BitVec 64) (_ BitVec 64) V!53867 ListLongMap!21301) Unit!43777)

(assert (=> b!1330162 (= lt!591070 (lemmaInListMapAfterAddingDiffThenInBefore!251 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591069))))

(declare-datatypes ((ValueCell!17388 0))(
  ( (ValueCellFull!17388 (v!20998 V!53867)) (EmptyCell!17388) )
))
(declare-datatypes ((array!90038 0))(
  ( (array!90039 (arr!43485 (Array (_ BitVec 32) ValueCell!17388)) (size!44035 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90038)

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53867)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun +!4664 (ListLongMap!21301 tuple2!23644) ListLongMap!21301)

(declare-fun getCurrentListMapNoExtraKeys!6302 (array!90036 array!90038 (_ BitVec 32) (_ BitVec 32) V!53867 V!53867 (_ BitVec 32) Int) ListLongMap!21301)

(declare-fun get!21914 (ValueCell!17388 V!53867) V!53867)

(declare-fun dynLambda!3603 (Int (_ BitVec 64)) V!53867)

(assert (=> b!1330162 (= lt!591069 (+!4664 (getCurrentListMapNoExtraKeys!6302 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23645 (select (arr!43484 _keys!1590) from!1980) (get!21914 (select (arr!43485 _values!1320) from!1980) (dynLambda!3603 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1330163 () Bool)

(declare-fun res!882612 () Bool)

(assert (=> b!1330163 (=> (not res!882612) (not e!758176))))

(assert (=> b!1330163 (= res!882612 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44034 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!882614 () Bool)

(assert (=> start!112268 (=> (not res!882614) (not e!758176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112268 (= res!882614 (validMask!0 mask!1998))))

(assert (=> start!112268 e!758176))

(declare-fun e!758174 () Bool)

(declare-fun array_inv!32807 (array!90038) Bool)

(assert (=> start!112268 (and (array_inv!32807 _values!1320) e!758174)))

(assert (=> start!112268 true))

(declare-fun array_inv!32808 (array!90036) Bool)

(assert (=> start!112268 (array_inv!32808 _keys!1590)))

(assert (=> start!112268 tp!107625))

(assert (=> start!112268 tp_is_empty!36573))

(declare-fun b!1330164 () Bool)

(declare-fun e!758173 () Bool)

(assert (=> b!1330164 (= e!758173 tp_is_empty!36573)))

(declare-fun b!1330165 () Bool)

(declare-fun res!882610 () Bool)

(assert (=> b!1330165 (=> (not res!882610) (not e!758176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330165 (= res!882610 (validKeyInArray!0 (select (arr!43484 _keys!1590) from!1980)))))

(declare-fun b!1330166 () Bool)

(declare-fun res!882613 () Bool)

(assert (=> b!1330166 (=> (not res!882613) (not e!758176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90036 (_ BitVec 32)) Bool)

(assert (=> b!1330166 (= res!882613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330167 () Bool)

(declare-fun res!882615 () Bool)

(assert (=> b!1330167 (=> (not res!882615) (not e!758176))))

(declare-fun getCurrentListMap!5654 (array!90036 array!90038 (_ BitVec 32) (_ BitVec 32) V!53867 V!53867 (_ BitVec 32) Int) ListLongMap!21301)

(assert (=> b!1330167 (= res!882615 (contains!8830 (getCurrentListMap!5654 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330168 () Bool)

(declare-fun res!882608 () Bool)

(assert (=> b!1330168 (=> (not res!882608) (not e!758176))))

(declare-datatypes ((List!30797 0))(
  ( (Nil!30794) (Cons!30793 (h!32002 (_ BitVec 64)) (t!44873 List!30797)) )
))
(declare-fun arrayNoDuplicates!0 (array!90036 (_ BitVec 32) List!30797) Bool)

(assert (=> b!1330168 (= res!882608 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30794))))

(declare-fun b!1330169 () Bool)

(declare-fun mapRes!56533 () Bool)

(assert (=> b!1330169 (= e!758174 (and e!758172 mapRes!56533))))

(declare-fun condMapEmpty!56533 () Bool)

(declare-fun mapDefault!56533 () ValueCell!17388)

(assert (=> b!1330169 (= condMapEmpty!56533 (= (arr!43485 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17388)) mapDefault!56533)))))

(declare-fun mapNonEmpty!56533 () Bool)

(declare-fun tp!107626 () Bool)

(assert (=> mapNonEmpty!56533 (= mapRes!56533 (and tp!107626 e!758173))))

(declare-fun mapKey!56533 () (_ BitVec 32))

(declare-fun mapRest!56533 () (Array (_ BitVec 32) ValueCell!17388))

(declare-fun mapValue!56533 () ValueCell!17388)

(assert (=> mapNonEmpty!56533 (= (arr!43485 _values!1320) (store mapRest!56533 mapKey!56533 mapValue!56533))))

(declare-fun mapIsEmpty!56533 () Bool)

(assert (=> mapIsEmpty!56533 mapRes!56533))

(declare-fun b!1330170 () Bool)

(declare-fun res!882607 () Bool)

(assert (=> b!1330170 (=> (not res!882607) (not e!758176))))

(assert (=> b!1330170 (= res!882607 (and (= (size!44035 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44034 _keys!1590) (size!44035 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112268 res!882614) b!1330170))

(assert (= (and b!1330170 res!882607) b!1330166))

(assert (= (and b!1330166 res!882613) b!1330168))

(assert (= (and b!1330168 res!882608) b!1330163))

(assert (= (and b!1330163 res!882612) b!1330167))

(assert (= (and b!1330167 res!882615) b!1330161))

(assert (= (and b!1330161 res!882611) b!1330165))

(assert (= (and b!1330165 res!882610) b!1330159))

(assert (= (and b!1330159 res!882609) b!1330162))

(assert (= (and b!1330169 condMapEmpty!56533) mapIsEmpty!56533))

(assert (= (and b!1330169 (not condMapEmpty!56533)) mapNonEmpty!56533))

(get-info :version)

(assert (= (and mapNonEmpty!56533 ((_ is ValueCellFull!17388) mapValue!56533)) b!1330164))

(assert (= (and b!1330169 ((_ is ValueCellFull!17388) mapDefault!56533)) b!1330160))

(assert (= start!112268 b!1330169))

(declare-fun b_lambda!23923 () Bool)

(assert (=> (not b_lambda!23923) (not b!1330162)))

(declare-fun t!44871 () Bool)

(declare-fun tb!11879 () Bool)

(assert (=> (and start!112268 (= defaultEntry!1323 defaultEntry!1323) t!44871) tb!11879))

(declare-fun result!24829 () Bool)

(assert (=> tb!11879 (= result!24829 tp_is_empty!36573)))

(assert (=> b!1330162 t!44871))

(declare-fun b_and!49383 () Bool)

(assert (= b_and!49381 (and (=> t!44871 result!24829) b_and!49383)))

(declare-fun m!1218841 () Bool)

(assert (=> b!1330166 m!1218841))

(declare-fun m!1218843 () Bool)

(assert (=> b!1330161 m!1218843))

(declare-fun m!1218845 () Bool)

(assert (=> start!112268 m!1218845))

(declare-fun m!1218847 () Bool)

(assert (=> start!112268 m!1218847))

(declare-fun m!1218849 () Bool)

(assert (=> start!112268 m!1218849))

(declare-fun m!1218851 () Bool)

(assert (=> mapNonEmpty!56533 m!1218851))

(declare-fun m!1218853 () Bool)

(assert (=> b!1330162 m!1218853))

(declare-fun m!1218855 () Bool)

(assert (=> b!1330162 m!1218855))

(declare-fun m!1218857 () Bool)

(assert (=> b!1330162 m!1218857))

(declare-fun m!1218859 () Bool)

(assert (=> b!1330162 m!1218859))

(assert (=> b!1330162 m!1218853))

(declare-fun m!1218861 () Bool)

(assert (=> b!1330162 m!1218861))

(declare-fun m!1218863 () Bool)

(assert (=> b!1330162 m!1218863))

(assert (=> b!1330162 m!1218855))

(assert (=> b!1330162 m!1218859))

(declare-fun m!1218865 () Bool)

(assert (=> b!1330162 m!1218865))

(assert (=> b!1330162 m!1218843))

(declare-fun m!1218867 () Bool)

(assert (=> b!1330167 m!1218867))

(assert (=> b!1330167 m!1218867))

(declare-fun m!1218869 () Bool)

(assert (=> b!1330167 m!1218869))

(assert (=> b!1330165 m!1218843))

(assert (=> b!1330165 m!1218843))

(declare-fun m!1218871 () Bool)

(assert (=> b!1330165 m!1218871))

(declare-fun m!1218873 () Bool)

(assert (=> b!1330168 m!1218873))

(check-sat (not b!1330162) (not b_lambda!23923) (not b_next!30663) (not b!1330168) (not b!1330167) (not b!1330165) tp_is_empty!36573 b_and!49383 (not mapNonEmpty!56533) (not start!112268) (not b!1330166))
(check-sat b_and!49383 (not b_next!30663))
