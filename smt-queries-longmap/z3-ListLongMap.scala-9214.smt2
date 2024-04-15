; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110632 () Bool)

(assert start!110632)

(declare-fun b_free!29467 () Bool)

(declare-fun b_next!29467 () Bool)

(assert (=> start!110632 (= b_free!29467 (not b_next!29467))))

(declare-fun tp!103723 () Bool)

(declare-fun b_and!47657 () Bool)

(assert (=> start!110632 (= tp!103723 b_and!47657)))

(declare-fun b!1308997 () Bool)

(declare-fun e!746834 () Bool)

(assert (=> b!1308997 (= e!746834 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87305 0))(
  ( (array!87306 (arr!42133 (Array (_ BitVec 32) (_ BitVec 64))) (size!42685 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87305)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52033 0))(
  ( (V!52034 (val!17673 Int)) )
))
(declare-fun minValue!1296 () V!52033)

(declare-datatypes ((ValueCell!16700 0))(
  ( (ValueCellFull!16700 (v!20299 V!52033)) (EmptyCell!16700) )
))
(declare-datatypes ((array!87307 0))(
  ( (array!87308 (arr!42134 (Array (_ BitVec 32) ValueCell!16700)) (size!42686 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87307)

(declare-fun zeroValue!1296 () V!52033)

(declare-fun lt!585033 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((tuple2!22842 0))(
  ( (tuple2!22843 (_1!11432 (_ BitVec 64)) (_2!11432 V!52033)) )
))
(declare-datatypes ((List!29970 0))(
  ( (Nil!29967) (Cons!29966 (h!31175 tuple2!22842) (t!43568 List!29970)) )
))
(declare-datatypes ((ListLongMap!20499 0))(
  ( (ListLongMap!20500 (toList!10265 List!29970)) )
))
(declare-fun contains!8342 (ListLongMap!20499 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5160 (array!87305 array!87307 (_ BitVec 32) (_ BitVec 32) V!52033 V!52033 (_ BitVec 32) Int) ListLongMap!20499)

(assert (=> b!1308997 (= lt!585033 (contains!8342 (getCurrentListMap!5160 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308998 () Bool)

(declare-fun res!868984 () Bool)

(assert (=> b!1308998 (=> (not res!868984) (not e!746834))))

(assert (=> b!1308998 (= res!868984 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42685 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308999 () Bool)

(declare-fun res!868980 () Bool)

(assert (=> b!1308999 (=> (not res!868980) (not e!746834))))

(declare-datatypes ((List!29971 0))(
  ( (Nil!29968) (Cons!29967 (h!31176 (_ BitVec 64)) (t!43569 List!29971)) )
))
(declare-fun arrayNoDuplicates!0 (array!87305 (_ BitVec 32) List!29971) Bool)

(assert (=> b!1308999 (= res!868980 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29968))))

(declare-fun b!1309000 () Bool)

(declare-fun res!868981 () Bool)

(assert (=> b!1309000 (=> (not res!868981) (not e!746834))))

(assert (=> b!1309000 (= res!868981 (and (= (size!42686 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42685 _keys!1628) (size!42686 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309001 () Bool)

(declare-fun res!868983 () Bool)

(assert (=> b!1309001 (=> (not res!868983) (not e!746834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87305 (_ BitVec 32)) Bool)

(assert (=> b!1309001 (= res!868983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309002 () Bool)

(declare-fun e!746833 () Bool)

(declare-fun tp_is_empty!35197 () Bool)

(assert (=> b!1309002 (= e!746833 tp_is_empty!35197)))

(declare-fun b!1309003 () Bool)

(declare-fun e!746831 () Bool)

(declare-fun mapRes!54424 () Bool)

(assert (=> b!1309003 (= e!746831 (and e!746833 mapRes!54424))))

(declare-fun condMapEmpty!54424 () Bool)

(declare-fun mapDefault!54424 () ValueCell!16700)

(assert (=> b!1309003 (= condMapEmpty!54424 (= (arr!42134 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16700)) mapDefault!54424)))))

(declare-fun mapNonEmpty!54424 () Bool)

(declare-fun tp!103724 () Bool)

(declare-fun e!746832 () Bool)

(assert (=> mapNonEmpty!54424 (= mapRes!54424 (and tp!103724 e!746832))))

(declare-fun mapValue!54424 () ValueCell!16700)

(declare-fun mapKey!54424 () (_ BitVec 32))

(declare-fun mapRest!54424 () (Array (_ BitVec 32) ValueCell!16700))

(assert (=> mapNonEmpty!54424 (= (arr!42134 _values!1354) (store mapRest!54424 mapKey!54424 mapValue!54424))))

(declare-fun b!1309004 () Bool)

(assert (=> b!1309004 (= e!746832 tp_is_empty!35197)))

(declare-fun res!868982 () Bool)

(assert (=> start!110632 (=> (not res!868982) (not e!746834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110632 (= res!868982 (validMask!0 mask!2040))))

(assert (=> start!110632 e!746834))

(assert (=> start!110632 tp!103723))

(declare-fun array_inv!32037 (array!87305) Bool)

(assert (=> start!110632 (array_inv!32037 _keys!1628)))

(assert (=> start!110632 true))

(assert (=> start!110632 tp_is_empty!35197))

(declare-fun array_inv!32038 (array!87307) Bool)

(assert (=> start!110632 (and (array_inv!32038 _values!1354) e!746831)))

(declare-fun mapIsEmpty!54424 () Bool)

(assert (=> mapIsEmpty!54424 mapRes!54424))

(assert (= (and start!110632 res!868982) b!1309000))

(assert (= (and b!1309000 res!868981) b!1309001))

(assert (= (and b!1309001 res!868983) b!1308999))

(assert (= (and b!1308999 res!868980) b!1308998))

(assert (= (and b!1308998 res!868984) b!1308997))

(assert (= (and b!1309003 condMapEmpty!54424) mapIsEmpty!54424))

(assert (= (and b!1309003 (not condMapEmpty!54424)) mapNonEmpty!54424))

(get-info :version)

(assert (= (and mapNonEmpty!54424 ((_ is ValueCellFull!16700) mapValue!54424)) b!1309004))

(assert (= (and b!1309003 ((_ is ValueCellFull!16700) mapDefault!54424)) b!1309002))

(assert (= start!110632 b!1309003))

(declare-fun m!1198755 () Bool)

(assert (=> start!110632 m!1198755))

(declare-fun m!1198757 () Bool)

(assert (=> start!110632 m!1198757))

(declare-fun m!1198759 () Bool)

(assert (=> start!110632 m!1198759))

(declare-fun m!1198761 () Bool)

(assert (=> b!1308999 m!1198761))

(declare-fun m!1198763 () Bool)

(assert (=> b!1308997 m!1198763))

(assert (=> b!1308997 m!1198763))

(declare-fun m!1198765 () Bool)

(assert (=> b!1308997 m!1198765))

(declare-fun m!1198767 () Bool)

(assert (=> b!1309001 m!1198767))

(declare-fun m!1198769 () Bool)

(assert (=> mapNonEmpty!54424 m!1198769))

(check-sat tp_is_empty!35197 (not b!1308997) (not b_next!29467) (not mapNonEmpty!54424) (not b!1308999) (not b!1309001) (not start!110632) b_and!47657)
(check-sat b_and!47657 (not b_next!29467))
