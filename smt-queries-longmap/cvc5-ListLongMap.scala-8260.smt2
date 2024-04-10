; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100508 () Bool)

(assert start!100508)

(declare-fun b_free!25831 () Bool)

(declare-fun b_next!25831 () Bool)

(assert (=> start!100508 (= b_free!25831 (not b_next!25831))))

(declare-fun tp!90483 () Bool)

(declare-fun b_and!42549 () Bool)

(assert (=> start!100508 (= tp!90483 b_and!42549)))

(declare-fun mapNonEmpty!47645 () Bool)

(declare-fun mapRes!47645 () Bool)

(declare-fun tp!90482 () Bool)

(declare-fun e!681897 () Bool)

(assert (=> mapNonEmpty!47645 (= mapRes!47645 (and tp!90482 e!681897))))

(declare-datatypes ((V!45841 0))(
  ( (V!45842 (val!15324 Int)) )
))
(declare-datatypes ((ValueCell!14558 0))(
  ( (ValueCellFull!14558 (v!17962 V!45841)) (EmptyCell!14558) )
))
(declare-fun mapValue!47645 () ValueCell!14558)

(declare-fun mapRest!47645 () (Array (_ BitVec 32) ValueCell!14558))

(declare-datatypes ((array!77843 0))(
  ( (array!77844 (arr!37566 (Array (_ BitVec 32) ValueCell!14558)) (size!38102 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77843)

(declare-fun mapKey!47645 () (_ BitVec 32))

(assert (=> mapNonEmpty!47645 (= (arr!37566 _values!996) (store mapRest!47645 mapKey!47645 mapValue!47645))))

(declare-fun zeroValue!944 () V!45841)

(declare-datatypes ((tuple2!19620 0))(
  ( (tuple2!19621 (_1!9821 (_ BitVec 64)) (_2!9821 V!45841)) )
))
(declare-datatypes ((List!26439 0))(
  ( (Nil!26436) (Cons!26435 (h!27644 tuple2!19620) (t!39250 List!26439)) )
))
(declare-datatypes ((ListLongMap!17589 0))(
  ( (ListLongMap!17590 (toList!8810 List!26439)) )
))
(declare-fun call!57323 () ListLongMap!17589)

(declare-datatypes ((array!77845 0))(
  ( (array!77846 (arr!37567 (Array (_ BitVec 32) (_ BitVec 64))) (size!38103 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77845)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!57319 () Bool)

(declare-fun minValue!944 () V!45841)

(declare-fun getCurrentListMapNoExtraKeys!5249 (array!77845 array!77843 (_ BitVec 32) (_ BitVec 32) V!45841 V!45841 (_ BitVec 32) Int) ListLongMap!17589)

(assert (=> bm!57319 (= call!57323 (getCurrentListMapNoExtraKeys!5249 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200759 () Bool)

(declare-fun e!681900 () Bool)

(declare-fun e!681896 () Bool)

(assert (=> b!1200759 (= e!681900 (and e!681896 mapRes!47645))))

(declare-fun condMapEmpty!47645 () Bool)

(declare-fun mapDefault!47645 () ValueCell!14558)

