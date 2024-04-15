; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112290 () Bool)

(assert start!112290)

(declare-fun b_free!30685 () Bool)

(declare-fun b_next!30685 () Bool)

(assert (=> start!112290 (= b_free!30685 (not b_next!30685))))

(declare-fun tp!107692 () Bool)

(declare-fun b_and!49407 () Bool)

(assert (=> start!112290 (= tp!107692 b_and!49407)))

(declare-fun b!1330507 () Bool)

(declare-fun res!882880 () Bool)

(declare-fun e!758305 () Bool)

(assert (=> b!1330507 (=> (not res!882880) (not e!758305))))

(declare-datatypes ((array!90009 0))(
  ( (array!90010 (arr!43471 (Array (_ BitVec 32) (_ BitVec 64))) (size!44023 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90009)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330507 (= res!882880 (validKeyInArray!0 (select (arr!43471 _keys!1590) from!1980)))))

(declare-fun b!1330508 () Bool)

(assert (=> b!1330508 (= e!758305 (not true))))

(declare-datatypes ((V!53897 0))(
  ( (V!53898 (val!18372 Int)) )
))
(declare-datatypes ((tuple2!23722 0))(
  ( (tuple2!23723 (_1!11872 (_ BitVec 64)) (_2!11872 V!53897)) )
))
(declare-datatypes ((List!30864 0))(
  ( (Nil!30861) (Cons!30860 (h!32069 tuple2!23722) (t!44954 List!30864)) )
))
(declare-datatypes ((ListLongMap!21379 0))(
  ( (ListLongMap!21380 (toList!10705 List!30864)) )
))
(declare-fun lt!591009 () ListLongMap!21379)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8797 (ListLongMap!21379 (_ BitVec 64)) Bool)

(assert (=> b!1330508 (contains!8797 lt!591009 k0!1153)))

(declare-datatypes ((Unit!43590 0))(
  ( (Unit!43591) )
))
(declare-fun lt!591013 () Unit!43590)

(declare-fun lt!591011 () V!53897)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!245 ((_ BitVec 64) (_ BitVec 64) V!53897 ListLongMap!21379) Unit!43590)

(assert (=> b!1330508 (= lt!591013 (lemmaInListMapAfterAddingDiffThenInBefore!245 k0!1153 (select (arr!43471 _keys!1590) from!1980) lt!591011 lt!591009))))

(declare-fun lt!591010 () ListLongMap!21379)

(assert (=> b!1330508 (contains!8797 lt!591010 k0!1153)))

(declare-fun lt!591012 () Unit!43590)

(declare-fun minValue!1262 () V!53897)

(assert (=> b!1330508 (= lt!591012 (lemmaInListMapAfterAddingDiffThenInBefore!245 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591010))))

(declare-fun +!4689 (ListLongMap!21379 tuple2!23722) ListLongMap!21379)

(assert (=> b!1330508 (= lt!591010 (+!4689 lt!591009 (tuple2!23723 (select (arr!43471 _keys!1590) from!1980) lt!591011)))))

