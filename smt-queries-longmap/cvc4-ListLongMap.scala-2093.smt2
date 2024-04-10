; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35730 () Bool)

(assert start!35730)

(declare-fun b!358859 () Bool)

(declare-fun e!219752 () Bool)

(declare-fun e!219750 () Bool)

(declare-fun mapRes!13782 () Bool)

(assert (=> b!358859 (= e!219752 (and e!219750 mapRes!13782))))

(declare-fun condMapEmpty!13782 () Bool)

(declare-datatypes ((V!11887 0))(
  ( (V!11888 (val!4136 Int)) )
))
(declare-datatypes ((ValueCell!3748 0))(
  ( (ValueCellFull!3748 (v!6330 V!11887)) (EmptyCell!3748) )
))
(declare-datatypes ((array!19927 0))(
  ( (array!19928 (arr!9457 (Array (_ BitVec 32) ValueCell!3748)) (size!9809 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19927)

(declare-fun mapDefault!13782 () ValueCell!3748)

