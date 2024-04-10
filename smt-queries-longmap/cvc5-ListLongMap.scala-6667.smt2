; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83974 () Bool)

(assert start!83974)

(declare-fun b_free!19729 () Bool)

(declare-fun b_next!19729 () Bool)

(assert (=> start!83974 (= b_free!19729 (not b_next!19729))))

(declare-fun tp!68709 () Bool)

(declare-fun b_and!31547 () Bool)

(assert (=> start!83974 (= tp!68709 b_and!31547)))

(declare-fun b!981312 () Bool)

(declare-fun res!656669 () Bool)

(declare-fun e!553218 () Bool)

(assert (=> b!981312 (=> (not res!656669) (not e!553218))))

(declare-datatypes ((array!61551 0))(
  ( (array!61552 (arr!29633 (Array (_ BitVec 32) (_ BitVec 64))) (size!30112 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61551)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981312 (= res!656669 (validKeyInArray!0 (select (arr!29633 _keys!1544) from!1932)))))

(declare-fun b!981313 () Bool)

(declare-fun res!656668 () Bool)

(assert (=> b!981313 (=> (not res!656668) (not e!553218))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981313 (= res!656668 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!981314 () Bool)

(assert (=> b!981314 (= e!553218 false)))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35353 0))(
  ( (V!35354 (val!11439 Int)) )
))
(declare-fun minValue!1220 () V!35353)

(declare-datatypes ((tuple2!14638 0))(
  ( (tuple2!14639 (_1!7330 (_ BitVec 64)) (_2!7330 V!35353)) )
))
(declare-datatypes ((List!20523 0))(
  ( (Nil!20520) (Cons!20519 (h!21681 tuple2!14638) (t!29206 List!20523)) )
))
(declare-datatypes ((ListLongMap!13335 0))(
  ( (ListLongMap!13336 (toList!6683 List!20523)) )
))
(declare-fun lt!435674 () ListLongMap!13335)

(declare-fun zeroValue!1220 () V!35353)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((ValueCell!10907 0))(
  ( (ValueCellFull!10907 (v!14001 V!35353)) (EmptyCell!10907) )
))
(declare-datatypes ((array!61553 0))(
  ( (array!61554 (arr!29634 (Array (_ BitVec 32) ValueCell!10907)) (size!30113 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61553)

(declare-fun getCurrentListMapNoExtraKeys!3385 (array!61551 array!61553 (_ BitVec 32) (_ BitVec 32) V!35353 V!35353 (_ BitVec 32) Int) ListLongMap!13335)

(assert (=> b!981314 (= lt!435674 (getCurrentListMapNoExtraKeys!3385 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981315 () Bool)

(declare-fun res!656666 () Bool)

(assert (=> b!981315 (=> (not res!656666) (not e!553218))))

(assert (=> b!981315 (= res!656666 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30112 _keys!1544))))))

(declare-fun b!981316 () Bool)

(declare-fun res!656667 () Bool)

(assert (=> b!981316 (=> (not res!656667) (not e!553218))))

(assert (=> b!981316 (= res!656667 (and (= (size!30113 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30112 _keys!1544) (size!30113 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36194 () Bool)

(declare-fun mapRes!36194 () Bool)

(assert (=> mapIsEmpty!36194 mapRes!36194))

(declare-fun res!656672 () Bool)

(assert (=> start!83974 (=> (not res!656672) (not e!553218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83974 (= res!656672 (validMask!0 mask!1948))))

(assert (=> start!83974 e!553218))

(assert (=> start!83974 true))

(declare-fun tp_is_empty!22777 () Bool)

(assert (=> start!83974 tp_is_empty!22777))

(declare-fun e!553216 () Bool)

(declare-fun array_inv!22911 (array!61553) Bool)

(assert (=> start!83974 (and (array_inv!22911 _values!1278) e!553216)))

(assert (=> start!83974 tp!68709))

(declare-fun array_inv!22912 (array!61551) Bool)

(assert (=> start!83974 (array_inv!22912 _keys!1544)))

(declare-fun b!981317 () Bool)

(declare-fun res!656671 () Bool)

(assert (=> b!981317 (=> (not res!656671) (not e!553218))))

(declare-datatypes ((List!20524 0))(
  ( (Nil!20521) (Cons!20520 (h!21682 (_ BitVec 64)) (t!29207 List!20524)) )
))
(declare-fun arrayNoDuplicates!0 (array!61551 (_ BitVec 32) List!20524) Bool)

(assert (=> b!981317 (= res!656671 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20521))))

(declare-fun mapNonEmpty!36194 () Bool)

(declare-fun tp!68710 () Bool)

(declare-fun e!553214 () Bool)

(assert (=> mapNonEmpty!36194 (= mapRes!36194 (and tp!68710 e!553214))))

(declare-fun mapValue!36194 () ValueCell!10907)

(declare-fun mapKey!36194 () (_ BitVec 32))

(declare-fun mapRest!36194 () (Array (_ BitVec 32) ValueCell!10907))

(assert (=> mapNonEmpty!36194 (= (arr!29634 _values!1278) (store mapRest!36194 mapKey!36194 mapValue!36194))))

(declare-fun b!981318 () Bool)

(assert (=> b!981318 (= e!553214 tp_is_empty!22777)))

(declare-fun b!981319 () Bool)

(declare-fun e!553217 () Bool)

(assert (=> b!981319 (= e!553217 tp_is_empty!22777)))

(declare-fun b!981320 () Bool)

(declare-fun res!656670 () Bool)

(assert (=> b!981320 (=> (not res!656670) (not e!553218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61551 (_ BitVec 32)) Bool)

(assert (=> b!981320 (= res!656670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981321 () Bool)

(assert (=> b!981321 (= e!553216 (and e!553217 mapRes!36194))))

(declare-fun condMapEmpty!36194 () Bool)

(declare-fun mapDefault!36194 () ValueCell!10907)