(declare-datatypes ((ValueCell!17399 0))(
  ( (ValueCellFull!17399 (v!21008 V!53897)) (EmptyCell!17399) )
))
(declare-datatypes ((array!90011 0))(
  ( (array!90012 (arr!43472 (Array (_ BitVec 32) ValueCell!17399)) (size!44024 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90011)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21914 (ValueCell!17399 V!53897) V!53897)

(declare-fun dynLambda!3619 (Int (_ BitVec 64)) V!53897)

(assert (=> b!1330508 (= lt!591011 (get!21914 (select (arr!43472 _values!1320) from!1980) (dynLambda!3619 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53897)

(declare-fun getCurrentListMapNoExtraKeys!6327 (array!90009 array!90011 (_ BitVec 32) (_ BitVec 32) V!53897 V!53897 (_ BitVec 32) Int) ListLongMap!21379)

(assert (=> b!1330508 (= lt!591009 (getCurrentListMapNoExtraKeys!6327 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1330509 () Bool)

(declare-fun res!882877 () Bool)

(assert (=> b!1330509 (=> (not res!882877) (not e!758305))))

(assert (=> b!1330509 (= res!882877 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44023 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330510 () Bool)

(declare-fun res!882882 () Bool)

(assert (=> b!1330510 (=> (not res!882882) (not e!758305))))

(declare-datatypes ((List!30865 0))(
  ( (Nil!30862) (Cons!30861 (h!32070 (_ BitVec 64)) (t!44955 List!30865)) )
))
(declare-fun arrayNoDuplicates!0 (array!90009 (_ BitVec 32) List!30865) Bool)

(assert (=> b!1330510 (= res!882882 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30862))))

(declare-fun mapNonEmpty!56566 () Bool)

(declare-fun mapRes!56566 () Bool)

(declare-fun tp!107693 () Bool)

(declare-fun e!758306 () Bool)

(assert (=> mapNonEmpty!56566 (= mapRes!56566 (and tp!107693 e!758306))))

(declare-fun mapKey!56566 () (_ BitVec 32))

(declare-fun mapValue!56566 () ValueCell!17399)

(declare-fun mapRest!56566 () (Array (_ BitVec 32) ValueCell!17399))

(assert (=> mapNonEmpty!56566 (= (arr!43472 _values!1320) (store mapRest!56566 mapKey!56566 mapValue!56566))))

(declare-fun res!882875 () Bool)

(assert (=> start!112290 (=> (not res!882875) (not e!758305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112290 (= res!882875 (validMask!0 mask!1998))))

(assert (=> start!112290 e!758305))

(declare-fun e!758308 () Bool)

(declare-fun array_inv!32971 (array!90011) Bool)

(assert (=> start!112290 (and (array_inv!32971 _values!1320) e!758308)))

(assert (=> start!112290 true))

(declare-fun array_inv!32972 (array!90009) Bool)

(assert (=> start!112290 (array_inv!32972 _keys!1590)))

(assert (=> start!112290 tp!107692))

(declare-fun tp_is_empty!36595 () Bool)

(assert (=> start!112290 tp_is_empty!36595))

(declare-fun b!1330511 () Bool)

(declare-fun res!882881 () Bool)

(assert (=> b!1330511 (=> (not res!882881) (not e!758305))))

(assert (=> b!1330511 (= res!882881 (not (= (select (arr!43471 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330512 () Bool)

(declare-fun res!882876 () Bool)

(assert (=> b!1330512 (=> (not res!882876) (not e!758305))))

(assert (=> b!1330512 (= res!882876 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330513 () Bool)

(declare-fun res!882883 () Bool)

(assert (=> b!1330513 (=> (not res!882883) (not e!758305))))

(declare-fun getCurrentListMap!5569 (array!90009 array!90011 (_ BitVec 32) (_ BitVec 32) V!53897 V!53897 (_ BitVec 32) Int) ListLongMap!21379)

(assert (=> b!1330513 (= res!882883 (contains!8797 (getCurrentListMap!5569 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330514 () Bool)

(declare-fun res!882878 () Bool)

(assert (=> b!1330514 (=> (not res!882878) (not e!758305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90009 (_ BitVec 32)) Bool)

(assert (=> b!1330514 (= res!882878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330515 () Bool)

(declare-fun e!758307 () Bool)

(assert (=> b!1330515 (= e!758308 (and e!758307 mapRes!56566))))

(declare-fun condMapEmpty!56566 () Bool)

(declare-fun mapDefault!56566 () ValueCell!17399)

(assert (=> b!1330515 (= condMapEmpty!56566 (= (arr!43472 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17399)) mapDefault!56566)))))

(declare-fun b!1330516 () Bool)

(assert (=> b!1330516 (= e!758306 tp_is_empty!36595)))

(declare-fun b!1330517 () Bool)

(declare-fun res!882879 () Bool)

(assert (=> b!1330517 (=> (not res!882879) (not e!758305))))

(assert (=> b!1330517 (= res!882879 (and (= (size!44024 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44023 _keys!1590) (size!44024 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56566 () Bool)

(assert (=> mapIsEmpty!56566 mapRes!56566))

(declare-fun b!1330518 () Bool)

(assert (=> b!1330518 (= e!758307 tp_is_empty!36595)))

(assert (= (and start!112290 res!882875) b!1330517))

(assert (= (and b!1330517 res!882879) b!1330514))

(assert (= (and b!1330514 res!882878) b!1330510))

(assert (= (and b!1330510 res!882882) b!1330509))

(assert (= (and b!1330509 res!882877) b!1330513))

(assert (= (and b!1330513 res!882883) b!1330511))

(assert (= (and b!1330511 res!882881) b!1330507))

(assert (= (and b!1330507 res!882880) b!1330512))

(assert (= (and b!1330512 res!882876) b!1330508))

(assert (= (and b!1330515 condMapEmpty!56566) mapIsEmpty!56566))

(assert (= (and b!1330515 (not condMapEmpty!56566)) mapNonEmpty!56566))

(get-info :version)

(assert (= (and mapNonEmpty!56566 ((_ is ValueCellFull!17399) mapValue!56566)) b!1330516))

(assert (= (and b!1330515 ((_ is ValueCellFull!17399) mapDefault!56566)) b!1330518))

(assert (= start!112290 b!1330515))

(declare-fun b_lambda!23935 () Bool)

(assert (=> (not b_lambda!23935) (not b!1330508)))

(declare-fun t!44953 () Bool)

(declare-fun tb!11893 () Bool)

(assert (=> (and start!112290 (= defaultEntry!1323 defaultEntry!1323) t!44953) tb!11893))

(declare-fun result!24865 () Bool)

(assert (=> tb!11893 (= result!24865 tp_is_empty!36595)))

(assert (=> b!1330508 t!44953))

(declare-fun b_and!49409 () Bool)

(assert (= b_and!49407 (and (=> t!44953 result!24865) b_and!49409)))

(declare-fun m!1218723 () Bool)

(assert (=> b!1330513 m!1218723))

(assert (=> b!1330513 m!1218723))

(declare-fun m!1218725 () Bool)

(assert (=> b!1330513 m!1218725))

(declare-fun m!1218727 () Bool)

(assert (=> b!1330508 m!1218727))

(declare-fun m!1218729 () Bool)

(assert (=> b!1330508 m!1218729))

(declare-fun m!1218731 () Bool)

(assert (=> b!1330508 m!1218731))

(declare-fun m!1218733 () Bool)

(assert (=> b!1330508 m!1218733))

(declare-fun m!1218735 () Bool)

(assert (=> b!1330508 m!1218735))

(declare-fun m!1218737 () Bool)

(assert (=> b!1330508 m!1218737))

(declare-fun m!1218739 () Bool)

(assert (=> b!1330508 m!1218739))

(declare-fun m!1218741 () Bool)

(assert (=> b!1330508 m!1218741))

(declare-fun m!1218743 () Bool)

(assert (=> b!1330508 m!1218743))

(assert (=> b!1330508 m!1218733))

(assert (=> b!1330508 m!1218727))

(declare-fun m!1218745 () Bool)

(assert (=> b!1330508 m!1218745))

(assert (=> b!1330508 m!1218735))

(declare-fun m!1218747 () Bool)

(assert (=> mapNonEmpty!56566 m!1218747))

(declare-fun m!1218749 () Bool)

(assert (=> start!112290 m!1218749))

(declare-fun m!1218751 () Bool)

(assert (=> start!112290 m!1218751))

(declare-fun m!1218753 () Bool)

(assert (=> start!112290 m!1218753))

(assert (=> b!1330507 m!1218727))

(assert (=> b!1330507 m!1218727))

(declare-fun m!1218755 () Bool)

(assert (=> b!1330507 m!1218755))

(assert (=> b!1330511 m!1218727))

(declare-fun m!1218757 () Bool)

(assert (=> b!1330510 m!1218757))

(declare-fun m!1218759 () Bool)

(assert (=> b!1330514 m!1218759))

(check-sat (not b!1330508) (not b_lambda!23935) b_and!49409 (not b!1330513) (not b!1330510) (not start!112290) tp_is_empty!36595 (not b!1330507) (not b!1330514) (not b_next!30685) (not mapNonEmpty!56566))
(check-sat b_and!49409 (not b_next!30685))
