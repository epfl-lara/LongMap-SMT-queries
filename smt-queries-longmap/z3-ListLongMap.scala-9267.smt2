; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111174 () Bool)

(assert start!111174)

(declare-fun b_free!29785 () Bool)

(declare-fun b_next!29785 () Bool)

(assert (=> start!111174 (= b_free!29785 (not b_next!29785))))

(declare-fun tp!104677 () Bool)

(declare-fun b_and!47995 () Bool)

(assert (=> start!111174 (= tp!104677 b_and!47995)))

(declare-fun b!1314857 () Bool)

(declare-fun res!872589 () Bool)

(declare-fun e!750094 () Bool)

(assert (=> b!1314857 (=> (not res!872589) (not e!750094))))

(declare-datatypes ((array!88059 0))(
  ( (array!88060 (arr!42505 (Array (_ BitVec 32) (_ BitVec 64))) (size!43056 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88059)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52457 0))(
  ( (V!52458 (val!17832 Int)) )
))
(declare-datatypes ((ValueCell!16859 0))(
  ( (ValueCellFull!16859 (v!20454 V!52457)) (EmptyCell!16859) )
))
(declare-datatypes ((array!88061 0))(
  ( (array!88062 (arr!42506 (Array (_ BitVec 32) ValueCell!16859)) (size!43057 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88061)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314857 (= res!872589 (and (= (size!43057 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43056 _keys!1628) (size!43057 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314858 () Bool)

(declare-fun res!872587 () Bool)

(assert (=> b!1314858 (=> (not res!872587) (not e!750094))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314858 (= res!872587 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43056 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314859 () Bool)

(declare-fun e!750095 () Bool)

(declare-fun e!750092 () Bool)

(declare-fun mapRes!54901 () Bool)

(assert (=> b!1314859 (= e!750095 (and e!750092 mapRes!54901))))

(declare-fun condMapEmpty!54901 () Bool)

(declare-fun mapDefault!54901 () ValueCell!16859)

(assert (=> b!1314859 (= condMapEmpty!54901 (= (arr!42506 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16859)) mapDefault!54901)))))

(declare-fun mapNonEmpty!54901 () Bool)

(declare-fun tp!104676 () Bool)

(declare-fun e!750091 () Bool)

(assert (=> mapNonEmpty!54901 (= mapRes!54901 (and tp!104676 e!750091))))

(declare-fun mapKey!54901 () (_ BitVec 32))

(declare-fun mapValue!54901 () ValueCell!16859)

(declare-fun mapRest!54901 () (Array (_ BitVec 32) ValueCell!16859))

(assert (=> mapNonEmpty!54901 (= (arr!42506 _values!1354) (store mapRest!54901 mapKey!54901 mapValue!54901))))

(declare-fun b!1314860 () Bool)

(declare-fun tp_is_empty!35515 () Bool)

(assert (=> b!1314860 (= e!750092 tp_is_empty!35515)))

(declare-fun b!1314861 () Bool)

(declare-fun res!872590 () Bool)

(assert (=> b!1314861 (=> (not res!872590) (not e!750094))))

(declare-datatypes ((List!30171 0))(
  ( (Nil!30168) (Cons!30167 (h!31385 (_ BitVec 64)) (t!43769 List!30171)) )
))
(declare-fun arrayNoDuplicates!0 (array!88059 (_ BitVec 32) List!30171) Bool)

(assert (=> b!1314861 (= res!872590 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30168))))

(declare-fun mapIsEmpty!54901 () Bool)

(assert (=> mapIsEmpty!54901 mapRes!54901))

(declare-fun b!1314862 () Bool)

(declare-fun res!872591 () Bool)

(assert (=> b!1314862 (=> (not res!872591) (not e!750094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88059 (_ BitVec 32)) Bool)

(assert (=> b!1314862 (= res!872591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!872588 () Bool)

(assert (=> start!111174 (=> (not res!872588) (not e!750094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111174 (= res!872588 (validMask!0 mask!2040))))

(assert (=> start!111174 e!750094))

(assert (=> start!111174 tp!104677))

(declare-fun array_inv!32371 (array!88059) Bool)

(assert (=> start!111174 (array_inv!32371 _keys!1628)))

(assert (=> start!111174 true))

(assert (=> start!111174 tp_is_empty!35515))

(declare-fun array_inv!32372 (array!88061) Bool)

(assert (=> start!111174 (and (array_inv!32372 _values!1354) e!750095)))

(declare-fun b!1314863 () Bool)

(assert (=> b!1314863 (= e!750094 false)))

(declare-fun lt!586163 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52457)

(declare-fun zeroValue!1296 () V!52457)

(declare-datatypes ((tuple2!23022 0))(
  ( (tuple2!23023 (_1!11522 (_ BitVec 64)) (_2!11522 V!52457)) )
))
(declare-datatypes ((List!30172 0))(
  ( (Nil!30169) (Cons!30168 (h!31386 tuple2!23022) (t!43770 List!30172)) )
))
(declare-datatypes ((ListLongMap!20687 0))(
  ( (ListLongMap!20688 (toList!10359 List!30172)) )
))
(declare-fun contains!8521 (ListLongMap!20687 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5363 (array!88059 array!88061 (_ BitVec 32) (_ BitVec 32) V!52457 V!52457 (_ BitVec 32) Int) ListLongMap!20687)

(assert (=> b!1314863 (= lt!586163 (contains!8521 (getCurrentListMap!5363 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314864 () Bool)

(assert (=> b!1314864 (= e!750091 tp_is_empty!35515)))

(assert (= (and start!111174 res!872588) b!1314857))

(assert (= (and b!1314857 res!872589) b!1314862))

(assert (= (and b!1314862 res!872591) b!1314861))

(assert (= (and b!1314861 res!872590) b!1314858))

(assert (= (and b!1314858 res!872587) b!1314863))

(assert (= (and b!1314859 condMapEmpty!54901) mapIsEmpty!54901))

(assert (= (and b!1314859 (not condMapEmpty!54901)) mapNonEmpty!54901))

(get-info :version)

(assert (= (and mapNonEmpty!54901 ((_ is ValueCellFull!16859) mapValue!54901)) b!1314864))

(assert (= (and b!1314859 ((_ is ValueCellFull!16859) mapDefault!54901)) b!1314860))

(assert (= start!111174 b!1314859))

(declare-fun m!1203965 () Bool)

(assert (=> b!1314863 m!1203965))

(assert (=> b!1314863 m!1203965))

(declare-fun m!1203967 () Bool)

(assert (=> b!1314863 m!1203967))

(declare-fun m!1203969 () Bool)

(assert (=> b!1314861 m!1203969))

(declare-fun m!1203971 () Bool)

(assert (=> mapNonEmpty!54901 m!1203971))

(declare-fun m!1203973 () Bool)

(assert (=> b!1314862 m!1203973))

(declare-fun m!1203975 () Bool)

(assert (=> start!111174 m!1203975))

(declare-fun m!1203977 () Bool)

(assert (=> start!111174 m!1203977))

(declare-fun m!1203979 () Bool)

(assert (=> start!111174 m!1203979))

(check-sat tp_is_empty!35515 (not b!1314862) (not start!111174) b_and!47995 (not mapNonEmpty!54901) (not b_next!29785) (not b!1314861) (not b!1314863))
(check-sat b_and!47995 (not b_next!29785))
