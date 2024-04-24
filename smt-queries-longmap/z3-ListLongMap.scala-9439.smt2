; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112466 () Bool)

(assert start!112466)

(declare-fun b_free!30637 () Bool)

(declare-fun b_next!30637 () Bool)

(assert (=> start!112466 (= b_free!30637 (not b_next!30637))))

(declare-fun tp!107547 () Bool)

(declare-fun b_and!49331 () Bool)

(assert (=> start!112466 (= tp!107547 b_and!49331)))

(declare-fun b!1330964 () Bool)

(declare-fun e!758820 () Bool)

(declare-fun tp_is_empty!36547 () Bool)

(assert (=> b!1330964 (= e!758820 tp_is_empty!36547)))

(declare-fun mapNonEmpty!56494 () Bool)

(declare-fun mapRes!56494 () Bool)

(declare-fun tp!107548 () Bool)

(declare-fun e!758823 () Bool)

(assert (=> mapNonEmpty!56494 (= mapRes!56494 (and tp!107548 e!758823))))

(declare-datatypes ((V!53833 0))(
  ( (V!53834 (val!18348 Int)) )
))
(declare-datatypes ((ValueCell!17375 0))(
  ( (ValueCellFull!17375 (v!20980 V!53833)) (EmptyCell!17375) )
))
(declare-datatypes ((array!90093 0))(
  ( (array!90094 (arr!43508 (Array (_ BitVec 32) ValueCell!17375)) (size!44059 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90093)

(declare-fun mapRest!56494 () (Array (_ BitVec 32) ValueCell!17375))

(declare-fun mapKey!56494 () (_ BitVec 32))

(declare-fun mapValue!56494 () ValueCell!17375)

(assert (=> mapNonEmpty!56494 (= (arr!43508 _values!1320) (store mapRest!56494 mapKey!56494 mapValue!56494))))

(declare-fun res!882774 () Bool)

(declare-fun e!758824 () Bool)

(assert (=> start!112466 (=> (not res!882774) (not e!758824))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112466 (= res!882774 (validMask!0 mask!1998))))

(assert (=> start!112466 e!758824))

(declare-fun e!758822 () Bool)

(declare-fun array_inv!33109 (array!90093) Bool)

(assert (=> start!112466 (and (array_inv!33109 _values!1320) e!758822)))

(assert (=> start!112466 true))

(declare-datatypes ((array!90095 0))(
  ( (array!90096 (arr!43509 (Array (_ BitVec 32) (_ BitVec 64))) (size!44060 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90095)

(declare-fun array_inv!33110 (array!90095) Bool)

(assert (=> start!112466 (array_inv!33110 _keys!1590)))

(assert (=> start!112466 tp!107547))

(assert (=> start!112466 tp_is_empty!36547))

(declare-fun b!1330965 () Bool)

(declare-fun res!882779 () Bool)

(assert (=> b!1330965 (=> (not res!882779) (not e!758824))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53833)

(declare-fun zeroValue!1262 () V!53833)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23656 0))(
  ( (tuple2!23657 (_1!11839 (_ BitVec 64)) (_2!11839 V!53833)) )
))
(declare-datatypes ((List!30828 0))(
  ( (Nil!30825) (Cons!30824 (h!32042 tuple2!23656) (t!44870 List!30828)) )
))
(declare-datatypes ((ListLongMap!21321 0))(
  ( (ListLongMap!21322 (toList!10676 List!30828)) )
))
(declare-fun contains!8852 (ListLongMap!21321 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5649 (array!90095 array!90093 (_ BitVec 32) (_ BitVec 32) V!53833 V!53833 (_ BitVec 32) Int) ListLongMap!21321)

(assert (=> b!1330965 (= res!882779 (contains!8852 (getCurrentListMap!5649 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330966 () Bool)

(assert (=> b!1330966 (= e!758823 tp_is_empty!36547)))

(declare-fun b!1330967 () Bool)

(declare-fun res!882776 () Bool)

(assert (=> b!1330967 (=> (not res!882776) (not e!758824))))

(assert (=> b!1330967 (= res!882776 (and (= (size!44059 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44060 _keys!1590) (size!44059 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330968 () Bool)

(declare-fun res!882778 () Bool)

(assert (=> b!1330968 (=> (not res!882778) (not e!758824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330968 (= res!882778 (validKeyInArray!0 (select (arr!43509 _keys!1590) from!1980)))))

(declare-fun b!1330969 () Bool)

(declare-fun res!882775 () Bool)

(assert (=> b!1330969 (=> (not res!882775) (not e!758824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90095 (_ BitVec 32)) Bool)

(assert (=> b!1330969 (= res!882775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56494 () Bool)

(assert (=> mapIsEmpty!56494 mapRes!56494))

(declare-fun b!1330970 () Bool)

(assert (=> b!1330970 (= e!758822 (and e!758820 mapRes!56494))))

(declare-fun condMapEmpty!56494 () Bool)

(declare-fun mapDefault!56494 () ValueCell!17375)

(assert (=> b!1330970 (= condMapEmpty!56494 (= (arr!43508 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17375)) mapDefault!56494)))))

(declare-fun b!1330971 () Bool)

(declare-fun res!882780 () Bool)

(assert (=> b!1330971 (=> (not res!882780) (not e!758824))))

(assert (=> b!1330971 (= res!882780 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330972 () Bool)

(declare-fun res!882781 () Bool)

(assert (=> b!1330972 (=> (not res!882781) (not e!758824))))

(assert (=> b!1330972 (= res!882781 (not (= (select (arr!43509 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330973 () Bool)

(declare-fun res!882777 () Bool)

(assert (=> b!1330973 (=> (not res!882777) (not e!758824))))

(declare-datatypes ((List!30829 0))(
  ( (Nil!30826) (Cons!30825 (h!32043 (_ BitVec 64)) (t!44871 List!30829)) )
))
(declare-fun arrayNoDuplicates!0 (array!90095 (_ BitVec 32) List!30829) Bool)

(assert (=> b!1330973 (= res!882777 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30826))))

(declare-fun b!1330974 () Bool)

(declare-fun res!882782 () Bool)

(assert (=> b!1330974 (=> (not res!882782) (not e!758824))))

(assert (=> b!1330974 (= res!882782 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44060 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330975 () Bool)

(assert (=> b!1330975 (= e!758824 (not true))))

(declare-fun lt!591468 () ListLongMap!21321)

(assert (=> b!1330975 (contains!8852 lt!591468 k0!1153)))

(declare-datatypes ((Unit!43704 0))(
  ( (Unit!43705) )
))
(declare-fun lt!591467 () Unit!43704)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!240 ((_ BitVec 64) (_ BitVec 64) V!53833 ListLongMap!21321) Unit!43704)

(assert (=> b!1330975 (= lt!591467 (lemmaInListMapAfterAddingDiffThenInBefore!240 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591468))))

(declare-fun +!4697 (ListLongMap!21321 tuple2!23656) ListLongMap!21321)

(declare-fun getCurrentListMapNoExtraKeys!6341 (array!90095 array!90093 (_ BitVec 32) (_ BitVec 32) V!53833 V!53833 (_ BitVec 32) Int) ListLongMap!21321)

(declare-fun get!21942 (ValueCell!17375 V!53833) V!53833)

(declare-fun dynLambda!3651 (Int (_ BitVec 64)) V!53833)

(assert (=> b!1330975 (= lt!591468 (+!4697 (getCurrentListMapNoExtraKeys!6341 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23657 (select (arr!43509 _keys!1590) from!1980) (get!21942 (select (arr!43508 _values!1320) from!1980) (dynLambda!3651 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!112466 res!882774) b!1330967))

(assert (= (and b!1330967 res!882776) b!1330969))

(assert (= (and b!1330969 res!882775) b!1330973))

(assert (= (and b!1330973 res!882777) b!1330974))

(assert (= (and b!1330974 res!882782) b!1330965))

(assert (= (and b!1330965 res!882779) b!1330972))

(assert (= (and b!1330972 res!882781) b!1330968))

(assert (= (and b!1330968 res!882778) b!1330971))

(assert (= (and b!1330971 res!882780) b!1330975))

(assert (= (and b!1330970 condMapEmpty!56494) mapIsEmpty!56494))

(assert (= (and b!1330970 (not condMapEmpty!56494)) mapNonEmpty!56494))

(get-info :version)

(assert (= (and mapNonEmpty!56494 ((_ is ValueCellFull!17375) mapValue!56494)) b!1330966))

(assert (= (and b!1330970 ((_ is ValueCellFull!17375) mapDefault!56494)) b!1330964))

(assert (= start!112466 b!1330970))

(declare-fun b_lambda!23891 () Bool)

(assert (=> (not b_lambda!23891) (not b!1330975)))

(declare-fun t!44869 () Bool)

(declare-fun tb!11845 () Bool)

(assert (=> (and start!112466 (= defaultEntry!1323 defaultEntry!1323) t!44869) tb!11845))

(declare-fun result!24769 () Bool)

(assert (=> tb!11845 (= result!24769 tp_is_empty!36547)))

(assert (=> b!1330975 t!44869))

(declare-fun b_and!49333 () Bool)

(assert (= b_and!49331 (and (=> t!44869 result!24769) b_and!49333)))

(declare-fun m!1219997 () Bool)

(assert (=> start!112466 m!1219997))

(declare-fun m!1219999 () Bool)

(assert (=> start!112466 m!1219999))

(declare-fun m!1220001 () Bool)

(assert (=> start!112466 m!1220001))

(declare-fun m!1220003 () Bool)

(assert (=> b!1330975 m!1220003))

(declare-fun m!1220005 () Bool)

(assert (=> b!1330975 m!1220005))

(declare-fun m!1220007 () Bool)

(assert (=> b!1330975 m!1220007))

(declare-fun m!1220009 () Bool)

(assert (=> b!1330975 m!1220009))

(assert (=> b!1330975 m!1220003))

(declare-fun m!1220011 () Bool)

(assert (=> b!1330975 m!1220011))

(assert (=> b!1330975 m!1220005))

(assert (=> b!1330975 m!1220009))

(declare-fun m!1220013 () Bool)

(assert (=> b!1330975 m!1220013))

(declare-fun m!1220015 () Bool)

(assert (=> b!1330975 m!1220015))

(declare-fun m!1220017 () Bool)

(assert (=> b!1330975 m!1220017))

(declare-fun m!1220019 () Bool)

(assert (=> b!1330973 m!1220019))

(assert (=> b!1330968 m!1220013))

(assert (=> b!1330968 m!1220013))

(declare-fun m!1220021 () Bool)

(assert (=> b!1330968 m!1220021))

(declare-fun m!1220023 () Bool)

(assert (=> mapNonEmpty!56494 m!1220023))

(declare-fun m!1220025 () Bool)

(assert (=> b!1330965 m!1220025))

(assert (=> b!1330965 m!1220025))

(declare-fun m!1220027 () Bool)

(assert (=> b!1330965 m!1220027))

(assert (=> b!1330972 m!1220013))

(declare-fun m!1220029 () Bool)

(assert (=> b!1330969 m!1220029))

(check-sat (not b!1330965) (not b_lambda!23891) (not b!1330973) (not b!1330975) (not start!112466) (not mapNonEmpty!56494) tp_is_empty!36547 (not b!1330969) b_and!49333 (not b!1330968) (not b_next!30637))
(check-sat b_and!49333 (not b_next!30637))
