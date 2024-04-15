; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113000 () Bool)

(assert start!113000)

(declare-fun b!1339304 () Bool)

(declare-fun res!888494 () Bool)

(declare-fun e!762828 () Bool)

(assert (=> b!1339304 (=> (not res!888494) (not e!762828))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!90907 0))(
  ( (array!90908 (arr!43910 (Array (_ BitVec 32) (_ BitVec 64))) (size!44462 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90907)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54505 0))(
  ( (V!54506 (val!18600 Int)) )
))
(declare-datatypes ((ValueCell!17627 0))(
  ( (ValueCellFull!17627 (v!21247 V!54505)) (EmptyCell!17627) )
))
(declare-datatypes ((array!90909 0))(
  ( (array!90910 (arr!43911 (Array (_ BitVec 32) ValueCell!17627)) (size!44463 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90909)

(assert (=> b!1339304 (= res!888494 (and (= (size!44463 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44462 _keys!1571) (size!44463 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339305 () Bool)

(declare-fun e!762830 () Bool)

(declare-fun e!762827 () Bool)

(declare-fun mapRes!57283 () Bool)

(assert (=> b!1339305 (= e!762830 (and e!762827 mapRes!57283))))

(declare-fun condMapEmpty!57283 () Bool)

(declare-fun mapDefault!57283 () ValueCell!17627)

(assert (=> b!1339305 (= condMapEmpty!57283 (= (arr!43911 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17627)) mapDefault!57283)))))

(declare-fun mapIsEmpty!57283 () Bool)

(assert (=> mapIsEmpty!57283 mapRes!57283))

(declare-fun b!1339306 () Bool)

(declare-fun res!888495 () Bool)

(assert (=> b!1339306 (=> (not res!888495) (not e!762828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90907 (_ BitVec 32)) Bool)

(assert (=> b!1339306 (= res!888495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339307 () Bool)

(assert (=> b!1339307 (= e!762828 false)))

(declare-fun lt!593694 () Bool)

(declare-datatypes ((List!31151 0))(
  ( (Nil!31148) (Cons!31147 (h!32356 (_ BitVec 64)) (t!45475 List!31151)) )
))
(declare-fun arrayNoDuplicates!0 (array!90907 (_ BitVec 32) List!31151) Bool)

(assert (=> b!1339307 (= lt!593694 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31148))))

(declare-fun res!888496 () Bool)

(assert (=> start!113000 (=> (not res!888496) (not e!762828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113000 (= res!888496 (validMask!0 mask!1977))))

(assert (=> start!113000 e!762828))

(assert (=> start!113000 true))

(declare-fun array_inv!33301 (array!90909) Bool)

(assert (=> start!113000 (and (array_inv!33301 _values!1303) e!762830)))

(declare-fun array_inv!33302 (array!90907) Bool)

(assert (=> start!113000 (array_inv!33302 _keys!1571)))

(declare-fun b!1339303 () Bool)

(declare-fun tp_is_empty!37051 () Bool)

(assert (=> b!1339303 (= e!762827 tp_is_empty!37051)))

(declare-fun mapNonEmpty!57283 () Bool)

(declare-fun tp!108983 () Bool)

(declare-fun e!762826 () Bool)

(assert (=> mapNonEmpty!57283 (= mapRes!57283 (and tp!108983 e!762826))))

(declare-fun mapRest!57283 () (Array (_ BitVec 32) ValueCell!17627))

(declare-fun mapValue!57283 () ValueCell!17627)

(declare-fun mapKey!57283 () (_ BitVec 32))

(assert (=> mapNonEmpty!57283 (= (arr!43911 _values!1303) (store mapRest!57283 mapKey!57283 mapValue!57283))))

(declare-fun b!1339308 () Bool)

(assert (=> b!1339308 (= e!762826 tp_is_empty!37051)))

(assert (= (and start!113000 res!888496) b!1339304))

(assert (= (and b!1339304 res!888494) b!1339306))

(assert (= (and b!1339306 res!888495) b!1339307))

(assert (= (and b!1339305 condMapEmpty!57283) mapIsEmpty!57283))

(assert (= (and b!1339305 (not condMapEmpty!57283)) mapNonEmpty!57283))

(get-info :version)

(assert (= (and mapNonEmpty!57283 ((_ is ValueCellFull!17627) mapValue!57283)) b!1339308))

(assert (= (and b!1339305 ((_ is ValueCellFull!17627) mapDefault!57283)) b!1339303))

(assert (= start!113000 b!1339305))

(declare-fun m!1226941 () Bool)

(assert (=> b!1339306 m!1226941))

(declare-fun m!1226943 () Bool)

(assert (=> b!1339307 m!1226943))

(declare-fun m!1226945 () Bool)

(assert (=> start!113000 m!1226945))

(declare-fun m!1226947 () Bool)

(assert (=> start!113000 m!1226947))

(declare-fun m!1226949 () Bool)

(assert (=> start!113000 m!1226949))

(declare-fun m!1226951 () Bool)

(assert (=> mapNonEmpty!57283 m!1226951))

(check-sat (not b!1339307) (not b!1339306) (not mapNonEmpty!57283) tp_is_empty!37051 (not start!113000))
(check-sat)
