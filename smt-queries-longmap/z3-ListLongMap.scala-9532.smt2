; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113054 () Bool)

(assert start!113054)

(declare-fun b_free!31105 () Bool)

(declare-fun b_next!31105 () Bool)

(assert (=> start!113054 (= b_free!31105 (not b_next!31105))))

(declare-fun tp!109121 () Bool)

(declare-fun b_and!50117 () Bool)

(assert (=> start!113054 (= tp!109121 b_and!50117)))

(declare-fun b!1339910 () Bool)

(declare-fun e!763231 () Bool)

(declare-fun tp_is_empty!37105 () Bool)

(assert (=> b!1339910 (= e!763231 tp_is_empty!37105)))

(declare-fun b!1339911 () Bool)

(declare-fun res!888858 () Bool)

(declare-fun e!763235 () Bool)

(assert (=> b!1339911 (=> (not res!888858) (not e!763235))))

(declare-datatypes ((array!91009 0))(
  ( (array!91010 (arr!43961 (Array (_ BitVec 32) (_ BitVec 64))) (size!44513 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91009)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91009 (_ BitVec 32)) Bool)

(assert (=> b!1339911 (= res!888858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339912 () Bool)

(declare-fun res!888859 () Bool)

(assert (=> b!1339912 (=> (not res!888859) (not e!763235))))

(declare-datatypes ((V!54577 0))(
  ( (V!54578 (val!18627 Int)) )
))
(declare-datatypes ((ValueCell!17654 0))(
  ( (ValueCellFull!17654 (v!21274 V!54577)) (EmptyCell!17654) )
))
(declare-datatypes ((array!91011 0))(
  ( (array!91012 (arr!43962 (Array (_ BitVec 32) ValueCell!17654)) (size!44514 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91011)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339912 (= res!888859 (and (= (size!44514 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44513 _keys!1571) (size!44514 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339913 () Bool)

(declare-fun res!888860 () Bool)

(assert (=> b!1339913 (=> (not res!888860) (not e!763235))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1339913 (= res!888860 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44513 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!888862 () Bool)

(assert (=> start!113054 (=> (not res!888862) (not e!763235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113054 (= res!888862 (validMask!0 mask!1977))))

(assert (=> start!113054 e!763235))

(assert (=> start!113054 tp_is_empty!37105))

(assert (=> start!113054 true))

(declare-fun array_inv!33339 (array!91009) Bool)

(assert (=> start!113054 (array_inv!33339 _keys!1571)))

(declare-fun e!763232 () Bool)

(declare-fun array_inv!33340 (array!91011) Bool)

(assert (=> start!113054 (and (array_inv!33340 _values!1303) e!763232)))

(assert (=> start!113054 tp!109121))

(declare-fun b!1339914 () Bool)

(declare-fun mapRes!57364 () Bool)

(assert (=> b!1339914 (= e!763232 (and e!763231 mapRes!57364))))

(declare-fun condMapEmpty!57364 () Bool)

(declare-fun mapDefault!57364 () ValueCell!17654)

(assert (=> b!1339914 (= condMapEmpty!57364 (= (arr!43962 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17654)) mapDefault!57364)))))

(declare-fun b!1339915 () Bool)

(declare-fun res!888861 () Bool)

(assert (=> b!1339915 (=> (not res!888861) (not e!763235))))

(declare-datatypes ((List!31185 0))(
  ( (Nil!31182) (Cons!31181 (h!32390 (_ BitVec 64)) (t!45509 List!31185)) )
))
(declare-fun arrayNoDuplicates!0 (array!91009 (_ BitVec 32) List!31185) Bool)

(assert (=> b!1339915 (= res!888861 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31182))))

(declare-fun b!1339916 () Bool)

(declare-fun e!763233 () Bool)

(assert (=> b!1339916 (= e!763233 tp_is_empty!37105)))

(declare-fun b!1339917 () Bool)

(assert (=> b!1339917 (= e!763235 false)))

(declare-fun minValue!1245 () V!54577)

(declare-fun lt!593766 () Bool)

(declare-fun zeroValue!1245 () V!54577)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24034 0))(
  ( (tuple2!24035 (_1!12028 (_ BitVec 64)) (_2!12028 V!54577)) )
))
(declare-datatypes ((List!31186 0))(
  ( (Nil!31183) (Cons!31182 (h!32391 tuple2!24034) (t!45510 List!31186)) )
))
(declare-datatypes ((ListLongMap!21691 0))(
  ( (ListLongMap!21692 (toList!10861 List!31186)) )
))
(declare-fun contains!8966 (ListLongMap!21691 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5714 (array!91009 array!91011 (_ BitVec 32) (_ BitVec 32) V!54577 V!54577 (_ BitVec 32) Int) ListLongMap!21691)

(assert (=> b!1339917 (= lt!593766 (contains!8966 (getCurrentListMap!5714 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!57364 () Bool)

(assert (=> mapIsEmpty!57364 mapRes!57364))

(declare-fun mapNonEmpty!57364 () Bool)

(declare-fun tp!109120 () Bool)

(assert (=> mapNonEmpty!57364 (= mapRes!57364 (and tp!109120 e!763233))))

(declare-fun mapRest!57364 () (Array (_ BitVec 32) ValueCell!17654))

(declare-fun mapValue!57364 () ValueCell!17654)

(declare-fun mapKey!57364 () (_ BitVec 32))

(assert (=> mapNonEmpty!57364 (= (arr!43962 _values!1303) (store mapRest!57364 mapKey!57364 mapValue!57364))))

(assert (= (and start!113054 res!888862) b!1339912))

(assert (= (and b!1339912 res!888859) b!1339911))

(assert (= (and b!1339911 res!888858) b!1339915))

(assert (= (and b!1339915 res!888861) b!1339913))

(assert (= (and b!1339913 res!888860) b!1339917))

(assert (= (and b!1339914 condMapEmpty!57364) mapIsEmpty!57364))

(assert (= (and b!1339914 (not condMapEmpty!57364)) mapNonEmpty!57364))

(get-info :version)

(assert (= (and mapNonEmpty!57364 ((_ is ValueCellFull!17654) mapValue!57364)) b!1339916))

(assert (= (and b!1339914 ((_ is ValueCellFull!17654) mapDefault!57364)) b!1339910))

(assert (= start!113054 b!1339914))

(declare-fun m!1227337 () Bool)

(assert (=> b!1339915 m!1227337))

(declare-fun m!1227339 () Bool)

(assert (=> start!113054 m!1227339))

(declare-fun m!1227341 () Bool)

(assert (=> start!113054 m!1227341))

(declare-fun m!1227343 () Bool)

(assert (=> start!113054 m!1227343))

(declare-fun m!1227345 () Bool)

(assert (=> mapNonEmpty!57364 m!1227345))

(declare-fun m!1227347 () Bool)

(assert (=> b!1339917 m!1227347))

(assert (=> b!1339917 m!1227347))

(declare-fun m!1227349 () Bool)

(assert (=> b!1339917 m!1227349))

(declare-fun m!1227351 () Bool)

(assert (=> b!1339911 m!1227351))

(check-sat (not mapNonEmpty!57364) (not b!1339911) (not b_next!31105) tp_is_empty!37105 (not b!1339915) (not start!113054) b_and!50117 (not b!1339917))
(check-sat b_and!50117 (not b_next!31105))
