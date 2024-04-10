; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110910 () Bool)

(assert start!110910)

(declare-fun b_free!29745 () Bool)

(declare-fun b_next!29745 () Bool)

(assert (=> start!110910 (= b_free!29745 (not b_next!29745))))

(declare-fun tp!104557 () Bool)

(declare-fun b_and!47953 () Bool)

(assert (=> start!110910 (= tp!104557 b_and!47953)))

(declare-fun mapIsEmpty!54841 () Bool)

(declare-fun mapRes!54841 () Bool)

(assert (=> mapIsEmpty!54841 mapRes!54841))

(declare-fun b!1313051 () Bool)

(declare-fun e!748951 () Bool)

(declare-fun tp_is_empty!35475 () Bool)

(assert (=> b!1313051 (= e!748951 tp_is_empty!35475)))

(declare-fun b!1313053 () Bool)

(declare-fun e!748950 () Bool)

(assert (=> b!1313053 (= e!748950 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87932 0))(
  ( (array!87933 (arr!42446 (Array (_ BitVec 32) (_ BitVec 64))) (size!42996 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87932)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52403 0))(
  ( (V!52404 (val!17812 Int)) )
))
(declare-fun minValue!1296 () V!52403)

(declare-fun lt!585636 () Bool)

(declare-datatypes ((ValueCell!16839 0))(
  ( (ValueCellFull!16839 (v!20439 V!52403)) (EmptyCell!16839) )
))
(declare-datatypes ((array!87934 0))(
  ( (array!87935 (arr!42447 (Array (_ BitVec 32) ValueCell!16839)) (size!42997 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87934)

(declare-fun zeroValue!1296 () V!52403)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22964 0))(
  ( (tuple2!22965 (_1!11493 (_ BitVec 64)) (_2!11493 V!52403)) )
))
(declare-datatypes ((List!30100 0))(
  ( (Nil!30097) (Cons!30096 (h!31305 tuple2!22964) (t!43706 List!30100)) )
))
(declare-datatypes ((ListLongMap!20621 0))(
  ( (ListLongMap!20622 (toList!10326 List!30100)) )
))
(declare-fun contains!8476 (ListLongMap!20621 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5339 (array!87932 array!87934 (_ BitVec 32) (_ BitVec 32) V!52403 V!52403 (_ BitVec 32) Int) ListLongMap!20621)

(assert (=> b!1313053 (= lt!585636 (contains!8476 (getCurrentListMap!5339 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313054 () Bool)

(declare-fun e!748949 () Bool)

(declare-fun e!748952 () Bool)

(assert (=> b!1313054 (= e!748949 (and e!748952 mapRes!54841))))

(declare-fun condMapEmpty!54841 () Bool)

(declare-fun mapDefault!54841 () ValueCell!16839)

(assert (=> b!1313054 (= condMapEmpty!54841 (= (arr!42447 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16839)) mapDefault!54841)))))

(declare-fun mapNonEmpty!54841 () Bool)

(declare-fun tp!104556 () Bool)

(assert (=> mapNonEmpty!54841 (= mapRes!54841 (and tp!104556 e!748951))))

(declare-fun mapKey!54841 () (_ BitVec 32))

(declare-fun mapRest!54841 () (Array (_ BitVec 32) ValueCell!16839))

(declare-fun mapValue!54841 () ValueCell!16839)

(assert (=> mapNonEmpty!54841 (= (arr!42447 _values!1354) (store mapRest!54841 mapKey!54841 mapValue!54841))))

(declare-fun b!1313055 () Bool)

(declare-fun res!871742 () Bool)

(assert (=> b!1313055 (=> (not res!871742) (not e!748950))))

(declare-datatypes ((List!30101 0))(
  ( (Nil!30098) (Cons!30097 (h!31306 (_ BitVec 64)) (t!43707 List!30101)) )
))
(declare-fun arrayNoDuplicates!0 (array!87932 (_ BitVec 32) List!30101) Bool)

(assert (=> b!1313055 (= res!871742 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30098))))

(declare-fun b!1313056 () Bool)

(declare-fun res!871745 () Bool)

(assert (=> b!1313056 (=> (not res!871745) (not e!748950))))

(assert (=> b!1313056 (= res!871745 (and (= (size!42997 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42996 _keys!1628) (size!42997 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313057 () Bool)

(assert (=> b!1313057 (= e!748952 tp_is_empty!35475)))

(declare-fun b!1313058 () Bool)

(declare-fun res!871746 () Bool)

(assert (=> b!1313058 (=> (not res!871746) (not e!748950))))

(assert (=> b!1313058 (= res!871746 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42996 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313052 () Bool)

(declare-fun res!871744 () Bool)

(assert (=> b!1313052 (=> (not res!871744) (not e!748950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87932 (_ BitVec 32)) Bool)

(assert (=> b!1313052 (= res!871744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!871743 () Bool)

(assert (=> start!110910 (=> (not res!871743) (not e!748950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110910 (= res!871743 (validMask!0 mask!2040))))

(assert (=> start!110910 e!748950))

(assert (=> start!110910 tp!104557))

(declare-fun array_inv!32065 (array!87932) Bool)

(assert (=> start!110910 (array_inv!32065 _keys!1628)))

(assert (=> start!110910 true))

(assert (=> start!110910 tp_is_empty!35475))

(declare-fun array_inv!32066 (array!87934) Bool)

(assert (=> start!110910 (and (array_inv!32066 _values!1354) e!748949)))

(assert (= (and start!110910 res!871743) b!1313056))

(assert (= (and b!1313056 res!871745) b!1313052))

(assert (= (and b!1313052 res!871744) b!1313055))

(assert (= (and b!1313055 res!871742) b!1313058))

(assert (= (and b!1313058 res!871746) b!1313053))

(assert (= (and b!1313054 condMapEmpty!54841) mapIsEmpty!54841))

(assert (= (and b!1313054 (not condMapEmpty!54841)) mapNonEmpty!54841))

(get-info :version)

(assert (= (and mapNonEmpty!54841 ((_ is ValueCellFull!16839) mapValue!54841)) b!1313051))

(assert (= (and b!1313054 ((_ is ValueCellFull!16839) mapDefault!54841)) b!1313057))

(assert (= start!110910 b!1313054))

(declare-fun m!1202035 () Bool)

(assert (=> mapNonEmpty!54841 m!1202035))

(declare-fun m!1202037 () Bool)

(assert (=> b!1313053 m!1202037))

(assert (=> b!1313053 m!1202037))

(declare-fun m!1202039 () Bool)

(assert (=> b!1313053 m!1202039))

(declare-fun m!1202041 () Bool)

(assert (=> b!1313055 m!1202041))

(declare-fun m!1202043 () Bool)

(assert (=> b!1313052 m!1202043))

(declare-fun m!1202045 () Bool)

(assert (=> start!110910 m!1202045))

(declare-fun m!1202047 () Bool)

(assert (=> start!110910 m!1202047))

(declare-fun m!1202049 () Bool)

(assert (=> start!110910 m!1202049))

(check-sat (not b_next!29745) (not b!1313052) b_and!47953 (not b!1313053) (not b!1313055) (not mapNonEmpty!54841) (not start!110910) tp_is_empty!35475)
(check-sat b_and!47953 (not b_next!29745))
