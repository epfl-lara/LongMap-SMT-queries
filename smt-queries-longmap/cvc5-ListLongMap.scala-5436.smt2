; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72400 () Bool)

(assert start!72400)

(declare-fun b_free!13585 () Bool)

(declare-fun b_next!13585 () Bool)

(assert (=> start!72400 (= b_free!13585 (not b_next!13585))))

(declare-fun tp!47854 () Bool)

(declare-fun b_and!22671 () Bool)

(assert (=> start!72400 (= tp!47854 b_and!22671)))

(declare-datatypes ((V!25649 0))(
  ( (V!25650 (val!7773 Int)) )
))
(declare-datatypes ((tuple2!10286 0))(
  ( (tuple2!10287 (_1!5154 (_ BitVec 64)) (_2!5154 V!25649)) )
))
(declare-datatypes ((List!16087 0))(
  ( (Nil!16084) (Cons!16083 (h!17214 tuple2!10286) (t!22458 List!16087)) )
))
(declare-datatypes ((ListLongMap!9055 0))(
  ( (ListLongMap!9056 (toList!4543 List!16087)) )
))
(declare-fun call!36988 () ListLongMap!9055)

(declare-fun v!557 () V!25649)

(declare-fun call!36989 () ListLongMap!9055)

(declare-fun b!839219 () Bool)

(declare-fun e!468382 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2016 (ListLongMap!9055 tuple2!10286) ListLongMap!9055)

(assert (=> b!839219 (= e!468382 (= call!36989 (+!2016 call!36988 (tuple2!10287 k!854 v!557))))))

(declare-fun b!839220 () Bool)

(declare-fun e!468377 () Bool)

(declare-fun e!468378 () Bool)

(declare-fun mapRes!24776 () Bool)

(assert (=> b!839220 (= e!468377 (and e!468378 mapRes!24776))))

(declare-fun condMapEmpty!24776 () Bool)

(declare-datatypes ((ValueCell!7286 0))(
  ( (ValueCellFull!7286 (v!10198 V!25649)) (EmptyCell!7286) )
))
(declare-datatypes ((array!47186 0))(
  ( (array!47187 (arr!22624 (Array (_ BitVec 32) ValueCell!7286)) (size!23064 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47186)

(declare-fun mapDefault!24776 () ValueCell!7286)

