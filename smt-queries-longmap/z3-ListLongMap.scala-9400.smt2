; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111894 () Bool)

(assert start!111894)

(declare-fun b_free!30493 () Bool)

(declare-fun b_next!30493 () Bool)

(assert (=> start!111894 (= b_free!30493 (not b_next!30493))))

(declare-fun tp!106960 () Bool)

(declare-fun b_and!49063 () Bool)

(assert (=> start!111894 (= tp!106960 b_and!49063)))

(declare-fun mapIsEmpty!56121 () Bool)

(declare-fun mapRes!56121 () Bool)

(assert (=> mapIsEmpty!56121 mapRes!56121))

(declare-fun b!1325838 () Bool)

(declare-fun res!879967 () Bool)

(declare-fun e!755763 () Bool)

(assert (=> b!1325838 (=> (not res!879967) (not e!755763))))

(declare-datatypes ((array!89465 0))(
  ( (array!89466 (arr!43206 (Array (_ BitVec 32) (_ BitVec 64))) (size!43758 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89465)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89465 (_ BitVec 32)) Bool)

(assert (=> b!1325838 (= res!879967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!879964 () Bool)

(assert (=> start!111894 (=> (not res!879964) (not e!755763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111894 (= res!879964 (validMask!0 mask!2019))))

(assert (=> start!111894 e!755763))

(declare-fun array_inv!32793 (array!89465) Bool)

(assert (=> start!111894 (array_inv!32793 _keys!1609)))

(assert (=> start!111894 true))

(declare-fun tp_is_empty!36313 () Bool)

(assert (=> start!111894 tp_is_empty!36313))

(declare-datatypes ((V!53521 0))(
  ( (V!53522 (val!18231 Int)) )
))
(declare-datatypes ((ValueCell!17258 0))(
  ( (ValueCellFull!17258 (v!20863 V!53521)) (EmptyCell!17258) )
))
(declare-datatypes ((array!89467 0))(
  ( (array!89468 (arr!43207 (Array (_ BitVec 32) ValueCell!17258)) (size!43759 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89467)

(declare-fun e!755761 () Bool)

(declare-fun array_inv!32794 (array!89467) Bool)

(assert (=> start!111894 (and (array_inv!32794 _values!1337) e!755761)))

(assert (=> start!111894 tp!106960))

(declare-fun b!1325839 () Bool)

(declare-fun e!755760 () Bool)

(assert (=> b!1325839 (= e!755760 tp_is_empty!36313)))

(declare-fun b!1325840 () Bool)

(declare-fun res!879970 () Bool)

(assert (=> b!1325840 (=> (not res!879970) (not e!755763))))

(declare-datatypes ((List!30706 0))(
  ( (Nil!30703) (Cons!30702 (h!31911 (_ BitVec 64)) (t!44662 List!30706)) )
))
(declare-fun arrayNoDuplicates!0 (array!89465 (_ BitVec 32) List!30706) Bool)

(assert (=> b!1325840 (= res!879970 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30703))))

(declare-fun b!1325841 () Bool)

(declare-fun res!879971 () Bool)

(assert (=> b!1325841 (=> (not res!879971) (not e!755763))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53521)

(declare-fun minValue!1279 () V!53521)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23580 0))(
  ( (tuple2!23581 (_1!11801 (_ BitVec 64)) (_2!11801 V!53521)) )
))
(declare-datatypes ((List!30707 0))(
  ( (Nil!30704) (Cons!30703 (h!31912 tuple2!23580) (t!44663 List!30707)) )
))
(declare-datatypes ((ListLongMap!21237 0))(
  ( (ListLongMap!21238 (toList!10634 List!30707)) )
))
(declare-fun contains!8718 (ListLongMap!21237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5510 (array!89465 array!89467 (_ BitVec 32) (_ BitVec 32) V!53521 V!53521 (_ BitVec 32) Int) ListLongMap!21237)

(assert (=> b!1325841 (= res!879971 (contains!8718 (getCurrentListMap!5510 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1325842 () Bool)

(declare-fun res!879965 () Bool)

(assert (=> b!1325842 (=> (not res!879965) (not e!755763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325842 (= res!879965 (validKeyInArray!0 (select (arr!43206 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!56121 () Bool)

(declare-fun tp!106959 () Bool)

(assert (=> mapNonEmpty!56121 (= mapRes!56121 (and tp!106959 e!755760))))

(declare-fun mapRest!56121 () (Array (_ BitVec 32) ValueCell!17258))

(declare-fun mapKey!56121 () (_ BitVec 32))

(declare-fun mapValue!56121 () ValueCell!17258)

(assert (=> mapNonEmpty!56121 (= (arr!43207 _values!1337) (store mapRest!56121 mapKey!56121 mapValue!56121))))

(declare-fun b!1325843 () Bool)

(declare-fun e!755762 () Bool)

(assert (=> b!1325843 (= e!755761 (and e!755762 mapRes!56121))))

(declare-fun condMapEmpty!56121 () Bool)

(declare-fun mapDefault!56121 () ValueCell!17258)

(assert (=> b!1325843 (= condMapEmpty!56121 (= (arr!43207 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17258)) mapDefault!56121)))))

(declare-fun b!1325844 () Bool)

(declare-fun res!879969 () Bool)

(assert (=> b!1325844 (=> (not res!879969) (not e!755763))))

(assert (=> b!1325844 (= res!879969 (not (= (select (arr!43206 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1325845 () Bool)

(declare-fun res!879968 () Bool)

(assert (=> b!1325845 (=> (not res!879968) (not e!755763))))

(assert (=> b!1325845 (= res!879968 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43758 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325846 () Bool)

(declare-fun res!879966 () Bool)

(assert (=> b!1325846 (=> (not res!879966) (not e!755763))))

(assert (=> b!1325846 (= res!879966 (and (= (size!43759 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43758 _keys!1609) (size!43759 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325847 () Bool)

(assert (=> b!1325847 (= e!755762 tp_is_empty!36313)))

(declare-fun b!1325848 () Bool)

(assert (=> b!1325848 (= e!755763 (not true))))

(declare-fun lt!589683 () ListLongMap!21237)

(assert (=> b!1325848 (contains!8718 lt!589683 k0!1164)))

(declare-datatypes ((Unit!43475 0))(
  ( (Unit!43476) )
))
(declare-fun lt!589682 () Unit!43475)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!203 ((_ BitVec 64) (_ BitVec 64) V!53521 ListLongMap!21237) Unit!43475)

(assert (=> b!1325848 (= lt!589682 (lemmaInListMapAfterAddingDiffThenInBefore!203 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589683))))

(declare-fun lt!589680 () ListLongMap!21237)

(assert (=> b!1325848 (contains!8718 lt!589680 k0!1164)))

(declare-fun lt!589681 () Unit!43475)

(assert (=> b!1325848 (= lt!589681 (lemmaInListMapAfterAddingDiffThenInBefore!203 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589680))))

(declare-fun +!4641 (ListLongMap!21237 tuple2!23580) ListLongMap!21237)

(assert (=> b!1325848 (= lt!589680 (+!4641 lt!589683 (tuple2!23581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6279 (array!89465 array!89467 (_ BitVec 32) (_ BitVec 32) V!53521 V!53521 (_ BitVec 32) Int) ListLongMap!21237)

(declare-fun get!21767 (ValueCell!17258 V!53521) V!53521)

(declare-fun dynLambda!3571 (Int (_ BitVec 64)) V!53521)

(assert (=> b!1325848 (= lt!589683 (+!4641 (getCurrentListMapNoExtraKeys!6279 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23581 (select (arr!43206 _keys!1609) from!2000) (get!21767 (select (arr!43207 _values!1337) from!2000) (dynLambda!3571 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!111894 res!879964) b!1325846))

(assert (= (and b!1325846 res!879966) b!1325838))

(assert (= (and b!1325838 res!879967) b!1325840))

(assert (= (and b!1325840 res!879970) b!1325845))

(assert (= (and b!1325845 res!879968) b!1325841))

(assert (= (and b!1325841 res!879971) b!1325844))

(assert (= (and b!1325844 res!879969) b!1325842))

(assert (= (and b!1325842 res!879965) b!1325848))

(assert (= (and b!1325843 condMapEmpty!56121) mapIsEmpty!56121))

(assert (= (and b!1325843 (not condMapEmpty!56121)) mapNonEmpty!56121))

(get-info :version)

(assert (= (and mapNonEmpty!56121 ((_ is ValueCellFull!17258) mapValue!56121)) b!1325839))

(assert (= (and b!1325843 ((_ is ValueCellFull!17258) mapDefault!56121)) b!1325847))

(assert (= start!111894 b!1325843))

(declare-fun b_lambda!23761 () Bool)

(assert (=> (not b_lambda!23761) (not b!1325848)))

(declare-fun t!44661 () Bool)

(declare-fun tb!11759 () Bool)

(assert (=> (and start!111894 (= defaultEntry!1340 defaultEntry!1340) t!44661) tb!11759))

(declare-fun result!24583 () Bool)

(assert (=> tb!11759 (= result!24583 tp_is_empty!36313)))

(assert (=> b!1325848 t!44661))

(declare-fun b_and!49065 () Bool)

(assert (= b_and!49063 (and (=> t!44661 result!24583) b_and!49065)))

(declare-fun m!1214293 () Bool)

(assert (=> b!1325838 m!1214293))

(declare-fun m!1214295 () Bool)

(assert (=> b!1325840 m!1214295))

(declare-fun m!1214297 () Bool)

(assert (=> b!1325844 m!1214297))

(declare-fun m!1214299 () Bool)

(assert (=> mapNonEmpty!56121 m!1214299))

(declare-fun m!1214301 () Bool)

(assert (=> start!111894 m!1214301))

(declare-fun m!1214303 () Bool)

(assert (=> start!111894 m!1214303))

(declare-fun m!1214305 () Bool)

(assert (=> start!111894 m!1214305))

(declare-fun m!1214307 () Bool)

(assert (=> b!1325841 m!1214307))

(assert (=> b!1325841 m!1214307))

(declare-fun m!1214309 () Bool)

(assert (=> b!1325841 m!1214309))

(declare-fun m!1214311 () Bool)

(assert (=> b!1325848 m!1214311))

(declare-fun m!1214313 () Bool)

(assert (=> b!1325848 m!1214313))

(assert (=> b!1325848 m!1214313))

(declare-fun m!1214315 () Bool)

(assert (=> b!1325848 m!1214315))

(declare-fun m!1214317 () Bool)

(assert (=> b!1325848 m!1214317))

(declare-fun m!1214319 () Bool)

(assert (=> b!1325848 m!1214319))

(assert (=> b!1325848 m!1214319))

(declare-fun m!1214321 () Bool)

(assert (=> b!1325848 m!1214321))

(declare-fun m!1214323 () Bool)

(assert (=> b!1325848 m!1214323))

(declare-fun m!1214325 () Bool)

(assert (=> b!1325848 m!1214325))

(assert (=> b!1325848 m!1214321))

(declare-fun m!1214327 () Bool)

(assert (=> b!1325848 m!1214327))

(declare-fun m!1214329 () Bool)

(assert (=> b!1325848 m!1214329))

(assert (=> b!1325848 m!1214297))

(assert (=> b!1325842 m!1214297))

(assert (=> b!1325842 m!1214297))

(declare-fun m!1214331 () Bool)

(assert (=> b!1325842 m!1214331))

(check-sat (not mapNonEmpty!56121) (not b!1325838) (not b_lambda!23761) b_and!49065 tp_is_empty!36313 (not b_next!30493) (not start!111894) (not b!1325842) (not b!1325848) (not b!1325841) (not b!1325840))
(check-sat b_and!49065 (not b_next!30493))
