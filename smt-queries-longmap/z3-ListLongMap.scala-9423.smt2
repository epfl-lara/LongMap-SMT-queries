; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112148 () Bool)

(assert start!112148)

(declare-fun b_free!30543 () Bool)

(declare-fun b_next!30543 () Bool)

(assert (=> start!112148 (= b_free!30543 (not b_next!30543))))

(declare-fun tp!107265 () Bool)

(declare-fun b_and!49193 () Bool)

(assert (=> start!112148 (= tp!107265 b_and!49193)))

(declare-fun b!1328208 () Bool)

(declare-fun e!757276 () Bool)

(declare-fun tp_is_empty!36453 () Bool)

(assert (=> b!1328208 (= e!757276 tp_is_empty!36453)))

(declare-fun res!881264 () Bool)

(declare-fun e!757275 () Bool)

(assert (=> start!112148 (=> (not res!881264) (not e!757275))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112148 (= res!881264 (validMask!0 mask!1998))))

(assert (=> start!112148 e!757275))

(declare-datatypes ((V!53707 0))(
  ( (V!53708 (val!18301 Int)) )
))
(declare-datatypes ((ValueCell!17328 0))(
  ( (ValueCellFull!17328 (v!20938 V!53707)) (EmptyCell!17328) )
))
(declare-datatypes ((array!89804 0))(
  ( (array!89805 (arr!43368 (Array (_ BitVec 32) ValueCell!17328)) (size!43918 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89804)

(declare-fun e!757274 () Bool)

(declare-fun array_inv!32725 (array!89804) Bool)

(assert (=> start!112148 (and (array_inv!32725 _values!1320) e!757274)))

(assert (=> start!112148 true))

(declare-datatypes ((array!89806 0))(
  ( (array!89807 (arr!43369 (Array (_ BitVec 32) (_ BitVec 64))) (size!43919 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89806)

(declare-fun array_inv!32726 (array!89806) Bool)

(assert (=> start!112148 (array_inv!32726 _keys!1590)))

(assert (=> start!112148 tp!107265))

(assert (=> start!112148 tp_is_empty!36453))

(declare-fun b!1328209 () Bool)

(declare-fun res!881268 () Bool)

(assert (=> b!1328209 (=> (not res!881268) (not e!757275))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1328209 (= res!881268 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43919 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328210 () Bool)

(declare-fun e!757273 () Bool)

(assert (=> b!1328210 (= e!757273 tp_is_empty!36453)))

(declare-fun b!1328211 () Bool)

(declare-fun mapRes!56353 () Bool)

(assert (=> b!1328211 (= e!757274 (and e!757273 mapRes!56353))))

(declare-fun condMapEmpty!56353 () Bool)

(declare-fun mapDefault!56353 () ValueCell!17328)

(assert (=> b!1328211 (= condMapEmpty!56353 (= (arr!43368 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17328)) mapDefault!56353)))))

(declare-fun b!1328212 () Bool)

(declare-fun res!881265 () Bool)

(assert (=> b!1328212 (=> (not res!881265) (not e!757275))))

(declare-datatypes ((List!30712 0))(
  ( (Nil!30709) (Cons!30708 (h!31917 (_ BitVec 64)) (t!44718 List!30712)) )
))
(declare-fun arrayNoDuplicates!0 (array!89806 (_ BitVec 32) List!30712) Bool)

(assert (=> b!1328212 (= res!881265 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30709))))

(declare-fun mapIsEmpty!56353 () Bool)

(assert (=> mapIsEmpty!56353 mapRes!56353))

(declare-fun b!1328213 () Bool)

(declare-fun res!881267 () Bool)

(assert (=> b!1328213 (=> (not res!881267) (not e!757275))))

(assert (=> b!1328213 (= res!881267 (and (= (size!43918 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43919 _keys!1590) (size!43918 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56353 () Bool)

(declare-fun tp!107266 () Bool)

(assert (=> mapNonEmpty!56353 (= mapRes!56353 (and tp!107266 e!757276))))

(declare-fun mapValue!56353 () ValueCell!17328)

(declare-fun mapRest!56353 () (Array (_ BitVec 32) ValueCell!17328))

(declare-fun mapKey!56353 () (_ BitVec 32))

(assert (=> mapNonEmpty!56353 (= (arr!43368 _values!1320) (store mapRest!56353 mapKey!56353 mapValue!56353))))

(declare-fun b!1328214 () Bool)

(declare-fun res!881266 () Bool)

(assert (=> b!1328214 (=> (not res!881266) (not e!757275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89806 (_ BitVec 32)) Bool)

(assert (=> b!1328214 (= res!881266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328215 () Bool)

(assert (=> b!1328215 (= e!757275 false)))

(declare-fun lt!590812 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53707)

(declare-fun zeroValue!1262 () V!53707)

(declare-datatypes ((tuple2!23556 0))(
  ( (tuple2!23557 (_1!11789 (_ BitVec 64)) (_2!11789 V!53707)) )
))
(declare-datatypes ((List!30713 0))(
  ( (Nil!30710) (Cons!30709 (h!31918 tuple2!23556) (t!44719 List!30713)) )
))
(declare-datatypes ((ListLongMap!21213 0))(
  ( (ListLongMap!21214 (toList!10622 List!30713)) )
))
(declare-fun contains!8786 (ListLongMap!21213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5613 (array!89806 array!89804 (_ BitVec 32) (_ BitVec 32) V!53707 V!53707 (_ BitVec 32) Int) ListLongMap!21213)

(assert (=> b!1328215 (= lt!590812 (contains!8786 (getCurrentListMap!5613 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112148 res!881264) b!1328213))

(assert (= (and b!1328213 res!881267) b!1328214))

(assert (= (and b!1328214 res!881266) b!1328212))

(assert (= (and b!1328212 res!881265) b!1328209))

(assert (= (and b!1328209 res!881268) b!1328215))

(assert (= (and b!1328211 condMapEmpty!56353) mapIsEmpty!56353))

(assert (= (and b!1328211 (not condMapEmpty!56353)) mapNonEmpty!56353))

(get-info :version)

(assert (= (and mapNonEmpty!56353 ((_ is ValueCellFull!17328) mapValue!56353)) b!1328208))

(assert (= (and b!1328211 ((_ is ValueCellFull!17328) mapDefault!56353)) b!1328210))

(assert (= start!112148 b!1328211))

(declare-fun m!1217257 () Bool)

(assert (=> b!1328215 m!1217257))

(assert (=> b!1328215 m!1217257))

(declare-fun m!1217259 () Bool)

(assert (=> b!1328215 m!1217259))

(declare-fun m!1217261 () Bool)

(assert (=> b!1328212 m!1217261))

(declare-fun m!1217263 () Bool)

(assert (=> start!112148 m!1217263))

(declare-fun m!1217265 () Bool)

(assert (=> start!112148 m!1217265))

(declare-fun m!1217267 () Bool)

(assert (=> start!112148 m!1217267))

(declare-fun m!1217269 () Bool)

(assert (=> mapNonEmpty!56353 m!1217269))

(declare-fun m!1217271 () Bool)

(assert (=> b!1328214 m!1217271))

(check-sat (not b_next!30543) (not start!112148) tp_is_empty!36453 (not b!1328215) (not mapNonEmpty!56353) (not b!1328214) (not b!1328212) b_and!49193)
(check-sat b_and!49193 (not b_next!30543))
