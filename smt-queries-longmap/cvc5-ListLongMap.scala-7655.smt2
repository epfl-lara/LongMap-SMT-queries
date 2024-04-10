; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96250 () Bool)

(assert start!96250)

(declare-fun b_free!22903 () Bool)

(declare-fun b_next!22903 () Bool)

(assert (=> start!96250 (= b_free!22903 (not b_next!22903))))

(declare-fun tp!80557 () Bool)

(declare-fun b_and!36481 () Bool)

(assert (=> start!96250 (= tp!80557 b_and!36481)))

(declare-fun b!1093431 () Bool)

(declare-fun res!729653 () Bool)

(declare-fun e!624344 () Bool)

(assert (=> b!1093431 (=> (not res!729653) (not e!624344))))

(declare-datatypes ((array!70727 0))(
  ( (array!70728 (arr!34037 (Array (_ BitVec 32) (_ BitVec 64))) (size!34573 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70727)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70727 (_ BitVec 32)) Bool)

(assert (=> b!1093431 (= res!729653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093432 () Bool)

(declare-fun e!624340 () Bool)

(assert (=> b!1093432 (= e!624344 e!624340)))

(declare-fun res!729654 () Bool)

(assert (=> b!1093432 (=> (not res!729654) (not e!624340))))

(declare-fun lt!488997 () array!70727)

(assert (=> b!1093432 (= res!729654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488997 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093432 (= lt!488997 (array!70728 (store (arr!34037 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34573 _keys!1070)))))

(declare-fun b!1093433 () Bool)

(declare-fun res!729652 () Bool)

(assert (=> b!1093433 (=> (not res!729652) (not e!624344))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093433 (= res!729652 (validKeyInArray!0 k!904))))

(declare-fun mapIsEmpty!42112 () Bool)

(declare-fun mapRes!42112 () Bool)

(assert (=> mapIsEmpty!42112 mapRes!42112))

(declare-fun b!1093434 () Bool)

(declare-fun e!624342 () Bool)

(declare-fun tp_is_empty!26905 () Bool)

(assert (=> b!1093434 (= e!624342 tp_is_empty!26905)))

(declare-fun b!1093435 () Bool)

(declare-fun e!624339 () Bool)

(assert (=> b!1093435 (= e!624339 tp_is_empty!26905)))

(declare-fun b!1093436 () Bool)

(declare-fun e!624341 () Bool)

(assert (=> b!1093436 (= e!624341 (and e!624342 mapRes!42112))))

(declare-fun condMapEmpty!42112 () Bool)

(declare-datatypes ((V!41001 0))(
  ( (V!41002 (val!13509 Int)) )
))
(declare-datatypes ((ValueCell!12743 0))(
  ( (ValueCellFull!12743 (v!16130 V!41001)) (EmptyCell!12743) )
))
(declare-datatypes ((array!70729 0))(
  ( (array!70730 (arr!34038 (Array (_ BitVec 32) ValueCell!12743)) (size!34574 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70729)

(declare-fun mapDefault!42112 () ValueCell!12743)

