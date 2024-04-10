; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113050 () Bool)

(assert start!113050)

(declare-fun b_free!31101 () Bool)

(declare-fun b_next!31101 () Bool)

(assert (=> start!113050 (= b_free!31101 (not b_next!31101))))

(declare-fun tp!109107 () Bool)

(declare-fun b_and!50131 () Bool)

(assert (=> start!113050 (= tp!109107 b_and!50131)))

(declare-fun b!1339932 () Bool)

(declare-fun res!888857 () Bool)

(declare-fun e!763236 () Bool)

(assert (=> b!1339932 (=> (not res!888857) (not e!763236))))

(declare-datatypes ((array!91056 0))(
  ( (array!91057 (arr!43984 (Array (_ BitVec 32) (_ BitVec 64))) (size!44534 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91056)

(declare-datatypes ((List!31135 0))(
  ( (Nil!31132) (Cons!31131 (h!32340 (_ BitVec 64)) (t!45467 List!31135)) )
))
(declare-fun arrayNoDuplicates!0 (array!91056 (_ BitVec 32) List!31135) Bool)

(assert (=> b!1339932 (= res!888857 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31132))))

(declare-fun b!1339933 () Bool)

(declare-fun e!763234 () Bool)

(declare-fun tp_is_empty!37101 () Bool)

(assert (=> b!1339933 (= e!763234 tp_is_empty!37101)))

(declare-fun mapNonEmpty!57358 () Bool)

(declare-fun mapRes!57358 () Bool)

(declare-fun tp!109108 () Bool)

(assert (=> mapNonEmpty!57358 (= mapRes!57358 (and tp!109108 e!763234))))

(declare-datatypes ((V!54571 0))(
  ( (V!54572 (val!18625 Int)) )
))
(declare-datatypes ((ValueCell!17652 0))(
  ( (ValueCellFull!17652 (v!21273 V!54571)) (EmptyCell!17652) )
))
(declare-fun mapValue!57358 () ValueCell!17652)

(declare-fun mapKey!57358 () (_ BitVec 32))

(declare-fun mapRest!57358 () (Array (_ BitVec 32) ValueCell!17652))

(declare-datatypes ((array!91058 0))(
  ( (array!91059 (arr!43985 (Array (_ BitVec 32) ValueCell!17652)) (size!44535 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91058)

(assert (=> mapNonEmpty!57358 (= (arr!43985 _values!1303) (store mapRest!57358 mapKey!57358 mapValue!57358))))

(declare-fun res!888861 () Bool)

(assert (=> start!113050 (=> (not res!888861) (not e!763236))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113050 (= res!888861 (validMask!0 mask!1977))))

(assert (=> start!113050 e!763236))

(assert (=> start!113050 tp_is_empty!37101))

(assert (=> start!113050 true))

(declare-fun array_inv!33165 (array!91056) Bool)

(assert (=> start!113050 (array_inv!33165 _keys!1571)))

(declare-fun e!763237 () Bool)

(declare-fun array_inv!33166 (array!91058) Bool)

(assert (=> start!113050 (and (array_inv!33166 _values!1303) e!763237)))

(assert (=> start!113050 tp!109107))

(declare-fun mapIsEmpty!57358 () Bool)

(assert (=> mapIsEmpty!57358 mapRes!57358))

(declare-fun b!1339934 () Bool)

(assert (=> b!1339934 (= e!763236 false)))

(declare-fun minValue!1245 () V!54571)

(declare-fun zeroValue!1245 () V!54571)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lt!593946 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!23968 0))(
  ( (tuple2!23969 (_1!11995 (_ BitVec 64)) (_2!11995 V!54571)) )
))
(declare-datatypes ((List!31136 0))(
  ( (Nil!31133) (Cons!31132 (h!32341 tuple2!23968) (t!45468 List!31136)) )
))
(declare-datatypes ((ListLongMap!21625 0))(
  ( (ListLongMap!21626 (toList!10828 List!31136)) )
))
(declare-fun contains!9004 (ListLongMap!21625 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5797 (array!91056 array!91058 (_ BitVec 32) (_ BitVec 32) V!54571 V!54571 (_ BitVec 32) Int) ListLongMap!21625)

(assert (=> b!1339934 (= lt!593946 (contains!9004 (getCurrentListMap!5797 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1339935 () Bool)

(declare-fun res!888860 () Bool)

(assert (=> b!1339935 (=> (not res!888860) (not e!763236))))

(assert (=> b!1339935 (= res!888860 (and (= (size!44535 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44534 _keys!1571) (size!44535 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339936 () Bool)

(declare-fun res!888858 () Bool)

(assert (=> b!1339936 (=> (not res!888858) (not e!763236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91056 (_ BitVec 32)) Bool)

(assert (=> b!1339936 (= res!888858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339937 () Bool)

(declare-fun e!763235 () Bool)

(assert (=> b!1339937 (= e!763235 tp_is_empty!37101)))

(declare-fun b!1339938 () Bool)

(assert (=> b!1339938 (= e!763237 (and e!763235 mapRes!57358))))

(declare-fun condMapEmpty!57358 () Bool)

(declare-fun mapDefault!57358 () ValueCell!17652)

(assert (=> b!1339938 (= condMapEmpty!57358 (= (arr!43985 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17652)) mapDefault!57358)))))

(declare-fun b!1339939 () Bool)

(declare-fun res!888859 () Bool)

(assert (=> b!1339939 (=> (not res!888859) (not e!763236))))

(assert (=> b!1339939 (= res!888859 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44534 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113050 res!888861) b!1339935))

(assert (= (and b!1339935 res!888860) b!1339936))

(assert (= (and b!1339936 res!888858) b!1339932))

(assert (= (and b!1339932 res!888857) b!1339939))

(assert (= (and b!1339939 res!888859) b!1339934))

(assert (= (and b!1339938 condMapEmpty!57358) mapIsEmpty!57358))

(assert (= (and b!1339938 (not condMapEmpty!57358)) mapNonEmpty!57358))

(get-info :version)

(assert (= (and mapNonEmpty!57358 ((_ is ValueCellFull!17652) mapValue!57358)) b!1339933))

(assert (= (and b!1339938 ((_ is ValueCellFull!17652) mapDefault!57358)) b!1339937))

(assert (= start!113050 b!1339938))

(declare-fun m!1227821 () Bool)

(assert (=> start!113050 m!1227821))

(declare-fun m!1227823 () Bool)

(assert (=> start!113050 m!1227823))

(declare-fun m!1227825 () Bool)

(assert (=> start!113050 m!1227825))

(declare-fun m!1227827 () Bool)

(assert (=> b!1339932 m!1227827))

(declare-fun m!1227829 () Bool)

(assert (=> b!1339934 m!1227829))

(assert (=> b!1339934 m!1227829))

(declare-fun m!1227831 () Bool)

(assert (=> b!1339934 m!1227831))

(declare-fun m!1227833 () Bool)

(assert (=> b!1339936 m!1227833))

(declare-fun m!1227835 () Bool)

(assert (=> mapNonEmpty!57358 m!1227835))

(check-sat (not b!1339934) (not b!1339932) (not b_next!31101) (not mapNonEmpty!57358) b_and!50131 tp_is_empty!37101 (not b!1339936) (not start!113050))
(check-sat b_and!50131 (not b_next!31101))
