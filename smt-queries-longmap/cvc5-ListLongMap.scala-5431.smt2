; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72370 () Bool)

(assert start!72370)

(declare-fun b_free!13555 () Bool)

(declare-fun b_next!13555 () Bool)

(assert (=> start!72370 (= b_free!13555 (not b_next!13555))))

(declare-fun tp!47764 () Bool)

(declare-fun b_and!22641 () Bool)

(assert (=> start!72370 (= tp!47764 b_and!22641)))

(declare-fun b!838634 () Bool)

(declare-fun res!570252 () Bool)

(declare-fun e!468107 () Bool)

(assert (=> b!838634 (=> (not res!570252) (not e!468107))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47128 0))(
  ( (array!47129 (arr!22595 (Array (_ BitVec 32) (_ BitVec 64))) (size!23035 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47128)

(declare-datatypes ((V!25609 0))(
  ( (V!25610 (val!7758 Int)) )
))
(declare-datatypes ((ValueCell!7271 0))(
  ( (ValueCellFull!7271 (v!10183 V!25609)) (EmptyCell!7271) )
))
(declare-datatypes ((array!47130 0))(
  ( (array!47131 (arr!22596 (Array (_ BitVec 32) ValueCell!7271)) (size!23036 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47130)

(assert (=> b!838634 (= res!570252 (and (= (size!23036 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23035 _keys!868) (size!23036 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838635 () Bool)

(declare-fun res!570256 () Bool)

(assert (=> b!838635 (=> (not res!570256) (not e!468107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47128 (_ BitVec 32)) Bool)

(assert (=> b!838635 (= res!570256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-datatypes ((tuple2!10262 0))(
  ( (tuple2!10263 (_1!5142 (_ BitVec 64)) (_2!5142 V!25609)) )
))
(declare-datatypes ((List!16065 0))(
  ( (Nil!16062) (Cons!16061 (h!17192 tuple2!10262) (t!22436 List!16065)) )
))
(declare-datatypes ((ListLongMap!9031 0))(
  ( (ListLongMap!9032 (toList!4531 List!16065)) )
))
(declare-fun call!36899 () ListLongMap!9031)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!36895 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25609)

(declare-fun zeroValue!654 () V!25609)

(declare-fun getCurrentListMapNoExtraKeys!2523 (array!47128 array!47130 (_ BitVec 32) (_ BitVec 32) V!25609 V!25609 (_ BitVec 32) Int) ListLongMap!9031)

(assert (=> bm!36895 (= call!36899 (getCurrentListMapNoExtraKeys!2523 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838636 () Bool)

(declare-fun res!570257 () Bool)

(assert (=> b!838636 (=> (not res!570257) (not e!468107))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!838636 (= res!570257 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23035 _keys!868))))))

(declare-fun e!468109 () Bool)

(declare-fun v!557 () V!25609)

(declare-fun b!838637 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun call!36898 () ListLongMap!9031)

(declare-fun +!2005 (ListLongMap!9031 tuple2!10262) ListLongMap!9031)

(assert (=> b!838637 (= e!468109 (= call!36898 (+!2005 call!36899 (tuple2!10263 k!854 v!557))))))

(declare-fun b!838638 () Bool)

(declare-fun e!468110 () Bool)

(declare-fun tp_is_empty!15421 () Bool)

(assert (=> b!838638 (= e!468110 tp_is_empty!15421)))

(declare-fun b!838639 () Bool)

(declare-fun e!468111 () Bool)

(declare-fun e!468108 () Bool)

(declare-fun mapRes!24731 () Bool)

(assert (=> b!838639 (= e!468111 (and e!468108 mapRes!24731))))

(declare-fun condMapEmpty!24731 () Bool)

(declare-fun mapDefault!24731 () ValueCell!7271)

