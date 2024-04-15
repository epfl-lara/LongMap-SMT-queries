; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113060 () Bool)

(assert start!113060)

(declare-fun b_free!31111 () Bool)

(declare-fun b_next!31111 () Bool)

(assert (=> start!113060 (= b_free!31111 (not b_next!31111))))

(declare-fun tp!109139 () Bool)

(declare-fun b_and!50123 () Bool)

(assert (=> start!113060 (= tp!109139 b_and!50123)))

(declare-fun b!1339982 () Bool)

(declare-fun res!888903 () Bool)

(declare-fun e!763276 () Bool)

(assert (=> b!1339982 (=> (not res!888903) (not e!763276))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91021 0))(
  ( (array!91022 (arr!43967 (Array (_ BitVec 32) (_ BitVec 64))) (size!44519 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91021)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54585 0))(
  ( (V!54586 (val!18630 Int)) )
))
(declare-datatypes ((ValueCell!17657 0))(
  ( (ValueCellFull!17657 (v!21277 V!54585)) (EmptyCell!17657) )
))
(declare-datatypes ((array!91023 0))(
  ( (array!91024 (arr!43968 (Array (_ BitVec 32) ValueCell!17657)) (size!44520 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91023)

(assert (=> b!1339982 (= res!888903 (and (= (size!44520 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44519 _keys!1571) (size!44520 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57373 () Bool)

(declare-fun mapRes!57373 () Bool)

(declare-fun tp!109138 () Bool)

(declare-fun e!763280 () Bool)

(assert (=> mapNonEmpty!57373 (= mapRes!57373 (and tp!109138 e!763280))))

(declare-fun mapKey!57373 () (_ BitVec 32))

(declare-fun mapRest!57373 () (Array (_ BitVec 32) ValueCell!17657))

(declare-fun mapValue!57373 () ValueCell!17657)

(assert (=> mapNonEmpty!57373 (= (arr!43968 _values!1303) (store mapRest!57373 mapKey!57373 mapValue!57373))))

(declare-fun mapIsEmpty!57373 () Bool)

(assert (=> mapIsEmpty!57373 mapRes!57373))

(declare-fun res!888907 () Bool)

(assert (=> start!113060 (=> (not res!888907) (not e!763276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113060 (= res!888907 (validMask!0 mask!1977))))

(assert (=> start!113060 e!763276))

(declare-fun tp_is_empty!37111 () Bool)

(assert (=> start!113060 tp_is_empty!37111))

(assert (=> start!113060 true))

(declare-fun array_inv!33345 (array!91021) Bool)

(assert (=> start!113060 (array_inv!33345 _keys!1571)))

(declare-fun e!763279 () Bool)

(declare-fun array_inv!33346 (array!91023) Bool)

(assert (=> start!113060 (and (array_inv!33346 _values!1303) e!763279)))

(assert (=> start!113060 tp!109139))

(declare-fun b!1339983 () Bool)

(declare-fun res!888905 () Bool)

(assert (=> b!1339983 (=> (not res!888905) (not e!763276))))

(declare-datatypes ((List!31188 0))(
  ( (Nil!31185) (Cons!31184 (h!32393 (_ BitVec 64)) (t!45512 List!31188)) )
))
(declare-fun arrayNoDuplicates!0 (array!91021 (_ BitVec 32) List!31188) Bool)

(assert (=> b!1339983 (= res!888905 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31185))))

(declare-fun b!1339984 () Bool)

(assert (=> b!1339984 (= e!763276 false)))

(declare-fun minValue!1245 () V!54585)

(declare-fun zeroValue!1245 () V!54585)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lt!593775 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24038 0))(
  ( (tuple2!24039 (_1!12030 (_ BitVec 64)) (_2!12030 V!54585)) )
))
(declare-datatypes ((List!31189 0))(
  ( (Nil!31186) (Cons!31185 (h!32394 tuple2!24038) (t!45513 List!31189)) )
))
(declare-datatypes ((ListLongMap!21695 0))(
  ( (ListLongMap!21696 (toList!10863 List!31189)) )
))
(declare-fun contains!8968 (ListLongMap!21695 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5716 (array!91021 array!91023 (_ BitVec 32) (_ BitVec 32) V!54585 V!54585 (_ BitVec 32) Int) ListLongMap!21695)

(assert (=> b!1339984 (= lt!593775 (contains!8968 (getCurrentListMap!5716 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1339985 () Bool)

(declare-fun res!888906 () Bool)

(assert (=> b!1339985 (=> (not res!888906) (not e!763276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91021 (_ BitVec 32)) Bool)

(assert (=> b!1339985 (= res!888906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339986 () Bool)

(declare-fun e!763277 () Bool)

(assert (=> b!1339986 (= e!763279 (and e!763277 mapRes!57373))))

(declare-fun condMapEmpty!57373 () Bool)

(declare-fun mapDefault!57373 () ValueCell!17657)

(assert (=> b!1339986 (= condMapEmpty!57373 (= (arr!43968 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17657)) mapDefault!57373)))))

(declare-fun b!1339987 () Bool)

(assert (=> b!1339987 (= e!763280 tp_is_empty!37111)))

(declare-fun b!1339988 () Bool)

(assert (=> b!1339988 (= e!763277 tp_is_empty!37111)))

(declare-fun b!1339989 () Bool)

(declare-fun res!888904 () Bool)

(assert (=> b!1339989 (=> (not res!888904) (not e!763276))))

(assert (=> b!1339989 (= res!888904 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44519 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113060 res!888907) b!1339982))

(assert (= (and b!1339982 res!888903) b!1339985))

(assert (= (and b!1339985 res!888906) b!1339983))

(assert (= (and b!1339983 res!888905) b!1339989))

(assert (= (and b!1339989 res!888904) b!1339984))

(assert (= (and b!1339986 condMapEmpty!57373) mapIsEmpty!57373))

(assert (= (and b!1339986 (not condMapEmpty!57373)) mapNonEmpty!57373))

(get-info :version)

(assert (= (and mapNonEmpty!57373 ((_ is ValueCellFull!17657) mapValue!57373)) b!1339987))

(assert (= (and b!1339986 ((_ is ValueCellFull!17657) mapDefault!57373)) b!1339988))

(assert (= start!113060 b!1339986))

(declare-fun m!1227385 () Bool)

(assert (=> start!113060 m!1227385))

(declare-fun m!1227387 () Bool)

(assert (=> start!113060 m!1227387))

(declare-fun m!1227389 () Bool)

(assert (=> start!113060 m!1227389))

(declare-fun m!1227391 () Bool)

(assert (=> b!1339985 m!1227391))

(declare-fun m!1227393 () Bool)

(assert (=> b!1339984 m!1227393))

(assert (=> b!1339984 m!1227393))

(declare-fun m!1227395 () Bool)

(assert (=> b!1339984 m!1227395))

(declare-fun m!1227397 () Bool)

(assert (=> b!1339983 m!1227397))

(declare-fun m!1227399 () Bool)

(assert (=> mapNonEmpty!57373 m!1227399))

(check-sat (not b!1339984) (not b!1339983) tp_is_empty!37111 (not start!113060) (not b_next!31111) (not mapNonEmpty!57373) (not b!1339985) b_and!50123)
(check-sat b_and!50123 (not b_next!31111))
