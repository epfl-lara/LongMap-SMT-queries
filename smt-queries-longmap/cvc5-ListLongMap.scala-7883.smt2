; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98042 () Bool)

(assert start!98042)

(declare-fun b_free!23743 () Bool)

(declare-fun b_next!23743 () Bool)

(assert (=> start!98042 (= b_free!23743 (not b_next!23743))))

(declare-fun tp!83933 () Bool)

(declare-fun b_and!38269 () Bool)

(assert (=> start!98042 (= tp!83933 b_and!38269)))

(declare-fun b!1125380 () Bool)

(declare-fun e!640610 () Bool)

(declare-fun e!640605 () Bool)

(assert (=> b!1125380 (= e!640610 e!640605)))

(declare-fun res!751990 () Bool)

(assert (=> b!1125380 (=> res!751990 e!640605)))

(declare-datatypes ((V!42825 0))(
  ( (V!42826 (val!14193 Int)) )
))
(declare-datatypes ((tuple2!17834 0))(
  ( (tuple2!17835 (_1!8928 (_ BitVec 64)) (_2!8928 V!42825)) )
))
(declare-datatypes ((List!24613 0))(
  ( (Nil!24610) (Cons!24609 (h!25818 tuple2!17834) (t!35348 List!24613)) )
))
(declare-datatypes ((ListLongMap!15803 0))(
  ( (ListLongMap!15804 (toList!7917 List!24613)) )
))
(declare-fun lt!499831 () ListLongMap!15803)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6454 (ListLongMap!15803 (_ BitVec 64)) Bool)

(assert (=> b!1125380 (= res!751990 (not (contains!6454 lt!499831 k!934)))))

(declare-fun zeroValue!944 () V!42825)

(declare-datatypes ((array!73409 0))(
  ( (array!73410 (arr!35357 (Array (_ BitVec 32) (_ BitVec 64))) (size!35893 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73409)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13427 0))(
  ( (ValueCellFull!13427 (v!16826 V!42825)) (EmptyCell!13427) )
))
(declare-datatypes ((array!73411 0))(
  ( (array!73412 (arr!35358 (Array (_ BitVec 32) ValueCell!13427)) (size!35894 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73411)

(declare-fun minValue!944 () V!42825)

(declare-fun getCurrentListMapNoExtraKeys!4405 (array!73409 array!73411 (_ BitVec 32) (_ BitVec 32) V!42825 V!42825 (_ BitVec 32) Int) ListLongMap!15803)

(assert (=> b!1125380 (= lt!499831 (getCurrentListMapNoExtraKeys!4405 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125381 () Bool)

(declare-fun res!751981 () Bool)

(declare-fun e!640609 () Bool)

(assert (=> b!1125381 (=> (not res!751981) (not e!640609))))

(declare-fun lt!499826 () array!73409)

(declare-datatypes ((List!24614 0))(
  ( (Nil!24611) (Cons!24610 (h!25819 (_ BitVec 64)) (t!35349 List!24614)) )
))
(declare-fun arrayNoDuplicates!0 (array!73409 (_ BitVec 32) List!24614) Bool)

(assert (=> b!1125381 (= res!751981 (arrayNoDuplicates!0 lt!499826 #b00000000000000000000000000000000 Nil!24611))))

(declare-fun b!1125382 () Bool)

(declare-fun res!751978 () Bool)

(declare-fun e!640606 () Bool)

(assert (=> b!1125382 (=> (not res!751978) (not e!640606))))

(assert (=> b!1125382 (= res!751978 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24611))))

(declare-fun res!751986 () Bool)

(assert (=> start!98042 (=> (not res!751986) (not e!640606))))

(assert (=> start!98042 (= res!751986 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35893 _keys!1208))))))

(assert (=> start!98042 e!640606))

(declare-fun tp_is_empty!28273 () Bool)

(assert (=> start!98042 tp_is_empty!28273))

(declare-fun array_inv!27142 (array!73409) Bool)

(assert (=> start!98042 (array_inv!27142 _keys!1208)))

(assert (=> start!98042 true))

(assert (=> start!98042 tp!83933))

(declare-fun e!640608 () Bool)

(declare-fun array_inv!27143 (array!73411) Bool)

(assert (=> start!98042 (and (array_inv!27143 _values!996) e!640608)))

(declare-fun b!1125383 () Bool)

(declare-fun res!751983 () Bool)

(assert (=> b!1125383 (=> (not res!751983) (not e!640606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73409 (_ BitVec 32)) Bool)

(assert (=> b!1125383 (= res!751983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125384 () Bool)

(assert (=> b!1125384 (= e!640605 true)))

(declare-fun +!3424 (ListLongMap!15803 tuple2!17834) ListLongMap!15803)

(assert (=> b!1125384 (contains!6454 (+!3424 lt!499831 (tuple2!17835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k!934)))

(declare-datatypes ((Unit!36884 0))(
  ( (Unit!36885) )
))
(declare-fun lt!499827 () Unit!36884)

(declare-fun addStillContains!686 (ListLongMap!15803 (_ BitVec 64) V!42825 (_ BitVec 64)) Unit!36884)

(assert (=> b!1125384 (= lt!499827 (addStillContains!686 lt!499831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun b!1125385 () Bool)

(declare-fun e!640604 () Bool)

(declare-fun mapRes!44227 () Bool)

(assert (=> b!1125385 (= e!640608 (and e!640604 mapRes!44227))))

(declare-fun condMapEmpty!44227 () Bool)

(declare-fun mapDefault!44227 () ValueCell!13427)

