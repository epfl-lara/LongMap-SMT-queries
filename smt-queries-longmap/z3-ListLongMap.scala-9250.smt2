; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110850 () Bool)

(assert start!110850)

(declare-fun b_free!29685 () Bool)

(declare-fun b_next!29685 () Bool)

(assert (=> start!110850 (= b_free!29685 (not b_next!29685))))

(declare-fun tp!104376 () Bool)

(declare-fun b_and!47893 () Bool)

(assert (=> start!110850 (= tp!104376 b_and!47893)))

(declare-fun b!1312243 () Bool)

(declare-fun res!871210 () Bool)

(declare-fun e!748499 () Bool)

(assert (=> b!1312243 (=> (not res!871210) (not e!748499))))

(declare-datatypes ((array!87818 0))(
  ( (array!87819 (arr!42389 (Array (_ BitVec 32) (_ BitVec 64))) (size!42939 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87818)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87818 (_ BitVec 32)) Bool)

(assert (=> b!1312243 (= res!871210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54751 () Bool)

(declare-fun mapRes!54751 () Bool)

(assert (=> mapIsEmpty!54751 mapRes!54751))

(declare-fun res!871204 () Bool)

(assert (=> start!110850 (=> (not res!871204) (not e!748499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110850 (= res!871204 (validMask!0 mask!2040))))

(assert (=> start!110850 e!748499))

(assert (=> start!110850 tp!104376))

(declare-fun array_inv!32031 (array!87818) Bool)

(assert (=> start!110850 (array_inv!32031 _keys!1628)))

(assert (=> start!110850 true))

(declare-fun tp_is_empty!35415 () Bool)

(assert (=> start!110850 tp_is_empty!35415))

(declare-datatypes ((V!52323 0))(
  ( (V!52324 (val!17782 Int)) )
))
(declare-datatypes ((ValueCell!16809 0))(
  ( (ValueCellFull!16809 (v!20409 V!52323)) (EmptyCell!16809) )
))
(declare-datatypes ((array!87820 0))(
  ( (array!87821 (arr!42390 (Array (_ BitVec 32) ValueCell!16809)) (size!42940 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87820)

(declare-fun e!748500 () Bool)

(declare-fun array_inv!32032 (array!87820) Bool)

(assert (=> start!110850 (and (array_inv!32032 _values!1354) e!748500)))

(declare-fun b!1312244 () Bool)

(assert (=> b!1312244 (= e!748499 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52323)

(declare-fun zeroValue!1296 () V!52323)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22920 0))(
  ( (tuple2!22921 (_1!11471 (_ BitVec 64)) (_2!11471 V!52323)) )
))
(declare-datatypes ((List!30058 0))(
  ( (Nil!30055) (Cons!30054 (h!31263 tuple2!22920) (t!43664 List!30058)) )
))
(declare-datatypes ((ListLongMap!20577 0))(
  ( (ListLongMap!20578 (toList!10304 List!30058)) )
))
(declare-fun contains!8454 (ListLongMap!20577 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5317 (array!87818 array!87820 (_ BitVec 32) (_ BitVec 32) V!52323 V!52323 (_ BitVec 32) Int) ListLongMap!20577)

(assert (=> b!1312244 (contains!8454 (getCurrentListMap!5317 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43374 0))(
  ( (Unit!43375) )
))
(declare-fun lt!585546 () Unit!43374)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!14 (array!87818 array!87820 (_ BitVec 32) (_ BitVec 32) V!52323 V!52323 (_ BitVec 64) (_ BitVec 32) Int) Unit!43374)

(assert (=> b!1312244 (= lt!585546 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!14 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1312245 () Bool)

(declare-fun res!871211 () Bool)

(assert (=> b!1312245 (=> (not res!871211) (not e!748499))))

(assert (=> b!1312245 (= res!871211 (contains!8454 (getCurrentListMap!5317 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312246 () Bool)

(declare-fun res!871208 () Bool)

(assert (=> b!1312246 (=> (not res!871208) (not e!748499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312246 (= res!871208 (validKeyInArray!0 (select (arr!42389 _keys!1628) from!2020)))))

(declare-fun b!1312247 () Bool)

(declare-fun e!748501 () Bool)

(assert (=> b!1312247 (= e!748500 (and e!748501 mapRes!54751))))

(declare-fun condMapEmpty!54751 () Bool)

(declare-fun mapDefault!54751 () ValueCell!16809)

(assert (=> b!1312247 (= condMapEmpty!54751 (= (arr!42390 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16809)) mapDefault!54751)))))

(declare-fun b!1312248 () Bool)

(declare-fun res!871206 () Bool)

(assert (=> b!1312248 (=> (not res!871206) (not e!748499))))

(assert (=> b!1312248 (= res!871206 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42939 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312249 () Bool)

(declare-fun res!871207 () Bool)

(assert (=> b!1312249 (=> (not res!871207) (not e!748499))))

(assert (=> b!1312249 (= res!871207 (not (= (select (arr!42389 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1312250 () Bool)

(declare-fun res!871212 () Bool)

(assert (=> b!1312250 (=> (not res!871212) (not e!748499))))

(assert (=> b!1312250 (= res!871212 (and (= (size!42940 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42939 _keys!1628) (size!42940 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54751 () Bool)

(declare-fun tp!104377 () Bool)

(declare-fun e!748502 () Bool)

(assert (=> mapNonEmpty!54751 (= mapRes!54751 (and tp!104377 e!748502))))

(declare-fun mapKey!54751 () (_ BitVec 32))

(declare-fun mapValue!54751 () ValueCell!16809)

(declare-fun mapRest!54751 () (Array (_ BitVec 32) ValueCell!16809))

(assert (=> mapNonEmpty!54751 (= (arr!42390 _values!1354) (store mapRest!54751 mapKey!54751 mapValue!54751))))

(declare-fun b!1312251 () Bool)

(declare-fun res!871205 () Bool)

(assert (=> b!1312251 (=> (not res!871205) (not e!748499))))

(declare-datatypes ((List!30059 0))(
  ( (Nil!30056) (Cons!30055 (h!31264 (_ BitVec 64)) (t!43665 List!30059)) )
))
(declare-fun arrayNoDuplicates!0 (array!87818 (_ BitVec 32) List!30059) Bool)

(assert (=> b!1312251 (= res!871205 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30056))))

(declare-fun b!1312252 () Bool)

(assert (=> b!1312252 (= e!748502 tp_is_empty!35415)))

(declare-fun b!1312253 () Bool)

(declare-fun res!871209 () Bool)

(assert (=> b!1312253 (=> (not res!871209) (not e!748499))))

(assert (=> b!1312253 (= res!871209 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1312254 () Bool)

(assert (=> b!1312254 (= e!748501 tp_is_empty!35415)))

(assert (= (and start!110850 res!871204) b!1312250))

(assert (= (and b!1312250 res!871212) b!1312243))

(assert (= (and b!1312243 res!871210) b!1312251))

(assert (= (and b!1312251 res!871205) b!1312248))

(assert (= (and b!1312248 res!871206) b!1312245))

(assert (= (and b!1312245 res!871211) b!1312249))

(assert (= (and b!1312249 res!871207) b!1312246))

(assert (= (and b!1312246 res!871208) b!1312253))

(assert (= (and b!1312253 res!871209) b!1312244))

(assert (= (and b!1312247 condMapEmpty!54751) mapIsEmpty!54751))

(assert (= (and b!1312247 (not condMapEmpty!54751)) mapNonEmpty!54751))

(get-info :version)

(assert (= (and mapNonEmpty!54751 ((_ is ValueCellFull!16809) mapValue!54751)) b!1312252))

(assert (= (and b!1312247 ((_ is ValueCellFull!16809) mapDefault!54751)) b!1312254))

(assert (= start!110850 b!1312247))

(declare-fun m!1201475 () Bool)

(assert (=> start!110850 m!1201475))

(declare-fun m!1201477 () Bool)

(assert (=> start!110850 m!1201477))

(declare-fun m!1201479 () Bool)

(assert (=> start!110850 m!1201479))

(declare-fun m!1201481 () Bool)

(assert (=> b!1312244 m!1201481))

(assert (=> b!1312244 m!1201481))

(declare-fun m!1201483 () Bool)

(assert (=> b!1312244 m!1201483))

(declare-fun m!1201485 () Bool)

(assert (=> b!1312244 m!1201485))

(declare-fun m!1201487 () Bool)

(assert (=> b!1312243 m!1201487))

(declare-fun m!1201489 () Bool)

(assert (=> b!1312251 m!1201489))

(declare-fun m!1201491 () Bool)

(assert (=> b!1312249 m!1201491))

(declare-fun m!1201493 () Bool)

(assert (=> b!1312245 m!1201493))

(assert (=> b!1312245 m!1201493))

(declare-fun m!1201495 () Bool)

(assert (=> b!1312245 m!1201495))

(declare-fun m!1201497 () Bool)

(assert (=> mapNonEmpty!54751 m!1201497))

(assert (=> b!1312246 m!1201491))

(assert (=> b!1312246 m!1201491))

(declare-fun m!1201499 () Bool)

(assert (=> b!1312246 m!1201499))

(check-sat (not b!1312245) (not b!1312246) (not b!1312251) (not mapNonEmpty!54751) b_and!47893 (not start!110850) (not b_next!29685) (not b!1312244) tp_is_empty!35415 (not b!1312243))
(check-sat b_and!47893 (not b_next!29685))
