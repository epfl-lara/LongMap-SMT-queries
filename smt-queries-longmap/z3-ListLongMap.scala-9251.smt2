; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110854 () Bool)

(assert start!110854)

(declare-fun b_free!29689 () Bool)

(declare-fun b_next!29689 () Bool)

(assert (=> start!110854 (= b_free!29689 (not b_next!29689))))

(declare-fun tp!104389 () Bool)

(declare-fun b_and!47879 () Bool)

(assert (=> start!110854 (= tp!104389 b_and!47879)))

(declare-fun b!1312245 () Bool)

(declare-fun res!871229 () Bool)

(declare-fun e!748497 () Bool)

(assert (=> b!1312245 (=> (not res!871229) (not e!748497))))

(declare-datatypes ((array!87731 0))(
  ( (array!87732 (arr!42346 (Array (_ BitVec 32) (_ BitVec 64))) (size!42898 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87731)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87731 (_ BitVec 32)) Bool)

(assert (=> b!1312245 (= res!871229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54757 () Bool)

(declare-fun mapRes!54757 () Bool)

(assert (=> mapIsEmpty!54757 mapRes!54757))

(declare-fun b!1312246 () Bool)

(declare-fun res!871233 () Bool)

(assert (=> b!1312246 (=> (not res!871233) (not e!748497))))

(declare-datatypes ((V!52329 0))(
  ( (V!52330 (val!17784 Int)) )
))
(declare-datatypes ((ValueCell!16811 0))(
  ( (ValueCellFull!16811 (v!20410 V!52329)) (EmptyCell!16811) )
))
(declare-datatypes ((array!87733 0))(
  ( (array!87734 (arr!42347 (Array (_ BitVec 32) ValueCell!16811)) (size!42899 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87733)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312246 (= res!871233 (and (= (size!42899 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42898 _keys!1628) (size!42899 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312247 () Bool)

(declare-fun e!748498 () Bool)

(declare-fun tp_is_empty!35419 () Bool)

(assert (=> b!1312247 (= e!748498 tp_is_empty!35419)))

(declare-fun res!871235 () Bool)

(assert (=> start!110854 (=> (not res!871235) (not e!748497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110854 (= res!871235 (validMask!0 mask!2040))))

(assert (=> start!110854 e!748497))

(assert (=> start!110854 tp!104389))

(declare-fun array_inv!32183 (array!87731) Bool)

(assert (=> start!110854 (array_inv!32183 _keys!1628)))

(assert (=> start!110854 true))

(assert (=> start!110854 tp_is_empty!35419))

(declare-fun e!748499 () Bool)

(declare-fun array_inv!32184 (array!87733) Bool)

(assert (=> start!110854 (and (array_inv!32184 _values!1354) e!748499)))

(declare-fun b!1312248 () Bool)

(declare-fun res!871234 () Bool)

(assert (=> b!1312248 (=> (not res!871234) (not e!748497))))

(declare-datatypes ((List!30132 0))(
  ( (Nil!30129) (Cons!30128 (h!31337 (_ BitVec 64)) (t!43730 List!30132)) )
))
(declare-fun arrayNoDuplicates!0 (array!87731 (_ BitVec 32) List!30132) Bool)

(assert (=> b!1312248 (= res!871234 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30129))))

(declare-fun b!1312249 () Bool)

(declare-fun res!871232 () Bool)

(assert (=> b!1312249 (=> (not res!871232) (not e!748497))))

(assert (=> b!1312249 (= res!871232 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1312250 () Bool)

(declare-fun res!871230 () Bool)

(assert (=> b!1312250 (=> (not res!871230) (not e!748497))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312250 (= res!871230 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42898 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312251 () Bool)

(assert (=> b!1312251 (= e!748499 (and e!748498 mapRes!54757))))

(declare-fun condMapEmpty!54757 () Bool)

(declare-fun mapDefault!54757 () ValueCell!16811)

(assert (=> b!1312251 (= condMapEmpty!54757 (= (arr!42347 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16811)) mapDefault!54757)))))

(declare-fun b!1312252 () Bool)

(declare-fun e!748496 () Bool)

(assert (=> b!1312252 (= e!748496 tp_is_empty!35419)))

(declare-fun b!1312253 () Bool)

(declare-fun res!871237 () Bool)

(assert (=> b!1312253 (=> (not res!871237) (not e!748497))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52329)

(declare-fun zeroValue!1296 () V!52329)

(declare-datatypes ((tuple2!23012 0))(
  ( (tuple2!23013 (_1!11517 (_ BitVec 64)) (_2!11517 V!52329)) )
))
(declare-datatypes ((List!30133 0))(
  ( (Nil!30130) (Cons!30129 (h!31338 tuple2!23012) (t!43731 List!30133)) )
))
(declare-datatypes ((ListLongMap!20669 0))(
  ( (ListLongMap!20670 (toList!10350 List!30133)) )
))
(declare-fun contains!8427 (ListLongMap!20669 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5245 (array!87731 array!87733 (_ BitVec 32) (_ BitVec 32) V!52329 V!52329 (_ BitVec 32) Int) ListLongMap!20669)

(assert (=> b!1312253 (= res!871237 (contains!8427 (getCurrentListMap!5245 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312254 () Bool)

(declare-fun res!871231 () Bool)

(assert (=> b!1312254 (=> (not res!871231) (not e!748497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312254 (= res!871231 (validKeyInArray!0 (select (arr!42346 _keys!1628) from!2020)))))

(declare-fun mapNonEmpty!54757 () Bool)

(declare-fun tp!104390 () Bool)

(assert (=> mapNonEmpty!54757 (= mapRes!54757 (and tp!104390 e!748496))))

(declare-fun mapKey!54757 () (_ BitVec 32))

(declare-fun mapValue!54757 () ValueCell!16811)

(declare-fun mapRest!54757 () (Array (_ BitVec 32) ValueCell!16811))

(assert (=> mapNonEmpty!54757 (= (arr!42347 _values!1354) (store mapRest!54757 mapKey!54757 mapValue!54757))))

(declare-fun b!1312255 () Bool)

(assert (=> b!1312255 (= e!748497 (not true))))

(assert (=> b!1312255 (contains!8427 (getCurrentListMap!5245 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43213 0))(
  ( (Unit!43214) )
))
(declare-fun lt!585366 () Unit!43213)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!17 (array!87731 array!87733 (_ BitVec 32) (_ BitVec 32) V!52329 V!52329 (_ BitVec 64) (_ BitVec 32) Int) Unit!43213)

(assert (=> b!1312255 (= lt!585366 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!17 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1312256 () Bool)

(declare-fun res!871236 () Bool)

(assert (=> b!1312256 (=> (not res!871236) (not e!748497))))

(assert (=> b!1312256 (= res!871236 (not (= (select (arr!42346 _keys!1628) from!2020) k0!1175)))))

(assert (= (and start!110854 res!871235) b!1312246))

(assert (= (and b!1312246 res!871233) b!1312245))

(assert (= (and b!1312245 res!871229) b!1312248))

(assert (= (and b!1312248 res!871234) b!1312250))

(assert (= (and b!1312250 res!871230) b!1312253))

(assert (= (and b!1312253 res!871237) b!1312256))

(assert (= (and b!1312256 res!871236) b!1312254))

(assert (= (and b!1312254 res!871231) b!1312249))

(assert (= (and b!1312249 res!871232) b!1312255))

(assert (= (and b!1312251 condMapEmpty!54757) mapIsEmpty!54757))

(assert (= (and b!1312251 (not condMapEmpty!54757)) mapNonEmpty!54757))

(get-info :version)

(assert (= (and mapNonEmpty!54757 ((_ is ValueCellFull!16811) mapValue!54757)) b!1312252))

(assert (= (and b!1312251 ((_ is ValueCellFull!16811) mapDefault!54757)) b!1312247))

(assert (= start!110854 b!1312251))

(declare-fun m!1201011 () Bool)

(assert (=> b!1312256 m!1201011))

(declare-fun m!1201013 () Bool)

(assert (=> b!1312248 m!1201013))

(declare-fun m!1201015 () Bool)

(assert (=> mapNonEmpty!54757 m!1201015))

(declare-fun m!1201017 () Bool)

(assert (=> b!1312255 m!1201017))

(assert (=> b!1312255 m!1201017))

(declare-fun m!1201019 () Bool)

(assert (=> b!1312255 m!1201019))

(declare-fun m!1201021 () Bool)

(assert (=> b!1312255 m!1201021))

(assert (=> b!1312254 m!1201011))

(assert (=> b!1312254 m!1201011))

(declare-fun m!1201023 () Bool)

(assert (=> b!1312254 m!1201023))

(declare-fun m!1201025 () Bool)

(assert (=> b!1312245 m!1201025))

(declare-fun m!1201027 () Bool)

(assert (=> start!110854 m!1201027))

(declare-fun m!1201029 () Bool)

(assert (=> start!110854 m!1201029))

(declare-fun m!1201031 () Bool)

(assert (=> start!110854 m!1201031))

(declare-fun m!1201033 () Bool)

(assert (=> b!1312253 m!1201033))

(assert (=> b!1312253 m!1201033))

(declare-fun m!1201035 () Bool)

(assert (=> b!1312253 m!1201035))

(check-sat (not b!1312255) (not b!1312248) (not b_next!29689) (not mapNonEmpty!54757) (not b!1312253) (not b!1312245) (not start!110854) (not b!1312254) b_and!47879 tp_is_empty!35419)
(check-sat b_and!47879 (not b_next!29689))
