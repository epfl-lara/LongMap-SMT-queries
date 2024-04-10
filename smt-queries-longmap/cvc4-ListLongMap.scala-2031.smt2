; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35346 () Bool)

(assert start!35346)

(declare-fun b!353955 () Bool)

(declare-fun e!216851 () Bool)

(declare-fun e!216852 () Bool)

(declare-fun mapRes!13221 () Bool)

(assert (=> b!353955 (= e!216851 (and e!216852 mapRes!13221))))

(declare-fun condMapEmpty!13221 () Bool)

(declare-datatypes ((V!11391 0))(
  ( (V!11392 (val!3950 Int)) )
))
(declare-datatypes ((ValueCell!3562 0))(
  ( (ValueCellFull!3562 (v!6144 V!11391)) (EmptyCell!3562) )
))
(declare-datatypes ((array!19215 0))(
  ( (array!19216 (arr!9102 (Array (_ BitVec 32) ValueCell!3562)) (size!9454 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19215)

(declare-fun mapDefault!13221 () ValueCell!3562)

