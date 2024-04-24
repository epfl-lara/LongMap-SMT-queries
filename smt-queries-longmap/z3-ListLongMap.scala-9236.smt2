; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110988 () Bool)

(assert start!110988)

(declare-fun b_free!29599 () Bool)

(declare-fun b_next!29599 () Bool)

(assert (=> start!110988 (= b_free!29599 (not b_next!29599))))

(declare-fun tp!104118 () Bool)

(declare-fun b_and!47809 () Bool)

(assert (=> start!110988 (= tp!104118 b_and!47809)))

(declare-fun b!1312274 () Bool)

(declare-fun res!870845 () Bool)

(declare-fun e!748700 () Bool)

(assert (=> b!1312274 (=> (not res!870845) (not e!748700))))

(declare-datatypes ((array!87699 0))(
  ( (array!87700 (arr!42325 (Array (_ BitVec 32) (_ BitVec 64))) (size!42876 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87699)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87699 (_ BitVec 32)) Bool)

(assert (=> b!1312274 (= res!870845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!870843 () Bool)

(assert (=> start!110988 (=> (not res!870843) (not e!748700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110988 (= res!870843 (validMask!0 mask!2040))))

(assert (=> start!110988 e!748700))

(assert (=> start!110988 tp!104118))

(declare-fun array_inv!32251 (array!87699) Bool)

(assert (=> start!110988 (array_inv!32251 _keys!1628)))

(assert (=> start!110988 true))

(declare-fun tp_is_empty!35329 () Bool)

(assert (=> start!110988 tp_is_empty!35329))

(declare-datatypes ((V!52209 0))(
  ( (V!52210 (val!17739 Int)) )
))
(declare-datatypes ((ValueCell!16766 0))(
  ( (ValueCellFull!16766 (v!20361 V!52209)) (EmptyCell!16766) )
))
(declare-datatypes ((array!87701 0))(
  ( (array!87702 (arr!42326 (Array (_ BitVec 32) ValueCell!16766)) (size!42877 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87701)

(declare-fun e!748696 () Bool)

(declare-fun array_inv!32252 (array!87701) Bool)

(assert (=> start!110988 (and (array_inv!32252 _values!1354) e!748696)))

(declare-fun b!1312275 () Bool)

(declare-fun res!870842 () Bool)

(assert (=> b!1312275 (=> (not res!870842) (not e!748700))))

(declare-datatypes ((List!30048 0))(
  ( (Nil!30045) (Cons!30044 (h!31262 (_ BitVec 64)) (t!43646 List!30048)) )
))
(declare-fun arrayNoDuplicates!0 (array!87699 (_ BitVec 32) List!30048) Bool)

(assert (=> b!1312275 (= res!870842 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30045))))

(declare-fun mapIsEmpty!54622 () Bool)

(declare-fun mapRes!54622 () Bool)

(assert (=> mapIsEmpty!54622 mapRes!54622))

(declare-fun b!1312276 () Bool)

(declare-fun e!748698 () Bool)

(assert (=> b!1312276 (= e!748698 tp_is_empty!35329)))

(declare-fun b!1312277 () Bool)

(assert (=> b!1312277 (= e!748700 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun zeroValue!1296 () V!52209)

(declare-fun lt!585893 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52209)

(declare-datatypes ((tuple2!22896 0))(
  ( (tuple2!22897 (_1!11459 (_ BitVec 64)) (_2!11459 V!52209)) )
))
(declare-datatypes ((List!30049 0))(
  ( (Nil!30046) (Cons!30045 (h!31263 tuple2!22896) (t!43647 List!30049)) )
))
(declare-datatypes ((ListLongMap!20561 0))(
  ( (ListLongMap!20562 (toList!10296 List!30049)) )
))
(declare-fun contains!8458 (ListLongMap!20561 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5300 (array!87699 array!87701 (_ BitVec 32) (_ BitVec 32) V!52209 V!52209 (_ BitVec 32) Int) ListLongMap!20561)

(assert (=> b!1312277 (= lt!585893 (contains!8458 (getCurrentListMap!5300 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312278 () Bool)

(declare-fun e!748697 () Bool)

(assert (=> b!1312278 (= e!748697 tp_is_empty!35329)))

(declare-fun b!1312279 () Bool)

(declare-fun res!870841 () Bool)

(assert (=> b!1312279 (=> (not res!870841) (not e!748700))))

(assert (=> b!1312279 (= res!870841 (and (= (size!42877 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42876 _keys!1628) (size!42877 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312280 () Bool)

(assert (=> b!1312280 (= e!748696 (and e!748698 mapRes!54622))))

(declare-fun condMapEmpty!54622 () Bool)

(declare-fun mapDefault!54622 () ValueCell!16766)

(assert (=> b!1312280 (= condMapEmpty!54622 (= (arr!42326 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16766)) mapDefault!54622)))))

(declare-fun b!1312281 () Bool)

(declare-fun res!870844 () Bool)

(assert (=> b!1312281 (=> (not res!870844) (not e!748700))))

(assert (=> b!1312281 (= res!870844 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42876 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54622 () Bool)

(declare-fun tp!104119 () Bool)

(assert (=> mapNonEmpty!54622 (= mapRes!54622 (and tp!104119 e!748697))))

(declare-fun mapValue!54622 () ValueCell!16766)

(declare-fun mapKey!54622 () (_ BitVec 32))

(declare-fun mapRest!54622 () (Array (_ BitVec 32) ValueCell!16766))

(assert (=> mapNonEmpty!54622 (= (arr!42326 _values!1354) (store mapRest!54622 mapKey!54622 mapValue!54622))))

(assert (= (and start!110988 res!870843) b!1312279))

(assert (= (and b!1312279 res!870841) b!1312274))

(assert (= (and b!1312274 res!870845) b!1312275))

(assert (= (and b!1312275 res!870842) b!1312281))

(assert (= (and b!1312281 res!870844) b!1312277))

(assert (= (and b!1312280 condMapEmpty!54622) mapIsEmpty!54622))

(assert (= (and b!1312280 (not condMapEmpty!54622)) mapNonEmpty!54622))

(get-info :version)

(assert (= (and mapNonEmpty!54622 ((_ is ValueCellFull!16766) mapValue!54622)) b!1312278))

(assert (= (and b!1312280 ((_ is ValueCellFull!16766) mapDefault!54622)) b!1312276))

(assert (= start!110988 b!1312280))

(declare-fun m!1202195 () Bool)

(assert (=> start!110988 m!1202195))

(declare-fun m!1202197 () Bool)

(assert (=> start!110988 m!1202197))

(declare-fun m!1202199 () Bool)

(assert (=> start!110988 m!1202199))

(declare-fun m!1202201 () Bool)

(assert (=> b!1312277 m!1202201))

(assert (=> b!1312277 m!1202201))

(declare-fun m!1202203 () Bool)

(assert (=> b!1312277 m!1202203))

(declare-fun m!1202205 () Bool)

(assert (=> mapNonEmpty!54622 m!1202205))

(declare-fun m!1202207 () Bool)

(assert (=> b!1312274 m!1202207))

(declare-fun m!1202209 () Bool)

(assert (=> b!1312275 m!1202209))

(check-sat (not b!1312274) (not start!110988) (not mapNonEmpty!54622) tp_is_empty!35329 (not b!1312277) (not b!1312275) b_and!47809 (not b_next!29599))
(check-sat b_and!47809 (not b_next!29599))
