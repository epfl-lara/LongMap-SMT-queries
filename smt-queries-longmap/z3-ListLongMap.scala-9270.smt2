; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110968 () Bool)

(assert start!110968)

(declare-fun b_free!29803 () Bool)

(declare-fun b_next!29803 () Bool)

(assert (=> start!110968 (= b_free!29803 (not b_next!29803))))

(declare-fun tp!104732 () Bool)

(declare-fun b_and!47993 () Bool)

(assert (=> start!110968 (= tp!104732 b_and!47993)))

(declare-fun b!1313704 () Bool)

(declare-fun res!872177 () Bool)

(declare-fun e!749353 () Bool)

(assert (=> b!1313704 (=> (not res!872177) (not e!749353))))

(declare-datatypes ((array!87947 0))(
  ( (array!87948 (arr!42454 (Array (_ BitVec 32) (_ BitVec 64))) (size!43006 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87947)

(declare-datatypes ((List!30210 0))(
  ( (Nil!30207) (Cons!30206 (h!31415 (_ BitVec 64)) (t!43808 List!30210)) )
))
(declare-fun arrayNoDuplicates!0 (array!87947 (_ BitVec 32) List!30210) Bool)

(assert (=> b!1313704 (= res!872177 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30207))))

(declare-fun b!1313705 () Bool)

(declare-fun res!872179 () Bool)

(assert (=> b!1313705 (=> (not res!872179) (not e!749353))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87947 (_ BitVec 32)) Bool)

(assert (=> b!1313705 (= res!872179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313706 () Bool)

(declare-fun res!872175 () Bool)

(assert (=> b!1313706 (=> (not res!872175) (not e!749353))))

(declare-datatypes ((V!52481 0))(
  ( (V!52482 (val!17841 Int)) )
))
(declare-datatypes ((ValueCell!16868 0))(
  ( (ValueCellFull!16868 (v!20467 V!52481)) (EmptyCell!16868) )
))
(declare-datatypes ((array!87949 0))(
  ( (array!87950 (arr!42455 (Array (_ BitVec 32) ValueCell!16868)) (size!43007 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87949)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313706 (= res!872175 (and (= (size!43007 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43006 _keys!1628) (size!43007 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313707 () Bool)

(declare-fun e!749351 () Bool)

(declare-fun tp_is_empty!35533 () Bool)

(assert (=> b!1313707 (= e!749351 tp_is_empty!35533)))

(declare-fun mapIsEmpty!54928 () Bool)

(declare-fun mapRes!54928 () Bool)

(assert (=> mapIsEmpty!54928 mapRes!54928))

(declare-fun mapNonEmpty!54928 () Bool)

(declare-fun tp!104731 () Bool)

(declare-fun e!749350 () Bool)

(assert (=> mapNonEmpty!54928 (= mapRes!54928 (and tp!104731 e!749350))))

(declare-fun mapValue!54928 () ValueCell!16868)

(declare-fun mapKey!54928 () (_ BitVec 32))

(declare-fun mapRest!54928 () (Array (_ BitVec 32) ValueCell!16868))

(assert (=> mapNonEmpty!54928 (= (arr!42455 _values!1354) (store mapRest!54928 mapKey!54928 mapValue!54928))))

(declare-fun b!1313708 () Bool)

(declare-fun res!872176 () Bool)

(assert (=> b!1313708 (=> (not res!872176) (not e!749353))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313708 (= res!872176 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43006 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313709 () Bool)

(assert (=> b!1313709 (= e!749350 tp_is_empty!35533)))

(declare-fun res!872178 () Bool)

(assert (=> start!110968 (=> (not res!872178) (not e!749353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110968 (= res!872178 (validMask!0 mask!2040))))

(assert (=> start!110968 e!749353))

(assert (=> start!110968 tp!104732))

(declare-fun array_inv!32259 (array!87947) Bool)

(assert (=> start!110968 (array_inv!32259 _keys!1628)))

(assert (=> start!110968 true))

(assert (=> start!110968 tp_is_empty!35533))

(declare-fun e!749354 () Bool)

(declare-fun array_inv!32260 (array!87949) Bool)

(assert (=> start!110968 (and (array_inv!32260 _values!1354) e!749354)))

(declare-fun b!1313710 () Bool)

(assert (=> b!1313710 (= e!749353 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585528 () Bool)

(declare-fun minValue!1296 () V!52481)

(declare-fun zeroValue!1296 () V!52481)

(declare-datatypes ((tuple2!23092 0))(
  ( (tuple2!23093 (_1!11557 (_ BitVec 64)) (_2!11557 V!52481)) )
))
(declare-datatypes ((List!30211 0))(
  ( (Nil!30208) (Cons!30207 (h!31416 tuple2!23092) (t!43809 List!30211)) )
))
(declare-datatypes ((ListLongMap!20749 0))(
  ( (ListLongMap!20750 (toList!10390 List!30211)) )
))
(declare-fun contains!8467 (ListLongMap!20749 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5285 (array!87947 array!87949 (_ BitVec 32) (_ BitVec 32) V!52481 V!52481 (_ BitVec 32) Int) ListLongMap!20749)

(assert (=> b!1313710 (= lt!585528 (contains!8467 (getCurrentListMap!5285 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313711 () Bool)

(assert (=> b!1313711 (= e!749354 (and e!749351 mapRes!54928))))

(declare-fun condMapEmpty!54928 () Bool)

(declare-fun mapDefault!54928 () ValueCell!16868)

(assert (=> b!1313711 (= condMapEmpty!54928 (= (arr!42455 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16868)) mapDefault!54928)))))

(assert (= (and start!110968 res!872178) b!1313706))

(assert (= (and b!1313706 res!872175) b!1313705))

(assert (= (and b!1313705 res!872179) b!1313704))

(assert (= (and b!1313704 res!872177) b!1313708))

(assert (= (and b!1313708 res!872176) b!1313710))

(assert (= (and b!1313711 condMapEmpty!54928) mapIsEmpty!54928))

(assert (= (and b!1313711 (not condMapEmpty!54928)) mapNonEmpty!54928))

(get-info :version)

(assert (= (and mapNonEmpty!54928 ((_ is ValueCellFull!16868) mapValue!54928)) b!1313709))

(assert (= (and b!1313711 ((_ is ValueCellFull!16868) mapDefault!54928)) b!1313707))

(assert (= start!110968 b!1313711))

(declare-fun m!1201995 () Bool)

(assert (=> mapNonEmpty!54928 m!1201995))

(declare-fun m!1201997 () Bool)

(assert (=> start!110968 m!1201997))

(declare-fun m!1201999 () Bool)

(assert (=> start!110968 m!1201999))

(declare-fun m!1202001 () Bool)

(assert (=> start!110968 m!1202001))

(declare-fun m!1202003 () Bool)

(assert (=> b!1313705 m!1202003))

(declare-fun m!1202005 () Bool)

(assert (=> b!1313704 m!1202005))

(declare-fun m!1202007 () Bool)

(assert (=> b!1313710 m!1202007))

(assert (=> b!1313710 m!1202007))

(declare-fun m!1202009 () Bool)

(assert (=> b!1313710 m!1202009))

(check-sat tp_is_empty!35533 (not b!1313705) (not b!1313704) (not b!1313710) (not b_next!29803) b_and!47993 (not mapNonEmpty!54928) (not start!110968))
(check-sat b_and!47993 (not b_next!29803))
