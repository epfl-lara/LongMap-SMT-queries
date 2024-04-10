; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73148 () Bool)

(assert start!73148)

(declare-fun b_free!14063 () Bool)

(declare-fun b_next!14063 () Bool)

(assert (=> start!73148 (= b_free!14063 (not b_next!14063))))

(declare-fun tp!49693 () Bool)

(declare-fun b_and!23285 () Bool)

(assert (=> start!73148 (= tp!49693 b_and!23285)))

(declare-fun b!851635 () Bool)

(declare-fun e!475018 () Bool)

(declare-fun e!475020 () Bool)

(declare-fun mapRes!25898 () Bool)

(assert (=> b!851635 (= e!475018 (and e!475020 mapRes!25898))))

(declare-fun condMapEmpty!25898 () Bool)

(declare-datatypes ((V!26645 0))(
  ( (V!26646 (val!8147 Int)) )
))
(declare-datatypes ((ValueCell!7660 0))(
  ( (ValueCellFull!7660 (v!10572 V!26645)) (EmptyCell!7660) )
))
(declare-datatypes ((array!48598 0))(
  ( (array!48599 (arr!23330 (Array (_ BitVec 32) ValueCell!7660)) (size!23770 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48598)

(declare-fun mapDefault!25898 () ValueCell!7660)

