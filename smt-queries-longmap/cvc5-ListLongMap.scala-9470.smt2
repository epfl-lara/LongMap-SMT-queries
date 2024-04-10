; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112428 () Bool)

(assert start!112428)

(declare-fun b_free!30823 () Bool)

(declare-fun b_next!30823 () Bool)

(assert (=> start!112428 (= b_free!30823 (not b_next!30823))))

(declare-fun tp!108105 () Bool)

(declare-fun b_and!49665 () Bool)

(assert (=> start!112428 (= tp!108105 b_and!49665)))

(declare-fun b!1332939 () Bool)

(declare-fun res!884543 () Bool)

(declare-fun e!759375 () Bool)

(assert (=> b!1332939 (=> (not res!884543) (not e!759375))))

(declare-datatypes ((array!90340 0))(
  ( (array!90341 (arr!43636 (Array (_ BitVec 32) (_ BitVec 64))) (size!44186 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90340)

(declare-datatypes ((List!30911 0))(
  ( (Nil!30908) (Cons!30907 (h!32116 (_ BitVec 64)) (t!45109 List!30911)) )
))
(declare-fun arrayNoDuplicates!0 (array!90340 (_ BitVec 32) List!30911) Bool)

(assert (=> b!1332939 (= res!884543 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30908))))

(declare-fun mapIsEmpty!56773 () Bool)

(declare-fun mapRes!56773 () Bool)

(assert (=> mapIsEmpty!56773 mapRes!56773))

(declare-fun b!1332941 () Bool)

(declare-fun res!884545 () Bool)

(assert (=> b!1332941 (=> (not res!884545) (not e!759375))))

(declare-datatypes ((V!54081 0))(
  ( (V!54082 (val!18441 Int)) )
))
(declare-datatypes ((ValueCell!17468 0))(
  ( (ValueCellFull!17468 (v!21078 V!54081)) (EmptyCell!17468) )
))
(declare-datatypes ((array!90342 0))(
  ( (array!90343 (arr!43637 (Array (_ BitVec 32) ValueCell!17468)) (size!44187 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90342)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1332941 (= res!884545 (and (= (size!44187 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44186 _keys!1590) (size!44187 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332942 () Bool)

(declare-fun e!759374 () Bool)

(declare-fun tp_is_empty!36733 () Bool)

(assert (=> b!1332942 (= e!759374 tp_is_empty!36733)))

(declare-fun b!1332943 () Bool)

(declare-fun res!884544 () Bool)

(assert (=> b!1332943 (=> (not res!884544) (not e!759375))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1332943 (= res!884544 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44186 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332944 () Bool)

(assert (=> b!1332944 (= e!759375 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54081)

(declare-fun zeroValue!1262 () V!54081)

(declare-fun lt!592087 () Bool)

(declare-datatypes ((tuple2!23766 0))(
  ( (tuple2!23767 (_1!11894 (_ BitVec 64)) (_2!11894 V!54081)) )
))
(declare-datatypes ((List!30912 0))(
  ( (Nil!30909) (Cons!30908 (h!32117 tuple2!23766) (t!45110 List!30912)) )
))
(declare-datatypes ((ListLongMap!21423 0))(
  ( (ListLongMap!21424 (toList!10727 List!30912)) )
))
(declare-fun contains!8891 (ListLongMap!21423 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5708 (array!90340 array!90342 (_ BitVec 32) (_ BitVec 32) V!54081 V!54081 (_ BitVec 32) Int) ListLongMap!21423)

(assert (=> b!1332944 (= lt!592087 (contains!8891 (getCurrentListMap!5708 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1332945 () Bool)

(declare-fun res!884547 () Bool)

(assert (=> b!1332945 (=> (not res!884547) (not e!759375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90340 (_ BitVec 32)) Bool)

(assert (=> b!1332945 (= res!884547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332946 () Bool)

(declare-fun e!759376 () Bool)

(assert (=> b!1332946 (= e!759376 tp_is_empty!36733)))

(declare-fun mapNonEmpty!56773 () Bool)

(declare-fun tp!108106 () Bool)

(assert (=> mapNonEmpty!56773 (= mapRes!56773 (and tp!108106 e!759374))))

(declare-fun mapValue!56773 () ValueCell!17468)

(declare-fun mapRest!56773 () (Array (_ BitVec 32) ValueCell!17468))

(declare-fun mapKey!56773 () (_ BitVec 32))

(assert (=> mapNonEmpty!56773 (= (arr!43637 _values!1320) (store mapRest!56773 mapKey!56773 mapValue!56773))))

(declare-fun res!884546 () Bool)

(assert (=> start!112428 (=> (not res!884546) (not e!759375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112428 (= res!884546 (validMask!0 mask!1998))))

(assert (=> start!112428 e!759375))

(declare-fun e!759372 () Bool)

(declare-fun array_inv!32913 (array!90342) Bool)

(assert (=> start!112428 (and (array_inv!32913 _values!1320) e!759372)))

(assert (=> start!112428 true))

(declare-fun array_inv!32914 (array!90340) Bool)

(assert (=> start!112428 (array_inv!32914 _keys!1590)))

(assert (=> start!112428 tp!108105))

(assert (=> start!112428 tp_is_empty!36733))

(declare-fun b!1332940 () Bool)

(assert (=> b!1332940 (= e!759372 (and e!759376 mapRes!56773))))

(declare-fun condMapEmpty!56773 () Bool)

(declare-fun mapDefault!56773 () ValueCell!17468)

