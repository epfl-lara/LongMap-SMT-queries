; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98150 () Bool)

(assert start!98150)

(declare-fun b_free!23851 () Bool)

(declare-fun b_next!23851 () Bool)

(assert (=> start!98150 (= b_free!23851 (not b_next!23851))))

(declare-fun tp!84256 () Bool)

(declare-fun b_and!38485 () Bool)

(assert (=> start!98150 (= tp!84256 b_and!38485)))

(declare-fun mapIsEmpty!44389 () Bool)

(declare-fun mapRes!44389 () Bool)

(assert (=> mapIsEmpty!44389 mapRes!44389))

(declare-fun b!1128427 () Bool)

(declare-fun e!642230 () Bool)

(assert (=> b!1128427 (= e!642230 true)))

(declare-datatypes ((V!42969 0))(
  ( (V!42970 (val!14247 Int)) )
))
(declare-fun zeroValue!944 () V!42969)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!500959 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13481 0))(
  ( (ValueCellFull!13481 (v!16880 V!42969)) (EmptyCell!13481) )
))
(declare-datatypes ((array!73621 0))(
  ( (array!73622 (arr!35463 (Array (_ BitVec 32) ValueCell!13481)) (size!35999 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73621)

(declare-fun minValue!944 () V!42969)

(declare-datatypes ((array!73623 0))(
  ( (array!73624 (arr!35464 (Array (_ BitVec 32) (_ BitVec 64))) (size!36000 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73623)

(declare-datatypes ((tuple2!17930 0))(
  ( (tuple2!17931 (_1!8976 (_ BitVec 64)) (_2!8976 V!42969)) )
))
(declare-datatypes ((List!24699 0))(
  ( (Nil!24696) (Cons!24695 (h!25904 tuple2!17930) (t!35542 List!24699)) )
))
(declare-datatypes ((ListLongMap!15899 0))(
  ( (ListLongMap!15900 (toList!7965 List!24699)) )
))
(declare-fun contains!6490 (ListLongMap!15899 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4452 (array!73623 array!73621 (_ BitVec 32) (_ BitVec 32) V!42969 V!42969 (_ BitVec 32) Int) ListLongMap!15899)

(assert (=> b!1128427 (= lt!500959 (contains!6490 (getCurrentListMapNoExtraKeys!4452 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun mapNonEmpty!44389 () Bool)

(declare-fun tp!84257 () Bool)

(declare-fun e!642231 () Bool)

(assert (=> mapNonEmpty!44389 (= mapRes!44389 (and tp!84257 e!642231))))

(declare-fun mapKey!44389 () (_ BitVec 32))

(declare-fun mapValue!44389 () ValueCell!13481)

(declare-fun mapRest!44389 () (Array (_ BitVec 32) ValueCell!13481))

(assert (=> mapNonEmpty!44389 (= (arr!35463 _values!996) (store mapRest!44389 mapKey!44389 mapValue!44389))))

(declare-fun b!1128428 () Bool)

(declare-fun tp_is_empty!28381 () Bool)

(assert (=> b!1128428 (= e!642231 tp_is_empty!28381)))

(declare-fun b!1128429 () Bool)

(declare-fun e!642236 () Bool)

(declare-fun e!642233 () Bool)

(assert (=> b!1128429 (= e!642236 (and e!642233 mapRes!44389))))

(declare-fun condMapEmpty!44389 () Bool)

(declare-fun mapDefault!44389 () ValueCell!13481)

