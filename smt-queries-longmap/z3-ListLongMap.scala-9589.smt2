; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113396 () Bool)

(assert start!113396)

(declare-fun b_free!31447 () Bool)

(declare-fun b_next!31447 () Bool)

(assert (=> start!113396 (= b_free!31447 (not b_next!31447))))

(declare-fun tp!110146 () Bool)

(declare-fun b_and!50717 () Bool)

(assert (=> start!113396 (= tp!110146 b_and!50717)))

(declare-fun b!1346036 () Bool)

(declare-fun res!893188 () Bool)

(declare-fun e!765881 () Bool)

(assert (=> b!1346036 (=> (not res!893188) (not e!765881))))

(declare-datatypes ((array!91673 0))(
  ( (array!91674 (arr!44293 (Array (_ BitVec 32) (_ BitVec 64))) (size!44845 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91673)

(declare-datatypes ((List!31437 0))(
  ( (Nil!31434) (Cons!31433 (h!32642 (_ BitVec 64)) (t!46019 List!31437)) )
))
(declare-fun arrayNoDuplicates!0 (array!91673 (_ BitVec 32) List!31437) Bool)

(assert (=> b!1346036 (= res!893188 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31434))))

(declare-fun b!1346037 () Bool)

(assert (=> b!1346037 (= e!765881 false)))

(declare-datatypes ((V!55033 0))(
  ( (V!55034 (val!18798 Int)) )
))
(declare-fun minValue!1245 () V!55033)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55033)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17825 0))(
  ( (ValueCellFull!17825 (v!21445 V!55033)) (EmptyCell!17825) )
))
(declare-datatypes ((array!91675 0))(
  ( (array!91676 (arr!44294 (Array (_ BitVec 32) ValueCell!17825)) (size!44846 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91675)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun lt!595287 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((tuple2!24302 0))(
  ( (tuple2!24303 (_1!12162 (_ BitVec 64)) (_2!12162 V!55033)) )
))
(declare-datatypes ((List!31438 0))(
  ( (Nil!31435) (Cons!31434 (h!32643 tuple2!24302) (t!46020 List!31438)) )
))
(declare-datatypes ((ListLongMap!21959 0))(
  ( (ListLongMap!21960 (toList!10995 List!31438)) )
))
(declare-fun contains!9100 (ListLongMap!21959 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5834 (array!91673 array!91675 (_ BitVec 32) (_ BitVec 32) V!55033 V!55033 (_ BitVec 32) Int) ListLongMap!21959)

(assert (=> b!1346037 (= lt!595287 (contains!9100 (getCurrentListMap!5834 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346038 () Bool)

(declare-fun res!893187 () Bool)

(assert (=> b!1346038 (=> (not res!893187) (not e!765881))))

(assert (=> b!1346038 (= res!893187 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44845 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346039 () Bool)

(declare-fun e!765880 () Bool)

(declare-fun tp_is_empty!37447 () Bool)

(assert (=> b!1346039 (= e!765880 tp_is_empty!37447)))

(declare-fun res!893189 () Bool)

(assert (=> start!113396 (=> (not res!893189) (not e!765881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113396 (= res!893189 (validMask!0 mask!1977))))

(assert (=> start!113396 e!765881))

(assert (=> start!113396 tp_is_empty!37447))

(assert (=> start!113396 true))

(declare-fun array_inv!33571 (array!91673) Bool)

(assert (=> start!113396 (array_inv!33571 _keys!1571)))

(declare-fun e!765879 () Bool)

(declare-fun array_inv!33572 (array!91675) Bool)

(assert (=> start!113396 (and (array_inv!33572 _values!1303) e!765879)))

(assert (=> start!113396 tp!110146))

(declare-fun b!1346040 () Bool)

(declare-fun e!765878 () Bool)

(declare-fun mapRes!57877 () Bool)

(assert (=> b!1346040 (= e!765879 (and e!765878 mapRes!57877))))

(declare-fun condMapEmpty!57877 () Bool)

(declare-fun mapDefault!57877 () ValueCell!17825)

(assert (=> b!1346040 (= condMapEmpty!57877 (= (arr!44294 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17825)) mapDefault!57877)))))

(declare-fun b!1346041 () Bool)

(declare-fun res!893190 () Bool)

(assert (=> b!1346041 (=> (not res!893190) (not e!765881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91673 (_ BitVec 32)) Bool)

(assert (=> b!1346041 (= res!893190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57877 () Bool)

(declare-fun tp!110147 () Bool)

(assert (=> mapNonEmpty!57877 (= mapRes!57877 (and tp!110147 e!765880))))

(declare-fun mapValue!57877 () ValueCell!17825)

(declare-fun mapKey!57877 () (_ BitVec 32))

(declare-fun mapRest!57877 () (Array (_ BitVec 32) ValueCell!17825))

(assert (=> mapNonEmpty!57877 (= (arr!44294 _values!1303) (store mapRest!57877 mapKey!57877 mapValue!57877))))

(declare-fun b!1346042 () Bool)

(declare-fun res!893191 () Bool)

(assert (=> b!1346042 (=> (not res!893191) (not e!765881))))

(assert (=> b!1346042 (= res!893191 (and (= (size!44846 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44845 _keys!1571) (size!44846 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346043 () Bool)

(assert (=> b!1346043 (= e!765878 tp_is_empty!37447)))

(declare-fun mapIsEmpty!57877 () Bool)

(assert (=> mapIsEmpty!57877 mapRes!57877))

(assert (= (and start!113396 res!893189) b!1346042))

(assert (= (and b!1346042 res!893191) b!1346041))

(assert (= (and b!1346041 res!893190) b!1346036))

(assert (= (and b!1346036 res!893188) b!1346038))

(assert (= (and b!1346038 res!893187) b!1346037))

(assert (= (and b!1346040 condMapEmpty!57877) mapIsEmpty!57877))

(assert (= (and b!1346040 (not condMapEmpty!57877)) mapNonEmpty!57877))

(get-info :version)

(assert (= (and mapNonEmpty!57877 ((_ is ValueCellFull!17825) mapValue!57877)) b!1346039))

(assert (= (and b!1346040 ((_ is ValueCellFull!17825) mapDefault!57877)) b!1346043))

(assert (= start!113396 b!1346040))

(declare-fun m!1232851 () Bool)

(assert (=> mapNonEmpty!57877 m!1232851))

(declare-fun m!1232853 () Bool)

(assert (=> b!1346041 m!1232853))

(declare-fun m!1232855 () Bool)

(assert (=> start!113396 m!1232855))

(declare-fun m!1232857 () Bool)

(assert (=> start!113396 m!1232857))

(declare-fun m!1232859 () Bool)

(assert (=> start!113396 m!1232859))

(declare-fun m!1232861 () Bool)

(assert (=> b!1346037 m!1232861))

(assert (=> b!1346037 m!1232861))

(declare-fun m!1232863 () Bool)

(assert (=> b!1346037 m!1232863))

(declare-fun m!1232865 () Bool)

(assert (=> b!1346036 m!1232865))

(check-sat (not b!1346037) (not b!1346041) (not b_next!31447) (not mapNonEmpty!57877) b_and!50717 (not start!113396) tp_is_empty!37447 (not b!1346036))
(check-sat b_and!50717 (not b_next!31447))
