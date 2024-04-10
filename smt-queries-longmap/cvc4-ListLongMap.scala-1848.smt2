; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33460 () Bool)

(assert start!33460)

(declare-fun b!332127 () Bool)

(declare-fun e!203882 () Bool)

(declare-fun e!203886 () Bool)

(declare-fun mapRes!11454 () Bool)

(assert (=> b!332127 (= e!203882 (and e!203886 mapRes!11454))))

(declare-fun condMapEmpty!11454 () Bool)

(declare-datatypes ((V!9927 0))(
  ( (V!9928 (val!3401 Int)) )
))
(declare-datatypes ((ValueCell!3013 0))(
  ( (ValueCellFull!3013 (v!5560 V!9927)) (EmptyCell!3013) )
))
(declare-datatypes ((array!17023 0))(
  ( (array!17024 (arr!8046 (Array (_ BitVec 32) ValueCell!3013)) (size!8398 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17023)

(declare-fun mapDefault!11454 () ValueCell!3013)

