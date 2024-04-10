; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131858 () Bool)

(assert start!131858)

(declare-fun b!1543677 () Bool)

(declare-fun e!859164 () Bool)

(assert (=> b!1543677 (= e!859164 false)))

(declare-fun lt!666023 () Bool)

(declare-datatypes ((array!102914 0))(
  ( (array!102915 (arr!49659 (Array (_ BitVec 32) (_ BitVec 64))) (size!50209 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102914)

(declare-datatypes ((List!35929 0))(
  ( (Nil!35926) (Cons!35925 (h!37370 (_ BitVec 64)) (t!50623 List!35929)) )
))
(declare-fun arrayNoDuplicates!0 (array!102914 (_ BitVec 32) List!35929) Bool)

(assert (=> b!1543677 (= lt!666023 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35926))))

(declare-fun mapIsEmpty!58474 () Bool)

(declare-fun mapRes!58474 () Bool)

(assert (=> mapIsEmpty!58474 mapRes!58474))

(declare-fun b!1543678 () Bool)

(declare-fun e!859163 () Bool)

(declare-fun tp_is_empty!37847 () Bool)

(assert (=> b!1543678 (= e!859163 tp_is_empty!37847)))

(declare-fun b!1543679 () Bool)

(declare-fun e!859161 () Bool)

(declare-fun e!859160 () Bool)

(assert (=> b!1543679 (= e!859161 (and e!859160 mapRes!58474))))

(declare-fun condMapEmpty!58474 () Bool)

(declare-datatypes ((V!58905 0))(
  ( (V!58906 (val!19001 Int)) )
))
(declare-datatypes ((ValueCell!18013 0))(
  ( (ValueCellFull!18013 (v!21802 V!58905)) (EmptyCell!18013) )
))
(declare-datatypes ((array!102916 0))(
  ( (array!102917 (arr!49660 (Array (_ BitVec 32) ValueCell!18013)) (size!50210 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102916)

(declare-fun mapDefault!58474 () ValueCell!18013)

