; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72854 () Bool)

(assert start!72854)

(declare-fun b_free!13769 () Bool)

(declare-fun b_next!13769 () Bool)

(assert (=> start!72854 (= b_free!13769 (not b_next!13769))))

(declare-fun tp!48811 () Bool)

(declare-fun b_and!22855 () Bool)

(assert (=> start!72854 (= tp!48811 b_and!22855)))

(declare-fun res!574441 () Bool)

(declare-fun e!472026 () Bool)

(assert (=> start!72854 (=> (not res!574441) (not e!472026))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48030 0))(
  ( (array!48031 (arr!23046 (Array (_ BitVec 32) (_ BitVec 64))) (size!23486 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48030)

(assert (=> start!72854 (= res!574441 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23486 _keys!868))))))

(assert (=> start!72854 e!472026))

(assert (=> start!72854 true))

(assert (=> start!72854 tp!48811))

(declare-fun array_inv!18314 (array!48030) Bool)

(assert (=> start!72854 (array_inv!18314 _keys!868)))

(declare-datatypes ((V!26253 0))(
  ( (V!26254 (val!8000 Int)) )
))
(declare-datatypes ((ValueCell!7513 0))(
  ( (ValueCellFull!7513 (v!10425 V!26253)) (EmptyCell!7513) )
))
(declare-datatypes ((array!48032 0))(
  ( (array!48033 (arr!23047 (Array (_ BitVec 32) ValueCell!7513)) (size!23487 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48032)

(declare-fun e!472025 () Bool)

(declare-fun array_inv!18315 (array!48032) Bool)

(assert (=> start!72854 (and (array_inv!18315 _values!688) e!472025)))

(declare-fun tp_is_empty!15905 () Bool)

(assert (=> start!72854 tp_is_empty!15905))

(declare-fun b!845572 () Bool)

(assert (=> b!845572 (= e!472026 false)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10446 0))(
  ( (tuple2!10447 (_1!5234 (_ BitVec 64)) (_2!5234 V!26253)) )
))
(declare-datatypes ((List!16309 0))(
  ( (Nil!16306) (Cons!16305 (h!17436 tuple2!10446) (t!22680 List!16309)) )
))
(declare-datatypes ((ListLongMap!9215 0))(
  ( (ListLongMap!9216 (toList!4623 List!16309)) )
))
(declare-fun lt!381424 () ListLongMap!9215)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26253)

(declare-fun zeroValue!654 () V!26253)

(declare-fun getCurrentListMapNoExtraKeys!2608 (array!48030 array!48032 (_ BitVec 32) (_ BitVec 32) V!26253 V!26253 (_ BitVec 32) Int) ListLongMap!9215)

(assert (=> b!845572 (= lt!381424 (getCurrentListMapNoExtraKeys!2608 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845573 () Bool)

(declare-fun e!472023 () Bool)

(declare-fun mapRes!25457 () Bool)

(assert (=> b!845573 (= e!472025 (and e!472023 mapRes!25457))))

(declare-fun condMapEmpty!25457 () Bool)

(declare-fun mapDefault!25457 () ValueCell!7513)

