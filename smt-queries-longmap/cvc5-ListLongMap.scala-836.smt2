; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20112 () Bool)

(assert start!20112)

(declare-fun b_free!4771 () Bool)

(declare-fun b_next!4771 () Bool)

(assert (=> start!20112 (= b_free!4771 (not b_next!4771))))

(declare-fun tp!17345 () Bool)

(declare-fun b_and!11517 () Bool)

(assert (=> start!20112 (= tp!17345 b_and!11517)))

(declare-fun b!197114 () Bool)

(declare-fun res!93161 () Bool)

(declare-fun e!129764 () Bool)

(assert (=> b!197114 (=> (not res!93161) (not e!129764))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197114 (= res!93161 (validKeyInArray!0 k!843))))

(declare-fun b!197115 () Bool)

(declare-fun e!129760 () Bool)

(declare-fun e!129761 () Bool)

(declare-fun mapRes!8009 () Bool)

(assert (=> b!197115 (= e!129760 (and e!129761 mapRes!8009))))

(declare-fun condMapEmpty!8009 () Bool)

(declare-datatypes ((V!5817 0))(
  ( (V!5818 (val!2358 Int)) )
))
(declare-datatypes ((ValueCell!1970 0))(
  ( (ValueCellFull!1970 (v!4328 V!5817)) (EmptyCell!1970) )
))
(declare-datatypes ((array!8509 0))(
  ( (array!8510 (arr!4005 (Array (_ BitVec 32) ValueCell!1970)) (size!4330 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8509)

(declare-fun mapDefault!8009 () ValueCell!1970)

