; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110784 () Bool)

(assert start!110784)

(declare-fun b_free!29395 () Bool)

(declare-fun b_next!29395 () Bool)

(assert (=> start!110784 (= b_free!29395 (not b_next!29395))))

(declare-fun tp!103506 () Bool)

(declare-fun b_and!47605 () Bool)

(assert (=> start!110784 (= tp!103506 b_and!47605)))

(declare-fun b!1309186 () Bool)

(declare-fun res!868674 () Bool)

(declare-fun e!747168 () Bool)

(assert (=> b!1309186 (=> (not res!868674) (not e!747168))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309186 (= res!868674 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1309188 () Bool)

(declare-fun e!747169 () Bool)

(declare-fun tp_is_empty!35125 () Bool)

(assert (=> b!1309188 (= e!747169 tp_is_empty!35125)))

(declare-fun b!1309189 () Bool)

(declare-fun res!868679 () Bool)

(assert (=> b!1309189 (=> (not res!868679) (not e!747168))))

(declare-datatypes ((array!87309 0))(
  ( (array!87310 (arr!42130 (Array (_ BitVec 32) (_ BitVec 64))) (size!42681 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87309)

(declare-datatypes ((List!29905 0))(
  ( (Nil!29902) (Cons!29901 (h!31119 (_ BitVec 64)) (t!43503 List!29905)) )
))
(declare-fun arrayNoDuplicates!0 (array!87309 (_ BitVec 32) List!29905) Bool)

(assert (=> b!1309189 (= res!868679 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29902))))

(declare-fun mapNonEmpty!54316 () Bool)

(declare-fun mapRes!54316 () Bool)

(declare-fun tp!103507 () Bool)

(declare-fun e!747170 () Bool)

(assert (=> mapNonEmpty!54316 (= mapRes!54316 (and tp!103507 e!747170))))

(declare-datatypes ((V!51937 0))(
  ( (V!51938 (val!17637 Int)) )
))
(declare-datatypes ((ValueCell!16664 0))(
  ( (ValueCellFull!16664 (v!20259 V!51937)) (EmptyCell!16664) )
))
(declare-fun mapRest!54316 () (Array (_ BitVec 32) ValueCell!16664))

(declare-fun mapKey!54316 () (_ BitVec 32))

(declare-datatypes ((array!87311 0))(
  ( (array!87312 (arr!42131 (Array (_ BitVec 32) ValueCell!16664)) (size!42682 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87311)

(declare-fun mapValue!54316 () ValueCell!16664)

(assert (=> mapNonEmpty!54316 (= (arr!42131 _values!1354) (store mapRest!54316 mapKey!54316 mapValue!54316))))

(declare-fun b!1309190 () Bool)

(declare-fun res!868677 () Bool)

(assert (=> b!1309190 (=> (not res!868677) (not e!747168))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309190 (= res!868677 (not (= (select (arr!42130 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1309191 () Bool)

(assert (=> b!1309191 (= e!747168 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!51937)

(declare-fun zeroValue!1296 () V!51937)

(declare-datatypes ((tuple2!22740 0))(
  ( (tuple2!22741 (_1!11381 (_ BitVec 64)) (_2!11381 V!51937)) )
))
(declare-datatypes ((List!29906 0))(
  ( (Nil!29903) (Cons!29902 (h!31120 tuple2!22740) (t!43504 List!29906)) )
))
(declare-datatypes ((ListLongMap!20405 0))(
  ( (ListLongMap!20406 (toList!10218 List!29906)) )
))
(declare-fun contains!8380 (ListLongMap!20405 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5222 (array!87309 array!87311 (_ BitVec 32) (_ BitVec 32) V!51937 V!51937 (_ BitVec 32) Int) ListLongMap!20405)

(assert (=> b!1309191 (contains!8380 (getCurrentListMap!5222 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43241 0))(
  ( (Unit!43242) )
))
(declare-fun lt!585587 () Unit!43241)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!1 (array!87309 array!87311 (_ BitVec 32) (_ BitVec 32) V!51937 V!51937 (_ BitVec 64) (_ BitVec 32) Int) Unit!43241)

(assert (=> b!1309191 (= lt!585587 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!1 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1309192 () Bool)

(declare-fun res!868671 () Bool)

(assert (=> b!1309192 (=> (not res!868671) (not e!747168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309192 (= res!868671 (validKeyInArray!0 (select (arr!42130 _keys!1628) from!2020)))))

(declare-fun b!1309193 () Bool)

(declare-fun res!868678 () Bool)

(assert (=> b!1309193 (=> (not res!868678) (not e!747168))))

(assert (=> b!1309193 (= res!868678 (contains!8380 (getCurrentListMap!5222 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309194 () Bool)

(declare-fun e!747166 () Bool)

(assert (=> b!1309194 (= e!747166 (and e!747169 mapRes!54316))))

(declare-fun condMapEmpty!54316 () Bool)

(declare-fun mapDefault!54316 () ValueCell!16664)

(assert (=> b!1309194 (= condMapEmpty!54316 (= (arr!42131 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16664)) mapDefault!54316)))))

(declare-fun res!868675 () Bool)

(assert (=> start!110784 (=> (not res!868675) (not e!747168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110784 (= res!868675 (validMask!0 mask!2040))))

(assert (=> start!110784 e!747168))

(assert (=> start!110784 tp!103506))

(declare-fun array_inv!32101 (array!87309) Bool)

(assert (=> start!110784 (array_inv!32101 _keys!1628)))

(assert (=> start!110784 true))

(assert (=> start!110784 tp_is_empty!35125))

(declare-fun array_inv!32102 (array!87311) Bool)

(assert (=> start!110784 (and (array_inv!32102 _values!1354) e!747166)))

(declare-fun b!1309187 () Bool)

(declare-fun res!868676 () Bool)

(assert (=> b!1309187 (=> (not res!868676) (not e!747168))))

(assert (=> b!1309187 (= res!868676 (and (= (size!42682 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42681 _keys!1628) (size!42682 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309195 () Bool)

(declare-fun res!868672 () Bool)

(assert (=> b!1309195 (=> (not res!868672) (not e!747168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87309 (_ BitVec 32)) Bool)

(assert (=> b!1309195 (= res!868672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54316 () Bool)

(assert (=> mapIsEmpty!54316 mapRes!54316))

(declare-fun b!1309196 () Bool)

(declare-fun res!868673 () Bool)

(assert (=> b!1309196 (=> (not res!868673) (not e!747168))))

(assert (=> b!1309196 (= res!868673 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42681 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309197 () Bool)

(assert (=> b!1309197 (= e!747170 tp_is_empty!35125)))

(assert (= (and start!110784 res!868675) b!1309187))

(assert (= (and b!1309187 res!868676) b!1309195))

(assert (= (and b!1309195 res!868672) b!1309189))

(assert (= (and b!1309189 res!868679) b!1309196))

(assert (= (and b!1309196 res!868673) b!1309193))

(assert (= (and b!1309193 res!868678) b!1309190))

(assert (= (and b!1309190 res!868677) b!1309192))

(assert (= (and b!1309192 res!868671) b!1309186))

(assert (= (and b!1309186 res!868674) b!1309191))

(assert (= (and b!1309194 condMapEmpty!54316) mapIsEmpty!54316))

(assert (= (and b!1309194 (not condMapEmpty!54316)) mapNonEmpty!54316))

(get-info :version)

(assert (= (and mapNonEmpty!54316 ((_ is ValueCellFull!16664) mapValue!54316)) b!1309197))

(assert (= (and b!1309194 ((_ is ValueCellFull!16664) mapDefault!54316)) b!1309188))

(assert (= start!110784 b!1309194))

(declare-fun m!1200023 () Bool)

(assert (=> b!1309191 m!1200023))

(assert (=> b!1309191 m!1200023))

(declare-fun m!1200025 () Bool)

(assert (=> b!1309191 m!1200025))

(declare-fun m!1200027 () Bool)

(assert (=> b!1309191 m!1200027))

(declare-fun m!1200029 () Bool)

(assert (=> b!1309189 m!1200029))

(declare-fun m!1200031 () Bool)

(assert (=> start!110784 m!1200031))

(declare-fun m!1200033 () Bool)

(assert (=> start!110784 m!1200033))

(declare-fun m!1200035 () Bool)

(assert (=> start!110784 m!1200035))

(declare-fun m!1200037 () Bool)

(assert (=> b!1309192 m!1200037))

(assert (=> b!1309192 m!1200037))

(declare-fun m!1200039 () Bool)

(assert (=> b!1309192 m!1200039))

(declare-fun m!1200041 () Bool)

(assert (=> b!1309195 m!1200041))

(declare-fun m!1200043 () Bool)

(assert (=> mapNonEmpty!54316 m!1200043))

(assert (=> b!1309190 m!1200037))

(declare-fun m!1200045 () Bool)

(assert (=> b!1309193 m!1200045))

(assert (=> b!1309193 m!1200045))

(declare-fun m!1200047 () Bool)

(assert (=> b!1309193 m!1200047))

(check-sat (not start!110784) (not b!1309192) (not mapNonEmpty!54316) b_and!47605 (not b!1309195) (not b!1309191) (not b!1309189) tp_is_empty!35125 (not b_next!29395) (not b!1309193))
(check-sat b_and!47605 (not b_next!29395))
