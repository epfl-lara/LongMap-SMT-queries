; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111042 () Bool)

(assert start!111042)

(declare-fun b_free!29877 () Bool)

(declare-fun b_next!29877 () Bool)

(assert (=> start!111042 (= b_free!29877 (not b_next!29877))))

(declare-fun tp!104953 () Bool)

(declare-fun b_and!48085 () Bool)

(assert (=> start!111042 (= tp!104953 b_and!48085)))

(declare-fun b!1314698 () Bool)

(declare-fun e!749941 () Bool)

(declare-fun tp_is_empty!35607 () Bool)

(assert (=> b!1314698 (= e!749941 tp_is_empty!35607)))

(declare-fun b!1314699 () Bool)

(declare-fun res!872799 () Bool)

(declare-fun e!749940 () Bool)

(assert (=> b!1314699 (=> (not res!872799) (not e!749940))))

(declare-datatypes ((array!88182 0))(
  ( (array!88183 (arr!42571 (Array (_ BitVec 32) (_ BitVec 64))) (size!43121 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88182)

(declare-datatypes ((List!30193 0))(
  ( (Nil!30190) (Cons!30189 (h!31398 (_ BitVec 64)) (t!43799 List!30193)) )
))
(declare-fun arrayNoDuplicates!0 (array!88182 (_ BitVec 32) List!30193) Bool)

(assert (=> b!1314699 (= res!872799 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30190))))

(declare-fun b!1314700 () Bool)

(declare-fun res!872798 () Bool)

(assert (=> b!1314700 (=> (not res!872798) (not e!749940))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88182 (_ BitVec 32)) Bool)

(assert (=> b!1314700 (= res!872798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314701 () Bool)

(assert (=> b!1314701 (= e!749940 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52579 0))(
  ( (V!52580 (val!17878 Int)) )
))
(declare-fun minValue!1296 () V!52579)

(declare-datatypes ((ValueCell!16905 0))(
  ( (ValueCellFull!16905 (v!20505 V!52579)) (EmptyCell!16905) )
))
(declare-datatypes ((array!88184 0))(
  ( (array!88185 (arr!42572 (Array (_ BitVec 32) ValueCell!16905)) (size!43122 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88184)

(declare-fun zeroValue!1296 () V!52579)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585825 () Bool)

(declare-datatypes ((tuple2!23056 0))(
  ( (tuple2!23057 (_1!11539 (_ BitVec 64)) (_2!11539 V!52579)) )
))
(declare-datatypes ((List!30194 0))(
  ( (Nil!30191) (Cons!30190 (h!31399 tuple2!23056) (t!43800 List!30194)) )
))
(declare-datatypes ((ListLongMap!20713 0))(
  ( (ListLongMap!20714 (toList!10372 List!30194)) )
))
(declare-fun contains!8522 (ListLongMap!20713 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5385 (array!88182 array!88184 (_ BitVec 32) (_ BitVec 32) V!52579 V!52579 (_ BitVec 32) Int) ListLongMap!20713)

(assert (=> b!1314701 (= lt!585825 (contains!8522 (getCurrentListMap!5385 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314702 () Bool)

(declare-fun e!749939 () Bool)

(assert (=> b!1314702 (= e!749939 tp_is_empty!35607)))

(declare-fun mapIsEmpty!55039 () Bool)

(declare-fun mapRes!55039 () Bool)

(assert (=> mapIsEmpty!55039 mapRes!55039))

(declare-fun res!872796 () Bool)

(assert (=> start!111042 (=> (not res!872796) (not e!749940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111042 (= res!872796 (validMask!0 mask!2040))))

(assert (=> start!111042 e!749940))

(assert (=> start!111042 tp!104953))

(declare-fun array_inv!32149 (array!88182) Bool)

(assert (=> start!111042 (array_inv!32149 _keys!1628)))

(assert (=> start!111042 true))

(assert (=> start!111042 tp_is_empty!35607))

(declare-fun e!749942 () Bool)

(declare-fun array_inv!32150 (array!88184) Bool)

(assert (=> start!111042 (and (array_inv!32150 _values!1354) e!749942)))

(declare-fun b!1314703 () Bool)

(assert (=> b!1314703 (= e!749942 (and e!749941 mapRes!55039))))

(declare-fun condMapEmpty!55039 () Bool)

(declare-fun mapDefault!55039 () ValueCell!16905)

(assert (=> b!1314703 (= condMapEmpty!55039 (= (arr!42572 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16905)) mapDefault!55039)))))

(declare-fun b!1314704 () Bool)

(declare-fun res!872795 () Bool)

(assert (=> b!1314704 (=> (not res!872795) (not e!749940))))

(assert (=> b!1314704 (= res!872795 (and (= (size!43122 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43121 _keys!1628) (size!43122 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55039 () Bool)

(declare-fun tp!104952 () Bool)

(assert (=> mapNonEmpty!55039 (= mapRes!55039 (and tp!104952 e!749939))))

(declare-fun mapRest!55039 () (Array (_ BitVec 32) ValueCell!16905))

(declare-fun mapValue!55039 () ValueCell!16905)

(declare-fun mapKey!55039 () (_ BitVec 32))

(assert (=> mapNonEmpty!55039 (= (arr!42572 _values!1354) (store mapRest!55039 mapKey!55039 mapValue!55039))))

(declare-fun b!1314705 () Bool)

(declare-fun res!872797 () Bool)

(assert (=> b!1314705 (=> (not res!872797) (not e!749940))))

(assert (=> b!1314705 (= res!872797 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43121 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111042 res!872796) b!1314704))

(assert (= (and b!1314704 res!872795) b!1314700))

(assert (= (and b!1314700 res!872798) b!1314699))

(assert (= (and b!1314699 res!872799) b!1314705))

(assert (= (and b!1314705 res!872797) b!1314701))

(assert (= (and b!1314703 condMapEmpty!55039) mapIsEmpty!55039))

(assert (= (and b!1314703 (not condMapEmpty!55039)) mapNonEmpty!55039))

(get-info :version)

(assert (= (and mapNonEmpty!55039 ((_ is ValueCellFull!16905) mapValue!55039)) b!1314702))

(assert (= (and b!1314703 ((_ is ValueCellFull!16905) mapDefault!55039)) b!1314698))

(assert (= start!111042 b!1314703))

(declare-fun m!1203133 () Bool)

(assert (=> b!1314701 m!1203133))

(assert (=> b!1314701 m!1203133))

(declare-fun m!1203135 () Bool)

(assert (=> b!1314701 m!1203135))

(declare-fun m!1203137 () Bool)

(assert (=> mapNonEmpty!55039 m!1203137))

(declare-fun m!1203139 () Bool)

(assert (=> start!111042 m!1203139))

(declare-fun m!1203141 () Bool)

(assert (=> start!111042 m!1203141))

(declare-fun m!1203143 () Bool)

(assert (=> start!111042 m!1203143))

(declare-fun m!1203145 () Bool)

(assert (=> b!1314699 m!1203145))

(declare-fun m!1203147 () Bool)

(assert (=> b!1314700 m!1203147))

(check-sat (not b_next!29877) (not b!1314700) (not mapNonEmpty!55039) (not b!1314699) (not b!1314701) tp_is_empty!35607 b_and!48085 (not start!111042))
(check-sat b_and!48085 (not b_next!29877))
