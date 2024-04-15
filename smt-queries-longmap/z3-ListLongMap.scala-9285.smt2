; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111058 () Bool)

(assert start!111058)

(declare-fun b_free!29893 () Bool)

(declare-fun b_next!29893 () Bool)

(assert (=> start!111058 (= b_free!29893 (not b_next!29893))))

(declare-fun tp!105002 () Bool)

(declare-fun b_and!48083 () Bool)

(assert (=> start!111058 (= tp!105002 b_and!48083)))

(declare-fun b!1314820 () Bool)

(declare-fun res!872887 () Bool)

(declare-fun e!750026 () Bool)

(assert (=> b!1314820 (=> (not res!872887) (not e!750026))))

(declare-datatypes ((array!88119 0))(
  ( (array!88120 (arr!42540 (Array (_ BitVec 32) (_ BitVec 64))) (size!43092 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88119)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88119 (_ BitVec 32)) Bool)

(assert (=> b!1314820 (= res!872887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!55063 () Bool)

(declare-fun mapRes!55063 () Bool)

(declare-fun tp!105001 () Bool)

(declare-fun e!750028 () Bool)

(assert (=> mapNonEmpty!55063 (= mapRes!55063 (and tp!105001 e!750028))))

(declare-fun mapKey!55063 () (_ BitVec 32))

(declare-datatypes ((V!52601 0))(
  ( (V!52602 (val!17886 Int)) )
))
(declare-datatypes ((ValueCell!16913 0))(
  ( (ValueCellFull!16913 (v!20512 V!52601)) (EmptyCell!16913) )
))
(declare-fun mapRest!55063 () (Array (_ BitVec 32) ValueCell!16913))

(declare-fun mapValue!55063 () ValueCell!16913)

(declare-datatypes ((array!88121 0))(
  ( (array!88122 (arr!42541 (Array (_ BitVec 32) ValueCell!16913)) (size!43093 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88121)

(assert (=> mapNonEmpty!55063 (= (arr!42541 _values!1354) (store mapRest!55063 mapKey!55063 mapValue!55063))))

(declare-fun b!1314821 () Bool)

(declare-fun tp_is_empty!35623 () Bool)

(assert (=> b!1314821 (= e!750028 tp_is_empty!35623)))

(declare-fun b!1314822 () Bool)

(declare-fun e!750029 () Bool)

(assert (=> b!1314822 (= e!750029 tp_is_empty!35623)))

(declare-fun mapIsEmpty!55063 () Bool)

(assert (=> mapIsEmpty!55063 mapRes!55063))

(declare-fun b!1314823 () Bool)

(declare-fun res!872890 () Bool)

(assert (=> b!1314823 (=> (not res!872890) (not e!750026))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314823 (= res!872890 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43092 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314824 () Bool)

(declare-fun res!872888 () Bool)

(assert (=> b!1314824 (=> (not res!872888) (not e!750026))))

(declare-datatypes ((List!30270 0))(
  ( (Nil!30267) (Cons!30266 (h!31475 (_ BitVec 64)) (t!43868 List!30270)) )
))
(declare-fun arrayNoDuplicates!0 (array!88119 (_ BitVec 32) List!30270) Bool)

(assert (=> b!1314824 (= res!872888 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30267))))

(declare-fun res!872886 () Bool)

(assert (=> start!111058 (=> (not res!872886) (not e!750026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111058 (= res!872886 (validMask!0 mask!2040))))

(assert (=> start!111058 e!750026))

(assert (=> start!111058 tp!105002))

(declare-fun array_inv!32317 (array!88119) Bool)

(assert (=> start!111058 (array_inv!32317 _keys!1628)))

(assert (=> start!111058 true))

(assert (=> start!111058 tp_is_empty!35623))

(declare-fun e!750025 () Bool)

(declare-fun array_inv!32318 (array!88121) Bool)

(assert (=> start!111058 (and (array_inv!32318 _values!1354) e!750025)))

(declare-fun b!1314825 () Bool)

(assert (=> b!1314825 (= e!750026 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun zeroValue!1296 () V!52601)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585663 () Bool)

(declare-fun minValue!1296 () V!52601)

(declare-datatypes ((tuple2!23156 0))(
  ( (tuple2!23157 (_1!11589 (_ BitVec 64)) (_2!11589 V!52601)) )
))
(declare-datatypes ((List!30271 0))(
  ( (Nil!30268) (Cons!30267 (h!31476 tuple2!23156) (t!43869 List!30271)) )
))
(declare-datatypes ((ListLongMap!20813 0))(
  ( (ListLongMap!20814 (toList!10422 List!30271)) )
))
(declare-fun contains!8499 (ListLongMap!20813 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5317 (array!88119 array!88121 (_ BitVec 32) (_ BitVec 32) V!52601 V!52601 (_ BitVec 32) Int) ListLongMap!20813)

(assert (=> b!1314825 (= lt!585663 (contains!8499 (getCurrentListMap!5317 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314826 () Bool)

(assert (=> b!1314826 (= e!750025 (and e!750029 mapRes!55063))))

(declare-fun condMapEmpty!55063 () Bool)

(declare-fun mapDefault!55063 () ValueCell!16913)

(assert (=> b!1314826 (= condMapEmpty!55063 (= (arr!42541 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16913)) mapDefault!55063)))))

(declare-fun b!1314827 () Bool)

(declare-fun res!872889 () Bool)

(assert (=> b!1314827 (=> (not res!872889) (not e!750026))))

(assert (=> b!1314827 (= res!872889 (and (= (size!43093 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43092 _keys!1628) (size!43093 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!111058 res!872886) b!1314827))

(assert (= (and b!1314827 res!872889) b!1314820))

(assert (= (and b!1314820 res!872887) b!1314824))

(assert (= (and b!1314824 res!872888) b!1314823))

(assert (= (and b!1314823 res!872890) b!1314825))

(assert (= (and b!1314826 condMapEmpty!55063) mapIsEmpty!55063))

(assert (= (and b!1314826 (not condMapEmpty!55063)) mapNonEmpty!55063))

(get-info :version)

(assert (= (and mapNonEmpty!55063 ((_ is ValueCellFull!16913) mapValue!55063)) b!1314821))

(assert (= (and b!1314826 ((_ is ValueCellFull!16913) mapDefault!55063)) b!1314822))

(assert (= start!111058 b!1314826))

(declare-fun m!1202745 () Bool)

(assert (=> b!1314824 m!1202745))

(declare-fun m!1202747 () Bool)

(assert (=> b!1314820 m!1202747))

(declare-fun m!1202749 () Bool)

(assert (=> start!111058 m!1202749))

(declare-fun m!1202751 () Bool)

(assert (=> start!111058 m!1202751))

(declare-fun m!1202753 () Bool)

(assert (=> start!111058 m!1202753))

(declare-fun m!1202755 () Bool)

(assert (=> mapNonEmpty!55063 m!1202755))

(declare-fun m!1202757 () Bool)

(assert (=> b!1314825 m!1202757))

(assert (=> b!1314825 m!1202757))

(declare-fun m!1202759 () Bool)

(assert (=> b!1314825 m!1202759))

(check-sat (not b!1314824) (not b!1314825) (not b_next!29893) tp_is_empty!35623 (not mapNonEmpty!55063) b_and!48083 (not start!111058) (not b!1314820))
(check-sat b_and!48083 (not b_next!29893))
