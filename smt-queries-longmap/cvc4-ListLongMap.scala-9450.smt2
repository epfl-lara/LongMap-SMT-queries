; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112312 () Bool)

(assert start!112312)

(declare-fun b_free!30707 () Bool)

(declare-fun b_next!30707 () Bool)

(assert (=> start!112312 (= b_free!30707 (not b_next!30707))))

(declare-fun tp!107758 () Bool)

(declare-fun b_and!49469 () Bool)

(assert (=> start!112312 (= tp!107758 b_and!49469)))

(declare-fun b!1330995 () Bool)

(declare-fun e!758503 () Bool)

(declare-fun tp_is_empty!36617 () Bool)

(assert (=> b!1330995 (= e!758503 tp_is_empty!36617)))

(declare-fun b!1330996 () Bool)

(declare-fun res!883201 () Bool)

(declare-fun e!758502 () Bool)

(assert (=> b!1330996 (=> (not res!883201) (not e!758502))))

(declare-datatypes ((array!90118 0))(
  ( (array!90119 (arr!43525 (Array (_ BitVec 32) (_ BitVec 64))) (size!44075 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90118)

(declare-datatypes ((List!30827 0))(
  ( (Nil!30824) (Cons!30823 (h!32032 (_ BitVec 64)) (t!44947 List!30827)) )
))
(declare-fun arrayNoDuplicates!0 (array!90118 (_ BitVec 32) List!30827) Bool)

(assert (=> b!1330996 (= res!883201 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30824))))

(declare-fun mapNonEmpty!56599 () Bool)

(declare-fun mapRes!56599 () Bool)

(declare-fun tp!107757 () Bool)

(declare-fun e!758504 () Bool)

(assert (=> mapNonEmpty!56599 (= mapRes!56599 (and tp!107757 e!758504))))

(declare-fun mapKey!56599 () (_ BitVec 32))

(declare-datatypes ((V!53925 0))(
  ( (V!53926 (val!18383 Int)) )
))
(declare-datatypes ((ValueCell!17410 0))(
  ( (ValueCellFull!17410 (v!21020 V!53925)) (EmptyCell!17410) )
))
(declare-fun mapValue!56599 () ValueCell!17410)

(declare-datatypes ((array!90120 0))(
  ( (array!90121 (arr!43526 (Array (_ BitVec 32) ValueCell!17410)) (size!44076 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90120)

(declare-fun mapRest!56599 () (Array (_ BitVec 32) ValueCell!17410))

(assert (=> mapNonEmpty!56599 (= (arr!43526 _values!1320) (store mapRest!56599 mapKey!56599 mapValue!56599))))

(declare-fun b!1330998 () Bool)

(declare-fun res!883209 () Bool)

(assert (=> b!1330998 (=> (not res!883209) (not e!758502))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1330998 (= res!883209 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44075 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330999 () Bool)

(declare-fun res!883208 () Bool)

(assert (=> b!1330999 (=> (not res!883208) (not e!758502))))

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1330999 (= res!883208 (and (= (size!44076 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44075 _keys!1590) (size!44076 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331000 () Bool)

(declare-fun res!883205 () Bool)

(assert (=> b!1331000 (=> (not res!883205) (not e!758502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90118 (_ BitVec 32)) Bool)

(assert (=> b!1331000 (= res!883205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331001 () Bool)

(declare-fun res!883202 () Bool)

(assert (=> b!1331001 (=> (not res!883202) (not e!758502))))

(assert (=> b!1331001 (= res!883202 (not (= (select (arr!43525 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1331002 () Bool)

(assert (=> b!1331002 (= e!758502 (not true))))

(declare-datatypes ((tuple2!23678 0))(
  ( (tuple2!23679 (_1!11850 (_ BitVec 64)) (_2!11850 V!53925)) )
))
(declare-datatypes ((List!30828 0))(
  ( (Nil!30825) (Cons!30824 (h!32033 tuple2!23678) (t!44948 List!30828)) )
))
(declare-datatypes ((ListLongMap!21335 0))(
  ( (ListLongMap!21336 (toList!10683 List!30828)) )
))
(declare-fun lt!591362 () ListLongMap!21335)

(declare-fun contains!8847 (ListLongMap!21335 (_ BitVec 64)) Bool)

(assert (=> b!1331002 (contains!8847 lt!591362 k!1153)))

(declare-datatypes ((Unit!43807 0))(
  ( (Unit!43808) )
))
(declare-fun lt!591361 () Unit!43807)

(declare-fun lt!591363 () V!53925)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!266 ((_ BitVec 64) (_ BitVec 64) V!53925 ListLongMap!21335) Unit!43807)

(assert (=> b!1331002 (= lt!591361 (lemmaInListMapAfterAddingDiffThenInBefore!266 k!1153 (select (arr!43525 _keys!1590) from!1980) lt!591363 lt!591362))))

(declare-fun lt!591364 () ListLongMap!21335)

(assert (=> b!1331002 (contains!8847 lt!591364 k!1153)))

(declare-fun lt!591360 () Unit!43807)

(declare-fun minValue!1262 () V!53925)

(assert (=> b!1331002 (= lt!591360 (lemmaInListMapAfterAddingDiffThenInBefore!266 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591364))))

(declare-fun +!4679 (ListLongMap!21335 tuple2!23678) ListLongMap!21335)

(assert (=> b!1331002 (= lt!591364 (+!4679 lt!591362 (tuple2!23679 (select (arr!43525 _keys!1590) from!1980) lt!591363)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21943 (ValueCell!17410 V!53925) V!53925)

(declare-fun dynLambda!3618 (Int (_ BitVec 64)) V!53925)

(assert (=> b!1331002 (= lt!591363 (get!21943 (select (arr!43526 _values!1320) from!1980) (dynLambda!3618 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!53925)

(declare-fun getCurrentListMapNoExtraKeys!6317 (array!90118 array!90120 (_ BitVec 32) (_ BitVec 32) V!53925 V!53925 (_ BitVec 32) Int) ListLongMap!21335)

(assert (=> b!1331002 (= lt!591362 (getCurrentListMapNoExtraKeys!6317 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331003 () Bool)

(declare-fun e!758505 () Bool)

(assert (=> b!1331003 (= e!758505 (and e!758503 mapRes!56599))))

(declare-fun condMapEmpty!56599 () Bool)

(declare-fun mapDefault!56599 () ValueCell!17410)

