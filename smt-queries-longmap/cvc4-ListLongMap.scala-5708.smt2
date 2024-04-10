; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74036 () Bool)

(assert start!74036)

(declare-fun b_free!14951 () Bool)

(declare-fun b_next!14951 () Bool)

(assert (=> start!74036 (= b_free!14951 (not b_next!14951))))

(declare-fun tp!52357 () Bool)

(declare-fun b_and!24703 () Bool)

(assert (=> start!74036 (= tp!52357 b_and!24703)))

(declare-fun b!870771 () Bool)

(declare-fun res!591855 () Bool)

(declare-fun e!484860 () Bool)

(assert (=> b!870771 (=> (not res!591855) (not e!484860))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870771 (= res!591855 (validMask!0 mask!1196))))

(declare-fun res!591859 () Bool)

(assert (=> start!74036 (=> (not res!591859) (not e!484860))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50318 0))(
  ( (array!50319 (arr!24190 (Array (_ BitVec 32) (_ BitVec 64))) (size!24630 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50318)

(assert (=> start!74036 (= res!591859 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24630 _keys!868))))))

(assert (=> start!74036 e!484860))

(declare-fun tp_is_empty!17087 () Bool)

(assert (=> start!74036 tp_is_empty!17087))

(assert (=> start!74036 true))

(assert (=> start!74036 tp!52357))

(declare-fun array_inv!19102 (array!50318) Bool)

(assert (=> start!74036 (array_inv!19102 _keys!868)))

(declare-datatypes ((V!27829 0))(
  ( (V!27830 (val!8591 Int)) )
))
(declare-datatypes ((ValueCell!8104 0))(
  ( (ValueCellFull!8104 (v!11016 V!27829)) (EmptyCell!8104) )
))
(declare-datatypes ((array!50320 0))(
  ( (array!50321 (arr!24191 (Array (_ BitVec 32) ValueCell!8104)) (size!24631 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50320)

(declare-fun e!484858 () Bool)

(declare-fun array_inv!19103 (array!50320) Bool)

(assert (=> start!74036 (and (array_inv!19103 _values!688) e!484858)))

(declare-fun b!870772 () Bool)

(declare-fun e!484856 () Bool)

(declare-fun mapRes!27230 () Bool)

(assert (=> b!870772 (= e!484858 (and e!484856 mapRes!27230))))

(declare-fun condMapEmpty!27230 () Bool)

(declare-fun mapDefault!27230 () ValueCell!8104)

