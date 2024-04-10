; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110604 () Bool)

(assert start!110604)

(declare-fun b_free!29439 () Bool)

(declare-fun b_next!29439 () Bool)

(assert (=> start!110604 (= b_free!29439 (not b_next!29439))))

(declare-fun tp!103639 () Bool)

(declare-fun b_and!47647 () Bool)

(assert (=> start!110604 (= tp!103639 b_and!47647)))

(declare-fun b!1308679 () Bool)

(declare-fun res!868748 () Bool)

(declare-fun e!746657 () Bool)

(assert (=> b!1308679 (=> (not res!868748) (not e!746657))))

(declare-datatypes ((array!87336 0))(
  ( (array!87337 (arr!42148 (Array (_ BitVec 32) (_ BitVec 64))) (size!42698 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87336)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51995 0))(
  ( (V!51996 (val!17659 Int)) )
))
(declare-datatypes ((ValueCell!16686 0))(
  ( (ValueCellFull!16686 (v!20286 V!51995)) (EmptyCell!16686) )
))
(declare-datatypes ((array!87338 0))(
  ( (array!87339 (arr!42149 (Array (_ BitVec 32) ValueCell!16686)) (size!42699 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87338)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308679 (= res!868748 (and (= (size!42699 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42698 _keys!1628) (size!42699 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54382 () Bool)

(declare-fun mapRes!54382 () Bool)

(assert (=> mapIsEmpty!54382 mapRes!54382))

(declare-fun b!1308680 () Bool)

(declare-fun res!868747 () Bool)

(assert (=> b!1308680 (=> (not res!868747) (not e!746657))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308680 (= res!868747 (not (= (select (arr!42148 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1308681 () Bool)

(declare-fun res!868755 () Bool)

(assert (=> b!1308681 (=> (not res!868755) (not e!746657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308681 (= res!868755 (validKeyInArray!0 (select (arr!42148 _keys!1628) from!2020)))))

(declare-fun mapNonEmpty!54382 () Bool)

(declare-fun tp!103638 () Bool)

(declare-fun e!746656 () Bool)

(assert (=> mapNonEmpty!54382 (= mapRes!54382 (and tp!103638 e!746656))))

(declare-fun mapValue!54382 () ValueCell!16686)

(declare-fun mapRest!54382 () (Array (_ BitVec 32) ValueCell!16686))

(declare-fun mapKey!54382 () (_ BitVec 32))

(assert (=> mapNonEmpty!54382 (= (arr!42149 _values!1354) (store mapRest!54382 mapKey!54382 mapValue!54382))))

(declare-fun b!1308682 () Bool)

(declare-fun res!868750 () Bool)

(assert (=> b!1308682 (=> (not res!868750) (not e!746657))))

(assert (=> b!1308682 (= res!868750 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42698 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308683 () Bool)

(assert (=> b!1308683 (= e!746657 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51995)

(declare-fun zeroValue!1296 () V!51995)

(declare-datatypes ((tuple2!22738 0))(
  ( (tuple2!22739 (_1!11380 (_ BitVec 64)) (_2!11380 V!51995)) )
))
(declare-datatypes ((List!29879 0))(
  ( (Nil!29876) (Cons!29875 (h!31084 tuple2!22738) (t!43485 List!29879)) )
))
(declare-datatypes ((ListLongMap!20395 0))(
  ( (ListLongMap!20396 (toList!10213 List!29879)) )
))
(declare-fun contains!8363 (ListLongMap!20395 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5226 (array!87336 array!87338 (_ BitVec 32) (_ BitVec 32) V!51995 V!51995 (_ BitVec 32) Int) ListLongMap!20395)

(assert (=> b!1308683 (contains!8363 (getCurrentListMap!5226 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43304 0))(
  ( (Unit!43305) )
))
(declare-fun lt!585177 () Unit!43304)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!16 (array!87336 array!87338 (_ BitVec 32) (_ BitVec 32) V!51995 V!51995 (_ BitVec 64) (_ BitVec 32) Int) Unit!43304)

(assert (=> b!1308683 (= lt!585177 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!16 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun res!868753 () Bool)

(assert (=> start!110604 (=> (not res!868753) (not e!746657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110604 (= res!868753 (validMask!0 mask!2040))))

(assert (=> start!110604 e!746657))

(assert (=> start!110604 tp!103639))

(declare-fun array_inv!31857 (array!87336) Bool)

(assert (=> start!110604 (array_inv!31857 _keys!1628)))

(assert (=> start!110604 true))

(declare-fun tp_is_empty!35169 () Bool)

(assert (=> start!110604 tp_is_empty!35169))

(declare-fun e!746655 () Bool)

(declare-fun array_inv!31858 (array!87338) Bool)

(assert (=> start!110604 (and (array_inv!31858 _values!1354) e!746655)))

(declare-fun b!1308684 () Bool)

(declare-fun e!746654 () Bool)

(assert (=> b!1308684 (= e!746655 (and e!746654 mapRes!54382))))

(declare-fun condMapEmpty!54382 () Bool)

(declare-fun mapDefault!54382 () ValueCell!16686)

(assert (=> b!1308684 (= condMapEmpty!54382 (= (arr!42149 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16686)) mapDefault!54382)))))

(declare-fun b!1308685 () Bool)

(declare-fun res!868752 () Bool)

(assert (=> b!1308685 (=> (not res!868752) (not e!746657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87336 (_ BitVec 32)) Bool)

(assert (=> b!1308685 (= res!868752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308686 () Bool)

(declare-fun res!868754 () Bool)

(assert (=> b!1308686 (=> (not res!868754) (not e!746657))))

(assert (=> b!1308686 (= res!868754 (contains!8363 (getCurrentListMap!5226 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308687 () Bool)

(assert (=> b!1308687 (= e!746654 tp_is_empty!35169)))

(declare-fun b!1308688 () Bool)

(declare-fun res!868751 () Bool)

(assert (=> b!1308688 (=> (not res!868751) (not e!746657))))

(declare-datatypes ((List!29880 0))(
  ( (Nil!29877) (Cons!29876 (h!31085 (_ BitVec 64)) (t!43486 List!29880)) )
))
(declare-fun arrayNoDuplicates!0 (array!87336 (_ BitVec 32) List!29880) Bool)

(assert (=> b!1308688 (= res!868751 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29877))))

(declare-fun b!1308689 () Bool)

(assert (=> b!1308689 (= e!746656 tp_is_empty!35169)))

(declare-fun b!1308690 () Bool)

(declare-fun res!868749 () Bool)

(assert (=> b!1308690 (=> (not res!868749) (not e!746657))))

(assert (=> b!1308690 (= res!868749 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!110604 res!868753) b!1308679))

(assert (= (and b!1308679 res!868748) b!1308685))

(assert (= (and b!1308685 res!868752) b!1308688))

(assert (= (and b!1308688 res!868751) b!1308682))

(assert (= (and b!1308682 res!868750) b!1308686))

(assert (= (and b!1308686 res!868754) b!1308680))

(assert (= (and b!1308680 res!868747) b!1308681))

(assert (= (and b!1308681 res!868755) b!1308690))

(assert (= (and b!1308690 res!868749) b!1308683))

(assert (= (and b!1308684 condMapEmpty!54382) mapIsEmpty!54382))

(assert (= (and b!1308684 (not condMapEmpty!54382)) mapNonEmpty!54382))

(get-info :version)

(assert (= (and mapNonEmpty!54382 ((_ is ValueCellFull!16686) mapValue!54382)) b!1308689))

(assert (= (and b!1308684 ((_ is ValueCellFull!16686) mapDefault!54382)) b!1308687))

(assert (= start!110604 b!1308684))

(declare-fun m!1198997 () Bool)

(assert (=> b!1308681 m!1198997))

(assert (=> b!1308681 m!1198997))

(declare-fun m!1198999 () Bool)

(assert (=> b!1308681 m!1198999))

(declare-fun m!1199001 () Bool)

(assert (=> b!1308686 m!1199001))

(assert (=> b!1308686 m!1199001))

(declare-fun m!1199003 () Bool)

(assert (=> b!1308686 m!1199003))

(declare-fun m!1199005 () Bool)

(assert (=> b!1308688 m!1199005))

(assert (=> b!1308680 m!1198997))

(declare-fun m!1199007 () Bool)

(assert (=> b!1308685 m!1199007))

(declare-fun m!1199009 () Bool)

(assert (=> start!110604 m!1199009))

(declare-fun m!1199011 () Bool)

(assert (=> start!110604 m!1199011))

(declare-fun m!1199013 () Bool)

(assert (=> start!110604 m!1199013))

(declare-fun m!1199015 () Bool)

(assert (=> b!1308683 m!1199015))

(assert (=> b!1308683 m!1199015))

(declare-fun m!1199017 () Bool)

(assert (=> b!1308683 m!1199017))

(declare-fun m!1199019 () Bool)

(assert (=> b!1308683 m!1199019))

(declare-fun m!1199021 () Bool)

(assert (=> mapNonEmpty!54382 m!1199021))

(check-sat (not b!1308685) (not b!1308686) b_and!47647 (not b!1308688) (not b!1308683) (not start!110604) (not b_next!29439) (not mapNonEmpty!54382) tp_is_empty!35169 (not b!1308681))
(check-sat b_and!47647 (not b_next!29439))
