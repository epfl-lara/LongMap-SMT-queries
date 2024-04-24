; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112902 () Bool)

(assert start!112902)

(declare-fun b_free!31015 () Bool)

(declare-fun b_next!31015 () Bool)

(assert (=> start!112902 (= b_free!31015 (not b_next!31015))))

(declare-fun tp!108686 () Bool)

(declare-fun b_and!49969 () Bool)

(assert (=> start!112902 (= tp!108686 b_and!49969)))

(declare-fun mapNonEmpty!57065 () Bool)

(declare-fun mapRes!57065 () Bool)

(declare-fun tp!108685 () Bool)

(declare-fun e!761980 () Bool)

(assert (=> mapNonEmpty!57065 (= mapRes!57065 (and tp!108685 e!761980))))

(declare-datatypes ((V!54337 0))(
  ( (V!54338 (val!18537 Int)) )
))
(declare-datatypes ((ValueCell!17564 0))(
  ( (ValueCellFull!17564 (v!21172 V!54337)) (EmptyCell!17564) )
))
(declare-fun mapValue!57065 () ValueCell!17564)

(declare-datatypes ((array!90823 0))(
  ( (array!90824 (arr!43872 (Array (_ BitVec 32) ValueCell!17564)) (size!44423 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90823)

(declare-fun mapKey!57065 () (_ BitVec 32))

(declare-fun mapRest!57065 () (Array (_ BitVec 32) ValueCell!17564))

(assert (=> mapNonEmpty!57065 (= (arr!43872 _values!1320) (store mapRest!57065 mapKey!57065 mapValue!57065))))

(declare-fun b!1337894 () Bool)

(declare-fun res!887542 () Bool)

(declare-fun e!761981 () Bool)

(assert (=> b!1337894 (=> (not res!887542) (not e!761981))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1337894 (= res!887542 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337895 () Bool)

(declare-fun res!887539 () Bool)

(assert (=> b!1337895 (=> (not res!887539) (not e!761981))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90825 0))(
  ( (array!90826 (arr!43873 (Array (_ BitVec 32) (_ BitVec 64))) (size!44424 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90825)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1337895 (= res!887539 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44424 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1337897 () Bool)

(declare-fun res!887541 () Bool)

(assert (=> b!1337897 (=> (not res!887541) (not e!761981))))

(assert (=> b!1337897 (= res!887541 (not (= (select (arr!43873 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapIsEmpty!57065 () Bool)

(assert (=> mapIsEmpty!57065 mapRes!57065))

(declare-fun b!1337898 () Bool)

(declare-fun res!887540 () Bool)

(assert (=> b!1337898 (=> (not res!887540) (not e!761981))))

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1337898 (= res!887540 (and (= (size!44423 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44424 _keys!1590) (size!44423 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337899 () Bool)

(assert (=> b!1337899 (= e!761981 (not (not (= k0!1153 (select (arr!43873 _keys!1590) from!1980)))))))

(declare-datatypes ((tuple2!23950 0))(
  ( (tuple2!23951 (_1!11986 (_ BitVec 64)) (_2!11986 V!54337)) )
))
(declare-datatypes ((List!31093 0))(
  ( (Nil!31090) (Cons!31089 (h!32307 tuple2!23950) (t!45381 List!31093)) )
))
(declare-datatypes ((ListLongMap!21615 0))(
  ( (ListLongMap!21616 (toList!10823 List!31093)) )
))
(declare-fun lt!593275 () ListLongMap!21615)

(declare-fun contains!9000 (ListLongMap!21615 (_ BitVec 64)) Bool)

(assert (=> b!1337899 (contains!9000 lt!593275 k0!1153)))

(declare-datatypes ((Unit!43857 0))(
  ( (Unit!43858) )
))
(declare-fun lt!593274 () Unit!43857)

(declare-fun minValue!1262 () V!54337)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!309 ((_ BitVec 64) (_ BitVec 64) V!54337 ListLongMap!21615) Unit!43857)

(assert (=> b!1337899 (= lt!593274 (lemmaInListMapAfterAddingDiffThenInBefore!309 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!593275))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!54337)

(declare-fun +!4774 (ListLongMap!21615 tuple2!23950) ListLongMap!21615)

(declare-fun getCurrentListMapNoExtraKeys!6423 (array!90825 array!90823 (_ BitVec 32) (_ BitVec 32) V!54337 V!54337 (_ BitVec 32) Int) ListLongMap!21615)

(declare-fun get!22148 (ValueCell!17564 V!54337) V!54337)

(declare-fun dynLambda!3728 (Int (_ BitVec 64)) V!54337)

(assert (=> b!1337899 (= lt!593275 (+!4774 (getCurrentListMapNoExtraKeys!6423 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43873 _keys!1590) from!1980) (get!22148 (select (arr!43872 _values!1320) from!1980) (dynLambda!3728 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1337900 () Bool)

(declare-fun res!887535 () Bool)

(assert (=> b!1337900 (=> (not res!887535) (not e!761981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337900 (= res!887535 (validKeyInArray!0 (select (arr!43873 _keys!1590) from!1980)))))

(declare-fun b!1337896 () Bool)

(declare-fun res!887538 () Bool)

(assert (=> b!1337896 (=> (not res!887538) (not e!761981))))

(declare-fun getCurrentListMap!5779 (array!90825 array!90823 (_ BitVec 32) (_ BitVec 32) V!54337 V!54337 (_ BitVec 32) Int) ListLongMap!21615)

(assert (=> b!1337896 (= res!887538 (contains!9000 (getCurrentListMap!5779 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!887537 () Bool)

(assert (=> start!112902 (=> (not res!887537) (not e!761981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112902 (= res!887537 (validMask!0 mask!1998))))

(assert (=> start!112902 e!761981))

(declare-fun e!761979 () Bool)

(declare-fun array_inv!33351 (array!90823) Bool)

(assert (=> start!112902 (and (array_inv!33351 _values!1320) e!761979)))

(assert (=> start!112902 true))

(declare-fun array_inv!33352 (array!90825) Bool)

(assert (=> start!112902 (array_inv!33352 _keys!1590)))

(assert (=> start!112902 tp!108686))

(declare-fun tp_is_empty!36925 () Bool)

(assert (=> start!112902 tp_is_empty!36925))

(declare-fun b!1337901 () Bool)

(declare-fun res!887534 () Bool)

(assert (=> b!1337901 (=> (not res!887534) (not e!761981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90825 (_ BitVec 32)) Bool)

(assert (=> b!1337901 (= res!887534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1337902 () Bool)

(declare-fun e!761983 () Bool)

(assert (=> b!1337902 (= e!761979 (and e!761983 mapRes!57065))))

(declare-fun condMapEmpty!57065 () Bool)

(declare-fun mapDefault!57065 () ValueCell!17564)

(assert (=> b!1337902 (= condMapEmpty!57065 (= (arr!43872 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17564)) mapDefault!57065)))))

(declare-fun b!1337903 () Bool)

(assert (=> b!1337903 (= e!761980 tp_is_empty!36925)))

(declare-fun b!1337904 () Bool)

(declare-fun res!887536 () Bool)

(assert (=> b!1337904 (=> (not res!887536) (not e!761981))))

(declare-datatypes ((List!31094 0))(
  ( (Nil!31091) (Cons!31090 (h!32308 (_ BitVec 64)) (t!45382 List!31094)) )
))
(declare-fun arrayNoDuplicates!0 (array!90825 (_ BitVec 32) List!31094) Bool)

(assert (=> b!1337904 (= res!887536 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31091))))

(declare-fun b!1337905 () Bool)

(assert (=> b!1337905 (= e!761983 tp_is_empty!36925)))

(assert (= (and start!112902 res!887537) b!1337898))

(assert (= (and b!1337898 res!887540) b!1337901))

(assert (= (and b!1337901 res!887534) b!1337904))

(assert (= (and b!1337904 res!887536) b!1337895))

(assert (= (and b!1337895 res!887539) b!1337896))

(assert (= (and b!1337896 res!887538) b!1337897))

(assert (= (and b!1337897 res!887541) b!1337900))

(assert (= (and b!1337900 res!887535) b!1337894))

(assert (= (and b!1337894 res!887542) b!1337899))

(assert (= (and b!1337902 condMapEmpty!57065) mapIsEmpty!57065))

(assert (= (and b!1337902 (not condMapEmpty!57065)) mapNonEmpty!57065))

(get-info :version)

(assert (= (and mapNonEmpty!57065 ((_ is ValueCellFull!17564) mapValue!57065)) b!1337903))

(assert (= (and b!1337902 ((_ is ValueCellFull!17564) mapDefault!57065)) b!1337905))

(assert (= start!112902 b!1337902))

(declare-fun b_lambda!24167 () Bool)

(assert (=> (not b_lambda!24167) (not b!1337899)))

(declare-fun t!45380 () Bool)

(declare-fun tb!12091 () Bool)

(assert (=> (and start!112902 (= defaultEntry!1323 defaultEntry!1323) t!45380) tb!12091))

(declare-fun result!25263 () Bool)

(assert (=> tb!12091 (= result!25263 tp_is_empty!36925)))

(assert (=> b!1337899 t!45380))

(declare-fun b_and!49971 () Bool)

(assert (= b_and!49969 (and (=> t!45380 result!25263) b_and!49971)))

(declare-fun m!1226265 () Bool)

(assert (=> b!1337904 m!1226265))

(declare-fun m!1226267 () Bool)

(assert (=> mapNonEmpty!57065 m!1226267))

(declare-fun m!1226269 () Bool)

(assert (=> b!1337896 m!1226269))

(assert (=> b!1337896 m!1226269))

(declare-fun m!1226271 () Bool)

(assert (=> b!1337896 m!1226271))

(declare-fun m!1226273 () Bool)

(assert (=> start!112902 m!1226273))

(declare-fun m!1226275 () Bool)

(assert (=> start!112902 m!1226275))

(declare-fun m!1226277 () Bool)

(assert (=> start!112902 m!1226277))

(declare-fun m!1226279 () Bool)

(assert (=> b!1337899 m!1226279))

(declare-fun m!1226281 () Bool)

(assert (=> b!1337899 m!1226281))

(assert (=> b!1337899 m!1226279))

(declare-fun m!1226283 () Bool)

(assert (=> b!1337899 m!1226283))

(declare-fun m!1226285 () Bool)

(assert (=> b!1337899 m!1226285))

(declare-fun m!1226287 () Bool)

(assert (=> b!1337899 m!1226287))

(assert (=> b!1337899 m!1226281))

(declare-fun m!1226289 () Bool)

(assert (=> b!1337899 m!1226289))

(declare-fun m!1226291 () Bool)

(assert (=> b!1337899 m!1226291))

(assert (=> b!1337899 m!1226285))

(declare-fun m!1226293 () Bool)

(assert (=> b!1337899 m!1226293))

(declare-fun m!1226295 () Bool)

(assert (=> b!1337901 m!1226295))

(assert (=> b!1337900 m!1226289))

(assert (=> b!1337900 m!1226289))

(declare-fun m!1226297 () Bool)

(assert (=> b!1337900 m!1226297))

(assert (=> b!1337897 m!1226289))

(check-sat (not b_next!31015) (not b!1337901) (not start!112902) tp_is_empty!36925 b_and!49971 (not mapNonEmpty!57065) (not b_lambda!24167) (not b!1337904) (not b!1337896) (not b!1337899) (not b!1337900))
(check-sat b_and!49971 (not b_next!31015))
