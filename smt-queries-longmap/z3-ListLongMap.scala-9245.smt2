; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110818 () Bool)

(assert start!110818)

(declare-fun b_free!29653 () Bool)

(declare-fun b_next!29653 () Bool)

(assert (=> start!110818 (= b_free!29653 (not b_next!29653))))

(declare-fun tp!104281 () Bool)

(declare-fun b_and!47843 () Bool)

(assert (=> start!110818 (= tp!104281 b_and!47843)))

(declare-fun b!1311597 () Bool)

(declare-fun res!870747 () Bool)

(declare-fun e!748228 () Bool)

(assert (=> b!1311597 (=> (not res!870747) (not e!748228))))

(declare-datatypes ((array!87659 0))(
  ( (array!87660 (arr!42310 (Array (_ BitVec 32) (_ BitVec 64))) (size!42862 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87659)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311597 (= res!870747 (validKeyInArray!0 (select (arr!42310 _keys!1628) from!2020)))))

(declare-fun b!1311598 () Bool)

(declare-fun res!870743 () Bool)

(assert (=> b!1311598 (=> (not res!870743) (not e!748228))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87659 (_ BitVec 32)) Bool)

(assert (=> b!1311598 (= res!870743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311599 () Bool)

(declare-fun res!870749 () Bool)

(assert (=> b!1311599 (=> (not res!870749) (not e!748228))))

(declare-datatypes ((List!30101 0))(
  ( (Nil!30098) (Cons!30097 (h!31306 (_ BitVec 64)) (t!43699 List!30101)) )
))
(declare-fun arrayNoDuplicates!0 (array!87659 (_ BitVec 32) List!30101) Bool)

(assert (=> b!1311599 (= res!870749 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30098))))

(declare-fun mapIsEmpty!54703 () Bool)

(declare-fun mapRes!54703 () Bool)

(assert (=> mapIsEmpty!54703 mapRes!54703))

(declare-fun b!1311601 () Bool)

(declare-fun res!870745 () Bool)

(assert (=> b!1311601 (=> (not res!870745) (not e!748228))))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1311601 (= res!870745 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42862 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311602 () Bool)

(declare-fun e!748227 () Bool)

(declare-fun tp_is_empty!35383 () Bool)

(assert (=> b!1311602 (= e!748227 tp_is_empty!35383)))

(declare-fun b!1311600 () Bool)

(declare-fun res!870748 () Bool)

(assert (=> b!1311600 (=> (not res!870748) (not e!748228))))

(declare-datatypes ((V!52281 0))(
  ( (V!52282 (val!17766 Int)) )
))
(declare-datatypes ((ValueCell!16793 0))(
  ( (ValueCellFull!16793 (v!20392 V!52281)) (EmptyCell!16793) )
))
(declare-datatypes ((array!87661 0))(
  ( (array!87662 (arr!42311 (Array (_ BitVec 32) ValueCell!16793)) (size!42863 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87661)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311600 (= res!870748 (and (= (size!42863 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42862 _keys!1628) (size!42863 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!870750 () Bool)

(assert (=> start!110818 (=> (not res!870750) (not e!748228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110818 (= res!870750 (validMask!0 mask!2040))))

(assert (=> start!110818 e!748228))

(assert (=> start!110818 tp!104281))

(declare-fun array_inv!32153 (array!87659) Bool)

(assert (=> start!110818 (array_inv!32153 _keys!1628)))

(assert (=> start!110818 true))

(assert (=> start!110818 tp_is_empty!35383))

(declare-fun e!748226 () Bool)

(declare-fun array_inv!32154 (array!87661) Bool)

(assert (=> start!110818 (and (array_inv!32154 _values!1354) e!748226)))

(declare-fun b!1311603 () Bool)

(declare-fun res!870751 () Bool)

(assert (=> b!1311603 (=> (not res!870751) (not e!748228))))

(assert (=> b!1311603 (= res!870751 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54703 () Bool)

(declare-fun tp!104282 () Bool)

(declare-fun e!748229 () Bool)

(assert (=> mapNonEmpty!54703 (= mapRes!54703 (and tp!104282 e!748229))))

(declare-fun mapKey!54703 () (_ BitVec 32))

(declare-fun mapValue!54703 () ValueCell!16793)

(declare-fun mapRest!54703 () (Array (_ BitVec 32) ValueCell!16793))

(assert (=> mapNonEmpty!54703 (= (arr!42311 _values!1354) (store mapRest!54703 mapKey!54703 mapValue!54703))))

(declare-fun b!1311604 () Bool)

(declare-fun res!870744 () Bool)

(assert (=> b!1311604 (=> (not res!870744) (not e!748228))))

(assert (=> b!1311604 (= res!870744 (not (= (select (arr!42310 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1311605 () Bool)

(assert (=> b!1311605 (= e!748228 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52281)

(declare-fun zeroValue!1296 () V!52281)

(declare-datatypes ((tuple2!22980 0))(
  ( (tuple2!22981 (_1!11501 (_ BitVec 64)) (_2!11501 V!52281)) )
))
(declare-datatypes ((List!30102 0))(
  ( (Nil!30099) (Cons!30098 (h!31307 tuple2!22980) (t!43700 List!30102)) )
))
(declare-datatypes ((ListLongMap!20637 0))(
  ( (ListLongMap!20638 (toList!10334 List!30102)) )
))
(declare-fun contains!8411 (ListLongMap!20637 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5229 (array!87659 array!87661 (_ BitVec 32) (_ BitVec 32) V!52281 V!52281 (_ BitVec 32) Int) ListLongMap!20637)

(assert (=> b!1311605 (contains!8411 (getCurrentListMap!5229 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43183 0))(
  ( (Unit!43184) )
))
(declare-fun lt!585312 () Unit!43183)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!2 (array!87659 array!87661 (_ BitVec 32) (_ BitVec 32) V!52281 V!52281 (_ BitVec 64) (_ BitVec 32) Int) Unit!43183)

(assert (=> b!1311605 (= lt!585312 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!2 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311606 () Bool)

(assert (=> b!1311606 (= e!748229 tp_is_empty!35383)))

(declare-fun b!1311607 () Bool)

(assert (=> b!1311607 (= e!748226 (and e!748227 mapRes!54703))))

(declare-fun condMapEmpty!54703 () Bool)

(declare-fun mapDefault!54703 () ValueCell!16793)

(assert (=> b!1311607 (= condMapEmpty!54703 (= (arr!42311 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16793)) mapDefault!54703)))))

(declare-fun b!1311608 () Bool)

(declare-fun res!870746 () Bool)

(assert (=> b!1311608 (=> (not res!870746) (not e!748228))))

(assert (=> b!1311608 (= res!870746 (contains!8411 (getCurrentListMap!5229 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!110818 res!870750) b!1311600))

(assert (= (and b!1311600 res!870748) b!1311598))

(assert (= (and b!1311598 res!870743) b!1311599))

(assert (= (and b!1311599 res!870749) b!1311601))

(assert (= (and b!1311601 res!870745) b!1311608))

(assert (= (and b!1311608 res!870746) b!1311604))

(assert (= (and b!1311604 res!870744) b!1311597))

(assert (= (and b!1311597 res!870747) b!1311603))

(assert (= (and b!1311603 res!870751) b!1311605))

(assert (= (and b!1311607 condMapEmpty!54703) mapIsEmpty!54703))

(assert (= (and b!1311607 (not condMapEmpty!54703)) mapNonEmpty!54703))

(get-info :version)

(assert (= (and mapNonEmpty!54703 ((_ is ValueCellFull!16793) mapValue!54703)) b!1311606))

(assert (= (and b!1311607 ((_ is ValueCellFull!16793) mapDefault!54703)) b!1311602))

(assert (= start!110818 b!1311607))

(declare-fun m!1200543 () Bool)

(assert (=> b!1311604 m!1200543))

(declare-fun m!1200545 () Bool)

(assert (=> mapNonEmpty!54703 m!1200545))

(assert (=> b!1311597 m!1200543))

(assert (=> b!1311597 m!1200543))

(declare-fun m!1200547 () Bool)

(assert (=> b!1311597 m!1200547))

(declare-fun m!1200549 () Bool)

(assert (=> start!110818 m!1200549))

(declare-fun m!1200551 () Bool)

(assert (=> start!110818 m!1200551))

(declare-fun m!1200553 () Bool)

(assert (=> start!110818 m!1200553))

(declare-fun m!1200555 () Bool)

(assert (=> b!1311599 m!1200555))

(declare-fun m!1200557 () Bool)

(assert (=> b!1311608 m!1200557))

(assert (=> b!1311608 m!1200557))

(declare-fun m!1200559 () Bool)

(assert (=> b!1311608 m!1200559))

(declare-fun m!1200561 () Bool)

(assert (=> b!1311605 m!1200561))

(assert (=> b!1311605 m!1200561))

(declare-fun m!1200563 () Bool)

(assert (=> b!1311605 m!1200563))

(declare-fun m!1200565 () Bool)

(assert (=> b!1311605 m!1200565))

(declare-fun m!1200567 () Bool)

(assert (=> b!1311598 m!1200567))

(check-sat (not b!1311597) (not mapNonEmpty!54703) (not b!1311605) tp_is_empty!35383 (not b!1311599) (not b_next!29653) (not b!1311598) b_and!47843 (not start!110818) (not b!1311608))
(check-sat b_and!47843 (not b_next!29653))
