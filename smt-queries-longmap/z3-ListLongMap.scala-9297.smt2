; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111132 () Bool)

(assert start!111132)

(declare-fun b_free!29967 () Bool)

(declare-fun b_next!29967 () Bool)

(assert (=> start!111132 (= b_free!29967 (not b_next!29967))))

(declare-fun tp!105222 () Bool)

(declare-fun b_and!48175 () Bool)

(assert (=> start!111132 (= tp!105222 b_and!48175)))

(declare-fun mapIsEmpty!55174 () Bool)

(declare-fun mapRes!55174 () Bool)

(assert (=> mapIsEmpty!55174 mapRes!55174))

(declare-fun b!1315814 () Bool)

(declare-fun res!873510 () Bool)

(declare-fun e!750614 () Bool)

(assert (=> b!1315814 (=> (not res!873510) (not e!750614))))

(declare-datatypes ((array!88354 0))(
  ( (array!88355 (arr!42657 (Array (_ BitVec 32) (_ BitVec 64))) (size!43207 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88354)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52699 0))(
  ( (V!52700 (val!17923 Int)) )
))
(declare-datatypes ((ValueCell!16950 0))(
  ( (ValueCellFull!16950 (v!20550 V!52699)) (EmptyCell!16950) )
))
(declare-datatypes ((array!88356 0))(
  ( (array!88357 (arr!42658 (Array (_ BitVec 32) ValueCell!16950)) (size!43208 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88356)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315814 (= res!873510 (and (= (size!43208 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43207 _keys!1628) (size!43208 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315815 () Bool)

(declare-fun e!750615 () Bool)

(declare-fun tp_is_empty!35697 () Bool)

(assert (=> b!1315815 (= e!750615 tp_is_empty!35697)))

(declare-fun b!1315816 () Bool)

(assert (=> b!1315816 (= e!750614 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52699)

(declare-fun lt!585960 () Bool)

(declare-fun zeroValue!1296 () V!52699)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23124 0))(
  ( (tuple2!23125 (_1!11573 (_ BitVec 64)) (_2!11573 V!52699)) )
))
(declare-datatypes ((List!30261 0))(
  ( (Nil!30258) (Cons!30257 (h!31466 tuple2!23124) (t!43867 List!30261)) )
))
(declare-datatypes ((ListLongMap!20781 0))(
  ( (ListLongMap!20782 (toList!10406 List!30261)) )
))
(declare-fun contains!8556 (ListLongMap!20781 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5419 (array!88354 array!88356 (_ BitVec 32) (_ BitVec 32) V!52699 V!52699 (_ BitVec 32) Int) ListLongMap!20781)

(assert (=> b!1315816 (= lt!585960 (contains!8556 (getCurrentListMap!5419 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315817 () Bool)

(declare-fun e!750617 () Bool)

(assert (=> b!1315817 (= e!750617 (and e!750615 mapRes!55174))))

(declare-fun condMapEmpty!55174 () Bool)

(declare-fun mapDefault!55174 () ValueCell!16950)

(assert (=> b!1315817 (= condMapEmpty!55174 (= (arr!42658 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16950)) mapDefault!55174)))))

(declare-fun b!1315819 () Bool)

(declare-fun res!873509 () Bool)

(assert (=> b!1315819 (=> (not res!873509) (not e!750614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88354 (_ BitVec 32)) Bool)

(assert (=> b!1315819 (= res!873509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315820 () Bool)

(declare-fun res!873506 () Bool)

(assert (=> b!1315820 (=> (not res!873506) (not e!750614))))

(declare-datatypes ((List!30262 0))(
  ( (Nil!30259) (Cons!30258 (h!31467 (_ BitVec 64)) (t!43868 List!30262)) )
))
(declare-fun arrayNoDuplicates!0 (array!88354 (_ BitVec 32) List!30262) Bool)

(assert (=> b!1315820 (= res!873506 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30259))))

(declare-fun b!1315818 () Bool)

(declare-fun res!873507 () Bool)

(assert (=> b!1315818 (=> (not res!873507) (not e!750614))))

(assert (=> b!1315818 (= res!873507 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43207 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!873508 () Bool)

(assert (=> start!111132 (=> (not res!873508) (not e!750614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111132 (= res!873508 (validMask!0 mask!2040))))

(assert (=> start!111132 e!750614))

(assert (=> start!111132 tp!105222))

(declare-fun array_inv!32217 (array!88354) Bool)

(assert (=> start!111132 (array_inv!32217 _keys!1628)))

(assert (=> start!111132 true))

(assert (=> start!111132 tp_is_empty!35697))

(declare-fun array_inv!32218 (array!88356) Bool)

(assert (=> start!111132 (and (array_inv!32218 _values!1354) e!750617)))

(declare-fun b!1315821 () Bool)

(declare-fun e!750616 () Bool)

(assert (=> b!1315821 (= e!750616 tp_is_empty!35697)))

(declare-fun mapNonEmpty!55174 () Bool)

(declare-fun tp!105223 () Bool)

(assert (=> mapNonEmpty!55174 (= mapRes!55174 (and tp!105223 e!750616))))

(declare-fun mapRest!55174 () (Array (_ BitVec 32) ValueCell!16950))

(declare-fun mapKey!55174 () (_ BitVec 32))

(declare-fun mapValue!55174 () ValueCell!16950)

(assert (=> mapNonEmpty!55174 (= (arr!42658 _values!1354) (store mapRest!55174 mapKey!55174 mapValue!55174))))

(assert (= (and start!111132 res!873508) b!1315814))

(assert (= (and b!1315814 res!873510) b!1315819))

(assert (= (and b!1315819 res!873509) b!1315820))

(assert (= (and b!1315820 res!873506) b!1315818))

(assert (= (and b!1315818 res!873507) b!1315816))

(assert (= (and b!1315817 condMapEmpty!55174) mapIsEmpty!55174))

(assert (= (and b!1315817 (not condMapEmpty!55174)) mapNonEmpty!55174))

(get-info :version)

(assert (= (and mapNonEmpty!55174 ((_ is ValueCellFull!16950) mapValue!55174)) b!1315821))

(assert (= (and b!1315817 ((_ is ValueCellFull!16950) mapDefault!55174)) b!1315815))

(assert (= start!111132 b!1315817))

(declare-fun m!1203883 () Bool)

(assert (=> b!1315816 m!1203883))

(assert (=> b!1315816 m!1203883))

(declare-fun m!1203885 () Bool)

(assert (=> b!1315816 m!1203885))

(declare-fun m!1203887 () Bool)

(assert (=> b!1315820 m!1203887))

(declare-fun m!1203889 () Bool)

(assert (=> start!111132 m!1203889))

(declare-fun m!1203891 () Bool)

(assert (=> start!111132 m!1203891))

(declare-fun m!1203893 () Bool)

(assert (=> start!111132 m!1203893))

(declare-fun m!1203895 () Bool)

(assert (=> b!1315819 m!1203895))

(declare-fun m!1203897 () Bool)

(assert (=> mapNonEmpty!55174 m!1203897))

(check-sat b_and!48175 (not start!111132) (not mapNonEmpty!55174) (not b!1315820) (not b_next!29967) (not b!1315819) (not b!1315816) tp_is_empty!35697)
(check-sat b_and!48175 (not b_next!29967))
