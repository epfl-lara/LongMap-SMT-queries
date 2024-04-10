; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77586 () Bool)

(assert start!77586)

(declare-fun b_free!16171 () Bool)

(declare-fun b_next!16171 () Bool)

(assert (=> start!77586 (= b_free!16171 (not b_next!16171))))

(declare-fun tp!56774 () Bool)

(declare-fun b_and!26537 () Bool)

(assert (=> start!77586 (= tp!56774 b_and!26537)))

(declare-fun mapNonEmpty!29596 () Bool)

(declare-fun mapRes!29596 () Bool)

(declare-fun tp!56775 () Bool)

(declare-fun e!506611 () Bool)

(assert (=> mapNonEmpty!29596 (= mapRes!29596 (and tp!56775 e!506611))))

(declare-datatypes ((V!29751 0))(
  ( (V!29752 (val!9345 Int)) )
))
(declare-datatypes ((ValueCell!8813 0))(
  ( (ValueCellFull!8813 (v!11850 V!29751)) (EmptyCell!8813) )
))
(declare-datatypes ((array!53230 0))(
  ( (array!53231 (arr!25574 (Array (_ BitVec 32) ValueCell!8813)) (size!26033 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53230)

(declare-fun mapKey!29596 () (_ BitVec 32))

(declare-fun mapValue!29596 () ValueCell!8813)

(declare-fun mapRest!29596 () (Array (_ BitVec 32) ValueCell!8813))

(assert (=> mapNonEmpty!29596 (= (arr!25574 _values!1152) (store mapRest!29596 mapKey!29596 mapValue!29596))))

(declare-fun mapIsEmpty!29596 () Bool)

(assert (=> mapIsEmpty!29596 mapRes!29596))

(declare-fun b!904119 () Bool)

(declare-fun e!506610 () Bool)

(declare-fun e!506608 () Bool)

(assert (=> b!904119 (= e!506610 (and e!506608 mapRes!29596))))

(declare-fun condMapEmpty!29596 () Bool)

(declare-fun mapDefault!29596 () ValueCell!8813)

