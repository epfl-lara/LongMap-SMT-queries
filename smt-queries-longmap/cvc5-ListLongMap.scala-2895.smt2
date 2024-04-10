; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41512 () Bool)

(assert start!41512)

(declare-fun b_free!11179 () Bool)

(declare-fun b_next!11179 () Bool)

(assert (=> start!41512 (= b_free!11179 (not b_next!11179))))

(declare-fun tp!39535 () Bool)

(declare-fun b_and!19519 () Bool)

(assert (=> start!41512 (= tp!39535 b_and!19519)))

(declare-fun b!463726 () Bool)

(declare-fun e!270790 () Bool)

(declare-fun e!270788 () Bool)

(declare-fun mapRes!20587 () Bool)

(assert (=> b!463726 (= e!270790 (and e!270788 mapRes!20587))))

(declare-fun condMapEmpty!20587 () Bool)

(declare-datatypes ((V!17915 0))(
  ( (V!17916 (val!6348 Int)) )
))
(declare-datatypes ((ValueCell!5960 0))(
  ( (ValueCellFull!5960 (v!8635 V!17915)) (EmptyCell!5960) )
))
(declare-datatypes ((array!29007 0))(
  ( (array!29008 (arr!13935 (Array (_ BitVec 32) ValueCell!5960)) (size!14287 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29007)

(declare-fun mapDefault!20587 () ValueCell!5960)

