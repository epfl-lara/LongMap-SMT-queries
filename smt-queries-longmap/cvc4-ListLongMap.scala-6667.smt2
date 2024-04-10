; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83978 () Bool)

(assert start!83978)

(declare-fun b_free!19733 () Bool)

(declare-fun b_next!19733 () Bool)

(assert (=> start!83978 (= b_free!19733 (not b_next!19733))))

(declare-fun tp!68722 () Bool)

(declare-fun b_and!31551 () Bool)

(assert (=> start!83978 (= tp!68722 b_and!31551)))

(declare-fun b!981372 () Bool)

(declare-fun e!553246 () Bool)

(assert (=> b!981372 (= e!553246 false)))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35357 0))(
  ( (V!35358 (val!11441 Int)) )
))
(declare-fun minValue!1220 () V!35357)

(declare-datatypes ((ValueCell!10909 0))(
  ( (ValueCellFull!10909 (v!14003 V!35357)) (EmptyCell!10909) )
))
(declare-datatypes ((array!61559 0))(
  ( (array!61560 (arr!29637 (Array (_ BitVec 32) ValueCell!10909)) (size!30116 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61559)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35357)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((tuple2!14642 0))(
  ( (tuple2!14643 (_1!7332 (_ BitVec 64)) (_2!7332 V!35357)) )
))
(declare-datatypes ((List!20527 0))(
  ( (Nil!20524) (Cons!20523 (h!21685 tuple2!14642) (t!29210 List!20527)) )
))
(declare-datatypes ((ListLongMap!13339 0))(
  ( (ListLongMap!13340 (toList!6685 List!20527)) )
))
(declare-fun lt!435680 () ListLongMap!13339)

(declare-datatypes ((array!61561 0))(
  ( (array!61562 (arr!29638 (Array (_ BitVec 32) (_ BitVec 64))) (size!30117 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61561)

(declare-fun getCurrentListMapNoExtraKeys!3387 (array!61561 array!61559 (_ BitVec 32) (_ BitVec 32) V!35357 V!35357 (_ BitVec 32) Int) ListLongMap!13339)

(assert (=> b!981372 (= lt!435680 (getCurrentListMapNoExtraKeys!3387 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981373 () Bool)

(declare-fun res!656710 () Bool)

(assert (=> b!981373 (=> (not res!656710) (not e!553246))))

(assert (=> b!981373 (= res!656710 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!981374 () Bool)

(declare-fun res!656708 () Bool)

(assert (=> b!981374 (=> (not res!656708) (not e!553246))))

(declare-datatypes ((List!20528 0))(
  ( (Nil!20525) (Cons!20524 (h!21686 (_ BitVec 64)) (t!29211 List!20528)) )
))
(declare-fun arrayNoDuplicates!0 (array!61561 (_ BitVec 32) List!20528) Bool)

(assert (=> b!981374 (= res!656708 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20525))))

(declare-fun b!981375 () Bool)

(declare-fun res!656712 () Bool)

(assert (=> b!981375 (=> (not res!656712) (not e!553246))))

(assert (=> b!981375 (= res!656712 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30117 _keys!1544))))))

(declare-fun b!981376 () Bool)

(declare-fun e!553247 () Bool)

(declare-fun tp_is_empty!22781 () Bool)

(assert (=> b!981376 (= e!553247 tp_is_empty!22781)))

(declare-fun mapNonEmpty!36200 () Bool)

(declare-fun mapRes!36200 () Bool)

(declare-fun tp!68721 () Bool)

(assert (=> mapNonEmpty!36200 (= mapRes!36200 (and tp!68721 e!553247))))

(declare-fun mapKey!36200 () (_ BitVec 32))

(declare-fun mapRest!36200 () (Array (_ BitVec 32) ValueCell!10909))

(declare-fun mapValue!36200 () ValueCell!10909)

(assert (=> mapNonEmpty!36200 (= (arr!29637 _values!1278) (store mapRest!36200 mapKey!36200 mapValue!36200))))

(declare-fun b!981378 () Bool)

(declare-fun e!553244 () Bool)

(declare-fun e!553245 () Bool)

(assert (=> b!981378 (= e!553244 (and e!553245 mapRes!36200))))

(declare-fun condMapEmpty!36200 () Bool)

(declare-fun mapDefault!36200 () ValueCell!10909)

