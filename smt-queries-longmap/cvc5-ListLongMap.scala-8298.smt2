; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101098 () Bool)

(assert start!101098)

(declare-fun b_free!26059 () Bool)

(declare-fun b_next!26059 () Bool)

(assert (=> start!101098 (= b_free!26059 (not b_next!26059))))

(declare-fun tp!91196 () Bool)

(declare-fun b_and!43217 () Bool)

(assert (=> start!101098 (= tp!91196 b_and!43217)))

(declare-fun b!1212564 () Bool)

(declare-fun res!805330 () Bool)

(declare-fun e!688620 () Bool)

(assert (=> b!1212564 (=> (not res!805330) (not e!688620))))

(declare-datatypes ((array!78311 0))(
  ( (array!78312 (arr!37791 (Array (_ BitVec 32) (_ BitVec 64))) (size!38327 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78311)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46145 0))(
  ( (V!46146 (val!15438 Int)) )
))
(declare-datatypes ((ValueCell!14672 0))(
  ( (ValueCellFull!14672 (v!18090 V!46145)) (EmptyCell!14672) )
))
(declare-datatypes ((array!78313 0))(
  ( (array!78314 (arr!37792 (Array (_ BitVec 32) ValueCell!14672)) (size!38328 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78313)

(assert (=> b!1212564 (= res!805330 (and (= (size!38328 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38327 _keys!1208) (size!38328 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1212565 () Bool)

(declare-fun res!805323 () Bool)

(assert (=> b!1212565 (=> (not res!805323) (not e!688620))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1212565 (= res!805323 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38327 _keys!1208))))))

(declare-fun bm!60167 () Bool)

(declare-datatypes ((tuple2!19838 0))(
  ( (tuple2!19839 (_1!9930 (_ BitVec 64)) (_2!9930 V!46145)) )
))
(declare-datatypes ((List!26639 0))(
  ( (Nil!26636) (Cons!26635 (h!27844 tuple2!19838) (t!39678 List!26639)) )
))
(declare-datatypes ((ListLongMap!17807 0))(
  ( (ListLongMap!17808 (toList!8919 List!26639)) )
))
(declare-fun call!60175 () ListLongMap!17807)

(declare-fun call!60174 () ListLongMap!17807)

(assert (=> bm!60167 (= call!60175 call!60174)))

(declare-fun bm!60168 () Bool)

(declare-datatypes ((Unit!40215 0))(
  ( (Unit!40216) )
))
(declare-fun call!60176 () Unit!40215)

(declare-fun call!60173 () Unit!40215)

(assert (=> bm!60168 (= call!60176 call!60173)))

(declare-fun b!1212566 () Bool)

(declare-fun e!688627 () Bool)

(declare-fun e!688630 () Bool)

(declare-fun mapRes!48016 () Bool)

(assert (=> b!1212566 (= e!688627 (and e!688630 mapRes!48016))))

(declare-fun condMapEmpty!48016 () Bool)

(declare-fun mapDefault!48016 () ValueCell!14672)

