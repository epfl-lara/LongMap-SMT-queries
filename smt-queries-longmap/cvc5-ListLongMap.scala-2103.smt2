; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35786 () Bool)

(assert start!35786)

(declare-fun b!359462 () Bool)

(declare-fun e!220168 () Bool)

(declare-fun e!220171 () Bool)

(declare-fun mapRes!13866 () Bool)

(assert (=> b!359462 (= e!220168 (and e!220171 mapRes!13866))))

(declare-fun condMapEmpty!13866 () Bool)

(declare-datatypes ((V!11963 0))(
  ( (V!11964 (val!4164 Int)) )
))
(declare-datatypes ((ValueCell!3776 0))(
  ( (ValueCellFull!3776 (v!6358 V!11963)) (EmptyCell!3776) )
))
(declare-datatypes ((array!20035 0))(
  ( (array!20036 (arr!9511 (Array (_ BitVec 32) ValueCell!3776)) (size!9863 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20035)

(declare-fun mapDefault!13866 () ValueCell!3776)

