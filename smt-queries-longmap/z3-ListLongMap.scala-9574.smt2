; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113530 () Bool)

(assert start!113530)

(declare-fun b_free!31357 () Bool)

(declare-fun b_next!31357 () Bool)

(assert (=> start!113530 (= b_free!31357 (not b_next!31357))))

(declare-fun tp!109876 () Bool)

(declare-fun b_and!50581 () Bool)

(assert (=> start!113530 (= tp!109876 b_and!50581)))

(declare-fun b!1345674 () Bool)

(declare-fun res!892476 () Bool)

(declare-fun e!765999 () Bool)

(assert (=> b!1345674 (=> (not res!892476) (not e!765999))))

(declare-datatypes ((array!91665 0))(
  ( (array!91666 (arr!44284 (Array (_ BitVec 32) (_ BitVec 64))) (size!44835 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91665)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91665 (_ BitVec 32)) Bool)

(assert (=> b!1345674 (= res!892476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345675 () Bool)

(declare-fun e!766001 () Bool)

(declare-fun tp_is_empty!37357 () Bool)

(assert (=> b!1345675 (= e!766001 tp_is_empty!37357)))

(declare-fun b!1345676 () Bool)

(declare-fun e!766000 () Bool)

(assert (=> b!1345676 (= e!766000 tp_is_empty!37357)))

(declare-fun b!1345677 () Bool)

(declare-fun res!892474 () Bool)

(assert (=> b!1345677 (=> (not res!892474) (not e!765999))))

(declare-datatypes ((List!31354 0))(
  ( (Nil!31351) (Cons!31350 (h!32568 (_ BitVec 64)) (t!45870 List!31354)) )
))
(declare-fun arrayNoDuplicates!0 (array!91665 (_ BitVec 32) List!31354) Bool)

(assert (=> b!1345677 (= res!892474 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31351))))

(declare-fun b!1345678 () Bool)

(declare-fun res!892475 () Bool)

(assert (=> b!1345678 (=> (not res!892475) (not e!765999))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54913 0))(
  ( (V!54914 (val!18753 Int)) )
))
(declare-datatypes ((ValueCell!17780 0))(
  ( (ValueCellFull!17780 (v!21396 V!54913)) (EmptyCell!17780) )
))
(declare-datatypes ((array!91667 0))(
  ( (array!91668 (arr!44285 (Array (_ BitVec 32) ValueCell!17780)) (size!44836 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91667)

(assert (=> b!1345678 (= res!892475 (and (= (size!44836 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44835 _keys!1571) (size!44836 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!892477 () Bool)

(assert (=> start!113530 (=> (not res!892477) (not e!765999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113530 (= res!892477 (validMask!0 mask!1977))))

(assert (=> start!113530 e!765999))

(assert (=> start!113530 tp_is_empty!37357))

(assert (=> start!113530 true))

(declare-fun array_inv!33645 (array!91665) Bool)

(assert (=> start!113530 (array_inv!33645 _keys!1571)))

(declare-fun e!765997 () Bool)

(declare-fun array_inv!33646 (array!91667) Bool)

(assert (=> start!113530 (and (array_inv!33646 _values!1303) e!765997)))

(assert (=> start!113530 tp!109876))

(declare-fun mapNonEmpty!57742 () Bool)

(declare-fun mapRes!57742 () Bool)

(declare-fun tp!109875 () Bool)

(assert (=> mapNonEmpty!57742 (= mapRes!57742 (and tp!109875 e!766000))))

(declare-fun mapKey!57742 () (_ BitVec 32))

(declare-fun mapRest!57742 () (Array (_ BitVec 32) ValueCell!17780))

(declare-fun mapValue!57742 () ValueCell!17780)

(assert (=> mapNonEmpty!57742 (= (arr!44285 _values!1303) (store mapRest!57742 mapKey!57742 mapValue!57742))))

(declare-fun b!1345679 () Bool)

(assert (=> b!1345679 (= e!765999 false)))

(declare-fun minValue!1245 () V!54913)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun lt!595661 () Bool)

(declare-fun zeroValue!1245 () V!54913)

(declare-datatypes ((tuple2!24212 0))(
  ( (tuple2!24213 (_1!12117 (_ BitVec 64)) (_2!12117 V!54913)) )
))
(declare-datatypes ((List!31355 0))(
  ( (Nil!31352) (Cons!31351 (h!32569 tuple2!24212) (t!45871 List!31355)) )
))
(declare-datatypes ((ListLongMap!21877 0))(
  ( (ListLongMap!21878 (toList!10954 List!31355)) )
))
(declare-fun contains!9142 (ListLongMap!21877 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5898 (array!91665 array!91667 (_ BitVec 32) (_ BitVec 32) V!54913 V!54913 (_ BitVec 32) Int) ListLongMap!21877)

(assert (=> b!1345679 (= lt!595661 (contains!9142 (getCurrentListMap!5898 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345680 () Bool)

(assert (=> b!1345680 (= e!765997 (and e!766001 mapRes!57742))))

(declare-fun condMapEmpty!57742 () Bool)

(declare-fun mapDefault!57742 () ValueCell!17780)

(assert (=> b!1345680 (= condMapEmpty!57742 (= (arr!44285 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17780)) mapDefault!57742)))))

(declare-fun b!1345681 () Bool)

(declare-fun res!892478 () Bool)

(assert (=> b!1345681 (=> (not res!892478) (not e!765999))))

(assert (=> b!1345681 (= res!892478 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44835 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57742 () Bool)

(assert (=> mapIsEmpty!57742 mapRes!57742))

(assert (= (and start!113530 res!892477) b!1345678))

(assert (= (and b!1345678 res!892475) b!1345674))

(assert (= (and b!1345674 res!892476) b!1345677))

(assert (= (and b!1345677 res!892474) b!1345681))

(assert (= (and b!1345681 res!892478) b!1345679))

(assert (= (and b!1345680 condMapEmpty!57742) mapIsEmpty!57742))

(assert (= (and b!1345680 (not condMapEmpty!57742)) mapNonEmpty!57742))

(get-info :version)

(assert (= (and mapNonEmpty!57742 ((_ is ValueCellFull!17780) mapValue!57742)) b!1345676))

(assert (= (and b!1345680 ((_ is ValueCellFull!17780) mapDefault!57742)) b!1345675))

(assert (= start!113530 b!1345680))

(declare-fun m!1233597 () Bool)

(assert (=> b!1345674 m!1233597))

(declare-fun m!1233599 () Bool)

(assert (=> b!1345677 m!1233599))

(declare-fun m!1233601 () Bool)

(assert (=> start!113530 m!1233601))

(declare-fun m!1233603 () Bool)

(assert (=> start!113530 m!1233603))

(declare-fun m!1233605 () Bool)

(assert (=> start!113530 m!1233605))

(declare-fun m!1233607 () Bool)

(assert (=> mapNonEmpty!57742 m!1233607))

(declare-fun m!1233609 () Bool)

(assert (=> b!1345679 m!1233609))

(assert (=> b!1345679 m!1233609))

(declare-fun m!1233611 () Bool)

(assert (=> b!1345679 m!1233611))

(check-sat (not mapNonEmpty!57742) (not b!1345674) (not b_next!31357) (not start!113530) (not b!1345677) tp_is_empty!37357 b_and!50581 (not b!1345679))
(check-sat b_and!50581 (not b_next!31357))
