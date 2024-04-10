; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72844 () Bool)

(assert start!72844)

(declare-fun b_free!13759 () Bool)

(declare-fun b_next!13759 () Bool)

(assert (=> start!72844 (= b_free!13759 (not b_next!13759))))

(declare-fun tp!48781 () Bool)

(declare-fun b_and!22845 () Bool)

(assert (=> start!72844 (= tp!48781 b_and!22845)))

(declare-fun b!845407 () Bool)

(declare-fun res!574321 () Bool)

(declare-fun e!471950 () Bool)

(assert (=> b!845407 (=> (not res!574321) (not e!471950))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48010 0))(
  ( (array!48011 (arr!23036 (Array (_ BitVec 32) (_ BitVec 64))) (size!23476 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48010)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!845407 (= res!574321 (and (= (select (arr!23036 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!845408 () Bool)

(declare-fun res!574322 () Bool)

(assert (=> b!845408 (=> (not res!574322) (not e!471950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845408 (= res!574322 (validKeyInArray!0 k!854))))

(declare-fun b!845409 () Bool)

(declare-fun res!574324 () Bool)

(assert (=> b!845409 (=> (not res!574324) (not e!471950))))

(assert (=> b!845409 (= res!574324 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23476 _keys!868))))))

(declare-fun res!574319 () Bool)

(assert (=> start!72844 (=> (not res!574319) (not e!471950))))

(assert (=> start!72844 (= res!574319 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23476 _keys!868))))))

(assert (=> start!72844 e!471950))

(assert (=> start!72844 true))

(assert (=> start!72844 tp!48781))

(declare-fun array_inv!18308 (array!48010) Bool)

(assert (=> start!72844 (array_inv!18308 _keys!868)))

(declare-datatypes ((V!26241 0))(
  ( (V!26242 (val!7995 Int)) )
))
(declare-datatypes ((ValueCell!7508 0))(
  ( (ValueCellFull!7508 (v!10420 V!26241)) (EmptyCell!7508) )
))
(declare-datatypes ((array!48012 0))(
  ( (array!48013 (arr!23037 (Array (_ BitVec 32) ValueCell!7508)) (size!23477 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48012)

(declare-fun e!471949 () Bool)

(declare-fun array_inv!18309 (array!48012) Bool)

(assert (=> start!72844 (and (array_inv!18309 _values!688) e!471949)))

(declare-fun tp_is_empty!15895 () Bool)

(assert (=> start!72844 tp_is_empty!15895))

(declare-fun b!845410 () Bool)

(declare-fun e!471952 () Bool)

(assert (=> b!845410 (= e!471952 tp_is_empty!15895)))

(declare-fun b!845411 () Bool)

(declare-fun e!471951 () Bool)

(assert (=> b!845411 (= e!471951 tp_is_empty!15895)))

(declare-fun b!845412 () Bool)

(declare-fun mapRes!25442 () Bool)

(assert (=> b!845412 (= e!471949 (and e!471951 mapRes!25442))))

(declare-fun condMapEmpty!25442 () Bool)

(declare-fun mapDefault!25442 () ValueCell!7508)

