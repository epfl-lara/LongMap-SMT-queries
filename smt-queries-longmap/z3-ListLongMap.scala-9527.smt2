; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113026 () Bool)

(assert start!113026)

(declare-fun b_free!31077 () Bool)

(declare-fun b_next!31077 () Bool)

(assert (=> start!113026 (= b_free!31077 (not b_next!31077))))

(declare-fun tp!109035 () Bool)

(declare-fun b_and!50107 () Bool)

(assert (=> start!113026 (= tp!109035 b_and!50107)))

(declare-fun mapIsEmpty!57322 () Bool)

(declare-fun mapRes!57322 () Bool)

(assert (=> mapIsEmpty!57322 mapRes!57322))

(declare-fun res!888680 () Bool)

(declare-fun e!763055 () Bool)

(assert (=> start!113026 (=> (not res!888680) (not e!763055))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113026 (= res!888680 (validMask!0 mask!1977))))

(assert (=> start!113026 e!763055))

(declare-fun tp_is_empty!37077 () Bool)

(assert (=> start!113026 tp_is_empty!37077))

(assert (=> start!113026 true))

(declare-datatypes ((array!91010 0))(
  ( (array!91011 (arr!43961 (Array (_ BitVec 32) (_ BitVec 64))) (size!44511 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91010)

(declare-fun array_inv!33149 (array!91010) Bool)

(assert (=> start!113026 (array_inv!33149 _keys!1571)))

(declare-datatypes ((V!54539 0))(
  ( (V!54540 (val!18613 Int)) )
))
(declare-datatypes ((ValueCell!17640 0))(
  ( (ValueCellFull!17640 (v!21261 V!54539)) (EmptyCell!17640) )
))
(declare-datatypes ((array!91012 0))(
  ( (array!91013 (arr!43962 (Array (_ BitVec 32) ValueCell!17640)) (size!44512 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91012)

(declare-fun e!763054 () Bool)

(declare-fun array_inv!33150 (array!91012) Bool)

(assert (=> start!113026 (and (array_inv!33150 _values!1303) e!763054)))

(assert (=> start!113026 tp!109035))

(declare-fun b!1339644 () Bool)

(declare-fun res!888681 () Bool)

(assert (=> b!1339644 (=> (not res!888681) (not e!763055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91010 (_ BitVec 32)) Bool)

(assert (=> b!1339644 (= res!888681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339645 () Bool)

(assert (=> b!1339645 (= e!763055 false)))

(declare-fun lt!593910 () Bool)

(declare-fun minValue!1245 () V!54539)

(declare-fun zeroValue!1245 () V!54539)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!23952 0))(
  ( (tuple2!23953 (_1!11987 (_ BitVec 64)) (_2!11987 V!54539)) )
))
(declare-datatypes ((List!31118 0))(
  ( (Nil!31115) (Cons!31114 (h!32323 tuple2!23952) (t!45450 List!31118)) )
))
(declare-datatypes ((ListLongMap!21609 0))(
  ( (ListLongMap!21610 (toList!10820 List!31118)) )
))
(declare-fun contains!8996 (ListLongMap!21609 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5789 (array!91010 array!91012 (_ BitVec 32) (_ BitVec 32) V!54539 V!54539 (_ BitVec 32) Int) ListLongMap!21609)

(assert (=> b!1339645 (= lt!593910 (contains!8996 (getCurrentListMap!5789 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1339646 () Bool)

(declare-fun res!888679 () Bool)

(assert (=> b!1339646 (=> (not res!888679) (not e!763055))))

(declare-datatypes ((List!31119 0))(
  ( (Nil!31116) (Cons!31115 (h!32324 (_ BitVec 64)) (t!45451 List!31119)) )
))
(declare-fun arrayNoDuplicates!0 (array!91010 (_ BitVec 32) List!31119) Bool)

(assert (=> b!1339646 (= res!888679 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31116))))

(declare-fun mapNonEmpty!57322 () Bool)

(declare-fun tp!109036 () Bool)

(declare-fun e!763058 () Bool)

(assert (=> mapNonEmpty!57322 (= mapRes!57322 (and tp!109036 e!763058))))

(declare-fun mapKey!57322 () (_ BitVec 32))

(declare-fun mapRest!57322 () (Array (_ BitVec 32) ValueCell!17640))

(declare-fun mapValue!57322 () ValueCell!17640)

(assert (=> mapNonEmpty!57322 (= (arr!43962 _values!1303) (store mapRest!57322 mapKey!57322 mapValue!57322))))

(declare-fun b!1339647 () Bool)

(declare-fun e!763056 () Bool)

(assert (=> b!1339647 (= e!763054 (and e!763056 mapRes!57322))))

(declare-fun condMapEmpty!57322 () Bool)

(declare-fun mapDefault!57322 () ValueCell!17640)

(assert (=> b!1339647 (= condMapEmpty!57322 (= (arr!43962 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17640)) mapDefault!57322)))))

(declare-fun b!1339648 () Bool)

(assert (=> b!1339648 (= e!763058 tp_is_empty!37077)))

(declare-fun b!1339649 () Bool)

(assert (=> b!1339649 (= e!763056 tp_is_empty!37077)))

(declare-fun b!1339650 () Bool)

(declare-fun res!888677 () Bool)

(assert (=> b!1339650 (=> (not res!888677) (not e!763055))))

(assert (=> b!1339650 (= res!888677 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44511 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339651 () Bool)

(declare-fun res!888678 () Bool)

(assert (=> b!1339651 (=> (not res!888678) (not e!763055))))

(assert (=> b!1339651 (= res!888678 (and (= (size!44512 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44511 _keys!1571) (size!44512 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113026 res!888680) b!1339651))

(assert (= (and b!1339651 res!888678) b!1339644))

(assert (= (and b!1339644 res!888681) b!1339646))

(assert (= (and b!1339646 res!888679) b!1339650))

(assert (= (and b!1339650 res!888677) b!1339645))

(assert (= (and b!1339647 condMapEmpty!57322) mapIsEmpty!57322))

(assert (= (and b!1339647 (not condMapEmpty!57322)) mapNonEmpty!57322))

(get-info :version)

(assert (= (and mapNonEmpty!57322 ((_ is ValueCellFull!17640) mapValue!57322)) b!1339648))

(assert (= (and b!1339647 ((_ is ValueCellFull!17640) mapDefault!57322)) b!1339649))

(assert (= start!113026 b!1339647))

(declare-fun m!1227629 () Bool)

(assert (=> b!1339644 m!1227629))

(declare-fun m!1227631 () Bool)

(assert (=> mapNonEmpty!57322 m!1227631))

(declare-fun m!1227633 () Bool)

(assert (=> b!1339646 m!1227633))

(declare-fun m!1227635 () Bool)

(assert (=> b!1339645 m!1227635))

(assert (=> b!1339645 m!1227635))

(declare-fun m!1227637 () Bool)

(assert (=> b!1339645 m!1227637))

(declare-fun m!1227639 () Bool)

(assert (=> start!113026 m!1227639))

(declare-fun m!1227641 () Bool)

(assert (=> start!113026 m!1227641))

(declare-fun m!1227643 () Bool)

(assert (=> start!113026 m!1227643))

(check-sat tp_is_empty!37077 (not b!1339645) (not b!1339644) (not b_next!31077) b_and!50107 (not mapNonEmpty!57322) (not b!1339646) (not start!113026))
(check-sat b_and!50107 (not b_next!31077))
