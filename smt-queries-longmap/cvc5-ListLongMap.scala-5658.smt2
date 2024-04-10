; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73732 () Bool)

(assert start!73732)

(declare-fun b_free!14647 () Bool)

(declare-fun b_next!14647 () Bool)

(assert (=> start!73732 (= b_free!14647 (not b_next!14647))))

(declare-fun tp!51444 () Bool)

(declare-fun b_and!24273 () Bool)

(assert (=> start!73732 (= tp!51444 b_and!24273)))

(declare-fun mapNonEmpty!26774 () Bool)

(declare-fun mapRes!26774 () Bool)

(declare-fun tp!51445 () Bool)

(declare-fun e!481567 () Bool)

(assert (=> mapNonEmpty!26774 (= mapRes!26774 (and tp!51445 e!481567))))

(declare-datatypes ((V!27425 0))(
  ( (V!27426 (val!8439 Int)) )
))
(declare-datatypes ((ValueCell!7952 0))(
  ( (ValueCellFull!7952 (v!10864 V!27425)) (EmptyCell!7952) )
))
(declare-fun mapRest!26774 () (Array (_ BitVec 32) ValueCell!7952))

(declare-fun mapValue!26774 () ValueCell!7952)

(declare-fun mapKey!26774 () (_ BitVec 32))

(declare-datatypes ((array!49726 0))(
  ( (array!49727 (arr!23894 (Array (_ BitVec 32) ValueCell!7952)) (size!24334 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49726)

(assert (=> mapNonEmpty!26774 (= (arr!23894 _values!688) (store mapRest!26774 mapKey!26774 mapValue!26774))))

(declare-fun mapIsEmpty!26774 () Bool)

(assert (=> mapIsEmpty!26774 mapRes!26774))

(declare-fun b!864425 () Bool)

(declare-fun res!587378 () Bool)

(declare-fun e!481561 () Bool)

(assert (=> b!864425 (=> (not res!587378) (not e!481561))))

(declare-datatypes ((array!49728 0))(
  ( (array!49729 (arr!23895 (Array (_ BitVec 32) (_ BitVec 64))) (size!24335 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49728)

(declare-datatypes ((List!16980 0))(
  ( (Nil!16977) (Cons!16976 (h!18107 (_ BitVec 64)) (t!23893 List!16980)) )
))
(declare-fun arrayNoDuplicates!0 (array!49728 (_ BitVec 32) List!16980) Bool)

(assert (=> b!864425 (= res!587378 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16977))))

(declare-fun b!864426 () Bool)

(declare-fun res!587375 () Bool)

(assert (=> b!864426 (=> (not res!587375) (not e!481561))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!864426 (= res!587375 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24335 _keys!868))))))

(declare-fun res!587384 () Bool)

(assert (=> start!73732 (=> (not res!587384) (not e!481561))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73732 (= res!587384 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24335 _keys!868))))))

(assert (=> start!73732 e!481561))

(declare-fun tp_is_empty!16783 () Bool)

(assert (=> start!73732 tp_is_empty!16783))

(assert (=> start!73732 true))

(assert (=> start!73732 tp!51444))

(declare-fun array_inv!18896 (array!49728) Bool)

(assert (=> start!73732 (array_inv!18896 _keys!868)))

(declare-fun e!481560 () Bool)

(declare-fun array_inv!18897 (array!49726) Bool)

(assert (=> start!73732 (and (array_inv!18897 _values!688) e!481560)))

(declare-fun b!864427 () Bool)

(declare-datatypes ((Unit!29571 0))(
  ( (Unit!29572) )
))
(declare-fun e!481563 () Unit!29571)

(declare-fun Unit!29573 () Unit!29571)

(assert (=> b!864427 (= e!481563 Unit!29573)))

(declare-fun b!864428 () Bool)

(declare-fun Unit!29574 () Unit!29571)

(assert (=> b!864428 (= e!481563 Unit!29574)))

(declare-fun lt!391188 () Unit!29571)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49728 (_ BitVec 32) (_ BitVec 32)) Unit!29571)

(assert (=> b!864428 (= lt!391188 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!864428 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16977)))

(declare-fun lt!391191 () Unit!29571)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49728 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29571)

(assert (=> b!864428 (= lt!391191 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864428 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391187 () Unit!29571)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49728 (_ BitVec 64) (_ BitVec 32) List!16980) Unit!29571)

(assert (=> b!864428 (= lt!391187 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16977))))

(assert (=> b!864428 false))

(declare-fun b!864429 () Bool)

(assert (=> b!864429 (= e!481567 tp_is_empty!16783)))

(declare-fun b!864430 () Bool)

(declare-fun res!587381 () Bool)

(assert (=> b!864430 (=> (not res!587381) (not e!481561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864430 (= res!587381 (validKeyInArray!0 k!854))))

(declare-fun b!864431 () Bool)

(declare-fun e!481559 () Bool)

(assert (=> b!864431 (= e!481560 (and e!481559 mapRes!26774))))

(declare-fun condMapEmpty!26774 () Bool)

(declare-fun mapDefault!26774 () ValueCell!7952)

