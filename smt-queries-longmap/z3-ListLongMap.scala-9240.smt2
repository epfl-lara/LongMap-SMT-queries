; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111012 () Bool)

(assert start!111012)

(declare-fun b_free!29623 () Bool)

(declare-fun b_next!29623 () Bool)

(assert (=> start!111012 (= b_free!29623 (not b_next!29623))))

(declare-fun tp!104191 () Bool)

(declare-fun b_and!47833 () Bool)

(assert (=> start!111012 (= tp!104191 b_and!47833)))

(declare-fun mapIsEmpty!54658 () Bool)

(declare-fun mapRes!54658 () Bool)

(assert (=> mapIsEmpty!54658 mapRes!54658))

(declare-fun res!871025 () Bool)

(declare-fun e!748879 () Bool)

(assert (=> start!111012 (=> (not res!871025) (not e!748879))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111012 (= res!871025 (validMask!0 mask!2040))))

(assert (=> start!111012 e!748879))

(assert (=> start!111012 tp!104191))

(declare-datatypes ((array!87747 0))(
  ( (array!87748 (arr!42349 (Array (_ BitVec 32) (_ BitVec 64))) (size!42900 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87747)

(declare-fun array_inv!32265 (array!87747) Bool)

(assert (=> start!111012 (array_inv!32265 _keys!1628)))

(assert (=> start!111012 true))

(declare-fun tp_is_empty!35353 () Bool)

(assert (=> start!111012 tp_is_empty!35353))

(declare-datatypes ((V!52241 0))(
  ( (V!52242 (val!17751 Int)) )
))
(declare-datatypes ((ValueCell!16778 0))(
  ( (ValueCellFull!16778 (v!20373 V!52241)) (EmptyCell!16778) )
))
(declare-datatypes ((array!87749 0))(
  ( (array!87750 (arr!42350 (Array (_ BitVec 32) ValueCell!16778)) (size!42901 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87749)

(declare-fun e!748877 () Bool)

(declare-fun array_inv!32266 (array!87749) Bool)

(assert (=> start!111012 (and (array_inv!32266 _values!1354) e!748877)))

(declare-fun b!1312562 () Bool)

(declare-fun res!871021 () Bool)

(assert (=> b!1312562 (=> (not res!871021) (not e!748879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87747 (_ BitVec 32)) Bool)

(assert (=> b!1312562 (= res!871021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312563 () Bool)

(declare-fun res!871022 () Bool)

(assert (=> b!1312563 (=> (not res!871022) (not e!748879))))

(declare-datatypes ((List!30065 0))(
  ( (Nil!30062) (Cons!30061 (h!31279 (_ BitVec 64)) (t!43663 List!30065)) )
))
(declare-fun arrayNoDuplicates!0 (array!87747 (_ BitVec 32) List!30065) Bool)

(assert (=> b!1312563 (= res!871022 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30062))))

(declare-fun mapNonEmpty!54658 () Bool)

(declare-fun tp!104190 () Bool)

(declare-fun e!748876 () Bool)

(assert (=> mapNonEmpty!54658 (= mapRes!54658 (and tp!104190 e!748876))))

(declare-fun mapValue!54658 () ValueCell!16778)

(declare-fun mapRest!54658 () (Array (_ BitVec 32) ValueCell!16778))

(declare-fun mapKey!54658 () (_ BitVec 32))

(assert (=> mapNonEmpty!54658 (= (arr!42350 _values!1354) (store mapRest!54658 mapKey!54658 mapValue!54658))))

(declare-fun b!1312564 () Bool)

(declare-fun e!748878 () Bool)

(assert (=> b!1312564 (= e!748878 tp_is_empty!35353)))

(declare-fun b!1312565 () Bool)

(assert (=> b!1312565 (= e!748877 (and e!748878 mapRes!54658))))

(declare-fun condMapEmpty!54658 () Bool)

(declare-fun mapDefault!54658 () ValueCell!16778)

(assert (=> b!1312565 (= condMapEmpty!54658 (= (arr!42350 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16778)) mapDefault!54658)))))

(declare-fun b!1312566 () Bool)

(declare-fun res!871023 () Bool)

(assert (=> b!1312566 (=> (not res!871023) (not e!748879))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312566 (= res!871023 (and (= (size!42901 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42900 _keys!1628) (size!42901 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312567 () Bool)

(assert (=> b!1312567 (= e!748879 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585929 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52241)

(declare-fun zeroValue!1296 () V!52241)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22910 0))(
  ( (tuple2!22911 (_1!11466 (_ BitVec 64)) (_2!11466 V!52241)) )
))
(declare-datatypes ((List!30066 0))(
  ( (Nil!30063) (Cons!30062 (h!31280 tuple2!22910) (t!43664 List!30066)) )
))
(declare-datatypes ((ListLongMap!20575 0))(
  ( (ListLongMap!20576 (toList!10303 List!30066)) )
))
(declare-fun contains!8465 (ListLongMap!20575 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5307 (array!87747 array!87749 (_ BitVec 32) (_ BitVec 32) V!52241 V!52241 (_ BitVec 32) Int) ListLongMap!20575)

(assert (=> b!1312567 (= lt!585929 (contains!8465 (getCurrentListMap!5307 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312568 () Bool)

(declare-fun res!871024 () Bool)

(assert (=> b!1312568 (=> (not res!871024) (not e!748879))))

(assert (=> b!1312568 (= res!871024 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42900 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312569 () Bool)

(assert (=> b!1312569 (= e!748876 tp_is_empty!35353)))

(assert (= (and start!111012 res!871025) b!1312566))

(assert (= (and b!1312566 res!871023) b!1312562))

(assert (= (and b!1312562 res!871021) b!1312563))

(assert (= (and b!1312563 res!871022) b!1312568))

(assert (= (and b!1312568 res!871024) b!1312567))

(assert (= (and b!1312565 condMapEmpty!54658) mapIsEmpty!54658))

(assert (= (and b!1312565 (not condMapEmpty!54658)) mapNonEmpty!54658))

(get-info :version)

(assert (= (and mapNonEmpty!54658 ((_ is ValueCellFull!16778) mapValue!54658)) b!1312569))

(assert (= (and b!1312565 ((_ is ValueCellFull!16778) mapDefault!54658)) b!1312564))

(assert (= start!111012 b!1312565))

(declare-fun m!1202387 () Bool)

(assert (=> b!1312567 m!1202387))

(assert (=> b!1312567 m!1202387))

(declare-fun m!1202389 () Bool)

(assert (=> b!1312567 m!1202389))

(declare-fun m!1202391 () Bool)

(assert (=> mapNonEmpty!54658 m!1202391))

(declare-fun m!1202393 () Bool)

(assert (=> b!1312562 m!1202393))

(declare-fun m!1202395 () Bool)

(assert (=> b!1312563 m!1202395))

(declare-fun m!1202397 () Bool)

(assert (=> start!111012 m!1202397))

(declare-fun m!1202399 () Bool)

(assert (=> start!111012 m!1202399))

(declare-fun m!1202401 () Bool)

(assert (=> start!111012 m!1202401))

(check-sat tp_is_empty!35353 (not start!111012) (not b!1312562) (not b!1312563) b_and!47833 (not b!1312567) (not b_next!29623) (not mapNonEmpty!54658))
(check-sat b_and!47833 (not b_next!29623))
