; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41620 () Bool)

(assert start!41620)

(declare-fun b_free!11273 () Bool)

(declare-fun b_next!11273 () Bool)

(assert (=> start!41620 (= b_free!11273 (not b_next!11273))))

(declare-fun tp!39820 () Bool)

(declare-fun b_and!19621 () Bool)

(assert (=> start!41620 (= tp!39820 b_and!19621)))

(declare-fun b!464798 () Bool)

(declare-fun e!271550 () Bool)

(declare-fun e!271551 () Bool)

(declare-fun mapRes!20731 () Bool)

(assert (=> b!464798 (= e!271550 (and e!271551 mapRes!20731))))

(declare-fun condMapEmpty!20731 () Bool)

(declare-datatypes ((V!18039 0))(
  ( (V!18040 (val!6395 Int)) )
))
(declare-datatypes ((ValueCell!6007 0))(
  ( (ValueCellFull!6007 (v!8682 V!18039)) (EmptyCell!6007) )
))
(declare-datatypes ((array!29189 0))(
  ( (array!29190 (arr!14025 (Array (_ BitVec 32) ValueCell!6007)) (size!14377 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29189)

(declare-fun mapDefault!20731 () ValueCell!6007)

