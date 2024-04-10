; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112396 () Bool)

(assert start!112396)

(declare-fun b_free!30791 () Bool)

(declare-fun b_next!30791 () Bool)

(assert (=> start!112396 (= b_free!30791 (not b_next!30791))))

(declare-fun tp!108010 () Bool)

(declare-fun b_and!49633 () Bool)

(assert (=> start!112396 (= tp!108010 b_and!49633)))

(declare-fun b!1332555 () Bool)

(declare-fun res!884304 () Bool)

(declare-fun e!759136 () Bool)

(assert (=> b!1332555 (=> (not res!884304) (not e!759136))))

(declare-datatypes ((V!54037 0))(
  ( (V!54038 (val!18425 Int)) )
))
(declare-datatypes ((ValueCell!17452 0))(
  ( (ValueCellFull!17452 (v!21062 V!54037)) (EmptyCell!17452) )
))
(declare-datatypes ((array!90282 0))(
  ( (array!90283 (arr!43607 (Array (_ BitVec 32) ValueCell!17452)) (size!44157 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90282)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90284 0))(
  ( (array!90285 (arr!43608 (Array (_ BitVec 32) (_ BitVec 64))) (size!44158 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90284)

(assert (=> b!1332555 (= res!884304 (and (= (size!44157 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44158 _keys!1590) (size!44157 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!884307 () Bool)

(assert (=> start!112396 (=> (not res!884307) (not e!759136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112396 (= res!884307 (validMask!0 mask!1998))))

(assert (=> start!112396 e!759136))

(declare-fun e!759134 () Bool)

(declare-fun array_inv!32893 (array!90282) Bool)

(assert (=> start!112396 (and (array_inv!32893 _values!1320) e!759134)))

(assert (=> start!112396 true))

(declare-fun array_inv!32894 (array!90284) Bool)

(assert (=> start!112396 (array_inv!32894 _keys!1590)))

(assert (=> start!112396 tp!108010))

(declare-fun tp_is_empty!36701 () Bool)

(assert (=> start!112396 tp_is_empty!36701))

(declare-fun b!1332556 () Bool)

(declare-fun res!884306 () Bool)

(assert (=> b!1332556 (=> (not res!884306) (not e!759136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90284 (_ BitVec 32)) Bool)

(assert (=> b!1332556 (= res!884306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332557 () Bool)

(declare-fun res!884305 () Bool)

(assert (=> b!1332557 (=> (not res!884305) (not e!759136))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1332557 (= res!884305 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44158 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332558 () Bool)

(assert (=> b!1332558 (= e!759136 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54037)

(declare-fun zeroValue!1262 () V!54037)

(declare-fun lt!592039 () Bool)

(declare-datatypes ((tuple2!23746 0))(
  ( (tuple2!23747 (_1!11884 (_ BitVec 64)) (_2!11884 V!54037)) )
))
(declare-datatypes ((List!30890 0))(
  ( (Nil!30887) (Cons!30886 (h!32095 tuple2!23746) (t!45088 List!30890)) )
))
(declare-datatypes ((ListLongMap!21403 0))(
  ( (ListLongMap!21404 (toList!10717 List!30890)) )
))
(declare-fun contains!8881 (ListLongMap!21403 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5698 (array!90284 array!90282 (_ BitVec 32) (_ BitVec 32) V!54037 V!54037 (_ BitVec 32) Int) ListLongMap!21403)

(assert (=> b!1332558 (= lt!592039 (contains!8881 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun mapNonEmpty!56725 () Bool)

(declare-fun mapRes!56725 () Bool)

(declare-fun tp!108009 () Bool)

(declare-fun e!759133 () Bool)

(assert (=> mapNonEmpty!56725 (= mapRes!56725 (and tp!108009 e!759133))))

(declare-fun mapRest!56725 () (Array (_ BitVec 32) ValueCell!17452))

(declare-fun mapValue!56725 () ValueCell!17452)

(declare-fun mapKey!56725 () (_ BitVec 32))

(assert (=> mapNonEmpty!56725 (= (arr!43607 _values!1320) (store mapRest!56725 mapKey!56725 mapValue!56725))))

(declare-fun b!1332559 () Bool)

(assert (=> b!1332559 (= e!759133 tp_is_empty!36701)))

(declare-fun b!1332560 () Bool)

(declare-fun e!759135 () Bool)

(assert (=> b!1332560 (= e!759135 tp_is_empty!36701)))

(declare-fun mapIsEmpty!56725 () Bool)

(assert (=> mapIsEmpty!56725 mapRes!56725))

(declare-fun b!1332561 () Bool)

(declare-fun res!884303 () Bool)

(assert (=> b!1332561 (=> (not res!884303) (not e!759136))))

(declare-datatypes ((List!30891 0))(
  ( (Nil!30888) (Cons!30887 (h!32096 (_ BitVec 64)) (t!45089 List!30891)) )
))
(declare-fun arrayNoDuplicates!0 (array!90284 (_ BitVec 32) List!30891) Bool)

(assert (=> b!1332561 (= res!884303 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30888))))

(declare-fun b!1332562 () Bool)

(assert (=> b!1332562 (= e!759134 (and e!759135 mapRes!56725))))

(declare-fun condMapEmpty!56725 () Bool)

(declare-fun mapDefault!56725 () ValueCell!17452)

