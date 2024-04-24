; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110856 () Bool)

(assert start!110856)

(declare-fun b_free!29467 () Bool)

(declare-fun b_next!29467 () Bool)

(assert (=> start!110856 (= b_free!29467 (not b_next!29467))))

(declare-fun tp!103723 () Bool)

(declare-fun b_and!47677 () Bool)

(assert (=> start!110856 (= tp!103723 b_and!47677)))

(declare-fun b!1310366 () Bool)

(declare-fun e!747710 () Bool)

(declare-fun tp_is_empty!35197 () Bool)

(assert (=> b!1310366 (= e!747710 tp_is_empty!35197)))

(declare-fun b!1310367 () Bool)

(declare-fun res!869528 () Bool)

(declare-fun e!747707 () Bool)

(assert (=> b!1310367 (=> (not res!869528) (not e!747707))))

(declare-datatypes ((array!87451 0))(
  ( (array!87452 (arr!42201 (Array (_ BitVec 32) (_ BitVec 64))) (size!42752 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87451)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310367 (= res!869528 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42752 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310368 () Bool)

(declare-fun e!747708 () Bool)

(assert (=> b!1310368 (= e!747708 tp_is_empty!35197)))

(declare-fun b!1310369 () Bool)

(declare-fun res!869527 () Bool)

(assert (=> b!1310369 (=> (not res!869527) (not e!747707))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52033 0))(
  ( (V!52034 (val!17673 Int)) )
))
(declare-datatypes ((ValueCell!16700 0))(
  ( (ValueCellFull!16700 (v!20295 V!52033)) (EmptyCell!16700) )
))
(declare-datatypes ((array!87453 0))(
  ( (array!87454 (arr!42202 (Array (_ BitVec 32) ValueCell!16700)) (size!42753 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87453)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310369 (= res!869527 (and (= (size!42753 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42752 _keys!1628) (size!42753 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310370 () Bool)

(assert (=> b!1310370 (= e!747707 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585695 () Bool)

(declare-fun minValue!1296 () V!52033)

(declare-fun zeroValue!1296 () V!52033)

(declare-datatypes ((tuple2!22804 0))(
  ( (tuple2!22805 (_1!11413 (_ BitVec 64)) (_2!11413 V!52033)) )
))
(declare-datatypes ((List!29962 0))(
  ( (Nil!29959) (Cons!29958 (h!31176 tuple2!22804) (t!43560 List!29962)) )
))
(declare-datatypes ((ListLongMap!20469 0))(
  ( (ListLongMap!20470 (toList!10250 List!29962)) )
))
(declare-fun contains!8412 (ListLongMap!20469 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5254 (array!87451 array!87453 (_ BitVec 32) (_ BitVec 32) V!52033 V!52033 (_ BitVec 32) Int) ListLongMap!20469)

(assert (=> b!1310370 (= lt!585695 (contains!8412 (getCurrentListMap!5254 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310371 () Bool)

(declare-fun res!869531 () Bool)

(assert (=> b!1310371 (=> (not res!869531) (not e!747707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87451 (_ BitVec 32)) Bool)

(assert (=> b!1310371 (= res!869531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310372 () Bool)

(declare-fun res!869529 () Bool)

(assert (=> b!1310372 (=> (not res!869529) (not e!747707))))

(declare-datatypes ((List!29963 0))(
  ( (Nil!29960) (Cons!29959 (h!31177 (_ BitVec 64)) (t!43561 List!29963)) )
))
(declare-fun arrayNoDuplicates!0 (array!87451 (_ BitVec 32) List!29963) Bool)

(assert (=> b!1310372 (= res!869529 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29960))))

(declare-fun mapNonEmpty!54424 () Bool)

(declare-fun mapRes!54424 () Bool)

(declare-fun tp!103722 () Bool)

(assert (=> mapNonEmpty!54424 (= mapRes!54424 (and tp!103722 e!747710))))

(declare-fun mapValue!54424 () ValueCell!16700)

(declare-fun mapKey!54424 () (_ BitVec 32))

(declare-fun mapRest!54424 () (Array (_ BitVec 32) ValueCell!16700))

(assert (=> mapNonEmpty!54424 (= (arr!42202 _values!1354) (store mapRest!54424 mapKey!54424 mapValue!54424))))

(declare-fun res!869530 () Bool)

(assert (=> start!110856 (=> (not res!869530) (not e!747707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110856 (= res!869530 (validMask!0 mask!2040))))

(assert (=> start!110856 e!747707))

(assert (=> start!110856 tp!103723))

(declare-fun array_inv!32159 (array!87451) Bool)

(assert (=> start!110856 (array_inv!32159 _keys!1628)))

(assert (=> start!110856 true))

(assert (=> start!110856 tp_is_empty!35197))

(declare-fun e!747709 () Bool)

(declare-fun array_inv!32160 (array!87453) Bool)

(assert (=> start!110856 (and (array_inv!32160 _values!1354) e!747709)))

(declare-fun b!1310373 () Bool)

(assert (=> b!1310373 (= e!747709 (and e!747708 mapRes!54424))))

(declare-fun condMapEmpty!54424 () Bool)

(declare-fun mapDefault!54424 () ValueCell!16700)

(assert (=> b!1310373 (= condMapEmpty!54424 (= (arr!42202 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16700)) mapDefault!54424)))))

(declare-fun mapIsEmpty!54424 () Bool)

(assert (=> mapIsEmpty!54424 mapRes!54424))

(assert (= (and start!110856 res!869530) b!1310369))

(assert (= (and b!1310369 res!869527) b!1310371))

(assert (= (and b!1310371 res!869531) b!1310372))

(assert (= (and b!1310372 res!869529) b!1310367))

(assert (= (and b!1310367 res!869528) b!1310370))

(assert (= (and b!1310373 condMapEmpty!54424) mapIsEmpty!54424))

(assert (= (and b!1310373 (not condMapEmpty!54424)) mapNonEmpty!54424))

(get-info :version)

(assert (= (and mapNonEmpty!54424 ((_ is ValueCellFull!16700) mapValue!54424)) b!1310366))

(assert (= (and b!1310373 ((_ is ValueCellFull!16700) mapDefault!54424)) b!1310368))

(assert (= start!110856 b!1310373))

(declare-fun m!1200869 () Bool)

(assert (=> b!1310370 m!1200869))

(assert (=> b!1310370 m!1200869))

(declare-fun m!1200871 () Bool)

(assert (=> b!1310370 m!1200871))

(declare-fun m!1200873 () Bool)

(assert (=> mapNonEmpty!54424 m!1200873))

(declare-fun m!1200875 () Bool)

(assert (=> b!1310372 m!1200875))

(declare-fun m!1200877 () Bool)

(assert (=> start!110856 m!1200877))

(declare-fun m!1200879 () Bool)

(assert (=> start!110856 m!1200879))

(declare-fun m!1200881 () Bool)

(assert (=> start!110856 m!1200881))

(declare-fun m!1200883 () Bool)

(assert (=> b!1310371 m!1200883))

(check-sat (not b!1310372) (not start!110856) (not b!1310371) (not mapNonEmpty!54424) (not b_next!29467) tp_is_empty!35197 (not b!1310370) b_and!47677)
(check-sat b_and!47677 (not b_next!29467))
