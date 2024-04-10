; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112298 () Bool)

(assert start!112298)

(declare-fun b_free!30693 () Bool)

(declare-fun b_next!30693 () Bool)

(assert (=> start!112298 (= b_free!30693 (not b_next!30693))))

(declare-fun tp!107715 () Bool)

(declare-fun b_and!49441 () Bool)

(assert (=> start!112298 (= tp!107715 b_and!49441)))

(declare-fun b!1330729 () Bool)

(declare-fun res!883012 () Bool)

(declare-fun e!758398 () Bool)

(assert (=> b!1330729 (=> (not res!883012) (not e!758398))))

(declare-datatypes ((array!90090 0))(
  ( (array!90091 (arr!43511 (Array (_ BitVec 32) (_ BitVec 64))) (size!44061 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90090)

(declare-datatypes ((List!30816 0))(
  ( (Nil!30813) (Cons!30812 (h!32021 (_ BitVec 64)) (t!44922 List!30816)) )
))
(declare-fun arrayNoDuplicates!0 (array!90090 (_ BitVec 32) List!30816) Bool)

(assert (=> b!1330729 (= res!883012 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30813))))

(declare-fun b!1330730 () Bool)

(assert (=> b!1330730 (= e!758398 (not true))))

(declare-datatypes ((V!53907 0))(
  ( (V!53908 (val!18376 Int)) )
))
(declare-datatypes ((tuple2!23666 0))(
  ( (tuple2!23667 (_1!11844 (_ BitVec 64)) (_2!11844 V!53907)) )
))
(declare-datatypes ((List!30817 0))(
  ( (Nil!30814) (Cons!30813 (h!32022 tuple2!23666) (t!44923 List!30817)) )
))
(declare-datatypes ((ListLongMap!21323 0))(
  ( (ListLongMap!21324 (toList!10677 List!30817)) )
))
(declare-fun lt!591255 () ListLongMap!21323)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8841 (ListLongMap!21323 (_ BitVec 64)) Bool)

(assert (=> b!1330730 (contains!8841 lt!591255 k0!1153)))

(declare-fun lt!591258 () V!53907)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((Unit!43797 0))(
  ( (Unit!43798) )
))
(declare-fun lt!591257 () Unit!43797)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!261 ((_ BitVec 64) (_ BitVec 64) V!53907 ListLongMap!21323) Unit!43797)

(assert (=> b!1330730 (= lt!591257 (lemmaInListMapAfterAddingDiffThenInBefore!261 k0!1153 (select (arr!43511 _keys!1590) from!1980) lt!591258 lt!591255))))

(declare-fun lt!591256 () ListLongMap!21323)

(assert (=> b!1330730 (contains!8841 lt!591256 k0!1153)))

(declare-fun lt!591259 () Unit!43797)

(declare-fun minValue!1262 () V!53907)

(assert (=> b!1330730 (= lt!591259 (lemmaInListMapAfterAddingDiffThenInBefore!261 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591256))))

(declare-fun +!4674 (ListLongMap!21323 tuple2!23666) ListLongMap!21323)

(assert (=> b!1330730 (= lt!591256 (+!4674 lt!591255 (tuple2!23667 (select (arr!43511 _keys!1590) from!1980) lt!591258)))))

