; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73844 () Bool)

(assert start!73844)

(declare-fun b_free!14759 () Bool)

(declare-fun b_next!14759 () Bool)

(assert (=> start!73844 (= b_free!14759 (not b_next!14759))))

(declare-fun tp!51781 () Bool)

(declare-fun b_and!24497 () Bool)

(assert (=> start!73844 (= tp!51781 b_and!24497)))

(declare-fun b!867225 () Bool)

(declare-datatypes ((Unit!29743 0))(
  ( (Unit!29744) )
))
(declare-fun e!483077 () Unit!29743)

(declare-fun Unit!29745 () Unit!29743)

(assert (=> b!867225 (= e!483077 Unit!29745)))

(declare-fun lt!393880 () Unit!29743)

(declare-datatypes ((array!49950 0))(
  ( (array!49951 (arr!24006 (Array (_ BitVec 32) (_ BitVec 64))) (size!24446 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49950)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49950 (_ BitVec 32) (_ BitVec 32)) Unit!29743)

(assert (=> b!867225 (= lt!393880 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17068 0))(
  ( (Nil!17065) (Cons!17064 (h!18195 (_ BitVec 64)) (t!24093 List!17068)) )
))
(declare-fun arrayNoDuplicates!0 (array!49950 (_ BitVec 32) List!17068) Bool)

(assert (=> b!867225 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17065)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!393871 () Unit!29743)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49950 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29743)

(assert (=> b!867225 (= lt!393871 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867225 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393867 () Unit!29743)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49950 (_ BitVec 64) (_ BitVec 32) List!17068) Unit!29743)

(assert (=> b!867225 (= lt!393867 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17065))))

(assert (=> b!867225 false))

(declare-fun b!867226 () Bool)

(declare-fun res!589223 () Bool)

(declare-fun e!483079 () Bool)

(assert (=> b!867226 (=> (not res!589223) (not e!483079))))

(assert (=> b!867226 (= res!589223 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17065))))

(declare-fun b!867227 () Bool)

(declare-fun e!483072 () Bool)

(declare-fun tp_is_empty!16895 () Bool)

(assert (=> b!867227 (= e!483072 tp_is_empty!16895)))

(declare-fun b!867228 () Bool)

(declare-fun e!483075 () Bool)

(declare-fun mapRes!26942 () Bool)

(assert (=> b!867228 (= e!483075 (and e!483072 mapRes!26942))))

(declare-fun condMapEmpty!26942 () Bool)

(declare-datatypes ((V!27573 0))(
  ( (V!27574 (val!8495 Int)) )
))
(declare-datatypes ((ValueCell!8008 0))(
  ( (ValueCellFull!8008 (v!10920 V!27573)) (EmptyCell!8008) )
))
(declare-datatypes ((array!49952 0))(
  ( (array!49953 (arr!24007 (Array (_ BitVec 32) ValueCell!8008)) (size!24447 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49952)

(declare-fun mapDefault!26942 () ValueCell!8008)

