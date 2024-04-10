; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82562 () Bool)

(assert start!82562)

(declare-fun b_free!18695 () Bool)

(declare-fun b_next!18695 () Bool)

(assert (=> start!82562 (= b_free!18695 (not b_next!18695))))

(declare-fun tp!65205 () Bool)

(declare-fun b_and!30183 () Bool)

(assert (=> start!82562 (= tp!65205 b_and!30183)))

(declare-fun b!962168 () Bool)

(declare-fun e!542598 () Bool)

(declare-fun tp_is_empty!21497 () Bool)

(assert (=> b!962168 (= e!542598 tp_is_empty!21497)))

(declare-fun b!962169 () Bool)

(declare-fun res!643908 () Bool)

(declare-fun e!542600 () Bool)

(assert (=> b!962169 (=> (not res!643908) (not e!542600))))

(declare-datatypes ((array!59091 0))(
  ( (array!59092 (arr!28414 (Array (_ BitVec 32) (_ BitVec 64))) (size!28893 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59091)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962169 (= res!643908 (validKeyInArray!0 (select (arr!28414 _keys!1686) i!803)))))

(declare-fun b!962170 () Bool)

(declare-fun e!542596 () Bool)

(declare-fun mapRes!34240 () Bool)

(assert (=> b!962170 (= e!542596 (and e!542598 mapRes!34240))))

(declare-fun condMapEmpty!34240 () Bool)

(declare-datatypes ((V!33645 0))(
  ( (V!33646 (val!10799 Int)) )
))
(declare-datatypes ((ValueCell!10267 0))(
  ( (ValueCellFull!10267 (v!13357 V!33645)) (EmptyCell!10267) )
))
(declare-datatypes ((array!59093 0))(
  ( (array!59094 (arr!28415 (Array (_ BitVec 32) ValueCell!10267)) (size!28894 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59093)

(declare-fun mapDefault!34240 () ValueCell!10267)

