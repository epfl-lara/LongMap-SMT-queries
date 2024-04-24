; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113638 () Bool)

(assert start!113638)

(declare-fun b_free!31465 () Bool)

(declare-fun b_next!31465 () Bool)

(assert (=> start!113638 (= b_free!31465 (not b_next!31465))))

(declare-fun tp!110200 () Bool)

(declare-fun b_and!50755 () Bool)

(assert (=> start!113638 (= tp!110200 b_and!50755)))

(declare-fun b!1347621 () Bool)

(declare-fun res!893871 () Bool)

(declare-fun e!766892 () Bool)

(assert (=> b!1347621 (=> (not res!893871) (not e!766892))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91875 0))(
  ( (array!91876 (arr!44389 (Array (_ BitVec 32) (_ BitVec 64))) (size!44940 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91875)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1347621 (= res!893871 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44940 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347622 () Bool)

(declare-fun e!766888 () Bool)

(declare-fun tp_is_empty!37465 () Bool)

(assert (=> b!1347622 (= e!766888 tp_is_empty!37465)))

(declare-fun b!1347623 () Bool)

(declare-fun e!766890 () Bool)

(declare-fun mapRes!57904 () Bool)

(assert (=> b!1347623 (= e!766890 (and e!766888 mapRes!57904))))

(declare-fun condMapEmpty!57904 () Bool)

(declare-datatypes ((V!55057 0))(
  ( (V!55058 (val!18807 Int)) )
))
(declare-datatypes ((ValueCell!17834 0))(
  ( (ValueCellFull!17834 (v!21450 V!55057)) (EmptyCell!17834) )
))
(declare-datatypes ((array!91877 0))(
  ( (array!91878 (arr!44390 (Array (_ BitVec 32) ValueCell!17834)) (size!44941 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91877)

(declare-fun mapDefault!57904 () ValueCell!17834)

(assert (=> b!1347623 (= condMapEmpty!57904 (= (arr!44390 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17834)) mapDefault!57904)))))

(declare-fun b!1347624 () Bool)

(declare-fun res!893870 () Bool)

(assert (=> b!1347624 (=> (not res!893870) (not e!766892))))

(declare-datatypes ((List!31430 0))(
  ( (Nil!31427) (Cons!31426 (h!32644 (_ BitVec 64)) (t!46012 List!31430)) )
))
(declare-fun arrayNoDuplicates!0 (array!91875 (_ BitVec 32) List!31430) Bool)

(assert (=> b!1347624 (= res!893870 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31427))))

(declare-fun b!1347625 () Bool)

(declare-fun res!893873 () Bool)

(assert (=> b!1347625 (=> (not res!893873) (not e!766892))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91875 (_ BitVec 32)) Bool)

(assert (=> b!1347625 (= res!893873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347627 () Bool)

(assert (=> b!1347627 (= e!766892 false)))

(declare-fun minValue!1245 () V!55057)

(declare-fun zeroValue!1245 () V!55057)

(declare-fun lt!595976 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24288 0))(
  ( (tuple2!24289 (_1!12155 (_ BitVec 64)) (_2!12155 V!55057)) )
))
(declare-datatypes ((List!31431 0))(
  ( (Nil!31428) (Cons!31427 (h!32645 tuple2!24288) (t!46013 List!31431)) )
))
(declare-datatypes ((ListLongMap!21953 0))(
  ( (ListLongMap!21954 (toList!10992 List!31431)) )
))
(declare-fun contains!9180 (ListLongMap!21953 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5932 (array!91875 array!91877 (_ BitVec 32) (_ BitVec 32) V!55057 V!55057 (_ BitVec 32) Int) ListLongMap!21953)

(assert (=> b!1347627 (= lt!595976 (contains!9180 (getCurrentListMap!5932 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!57904 () Bool)

(declare-fun tp!110199 () Bool)

(declare-fun e!766889 () Bool)

(assert (=> mapNonEmpty!57904 (= mapRes!57904 (and tp!110199 e!766889))))

(declare-fun mapValue!57904 () ValueCell!17834)

(declare-fun mapRest!57904 () (Array (_ BitVec 32) ValueCell!17834))

(declare-fun mapKey!57904 () (_ BitVec 32))

(assert (=> mapNonEmpty!57904 (= (arr!44390 _values!1303) (store mapRest!57904 mapKey!57904 mapValue!57904))))

(declare-fun res!893872 () Bool)

(assert (=> start!113638 (=> (not res!893872) (not e!766892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113638 (= res!893872 (validMask!0 mask!1977))))

(assert (=> start!113638 e!766892))

(assert (=> start!113638 tp_is_empty!37465))

(assert (=> start!113638 true))

(declare-fun array_inv!33709 (array!91875) Bool)

(assert (=> start!113638 (array_inv!33709 _keys!1571)))

(declare-fun array_inv!33710 (array!91877) Bool)

(assert (=> start!113638 (and (array_inv!33710 _values!1303) e!766890)))

(assert (=> start!113638 tp!110200))

(declare-fun b!1347626 () Bool)

(declare-fun res!893869 () Bool)

(assert (=> b!1347626 (=> (not res!893869) (not e!766892))))

(assert (=> b!1347626 (= res!893869 (and (= (size!44941 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44940 _keys!1571) (size!44941 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57904 () Bool)

(assert (=> mapIsEmpty!57904 mapRes!57904))

(declare-fun b!1347628 () Bool)

(assert (=> b!1347628 (= e!766889 tp_is_empty!37465)))

(assert (= (and start!113638 res!893872) b!1347626))

(assert (= (and b!1347626 res!893869) b!1347625))

(assert (= (and b!1347625 res!893873) b!1347624))

(assert (= (and b!1347624 res!893870) b!1347621))

(assert (= (and b!1347621 res!893871) b!1347627))

(assert (= (and b!1347623 condMapEmpty!57904) mapIsEmpty!57904))

(assert (= (and b!1347623 (not condMapEmpty!57904)) mapNonEmpty!57904))

(get-info :version)

(assert (= (and mapNonEmpty!57904 ((_ is ValueCellFull!17834) mapValue!57904)) b!1347628))

(assert (= (and b!1347623 ((_ is ValueCellFull!17834) mapDefault!57904)) b!1347622))

(assert (= start!113638 b!1347623))

(declare-fun m!1235109 () Bool)

(assert (=> b!1347627 m!1235109))

(assert (=> b!1347627 m!1235109))

(declare-fun m!1235111 () Bool)

(assert (=> b!1347627 m!1235111))

(declare-fun m!1235113 () Bool)

(assert (=> start!113638 m!1235113))

(declare-fun m!1235115 () Bool)

(assert (=> start!113638 m!1235115))

(declare-fun m!1235117 () Bool)

(assert (=> start!113638 m!1235117))

(declare-fun m!1235119 () Bool)

(assert (=> b!1347624 m!1235119))

(declare-fun m!1235121 () Bool)

(assert (=> mapNonEmpty!57904 m!1235121))

(declare-fun m!1235123 () Bool)

(assert (=> b!1347625 m!1235123))

(check-sat tp_is_empty!37465 b_and!50755 (not b!1347624) (not start!113638) (not mapNonEmpty!57904) (not b_next!31465) (not b!1347627) (not b!1347625))
(check-sat b_and!50755 (not b_next!31465))
