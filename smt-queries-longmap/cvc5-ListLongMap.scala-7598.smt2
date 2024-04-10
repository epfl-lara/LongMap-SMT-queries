; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95908 () Bool)

(assert start!95908)

(declare-fun b_free!22561 () Bool)

(declare-fun b_next!22561 () Bool)

(assert (=> start!95908 (= b_free!22561 (not b_next!22561))))

(declare-fun tp!79532 () Bool)

(declare-fun b_and!35797 () Bool)

(assert (=> start!95908 (= tp!79532 b_and!35797)))

(declare-fun b!1086073 () Bool)

(declare-fun e!620419 () Bool)

(declare-fun tp_is_empty!26563 () Bool)

(assert (=> b!1086073 (= e!620419 tp_is_empty!26563)))

(declare-fun mapIsEmpty!41599 () Bool)

(declare-fun mapRes!41599 () Bool)

(assert (=> mapIsEmpty!41599 mapRes!41599))

(declare-fun b!1086074 () Bool)

(declare-fun res!724178 () Bool)

(declare-fun e!620423 () Bool)

(assert (=> b!1086074 (=> (not res!724178) (not e!620423))))

(declare-datatypes ((array!70061 0))(
  ( (array!70062 (arr!33704 (Array (_ BitVec 32) (_ BitVec 64))) (size!34240 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70061)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70061 (_ BitVec 32)) Bool)

(assert (=> b!1086074 (= res!724178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086075 () Bool)

(declare-fun res!724181 () Bool)

(assert (=> b!1086075 (=> (not res!724181) (not e!620423))))

(declare-datatypes ((List!23506 0))(
  ( (Nil!23503) (Cons!23502 (h!24711 (_ BitVec 64)) (t!33125 List!23506)) )
))
(declare-fun arrayNoDuplicates!0 (array!70061 (_ BitVec 32) List!23506) Bool)

(assert (=> b!1086075 (= res!724181 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23503))))

(declare-fun b!1086076 () Bool)

(declare-fun res!724174 () Bool)

(assert (=> b!1086076 (=> (not res!724174) (not e!620423))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1086076 (= res!724174 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34240 _keys!1070))))))

(declare-fun b!1086077 () Bool)

(declare-fun e!620425 () Bool)

(assert (=> b!1086077 (= e!620425 (and e!620419 mapRes!41599))))

(declare-fun condMapEmpty!41599 () Bool)

(declare-datatypes ((V!40545 0))(
  ( (V!40546 (val!13338 Int)) )
))
(declare-datatypes ((ValueCell!12572 0))(
  ( (ValueCellFull!12572 (v!15959 V!40545)) (EmptyCell!12572) )
))
(declare-datatypes ((array!70063 0))(
  ( (array!70064 (arr!33705 (Array (_ BitVec 32) ValueCell!12572)) (size!34241 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70063)

(declare-fun mapDefault!41599 () ValueCell!12572)

