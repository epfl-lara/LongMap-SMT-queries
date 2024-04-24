; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110748 () Bool)

(assert start!110748)

(declare-fun b_free!29359 () Bool)

(declare-fun b_next!29359 () Bool)

(assert (=> start!110748 (= b_free!29359 (not b_next!29359))))

(declare-fun tp!103398 () Bool)

(declare-fun b_and!47569 () Bool)

(assert (=> start!110748 (= tp!103398 b_and!47569)))

(declare-fun mapIsEmpty!54262 () Bool)

(declare-fun mapRes!54262 () Bool)

(assert (=> mapIsEmpty!54262 mapRes!54262))

(declare-fun b!1308746 () Bool)

(declare-fun res!868393 () Bool)

(declare-fun e!746896 () Bool)

(assert (=> b!1308746 (=> (not res!868393) (not e!746896))))

(declare-datatypes ((array!87241 0))(
  ( (array!87242 (arr!42096 (Array (_ BitVec 32) (_ BitVec 64))) (size!42647 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87241)

(declare-datatypes ((V!51889 0))(
  ( (V!51890 (val!17619 Int)) )
))
(declare-datatypes ((ValueCell!16646 0))(
  ( (ValueCellFull!16646 (v!20241 V!51889)) (EmptyCell!16646) )
))
(declare-datatypes ((array!87243 0))(
  ( (array!87244 (arr!42097 (Array (_ BitVec 32) ValueCell!16646)) (size!42648 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87243)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(assert (=> b!1308746 (= res!868393 (and (= (size!42648 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42647 _keys!1628) (size!42648 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54262 () Bool)

(declare-fun tp!103399 () Bool)

(declare-fun e!746898 () Bool)

(assert (=> mapNonEmpty!54262 (= mapRes!54262 (and tp!103399 e!746898))))

(declare-fun mapKey!54262 () (_ BitVec 32))

(declare-fun mapValue!54262 () ValueCell!16646)

(declare-fun mapRest!54262 () (Array (_ BitVec 32) ValueCell!16646))

(assert (=> mapNonEmpty!54262 (= (arr!42097 _values!1354) (store mapRest!54262 mapKey!54262 mapValue!54262))))

(declare-fun b!1308747 () Bool)

(declare-fun res!868396 () Bool)

(assert (=> b!1308747 (=> (not res!868396) (not e!746896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87241 (_ BitVec 32)) Bool)

(assert (=> b!1308747 (= res!868396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!868394 () Bool)

(assert (=> start!110748 (=> (not res!868394) (not e!746896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110748 (= res!868394 (validMask!0 mask!2040))))

(assert (=> start!110748 e!746896))

(assert (=> start!110748 tp!103398))

(declare-fun array_inv!32075 (array!87241) Bool)

(assert (=> start!110748 (array_inv!32075 _keys!1628)))

(assert (=> start!110748 true))

(declare-fun tp_is_empty!35089 () Bool)

(assert (=> start!110748 tp_is_empty!35089))

(declare-fun e!746899 () Bool)

(declare-fun array_inv!32076 (array!87243) Bool)

(assert (=> start!110748 (and (array_inv!32076 _values!1354) e!746899)))

(declare-fun b!1308748 () Bool)

(declare-fun e!746897 () Bool)

(assert (=> b!1308748 (= e!746897 tp_is_empty!35089)))

(declare-fun b!1308749 () Bool)

(assert (=> b!1308749 (= e!746896 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun lt!585533 () Bool)

(declare-fun minValue!1296 () V!51889)

(declare-fun zeroValue!1296 () V!51889)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22710 0))(
  ( (tuple2!22711 (_1!11366 (_ BitVec 64)) (_2!11366 V!51889)) )
))
(declare-datatypes ((List!29877 0))(
  ( (Nil!29874) (Cons!29873 (h!31091 tuple2!22710) (t!43475 List!29877)) )
))
(declare-datatypes ((ListLongMap!20375 0))(
  ( (ListLongMap!20376 (toList!10203 List!29877)) )
))
(declare-fun contains!8365 (ListLongMap!20375 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5207 (array!87241 array!87243 (_ BitVec 32) (_ BitVec 32) V!51889 V!51889 (_ BitVec 32) Int) ListLongMap!20375)

(assert (=> b!1308749 (= lt!585533 (contains!8365 (getCurrentListMap!5207 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308750 () Bool)

(declare-fun res!868395 () Bool)

(assert (=> b!1308750 (=> (not res!868395) (not e!746896))))

(declare-datatypes ((List!29878 0))(
  ( (Nil!29875) (Cons!29874 (h!31092 (_ BitVec 64)) (t!43476 List!29878)) )
))
(declare-fun arrayNoDuplicates!0 (array!87241 (_ BitVec 32) List!29878) Bool)

(assert (=> b!1308750 (= res!868395 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29875))))

(declare-fun b!1308751 () Bool)

(assert (=> b!1308751 (= e!746898 tp_is_empty!35089)))

(declare-fun b!1308752 () Bool)

(assert (=> b!1308752 (= e!746899 (and e!746897 mapRes!54262))))

(declare-fun condMapEmpty!54262 () Bool)

(declare-fun mapDefault!54262 () ValueCell!16646)

(assert (=> b!1308752 (= condMapEmpty!54262 (= (arr!42097 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16646)) mapDefault!54262)))))

(declare-fun b!1308753 () Bool)

(declare-fun res!868397 () Bool)

(assert (=> b!1308753 (=> (not res!868397) (not e!746896))))

(assert (=> b!1308753 (= res!868397 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42647 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!110748 res!868394) b!1308746))

(assert (= (and b!1308746 res!868393) b!1308747))

(assert (= (and b!1308747 res!868396) b!1308750))

(assert (= (and b!1308750 res!868395) b!1308753))

(assert (= (and b!1308753 res!868397) b!1308749))

(assert (= (and b!1308752 condMapEmpty!54262) mapIsEmpty!54262))

(assert (= (and b!1308752 (not condMapEmpty!54262)) mapNonEmpty!54262))

(get-info :version)

(assert (= (and mapNonEmpty!54262 ((_ is ValueCellFull!16646) mapValue!54262)) b!1308751))

(assert (= (and b!1308752 ((_ is ValueCellFull!16646) mapDefault!54262)) b!1308748))

(assert (= start!110748 b!1308752))

(declare-fun m!1199735 () Bool)

(assert (=> b!1308749 m!1199735))

(assert (=> b!1308749 m!1199735))

(declare-fun m!1199737 () Bool)

(assert (=> b!1308749 m!1199737))

(declare-fun m!1199739 () Bool)

(assert (=> b!1308750 m!1199739))

(declare-fun m!1199741 () Bool)

(assert (=> start!110748 m!1199741))

(declare-fun m!1199743 () Bool)

(assert (=> start!110748 m!1199743))

(declare-fun m!1199745 () Bool)

(assert (=> start!110748 m!1199745))

(declare-fun m!1199747 () Bool)

(assert (=> mapNonEmpty!54262 m!1199747))

(declare-fun m!1199749 () Bool)

(assert (=> b!1308747 m!1199749))

(check-sat b_and!47569 (not b!1308749) (not mapNonEmpty!54262) tp_is_empty!35089 (not b_next!29359) (not b!1308750) (not b!1308747) (not start!110748))
(check-sat b_and!47569 (not b_next!29359))
