; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34836 () Bool)

(assert start!34836)

(declare-fun b_free!7621 () Bool)

(declare-fun b_next!7621 () Bool)

(assert (=> start!34836 (= b_free!7621 (not b_next!7621))))

(declare-fun tp!26430 () Bool)

(declare-fun b_and!14843 () Bool)

(assert (=> start!34836 (= tp!26430 b_and!14843)))

(declare-fun b!348806 () Bool)

(declare-fun e!213684 () Bool)

(declare-fun tp_is_empty!7573 () Bool)

(assert (=> b!348806 (= e!213684 tp_is_empty!7573)))

(declare-fun b!348807 () Bool)

(declare-fun e!213685 () Bool)

(declare-fun e!213681 () Bool)

(declare-fun mapRes!12819 () Bool)

(assert (=> b!348807 (= e!213685 (and e!213681 mapRes!12819))))

(declare-fun condMapEmpty!12819 () Bool)

(declare-datatypes ((V!11075 0))(
  ( (V!11076 (val!3831 Int)) )
))
(declare-datatypes ((ValueCell!3443 0))(
  ( (ValueCellFull!3443 (v!6014 V!11075)) (EmptyCell!3443) )
))
(declare-datatypes ((array!18733 0))(
  ( (array!18734 (arr!8876 (Array (_ BitVec 32) ValueCell!3443)) (size!9228 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18733)

(declare-fun mapDefault!12819 () ValueCell!3443)

