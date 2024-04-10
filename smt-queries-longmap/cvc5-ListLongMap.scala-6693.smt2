; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84130 () Bool)

(assert start!84130)

(declare-fun b!983662 () Bool)

(declare-fun e!554548 () Bool)

(declare-fun tp_is_empty!22933 () Bool)

(assert (=> b!983662 (= e!554548 tp_is_empty!22933)))

(declare-fun b!983663 () Bool)

(declare-fun e!554546 () Bool)

(declare-fun e!554547 () Bool)

(declare-fun mapRes!36428 () Bool)

(assert (=> b!983663 (= e!554546 (and e!554547 mapRes!36428))))

(declare-fun condMapEmpty!36428 () Bool)

(declare-datatypes ((V!35561 0))(
  ( (V!35562 (val!11517 Int)) )
))
(declare-datatypes ((ValueCell!10985 0))(
  ( (ValueCellFull!10985 (v!14079 V!35561)) (EmptyCell!10985) )
))
(declare-datatypes ((array!61851 0))(
  ( (array!61852 (arr!29783 (Array (_ BitVec 32) ValueCell!10985)) (size!30262 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61851)

(declare-fun mapDefault!36428 () ValueCell!10985)

