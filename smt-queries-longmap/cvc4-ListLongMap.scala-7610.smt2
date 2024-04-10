; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95984 () Bool)

(assert start!95984)

(declare-fun b_free!22637 () Bool)

(declare-fun b_next!22637 () Bool)

(assert (=> start!95984 (= b_free!22637 (not b_next!22637))))

(declare-fun tp!79759 () Bool)

(declare-fun b_and!35949 () Bool)

(assert (=> start!95984 (= tp!79759 b_and!35949)))

(declare-fun b!1087754 () Bool)

(declare-fun e!621332 () Bool)

(declare-fun e!621331 () Bool)

(assert (=> b!1087754 (= e!621332 e!621331)))

(declare-fun res!725440 () Bool)

(assert (=> b!1087754 (=> (not res!725440) (not e!621331))))

(declare-datatypes ((array!70203 0))(
  ( (array!70204 (arr!33775 (Array (_ BitVec 32) (_ BitVec 64))) (size!34311 (_ BitVec 32))) )
))
(declare-fun lt!484192 () array!70203)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70203 (_ BitVec 32)) Bool)

(assert (=> b!1087754 (= res!725440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484192 mask!1414))))

(declare-fun _keys!1070 () array!70203)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087754 (= lt!484192 (array!70204 (store (arr!33775 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34311 _keys!1070)))))

(declare-fun b!1087755 () Bool)

(declare-fun e!621335 () Bool)

(declare-fun e!621336 () Bool)

(declare-fun mapRes!41713 () Bool)

(assert (=> b!1087755 (= e!621335 (and e!621336 mapRes!41713))))

(declare-fun condMapEmpty!41713 () Bool)

(declare-datatypes ((V!40645 0))(
  ( (V!40646 (val!13376 Int)) )
))
(declare-datatypes ((ValueCell!12610 0))(
  ( (ValueCellFull!12610 (v!15997 V!40645)) (EmptyCell!12610) )
))
(declare-datatypes ((array!70205 0))(
  ( (array!70206 (arr!33776 (Array (_ BitVec 32) ValueCell!12610)) (size!34312 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70205)

(declare-fun mapDefault!41713 () ValueCell!12610)

