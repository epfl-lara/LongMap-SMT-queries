; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111030 () Bool)

(assert start!111030)

(declare-fun b_free!29865 () Bool)

(declare-fun b_next!29865 () Bool)

(assert (=> start!111030 (= b_free!29865 (not b_next!29865))))

(declare-fun tp!104916 () Bool)

(declare-fun b_and!48073 () Bool)

(assert (=> start!111030 (= tp!104916 b_and!48073)))

(declare-fun b!1314554 () Bool)

(declare-fun e!749848 () Bool)

(declare-fun tp_is_empty!35595 () Bool)

(assert (=> b!1314554 (= e!749848 tp_is_empty!35595)))

(declare-fun b!1314555 () Bool)

(declare-fun res!872708 () Bool)

(declare-fun e!749850 () Bool)

(assert (=> b!1314555 (=> (not res!872708) (not e!749850))))

(declare-datatypes ((array!88158 0))(
  ( (array!88159 (arr!42559 (Array (_ BitVec 32) (_ BitVec 64))) (size!43109 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88158)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1314555 (= res!872708 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43109 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314556 () Bool)

(declare-fun res!872705 () Bool)

(assert (=> b!1314556 (=> (not res!872705) (not e!749850))))

(declare-datatypes ((List!30183 0))(
  ( (Nil!30180) (Cons!30179 (h!31388 (_ BitVec 64)) (t!43789 List!30183)) )
))
(declare-fun arrayNoDuplicates!0 (array!88158 (_ BitVec 32) List!30183) Bool)

(assert (=> b!1314556 (= res!872705 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30180))))

(declare-fun b!1314557 () Bool)

(declare-fun e!749849 () Bool)

(declare-fun e!749851 () Bool)

(declare-fun mapRes!55021 () Bool)

(assert (=> b!1314557 (= e!749849 (and e!749851 mapRes!55021))))

(declare-fun condMapEmpty!55021 () Bool)

(declare-datatypes ((V!52563 0))(
  ( (V!52564 (val!17872 Int)) )
))
(declare-datatypes ((ValueCell!16899 0))(
  ( (ValueCellFull!16899 (v!20499 V!52563)) (EmptyCell!16899) )
))
(declare-datatypes ((array!88160 0))(
  ( (array!88161 (arr!42560 (Array (_ BitVec 32) ValueCell!16899)) (size!43110 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88160)

(declare-fun mapDefault!55021 () ValueCell!16899)

(assert (=> b!1314557 (= condMapEmpty!55021 (= (arr!42560 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16899)) mapDefault!55021)))))

(declare-fun b!1314558 () Bool)

(assert (=> b!1314558 (= e!749851 tp_is_empty!35595)))

(declare-fun b!1314559 () Bool)

(declare-fun res!872709 () Bool)

(assert (=> b!1314559 (=> (not res!872709) (not e!749850))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314559 (= res!872709 (and (= (size!43110 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43109 _keys!1628) (size!43110 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314560 () Bool)

(declare-fun res!872706 () Bool)

(assert (=> b!1314560 (=> (not res!872706) (not e!749850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88158 (_ BitVec 32)) Bool)

(assert (=> b!1314560 (= res!872706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314561 () Bool)

(assert (=> b!1314561 (= e!749850 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585807 () Bool)

(declare-fun minValue!1296 () V!52563)

(declare-fun zeroValue!1296 () V!52563)

(declare-datatypes ((tuple2!23046 0))(
  ( (tuple2!23047 (_1!11534 (_ BitVec 64)) (_2!11534 V!52563)) )
))
(declare-datatypes ((List!30184 0))(
  ( (Nil!30181) (Cons!30180 (h!31389 tuple2!23046) (t!43790 List!30184)) )
))
(declare-datatypes ((ListLongMap!20703 0))(
  ( (ListLongMap!20704 (toList!10367 List!30184)) )
))
(declare-fun contains!8517 (ListLongMap!20703 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5380 (array!88158 array!88160 (_ BitVec 32) (_ BitVec 32) V!52563 V!52563 (_ BitVec 32) Int) ListLongMap!20703)

(assert (=> b!1314561 (= lt!585807 (contains!8517 (getCurrentListMap!5380 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!55021 () Bool)

(assert (=> mapIsEmpty!55021 mapRes!55021))

(declare-fun mapNonEmpty!55021 () Bool)

(declare-fun tp!104917 () Bool)

(assert (=> mapNonEmpty!55021 (= mapRes!55021 (and tp!104917 e!749848))))

(declare-fun mapRest!55021 () (Array (_ BitVec 32) ValueCell!16899))

(declare-fun mapValue!55021 () ValueCell!16899)

(declare-fun mapKey!55021 () (_ BitVec 32))

(assert (=> mapNonEmpty!55021 (= (arr!42560 _values!1354) (store mapRest!55021 mapKey!55021 mapValue!55021))))

(declare-fun res!872707 () Bool)

(assert (=> start!111030 (=> (not res!872707) (not e!749850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111030 (= res!872707 (validMask!0 mask!2040))))

(assert (=> start!111030 e!749850))

(assert (=> start!111030 tp!104916))

(declare-fun array_inv!32143 (array!88158) Bool)

(assert (=> start!111030 (array_inv!32143 _keys!1628)))

(assert (=> start!111030 true))

(assert (=> start!111030 tp_is_empty!35595))

(declare-fun array_inv!32144 (array!88160) Bool)

(assert (=> start!111030 (and (array_inv!32144 _values!1354) e!749849)))

(assert (= (and start!111030 res!872707) b!1314559))

(assert (= (and b!1314559 res!872709) b!1314560))

(assert (= (and b!1314560 res!872706) b!1314556))

(assert (= (and b!1314556 res!872705) b!1314555))

(assert (= (and b!1314555 res!872708) b!1314561))

(assert (= (and b!1314557 condMapEmpty!55021) mapIsEmpty!55021))

(assert (= (and b!1314557 (not condMapEmpty!55021)) mapNonEmpty!55021))

(get-info :version)

(assert (= (and mapNonEmpty!55021 ((_ is ValueCellFull!16899) mapValue!55021)) b!1314554))

(assert (= (and b!1314557 ((_ is ValueCellFull!16899) mapDefault!55021)) b!1314558))

(assert (= start!111030 b!1314557))

(declare-fun m!1203037 () Bool)

(assert (=> b!1314561 m!1203037))

(assert (=> b!1314561 m!1203037))

(declare-fun m!1203039 () Bool)

(assert (=> b!1314561 m!1203039))

(declare-fun m!1203041 () Bool)

(assert (=> b!1314556 m!1203041))

(declare-fun m!1203043 () Bool)

(assert (=> mapNonEmpty!55021 m!1203043))

(declare-fun m!1203045 () Bool)

(assert (=> start!111030 m!1203045))

(declare-fun m!1203047 () Bool)

(assert (=> start!111030 m!1203047))

(declare-fun m!1203049 () Bool)

(assert (=> start!111030 m!1203049))

(declare-fun m!1203051 () Bool)

(assert (=> b!1314560 m!1203051))

(check-sat (not b_next!29865) (not b!1314556) tp_is_empty!35595 (not start!111030) (not mapNonEmpty!55021) (not b!1314560) (not b!1314561) b_and!48073)
(check-sat b_and!48073 (not b_next!29865))
