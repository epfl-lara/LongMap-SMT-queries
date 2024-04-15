; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110824 () Bool)

(assert start!110824)

(declare-fun b_free!29659 () Bool)

(declare-fun b_next!29659 () Bool)

(assert (=> start!110824 (= b_free!29659 (not b_next!29659))))

(declare-fun tp!104299 () Bool)

(declare-fun b_and!47849 () Bool)

(assert (=> start!110824 (= tp!104299 b_and!47849)))

(declare-fun b!1311705 () Bool)

(declare-fun e!748271 () Bool)

(declare-fun e!748273 () Bool)

(declare-fun mapRes!54712 () Bool)

(assert (=> b!1311705 (= e!748271 (and e!748273 mapRes!54712))))

(declare-fun condMapEmpty!54712 () Bool)

(declare-datatypes ((V!52289 0))(
  ( (V!52290 (val!17769 Int)) )
))
(declare-datatypes ((ValueCell!16796 0))(
  ( (ValueCellFull!16796 (v!20395 V!52289)) (EmptyCell!16796) )
))
(declare-datatypes ((array!87671 0))(
  ( (array!87672 (arr!42316 (Array (_ BitVec 32) ValueCell!16796)) (size!42868 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87671)

(declare-fun mapDefault!54712 () ValueCell!16796)

(assert (=> b!1311705 (= condMapEmpty!54712 (= (arr!42316 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16796)) mapDefault!54712)))))

(declare-fun mapIsEmpty!54712 () Bool)

(assert (=> mapIsEmpty!54712 mapRes!54712))

(declare-fun b!1311706 () Bool)

(declare-fun res!870830 () Bool)

(declare-fun e!748274 () Bool)

(assert (=> b!1311706 (=> (not res!870830) (not e!748274))))

(declare-datatypes ((array!87673 0))(
  ( (array!87674 (arr!42317 (Array (_ BitVec 32) (_ BitVec 64))) (size!42869 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87673)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311706 (= res!870830 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42869 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54712 () Bool)

(declare-fun tp!104300 () Bool)

(declare-fun e!748272 () Bool)

(assert (=> mapNonEmpty!54712 (= mapRes!54712 (and tp!104300 e!748272))))

(declare-fun mapValue!54712 () ValueCell!16796)

(declare-fun mapRest!54712 () (Array (_ BitVec 32) ValueCell!16796))

(declare-fun mapKey!54712 () (_ BitVec 32))

(assert (=> mapNonEmpty!54712 (= (arr!42316 _values!1354) (store mapRest!54712 mapKey!54712 mapValue!54712))))

(declare-fun b!1311707 () Bool)

(declare-fun tp_is_empty!35389 () Bool)

(assert (=> b!1311707 (= e!748273 tp_is_empty!35389)))

(declare-fun b!1311708 () Bool)

(declare-fun res!870829 () Bool)

(assert (=> b!1311708 (=> (not res!870829) (not e!748274))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52289)

(declare-fun zeroValue!1296 () V!52289)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22986 0))(
  ( (tuple2!22987 (_1!11504 (_ BitVec 64)) (_2!11504 V!52289)) )
))
(declare-datatypes ((List!30106 0))(
  ( (Nil!30103) (Cons!30102 (h!31311 tuple2!22986) (t!43704 List!30106)) )
))
(declare-datatypes ((ListLongMap!20643 0))(
  ( (ListLongMap!20644 (toList!10337 List!30106)) )
))
(declare-fun contains!8414 (ListLongMap!20643 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5232 (array!87673 array!87671 (_ BitVec 32) (_ BitVec 32) V!52289 V!52289 (_ BitVec 32) Int) ListLongMap!20643)

(assert (=> b!1311708 (= res!870829 (contains!8414 (getCurrentListMap!5232 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311709 () Bool)

(declare-fun res!870831 () Bool)

(assert (=> b!1311709 (=> (not res!870831) (not e!748274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87673 (_ BitVec 32)) Bool)

(assert (=> b!1311709 (= res!870831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311711 () Bool)

(declare-fun res!870832 () Bool)

(assert (=> b!1311711 (=> (not res!870832) (not e!748274))))

(assert (=> b!1311711 (= res!870832 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1311712 () Bool)

(declare-fun res!870824 () Bool)

(assert (=> b!1311712 (=> (not res!870824) (not e!748274))))

(assert (=> b!1311712 (= res!870824 (not (= (select (arr!42317 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1311713 () Bool)

(declare-fun res!870826 () Bool)

(assert (=> b!1311713 (=> (not res!870826) (not e!748274))))

(assert (=> b!1311713 (= res!870826 (and (= (size!42868 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42869 _keys!1628) (size!42868 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311714 () Bool)

(assert (=> b!1311714 (= e!748272 tp_is_empty!35389)))

(declare-fun b!1311715 () Bool)

(assert (=> b!1311715 (= e!748274 (not true))))

(assert (=> b!1311715 (contains!8414 (getCurrentListMap!5232 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43189 0))(
  ( (Unit!43190) )
))
(declare-fun lt!585321 () Unit!43189)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!5 (array!87673 array!87671 (_ BitVec 32) (_ BitVec 32) V!52289 V!52289 (_ BitVec 64) (_ BitVec 32) Int) Unit!43189)

(assert (=> b!1311715 (= lt!585321 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!5 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311716 () Bool)

(declare-fun res!870827 () Bool)

(assert (=> b!1311716 (=> (not res!870827) (not e!748274))))

(declare-datatypes ((List!30107 0))(
  ( (Nil!30104) (Cons!30103 (h!31312 (_ BitVec 64)) (t!43705 List!30107)) )
))
(declare-fun arrayNoDuplicates!0 (array!87673 (_ BitVec 32) List!30107) Bool)

(assert (=> b!1311716 (= res!870827 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30104))))

(declare-fun b!1311710 () Bool)

(declare-fun res!870825 () Bool)

(assert (=> b!1311710 (=> (not res!870825) (not e!748274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311710 (= res!870825 (validKeyInArray!0 (select (arr!42317 _keys!1628) from!2020)))))

(declare-fun res!870828 () Bool)

(assert (=> start!110824 (=> (not res!870828) (not e!748274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110824 (= res!870828 (validMask!0 mask!2040))))

(assert (=> start!110824 e!748274))

(assert (=> start!110824 tp!104299))

(declare-fun array_inv!32157 (array!87673) Bool)

(assert (=> start!110824 (array_inv!32157 _keys!1628)))

(assert (=> start!110824 true))

(assert (=> start!110824 tp_is_empty!35389))

(declare-fun array_inv!32158 (array!87671) Bool)

(assert (=> start!110824 (and (array_inv!32158 _values!1354) e!748271)))

(assert (= (and start!110824 res!870828) b!1311713))

(assert (= (and b!1311713 res!870826) b!1311709))

(assert (= (and b!1311709 res!870831) b!1311716))

(assert (= (and b!1311716 res!870827) b!1311706))

(assert (= (and b!1311706 res!870830) b!1311708))

(assert (= (and b!1311708 res!870829) b!1311712))

(assert (= (and b!1311712 res!870824) b!1311710))

(assert (= (and b!1311710 res!870825) b!1311711))

(assert (= (and b!1311711 res!870832) b!1311715))

(assert (= (and b!1311705 condMapEmpty!54712) mapIsEmpty!54712))

(assert (= (and b!1311705 (not condMapEmpty!54712)) mapNonEmpty!54712))

(get-info :version)

(assert (= (and mapNonEmpty!54712 ((_ is ValueCellFull!16796) mapValue!54712)) b!1311714))

(assert (= (and b!1311705 ((_ is ValueCellFull!16796) mapDefault!54712)) b!1311707))

(assert (= start!110824 b!1311705))

(declare-fun m!1200621 () Bool)

(assert (=> b!1311710 m!1200621))

(assert (=> b!1311710 m!1200621))

(declare-fun m!1200623 () Bool)

(assert (=> b!1311710 m!1200623))

(assert (=> b!1311712 m!1200621))

(declare-fun m!1200625 () Bool)

(assert (=> b!1311715 m!1200625))

(assert (=> b!1311715 m!1200625))

(declare-fun m!1200627 () Bool)

(assert (=> b!1311715 m!1200627))

(declare-fun m!1200629 () Bool)

(assert (=> b!1311715 m!1200629))

(declare-fun m!1200631 () Bool)

(assert (=> start!110824 m!1200631))

(declare-fun m!1200633 () Bool)

(assert (=> start!110824 m!1200633))

(declare-fun m!1200635 () Bool)

(assert (=> start!110824 m!1200635))

(declare-fun m!1200637 () Bool)

(assert (=> mapNonEmpty!54712 m!1200637))

(declare-fun m!1200639 () Bool)

(assert (=> b!1311709 m!1200639))

(declare-fun m!1200641 () Bool)

(assert (=> b!1311708 m!1200641))

(assert (=> b!1311708 m!1200641))

(declare-fun m!1200643 () Bool)

(assert (=> b!1311708 m!1200643))

(declare-fun m!1200645 () Bool)

(assert (=> b!1311716 m!1200645))

(check-sat (not b_next!29659) (not start!110824) (not b!1311709) tp_is_empty!35389 (not b!1311715) b_and!47849 (not b!1311716) (not b!1311710) (not mapNonEmpty!54712) (not b!1311708))
(check-sat b_and!47849 (not b_next!29659))
