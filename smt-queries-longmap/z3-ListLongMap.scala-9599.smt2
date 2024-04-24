; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113680 () Bool)

(assert start!113680)

(declare-fun b_free!31507 () Bool)

(declare-fun b_next!31507 () Bool)

(assert (=> start!113680 (= b_free!31507 (not b_next!31507))))

(declare-fun tp!110325 () Bool)

(declare-fun b_and!50797 () Bool)

(assert (=> start!113680 (= tp!110325 b_and!50797)))

(declare-fun b!1348196 () Bool)

(declare-fun res!894259 () Bool)

(declare-fun e!767203 () Bool)

(assert (=> b!1348196 (=> (not res!894259) (not e!767203))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91955 0))(
  ( (array!91956 (arr!44429 (Array (_ BitVec 32) (_ BitVec 64))) (size!44980 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91955)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55113 0))(
  ( (V!55114 (val!18828 Int)) )
))
(declare-datatypes ((ValueCell!17855 0))(
  ( (ValueCellFull!17855 (v!21471 V!55113)) (EmptyCell!17855) )
))
(declare-datatypes ((array!91957 0))(
  ( (array!91958 (arr!44430 (Array (_ BitVec 32) ValueCell!17855)) (size!44981 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91957)

(assert (=> b!1348196 (= res!894259 (and (= (size!44981 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44980 _keys!1571) (size!44981 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1348197 () Bool)

(declare-fun res!894263 () Bool)

(assert (=> b!1348197 (=> (not res!894263) (not e!767203))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1348197 (= res!894263 (not (= (select (arr!44429 _keys!1571) from!1960) k0!1142)))))

(declare-fun res!894260 () Bool)

(assert (=> start!113680 (=> (not res!894260) (not e!767203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113680 (= res!894260 (validMask!0 mask!1977))))

(assert (=> start!113680 e!767203))

(declare-fun tp_is_empty!37507 () Bool)

(assert (=> start!113680 tp_is_empty!37507))

(assert (=> start!113680 true))

(declare-fun array_inv!33731 (array!91955) Bool)

(assert (=> start!113680 (array_inv!33731 _keys!1571)))

(declare-fun e!767206 () Bool)

(declare-fun array_inv!33732 (array!91957) Bool)

(assert (=> start!113680 (and (array_inv!33732 _values!1303) e!767206)))

(assert (=> start!113680 tp!110325))

(declare-fun b!1348198 () Bool)

(declare-fun res!894262 () Bool)

(assert (=> b!1348198 (=> (not res!894262) (not e!767203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348198 (= res!894262 (validKeyInArray!0 (select (arr!44429 _keys!1571) from!1960)))))

(declare-fun b!1348199 () Bool)

(declare-fun res!894257 () Bool)

(assert (=> b!1348199 (=> (not res!894257) (not e!767203))))

(declare-fun minValue!1245 () V!55113)

(declare-fun zeroValue!1245 () V!55113)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24316 0))(
  ( (tuple2!24317 (_1!12169 (_ BitVec 64)) (_2!12169 V!55113)) )
))
(declare-datatypes ((List!31458 0))(
  ( (Nil!31455) (Cons!31454 (h!32672 tuple2!24316) (t!46040 List!31458)) )
))
(declare-datatypes ((ListLongMap!21981 0))(
  ( (ListLongMap!21982 (toList!11006 List!31458)) )
))
(declare-fun contains!9194 (ListLongMap!21981 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5946 (array!91955 array!91957 (_ BitVec 32) (_ BitVec 32) V!55113 V!55113 (_ BitVec 32) Int) ListLongMap!21981)

(assert (=> b!1348199 (= res!894257 (contains!9194 (getCurrentListMap!5946 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1348200 () Bool)

(declare-fun res!894258 () Bool)

(assert (=> b!1348200 (=> (not res!894258) (not e!767203))))

(assert (=> b!1348200 (= res!894258 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44980 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57967 () Bool)

(declare-fun mapRes!57967 () Bool)

(assert (=> mapIsEmpty!57967 mapRes!57967))

(declare-fun b!1348201 () Bool)

(declare-fun e!767205 () Bool)

(assert (=> b!1348201 (= e!767205 tp_is_empty!37507)))

(declare-fun b!1348202 () Bool)

(declare-fun e!767207 () Bool)

(assert (=> b!1348202 (= e!767207 tp_is_empty!37507)))

(declare-fun b!1348203 () Bool)

(declare-fun res!894261 () Bool)

(assert (=> b!1348203 (=> (not res!894261) (not e!767203))))

(declare-datatypes ((List!31459 0))(
  ( (Nil!31456) (Cons!31455 (h!32673 (_ BitVec 64)) (t!46041 List!31459)) )
))
(declare-fun arrayNoDuplicates!0 (array!91955 (_ BitVec 32) List!31459) Bool)

(assert (=> b!1348203 (= res!894261 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31456))))

(declare-fun b!1348204 () Bool)

(declare-fun res!894256 () Bool)

(assert (=> b!1348204 (=> (not res!894256) (not e!767203))))

(assert (=> b!1348204 (= res!894256 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57967 () Bool)

(declare-fun tp!110326 () Bool)

(assert (=> mapNonEmpty!57967 (= mapRes!57967 (and tp!110326 e!767205))))

(declare-fun mapValue!57967 () ValueCell!17855)

(declare-fun mapKey!57967 () (_ BitVec 32))

(declare-fun mapRest!57967 () (Array (_ BitVec 32) ValueCell!17855))

(assert (=> mapNonEmpty!57967 (= (arr!44430 _values!1303) (store mapRest!57967 mapKey!57967 mapValue!57967))))

(declare-fun b!1348205 () Bool)

(assert (=> b!1348205 (= e!767203 (bvsge from!1960 (size!44981 _values!1303)))))

(declare-fun lt!596030 () ListLongMap!21981)

(declare-fun getCurrentListMapNoExtraKeys!6522 (array!91955 array!91957 (_ BitVec 32) (_ BitVec 32) V!55113 V!55113 (_ BitVec 32) Int) ListLongMap!21981)

(assert (=> b!1348205 (= lt!596030 (getCurrentListMapNoExtraKeys!6522 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1348206 () Bool)

(declare-fun res!894255 () Bool)

(assert (=> b!1348206 (=> (not res!894255) (not e!767203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91955 (_ BitVec 32)) Bool)

(assert (=> b!1348206 (= res!894255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1348207 () Bool)

(assert (=> b!1348207 (= e!767206 (and e!767207 mapRes!57967))))

(declare-fun condMapEmpty!57967 () Bool)

(declare-fun mapDefault!57967 () ValueCell!17855)

(assert (=> b!1348207 (= condMapEmpty!57967 (= (arr!44430 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17855)) mapDefault!57967)))))

(assert (= (and start!113680 res!894260) b!1348196))

(assert (= (and b!1348196 res!894259) b!1348206))

(assert (= (and b!1348206 res!894255) b!1348203))

(assert (= (and b!1348203 res!894261) b!1348200))

(assert (= (and b!1348200 res!894258) b!1348199))

(assert (= (and b!1348199 res!894257) b!1348197))

(assert (= (and b!1348197 res!894263) b!1348198))

(assert (= (and b!1348198 res!894262) b!1348204))

(assert (= (and b!1348204 res!894256) b!1348205))

(assert (= (and b!1348207 condMapEmpty!57967) mapIsEmpty!57967))

(assert (= (and b!1348207 (not condMapEmpty!57967)) mapNonEmpty!57967))

(get-info :version)

(assert (= (and mapNonEmpty!57967 ((_ is ValueCellFull!17855) mapValue!57967)) b!1348201))

(assert (= (and b!1348207 ((_ is ValueCellFull!17855) mapDefault!57967)) b!1348202))

(assert (= start!113680 b!1348207))

(declare-fun m!1235475 () Bool)

(assert (=> b!1348197 m!1235475))

(declare-fun m!1235477 () Bool)

(assert (=> b!1348205 m!1235477))

(declare-fun m!1235479 () Bool)

(assert (=> b!1348199 m!1235479))

(assert (=> b!1348199 m!1235479))

(declare-fun m!1235481 () Bool)

(assert (=> b!1348199 m!1235481))

(assert (=> b!1348198 m!1235475))

(assert (=> b!1348198 m!1235475))

(declare-fun m!1235483 () Bool)

(assert (=> b!1348198 m!1235483))

(declare-fun m!1235485 () Bool)

(assert (=> b!1348206 m!1235485))

(declare-fun m!1235487 () Bool)

(assert (=> b!1348203 m!1235487))

(declare-fun m!1235489 () Bool)

(assert (=> start!113680 m!1235489))

(declare-fun m!1235491 () Bool)

(assert (=> start!113680 m!1235491))

(declare-fun m!1235493 () Bool)

(assert (=> start!113680 m!1235493))

(declare-fun m!1235495 () Bool)

(assert (=> mapNonEmpty!57967 m!1235495))

(check-sat (not b_next!31507) (not b!1348199) b_and!50797 (not b!1348206) (not start!113680) (not b!1348205) (not mapNonEmpty!57967) tp_is_empty!37507 (not b!1348198) (not b!1348203))
(check-sat b_and!50797 (not b_next!31507))
