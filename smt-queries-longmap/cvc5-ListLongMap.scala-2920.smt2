; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41690 () Bool)

(assert start!41690)

(declare-fun b_free!11329 () Bool)

(declare-fun b_next!11329 () Bool)

(assert (=> start!41690 (= b_free!11329 (not b_next!11329))))

(declare-fun tp!39990 () Bool)

(declare-fun b_and!19685 () Bool)

(assert (=> start!41690 (= tp!39990 b_and!19685)))

(declare-fun b!465482 () Bool)

(declare-fun e!272037 () Bool)

(declare-fun e!272036 () Bool)

(declare-fun mapRes!20818 () Bool)

(assert (=> b!465482 (= e!272037 (and e!272036 mapRes!20818))))

(declare-fun condMapEmpty!20818 () Bool)

(declare-datatypes ((V!18115 0))(
  ( (V!18116 (val!6423 Int)) )
))
(declare-datatypes ((ValueCell!6035 0))(
  ( (ValueCellFull!6035 (v!8710 V!18115)) (EmptyCell!6035) )
))
(declare-datatypes ((array!29297 0))(
  ( (array!29298 (arr!14078 (Array (_ BitVec 32) ValueCell!6035)) (size!14430 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29297)

(declare-fun mapDefault!20818 () ValueCell!6035)

