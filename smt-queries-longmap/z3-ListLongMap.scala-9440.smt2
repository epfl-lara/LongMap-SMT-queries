; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112472 () Bool)

(assert start!112472)

(declare-fun b_free!30643 () Bool)

(declare-fun b_next!30643 () Bool)

(assert (=> start!112472 (= b_free!30643 (not b_next!30643))))

(declare-fun tp!107566 () Bool)

(declare-fun b_and!49343 () Bool)

(assert (=> start!112472 (= tp!107566 b_and!49343)))

(declare-fun mapIsEmpty!56503 () Bool)

(declare-fun mapRes!56503 () Bool)

(assert (=> mapIsEmpty!56503 mapRes!56503))

(declare-fun b!1331078 () Bool)

(declare-fun e!758866 () Bool)

(declare-fun tp_is_empty!36553 () Bool)

(assert (=> b!1331078 (= e!758866 tp_is_empty!36553)))

(declare-fun b!1331079 () Bool)

(declare-fun res!882859 () Bool)

(declare-fun e!758868 () Bool)

(assert (=> b!1331079 (=> (not res!882859) (not e!758868))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331079 (= res!882859 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!882863 () Bool)

(assert (=> start!112472 (=> (not res!882863) (not e!758868))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112472 (= res!882863 (validMask!0 mask!1998))))

(assert (=> start!112472 e!758868))

(declare-datatypes ((V!53841 0))(
  ( (V!53842 (val!18351 Int)) )
))
(declare-datatypes ((ValueCell!17378 0))(
  ( (ValueCellFull!17378 (v!20983 V!53841)) (EmptyCell!17378) )
))
(declare-datatypes ((array!90105 0))(
  ( (array!90106 (arr!43514 (Array (_ BitVec 32) ValueCell!17378)) (size!44065 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90105)

(declare-fun e!758865 () Bool)

(declare-fun array_inv!33113 (array!90105) Bool)

(assert (=> start!112472 (and (array_inv!33113 _values!1320) e!758865)))

(assert (=> start!112472 true))

(declare-datatypes ((array!90107 0))(
  ( (array!90108 (arr!43515 (Array (_ BitVec 32) (_ BitVec 64))) (size!44066 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90107)

(declare-fun array_inv!33114 (array!90107) Bool)

(assert (=> start!112472 (array_inv!33114 _keys!1590)))

(assert (=> start!112472 tp!107566))

(assert (=> start!112472 tp_is_empty!36553))

(declare-fun b!1331080 () Bool)

(declare-fun res!882858 () Bool)

(assert (=> b!1331080 (=> (not res!882858) (not e!758868))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331080 (= res!882858 (validKeyInArray!0 (select (arr!43515 _keys!1590) from!1980)))))

(declare-fun b!1331081 () Bool)

(declare-fun res!882861 () Bool)

(assert (=> b!1331081 (=> (not res!882861) (not e!758868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90107 (_ BitVec 32)) Bool)

(assert (=> b!1331081 (= res!882861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331082 () Bool)

(declare-fun res!882855 () Bool)

(assert (=> b!1331082 (=> (not res!882855) (not e!758868))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1331082 (= res!882855 (not (= (select (arr!43515 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331083 () Bool)

(declare-fun res!882862 () Bool)

(assert (=> b!1331083 (=> (not res!882862) (not e!758868))))

(assert (=> b!1331083 (= res!882862 (and (= (size!44065 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44066 _keys!1590) (size!44065 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331084 () Bool)

(assert (=> b!1331084 (= e!758868 (not true))))

(declare-datatypes ((tuple2!23662 0))(
  ( (tuple2!23663 (_1!11842 (_ BitVec 64)) (_2!11842 V!53841)) )
))
(declare-datatypes ((List!30834 0))(
  ( (Nil!30831) (Cons!30830 (h!32048 tuple2!23662) (t!44882 List!30834)) )
))
(declare-datatypes ((ListLongMap!21327 0))(
  ( (ListLongMap!21328 (toList!10679 List!30834)) )
))
(declare-fun lt!591486 () ListLongMap!21327)

(declare-fun contains!8855 (ListLongMap!21327 (_ BitVec 64)) Bool)

(assert (=> b!1331084 (contains!8855 lt!591486 k0!1153)))

(declare-datatypes ((Unit!43708 0))(
  ( (Unit!43709) )
))
(declare-fun lt!591485 () Unit!43708)

(declare-fun minValue!1262 () V!53841)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!242 ((_ BitVec 64) (_ BitVec 64) V!53841 ListLongMap!21327) Unit!43708)

(assert (=> b!1331084 (= lt!591485 (lemmaInListMapAfterAddingDiffThenInBefore!242 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591486))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53841)

(declare-fun +!4699 (ListLongMap!21327 tuple2!23662) ListLongMap!21327)

(declare-fun getCurrentListMapNoExtraKeys!6343 (array!90107 array!90105 (_ BitVec 32) (_ BitVec 32) V!53841 V!53841 (_ BitVec 32) Int) ListLongMap!21327)

(declare-fun get!21946 (ValueCell!17378 V!53841) V!53841)

(declare-fun dynLambda!3653 (Int (_ BitVec 64)) V!53841)

(assert (=> b!1331084 (= lt!591486 (+!4699 (getCurrentListMapNoExtraKeys!6343 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23663 (select (arr!43515 _keys!1590) from!1980) (get!21946 (select (arr!43514 _values!1320) from!1980) (dynLambda!3653 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1331085 () Bool)

(declare-fun res!882857 () Bool)

(assert (=> b!1331085 (=> (not res!882857) (not e!758868))))

(declare-fun getCurrentListMap!5652 (array!90107 array!90105 (_ BitVec 32) (_ BitVec 32) V!53841 V!53841 (_ BitVec 32) Int) ListLongMap!21327)

(assert (=> b!1331085 (= res!882857 (contains!8855 (getCurrentListMap!5652 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331086 () Bool)

(declare-fun e!758869 () Bool)

(assert (=> b!1331086 (= e!758865 (and e!758869 mapRes!56503))))

(declare-fun condMapEmpty!56503 () Bool)

(declare-fun mapDefault!56503 () ValueCell!17378)

(assert (=> b!1331086 (= condMapEmpty!56503 (= (arr!43514 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17378)) mapDefault!56503)))))

(declare-fun mapNonEmpty!56503 () Bool)

(declare-fun tp!107565 () Bool)

(assert (=> mapNonEmpty!56503 (= mapRes!56503 (and tp!107565 e!758866))))

(declare-fun mapRest!56503 () (Array (_ BitVec 32) ValueCell!17378))

(declare-fun mapValue!56503 () ValueCell!17378)

(declare-fun mapKey!56503 () (_ BitVec 32))

(assert (=> mapNonEmpty!56503 (= (arr!43514 _values!1320) (store mapRest!56503 mapKey!56503 mapValue!56503))))

(declare-fun b!1331087 () Bool)

(declare-fun res!882860 () Bool)

(assert (=> b!1331087 (=> (not res!882860) (not e!758868))))

(assert (=> b!1331087 (= res!882860 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44066 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331088 () Bool)

(assert (=> b!1331088 (= e!758869 tp_is_empty!36553)))

(declare-fun b!1331089 () Bool)

(declare-fun res!882856 () Bool)

(assert (=> b!1331089 (=> (not res!882856) (not e!758868))))

(declare-datatypes ((List!30835 0))(
  ( (Nil!30832) (Cons!30831 (h!32049 (_ BitVec 64)) (t!44883 List!30835)) )
))
(declare-fun arrayNoDuplicates!0 (array!90107 (_ BitVec 32) List!30835) Bool)

(assert (=> b!1331089 (= res!882856 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30832))))

(assert (= (and start!112472 res!882863) b!1331083))

(assert (= (and b!1331083 res!882862) b!1331081))

(assert (= (and b!1331081 res!882861) b!1331089))

(assert (= (and b!1331089 res!882856) b!1331087))

(assert (= (and b!1331087 res!882860) b!1331085))

(assert (= (and b!1331085 res!882857) b!1331082))

(assert (= (and b!1331082 res!882855) b!1331080))

(assert (= (and b!1331080 res!882858) b!1331079))

(assert (= (and b!1331079 res!882859) b!1331084))

(assert (= (and b!1331086 condMapEmpty!56503) mapIsEmpty!56503))

(assert (= (and b!1331086 (not condMapEmpty!56503)) mapNonEmpty!56503))

(get-info :version)

(assert (= (and mapNonEmpty!56503 ((_ is ValueCellFull!17378) mapValue!56503)) b!1331078))

(assert (= (and b!1331086 ((_ is ValueCellFull!17378) mapDefault!56503)) b!1331088))

(assert (= start!112472 b!1331086))

(declare-fun b_lambda!23897 () Bool)

(assert (=> (not b_lambda!23897) (not b!1331084)))

(declare-fun t!44881 () Bool)

(declare-fun tb!11851 () Bool)

(assert (=> (and start!112472 (= defaultEntry!1323 defaultEntry!1323) t!44881) tb!11851))

(declare-fun result!24781 () Bool)

(assert (=> tb!11851 (= result!24781 tp_is_empty!36553)))

(assert (=> b!1331084 t!44881))

(declare-fun b_and!49345 () Bool)

(assert (= b_and!49343 (and (=> t!44881 result!24781) b_and!49345)))

(declare-fun m!1220099 () Bool)

(assert (=> b!1331082 m!1220099))

(declare-fun m!1220101 () Bool)

(assert (=> b!1331085 m!1220101))

(assert (=> b!1331085 m!1220101))

(declare-fun m!1220103 () Bool)

(assert (=> b!1331085 m!1220103))

(assert (=> b!1331080 m!1220099))

(assert (=> b!1331080 m!1220099))

(declare-fun m!1220105 () Bool)

(assert (=> b!1331080 m!1220105))

(declare-fun m!1220107 () Bool)

(assert (=> b!1331089 m!1220107))

(declare-fun m!1220109 () Bool)

(assert (=> b!1331081 m!1220109))

(declare-fun m!1220111 () Bool)

(assert (=> b!1331084 m!1220111))

(declare-fun m!1220113 () Bool)

(assert (=> b!1331084 m!1220113))

(declare-fun m!1220115 () Bool)

(assert (=> b!1331084 m!1220115))

(declare-fun m!1220117 () Bool)

(assert (=> b!1331084 m!1220117))

(assert (=> b!1331084 m!1220111))

(declare-fun m!1220119 () Bool)

(assert (=> b!1331084 m!1220119))

(declare-fun m!1220121 () Bool)

(assert (=> b!1331084 m!1220121))

(assert (=> b!1331084 m!1220113))

(assert (=> b!1331084 m!1220117))

(declare-fun m!1220123 () Bool)

(assert (=> b!1331084 m!1220123))

(assert (=> b!1331084 m!1220099))

(declare-fun m!1220125 () Bool)

(assert (=> mapNonEmpty!56503 m!1220125))

(declare-fun m!1220127 () Bool)

(assert (=> start!112472 m!1220127))

(declare-fun m!1220129 () Bool)

(assert (=> start!112472 m!1220129))

(declare-fun m!1220131 () Bool)

(assert (=> start!112472 m!1220131))

(check-sat tp_is_empty!36553 (not b!1331089) (not b!1331084) (not b_next!30643) (not start!112472) b_and!49345 (not b!1331081) (not b_lambda!23897) (not b!1331085) (not mapNonEmpty!56503) (not b!1331080))
(check-sat b_and!49345 (not b_next!30643))
