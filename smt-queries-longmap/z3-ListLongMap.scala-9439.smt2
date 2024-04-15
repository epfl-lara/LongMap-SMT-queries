; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112242 () Bool)

(assert start!112242)

(declare-fun b_free!30637 () Bool)

(declare-fun b_next!30637 () Bool)

(assert (=> start!112242 (= b_free!30637 (not b_next!30637))))

(declare-fun tp!107549 () Bool)

(declare-fun b_and!49311 () Bool)

(assert (=> start!112242 (= tp!107549 b_and!49311)))

(declare-fun b!1329595 () Bool)

(declare-fun res!882230 () Bool)

(declare-fun e!757944 () Bool)

(assert (=> b!1329595 (=> (not res!882230) (not e!757944))))

(declare-datatypes ((V!53833 0))(
  ( (V!53834 (val!18348 Int)) )
))
(declare-datatypes ((ValueCell!17375 0))(
  ( (ValueCellFull!17375 (v!20984 V!53833)) (EmptyCell!17375) )
))
(declare-datatypes ((array!89917 0))(
  ( (array!89918 (arr!43425 (Array (_ BitVec 32) ValueCell!17375)) (size!43977 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89917)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89919 0))(
  ( (array!89920 (arr!43426 (Array (_ BitVec 32) (_ BitVec 64))) (size!43978 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89919)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53833)

(declare-fun zeroValue!1262 () V!53833)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23684 0))(
  ( (tuple2!23685 (_1!11853 (_ BitVec 64)) (_2!11853 V!53833)) )
))
(declare-datatypes ((List!30832 0))(
  ( (Nil!30829) (Cons!30828 (h!32037 tuple2!23684) (t!44874 List!30832)) )
))
(declare-datatypes ((ListLongMap!21341 0))(
  ( (ListLongMap!21342 (toList!10686 List!30832)) )
))
(declare-fun contains!8778 (ListLongMap!21341 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5555 (array!89919 array!89917 (_ BitVec 32) (_ BitVec 32) V!53833 V!53833 (_ BitVec 32) Int) ListLongMap!21341)

(assert (=> b!1329595 (= res!882230 (contains!8778 (getCurrentListMap!5555 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329596 () Bool)

(declare-fun res!882229 () Bool)

(assert (=> b!1329596 (=> (not res!882229) (not e!757944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89919 (_ BitVec 32)) Bool)

(assert (=> b!1329596 (= res!882229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329597 () Bool)

(declare-fun res!882227 () Bool)

(assert (=> b!1329597 (=> (not res!882227) (not e!757944))))

(assert (=> b!1329597 (= res!882227 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!56494 () Bool)

(declare-fun mapRes!56494 () Bool)

(declare-fun tp!107548 () Bool)

(declare-fun e!757948 () Bool)

(assert (=> mapNonEmpty!56494 (= mapRes!56494 (and tp!107548 e!757948))))

(declare-fun mapRest!56494 () (Array (_ BitVec 32) ValueCell!17375))

(declare-fun mapKey!56494 () (_ BitVec 32))

(declare-fun mapValue!56494 () ValueCell!17375)

(assert (=> mapNonEmpty!56494 (= (arr!43425 _values!1320) (store mapRest!56494 mapKey!56494 mapValue!56494))))

(declare-fun b!1329598 () Bool)

(declare-fun e!757947 () Bool)

(declare-fun e!757946 () Bool)

(assert (=> b!1329598 (= e!757947 (and e!757946 mapRes!56494))))

(declare-fun condMapEmpty!56494 () Bool)

(declare-fun mapDefault!56494 () ValueCell!17375)

(assert (=> b!1329598 (= condMapEmpty!56494 (= (arr!43425 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17375)) mapDefault!56494)))))

(declare-fun mapIsEmpty!56494 () Bool)

(assert (=> mapIsEmpty!56494 mapRes!56494))

(declare-fun b!1329599 () Bool)

(declare-fun res!882235 () Bool)

(assert (=> b!1329599 (=> (not res!882235) (not e!757944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329599 (= res!882235 (validKeyInArray!0 (select (arr!43426 _keys!1590) from!1980)))))

(declare-fun res!882234 () Bool)

(assert (=> start!112242 (=> (not res!882234) (not e!757944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112242 (= res!882234 (validMask!0 mask!1998))))

(assert (=> start!112242 e!757944))

(declare-fun array_inv!32933 (array!89917) Bool)

(assert (=> start!112242 (and (array_inv!32933 _values!1320) e!757947)))

(assert (=> start!112242 true))

(declare-fun array_inv!32934 (array!89919) Bool)

(assert (=> start!112242 (array_inv!32934 _keys!1590)))

(assert (=> start!112242 tp!107549))

(declare-fun tp_is_empty!36547 () Bool)

(assert (=> start!112242 tp_is_empty!36547))

(declare-fun b!1329600 () Bool)

(assert (=> b!1329600 (= e!757948 tp_is_empty!36547)))

(declare-fun b!1329601 () Bool)

(declare-fun res!882232 () Bool)

(assert (=> b!1329601 (=> (not res!882232) (not e!757944))))

(assert (=> b!1329601 (= res!882232 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43978 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329602 () Bool)

(assert (=> b!1329602 (= e!757946 tp_is_empty!36547)))

(declare-fun b!1329603 () Bool)

(declare-fun res!882228 () Bool)

(assert (=> b!1329603 (=> (not res!882228) (not e!757944))))

(assert (=> b!1329603 (= res!882228 (not (= (select (arr!43426 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1329604 () Bool)

(declare-fun res!882231 () Bool)

(assert (=> b!1329604 (=> (not res!882231) (not e!757944))))

(assert (=> b!1329604 (= res!882231 (and (= (size!43977 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43978 _keys!1590) (size!43977 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329605 () Bool)

(declare-fun res!882233 () Bool)

(assert (=> b!1329605 (=> (not res!882233) (not e!757944))))

(declare-datatypes ((List!30833 0))(
  ( (Nil!30830) (Cons!30829 (h!32038 (_ BitVec 64)) (t!44875 List!30833)) )
))
(declare-fun arrayNoDuplicates!0 (array!89919 (_ BitVec 32) List!30833) Bool)

(assert (=> b!1329605 (= res!882233 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30830))))

(declare-fun b!1329606 () Bool)

(assert (=> b!1329606 (= e!757944 (not true))))

(declare-fun lt!590806 () ListLongMap!21341)

(assert (=> b!1329606 (contains!8778 lt!590806 k0!1153)))

(declare-datatypes ((Unit!43556 0))(
  ( (Unit!43557) )
))
(declare-fun lt!590805 () Unit!43556)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!228 ((_ BitVec 64) (_ BitVec 64) V!53833 ListLongMap!21341) Unit!43556)

(assert (=> b!1329606 (= lt!590805 (lemmaInListMapAfterAddingDiffThenInBefore!228 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590806))))

(declare-fun +!4672 (ListLongMap!21341 tuple2!23684) ListLongMap!21341)

(declare-fun getCurrentListMapNoExtraKeys!6310 (array!89919 array!89917 (_ BitVec 32) (_ BitVec 32) V!53833 V!53833 (_ BitVec 32) Int) ListLongMap!21341)

(declare-fun get!21881 (ValueCell!17375 V!53833) V!53833)

(declare-fun dynLambda!3602 (Int (_ BitVec 64)) V!53833)

(assert (=> b!1329606 (= lt!590806 (+!4672 (getCurrentListMapNoExtraKeys!6310 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23685 (select (arr!43426 _keys!1590) from!1980) (get!21881 (select (arr!43425 _values!1320) from!1980) (dynLambda!3602 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!112242 res!882234) b!1329604))

(assert (= (and b!1329604 res!882231) b!1329596))

(assert (= (and b!1329596 res!882229) b!1329605))

(assert (= (and b!1329605 res!882233) b!1329601))

(assert (= (and b!1329601 res!882232) b!1329595))

(assert (= (and b!1329595 res!882230) b!1329603))

(assert (= (and b!1329603 res!882228) b!1329599))

(assert (= (and b!1329599 res!882235) b!1329597))

(assert (= (and b!1329597 res!882227) b!1329606))

(assert (= (and b!1329598 condMapEmpty!56494) mapIsEmpty!56494))

(assert (= (and b!1329598 (not condMapEmpty!56494)) mapNonEmpty!56494))

(get-info :version)

(assert (= (and mapNonEmpty!56494 ((_ is ValueCellFull!17375) mapValue!56494)) b!1329600))

(assert (= (and b!1329598 ((_ is ValueCellFull!17375) mapDefault!56494)) b!1329602))

(assert (= start!112242 b!1329598))

(declare-fun b_lambda!23887 () Bool)

(assert (=> (not b_lambda!23887) (not b!1329606)))

(declare-fun t!44873 () Bool)

(declare-fun tb!11845 () Bool)

(assert (=> (and start!112242 (= defaultEntry!1323 defaultEntry!1323) t!44873) tb!11845))

(declare-fun result!24769 () Bool)

(assert (=> tb!11845 (= result!24769 tp_is_empty!36547)))

(assert (=> b!1329606 t!44873))

(declare-fun b_and!49313 () Bool)

(assert (= b_and!49311 (and (=> t!44873 result!24769) b_and!49313)))

(declare-fun m!1217883 () Bool)

(assert (=> b!1329596 m!1217883))

(declare-fun m!1217885 () Bool)

(assert (=> mapNonEmpty!56494 m!1217885))

(declare-fun m!1217887 () Bool)

(assert (=> b!1329605 m!1217887))

(declare-fun m!1217889 () Bool)

(assert (=> b!1329603 m!1217889))

(assert (=> b!1329599 m!1217889))

(assert (=> b!1329599 m!1217889))

(declare-fun m!1217891 () Bool)

(assert (=> b!1329599 m!1217891))

(declare-fun m!1217893 () Bool)

(assert (=> b!1329606 m!1217893))

(declare-fun m!1217895 () Bool)

(assert (=> b!1329606 m!1217895))

(declare-fun m!1217897 () Bool)

(assert (=> b!1329606 m!1217897))

(declare-fun m!1217899 () Bool)

(assert (=> b!1329606 m!1217899))

(assert (=> b!1329606 m!1217893))

(declare-fun m!1217901 () Bool)

(assert (=> b!1329606 m!1217901))

(declare-fun m!1217903 () Bool)

(assert (=> b!1329606 m!1217903))

(assert (=> b!1329606 m!1217895))

(declare-fun m!1217905 () Bool)

(assert (=> b!1329606 m!1217905))

(assert (=> b!1329606 m!1217899))

(assert (=> b!1329606 m!1217889))

(declare-fun m!1217907 () Bool)

(assert (=> b!1329595 m!1217907))

(assert (=> b!1329595 m!1217907))

(declare-fun m!1217909 () Bool)

(assert (=> b!1329595 m!1217909))

(declare-fun m!1217911 () Bool)

(assert (=> start!112242 m!1217911))

(declare-fun m!1217913 () Bool)

(assert (=> start!112242 m!1217913))

(declare-fun m!1217915 () Bool)

(assert (=> start!112242 m!1217915))

(check-sat (not b!1329599) (not b_lambda!23887) b_and!49313 (not b_next!30637) (not mapNonEmpty!56494) (not b!1329605) (not b!1329596) (not b!1329595) (not start!112242) (not b!1329606) tp_is_empty!36547)
(check-sat b_and!49313 (not b_next!30637))
