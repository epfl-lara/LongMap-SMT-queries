; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35802 () Bool)

(assert start!35802)

(declare-fun b!359606 () Bool)

(declare-fun e!220291 () Bool)

(declare-fun e!220289 () Bool)

(declare-fun mapRes!13890 () Bool)

(assert (=> b!359606 (= e!220291 (and e!220289 mapRes!13890))))

(declare-fun condMapEmpty!13890 () Bool)

(declare-datatypes ((V!11983 0))(
  ( (V!11984 (val!4172 Int)) )
))
(declare-datatypes ((ValueCell!3784 0))(
  ( (ValueCellFull!3784 (v!6366 V!11983)) (EmptyCell!3784) )
))
(declare-datatypes ((array!20065 0))(
  ( (array!20066 (arr!9526 (Array (_ BitVec 32) ValueCell!3784)) (size!9878 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20065)

(declare-fun mapDefault!13890 () ValueCell!3784)

