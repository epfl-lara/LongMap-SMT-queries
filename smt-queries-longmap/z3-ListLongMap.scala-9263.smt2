; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110926 () Bool)

(assert start!110926)

(declare-fun b_free!29761 () Bool)

(declare-fun b_next!29761 () Bool)

(assert (=> start!110926 (= b_free!29761 (not b_next!29761))))

(declare-fun tp!104606 () Bool)

(declare-fun b_and!47951 () Bool)

(assert (=> start!110926 (= tp!104606 b_and!47951)))

(declare-fun mapNonEmpty!54865 () Bool)

(declare-fun mapRes!54865 () Bool)

(declare-fun tp!104605 () Bool)

(declare-fun e!749039 () Bool)

(assert (=> mapNonEmpty!54865 (= mapRes!54865 (and tp!104605 e!749039))))

(declare-fun mapKey!54865 () (_ BitVec 32))

(declare-datatypes ((V!52425 0))(
  ( (V!52426 (val!17820 Int)) )
))
(declare-datatypes ((ValueCell!16847 0))(
  ( (ValueCellFull!16847 (v!20446 V!52425)) (EmptyCell!16847) )
))
(declare-fun mapRest!54865 () (Array (_ BitVec 32) ValueCell!16847))

(declare-datatypes ((array!87865 0))(
  ( (array!87866 (arr!42413 (Array (_ BitVec 32) ValueCell!16847)) (size!42965 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87865)

(declare-fun mapValue!54865 () ValueCell!16847)

(assert (=> mapNonEmpty!54865 (= (arr!42413 _values!1354) (store mapRest!54865 mapKey!54865 mapValue!54865))))

(declare-fun mapIsEmpty!54865 () Bool)

(assert (=> mapIsEmpty!54865 mapRes!54865))

(declare-fun b!1313200 () Bool)

(declare-fun e!749035 () Bool)

(assert (=> b!1313200 (= e!749035 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87867 0))(
  ( (array!87868 (arr!42414 (Array (_ BitVec 32) (_ BitVec 64))) (size!42966 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87867)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52425)

(declare-fun zeroValue!1296 () V!52425)

(declare-fun lt!585465 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23060 0))(
  ( (tuple2!23061 (_1!11541 (_ BitVec 64)) (_2!11541 V!52425)) )
))
(declare-datatypes ((List!30180 0))(
  ( (Nil!30177) (Cons!30176 (h!31385 tuple2!23060) (t!43778 List!30180)) )
))
(declare-datatypes ((ListLongMap!20717 0))(
  ( (ListLongMap!20718 (toList!10374 List!30180)) )
))
(declare-fun contains!8451 (ListLongMap!20717 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5269 (array!87867 array!87865 (_ BitVec 32) (_ BitVec 32) V!52425 V!52425 (_ BitVec 32) Int) ListLongMap!20717)

(assert (=> b!1313200 (= lt!585465 (contains!8451 (getCurrentListMap!5269 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!871863 () Bool)

(assert (=> start!110926 (=> (not res!871863) (not e!749035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110926 (= res!871863 (validMask!0 mask!2040))))

(assert (=> start!110926 e!749035))

(assert (=> start!110926 tp!104606))

(declare-fun array_inv!32229 (array!87867) Bool)

(assert (=> start!110926 (array_inv!32229 _keys!1628)))

(assert (=> start!110926 true))

(declare-fun tp_is_empty!35491 () Bool)

(assert (=> start!110926 tp_is_empty!35491))

(declare-fun e!749036 () Bool)

(declare-fun array_inv!32230 (array!87865) Bool)

(assert (=> start!110926 (and (array_inv!32230 _values!1354) e!749036)))

(declare-fun b!1313201 () Bool)

(declare-fun res!871862 () Bool)

(assert (=> b!1313201 (=> (not res!871862) (not e!749035))))

(assert (=> b!1313201 (= res!871862 (and (= (size!42965 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42966 _keys!1628) (size!42965 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313202 () Bool)

(declare-fun e!749038 () Bool)

(assert (=> b!1313202 (= e!749036 (and e!749038 mapRes!54865))))

(declare-fun condMapEmpty!54865 () Bool)

(declare-fun mapDefault!54865 () ValueCell!16847)

(assert (=> b!1313202 (= condMapEmpty!54865 (= (arr!42413 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16847)) mapDefault!54865)))))

(declare-fun b!1313203 () Bool)

(declare-fun res!871861 () Bool)

(assert (=> b!1313203 (=> (not res!871861) (not e!749035))))

(assert (=> b!1313203 (= res!871861 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42966 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313204 () Bool)

(assert (=> b!1313204 (= e!749039 tp_is_empty!35491)))

(declare-fun b!1313205 () Bool)

(declare-fun res!871864 () Bool)

(assert (=> b!1313205 (=> (not res!871864) (not e!749035))))

(declare-datatypes ((List!30181 0))(
  ( (Nil!30178) (Cons!30177 (h!31386 (_ BitVec 64)) (t!43779 List!30181)) )
))
(declare-fun arrayNoDuplicates!0 (array!87867 (_ BitVec 32) List!30181) Bool)

(assert (=> b!1313205 (= res!871864 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30178))))

(declare-fun b!1313206 () Bool)

(assert (=> b!1313206 (= e!749038 tp_is_empty!35491)))

(declare-fun b!1313207 () Bool)

(declare-fun res!871860 () Bool)

(assert (=> b!1313207 (=> (not res!871860) (not e!749035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87867 (_ BitVec 32)) Bool)

(assert (=> b!1313207 (= res!871860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110926 res!871863) b!1313201))

(assert (= (and b!1313201 res!871862) b!1313207))

(assert (= (and b!1313207 res!871860) b!1313205))

(assert (= (and b!1313205 res!871864) b!1313203))

(assert (= (and b!1313203 res!871861) b!1313200))

(assert (= (and b!1313202 condMapEmpty!54865) mapIsEmpty!54865))

(assert (= (and b!1313202 (not condMapEmpty!54865)) mapNonEmpty!54865))

(get-info :version)

(assert (= (and mapNonEmpty!54865 ((_ is ValueCellFull!16847) mapValue!54865)) b!1313204))

(assert (= (and b!1313202 ((_ is ValueCellFull!16847) mapDefault!54865)) b!1313206))

(assert (= start!110926 b!1313202))

(declare-fun m!1201659 () Bool)

(assert (=> b!1313207 m!1201659))

(declare-fun m!1201661 () Bool)

(assert (=> mapNonEmpty!54865 m!1201661))

(declare-fun m!1201663 () Bool)

(assert (=> b!1313200 m!1201663))

(assert (=> b!1313200 m!1201663))

(declare-fun m!1201665 () Bool)

(assert (=> b!1313200 m!1201665))

(declare-fun m!1201667 () Bool)

(assert (=> b!1313205 m!1201667))

(declare-fun m!1201669 () Bool)

(assert (=> start!110926 m!1201669))

(declare-fun m!1201671 () Bool)

(assert (=> start!110926 m!1201671))

(declare-fun m!1201673 () Bool)

(assert (=> start!110926 m!1201673))

(check-sat b_and!47951 (not start!110926) (not b!1313200) (not b!1313205) tp_is_empty!35491 (not b_next!29761) (not b!1313207) (not mapNonEmpty!54865))
(check-sat b_and!47951 (not b_next!29761))
