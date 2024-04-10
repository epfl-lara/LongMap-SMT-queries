; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112548 () Bool)

(assert start!112548)

(declare-fun b_free!30943 () Bool)

(declare-fun b_next!30943 () Bool)

(assert (=> start!112548 (= b_free!30943 (not b_next!30943))))

(declare-fun tp!108465 () Bool)

(declare-fun b_and!49851 () Bool)

(assert (=> start!112548 (= tp!108465 b_and!49851)))

(declare-fun res!886028 () Bool)

(declare-fun e!760357 () Bool)

(assert (=> start!112548 (=> (not res!886028) (not e!760357))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112548 (= res!886028 (validMask!0 mask!1998))))

(assert (=> start!112548 e!760357))

(declare-datatypes ((V!54241 0))(
  ( (V!54242 (val!18501 Int)) )
))
(declare-datatypes ((ValueCell!17528 0))(
  ( (ValueCellFull!17528 (v!21138 V!54241)) (EmptyCell!17528) )
))
(declare-datatypes ((array!90566 0))(
  ( (array!90567 (arr!43749 (Array (_ BitVec 32) ValueCell!17528)) (size!44299 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90566)

(declare-fun e!760354 () Bool)

(declare-fun array_inv!32993 (array!90566) Bool)

(assert (=> start!112548 (and (array_inv!32993 _values!1320) e!760354)))

(assert (=> start!112548 true))

(declare-datatypes ((array!90568 0))(
  ( (array!90569 (arr!43750 (Array (_ BitVec 32) (_ BitVec 64))) (size!44300 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90568)

(declare-fun array_inv!32994 (array!90568) Bool)

(assert (=> start!112548 (array_inv!32994 _keys!1590)))

(assert (=> start!112548 tp!108465))

(declare-fun tp_is_empty!36853 () Bool)

(assert (=> start!112548 tp_is_empty!36853))

(declare-fun b!1335030 () Bool)

(declare-fun res!886029 () Bool)

(assert (=> b!1335030 (=> (not res!886029) (not e!760357))))

(declare-datatypes ((List!30993 0))(
  ( (Nil!30990) (Cons!30989 (h!32198 (_ BitVec 64)) (t!45257 List!30993)) )
))
(declare-fun arrayNoDuplicates!0 (array!90568 (_ BitVec 32) List!30993) Bool)

(assert (=> b!1335030 (= res!886029 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30990))))

(declare-fun b!1335031 () Bool)

(assert (=> b!1335031 (= e!760357 false)))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun lt!592420 () Bool)

(declare-fun minValue!1262 () V!54241)

(declare-fun zeroValue!1262 () V!54241)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23854 0))(
  ( (tuple2!23855 (_1!11938 (_ BitVec 64)) (_2!11938 V!54241)) )
))
(declare-datatypes ((List!30994 0))(
  ( (Nil!30991) (Cons!30990 (h!32199 tuple2!23854) (t!45258 List!30994)) )
))
(declare-datatypes ((ListLongMap!21511 0))(
  ( (ListLongMap!21512 (toList!10771 List!30994)) )
))
(declare-fun contains!8935 (ListLongMap!21511 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5745 (array!90568 array!90566 (_ BitVec 32) (_ BitVec 32) V!54241 V!54241 (_ BitVec 32) Int) ListLongMap!21511)

(assert (=> b!1335031 (= lt!592420 (contains!8935 (getCurrentListMap!5745 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1335032 () Bool)

(declare-fun res!886030 () Bool)

(assert (=> b!1335032 (=> (not res!886030) (not e!760357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90568 (_ BitVec 32)) Bool)

(assert (=> b!1335032 (= res!886030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335033 () Bool)

(declare-fun res!886031 () Bool)

(assert (=> b!1335033 (=> (not res!886031) (not e!760357))))

(assert (=> b!1335033 (= res!886031 (and (= (size!44299 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44300 _keys!1590) (size!44299 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56953 () Bool)

(declare-fun mapRes!56953 () Bool)

(declare-fun tp!108466 () Bool)

(declare-fun e!760355 () Bool)

(assert (=> mapNonEmpty!56953 (= mapRes!56953 (and tp!108466 e!760355))))

(declare-fun mapValue!56953 () ValueCell!17528)

(declare-fun mapRest!56953 () (Array (_ BitVec 32) ValueCell!17528))

(declare-fun mapKey!56953 () (_ BitVec 32))

(assert (=> mapNonEmpty!56953 (= (arr!43749 _values!1320) (store mapRest!56953 mapKey!56953 mapValue!56953))))

(declare-fun b!1335034 () Bool)

(assert (=> b!1335034 (= e!760355 tp_is_empty!36853)))

(declare-fun b!1335035 () Bool)

(declare-fun e!760353 () Bool)

(assert (=> b!1335035 (= e!760354 (and e!760353 mapRes!56953))))

(declare-fun condMapEmpty!56953 () Bool)

(declare-fun mapDefault!56953 () ValueCell!17528)

