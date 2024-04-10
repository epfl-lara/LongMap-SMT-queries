; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84086 () Bool)

(assert start!84086)

(declare-fun b_free!19841 () Bool)

(declare-fun b_next!19841 () Bool)

(assert (=> start!84086 (= b_free!19841 (not b_next!19841))))

(declare-fun tp!69045 () Bool)

(declare-fun b_and!31765 () Bool)

(assert (=> start!84086 (= tp!69045 b_and!31765)))

(declare-fun mapNonEmpty!36362 () Bool)

(declare-fun mapRes!36362 () Bool)

(declare-fun tp!69046 () Bool)

(declare-fun e!554218 () Bool)

(assert (=> mapNonEmpty!36362 (= mapRes!36362 (and tp!69046 e!554218))))

(declare-datatypes ((V!35501 0))(
  ( (V!35502 (val!11495 Int)) )
))
(declare-datatypes ((ValueCell!10963 0))(
  ( (ValueCellFull!10963 (v!14057 V!35501)) (EmptyCell!10963) )
))
(declare-datatypes ((array!61767 0))(
  ( (array!61768 (arr!29741 (Array (_ BitVec 32) ValueCell!10963)) (size!30220 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61767)

(declare-fun mapRest!36362 () (Array (_ BitVec 32) ValueCell!10963))

(declare-fun mapKey!36362 () (_ BitVec 32))

(declare-fun mapValue!36362 () ValueCell!10963)

(assert (=> mapNonEmpty!36362 (= (arr!29741 _values!1278) (store mapRest!36362 mapKey!36362 mapValue!36362))))

(declare-fun b!983259 () Bool)

(declare-fun res!658007 () Bool)

(declare-fun e!554216 () Bool)

(assert (=> b!983259 (=> (not res!658007) (not e!554216))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61769 0))(
  ( (array!61770 (arr!29742 (Array (_ BitVec 32) (_ BitVec 64))) (size!30221 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61769)

(assert (=> b!983259 (= res!658007 (and (= (size!30220 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30221 _keys!1544) (size!30220 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983260 () Bool)

(declare-fun e!554215 () Bool)

(assert (=> b!983260 (= e!554216 e!554215)))

(declare-fun res!658010 () Bool)

(assert (=> b!983260 (=> (not res!658010) (not e!554215))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!983260 (= res!658010 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29742 _keys!1544) from!1932))))))

(declare-fun lt!436486 () V!35501)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15430 (ValueCell!10963 V!35501) V!35501)

(declare-fun dynLambda!1807 (Int (_ BitVec 64)) V!35501)

(assert (=> b!983260 (= lt!436486 (get!15430 (select (arr!29741 _values!1278) from!1932) (dynLambda!1807 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35501)

(declare-datatypes ((tuple2!14730 0))(
  ( (tuple2!14731 (_1!7376 (_ BitVec 64)) (_2!7376 V!35501)) )
))
(declare-datatypes ((List!20606 0))(
  ( (Nil!20603) (Cons!20602 (h!21764 tuple2!14730) (t!29397 List!20606)) )
))
(declare-datatypes ((ListLongMap!13427 0))(
  ( (ListLongMap!13428 (toList!6729 List!20606)) )
))
(declare-fun lt!436490 () ListLongMap!13427)

(declare-fun zeroValue!1220 () V!35501)

(declare-fun getCurrentListMapNoExtraKeys!3424 (array!61769 array!61767 (_ BitVec 32) (_ BitVec 32) V!35501 V!35501 (_ BitVec 32) Int) ListLongMap!13427)

(assert (=> b!983260 (= lt!436490 (getCurrentListMapNoExtraKeys!3424 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983261 () Bool)

(declare-fun e!554217 () Bool)

(declare-fun e!554220 () Bool)

(assert (=> b!983261 (= e!554217 (and e!554220 mapRes!36362))))

(declare-fun condMapEmpty!36362 () Bool)

(declare-fun mapDefault!36362 () ValueCell!10963)

