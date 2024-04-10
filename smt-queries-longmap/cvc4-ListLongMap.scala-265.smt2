; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4340 () Bool)

(assert start!4340)

(declare-fun b_free!1181 () Bool)

(declare-fun b_next!1181 () Bool)

(assert (=> start!4340 (= b_free!1181 (not b_next!1181))))

(declare-fun tp!4972 () Bool)

(declare-fun b_and!1997 () Bool)

(assert (=> start!4340 (= tp!4972 b_and!1997)))

(declare-fun b!33492 () Bool)

(declare-fun e!21268 () Bool)

(declare-fun e!21266 () Bool)

(declare-fun mapRes!1840 () Bool)

(assert (=> b!33492 (= e!21268 (and e!21266 mapRes!1840))))

(declare-fun condMapEmpty!1840 () Bool)

(declare-datatypes ((V!1871 0))(
  ( (V!1872 (val!794 Int)) )
))
(declare-datatypes ((ValueCell!568 0))(
  ( (ValueCellFull!568 (v!1886 V!1871)) (EmptyCell!568) )
))
(declare-datatypes ((array!2283 0))(
  ( (array!2284 (arr!1092 (Array (_ BitVec 32) ValueCell!568)) (size!1193 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2283)

(declare-fun mapDefault!1840 () ValueCell!568)

