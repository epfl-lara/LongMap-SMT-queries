; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97854 () Bool)

(assert start!97854)

(declare-fun b_free!23555 () Bool)

(declare-fun b_next!23555 () Bool)

(assert (=> start!97854 (= b_free!23555 (not b_next!23555))))

(declare-fun tp!83369 () Bool)

(declare-fun b_and!37893 () Bool)

(assert (=> start!97854 (= tp!83369 b_and!37893)))

(declare-fun b!1120134 () Bool)

(declare-fun res!748275 () Bool)

(declare-fun e!637868 () Bool)

(assert (=> b!1120134 (=> (not res!748275) (not e!637868))))

(declare-datatypes ((array!73051 0))(
  ( (array!73052 (arr!35178 (Array (_ BitVec 32) (_ BitVec 64))) (size!35714 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73051)

(declare-datatypes ((List!24475 0))(
  ( (Nil!24472) (Cons!24471 (h!25680 (_ BitVec 64)) (t!35022 List!24475)) )
))
(declare-fun arrayNoDuplicates!0 (array!73051 (_ BitVec 32) List!24475) Bool)

(assert (=> b!1120134 (= res!748275 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24472))))

(declare-fun mapIsEmpty!43945 () Bool)

(declare-fun mapRes!43945 () Bool)

(assert (=> mapIsEmpty!43945 mapRes!43945))

(declare-fun b!1120135 () Bool)

(declare-fun e!637867 () Bool)

(declare-fun e!637864 () Bool)

(assert (=> b!1120135 (= e!637867 (and e!637864 mapRes!43945))))

(declare-fun condMapEmpty!43945 () Bool)

(declare-datatypes ((V!42573 0))(
  ( (V!42574 (val!14099 Int)) )
))
(declare-datatypes ((ValueCell!13333 0))(
  ( (ValueCellFull!13333 (v!16732 V!42573)) (EmptyCell!13333) )
))
(declare-datatypes ((array!73053 0))(
  ( (array!73054 (arr!35179 (Array (_ BitVec 32) ValueCell!13333)) (size!35715 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73053)

(declare-fun mapDefault!43945 () ValueCell!13333)

