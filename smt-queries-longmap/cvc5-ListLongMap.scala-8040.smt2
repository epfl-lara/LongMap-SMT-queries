; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99080 () Bool)

(assert start!99080)

(declare-fun b_free!24685 () Bool)

(declare-fun b_next!24685 () Bool)

(assert (=> start!99080 (= b_free!24685 (not b_next!24685))))

(declare-fun tp!86765 () Bool)

(declare-fun b_and!40219 () Bool)

(assert (=> start!99080 (= tp!86765 b_and!40219)))

(declare-fun b!1165194 () Bool)

(declare-fun res!772757 () Bool)

(declare-fun e!662423 () Bool)

(assert (=> b!1165194 (=> (not res!772757) (not e!662423))))

(declare-datatypes ((array!75261 0))(
  ( (array!75262 (arr!36281 (Array (_ BitVec 32) (_ BitVec 64))) (size!36817 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75261)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44081 0))(
  ( (V!44082 (val!14664 Int)) )
))
(declare-datatypes ((ValueCell!13898 0))(
  ( (ValueCellFull!13898 (v!17301 V!44081)) (EmptyCell!13898) )
))
(declare-datatypes ((array!75263 0))(
  ( (array!75264 (arr!36282 (Array (_ BitVec 32) ValueCell!13898)) (size!36818 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75263)

(assert (=> b!1165194 (= res!772757 (and (= (size!36818 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36817 _keys!1208) (size!36818 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165195 () Bool)

(declare-fun e!662424 () Bool)

(declare-fun tp_is_empty!29215 () Bool)

(assert (=> b!1165195 (= e!662424 tp_is_empty!29215)))

(declare-fun b!1165196 () Bool)

(declare-fun res!772749 () Bool)

(declare-fun e!662422 () Bool)

(assert (=> b!1165196 (=> (not res!772749) (not e!662422))))

(declare-fun lt!524844 () array!75261)

(declare-datatypes ((List!25436 0))(
  ( (Nil!25433) (Cons!25432 (h!26641 (_ BitVec 64)) (t!37113 List!25436)) )
))
(declare-fun arrayNoDuplicates!0 (array!75261 (_ BitVec 32) List!25436) Bool)

(assert (=> b!1165196 (= res!772749 (arrayNoDuplicates!0 lt!524844 #b00000000000000000000000000000000 Nil!25433))))

(declare-fun b!1165197 () Bool)

(assert (=> b!1165197 (= e!662423 e!662422)))

(declare-fun res!772748 () Bool)

(assert (=> b!1165197 (=> (not res!772748) (not e!662422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75261 (_ BitVec 32)) Bool)

(assert (=> b!1165197 (= res!772748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524844 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165197 (= lt!524844 (array!75262 (store (arr!36281 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36817 _keys!1208)))))

(declare-fun b!1165198 () Bool)

(declare-fun e!662427 () Bool)

(assert (=> b!1165198 (= e!662427 tp_is_empty!29215)))

(declare-fun b!1165199 () Bool)

(declare-fun res!772750 () Bool)

(assert (=> b!1165199 (=> (not res!772750) (not e!662423))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165199 (= res!772750 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!45647 () Bool)

(declare-fun mapRes!45647 () Bool)

(assert (=> mapIsEmpty!45647 mapRes!45647))

(declare-fun b!1165200 () Bool)

(declare-fun e!662425 () Bool)

(assert (=> b!1165200 (= e!662425 (and e!662424 mapRes!45647))))

(declare-fun condMapEmpty!45647 () Bool)

(declare-fun mapDefault!45647 () ValueCell!13898)

