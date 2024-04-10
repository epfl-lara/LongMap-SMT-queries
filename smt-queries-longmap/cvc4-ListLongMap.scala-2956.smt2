; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41976 () Bool)

(assert start!41976)

(declare-fun b_free!11549 () Bool)

(declare-fun b_next!11549 () Bool)

(assert (=> start!41976 (= b_free!11549 (not b_next!11549))))

(declare-fun tp!40663 () Bool)

(declare-fun b_and!19947 () Bool)

(assert (=> start!41976 (= tp!40663 b_and!19947)))

(declare-fun b!468642 () Bool)

(declare-fun e!274302 () Bool)

(declare-fun e!274305 () Bool)

(declare-fun mapRes!21160 () Bool)

(assert (=> b!468642 (= e!274302 (and e!274305 mapRes!21160))))

(declare-fun condMapEmpty!21160 () Bool)

(declare-datatypes ((V!18407 0))(
  ( (V!18408 (val!6533 Int)) )
))
(declare-datatypes ((ValueCell!6145 0))(
  ( (ValueCellFull!6145 (v!8822 V!18407)) (EmptyCell!6145) )
))
(declare-datatypes ((array!29731 0))(
  ( (array!29732 (arr!14291 (Array (_ BitVec 32) ValueCell!6145)) (size!14643 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29731)

(declare-fun mapDefault!21160 () ValueCell!6145)

