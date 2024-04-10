; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!634 () Bool)

(assert start!634)

(declare-fun b_free!107 () Bool)

(declare-fun b_next!107 () Bool)

(assert (=> start!634 (= b_free!107 (not b_next!107))))

(declare-fun tp!539 () Bool)

(declare-fun b_and!245 () Bool)

(assert (=> start!634 (= tp!539 b_and!245)))

(declare-fun b!4057 () Bool)

(declare-fun e!2102 () Bool)

(declare-fun e!2103 () Bool)

(declare-fun mapRes!236 () Bool)

(assert (=> b!4057 (= e!2102 (and e!2103 mapRes!236))))

(declare-fun condMapEmpty!236 () Bool)

(declare-datatypes ((V!423 0))(
  ( (V!424 (val!98 Int)) )
))
(declare-datatypes ((ValueCell!76 0))(
  ( (ValueCellFull!76 (v!1185 V!423)) (EmptyCell!76) )
))
(declare-datatypes ((array!303 0))(
  ( (array!304 (arr!144 (Array (_ BitVec 32) ValueCell!76)) (size!206 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!303)

(declare-fun mapDefault!236 () ValueCell!76)

