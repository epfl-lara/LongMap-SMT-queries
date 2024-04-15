; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110836 () Bool)

(assert start!110836)

(declare-fun b_free!29671 () Bool)

(declare-fun b_next!29671 () Bool)

(assert (=> start!110836 (= b_free!29671 (not b_next!29671))))

(declare-fun tp!104335 () Bool)

(declare-fun b_and!47861 () Bool)

(assert (=> start!110836 (= tp!104335 b_and!47861)))

(declare-fun mapNonEmpty!54730 () Bool)

(declare-fun mapRes!54730 () Bool)

(declare-fun tp!104336 () Bool)

(declare-fun e!748361 () Bool)

(assert (=> mapNonEmpty!54730 (= mapRes!54730 (and tp!104336 e!748361))))

(declare-fun mapKey!54730 () (_ BitVec 32))

(declare-datatypes ((V!52305 0))(
  ( (V!52306 (val!17775 Int)) )
))
(declare-datatypes ((ValueCell!16802 0))(
  ( (ValueCellFull!16802 (v!20401 V!52305)) (EmptyCell!16802) )
))
(declare-fun mapValue!54730 () ValueCell!16802)

(declare-datatypes ((array!87695 0))(
  ( (array!87696 (arr!42328 (Array (_ BitVec 32) ValueCell!16802)) (size!42880 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87695)

(declare-fun mapRest!54730 () (Array (_ BitVec 32) ValueCell!16802))

(assert (=> mapNonEmpty!54730 (= (arr!42328 _values!1354) (store mapRest!54730 mapKey!54730 mapValue!54730))))

(declare-fun mapIsEmpty!54730 () Bool)

(assert (=> mapIsEmpty!54730 mapRes!54730))

(declare-fun b!1311921 () Bool)

(declare-fun tp_is_empty!35401 () Bool)

(assert (=> b!1311921 (= e!748361 tp_is_empty!35401)))

(declare-fun b!1311922 () Bool)

(declare-fun e!748364 () Bool)

(assert (=> b!1311922 (= e!748364 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87697 0))(
  ( (array!87698 (arr!42329 (Array (_ BitVec 32) (_ BitVec 64))) (size!42881 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87697)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52305)

(declare-fun zeroValue!1296 () V!52305)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22998 0))(
  ( (tuple2!22999 (_1!11510 (_ BitVec 64)) (_2!11510 V!52305)) )
))
(declare-datatypes ((List!30118 0))(
  ( (Nil!30115) (Cons!30114 (h!31323 tuple2!22998) (t!43716 List!30118)) )
))
(declare-datatypes ((ListLongMap!20655 0))(
  ( (ListLongMap!20656 (toList!10343 List!30118)) )
))
(declare-fun contains!8420 (ListLongMap!20655 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5238 (array!87697 array!87695 (_ BitVec 32) (_ BitVec 32) V!52305 V!52305 (_ BitVec 32) Int) ListLongMap!20655)

(assert (=> b!1311922 (contains!8420 (getCurrentListMap!5238 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43201 0))(
  ( (Unit!43202) )
))
(declare-fun lt!585339 () Unit!43201)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!11 (array!87697 array!87695 (_ BitVec 32) (_ BitVec 32) V!52305 V!52305 (_ BitVec 64) (_ BitVec 32) Int) Unit!43201)

(assert (=> b!1311922 (= lt!585339 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!11 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311923 () Bool)

(declare-fun res!870993 () Bool)

(assert (=> b!1311923 (=> (not res!870993) (not e!748364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311923 (= res!870993 (validKeyInArray!0 (select (arr!42329 _keys!1628) from!2020)))))

(declare-fun b!1311924 () Bool)

(declare-fun res!870994 () Bool)

(assert (=> b!1311924 (=> (not res!870994) (not e!748364))))

(assert (=> b!1311924 (= res!870994 (not (= (select (arr!42329 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1311925 () Bool)

(declare-fun res!870991 () Bool)

(assert (=> b!1311925 (=> (not res!870991) (not e!748364))))

(declare-datatypes ((List!30119 0))(
  ( (Nil!30116) (Cons!30115 (h!31324 (_ BitVec 64)) (t!43717 List!30119)) )
))
(declare-fun arrayNoDuplicates!0 (array!87697 (_ BitVec 32) List!30119) Bool)

(assert (=> b!1311925 (= res!870991 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30116))))

(declare-fun b!1311926 () Bool)

(declare-fun res!870987 () Bool)

(assert (=> b!1311926 (=> (not res!870987) (not e!748364))))

(assert (=> b!1311926 (= res!870987 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1311927 () Bool)

(declare-fun res!870989 () Bool)

(assert (=> b!1311927 (=> (not res!870989) (not e!748364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87697 (_ BitVec 32)) Bool)

(assert (=> b!1311927 (= res!870989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!870986 () Bool)

(assert (=> start!110836 (=> (not res!870986) (not e!748364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110836 (= res!870986 (validMask!0 mask!2040))))

(assert (=> start!110836 e!748364))

(assert (=> start!110836 tp!104335))

(declare-fun array_inv!32169 (array!87697) Bool)

(assert (=> start!110836 (array_inv!32169 _keys!1628)))

(assert (=> start!110836 true))

(assert (=> start!110836 tp_is_empty!35401))

(declare-fun e!748360 () Bool)

(declare-fun array_inv!32170 (array!87695) Bool)

(assert (=> start!110836 (and (array_inv!32170 _values!1354) e!748360)))

(declare-fun b!1311928 () Bool)

(declare-fun res!870990 () Bool)

(assert (=> b!1311928 (=> (not res!870990) (not e!748364))))

(assert (=> b!1311928 (= res!870990 (and (= (size!42880 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42881 _keys!1628) (size!42880 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311929 () Bool)

(declare-fun res!870988 () Bool)

(assert (=> b!1311929 (=> (not res!870988) (not e!748364))))

(assert (=> b!1311929 (= res!870988 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42881 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311930 () Bool)

(declare-fun e!748362 () Bool)

(assert (=> b!1311930 (= e!748360 (and e!748362 mapRes!54730))))

(declare-fun condMapEmpty!54730 () Bool)

(declare-fun mapDefault!54730 () ValueCell!16802)

(assert (=> b!1311930 (= condMapEmpty!54730 (= (arr!42328 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16802)) mapDefault!54730)))))

(declare-fun b!1311931 () Bool)

(declare-fun res!870992 () Bool)

(assert (=> b!1311931 (=> (not res!870992) (not e!748364))))

(assert (=> b!1311931 (= res!870992 (contains!8420 (getCurrentListMap!5238 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311932 () Bool)

(assert (=> b!1311932 (= e!748362 tp_is_empty!35401)))

(assert (= (and start!110836 res!870986) b!1311928))

(assert (= (and b!1311928 res!870990) b!1311927))

(assert (= (and b!1311927 res!870989) b!1311925))

(assert (= (and b!1311925 res!870991) b!1311929))

(assert (= (and b!1311929 res!870988) b!1311931))

(assert (= (and b!1311931 res!870992) b!1311924))

(assert (= (and b!1311924 res!870994) b!1311923))

(assert (= (and b!1311923 res!870993) b!1311926))

(assert (= (and b!1311926 res!870987) b!1311922))

(assert (= (and b!1311930 condMapEmpty!54730) mapIsEmpty!54730))

(assert (= (and b!1311930 (not condMapEmpty!54730)) mapNonEmpty!54730))

(get-info :version)

(assert (= (and mapNonEmpty!54730 ((_ is ValueCellFull!16802) mapValue!54730)) b!1311921))

(assert (= (and b!1311930 ((_ is ValueCellFull!16802) mapDefault!54730)) b!1311932))

(assert (= start!110836 b!1311930))

(declare-fun m!1200777 () Bool)

(assert (=> b!1311923 m!1200777))

(assert (=> b!1311923 m!1200777))

(declare-fun m!1200779 () Bool)

(assert (=> b!1311923 m!1200779))

(declare-fun m!1200781 () Bool)

(assert (=> start!110836 m!1200781))

(declare-fun m!1200783 () Bool)

(assert (=> start!110836 m!1200783))

(declare-fun m!1200785 () Bool)

(assert (=> start!110836 m!1200785))

(assert (=> b!1311924 m!1200777))

(declare-fun m!1200787 () Bool)

(assert (=> b!1311922 m!1200787))

(assert (=> b!1311922 m!1200787))

(declare-fun m!1200789 () Bool)

(assert (=> b!1311922 m!1200789))

(declare-fun m!1200791 () Bool)

(assert (=> b!1311922 m!1200791))

(declare-fun m!1200793 () Bool)

(assert (=> b!1311931 m!1200793))

(assert (=> b!1311931 m!1200793))

(declare-fun m!1200795 () Bool)

(assert (=> b!1311931 m!1200795))

(declare-fun m!1200797 () Bool)

(assert (=> b!1311925 m!1200797))

(declare-fun m!1200799 () Bool)

(assert (=> mapNonEmpty!54730 m!1200799))

(declare-fun m!1200801 () Bool)

(assert (=> b!1311927 m!1200801))

(check-sat (not mapNonEmpty!54730) tp_is_empty!35401 (not b!1311931) (not b!1311923) (not b!1311922) (not start!110836) (not b_next!29671) (not b!1311927) b_and!47861 (not b!1311925))
(check-sat b_and!47861 (not b_next!29671))
