; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112302 () Bool)

(assert start!112302)

(declare-fun b_free!30697 () Bool)

(declare-fun b_next!30697 () Bool)

(assert (=> start!112302 (= b_free!30697 (not b_next!30697))))

(declare-fun tp!107729 () Bool)

(declare-fun b_and!49431 () Bool)

(assert (=> start!112302 (= tp!107729 b_and!49431)))

(declare-fun res!883039 () Bool)

(declare-fun e!758395 () Bool)

(assert (=> start!112302 (=> (not res!883039) (not e!758395))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112302 (= res!883039 (validMask!0 mask!1998))))

(assert (=> start!112302 e!758395))

(declare-datatypes ((V!53913 0))(
  ( (V!53914 (val!18378 Int)) )
))
(declare-datatypes ((ValueCell!17405 0))(
  ( (ValueCellFull!17405 (v!21014 V!53913)) (EmptyCell!17405) )
))
(declare-datatypes ((array!90033 0))(
  ( (array!90034 (arr!43483 (Array (_ BitVec 32) ValueCell!17405)) (size!44035 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90033)

(declare-fun e!758398 () Bool)

(declare-fun array_inv!32979 (array!90033) Bool)

(assert (=> start!112302 (and (array_inv!32979 _values!1320) e!758398)))

(assert (=> start!112302 true))

(declare-datatypes ((array!90035 0))(
  ( (array!90036 (arr!43484 (Array (_ BitVec 32) (_ BitVec 64))) (size!44036 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90035)

(declare-fun array_inv!32980 (array!90035) Bool)

(assert (=> start!112302 (array_inv!32980 _keys!1590)))

(assert (=> start!112302 tp!107729))

(declare-fun tp_is_empty!36607 () Bool)

(assert (=> start!112302 tp_is_empty!36607))

(declare-fun b!1330735 () Bool)

(declare-fun res!883043 () Bool)

(assert (=> b!1330735 (=> (not res!883043) (not e!758395))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1330735 (= res!883043 (and (= (size!44035 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44036 _keys!1590) (size!44035 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56584 () Bool)

(declare-fun mapRes!56584 () Bool)

(assert (=> mapIsEmpty!56584 mapRes!56584))

(declare-fun b!1330736 () Bool)

(declare-fun res!883041 () Bool)

(assert (=> b!1330736 (=> (not res!883041) (not e!758395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90035 (_ BitVec 32)) Bool)

(assert (=> b!1330736 (= res!883041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330737 () Bool)

(declare-fun res!883037 () Bool)

(assert (=> b!1330737 (=> (not res!883037) (not e!758395))))

(declare-datatypes ((List!30873 0))(
  ( (Nil!30870) (Cons!30869 (h!32078 (_ BitVec 64)) (t!44975 List!30873)) )
))
(declare-fun arrayNoDuplicates!0 (array!90035 (_ BitVec 32) List!30873) Bool)

(assert (=> b!1330737 (= res!883037 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30870))))

(declare-fun b!1330738 () Bool)

(declare-fun res!883042 () Bool)

(assert (=> b!1330738 (=> (not res!883042) (not e!758395))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1330738 (= res!883042 (not (= (select (arr!43484 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330739 () Bool)

(declare-fun res!883038 () Bool)

(assert (=> b!1330739 (=> (not res!883038) (not e!758395))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53913)

(declare-fun zeroValue!1262 () V!53913)

(declare-datatypes ((tuple2!23732 0))(
  ( (tuple2!23733 (_1!11877 (_ BitVec 64)) (_2!11877 V!53913)) )
))
(declare-datatypes ((List!30874 0))(
  ( (Nil!30871) (Cons!30870 (h!32079 tuple2!23732) (t!44976 List!30874)) )
))
(declare-datatypes ((ListLongMap!21389 0))(
  ( (ListLongMap!21390 (toList!10710 List!30874)) )
))
(declare-fun contains!8802 (ListLongMap!21389 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5574 (array!90035 array!90033 (_ BitVec 32) (_ BitVec 32) V!53913 V!53913 (_ BitVec 32) Int) ListLongMap!21389)

(assert (=> b!1330739 (= res!883038 (contains!8802 (getCurrentListMap!5574 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330740 () Bool)

(assert (=> b!1330740 (= e!758395 (not true))))

(declare-fun lt!591101 () ListLongMap!21389)

(assert (=> b!1330740 (contains!8802 lt!591101 k0!1153)))

(declare-datatypes ((Unit!43596 0))(
  ( (Unit!43597) )
))
(declare-fun lt!591099 () Unit!43596)

(declare-fun lt!591103 () V!53913)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!248 ((_ BitVec 64) (_ BitVec 64) V!53913 ListLongMap!21389) Unit!43596)

(assert (=> b!1330740 (= lt!591099 (lemmaInListMapAfterAddingDiffThenInBefore!248 k0!1153 (select (arr!43484 _keys!1590) from!1980) lt!591103 lt!591101))))

(declare-fun lt!591102 () ListLongMap!21389)

(assert (=> b!1330740 (contains!8802 lt!591102 k0!1153)))

(declare-fun lt!591100 () Unit!43596)

(assert (=> b!1330740 (= lt!591100 (lemmaInListMapAfterAddingDiffThenInBefore!248 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591102))))

(declare-fun +!4692 (ListLongMap!21389 tuple2!23732) ListLongMap!21389)

(assert (=> b!1330740 (= lt!591102 (+!4692 lt!591101 (tuple2!23733 (select (arr!43484 _keys!1590) from!1980) lt!591103)))))

(declare-fun get!21921 (ValueCell!17405 V!53913) V!53913)

(declare-fun dynLambda!3622 (Int (_ BitVec 64)) V!53913)

(assert (=> b!1330740 (= lt!591103 (get!21921 (select (arr!43483 _values!1320) from!1980) (dynLambda!3622 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6330 (array!90035 array!90033 (_ BitVec 32) (_ BitVec 32) V!53913 V!53913 (_ BitVec 32) Int) ListLongMap!21389)

(assert (=> b!1330740 (= lt!591101 (getCurrentListMapNoExtraKeys!6330 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1330741 () Bool)

(declare-fun res!883045 () Bool)

(assert (=> b!1330741 (=> (not res!883045) (not e!758395))))

(assert (=> b!1330741 (= res!883045 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330742 () Bool)

(declare-fun e!758394 () Bool)

(assert (=> b!1330742 (= e!758398 (and e!758394 mapRes!56584))))

(declare-fun condMapEmpty!56584 () Bool)

(declare-fun mapDefault!56584 () ValueCell!17405)

(assert (=> b!1330742 (= condMapEmpty!56584 (= (arr!43483 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17405)) mapDefault!56584)))))

(declare-fun b!1330743 () Bool)

(declare-fun res!883040 () Bool)

(assert (=> b!1330743 (=> (not res!883040) (not e!758395))))

(assert (=> b!1330743 (= res!883040 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44036 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330744 () Bool)

(assert (=> b!1330744 (= e!758394 tp_is_empty!36607)))

(declare-fun mapNonEmpty!56584 () Bool)

(declare-fun tp!107728 () Bool)

(declare-fun e!758396 () Bool)

(assert (=> mapNonEmpty!56584 (= mapRes!56584 (and tp!107728 e!758396))))

(declare-fun mapValue!56584 () ValueCell!17405)

(declare-fun mapKey!56584 () (_ BitVec 32))

(declare-fun mapRest!56584 () (Array (_ BitVec 32) ValueCell!17405))

(assert (=> mapNonEmpty!56584 (= (arr!43483 _values!1320) (store mapRest!56584 mapKey!56584 mapValue!56584))))

(declare-fun b!1330745 () Bool)

(assert (=> b!1330745 (= e!758396 tp_is_empty!36607)))

(declare-fun b!1330746 () Bool)

(declare-fun res!883044 () Bool)

(assert (=> b!1330746 (=> (not res!883044) (not e!758395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330746 (= res!883044 (validKeyInArray!0 (select (arr!43484 _keys!1590) from!1980)))))

(assert (= (and start!112302 res!883039) b!1330735))

(assert (= (and b!1330735 res!883043) b!1330736))

(assert (= (and b!1330736 res!883041) b!1330737))

(assert (= (and b!1330737 res!883037) b!1330743))

(assert (= (and b!1330743 res!883040) b!1330739))

(assert (= (and b!1330739 res!883038) b!1330738))

(assert (= (and b!1330738 res!883042) b!1330746))

(assert (= (and b!1330746 res!883044) b!1330741))

(assert (= (and b!1330741 res!883045) b!1330740))

(assert (= (and b!1330742 condMapEmpty!56584) mapIsEmpty!56584))

(assert (= (and b!1330742 (not condMapEmpty!56584)) mapNonEmpty!56584))

(get-info :version)

(assert (= (and mapNonEmpty!56584 ((_ is ValueCellFull!17405) mapValue!56584)) b!1330745))

(assert (= (and b!1330742 ((_ is ValueCellFull!17405) mapDefault!56584)) b!1330744))

(assert (= start!112302 b!1330742))

(declare-fun b_lambda!23947 () Bool)

(assert (=> (not b_lambda!23947) (not b!1330740)))

(declare-fun t!44974 () Bool)

(declare-fun tb!11905 () Bool)

(assert (=> (and start!112302 (= defaultEntry!1323 defaultEntry!1323) t!44974) tb!11905))

(declare-fun result!24889 () Bool)

(assert (=> tb!11905 (= result!24889 tp_is_empty!36607)))

(assert (=> b!1330740 t!44974))

(declare-fun b_and!49433 () Bool)

(assert (= b_and!49431 (and (=> t!44974 result!24889) b_and!49433)))

(declare-fun m!1218951 () Bool)

(assert (=> b!1330738 m!1218951))

(declare-fun m!1218953 () Bool)

(assert (=> b!1330739 m!1218953))

(assert (=> b!1330739 m!1218953))

(declare-fun m!1218955 () Bool)

(assert (=> b!1330739 m!1218955))

(declare-fun m!1218957 () Bool)

(assert (=> mapNonEmpty!56584 m!1218957))

(declare-fun m!1218959 () Bool)

(assert (=> b!1330740 m!1218959))

(declare-fun m!1218961 () Bool)

(assert (=> b!1330740 m!1218961))

(assert (=> b!1330740 m!1218959))

(declare-fun m!1218963 () Bool)

(assert (=> b!1330740 m!1218963))

(declare-fun m!1218965 () Bool)

(assert (=> b!1330740 m!1218965))

(assert (=> b!1330740 m!1218951))

(declare-fun m!1218967 () Bool)

(assert (=> b!1330740 m!1218967))

(declare-fun m!1218969 () Bool)

(assert (=> b!1330740 m!1218969))

(assert (=> b!1330740 m!1218951))

(assert (=> b!1330740 m!1218961))

(declare-fun m!1218971 () Bool)

(assert (=> b!1330740 m!1218971))

(declare-fun m!1218973 () Bool)

(assert (=> b!1330740 m!1218973))

(declare-fun m!1218975 () Bool)

(assert (=> b!1330740 m!1218975))

(assert (=> b!1330746 m!1218951))

(assert (=> b!1330746 m!1218951))

(declare-fun m!1218977 () Bool)

(assert (=> b!1330746 m!1218977))

(declare-fun m!1218979 () Bool)

(assert (=> b!1330736 m!1218979))

(declare-fun m!1218981 () Bool)

(assert (=> b!1330737 m!1218981))

(declare-fun m!1218983 () Bool)

(assert (=> start!112302 m!1218983))

(declare-fun m!1218985 () Bool)

(assert (=> start!112302 m!1218985))

(declare-fun m!1218987 () Bool)

(assert (=> start!112302 m!1218987))

(check-sat (not b!1330737) (not b!1330746) b_and!49433 tp_is_empty!36607 (not b!1330740) (not mapNonEmpty!56584) (not b_lambda!23947) (not b!1330739) (not start!112302) (not b!1330736) (not b_next!30697))
(check-sat b_and!49433 (not b_next!30697))
