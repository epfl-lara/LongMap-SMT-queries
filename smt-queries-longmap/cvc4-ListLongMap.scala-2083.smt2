; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35670 () Bool)

(assert start!35670)

(declare-fun b!358315 () Bool)

(declare-fun e!219301 () Bool)

(declare-fun e!219300 () Bool)

(declare-fun mapRes!13692 () Bool)

(assert (=> b!358315 (= e!219301 (and e!219300 mapRes!13692))))

(declare-fun condMapEmpty!13692 () Bool)

(declare-datatypes ((V!11807 0))(
  ( (V!11808 (val!4106 Int)) )
))
(declare-datatypes ((ValueCell!3718 0))(
  ( (ValueCellFull!3718 (v!6300 V!11807)) (EmptyCell!3718) )
))
(declare-datatypes ((array!19813 0))(
  ( (array!19814 (arr!9400 (Array (_ BitVec 32) ValueCell!3718)) (size!9752 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19813)

(declare-fun mapDefault!13692 () ValueCell!3718)

