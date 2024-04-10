; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98132 () Bool)

(assert start!98132)

(declare-fun b_free!23833 () Bool)

(declare-fun b_next!23833 () Bool)

(assert (=> start!98132 (= b_free!23833 (not b_next!23833))))

(declare-fun tp!84202 () Bool)

(declare-fun b_and!38449 () Bool)

(assert (=> start!98132 (= tp!84202 b_and!38449)))

(declare-fun b!1127923 () Bool)

(declare-fun res!753764 () Bool)

(declare-fun e!641959 () Bool)

(assert (=> b!1127923 (=> (not res!753764) (not e!641959))))

(declare-datatypes ((array!73585 0))(
  ( (array!73586 (arr!35445 (Array (_ BitVec 32) (_ BitVec 64))) (size!35981 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73585)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1127923 (= res!753764 (= (select (arr!35445 _keys!1208) i!673) k!934))))

(declare-fun b!1127924 () Bool)

(declare-fun res!753755 () Bool)

(assert (=> b!1127924 (=> (not res!753755) (not e!641959))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73585 (_ BitVec 32)) Bool)

(assert (=> b!1127924 (= res!753755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!42945 0))(
  ( (V!42946 (val!14238 Int)) )
))
(declare-datatypes ((tuple2!17912 0))(
  ( (tuple2!17913 (_1!8967 (_ BitVec 64)) (_2!8967 V!42945)) )
))
(declare-datatypes ((List!24684 0))(
  ( (Nil!24681) (Cons!24680 (h!25889 tuple2!17912) (t!35509 List!24684)) )
))
(declare-datatypes ((ListLongMap!15881 0))(
  ( (ListLongMap!15882 (toList!7956 List!24684)) )
))
(declare-fun call!47782 () ListLongMap!15881)

(declare-fun b!1127925 () Bool)

(declare-fun call!47781 () ListLongMap!15881)

(declare-fun e!641960 () Bool)

(declare-fun -!1144 (ListLongMap!15881 (_ BitVec 64)) ListLongMap!15881)

(assert (=> b!1127925 (= e!641960 (= call!47782 (-!1144 call!47781 k!934)))))

(declare-fun res!753760 () Bool)

(assert (=> start!98132 (=> (not res!753760) (not e!641959))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98132 (= res!753760 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35981 _keys!1208))))))

(assert (=> start!98132 e!641959))

(declare-fun tp_is_empty!28363 () Bool)

(assert (=> start!98132 tp_is_empty!28363))

(declare-fun array_inv!27198 (array!73585) Bool)

(assert (=> start!98132 (array_inv!27198 _keys!1208)))

(assert (=> start!98132 true))

(assert (=> start!98132 tp!84202))

(declare-datatypes ((ValueCell!13472 0))(
  ( (ValueCellFull!13472 (v!16871 V!42945)) (EmptyCell!13472) )
))
(declare-datatypes ((array!73587 0))(
  ( (array!73588 (arr!35446 (Array (_ BitVec 32) ValueCell!13472)) (size!35982 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73587)

(declare-fun e!641965 () Bool)

(declare-fun array_inv!27199 (array!73587) Bool)

(assert (=> start!98132 (and (array_inv!27199 _values!996) e!641965)))

(declare-fun b!1127926 () Bool)

(declare-fun e!641966 () Bool)

(declare-fun mapRes!44362 () Bool)

(assert (=> b!1127926 (= e!641965 (and e!641966 mapRes!44362))))

(declare-fun condMapEmpty!44362 () Bool)

(declare-fun mapDefault!44362 () ValueCell!13472)

