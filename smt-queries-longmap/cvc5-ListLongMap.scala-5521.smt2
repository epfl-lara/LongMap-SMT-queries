; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72910 () Bool)

(assert start!72910)

(declare-fun b_free!13825 () Bool)

(declare-fun b_next!13825 () Bool)

(assert (=> start!72910 (= b_free!13825 (not b_next!13825))))

(declare-fun tp!48979 () Bool)

(declare-fun b_and!22911 () Bool)

(assert (=> start!72910 (= tp!48979 b_and!22911)))

(declare-fun b!846496 () Bool)

(declare-fun res!575111 () Bool)

(declare-fun e!472443 () Bool)

(assert (=> b!846496 (=> (not res!575111) (not e!472443))))

(declare-datatypes ((array!48134 0))(
  ( (array!48135 (arr!23098 (Array (_ BitVec 32) (_ BitVec 64))) (size!23538 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48134)

(declare-datatypes ((List!16346 0))(
  ( (Nil!16343) (Cons!16342 (h!17473 (_ BitVec 64)) (t!22717 List!16346)) )
))
(declare-fun arrayNoDuplicates!0 (array!48134 (_ BitVec 32) List!16346) Bool)

(assert (=> b!846496 (= res!575111 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16343))))

(declare-fun b!846497 () Bool)

(declare-fun res!575113 () Bool)

(assert (=> b!846497 (=> (not res!575113) (not e!472443))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846497 (= res!575113 (validKeyInArray!0 k!854))))

(declare-fun b!846498 () Bool)

(declare-fun e!472446 () Bool)

(declare-fun e!472444 () Bool)

(declare-fun mapRes!25541 () Bool)

(assert (=> b!846498 (= e!472446 (and e!472444 mapRes!25541))))

(declare-fun condMapEmpty!25541 () Bool)

(declare-datatypes ((V!26329 0))(
  ( (V!26330 (val!8028 Int)) )
))
(declare-datatypes ((ValueCell!7541 0))(
  ( (ValueCellFull!7541 (v!10453 V!26329)) (EmptyCell!7541) )
))
(declare-datatypes ((array!48136 0))(
  ( (array!48137 (arr!23099 (Array (_ BitVec 32) ValueCell!7541)) (size!23539 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48136)

(declare-fun mapDefault!25541 () ValueCell!7541)

