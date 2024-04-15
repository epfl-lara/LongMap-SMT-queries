; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112296 () Bool)

(assert start!112296)

(declare-fun b_free!30691 () Bool)

(declare-fun b_next!30691 () Bool)

(assert (=> start!112296 (= b_free!30691 (not b_next!30691))))

(declare-fun tp!107711 () Bool)

(declare-fun b_and!49419 () Bool)

(assert (=> start!112296 (= tp!107711 b_and!49419)))

(declare-fun b!1330621 () Bool)

(declare-fun res!882964 () Bool)

(declare-fun e!758350 () Bool)

(assert (=> b!1330621 (=> (not res!882964) (not e!758350))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1330621 (= res!882964 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330622 () Bool)

(assert (=> b!1330622 (= e!758350 (not true))))

(declare-datatypes ((V!53905 0))(
  ( (V!53906 (val!18375 Int)) )
))
(declare-datatypes ((tuple2!23728 0))(
  ( (tuple2!23729 (_1!11875 (_ BitVec 64)) (_2!11875 V!53905)) )
))
(declare-datatypes ((List!30869 0))(
  ( (Nil!30866) (Cons!30865 (h!32074 tuple2!23728) (t!44965 List!30869)) )
))
(declare-datatypes ((ListLongMap!21385 0))(
  ( (ListLongMap!21386 (toList!10708 List!30869)) )
))
(declare-fun lt!591058 () ListLongMap!21385)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8800 (ListLongMap!21385 (_ BitVec 64)) Bool)

(assert (=> b!1330622 (contains!8800 lt!591058 k0!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90021 0))(
  ( (array!90022 (arr!43477 (Array (_ BitVec 32) (_ BitVec 64))) (size!44029 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90021)

(declare-fun lt!591057 () V!53905)

(declare-datatypes ((Unit!43594 0))(
  ( (Unit!43595) )
))
(declare-fun lt!591054 () Unit!43594)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!247 ((_ BitVec 64) (_ BitVec 64) V!53905 ListLongMap!21385) Unit!43594)

(assert (=> b!1330622 (= lt!591054 (lemmaInListMapAfterAddingDiffThenInBefore!247 k0!1153 (select (arr!43477 _keys!1590) from!1980) lt!591057 lt!591058))))

(declare-fun lt!591056 () ListLongMap!21385)

(assert (=> b!1330622 (contains!8800 lt!591056 k0!1153)))

(declare-fun lt!591055 () Unit!43594)

(declare-fun minValue!1262 () V!53905)

(assert (=> b!1330622 (= lt!591055 (lemmaInListMapAfterAddingDiffThenInBefore!247 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591056))))

(declare-fun +!4691 (ListLongMap!21385 tuple2!23728) ListLongMap!21385)

(assert (=> b!1330622 (= lt!591056 (+!4691 lt!591058 (tuple2!23729 (select (arr!43477 _keys!1590) from!1980) lt!591057)))))

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((ValueCell!17402 0))(
  ( (ValueCellFull!17402 (v!21011 V!53905)) (EmptyCell!17402) )
))
(declare-datatypes ((array!90023 0))(
  ( (array!90024 (arr!43478 (Array (_ BitVec 32) ValueCell!17402)) (size!44030 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90023)

(declare-fun get!21918 (ValueCell!17402 V!53905) V!53905)

(declare-fun dynLambda!3621 (Int (_ BitVec 64)) V!53905)

(assert (=> b!1330622 (= lt!591057 (get!21918 (select (arr!43478 _values!1320) from!1980) (dynLambda!3621 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53905)

(declare-fun getCurrentListMapNoExtraKeys!6329 (array!90021 array!90023 (_ BitVec 32) (_ BitVec 32) V!53905 V!53905 (_ BitVec 32) Int) ListLongMap!21385)

(assert (=> b!1330622 (= lt!591058 (getCurrentListMapNoExtraKeys!6329 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun res!882956 () Bool)

(assert (=> start!112296 (=> (not res!882956) (not e!758350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112296 (= res!882956 (validMask!0 mask!1998))))

(assert (=> start!112296 e!758350))

(declare-fun e!758353 () Bool)

(declare-fun array_inv!32975 (array!90023) Bool)

(assert (=> start!112296 (and (array_inv!32975 _values!1320) e!758353)))

(assert (=> start!112296 true))

(declare-fun array_inv!32976 (array!90021) Bool)

(assert (=> start!112296 (array_inv!32976 _keys!1590)))

(assert (=> start!112296 tp!107711))

(declare-fun tp_is_empty!36601 () Bool)

(assert (=> start!112296 tp_is_empty!36601))

(declare-fun b!1330623 () Bool)

(declare-fun res!882961 () Bool)

(assert (=> b!1330623 (=> (not res!882961) (not e!758350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330623 (= res!882961 (validKeyInArray!0 (select (arr!43477 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!56575 () Bool)

(declare-fun mapRes!56575 () Bool)

(declare-fun tp!107710 () Bool)

(declare-fun e!758351 () Bool)

(assert (=> mapNonEmpty!56575 (= mapRes!56575 (and tp!107710 e!758351))))

(declare-fun mapRest!56575 () (Array (_ BitVec 32) ValueCell!17402))

(declare-fun mapKey!56575 () (_ BitVec 32))

(declare-fun mapValue!56575 () ValueCell!17402)

(assert (=> mapNonEmpty!56575 (= (arr!43478 _values!1320) (store mapRest!56575 mapKey!56575 mapValue!56575))))

(declare-fun b!1330624 () Bool)

(declare-fun res!882959 () Bool)

(assert (=> b!1330624 (=> (not res!882959) (not e!758350))))

(declare-datatypes ((List!30870 0))(
  ( (Nil!30867) (Cons!30866 (h!32075 (_ BitVec 64)) (t!44966 List!30870)) )
))
(declare-fun arrayNoDuplicates!0 (array!90021 (_ BitVec 32) List!30870) Bool)

(assert (=> b!1330624 (= res!882959 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30867))))

(declare-fun b!1330625 () Bool)

(assert (=> b!1330625 (= e!758351 tp_is_empty!36601)))

(declare-fun b!1330626 () Bool)

(declare-fun res!882962 () Bool)

(assert (=> b!1330626 (=> (not res!882962) (not e!758350))))

(assert (=> b!1330626 (= res!882962 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44029 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330627 () Bool)

(declare-fun res!882958 () Bool)

(assert (=> b!1330627 (=> (not res!882958) (not e!758350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90021 (_ BitVec 32)) Bool)

(assert (=> b!1330627 (= res!882958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330628 () Bool)

(declare-fun e!758352 () Bool)

(assert (=> b!1330628 (= e!758353 (and e!758352 mapRes!56575))))

(declare-fun condMapEmpty!56575 () Bool)

(declare-fun mapDefault!56575 () ValueCell!17402)

(assert (=> b!1330628 (= condMapEmpty!56575 (= (arr!43478 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17402)) mapDefault!56575)))))

(declare-fun b!1330629 () Bool)

(declare-fun res!882957 () Bool)

(assert (=> b!1330629 (=> (not res!882957) (not e!758350))))

(assert (=> b!1330629 (= res!882957 (and (= (size!44030 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44029 _keys!1590) (size!44030 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330630 () Bool)

(assert (=> b!1330630 (= e!758352 tp_is_empty!36601)))

(declare-fun mapIsEmpty!56575 () Bool)

(assert (=> mapIsEmpty!56575 mapRes!56575))

(declare-fun b!1330631 () Bool)

(declare-fun res!882963 () Bool)

(assert (=> b!1330631 (=> (not res!882963) (not e!758350))))

(declare-fun getCurrentListMap!5572 (array!90021 array!90023 (_ BitVec 32) (_ BitVec 32) V!53905 V!53905 (_ BitVec 32) Int) ListLongMap!21385)

(assert (=> b!1330631 (= res!882963 (contains!8800 (getCurrentListMap!5572 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330632 () Bool)

(declare-fun res!882960 () Bool)

(assert (=> b!1330632 (=> (not res!882960) (not e!758350))))

(assert (=> b!1330632 (= res!882960 (not (= (select (arr!43477 _keys!1590) from!1980) k0!1153)))))

(assert (= (and start!112296 res!882956) b!1330629))

(assert (= (and b!1330629 res!882957) b!1330627))

(assert (= (and b!1330627 res!882958) b!1330624))

(assert (= (and b!1330624 res!882959) b!1330626))

(assert (= (and b!1330626 res!882962) b!1330631))

(assert (= (and b!1330631 res!882963) b!1330632))

(assert (= (and b!1330632 res!882960) b!1330623))

(assert (= (and b!1330623 res!882961) b!1330621))

(assert (= (and b!1330621 res!882964) b!1330622))

(assert (= (and b!1330628 condMapEmpty!56575) mapIsEmpty!56575))

(assert (= (and b!1330628 (not condMapEmpty!56575)) mapNonEmpty!56575))

(get-info :version)

(assert (= (and mapNonEmpty!56575 ((_ is ValueCellFull!17402) mapValue!56575)) b!1330625))

(assert (= (and b!1330628 ((_ is ValueCellFull!17402) mapDefault!56575)) b!1330630))

(assert (= start!112296 b!1330628))

(declare-fun b_lambda!23941 () Bool)

(assert (=> (not b_lambda!23941) (not b!1330622)))

(declare-fun t!44964 () Bool)

(declare-fun tb!11899 () Bool)

(assert (=> (and start!112296 (= defaultEntry!1323 defaultEntry!1323) t!44964) tb!11899))

(declare-fun result!24877 () Bool)

(assert (=> tb!11899 (= result!24877 tp_is_empty!36601)))

(assert (=> b!1330622 t!44964))

(declare-fun b_and!49421 () Bool)

(assert (= b_and!49419 (and (=> t!44964 result!24877) b_and!49421)))

(declare-fun m!1218837 () Bool)

(assert (=> b!1330627 m!1218837))

(declare-fun m!1218839 () Bool)

(assert (=> mapNonEmpty!56575 m!1218839))

(declare-fun m!1218841 () Bool)

(assert (=> b!1330632 m!1218841))

(declare-fun m!1218843 () Bool)

(assert (=> start!112296 m!1218843))

(declare-fun m!1218845 () Bool)

(assert (=> start!112296 m!1218845))

(declare-fun m!1218847 () Bool)

(assert (=> start!112296 m!1218847))

(assert (=> b!1330623 m!1218841))

(assert (=> b!1330623 m!1218841))

(declare-fun m!1218849 () Bool)

(assert (=> b!1330623 m!1218849))

(declare-fun m!1218851 () Bool)

(assert (=> b!1330631 m!1218851))

(assert (=> b!1330631 m!1218851))

(declare-fun m!1218853 () Bool)

(assert (=> b!1330631 m!1218853))

(declare-fun m!1218855 () Bool)

(assert (=> b!1330622 m!1218855))

(declare-fun m!1218857 () Bool)

(assert (=> b!1330622 m!1218857))

(assert (=> b!1330622 m!1218855))

(declare-fun m!1218859 () Bool)

(assert (=> b!1330622 m!1218859))

(assert (=> b!1330622 m!1218841))

(declare-fun m!1218861 () Bool)

(assert (=> b!1330622 m!1218861))

(declare-fun m!1218863 () Bool)

(assert (=> b!1330622 m!1218863))

(declare-fun m!1218865 () Bool)

(assert (=> b!1330622 m!1218865))

(assert (=> b!1330622 m!1218857))

(declare-fun m!1218867 () Bool)

(assert (=> b!1330622 m!1218867))

(assert (=> b!1330622 m!1218841))

(declare-fun m!1218869 () Bool)

(assert (=> b!1330622 m!1218869))

(declare-fun m!1218871 () Bool)

(assert (=> b!1330622 m!1218871))

(declare-fun m!1218873 () Bool)

(assert (=> b!1330624 m!1218873))

(check-sat (not mapNonEmpty!56575) tp_is_empty!36601 (not start!112296) (not b_lambda!23941) b_and!49421 (not b!1330623) (not b_next!30691) (not b!1330622) (not b!1330631) (not b!1330624) (not b!1330627))
(check-sat b_and!49421 (not b_next!30691))
