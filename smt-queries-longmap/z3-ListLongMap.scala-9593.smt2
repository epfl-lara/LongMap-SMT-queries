; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113420 () Bool)

(assert start!113420)

(declare-fun b_free!31471 () Bool)

(declare-fun b_next!31471 () Bool)

(assert (=> start!113420 (= b_free!31471 (not b_next!31471))))

(declare-fun tp!110218 () Bool)

(declare-fun b_and!50741 () Bool)

(assert (=> start!113420 (= tp!110218 b_and!50741)))

(declare-fun b!1346324 () Bool)

(declare-fun e!766060 () Bool)

(declare-fun tp_is_empty!37471 () Bool)

(assert (=> b!1346324 (= e!766060 tp_is_empty!37471)))

(declare-fun mapIsEmpty!57913 () Bool)

(declare-fun mapRes!57913 () Bool)

(assert (=> mapIsEmpty!57913 mapRes!57913))

(declare-fun b!1346325 () Bool)

(declare-fun res!893367 () Bool)

(declare-fun e!766057 () Bool)

(assert (=> b!1346325 (=> (not res!893367) (not e!766057))))

(declare-datatypes ((array!91721 0))(
  ( (array!91722 (arr!44317 (Array (_ BitVec 32) (_ BitVec 64))) (size!44869 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91721)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91721 (_ BitVec 32)) Bool)

(assert (=> b!1346325 (= res!893367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346326 () Bool)

(declare-fun res!893370 () Bool)

(assert (=> b!1346326 (=> (not res!893370) (not e!766057))))

(declare-datatypes ((List!31452 0))(
  ( (Nil!31449) (Cons!31448 (h!32657 (_ BitVec 64)) (t!46034 List!31452)) )
))
(declare-fun arrayNoDuplicates!0 (array!91721 (_ BitVec 32) List!31452) Bool)

(assert (=> b!1346326 (= res!893370 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31449))))

(declare-fun b!1346327 () Bool)

(declare-fun e!766058 () Bool)

(assert (=> b!1346327 (= e!766058 tp_is_empty!37471)))

(declare-fun res!893369 () Bool)

(assert (=> start!113420 (=> (not res!893369) (not e!766057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113420 (= res!893369 (validMask!0 mask!1977))))

(assert (=> start!113420 e!766057))

(assert (=> start!113420 tp_is_empty!37471))

(assert (=> start!113420 true))

(declare-fun array_inv!33587 (array!91721) Bool)

(assert (=> start!113420 (array_inv!33587 _keys!1571)))

(declare-datatypes ((V!55065 0))(
  ( (V!55066 (val!18810 Int)) )
))
(declare-datatypes ((ValueCell!17837 0))(
  ( (ValueCellFull!17837 (v!21457 V!55065)) (EmptyCell!17837) )
))
(declare-datatypes ((array!91723 0))(
  ( (array!91724 (arr!44318 (Array (_ BitVec 32) ValueCell!17837)) (size!44870 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91723)

(declare-fun e!766061 () Bool)

(declare-fun array_inv!33588 (array!91723) Bool)

(assert (=> start!113420 (and (array_inv!33588 _values!1303) e!766061)))

(assert (=> start!113420 tp!110218))

(declare-fun b!1346328 () Bool)

(declare-fun res!893368 () Bool)

(assert (=> b!1346328 (=> (not res!893368) (not e!766057))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346328 (= res!893368 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44869 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346329 () Bool)

(assert (=> b!1346329 (= e!766057 false)))

(declare-fun minValue!1245 () V!55065)

(declare-fun zeroValue!1245 () V!55065)

(declare-fun lt!595323 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24316 0))(
  ( (tuple2!24317 (_1!12169 (_ BitVec 64)) (_2!12169 V!55065)) )
))
(declare-datatypes ((List!31453 0))(
  ( (Nil!31450) (Cons!31449 (h!32658 tuple2!24316) (t!46035 List!31453)) )
))
(declare-datatypes ((ListLongMap!21973 0))(
  ( (ListLongMap!21974 (toList!11002 List!31453)) )
))
(declare-fun contains!9107 (ListLongMap!21973 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5841 (array!91721 array!91723 (_ BitVec 32) (_ BitVec 32) V!55065 V!55065 (_ BitVec 32) Int) ListLongMap!21973)

(assert (=> b!1346329 (= lt!595323 (contains!9107 (getCurrentListMap!5841 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346330 () Bool)

(declare-fun res!893371 () Bool)

(assert (=> b!1346330 (=> (not res!893371) (not e!766057))))

(assert (=> b!1346330 (= res!893371 (and (= (size!44870 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44869 _keys!1571) (size!44870 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346331 () Bool)

(assert (=> b!1346331 (= e!766061 (and e!766058 mapRes!57913))))

(declare-fun condMapEmpty!57913 () Bool)

(declare-fun mapDefault!57913 () ValueCell!17837)

(assert (=> b!1346331 (= condMapEmpty!57913 (= (arr!44318 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17837)) mapDefault!57913)))))

(declare-fun mapNonEmpty!57913 () Bool)

(declare-fun tp!110219 () Bool)

(assert (=> mapNonEmpty!57913 (= mapRes!57913 (and tp!110219 e!766060))))

(declare-fun mapRest!57913 () (Array (_ BitVec 32) ValueCell!17837))

(declare-fun mapValue!57913 () ValueCell!17837)

(declare-fun mapKey!57913 () (_ BitVec 32))

(assert (=> mapNonEmpty!57913 (= (arr!44318 _values!1303) (store mapRest!57913 mapKey!57913 mapValue!57913))))

(assert (= (and start!113420 res!893369) b!1346330))

(assert (= (and b!1346330 res!893371) b!1346325))

(assert (= (and b!1346325 res!893367) b!1346326))

(assert (= (and b!1346326 res!893370) b!1346328))

(assert (= (and b!1346328 res!893368) b!1346329))

(assert (= (and b!1346331 condMapEmpty!57913) mapIsEmpty!57913))

(assert (= (and b!1346331 (not condMapEmpty!57913)) mapNonEmpty!57913))

(get-info :version)

(assert (= (and mapNonEmpty!57913 ((_ is ValueCellFull!17837) mapValue!57913)) b!1346324))

(assert (= (and b!1346331 ((_ is ValueCellFull!17837) mapDefault!57913)) b!1346327))

(assert (= start!113420 b!1346331))

(declare-fun m!1233043 () Bool)

(assert (=> b!1346329 m!1233043))

(assert (=> b!1346329 m!1233043))

(declare-fun m!1233045 () Bool)

(assert (=> b!1346329 m!1233045))

(declare-fun m!1233047 () Bool)

(assert (=> b!1346325 m!1233047))

(declare-fun m!1233049 () Bool)

(assert (=> mapNonEmpty!57913 m!1233049))

(declare-fun m!1233051 () Bool)

(assert (=> b!1346326 m!1233051))

(declare-fun m!1233053 () Bool)

(assert (=> start!113420 m!1233053))

(declare-fun m!1233055 () Bool)

(assert (=> start!113420 m!1233055))

(declare-fun m!1233057 () Bool)

(assert (=> start!113420 m!1233057))

(check-sat tp_is_empty!37471 (not b_next!31471) (not b!1346326) (not b!1346325) (not mapNonEmpty!57913) (not start!113420) (not b!1346329) b_and!50741)
(check-sat b_and!50741 (not b_next!31471))
