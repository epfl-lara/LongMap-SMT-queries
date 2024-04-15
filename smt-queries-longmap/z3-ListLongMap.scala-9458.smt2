; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112356 () Bool)

(assert start!112356)

(declare-fun b_free!30751 () Bool)

(declare-fun b_next!30751 () Bool)

(assert (=> start!112356 (= b_free!30751 (not b_next!30751))))

(declare-fun tp!107891 () Bool)

(declare-fun b_and!49539 () Bool)

(assert (=> start!112356 (= tp!107891 b_and!49539)))

(declare-fun mapIsEmpty!56665 () Bool)

(declare-fun mapRes!56665 () Bool)

(assert (=> mapIsEmpty!56665 mapRes!56665))

(declare-fun b!1331761 () Bool)

(declare-fun res!883774 () Bool)

(declare-fun e!758799 () Bool)

(assert (=> b!1331761 (=> (not res!883774) (not e!758799))))

(declare-datatypes ((array!90141 0))(
  ( (array!90142 (arr!43537 (Array (_ BitVec 32) (_ BitVec 64))) (size!44089 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90141)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90141 (_ BitVec 32)) Bool)

(assert (=> b!1331761 (= res!883774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331762 () Bool)

(declare-fun res!883767 () Bool)

(assert (=> b!1331762 (=> (not res!883767) (not e!758799))))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1331762 (= res!883767 (not (= (select (arr!43537 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331763 () Bool)

(declare-fun res!883766 () Bool)

(assert (=> b!1331763 (=> (not res!883766) (not e!758799))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331763 (= res!883766 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44089 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331764 () Bool)

(declare-fun e!758801 () Bool)

(declare-fun e!758803 () Bool)

(assert (=> b!1331764 (= e!758801 (and e!758803 mapRes!56665))))

(declare-fun condMapEmpty!56665 () Bool)

(declare-datatypes ((V!53985 0))(
  ( (V!53986 (val!18405 Int)) )
))
(declare-datatypes ((ValueCell!17432 0))(
  ( (ValueCellFull!17432 (v!21041 V!53985)) (EmptyCell!17432) )
))
(declare-datatypes ((array!90143 0))(
  ( (array!90144 (arr!43538 (Array (_ BitVec 32) ValueCell!17432)) (size!44090 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90143)

(declare-fun mapDefault!56665 () ValueCell!17432)

(assert (=> b!1331764 (= condMapEmpty!56665 (= (arr!43538 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17432)) mapDefault!56665)))))

(declare-fun b!1331765 () Bool)

(assert (=> b!1331765 (= e!758799 (not true))))

(declare-datatypes ((tuple2!23784 0))(
  ( (tuple2!23785 (_1!11903 (_ BitVec 64)) (_2!11903 V!53985)) )
))
(declare-datatypes ((List!30921 0))(
  ( (Nil!30918) (Cons!30917 (h!32126 tuple2!23784) (t!45077 List!30921)) )
))
(declare-datatypes ((ListLongMap!21441 0))(
  ( (ListLongMap!21442 (toList!10736 List!30921)) )
))
(declare-fun lt!591533 () ListLongMap!21441)

(declare-fun minValue!1262 () V!53985)

(declare-fun contains!8828 (ListLongMap!21441 (_ BitVec 64)) Bool)

(declare-fun +!4715 (ListLongMap!21441 tuple2!23784) ListLongMap!21441)

(assert (=> b!1331765 (contains!8828 (+!4715 lt!591533 (tuple2!23785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43642 0))(
  ( (Unit!43643) )
))
(declare-fun lt!591538 () Unit!43642)

(declare-fun addStillContains!1169 (ListLongMap!21441 (_ BitVec 64) V!53985 (_ BitVec 64)) Unit!43642)

(assert (=> b!1331765 (= lt!591538 (addStillContains!1169 lt!591533 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1331765 (contains!8828 lt!591533 k0!1153)))

(declare-fun lt!591536 () Unit!43642)

(declare-fun lt!591535 () V!53985)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!271 ((_ BitVec 64) (_ BitVec 64) V!53985 ListLongMap!21441) Unit!43642)

(assert (=> b!1331765 (= lt!591536 (lemmaInListMapAfterAddingDiffThenInBefore!271 k0!1153 (select (arr!43537 _keys!1590) from!1980) lt!591535 lt!591533))))

(declare-fun lt!591537 () ListLongMap!21441)

(assert (=> b!1331765 (contains!8828 lt!591537 k0!1153)))

(declare-fun lt!591534 () Unit!43642)

(assert (=> b!1331765 (= lt!591534 (lemmaInListMapAfterAddingDiffThenInBefore!271 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591537))))

(assert (=> b!1331765 (= lt!591537 (+!4715 lt!591533 (tuple2!23785 (select (arr!43537 _keys!1590) from!1980) lt!591535)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21962 (ValueCell!17432 V!53985) V!53985)

(declare-fun dynLambda!3645 (Int (_ BitVec 64)) V!53985)

(assert (=> b!1331765 (= lt!591535 (get!21962 (select (arr!43538 _values!1320) from!1980) (dynLambda!3645 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!53985)

(declare-fun getCurrentListMapNoExtraKeys!6353 (array!90141 array!90143 (_ BitVec 32) (_ BitVec 32) V!53985 V!53985 (_ BitVec 32) Int) ListLongMap!21441)

(assert (=> b!1331765 (= lt!591533 (getCurrentListMapNoExtraKeys!6353 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun res!883769 () Bool)

(assert (=> start!112356 (=> (not res!883769) (not e!758799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112356 (= res!883769 (validMask!0 mask!1998))))

(assert (=> start!112356 e!758799))

(declare-fun array_inv!33019 (array!90143) Bool)

(assert (=> start!112356 (and (array_inv!33019 _values!1320) e!758801)))

(assert (=> start!112356 true))

(declare-fun array_inv!33020 (array!90141) Bool)

(assert (=> start!112356 (array_inv!33020 _keys!1590)))

(assert (=> start!112356 tp!107891))

(declare-fun tp_is_empty!36661 () Bool)

(assert (=> start!112356 tp_is_empty!36661))

(declare-fun b!1331766 () Bool)

(assert (=> b!1331766 (= e!758803 tp_is_empty!36661)))

(declare-fun b!1331767 () Bool)

(declare-fun res!883771 () Bool)

(assert (=> b!1331767 (=> (not res!883771) (not e!758799))))

(assert (=> b!1331767 (= res!883771 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331768 () Bool)

(declare-fun e!758800 () Bool)

(assert (=> b!1331768 (= e!758800 tp_is_empty!36661)))

(declare-fun b!1331769 () Bool)

(declare-fun res!883772 () Bool)

(assert (=> b!1331769 (=> (not res!883772) (not e!758799))))

(declare-datatypes ((List!30922 0))(
  ( (Nil!30919) (Cons!30918 (h!32127 (_ BitVec 64)) (t!45078 List!30922)) )
))
(declare-fun arrayNoDuplicates!0 (array!90141 (_ BitVec 32) List!30922) Bool)

(assert (=> b!1331769 (= res!883772 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30919))))

(declare-fun mapNonEmpty!56665 () Bool)

(declare-fun tp!107890 () Bool)

(assert (=> mapNonEmpty!56665 (= mapRes!56665 (and tp!107890 e!758800))))

(declare-fun mapValue!56665 () ValueCell!17432)

(declare-fun mapRest!56665 () (Array (_ BitVec 32) ValueCell!17432))

(declare-fun mapKey!56665 () (_ BitVec 32))

(assert (=> mapNonEmpty!56665 (= (arr!43538 _values!1320) (store mapRest!56665 mapKey!56665 mapValue!56665))))

(declare-fun b!1331770 () Bool)

(declare-fun res!883773 () Bool)

(assert (=> b!1331770 (=> (not res!883773) (not e!758799))))

(declare-fun getCurrentListMap!5596 (array!90141 array!90143 (_ BitVec 32) (_ BitVec 32) V!53985 V!53985 (_ BitVec 32) Int) ListLongMap!21441)

(assert (=> b!1331770 (= res!883773 (contains!8828 (getCurrentListMap!5596 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331771 () Bool)

(declare-fun res!883768 () Bool)

(assert (=> b!1331771 (=> (not res!883768) (not e!758799))))

(assert (=> b!1331771 (= res!883768 (and (= (size!44090 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44089 _keys!1590) (size!44090 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331772 () Bool)

(declare-fun res!883770 () Bool)

(assert (=> b!1331772 (=> (not res!883770) (not e!758799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331772 (= res!883770 (validKeyInArray!0 (select (arr!43537 _keys!1590) from!1980)))))

(assert (= (and start!112356 res!883769) b!1331771))

(assert (= (and b!1331771 res!883768) b!1331761))

(assert (= (and b!1331761 res!883774) b!1331769))

(assert (= (and b!1331769 res!883772) b!1331763))

(assert (= (and b!1331763 res!883766) b!1331770))

(assert (= (and b!1331770 res!883773) b!1331762))

(assert (= (and b!1331762 res!883767) b!1331772))

(assert (= (and b!1331772 res!883770) b!1331767))

(assert (= (and b!1331767 res!883771) b!1331765))

(assert (= (and b!1331764 condMapEmpty!56665) mapIsEmpty!56665))

(assert (= (and b!1331764 (not condMapEmpty!56665)) mapNonEmpty!56665))

(get-info :version)

(assert (= (and mapNonEmpty!56665 ((_ is ValueCellFull!17432) mapValue!56665)) b!1331768))

(assert (= (and b!1331764 ((_ is ValueCellFull!17432) mapDefault!56665)) b!1331766))

(assert (= start!112356 b!1331764))

(declare-fun b_lambda!24001 () Bool)

(assert (=> (not b_lambda!24001) (not b!1331765)))

(declare-fun t!45076 () Bool)

(declare-fun tb!11959 () Bool)

(assert (=> (and start!112356 (= defaultEntry!1323 defaultEntry!1323) t!45076) tb!11959))

(declare-fun result!24997 () Bool)

(assert (=> tb!11959 (= result!24997 tp_is_empty!36661)))

(assert (=> b!1331765 t!45076))

(declare-fun b_and!49541 () Bool)

(assert (= b_and!49539 (and (=> t!45076 result!24997) b_and!49541)))

(declare-fun m!1220031 () Bool)

(assert (=> b!1331769 m!1220031))

(declare-fun m!1220033 () Bool)

(assert (=> b!1331761 m!1220033))

(declare-fun m!1220035 () Bool)

(assert (=> b!1331772 m!1220035))

(assert (=> b!1331772 m!1220035))

(declare-fun m!1220037 () Bool)

(assert (=> b!1331772 m!1220037))

(assert (=> b!1331762 m!1220035))

(declare-fun m!1220039 () Bool)

(assert (=> b!1331765 m!1220039))

(declare-fun m!1220041 () Bool)

(assert (=> b!1331765 m!1220041))

(declare-fun m!1220043 () Bool)

(assert (=> b!1331765 m!1220043))

(assert (=> b!1331765 m!1220041))

(declare-fun m!1220045 () Bool)

(assert (=> b!1331765 m!1220045))

(declare-fun m!1220047 () Bool)

(assert (=> b!1331765 m!1220047))

(declare-fun m!1220049 () Bool)

(assert (=> b!1331765 m!1220049))

(declare-fun m!1220051 () Bool)

(assert (=> b!1331765 m!1220051))

(assert (=> b!1331765 m!1220035))

(declare-fun m!1220053 () Bool)

(assert (=> b!1331765 m!1220053))

(declare-fun m!1220055 () Bool)

(assert (=> b!1331765 m!1220055))

(declare-fun m!1220057 () Bool)

(assert (=> b!1331765 m!1220057))

(assert (=> b!1331765 m!1220043))

(assert (=> b!1331765 m!1220047))

(declare-fun m!1220059 () Bool)

(assert (=> b!1331765 m!1220059))

(declare-fun m!1220061 () Bool)

(assert (=> b!1331765 m!1220061))

(assert (=> b!1331765 m!1220035))

(declare-fun m!1220063 () Bool)

(assert (=> mapNonEmpty!56665 m!1220063))

(declare-fun m!1220065 () Bool)

(assert (=> start!112356 m!1220065))

(declare-fun m!1220067 () Bool)

(assert (=> start!112356 m!1220067))

(declare-fun m!1220069 () Bool)

(assert (=> start!112356 m!1220069))

(declare-fun m!1220071 () Bool)

(assert (=> b!1331770 m!1220071))

(assert (=> b!1331770 m!1220071))

(declare-fun m!1220073 () Bool)

(assert (=> b!1331770 m!1220073))

(check-sat (not b!1331772) (not b!1331769) (not b!1331761) (not mapNonEmpty!56665) tp_is_empty!36661 (not b!1331770) (not b_next!30751) (not start!112356) (not b!1331765) (not b_lambda!24001) b_and!49541)
(check-sat b_and!49541 (not b_next!30751))
