; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112990 () Bool)

(assert start!112990)

(declare-fun b!1339283 () Bool)

(declare-fun res!888478 () Bool)

(declare-fun e!762787 () Bool)

(assert (=> b!1339283 (=> (not res!888478) (not e!762787))))

(declare-datatypes ((array!90942 0))(
  ( (array!90943 (arr!43927 (Array (_ BitVec 32) (_ BitVec 64))) (size!44477 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90942)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90942 (_ BitVec 32)) Bool)

(assert (=> b!1339283 (= res!888478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!888480 () Bool)

(assert (=> start!112990 (=> (not res!888480) (not e!762787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112990 (= res!888480 (validMask!0 mask!1977))))

(assert (=> start!112990 e!762787))

(assert (=> start!112990 true))

(declare-datatypes ((V!54491 0))(
  ( (V!54492 (val!18595 Int)) )
))
(declare-datatypes ((ValueCell!17622 0))(
  ( (ValueCellFull!17622 (v!21243 V!54491)) (EmptyCell!17622) )
))
(declare-datatypes ((array!90944 0))(
  ( (array!90945 (arr!43928 (Array (_ BitVec 32) ValueCell!17622)) (size!44478 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90944)

(declare-fun e!762788 () Bool)

(declare-fun array_inv!33123 (array!90944) Bool)

(assert (=> start!112990 (and (array_inv!33123 _values!1303) e!762788)))

(declare-fun array_inv!33124 (array!90942) Bool)

(assert (=> start!112990 (array_inv!33124 _keys!1571)))

(declare-fun b!1339284 () Bool)

(declare-fun res!888479 () Bool)

(assert (=> b!1339284 (=> (not res!888479) (not e!762787))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339284 (= res!888479 (and (= (size!44478 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44477 _keys!1571) (size!44478 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339285 () Bool)

(declare-fun e!762784 () Bool)

(declare-fun tp_is_empty!37041 () Bool)

(assert (=> b!1339285 (= e!762784 tp_is_empty!37041)))

(declare-fun mapIsEmpty!57268 () Bool)

(declare-fun mapRes!57268 () Bool)

(assert (=> mapIsEmpty!57268 mapRes!57268))

(declare-fun b!1339286 () Bool)

(declare-fun e!762785 () Bool)

(assert (=> b!1339286 (= e!762788 (and e!762785 mapRes!57268))))

(declare-fun condMapEmpty!57268 () Bool)

(declare-fun mapDefault!57268 () ValueCell!17622)

(assert (=> b!1339286 (= condMapEmpty!57268 (= (arr!43928 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17622)) mapDefault!57268)))))

(declare-fun b!1339287 () Bool)

(assert (=> b!1339287 (= e!762787 false)))

(declare-fun lt!593865 () Bool)

(declare-datatypes ((List!31104 0))(
  ( (Nil!31101) (Cons!31100 (h!32309 (_ BitVec 64)) (t!45436 List!31104)) )
))
(declare-fun arrayNoDuplicates!0 (array!90942 (_ BitVec 32) List!31104) Bool)

(assert (=> b!1339287 (= lt!593865 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31101))))

(declare-fun b!1339288 () Bool)

(assert (=> b!1339288 (= e!762785 tp_is_empty!37041)))

(declare-fun mapNonEmpty!57268 () Bool)

(declare-fun tp!108967 () Bool)

(assert (=> mapNonEmpty!57268 (= mapRes!57268 (and tp!108967 e!762784))))

(declare-fun mapKey!57268 () (_ BitVec 32))

(declare-fun mapValue!57268 () ValueCell!17622)

(declare-fun mapRest!57268 () (Array (_ BitVec 32) ValueCell!17622))

(assert (=> mapNonEmpty!57268 (= (arr!43928 _values!1303) (store mapRest!57268 mapKey!57268 mapValue!57268))))

(assert (= (and start!112990 res!888480) b!1339284))

(assert (= (and b!1339284 res!888479) b!1339283))

(assert (= (and b!1339283 res!888478) b!1339287))

(assert (= (and b!1339286 condMapEmpty!57268) mapIsEmpty!57268))

(assert (= (and b!1339286 (not condMapEmpty!57268)) mapNonEmpty!57268))

(get-info :version)

(assert (= (and mapNonEmpty!57268 ((_ is ValueCellFull!17622) mapValue!57268)) b!1339285))

(assert (= (and b!1339286 ((_ is ValueCellFull!17622) mapDefault!57268)) b!1339288))

(assert (= start!112990 b!1339286))

(declare-fun m!1227397 () Bool)

(assert (=> b!1339283 m!1227397))

(declare-fun m!1227399 () Bool)

(assert (=> start!112990 m!1227399))

(declare-fun m!1227401 () Bool)

(assert (=> start!112990 m!1227401))

(declare-fun m!1227403 () Bool)

(assert (=> start!112990 m!1227403))

(declare-fun m!1227405 () Bool)

(assert (=> b!1339287 m!1227405))

(declare-fun m!1227407 () Bool)

(assert (=> mapNonEmpty!57268 m!1227407))

(check-sat (not start!112990) tp_is_empty!37041 (not mapNonEmpty!57268) (not b!1339283) (not b!1339287))
(check-sat)
