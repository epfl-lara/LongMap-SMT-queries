; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73060 () Bool)

(assert start!73060)

(declare-fun b_free!13975 () Bool)

(declare-fun b_next!13975 () Bool)

(assert (=> start!73060 (= b_free!13975 (not b_next!13975))))

(declare-fun tp!49428 () Bool)

(declare-fun b_and!23109 () Bool)

(assert (=> start!73060 (= tp!49428 b_and!23109)))

(declare-fun b!849567 () Bool)

(declare-fun e!473968 () Bool)

(declare-fun tp_is_empty!16111 () Bool)

(assert (=> b!849567 (= e!473968 tp_is_empty!16111)))

(declare-fun b!849568 () Bool)

(declare-fun res!577155 () Bool)

(declare-fun e!473962 () Bool)

(assert (=> b!849568 (=> (not res!577155) (not e!473962))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849568 (= res!577155 (validMask!0 mask!1196))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26529 0))(
  ( (V!26530 (val!8103 Int)) )
))
(declare-datatypes ((tuple2!10612 0))(
  ( (tuple2!10613 (_1!5317 (_ BitVec 64)) (_2!5317 V!26529)) )
))
(declare-datatypes ((List!16460 0))(
  ( (Nil!16457) (Cons!16456 (h!17587 tuple2!10612) (t!22881 List!16460)) )
))
(declare-datatypes ((ListLongMap!9381 0))(
  ( (ListLongMap!9382 (toList!4706 List!16460)) )
))
(declare-fun call!37780 () ListLongMap!9381)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48428 0))(
  ( (array!48429 (arr!23245 (Array (_ BitVec 32) (_ BitVec 64))) (size!23685 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48428)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26529)

(declare-fun zeroValue!654 () V!26529)

(declare-fun bm!37777 () Bool)

(declare-datatypes ((ValueCell!7616 0))(
  ( (ValueCellFull!7616 (v!10528 V!26529)) (EmptyCell!7616) )
))
(declare-datatypes ((array!48430 0))(
  ( (array!48431 (arr!23246 (Array (_ BitVec 32) ValueCell!7616)) (size!23686 (_ BitVec 32))) )
))
(declare-fun lt!382308 () array!48430)

(declare-fun getCurrentListMapNoExtraKeys!2688 (array!48428 array!48430 (_ BitVec 32) (_ BitVec 32) V!26529 V!26529 (_ BitVec 32) Int) ListLongMap!9381)

(assert (=> bm!37777 (= call!37780 (getCurrentListMapNoExtraKeys!2688 _keys!868 lt!382308 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849570 () Bool)

(declare-fun e!473964 () Bool)

(declare-fun e!473963 () Bool)

(declare-fun mapRes!25766 () Bool)

(assert (=> b!849570 (= e!473964 (and e!473963 mapRes!25766))))

(declare-fun condMapEmpty!25766 () Bool)

(declare-fun _values!688 () array!48430)

(declare-fun mapDefault!25766 () ValueCell!7616)

