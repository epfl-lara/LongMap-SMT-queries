; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111542 () Bool)

(assert start!111542)

(declare-fun b_free!30199 () Bool)

(declare-fun b_next!30199 () Bool)

(assert (=> start!111542 (= b_free!30199 (not b_next!30199))))

(declare-fun tp!106074 () Bool)

(declare-fun b_and!48539 () Bool)

(assert (=> start!111542 (= tp!106074 b_and!48539)))

(declare-fun b!1320630 () Bool)

(declare-fun res!876543 () Bool)

(declare-fun e!753298 () Bool)

(assert (=> b!1320630 (=> (not res!876543) (not e!753298))))

(declare-datatypes ((array!88891 0))(
  ( (array!88892 (arr!42920 (Array (_ BitVec 32) (_ BitVec 64))) (size!43472 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88891)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1320630 (= res!876543 (not (= (select (arr!42920 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1320631 () Bool)

(declare-fun res!876541 () Bool)

(assert (=> b!1320631 (=> (not res!876541) (not e!753298))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88891 (_ BitVec 32)) Bool)

(assert (=> b!1320631 (= res!876541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!876536 () Bool)

(assert (=> start!111542 (=> (not res!876536) (not e!753298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111542 (= res!876536 (validMask!0 mask!2019))))

(assert (=> start!111542 e!753298))

(declare-fun array_inv!32589 (array!88891) Bool)

(assert (=> start!111542 (array_inv!32589 _keys!1609)))

(assert (=> start!111542 true))

(declare-fun tp_is_empty!36019 () Bool)

(assert (=> start!111542 tp_is_empty!36019))

(declare-datatypes ((V!53129 0))(
  ( (V!53130 (val!18084 Int)) )
))
(declare-datatypes ((ValueCell!17111 0))(
  ( (ValueCellFull!17111 (v!20713 V!53129)) (EmptyCell!17111) )
))
(declare-datatypes ((array!88893 0))(
  ( (array!88894 (arr!42921 (Array (_ BitVec 32) ValueCell!17111)) (size!43473 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88893)

(declare-fun e!753299 () Bool)

(declare-fun array_inv!32590 (array!88893) Bool)

(assert (=> start!111542 (and (array_inv!32590 _values!1337) e!753299)))

(assert (=> start!111542 tp!106074))

(declare-fun b!1320632 () Bool)

(declare-fun e!753301 () Bool)

(assert (=> b!1320632 (= e!753301 tp_is_empty!36019)))

(declare-fun b!1320633 () Bool)

(declare-fun res!876540 () Bool)

(assert (=> b!1320633 (=> (not res!876540) (not e!753298))))

(declare-datatypes ((List!30500 0))(
  ( (Nil!30497) (Cons!30496 (h!31705 (_ BitVec 64)) (t!44240 List!30500)) )
))
(declare-fun arrayNoDuplicates!0 (array!88891 (_ BitVec 32) List!30500) Bool)

(assert (=> b!1320633 (= res!876540 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30497))))

(declare-fun b!1320634 () Bool)

(declare-fun res!876538 () Bool)

(assert (=> b!1320634 (=> (not res!876538) (not e!753298))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53129)

(declare-fun minValue!1279 () V!53129)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23366 0))(
  ( (tuple2!23367 (_1!11694 (_ BitVec 64)) (_2!11694 V!53129)) )
))
(declare-datatypes ((List!30501 0))(
  ( (Nil!30498) (Cons!30497 (h!31706 tuple2!23366) (t!44241 List!30501)) )
))
(declare-datatypes ((ListLongMap!21023 0))(
  ( (ListLongMap!21024 (toList!10527 List!30501)) )
))
(declare-fun contains!8610 (ListLongMap!21023 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5414 (array!88891 array!88893 (_ BitVec 32) (_ BitVec 32) V!53129 V!53129 (_ BitVec 32) Int) ListLongMap!21023)

(assert (=> b!1320634 (= res!876538 (contains!8610 (getCurrentListMap!5414 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320635 () Bool)

(declare-fun e!753300 () Bool)

(assert (=> b!1320635 (= e!753300 tp_is_empty!36019)))

(declare-fun b!1320636 () Bool)

(declare-fun res!876537 () Bool)

(assert (=> b!1320636 (=> (not res!876537) (not e!753298))))

(assert (=> b!1320636 (= res!876537 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43472 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320637 () Bool)

(declare-fun res!876539 () Bool)

(assert (=> b!1320637 (=> (not res!876539) (not e!753298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320637 (= res!876539 (validKeyInArray!0 (select (arr!42920 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55676 () Bool)

(declare-fun mapRes!55676 () Bool)

(declare-fun tp!106073 () Bool)

(assert (=> mapNonEmpty!55676 (= mapRes!55676 (and tp!106073 e!753301))))

(declare-fun mapRest!55676 () (Array (_ BitVec 32) ValueCell!17111))

(declare-fun mapKey!55676 () (_ BitVec 32))

(declare-fun mapValue!55676 () ValueCell!17111)

(assert (=> mapNonEmpty!55676 (= (arr!42921 _values!1337) (store mapRest!55676 mapKey!55676 mapValue!55676))))

(declare-fun b!1320638 () Bool)

(assert (=> b!1320638 (= e!753298 (not true))))

(declare-fun lt!586854 () ListLongMap!21023)

(assert (=> b!1320638 (contains!8610 lt!586854 k0!1164)))

(declare-datatypes ((Unit!43325 0))(
  ( (Unit!43326) )
))
(declare-fun lt!586855 () Unit!43325)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!136 ((_ BitVec 64) (_ BitVec 64) V!53129 ListLongMap!21023) Unit!43325)

(assert (=> b!1320638 (= lt!586855 (lemmaInListMapAfterAddingDiffThenInBefore!136 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586854))))

(declare-fun lt!586856 () ListLongMap!21023)

(assert (=> b!1320638 (contains!8610 lt!586856 k0!1164)))

(declare-fun lt!586857 () Unit!43325)

(assert (=> b!1320638 (= lt!586857 (lemmaInListMapAfterAddingDiffThenInBefore!136 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586856))))

(declare-fun +!4571 (ListLongMap!21023 tuple2!23366) ListLongMap!21023)

(assert (=> b!1320638 (= lt!586856 (+!4571 lt!586854 (tuple2!23367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6204 (array!88891 array!88893 (_ BitVec 32) (_ BitVec 32) V!53129 V!53129 (_ BitVec 32) Int) ListLongMap!21023)

(declare-fun get!21596 (ValueCell!17111 V!53129) V!53129)

(declare-fun dynLambda!3501 (Int (_ BitVec 64)) V!53129)

(assert (=> b!1320638 (= lt!586854 (+!4571 (getCurrentListMapNoExtraKeys!6204 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23367 (select (arr!42920 _keys!1609) from!2000) (get!21596 (select (arr!42921 _values!1337) from!2000) (dynLambda!3501 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320639 () Bool)

(declare-fun res!876542 () Bool)

(assert (=> b!1320639 (=> (not res!876542) (not e!753298))))

(assert (=> b!1320639 (= res!876542 (and (= (size!43473 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43472 _keys!1609) (size!43473 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320640 () Bool)

(assert (=> b!1320640 (= e!753299 (and e!753300 mapRes!55676))))

(declare-fun condMapEmpty!55676 () Bool)

(declare-fun mapDefault!55676 () ValueCell!17111)

(assert (=> b!1320640 (= condMapEmpty!55676 (= (arr!42921 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17111)) mapDefault!55676)))))

(declare-fun mapIsEmpty!55676 () Bool)

(assert (=> mapIsEmpty!55676 mapRes!55676))

(assert (= (and start!111542 res!876536) b!1320639))

(assert (= (and b!1320639 res!876542) b!1320631))

(assert (= (and b!1320631 res!876541) b!1320633))

(assert (= (and b!1320633 res!876540) b!1320636))

(assert (= (and b!1320636 res!876537) b!1320634))

(assert (= (and b!1320634 res!876538) b!1320630))

(assert (= (and b!1320630 res!876543) b!1320637))

(assert (= (and b!1320637 res!876539) b!1320638))

(assert (= (and b!1320640 condMapEmpty!55676) mapIsEmpty!55676))

(assert (= (and b!1320640 (not condMapEmpty!55676)) mapNonEmpty!55676))

(get-info :version)

(assert (= (and mapNonEmpty!55676 ((_ is ValueCellFull!17111) mapValue!55676)) b!1320632))

(assert (= (and b!1320640 ((_ is ValueCellFull!17111) mapDefault!55676)) b!1320635))

(assert (= start!111542 b!1320640))

(declare-fun b_lambda!23515 () Bool)

(assert (=> (not b_lambda!23515) (not b!1320638)))

(declare-fun t!44239 () Bool)

(declare-fun tb!11543 () Bool)

(assert (=> (and start!111542 (= defaultEntry!1340 defaultEntry!1340) t!44239) tb!11543))

(declare-fun result!24149 () Bool)

(assert (=> tb!11543 (= result!24149 tp_is_empty!36019)))

(assert (=> b!1320638 t!44239))

(declare-fun b_and!48541 () Bool)

(assert (= b_and!48539 (and (=> t!44239 result!24149) b_and!48541)))

(declare-fun m!1207935 () Bool)

(assert (=> b!1320631 m!1207935))

(declare-fun m!1207937 () Bool)

(assert (=> b!1320633 m!1207937))

(declare-fun m!1207939 () Bool)

(assert (=> mapNonEmpty!55676 m!1207939))

(declare-fun m!1207941 () Bool)

(assert (=> start!111542 m!1207941))

(declare-fun m!1207943 () Bool)

(assert (=> start!111542 m!1207943))

(declare-fun m!1207945 () Bool)

(assert (=> start!111542 m!1207945))

(declare-fun m!1207947 () Bool)

(assert (=> b!1320638 m!1207947))

(declare-fun m!1207949 () Bool)

(assert (=> b!1320638 m!1207949))

(declare-fun m!1207951 () Bool)

(assert (=> b!1320638 m!1207951))

(declare-fun m!1207953 () Bool)

(assert (=> b!1320638 m!1207953))

(declare-fun m!1207955 () Bool)

(assert (=> b!1320638 m!1207955))

(declare-fun m!1207957 () Bool)

(assert (=> b!1320638 m!1207957))

(declare-fun m!1207959 () Bool)

(assert (=> b!1320638 m!1207959))

(assert (=> b!1320638 m!1207955))

(assert (=> b!1320638 m!1207949))

(declare-fun m!1207961 () Bool)

(assert (=> b!1320638 m!1207961))

(declare-fun m!1207963 () Bool)

(assert (=> b!1320638 m!1207963))

(declare-fun m!1207965 () Bool)

(assert (=> b!1320638 m!1207965))

(assert (=> b!1320638 m!1207951))

(declare-fun m!1207967 () Bool)

(assert (=> b!1320638 m!1207967))

(assert (=> b!1320637 m!1207963))

(assert (=> b!1320637 m!1207963))

(declare-fun m!1207969 () Bool)

(assert (=> b!1320637 m!1207969))

(declare-fun m!1207971 () Bool)

(assert (=> b!1320634 m!1207971))

(assert (=> b!1320634 m!1207971))

(declare-fun m!1207973 () Bool)

(assert (=> b!1320634 m!1207973))

(assert (=> b!1320630 m!1207963))

(check-sat b_and!48541 (not b!1320638) (not b!1320637) (not start!111542) (not b!1320633) (not b_next!30199) (not mapNonEmpty!55676) (not b!1320631) (not b!1320634) tp_is_empty!36019 (not b_lambda!23515))
(check-sat b_and!48541 (not b_next!30199))
