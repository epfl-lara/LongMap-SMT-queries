; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100506 () Bool)

(assert start!100506)

(declare-fun b_free!25829 () Bool)

(declare-fun b_next!25829 () Bool)

(assert (=> start!100506 (= b_free!25829 (not b_next!25829))))

(declare-fun tp!90477 () Bool)

(declare-fun b_and!42545 () Bool)

(assert (=> start!100506 (= tp!90477 b_and!42545)))

(declare-fun b!1200699 () Bool)

(declare-fun res!799282 () Bool)

(declare-fun e!681862 () Bool)

(assert (=> b!1200699 (=> (not res!799282) (not e!681862))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200699 (= res!799282 (validKeyInArray!0 k!934))))

(declare-datatypes ((V!45837 0))(
  ( (V!45838 (val!15323 Int)) )
))
(declare-fun zeroValue!944 () V!45837)

(declare-datatypes ((array!77839 0))(
  ( (array!77840 (arr!37564 (Array (_ BitVec 32) (_ BitVec 64))) (size!38100 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77839)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19618 0))(
  ( (tuple2!19619 (_1!9820 (_ BitVec 64)) (_2!9820 V!45837)) )
))
(declare-datatypes ((List!26438 0))(
  ( (Nil!26435) (Cons!26434 (h!27643 tuple2!19618) (t!39247 List!26438)) )
))
(declare-datatypes ((ListLongMap!17587 0))(
  ( (ListLongMap!17588 (toList!8809 List!26438)) )
))
(declare-fun call!57317 () ListLongMap!17587)

(declare-datatypes ((ValueCell!14557 0))(
  ( (ValueCellFull!14557 (v!17961 V!45837)) (EmptyCell!14557) )
))
(declare-datatypes ((array!77841 0))(
  ( (array!77842 (arr!37565 (Array (_ BitVec 32) ValueCell!14557)) (size!38101 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77841)

(declare-fun bm!57313 () Bool)

(declare-fun minValue!944 () V!45837)

(declare-fun getCurrentListMapNoExtraKeys!5248 (array!77839 array!77841 (_ BitVec 32) (_ BitVec 32) V!45837 V!45837 (_ BitVec 32) Int) ListLongMap!17587)

(assert (=> bm!57313 (= call!57317 (getCurrentListMapNoExtraKeys!5248 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200701 () Bool)

(declare-fun e!681867 () Bool)

(declare-fun tp_is_empty!30533 () Bool)

(assert (=> b!1200701 (= e!681867 tp_is_empty!30533)))

(declare-fun b!1200702 () Bool)

(declare-fun e!681864 () Bool)

(declare-fun mapRes!47642 () Bool)

(assert (=> b!1200702 (= e!681864 (and e!681867 mapRes!47642))))

(declare-fun condMapEmpty!47642 () Bool)

(declare-fun mapDefault!47642 () ValueCell!14557)

