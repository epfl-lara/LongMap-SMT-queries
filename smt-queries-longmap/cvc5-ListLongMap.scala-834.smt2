; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20100 () Bool)

(assert start!20100)

(declare-fun b_free!4759 () Bool)

(declare-fun b_next!4759 () Bool)

(assert (=> start!20100 (= b_free!4759 (not b_next!4759))))

(declare-fun tp!17308 () Bool)

(declare-fun b_and!11505 () Bool)

(assert (=> start!20100 (= tp!17308 b_and!11505)))

(declare-fun b!196934 () Bool)

(declare-fun res!93037 () Bool)

(declare-fun e!129674 () Bool)

(assert (=> b!196934 (=> (not res!93037) (not e!129674))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196934 (= res!93037 (validKeyInArray!0 k!843))))

(declare-fun b!196935 () Bool)

(declare-fun res!93038 () Bool)

(assert (=> b!196935 (=> (not res!93038) (not e!129674))))

(declare-datatypes ((array!8485 0))(
  ( (array!8486 (arr!3993 (Array (_ BitVec 32) (_ BitVec 64))) (size!4318 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8485)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196935 (= res!93038 (= (select (arr!3993 _keys!825) i!601) k!843))))

(declare-fun b!196936 () Bool)

(declare-fun e!129671 () Bool)

(declare-fun e!129672 () Bool)

(declare-fun mapRes!7991 () Bool)

(assert (=> b!196936 (= e!129671 (and e!129672 mapRes!7991))))

(declare-fun condMapEmpty!7991 () Bool)

(declare-datatypes ((V!5801 0))(
  ( (V!5802 (val!2352 Int)) )
))
(declare-datatypes ((ValueCell!1964 0))(
  ( (ValueCellFull!1964 (v!4322 V!5801)) (EmptyCell!1964) )
))
(declare-datatypes ((array!8487 0))(
  ( (array!8488 (arr!3994 (Array (_ BitVec 32) ValueCell!1964)) (size!4319 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8487)

(declare-fun mapDefault!7991 () ValueCell!1964)

