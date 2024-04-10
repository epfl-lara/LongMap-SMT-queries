; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42014 () Bool)

(assert start!42014)

(declare-fun b_free!11587 () Bool)

(declare-fun b_next!11587 () Bool)

(assert (=> start!42014 (= b_free!11587 (not b_next!11587))))

(declare-fun tp!40777 () Bool)

(declare-fun b_and!19985 () Bool)

(assert (=> start!42014 (= tp!40777 b_and!19985)))

(declare-fun b!469098 () Bool)

(declare-fun e!274648 () Bool)

(declare-fun e!274645 () Bool)

(declare-fun mapRes!21217 () Bool)

(assert (=> b!469098 (= e!274648 (and e!274645 mapRes!21217))))

(declare-fun condMapEmpty!21217 () Bool)

(declare-datatypes ((V!18459 0))(
  ( (V!18460 (val!6552 Int)) )
))
(declare-datatypes ((ValueCell!6164 0))(
  ( (ValueCellFull!6164 (v!8841 V!18459)) (EmptyCell!6164) )
))
(declare-datatypes ((array!29803 0))(
  ( (array!29804 (arr!14327 (Array (_ BitVec 32) ValueCell!6164)) (size!14679 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29803)

(declare-fun mapDefault!21217 () ValueCell!6164)

