; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112272 () Bool)

(assert start!112272)

(declare-fun b_free!30667 () Bool)

(declare-fun b_next!30667 () Bool)

(assert (=> start!112272 (= b_free!30667 (not b_next!30667))))

(declare-fun tp!107637 () Bool)

(declare-fun b_and!49389 () Bool)

(assert (=> start!112272 (= tp!107637 b_and!49389)))

(declare-fun b!1330235 () Bool)

(declare-fun res!882669 () Bool)

(declare-fun e!758204 () Bool)

(assert (=> b!1330235 (=> (not res!882669) (not e!758204))))

(declare-datatypes ((array!90044 0))(
  ( (array!90045 (arr!43488 (Array (_ BitVec 32) (_ BitVec 64))) (size!44038 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90044)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330235 (= res!882669 (validKeyInArray!0 (select (arr!43488 _keys!1590) from!1980)))))

(declare-fun b!1330236 () Bool)

(declare-fun res!882661 () Bool)

(assert (=> b!1330236 (=> (not res!882661) (not e!758204))))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1330236 (= res!882661 (not (= (select (arr!43488 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1330237 () Bool)

(declare-fun res!882662 () Bool)

(assert (=> b!1330237 (=> (not res!882662) (not e!758204))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90044 (_ BitVec 32)) Bool)

(assert (=> b!1330237 (= res!882662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330238 () Bool)

(declare-fun res!882667 () Bool)

(assert (=> b!1330238 (=> (not res!882667) (not e!758204))))

(declare-datatypes ((List!30799 0))(
  ( (Nil!30796) (Cons!30795 (h!32004 (_ BitVec 64)) (t!44879 List!30799)) )
))
(declare-fun arrayNoDuplicates!0 (array!90044 (_ BitVec 32) List!30799) Bool)

(assert (=> b!1330238 (= res!882667 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30796))))

(declare-fun b!1330239 () Bool)

(assert (=> b!1330239 (= e!758204 (not true))))

(declare-datatypes ((V!53873 0))(
  ( (V!53874 (val!18363 Int)) )
))
(declare-datatypes ((tuple2!23648 0))(
  ( (tuple2!23649 (_1!11835 (_ BitVec 64)) (_2!11835 V!53873)) )
))
(declare-datatypes ((List!30800 0))(
  ( (Nil!30797) (Cons!30796 (h!32005 tuple2!23648) (t!44880 List!30800)) )
))
(declare-datatypes ((ListLongMap!21305 0))(
  ( (ListLongMap!21306 (toList!10668 List!30800)) )
))
(declare-fun lt!591082 () ListLongMap!21305)

(declare-fun contains!8832 (ListLongMap!21305 (_ BitVec 64)) Bool)

(assert (=> b!1330239 (contains!8832 lt!591082 k!1153)))

(declare-datatypes ((Unit!43781 0))(
  ( (Unit!43782) )
))
(declare-fun lt!591081 () Unit!43781)

(declare-fun minValue!1262 () V!53873)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!253 ((_ BitVec 64) (_ BitVec 64) V!53873 ListLongMap!21305) Unit!43781)

(assert (=> b!1330239 (= lt!591081 (lemmaInListMapAfterAddingDiffThenInBefore!253 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591082))))

(declare-datatypes ((ValueCell!17390 0))(
  ( (ValueCellFull!17390 (v!21000 V!53873)) (EmptyCell!17390) )
))
(declare-datatypes ((array!90046 0))(
  ( (array!90047 (arr!43489 (Array (_ BitVec 32) ValueCell!17390)) (size!44039 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90046)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53873)

(declare-fun +!4666 (ListLongMap!21305 tuple2!23648) ListLongMap!21305)

(declare-fun getCurrentListMapNoExtraKeys!6304 (array!90044 array!90046 (_ BitVec 32) (_ BitVec 32) V!53873 V!53873 (_ BitVec 32) Int) ListLongMap!21305)

(declare-fun get!21918 (ValueCell!17390 V!53873) V!53873)

(declare-fun dynLambda!3605 (Int (_ BitVec 64)) V!53873)

(assert (=> b!1330239 (= lt!591082 (+!4666 (getCurrentListMapNoExtraKeys!6304 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23649 (select (arr!43488 _keys!1590) from!1980) (get!21918 (select (arr!43489 _values!1320) from!1980) (dynLambda!3605 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!56539 () Bool)

(declare-fun mapRes!56539 () Bool)

(declare-fun tp!107638 () Bool)

(declare-fun e!758203 () Bool)

(assert (=> mapNonEmpty!56539 (= mapRes!56539 (and tp!107638 e!758203))))

(declare-fun mapRest!56539 () (Array (_ BitVec 32) ValueCell!17390))

(declare-fun mapKey!56539 () (_ BitVec 32))

(declare-fun mapValue!56539 () ValueCell!17390)

(assert (=> mapNonEmpty!56539 (= (arr!43489 _values!1320) (store mapRest!56539 mapKey!56539 mapValue!56539))))

(declare-fun b!1330240 () Bool)

(declare-fun res!882664 () Bool)

(assert (=> b!1330240 (=> (not res!882664) (not e!758204))))

(assert (=> b!1330240 (= res!882664 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330241 () Bool)

(declare-fun res!882668 () Bool)

(assert (=> b!1330241 (=> (not res!882668) (not e!758204))))

(declare-fun getCurrentListMap!5656 (array!90044 array!90046 (_ BitVec 32) (_ BitVec 32) V!53873 V!53873 (_ BitVec 32) Int) ListLongMap!21305)

(assert (=> b!1330241 (= res!882668 (contains!8832 (getCurrentListMap!5656 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1330242 () Bool)

(declare-fun res!882666 () Bool)

(assert (=> b!1330242 (=> (not res!882666) (not e!758204))))

(assert (=> b!1330242 (= res!882666 (and (= (size!44039 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44038 _keys!1590) (size!44039 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!882665 () Bool)

(assert (=> start!112272 (=> (not res!882665) (not e!758204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112272 (= res!882665 (validMask!0 mask!1998))))

(assert (=> start!112272 e!758204))

(declare-fun e!758205 () Bool)

(declare-fun array_inv!32809 (array!90046) Bool)

(assert (=> start!112272 (and (array_inv!32809 _values!1320) e!758205)))

(assert (=> start!112272 true))

(declare-fun array_inv!32810 (array!90044) Bool)

(assert (=> start!112272 (array_inv!32810 _keys!1590)))

(assert (=> start!112272 tp!107637))

(declare-fun tp_is_empty!36577 () Bool)

(assert (=> start!112272 tp_is_empty!36577))

(declare-fun mapIsEmpty!56539 () Bool)

(assert (=> mapIsEmpty!56539 mapRes!56539))

(declare-fun b!1330243 () Bool)

(assert (=> b!1330243 (= e!758203 tp_is_empty!36577)))

(declare-fun b!1330244 () Bool)

(declare-fun e!758206 () Bool)

(assert (=> b!1330244 (= e!758205 (and e!758206 mapRes!56539))))

(declare-fun condMapEmpty!56539 () Bool)

(declare-fun mapDefault!56539 () ValueCell!17390)

