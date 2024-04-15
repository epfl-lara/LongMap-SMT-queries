; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110620 () Bool)

(assert start!110620)

(declare-fun b_free!29455 () Bool)

(declare-fun b_next!29455 () Bool)

(assert (=> start!110620 (= b_free!29455 (not b_next!29455))))

(declare-fun tp!103687 () Bool)

(declare-fun b_and!47645 () Bool)

(assert (=> start!110620 (= tp!103687 b_and!47645)))

(declare-fun b!1308853 () Bool)

(declare-fun e!746744 () Bool)

(declare-fun tp_is_empty!35185 () Bool)

(assert (=> b!1308853 (= e!746744 tp_is_empty!35185)))

(declare-fun b!1308854 () Bool)

(declare-fun e!746740 () Bool)

(assert (=> b!1308854 (= e!746740 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87283 0))(
  ( (array!87284 (arr!42122 (Array (_ BitVec 32) (_ BitVec 64))) (size!42674 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87283)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun lt!585015 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52017 0))(
  ( (V!52018 (val!17667 Int)) )
))
(declare-fun minValue!1296 () V!52017)

(declare-datatypes ((ValueCell!16694 0))(
  ( (ValueCellFull!16694 (v!20293 V!52017)) (EmptyCell!16694) )
))
(declare-datatypes ((array!87285 0))(
  ( (array!87286 (arr!42123 (Array (_ BitVec 32) ValueCell!16694)) (size!42675 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87285)

(declare-fun zeroValue!1296 () V!52017)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22832 0))(
  ( (tuple2!22833 (_1!11427 (_ BitVec 64)) (_2!11427 V!52017)) )
))
(declare-datatypes ((List!29960 0))(
  ( (Nil!29957) (Cons!29956 (h!31165 tuple2!22832) (t!43558 List!29960)) )
))
(declare-datatypes ((ListLongMap!20489 0))(
  ( (ListLongMap!20490 (toList!10260 List!29960)) )
))
(declare-fun contains!8337 (ListLongMap!20489 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5155 (array!87283 array!87285 (_ BitVec 32) (_ BitVec 32) V!52017 V!52017 (_ BitVec 32) Int) ListLongMap!20489)

(assert (=> b!1308854 (= lt!585015 (contains!8337 (getCurrentListMap!5155 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308855 () Bool)

(declare-fun res!868891 () Bool)

(assert (=> b!1308855 (=> (not res!868891) (not e!746740))))

(assert (=> b!1308855 (= res!868891 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42674 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!868894 () Bool)

(assert (=> start!110620 (=> (not res!868894) (not e!746740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110620 (= res!868894 (validMask!0 mask!2040))))

(assert (=> start!110620 e!746740))

(assert (=> start!110620 tp!103687))

(declare-fun array_inv!32029 (array!87283) Bool)

(assert (=> start!110620 (array_inv!32029 _keys!1628)))

(assert (=> start!110620 true))

(assert (=> start!110620 tp_is_empty!35185))

(declare-fun e!746743 () Bool)

(declare-fun array_inv!32030 (array!87285) Bool)

(assert (=> start!110620 (and (array_inv!32030 _values!1354) e!746743)))

(declare-fun b!1308856 () Bool)

(declare-fun e!746741 () Bool)

(declare-fun mapRes!54406 () Bool)

(assert (=> b!1308856 (= e!746743 (and e!746741 mapRes!54406))))

(declare-fun condMapEmpty!54406 () Bool)

(declare-fun mapDefault!54406 () ValueCell!16694)

(assert (=> b!1308856 (= condMapEmpty!54406 (= (arr!42123 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16694)) mapDefault!54406)))))

(declare-fun b!1308857 () Bool)

(assert (=> b!1308857 (= e!746741 tp_is_empty!35185)))

(declare-fun mapNonEmpty!54406 () Bool)

(declare-fun tp!103688 () Bool)

(assert (=> mapNonEmpty!54406 (= mapRes!54406 (and tp!103688 e!746744))))

(declare-fun mapRest!54406 () (Array (_ BitVec 32) ValueCell!16694))

(declare-fun mapValue!54406 () ValueCell!16694)

(declare-fun mapKey!54406 () (_ BitVec 32))

(assert (=> mapNonEmpty!54406 (= (arr!42123 _values!1354) (store mapRest!54406 mapKey!54406 mapValue!54406))))

(declare-fun mapIsEmpty!54406 () Bool)

(assert (=> mapIsEmpty!54406 mapRes!54406))

(declare-fun b!1308858 () Bool)

(declare-fun res!868893 () Bool)

(assert (=> b!1308858 (=> (not res!868893) (not e!746740))))

(declare-datatypes ((List!29961 0))(
  ( (Nil!29958) (Cons!29957 (h!31166 (_ BitVec 64)) (t!43559 List!29961)) )
))
(declare-fun arrayNoDuplicates!0 (array!87283 (_ BitVec 32) List!29961) Bool)

(assert (=> b!1308858 (= res!868893 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29958))))

(declare-fun b!1308859 () Bool)

(declare-fun res!868892 () Bool)

(assert (=> b!1308859 (=> (not res!868892) (not e!746740))))

(assert (=> b!1308859 (= res!868892 (and (= (size!42675 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42674 _keys!1628) (size!42675 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308860 () Bool)

(declare-fun res!868890 () Bool)

(assert (=> b!1308860 (=> (not res!868890) (not e!746740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87283 (_ BitVec 32)) Bool)

(assert (=> b!1308860 (= res!868890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110620 res!868894) b!1308859))

(assert (= (and b!1308859 res!868892) b!1308860))

(assert (= (and b!1308860 res!868890) b!1308858))

(assert (= (and b!1308858 res!868893) b!1308855))

(assert (= (and b!1308855 res!868891) b!1308854))

(assert (= (and b!1308856 condMapEmpty!54406) mapIsEmpty!54406))

(assert (= (and b!1308856 (not condMapEmpty!54406)) mapNonEmpty!54406))

(get-info :version)

(assert (= (and mapNonEmpty!54406 ((_ is ValueCellFull!16694) mapValue!54406)) b!1308853))

(assert (= (and b!1308856 ((_ is ValueCellFull!16694) mapDefault!54406)) b!1308857))

(assert (= start!110620 b!1308856))

(declare-fun m!1198659 () Bool)

(assert (=> mapNonEmpty!54406 m!1198659))

(declare-fun m!1198661 () Bool)

(assert (=> b!1308854 m!1198661))

(assert (=> b!1308854 m!1198661))

(declare-fun m!1198663 () Bool)

(assert (=> b!1308854 m!1198663))

(declare-fun m!1198665 () Bool)

(assert (=> b!1308860 m!1198665))

(declare-fun m!1198667 () Bool)

(assert (=> b!1308858 m!1198667))

(declare-fun m!1198669 () Bool)

(assert (=> start!110620 m!1198669))

(declare-fun m!1198671 () Bool)

(assert (=> start!110620 m!1198671))

(declare-fun m!1198673 () Bool)

(assert (=> start!110620 m!1198673))

(check-sat (not start!110620) (not b!1308858) (not mapNonEmpty!54406) (not b!1308854) (not b!1308860) tp_is_empty!35185 b_and!47645 (not b_next!29455))
(check-sat b_and!47645 (not b_next!29455))
