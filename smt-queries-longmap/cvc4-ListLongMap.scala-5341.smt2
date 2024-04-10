; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71376 () Bool)

(assert start!71376)

(declare-fun b_free!13457 () Bool)

(declare-fun b_next!13457 () Bool)

(assert (=> start!71376 (= b_free!13457 (not b_next!13457))))

(declare-fun tp!47146 () Bool)

(declare-fun b_and!22439 () Bool)

(assert (=> start!71376 (= tp!47146 b_and!22439)))

(declare-fun b!828956 () Bool)

(declare-fun res!564788 () Bool)

(declare-fun e!462002 () Bool)

(assert (=> b!828956 (=> (not res!564788) (not e!462002))))

(declare-datatypes ((array!46498 0))(
  ( (array!46499 (arr!22289 (Array (_ BitVec 32) (_ BitVec 64))) (size!22710 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46498)

(declare-datatypes ((List!15912 0))(
  ( (Nil!15909) (Cons!15908 (h!17037 (_ BitVec 64)) (t!22269 List!15912)) )
))
(declare-fun arrayNoDuplicates!0 (array!46498 (_ BitVec 32) List!15912) Bool)

(assert (=> b!828956 (= res!564788 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15909))))

(declare-fun b!828957 () Bool)

(declare-fun e!462003 () Bool)

(declare-fun e!461998 () Bool)

(declare-fun mapRes!24391 () Bool)

(assert (=> b!828957 (= e!462003 (and e!461998 mapRes!24391))))

(declare-fun condMapEmpty!24391 () Bool)

(declare-datatypes ((V!25223 0))(
  ( (V!25224 (val!7631 Int)) )
))
(declare-datatypes ((ValueCell!7168 0))(
  ( (ValueCellFull!7168 (v!10069 V!25223)) (EmptyCell!7168) )
))
(declare-datatypes ((array!46500 0))(
  ( (array!46501 (arr!22290 (Array (_ BitVec 32) ValueCell!7168)) (size!22711 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46500)

(declare-fun mapDefault!24391 () ValueCell!7168)

