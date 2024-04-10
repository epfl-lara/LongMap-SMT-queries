; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42510 () Bool)

(assert start!42510)

(declare-fun b_free!11965 () Bool)

(declare-fun b_next!11965 () Bool)

(assert (=> start!42510 (= b_free!11965 (not b_next!11965))))

(declare-fun tp!41931 () Bool)

(declare-fun b_and!20433 () Bool)

(assert (=> start!42510 (= tp!41931 b_and!20433)))

(declare-fun b!474333 () Bool)

(declare-fun e!278401 () Bool)

(declare-fun e!278399 () Bool)

(declare-fun mapRes!21805 () Bool)

(assert (=> b!474333 (= e!278401 (and e!278399 mapRes!21805))))

(declare-fun condMapEmpty!21805 () Bool)

(declare-datatypes ((V!18963 0))(
  ( (V!18964 (val!6741 Int)) )
))
(declare-datatypes ((ValueCell!6353 0))(
  ( (ValueCellFull!6353 (v!9033 V!18963)) (EmptyCell!6353) )
))
(declare-datatypes ((array!30535 0))(
  ( (array!30536 (arr!14686 (Array (_ BitVec 32) ValueCell!6353)) (size!15038 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30535)

(declare-fun mapDefault!21805 () ValueCell!6353)

