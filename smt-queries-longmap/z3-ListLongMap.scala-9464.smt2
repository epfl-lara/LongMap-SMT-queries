; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112394 () Bool)

(assert start!112394)

(declare-fun b_free!30789 () Bool)

(declare-fun b_next!30789 () Bool)

(assert (=> start!112394 (= b_free!30789 (not b_next!30789))))

(declare-fun tp!108003 () Bool)

(declare-fun b_and!49631 () Bool)

(assert (=> start!112394 (= tp!108003 b_and!49631)))

(declare-fun b!1332531 () Bool)

(declare-fun res!884292 () Bool)

(declare-fun e!759118 () Bool)

(assert (=> b!1332531 (=> (not res!884292) (not e!759118))))

(declare-datatypes ((array!90278 0))(
  ( (array!90279 (arr!43605 (Array (_ BitVec 32) (_ BitVec 64))) (size!44155 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90278)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90278 (_ BitVec 32)) Bool)

(assert (=> b!1332531 (= res!884292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332532 () Bool)

(declare-fun e!759121 () Bool)

(declare-fun e!759120 () Bool)

(declare-fun mapRes!56722 () Bool)

(assert (=> b!1332532 (= e!759121 (and e!759120 mapRes!56722))))

(declare-fun condMapEmpty!56722 () Bool)

(declare-datatypes ((V!54035 0))(
  ( (V!54036 (val!18424 Int)) )
))
(declare-datatypes ((ValueCell!17451 0))(
  ( (ValueCellFull!17451 (v!21061 V!54035)) (EmptyCell!17451) )
))
(declare-datatypes ((array!90280 0))(
  ( (array!90281 (arr!43606 (Array (_ BitVec 32) ValueCell!17451)) (size!44156 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90280)

(declare-fun mapDefault!56722 () ValueCell!17451)

(assert (=> b!1332532 (= condMapEmpty!56722 (= (arr!43606 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17451)) mapDefault!56722)))))

(declare-fun b!1332533 () Bool)

(assert (=> b!1332533 (= e!759118 false)))

(declare-fun lt!592036 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54035)

(declare-fun zeroValue!1262 () V!54035)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23744 0))(
  ( (tuple2!23745 (_1!11883 (_ BitVec 64)) (_2!11883 V!54035)) )
))
(declare-datatypes ((List!30888 0))(
  ( (Nil!30885) (Cons!30884 (h!32093 tuple2!23744) (t!45086 List!30888)) )
))
(declare-datatypes ((ListLongMap!21401 0))(
  ( (ListLongMap!21402 (toList!10716 List!30888)) )
))
(declare-fun contains!8880 (ListLongMap!21401 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5697 (array!90278 array!90280 (_ BitVec 32) (_ BitVec 32) V!54035 V!54035 (_ BitVec 32) Int) ListLongMap!21401)

(assert (=> b!1332533 (= lt!592036 (contains!8880 (getCurrentListMap!5697 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332534 () Bool)

(declare-fun res!884291 () Bool)

(assert (=> b!1332534 (=> (not res!884291) (not e!759118))))

(declare-datatypes ((List!30889 0))(
  ( (Nil!30886) (Cons!30885 (h!32094 (_ BitVec 64)) (t!45087 List!30889)) )
))
(declare-fun arrayNoDuplicates!0 (array!90278 (_ BitVec 32) List!30889) Bool)

(assert (=> b!1332534 (= res!884291 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30886))))

(declare-fun res!884290 () Bool)

(assert (=> start!112394 (=> (not res!884290) (not e!759118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112394 (= res!884290 (validMask!0 mask!1998))))

(assert (=> start!112394 e!759118))

(declare-fun array_inv!32891 (array!90280) Bool)

(assert (=> start!112394 (and (array_inv!32891 _values!1320) e!759121)))

(assert (=> start!112394 true))

(declare-fun array_inv!32892 (array!90278) Bool)

(assert (=> start!112394 (array_inv!32892 _keys!1590)))

(assert (=> start!112394 tp!108003))

(declare-fun tp_is_empty!36699 () Bool)

(assert (=> start!112394 tp_is_empty!36699))

(declare-fun b!1332535 () Bool)

(declare-fun res!884288 () Bool)

(assert (=> b!1332535 (=> (not res!884288) (not e!759118))))

(assert (=> b!1332535 (= res!884288 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44155 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332536 () Bool)

(assert (=> b!1332536 (= e!759120 tp_is_empty!36699)))

(declare-fun b!1332537 () Bool)

(declare-fun e!759117 () Bool)

(assert (=> b!1332537 (= e!759117 tp_is_empty!36699)))

(declare-fun mapNonEmpty!56722 () Bool)

(declare-fun tp!108004 () Bool)

(assert (=> mapNonEmpty!56722 (= mapRes!56722 (and tp!108004 e!759117))))

(declare-fun mapRest!56722 () (Array (_ BitVec 32) ValueCell!17451))

(declare-fun mapKey!56722 () (_ BitVec 32))

(declare-fun mapValue!56722 () ValueCell!17451)

(assert (=> mapNonEmpty!56722 (= (arr!43606 _values!1320) (store mapRest!56722 mapKey!56722 mapValue!56722))))

(declare-fun mapIsEmpty!56722 () Bool)

(assert (=> mapIsEmpty!56722 mapRes!56722))

(declare-fun b!1332538 () Bool)

(declare-fun res!884289 () Bool)

(assert (=> b!1332538 (=> (not res!884289) (not e!759118))))

(assert (=> b!1332538 (= res!884289 (and (= (size!44156 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44155 _keys!1590) (size!44156 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112394 res!884290) b!1332538))

(assert (= (and b!1332538 res!884289) b!1332531))

(assert (= (and b!1332531 res!884292) b!1332534))

(assert (= (and b!1332534 res!884291) b!1332535))

(assert (= (and b!1332535 res!884288) b!1332533))

(assert (= (and b!1332532 condMapEmpty!56722) mapIsEmpty!56722))

(assert (= (and b!1332532 (not condMapEmpty!56722)) mapNonEmpty!56722))

(get-info :version)

(assert (= (and mapNonEmpty!56722 ((_ is ValueCellFull!17451) mapValue!56722)) b!1332537))

(assert (= (and b!1332532 ((_ is ValueCellFull!17451) mapDefault!56722)) b!1332536))

(assert (= start!112394 b!1332532))

(declare-fun m!1221355 () Bool)

(assert (=> mapNonEmpty!56722 m!1221355))

(declare-fun m!1221357 () Bool)

(assert (=> b!1332534 m!1221357))

(declare-fun m!1221359 () Bool)

(assert (=> b!1332531 m!1221359))

(declare-fun m!1221361 () Bool)

(assert (=> start!112394 m!1221361))

(declare-fun m!1221363 () Bool)

(assert (=> start!112394 m!1221363))

(declare-fun m!1221365 () Bool)

(assert (=> start!112394 m!1221365))

(declare-fun m!1221367 () Bool)

(assert (=> b!1332533 m!1221367))

(assert (=> b!1332533 m!1221367))

(declare-fun m!1221369 () Bool)

(assert (=> b!1332533 m!1221369))

(check-sat (not start!112394) tp_is_empty!36699 (not b!1332534) (not b!1332531) (not b_next!30789) b_and!49631 (not mapNonEmpty!56722) (not b!1332533))
(check-sat b_and!49631 (not b_next!30789))
