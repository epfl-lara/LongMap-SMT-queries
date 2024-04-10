; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113002 () Bool)

(assert start!113002)

(declare-fun mapNonEmpty!57286 () Bool)

(declare-fun mapRes!57286 () Bool)

(declare-fun tp!108985 () Bool)

(declare-fun e!762878 () Bool)

(assert (=> mapNonEmpty!57286 (= mapRes!57286 (and tp!108985 e!762878))))

(declare-datatypes ((V!54507 0))(
  ( (V!54508 (val!18601 Int)) )
))
(declare-datatypes ((ValueCell!17628 0))(
  ( (ValueCellFull!17628 (v!21249 V!54507)) (EmptyCell!17628) )
))
(declare-fun mapValue!57286 () ValueCell!17628)

(declare-fun mapKey!57286 () (_ BitVec 32))

(declare-datatypes ((array!90964 0))(
  ( (array!90965 (arr!43938 (Array (_ BitVec 32) ValueCell!17628)) (size!44488 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90964)

(declare-fun mapRest!57286 () (Array (_ BitVec 32) ValueCell!17628))

(assert (=> mapNonEmpty!57286 (= (arr!43938 _values!1303) (store mapRest!57286 mapKey!57286 mapValue!57286))))

(declare-fun b!1339391 () Bool)

(declare-fun e!762874 () Bool)

(declare-fun tp_is_empty!37053 () Bool)

(assert (=> b!1339391 (= e!762874 tp_is_empty!37053)))

(declare-fun res!888534 () Bool)

(declare-fun e!762877 () Bool)

(assert (=> start!113002 (=> (not res!888534) (not e!762877))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113002 (= res!888534 (validMask!0 mask!1977))))

(assert (=> start!113002 e!762877))

(assert (=> start!113002 true))

(declare-fun e!762875 () Bool)

(declare-fun array_inv!33131 (array!90964) Bool)

(assert (=> start!113002 (and (array_inv!33131 _values!1303) e!762875)))

(declare-datatypes ((array!90966 0))(
  ( (array!90967 (arr!43939 (Array (_ BitVec 32) (_ BitVec 64))) (size!44489 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90966)

(declare-fun array_inv!33132 (array!90966) Bool)

(assert (=> start!113002 (array_inv!33132 _keys!1571)))

(declare-fun b!1339392 () Bool)

(assert (=> b!1339392 (= e!762878 tp_is_empty!37053)))

(declare-fun b!1339393 () Bool)

(declare-fun res!888533 () Bool)

(assert (=> b!1339393 (=> (not res!888533) (not e!762877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90966 (_ BitVec 32)) Bool)

(assert (=> b!1339393 (= res!888533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339394 () Bool)

(assert (=> b!1339394 (= e!762875 (and e!762874 mapRes!57286))))

(declare-fun condMapEmpty!57286 () Bool)

(declare-fun mapDefault!57286 () ValueCell!17628)

(assert (=> b!1339394 (= condMapEmpty!57286 (= (arr!43938 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17628)) mapDefault!57286)))))

(declare-fun mapIsEmpty!57286 () Bool)

(assert (=> mapIsEmpty!57286 mapRes!57286))

(declare-fun b!1339395 () Bool)

(declare-fun res!888532 () Bool)

(assert (=> b!1339395 (=> (not res!888532) (not e!762877))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339395 (= res!888532 (and (= (size!44488 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44489 _keys!1571) (size!44488 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339396 () Bool)

(assert (=> b!1339396 (= e!762877 false)))

(declare-fun lt!593883 () Bool)

(declare-datatypes ((List!31107 0))(
  ( (Nil!31104) (Cons!31103 (h!32312 (_ BitVec 64)) (t!45439 List!31107)) )
))
(declare-fun arrayNoDuplicates!0 (array!90966 (_ BitVec 32) List!31107) Bool)

(assert (=> b!1339396 (= lt!593883 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31104))))

(assert (= (and start!113002 res!888534) b!1339395))

(assert (= (and b!1339395 res!888532) b!1339393))

(assert (= (and b!1339393 res!888533) b!1339396))

(assert (= (and b!1339394 condMapEmpty!57286) mapIsEmpty!57286))

(assert (= (and b!1339394 (not condMapEmpty!57286)) mapNonEmpty!57286))

(get-info :version)

(assert (= (and mapNonEmpty!57286 ((_ is ValueCellFull!17628) mapValue!57286)) b!1339392))

(assert (= (and b!1339394 ((_ is ValueCellFull!17628) mapDefault!57286)) b!1339391))

(assert (= start!113002 b!1339394))

(declare-fun m!1227469 () Bool)

(assert (=> mapNonEmpty!57286 m!1227469))

(declare-fun m!1227471 () Bool)

(assert (=> start!113002 m!1227471))

(declare-fun m!1227473 () Bool)

(assert (=> start!113002 m!1227473))

(declare-fun m!1227475 () Bool)

(assert (=> start!113002 m!1227475))

(declare-fun m!1227477 () Bool)

(assert (=> b!1339393 m!1227477))

(declare-fun m!1227479 () Bool)

(assert (=> b!1339396 m!1227479))

(check-sat tp_is_empty!37053 (not b!1339393) (not b!1339396) (not start!113002) (not mapNonEmpty!57286))
(check-sat)
