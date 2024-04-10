; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73196 () Bool)

(assert start!73196)

(declare-fun b_free!14111 () Bool)

(declare-fun b_next!14111 () Bool)

(assert (=> start!73196 (= b_free!14111 (not b_next!14111))))

(declare-fun tp!49837 () Bool)

(declare-fun b_and!23381 () Bool)

(assert (=> start!73196 (= tp!49837 b_and!23381)))

(declare-fun b!852763 () Bool)

(declare-fun res!579190 () Bool)

(declare-fun e!475597 () Bool)

(assert (=> b!852763 (=> (not res!579190) (not e!475597))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852763 (= res!579190 (validMask!0 mask!1196))))

(declare-fun b!852764 () Bool)

(declare-fun e!475594 () Bool)

(declare-fun tp_is_empty!16247 () Bool)

(assert (=> b!852764 (= e!475594 tp_is_empty!16247)))

(declare-fun bm!38185 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26709 0))(
  ( (V!26710 (val!8171 Int)) )
))
(declare-datatypes ((tuple2!10734 0))(
  ( (tuple2!10735 (_1!5378 (_ BitVec 64)) (_2!5378 V!26709)) )
))
(declare-datatypes ((List!16565 0))(
  ( (Nil!16562) (Cons!16561 (h!17692 tuple2!10734) (t!23122 List!16565)) )
))
(declare-datatypes ((ListLongMap!9503 0))(
  ( (ListLongMap!9504 (toList!4767 List!16565)) )
))
(declare-fun call!38189 () ListLongMap!9503)

(declare-datatypes ((array!48692 0))(
  ( (array!48693 (arr!23377 (Array (_ BitVec 32) (_ BitVec 64))) (size!23817 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48692)

(declare-datatypes ((ValueCell!7684 0))(
  ( (ValueCellFull!7684 (v!10596 V!26709)) (EmptyCell!7684) )
))
(declare-datatypes ((array!48694 0))(
  ( (array!48695 (arr!23378 (Array (_ BitVec 32) ValueCell!7684)) (size!23818 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48694)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26709)

(declare-fun zeroValue!654 () V!26709)

(declare-fun getCurrentListMapNoExtraKeys!2748 (array!48692 array!48694 (_ BitVec 32) (_ BitVec 32) V!26709 V!26709 (_ BitVec 32) Int) ListLongMap!9503)

(assert (=> bm!38185 (= call!38189 (getCurrentListMapNoExtraKeys!2748 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852765 () Bool)

(declare-fun e!475593 () Bool)

(declare-fun mapRes!25970 () Bool)

(assert (=> b!852765 (= e!475593 (and e!475594 mapRes!25970))))

(declare-fun condMapEmpty!25970 () Bool)

(declare-fun mapDefault!25970 () ValueCell!7684)

