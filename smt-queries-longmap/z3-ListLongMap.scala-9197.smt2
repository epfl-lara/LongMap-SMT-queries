; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110532 () Bool)

(assert start!110532)

(declare-fun b_free!29367 () Bool)

(declare-fun b_next!29367 () Bool)

(assert (=> start!110532 (= b_free!29367 (not b_next!29367))))

(declare-fun tp!103423 () Bool)

(declare-fun b_and!47575 () Bool)

(assert (=> start!110532 (= tp!103423 b_and!47575)))

(declare-fun res!867935 () Bool)

(declare-fun e!746115 () Bool)

(assert (=> start!110532 (=> (not res!867935) (not e!746115))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110532 (= res!867935 (validMask!0 mask!2040))))

(assert (=> start!110532 e!746115))

(assert (=> start!110532 tp!103423))

(declare-datatypes ((array!87194 0))(
  ( (array!87195 (arr!42077 (Array (_ BitVec 32) (_ BitVec 64))) (size!42627 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87194)

(declare-fun array_inv!31805 (array!87194) Bool)

(assert (=> start!110532 (array_inv!31805 _keys!1628)))

(assert (=> start!110532 true))

(declare-fun tp_is_empty!35097 () Bool)

(assert (=> start!110532 tp_is_empty!35097))

(declare-datatypes ((V!51899 0))(
  ( (V!51900 (val!17623 Int)) )
))
(declare-datatypes ((ValueCell!16650 0))(
  ( (ValueCellFull!16650 (v!20250 V!51899)) (EmptyCell!16650) )
))
(declare-datatypes ((array!87196 0))(
  ( (array!87197 (arr!42078 (Array (_ BitVec 32) ValueCell!16650)) (size!42628 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87196)

(declare-fun e!746113 () Bool)

(declare-fun array_inv!31806 (array!87196) Bool)

(assert (=> start!110532 (and (array_inv!31806 _values!1354) e!746113)))

(declare-fun mapIsEmpty!54274 () Bool)

(declare-fun mapRes!54274 () Bool)

(assert (=> mapIsEmpty!54274 mapRes!54274))

(declare-fun b!1307543 () Bool)

(declare-fun e!746116 () Bool)

(assert (=> b!1307543 (= e!746116 tp_is_empty!35097)))

(declare-fun b!1307544 () Bool)

(declare-fun res!867939 () Bool)

(assert (=> b!1307544 (=> (not res!867939) (not e!746115))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87194 (_ BitVec 32)) Bool)

(assert (=> b!1307544 (= res!867939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307545 () Bool)

(declare-fun res!867938 () Bool)

(assert (=> b!1307545 (=> (not res!867938) (not e!746115))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307545 (= res!867938 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42627 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307546 () Bool)

(assert (=> b!1307546 (= e!746115 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51899)

(declare-fun zeroValue!1296 () V!51899)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585069 () Bool)

(declare-datatypes ((tuple2!22688 0))(
  ( (tuple2!22689 (_1!11355 (_ BitVec 64)) (_2!11355 V!51899)) )
))
(declare-datatypes ((List!29829 0))(
  ( (Nil!29826) (Cons!29825 (h!31034 tuple2!22688) (t!43435 List!29829)) )
))
(declare-datatypes ((ListLongMap!20345 0))(
  ( (ListLongMap!20346 (toList!10188 List!29829)) )
))
(declare-fun contains!8338 (ListLongMap!20345 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5201 (array!87194 array!87196 (_ BitVec 32) (_ BitVec 32) V!51899 V!51899 (_ BitVec 32) Int) ListLongMap!20345)

(assert (=> b!1307546 (= lt!585069 (contains!8338 (getCurrentListMap!5201 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307547 () Bool)

(declare-fun res!867936 () Bool)

(assert (=> b!1307547 (=> (not res!867936) (not e!746115))))

(declare-datatypes ((List!29830 0))(
  ( (Nil!29827) (Cons!29826 (h!31035 (_ BitVec 64)) (t!43436 List!29830)) )
))
(declare-fun arrayNoDuplicates!0 (array!87194 (_ BitVec 32) List!29830) Bool)

(assert (=> b!1307547 (= res!867936 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29827))))

(declare-fun mapNonEmpty!54274 () Bool)

(declare-fun tp!103422 () Bool)

(assert (=> mapNonEmpty!54274 (= mapRes!54274 (and tp!103422 e!746116))))

(declare-fun mapValue!54274 () ValueCell!16650)

(declare-fun mapKey!54274 () (_ BitVec 32))

(declare-fun mapRest!54274 () (Array (_ BitVec 32) ValueCell!16650))

(assert (=> mapNonEmpty!54274 (= (arr!42078 _values!1354) (store mapRest!54274 mapKey!54274 mapValue!54274))))

(declare-fun b!1307548 () Bool)

(declare-fun res!867937 () Bool)

(assert (=> b!1307548 (=> (not res!867937) (not e!746115))))

(assert (=> b!1307548 (= res!867937 (and (= (size!42628 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42627 _keys!1628) (size!42628 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307549 () Bool)

(declare-fun e!746114 () Bool)

(assert (=> b!1307549 (= e!746114 tp_is_empty!35097)))

(declare-fun b!1307550 () Bool)

(assert (=> b!1307550 (= e!746113 (and e!746114 mapRes!54274))))

(declare-fun condMapEmpty!54274 () Bool)

(declare-fun mapDefault!54274 () ValueCell!16650)

(assert (=> b!1307550 (= condMapEmpty!54274 (= (arr!42078 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16650)) mapDefault!54274)))))

(assert (= (and start!110532 res!867935) b!1307548))

(assert (= (and b!1307548 res!867937) b!1307544))

(assert (= (and b!1307544 res!867939) b!1307547))

(assert (= (and b!1307547 res!867936) b!1307545))

(assert (= (and b!1307545 res!867938) b!1307546))

(assert (= (and b!1307550 condMapEmpty!54274) mapIsEmpty!54274))

(assert (= (and b!1307550 (not condMapEmpty!54274)) mapNonEmpty!54274))

(get-info :version)

(assert (= (and mapNonEmpty!54274 ((_ is ValueCellFull!16650) mapValue!54274)) b!1307543))

(assert (= (and b!1307550 ((_ is ValueCellFull!16650) mapDefault!54274)) b!1307549))

(assert (= start!110532 b!1307550))

(declare-fun m!1198201 () Bool)

(assert (=> mapNonEmpty!54274 m!1198201))

(declare-fun m!1198203 () Bool)

(assert (=> b!1307547 m!1198203))

(declare-fun m!1198205 () Bool)

(assert (=> b!1307546 m!1198205))

(assert (=> b!1307546 m!1198205))

(declare-fun m!1198207 () Bool)

(assert (=> b!1307546 m!1198207))

(declare-fun m!1198209 () Bool)

(assert (=> b!1307544 m!1198209))

(declare-fun m!1198211 () Bool)

(assert (=> start!110532 m!1198211))

(declare-fun m!1198213 () Bool)

(assert (=> start!110532 m!1198213))

(declare-fun m!1198215 () Bool)

(assert (=> start!110532 m!1198215))

(check-sat (not start!110532) (not b_next!29367) (not b!1307544) b_and!47575 (not mapNonEmpty!54274) tp_is_empty!35097 (not b!1307546) (not b!1307547))
(check-sat b_and!47575 (not b_next!29367))
