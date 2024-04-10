; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83708 () Bool)

(assert start!83708)

(declare-fun b!977482 () Bool)

(declare-fun e!551058 () Bool)

(declare-fun e!551060 () Bool)

(declare-fun mapRes!35795 () Bool)

(assert (=> b!977482 (= e!551058 (and e!551060 mapRes!35795))))

(declare-fun condMapEmpty!35795 () Bool)

(declare-datatypes ((V!34997 0))(
  ( (V!34998 (val!11306 Int)) )
))
(declare-datatypes ((ValueCell!10774 0))(
  ( (ValueCellFull!10774 (v!13868 V!34997)) (EmptyCell!10774) )
))
(declare-datatypes ((array!61055 0))(
  ( (array!61056 (arr!29385 (Array (_ BitVec 32) ValueCell!10774)) (size!29864 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61055)

(declare-fun mapDefault!35795 () ValueCell!10774)