(declare-datatypes ((ValueCell!17403 0))(
  ( (ValueCellFull!17403 (v!21013 V!53907)) (EmptyCell!17403) )
))
(declare-datatypes ((array!90092 0))(
  ( (array!90093 (arr!43512 (Array (_ BitVec 32) ValueCell!17403)) (size!44062 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90092)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21934 (ValueCell!17403 V!53907) V!53907)

(declare-fun dynLambda!3613 (Int (_ BitVec 64)) V!53907)

(assert (=> b!1330730 (= lt!591258 (get!21934 (select (arr!43512 _values!1320) from!1980) (dynLambda!3613 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53907)

(declare-fun getCurrentListMapNoExtraKeys!6312 (array!90090 array!90092 (_ BitVec 32) (_ BitVec 32) V!53907 V!53907 (_ BitVec 32) Int) ListLongMap!21323)

(assert (=> b!1330730 (= lt!591255 (getCurrentListMapNoExtraKeys!6312 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1330731 () Bool)

(declare-fun res!883014 () Bool)

(assert (=> b!1330731 (=> (not res!883014) (not e!758398))))

(declare-fun getCurrentListMap!5663 (array!90090 array!90092 (_ BitVec 32) (_ BitVec 32) V!53907 V!53907 (_ BitVec 32) Int) ListLongMap!21323)

(assert (=> b!1330731 (= res!883014 (contains!8841 (getCurrentListMap!5663 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330732 () Bool)

(declare-fun res!883018 () Bool)

(assert (=> b!1330732 (=> (not res!883018) (not e!758398))))

(assert (=> b!1330732 (= res!883018 (not (= (select (arr!43511 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapNonEmpty!56578 () Bool)

(declare-fun mapRes!56578 () Bool)

(declare-fun tp!107716 () Bool)

(declare-fun e!758397 () Bool)

(assert (=> mapNonEmpty!56578 (= mapRes!56578 (and tp!107716 e!758397))))

(declare-fun mapRest!56578 () (Array (_ BitVec 32) ValueCell!17403))

(declare-fun mapKey!56578 () (_ BitVec 32))

(declare-fun mapValue!56578 () ValueCell!17403)

(assert (=> mapNonEmpty!56578 (= (arr!43512 _values!1320) (store mapRest!56578 mapKey!56578 mapValue!56578))))

(declare-fun mapIsEmpty!56578 () Bool)

(assert (=> mapIsEmpty!56578 mapRes!56578))

(declare-fun res!883016 () Bool)

(assert (=> start!112298 (=> (not res!883016) (not e!758398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112298 (= res!883016 (validMask!0 mask!1998))))

(assert (=> start!112298 e!758398))

(declare-fun e!758399 () Bool)

(declare-fun array_inv!32823 (array!90092) Bool)

(assert (=> start!112298 (and (array_inv!32823 _values!1320) e!758399)))

(assert (=> start!112298 true))

(declare-fun array_inv!32824 (array!90090) Bool)

(assert (=> start!112298 (array_inv!32824 _keys!1590)))

(assert (=> start!112298 tp!107715))

(declare-fun tp_is_empty!36603 () Bool)

(assert (=> start!112298 tp_is_empty!36603))

(declare-fun b!1330733 () Bool)

(declare-fun res!883020 () Bool)

(assert (=> b!1330733 (=> (not res!883020) (not e!758398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90090 (_ BitVec 32)) Bool)

(assert (=> b!1330733 (= res!883020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330734 () Bool)

(declare-fun e!758400 () Bool)

(assert (=> b!1330734 (= e!758399 (and e!758400 mapRes!56578))))

(declare-fun condMapEmpty!56578 () Bool)

(declare-fun mapDefault!56578 () ValueCell!17403)

(assert (=> b!1330734 (= condMapEmpty!56578 (= (arr!43512 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17403)) mapDefault!56578)))))

(declare-fun b!1330735 () Bool)

(assert (=> b!1330735 (= e!758400 tp_is_empty!36603)))

(declare-fun b!1330736 () Bool)

(declare-fun res!883019 () Bool)

(assert (=> b!1330736 (=> (not res!883019) (not e!758398))))

(assert (=> b!1330736 (= res!883019 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330737 () Bool)

(declare-fun res!883013 () Bool)

(assert (=> b!1330737 (=> (not res!883013) (not e!758398))))

(assert (=> b!1330737 (= res!883013 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44061 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330738 () Bool)

(declare-fun res!883017 () Bool)

(assert (=> b!1330738 (=> (not res!883017) (not e!758398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330738 (= res!883017 (validKeyInArray!0 (select (arr!43511 _keys!1590) from!1980)))))

(declare-fun b!1330739 () Bool)

(declare-fun res!883015 () Bool)

(assert (=> b!1330739 (=> (not res!883015) (not e!758398))))

(assert (=> b!1330739 (= res!883015 (and (= (size!44062 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44061 _keys!1590) (size!44062 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330740 () Bool)

(assert (=> b!1330740 (= e!758397 tp_is_empty!36603)))

(assert (= (and start!112298 res!883016) b!1330739))

(assert (= (and b!1330739 res!883015) b!1330733))

(assert (= (and b!1330733 res!883020) b!1330729))

(assert (= (and b!1330729 res!883012) b!1330737))

(assert (= (and b!1330737 res!883013) b!1330731))

(assert (= (and b!1330731 res!883014) b!1330732))

(assert (= (and b!1330732 res!883018) b!1330738))

(assert (= (and b!1330738 res!883017) b!1330736))

(assert (= (and b!1330736 res!883019) b!1330730))

(assert (= (and b!1330734 condMapEmpty!56578) mapIsEmpty!56578))

(assert (= (and b!1330734 (not condMapEmpty!56578)) mapNonEmpty!56578))

(get-info :version)

(assert (= (and mapNonEmpty!56578 ((_ is ValueCellFull!17403) mapValue!56578)) b!1330740))

(assert (= (and b!1330734 ((_ is ValueCellFull!17403) mapDefault!56578)) b!1330735))

(assert (= start!112298 b!1330734))

(declare-fun b_lambda!23953 () Bool)

(assert (=> (not b_lambda!23953) (not b!1330730)))

(declare-fun t!44921 () Bool)

(declare-fun tb!11909 () Bool)

(assert (=> (and start!112298 (= defaultEntry!1323 defaultEntry!1323) t!44921) tb!11909))

(declare-fun result!24889 () Bool)

(assert (=> tb!11909 (= result!24889 tp_is_empty!36603)))

(assert (=> b!1330730 t!44921))

(declare-fun b_and!49443 () Bool)

(assert (= b_and!49441 (and (=> t!44921 result!24889) b_and!49443)))

(declare-fun m!1219391 () Bool)

(assert (=> b!1330729 m!1219391))

(declare-fun m!1219393 () Bool)

(assert (=> b!1330732 m!1219393))

(declare-fun m!1219395 () Bool)

(assert (=> mapNonEmpty!56578 m!1219395))

(assert (=> b!1330738 m!1219393))

(assert (=> b!1330738 m!1219393))

(declare-fun m!1219397 () Bool)

(assert (=> b!1330738 m!1219397))

(declare-fun m!1219399 () Bool)

(assert (=> start!112298 m!1219399))

(declare-fun m!1219401 () Bool)

(assert (=> start!112298 m!1219401))

(declare-fun m!1219403 () Bool)

(assert (=> start!112298 m!1219403))

(declare-fun m!1219405 () Bool)

(assert (=> b!1330731 m!1219405))

(assert (=> b!1330731 m!1219405))

(declare-fun m!1219407 () Bool)

(assert (=> b!1330731 m!1219407))

(declare-fun m!1219409 () Bool)

(assert (=> b!1330733 m!1219409))

(declare-fun m!1219411 () Bool)

(assert (=> b!1330730 m!1219411))

(declare-fun m!1219413 () Bool)

(assert (=> b!1330730 m!1219413))

(declare-fun m!1219415 () Bool)

(assert (=> b!1330730 m!1219415))

(declare-fun m!1219417 () Bool)

(assert (=> b!1330730 m!1219417))

(assert (=> b!1330730 m!1219393))

(declare-fun m!1219419 () Bool)

(assert (=> b!1330730 m!1219419))

(assert (=> b!1330730 m!1219413))

(declare-fun m!1219421 () Bool)

(assert (=> b!1330730 m!1219421))

(assert (=> b!1330730 m!1219393))

(assert (=> b!1330730 m!1219415))

(declare-fun m!1219423 () Bool)

(assert (=> b!1330730 m!1219423))

(declare-fun m!1219425 () Bool)

(assert (=> b!1330730 m!1219425))

(declare-fun m!1219427 () Bool)

(assert (=> b!1330730 m!1219427))

(check-sat (not start!112298) (not mapNonEmpty!56578) (not b!1330733) (not b_next!30693) (not b!1330729) b_and!49443 (not b_lambda!23953) (not b!1330730) tp_is_empty!36603 (not b!1330731) (not b!1330738))
(check-sat b_and!49443 (not b_next!30693))
