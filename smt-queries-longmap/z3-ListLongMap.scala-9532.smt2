; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113056 () Bool)

(assert start!113056)

(declare-fun b_free!31107 () Bool)

(declare-fun b_next!31107 () Bool)

(assert (=> start!113056 (= b_free!31107 (not b_next!31107))))

(declare-fun tp!109125 () Bool)

(declare-fun b_and!50137 () Bool)

(assert (=> start!113056 (= tp!109125 b_and!50137)))

(declare-fun b!1340004 () Bool)

(declare-fun e!763279 () Bool)

(declare-fun tp_is_empty!37107 () Bool)

(assert (=> b!1340004 (= e!763279 tp_is_empty!37107)))

(declare-fun b!1340005 () Bool)

(declare-fun e!763280 () Bool)

(declare-fun mapRes!57367 () Bool)

(assert (=> b!1340005 (= e!763280 (and e!763279 mapRes!57367))))

(declare-fun condMapEmpty!57367 () Bool)

(declare-datatypes ((V!54579 0))(
  ( (V!54580 (val!18628 Int)) )
))
(declare-datatypes ((ValueCell!17655 0))(
  ( (ValueCellFull!17655 (v!21276 V!54579)) (EmptyCell!17655) )
))
(declare-datatypes ((array!91068 0))(
  ( (array!91069 (arr!43990 (Array (_ BitVec 32) ValueCell!17655)) (size!44540 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91068)

(declare-fun mapDefault!57367 () ValueCell!17655)

(assert (=> b!1340005 (= condMapEmpty!57367 (= (arr!43990 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17655)) mapDefault!57367)))))

(declare-fun b!1340006 () Bool)

(declare-fun e!763282 () Bool)

(assert (=> b!1340006 (= e!763282 tp_is_empty!37107)))

(declare-fun b!1340007 () Bool)

(declare-fun res!888905 () Bool)

(declare-fun e!763281 () Bool)

(assert (=> b!1340007 (=> (not res!888905) (not e!763281))))

(declare-datatypes ((array!91070 0))(
  ( (array!91071 (arr!43991 (Array (_ BitVec 32) (_ BitVec 64))) (size!44541 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91070)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91070 (_ BitVec 32)) Bool)

(assert (=> b!1340007 (= res!888905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340008 () Bool)

(declare-fun res!888906 () Bool)

(assert (=> b!1340008 (=> (not res!888906) (not e!763281))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340008 (= res!888906 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44541 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340009 () Bool)

(declare-fun res!888902 () Bool)

(assert (=> b!1340009 (=> (not res!888902) (not e!763281))))

(declare-datatypes ((List!31137 0))(
  ( (Nil!31134) (Cons!31133 (h!32342 (_ BitVec 64)) (t!45469 List!31137)) )
))
(declare-fun arrayNoDuplicates!0 (array!91070 (_ BitVec 32) List!31137) Bool)

(assert (=> b!1340009 (= res!888902 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31134))))

(declare-fun mapIsEmpty!57367 () Bool)

(assert (=> mapIsEmpty!57367 mapRes!57367))

(declare-fun res!888904 () Bool)

(assert (=> start!113056 (=> (not res!888904) (not e!763281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113056 (= res!888904 (validMask!0 mask!1977))))

(assert (=> start!113056 e!763281))

(assert (=> start!113056 tp_is_empty!37107))

(assert (=> start!113056 true))

(declare-fun array_inv!33169 (array!91070) Bool)

(assert (=> start!113056 (array_inv!33169 _keys!1571)))

(declare-fun array_inv!33170 (array!91068) Bool)

(assert (=> start!113056 (and (array_inv!33170 _values!1303) e!763280)))

(assert (=> start!113056 tp!109125))

(declare-fun b!1340010 () Bool)

(declare-fun res!888903 () Bool)

(assert (=> b!1340010 (=> (not res!888903) (not e!763281))))

(assert (=> b!1340010 (= res!888903 (and (= (size!44540 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44541 _keys!1571) (size!44540 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57367 () Bool)

(declare-fun tp!109126 () Bool)

(assert (=> mapNonEmpty!57367 (= mapRes!57367 (and tp!109126 e!763282))))

(declare-fun mapRest!57367 () (Array (_ BitVec 32) ValueCell!17655))

(declare-fun mapValue!57367 () ValueCell!17655)

(declare-fun mapKey!57367 () (_ BitVec 32))

(assert (=> mapNonEmpty!57367 (= (arr!43990 _values!1303) (store mapRest!57367 mapKey!57367 mapValue!57367))))

(declare-fun b!1340011 () Bool)

(assert (=> b!1340011 (= e!763281 false)))

(declare-fun minValue!1245 () V!54579)

(declare-fun lt!593955 () Bool)

(declare-fun zeroValue!1245 () V!54579)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!23970 0))(
  ( (tuple2!23971 (_1!11996 (_ BitVec 64)) (_2!11996 V!54579)) )
))
(declare-datatypes ((List!31138 0))(
  ( (Nil!31135) (Cons!31134 (h!32343 tuple2!23970) (t!45470 List!31138)) )
))
(declare-datatypes ((ListLongMap!21627 0))(
  ( (ListLongMap!21628 (toList!10829 List!31138)) )
))
(declare-fun contains!9005 (ListLongMap!21627 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5798 (array!91070 array!91068 (_ BitVec 32) (_ BitVec 32) V!54579 V!54579 (_ BitVec 32) Int) ListLongMap!21627)

(assert (=> b!1340011 (= lt!593955 (contains!9005 (getCurrentListMap!5798 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113056 res!888904) b!1340010))

(assert (= (and b!1340010 res!888903) b!1340007))

(assert (= (and b!1340007 res!888905) b!1340009))

(assert (= (and b!1340009 res!888902) b!1340008))

(assert (= (and b!1340008 res!888906) b!1340011))

(assert (= (and b!1340005 condMapEmpty!57367) mapIsEmpty!57367))

(assert (= (and b!1340005 (not condMapEmpty!57367)) mapNonEmpty!57367))

(get-info :version)

(assert (= (and mapNonEmpty!57367 ((_ is ValueCellFull!17655) mapValue!57367)) b!1340006))

(assert (= (and b!1340005 ((_ is ValueCellFull!17655) mapDefault!57367)) b!1340004))

(assert (= start!113056 b!1340005))

(declare-fun m!1227869 () Bool)

(assert (=> b!1340011 m!1227869))

(assert (=> b!1340011 m!1227869))

(declare-fun m!1227871 () Bool)

(assert (=> b!1340011 m!1227871))

(declare-fun m!1227873 () Bool)

(assert (=> mapNonEmpty!57367 m!1227873))

(declare-fun m!1227875 () Bool)

(assert (=> b!1340007 m!1227875))

(declare-fun m!1227877 () Bool)

(assert (=> b!1340009 m!1227877))

(declare-fun m!1227879 () Bool)

(assert (=> start!113056 m!1227879))

(declare-fun m!1227881 () Bool)

(assert (=> start!113056 m!1227881))

(declare-fun m!1227883 () Bool)

(assert (=> start!113056 m!1227883))

(check-sat tp_is_empty!37107 b_and!50137 (not b!1340007) (not b!1340011) (not start!113056) (not mapNonEmpty!57367) (not b_next!31107) (not b!1340009))
(check-sat b_and!50137 (not b_next!31107))
