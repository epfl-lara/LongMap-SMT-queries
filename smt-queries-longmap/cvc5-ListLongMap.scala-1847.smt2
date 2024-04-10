; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33450 () Bool)

(assert start!33450)

(declare-fun mapIsEmpty!11439 () Bool)

(declare-fun mapRes!11439 () Bool)

(assert (=> mapIsEmpty!11439 mapRes!11439))

(declare-fun b!332037 () Bool)

(declare-fun e!203811 () Bool)

(declare-fun e!203807 () Bool)

(assert (=> b!332037 (= e!203811 (and e!203807 mapRes!11439))))

(declare-fun condMapEmpty!11439 () Bool)

(declare-datatypes ((V!9915 0))(
  ( (V!9916 (val!3396 Int)) )
))
(declare-datatypes ((ValueCell!3008 0))(
  ( (ValueCellFull!3008 (v!5555 V!9915)) (EmptyCell!3008) )
))
(declare-datatypes ((array!17005 0))(
  ( (array!17006 (arr!8037 (Array (_ BitVec 32) ValueCell!3008)) (size!8389 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17005)

(declare-fun mapDefault!11439 () ValueCell!3008)

