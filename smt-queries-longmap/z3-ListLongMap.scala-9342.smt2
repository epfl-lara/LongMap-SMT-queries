; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111712 () Bool)

(assert start!111712)

(declare-fun b_free!30145 () Bool)

(declare-fun b_next!30145 () Bool)

(assert (=> start!111712 (= b_free!30145 (not b_next!30145))))

(declare-fun tp!105910 () Bool)

(declare-fun b_and!48451 () Bool)

(assert (=> start!111712 (= tp!105910 b_and!48451)))

(declare-fun b!1321054 () Bool)

(declare-fun res!876438 () Bool)

(declare-fun e!753769 () Bool)

(assert (=> b!1321054 (=> (not res!876438) (not e!753769))))

(declare-datatypes ((array!88939 0))(
  ( (array!88940 (arr!42939 (Array (_ BitVec 32) (_ BitVec 64))) (size!43490 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88939)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88939 (_ BitVec 32)) Bool)

(assert (=> b!1321054 (= res!876438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55595 () Bool)

(declare-fun mapRes!55595 () Bool)

(assert (=> mapIsEmpty!55595 mapRes!55595))

(declare-fun b!1321055 () Bool)

(declare-fun res!876442 () Bool)

(assert (=> b!1321055 (=> (not res!876442) (not e!753769))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1321055 (= res!876442 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43490 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321057 () Bool)

(assert (=> b!1321057 (= e!753769 (not true))))

(declare-datatypes ((V!53057 0))(
  ( (V!53058 (val!18057 Int)) )
))
(declare-datatypes ((tuple2!23278 0))(
  ( (tuple2!23279 (_1!11650 (_ BitVec 64)) (_2!11650 V!53057)) )
))
(declare-datatypes ((List!30435 0))(
  ( (Nil!30432) (Cons!30431 (h!31649 tuple2!23278) (t!44121 List!30435)) )
))
(declare-datatypes ((ListLongMap!20943 0))(
  ( (ListLongMap!20944 (toList!10487 List!30435)) )
))
(declare-fun lt!587195 () ListLongMap!20943)

(declare-fun contains!8654 (ListLongMap!20943 (_ BitVec 64)) Bool)

(assert (=> b!1321057 (contains!8654 lt!587195 k0!1164)))

(declare-datatypes ((Unit!43435 0))(
  ( (Unit!43436) )
))
(declare-fun lt!587193 () Unit!43435)

(declare-fun zeroValue!1279 () V!53057)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!129 ((_ BitVec 64) (_ BitVec 64) V!53057 ListLongMap!20943) Unit!43435)

(assert (=> b!1321057 (= lt!587193 (lemmaInListMapAfterAddingDiffThenInBefore!129 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587195))))

(declare-fun lt!587194 () ListLongMap!20943)

(assert (=> b!1321057 (contains!8654 lt!587194 k0!1164)))

(declare-fun minValue!1279 () V!53057)

(declare-fun lt!587192 () Unit!43435)

(assert (=> b!1321057 (= lt!587192 (lemmaInListMapAfterAddingDiffThenInBefore!129 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587194))))

(declare-fun +!4574 (ListLongMap!20943 tuple2!23278) ListLongMap!20943)

(assert (=> b!1321057 (= lt!587194 (+!4574 lt!587195 (tuple2!23279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-datatypes ((ValueCell!17084 0))(
  ( (ValueCellFull!17084 (v!20682 V!53057)) (EmptyCell!17084) )
))
(declare-datatypes ((array!88941 0))(
  ( (array!88942 (arr!42940 (Array (_ BitVec 32) ValueCell!17084)) (size!43491 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88941)

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6213 (array!88939 array!88941 (_ BitVec 32) (_ BitVec 32) V!53057 V!53057 (_ BitVec 32) Int) ListLongMap!20943)

(declare-fun get!21617 (ValueCell!17084 V!53057) V!53057)

(declare-fun dynLambda!3528 (Int (_ BitVec 64)) V!53057)

(assert (=> b!1321057 (= lt!587195 (+!4574 (getCurrentListMapNoExtraKeys!6213 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23279 (select (arr!42939 _keys!1609) from!2000) (get!21617 (select (arr!42940 _values!1337) from!2000) (dynLambda!3528 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1321058 () Bool)

(declare-fun res!876439 () Bool)

(assert (=> b!1321058 (=> (not res!876439) (not e!753769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321058 (= res!876439 (validKeyInArray!0 (select (arr!42939 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55595 () Bool)

(declare-fun tp!105911 () Bool)

(declare-fun e!753770 () Bool)

(assert (=> mapNonEmpty!55595 (= mapRes!55595 (and tp!105911 e!753770))))

(declare-fun mapValue!55595 () ValueCell!17084)

(declare-fun mapRest!55595 () (Array (_ BitVec 32) ValueCell!17084))

(declare-fun mapKey!55595 () (_ BitVec 32))

(assert (=> mapNonEmpty!55595 (= (arr!42940 _values!1337) (store mapRest!55595 mapKey!55595 mapValue!55595))))

(declare-fun b!1321059 () Bool)

(declare-fun e!753772 () Bool)

(declare-fun tp_is_empty!35965 () Bool)

(assert (=> b!1321059 (= e!753772 tp_is_empty!35965)))

(declare-fun b!1321060 () Bool)

(declare-fun res!876436 () Bool)

(assert (=> b!1321060 (=> (not res!876436) (not e!753769))))

(declare-datatypes ((List!30436 0))(
  ( (Nil!30433) (Cons!30432 (h!31650 (_ BitVec 64)) (t!44122 List!30436)) )
))
(declare-fun arrayNoDuplicates!0 (array!88939 (_ BitVec 32) List!30436) Bool)

(assert (=> b!1321060 (= res!876436 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30433))))

(declare-fun b!1321061 () Bool)

(assert (=> b!1321061 (= e!753770 tp_is_empty!35965)))

(declare-fun b!1321062 () Bool)

(declare-fun res!876435 () Bool)

(assert (=> b!1321062 (=> (not res!876435) (not e!753769))))

(declare-fun getCurrentListMap!5484 (array!88939 array!88941 (_ BitVec 32) (_ BitVec 32) V!53057 V!53057 (_ BitVec 32) Int) ListLongMap!20943)

(assert (=> b!1321062 (= res!876435 (contains!8654 (getCurrentListMap!5484 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321056 () Bool)

(declare-fun res!876440 () Bool)

(assert (=> b!1321056 (=> (not res!876440) (not e!753769))))

(assert (=> b!1321056 (= res!876440 (not (= (select (arr!42939 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!876441 () Bool)

(assert (=> start!111712 (=> (not res!876441) (not e!753769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111712 (= res!876441 (validMask!0 mask!2019))))

(assert (=> start!111712 e!753769))

(declare-fun array_inv!32691 (array!88939) Bool)

(assert (=> start!111712 (array_inv!32691 _keys!1609)))

(assert (=> start!111712 true))

(assert (=> start!111712 tp_is_empty!35965))

(declare-fun e!753768 () Bool)

(declare-fun array_inv!32692 (array!88941) Bool)

(assert (=> start!111712 (and (array_inv!32692 _values!1337) e!753768)))

(assert (=> start!111712 tp!105910))

(declare-fun b!1321063 () Bool)

(assert (=> b!1321063 (= e!753768 (and e!753772 mapRes!55595))))

(declare-fun condMapEmpty!55595 () Bool)

(declare-fun mapDefault!55595 () ValueCell!17084)

(assert (=> b!1321063 (= condMapEmpty!55595 (= (arr!42940 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17084)) mapDefault!55595)))))

(declare-fun b!1321064 () Bool)

(declare-fun res!876437 () Bool)

(assert (=> b!1321064 (=> (not res!876437) (not e!753769))))

(assert (=> b!1321064 (= res!876437 (and (= (size!43491 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43490 _keys!1609) (size!43491 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111712 res!876441) b!1321064))

(assert (= (and b!1321064 res!876437) b!1321054))

(assert (= (and b!1321054 res!876438) b!1321060))

(assert (= (and b!1321060 res!876436) b!1321055))

(assert (= (and b!1321055 res!876442) b!1321062))

(assert (= (and b!1321062 res!876435) b!1321056))

(assert (= (and b!1321056 res!876440) b!1321058))

(assert (= (and b!1321058 res!876439) b!1321057))

(assert (= (and b!1321063 condMapEmpty!55595) mapIsEmpty!55595))

(assert (= (and b!1321063 (not condMapEmpty!55595)) mapNonEmpty!55595))

(get-info :version)

(assert (= (and mapNonEmpty!55595 ((_ is ValueCellFull!17084) mapValue!55595)) b!1321061))

(assert (= (and b!1321063 ((_ is ValueCellFull!17084) mapDefault!55595)) b!1321059))

(assert (= start!111712 b!1321063))

(declare-fun b_lambda!23465 () Bool)

(assert (=> (not b_lambda!23465) (not b!1321057)))

(declare-fun t!44120 () Bool)

(declare-fun tb!11489 () Bool)

(assert (=> (and start!111712 (= defaultEntry!1340 defaultEntry!1340) t!44120) tb!11489))

(declare-fun result!24041 () Bool)

(assert (=> tb!11489 (= result!24041 tp_is_empty!35965)))

(assert (=> b!1321057 t!44120))

(declare-fun b_and!48453 () Bool)

(assert (= b_and!48451 (and (=> t!44120 result!24041) b_and!48453)))

(declare-fun m!1208969 () Bool)

(assert (=> b!1321058 m!1208969))

(assert (=> b!1321058 m!1208969))

(declare-fun m!1208971 () Bool)

(assert (=> b!1321058 m!1208971))

(declare-fun m!1208973 () Bool)

(assert (=> b!1321054 m!1208973))

(declare-fun m!1208975 () Bool)

(assert (=> mapNonEmpty!55595 m!1208975))

(declare-fun m!1208977 () Bool)

(assert (=> b!1321062 m!1208977))

(assert (=> b!1321062 m!1208977))

(declare-fun m!1208979 () Bool)

(assert (=> b!1321062 m!1208979))

(declare-fun m!1208981 () Bool)

(assert (=> start!111712 m!1208981))

(declare-fun m!1208983 () Bool)

(assert (=> start!111712 m!1208983))

(declare-fun m!1208985 () Bool)

(assert (=> start!111712 m!1208985))

(declare-fun m!1208987 () Bool)

(assert (=> b!1321060 m!1208987))

(declare-fun m!1208989 () Bool)

(assert (=> b!1321057 m!1208989))

(declare-fun m!1208991 () Bool)

(assert (=> b!1321057 m!1208991))

(declare-fun m!1208993 () Bool)

(assert (=> b!1321057 m!1208993))

(assert (=> b!1321057 m!1208991))

(declare-fun m!1208995 () Bool)

(assert (=> b!1321057 m!1208995))

(declare-fun m!1208997 () Bool)

(assert (=> b!1321057 m!1208997))

(declare-fun m!1208999 () Bool)

(assert (=> b!1321057 m!1208999))

(declare-fun m!1209001 () Bool)

(assert (=> b!1321057 m!1209001))

(assert (=> b!1321057 m!1208999))

(declare-fun m!1209003 () Bool)

(assert (=> b!1321057 m!1209003))

(declare-fun m!1209005 () Bool)

(assert (=> b!1321057 m!1209005))

(assert (=> b!1321057 m!1208969))

(assert (=> b!1321057 m!1209003))

(declare-fun m!1209007 () Bool)

(assert (=> b!1321057 m!1209007))

(assert (=> b!1321056 m!1208969))

(check-sat tp_is_empty!35965 (not b!1321062) (not b!1321057) (not b!1321060) (not b_lambda!23465) (not start!111712) (not b_next!30145) (not b!1321058) (not b!1321054) b_and!48453 (not mapNonEmpty!55595))
(check-sat b_and!48453 (not b_next!30145))
