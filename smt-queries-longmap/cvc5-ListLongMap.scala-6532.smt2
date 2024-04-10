; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83076 () Bool)

(assert start!83076)

(declare-fun b!969128 () Bool)

(declare-fun e!546317 () Bool)

(declare-fun e!546316 () Bool)

(declare-fun mapRes!34960 () Bool)

(assert (=> b!969128 (= e!546317 (and e!546316 mapRes!34960))))

(declare-fun condMapEmpty!34960 () Bool)

(declare-datatypes ((V!34273 0))(
  ( (V!34274 (val!11034 Int)) )
))
(declare-datatypes ((ValueCell!10502 0))(
  ( (ValueCellFull!10502 (v!13593 V!34273)) (EmptyCell!10502) )
))
(declare-datatypes ((array!60007 0))(
  ( (array!60008 (arr!28867 (Array (_ BitVec 32) ValueCell!10502)) (size!29346 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60007)

(declare-fun mapDefault!34960 () ValueCell!10502)

