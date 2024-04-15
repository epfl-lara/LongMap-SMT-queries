; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110692 () Bool)

(assert start!110692)

(declare-fun b_free!29527 () Bool)

(declare-fun b_next!29527 () Bool)

(assert (=> start!110692 (= b_free!29527 (not b_next!29527))))

(declare-fun tp!103904 () Bool)

(declare-fun b_and!47717 () Bool)

(assert (=> start!110692 (= tp!103904 b_and!47717)))

(declare-fun mapNonEmpty!54514 () Bool)

(declare-fun mapRes!54514 () Bool)

(declare-fun tp!103903 () Bool)

(declare-fun e!747281 () Bool)

(assert (=> mapNonEmpty!54514 (= mapRes!54514 (and tp!103903 e!747281))))

(declare-datatypes ((V!52113 0))(
  ( (V!52114 (val!17703 Int)) )
))
(declare-datatypes ((ValueCell!16730 0))(
  ( (ValueCellFull!16730 (v!20329 V!52113)) (EmptyCell!16730) )
))
(declare-fun mapRest!54514 () (Array (_ BitVec 32) ValueCell!16730))

(declare-fun mapValue!54514 () ValueCell!16730)

(declare-datatypes ((array!87419 0))(
  ( (array!87420 (arr!42190 (Array (_ BitVec 32) ValueCell!16730)) (size!42742 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87419)

(declare-fun mapKey!54514 () (_ BitVec 32))

(assert (=> mapNonEmpty!54514 (= (arr!42190 _values!1354) (store mapRest!54514 mapKey!54514 mapValue!54514))))

(declare-fun b!1309761 () Bool)

(declare-fun res!869478 () Bool)

(declare-fun e!747282 () Bool)

(assert (=> b!1309761 (=> (not res!869478) (not e!747282))))

(declare-datatypes ((array!87421 0))(
  ( (array!87422 (arr!42191 (Array (_ BitVec 32) (_ BitVec 64))) (size!42743 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87421)

(declare-datatypes ((List!30014 0))(
  ( (Nil!30011) (Cons!30010 (h!31219 (_ BitVec 64)) (t!43612 List!30014)) )
))
(declare-fun arrayNoDuplicates!0 (array!87421 (_ BitVec 32) List!30014) Bool)

(assert (=> b!1309761 (= res!869478 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30011))))

(declare-fun b!1309762 () Bool)

(declare-fun e!747283 () Bool)

(declare-fun tp_is_empty!35257 () Bool)

(assert (=> b!1309762 (= e!747283 tp_is_empty!35257)))

(declare-fun mapIsEmpty!54514 () Bool)

(assert (=> mapIsEmpty!54514 mapRes!54514))

(declare-fun b!1309763 () Bool)

(declare-fun e!747284 () Bool)

(assert (=> b!1309763 (= e!747284 (and e!747283 mapRes!54514))))

(declare-fun condMapEmpty!54514 () Bool)

(declare-fun mapDefault!54514 () ValueCell!16730)

(assert (=> b!1309763 (= condMapEmpty!54514 (= (arr!42190 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16730)) mapDefault!54514)))))

(declare-fun b!1309764 () Bool)

(assert (=> b!1309764 (= e!747282 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52113)

(declare-fun zeroValue!1296 () V!52113)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((tuple2!22888 0))(
  ( (tuple2!22889 (_1!11455 (_ BitVec 64)) (_2!11455 V!52113)) )
))
(declare-datatypes ((List!30015 0))(
  ( (Nil!30012) (Cons!30011 (h!31220 tuple2!22888) (t!43613 List!30015)) )
))
(declare-datatypes ((ListLongMap!20545 0))(
  ( (ListLongMap!20546 (toList!10288 List!30015)) )
))
(declare-fun contains!8365 (ListLongMap!20545 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5183 (array!87421 array!87419 (_ BitVec 32) (_ BitVec 32) V!52113 V!52113 (_ BitVec 32) Int) ListLongMap!20545)

(assert (=> b!1309764 (contains!8365 (getCurrentListMap!5183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43153 0))(
  ( (Unit!43154) )
))
(declare-fun lt!585123 () Unit!43153)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!3 (array!87421 array!87419 (_ BitVec 32) (_ BitVec 32) V!52113 V!52113 (_ BitVec 64) (_ BitVec 32) Int) Unit!43153)

(assert (=> b!1309764 (= lt!585123 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!3 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1309765 () Bool)

(declare-fun res!869477 () Bool)

(assert (=> b!1309765 (=> (not res!869477) (not e!747282))))

(assert (=> b!1309765 (= res!869477 (contains!8365 (getCurrentListMap!5183 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!869479 () Bool)

(assert (=> start!110692 (=> (not res!869479) (not e!747282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110692 (= res!869479 (validMask!0 mask!2040))))

(assert (=> start!110692 e!747282))

(assert (=> start!110692 tp!103904))

(declare-fun array_inv!32069 (array!87421) Bool)

(assert (=> start!110692 (array_inv!32069 _keys!1628)))

(assert (=> start!110692 true))

(assert (=> start!110692 tp_is_empty!35257))

(declare-fun array_inv!32070 (array!87419) Bool)

(assert (=> start!110692 (and (array_inv!32070 _values!1354) e!747284)))

(declare-fun b!1309766 () Bool)

(declare-fun res!869475 () Bool)

(assert (=> b!1309766 (=> (not res!869475) (not e!747282))))

(assert (=> b!1309766 (= res!869475 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42743 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309767 () Bool)

(declare-fun res!869474 () Bool)

(assert (=> b!1309767 (=> (not res!869474) (not e!747282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87421 (_ BitVec 32)) Bool)

(assert (=> b!1309767 (= res!869474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309768 () Bool)

(declare-fun res!869476 () Bool)

(assert (=> b!1309768 (=> (not res!869476) (not e!747282))))

(assert (=> b!1309768 (= res!869476 (and (= (size!42742 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42743 _keys!1628) (size!42742 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309769 () Bool)

(declare-fun res!869481 () Bool)

(assert (=> b!1309769 (=> (not res!869481) (not e!747282))))

(assert (=> b!1309769 (= res!869481 (not (= (select (arr!42191 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1309770 () Bool)

(declare-fun res!869482 () Bool)

(assert (=> b!1309770 (=> (not res!869482) (not e!747282))))

(assert (=> b!1309770 (= res!869482 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1309771 () Bool)

(assert (=> b!1309771 (= e!747281 tp_is_empty!35257)))

(declare-fun b!1309772 () Bool)

(declare-fun res!869480 () Bool)

(assert (=> b!1309772 (=> (not res!869480) (not e!747282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309772 (= res!869480 (validKeyInArray!0 (select (arr!42191 _keys!1628) from!2020)))))

(assert (= (and start!110692 res!869479) b!1309768))

(assert (= (and b!1309768 res!869476) b!1309767))

(assert (= (and b!1309767 res!869474) b!1309761))

(assert (= (and b!1309761 res!869478) b!1309766))

(assert (= (and b!1309766 res!869475) b!1309765))

(assert (= (and b!1309765 res!869477) b!1309769))

(assert (= (and b!1309769 res!869481) b!1309772))

(assert (= (and b!1309772 res!869480) b!1309770))

(assert (= (and b!1309770 res!869482) b!1309764))

(assert (= (and b!1309763 condMapEmpty!54514) mapIsEmpty!54514))

(assert (= (and b!1309763 (not condMapEmpty!54514)) mapNonEmpty!54514))

(get-info :version)

(assert (= (and mapNonEmpty!54514 ((_ is ValueCellFull!16730) mapValue!54514)) b!1309771))

(assert (= (and b!1309763 ((_ is ValueCellFull!16730) mapDefault!54514)) b!1309762))

(assert (= start!110692 b!1309763))

(declare-fun m!1199265 () Bool)

(assert (=> start!110692 m!1199265))

(declare-fun m!1199267 () Bool)

(assert (=> start!110692 m!1199267))

(declare-fun m!1199269 () Bool)

(assert (=> start!110692 m!1199269))

(declare-fun m!1199271 () Bool)

(assert (=> b!1309765 m!1199271))

(assert (=> b!1309765 m!1199271))

(declare-fun m!1199273 () Bool)

(assert (=> b!1309765 m!1199273))

(declare-fun m!1199275 () Bool)

(assert (=> b!1309764 m!1199275))

(assert (=> b!1309764 m!1199275))

(declare-fun m!1199277 () Bool)

(assert (=> b!1309764 m!1199277))

(declare-fun m!1199279 () Bool)

(assert (=> b!1309764 m!1199279))

(declare-fun m!1199281 () Bool)

(assert (=> b!1309772 m!1199281))

(assert (=> b!1309772 m!1199281))

(declare-fun m!1199283 () Bool)

(assert (=> b!1309772 m!1199283))

(assert (=> b!1309769 m!1199281))

(declare-fun m!1199285 () Bool)

(assert (=> b!1309767 m!1199285))

(declare-fun m!1199287 () Bool)

(assert (=> mapNonEmpty!54514 m!1199287))

(declare-fun m!1199289 () Bool)

(assert (=> b!1309761 m!1199289))

(check-sat (not start!110692) (not b!1309761) (not b!1309764) (not b!1309772) (not b_next!29527) b_and!47717 (not b!1309767) (not mapNonEmpty!54514) (not b!1309765) tp_is_empty!35257)
(check-sat b_and!47717 (not b_next!29527))
