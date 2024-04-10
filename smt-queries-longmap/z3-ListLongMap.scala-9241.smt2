; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110796 () Bool)

(assert start!110796)

(declare-fun b_free!29631 () Bool)

(declare-fun b_next!29631 () Bool)

(assert (=> start!110796 (= b_free!29631 (not b_next!29631))))

(declare-fun tp!104215 () Bool)

(declare-fun b_and!47839 () Bool)

(assert (=> start!110796 (= tp!104215 b_and!47839)))

(declare-fun b!1311359 () Bool)

(declare-fun res!870565 () Bool)

(declare-fun e!748093 () Bool)

(assert (=> b!1311359 (=> (not res!870565) (not e!748093))))

(declare-datatypes ((array!87710 0))(
  ( (array!87711 (arr!42335 (Array (_ BitVec 32) (_ BitVec 64))) (size!42885 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87710)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((V!52251 0))(
  ( (V!52252 (val!17755 Int)) )
))
(declare-datatypes ((ValueCell!16782 0))(
  ( (ValueCellFull!16782 (v!20382 V!52251)) (EmptyCell!16782) )
))
(declare-datatypes ((array!87712 0))(
  ( (array!87713 (arr!42336 (Array (_ BitVec 32) ValueCell!16782)) (size!42886 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87712)

(assert (=> b!1311359 (= res!870565 (and (= (size!42886 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42885 _keys!1628) (size!42886 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311360 () Bool)

(assert (=> b!1311360 (= e!748093 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52251)

(declare-fun zeroValue!1296 () V!52251)

(declare-fun lt!585465 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22880 0))(
  ( (tuple2!22881 (_1!11451 (_ BitVec 64)) (_2!11451 V!52251)) )
))
(declare-datatypes ((List!30021 0))(
  ( (Nil!30018) (Cons!30017 (h!31226 tuple2!22880) (t!43627 List!30021)) )
))
(declare-datatypes ((ListLongMap!20537 0))(
  ( (ListLongMap!20538 (toList!10284 List!30021)) )
))
(declare-fun contains!8434 (ListLongMap!20537 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5297 (array!87710 array!87712 (_ BitVec 32) (_ BitVec 32) V!52251 V!52251 (_ BitVec 32) Int) ListLongMap!20537)

(assert (=> b!1311360 (= lt!585465 (contains!8434 (getCurrentListMap!5297 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311361 () Bool)

(declare-fun e!748096 () Bool)

(declare-fun tp_is_empty!35361 () Bool)

(assert (=> b!1311361 (= e!748096 tp_is_empty!35361)))

(declare-fun b!1311362 () Bool)

(declare-fun e!748097 () Bool)

(declare-fun mapRes!54670 () Bool)

(assert (=> b!1311362 (= e!748097 (and e!748096 mapRes!54670))))

(declare-fun condMapEmpty!54670 () Bool)

(declare-fun mapDefault!54670 () ValueCell!16782)

(assert (=> b!1311362 (= condMapEmpty!54670 (= (arr!42336 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16782)) mapDefault!54670)))))

(declare-fun mapIsEmpty!54670 () Bool)

(assert (=> mapIsEmpty!54670 mapRes!54670))

(declare-fun b!1311363 () Bool)

(declare-fun res!870566 () Bool)

(assert (=> b!1311363 (=> (not res!870566) (not e!748093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87710 (_ BitVec 32)) Bool)

(assert (=> b!1311363 (= res!870566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!870563 () Bool)

(assert (=> start!110796 (=> (not res!870563) (not e!748093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110796 (= res!870563 (validMask!0 mask!2040))))

(assert (=> start!110796 e!748093))

(assert (=> start!110796 tp!104215))

(declare-fun array_inv!31991 (array!87710) Bool)

(assert (=> start!110796 (array_inv!31991 _keys!1628)))

(assert (=> start!110796 true))

(assert (=> start!110796 tp_is_empty!35361))

(declare-fun array_inv!31992 (array!87712) Bool)

(assert (=> start!110796 (and (array_inv!31992 _values!1354) e!748097)))

(declare-fun mapNonEmpty!54670 () Bool)

(declare-fun tp!104214 () Bool)

(declare-fun e!748094 () Bool)

(assert (=> mapNonEmpty!54670 (= mapRes!54670 (and tp!104214 e!748094))))

(declare-fun mapValue!54670 () ValueCell!16782)

(declare-fun mapRest!54670 () (Array (_ BitVec 32) ValueCell!16782))

(declare-fun mapKey!54670 () (_ BitVec 32))

(assert (=> mapNonEmpty!54670 (= (arr!42336 _values!1354) (store mapRest!54670 mapKey!54670 mapValue!54670))))

(declare-fun b!1311364 () Bool)

(declare-fun res!870567 () Bool)

(assert (=> b!1311364 (=> (not res!870567) (not e!748093))))

(assert (=> b!1311364 (= res!870567 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42885 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311365 () Bool)

(assert (=> b!1311365 (= e!748094 tp_is_empty!35361)))

(declare-fun b!1311366 () Bool)

(declare-fun res!870564 () Bool)

(assert (=> b!1311366 (=> (not res!870564) (not e!748093))))

(declare-datatypes ((List!30022 0))(
  ( (Nil!30019) (Cons!30018 (h!31227 (_ BitVec 64)) (t!43628 List!30022)) )
))
(declare-fun arrayNoDuplicates!0 (array!87710 (_ BitVec 32) List!30022) Bool)

(assert (=> b!1311366 (= res!870564 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30019))))

(assert (= (and start!110796 res!870563) b!1311359))

(assert (= (and b!1311359 res!870565) b!1311363))

(assert (= (and b!1311363 res!870566) b!1311366))

(assert (= (and b!1311366 res!870564) b!1311364))

(assert (= (and b!1311364 res!870567) b!1311360))

(assert (= (and b!1311362 condMapEmpty!54670) mapIsEmpty!54670))

(assert (= (and b!1311362 (not condMapEmpty!54670)) mapNonEmpty!54670))

(get-info :version)

(assert (= (and mapNonEmpty!54670 ((_ is ValueCellFull!16782) mapValue!54670)) b!1311365))

(assert (= (and b!1311362 ((_ is ValueCellFull!16782) mapDefault!54670)) b!1311361))

(assert (= start!110796 b!1311362))

(declare-fun m!1200853 () Bool)

(assert (=> mapNonEmpty!54670 m!1200853))

(declare-fun m!1200855 () Bool)

(assert (=> b!1311360 m!1200855))

(assert (=> b!1311360 m!1200855))

(declare-fun m!1200857 () Bool)

(assert (=> b!1311360 m!1200857))

(declare-fun m!1200859 () Bool)

(assert (=> start!110796 m!1200859))

(declare-fun m!1200861 () Bool)

(assert (=> start!110796 m!1200861))

(declare-fun m!1200863 () Bool)

(assert (=> start!110796 m!1200863))

(declare-fun m!1200865 () Bool)

(assert (=> b!1311363 m!1200865))

(declare-fun m!1200867 () Bool)

(assert (=> b!1311366 m!1200867))

(check-sat tp_is_empty!35361 b_and!47839 (not b!1311360) (not start!110796) (not b_next!29631) (not mapNonEmpty!54670) (not b!1311363) (not b!1311366))
(check-sat b_and!47839 (not b_next!29631))
