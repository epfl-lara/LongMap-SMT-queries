; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112346 () Bool)

(assert start!112346)

(declare-fun b!1329254 () Bool)

(declare-fun res!881646 () Bool)

(declare-fun e!757923 () Bool)

(assert (=> b!1329254 (=> (not res!881646) (not e!757923))))

(declare-datatypes ((V!53673 0))(
  ( (V!53674 (val!18288 Int)) )
))
(declare-datatypes ((ValueCell!17315 0))(
  ( (ValueCellFull!17315 (v!20920 V!53673)) (EmptyCell!17315) )
))
(declare-datatypes ((array!89861 0))(
  ( (array!89862 (arr!43392 (Array (_ BitVec 32) ValueCell!17315)) (size!43943 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89861)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89863 0))(
  ( (array!89864 (arr!43393 (Array (_ BitVec 32) (_ BitVec 64))) (size!43944 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89863)

(assert (=> b!1329254 (= res!881646 (and (= (size!43943 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43944 _keys!1590) (size!43943 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329255 () Bool)

(declare-fun e!757922 () Bool)

(declare-fun e!757921 () Bool)

(declare-fun mapRes!56314 () Bool)

(assert (=> b!1329255 (= e!757922 (and e!757921 mapRes!56314))))

(declare-fun condMapEmpty!56314 () Bool)

(declare-fun mapDefault!56314 () ValueCell!17315)

(assert (=> b!1329255 (= condMapEmpty!56314 (= (arr!43392 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17315)) mapDefault!56314)))))

(declare-fun b!1329257 () Bool)

(assert (=> b!1329257 (= e!757923 false)))

(declare-fun lt!591258 () Bool)

(declare-datatypes ((List!30748 0))(
  ( (Nil!30745) (Cons!30744 (h!31962 (_ BitVec 64)) (t!44746 List!30748)) )
))
(declare-fun arrayNoDuplicates!0 (array!89863 (_ BitVec 32) List!30748) Bool)

(assert (=> b!1329257 (= lt!591258 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30745))))

(declare-fun mapNonEmpty!56314 () Bool)

(declare-fun tp!107221 () Bool)

(declare-fun e!757920 () Bool)

(assert (=> mapNonEmpty!56314 (= mapRes!56314 (and tp!107221 e!757920))))

(declare-fun mapValue!56314 () ValueCell!17315)

(declare-fun mapRest!56314 () (Array (_ BitVec 32) ValueCell!17315))

(declare-fun mapKey!56314 () (_ BitVec 32))

(assert (=> mapNonEmpty!56314 (= (arr!43392 _values!1320) (store mapRest!56314 mapKey!56314 mapValue!56314))))

(declare-fun b!1329258 () Bool)

(declare-fun res!881647 () Bool)

(assert (=> b!1329258 (=> (not res!881647) (not e!757923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89863 (_ BitVec 32)) Bool)

(assert (=> b!1329258 (= res!881647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329256 () Bool)

(declare-fun tp_is_empty!36427 () Bool)

(assert (=> b!1329256 (= e!757920 tp_is_empty!36427)))

(declare-fun res!881648 () Bool)

(assert (=> start!112346 (=> (not res!881648) (not e!757923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112346 (= res!881648 (validMask!0 mask!1998))))

(assert (=> start!112346 e!757923))

(assert (=> start!112346 true))

(declare-fun array_inv!33017 (array!89861) Bool)

(assert (=> start!112346 (and (array_inv!33017 _values!1320) e!757922)))

(declare-fun array_inv!33018 (array!89863) Bool)

(assert (=> start!112346 (array_inv!33018 _keys!1590)))

(declare-fun b!1329259 () Bool)

(assert (=> b!1329259 (= e!757921 tp_is_empty!36427)))

(declare-fun mapIsEmpty!56314 () Bool)

(assert (=> mapIsEmpty!56314 mapRes!56314))

(assert (= (and start!112346 res!881648) b!1329254))

(assert (= (and b!1329254 res!881646) b!1329258))

(assert (= (and b!1329258 res!881647) b!1329257))

(assert (= (and b!1329255 condMapEmpty!56314) mapIsEmpty!56314))

(assert (= (and b!1329255 (not condMapEmpty!56314)) mapNonEmpty!56314))

(get-info :version)

(assert (= (and mapNonEmpty!56314 ((_ is ValueCellFull!17315) mapValue!56314)) b!1329256))

(assert (= (and b!1329255 ((_ is ValueCellFull!17315) mapDefault!56314)) b!1329259))

(assert (= start!112346 b!1329255))

(declare-fun m!1218695 () Bool)

(assert (=> b!1329257 m!1218695))

(declare-fun m!1218697 () Bool)

(assert (=> mapNonEmpty!56314 m!1218697))

(declare-fun m!1218699 () Bool)

(assert (=> b!1329258 m!1218699))

(declare-fun m!1218701 () Bool)

(assert (=> start!112346 m!1218701))

(declare-fun m!1218703 () Bool)

(assert (=> start!112346 m!1218703))

(declare-fun m!1218705 () Bool)

(assert (=> start!112346 m!1218705))

(check-sat tp_is_empty!36427 (not mapNonEmpty!56314) (not b!1329258) (not b!1329257) (not start!112346))
(check-sat)
