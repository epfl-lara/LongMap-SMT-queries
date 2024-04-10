; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111358 () Bool)

(assert start!111358)

(declare-fun b_free!30015 () Bool)

(declare-fun b_next!30015 () Bool)

(assert (=> start!111358 (= b_free!30015 (not b_next!30015))))

(declare-fun tp!105521 () Bool)

(declare-fun b_and!48235 () Bool)

(assert (=> start!111358 (= tp!105521 b_and!48235)))

(declare-fun mapIsEmpty!55400 () Bool)

(declare-fun mapRes!55400 () Bool)

(assert (=> mapIsEmpty!55400 mapRes!55400))

(declare-fun b!1317700 () Bool)

(declare-fun e!751953 () Bool)

(declare-fun tp_is_empty!35835 () Bool)

(assert (=> b!1317700 (= e!751953 tp_is_empty!35835)))

(declare-fun b!1317701 () Bool)

(declare-fun res!874531 () Bool)

(declare-fun e!751954 () Bool)

(assert (=> b!1317701 (=> (not res!874531) (not e!751954))))

(declare-datatypes ((array!88622 0))(
  ( (array!88623 (arr!42785 (Array (_ BitVec 32) (_ BitVec 64))) (size!43335 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88622)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1317701 (= res!874531 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43335 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1317702 () Bool)

(declare-fun e!751951 () Bool)

(assert (=> b!1317702 (= e!751951 tp_is_empty!35835)))

(declare-fun b!1317703 () Bool)

(assert (=> b!1317703 (= e!751954 false)))

(declare-datatypes ((V!52883 0))(
  ( (V!52884 (val!17992 Int)) )
))
(declare-fun zeroValue!1279 () V!52883)

(declare-datatypes ((ValueCell!17019 0))(
  ( (ValueCellFull!17019 (v!20622 V!52883)) (EmptyCell!17019) )
))
(declare-datatypes ((array!88624 0))(
  ( (array!88625 (arr!42786 (Array (_ BitVec 32) ValueCell!17019)) (size!43336 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88624)

(declare-fun minValue!1279 () V!52883)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun lt!586398 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23156 0))(
  ( (tuple2!23157 (_1!11589 (_ BitVec 64)) (_2!11589 V!52883)) )
))
(declare-datatypes ((List!30314 0))(
  ( (Nil!30311) (Cons!30310 (h!31519 tuple2!23156) (t!43922 List!30314)) )
))
(declare-datatypes ((ListLongMap!20813 0))(
  ( (ListLongMap!20814 (toList!10422 List!30314)) )
))
(declare-fun contains!8577 (ListLongMap!20813 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5435 (array!88622 array!88624 (_ BitVec 32) (_ BitVec 32) V!52883 V!52883 (_ BitVec 32) Int) ListLongMap!20813)

(assert (=> b!1317703 (= lt!586398 (contains!8577 (getCurrentListMap!5435 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1317704 () Bool)

(declare-fun res!874532 () Bool)

(assert (=> b!1317704 (=> (not res!874532) (not e!751954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88622 (_ BitVec 32)) Bool)

(assert (=> b!1317704 (= res!874532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317705 () Bool)

(declare-fun e!751950 () Bool)

(assert (=> b!1317705 (= e!751950 (and e!751953 mapRes!55400))))

(declare-fun condMapEmpty!55400 () Bool)

(declare-fun mapDefault!55400 () ValueCell!17019)

(assert (=> b!1317705 (= condMapEmpty!55400 (= (arr!42786 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17019)) mapDefault!55400)))))

(declare-fun mapNonEmpty!55400 () Bool)

(declare-fun tp!105520 () Bool)

(assert (=> mapNonEmpty!55400 (= mapRes!55400 (and tp!105520 e!751951))))

(declare-fun mapKey!55400 () (_ BitVec 32))

(declare-fun mapValue!55400 () ValueCell!17019)

(declare-fun mapRest!55400 () (Array (_ BitVec 32) ValueCell!17019))

(assert (=> mapNonEmpty!55400 (= (arr!42786 _values!1337) (store mapRest!55400 mapKey!55400 mapValue!55400))))

(declare-fun b!1317707 () Bool)

(declare-fun res!874535 () Bool)

(assert (=> b!1317707 (=> (not res!874535) (not e!751954))))

(declare-datatypes ((List!30315 0))(
  ( (Nil!30312) (Cons!30311 (h!31520 (_ BitVec 64)) (t!43923 List!30315)) )
))
(declare-fun arrayNoDuplicates!0 (array!88622 (_ BitVec 32) List!30315) Bool)

(assert (=> b!1317707 (= res!874535 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30312))))

(declare-fun b!1317706 () Bool)

(declare-fun res!874534 () Bool)

(assert (=> b!1317706 (=> (not res!874534) (not e!751954))))

(assert (=> b!1317706 (= res!874534 (and (= (size!43336 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43335 _keys!1609) (size!43336 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!874533 () Bool)

(assert (=> start!111358 (=> (not res!874533) (not e!751954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111358 (= res!874533 (validMask!0 mask!2019))))

(assert (=> start!111358 e!751954))

(declare-fun array_inv!32315 (array!88622) Bool)

(assert (=> start!111358 (array_inv!32315 _keys!1609)))

(assert (=> start!111358 true))

(assert (=> start!111358 tp_is_empty!35835))

(declare-fun array_inv!32316 (array!88624) Bool)

(assert (=> start!111358 (and (array_inv!32316 _values!1337) e!751950)))

(assert (=> start!111358 tp!105521))

(assert (= (and start!111358 res!874533) b!1317706))

(assert (= (and b!1317706 res!874534) b!1317704))

(assert (= (and b!1317704 res!874532) b!1317707))

(assert (= (and b!1317707 res!874535) b!1317701))

(assert (= (and b!1317701 res!874531) b!1317703))

(assert (= (and b!1317705 condMapEmpty!55400) mapIsEmpty!55400))

(assert (= (and b!1317705 (not condMapEmpty!55400)) mapNonEmpty!55400))

(get-info :version)

(assert (= (and mapNonEmpty!55400 ((_ is ValueCellFull!17019) mapValue!55400)) b!1317702))

(assert (= (and b!1317705 ((_ is ValueCellFull!17019) mapDefault!55400)) b!1317700))

(assert (= start!111358 b!1317705))

(declare-fun m!1205467 () Bool)

(assert (=> start!111358 m!1205467))

(declare-fun m!1205469 () Bool)

(assert (=> start!111358 m!1205469))

(declare-fun m!1205471 () Bool)

(assert (=> start!111358 m!1205471))

(declare-fun m!1205473 () Bool)

(assert (=> mapNonEmpty!55400 m!1205473))

(declare-fun m!1205475 () Bool)

(assert (=> b!1317703 m!1205475))

(assert (=> b!1317703 m!1205475))

(declare-fun m!1205477 () Bool)

(assert (=> b!1317703 m!1205477))

(declare-fun m!1205479 () Bool)

(assert (=> b!1317704 m!1205479))

(declare-fun m!1205481 () Bool)

(assert (=> b!1317707 m!1205481))

(check-sat (not b!1317703) (not b!1317704) (not start!111358) (not mapNonEmpty!55400) b_and!48235 tp_is_empty!35835 (not b!1317707) (not b_next!30015))
(check-sat b_and!48235 (not b_next!30015))
