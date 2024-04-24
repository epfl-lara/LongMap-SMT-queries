; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113650 () Bool)

(assert start!113650)

(declare-fun b_free!31477 () Bool)

(declare-fun b_next!31477 () Bool)

(assert (=> start!113650 (= b_free!31477 (not b_next!31477))))

(declare-fun tp!110236 () Bool)

(declare-fun b_and!50767 () Bool)

(assert (=> start!113650 (= tp!110236 b_and!50767)))

(declare-fun b!1347765 () Bool)

(declare-fun res!893959 () Bool)

(declare-fun e!766978 () Bool)

(assert (=> b!1347765 (=> (not res!893959) (not e!766978))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91897 0))(
  ( (array!91898 (arr!44400 (Array (_ BitVec 32) (_ BitVec 64))) (size!44951 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91897)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1347765 (= res!893959 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44951 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347766 () Bool)

(declare-fun e!766979 () Bool)

(declare-fun e!766980 () Bool)

(declare-fun mapRes!57922 () Bool)

(assert (=> b!1347766 (= e!766979 (and e!766980 mapRes!57922))))

(declare-fun condMapEmpty!57922 () Bool)

(declare-datatypes ((V!55073 0))(
  ( (V!55074 (val!18813 Int)) )
))
(declare-datatypes ((ValueCell!17840 0))(
  ( (ValueCellFull!17840 (v!21456 V!55073)) (EmptyCell!17840) )
))
(declare-datatypes ((array!91899 0))(
  ( (array!91900 (arr!44401 (Array (_ BitVec 32) ValueCell!17840)) (size!44952 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91899)

(declare-fun mapDefault!57922 () ValueCell!17840)

(assert (=> b!1347766 (= condMapEmpty!57922 (= (arr!44401 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17840)) mapDefault!57922)))))

(declare-fun b!1347767 () Bool)

(declare-fun res!893960 () Bool)

(assert (=> b!1347767 (=> (not res!893960) (not e!766978))))

(declare-fun mask!1977 () (_ BitVec 32))

(assert (=> b!1347767 (= res!893960 (and (= (size!44952 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44951 _keys!1571) (size!44952 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347768 () Bool)

(declare-fun res!893961 () Bool)

(assert (=> b!1347768 (=> (not res!893961) (not e!766978))))

(declare-datatypes ((List!31436 0))(
  ( (Nil!31433) (Cons!31432 (h!32650 (_ BitVec 64)) (t!46018 List!31436)) )
))
(declare-fun arrayNoDuplicates!0 (array!91897 (_ BitVec 32) List!31436) Bool)

(assert (=> b!1347768 (= res!893961 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31433))))

(declare-fun b!1347769 () Bool)

(declare-fun res!893962 () Bool)

(assert (=> b!1347769 (=> (not res!893962) (not e!766978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91897 (_ BitVec 32)) Bool)

(assert (=> b!1347769 (= res!893962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347770 () Bool)

(declare-fun e!766982 () Bool)

(declare-fun tp_is_empty!37477 () Bool)

(assert (=> b!1347770 (= e!766982 tp_is_empty!37477)))

(declare-fun b!1347771 () Bool)

(assert (=> b!1347771 (= e!766980 tp_is_empty!37477)))

(declare-fun mapNonEmpty!57922 () Bool)

(declare-fun tp!110235 () Bool)

(assert (=> mapNonEmpty!57922 (= mapRes!57922 (and tp!110235 e!766982))))

(declare-fun mapRest!57922 () (Array (_ BitVec 32) ValueCell!17840))

(declare-fun mapKey!57922 () (_ BitVec 32))

(declare-fun mapValue!57922 () ValueCell!17840)

(assert (=> mapNonEmpty!57922 (= (arr!44401 _values!1303) (store mapRest!57922 mapKey!57922 mapValue!57922))))

(declare-fun mapIsEmpty!57922 () Bool)

(assert (=> mapIsEmpty!57922 mapRes!57922))

(declare-fun res!893963 () Bool)

(assert (=> start!113650 (=> (not res!893963) (not e!766978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113650 (= res!893963 (validMask!0 mask!1977))))

(assert (=> start!113650 e!766978))

(assert (=> start!113650 tp_is_empty!37477))

(assert (=> start!113650 true))

(declare-fun array_inv!33715 (array!91897) Bool)

(assert (=> start!113650 (array_inv!33715 _keys!1571)))

(declare-fun array_inv!33716 (array!91899) Bool)

(assert (=> start!113650 (and (array_inv!33716 _values!1303) e!766979)))

(assert (=> start!113650 tp!110236))

(declare-fun b!1347772 () Bool)

(assert (=> b!1347772 (= e!766978 false)))

(declare-fun minValue!1245 () V!55073)

(declare-fun lt!595994 () Bool)

(declare-fun zeroValue!1245 () V!55073)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24296 0))(
  ( (tuple2!24297 (_1!12159 (_ BitVec 64)) (_2!12159 V!55073)) )
))
(declare-datatypes ((List!31437 0))(
  ( (Nil!31434) (Cons!31433 (h!32651 tuple2!24296) (t!46019 List!31437)) )
))
(declare-datatypes ((ListLongMap!21961 0))(
  ( (ListLongMap!21962 (toList!10996 List!31437)) )
))
(declare-fun contains!9184 (ListLongMap!21961 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5936 (array!91897 array!91899 (_ BitVec 32) (_ BitVec 32) V!55073 V!55073 (_ BitVec 32) Int) ListLongMap!21961)

(assert (=> b!1347772 (= lt!595994 (contains!9184 (getCurrentListMap!5936 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113650 res!893963) b!1347767))

(assert (= (and b!1347767 res!893960) b!1347769))

(assert (= (and b!1347769 res!893962) b!1347768))

(assert (= (and b!1347768 res!893961) b!1347765))

(assert (= (and b!1347765 res!893959) b!1347772))

(assert (= (and b!1347766 condMapEmpty!57922) mapIsEmpty!57922))

(assert (= (and b!1347766 (not condMapEmpty!57922)) mapNonEmpty!57922))

(get-info :version)

(assert (= (and mapNonEmpty!57922 ((_ is ValueCellFull!17840) mapValue!57922)) b!1347770))

(assert (= (and b!1347766 ((_ is ValueCellFull!17840) mapDefault!57922)) b!1347771))

(assert (= start!113650 b!1347766))

(declare-fun m!1235205 () Bool)

(assert (=> b!1347769 m!1235205))

(declare-fun m!1235207 () Bool)

(assert (=> mapNonEmpty!57922 m!1235207))

(declare-fun m!1235209 () Bool)

(assert (=> start!113650 m!1235209))

(declare-fun m!1235211 () Bool)

(assert (=> start!113650 m!1235211))

(declare-fun m!1235213 () Bool)

(assert (=> start!113650 m!1235213))

(declare-fun m!1235215 () Bool)

(assert (=> b!1347768 m!1235215))

(declare-fun m!1235217 () Bool)

(assert (=> b!1347772 m!1235217))

(assert (=> b!1347772 m!1235217))

(declare-fun m!1235219 () Bool)

(assert (=> b!1347772 m!1235219))

(check-sat (not b_next!31477) (not start!113650) (not b!1347768) (not b!1347772) (not mapNonEmpty!57922) b_and!50767 tp_is_empty!37477 (not b!1347769))
(check-sat b_and!50767 (not b_next!31477))
