; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42118 () Bool)

(assert start!42118)

(declare-fun b_free!11651 () Bool)

(declare-fun b_next!11651 () Bool)

(assert (=> start!42118 (= b_free!11651 (not b_next!11651))))

(declare-fun tp!40974 () Bool)

(declare-fun b_and!20073 () Bool)

(assert (=> start!42118 (= tp!40974 b_and!20073)))

(declare-fun b!470216 () Bool)

(declare-fun e!275436 () Bool)

(declare-fun e!275438 () Bool)

(declare-fun mapRes!21319 () Bool)

(assert (=> b!470216 (= e!275436 (and e!275438 mapRes!21319))))

(declare-fun condMapEmpty!21319 () Bool)

(declare-datatypes ((V!18543 0))(
  ( (V!18544 (val!6584 Int)) )
))
(declare-datatypes ((ValueCell!6196 0))(
  ( (ValueCellFull!6196 (v!8875 V!18543)) (EmptyCell!6196) )
))
(declare-datatypes ((array!29931 0))(
  ( (array!29932 (arr!14389 (Array (_ BitVec 32) ValueCell!6196)) (size!14741 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29931)

(declare-fun mapDefault!21319 () ValueCell!6196)

