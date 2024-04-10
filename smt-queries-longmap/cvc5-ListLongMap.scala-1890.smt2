; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33830 () Bool)

(assert start!33830)

(declare-fun b_free!7009 () Bool)

(declare-fun b_next!7009 () Bool)

(assert (=> start!33830 (= b_free!7009 (not b_next!7009))))

(declare-fun tp!24539 () Bool)

(declare-fun b_and!14195 () Bool)

(assert (=> start!33830 (= tp!24539 b_and!14195)))

(declare-fun b!336482 () Bool)

(declare-fun res!185704 () Bool)

(declare-fun e!206540 () Bool)

(assert (=> b!336482 (=> (not res!185704) (not e!206540))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336482 (= res!185704 (validKeyInArray!0 k!1348))))

(declare-fun b!336483 () Bool)

(declare-fun e!206544 () Bool)

(declare-fun e!206541 () Bool)

(declare-fun mapRes!11847 () Bool)

(assert (=> b!336483 (= e!206544 (and e!206541 mapRes!11847))))

(declare-fun condMapEmpty!11847 () Bool)

(declare-datatypes ((V!10259 0))(
  ( (V!10260 (val!3525 Int)) )
))
(declare-datatypes ((ValueCell!3137 0))(
  ( (ValueCellFull!3137 (v!5690 V!10259)) (EmptyCell!3137) )
))
(declare-datatypes ((array!17521 0))(
  ( (array!17522 (arr!8288 (Array (_ BitVec 32) ValueCell!3137)) (size!8640 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17521)

(declare-fun mapDefault!11847 () ValueCell!3137)

