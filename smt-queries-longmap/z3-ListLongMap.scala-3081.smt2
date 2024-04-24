; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43364 () Bool)

(assert start!43364)

(declare-fun b_free!12205 () Bool)

(declare-fun b_next!12205 () Bool)

(assert (=> start!43364 (= b_free!12205 (not b_next!12205))))

(declare-fun tp!42892 () Bool)

(declare-fun b_and!20971 () Bool)

(assert (=> start!43364 (= tp!42892 b_and!20971)))

(declare-fun b!480533 () Bool)

(declare-fun e!282744 () Bool)

(declare-fun tp_is_empty!13717 () Bool)

(assert (=> b!480533 (= e!282744 tp_is_empty!13717)))

(declare-fun b!480534 () Bool)

(declare-fun res!286594 () Bool)

(declare-fun e!282743 () Bool)

(assert (=> b!480534 (=> (not res!286594) (not e!282743))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480534 (= res!286594 (validKeyInArray!0 k0!1332))))

(declare-fun b!480535 () Bool)

(declare-fun res!286597 () Bool)

(assert (=> b!480535 (=> (not res!286597) (not e!282743))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19361 0))(
  ( (V!19362 (val!6906 Int)) )
))
(declare-fun minValue!1458 () V!19361)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19361)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31088 0))(
  ( (array!31089 (arr!14948 (Array (_ BitVec 32) (_ BitVec 64))) (size!15306 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31088)

(declare-datatypes ((ValueCell!6497 0))(
  ( (ValueCellFull!6497 (v!9198 V!19361)) (EmptyCell!6497) )
))
(declare-datatypes ((array!31090 0))(
  ( (array!31091 (arr!14949 (Array (_ BitVec 32) ValueCell!6497)) (size!15307 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31090)

(declare-datatypes ((tuple2!8980 0))(
  ( (tuple2!8981 (_1!4501 (_ BitVec 64)) (_2!4501 V!19361)) )
))
(declare-datatypes ((List!9050 0))(
  ( (Nil!9047) (Cons!9046 (h!9902 tuple2!8980) (t!15252 List!9050)) )
))
(declare-datatypes ((ListLongMap!7895 0))(
  ( (ListLongMap!7896 (toList!3963 List!9050)) )
))
(declare-fun contains!2593 (ListLongMap!7895 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2277 (array!31088 array!31090 (_ BitVec 32) (_ BitVec 32) V!19361 V!19361 (_ BitVec 32) Int) ListLongMap!7895)

(assert (=> b!480535 (= res!286597 (contains!2593 (getCurrentListMap!2277 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480536 () Bool)

(declare-fun e!282740 () Bool)

(declare-fun arrayContainsKey!0 (array!31088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480536 (= e!282740 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!22279 () Bool)

(declare-fun mapRes!22279 () Bool)

(assert (=> mapIsEmpty!22279 mapRes!22279))

(declare-fun b!480537 () Bool)

(declare-fun e!282739 () Bool)

(assert (=> b!480537 (= e!282739 tp_is_empty!13717)))

(declare-fun res!286595 () Bool)

(assert (=> start!43364 (=> (not res!286595) (not e!282743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43364 (= res!286595 (validMask!0 mask!2352))))

(assert (=> start!43364 e!282743))

(assert (=> start!43364 true))

(assert (=> start!43364 tp_is_empty!13717))

(declare-fun e!282742 () Bool)

(declare-fun array_inv!10856 (array!31090) Bool)

(assert (=> start!43364 (and (array_inv!10856 _values!1516) e!282742)))

(assert (=> start!43364 tp!42892))

(declare-fun array_inv!10857 (array!31088) Bool)

(assert (=> start!43364 (array_inv!10857 _keys!1874)))

(declare-fun b!480538 () Bool)

(declare-fun res!286593 () Bool)

(assert (=> b!480538 (=> (not res!286593) (not e!282743))))

(assert (=> b!480538 (= res!286593 (and (= (size!15307 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15306 _keys!1874) (size!15307 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480539 () Bool)

(assert (=> b!480539 (= e!282743 (not true))))

(declare-fun lt!218190 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31088 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480539 (= lt!218190 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480539 e!282740))

(declare-fun c!57766 () Bool)

(assert (=> b!480539 (= c!57766 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14063 0))(
  ( (Unit!14064) )
))
(declare-fun lt!218191 () Unit!14063)

(declare-fun lemmaKeyInListMapIsInArray!125 (array!31088 array!31090 (_ BitVec 32) (_ BitVec 32) V!19361 V!19361 (_ BitVec 64) Int) Unit!14063)

(assert (=> b!480539 (= lt!218191 (lemmaKeyInListMapIsInArray!125 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!480540 () Bool)

(declare-fun res!286596 () Bool)

(assert (=> b!480540 (=> (not res!286596) (not e!282743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31088 (_ BitVec 32)) Bool)

(assert (=> b!480540 (= res!286596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480541 () Bool)

(declare-fun res!286598 () Bool)

(assert (=> b!480541 (=> (not res!286598) (not e!282743))))

(declare-datatypes ((List!9051 0))(
  ( (Nil!9048) (Cons!9047 (h!9903 (_ BitVec 64)) (t!15253 List!9051)) )
))
(declare-fun arrayNoDuplicates!0 (array!31088 (_ BitVec 32) List!9051) Bool)

(assert (=> b!480541 (= res!286598 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9048))))

(declare-fun mapNonEmpty!22279 () Bool)

(declare-fun tp!42891 () Bool)

(assert (=> mapNonEmpty!22279 (= mapRes!22279 (and tp!42891 e!282739))))

(declare-fun mapValue!22279 () ValueCell!6497)

(declare-fun mapKey!22279 () (_ BitVec 32))

(declare-fun mapRest!22279 () (Array (_ BitVec 32) ValueCell!6497))

(assert (=> mapNonEmpty!22279 (= (arr!14949 _values!1516) (store mapRest!22279 mapKey!22279 mapValue!22279))))

(declare-fun b!480542 () Bool)

(assert (=> b!480542 (= e!282740 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480543 () Bool)

(assert (=> b!480543 (= e!282742 (and e!282744 mapRes!22279))))

(declare-fun condMapEmpty!22279 () Bool)

(declare-fun mapDefault!22279 () ValueCell!6497)

(assert (=> b!480543 (= condMapEmpty!22279 (= (arr!14949 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6497)) mapDefault!22279)))))

(assert (= (and start!43364 res!286595) b!480538))

(assert (= (and b!480538 res!286593) b!480540))

(assert (= (and b!480540 res!286596) b!480541))

(assert (= (and b!480541 res!286598) b!480535))

(assert (= (and b!480535 res!286597) b!480534))

(assert (= (and b!480534 res!286594) b!480539))

(assert (= (and b!480539 c!57766) b!480536))

(assert (= (and b!480539 (not c!57766)) b!480542))

(assert (= (and b!480543 condMapEmpty!22279) mapIsEmpty!22279))

(assert (= (and b!480543 (not condMapEmpty!22279)) mapNonEmpty!22279))

(get-info :version)

(assert (= (and mapNonEmpty!22279 ((_ is ValueCellFull!6497) mapValue!22279)) b!480537))

(assert (= (and b!480543 ((_ is ValueCellFull!6497) mapDefault!22279)) b!480533))

(assert (= start!43364 b!480543))

(declare-fun m!462385 () Bool)

(assert (=> b!480541 m!462385))

(declare-fun m!462387 () Bool)

(assert (=> b!480536 m!462387))

(declare-fun m!462389 () Bool)

(assert (=> b!480534 m!462389))

(declare-fun m!462391 () Bool)

(assert (=> b!480539 m!462391))

(declare-fun m!462393 () Bool)

(assert (=> b!480539 m!462393))

(declare-fun m!462395 () Bool)

(assert (=> start!43364 m!462395))

(declare-fun m!462397 () Bool)

(assert (=> start!43364 m!462397))

(declare-fun m!462399 () Bool)

(assert (=> start!43364 m!462399))

(declare-fun m!462401 () Bool)

(assert (=> b!480535 m!462401))

(assert (=> b!480535 m!462401))

(declare-fun m!462403 () Bool)

(assert (=> b!480535 m!462403))

(declare-fun m!462405 () Bool)

(assert (=> mapNonEmpty!22279 m!462405))

(declare-fun m!462407 () Bool)

(assert (=> b!480540 m!462407))

(check-sat (not b!480535) tp_is_empty!13717 b_and!20971 (not b_next!12205) (not start!43364) (not b!480536) (not b!480534) (not mapNonEmpty!22279) (not b!480539) (not b!480541) (not b!480540))
(check-sat b_and!20971 (not b_next!12205))
