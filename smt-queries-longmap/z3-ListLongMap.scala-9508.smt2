; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113022 () Bool)

(assert start!113022)

(declare-fun b_free!31051 () Bool)

(declare-fun b_next!31051 () Bool)

(assert (=> start!113022 (= b_free!31051 (not b_next!31051))))

(declare-fun tp!108800 () Bool)

(declare-fun b_and!50051 () Bool)

(assert (=> start!113022 (= tp!108800 b_and!50051)))

(declare-fun res!888209 () Bool)

(declare-fun e!762602 () Bool)

(assert (=> start!113022 (=> (not res!888209) (not e!762602))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113022 (= res!888209 (validMask!0 mask!1998))))

(assert (=> start!113022 e!762602))

(declare-datatypes ((V!54385 0))(
  ( (V!54386 (val!18555 Int)) )
))
(declare-datatypes ((ValueCell!17582 0))(
  ( (ValueCellFull!17582 (v!21194 V!54385)) (EmptyCell!17582) )
))
(declare-datatypes ((array!90899 0))(
  ( (array!90900 (arr!43908 (Array (_ BitVec 32) ValueCell!17582)) (size!44459 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90899)

(declare-fun e!762598 () Bool)

(declare-fun array_inv!33375 (array!90899) Bool)

(assert (=> start!113022 (and (array_inv!33375 _values!1320) e!762598)))

(assert (=> start!113022 true))

(declare-datatypes ((array!90901 0))(
  ( (array!90902 (arr!43909 (Array (_ BitVec 32) (_ BitVec 64))) (size!44460 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90901)

(declare-fun array_inv!33376 (array!90901) Bool)

(assert (=> start!113022 (array_inv!33376 _keys!1590)))

(assert (=> start!113022 tp!108800))

(declare-fun tp_is_empty!36961 () Bool)

(assert (=> start!113022 tp_is_empty!36961))

(declare-fun b!1339071 () Bool)

(declare-fun e!762600 () Bool)

(assert (=> b!1339071 (= e!762600 tp_is_empty!36961)))

(declare-fun mapNonEmpty!57126 () Bool)

(declare-fun mapRes!57126 () Bool)

(declare-fun tp!108801 () Bool)

(assert (=> mapNonEmpty!57126 (= mapRes!57126 (and tp!108801 e!762600))))

(declare-fun mapRest!57126 () (Array (_ BitVec 32) ValueCell!17582))

(declare-fun mapValue!57126 () ValueCell!17582)

(declare-fun mapKey!57126 () (_ BitVec 32))

(assert (=> mapNonEmpty!57126 (= (arr!43908 _values!1320) (store mapRest!57126 mapKey!57126 mapValue!57126))))

(declare-fun b!1339072 () Bool)

(declare-fun res!888210 () Bool)

(assert (=> b!1339072 (=> (not res!888210) (not e!762602))))

(declare-datatypes ((List!31121 0))(
  ( (Nil!31118) (Cons!31117 (h!32335 (_ BitVec 64)) (t!45433 List!31121)) )
))
(declare-fun arrayNoDuplicates!0 (array!90901 (_ BitVec 32) List!31121) Bool)

(assert (=> b!1339072 (= res!888210 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31118))))

(declare-fun mapIsEmpty!57126 () Bool)

(assert (=> mapIsEmpty!57126 mapRes!57126))

(declare-fun b!1339073 () Bool)

(declare-fun e!762599 () Bool)

(assert (=> b!1339073 (= e!762598 (and e!762599 mapRes!57126))))

(declare-fun condMapEmpty!57126 () Bool)

(declare-fun mapDefault!57126 () ValueCell!17582)

(assert (=> b!1339073 (= condMapEmpty!57126 (= (arr!43908 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17582)) mapDefault!57126)))))

(declare-fun b!1339074 () Bool)

(declare-fun res!888215 () Bool)

(assert (=> b!1339074 (=> (not res!888215) (not e!762602))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1339074 (= res!888215 (not (= (select (arr!43909 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1339075 () Bool)

(declare-fun res!888212 () Bool)

(assert (=> b!1339075 (=> (not res!888212) (not e!762602))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1339075 (= res!888212 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44460 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339076 () Bool)

(declare-fun res!888216 () Bool)

(assert (=> b!1339076 (=> (not res!888216) (not e!762602))))

(assert (=> b!1339076 (= res!888216 (and (= (size!44459 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44460 _keys!1590) (size!44459 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1339077 () Bool)

(assert (=> b!1339077 (= e!762602 (= k0!1153 (select (arr!43909 _keys!1590) from!1980)))))

(declare-fun b!1339078 () Bool)

(declare-fun res!888207 () Bool)

(assert (=> b!1339078 (=> (not res!888207) (not e!762602))))

(assert (=> b!1339078 (= res!888207 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1339079 () Bool)

(declare-fun res!888213 () Bool)

(assert (=> b!1339079 (=> (not res!888213) (not e!762602))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!54385)

(declare-fun minValue!1262 () V!54385)

(declare-datatypes ((tuple2!23982 0))(
  ( (tuple2!23983 (_1!12002 (_ BitVec 64)) (_2!12002 V!54385)) )
))
(declare-datatypes ((List!31122 0))(
  ( (Nil!31119) (Cons!31118 (h!32336 tuple2!23982) (t!45434 List!31122)) )
))
(declare-datatypes ((ListLongMap!21647 0))(
  ( (ListLongMap!21648 (toList!10839 List!31122)) )
))
(declare-fun contains!9020 (ListLongMap!21647 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5793 (array!90901 array!90899 (_ BitVec 32) (_ BitVec 32) V!54385 V!54385 (_ BitVec 32) Int) ListLongMap!21647)

(assert (=> b!1339079 (= res!888213 (contains!9020 (getCurrentListMap!5793 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1339080 () Bool)

(declare-fun res!888208 () Bool)

(assert (=> b!1339080 (=> (not res!888208) (not e!762602))))

(declare-fun +!4784 (ListLongMap!21647 tuple2!23982) ListLongMap!21647)

(declare-fun getCurrentListMapNoExtraKeys!6433 (array!90901 array!90899 (_ BitVec 32) (_ BitVec 32) V!54385 V!54385 (_ BitVec 32) Int) ListLongMap!21647)

(declare-fun get!22175 (ValueCell!17582 V!54385) V!54385)

(declare-fun dynLambda!3738 (Int (_ BitVec 64)) V!54385)

(assert (=> b!1339080 (= res!888208 (contains!9020 (+!4784 (getCurrentListMapNoExtraKeys!6433 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23983 (select (arr!43909 _keys!1590) from!1980) (get!22175 (select (arr!43908 _values!1320) from!1980) (dynLambda!3738 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1153))))

(declare-fun b!1339081 () Bool)

(declare-fun res!888211 () Bool)

(assert (=> b!1339081 (=> (not res!888211) (not e!762602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1339081 (= res!888211 (validKeyInArray!0 (select (arr!43909 _keys!1590) from!1980)))))

(declare-fun b!1339082 () Bool)

(declare-fun res!888214 () Bool)

(assert (=> b!1339082 (=> (not res!888214) (not e!762602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90901 (_ BitVec 32)) Bool)

(assert (=> b!1339082 (= res!888214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1339083 () Bool)

(assert (=> b!1339083 (= e!762599 tp_is_empty!36961)))

(assert (= (and start!113022 res!888209) b!1339076))

(assert (= (and b!1339076 res!888216) b!1339082))

(assert (= (and b!1339082 res!888214) b!1339072))

(assert (= (and b!1339072 res!888210) b!1339075))

(assert (= (and b!1339075 res!888212) b!1339079))

(assert (= (and b!1339079 res!888213) b!1339074))

(assert (= (and b!1339074 res!888215) b!1339081))

(assert (= (and b!1339081 res!888211) b!1339078))

(assert (= (and b!1339078 res!888207) b!1339080))

(assert (= (and b!1339080 res!888208) b!1339077))

(assert (= (and b!1339073 condMapEmpty!57126) mapIsEmpty!57126))

(assert (= (and b!1339073 (not condMapEmpty!57126)) mapNonEmpty!57126))

(get-info :version)

(assert (= (and mapNonEmpty!57126 ((_ is ValueCellFull!17582) mapValue!57126)) b!1339071))

(assert (= (and b!1339073 ((_ is ValueCellFull!17582) mapDefault!57126)) b!1339083))

(assert (= start!113022 b!1339073))

(declare-fun b_lambda!24239 () Bool)

(assert (=> (not b_lambda!24239) (not b!1339080)))

(declare-fun t!45432 () Bool)

(declare-fun tb!12115 () Bool)

(assert (=> (and start!113022 (= defaultEntry!1323 defaultEntry!1323) t!45432) tb!12115))

(declare-fun result!25315 () Bool)

(assert (=> tb!12115 (= result!25315 tp_is_empty!36961)))

(assert (=> b!1339080 t!45432))

(declare-fun b_and!50053 () Bool)

(assert (= b_and!50051 (and (=> t!45432 result!25315) b_and!50053)))

(declare-fun m!1227539 () Bool)

(assert (=> b!1339072 m!1227539))

(declare-fun m!1227541 () Bool)

(assert (=> b!1339079 m!1227541))

(assert (=> b!1339079 m!1227541))

(declare-fun m!1227543 () Bool)

(assert (=> b!1339079 m!1227543))

(declare-fun m!1227545 () Bool)

(assert (=> b!1339074 m!1227545))

(declare-fun m!1227547 () Bool)

(assert (=> b!1339082 m!1227547))

(assert (=> b!1339077 m!1227545))

(assert (=> b!1339081 m!1227545))

(assert (=> b!1339081 m!1227545))

(declare-fun m!1227549 () Bool)

(assert (=> b!1339081 m!1227549))

(declare-fun m!1227551 () Bool)

(assert (=> b!1339080 m!1227551))

(declare-fun m!1227553 () Bool)

(assert (=> b!1339080 m!1227553))

(declare-fun m!1227555 () Bool)

(assert (=> b!1339080 m!1227555))

(declare-fun m!1227557 () Bool)

(assert (=> b!1339080 m!1227557))

(assert (=> b!1339080 m!1227551))

(declare-fun m!1227559 () Bool)

(assert (=> b!1339080 m!1227559))

(assert (=> b!1339080 m!1227555))

(declare-fun m!1227561 () Bool)

(assert (=> b!1339080 m!1227561))

(assert (=> b!1339080 m!1227553))

(assert (=> b!1339080 m!1227557))

(assert (=> b!1339080 m!1227545))

(declare-fun m!1227563 () Bool)

(assert (=> start!113022 m!1227563))

(declare-fun m!1227565 () Bool)

(assert (=> start!113022 m!1227565))

(declare-fun m!1227567 () Bool)

(assert (=> start!113022 m!1227567))

(declare-fun m!1227569 () Bool)

(assert (=> mapNonEmpty!57126 m!1227569))

(check-sat tp_is_empty!36961 (not b_lambda!24239) b_and!50053 (not b!1339072) (not mapNonEmpty!57126) (not b_next!31051) (not b!1339079) (not b!1339081) (not b!1339080) (not start!113022) (not b!1339082))
(check-sat b_and!50053 (not b_next!31051))
