; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110712 () Bool)

(assert start!110712)

(declare-fun b_free!29323 () Bool)

(declare-fun b_next!29323 () Bool)

(assert (=> start!110712 (= b_free!29323 (not b_next!29323))))

(declare-fun tp!103290 () Bool)

(declare-fun b_and!47533 () Bool)

(assert (=> start!110712 (= tp!103290 b_and!47533)))

(declare-fun b!1308314 () Bool)

(declare-fun res!868124 () Bool)

(declare-fun e!746626 () Bool)

(assert (=> b!1308314 (=> (not res!868124) (not e!746626))))

(declare-datatypes ((array!87173 0))(
  ( (array!87174 (arr!42062 (Array (_ BitVec 32) (_ BitVec 64))) (size!42613 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87173)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51841 0))(
  ( (V!51842 (val!17601 Int)) )
))
(declare-datatypes ((ValueCell!16628 0))(
  ( (ValueCellFull!16628 (v!20223 V!51841)) (EmptyCell!16628) )
))
(declare-datatypes ((array!87175 0))(
  ( (array!87176 (arr!42063 (Array (_ BitVec 32) ValueCell!16628)) (size!42614 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87175)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308314 (= res!868124 (and (= (size!42614 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42613 _keys!1628) (size!42614 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308315 () Bool)

(declare-fun e!746627 () Bool)

(declare-fun e!746630 () Bool)

(declare-fun mapRes!54208 () Bool)

(assert (=> b!1308315 (= e!746627 (and e!746630 mapRes!54208))))

(declare-fun condMapEmpty!54208 () Bool)

(declare-fun mapDefault!54208 () ValueCell!16628)

(assert (=> b!1308315 (= condMapEmpty!54208 (= (arr!42063 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16628)) mapDefault!54208)))))

(declare-fun b!1308316 () Bool)

(assert (=> b!1308316 (= e!746626 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun zeroValue!1296 () V!51841)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun minValue!1296 () V!51841)

(declare-fun lt!585479 () Bool)

(declare-datatypes ((tuple2!22692 0))(
  ( (tuple2!22693 (_1!11357 (_ BitVec 64)) (_2!11357 V!51841)) )
))
(declare-datatypes ((List!29858 0))(
  ( (Nil!29855) (Cons!29854 (h!31072 tuple2!22692) (t!43456 List!29858)) )
))
(declare-datatypes ((ListLongMap!20357 0))(
  ( (ListLongMap!20358 (toList!10194 List!29858)) )
))
(declare-fun contains!8356 (ListLongMap!20357 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5198 (array!87173 array!87175 (_ BitVec 32) (_ BitVec 32) V!51841 V!51841 (_ BitVec 32) Int) ListLongMap!20357)

(assert (=> b!1308316 (= lt!585479 (contains!8356 (getCurrentListMap!5198 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54208 () Bool)

(assert (=> mapIsEmpty!54208 mapRes!54208))

(declare-fun b!1308317 () Bool)

(declare-fun res!868127 () Bool)

(assert (=> b!1308317 (=> (not res!868127) (not e!746626))))

(declare-datatypes ((List!29859 0))(
  ( (Nil!29856) (Cons!29855 (h!31073 (_ BitVec 64)) (t!43457 List!29859)) )
))
(declare-fun arrayNoDuplicates!0 (array!87173 (_ BitVec 32) List!29859) Bool)

(assert (=> b!1308317 (= res!868127 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29856))))

(declare-fun b!1308318 () Bool)

(declare-fun e!746629 () Bool)

(declare-fun tp_is_empty!35053 () Bool)

(assert (=> b!1308318 (= e!746629 tp_is_empty!35053)))

(declare-fun res!868125 () Bool)

(assert (=> start!110712 (=> (not res!868125) (not e!746626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110712 (= res!868125 (validMask!0 mask!2040))))

(assert (=> start!110712 e!746626))

(assert (=> start!110712 tp!103290))

(declare-fun array_inv!32051 (array!87173) Bool)

(assert (=> start!110712 (array_inv!32051 _keys!1628)))

(assert (=> start!110712 true))

(assert (=> start!110712 tp_is_empty!35053))

(declare-fun array_inv!32052 (array!87175) Bool)

(assert (=> start!110712 (and (array_inv!32052 _values!1354) e!746627)))

(declare-fun b!1308319 () Bool)

(declare-fun res!868123 () Bool)

(assert (=> b!1308319 (=> (not res!868123) (not e!746626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87173 (_ BitVec 32)) Bool)

(assert (=> b!1308319 (= res!868123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54208 () Bool)

(declare-fun tp!103291 () Bool)

(assert (=> mapNonEmpty!54208 (= mapRes!54208 (and tp!103291 e!746629))))

(declare-fun mapValue!54208 () ValueCell!16628)

(declare-fun mapRest!54208 () (Array (_ BitVec 32) ValueCell!16628))

(declare-fun mapKey!54208 () (_ BitVec 32))

(assert (=> mapNonEmpty!54208 (= (arr!42063 _values!1354) (store mapRest!54208 mapKey!54208 mapValue!54208))))

(declare-fun b!1308320 () Bool)

(assert (=> b!1308320 (= e!746630 tp_is_empty!35053)))

(declare-fun b!1308321 () Bool)

(declare-fun res!868126 () Bool)

(assert (=> b!1308321 (=> (not res!868126) (not e!746626))))

(assert (=> b!1308321 (= res!868126 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42613 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!110712 res!868125) b!1308314))

(assert (= (and b!1308314 res!868124) b!1308319))

(assert (= (and b!1308319 res!868123) b!1308317))

(assert (= (and b!1308317 res!868127) b!1308321))

(assert (= (and b!1308321 res!868126) b!1308316))

(assert (= (and b!1308315 condMapEmpty!54208) mapIsEmpty!54208))

(assert (= (and b!1308315 (not condMapEmpty!54208)) mapNonEmpty!54208))

(get-info :version)

(assert (= (and mapNonEmpty!54208 ((_ is ValueCellFull!16628) mapValue!54208)) b!1308318))

(assert (= (and b!1308315 ((_ is ValueCellFull!16628) mapDefault!54208)) b!1308320))

(assert (= start!110712 b!1308315))

(declare-fun m!1199447 () Bool)

(assert (=> start!110712 m!1199447))

(declare-fun m!1199449 () Bool)

(assert (=> start!110712 m!1199449))

(declare-fun m!1199451 () Bool)

(assert (=> start!110712 m!1199451))

(declare-fun m!1199453 () Bool)

(assert (=> mapNonEmpty!54208 m!1199453))

(declare-fun m!1199455 () Bool)

(assert (=> b!1308316 m!1199455))

(assert (=> b!1308316 m!1199455))

(declare-fun m!1199457 () Bool)

(assert (=> b!1308316 m!1199457))

(declare-fun m!1199459 () Bool)

(assert (=> b!1308317 m!1199459))

(declare-fun m!1199461 () Bool)

(assert (=> b!1308319 m!1199461))

(check-sat (not mapNonEmpty!54208) (not b!1308319) tp_is_empty!35053 (not b_next!29323) b_and!47533 (not start!110712) (not b!1308316) (not b!1308317))
(check-sat b_and!47533 (not b_next!29323))
