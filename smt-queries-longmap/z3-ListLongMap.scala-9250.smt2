; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111072 () Bool)

(assert start!111072)

(declare-fun b_free!29683 () Bool)

(declare-fun b_next!29683 () Bool)

(assert (=> start!111072 (= b_free!29683 (not b_next!29683))))

(declare-fun tp!104371 () Bool)

(declare-fun b_and!47893 () Bool)

(assert (=> start!111072 (= tp!104371 b_and!47893)))

(declare-fun mapNonEmpty!54748 () Bool)

(declare-fun mapRes!54748 () Bool)

(declare-fun tp!104370 () Bool)

(declare-fun e!749328 () Bool)

(assert (=> mapNonEmpty!54748 (= mapRes!54748 (and tp!104370 e!749328))))

(declare-fun mapKey!54748 () (_ BitVec 32))

(declare-datatypes ((V!52321 0))(
  ( (V!52322 (val!17781 Int)) )
))
(declare-datatypes ((ValueCell!16808 0))(
  ( (ValueCellFull!16808 (v!20403 V!52321)) (EmptyCell!16808) )
))
(declare-datatypes ((array!87863 0))(
  ( (array!87864 (arr!42407 (Array (_ BitVec 32) ValueCell!16808)) (size!42958 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87863)

(declare-fun mapRest!54748 () (Array (_ BitVec 32) ValueCell!16808))

(declare-fun mapValue!54748 () ValueCell!16808)

(assert (=> mapNonEmpty!54748 (= (arr!42407 _values!1354) (store mapRest!54748 mapKey!54748 mapValue!54748))))

(declare-fun b!1313506 () Bool)

(declare-fun res!871697 () Bool)

(declare-fun e!749329 () Bool)

(assert (=> b!1313506 (=> (not res!871697) (not e!749329))))

(declare-datatypes ((array!87865 0))(
  ( (array!87866 (arr!42408 (Array (_ BitVec 32) (_ BitVec 64))) (size!42959 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87865)

(declare-datatypes ((List!30103 0))(
  ( (Nil!30100) (Cons!30099 (h!31317 (_ BitVec 64)) (t!43701 List!30103)) )
))
(declare-fun arrayNoDuplicates!0 (array!87865 (_ BitVec 32) List!30103) Bool)

(assert (=> b!1313506 (= res!871697 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30100))))

(declare-fun b!1313507 () Bool)

(declare-fun e!749327 () Bool)

(declare-fun e!749326 () Bool)

(assert (=> b!1313507 (= e!749327 (and e!749326 mapRes!54748))))

(declare-fun condMapEmpty!54748 () Bool)

(declare-fun mapDefault!54748 () ValueCell!16808)

(assert (=> b!1313507 (= condMapEmpty!54748 (= (arr!42407 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16808)) mapDefault!54748)))))

(declare-fun b!1313508 () Bool)

(declare-fun res!871699 () Bool)

(assert (=> b!1313508 (=> (not res!871699) (not e!749329))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313508 (= res!871699 (not (= (select (arr!42408 _keys!1628) from!2020) k0!1175)))))

(declare-fun res!871695 () Bool)

(assert (=> start!111072 (=> (not res!871695) (not e!749329))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111072 (= res!871695 (validMask!0 mask!2040))))

(assert (=> start!111072 e!749329))

(assert (=> start!111072 tp!104371))

(declare-fun array_inv!32299 (array!87865) Bool)

(assert (=> start!111072 (array_inv!32299 _keys!1628)))

(assert (=> start!111072 true))

(declare-fun tp_is_empty!35413 () Bool)

(assert (=> start!111072 tp_is_empty!35413))

(declare-fun array_inv!32300 (array!87863) Bool)

(assert (=> start!111072 (and (array_inv!32300 _values!1354) e!749327)))

(declare-fun b!1313509 () Bool)

(assert (=> b!1313509 (= e!749328 tp_is_empty!35413)))

(declare-fun b!1313510 () Bool)

(declare-fun res!871698 () Bool)

(assert (=> b!1313510 (=> (not res!871698) (not e!749329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87865 (_ BitVec 32)) Bool)

(assert (=> b!1313510 (= res!871698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54748 () Bool)

(assert (=> mapIsEmpty!54748 mapRes!54748))

(declare-fun b!1313511 () Bool)

(declare-fun res!871700 () Bool)

(assert (=> b!1313511 (=> (not res!871700) (not e!749329))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313511 (= res!871700 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1313512 () Bool)

(assert (=> b!1313512 (= e!749329 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52321)

(declare-fun zeroValue!1296 () V!52321)

(declare-datatypes ((tuple2!22950 0))(
  ( (tuple2!22951 (_1!11486 (_ BitVec 64)) (_2!11486 V!52321)) )
))
(declare-datatypes ((List!30104 0))(
  ( (Nil!30101) (Cons!30100 (h!31318 tuple2!22950) (t!43702 List!30104)) )
))
(declare-datatypes ((ListLongMap!20615 0))(
  ( (ListLongMap!20616 (toList!10323 List!30104)) )
))
(declare-fun contains!8485 (ListLongMap!20615 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5327 (array!87865 array!87863 (_ BitVec 32) (_ BitVec 32) V!52321 V!52321 (_ BitVec 32) Int) ListLongMap!20615)

(assert (=> b!1313512 (contains!8485 (getCurrentListMap!5327 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43339 0))(
  ( (Unit!43340) )
))
(declare-fun lt!586019 () Unit!43339)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!10 (array!87865 array!87863 (_ BitVec 32) (_ BitVec 32) V!52321 V!52321 (_ BitVec 64) (_ BitVec 32) Int) Unit!43339)

(assert (=> b!1313512 (= lt!586019 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!10 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1313513 () Bool)

(declare-fun res!871696 () Bool)

(assert (=> b!1313513 (=> (not res!871696) (not e!749329))))

(assert (=> b!1313513 (= res!871696 (contains!8485 (getCurrentListMap!5327 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313514 () Bool)

(declare-fun res!871702 () Bool)

(assert (=> b!1313514 (=> (not res!871702) (not e!749329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1313514 (= res!871702 (validKeyInArray!0 (select (arr!42408 _keys!1628) from!2020)))))

(declare-fun b!1313515 () Bool)

(declare-fun res!871703 () Bool)

(assert (=> b!1313515 (=> (not res!871703) (not e!749329))))

(assert (=> b!1313515 (= res!871703 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42959 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313516 () Bool)

(assert (=> b!1313516 (= e!749326 tp_is_empty!35413)))

(declare-fun b!1313517 () Bool)

(declare-fun res!871701 () Bool)

(assert (=> b!1313517 (=> (not res!871701) (not e!749329))))

(assert (=> b!1313517 (= res!871701 (and (= (size!42958 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42959 _keys!1628) (size!42958 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!111072 res!871695) b!1313517))

(assert (= (and b!1313517 res!871701) b!1313510))

(assert (= (and b!1313510 res!871698) b!1313506))

(assert (= (and b!1313506 res!871697) b!1313515))

(assert (= (and b!1313515 res!871703) b!1313513))

(assert (= (and b!1313513 res!871696) b!1313508))

(assert (= (and b!1313508 res!871699) b!1313514))

(assert (= (and b!1313514 res!871702) b!1313511))

(assert (= (and b!1313511 res!871700) b!1313512))

(assert (= (and b!1313507 condMapEmpty!54748) mapIsEmpty!54748))

(assert (= (and b!1313507 (not condMapEmpty!54748)) mapNonEmpty!54748))

(get-info :version)

(assert (= (and mapNonEmpty!54748 ((_ is ValueCellFull!16808) mapValue!54748)) b!1313509))

(assert (= (and b!1313507 ((_ is ValueCellFull!16808) mapDefault!54748)) b!1313516))

(assert (= start!111072 b!1313507))

(declare-fun m!1203047 () Bool)

(assert (=> start!111072 m!1203047))

(declare-fun m!1203049 () Bool)

(assert (=> start!111072 m!1203049))

(declare-fun m!1203051 () Bool)

(assert (=> start!111072 m!1203051))

(declare-fun m!1203053 () Bool)

(assert (=> b!1313514 m!1203053))

(assert (=> b!1313514 m!1203053))

(declare-fun m!1203055 () Bool)

(assert (=> b!1313514 m!1203055))

(declare-fun m!1203057 () Bool)

(assert (=> b!1313513 m!1203057))

(assert (=> b!1313513 m!1203057))

(declare-fun m!1203059 () Bool)

(assert (=> b!1313513 m!1203059))

(declare-fun m!1203061 () Bool)

(assert (=> b!1313510 m!1203061))

(assert (=> b!1313508 m!1203053))

(declare-fun m!1203063 () Bool)

(assert (=> b!1313512 m!1203063))

(assert (=> b!1313512 m!1203063))

(declare-fun m!1203065 () Bool)

(assert (=> b!1313512 m!1203065))

(declare-fun m!1203067 () Bool)

(assert (=> b!1313512 m!1203067))

(declare-fun m!1203069 () Bool)

(assert (=> b!1313506 m!1203069))

(declare-fun m!1203071 () Bool)

(assert (=> mapNonEmpty!54748 m!1203071))

(check-sat (not b!1313514) (not b!1313506) (not start!111072) (not b!1313510) b_and!47893 tp_is_empty!35413 (not b!1313513) (not b_next!29683) (not b!1313512) (not mapNonEmpty!54748))
(check-sat b_and!47893 (not b_next!29683))
