; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35260 () Bool)

(assert start!35260)

(declare-fun b!353453 () Bool)

(declare-fun e!216440 () Bool)

(declare-fun e!216443 () Bool)

(declare-fun mapRes!13143 () Bool)

(assert (=> b!353453 (= e!216440 (and e!216443 mapRes!13143))))

(declare-fun condMapEmpty!13143 () Bool)

(declare-datatypes ((V!11335 0))(
  ( (V!11336 (val!3929 Int)) )
))
(declare-datatypes ((ValueCell!3541 0))(
  ( (ValueCellFull!3541 (v!6122 V!11335)) (EmptyCell!3541) )
))
(declare-datatypes ((array!19131 0))(
  ( (array!19132 (arr!9065 (Array (_ BitVec 32) ValueCell!3541)) (size!9417 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19131)

(declare-fun mapDefault!13143 () ValueCell!3541)

