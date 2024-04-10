; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112292 () Bool)

(assert start!112292)

(declare-fun b_free!30687 () Bool)

(declare-fun b_next!30687 () Bool)

(assert (=> start!112292 (= b_free!30687 (not b_next!30687))))

(declare-fun tp!107697 () Bool)

(declare-fun b_and!49429 () Bool)

(assert (=> start!112292 (= tp!107697 b_and!49429)))

(declare-fun b!1330615 () Bool)

(declare-fun res!882937 () Bool)

(declare-fun e!758353 () Bool)

(assert (=> b!1330615 (=> (not res!882937) (not e!758353))))

(declare-datatypes ((V!53899 0))(
  ( (V!53900 (val!18373 Int)) )
))
(declare-datatypes ((ValueCell!17400 0))(
  ( (ValueCellFull!17400 (v!21010 V!53899)) (EmptyCell!17400) )
))
(declare-datatypes ((array!90078 0))(
  ( (array!90079 (arr!43505 (Array (_ BitVec 32) ValueCell!17400)) (size!44055 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90078)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!90080 0))(
  ( (array!90081 (arr!43506 (Array (_ BitVec 32) (_ BitVec 64))) (size!44056 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90080)

(assert (=> b!1330615 (= res!882937 (and (= (size!44055 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44056 _keys!1590) (size!44055 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330616 () Bool)

(declare-fun res!882936 () Bool)

(assert (=> b!1330616 (=> (not res!882936) (not e!758353))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330616 (= res!882936 (validKeyInArray!0 (select (arr!43506 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!56569 () Bool)

(declare-fun mapRes!56569 () Bool)

(declare-fun tp!107698 () Bool)

(declare-fun e!758355 () Bool)

(assert (=> mapNonEmpty!56569 (= mapRes!56569 (and tp!107698 e!758355))))

(declare-fun mapRest!56569 () (Array (_ BitVec 32) ValueCell!17400))

(declare-fun mapValue!56569 () ValueCell!17400)

(declare-fun mapKey!56569 () (_ BitVec 32))

(assert (=> mapNonEmpty!56569 (= (arr!43505 _values!1320) (store mapRest!56569 mapKey!56569 mapValue!56569))))

(declare-fun res!882938 () Bool)

(assert (=> start!112292 (=> (not res!882938) (not e!758353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112292 (= res!882938 (validMask!0 mask!1998))))

(assert (=> start!112292 e!758353))

(declare-fun e!758356 () Bool)

(declare-fun array_inv!32819 (array!90078) Bool)

(assert (=> start!112292 (and (array_inv!32819 _values!1320) e!758356)))

(assert (=> start!112292 true))

(declare-fun array_inv!32820 (array!90080) Bool)

(assert (=> start!112292 (array_inv!32820 _keys!1590)))

(assert (=> start!112292 tp!107697))

(declare-fun tp_is_empty!36597 () Bool)

(assert (=> start!112292 tp_is_empty!36597))

(declare-fun b!1330617 () Bool)

(declare-fun res!882933 () Bool)

(assert (=> b!1330617 (=> (not res!882933) (not e!758353))))

(declare-datatypes ((List!30812 0))(
  ( (Nil!30809) (Cons!30808 (h!32017 (_ BitVec 64)) (t!44912 List!30812)) )
))
(declare-fun arrayNoDuplicates!0 (array!90080 (_ BitVec 32) List!30812) Bool)

(assert (=> b!1330617 (= res!882933 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30809))))

(declare-fun b!1330618 () Bool)

(declare-fun res!882931 () Bool)

(assert (=> b!1330618 (=> (not res!882931) (not e!758353))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53899)

(declare-fun zeroValue!1262 () V!53899)

(declare-datatypes ((tuple2!23662 0))(
  ( (tuple2!23663 (_1!11842 (_ BitVec 64)) (_2!11842 V!53899)) )
))
(declare-datatypes ((List!30813 0))(
  ( (Nil!30810) (Cons!30809 (h!32018 tuple2!23662) (t!44913 List!30813)) )
))
(declare-datatypes ((ListLongMap!21319 0))(
  ( (ListLongMap!21320 (toList!10675 List!30813)) )
))
(declare-fun contains!8839 (ListLongMap!21319 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5662 (array!90080 array!90078 (_ BitVec 32) (_ BitVec 32) V!53899 V!53899 (_ BitVec 32) Int) ListLongMap!21319)

(assert (=> b!1330618 (= res!882931 (contains!8839 (getCurrentListMap!5662 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330619 () Bool)

(declare-fun e!758352 () Bool)

(assert (=> b!1330619 (= e!758352 tp_is_empty!36597)))

(declare-fun b!1330620 () Bool)

(declare-fun res!882935 () Bool)

(assert (=> b!1330620 (=> (not res!882935) (not e!758353))))

(assert (=> b!1330620 (= res!882935 (not (= (select (arr!43506 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330621 () Bool)

(declare-fun res!882934 () Bool)

(assert (=> b!1330621 (=> (not res!882934) (not e!758353))))

(assert (=> b!1330621 (= res!882934 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44056 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330622 () Bool)

(assert (=> b!1330622 (= e!758353 (not true))))

(declare-fun lt!591213 () ListLongMap!21319)

(assert (=> b!1330622 (contains!8839 lt!591213 k0!1153)))

(declare-datatypes ((Unit!43793 0))(
  ( (Unit!43794) )
))
(declare-fun lt!591211 () Unit!43793)

(declare-fun lt!591212 () V!53899)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!259 ((_ BitVec 64) (_ BitVec 64) V!53899 ListLongMap!21319) Unit!43793)

(assert (=> b!1330622 (= lt!591211 (lemmaInListMapAfterAddingDiffThenInBefore!259 k0!1153 (select (arr!43506 _keys!1590) from!1980) lt!591212 lt!591213))))

(declare-fun lt!591214 () ListLongMap!21319)

(assert (=> b!1330622 (contains!8839 lt!591214 k0!1153)))

(declare-fun lt!591210 () Unit!43793)

(assert (=> b!1330622 (= lt!591210 (lemmaInListMapAfterAddingDiffThenInBefore!259 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591214))))

(declare-fun +!4672 (ListLongMap!21319 tuple2!23662) ListLongMap!21319)

(assert (=> b!1330622 (= lt!591214 (+!4672 lt!591213 (tuple2!23663 (select (arr!43506 _keys!1590) from!1980) lt!591212)))))

(declare-fun get!21930 (ValueCell!17400 V!53899) V!53899)

(declare-fun dynLambda!3611 (Int (_ BitVec 64)) V!53899)

(assert (=> b!1330622 (= lt!591212 (get!21930 (select (arr!43505 _values!1320) from!1980) (dynLambda!3611 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6310 (array!90080 array!90078 (_ BitVec 32) (_ BitVec 32) V!53899 V!53899 (_ BitVec 32) Int) ListLongMap!21319)

(assert (=> b!1330622 (= lt!591213 (getCurrentListMapNoExtraKeys!6310 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1330623 () Bool)

(assert (=> b!1330623 (= e!758355 tp_is_empty!36597)))

(declare-fun mapIsEmpty!56569 () Bool)

(assert (=> mapIsEmpty!56569 mapRes!56569))

(declare-fun b!1330624 () Bool)

(declare-fun res!882932 () Bool)

(assert (=> b!1330624 (=> (not res!882932) (not e!758353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90080 (_ BitVec 32)) Bool)

(assert (=> b!1330624 (= res!882932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330625 () Bool)

(declare-fun res!882939 () Bool)

(assert (=> b!1330625 (=> (not res!882939) (not e!758353))))

(assert (=> b!1330625 (= res!882939 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330626 () Bool)

(assert (=> b!1330626 (= e!758356 (and e!758352 mapRes!56569))))

(declare-fun condMapEmpty!56569 () Bool)

(declare-fun mapDefault!56569 () ValueCell!17400)

(assert (=> b!1330626 (= condMapEmpty!56569 (= (arr!43505 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17400)) mapDefault!56569)))))

(assert (= (and start!112292 res!882938) b!1330615))

(assert (= (and b!1330615 res!882937) b!1330624))

(assert (= (and b!1330624 res!882932) b!1330617))

(assert (= (and b!1330617 res!882933) b!1330621))

(assert (= (and b!1330621 res!882934) b!1330618))

(assert (= (and b!1330618 res!882931) b!1330620))

(assert (= (and b!1330620 res!882935) b!1330616))

(assert (= (and b!1330616 res!882936) b!1330625))

(assert (= (and b!1330625 res!882939) b!1330622))

(assert (= (and b!1330626 condMapEmpty!56569) mapIsEmpty!56569))

(assert (= (and b!1330626 (not condMapEmpty!56569)) mapNonEmpty!56569))

(get-info :version)

(assert (= (and mapNonEmpty!56569 ((_ is ValueCellFull!17400) mapValue!56569)) b!1330623))

(assert (= (and b!1330626 ((_ is ValueCellFull!17400) mapDefault!56569)) b!1330619))

(assert (= start!112292 b!1330626))

(declare-fun b_lambda!23947 () Bool)

(assert (=> (not b_lambda!23947) (not b!1330622)))

(declare-fun t!44911 () Bool)

(declare-fun tb!11903 () Bool)

(assert (=> (and start!112292 (= defaultEntry!1323 defaultEntry!1323) t!44911) tb!11903))

(declare-fun result!24877 () Bool)

(assert (=> tb!11903 (= result!24877 tp_is_empty!36597)))

(assert (=> b!1330622 t!44911))

(declare-fun b_and!49431 () Bool)

(assert (= b_and!49429 (and (=> t!44911 result!24877) b_and!49431)))

(declare-fun m!1219277 () Bool)

(assert (=> b!1330618 m!1219277))

(assert (=> b!1330618 m!1219277))

(declare-fun m!1219279 () Bool)

(assert (=> b!1330618 m!1219279))

(declare-fun m!1219281 () Bool)

(assert (=> b!1330617 m!1219281))

(declare-fun m!1219283 () Bool)

(assert (=> mapNonEmpty!56569 m!1219283))

(declare-fun m!1219285 () Bool)

(assert (=> b!1330624 m!1219285))

(declare-fun m!1219287 () Bool)

(assert (=> b!1330620 m!1219287))

(declare-fun m!1219289 () Bool)

(assert (=> start!112292 m!1219289))

(declare-fun m!1219291 () Bool)

(assert (=> start!112292 m!1219291))

(declare-fun m!1219293 () Bool)

(assert (=> start!112292 m!1219293))

(assert (=> b!1330616 m!1219287))

(assert (=> b!1330616 m!1219287))

(declare-fun m!1219295 () Bool)

(assert (=> b!1330616 m!1219295))

(declare-fun m!1219297 () Bool)

(assert (=> b!1330622 m!1219297))

(declare-fun m!1219299 () Bool)

(assert (=> b!1330622 m!1219299))

(declare-fun m!1219301 () Bool)

(assert (=> b!1330622 m!1219301))

(assert (=> b!1330622 m!1219299))

(declare-fun m!1219303 () Bool)

(assert (=> b!1330622 m!1219303))

(declare-fun m!1219305 () Bool)

(assert (=> b!1330622 m!1219305))

(assert (=> b!1330622 m!1219287))

(declare-fun m!1219307 () Bool)

(assert (=> b!1330622 m!1219307))

(declare-fun m!1219309 () Bool)

(assert (=> b!1330622 m!1219309))

(declare-fun m!1219311 () Bool)

(assert (=> b!1330622 m!1219311))

(declare-fun m!1219313 () Bool)

(assert (=> b!1330622 m!1219313))

(assert (=> b!1330622 m!1219301))

(assert (=> b!1330622 m!1219287))

(check-sat (not b!1330616) b_and!49431 (not b!1330617) (not b!1330618) (not start!112292) (not b!1330624) (not b_next!30687) (not b!1330622) (not mapNonEmpty!56569) (not b_lambda!23947) tp_is_empty!36597)
(check-sat b_and!49431 (not b_next!30687))
