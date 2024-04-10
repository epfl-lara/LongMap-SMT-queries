; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20164 () Bool)

(assert start!20164)

(declare-fun b_free!4823 () Bool)

(declare-fun b_next!4823 () Bool)

(assert (=> start!20164 (= b_free!4823 (not b_next!4823))))

(declare-fun tp!17501 () Bool)

(declare-fun b_and!11569 () Bool)

(assert (=> start!20164 (= tp!17501 b_and!11569)))

(declare-fun b!197894 () Bool)

(declare-fun res!93706 () Bool)

(declare-fun e!130154 () Bool)

(assert (=> b!197894 (=> (not res!93706) (not e!130154))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197894 (= res!93706 (validKeyInArray!0 k!843))))

(declare-fun b!197895 () Bool)

(declare-fun e!130151 () Bool)

(declare-fun e!130152 () Bool)

(declare-fun mapRes!8087 () Bool)

(assert (=> b!197895 (= e!130151 (and e!130152 mapRes!8087))))

(declare-fun condMapEmpty!8087 () Bool)

(declare-datatypes ((V!5885 0))(
  ( (V!5886 (val!2384 Int)) )
))
(declare-datatypes ((ValueCell!1996 0))(
  ( (ValueCellFull!1996 (v!4354 V!5885)) (EmptyCell!1996) )
))
(declare-datatypes ((array!8611 0))(
  ( (array!8612 (arr!4056 (Array (_ BitVec 32) ValueCell!1996)) (size!4381 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8611)

(declare-fun mapDefault!8087 () ValueCell!1996)

