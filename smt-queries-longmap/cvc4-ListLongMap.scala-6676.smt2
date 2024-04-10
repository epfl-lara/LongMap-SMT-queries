; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84032 () Bool)

(assert start!84032)

(declare-fun b_free!19787 () Bool)

(declare-fun b_next!19787 () Bool)

(assert (=> start!84032 (= b_free!19787 (not b_next!19787))))

(declare-fun tp!68883 () Bool)

(declare-fun b_and!31657 () Bool)

(assert (=> start!84032 (= tp!68883 b_and!31657)))

(declare-fun b!982314 () Bool)

(declare-fun res!657362 () Bool)

(declare-fun e!553734 () Bool)

(assert (=> b!982314 (=> (not res!657362) (not e!553734))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35429 0))(
  ( (V!35430 (val!11468 Int)) )
))
(declare-datatypes ((ValueCell!10936 0))(
  ( (ValueCellFull!10936 (v!14030 V!35429)) (EmptyCell!10936) )
))
(declare-datatypes ((array!61663 0))(
  ( (array!61664 (arr!29689 (Array (_ BitVec 32) ValueCell!10936)) (size!30168 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61663)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61665 0))(
  ( (array!61666 (arr!29690 (Array (_ BitVec 32) (_ BitVec 64))) (size!30169 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61665)

(assert (=> b!982314 (= res!657362 (and (= (size!30168 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30169 _keys!1544) (size!30168 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982315 () Bool)

(declare-fun res!657358 () Bool)

(assert (=> b!982315 (=> (not res!657358) (not e!553734))))

(declare-datatypes ((List!20569 0))(
  ( (Nil!20566) (Cons!20565 (h!21727 (_ BitVec 64)) (t!29306 List!20569)) )
))
(declare-fun arrayNoDuplicates!0 (array!61665 (_ BitVec 32) List!20569) Bool)

(assert (=> b!982315 (= res!657358 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20566))))

(declare-fun mapNonEmpty!36281 () Bool)

(declare-fun mapRes!36281 () Bool)

(declare-fun tp!68884 () Bool)

(declare-fun e!553730 () Bool)

(assert (=> mapNonEmpty!36281 (= mapRes!36281 (and tp!68884 e!553730))))

(declare-fun mapValue!36281 () ValueCell!10936)

(declare-fun mapKey!36281 () (_ BitVec 32))

(declare-fun mapRest!36281 () (Array (_ BitVec 32) ValueCell!10936))

(assert (=> mapNonEmpty!36281 (= (arr!29689 _values!1278) (store mapRest!36281 mapKey!36281 mapValue!36281))))

(declare-fun b!982316 () Bool)

(declare-fun e!553731 () Bool)

(assert (=> b!982316 (= e!553734 e!553731)))

(declare-fun res!657355 () Bool)

(assert (=> b!982316 (=> (not res!657355) (not e!553731))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982316 (= res!657355 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29690 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436082 () V!35429)

(declare-fun get!15396 (ValueCell!10936 V!35429) V!35429)

(declare-fun dynLambda!1791 (Int (_ BitVec 64)) V!35429)

(assert (=> b!982316 (= lt!436082 (get!15396 (select (arr!29689 _values!1278) from!1932) (dynLambda!1791 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35429)

(declare-fun zeroValue!1220 () V!35429)

(declare-datatypes ((tuple2!14688 0))(
  ( (tuple2!14689 (_1!7355 (_ BitVec 64)) (_2!7355 V!35429)) )
))
(declare-datatypes ((List!20570 0))(
  ( (Nil!20567) (Cons!20566 (h!21728 tuple2!14688) (t!29307 List!20570)) )
))
(declare-datatypes ((ListLongMap!13385 0))(
  ( (ListLongMap!13386 (toList!6708 List!20570)) )
))
(declare-fun lt!436081 () ListLongMap!13385)

(declare-fun getCurrentListMapNoExtraKeys!3408 (array!61665 array!61663 (_ BitVec 32) (_ BitVec 32) V!35429 V!35429 (_ BitVec 32) Int) ListLongMap!13385)

(assert (=> b!982316 (= lt!436081 (getCurrentListMapNoExtraKeys!3408 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982317 () Bool)

(declare-fun res!657357 () Bool)

(assert (=> b!982317 (=> (not res!657357) (not e!553734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982317 (= res!657357 (validKeyInArray!0 (select (arr!29690 _keys!1544) from!1932)))))

(declare-fun b!982319 () Bool)

(declare-fun res!657360 () Bool)

(assert (=> b!982319 (=> (not res!657360) (not e!553734))))

(assert (=> b!982319 (= res!657360 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982320 () Bool)

(assert (=> b!982320 (= e!553731 (not (bvsle from!1932 (size!30169 _keys!1544))))))

(declare-fun lt!436083 () tuple2!14688)

(declare-fun lt!436084 () tuple2!14688)

(declare-fun +!3006 (ListLongMap!13385 tuple2!14688) ListLongMap!13385)

(assert (=> b!982320 (= (+!3006 (+!3006 lt!436081 lt!436083) lt!436084) (+!3006 (+!3006 lt!436081 lt!436084) lt!436083))))

(assert (=> b!982320 (= lt!436084 (tuple2!14689 (select (arr!29690 _keys!1544) from!1932) lt!436082))))

(assert (=> b!982320 (= lt!436083 (tuple2!14689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32651 0))(
  ( (Unit!32652) )
))
(declare-fun lt!436085 () Unit!32651)

(declare-fun addCommutativeForDiffKeys!634 (ListLongMap!13385 (_ BitVec 64) V!35429 (_ BitVec 64) V!35429) Unit!32651)

(assert (=> b!982320 (= lt!436085 (addCommutativeForDiffKeys!634 lt!436081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29690 _keys!1544) from!1932) lt!436082))))

(declare-fun b!982321 () Bool)

(declare-fun tp_is_empty!22835 () Bool)

(assert (=> b!982321 (= e!553730 tp_is_empty!22835)))

(declare-fun b!982322 () Bool)

(declare-fun e!553733 () Bool)

(declare-fun e!553732 () Bool)

(assert (=> b!982322 (= e!553733 (and e!553732 mapRes!36281))))

(declare-fun condMapEmpty!36281 () Bool)

(declare-fun mapDefault!36281 () ValueCell!10936)

