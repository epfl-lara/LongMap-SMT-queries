; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113410 () Bool)

(assert start!113410)

(declare-fun b_free!31461 () Bool)

(declare-fun b_next!31461 () Bool)

(assert (=> start!113410 (= b_free!31461 (not b_next!31461))))

(declare-fun tp!110187 () Bool)

(declare-fun b_and!50749 () Bool)

(assert (=> start!113410 (= tp!110187 b_and!50749)))

(declare-fun b!1346274 () Bool)

(declare-fun e!766017 () Bool)

(declare-fun tp_is_empty!37461 () Bool)

(assert (=> b!1346274 (= e!766017 tp_is_empty!37461)))

(declare-fun b!1346275 () Bool)

(declare-fun e!766018 () Bool)

(assert (=> b!1346275 (= e!766018 false)))

(declare-datatypes ((V!55051 0))(
  ( (V!55052 (val!18805 Int)) )
))
(declare-fun minValue!1245 () V!55051)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55051)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17832 0))(
  ( (ValueCellFull!17832 (v!21453 V!55051)) (EmptyCell!17832) )
))
(declare-datatypes ((array!91758 0))(
  ( (array!91759 (arr!44335 (Array (_ BitVec 32) ValueCell!17832)) (size!44885 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91758)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun lt!595494 () Bool)

(declare-datatypes ((array!91760 0))(
  ( (array!91761 (arr!44336 (Array (_ BitVec 32) (_ BitVec 64))) (size!44886 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91760)

(declare-datatypes ((tuple2!24242 0))(
  ( (tuple2!24243 (_1!12132 (_ BitVec 64)) (_2!12132 V!55051)) )
))
(declare-datatypes ((List!31397 0))(
  ( (Nil!31394) (Cons!31393 (h!32602 tuple2!24242) (t!45987 List!31397)) )
))
(declare-datatypes ((ListLongMap!21899 0))(
  ( (ListLongMap!21900 (toList!10965 List!31397)) )
))
(declare-fun contains!9141 (ListLongMap!21899 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5917 (array!91760 array!91758 (_ BitVec 32) (_ BitVec 32) V!55051 V!55051 (_ BitVec 32) Int) ListLongMap!21899)

(assert (=> b!1346275 (= lt!595494 (contains!9141 (getCurrentListMap!5917 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346276 () Bool)

(declare-fun e!766015 () Bool)

(declare-fun mapRes!57898 () Bool)

(assert (=> b!1346276 (= e!766015 (and e!766017 mapRes!57898))))

(declare-fun condMapEmpty!57898 () Bool)

(declare-fun mapDefault!57898 () ValueCell!17832)

(assert (=> b!1346276 (= condMapEmpty!57898 (= (arr!44335 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17832)) mapDefault!57898)))))

(declare-fun b!1346277 () Bool)

(declare-fun res!893323 () Bool)

(assert (=> b!1346277 (=> (not res!893323) (not e!766018))))

(assert (=> b!1346277 (= res!893323 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44886 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346278 () Bool)

(declare-fun res!893325 () Bool)

(assert (=> b!1346278 (=> (not res!893325) (not e!766018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91760 (_ BitVec 32)) Bool)

(assert (=> b!1346278 (= res!893325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346279 () Bool)

(declare-fun e!766016 () Bool)

(assert (=> b!1346279 (= e!766016 tp_is_empty!37461)))

(declare-fun mapIsEmpty!57898 () Bool)

(assert (=> mapIsEmpty!57898 mapRes!57898))

(declare-fun b!1346280 () Bool)

(declare-fun res!893324 () Bool)

(assert (=> b!1346280 (=> (not res!893324) (not e!766018))))

(assert (=> b!1346280 (= res!893324 (and (= (size!44885 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44886 _keys!1571) (size!44885 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346281 () Bool)

(declare-fun res!893321 () Bool)

(assert (=> b!1346281 (=> (not res!893321) (not e!766018))))

(declare-datatypes ((List!31398 0))(
  ( (Nil!31395) (Cons!31394 (h!32603 (_ BitVec 64)) (t!45988 List!31398)) )
))
(declare-fun arrayNoDuplicates!0 (array!91760 (_ BitVec 32) List!31398) Bool)

(assert (=> b!1346281 (= res!893321 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31395))))

(declare-fun res!893322 () Bool)

(assert (=> start!113410 (=> (not res!893322) (not e!766018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113410 (= res!893322 (validMask!0 mask!1977))))

(assert (=> start!113410 e!766018))

(assert (=> start!113410 tp_is_empty!37461))

(assert (=> start!113410 true))

(declare-fun array_inv!33405 (array!91760) Bool)

(assert (=> start!113410 (array_inv!33405 _keys!1571)))

(declare-fun array_inv!33406 (array!91758) Bool)

(assert (=> start!113410 (and (array_inv!33406 _values!1303) e!766015)))

(assert (=> start!113410 tp!110187))

(declare-fun mapNonEmpty!57898 () Bool)

(declare-fun tp!110188 () Bool)

(assert (=> mapNonEmpty!57898 (= mapRes!57898 (and tp!110188 e!766016))))

(declare-fun mapRest!57898 () (Array (_ BitVec 32) ValueCell!17832))

(declare-fun mapKey!57898 () (_ BitVec 32))

(declare-fun mapValue!57898 () ValueCell!17832)

(assert (=> mapNonEmpty!57898 (= (arr!44335 _values!1303) (store mapRest!57898 mapKey!57898 mapValue!57898))))

(assert (= (and start!113410 res!893322) b!1346280))

(assert (= (and b!1346280 res!893324) b!1346278))

(assert (= (and b!1346278 res!893325) b!1346281))

(assert (= (and b!1346281 res!893321) b!1346277))

(assert (= (and b!1346277 res!893323) b!1346275))

(assert (= (and b!1346276 condMapEmpty!57898) mapIsEmpty!57898))

(assert (= (and b!1346276 (not condMapEmpty!57898)) mapNonEmpty!57898))

(get-info :version)

(assert (= (and mapNonEmpty!57898 ((_ is ValueCellFull!17832) mapValue!57898)) b!1346279))

(assert (= (and b!1346276 ((_ is ValueCellFull!17832) mapDefault!57898)) b!1346274))

(assert (= start!113410 b!1346276))

(declare-fun m!1233479 () Bool)

(assert (=> b!1346275 m!1233479))

(assert (=> b!1346275 m!1233479))

(declare-fun m!1233481 () Bool)

(assert (=> b!1346275 m!1233481))

(declare-fun m!1233483 () Bool)

(assert (=> start!113410 m!1233483))

(declare-fun m!1233485 () Bool)

(assert (=> start!113410 m!1233485))

(declare-fun m!1233487 () Bool)

(assert (=> start!113410 m!1233487))

(declare-fun m!1233489 () Bool)

(assert (=> b!1346281 m!1233489))

(declare-fun m!1233491 () Bool)

(assert (=> mapNonEmpty!57898 m!1233491))

(declare-fun m!1233493 () Bool)

(assert (=> b!1346278 m!1233493))

(check-sat tp_is_empty!37461 (not b_next!31461) (not b!1346281) (not b!1346275) (not mapNonEmpty!57898) (not start!113410) (not b!1346278) b_and!50749)
(check-sat b_and!50749 (not b_next!31461))
