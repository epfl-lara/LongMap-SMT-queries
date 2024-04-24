; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110820 () Bool)

(assert start!110820)

(declare-fun b_free!29431 () Bool)

(declare-fun b_next!29431 () Bool)

(assert (=> start!110820 (= b_free!29431 (not b_next!29431))))

(declare-fun tp!103614 () Bool)

(declare-fun b_and!47641 () Bool)

(assert (=> start!110820 (= tp!103614 b_and!47641)))

(declare-fun b!1309834 () Bool)

(declare-fun e!747439 () Bool)

(declare-fun tp_is_empty!35161 () Bool)

(assert (=> b!1309834 (= e!747439 tp_is_empty!35161)))

(declare-fun b!1309835 () Bool)

(declare-fun res!869160 () Bool)

(declare-fun e!747436 () Bool)

(assert (=> b!1309835 (=> (not res!869160) (not e!747436))))

(declare-datatypes ((array!87379 0))(
  ( (array!87380 (arr!42165 (Array (_ BitVec 32) (_ BitVec 64))) (size!42716 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87379)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309835 (= res!869160 (not (= (select (arr!42165 _keys!1628) from!2020) k0!1175)))))

(declare-fun mapNonEmpty!54370 () Bool)

(declare-fun mapRes!54370 () Bool)

(declare-fun tp!103615 () Bool)

(declare-fun e!747438 () Bool)

(assert (=> mapNonEmpty!54370 (= mapRes!54370 (and tp!103615 e!747438))))

(declare-datatypes ((V!51985 0))(
  ( (V!51986 (val!17655 Int)) )
))
(declare-datatypes ((ValueCell!16682 0))(
  ( (ValueCellFull!16682 (v!20277 V!51985)) (EmptyCell!16682) )
))
(declare-fun mapRest!54370 () (Array (_ BitVec 32) ValueCell!16682))

(declare-fun mapKey!54370 () (_ BitVec 32))

(declare-datatypes ((array!87381 0))(
  ( (array!87382 (arr!42166 (Array (_ BitVec 32) ValueCell!16682)) (size!42717 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87381)

(declare-fun mapValue!54370 () ValueCell!16682)

(assert (=> mapNonEmpty!54370 (= (arr!42166 _values!1354) (store mapRest!54370 mapKey!54370 mapValue!54370))))

(declare-fun b!1309837 () Bool)

(declare-fun e!747437 () Bool)

(assert (=> b!1309837 (= e!747437 (and e!747439 mapRes!54370))))

(declare-fun condMapEmpty!54370 () Bool)

(declare-fun mapDefault!54370 () ValueCell!16682)

(assert (=> b!1309837 (= condMapEmpty!54370 (= (arr!42166 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16682)) mapDefault!54370)))))

(declare-fun b!1309838 () Bool)

(declare-fun res!869163 () Bool)

(assert (=> b!1309838 (=> (not res!869163) (not e!747436))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309838 (= res!869163 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1309839 () Bool)

(assert (=> b!1309839 (= e!747438 tp_is_empty!35161)))

(declare-fun b!1309840 () Bool)

(declare-fun res!869165 () Bool)

(assert (=> b!1309840 (=> (not res!869165) (not e!747436))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87379 (_ BitVec 32)) Bool)

(assert (=> b!1309840 (= res!869165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309836 () Bool)

(declare-fun res!869157 () Bool)

(assert (=> b!1309836 (=> (not res!869157) (not e!747436))))

(declare-datatypes ((List!29934 0))(
  ( (Nil!29931) (Cons!29930 (h!31148 (_ BitVec 64)) (t!43532 List!29934)) )
))
(declare-fun arrayNoDuplicates!0 (array!87379 (_ BitVec 32) List!29934) Bool)

(assert (=> b!1309836 (= res!869157 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29931))))

(declare-fun res!869164 () Bool)

(assert (=> start!110820 (=> (not res!869164) (not e!747436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110820 (= res!869164 (validMask!0 mask!2040))))

(assert (=> start!110820 e!747436))

(assert (=> start!110820 tp!103614))

(declare-fun array_inv!32127 (array!87379) Bool)

(assert (=> start!110820 (array_inv!32127 _keys!1628)))

(assert (=> start!110820 true))

(assert (=> start!110820 tp_is_empty!35161))

(declare-fun array_inv!32128 (array!87381) Bool)

(assert (=> start!110820 (and (array_inv!32128 _values!1354) e!747437)))

(declare-fun b!1309841 () Bool)

(assert (=> b!1309841 (= e!747436 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51985)

(declare-fun zeroValue!1296 () V!51985)

(declare-datatypes ((tuple2!22774 0))(
  ( (tuple2!22775 (_1!11398 (_ BitVec 64)) (_2!11398 V!51985)) )
))
(declare-datatypes ((List!29935 0))(
  ( (Nil!29932) (Cons!29931 (h!31149 tuple2!22774) (t!43533 List!29935)) )
))
(declare-datatypes ((ListLongMap!20439 0))(
  ( (ListLongMap!20440 (toList!10235 List!29935)) )
))
(declare-fun contains!8397 (ListLongMap!20439 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5239 (array!87379 array!87381 (_ BitVec 32) (_ BitVec 32) V!51985 V!51985 (_ BitVec 32) Int) ListLongMap!20439)

(assert (=> b!1309841 (contains!8397 (getCurrentListMap!5239 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43267 0))(
  ( (Unit!43268) )
))
(declare-fun lt!585641 () Unit!43267)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!14 (array!87379 array!87381 (_ BitVec 32) (_ BitVec 32) V!51985 V!51985 (_ BitVec 64) (_ BitVec 32) Int) Unit!43267)

(assert (=> b!1309841 (= lt!585641 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!14 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun mapIsEmpty!54370 () Bool)

(assert (=> mapIsEmpty!54370 mapRes!54370))

(declare-fun b!1309842 () Bool)

(declare-fun res!869161 () Bool)

(assert (=> b!1309842 (=> (not res!869161) (not e!747436))))

(assert (=> b!1309842 (= res!869161 (and (= (size!42717 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42716 _keys!1628) (size!42717 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309843 () Bool)

(declare-fun res!869162 () Bool)

(assert (=> b!1309843 (=> (not res!869162) (not e!747436))))

(assert (=> b!1309843 (= res!869162 (contains!8397 (getCurrentListMap!5239 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309844 () Bool)

(declare-fun res!869158 () Bool)

(assert (=> b!1309844 (=> (not res!869158) (not e!747436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309844 (= res!869158 (validKeyInArray!0 (select (arr!42165 _keys!1628) from!2020)))))

(declare-fun b!1309845 () Bool)

(declare-fun res!869159 () Bool)

(assert (=> b!1309845 (=> (not res!869159) (not e!747436))))

(assert (=> b!1309845 (= res!869159 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42716 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!110820 res!869164) b!1309842))

(assert (= (and b!1309842 res!869161) b!1309840))

(assert (= (and b!1309840 res!869165) b!1309836))

(assert (= (and b!1309836 res!869157) b!1309845))

(assert (= (and b!1309845 res!869159) b!1309843))

(assert (= (and b!1309843 res!869162) b!1309835))

(assert (= (and b!1309835 res!869160) b!1309844))

(assert (= (and b!1309844 res!869158) b!1309838))

(assert (= (and b!1309838 res!869163) b!1309841))

(assert (= (and b!1309837 condMapEmpty!54370) mapIsEmpty!54370))

(assert (= (and b!1309837 (not condMapEmpty!54370)) mapNonEmpty!54370))

(get-info :version)

(assert (= (and mapNonEmpty!54370 ((_ is ValueCellFull!16682) mapValue!54370)) b!1309839))

(assert (= (and b!1309837 ((_ is ValueCellFull!16682) mapDefault!54370)) b!1309834))

(assert (= start!110820 b!1309837))

(declare-fun m!1200491 () Bool)

(assert (=> b!1309841 m!1200491))

(assert (=> b!1309841 m!1200491))

(declare-fun m!1200493 () Bool)

(assert (=> b!1309841 m!1200493))

(declare-fun m!1200495 () Bool)

(assert (=> b!1309841 m!1200495))

(declare-fun m!1200497 () Bool)

(assert (=> b!1309843 m!1200497))

(assert (=> b!1309843 m!1200497))

(declare-fun m!1200499 () Bool)

(assert (=> b!1309843 m!1200499))

(declare-fun m!1200501 () Bool)

(assert (=> start!110820 m!1200501))

(declare-fun m!1200503 () Bool)

(assert (=> start!110820 m!1200503))

(declare-fun m!1200505 () Bool)

(assert (=> start!110820 m!1200505))

(declare-fun m!1200507 () Bool)

(assert (=> b!1309840 m!1200507))

(declare-fun m!1200509 () Bool)

(assert (=> mapNonEmpty!54370 m!1200509))

(declare-fun m!1200511 () Bool)

(assert (=> b!1309844 m!1200511))

(assert (=> b!1309844 m!1200511))

(declare-fun m!1200513 () Bool)

(assert (=> b!1309844 m!1200513))

(declare-fun m!1200515 () Bool)

(assert (=> b!1309836 m!1200515))

(assert (=> b!1309835 m!1200511))

(check-sat (not b!1309843) (not start!110820) (not b!1309844) (not b!1309836) (not b!1309841) (not b_next!29431) b_and!47641 (not b!1309840) (not mapNonEmpty!54370) tp_is_empty!35161)
(check-sat b_and!47641 (not b_next!29431))
