; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110608 () Bool)

(assert start!110608)

(declare-fun b_free!29443 () Bool)

(declare-fun b_next!29443 () Bool)

(assert (=> start!110608 (= b_free!29443 (not b_next!29443))))

(declare-fun tp!103651 () Bool)

(declare-fun b_and!47633 () Bool)

(assert (=> start!110608 (= tp!103651 b_and!47633)))

(declare-fun b!1308681 () Bool)

(declare-fun res!868776 () Bool)

(declare-fun e!746654 () Bool)

(assert (=> b!1308681 (=> (not res!868776) (not e!746654))))

(declare-datatypes ((array!87261 0))(
  ( (array!87262 (arr!42111 (Array (_ BitVec 32) (_ BitVec 64))) (size!42663 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87261)

(declare-datatypes ((List!29952 0))(
  ( (Nil!29949) (Cons!29948 (h!31157 (_ BitVec 64)) (t!43550 List!29952)) )
))
(declare-fun arrayNoDuplicates!0 (array!87261 (_ BitVec 32) List!29952) Bool)

(assert (=> b!1308681 (= res!868776 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29949))))

(declare-fun mapNonEmpty!54388 () Bool)

(declare-fun mapRes!54388 () Bool)

(declare-fun tp!103652 () Bool)

(declare-fun e!746653 () Bool)

(assert (=> mapNonEmpty!54388 (= mapRes!54388 (and tp!103652 e!746653))))

(declare-datatypes ((V!52001 0))(
  ( (V!52002 (val!17661 Int)) )
))
(declare-datatypes ((ValueCell!16688 0))(
  ( (ValueCellFull!16688 (v!20287 V!52001)) (EmptyCell!16688) )
))
(declare-fun mapValue!54388 () ValueCell!16688)

(declare-datatypes ((array!87263 0))(
  ( (array!87264 (arr!42112 (Array (_ BitVec 32) ValueCell!16688)) (size!42664 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87263)

(declare-fun mapRest!54388 () (Array (_ BitVec 32) ValueCell!16688))

(declare-fun mapKey!54388 () (_ BitVec 32))

(assert (=> mapNonEmpty!54388 (= (arr!42112 _values!1354) (store mapRest!54388 mapKey!54388 mapValue!54388))))

(declare-fun mapIsEmpty!54388 () Bool)

(assert (=> mapIsEmpty!54388 mapRes!54388))

(declare-fun b!1308682 () Bool)

(declare-fun res!868780 () Bool)

(assert (=> b!1308682 (=> (not res!868780) (not e!746654))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87261 (_ BitVec 32)) Bool)

(assert (=> b!1308682 (= res!868780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308683 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308683 (= e!746654 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52001)

(declare-fun zeroValue!1296 () V!52001)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22826 0))(
  ( (tuple2!22827 (_1!11424 (_ BitVec 64)) (_2!11424 V!52001)) )
))
(declare-datatypes ((List!29953 0))(
  ( (Nil!29950) (Cons!29949 (h!31158 tuple2!22826) (t!43551 List!29953)) )
))
(declare-datatypes ((ListLongMap!20483 0))(
  ( (ListLongMap!20484 (toList!10257 List!29953)) )
))
(declare-fun contains!8334 (ListLongMap!20483 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5152 (array!87261 array!87263 (_ BitVec 32) (_ BitVec 32) V!52001 V!52001 (_ BitVec 32) Int) ListLongMap!20483)

(assert (=> b!1308683 (contains!8334 (getCurrentListMap!5152 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43145 0))(
  ( (Unit!43146) )
))
(declare-fun lt!584997 () Unit!43145)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!17 (array!87261 array!87263 (_ BitVec 32) (_ BitVec 32) V!52001 V!52001 (_ BitVec 64) (_ BitVec 32) Int) Unit!43145)

(assert (=> b!1308683 (= lt!584997 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!17 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308684 () Bool)

(declare-fun res!868779 () Bool)

(assert (=> b!1308684 (=> (not res!868779) (not e!746654))))

(assert (=> b!1308684 (= res!868779 (and (= (size!42664 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42663 _keys!1628) (size!42664 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308685 () Bool)

(declare-fun res!868775 () Bool)

(assert (=> b!1308685 (=> (not res!868775) (not e!746654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308685 (= res!868775 (validKeyInArray!0 (select (arr!42111 _keys!1628) from!2020)))))

(declare-fun b!1308686 () Bool)

(declare-fun res!868774 () Bool)

(assert (=> b!1308686 (=> (not res!868774) (not e!746654))))

(assert (=> b!1308686 (= res!868774 (contains!8334 (getCurrentListMap!5152 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308687 () Bool)

(declare-fun res!868773 () Bool)

(assert (=> b!1308687 (=> (not res!868773) (not e!746654))))

(assert (=> b!1308687 (= res!868773 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42663 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308688 () Bool)

(declare-fun e!746651 () Bool)

(declare-fun tp_is_empty!35173 () Bool)

(assert (=> b!1308688 (= e!746651 tp_is_empty!35173)))

(declare-fun b!1308689 () Bool)

(declare-fun e!746650 () Bool)

(assert (=> b!1308689 (= e!746650 (and e!746651 mapRes!54388))))

(declare-fun condMapEmpty!54388 () Bool)

(declare-fun mapDefault!54388 () ValueCell!16688)

(assert (=> b!1308689 (= condMapEmpty!54388 (= (arr!42112 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16688)) mapDefault!54388)))))

(declare-fun b!1308690 () Bool)

(declare-fun res!868772 () Bool)

(assert (=> b!1308690 (=> (not res!868772) (not e!746654))))

(assert (=> b!1308690 (= res!868772 (not (= (select (arr!42111 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1308691 () Bool)

(declare-fun res!868778 () Bool)

(assert (=> b!1308691 (=> (not res!868778) (not e!746654))))

(assert (=> b!1308691 (= res!868778 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308692 () Bool)

(assert (=> b!1308692 (= e!746653 tp_is_empty!35173)))

(declare-fun res!868777 () Bool)

(assert (=> start!110608 (=> (not res!868777) (not e!746654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110608 (= res!868777 (validMask!0 mask!2040))))

(assert (=> start!110608 e!746654))

(assert (=> start!110608 tp!103651))

(declare-fun array_inv!32023 (array!87261) Bool)

(assert (=> start!110608 (array_inv!32023 _keys!1628)))

(assert (=> start!110608 true))

(assert (=> start!110608 tp_is_empty!35173))

(declare-fun array_inv!32024 (array!87263) Bool)

(assert (=> start!110608 (and (array_inv!32024 _values!1354) e!746650)))

(assert (= (and start!110608 res!868777) b!1308684))

(assert (= (and b!1308684 res!868779) b!1308682))

(assert (= (and b!1308682 res!868780) b!1308681))

(assert (= (and b!1308681 res!868776) b!1308687))

(assert (= (and b!1308687 res!868773) b!1308686))

(assert (= (and b!1308686 res!868774) b!1308690))

(assert (= (and b!1308690 res!868772) b!1308685))

(assert (= (and b!1308685 res!868775) b!1308691))

(assert (= (and b!1308691 res!868778) b!1308683))

(assert (= (and b!1308689 condMapEmpty!54388) mapIsEmpty!54388))

(assert (= (and b!1308689 (not condMapEmpty!54388)) mapNonEmpty!54388))

(get-info :version)

(assert (= (and mapNonEmpty!54388 ((_ is ValueCellFull!16688) mapValue!54388)) b!1308692))

(assert (= (and b!1308689 ((_ is ValueCellFull!16688) mapDefault!54388)) b!1308688))

(assert (= start!110608 b!1308689))

(declare-fun m!1198533 () Bool)

(assert (=> b!1308686 m!1198533))

(assert (=> b!1308686 m!1198533))

(declare-fun m!1198535 () Bool)

(assert (=> b!1308686 m!1198535))

(declare-fun m!1198537 () Bool)

(assert (=> mapNonEmpty!54388 m!1198537))

(declare-fun m!1198539 () Bool)

(assert (=> b!1308685 m!1198539))

(assert (=> b!1308685 m!1198539))

(declare-fun m!1198541 () Bool)

(assert (=> b!1308685 m!1198541))

(declare-fun m!1198543 () Bool)

(assert (=> b!1308681 m!1198543))

(declare-fun m!1198545 () Bool)

(assert (=> b!1308683 m!1198545))

(assert (=> b!1308683 m!1198545))

(declare-fun m!1198547 () Bool)

(assert (=> b!1308683 m!1198547))

(declare-fun m!1198549 () Bool)

(assert (=> b!1308683 m!1198549))

(assert (=> b!1308690 m!1198539))

(declare-fun m!1198551 () Bool)

(assert (=> b!1308682 m!1198551))

(declare-fun m!1198553 () Bool)

(assert (=> start!110608 m!1198553))

(declare-fun m!1198555 () Bool)

(assert (=> start!110608 m!1198555))

(declare-fun m!1198557 () Bool)

(assert (=> start!110608 m!1198557))

(check-sat (not b!1308681) tp_is_empty!35173 (not b!1308682) b_and!47633 (not b!1308686) (not b_next!29443) (not b!1308685) (not start!110608) (not mapNonEmpty!54388) (not b!1308683))
(check-sat b_and!47633 (not b_next!29443))
