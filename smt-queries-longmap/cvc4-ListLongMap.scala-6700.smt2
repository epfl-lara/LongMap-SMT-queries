; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84176 () Bool)

(assert start!84176)

(declare-fun b_free!19877 () Bool)

(declare-fun b_next!19877 () Bool)

(assert (=> start!84176 (= b_free!19877 (not b_next!19877))))

(declare-fun tp!69234 () Bool)

(declare-fun b_and!31831 () Bool)

(assert (=> start!84176 (= tp!69234 b_and!31831)))

(declare-fun b!984387 () Bool)

(declare-fun res!658698 () Bool)

(declare-fun e!554936 () Bool)

(assert (=> b!984387 (=> (not res!658698) (not e!554936))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35621 0))(
  ( (V!35622 (val!11540 Int)) )
))
(declare-datatypes ((ValueCell!11008 0))(
  ( (ValueCellFull!11008 (v!14102 V!35621)) (EmptyCell!11008) )
))
(declare-datatypes ((array!61939 0))(
  ( (array!61940 (arr!29827 (Array (_ BitVec 32) ValueCell!11008)) (size!30306 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61939)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61941 0))(
  ( (array!61942 (arr!29828 (Array (_ BitVec 32) (_ BitVec 64))) (size!30307 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61941)

(assert (=> b!984387 (= res!658698 (and (= (size!30306 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30307 _keys!1544) (size!30306 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984388 () Bool)

(declare-fun e!554937 () Bool)

(declare-fun tp_is_empty!22979 () Bool)

(assert (=> b!984388 (= e!554937 tp_is_empty!22979)))

(declare-fun mapNonEmpty!36497 () Bool)

(declare-fun mapRes!36497 () Bool)

(declare-fun tp!69235 () Bool)

(assert (=> mapNonEmpty!36497 (= mapRes!36497 (and tp!69235 e!554937))))

(declare-fun mapRest!36497 () (Array (_ BitVec 32) ValueCell!11008))

(declare-fun mapKey!36497 () (_ BitVec 32))

(declare-fun mapValue!36497 () ValueCell!11008)

(assert (=> mapNonEmpty!36497 (= (arr!29827 _values!1278) (store mapRest!36497 mapKey!36497 mapValue!36497))))

(declare-fun b!984389 () Bool)

(declare-fun e!554935 () Bool)

(assert (=> b!984389 (= e!554935 tp_is_empty!22979)))

(declare-fun b!984390 () Bool)

(declare-fun res!658701 () Bool)

(assert (=> b!984390 (=> (not res!658701) (not e!554936))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984390 (= res!658701 (validKeyInArray!0 (select (arr!29828 _keys!1544) from!1932)))))

(declare-fun b!984391 () Bool)

(declare-fun res!658696 () Bool)

(assert (=> b!984391 (=> (not res!658696) (not e!554936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61941 (_ BitVec 32)) Bool)

(assert (=> b!984391 (= res!658696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984392 () Bool)

(declare-fun e!554939 () Bool)

(assert (=> b!984392 (= e!554936 e!554939)))

(declare-fun res!658697 () Bool)

(assert (=> b!984392 (=> (not res!658697) (not e!554939))))

(assert (=> b!984392 (= res!658697 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29828 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436795 () V!35621)

(declare-fun get!15469 (ValueCell!11008 V!35621) V!35621)

(declare-fun dynLambda!1816 (Int (_ BitVec 64)) V!35621)

(assert (=> b!984392 (= lt!436795 (get!15469 (select (arr!29827 _values!1278) from!1932) (dynLambda!1816 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35621)

(declare-fun zeroValue!1220 () V!35621)

(declare-datatypes ((tuple2!14758 0))(
  ( (tuple2!14759 (_1!7390 (_ BitVec 64)) (_2!7390 V!35621)) )
))
(declare-datatypes ((List!20651 0))(
  ( (Nil!20648) (Cons!20647 (h!21809 tuple2!14758) (t!29472 List!20651)) )
))
(declare-datatypes ((ListLongMap!13455 0))(
  ( (ListLongMap!13456 (toList!6743 List!20651)) )
))
(declare-fun lt!436793 () ListLongMap!13455)

(declare-fun getCurrentListMapNoExtraKeys!3436 (array!61941 array!61939 (_ BitVec 32) (_ BitVec 32) V!35621 V!35621 (_ BitVec 32) Int) ListLongMap!13455)

(assert (=> b!984392 (= lt!436793 (getCurrentListMapNoExtraKeys!3436 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984393 () Bool)

(declare-fun res!658702 () Bool)

(assert (=> b!984393 (=> (not res!658702) (not e!554936))))

(declare-datatypes ((List!20652 0))(
  ( (Nil!20649) (Cons!20648 (h!21810 (_ BitVec 64)) (t!29473 List!20652)) )
))
(declare-fun arrayNoDuplicates!0 (array!61941 (_ BitVec 32) List!20652) Bool)

(assert (=> b!984393 (= res!658702 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20649))))

(declare-fun b!984394 () Bool)

(declare-fun e!554940 () Bool)

(assert (=> b!984394 (= e!554940 (and e!554935 mapRes!36497))))

(declare-fun condMapEmpty!36497 () Bool)

(declare-fun mapDefault!36497 () ValueCell!11008)

