; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35720 () Bool)

(assert start!35720)

(declare-fun b!358769 () Bool)

(declare-fun e!219674 () Bool)

(declare-fun e!219673 () Bool)

(declare-fun mapRes!13767 () Bool)

(assert (=> b!358769 (= e!219674 (and e!219673 mapRes!13767))))

(declare-fun condMapEmpty!13767 () Bool)

(declare-datatypes ((V!11875 0))(
  ( (V!11876 (val!4131 Int)) )
))
(declare-datatypes ((ValueCell!3743 0))(
  ( (ValueCellFull!3743 (v!6325 V!11875)) (EmptyCell!3743) )
))
(declare-datatypes ((array!19911 0))(
  ( (array!19912 (arr!9449 (Array (_ BitVec 32) ValueCell!3743)) (size!9801 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19911)

(declare-fun mapDefault!13767 () ValueCell!3743)

