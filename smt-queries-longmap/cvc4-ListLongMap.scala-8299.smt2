; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101146 () Bool)

(assert start!101146)

(declare-fun b_free!26069 () Bool)

(declare-fun b_next!26069 () Bool)

(assert (=> start!101146 (= b_free!26069 (not b_next!26069))))

(declare-fun tp!91228 () Bool)

(declare-fun b_and!43255 () Bool)

(assert (=> start!101146 (= tp!91228 b_and!43255)))

(declare-fun e!688987 () Bool)

(declare-fun b!1213200 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((V!46157 0))(
  ( (V!46158 (val!15443 Int)) )
))
(declare-datatypes ((tuple2!19848 0))(
  ( (tuple2!19849 (_1!9935 (_ BitVec 64)) (_2!9935 V!46157)) )
))
(declare-datatypes ((List!26648 0))(
  ( (Nil!26645) (Cons!26644 (h!27853 tuple2!19848) (t!39697 List!26648)) )
))
(declare-datatypes ((ListLongMap!17817 0))(
  ( (ListLongMap!17818 (toList!8924 List!26648)) )
))
(declare-fun call!60314 () ListLongMap!17817)

(declare-fun call!60315 () ListLongMap!17817)

(declare-fun -!1870 (ListLongMap!17817 (_ BitVec 64)) ListLongMap!17817)

(assert (=> b!1213200 (= e!688987 (= call!60314 (-!1870 call!60315 k!934)))))

(declare-fun b!1213201 () Bool)

(declare-fun res!805621 () Bool)

(declare-fun e!688999 () Bool)

(assert (=> b!1213201 (=> (not res!805621) (not e!688999))))

(declare-datatypes ((array!78333 0))(
  ( (array!78334 (arr!37801 (Array (_ BitVec 32) (_ BitVec 64))) (size!38337 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78333)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78333 (_ BitVec 32)) Bool)

(assert (=> b!1213201 (= res!805621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1213202 () Bool)

(declare-fun e!688995 () Bool)

(declare-fun e!688998 () Bool)

(declare-fun mapRes!48034 () Bool)

(assert (=> b!1213202 (= e!688995 (and e!688998 mapRes!48034))))

(declare-fun condMapEmpty!48034 () Bool)

(declare-datatypes ((ValueCell!14677 0))(
  ( (ValueCellFull!14677 (v!18096 V!46157)) (EmptyCell!14677) )
))
(declare-datatypes ((array!78335 0))(
  ( (array!78336 (arr!37802 (Array (_ BitVec 32) ValueCell!14677)) (size!38338 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78335)

(declare-fun mapDefault!48034 () ValueCell!14677)

