; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110808 () Bool)

(assert start!110808)

(declare-fun b_free!29419 () Bool)

(declare-fun b_next!29419 () Bool)

(assert (=> start!110808 (= b_free!29419 (not b_next!29419))))

(declare-fun tp!103578 () Bool)

(declare-fun b_and!47629 () Bool)

(assert (=> start!110808 (= tp!103578 b_and!47629)))

(declare-fun b!1309618 () Bool)

(declare-fun e!747347 () Bool)

(declare-fun tp_is_empty!35149 () Bool)

(assert (=> b!1309618 (= e!747347 tp_is_empty!35149)))

(declare-fun b!1309619 () Bool)

(declare-fun e!747348 () Bool)

(assert (=> b!1309619 (= e!747348 tp_is_empty!35149)))

(declare-fun b!1309620 () Bool)

(declare-fun res!868995 () Bool)

(declare-fun e!747350 () Bool)

(assert (=> b!1309620 (=> (not res!868995) (not e!747350))))

(declare-datatypes ((array!87355 0))(
  ( (array!87356 (arr!42153 (Array (_ BitVec 32) (_ BitVec 64))) (size!42704 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87355)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51969 0))(
  ( (V!51970 (val!17649 Int)) )
))
(declare-datatypes ((ValueCell!16676 0))(
  ( (ValueCellFull!16676 (v!20271 V!51969)) (EmptyCell!16676) )
))
(declare-datatypes ((array!87357 0))(
  ( (array!87358 (arr!42154 (Array (_ BitVec 32) ValueCell!16676)) (size!42705 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87357)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309620 (= res!868995 (and (= (size!42705 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42704 _keys!1628) (size!42705 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309621 () Bool)

(assert (=> b!1309621 (= e!747350 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!51969)

(declare-fun zeroValue!1296 () V!51969)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22762 0))(
  ( (tuple2!22763 (_1!11392 (_ BitVec 64)) (_2!11392 V!51969)) )
))
(declare-datatypes ((List!29923 0))(
  ( (Nil!29920) (Cons!29919 (h!31137 tuple2!22762) (t!43521 List!29923)) )
))
(declare-datatypes ((ListLongMap!20427 0))(
  ( (ListLongMap!20428 (toList!10229 List!29923)) )
))
(declare-fun contains!8391 (ListLongMap!20427 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5233 (array!87355 array!87357 (_ BitVec 32) (_ BitVec 32) V!51969 V!51969 (_ BitVec 32) Int) ListLongMap!20427)

(assert (=> b!1309621 (contains!8391 (getCurrentListMap!5233 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43257 0))(
  ( (Unit!43258) )
))
(declare-fun lt!585623 () Unit!43257)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!9 (array!87355 array!87357 (_ BitVec 32) (_ BitVec 32) V!51969 V!51969 (_ BitVec 64) (_ BitVec 32) Int) Unit!43257)

(assert (=> b!1309621 (= lt!585623 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!9 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1309622 () Bool)

(declare-fun res!869001 () Bool)

(assert (=> b!1309622 (=> (not res!869001) (not e!747350))))

(assert (=> b!1309622 (= res!869001 (contains!8391 (getCurrentListMap!5233 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309623 () Bool)

(declare-fun res!869002 () Bool)

(assert (=> b!1309623 (=> (not res!869002) (not e!747350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87355 (_ BitVec 32)) Bool)

(assert (=> b!1309623 (= res!869002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309624 () Bool)

(declare-fun res!869003 () Bool)

(assert (=> b!1309624 (=> (not res!869003) (not e!747350))))

(assert (=> b!1309624 (= res!869003 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42704 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!868998 () Bool)

(assert (=> start!110808 (=> (not res!868998) (not e!747350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110808 (= res!868998 (validMask!0 mask!2040))))

(assert (=> start!110808 e!747350))

(assert (=> start!110808 tp!103578))

(declare-fun array_inv!32119 (array!87355) Bool)

(assert (=> start!110808 (array_inv!32119 _keys!1628)))

(assert (=> start!110808 true))

(assert (=> start!110808 tp_is_empty!35149))

(declare-fun e!747349 () Bool)

(declare-fun array_inv!32120 (array!87357) Bool)

(assert (=> start!110808 (and (array_inv!32120 _values!1354) e!747349)))

(declare-fun b!1309625 () Bool)

(declare-fun res!869000 () Bool)

(assert (=> b!1309625 (=> (not res!869000) (not e!747350))))

(assert (=> b!1309625 (= res!869000 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!54352 () Bool)

(declare-fun mapRes!54352 () Bool)

(assert (=> mapIsEmpty!54352 mapRes!54352))

(declare-fun b!1309626 () Bool)

(declare-fun res!868997 () Bool)

(assert (=> b!1309626 (=> (not res!868997) (not e!747350))))

(declare-datatypes ((List!29924 0))(
  ( (Nil!29921) (Cons!29920 (h!31138 (_ BitVec 64)) (t!43522 List!29924)) )
))
(declare-fun arrayNoDuplicates!0 (array!87355 (_ BitVec 32) List!29924) Bool)

(assert (=> b!1309626 (= res!868997 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29921))))

(declare-fun b!1309627 () Bool)

(assert (=> b!1309627 (= e!747349 (and e!747348 mapRes!54352))))

(declare-fun condMapEmpty!54352 () Bool)

(declare-fun mapDefault!54352 () ValueCell!16676)

(assert (=> b!1309627 (= condMapEmpty!54352 (= (arr!42154 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16676)) mapDefault!54352)))))

(declare-fun b!1309628 () Bool)

(declare-fun res!868999 () Bool)

(assert (=> b!1309628 (=> (not res!868999) (not e!747350))))

(assert (=> b!1309628 (= res!868999 (not (= (select (arr!42153 _keys!1628) from!2020) k0!1175)))))

(declare-fun mapNonEmpty!54352 () Bool)

(declare-fun tp!103579 () Bool)

(assert (=> mapNonEmpty!54352 (= mapRes!54352 (and tp!103579 e!747347))))

(declare-fun mapValue!54352 () ValueCell!16676)

(declare-fun mapKey!54352 () (_ BitVec 32))

(declare-fun mapRest!54352 () (Array (_ BitVec 32) ValueCell!16676))

(assert (=> mapNonEmpty!54352 (= (arr!42154 _values!1354) (store mapRest!54352 mapKey!54352 mapValue!54352))))

(declare-fun b!1309629 () Bool)

(declare-fun res!868996 () Bool)

(assert (=> b!1309629 (=> (not res!868996) (not e!747350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309629 (= res!868996 (validKeyInArray!0 (select (arr!42153 _keys!1628) from!2020)))))

(assert (= (and start!110808 res!868998) b!1309620))

(assert (= (and b!1309620 res!868995) b!1309623))

(assert (= (and b!1309623 res!869002) b!1309626))

(assert (= (and b!1309626 res!868997) b!1309624))

(assert (= (and b!1309624 res!869003) b!1309622))

(assert (= (and b!1309622 res!869001) b!1309628))

(assert (= (and b!1309628 res!868999) b!1309629))

(assert (= (and b!1309629 res!868996) b!1309625))

(assert (= (and b!1309625 res!869000) b!1309621))

(assert (= (and b!1309627 condMapEmpty!54352) mapIsEmpty!54352))

(assert (= (and b!1309627 (not condMapEmpty!54352)) mapNonEmpty!54352))

(get-info :version)

(assert (= (and mapNonEmpty!54352 ((_ is ValueCellFull!16676) mapValue!54352)) b!1309618))

(assert (= (and b!1309627 ((_ is ValueCellFull!16676) mapDefault!54352)) b!1309619))

(assert (= start!110808 b!1309627))

(declare-fun m!1200335 () Bool)

(assert (=> b!1309628 m!1200335))

(declare-fun m!1200337 () Bool)

(assert (=> b!1309622 m!1200337))

(assert (=> b!1309622 m!1200337))

(declare-fun m!1200339 () Bool)

(assert (=> b!1309622 m!1200339))

(declare-fun m!1200341 () Bool)

(assert (=> start!110808 m!1200341))

(declare-fun m!1200343 () Bool)

(assert (=> start!110808 m!1200343))

(declare-fun m!1200345 () Bool)

(assert (=> start!110808 m!1200345))

(declare-fun m!1200347 () Bool)

(assert (=> b!1309621 m!1200347))

(assert (=> b!1309621 m!1200347))

(declare-fun m!1200349 () Bool)

(assert (=> b!1309621 m!1200349))

(declare-fun m!1200351 () Bool)

(assert (=> b!1309621 m!1200351))

(declare-fun m!1200353 () Bool)

(assert (=> mapNonEmpty!54352 m!1200353))

(declare-fun m!1200355 () Bool)

(assert (=> b!1309623 m!1200355))

(assert (=> b!1309629 m!1200335))

(assert (=> b!1309629 m!1200335))

(declare-fun m!1200357 () Bool)

(assert (=> b!1309629 m!1200357))

(declare-fun m!1200359 () Bool)

(assert (=> b!1309626 m!1200359))

(check-sat (not b!1309629) (not b!1309621) (not start!110808) tp_is_empty!35149 (not b!1309623) (not b!1309626) (not b!1309622) (not b_next!29419) (not mapNonEmpty!54352) b_and!47629)
(check-sat b_and!47629 (not b_next!29419))
