; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110814 () Bool)

(assert start!110814)

(declare-fun b_free!29649 () Bool)

(declare-fun b_next!29649 () Bool)

(assert (=> start!110814 (= b_free!29649 (not b_next!29649))))

(declare-fun tp!104269 () Bool)

(declare-fun b_and!47857 () Bool)

(assert (=> start!110814 (= tp!104269 b_and!47857)))

(declare-fun b!1311595 () Bool)

(declare-fun res!870719 () Bool)

(declare-fun e!748228 () Bool)

(assert (=> b!1311595 (=> (not res!870719) (not e!748228))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87746 0))(
  ( (array!87747 (arr!42353 (Array (_ BitVec 32) (_ BitVec 64))) (size!42903 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87746)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52275 0))(
  ( (V!52276 (val!17764 Int)) )
))
(declare-fun minValue!1296 () V!52275)

(declare-datatypes ((ValueCell!16791 0))(
  ( (ValueCellFull!16791 (v!20391 V!52275)) (EmptyCell!16791) )
))
(declare-datatypes ((array!87748 0))(
  ( (array!87749 (arr!42354 (Array (_ BitVec 32) ValueCell!16791)) (size!42904 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87748)

(declare-fun zeroValue!1296 () V!52275)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22892 0))(
  ( (tuple2!22893 (_1!11457 (_ BitVec 64)) (_2!11457 V!52275)) )
))
(declare-datatypes ((List!30033 0))(
  ( (Nil!30030) (Cons!30029 (h!31238 tuple2!22892) (t!43639 List!30033)) )
))
(declare-datatypes ((ListLongMap!20549 0))(
  ( (ListLongMap!20550 (toList!10290 List!30033)) )
))
(declare-fun contains!8440 (ListLongMap!20549 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5303 (array!87746 array!87748 (_ BitVec 32) (_ BitVec 32) V!52275 V!52275 (_ BitVec 32) Int) ListLongMap!20549)

(assert (=> b!1311595 (= res!870719 (contains!8440 (getCurrentListMap!5303 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311596 () Bool)

(declare-fun res!870726 () Bool)

(assert (=> b!1311596 (=> (not res!870726) (not e!748228))))

(assert (=> b!1311596 (= res!870726 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!870718 () Bool)

(assert (=> start!110814 (=> (not res!870718) (not e!748228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110814 (= res!870718 (validMask!0 mask!2040))))

(assert (=> start!110814 e!748228))

(assert (=> start!110814 tp!104269))

(declare-fun array_inv!32007 (array!87746) Bool)

(assert (=> start!110814 (array_inv!32007 _keys!1628)))

(assert (=> start!110814 true))

(declare-fun tp_is_empty!35379 () Bool)

(assert (=> start!110814 tp_is_empty!35379))

(declare-fun e!748232 () Bool)

(declare-fun array_inv!32008 (array!87748) Bool)

(assert (=> start!110814 (and (array_inv!32008 _values!1354) e!748232)))

(declare-fun b!1311597 () Bool)

(declare-fun res!870721 () Bool)

(assert (=> b!1311597 (=> (not res!870721) (not e!748228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87746 (_ BitVec 32)) Bool)

(assert (=> b!1311597 (= res!870721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311598 () Bool)

(assert (=> b!1311598 (= e!748228 (not true))))

(assert (=> b!1311598 (contains!8440 (getCurrentListMap!5303 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43348 0))(
  ( (Unit!43349) )
))
(declare-fun lt!585492 () Unit!43348)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!1 (array!87746 array!87748 (_ BitVec 32) (_ BitVec 32) V!52275 V!52275 (_ BitVec 64) (_ BitVec 32) Int) Unit!43348)

(assert (=> b!1311598 (= lt!585492 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!1 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun mapNonEmpty!54697 () Bool)

(declare-fun mapRes!54697 () Bool)

(declare-fun tp!104268 () Bool)

(declare-fun e!748231 () Bool)

(assert (=> mapNonEmpty!54697 (= mapRes!54697 (and tp!104268 e!748231))))

(declare-fun mapRest!54697 () (Array (_ BitVec 32) ValueCell!16791))

(declare-fun mapKey!54697 () (_ BitVec 32))

(declare-fun mapValue!54697 () ValueCell!16791)

(assert (=> mapNonEmpty!54697 (= (arr!42354 _values!1354) (store mapRest!54697 mapKey!54697 mapValue!54697))))

(declare-fun b!1311599 () Bool)

(assert (=> b!1311599 (= e!748231 tp_is_empty!35379)))

(declare-fun b!1311600 () Bool)

(declare-fun res!870722 () Bool)

(assert (=> b!1311600 (=> (not res!870722) (not e!748228))))

(assert (=> b!1311600 (= res!870722 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42903 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311601 () Bool)

(declare-fun res!870724 () Bool)

(assert (=> b!1311601 (=> (not res!870724) (not e!748228))))

(assert (=> b!1311601 (= res!870724 (and (= (size!42904 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42903 _keys!1628) (size!42904 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311602 () Bool)

(declare-fun e!748230 () Bool)

(assert (=> b!1311602 (= e!748232 (and e!748230 mapRes!54697))))

(declare-fun condMapEmpty!54697 () Bool)

(declare-fun mapDefault!54697 () ValueCell!16791)

(assert (=> b!1311602 (= condMapEmpty!54697 (= (arr!42354 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16791)) mapDefault!54697)))))

(declare-fun b!1311603 () Bool)

(assert (=> b!1311603 (= e!748230 tp_is_empty!35379)))

(declare-fun b!1311604 () Bool)

(declare-fun res!870723 () Bool)

(assert (=> b!1311604 (=> (not res!870723) (not e!748228))))

(declare-datatypes ((List!30034 0))(
  ( (Nil!30031) (Cons!30030 (h!31239 (_ BitVec 64)) (t!43640 List!30034)) )
))
(declare-fun arrayNoDuplicates!0 (array!87746 (_ BitVec 32) List!30034) Bool)

(assert (=> b!1311604 (= res!870723 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30031))))

(declare-fun b!1311605 () Bool)

(declare-fun res!870720 () Bool)

(assert (=> b!1311605 (=> (not res!870720) (not e!748228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311605 (= res!870720 (validKeyInArray!0 (select (arr!42353 _keys!1628) from!2020)))))

(declare-fun b!1311606 () Bool)

(declare-fun res!870725 () Bool)

(assert (=> b!1311606 (=> (not res!870725) (not e!748228))))

(assert (=> b!1311606 (= res!870725 (not (= (select (arr!42353 _keys!1628) from!2020) k0!1175)))))

(declare-fun mapIsEmpty!54697 () Bool)

(assert (=> mapIsEmpty!54697 mapRes!54697))

(assert (= (and start!110814 res!870718) b!1311601))

(assert (= (and b!1311601 res!870724) b!1311597))

(assert (= (and b!1311597 res!870721) b!1311604))

(assert (= (and b!1311604 res!870723) b!1311600))

(assert (= (and b!1311600 res!870722) b!1311595))

(assert (= (and b!1311595 res!870719) b!1311606))

(assert (= (and b!1311606 res!870725) b!1311605))

(assert (= (and b!1311605 res!870720) b!1311596))

(assert (= (and b!1311596 res!870726) b!1311598))

(assert (= (and b!1311602 condMapEmpty!54697) mapIsEmpty!54697))

(assert (= (and b!1311602 (not condMapEmpty!54697)) mapNonEmpty!54697))

(get-info :version)

(assert (= (and mapNonEmpty!54697 ((_ is ValueCellFull!16791) mapValue!54697)) b!1311599))

(assert (= (and b!1311602 ((_ is ValueCellFull!16791) mapDefault!54697)) b!1311603))

(assert (= start!110814 b!1311602))

(declare-fun m!1201007 () Bool)

(assert (=> b!1311604 m!1201007))

(declare-fun m!1201009 () Bool)

(assert (=> start!110814 m!1201009))

(declare-fun m!1201011 () Bool)

(assert (=> start!110814 m!1201011))

(declare-fun m!1201013 () Bool)

(assert (=> start!110814 m!1201013))

(declare-fun m!1201015 () Bool)

(assert (=> mapNonEmpty!54697 m!1201015))

(declare-fun m!1201017 () Bool)

(assert (=> b!1311605 m!1201017))

(assert (=> b!1311605 m!1201017))

(declare-fun m!1201019 () Bool)

(assert (=> b!1311605 m!1201019))

(assert (=> b!1311606 m!1201017))

(declare-fun m!1201021 () Bool)

(assert (=> b!1311598 m!1201021))

(assert (=> b!1311598 m!1201021))

(declare-fun m!1201023 () Bool)

(assert (=> b!1311598 m!1201023))

(declare-fun m!1201025 () Bool)

(assert (=> b!1311598 m!1201025))

(declare-fun m!1201027 () Bool)

(assert (=> b!1311595 m!1201027))

(assert (=> b!1311595 m!1201027))

(declare-fun m!1201029 () Bool)

(assert (=> b!1311595 m!1201029))

(declare-fun m!1201031 () Bool)

(assert (=> b!1311597 m!1201031))

(check-sat (not b!1311597) (not mapNonEmpty!54697) (not b!1311598) tp_is_empty!35379 (not b!1311605) (not b!1311604) b_and!47857 (not start!110814) (not b!1311595) (not b_next!29649))
(check-sat b_and!47857 (not b_next!29649))
