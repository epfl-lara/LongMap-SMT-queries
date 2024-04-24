; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111706 () Bool)

(assert start!111706)

(declare-fun b_free!30139 () Bool)

(declare-fun b_next!30139 () Bool)

(assert (=> start!111706 (= b_free!30139 (not b_next!30139))))

(declare-fun tp!105892 () Bool)

(declare-fun b_and!48439 () Bool)

(assert (=> start!111706 (= tp!105892 b_and!48439)))

(declare-fun b!1320949 () Bool)

(declare-fun res!876366 () Bool)

(declare-fun e!753724 () Bool)

(assert (=> b!1320949 (=> (not res!876366) (not e!753724))))

(declare-datatypes ((array!88927 0))(
  ( (array!88928 (arr!42933 (Array (_ BitVec 32) (_ BitVec 64))) (size!43484 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88927)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53049 0))(
  ( (V!53050 (val!18054 Int)) )
))
(declare-datatypes ((ValueCell!17081 0))(
  ( (ValueCellFull!17081 (v!20679 V!53049)) (EmptyCell!17081) )
))
(declare-datatypes ((array!88929 0))(
  ( (array!88930 (arr!42934 (Array (_ BitVec 32) ValueCell!17081)) (size!43485 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88929)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1320949 (= res!876366 (and (= (size!43485 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43484 _keys!1609) (size!43485 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320950 () Bool)

(declare-fun e!753727 () Bool)

(declare-fun e!753726 () Bool)

(declare-fun mapRes!55586 () Bool)

(assert (=> b!1320950 (= e!753727 (and e!753726 mapRes!55586))))

(declare-fun condMapEmpty!55586 () Bool)

(declare-fun mapDefault!55586 () ValueCell!17081)

(assert (=> b!1320950 (= condMapEmpty!55586 (= (arr!42934 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17081)) mapDefault!55586)))))

(declare-fun b!1320951 () Bool)

(declare-fun tp_is_empty!35959 () Bool)

(assert (=> b!1320951 (= e!753726 tp_is_empty!35959)))

(declare-fun mapIsEmpty!55586 () Bool)

(assert (=> mapIsEmpty!55586 mapRes!55586))

(declare-fun b!1320953 () Bool)

(declare-fun res!876363 () Bool)

(assert (=> b!1320953 (=> (not res!876363) (not e!753724))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320953 (= res!876363 (validKeyInArray!0 (select (arr!42933 _keys!1609) from!2000)))))

(declare-fun b!1320954 () Bool)

(declare-fun res!876370 () Bool)

(assert (=> b!1320954 (=> (not res!876370) (not e!753724))))

(declare-fun minValue!1279 () V!53049)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun zeroValue!1279 () V!53049)

(declare-datatypes ((tuple2!23276 0))(
  ( (tuple2!23277 (_1!11649 (_ BitVec 64)) (_2!11649 V!53049)) )
))
(declare-datatypes ((List!30433 0))(
  ( (Nil!30430) (Cons!30429 (h!31647 tuple2!23276) (t!44113 List!30433)) )
))
(declare-datatypes ((ListLongMap!20941 0))(
  ( (ListLongMap!20942 (toList!10486 List!30433)) )
))
(declare-fun contains!8653 (ListLongMap!20941 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5483 (array!88927 array!88929 (_ BitVec 32) (_ BitVec 32) V!53049 V!53049 (_ BitVec 32) Int) ListLongMap!20941)

(assert (=> b!1320954 (= res!876370 (contains!8653 (getCurrentListMap!5483 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320955 () Bool)

(assert (=> b!1320955 (= e!753724 (not true))))

(declare-fun lt!587156 () ListLongMap!20941)

(assert (=> b!1320955 (contains!8653 lt!587156 k0!1164)))

(declare-datatypes ((Unit!43433 0))(
  ( (Unit!43434) )
))
(declare-fun lt!587157 () Unit!43433)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!128 ((_ BitVec 64) (_ BitVec 64) V!53049 ListLongMap!20941) Unit!43433)

(assert (=> b!1320955 (= lt!587157 (lemmaInListMapAfterAddingDiffThenInBefore!128 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587156))))

(declare-fun lt!587159 () ListLongMap!20941)

(assert (=> b!1320955 (contains!8653 lt!587159 k0!1164)))

(declare-fun lt!587158 () Unit!43433)

(assert (=> b!1320955 (= lt!587158 (lemmaInListMapAfterAddingDiffThenInBefore!128 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587159))))

(declare-fun +!4573 (ListLongMap!20941 tuple2!23276) ListLongMap!20941)

(assert (=> b!1320955 (= lt!587159 (+!4573 lt!587156 (tuple2!23277 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6212 (array!88927 array!88929 (_ BitVec 32) (_ BitVec 32) V!53049 V!53049 (_ BitVec 32) Int) ListLongMap!20941)

(declare-fun get!21614 (ValueCell!17081 V!53049) V!53049)

(declare-fun dynLambda!3527 (Int (_ BitVec 64)) V!53049)

(assert (=> b!1320955 (= lt!587156 (+!4573 (getCurrentListMapNoExtraKeys!6212 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23277 (select (arr!42933 _keys!1609) from!2000) (get!21614 (select (arr!42934 _values!1337) from!2000) (dynLambda!3527 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320956 () Bool)

(declare-fun e!753723 () Bool)

(assert (=> b!1320956 (= e!753723 tp_is_empty!35959)))

(declare-fun b!1320957 () Bool)

(declare-fun res!876368 () Bool)

(assert (=> b!1320957 (=> (not res!876368) (not e!753724))))

(assert (=> b!1320957 (= res!876368 (not (= (select (arr!42933 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!55586 () Bool)

(declare-fun tp!105893 () Bool)

(assert (=> mapNonEmpty!55586 (= mapRes!55586 (and tp!105893 e!753723))))

(declare-fun mapRest!55586 () (Array (_ BitVec 32) ValueCell!17081))

(declare-fun mapKey!55586 () (_ BitVec 32))

(declare-fun mapValue!55586 () ValueCell!17081)

(assert (=> mapNonEmpty!55586 (= (arr!42934 _values!1337) (store mapRest!55586 mapKey!55586 mapValue!55586))))

(declare-fun b!1320952 () Bool)

(declare-fun res!876367 () Bool)

(assert (=> b!1320952 (=> (not res!876367) (not e!753724))))

(declare-datatypes ((List!30434 0))(
  ( (Nil!30431) (Cons!30430 (h!31648 (_ BitVec 64)) (t!44114 List!30434)) )
))
(declare-fun arrayNoDuplicates!0 (array!88927 (_ BitVec 32) List!30434) Bool)

(assert (=> b!1320952 (= res!876367 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30431))))

(declare-fun res!876365 () Bool)

(assert (=> start!111706 (=> (not res!876365) (not e!753724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111706 (= res!876365 (validMask!0 mask!2019))))

(assert (=> start!111706 e!753724))

(declare-fun array_inv!32689 (array!88927) Bool)

(assert (=> start!111706 (array_inv!32689 _keys!1609)))

(assert (=> start!111706 true))

(assert (=> start!111706 tp_is_empty!35959))

(declare-fun array_inv!32690 (array!88929) Bool)

(assert (=> start!111706 (and (array_inv!32690 _values!1337) e!753727)))

(assert (=> start!111706 tp!105892))

(declare-fun b!1320958 () Bool)

(declare-fun res!876369 () Bool)

(assert (=> b!1320958 (=> (not res!876369) (not e!753724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88927 (_ BitVec 32)) Bool)

(assert (=> b!1320958 (= res!876369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320959 () Bool)

(declare-fun res!876364 () Bool)

(assert (=> b!1320959 (=> (not res!876364) (not e!753724))))

(assert (=> b!1320959 (= res!876364 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43484 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111706 res!876365) b!1320949))

(assert (= (and b!1320949 res!876366) b!1320958))

(assert (= (and b!1320958 res!876369) b!1320952))

(assert (= (and b!1320952 res!876367) b!1320959))

(assert (= (and b!1320959 res!876364) b!1320954))

(assert (= (and b!1320954 res!876370) b!1320957))

(assert (= (and b!1320957 res!876368) b!1320953))

(assert (= (and b!1320953 res!876363) b!1320955))

(assert (= (and b!1320950 condMapEmpty!55586) mapIsEmpty!55586))

(assert (= (and b!1320950 (not condMapEmpty!55586)) mapNonEmpty!55586))

(get-info :version)

(assert (= (and mapNonEmpty!55586 ((_ is ValueCellFull!17081) mapValue!55586)) b!1320956))

(assert (= (and b!1320950 ((_ is ValueCellFull!17081) mapDefault!55586)) b!1320951))

(assert (= start!111706 b!1320950))

(declare-fun b_lambda!23459 () Bool)

(assert (=> (not b_lambda!23459) (not b!1320955)))

(declare-fun t!44112 () Bool)

(declare-fun tb!11483 () Bool)

(assert (=> (and start!111706 (= defaultEntry!1340 defaultEntry!1340) t!44112) tb!11483))

(declare-fun result!24029 () Bool)

(assert (=> tb!11483 (= result!24029 tp_is_empty!35959)))

(assert (=> b!1320955 t!44112))

(declare-fun b_and!48441 () Bool)

(assert (= b_and!48439 (and (=> t!44112 result!24029) b_and!48441)))

(declare-fun m!1208849 () Bool)

(assert (=> b!1320952 m!1208849))

(declare-fun m!1208851 () Bool)

(assert (=> start!111706 m!1208851))

(declare-fun m!1208853 () Bool)

(assert (=> start!111706 m!1208853))

(declare-fun m!1208855 () Bool)

(assert (=> start!111706 m!1208855))

(declare-fun m!1208857 () Bool)

(assert (=> b!1320958 m!1208857))

(declare-fun m!1208859 () Bool)

(assert (=> b!1320954 m!1208859))

(assert (=> b!1320954 m!1208859))

(declare-fun m!1208861 () Bool)

(assert (=> b!1320954 m!1208861))

(declare-fun m!1208863 () Bool)

(assert (=> b!1320957 m!1208863))

(declare-fun m!1208865 () Bool)

(assert (=> b!1320955 m!1208865))

(assert (=> b!1320955 m!1208865))

(declare-fun m!1208867 () Bool)

(assert (=> b!1320955 m!1208867))

(declare-fun m!1208869 () Bool)

(assert (=> b!1320955 m!1208869))

(declare-fun m!1208871 () Bool)

(assert (=> b!1320955 m!1208871))

(assert (=> b!1320955 m!1208871))

(declare-fun m!1208873 () Bool)

(assert (=> b!1320955 m!1208873))

(declare-fun m!1208875 () Bool)

(assert (=> b!1320955 m!1208875))

(assert (=> b!1320955 m!1208863))

(assert (=> b!1320955 m!1208873))

(declare-fun m!1208877 () Bool)

(assert (=> b!1320955 m!1208877))

(declare-fun m!1208879 () Bool)

(assert (=> b!1320955 m!1208879))

(declare-fun m!1208881 () Bool)

(assert (=> b!1320955 m!1208881))

(declare-fun m!1208883 () Bool)

(assert (=> b!1320955 m!1208883))

(declare-fun m!1208885 () Bool)

(assert (=> mapNonEmpty!55586 m!1208885))

(assert (=> b!1320953 m!1208863))

(assert (=> b!1320953 m!1208863))

(declare-fun m!1208887 () Bool)

(assert (=> b!1320953 m!1208887))

(check-sat b_and!48441 (not mapNonEmpty!55586) (not b!1320958) (not b_next!30139) (not b_lambda!23459) tp_is_empty!35959 (not b!1320954) (not b!1320953) (not start!111706) (not b!1320952) (not b!1320955))
(check-sat b_and!48441 (not b_next!30139))
