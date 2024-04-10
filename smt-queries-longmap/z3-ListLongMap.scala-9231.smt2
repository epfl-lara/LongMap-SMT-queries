; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110736 () Bool)

(assert start!110736)

(declare-fun b_free!29571 () Bool)

(declare-fun b_next!29571 () Bool)

(assert (=> start!110736 (= b_free!29571 (not b_next!29571))))

(declare-fun tp!104035 () Bool)

(declare-fun b_and!47779 () Bool)

(assert (=> start!110736 (= tp!104035 b_and!47779)))

(declare-fun b!1310623 () Bool)

(declare-fun e!747644 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310623 (= e!747644 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87590 0))(
  ( (array!87591 (arr!42275 (Array (_ BitVec 32) (_ BitVec 64))) (size!42825 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87590)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52171 0))(
  ( (V!52172 (val!17725 Int)) )
))
(declare-fun minValue!1296 () V!52171)

(declare-datatypes ((ValueCell!16752 0))(
  ( (ValueCellFull!16752 (v!20352 V!52171)) (EmptyCell!16752) )
))
(declare-datatypes ((array!87592 0))(
  ( (array!87593 (arr!42276 (Array (_ BitVec 32) ValueCell!16752)) (size!42826 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87592)

(declare-fun zeroValue!1296 () V!52171)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22838 0))(
  ( (tuple2!22839 (_1!11430 (_ BitVec 64)) (_2!11430 V!52171)) )
))
(declare-datatypes ((List!29977 0))(
  ( (Nil!29974) (Cons!29973 (h!31182 tuple2!22838) (t!43583 List!29977)) )
))
(declare-datatypes ((ListLongMap!20495 0))(
  ( (ListLongMap!20496 (toList!10263 List!29977)) )
))
(declare-fun contains!8413 (ListLongMap!20495 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5276 (array!87590 array!87592 (_ BitVec 32) (_ BitVec 32) V!52171 V!52171 (_ BitVec 32) Int) ListLongMap!20495)

(assert (=> b!1310623 (contains!8413 (getCurrentListMap!5276 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43344 0))(
  ( (Unit!43345) )
))
(declare-fun lt!585375 () Unit!43344)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!18 (array!87590 array!87592 (_ BitVec 32) (_ BitVec 32) V!52171 V!52171 (_ BitVec 64) (_ BitVec 32) Int) Unit!43344)

(assert (=> b!1310623 (= lt!585375 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!18 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun mapIsEmpty!54580 () Bool)

(declare-fun mapRes!54580 () Bool)

(assert (=> mapIsEmpty!54580 mapRes!54580))

(declare-fun b!1310624 () Bool)

(declare-fun res!870101 () Bool)

(assert (=> b!1310624 (=> (not res!870101) (not e!747644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310624 (= res!870101 (validKeyInArray!0 (select (arr!42275 _keys!1628) from!2020)))))

(declare-fun res!870102 () Bool)

(assert (=> start!110736 (=> (not res!870102) (not e!747644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110736 (= res!870102 (validMask!0 mask!2040))))

(assert (=> start!110736 e!747644))

(assert (=> start!110736 tp!104035))

(declare-fun array_inv!31945 (array!87590) Bool)

(assert (=> start!110736 (array_inv!31945 _keys!1628)))

(assert (=> start!110736 true))

(declare-fun tp_is_empty!35301 () Bool)

(assert (=> start!110736 tp_is_empty!35301))

(declare-fun e!747645 () Bool)

(declare-fun array_inv!31946 (array!87592) Bool)

(assert (=> start!110736 (and (array_inv!31946 _values!1354) e!747645)))

(declare-fun mapNonEmpty!54580 () Bool)

(declare-fun tp!104034 () Bool)

(declare-fun e!747646 () Bool)

(assert (=> mapNonEmpty!54580 (= mapRes!54580 (and tp!104034 e!747646))))

(declare-fun mapValue!54580 () ValueCell!16752)

(declare-fun mapKey!54580 () (_ BitVec 32))

(declare-fun mapRest!54580 () (Array (_ BitVec 32) ValueCell!16752))

(assert (=> mapNonEmpty!54580 (= (arr!42276 _values!1354) (store mapRest!54580 mapKey!54580 mapValue!54580))))

(declare-fun b!1310625 () Bool)

(declare-fun res!870104 () Bool)

(assert (=> b!1310625 (=> (not res!870104) (not e!747644))))

(declare-datatypes ((List!29978 0))(
  ( (Nil!29975) (Cons!29974 (h!31183 (_ BitVec 64)) (t!43584 List!29978)) )
))
(declare-fun arrayNoDuplicates!0 (array!87590 (_ BitVec 32) List!29978) Bool)

(assert (=> b!1310625 (= res!870104 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29975))))

(declare-fun b!1310626 () Bool)

(declare-fun res!870099 () Bool)

(assert (=> b!1310626 (=> (not res!870099) (not e!747644))))

(assert (=> b!1310626 (= res!870099 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310627 () Bool)

(assert (=> b!1310627 (= e!747646 tp_is_empty!35301)))

(declare-fun b!1310628 () Bool)

(declare-fun res!870100 () Bool)

(assert (=> b!1310628 (=> (not res!870100) (not e!747644))))

(assert (=> b!1310628 (= res!870100 (not (= (select (arr!42275 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1310629 () Bool)

(declare-fun res!870103 () Bool)

(assert (=> b!1310629 (=> (not res!870103) (not e!747644))))

(assert (=> b!1310629 (= res!870103 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42825 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310630 () Bool)

(declare-fun e!747643 () Bool)

(assert (=> b!1310630 (= e!747645 (and e!747643 mapRes!54580))))

(declare-fun condMapEmpty!54580 () Bool)

(declare-fun mapDefault!54580 () ValueCell!16752)

(assert (=> b!1310630 (= condMapEmpty!54580 (= (arr!42276 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16752)) mapDefault!54580)))))

(declare-fun b!1310631 () Bool)

(declare-fun res!870098 () Bool)

(assert (=> b!1310631 (=> (not res!870098) (not e!747644))))

(assert (=> b!1310631 (= res!870098 (and (= (size!42826 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42825 _keys!1628) (size!42826 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310632 () Bool)

(declare-fun res!870105 () Bool)

(assert (=> b!1310632 (=> (not res!870105) (not e!747644))))

(assert (=> b!1310632 (= res!870105 (contains!8413 (getCurrentListMap!5276 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310633 () Bool)

(declare-fun res!870097 () Bool)

(assert (=> b!1310633 (=> (not res!870097) (not e!747644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87590 (_ BitVec 32)) Bool)

(assert (=> b!1310633 (= res!870097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310634 () Bool)

(assert (=> b!1310634 (= e!747643 tp_is_empty!35301)))

(assert (= (and start!110736 res!870102) b!1310631))

(assert (= (and b!1310631 res!870098) b!1310633))

(assert (= (and b!1310633 res!870097) b!1310625))

(assert (= (and b!1310625 res!870104) b!1310629))

(assert (= (and b!1310629 res!870103) b!1310632))

(assert (= (and b!1310632 res!870105) b!1310628))

(assert (= (and b!1310628 res!870100) b!1310624))

(assert (= (and b!1310624 res!870101) b!1310626))

(assert (= (and b!1310626 res!870099) b!1310623))

(assert (= (and b!1310630 condMapEmpty!54580) mapIsEmpty!54580))

(assert (= (and b!1310630 (not condMapEmpty!54580)) mapNonEmpty!54580))

(get-info :version)

(assert (= (and mapNonEmpty!54580 ((_ is ValueCellFull!16752) mapValue!54580)) b!1310627))

(assert (= (and b!1310630 ((_ is ValueCellFull!16752) mapDefault!54580)) b!1310634))

(assert (= start!110736 b!1310630))

(declare-fun m!1200353 () Bool)

(assert (=> b!1310628 m!1200353))

(declare-fun m!1200355 () Bool)

(assert (=> b!1310625 m!1200355))

(declare-fun m!1200357 () Bool)

(assert (=> start!110736 m!1200357))

(declare-fun m!1200359 () Bool)

(assert (=> start!110736 m!1200359))

(declare-fun m!1200361 () Bool)

(assert (=> start!110736 m!1200361))

(declare-fun m!1200363 () Bool)

(assert (=> b!1310633 m!1200363))

(declare-fun m!1200365 () Bool)

(assert (=> mapNonEmpty!54580 m!1200365))

(declare-fun m!1200367 () Bool)

(assert (=> b!1310623 m!1200367))

(assert (=> b!1310623 m!1200367))

(declare-fun m!1200369 () Bool)

(assert (=> b!1310623 m!1200369))

(declare-fun m!1200371 () Bool)

(assert (=> b!1310623 m!1200371))

(assert (=> b!1310624 m!1200353))

(assert (=> b!1310624 m!1200353))

(declare-fun m!1200373 () Bool)

(assert (=> b!1310624 m!1200373))

(declare-fun m!1200375 () Bool)

(assert (=> b!1310632 m!1200375))

(assert (=> b!1310632 m!1200375))

(declare-fun m!1200377 () Bool)

(assert (=> b!1310632 m!1200377))

(check-sat (not b!1310632) (not b!1310625) b_and!47779 (not mapNonEmpty!54580) (not b!1310623) (not start!110736) (not b!1310633) (not b_next!29571) tp_is_empty!35301 (not b!1310624))
(check-sat b_and!47779 (not b_next!29571))
