; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3674 () Bool)

(assert start!3674)

(declare-fun b!25744 () Bool)

(declare-fun e!16642 () Bool)

(declare-fun tp_is_empty!1039 () Bool)

(assert (=> b!25744 (= e!16642 tp_is_empty!1039)))

(declare-fun b!25745 () Bool)

(declare-fun e!16643 () Bool)

(declare-fun mapRes!1060 () Bool)

(assert (=> b!25745 (= e!16643 (and e!16642 mapRes!1060))))

(declare-fun condMapEmpty!1060 () Bool)

(declare-datatypes ((V!1211 0))(
  ( (V!1212 (val!546 Int)) )
))
(declare-datatypes ((ValueCell!320 0))(
  ( (ValueCellFull!320 (v!1631 V!1211)) (EmptyCell!320) )
))
(declare-datatypes ((array!1321 0))(
  ( (array!1322 (arr!623 (Array (_ BitVec 32) ValueCell!320)) (size!724 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1321)

(declare-fun mapDefault!1060 () ValueCell!320)

