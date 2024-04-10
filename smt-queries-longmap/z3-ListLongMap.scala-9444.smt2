; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112274 () Bool)

(assert start!112274)

(declare-fun b_free!30669 () Bool)

(declare-fun b_next!30669 () Bool)

(assert (=> start!112274 (= b_free!30669 (not b_next!30669))))

(declare-fun tp!107643 () Bool)

(declare-fun b_and!49393 () Bool)

(assert (=> start!112274 (= tp!107643 b_and!49393)))

(declare-fun b!1330273 () Bool)

(declare-fun res!882691 () Bool)

(declare-fun e!758220 () Bool)

(assert (=> b!1330273 (=> (not res!882691) (not e!758220))))

(declare-datatypes ((array!90048 0))(
  ( (array!90049 (arr!43490 (Array (_ BitVec 32) (_ BitVec 64))) (size!44040 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90048)

(declare-datatypes ((List!30801 0))(
  ( (Nil!30798) (Cons!30797 (h!32006 (_ BitVec 64)) (t!44883 List!30801)) )
))
(declare-fun arrayNoDuplicates!0 (array!90048 (_ BitVec 32) List!30801) Bool)

(assert (=> b!1330273 (= res!882691 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30798))))

(declare-fun b!1330274 () Bool)

(declare-fun e!758217 () Bool)

(declare-fun e!758218 () Bool)

(declare-fun mapRes!56542 () Bool)

(assert (=> b!1330274 (= e!758217 (and e!758218 mapRes!56542))))

(declare-fun condMapEmpty!56542 () Bool)

(declare-datatypes ((V!53875 0))(
  ( (V!53876 (val!18364 Int)) )
))
(declare-datatypes ((ValueCell!17391 0))(
  ( (ValueCellFull!17391 (v!21001 V!53875)) (EmptyCell!17391) )
))
(declare-datatypes ((array!90050 0))(
  ( (array!90051 (arr!43491 (Array (_ BitVec 32) ValueCell!17391)) (size!44041 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90050)

(declare-fun mapDefault!56542 () ValueCell!17391)

(assert (=> b!1330274 (= condMapEmpty!56542 (= (arr!43491 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17391)) mapDefault!56542)))))

(declare-fun b!1330275 () Bool)

(declare-fun res!882688 () Bool)

(assert (=> b!1330275 (=> (not res!882688) (not e!758220))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330275 (= res!882688 (validKeyInArray!0 (select (arr!43490 _keys!1590) from!1980)))))

(declare-fun res!882695 () Bool)

(assert (=> start!112274 (=> (not res!882695) (not e!758220))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112274 (= res!882695 (validMask!0 mask!1998))))

(assert (=> start!112274 e!758220))

(declare-fun array_inv!32811 (array!90050) Bool)

(assert (=> start!112274 (and (array_inv!32811 _values!1320) e!758217)))

(assert (=> start!112274 true))

(declare-fun array_inv!32812 (array!90048) Bool)

(assert (=> start!112274 (array_inv!32812 _keys!1590)))

(assert (=> start!112274 tp!107643))

(declare-fun tp_is_empty!36579 () Bool)

(assert (=> start!112274 tp_is_empty!36579))

(declare-fun b!1330276 () Bool)

(declare-fun res!882692 () Bool)

(assert (=> b!1330276 (=> (not res!882692) (not e!758220))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1330276 (= res!882692 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!56542 () Bool)

(declare-fun tp!107644 () Bool)

(declare-fun e!758221 () Bool)

(assert (=> mapNonEmpty!56542 (= mapRes!56542 (and tp!107644 e!758221))))

(declare-fun mapKey!56542 () (_ BitVec 32))

(declare-fun mapValue!56542 () ValueCell!17391)

(declare-fun mapRest!56542 () (Array (_ BitVec 32) ValueCell!17391))

(assert (=> mapNonEmpty!56542 (= (arr!43491 _values!1320) (store mapRest!56542 mapKey!56542 mapValue!56542))))

(declare-fun b!1330277 () Bool)

(assert (=> b!1330277 (= e!758220 (not true))))

(declare-datatypes ((tuple2!23650 0))(
  ( (tuple2!23651 (_1!11836 (_ BitVec 64)) (_2!11836 V!53875)) )
))
(declare-datatypes ((List!30802 0))(
  ( (Nil!30799) (Cons!30798 (h!32007 tuple2!23650) (t!44884 List!30802)) )
))
(declare-datatypes ((ListLongMap!21307 0))(
  ( (ListLongMap!21308 (toList!10669 List!30802)) )
))
(declare-fun lt!591087 () ListLongMap!21307)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8833 (ListLongMap!21307 (_ BitVec 64)) Bool)

(assert (=> b!1330277 (contains!8833 lt!591087 k0!1153)))

(declare-datatypes ((Unit!43783 0))(
  ( (Unit!43784) )
))
(declare-fun lt!591088 () Unit!43783)

(declare-fun minValue!1262 () V!53875)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!254 ((_ BitVec 64) (_ BitVec 64) V!53875 ListLongMap!21307) Unit!43783)

(assert (=> b!1330277 (= lt!591088 (lemmaInListMapAfterAddingDiffThenInBefore!254 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591087))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53875)

(declare-fun +!4667 (ListLongMap!21307 tuple2!23650) ListLongMap!21307)

(declare-fun getCurrentListMapNoExtraKeys!6305 (array!90048 array!90050 (_ BitVec 32) (_ BitVec 32) V!53875 V!53875 (_ BitVec 32) Int) ListLongMap!21307)

(declare-fun get!21919 (ValueCell!17391 V!53875) V!53875)

(declare-fun dynLambda!3606 (Int (_ BitVec 64)) V!53875)

(assert (=> b!1330277 (= lt!591087 (+!4667 (getCurrentListMapNoExtraKeys!6305 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23651 (select (arr!43490 _keys!1590) from!1980) (get!21919 (select (arr!43491 _values!1320) from!1980) (dynLambda!3606 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1330278 () Bool)

(declare-fun res!882689 () Bool)

(assert (=> b!1330278 (=> (not res!882689) (not e!758220))))

(declare-fun getCurrentListMap!5657 (array!90048 array!90050 (_ BitVec 32) (_ BitVec 32) V!53875 V!53875 (_ BitVec 32) Int) ListLongMap!21307)

(assert (=> b!1330278 (= res!882689 (contains!8833 (getCurrentListMap!5657 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330279 () Bool)

(declare-fun res!882693 () Bool)

(assert (=> b!1330279 (=> (not res!882693) (not e!758220))))

(assert (=> b!1330279 (= res!882693 (and (= (size!44041 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44040 _keys!1590) (size!44041 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330280 () Bool)

(declare-fun res!882694 () Bool)

(assert (=> b!1330280 (=> (not res!882694) (not e!758220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90048 (_ BitVec 32)) Bool)

(assert (=> b!1330280 (= res!882694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330281 () Bool)

(declare-fun res!882690 () Bool)

(assert (=> b!1330281 (=> (not res!882690) (not e!758220))))

(assert (=> b!1330281 (= res!882690 (not (= (select (arr!43490 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330282 () Bool)

(assert (=> b!1330282 (= e!758221 tp_is_empty!36579)))

(declare-fun mapIsEmpty!56542 () Bool)

(assert (=> mapIsEmpty!56542 mapRes!56542))

(declare-fun b!1330283 () Bool)

(assert (=> b!1330283 (= e!758218 tp_is_empty!36579)))

(declare-fun b!1330284 () Bool)

(declare-fun res!882696 () Bool)

(assert (=> b!1330284 (=> (not res!882696) (not e!758220))))

(assert (=> b!1330284 (= res!882696 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44040 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112274 res!882695) b!1330279))

(assert (= (and b!1330279 res!882693) b!1330280))

(assert (= (and b!1330280 res!882694) b!1330273))

(assert (= (and b!1330273 res!882691) b!1330284))

(assert (= (and b!1330284 res!882696) b!1330278))

(assert (= (and b!1330278 res!882689) b!1330281))

(assert (= (and b!1330281 res!882690) b!1330275))

(assert (= (and b!1330275 res!882688) b!1330276))

(assert (= (and b!1330276 res!882692) b!1330277))

(assert (= (and b!1330274 condMapEmpty!56542) mapIsEmpty!56542))

(assert (= (and b!1330274 (not condMapEmpty!56542)) mapNonEmpty!56542))

(get-info :version)

(assert (= (and mapNonEmpty!56542 ((_ is ValueCellFull!17391) mapValue!56542)) b!1330282))

(assert (= (and b!1330274 ((_ is ValueCellFull!17391) mapDefault!56542)) b!1330283))

(assert (= start!112274 b!1330274))

(declare-fun b_lambda!23929 () Bool)

(assert (=> (not b_lambda!23929) (not b!1330277)))

(declare-fun t!44882 () Bool)

(declare-fun tb!11885 () Bool)

(assert (=> (and start!112274 (= defaultEntry!1323 defaultEntry!1323) t!44882) tb!11885))

(declare-fun result!24841 () Bool)

(assert (=> tb!11885 (= result!24841 tp_is_empty!36579)))

(assert (=> b!1330277 t!44882))

(declare-fun b_and!49395 () Bool)

(assert (= b_and!49393 (and (=> t!44882 result!24841) b_and!49395)))

(declare-fun m!1218943 () Bool)

(assert (=> b!1330275 m!1218943))

(assert (=> b!1330275 m!1218943))

(declare-fun m!1218945 () Bool)

(assert (=> b!1330275 m!1218945))

(declare-fun m!1218947 () Bool)

(assert (=> mapNonEmpty!56542 m!1218947))

(declare-fun m!1218949 () Bool)

(assert (=> b!1330280 m!1218949))

(declare-fun m!1218951 () Bool)

(assert (=> b!1330277 m!1218951))

(declare-fun m!1218953 () Bool)

(assert (=> b!1330277 m!1218953))

(declare-fun m!1218955 () Bool)

(assert (=> b!1330277 m!1218955))

(declare-fun m!1218957 () Bool)

(assert (=> b!1330277 m!1218957))

(assert (=> b!1330277 m!1218951))

(declare-fun m!1218959 () Bool)

(assert (=> b!1330277 m!1218959))

(declare-fun m!1218961 () Bool)

(assert (=> b!1330277 m!1218961))

(declare-fun m!1218963 () Bool)

(assert (=> b!1330277 m!1218963))

(assert (=> b!1330277 m!1218953))

(assert (=> b!1330277 m!1218957))

(assert (=> b!1330277 m!1218943))

(declare-fun m!1218965 () Bool)

(assert (=> b!1330273 m!1218965))

(assert (=> b!1330281 m!1218943))

(declare-fun m!1218967 () Bool)

(assert (=> start!112274 m!1218967))

(declare-fun m!1218969 () Bool)

(assert (=> start!112274 m!1218969))

(declare-fun m!1218971 () Bool)

(assert (=> start!112274 m!1218971))

(declare-fun m!1218973 () Bool)

(assert (=> b!1330278 m!1218973))

(assert (=> b!1330278 m!1218973))

(declare-fun m!1218975 () Bool)

(assert (=> b!1330278 m!1218975))

(check-sat (not mapNonEmpty!56542) (not b!1330275) (not b!1330273) tp_is_empty!36579 (not b_lambda!23929) (not b!1330277) (not start!112274) b_and!49395 (not b!1330280) (not b_next!30669) (not b!1330278))
(check-sat b_and!49395 (not b_next!30669))
