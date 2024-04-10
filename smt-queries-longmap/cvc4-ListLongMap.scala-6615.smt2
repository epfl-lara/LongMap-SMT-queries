; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83622 () Bool)

(assert start!83622)

(declare-fun b!976962 () Bool)

(declare-fun e!550650 () Bool)

(declare-fun e!550649 () Bool)

(declare-fun mapRes!35717 () Bool)

(assert (=> b!976962 (= e!550650 (and e!550649 mapRes!35717))))

(declare-fun condMapEmpty!35717 () Bool)

(declare-datatypes ((V!34941 0))(
  ( (V!34942 (val!11285 Int)) )
))
(declare-datatypes ((ValueCell!10753 0))(
  ( (ValueCellFull!10753 (v!13846 V!34941)) (EmptyCell!10753) )
))
(declare-datatypes ((array!60965 0))(
  ( (array!60966 (arr!29345 (Array (_ BitVec 32) ValueCell!10753)) (size!29824 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60965)

(declare-fun mapDefault!35717 () ValueCell!10753)

