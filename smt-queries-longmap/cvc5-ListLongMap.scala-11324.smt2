; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131848 () Bool)

(assert start!131848)

(declare-fun b!1543587 () Bool)

(declare-fun e!859087 () Bool)

(declare-fun e!859086 () Bool)

(declare-fun mapRes!58459 () Bool)

(assert (=> b!1543587 (= e!859087 (and e!859086 mapRes!58459))))

(declare-fun condMapEmpty!58459 () Bool)

(declare-datatypes ((V!58893 0))(
  ( (V!58894 (val!18996 Int)) )
))
(declare-datatypes ((ValueCell!18008 0))(
  ( (ValueCellFull!18008 (v!21797 V!58893)) (EmptyCell!18008) )
))
(declare-datatypes ((array!102898 0))(
  ( (array!102899 (arr!49651 (Array (_ BitVec 32) ValueCell!18008)) (size!50201 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102898)

(declare-fun mapDefault!58459 () ValueCell!18008)

