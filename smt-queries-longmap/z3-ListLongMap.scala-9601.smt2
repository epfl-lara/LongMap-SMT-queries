; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113750 () Bool)

(assert start!113750)

(declare-fun b_free!31519 () Bool)

(declare-fun b_next!31519 () Bool)

(assert (=> start!113750 (= b_free!31519 (not b_next!31519))))

(declare-fun tp!110366 () Bool)

(declare-fun b_and!50829 () Bool)

(assert (=> start!113750 (= tp!110366 b_and!50829)))

(declare-fun b!1348802 () Bool)

(declare-fun res!894586 () Bool)

(declare-fun e!767539 () Bool)

(assert (=> b!1348802 (=> (not res!894586) (not e!767539))))

(declare-datatypes ((array!91981 0))(
  ( (array!91982 (arr!44441 (Array (_ BitVec 32) (_ BitVec 64))) (size!44992 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91981)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91981 (_ BitVec 32)) Bool)

(assert (=> b!1348802 (= res!894586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!894580 () Bool)

(assert (=> start!113750 (=> (not res!894580) (not e!767539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113750 (= res!894580 (validMask!0 mask!1977))))

(assert (=> start!113750 e!767539))

(declare-fun tp_is_empty!37519 () Bool)

(assert (=> start!113750 tp_is_empty!37519))

(assert (=> start!113750 true))

(declare-fun array_inv!33741 (array!91981) Bool)

(assert (=> start!113750 (array_inv!33741 _keys!1571)))

(declare-datatypes ((V!55129 0))(
  ( (V!55130 (val!18834 Int)) )
))
(declare-datatypes ((ValueCell!17861 0))(
  ( (ValueCellFull!17861 (v!21480 V!55129)) (EmptyCell!17861) )
))
(declare-datatypes ((array!91983 0))(
  ( (array!91984 (arr!44442 (Array (_ BitVec 32) ValueCell!17861)) (size!44993 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91983)

(declare-fun e!767538 () Bool)

(declare-fun array_inv!33742 (array!91983) Bool)

(assert (=> start!113750 (and (array_inv!33742 _values!1303) e!767538)))

(assert (=> start!113750 tp!110366))

(declare-fun b!1348803 () Bool)

(declare-fun res!894582 () Bool)

(assert (=> b!1348803 (=> (not res!894582) (not e!767539))))

(declare-datatypes ((List!31467 0))(
  ( (Nil!31464) (Cons!31463 (h!32681 (_ BitVec 64)) (t!46057 List!31467)) )
))
(declare-fun arrayNoDuplicates!0 (array!91981 (_ BitVec 32) List!31467) Bool)

(assert (=> b!1348803 (= res!894582 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31464))))

(declare-fun b!1348804 () Bool)

(declare-fun e!767537 () Bool)

(declare-fun mapRes!57989 () Bool)

(assert (=> b!1348804 (= e!767538 (and e!767537 mapRes!57989))))

(declare-fun condMapEmpty!57989 () Bool)

(declare-fun mapDefault!57989 () ValueCell!17861)

(assert (=> b!1348804 (= condMapEmpty!57989 (= (arr!44442 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17861)) mapDefault!57989)))))

(declare-fun b!1348805 () Bool)

(declare-fun res!894579 () Bool)

(assert (=> b!1348805 (=> (not res!894579) (not e!767539))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1348805 (= res!894579 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1348806 () Bool)

(assert (=> b!1348806 (= e!767539 false)))

(declare-fun minValue!1245 () V!55129)

(declare-fun lt!596298 () Bool)

(declare-fun zeroValue!1245 () V!55129)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24328 0))(
  ( (tuple2!24329 (_1!12175 (_ BitVec 64)) (_2!12175 V!55129)) )
))
(declare-datatypes ((List!31468 0))(
  ( (Nil!31465) (Cons!31464 (h!32682 tuple2!24328) (t!46058 List!31468)) )
))
(declare-datatypes ((ListLongMap!21993 0))(
  ( (ListLongMap!21994 (toList!11012 List!31468)) )
))
(declare-fun contains!9201 (ListLongMap!21993 (_ BitVec 64)) Bool)

(declare-fun +!4874 (ListLongMap!21993 tuple2!24328) ListLongMap!21993)

(declare-fun getCurrentListMapNoExtraKeys!6527 (array!91981 array!91983 (_ BitVec 32) (_ BitVec 32) V!55129 V!55129 (_ BitVec 32) Int) ListLongMap!21993)

(declare-fun get!22459 (ValueCell!17861 V!55129) V!55129)

(declare-fun dynLambda!3828 (Int (_ BitVec 64)) V!55129)

(assert (=> b!1348806 (= lt!596298 (contains!9201 (+!4874 (+!4874 (getCurrentListMapNoExtraKeys!6527 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24329 (select (arr!44441 _keys!1571) from!1960) (get!22459 (select (arr!44442 _values!1303) from!1960) (dynLambda!3828 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142))))

(declare-fun mapIsEmpty!57989 () Bool)

(assert (=> mapIsEmpty!57989 mapRes!57989))

(declare-fun b!1348807 () Bool)

(declare-fun res!894581 () Bool)

(assert (=> b!1348807 (=> (not res!894581) (not e!767539))))

(assert (=> b!1348807 (= res!894581 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44992 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348808 () Bool)

(declare-fun e!767536 () Bool)

(assert (=> b!1348808 (= e!767536 tp_is_empty!37519)))

(declare-fun b!1348809 () Bool)

(assert (=> b!1348809 (= e!767537 tp_is_empty!37519)))

(declare-fun mapNonEmpty!57989 () Bool)

(declare-fun tp!110365 () Bool)

(assert (=> mapNonEmpty!57989 (= mapRes!57989 (and tp!110365 e!767536))))

(declare-fun mapRest!57989 () (Array (_ BitVec 32) ValueCell!17861))

(declare-fun mapKey!57989 () (_ BitVec 32))

(declare-fun mapValue!57989 () ValueCell!17861)

(assert (=> mapNonEmpty!57989 (= (arr!44442 _values!1303) (store mapRest!57989 mapKey!57989 mapValue!57989))))

(declare-fun b!1348810 () Bool)

(declare-fun res!894585 () Bool)

(assert (=> b!1348810 (=> (not res!894585) (not e!767539))))

(declare-fun getCurrentListMap!5950 (array!91981 array!91983 (_ BitVec 32) (_ BitVec 32) V!55129 V!55129 (_ BitVec 32) Int) ListLongMap!21993)

(assert (=> b!1348810 (= res!894585 (contains!9201 (getCurrentListMap!5950 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1348811 () Bool)

(declare-fun res!894578 () Bool)

(assert (=> b!1348811 (=> (not res!894578) (not e!767539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348811 (= res!894578 (validKeyInArray!0 (select (arr!44441 _keys!1571) from!1960)))))

(declare-fun b!1348812 () Bool)

(declare-fun res!894584 () Bool)

(assert (=> b!1348812 (=> (not res!894584) (not e!767539))))

(assert (=> b!1348812 (= res!894584 (not (= (select (arr!44441 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1348813 () Bool)

(declare-fun res!894583 () Bool)

(assert (=> b!1348813 (=> (not res!894583) (not e!767539))))

(assert (=> b!1348813 (= res!894583 (and (= (size!44993 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44992 _keys!1571) (size!44993 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113750 res!894580) b!1348813))

(assert (= (and b!1348813 res!894583) b!1348802))

(assert (= (and b!1348802 res!894586) b!1348803))

(assert (= (and b!1348803 res!894582) b!1348807))

(assert (= (and b!1348807 res!894581) b!1348810))

(assert (= (and b!1348810 res!894585) b!1348812))

(assert (= (and b!1348812 res!894584) b!1348811))

(assert (= (and b!1348811 res!894578) b!1348805))

(assert (= (and b!1348805 res!894579) b!1348806))

(assert (= (and b!1348804 condMapEmpty!57989) mapIsEmpty!57989))

(assert (= (and b!1348804 (not condMapEmpty!57989)) mapNonEmpty!57989))

(get-info :version)

(assert (= (and mapNonEmpty!57989 ((_ is ValueCellFull!17861) mapValue!57989)) b!1348808))

(assert (= (and b!1348804 ((_ is ValueCellFull!17861) mapDefault!57989)) b!1348809))

(assert (= start!113750 b!1348804))

(declare-fun b_lambda!24587 () Bool)

(assert (=> (not b_lambda!24587) (not b!1348806)))

(declare-fun t!46056 () Bool)

(declare-fun tb!12393 () Bool)

(assert (=> (and start!113750 (= defaultEntry!1306 defaultEntry!1306) t!46056) tb!12393))

(declare-fun result!25887 () Bool)

(assert (=> tb!12393 (= result!25887 tp_is_empty!37519)))

(assert (=> b!1348806 t!46056))

(declare-fun b_and!50831 () Bool)

(assert (= b_and!50829 (and (=> t!46056 result!25887) b_and!50831)))

(declare-fun m!1236181 () Bool)

(assert (=> start!113750 m!1236181))

(declare-fun m!1236183 () Bool)

(assert (=> start!113750 m!1236183))

(declare-fun m!1236185 () Bool)

(assert (=> start!113750 m!1236185))

(declare-fun m!1236187 () Bool)

(assert (=> b!1348802 m!1236187))

(declare-fun m!1236189 () Bool)

(assert (=> b!1348803 m!1236189))

(declare-fun m!1236191 () Bool)

(assert (=> b!1348810 m!1236191))

(assert (=> b!1348810 m!1236191))

(declare-fun m!1236193 () Bool)

(assert (=> b!1348810 m!1236193))

(declare-fun m!1236195 () Bool)

(assert (=> b!1348806 m!1236195))

(declare-fun m!1236197 () Bool)

(assert (=> b!1348806 m!1236197))

(declare-fun m!1236199 () Bool)

(assert (=> b!1348806 m!1236199))

(declare-fun m!1236201 () Bool)

(assert (=> b!1348806 m!1236201))

(declare-fun m!1236203 () Bool)

(assert (=> b!1348806 m!1236203))

(declare-fun m!1236205 () Bool)

(assert (=> b!1348806 m!1236205))

(assert (=> b!1348806 m!1236199))

(declare-fun m!1236207 () Bool)

(assert (=> b!1348806 m!1236207))

(assert (=> b!1348806 m!1236201))

(assert (=> b!1348806 m!1236203))

(declare-fun m!1236209 () Bool)

(assert (=> b!1348806 m!1236209))

(assert (=> b!1348806 m!1236207))

(assert (=> b!1348806 m!1236195))

(assert (=> b!1348811 m!1236209))

(assert (=> b!1348811 m!1236209))

(declare-fun m!1236211 () Bool)

(assert (=> b!1348811 m!1236211))

(assert (=> b!1348812 m!1236209))

(declare-fun m!1236213 () Bool)

(assert (=> mapNonEmpty!57989 m!1236213))

(check-sat (not b!1348803) tp_is_empty!37519 (not b!1348810) (not b!1348802) (not b_lambda!24587) (not b!1348811) (not b_next!31519) b_and!50831 (not start!113750) (not mapNonEmpty!57989) (not b!1348806))
(check-sat b_and!50831 (not b_next!31519))
